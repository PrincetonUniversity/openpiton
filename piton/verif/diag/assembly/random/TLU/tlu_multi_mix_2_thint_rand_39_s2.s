// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tlu_multi_mix_2_thint_rand_39_s2.s
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
   random seed:	888930064
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

	setx 0x0cc70405773d8fe8, %g1, %g0
	setx 0x9f0780ccbb4dd2aa, %g1, %g1
	setx 0x48c583ee348d1010, %g1, %g2
	setx 0x9d29fe581ccb335e, %g1, %g3
	setx 0x6ef6fa5e0731d1d8, %g1, %g4
	setx 0x9ea97d14aeb0a4e3, %g1, %g5
	setx 0x8621fec8e7d6175a, %g1, %g6
	setx 0x6536a4ad622aae3a, %g1, %g7
	setx 0x7251cd73c7e0c30b, %g1, %r16
	setx 0x338bede3fb56fad7, %g1, %r17
	setx 0x41288a4ea8f42e27, %g1, %r18
	setx 0xc49b2feb8485e3c5, %g1, %r19
	setx 0x29bc5994f296a655, %g1, %r20
	setx 0x0c3f4be0f783b55b, %g1, %r21
	setx 0x970fd2ed434fe60c, %g1, %r22
	setx 0x1489db692c661129, %g1, %r23
	setx 0x316385eff965bf47, %g1, %r24
	setx 0xc78ba1e377b096b7, %g1, %r25
	setx 0x71cf62c45861fbc4, %g1, %r26
	setx 0xffc19dec4efb94ca, %g1, %r27
	setx 0x2561cb48f74f1327, %g1, %r28
	setx 0x85aa827ed6f524a0, %g1, %r29
	setx 0xa0ce0e4dde47d094, %g1, %r30
	setx 0x3255dd897a87229b, %g1, %r31
	save
	setx 0xd4e4e924ad36b756, %g1, %r16
	setx 0xf52ce9b8b1d6b1f1, %g1, %r17
	setx 0xa9cceeb6b285e515, %g1, %r18
	setx 0x31b9e3e671768136, %g1, %r19
	setx 0xdf866ee220a5269e, %g1, %r20
	setx 0xb76ce628f096c3e5, %g1, %r21
	setx 0xa9b917765cf3d421, %g1, %r22
	setx 0x03bc4f12dbbbeaf7, %g1, %r23
	setx 0x01be527c72bfa1a2, %g1, %r24
	setx 0xb18e142373aff23f, %g1, %r25
	setx 0x490159fe23870c75, %g1, %r26
	setx 0xbcda6c0a2cc6e0c4, %g1, %r27
	setx 0x644688384913dd52, %g1, %r28
	setx 0xa3f996557b58eef8, %g1, %r29
	setx 0x3ab8090c989e1dec, %g1, %r30
	setx 0xb71dc4b3da7b0436, %g1, %r31
	save
	setx 0x74ab5e18145a1d6d, %g1, %r16
	setx 0x72338a359450db3b, %g1, %r17
	setx 0xe0d9d03ad2f1dc87, %g1, %r18
	setx 0x518811ac0ba7566a, %g1, %r19
	setx 0xbfb355451d97e232, %g1, %r20
	setx 0xd84d34fa03059989, %g1, %r21
	setx 0xc021aaeb97ae08cb, %g1, %r22
	setx 0xb6d6a941b6affc69, %g1, %r23
	setx 0x9244d7cf7b70e239, %g1, %r24
	setx 0x6beb5f28a5664d9e, %g1, %r25
	setx 0x327db8b3ce81dc0f, %g1, %r26
	setx 0xe0e64bc26ac28e57, %g1, %r27
	setx 0xd437597da64824a0, %g1, %r28
	setx 0xeedf5f624ace81c5, %g1, %r29
	setx 0xc2e355be1fcdf7cb, %g1, %r30
	setx 0x792eeccf109835d7, %g1, %r31
	save
	setx 0x9bed82b6a1faae09, %g1, %r16
	setx 0xcd3bb72cb4044dd3, %g1, %r17
	setx 0x8bea2441ed6f548f, %g1, %r18
	setx 0xb8e846d3d3495b65, %g1, %r19
	setx 0x53a0982267c1c69c, %g1, %r20
	setx 0x4df1069d7bf4d2e2, %g1, %r21
	setx 0xd52eca9ca86bfaf2, %g1, %r22
	setx 0x2e7ce749da574c0e, %g1, %r23
	setx 0x15f6e6e6a08c8a01, %g1, %r24
	setx 0x7188f18373a69d1a, %g1, %r25
	setx 0x4576d87eb8727344, %g1, %r26
	setx 0x5c578cd331a2173e, %g1, %r27
	setx 0xee69fcac86d001ee, %g1, %r28
	setx 0xcd2cc2eb50ba5bae, %g1, %r29
	setx 0x203de05a6a179282, %g1, %r30
	setx 0x3f580f6814d23f19, %g1, %r31
	save
	setx 0xb81f13af0bdf0f56, %g1, %r16
	setx 0x63594a336fab8b6a, %g1, %r17
	setx 0xeb438bad4ae46dce, %g1, %r18
	setx 0xb560347b87c2dd15, %g1, %r19
	setx 0xa141e12c2307ea9d, %g1, %r20
	setx 0x3665278ed6882b86, %g1, %r21
	setx 0xc36c1918b317c5db, %g1, %r22
	setx 0x4777965ba0ea989c, %g1, %r23
	setx 0xdeda4d9ac7f7628a, %g1, %r24
	setx 0x8024cf893b089ca2, %g1, %r25
	setx 0x11387ea63afa72aa, %g1, %r26
	setx 0x6d21307f187c32e0, %g1, %r27
	setx 0x489e5888db49e6f9, %g1, %r28
	setx 0x4899aa2a738acc22, %g1, %r29
	setx 0xe8d3b576656b77ac, %g1, %r30
	setx 0x0068fb46e45f677a, %g1, %r31
	save
	setx 0x9c43af65baf099ea, %g1, %r16
	setx 0x8b428d4345badaa2, %g1, %r17
	setx 0xfd434f8c70fdde24, %g1, %r18
	setx 0x4b2543bff587aba7, %g1, %r19
	setx 0xaa2d9ff717e57055, %g1, %r20
	setx 0x56cdb910eb0d98f1, %g1, %r21
	setx 0x8a1c7662f2c141d8, %g1, %r22
	setx 0xab06f6abafce4979, %g1, %r23
	setx 0xe8873dc1796c7122, %g1, %r24
	setx 0x017b7c0cb3b62ef8, %g1, %r25
	setx 0x0969d8863bcd00cb, %g1, %r26
	setx 0x759e43903f714191, %g1, %r27
	setx 0xef1af5e58a771171, %g1, %r28
	setx 0x6876a5a9ea921929, %g1, %r29
	setx 0xff60089e6b1c2ec0, %g1, %r30
	setx 0x179a0f5526bad872, %g1, %r31
	save
	setx 0x2623301c708c165a, %g1, %r16
	setx 0x1d86ddd18a07c36b, %g1, %r17
	setx 0xf2428cff082f5bf8, %g1, %r18
	setx 0x6502748adb5b2536, %g1, %r19
	setx 0x2b7a7dcb197c2eea, %g1, %r20
	setx 0x79978c7ab2ea1943, %g1, %r21
	setx 0xc9d84f3168e95444, %g1, %r22
	setx 0x13825b75a2887541, %g1, %r23
	setx 0x33ad261f4043a5ed, %g1, %r24
	setx 0xb00f5e728f60b818, %g1, %r25
	setx 0x9e369fea2678f134, %g1, %r26
	setx 0xcda12ccf39d91faa, %g1, %r27
	setx 0x3139ebba9feb99f5, %g1, %r28
	setx 0x572308f3a1f1db6b, %g1, %r29
	setx 0x3848f37825a7d4ca, %g1, %r30
	setx 0xb07daae803a2cba8, %g1, %r31
	save
	setx 0xbdf513db53d7998a, %g1, %r16
	setx 0x4f7160def1b2afdd, %g1, %r17
	setx 0x706714bec1d299a0, %g1, %r18
	setx 0x0f267efeec8eeb5e, %g1, %r19
	setx 0x3029ea44e5b24c30, %g1, %r20
	setx 0xdd43d7b4f924fc89, %g1, %r21
	setx 0xa86651983b808a03, %g1, %r22
	setx 0x6bd2c9045f529340, %g1, %r23
	setx 0xed53406abc06fd68, %g1, %r24
	setx 0x04af0f1a6d0ac1f0, %g1, %r25
	setx 0x6fd2c407101a9274, %g1, %r26
	setx 0x405b4bb965eb451e, %g1, %r27
	setx 0x1e053e34db2df70a, %g1, %r28
	setx 0x8dec123c5fe13cc4, %g1, %r29
	setx 0xe61f045cb7f81c10, %g1, %r30
	setx 0x7fc6a291ea334c3d, %g1, %r31
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
	.word 0xb3e420d5  ! 1: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb1e46069  ! 7: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb9e5e18c  ! 8: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb005a0f4  ! 10: ADD_I	add 	%r22, 0x00f4, %r24
	.word 0xbbe4e04d  ! 14: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xbde5a1bb  ! 18: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb1e46108  ! 21: SAVE_I	save	%r17, 0x0001, %r24
	.word 0x8594a142  ! 25: WRPR_TSTATE_I	wrpr	%r18, 0x0142, %tstate
	.word 0xb1e4206a  ! 29: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xbfe4e129  ! 30: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb77d8400  ! 31: MOVR_R	movre	%r22, %r0, %r27
	setx	0x10236, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9e521a8  ! 35: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xbde4a1a3  ! 38: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xbde561b9  ! 40: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb5540000  ! 43: RDPR_GL	<illegal instruction>
	.word 0xb5510000  ! 46: RDPR_TICK	<illegal instruction>
	mov	1, %r12
	.word 0x8f932000  ! 47: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb7e5a084  ! 49: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb5e4e0ed  ! 58: SAVE_I	save	%r19, 0x0001, %r26
	.word 0x879560ae  ! 60: WRPR_TT_I	wrpr	%r21, 0x00ae, %tt
	.word 0xb5e5218c  ! 61: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb1643801  ! 63: MOVcc_I	<illegal instruction>
	.word 0xb8b460a4  ! 67: ORNcc_I	orncc 	%r17, 0x00a4, %r28
	.word 0xb5e4a199  ! 70: SAVE_I	save	%r18, 0x0001, %r26
	ta	T_CHANGE_HPRIV
	.word 0x81982f81  ! 72: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f81, %hpstate
	setx	data_start_6, %g1, %r18
	.word 0xbfe4e0ac  ! 79: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb3e52097  ! 80: SAVE_I	save	%r20, 0x0001, %r25
	setx	0x20232, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x1010b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x2010a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde420e3  ! 89: SAVE_I	save	%r16, 0x0001, %r30
	.word 0x919461d4  ! 90: WRPR_PIL_I	wrpr	%r17, 0x01d4, %pil
	.word 0xbde4610e  ! 92: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbfe5e099  ! 93: SAVE_I	save	%r23, 0x0001, %r31
	setx	0x20301, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe5e099  ! 97: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb3e46159  ! 98: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbb3c3001  ! 100: SRAX_I	srax	%r16, 0x0001, %r29
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbf50c000  ! 102: RDPR_TT	<illegal instruction>
	.word 0x859460a5  ! 106: WRPR_TSTATE_I	wrpr	%r17, 0x00a5, %tstate
	.word 0x899461e4  ! 107: WRPR_TICK_I	wrpr	%r17, 0x01e4, %tick
	.word 0xbbe5e1c8  ! 111: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb3e4e12d  ! 112: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xbabce17f  ! 113: XNORcc_I	xnorcc 	%r19, 0x017f, %r29
	.word 0xb2b5e1d9  ! 115: SUBCcc_I	orncc 	%r23, 0x01d9, %r25
	.word 0xb3e42104  ! 117: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb63c8000  ! 118: XNOR_R	xnor 	%r18, %r0, %r27
	mov	2, %r12
	.word 0x8f932000  ! 119: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0x8795a02d  ! 123: WRPR_TT_I	wrpr	%r22, 0x002d, %tt
	.word 0xbf7cc400  ! 124: MOVR_R	movre	%r19, %r0, %r31
	.word 0xbde4e0c0  ! 129: SAVE_I	save	%r19, 0x0001, %r30
	setx	0x2030d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe5e0db  ! 134: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb6942034  ! 135: ORcc_I	orcc 	%r16, 0x0034, %r27
	.word 0xbb500000  ! 137: RDPR_TPC	<illegal instruction>
	.word 0xbfe5a1d3  ! 138: SAVE_I	save	%r22, 0x0001, %r31
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb551c000  ! 142: RDPR_TL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	0x10116, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5508000  ! 151: RDPR_TSTATE	<illegal instruction>
	.word 0xb5e5e016  ! 153: SAVE_I	save	%r23, 0x0001, %r26
	.word 0x85952138  ! 154: WRPR_TSTATE_I	wrpr	%r20, 0x0138, %tstate
	.word 0xb93db001  ! 155: SRAX_I	srax	%r22, 0x0001, %r28
	.word 0xb1e420b8  ! 156: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb13c7001  ! 159: SRAX_I	srax	%r17, 0x0001, %r24
	ta	T_CHANGE_HPRIV
	.word 0x81983f91  ! 161: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f91, %hpstate
	.word 0xbf500000  ! 163: RDPR_TPC	<illegal instruction>
	.word 0xb1e52050  ! 165: SAVE_I	save	%r20, 0x0001, %r24
	.word 0x819421d0  ! 175: WRPR_TPC_I	wrpr	%r16, 0x01d0, %tpc
	.word 0xb5e46128  ! 176: SAVE_I	save	%r17, 0x0001, %r26
	setx	data_start_1, %g1, %r21
	.word 0xb3e520c3  ! 180: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb750c000  ! 182: RDPR_TT	<illegal instruction>
	.word 0xbb508000  ! 187: RDPR_TSTATE	<illegal instruction>
	.word 0xbbe52013  ! 188: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xbbe5e1d3  ! 189: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb9e521d6  ! 191: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb13cb001  ! 193: SRAX_I	srax	%r18, 0x0001, %r24
	.word 0xb9e4604f  ! 195: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb3e4a037  ! 201: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb7641800  ! 204: MOVcc_R	<illegal instruction>
	.word 0xb5e461ce  ! 206: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb9e561b3  ! 214: SAVE_I	save	%r21, 0x0001, %r28
	setx	0x1022a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3520000  ! 217: RDPR_PIL	<illegal instruction>
	.word 0x8595a039  ! 218: WRPR_TSTATE_I	wrpr	%r22, 0x0039, %tstate
	.word 0x89942089  ! 219: WRPR_TICK_I	wrpr	%r16, 0x0089, %tick
	.word 0xbd51c000  ! 222: RDPR_TL	<illegal instruction>
	.word 0xbfe42045  ! 223: SAVE_I	save	%r16, 0x0001, %r31
	setx	0x30122, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3504000  ! 226: RDPR_TNPC	<illegal instruction>
	mov	2, %r12
	.word 0x8f932000  ! 231: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	data_start_5, %g1, %r16
	setx	0x1001c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe4603a  ! 244: SAVE_I	save	%r17, 0x0001, %r29
	setx	0x202, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e52030  ! 247: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xbd7d0400  ! 248: MOVR_R	movre	%r20, %r0, %r30
	.word 0x89956057  ! 249: WRPR_TICK_I	wrpr	%r21, 0x0057, %tick
	.word 0xb3e521a9  ! 250: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xbd51c000  ! 252: RDPR_TL	<illegal instruction>
	.word 0xb804e0be  ! 255: ADD_I	add 	%r19, 0x00be, %r28
	.word 0xb9540000  ! 256: RDPR_GL	<illegal instruction>
	setx	0x30311, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e461e0  ! 262: SAVE_I	save	%r17, 0x0001, %r26
	.word 0x8594e05d  ! 266: WRPR_TSTATE_I	wrpr	%r19, 0x005d, %tstate
	.word 0xb751c000  ! 267: RDPR_TL	<illegal instruction>
	.word 0xbde420bf  ! 269: SAVE_I	save	%r16, 0x0001, %r30
	.word 0x8995a117  ! 271: WRPR_TICK_I	wrpr	%r22, 0x0117, %tick
	.word 0xbf518000  ! 277: RDPR_PSTATE	<illegal instruction>
	.word 0xb5e4a1fb  ! 278: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xbbe46185  ! 282: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xbbe5e084  ! 284: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb5e420f8  ! 287: SAVE_I	save	%r16, 0x0001, %r26
	setx	data_start_3, %g1, %r17
	.word 0x8195e0fb  ! 289: WRPR_TPC_I	wrpr	%r23, 0x00fb, %tpc
	setx	data_start_5, %g1, %r16
	.word 0xb5e4608f  ! 295: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb3e5e121  ! 296: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb1e5a052  ! 297: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb3e521ce  ! 298: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb7e42135  ! 302: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xbd50c000  ! 311: RDPR_TT	<illegal instruction>
	.word 0xbbe421ff  ! 313: SAVE_I	save	%r16, 0x0001, %r29
	setx	data_start_7, %g1, %r17
	.word 0x859560c7  ! 323: WRPR_TSTATE_I	wrpr	%r21, 0x00c7, %tstate
	.word 0xb1e4a0d0  ! 328: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xbd510000  ! 329: RDPR_TICK	<illegal instruction>
	.word 0xbde4e077  ! 338: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb5e5a176  ! 339: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xbde4e086  ! 340: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb28dc000  ! 341: ANDcc_R	andcc 	%r23, %r0, %r25
	.word 0x8594e1a1  ! 349: WRPR_TSTATE_I	wrpr	%r19, 0x01a1, %tstate
	.word 0xb9e5e089  ! 350: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xbde5e102  ! 355: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb4bd618a  ! 356: XNORcc_I	xnorcc 	%r21, 0x018a, %r26
	.word 0xb1e560c8  ! 359: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb9e4a097  ! 363: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xbbe5610f  ! 365: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb015e1df  ! 366: OR_I	or 	%r23, 0x01df, %r24
	.word 0xb3540000  ! 369: RDPR_GL	<illegal instruction>
	.word 0xbfe5e0b4  ! 372: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb9e5e101  ! 373: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb1e4e015  ! 376: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb9e461c2  ! 379: SAVE_I	save	%r17, 0x0001, %r28
	setx	0x2f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e561cb  ! 381: SAVE_I	save	%r21, 0x0001, %r27
	mov	1, %r14
	.word 0xa193a000  ! 383: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbb510000  ! 385: RDPR_TICK	<illegal instruction>
	.word 0x8d95e158  ! 387: WRPR_PSTATE_I	wrpr	%r23, 0x0158, %pstate
	.word 0xb22c4000  ! 389: ANDN_R	andn 	%r17, %r0, %r25
	.word 0xb5e4615d  ! 391: SAVE_I	save	%r17, 0x0001, %r26
	.word 0x8995e167  ! 392: WRPR_TICK_I	wrpr	%r23, 0x0167, %tick
	setx	0x1021e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe4a0f4  ! 398: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb895e1dd  ! 400: ORcc_I	orcc 	%r23, 0x01dd, %r28
	.word 0xb1e560f8  ! 404: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb7e561b8  ! 406: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb5e5a160  ! 408: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xbde42155  ! 409: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb9e5e0ad  ! 410: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb5e5a059  ! 412: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xbbe5a0b2  ! 413: SAVE_I	save	%r22, 0x0001, %r29
	.word 0x8d94a094  ! 415: WRPR_PSTATE_I	wrpr	%r18, 0x0094, %pstate
	setx	0x20215, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20219, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe560b0  ! 420: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xbbe561c2  ! 422: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb1e5e07e  ! 425: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb9e420ac  ! 426: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xbfe4a12e  ! 428: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb7e4a168  ! 435: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xbde460fd  ! 436: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbf540000  ! 437: RDPR_GL	<illegal instruction>
	.word 0xbbe5a159  ! 438: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb1e52103  ! 440: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb5e46180  ! 441: SAVE_I	save	%r17, 0x0001, %r26
	setx	0x20112, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9e5a0a0  ! 450: SAVE_I	save	%r22, 0x0001, %r28
	.word 0x8d952048  ! 451: WRPR_PSTATE_I	wrpr	%r20, 0x0048, %pstate
	.word 0xbfe561e5  ! 457: SAVE_I	save	%r21, 0x0001, %r31
	mov	0, %r12
	.word 0x8f932000  ! 460: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb751c000  ! 463: RDPR_TL	<illegal instruction>
	setx	0x21c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81982f53  ! 469: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f53, %hpstate
	setx	0x6, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81982a41  ! 471: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a41, %hpstate
	.word 0xbde5e001  ! 474: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xbd508000  ! 475: RDPR_TSTATE	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0x83956000  ! 477: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	.word 0xb9e4e1db  ! 478: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xbb51c000  ! 479: RDPR_TL	<illegal instruction>
	setx	0x23a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8394a143  ! 482: WRPR_TNPC_I	wrpr	%r18, 0x0143, %tnpc
	ta	T_CHANGE_HPRIV
	.word 0x81983a1b  ! 483: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a1b, %hpstate
	.word 0xb1540000  ! 485: RDPR_GL	<illegal instruction>
	.word 0xb7e461f4  ! 488: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xbbe520a5  ! 489: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xbfe5a0b7  ! 490: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb7e4a1c8  ! 493: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xba8c6010  ! 496: ANDcc_I	andcc 	%r17, 0x0010, %r29
	.word 0xb9e5e114  ! 498: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb5e4a076  ! 500: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xbb7c6401  ! 501: MOVR_I	movre	%r17, 0x1, %r29
	.word 0xb1510000  ! 503: RDPR_TICK	<illegal instruction>
	.word 0xb7e4e05f  ! 505: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xbb480000  ! 509: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	setx	data_start_3, %g1, %r17
	.word 0xb5e5609d  ! 515: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb1e5e08a  ! 523: SAVE_I	save	%r23, 0x0001, %r24
	.word 0x85956078  ! 525: WRPR_TSTATE_I	wrpr	%r21, 0x0078, %tstate
	.word 0xb3e521b5  ! 531: SAVE_I	save	%r20, 0x0001, %r25
	setx	0x6, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e4a09c  ! 538: SAVE_I	save	%r18, 0x0001, %r24
	setx	data_start_3, %g1, %r19
	.word 0xb1e5215c  ! 545: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xbbe461a4  ! 546: SAVE_I	save	%r17, 0x0001, %r29
	setx	0x30306, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x899561c5  ! 551: WRPR_TICK_I	wrpr	%r21, 0x01c5, %tick
	.word 0xb2958000  ! 552: ORcc_R	orcc 	%r22, %r0, %r25
	.word 0xbbe4e182  ! 553: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xbd50c000  ! 556: RDPR_TT	<illegal instruction>
	.word 0xb5520000  ! 559: RDPR_PIL	<illegal instruction>
	.word 0xbfe5e16c  ! 560: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb6040000  ! 562: ADD_R	add 	%r16, %r0, %r27
	.word 0xb351c000  ! 564: RDPR_TL	<illegal instruction>
	.word 0xb5e46163  ! 565: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xbde521f5  ! 567: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb1e5619a  ! 569: SAVE_I	save	%r21, 0x0001, %r24
	.word 0x8194a107  ! 572: WRPR_TPC_I	wrpr	%r18, 0x0107, %tpc
	.word 0xb7e4e04e  ! 573: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xbde5a17e  ! 575: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xbbe520a7  ! 577: SAVE_I	save	%r20, 0x0001, %r29
	.word 0x8194e1f8  ! 580: WRPR_TPC_I	wrpr	%r19, 0x01f8, %tpc
	.word 0xb5e46184  ! 581: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb9e5616c  ! 585: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb5e4a195  ! 589: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb5e4e10d  ! 591: SAVE_I	save	%r19, 0x0001, %r26
	.word 0x9195214c  ! 592: WRPR_PIL_I	wrpr	%r20, 0x014c, %pil
	.word 0xb5e460f5  ! 593: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb9e5e0b0  ! 594: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xbfe4a03b  ! 596: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb7e420f1  ! 598: SAVE_I	save	%r16, 0x0001, %r27
	setx	0x2002b, %g1, %o0
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
	.word 0xbde52199  ! 605: SAVE_I	save	%r20, 0x0001, %r30
	setx	data_start_5, %g1, %r19
	.word 0xbf508000  ! 607: RDPR_TSTATE	<illegal instruction>
	setx	0x21f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb540000  ! 611: RDPR_GL	<illegal instruction>
	setx	0x10235, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1510000  ! 618: RDPR_TICK	<illegal instruction>
	setx	data_start_7, %g1, %r16
	.word 0xb5e561a0  ! 620: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xbde5e083  ! 622: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xba058000  ! 623: ADD_R	add 	%r22, %r0, %r29
	.word 0xbbe5601f  ! 626: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb9e460b0  ! 630: SAVE_I	save	%r17, 0x0001, %r28
	.word 0x8394e1ef  ! 633: WRPR_TNPC_I	wrpr	%r19, 0x01ef, %tnpc
	.word 0xbfe4e0b5  ! 635: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb9e4a070  ! 637: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xbde4e002  ! 638: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb1e5a098  ! 640: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xbde4e122  ! 641: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xbbe420bc  ! 642: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xbfe4a180  ! 644: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb1e4611a  ! 645: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xbf508000  ! 646: RDPR_TSTATE	<illegal instruction>
	.word 0xb3520000  ! 651: RDPR_PIL	<illegal instruction>
	.word 0xbbe4e00c  ! 654: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb7e461ed  ! 659: SAVE_I	save	%r17, 0x0001, %r27
	setx	0x20334, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1508000  ! 661: RDPR_TSTATE	<illegal instruction>
	.word 0xb32d0000  ! 663: SLL_R	sll 	%r20, %r0, %r25
	.word 0xb9e5a075  ! 666: SAVE_I	save	%r22, 0x0001, %r28
	setx	0x21c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x819838c3  ! 670: WRHPR_HPSTATE_I	wrhpr	%r0, 0x18c3, %hpstate
	.word 0xb7e4604b  ! 674: SAVE_I	save	%r17, 0x0001, %r27
	setx	data_start_4, %g1, %r18
	.word 0xbbe4607f  ! 677: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xbfe4e0b3  ! 679: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb3e461f5  ! 680: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbfe4a164  ! 682: SAVE_I	save	%r18, 0x0001, %r31
	setx	0x3031e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7480000  ! 691: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0x8195602b  ! 692: WRPR_TPC_I	wrpr	%r21, 0x002b, %tpc
	.word 0xb5e461e3  ! 694: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xbbe4214d  ! 696: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xbd510000  ! 700: RDPR_TICK	<illegal instruction>
	.word 0xb92cd000  ! 701: SLLX_R	sllx	%r19, %r0, %r28
	.word 0xb9e4a0d0  ! 702: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb3e5a19c  ! 705: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xbde4a101  ! 706: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xbf480000  ! 707: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xb3504000  ! 711: RDPR_TNPC	<illegal instruction>
	mov	1, %r14
	.word 0xa193a000  ! 715: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb1518000  ! 716: RDPR_PSTATE	<illegal instruction>
	.word 0xb414206a  ! 717: OR_I	or 	%r16, 0x006a, %r26
	.word 0xb8a54000  ! 720: SUBcc_R	subcc 	%r21, %r0, %r28
	.word 0xbfe521aa  ! 721: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xbfe56186  ! 727: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb7518000  ! 728: RDPR_PSTATE	<illegal instruction>
	setx	data_start_4, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	.word 0x81982ac3  ! 734: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ac3, %hpstate
	.word 0xbde5e0a8  ! 736: SAVE_I	save	%r23, 0x0001, %r30
	.word 0x8194a1bd  ! 738: WRPR_TPC_I	wrpr	%r18, 0x01bd, %tpc
	.word 0xb1e420da  ! 741: SAVE_I	save	%r16, 0x0001, %r24
	.word 0x9194a023  ! 745: WRPR_PIL_I	wrpr	%r18, 0x0023, %pil
	.word 0xbf7c2401  ! 746: MOVR_I	movre	%r16, 0x1, %r31
	.word 0xbde42085  ! 749: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xbd3d7001  ! 750: SRAX_I	srax	%r21, 0x0001, %r30
	.word 0xb5e4a02f  ! 751: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb3e5608c  ! 752: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xbfe421e7  ! 755: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xbc14a16c  ! 757: OR_I	or 	%r18, 0x016c, %r30
	.word 0xbde46093  ! 758: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb225a18e  ! 761: SUB_I	sub 	%r22, 0x018e, %r25
	.word 0xbde5e15b  ! 762: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xbe14e0cb  ! 766: OR_I	or 	%r19, 0x00cb, %r31
	setx	data_start_5, %g1, %r20
	setx	0x2000a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9e56173  ! 769: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xbfe4207f  ! 770: SAVE_I	save	%r16, 0x0001, %r31
	setx	data_start_4, %g1, %r22
	setx	data_start_3, %g1, %r21
	.word 0xb7e4e04c  ! 779: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xbf504000  ! 780: RDPR_TNPC	<illegal instruction>
	setx	0x21, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3504000  ! 784: RDPR_TNPC	<illegal instruction>
	.word 0xb6948000  ! 785: ORcc_R	orcc 	%r18, %r0, %r27
	.word 0xbde46109  ! 786: SAVE_I	save	%r17, 0x0001, %r30
	.word 0x8d95e150  ! 787: WRPR_PSTATE_I	wrpr	%r23, 0x0150, %pstate
	.word 0xb1e4a0fb  ! 788: SAVE_I	save	%r18, 0x0001, %r24
	.word 0x9194e1f9  ! 792: WRPR_PIL_I	wrpr	%r19, 0x01f9, %pil
	.word 0xb7e52132  ! 793: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb5e4a10d  ! 796: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb33df001  ! 798: SRAX_I	srax	%r23, 0x0001, %r25
	.word 0xb9e4e16d  ! 800: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb7e5a141  ! 801: SAVE_I	save	%r22, 0x0001, %r27
	setx	0x2012d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e4608f  ! 804: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb5e52031  ! 809: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xbf520000  ! 810: RDPR_PIL	<illegal instruction>
	.word 0x8d95200c  ! 811: WRPR_PSTATE_I	wrpr	%r20, 0x000c, %pstate
	.word 0x8395a125  ! 812: WRPR_TNPC_I	wrpr	%r22, 0x0125, %tnpc
	.word 0xb3e4a137  ! 813: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb1e5a183  ! 814: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb9504000  ! 816: RDPR_TNPC	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81982859  ! 821: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0859, %hpstate
	.word 0x859461e3  ! 822: WRPR_TSTATE_I	wrpr	%r17, 0x01e3, %tstate
	setx	0x10011, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde4a151  ! 824: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb3500000  ! 825: RDPR_TPC	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81982f43  ! 827: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f43, %hpstate
	.word 0xbd51c000  ! 829: RDPR_TL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb7e5a007  ! 832: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xbfe561fc  ! 835: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb1e56029  ! 840: SAVE_I	save	%r21, 0x0001, %r24
	mov	1, %r12
	.word 0x8f932000  ! 845: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb9641800  ! 848: MOVcc_R	<illegal instruction>
	.word 0xb62de138  ! 851: ANDN_I	andn 	%r23, 0x0138, %r27
	.word 0xbfe5a18a  ! 854: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb7520000  ! 855: RDPR_PIL	<illegal instruction>
	.word 0x9194215b  ! 858: WRPR_PIL_I	wrpr	%r16, 0x015b, %pil
	.word 0xbde421f0  ! 859: SAVE_I	save	%r16, 0x0001, %r30
	.word 0x8995a1f6  ! 861: WRPR_TICK_I	wrpr	%r22, 0x01f6, %tick
	.word 0xbf518000  ! 866: RDPR_PSTATE	<illegal instruction>
	.word 0x9194e0d8  ! 867: WRPR_PIL_I	wrpr	%r19, 0x00d8, %pil
	.word 0xb3e5e1dc  ! 868: SAVE_I	save	%r23, 0x0001, %r25
	.word 0x879460c4  ! 871: WRPR_TT_I	wrpr	%r17, 0x00c4, %tt
	mov	0, %r14
	.word 0xa193a000  ! 873: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb1e461f1  ! 879: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xbb480000  ! 883: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xb750c000  ! 884: RDPR_TT	<illegal instruction>
	.word 0xbc250000  ! 885: SUB_R	sub 	%r20, %r0, %r30
	.word 0xb0b4c000  ! 890: ORNcc_R	orncc 	%r19, %r0, %r24
	.word 0xb1e42087  ! 891: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb9e5e054  ! 899: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb3510000  ! 900: RDPR_TICK	<illegal instruction>
	.word 0xb9e42002  ! 901: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb1e5619a  ! 902: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb5e46017  ! 903: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb9e5e153  ! 906: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xbbe5608a  ! 909: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb1e461bc  ! 911: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb7e561d7  ! 915: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb3e4e1ea  ! 916: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb3e46159  ! 922: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb53c7001  ! 924: SRAX_I	srax	%r17, 0x0001, %r26
	.word 0xb1e5205a  ! 925: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb3e4e00e  ! 928: SAVE_I	save	%r19, 0x0001, %r25
	.word 0x8594a11d  ! 929: WRPR_TSTATE_I	wrpr	%r18, 0x011d, %tstate
	setx	0x1010c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xba240000  ! 933: SUB_R	sub 	%r16, %r0, %r29
	ta	T_CHANGE_HPRIV
	.word 0x81982901  ! 935: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0901, %hpstate
	.word 0xb550c000  ! 938: RDPR_TT	<illegal instruction>
	.word 0xb22da1f1  ! 939: ANDN_I	andn 	%r22, 0x01f1, %r25
	setx	0x2031e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e560bb  ! 943: SAVE_I	save	%r21, 0x0001, %r24
	setx	0x20336, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x83942128  ! 947: WRPR_TNPC_I	wrpr	%r16, 0x0128, %tnpc
	setx	0xd, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r16
	.word 0xb3e5a143  ! 953: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb1e4a103  ! 955: SAVE_I	save	%r18, 0x0001, %r24
	setx	0x20205, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe4a117  ! 957: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb3e46042  ! 960: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbb540000  ! 961: RDPR_GL	<illegal instruction>
	.word 0x8595e1eb  ! 963: WRPR_TSTATE_I	wrpr	%r23, 0x01eb, %tstate
	.word 0xb5e5a1c0  ! 967: SAVE_I	save	%r22, 0x0001, %r26
	ta	T_CHANGE_HPRIV
	.word 0x81983a01  ! 968: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a01, %hpstate
	.word 0xb1e5a0fa  ! 971: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xbde5e0df  ! 975: SAVE_I	save	%r23, 0x0001, %r30
	.word 0x839520c0  ! 977: WRPR_TNPC_I	wrpr	%r20, 0x00c0, %tnpc
	setx	0x31, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb69c8000  ! 985: XORcc_R	xorcc 	%r18, %r0, %r27
	.word 0xb0340000  ! 986: SUBC_R	orn 	%r16, %r0, %r24
	.word 0xb1e5a180  ! 987: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xbde4e098  ! 988: SAVE_I	save	%r19, 0x0001, %r30
	ta	T_CHANGE_HPRIV
	.word 0x81983c53  ! 989: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c53, %hpstate
	.word 0x8795e137  ! 994: WRPR_TT_I	wrpr	%r23, 0x0137, %tt
	.word 0xbc15a00f  ! 995: OR_I	or 	%r22, 0x000f, %r30
	setx	0x306, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x839461e6  ! 1002: WRPR_TNPC_I	wrpr	%r17, 0x01e6, %tnpc
	.word 0xb9e5e1da  ! 1004: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xbfe4e10b  ! 1006: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb3e5614a  ! 1007: SAVE_I	save	%r21, 0x0001, %r25
	setx	data_start_5, %g1, %r16
	.word 0xbc246178  ! 1011: SUB_I	sub 	%r17, 0x0178, %r30
	.word 0xbbe5e181  ! 1018: SAVE_I	save	%r23, 0x0001, %r29
	setx	0x134, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e46048  ! 1022: SAVE_I	save	%r17, 0x0001, %r24
	.word 0x8d94a1ba  ! 1023: WRPR_PSTATE_I	wrpr	%r18, 0x01ba, %pstate
	.word 0xb3500000  ! 1024: RDPR_TPC	<illegal instruction>
	setx	0x2000a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe5e104  ! 1028: SAVE_I	save	%r23, 0x0001, %r29
	setx	0x30120, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8594e0c5  ! 1034: WRPR_TSTATE_I	wrpr	%r19, 0x00c5, %tstate
	.word 0xbb520000  ! 1035: RDPR_PIL	<illegal instruction>
	.word 0xbbe4a17f  ! 1037: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xbde4e0ea  ! 1040: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb2a40000  ! 1044: SUBcc_R	subcc 	%r16, %r0, %r25
	.word 0xb895c000  ! 1047: ORcc_R	orcc 	%r23, %r0, %r28
	setx	0x3023d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe520c9  ! 1049: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xbfe4a1bf  ! 1050: SAVE_I	save	%r18, 0x0001, %r31
	setx	0x10032, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e5211f  ! 1053: SAVE_I	save	%r20, 0x0001, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbe446185  ! 1059: ADDC_I	addc 	%r17, 0x0185, %r31
	.word 0xbbe5a111  ! 1061: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb9e420eb  ! 1062: SAVE_I	save	%r16, 0x0001, %r28
	.word 0x8594e1dc  ! 1066: WRPR_TSTATE_I	wrpr	%r19, 0x01dc, %tstate
	.word 0xb9e46093  ! 1067: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xbde52140  ! 1070: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb7e5215f  ! 1071: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb7e5a062  ! 1073: SAVE_I	save	%r22, 0x0001, %r27
	mov	2, %r12
	.word 0x8f932000  ! 1076: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb7e52190  ! 1078: SAVE_I	save	%r20, 0x0001, %r27
	setx	0x213, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf641800  ! 1084: MOVcc_R	<illegal instruction>
	.word 0x91942073  ! 1086: WRPR_PIL_I	wrpr	%r16, 0x0073, %pil
	.word 0xbde4e1e6  ! 1091: SAVE_I	save	%r19, 0x0001, %r30
	.word 0x8595a081  ! 1093: WRPR_TSTATE_I	wrpr	%r22, 0x0081, %tstate
	.word 0xbde4a051  ! 1094: SAVE_I	save	%r18, 0x0001, %r30
	mov	1, %r12
	.word 0x8f932000  ! 1098: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	data_start_1, %g1, %r18
	.word 0x87946011  ! 1100: WRPR_TT_I	wrpr	%r17, 0x0011, %tt
	ta	T_CHANGE_HPRIV
	.word 0x81983851  ! 1102: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1851, %hpstate
	.word 0xb3e52105  ! 1104: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb1e5a052  ! 1105: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb3e56170  ! 1108: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xbfe52067  ! 1109: SAVE_I	save	%r20, 0x0001, %r31
	setx	0x30327, %g1, %o0
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
	.word 0xb7e520d4  ! 1113: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb1e4a063  ! 1120: SAVE_I	save	%r18, 0x0001, %r24
	mov	1, %r12
	.word 0x8f932000  ! 1124: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb3e5e1b4  ! 1129: SAVE_I	save	%r23, 0x0001, %r25
	setx	0x30008, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	0, %r12
	.word 0x8f932000  ! 1131: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb7508000  ! 1132: RDPR_TSTATE	<illegal instruction>
	.word 0xb5641800  ! 1135: MOVcc_R	<illegal instruction>
	.word 0xb1518000  ! 1136: RDPR_PSTATE	<illegal instruction>
	.word 0xbde5e0d0  ! 1139: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb7e4a1e8  ! 1140: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb9e5a1e4  ! 1142: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xbbe4a05e  ! 1143: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xbb50c000  ! 1144: RDPR_TT	<illegal instruction>
	.word 0xbfe4e1e4  ! 1145: SAVE_I	save	%r19, 0x0001, %r31
	setx	data_start_6, %g1, %r21
	.word 0xb7e4e1aa  ! 1147: SAVE_I	save	%r19, 0x0001, %r27
	setx	data_start_5, %g1, %r18
	.word 0xb7e4a03c  ! 1154: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xbbe5e1c7  ! 1155: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb13c8000  ! 1159: SRA_R	sra 	%r18, %r0, %r24
	.word 0xb3e4a0d4  ! 1160: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb3e5e198  ! 1161: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb5e561b9  ! 1162: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb3e56180  ! 1164: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xbbe4e0d6  ! 1167: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb5e561ed  ! 1169: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xbfe5a058  ! 1170: SAVE_I	save	%r22, 0x0001, %r31
	mov	0, %r12
	.word 0x8f932000  ! 1173: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb69ca070  ! 1174: XORcc_I	xorcc 	%r18, 0x0070, %r27
	.word 0xb5e4604b  ! 1175: SAVE_I	save	%r17, 0x0001, %r26
	setx	data_start_7, %g1, %r17
	.word 0xb9e5e09d  ! 1179: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xbb520000  ! 1185: RDPR_PIL	<illegal instruction>
	setx	0x2023b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8794a1a8  ! 1188: WRPR_TT_I	wrpr	%r18, 0x01a8, %tt
	setx	0x31d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf480000  ! 1192: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0x9195a025  ! 1194: WRPR_PIL_I	wrpr	%r22, 0x0025, %pil
	.word 0xbde4e009  ! 1197: SAVE_I	save	%r19, 0x0001, %r30
	setx	0x331, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e5a1b7  ! 1201: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xbf480000  ! 1205: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	setx	0x10025, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe42122  ! 1208: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb9504000  ! 1210: RDPR_TNPC	<illegal instruction>
	.word 0xbd510000  ! 1212: RDPR_TICK	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81983ec1  ! 1213: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ec1, %hpstate
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0x8195a063  ! 1215: WRPR_TPC_I	wrpr	%r22, 0x0063, %tpc
	.word 0xb9e56068  ! 1216: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xbfe42113  ! 1219: SAVE_I	save	%r16, 0x0001, %r31
	mov	0, %r12
	.word 0x8f932000  ! 1220: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb5e46156  ! 1223: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xbf504000  ! 1227: RDPR_TNPC	<illegal instruction>
	.word 0xb9504000  ! 1228: RDPR_TNPC	<illegal instruction>
	.word 0xb5e521a7  ! 1230: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb5e4609c  ! 1231: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb3e5a05e  ! 1233: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb3508000  ! 1240: RDPR_TSTATE	<illegal instruction>
	.word 0xb2bd0000  ! 1242: XNORcc_R	xnorcc 	%r20, %r0, %r25
	.word 0xbb480000  ! 1245: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xbd51c000  ! 1246: RDPR_TL	<illegal instruction>
	.word 0xb5e460fa  ! 1249: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xbfe520cc  ! 1250: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb7e5e13c  ! 1253: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb5e5e043  ! 1254: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb42da1b5  ! 1256: ANDN_I	andn 	%r22, 0x01b5, %r26
	.word 0xb7e4e071  ! 1257: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb5e56100  ! 1258: SAVE_I	save	%r21, 0x0001, %r26
	.word 0x819421cd  ! 1261: WRPR_TPC_I	wrpr	%r16, 0x01cd, %tpc
	.word 0xb5e421d4  ! 1262: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xbde4a187  ! 1268: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb3e5614e  ! 1272: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb7e4a00c  ! 1274: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xbde5a0b8  ! 1279: SAVE_I	save	%r22, 0x0001, %r30
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	ta	T_CHANGE_HPRIV
	.word 0x81982fd1  ! 1281: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fd1, %hpstate
	.word 0x8394e0d6  ! 1283: WRPR_TNPC_I	wrpr	%r19, 0x00d6, %tnpc
	.word 0xbde4e1c4  ! 1284: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb3e4e026  ! 1285: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xbfe5a05d  ! 1287: SAVE_I	save	%r22, 0x0001, %r31
	.word 0x8d94a1eb  ! 1296: WRPR_PSTATE_I	wrpr	%r18, 0x01eb, %pstate
	.word 0xb1e4205c  ! 1302: SAVE_I	save	%r16, 0x0001, %r24
	setx	data_start_1, %g1, %r23
	.word 0xb350c000  ! 1307: RDPR_TT	<illegal instruction>
	.word 0xb3e5a05e  ! 1311: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xbbe420c1  ! 1314: SAVE_I	save	%r16, 0x0001, %r29
	.word 0x8794604b  ! 1315: WRPR_TT_I	wrpr	%r17, 0x004b, %tt
	.word 0x85946163  ! 1317: WRPR_TSTATE_I	wrpr	%r17, 0x0163, %tstate
	.word 0xb3e46136  ! 1318: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbfe5e025  ! 1319: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb1e42179  ! 1326: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb60d8000  ! 1331: AND_R	and 	%r22, %r0, %r27
	.word 0xb7e5a022  ! 1334: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb9e560a7  ! 1335: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xbde4a0cd  ! 1336: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb1510000  ! 1338: RDPR_TICK	<illegal instruction>
	setx	0x10026, %g1, %o0
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
	.word 0xb9e5a00b  ! 1345: SAVE_I	save	%r22, 0x0001, %r28
	setx	data_start_7, %g1, %r18
	setx	0x30115, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe5e056  ! 1353: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb6154000  ! 1354: OR_R	or 	%r21, %r0, %r27
	setx	0x127, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8195e07d  ! 1356: WRPR_TPC_I	wrpr	%r23, 0x007d, %tpc
	.word 0xbbe4e088  ! 1357: SAVE_I	save	%r19, 0x0001, %r29
	setx	0xd, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81982b09  ! 1361: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b09, %hpstate
	.word 0xb3520000  ! 1364: RDPR_PIL	<illegal instruction>
	.word 0x8994e154  ! 1365: WRPR_TICK_I	wrpr	%r19, 0x0154, %tick
	.word 0xb9e5e0c6  ! 1366: SAVE_I	save	%r23, 0x0001, %r28
	.word 0x83956157  ! 1367: WRPR_TNPC_I	wrpr	%r21, 0x0157, %tnpc
	.word 0xbd540000  ! 1373: RDPR_GL	<illegal instruction>
	setx	0x3002b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e4618e  ! 1377: SAVE_I	save	%r17, 0x0001, %r25
	mov	0, %r14
	.word 0xa193a000  ! 1383: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0x85942119  ! 1386: WRPR_TSTATE_I	wrpr	%r16, 0x0119, %tstate
	.word 0xb7e5a1e4  ! 1387: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb9e4609e  ! 1390: SAVE_I	save	%r17, 0x0001, %r28
	mov	2, %r14
	.word 0xa193a000  ! 1394: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x13b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e560fa  ! 1397: SAVE_I	save	%r21, 0x0001, %r24
	ta	T_CHANGE_HPRIV
	.word 0x81983f01  ! 1398: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f01, %hpstate
	setx	0x1012f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d9461f6  ! 1400: WRPR_PSTATE_I	wrpr	%r17, 0x01f6, %pstate
	.word 0xb1e420ee  ! 1401: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb7e52125  ! 1404: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb3e5602f  ! 1405: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb8456026  ! 1409: ADDC_I	addc 	%r21, 0x0026, %r28
	.word 0xb5e4600c  ! 1415: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb9e421f2  ! 1416: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb1e5210c  ! 1418: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb5643801  ! 1425: MOVcc_I	<illegal instruction>
	.word 0xb7e521dc  ! 1426: SAVE_I	save	%r20, 0x0001, %r27
	mov	2, %r14
	.word 0xa193a000  ! 1427: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbf357001  ! 1430: SRLX_I	srlx	%r21, 0x0001, %r31
	.word 0xbde56178  ! 1434: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xbbe460a9  ! 1440: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xbfe5a0b3  ! 1441: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xbde4e12c  ! 1446: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xbd504000  ! 1447: RDPR_TNPC	<illegal instruction>
	setx	0x30128, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e4612c  ! 1449: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xbb34d000  ! 1454: SRLX_R	srlx	%r19, %r0, %r29
	.word 0xb5e46115  ! 1456: SAVE_I	save	%r17, 0x0001, %r26
	setx	0x111, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	0, %r12
	.word 0x8f932000  ! 1459: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbbe5606b  ! 1461: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb7e4a05d  ! 1463: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb3e461ed  ! 1465: SAVE_I	save	%r17, 0x0001, %r25
	setx	data_start_7, %g1, %r19
	.word 0xb7e520d3  ! 1468: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xbde421e2  ! 1469: SAVE_I	save	%r16, 0x0001, %r30
	setx	data_start_5, %g1, %r18
	.word 0xbbe421e0  ! 1472: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb3e5a0bc  ! 1473: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xbde56158  ! 1474: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xbf510000  ! 1476: RDPR_TICK	<illegal instruction>
	.word 0x85942076  ! 1478: WRPR_TSTATE_I	wrpr	%r16, 0x0076, %tstate
	.word 0xbd510000  ! 1479: RDPR_TICK	<illegal instruction>
	.word 0xb7e42044  ! 1481: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb80d4000  ! 1488: AND_R	and 	%r21, %r0, %r28
	ta	T_CHANGE_HPRIV
	.word 0x81982843  ! 1494: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0843, %hpstate
	setx	data_start_6, %g1, %r18
	.word 0xbd510000  ! 1496: RDPR_TICK	<illegal instruction>
	.word 0xbb510000  ! 1497: RDPR_TICK	<illegal instruction>
	.word 0xb7e4a0e0  ! 1502: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xbb520000  ! 1504: RDPR_PIL	<illegal instruction>
	.word 0x8d95e144  ! 1512: WRPR_PSTATE_I	wrpr	%r23, 0x0144, %pstate
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbfe4a1a6  ! 1517: SAVE_I	save	%r18, 0x0001, %r31
	setx	0x10233, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe4a1bf  ! 1520: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb3e5a13b  ! 1527: SAVE_I	save	%r22, 0x0001, %r25
	setx	0x309, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81982f9b  ! 1538: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f9b, %hpstate
	.word 0xbde421e0  ! 1540: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb4a4a18c  ! 1543: SUBcc_I	subcc 	%r18, 0x018c, %r26
	.word 0xb1e4e07d  ! 1545: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbf518000  ! 1546: RDPR_PSTATE	<illegal instruction>
	.word 0x8795617e  ! 1548: WRPR_TT_I	wrpr	%r21, 0x017e, %tt
	.word 0xb3e5a0dc  ! 1550: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xbbe4a070  ! 1551: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb9e5a009  ! 1552: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb7e4e19c  ! 1553: SAVE_I	save	%r19, 0x0001, %r27
	.word 0x8d95210c  ! 1554: WRPR_PSTATE_I	wrpr	%r20, 0x010c, %pstate
	.word 0xb2440000  ! 1556: ADDC_R	addc 	%r16, %r0, %r25
	ta	T_CHANGE_HPRIV
	.word 0x81982c5b  ! 1558: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c5b, %hpstate
	.word 0xb7e56069  ! 1560: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb3e52170  ! 1565: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xbf2ca001  ! 1567: SLL_I	sll 	%r18, 0x0001, %r31
	.word 0xb97c6401  ! 1568: MOVR_I	movre	%r17, 0x1, %r28
	.word 0xb3e46074  ! 1569: SAVE_I	save	%r17, 0x0001, %r25
	mov	2, %r14
	.word 0xa193a000  ! 1572: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbaadc000  ! 1573: ANDNcc_R	andncc 	%r23, %r0, %r29
	.word 0xbf520000  ! 1576: RDPR_PIL	<illegal instruction>
	.word 0xb9e421d2  ! 1577: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb1e5e103  ! 1578: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb3540000  ! 1582: RDPR_GL	<illegal instruction>
	.word 0xb9e521ca  ! 1585: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb5508000  ! 1587: RDPR_TSTATE	<illegal instruction>
	.word 0xbfe4a12f  ! 1588: SAVE_I	save	%r18, 0x0001, %r31
	.word 0x9194e182  ! 1590: WRPR_PIL_I	wrpr	%r19, 0x0182, %pil
	.word 0xb1e5207e  ! 1595: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb7e4e090  ! 1598: SAVE_I	save	%r19, 0x0001, %r27
	.word 0x81942046  ! 1601: WRPR_TPC_I	wrpr	%r16, 0x0046, %tpc
	.word 0xb9e4e148  ! 1603: SAVE_I	save	%r19, 0x0001, %r28
	.word 0x87946114  ! 1605: WRPR_TT_I	wrpr	%r17, 0x0114, %tt
	.word 0xbf3df001  ! 1607: SRAX_I	srax	%r23, 0x0001, %r31
	.word 0x8d956080  ! 1608: WRPR_PSTATE_I	wrpr	%r21, 0x0080, %pstate
	.word 0xbfe4603a  ! 1609: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb1e4e1a6  ! 1611: SAVE_I	save	%r19, 0x0001, %r24
	setx	0x2000b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe4e16a  ! 1613: SAVE_I	save	%r19, 0x0001, %r29
	.word 0x8195e104  ! 1615: WRPR_TPC_I	wrpr	%r23, 0x0104, %tpc
	.word 0x8194208d  ! 1616: WRPR_TPC_I	wrpr	%r16, 0x008d, %tpc
	.word 0xb1e560ad  ! 1624: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb5e4a195  ! 1625: SAVE_I	save	%r18, 0x0001, %r26
	.word 0x819420c2  ! 1632: WRPR_TPC_I	wrpr	%r16, 0x00c2, %tpc
	.word 0xbb518000  ! 1633: RDPR_PSTATE	<illegal instruction>
	setx	0x2030d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9e5a0c2  ! 1636: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb1e4201c  ! 1638: SAVE_I	save	%r16, 0x0001, %r24
	setx	0x30125, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe420bd  ! 1644: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb3e42093  ! 1646: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xbe15610f  ! 1652: OR_I	or 	%r21, 0x010f, %r31
	.word 0xbde46165  ! 1653: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb7e52021  ! 1654: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb9e420bd  ! 1656: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xbbe5e089  ! 1657: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb9e4a122  ! 1665: SAVE_I	save	%r18, 0x0001, %r28
	setx	0x20000, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe4e14a  ! 1667: SAVE_I	save	%r19, 0x0001, %r31
	setx	0x1020f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e52182  ! 1669: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb7e4e01d  ! 1671: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb5e5a0b3  ! 1672: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb1e46185  ! 1677: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb9e46024  ! 1678: SAVE_I	save	%r17, 0x0001, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	0x20327, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x1030d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8395a184  ! 1684: WRPR_TNPC_I	wrpr	%r22, 0x0184, %tnpc
	.word 0xb7e5a00b  ! 1685: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xbf518000  ! 1688: RDPR_PSTATE	<illegal instruction>
	mov	1, %r14
	.word 0xa193a000  ! 1690: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x10207, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e421d6  ! 1698: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xbde5a15b  ! 1701: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb7e5a12d  ! 1703: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb8454000  ! 1704: ADDC_R	addc 	%r21, %r0, %r28
	.word 0xbbe4a172  ! 1706: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xbd3c2001  ! 1711: SRA_I	sra 	%r16, 0x0001, %r30
	.word 0xbfe4a070  ! 1712: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xbfe5a148  ! 1715: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb5e4a08b  ! 1716: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb7e4e1b2  ! 1717: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xbde4a161  ! 1720: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xbde4a0e0  ! 1721: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb3e52023  ! 1722: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xbb518000  ! 1724: RDPR_PSTATE	<illegal instruction>
	.word 0x9194a00e  ! 1727: WRPR_PIL_I	wrpr	%r18, 0x000e, %pil
	.word 0xb1e4a01a  ! 1728: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xbbe4204a  ! 1730: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb1e4e09f  ! 1736: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb5e46134  ! 1739: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xbbe4e10d  ! 1740: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xbec5e1c5  ! 1741: ADDCcc_I	addccc 	%r23, 0x01c5, %r31
	.word 0xbde52058  ! 1744: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb7e5a17b  ! 1745: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb5e4a129  ! 1746: SAVE_I	save	%r18, 0x0001, %r26
	.word 0x8395a10c  ! 1748: WRPR_TNPC_I	wrpr	%r22, 0x010c, %tnpc
	.word 0xbbe52019  ! 1751: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb7e461d4  ! 1752: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb9e46183  ! 1756: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xbbe5e1bd  ! 1757: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb43460fb  ! 1758: SUBC_I	orn 	%r17, 0x00fb, %r26
	.word 0xb1e4a118  ! 1760: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xbb480000  ! 1764: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	setx	0x2011d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30107, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e421a6  ! 1767: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb7e5210a  ! 1770: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb7e56046  ! 1771: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb1e5a03d  ! 1772: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xbfe520c7  ! 1774: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb1e46157  ! 1775: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xbf2d8000  ! 1778: SLL_R	sll 	%r22, %r0, %r31
	.word 0xb3e4a1c7  ! 1780: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb1e5a183  ! 1782: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb5e5e0db  ! 1783: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xbfe52008  ! 1784: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb5e4e191  ! 1785: SAVE_I	save	%r19, 0x0001, %r26
	setx	0x3003c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81983c53  ! 1787: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c53, %hpstate
	.word 0xb3e5e0eb  ! 1788: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb9e5a0b0  ! 1791: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb52d6001  ! 1794: SLL_I	sll 	%r21, 0x0001, %r26
	.word 0xbbe4211f  ! 1795: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb4050000  ! 1796: ADD_R	add 	%r20, %r0, %r26
	.word 0xb284a198  ! 1801: ADDcc_I	addcc 	%r18, 0x0198, %r25
	.word 0xb1480000  ! 1806: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xbbe4612e  ! 1807: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb7e561e1  ! 1809: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb1e52045  ! 1814: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xbc350000  ! 1819: ORN_R	orn 	%r20, %r0, %r30
	.word 0xbfe560e7  ! 1822: SAVE_I	save	%r21, 0x0001, %r31
	setx	0x10135, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e4a033  ! 1824: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb1e460aa  ! 1831: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb5e5a064  ! 1834: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xbfe52132  ! 1835: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb8b5a186  ! 1841: SUBCcc_I	orncc 	%r22, 0x0186, %r28
	ta	T_CHANGE_HPRIV
	.word 0x81982d53  ! 1842: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d53, %hpstate
	setx	0x30218, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8394a0a5  ! 1845: WRPR_TNPC_I	wrpr	%r18, 0x00a5, %tnpc
	setx	0x203, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81982851  ! 1847: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0851, %hpstate
	setx	0x3033d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9504000  ! 1851: RDPR_TNPC	<illegal instruction>
	.word 0xb1e5e0b1  ! 1855: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb5508000  ! 1859: RDPR_TSTATE	<illegal instruction>
	.word 0xb8054000  ! 1861: ADD_R	add 	%r21, %r0, %r28
	.word 0xbfe5a030  ! 1863: SAVE_I	save	%r22, 0x0001, %r31
	setx	0x1011c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb2b54000  ! 1870: SUBCcc_R	orncc 	%r21, %r0, %r25
	setx	data_start_6, %g1, %r19
	setx	0x20111, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9e561c8  ! 1877: SAVE_I	save	%r21, 0x0001, %r28
	.word 0x8994e01f  ! 1878: WRPR_TICK_I	wrpr	%r19, 0x001f, %tick
	.word 0x8395a107  ! 1879: WRPR_TNPC_I	wrpr	%r22, 0x0107, %tnpc
	.word 0xbf480000  ! 1883: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xb1e4a1d2  ! 1884: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb1e5e175  ! 1886: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb0350000  ! 1887: ORN_R	orn 	%r20, %r0, %r24
	.word 0xb3e56043  ! 1894: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb7e521e3  ! 1896: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb7e4e0fa  ! 1897: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb5e4a1c2  ! 1902: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb550c000  ! 1905: RDPR_TT	<illegal instruction>
	.word 0x8394e1d0  ! 1906: WRPR_TNPC_I	wrpr	%r19, 0x01d0, %tnpc
	setx	0x20225, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e461de  ! 1912: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb1e4a0d3  ! 1919: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xbfe4a009  ! 1920: SAVE_I	save	%r18, 0x0001, %r31
	.word 0x879560a3  ! 1921: WRPR_TT_I	wrpr	%r21, 0x00a3, %tt
	.word 0xb44521cd  ! 1929: ADDC_I	addc 	%r20, 0x01cd, %r26
	.word 0xb7e4e189  ! 1932: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb7e5a044  ! 1935: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb9520000  ! 1937: RDPR_PIL	<illegal instruction>
	.word 0x8795e163  ! 1939: WRPR_TT_I	wrpr	%r23, 0x0163, %tt
	.word 0xbfe52037  ! 1940: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb7e5e0bc  ! 1941: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb1e5603d  ! 1943: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb1e52181  ! 1944: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb5e4e1f3  ! 1945: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb00d2042  ! 1947: AND_I	and 	%r20, 0x0042, %r24
	.word 0x8595a1c2  ! 1948: WRPR_TSTATE_I	wrpr	%r22, 0x01c2, %tstate
	mov	2, %r12
	.word 0x8f932000  ! 1949: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbfe5215c  ! 1951: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb1e52131  ! 1953: SAVE_I	save	%r20, 0x0001, %r24
	setx	0x20215, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde5e13f  ! 1955: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb3e561a3  ! 1956: SAVE_I	save	%r21, 0x0001, %r25
	mov	0, %r12
	.word 0x8f932000  ! 1960: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb9510000  ! 1961: RDPR_TICK	<illegal instruction>
	.word 0xb22c0000  ! 1964: ANDN_R	andn 	%r16, %r0, %r25
	setx	data_start_7, %g1, %r19
	.word 0xbf51c000  ! 1971: RDPR_TL	rdpr	%tl, %r31
	.word 0xb7348000  ! 1972: SRL_R	srl 	%r18, %r0, %r27
	.word 0xbbe5a111  ! 1973: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xbde461a1  ! 1976: SAVE_I	save	%r17, 0x0001, %r30
	ta	T_CHANGE_HPRIV
	.word 0x8198291b  ! 1977: WRHPR_HPSTATE_I	wrhpr	%r0, 0x091b, %hpstate
	.word 0xbfe4615c  ! 1980: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xbbe5a173  ! 1981: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb7e5e073  ! 1984: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb5e460db  ! 1985: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb1e420bb  ! 1987: SAVE_I	save	%r16, 0x0001, %r24
	setx	0x119, %g1, %o0
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
	.word 0xb5e4e03a  ! 1994: SAVE_I	save	%r19, 0x0001, %r26
	mov	2, %r12
	.word 0x8f932000  ! 1995: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbf643801  ! 1996: MOVcc_I	<illegal instruction>
	.word 0xbd518000  ! 2003: RDPR_PSTATE	<illegal instruction>
	setx	0x20023, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	1, %r12
	.word 0x8f932000  ! 2006: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb7e561e3  ! 2009: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xbbe4207e  ! 2011: SAVE_I	save	%r16, 0x0001, %r29
	.word 0x8d95a0ab  ! 2015: WRPR_PSTATE_I	wrpr	%r22, 0x00ab, %pstate
	.word 0x8394617a  ! 2016: WRPR_TNPC_I	wrpr	%r17, 0x017a, %tnpc
	setx	0x316, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1643801  ! 2019: MOVcc_I	<illegal instruction>
	.word 0xb9e5e1a9  ! 2021: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb7e4212c  ! 2022: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb9e5a0c0  ! 2025: SAVE_I	save	%r22, 0x0001, %r28
	setx	0x223, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe460ab  ! 2029: SAVE_I	save	%r17, 0x0001, %r29
	setx	0x30021, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e4a1a2  ! 2032: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb1e5a094  ! 2033: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb1e46151  ! 2035: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xbde52098  ! 2037: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb3520000  ! 2038: RDPR_PIL	<illegal instruction>
	.word 0xb3e46029  ! 2049: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbfe421ab  ! 2050: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb9e5a0b6  ! 2054: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb7e4a1df  ! 2055: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb5e42104  ! 2060: SAVE_I	save	%r16, 0x0001, %r26
	setx	0x20337, %g1, %o0
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
	.word 0xbc4460d4  ! 2065: ADDC_I	addc 	%r17, 0x00d4, %r30
	.word 0xb9e4a101  ! 2067: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb7e5a0a4  ! 2069: SAVE_I	save	%r22, 0x0001, %r27
	.word 0x81942055  ! 2071: WRPR_TPC_I	wrpr	%r16, 0x0055, %tpc
	.word 0xb9510000  ! 2072: RDPR_TICK	<illegal instruction>
	.word 0xb1e420f7  ! 2076: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb9e4a08d  ! 2078: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb5e5e037  ! 2079: SAVE_I	save	%r23, 0x0001, %r26
	.word 0x879461f7  ! 2083: WRPR_TT_I	wrpr	%r17, 0x01f7, %tt
	.word 0xb3518000  ! 2084: RDPR_PSTATE	<illegal instruction>
	.word 0xbbe5e0a8  ! 2087: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb615a17f  ! 2091: OR_I	or 	%r22, 0x017f, %r27
	setx	0x30325, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10032, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde4612b  ! 2098: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbfe4e11d  ! 2099: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb13d0000  ! 2100: SRA_R	sra 	%r20, %r0, %r24
	.word 0xb5e560f4  ! 2103: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xbbe420e1  ! 2106: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb7500000  ! 2109: RDPR_TPC	<illegal instruction>
	setx	0x30030, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf643801  ! 2113: MOVcc_I	<illegal instruction>
	.word 0xb3e520f4  ! 2115: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb695c000  ! 2122: ORcc_R	orcc 	%r23, %r0, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbb2c8000  ! 2128: SLL_R	sll 	%r18, %r0, %r29
	.word 0xb7e5e04d  ! 2129: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xbe35c000  ! 2130: SUBC_R	orn 	%r23, %r0, %r31
	.word 0xb9e421be  ! 2148: SAVE_I	save	%r16, 0x0001, %r28
	.word 0x8794606f  ! 2151: WRPR_TT_I	wrpr	%r17, 0x006f, %tt
	.word 0xb7e4a122  ! 2153: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb81ca02d  ! 2159: XOR_I	xor 	%r18, 0x002d, %r28
	.word 0xb5e5a17e  ! 2163: SAVE_I	save	%r22, 0x0001, %r26
	.word 0x9195a19f  ! 2164: WRPR_PIL_I	wrpr	%r22, 0x019f, %pil
	setx	0x116, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9e5a0c7  ! 2167: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb1e4a041  ! 2173: SAVE_I	save	%r18, 0x0001, %r24
	setx	0x3022a, %g1, %o0
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
	.word 0xb7e4600a  ! 2181: SAVE_I	save	%r17, 0x0001, %r27
	.word 0x8d95605c  ! 2186: WRPR_PSTATE_I	wrpr	%r21, 0x005c, %pstate
	.word 0xb9e52155  ! 2189: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xbde4e1ea  ! 2193: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb3641800  ! 2196: MOVcc_R	<illegal instruction>
	.word 0xb9e4e1ac  ! 2202: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb1e4e19f  ! 2204: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb5e4e00b  ! 2206: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb5e4e0c0  ! 2210: SAVE_I	save	%r19, 0x0001, %r26
	.word 0x919461c3  ! 2215: WRPR_PIL_I	wrpr	%r17, 0x01c3, %pil
	.word 0xbbe4e099  ! 2218: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb351c000  ! 2219: RDPR_TL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x8198284b  ! 2220: WRHPR_HPSTATE_I	wrhpr	%r0, 0x084b, %hpstate
	ta	T_CHANGE_HPRIV
	.word 0x81982883  ! 2221: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0883, %hpstate
	setx	0x20339, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e56027  ! 2224: SAVE_I	save	%r21, 0x0001, %r24
	setx	0x1002d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x15, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9e5a1c5  ! 2234: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb5480000  ! 2236: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xbde520e6  ! 2237: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb5518000  ! 2238: RDPR_PSTATE	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81983bc3  ! 2240: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1bc3, %hpstate
	ta	T_CHANGE_HPRIV
	.word 0x81982983  ! 2243: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0983, %hpstate
	setx	0x234, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e460b6  ! 2248: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xbfe4206b  ! 2249: SAVE_I	save	%r16, 0x0001, %r31
	setx	0x216, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81982f11  ! 2251: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f11, %hpstate
	.word 0xbf51c000  ! 2252: RDPR_TL	<illegal instruction>
	.word 0xb3e5e183  ! 2259: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb3e42022  ! 2260: SAVE_I	save	%r16, 0x0001, %r25
	.word 0x8d9420c7  ! 2262: WRPR_PSTATE_I	wrpr	%r16, 0x00c7, %pstate
	.word 0xb1e5203d  ! 2264: SAVE_I	save	%r20, 0x0001, %r24
	setx	0x30114, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e4a1d7  ! 2268: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb7e42087  ! 2269: SAVE_I	save	%r16, 0x0001, %r27
	setx	data_start_7, %g1, %r16
	.word 0xb7e4e0cb  ! 2273: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xbde4a029  ! 2274: SAVE_I	save	%r18, 0x0001, %r30
	setx	0x1021e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e4608a  ! 2276: SAVE_I	save	%r17, 0x0001, %r27
	mov	0, %r12
	.word 0x8f932000  ! 2284: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbfe5a065  ! 2289: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb7e46001  ! 2290: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb93dc000  ! 2292: SRA_R	sra 	%r23, %r0, %r28
	.word 0xbde4a1ed  ! 2293: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb33d2001  ! 2295: SRA_I	sra 	%r20, 0x0001, %r25
	.word 0xb1e56012  ! 2297: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xbbe421de  ! 2299: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb7e42177  ! 2300: SAVE_I	save	%r16, 0x0001, %r27
	ta	T_CHANGE_HPRIV
	.word 0x81983bd9  ! 2305: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1bd9, %hpstate
	.word 0xbfe4a10e  ! 2307: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb7e5a05c  ! 2308: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xbfe4a03f  ! 2311: SAVE_I	save	%r18, 0x0001, %r31
	mov	0, %r14
	.word 0xa193a000  ! 2312: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x23, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe5617a  ! 2316: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb3e520c2  ! 2319: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb1508000  ! 2320: RDPR_TSTATE	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb5e56137  ! 2327: SAVE_I	save	%r21, 0x0001, %r26
	setx	data_start_4, %g1, %r21
	.word 0xb9e421cd  ! 2330: SAVE_I	save	%r16, 0x0001, %r28
	setx	data_start_4, %g1, %r17
	setx	0x20110, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9e52081  ! 2344: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xbf540000  ! 2348: RDPR_GL	<illegal instruction>
	.word 0xbbe5e0d6  ! 2350: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xbf540000  ! 2351: RDPR_GL	<illegal instruction>
	.word 0xb3e4a1c1  ! 2352: SAVE_I	save	%r18, 0x0001, %r25
	.word 0x87952051  ! 2360: WRPR_TT_I	wrpr	%r20, 0x0051, %tt
	.word 0xb1e56039  ! 2361: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb7e460d6  ! 2365: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xbf500000  ! 2366: RDPR_TPC	<illegal instruction>
	.word 0xb1e420bf  ! 2368: SAVE_I	save	%r16, 0x0001, %r24
	.word 0x8d95e14f  ! 2370: WRPR_PSTATE_I	wrpr	%r23, 0x014f, %pstate
	.word 0xb80521dc  ! 2372: ADD_I	add 	%r20, 0x01dc, %r28
	setx	0x10216, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_7, %g1, %r17
	.word 0xb7e4219a  ! 2380: SAVE_I	save	%r16, 0x0001, %r27
	.word 0x9195e02f  ! 2381: WRPR_PIL_I	wrpr	%r23, 0x002f, %pil
	.word 0xb3e4e15f  ! 2382: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb1520000  ! 2383: RDPR_PIL	<illegal instruction>
	.word 0xbfe5e12c  ! 2384: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb7e5a058  ! 2385: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb3508000  ! 2387: RDPR_TSTATE	<illegal instruction>
	.word 0xbfe4a166  ! 2389: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xbfe5a17f  ! 2391: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb351c000  ! 2392: RDPR_TL	<illegal instruction>
	.word 0xbde4a0af  ! 2393: SAVE_I	save	%r18, 0x0001, %r30
	mov	0, %r12
	.word 0x8f932000  ! 2394: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb1e5e005  ! 2395: SAVE_I	save	%r23, 0x0001, %r24
	.word 0x8794e0bd  ! 2396: WRPR_TT_I	wrpr	%r19, 0x00bd, %tt
	.word 0xbbe5a0c2  ! 2397: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb7e4a06e  ! 2401: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb5e5e01e  ! 2404: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb9520000  ! 2405: RDPR_PIL	<illegal instruction>
	.word 0xb3e520f0  ! 2407: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb1e4a027  ! 2409: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xbde4a0a1  ! 2412: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb7e5a0af  ! 2414: SAVE_I	save	%r22, 0x0001, %r27
	setx	data_start_4, %g1, %r20
	.word 0xbaad60a2  ! 2418: ANDNcc_I	andncc 	%r21, 0x00a2, %r29
	.word 0xb9e56105  ! 2425: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb0c4c000  ! 2427: ADDCcc_R	addccc 	%r19, %r0, %r24
	.word 0xb5e5e165  ! 2428: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb1e4a1c3  ! 2429: SAVE_I	save	%r18, 0x0001, %r24
	setx	data_start_2, %g1, %r23
	.word 0xb5e5a07a  ! 2433: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb3e52057  ! 2434: SAVE_I	save	%r20, 0x0001, %r25
	.word 0x839520f8  ! 2436: WRPR_TNPC_I	wrpr	%r20, 0x00f8, %tnpc
	.word 0x83952192  ! 2437: WRPR_TNPC_I	wrpr	%r20, 0x0192, %tnpc
	.word 0xbb480000  ! 2439: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xb3e5e0e2  ! 2440: SAVE_I	save	%r23, 0x0001, %r25
	.word 0x8394e041  ! 2442: WRPR_TNPC_I	wrpr	%r19, 0x0041, %tnpc
	.word 0xb151c000  ! 2446: RDPR_TL	<illegal instruction>
	.word 0xbbe4e16a  ! 2447: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xbfe5e1a6  ! 2448: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xbe9d8000  ! 2452: XORcc_R	xorcc 	%r22, %r0, %r31
	mov	1, %r14
	.word 0xa193a000  ! 2453: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	data_start_7, %g1, %r20
	.word 0xb3e5e058  ! 2457: SAVE_I	save	%r23, 0x0001, %r25
	.word 0x8195a18a  ! 2458: WRPR_TPC_I	wrpr	%r22, 0x018a, %tpc
	.word 0xbbe56098  ! 2461: SAVE_I	save	%r21, 0x0001, %r29
	setx	0x20028, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe5e0c1  ! 2470: SAVE_I	save	%r23, 0x0001, %r31
	.word 0x89946087  ! 2471: WRPR_TICK_I	wrpr	%r17, 0x0087, %tick
	.word 0xb5e4e139  ! 2472: SAVE_I	save	%r19, 0x0001, %r26
	setx	0x139, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30106, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd2da001  ! 2477: SLL_I	sll 	%r22, 0x0001, %r30
	.word 0xb5e5a1af  ! 2478: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb3e5e174  ! 2479: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xbbe46139  ! 2483: SAVE_I	save	%r17, 0x0001, %r29
	setx	data_start_1, %g1, %r19
	.word 0xbb520000  ! 2491: RDPR_PIL	<illegal instruction>
	.word 0x919421cf  ! 2492: WRPR_PIL_I	wrpr	%r16, 0x01cf, %pil
	ta	T_CHANGE_HPRIV
	.word 0x81983c53  ! 2495: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c53, %hpstate
	.word 0xb5e5a139  ! 2497: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xbde56131  ! 2498: SAVE_I	save	%r21, 0x0001, %r30
	.word 0x859561fe  ! 2499: WRPR_TSTATE_I	wrpr	%r21, 0x01fe, %tstate
	setx	data_start_4, %g1, %r18
	setx	0x30012, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8995a0fa  ! 2507: WRPR_TICK_I	wrpr	%r22, 0x00fa, %tick
	.word 0x879460fd  ! 2514: WRPR_TT_I	wrpr	%r17, 0x00fd, %tt
	.word 0xbb508000  ! 2515: RDPR_TSTATE	<illegal instruction>
	.word 0xb3520000  ! 2517: RDPR_PIL	<illegal instruction>
	.word 0x8195603a  ! 2521: WRPR_TPC_I	wrpr	%r21, 0x003a, %tpc
	.word 0xb5e5a022  ! 2522: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xbde4609c  ! 2531: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbfe4e05a  ! 2533: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb9e4205c  ! 2534: SAVE_I	save	%r16, 0x0001, %r28
	setx	0x10027, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb3da001  ! 2541: SRA_I	sra 	%r22, 0x0001, %r29
	.word 0x85946070  ! 2542: WRPR_TSTATE_I	wrpr	%r17, 0x0070, %tstate
	.word 0xb8150000  ! 2545: OR_R	or 	%r20, %r0, %r28
	setx	0x1032b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe521ee  ! 2561: SAVE_I	save	%r20, 0x0001, %r29
	setx	0x20331, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1480000  ! 2563: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	setx	0x10311, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20005, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe421a1  ! 2567: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb6c56122  ! 2568: ADDCcc_I	addccc 	%r21, 0x0122, %r27
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbfe5e007  ! 2570: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb1e4e121  ! 2574: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb92cc000  ! 2577: SLL_R	sll 	%r19, %r0, %r28
	.word 0xb1e520ca  ! 2578: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xbebde1f8  ! 2584: XNORcc_I	xnorcc 	%r23, 0x01f8, %r31
	.word 0xb9e4e17d  ! 2586: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xbfe5205c  ! 2591: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb1e56196  ! 2594: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb7e420b1  ! 2598: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb7e4208c  ! 2599: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb7e4e029  ! 2601: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb9e5e06c  ! 2602: SAVE_I	save	%r23, 0x0001, %r28
	setx	data_start_6, %g1, %r19
	.word 0xb3e420ad  ! 2608: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb9e42150  ! 2613: SAVE_I	save	%r16, 0x0001, %r28
	mov	0, %r12
	.word 0x8f932000  ! 2614: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb5e561db  ! 2616: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb60c2171  ! 2617: AND_I	and 	%r16, 0x0171, %r27
	.word 0xb5e4211c  ! 2619: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xbf540000  ! 2621: RDPR_GL	<illegal instruction>
	.word 0xb83da1f9  ! 2624: XNOR_I	xnor 	%r22, 0x01f9, %r28
	.word 0xbbe4603b  ! 2627: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xba1c8000  ! 2631: XOR_R	xor 	%r18, %r0, %r29
	.word 0xb9e521c3  ! 2633: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb7e520cd  ! 2634: SAVE_I	save	%r20, 0x0001, %r27
	.word 0x8994e1c0  ! 2635: WRPR_TICK_I	wrpr	%r19, 0x01c0, %tick
	.word 0x8595209f  ! 2636: WRPR_TSTATE_I	wrpr	%r20, 0x009f, %tstate
	.word 0xbfe46137  ! 2638: SAVE_I	save	%r17, 0x0001, %r31
	setx	data_start_4, %g1, %r22
	.word 0xb61da154  ! 2643: XOR_I	xor 	%r22, 0x0154, %r27
	.word 0xb5e520a2  ! 2644: SAVE_I	save	%r20, 0x0001, %r26
	setx	0x30133, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81982851  ! 2648: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0851, %hpstate
	setx	0x20007, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e421b5  ! 2656: SAVE_I	save	%r16, 0x0001, %r24
	setx	0x3000f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde520fd  ! 2663: SAVE_I	save	%r20, 0x0001, %r30
	setx	0x101, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x819828c9  ! 2667: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08c9, %hpstate
	.word 0xb9e460ee  ! 2668: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb3e42125  ! 2669: SAVE_I	save	%r16, 0x0001, %r25
	setx	0x20217, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e5a12e  ! 2672: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb5e56157  ! 2680: SAVE_I	save	%r21, 0x0001, %r26
	setx	0x23f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x839520ee  ! 2683: WRPR_TNPC_I	wrpr	%r20, 0x00ee, %tnpc
	.word 0xbfe5a107  ! 2689: SAVE_I	save	%r22, 0x0001, %r31
	setx	0x20104, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7520000  ! 2696: RDPR_PIL	<illegal instruction>
	mov	0, %r14
	.word 0xa193a000  ! 2699: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0x8d94e1bc  ! 2701: WRPR_PSTATE_I	wrpr	%r19, 0x01bc, %pstate
	.word 0xb9e5602f  ! 2702: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xbbe5a04c  ! 2704: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb5e5606f  ! 2705: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb8b4e070  ! 2709: SUBCcc_I	orncc 	%r19, 0x0070, %r28
	.word 0xb3e5e0e6  ! 2710: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb9518000  ! 2711: RDPR_PSTATE	<illegal instruction>
	setx	0x20335, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb50c000  ! 2717: RDPR_TT	<illegal instruction>
	setx	0x10125, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e4a04c  ! 2722: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb3500000  ! 2723: RDPR_TPC	<illegal instruction>
	.word 0xb3e4e1eb  ! 2724: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb7e52141  ! 2728: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb1e4201a  ! 2729: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb1e5a13c  ! 2732: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb5e52116  ! 2736: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xbde56145  ! 2738: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xbbe4a00e  ! 2740: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xbde461b3  ! 2742: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb1e4e05f  ! 2744: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbbe56138  ! 2747: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb7e5a0b4  ! 2748: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb5e4e006  ! 2752: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xbb2dd000  ! 2754: SLLX_R	sllx	%r23, %r0, %r29
	.word 0xbfe5a13e  ! 2757: SAVE_I	save	%r22, 0x0001, %r31
	ta	T_CHANGE_HPRIV
	.word 0x81982883  ! 2765: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0883, %hpstate
	setx	0x114, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb224c000  ! 2769: SUB_R	sub 	%r19, %r0, %r25
	.word 0xbbe42158  ! 2770: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xbfe5e087  ! 2772: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb12c9000  ! 2773: SLLX_R	sllx	%r18, %r0, %r24
	.word 0xbf500000  ! 2774: RDPR_TPC	<illegal instruction>
	setx	0x2023b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x879461ad  ! 2776: WRPR_TT_I	wrpr	%r17, 0x01ad, %tt
	.word 0xbfe4611b  ! 2777: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb8944000  ! 2783: ORcc_R	orcc 	%r17, %r0, %r28
	.word 0xbde4217a  ! 2784: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xbfe5e03c  ! 2790: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb7e5a10a  ! 2796: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb6044000  ! 2801: ADD_R	add 	%r17, %r0, %r27
	.word 0xb5e461a0  ! 2803: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb7e5219a  ! 2804: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb9e5e001  ! 2808: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb9e5e027  ! 2811: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xbfe4a0c0  ! 2812: SAVE_I	save	%r18, 0x0001, %r31
	setx	0x301, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe461f3  ! 2814: SAVE_I	save	%r17, 0x0001, %r29
	setx	0x10207, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3480000  ! 2817: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xbf3cb001  ! 2820: SRAX_I	srax	%r18, 0x0001, %r31
	.word 0xbfe420a5  ! 2823: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb9e5a017  ! 2830: SAVE_I	save	%r22, 0x0001, %r28
	.word 0x81942003  ! 2832: WRPR_TPC_I	wrpr	%r16, 0x0003, %tpc
	.word 0xb1e560b7  ! 2836: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb3e4e0b1  ! 2837: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xbf508000  ! 2838: RDPR_TSTATE	<illegal instruction>
	.word 0xbfe5a09f  ! 2839: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb7e4e04e  ! 2841: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xbf2dd000  ! 2843: SLLX_R	sllx	%r23, %r0, %r31
	.word 0x8995e0e9  ! 2844: WRPR_TICK_I	wrpr	%r23, 0x00e9, %tick
	.word 0xb9e4a088  ! 2845: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb9e5e030  ! 2851: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xbbe56142  ! 2853: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xbb2d4000  ! 2856: SLL_R	sll 	%r21, %r0, %r29
	.word 0xbb3de001  ! 2859: SRA_I	sra 	%r23, 0x0001, %r29
	.word 0xb73c0000  ! 2860: SRA_R	sra 	%r16, %r0, %r27
	.word 0xb5e4e0c8  ! 2862: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb3e4a1c9  ! 2863: SAVE_I	save	%r18, 0x0001, %r25
	setx	0x1020c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9e5615b  ! 2868: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb7e520d4  ! 2869: SAVE_I	save	%r20, 0x0001, %r27
	setx	data_start_4, %g1, %r17
	ta	T_CHANGE_HPRIV
	.word 0x81983e09  ! 2876: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e09, %hpstate
	.word 0xbc2c0000  ! 2877: ANDN_R	andn 	%r16, %r0, %r30
	.word 0xb3e4a1c5  ! 2882: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xbfe5e054  ! 2883: SAVE_I	save	%r23, 0x0001, %r31
	setx	data_start_7, %g1, %r19
	.word 0xb9e461ae  ! 2886: SAVE_I	save	%r17, 0x0001, %r28
	setx	0x20232, %g1, %o0
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
	.word 0xb9e4a1f4  ! 2890: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb9e421ac  ! 2892: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xbd500000  ! 2895: RDPR_TPC	<illegal instruction>
	.word 0xb9e4a16a  ! 2899: SAVE_I	save	%r18, 0x0001, %r28
	setx	0x30038, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	0, %r12
	.word 0x8f932000  ! 2903: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0x8995e0cc  ! 2904: WRPR_TICK_I	wrpr	%r23, 0x00cc, %tick
	.word 0xb3e5e151  ! 2908: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xbbe56106  ! 2910: SAVE_I	save	%r21, 0x0001, %r29
	setx	0x2011c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x120, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1504000  ! 2918: RDPR_TNPC	<illegal instruction>
	setx	0x1020f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e5204a  ! 2921: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb151c000  ! 2922: RDPR_TL	<illegal instruction>
	.word 0xb3e42120  ! 2927: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xbfe42158  ! 2932: SAVE_I	save	%r16, 0x0001, %r31
	setx	data_start_3, %g1, %r20
	mov	0, %r12
	.word 0x8f932000  ! 2937: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	0x20013, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb32dc000  ! 2942: SLL_R	sll 	%r23, %r0, %r25
	setx	0x20136, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x119, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e4a15a  ! 2946: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xbde521ab  ! 2948: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb5e421c8  ! 2949: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xbde4a070  ! 2950: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb5e5614e  ! 2954: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb7e56016  ! 2956: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb4a4c000  ! 2957: SUBcc_R	subcc 	%r19, %r0, %r26
	.word 0xbf50c000  ! 2960: RDPR_TT	<illegal instruction>
	.word 0xb9e5e1c9  ! 2963: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb5e420ab  ! 2964: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb3e42076  ! 2966: SAVE_I	save	%r16, 0x0001, %r25
	setx	0x20132, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe4217a  ! 2970: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb7e4601d  ! 2971: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb7e52185  ! 2973: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb3520000  ! 2974: RDPR_PIL	<illegal instruction>
	.word 0xb8940000  ! 2977: ORcc_R	orcc 	%r16, %r0, %r28
	setx	data_start_2, %g1, %r22
	.word 0xb3e561ea  ! 2979: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb7e52155  ! 2980: SAVE_I	save	%r20, 0x0001, %r27
	.word 0x8394212c  ! 2982: WRPR_TNPC_I	wrpr	%r16, 0x012c, %tnpc
	.word 0xb9e5618e  ! 2983: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb6b52089  ! 2986: ORNcc_I	orncc 	%r20, 0x0089, %r27
	.word 0xb3e5e1cf  ! 2987: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb7e52119  ! 2989: SAVE_I	save	%r20, 0x0001, %r27
	.word 0x9195a1d5  ! 2996: WRPR_PIL_I	wrpr	%r22, 0x01d5, %pil
	.word 0xbfe4611a  ! 3008: SAVE_I	save	%r17, 0x0001, %r31
	setx	0x236, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf50c000  ! 3013: RDPR_TT	<illegal instruction>
	.word 0xb3500000  ! 3017: RDPR_TPC	<illegal instruction>
	.word 0x8994a11c  ! 3019: WRPR_TICK_I	wrpr	%r18, 0x011c, %tick
	.word 0xb1e4218d  ! 3021: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb5e560fe  ! 3024: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb9e56046  ! 3028: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xbbe5a162  ! 3030: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xbbe5a18e  ! 3033: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xbebd0000  ! 3035: XNORcc_R	xnorcc 	%r20, %r0, %r31
	.word 0xb1e5a1d0  ! 3038: SAVE_I	save	%r22, 0x0001, %r24
	.word 0x8d95e02a  ! 3039: WRPR_PSTATE_I	wrpr	%r23, 0x002a, %pstate
	.word 0xbb518000  ! 3042: RDPR_PSTATE	<illegal instruction>
	.word 0xb1e5a06f  ! 3044: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb9e520aa  ! 3047: SAVE_I	save	%r20, 0x0001, %r28
	setx	data_start_1, %g1, %r21
	.word 0xb1e4201d  ! 3049: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xbf2d8000  ! 3053: SLL_R	sll 	%r22, %r0, %r31
	.word 0xb7e56174  ! 3054: SAVE_I	save	%r21, 0x0001, %r27
	.word 0x91952063  ! 3055: WRPR_PIL_I	wrpr	%r20, 0x0063, %pil
	.word 0xb751c000  ! 3061: RDPR_TL	<illegal instruction>
	.word 0xb12c7001  ! 3063: SLLX_I	sllx	%r17, 0x0001, %r24
	.word 0xb3e5a107  ! 3065: SAVE_I	save	%r22, 0x0001, %r25
	setx	0x30a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe421b8  ! 3068: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb7504000  ! 3073: RDPR_TNPC	<illegal instruction>
	.word 0xba054000  ! 3074: ADD_R	add 	%r21, %r0, %r29
	setx	0x1012a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30234, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e4e1d8  ! 3083: SAVE_I	save	%r19, 0x0001, %r25
	setx	0x10327, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e4a1b5  ! 3089: SAVE_I	save	%r18, 0x0001, %r27
	setx	0x2033c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb735d000  ! 3094: SRLX_R	srlx	%r23, %r0, %r27
	.word 0xb9e561b5  ! 3097: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xbde46177  ! 3098: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb5e52071  ! 3099: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xbe2de070  ! 3104: ANDN_I	andn 	%r23, 0x0070, %r31
	.word 0xb1e5603e  ! 3105: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb1e4e16d  ! 3108: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbfe52042  ! 3109: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xbf3c0000  ! 3111: SRA_R	sra 	%r16, %r0, %r31
	.word 0xbde4e009  ! 3113: SAVE_I	save	%r19, 0x0001, %r30
	.word 0x9194a0c0  ! 3114: WRPR_PIL_I	wrpr	%r18, 0x00c0, %pil
	.word 0xb5e46089  ! 3115: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb1508000  ! 3116: RDPR_TSTATE	<illegal instruction>
	.word 0xb1e520c8  ! 3121: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xbde4e049  ! 3123: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb1e5a130  ! 3127: SAVE_I	save	%r22, 0x0001, %r24
	.word 0x8994202e  ! 3128: WRPR_TICK_I	wrpr	%r16, 0x002e, %tick
	.word 0xb3e420a1  ! 3131: SAVE_I	save	%r16, 0x0001, %r25
	.word 0x8194a041  ! 3134: WRPR_TPC_I	wrpr	%r18, 0x0041, %tpc
	.word 0xbfe4a1ad  ! 3135: SAVE_I	save	%r18, 0x0001, %r31
	setx	0x2021a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde4a0b7  ! 3139: SAVE_I	save	%r18, 0x0001, %r30
	setx	data_start_5, %g1, %r18
	.word 0xb7e4a044  ! 3144: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xbde521b9  ! 3145: SAVE_I	save	%r20, 0x0001, %r30
	.word 0x8195a07f  ! 3148: WRPR_TPC_I	wrpr	%r22, 0x007f, %tpc
	.word 0xb550c000  ! 3150: RDPR_TT	<illegal instruction>
	.word 0xbbe5a08f  ! 3152: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb534f001  ! 3153: SRLX_I	srlx	%r19, 0x0001, %r26
	.word 0xb214a075  ! 3156: OR_I	or 	%r18, 0x0075, %r25
	.word 0xb5e5e087  ! 3157: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb9e5e02d  ! 3161: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb7e52169  ! 3163: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb9e42065  ! 3165: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb9e4e1c6  ! 3167: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xbbe5e0e0  ! 3169: SAVE_I	save	%r23, 0x0001, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb7e5a0d8  ! 3174: SAVE_I	save	%r22, 0x0001, %r27
	setx	0x18, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e5e029  ! 3178: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb3e5a10f  ! 3179: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb7e560ce  ! 3184: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb7508000  ! 3188: RDPR_TSTATE	<illegal instruction>
	.word 0xbfe5e1b6  ! 3189: SAVE_I	save	%r23, 0x0001, %r31
	ta	T_CHANGE_HPRIV
	.word 0x81983b83  ! 3193: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b83, %hpstate
	.word 0xbf3db001  ! 3196: SRAX_I	srax	%r22, 0x0001, %r31
	.word 0xb5518000  ! 3198: RDPR_PSTATE	<illegal instruction>
	.word 0xbfe421b6  ! 3199: SAVE_I	save	%r16, 0x0001, %r31
	.word 0x8994a0ea  ! 3203: WRPR_TICK_I	wrpr	%r18, 0x00ea, %tick
	.word 0xbde56174  ! 3204: SAVE_I	save	%r21, 0x0001, %r30
	setx	0x3033c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde5a1c6  ! 3206: SAVE_I	save	%r22, 0x0001, %r30
	setx	0x20226, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20114, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	0, %r14
	.word 0xa193a000  ! 3219: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb29c8000  ! 3220: XORcc_R	xorcc 	%r18, %r0, %r25
	.word 0xbfe4e197  ! 3221: SAVE_I	save	%r19, 0x0001, %r31
	.word 0x8594e023  ! 3223: WRPR_TSTATE_I	wrpr	%r19, 0x0023, %tstate
	.word 0xbbe42058  ! 3232: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xbfe42099  ! 3233: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xbde4217f  ! 3245: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb750c000  ! 3247: RDPR_TT	<illegal instruction>
	setx	0x20324, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3504000  ! 3255: RDPR_TNPC	<illegal instruction>
	.word 0xbf518000  ! 3256: RDPR_PSTATE	<illegal instruction>
	.word 0xb3e46024  ! 3259: SAVE_I	save	%r17, 0x0001, %r25
	setx	0x32e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e4a0cd  ! 3263: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb7e4618f  ! 3266: SAVE_I	save	%r17, 0x0001, %r27
	setx	0x20133, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x118, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_5, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xba048000  ! 3281: ADD_R	add 	%r18, %r0, %r29
	.word 0xbde5207a  ! 3285: SAVE_I	save	%r20, 0x0001, %r30
	.word 0x819560ca  ! 3289: WRPR_TPC_I	wrpr	%r21, 0x00ca, %tpc
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0x91946059  ! 3292: WRPR_PIL_I	wrpr	%r17, 0x0059, %pil
	.word 0xbf518000  ! 3293: RDPR_PSTATE	<illegal instruction>
	setx	0x20131, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe5610f  ! 3296: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb9e420a8  ! 3299: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xbde420af  ! 3301: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb1e5a128  ! 3303: SAVE_I	save	%r22, 0x0001, %r24
	.word 0x8194e049  ! 3306: WRPR_TPC_I	wrpr	%r19, 0x0049, %tpc
	.word 0xbde46098  ! 3307: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb8b44000  ! 3312: SUBCcc_R	orncc 	%r17, %r0, %r28
	.word 0xba1d4000  ! 3313: XOR_R	xor 	%r21, %r0, %r29
	.word 0xb5e5a1e3  ! 3316: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb1e5609a  ! 3317: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb3e56169  ! 3318: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb424e0cb  ! 3323: SUB_I	sub 	%r19, 0x00cb, %r26
	.word 0x8195617a  ! 3324: WRPR_TPC_I	wrpr	%r21, 0x017a, %tpc
	.word 0x899521ff  ! 3325: WRPR_TICK_I	wrpr	%r20, 0x01ff, %tick
	.word 0xbde5e104  ! 3327: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb3e52185  ! 3328: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb9e5e122  ! 3331: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xbde5e0fe  ! 3332: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb5e521f2  ! 3335: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xbd508000  ! 3338: RDPR_TSTATE	<illegal instruction>
	.word 0xb3e460ae  ! 3339: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb7e46039  ! 3340: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb5e46104  ! 3341: SAVE_I	save	%r17, 0x0001, %r26
	.word 0x91952129  ! 3342: WRPR_PIL_I	wrpr	%r20, 0x0129, %pil
	.word 0xbbe4e0b1  ! 3346: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb7e4a0e5  ! 3351: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb1e4e19e  ! 3352: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb950c000  ! 3356: RDPR_TT	<illegal instruction>
	.word 0xb1e5e031  ! 3361: SAVE_I	save	%r23, 0x0001, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb5e4618d  ! 3366: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xbf643801  ! 3370: MOVcc_I	<illegal instruction>
	.word 0xb9e521af  ! 3375: SAVE_I	save	%r20, 0x0001, %r28
	setx	0x3011c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe4201f  ! 3385: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb3e56084  ! 3386: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb1e5a1ea  ! 3396: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb5e4a15c  ! 3399: SAVE_I	save	%r18, 0x0001, %r26
	setx	0x31, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe521c7  ! 3405: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb3e42175  ! 3409: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb5e521a4  ! 3417: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xbc85c000  ! 3426: ADDcc_R	addcc 	%r23, %r0, %r30
	.word 0xbde5a19d  ! 3431: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb7520000  ! 3439: RDPR_PIL	<illegal instruction>
	.word 0xb3e56045  ! 3440: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb1e46006  ! 3442: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xbde5e024  ! 3443: SAVE_I	save	%r23, 0x0001, %r30
	setx	data_start_1, %g1, %r16
	.word 0xb7e52109  ! 3446: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xbde52055  ! 3448: SAVE_I	save	%r20, 0x0001, %r30
	ta	T_CHANGE_HPRIV
	.word 0x81983959  ! 3450: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1959, %hpstate
	.word 0xb3e521f5  ! 3452: SAVE_I	save	%r20, 0x0001, %r25
	setx	0x20117, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb518000  ! 3459: RDPR_PSTATE	<illegal instruction>
	.word 0xb9e461c2  ! 3461: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xbac44000  ! 3462: ADDCcc_R	addccc 	%r17, %r0, %r29
	.word 0xb49ce1af  ! 3463: XORcc_I	xorcc 	%r19, 0x01af, %r26
	setx	0x129, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e4a0e8  ! 3474: SAVE_I	save	%r18, 0x0001, %r24
	setx	0x3020b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5518000  ! 3477: RDPR_PSTATE	<illegal instruction>
	.word 0xb3e420fa  ! 3478: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb9e461e5  ! 3480: SAVE_I	save	%r17, 0x0001, %r28
	.word 0x8994e0f5  ! 3481: WRPR_TICK_I	wrpr	%r19, 0x00f5, %tick
	.word 0xbde5617c  ! 3488: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb1e4606a  ! 3496: SAVE_I	save	%r17, 0x0001, %r24
	ta	T_CHANGE_HPRIV
	.word 0x81982cd9  ! 3498: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cd9, %hpstate
	.word 0xb6ac2162  ! 3503: ANDNcc_I	andncc 	%r16, 0x0162, %r27
	.word 0xb1510000  ! 3505: RDPR_TICK	<illegal instruction>
	.word 0xbfe4a091  ! 3508: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb7e5206a  ! 3517: SAVE_I	save	%r20, 0x0001, %r27
	setx	data_start_5, %g1, %r17
	.word 0xbde5a016  ! 3522: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb1e5610a  ! 3524: SAVE_I	save	%r21, 0x0001, %r24
	setx	0x20130, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb518000  ! 3528: RDPR_PSTATE	<illegal instruction>
	.word 0xbbe56027  ! 3529: SAVE_I	save	%r21, 0x0001, %r29
	setx	0x3030c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d94a053  ! 3532: WRPR_PSTATE_I	wrpr	%r18, 0x0053, %pstate
	.word 0xb9510000  ! 3539: RDPR_TICK	<illegal instruction>
	.word 0xb7e4601d  ! 3540: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xbb50c000  ! 3544: RDPR_TT	<illegal instruction>
	.word 0xbfe5a002  ! 3546: SAVE_I	save	%r22, 0x0001, %r31
	.word 0x8794206c  ! 3547: WRPR_TT_I	wrpr	%r16, 0x006c, %tt
	.word 0xbb540000  ! 3550: RDPR_GL	<illegal instruction>
	.word 0xb7e4a096  ! 3551: SAVE_I	save	%r18, 0x0001, %r27
	.word 0x8594a0a6  ! 3560: WRPR_TSTATE_I	wrpr	%r18, 0x00a6, %tstate
	.word 0xb7e5e120  ! 3562: SAVE_I	save	%r23, 0x0001, %r27
	.word 0x83942033  ! 3567: WRPR_TNPC_I	wrpr	%r16, 0x0033, %tnpc
	mov	1, %r12
	.word 0x8f932000  ! 3568: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0x8594616d  ! 3570: WRPR_TSTATE_I	wrpr	%r17, 0x016d, %tstate
	.word 0xb03c4000  ! 3572: XNOR_R	xnor 	%r17, %r0, %r24
	.word 0xb9e5e144  ! 3575: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xbf341000  ! 3576: SRLX_R	srlx	%r16, %r0, %r31
	.word 0xbbe4a06b  ! 3583: SAVE_I	save	%r18, 0x0001, %r29
	.word 0x8195e052  ! 3584: WRPR_TPC_I	wrpr	%r23, 0x0052, %tpc
	.word 0xb214c000  ! 3587: OR_R	or 	%r19, %r0, %r25
	.word 0xb334c000  ! 3590: SRL_R	srl 	%r19, %r0, %r25
	.word 0xb5508000  ! 3591: RDPR_TSTATE	<illegal instruction>
	setx	0x20205, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x81942112  ! 3595: WRPR_TPC_I	wrpr	%r16, 0x0112, %tpc
	.word 0xb9e5217e  ! 3596: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb4ad606b  ! 3602: ANDNcc_I	andncc 	%r21, 0x006b, %r26
	.word 0x839560fd  ! 3603: WRPR_TNPC_I	wrpr	%r21, 0x00fd, %tnpc
	.word 0xb1e521b2  ! 3606: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb7e46092  ! 3607: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xbfe46168  ! 3609: SAVE_I	save	%r17, 0x0001, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbde4e16f  ! 3613: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xbde5e1df  ! 3614: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xbd50c000  ! 3615: RDPR_TT	<illegal instruction>
	.word 0xb9e460cd  ! 3619: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb7e5a1cc  ! 3624: SAVE_I	save	%r22, 0x0001, %r27
	mov	0, %r12
	.word 0x8f932000  ! 3625: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0x839420be  ! 3626: WRPR_TNPC_I	wrpr	%r16, 0x00be, %tnpc
	.word 0xb1520000  ! 3627: RDPR_PIL	<illegal instruction>
	.word 0xbfe4e1da  ! 3629: SAVE_I	save	%r19, 0x0001, %r31
	setx	data_start_7, %g1, %r18
	.word 0x8595a039  ! 3633: WRPR_TSTATE_I	wrpr	%r22, 0x0039, %tstate
	setx	data_start_5, %g1, %r16
	.word 0xb1e4e0a0  ! 3636: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbbe561bc  ! 3637: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb5e520cb  ! 3641: SAVE_I	save	%r20, 0x0001, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbde5a094  ! 3647: SAVE_I	save	%r22, 0x0001, %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbfe46031  ! 3650: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb5e5218d  ! 3653: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xbfe4e123  ! 3654: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb3e46127  ! 3655: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbde5a07a  ! 3656: SAVE_I	save	%r22, 0x0001, %r30
	.word 0x8395e0f6  ! 3660: WRPR_TNPC_I	wrpr	%r23, 0x00f6, %tnpc
	setx	0x2033c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3500000  ! 3665: RDPR_TPC	<illegal instruction>
	setx	0x23, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbc252003  ! 3672: SUB_I	sub 	%r20, 0x0003, %r30
	.word 0xbb510000  ! 3676: RDPR_TICK	<illegal instruction>
	.word 0xbde521cf  ! 3679: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb1e5200c  ! 3680: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb684c000  ! 3681: ADDcc_R	addcc 	%r19, %r0, %r27
	setx	0x217, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10229, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe5a00c  ! 3691: SAVE_I	save	%r22, 0x0001, %r31
	.word 0x8d95e023  ! 3692: WRPR_PSTATE_I	wrpr	%r23, 0x0023, %pstate
	setx	0x10323, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe4a1c4  ! 3700: SAVE_I	save	%r18, 0x0001, %r31
	.word 0x8995a1b8  ! 3701: WRPR_TICK_I	wrpr	%r22, 0x01b8, %tick
	.word 0xb5e460d0  ! 3703: SAVE_I	save	%r17, 0x0001, %r26
	setx	data_start_2, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbde4a196  ! 3707: SAVE_I	save	%r18, 0x0001, %r30
	setx	0x1032f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9e56101  ! 3710: SAVE_I	save	%r21, 0x0001, %r28
	.word 0x9195a1f4  ! 3712: WRPR_PIL_I	wrpr	%r22, 0x01f4, %pil
	ta	T_CHANGE_HPRIV
	.word 0x81983e59  ! 3713: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e59, %hpstate
	.word 0xba1d4000  ! 3717: XOR_R	xor 	%r21, %r0, %r29
	.word 0xb7e5a1f7  ! 3718: SAVE_I	save	%r22, 0x0001, %r27
	setx	0x2002b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e46012  ! 3726: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb9e4e0ab  ! 3727: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xbd35e001  ! 3731: SRL_I	srl 	%r23, 0x0001, %r30
	setx	data_start_6, %g1, %r20
	.word 0x85956031  ! 3737: WRPR_TSTATE_I	wrpr	%r21, 0x0031, %tstate
	.word 0xb424c000  ! 3738: SUB_R	sub 	%r19, %r0, %r26
	.word 0xbb520000  ! 3739: RDPR_PIL	<illegal instruction>
	.word 0xb6bca0f4  ! 3740: XNORcc_I	xnorcc 	%r18, 0x00f4, %r27
	setx	0x10c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3520000  ! 3744: RDPR_PIL	<illegal instruction>
	.word 0xbbe52168  ! 3746: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xbde5a09a  ! 3751: SAVE_I	save	%r22, 0x0001, %r30
	.word 0x9195612d  ! 3754: WRPR_PIL_I	wrpr	%r21, 0x012d, %pil
	.word 0xbfe4a02c  ! 3755: SAVE_I	save	%r18, 0x0001, %r31
	setx	0x33b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e5a0d7  ! 3758: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb5e561a2  ! 3763: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb9e560f0  ! 3764: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xbbe5619d  ! 3774: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb83c2140  ! 3778: XNOR_I	xnor 	%r16, 0x0140, %r28
	.word 0x899520b4  ! 3783: WRPR_TICK_I	wrpr	%r20, 0x00b4, %tick
	.word 0xb5520000  ! 3784: RDPR_PIL	<illegal instruction>
	setx	0x310, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf518000  ! 3792: RDPR_PSTATE	<illegal instruction>
	setx	0x2012a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e52111  ! 3798: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb5e461a3  ! 3799: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xbde42058  ! 3807: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb151c000  ! 3809: RDPR_TL	<illegal instruction>
	.word 0xb5e4a176  ! 3810: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xb0a58000  ! 3813: SUBcc_R	subcc 	%r22, %r0, %r24
	.word 0xbf2d6001  ! 3818: SLL_I	sll 	%r21, 0x0001, %r31
	.word 0xbd500000  ! 3820: RDPR_TPC	<illegal instruction>
	.word 0xb5e5a014  ! 3823: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb9e460b4  ! 3825: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb9508000  ! 3826: RDPR_TSTATE	<illegal instruction>
	.word 0xbfe56193  ! 3828: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xbbe4a0f9  ! 3831: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb3e46127  ! 3835: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb7e561b8  ! 3837: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb9e560a4  ! 3838: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb7e5618d  ! 3839: SAVE_I	save	%r21, 0x0001, %r27
	setx	data_start_3, %g1, %r20
	setx	data_start_6, %g1, %r22
	setx	0x20e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e5601a  ! 3852: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xbfe56086  ! 3856: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb1e5a196  ! 3859: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb5e5e148  ! 3861: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb2c50000  ! 3864: ADDCcc_R	addccc 	%r20, %r0, %r25
	setx	0x20206, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe4e0c1  ! 3871: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb3e4217c  ! 3873: SAVE_I	save	%r16, 0x0001, %r25
	.word 0x83942105  ! 3876: WRPR_TNPC_I	wrpr	%r16, 0x0105, %tnpc
	setx	0x2, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb80ce00b  ! 3878: AND_I	and 	%r19, 0x000b, %r28
	.word 0x9194a09f  ! 3881: WRPR_PIL_I	wrpr	%r18, 0x009f, %pil
	.word 0xbbe56119  ! 3887: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb095a078  ! 3890: ORcc_I	orcc 	%r22, 0x0078, %r24
	.word 0xb5e5e0b0  ! 3892: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xbfe46055  ! 3895: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xbde561d6  ! 3897: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb7e5e0fa  ! 3898: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb7e4e18a  ! 3904: SAVE_I	save	%r19, 0x0001, %r27
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb73c0000  ! 3906: SRA_R	sra 	%r16, %r0, %r27
	.word 0xbbe5e0f8  ! 3907: SAVE_I	save	%r23, 0x0001, %r29
	mov	0, %r14
	.word 0xa193a000  ! 3909: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	data_start_5, %g1, %r19
	.word 0xb7e4e001  ! 3912: SAVE_I	save	%r19, 0x0001, %r27
	setx	0x31d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e5e127  ! 3916: SAVE_I	save	%r23, 0x0001, %r25
	mov	0, %r14
	.word 0xa193a000  ! 3919: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0x879461c7  ! 3921: WRPR_TT_I	wrpr	%r17, 0x01c7, %tt
	.word 0xb9e4206b  ! 3922: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb3e5a007  ! 3923: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xbde4a13c  ! 3925: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb7510000  ! 3927: RDPR_TICK	<illegal instruction>
	.word 0xbfe4e01e  ! 3931: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb7e56070  ! 3936: SAVE_I	save	%r21, 0x0001, %r27
	.word 0x87952130  ! 3942: WRPR_TT_I	wrpr	%r20, 0x0130, %tt
	.word 0xbde5e06b  ! 3947: SAVE_I	save	%r23, 0x0001, %r30
	setx	0x10124, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e4604e  ! 3951: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb351c000  ! 3954: RDPR_TL	<illegal instruction>
	.word 0x8594e1b0  ! 3955: WRPR_TSTATE_I	wrpr	%r19, 0x01b0, %tstate
	.word 0xb5e52065  ! 3957: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xbfe420ab  ! 3960: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xbb500000  ! 3961: RDPR_TPC	<illegal instruction>
	.word 0xbde4a073  ! 3962: SAVE_I	save	%r18, 0x0001, %r30
	.word 0x859461f2  ! 3963: WRPR_TSTATE_I	wrpr	%r17, 0x01f2, %tstate
	setx	0x21a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9e461bf  ! 3967: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb7e5e148  ! 3970: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb1e4a1d9  ! 3971: SAVE_I	save	%r18, 0x0001, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb150c000  ! 3976: RDPR_TT	<illegal instruction>
	.word 0xb1508000  ! 3982: RDPR_TSTATE	<illegal instruction>
	.word 0xbc3dc000  ! 3989: XNOR_R	xnor 	%r23, %r0, %r30
	.word 0xb1e4612d  ! 3991: SAVE_I	save	%r17, 0x0001, %r24
	setx	0x3b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9e5a099  ! 3999: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xbbe5e1a4  ! 4002: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb1e4a190  ! 4003: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb7e4a0f4  ! 4004: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb3e5202d  ! 4005: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xbfe52012  ! 4007: SAVE_I	save	%r20, 0x0001, %r31
	ta	T_CHANGE_HPRIV
	.word 0x81983f53  ! 4008: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f53, %hpstate
	setx	0x7, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e4a1f1  ! 4016: SAVE_I	save	%r18, 0x0001, %r24
	.word 0x8795a0d9  ! 4018: WRPR_TT_I	wrpr	%r22, 0x00d9, %tt
	setx	data_start_3, %g1, %r17
	setx	0x1003c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e5e08a  ! 4022: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xbbe4208d  ! 4023: SAVE_I	save	%r16, 0x0001, %r29
	setx	0x12, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e460be  ! 4026: SAVE_I	save	%r17, 0x0001, %r25
	ta	T_CHANGE_HPRIV
	.word 0x81983ac3  ! 4027: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ac3, %hpstate
	.word 0xbaad4000  ! 4028: ANDNcc_R	andncc 	%r21, %r0, %r29
	setx	0x3000f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e4e185  ! 4030: SAVE_I	save	%r19, 0x0001, %r27
	setx	0x30111, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3500000  ! 4035: RDPR_TPC	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81982a51  ! 4036: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a51, %hpstate
	.word 0xb1e56111  ! 4037: SAVE_I	save	%r21, 0x0001, %r24
	setx	0x20326, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3500000  ! 4041: RDPR_TPC	<illegal instruction>
	.word 0xb40d4000  ! 4044: AND_R	and 	%r21, %r0, %r26
	.word 0xbfe4e1a8  ! 4051: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xbfe460da  ! 4052: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xbb510000  ! 4055: RDPR_TICK	<illegal instruction>
	.word 0xbde561ff  ! 4056: SAVE_I	save	%r21, 0x0001, %r30
	ta	T_CHANGE_HPRIV
	.word 0x81983919  ! 4057: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1919, %hpstate
	.word 0xbbe461bf  ! 4058: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb9e4e00f  ! 4061: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xbfe5a1f5  ! 4063: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xbfe561b0  ! 4065: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xbde5e159  ! 4068: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xbde4608c  ! 4070: SAVE_I	save	%r17, 0x0001, %r30
	setx	data_start_7, %g1, %r16
	.word 0xb9520000  ! 4076: RDPR_PIL	<illegal instruction>
	.word 0xb3e520a7  ! 4079: SAVE_I	save	%r20, 0x0001, %r25
	setx	0x10211, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe4e026  ! 4091: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb1e4a162  ! 4096: SAVE_I	save	%r18, 0x0001, %r24
	setx	0x2010b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e5a182  ! 4108: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xbd510000  ! 4109: RDPR_TICK	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81983e91  ! 4112: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e91, %hpstate
	.word 0xb3e461ac  ! 4116: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb9500000  ! 4119: RDPR_TPC	<illegal instruction>
	.word 0xbde4e13e  ! 4123: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb7e46058  ! 4125: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb1e4e1ed  ! 4126: SAVE_I	save	%r19, 0x0001, %r24
	setx	0x2021f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde46145  ! 4137: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb9e52054  ! 4143: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb1e46134  ! 4146: SAVE_I	save	%r17, 0x0001, %r24
	mov	2, %r12
	.word 0x8f932000  ! 4153: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	mov	0, %r12
	.word 0x8f932000  ! 4157: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	0x3030d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81983e99  ! 4160: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e99, %hpstate
	setx	0x2021b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x859420d4  ! 4165: WRPR_TSTATE_I	wrpr	%r16, 0x00d4, %tstate
	ta	T_CHANGE_HPRIV
	.word 0x81982a13  ! 4167: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a13, %hpstate
	.word 0xb1510000  ! 4168: RDPR_TICK	<illegal instruction>
	.word 0xb1e5a02e  ! 4169: SAVE_I	save	%r22, 0x0001, %r24
	.word 0x8594609a  ! 4170: WRPR_TSTATE_I	wrpr	%r17, 0x009a, %tstate
	ta	T_CHANGE_HPRIV
	.word 0x81982dc3  ! 4171: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dc3, %hpstate
	setx	0x20038, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb8c5e12b  ! 4174: ADDCcc_I	addccc 	%r23, 0x012b, %r28
	setx	0x228, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e4a1c6  ! 4180: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xbb480000  ! 4185: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xb1e4618e  ! 4190: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xbabca0cf  ! 4191: XNORcc_I	xnorcc 	%r18, 0x00cf, %r29
	.word 0xb93ca001  ! 4192: SRA_I	sra 	%r18, 0x0001, %r28
	.word 0xb7e5214e  ! 4195: SAVE_I	save	%r20, 0x0001, %r27
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb4ad8000  ! 4197: ANDNcc_R	andncc 	%r22, %r0, %r26
	.word 0xbfe56002  ! 4198: SAVE_I	save	%r21, 0x0001, %r31
	setx	0x20134, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe52177  ! 4202: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xbde56098  ! 4208: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb1e5e19b  ! 4209: SAVE_I	save	%r23, 0x0001, %r24
	setx	data_start_0, %g1, %r19
	.word 0xb5e4619b  ! 4211: SAVE_I	save	%r17, 0x0001, %r26
	setx	data_start_7, %g1, %r22
	.word 0xb7e4a039  ! 4217: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xbf480000  ! 4218: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xbd540000  ! 4221: RDPR_GL	<illegal instruction>
	.word 0xbd51c000  ! 4225: RDPR_TL	<illegal instruction>
	setx	0x10117, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8795e065  ! 4229: WRPR_TT_I	wrpr	%r23, 0x0065, %tt
	setx	0x30127, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe4e1b0  ! 4232: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb3e5e052  ! 4233: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb535e001  ! 4236: SRL_I	srl 	%r23, 0x0001, %r26
	setx	0x10e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbc0de122  ! 4238: AND_I	and 	%r23, 0x0122, %r30
	.word 0xb7e5a117  ! 4242: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb1e5a15b  ! 4244: SAVE_I	save	%r22, 0x0001, %r24
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb5e5a046  ! 4247: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb151c000  ! 4252: RDPR_TL	<illegal instruction>
	.word 0xb5518000  ! 4253: RDPR_PSTATE	<illegal instruction>
	.word 0xb7e4207e  ! 4257: SAVE_I	save	%r16, 0x0001, %r27
	setx	0x30005, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5e460c6  ! 4265: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xbde4e0f2  ! 4270: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb1e5203a  ! 4272: SAVE_I	save	%r20, 0x0001, %r24
	setx	data_start_6, %g1, %r17
	.word 0xb5e4e112  ! 4281: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb7e5e118  ! 4282: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xbbe5a029  ! 4283: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb5e46144  ! 4285: SAVE_I	save	%r17, 0x0001, %r26
	setx	0x1021b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9e56050  ! 4292: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb7504000  ! 4293: RDPR_TNPC	<illegal instruction>
	.word 0xbbe5e04d  ! 4297: SAVE_I	save	%r23, 0x0001, %r29
	.word 0x83946096  ! 4298: WRPR_TNPC_I	wrpr	%r17, 0x0096, %tnpc
	.word 0xb1e5e152  ! 4301: SAVE_I	save	%r23, 0x0001, %r24
	setx	0x30333, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb550c000  ! 4304: RDPR_TT	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb3e46018  ! 4314: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb3520000  ! 4317: RDPR_PIL	<illegal instruction>
	setx	0x309, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe5a032  ! 4321: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xbf520000  ! 4322: RDPR_PIL	<illegal instruction>
	.word 0xb751c000  ! 4324: RDPR_TL	<illegal instruction>
	.word 0xb5e520e8  ! 4326: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb7500000  ! 4331: RDPR_TPC	<illegal instruction>
	setx	0x10328, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe46162  ! 4334: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xbde5613a  ! 4336: SAVE_I	save	%r21, 0x0001, %r30
	setx	0x30337, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe5a1bc  ! 4339: SAVE_I	save	%r22, 0x0001, %r31
	setx	data_start_1, %g1, %r17
	.word 0xbbe460f2  ! 4345: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xbbe5e007  ! 4352: SAVE_I	save	%r23, 0x0001, %r29
	setx	0x331, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x9195a145  ! 4356: WRPR_PIL_I	wrpr	%r22, 0x0145, %pil
	.word 0xbbe56194  ! 4358: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xbbe46198  ! 4360: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb5e5e055  ! 4362: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb5e5614d  ! 4363: SAVE_I	save	%r21, 0x0001, %r26
	setx	0x20101, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e5a004  ! 4366: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xbde4a179  ! 4368: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xba3dc000  ! 4369: XNOR_R	xnor 	%r23, %r0, %r29
	setx	0x20327, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3e420c5  ! 4376: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb1e4a072  ! 4379: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb3e42037  ! 4383: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb3518000  ! 4385: RDPR_PSTATE	<illegal instruction>
	.word 0xb7e561d0  ! 4387: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb5e5606f  ! 4388: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb1e42120  ! 4390: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xba254000  ! 4393: SUB_R	sub 	%r21, %r0, %r29
	.word 0x9194217f  ! 4397: WRPR_PIL_I	wrpr	%r16, 0x017f, %pil
	setx	data_start_3, %g1, %r21
	.word 0xb551c000  ! 4400: RDPR_TL	<illegal instruction>
	.word 0xb9508000  ! 4401: RDPR_TSTATE	<illegal instruction>
	.word 0xb1e5600e  ! 4403: SAVE_I	save	%r21, 0x0001, %r24
	setx	0x305, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe4a18e  ! 4405: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xbb500000  ! 4410: RDPR_TPC	<illegal instruction>
	.word 0x8394e13c  ! 4413: WRPR_TNPC_I	wrpr	%r19, 0x013c, %tnpc
	.word 0xbd480000  ! 4417: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	setx	0x123, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e4a0d7  ! 4431: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb3e560c3  ! 4434: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb9e4a0e3  ! 4436: SAVE_I	save	%r18, 0x0001, %r28
	setx	0x21f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde42123  ! 4438: SAVE_I	save	%r16, 0x0001, %r30
	setx	0x2002b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1e5a075  ! 4442: SAVE_I	save	%r22, 0x0001, %r24
	.word 0x8995e077  ! 4444: WRPR_TICK_I	wrpr	%r23, 0x0077, %tick
	ta	T_CHANGE_HPRIV
	.word 0x81983f19  ! 4445: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f19, %hpstate
	setx	0x10210, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe5e0af  ! 4451: SAVE_I	save	%r23, 0x0001, %r31
	setx	0x2033d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e520d8  ! 4456: SAVE_I	save	%r20, 0x0001, %r27
	ta	T_CHANGE_HPRIV
	.word 0x81982f0b  ! 4457: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f0b, %hpstate
	.word 0xb9e4e145  ! 4459: SAVE_I	save	%r19, 0x0001, %r28
	.word 0x8794a1ff  ! 4460: WRPR_TT_I	wrpr	%r18, 0x01ff, %tt
	.word 0xbde5a0f3  ! 4461: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb1540000  ! 4463: RDPR_GL	<illegal instruction>
	.word 0xbd2de001  ! 4465: SLL_I	sll 	%r23, 0x0001, %r30
	.word 0xb3e42074  ! 4466: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xbbe4e091  ! 4468: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb3e56069  ! 4469: SAVE_I	save	%r21, 0x0001, %r25
	setx	0x3001c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10031, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb0440000  ! 4474: ADDC_R	addc 	%r16, %r0, %r24
	.word 0xbde5e0c4  ! 4475: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xbde5218e  ! 4476: SAVE_I	save	%r20, 0x0001, %r30
	.word 0x8d9520b8  ! 4477: WRPR_PSTATE_I	wrpr	%r20, 0x00b8, %pstate
	.word 0xb3e42040  ! 4479: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb1e4a193  ! 4480: SAVE_I	save	%r18, 0x0001, %r24
	setx	0x30225, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x1000d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb6c54000  ! 4497: ADDCcc_R	addccc 	%r21, %r0, %r27
	.word 0xbfe46191  ! 4498: SAVE_I	save	%r17, 0x0001, %r31
	.word 0x839520d1  ! 4499: WRPR_TNPC_I	wrpr	%r20, 0x00d1, %tnpc
	.word 0xba9dc000  ! 4500: XORcc_R	xorcc 	%r23, %r0, %r29
	setx	0x30216, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe5601b  ! 4507: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xbde560db  ! 4508: SAVE_I	save	%r21, 0x0001, %r30
	.word 0x8995e1bd  ! 4510: WRPR_TICK_I	wrpr	%r23, 0x01bd, %tick
	.word 0xb350c000  ! 4511: RDPR_TT	<illegal instruction>
	.word 0xbfe4e1ae  ! 4512: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb97d2401  ! 4513: MOVR_I	movre	%r20, 0x1, %r28
	.word 0xb7641800  ! 4515: MOVcc_R	<illegal instruction>
	.word 0xb93c5000  ! 4516: SRAX_R	srax	%r17, %r0, %r28
	.word 0xbde420c3  ! 4518: SAVE_I	save	%r16, 0x0001, %r30
	.word 0x85956050  ! 4519: WRPR_TSTATE_I	wrpr	%r21, 0x0050, %tstate
	setx	0x30134, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8595e1b5  ! 4523: WRPR_TSTATE_I	wrpr	%r23, 0x01b5, %tstate
	.word 0xb5e521b7  ! 4530: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xbfe42051  ! 4532: SAVE_I	save	%r16, 0x0001, %r31
	.word 0x899461e7  ! 4535: WRPR_TICK_I	wrpr	%r17, 0x01e7, %tick
	setx	0x10122, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe561ae  ! 4540: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xbfe4616a  ! 4544: SAVE_I	save	%r17, 0x0001, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb7e4e1ba  ! 4547: SAVE_I	save	%r19, 0x0001, %r27
	setx	0x10012, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e42097  ! 4553: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xbbe5e1c9  ! 4554: SAVE_I	save	%r23, 0x0001, %r29
	setx	0x10203, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde4a14d  ! 4564: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xbaaca08d  ! 4570: ANDNcc_I	andncc 	%r18, 0x008d, %r29
	.word 0xbde420d9  ! 4571: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xbbe52110  ! 4572: SAVE_I	save	%r20, 0x0001, %r29
	setx	0x22, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb09d0000  ! 4575: XORcc_R	xorcc 	%r20, %r0, %r24
	.word 0xb7e461db  ! 4576: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb7e5a17e  ! 4577: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb5e5a17c  ! 4578: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb7e56178  ! 4583: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb3e561f7  ! 4592: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb934b001  ! 4597: SRLX_I	srlx	%r18, 0x0001, %r28
	.word 0xb1e5a1be  ! 4602: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb7e5605b  ! 4603: SAVE_I	save	%r21, 0x0001, %r27
	setx	0x10002, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3480000  ! 4608: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xb1e420e4  ! 4609: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb9e56025  ! 4611: SAVE_I	save	%r21, 0x0001, %r28
	setx	0x313, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde52013  ! 4618: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb5e5a054  ! 4621: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb9e5a086  ! 4627: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xbcb56032  ! 4631: ORNcc_I	orncc 	%r21, 0x0032, %r30
	.word 0xbde46084  ! 4632: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbc9561ec  ! 4634: ORcc_I	orcc 	%r21, 0x01ec, %r30
	.word 0xb7540000  ! 4637: RDPR_GL	<illegal instruction>
	setx	0x3020f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x33e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb88da1b6  ! 4657: ANDcc_I	andcc 	%r22, 0x01b6, %r28
	.word 0xbde420bd  ! 4658: SAVE_I	save	%r16, 0x0001, %r30
	setx	0x30328, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9500000  ! 4667: RDPR_TPC	<illegal instruction>
	.word 0xb5e4e05e  ! 4668: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb5e4a1ce  ! 4672: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xbde4e056  ! 4673: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xbde56053  ! 4674: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb5e52010  ! 4675: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb7e4a144  ! 4679: SAVE_I	save	%r18, 0x0001, %r27
	mov	1, %r14
	.word 0xa193a000  ! 4680: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb7348000  ! 4681: SRL_R	srl 	%r18, %r0, %r27
	.word 0xbc3d8000  ! 4684: XNOR_R	xnor 	%r22, %r0, %r30
	setx	0x20208, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbc15c000  ! 4688: OR_R	or 	%r23, %r0, %r30
	.word 0xb3e4e176  ! 4689: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb9508000  ! 4691: RDPR_TSTATE	<illegal instruction>
	.word 0xb350c000  ! 4694: RDPR_TT	<illegal instruction>
	.word 0xb3540000  ! 4696: RDPR_GL	<illegal instruction>
	.word 0xb3e4e002  ! 4700: SAVE_I	save	%r19, 0x0001, %r25
	setx	0x1003a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde46114  ! 4706: SAVE_I	save	%r17, 0x0001, %r30
	setx	data_start_0, %g1, %r17
	.word 0xbb50c000  ! 4708: RDPR_TT	<illegal instruction>
	.word 0xb3520000  ! 4712: RDPR_PIL	<illegal instruction>
	.word 0xb7e560d7  ! 4714: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb5540000  ! 4715: RDPR_GL	<illegal instruction>
	.word 0xb834a1f0  ! 4724: SUBC_I	orn 	%r18, 0x01f0, %r28
	.word 0xb7e4a17b  ! 4725: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xba3da177  ! 4726: XNOR_I	xnor 	%r22, 0x0177, %r29
	.word 0xb3520000  ! 4727: RDPR_PIL	<illegal instruction>
	.word 0xb5e56094  ! 4728: SAVE_I	save	%r21, 0x0001, %r26
	setx	0x20219, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbde42196  ! 4730: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb9e5e1b8  ! 4732: SAVE_I	save	%r23, 0x0001, %r28
	setx	0x233, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbe42042  ! 4734: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb9e420a3  ! 4737: SAVE_I	save	%r16, 0x0001, %r28
	.word 0x8995e07d  ! 4738: WRPR_TICK_I	wrpr	%r23, 0x007d, %tick
	setx	0x20229, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe4e14a  ! 4740: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb7e561d2  ! 4741: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb5e560da  ! 4742: SAVE_I	save	%r21, 0x0001, %r26
	.word 0x8195a006  ! 4745: WRPR_TPC_I	wrpr	%r22, 0x0006, %tpc
	.word 0xbbe5e11f  ! 4746: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xbfe46049  ! 4749: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xbde460fa  ! 4752: SAVE_I	save	%r17, 0x0001, %r30
	.word 0x9194a0fc  ! 4753: WRPR_PIL_I	wrpr	%r18, 0x00fc, %pil
	.word 0xb234617f  ! 4758: SUBC_I	orn 	%r17, 0x017f, %r25
	.word 0xb3e5e053  ! 4759: SAVE_I	save	%r23, 0x0001, %r25
	setx	0x30001, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e421fd  ! 4761: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb3e52163  ! 4764: SAVE_I	save	%r20, 0x0001, %r25
	setx	0x20f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe46151  ! 4771: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb5e46008  ! 4774: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb7e42037  ! 4775: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb9e4a1c5  ! 4778: SAVE_I	save	%r18, 0x0001, %r28
	mov	0, %r12
	.word 0x8f932000  ! 4782: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbde46077  ! 4784: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb3510000  ! 4788: RDPR_TICK	<illegal instruction>
	.word 0xbfe4e1b8  ! 4789: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xbbe46071  ! 4792: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xbbe561a0  ! 4794: SAVE_I	save	%r21, 0x0001, %r29
	setx	data_start_4, %g1, %r17
	.word 0xb9641800  ! 4799: MOVcc_R	<illegal instruction>
	.word 0xbd3d4000  ! 4812: SRA_R	sra 	%r21, %r0, %r30
	.word 0xb7e421b3  ! 4813: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xbb510000  ! 4814: RDPR_TICK	<illegal instruction>
	setx	0x30337, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9508000  ! 4817: RDPR_TSTATE	<illegal instruction>
	.word 0x8194e0f5  ! 4819: WRPR_TPC_I	wrpr	%r19, 0x00f5, %tpc
	.word 0x8995a149  ! 4820: WRPR_TICK_I	wrpr	%r22, 0x0149, %tick
	.word 0xbf50c000  ! 4821: RDPR_TT	<illegal instruction>
	setx	0x3000e, %g1, %o0
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
	.word 0xbfe4a159  ! 4826: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb9e5a0ae  ! 4827: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb3e52171  ! 4829: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb5e46123  ! 4831: SAVE_I	save	%r17, 0x0001, %r26
	.word 0x839560e4  ! 4832: WRPR_TNPC_I	wrpr	%r21, 0x00e4, %tnpc
	setx	data_start_6, %g1, %r16
	.word 0xb7e42139  ! 4838: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb3e4e100  ! 4842: SAVE_I	save	%r19, 0x0001, %r25
	setx	0x2011f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfe461f2  ! 4850: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xbbe4e1ce  ! 4854: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xbde4a09a  ! 4856: SAVE_I	save	%r18, 0x0001, %r30
	mov	1, %r14
	.word 0xa193a000  ! 4858: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb6944000  ! 4859: ORcc_R	orcc 	%r17, %r0, %r27
	.word 0xb1e5a130  ! 4864: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb9e5611d  ! 4866: SAVE_I	save	%r21, 0x0001, %r28
	setx	0x10006, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb32c9000  ! 4871: SLLX_R	sllx	%r18, %r0, %r25
	.word 0xbde4a1ce  ! 4872: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xbe8d2124  ! 4874: ANDcc_I	andcc 	%r20, 0x0124, %r31
	.word 0xbd500000  ! 4877: RDPR_TPC	<illegal instruction>
	setx	0x20301, %g1, %o0
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
	setx	0x20133, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_5, %g1, %r16
	.word 0xb3e521a7  ! 4888: SAVE_I	save	%r20, 0x0001, %r25
	.word 0x8394e05c  ! 4892: WRPR_TNPC_I	wrpr	%r19, 0x005c, %tnpc
	.word 0xbde4e1f3  ! 4894: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb7e42103  ! 4895: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xbabd8000  ! 4897: XNORcc_R	xnorcc 	%r22, %r0, %r29
	.word 0xb1e561ca  ! 4900: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb7e5a1a1  ! 4901: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb551c000  ! 4902: RDPR_TL	<illegal instruction>
	.word 0x8795a0c6  ! 4907: WRPR_TT_I	wrpr	%r22, 0x00c6, %tt
	.word 0xbd3c6001  ! 4908: SRA_I	sra 	%r17, 0x0001, %r30
	.word 0xbfe52059  ! 4910: SAVE_I	save	%r20, 0x0001, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	.word 0x81982941  ! 4916: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0941, %hpstate
	.word 0x83952104  ! 4919: WRPR_TNPC_I	wrpr	%r20, 0x0104, %tnpc
	.word 0xb7e5e16e  ! 4922: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xbbe560a3  ! 4925: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xbd3d2001  ! 4927: SRA_I	sra 	%r20, 0x0001, %r30
	.word 0xb5e4e08b  ! 4932: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xbde4a02e  ! 4933: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xbd520000  ! 4934: RDPR_PIL	<illegal instruction>
	setx	0x20332, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf480000  ! 4940: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xb3e5e062  ! 4942: SAVE_I	save	%r23, 0x0001, %r25
	setx	0x3031f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_1, %g1, %r16
	.word 0xbbe56043  ! 4948: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xbde5a1f4  ! 4952: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb7e4e04f  ! 4953: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xbde5614f  ! 4956: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb7e5a14b  ! 4958: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xbde421ba  ! 4964: SAVE_I	save	%r16, 0x0001, %r30
	mov	2, %r14
	.word 0xa193a000  ! 4971: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbf518000  ! 4973: RDPR_PSTATE	<illegal instruction>
	setx	data_start_0, %g1, %r19
	.word 0xb151c000  ! 4975: RDPR_TL	<illegal instruction>
	.word 0xbde4e03a  ! 4977: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb5e421ce  ! 4981: SAVE_I	save	%r16, 0x0001, %r26
	setx	0x10303, %g1, %o0
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
	setx	0x3031d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7e46078  ! 4986: SAVE_I	save	%r17, 0x0001, %r27
	setx	0x20233, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_3, %g1, %r23
	.word 0xb9e4602f  ! 4991: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xba3d61d2  ! 4997: XNOR_I	xnor 	%r21, 0x01d2, %r29
	.word 0xba350000  ! 4998: SUBC_R	orn 	%r20, %r0, %r29
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
	.word 0xf83d0000  ! 4: STD_R	std	%r28, [%r20 + %r0]
	.word 0xf23dc000  ! 9: STD_R	std	%r25, [%r23 + %r0]
	.word 0xb405e095  ! 10: ADD_I	add 	%r23, 0x0095, %r26
	.word 0xfa3c0000  ! 12: STD_R	std	%r29, [%r16 + %r0]
	.word 0xfe2c8000  ! 17: STB_R	stb	%r31, [%r18 + %r0]
	.word 0xfa756063  ! 24: STX_I	stx	%r29, [%r21 + 0x0063]
	.word 0x8594618f  ! 25: WRPR_TSTATE_I	wrpr	%r17, 0x018f, %tstate
	.word 0xf035a0a9  ! 26: STH_I	sth	%r24, [%r22 + 0x00a9]
	.word 0xf6242054  ! 28: STW_I	stw	%r27, [%r16 + 0x0054]
	.word 0xb97c0400  ! 31: MOVR_R	movre	%r16, %r0, %r28
	.word 0xfc254000  ! 32: STW_R	stw	%r30, [%r21 + %r0]
	setx	0x10135, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf4356006  ! 34: STH_I	sth	%r26, [%r21 + 0x0006]
	.word 0xf6348000  ! 37: STH_R	sth	%r27, [%r18 + %r0]
	.word 0xbf540000  ! 43: RDPR_GL	rdpr	%-, %r31
	.word 0xbb510000  ! 46: RDPR_TICK	<illegal instruction>
	mov	1, %r12
	.word 0x8f932000  ! 47: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xfa2c61e6  ! 52: STB_I	stb	%r29, [%r17 + 0x01e6]
	.word 0xf42c8000  ! 54: STB_R	stb	%r26, [%r18 + %r0]
	.word 0xf6758000  ! 55: STX_R	stx	%r27, [%r22 + %r0]
	.word 0xf13de064  ! 57: STDF_I	std	%f24, [0x0064, %r23]
	.word 0xf4248000  ! 59: STW_R	stw	%r26, [%r18 + %r0]
	.word 0x8795a0b1  ! 60: WRPR_TT_I	wrpr	%r22, 0x00b1, %tt
	.word 0xb7643801  ! 63: MOVcc_I	<illegal instruction>
	.word 0xf33d6080  ! 66: STDF_I	std	%f25, [0x0080, %r21]
	.word 0xbeb42038  ! 67: ORNcc_I	orncc 	%r16, 0x0038, %r31
	.word 0xf074c000  ! 71: STX_R	stx	%r24, [%r19 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x81983a09  ! 72: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a09, %hpstate
	setx	data_start_4, %g1, %r19
	.word 0xf73d4000  ! 76: STDF_R	std	%f27, [%r0, %r21]
	setx	0x3012e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20034, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf33d8000  ! 87: STDF_R	std	%f25, [%r0, %r22]
	setx	0x2031a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x9194a122  ! 90: WRPR_PIL_I	wrpr	%r18, 0x0122, %pil
	setx	0x30013, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf2246079  ! 99: STW_I	stw	%r25, [%r17 + 0x0079]
	.word 0xb13d7001  ! 100: SRAX_I	srax	%r21, 0x0001, %r24
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbb50c000  ! 102: RDPR_TT	rdpr	%tt, %r29
	.word 0xf62c4000  ! 103: STB_R	stb	%r27, [%r17 + %r0]
	.word 0xf675a1ee  ! 104: STX_I	stx	%r27, [%r22 + 0x01ee]
	.word 0x8595a0c3  ! 106: WRPR_TSTATE_I	wrpr	%r22, 0x00c3, %tstate
	.word 0x89956061  ! 107: WRPR_TICK_I	wrpr	%r21, 0x0061, %tick
	.word 0xf23c4000  ! 108: STD_R	std	%r25, [%r17 + %r0]
	.word 0xfe2c8000  ! 109: STB_R	stb	%r31, [%r18 + %r0]
	.word 0xbabce1f1  ! 113: XNORcc_I	xnorcc 	%r19, 0x01f1, %r29
	.word 0xb8b5615e  ! 115: SUBCcc_I	orncc 	%r21, 0x015e, %r28
	.word 0xf63c0000  ! 116: STD_R	std	%r27, [%r16 + %r0]
	.word 0xbc3d0000  ! 118: XNOR_R	xnor 	%r20, %r0, %r30
	mov	0, %r12
	.word 0x8f932000  ! 119: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xfa3ca1bd  ! 120: STD_I	std	%r29, [%r18 + 0x01bd]
	.word 0xfa744000  ! 121: STX_R	stx	%r29, [%r17 + %r0]
	.word 0x879461fd  ! 123: WRPR_TT_I	wrpr	%r17, 0x01fd, %tt
	.word 0xb17c8400  ! 124: MOVR_R	movre	%r18, %r0, %r24
	.word 0xf42c0000  ! 127: STB_R	stb	%r26, [%r16 + %r0]
	.word 0xf224c000  ! 128: STW_R	stw	%r25, [%r19 + %r0]
	.word 0xf23c603b  ! 132: STD_I	std	%r25, [%r17 + 0x003b]
	setx	0x10318, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb694e006  ! 135: ORcc_I	orcc 	%r19, 0x0006, %r27
	.word 0xf4358000  ! 136: STH_R	sth	%r26, [%r22 + %r0]
	.word 0xb3500000  ! 137: RDPR_TPC	rdpr	%tpc, %r25
	.word 0xf93c8000  ! 140: STDF_R	std	%f28, [%r0, %r18]
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb151c000  ! 142: RDPR_TL	rdpr	%tl, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfa740000  ! 149: STX_R	stx	%r29, [%r16 + %r0]
	setx	0x20317, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9508000  ! 151: RDPR_TSTATE	<illegal instruction>
	.word 0xfc2cc000  ! 152: STB_R	stb	%r30, [%r19 + %r0]
	.word 0x8594a1d9  ! 154: WRPR_TSTATE_I	wrpr	%r18, 0x01d9, %tstate
	.word 0xbb3d3001  ! 155: SRAX_I	srax	%r20, 0x0001, %r29
	.word 0xf43d61b5  ! 158: STD_I	std	%r26, [%r21 + 0x01b5]
	.word 0xbb3df001  ! 159: SRAX_I	srax	%r23, 0x0001, %r29
	.word 0xfc2dc000  ! 160: STB_R	stb	%r30, [%r23 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x81982e5b  ! 161: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e5b, %hpstate
	.word 0xb1500000  ! 163: RDPR_TPC	rdpr	%tpc, %r24
	.word 0xfc34a0fe  ! 166: STH_I	sth	%r30, [%r18 + 0x00fe]
	.word 0xf53c8000  ! 167: STDF_R	std	%f26, [%r0, %r18]
	.word 0xfc746023  ! 170: STX_I	stx	%r30, [%r17 + 0x0023]
	.word 0xfd3c21c7  ! 171: STDF_I	std	%f30, [0x01c7, %r16]
	.word 0xf224609c  ! 172: STW_I	stw	%r25, [%r17 + 0x009c]
	.word 0x819521a4  ! 175: WRPR_TPC_I	wrpr	%r20, 0x01a4, %tpc
	.word 0xfb3d8000  ! 177: STDF_R	std	%f29, [%r0, %r22]
	.word 0xf53cc000  ! 178: STDF_R	std	%f26, [%r0, %r19]
	setx	data_start_3, %g1, %r22
	.word 0xf23d4000  ! 181: STD_R	std	%r25, [%r21 + %r0]
	.word 0xb350c000  ! 182: RDPR_TT	rdpr	%tt, %r25
	.word 0xbf508000  ! 187: RDPR_TSTATE	<illegal instruction>
	.word 0xfe3d6162  ! 192: STD_I	std	%r31, [%r21 + 0x0162]
	.word 0xb33c3001  ! 193: SRAX_I	srax	%r16, 0x0001, %r25
	.word 0xfe3d8000  ! 196: STD_R	std	%r31, [%r22 + %r0]
	.word 0xf4256081  ! 203: STW_I	stw	%r26, [%r21 + 0x0081]
	.word 0xbd641800  ! 204: MOVcc_R	<illegal instruction>
	.word 0xf434a064  ! 209: STH_I	sth	%r26, [%r18 + 0x0064]
	.word 0xf434606c  ! 213: STH_I	sth	%r26, [%r17 + 0x006c]
	setx	0x23b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7520000  ! 217: RDPR_PIL	<illegal instruction>
	.word 0x8594207e  ! 218: WRPR_TSTATE_I	wrpr	%r16, 0x007e, %tstate
	.word 0x899521dc  ! 219: WRPR_TICK_I	wrpr	%r20, 0x01dc, %tick
	.word 0xf62421a2  ! 220: STW_I	stw	%r27, [%r16 + 0x01a2]
	.word 0xb751c000  ! 222: RDPR_TL	rdpr	%tl, %r27
	setx	0xf, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9504000  ! 226: RDPR_TNPC	<illegal instruction>
	.word 0xf63d4000  ! 229: STD_R	std	%r27, [%r21 + %r0]
	mov	2, %r12
	.word 0x8f932000  ! 231: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xfe356067  ! 232: STH_I	sth	%r31, [%r21 + 0x0067]
	setx	data_start_5, %g1, %r18
	.word 0xfa75c000  ! 236: STX_R	stx	%r29, [%r23 + %r0]
	setx	0x30025, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf13da05a  ! 239: STDF_I	std	%f24, [0x005a, %r22]
	.word 0xf33d8000  ! 240: STDF_R	std	%f25, [%r0, %r22]
	.word 0xf424e175  ! 242: STW_I	stw	%r26, [%r19 + 0x0175]
	setx	0x33b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfb3ce1dc  ! 246: STDF_I	std	%f29, [0x01dc, %r19]
	.word 0xbd7d4400  ! 248: MOVR_R	movre	%r21, %r0, %r30
	.word 0x8994a168  ! 249: WRPR_TICK_I	wrpr	%r18, 0x0168, %tick
	.word 0xb151c000  ! 252: RDPR_TL	rdpr	%tl, %r24
	.word 0xb60461cf  ! 255: ADD_I	add 	%r17, 0x01cf, %r27
	.word 0xb9540000  ! 256: RDPR_GL	<illegal instruction>
	setx	0x338, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe3d2136  ! 261: STD_I	std	%r31, [%r20 + 0x0136]
	.word 0x8595a101  ! 266: WRPR_TSTATE_I	wrpr	%r22, 0x0101, %tstate
	.word 0xbb51c000  ! 267: RDPR_TL	rdpr	%tl, %r29
	.word 0x8995619b  ! 271: WRPR_TICK_I	wrpr	%r21, 0x019b, %tick
	.word 0xfe3da0d7  ! 274: STD_I	std	%r31, [%r22 + 0x00d7]
	.word 0xf0348000  ! 276: STH_R	sth	%r24, [%r18 + %r0]
	.word 0xb3518000  ! 277: RDPR_PSTATE	rdpr	%pstate, %r25
	.word 0xf53ca1b3  ! 281: STDF_I	std	%f26, [0x01b3, %r18]
	.word 0xf674610b  ! 285: STX_I	stx	%r27, [%r17 + 0x010b]
	setx	data_start_0, %g1, %r22
	.word 0x819460f4  ! 289: WRPR_TPC_I	wrpr	%r17, 0x00f4, %tpc
	setx	data_start_6, %g1, %r17
	.word 0xfd3ce12e  ! 293: STDF_I	std	%f30, [0x012e, %r19]
	.word 0xff3d2029  ! 301: STDF_I	std	%f31, [0x0029, %r20]
	.word 0xf43dc000  ! 305: STD_R	std	%r26, [%r23 + %r0]
	.word 0xfc2d4000  ! 306: STB_R	stb	%r30, [%r21 + %r0]
	.word 0xf22ca1a8  ! 307: STB_I	stb	%r25, [%r18 + 0x01a8]
	.word 0xf4240000  ! 308: STW_R	stw	%r26, [%r16 + %r0]
	.word 0xbf50c000  ! 311: RDPR_TT	rdpr	%tt, %r31
	.word 0xf62da113  ! 314: STB_I	stb	%r27, [%r22 + 0x0113]
	setx	data_start_2, %g1, %r16
	.word 0xf0744000  ! 317: STX_R	stx	%r24, [%r17 + %r0]
	.word 0xf82d60c2  ! 318: STB_I	stb	%r28, [%r21 + 0x00c2]
	.word 0xfc248000  ! 320: STW_R	stw	%r30, [%r18 + %r0]
	.word 0x85952082  ! 323: WRPR_TSTATE_I	wrpr	%r20, 0x0082, %tstate
	.word 0xf8250000  ! 325: STW_R	stw	%r28, [%r20 + %r0]
	.word 0xf13c0000  ! 326: STDF_R	std	%f24, [%r0, %r16]
	.word 0xf23d8000  ! 327: STD_R	std	%r25, [%r22 + %r0]
	.word 0xb3510000  ! 329: RDPR_TICK	rdpr	%tick, %r25
	.word 0xf2340000  ! 333: STH_R	sth	%r25, [%r16 + %r0]
	.word 0xf62c4000  ! 335: STB_R	stb	%r27, [%r17 + %r0]
	.word 0xff3d4000  ! 336: STDF_R	std	%f31, [%r0, %r21]
	.word 0xb48dc000  ! 341: ANDcc_R	andcc 	%r23, %r0, %r26
	.word 0xfd3d8000  ! 345: STDF_R	std	%f30, [%r0, %r22]
	.word 0xf0748000  ! 346: STX_R	stx	%r24, [%r18 + %r0]
	.word 0x859560e3  ! 349: WRPR_TSTATE_I	wrpr	%r21, 0x00e3, %tstate
	.word 0xf93cc000  ! 352: STDF_R	std	%f28, [%r0, %r19]
	.word 0xfa3d0000  ! 353: STD_R	std	%r29, [%r20 + %r0]
	.word 0xb4bde02f  ! 356: XNORcc_I	xnorcc 	%r23, 0x002f, %r26
	.word 0xf42c4000  ! 357: STB_R	stb	%r26, [%r17 + %r0]
	.word 0xfc344000  ! 358: STH_R	sth	%r30, [%r17 + %r0]
	.word 0xf93ce18c  ! 361: STDF_I	std	%f28, [0x018c, %r19]
	.word 0xbe15e1fe  ! 366: OR_I	or 	%r23, 0x01fe, %r31
	.word 0xfb3c615c  ! 367: STDF_I	std	%f29, [0x015c, %r17]
	.word 0xf4354000  ! 368: STH_R	sth	%r26, [%r21 + %r0]
	.word 0xb9540000  ! 369: RDPR_GL	rdpr	%-, %r28
	.word 0xfe350000  ! 375: STH_R	sth	%r31, [%r20 + %r0]
	setx	0x10135, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	2, %r14
	.word 0xa193a000  ! 383: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbd510000  ! 385: RDPR_TICK	rdpr	%tick, %r30
	.word 0xfc3ca1e1  ! 386: STD_I	std	%r30, [%r18 + 0x01e1]
	.word 0x8d942193  ! 387: WRPR_PSTATE_I	wrpr	%r16, 0x0193, %pstate
	.word 0xbc2d4000  ! 389: ANDN_R	andn 	%r21, %r0, %r30
	.word 0x89952169  ! 392: WRPR_TICK_I	wrpr	%r20, 0x0169, %tick
	setx	0x12, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe74e1f2  ! 397: STX_I	stx	%r31, [%r19 + 0x01f2]
	.word 0xf93c4000  ! 399: STDF_R	std	%f28, [%r0, %r17]
	.word 0xb494a0f8  ! 400: ORcc_I	orcc 	%r18, 0x00f8, %r26
	.word 0xf434c000  ! 401: STH_R	sth	%r26, [%r19 + %r0]
	.word 0xfc754000  ! 402: STX_R	stx	%r30, [%r21 + %r0]
	.word 0xfc3cc000  ! 403: STD_R	std	%r30, [%r19 + %r0]
	.word 0xf33cc000  ! 405: STDF_R	std	%f25, [%r0, %r19]
	.word 0x8d94a024  ! 415: WRPR_PSTATE_I	wrpr	%r18, 0x0024, %pstate
	setx	0x10110, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x2031a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa3c0000  ! 423: STD_R	std	%r29, [%r16 + %r0]
	.word 0xfe3d0000  ! 429: STD_R	std	%r31, [%r20 + %r0]
	.word 0xfa3ce0b7  ! 433: STD_I	std	%r29, [%r19 + 0x00b7]
	.word 0xf63461bd  ! 434: STH_I	sth	%r27, [%r17 + 0x01bd]
	.word 0xbf540000  ! 437: RDPR_GL	rdpr	%-, %r31
	.word 0xf63ca18e  ! 443: STD_I	std	%r27, [%r18 + 0x018e]
	.word 0xfe35a0a9  ! 444: STH_I	sth	%r31, [%r22 + 0x00a9]
	.word 0xfa3c2110  ! 445: STD_I	std	%r29, [%r16 + 0x0110]
	.word 0xf6744000  ! 446: STX_R	stx	%r27, [%r17 + %r0]
	.word 0xf2258000  ! 448: STW_R	stw	%r25, [%r22 + %r0]
	setx	0x10338, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d956077  ! 451: WRPR_PSTATE_I	wrpr	%r21, 0x0077, %pstate
	.word 0xf62d2012  ! 452: STB_I	stb	%r27, [%r20 + 0x0012]
	.word 0xf235a102  ! 455: STH_I	sth	%r25, [%r22 + 0x0102]
	.word 0xf4250000  ! 456: STW_R	stw	%r26, [%r20 + %r0]
	mov	2, %r12
	.word 0x8f932000  ! 460: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xfa2521f6  ! 461: STW_I	stw	%r29, [%r20 + 0x01f6]
	.word 0xb951c000  ! 463: RDPR_TL	rdpr	%tl, %r28
	setx	0x20134, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc740000  ! 466: STX_R	stx	%r30, [%r16 + %r0]
	.word 0xf63c0000  ! 468: STD_R	std	%r27, [%r16 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x81983f5b  ! 469: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f5b, %hpstate
	setx	0x330, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81983f9b  ! 471: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f9b, %hpstate
	.word 0xbd508000  ! 475: RDPR_TSTATE	rdpr	%tstate, %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0x839560bf  ! 477: WRPR_TNPC_I	wrpr	%r21, 0x00bf, %tnpc
	.word 0xb951c000  ! 479: RDPR_TL	rdpr	%tl, %r28
	setx	0x20303, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x83946047  ! 482: WRPR_TNPC_I	wrpr	%r17, 0x0047, %tnpc
	ta	T_CHANGE_HPRIV
	.word 0x81983bc9  ! 483: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1bc9, %hpstate
	.word 0xb3540000  ! 485: RDPR_GL	rdpr	%-, %r25
	.word 0xfd3dc000  ! 486: STDF_R	std	%f30, [%r0, %r23]
	.word 0xfe2da140  ! 492: STB_I	stb	%r31, [%r22 + 0x0140]
	.word 0xf73ca156  ! 494: STDF_I	std	%f27, [0x0156, %r18]
	.word 0xfa3cc000  ! 495: STD_R	std	%r29, [%r19 + %r0]
	.word 0xbe8c6168  ! 496: ANDcc_I	andcc 	%r17, 0x0168, %r31
	.word 0xbf7c2401  ! 501: MOVR_I	movre	%r16, 0x1, %r31
	.word 0xbd510000  ! 503: RDPR_TICK	<illegal instruction>
	.word 0xbb480000  ! 509: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	setx	data_start_0, %g1, %r16
	.word 0x8595a04d  ! 525: WRPR_TSTATE_I	wrpr	%r22, 0x004d, %tstate
	.word 0xf0342100  ! 532: STH_I	sth	%r24, [%r16 + 0x0100]
	setx	0x30228, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf43da174  ! 534: STD_I	std	%r26, [%r22 + 0x0174]
	setx	data_start_0, %g1, %r18
	.word 0xf63c4000  ! 543: STD_R	std	%r27, [%r17 + %r0]
	setx	0x20306, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8994a1e7  ! 551: WRPR_TICK_I	wrpr	%r18, 0x01e7, %tick
	.word 0xb8954000  ! 552: ORcc_R	orcc 	%r21, %r0, %r28
	.word 0xf8256032  ! 554: STW_I	stw	%r28, [%r21 + 0x0032]
	.word 0xb950c000  ! 556: RDPR_TT	rdpr	%tt, %r28
	.word 0xbb520000  ! 559: RDPR_PIL	<illegal instruction>
	.word 0xb6058000  ! 562: ADD_R	add 	%r22, %r0, %r27
	.word 0xb951c000  ! 564: RDPR_TL	<illegal instruction>
	.word 0xf33dc000  ! 568: STDF_R	std	%f25, [%r0, %r23]
	.word 0x819561d4  ! 572: WRPR_TPC_I	wrpr	%r21, 0x01d4, %tpc
	.word 0xfa342002  ! 579: STH_I	sth	%r29, [%r16 + 0x0002]
	.word 0x8195a012  ! 580: WRPR_TPC_I	wrpr	%r22, 0x0012, %tpc
	.word 0xf23de188  ! 586: STD_I	std	%r25, [%r23 + 0x0188]
	.word 0x9194e120  ! 592: WRPR_PIL_I	wrpr	%r19, 0x0120, %pil
	.word 0xf63d4000  ! 595: STD_R	std	%r27, [%r21 + %r0]
	setx	0x30225, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10238, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r19
	.word 0xb7508000  ! 607: RDPR_TSTATE	rdpr	%tstate, %r27
	setx	0x10211, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9540000  ! 611: RDPR_GL	<illegal instruction>
	.word 0xf474c000  ! 614: STX_R	stx	%r26, [%r19 + %r0]
	setx	0x20110, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf510000  ! 618: RDPR_TICK	<illegal instruction>
	setx	data_start_4, %g1, %r20
	.word 0xba044000  ! 623: ADD_R	add 	%r17, %r0, %r29
	.word 0xfa258000  ! 632: STW_R	stw	%r29, [%r22 + %r0]
	.word 0x83952058  ! 633: WRPR_TNPC_I	wrpr	%r20, 0x0058, %tnpc
	.word 0xf0748000  ! 643: STX_R	stx	%r24, [%r18 + %r0]
	.word 0xb1508000  ! 646: RDPR_TSTATE	rdpr	%tstate, %r24
	.word 0xb5520000  ! 651: RDPR_PIL	<illegal instruction>
	.word 0xf62c0000  ! 655: STB_R	stb	%r27, [%r16 + %r0]
	.word 0xfe2c4000  ! 658: STB_R	stb	%r31, [%r17 + %r0]
	setx	0x3031a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1508000  ! 661: RDPR_TSTATE	<illegal instruction>
	.word 0xb32c8000  ! 663: SLL_R	sll 	%r18, %r0, %r25
	setx	0x30321, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81982e5b  ! 670: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e5b, %hpstate
	.word 0xf22c616c  ! 671: STB_I	stb	%r25, [%r17 + 0x016c]
	.word 0xf42ca029  ! 673: STB_I	stb	%r26, [%r18 + 0x0029]
	setx	data_start_2, %g1, %r17
	.word 0xfb3dc000  ! 676: STDF_R	std	%f29, [%r0, %r23]
	setx	0x10330, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf73ca190  ! 686: STDF_I	std	%f27, [0x0190, %r18]
	.word 0xb1480000  ! 691: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0x81956173  ! 692: WRPR_TPC_I	wrpr	%r21, 0x0173, %tpc
	.word 0xfc35e07f  ! 698: STH_I	sth	%r30, [%r23 + 0x007f]
	.word 0xbb510000  ! 700: RDPR_TICK	rdpr	%tick, %r29
	.word 0xbf2d1000  ! 701: SLLX_R	sllx	%r20, %r0, %r31
	.word 0xf02d0000  ! 704: STB_R	stb	%r24, [%r20 + %r0]
	.word 0xb9480000  ! 707: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xf73da0c9  ! 709: STDF_I	std	%f27, [0x00c9, %r22]
	.word 0xb1504000  ! 711: RDPR_TNPC	rdpr	%tnpc, %r24
	.word 0xfe24a126  ! 712: STW_I	stw	%r31, [%r18 + 0x0126]
	.word 0xf434a048  ! 713: STH_I	sth	%r26, [%r18 + 0x0048]
	.word 0xfc3d212f  ! 714: STD_I	std	%r30, [%r20 + 0x012f]
	mov	2, %r14
	.word 0xa193a000  ! 715: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb5518000  ! 716: RDPR_PSTATE	rdpr	%pstate, %r26
	.word 0xba14a11b  ! 717: OR_I	or 	%r18, 0x011b, %r29
	.word 0xfe3d6104  ! 719: STD_I	std	%r31, [%r21 + 0x0104]
	.word 0xbea4c000  ! 720: SUBcc_R	subcc 	%r19, %r0, %r31
	.word 0xf02c614a  ! 722: STB_I	stb	%r24, [%r17 + 0x014a]
	.word 0xbf518000  ! 728: RDPR_PSTATE	<illegal instruction>
	setx	data_start_1, %g1, %r23
	.word 0xfc3d6119  ! 730: STD_I	std	%r30, [%r21 + 0x0119]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	.word 0x81983cc3  ! 734: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1cc3, %hpstate
	.word 0xf034a012  ! 737: STH_I	sth	%r24, [%r18 + 0x0012]
	.word 0x819561b9  ! 738: WRPR_TPC_I	wrpr	%r21, 0x01b9, %tpc
	.word 0xf4248000  ! 743: STW_R	stw	%r26, [%r18 + %r0]
	.word 0x91946165  ! 745: WRPR_PIL_I	wrpr	%r17, 0x0165, %pil
	.word 0xbf7c6401  ! 746: MOVR_I	movre	%r17, 0x1, %r31
	.word 0xf474e02d  ! 748: STX_I	stx	%r26, [%r19 + 0x002d]
	.word 0xbb3c3001  ! 750: SRAX_I	srax	%r16, 0x0001, %r29
	.word 0xf234215c  ! 754: STH_I	sth	%r25, [%r16 + 0x015c]
	.word 0xb414600a  ! 757: OR_I	or 	%r17, 0x000a, %r26
	.word 0xbe252137  ! 761: SUB_I	sub 	%r20, 0x0137, %r31
	.word 0xb81460ad  ! 766: OR_I	or 	%r17, 0x00ad, %r28
	setx	data_start_3, %g1, %r16
	setx	0x30017, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf73d0000  ! 771: STDF_R	std	%f27, [%r0, %r20]
	setx	data_start_1, %g1, %r23
	setx	data_start_1, %g1, %r20
	.word 0xfd3cc000  ! 778: STDF_R	std	%f30, [%r0, %r19]
	.word 0xb9504000  ! 780: RDPR_TNPC	rdpr	%tnpc, %r28
	setx	0x22b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5504000  ! 784: RDPR_TNPC	rdpr	%tnpc, %r26
	.word 0xbe954000  ! 785: ORcc_R	orcc 	%r21, %r0, %r31
	.word 0x8d95a022  ! 787: WRPR_PSTATE_I	wrpr	%r22, 0x0022, %pstate
	.word 0x919461ad  ! 792: WRPR_PIL_I	wrpr	%r17, 0x01ad, %pil
	.word 0xfc3560ef  ! 794: STH_I	sth	%r30, [%r21 + 0x00ef]
	.word 0xf23ca1cd  ! 795: STD_I	std	%r25, [%r18 + 0x01cd]
	.word 0xfa3de0cf  ! 797: STD_I	std	%r29, [%r23 + 0x00cf]
	.word 0xb13c7001  ! 798: SRAX_I	srax	%r17, 0x0001, %r24
	.word 0xf634e0b8  ! 799: STH_I	sth	%r27, [%r19 + 0x00b8]
	setx	0x20031, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf520000  ! 810: RDPR_PIL	rdpr	%pil, %r31
	.word 0x8d9420e5  ! 811: WRPR_PSTATE_I	wrpr	%r16, 0x00e5, %pstate
	.word 0x8395a1d1  ! 812: WRPR_TNPC_I	wrpr	%r22, 0x01d1, %tnpc
	.word 0xb9504000  ! 816: RDPR_TNPC	rdpr	%tnpc, %r28
	.word 0xf82460c9  ! 818: STW_I	stw	%r28, [%r17 + 0x00c9]
	.word 0xf4350000  ! 819: STH_R	sth	%r26, [%r20 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x8198284b  ! 821: WRHPR_HPSTATE_I	wrhpr	%r0, 0x084b, %hpstate
	.word 0x8595616f  ! 822: WRPR_TSTATE_I	wrpr	%r21, 0x016f, %tstate
	setx	0x20203, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd500000  ! 825: RDPR_TPC	rdpr	%tpc, %r30
	ta	T_CHANGE_HPRIV
	.word 0x81983d9b  ! 827: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d9b, %hpstate
	.word 0xbb51c000  ! 829: RDPR_TL	rdpr	%tl, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfc2ce172  ! 834: STB_I	stb	%r30, [%r19 + 0x0172]
	.word 0xf82d60d7  ! 843: STB_I	stb	%r28, [%r21 + 0x00d7]
	mov	1, %r12
	.word 0x8f932000  ! 845: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbd641800  ! 848: MOVcc_R	<illegal instruction>
	.word 0xb42c2131  ! 851: ANDN_I	andn 	%r16, 0x0131, %r26
	.word 0xb1520000  ! 855: RDPR_PIL	rdpr	%pil, %r24
	.word 0xf43420dc  ! 856: STH_I	sth	%r26, [%r16 + 0x00dc]
	.word 0x9195e0a2  ! 858: WRPR_PIL_I	wrpr	%r23, 0x00a2, %pil
	.word 0xf6348000  ! 860: STH_R	sth	%r27, [%r18 + %r0]
	.word 0x8995a016  ! 861: WRPR_TICK_I	wrpr	%r22, 0x0016, %tick
	.word 0xf22ca1d9  ! 864: STB_I	stb	%r25, [%r18 + 0x01d9]
	.word 0xb7518000  ! 866: RDPR_PSTATE	rdpr	%pstate, %r27
	.word 0x919520cd  ! 867: WRPR_PIL_I	wrpr	%r20, 0x00cd, %pil
	.word 0x8795e0d9  ! 871: WRPR_TT_I	wrpr	%r23, 0x00d9, %tt
	mov	1, %r14
	.word 0xa193a000  ! 873: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xfc2d8000  ! 874: STB_R	stb	%r30, [%r22 + %r0]
	.word 0xfc2c0000  ! 876: STB_R	stb	%r30, [%r16 + %r0]
	.word 0xb7480000  ! 883: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xbf50c000  ! 884: RDPR_TT	<illegal instruction>
	.word 0xb025c000  ! 885: SUB_R	sub 	%r23, %r0, %r24
	.word 0xf0754000  ! 888: STX_R	stx	%r24, [%r21 + %r0]
	.word 0xf53da09b  ! 889: STDF_I	std	%f26, [0x009b, %r22]
	.word 0xbcb54000  ! 890: ORNcc_R	orncc 	%r21, %r0, %r30
	.word 0xf13c21cb  ! 892: STDF_I	std	%f24, [0x01cb, %r16]
	.word 0xf8748000  ! 894: STX_R	stx	%r28, [%r18 + %r0]
	.word 0xfe2cc000  ! 897: STB_R	stb	%r31, [%r19 + %r0]
	.word 0xbf510000  ! 900: RDPR_TICK	<illegal instruction>
	.word 0xfc358000  ! 914: STH_R	sth	%r30, [%r22 + %r0]
	.word 0xfa75e00e  ! 918: STX_I	stx	%r29, [%r23 + 0x000e]
	.word 0xb73d7001  ! 924: SRAX_I	srax	%r21, 0x0001, %r27
	.word 0x8594e18d  ! 929: WRPR_TSTATE_I	wrpr	%r19, 0x018d, %tstate
	.word 0xf23521b1  ! 930: STH_I	sth	%r25, [%r20 + 0x01b1]
	setx	0x3012d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb625c000  ! 933: SUB_R	sub 	%r23, %r0, %r27
	ta	T_CHANGE_HPRIV
	.word 0x81983cd1  ! 935: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1cd1, %hpstate
	.word 0xbb50c000  ! 938: RDPR_TT	rdpr	%tt, %r29
	.word 0xbe2c60d7  ! 939: ANDN_I	andn 	%r17, 0x00d7, %r31
	setx	0x30224, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf02c21df  ! 941: STB_I	stb	%r24, [%r16 + 0x01df]
	.word 0xf8258000  ! 945: STW_R	stw	%r28, [%r22 + %r0]
	setx	0x3021d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x839460c6  ! 947: WRPR_TNPC_I	wrpr	%r17, 0x00c6, %tnpc
	setx	0x1011b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_1, %g1, %r17
	setx	0x3000a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf33c2061  ! 959: STDF_I	std	%f25, [0x0061, %r16]
	.word 0xb5540000  ! 961: RDPR_GL	rdpr	%-, %r26
	.word 0x85956135  ! 963: WRPR_TSTATE_I	wrpr	%r21, 0x0135, %tstate
	.word 0xf62d8000  ! 965: STB_R	stb	%r27, [%r22 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x81982b93  ! 968: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b93, %hpstate
	.word 0xf33d4000  ! 973: STDF_R	std	%f25, [%r0, %r21]
	.word 0x8394e015  ! 977: WRPR_TNPC_I	wrpr	%r19, 0x0015, %tnpc
	setx	0x22e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xba9dc000  ! 985: XORcc_R	xorcc 	%r23, %r0, %r29
	.word 0xb2354000  ! 986: SUBC_R	orn 	%r21, %r0, %r25
	ta	T_CHANGE_HPRIV
	.word 0x81982c89  ! 989: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c89, %hpstate
	.word 0xfe74616a  ! 991: STX_I	stx	%r31, [%r17 + 0x016a]
	.word 0xf425a139  ! 992: STW_I	stw	%r26, [%r22 + 0x0139]
	.word 0xf62d619b  ! 993: STB_I	stb	%r27, [%r21 + 0x019b]
	.word 0x87942075  ! 994: WRPR_TT_I	wrpr	%r16, 0x0075, %tt
	.word 0xbe152182  ! 995: OR_I	or 	%r20, 0x0182, %r31
	.word 0xf835210f  ! 996: STH_I	sth	%r28, [%r20 + 0x010f]
	setx	0x4, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8395e1b8  ! 1002: WRPR_TNPC_I	wrpr	%r23, 0x01b8, %tnpc
	.word 0xfc2c2150  ! 1005: STB_I	stb	%r30, [%r16 + 0x0150]
	setx	data_start_1, %g1, %r21
	.word 0xb224a079  ! 1011: SUB_I	sub 	%r18, 0x0079, %r25
	.word 0xf02c8000  ! 1016: STB_R	stb	%r24, [%r18 + %r0]
	.word 0xfa740000  ! 1017: STX_R	stx	%r29, [%r16 + %r0]
	setx	0x2032b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d95e165  ! 1023: WRPR_PSTATE_I	wrpr	%r23, 0x0165, %pstate
	.word 0xbb500000  ! 1024: RDPR_TPC	rdpr	%tpc, %r29
	.word 0xfb3de06a  ! 1025: STDF_I	std	%f29, [0x006a, %r23]
	setx	0x30311, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x1010c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc2de07b  ! 1032: STB_I	stb	%r30, [%r23 + 0x007b]
	.word 0xfa3d2120  ! 1033: STD_I	std	%r29, [%r20 + 0x0120]
	.word 0x8595e06c  ! 1034: WRPR_TSTATE_I	wrpr	%r23, 0x006c, %tstate
	.word 0xb3520000  ! 1035: RDPR_PIL	rdpr	%pil, %r25
	.word 0xff3c20da  ! 1042: STDF_I	std	%f31, [0x00da, %r16]
	.word 0xf33cc000  ! 1043: STDF_R	std	%f25, [%r0, %r19]
	.word 0xb2a40000  ! 1044: SUBcc_R	subcc 	%r16, %r0, %r25
	.word 0xbc95c000  ! 1047: ORcc_R	orcc 	%r23, %r0, %r30
	setx	0x10038, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe3da0d6  ! 1051: STD_I	std	%r31, [%r22 + 0x00d6]
	setx	0x30024, %g1, %o0
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
	.word 0xf22c4000  ! 1055: STB_R	stb	%r25, [%r17 + %r0]
	.word 0xbc45602e  ! 1059: ADDC_I	addc 	%r21, 0x002e, %r30
	.word 0x8595603c  ! 1066: WRPR_TSTATE_I	wrpr	%r21, 0x003c, %tstate
	.word 0xf07421f0  ! 1072: STX_I	stx	%r24, [%r16 + 0x01f0]
	.word 0xf8750000  ! 1075: STX_R	stx	%r28, [%r20 + %r0]
	mov	0, %r12
	.word 0x8f932000  ! 1076: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	0x8, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd641800  ! 1084: MOVcc_R	<illegal instruction>
	.word 0xf42c4000  ! 1085: STB_R	stb	%r26, [%r17 + %r0]
	.word 0x919420fe  ! 1086: WRPR_PIL_I	wrpr	%r16, 0x00fe, %pil
	.word 0xf62d0000  ! 1087: STB_R	stb	%r27, [%r20 + %r0]
	.word 0xf33c8000  ! 1088: STDF_R	std	%f25, [%r0, %r18]
	.word 0xfa3560f2  ! 1092: STH_I	sth	%r29, [%r21 + 0x00f2]
	.word 0x8595a0b2  ! 1093: WRPR_TSTATE_I	wrpr	%r22, 0x00b2, %tstate
	.word 0xfc2d8000  ! 1096: STB_R	stb	%r30, [%r22 + %r0]
	mov	2, %r12
	.word 0x8f932000  ! 1098: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	data_start_4, %g1, %r21
	.word 0x8795e182  ! 1100: WRPR_TT_I	wrpr	%r23, 0x0182, %tt
	ta	T_CHANGE_HPRIV
	.word 0x81982c01  ! 1102: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c01, %hpstate
	setx	0x10336, %g1, %o0
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
	.word 0xf625a1cc  ! 1114: STW_I	stw	%r27, [%r22 + 0x01cc]
	.word 0xf82ca159  ! 1116: STB_I	stb	%r28, [%r18 + 0x0159]
	.word 0xfe350000  ! 1118: STH_R	sth	%r31, [%r20 + %r0]
	.word 0xf8250000  ! 1121: STW_R	stw	%r28, [%r20 + %r0]
	mov	0, %r12
	.word 0x8f932000  ! 1124: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	0x30329, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	1, %r12
	.word 0x8f932000  ! 1131: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb5508000  ! 1132: RDPR_TSTATE	rdpr	%tstate, %r26
	.word 0xfb3d6067  ! 1133: STDF_I	std	%f29, [0x0067, %r21]
	.word 0xfc3cc000  ! 1134: STD_R	std	%r30, [%r19 + %r0]
	.word 0xbd641800  ! 1135: MOVcc_R	<illegal instruction>
	.word 0xb7518000  ! 1136: RDPR_PSTATE	<illegal instruction>
	.word 0xf4248000  ! 1138: STW_R	stw	%r26, [%r18 + %r0]
	.word 0xb550c000  ! 1144: RDPR_TT	<illegal instruction>
	setx	data_start_0, %g1, %r16
	.word 0xfa3dc000  ! 1149: STD_R	std	%r29, [%r23 + %r0]
	setx	data_start_6, %g1, %r21
	.word 0xf23c8000  ! 1156: STD_R	std	%r25, [%r18 + %r0]
	.word 0xbd3c4000  ! 1159: SRA_R	sra 	%r17, %r0, %r30
	.word 0xf42d0000  ! 1165: STB_R	stb	%r26, [%r20 + %r0]
	.word 0xfc24216d  ! 1171: STW_I	stw	%r30, [%r16 + 0x016d]
	mov	1, %r12
	.word 0x8f932000  ! 1173: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb89da0c6  ! 1174: XORcc_I	xorcc 	%r22, 0x00c6, %r28
	setx	data_start_6, %g1, %r16
	.word 0xf93da011  ! 1184: STDF_I	std	%f28, [0x0011, %r22]
	.word 0xbb520000  ! 1185: RDPR_PIL	rdpr	%pil, %r29
	setx	0x20211, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x87956050  ! 1188: WRPR_TT_I	wrpr	%r21, 0x0050, %tt
	.word 0xf035e08f  ! 1189: STH_I	sth	%r24, [%r23 + 0x008f]
	setx	0x10a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf82cc000  ! 1191: STB_R	stb	%r28, [%r19 + %r0]
	.word 0xb7480000  ! 1192: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0x9195a17b  ! 1194: WRPR_PIL_I	wrpr	%r22, 0x017b, %pil
	setx	0x2011f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf63c6128  ! 1203: STD_I	std	%r27, [%r17 + 0x0128]
	.word 0xb3480000  ! 1205: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	setx	0x21a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf504000  ! 1210: RDPR_TNPC	rdpr	%tnpc, %r31
	.word 0xbf510000  ! 1212: RDPR_TICK	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81982c13  ! 1213: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c13, %hpstate
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0x81956186  ! 1215: WRPR_TPC_I	wrpr	%r21, 0x0186, %tpc
	mov	1, %r12
	.word 0x8f932000  ! 1220: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf22dc000  ! 1224: STB_R	stb	%r25, [%r23 + %r0]
	.word 0xf43d609c  ! 1225: STD_I	std	%r26, [%r21 + 0x009c]
	.word 0xb7504000  ! 1227: RDPR_TNPC	rdpr	%tnpc, %r27
	.word 0xb5504000  ! 1228: RDPR_TNPC	<illegal instruction>
	.word 0xf2246063  ! 1236: STW_I	stw	%r25, [%r17 + 0x0063]
	.word 0xf6358000  ! 1238: STH_R	sth	%r27, [%r22 + %r0]
	.word 0xfc3c2077  ! 1239: STD_I	std	%r30, [%r16 + 0x0077]
	.word 0xbb508000  ! 1240: RDPR_TSTATE	<illegal instruction>
	.word 0xb0bc4000  ! 1242: XNORcc_R	xnorcc 	%r17, %r0, %r24
	.word 0xfe744000  ! 1244: STX_R	stx	%r31, [%r17 + %r0]
	.word 0xb9480000  ! 1245: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xb351c000  ! 1246: RDPR_TL	<illegal instruction>
	.word 0xf42c4000  ! 1248: STB_R	stb	%r26, [%r17 + %r0]
	.word 0xfb3c0000  ! 1252: STDF_R	std	%f29, [%r0, %r16]
	.word 0xb02d210e  ! 1256: ANDN_I	andn 	%r20, 0x010e, %r24
	.word 0x819460fd  ! 1261: WRPR_TPC_I	wrpr	%r17, 0x00fd, %tpc
	.word 0xf6756132  ! 1264: STX_I	stx	%r27, [%r21 + 0x0132]
	.word 0xf835603e  ! 1269: STH_I	sth	%r28, [%r21 + 0x003e]
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	ta	T_CHANGE_HPRIV
	.word 0x81983ac9  ! 1281: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ac9, %hpstate
	.word 0x8394a14a  ! 1283: WRPR_TNPC_I	wrpr	%r18, 0x014a, %tnpc
	.word 0xf73dc000  ! 1289: STDF_R	std	%f27, [%r0, %r23]
	.word 0xf82d617c  ! 1290: STB_I	stb	%r28, [%r21 + 0x017c]
	.word 0xf8750000  ! 1295: STX_R	stx	%r28, [%r20 + %r0]
	.word 0x8d9461cf  ! 1296: WRPR_PSTATE_I	wrpr	%r17, 0x01cf, %pstate
	.word 0xfe342149  ! 1297: STH_I	sth	%r31, [%r16 + 0x0149]
	.word 0xfc2d8000  ! 1298: STB_R	stb	%r30, [%r22 + %r0]
	.word 0xf435a130  ! 1301: STH_I	sth	%r26, [%r22 + 0x0130]
	.word 0xf23d0000  ! 1303: STD_R	std	%r25, [%r20 + %r0]
	.word 0xfa34c000  ! 1305: STH_R	sth	%r29, [%r19 + %r0]
	setx	data_start_7, %g1, %r16
	.word 0xb350c000  ! 1307: RDPR_TT	rdpr	%tt, %r25
	.word 0xfa748000  ! 1308: STX_R	stx	%r29, [%r18 + %r0]
	.word 0xfc254000  ! 1309: STW_R	stw	%r30, [%r21 + %r0]
	.word 0xf025a1cf  ! 1310: STW_I	stw	%r24, [%r22 + 0x01cf]
	.word 0xf63d2185  ! 1312: STD_I	std	%r27, [%r20 + 0x0185]
	.word 0x8794e0dd  ! 1315: WRPR_TT_I	wrpr	%r19, 0x00dd, %tt
	.word 0x859460e0  ! 1317: WRPR_TSTATE_I	wrpr	%r17, 0x00e0, %tstate
	.word 0xf02ca06f  ! 1323: STB_I	stb	%r24, [%r18 + 0x006f]
	.word 0xf034c000  ! 1324: STH_R	sth	%r24, [%r19 + %r0]
	.word 0xfc3520a7  ! 1328: STH_I	sth	%r30, [%r20 + 0x00a7]
	.word 0xbc0d0000  ! 1331: AND_R	and 	%r20, %r0, %r30
	.word 0xfa74a089  ! 1337: STX_I	stx	%r29, [%r18 + 0x0089]
	.word 0xbb510000  ! 1338: RDPR_TICK	rdpr	%tick, %r29
	setx	0x30221, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf435606a  ! 1341: STH_I	sth	%r26, [%r21 + 0x006a]
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	setx	data_start_7, %g1, %r20
	setx	0x20101, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf675212d  ! 1352: STX_I	stx	%r27, [%r20 + 0x012d]
	.word 0xb014c000  ! 1354: OR_R	or 	%r19, %r0, %r24
	setx	0x30330, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8195a1a3  ! 1356: WRPR_TPC_I	wrpr	%r22, 0x01a3, %tpc
	.word 0xfa25c000  ! 1359: STW_R	stw	%r29, [%r23 + %r0]
	setx	0x10202, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x819839d9  ! 1361: WRHPR_HPSTATE_I	wrhpr	%r0, 0x19d9, %hpstate
	.word 0xf03c0000  ! 1363: STD_R	std	%r24, [%r16 + %r0]
	.word 0xb5520000  ! 1364: RDPR_PIL	rdpr	%pil, %r26
	.word 0x89942031  ! 1365: WRPR_TICK_I	wrpr	%r16, 0x0031, %tick
	.word 0x8395a0fa  ! 1367: WRPR_TNPC_I	wrpr	%r22, 0x00fa, %tnpc
	.word 0xfc340000  ! 1369: STH_R	sth	%r30, [%r16 + %r0]
	.word 0xb9540000  ! 1373: RDPR_GL	rdpr	%-, %r28
	.word 0xf62d60cc  ! 1374: STB_I	stb	%r27, [%r21 + 0x00cc]
	setx	0x1002d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf23c21a9  ! 1378: STD_I	std	%r25, [%r16 + 0x01a9]
	.word 0xfe2561d9  ! 1381: STW_I	stw	%r31, [%r21 + 0x01d9]
	mov	2, %r14
	.word 0xa193a000  ! 1383: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0x859461ae  ! 1386: WRPR_TSTATE_I	wrpr	%r17, 0x01ae, %tstate
	mov	0, %r14
	.word 0xa193a000  ! 1394: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x20023, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x819828c9  ! 1398: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08c9, %hpstate
	setx	0x20212, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d94a164  ! 1400: WRPR_PSTATE_I	wrpr	%r18, 0x0164, %pstate
	.word 0xfe74a083  ! 1403: STX_I	stx	%r31, [%r18 + 0x0083]
	.word 0xb044214a  ! 1409: ADDC_I	addc 	%r16, 0x014a, %r24
	.word 0xf8246169  ! 1413: STW_I	stw	%r28, [%r17 + 0x0169]
	.word 0xf224a17b  ! 1417: STW_I	stw	%r25, [%r18 + 0x017b]
	.word 0xfd3ce01e  ! 1420: STDF_I	std	%f30, [0x001e, %r19]
	.word 0xf02c0000  ! 1421: STB_R	stb	%r24, [%r16 + %r0]
	.word 0xb9643801  ! 1425: MOVcc_I	<illegal instruction>
	mov	0, %r14
	.word 0xa193a000  ! 1427: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbb357001  ! 1430: SRLX_I	srlx	%r21, 0x0001, %r29
	.word 0xf474c000  ! 1436: STX_R	stx	%r26, [%r19 + %r0]
	.word 0xfe74c000  ! 1437: STX_R	stx	%r31, [%r19 + %r0]
	.word 0xf47461de  ! 1438: STX_I	stx	%r26, [%r17 + 0x01de]
	.word 0xf034c000  ! 1439: STH_R	sth	%r24, [%r19 + %r0]
	.word 0xfc2ce032  ! 1443: STB_I	stb	%r30, [%r19 + 0x0032]
	.word 0xb1504000  ! 1447: RDPR_TNPC	rdpr	%tnpc, %r24
	setx	0x10119, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf02d21cb  ! 1451: STB_I	stb	%r24, [%r20 + 0x01cb]
	.word 0xf83c0000  ! 1452: STD_R	std	%r28, [%r16 + %r0]
	.word 0xb5341000  ! 1454: SRLX_R	srlx	%r16, %r0, %r26
	setx	0x2020c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe358000  ! 1458: STH_R	sth	%r31, [%r22 + %r0]
	mov	0, %r12
	.word 0x8f932000  ! 1459: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf6350000  ! 1460: STH_R	sth	%r27, [%r20 + %r0]
	.word 0xf274c000  ! 1466: STX_R	stx	%r25, [%r19 + %r0]
	setx	data_start_1, %g1, %r21
	setx	data_start_5, %g1, %r18
	.word 0xb3510000  ! 1476: RDPR_TICK	rdpr	%tick, %r25
	.word 0xf875e02e  ! 1477: STX_I	stx	%r28, [%r23 + 0x002e]
	.word 0x8594a013  ! 1478: WRPR_TSTATE_I	wrpr	%r18, 0x0013, %tstate
	.word 0xb7510000  ! 1479: RDPR_TICK	rdpr	%tick, %r27
	.word 0xfd3c608c  ! 1482: STDF_I	std	%f30, [0x008c, %r17]
	.word 0xf03c4000  ! 1483: STD_R	std	%r24, [%r17 + %r0]
	.word 0xb60d0000  ! 1488: AND_R	and 	%r20, %r0, %r27
	.word 0xf835a0d5  ! 1489: STH_I	sth	%r28, [%r22 + 0x00d5]
	.word 0xf425c000  ! 1490: STW_R	stw	%r26, [%r23 + %r0]
	.word 0xf43d8000  ! 1493: STD_R	std	%r26, [%r22 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x81983983  ! 1494: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1983, %hpstate
	setx	data_start_3, %g1, %r16
	.word 0xb3510000  ! 1496: RDPR_TICK	rdpr	%tick, %r25
	.word 0xb3510000  ! 1497: RDPR_TICK	<illegal instruction>
	.word 0xf53ce084  ! 1498: STDF_I	std	%f26, [0x0084, %r19]
	.word 0xbf520000  ! 1504: RDPR_PIL	<illegal instruction>
	.word 0xf435208d  ! 1510: STH_I	sth	%r26, [%r20 + 0x008d]
	.word 0x8d946108  ! 1512: WRPR_PSTATE_I	wrpr	%r17, 0x0108, %pstate
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	0x1002a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe2da12f  ! 1521: STB_I	stb	%r31, [%r22 + 0x012f]
	.word 0xfe3461ad  ! 1522: STH_I	sth	%r31, [%r17 + 0x01ad]
	.word 0xf2758000  ! 1523: STX_R	stx	%r25, [%r22 + %r0]
	.word 0xf675a03c  ! 1525: STX_I	stx	%r27, [%r22 + 0x003c]
	setx	0x20107, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc2d4000  ! 1531: STB_R	stb	%r30, [%r21 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x81983e59  ! 1538: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e59, %hpstate
	.word 0xbea5e057  ! 1543: SUBcc_I	subcc 	%r23, 0x0057, %r31
	.word 0xbb518000  ! 1546: RDPR_PSTATE	rdpr	%pstate, %r29
	.word 0x879520bb  ! 1548: WRPR_TT_I	wrpr	%r20, 0x00bb, %tt
	.word 0x8d94e09b  ! 1554: WRPR_PSTATE_I	wrpr	%r19, 0x009b, %pstate
	.word 0xbc440000  ! 1556: ADDC_R	addc 	%r16, %r0, %r30
	ta	T_CHANGE_HPRIV
	.word 0x81982ac9  ! 1558: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ac9, %hpstate
	.word 0xf83c4000  ! 1561: STD_R	std	%r28, [%r17 + %r0]
	.word 0xfc744000  ! 1564: STX_R	stx	%r30, [%r17 + %r0]
	.word 0xb52ca001  ! 1567: SLL_I	sll 	%r18, 0x0001, %r26
	.word 0xb97da401  ! 1568: MOVR_I	movre	%r22, 0x1, %r28
	.word 0xfe35a18e  ! 1570: STH_I	sth	%r31, [%r22 + 0x018e]
	mov	0, %r14
	.word 0xa193a000  ! 1572: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb2ad4000  ! 1573: ANDNcc_R	andncc 	%r21, %r0, %r25
	.word 0xb5520000  ! 1576: RDPR_PIL	rdpr	%pil, %r26
	.word 0xf03460db  ! 1579: STH_I	sth	%r24, [%r17 + 0x00db]
	.word 0xfc750000  ! 1580: STX_R	stx	%r30, [%r20 + %r0]
	.word 0xbb540000  ! 1582: RDPR_GL	<illegal instruction>
	.word 0xf4740000  ! 1586: STX_R	stx	%r26, [%r16 + %r0]
	.word 0xb1508000  ! 1587: RDPR_TSTATE	<illegal instruction>
	.word 0x9194a047  ! 1590: WRPR_PIL_I	wrpr	%r18, 0x0047, %pil
	.word 0xf43c2033  ! 1600: STD_I	std	%r26, [%r16 + 0x0033]
	.word 0x8195e19e  ! 1601: WRPR_TPC_I	wrpr	%r23, 0x019e, %tpc
	.word 0xfc752158  ! 1602: STX_I	stx	%r30, [%r20 + 0x0158]
	.word 0x8794e075  ! 1605: WRPR_TT_I	wrpr	%r19, 0x0075, %tt
	.word 0xb93cf001  ! 1607: SRAX_I	srax	%r19, 0x0001, %r28
	.word 0x8d94e189  ! 1608: WRPR_PSTATE_I	wrpr	%r19, 0x0189, %pstate
	setx	0xe, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x819461b4  ! 1615: WRPR_TPC_I	wrpr	%r17, 0x01b4, %tpc
	.word 0x8194e129  ! 1616: WRPR_TPC_I	wrpr	%r19, 0x0129, %tpc
	.word 0xf4340000  ! 1622: STH_R	sth	%r26, [%r16 + %r0]
	.word 0xf22d20f7  ! 1623: STB_I	stb	%r25, [%r20 + 0x00f7]
	.word 0xff3c207a  ! 1626: STDF_I	std	%f31, [0x007a, %r16]
	.word 0xf0240000  ! 1628: STW_R	stw	%r24, [%r16 + %r0]
	.word 0xfe34e0a0  ! 1629: STH_I	sth	%r31, [%r19 + 0x00a0]
	.word 0xf8750000  ! 1630: STX_R	stx	%r28, [%r20 + %r0]
	.word 0x8194e0af  ! 1632: WRPR_TPC_I	wrpr	%r19, 0x00af, %tpc
	.word 0xbd518000  ! 1633: RDPR_PSTATE	rdpr	%pstate, %r30
	setx	0x10015, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe248000  ! 1637: STW_R	stw	%r31, [%r18 + %r0]
	setx	0x1032d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf0348000  ! 1641: STH_R	sth	%r24, [%r18 + %r0]
	.word 0xf33de144  ! 1642: STDF_I	std	%f25, [0x0144, %r23]
	.word 0xf6342026  ! 1643: STH_I	sth	%r27, [%r16 + 0x0026]
	.word 0xb814e177  ! 1652: OR_I	or 	%r19, 0x0177, %r28
	.word 0xfa250000  ! 1658: STW_R	stw	%r29, [%r20 + %r0]
	.word 0xfa358000  ! 1659: STH_R	sth	%r29, [%r22 + %r0]
	.word 0xf824a021  ! 1663: STW_I	stw	%r28, [%r18 + 0x0021]
	setx	0x3013e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x3003a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc24a0ff  ! 1670: STW_I	stw	%r30, [%r18 + 0x00ff]
	.word 0xfd3ca058  ! 1674: STDF_I	std	%f30, [0x0058, %r18]
	.word 0xfc2c4000  ! 1675: STB_R	stb	%r30, [%r17 + %r0]
	.word 0xf53c21cc  ! 1676: STDF_I	std	%f26, [0x01cc, %r16]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	0x1000e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf23d8000  ! 1681: STD_R	std	%r25, [%r22 + %r0]
	setx	0x3030d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8394614e  ! 1684: WRPR_TNPC_I	wrpr	%r17, 0x014e, %tnpc
	.word 0xbf518000  ! 1688: RDPR_PSTATE	rdpr	%pstate, %r31
	.word 0xfb3de1d9  ! 1689: STDF_I	std	%f29, [0x01d9, %r23]
	mov	2, %r14
	.word 0xa193a000  ! 1690: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf43ce045  ! 1692: STD_I	std	%r26, [%r19 + 0x0045]
	setx	0x10327, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe3d8000  ! 1696: STD_R	std	%r31, [%r22 + %r0]
	.word 0xf53d615d  ! 1702: STDF_I	std	%f26, [0x015d, %r21]
	.word 0xba458000  ! 1704: ADDC_R	addc 	%r22, %r0, %r29
	.word 0xf43c4000  ! 1710: STD_R	std	%r26, [%r17 + %r0]
	.word 0xb53c6001  ! 1711: SRA_I	sra 	%r17, 0x0001, %r26
	.word 0xf8350000  ! 1719: STH_R	sth	%r28, [%r20 + %r0]
	.word 0xb9518000  ! 1724: RDPR_PSTATE	rdpr	%pstate, %r28
	.word 0xf03de0f5  ! 1726: STD_I	std	%r24, [%r23 + 0x00f5]
	.word 0x919521b3  ! 1727: WRPR_PIL_I	wrpr	%r20, 0x01b3, %pil
	.word 0xbcc4e16b  ! 1741: ADDCcc_I	addccc 	%r19, 0x016b, %r30
	.word 0xf674c000  ! 1747: STX_R	stx	%r27, [%r19 + %r0]
	.word 0x8395603b  ! 1748: WRPR_TNPC_I	wrpr	%r21, 0x003b, %tnpc
	.word 0xf8248000  ! 1754: STW_R	stw	%r28, [%r18 + %r0]
	.word 0xb6356109  ! 1758: SUBC_I	orn 	%r21, 0x0109, %r27
	.word 0xfe2d4000  ! 1762: STB_R	stb	%r31, [%r21 + %r0]
	.word 0xb3480000  ! 1764: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	setx	0x3010c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10318, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf53d4000  ! 1769: STDF_R	std	%f26, [%r0, %r21]
	.word 0xf82da0cf  ! 1773: STB_I	stb	%r28, [%r22 + 0x00cf]
	.word 0xb52d8000  ! 1778: SLL_R	sll 	%r22, %r0, %r26
	.word 0xf8248000  ! 1781: STW_R	stw	%r28, [%r18 + %r0]
	setx	0x2020a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81982f59  ! 1787: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f59, %hpstate
	.word 0xf63cc000  ! 1789: STD_R	std	%r27, [%r19 + %r0]
	.word 0xfd3c614d  ! 1792: STDF_I	std	%f30, [0x014d, %r17]
	.word 0xb52c6001  ! 1794: SLL_I	sll 	%r17, 0x0001, %r26
	.word 0xb2054000  ! 1796: ADD_R	add 	%r21, %r0, %r25
	.word 0xb885608d  ! 1801: ADDcc_I	addcc 	%r21, 0x008d, %r28
	.word 0xf42c8000  ! 1805: STB_R	stb	%r26, [%r18 + %r0]
	.word 0xbd480000  ! 1806: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xf73d2006  ! 1818: STDF_I	std	%f27, [0x0006, %r20]
	.word 0xb4348000  ! 1819: ORN_R	orn 	%r18, %r0, %r26
	.word 0xff3d8000  ! 1820: STDF_R	std	%f31, [%r0, %r22]
	setx	0x30222, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfd3ce06f  ! 1826: STDF_I	std	%f30, [0x006f, %r19]
	.word 0xfc740000  ! 1832: STX_R	stx	%r30, [%r16 + %r0]
	.word 0xfe254000  ! 1838: STW_R	stw	%r31, [%r21 + %r0]
	.word 0xf93d0000  ! 1840: STDF_R	std	%f28, [%r0, %r20]
	.word 0xb8b5a19e  ! 1841: SUBCcc_I	orncc 	%r22, 0x019e, %r28
	ta	T_CHANGE_HPRIV
	.word 0x81982e0b  ! 1842: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e0b, %hpstate
	setx	0x216, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf93d2129  ! 1844: STDF_I	std	%f28, [0x0129, %r20]
	.word 0x8394e14d  ! 1845: WRPR_TNPC_I	wrpr	%r19, 0x014d, %tnpc
	setx	0x10039, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81982a81  ! 1847: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a81, %hpstate
	setx	0x1011e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf33da190  ! 1849: STDF_I	std	%f25, [0x0190, %r22]
	.word 0xfe250000  ! 1850: STW_R	stw	%r31, [%r20 + %r0]
	.word 0xb7504000  ! 1851: RDPR_TNPC	rdpr	%tnpc, %r27
	.word 0xfc75a05c  ! 1857: STX_I	stx	%r30, [%r22 + 0x005c]
	.word 0xbd508000  ! 1859: RDPR_TSTATE	<illegal instruction>
	.word 0xb4058000  ! 1861: ADD_R	add 	%r22, %r0, %r26
	setx	0x10136, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf23ce126  ! 1867: STD_I	std	%r25, [%r19 + 0x0126]
	.word 0xf424606f  ! 1868: STW_I	stw	%r26, [%r17 + 0x006f]
	.word 0xbcb58000  ! 1870: SUBCcc_R	orncc 	%r22, %r0, %r30
	setx	data_start_2, %g1, %r19
	.word 0xfa3c0000  ! 1872: STD_R	std	%r29, [%r16 + %r0]
	.word 0xf62ce047  ! 1875: STB_I	stb	%r27, [%r19 + 0x0047]
	setx	0x30030, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8994605a  ! 1878: WRPR_TICK_I	wrpr	%r17, 0x005a, %tick
	.word 0x8395a015  ! 1879: WRPR_TNPC_I	wrpr	%r22, 0x0015, %tnpc
	.word 0xb5480000  ! 1883: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xbc34c000  ! 1887: ORN_R	orn 	%r19, %r0, %r30
	.word 0xfa2da031  ! 1889: STB_I	stb	%r29, [%r22 + 0x0031]
	.word 0xf6244000  ! 1892: STW_R	stw	%r27, [%r17 + %r0]
	.word 0xf42c6008  ! 1893: STB_I	stb	%r26, [%r17 + 0x0008]
	.word 0xf13ce07d  ! 1899: STDF_I	std	%f24, [0x007d, %r19]
	.word 0xfa3cc000  ! 1901: STD_R	std	%r29, [%r19 + %r0]
	.word 0xb150c000  ! 1905: RDPR_TT	rdpr	%tt, %r24
	.word 0x8394e08b  ! 1906: WRPR_TNPC_I	wrpr	%r19, 0x008b, %tnpc
	setx	0xa, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf03da0ce  ! 1909: STD_I	std	%r24, [%r22 + 0x00ce]
	.word 0xfb3d61b3  ! 1910: STDF_I	std	%f29, [0x01b3, %r21]
	.word 0xf2742161  ! 1913: STX_I	stx	%r25, [%r16 + 0x0161]
	.word 0xf0758000  ! 1918: STX_R	stx	%r24, [%r22 + %r0]
	.word 0x8794213a  ! 1921: WRPR_TT_I	wrpr	%r16, 0x013a, %tt
	.word 0xfa3d0000  ! 1925: STD_R	std	%r29, [%r20 + %r0]
	.word 0xbe45e038  ! 1929: ADDC_I	addc 	%r23, 0x0038, %r31
	.word 0xbb520000  ! 1937: RDPR_PIL	rdpr	%pil, %r29
	.word 0x8794a00f  ! 1939: WRPR_TT_I	wrpr	%r18, 0x000f, %tt
	.word 0xb40ca0bf  ! 1947: AND_I	and 	%r18, 0x00bf, %r26
	.word 0x8595a068  ! 1948: WRPR_TSTATE_I	wrpr	%r22, 0x0068, %tstate
	mov	2, %r12
	.word 0x8f932000  ! 1949: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xfc758000  ! 1952: STX_R	stx	%r30, [%r22 + %r0]
	setx	0x21a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	0, %r12
	.word 0x8f932000  ! 1960: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb3510000  ! 1961: RDPR_TICK	rdpr	%tick, %r25
	.word 0xbe2cc000  ! 1964: ANDN_R	andn 	%r19, %r0, %r31
	setx	data_start_0, %g1, %r20
	.word 0xbd51c000  ! 1971: RDPR_TL	<illegal instruction>
	.word 0xbf358000  ! 1972: SRL_R	srl 	%r22, %r0, %r31
	.word 0xf025e02a  ! 1974: STW_I	stw	%r24, [%r23 + 0x002a]
	ta	T_CHANGE_HPRIV
	.word 0x81982e1b  ! 1977: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e1b, %hpstate
	.word 0xf2346131  ! 1979: STH_I	sth	%r25, [%r17 + 0x0131]
	.word 0xfa3dc000  ! 1988: STD_R	std	%r29, [%r23 + %r0]
	setx	0x20113, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x0, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	0, %r12
	.word 0x8f932000  ! 1995: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb5643801  ! 1996: MOVcc_I	<illegal instruction>
	.word 0xf33da073  ! 2001: STDF_I	std	%f25, [0x0073, %r22]
	.word 0xf23d0000  ! 2002: STD_R	std	%r25, [%r20 + %r0]
	.word 0xb7518000  ! 2003: RDPR_PSTATE	rdpr	%pstate, %r27
	setx	0x30213, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	2, %r12
	.word 0x8f932000  ! 2006: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf425a096  ! 2007: STW_I	stw	%r26, [%r22 + 0x0096]
	.word 0xf83d0000  ! 2014: STD_R	std	%r28, [%r20 + %r0]
	.word 0x8d956146  ! 2015: WRPR_PSTATE_I	wrpr	%r21, 0x0146, %pstate
	.word 0x8395e05a  ! 2016: WRPR_TNPC_I	wrpr	%r23, 0x005a, %tnpc
	setx	0x20037, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa3c4000  ! 2018: STD_R	std	%r29, [%r17 + %r0]
	.word 0xb3643801  ! 2019: MOVcc_I	<illegal instruction>
	setx	0x1031b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf73d2108  ! 2028: STDF_I	std	%f27, [0x0108, %r20]
	setx	0x10115, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd520000  ! 2038: RDPR_PIL	rdpr	%pil, %r30
	.word 0xfd3c61a7  ! 2041: STDF_I	std	%f30, [0x01a7, %r17]
	.word 0xf13c4000  ! 2044: STDF_R	std	%f24, [%r0, %r17]
	.word 0xf0244000  ! 2046: STW_R	stw	%r24, [%r17 + %r0]
	.word 0xfe75e1e0  ! 2047: STX_I	stx	%r31, [%r23 + 0x01e0]
	.word 0xf624202c  ! 2048: STW_I	stw	%r27, [%r16 + 0x002c]
	.word 0xfa2cc000  ! 2052: STB_R	stb	%r29, [%r19 + %r0]
	.word 0xf475e0a5  ! 2053: STX_I	stx	%r26, [%r23 + 0x00a5]
	.word 0xfb3c6095  ! 2057: STDF_I	std	%f29, [0x0095, %r17]
	setx	0x103, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x3002f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbe442032  ! 2065: ADDC_I	addc 	%r16, 0x0032, %r31
	.word 0x8194216a  ! 2071: WRPR_TPC_I	wrpr	%r16, 0x016a, %tpc
	.word 0xbb510000  ! 2072: RDPR_TICK	rdpr	%tick, %r29
	.word 0xfa2d0000  ! 2073: STB_R	stb	%r29, [%r20 + %r0]
	.word 0xfc2d4000  ! 2074: STB_R	stb	%r30, [%r21 + %r0]
	.word 0xf6256033  ! 2080: STW_I	stw	%r27, [%r21 + 0x0033]
	.word 0xfe748000  ! 2081: STX_R	stx	%r31, [%r18 + %r0]
	.word 0x8795a103  ! 2083: WRPR_TT_I	wrpr	%r22, 0x0103, %tt
	.word 0xb1518000  ! 2084: RDPR_PSTATE	rdpr	%pstate, %r24
	.word 0xf73da0eb  ! 2085: STDF_I	std	%f27, [0x00eb, %r22]
	.word 0xf03d0000  ! 2086: STD_R	std	%r24, [%r20 + %r0]
	.word 0xf0740000  ! 2088: STX_R	stx	%r24, [%r16 + %r0]
	.word 0xb81561e9  ! 2091: OR_I	or 	%r21, 0x01e9, %r28
	setx	0x1031e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20202, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf6750000  ! 2095: STX_R	stx	%r27, [%r20 + %r0]
	.word 0xbb3c4000  ! 2100: SRA_R	sra 	%r17, %r0, %r29
	.word 0xfc3c8000  ! 2102: STD_R	std	%r30, [%r18 + %r0]
	.word 0xb7500000  ! 2109: RDPR_TPC	<illegal instruction>
	.word 0xfa2521fb  ! 2110: STW_I	stw	%r29, [%r20 + 0x01fb]
	.word 0xf22c8000  ! 2111: STB_R	stb	%r25, [%r18 + %r0]
	setx	0x10037, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb643801  ! 2113: MOVcc_I	<illegal instruction>
	.word 0xfa25203a  ! 2116: STW_I	stw	%r29, [%r20 + 0x003a]
	.word 0xb0950000  ! 2122: ORcc_R	orcc 	%r20, %r0, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf23c0000  ! 2126: STD_R	std	%r25, [%r16 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbf2cc000  ! 2128: SLL_R	sll 	%r19, %r0, %r31
	.word 0xb0348000  ! 2130: SUBC_R	orn 	%r18, %r0, %r24
	.word 0xf8350000  ! 2131: STH_R	sth	%r28, [%r20 + %r0]
	.word 0xf93c0000  ! 2133: STDF_R	std	%f28, [%r0, %r16]
	.word 0xf42c8000  ! 2137: STB_R	stb	%r26, [%r18 + %r0]
	.word 0xf73d6122  ! 2138: STDF_I	std	%f27, [0x0122, %r21]
	.word 0xfc35201f  ! 2139: STH_I	sth	%r30, [%r20 + 0x001f]
	.word 0xf82c614c  ! 2144: STB_I	stb	%r28, [%r17 + 0x014c]
	.word 0x8794e1c8  ! 2151: WRPR_TT_I	wrpr	%r19, 0x01c8, %tt
	.word 0xf03d4000  ! 2152: STD_R	std	%r24, [%r21 + %r0]
	.word 0xfc3c0000  ! 2157: STD_R	std	%r30, [%r16 + %r0]
	.word 0xfa74e092  ! 2158: STX_I	stx	%r29, [%r19 + 0x0092]
	.word 0xb01da1dd  ! 2159: XOR_I	xor 	%r22, 0x01dd, %r24
	.word 0xfb3ce176  ! 2160: STDF_I	std	%f29, [0x0176, %r19]
	.word 0x91956124  ! 2164: WRPR_PIL_I	wrpr	%r21, 0x0124, %pil
	setx	0x10234, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf02d0000  ! 2171: STB_R	stb	%r24, [%r20 + %r0]
	.word 0xf63d4000  ! 2172: STD_R	std	%r27, [%r21 + %r0]
	setx	0x20301, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x3003b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf53c2198  ! 2178: STDF_I	std	%f26, [0x0198, %r16]
	.word 0xf03ca139  ! 2182: STD_I	std	%r24, [%r18 + 0x0139]
	.word 0xf6350000  ! 2185: STH_R	sth	%r27, [%r20 + %r0]
	.word 0x8d95a065  ! 2186: WRPR_PSTATE_I	wrpr	%r22, 0x0065, %pstate
	.word 0xfc344000  ! 2187: STH_R	sth	%r30, [%r17 + %r0]
	.word 0xf23c2154  ! 2188: STD_I	std	%r25, [%r16 + 0x0154]
	.word 0xf03c210c  ! 2191: STD_I	std	%r24, [%r16 + 0x010c]
	.word 0xb9641800  ! 2196: MOVcc_R	<illegal instruction>
	.word 0xf53d8000  ! 2203: STDF_R	std	%f26, [%r0, %r22]
	.word 0xf2240000  ! 2205: STW_R	stw	%r25, [%r16 + %r0]
	.word 0xf03ca0a6  ! 2212: STD_I	std	%r24, [%r18 + 0x00a6]
	.word 0x9195e016  ! 2215: WRPR_PIL_I	wrpr	%r23, 0x0016, %pil
	.word 0xbf51c000  ! 2219: RDPR_TL	rdpr	%tl, %r31
	ta	T_CHANGE_HPRIV
	.word 0x81982c01  ! 2220: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c01, %hpstate
	ta	T_CHANGE_HPRIV
	.word 0x81983a1b  ! 2221: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a1b, %hpstate
	setx	0x30d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10124, %g1, %o0
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
	.word 0xf13c0000  ! 2229: STDF_R	std	%f24, [%r0, %r16]
	.word 0xfa346113  ! 2230: STH_I	sth	%r29, [%r17 + 0x0113]
	.word 0xf8752167  ! 2232: STX_I	stx	%r28, [%r20 + 0x0167]
	.word 0xb7480000  ! 2236: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xb3518000  ! 2238: RDPR_PSTATE	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81983a53  ! 2240: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a53, %hpstate
	ta	T_CHANGE_HPRIV
	.word 0x81982a59  ! 2243: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a59, %hpstate
	setx	0x3c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf03d6182  ! 2246: STD_I	std	%r24, [%r21 + 0x0182]
	.word 0xf0354000  ! 2247: STH_R	sth	%r24, [%r21 + %r0]
	setx	0x30038, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81983bd3  ! 2251: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1bd3, %hpstate
	.word 0xb751c000  ! 2252: RDPR_TL	rdpr	%tl, %r27
	.word 0xf475e1cc  ! 2256: STX_I	stx	%r26, [%r23 + 0x01cc]
	.word 0xf63460e9  ! 2257: STH_I	sth	%r27, [%r17 + 0x00e9]
	.word 0xf07421e5  ! 2258: STX_I	stx	%r24, [%r16 + 0x01e5]
	.word 0x8d9561eb  ! 2262: WRPR_PSTATE_I	wrpr	%r21, 0x01eb, %pstate
	.word 0xf2754000  ! 2263: STX_R	stx	%r25, [%r21 + %r0]
	.word 0xfb3d2044  ! 2266: STDF_I	std	%f29, [0x0044, %r20]
	setx	0x131, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_1, %g1, %r17
	.word 0xf0750000  ! 2272: STX_R	stx	%r24, [%r20 + %r0]
	setx	0x10211, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf22d2056  ! 2279: STB_I	stb	%r25, [%r20 + 0x0056]
	.word 0xfe75208c  ! 2282: STX_I	stx	%r31, [%r20 + 0x008c]
	mov	0, %r12
	.word 0x8f932000  ! 2284: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xff3d8000  ! 2285: STDF_R	std	%f31, [%r0, %r22]
	.word 0xf02421e2  ! 2286: STW_I	stw	%r24, [%r16 + 0x01e2]
	.word 0xf02de14f  ! 2288: STB_I	stb	%r24, [%r23 + 0x014f]
	.word 0xfe258000  ! 2291: STW_R	stw	%r31, [%r22 + %r0]
	.word 0xbf3c4000  ! 2292: SRA_R	sra 	%r17, %r0, %r31
	.word 0xbd3d2001  ! 2295: SRA_I	sra 	%r20, 0x0001, %r30
	.word 0xf43c4000  ! 2298: STD_R	std	%r26, [%r17 + %r0]
	.word 0xf53c0000  ! 2302: STDF_R	std	%f26, [%r0, %r16]
	.word 0xfc340000  ! 2303: STH_R	sth	%r30, [%r16 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x81982b81  ! 2305: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b81, %hpstate
	mov	1, %r14
	.word 0xa193a000  ! 2312: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x336, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf43cc000  ! 2318: STD_R	std	%r26, [%r19 + %r0]
	.word 0xb3508000  ! 2320: RDPR_TSTATE	rdpr	%tstate, %r25
	.word 0xfc2d4000  ! 2321: STB_R	stb	%r30, [%r21 + %r0]
	.word 0xf82c8000  ! 2322: STB_R	stb	%r28, [%r18 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfe75c000  ! 2324: STX_R	stx	%r31, [%r23 + %r0]
	.word 0xf03c61ad  ! 2328: STD_I	std	%r24, [%r17 + 0x01ad]
	setx	data_start_7, %g1, %r21
	.word 0xf63c21dd  ! 2332: STD_I	std	%r27, [%r16 + 0x01dd]
	.word 0xfc250000  ! 2336: STW_R	stw	%r30, [%r20 + %r0]
	setx	data_start_0, %g1, %r23
	.word 0xf635e0f2  ! 2342: STH_I	sth	%r27, [%r23 + 0x00f2]
	setx	0x1002d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa2d21af  ! 2345: STB_I	stb	%r29, [%r20 + 0x01af]
	.word 0xb9540000  ! 2348: RDPR_GL	<illegal instruction>
	.word 0xbd540000  ! 2351: RDPR_GL	<illegal instruction>
	.word 0xf02c4000  ! 2353: STB_R	stb	%r24, [%r17 + %r0]
	.word 0xfd3ca1c0  ! 2356: STDF_I	std	%f30, [0x01c0, %r18]
	.word 0xfa75c000  ! 2357: STX_R	stx	%r29, [%r23 + %r0]
	.word 0x8795e107  ! 2360: WRPR_TT_I	wrpr	%r23, 0x0107, %tt
	.word 0xfc258000  ! 2363: STW_R	stw	%r30, [%r22 + %r0]
	.word 0xb9500000  ! 2366: RDPR_TPC	rdpr	%tpc, %r28
	.word 0x8d95612f  ! 2370: WRPR_PSTATE_I	wrpr	%r21, 0x012f, %pstate
	.word 0xbe04e1d0  ! 2372: ADD_I	add 	%r19, 0x01d0, %r31
	setx	0x20338, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_7, %g1, %r18
	.word 0x919560c9  ! 2381: WRPR_PIL_I	wrpr	%r21, 0x00c9, %pil
	.word 0xb9520000  ! 2383: RDPR_PIL	rdpr	%pil, %r28
	.word 0xb3508000  ! 2387: RDPR_TSTATE	<illegal instruction>
	.word 0xf22d4000  ! 2388: STB_R	stb	%r25, [%r21 + %r0]
	.word 0xb951c000  ! 2392: RDPR_TL	<illegal instruction>
	mov	0, %r12
	.word 0x8f932000  ! 2394: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0x8795a1dd  ! 2396: WRPR_TT_I	wrpr	%r22, 0x01dd, %tt
	.word 0xf42cc000  ! 2398: STB_R	stb	%r26, [%r19 + %r0]
	.word 0xf4740000  ! 2402: STX_R	stx	%r26, [%r16 + %r0]
	.word 0xf435213a  ! 2403: STH_I	sth	%r26, [%r20 + 0x013a]
	.word 0xbb520000  ! 2405: RDPR_PIL	rdpr	%pil, %r29
	.word 0xf43cc000  ! 2406: STD_R	std	%r26, [%r19 + %r0]
	.word 0xfa2ce05d  ! 2411: STB_I	stb	%r29, [%r19 + 0x005d]
	.word 0xfe344000  ! 2413: STH_R	sth	%r31, [%r17 + %r0]
	setx	data_start_0, %g1, %r19
	.word 0xb0ad6052  ! 2418: ANDNcc_I	andncc 	%r21, 0x0052, %r24
	.word 0xf6348000  ! 2421: STH_R	sth	%r27, [%r18 + %r0]
	.word 0xb2c54000  ! 2427: ADDCcc_R	addccc 	%r21, %r0, %r25
	setx	data_start_2, %g1, %r20
	.word 0xf43da022  ! 2432: STD_I	std	%r26, [%r22 + 0x0022]
	.word 0xf2340000  ! 2435: STH_R	sth	%r25, [%r16 + %r0]
	.word 0x8394e002  ! 2436: WRPR_TNPC_I	wrpr	%r19, 0x0002, %tnpc
	.word 0x83952078  ! 2437: WRPR_TNPC_I	wrpr	%r20, 0x0078, %tnpc
	.word 0xfa35604d  ! 2438: STH_I	sth	%r29, [%r21 + 0x004d]
	.word 0xbf480000  ! 2439: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xfb3d20b1  ! 2441: STDF_I	std	%f29, [0x00b1, %r20]
	.word 0x8395e1f6  ! 2442: WRPR_TNPC_I	wrpr	%r23, 0x01f6, %tnpc
	.word 0xf42c4000  ! 2444: STB_R	stb	%r26, [%r17 + %r0]
	.word 0xf22560eb  ! 2445: STW_I	stw	%r25, [%r21 + 0x00eb]
	.word 0xbd51c000  ! 2446: RDPR_TL	rdpr	%tl, %r30
	.word 0xfc744000  ! 2450: STX_R	stx	%r30, [%r17 + %r0]
	.word 0xb89c0000  ! 2452: XORcc_R	xorcc 	%r16, %r0, %r28
	mov	1, %r14
	.word 0xa193a000  ! 2453: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	data_start_0, %g1, %r19
	.word 0x819560ff  ! 2458: WRPR_TPC_I	wrpr	%r21, 0x00ff, %tpc
	.word 0xfa258000  ! 2462: STW_R	stw	%r29, [%r22 + %r0]
	.word 0xf035612c  ! 2464: STH_I	sth	%r24, [%r21 + 0x012c]
	setx	0x2031e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8994a1ab  ! 2471: WRPR_TICK_I	wrpr	%r18, 0x01ab, %tick
	setx	0x10328, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x3020e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa248000  ! 2475: STW_R	stw	%r29, [%r18 + %r0]
	.word 0xb32de001  ! 2477: SLL_I	sll 	%r23, 0x0001, %r25
	.word 0xfb3cc000  ! 2485: STDF_R	std	%f29, [%r0, %r19]
	.word 0xf62d2013  ! 2487: STB_I	stb	%r27, [%r20 + 0x0013]
	setx	data_start_5, %g1, %r23
	.word 0xb7520000  ! 2491: RDPR_PIL	rdpr	%pil, %r27
	.word 0x91946035  ! 2492: WRPR_PIL_I	wrpr	%r17, 0x0035, %pil
	.word 0xfc24c000  ! 2494: STW_R	stw	%r30, [%r19 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x81982b01  ! 2495: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b01, %hpstate
	.word 0x8595e185  ! 2499: WRPR_TSTATE_I	wrpr	%r23, 0x0185, %tstate
	setx	data_start_3, %g1, %r22
	.word 0xf33da137  ! 2505: STDF_I	std	%f25, [0x0137, %r22]
	setx	0x3020a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8994a12c  ! 2507: WRPR_TICK_I	wrpr	%r18, 0x012c, %tick
	.word 0xf83cc000  ! 2508: STD_R	std	%r28, [%r19 + %r0]
	.word 0xfe34c000  ! 2513: STH_R	sth	%r31, [%r19 + %r0]
	.word 0x87946004  ! 2514: WRPR_TT_I	wrpr	%r17, 0x0004, %tt
	.word 0xbf508000  ! 2515: RDPR_TSTATE	rdpr	%tstate, %r31
	.word 0xb1520000  ! 2517: RDPR_PIL	<illegal instruction>
	.word 0x819420af  ! 2521: WRPR_TPC_I	wrpr	%r16, 0x00af, %tpc
	.word 0xf73c213a  ! 2524: STDF_I	std	%f27, [0x013a, %r16]
	.word 0xf0358000  ! 2526: STH_R	sth	%r24, [%r22 + %r0]
	.word 0xf82d8000  ! 2527: STB_R	stb	%r28, [%r22 + %r0]
	.word 0xf53dc000  ! 2529: STDF_R	std	%f26, [%r0, %r23]
	.word 0xfc2460b1  ! 2530: STW_I	stw	%r30, [%r17 + 0x00b1]
	.word 0xf8340000  ! 2532: STH_R	sth	%r28, [%r16 + %r0]
	setx	0x10317, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb13da001  ! 2541: SRA_I	sra 	%r22, 0x0001, %r24
	.word 0x8595a15d  ! 2542: WRPR_TSTATE_I	wrpr	%r22, 0x015d, %tstate
	.word 0xb2148000  ! 2545: OR_R	or 	%r18, %r0, %r25
	.word 0xf53c0000  ! 2546: STDF_R	std	%f26, [%r0, %r16]
	.word 0xf025618d  ! 2550: STW_I	stw	%r24, [%r21 + 0x018d]
	.word 0xfa248000  ! 2551: STW_R	stw	%r29, [%r18 + %r0]
	.word 0xf53dc000  ! 2553: STDF_R	std	%f26, [%r0, %r23]
	setx	0x10134, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf53c6055  ! 2558: STDF_I	std	%f26, [0x0055, %r17]
	setx	0x1000d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1480000  ! 2563: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	setx	0x113, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x336, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb6c4a165  ! 2568: ADDCcc_I	addccc 	%r18, 0x0165, %r27
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xfe35e1cc  ! 2571: STH_I	sth	%r31, [%r23 + 0x01cc]
	.word 0xfe74602e  ! 2572: STX_I	stx	%r31, [%r17 + 0x002e]
	.word 0xbf2c0000  ! 2577: SLL_R	sll 	%r16, %r0, %r31
	.word 0xf62ce097  ! 2579: STB_I	stb	%r27, [%r19 + 0x0097]
	.word 0xf824e0f4  ! 2580: STW_I	stw	%r28, [%r19 + 0x00f4]
	.word 0xf835a10c  ! 2582: STH_I	sth	%r28, [%r22 + 0x010c]
	.word 0xbebd61c0  ! 2584: XNORcc_I	xnorcc 	%r21, 0x01c0, %r31
	.word 0xf53d201f  ! 2589: STDF_I	std	%f26, [0x001f, %r20]
	.word 0xf6250000  ! 2590: STW_R	stw	%r27, [%r20 + %r0]
	.word 0xf674208c  ! 2592: STX_I	stx	%r27, [%r16 + 0x008c]
	.word 0xfa3c4000  ! 2604: STD_R	std	%r29, [%r17 + %r0]
	.word 0xf6346094  ! 2606: STH_I	sth	%r27, [%r17 + 0x0094]
	setx	data_start_0, %g1, %r17
	.word 0xf2750000  ! 2612: STX_R	stx	%r25, [%r20 + %r0]
	mov	1, %r12
	.word 0x8f932000  ! 2614: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbc0ca074  ! 2617: AND_I	and 	%r18, 0x0074, %r30
	.word 0xfe25e157  ! 2620: STW_I	stw	%r31, [%r23 + 0x0157]
	.word 0xbf540000  ! 2621: RDPR_GL	rdpr	%-, %r31
	.word 0xf42ce1d2  ! 2623: STB_I	stb	%r26, [%r19 + 0x01d2]
	.word 0xb23de135  ! 2624: XNOR_I	xnor 	%r23, 0x0135, %r25
	.word 0xfa744000  ! 2630: STX_R	stx	%r29, [%r17 + %r0]
	.word 0xba1c4000  ! 2631: XOR_R	xor 	%r17, %r0, %r29
	.word 0x8994a1cf  ! 2635: WRPR_TICK_I	wrpr	%r18, 0x01cf, %tick
	.word 0x859460b7  ! 2636: WRPR_TSTATE_I	wrpr	%r17, 0x00b7, %tstate
	.word 0xf4358000  ! 2637: STH_R	sth	%r26, [%r22 + %r0]
	.word 0xfe3c8000  ! 2639: STD_R	std	%r31, [%r18 + %r0]
	setx	data_start_4, %g1, %r19
	.word 0xb61ca1b1  ! 2643: XOR_I	xor 	%r18, 0x01b1, %r27
	.word 0xf13c4000  ! 2645: STDF_R	std	%f24, [%r0, %r17]
	setx	0x20010, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81983c91  ! 2648: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c91, %hpstate
	setx	0x2031d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf43da058  ! 2654: STD_I	std	%r26, [%r22 + 0x0058]
	.word 0xfa75e04f  ! 2655: STX_I	stx	%r29, [%r23 + 0x004f]
	.word 0xf234e151  ! 2660: STH_I	sth	%r25, [%r19 + 0x0151]
	setx	0x3030e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe750000  ! 2662: STX_R	stx	%r31, [%r20 + %r0]
	.word 0xff3ca1b0  ! 2664: STDF_I	std	%f31, [0x01b0, %r18]
	setx	0x3010c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81982dc9  ! 2667: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dc9, %hpstate
	setx	0x30, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf82ca03d  ! 2674: STB_I	stb	%r28, [%r18 + 0x003d]
	.word 0xff3cc000  ! 2679: STDF_R	std	%f31, [%r0, %r19]
	setx	0x1020b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8395e151  ! 2683: WRPR_TNPC_I	wrpr	%r23, 0x0151, %tnpc
	.word 0xf23dc000  ! 2684: STD_R	std	%r25, [%r23 + %r0]
	.word 0xfc354000  ! 2687: STH_R	sth	%r30, [%r21 + %r0]
	.word 0xfe74c000  ! 2688: STX_R	stx	%r31, [%r19 + %r0]
	.word 0xfa756100  ! 2690: STX_I	stx	%r29, [%r21 + 0x0100]
	.word 0xf62c0000  ! 2691: STB_R	stb	%r27, [%r16 + %r0]
	.word 0xfe248000  ! 2693: STW_R	stw	%r31, [%r18 + %r0]
	setx	0x20024, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5520000  ! 2696: RDPR_PIL	rdpr	%pil, %r26
	.word 0xff3c0000  ! 2697: STDF_R	std	%f31, [%r0, %r16]
	mov	0, %r14
	.word 0xa193a000  ! 2699: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0x8d956007  ! 2701: WRPR_PSTATE_I	wrpr	%r21, 0x0007, %pstate
	.word 0xf2752055  ! 2703: STX_I	stx	%r25, [%r20 + 0x0055]
	.word 0xf62420fd  ! 2707: STW_I	stw	%r27, [%r16 + 0x00fd]
	.word 0xfe348000  ! 2708: STH_R	sth	%r31, [%r18 + %r0]
	.word 0xbcb5606a  ! 2709: SUBCcc_I	orncc 	%r21, 0x006a, %r30
	.word 0xb1518000  ! 2711: RDPR_PSTATE	rdpr	%pstate, %r24
	setx	0x30120, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf2240000  ! 2714: STW_R	stw	%r25, [%r16 + %r0]
	.word 0xbb50c000  ! 2717: RDPR_TT	<illegal instruction>
	setx	0x129, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5500000  ! 2723: RDPR_TPC	<illegal instruction>
	.word 0xfa2cc000  ! 2726: STB_R	stb	%r29, [%r19 + %r0]
	.word 0xf8354000  ! 2731: STH_R	sth	%r28, [%r21 + %r0]
	.word 0xf02c6005  ! 2733: STB_I	stb	%r24, [%r17 + 0x0005]
	.word 0xfb3d20a1  ! 2739: STDF_I	std	%f29, [0x00a1, %r20]
	.word 0xf8344000  ! 2745: STH_R	sth	%r28, [%r17 + %r0]
	.word 0xf074c000  ! 2753: STX_R	stx	%r24, [%r19 + %r0]
	.word 0xb32d5000  ! 2754: SLLX_R	sllx	%r21, %r0, %r25
	.word 0xf63c0000  ! 2755: STD_R	std	%r27, [%r16 + %r0]
	.word 0xf835a1cb  ! 2760: STH_I	sth	%r28, [%r22 + 0x01cb]
	.word 0xfe3dc000  ! 2761: STD_R	std	%r31, [%r23 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x81982f19  ! 2765: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f19, %hpstate
	setx	0x30321, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb2248000  ! 2769: SUB_R	sub 	%r18, %r0, %r25
	.word 0xbd2dd000  ! 2773: SLLX_R	sllx	%r23, %r0, %r30
	.word 0xbf500000  ! 2774: RDPR_TPC	rdpr	%tpc, %r31
	setx	0x10105, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x879561e0  ! 2776: WRPR_TT_I	wrpr	%r21, 0x01e0, %tt
	.word 0xba958000  ! 2783: ORcc_R	orcc 	%r22, %r0, %r29
	.word 0xf33d6088  ! 2789: STDF_I	std	%f25, [0x0088, %r21]
	.word 0xfa35c000  ! 2792: STH_R	sth	%r29, [%r23 + %r0]
	.word 0xf834a04f  ! 2793: STH_I	sth	%r28, [%r18 + 0x004f]
	.word 0xfa74a0c4  ! 2797: STX_I	stx	%r29, [%r18 + 0x00c4]
	.word 0xb2054000  ! 2801: ADD_R	add 	%r21, %r0, %r25
	.word 0xf4358000  ! 2807: STH_R	sth	%r26, [%r22 + %r0]
	.word 0xf82da12a  ! 2809: STB_I	stb	%r28, [%r22 + 0x012a]
	setx	0x30024, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30022, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf480000  ! 2817: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xb53cb001  ! 2820: SRAX_I	srax	%r18, 0x0001, %r26
	.word 0xfa358000  ! 2825: STH_R	sth	%r29, [%r22 + %r0]
	.word 0xf87560d1  ! 2827: STX_I	stx	%r28, [%r21 + 0x00d1]
	.word 0x8194a150  ! 2832: WRPR_TPC_I	wrpr	%r18, 0x0150, %tpc
	.word 0xf23ce16b  ! 2835: STD_I	std	%r25, [%r19 + 0x016b]
	.word 0xbb508000  ! 2838: RDPR_TSTATE	rdpr	%tstate, %r29
	.word 0xfe24e082  ! 2840: STW_I	stw	%r31, [%r19 + 0x0082]
	.word 0xbf2cd000  ! 2843: SLLX_R	sllx	%r19, %r0, %r31
	.word 0x8995a0ac  ! 2844: WRPR_TICK_I	wrpr	%r22, 0x00ac, %tick
	.word 0xf83ce104  ! 2846: STD_I	std	%r28, [%r19 + 0x0104]
	.word 0xfc2c602d  ! 2847: STB_I	stb	%r30, [%r17 + 0x002d]
	.word 0xfe24610d  ! 2854: STW_I	stw	%r31, [%r17 + 0x010d]
	.word 0xfa250000  ! 2855: STW_R	stw	%r29, [%r20 + %r0]
	.word 0xbd2c4000  ! 2856: SLL_R	sll 	%r17, %r0, %r30
	.word 0xfc24c000  ! 2857: STW_R	stw	%r30, [%r19 + %r0]
	.word 0xb93da001  ! 2859: SRA_I	sra 	%r22, 0x0001, %r28
	.word 0xb53d8000  ! 2860: SRA_R	sra 	%r22, %r0, %r26
	setx	0x3023f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r23
	.word 0xf8340000  ! 2871: STH_R	sth	%r28, [%r16 + %r0]
	.word 0xfa3da154  ! 2875: STD_I	std	%r29, [%r22 + 0x0154]
	ta	T_CHANGE_HPRIV
	.word 0x81983893  ! 2876: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1893, %hpstate
	.word 0xbc2d4000  ! 2877: ANDN_R	andn 	%r21, %r0, %r30
	.word 0xfc74c000  ! 2878: STX_R	stx	%r30, [%r19 + %r0]
	setx	data_start_3, %g1, %r23
	setx	0x2001a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20039, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc3d8000  ! 2894: STD_R	std	%r30, [%r22 + %r0]
	.word 0xb5500000  ! 2895: RDPR_TPC	rdpr	%tpc, %r26
	setx	0x3032f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf674e189  ! 2902: STX_I	stx	%r27, [%r19 + 0x0189]
	mov	2, %r12
	.word 0x8f932000  ! 2903: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0x8994e031  ! 2904: WRPR_TICK_I	wrpr	%r19, 0x0031, %tick
	.word 0xfe34a128  ! 2905: STH_I	sth	%r31, [%r18 + 0x0128]
	.word 0xf2758000  ! 2906: STX_R	stx	%r25, [%r22 + %r0]
	setx	0x20237, %g1, %o0
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
	.word 0xbb504000  ! 2918: RDPR_TNPC	rdpr	%tnpc, %r29
	setx	0x21e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf4248000  ! 2920: STW_R	stw	%r26, [%r18 + %r0]
	.word 0xb551c000  ! 2922: RDPR_TL	<illegal instruction>
	.word 0xf82de0f2  ! 2923: STB_I	stb	%r28, [%r23 + 0x00f2]
	.word 0xf675c000  ! 2926: STX_R	stx	%r27, [%r23 + %r0]
	.word 0xf82c61f9  ! 2928: STB_I	stb	%r28, [%r17 + 0x01f9]
	.word 0xf03c0000  ! 2930: STD_R	std	%r24, [%r16 + %r0]
	.word 0xfd3d6034  ! 2931: STDF_I	std	%f30, [0x0034, %r21]
	setx	data_start_0, %g1, %r16
	mov	0, %r12
	.word 0x8f932000  ! 2937: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	0x20221, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb2d4000  ! 2942: SLL_R	sll 	%r21, %r0, %r29
	setx	0x2023b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe756088  ! 2944: STX_I	stx	%r31, [%r21 + 0x0088]
	setx	0x10102, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf23561be  ! 2947: STH_I	sth	%r25, [%r21 + 0x01be]
	.word 0xf625a061  ! 2953: STW_I	stw	%r27, [%r22 + 0x0061]
	.word 0xbaa4c000  ! 2957: SUBcc_R	subcc 	%r19, %r0, %r29
	.word 0xfe240000  ! 2958: STW_R	stw	%r31, [%r16 + %r0]
	.word 0xbf50c000  ! 2960: RDPR_TT	rdpr	%tt, %r31
	.word 0xf635c000  ! 2965: STH_R	sth	%r27, [%r23 + %r0]
	setx	0x10301, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xff3cc000  ! 2969: STDF_R	std	%f31, [%r0, %r19]
	.word 0xbb520000  ! 2974: RDPR_PIL	<illegal instruction>
	.word 0xf2354000  ! 2976: STH_R	sth	%r25, [%r21 + %r0]
	.word 0xbc940000  ! 2977: ORcc_R	orcc 	%r16, %r0, %r30
	setx	data_start_4, %g1, %r19
	.word 0xf024212f  ! 2981: STW_I	stw	%r24, [%r16 + 0x012f]
	.word 0x8394a1a6  ! 2982: WRPR_TNPC_I	wrpr	%r18, 0x01a6, %tnpc
	.word 0xf875c000  ! 2984: STX_R	stx	%r28, [%r23 + %r0]
	.word 0xf224e11a  ! 2985: STW_I	stw	%r25, [%r19 + 0x011a]
	.word 0xbcb4e037  ! 2986: ORNcc_I	orncc 	%r19, 0x0037, %r30
	.word 0xf035a0e8  ! 2991: STH_I	sth	%r24, [%r22 + 0x00e8]
	.word 0xfe7561fa  ! 2993: STX_I	stx	%r31, [%r21 + 0x01fa]
	.word 0x919461c0  ! 2996: WRPR_PIL_I	wrpr	%r17, 0x01c0, %pil
	.word 0xf635e090  ! 2999: STH_I	sth	%r27, [%r23 + 0x0090]
	.word 0xf475a0b4  ! 3001: STX_I	stx	%r26, [%r22 + 0x00b4]
	.word 0xf03c8000  ! 3003: STD_R	std	%r24, [%r18 + %r0]
	.word 0xf225c000  ! 3004: STW_R	stw	%r25, [%r23 + %r0]
	.word 0xff3c60fb  ! 3006: STDF_I	std	%f31, [0x00fb, %r17]
	setx	0x32c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb550c000  ! 3013: RDPR_TT	rdpr	%tt, %r26
	.word 0xfe3d8000  ! 3015: STD_R	std	%r31, [%r22 + %r0]
	.word 0xf22d0000  ! 3016: STB_R	stb	%r25, [%r20 + %r0]
	.word 0xb1500000  ! 3017: RDPR_TPC	<illegal instruction>
	.word 0xf8358000  ! 3018: STH_R	sth	%r28, [%r22 + %r0]
	.word 0x8995e1f5  ! 3019: WRPR_TICK_I	wrpr	%r23, 0x01f5, %tick
	.word 0xf024c000  ! 3031: STW_R	stw	%r24, [%r19 + %r0]
	.word 0xb8bd0000  ! 3035: XNORcc_R	xnorcc 	%r20, %r0, %r28
	.word 0x8d9420d2  ! 3039: WRPR_PSTATE_I	wrpr	%r16, 0x00d2, %pstate
	.word 0xf634a184  ! 3041: STH_I	sth	%r27, [%r18 + 0x0184]
	.word 0xb7518000  ! 3042: RDPR_PSTATE	rdpr	%pstate, %r27
	.word 0xf47460f1  ! 3045: STX_I	stx	%r26, [%r17 + 0x00f1]
	setx	data_start_0, %g1, %r19
	.word 0xb52c4000  ! 3053: SLL_R	sll 	%r17, %r0, %r26
	.word 0x9194e0ea  ! 3055: WRPR_PIL_I	wrpr	%r19, 0x00ea, %pil
	.word 0xf82c21bc  ! 3058: STB_I	stb	%r28, [%r16 + 0x01bc]
	.word 0xfc2d0000  ! 3059: STB_R	stb	%r30, [%r20 + %r0]
	.word 0xf4758000  ! 3060: STX_R	stx	%r26, [%r22 + %r0]
	.word 0xb351c000  ! 3061: RDPR_TL	rdpr	%tl, %r25
	.word 0xfe3d2001  ! 3062: STD_I	std	%r31, [%r20 + 0x0001]
	.word 0xb52cb001  ! 3063: SLLX_I	sllx	%r18, 0x0001, %r26
	setx	0x20218, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7504000  ! 3073: RDPR_TNPC	<illegal instruction>
	.word 0xb6040000  ! 3074: ADD_R	add 	%r16, %r0, %r27
	.word 0xf62de0d2  ! 3076: STB_I	stb	%r27, [%r23 + 0x00d2]
	setx	0x314, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20105, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf6744000  ! 3080: STX_R	stx	%r27, [%r17 + %r0]
	setx	0x317, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30301, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5341000  ! 3094: SRLX_R	srlx	%r16, %r0, %r26
	.word 0xf8350000  ! 3096: STH_R	sth	%r28, [%r20 + %r0]
	.word 0xf63da06f  ! 3102: STD_I	std	%r27, [%r22 + 0x006f]
	.word 0xf6248000  ! 3103: STW_R	stw	%r27, [%r18 + %r0]
	.word 0xb62ca082  ! 3104: ANDN_I	andn 	%r18, 0x0082, %r27
	.word 0xf6254000  ! 3107: STW_R	stw	%r27, [%r21 + %r0]
	.word 0xb13cc000  ! 3111: SRA_R	sra 	%r19, %r0, %r24
	.word 0xfa34c000  ! 3112: STH_R	sth	%r29, [%r19 + %r0]
	.word 0x9195a00c  ! 3114: WRPR_PIL_I	wrpr	%r22, 0x000c, %pil
	.word 0xb9508000  ! 3116: RDPR_TSTATE	rdpr	%tstate, %r28
	.word 0xff3ca12c  ! 3118: STDF_I	std	%f31, [0x012c, %r18]
	.word 0xf824c000  ! 3119: STW_R	stw	%r28, [%r19 + %r0]
	.word 0xf63d8000  ! 3122: STD_R	std	%r27, [%r22 + %r0]
	.word 0xf82d4000  ! 3124: STB_R	stb	%r28, [%r21 + %r0]
	.word 0xf4746070  ! 3126: STX_I	stx	%r26, [%r17 + 0x0070]
	.word 0x8994e094  ! 3128: WRPR_TICK_I	wrpr	%r19, 0x0094, %tick
	.word 0xf43ce1fd  ! 3130: STD_I	std	%r26, [%r19 + 0x01fd]
	.word 0xf23da0d5  ! 3132: STD_I	std	%r25, [%r22 + 0x00d5]
	.word 0x81946144  ! 3134: WRPR_TPC_I	wrpr	%r17, 0x0144, %tpc
	setx	0x30216, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_1, %g1, %r16
	.word 0xf22cc000  ! 3146: STB_R	stb	%r25, [%r19 + %r0]
	.word 0x81942064  ! 3148: WRPR_TPC_I	wrpr	%r16, 0x0064, %tpc
	.word 0xf02d8000  ! 3149: STB_R	stb	%r24, [%r22 + %r0]
	.word 0xb550c000  ! 3150: RDPR_TT	rdpr	%tt, %r26
	.word 0xf224e181  ! 3151: STW_I	stw	%r25, [%r19 + 0x0181]
	.word 0xb534b001  ! 3153: SRLX_I	srlx	%r18, 0x0001, %r26
	.word 0xfb3c60f4  ! 3154: STDF_I	std	%f29, [0x00f4, %r17]
	.word 0xb4142128  ! 3156: OR_I	or 	%r16, 0x0128, %r26
	.word 0xf53d0000  ! 3159: STDF_R	std	%f26, [%r0, %r20]
	.word 0xfe3d61f4  ! 3160: STD_I	std	%r31, [%r21 + 0x01f4]
	.word 0xf6740000  ! 3162: STX_R	stx	%r27, [%r16 + %r0]
	.word 0xf23c20e6  ! 3166: STD_I	std	%r25, [%r16 + 0x00e6]
	.word 0xf825a02f  ! 3168: STW_I	stw	%r28, [%r22 + 0x002f]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf23cc000  ! 3173: STD_R	std	%r25, [%r19 + %r0]
	setx	0x20225, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf834c000  ! 3181: STH_R	sth	%r28, [%r19 + %r0]
	.word 0xf4348000  ! 3186: STH_R	sth	%r26, [%r18 + %r0]
	.word 0xb1508000  ! 3188: RDPR_TSTATE	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81983ed3  ! 3193: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ed3, %hpstate
	.word 0xb33c7001  ! 3196: SRAX_I	srax	%r17, 0x0001, %r25
	.word 0xbd518000  ! 3198: RDPR_PSTATE	rdpr	%pstate, %r30
	.word 0x8995e04f  ! 3203: WRPR_TICK_I	wrpr	%r23, 0x004f, %tick
	setx	0x317, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf42da127  ! 3207: STB_I	stb	%r26, [%r22 + 0x0127]
	.word 0xf53ca1f2  ! 3209: STDF_I	std	%f26, [0x01f2, %r18]
	setx	0x204, %g1, %o0
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
	mov	1, %r14
	.word 0xa193a000  ! 3219: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb29c0000  ! 3220: XORcc_R	xorcc 	%r16, %r0, %r25
	.word 0x8595e1b9  ! 3223: WRPR_TSTATE_I	wrpr	%r23, 0x01b9, %tstate
	.word 0xf435e101  ! 3225: STH_I	sth	%r26, [%r23 + 0x0101]
	.word 0xf624a120  ! 3231: STW_I	stw	%r27, [%r18 + 0x0120]
	.word 0xfe2de0d7  ! 3234: STB_I	stb	%r31, [%r23 + 0x00d7]
	.word 0xfb3ca001  ! 3238: STDF_I	std	%f29, [0x0001, %r18]
	.word 0xf22c4000  ! 3240: STB_R	stb	%r25, [%r17 + %r0]
	.word 0xf62c2158  ! 3244: STB_I	stb	%r27, [%r16 + 0x0158]
	.word 0xb550c000  ! 3247: RDPR_TT	rdpr	%tt, %r26
	setx	0x11b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa742127  ! 3251: STX_I	stx	%r29, [%r16 + 0x0127]
	.word 0xb1504000  ! 3255: RDPR_TNPC	<illegal instruction>
	.word 0xb7518000  ! 3256: RDPR_PSTATE	<illegal instruction>
	.word 0xfe2421be  ! 3257: STW_I	stw	%r31, [%r16 + 0x01be]
	.word 0xf02d60d8  ! 3258: STB_I	stb	%r24, [%r21 + 0x00d8]
	.word 0xf424e0f3  ! 3261: STW_I	stw	%r26, [%r19 + 0x00f3]
	setx	0x30005, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf13da189  ! 3264: STDF_I	std	%f24, [0x0189, %r22]
	.word 0xfe3d4000  ! 3265: STD_R	std	%r31, [%r21 + %r0]
	setx	0x1031d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x122, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xff3da13b  ! 3269: STDF_I	std	%f31, [0x013b, %r22]
	.word 0xf874a0cb  ! 3272: STX_I	stx	%r28, [%r18 + 0x00cb]
	.word 0xfc3dc000  ! 3273: STD_R	std	%r30, [%r23 + %r0]
	setx	data_start_6, %g1, %r23
	.word 0xf6740000  ! 3277: STX_R	stx	%r27, [%r16 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbc050000  ! 3281: ADD_R	add 	%r20, %r0, %r30
	.word 0x8194602d  ! 3289: WRPR_TPC_I	wrpr	%r17, 0x002d, %tpc
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0x9194a002  ! 3292: WRPR_PIL_I	wrpr	%r18, 0x0002, %pil
	.word 0xb5518000  ! 3293: RDPR_PSTATE	rdpr	%pstate, %r26
	setx	0x10001, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf475e083  ! 3297: STX_I	stx	%r26, [%r23 + 0x0083]
	.word 0x81946009  ! 3306: WRPR_TPC_I	wrpr	%r17, 0x0009, %tpc
	.word 0xff3ca044  ! 3308: STDF_I	std	%f31, [0x0044, %r18]
	.word 0xff3c2092  ! 3310: STDF_I	std	%f31, [0x0092, %r16]
	.word 0xb8b54000  ! 3312: SUBCcc_R	orncc 	%r21, %r0, %r28
	.word 0xb41c4000  ! 3313: XOR_R	xor 	%r17, %r0, %r26
	.word 0xfb3dc000  ! 3319: STDF_R	std	%f29, [%r0, %r23]
	.word 0xf53da118  ! 3321: STDF_I	std	%f26, [0x0118, %r22]
	.word 0xf83ce0e3  ! 3322: STD_I	std	%r28, [%r19 + 0x00e3]
	.word 0xb625a1ae  ! 3323: SUB_I	sub 	%r22, 0x01ae, %r27
	.word 0x81946193  ! 3324: WRPR_TPC_I	wrpr	%r17, 0x0193, %tpc
	.word 0x8994a1ec  ! 3325: WRPR_TICK_I	wrpr	%r18, 0x01ec, %tick
	.word 0xf23d206d  ! 3326: STD_I	std	%r25, [%r20 + 0x006d]
	.word 0xf83c0000  ! 3329: STD_R	std	%r28, [%r16 + %r0]
	.word 0xf824e15b  ! 3333: STW_I	stw	%r28, [%r19 + 0x015b]
	.word 0xf43ce1bd  ! 3337: STD_I	std	%r26, [%r19 + 0x01bd]
	.word 0xb1508000  ! 3338: RDPR_TSTATE	rdpr	%tstate, %r24
	.word 0x9195e02e  ! 3342: WRPR_PIL_I	wrpr	%r23, 0x002e, %pil
	.word 0xfa75c000  ! 3354: STX_R	stx	%r29, [%r23 + %r0]
	.word 0xf6742072  ! 3355: STX_I	stx	%r27, [%r16 + 0x0072]
	.word 0xb550c000  ! 3356: RDPR_TT	rdpr	%tt, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfc344000  ! 3368: STH_R	sth	%r30, [%r17 + %r0]
	.word 0xbb643801  ! 3370: MOVcc_I	<illegal instruction>
	.word 0xfa2d8000  ! 3371: STB_R	stb	%r29, [%r22 + %r0]
	.word 0xf42d61cd  ! 3373: STB_I	stb	%r26, [%r21 + 0x01cd]
	.word 0xfe3560e0  ! 3377: STH_I	sth	%r31, [%r21 + 0x00e0]
	setx	0x20232, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf4344000  ! 3381: STH_R	sth	%r26, [%r17 + %r0]
	.word 0xf6244000  ! 3382: STW_R	stw	%r27, [%r17 + %r0]
	.word 0xf2240000  ! 3383: STW_R	stw	%r25, [%r16 + %r0]
	.word 0xfa35c000  ! 3384: STH_R	sth	%r29, [%r23 + %r0]
	.word 0xf424a10b  ! 3389: STW_I	stw	%r26, [%r18 + 0x010b]
	.word 0xf42da14b  ! 3390: STB_I	stb	%r26, [%r22 + 0x014b]
	.word 0xf2244000  ! 3391: STW_R	stw	%r25, [%r17 + %r0]
	.word 0xf425c000  ! 3392: STW_R	stw	%r26, [%r23 + %r0]
	.word 0xf83ca07e  ! 3393: STD_I	std	%r28, [%r18 + 0x007e]
	.word 0xf275c000  ! 3395: STX_R	stx	%r25, [%r23 + %r0]
	.word 0xf0744000  ! 3402: STX_R	stx	%r24, [%r17 + %r0]
	setx	0x30137, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf93d8000  ! 3406: STDF_R	std	%f28, [%r0, %r22]
	.word 0xfc7420e5  ! 3407: STX_I	stx	%r30, [%r16 + 0x00e5]
	.word 0xf73cc000  ! 3408: STDF_R	std	%f27, [%r0, %r19]
	.word 0xfc246072  ! 3412: STW_I	stw	%r30, [%r17 + 0x0072]
	.word 0xfc242109  ! 3416: STW_I	stw	%r30, [%r16 + 0x0109]
	.word 0xf63c4000  ! 3420: STD_R	std	%r27, [%r17 + %r0]
	.word 0xf4358000  ! 3421: STH_R	sth	%r26, [%r22 + %r0]
	.word 0xfc3c0000  ! 3423: STD_R	std	%r30, [%r16 + %r0]
	.word 0xf424e089  ! 3424: STW_I	stw	%r26, [%r19 + 0x0089]
	.word 0xb6848000  ! 3426: ADDcc_R	addcc 	%r18, %r0, %r27
	.word 0xf4758000  ! 3429: STX_R	stx	%r26, [%r22 + %r0]
	.word 0xfc748000  ! 3430: STX_R	stx	%r30, [%r18 + %r0]
	.word 0xf82520ff  ! 3435: STW_I	stw	%r28, [%r20 + 0x00ff]
	.word 0xf62d0000  ! 3437: STB_R	stb	%r27, [%r20 + %r0]
	.word 0xf4248000  ! 3438: STW_R	stw	%r26, [%r18 + %r0]
	.word 0xb1520000  ! 3439: RDPR_PIL	<illegal instruction>
	setx	data_start_5, %g1, %r22
	ta	T_CHANGE_HPRIV
	.word 0x81982f4b  ! 3450: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f4b, %hpstate
	.word 0xf82ca1c3  ! 3451: STB_I	stb	%r28, [%r18 + 0x01c3]
	setx	0x30000, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5518000  ! 3459: RDPR_PSTATE	rdpr	%pstate, %r26
	.word 0xb0c58000  ! 3462: ADDCcc_R	addccc 	%r22, %r0, %r24
	.word 0xb09de02a  ! 3463: XORcc_I	xorcc 	%r23, 0x002a, %r24
	.word 0xf8344000  ! 3464: STH_R	sth	%r28, [%r17 + %r0]
	.word 0xfc3d60ea  ! 3467: STD_I	std	%r30, [%r21 + 0x00ea]
	setx	0x20239, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf824e1be  ! 3471: STW_I	stw	%r28, [%r19 + 0x01be]
	setx	0x30322, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7518000  ! 3477: RDPR_PSTATE	<illegal instruction>
	.word 0x8994e043  ! 3481: WRPR_TICK_I	wrpr	%r19, 0x0043, %tick
	.word 0xf0744000  ! 3483: STX_R	stx	%r24, [%r17 + %r0]
	.word 0xf6740000  ! 3485: STX_R	stx	%r27, [%r16 + %r0]
	.word 0xfa2d2030  ! 3490: STB_I	stb	%r29, [%r20 + 0x0030]
	.word 0xfa748000  ! 3497: STX_R	stx	%r29, [%r18 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x8198291b  ! 3498: WRHPR_HPSTATE_I	wrhpr	%r0, 0x091b, %hpstate
	.word 0xfe74a069  ! 3500: STX_I	stx	%r31, [%r18 + 0x0069]
	.word 0xb2ac60d6  ! 3503: ANDNcc_I	andncc 	%r17, 0x00d6, %r25
	.word 0xbb510000  ! 3505: RDPR_TICK	rdpr	%tick, %r29
	.word 0xfe34608e  ! 3510: STH_I	sth	%r31, [%r17 + 0x008e]
	.word 0xf33de1e8  ! 3511: STDF_I	std	%f25, [0x01e8, %r23]
	.word 0xfe2cc000  ! 3512: STB_R	stb	%r31, [%r19 + %r0]
	.word 0xf6346042  ! 3513: STH_I	sth	%r27, [%r17 + 0x0042]
	setx	data_start_1, %g1, %r17
	.word 0xfd3c4000  ! 3519: STDF_R	std	%f30, [%r0, %r17]
	.word 0xfe3c8000  ! 3520: STD_R	std	%r31, [%r18 + %r0]
	setx	0x20134, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7518000  ! 3528: RDPR_PSTATE	<illegal instruction>
	setx	0x30212, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d95e044  ! 3532: WRPR_PSTATE_I	wrpr	%r23, 0x0044, %pstate
	.word 0xfc2ca139  ! 3535: STB_I	stb	%r30, [%r18 + 0x0139]
	.word 0xb5510000  ! 3539: RDPR_TICK	rdpr	%tick, %r26
	.word 0xf47560a6  ! 3541: STX_I	stx	%r26, [%r21 + 0x00a6]
	.word 0xb750c000  ! 3544: RDPR_TT	<illegal instruction>
	.word 0xff3c0000  ! 3545: STDF_R	std	%f31, [%r0, %r16]
	.word 0x8795e1d5  ! 3547: WRPR_TT_I	wrpr	%r23, 0x01d5, %tt
	.word 0xfe34e0b1  ! 3549: STH_I	sth	%r31, [%r19 + 0x00b1]
	.word 0xbb540000  ! 3550: RDPR_GL	rdpr	%-, %r29
	.word 0xf82d604b  ! 3552: STB_I	stb	%r28, [%r21 + 0x004b]
	.word 0xfa2d4000  ! 3556: STB_R	stb	%r29, [%r21 + %r0]
	.word 0x8594a0e9  ! 3560: WRPR_TSTATE_I	wrpr	%r18, 0x00e9, %tstate
	.word 0x83942154  ! 3567: WRPR_TNPC_I	wrpr	%r16, 0x0154, %tnpc
	mov	2, %r12
	.word 0x8f932000  ! 3568: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xfe34c000  ! 3569: STH_R	sth	%r31, [%r19 + %r0]
	.word 0x859561bd  ! 3570: WRPR_TSTATE_I	wrpr	%r21, 0x01bd, %tstate
	.word 0xbe3d0000  ! 3572: XNOR_R	xnor 	%r20, %r0, %r31
	.word 0xb935d000  ! 3576: SRLX_R	srlx	%r23, %r0, %r28
	.word 0xfa34a1af  ! 3578: STH_I	sth	%r29, [%r18 + 0x01af]
	.word 0xf825c000  ! 3580: STW_R	stw	%r28, [%r23 + %r0]
	.word 0xfc3c0000  ! 3581: STD_R	std	%r30, [%r16 + %r0]
	.word 0x8195e1eb  ! 3584: WRPR_TPC_I	wrpr	%r23, 0x01eb, %tpc
	.word 0xb814c000  ! 3587: OR_R	or 	%r19, %r0, %r28
	.word 0xf82d61dc  ! 3588: STB_I	stb	%r28, [%r21 + 0x01dc]
	.word 0xb7340000  ! 3590: SRL_R	srl 	%r16, %r0, %r27
	.word 0xb9508000  ! 3591: RDPR_TSTATE	rdpr	%tstate, %r28
	.word 0xf23ce024  ! 3592: STD_I	std	%r25, [%r19 + 0x0024]
	setx	0x20237, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8195e06c  ! 3595: WRPR_TPC_I	wrpr	%r23, 0x006c, %tpc
	.word 0xb0ace19e  ! 3602: ANDNcc_I	andncc 	%r19, 0x019e, %r24
	.word 0x839461d7  ! 3603: WRPR_TNPC_I	wrpr	%r17, 0x01d7, %tnpc
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb950c000  ! 3615: RDPR_TT	rdpr	%tt, %r28
	mov	2, %r12
	.word 0x8f932000  ! 3625: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0x83952138  ! 3626: WRPR_TNPC_I	wrpr	%r20, 0x0138, %tnpc
	.word 0xbd520000  ! 3627: RDPR_PIL	rdpr	%pil, %r30
	.word 0xfe244000  ! 3628: STW_R	stw	%r31, [%r17 + %r0]
	setx	data_start_4, %g1, %r20
	.word 0xf024a1fa  ! 3631: STW_I	stw	%r24, [%r18 + 0x01fa]
	.word 0x8595e1f9  ! 3633: WRPR_TSTATE_I	wrpr	%r23, 0x01f9, %tstate
	setx	data_start_5, %g1, %r18
	.word 0xfa242059  ! 3639: STW_I	stw	%r29, [%r16 + 0x0059]
	.word 0xfb3d0000  ! 3640: STDF_R	std	%f29, [%r0, %r20]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf63d8000  ! 3645: STD_R	std	%r27, [%r22 + %r0]
	.word 0xf2744000  ! 3648: STX_R	stx	%r25, [%r17 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf6348000  ! 3651: STH_R	sth	%r27, [%r18 + %r0]
	.word 0xfd3c0000  ! 3657: STDF_R	std	%f30, [%r0, %r16]
	.word 0x83942115  ! 3660: WRPR_TNPC_I	wrpr	%r16, 0x0115, %tnpc
	.word 0xff3d204b  ! 3662: STDF_I	std	%f31, [0x004b, %r20]
	setx	0x1031f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf8254000  ! 3664: STW_R	stw	%r28, [%r21 + %r0]
	.word 0xbb500000  ! 3665: RDPR_TPC	rdpr	%tpc, %r29
	setx	0x30214, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb6256062  ! 3672: SUB_I	sub 	%r21, 0x0062, %r27
	.word 0xfa2c0000  ! 3673: STB_R	stb	%r29, [%r16 + %r0]
	.word 0xfb3c4000  ! 3675: STDF_R	std	%f29, [%r0, %r17]
	.word 0xbf510000  ! 3676: RDPR_TICK	<illegal instruction>
	.word 0xb0848000  ! 3681: ADDcc_R	addcc 	%r18, %r0, %r24
	setx	0x30303, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe25c000  ! 3688: STW_R	stw	%r31, [%r23 + %r0]
	setx	0x6, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe252017  ! 3690: STW_I	stw	%r31, [%r20 + 0x0017]
	.word 0x8d94e164  ! 3692: WRPR_PSTATE_I	wrpr	%r19, 0x0164, %pstate
	.word 0xf474e081  ! 3694: STX_I	stx	%r26, [%r19 + 0x0081]
	setx	0x30334, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf93d203b  ! 3698: STDF_I	std	%f28, [0x003b, %r20]
	.word 0x89952197  ! 3701: WRPR_TICK_I	wrpr	%r20, 0x0197, %tick
	setx	data_start_1, %g1, %r23
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	setx	0x30204, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x9194a012  ! 3712: WRPR_PIL_I	wrpr	%r18, 0x0012, %pil
	ta	T_CHANGE_HPRIV
	.word 0x81983dc3  ! 3713: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1dc3, %hpstate
	.word 0xb01c8000  ! 3717: XOR_R	xor 	%r18, %r0, %r24
	.word 0xf03dc000  ! 3720: STD_R	std	%r24, [%r23 + %r0]
	.word 0xff3c61d3  ! 3721: STDF_I	std	%f31, [0x01d3, %r17]
	.word 0xfa754000  ! 3722: STX_R	stx	%r29, [%r21 + %r0]
	setx	0x10337, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe252127  ! 3725: STW_I	stw	%r31, [%r20 + 0x0127]
	.word 0xfa344000  ! 3730: STH_R	sth	%r29, [%r17 + %r0]
	.word 0xb3346001  ! 3731: SRL_I	srl 	%r17, 0x0001, %r25
	.word 0xf42d61aa  ! 3734: STB_I	stb	%r26, [%r21 + 0x01aa]
	.word 0xf83d0000  ! 3735: STD_R	std	%r28, [%r20 + %r0]
	setx	data_start_4, %g1, %r18
	.word 0x8594e01a  ! 3737: WRPR_TSTATE_I	wrpr	%r19, 0x001a, %tstate
	.word 0xb8244000  ! 3738: SUB_R	sub 	%r17, %r0, %r28
	.word 0xbd520000  ! 3739: RDPR_PIL	rdpr	%pil, %r30
	.word 0xb6bc6041  ! 3740: XNORcc_I	xnorcc 	%r17, 0x0041, %r27
	setx	0x20139, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd520000  ! 3744: RDPR_PIL	<illegal instruction>
	.word 0xfa244000  ! 3753: STW_R	stw	%r29, [%r17 + %r0]
	.word 0x9195e121  ! 3754: WRPR_PIL_I	wrpr	%r23, 0x0121, %pil
	.word 0xfc3ce0f5  ! 3756: STD_I	std	%r30, [%r19 + 0x00f5]
	setx	0x3002b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf2742037  ! 3761: STX_I	stx	%r25, [%r16 + 0x0037]
	.word 0xf874a14b  ! 3768: STX_I	stx	%r28, [%r18 + 0x014b]
	.word 0xf63ca1ad  ! 3771: STD_I	std	%r27, [%r18 + 0x01ad]
	.word 0xf62c602e  ! 3772: STB_I	stb	%r27, [%r17 + 0x002e]
	.word 0xb23c2153  ! 3778: XNOR_I	xnor 	%r16, 0x0153, %r25
	.word 0xfa74e061  ! 3779: STX_I	stx	%r29, [%r19 + 0x0061]
	.word 0x8995a094  ! 3783: WRPR_TICK_I	wrpr	%r22, 0x0094, %tick
	.word 0xb3520000  ! 3784: RDPR_PIL	rdpr	%pil, %r25
	.word 0xfe258000  ! 3786: STW_R	stw	%r31, [%r22 + %r0]
	setx	0x2022d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb518000  ! 3792: RDPR_PSTATE	<illegal instruction>
	.word 0xf025c000  ! 3793: STW_R	stw	%r24, [%r23 + %r0]
	setx	0x1030e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf42d4000  ! 3800: STB_R	stb	%r26, [%r21 + %r0]
	.word 0xf82c8000  ! 3801: STB_R	stb	%r28, [%r18 + %r0]
	.word 0xf6258000  ! 3803: STW_R	stw	%r27, [%r22 + %r0]
	.word 0xb951c000  ! 3809: RDPR_TL	<illegal instruction>
	.word 0xf83c8000  ! 3811: STD_R	std	%r28, [%r18 + %r0]
	.word 0xb6a50000  ! 3813: SUBcc_R	subcc 	%r20, %r0, %r27
	.word 0xf03d0000  ! 3816: STD_R	std	%r24, [%r20 + %r0]
	.word 0xb92ca001  ! 3818: SLL_I	sll 	%r18, 0x0001, %r28
	.word 0xb7500000  ! 3820: RDPR_TPC	<illegal instruction>
	.word 0xf62ca092  ! 3822: STB_I	stb	%r27, [%r18 + 0x0092]
	.word 0xb9508000  ! 3826: RDPR_TSTATE	<illegal instruction>
	.word 0xfc2c6115  ! 3832: STB_I	stb	%r30, [%r17 + 0x0115]
	.word 0xf475e02a  ! 3842: STX_I	stx	%r26, [%r23 + 0x002a]
	setx	data_start_7, %g1, %r20
	setx	data_start_5, %g1, %r16
	setx	0x1033b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf53ce1a1  ! 3855: STDF_I	std	%f26, [0x01a1, %r19]
	.word 0xf42dc000  ! 3860: STB_R	stb	%r26, [%r23 + %r0]
	.word 0xfa2dc000  ! 3862: STB_R	stb	%r29, [%r23 + %r0]
	.word 0xfe2c8000  ! 3863: STB_R	stb	%r31, [%r18 + %r0]
	.word 0xb2c4c000  ! 3864: ADDCcc_R	addccc 	%r19, %r0, %r25
	setx	0x10123, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf4748000  ! 3866: STX_R	stx	%r26, [%r18 + %r0]
	.word 0xfb3c2106  ! 3868: STDF_I	std	%f29, [0x0106, %r16]
	.word 0xf53c4000  ! 3874: STDF_R	std	%f26, [%r0, %r17]
	.word 0x8395a08d  ! 3876: WRPR_TNPC_I	wrpr	%r22, 0x008d, %tnpc
	setx	0x3022a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xba0c2097  ! 3878: AND_I	and 	%r16, 0x0097, %r29
	.word 0xf83561a1  ! 3879: STH_I	sth	%r28, [%r21 + 0x01a1]
	.word 0x919420a4  ! 3881: WRPR_PIL_I	wrpr	%r16, 0x00a4, %pil
	.word 0xf6258000  ! 3884: STW_R	stw	%r27, [%r22 + %r0]
	.word 0xf474e0a7  ! 3886: STX_I	stx	%r26, [%r19 + 0x00a7]
	.word 0xff3d0000  ! 3888: STDF_R	std	%f31, [%r0, %r20]
	.word 0xf2258000  ! 3889: STW_R	stw	%r25, [%r22 + %r0]
	.word 0xba95601b  ! 3890: ORcc_I	orcc 	%r21, 0x001b, %r29
	.word 0xf434e0da  ! 3891: STH_I	sth	%r26, [%r19 + 0x00da]
	.word 0xf2346044  ! 3896: STH_I	sth	%r25, [%r17 + 0x0044]
	.word 0xf02cc000  ! 3899: STB_R	stb	%r24, [%r19 + %r0]
	.word 0xfe74a133  ! 3901: STX_I	stx	%r31, [%r18 + 0x0133]
	.word 0xf23d2003  ! 3902: STD_I	std	%r25, [%r20 + 0x0003]
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbf3dc000  ! 3906: SRA_R	sra 	%r23, %r0, %r31
	.word 0xfe350000  ! 3908: STH_R	sth	%r31, [%r20 + %r0]
	mov	1, %r14
	.word 0xa193a000  ! 3909: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	data_start_6, %g1, %r19
	setx	0x30027, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc250000  ! 3917: STW_R	stw	%r30, [%r20 + %r0]
	mov	0, %r14
	.word 0xa193a000  ! 3919: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf83c0000  ! 3920: STD_R	std	%r28, [%r16 + %r0]
	.word 0x8795618c  ! 3921: WRPR_TT_I	wrpr	%r21, 0x018c, %tt
	.word 0xb3510000  ! 3927: RDPR_TICK	rdpr	%tick, %r25
	.word 0xf63c0000  ! 3928: STD_R	std	%r27, [%r16 + %r0]
	.word 0xf02c6009  ! 3940: STB_I	stb	%r24, [%r17 + 0x0009]
	.word 0x87956141  ! 3942: WRPR_TT_I	wrpr	%r21, 0x0141, %tt
	.word 0xfc740000  ! 3943: STX_R	stx	%r30, [%r16 + %r0]
	setx	0x30331, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe2c2007  ! 3950: STB_I	stb	%r31, [%r16 + 0x0007]
	.word 0xbb51c000  ! 3954: RDPR_TL	rdpr	%tl, %r29
	.word 0x859560ff  ! 3955: WRPR_TSTATE_I	wrpr	%r21, 0x00ff, %tstate
	.word 0xf33da0b6  ! 3958: STDF_I	std	%f25, [0x00b6, %r22]
	.word 0xbb500000  ! 3961: RDPR_TPC	rdpr	%tpc, %r29
	.word 0x8594e011  ! 3963: WRPR_TSTATE_I	wrpr	%r19, 0x0011, %tstate
	setx	0x10325, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe744000  ! 3966: STX_R	stx	%r31, [%r17 + %r0]
	.word 0xf275c000  ! 3968: STX_R	stx	%r25, [%r23 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb150c000  ! 3976: RDPR_TT	rdpr	%tt, %r24
	.word 0xb5508000  ! 3982: RDPR_TSTATE	<illegal instruction>
	.word 0xf53de163  ! 3984: STDF_I	std	%f26, [0x0163, %r23]
	.word 0xf82461ad  ! 3985: STW_I	stw	%r28, [%r17 + 0x01ad]
	.word 0xf6754000  ! 3986: STX_R	stx	%r27, [%r21 + %r0]
	.word 0xb83dc000  ! 3989: XNOR_R	xnor 	%r23, %r0, %r28
	.word 0xf93c4000  ! 3990: STDF_R	std	%f28, [%r0, %r17]
	.word 0xf03c0000  ! 3993: STD_R	std	%r24, [%r16 + %r0]
	.word 0xfe74a12f  ! 3995: STX_I	stx	%r31, [%r18 + 0x012f]
	setx	0x30236, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa3ca1a5  ! 4000: STD_I	std	%r29, [%r18 + 0x01a5]
	.word 0xf635a1cd  ! 4001: STH_I	sth	%r27, [%r22 + 0x01cd]
	ta	T_CHANGE_HPRIV
	.word 0x8198280b  ! 4008: WRHPR_HPSTATE_I	wrhpr	%r0, 0x080b, %hpstate
	.word 0xf0750000  ! 4009: STX_R	stx	%r24, [%r20 + %r0]
	setx	0x1021d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x879421e6  ! 4018: WRPR_TT_I	wrpr	%r16, 0x01e6, %tt
	setx	data_start_5, %g1, %r22
	setx	0x30320, %g1, %o0
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
	ta	T_CHANGE_HPRIV
	.word 0x81982e03  ! 4027: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e03, %hpstate
	.word 0xbaad4000  ! 4028: ANDNcc_R	andncc 	%r21, %r0, %r29
	setx	0x30210, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20033, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5500000  ! 4035: RDPR_TPC	rdpr	%tpc, %r26
	ta	T_CHANGE_HPRIV
	.word 0x81983c13  ! 4036: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c13, %hpstate
	setx	0x33e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc3d2002  ! 4040: STD_I	std	%r30, [%r20 + 0x0002]
	.word 0xbb500000  ! 4041: RDPR_TPC	rdpr	%tpc, %r29
	.word 0xfc358000  ! 4043: STH_R	sth	%r30, [%r22 + %r0]
	.word 0xb60d4000  ! 4044: AND_R	and 	%r21, %r0, %r27
	.word 0xf0352040  ! 4047: STH_I	sth	%r24, [%r20 + 0x0040]
	.word 0xfa340000  ! 4053: STH_R	sth	%r29, [%r16 + %r0]
	.word 0xb3510000  ! 4055: RDPR_TICK	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x8198280b  ! 4057: WRHPR_HPSTATE_I	wrhpr	%r0, 0x080b, %hpstate
	.word 0xf53c6187  ! 4059: STDF_I	std	%f26, [0x0187, %r17]
	.word 0xf6758000  ! 4074: STX_R	stx	%r27, [%r22 + %r0]
	setx	data_start_5, %g1, %r21
	.word 0xbb520000  ! 4076: RDPR_PIL	rdpr	%pil, %r29
	.word 0xfe750000  ! 4081: STX_R	stx	%r31, [%r20 + %r0]
	.word 0xf13c20c9  ! 4082: STDF_I	std	%f24, [0x00c9, %r16]
	setx	0x229, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf22d2033  ! 4086: STB_I	stb	%r25, [%r20 + 0x0033]
	.word 0xf825a04e  ! 4095: STW_I	stw	%r28, [%r22 + 0x004e]
	setx	0x30116, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf22c0000  ! 4099: STB_R	stb	%r25, [%r16 + %r0]
	.word 0xf2254000  ! 4101: STW_R	stw	%r25, [%r21 + %r0]
	.word 0xfa3dc000  ! 4103: STD_R	std	%r29, [%r23 + %r0]
	.word 0xfe3c8000  ! 4105: STD_R	std	%r31, [%r18 + %r0]
	.word 0xbd510000  ! 4109: RDPR_TICK	<illegal instruction>
	.word 0xf0242056  ! 4110: STW_I	stw	%r24, [%r16 + 0x0056]
	ta	T_CHANGE_HPRIV
	.word 0x81983e01  ! 4112: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e01, %hpstate
	.word 0xf33dc000  ! 4115: STDF_R	std	%f25, [%r0, %r23]
	.word 0xbd500000  ! 4119: RDPR_TPC	rdpr	%tpc, %r30
	.word 0xfe742114  ! 4120: STX_I	stx	%r31, [%r16 + 0x0114]
	setx	0x10c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf0344000  ! 4133: STH_R	sth	%r24, [%r17 + %r0]
	.word 0xfa358000  ! 4134: STH_R	sth	%r29, [%r22 + %r0]
	.word 0xf83cc000  ! 4135: STD_R	std	%r28, [%r19 + %r0]
	.word 0xf824c000  ! 4136: STW_R	stw	%r28, [%r19 + %r0]
	.word 0xf8248000  ! 4140: STW_R	stw	%r28, [%r18 + %r0]
	.word 0xf2750000  ! 4141: STX_R	stx	%r25, [%r20 + %r0]
	.word 0xf6358000  ! 4142: STH_R	sth	%r27, [%r22 + %r0]
	.word 0xf834c000  ! 4145: STH_R	sth	%r28, [%r19 + %r0]
	.word 0xfa2c0000  ! 4147: STB_R	stb	%r29, [%r16 + %r0]
	.word 0xfa758000  ! 4149: STX_R	stx	%r29, [%r22 + %r0]
	mov	1, %r12
	.word 0x8f932000  ! 4153: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf42cc000  ! 4154: STB_R	stb	%r26, [%r19 + %r0]
	mov	2, %r12
	.word 0x8f932000  ! 4157: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	0x3022d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf0258000  ! 4159: STW_R	stw	%r24, [%r22 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x81983843  ! 4160: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1843, %hpstate
	.word 0xf6346190  ! 4162: STH_I	sth	%r27, [%r17 + 0x0190]
	.word 0xf624c000  ! 4163: STW_R	stw	%r27, [%r19 + %r0]
	setx	0x30300, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8594a107  ! 4165: WRPR_TSTATE_I	wrpr	%r18, 0x0107, %tstate
	ta	T_CHANGE_HPRIV
	.word 0x819828d9  ! 4167: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08d9, %hpstate
	.word 0xbb510000  ! 4168: RDPR_TICK	rdpr	%tick, %r29
	.word 0x85946130  ! 4170: WRPR_TSTATE_I	wrpr	%r17, 0x0130, %tstate
	ta	T_CHANGE_HPRIV
	.word 0x81982989  ! 4171: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0989, %hpstate
	setx	0x233, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb2c52030  ! 4174: ADDCcc_I	addccc 	%r20, 0x0030, %r25
	setx	0x30326, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf62560e0  ! 4179: STW_I	stw	%r27, [%r21 + 0x00e0]
	.word 0xff3ce14c  ! 4184: STDF_I	std	%f31, [0x014c, %r19]
	.word 0xb1480000  ! 4185: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xf13d60fa  ! 4189: STDF_I	std	%f24, [0x00fa, %r21]
	.word 0xbabc2119  ! 4191: XNORcc_I	xnorcc 	%r16, 0x0119, %r29
	.word 0xbf3d2001  ! 4192: SRA_I	sra 	%r20, 0x0001, %r31
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb4acc000  ! 4197: ANDNcc_R	andncc 	%r19, %r0, %r26
	setx	0x3030d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf13d0000  ! 4201: STDF_R	std	%f24, [%r0, %r20]
	setx	data_start_2, %g1, %r19
	setx	data_start_4, %g1, %r16
	.word 0xb5480000  ! 4218: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xf82c61df  ! 4220: STB_I	stb	%r28, [%r17 + 0x01df]
	.word 0xb1540000  ! 4221: RDPR_GL	rdpr	%-, %r24
	.word 0xf03c8000  ! 4224: STD_R	std	%r24, [%r18 + %r0]
	.word 0xb751c000  ! 4225: RDPR_TL	<illegal instruction>
	setx	0x10336, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x87946066  ! 4229: WRPR_TT_I	wrpr	%r17, 0x0066, %tt
	setx	0x10b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf4258000  ! 4231: STW_R	stw	%r26, [%r22 + %r0]
	.word 0xbd35a001  ! 4236: SRL_I	srl 	%r22, 0x0001, %r30
	setx	0x30229, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbe0c6101  ! 4238: AND_I	and 	%r17, 0x0101, %r31
	.word 0xf07460a4  ! 4241: STX_I	stx	%r24, [%r17 + 0x00a4]
	.word 0xf2758000  ! 4243: STX_R	stx	%r25, [%r22 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf03da1f1  ! 4249: STD_I	std	%r24, [%r22 + 0x01f1]
	.word 0xf42420a1  ! 4250: STW_I	stw	%r26, [%r16 + 0x00a1]
	.word 0xb551c000  ! 4252: RDPR_TL	rdpr	%tl, %r26
	.word 0xb7518000  ! 4253: RDPR_PSTATE	<illegal instruction>
	.word 0xfa2420f4  ! 4259: STW_I	stw	%r29, [%r16 + 0x00f4]
	setx	0x7, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf82d61f3  ! 4261: STB_I	stb	%r28, [%r21 + 0x01f3]
	.word 0xf824612f  ! 4263: STW_I	stw	%r28, [%r17 + 0x012f]
	.word 0xfa248000  ! 4266: STW_R	stw	%r29, [%r18 + %r0]
	.word 0xf62da169  ! 4275: STB_I	stb	%r27, [%r22 + 0x0169]
	.word 0xf03421aa  ! 4277: STH_I	sth	%r24, [%r16 + 0x01aa]
	setx	data_start_1, %g1, %r16
	.word 0xf23d2048  ! 4280: STD_I	std	%r25, [%r20 + 0x0048]
	setx	0x330, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf02cc000  ! 4291: STB_R	stb	%r24, [%r19 + %r0]
	.word 0xb3504000  ! 4293: RDPR_TNPC	<illegal instruction>
	.word 0xf2246180  ! 4296: STW_I	stw	%r25, [%r17 + 0x0180]
	.word 0x8394e148  ! 4298: WRPR_TNPC_I	wrpr	%r19, 0x0148, %tnpc
	setx	0x10036, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb550c000  ! 4304: RDPR_TT	rdpr	%tt, %r26
	.word 0xfa2c60cf  ! 4306: STB_I	stb	%r29, [%r17 + 0x00cf]
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb7520000  ! 4317: RDPR_PIL	rdpr	%pil, %r27
	setx	0x20311, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5520000  ! 4322: RDPR_PIL	<illegal instruction>
	.word 0xf23ce0fa  ! 4323: STD_I	std	%r25, [%r19 + 0x00fa]
	.word 0xb151c000  ! 4324: RDPR_TL	<illegal instruction>
	.word 0xfc346001  ! 4329: STH_I	sth	%r30, [%r17 + 0x0001]
	.word 0xb7500000  ! 4331: RDPR_TPC	<illegal instruction>
	.word 0xf62d4000  ! 4332: STB_R	stb	%r27, [%r21 + %r0]
	setx	0x3003f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x2001d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf6348000  ! 4338: STH_R	sth	%r27, [%r18 + %r0]
	.word 0xf0346036  ! 4340: STH_I	sth	%r24, [%r17 + 0x0036]
	setx	data_start_5, %g1, %r17
	.word 0xfa2ce11e  ! 4343: STB_I	stb	%r29, [%r19 + 0x011e]
	.word 0xfa3c4000  ! 4347: STD_R	std	%r29, [%r17 + %r0]
	.word 0xf13c4000  ! 4349: STDF_R	std	%f24, [%r0, %r17]
	.word 0xf03dc000  ! 4351: STD_R	std	%r24, [%r23 + %r0]
	setx	0x1013a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x919561e7  ! 4356: WRPR_PIL_I	wrpr	%r21, 0x01e7, %pil
	setx	0x1013b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf624a165  ! 4367: STW_I	stw	%r27, [%r18 + 0x0165]
	.word 0xba3d0000  ! 4369: XNOR_R	xnor 	%r20, %r0, %r29
	setx	0x10228, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf024a1f7  ! 4371: STW_I	stw	%r24, [%r18 + 0x01f7]
	.word 0xf8346133  ! 4372: STH_I	sth	%r28, [%r17 + 0x0133]
	.word 0xf035200e  ! 4382: STH_I	sth	%r24, [%r20 + 0x000e]
	.word 0xf23d2153  ! 4384: STD_I	std	%r25, [%r20 + 0x0153]
	.word 0xbd518000  ! 4385: RDPR_PSTATE	rdpr	%pstate, %r30
	.word 0xfc3d0000  ! 4389: STD_R	std	%r30, [%r20 + %r0]
	.word 0xb6240000  ! 4393: SUB_R	sub 	%r16, %r0, %r27
	.word 0x91942060  ! 4397: WRPR_PIL_I	wrpr	%r16, 0x0060, %pil
	setx	data_start_4, %g1, %r17
	.word 0xbb51c000  ! 4400: RDPR_TL	rdpr	%tl, %r29
	.word 0xb5508000  ! 4401: RDPR_TSTATE	<illegal instruction>
	.word 0xfc25614f  ! 4402: STW_I	stw	%r30, [%r21 + 0x014f]
	setx	0x2030d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfb3c6051  ! 4408: STDF_I	std	%f29, [0x0051, %r17]
	.word 0xfa2c60d2  ! 4409: STB_I	stb	%r29, [%r17 + 0x00d2]
	.word 0xbd500000  ! 4410: RDPR_TPC	rdpr	%tpc, %r30
	.word 0xf625a1b8  ! 4411: STW_I	stw	%r27, [%r22 + 0x01b8]
	.word 0x8395619a  ! 4413: WRPR_TNPC_I	wrpr	%r21, 0x019a, %tnpc
	.word 0xfc342125  ! 4416: STH_I	sth	%r30, [%r16 + 0x0125]
	.word 0xb7480000  ! 4417: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xfc3c8000  ! 4421: STD_R	std	%r30, [%r18 + %r0]
	.word 0xf82520e5  ! 4426: STW_I	stw	%r28, [%r20 + 0x00e5]
	setx	0x30230, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf034c000  ! 4428: STH_R	sth	%r24, [%r19 + %r0]
	.word 0xfc35a1c3  ! 4429: STH_I	sth	%r30, [%r22 + 0x01c3]
	setx	0x303, %g1, %o0
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
	.word 0xfe3420c5  ! 4441: STH_I	sth	%r31, [%r16 + 0x00c5]
	.word 0x899521fd  ! 4444: WRPR_TICK_I	wrpr	%r20, 0x01fd, %tick
	ta	T_CHANGE_HPRIV
	.word 0x8198390b  ! 4445: WRHPR_HPSTATE_I	wrhpr	%r0, 0x190b, %hpstate
	setx	0x12e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x1023d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf2750000  ! 4455: STX_R	stx	%r25, [%r20 + %r0]
	ta	T_CHANGE_HPRIV
	.word 0x81982cc9  ! 4457: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cc9, %hpstate
	.word 0xf22c0000  ! 4458: STB_R	stb	%r25, [%r16 + %r0]
	.word 0x879560c7  ! 4460: WRPR_TT_I	wrpr	%r21, 0x00c7, %tt
	.word 0xfa75c000  ! 4462: STX_R	stx	%r29, [%r23 + %r0]
	.word 0xb7540000  ! 4463: RDPR_GL	rdpr	%-, %r27
	.word 0xb72ce001  ! 4465: SLL_I	sll 	%r19, 0x0001, %r27
	.word 0xff3de08c  ! 4467: STDF_I	std	%f31, [0x008c, %r23]
	setx	0x32a, %g1, %o0
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
	.word 0xbe450000  ! 4474: ADDC_R	addc 	%r20, %r0, %r31
	.word 0x8d956004  ! 4477: WRPR_PSTATE_I	wrpr	%r21, 0x0004, %pstate
	setx	0x30138, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf4252126  ! 4483: STW_I	stw	%r26, [%r20 + 0x0126]
	.word 0xfe2460fd  ! 4486: STW_I	stw	%r31, [%r17 + 0x00fd]
	.word 0xf625c000  ! 4487: STW_R	stw	%r27, [%r23 + %r0]
	setx	0x3022e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf675c000  ! 4489: STX_R	stx	%r27, [%r23 + %r0]
	.word 0xf02ca031  ! 4492: STB_I	stb	%r24, [%r18 + 0x0031]
	.word 0xf62461c8  ! 4493: STW_I	stw	%r27, [%r17 + 0x01c8]
	.word 0xbcc50000  ! 4497: ADDCcc_R	addccc 	%r20, %r0, %r30
	.word 0x8394e096  ! 4499: WRPR_TNPC_I	wrpr	%r19, 0x0096, %tnpc
	.word 0xbc9cc000  ! 4500: XORcc_R	xorcc 	%r19, %r0, %r30
	setx	0x30033, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8994a02e  ! 4510: WRPR_TICK_I	wrpr	%r18, 0x002e, %tick
	.word 0xb750c000  ! 4511: RDPR_TT	rdpr	%tt, %r27
	.word 0xbf7d6401  ! 4513: MOVR_I	movre	%r21, 0x1, %r31
	.word 0xb7641800  ! 4515: MOVcc_R	<illegal instruction>
	.word 0xbb3c5000  ! 4516: SRAX_R	srax	%r17, %r0, %r29
	.word 0x85942111  ! 4519: WRPR_TSTATE_I	wrpr	%r16, 0x0111, %tstate
	setx	0x3000f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8594e051  ! 4523: WRPR_TSTATE_I	wrpr	%r19, 0x0051, %tstate
	.word 0xf33d8000  ! 4524: STDF_R	std	%f25, [%r0, %r22]
	.word 0xfa3c4000  ! 4525: STD_R	std	%r29, [%r17 + %r0]
	.word 0xf13d60c5  ! 4527: STDF_I	std	%f24, [0x00c5, %r21]
	.word 0xff3da09a  ! 4534: STDF_I	std	%f31, [0x009a, %r22]
	.word 0x8994a072  ! 4535: WRPR_TICK_I	wrpr	%r18, 0x0072, %tick
	setx	0x10239, %g1, %o0
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
	.word 0xf6248000  ! 4549: STW_R	stw	%r27, [%r18 + %r0]
	.word 0xfa75a004  ! 4551: STX_I	stx	%r29, [%r22 + 0x0004]
	setx	0x30d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf82c4000  ! 4556: STB_R	stb	%r28, [%r17 + %r0]
	.word 0xf2750000  ! 4558: STX_R	stx	%r25, [%r20 + %r0]
	.word 0xf8758000  ! 4560: STX_R	stx	%r28, [%r22 + %r0]
	setx	0x30102, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc2c8000  ! 4563: STB_R	stb	%r30, [%r18 + %r0]
	.word 0xf62c8000  ! 4566: STB_R	stb	%r27, [%r18 + %r0]
	.word 0xf224a10f  ! 4567: STW_I	stw	%r25, [%r18 + 0x010f]
	.word 0xf02da12a  ! 4568: STB_I	stb	%r24, [%r22 + 0x012a]
	.word 0xbeade176  ! 4570: ANDNcc_I	andncc 	%r23, 0x0176, %r31
	setx	0x1023b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb69dc000  ! 4575: XORcc_R	xorcc 	%r23, %r0, %r27
	.word 0xfa2cc000  ! 4580: STB_R	stb	%r29, [%r19 + %r0]
	.word 0xf425a024  ! 4581: STW_I	stw	%r26, [%r22 + 0x0024]
	.word 0xfa3c0000  ! 4584: STD_R	std	%r29, [%r16 + %r0]
	.word 0xfa2c6053  ! 4591: STB_I	stb	%r29, [%r17 + 0x0053]
	.word 0xb3343001  ! 4597: SRLX_I	srlx	%r16, 0x0001, %r25
	.word 0xf62c60a6  ! 4598: STB_I	stb	%r27, [%r17 + 0x00a6]
	.word 0xf035e037  ! 4600: STH_I	sth	%r24, [%r23 + 0x0037]
	.word 0xfa2de032  ! 4604: STB_I	stb	%r29, [%r23 + 0x0032]
	setx	0x30000, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7480000  ! 4608: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xfe35e0d7  ! 4610: STH_I	sth	%r31, [%r23 + 0x00d7]
	.word 0xfa25c000  ! 4613: STW_R	stw	%r29, [%r23 + %r0]
	setx	0x30328, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf63c0000  ! 4620: STD_R	std	%r27, [%r16 + %r0]
	.word 0xf83de1f2  ! 4623: STD_I	std	%r28, [%r23 + 0x01f2]
	.word 0xfc2de05f  ! 4625: STB_I	stb	%r30, [%r23 + 0x005f]
	.word 0xb6b5216a  ! 4631: ORNcc_I	orncc 	%r20, 0x016a, %r27
	.word 0xb8956113  ! 4634: ORcc_I	orcc 	%r21, 0x0113, %r28
	.word 0xfa744000  ! 4635: STX_R	stx	%r29, [%r17 + %r0]
	.word 0xb9540000  ! 4637: RDPR_GL	rdpr	%-, %r28
	.word 0xf0258000  ! 4639: STW_R	stw	%r24, [%r22 + %r0]
	setx	0x3030e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf23cc000  ! 4647: STD_R	std	%r25, [%r19 + %r0]
	.word 0xf33d4000  ! 4650: STDF_R	std	%f25, [%r0, %r21]
	.word 0xfc2de16b  ! 4651: STB_I	stb	%r30, [%r23 + 0x016b]
	setx	0x3032b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc34e0a0  ! 4656: STH_I	sth	%r30, [%r19 + 0x00a0]
	.word 0xb28ca16a  ! 4657: ANDcc_I	andcc 	%r18, 0x016a, %r25
	.word 0xf82d201f  ! 4659: STB_I	stb	%r28, [%r20 + 0x001f]
	setx	0x10018, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf02d4000  ! 4664: STB_R	stb	%r24, [%r21 + %r0]
	.word 0xf635c000  ! 4666: STH_R	sth	%r27, [%r23 + %r0]
	.word 0xb1500000  ! 4667: RDPR_TPC	<illegal instruction>
	.word 0xfe3d8000  ! 4670: STD_R	std	%r31, [%r22 + %r0]
	.word 0xf625a052  ! 4671: STW_I	stw	%r27, [%r22 + 0x0052]
	.word 0xf2258000  ! 4677: STW_R	stw	%r25, [%r22 + %r0]
	mov	2, %r14
	.word 0xa193a000  ! 4680: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb5358000  ! 4681: SRL_R	srl 	%r22, %r0, %r26
	.word 0xba3cc000  ! 4684: XNOR_R	xnor 	%r19, %r0, %r29
	.word 0xfa7460de  ! 4685: STX_I	stx	%r29, [%r17 + 0x00de]
	setx	0x105, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb814c000  ! 4688: OR_R	or 	%r19, %r0, %r28
	.word 0xb1508000  ! 4691: RDPR_TSTATE	rdpr	%tstate, %r24
	.word 0xf07521f2  ! 4692: STX_I	stx	%r24, [%r20 + 0x01f2]
	.word 0xfe2d0000  ! 4693: STB_R	stb	%r31, [%r20 + %r0]
	.word 0xbd50c000  ! 4694: RDPR_TT	<illegal instruction>
	.word 0xf83d208e  ! 4695: STD_I	std	%r28, [%r20 + 0x008e]
	.word 0xb7540000  ! 4696: RDPR_GL	<illegal instruction>
	.word 0xf474c000  ! 4697: STX_R	stx	%r26, [%r19 + %r0]
	setx	0x23f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf425c000  ! 4703: STW_R	stw	%r26, [%r23 + %r0]
	setx	data_start_0, %g1, %r23
	.word 0xbb50c000  ! 4708: RDPR_TT	<illegal instruction>
	.word 0xfc2d21d2  ! 4709: STB_I	stb	%r30, [%r20 + 0x01d2]
	.word 0xb5520000  ! 4712: RDPR_PIL	<illegal instruction>
	.word 0xb7540000  ! 4715: RDPR_GL	<illegal instruction>
	.word 0xfe2c4000  ! 4716: STB_R	stb	%r31, [%r17 + %r0]
	.word 0xb83420f7  ! 4724: SUBC_I	orn 	%r16, 0x00f7, %r28
	.word 0xb03d2006  ! 4726: XNOR_I	xnor 	%r20, 0x0006, %r24
	.word 0xb7520000  ! 4727: RDPR_PIL	<illegal instruction>
	setx	0x20330, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20024, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8994208d  ! 4738: WRPR_TICK_I	wrpr	%r16, 0x008d, %tick
	setx	0x1023f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8195a09b  ! 4745: WRPR_TPC_I	wrpr	%r22, 0x009b, %tpc
	.word 0xfc3d8000  ! 4747: STD_R	std	%r30, [%r22 + %r0]
	.word 0xf874c000  ! 4748: STX_R	stx	%r28, [%r19 + %r0]
	.word 0xf2248000  ! 4750: STW_R	stw	%r25, [%r18 + %r0]
	.word 0xf8358000  ! 4751: STH_R	sth	%r28, [%r22 + %r0]
	.word 0x9195606a  ! 4753: WRPR_PIL_I	wrpr	%r21, 0x006a, %pil
	.word 0xba34e093  ! 4758: SUBC_I	orn 	%r19, 0x0093, %r29
	setx	0x30221, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20339, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc25e1eb  ! 4773: STW_I	stw	%r30, [%r23 + 0x01eb]
	.word 0xfa24e0f6  ! 4776: STW_I	stw	%r29, [%r19 + 0x00f6]
	.word 0xf4746158  ! 4779: STX_I	stx	%r26, [%r17 + 0x0158]
	.word 0xf43dc000  ! 4781: STD_R	std	%r26, [%r23 + %r0]
	mov	2, %r12
	.word 0x8f932000  ! 4782: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf8354000  ! 4783: STH_R	sth	%r28, [%r21 + %r0]
	.word 0xf23c60c7  ! 4786: STD_I	std	%r25, [%r17 + 0x00c7]
	.word 0xb5510000  ! 4788: RDPR_TICK	rdpr	%tick, %r26
	.word 0xf4254000  ! 4790: STW_R	stw	%r26, [%r21 + %r0]
	.word 0xf03ca1d9  ! 4791: STD_I	std	%r24, [%r18 + 0x01d9]
	.word 0xf22d8000  ! 4793: STB_R	stb	%r25, [%r22 + %r0]
	setx	data_start_1, %g1, %r20
	.word 0xfc75c000  ! 4797: STX_R	stx	%r30, [%r23 + %r0]
	.word 0xf2340000  ! 4798: STH_R	sth	%r25, [%r16 + %r0]
	.word 0xb1641800  ! 4799: MOVcc_R	<illegal instruction>
	.word 0xf33d0000  ! 4800: STDF_R	std	%f25, [%r0, %r20]
	.word 0xf82d6017  ! 4804: STB_I	stb	%r28, [%r21 + 0x0017]
	.word 0xf824a010  ! 4806: STW_I	stw	%r28, [%r18 + 0x0010]
	.word 0xbf3d8000  ! 4812: SRA_R	sra 	%r22, %r0, %r31
	.word 0xb7510000  ! 4814: RDPR_TICK	rdpr	%tick, %r27
	.word 0xf875a0ed  ! 4815: STX_I	stx	%r28, [%r22 + 0x00ed]
	setx	0x210, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3508000  ! 4817: RDPR_TSTATE	<illegal instruction>
	.word 0xf23cc000  ! 4818: STD_R	std	%r25, [%r19 + %r0]
	.word 0x8195a0ee  ! 4819: WRPR_TPC_I	wrpr	%r22, 0x00ee, %tpc
	.word 0x8995e16d  ! 4820: WRPR_TICK_I	wrpr	%r23, 0x016d, %tick
	.word 0xb750c000  ! 4821: RDPR_TT	rdpr	%tt, %r27
	setx	0x20127, %g1, %o0
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
	.word 0xfe350000  ! 4825: STH_R	sth	%r31, [%r20 + %r0]
	.word 0xf43c0000  ! 4828: STD_R	std	%r26, [%r16 + %r0]
	.word 0x8394a06f  ! 4832: WRPR_TNPC_I	wrpr	%r18, 0x006f, %tnpc
	.word 0xf634e189  ! 4833: STH_I	sth	%r27, [%r19 + 0x0189]
	setx	data_start_4, %g1, %r22
	.word 0xf42cc000  ! 4837: STB_R	stb	%r26, [%r19 + %r0]
	.word 0xf13d21a1  ! 4841: STDF_I	std	%f24, [0x01a1, %r20]
	setx	0x222, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc250000  ! 4845: STW_R	stw	%r30, [%r20 + %r0]
	.word 0xfe2da1a2  ! 4846: STB_I	stb	%r31, [%r22 + 0x01a2]
	.word 0xf02dc000  ! 4847: STB_R	stb	%r24, [%r23 + %r0]
	.word 0xf62d209a  ! 4851: STB_I	stb	%r27, [%r20 + 0x009a]
	.word 0xf13c60bd  ! 4853: STDF_I	std	%f24, [0x00bd, %r17]
	.word 0xfe750000  ! 4855: STX_R	stx	%r31, [%r20 + %r0]
	.word 0xfc3561e3  ! 4857: STH_I	sth	%r30, [%r21 + 0x01e3]
	mov	2, %r14
	.word 0xa193a000  ! 4858: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb6940000  ! 4859: ORcc_R	orcc 	%r16, %r0, %r27
	.word 0xfc7560c3  ! 4860: STX_I	stx	%r30, [%r21 + 0x00c3]
	.word 0xf03d4000  ! 4862: STD_R	std	%r24, [%r21 + %r0]
	.word 0xff3d6036  ! 4863: STDF_I	std	%f31, [0x0036, %r21]
	setx	0x138, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb52d5000  ! 4871: SLLX_R	sllx	%r21, %r0, %r26
	.word 0xba8ce1cd  ! 4874: ANDcc_I	andcc 	%r19, 0x01cd, %r29
	.word 0xb1500000  ! 4877: RDPR_TPC	rdpr	%tpc, %r24
	.word 0xf425a0ec  ! 4878: STW_I	stw	%r26, [%r22 + 0x00ec]
	.word 0xfc25e0f8  ! 4880: STW_I	stw	%r30, [%r23 + 0x00f8]
	setx	0x10027, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x125, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20125, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_0, %g1, %r16
	.word 0xf53d0000  ! 4887: STDF_R	std	%f26, [%r0, %r20]
	.word 0xfc2c0000  ! 4890: STB_R	stb	%r30, [%r16 + %r0]
	.word 0xf82ca0d0  ! 4891: STB_I	stb	%r28, [%r18 + 0x00d0]
	.word 0x8394e16e  ! 4892: WRPR_TNPC_I	wrpr	%r19, 0x016e, %tnpc
	.word 0xfa34e093  ! 4896: STH_I	sth	%r29, [%r19 + 0x0093]
	.word 0xb4bd0000  ! 4897: XNORcc_R	xnorcc 	%r20, %r0, %r26
	.word 0xfe258000  ! 4899: STW_R	stw	%r31, [%r22 + %r0]
	.word 0xb951c000  ! 4902: RDPR_TL	rdpr	%tl, %r28
	.word 0xf13ca105  ! 4904: STDF_I	std	%f24, [0x0105, %r18]
	.word 0xf83dc000  ! 4905: STD_R	std	%r28, [%r23 + %r0]
	.word 0xfa254000  ! 4906: STW_R	stw	%r29, [%r21 + %r0]
	.word 0x8795e121  ! 4907: WRPR_TT_I	wrpr	%r23, 0x0121, %tt
	.word 0xb33d6001  ! 4908: SRA_I	sra 	%r21, 0x0001, %r25
	.word 0xf63da168  ! 4909: STD_I	std	%r27, [%r22 + 0x0168]
	.word 0xf435c000  ! 4912: STH_R	sth	%r26, [%r23 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	.word 0x81982bd1  ! 4916: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bd1, %hpstate
	.word 0xfc3de145  ! 4917: STD_I	std	%r30, [%r23 + 0x0145]
	.word 0xf53c21f3  ! 4918: STDF_I	std	%f26, [0x01f3, %r16]
	.word 0x8394a110  ! 4919: WRPR_TNPC_I	wrpr	%r18, 0x0110, %tnpc
	.word 0xb13ce001  ! 4927: SRA_I	sra 	%r19, 0x0001, %r24
	.word 0xfa350000  ! 4929: STH_R	sth	%r29, [%r20 + %r0]
	.word 0xf22c8000  ! 4930: STB_R	stb	%r25, [%r18 + %r0]
	.word 0xbb520000  ! 4934: RDPR_PIL	rdpr	%pil, %r29
	.word 0xfe3cc000  ! 4936: STD_R	std	%r31, [%r19 + %r0]
	.word 0xf2352126  ! 4937: STH_I	sth	%r25, [%r20 + 0x0126]
	setx	0x202, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1480000  ! 4940: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xfa2521f0  ! 4943: STW_I	stw	%r29, [%r20 + 0x01f0]
	setx	0x20022, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r17
	.word 0xf835a101  ! 4949: STH_I	sth	%r28, [%r22 + 0x0101]
	.word 0xf425c000  ! 4950: STW_R	stw	%r26, [%r23 + %r0]
	.word 0xf4244000  ! 4954: STW_R	stw	%r26, [%r17 + %r0]
	.word 0xf83de0c5  ! 4957: STD_I	std	%r28, [%r23 + 0x00c5]
	.word 0xf93c4000  ! 4960: STDF_R	std	%f28, [%r0, %r17]
	.word 0xf13c8000  ! 4961: STDF_R	std	%f24, [%r0, %r18]
	.word 0xf424a0b6  ! 4967: STW_I	stw	%r26, [%r18 + 0x00b6]
	.word 0xfa2d605d  ! 4968: STB_I	stb	%r29, [%r21 + 0x005d]
	.word 0xfe2d20d8  ! 4970: STB_I	stb	%r31, [%r20 + 0x00d8]
	mov	0, %r14
	.word 0xa193a000  ! 4971: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb5518000  ! 4973: RDPR_PSTATE	rdpr	%pstate, %r26
	setx	data_start_0, %g1, %r22
	.word 0xb751c000  ! 4975: RDPR_TL	<illegal instruction>
	.word 0xfa75e11d  ! 4978: STX_I	stx	%r29, [%r23 + 0x011d]
	.word 0xf825a04a  ! 4979: STW_I	stw	%r28, [%r22 + 0x004a]
	setx	0x1030b, %g1, %o0
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
	setx	0x3021e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x3022a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_3, %g1, %r19
	.word 0xf82ce188  ! 4995: STB_I	stb	%r28, [%r19 + 0x0188]
	.word 0xf034a077  ! 4996: STH_I	sth	%r24, [%r18 + 0x0077]
	.word 0xbc3c2163  ! 4997: XNOR_I	xnor 	%r16, 0x0163, %r30
	.word 0xba344000  ! 4998: SUBC_R	orn 	%r17, %r0, %r29
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
	.word 0xfa5c0000  ! 2: LDX_R	ldx	[%r16 + %r0], %r29
	.word 0xfa5dc000  ! 5: LDX_R	ldx	[%r23 + %r0], %r29
	.word 0xfa154000  ! 6: LDUH_R	lduh	[%r21 + %r0], %r29
	.word 0xbe052171  ! 10: ADD_I	add 	%r20, 0x0171, %r31
	.word 0xfa050000  ! 11: LDUW_R	lduw	[%r20 + %r0], %r29
	.word 0xf05dc000  ! 15: LDX_R	ldx	[%r23 + %r0], %r24
	.word 0xf4556093  ! 20: LDSH_I	ldsh	[%r21 + 0x0093], %r26
	.word 0xfe4da10b  ! 23: LDSB_I	ldsb	[%r22 + 0x010b], %r31
	.word 0x859421ac  ! 25: WRPR_TSTATE_I	wrpr	%r16, 0x01ac, %tstate
	.word 0xf71ca0ea  ! 27: LDDF_I	ldd	[%r18, 0x00ea], %f27
	.word 0xb57d0400  ! 31: MOVR_R	movre	%r20, %r0, %r26
	setx	0x10306, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa1c8000  ! 39: LDD_R	ldd	[%r18 + %r0], %r29
	.word 0xfc0c61f4  ! 42: LDUB_I	ldub	[%r17 + 0x01f4], %r30
	.word 0xbf540000  ! 43: RDPR_GL	rdpr	%-, %r31
	.word 0xfc5dc000  ! 44: LDX_R	ldx	[%r23 + %r0], %r30
	.word 0xfc5da140  ! 45: LDX_I	ldx	[%r22 + 0x0140], %r30
	.word 0xbf510000  ! 46: RDPR_TICK	<illegal instruction>
	mov	2, %r12
	.word 0x8f932000  ! 47: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf8550000  ! 50: LDSH_R	ldsh	[%r20 + %r0], %r28
	.word 0xf65d0000  ! 51: LDX_R	ldx	[%r20 + %r0], %r27
	.word 0xf614a012  ! 53: LDUH_I	lduh	[%r18 + 0x0012], %r27
	.word 0xf80cc000  ! 56: LDUB_R	ldub	[%r19 + %r0], %r28
	.word 0x879520d3  ! 60: WRPR_TT_I	wrpr	%r20, 0x00d3, %tt
	.word 0xb9643801  ! 63: MOVcc_I	<illegal instruction>
	.word 0xfc05a1e2  ! 65: LDUW_I	lduw	[%r22 + 0x01e2], %r30
	.word 0xb6b42110  ! 67: ORNcc_I	orncc 	%r16, 0x0110, %r27
	.word 0xf24d8000  ! 68: LDSB_R	ldsb	[%r22 + %r0], %r25
	ta	T_CHANGE_HPRIV
	.word 0x81983a4b  ! 72: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a4b, %hpstate
	.word 0xf4054000  ! 74: LDUW_R	lduw	[%r21 + %r0], %r26
	setx	data_start_0, %g1, %r17
	.word 0xf20da0d2  ! 77: LDUB_I	ldub	[%r22 + 0x00d2], %r25
	setx	0x219, %g1, %o0
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
	.word 0xf61ce0af  ! 85: LDD_I	ldd	[%r19 + 0x00af], %r27
	setx	0x2012a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x9195214c  ! 90: WRPR_PIL_I	wrpr	%r20, 0x014c, %pil
	.word 0xf44c2018  ! 94: LDSB_I	ldsb	[%r16 + 0x0018], %r26
	setx	0x20000, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe0ce0f2  ! 96: LDUB_I	ldub	[%r19 + 0x00f2], %r31
	.word 0xb33cf001  ! 100: SRAX_I	srax	%r19, 0x0001, %r25
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbb50c000  ! 102: RDPR_TT	<illegal instruction>
	.word 0xf6444000  ! 105: LDSW_R	ldsw	[%r17 + %r0], %r27
	.word 0x8594a037  ! 106: WRPR_TSTATE_I	wrpr	%r18, 0x0037, %tstate
	.word 0x89942098  ! 107: WRPR_TICK_I	wrpr	%r16, 0x0098, %tick
	.word 0xbebd61a4  ! 113: XNORcc_I	xnorcc 	%r21, 0x01a4, %r31
	.word 0xb4b4611f  ! 115: SUBCcc_I	orncc 	%r17, 0x011f, %r26
	.word 0xb63cc000  ! 118: XNOR_R	xnor 	%r19, %r0, %r27
	mov	1, %r12
	.word 0x8f932000  ! 119: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xfc440000  ! 122: LDSW_R	ldsw	[%r16 + %r0], %r30
	.word 0x87942103  ! 123: WRPR_TT_I	wrpr	%r16, 0x0103, %tt
	.word 0xb97cc400  ! 124: MOVR_R	movre	%r19, %r0, %r28
	.word 0xfa5ca097  ! 125: LDX_I	ldx	[%r18 + 0x0097], %r29
	.word 0xf31c8000  ! 130: LDDF_R	ldd	[%r18, %r0], %f25
	setx	0x30015, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbe95e10c  ! 135: ORcc_I	orcc 	%r23, 0x010c, %r31
	.word 0xbb500000  ! 137: RDPR_TPC	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb351c000  ! 142: RDPR_TL	<illegal instruction>
	.word 0xf41dc000  ! 143: LDD_R	ldd	[%r23 + %r0], %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	0x219, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7508000  ! 151: RDPR_TSTATE	<illegal instruction>
	.word 0x859421d4  ! 154: WRPR_TSTATE_I	wrpr	%r16, 0x01d4, %tstate
	.word 0xb53df001  ! 155: SRAX_I	srax	%r23, 0x0001, %r26
	.word 0xf2544000  ! 157: LDSH_R	ldsh	[%r17 + %r0], %r25
	.word 0xbf3df001  ! 159: SRAX_I	srax	%r23, 0x0001, %r31
	ta	T_CHANGE_HPRIV
	.word 0x81983f41  ! 161: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f41, %hpstate
	.word 0xfa4dc000  ! 162: LDSB_R	ldsb	[%r23 + %r0], %r29
	.word 0xbb500000  ! 163: RDPR_TPC	<illegal instruction>
	.word 0xf65d6013  ! 164: LDX_I	ldx	[%r21 + 0x0013], %r27
	.word 0xf8548000  ! 173: LDSH_R	ldsh	[%r18 + %r0], %r28
	.word 0xfe55c000  ! 174: LDSH_R	ldsh	[%r23 + %r0], %r31
	.word 0x8195a12a  ! 175: WRPR_TPC_I	wrpr	%r22, 0x012a, %tpc
	setx	data_start_4, %g1, %r18
	.word 0xb150c000  ! 182: RDPR_TT	<illegal instruction>
	.word 0xfe05a10b  ! 183: LDUW_I	lduw	[%r22 + 0x010b], %r31
	.word 0xbd508000  ! 187: RDPR_TSTATE	<illegal instruction>
	.word 0xf24d60b5  ! 190: LDSB_I	ldsb	[%r21 + 0x00b5], %r25
	.word 0xb13cf001  ! 193: SRAX_I	srax	%r19, 0x0001, %r24
	.word 0xfe1d4000  ! 199: LDD_R	ldd	[%r21 + %r0], %r31
	.word 0xbd641800  ! 204: MOVcc_R	<illegal instruction>
	.word 0xf91c6126  ! 205: LDDF_I	ldd	[%r17, 0x0126], %f28
	.word 0xf20de193  ! 211: LDUB_I	ldub	[%r23 + 0x0193], %r25
	.word 0xf24d60d5  ! 212: LDSB_I	ldsb	[%r21 + 0x00d5], %r25
	setx	0x1023d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf21d8000  ! 216: LDD_R	ldd	[%r22 + %r0], %r25
	.word 0xb5520000  ! 217: RDPR_PIL	<illegal instruction>
	.word 0x859420e5  ! 218: WRPR_TSTATE_I	wrpr	%r16, 0x00e5, %tstate
	.word 0x8995601a  ! 219: WRPR_TICK_I	wrpr	%r21, 0x001a, %tick
	.word 0xb151c000  ! 222: RDPR_TL	<illegal instruction>
	setx	0x5, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1504000  ! 226: RDPR_TNPC	<illegal instruction>
	.word 0xff1c8000  ! 228: LDDF_R	ldd	[%r18, %r0], %f31
	mov	1, %r12
	.word 0x8f932000  ! 231: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf41c8000  ! 233: LDD_R	ldd	[%r18 + %r0], %r26
	setx	data_start_4, %g1, %r19
	setx	0x232, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xff1c4000  ! 241: LDDF_R	ldd	[%r17, %r0], %f31
	.word 0xf6144000  ! 243: LDUH_R	lduh	[%r17 + %r0], %r27
	setx	0x30107, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb57d8400  ! 248: MOVR_R	movre	%r22, %r0, %r26
	.word 0x89956156  ! 249: WRPR_TICK_I	wrpr	%r21, 0x0156, %tick
	.word 0xbb51c000  ! 252: RDPR_TL	<illegal instruction>
	.word 0xba05e0b9  ! 255: ADD_I	add 	%r23, 0x00b9, %r29
	.word 0xb3540000  ! 256: RDPR_GL	<illegal instruction>
	setx	0x20333, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf0144000  ! 258: LDUH_R	lduh	[%r17 + %r0], %r24
	.word 0xf44da198  ! 259: LDSB_I	ldsb	[%r22 + 0x0198], %r26
	.word 0x8594a099  ! 266: WRPR_TSTATE_I	wrpr	%r18, 0x0099, %tstate
	.word 0xb351c000  ! 267: RDPR_TL	<illegal instruction>
	.word 0xf04d4000  ! 270: LDSB_R	ldsb	[%r21 + %r0], %r24
	.word 0x89942003  ! 271: WRPR_TICK_I	wrpr	%r16, 0x0003, %tick
	.word 0xf405e0ac  ! 272: LDUW_I	lduw	[%r23 + 0x00ac], %r26
	.word 0xf21c8000  ! 273: LDD_R	ldd	[%r18 + %r0], %r25
	.word 0xf40cc000  ! 275: LDUB_R	ldub	[%r19 + %r0], %r26
	.word 0xbb518000  ! 277: RDPR_PSTATE	<illegal instruction>
	.word 0xf11c8000  ! 279: LDDF_R	ldd	[%r18, %r0], %f24
	.word 0xf6044000  ! 280: LDUW_R	lduw	[%r17 + %r0], %r27
	.word 0xf20ce104  ! 283: LDUB_I	ldub	[%r19 + 0x0104], %r25
	.word 0xfb1cc000  ! 286: LDDF_R	ldd	[%r19, %r0], %f29
	setx	data_start_3, %g1, %r23
	.word 0x8194612e  ! 289: WRPR_TPC_I	wrpr	%r17, 0x012e, %tpc
	.word 0xf44d8000  ! 290: LDSB_R	ldsb	[%r22 + %r0], %r26
	.word 0xf2450000  ! 291: LDSW_R	ldsw	[%r20 + %r0], %r25
	setx	data_start_0, %g1, %r17
	.word 0xfa5ce1c7  ! 303: LDX_I	ldx	[%r19 + 0x01c7], %r29
	.word 0xfa45a086  ! 304: LDSW_I	ldsw	[%r22 + 0x0086], %r29
	.word 0xf2558000  ! 309: LDSH_R	ldsh	[%r22 + %r0], %r25
	.word 0xb750c000  ! 311: RDPR_TT	rdpr	%tt, %r27
	.word 0xf60cc000  ! 312: LDUB_R	ldub	[%r19 + %r0], %r27
	.word 0xfd1ce0ad  ! 315: LDDF_I	ldd	[%r19, 0x00ad], %f30
	setx	data_start_6, %g1, %r20
	.word 0xfc154000  ! 319: LDUH_R	lduh	[%r21 + %r0], %r30
	.word 0x8594e1aa  ! 323: WRPR_TSTATE_I	wrpr	%r19, 0x01aa, %tstate
	.word 0xfc1c4000  ! 324: LDD_R	ldd	[%r17 + %r0], %r30
	.word 0xb3510000  ! 329: RDPR_TICK	<illegal instruction>
	.word 0xf24da036  ! 330: LDSB_I	ldsb	[%r22 + 0x0036], %r25
	.word 0xfc554000  ! 331: LDSH_R	ldsh	[%r21 + %r0], %r30
	.word 0xf04cc000  ! 334: LDSB_R	ldsb	[%r19 + %r0], %r24
	.word 0xb48c4000  ! 341: ANDcc_R	andcc 	%r17, %r0, %r26
	.word 0xfa1d200a  ! 342: LDD_I	ldd	[%r20 + 0x000a], %r29
	.word 0xf604e1f3  ! 343: LDUW_I	lduw	[%r19 + 0x01f3], %r27
	.word 0xf25d20ec  ! 344: LDX_I	ldx	[%r20 + 0x00ec], %r25
	.word 0xfa05a1ab  ! 348: LDUW_I	lduw	[%r22 + 0x01ab], %r29
	.word 0x859521a0  ! 349: WRPR_TSTATE_I	wrpr	%r20, 0x01a0, %tstate
	.word 0xf845c000  ! 351: LDSW_R	ldsw	[%r23 + %r0], %r28
	.word 0xb2bc2149  ! 356: XNORcc_I	xnorcc 	%r16, 0x0149, %r25
	.word 0xf60c210d  ! 362: LDUB_I	ldub	[%r16 + 0x010d], %r27
	.word 0xb814a1ee  ! 366: OR_I	or 	%r18, 0x01ee, %r28
	.word 0xb9540000  ! 369: RDPR_GL	<illegal instruction>
	.word 0xf81c20b0  ! 378: LDD_I	ldd	[%r16 + 0x00b0], %r28
	setx	0x317, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	2, %r14
	.word 0xa193a000  ! 383: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb3510000  ! 385: RDPR_TICK	<illegal instruction>
	.word 0x8d9521e4  ! 387: WRPR_PSTATE_I	wrpr	%r20, 0x01e4, %pstate
	.word 0xfc4d61c7  ! 388: LDSB_I	ldsb	[%r21 + 0x01c7], %r30
	.word 0xbc2c4000  ! 389: ANDN_R	andn 	%r17, %r0, %r30
	.word 0x89946067  ! 392: WRPR_TICK_I	wrpr	%r17, 0x0067, %tick
	.word 0xf24c0000  ! 393: LDSB_R	ldsb	[%r16 + %r0], %r25
	setx	0x312, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf25d8000  ! 396: LDX_R	ldx	[%r22 + %r0], %r25
	.word 0xb494e0b8  ! 400: ORcc_I	orcc 	%r19, 0x00b8, %r26
	.word 0xf24d217e  ! 411: LDSB_I	ldsb	[%r20 + 0x017e], %r25
	.word 0xf254e0be  ! 414: LDSH_I	ldsh	[%r19 + 0x00be], %r25
	.word 0x8d95e078  ! 415: WRPR_PSTATE_I	wrpr	%r23, 0x0078, %pstate
	setx	0x109, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc4d0000  ! 417: LDSB_R	ldsb	[%r20 + %r0], %r30
	setx	0x30333, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf05da08d  ! 421: LDX_I	ldx	[%r22 + 0x008d], %r24
	.word 0xfc458000  ! 424: LDSW_R	ldsw	[%r22 + %r0], %r30
	.word 0xfe448000  ! 427: LDSW_R	ldsw	[%r18 + %r0], %r31
	.word 0xf40da09a  ! 430: LDUB_I	ldub	[%r22 + 0x009a], %r26
	.word 0xbf540000  ! 437: RDPR_GL	rdpr	%-, %r31
	.word 0xf60420d9  ! 442: LDUW_I	lduw	[%r16 + 0x00d9], %r27
	setx	0x10007, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d9460ce  ! 451: WRPR_PSTATE_I	wrpr	%r17, 0x00ce, %pstate
	.word 0xf8558000  ! 454: LDSH_R	ldsh	[%r22 + %r0], %r28
	.word 0xf205c000  ! 458: LDUW_R	lduw	[%r23 + %r0], %r25
	.word 0xfa4c61bf  ! 459: LDSB_I	ldsb	[%r17 + 0x01bf], %r29
	mov	0, %r12
	.word 0x8f932000  ! 460: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb351c000  ! 463: RDPR_TL	<illegal instruction>
	setx	0x20101, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf51da0c4  ! 467: LDDF_I	ldd	[%r22, 0x00c4], %f26
	ta	T_CHANGE_HPRIV
	.word 0x81983851  ! 469: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1851, %hpstate
	setx	0x20031, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81983e19  ! 471: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e19, %hpstate
	.word 0xf04ca02e  ! 472: LDSB_I	ldsb	[%r18 + 0x002e], %r24
	.word 0xbd508000  ! 475: RDPR_TSTATE	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0x839421a7  ! 477: WRPR_TNPC_I	wrpr	%r16, 0x01a7, %tnpc
	.word 0xbf51c000  ! 479: RDPR_TL	<illegal instruction>
	setx	0x125, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x839420ac  ! 482: WRPR_TNPC_I	wrpr	%r16, 0x00ac, %tnpc
	ta	T_CHANGE_HPRIV
	.word 0x81982a09  ! 483: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a09, %hpstate
	.word 0xb5540000  ! 485: RDPR_GL	<illegal instruction>
	.word 0xf05c0000  ! 487: LDX_R	ldx	[%r16 + %r0], %r24
	.word 0xfc45c000  ! 491: LDSW_R	ldsw	[%r23 + %r0], %r30
	.word 0xb08ce036  ! 496: ANDcc_I	andcc 	%r19, 0x0036, %r24
	.word 0xfc4c4000  ! 497: LDSB_R	ldsb	[%r17 + %r0], %r30
	.word 0xf815e0a5  ! 499: LDUH_I	lduh	[%r23 + 0x00a5], %r28
	.word 0xbb7c2401  ! 501: MOVR_I	movre	%r16, 0x1, %r29
	.word 0xfb1d206a  ! 502: LDDF_I	ldd	[%r20, 0x006a], %f29
	.word 0xb3510000  ! 503: RDPR_TICK	<illegal instruction>
	.word 0xf61da13b  ! 507: LDD_I	ldd	[%r22 + 0x013b], %r27
	.word 0xb3480000  ! 509: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xfa5421ff  ! 510: LDSH_I	ldsh	[%r16 + 0x01ff], %r29
	setx	data_start_4, %g1, %r17
	.word 0xfc440000  ! 513: LDSW_R	ldsw	[%r16 + %r0], %r30
	.word 0xf21461e0  ! 514: LDUH_I	lduh	[%r17 + 0x01e0], %r25
	.word 0xf11da171  ! 516: LDDF_I	ldd	[%r22, 0x0171], %f24
	.word 0xfa0da0d7  ! 517: LDUB_I	ldub	[%r22 + 0x00d7], %r29
	.word 0xfe0de182  ! 518: LDUB_I	ldub	[%r23 + 0x0182], %r31
	.word 0xfc4c8000  ! 521: LDSB_R	ldsb	[%r18 + %r0], %r30
	.word 0xf6046018  ! 524: LDUW_I	lduw	[%r17 + 0x0018], %r27
	.word 0x8594607e  ! 525: WRPR_TSTATE_I	wrpr	%r17, 0x007e, %tstate
	.word 0xf2440000  ! 528: LDSW_R	ldsw	[%r16 + %r0], %r25
	.word 0xf81da09c  ! 529: LDD_I	ldd	[%r22 + 0x009c], %r28
	.word 0xfa0d0000  ! 530: LDUB_R	ldub	[%r20 + %r0], %r29
	setx	0x1011d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf44c0000  ! 537: LDSB_R	ldsb	[%r16 + %r0], %r26
	.word 0xf40c6030  ! 539: LDUB_I	ldub	[%r17 + 0x0030], %r26
	setx	data_start_0, %g1, %r19
	setx	0x30329, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfb1dc000  ! 550: LDDF_R	ldd	[%r23, %r0], %f29
	.word 0x8994e1d1  ! 551: WRPR_TICK_I	wrpr	%r19, 0x01d1, %tick
	.word 0xb0944000  ! 552: ORcc_R	orcc 	%r17, %r0, %r24
	.word 0xf00d8000  ! 555: LDUB_R	ldub	[%r22 + %r0], %r24
	.word 0xb950c000  ! 556: RDPR_TT	<illegal instruction>
	.word 0xb7520000  ! 559: RDPR_PIL	<illegal instruction>
	.word 0xfe548000  ! 561: LDSH_R	ldsh	[%r18 + %r0], %r31
	.word 0xb8058000  ! 562: ADD_R	add 	%r22, %r0, %r28
	.word 0xb551c000  ! 564: RDPR_TL	<illegal instruction>
	.word 0xfe45c000  ! 566: LDSW_R	ldsw	[%r23 + %r0], %r31
	.word 0x8194e01e  ! 572: WRPR_TPC_I	wrpr	%r19, 0x001e, %tpc
	.word 0xf01ce0a9  ! 574: LDD_I	ldd	[%r19 + 0x00a9], %r24
	.word 0xf00ce1b3  ! 578: LDUB_I	ldub	[%r19 + 0x01b3], %r24
	.word 0x8194604e  ! 580: WRPR_TPC_I	wrpr	%r17, 0x004e, %tpc
	.word 0xfc1d4000  ! 582: LDD_R	ldd	[%r21 + %r0], %r30
	.word 0xfc1c4000  ! 584: LDD_R	ldd	[%r17 + %r0], %r30
	.word 0xfb1d212d  ! 590: LDDF_I	ldd	[%r20, 0x012d], %f29
	.word 0x9194e027  ! 592: WRPR_PIL_I	wrpr	%r19, 0x0027, %pil
	setx	0x10126, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa0da081  ! 600: LDUB_I	ldub	[%r22 + 0x0081], %r29
	setx	0x12e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_7, %g1, %r20
	.word 0xbb508000  ! 607: RDPR_TSTATE	<illegal instruction>
	setx	0x30128, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7540000  ! 611: RDPR_GL	<illegal instruction>
	.word 0xfa1d0000  ! 612: LDD_R	ldd	[%r20 + %r0], %r29
	.word 0xfe0c4000  ! 613: LDUB_R	ldub	[%r17 + %r0], %r31
	.word 0xfc542093  ! 615: LDSH_I	ldsh	[%r16 + 0x0093], %r30
	setx	0x3031b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf05c4000  ! 617: LDX_R	ldx	[%r17 + %r0], %r24
	.word 0xbb510000  ! 618: RDPR_TICK	<illegal instruction>
	setx	data_start_7, %g1, %r23
	.word 0xb8054000  ! 623: ADD_R	add 	%r21, %r0, %r28
	.word 0xfe14e101  ! 627: LDUH_I	lduh	[%r19 + 0x0101], %r31
	.word 0xfe05e1c9  ! 628: LDUW_I	lduw	[%r23 + 0x01c9], %r31
	.word 0x8395a0ea  ! 633: WRPR_TNPC_I	wrpr	%r22, 0x00ea, %tnpc
	.word 0xfc140000  ! 634: LDUH_R	lduh	[%r16 + %r0], %r30
	.word 0xfc45a1a9  ! 636: LDSW_I	ldsw	[%r22 + 0x01a9], %r30
	.word 0xb9508000  ! 646: RDPR_TSTATE	<illegal instruction>
	.word 0xf0552178  ! 647: LDSH_I	ldsh	[%r20 + 0x0178], %r24
	.word 0xf11ca0d0  ! 650: LDDF_I	ldd	[%r18, 0x00d0], %f24
	.word 0xb1520000  ! 651: RDPR_PIL	<illegal instruction>
	.word 0xf80d4000  ! 652: LDUB_R	ldub	[%r21 + %r0], %r28
	.word 0xfa052100  ! 653: LDUW_I	lduw	[%r20 + 0x0100], %r29
	.word 0xfa546059  ! 656: LDSH_I	ldsh	[%r17 + 0x0059], %r29
	setx	0x20216, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5508000  ! 661: RDPR_TSTATE	<illegal instruction>
	.word 0xf51ce1df  ! 662: LDDF_I	ldd	[%r19, 0x01df], %f26
	.word 0xbb2c8000  ! 663: SLL_R	sll 	%r18, %r0, %r29
	.word 0xf04ce033  ! 664: LDSB_I	ldsb	[%r19 + 0x0033], %r24
	.word 0xf41d2160  ! 665: LDD_I	ldd	[%r20 + 0x0160], %r26
	.word 0xf8554000  ! 667: LDSH_R	ldsh	[%r21 + %r0], %r28
	.word 0xf45d201a  ! 668: LDX_I	ldx	[%r20 + 0x001a], %r26
	setx	0x2031b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81983ec9  ! 670: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ec9, %hpstate
	.word 0xf00d4000  ! 672: LDUB_R	ldub	[%r21 + %r0], %r24
	setx	data_start_0, %g1, %r21
	.word 0xfa1dc000  ! 681: LDD_R	ldd	[%r23 + %r0], %r29
	setx	0x10323, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf0558000  ! 687: LDSH_R	ldsh	[%r22 + %r0], %r24
	.word 0xf64d8000  ! 688: LDSB_R	ldsb	[%r22 + %r0], %r27
	.word 0xff1dc000  ! 689: LDDF_R	ldd	[%r23, %r0], %f31
	.word 0xbd480000  ! 691: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0x819521d2  ! 692: WRPR_TPC_I	wrpr	%r20, 0x01d2, %tpc
	.word 0xb5510000  ! 700: RDPR_TICK	<illegal instruction>
	.word 0xb12dd000  ! 701: SLLX_R	sllx	%r23, %r0, %r24
	.word 0xb5480000  ! 707: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xf41ca0a4  ! 708: LDD_I	ldd	[%r18 + 0x00a4], %r26
	.word 0xf40d61bd  ! 710: LDUB_I	ldub	[%r21 + 0x01bd], %r26
	.word 0xbd504000  ! 711: RDPR_TNPC	<illegal instruction>
	mov	2, %r14
	.word 0xa193a000  ! 715: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbb518000  ! 716: RDPR_PSTATE	<illegal instruction>
	.word 0xb815e115  ! 717: OR_I	or 	%r23, 0x0115, %r28
	.word 0xb8a54000  ! 720: SUBcc_R	subcc 	%r21, %r0, %r28
	.word 0xf21560db  ! 726: LDUH_I	lduh	[%r21 + 0x00db], %r25
	.word 0xb7518000  ! 728: RDPR_PSTATE	<illegal instruction>
	setx	data_start_1, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf04d2174  ! 733: LDSB_I	ldsb	[%r20 + 0x0174], %r24
	ta	T_CHANGE_HPRIV
	.word 0x81982c41  ! 734: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c41, %hpstate
	.word 0xf205e195  ! 735: LDUW_I	lduw	[%r23 + 0x0195], %r25
	.word 0x8195e0c5  ! 738: WRPR_TPC_I	wrpr	%r23, 0x00c5, %tpc
	.word 0xf45ce1e8  ! 739: LDX_I	ldx	[%r19 + 0x01e8], %r26
	.word 0xf4550000  ! 740: LDSH_R	ldsh	[%r20 + %r0], %r26
	.word 0xf80de0d9  ! 742: LDUB_I	ldub	[%r23 + 0x00d9], %r28
	.word 0x91942105  ! 745: WRPR_PIL_I	wrpr	%r16, 0x0105, %pil
	.word 0xb17c2401  ! 746: MOVR_I	movre	%r16, 0x1, %r24
	.word 0xf85d4000  ! 747: LDX_R	ldx	[%r21 + %r0], %r28
	.word 0xbd3c7001  ! 750: SRAX_I	srax	%r17, 0x0001, %r30
	.word 0xf31da19d  ! 753: LDDF_I	ldd	[%r22, 0x019d], %f25
	.word 0xbe14a029  ! 757: OR_I	or 	%r18, 0x0029, %r31
	.word 0xf214a1a7  ! 760: LDUH_I	lduh	[%r18 + 0x01a7], %r25
	.word 0xb025e1c0  ! 761: SUB_I	sub 	%r23, 0x01c0, %r24
	.word 0xf0458000  ! 765: LDSW_R	ldsw	[%r22 + %r0], %r24
	.word 0xba14613a  ! 766: OR_I	or 	%r17, 0x013a, %r29
	setx	data_start_6, %g1, %r16
	setx	0x2020d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf6140000  ! 773: LDUH_R	lduh	[%r16 + %r0], %r27
	setx	data_start_6, %g1, %r18
	setx	data_start_1, %g1, %r17
	.word 0xfc5da1a8  ! 777: LDX_I	ldx	[%r22 + 0x01a8], %r30
	.word 0xbb504000  ! 780: RDPR_TNPC	<illegal instruction>
	setx	0x22e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf11ca178  ! 783: LDDF_I	ldd	[%r18, 0x0178], %f24
	.word 0xbf504000  ! 784: RDPR_TNPC	<illegal instruction>
	.word 0xb2954000  ! 785: ORcc_R	orcc 	%r21, %r0, %r25
	.word 0x8d9520d0  ! 787: WRPR_PSTATE_I	wrpr	%r20, 0x00d0, %pstate
	.word 0xf91ca1eb  ! 789: LDDF_I	ldd	[%r18, 0x01eb], %f28
	.word 0x9195205a  ! 792: WRPR_PIL_I	wrpr	%r20, 0x005a, %pil
	.word 0xbd3cb001  ! 798: SRAX_I	srax	%r18, 0x0001, %r30
	setx	0x30010, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5520000  ! 810: RDPR_PIL	rdpr	%pil, %r26
	.word 0x8d94a1ea  ! 811: WRPR_PSTATE_I	wrpr	%r18, 0x01ea, %pstate
	.word 0x8395e0c0  ! 812: WRPR_TNPC_I	wrpr	%r23, 0x00c0, %tnpc
	.word 0xbf504000  ! 816: RDPR_TNPC	<illegal instruction>
	.word 0xff1d0000  ! 817: LDDF_R	ldd	[%r20, %r0], %f31
	.word 0xfe452180  ! 820: LDSW_I	ldsw	[%r20 + 0x0180], %r31
	ta	T_CHANGE_HPRIV
	.word 0x81982a0b  ! 821: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a0b, %hpstate
	.word 0x8595e042  ! 822: WRPR_TSTATE_I	wrpr	%r23, 0x0042, %tstate
	setx	0x10107, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7500000  ! 825: RDPR_TPC	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81983883  ! 827: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1883, %hpstate
	.word 0xf21c61c0  ! 828: LDD_I	ldd	[%r17 + 0x01c0], %r25
	.word 0xb351c000  ! 829: RDPR_TL	<illegal instruction>
	.word 0xf0058000  ! 830: LDUW_R	lduw	[%r22 + %r0], %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf31da192  ! 837: LDDF_I	ldd	[%r22, 0x0192], %f25
	.word 0xfa446127  ! 839: LDSW_I	ldsw	[%r17 + 0x0127], %r29
	.word 0xf8448000  ! 842: LDSW_R	ldsw	[%r18 + %r0], %r28
	mov	0, %r12
	.word 0x8f932000  ! 845: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf40460f3  ! 847: LDUW_I	lduw	[%r17 + 0x00f3], %r26
	.word 0xb9641800  ! 848: MOVcc_R	<illegal instruction>
	.word 0xf00dc000  ! 849: LDUB_R	ldub	[%r23 + %r0], %r24
	.word 0xb82de066  ! 851: ANDN_I	andn 	%r23, 0x0066, %r28
	.word 0xf05520a0  ! 852: LDSH_I	ldsh	[%r20 + 0x00a0], %r24
	.word 0xfa15218d  ! 853: LDUH_I	lduh	[%r20 + 0x018d], %r29
	.word 0xb9520000  ! 855: RDPR_PIL	<illegal instruction>
	.word 0xf85561da  ! 857: LDSH_I	ldsh	[%r21 + 0x01da], %r28
	.word 0x9195e146  ! 858: WRPR_PIL_I	wrpr	%r23, 0x0146, %pil
	.word 0x899420f4  ! 861: WRPR_TICK_I	wrpr	%r16, 0x00f4, %tick
	.word 0xf04c4000  ! 862: LDSB_R	ldsb	[%r17 + %r0], %r24
	.word 0xf6152140  ! 865: LDUH_I	lduh	[%r20 + 0x0140], %r27
	.word 0xbf518000  ! 866: RDPR_PSTATE	<illegal instruction>
	.word 0x9194a04c  ! 867: WRPR_PIL_I	wrpr	%r18, 0x004c, %pil
	.word 0xfe1cc000  ! 870: LDD_R	ldd	[%r19 + %r0], %r31
	.word 0x8794a175  ! 871: WRPR_TT_I	wrpr	%r18, 0x0175, %tt
	.word 0xf41d8000  ! 872: LDD_R	ldd	[%r22 + %r0], %r26
	mov	1, %r14
	.word 0xa193a000  ! 873: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xfe158000  ! 877: LDUH_R	lduh	[%r22 + %r0], %r31
	.word 0xfa1ca07e  ! 878: LDD_I	ldd	[%r18 + 0x007e], %r29
	.word 0xf45d2038  ! 880: LDX_I	ldx	[%r20 + 0x0038], %r26
	.word 0xb9480000  ! 883: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xb550c000  ! 884: RDPR_TT	<illegal instruction>
	.word 0xb2240000  ! 885: SUB_R	sub 	%r16, %r0, %r25
	.word 0xbab44000  ! 890: ORNcc_R	orncc 	%r17, %r0, %r29
	.word 0xfd1de16d  ! 896: LDDF_I	ldd	[%r23, 0x016d], %f30
	.word 0xf20c6123  ! 898: LDUB_I	ldub	[%r17 + 0x0123], %r25
	.word 0xbb510000  ! 900: RDPR_TICK	<illegal instruction>
	.word 0xf45c8000  ! 905: LDX_R	ldx	[%r18 + %r0], %r26
	.word 0xfe5c20bc  ! 913: LDX_I	ldx	[%r16 + 0x00bc], %r31
	.word 0xfb1dc000  ! 917: LDDF_R	ldd	[%r23, %r0], %f29
	.word 0xfa5c0000  ! 919: LDX_R	ldx	[%r16 + %r0], %r29
	.word 0xfe0d0000  ! 921: LDUB_R	ldub	[%r20 + %r0], %r31
	.word 0xb73cf001  ! 924: SRAX_I	srax	%r19, 0x0001, %r27
	.word 0xff1ce1cd  ! 927: LDDF_I	ldd	[%r19, 0x01cd], %f31
	.word 0x85946093  ! 929: WRPR_TSTATE_I	wrpr	%r17, 0x0093, %tstate
	setx	0x21b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xba258000  ! 933: SUB_R	sub 	%r22, %r0, %r29
	ta	T_CHANGE_HPRIV
	.word 0x81983c49  ! 935: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c49, %hpstate
	.word 0xfe0c0000  ! 936: LDUB_R	ldub	[%r16 + %r0], %r31
	.word 0xf0458000  ! 937: LDSW_R	ldsw	[%r22 + %r0], %r24
	.word 0xbb50c000  ! 938: RDPR_TT	<illegal instruction>
	.word 0xb62d6030  ! 939: ANDN_I	andn 	%r21, 0x0030, %r27
	setx	0x20202, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x22a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8394e1d4  ! 947: WRPR_TNPC_I	wrpr	%r19, 0x01d4, %tnpc
	.word 0xf60c6162  ! 948: LDUB_I	ldub	[%r17 + 0x0162], %r27
	setx	0x10003, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_1, %g1, %r20
	setx	0x1012e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf414e11c  ! 958: LDUH_I	lduh	[%r19 + 0x011c], %r26
	.word 0xb5540000  ! 961: RDPR_GL	<illegal instruction>
	.word 0xfc4461ac  ! 962: LDSW_I	ldsw	[%r17 + 0x01ac], %r30
	.word 0x859520b8  ! 963: WRPR_TSTATE_I	wrpr	%r20, 0x00b8, %tstate
	.word 0xfb1c8000  ! 964: LDDF_R	ldd	[%r18, %r0], %f29
	.word 0xf6454000  ! 966: LDSW_R	ldsw	[%r21 + %r0], %r27
	ta	T_CHANGE_HPRIV
	.word 0x81983d13  ! 968: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d13, %hpstate
	.word 0xfc5d8000  ! 970: LDX_R	ldx	[%r22 + %r0], %r30
	.word 0xf21c8000  ! 974: LDD_R	ldd	[%r18 + %r0], %r25
	.word 0xf11dc000  ! 976: LDDF_R	ldd	[%r23, %r0], %f24
	.word 0x839561f8  ! 977: WRPR_TNPC_I	wrpr	%r21, 0x01f8, %tnpc
	setx	0x10237, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa05c000  ! 981: LDUW_R	lduw	[%r23 + %r0], %r29
	.word 0xfa0ce008  ! 982: LDUB_I	ldub	[%r19 + 0x0008], %r29
	.word 0xb49cc000  ! 985: XORcc_R	xorcc 	%r19, %r0, %r26
	.word 0xb635c000  ! 986: SUBC_R	orn 	%r23, %r0, %r27
	ta	T_CHANGE_HPRIV
	.word 0x81983851  ! 989: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1851, %hpstate
	.word 0xf41c8000  ! 990: LDD_R	ldd	[%r18 + %r0], %r26
	.word 0x87946007  ! 994: WRPR_TT_I	wrpr	%r17, 0x0007, %tt
	.word 0xbc1420bd  ! 995: OR_I	or 	%r16, 0x00bd, %r30
	setx	0x20318, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8395e0a3  ! 1002: WRPR_TNPC_I	wrpr	%r23, 0x00a3, %tnpc
	.word 0xfa044000  ! 1003: LDUW_R	lduw	[%r17 + %r0], %r29
	setx	data_start_6, %g1, %r20
	.word 0xfa148000  ! 1010: LDUH_R	lduh	[%r18 + %r0], %r29
	.word 0xb425a163  ! 1011: SUB_I	sub 	%r22, 0x0163, %r26
	.word 0xf6456085  ! 1012: LDSW_I	ldsw	[%r21 + 0x0085], %r27
	.word 0xf4548000  ! 1013: LDSH_R	ldsh	[%r18 + %r0], %r26
	.word 0xfc1d6126  ! 1014: LDD_I	ldd	[%r21 + 0x0126], %r30
	.word 0xf01c8000  ! 1015: LDD_R	ldd	[%r18 + %r0], %r24
	setx	0x30020, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa5de169  ! 1020: LDX_I	ldx	[%r23 + 0x0169], %r29
	.word 0xf61d4000  ! 1021: LDD_R	ldd	[%r21 + %r0], %r27
	.word 0x8d94e007  ! 1023: WRPR_PSTATE_I	wrpr	%r19, 0x0007, %pstate
	.word 0xb5500000  ! 1024: RDPR_TPC	<illegal instruction>
	setx	0x30233, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x4, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf04de134  ! 1030: LDSB_I	ldsb	[%r23 + 0x0134], %r24
	.word 0xfc5d0000  ! 1031: LDX_R	ldx	[%r20 + %r0], %r30
	.word 0x8594a176  ! 1034: WRPR_TSTATE_I	wrpr	%r18, 0x0176, %tstate
	.word 0xb9520000  ! 1035: RDPR_PIL	<illegal instruction>
	.word 0xfc05c000  ! 1039: LDUW_R	lduw	[%r23 + %r0], %r30
	.word 0xf445c000  ! 1041: LDSW_R	ldsw	[%r23 + %r0], %r26
	.word 0xbaa54000  ! 1044: SUBcc_R	subcc 	%r21, %r0, %r29
	.word 0xf244e0d5  ! 1045: LDSW_I	ldsw	[%r19 + 0x00d5], %r25
	.word 0xfa5d21e8  ! 1046: LDX_I	ldx	[%r20 + 0x01e8], %r29
	.word 0xbe944000  ! 1047: ORcc_R	orcc 	%r17, %r0, %r31
	setx	0x110, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10328, %g1, %o0
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
	.word 0xf85d0000  ! 1056: LDX_R	ldx	[%r20 + %r0], %r28
	.word 0xf21461b1  ! 1058: LDUH_I	lduh	[%r17 + 0x01b1], %r25
	.word 0xbc44a1a9  ! 1059: ADDC_I	addc 	%r18, 0x01a9, %r30
	.word 0xf805e1b6  ! 1065: LDUW_I	lduw	[%r23 + 0x01b6], %r28
	.word 0x8595a008  ! 1066: WRPR_TSTATE_I	wrpr	%r22, 0x0008, %tstate
	.word 0xfa0c4000  ! 1068: LDUB_R	ldub	[%r17 + %r0], %r29
	.word 0xf85c605c  ! 1069: LDX_I	ldx	[%r17 + 0x005c], %r28
	.word 0xfe5c613b  ! 1074: LDX_I	ldx	[%r17 + 0x013b], %r31
	mov	1, %r12
	.word 0x8f932000  ! 1076: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xfa1da157  ! 1077: LDD_I	ldd	[%r22 + 0x0157], %r29
	setx	0x30210, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf85d21f1  ! 1081: LDX_I	ldx	[%r20 + 0x01f1], %r28
	.word 0xf40cc000  ! 1082: LDUB_R	ldub	[%r19 + %r0], %r26
	.word 0xb7641800  ! 1084: MOVcc_R	<illegal instruction>
	.word 0x91942003  ! 1086: WRPR_PIL_I	wrpr	%r16, 0x0003, %pil
	.word 0xf41d6156  ! 1090: LDD_I	ldd	[%r21 + 0x0156], %r26
	.word 0x8595e0a7  ! 1093: WRPR_TSTATE_I	wrpr	%r23, 0x00a7, %tstate
	mov	2, %r12
	.word 0x8f932000  ! 1098: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	data_start_1, %g1, %r20
	.word 0x8794a051  ! 1100: WRPR_TT_I	wrpr	%r18, 0x0051, %tt
	ta	T_CHANGE_HPRIV
	.word 0x81983f89  ! 1102: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f89, %hpstate
	.word 0xf04d4000  ! 1107: LDSB_R	ldsb	[%r21 + %r0], %r24
	.word 0xfa1d8000  ! 1110: LDD_R	ldd	[%r22 + %r0], %r29
	setx	0x20211, %g1, %o0
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
	.word 0xf0442015  ! 1117: LDSW_I	ldsw	[%r16 + 0x0015], %r24
	.word 0xf00c4000  ! 1122: LDUB_R	ldub	[%r17 + %r0], %r24
	mov	1, %r12
	.word 0x8f932000  ! 1124: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf45d0000  ! 1125: LDX_R	ldx	[%r20 + %r0], %r26
	.word 0xf6058000  ! 1127: LDUW_R	lduw	[%r22 + %r0], %r27
	.word 0xf25d60c1  ! 1128: LDX_I	ldx	[%r21 + 0x00c1], %r25
	setx	0x10327, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	2, %r12
	.word 0x8f932000  ! 1131: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbf508000  ! 1132: RDPR_TSTATE	<illegal instruction>
	.word 0xb5641800  ! 1135: MOVcc_R	<illegal instruction>
	.word 0xbf518000  ! 1136: RDPR_PSTATE	<illegal instruction>
	.word 0xf4458000  ! 1137: LDSW_R	ldsw	[%r22 + %r0], %r26
	.word 0xf61c0000  ! 1141: LDD_R	ldd	[%r16 + %r0], %r27
	.word 0xb150c000  ! 1144: RDPR_TT	<illegal instruction>
	setx	data_start_6, %g1, %r17
	setx	data_start_5, %g1, %r17
	.word 0xfc1c6115  ! 1152: LDD_I	ldd	[%r17 + 0x0115], %r30
	.word 0xf81c6131  ! 1153: LDD_I	ldd	[%r17 + 0x0131], %r28
	.word 0xf11de03b  ! 1157: LDDF_I	ldd	[%r23, 0x003b], %f24
	.word 0xf80c20c5  ! 1158: LDUB_I	ldub	[%r16 + 0x00c5], %r28
	.word 0xb13c4000  ! 1159: SRA_R	sra 	%r17, %r0, %r24
	.word 0xf6054000  ! 1166: LDUW_R	lduw	[%r21 + %r0], %r27
	.word 0xf24d8000  ! 1168: LDSB_R	ldsb	[%r22 + %r0], %r25
	.word 0xfc4d21c3  ! 1172: LDSB_I	ldsb	[%r20 + 0x01c3], %r30
	mov	2, %r12
	.word 0x8f932000  ! 1173: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xba9c21e5  ! 1174: XORcc_I	xorcc 	%r16, 0x01e5, %r29
	setx	data_start_1, %g1, %r18
	.word 0xf2548000  ! 1180: LDSH_R	ldsh	[%r18 + %r0], %r25
	.word 0xf24d4000  ! 1181: LDSB_R	ldsb	[%r21 + %r0], %r25
	.word 0xf41d61da  ! 1182: LDD_I	ldd	[%r21 + 0x01da], %r26
	.word 0xfc0cc000  ! 1183: LDUB_R	ldub	[%r19 + %r0], %r30
	.word 0xb1520000  ! 1185: RDPR_PIL	<illegal instruction>
	setx	0x3033f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x879560c2  ! 1188: WRPR_TT_I	wrpr	%r21, 0x00c2, %tt
	setx	0x3010d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb480000  ! 1192: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0x91942035  ! 1194: WRPR_PIL_I	wrpr	%r16, 0x0035, %pil
	.word 0xfc158000  ! 1195: LDUH_R	lduh	[%r22 + %r0], %r30
	setx	0x2022c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc144000  ! 1200: LDUH_R	lduh	[%r17 + %r0], %r30
	.word 0xbb480000  ! 1205: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xfe4c61fd  ! 1206: LDSB_I	ldsb	[%r17 + 0x01fd], %r31
	setx	0x10208, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9504000  ! 1210: RDPR_TNPC	rdpr	%tnpc, %r28
	.word 0xb1510000  ! 1212: RDPR_TICK	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81982cd9  ! 1213: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cd9, %hpstate
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0x8194605d  ! 1215: WRPR_TPC_I	wrpr	%r17, 0x005d, %tpc
	.word 0xfc148000  ! 1217: LDUH_R	lduh	[%r18 + %r0], %r30
	mov	1, %r12
	.word 0x8f932000  ! 1220: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf81d209b  ! 1226: LDD_I	ldd	[%r20 + 0x009b], %r28
	.word 0xbd504000  ! 1227: RDPR_TNPC	<illegal instruction>
	.word 0xb3504000  ! 1228: RDPR_TNPC	<illegal instruction>
	.word 0xf214c000  ! 1229: LDUH_R	lduh	[%r19 + %r0], %r25
	.word 0xf644e0ed  ! 1232: LDSW_I	ldsw	[%r19 + 0x00ed], %r27
	.word 0xf205611b  ! 1234: LDUW_I	lduw	[%r21 + 0x011b], %r25
	.word 0xbf508000  ! 1240: RDPR_TSTATE	<illegal instruction>
	.word 0xbebd0000  ! 1242: XNORcc_R	xnorcc 	%r20, %r0, %r31
	.word 0xfa55a094  ! 1243: LDSH_I	ldsh	[%r22 + 0x0094], %r29
	.word 0xb3480000  ! 1245: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xb151c000  ! 1246: RDPR_TL	<illegal instruction>
	.word 0xfc0ca13a  ! 1247: LDUB_I	ldub	[%r18 + 0x013a], %r30
	.word 0xb62d60d1  ! 1256: ANDN_I	andn 	%r21, 0x00d1, %r27
	.word 0xf444e130  ! 1260: LDSW_I	ldsw	[%r19 + 0x0130], %r26
	.word 0x8195204c  ! 1261: WRPR_TPC_I	wrpr	%r20, 0x004c, %tpc
	.word 0xfc1d6157  ! 1263: LDD_I	ldd	[%r21 + 0x0157], %r30
	.word 0xf6550000  ! 1265: LDSH_R	ldsh	[%r20 + %r0], %r27
	.word 0xfe15e181  ! 1266: LDUH_I	lduh	[%r23 + 0x0181], %r31
	.word 0xf41d0000  ! 1275: LDD_R	ldd	[%r20 + %r0], %r26
	.word 0xfe45e05e  ! 1277: LDSW_I	ldsw	[%r23 + 0x005e], %r31
	.word 0xf2550000  ! 1278: LDSH_R	ldsh	[%r20 + %r0], %r25
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	ta	T_CHANGE_HPRIV
	.word 0x81983e99  ! 1281: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e99, %hpstate
	.word 0x8395202c  ! 1283: WRPR_TNPC_I	wrpr	%r20, 0x002c, %tnpc
	.word 0xf81d61fa  ! 1291: LDD_I	ldd	[%r21 + 0x01fa], %r28
	.word 0xf255e18c  ! 1293: LDSH_I	ldsh	[%r23 + 0x018c], %r25
	.word 0xfe14205b  ! 1294: LDUH_I	lduh	[%r16 + 0x005b], %r31
	.word 0x8d94609f  ! 1296: WRPR_PSTATE_I	wrpr	%r17, 0x009f, %pstate
	.word 0xf845215f  ! 1299: LDSW_I	ldsw	[%r20 + 0x015f], %r28
	.word 0xf41520e2  ! 1304: LDUH_I	lduh	[%r20 + 0x00e2], %r26
	setx	data_start_2, %g1, %r16
	.word 0xbb50c000  ! 1307: RDPR_TT	<illegal instruction>
	.word 0x8794606f  ! 1315: WRPR_TT_I	wrpr	%r17, 0x006f, %tt
	.word 0xf20520cb  ! 1316: LDUW_I	lduw	[%r20 + 0x00cb], %r25
	.word 0x859421b5  ! 1317: WRPR_TSTATE_I	wrpr	%r16, 0x01b5, %tstate
	.word 0xfa0c6112  ! 1320: LDUB_I	ldub	[%r17 + 0x0112], %r29
	.word 0xf8448000  ! 1321: LDSW_R	ldsw	[%r18 + %r0], %r28
	.word 0xfc4dc000  ! 1330: LDSB_R	ldsb	[%r23 + %r0], %r30
	.word 0xb00d8000  ! 1331: AND_R	and 	%r22, %r0, %r24
	.word 0xf00de0cc  ! 1333: LDUB_I	ldub	[%r23 + 0x00cc], %r24
	.word 0xb1510000  ! 1338: RDPR_TICK	<illegal instruction>
	setx	0x30131, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfd1dc000  ! 1340: LDDF_R	ldd	[%r23, %r0], %f30
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf604e0cf  ! 1344: LDUW_I	lduw	[%r19 + 0x00cf], %r27
	.word 0xf81461a5  ! 1346: LDUH_I	lduh	[%r17 + 0x01a5], %r28
	.word 0xf24421a5  ! 1347: LDSW_I	ldsw	[%r16 + 0x01a5], %r25
	setx	data_start_0, %g1, %r19
	setx	0x321, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb614c000  ! 1354: OR_R	or 	%r19, %r0, %r27
	setx	0x10225, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8195609e  ! 1356: WRPR_TPC_I	wrpr	%r21, 0x009e, %tpc
	.word 0xfa15c000  ! 1358: LDUH_R	lduh	[%r23 + %r0], %r29
	setx	0x20, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81982b89  ! 1361: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b89, %hpstate
	.word 0xb7520000  ! 1364: RDPR_PIL	<illegal instruction>
	.word 0x8994e125  ! 1365: WRPR_TICK_I	wrpr	%r19, 0x0125, %tick
	.word 0x8394a064  ! 1367: WRPR_TNPC_I	wrpr	%r18, 0x0064, %tnpc
	.word 0xfa458000  ! 1368: LDSW_R	ldsw	[%r22 + %r0], %r29
	.word 0xf21ca100  ! 1370: LDD_I	ldd	[%r18 + 0x0100], %r25
	.word 0xbd540000  ! 1373: RDPR_GL	<illegal instruction>
	setx	0x30212, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf8150000  ! 1376: LDUH_R	lduh	[%r20 + %r0], %r28
	.word 0xf014212d  ! 1380: LDUH_I	lduh	[%r16 + 0x012d], %r24
	mov	2, %r14
	.word 0xa193a000  ! 1383: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0x859520cf  ! 1386: WRPR_TSTATE_I	wrpr	%r20, 0x00cf, %tstate
	.word 0xf00ce1b2  ! 1388: LDUB_I	ldub	[%r19 + 0x01b2], %r24
	.word 0xf20c21a5  ! 1392: LDUB_I	ldub	[%r16 + 0x01a5], %r25
	mov	1, %r14
	.word 0xa193a000  ! 1394: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf41dc000  ! 1395: LDD_R	ldd	[%r23 + %r0], %r26
	setx	0x212, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81983b89  ! 1398: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b89, %hpstate
	setx	0x30327, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d95a0c9  ! 1400: WRPR_PSTATE_I	wrpr	%r22, 0x00c9, %pstate
	.word 0xf6154000  ! 1402: LDUH_R	lduh	[%r21 + %r0], %r27
	.word 0xf64461f6  ! 1407: LDSW_I	ldsw	[%r17 + 0x01f6], %r27
	.word 0xf245a105  ! 1408: LDSW_I	ldsw	[%r22 + 0x0105], %r25
	.word 0xb44461b4  ! 1409: ADDC_I	addc 	%r17, 0x01b4, %r26
	.word 0xfa1cc000  ! 1411: LDD_R	ldd	[%r19 + %r0], %r29
	.word 0xf41c8000  ! 1412: LDD_R	ldd	[%r18 + %r0], %r26
	.word 0xfe448000  ! 1414: LDSW_R	ldsw	[%r18 + %r0], %r31
	.word 0xfc548000  ! 1423: LDSH_R	ldsh	[%r18 + %r0], %r30
	.word 0xbd643801  ! 1425: MOVcc_I	<illegal instruction>
	mov	0, %r14
	.word 0xa193a000  ! 1427: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb7347001  ! 1430: SRLX_I	srlx	%r17, 0x0001, %r27
	.word 0xf2058000  ! 1431: LDUW_R	lduw	[%r22 + %r0], %r25
	.word 0xf8548000  ! 1442: LDSH_R	ldsh	[%r18 + %r0], %r28
	.word 0xf41d8000  ! 1444: LDD_R	ldd	[%r22 + %r0], %r26
	.word 0xb7504000  ! 1447: RDPR_TNPC	<illegal instruction>
	setx	0x20029, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf359000  ! 1454: SRLX_R	srlx	%r22, %r0, %r31
	setx	0x103, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	2, %r12
	.word 0x8f932000  ! 1459: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf84de121  ! 1462: LDSB_I	ldsb	[%r23 + 0x0121], %r28
	setx	data_start_1, %g1, %r21
	.word 0xf814c000  ! 1470: LDUH_R	lduh	[%r19 + %r0], %r28
	setx	data_start_2, %g1, %r17
	.word 0xbb510000  ! 1476: RDPR_TICK	<illegal instruction>
	.word 0x8594201d  ! 1478: WRPR_TSTATE_I	wrpr	%r16, 0x001d, %tstate
	.word 0xbb510000  ! 1479: RDPR_TICK	<illegal instruction>
	.word 0xfc4ca0bd  ! 1484: LDSB_I	ldsb	[%r18 + 0x00bd], %r30
	.word 0xf41dc000  ! 1485: LDD_R	ldd	[%r23 + %r0], %r26
	.word 0xf6140000  ! 1487: LDUH_R	lduh	[%r16 + %r0], %r27
	.word 0xb60c0000  ! 1488: AND_R	and 	%r16, %r0, %r27
	.word 0xf8556147  ! 1491: LDSH_I	ldsh	[%r21 + 0x0147], %r28
	.word 0xfe4520b5  ! 1492: LDSW_I	ldsw	[%r20 + 0x00b5], %r31
	ta	T_CHANGE_HPRIV
	.word 0x81982e53  ! 1494: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e53, %hpstate
	setx	data_start_1, %g1, %r18
	.word 0xb7510000  ! 1496: RDPR_TICK	<illegal instruction>
	.word 0xbb510000  ! 1497: RDPR_TICK	<illegal instruction>
	.word 0xff1de03f  ! 1501: LDDF_I	ldd	[%r23, 0x003f], %f31
	.word 0xfc15e19d  ! 1503: LDUH_I	lduh	[%r23 + 0x019d], %r30
	.word 0xbb520000  ! 1504: RDPR_PIL	<illegal instruction>
	.word 0xf21dc000  ! 1505: LDD_R	ldd	[%r23 + %r0], %r25
	.word 0xfe548000  ! 1508: LDSH_R	ldsh	[%r18 + %r0], %r31
	.word 0xf01d4000  ! 1511: LDD_R	ldd	[%r21 + %r0], %r24
	.word 0x8d94e184  ! 1512: WRPR_PSTATE_I	wrpr	%r19, 0x0184, %pstate
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf45ce02e  ! 1515: LDX_I	ldx	[%r19 + 0x002e], %r26
	setx	0x1012e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe4c6078  ! 1519: LDSB_I	ldsb	[%r17 + 0x0078], %r31
	.word 0xfe0cc000  ! 1524: LDUB_R	ldub	[%r19 + %r0], %r31
	.word 0xf60c4000  ! 1528: LDUB_R	ldub	[%r17 + %r0], %r27
	setx	0x10310, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf81d8000  ! 1530: LDD_R	ldd	[%r22 + %r0], %r28
	.word 0xfa4c8000  ! 1532: LDSB_R	ldsb	[%r18 + %r0], %r29
	.word 0xfe5c4000  ! 1536: LDX_R	ldx	[%r17 + %r0], %r31
	ta	T_CHANGE_HPRIV
	.word 0x81982983  ! 1538: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0983, %hpstate
	.word 0xfa45c000  ! 1542: LDSW_R	ldsw	[%r23 + %r0], %r29
	.word 0xb2a421d1  ! 1543: SUBcc_I	subcc 	%r16, 0x01d1, %r25
	.word 0xf0454000  ! 1544: LDSW_R	ldsw	[%r21 + %r0], %r24
	.word 0xbb518000  ! 1546: RDPR_PSTATE	<illegal instruction>
	.word 0xf44d2072  ! 1547: LDSB_I	ldsb	[%r20 + 0x0072], %r26
	.word 0x8794203b  ! 1548: WRPR_TT_I	wrpr	%r16, 0x003b, %tt
	.word 0x8d95e11a  ! 1554: WRPR_PSTATE_I	wrpr	%r23, 0x011a, %pstate
	.word 0xb0454000  ! 1556: ADDC_R	addc 	%r21, %r0, %r24
	.word 0xf8054000  ! 1557: LDUW_R	lduw	[%r21 + %r0], %r28
	ta	T_CHANGE_HPRIV
	.word 0x81983d49  ! 1558: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d49, %hpstate
	.word 0xfa15212c  ! 1563: LDUH_I	lduh	[%r20 + 0x012c], %r29
	.word 0xb52d6001  ! 1567: SLL_I	sll 	%r21, 0x0001, %r26
	.word 0xb97c6401  ! 1568: MOVR_I	movre	%r17, 0x1, %r28
	.word 0xf11d2046  ! 1571: LDDF_I	ldd	[%r20, 0x0046], %f24
	mov	0, %r14
	.word 0xa193a000  ! 1572: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb2ad8000  ! 1573: ANDNcc_R	andncc 	%r22, %r0, %r25
	.word 0xfc4d8000  ! 1575: LDSB_R	ldsb	[%r22 + %r0], %r30
	.word 0xb7520000  ! 1576: RDPR_PIL	<illegal instruction>
	.word 0xbf540000  ! 1582: RDPR_GL	<illegal instruction>
	.word 0xf25da03e  ! 1583: LDX_I	ldx	[%r22 + 0x003e], %r25
	.word 0xbd508000  ! 1587: RDPR_TSTATE	<illegal instruction>
	.word 0xf445a1fd  ! 1589: LDSW_I	ldsw	[%r22 + 0x01fd], %r26
	.word 0x9195607c  ! 1590: WRPR_PIL_I	wrpr	%r21, 0x007c, %pil
	.word 0xfb1d4000  ! 1596: LDDF_R	ldd	[%r21, %r0], %f29
	.word 0xf8144000  ! 1597: LDUH_R	lduh	[%r17 + %r0], %r28
	.word 0xfc5d8000  ! 1599: LDX_R	ldx	[%r22 + %r0], %r30
	.word 0x8194211a  ! 1601: WRPR_TPC_I	wrpr	%r16, 0x011a, %tpc
	.word 0xf64d0000  ! 1604: LDSB_R	ldsb	[%r20 + %r0], %r27
	.word 0x8794e025  ! 1605: WRPR_TT_I	wrpr	%r19, 0x0025, %tt
	.word 0xf64da157  ! 1606: LDSB_I	ldsb	[%r22 + 0x0157], %r27
	.word 0xbf3cf001  ! 1607: SRAX_I	srax	%r19, 0x0001, %r31
	.word 0x8d942082  ! 1608: WRPR_PSTATE_I	wrpr	%r16, 0x0082, %pstate
	setx	0x30110, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x819461a4  ! 1615: WRPR_TPC_I	wrpr	%r17, 0x01a4, %tpc
	.word 0x8195e119  ! 1616: WRPR_TPC_I	wrpr	%r23, 0x0119, %tpc
	.word 0xf0040000  ! 1617: LDUW_R	lduw	[%r16 + %r0], %r24
	.word 0xf80ca050  ! 1618: LDUB_I	ldub	[%r18 + 0x0050], %r28
	.word 0xfc0ce142  ! 1619: LDUB_I	ldub	[%r19 + 0x0142], %r30
	.word 0xf2548000  ! 1620: LDSH_R	ldsh	[%r18 + %r0], %r25
	.word 0xf614e042  ! 1621: LDUH_I	lduh	[%r19 + 0x0042], %r27
	.word 0xf6040000  ! 1631: LDUW_R	lduw	[%r16 + %r0], %r27
	.word 0x819421bf  ! 1632: WRPR_TPC_I	wrpr	%r16, 0x01bf, %tpc
	.word 0xbb518000  ! 1633: RDPR_PSTATE	<illegal instruction>
	.word 0xfc1da0c7  ! 1634: LDD_I	ldd	[%r22 + 0x00c7], %r30
	setx	0x2030e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe1d4000  ! 1639: LDD_R	ldd	[%r21 + %r0], %r31
	setx	0x20200, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf24dc000  ! 1647: LDSB_R	ldsb	[%r23 + %r0], %r25
	.word 0xf8444000  ! 1648: LDSW_R	ldsw	[%r17 + %r0], %r28
	.word 0xf0050000  ! 1649: LDUW_R	lduw	[%r20 + %r0], %r24
	.word 0xf654e081  ! 1650: LDSH_I	ldsh	[%r19 + 0x0081], %r27
	.word 0xba146195  ! 1652: OR_I	or 	%r17, 0x0195, %r29
	.word 0xf614c000  ! 1655: LDUH_R	lduh	[%r19 + %r0], %r27
	.word 0xf64d4000  ! 1662: LDSB_R	ldsb	[%r21 + %r0], %r27
	.word 0xf845c000  ! 1664: LDSW_R	ldsw	[%r23 + %r0], %r28
	setx	0x2021d, %g1, %o0
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
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	0x3003f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20114, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf71c610a  ! 1683: LDDF_I	ldd	[%r17, 0x010a], %f27
	.word 0x839520df  ! 1684: WRPR_TNPC_I	wrpr	%r20, 0x00df, %tnpc
	.word 0xfe4d4000  ! 1686: LDSB_R	ldsb	[%r21 + %r0], %r31
	.word 0xb9518000  ! 1688: RDPR_PSTATE	rdpr	%pstate, %r28
	mov	0, %r14
	.word 0xa193a000  ! 1690: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xff1d0000  ! 1691: LDDF_R	ldd	[%r20, %r0], %f31
	setx	0x2002b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc5d6152  ! 1695: LDX_I	ldx	[%r21 + 0x0152], %r30
	.word 0xf64d4000  ! 1697: LDSB_R	ldsb	[%r21 + %r0], %r27
	.word 0xfe44e01e  ! 1700: LDSW_I	ldsw	[%r19 + 0x001e], %r31
	.word 0xb8448000  ! 1704: ADDC_R	addc 	%r18, %r0, %r28
	.word 0xbd3de001  ! 1711: SRA_I	sra 	%r23, 0x0001, %r30
	.word 0xfc5d6148  ! 1714: LDX_I	ldx	[%r21 + 0x0148], %r30
	.word 0xfe4d0000  ! 1723: LDSB_R	ldsb	[%r20 + %r0], %r31
	.word 0xb1518000  ! 1724: RDPR_PSTATE	<illegal instruction>
	.word 0xf81420bf  ! 1725: LDUH_I	lduh	[%r16 + 0x00bf], %r28
	.word 0x9195e001  ! 1727: WRPR_PIL_I	wrpr	%r23, 0x0001, %pil
	.word 0xf11de106  ! 1729: LDDF_I	ldd	[%r23, 0x0106], %f24
	.word 0xfc0da065  ! 1733: LDUB_I	ldub	[%r22 + 0x0065], %r30
	.word 0xfe45e082  ! 1735: LDSW_I	ldsw	[%r23 + 0x0082], %r31
	.word 0xf80d6136  ! 1738: LDUB_I	ldub	[%r21 + 0x0136], %r28
	.word 0xb8c561e9  ! 1741: ADDCcc_I	addccc 	%r21, 0x01e9, %r28
	.word 0xf71cc000  ! 1743: LDDF_R	ldd	[%r19, %r0], %f27
	.word 0x83956115  ! 1748: WRPR_TNPC_I	wrpr	%r21, 0x0115, %tnpc
	.word 0xf244a189  ! 1753: LDSW_I	ldsw	[%r18 + 0x0189], %r25
	.word 0xbe35e118  ! 1758: SUBC_I	orn 	%r23, 0x0118, %r31
	.word 0xf11de059  ! 1761: LDDF_I	ldd	[%r23, 0x0059], %f24
	.word 0xb7480000  ! 1764: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	setx	0x308, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20022, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf00d4000  ! 1768: LDUB_R	ldub	[%r21 + %r0], %r24
	.word 0xff1d20e3  ! 1777: LDDF_I	ldd	[%r20, 0x00e3], %f31
	.word 0xb92cc000  ! 1778: SLL_R	sll 	%r19, %r0, %r28
	setx	0x2032f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81982d89  ! 1787: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d89, %hpstate
	.word 0xf254e0fd  ! 1793: LDSH_I	ldsh	[%r19 + 0x00fd], %r25
	.word 0xbb2c2001  ! 1794: SLL_I	sll 	%r16, 0x0001, %r29
	.word 0xb404c000  ! 1796: ADD_R	add 	%r19, %r0, %r26
	.word 0xf214c000  ! 1799: LDUH_R	lduh	[%r19 + %r0], %r25
	.word 0xbc852146  ! 1801: ADDcc_I	addcc 	%r20, 0x0146, %r30
	.word 0xf4546091  ! 1804: LDSH_I	ldsh	[%r17 + 0x0091], %r26
	.word 0xbd480000  ! 1806: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xf004e19a  ! 1808: LDUW_I	lduw	[%r19 + 0x019a], %r24
	.word 0xf215c000  ! 1811: LDUH_R	lduh	[%r23 + %r0], %r25
	.word 0xf84da0ed  ! 1812: LDSB_I	ldsb	[%r22 + 0x00ed], %r28
	.word 0xff1d4000  ! 1815: LDDF_R	ldd	[%r21, %r0], %f31
	.word 0xfd1cc000  ! 1816: LDDF_R	ldd	[%r19, %r0], %f30
	.word 0xb834c000  ! 1819: ORN_R	orn 	%r19, %r0, %r28
	setx	0x1010c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc5dc000  ! 1827: LDX_R	ldx	[%r23 + %r0], %r30
	.word 0xf61ca018  ! 1828: LDD_I	ldd	[%r18 + 0x0018], %r27
	.word 0xf254c000  ! 1829: LDSH_R	ldsh	[%r19 + %r0], %r25
	.word 0xf41d8000  ! 1830: LDD_R	ldd	[%r22 + %r0], %r26
	.word 0xfe14c000  ! 1837: LDUH_R	lduh	[%r19 + %r0], %r31
	.word 0xb8b5a009  ! 1841: SUBCcc_I	orncc 	%r22, 0x0009, %r28
	ta	T_CHANGE_HPRIV
	.word 0x81982d13  ! 1842: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d13, %hpstate
	setx	0x1002d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x839460b2  ! 1845: WRPR_TNPC_I	wrpr	%r17, 0x00b2, %tnpc
	setx	0x309, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81982f89  ! 1847: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f89, %hpstate
	setx	0x20130, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb504000  ! 1851: RDPR_TNPC	<illegal instruction>
	.word 0xf25460d8  ! 1852: LDSH_I	ldsh	[%r17 + 0x00d8], %r25
	.word 0xbf508000  ! 1859: RDPR_TSTATE	<illegal instruction>
	.word 0xb4044000  ! 1861: ADD_R	add 	%r17, %r0, %r26
	.word 0xf31c4000  ! 1862: LDDF_R	ldd	[%r17, %r0], %f25
	setx	0x30321, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf4440000  ! 1865: LDSW_R	ldsw	[%r16 + %r0], %r26
	.word 0xf11d2199  ! 1866: LDDF_I	ldd	[%r20, 0x0199], %f24
	.word 0xf6444000  ! 1869: LDSW_R	ldsw	[%r17 + %r0], %r27
	.word 0xbcb40000  ! 1870: SUBCcc_R	orncc 	%r16, %r0, %r30
	setx	data_start_1, %g1, %r18
	.word 0xf244a1cc  ! 1874: LDSW_I	ldsw	[%r18 + 0x01cc], %r25
	setx	0x10324, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8994612b  ! 1878: WRPR_TICK_I	wrpr	%r17, 0x012b, %tick
	.word 0x839460bf  ! 1879: WRPR_TNPC_I	wrpr	%r17, 0x00bf, %tnpc
	.word 0xfa04e0fc  ! 1881: LDUW_I	lduw	[%r19 + 0x00fc], %r29
	.word 0xfa446131  ! 1882: LDSW_I	ldsw	[%r17 + 0x0131], %r29
	.word 0xb1480000  ! 1883: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xf605c000  ! 1885: LDUW_R	lduw	[%r23 + %r0], %r27
	.word 0xbc35c000  ! 1887: ORN_R	orn 	%r23, %r0, %r30
	.word 0xfe1c60ef  ! 1888: LDD_I	ldd	[%r17 + 0x00ef], %r31
	.word 0xf40cc000  ! 1890: LDUB_R	ldub	[%r19 + %r0], %r26
	.word 0xfa1c6049  ! 1900: LDD_I	ldd	[%r17 + 0x0049], %r29
	.word 0xb550c000  ! 1905: RDPR_TT	<illegal instruction>
	.word 0x8395e0ce  ! 1906: WRPR_TNPC_I	wrpr	%r23, 0x00ce, %tnpc
	setx	0x3013a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc150000  ! 1914: LDUH_R	lduh	[%r20 + %r0], %r30
	.word 0xfe4420dd  ! 1915: LDSW_I	ldsw	[%r16 + 0x00dd], %r31
	.word 0xf04c0000  ! 1916: LDSB_R	ldsb	[%r16 + %r0], %r24
	.word 0xfe058000  ! 1917: LDUW_R	lduw	[%r22 + %r0], %r31
	.word 0x87956044  ! 1921: WRPR_TT_I	wrpr	%r21, 0x0044, %tt
	.word 0xf015c000  ! 1922: LDUH_R	lduh	[%r23 + %r0], %r24
	.word 0xfc04a164  ! 1926: LDUW_I	lduw	[%r18 + 0x0164], %r30
	.word 0xf64c0000  ! 1928: LDSB_R	ldsb	[%r16 + %r0], %r27
	.word 0xb645e066  ! 1929: ADDC_I	addc 	%r23, 0x0066, %r27
	.word 0xf51ce123  ! 1930: LDDF_I	ldd	[%r19, 0x0123], %f26
	.word 0xf64c0000  ! 1931: LDSB_R	ldsb	[%r16 + %r0], %r27
	.word 0xfc546147  ! 1934: LDSH_I	ldsh	[%r17 + 0x0147], %r30
	.word 0xf0142135  ! 1936: LDUH_I	lduh	[%r16 + 0x0135], %r24
	.word 0xb3520000  ! 1937: RDPR_PIL	<illegal instruction>
	.word 0x879461f9  ! 1939: WRPR_TT_I	wrpr	%r17, 0x01f9, %tt
	.word 0xb00ca1db  ! 1947: AND_I	and 	%r18, 0x01db, %r24
	.word 0x859560fa  ! 1948: WRPR_TSTATE_I	wrpr	%r21, 0x00fa, %tstate
	mov	0, %r12
	.word 0x8f932000  ! 1949: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf4148000  ! 1950: LDUH_R	lduh	[%r18 + %r0], %r26
	setx	0x10012, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf4548000  ! 1958: LDSH_R	ldsh	[%r18 + %r0], %r26
	mov	1, %r12
	.word 0x8f932000  ! 1960: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbf510000  ! 1961: RDPR_TICK	<illegal instruction>
	.word 0xfe55c000  ! 1962: LDSH_R	ldsh	[%r23 + %r0], %r31
	.word 0xb62c4000  ! 1964: ANDN_R	andn 	%r17, %r0, %r27
	.word 0xf645c000  ! 1965: LDSW_R	ldsw	[%r23 + %r0], %r27
	.word 0xfa0d2035  ! 1968: LDUB_I	ldub	[%r20 + 0x0035], %r29
	setx	data_start_6, %g1, %r17
	.word 0xfc0c60f2  ! 1970: LDUB_I	ldub	[%r17 + 0x00f2], %r30
	.word 0xbf51c000  ! 1971: RDPR_TL	<illegal instruction>
	.word 0xb5354000  ! 1972: SRL_R	srl 	%r21, %r0, %r26
	ta	T_CHANGE_HPRIV
	.word 0x81983ad9  ! 1977: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ad9, %hpstate
	.word 0xf414217c  ! 1978: LDUH_I	lduh	[%r16 + 0x017c], %r26
	.word 0xf05da046  ! 1983: LDX_I	ldx	[%r22 + 0x0046], %r24
	.word 0xf20c21bd  ! 1986: LDUB_I	ldub	[%r16 + 0x01bd], %r25
	.word 0xff1c2137  ! 1989: LDDF_I	ldd	[%r16, 0x0137], %f31
	setx	0x30034, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf4550000  ! 1992: LDSH_R	ldsh	[%r20 + %r0], %r26
	setx	0x30203, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	0, %r12
	.word 0x8f932000  ! 1995: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbf643801  ! 1996: MOVcc_I	<illegal instruction>
	.word 0xf51d8000  ! 1997: LDDF_R	ldd	[%r22, %r0], %f26
	.word 0xf444e144  ! 1998: LDSW_I	ldsw	[%r19 + 0x0144], %r26
	.word 0xff1dc000  ! 2000: LDDF_R	ldd	[%r23, %r0], %f31
	.word 0xb7518000  ! 2003: RDPR_PSTATE	<illegal instruction>
	setx	0x308, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	1, %r12
	.word 0x8f932000  ! 2006: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf4150000  ! 2013: LDUH_R	lduh	[%r20 + %r0], %r26
	.word 0x8d95e0e2  ! 2015: WRPR_PSTATE_I	wrpr	%r23, 0x00e2, %pstate
	.word 0x8395a1bc  ! 2016: WRPR_TNPC_I	wrpr	%r22, 0x01bc, %tnpc
	setx	0x30222, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb643801  ! 2019: MOVcc_I	<illegal instruction>
	.word 0xfe15a0bd  ! 2020: LDUH_I	lduh	[%r22 + 0x00bd], %r31
	.word 0xf8040000  ! 2026: LDUW_R	lduw	[%r16 + %r0], %r28
	setx	0x23f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc1560dc  ! 2030: LDUH_I	lduh	[%r21 + 0x00dc], %r30
	setx	0x20104, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf0040000  ! 2034: LDUW_R	lduw	[%r16 + %r0], %r24
	.word 0xbb520000  ! 2038: RDPR_PIL	<illegal instruction>
	.word 0xfe540000  ! 2043: LDSH_R	ldsh	[%r16 + %r0], %r31
	.word 0xfa148000  ! 2045: LDUH_R	lduh	[%r18 + %r0], %r29
	.word 0xfe050000  ! 2051: LDUW_R	lduw	[%r20 + %r0], %r31
	.word 0xfd1da1f3  ! 2056: LDDF_I	ldd	[%r22, 0x01f3], %f30
	.word 0xff1c4000  ! 2059: LDDF_R	ldd	[%r17, %r0], %f31
	setx	0x6, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x323, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbc456143  ! 2065: ADDC_I	addc 	%r21, 0x0143, %r30
	.word 0x81956129  ! 2071: WRPR_TPC_I	wrpr	%r21, 0x0129, %tpc
	.word 0xb9510000  ! 2072: RDPR_TICK	<illegal instruction>
	.word 0xf04d0000  ! 2075: LDSB_R	ldsb	[%r20 + %r0], %r24
	.word 0xf814e0ef  ! 2082: LDUH_I	lduh	[%r19 + 0x00ef], %r28
	.word 0x8794a048  ! 2083: WRPR_TT_I	wrpr	%r18, 0x0048, %tt
	.word 0xbd518000  ! 2084: RDPR_PSTATE	<illegal instruction>
	.word 0xf00da00a  ! 2090: LDUB_I	ldub	[%r22 + 0x000a], %r24
	.word 0xb6142009  ! 2091: OR_I	or 	%r16, 0x0009, %r27
	.word 0xf04c0000  ! 2092: LDSB_R	ldsb	[%r16 + %r0], %r24
	setx	0x10330, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10036, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb33dc000  ! 2100: SRA_R	sra 	%r23, %r0, %r25
	.word 0xff1ca093  ! 2105: LDDF_I	ldd	[%r18, 0x0093], %f31
	.word 0xf20d6151  ! 2107: LDUB_I	ldub	[%r21 + 0x0151], %r25
	.word 0xf60d61ad  ! 2108: LDUB_I	ldub	[%r21 + 0x01ad], %r27
	.word 0xb1500000  ! 2109: RDPR_TPC	<illegal instruction>
	setx	0x10222, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1643801  ! 2113: MOVcc_I	<illegal instruction>
	.word 0xfc448000  ! 2119: LDSW_R	ldsw	[%r18 + %r0], %r30
	.word 0xfc456037  ! 2120: LDSW_I	ldsw	[%r21 + 0x0037], %r30
	.word 0xfa0da0c7  ! 2121: LDUB_I	ldub	[%r22 + 0x00c7], %r29
	.word 0xb6958000  ! 2122: ORcc_R	orcc 	%r22, %r0, %r27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb12c0000  ! 2128: SLL_R	sll 	%r16, %r0, %r24
	.word 0xb8354000  ! 2130: SUBC_R	orn 	%r21, %r0, %r28
	.word 0xfe4de07a  ! 2132: LDSB_I	ldsb	[%r23 + 0x007a], %r31
	.word 0xfa05a1eb  ! 2141: LDUW_I	lduw	[%r22 + 0x01eb], %r29
	.word 0xf81c6110  ! 2142: LDD_I	ldd	[%r17 + 0x0110], %r28
	.word 0xfa5d610e  ! 2147: LDX_I	ldx	[%r21 + 0x010e], %r29
	.word 0xfc1ca0d2  ! 2149: LDD_I	ldd	[%r18 + 0x00d2], %r30
	.word 0x8794603c  ! 2151: WRPR_TT_I	wrpr	%r17, 0x003c, %tt
	.word 0xfc050000  ! 2155: LDUW_R	lduw	[%r20 + %r0], %r30
	.word 0xf20d2154  ! 2156: LDUB_I	ldub	[%r20 + 0x0154], %r25
	.word 0xb01da11c  ! 2159: XOR_I	xor 	%r22, 0x011c, %r24
	.word 0xf85d0000  ! 2161: LDX_R	ldx	[%r20 + %r0], %r28
	.word 0x91942159  ! 2164: WRPR_PIL_I	wrpr	%r16, 0x0159, %pil
	setx	0x2001c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf80560e8  ! 2169: LDUW_I	lduw	[%r21 + 0x00e8], %r28
	setx	0x30210, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf81560ad  ! 2175: LDUH_I	lduh	[%r21 + 0x00ad], %r28
	setx	0x10330, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa5de154  ! 2184: LDX_I	ldx	[%r23 + 0x0154], %r29
	.word 0x8d9421ec  ! 2186: WRPR_PSTATE_I	wrpr	%r16, 0x01ec, %pstate
	.word 0xf4158000  ! 2190: LDUH_R	lduh	[%r22 + %r0], %r26
	.word 0xfe158000  ! 2194: LDUH_R	lduh	[%r22 + %r0], %r31
	.word 0xf8158000  ! 2195: LDUH_R	lduh	[%r22 + %r0], %r28
	.word 0xb7641800  ! 2196: MOVcc_R	<illegal instruction>
	.word 0xf21d8000  ! 2197: LDD_R	ldd	[%r22 + %r0], %r25
	.word 0xf21cc000  ! 2207: LDD_R	ldd	[%r19 + %r0], %r25
	.word 0xfa0c2019  ! 2209: LDUB_I	ldub	[%r16 + 0x0019], %r29
	.word 0x9195e1fc  ! 2215: WRPR_PIL_I	wrpr	%r23, 0x01fc, %pil
	.word 0xf45d0000  ! 2217: LDX_R	ldx	[%r20 + %r0], %r26
	.word 0xb151c000  ! 2219: RDPR_TL	rdpr	%tl, %r24
	ta	T_CHANGE_HPRIV
	.word 0x81982f93  ! 2220: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f93, %hpstate
	ta	T_CHANGE_HPRIV
	.word 0x81983f03  ! 2221: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f03, %hpstate
	setx	0x1001d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x22d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xff1dc000  ! 2227: LDDF_R	ldd	[%r23, %r0], %f31
	setx	0x3e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf80d6080  ! 2235: LDUB_I	ldub	[%r21 + 0x0080], %r28
	.word 0xb1480000  ! 2236: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xbb518000  ! 2238: RDPR_PSTATE	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81983e0b  ! 2240: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e0b, %hpstate
	.word 0xf8454000  ! 2241: LDSW_R	ldsw	[%r21 + %r0], %r28
	ta	T_CHANGE_HPRIV
	.word 0x81983913  ! 2243: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1913, %hpstate
	setx	0x3033a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x307, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81982e89  ! 2251: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e89, %hpstate
	.word 0xbb51c000  ! 2252: RDPR_TL	<illegal instruction>
	.word 0xf41d8000  ! 2253: LDD_R	ldd	[%r22 + %r0], %r26
	.word 0x8d95a116  ! 2262: WRPR_PSTATE_I	wrpr	%r22, 0x0116, %pstate
	setx	0x10116, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r17
	setx	0x9, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe4d2053  ! 2277: LDSB_I	ldsb	[%r20 + 0x0053], %r31
	.word 0xf01c2098  ! 2280: LDD_I	ldd	[%r16 + 0x0098], %r24
	.word 0xf85c4000  ! 2281: LDX_R	ldx	[%r17 + %r0], %r28
	.word 0xf2058000  ! 2283: LDUW_R	lduw	[%r22 + %r0], %r25
	mov	1, %r12
	.word 0x8f932000  ! 2284: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbf3dc000  ! 2292: SRA_R	sra 	%r23, %r0, %r31
	.word 0xfa4c6179  ! 2294: LDSB_I	ldsb	[%r17 + 0x0179], %r29
	.word 0xb53c6001  ! 2295: SRA_I	sra 	%r17, 0x0001, %r26
	.word 0xf6040000  ! 2301: LDUW_R	lduw	[%r16 + %r0], %r27
	.word 0xfe5ce1db  ! 2304: LDX_I	ldx	[%r19 + 0x01db], %r31
	ta	T_CHANGE_HPRIV
	.word 0x819829c9  ! 2305: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09c9, %hpstate
	.word 0xf404e0a8  ! 2309: LDUW_I	lduw	[%r19 + 0x00a8], %r26
	.word 0xf055e110  ! 2310: LDSH_I	ldsh	[%r23 + 0x0110], %r24
	mov	0, %r14
	.word 0xa193a000  ! 2312: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x2032f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc5c6169  ! 2314: LDX_I	ldx	[%r17 + 0x0169], %r30
	.word 0xf61da1ec  ! 2317: LDD_I	ldd	[%r22 + 0x01ec], %r27
	.word 0xbb508000  ! 2320: RDPR_TSTATE	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfc4c4000  ! 2325: LDSB_R	ldsb	[%r17 + %r0], %r30
	setx	data_start_2, %g1, %r17
	.word 0xf804210a  ! 2331: LDUW_I	lduw	[%r16 + 0x010a], %r28
	.word 0xf81c2130  ! 2333: LDD_I	ldd	[%r16 + 0x0130], %r28
	.word 0xf21c61fd  ! 2334: LDD_I	ldd	[%r17 + 0x01fd], %r25
	.word 0xf80dc000  ! 2335: LDUB_R	ldub	[%r23 + %r0], %r28
	setx	data_start_0, %g1, %r23
	.word 0xf80de062  ! 2339: LDUB_I	ldub	[%r23 + 0x0062], %r28
	setx	0x10024, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7540000  ! 2348: RDPR_GL	<illegal instruction>
	.word 0xf85d8000  ! 2349: LDX_R	ldx	[%r22 + %r0], %r28
	.word 0xb5540000  ! 2351: RDPR_GL	<illegal instruction>
	.word 0xf65421d2  ! 2354: LDSH_I	ldsh	[%r16 + 0x01d2], %r27
	.word 0xf4456177  ! 2355: LDSW_I	ldsw	[%r21 + 0x0177], %r26
	.word 0x8794209e  ! 2360: WRPR_TT_I	wrpr	%r16, 0x009e, %tt
	.word 0xfa1d4000  ! 2362: LDD_R	ldd	[%r21 + %r0], %r29
	.word 0xb9500000  ! 2366: RDPR_TPC	<illegal instruction>
	.word 0xf65da19d  ! 2367: LDX_I	ldx	[%r22 + 0x019d], %r27
	.word 0x8d946003  ! 2370: WRPR_PSTATE_I	wrpr	%r17, 0x0003, %pstate
	.word 0xf65c8000  ! 2371: LDX_R	ldx	[%r18 + %r0], %r27
	.word 0xb80421f3  ! 2372: ADD_I	add 	%r16, 0x01f3, %r28
	setx	0x3022a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf6158000  ! 2376: LDUH_R	lduh	[%r22 + %r0], %r27
	setx	data_start_4, %g1, %r20
	.word 0xf41d0000  ! 2379: LDD_R	ldd	[%r20 + %r0], %r26
	.word 0x9194a0a6  ! 2381: WRPR_PIL_I	wrpr	%r18, 0x00a6, %pil
	.word 0xb1520000  ! 2383: RDPR_PIL	<illegal instruction>
	.word 0xfc154000  ! 2386: LDUH_R	lduh	[%r21 + %r0], %r30
	.word 0xbd508000  ! 2387: RDPR_TSTATE	<illegal instruction>
	.word 0xfe150000  ! 2390: LDUH_R	lduh	[%r20 + %r0], %r31
	.word 0xb351c000  ! 2392: RDPR_TL	<illegal instruction>
	mov	0, %r12
	.word 0x8f932000  ! 2394: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0x8795619d  ! 2396: WRPR_TT_I	wrpr	%r21, 0x019d, %tt
	.word 0xf614215c  ! 2399: LDUH_I	lduh	[%r16 + 0x015c], %r27
	.word 0xf21c618b  ! 2400: LDD_I	ldd	[%r17 + 0x018b], %r25
	.word 0xbf520000  ! 2405: RDPR_PIL	<illegal instruction>
	.word 0xf65ca196  ! 2408: LDX_I	ldx	[%r18 + 0x0196], %r27
	.word 0xf25c21ee  ! 2410: LDX_I	ldx	[%r16 + 0x01ee], %r25
	.word 0xf81de0e8  ! 2415: LDD_I	ldd	[%r23 + 0x00e8], %r28
	.word 0xfa550000  ! 2416: LDSH_R	ldsh	[%r20 + %r0], %r29
	setx	data_start_0, %g1, %r18
	.word 0xbaaca00c  ! 2418: ANDNcc_I	andncc 	%r18, 0x000c, %r29
	.word 0xfa15c000  ! 2420: LDUH_R	lduh	[%r23 + %r0], %r29
	.word 0xfa150000  ! 2424: LDUH_R	lduh	[%r20 + %r0], %r29
	.word 0xbec44000  ! 2427: ADDCcc_R	addccc 	%r17, %r0, %r31
	.word 0xfa15e034  ! 2430: LDUH_I	lduh	[%r23 + 0x0034], %r29
	setx	data_start_2, %g1, %r21
	.word 0x83952041  ! 2436: WRPR_TNPC_I	wrpr	%r20, 0x0041, %tnpc
	.word 0x8395e1e7  ! 2437: WRPR_TNPC_I	wrpr	%r23, 0x01e7, %tnpc
	.word 0xbb480000  ! 2439: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0x8395e075  ! 2442: WRPR_TNPC_I	wrpr	%r23, 0x0075, %tnpc
	.word 0xf71da198  ! 2443: LDDF_I	ldd	[%r22, 0x0198], %f27
	.word 0xb151c000  ! 2446: RDPR_TL	<illegal instruction>
	.word 0xf81c211c  ! 2449: LDD_I	ldd	[%r16 + 0x011c], %r28
	.word 0xf81461f5  ! 2451: LDUH_I	lduh	[%r17 + 0x01f5], %r28
	.word 0xb89c0000  ! 2452: XORcc_R	xorcc 	%r16, %r0, %r28
	mov	1, %r14
	.word 0xa193a000  ! 2453: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	data_start_0, %g1, %r23
	.word 0xfe548000  ! 2455: LDSH_R	ldsh	[%r18 + %r0], %r31
	.word 0xfe148000  ! 2456: LDUH_R	lduh	[%r18 + %r0], %r31
	.word 0x819521c4  ! 2458: WRPR_TPC_I	wrpr	%r20, 0x01c4, %tpc
	.word 0xfa1c4000  ! 2460: LDD_R	ldd	[%r17 + %r0], %r29
	.word 0xfc4d607a  ! 2465: LDSB_I	ldsb	[%r21 + 0x007a], %r30
	.word 0xfb1d8000  ! 2467: LDDF_R	ldd	[%r22, %r0], %f29
	setx	0x22c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe5c6114  ! 2469: LDX_I	ldx	[%r17 + 0x0114], %r31
	.word 0x89956164  ! 2471: WRPR_TICK_I	wrpr	%r21, 0x0164, %tick
	setx	0x20012, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x1030e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb12ce001  ! 2477: SLL_I	sll 	%r19, 0x0001, %r24
	.word 0xf6542044  ! 2480: LDSH_I	ldsh	[%r16 + 0x0044], %r27
	.word 0xfa540000  ! 2484: LDSH_R	ldsh	[%r16 + %r0], %r29
	setx	data_start_6, %g1, %r22
	.word 0xfe0d8000  ! 2489: LDUB_R	ldub	[%r22 + %r0], %r31
	.word 0xb5520000  ! 2491: RDPR_PIL	<illegal instruction>
	.word 0x9195a14d  ! 2492: WRPR_PIL_I	wrpr	%r22, 0x014d, %pil
	ta	T_CHANGE_HPRIV
	.word 0x81983a0b  ! 2495: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a0b, %hpstate
	.word 0xf44d0000  ! 2496: LDSB_R	ldsb	[%r20 + %r0], %r26
	.word 0x8594611b  ! 2499: WRPR_TSTATE_I	wrpr	%r17, 0x011b, %tstate
	setx	data_start_4, %g1, %r23
	.word 0xf84421fb  ! 2503: LDSW_I	ldsw	[%r16 + 0x01fb], %r28
	.word 0xfc14e18f  ! 2504: LDUH_I	lduh	[%r19 + 0x018f], %r30
	setx	0x1003d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8995e111  ! 2507: WRPR_TICK_I	wrpr	%r23, 0x0111, %tick
	.word 0x8794608b  ! 2514: WRPR_TT_I	wrpr	%r17, 0x008b, %tt
	.word 0xbd508000  ! 2515: RDPR_TSTATE	rdpr	%tstate, %r30
	.word 0xb5520000  ! 2517: RDPR_PIL	<illegal instruction>
	.word 0xf45dc000  ! 2520: LDX_R	ldx	[%r23 + %r0], %r26
	.word 0x8194e022  ! 2521: WRPR_TPC_I	wrpr	%r19, 0x0022, %tpc
	.word 0xf85c4000  ! 2523: LDX_R	ldx	[%r17 + %r0], %r28
	.word 0xf8554000  ! 2525: LDSH_R	ldsh	[%r21 + %r0], %r28
	.word 0xfc044000  ! 2528: LDUW_R	lduw	[%r17 + %r0], %r30
	.word 0xf044e046  ! 2535: LDSW_I	ldsw	[%r19 + 0x0046], %r24
	.word 0xf20de05a  ! 2536: LDUB_I	ldub	[%r23 + 0x005a], %r25
	.word 0xf84c8000  ! 2538: LDSB_R	ldsb	[%r18 + %r0], %r28
	.word 0xfe5cc000  ! 2539: LDX_R	ldx	[%r19 + %r0], %r31
	setx	0x10112, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb53ce001  ! 2541: SRA_I	sra 	%r19, 0x0001, %r26
	.word 0x8594a0f5  ! 2542: WRPR_TSTATE_I	wrpr	%r18, 0x00f5, %tstate
	.word 0xf24ca015  ! 2544: LDSB_I	ldsb	[%r18 + 0x0015], %r25
	.word 0xb4158000  ! 2545: OR_R	or 	%r22, %r0, %r26
	.word 0xf2058000  ! 2547: LDUW_R	lduw	[%r22 + %r0], %r25
	.word 0xf0558000  ! 2548: LDSH_R	ldsh	[%r22 + %r0], %r24
	.word 0xfc0ce156  ! 2549: LDUB_I	ldub	[%r19 + 0x0156], %r30
	setx	0x2a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf11d0000  ! 2556: LDDF_R	ldd	[%r20, %r0], %f24
	.word 0xf805e1d5  ! 2557: LDUW_I	lduw	[%r23 + 0x01d5], %r28
	.word 0xfe4c8000  ! 2559: LDSB_R	ldsb	[%r18 + %r0], %r31
	setx	0x20218, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3480000  ! 2563: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	setx	0x20001, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x215, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb8c461f2  ! 2568: ADDCcc_I	addccc 	%r17, 0x01f2, %r28
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf0442158  ! 2576: LDSW_I	ldsw	[%r16 + 0x0158], %r24
	.word 0xb72cc000  ! 2577: SLL_R	sll 	%r19, %r0, %r27
	.word 0xb2bca038  ! 2584: XNORcc_I	xnorcc 	%r18, 0x0038, %r25
	.word 0xf605c000  ! 2585: LDUW_R	lduw	[%r23 + %r0], %r27
	.word 0xf04dc000  ! 2587: LDSB_R	ldsb	[%r23 + %r0], %r24
	.word 0xf2148000  ! 2596: LDUH_R	lduh	[%r18 + %r0], %r25
	.word 0xf81ca14c  ! 2603: LDD_I	ldd	[%r18 + 0x014c], %r28
	setx	data_start_3, %g1, %r19
	.word 0xfc15a0a8  ! 2609: LDUH_I	lduh	[%r22 + 0x00a8], %r30
	mov	2, %r12
	.word 0x8f932000  ! 2614: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xba0da199  ! 2617: AND_I	and 	%r22, 0x0199, %r29
	.word 0xfa04617f  ! 2618: LDUW_I	lduw	[%r17 + 0x017f], %r29
	.word 0xb7540000  ! 2621: RDPR_GL	rdpr	%-, %r27
	.word 0xb43c2074  ! 2624: XNOR_I	xnor 	%r16, 0x0074, %r26
	.word 0xfa448000  ! 2625: LDSW_R	ldsw	[%r18 + %r0], %r29
	.word 0xf91d4000  ! 2626: LDDF_R	ldd	[%r21, %r0], %f28
	.word 0xb01d8000  ! 2631: XOR_R	xor 	%r22, %r0, %r24
	.word 0xf044606c  ! 2632: LDSW_I	ldsw	[%r17 + 0x006c], %r24
	.word 0x8994a1ac  ! 2635: WRPR_TICK_I	wrpr	%r18, 0x01ac, %tick
	.word 0x859420c2  ! 2636: WRPR_TSTATE_I	wrpr	%r16, 0x00c2, %tstate
	.word 0xfa44e055  ! 2641: LDSW_I	ldsw	[%r19 + 0x0055], %r29
	setx	data_start_0, %g1, %r17
	.word 0xbe1c20ff  ! 2643: XOR_I	xor 	%r16, 0x00ff, %r31
	setx	0x2021e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe1c21db  ! 2647: LDD_I	ldd	[%r16 + 0x01db], %r31
	ta	T_CHANGE_HPRIV
	.word 0x81982d09  ! 2648: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d09, %hpstate
	.word 0xf21561b2  ! 2649: LDUH_I	lduh	[%r21 + 0x01b2], %r25
	.word 0xfe14c000  ! 2650: LDUH_R	lduh	[%r19 + %r0], %r31
	setx	0x1023b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf2448000  ! 2658: LDSW_R	ldsw	[%r18 + %r0], %r25
	.word 0xf84d6068  ! 2659: LDSB_I	ldsb	[%r21 + 0x0068], %r28
	setx	0x22f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x2033c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81983d91  ! 2667: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d91, %hpstate
	setx	0x30012, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf0058000  ! 2675: LDUW_R	lduw	[%r22 + %r0], %r24
	.word 0xf4154000  ! 2677: LDUH_R	lduh	[%r21 + %r0], %r26
	.word 0xf404c000  ! 2678: LDUW_R	lduw	[%r19 + %r0], %r26
	.word 0xfc44c000  ! 2681: LDSW_R	ldsw	[%r19 + %r0], %r30
	setx	0x318, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x839520e0  ! 2683: WRPR_TNPC_I	wrpr	%r20, 0x00e0, %tnpc
	.word 0xfc444000  ! 2685: LDSW_R	ldsw	[%r17 + %r0], %r30
	setx	0x10b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7520000  ! 2696: RDPR_PIL	<illegal instruction>
	mov	0, %r14
	.word 0xa193a000  ! 2699: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf015a08b  ! 2700: LDUH_I	lduh	[%r22 + 0x008b], %r24
	.word 0x8d94a039  ! 2701: WRPR_PSTATE_I	wrpr	%r18, 0x0039, %pstate
	.word 0xf0448000  ! 2706: LDSW_R	ldsw	[%r18 + %r0], %r24
	.word 0xbcb46176  ! 2709: SUBCcc_I	orncc 	%r17, 0x0176, %r30
	.word 0xbb518000  ! 2711: RDPR_PSTATE	<illegal instruction>
	setx	0x14, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa04216d  ! 2716: LDUW_I	lduw	[%r16 + 0x016d], %r29
	.word 0xb550c000  ! 2717: RDPR_TT	<illegal instruction>
	.word 0xf91c206c  ! 2718: LDDF_I	ldd	[%r16, 0x006c], %f28
	setx	0x20118, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf445a0e3  ! 2721: LDSW_I	ldsw	[%r22 + 0x00e3], %r26
	.word 0xb7500000  ! 2723: RDPR_TPC	<illegal instruction>
	.word 0xf8044000  ! 2725: LDUW_R	lduw	[%r17 + %r0], %r28
	.word 0xf20cc000  ! 2727: LDUB_R	ldub	[%r19 + %r0], %r25
	.word 0xf845c000  ! 2730: LDSW_R	ldsw	[%r23 + %r0], %r28
	.word 0xf80dc000  ! 2734: LDUB_R	ldub	[%r23 + %r0], %r28
	.word 0xf6156180  ! 2741: LDUH_I	lduh	[%r21 + 0x0180], %r27
	.word 0xfa440000  ! 2749: LDSW_R	ldsw	[%r16 + %r0], %r29
	.word 0xf854c000  ! 2750: LDSH_R	ldsh	[%r19 + %r0], %r28
	.word 0xb12d9000  ! 2754: SLLX_R	sllx	%r22, %r0, %r24
	.word 0xf60c0000  ! 2756: LDUB_R	ldub	[%r16 + %r0], %r27
	.word 0xfc0c0000  ! 2758: LDUB_R	ldub	[%r16 + %r0], %r30
	.word 0xf2054000  ! 2759: LDUW_R	lduw	[%r21 + %r0], %r25
	.word 0xf8456172  ! 2762: LDSW_I	ldsw	[%r21 + 0x0172], %r28
	.word 0xfc55c000  ! 2763: LDSH_R	ldsh	[%r23 + %r0], %r30
	ta	T_CHANGE_HPRIV
	.word 0x81983b8b  ! 2765: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b8b, %hpstate
	setx	0x1003b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf84520df  ! 2768: LDSW_I	ldsw	[%r20 + 0x00df], %r28
	.word 0xb025c000  ! 2769: SUB_R	sub 	%r23, %r0, %r24
	.word 0xf605e1ef  ! 2771: LDUW_I	lduw	[%r23 + 0x01ef], %r27
	.word 0xbd2dd000  ! 2773: SLLX_R	sllx	%r23, %r0, %r30
	.word 0xb3500000  ! 2774: RDPR_TPC	rdpr	%tpc, %r25
	setx	0x30120, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8794e10a  ! 2776: WRPR_TT_I	wrpr	%r19, 0x010a, %tt
	.word 0xfc046113  ! 2778: LDUW_I	lduw	[%r17 + 0x0113], %r30
	.word 0xf65c0000  ! 2781: LDX_R	ldx	[%r16 + %r0], %r27
	.word 0xbc944000  ! 2783: ORcc_R	orcc 	%r17, %r0, %r30
	.word 0xff1d8000  ! 2786: LDDF_R	ldd	[%r22, %r0], %f31
	.word 0xf814c000  ! 2787: LDUH_R	lduh	[%r19 + %r0], %r28
	.word 0xfa544000  ! 2794: LDSH_R	ldsh	[%r17 + %r0], %r29
	.word 0xff1d2094  ! 2798: LDDF_I	ldd	[%r20, 0x0094], %f31
	.word 0xfa554000  ! 2799: LDSH_R	ldsh	[%r21 + %r0], %r29
	.word 0xb4058000  ! 2801: ADD_R	add 	%r22, %r0, %r26
	.word 0xf51ca19a  ! 2802: LDDF_I	ldd	[%r18, 0x019a], %f26
	setx	0x30027, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20017, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd480000  ! 2817: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xf81de16a  ! 2818: LDD_I	ldd	[%r23 + 0x016a], %r28
	.word 0xb73d3001  ! 2820: SRAX_I	srax	%r20, 0x0001, %r27
	.word 0xf51d6058  ! 2821: LDDF_I	ldd	[%r21, 0x0058], %f26
	.word 0xf415a07b  ! 2824: LDUH_I	lduh	[%r22 + 0x007b], %r26
	.word 0xfc54e1ba  ! 2826: LDSH_I	ldsh	[%r19 + 0x01ba], %r30
	.word 0xf60d4000  ! 2828: LDUB_R	ldub	[%r21 + %r0], %r27
	.word 0x8195e179  ! 2832: WRPR_TPC_I	wrpr	%r23, 0x0179, %tpc
	.word 0xf8554000  ! 2833: LDSH_R	ldsh	[%r21 + %r0], %r28
	.word 0xfa4c21a0  ! 2834: LDSB_I	ldsb	[%r16 + 0x01a0], %r29
	.word 0xb7508000  ! 2838: RDPR_TSTATE	<illegal instruction>
	.word 0xfa454000  ! 2842: LDSW_R	ldsw	[%r21 + %r0], %r29
	.word 0xb52c1000  ! 2843: SLLX_R	sllx	%r16, %r0, %r26
	.word 0x89942134  ! 2844: WRPR_TICK_I	wrpr	%r16, 0x0134, %tick
	.word 0xf6450000  ! 2848: LDSW_R	ldsw	[%r20 + %r0], %r27
	.word 0xf21c6080  ! 2849: LDD_I	ldd	[%r17 + 0x0080], %r25
	.word 0xf2058000  ! 2850: LDUW_R	lduw	[%r22 + %r0], %r25
	.word 0xb92dc000  ! 2856: SLL_R	sll 	%r23, %r0, %r28
	.word 0xb33ca001  ! 2859: SRA_I	sra 	%r18, 0x0001, %r25
	.word 0xb93cc000  ! 2860: SRA_R	sra 	%r19, %r0, %r28
	.word 0xf31ca010  ! 2865: LDDF_I	ldd	[%r18, 0x0010], %f25
	setx	0x1010c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf91dc000  ! 2867: LDDF_R	ldd	[%r23, %r0], %f28
	setx	data_start_4, %g1, %r22
	.word 0xf654c000  ! 2873: LDSH_R	ldsh	[%r19 + %r0], %r27
	ta	T_CHANGE_HPRIV
	.word 0x81983b81  ! 2876: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b81, %hpstate
	.word 0xb42d0000  ! 2877: ANDN_R	andn 	%r20, %r0, %r26
	.word 0xf814605d  ! 2879: LDUH_I	lduh	[%r17 + 0x005d], %r28
	setx	data_start_6, %g1, %r23
	setx	0x10015, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30210, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf45dc000  ! 2891: LDX_R	ldx	[%r23 + %r0], %r26
	.word 0xfe0ce104  ! 2893: LDUB_I	ldub	[%r19 + 0x0104], %r31
	.word 0xbf500000  ! 2895: RDPR_TPC	<illegal instruction>
	.word 0xfd1dc000  ! 2896: LDDF_R	ldd	[%r23, %r0], %f30
	.word 0xf45ca13d  ! 2898: LDX_I	ldx	[%r18 + 0x013d], %r26
	setx	0x10031, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa0d0000  ! 2901: LDUB_R	ldub	[%r20 + %r0], %r29
	mov	0, %r12
	.word 0x8f932000  ! 2903: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0x89942165  ! 2904: WRPR_TICK_I	wrpr	%r16, 0x0165, %tick
	setx	0x20338, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc058000  ! 2915: LDUW_R	lduw	[%r22 + %r0], %r30
	setx	0x3032f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf504000  ! 2918: RDPR_TNPC	<illegal instruction>
	setx	0x20211, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb151c000  ! 2922: RDPR_TL	<illegal instruction>
	.word 0xff1d0000  ! 2925: LDDF_R	ldd	[%r20, %r0], %f31
	.word 0xf61c4000  ! 2929: LDD_R	ldd	[%r17 + %r0], %r27
	.word 0xfb1da0e5  ! 2933: LDDF_I	ldd	[%r22, 0x00e5], %f29
	setx	data_start_0, %g1, %r16
	.word 0xf91cc000  ! 2936: LDDF_R	ldd	[%r19, %r0], %f28
	mov	0, %r12
	.word 0x8f932000  ! 2937: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xf11d4000  ! 2938: LDDF_R	ldd	[%r21, %r0], %f24
	.word 0xfc544000  ! 2939: LDSH_R	ldsh	[%r17 + %r0], %r30
	.word 0xfa1d4000  ! 2940: LDD_R	ldd	[%r21 + %r0], %r29
	setx	0x30330, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf2d0000  ! 2942: SLL_R	sll 	%r20, %r0, %r31
	setx	0x10002, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20205, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa5d2109  ! 2951: LDX_I	ldx	[%r20 + 0x0109], %r29
	.word 0xb4a58000  ! 2957: SUBcc_R	subcc 	%r22, %r0, %r26
	.word 0xf6540000  ! 2959: LDSH_R	ldsh	[%r16 + %r0], %r27
	.word 0xbb50c000  ! 2960: RDPR_TT	rdpr	%tt, %r29
	.word 0xf454a1f6  ! 2961: LDSH_I	ldsh	[%r18 + 0x01f6], %r26
	.word 0xf41561db  ! 2962: LDUH_I	lduh	[%r21 + 0x01db], %r26
	setx	0xc, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfb1c4000  ! 2972: LDDF_R	ldd	[%r17, %r0], %f29
	.word 0xb5520000  ! 2974: RDPR_PIL	<illegal instruction>
	.word 0xb0954000  ! 2977: ORcc_R	orcc 	%r21, %r0, %r24
	setx	data_start_1, %g1, %r17
	.word 0x8394e025  ! 2982: WRPR_TNPC_I	wrpr	%r19, 0x0025, %tnpc
	.word 0xb8b561cc  ! 2986: ORNcc_I	orncc 	%r21, 0x01cc, %r28
	.word 0xf81c208c  ! 2988: LDD_I	ldd	[%r16 + 0x008c], %r28
	.word 0xf8054000  ! 2992: LDUW_R	lduw	[%r21 + %r0], %r28
	.word 0x9194e1a7  ! 2996: WRPR_PIL_I	wrpr	%r19, 0x01a7, %pil
	.word 0xfa4c204c  ! 2997: LDSB_I	ldsb	[%r16 + 0x004c], %r29
	.word 0xfc1ce1e4  ! 3002: LDD_I	ldd	[%r19 + 0x01e4], %r30
	.word 0xf444e10b  ! 3005: LDSW_I	ldsw	[%r19 + 0x010b], %r26
	setx	0x20225, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf71d20dc  ! 3011: LDDF_I	ldd	[%r20, 0x00dc], %f27
	.word 0xf255c000  ! 3012: LDSH_R	ldsh	[%r23 + %r0], %r25
	.word 0xbb50c000  ! 3013: RDPR_TT	<illegal instruction>
	.word 0xb5500000  ! 3017: RDPR_TPC	<illegal instruction>
	.word 0x899520bb  ! 3019: WRPR_TICK_I	wrpr	%r20, 0x00bb, %tick
	.word 0xf80c0000  ! 3020: LDUB_R	ldub	[%r16 + %r0], %r28
	.word 0xf0148000  ! 3022: LDUH_R	lduh	[%r18 + %r0], %r24
	.word 0xfa4d8000  ! 3023: LDSB_R	ldsb	[%r22 + %r0], %r29
	.word 0xfc0c8000  ! 3026: LDUB_R	ldub	[%r18 + %r0], %r30
	.word 0xf64c4000  ! 3029: LDSB_R	ldsb	[%r17 + %r0], %r27
	.word 0xf31c20b9  ! 3032: LDDF_I	ldd	[%r16, 0x00b9], %f25
	.word 0xfe1c61fd  ! 3034: LDD_I	ldd	[%r17 + 0x01fd], %r31
	.word 0xb2bc0000  ! 3035: XNORcc_R	xnorcc 	%r16, %r0, %r25
	.word 0xf00ca114  ! 3036: LDUB_I	ldub	[%r18 + 0x0114], %r24
	.word 0x8d95204a  ! 3039: WRPR_PSTATE_I	wrpr	%r20, 0x004a, %pstate
	.word 0xfa0d2194  ! 3040: LDUB_I	ldub	[%r20 + 0x0194], %r29
	.word 0xb5518000  ! 3042: RDPR_PSTATE	<illegal instruction>
	setx	data_start_2, %g1, %r21
	.word 0xf21cc000  ! 3051: LDD_R	ldd	[%r19 + %r0], %r25
	.word 0xbf2d4000  ! 3053: SLL_R	sll 	%r21, %r0, %r31
	.word 0x9195a179  ! 3055: WRPR_PIL_I	wrpr	%r22, 0x0179, %pil
	.word 0xbb51c000  ! 3061: RDPR_TL	<illegal instruction>
	.word 0xb32cb001  ! 3063: SLLX_I	sllx	%r18, 0x0001, %r25
	.word 0xf214a052  ! 3064: LDUH_I	lduh	[%r18 + 0x0052], %r25
	setx	0x2012a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc1560fd  ! 3067: LDUH_I	lduh	[%r21 + 0x00fd], %r30
	.word 0xfd1cc000  ! 3070: LDDF_R	ldd	[%r19, %r0], %f30
	.word 0xf21cc000  ! 3071: LDD_R	ldd	[%r19 + %r0], %r25
	.word 0xbf504000  ! 3073: RDPR_TNPC	<illegal instruction>
	.word 0xbc04c000  ! 3074: ADD_R	add 	%r19, %r0, %r30
	.word 0xfe4d8000  ! 3075: LDSB_R	ldsb	[%r22 + %r0], %r31
	setx	0x10307, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x1012e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf454c000  ! 3081: LDSH_R	ldsh	[%r19 + %r0], %r26
	.word 0xf655a1ca  ! 3085: LDSH_I	ldsh	[%r22 + 0x01ca], %r27
	.word 0xfc144000  ! 3086: LDUH_R	lduh	[%r17 + %r0], %r30
	setx	0x3011c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30034, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3345000  ! 3094: SRLX_R	srlx	%r17, %r0, %r25
	.word 0xfa5d6157  ! 3095: LDX_I	ldx	[%r21 + 0x0157], %r29
	.word 0xf0452100  ! 3100: LDSW_I	ldsw	[%r20 + 0x0100], %r24
	.word 0xb22ce094  ! 3104: ANDN_I	andn 	%r19, 0x0094, %r25
	.word 0xf84560ff  ! 3106: LDSW_I	ldsw	[%r21 + 0x00ff], %r28
	.word 0xf01d8000  ! 3110: LDD_R	ldd	[%r22 + %r0], %r24
	.word 0xb13c0000  ! 3111: SRA_R	sra 	%r16, %r0, %r24
	.word 0x919420af  ! 3114: WRPR_PIL_I	wrpr	%r16, 0x00af, %pil
	.word 0xb1508000  ! 3116: RDPR_TSTATE	<illegal instruction>
	.word 0xfe0561e0  ! 3117: LDUW_I	lduw	[%r21 + 0x01e0], %r31
	.word 0x8995604f  ! 3128: WRPR_TICK_I	wrpr	%r21, 0x004f, %tick
	.word 0xfe14e0c2  ! 3129: LDUH_I	lduh	[%r19 + 0x00c2], %r31
	.word 0xfa4ce0a9  ! 3133: LDSB_I	ldsb	[%r19 + 0x00a9], %r29
	.word 0x8194a07b  ! 3134: WRPR_TPC_I	wrpr	%r18, 0x007b, %tpc
	setx	0x10114, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf80cc000  ! 3137: LDUB_R	ldub	[%r19 + %r0], %r28
	.word 0xfc4d2099  ! 3138: LDSB_I	ldsb	[%r20 + 0x0099], %r30
	.word 0xf404217b  ! 3140: LDUW_I	lduw	[%r16 + 0x017b], %r26
	setx	data_start_1, %g1, %r21
	.word 0xfa5ce0c8  ! 3147: LDX_I	ldx	[%r19 + 0x00c8], %r29
	.word 0x8195e1a6  ! 3148: WRPR_TPC_I	wrpr	%r23, 0x01a6, %tpc
	.word 0xbd50c000  ! 3150: RDPR_TT	<illegal instruction>
	.word 0xb3357001  ! 3153: SRLX_I	srlx	%r21, 0x0001, %r25
	.word 0xfa0d8000  ! 3155: LDUB_R	ldub	[%r22 + %r0], %r29
	.word 0xb615a093  ! 3156: OR_I	or 	%r22, 0x0093, %r27
	.word 0xfe1cc000  ! 3171: LDD_R	ldd	[%r19 + %r0], %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	0x134, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3508000  ! 3188: RDPR_TSTATE	<illegal instruction>
	.word 0xfc4d21d2  ! 3190: LDSB_I	ldsb	[%r20 + 0x01d2], %r30
	.word 0xfa4d0000  ! 3192: LDSB_R	ldsb	[%r20 + %r0], %r29
	ta	T_CHANGE_HPRIV
	.word 0x819829cb  ! 3193: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09cb, %hpstate
	.word 0xf71d8000  ! 3195: LDDF_R	ldd	[%r22, %r0], %f27
	.word 0xbf3c7001  ! 3196: SRAX_I	srax	%r17, 0x0001, %r31
	.word 0xb1518000  ! 3198: RDPR_PSTATE	<illegal instruction>
	.word 0xf4548000  ! 3200: LDSH_R	ldsh	[%r18 + %r0], %r26
	.word 0xf0058000  ! 3201: LDUW_R	lduw	[%r22 + %r0], %r24
	.word 0x89956041  ! 3203: WRPR_TICK_I	wrpr	%r21, 0x0041, %tick
	setx	0x132, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe1de172  ! 3208: LDD_I	ldd	[%r23 + 0x0172], %r31
	setx	0x20226, %g1, %o0
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
	mov	1, %r14
	.word 0xa193a000  ! 3219: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb89c0000  ! 3220: XORcc_R	xorcc 	%r16, %r0, %r28
	.word 0x859420ae  ! 3223: WRPR_TSTATE_I	wrpr	%r16, 0x00ae, %tstate
	.word 0xf2046094  ! 3228: LDUW_I	lduw	[%r17 + 0x0094], %r25
	.word 0xf605c000  ! 3230: LDUW_R	lduw	[%r23 + %r0], %r27
	.word 0xf80461a0  ! 3239: LDUW_I	lduw	[%r17 + 0x01a0], %r28
	.word 0xf0540000  ! 3242: LDSH_R	ldsh	[%r16 + %r0], %r24
	.word 0xb950c000  ! 3247: RDPR_TT	<illegal instruction>
	.word 0xf615c000  ! 3248: LDUH_R	lduh	[%r23 + %r0], %r27
	setx	0x2003c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xff1cc000  ! 3250: LDDF_R	ldd	[%r19, %r0], %f31
	.word 0xf245607a  ! 3253: LDSW_I	ldsw	[%r21 + 0x007a], %r25
	.word 0xb9504000  ! 3255: RDPR_TNPC	<illegal instruction>
	.word 0xbd518000  ! 3256: RDPR_PSTATE	<illegal instruction>
	setx	0x2003d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10113, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10333, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf41ce18e  ! 3271: LDD_I	ldd	[%r19 + 0x018e], %r26
	setx	data_start_3, %g1, %r18
	.word 0xfc0c215c  ! 3276: LDUB_I	ldub	[%r16 + 0x015c], %r30
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb4058000  ! 3281: ADD_R	add 	%r22, %r0, %r26
	.word 0xfa5d8000  ! 3284: LDX_R	ldx	[%r22 + %r0], %r29
	.word 0xf6550000  ! 3287: LDSH_R	ldsh	[%r20 + %r0], %r27
	.word 0xfa058000  ! 3288: LDUW_R	lduw	[%r22 + %r0], %r29
	.word 0x8194e0f9  ! 3289: WRPR_TPC_I	wrpr	%r19, 0x00f9, %tpc
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfe5de0a5  ! 3291: LDX_I	ldx	[%r23 + 0x00a5], %r31
	.word 0x9195a007  ! 3292: WRPR_PIL_I	wrpr	%r22, 0x0007, %pil
	.word 0xbd518000  ! 3293: RDPR_PSTATE	<illegal instruction>
	setx	0x10217, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf81d8000  ! 3300: LDD_R	ldd	[%r22 + %r0], %r28
	.word 0xf60d8000  ! 3302: LDUB_R	ldub	[%r22 + %r0], %r27
	.word 0xf21da089  ! 3304: LDD_I	ldd	[%r22 + 0x0089], %r25
	.word 0xf84d8000  ! 3305: LDSB_R	ldsb	[%r22 + %r0], %r28
	.word 0x81956110  ! 3306: WRPR_TPC_I	wrpr	%r21, 0x0110, %tpc
	.word 0xf215a032  ! 3309: LDUH_I	lduh	[%r22 + 0x0032], %r25
	.word 0xfd1da105  ! 3311: LDDF_I	ldd	[%r22, 0x0105], %f30
	.word 0xb8b54000  ! 3312: SUBCcc_R	orncc 	%r21, %r0, %r28
	.word 0xba1c4000  ! 3313: XOR_R	xor 	%r17, %r0, %r29
	.word 0xfe04e023  ! 3314: LDUW_I	lduw	[%r19 + 0x0023], %r31
	.word 0xfd1ce00a  ! 3315: LDDF_I	ldd	[%r19, 0x000a], %f30
	.word 0xb225a0b2  ! 3323: SUB_I	sub 	%r22, 0x00b2, %r25
	.word 0x8194a184  ! 3324: WRPR_TPC_I	wrpr	%r18, 0x0184, %tpc
	.word 0x899520bf  ! 3325: WRPR_TICK_I	wrpr	%r20, 0x00bf, %tick
	.word 0xfc1c0000  ! 3330: LDD_R	ldd	[%r16 + %r0], %r30
	.word 0xf8558000  ! 3334: LDSH_R	ldsh	[%r22 + %r0], %r28
	.word 0xfe554000  ! 3336: LDSH_R	ldsh	[%r21 + %r0], %r31
	.word 0xb7508000  ! 3338: RDPR_TSTATE	<illegal instruction>
	.word 0x9195e129  ! 3342: WRPR_PIL_I	wrpr	%r23, 0x0129, %pil
	.word 0xfa44c000  ! 3344: LDSW_R	ldsw	[%r19 + %r0], %r29
	.word 0xf61d0000  ! 3345: LDD_R	ldd	[%r20 + %r0], %r27
	.word 0xfe5c0000  ! 3349: LDX_R	ldx	[%r16 + %r0], %r31
	.word 0xf805e1e6  ! 3350: LDUW_I	lduw	[%r23 + 0x01e6], %r28
	.word 0xf85cc000  ! 3353: LDX_R	ldx	[%r19 + %r0], %r28
	.word 0xb550c000  ! 3356: RDPR_TT	<illegal instruction>
	.word 0xfb1ca0fe  ! 3358: LDDF_I	ldd	[%r18, 0x00fe], %f29
	.word 0xf01c0000  ! 3359: LDD_R	ldd	[%r16 + %r0], %r24
	.word 0xf8448000  ! 3360: LDSW_R	ldsw	[%r18 + %r0], %r28
	.word 0xf405c000  ! 3364: LDUW_R	lduw	[%r23 + %r0], %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf2150000  ! 3367: LDUH_R	lduh	[%r20 + %r0], %r25
	.word 0xf11cc000  ! 3369: LDDF_R	ldd	[%r19, %r0], %f24
	.word 0xb7643801  ! 3370: MOVcc_I	<illegal instruction>
	.word 0xfa0de084  ! 3374: LDUB_I	ldub	[%r23 + 0x0084], %r29
	.word 0xfe5cc000  ! 3376: LDX_R	ldx	[%r19 + %r0], %r31
	setx	0x3011a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa4cc000  ! 3387: LDSB_R	ldsb	[%r19 + %r0], %r29
	.word 0xf84da0bd  ! 3394: LDSB_I	ldsb	[%r22 + 0x00bd], %r28
	.word 0xfa148000  ! 3398: LDUH_R	lduh	[%r18 + %r0], %r29
	.word 0xf6544000  ! 3400: LDSH_R	ldsh	[%r17 + %r0], %r27
	.word 0xf05421e0  ! 3403: LDSH_I	ldsh	[%r16 + 0x01e0], %r24
	setx	0x2010b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf654213c  ! 3410: LDSH_I	ldsh	[%r16 + 0x013c], %r27
	.word 0xf2550000  ! 3411: LDSH_R	ldsh	[%r20 + %r0], %r25
	.word 0xff1da1a5  ! 3422: LDDF_I	ldd	[%r22, 0x01a5], %f31
	.word 0xf21dc000  ! 3425: LDD_R	ldd	[%r23 + %r0], %r25
	.word 0xb0840000  ! 3426: ADDcc_R	addcc 	%r16, %r0, %r24
	.word 0xfa0ce14d  ! 3427: LDUB_I	ldub	[%r19 + 0x014d], %r29
	.word 0xfa5c8000  ! 3428: LDX_R	ldx	[%r18 + %r0], %r29
	.word 0xfe5d0000  ! 3432: LDX_R	ldx	[%r20 + %r0], %r31
	.word 0xb1520000  ! 3439: RDPR_PIL	<illegal instruction>
	.word 0xf04cc000  ! 3444: LDSB_R	ldsb	[%r19 + %r0], %r24
	setx	data_start_2, %g1, %r19
	.word 0xfe0d4000  ! 3449: LDUB_R	ldub	[%r21 + %r0], %r31
	ta	T_CHANGE_HPRIV
	.word 0x819839d1  ! 3450: WRHPR_HPSTATE_I	wrhpr	%r0, 0x19d1, %hpstate
	.word 0xfa558000  ! 3453: LDSH_R	ldsh	[%r22 + %r0], %r29
	setx	0x124, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf6144000  ! 3457: LDUH_R	lduh	[%r17 + %r0], %r27
	.word 0xfe45e07c  ! 3458: LDSW_I	ldsw	[%r23 + 0x007c], %r31
	.word 0xb1518000  ! 3459: RDPR_PSTATE	<illegal instruction>
	.word 0xbcc4c000  ! 3462: ADDCcc_R	addccc 	%r19, %r0, %r30
	.word 0xba9c2071  ! 3463: XORcc_I	xorcc 	%r16, 0x0071, %r29
	.word 0xf81ca0a3  ! 3465: LDD_I	ldd	[%r18 + 0x00a3], %r28
	.word 0xf0156047  ! 3466: LDUH_I	lduh	[%r21 + 0x0047], %r24
	setx	0x30229, %g1, %o0
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
	.word 0xf65c4000  ! 3476: LDX_R	ldx	[%r17 + %r0], %r27
	.word 0xbb518000  ! 3477: RDPR_PSTATE	<illegal instruction>
	.word 0x899421b8  ! 3481: WRPR_TICK_I	wrpr	%r16, 0x01b8, %tick
	.word 0xf84c8000  ! 3482: LDSB_R	ldsb	[%r18 + %r0], %r28
	.word 0xfa0da1f5  ! 3484: LDUB_I	ldub	[%r22 + 0x01f5], %r29
	.word 0xf64c8000  ! 3492: LDSB_R	ldsb	[%r18 + %r0], %r27
	.word 0xf51cc000  ! 3493: LDDF_R	ldd	[%r19, %r0], %f26
	.word 0xf05cc000  ! 3494: LDX_R	ldx	[%r19 + %r0], %r24
	.word 0xf804616b  ! 3495: LDUW_I	lduw	[%r17 + 0x016b], %r28
	ta	T_CHANGE_HPRIV
	.word 0x81982cc9  ! 3498: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cc9, %hpstate
	.word 0xfe0d4000  ! 3501: LDUB_R	ldub	[%r21 + %r0], %r31
	.word 0xfc04c000  ! 3502: LDUW_R	lduw	[%r19 + %r0], %r30
	.word 0xb2ac609d  ! 3503: ANDNcc_I	andncc 	%r17, 0x009d, %r25
	.word 0xf45461c1  ! 3504: LDSH_I	ldsh	[%r17 + 0x01c1], %r26
	.word 0xb3510000  ! 3505: RDPR_TICK	<illegal instruction>
	.word 0xf054a105  ! 3507: LDSH_I	ldsh	[%r18 + 0x0105], %r24
	.word 0xf00d0000  ! 3514: LDUB_R	ldub	[%r20 + %r0], %r24
	.word 0xf8158000  ! 3515: LDUH_R	lduh	[%r22 + %r0], %r28
	setx	data_start_3, %g1, %r21
	.word 0xfa544000  ! 3521: LDSH_R	ldsh	[%r17 + %r0], %r29
	.word 0xfc5d0000  ! 3523: LDX_R	ldx	[%r20 + %r0], %r30
	.word 0xf415e0a1  ! 3525: LDUH_I	lduh	[%r23 + 0x00a1], %r26
	setx	0x30007, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5518000  ! 3528: RDPR_PSTATE	<illegal instruction>
	setx	0x3031e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d9421e1  ! 3532: WRPR_PSTATE_I	wrpr	%r16, 0x01e1, %pstate
	.word 0xf415e174  ! 3537: LDUH_I	lduh	[%r23 + 0x0174], %r26
	.word 0xfe554000  ! 3538: LDSH_R	ldsh	[%r21 + %r0], %r31
	.word 0xbb510000  ! 3539: RDPR_TICK	<illegal instruction>
	.word 0xfa4c0000  ! 3543: LDSB_R	ldsb	[%r16 + %r0], %r29
	.word 0xbd50c000  ! 3544: RDPR_TT	<illegal instruction>
	.word 0x8794e123  ! 3547: WRPR_TT_I	wrpr	%r19, 0x0123, %tt
	.word 0xf6550000  ! 3548: LDSH_R	ldsh	[%r20 + %r0], %r27
	.word 0xbf540000  ! 3550: RDPR_GL	<illegal instruction>
	.word 0xfa1c2173  ! 3553: LDD_I	ldd	[%r16 + 0x0173], %r29
	.word 0xf8154000  ! 3554: LDUH_R	lduh	[%r21 + %r0], %r28
	.word 0xfa5c4000  ! 3557: LDX_R	ldx	[%r17 + %r0], %r29
	.word 0xf85de0ff  ! 3558: LDX_I	ldx	[%r23 + 0x00ff], %r28
	.word 0xf21561f0  ! 3559: LDUH_I	lduh	[%r21 + 0x01f0], %r25
	.word 0x8594e1c7  ! 3560: WRPR_TSTATE_I	wrpr	%r19, 0x01c7, %tstate
	.word 0xfa0d8000  ! 3561: LDUB_R	ldub	[%r22 + %r0], %r29
	.word 0xfc1cc000  ! 3563: LDD_R	ldd	[%r19 + %r0], %r30
	.word 0xf0048000  ! 3565: LDUW_R	lduw	[%r18 + %r0], %r24
	.word 0x83956193  ! 3567: WRPR_TNPC_I	wrpr	%r21, 0x0193, %tnpc
	mov	1, %r12
	.word 0x8f932000  ! 3568: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0x8595e1a4  ! 3570: WRPR_TSTATE_I	wrpr	%r23, 0x01a4, %tstate
	.word 0xb43d4000  ! 3572: XNOR_R	xnor 	%r21, %r0, %r26
	.word 0xf84d21a7  ! 3573: LDSB_I	ldsb	[%r20 + 0x01a7], %r28
	.word 0xb935d000  ! 3576: SRLX_R	srlx	%r23, %r0, %r28
	.word 0xf25ce013  ! 3577: LDX_I	ldx	[%r19 + 0x0013], %r25
	.word 0xfe0de1e0  ! 3582: LDUB_I	ldub	[%r23 + 0x01e0], %r31
	.word 0x8194a046  ! 3584: WRPR_TPC_I	wrpr	%r18, 0x0046, %tpc
	.word 0xf8454000  ! 3585: LDSW_R	ldsw	[%r21 + %r0], %r28
	.word 0xf80d0000  ! 3586: LDUB_R	ldub	[%r20 + %r0], %r28
	.word 0xb0148000  ! 3587: OR_R	or 	%r18, %r0, %r24
	.word 0xfc446078  ! 3589: LDSW_I	ldsw	[%r17 + 0x0078], %r30
	.word 0xb7340000  ! 3590: SRL_R	srl 	%r16, %r0, %r27
	.word 0xb7508000  ! 3591: RDPR_TSTATE	<illegal instruction>
	setx	0x1022a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8194e1e4  ! 3595: WRPR_TPC_I	wrpr	%r19, 0x01e4, %tpc
	.word 0xf24560fb  ! 3597: LDSW_I	ldsw	[%r21 + 0x00fb], %r25
	.word 0xf615c000  ! 3598: LDUH_R	lduh	[%r23 + %r0], %r27
	.word 0xb4ac2102  ! 3602: ANDNcc_I	andncc 	%r16, 0x0102, %r26
	.word 0x83952029  ! 3603: WRPR_TNPC_I	wrpr	%r20, 0x0029, %tnpc
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf814e03a  ! 3611: LDUH_I	lduh	[%r19 + 0x003a], %r28
	.word 0xf4154000  ! 3612: LDUH_R	lduh	[%r21 + %r0], %r26
	.word 0xb350c000  ! 3615: RDPR_TT	<illegal instruction>
	.word 0xfd1ca0fd  ! 3617: LDDF_I	ldd	[%r18, 0x00fd], %f30
	.word 0xfa1c2025  ! 3618: LDD_I	ldd	[%r16 + 0x0025], %r29
	.word 0xfe154000  ! 3623: LDUH_R	lduh	[%r21 + %r0], %r31
	mov	0, %r12
	.word 0x8f932000  ! 3625: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0x839561dd  ! 3626: WRPR_TNPC_I	wrpr	%r21, 0x01dd, %tnpc
	.word 0xbd520000  ! 3627: RDPR_PIL	<illegal instruction>
	setx	data_start_5, %g1, %r22
	.word 0x859521ac  ! 3633: WRPR_TSTATE_I	wrpr	%r20, 0x01ac, %tstate
	.word 0xf0156082  ! 3634: LDUH_I	lduh	[%r21 + 0x0082], %r24
	setx	data_start_0, %g1, %r18
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf84de1cd  ! 3643: LDSB_I	ldsb	[%r23 + 0x01cd], %r28
	.word 0xfe5c6011  ! 3644: LDX_I	ldx	[%r17 + 0x0011], %r31
	.word 0xfa4560b1  ! 3646: LDSW_I	ldsw	[%r21 + 0x00b1], %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf405e0dc  ! 3652: LDUW_I	lduw	[%r23 + 0x00dc], %r26
	.word 0xf654c000  ! 3658: LDSH_R	ldsh	[%r19 + %r0], %r27
	.word 0x8394e0d9  ! 3660: WRPR_TNPC_I	wrpr	%r19, 0x00d9, %tnpc
	setx	0x20121, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3500000  ! 3665: RDPR_TPC	<illegal instruction>
	setx	0x1012d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf204214e  ! 3670: LDUW_I	lduw	[%r16 + 0x014e], %r25
	.word 0xb825614a  ! 3672: SUB_I	sub 	%r21, 0x014a, %r28
	.word 0xf91c0000  ! 3674: LDDF_R	ldd	[%r16, %r0], %f28
	.word 0xb9510000  ! 3676: RDPR_TICK	<illegal instruction>
	.word 0xfd1d0000  ! 3677: LDDF_R	ldd	[%r20, %r0], %f30
	.word 0xf45c2182  ! 3678: LDX_I	ldx	[%r16 + 0x0182], %r26
	.word 0xbc84c000  ! 3681: ADDcc_R	addcc 	%r19, %r0, %r30
	setx	0x2010a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc44c000  ! 3683: LDSW_R	ldsw	[%r19 + %r0], %r30
	.word 0xf815614f  ! 3684: LDUH_I	lduh	[%r21 + 0x014f], %r28
	setx	0x10013, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d94e18f  ! 3692: WRPR_PSTATE_I	wrpr	%r19, 0x018f, %pstate
	.word 0xf44c0000  ! 3693: LDSB_R	ldsb	[%r16 + %r0], %r26
	.word 0xf60521ca  ! 3695: LDUW_I	lduw	[%r20 + 0x01ca], %r27
	setx	0x20112, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc4de098  ! 3697: LDSB_I	ldsb	[%r23 + 0x0098], %r30
	.word 0x8995211e  ! 3701: WRPR_TICK_I	wrpr	%r20, 0x011e, %tick
	.word 0xfe5d60d3  ! 3702: LDX_I	ldx	[%r21 + 0x00d3], %r31
	setx	data_start_5, %g1, %r22
	.word 0xf64cc000  ! 3705: LDSB_R	ldsb	[%r19 + %r0], %r27
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	setx	0x30318, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf91cc000  ! 3711: LDDF_R	ldd	[%r19, %r0], %f28
	.word 0x9195e05a  ! 3712: WRPR_PIL_I	wrpr	%r23, 0x005a, %pil
	ta	T_CHANGE_HPRIV
	.word 0x819828db  ! 3713: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08db, %hpstate
	.word 0xf05c2169  ! 3714: LDX_I	ldx	[%r16 + 0x0169], %r24
	.word 0xfe554000  ! 3716: LDSH_R	ldsh	[%r21 + %r0], %r31
	.word 0xbe1d8000  ! 3717: XOR_R	xor 	%r22, %r0, %r31
	setx	0x20025, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf85ca1c4  ! 3724: LDX_I	ldx	[%r18 + 0x01c4], %r28
	.word 0xf45d0000  ! 3728: LDX_R	ldx	[%r20 + %r0], %r26
	.word 0xbf352001  ! 3731: SRL_I	srl 	%r20, 0x0001, %r31
	.word 0xf01c2074  ! 3732: LDD_I	ldd	[%r16 + 0x0074], %r24
	.word 0xf245c000  ! 3733: LDSW_R	ldsw	[%r23 + %r0], %r25
	setx	data_start_7, %g1, %r16
	.word 0x8595e182  ! 3737: WRPR_TSTATE_I	wrpr	%r23, 0x0182, %tstate
	.word 0xb8240000  ! 3738: SUB_R	sub 	%r16, %r0, %r28
	.word 0xb1520000  ! 3739: RDPR_PIL	<illegal instruction>
	.word 0xb0bde04c  ! 3740: XNORcc_I	xnorcc 	%r23, 0x004c, %r24
	.word 0xf21d603d  ! 3741: LDD_I	ldd	[%r21 + 0x003d], %r25
	setx	0x1011a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9520000  ! 3744: RDPR_PIL	<illegal instruction>
	.word 0xf61ca143  ! 3747: LDD_I	ldd	[%r18 + 0x0143], %r27
	.word 0xf044203f  ! 3748: LDSW_I	ldsw	[%r16 + 0x003f], %r24
	.word 0xf65460de  ! 3750: LDSH_I	ldsh	[%r17 + 0x00de], %r27
	.word 0xf91c8000  ! 3752: LDDF_R	ldd	[%r18, %r0], %f28
	.word 0x9195e10b  ! 3754: WRPR_PIL_I	wrpr	%r23, 0x010b, %pil
	setx	0x10029, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc148000  ! 3759: LDUH_R	lduh	[%r18 + %r0], %r30
	.word 0xf045e016  ! 3773: LDSW_I	ldsw	[%r23 + 0x0016], %r24
	.word 0xbe3da1b9  ! 3778: XNOR_I	xnor 	%r22, 0x01b9, %r31
	.word 0xf24c0000  ! 3781: LDSB_R	ldsb	[%r16 + %r0], %r25
	.word 0x8994e1b8  ! 3783: WRPR_TICK_I	wrpr	%r19, 0x01b8, %tick
	.word 0xb3520000  ! 3784: RDPR_PIL	<illegal instruction>
	setx	0x3c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf40521d2  ! 3790: LDUW_I	lduw	[%r20 + 0x01d2], %r26
	.word 0xfc058000  ! 3791: LDUW_R	lduw	[%r22 + %r0], %r30
	.word 0xbf518000  ! 3792: RDPR_PSTATE	<illegal instruction>
	.word 0xf01d8000  ! 3794: LDD_R	ldd	[%r22 + %r0], %r24
	setx	0x1d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa050000  ! 3802: LDUW_R	lduw	[%r20 + %r0], %r29
	.word 0xf2144000  ! 3805: LDUH_R	lduh	[%r17 + %r0], %r25
	.word 0xf44c4000  ! 3806: LDSB_R	ldsb	[%r17 + %r0], %r26
	.word 0xb751c000  ! 3809: RDPR_TL	<illegal instruction>
	.word 0xb0a58000  ! 3813: SUBcc_R	subcc 	%r22, %r0, %r24
	.word 0xf20ce0c5  ! 3815: LDUB_I	ldub	[%r19 + 0x00c5], %r25
	.word 0xbd2d6001  ! 3818: SLL_I	sll 	%r21, 0x0001, %r30
	.word 0xb9500000  ! 3820: RDPR_TPC	<illegal instruction>
	.word 0xfe544000  ! 3821: LDSH_R	ldsh	[%r17 + %r0], %r31
	.word 0xf6450000  ! 3824: LDSW_R	ldsw	[%r20 + %r0], %r27
	.word 0xbd508000  ! 3826: RDPR_TSTATE	<illegal instruction>
	.word 0xf615c000  ! 3827: LDUH_R	lduh	[%r23 + %r0], %r27
	.word 0xf11da1e6  ! 3833: LDDF_I	ldd	[%r22, 0x01e6], %f24
	.word 0xfe0ca10b  ! 3836: LDUB_I	ldub	[%r18 + 0x010b], %r31
	.word 0xfe1cc000  ! 3840: LDD_R	ldd	[%r19 + %r0], %r31
	setx	data_start_4, %g1, %r17
	setx	data_start_2, %g1, %r23
	.word 0xfc0c2020  ! 3847: LDUB_I	ldub	[%r16 + 0x0020], %r30
	.word 0xf605e0f2  ! 3849: LDUW_I	lduw	[%r23 + 0x00f2], %r27
	.word 0xf655212e  ! 3850: LDSH_I	ldsh	[%r20 + 0x012e], %r27
	setx	0x20201, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe15e1b5  ! 3853: LDUH_I	lduh	[%r23 + 0x01b5], %r31
	.word 0xfe4ce162  ! 3854: LDSB_I	ldsb	[%r19 + 0x0162], %r31
	.word 0xbec4c000  ! 3864: ADDCcc_R	addccc 	%r19, %r0, %r31
	setx	0x20230, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf81cc000  ! 3869: LDD_R	ldd	[%r19 + %r0], %r28
	.word 0x8394e0b5  ! 3876: WRPR_TNPC_I	wrpr	%r19, 0x00b5, %tnpc
	setx	0x20309, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb20c609d  ! 3878: AND_I	and 	%r17, 0x009d, %r25
	.word 0x9195a0cf  ! 3881: WRPR_PIL_I	wrpr	%r22, 0x00cf, %pil
	.word 0xfa0de05b  ! 3883: LDUB_I	ldub	[%r23 + 0x005b], %r29
	.word 0xf2558000  ! 3885: LDSH_R	ldsh	[%r22 + %r0], %r25
	.word 0xb29520f1  ! 3890: ORcc_I	orcc 	%r20, 0x00f1, %r25
	.word 0xf214c000  ! 3893: LDUH_R	lduh	[%r19 + %r0], %r25
	.word 0xf51c6072  ! 3894: LDDF_I	ldd	[%r17, 0x0072], %f26
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbf3c8000  ! 3906: SRA_R	sra 	%r18, %r0, %r31
	mov	1, %r14
	.word 0xa193a000  ! 3909: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf4158000  ! 3910: LDUH_R	lduh	[%r22 + %r0], %r26
	setx	data_start_5, %g1, %r20
	.word 0xfa15e0d9  ! 3913: LDUH_I	lduh	[%r23 + 0x00d9], %r29
	setx	0x17, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	1, %r14
	.word 0xa193a000  ! 3919: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0x8794e01d  ! 3921: WRPR_TT_I	wrpr	%r19, 0x001d, %tt
	.word 0xb3510000  ! 3927: RDPR_TICK	<illegal instruction>
	.word 0xfe0c8000  ! 3933: LDUB_R	ldub	[%r18 + %r0], %r31
	.word 0xf8450000  ! 3935: LDSW_R	ldsw	[%r20 + %r0], %r28
	.word 0xfc0d0000  ! 3939: LDUB_R	ldub	[%r20 + %r0], %r30
	.word 0x8795a174  ! 3942: WRPR_TT_I	wrpr	%r22, 0x0174, %tt
	.word 0xf4142163  ! 3944: LDUH_I	lduh	[%r16 + 0x0163], %r26
	.word 0xf4454000  ! 3945: LDSW_R	ldsw	[%r21 + %r0], %r26
	setx	0x106, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe5c6172  ! 3952: LDX_I	ldx	[%r17 + 0x0172], %r31
	.word 0xf04de0d0  ! 3953: LDSB_I	ldsb	[%r23 + 0x00d0], %r24
	.word 0xb351c000  ! 3954: RDPR_TL	<illegal instruction>
	.word 0x8594205a  ! 3955: WRPR_TSTATE_I	wrpr	%r16, 0x005a, %tstate
	.word 0xf61dc000  ! 3959: LDD_R	ldd	[%r23 + %r0], %r27
	.word 0xbf500000  ! 3961: RDPR_TPC	<illegal instruction>
	.word 0x859520f9  ! 3963: WRPR_TSTATE_I	wrpr	%r20, 0x00f9, %tstate
	setx	0x10021, %g1, %o0
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
	.word 0xf8446009  ! 3974: LDSW_I	ldsw	[%r17 + 0x0009], %r28
	.word 0xb950c000  ! 3976: RDPR_TT	<illegal instruction>
	.word 0xfc5de1b5  ! 3977: LDX_I	ldx	[%r23 + 0x01b5], %r30
	.word 0xf24d8000  ! 3979: LDSB_R	ldsb	[%r22 + %r0], %r25
	.word 0xf84de1a8  ! 3980: LDSB_I	ldsb	[%r23 + 0x01a8], %r28
	.word 0xb5508000  ! 3982: RDPR_TSTATE	<illegal instruction>
	.word 0xf45c6131  ! 3987: LDX_I	ldx	[%r17 + 0x0131], %r26
	.word 0xbc3d4000  ! 3989: XNOR_R	xnor 	%r21, %r0, %r30
	.word 0xf05ce031  ! 3996: LDX_I	ldx	[%r19 + 0x0031], %r24
	.word 0xf40c0000  ! 3997: LDUB_R	ldub	[%r16 + %r0], %r26
	setx	0x13b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf21420f7  ! 4006: LDUH_I	lduh	[%r16 + 0x00f7], %r25
	ta	T_CHANGE_HPRIV
	.word 0x81982ecb  ! 4008: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ecb, %hpstate
	setx	0x10030, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf05cc000  ! 4012: LDX_R	ldx	[%r19 + %r0], %r24
	.word 0xfc04e0bc  ! 4014: LDUW_I	lduw	[%r19 + 0x00bc], %r30
	.word 0xfa548000  ! 4015: LDSH_R	ldsh	[%r18 + %r0], %r29
	.word 0x8795216b  ! 4018: WRPR_TT_I	wrpr	%r20, 0x016b, %tt
	.word 0xf25d21ec  ! 4019: LDX_I	ldx	[%r20 + 0x01ec], %r25
	setx	data_start_6, %g1, %r23
	setx	0xc, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20027, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf20c61fd  ! 4025: LDUB_I	ldub	[%r17 + 0x01fd], %r25
	ta	T_CHANGE_HPRIV
	.word 0x81983d41  ! 4027: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d41, %hpstate
	.word 0xb0ad8000  ! 4028: ANDNcc_R	andncc 	%r22, %r0, %r24
	setx	0x30327, %g1, %o0
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
	.word 0xb7500000  ! 4035: RDPR_TPC	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81982ed1  ! 4036: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ed1, %hpstate
	setx	0x10306, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1500000  ! 4041: RDPR_TPC	<illegal instruction>
	.word 0xfe450000  ! 4042: LDSW_R	ldsw	[%r20 + %r0], %r31
	.word 0xb20dc000  ! 4044: AND_R	and 	%r23, %r0, %r25
	.word 0xfa4c207c  ! 4054: LDSB_I	ldsb	[%r16 + 0x007c], %r29
	.word 0xb7510000  ! 4055: RDPR_TICK	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81983819  ! 4057: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1819, %hpstate
	.word 0xf51c4000  ! 4064: LDDF_R	ldd	[%r17, %r0], %f26
	.word 0xf65ce0f6  ! 4069: LDX_I	ldx	[%r19 + 0x00f6], %r27
	.word 0xf045e194  ! 4071: LDSW_I	ldsw	[%r23 + 0x0194], %r24
	.word 0xfc1d20c7  ! 4072: LDD_I	ldd	[%r20 + 0x00c7], %r30
	setx	data_start_0, %g1, %r18
	.word 0xbb520000  ! 4076: RDPR_PIL	<illegal instruction>
	.word 0xfe448000  ! 4078: LDSW_R	ldsw	[%r18 + %r0], %r31
	.word 0xf654a100  ! 4083: LDSH_I	ldsh	[%r18 + 0x0100], %r27
	setx	0x20218, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf01c2175  ! 4087: LDD_I	ldd	[%r16 + 0x0175], %r24
	.word 0xf61460b3  ! 4089: LDUH_I	lduh	[%r17 + 0x00b3], %r27
	.word 0xfa5d4000  ! 4090: LDX_R	ldx	[%r21 + %r0], %r29
	.word 0xf65c8000  ! 4092: LDX_R	ldx	[%r18 + %r0], %r27
	setx	0x30312, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf0540000  ! 4100: LDSH_R	ldsh	[%r16 + %r0], %r24
	.word 0xf65d61c9  ! 4106: LDX_I	ldx	[%r21 + 0x01c9], %r27
	.word 0xf41521d6  ! 4107: LDUH_I	lduh	[%r20 + 0x01d6], %r26
	.word 0xbf510000  ! 4109: RDPR_TICK	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81982fd9  ! 4112: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fd9, %hpstate
	.word 0xf4448000  ! 4114: LDSW_R	ldsw	[%r18 + %r0], %r26
	.word 0xf40da096  ! 4117: LDUB_I	ldub	[%r22 + 0x0096], %r26
	.word 0xf0142016  ! 4118: LDUH_I	lduh	[%r16 + 0x0016], %r24
	.word 0xb7500000  ! 4119: RDPR_TPC	<illegal instruction>
	.word 0xf4558000  ! 4124: LDSH_R	ldsh	[%r22 + %r0], %r26
	setx	0x30116, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa1dc000  ! 4129: LDD_R	ldd	[%r23 + %r0], %r29
	.word 0xf25c0000  ! 4131: LDX_R	ldx	[%r16 + %r0], %r25
	.word 0xfe0cc000  ! 4132: LDUB_R	ldub	[%r19 + %r0], %r31
	.word 0xf44561ed  ! 4144: LDSW_I	ldsw	[%r21 + 0x01ed], %r26
	.word 0xf84da0b2  ! 4150: LDSB_I	ldsb	[%r22 + 0x00b2], %r28
	.word 0xf0450000  ! 4151: LDSW_R	ldsw	[%r20 + %r0], %r24
	mov	2, %r12
	.word 0x8f932000  ! 4153: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xfe5d4000  ! 4155: LDX_R	ldx	[%r21 + %r0], %r31
	mov	0, %r12
	.word 0x8f932000  ! 4157: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	0x217, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81983c99  ! 4160: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c99, %hpstate
	setx	0x22c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x85946116  ! 4165: WRPR_TSTATE_I	wrpr	%r17, 0x0116, %tstate
	ta	T_CHANGE_HPRIV
	.word 0x81982a93  ! 4167: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a93, %hpstate
	.word 0xb5510000  ! 4168: RDPR_TICK	<illegal instruction>
	.word 0x85956185  ! 4170: WRPR_TSTATE_I	wrpr	%r21, 0x0185, %tstate
	ta	T_CHANGE_HPRIV
	.word 0x81983811  ! 4171: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1811, %hpstate
	setx	0x20025, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb0c5e0d7  ! 4174: ADDCcc_I	addccc 	%r23, 0x00d7, %r24
	.word 0xf01c0000  ! 4176: LDD_R	ldd	[%r16 + %r0], %r24
	setx	0x21b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc5c61f4  ! 4181: LDX_I	ldx	[%r17 + 0x01f4], %r30
	.word 0xbf480000  ! 4185: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xf44c4000  ! 4186: LDSB_R	ldsb	[%r17 + %r0], %r26
	.word 0xf0150000  ! 4187: LDUH_R	lduh	[%r20 + %r0], %r24
	.word 0xb0bde05a  ! 4191: XNORcc_I	xnorcc 	%r23, 0x005a, %r24
	.word 0xbd3da001  ! 4192: SRA_I	sra 	%r22, 0x0001, %r30
	.word 0xf61da010  ! 4193: LDD_I	ldd	[%r22 + 0x0010], %r27
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbcac0000  ! 4197: ANDNcc_R	andncc 	%r16, %r0, %r30
	setx	0x2f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc144000  ! 4203: LDUH_R	lduh	[%r17 + %r0], %r30
	.word 0xf8448000  ! 4204: LDSW_R	ldsw	[%r18 + %r0], %r28
	setx	data_start_5, %g1, %r20
	setx	data_start_0, %g1, %r16
	.word 0xfc1da01a  ! 4214: LDD_I	ldd	[%r22 + 0x001a], %r30
	.word 0xbb480000  ! 4218: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xf65cc000  ! 4219: LDX_R	ldx	[%r19 + %r0], %r27
	.word 0xb1540000  ! 4221: RDPR_GL	<illegal instruction>
	.word 0xb751c000  ! 4225: RDPR_TL	<illegal instruction>
	setx	0x339, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfd1de150  ! 4227: LDDF_I	ldd	[%r23, 0x0150], %f30
	.word 0x8794a1e4  ! 4229: WRPR_TT_I	wrpr	%r18, 0x01e4, %tt
	setx	0xa, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb34e001  ! 4236: SRL_I	srl 	%r19, 0x0001, %r29
	setx	0x30130, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb40da105  ! 4238: AND_I	and 	%r22, 0x0105, %r26
	.word 0xfa144000  ! 4240: LDUH_R	lduh	[%r17 + %r0], %r29
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xfe54e006  ! 4251: LDSH_I	ldsh	[%r19 + 0x0006], %r31
	.word 0xbf51c000  ! 4252: RDPR_TL	<illegal instruction>
	.word 0xb1518000  ! 4253: RDPR_PSTATE	<illegal instruction>
	.word 0xf454a1fd  ! 4254: LDSH_I	ldsh	[%r18 + 0x01fd], %r26
	.word 0xf00d2034  ! 4255: LDUB_I	ldub	[%r20 + 0x0034], %r24
	.word 0xfa558000  ! 4256: LDSH_R	ldsh	[%r22 + %r0], %r29
	setx	0x20338, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa4dc000  ! 4264: LDSB_R	ldsb	[%r23 + %r0], %r29
	.word 0xf4446001  ! 4267: LDSW_I	ldsw	[%r17 + 0x0001], %r26
	.word 0xfa4d0000  ! 4273: LDSB_R	ldsb	[%r20 + %r0], %r29
	.word 0xf00cc000  ! 4274: LDUB_R	ldub	[%r19 + %r0], %r24
	setx	data_start_1, %g1, %r19
	setx	0x20006, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5504000  ! 4293: RDPR_TNPC	<illegal instruction>
	.word 0xf45461ce  ! 4295: LDSH_I	ldsh	[%r17 + 0x01ce], %r26
	.word 0x8394e090  ! 4298: WRPR_TNPC_I	wrpr	%r19, 0x0090, %tnpc
	.word 0xf84560a7  ! 4299: LDSW_I	ldsw	[%r21 + 0x00a7], %r28
	setx	0x1003f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb350c000  ! 4304: RDPR_TT	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf845a160  ! 4310: LDSW_I	ldsw	[%r22 + 0x0160], %r28
	.word 0xf25dc000  ! 4311: LDX_R	ldx	[%r23 + %r0], %r25
	.word 0xf6042121  ! 4315: LDUW_I	lduw	[%r16 + 0x0121], %r27
	.word 0xf4144000  ! 4316: LDUH_R	lduh	[%r17 + %r0], %r26
	.word 0xbf520000  ! 4317: RDPR_PIL	<illegal instruction>
	setx	0x30108, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf81da0c7  ! 4319: LDD_I	ldd	[%r22 + 0x00c7], %r28
	.word 0xfe45e1c3  ! 4320: LDSW_I	ldsw	[%r23 + 0x01c3], %r31
	.word 0xb9520000  ! 4322: RDPR_PIL	<illegal instruction>
	.word 0xb951c000  ! 4324: RDPR_TL	<illegal instruction>
	.word 0xf71d20ba  ! 4325: LDDF_I	ldd	[%r20, 0x00ba], %f27
	.word 0xf20c0000  ! 4327: LDUB_R	ldub	[%r16 + %r0], %r25
	.word 0xf25ce122  ! 4330: LDX_I	ldx	[%r19 + 0x0122], %r25
	.word 0xb7500000  ! 4331: RDPR_TPC	<illegal instruction>
	setx	0x10228, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf44c0000  ! 4341: LDSB_R	ldsb	[%r16 + %r0], %r26
	setx	data_start_1, %g1, %r21
	.word 0xf814e11d  ! 4346: LDUH_I	lduh	[%r19 + 0x011d], %r28
	.word 0xfc4c60e3  ! 4348: LDSB_I	ldsb	[%r17 + 0x00e3], %r30
	setx	0x10304, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf64d21b4  ! 4355: LDSB_I	ldsb	[%r20 + 0x01b4], %r27
	.word 0x9195e11c  ! 4356: WRPR_PIL_I	wrpr	%r23, 0x011c, %pil
	setx	0x3011c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb43d4000  ! 4369: XNOR_R	xnor 	%r21, %r0, %r26
	setx	0x10303, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf51d0000  ! 4377: LDDF_R	ldd	[%r20, %r0], %f26
	.word 0xf445e0fa  ! 4378: LDSW_I	ldsw	[%r23 + 0x00fa], %r26
	.word 0xfe558000  ! 4380: LDSH_R	ldsh	[%r22 + %r0], %r31
	.word 0xb3518000  ! 4385: RDPR_PSTATE	<illegal instruction>
	.word 0xfa5d8000  ! 4386: LDX_R	ldx	[%r22 + %r0], %r29
	.word 0xf41c8000  ! 4392: LDD_R	ldd	[%r18 + %r0], %r26
	.word 0xbc24c000  ! 4393: SUB_R	sub 	%r19, %r0, %r30
	.word 0xf00dc000  ! 4396: LDUB_R	ldub	[%r23 + %r0], %r24
	.word 0x919460b0  ! 4397: WRPR_PIL_I	wrpr	%r17, 0x00b0, %pil
	setx	data_start_4, %g1, %r16
	.word 0xfa4d60c4  ! 4399: LDSB_I	ldsb	[%r21 + 0x00c4], %r29
	.word 0xb551c000  ! 4400: RDPR_TL	<illegal instruction>
	.word 0xbd508000  ! 4401: RDPR_TSTATE	<illegal instruction>
	setx	0x3013f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf84cc000  ! 4406: LDSB_R	ldsb	[%r19 + %r0], %r28
	.word 0xb3500000  ! 4410: RDPR_TPC	<illegal instruction>
	.word 0x8394a026  ! 4413: WRPR_TNPC_I	wrpr	%r18, 0x0026, %tnpc
	.word 0xf8140000  ! 4414: LDUH_R	lduh	[%r16 + %r0], %r28
	.word 0xb7480000  ! 4417: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xfd1d8000  ! 4419: LDDF_R	ldd	[%r22, %r0], %f30
	.word 0xf005e0a5  ! 4422: LDUW_I	lduw	[%r23 + 0x00a5], %r24
	.word 0xf615e149  ! 4425: LDUH_I	lduh	[%r23 + 0x0149], %r27
	setx	0x20136, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc5c2135  ! 4430: LDX_I	ldx	[%r16 + 0x0135], %r30
	.word 0xfc45e0aa  ! 4433: LDSW_I	ldsw	[%r23 + 0x00aa], %r30
	setx	0x22c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30221, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf51ca0f8  ! 4440: LDDF_I	ldd	[%r18, 0x00f8], %f26
	.word 0x8994a06b  ! 4444: WRPR_TICK_I	wrpr	%r18, 0x006b, %tick
	ta	T_CHANGE_HPRIV
	.word 0x81983b99  ! 4445: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b99, %hpstate
	.word 0xf71dc000  ! 4446: LDDF_R	ldd	[%r23, %r0], %f27
	.word 0xf85d8000  ! 4448: LDX_R	ldx	[%r22 + %r0], %r28
	.word 0xf20dc000  ! 4449: LDUB_R	ldub	[%r23 + %r0], %r25
	setx	0x224, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf84d202a  ! 4453: LDSB_I	ldsb	[%r20 + 0x002a], %r28
	setx	0x126, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81982c11  ! 4457: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c11, %hpstate
	.word 0x87942168  ! 4460: WRPR_TT_I	wrpr	%r16, 0x0168, %tt
	.word 0xb7540000  ! 4463: RDPR_GL	<illegal instruction>
	.word 0xf6454000  ! 4464: LDSW_R	ldsw	[%r21 + %r0], %r27
	.word 0xb72c2001  ! 4465: SLL_I	sll 	%r16, 0x0001, %r27
	setx	0x223, %g1, %o0
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
	.word 0xbc450000  ! 4474: ADDC_R	addc 	%r20, %r0, %r30
	.word 0x8d95a052  ! 4477: WRPR_PSTATE_I	wrpr	%r22, 0x0052, %pstate
	.word 0xf00d8000  ! 4478: LDUB_R	ldub	[%r22 + %r0], %r24
	setx	0x3001a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf445c000  ! 4484: LDSW_R	ldsw	[%r23 + %r0], %r26
	setx	0x10206, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf05cc000  ! 4491: LDX_R	ldx	[%r19 + %r0], %r24
	.word 0xf24c0000  ! 4495: LDSB_R	ldsb	[%r16 + %r0], %r25
	.word 0xbcc40000  ! 4497: ADDCcc_R	addccc 	%r16, %r0, %r30
	.word 0x8394e0ae  ! 4499: WRPR_TNPC_I	wrpr	%r19, 0x00ae, %tnpc
	.word 0xba9d8000  ! 4500: XORcc_R	xorcc 	%r22, %r0, %r29
	.word 0xfc5de0fe  ! 4502: LDX_I	ldx	[%r23 + 0x00fe], %r30
	setx	0x10304, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf41c61c7  ! 4504: LDD_I	ldd	[%r17 + 0x01c7], %r26
	.word 0xf20c4000  ! 4505: LDUB_R	ldub	[%r17 + %r0], %r25
	.word 0x8994e1b4  ! 4510: WRPR_TICK_I	wrpr	%r19, 0x01b4, %tick
	.word 0xb550c000  ! 4511: RDPR_TT	<illegal instruction>
	.word 0xb77da401  ! 4513: MOVR_I	movre	%r22, 0x1, %r27
	.word 0xfc1d4000  ! 4514: LDD_R	ldd	[%r21 + %r0], %r30
	.word 0xbb641800  ! 4515: MOVcc_R	<illegal instruction>
	.word 0xb93d9000  ! 4516: SRAX_R	srax	%r22, %r0, %r28
	.word 0x8594a14d  ! 4519: WRPR_TSTATE_I	wrpr	%r18, 0x014d, %tstate
	.word 0xf6546067  ! 4520: LDSH_I	ldsh	[%r17 + 0x0067], %r27
	setx	0x20200, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8595a04d  ! 4523: WRPR_TSTATE_I	wrpr	%r22, 0x004d, %tstate
	.word 0xf44d8000  ! 4526: LDSB_R	ldsb	[%r22 + %r0], %r26
	.word 0xf455e0a8  ! 4529: LDSH_I	ldsh	[%r23 + 0x00a8], %r26
	.word 0xfe1c2057  ! 4533: LDD_I	ldd	[%r16 + 0x0057], %r31
	.word 0x89946113  ! 4535: WRPR_TICK_I	wrpr	%r17, 0x0113, %tick
	.word 0xf24cc000  ! 4537: LDSB_R	ldsb	[%r19 + %r0], %r25
	setx	0x20332, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf91de022  ! 4539: LDDF_I	ldd	[%r23, 0x0022], %f28
	.word 0xfc450000  ! 4541: LDSW_R	ldsw	[%r20 + %r0], %r30
	.word 0xf05d4000  ! 4542: LDX_R	ldx	[%r21 + %r0], %r24
	.word 0xf644a09b  ! 4543: LDSW_I	ldsw	[%r18 + 0x009b], %r27
	.word 0xfa5ca08d  ! 4545: LDX_I	ldx	[%r18 + 0x008d], %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	0x30030, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf604212c  ! 4555: LDUW_I	lduw	[%r16 + 0x012c], %r27
	.word 0xf01561f9  ! 4559: LDUH_I	lduh	[%r21 + 0x01f9], %r24
	setx	0x10111, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf4548000  ! 4562: LDSH_R	ldsh	[%r18 + %r0], %r26
	.word 0xf404611a  ! 4569: LDUW_I	lduw	[%r17 + 0x011a], %r26
	.word 0xbaada023  ! 4570: ANDNcc_I	andncc 	%r22, 0x0023, %r29
	setx	0x10038, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xba9c0000  ! 4575: XORcc_R	xorcc 	%r16, %r0, %r29
	.word 0xf6548000  ! 4579: LDSH_R	ldsh	[%r18 + %r0], %r27
	.word 0xfa45e053  ! 4582: LDSW_I	ldsw	[%r23 + 0x0053], %r29
	.word 0xf65d0000  ! 4585: LDX_R	ldx	[%r20 + %r0], %r27
	.word 0xf4050000  ! 4586: LDUW_R	lduw	[%r20 + %r0], %r26
	.word 0xf20d0000  ! 4596: LDUB_R	ldub	[%r20 + %r0], %r25
	.word 0xb5347001  ! 4597: SRLX_I	srlx	%r17, 0x0001, %r26
	setx	0x20106, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf04de1ae  ! 4607: LDSB_I	ldsb	[%r23 + 0x01ae], %r24
	.word 0xbf480000  ! 4608: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xfa1d611e  ! 4612: LDD_I	ldd	[%r21 + 0x011e], %r29
	.word 0xf04cc000  ! 4615: LDSB_R	ldsb	[%r19 + %r0], %r24
	setx	0x10031, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc154000  ! 4624: LDUH_R	lduh	[%r21 + %r0], %r30
	.word 0xf205e0d1  ! 4628: LDUW_I	lduw	[%r23 + 0x00d1], %r25
	.word 0xf4446032  ! 4630: LDSW_I	ldsw	[%r17 + 0x0032], %r26
	.word 0xbeb5a18c  ! 4631: ORNcc_I	orncc 	%r22, 0x018c, %r31
	.word 0xba946166  ! 4634: ORcc_I	orcc 	%r17, 0x0166, %r29
	.word 0xf71cc000  ! 4636: LDDF_R	ldd	[%r19, %r0], %f27
	.word 0xbd540000  ! 4637: RDPR_GL	<illegal instruction>
	.word 0xfa546198  ! 4640: LDSH_I	ldsh	[%r17 + 0x0198], %r29
	.word 0xfc1d0000  ! 4643: LDD_R	ldd	[%r20 + %r0], %r30
	.word 0xf85d4000  ! 4644: LDX_R	ldx	[%r21 + %r0], %r28
	.word 0xf00c4000  ! 4645: LDUB_R	ldub	[%r17 + %r0], %r24
	setx	0x2033d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf24c4000  ! 4648: LDSB_R	ldsb	[%r17 + %r0], %r25
	setx	0x30230, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfa0c60f9  ! 4655: LDUB_I	ldub	[%r17 + 0x00f9], %r29
	.word 0xb68c605e  ! 4657: ANDcc_I	andcc 	%r17, 0x005e, %r27
	.word 0xf244c000  ! 4660: LDSW_R	ldsw	[%r19 + %r0], %r25
	.word 0xf60d8000  ! 4662: LDUB_R	ldub	[%r22 + %r0], %r27
	setx	0x20107, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe5c8000  ! 4665: LDX_R	ldx	[%r18 + %r0], %r31
	.word 0xbf500000  ! 4667: RDPR_TPC	<illegal instruction>
	.word 0xf65d0000  ! 4669: LDX_R	ldx	[%r20 + %r0], %r27
	mov	0, %r14
	.word 0xa193a000  ! 4680: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbb350000  ! 4681: SRL_R	srl 	%r20, %r0, %r29
	.word 0xf245218a  ! 4682: LDSW_I	ldsw	[%r20 + 0x018a], %r25
	.word 0xb23cc000  ! 4684: XNOR_R	xnor 	%r19, %r0, %r25
	setx	0x2022a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf2140000  ! 4687: LDUH_R	lduh	[%r16 + %r0], %r25
	.word 0xbe140000  ! 4688: OR_R	or 	%r16, %r0, %r31
	.word 0xfa456107  ! 4690: LDSW_I	ldsw	[%r21 + 0x0107], %r29
	.word 0xbd508000  ! 4691: RDPR_TSTATE	<illegal instruction>
	.word 0xbf50c000  ! 4694: RDPR_TT	<illegal instruction>
	.word 0xbf540000  ! 4696: RDPR_GL	<illegal instruction>
	.word 0xff1d0000  ! 4698: LDDF_R	ldd	[%r20, %r0], %f31
	.word 0xf85ce129  ! 4699: LDX_I	ldx	[%r19 + 0x0129], %r28
	setx	0x30100, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf71ca15c  ! 4702: LDDF_I	ldd	[%r18, 0x015c], %f27
	setx	data_start_0, %g1, %r18
	.word 0xb750c000  ! 4708: RDPR_TT	<illegal instruction>
	.word 0xbb520000  ! 4712: RDPR_PIL	<illegal instruction>
	.word 0xfc1ce060  ! 4713: LDD_I	ldd	[%r19 + 0x0060], %r30
	.word 0xbb540000  ! 4715: RDPR_GL	<illegal instruction>
	.word 0xf615607a  ! 4720: LDUH_I	lduh	[%r21 + 0x007a], %r27
	.word 0xb8346152  ! 4724: SUBC_I	orn 	%r17, 0x0152, %r28
	.word 0xbc3c21cb  ! 4726: XNOR_I	xnor 	%r16, 0x01cb, %r30
	.word 0xbd520000  ! 4727: RDPR_PIL	<illegal instruction>
	setx	0x3033e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf85d0000  ! 4736: LDX_R	ldx	[%r20 + %r0], %r28
	.word 0x899560b6  ! 4738: WRPR_TICK_I	wrpr	%r21, 0x00b6, %tick
	setx	0x203, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf11c8000  ! 4744: LDDF_R	ldd	[%r18, %r0], %f24
	.word 0x819560c5  ! 4745: WRPR_TPC_I	wrpr	%r21, 0x00c5, %tpc
	.word 0x919421df  ! 4753: WRPR_PIL_I	wrpr	%r16, 0x01df, %pil
	.word 0xf71d4000  ! 4754: LDDF_R	ldd	[%r21, %r0], %f27
	.word 0xf2056170  ! 4757: LDUW_I	lduw	[%r21 + 0x0170], %r25
	.word 0xb8352139  ! 4758: SUBC_I	orn 	%r20, 0x0139, %r28
	setx	0x30214, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfc0ca18c  ! 4762: LDUB_I	ldub	[%r18 + 0x018c], %r30
	setx	0x30331, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xfe048000  ! 4769: LDUW_R	lduw	[%r18 + %r0], %r31
	.word 0xf8446083  ! 4770: LDSW_I	ldsw	[%r17 + 0x0083], %r28
	.word 0xf20d8000  ! 4772: LDUB_R	ldub	[%r22 + %r0], %r25
	mov	0, %r12
	.word 0x8f932000  ! 4782: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbd510000  ! 4788: RDPR_TICK	<illegal instruction>
	setx	data_start_4, %g1, %r23
	.word 0xf44de00a  ! 4796: LDSB_I	ldsb	[%r23 + 0x000a], %r26
	.word 0xbb641800  ! 4799: MOVcc_R	<illegal instruction>
	.word 0xfc0da008  ! 4801: LDUB_I	ldub	[%r22 + 0x0008], %r30
	.word 0xf11cc000  ! 4805: LDDF_R	ldd	[%r19, %r0], %f24
	.word 0xf454e13d  ! 4810: LDSH_I	ldsh	[%r19 + 0x013d], %r26
	.word 0xbb3d4000  ! 4812: SRA_R	sra 	%r21, %r0, %r29
	.word 0xbd510000  ! 4814: RDPR_TICK	<illegal instruction>
	setx	0x30225, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7508000  ! 4817: RDPR_TSTATE	<illegal instruction>
	.word 0x81952155  ! 4819: WRPR_TPC_I	wrpr	%r20, 0x0155, %tpc
	.word 0x8995a02c  ! 4820: WRPR_TICK_I	wrpr	%r22, 0x002c, %tick
	.word 0xb150c000  ! 4821: RDPR_TT	<illegal instruction>
	setx	0x31a, %g1, %o0
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
	.word 0xf85d0000  ! 4830: LDX_R	ldx	[%r20 + %r0], %r28
	.word 0x83942192  ! 4832: WRPR_TNPC_I	wrpr	%r16, 0x0192, %tnpc
	.word 0xf44dc000  ! 4834: LDSB_R	ldsb	[%r23 + %r0], %r26
	setx	data_start_3, %g1, %r18
	.word 0xfa540000  ! 4839: LDSH_R	ldsh	[%r16 + %r0], %r29
	.word 0xfe5c8000  ! 4840: LDX_R	ldx	[%r18 + %r0], %r31
	setx	0x10232, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf84d6140  ! 4849: LDSB_I	ldsb	[%r21 + 0x0140], %r28
	mov	2, %r14
	.word 0xa193a000  ! 4858: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb6950000  ! 4859: ORcc_R	orcc 	%r20, %r0, %r27
	.word 0xfa0ce0b6  ! 4865: LDUB_I	ldub	[%r19 + 0x00b6], %r29
	setx	0x30020, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xf71d8000  ! 4869: LDDF_R	ldd	[%r22, %r0], %f27
	.word 0xfc4c8000  ! 4870: LDSB_R	ldsb	[%r18 + %r0], %r30
	.word 0xb72c1000  ! 4871: SLLX_R	sllx	%r16, %r0, %r27
	.word 0xfe05c000  ! 4873: LDUW_R	lduw	[%r23 + %r0], %r31
	.word 0xb08ce034  ! 4874: ANDcc_I	andcc 	%r19, 0x0034, %r24
	.word 0xfe1d4000  ! 4876: LDD_R	ldd	[%r21 + %r0], %r31
	.word 0xbb500000  ! 4877: RDPR_TPC	<illegal instruction>
	.word 0xfa558000  ! 4879: LDSH_R	ldsh	[%r22 + %r0], %r29
	.word 0xf65c61f8  ! 4881: LDX_I	ldx	[%r17 + 0x01f8], %r27
	setx	0x10305, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x34, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30017, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r21
	.word 0x8395e1d3  ! 4892: WRPR_TNPC_I	wrpr	%r23, 0x01d3, %tnpc
	.word 0xb6bd8000  ! 4897: XNORcc_R	xnorcc 	%r22, %r0, %r27
	.word 0xb551c000  ! 4902: RDPR_TL	<illegal instruction>
	.word 0xf844e181  ! 4903: LDSW_I	ldsw	[%r19 + 0x0181], %r28
	.word 0x8794e194  ! 4907: WRPR_TT_I	wrpr	%r19, 0x0194, %tt
	.word 0xbd3c2001  ! 4908: SRA_I	sra 	%r16, 0x0001, %r30
	.word 0xf85c4000  ! 4911: LDX_R	ldx	[%r17 + %r0], %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfa14e156  ! 4914: LDUH_I	lduh	[%r19 + 0x0156], %r29
	.word 0xf04d60ce  ! 4915: LDSB_I	ldsb	[%r21 + 0x00ce], %r24
	ta	T_CHANGE_HPRIV
	.word 0x81983f4b  ! 4916: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f4b, %hpstate
	.word 0x839421ae  ! 4919: WRPR_TNPC_I	wrpr	%r16, 0x01ae, %tnpc
	.word 0xf615c000  ! 4920: LDUH_R	lduh	[%r23 + %r0], %r27
	.word 0xfa0ce120  ! 4921: LDUB_I	ldub	[%r19 + 0x0120], %r29
	.word 0xf2452050  ! 4923: LDSW_I	ldsw	[%r20 + 0x0050], %r25
	.word 0xf455a0e4  ! 4924: LDSH_I	ldsh	[%r22 + 0x00e4], %r26
	.word 0xf8148000  ! 4926: LDUH_R	lduh	[%r18 + %r0], %r28
	.word 0xbf3c6001  ! 4927: SRA_I	sra 	%r17, 0x0001, %r31
	.word 0xfe1c8000  ! 4928: LDD_R	ldd	[%r18 + %r0], %r31
	.word 0xb5520000  ! 4934: RDPR_PIL	<illegal instruction>
	setx	0x30215, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1480000  ! 4940: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xf204e097  ! 4944: LDUW_I	lduw	[%r19 + 0x0097], %r25
	setx	0x20312, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_7, %g1, %r22
	.word 0xfc15a026  ! 4951: LDUH_I	lduh	[%r22 + 0x0026], %r30
	.word 0xf4052151  ! 4955: LDUW_I	lduw	[%r20 + 0x0151], %r26
	.word 0xf91c4000  ! 4959: LDDF_R	ldd	[%r17, %r0], %f28
	.word 0xf214202e  ! 4965: LDUH_I	lduh	[%r16 + 0x002e], %r25
	.word 0xf855a1a1  ! 4966: LDSH_I	ldsh	[%r22 + 0x01a1], %r28
	mov	0, %r14
	.word 0xa193a000  ! 4971: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xf60da1a3  ! 4972: LDUB_I	ldub	[%r22 + 0x01a3], %r27
	.word 0xb7518000  ! 4973: RDPR_PSTATE	<illegal instruction>
	setx	data_start_0, %g1, %r23
	.word 0xb551c000  ! 4975: RDPR_TL	<illegal instruction>
	setx	0x2003e, %g1, %o0
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
	setx	0x220, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x212, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_4, %g1, %r22
	.word 0xf204a081  ! 4989: LDUW_I	lduw	[%r18 + 0x0081], %r25
	.word 0xf51ca10c  ! 4993: LDDF_I	ldd	[%r18, 0x010c], %f26
	.word 0xb63de15a  ! 4997: XNOR_I	xnor 	%r23, 0x015a, %r27
	.word 0xb6348000  ! 4998: SUBC_R	orn 	%r18, %r0, %r27
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	.word 0xb9a00560  ! 3: FSQRTq	fsqrt	
	.word 0xbc04209d  ! 10: ADD_I	add 	%r16, 0x009d, %r30
	.word 0xb9a98820  ! 13: FMOVNEG	fmovs	%fcc1, %f0, %f28
	.word 0xb3a448e0  ! 16: FSUBq	dis not found

	.word 0xb3a5c9a0  ! 19: FDIVs	fdivs	%f23, %f0, %f25
	.word 0xb3a90820  ! 22: FMOVLEU	fmovs	%fcc1, %f0, %f25
	.word 0x859461a9  ! 25: WRPR_TSTATE_I	wrpr	%r17, 0x01a9, %tstate
	.word 0xb37d0400  ! 31: MOVR_R	movre	%r20, %r0, %r25
	setx	0x31, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9a40940  ! 36: FMULd	fmuld	%f16, %f0, %f28
	.word 0xb1ab0820  ! 41: FMOVGU	fmovs	%fcc1, %f0, %f24
	.word 0xb7540000  ! 43: RDPR_GL	rdpr	%-, %r27
	.word 0xb9510000  ! 46: RDPR_TICK	<illegal instruction>
	mov	1, %r12
	.word 0x8f932000  ! 47: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb9a80820  ! 48: FMOVRLEZ	fmovs	%fcc1, %f0, %f28
	.word 0x8794a19c  ! 60: WRPR_TT_I	wrpr	%r18, 0x019c, %tt
	.word 0xb1a00560  ! 62: FSQRTq	fsqrt	
	.word 0xb7643801  ! 63: MOVcc_I	<illegal instruction>
	.word 0xb5a00020  ! 64: FMOVs	fmovs	%f0, %f26
	.word 0xbeb56092  ! 67: ORNcc_I	orncc 	%r21, 0x0092, %r31
	.word 0xbdab8820  ! 69: FMOVPOS	fmovs	%fcc1, %f0, %f30
	ta	T_CHANGE_HPRIV
	.word 0x81982b13  ! 72: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b13, %hpstate
	.word 0xbda48940  ! 73: FMULd	fmuld	%f18, %f0, %f30
	setx	data_start_1, %g1, %r22
	.word 0xb3aa4820  ! 78: FMOVNE	fmovs	%fcc1, %f0, %f25
	setx	0x339, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1ab8820  ! 82: FMOVPOS	fmovs	%fcc1, %f0, %f24
	setx	0x30226, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5a509a0  ! 84: FDIVs	fdivs	%f20, %f0, %f26
	.word 0xb3a00540  ! 86: FSQRTd	fsqrt	
	setx	0x23f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x919421ce  ! 90: WRPR_PIL_I	wrpr	%r16, 0x01ce, %pil
	.word 0xb1aac820  ! 91: FMOVGE	fmovs	%fcc1, %f0, %f24
	setx	0x30132, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb3cf001  ! 100: SRAX_I	srax	%r19, 0x0001, %r29
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbb50c000  ! 102: RDPR_TT	<illegal instruction>
	.word 0x8594a14a  ! 106: WRPR_TSTATE_I	wrpr	%r18, 0x014a, %tstate
	.word 0x8994a1cc  ! 107: WRPR_TICK_I	wrpr	%r18, 0x01cc, %tick
	.word 0xb5a00020  ! 110: FMOVs	fmovs	%f0, %f26
	.word 0xb6bc2113  ! 113: XNORcc_I	xnorcc 	%r16, 0x0113, %r27
	.word 0xb7aa0820  ! 114: FMOVA	fmovs	%fcc1, %f0, %f27
	.word 0xb4b5a111  ! 115: SUBCcc_I	orncc 	%r22, 0x0111, %r26
	.word 0xbc3d8000  ! 118: XNOR_R	xnor 	%r22, %r0, %r30
	mov	0, %r12
	.word 0x8f932000  ! 119: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0x8795e127  ! 123: WRPR_TT_I	wrpr	%r23, 0x0127, %tt
	.word 0xbd7cc400  ! 124: MOVR_R	movre	%r19, %r0, %r30
	.word 0xb3a00020  ! 126: FMOVs	fmovs	%f0, %f25
	.word 0xb3a508a0  ! 131: FSUBs	fsubs	%f20, %f0, %f25
	setx	0x314, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb494a11c  ! 135: ORcc_I	orcc 	%r18, 0x011c, %r26
	.word 0xb7500000  ! 137: RDPR_TPC	<illegal instruction>
	.word 0xbfa00020  ! 139: FMOVs	fmovs	%f0, %f31
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb551c000  ! 142: RDPR_TL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbba40940  ! 145: FMULd	fmuld	%f16, %f0, %f60
	.word 0xb5a9c820  ! 146: FMOVVS	fmovs	%fcc1, %f0, %f26
	.word 0xbda489c0  ! 147: FDIVd	fdivd	%f18, %f0, %f30
	.word 0xbbabc820  ! 148: FMOVVC	fmovs	%fcc1, %f0, %f29
	setx	0x2b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb508000  ! 151: RDPR_TSTATE	<illegal instruction>
	.word 0x8595e0c7  ! 154: WRPR_TSTATE_I	wrpr	%r23, 0x00c7, %tstate
	.word 0xbb3cb001  ! 155: SRAX_I	srax	%r18, 0x0001, %r29
	.word 0xb93d3001  ! 159: SRAX_I	srax	%r20, 0x0001, %r28
	ta	T_CHANGE_HPRIV
	.word 0x81982d09  ! 161: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d09, %hpstate
	.word 0xb1500000  ! 163: RDPR_TPC	<illegal instruction>
	.word 0xbda9c820  ! 168: FMOVVS	fmovs	%fcc1, %f0, %f30
	.word 0xbfab0820  ! 169: FMOVGU	fmovs	%fcc1, %f0, %f31
	.word 0x81946026  ! 175: WRPR_TPC_I	wrpr	%r17, 0x0026, %tpc
	setx	data_start_0, %g1, %r22
	.word 0xb350c000  ! 182: RDPR_TT	<illegal instruction>
	.word 0xb7ab4820  ! 184: FMOVCC	fmovs	%fcc1, %f0, %f27
	.word 0xb7a44960  ! 185: FMULq	dis not found

	.word 0xbda40960  ! 186: FMULq	dis not found

	.word 0xb9508000  ! 187: RDPR_TSTATE	<illegal instruction>
	.word 0xb73df001  ! 193: SRAX_I	srax	%r23, 0x0001, %r27
	.word 0xbba81c20  ! 194: FMOVRGEZ	dis not found

	.word 0xbfa94820  ! 197: FMOVCS	fmovs	%fcc1, %f0, %f31
	.word 0xb1a94820  ! 198: FMOVCS	fmovs	%fcc1, %f0, %f24
	.word 0xb3aa4820  ! 200: FMOVNE	fmovs	%fcc1, %f0, %f25
	.word 0xb3a00520  ! 202: FSQRTs	fsqrt	
	.word 0xb3641800  ! 204: MOVcc_R	<illegal instruction>
	.word 0xbfa488a0  ! 207: FSUBs	fsubs	%f18, %f0, %f31
	.word 0xbda80820  ! 208: FMOVRLEZ	fmovs	%fcc1, %f0, %f30
	.word 0xb3a588e0  ! 210: FSUBq	dis not found

	setx	0x3f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd520000  ! 217: RDPR_PIL	<illegal instruction>
	.word 0x8595a079  ! 218: WRPR_TSTATE_I	wrpr	%r22, 0x0079, %tstate
	.word 0x899520b8  ! 219: WRPR_TICK_I	wrpr	%r20, 0x00b8, %tick
	.word 0xb3a588c0  ! 221: FSUBd	fsubd	%f22, %f0, %f56
	.word 0xb751c000  ! 222: RDPR_TL	<illegal instruction>
	setx	0x10036, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1a5c8e0  ! 225: FSUBq	dis not found

	.word 0xbb504000  ! 226: RDPR_TNPC	<illegal instruction>
	.word 0xb7a98820  ! 227: FMOVNEG	fmovs	%fcc1, %f0, %f27
	.word 0xb1a80820  ! 230: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
	mov	0, %r12
	.word 0x8f932000  ! 231: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	data_start_1, %g1, %r16
	.word 0xb7a81c20  ! 235: FMOVRGEZ	dis not found

	setx	0x3002c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1aa0820  ! 238: FMOVA	fmovs	%fcc1, %f0, %f24
	setx	0x31c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb7dc400  ! 248: MOVR_R	movre	%r23, %r0, %r29
	.word 0x8994213e  ! 249: WRPR_TICK_I	wrpr	%r16, 0x013e, %tick
	.word 0xb1a81420  ! 251: FMOVRNZ	dis not found

	.word 0xb351c000  ! 252: RDPR_TL	<illegal instruction>
	.word 0xbda588c0  ! 253: FSUBd	fsubd	%f22, %f0, %f30
	.word 0xb1a5c8e0  ! 254: FSUBq	dis not found

	.word 0xbc0521d7  ! 255: ADD_I	add 	%r20, 0x01d7, %r30
	.word 0xbf540000  ! 256: RDPR_GL	<illegal instruction>
	setx	0x0, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7a58820  ! 260: FADDs	fadds	%f22, %f0, %f27
	.word 0xb1aa8820  ! 263: FMOVG	fmovs	%fcc1, %f0, %f24
	.word 0xbda8c820  ! 264: FMOVL	fmovs	%fcc1, %f0, %f30
	.word 0xb5a90820  ! 265: FMOVLEU	fmovs	%fcc1, %f0, %f26
	.word 0x8594214d  ! 266: WRPR_TSTATE_I	wrpr	%r16, 0x014d, %tstate
	.word 0xb551c000  ! 267: RDPR_TL	<illegal instruction>
	.word 0xb3a48860  ! 268: FADDq	dis not found

	.word 0x899560ce  ! 271: WRPR_TICK_I	wrpr	%r21, 0x00ce, %tick
	.word 0xbb518000  ! 277: RDPR_PSTATE	<illegal instruction>
	setx	data_start_4, %g1, %r22
	.word 0x81942193  ! 289: WRPR_TPC_I	wrpr	%r16, 0x0193, %tpc
	setx	data_start_5, %g1, %r22
	.word 0xbba48940  ! 294: FMULd	fmuld	%f18, %f0, %f60
	.word 0xbfa48920  ! 299: FMULs	fmuls	%f18, %f0, %f31
	.word 0xb5a81820  ! 300: FMOVRGZ	fmovs	%fcc3, %f0, %f26
	.word 0xb9ab4820  ! 310: FMOVCC	fmovs	%fcc1, %f0, %f28
	.word 0xbb50c000  ! 311: RDPR_TT	<illegal instruction>
	setx	data_start_4, %g1, %r20
	.word 0xb1a489c0  ! 321: FDIVd	fdivd	%f18, %f0, %f24
	.word 0xb5a81820  ! 322: FMOVRGZ	fmovs	%fcc3, %f0, %f26
	.word 0x85952147  ! 323: WRPR_TSTATE_I	wrpr	%r20, 0x0147, %tstate
	.word 0xb9510000  ! 329: RDPR_TICK	<illegal instruction>
	.word 0xb3a58960  ! 332: FMULq	dis not found

	.word 0xb1a50820  ! 337: FADDs	fadds	%f20, %f0, %f24
	.word 0xb88dc000  ! 341: ANDcc_R	andcc 	%r23, %r0, %r28
	.word 0xb7a80820  ! 347: FMOVN	fmovs	%fcc1, %f0, %f27
	.word 0x8595207d  ! 349: WRPR_TSTATE_I	wrpr	%r20, 0x007d, %tstate
	.word 0xb9a58820  ! 354: FADDs	fadds	%f22, %f0, %f28
	.word 0xbabd2060  ! 356: XNORcc_I	xnorcc 	%r20, 0x0060, %r29
	.word 0xb3a80820  ! 360: FMOVRLEZ	fmovs	%fcc1, %f0, %f25
	.word 0xbba508a0  ! 364: FSUBs	fsubs	%f20, %f0, %f29
	.word 0xba15e042  ! 366: OR_I	or 	%r23, 0x0042, %r29
	.word 0xbb540000  ! 369: RDPR_GL	rdpr	%-, %r29
	.word 0xbda00520  ! 370: FSQRTs	fsqrt	
	.word 0xb3ab4820  ! 371: FMOVCC	fmovs	%fcc1, %f0, %f25
	.word 0xbda448c0  ! 374: FSUBd	fsubd	%f48, %f0, %f30
	.word 0xb9a5c860  ! 377: FADDq	dis not found

	setx	0x10039, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a00560  ! 382: FSQRTq	fsqrt	
	mov	1, %r14
	.word 0xa193a000  ! 383: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbbaa8820  ! 384: FMOVG	fmovs	%fcc1, %f0, %f29
	.word 0xb9510000  ! 385: RDPR_TICK	<illegal instruction>
	.word 0x8d94a180  ! 387: WRPR_PSTATE_I	wrpr	%r18, 0x0180, %pstate
	.word 0xb82cc000  ! 389: ANDN_R	andn 	%r19, %r0, %r28
	.word 0xb1a98820  ! 390: FMOVNEG	fmovs	%fcc1, %f0, %f24
	.word 0x8995219c  ! 392: WRPR_TICK_I	wrpr	%r20, 0x019c, %tick
	setx	0x232, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7ab0820  ! 395: FMOVGU	fmovs	%fcc1, %f0, %f27
	.word 0xb494a0cb  ! 400: ORcc_I	orcc 	%r18, 0x00cb, %r26
	.word 0xb5a448a0  ! 407: FSUBs	fsubs	%f17, %f0, %f26
	.word 0x8d95e1a3  ! 415: WRPR_PSTATE_I	wrpr	%r23, 0x01a3, %pstate
	setx	0x214, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x1011f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5a98820  ! 419: FMOVNEG	fmovs	%fcc1, %f0, %f26
	.word 0xbfa98820  ! 431: FMOVNEG	fmovs	%fcc1, %f0, %f31
	.word 0xb3a40920  ! 432: FMULs	fmuls	%f16, %f0, %f25
	.word 0xbd540000  ! 437: RDPR_GL	rdpr	%-, %r30
	.word 0xbfa489c0  ! 439: FDIVd	fdivd	%f18, %f0, %f62
	.word 0xb5a5c9a0  ! 447: FDIVs	fdivs	%f23, %f0, %f26
	setx	0x3012c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d952083  ! 451: WRPR_PSTATE_I	wrpr	%r20, 0x0083, %pstate
	.word 0xbdab4820  ! 453: FMOVCC	fmovs	%fcc1, %f0, %f30
	mov	0, %r12
	.word 0x8f932000  ! 460: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbda81820  ! 462: FMOVRGZ	fmovs	%fcc3, %f0, %f30
	.word 0xb551c000  ! 463: RDPR_TL	<illegal instruction>
	.word 0xb1a50920  ! 464: FMULs	fmuls	%f20, %f0, %f24
	setx	0x20318, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81983a03  ! 469: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a03, %hpstate
	setx	0x210, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x819829c9  ! 471: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09c9, %hpstate
	.word 0xb3a88820  ! 473: FMOVLE	fmovs	%fcc1, %f0, %f25
	.word 0xbd508000  ! 475: RDPR_TSTATE	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0x8394e12f  ! 477: WRPR_TNPC_I	wrpr	%r19, 0x012f, %tnpc
	.word 0xbd51c000  ! 479: RDPR_TL	<illegal instruction>
	setx	0x30025, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1a81820  ! 481: FMOVRGZ	fmovs	%fcc3, %f0, %f24
	.word 0x8395a07a  ! 482: WRPR_TNPC_I	wrpr	%r22, 0x007a, %tnpc
	ta	T_CHANGE_HPRIV
	.word 0x819828c9  ! 483: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08c9, %hpstate
	.word 0xb1ab0820  ! 484: FMOVGU	fmovs	%fcc1, %f0, %f24
	.word 0xbd540000  ! 485: RDPR_GL	<illegal instruction>
	.word 0xb48de040  ! 496: ANDcc_I	andcc 	%r23, 0x0040, %r26
	.word 0xb77d6401  ! 501: MOVR_I	movre	%r21, 0x1, %r27
	.word 0xbf510000  ! 503: RDPR_TICK	<illegal instruction>
	.word 0xbfa448a0  ! 504: FSUBs	fsubs	%f17, %f0, %f31
	.word 0xb5a44860  ! 506: FADDq	dis not found

	.word 0xbba589e0  ! 508: FDIVq	dis not found

	.word 0xbb480000  ! 509: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xb5a44860  ! 511: FADDq	dis not found

	setx	data_start_6, %g1, %r19
	.word 0xbba5c8c0  ! 519: FSUBd	fsubd	%f54, %f0, %f60
	.word 0xbfa4c8c0  ! 520: FSUBd	fsubd	%f50, %f0, %f62
	.word 0xb1a44820  ! 522: FADDs	fadds	%f17, %f0, %f24
	.word 0x85942051  ! 525: WRPR_TSTATE_I	wrpr	%r16, 0x0051, %tstate
	.word 0xb9a5c8e0  ! 526: FSUBq	dis not found

	.word 0xb3a588c0  ! 527: FSUBd	fsubd	%f22, %f0, %f56
	setx	0x323, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5aac820  ! 535: FMOVGE	fmovs	%fcc1, %f0, %f26
	.word 0xb7a488e0  ! 536: FSUBq	dis not found

	.word 0xb5aa4820  ! 540: FMOVNE	fmovs	%fcc1, %f0, %f26
	setx	data_start_0, %g1, %r19
	.word 0xb1ab8820  ! 542: FMOVPOS	fmovs	%fcc1, %f0, %f24
	.word 0xb7a58920  ! 544: FMULs	fmuls	%f22, %f0, %f27
	setx	0xb, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a00040  ! 548: FMOVd	fmovd	%f0, %f56
	.word 0xb3a00540  ! 549: FSQRTd	fsqrt	
	.word 0x899561c7  ! 551: WRPR_TICK_I	wrpr	%r21, 0x01c7, %tick
	.word 0xb495c000  ! 552: ORcc_R	orcc 	%r23, %r0, %r26
	.word 0xbb50c000  ! 556: RDPR_TT	<illegal instruction>
	.word 0xb7a40960  ! 557: FMULq	dis not found

	.word 0xb1ab4820  ! 558: FMOVCC	fmovs	%fcc1, %f0, %f24
	.word 0xb1520000  ! 559: RDPR_PIL	<illegal instruction>
	.word 0xb6040000  ! 562: ADD_R	add 	%r16, %r0, %r27
	.word 0xbda409a0  ! 563: FDIVs	fdivs	%f16, %f0, %f30
	.word 0xbb51c000  ! 564: RDPR_TL	<illegal instruction>
	.word 0xbfa54840  ! 570: FADDd	faddd	%f52, %f0, %f62
	.word 0xbda548a0  ! 571: FSUBs	fsubs	%f21, %f0, %f30
	.word 0x819521c9  ! 572: WRPR_TPC_I	wrpr	%r20, 0x01c9, %tpc
	.word 0xbba81c20  ! 576: FMOVRGEZ	dis not found

	.word 0x819460e0  ! 580: WRPR_TPC_I	wrpr	%r17, 0x00e0, %tpc
	.word 0xb9a40940  ! 583: FMULd	fmuld	%f16, %f0, %f28
	.word 0xb7a00520  ! 587: FSQRTs	fsqrt	
	.word 0xb3ab4820  ! 588: FMOVCC	fmovs	%fcc1, %f0, %f25
	.word 0x9194e113  ! 592: WRPR_PIL_I	wrpr	%r19, 0x0113, %pil
	.word 0xbba00040  ! 597: FMOVd	fmovd	%f0, %f60
	setx	0x219, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20210, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbaa4820  ! 602: FMOVNE	fmovs	%fcc1, %f0, %f29
	.word 0xb7a8c820  ! 603: FMOVL	fmovs	%fcc1, %f0, %f27
	.word 0xbba00520  ! 604: FSQRTs	fsqrt	
	setx	data_start_1, %g1, %r19
	.word 0xb9508000  ! 607: RDPR_TSTATE	<illegal instruction>
	.word 0xbbab0820  ! 608: FMOVGU	fmovs	%fcc1, %f0, %f29
	setx	0x311, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7a81420  ! 610: FMOVRNZ	dis not found

	.word 0xb3540000  ! 611: RDPR_GL	<illegal instruction>
	setx	0x30011, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf510000  ! 618: RDPR_TICK	<illegal instruction>
	setx	data_start_1, %g1, %r16
	.word 0xb3ab8820  ! 621: FMOVPOS	fmovs	%fcc1, %f0, %f25
	.word 0xb8040000  ! 623: ADD_R	add 	%r16, %r0, %r28
	.word 0xb1a81c20  ! 624: FMOVRGEZ	dis not found

	.word 0xb9a50960  ! 625: FMULq	dis not found

	.word 0xbfa9c820  ! 629: FMOVVS	fmovs	%fcc1, %f0, %f31
	.word 0xb1a58840  ! 631: FADDd	faddd	%f22, %f0, %f24
	.word 0x8394e1c3  ! 633: WRPR_TNPC_I	wrpr	%r19, 0x01c3, %tnpc
	.word 0xb9a00540  ! 639: FSQRTd	fsqrt	
	.word 0xb7508000  ! 646: RDPR_TSTATE	<illegal instruction>
	.word 0xbba588c0  ! 648: FSUBd	fsubd	%f22, %f0, %f60
	.word 0xbbab8820  ! 649: FMOVPOS	fmovs	%fcc1, %f0, %f29
	.word 0xb9520000  ! 651: RDPR_PIL	<illegal instruction>
	.word 0xbfa508a0  ! 657: FSUBs	fsubs	%f20, %f0, %f31
	setx	0x20105, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9508000  ! 661: RDPR_TSTATE	<illegal instruction>
	.word 0xbf2c4000  ! 663: SLL_R	sll 	%r17, %r0, %r31
	setx	0x2013a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81982d13  ! 670: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d13, %hpstate
	setx	data_start_6, %g1, %r23
	.word 0xb5a508e0  ! 678: FSUBq	dis not found

	.word 0xbba44920  ! 683: FMULs	fmuls	%f17, %f0, %f29
	.word 0xb9a94820  ! 684: FMOVCS	fmovs	%fcc1, %f0, %f28
	setx	0x10215, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa81c20  ! 690: FMOVRGEZ	dis not found

	.word 0xb1480000  ! 691: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0x8194a1cf  ! 692: WRPR_TPC_I	wrpr	%r18, 0x01cf, %tpc
	.word 0xbdaac820  ! 693: FMOVGE	fmovs	%fcc1, %f0, %f30
	.word 0xb7a00520  ! 695: FSQRTs	fsqrt	
	.word 0xb7a448c0  ! 697: FSUBd	fsubd	%f48, %f0, %f58
	.word 0xbfa4c9a0  ! 699: FDIVs	fdivs	%f19, %f0, %f31
	.word 0xb3510000  ! 700: RDPR_TICK	<illegal instruction>
	.word 0xb52c1000  ! 701: SLLX_R	sllx	%r16, %r0, %r26
	.word 0xbba54840  ! 703: FADDd	faddd	%f52, %f0, %f60
	.word 0xbd480000  ! 707: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xbd504000  ! 711: RDPR_TNPC	<illegal instruction>
	mov	2, %r14
	.word 0xa193a000  ! 715: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbd518000  ! 716: RDPR_PSTATE	<illegal instruction>
	.word 0xbe15a14c  ! 717: OR_I	or 	%r22, 0x014c, %r31
	.word 0xbda40820  ! 718: FADDs	fadds	%f16, %f0, %f30
	.word 0xb8a50000  ! 720: SUBcc_R	subcc 	%r20, %r0, %r28
	.word 0xb9aa4820  ! 723: FMOVNE	fmovs	%fcc1, %f0, %f28
	.word 0xb5a9c820  ! 724: FMOVVS	fmovs	%fcc1, %f0, %f26
	.word 0xb5aa0820  ! 725: FMOVA	fmovs	%fcc1, %f0, %f26
	.word 0xb5518000  ! 728: RDPR_PSTATE	<illegal instruction>
	setx	data_start_7, %g1, %r16
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb5a9c820  ! 732: FMOVVS	fmovs	%fcc1, %f0, %f26
	ta	T_CHANGE_HPRIV
	.word 0x81982b13  ! 734: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b13, %hpstate
	.word 0x8195e041  ! 738: WRPR_TPC_I	wrpr	%r23, 0x0041, %tpc
	.word 0xb7ab8820  ! 744: FMOVPOS	fmovs	%fcc1, %f0, %f27
	.word 0x9195a10b  ! 745: WRPR_PIL_I	wrpr	%r22, 0x010b, %pil
	.word 0xbd7c2401  ! 746: MOVR_I	movre	%r16, 0x1, %r30
	.word 0xb53d3001  ! 750: SRAX_I	srax	%r20, 0x0001, %r26
	.word 0xb5a44820  ! 756: FADDs	fadds	%f17, %f0, %f26
	.word 0xb814e08f  ! 757: OR_I	or 	%r19, 0x008f, %r28
	.word 0xb3aa8820  ! 759: FMOVG	fmovs	%fcc1, %f0, %f25
	.word 0xba25e1db  ! 761: SUB_I	sub 	%r23, 0x01db, %r29
	.word 0xb9a5c8e0  ! 763: FSUBq	dis not found

	.word 0xb9a449a0  ! 764: FDIVs	fdivs	%f17, %f0, %f28
	.word 0xb415a1d8  ! 766: OR_I	or 	%r22, 0x01d8, %r26
	setx	data_start_6, %g1, %r21
	setx	0x115, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7a5c940  ! 772: FMULd	fmuld	%f54, %f0, %f58
	setx	data_start_3, %g1, %r23
	setx	data_start_2, %g1, %r16
	.word 0xb1aa0820  ! 776: FMOVA	fmovs	%fcc1, %f0, %f24
	.word 0xb5504000  ! 780: RDPR_TNPC	<illegal instruction>
	setx	0x31c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9a00020  ! 782: FMOVs	fmovs	%f0, %f28
	.word 0xb5504000  ! 784: RDPR_TNPC	<illegal instruction>
	.word 0xb6944000  ! 785: ORcc_R	orcc 	%r17, %r0, %r27
	.word 0x8d95a1e5  ! 787: WRPR_PSTATE_I	wrpr	%r22, 0x01e5, %pstate
	.word 0xb1a80820  ! 790: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
	.word 0xbfa00520  ! 791: FSQRTs	fsqrt	
	.word 0x9194a055  ! 792: WRPR_PIL_I	wrpr	%r18, 0x0055, %pil
	.word 0xb53cb001  ! 798: SRAX_I	srax	%r18, 0x0001, %r26
	setx	0x210, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbda4c8c0  ! 803: FSUBd	fsubd	%f50, %f0, %f30
	.word 0xb5a5c940  ! 805: FMULd	fmuld	%f54, %f0, %f26
	.word 0xb1a00540  ! 806: FSQRTd	fsqrt	
	.word 0xb3a00560  ! 807: FSQRTq	fsqrt	
	.word 0xb7aa4820  ! 808: FMOVNE	fmovs	%fcc1, %f0, %f27
	.word 0xbd520000  ! 810: RDPR_PIL	<illegal instruction>
	.word 0x8d95a0bc  ! 811: WRPR_PSTATE_I	wrpr	%r22, 0x00bc, %pstate
	.word 0x8395a08d  ! 812: WRPR_TNPC_I	wrpr	%r22, 0x008d, %tnpc
	.word 0xb9a80820  ! 815: FMOVN	fmovs	%fcc1, %f0, %f28
	.word 0xb3504000  ! 816: RDPR_TNPC	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81982dc1  ! 821: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dc1, %hpstate
	.word 0x8594a07b  ! 822: WRPR_TSTATE_I	wrpr	%r18, 0x007b, %tstate
	setx	0x23f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd500000  ! 825: RDPR_TPC	<illegal instruction>
	.word 0xb9a80420  ! 826: FMOVRZ	dis not found

	ta	T_CHANGE_HPRIV
	.word 0x81982f9b  ! 827: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f9b, %hpstate
	.word 0xb751c000  ! 829: RDPR_TL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb7a94820  ! 833: FMOVCS	fmovs	%fcc1, %f0, %f27
	.word 0xb5a5c920  ! 836: FMULs	fmuls	%f23, %f0, %f26
	.word 0xb7a00020  ! 838: FMOVs	fmovs	%f0, %f27
	.word 0xb3a54960  ! 841: FMULq	dis not found

	.word 0xbfa54940  ! 844: FMULd	fmuld	%f52, %f0, %f62
	mov	0, %r12
	.word 0x8f932000  ! 845: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbda81420  ! 846: FMOVRNZ	dis not found

	.word 0xbd641800  ! 848: MOVcc_R	<illegal instruction>
	.word 0xb9aa4820  ! 850: FMOVNE	fmovs	%fcc1, %f0, %f28
	.word 0xb42da08d  ! 851: ANDN_I	andn 	%r22, 0x008d, %r26
	.word 0xb3520000  ! 855: RDPR_PIL	<illegal instruction>
	.word 0x9195e1ed  ! 858: WRPR_PIL_I	wrpr	%r23, 0x01ed, %pil
	.word 0x8994e198  ! 861: WRPR_TICK_I	wrpr	%r19, 0x0198, %tick
	.word 0xbfaa8820  ! 863: FMOVG	fmovs	%fcc1, %f0, %f31
	.word 0xb9518000  ! 866: RDPR_PSTATE	<illegal instruction>
	.word 0x9194e13d  ! 867: WRPR_PIL_I	wrpr	%r19, 0x013d, %pil
	.word 0xb9a84820  ! 869: FMOVE	fmovs	%fcc1, %f0, %f28
	.word 0x8794a04f  ! 871: WRPR_TT_I	wrpr	%r18, 0x004f, %tt
	mov	2, %r14
	.word 0xa193a000  ! 873: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb7a8c820  ! 875: FMOVL	fmovs	%fcc1, %f0, %f27
	.word 0xb5a48840  ! 881: FADDd	faddd	%f18, %f0, %f26
	.word 0xb1a589e0  ! 882: FDIVq	dis not found

	.word 0xbb480000  ! 883: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xbb50c000  ! 884: RDPR_TT	<illegal instruction>
	.word 0xbc24c000  ! 885: SUB_R	sub 	%r19, %r0, %r30
	.word 0xb9a00560  ! 886: FSQRTq	fsqrt	
	.word 0xb7a80820  ! 887: FMOVRLEZ	fmovs	%fcc1, %f0, %f27
	.word 0xbcb4c000  ! 890: ORNcc_R	orncc 	%r19, %r0, %r30
	.word 0xbbab0820  ! 893: FMOVGU	fmovs	%fcc1, %f0, %f29
	.word 0xbba54820  ! 895: FADDs	fadds	%f21, %f0, %f29
	.word 0xb9510000  ! 900: RDPR_TICK	<illegal instruction>
	.word 0xb7a98820  ! 904: FMOVNEG	fmovs	%fcc1, %f0, %f27
	.word 0xb1a80c20  ! 907: FMOVRLZ	dis not found

	.word 0xbfa489a0  ! 908: FDIVs	fdivs	%f18, %f0, %f31
	.word 0xbda81420  ! 910: FMOVRNZ	dis not found

	.word 0xb1a81820  ! 912: FMOVRGZ	fmovs	%fcc3, %f0, %f24
	.word 0xb9a409a0  ! 920: FDIVs	fdivs	%f16, %f0, %f28
	.word 0xb7a81820  ! 923: FMOVRGZ	fmovs	%fcc3, %f0, %f27
	.word 0xbf3c7001  ! 924: SRAX_I	srax	%r17, 0x0001, %r31
	.word 0xb7aa8820  ! 926: FMOVG	fmovs	%fcc1, %f0, %f27
	.word 0x85952139  ! 929: WRPR_TSTATE_I	wrpr	%r20, 0x0139, %tstate
	.word 0xb9a40840  ! 931: FADDd	faddd	%f16, %f0, %f28
	setx	0x3023f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb6250000  ! 933: SUB_R	sub 	%r20, %r0, %r27
	.word 0xb1aa4820  ! 934: FMOVNE	fmovs	%fcc1, %f0, %f24
	ta	T_CHANGE_HPRIV
	.word 0x81983d83  ! 935: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d83, %hpstate
	.word 0xbd50c000  ! 938: RDPR_TT	<illegal instruction>
	.word 0xbc2d6116  ! 939: ANDN_I	andn 	%r21, 0x0116, %r30
	setx	0x30321, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbda81c20  ! 942: FMOVRGEZ	dis not found

	.word 0xb3aa4820  ! 944: FMOVNE	fmovs	%fcc1, %f0, %f25
	setx	0x2001d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8394203f  ! 947: WRPR_TNPC_I	wrpr	%r16, 0x003f, %tnpc
	.word 0xbfa509c0  ! 949: FDIVd	fdivd	%f20, %f0, %f62
	setx	0x20022, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r23
	.word 0xbfa90820  ! 952: FMOVLEU	fmovs	%fcc1, %f0, %f31
	.word 0xb5a48920  ! 954: FMULs	fmuls	%f18, %f0, %f26
	setx	0x20322, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1540000  ! 961: RDPR_GL	<illegal instruction>
	.word 0x859461f7  ! 963: WRPR_TSTATE_I	wrpr	%r17, 0x01f7, %tstate
	ta	T_CHANGE_HPRIV
	.word 0x81982b0b  ! 968: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b0b, %hpstate
	.word 0xbfaa0820  ! 969: FMOVA	fmovs	%fcc1, %f0, %f31
	.word 0xbdaa8820  ! 972: FMOVG	fmovs	%fcc1, %f0, %f30
	.word 0x8395e017  ! 977: WRPR_TNPC_I	wrpr	%r23, 0x0017, %tnpc
	.word 0xb9ab0820  ! 978: FMOVGU	fmovs	%fcc1, %f0, %f28
	setx	0x30211, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbba50960  ! 980: FMULq	dis not found

	.word 0xbfaac820  ! 983: FMOVGE	fmovs	%fcc1, %f0, %f31
	.word 0xb7a44960  ! 984: FMULq	dis not found

	.word 0xbc9c0000  ! 985: XORcc_R	xorcc 	%r16, %r0, %r30
	.word 0xbc348000  ! 986: SUBC_R	orn 	%r18, %r0, %r30
	ta	T_CHANGE_HPRIV
	.word 0x8198394b  ! 989: WRHPR_HPSTATE_I	wrhpr	%r0, 0x194b, %hpstate
	.word 0x879561c3  ! 994: WRPR_TT_I	wrpr	%r21, 0x01c3, %tt
	.word 0xb415a1ed  ! 995: OR_I	or 	%r22, 0x01ed, %r26
	setx	0x30020, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa88820  ! 998: FMOVLE	fmovs	%fcc1, %f0, %f31
	.word 0xbfa00540  ! 999: FSQRTd	fsqrt	
	.word 0xb9aac820  ! 1000: FMOVGE	fmovs	%fcc1, %f0, %f28
	.word 0xb3a80420  ! 1001: FMOVRZ	dis not found

	.word 0x8394209f  ! 1002: WRPR_TNPC_I	wrpr	%r16, 0x009f, %tnpc
	setx	data_start_1, %g1, %r22
	.word 0xbfa8c820  ! 1009: FMOVL	fmovs	%fcc1, %f0, %f31
	.word 0xbe24a0ac  ! 1011: SUB_I	sub 	%r18, 0x00ac, %r31
	setx	0x10113, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d95a17e  ! 1023: WRPR_PSTATE_I	wrpr	%r22, 0x017e, %pstate
	.word 0xb5500000  ! 1024: RDPR_TPC	<illegal instruction>
	.word 0xbfa4c860  ! 1026: FADDq	dis not found

	setx	0x1002a, %g1, %o0
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
	.word 0x859521c0  ! 1034: WRPR_TSTATE_I	wrpr	%r20, 0x01c0, %tstate
	.word 0xb1520000  ! 1035: RDPR_PIL	<illegal instruction>
	.word 0xb7a90820  ! 1036: FMOVLEU	fmovs	%fcc1, %f0, %f27
	.word 0xbda48840  ! 1038: FADDd	faddd	%f18, %f0, %f30
	.word 0xb2a5c000  ! 1044: SUBcc_R	subcc 	%r23, %r0, %r25
	.word 0xbe944000  ! 1047: ORcc_R	orcc 	%r17, %r0, %r31
	setx	0x10a, %g1, %o0
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
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb1ab8820  ! 1057: FMOVPOS	fmovs	%fcc1, %f0, %f24
	.word 0xba442163  ! 1059: ADDC_I	addc 	%r16, 0x0163, %r29
	.word 0xb7aa0820  ! 1060: FMOVA	fmovs	%fcc1, %f0, %f27
	.word 0xb9a8c820  ! 1063: FMOVL	fmovs	%fcc1, %f0, %f28
	.word 0xb9a508e0  ! 1064: FSUBq	dis not found

	.word 0x859560f2  ! 1066: WRPR_TSTATE_I	wrpr	%r21, 0x00f2, %tstate
	mov	1, %r12
	.word 0x8f932000  ! 1076: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	0x331, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5a54860  ! 1080: FADDq	dis not found

	.word 0xbfa48940  ! 1083: FMULd	fmuld	%f18, %f0, %f62
	.word 0xbb641800  ! 1084: MOVcc_R	<illegal instruction>
	.word 0x91952112  ! 1086: WRPR_PIL_I	wrpr	%r20, 0x0112, %pil
	.word 0xb7a80420  ! 1089: FMOVRZ	dis not found

	.word 0x8595a0f8  ! 1093: WRPR_TSTATE_I	wrpr	%r22, 0x00f8, %tstate
	.word 0xb5a509c0  ! 1095: FDIVd	fdivd	%f20, %f0, %f26
	.word 0xbda80c20  ! 1097: FMOVRLZ	dis not found

	mov	0, %r12
	.word 0x8f932000  ! 1098: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	data_start_5, %g1, %r19
	.word 0x8794e180  ! 1100: WRPR_TT_I	wrpr	%r19, 0x0180, %tt
	.word 0xb5a00040  ! 1101: FMOVd	fmovd	%f0, %f26
	ta	T_CHANGE_HPRIV
	.word 0x81983fc9  ! 1102: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1fc9, %hpstate
	.word 0xb5aa0820  ! 1103: FMOVA	fmovs	%fcc1, %f0, %f26
	.word 0xbba489c0  ! 1106: FDIVd	fdivd	%f18, %f0, %f60
	setx	0x10130, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20238, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a81420  ! 1115: FMOVRNZ	dis not found

	.word 0xbba80820  ! 1119: FMOVRLEZ	fmovs	%fcc1, %f0, %f29
	.word 0xb3a588c0  ! 1123: FSUBd	fsubd	%f22, %f0, %f56
	mov	0, %r12
	.word 0x8f932000  ! 1124: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbfa00560  ! 1126: FSQRTq	fsqrt	
	setx	0x30025, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	1, %r12
	.word 0x8f932000  ! 1131: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbb508000  ! 1132: RDPR_TSTATE	<illegal instruction>
	.word 0xbf641800  ! 1135: MOVcc_R	<illegal instruction>
	.word 0xb3518000  ! 1136: RDPR_PSTATE	<illegal instruction>
	.word 0xb750c000  ! 1144: RDPR_TT	<illegal instruction>
	setx	data_start_2, %g1, %r18
	.word 0xbfa54840  ! 1148: FADDd	faddd	%f52, %f0, %f62
	.word 0xbba00520  ! 1150: FSQRTs	fsqrt	
	setx	data_start_1, %g1, %r23
	.word 0xb73c4000  ! 1159: SRA_R	sra 	%r17, %r0, %r27
	.word 0xb7aa0820  ! 1163: FMOVA	fmovs	%fcc1, %f0, %f27
	mov	1, %r12
	.word 0x8f932000  ! 1173: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb29d60dd  ! 1174: XORcc_I	xorcc 	%r21, 0x00dd, %r25
	.word 0xb9ab0820  ! 1176: FMOVGU	fmovs	%fcc1, %f0, %f28
	setx	data_start_3, %g1, %r19
	.word 0xb5a81820  ! 1178: FMOVRGZ	fmovs	%fcc3, %f0, %f26
	.word 0xb7520000  ! 1185: RDPR_PIL	<illegal instruction>
	.word 0xb3a00040  ! 1186: FMOVd	fmovd	%f0, %f56
	setx	0x33a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x879460fe  ! 1188: WRPR_TT_I	wrpr	%r17, 0x00fe, %tt
	setx	0x20238, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3480000  ! 1192: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xb7ab0820  ! 1193: FMOVGU	fmovs	%fcc1, %f0, %f27
	.word 0x919520b6  ! 1194: WRPR_PIL_I	wrpr	%r20, 0x00b6, %pil
	.word 0xbda80420  ! 1196: FMOVRZ	dis not found

	setx	0x1000e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a9c820  ! 1199: FMOVVS	fmovs	%fcc1, %f0, %f25
	.word 0xb3a00020  ! 1202: FMOVs	fmovs	%f0, %f25
	.word 0xbba50820  ! 1204: FADDs	fadds	%f20, %f0, %f29
	.word 0xbf480000  ! 1205: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	setx	0x30007, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a80420  ! 1209: FMOVRZ	dis not found

	.word 0xbb504000  ! 1210: RDPR_TNPC	<illegal instruction>
	.word 0xb7a00520  ! 1211: FSQRTs	fsqrt	
	.word 0xb9510000  ! 1212: RDPR_TICK	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81982b43  ! 1213: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b43, %hpstate
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0x819460ce  ! 1215: WRPR_TPC_I	wrpr	%r17, 0x00ce, %tpc
	.word 0xb9ab4820  ! 1218: FMOVCC	fmovs	%fcc1, %f0, %f28
	mov	0, %r12
	.word 0x8f932000  ! 1220: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb5a81c20  ! 1221: FMOVRGEZ	dis not found

	.word 0xb5a40940  ! 1222: FMULd	fmuld	%f16, %f0, %f26
	.word 0xb5504000  ! 1227: RDPR_TNPC	<illegal instruction>
	.word 0xb1504000  ! 1228: RDPR_TNPC	<illegal instruction>
	.word 0xb7a5c8c0  ! 1235: FSUBd	fsubd	%f54, %f0, %f58
	.word 0xb1aa4820  ! 1237: FMOVNE	fmovs	%fcc1, %f0, %f24
	.word 0xbd508000  ! 1240: RDPR_TSTATE	<illegal instruction>
	.word 0xb3a00540  ! 1241: FSQRTd	fsqrt	
	.word 0xb0bcc000  ! 1242: XNORcc_R	xnorcc 	%r19, %r0, %r24
	.word 0xb9480000  ! 1245: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xb551c000  ! 1246: RDPR_TL	<illegal instruction>
	.word 0xbba81c20  ! 1251: FMOVRGEZ	dis not found

	.word 0xbfa489c0  ! 1255: FDIVd	fdivd	%f18, %f0, %f62
	.word 0xbc2c61bb  ! 1256: ANDN_I	andn 	%r17, 0x01bb, %r30
	.word 0xbfab0820  ! 1259: FMOVGU	fmovs	%fcc1, %f0, %f31
	.word 0x8194a11d  ! 1261: WRPR_TPC_I	wrpr	%r18, 0x011d, %tpc
	.word 0xb7a8c820  ! 1267: FMOVL	fmovs	%fcc1, %f0, %f27
	.word 0xbba00020  ! 1270: FMOVs	fmovs	%f0, %f29
	.word 0xb7ab4820  ! 1271: FMOVCC	fmovs	%fcc1, %f0, %f27
	.word 0xbdaa8820  ! 1273: FMOVG	fmovs	%fcc1, %f0, %f30
	.word 0xbfa5c840  ! 1276: FADDd	faddd	%f54, %f0, %f62
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	ta	T_CHANGE_HPRIV
	.word 0x81983949  ! 1281: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1949, %hpstate
	.word 0xb7a00040  ! 1282: FMOVd	fmovd	%f0, %f58
	.word 0x8395a088  ! 1283: WRPR_TNPC_I	wrpr	%r22, 0x0088, %tnpc
	.word 0xbfa98820  ! 1286: FMOVNEG	fmovs	%fcc1, %f0, %f31
	.word 0xb7a54940  ! 1288: FMULd	fmuld	%f52, %f0, %f58
	.word 0xb5aa4820  ! 1292: FMOVNE	fmovs	%fcc1, %f0, %f26
	.word 0x8d95a1c2  ! 1296: WRPR_PSTATE_I	wrpr	%r22, 0x01c2, %pstate
	.word 0xb3a48840  ! 1300: FADDd	faddd	%f18, %f0, %f56
	setx	data_start_1, %g1, %r18
	.word 0xb950c000  ! 1307: RDPR_TT	<illegal instruction>
	.word 0xbda48940  ! 1313: FMULd	fmuld	%f18, %f0, %f30
	.word 0x8795204e  ! 1315: WRPR_TT_I	wrpr	%r20, 0x004e, %tt
	.word 0x85942070  ! 1317: WRPR_TSTATE_I	wrpr	%r16, 0x0070, %tstate
	.word 0xb3a50840  ! 1322: FADDd	faddd	%f20, %f0, %f56
	.word 0xb9ab4820  ! 1325: FMOVCC	fmovs	%fcc1, %f0, %f28
	.word 0xbfa00540  ! 1327: FSQRTd	fsqrt	
	.word 0xb7a4c920  ! 1329: FMULs	fmuls	%f19, %f0, %f27
	.word 0xb00dc000  ! 1331: AND_R	and 	%r23, %r0, %r24
	.word 0xbfa80820  ! 1332: FMOVN	fmovs	%fcc1, %f0, %f31
	.word 0xb9510000  ! 1338: RDPR_TICK	<illegal instruction>
	setx	0x10013, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5abc820  ! 1342: FMOVVC	fmovs	%fcc1, %f0, %f26
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	setx	data_start_7, %g1, %r16
	.word 0xb7a589a0  ! 1349: FDIVs	fdivs	%f22, %f0, %f27
	setx	0x20113, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5a8c820  ! 1351: FMOVL	fmovs	%fcc1, %f0, %f26
	.word 0xb414c000  ! 1354: OR_R	or 	%r19, %r0, %r26
	setx	0x20106, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x81952002  ! 1356: WRPR_TPC_I	wrpr	%r20, 0x0002, %tpc
	setx	0x10006, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81983e13  ! 1361: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e13, %hpstate
	.word 0xbda4c860  ! 1362: FADDq	dis not found

	.word 0xb7520000  ! 1364: RDPR_PIL	<illegal instruction>
	.word 0x8995e070  ! 1365: WRPR_TICK_I	wrpr	%r23, 0x0070, %tick
	.word 0x8395e03b  ! 1367: WRPR_TNPC_I	wrpr	%r23, 0x003b, %tnpc
	.word 0xb9a44920  ! 1371: FMULs	fmuls	%f17, %f0, %f28
	.word 0xbba84820  ! 1372: FMOVE	fmovs	%fcc1, %f0, %f29
	.word 0xbb540000  ! 1373: RDPR_GL	<illegal instruction>
	setx	0x20206, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9a48920  ! 1379: FMULs	fmuls	%f18, %f0, %f28
	.word 0xb9a44960  ! 1382: FMULq	dis not found

	mov	1, %r14
	.word 0xa193a000  ! 1383: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbda44920  ! 1384: FMULs	fmuls	%f17, %f0, %f30
	.word 0xb1a5c960  ! 1385: FMULq	dis not found

	.word 0x8595e18a  ! 1386: WRPR_TSTATE_I	wrpr	%r23, 0x018a, %tstate
	.word 0xbbaa8820  ! 1389: FMOVG	fmovs	%fcc1, %f0, %f29
	.word 0xb1a54960  ! 1391: FMULq	dis not found

	.word 0xb1a94820  ! 1393: FMOVCS	fmovs	%fcc1, %f0, %f24
	mov	1, %r14
	.word 0xa193a000  ! 1394: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x2003b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81983c93  ! 1398: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c93, %hpstate
	setx	0x10030, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d95e033  ! 1400: WRPR_PSTATE_I	wrpr	%r23, 0x0033, %pstate
	.word 0xb9a5c820  ! 1406: FADDs	fadds	%f23, %f0, %f28
	.word 0xbe44a1de  ! 1409: ADDC_I	addc 	%r18, 0x01de, %r31
	.word 0xbfab8820  ! 1410: FMOVPOS	fmovs	%fcc1, %f0, %f31
	.word 0xb7ab8820  ! 1419: FMOVPOS	fmovs	%fcc1, %f0, %f27
	.word 0xb7aa4820  ! 1422: FMOVNE	fmovs	%fcc1, %f0, %f27
	.word 0xb5a00520  ! 1424: FSQRTs	fsqrt	
	.word 0xb3643801  ! 1425: MOVcc_I	<illegal instruction>
	mov	2, %r14
	.word 0xa193a000  ! 1427: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb9a80820  ! 1428: FMOVRLEZ	fmovs	%fcc1, %f0, %f28
	.word 0xb1aa4820  ! 1429: FMOVNE	fmovs	%fcc1, %f0, %f24
	.word 0xb334b001  ! 1430: SRLX_I	srlx	%r18, 0x0001, %r25
	.word 0xb1a44840  ! 1432: FADDd	faddd	%f48, %f0, %f24
	.word 0xb1a00020  ! 1433: FMOVs	fmovs	%f0, %f24
	.word 0xbba4c9c0  ! 1435: FDIVd	fdivd	%f50, %f0, %f60
	.word 0xbda80420  ! 1445: FMOVRZ	dis not found

	.word 0xb7504000  ! 1447: RDPR_TNPC	<illegal instruction>
	setx	0x20225, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9a44940  ! 1450: FMULd	fmuld	%f48, %f0, %f28
	.word 0xb7a94820  ! 1453: FMOVCS	fmovs	%fcc1, %f0, %f27
	.word 0xb934d000  ! 1454: SRLX_R	srlx	%r19, %r0, %r28
	.word 0xb7a588a0  ! 1455: FSUBs	fsubs	%f22, %f0, %f27
	setx	0x30327, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	2, %r12
	.word 0x8f932000  ! 1459: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb1a509a0  ! 1464: FDIVs	fdivs	%f20, %f0, %f24
	setx	data_start_7, %g1, %r22
	setx	data_start_4, %g1, %r23
	.word 0xb1a00540  ! 1475: FSQRTd	fsqrt	
	.word 0xbd510000  ! 1476: RDPR_TICK	<illegal instruction>
	.word 0x8595e19e  ! 1478: WRPR_TSTATE_I	wrpr	%r23, 0x019e, %tstate
	.word 0xb5510000  ! 1479: RDPR_TICK	<illegal instruction>
	.word 0xbfaa4820  ! 1480: FMOVNE	fmovs	%fcc1, %f0, %f31
	.word 0xbda48960  ! 1486: FMULq	dis not found

	.word 0xb00d4000  ! 1488: AND_R	and 	%r21, %r0, %r24
	ta	T_CHANGE_HPRIV
	.word 0x81983b09  ! 1494: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b09, %hpstate
	setx	data_start_7, %g1, %r22
	.word 0xbb510000  ! 1496: RDPR_TICK	<illegal instruction>
	.word 0xbd510000  ! 1497: RDPR_TICK	<illegal instruction>
	.word 0xb1aac820  ! 1499: FMOVGE	fmovs	%fcc1, %f0, %f24
	.word 0xb5ab4820  ! 1500: FMOVCC	fmovs	%fcc1, %f0, %f26
	.word 0xbf520000  ! 1504: RDPR_PIL	<illegal instruction>
	.word 0xb3a4c8a0  ! 1506: FSUBs	fsubs	%f19, %f0, %f25
	.word 0xb5a84820  ! 1507: FMOVE	fmovs	%fcc1, %f0, %f26
	.word 0xbfa88820  ! 1509: FMOVLE	fmovs	%fcc1, %f0, %f31
	.word 0x8d95e1cb  ! 1512: WRPR_PSTATE_I	wrpr	%r23, 0x01cb, %pstate
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbba9c820  ! 1514: FMOVVS	fmovs	%fcc1, %f0, %f29
	.word 0xb5a589e0  ! 1516: FDIVq	dis not found

	setx	0x10213, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a80820  ! 1526: FMOVN	fmovs	%fcc1, %f0, %f25
	setx	0x20118, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7a54960  ! 1533: FMULq	dis not found

	.word 0xbda548a0  ! 1534: FSUBs	fsubs	%f21, %f0, %f30
	.word 0xb9a5c940  ! 1535: FMULd	fmuld	%f54, %f0, %f28
	.word 0xb1aa8820  ! 1537: FMOVG	fmovs	%fcc1, %f0, %f24
	ta	T_CHANGE_HPRIV
	.word 0x8198381b  ! 1538: WRHPR_HPSTATE_I	wrhpr	%r0, 0x181b, %hpstate
	.word 0xbfa44920  ! 1539: FMULs	fmuls	%f17, %f0, %f31
	.word 0xbda5c9e0  ! 1541: FDIVq	dis not found

	.word 0xbea46057  ! 1543: SUBcc_I	subcc 	%r17, 0x0057, %r31
	.word 0xb7518000  ! 1546: RDPR_PSTATE	<illegal instruction>
	.word 0x8794a015  ! 1548: WRPR_TT_I	wrpr	%r18, 0x0015, %tt
	.word 0xb7a80820  ! 1549: FMOVN	fmovs	%fcc1, %f0, %f27
	.word 0x8d94a13a  ! 1554: WRPR_PSTATE_I	wrpr	%r18, 0x013a, %pstate
	.word 0xbfa80c20  ! 1555: FMOVRLZ	dis not found

	.word 0xb2458000  ! 1556: ADDC_R	addc 	%r22, %r0, %r25
	ta	T_CHANGE_HPRIV
	.word 0x81982f4b  ! 1558: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f4b, %hpstate
	.word 0xb7a44840  ! 1559: FADDd	faddd	%f48, %f0, %f58
	.word 0xbba48960  ! 1562: FMULq	dis not found

	.word 0xb5a54840  ! 1566: FADDd	faddd	%f52, %f0, %f26
	.word 0xb92c6001  ! 1567: SLL_I	sll 	%r17, 0x0001, %r28
	.word 0xbb7ce401  ! 1568: MOVR_I	movre	%r19, 0x1, %r29
	mov	1, %r14
	.word 0xa193a000  ! 1572: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb8ac0000  ! 1573: ANDNcc_R	andncc 	%r16, %r0, %r28
	.word 0xbbab4820  ! 1574: FMOVCC	fmovs	%fcc1, %f0, %f29
	.word 0xb9520000  ! 1576: RDPR_PIL	<illegal instruction>
	.word 0xb5a84820  ! 1581: FMOVE	fmovs	%fcc1, %f0, %f26
	.word 0xb1540000  ! 1582: RDPR_GL	<illegal instruction>
	.word 0xb9a9c820  ! 1584: FMOVVS	fmovs	%fcc1, %f0, %f28
	.word 0xb7508000  ! 1587: RDPR_TSTATE	<illegal instruction>
	.word 0x9194a03e  ! 1590: WRPR_PIL_I	wrpr	%r18, 0x003e, %pil
	.word 0xb5a4c9e0  ! 1591: FDIVq	dis not found

	.word 0xb9a00020  ! 1592: FMOVs	fmovs	%f0, %f28
	.word 0xbfa94820  ! 1593: FMOVCS	fmovs	%fcc1, %f0, %f31
	.word 0xb9a8c820  ! 1594: FMOVL	fmovs	%fcc1, %f0, %f28
	.word 0x8195a163  ! 1601: WRPR_TPC_I	wrpr	%r22, 0x0163, %tpc
	.word 0x8795a07b  ! 1605: WRPR_TT_I	wrpr	%r22, 0x007b, %tt
	.word 0xbf3cf001  ! 1607: SRAX_I	srax	%r19, 0x0001, %r31
	.word 0x8d9561d3  ! 1608: WRPR_PSTATE_I	wrpr	%r21, 0x01d3, %pstate
	.word 0xbfa5c9c0  ! 1610: FDIVd	fdivd	%f54, %f0, %f62
	setx	0x30129, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbba488c0  ! 1614: FSUBd	fsubd	%f18, %f0, %f60
	.word 0x8195a040  ! 1615: WRPR_TPC_I	wrpr	%r22, 0x0040, %tpc
	.word 0x8195a0e1  ! 1616: WRPR_TPC_I	wrpr	%r22, 0x00e1, %tpc
	.word 0xb1a50840  ! 1627: FADDd	faddd	%f20, %f0, %f24
	.word 0x819461d9  ! 1632: WRPR_TPC_I	wrpr	%r17, 0x01d9, %tpc
	.word 0xb3518000  ! 1633: RDPR_PSTATE	<illegal instruction>
	setx	0x2001b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20321, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbba449e0  ! 1645: FDIVq	dis not found

	.word 0xb1a488a0  ! 1651: FSUBs	fsubs	%f18, %f0, %f24
	.word 0xba1421dc  ! 1652: OR_I	or 	%r16, 0x01dc, %r29
	.word 0xbfa81c20  ! 1660: FMOVRGEZ	dis not found

	.word 0xbba58920  ! 1661: FMULs	fmuls	%f22, %f0, %f29
	setx	0x10206, %g1, %o0
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
	.word 0xb5aa8820  ! 1673: FMOVG	fmovs	%fcc1, %f0, %f26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	0x20006, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x32e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x83946084  ! 1684: WRPR_TNPC_I	wrpr	%r17, 0x0084, %tnpc
	.word 0xb7a488e0  ! 1687: FSUBq	dis not found

	.word 0xb7518000  ! 1688: RDPR_PSTATE	<illegal instruction>
	mov	0, %r14
	.word 0xa193a000  ! 1690: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xb1a489e0  ! 1693: FDIVq	dis not found

	setx	0x3031f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a549a0  ! 1699: FDIVs	fdivs	%f21, %f0, %f25
	.word 0xb0458000  ! 1704: ADDC_R	addc 	%r22, %r0, %r24
	.word 0xb3a54940  ! 1705: FMULd	fmuld	%f52, %f0, %f56
	.word 0xb9a00520  ! 1707: FSQRTs	fsqrt	
	.word 0xbfa90820  ! 1708: FMOVLEU	fmovs	%fcc1, %f0, %f31
	.word 0xb9a84820  ! 1709: FMOVE	fmovs	%fcc1, %f0, %f28
	.word 0xbd3c2001  ! 1711: SRA_I	sra 	%r16, 0x0001, %r30
	.word 0xb5a5c9c0  ! 1713: FDIVd	fdivd	%f54, %f0, %f26
	.word 0xbba00040  ! 1718: FMOVd	fmovd	%f0, %f60
	.word 0xbd518000  ! 1724: RDPR_PSTATE	<illegal instruction>
	.word 0x9194a0d8  ! 1727: WRPR_PIL_I	wrpr	%r18, 0x00d8, %pil
	.word 0xb5a00020  ! 1731: FMOVs	fmovs	%f0, %f26
	.word 0xb9a488e0  ! 1732: FSUBq	dis not found

	.word 0xb1a449a0  ! 1734: FDIVs	fdivs	%f17, %f0, %f24
	.word 0xbba5c8c0  ! 1737: FSUBd	fsubd	%f54, %f0, %f60
	.word 0xbac46192  ! 1741: ADDCcc_I	addccc 	%r17, 0x0192, %r29
	.word 0xb3a00520  ! 1742: FSQRTs	fsqrt	
	.word 0x8395a005  ! 1748: WRPR_TNPC_I	wrpr	%r22, 0x0005, %tnpc
	.word 0xb1a548c0  ! 1749: FSUBd	fsubd	%f52, %f0, %f24
	.word 0xb7a00520  ! 1750: FSQRTs	fsqrt	
	.word 0xb1a44820  ! 1755: FADDs	fadds	%f17, %f0, %f24
	.word 0xbc34e1ac  ! 1758: SUBC_I	orn 	%r19, 0x01ac, %r30
	.word 0xbfa80820  ! 1759: FMOVN	fmovs	%fcc1, %f0, %f31
	.word 0xbda5c860  ! 1763: FADDq	dis not found

	.word 0xb3480000  ! 1764: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	setx	0x10021, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x1000b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbda54920  ! 1776: FMULs	fmuls	%f21, %f0, %f30
	.word 0xb32c0000  ! 1778: SLL_R	sll 	%r16, %r0, %r25
	.word 0xb1a50860  ! 1779: FADDq	dis not found

	setx	0x2d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81983c01  ! 1787: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c01, %hpstate
	.word 0xb3a8c820  ! 1790: FMOVL	fmovs	%fcc1, %f0, %f25
	.word 0xbd2ce001  ! 1794: SLL_I	sll 	%r19, 0x0001, %r30
	.word 0xbe048000  ! 1796: ADD_R	add 	%r18, %r0, %r31
	.word 0xb9a5c9e0  ! 1797: FDIVq	dis not found

	.word 0xb3a54960  ! 1798: FMULq	dis not found

	.word 0xb5a508c0  ! 1800: FSUBd	fsubd	%f20, %f0, %f26
	.word 0xbe8460e9  ! 1801: ADDcc_I	addcc 	%r17, 0x00e9, %r31
	.word 0xbba5c960  ! 1802: FMULq	dis not found

	.word 0xbfa80420  ! 1803: FMOVRZ	dis not found

	.word 0xbd480000  ! 1806: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xb7aa4820  ! 1810: FMOVNE	fmovs	%fcc1, %f0, %f27
	.word 0xb3a9c820  ! 1813: FMOVVS	fmovs	%fcc1, %f0, %f25
	.word 0xb7a449e0  ! 1817: FDIVq	dis not found

	.word 0xba350000  ! 1819: ORN_R	orn 	%r20, %r0, %r29
	.word 0xbda00520  ! 1821: FSQRTs	fsqrt	
	setx	0x2011d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa5c940  ! 1825: FMULd	fmuld	%f54, %f0, %f62
	.word 0xb5ab4820  ! 1833: FMOVCC	fmovs	%fcc1, %f0, %f26
	.word 0xb5a54960  ! 1836: FMULq	dis not found

	.word 0xbba48920  ! 1839: FMULs	fmuls	%f18, %f0, %f29
	.word 0xb6b5e0a8  ! 1841: SUBCcc_I	orncc 	%r23, 0x00a8, %r27
	ta	T_CHANGE_HPRIV
	.word 0x81983f49  ! 1842: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f49, %hpstate
	setx	0x20123, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8395a095  ! 1845: WRPR_TNPC_I	wrpr	%r22, 0x0095, %tnpc
	setx	0x10008, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81983a53  ! 1847: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a53, %hpstate
	setx	0x3030d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf504000  ! 1851: RDPR_TNPC	<illegal instruction>
	.word 0xbba00020  ! 1853: FMOVs	fmovs	%f0, %f29
	.word 0xbdabc820  ! 1854: FMOVVC	fmovs	%fcc1, %f0, %f30
	.word 0xbfa00040  ! 1856: FMOVd	fmovd	%f0, %f62
	.word 0xb9a84820  ! 1858: FMOVE	fmovs	%fcc1, %f0, %f28
	.word 0xb9508000  ! 1859: RDPR_TSTATE	<illegal instruction>
	.word 0xb9a449c0  ! 1860: FDIVd	fdivd	%f48, %f0, %f28
	.word 0xb6054000  ! 1861: ADD_R	add 	%r21, %r0, %r27
	setx	0x3012d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbeb54000  ! 1870: SUBCcc_R	orncc 	%r21, %r0, %r31
	setx	data_start_5, %g1, %r16
	.word 0xbda8c820  ! 1873: FMOVL	fmovs	%fcc1, %f0, %f30
	setx	0x10120, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8994a04a  ! 1878: WRPR_TICK_I	wrpr	%r18, 0x004a, %tick
	.word 0x8395a0b3  ! 1879: WRPR_TNPC_I	wrpr	%r22, 0x00b3, %tnpc
	.word 0xbda80c20  ! 1880: FMOVRLZ	dis not found

	.word 0xbf480000  ! 1883: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xb2358000  ! 1887: ORN_R	orn 	%r22, %r0, %r25
	.word 0xbba588e0  ! 1891: FSUBq	dis not found

	.word 0xb7a00560  ! 1895: FSQRTq	fsqrt	
	.word 0xbfa80820  ! 1898: FMOVRLEZ	fmovs	%fcc1, %f0, %f31
	.word 0xb9a84820  ! 1903: FMOVE	fmovs	%fcc1, %f0, %f28
	.word 0xb3a81420  ! 1904: FMOVRNZ	dis not found

	.word 0xbd50c000  ! 1905: RDPR_TT	<illegal instruction>
	.word 0x83942128  ! 1906: WRPR_TNPC_I	wrpr	%r16, 0x0128, %tnpc
	.word 0xbfa48920  ! 1907: FMULs	fmuls	%f18, %f0, %f31
	setx	0x10112, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5a50940  ! 1911: FMULd	fmuld	%f20, %f0, %f26
	.word 0x8794a097  ! 1921: WRPR_TT_I	wrpr	%r18, 0x0097, %tt
	.word 0xb7a54840  ! 1923: FADDd	faddd	%f52, %f0, %f58
	.word 0xb1a00560  ! 1924: FSQRTq	fsqrt	
	.word 0xb3a98820  ! 1927: FMOVNEG	fmovs	%fcc1, %f0, %f25
	.word 0xba452103  ! 1929: ADDC_I	addc 	%r20, 0x0103, %r29
	.word 0xbda4c860  ! 1933: FADDq	dis not found

	.word 0xbd520000  ! 1937: RDPR_PIL	<illegal instruction>
	.word 0xb1a509a0  ! 1938: FDIVs	fdivs	%f20, %f0, %f24
	.word 0x8795a0f9  ! 1939: WRPR_TT_I	wrpr	%r22, 0x00f9, %tt
	.word 0xbbab4820  ! 1942: FMOVCC	fmovs	%fcc1, %f0, %f29
	.word 0xbfa589e0  ! 1946: FDIVq	dis not found

	.word 0xb00d20c1  ! 1947: AND_I	and 	%r20, 0x00c1, %r24
	.word 0x8594a14e  ! 1948: WRPR_TSTATE_I	wrpr	%r18, 0x014e, %tstate
	mov	1, %r12
	.word 0x8f932000  ! 1949: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	0x1023c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a80420  ! 1957: FMOVRZ	dis not found

	.word 0xb9a5c9e0  ! 1959: FDIVq	dis not found

	mov	0, %r12
	.word 0x8f932000  ! 1960: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb9510000  ! 1961: RDPR_TICK	<illegal instruction>
	.word 0xb3a409c0  ! 1963: FDIVd	fdivd	%f16, %f0, %f56
	.word 0xbe2c8000  ! 1964: ANDN_R	andn 	%r18, %r0, %r31
	.word 0xb9a84820  ! 1966: FMOVE	fmovs	%fcc1, %f0, %f28
	.word 0xbda80820  ! 1967: FMOVN	fmovs	%fcc1, %f0, %f30
	setx	data_start_6, %g1, %r21
	.word 0xb551c000  ! 1971: RDPR_TL	<illegal instruction>
	.word 0xb7340000  ! 1972: SRL_R	srl 	%r16, %r0, %r27
	.word 0xb9a40940  ! 1975: FMULd	fmuld	%f16, %f0, %f28
	ta	T_CHANGE_HPRIV
	.word 0x819838c1  ! 1977: WRHPR_HPSTATE_I	wrhpr	%r0, 0x18c1, %hpstate
	.word 0xbbaa4820  ! 1982: FMOVNE	fmovs	%fcc1, %f0, %f29
	.word 0xb3a9c820  ! 1990: FMOVVS	fmovs	%fcc1, %f0, %f25
	setx	0x10221, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10309, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	1, %r12
	.word 0x8f932000  ! 1995: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb5643801  ! 1996: MOVcc_I	<illegal instruction>
	.word 0xb9a00520  ! 1999: FSQRTs	fsqrt	
	.word 0xbd518000  ! 2003: RDPR_PSTATE	<illegal instruction>
	setx	0x10032, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7a5c940  ! 2005: FMULd	fmuld	%f54, %f0, %f58
	mov	0, %r12
	.word 0x8f932000  ! 2006: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbfab4820  ! 2008: FMOVCC	fmovs	%fcc1, %f0, %f31
	.word 0xb1aa0820  ! 2010: FMOVA	fmovs	%fcc1, %f0, %f24
	.word 0xb3a449a0  ! 2012: FDIVs	fdivs	%f17, %f0, %f25
	.word 0x8d94e10a  ! 2015: WRPR_PSTATE_I	wrpr	%r19, 0x010a, %pstate
	.word 0x83956069  ! 2016: WRPR_TNPC_I	wrpr	%r21, 0x0069, %tnpc
	setx	0x1033f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb643801  ! 2019: MOVcc_I	<illegal instruction>
	.word 0xbfa00540  ! 2023: FSQRTd	fsqrt	
	.word 0xb5a58840  ! 2024: FADDd	faddd	%f22, %f0, %f26
	setx	0x20204, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10106, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbba489e0  ! 2036: FDIVq	dis not found

	.word 0xbd520000  ! 2038: RDPR_PIL	<illegal instruction>
	.word 0xbfa40840  ! 2039: FADDd	faddd	%f16, %f0, %f62
	.word 0xb5a548a0  ! 2040: FSUBs	fsubs	%f21, %f0, %f26
	.word 0xb5aac820  ! 2042: FMOVGE	fmovs	%fcc1, %f0, %f26
	.word 0xbbaa4820  ! 2058: FMOVNE	fmovs	%fcc1, %f0, %f29
	.word 0xb7a509e0  ! 2061: FDIVq	dis not found

	.word 0xb1a5c8a0  ! 2062: FSUBs	fsubs	%f23, %f0, %f24
	setx	0x20005, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30333, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb045a10d  ! 2065: ADDC_I	addc 	%r22, 0x010d, %r24
	.word 0xb7a00540  ! 2066: FSQRTd	fsqrt	
	.word 0xb3a80820  ! 2068: FMOVN	fmovs	%fcc1, %f0, %f25
	.word 0xbda408a0  ! 2070: FSUBs	fsubs	%f16, %f0, %f30
	.word 0x81956169  ! 2071: WRPR_TPC_I	wrpr	%r21, 0x0169, %tpc
	.word 0xbf510000  ! 2072: RDPR_TICK	<illegal instruction>
	.word 0xb1a80420  ! 2077: FMOVRZ	dis not found

	.word 0x8794e1b3  ! 2083: WRPR_TT_I	wrpr	%r19, 0x01b3, %tt
	.word 0xb3518000  ! 2084: RDPR_PSTATE	<illegal instruction>
	.word 0xbfa54960  ! 2089: FMULq	dis not found

	.word 0xba156104  ! 2091: OR_I	or 	%r21, 0x0104, %r29
	setx	0x30204, %g1, %o0
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
	.word 0xb3a48920  ! 2096: FMULs	fmuls	%f18, %f0, %f25
	.word 0xbfa5c8e0  ! 2097: FSUBq	dis not found

	.word 0xbb3c8000  ! 2100: SRA_R	sra 	%r18, %r0, %r29
	.word 0xb1a00540  ! 2101: FSQRTd	fsqrt	
	.word 0xb3a80420  ! 2104: FMOVRZ	dis not found

	.word 0xbf500000  ! 2109: RDPR_TPC	<illegal instruction>
	setx	0x20212, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9643801  ! 2113: MOVcc_I	<illegal instruction>
	.word 0xbda00540  ! 2114: FSQRTd	fsqrt	
	.word 0xb9a81820  ! 2117: FMOVRGZ	fmovs	%fcc3, %f0, %f28
	.word 0xb9a00520  ! 2118: FSQRTs	fsqrt	
	.word 0xb495c000  ! 2122: ORcc_R	orcc 	%r23, %r0, %r26
	.word 0xbfa98820  ! 2123: FMOVNEG	fmovs	%fcc1, %f0, %f31
	.word 0xbbaa4820  ! 2124: FMOVNE	fmovs	%fcc1, %f0, %f29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb72c8000  ! 2128: SLL_R	sll 	%r18, %r0, %r27
	.word 0xbc340000  ! 2130: SUBC_R	orn 	%r16, %r0, %r30
	.word 0xb1a4c8c0  ! 2134: FSUBd	fsubd	%f50, %f0, %f24
	.word 0xb1a5c8c0  ! 2135: FSUBd	fsubd	%f54, %f0, %f24
	.word 0xb5a80820  ! 2136: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
	.word 0xb5a00520  ! 2140: FSQRTs	fsqrt	
	.word 0xbfabc820  ! 2143: FMOVVC	fmovs	%fcc1, %f0, %f31
	.word 0xbda00560  ! 2145: FSQRTq	fsqrt	
	.word 0xb1ab4820  ! 2146: FMOVCC	fmovs	%fcc1, %f0, %f24
	.word 0xbda81820  ! 2150: FMOVRGZ	fmovs	%fcc3, %f0, %f30
	.word 0x8794a16e  ! 2151: WRPR_TT_I	wrpr	%r18, 0x016e, %tt
	.word 0xbda00520  ! 2154: FSQRTs	fsqrt	
	.word 0xb21da1e0  ! 2159: XOR_I	xor 	%r22, 0x01e0, %r25
	.word 0xb9aa4820  ! 2162: FMOVNE	fmovs	%fcc1, %f0, %f28
	.word 0x919520dd  ! 2164: WRPR_PIL_I	wrpr	%r20, 0x00dd, %pil
	.word 0xbda00020  ! 2165: FMOVs	fmovs	%f0, %f30
	setx	0x20229, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7a54960  ! 2168: FMULq	dis not found

	.word 0xb3a589e0  ! 2170: FDIVq	dis not found

	setx	0x10021, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5a00020  ! 2176: FMOVs	fmovs	%f0, %f26
	setx	0x30000, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9a5c960  ! 2179: FMULq	dis not found

	.word 0xbba4c840  ! 2180: FADDd	faddd	%f50, %f0, %f60
	.word 0xb5a81c20  ! 2183: FMOVRGEZ	dis not found

	.word 0x8d95210c  ! 2186: WRPR_PSTATE_I	wrpr	%r20, 0x010c, %pstate
	.word 0xb5a489c0  ! 2192: FDIVd	fdivd	%f18, %f0, %f26
	.word 0xbb641800  ! 2196: MOVcc_R	<illegal instruction>
	.word 0xbba81c20  ! 2198: FMOVRGEZ	dis not found

	.word 0xbba00560  ! 2199: FSQRTq	fsqrt	
	.word 0xbfab8820  ! 2200: FMOVPOS	fmovs	%fcc1, %f0, %f31
	.word 0xbfa81c20  ! 2201: FMOVRGEZ	dis not found

	.word 0xb9a489a0  ! 2208: FDIVs	fdivs	%f18, %f0, %f28
	.word 0xb1a81420  ! 2211: FMOVRNZ	dis not found

	.word 0xb3ab8820  ! 2213: FMOVPOS	fmovs	%fcc1, %f0, %f25
	.word 0xb9a40840  ! 2214: FADDd	faddd	%f16, %f0, %f28
	.word 0x91956011  ! 2215: WRPR_PIL_I	wrpr	%r21, 0x0011, %pil
	.word 0xb3a50940  ! 2216: FMULd	fmuld	%f20, %f0, %f56
	.word 0xbd51c000  ! 2219: RDPR_TL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81982ed1  ! 2220: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ed1, %hpstate
	ta	T_CHANGE_HPRIV
	.word 0x81983d13  ! 2221: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d13, %hpstate
	setx	0x20207, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbdaa4820  ! 2223: FMOVNE	fmovs	%fcc1, %f0, %f30
	.word 0xb1ab0820  ! 2225: FMOVGU	fmovs	%fcc1, %f0, %f24
	setx	0x10133, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x39, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbba81820  ! 2231: FMOVRGZ	fmovs	%fcc3, %f0, %f29
	.word 0xb7a588a0  ! 2233: FSUBs	fsubs	%f22, %f0, %f27
	.word 0xb3480000  ! 2236: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xb3518000  ! 2238: RDPR_PSTATE	<illegal instruction>
	.word 0xb9a94820  ! 2239: FMOVCS	fmovs	%fcc1, %f0, %f28
	ta	T_CHANGE_HPRIV
	.word 0x81982ec3  ! 2240: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ec3, %hpstate
	.word 0xb7aa0820  ! 2242: FMOVA	fmovs	%fcc1, %f0, %f27
	ta	T_CHANGE_HPRIV
	.word 0x81983c89  ! 2243: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c89, %hpstate
	.word 0xb3a81420  ! 2244: FMOVRNZ	dis not found

	setx	0x12c, %g1, %o0
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
	ta	T_CHANGE_HPRIV
	.word 0x81982893  ! 2251: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0893, %hpstate
	.word 0xbf51c000  ! 2252: RDPR_TL	<illegal instruction>
	.word 0xb1ab8820  ! 2254: FMOVPOS	fmovs	%fcc1, %f0, %f24
	.word 0xbfa9c820  ! 2255: FMOVVS	fmovs	%fcc1, %f0, %f31
	.word 0xbda549e0  ! 2261: FDIVq	dis not found

	.word 0x8d9461c8  ! 2262: WRPR_PSTATE_I	wrpr	%r17, 0x01c8, %pstate
	.word 0xbba549a0  ! 2265: FDIVs	fdivs	%f21, %f0, %f29
	setx	0x20000, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a9c820  ! 2270: FMOVVS	fmovs	%fcc1, %f0, %f25
	setx	data_start_1, %g1, %r18
	setx	0x3023c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5a98820  ! 2278: FMOVNEG	fmovs	%fcc1, %f0, %f26
	mov	0, %r12
	.word 0x8f932000  ! 2284: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb9a5c820  ! 2287: FADDs	fadds	%f23, %f0, %f28
	.word 0xbd3c0000  ! 2292: SRA_R	sra 	%r16, %r0, %r30
	.word 0xb33c6001  ! 2295: SRA_I	sra 	%r17, 0x0001, %r25
	.word 0xbda80420  ! 2296: FMOVRZ	dis not found

	ta	T_CHANGE_HPRIV
	.word 0x81982903  ! 2305: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0903, %hpstate
	.word 0xb1a94820  ! 2306: FMOVCS	fmovs	%fcc1, %f0, %f24
	mov	1, %r14
	.word 0xa193a000  ! 2312: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	0x30027, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa9c820  ! 2315: FMOVVS	fmovs	%fcc1, %f0, %f31
	.word 0xbf508000  ! 2320: RDPR_TSTATE	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb9a54920  ! 2326: FMULs	fmuls	%f21, %f0, %f28
	setx	data_start_1, %g1, %r18
	.word 0xb3a00020  ! 2337: FMOVs	fmovs	%f0, %f25
	setx	data_start_1, %g1, %r19
	.word 0xb5a98820  ! 2340: FMOVNEG	fmovs	%fcc1, %f0, %f26
	.word 0xb1a00520  ! 2341: FSQRTs	fsqrt	
	setx	0x30f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5a90820  ! 2346: FMOVLEU	fmovs	%fcc1, %f0, %f26
	.word 0xb5a448e0  ! 2347: FSUBq	dis not found

	.word 0xb9540000  ! 2348: RDPR_GL	<illegal instruction>
	.word 0xbd540000  ! 2351: RDPR_GL	<illegal instruction>
	.word 0xb5a00520  ! 2358: FSQRTs	fsqrt	
	.word 0xb1a40920  ! 2359: FMULs	fmuls	%f16, %f0, %f24
	.word 0x879421a7  ! 2360: WRPR_TT_I	wrpr	%r16, 0x01a7, %tt
	.word 0xb1a50940  ! 2364: FMULd	fmuld	%f20, %f0, %f24
	.word 0xbd500000  ! 2366: RDPR_TPC	<illegal instruction>
	.word 0xb5abc820  ! 2369: FMOVVC	fmovs	%fcc1, %f0, %f26
	.word 0x8d95e1b7  ! 2370: WRPR_PSTATE_I	wrpr	%r23, 0x01b7, %pstate
	.word 0xbc04a12f  ! 2372: ADD_I	add 	%r18, 0x012f, %r30
	setx	0x20229, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbba81420  ! 2374: FMOVRNZ	dis not found

	.word 0xbba489e0  ! 2375: FDIVq	dis not found

	setx	data_start_6, %g1, %r21
	.word 0xb7a81420  ! 2378: FMOVRNZ	dis not found

	.word 0x9194e17b  ! 2381: WRPR_PIL_I	wrpr	%r19, 0x017b, %pil
	.word 0xbf520000  ! 2383: RDPR_PIL	<illegal instruction>
	.word 0xb5508000  ! 2387: RDPR_TSTATE	<illegal instruction>
	.word 0xbd51c000  ! 2392: RDPR_TL	<illegal instruction>
	mov	2, %r12
	.word 0x8f932000  ! 2394: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0x8794a0fb  ! 2396: WRPR_TT_I	wrpr	%r18, 0x00fb, %tt
	.word 0xb7520000  ! 2405: RDPR_PIL	<illegal instruction>
	setx	data_start_0, %g1, %r17
	.word 0xb4ad60fe  ! 2418: ANDNcc_I	andncc 	%r21, 0x00fe, %r26
	.word 0xbba44820  ! 2419: FADDs	fadds	%f17, %f0, %f29
	.word 0xbda44840  ! 2422: FADDd	faddd	%f48, %f0, %f30
	.word 0xbda5c820  ! 2423: FADDs	fadds	%f23, %f0, %f30
	.word 0xbda81c20  ! 2426: FMOVRGEZ	dis not found

	.word 0xb8c5c000  ! 2427: ADDCcc_R	addccc 	%r23, %r0, %r28
	setx	data_start_3, %g1, %r21
	.word 0x839460a2  ! 2436: WRPR_TNPC_I	wrpr	%r17, 0x00a2, %tnpc
	.word 0x8395a1dd  ! 2437: WRPR_TNPC_I	wrpr	%r22, 0x01dd, %tnpc
	.word 0xb3480000  ! 2439: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0x8395a083  ! 2442: WRPR_TNPC_I	wrpr	%r22, 0x0083, %tnpc
	.word 0xb351c000  ! 2446: RDPR_TL	<illegal instruction>
	.word 0xb09c0000  ! 2452: XORcc_R	xorcc 	%r16, %r0, %r24
	mov	1, %r14
	.word 0xa193a000  ! 2453: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	data_start_3, %g1, %r18
	.word 0x8194a168  ! 2458: WRPR_TPC_I	wrpr	%r18, 0x0168, %tpc
	.word 0xb7a88820  ! 2459: FMOVLE	fmovs	%fcc1, %f0, %f27
	.word 0xb7a81820  ! 2463: FMOVRGZ	fmovs	%fcc3, %f0, %f27
	.word 0xb5a489e0  ! 2466: FDIVq	dis not found

	setx	0x107, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x89952089  ! 2471: WRPR_TICK_I	wrpr	%r20, 0x0089, %tick
	setx	0x2020f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x133, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7a54940  ! 2476: FMULd	fmuld	%f52, %f0, %f58
	.word 0xbf2d2001  ! 2477: SLL_I	sll 	%r20, 0x0001, %r31
	.word 0xb3a98820  ! 2481: FMOVNEG	fmovs	%fcc1, %f0, %f25
	.word 0xbfa9c820  ! 2482: FMOVVS	fmovs	%fcc1, %f0, %f31
	.word 0xbda509c0  ! 2486: FDIVd	fdivd	%f20, %f0, %f30
	setx	data_start_5, %g1, %r23
	.word 0xbba509c0  ! 2490: FDIVd	fdivd	%f20, %f0, %f60
	.word 0xb5520000  ! 2491: RDPR_PIL	<illegal instruction>
	.word 0x9194215c  ! 2492: WRPR_PIL_I	wrpr	%r16, 0x015c, %pil
	.word 0xb3a80820  ! 2493: FMOVRLEZ	fmovs	%fcc1, %f0, %f25
	ta	T_CHANGE_HPRIV
	.word 0x81982b89  ! 2495: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b89, %hpstate
	.word 0x8595602a  ! 2499: WRPR_TSTATE_I	wrpr	%r21, 0x002a, %tstate
	.word 0xb3a80c20  ! 2500: FMOVRLZ	dis not found

	.word 0xbda4c9a0  ! 2501: FDIVs	fdivs	%f19, %f0, %f30
	setx	data_start_0, %g1, %r18
	setx	0x231, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8995e182  ! 2507: WRPR_TICK_I	wrpr	%r23, 0x0182, %tick
	.word 0xbba448c0  ! 2509: FSUBd	fsubd	%f48, %f0, %f60
	.word 0xbba81420  ! 2510: FMOVRNZ	dis not found

	.word 0xb5a48840  ! 2511: FADDd	faddd	%f18, %f0, %f26
	.word 0xb3a48920  ! 2512: FMULs	fmuls	%f18, %f0, %f25
	.word 0x8795e074  ! 2514: WRPR_TT_I	wrpr	%r23, 0x0074, %tt
	.word 0xbb508000  ! 2515: RDPR_TSTATE	<illegal instruction>
	.word 0xb1a448a0  ! 2516: FSUBs	fsubs	%f17, %f0, %f24
	.word 0xbd520000  ! 2517: RDPR_PIL	<illegal instruction>
	.word 0xbba00520  ! 2518: FSQRTs	fsqrt	
	.word 0xb7a5c8a0  ! 2519: FSUBs	fsubs	%f23, %f0, %f27
	.word 0x8195a088  ! 2521: WRPR_TPC_I	wrpr	%r22, 0x0088, %tpc
	.word 0xbba81420  ! 2537: FMOVRNZ	dis not found

	setx	0x20231, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb73ca001  ! 2541: SRA_I	sra 	%r18, 0x0001, %r27
	.word 0x8595a124  ! 2542: WRPR_TSTATE_I	wrpr	%r22, 0x0124, %tstate
	.word 0xb1a549e0  ! 2543: FDIVq	dis not found

	.word 0xb615c000  ! 2545: OR_R	or 	%r23, %r0, %r27
	.word 0xb3a80820  ! 2552: FMOVN	fmovs	%fcc1, %f0, %f25
	.word 0xb5a40840  ! 2554: FADDd	faddd	%f16, %f0, %f26
	setx	0x3030b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5a80820  ! 2560: FMOVN	fmovs	%fcc1, %f0, %f26
	setx	0x3031d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5480000  ! 2563: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	setx	0x30014, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x8, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9a88820  ! 2566: FMOVLE	fmovs	%fcc1, %f0, %f28
	.word 0xb2c461f5  ! 2568: ADDCcc_I	addccc 	%r17, 0x01f5, %r25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb9a4c840  ! 2573: FADDd	faddd	%f50, %f0, %f28
	.word 0xb1a4c960  ! 2575: FMULq	dis not found

	.word 0xbd2c8000  ! 2577: SLL_R	sll 	%r18, %r0, %r30
	.word 0xbfa80420  ! 2581: FMOVRZ	dis not found

	.word 0xb7a549c0  ! 2583: FDIVd	fdivd	%f52, %f0, %f58
	.word 0xb2bd61d9  ! 2584: XNORcc_I	xnorcc 	%r21, 0x01d9, %r25
	.word 0xb1a5c9c0  ! 2588: FDIVd	fdivd	%f54, %f0, %f24
	.word 0xb7a00520  ! 2593: FSQRTs	fsqrt	
	.word 0xbba00560  ! 2595: FSQRTq	fsqrt	
	.word 0xb7a588c0  ! 2597: FSUBd	fsubd	%f22, %f0, %f58
	.word 0xbdab8820  ! 2600: FMOVPOS	fmovs	%fcc1, %f0, %f30
	.word 0xb5aac820  ! 2605: FMOVGE	fmovs	%fcc1, %f0, %f26
	setx	data_start_1, %g1, %r22
	.word 0xb1a00540  ! 2610: FSQRTd	fsqrt	
	.word 0xb3a8c820  ! 2611: FMOVL	fmovs	%fcc1, %f0, %f25
	mov	2, %r12
	.word 0x8f932000  ! 2614: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb1aa4820  ! 2615: FMOVNE	fmovs	%fcc1, %f0, %f24
	.word 0xb60d2136  ! 2617: AND_I	and 	%r20, 0x0136, %r27
	.word 0xb3540000  ! 2621: RDPR_GL	<illegal instruction>
	.word 0xb5aac820  ! 2622: FMOVGE	fmovs	%fcc1, %f0, %f26
	.word 0xb63ca0ce  ! 2624: XNOR_I	xnor 	%r18, 0x00ce, %r27
	.word 0xbfa81420  ! 2628: FMOVRNZ	dis not found

	.word 0xb7ab0820  ! 2629: FMOVGU	fmovs	%fcc1, %f0, %f27
	.word 0xb21d0000  ! 2631: XOR_R	xor 	%r20, %r0, %r25
	.word 0x8995a095  ! 2635: WRPR_TICK_I	wrpr	%r22, 0x0095, %tick
	.word 0x859520b6  ! 2636: WRPR_TSTATE_I	wrpr	%r20, 0x00b6, %tstate
	.word 0xb5a44960  ! 2640: FMULq	dis not found

	setx	data_start_7, %g1, %r16
	.word 0xba1d2147  ! 2643: XOR_I	xor 	%r20, 0x0147, %r29
	setx	0x2010d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81982841  ! 2648: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0841, %hpstate
	setx	0x2022a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9a5c9a0  ! 2652: FDIVs	fdivs	%f23, %f0, %f28
	.word 0xbfa508a0  ! 2653: FSUBs	fsubs	%f20, %f0, %f31
	.word 0xb9a94820  ! 2657: FMOVCS	fmovs	%fcc1, %f0, %f28
	setx	0x11e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1a548c0  ! 2665: FSUBd	fsubd	%f52, %f0, %f24
	setx	0x11, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81982a5b  ! 2667: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a5b, %hpstate
	setx	0x30128, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a9c820  ! 2671: FMOVVS	fmovs	%fcc1, %f0, %f25
	.word 0xb5a48860  ! 2673: FADDq	dis not found

	.word 0xb1ab4820  ! 2676: FMOVCC	fmovs	%fcc1, %f0, %f24
	setx	0x10326, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x839421af  ! 2683: WRPR_TNPC_I	wrpr	%r16, 0x01af, %tnpc
	.word 0xbda4c8a0  ! 2686: FSUBs	fsubs	%f19, %f0, %f30
	.word 0xb1a44860  ! 2692: FADDq	dis not found

	setx	0x10111, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbba98820  ! 2695: FMOVNEG	fmovs	%fcc1, %f0, %f29
	.word 0xb1520000  ! 2696: RDPR_PIL	<illegal instruction>
	.word 0xbda54920  ! 2698: FMULs	fmuls	%f21, %f0, %f30
	mov	2, %r14
	.word 0xa193a000  ! 2699: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0x8d94a0f0  ! 2701: WRPR_PSTATE_I	wrpr	%r18, 0x00f0, %pstate
	.word 0xbeb561c7  ! 2709: SUBCcc_I	orncc 	%r21, 0x01c7, %r31
	.word 0xbf518000  ! 2711: RDPR_PSTATE	<illegal instruction>
	.word 0xb7a4c820  ! 2712: FADDs	fadds	%f19, %f0, %f27
	setx	0x20033, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbba548a0  ! 2715: FSUBs	fsubs	%f21, %f0, %f29
	.word 0xbd50c000  ! 2717: RDPR_TT	<illegal instruction>
	.word 0xb1a84820  ! 2719: FMOVE	fmovs	%fcc1, %f0, %f24
	setx	0x20211, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5500000  ! 2723: RDPR_TPC	<illegal instruction>
	.word 0xb5a488e0  ! 2735: FSUBq	dis not found

	.word 0xb3a548e0  ! 2737: FSUBq	dis not found

	.word 0xb9a54920  ! 2743: FMULs	fmuls	%f21, %f0, %f28
	.word 0xb3a81820  ! 2746: FMOVRGZ	fmovs	%fcc3, %f0, %f25
	.word 0xb5a40840  ! 2751: FADDd	faddd	%f16, %f0, %f26
	.word 0xbb2c9000  ! 2754: SLLX_R	sllx	%r18, %r0, %r29
	.word 0xb7a58920  ! 2764: FMULs	fmuls	%f22, %f0, %f27
	ta	T_CHANGE_HPRIV
	.word 0x81982b83  ! 2765: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b83, %hpstate
	setx	0x102, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9a5c860  ! 2767: FADDq	dis not found

	.word 0xb625c000  ! 2769: SUB_R	sub 	%r23, %r0, %r27
	.word 0xb32dd000  ! 2773: SLLX_R	sllx	%r23, %r0, %r25
	.word 0xbf500000  ! 2774: RDPR_TPC	<illegal instruction>
	setx	0x20319, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8794e075  ! 2776: WRPR_TT_I	wrpr	%r19, 0x0075, %tt
	.word 0xb9a8c820  ! 2779: FMOVL	fmovs	%fcc1, %f0, %f28
	.word 0xbda00540  ! 2780: FSQRTd	fsqrt	
	.word 0xbda40960  ! 2782: FMULq	dis not found

	.word 0xbc958000  ! 2783: ORcc_R	orcc 	%r22, %r0, %r30
	.word 0xb9a90820  ! 2785: FMOVLEU	fmovs	%fcc1, %f0, %f28
	.word 0xbda94820  ! 2788: FMOVCS	fmovs	%fcc1, %f0, %f30
	.word 0xb5aa4820  ! 2791: FMOVNE	fmovs	%fcc1, %f0, %f26
	.word 0xb5a4c8a0  ! 2795: FSUBs	fsubs	%f19, %f0, %f26
	.word 0xb5a00540  ! 2800: FSQRTd	fsqrt	
	.word 0xba050000  ! 2801: ADD_R	add 	%r20, %r0, %r29
	.word 0xbfa48840  ! 2805: FADDd	faddd	%f18, %f0, %f62
	.word 0xb7a44860  ! 2806: FADDq	dis not found

	.word 0xbfa00040  ! 2810: FMOVd	fmovd	%f0, %f62
	setx	0x2a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10302, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9a509a0  ! 2816: FDIVs	fdivs	%f20, %f0, %f28
	.word 0xb7480000  ! 2817: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xbda489c0  ! 2819: FDIVd	fdivd	%f18, %f0, %f30
	.word 0xb93c7001  ! 2820: SRAX_I	srax	%r17, 0x0001, %r28
	.word 0xb1a88820  ! 2822: FMOVLE	fmovs	%fcc1, %f0, %f24
	.word 0xb3a44840  ! 2829: FADDd	faddd	%f48, %f0, %f56
	.word 0xb9a00560  ! 2831: FSQRTq	fsqrt	
	.word 0x819561c1  ! 2832: WRPR_TPC_I	wrpr	%r21, 0x01c1, %tpc
	.word 0xbd508000  ! 2838: RDPR_TSTATE	<illegal instruction>
	.word 0xb52c1000  ! 2843: SLLX_R	sllx	%r16, %r0, %r26
	.word 0x8995a114  ! 2844: WRPR_TICK_I	wrpr	%r22, 0x0114, %tick
	.word 0xbba80820  ! 2852: FMOVN	fmovs	%fcc1, %f0, %f29
	.word 0xbb2cc000  ! 2856: SLL_R	sll 	%r19, %r0, %r29
	.word 0xb3a00040  ! 2858: FMOVd	fmovd	%f0, %f56
	.word 0xbf3c2001  ! 2859: SRA_I	sra 	%r16, 0x0001, %r31
	.word 0xb73d8000  ! 2860: SRA_R	sra 	%r22, %r0, %r27
	.word 0xb1a5c920  ! 2861: FMULs	fmuls	%f23, %f0, %f24
	.word 0xbfaa8820  ! 2864: FMOVG	fmovs	%fcc1, %f0, %f31
	setx	0x10205, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_3, %g1, %r18
	.word 0xb3a81820  ! 2872: FMOVRGZ	fmovs	%fcc3, %f0, %f25
	.word 0xbda00040  ! 2874: FMOVd	fmovd	%f0, %f30
	ta	T_CHANGE_HPRIV
	.word 0x81983d59  ! 2876: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d59, %hpstate
	.word 0xb22dc000  ! 2877: ANDN_R	andn 	%r23, %r0, %r25
	.word 0xbda81c20  ! 2880: FMOVRGEZ	dis not found

	.word 0xbba00040  ! 2881: FMOVd	fmovd	%f0, %f60
	.word 0xbba5c8a0  ! 2884: FSUBs	fsubs	%f23, %f0, %f29
	setx	data_start_3, %g1, %r16
	.word 0xbfa00040  ! 2887: FMOVd	fmovd	%f0, %f62
	setx	0x307, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20332, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7500000  ! 2895: RDPR_TPC	<illegal instruction>
	.word 0xb3a58940  ! 2897: FMULd	fmuld	%f22, %f0, %f56
	setx	0x10130, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	mov	1, %r12
	.word 0x8f932000  ! 2903: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0x899520be  ! 2904: WRPR_TICK_I	wrpr	%r20, 0x00be, %tick
	.word 0xb7a54860  ! 2907: FADDq	dis not found

	.word 0xbba00020  ! 2909: FMOVs	fmovs	%f0, %f29
	.word 0xb5a44820  ! 2911: FADDs	fadds	%f17, %f0, %f26
	setx	0x30331, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa44860  ! 2913: FADDq	dis not found

	.word 0xbba408a0  ! 2914: FSUBs	fsubs	%f16, %f0, %f29
	setx	0x3031d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7a408a0  ! 2917: FSUBs	fsubs	%f16, %f0, %f27
	.word 0xbd504000  ! 2918: RDPR_TNPC	<illegal instruction>
	setx	0x23c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd51c000  ! 2922: RDPR_TL	<illegal instruction>
	.word 0xbfa588a0  ! 2924: FSUBs	fsubs	%f22, %f0, %f31
	.word 0xb7a88820  ! 2934: FMOVLE	fmovs	%fcc1, %f0, %f27
	setx	data_start_1, %g1, %r23
	mov	2, %r12
	.word 0x8f932000  ! 2937: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	0x10025, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb12c4000  ! 2942: SLL_R	sll 	%r17, %r0, %r24
	setx	0x10018, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30305, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbba44820  ! 2952: FADDs	fadds	%f17, %f0, %f29
	.word 0xb9ab8820  ! 2955: FMOVPOS	fmovs	%fcc1, %f0, %f28
	.word 0xbea48000  ! 2957: SUBcc_R	subcc 	%r18, %r0, %r31
	.word 0xb550c000  ! 2960: RDPR_TT	<illegal instruction>
	.word 0xbdaac820  ! 2967: FMOVGE	fmovs	%fcc1, %f0, %f30
	setx	0x13d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb520000  ! 2974: RDPR_PIL	<illegal instruction>
	.word 0xbfa88820  ! 2975: FMOVLE	fmovs	%fcc1, %f0, %f31
	.word 0xb6944000  ! 2977: ORcc_R	orcc 	%r17, %r0, %r27
	setx	data_start_5, %g1, %r21
	.word 0x839421b2  ! 2982: WRPR_TNPC_I	wrpr	%r16, 0x01b2, %tnpc
	.word 0xb8b4a021  ! 2986: ORNcc_I	orncc 	%r18, 0x0021, %r28
	.word 0xb5a48840  ! 2990: FADDd	faddd	%f18, %f0, %f26
	.word 0xb9a58860  ! 2994: FADDq	dis not found

	.word 0xbba58960  ! 2995: FMULq	dis not found

	.word 0x9194a0e7  ! 2996: WRPR_PIL_I	wrpr	%r18, 0x00e7, %pil
	.word 0xb7aac820  ! 2998: FMOVGE	fmovs	%fcc1, %f0, %f27
	.word 0xb1aac820  ! 3000: FMOVGE	fmovs	%fcc1, %f0, %f24
	.word 0xb3a81420  ! 3007: FMOVRNZ	dis not found

	.word 0xb1a508e0  ! 3009: FSUBq	dis not found

	setx	0x1002d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbf50c000  ! 3013: RDPR_TT	<illegal instruction>
	.word 0xb7a80820  ! 3014: FMOVRLEZ	fmovs	%fcc1, %f0, %f27
	.word 0xbb500000  ! 3017: RDPR_TPC	<illegal instruction>
	.word 0x8994e0d5  ! 3019: WRPR_TICK_I	wrpr	%r19, 0x00d5, %tick
	.word 0xb7a00520  ! 3025: FSQRTs	fsqrt	
	.word 0xbba5c820  ! 3027: FADDs	fadds	%f23, %f0, %f29
	.word 0xb0bc4000  ! 3035: XNORcc_R	xnorcc 	%r17, %r0, %r24
	.word 0xb3a509e0  ! 3037: FDIVq	dis not found

	.word 0x8d95e03d  ! 3039: WRPR_PSTATE_I	wrpr	%r23, 0x003d, %pstate
	.word 0xb5518000  ! 3042: RDPR_PSTATE	<illegal instruction>
	.word 0xbda54940  ! 3043: FMULd	fmuld	%f52, %f0, %f30
	.word 0xb1aa4820  ! 3046: FMOVNE	fmovs	%fcc1, %f0, %f24
	setx	data_start_6, %g1, %r16
	.word 0xb9a4c860  ! 3050: FADDq	dis not found

	.word 0xb3a5c940  ! 3052: FMULd	fmuld	%f54, %f0, %f56
	.word 0xb92cc000  ! 3053: SLL_R	sll 	%r19, %r0, %r28
	.word 0x9195e009  ! 3055: WRPR_PIL_I	wrpr	%r23, 0x0009, %pil
	.word 0xb9a80820  ! 3056: FMOVRLEZ	fmovs	%fcc1, %f0, %f28
	.word 0xb5a549a0  ! 3057: FDIVs	fdivs	%f21, %f0, %f26
	.word 0xbb51c000  ! 3061: RDPR_TL	<illegal instruction>
	.word 0xb12d7001  ! 3063: SLLX_I	sllx	%r21, 0x0001, %r24
	setx	0x20332, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a80420  ! 3069: FMOVRZ	dis not found

	.word 0xb9a00560  ! 3072: FSQRTq	fsqrt	
	.word 0xb3504000  ! 3073: RDPR_TNPC	<illegal instruction>
	.word 0xbe05c000  ! 3074: ADD_R	add 	%r23, %r0, %r31
	setx	0x2031d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbdab8820  ! 3078: FMOVPOS	fmovs	%fcc1, %f0, %f30
	setx	0x1023a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1a98820  ! 3082: FMOVNEG	fmovs	%fcc1, %f0, %f24
	.word 0xbda80820  ! 3084: FMOVRLEZ	fmovs	%fcc1, %f0, %f30
	.word 0xbfa80420  ! 3087: FMOVRZ	dis not found

	setx	0x2021a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbba81420  ! 3090: FMOVRNZ	dis not found

	.word 0xbbaac820  ! 3091: FMOVGE	fmovs	%fcc1, %f0, %f29
	setx	0x30020, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5a81420  ! 3093: FMOVRNZ	dis not found

	.word 0xb9341000  ! 3094: SRLX_R	srlx	%r16, %r0, %r28
	.word 0xb3a98820  ! 3101: FMOVNEG	fmovs	%fcc1, %f0, %f25
	.word 0xbc2da0ed  ! 3104: ANDN_I	andn 	%r22, 0x00ed, %r30
	.word 0xb73c8000  ! 3111: SRA_R	sra 	%r18, %r0, %r27
	.word 0x91942147  ! 3114: WRPR_PIL_I	wrpr	%r16, 0x0147, %pil
	.word 0xb9508000  ! 3116: RDPR_TSTATE	<illegal instruction>
	.word 0xb3a81420  ! 3120: FMOVRNZ	dis not found

	.word 0xbda4c8c0  ! 3125: FSUBd	fsubd	%f50, %f0, %f30
	.word 0x899460f5  ! 3128: WRPR_TICK_I	wrpr	%r17, 0x00f5, %tick
	.word 0x8194a0b5  ! 3134: WRPR_TPC_I	wrpr	%r18, 0x00b5, %tpc
	setx	0x16, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbda589e0  ! 3141: FDIVq	dis not found

	.word 0xbfa40820  ! 3142: FADDs	fadds	%f16, %f0, %f31
	setx	data_start_2, %g1, %r18
	.word 0x8194a090  ! 3148: WRPR_TPC_I	wrpr	%r18, 0x0090, %tpc
	.word 0xb750c000  ! 3150: RDPR_TT	<illegal instruction>
	.word 0xbd35b001  ! 3153: SRLX_I	srlx	%r22, 0x0001, %r30
	.word 0xb41421df  ! 3156: OR_I	or 	%r16, 0x01df, %r26
	.word 0xb7a40820  ! 3158: FADDs	fadds	%f16, %f0, %f27
	.word 0xb1a00040  ! 3164: FMOVd	fmovd	%f0, %f24
	.word 0xb7a81420  ! 3170: FMOVRNZ	dis not found

	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb9a9c820  ! 3175: FMOVVS	fmovs	%fcc1, %f0, %f28
	.word 0xb9a4c8e0  ! 3176: FSUBq	dis not found

	setx	0x304, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7a40820  ! 3180: FADDs	fadds	%f16, %f0, %f27
	.word 0xbba48940  ! 3182: FMULd	fmuld	%f18, %f0, %f60
	.word 0xbba50920  ! 3183: FMULs	fmuls	%f20, %f0, %f29
	.word 0xb5a4c840  ! 3185: FADDd	faddd	%f50, %f0, %f26
	.word 0xbda00560  ! 3187: FSQRTq	fsqrt	
	.word 0xbd508000  ! 3188: RDPR_TSTATE	<illegal instruction>
	.word 0xb7a48820  ! 3191: FADDs	fadds	%f18, %f0, %f27
	ta	T_CHANGE_HPRIV
	.word 0x81982f9b  ! 3193: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f9b, %hpstate
	.word 0xb5a00560  ! 3194: FSQRTq	fsqrt	
	.word 0xbf3d3001  ! 3196: SRAX_I	srax	%r20, 0x0001, %r31
	.word 0xbda48860  ! 3197: FADDq	dis not found

	.word 0xbd518000  ! 3198: RDPR_PSTATE	<illegal instruction>
	.word 0xb3a81820  ! 3202: FMOVRGZ	fmovs	%fcc3, %f0, %f25
	.word 0x8995a196  ! 3203: WRPR_TICK_I	wrpr	%r22, 0x0196, %tick
	setx	0x30300, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10138, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7ab4820  ! 3211: FMOVCC	fmovs	%fcc1, %f0, %f27
	.word 0xb5a00540  ! 3212: FSQRTd	fsqrt	
	.word 0xbfa00540  ! 3213: FSQRTd	fsqrt	
	.word 0xb7a4c9a0  ! 3214: FDIVs	fdivs	%f19, %f0, %f27
	.word 0xb7aa0820  ! 3215: FMOVA	fmovs	%fcc1, %f0, %f27
	setx	0x1031b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9a5c9e0  ! 3217: FDIVq	dis not found

	.word 0xbba509a0  ! 3218: FDIVs	fdivs	%f20, %f0, %f29
	mov	1, %r14
	.word 0xa193a000  ! 3219: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xba9c8000  ! 3220: XORcc_R	xorcc 	%r18, %r0, %r29
	.word 0xbfa449e0  ! 3222: FDIVq	dis not found

	.word 0x8595e15e  ! 3223: WRPR_TSTATE_I	wrpr	%r23, 0x015e, %tstate
	.word 0xbba50820  ! 3224: FADDs	fadds	%f20, %f0, %f29
	.word 0xb1a408c0  ! 3226: FSUBd	fsubd	%f16, %f0, %f24
	.word 0xb7a44960  ! 3227: FMULq	dis not found

	.word 0xbfa589a0  ! 3229: FDIVs	fdivs	%f22, %f0, %f31
	.word 0xb1a409e0  ! 3235: FDIVq	dis not found

	.word 0xbfa48840  ! 3236: FADDd	faddd	%f18, %f0, %f62
	.word 0xbfa40920  ! 3237: FMULs	fmuls	%f16, %f0, %f31
	.word 0xbbab4820  ! 3241: FMOVCC	fmovs	%fcc1, %f0, %f29
	.word 0xbba81420  ! 3243: FMOVRNZ	dis not found

	.word 0xb7a4c9e0  ! 3246: FDIVq	dis not found

	.word 0xbf50c000  ! 3247: RDPR_TT	<illegal instruction>
	setx	0x10301, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7a5c9c0  ! 3252: FDIVd	fdivd	%f54, %f0, %f58
	.word 0xb1ab8820  ! 3254: FMOVPOS	fmovs	%fcc1, %f0, %f24
	.word 0xbd504000  ! 3255: RDPR_TNPC	<illegal instruction>
	.word 0xb7518000  ! 3256: RDPR_PSTATE	<illegal instruction>
	.word 0xb3a409c0  ! 3260: FDIVd	fdivd	%f16, %f0, %f56
	setx	0x23d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x20211, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x10338, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a00520  ! 3270: FSQRTs	fsqrt	
	setx	data_start_3, %g1, %r22
	.word 0xb5a5c9e0  ! 3275: FDIVq	dis not found

	.word 0xbba588c0  ! 3278: FSUBd	fsubd	%f22, %f0, %f60
	.word 0xbbab0820  ! 3279: FMOVGU	fmovs	%fcc1, %f0, %f29
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbc040000  ! 3281: ADD_R	add 	%r16, %r0, %r30
	.word 0xbba80c20  ! 3282: FMOVRLZ	dis not found

	.word 0xbfa98820  ! 3283: FMOVNEG	fmovs	%fcc1, %f0, %f31
	.word 0xbfa5c960  ! 3286: FMULq	dis not found

	.word 0x81946151  ! 3289: WRPR_TPC_I	wrpr	%r17, 0x0151, %tpc
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0x91946017  ! 3292: WRPR_PIL_I	wrpr	%r17, 0x0017, %pil
	.word 0xb5518000  ! 3293: RDPR_PSTATE	<illegal instruction>
	.word 0xb1aa0820  ! 3294: FMOVA	fmovs	%fcc1, %f0, %f24
	setx	0x3a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9a48860  ! 3298: FADDq	dis not found

	.word 0x81952182  ! 3306: WRPR_TPC_I	wrpr	%r20, 0x0182, %tpc
	.word 0xb8b54000  ! 3312: SUBCcc_R	orncc 	%r21, %r0, %r28
	.word 0xb21c8000  ! 3313: XOR_R	xor 	%r18, %r0, %r25
	.word 0xb7a81820  ! 3320: FMOVRGZ	fmovs	%fcc3, %f0, %f27
	.word 0xba242112  ! 3323: SUB_I	sub 	%r16, 0x0112, %r29
	.word 0x819461ca  ! 3324: WRPR_TPC_I	wrpr	%r17, 0x01ca, %tpc
	.word 0x8995a1ac  ! 3325: WRPR_TICK_I	wrpr	%r22, 0x01ac, %tick
	.word 0xbb508000  ! 3338: RDPR_TSTATE	<illegal instruction>
	.word 0x9195615d  ! 3342: WRPR_PIL_I	wrpr	%r21, 0x015d, %pil
	.word 0xb7a81420  ! 3343: FMOVRNZ	dis not found

	.word 0xb5aa4820  ! 3347: FMOVNE	fmovs	%fcc1, %f0, %f26
	.word 0xbda508e0  ! 3348: FSUBq	dis not found

	.word 0xbb50c000  ! 3356: RDPR_TT	<illegal instruction>
	.word 0xb5a00540  ! 3357: FSQRTd	fsqrt	
	.word 0xb5aa4820  ! 3362: FMOVNE	fmovs	%fcc1, %f0, %f26
	.word 0xb7abc820  ! 3363: FMOVVC	fmovs	%fcc1, %f0, %f27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb3643801  ! 3370: MOVcc_I	<illegal instruction>
	.word 0xb1a80420  ! 3372: FMOVRZ	dis not found

	.word 0xbfaac820  ! 3378: FMOVGE	fmovs	%fcc1, %f0, %f31
	setx	0x20230, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a80c20  ! 3380: FMOVRLZ	dis not found

	.word 0xbda9c820  ! 3388: FMOVVS	fmovs	%fcc1, %f0, %f30
	.word 0xb5aa0820  ! 3397: FMOVA	fmovs	%fcc1, %f0, %f26
	.word 0xb7a00540  ! 3401: FSQRTd	fsqrt	
	setx	0x221, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa54820  ! 3413: FADDs	fadds	%f21, %f0, %f31
	.word 0xb7ab8820  ! 3414: FMOVPOS	fmovs	%fcc1, %f0, %f27
	.word 0xbfabc820  ! 3415: FMOVVC	fmovs	%fcc1, %f0, %f31
	.word 0xb1a00520  ! 3418: FSQRTs	fsqrt	
	.word 0xbfa4c8c0  ! 3419: FSUBd	fsubd	%f50, %f0, %f62
	.word 0xb0858000  ! 3426: ADDcc_R	addcc 	%r22, %r0, %r24
	.word 0xb1a9c820  ! 3433: FMOVVS	fmovs	%fcc1, %f0, %f24
	.word 0xb9a48940  ! 3434: FMULd	fmuld	%f18, %f0, %f28
	.word 0xb5aac820  ! 3436: FMOVGE	fmovs	%fcc1, %f0, %f26
	.word 0xbd520000  ! 3439: RDPR_PIL	<illegal instruction>
	.word 0xbda80420  ! 3441: FMOVRZ	dis not found

	setx	data_start_7, %g1, %r22
	.word 0xb1a84820  ! 3447: FMOVE	fmovs	%fcc1, %f0, %f24
	ta	T_CHANGE_HPRIV
	.word 0x81982f59  ! 3450: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f59, %hpstate
	.word 0xb9a508a0  ! 3454: FSUBs	fsubs	%f20, %f0, %f28
	.word 0xb3a94820  ! 3455: FMOVCS	fmovs	%fcc1, %f0, %f25
	setx	0x10305, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3518000  ! 3459: RDPR_PSTATE	<illegal instruction>
	.word 0xbba5c8a0  ! 3460: FSUBs	fsubs	%f23, %f0, %f29
	.word 0xb0c48000  ! 3462: ADDCcc_R	addccc 	%r18, %r0, %r24
	.word 0xb89ce0e0  ! 3463: XORcc_I	xorcc 	%r19, 0x00e0, %r28
	.word 0xb7abc820  ! 3468: FMOVVC	fmovs	%fcc1, %f0, %f27
	.word 0xb9a54960  ! 3469: FMULq	dis not found

	setx	0x237, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa449a0  ! 3472: FDIVs	fdivs	%f17, %f0, %f31
	.word 0xbba54860  ! 3473: FADDq	dis not found

	setx	0x1020e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1518000  ! 3477: RDPR_PSTATE	<illegal instruction>
	.word 0xbba40940  ! 3479: FMULd	fmuld	%f16, %f0, %f60
	.word 0x89946021  ! 3481: WRPR_TICK_I	wrpr	%r17, 0x0021, %tick
	.word 0xbba84820  ! 3486: FMOVE	fmovs	%fcc1, %f0, %f29
	.word 0xb9a80820  ! 3487: FMOVRLEZ	fmovs	%fcc1, %f0, %f28
	.word 0xbbaa0820  ! 3489: FMOVA	fmovs	%fcc1, %f0, %f29
	.word 0xbda90820  ! 3491: FMOVLEU	fmovs	%fcc1, %f0, %f30
	ta	T_CHANGE_HPRIV
	.word 0x81982dc1  ! 3498: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dc1, %hpstate
	.word 0xbfa90820  ! 3499: FMOVLEU	fmovs	%fcc1, %f0, %f31
	.word 0xbcad21b7  ! 3503: ANDNcc_I	andncc 	%r20, 0x01b7, %r30
	.word 0xbd510000  ! 3505: RDPR_TICK	<illegal instruction>
	.word 0xb5a81c20  ! 3506: FMOVRGEZ	dis not found

	.word 0xb3a80c20  ! 3509: FMOVRLZ	dis not found

	.word 0xbfa448e0  ! 3516: FSUBq	dis not found

	setx	data_start_1, %g1, %r18
	setx	0x1032b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa98820  ! 3527: FMOVNEG	fmovs	%fcc1, %f0, %f31
	.word 0xbf518000  ! 3528: RDPR_PSTATE	<illegal instruction>
	setx	0x2012d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5a589e0  ! 3531: FDIVq	dis not found

	.word 0x8d942052  ! 3532: WRPR_PSTATE_I	wrpr	%r16, 0x0052, %pstate
	.word 0xbda00040  ! 3533: FMOVd	fmovd	%f0, %f30
	.word 0xb3a5c9a0  ! 3534: FDIVs	fdivs	%f23, %f0, %f25
	.word 0xb9a98820  ! 3536: FMOVNEG	fmovs	%fcc1, %f0, %f28
	.word 0xbd510000  ! 3539: RDPR_TICK	<illegal instruction>
	.word 0xbdaa4820  ! 3542: FMOVNE	fmovs	%fcc1, %f0, %f30
	.word 0xbb50c000  ! 3544: RDPR_TT	<illegal instruction>
	.word 0x8795e071  ! 3547: WRPR_TT_I	wrpr	%r23, 0x0071, %tt
	.word 0xbb540000  ! 3550: RDPR_GL	<illegal instruction>
	.word 0xb3ab4820  ! 3555: FMOVCC	fmovs	%fcc1, %f0, %f25
	.word 0x8594e095  ! 3560: WRPR_TSTATE_I	wrpr	%r19, 0x0095, %tstate
	.word 0xb7a58840  ! 3564: FADDd	faddd	%f22, %f0, %f58
	.word 0xbdaa4820  ! 3566: FMOVNE	fmovs	%fcc1, %f0, %f30
	.word 0x8394619a  ! 3567: WRPR_TNPC_I	wrpr	%r17, 0x019a, %tnpc
	mov	1, %r12
	.word 0x8f932000  ! 3568: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0x8594a0aa  ! 3570: WRPR_TSTATE_I	wrpr	%r18, 0x00aa, %tstate
	.word 0xb9a54940  ! 3571: FMULd	fmuld	%f52, %f0, %f28
	.word 0xba3dc000  ! 3572: XNOR_R	xnor 	%r23, %r0, %r29
	.word 0xbda488e0  ! 3574: FSUBq	dis not found

	.word 0xb135d000  ! 3576: SRLX_R	srlx	%r23, %r0, %r24
	.word 0xbda4c940  ! 3579: FMULd	fmuld	%f50, %f0, %f30
	.word 0x8194e1e7  ! 3584: WRPR_TPC_I	wrpr	%r19, 0x01e7, %tpc
	.word 0xba14c000  ! 3587: OR_R	or 	%r19, %r0, %r29
	.word 0xb934c000  ! 3590: SRL_R	srl 	%r19, %r0, %r28
	.word 0xb3508000  ! 3591: RDPR_TSTATE	<illegal instruction>
	setx	0x19, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7a81820  ! 3594: FMOVRGZ	fmovs	%fcc3, %f0, %f27
	.word 0x81952151  ! 3595: WRPR_TPC_I	wrpr	%r20, 0x0151, %tpc
	.word 0xbba408a0  ! 3599: FSUBs	fsubs	%f16, %f0, %f29
	.word 0xb1a54940  ! 3600: FMULd	fmuld	%f52, %f0, %f24
	.word 0xbfa50840  ! 3601: FADDd	faddd	%f20, %f0, %f62
	.word 0xb2ac603f  ! 3602: ANDNcc_I	andncc 	%r17, 0x003f, %r25
	.word 0x8395e020  ! 3603: WRPR_TNPC_I	wrpr	%r23, 0x0020, %tnpc
	.word 0xbdab4820  ! 3604: FMOVCC	fmovs	%fcc1, %f0, %f30
	.word 0xb9a00540  ! 3605: FSQRTd	fsqrt	
	.word 0xbda94820  ! 3608: FMOVCS	fmovs	%fcc1, %f0, %f30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb350c000  ! 3615: RDPR_TT	<illegal instruction>
	.word 0xbda58820  ! 3616: FADDs	fadds	%f22, %f0, %f30
	.word 0xb1a00540  ! 3620: FSQRTd	fsqrt	
	.word 0xbba448a0  ! 3621: FSUBs	fsubs	%f17, %f0, %f29
	.word 0xb5a80820  ! 3622: FMOVN	fmovs	%fcc1, %f0, %f26
	mov	0, %r12
	.word 0x8f932000  ! 3625: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0x839461d5  ! 3626: WRPR_TNPC_I	wrpr	%r17, 0x01d5, %tnpc
	.word 0xb1520000  ! 3627: RDPR_PIL	<illegal instruction>
	setx	data_start_3, %g1, %r21
	.word 0xb1a80420  ! 3632: FMOVRZ	dis not found

	.word 0x8594e11b  ! 3633: WRPR_TSTATE_I	wrpr	%r19, 0x011b, %tstate
	setx	data_start_4, %g1, %r22
	.word 0xbbabc820  ! 3638: FMOVVC	fmovs	%fcc1, %f0, %f29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbfa509e0  ! 3659: FDIVq	dis not found

	.word 0x8395a079  ! 3660: WRPR_TNPC_I	wrpr	%r22, 0x0079, %tnpc
	.word 0xb5a8c820  ! 3661: FMOVL	fmovs	%fcc1, %f0, %f26
	setx	0x30138, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5500000  ! 3665: RDPR_TPC	<illegal instruction>
	setx	0x30218, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a5c9e0  ! 3667: FDIVq	dis not found

	.word 0xb5a81c20  ! 3668: FMOVRGEZ	dis not found

	.word 0xb7a58840  ! 3669: FADDd	faddd	%f22, %f0, %f58
	.word 0xb1a81c20  ! 3671: FMOVRGEZ	dis not found

	.word 0xbe2420f3  ! 3672: SUB_I	sub 	%r16, 0x00f3, %r31
	.word 0xb9510000  ! 3676: RDPR_TICK	<illegal instruction>
	.word 0xba840000  ! 3681: ADDcc_R	addcc 	%r16, %r0, %r29
	setx	0x10028, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbdab0820  ! 3685: FMOVGU	fmovs	%fcc1, %f0, %f30
	.word 0xb9a408c0  ! 3686: FSUBd	fsubd	%f16, %f0, %f28
	.word 0xb7a8c820  ! 3687: FMOVL	fmovs	%fcc1, %f0, %f27
	setx	0x2022d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8d9460ed  ! 3692: WRPR_PSTATE_I	wrpr	%r17, 0x00ed, %pstate
	setx	0x22b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbba00560  ! 3699: FSQRTq	fsqrt	
	.word 0x8995e1d5  ! 3701: WRPR_TICK_I	wrpr	%r23, 0x01d5, %tick
	setx	data_start_4, %g1, %r20
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	setx	0x10314, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1aa4820  ! 3709: FMOVNE	fmovs	%fcc1, %f0, %f24
	.word 0x91956057  ! 3712: WRPR_PIL_I	wrpr	%r21, 0x0057, %pil
	ta	T_CHANGE_HPRIV
	.word 0x81982a11  ! 3713: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a11, %hpstate
	.word 0xbfa00540  ! 3715: FSQRTd	fsqrt	
	.word 0xb61c8000  ! 3717: XOR_R	xor 	%r18, %r0, %r27
	.word 0xb9a4c8e0  ! 3719: FSUBq	dis not found

	setx	0x3023a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa44820  ! 3729: FADDs	fadds	%f17, %f0, %f31
	.word 0xb935e001  ! 3731: SRL_I	srl 	%r23, 0x0001, %r28
	setx	data_start_3, %g1, %r22
	.word 0x8595a020  ! 3737: WRPR_TSTATE_I	wrpr	%r22, 0x0020, %tstate
	.word 0xbc254000  ! 3738: SUB_R	sub 	%r21, %r0, %r30
	.word 0xbf520000  ! 3739: RDPR_PIL	<illegal instruction>
	.word 0xb0bce04c  ! 3740: XNORcc_I	xnorcc 	%r19, 0x004c, %r24
	setx	0x3f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5a80820  ! 3743: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
	.word 0xbb520000  ! 3744: RDPR_PIL	<illegal instruction>
	.word 0xb5a48860  ! 3745: FADDq	dis not found

	.word 0xb5a81c20  ! 3749: FMOVRGEZ	dis not found

	.word 0x9194e0a9  ! 3754: WRPR_PIL_I	wrpr	%r19, 0x00a9, %pil
	setx	0x30012, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7a5c960  ! 3760: FMULq	dis not found

	.word 0xbfaac820  ! 3762: FMOVGE	fmovs	%fcc1, %f0, %f31
	.word 0xb5a5c820  ! 3765: FADDs	fadds	%f23, %f0, %f26
	.word 0xb5a58840  ! 3766: FADDd	faddd	%f22, %f0, %f26
	.word 0xb1a80820  ! 3767: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
	.word 0xb1a88820  ! 3769: FMOVLE	fmovs	%fcc1, %f0, %f24
	.word 0xb1a80820  ! 3770: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
	.word 0xb7a00560  ! 3775: FSQRTq	fsqrt	
	.word 0xbda88820  ! 3776: FMOVLE	fmovs	%fcc1, %f0, %f30
	.word 0xb5a50840  ! 3777: FADDd	faddd	%f20, %f0, %f26
	.word 0xbc3de12f  ! 3778: XNOR_I	xnor 	%r23, 0x012f, %r30
	.word 0xbda80c20  ! 3780: FMOVRLZ	dis not found

	.word 0xb1abc820  ! 3782: FMOVVC	fmovs	%fcc1, %f0, %f24
	.word 0x8994a099  ! 3783: WRPR_TICK_I	wrpr	%r18, 0x0099, %tick
	.word 0xbf520000  ! 3784: RDPR_PIL	<illegal instruction>
	.word 0xbba4c940  ! 3785: FMULd	fmuld	%f50, %f0, %f60
	setx	0x20236, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7aa0820  ! 3788: FMOVA	fmovs	%fcc1, %f0, %f27
	.word 0xbfa00020  ! 3789: FMOVs	fmovs	%f0, %f31
	.word 0xb1518000  ! 3792: RDPR_PSTATE	<illegal instruction>
	setx	0x10228, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9a80820  ! 3796: FMOVRLEZ	fmovs	%fcc1, %f0, %f28
	.word 0xb7a90820  ! 3797: FMOVLEU	fmovs	%fcc1, %f0, %f27
	.word 0xb3a94820  ! 3804: FMOVCS	fmovs	%fcc1, %f0, %f25
	.word 0xbba4c820  ! 3808: FADDs	fadds	%f19, %f0, %f29
	.word 0xb551c000  ! 3809: RDPR_TL	<illegal instruction>
	.word 0xbda54960  ! 3812: FMULq	dis not found

	.word 0xb0a44000  ! 3813: SUBcc_R	subcc 	%r17, %r0, %r24
	.word 0xb7a94820  ! 3814: FMOVCS	fmovs	%fcc1, %f0, %f27
	.word 0xb7aa4820  ! 3817: FMOVNE	fmovs	%fcc1, %f0, %f27
	.word 0xb52ca001  ! 3818: SLL_I	sll 	%r18, 0x0001, %r26
	.word 0xbfa58840  ! 3819: FADDd	faddd	%f22, %f0, %f62
	.word 0xbf500000  ! 3820: RDPR_TPC	<illegal instruction>
	.word 0xbb508000  ! 3826: RDPR_TSTATE	<illegal instruction>
	.word 0xbfaa8820  ! 3829: FMOVG	fmovs	%fcc1, %f0, %f31
	.word 0xb9a94820  ! 3830: FMOVCS	fmovs	%fcc1, %f0, %f28
	.word 0xbba40860  ! 3834: FADDq	dis not found

	.word 0xbda5c8a0  ! 3841: FSUBs	fsubs	%f23, %f0, %f30
	setx	data_start_2, %g1, %r22
	setx	data_start_3, %g1, %r17
	.word 0xbba81c20  ! 3845: FMOVRGEZ	dis not found

	.word 0xbda54860  ! 3846: FADDq	dis not found

	.word 0xb3a98820  ! 3848: FMOVNEG	fmovs	%fcc1, %f0, %f25
	setx	0x3033e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9a00020  ! 3857: FMOVs	fmovs	%f0, %f28
	.word 0xb9a5c940  ! 3858: FMULd	fmuld	%f54, %f0, %f28
	.word 0xbec5c000  ! 3864: ADDCcc_R	addccc 	%r23, %r0, %r31
	setx	0x23e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbda54940  ! 3867: FMULd	fmuld	%f52, %f0, %f30
	.word 0xb1a00540  ! 3870: FSQRTd	fsqrt	
	.word 0xb1aa8820  ! 3872: FMOVG	fmovs	%fcc1, %f0, %f24
	.word 0xbda48840  ! 3875: FADDd	faddd	%f18, %f0, %f30
	.word 0x8394a124  ! 3876: WRPR_TNPC_I	wrpr	%r18, 0x0124, %tnpc
	setx	0x309, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb80ce093  ! 3878: AND_I	and 	%r19, 0x0093, %r28
	.word 0xb1a80c20  ! 3880: FMOVRLZ	dis not found

	.word 0x9194e1f2  ! 3881: WRPR_PIL_I	wrpr	%r19, 0x01f2, %pil
	.word 0xbda489e0  ! 3882: FDIVq	dis not found

	.word 0xbc94a0b8  ! 3890: ORcc_I	orcc 	%r18, 0x00b8, %r30
	.word 0xbba80820  ! 3900: FMOVN	fmovs	%fcc1, %f0, %f29
	.word 0xb1a00540  ! 3903: FSQRTd	fsqrt	
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbd3d8000  ! 3906: SRA_R	sra 	%r22, %r0, %r30
	mov	2, %r14
	.word 0xa193a000  ! 3909: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	setx	data_start_2, %g1, %r17
	setx	0x30131, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbda40840  ! 3915: FADDd	faddd	%f16, %f0, %f30
	.word 0xbba81420  ! 3918: FMOVRNZ	dis not found

	mov	0, %r14
	.word 0xa193a000  ! 3919: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0x8794e01a  ! 3921: WRPR_TT_I	wrpr	%r19, 0x001a, %tt
	.word 0xb7a5c8a0  ! 3924: FSUBs	fsubs	%f23, %f0, %f27
	.word 0xb7a84820  ! 3926: FMOVE	fmovs	%fcc1, %f0, %f27
	.word 0xb1510000  ! 3927: RDPR_TICK	<illegal instruction>
	.word 0xbfa00540  ! 3929: FSQRTd	fsqrt	
	.word 0xb7a4c9a0  ! 3930: FDIVs	fdivs	%f19, %f0, %f27
	.word 0xbda81820  ! 3932: FMOVRGZ	fmovs	%fcc3, %f0, %f30
	.word 0xb9a81420  ! 3934: FMOVRNZ	dis not found

	.word 0xb1a98820  ! 3937: FMOVNEG	fmovs	%fcc1, %f0, %f24
	.word 0xb1a8c820  ! 3938: FMOVL	fmovs	%fcc1, %f0, %f24
	.word 0xb7a90820  ! 3941: FMOVLEU	fmovs	%fcc1, %f0, %f27
	.word 0x87956174  ! 3942: WRPR_TT_I	wrpr	%r21, 0x0174, %tt
	.word 0xbba94820  ! 3946: FMOVCS	fmovs	%fcc1, %f0, %f29
	setx	0x2023d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1a00020  ! 3949: FMOVs	fmovs	%f0, %f24
	.word 0xb751c000  ! 3954: RDPR_TL	<illegal instruction>
	.word 0x85952165  ! 3955: WRPR_TSTATE_I	wrpr	%r20, 0x0165, %tstate
	.word 0xb7a4c9c0  ! 3956: FDIVd	fdivd	%f50, %f0, %f58
	.word 0xb1500000  ! 3961: RDPR_TPC	<illegal instruction>
	.word 0x85956105  ! 3963: WRPR_TSTATE_I	wrpr	%r21, 0x0105, %tstate
	setx	0x304, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbda4c9e0  ! 3965: FDIVq	dis not found

	.word 0xbda00520  ! 3969: FSQRTs	fsqrt	
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb9a9c820  ! 3973: FMOVVS	fmovs	%fcc1, %f0, %f28
	.word 0xbfa00520  ! 3975: FSQRTs	fsqrt	
	.word 0xb750c000  ! 3976: RDPR_TT	<illegal instruction>
	.word 0xb7a4c920  ! 3978: FMULs	fmuls	%f19, %f0, %f27
	.word 0xb1a98820  ! 3981: FMOVNEG	fmovs	%fcc1, %f0, %f24
	.word 0xbb508000  ! 3982: RDPR_TSTATE	<illegal instruction>
	.word 0xb9aac820  ! 3983: FMOVGE	fmovs	%fcc1, %f0, %f28
	.word 0xb3a88820  ! 3988: FMOVLE	fmovs	%fcc1, %f0, %f25
	.word 0xb43cc000  ! 3989: XNOR_R	xnor 	%r19, %r0, %r26
	.word 0xbda40920  ! 3992: FMULs	fmuls	%f16, %f0, %f30
	.word 0xb9a94820  ! 3994: FMOVCS	fmovs	%fcc1, %f0, %f28
	setx	0x3003d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81982bc9  ! 4008: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bc9, %hpstate
	.word 0xb9a81420  ! 4010: FMOVRNZ	dis not found

	setx	0x2000f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1a94820  ! 4013: FMOVCS	fmovs	%fcc1, %f0, %f24
	.word 0xb5a00540  ! 4017: FSQRTd	fsqrt	
	.word 0x8795a0ad  ! 4018: WRPR_TT_I	wrpr	%r22, 0x00ad, %tt
	setx	data_start_3, %g1, %r23
	setx	0x20017, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x30216, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81982bc1  ! 4027: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bc1, %hpstate
	.word 0xb4ad0000  ! 4028: ANDNcc_R	andncc 	%r20, %r0, %r26
	setx	0x2020c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1a90820  ! 4031: FMOVLEU	fmovs	%fcc1, %f0, %f24
	.word 0xb7a9c820  ! 4032: FMOVVS	fmovs	%fcc1, %f0, %f27
	setx	0x130, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a448a0  ! 4034: FSUBs	fsubs	%f17, %f0, %f25
	.word 0xbb500000  ! 4035: RDPR_TPC	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81983d5b  ! 4036: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d5b, %hpstate
	.word 0xb5ab0820  ! 4038: FMOVGU	fmovs	%fcc1, %f0, %f26
	setx	0x10213, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbd500000  ! 4041: RDPR_TPC	<illegal instruction>
	.word 0xb20dc000  ! 4044: AND_R	and 	%r23, %r0, %r25
	.word 0xb7a4c8e0  ! 4045: FSUBq	dis not found

	.word 0xb9a90820  ! 4046: FMOVLEU	fmovs	%fcc1, %f0, %f28
	.word 0xbfa58860  ! 4048: FADDq	dis not found

	.word 0xbba4c820  ! 4049: FADDs	fadds	%f19, %f0, %f29
	.word 0xb9ab0820  ! 4050: FMOVGU	fmovs	%fcc1, %f0, %f28
	.word 0xbd510000  ! 4055: RDPR_TICK	<illegal instruction>
	ta	T_CHANGE_HPRIV
	.word 0x81982c41  ! 4057: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c41, %hpstate
	.word 0xb3a00560  ! 4060: FSQRTq	fsqrt	
	.word 0xb7a4c820  ! 4062: FADDs	fadds	%f19, %f0, %f27
	.word 0xb3a4c8a0  ! 4066: FSUBs	fsubs	%f19, %f0, %f25
	.word 0xb9a00560  ! 4067: FSQRTq	fsqrt	
	.word 0xb1a00560  ! 4073: FSQRTq	fsqrt	
	setx	data_start_4, %g1, %r19
	.word 0xbd520000  ! 4076: RDPR_PIL	<illegal instruction>
	.word 0xb7aa8820  ! 4077: FMOVG	fmovs	%fcc1, %f0, %f27
	.word 0xbfa80820  ! 4080: FMOVN	fmovs	%fcc1, %f0, %f31
	setx	0x3000a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1a409e0  ! 4085: FDIVq	dis not found

	.word 0xbfa449c0  ! 4088: FDIVd	fdivd	%f48, %f0, %f62
	.word 0xb1a40820  ! 4093: FADDs	fadds	%f16, %f0, %f24
	.word 0xb5a81820  ! 4094: FMOVRGZ	fmovs	%fcc3, %f0, %f26
	setx	0x20b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbda00540  ! 4098: FSQRTd	fsqrt	
	.word 0xb5a44960  ! 4102: FMULq	dis not found

	.word 0xb1ab4820  ! 4104: FMOVCC	fmovs	%fcc1, %f0, %f24
	.word 0xb7510000  ! 4109: RDPR_TICK	<illegal instruction>
	.word 0xbbaa0820  ! 4111: FMOVA	fmovs	%fcc1, %f0, %f29
	ta	T_CHANGE_HPRIV
	.word 0x81982f51  ! 4112: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f51, %hpstate
	.word 0xb5a54820  ! 4113: FADDs	fadds	%f21, %f0, %f26
	.word 0xb9500000  ! 4119: RDPR_TPC	<illegal instruction>
	.word 0xb1a88820  ! 4121: FMOVLE	fmovs	%fcc1, %f0, %f24
	.word 0xb7a5c9c0  ! 4122: FDIVd	fdivd	%f54, %f0, %f58
	.word 0xb9a4c9e0  ! 4127: FDIVq	dis not found

	setx	0x10011, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5a54960  ! 4130: FMULq	dis not found

	.word 0xbba00540  ! 4138: FSQRTd	fsqrt	
	.word 0xbba508c0  ! 4139: FSUBd	fsubd	%f20, %f0, %f60
	.word 0xb3a5c920  ! 4148: FMULs	fmuls	%f23, %f0, %f25
	.word 0xb9a4c920  ! 4152: FMULs	fmuls	%f19, %f0, %f28
	mov	2, %r12
	.word 0x8f932000  ! 4153: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xbba58840  ! 4156: FADDd	faddd	%f22, %f0, %f60
	mov	2, %r12
	.word 0x8f932000  ! 4157: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	setx	0x24, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81983a5b  ! 4160: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a5b, %hpstate
	.word 0xb1a00520  ! 4161: FSQRTs	fsqrt	
	setx	0x30134, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x8595a0bc  ! 4165: WRPR_TSTATE_I	wrpr	%r22, 0x00bc, %tstate
	.word 0xbba88820  ! 4166: FMOVLE	fmovs	%fcc1, %f0, %f29
	ta	T_CHANGE_HPRIV
	.word 0x81983dcb  ! 4167: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1dcb, %hpstate
	.word 0xb5510000  ! 4168: RDPR_TICK	<illegal instruction>
	.word 0x8595605b  ! 4170: WRPR_TSTATE_I	wrpr	%r21, 0x005b, %tstate
	ta	T_CHANGE_HPRIV
	.word 0x81983cc3  ! 4171: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1cc3, %hpstate
	setx	0x10034, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a5c8c0  ! 4173: FSUBd	fsubd	%f54, %f0, %f56
	.word 0xbcc5e0ac  ! 4174: ADDCcc_I	addccc 	%r23, 0x00ac, %r30
	.word 0xb3a54820  ! 4175: FADDs	fadds	%f21, %f0, %f25
	setx	0xc, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbda44860  ! 4178: FADDq	dis not found

	.word 0xb3a81420  ! 4182: FMOVRNZ	dis not found

	.word 0xb1aa8820  ! 4183: FMOVG	fmovs	%fcc1, %f0, %f24
	.word 0xb9480000  ! 4185: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xb7a00540  ! 4188: FSQRTd	fsqrt	
	.word 0xb8bce178  ! 4191: XNORcc_I	xnorcc 	%r19, 0x0178, %r28
	.word 0xbb3c2001  ! 4192: SRA_I	sra 	%r16, 0x0001, %r29
	.word 0xbba48920  ! 4194: FMULs	fmuls	%f18, %f0, %f29
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbeadc000  ! 4197: ANDNcc_R	andncc 	%r23, %r0, %r31
	.word 0xb9a409e0  ! 4199: FDIVq	dis not found

	setx	0x2021f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9a84820  ! 4205: FMOVE	fmovs	%fcc1, %f0, %f28
	.word 0xb7a00560  ! 4206: FSQRTq	fsqrt	
	.word 0xbfa509e0  ! 4207: FDIVq	dis not found

	setx	data_start_3, %g1, %r21
	.word 0xb5a9c820  ! 4212: FMOVVS	fmovs	%fcc1, %f0, %f26
	setx	data_start_3, %g1, %r22
	.word 0xb7a4c920  ! 4215: FMULs	fmuls	%f19, %f0, %f27
	.word 0xb7a00040  ! 4216: FMOVd	fmovd	%f0, %f58
	.word 0xb5480000  ! 4218: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xbf540000  ! 4221: RDPR_GL	<illegal instruction>
	.word 0xb5a98820  ! 4222: FMOVNEG	fmovs	%fcc1, %f0, %f26
	.word 0xbba00520  ! 4223: FSQRTs	fsqrt	
	.word 0xbd51c000  ! 4225: RDPR_TL	<illegal instruction>
	setx	0x10226, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbda409c0  ! 4228: FDIVd	fdivd	%f16, %f0, %f30
	.word 0x8794a008  ! 4229: WRPR_TT_I	wrpr	%r18, 0x0008, %tt
	setx	0x2021e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbda80820  ! 4234: FMOVRLEZ	fmovs	%fcc1, %f0, %f30
	.word 0xb9a8c820  ! 4235: FMOVL	fmovs	%fcc1, %f0, %f28
	.word 0xb7356001  ! 4236: SRL_I	srl 	%r21, 0x0001, %r27
	setx	0x30128, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbc0ca024  ! 4238: AND_I	and 	%r18, 0x0024, %r30
	.word 0xbda80820  ! 4239: FMOVN	fmovs	%fcc1, %f0, %f30
	.word 0xbba408e0  ! 4245: FSUBq	dis not found

	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbda90820  ! 4248: FMOVLEU	fmovs	%fcc1, %f0, %f30
	.word 0xb151c000  ! 4252: RDPR_TL	<illegal instruction>
	.word 0xb3518000  ! 4253: RDPR_PSTATE	<illegal instruction>
	.word 0xbbabc820  ! 4258: FMOVVC	fmovs	%fcc1, %f0, %f29
	setx	0x337, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3abc820  ! 4262: FMOVVC	fmovs	%fcc1, %f0, %f25
	.word 0xb9a58940  ! 4268: FMULd	fmuld	%f22, %f0, %f28
	.word 0xb5a84820  ! 4269: FMOVE	fmovs	%fcc1, %f0, %f26
	.word 0xb9a00560  ! 4271: FSQRTq	fsqrt	
	.word 0xbfa00020  ! 4276: FMOVs	fmovs	%f0, %f31
	.word 0xb7a00020  ! 4278: FMOVs	fmovs	%f0, %f27
	setx	data_start_2, %g1, %r18
	.word 0xb9a84820  ! 4284: FMOVE	fmovs	%fcc1, %f0, %f28
	setx	0x1001e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5a94820  ! 4287: FMOVCS	fmovs	%fcc1, %f0, %f26
	.word 0xb1a00520  ! 4288: FSQRTs	fsqrt	
	.word 0xbda00540  ! 4289: FSQRTd	fsqrt	
	.word 0xb1a84820  ! 4290: FMOVE	fmovs	%fcc1, %f0, %f24
	.word 0xb9504000  ! 4293: RDPR_TNPC	<illegal instruction>
	.word 0xb5a88820  ! 4294: FMOVLE	fmovs	%fcc1, %f0, %f26
	.word 0x8394a1f1  ! 4298: WRPR_TNPC_I	wrpr	%r18, 0x01f1, %tnpc
	.word 0xb3a00520  ! 4300: FSQRTs	fsqrt	
	setx	0x30328, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5a81820  ! 4303: FMOVRGZ	fmovs	%fcc3, %f0, %f26
	.word 0xb350c000  ! 4304: RDPR_TT	<illegal instruction>
	.word 0xb5a5c9c0  ! 4305: FDIVd	fdivd	%f54, %f0, %f26
	.word 0xbba00540  ! 4307: FSQRTd	fsqrt	
	.word 0xbfa94820  ! 4308: FMOVCS	fmovs	%fcc1, %f0, %f31
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb7a81820  ! 4312: FMOVRGZ	fmovs	%fcc3, %f0, %f27
	.word 0xb9a94820  ! 4313: FMOVCS	fmovs	%fcc1, %f0, %f28
	.word 0xb3520000  ! 4317: RDPR_PIL	<illegal instruction>
	setx	0x10207, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3520000  ! 4322: RDPR_PIL	<illegal instruction>
	.word 0xb951c000  ! 4324: RDPR_TL	<illegal instruction>
	.word 0xb5a98820  ! 4328: FMOVNEG	fmovs	%fcc1, %f0, %f26
	.word 0xb1500000  ! 4331: RDPR_TPC	<illegal instruction>
	setx	0x10327, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1a48860  ! 4335: FADDq	dis not found

	setx	0x30100, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r21
	.word 0xb5a8c820  ! 4344: FMOVL	fmovs	%fcc1, %f0, %f26
	.word 0xb3a00520  ! 4350: FSQRTs	fsqrt	
	.word 0xb3aac820  ! 4353: FMOVGE	fmovs	%fcc1, %f0, %f25
	setx	0x2030b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0x9194610c  ! 4356: WRPR_PIL_I	wrpr	%r17, 0x010c, %pil
	.word 0xbfa589e0  ! 4357: FDIVq	dis not found

	.word 0xb1a44820  ! 4359: FADDs	fadds	%f17, %f0, %f24
	.word 0xb3a80420  ! 4361: FMOVRZ	dis not found

	setx	0x30236, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7a449c0  ! 4365: FDIVd	fdivd	%f48, %f0, %f58
	.word 0xbe3c4000  ! 4369: XNOR_R	xnor 	%r17, %r0, %r31
	setx	0x1031e, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1a84820  ! 4373: FMOVE	fmovs	%fcc1, %f0, %f24
	.word 0xb1a80c20  ! 4374: FMOVRLZ	dis not found

	.word 0xb3a58940  ! 4375: FMULd	fmuld	%f22, %f0, %f56
	.word 0xbbaa0820  ! 4381: FMOVA	fmovs	%fcc1, %f0, %f29
	.word 0xb9518000  ! 4385: RDPR_PSTATE	<illegal instruction>
	.word 0xb9a4c8e0  ! 4391: FSUBq	dis not found

	.word 0xb024c000  ! 4393: SUB_R	sub 	%r19, %r0, %r24
	.word 0xb3a58840  ! 4394: FADDd	faddd	%f22, %f0, %f56
	.word 0xb1a9c820  ! 4395: FMOVVS	fmovs	%fcc1, %f0, %f24
	.word 0x919520e6  ! 4397: WRPR_PIL_I	wrpr	%r20, 0x00e6, %pil
	setx	data_start_5, %g1, %r22
	.word 0xb151c000  ! 4400: RDPR_TL	<illegal instruction>
	.word 0xb7508000  ! 4401: RDPR_TSTATE	<illegal instruction>
	setx	0x20222, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa98820  ! 4407: FMOVNEG	fmovs	%fcc1, %f0, %f31
	.word 0xbf500000  ! 4410: RDPR_TPC	<illegal instruction>
	.word 0xbda00520  ! 4412: FSQRTs	fsqrt	
	.word 0x8395e057  ! 4413: WRPR_TNPC_I	wrpr	%r23, 0x0057, %tnpc
	.word 0xb7a50860  ! 4415: FADDq	dis not found

	.word 0xbd480000  ! 4417: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xbfa94820  ! 4418: FMOVCS	fmovs	%fcc1, %f0, %f31
	.word 0xb9a00020  ! 4420: FMOVs	fmovs	%f0, %f28
	.word 0xb3a00020  ! 4423: FMOVs	fmovs	%f0, %f25
	.word 0xb3a58940  ! 4424: FMULd	fmuld	%f22, %f0, %f56
	setx	0x1030f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1a5c9a0  ! 4432: FDIVs	fdivs	%f23, %f0, %f24
	.word 0xb7a00020  ! 4435: FMOVs	fmovs	%f0, %f27
	setx	0x10310, %g1, %o0
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
	.word 0xb7a4c8c0  ! 4443: FSUBd	fsubd	%f50, %f0, %f58
	.word 0x8995a078  ! 4444: WRPR_TICK_I	wrpr	%r22, 0x0078, %tick
	ta	T_CHANGE_HPRIV
	.word 0x819838c1  ! 4445: WRHPR_HPSTATE_I	wrhpr	%r0, 0x18c1, %hpstate
	.word 0xbda509e0  ! 4447: FDIVq	dis not found

	setx	0x19, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa00560  ! 4452: FSQRTq	fsqrt	
	setx	0x1031c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	.word 0x81983d43  ! 4457: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d43, %hpstate
	.word 0x8794a0ac  ! 4460: WRPR_TT_I	wrpr	%r18, 0x00ac, %tt
	.word 0xbb540000  ! 4463: RDPR_GL	<illegal instruction>
	.word 0xb72de001  ! 4465: SLL_I	sll 	%r23, 0x0001, %r27
	.word 0xb1a408a0  ! 4470: FSUBs	fsubs	%f16, %f0, %f24
	setx	0x20330, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa94820  ! 4472: FMOVCS	fmovs	%fcc1, %f0, %f31
	setx	0x10325, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbe444000  ! 4474: ADDC_R	addc 	%r17, %r0, %r31
	.word 0x8d952188  ! 4477: WRPR_PSTATE_I	wrpr	%r20, 0x0188, %pstate
	.word 0xbdaa4820  ! 4481: FMOVNE	fmovs	%fcc1, %f0, %f30
	setx	0x3000d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1a489a0  ! 4485: FDIVs	fdivs	%f18, %f0, %f24
	setx	0x10301, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a588e0  ! 4490: FSUBq	dis not found

	.word 0xbfaac820  ! 4494: FMOVGE	fmovs	%fcc1, %f0, %f31
	.word 0xbda8c820  ! 4496: FMOVL	fmovs	%fcc1, %f0, %f30
	.word 0xb0c5c000  ! 4497: ADDCcc_R	addccc 	%r23, %r0, %r24
	.word 0x8394a02e  ! 4499: WRPR_TNPC_I	wrpr	%r18, 0x002e, %tnpc
	.word 0xbc9c0000  ! 4500: XORcc_R	xorcc 	%r16, %r0, %r30
	.word 0xb9a81c20  ! 4501: FMOVRGEZ	dis not found

	setx	0x2033d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbabc820  ! 4506: FMOVVC	fmovs	%fcc1, %f0, %f29
	.word 0xb5a81c20  ! 4509: FMOVRGEZ	dis not found

	.word 0x8994e017  ! 4510: WRPR_TICK_I	wrpr	%r19, 0x0017, %tick
	.word 0xb950c000  ! 4511: RDPR_TT	<illegal instruction>
	.word 0xbf7de401  ! 4513: MOVR_I	movre	%r23, 0x1, %r31
	.word 0xb9641800  ! 4515: MOVcc_R	<illegal instruction>
	.word 0xbb3d9000  ! 4516: SRAX_R	srax	%r22, %r0, %r29
	.word 0xbfaac820  ! 4517: FMOVGE	fmovs	%fcc1, %f0, %f31
	.word 0x85946076  ! 4519: WRPR_TSTATE_I	wrpr	%r17, 0x0076, %tstate
	setx	0x10023, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5abc820  ! 4522: FMOVVC	fmovs	%fcc1, %f0, %f26
	.word 0x8595e104  ! 4523: WRPR_TSTATE_I	wrpr	%r23, 0x0104, %tstate
	.word 0xbfaa0820  ! 4528: FMOVA	fmovs	%fcc1, %f0, %f31
	.word 0xb5a489e0  ! 4531: FDIVq	dis not found

	.word 0x8995619b  ! 4535: WRPR_TICK_I	wrpr	%r21, 0x019b, %tick
	.word 0xbba98820  ! 4536: FMOVNEG	fmovs	%fcc1, %f0, %f29
	setx	0x30212, %g1, %o0
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
	.word 0xb5a90820  ! 4548: FMOVLEU	fmovs	%fcc1, %f0, %f26
	.word 0xb1a9c820  ! 4550: FMOVVS	fmovs	%fcc1, %f0, %f24
	setx	0x10310, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbbab0820  ! 4557: FMOVGU	fmovs	%fcc1, %f0, %f29
	setx	0x132, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfaa4820  ! 4565: FMOVNE	fmovs	%fcc1, %f0, %f31
	.word 0xbeace150  ! 4570: ANDNcc_I	andncc 	%r19, 0x0150, %r31
	.word 0xbfa84820  ! 4573: FMOVE	fmovs	%fcc1, %f0, %f31
	setx	0x10103, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xba9dc000  ! 4575: XORcc_R	xorcc 	%r23, %r0, %r29
	.word 0xb1a50960  ! 4587: FMULq	dis not found

	.word 0xb3a448c0  ! 4588: FSUBd	fsubd	%f48, %f0, %f56
	.word 0xb9abc820  ! 4589: FMOVVC	fmovs	%fcc1, %f0, %f28
	.word 0xb5ab8820  ! 4590: FMOVPOS	fmovs	%fcc1, %f0, %f26
	.word 0xb5aac820  ! 4593: FMOVGE	fmovs	%fcc1, %f0, %f26
	.word 0xbba5c820  ! 4594: FADDs	fadds	%f23, %f0, %f29
	.word 0xb1a8c820  ! 4595: FMOVL	fmovs	%fcc1, %f0, %f24
	.word 0xbf34b001  ! 4597: SRLX_I	srlx	%r18, 0x0001, %r31
	.word 0xb9a4c960  ! 4599: FMULq	dis not found

	.word 0xb9a44860  ! 4601: FADDq	dis not found

	.word 0xbbaa0820  ! 4605: FMOVA	fmovs	%fcc1, %f0, %f29
	setx	0x10112, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7480000  ! 4608: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xbfa80c20  ! 4614: FMOVRLZ	dis not found

	.word 0xbda4c920  ! 4616: FMULs	fmuls	%f19, %f0, %f30
	setx	0x9, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb1ab4820  ! 4619: FMOVCC	fmovs	%fcc1, %f0, %f24
	.word 0xb7a00540  ! 4622: FSQRTd	fsqrt	
	.word 0xb9a80820  ! 4626: FMOVN	fmovs	%fcc1, %f0, %f28
	.word 0xb3a44860  ! 4629: FADDq	dis not found

	.word 0xb2b5a08e  ! 4631: ORNcc_I	orncc 	%r22, 0x008e, %r25
	.word 0xb3a50820  ! 4633: FADDs	fadds	%f20, %f0, %f25
	.word 0xb4946023  ! 4634: ORcc_I	orcc 	%r17, 0x0023, %r26
	.word 0xbb540000  ! 4637: RDPR_GL	<illegal instruction>
	.word 0xb3a80c20  ! 4638: FMOVRLZ	dis not found

	.word 0xb7a00020  ! 4641: FMOVs	fmovs	%f0, %f27
	.word 0xbda40820  ! 4642: FADDs	fadds	%f16, %f0, %f30
	setx	0x20225, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb9a00540  ! 4649: FSQRTd	fsqrt	
	setx	0x20329, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7a80820  ! 4653: FMOVRLEZ	fmovs	%fcc1, %f0, %f27
	.word 0xb3a48940  ! 4654: FMULd	fmuld	%f18, %f0, %f56
	.word 0xb08ca08f  ! 4657: ANDcc_I	andcc 	%r18, 0x008f, %r24
	.word 0xb1a8c820  ! 4661: FMOVL	fmovs	%fcc1, %f0, %f24
	setx	0x208, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbb500000  ! 4667: RDPR_TPC	<illegal instruction>
	.word 0xbdab8820  ! 4676: FMOVPOS	fmovs	%fcc1, %f0, %f30
	.word 0xb5a40860  ! 4678: FADDq	dis not found

	mov	0, %r14
	.word 0xa193a000  ! 4680: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbb348000  ! 4681: SRL_R	srl 	%r18, %r0, %r29
	.word 0xbda548e0  ! 4683: FSUBq	dis not found

	.word 0xb83c8000  ! 4684: XNOR_R	xnor 	%r18, %r0, %r28
	setx	0x10322, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb2144000  ! 4688: OR_R	or 	%r17, %r0, %r25
	.word 0xbd508000  ! 4691: RDPR_TSTATE	<illegal instruction>
	.word 0xb950c000  ! 4694: RDPR_TT	<illegal instruction>
	.word 0xbf540000  ! 4696: RDPR_GL	<illegal instruction>
	setx	0x30127, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa98820  ! 4704: FMOVNEG	fmovs	%fcc1, %f0, %f31
	.word 0xb5a94820  ! 4705: FMOVCS	fmovs	%fcc1, %f0, %f26
	setx	data_start_7, %g1, %r22
	.word 0xb950c000  ! 4708: RDPR_TT	<illegal instruction>
	.word 0xbda80820  ! 4710: FMOVN	fmovs	%fcc1, %f0, %f30
	.word 0xb5a4c8c0  ! 4711: FSUBd	fsubd	%f50, %f0, %f26
	.word 0xb3520000  ! 4712: RDPR_PIL	<illegal instruction>
	.word 0xb7540000  ! 4715: RDPR_GL	<illegal instruction>
	.word 0xb1a8c820  ! 4717: FMOVL	fmovs	%fcc1, %f0, %f24
	.word 0xb7a58820  ! 4718: FADDs	fadds	%f22, %f0, %f27
	.word 0xb3a408c0  ! 4719: FSUBd	fsubd	%f16, %f0, %f56
	.word 0xb7a448a0  ! 4721: FSUBs	fsubs	%f17, %f0, %f27
	.word 0xb1a50820  ! 4722: FADDs	fadds	%f20, %f0, %f24
	.word 0xb3a00560  ! 4723: FSQRTq	fsqrt	
	.word 0xbc34e158  ! 4724: SUBC_I	orn 	%r19, 0x0158, %r30
	.word 0xba3ca0f1  ! 4726: XNOR_I	xnor 	%r18, 0x00f1, %r29
	.word 0xb1520000  ! 4727: RDPR_PIL	<illegal instruction>
	setx	0x20009, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb5a54940  ! 4731: FMULd	fmuld	%f52, %f0, %f26
	setx	0x30, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa90820  ! 4735: FMOVLEU	fmovs	%fcc1, %f0, %f31
	.word 0x8994a015  ! 4738: WRPR_TICK_I	wrpr	%r18, 0x0015, %tick
	setx	0x30223, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xbfa94820  ! 4743: FMOVCS	fmovs	%fcc1, %f0, %f31
	.word 0x8195e0c8  ! 4745: WRPR_TPC_I	wrpr	%r23, 0x00c8, %tpc
	.word 0x91956015  ! 4753: WRPR_PIL_I	wrpr	%r21, 0x0015, %pil
	.word 0xbda00520  ! 4755: FSQRTs	fsqrt	
	.word 0xb5a00020  ! 4756: FMOVs	fmovs	%f0, %f26
	.word 0xbe342048  ! 4758: SUBC_I	orn 	%r16, 0x0048, %r31
	setx	0x3022a, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7a90820  ! 4763: FMOVLEU	fmovs	%fcc1, %f0, %f27
	.word 0xbfa00520  ! 4765: FSQRTs	fsqrt	
	.word 0xbda81420  ! 4766: FMOVRNZ	dis not found

	setx	0x1033d, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a509e0  ! 4768: FDIVq	dis not found

	.word 0xbda588e0  ! 4777: FSUBq	dis not found

	.word 0xb1aa8820  ! 4780: FMOVG	fmovs	%fcc1, %f0, %f24
	mov	0, %r12
	.word 0x8f932000  ! 4782: WRPR_TL_I	wrpr	%r12, 0x0000, %tl
	.word 0xb7a588a0  ! 4785: FSUBs	fsubs	%f22, %f0, %f27
	.word 0xb5a58820  ! 4787: FADDs	fadds	%f22, %f0, %f26
	.word 0xb3510000  ! 4788: RDPR_TICK	<illegal instruction>
	setx	data_start_3, %g1, %r23
	.word 0xb3641800  ! 4799: MOVcc_R	<illegal instruction>
	.word 0xb3a9c820  ! 4802: FMOVVS	fmovs	%fcc1, %f0, %f25
	.word 0xb1ab0820  ! 4803: FMOVGU	fmovs	%fcc1, %f0, %f24
	.word 0xb1a00520  ! 4807: FSQRTs	fsqrt	
	.word 0xbba81c20  ! 4808: FMOVRGEZ	dis not found

	.word 0xb3aac820  ! 4809: FMOVGE	fmovs	%fcc1, %f0, %f25
	.word 0xbfa94820  ! 4811: FMOVCS	fmovs	%fcc1, %f0, %f31
	.word 0xb53c4000  ! 4812: SRA_R	sra 	%r17, %r0, %r26
	.word 0xb1510000  ! 4814: RDPR_TICK	<illegal instruction>
	setx	0x30103, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb7508000  ! 4817: RDPR_TSTATE	<illegal instruction>
	.word 0x8195e010  ! 4819: WRPR_TPC_I	wrpr	%r23, 0x0010, %tpc
	.word 0x8994602b  ! 4820: WRPR_TICK_I	wrpr	%r17, 0x002b, %tick
	.word 0xb150c000  ! 4821: RDPR_TT	<illegal instruction>
	.word 0xbda409c0  ! 4822: FDIVd	fdivd	%f16, %f0, %f30
	setx	0x10307, %g1, %o0
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
	.word 0x8395a199  ! 4832: WRPR_TNPC_I	wrpr	%r22, 0x0199, %tnpc
	setx	data_start_1, %g1, %r16
	.word 0xbfa4c8a0  ! 4836: FSUBs	fsubs	%f19, %f0, %f31
	setx	0x1011b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3a00560  ! 4844: FSQRTq	fsqrt	
	.word 0xb1a00560  ! 4848: FSQRTq	fsqrt	
	.word 0xbda5c940  ! 4852: FMULd	fmuld	%f54, %f0, %f30
	mov	1, %r14
	.word 0xa193a000  ! 4858: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbc940000  ! 4859: ORcc_R	orcc 	%r16, %r0, %r30
	.word 0xb1a5c9a0  ! 4861: FDIVs	fdivs	%f23, %f0, %f24
	.word 0xb3a4c840  ! 4867: FADDd	faddd	%f50, %f0, %f56
	setx	0x30213, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb12d5000  ! 4871: SLLX_R	sllx	%r21, %r0, %r24
	.word 0xba8c216d  ! 4874: ANDcc_I	andcc 	%r16, 0x016d, %r29
	.word 0xb1ab0820  ! 4875: FMOVGU	fmovs	%fcc1, %f0, %f24
	.word 0xb7500000  ! 4877: RDPR_TPC	<illegal instruction>
	setx	0x2001f, %g1, %o0
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
	.word 0xb9a80820  ! 4884: FMOVN	fmovs	%fcc1, %f0, %f28
	setx	0x20028, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_1, %g1, %r21
	.word 0xb1a84820  ! 4889: FMOVE	fmovs	%fcc1, %f0, %f24
	.word 0x8394a169  ! 4892: WRPR_TNPC_I	wrpr	%r18, 0x0169, %tnpc
	.word 0xb5a00540  ! 4893: FSQRTd	fsqrt	
	.word 0xbebc4000  ! 4897: XNORcc_R	xnorcc 	%r17, %r0, %r31
	.word 0xb1a4c920  ! 4898: FMULs	fmuls	%f19, %f0, %f24
	.word 0xbf51c000  ! 4902: RDPR_TL	<illegal instruction>
	.word 0x879421a9  ! 4907: WRPR_TT_I	wrpr	%r16, 0x01a9, %tt
	.word 0xb93d6001  ! 4908: SRA_I	sra 	%r21, 0x0001, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	ta	T_CHANGE_HPRIV
	.word 0x81983c11  ! 4916: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c11, %hpstate
	.word 0x83952075  ! 4919: WRPR_TNPC_I	wrpr	%r20, 0x0075, %tnpc
	.word 0xbf3d6001  ! 4927: SRA_I	sra 	%r21, 0x0001, %r31
	.word 0xb5a408e0  ! 4931: FSUBq	dis not found

	.word 0xbd520000  ! 4934: RDPR_PIL	<illegal instruction>
	.word 0xb3aa4820  ! 4935: FMOVNE	fmovs	%fcc1, %f0, %f25
	.word 0xb1a84820  ! 4938: FMOVE	fmovs	%fcc1, %f0, %f24
	setx	0x23c, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	.word 0xb3480000  ! 4940: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xb3a4c960  ! 4941: FMULq	dis not found

	setx	0x10126, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r22
	.word 0xb9a81820  ! 4947: FMOVRGZ	fmovs	%fcc3, %f0, %f28
	.word 0xbfa489e0  ! 4962: FDIVq	dis not found

	.word 0xb1a54820  ! 4963: FADDs	fadds	%f21, %f0, %f24
	.word 0xb3aa0820  ! 4969: FMOVA	fmovs	%fcc1, %f0, %f25
	mov	0, %r14
	.word 0xa193a000  ! 4971: WRPR_GL_I	wrpr	%r14, 0x0000, %-
	.word 0xbb518000  ! 4973: RDPR_PSTATE	<illegal instruction>
	setx	data_start_7, %g1, %r17
	.word 0xbb51c000  ! 4975: RDPR_TL	<illegal instruction>
	.word 0xb5a5c8e0  ! 4976: FSUBq	dis not found

	.word 0xb9a549a0  ! 4980: FDIVs	fdivs	%f21, %f0, %f28
	setx	0x30332, %g1, %o0
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
	.word 0xb9a449a0  ! 4984: FDIVs	fdivs	%f17, %f0, %f28
	setx	0x1012f, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	0x3012b, %g1, %o0
#ifdef PORTABLE_CORE
	mov	PORTABLE_CORE, %g1
	sllx	%g1, 10, %g1
	or	%o0, %g1, %o0
#endif
	ta	T_SEND_THRD_INTR
	setx	data_start_7, %g1, %r21
	.word 0xb3a5c920  ! 4990: FMULs	fmuls	%f23, %f0, %f25
	.word 0xb3a00040  ! 4992: FMOVd	fmovd	%f0, %f56
	.word 0xb5a4c9a0  ! 4994: FDIVs	fdivs	%f19, %f0, %f26
	.word 0xbe3c6066  ! 4997: XNOR_I	xnor 	%r17, 0x0066, %r31
	.word 0xbe358000  ! 4998: SUBC_R	orn 	%r22, %r0, %r31

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

	.xword	0x8a52c51443f45ab1
	.xword	0x13f5453834944059
	.xword	0x9ebc9aed157593b6
	.xword	0x7758a7ea9f271156
	.xword	0x84b1b1bbb17ccf31
	.xword	0xd396d74885c1b136
	.xword	0x3399f769bc65af26
	.xword	0xee0fe0aecef8ad2e
	.xword	0xe6a3bf561a8c972e
	.xword	0x0d2544aa1ec40b62
	.xword	0x3560c8044f73c376
	.xword	0xb7df32b8b4778ab5
	.xword	0xbdd2486435013dcb
	.xword	0x663851a9f7b31ec4
	.xword	0x440abcae5bb365c8
	.xword	0x54fba345b4c58767
	.xword	0xb8d720ee83d901ee
	.xword	0xae426e7d74d83ac3
	.xword	0xb4e027d227513576
	.xword	0x62ea99ff9b91ec93
	.xword	0xc2de906390d4e315
	.xword	0xb9650ef01e885e7a
	.xword	0x41df7f38852292c8
	.xword	0x2a48c57d398944e9
	.xword	0xbf0805cbcebe86d0
	.xword	0x5f144ee81a7f451d
	.xword	0x5fed08e982d08e95
	.xword	0x8cf16d0bb69ba3ef
	.xword	0x7ae6498fc14df5b8
	.xword	0x050aeb4587f4f440
	.xword	0x304f87daf8239459
	.xword	0x5c5735396fb07c49
	.xword	0xda6034690a54eb4f
	.xword	0xf146347376b39c62
	.xword	0xe024d798de1177a5
	.xword	0x1041c2040d6e0f37
	.xword	0xbe3dceff7c7aa256
	.xword	0xb38ed5697ab59b21
	.xword	0xee7dcaf2be75c88c
	.xword	0xd5442e93df3991fb
	.xword	0x0d72fb435a5c1d96
	.xword	0x764fe2fc14176582
	.xword	0xba751ba06d3960cd
	.xword	0xe84a0e58d46154e5
	.xword	0xa61bd1bd8b0612ff
	.xword	0xc6ce5a1ddba998b9
	.xword	0x852139839e2715d2
	.xword	0x1f982aa9ebf3a046
	.xword	0x08a8d5e5610133a5
	.xword	0xbead21b0305f0992
	.xword	0x167a70f27381e0b6
	.xword	0xae4e9d1954a487df
	.xword	0xfc26d04b4b3a50f9
	.xword	0x671fd717f0892ae0
	.xword	0xdb15ba97f3855b05
	.xword	0x53466c7cf53b2ea7
	.xword	0xf81c30e7bd76a591
	.xword	0x28d17d22440ae7e3
	.xword	0x0368e1f43762001f
	.xword	0x98f19a4016333c57
	.xword	0xc57dbeaef5f35d71
	.xword	0x6025af1051b79e4c
	.xword	0x11eb698eed69fce2
	.xword	0x9a176fc0027d97af
	.xword	0x9bc6600a6e2fc733
	.xword	0x672937d41455040e
	.xword	0xdbe624bf95f55592
	.xword	0xa0c37ff51025724e
	.xword	0x0c211b95fbb6b6f8
	.xword	0x3dcaf162f4781511
	.xword	0xb70517a8caf99004
	.xword	0x1e21ae2342a89ac0
	.xword	0xee99bef436d67bdc
	.xword	0xd3481d5b6f7afc1a
	.xword	0x1b97b15021862c92
	.xword	0x2f6a17ed307c92bb
	.xword	0x78c60e030050f684
	.xword	0x09b0e432939fc8a8
	.xword	0xca0afdaa9bf68b45
	.xword	0x842e06ad7971b032
	.xword	0x75bda01ce5adfdb7
	.xword	0xdd176d27ff25b274
	.xword	0xa6b428bfd581fab3
	.xword	0x4e2e3d1b7c095058
	.xword	0xbb6905aad1f60630
	.xword	0xd615012d71c828d9
	.xword	0xb616c7c85250bb04
	.xword	0x0a2d62b6e4f1c88a
	.xword	0x45ce8449de507c59
	.xword	0x874b212598ef2339
	.xword	0xbc5d3994672b3671
	.xword	0xa31e74c3239269ab
	.xword	0x87c1ba9e6fdcaff3
	.xword	0xf7e3b5a67e8d3353
	.xword	0x6c1fe0fa182d8c39
	.xword	0x652fdf7a76ffa400
	.xword	0xabaf53fd3ed34e57
	.xword	0xe941f3d9e5fcc815
	.xword	0x6036739a425926c5
	.xword	0xd0bbb2679c3d89c8
	.xword	0x7ed3ddc6c1e25230
	.xword	0xc81cd4c6441ff76d
	.xword	0x8bb7e3b88b2fa6bb
	.xword	0xeefc9d2545fae8f0
	.xword	0x8aaa0c1f00e70294
	.xword	0xfbdc8b498931db92
	.xword	0x613eac264233713e
	.xword	0xfca524a810d1c2b2
	.xword	0xa15e3d9f3a554e72
	.xword	0xcb509a4561a207b0
	.xword	0x613bf580c017575b
	.xword	0x6bccc5dc674c6f4f
	.xword	0x0c6a28e5d24878db
	.xword	0x87d389fc549096af
	.xword	0xa86637dd58da569d
	.xword	0x41c6f600ece1a231
	.xword	0x7623df1685c3a8f7
	.xword	0x63d604c7f2a7b554
	.xword	0x9ddfdc25af8aecd0
	.xword	0x96f6ceab2876661f
	.xword	0x3b1b3de2e428aa56
	.xword	0xdcd04994329945ce
	.xword	0xcbf8f58d16d56c8b
	.xword	0xfc3512ac1fa6fa6a
	.xword	0x096cd1014699c260
	.xword	0x8cf911021b814d8e
	.xword	0x6be7d004090ab20c
	.xword	0xb14a9e0c30fc41c3
	.xword	0xf6352d6c2fd7bb2e
	.xword	0xe1a8f3b5712d69f2
	.xword	0x699ceea443f8c813
	.xword	0xdf307c9cf71af963
	.xword	0xc9f9a60cf6fd2cec
	.xword	0x0607ea76a1b9acb2
	.xword	0x9109083e319f8f7d
	.xword	0x37400ba2341c39dc
	.xword	0x720fb18ebfd9d062
	.xword	0x9a516c4ac562fa5f
	.xword	0x92dae2b8fe9a9594
	.xword	0xc42a942aa7454a28
	.xword	0x220cbff371c810ff
	.xword	0x42fecb94bafd037c
	.xword	0xd5bd5549aeb51112
	.xword	0xf623bafc9feaf48b
	.xword	0xd25e903cd7892f51
	.xword	0xdd91d3efc8587c08
	.xword	0x0b63f956d16396ba
	.xword	0x297c020b2bf48af9
	.xword	0xa73dbdb9e2c14428
	.xword	0x243d2ed4a6b2ea41
	.xword	0x33c2ffc8bcf3d257
	.xword	0xa31c8452a5faf965
	.xword	0xd1a6990151e36bce
	.xword	0x3bbf3e8ff06e16de
	.xword	0x0b8372ef4ad5a5d8
	.xword	0x72c4de52d7cfddb7
	.xword	0x63ebcb4622be6a78
	.xword	0x82e2cf50a1cbb4ee
	.xword	0xfa16fbaf8cbb28c3
	.xword	0x8135a0fa5165f340
	.xword	0x2c36821a7c477e44
	.xword	0xa9f19856d2eb8b33
	.xword	0xb80ace6bab27dcf1
	.xword	0xdfd2296519cab324
	.xword	0xabc35719e1c3c344
	.xword	0xee14ceafe726a345
	.xword	0x28295266c35a1da3
	.xword	0x290bccfb5ab6092d
	.xword	0xa2a1bc3755c99ee3
	.xword	0x8e198d4fc078728e
	.xword	0xca47f4b7efe531e2
	.xword	0xd0a5bace65946a3a
	.xword	0x10dc76e290df64e0
	.xword	0x7fd338089c372479
	.xword	0x645fcab726a174d3
	.xword	0xabaf988845621fa9
	.xword	0xa4920fbef6b4330b
	.xword	0xebda657828607bb1
	.xword	0x16910b52481981a1
	.xword	0xbba2e2ae85c3448d
	.xword	0x4982cd80699fea67
	.xword	0x804e66d0a83bf28f
	.xword	0x0ce7a093c9cb493a
	.xword	0x3d7bd5da3d16254f
	.xword	0xe6998d02af8a108b
	.xword	0x0aa340b703ae7643
	.xword	0xfc7f3f539bde0607
	.xword	0xed8babbe50266fc5
	.xword	0xa00f4c31047791de
	.xword	0x83a69af261a43ed0
	.xword	0x8301599839127783
	.xword	0xca3868c17fae1c68
	.xword	0x62fea4ab873c4347
	.xword	0x1a26ff60812c6e1c
	.xword	0x7b13b3979cfbfba3
	.xword	0x31c14762cd962c24
	.xword	0x0ccc5eabb001828c
	.xword	0xa299745a0cca683b
	.xword	0x8fd6bb8dbf647edb
	.xword	0xde746b50752999b0
	.xword	0x0b298924cebc0fcb
	.xword	0x29f7f21f0a4ead86
	.xword	0x079cd6e0d4c3c8b0
	.xword	0x84f7d53690847a16
	.xword	0x1679903eb1871511
	.xword	0xf5228be06ade1986
	.xword	0x3c93e12b786ef584
	.xword	0x7b5e7f28790e52df
	.xword	0x196ff2d3b28edea3
	.xword	0x617fe9b9e120ea28
	.xword	0x0f243466d2752878
	.xword	0x8a0287140ac0196d
	.xword	0x28b8bd1c934a1d49
	.xword	0xfa288b7660cc1d03
	.xword	0x8a3cd95ff87d2f15
	.xword	0x34176036870c1353
	.xword	0x3b1a595a518a5e15
	.xword	0x021077e2f9bd9dee
	.xword	0xa4110fcf0026b533
	.xword	0x9b57f12703948509
	.xword	0xe9cceb2087206aa4
	.xword	0x5d3c7d7275b66372
	.xword	0x239460a5a30f06a0
	.xword	0xe5e0500affc6fab8
	.xword	0x36e4e90776f24dc9
	.xword	0xcb499e93c478be3f
	.xword	0x574d53c81e9d2754
	.xword	0x99941225e323bf53
	.xword	0x9c6a8f17a284193a
	.xword	0x260a0e39a0db10cd
	.xword	0xc1dccd1353259ae0
	.xword	0x7d6e9bcfb07fe6af
	.xword	0x42b9cba7d5d1cb84
	.xword	0x972c6fcacade857e
	.xword	0x81b555fca5081f64
	.xword	0x439382683e5a1644
	.xword	0xd5b3819fe514e480
	.xword	0x02c271dd85243d0e
	.xword	0x34293aad497cc1a6
	.xword	0x63c79998f179257e
	.xword	0x60fd46277add2ae6
	.xword	0x3d2e6151e3699aa5
	.xword	0x9d611636362e07c3
	.xword	0xbde3d8e332ba59c7
	.xword	0x405a63f690ff1f9b
	.xword	0xa3e5d5c5928b5bc6
	.xword	0x77d2a6b9eb4377d9
	.xword	0xd095579f23e24804
	.xword	0x723748436e42f40b
	.xword	0x60860a7e866ec66d
	.xword	0xd091b90539324a28
	.xword	0x694edc03e2691393
	.xword	0xf84bc52473edfdb8
	.xword	0x3991f6690f73f80f
	.xword	0xfedec9143a2a8ab1
	.xword	0xf35173f9c05ebe88
	.align 0x2000
	.data
data_start_1:

	.xword	0xa7136d97ee87b113
	.xword	0x8157619c81063eb4
	.xword	0xee0d73c66966e19d
	.xword	0x368fa66a419e9bbe
	.xword	0xe3a8addef65a5205
	.xword	0x1bdb0a70439f296b
	.xword	0x08bc98002c9e6ae3
	.xword	0x64056ae382c70779
	.xword	0xf1a21fd707ff17b7
	.xword	0xc71a934529db2096
	.xword	0xf7b5c650753b4ffa
	.xword	0xe6aac6495bd829f6
	.xword	0x77acf99df6cd9ddd
	.xword	0x128e04ed52250b71
	.xword	0x70a78f0e822f34b5
	.xword	0x621dfa29711b1b57
	.xword	0xc1124d0e08ded931
	.xword	0x7e993b1afd542666
	.xword	0x3fc750d2fd628d06
	.xword	0xca975f47488e2eef
	.xword	0x332c408a0dd89d52
	.xword	0xa317624514275096
	.xword	0x8e7ee1e87a312598
	.xword	0x692650b9c8d6e7f3
	.xword	0x40cd92b8a1c96a91
	.xword	0x882d42284d3fa520
	.xword	0xe6cbef89fb6fad6e
	.xword	0x22ecb86865bbd3ec
	.xword	0x17bcf000940cbe17
	.xword	0xa8ca329ff73f7d11
	.xword	0xa3a37ccca3e9e106
	.xword	0x301aa8b4d50f5b6d
	.xword	0xfe3be7ba32207dd0
	.xword	0x8c2189a06f576b81
	.xword	0x3e777d80014a3212
	.xword	0xfef885c8f46a4de2
	.xword	0xf79a38454f89a8d7
	.xword	0xa50c442dde201d5d
	.xword	0x343339417275817c
	.xword	0x18b26a2020964511
	.xword	0x1ebd657038cf9d03
	.xword	0xc1af12d298856efe
	.xword	0x9777b8d82b77ff6e
	.xword	0xf8cf58521dc4b9a6
	.xword	0x5629b0bea1493d6d
	.xword	0xf3fcc6f4b98b0ef2
	.xword	0x196bca5591bafae1
	.xword	0xc6cf076530e1a20a
	.xword	0x1fb18cd5f31157cc
	.xword	0x56998fbc6270aea5
	.xword	0x77df81e5f0fd16b2
	.xword	0x4717444e6f76dad5
	.xword	0xefe73f4f0048b0a5
	.xword	0x98828efb6a907b2b
	.xword	0x24c8d9b1c3370b3f
	.xword	0xbb74ea2ac0d460b6
	.xword	0xbeb489c0be445445
	.xword	0x805665b7c1af2dc6
	.xword	0x5fed473b2b1a90a7
	.xword	0xf9cf1e4c92ed99cf
	.xword	0xb6a08fb5084c32de
	.xword	0x166159569f0fc83f
	.xword	0x9288e1ae737af4fe
	.xword	0xdf216d605565d3ca
	.xword	0x99b17e04ad7ff1d2
	.xword	0x73e75ef0782f7272
	.xword	0xc17e1e95583f90a7
	.xword	0x31782bbc1937949e
	.xword	0x8a8e651900dc48e1
	.xword	0x75e2cb41879ba498
	.xword	0x5c309030f65c9859
	.xword	0xb7e0d977ab8bca3d
	.xword	0xbf66d98ea78861cc
	.xword	0xd0820657aed57124
	.xword	0x63a46eb68972a52f
	.xword	0x2ff43b4d4e8bb5b7
	.xword	0xda43caa736c311f1
	.xword	0x50b7f5b9274bf736
	.xword	0x1d48ac8e8f2402a8
	.xword	0xec5c74a96aecb16b
	.xword	0x525512b439ec6d95
	.xword	0xc0ddef6da500e18b
	.xword	0xcc62ba14f3022136
	.xword	0xcf27cb1d06438270
	.xword	0xdd1d9066c1569aa7
	.xword	0x025d1429bc05d611
	.xword	0x84b7d0b29d32456d
	.xword	0x5560e37f6fce07d1
	.xword	0x28c133ddf8aa1a79
	.xword	0xebf3ec3d927635cd
	.xword	0x0514d5f2a2b02190
	.xword	0xc17351af16a1039e
	.xword	0x8d3a7c9e11775e7a
	.xword	0x307afce6b41fd21c
	.xword	0xe20a61ce4adac3cb
	.xword	0x8fedc92031a373fb
	.xword	0x6dee449944f80d82
	.xword	0xb67849799d2a0a78
	.xword	0xe6d0c69f6904fe65
	.xword	0x4f50558c33025676
	.xword	0xe67747ade5f4c2a2
	.xword	0x378219b6239b6226
	.xword	0xfe9c8cce7c34748f
	.xword	0x29fb7b66db48f81e
	.xword	0x29361882785bc2a1
	.xword	0x3c812b9394c3676a
	.xword	0xd96392e2585eff6d
	.xword	0x85a96bb385e515a0
	.xword	0x8a48532673bfbe82
	.xword	0xc84c45ed69a91bc6
	.xword	0xfdab72a4a6a1b861
	.xword	0x52fcfd5e4d271d61
	.xword	0xddcc8e1e8a707596
	.xword	0x4a71cc50e25724fb
	.xword	0x8ad9d4a0d31cf65e
	.xword	0xc723e97bff4b5648
	.xword	0x7fbb23b36d301d52
	.xword	0x552fe0fa8b516fd1
	.xword	0xb84598de0f095be1
	.xword	0x3de7117ed947ffcd
	.xword	0xe8ed2d4e93d91e67
	.xword	0x4b9ccf7a92304493
	.xword	0x8278e824d5802a73
	.xword	0xd385d52310548891
	.xword	0xfe8e802deac88a14
	.xword	0xa61dd1da7ba8f2c1
	.xword	0xb0361f2fcd0115f6
	.xword	0x114015c622f99b43
	.xword	0xdab215dc37b16dda
	.xword	0xa441717fcafcf541
	.xword	0x5b10934148932e9d
	.xword	0x0b46d674ee82bedd
	.xword	0x8cfe305a21c82613
	.xword	0x439ed7855c16b96b
	.xword	0x6236e4668c66a52d
	.xword	0xdf16eacf2279f75a
	.xword	0x64342934b35deed4
	.xword	0x1a4b6d6fdba51058
	.xword	0x3d73d92ff7ba31e3
	.xword	0x3d92fd899c877e44
	.xword	0x8107dc8d475023ad
	.xword	0xcc8e6507240930cf
	.xword	0xb97963663c23e9f4
	.xword	0xd5a7eb9f94a6e876
	.xword	0xfd117ac6af336aa2
	.xword	0x876836c2d415ec81
	.xword	0x8a035f538d31b9fb
	.xword	0x1469a12740c79ffa
	.xword	0x6927231e36d0590b
	.xword	0xbb2059fdf68c7cdb
	.xword	0xbf7c9a6169777d2f
	.xword	0x939d2f2e03d7b847
	.xword	0x30976f64260f9705
	.xword	0x85e838e9eb17c096
	.xword	0x3da1e15bcf140411
	.xword	0x0078ed3d39e5c46b
	.xword	0x7959cf2c1ebb3679
	.xword	0x853560be3d323fc7
	.xword	0x8b3138a1431ed8b1
	.xword	0x1feb50b8158d704e
	.xword	0x303d1416d25bacd7
	.xword	0x684497ba7eaa8573
	.xword	0xa1b261d0f1c6a403
	.xword	0x7162dee51f2c42fc
	.xword	0x11217e90cb06eca3
	.xword	0x11575d3188ec45f0
	.xword	0xdacdd587c5619a90
	.xword	0x0a64783c5421c3d2
	.xword	0x1101d3238bb41c8a
	.xword	0xfaff75ca30abae5b
	.xword	0xab41fb607b059dbe
	.xword	0xe503c52ba504a9a4
	.xword	0xb34c9c25bec9aaeb
	.xword	0x63a645b564272289
	.xword	0xf8ae43eec9e5c25a
	.xword	0xfd260c0b4a29420c
	.xword	0xdcfa3025a8618e58
	.xword	0x4ef2d639a5a5203f
	.xword	0x87210c642a005475
	.xword	0xb0cb2ec63ad168c9
	.xword	0xd9dfc71bdbe48f31
	.xword	0x9aec709e46f7c775
	.xword	0xa636a94cdf6e52b1
	.xword	0xa57b871385318d26
	.xword	0xce7b33bb25e2ec1d
	.xword	0xf7762c122b91b193
	.xword	0x47061d9a6173400c
	.xword	0x77fbb3a0cc0ca407
	.xword	0xf01a458aeb88da48
	.xword	0x95710a724e1d6f9e
	.xword	0x35cfdb622a2cf6c7
	.xword	0x22858cf2bb05ade9
	.xword	0xd6c1a4d4e6450d92
	.xword	0x99951dca2ef6e9a1
	.xword	0x9ad652f237769da0
	.xword	0xed2c9b2da418fee8
	.xword	0x1dcd74fe8e24d994
	.xword	0x8dde138815d59799
	.xword	0x8db849aafe8a0c5a
	.xword	0xdac627664bc0afe7
	.xword	0x59774ba28558efaa
	.xword	0x738c49537433dabc
	.xword	0xa227686563543ad4
	.xword	0x3d13a473f5fc9d92
	.xword	0x58a47e3cc4b12ab1
	.xword	0x96b5fe337341e642
	.xword	0x99693d4701f1c1e8
	.xword	0x97251192649c04f5
	.xword	0x79e030bcb2a1750a
	.xword	0x77013b8e64eed1c6
	.xword	0x65d98b83e28e4109
	.xword	0xb4ed373ba3681aa5
	.xword	0x419d25a6e935c198
	.xword	0x2b716c8ee387e5a0
	.xword	0x1f18e1a521eb5341
	.xword	0xc98767a3d31aedab
	.xword	0x4d3f1f6230d705ea
	.xword	0x5a6bc1946abdb9bb
	.xword	0xb2981a8e5c8c5716
	.xword	0x9ba1ee995fdd0308
	.xword	0x2019cdc7e76130db
	.xword	0x21cfeeb94c75ece6
	.xword	0x49bfe7f5be358a49
	.xword	0x82cbef1cce88034a
	.xword	0xba9ebdf288179fcf
	.xword	0x18a8af3a6af5f585
	.xword	0x2f10c9b0f6e3297a
	.xword	0x01bf29eb5082cce5
	.xword	0x27849b6f5f34f5ba
	.xword	0xaacb968b2767f644
	.xword	0xffeeefb321926e23
	.xword	0x6ef9798784ecc706
	.xword	0xc1da685f182dad1f
	.xword	0x02bfca6c331e5d9b
	.xword	0xeccf46a2ff8f094a
	.xword	0xb76f030fe4f7304c
	.xword	0x7a5de643643b3a53
	.xword	0x97fc4409579ab363
	.xword	0x11169d57574a31b6
	.xword	0x8a91a57c5ddc3575
	.xword	0x00b5c9dc36ddecc8
	.xword	0x30fe9b9066990757
	.xword	0x45188419b8ff5050
	.xword	0xe894e5925936fe7d
	.xword	0x5ffd43b9c5803816
	.xword	0xee0f2334c234e79d
	.xword	0x3f75471093565bbb
	.xword	0x33f62c64cb269e38
	.xword	0xb72e81ddd58e6908
	.xword	0xeccb6b72b1eb7ea0
	.xword	0x690050927c8655bd
	.xword	0xdf8711522f416a18
	.xword	0xdaa7a08a0fcdce64
	.xword	0xab0c83ffe99dc1e5
	.xword	0x6b56f3bddaeeca45
	.xword	0x0f3e5badc49ea450
	.align 0x4000
	.data
data_start_2:

	.xword	0xe559f23e49c5e877
	.xword	0xb5347588d8ae45f1
	.xword	0xd081f9afee859bd5
	.xword	0xe5f5730544d4819c
	.xword	0x61c40a532c0b4a3a
	.xword	0x11329d96d4d9d7bb
	.xword	0xbacf61ef0b415032
	.xword	0xdb3cfb85b6468337
	.xword	0x09d051b96f9ccc36
	.xword	0x8380f9185448ac79
	.xword	0x9592f31350d944be
	.xword	0xb1b78870603eee16
	.xword	0x2b7a31979e3dc3fe
	.xword	0xd44ce92e006b10c4
	.xword	0x3eeb628d617a9f48
	.xword	0x1f12fd0b924e5c5c
	.xword	0xfe4fb8c8ad0c18d0
	.xword	0xa9c80b79d943a59a
	.xword	0xcda7381ea4ca0837
	.xword	0xe374403f33a215d1
	.xword	0xc59c31df0372ebaa
	.xword	0x2f5e57499a07afb4
	.xword	0xcbeed9fdd5bdb4d9
	.xword	0xd2d3cc2345ee76bf
	.xword	0x20d3ce92c107c888
	.xword	0xe092504f274991c7
	.xword	0x63d0a5618d24c3fd
	.xword	0xdb79bdb9bb1c6604
	.xword	0x91295e2024c81a01
	.xword	0x2729d9554423d660
	.xword	0xd09869908f3f5e6e
	.xword	0x7aa4541d6b92594b
	.xword	0x0c5b58feb7b914d2
	.xword	0x7fd0921e8f7cf098
	.xword	0x47e664e845a361da
	.xword	0x3e3ada28ea026814
	.xword	0x49bfb40ff0c97674
	.xword	0x119fa692f61b44ea
	.xword	0xa248131722edbf81
	.xword	0x43940448899dc19d
	.xword	0xccb0b5b1d67f60ab
	.xword	0xbdb6e479e7434c64
	.xword	0x29df4cc81978c5ee
	.xword	0x3649fcc083908e69
	.xword	0x376aaf158bf8a238
	.xword	0xc70fd547114365a8
	.xword	0xa33b723cb4c2494e
	.xword	0xa374359b9f478669
	.xword	0xc7c0af4dc3b49da6
	.xword	0x1f4ebd13f18158e2
	.xword	0xee1c6d27f038032b
	.xword	0x01e93e5ba2b5ab9c
	.xword	0x502913c526e3ffe9
	.xword	0x34e777cae7824fb3
	.xword	0x506bcdd08f872b54
	.xword	0xd1e7ec5896eafa89
	.xword	0x30f1e1ebdbe63a77
	.xword	0x3aad0325e6258dcf
	.xword	0x2904d2341ec96eb2
	.xword	0xd4d921985670a4a2
	.xword	0x3153037805c164a2
	.xword	0xdca401ab2e839933
	.xword	0x60bfcd987d758c49
	.xword	0xe83a2d7a68824dcc
	.xword	0x838f7274e5a8e5aa
	.xword	0xa8bff4dd917adb07
	.xword	0xbfb9260cda33dd8f
	.xword	0x1057ffa35e17bc65
	.xword	0x2efb85caf7476263
	.xword	0x2db8f2817a7c71dc
	.xword	0x6289ee28e1b12080
	.xword	0xd3a258a5a0fb6189
	.xword	0x92d654732883378b
	.xword	0x69a47f6391dd85bf
	.xword	0x8fa0fe69c02da449
	.xword	0xadfc8aa8621bd732
	.xword	0x41345a181f4030a2
	.xword	0xd44205d83baac1a1
	.xword	0x65d480fb11543237
	.xword	0x3bfaff4ce5844607
	.xword	0x82e2660d47c6c888
	.xword	0x323b536c6fba4226
	.xword	0x4ef7207608ae0365
	.xword	0xeafd0d8e0494c8ec
	.xword	0x97196694b13431cb
	.xword	0x17952b47d0e9d1e9
	.xword	0x994b4914bb0a2f49
	.xword	0x37c27b979aaf9bde
	.xword	0x6f2184832da8a32c
	.xword	0xc66851a6cc51d515
	.xword	0x1e64ddb784a0b222
	.xword	0x6612bfc5859be9c7
	.xword	0x99147ddf869897dc
	.xword	0xe64d368dda436b24
	.xword	0x4c5c8f0de8ae557c
	.xword	0xe9128740775df896
	.xword	0xcd6ddc89caa34e0a
	.xword	0x38dbff179f3616b0
	.xword	0xd1f392bcd8bf3918
	.xword	0x64c88ae7c0ad1cb7
	.xword	0x50c917f08d1156d7
	.xword	0xa673595456f24de4
	.xword	0xe979e131c8445924
	.xword	0xb1e86f4cf4d38c5c
	.xword	0xba5a317ae90bfb12
	.xword	0xa16091ed899e524a
	.xword	0x33840d07794f3390
	.xword	0x2dc7c1c0fb85ceca
	.xword	0x85144f4695d976ee
	.xword	0xc993fc439fc653c8
	.xword	0x172c5fdbab337550
	.xword	0x7c5e1a8595406c19
	.xword	0xd2a821c769aacd76
	.xword	0x8962e1d74fbc9254
	.xword	0x47b5a3cee031bd82
	.xword	0xb2610ee2865afc2a
	.xword	0x17506b6d5b6d709e
	.xword	0x9161ccaebc592ae0
	.xword	0x6a80967ba9947e24
	.xword	0x8e4cb455123995a6
	.xword	0x735a66470f934c20
	.xword	0xda6a23394013d0f4
	.xword	0x15728906a0d538f2
	.xword	0xb860ce2e99fc77f1
	.xword	0xbae43f45c6893242
	.xword	0x5ba59d39eff72da1
	.xword	0x6109951068e58c54
	.xword	0xcb4ee81c7af2a17f
	.xword	0x9e0d40cce78f9f2c
	.xword	0xa0f32b69550cf4da
	.xword	0xde5c169cac3716b3
	.xword	0x2b8ab0617b2f2cee
	.xword	0x2434485f37ab8ac9
	.xword	0x98214d569b3c8716
	.xword	0x03d39db31dcf56aa
	.xword	0x890babc8f7622d94
	.xword	0xb39b35071bef569a
	.xword	0x4107faee41f8bbd6
	.xword	0x8589fb380047b869
	.xword	0x9f31728b87c9d48d
	.xword	0xb49919496250814d
	.xword	0x955d76ec4ff798a4
	.xword	0x758299d0a21df0b5
	.xword	0x8804c3f8957324da
	.xword	0xaa7b00206c8cb0ee
	.xword	0x5a638994d56e7b9a
	.xword	0xdfae7591142694dc
	.xword	0x6cea3e024535e561
	.xword	0xae060c843aba841b
	.xword	0xd78c9b68a88866d4
	.xword	0xa1835d17a14eb0de
	.xword	0x254444802c7152b9
	.xword	0x9b0b425c7999885d
	.xword	0x81c606a7cb2d48b9
	.xword	0xc0bbb1ac46d4d090
	.xword	0xbf8109761ad63895
	.xword	0x4aba33fa4a4740d1
	.xword	0xd2b38ea685b8307a
	.xword	0x43c373c29991fbc8
	.xword	0x7b035e9059b50b3e
	.xword	0x095f5c98b42a5312
	.xword	0x7afc3f0031a4c920
	.xword	0xf289ce8516d9c824
	.xword	0xa95f7f16e435d558
	.xword	0xdffe10f53cdd5ca4
	.xword	0xb5ac13c1a42e6855
	.xword	0xee090afce85462bf
	.xword	0x3ff45680f55dc9cf
	.xword	0xf7dc82f762d39f6f
	.xword	0x9a81f48f9b0ee918
	.xword	0x9227619e732a42d9
	.xword	0x1327d9093f920afe
	.xword	0x874b40d5979e690b
	.xword	0x9447184ae6c22ba2
	.xword	0x6bc0828d9f6353d3
	.xword	0x71f47cf184a93512
	.xword	0xd550051ff52c9e55
	.xword	0xe807c3f7df31349f
	.xword	0x02e0460ed8eaf22a
	.xword	0xf480c528850005cc
	.xword	0xb5515f3dd4de4b23
	.xword	0xe96b5e95fab422e8
	.xword	0x996fe57c27bef80c
	.xword	0x4d4cffcc9cb5f5c8
	.xword	0x9964dcca75e3875f
	.xword	0x3fae697f9ea6cc3f
	.xword	0x6df7f5f320f3fb85
	.xword	0xf10f86d28d60febc
	.xword	0xd13294033b11af1e
	.xword	0x3da06a815de61778
	.xword	0xed53360f0d21ccae
	.xword	0x62edc4496f4842e6
	.xword	0xc1632e9b0e51ea95
	.xword	0xcc05dcc631f09a43
	.xword	0x9e1f83933e21d907
	.xword	0x2cf73fb81bd38931
	.xword	0x8bb06ca671058c71
	.xword	0x9d49c42409bb6d1c
	.xword	0x5cd890c707f7c67b
	.xword	0x547f468ba24ab046
	.xword	0x55252616866aefc5
	.xword	0xee83c0d7f75b5439
	.xword	0x19643dd5f9bcf46d
	.xword	0x19561c8c30ef6111
	.xword	0x023c9cbfdea64847
	.xword	0x6721767b287eb4e0
	.xword	0xcf32df83eeada225
	.xword	0x7264b5d94c0edc6e
	.xword	0x1dbf127a11ce0f37
	.xword	0x90b3de4e29cb8c68
	.xword	0x8a42702df4c1194e
	.xword	0x0c30eebd8da393e1
	.xword	0x213e033a5165b471
	.xword	0x48d9f267649c0156
	.xword	0x5a75b7580749a4c4
	.xword	0x7dca1878881fd647
	.xword	0x7886cc73806d115a
	.xword	0xf6928da39950f5a2
	.xword	0xd5a38f8af2d4a41a
	.xword	0x6e5e1a1d984f6032
	.xword	0x5d27f5414ba20771
	.xword	0xbe3931c8cc4f3bc6
	.xword	0xba48f97444a9cf28
	.xword	0x70e3e09fb059547d
	.xword	0xd9f6abb1e14a42ae
	.xword	0x8221136734d59292
	.xword	0xc2d984159d45151f
	.xword	0x5f4fe4ae17e705fe
	.xword	0x99d87a4d6534a713
	.xword	0x2d6112ecbfc95c3f
	.xword	0xad4ce8f64138daae
	.xword	0x4dd5a3c7aea5c738
	.xword	0xaa98077cf06562a6
	.xword	0xc7077365fd536324
	.xword	0x9e6875f3467bfb28
	.xword	0x774b7ab8f2f8bbcc
	.xword	0xd3c06d4516c8ca5c
	.xword	0xc673f7a3a259d176
	.xword	0x2f65d4b6cf2caf48
	.xword	0xc5dec0702a3ee109
	.xword	0x97c9761731da9342
	.xword	0x6f1d0b543b290789
	.xword	0x61cb4922eb0fbb92
	.xword	0xfbe017a9c21af081
	.xword	0x04593e0cbbb7d969
	.xword	0xf1612708326aad81
	.xword	0x63b24284d08ab085
	.xword	0x4d35160eab889dbd
	.xword	0x49c2051f651df590
	.xword	0xb0f0e8cc78272311
	.xword	0xf79fb3de1589ce9a
	.xword	0x891eba40cdbc12e4
	.xword	0x09e2f80c043c3757
	.xword	0x52a734e544f83296
	.xword	0xbcaf5006abfdd57d
	.xword	0xf11ff5e1839da9e6
	.align 0x8000
	.data
data_start_3:

	.xword	0x642cf6381bec2c20
	.xword	0x75be67c9168dc489
	.xword	0xf2d4143a26883561
	.xword	0x45ddc593025169d5
	.xword	0x707a7c3e288207bd
	.xword	0x7181f5edc4a53002
	.xword	0xfbc003543596214d
	.xword	0xc363950bf931be2d
	.xword	0x1b144c81ec863e93
	.xword	0x3d03c7507da2ee9e
	.xword	0x1886a66c090d16a8
	.xword	0x341165085c41847c
	.xword	0x434def90d83cbed3
	.xword	0x43b9b1f3c77f7cb8
	.xword	0xefdb6eff4c602dd0
	.xword	0xe39b045d4e27e43e
	.xword	0x7414df14f291c509
	.xword	0x82d1cbeb0dedcb9e
	.xword	0xf7e714bb7926c7c7
	.xword	0xd1b5bff8a08c2b7d
	.xword	0xa6afb349d897ebf9
	.xword	0xa0a1db108610a887
	.xword	0x64d598cf185a5be9
	.xword	0xe69365afcfa76e5a
	.xword	0x9efc5bd802e1c62d
	.xword	0x19ec3bca913eec78
	.xword	0xcf24dad0c3827001
	.xword	0x26ff1d10877b30db
	.xword	0xc7f168b1f3f72519
	.xword	0x45f4892fb7fc9470
	.xword	0xbac9b400a4df5879
	.xword	0x073ff20c77a8cde9
	.xword	0x3b8dbdce2fea53bd
	.xword	0x10109d1d382eb4ea
	.xword	0x7f0e6047224038dd
	.xword	0x10f967efabce581d
	.xword	0xdfbad619fd9dee91
	.xword	0x5f6b6fcee03d9d65
	.xword	0xab64fc67c75f7c4c
	.xword	0x3b5cd30114469a8a
	.xword	0x990cfdfe8b0d0c02
	.xword	0x99eb97ca96440cd8
	.xword	0xc7ddbf269ba8d143
	.xword	0xf30b26038538e16b
	.xword	0xc9ccff3b5dd64bd5
	.xword	0xd25c857b0af03033
	.xword	0x720c1424ad4da2b9
	.xword	0x675f4193e71206cb
	.xword	0xd968a4decf95b228
	.xword	0x6451e4df18db7e00
	.xword	0xc7a6cd112dc5c1c3
	.xword	0xde9b3917bd8b1946
	.xword	0xfffeeb14c3b507f0
	.xword	0x6231767ebcdd007c
	.xword	0x8ae0ec4a901cd235
	.xword	0xa9819016c4d204bf
	.xword	0x847130f1dad58e75
	.xword	0x5d406b2794866aab
	.xword	0x394538541cbef4ae
	.xword	0x7a0b2babe2d90913
	.xword	0x16eeab8481942b22
	.xword	0x35ca2c6c4edd30b3
	.xword	0xd33657dff7792980
	.xword	0x1d4f043837f0223e
	.xword	0xf5ca99f013319611
	.xword	0xb69b7f5540461efb
	.xword	0x4d5d473e3863813f
	.xword	0x5fd2191108e2a1d9
	.xword	0xb9f070f18c00f33d
	.xword	0x2471ce015f0f9710
	.xword	0x3376cdee4f5fe6c3
	.xword	0x5feb0dbff92ae8ce
	.xword	0xfadcb63fd05d9886
	.xword	0xb261c0a2c1d921db
	.xword	0xeb6bc241fe1e2175
	.xword	0x090cff01145cb12c
	.xword	0x05b6f65f30eda4a5
	.xword	0x851e28cf84a46101
	.xword	0x716216fbc904b021
	.xword	0x7f32cb6fa360f1e2
	.xword	0xa918dfca73a1a208
	.xword	0x4c45de40c7175530
	.xword	0x1d7e1dd845616914
	.xword	0xf622b9bb37d721bb
	.xword	0xf69bc83d72778db7
	.xword	0xe462fb3595461d79
	.xword	0xfa6dfa234d4615f5
	.xword	0x709efd3ebe0d4c6a
	.xword	0xa8b4b2f81fd913e5
	.xword	0x0a4e4504d3040b87
	.xword	0x3062edcb906bd86b
	.xword	0xbc4fb5ac169221d7
	.xword	0xb18e4a02125eb4d7
	.xword	0x56b18d66d224615e
	.xword	0x476583b1e54e8786
	.xword	0x222c092431cd6261
	.xword	0x399d7ec148b23060
	.xword	0x63d0795c68d9c0b7
	.xword	0xaccc8e58e6cd0528
	.xword	0x2cf65899e3251fff
	.xword	0x7e34bab9545ae26c
	.xword	0x33070bf12c2574d9
	.xword	0x4846126d12c04269
	.xword	0xbdd389a842a0eb79
	.xword	0x13d19932edd67137
	.xword	0x4961a3d9939034bb
	.xword	0xcc0abe696e57dc66
	.xword	0x96147b03791daa50
	.xword	0x04ad30ebd88b0494
	.xword	0xf5b1f524bd470fc5
	.xword	0x90244622599b3e09
	.xword	0x222e5e1ea20b1ceb
	.xword	0x146fd5a9b9be5e9e
	.xword	0x24343e170de51b5f
	.xword	0xebeb0ecb3845f1cb
	.xword	0xf5c7abbb316d9084
	.xword	0x892451477fb47a19
	.xword	0x43e80818d4189362
	.xword	0xa60d04c16904de53
	.xword	0x3c7638844ca04f7f
	.xword	0x1b36d7a2aaf8c998
	.xword	0x7b080200ff7de95e
	.xword	0x1214ef758a940383
	.xword	0x46e2536c249bfcda
	.xword	0x644f1c978feba799
	.xword	0x5b6be06885bc8c80
	.xword	0x42e14ded701be333
	.xword	0xf88a4a208cea9aba
	.xword	0x11306f2f26bc5208
	.xword	0xc948838e5fb737eb
	.xword	0x0f58e5c71e475f42
	.xword	0xa968474df592f057
	.xword	0xc7a5c4129b6ee7e5
	.xword	0x7b79fbe6e8a65373
	.xword	0x00be7eb632179ad5
	.xword	0x4568b0a0b564b893
	.xword	0x8484ca7f28b15228
	.xword	0x5106528280d5ba44
	.xword	0x30c77e4d11f04917
	.xword	0x6cde2ba235966d2d
	.xword	0x12268a07999c6cb8
	.xword	0xd3fcb3b181b75735
	.xword	0x7bb83e200eef56d1
	.xword	0xad5f23aa6dcd16e0
	.xword	0x6730c354729ed539
	.xword	0x1755b270055354bc
	.xword	0x259e6c804f63bc63
	.xword	0x39c5885768c018cb
	.xword	0xff516ca77ed16ad1
	.xword	0x7b23e01977ef80f9
	.xword	0x6adc82c4b6a2d77a
	.xword	0x03e3c248773b6a68
	.xword	0xe86c180283f3c69c
	.xword	0x941c9df49ac8c1d2
	.xword	0x810512d2cec3069a
	.xword	0xaa60746aac872ec9
	.xword	0x7d8c51b412d2f01b
	.xword	0x0e12b617142eb65f
	.xword	0x1f6c7fd68704b414
	.xword	0xc820f03dd8e1eea8
	.xword	0xa27a2e6812039d8e
	.xword	0x3dee3e6c5edb48c1
	.xword	0x9c800ab8c9c2bb67
	.xword	0xa18cabee8a189fce
	.xword	0x7ccc4b1dacb15b27
	.xword	0xbeefba5e5c6bfe45
	.xword	0x8d4696306951fa1a
	.xword	0x03ed1a7da3054254
	.xword	0x8419054590cd2e15
	.xword	0x47781574497e97ab
	.xword	0x76571b15494bc0e4
	.xword	0xf2cc90e00978b136
	.xword	0xa81ef8066527752b
	.xword	0x92cfb60cc59a6166
	.xword	0xc93eb9d2d5784533
	.xword	0xb0729589607930f7
	.xword	0x54af07dd9c6d6112
	.xword	0x0b0f39f8b8c6709d
	.xword	0x71ba4f3c20ff1063
	.xword	0x03f286993ee1e448
	.xword	0xf969d0b36f3a9450
	.xword	0x18835ffe70d14f33
	.xword	0xe87c9131933f1522
	.xword	0x7411e2ecae3040d8
	.xword	0x0e6f5d3a14ec3a5f
	.xword	0xb99bc454486e2cec
	.xword	0x5dd176fe70d7217a
	.xword	0x4b20bef944914cd4
	.xword	0x48f3e5b394edbab8
	.xword	0xba963c2636570359
	.xword	0x563a8cd6ba18d310
	.xword	0xc42741776303e18c
	.xword	0x0ee45f042e110bfa
	.xword	0xd26e68f0f6b4c342
	.xword	0xdab04084d4fb66fe
	.xword	0x972c3480bf25a740
	.xword	0x466fbac7b10e262d
	.xword	0x86f7df669e618e54
	.xword	0xf6ca6a6003582401
	.xword	0x768d45258f7b966f
	.xword	0xb69f54812f867b06
	.xword	0xc405c6a84f169b6f
	.xword	0x712fd5393e168a45
	.xword	0xf1bd04afe33f174f
	.xword	0x52c36bfd39a3adfe
	.xword	0x048eec24a307af5e
	.xword	0xd4b668211c393ff6
	.xword	0x61c894e8155e61c5
	.xword	0x30dfc12760e4064b
	.xword	0xa430602266894dfd
	.xword	0xfcf51c6f880890cd
	.xword	0x4d9754eb90c806f8
	.xword	0x351b21241d66a8b1
	.xword	0x63d3a30122bbc86e
	.xword	0x691fb36e3c52bce7
	.xword	0xee66d788003588ca
	.xword	0x5c5b50f300072786
	.xword	0x2e6388f4d7229d7b
	.xword	0xb504b4addac6b899
	.xword	0xd2ce6fdf557e9edc
	.xword	0xae5db22ccc733693
	.xword	0x2b3640eeb292995f
	.xword	0xaeea04b81369fa1e
	.xword	0xbf8b34f2a10975d7
	.xword	0xfae9dbc438fb1619
	.xword	0xd9f11ae196a496b9
	.xword	0xa1dfa698268f255f
	.xword	0x5e811cb43546b604
	.xword	0x60c6bdbce94b9bf4
	.xword	0xb6244c24456c35c6
	.xword	0x2ac4b3ab04782bbf
	.xword	0xe0b33a9f102061b0
	.xword	0x17e355decdd2d5f0
	.xword	0x5dbbb3ff7b236581
	.xword	0xd41ebef9fd1824be
	.xword	0x7675d89b01b8a584
	.xword	0x6cbfc7143e004f9d
	.xword	0x81fef5405a68d912
	.xword	0xd0a8d5c8216380bd
	.xword	0xd19b7bbe364b1e0f
	.xword	0xb86984f53027f32e
	.xword	0xc1eed58e81067c61
	.xword	0x7fa1fd296eae071f
	.xword	0xcc16ce65d7f7458f
	.xword	0x2134331671c4397e
	.xword	0x22ccde4f0f42746f
	.xword	0x6bddc1f5f579b526
	.xword	0x8e31d100e7edab7b
	.xword	0xf11687d73c2385b9
	.xword	0xd6c8fea06c8229cf
	.xword	0xd2baf27f0ea80f04
	.xword	0xb6f61697828a12cf
	.xword	0xb817e286aa001278
	.xword	0xb2afa44fd8b3acf9
	.xword	0x32d901e5e27f4efa
	.xword	0x77f4e534f2b54f6d
	.align 0x10000
	.data
data_start_4:

	.xword	0xc214593a78d7beae
	.xword	0xa914e6a061dd0ce1
	.xword	0xd014fdcf3ab6adba
	.xword	0x73b320d6ac1b60d6
	.xword	0x2675cc9dbb3ba93d
	.xword	0x4eba2a46a22bba28
	.xword	0x99e8519d042d23ec
	.xword	0x6db5d2f97095b17a
	.xword	0x68d0ce34fe4e1b0d
	.xword	0x94787b453bddf114
	.xword	0xce3e9a71f971d34a
	.xword	0xd8ad8208876bd34d
	.xword	0x111f4d401cb66392
	.xword	0xda01728bc0e97f1d
	.xword	0x38a266387366ebcd
	.xword	0x815d6b7e8b097288
	.xword	0x4b7ad8f410d9c290
	.xword	0xab9c6aba430b691b
	.xword	0x76708211a9915daa
	.xword	0xc1531d14218162b7
	.xword	0xf11c0071b99af12f
	.xword	0xef16822fb8824da5
	.xword	0x2f9244f8645eb5bd
	.xword	0xf48e75a3846d3e27
	.xword	0xa51ce4bb94a106a6
	.xword	0x70878345a4c5e524
	.xword	0x1441c03a2150cb06
	.xword	0x4e2da4886bbace29
	.xword	0x8ac7e9125463eb40
	.xword	0xde82800482635999
	.xword	0xfdcc4458798627bb
	.xword	0x19872e20212bb991
	.xword	0x30216ee1feb0b36c
	.xword	0xc00b6a6f34c60829
	.xword	0x6e89358a4154cc5f
	.xword	0x6208021d2a1b9f0b
	.xword	0x716ea4cf290abec0
	.xword	0x919cc0cca2595ac6
	.xword	0x71032c09029e4f24
	.xword	0xb04de891cba9d7fb
	.xword	0x4db18463b9a28dc2
	.xword	0x9cda2b5705a4cefa
	.xword	0x7dc21f1e675ea3f0
	.xword	0x87647711d448601e
	.xword	0x40ce1c2ac7690ed5
	.xword	0xb43531f0b171b10b
	.xword	0x734a12c8fa69f82f
	.xword	0xca15c3c6c0a70ac0
	.xword	0xfbfa4ccea1c838c7
	.xword	0xb40f4c215684b11e
	.xword	0xf462eaa00c868acb
	.xword	0xcd1b3301dbf8a2a0
	.xword	0x71ac08daffdc710b
	.xword	0x4e13ee89766c69df
	.xword	0x38b40303f7827218
	.xword	0xe9e369bcbf74e487
	.xword	0x826f4801cda120e2
	.xword	0xc06d4d206db11bd0
	.xword	0x5d47323830338260
	.xword	0x0bcd49dddc499b29
	.xword	0x9afcefd621eff3c1
	.xword	0x4e8dfe4ee5e470f2
	.xword	0xf8d825e7b2234e00
	.xword	0x07705e08c88a19e5
	.xword	0x3af1961594a26937
	.xword	0x8b7aea9b6a29853c
	.xword	0x237f2eed76543d7d
	.xword	0x86d6a294e6379d55
	.xword	0x6276b14b0d59d99c
	.xword	0x5c37841672a30536
	.xword	0x2fa9a0a988ff3e10
	.xword	0x0a0e4d3923da6d6a
	.xword	0x4233efaf317ec4db
	.xword	0xaf0e80a1117d7779
	.xword	0x92ab890fcc407225
	.xword	0xa448f9b68cbad81e
	.xword	0xad9d673508e3783a
	.xword	0x8dd9929671e75387
	.xword	0x71437177ea98aa1f
	.xword	0xcedc97e470867fda
	.xword	0xfc85ed4d4f2e36bf
	.xword	0x659074614618a4f0
	.xword	0x06ca983afb008356
	.xword	0x262e1dc7993442f6
	.xword	0x9e512fff888e61d1
	.xword	0x96d4fbd1a386555d
	.xword	0x105dc7db041a4733
	.xword	0xa67a78b762b1ab52
	.xword	0xa1419d5307b0cfb0
	.xword	0xc85f0d2ec824c84a
	.xword	0xe2ebd953700bb968
	.xword	0x0661bcbec0e8e68e
	.xword	0xe0cf9a9a31eb3066
	.xword	0x9709642ad62eb002
	.xword	0xf728a36efa3b2920
	.xword	0xef4a6902b2571483
	.xword	0xee6b2c1daa85b5a3
	.xword	0xfb145630e9e0be9d
	.xword	0x17083c1fa905baed
	.xword	0xd03501c2414bf802
	.xword	0x55dd2b3c46d2d006
	.xword	0xf7b27d6c5ca27c2c
	.xword	0xa9efc6257e247e5f
	.xword	0x28ca36568960c740
	.xword	0xd2c4f0735559fa6f
	.xword	0xbcb143489da5117e
	.xword	0xd8f9e4e8343bb974
	.xword	0xfe62169597e1bd5e
	.xword	0xd3ac079f5e894cd5
	.xword	0xc61597a0bef8f1f0
	.xword	0x3bb3e104c62eedef
	.xword	0xc2d30d151126ef04
	.xword	0xfdfa98fa78f3c6fb
	.xword	0x7ab809cb77d864b2
	.xword	0x7d08470a22b11219
	.xword	0x80eaffa49ebb62c6
	.xword	0xdb885d46486a7caf
	.xword	0x7be8e580f123986e
	.xword	0xddb1f7901508f34d
	.xword	0xbd4ecd2660ed8b5a
	.xword	0xd4322783bc9394e9
	.xword	0xe847a10ff7713c99
	.xword	0xf496e6da6c5b5fbb
	.xword	0x55102d8fe9357ba6
	.xword	0xbc37829f60fc0638
	.xword	0xbba98db92d73716e
	.xword	0x16deb48993361b15
	.xword	0x000d48379c35a198
	.xword	0xfa117d7d8315efb4
	.xword	0x06fffed5d2f239ac
	.xword	0x7a3bb2079995d8ac
	.xword	0xa47a4ecc1e05f400
	.xword	0xf17cc460f65919ec
	.xword	0xd245b5f7232c1ce3
	.xword	0x651a23f8a0b2c9c0
	.xword	0x5a87106fe8c99b29
	.xword	0x2a5de5e185cb13e9
	.xword	0x7ad6576b1a37d7ad
	.xword	0x03ae31efb43a5d5b
	.xword	0xadfd98bc3946d422
	.xword	0x65495f3dad98fab3
	.xword	0x59927deb88186423
	.xword	0x1133388591659ec3
	.xword	0xb6eb050092ce0d6b
	.xword	0xc9f3c8a71bb1b15a
	.xword	0x04a3fe50e971e7d9
	.xword	0xa887ddf8577ba9ce
	.xword	0xbb54778f59ffd1c4
	.xword	0x61d94bff73800132
	.xword	0x816508816b9304ff
	.xword	0x69aa17bd0ee068ce
	.xword	0xa07127915dffccb3
	.xword	0xc8bd3bd376815c92
	.xword	0x8d9e9aa47ef5364b
	.xword	0xb67b6d21788c0b71
	.xword	0x64d8c521a1d4c691
	.xword	0xf6fcd493323383c2
	.xword	0x2bf918be5a7d1ce2
	.xword	0xa10c1c1e574213e7
	.xword	0x0fc0c39c769fbe91
	.xword	0x8925f5d6a07f9a0f
	.xword	0x4d016c4552263b17
	.xword	0x23636ca9027ac3a3
	.xword	0x4f799861eb33e6d6
	.xword	0x2cd4307d78de621b
	.xword	0x0f9dd2481a23bae6
	.xword	0xb275472359f04935
	.xword	0xda751cfe2e338001
	.xword	0x98087c9b17eb98d9
	.xword	0x4284417902b76ebf
	.xword	0xdc76fcf59bb00ca1
	.xword	0x1b18c547ebb06f9d
	.xword	0x57a797f047dd8a96
	.xword	0x71126b1fa3018931
	.xword	0xd44bfc8708a362ed
	.xword	0x85d410e43cfac21c
	.xword	0x316f98728c596c66
	.xword	0x19eef19543c2f606
	.xword	0xac0c1f3e1ee4f3c1
	.xword	0xe089c2089a407ad5
	.xword	0xcafa5d264d980ad1
	.xword	0x5bf6894283a105bf
	.xword	0x669dc4af8fb0d9ac
	.xword	0x54f1a21bcfc9e18a
	.xword	0x0781a9bb363d1c8f
	.xword	0x226bcd20a3fa1fac
	.xword	0x69d3563e823869ea
	.xword	0x12b4d2dad257ade0
	.xword	0x55324c1253a596df
	.xword	0xebe792dd3fa07de4
	.xword	0xcd90c44f542566a3
	.xword	0x03bb7e55f0baf450
	.xword	0x577bb63b8d23fafe
	.xword	0x321d7c8ca7a08840
	.xword	0xcd7a6e694d99c1f1
	.xword	0x8553a59e584abbfe
	.xword	0x0f2d918a79383a9c
	.xword	0x35f449fbf2485ddc
	.xword	0x3127f10bca556a66
	.xword	0x2065c9e7b4561e77
	.xword	0x9bcad630b6d3a0cd
	.xword	0xee206fd433b59f9e
	.xword	0xc74e2def2c2a84f0
	.xword	0x211fc48c5e90ee91
	.xword	0x96fe7ebb067893ff
	.xword	0x5a8dfdc51d8b4160
	.xword	0xfdcf72f552491c1d
	.xword	0x49d1f1ce159dc5b5
	.xword	0x2d42c7f16fc40146
	.xword	0xbe2fe00d06c728b3
	.xword	0xfb633a3ed8857d39
	.xword	0x1a73e6104456a8c2
	.xword	0x67e60bd09216b23f
	.xword	0x250777f5a6ed6981
	.xword	0x8497cb55860da730
	.xword	0x3bf3b40ea1a2a7d7
	.xword	0x4e4495b384f1048d
	.xword	0x82e8561eff1db9cf
	.xword	0x65673dcf759cf7ed
	.xword	0x2f166e43094ab7be
	.xword	0x17a67d858b5549b4
	.xword	0xa9c7ae2b6362b805
	.xword	0xdd3fb37836796c60
	.xword	0x0828ac263d0fd65d
	.xword	0x8cdf83c20ad8af7c
	.xword	0xb888afdafbf92a3e
	.xword	0xd211e29b806063a0
	.xword	0xa89bae0a0653c24d
	.xword	0xcf0f6117ac146222
	.xword	0x0328d3fe60c40f1c
	.xword	0x447e02d071e7a646
	.xword	0x23f1b2bb85e83bc8
	.xword	0xe65cd2d337c81381
	.xword	0xe208070081884e88
	.xword	0xa01d62a8568b127e
	.xword	0x54c7c5ea40d3b273
	.xword	0x21f48632680ec82a
	.xword	0x27284ea31d2203e6
	.xword	0xde75b245114bb0aa
	.xword	0x9f9435efe5b2b9ab
	.xword	0xdaf3acc9b2cfa5ae
	.xword	0xbc56193589601ad9
	.xword	0xe6bbe04a730b4a59
	.xword	0xda86285e7f283acc
	.xword	0x1260e2f4ef544f4c
	.xword	0x293d17052ac5d456
	.xword	0x6774c31995a58fce
	.xword	0x0d73e90a839138f0
	.xword	0x416912ed7aa29913
	.xword	0x6b88cf198e74ac35
	.xword	0xf90ef9611bb63add
	.xword	0xc5d88de93bbcc8ec
	.xword	0x3ed6b1de9321608b
	.xword	0x2f17618d56a8c634
	.xword	0x8f99fbc51cf73f50
	.xword	0x140e4b1f35b11a06
	.align 0x20000
	.data
data_start_5:

	.xword	0x1fcc42ee9a694e82
	.xword	0x645f560128509776
	.xword	0x0fee180c7a43c637
	.xword	0x87a59bf0227cde13
	.xword	0x015d12b2b3ed9da4
	.xword	0xa58f16983233ca11
	.xword	0x562de20133133765
	.xword	0x4636b9ff0fede301
	.xword	0xe97b34f7eecd7731
	.xword	0x8304c215767f3eca
	.xword	0x976fe47f9567cdd8
	.xword	0x2e9289741df9423a
	.xword	0x9794f41ec8bf8f02
	.xword	0x4847a82efeae4087
	.xword	0xe354ab8ece1284b1
	.xword	0x30efc00b12f082e6
	.xword	0x972c128d6a093628
	.xword	0x25069a3ff64449b8
	.xword	0x848231aee4952b2b
	.xword	0xf0065b29f4a1a29e
	.xword	0x868ad4d269846a09
	.xword	0xa2783028e45d9a88
	.xword	0x4cfb0a4916f038dd
	.xword	0x8da1c0104cc2c8ee
	.xword	0xfb39172eba02832b
	.xword	0x35e54681eb97bc75
	.xword	0x50158f78efbed74f
	.xword	0xc83bffedb50908b4
	.xword	0x6a41c8391cc0254a
	.xword	0x751b0b846e4a8f32
	.xword	0xff8f5c22b8418f6b
	.xword	0xb95956938bf3ef20
	.xword	0x2f799a3c651f3257
	.xword	0x71447751cacf3abd
	.xword	0x2dc983d5f4202839
	.xword	0x6ab17ccd057c1c8f
	.xword	0x0fef6582182f32b3
	.xword	0x862bbbd957e67f7e
	.xword	0x1ebd2bca3c276654
	.xword	0x5e2fd3e3f20cf115
	.xword	0x1d1d36f18291e5de
	.xword	0x95df9985b3f4150b
	.xword	0x8635ad3ac50683bb
	.xword	0x0f7f0c1d913b7029
	.xword	0xad6fe1bbbf56f374
	.xword	0x8a2ace91ec53cce3
	.xword	0x455ac9f27f7184a2
	.xword	0x9091941248cdfb40
	.xword	0xba20c2cf139911d2
	.xword	0xf919c0a463b5cc82
	.xword	0x4bb5cd7d47433230
	.xword	0x1b6e03aafed9b915
	.xword	0x69bd09c844aa452c
	.xword	0x0051ddbcb00943eb
	.xword	0x0def9e87be26dfb4
	.xword	0x781c1dd265ffe65d
	.xword	0xc724c1aa8ba279f8
	.xword	0x0033791bd6c598b4
	.xword	0xbca6513c8587ab9c
	.xword	0x20694c9975bb9687
	.xword	0x8c807c85aa78c684
	.xword	0xf0cc33f4452b005a
	.xword	0x8c47b539ce0c75db
	.xword	0x87c666066d5e34f1
	.xword	0xe6dce169b5ff234a
	.xword	0xc08bb31f039ef39f
	.xword	0x6161b2be4de53b74
	.xword	0x531094cfe549788d
	.xword	0x09fb333228e5c45b
	.xword	0x159d0d8e20f1b38c
	.xword	0xa6ddc16b63dff466
	.xword	0x3bf101378b42f3df
	.xword	0x50ab9a26d6febc8f
	.xword	0x42241959f873b629
	.xword	0xaa5e344bcdc8bfe6
	.xword	0xda0507257c93987e
	.xword	0x82f0ffedfdf0883b
	.xword	0xb72412c713516c29
	.xword	0xe52f99374f05742d
	.xword	0xe5f658e3b9c6c33a
	.xword	0xb6010ba4e5c28f21
	.xword	0xfa24d0d7745be70f
	.xword	0xda5f8ccdaa946240
	.xword	0xb5e26c985f4ed8c6
	.xword	0x85b5242310df3598
	.xword	0x1f53b8ad47d0f7e8
	.xword	0x86eb411b653f9263
	.xword	0xb25d39f62caa7b9b
	.xword	0x7804ea8d4feb139d
	.xword	0xdfd8bdbc8410b949
	.xword	0xa124a23270796bbf
	.xword	0x12052cea002dfb55
	.xword	0x4f12d331aa9d4c75
	.xword	0x51eadb96afd18d29
	.xword	0x08390235455ec8a4
	.xword	0x2d5cc73976fd944a
	.xword	0x60ee0abf219e4cc6
	.xword	0x717324fb9e6d0058
	.xword	0x8caeba9bdccf6e0a
	.xword	0xa891f1910f7ffa9b
	.xword	0x155a446e774797d4
	.xword	0xb34bfc43ff9bb68e
	.xword	0x2af557466db13d9f
	.xword	0x6fb493f8494b08b1
	.xword	0x158c0cefce0530b5
	.xword	0xda6a1ec999d94977
	.xword	0x4d6f92c272eb2633
	.xword	0x8c4eccd701955483
	.xword	0x07efe0bbaf548f2b
	.xword	0x37be739c64d0eb48
	.xword	0xb807426b7e0e1880
	.xword	0xd48d8e40661a048b
	.xword	0x1bb81f0157cf3473
	.xword	0x471f758e63617ab5
	.xword	0x4bb725ea426dfef4
	.xword	0x5033e23885bff4b1
	.xword	0x00a5b91d49ab85f5
	.xword	0x23ac9c84907f9ba5
	.xword	0xc5e3a35f0dabc003
	.xword	0xf9d68a7a85e01ae1
	.xword	0x4a29dbccadd23baa
	.xword	0xc2a43c9fc31e8874
	.xword	0x781b291fe1d470a7
	.xword	0x89fc854b01b663f3
	.xword	0xdbcbd8bba146bafc
	.xword	0xfebeb324cb681a8d
	.xword	0x9e67d54ea1111386
	.xword	0xefc03fbff76a86a0
	.xword	0x774f1b1c9d4be47b
	.xword	0x7e8cb8aafce5f568
	.xword	0x23ceac57c6d975b9
	.xword	0xfa582ac876242eb0
	.xword	0x27ef1310bcb13860
	.xword	0x8f4100e7708ff524
	.xword	0xb079cfb7c61369dc
	.xword	0x752cec6a7674eaeb
	.xword	0xcb7147d8d0372bf9
	.xword	0x18c8e73a985f2509
	.xword	0x4f4dd7af4a8e4b53
	.xword	0x6d31e52515ed7323
	.xword	0xc4fbd883f58dad82
	.xword	0xecd3bc21e0b448a9
	.xword	0xcfbf765b413ecb35
	.xword	0x125fdc0d6929f3e9
	.xword	0xa5f0f92e27f01021
	.xword	0x038faa91a91a9a7a
	.xword	0x4affd15dff1638ce
	.xword	0x338a2f0e7cd01216
	.xword	0xc8f1f5781d01818c
	.xword	0x782bef0393b249bc
	.xword	0xb3032f641a767c88
	.xword	0x3ce094876038e114
	.xword	0xf2c7851255a06171
	.xword	0x2e690681dafbe210
	.xword	0x6767bbffff6f385a
	.xword	0x2ed4e3a459e821e6
	.xword	0x8ce73ca31eef6197
	.xword	0xdf75a394e1f38003
	.xword	0x76a376bf2358d41d
	.xword	0x3fa58315c44bac75
	.xword	0x2749584f11d72bac
	.xword	0xbfba612535e6cbfd
	.xword	0x3f9b8582de7fbe21
	.xword	0x55bdac69e8454029
	.xword	0x73968beee3bf758c
	.xword	0xb73001d912771349
	.xword	0x9def470777109458
	.xword	0x3db05de3f34a4e3e
	.xword	0xb17bd5517c0821e2
	.xword	0xb391344dd53b12cb
	.xword	0x7f8e8cfa306d5cf7
	.xword	0xf8c7e283e762dfd1
	.xword	0x9188bfd46b08b0fb
	.xword	0xae44b59bcb6ae72d
	.xword	0x7804ece969a99023
	.xword	0xfdfcaece8dd6e7a6
	.xword	0x27395b6ef16cdea7
	.xword	0x04eab4a46b53188c
	.xword	0xe7a830d7d20066f1
	.xword	0xbd2dad5d890a1849
	.xword	0x915ba430738b9a2c
	.xword	0x93be35da760ff773
	.xword	0x3024782139535819
	.xword	0xdb8b1bab5eb33bb3
	.xword	0xb9d0763b88b196ac
	.xword	0xf0f294b2e24122e6
	.xword	0x3826b5dd86064f77
	.xword	0xe82a5ea558380cf9
	.xword	0x037a255ebf73eb48
	.xword	0xf5a940e466d5fa94
	.xword	0x1c9a9bcb67996ed0
	.xword	0xb556b8d99bd9be04
	.xword	0xa4a5d336732557e5
	.xword	0x4bd2a79d2b1d0cad
	.xword	0xaffcbe2cc43295c5
	.xword	0xff66ebc344060e94
	.xword	0xfa0b8e48a6347d40
	.xword	0x255fc3909b658301
	.xword	0xb854b32841012f32
	.xword	0xe26a84ea0bb29478
	.xword	0x7d73e8fbabd95d61
	.xword	0x67850bdafba7eb12
	.xword	0xe36554a135f64295
	.xword	0x3b2d685dd773d32b
	.xword	0x72d105cae06932b4
	.xword	0x9b3bf15a9cb7904f
	.xword	0x730449d86d83ebbb
	.xword	0x2abd9c0314d70f27
	.xword	0xdf683899c9606c46
	.xword	0x128ba61efce5ccb3
	.xword	0x20011b335f0abbd4
	.xword	0x0f213e5450240268
	.xword	0x682c57013ecb43cf
	.xword	0xdc3187eb480be41a
	.xword	0x34aceb700b41090d
	.xword	0xf6fc6519d3be5c1a
	.xword	0x0d2035cebe5828bf
	.xword	0xd3dad69259ced544
	.xword	0x60e511e754a1df65
	.xword	0x1be5cb0055db6987
	.xword	0xd246b1dbd9cb310f
	.xword	0x54f53c369e184143
	.xword	0x7879cf4d6e220fdb
	.xword	0x8bc9e65928dc09d0
	.xword	0x284f5f564d63bec3
	.xword	0xcb9be277f03bac46
	.xword	0xa42b408ef3209a8d
	.xword	0xaa3d93419f08f782
	.xword	0x6f18a10d5fd99f52
	.xword	0x660a26cf5931b99c
	.xword	0xc4b5bb8ab49c4c1b
	.xword	0x57505193e5656f77
	.xword	0x22c63dfe57817470
	.xword	0x5f652487f8646461
	.xword	0xc87fbd484ca7cc0e
	.xword	0x893bf8badf3a4cc4
	.xword	0x1a992d4c49f605fd
	.xword	0x97a904615faba92a
	.xword	0xb419bab6ab8eab3e
	.xword	0xda01b2f42f2b37d9
	.xword	0xa746b1b03e0a3f91
	.xword	0xf74eba46abafd6c7
	.xword	0xcf6ca58f0e7f0cdf
	.xword	0x8a26012f65ec75ed
	.xword	0xbb416c12367c9ccc
	.xword	0x73441d8cea0341c5
	.xword	0x9360f9c110b9cfcf
	.xword	0xe347a3e48130aa5d
	.xword	0x9eb6b1866a60a185
	.xword	0xcf23e2b3622e32c6
	.xword	0x1f6b5bdba6354f23
	.xword	0x2f6041b4482853bf
	.xword	0x598ab7409e589ea7
	.xword	0xe6deac8b8fd0b210
	.xword	0x59ec6ad499dc0e18
	.xword	0xe563f577348b8e76
	.align 0x40000
	.data
data_start_6:

	.xword	0x7f49f1f8bfb0bd9e
	.xword	0x3e028eba2cc7e31d
	.xword	0xd14be1c5ec55fddd
	.xword	0x75f7f4e1013803ec
	.xword	0xd7bfd1ca5ba92a59
	.xword	0x787b80ea324518a5
	.xword	0xe34474243526051c
	.xword	0xc7c2a9939bd3f5d9
	.xword	0x7599a04b7e76cfa7
	.xword	0x805cd9e57e405ef5
	.xword	0x20b5aa741c108bb6
	.xword	0x0b48bc121a16d848
	.xword	0xd3ff847b07543f0c
	.xword	0x1e89312bb5839b23
	.xword	0x53c677c61c746bf7
	.xword	0x051e58dd8e28ac91
	.xword	0x5374a3a68ef35d1b
	.xword	0x5bb8006dda2ead81
	.xword	0xb71e15e94e0dbab6
	.xword	0x7c67204dbd7defad
	.xword	0x991a8564a8252aab
	.xword	0x8d318bc14c258b15
	.xword	0x885cb8195a7696b9
	.xword	0x74ae6770d773549f
	.xword	0xa6f61575fbe9d22c
	.xword	0x3d360d5c6bbe8403
	.xword	0x0f5c8fcfa4f696e6
	.xword	0x0566e515bd2d0a69
	.xword	0xe5ec8f359fa53646
	.xword	0x76812c7fb4a143e5
	.xword	0xf39541e44e8d871f
	.xword	0x00f80249ddb98398
	.xword	0xf37d3b8994f56414
	.xword	0x4b71ef0517bffb1d
	.xword	0xdfda3f22d310f898
	.xword	0x5e60e7bf66c441eb
	.xword	0x2d702bb94858d209
	.xword	0x49dd83a3f85d1863
	.xword	0x2b6ec2f77b19d5e7
	.xword	0x9ca02404875059b8
	.xword	0x470097a003c1b2a2
	.xword	0x75a80ac6def1ea48
	.xword	0xb225f58a913f1e21
	.xword	0x8020eda82b1a322c
	.xword	0xe0af84e786761ef6
	.xword	0x05d3da82460e0000
	.xword	0xed13a12d68a67381
	.xword	0x94df26ee820de5e1
	.xword	0x4ab23decff293219
	.xword	0x849f0980eea24877
	.xword	0x84bf8db2c465e3d3
	.xword	0x1423a6b6a574220d
	.xword	0x7d95a517081a0ce6
	.xword	0xd38fad319d3a2b5d
	.xword	0x9052e8190a868824
	.xword	0x62f0408d0cd5a6e3
	.xword	0xa0c86656a42ec3cb
	.xword	0xe7273a78ccc4ee79
	.xword	0xb4db6c7341311ea0
	.xword	0x7a6617a62615dd95
	.xword	0xc7aecf7c080e1ac9
	.xword	0x1622d3c904502a5a
	.xword	0x6b567ef8d1775e38
	.xword	0xb877c5a0d21ae16f
	.xword	0x7d9841db376b29c6
	.xword	0xb9a18b1694ebd373
	.xword	0x69d65e5e8f850db4
	.xword	0x819c29069d8e8fda
	.xword	0x9a63791a9dc13127
	.xword	0xd161b257b7f19910
	.xword	0xff829febd1023eb0
	.xword	0x28d4674662e77e55
	.xword	0x17e8639d16b822a4
	.xword	0x4788d36617669e5e
	.xword	0x14df70ef04abef57
	.xword	0xc194b219c93216e2
	.xword	0xa1758d8fbc5131f1
	.xword	0xa7cecc7d45a26596
	.xword	0x65fb0be242245939
	.xword	0x645b619d5e99666f
	.xword	0x199e2ed694dde3f1
	.xword	0x521cd83b5b5889a0
	.xword	0x5a33cee5a1fe51c9
	.xword	0x2686f82e3b86caf4
	.xword	0x0b2f034fca619801
	.xword	0xd6491e8165a68166
	.xword	0x6a10cb8fda195c76
	.xword	0x9786b98ed8069d8c
	.xword	0xda316f52bc210363
	.xword	0xfaa44922a39503bb
	.xword	0x51f4078b98df4a2f
	.xword	0x09c18dcfef9449c5
	.xword	0x94619439c98b5117
	.xword	0xaf4fe3fc940d9223
	.xword	0x708c8b90f1aaf3ea
	.xword	0xefafdf853a820ddf
	.xword	0x77f84d8102cf3599
	.xword	0xa2005672e67a9b00
	.xword	0x6d831b87eb2857a5
	.xword	0x413fc8497526225e
	.xword	0x59bf40485a95b8fc
	.xword	0x1d9df24471f6ea06
	.xword	0x7dd4fbd22c4397f5
	.xword	0x92d0e0048b8f44f5
	.xword	0x754eed1a829e3d41
	.xword	0xbcc043071694b19b
	.xword	0x8208529d1053e334
	.xword	0x1ce4c54daf1bd56d
	.xword	0x01ab72c99e75c2b1
	.xword	0x3442082157bd2769
	.xword	0x92d4159e01994699
	.xword	0x53c36f9867da59e4
	.xword	0x0a5aa63c34b2918f
	.xword	0x52cb865ccbaa4ad6
	.xword	0x48e62d262d6965ae
	.xword	0xe671896c91189e58
	.xword	0x6d174fd1bc38076d
	.xword	0xc6fa21be43c96193
	.xword	0xc945fe96f98eb0f4
	.xword	0xab8ca91adf4988fe
	.xword	0x601ca9b0539dd6bd
	.xword	0x6296d734b1f8edb7
	.xword	0xa641dc7399ce59be
	.xword	0xe2dba4bda91e4b6f
	.xword	0x1eb23ca2d6d1da3e
	.xword	0xe4ad5b3e14c556ed
	.xword	0xb9fa7232bd451674
	.xword	0x465beefdcecf5e85
	.xword	0x62faebccb0d7bb05
	.xword	0xdedbb2277bc5ebe1
	.xword	0x42d4ce368c4ecef9
	.xword	0x303e2ef3056bdb98
	.xword	0x1e0b60f530d73001
	.xword	0x04748524d0700a46
	.xword	0x34528dd731332dbd
	.xword	0xe5ca9015f52c2744
	.xword	0x89597e7d79a13524
	.xword	0x18837ed876300ae6
	.xword	0x16596ace2499b5f8
	.xword	0x749dfaadf9ef27e4
	.xword	0x22b917eb8e91b8fa
	.xword	0x963b7703692ac3c1
	.xword	0x36f7e186e46aa11f
	.xword	0x44e31ab56914af2a
	.xword	0x3a7079808ba159e3
	.xword	0xda244761219e211b
	.xword	0xf7de8e77f6276cd3
	.xword	0x1b4aca46033675fd
	.xword	0x0e4ff7cfbed4cc80
	.xword	0xe44018ac4e2e58a8
	.xword	0xec119aec4bb443cd
	.xword	0x6549de601368caf0
	.xword	0xd58ffa1732bef4ee
	.xword	0xa594e51428540e40
	.xword	0xb9adeb2a77ed2183
	.xword	0x8bbebd7829d17ca0
	.xword	0xd7bbf1fae826e88d
	.xword	0xa84fa03efeaa6758
	.xword	0x29b9b8e1422786c2
	.xword	0x2949119bc0c05bdc
	.xword	0x25902600904ee89e
	.xword	0x1b37573cbe84913c
	.xword	0x362367d003162129
	.xword	0xfe7c2396a0e9ba7a
	.xword	0xb5a65d29e082e1a2
	.xword	0x448cffccf70de623
	.xword	0x1616ad28d6ef9b80
	.xword	0xf5bbc33447934a3b
	.xword	0x5c7fd23406ea4cae
	.xword	0x0e570b4f9fc26c40
	.xword	0x4c16f3e9153b408d
	.xword	0x7f45f961914f5f78
	.xword	0xdd0bf9b85ea46631
	.xword	0x8fe6e1bff9e97e02
	.xword	0x9cc3cf1fcbbb42d4
	.xword	0xe9a9062ed9ffda96
	.xword	0x0a2f7bd74e7e91b4
	.xword	0xba7e62dc7df2d238
	.xword	0x6cf704ecf4a10a7e
	.xword	0x04e58aed2b590706
	.xword	0x4ac26d30368682fa
	.xword	0xb13ef56080ab5b31
	.xword	0xab9b80581a539f87
	.xword	0xe10ab529dce7154b
	.xword	0x57aa23babed1c519
	.xword	0xfce3260bd45b2603
	.xword	0x2cef29cac0fd0699
	.xword	0x83c66d8c6a4c5aa1
	.xword	0x6fd0fe14f1b188ec
	.xword	0x096243c3211c2f10
	.xword	0x0aa033dc22ebf874
	.xword	0x3aa1577262429ba7
	.xword	0x743ce21a41cd1b0a
	.xword	0xd61c807bc9847a9e
	.xword	0xf4278e6fb6d6eff4
	.xword	0x10a84f2955681400
	.xword	0x9d283e948985e37c
	.xword	0x2c921b5847d440a7
	.xword	0x88d8020b70718bf9
	.xword	0x0202c5b69ced0592
	.xword	0x9377e287eb981b03
	.xword	0x2b568a701bdc5451
	.xword	0x0c36be98f25e2f91
	.xword	0xa41b61f60c9cd8ec
	.xword	0x32ddf2cbf469fa13
	.xword	0xcebd793137053fe1
	.xword	0x561c1265bf9aefc9
	.xword	0x0b5a52e258bf4aa5
	.xword	0xbf0d5474d8cca97a
	.xword	0x01bd49e1125ff3e3
	.xword	0x17cef2792fb61dde
	.xword	0x70e7c0d61fda574e
	.xword	0x95785f33bf0897df
	.xword	0xff982a725cba225f
	.xword	0x51d3fe6f3ff3d7ce
	.xword	0x3854e21fa8524a04
	.xword	0x4e700be361c08c89
	.xword	0xf6807b143c7f00e4
	.xword	0xb0daefb0894daa7c
	.xword	0xf510a53137129c5c
	.xword	0x3b3e5cf8e61e897f
	.xword	0xa5043010e7d1c9c7
	.xword	0xb74262cf6ef3acd9
	.xword	0xa110c2993321c250
	.xword	0x41545fe9ab658631
	.xword	0xad82746f924e9495
	.xword	0x5a90b25e88a7fe18
	.xword	0xda30cc642dbcc845
	.xword	0x1fa25d8a7ba4a5cd
	.xword	0xeb15122b89ebf785
	.xword	0xccff82a0a7fa6fb5
	.xword	0xc512057aad35d185
	.xword	0xf0bfce6f2bb59557
	.xword	0x9cf27f35ecfc4527
	.xword	0x5a2b951aacdfa694
	.xword	0x2a33fd60f693c7f6
	.xword	0xab396dfad1983ff1
	.xword	0xdd1f9bbe2aba24ba
	.xword	0x6fbf03f796423d3d
	.xword	0xc1f0f6cf0493bc9a
	.xword	0xbce42f02b26827bc
	.xword	0x84e2edc5937052c4
	.xword	0x267cfc3245013bda
	.xword	0x1538cca3dff5603c
	.xword	0x5d29b93e5f6b0811
	.xword	0x74e2f88c4d6a7371
	.xword	0x565012e3f857cb66
	.xword	0x5a4aab877cd1e983
	.xword	0x05d681d918773860
	.xword	0xc8acaee7d709d320
	.xword	0x5f29ea09b1db2e2a
	.xword	0xcaa3877107a8a24d
	.xword	0xe30d1f3d6933caa5
	.xword	0xdb8c4c3752c1cbec
	.xword	0x966e546f598e8214
	.xword	0x600cb52c7ba6fd87
	.align 0x80000
	.data
data_start_7:

	.xword	0xcb7ab348871e2edb
	.xword	0xfe501db505f5ec88
	.xword	0x7d8d4a92ce622f07
	.xword	0xbe108c80fed60fa2
	.xword	0xaee31de462a6938f
	.xword	0x337be5d3fa034deb
	.xword	0xd078fac4091001c4
	.xword	0x98c31ff7c50e2c94
	.xword	0x49aeb8781c195f89
	.xword	0xd01c762ff60db7f9
	.xword	0xb1c719c2fa1eeeec
	.xword	0x4cdd423667047606
	.xword	0xd026061c7443203c
	.xword	0x97d62c9f48f7beb1
	.xword	0x965cd07be89e6134
	.xword	0x29b64acccf0c6896
	.xword	0x3a9db10f69f2e6ae
	.xword	0x0a7621665fc40a2a
	.xword	0xdb61872af93032c5
	.xword	0xbd80ec6ce00c147d
	.xword	0xb6856443c6dd2a12
	.xword	0x57c0169278c176ec
	.xword	0x82438b60ee458ade
	.xword	0xd8003d7e246a772c
	.xword	0xbdc4e4d54cae62e7
	.xword	0xb56e3d2807ed05f3
	.xword	0xf5e0feb7e057002b
	.xword	0x11bb12fa147b7a16
	.xword	0x03cfcfedc5163947
	.xword	0x7f15f7963ae34a65
	.xword	0x4038bf44e8f5d932
	.xword	0xb8935c2ec58f10a9
	.xword	0xc401e06f3f0d1a73
	.xword	0x4f75278f39cc4301
	.xword	0xbd01c3b6e3a7383a
	.xword	0x781ac69521538cf5
	.xword	0xde8b876c026360e5
	.xword	0x8196dd242cbe157c
	.xword	0x8af16d9ac3055aea
	.xword	0xa57508af450cb5e0
	.xword	0x99f0b41dd6c40faa
	.xword	0x1365efa375234685
	.xword	0x583c9924ed1f6c21
	.xword	0x454014f4cccd19c7
	.xword	0x42c2d789ef8015de
	.xword	0x27157e3d86e0fae6
	.xword	0x55216600ffdd3d1f
	.xword	0x39c69991ad4652f4
	.xword	0x0b118eaf9fbe7655
	.xword	0x8992c28f6b9cd7a6
	.xword	0x49f19add9ac008a6
	.xword	0x030ccdc86d4aa2fa
	.xword	0xd83767974b8b85e7
	.xword	0xa1e5fc6a77fef45d
	.xword	0x2e378435e3a5a71e
	.xword	0x3c1d1ddbab326dab
	.xword	0x402738af84128f55
	.xword	0x15ce44f92afc077c
	.xword	0xe6fcb83084a833e9
	.xword	0xdd60fe26fd185cd2
	.xword	0x6c3efcd3f991ad72
	.xword	0x954fbe6e94b1f801
	.xword	0x9cb04a1400b5ebde
	.xword	0x6f33094b2b6e81a2
	.xword	0xb94e7c62499ff166
	.xword	0x1a6d5578937bf6c1
	.xword	0xc9ce04d06c2801a8
	.xword	0x1f9a3715e9bbe76c
	.xword	0x9b0f65f6879020ab
	.xword	0xe5a2999a9e7c1d7b
	.xword	0x85dbe676b7db986f
	.xword	0xb83af5e496087df0
	.xword	0xcbb7373a671e49fa
	.xword	0x597aa0e24db44b65
	.xword	0x41e0d1f544bc7776
	.xword	0x53ba78455f50915b
	.xword	0xa2068cbda26c7b1d
	.xword	0xabbf0f1901e70d76
	.xword	0xf098af2e0befa860
	.xword	0x66fa9ca78be1408b
	.xword	0xd46a057b4688a5d6
	.xword	0x4baa6c9b878031f9
	.xword	0xe65900203ef476c4
	.xword	0x2baadc8f372d30d9
	.xword	0xd664e430d84a2cf2
	.xword	0x37f4c1c215bf9f57
	.xword	0x773428b6467d8997
	.xword	0xe91b4191d847f77b
	.xword	0xf07dab038346e65e
	.xword	0x0fbaad4f66a322fc
	.xword	0x20edfbd3eed99809
	.xword	0x23e8ab4b25c8b5e9
	.xword	0x12aa1a3f54a9a895
	.xword	0xd8574ab7c2a252bd
	.xword	0xef1dcdc78fbde084
	.xword	0x95b5514961c36035
	.xword	0x53e707a6ed4b959f
	.xword	0x06380d774cdd2202
	.xword	0x706275776a29cb84
	.xword	0x5ac588355cc348f1
	.xword	0x294bc8bc5718eb95
	.xword	0xe8f3b5d0d6d5723c
	.xword	0x6eaace509fd63fa2
	.xword	0x62f48e2b7ee557d2
	.xword	0x6374f07a3ea82f4c
	.xword	0x744ce105e8ccba9d
	.xword	0xb4e97fc5428bd413
	.xword	0x3977d8a1d8753036
	.xword	0xfb149ca19d0f4cb2
	.xword	0x52810ff0c75b1463
	.xword	0x1e67aa8d146f6ce8
	.xword	0x79ab0d77f911526c
	.xword	0x2b1fc683c01db8a1
	.xword	0x4828151b48057bb6
	.xword	0x31067ef672c564ef
	.xword	0xf391beb11b5887a1
	.xword	0x50b58f5376481142
	.xword	0x76feab4e2eeaed4d
	.xword	0x814bc3661c2e5e31
	.xword	0x2f59aa212581cbfe
	.xword	0x314387667f16cfd1
	.xword	0xb9cf31be05d823bd
	.xword	0xd2d08310508dddca
	.xword	0xc4e39bbc6e7905d9
	.xword	0x7bfc3325a82cb434
	.xword	0xd41f3f242b08f059
	.xword	0xd4b85e00d72ae814
	.xword	0x0b363938b23bdf1f
	.xword	0xccca07b68cd9f88f
	.xword	0xe32ad5fab035c9bf
	.xword	0x6811a96443e2e768
	.xword	0x0fac3c92b91bf776
	.xword	0x43de73497f1369e4
	.xword	0xe0e138f54781469c
	.xword	0xb43e2c83278b0b10
	.xword	0xd749f992056fc303
	.xword	0xe0830ae3737f7b04
	.xword	0x551e2d6eeb48c6ea
	.xword	0x2a0586c4e2cbf272
	.xword	0xd715cd94af24d2d9
	.xword	0x1ca37723f0dbce9b
	.xword	0x62d05922397b40f0
	.xword	0xd5d1a8b260aca56d
	.xword	0xce9b1558a8a19229
	.xword	0xc35be24336add7b6
	.xword	0x23c673a4e4b684dc
	.xword	0x3990f40cd34a392e
	.xword	0x3f083bd6da225b53
	.xword	0x12a4a86b702360e0
	.xword	0x9c7d64e22639abb6
	.xword	0x7efdcf582af0a03b
	.xword	0x3a5b31096c97b733
	.xword	0x2665dd896c29368c
	.xword	0x302e5084cd9c8748
	.xword	0x1faa96cdd01ecf84
	.xword	0x6efcc39a161737bf
	.xword	0xea5c50fc94aab679
	.xword	0x3794f707a77e289d
	.xword	0x99c639722482cf49
	.xword	0xac6d9307fc408b0b
	.xword	0xf4e35ce4b0b5495a
	.xword	0x0cf1c4cab5c33984
	.xword	0x4350f43cfb3c8b0f
	.xword	0x3134b60f9d2c3903
	.xword	0x14f86c3936bd7201
	.xword	0x44fc389311dc303f
	.xword	0x8488ea979f77be2f
	.xword	0x7bcaeb3034efdd33
	.xword	0x25aa0fc74e2d5b27
	.xword	0xd198903d40ec24da
	.xword	0x443adc221a6994d0
	.xword	0x65d490f22094059b
	.xword	0x8d70f1df04185943
	.xword	0xd18ffdff6dc06f99
	.xword	0x934d82a4b1790ab7
	.xword	0x39dd8a5129f936ba
	.xword	0x13950d91f11bd741
	.xword	0xa79ac355055f1898
	.xword	0x984d33aff6f3c376
	.xword	0x0ceadf9bb5f6c60c
	.xword	0x0ec804c13f299b00
	.xword	0x403a5ded5492a57a
	.xword	0x2d4efbcbb5b2f5c9
	.xword	0x52753c87410becdc
	.xword	0x60a5dfef106767a1
	.xword	0xeafad3010164a157
	.xword	0x68a516dec7445112
	.xword	0x29358303079ec3dc
	.xword	0x9cb84e27554d577c
	.xword	0x94789ef8f399bff7
	.xword	0x58fa729631f2f763
	.xword	0xcf4738a1b2ee9ac6
	.xword	0x0cca0180d5ad8dbf
	.xword	0x39fb22018f2d0bd2
	.xword	0x0a78986a1e338826
	.xword	0x1da055b5f2ea9bd2
	.xword	0x7ba95e5784cd6133
	.xword	0xc832f93ad49b3477
	.xword	0x30dc257f99ea3b4d
	.xword	0xdff30b3ec4d61f79
	.xword	0x0b1b2b0f57c0a6a8
	.xword	0x540d961dd1f93aaa
	.xword	0xfd1390f42f786374
	.xword	0x02549d91a390e378
	.xword	0x6eb17b55977cead4
	.xword	0x4db8f5e5e9813e52
	.xword	0xeb3740f698e9db5e
	.xword	0xe31a0f5f1f780075
	.xword	0x455f3368e46ff398
	.xword	0x04e50d6a539a344b
	.xword	0xf38d30ff7da581e3
	.xword	0x555b287eb1a1154d
	.xword	0xec0cd91864b15269
	.xword	0x96dcc314cd9823a0
	.xword	0x7d20ee67089ccd0c
	.xword	0xb40450513551a7e0
	.xword	0x5998d44e620b926a
	.xword	0xddea308c71ab8de9
	.xword	0x55e6a2817a7b7c25
	.xword	0xe8c8d715c6650367
	.xword	0xfbafe8c5498be1b0
	.xword	0xec0eae8f483e05aa
	.xword	0x1957d3b3cde83bd3
	.xword	0x14c20977b4af27a3
	.xword	0x9d03092d3f37eaf8
	.xword	0x18f53320641a6c8a
	.xword	0x3c9b51177ac94f05
	.xword	0x809bc9ecfd09ac93
	.xword	0xc89f2148f6871fb9
	.xword	0x3351d116bdea214b
	.xword	0xc07bcd77bd12083a
	.xword	0x725144a2a16d29b7
	.xword	0x8c1e4d6d4b623518
	.xword	0x78363896f0c8dbfb
	.xword	0x62922a6f93db1d6b
	.xword	0x0cf645728c4474c3
	.xword	0x2bf036fdd7bfd8f4
	.xword	0xfcaf574a6755c68e
	.xword	0x0356bbe89100d3eb
	.xword	0x7e5e764f9b93a970
	.xword	0x2116f6ba027645f0
	.xword	0x2a7ed4956969fcad
	.xword	0xf967da5c1dee9229
	.xword	0xcdaa1e93b586bf69
	.xword	0x194760c9bdeb121d
	.xword	0xf791a09d62b9a0f6
	.xword	0x921e082c7d99ec96
	.xword	0x832d86be887a2495
	.xword	0xe7c7ff15542a3f4a
	.xword	0x2fb2c211d5cc200c
	.xword	0x8708ba3f83ecb02e
	.xword	0x62d8be7cb2411999
	.xword	0x60bf323bfbbcd3a9
	.xword	0x4600d513a130059d
	.xword	0x14dedf5162761baa
	.xword	0xce41b6be4cc90aaf



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
