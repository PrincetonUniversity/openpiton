// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tlu_multi_mix_2_thint_s0_28.s
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
   random seed:	334034654
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

	setx 0x3e281fcc06ee8cfa, %g1, %g0
	setx 0xbd44794dd3fe1ece, %g1, %g1
	setx 0x254e29e7e286b05c, %g1, %g2
	setx 0x5d53caf35e852ffc, %g1, %g3
	setx 0xd0f420445a05bf7d, %g1, %g4
	setx 0x1f955178d9221aeb, %g1, %g5
	setx 0xa5a34476a5e1cf9c, %g1, %g6
	setx 0x23c49c281ae576c7, %g1, %g7
	setx 0x4bc34856501ba30b, %g1, %r16
	setx 0xa99e33c9ff5e28be, %g1, %r17
	setx 0x1d2c62455e9fdfb7, %g1, %r18
	setx 0xa2b3275040c8abac, %g1, %r19
	setx 0x5e449bc05e51c284, %g1, %r20
	setx 0x1e132f15286fcc01, %g1, %r21
	setx 0x9e0e80e4c06050eb, %g1, %r22
	setx 0xa0d92f0d7950c5d2, %g1, %r23
	setx 0x6b62a54f9ee46906, %g1, %r24
	setx 0x44bbbfa82221788f, %g1, %r25
	setx 0xd68b14b5cb6e623f, %g1, %r26
	setx 0x0a998f6ba50425d2, %g1, %r27
	setx 0xa6566671f72351a0, %g1, %r28
	setx 0x0e81e39c3369c193, %g1, %r29
	setx 0x662324d039cd65b0, %g1, %r30
	setx 0xbac25fe37ef89391, %g1, %r31
	save
	setx 0x62abee3e7cd0bbbc, %g1, %r16
	setx 0x05033f1fb4cbbece, %g1, %r17
	setx 0xf2d74ef00fdbd824, %g1, %r18
	setx 0x463650e6348914a8, %g1, %r19
	setx 0x6233bb0c3d02c431, %g1, %r20
	setx 0x9534dbba88e2bd47, %g1, %r21
	setx 0x9094e9d50f9a9c36, %g1, %r22
	setx 0xc7b092f6813e3338, %g1, %r23
	setx 0xbe5bf4cddfd99e8b, %g1, %r24
	setx 0x5fb965f07da7d880, %g1, %r25
	setx 0x4e3d2a60cddd87cd, %g1, %r26
	setx 0x1a5a302e96422ee8, %g1, %r27
	setx 0x23dd286e334a8fa0, %g1, %r28
	setx 0x3099fe3098b752e7, %g1, %r29
	setx 0x55adee075177ae9e, %g1, %r30
	setx 0xf879381ff922f6a6, %g1, %r31
	save
	setx 0x8438cd6fd6c4777a, %g1, %r16
	setx 0x67225ba317f3ded2, %g1, %r17
	setx 0xa6431fad8e2a7c52, %g1, %r18
	setx 0xb4c09df1c3e5408a, %g1, %r19
	setx 0x4f6df41cdedfcb96, %g1, %r20
	setx 0xb1d84307e8870120, %g1, %r21
	setx 0x1e675db53022d332, %g1, %r22
	setx 0xf3958d24a2eb5980, %g1, %r23
	setx 0x0266c4d5bcf9d9ee, %g1, %r24
	setx 0x339229f752fae9c2, %g1, %r25
	setx 0xec8f0e49b6eec34f, %g1, %r26
	setx 0x93e94634f632a0cd, %g1, %r27
	setx 0x0493778703de05c4, %g1, %r28
	setx 0x41bc0cb37818b862, %g1, %r29
	setx 0x307e11e9633649db, %g1, %r30
	setx 0x6f5edc7559354adc, %g1, %r31
	save
	setx 0xb9cdc7a0a72ee50d, %g1, %r16
	setx 0x2d4a3b702cca5a88, %g1, %r17
	setx 0x2129277075f5e1b9, %g1, %r18
	setx 0x460753bb6c2b5b76, %g1, %r19
	setx 0xaf7fec6797a895be, %g1, %r20
	setx 0x81d57acdbea217b8, %g1, %r21
	setx 0xec10f733b6354989, %g1, %r22
	setx 0x6540dcdabecd31b3, %g1, %r23
	setx 0xc11b237874ab938c, %g1, %r24
	setx 0x821f3453b80d83cb, %g1, %r25
	setx 0xbe5d2733766c5da7, %g1, %r26
	setx 0x1e891bc1157c7981, %g1, %r27
	setx 0xbc9dec60a00cd3f5, %g1, %r28
	setx 0x00c5eba6a17efd59, %g1, %r29
	setx 0x4d0ab4e370f1b6be, %g1, %r30
	setx 0xa71fa3b7d947248d, %g1, %r31
	save
	setx 0x80dadf8385a881c2, %g1, %r16
	setx 0x43fa9cc7e4fcaeac, %g1, %r17
	setx 0xfe7412354539f6c1, %g1, %r18
	setx 0x6872ecbf594eabfe, %g1, %r19
	setx 0x7f93627ddac943e5, %g1, %r20
	setx 0x62e6a261b829e82a, %g1, %r21
	setx 0x88d008dd82725166, %g1, %r22
	setx 0xe1aefcbc6288fccf, %g1, %r23
	setx 0x58b0713c6952fe18, %g1, %r24
	setx 0x5e73818ab169cfa8, %g1, %r25
	setx 0x991aa116c4c41591, %g1, %r26
	setx 0x0c8ce598e517dccc, %g1, %r27
	setx 0x6f2c05a666d75a8c, %g1, %r28
	setx 0xfbaf2fff8111b6ee, %g1, %r29
	setx 0x1cc13d9cbe6be34a, %g1, %r30
	setx 0x45ec2f105374efca, %g1, %r31
	save
	setx 0x1060495d9213d30e, %g1, %r16
	setx 0x149090335c98870e, %g1, %r17
	setx 0x3545aeecaab2c0b3, %g1, %r18
	setx 0x4acb226839c2cf12, %g1, %r19
	setx 0xd8293f24e7d8e441, %g1, %r20
	setx 0x43dae7137a9fe88f, %g1, %r21
	setx 0x59d80501d93a2409, %g1, %r22
	setx 0x6cd40cbbf68d0eb4, %g1, %r23
	setx 0xf7c8bd040d598019, %g1, %r24
	setx 0xefb64c35c19d14d3, %g1, %r25
	setx 0xd3f2742aaf74c13d, %g1, %r26
	setx 0x98ff08630b5104aa, %g1, %r27
	setx 0x90a4d32c595908c4, %g1, %r28
	setx 0x75e857a01d721c9a, %g1, %r29
	setx 0xe1e13e9f5b262ad1, %g1, %r30
	setx 0xe5815dd4f892b12b, %g1, %r31
	save
	setx 0xaa224bb3a6210f5e, %g1, %r16
	setx 0x41e6301ed9a083bd, %g1, %r17
	setx 0xe1bc0f8569e5cef8, %g1, %r18
	setx 0x594d7463d5e9a22c, %g1, %r19
	setx 0x776c84704ce96bdc, %g1, %r20
	setx 0xa4152ce8917be82f, %g1, %r21
	setx 0x446ba69642a266eb, %g1, %r22
	setx 0xa5d22d4b91e91fe3, %g1, %r23
	setx 0x47f775b31bcd492f, %g1, %r24
	setx 0xe657eebe79ffcbf3, %g1, %r25
	setx 0x99864d6f23d29f90, %g1, %r26
	setx 0x77edb9956fc2b2b8, %g1, %r27
	setx 0xe22eab3feb403ec8, %g1, %r28
	setx 0xabc665a46fd42550, %g1, %r29
	setx 0x02321cd21ac8e754, %g1, %r30
	setx 0xa883a0cdc1d48fb8, %g1, %r31
	save
	setx 0x1bb94ad2ba3c08c6, %g1, %r16
	setx 0x6746b567cb558bbb, %g1, %r17
	setx 0x89ee4223aadb7f08, %g1, %r18
	setx 0x831245459e434d75, %g1, %r19
	setx 0xffca5f6b3990a926, %g1, %r20
	setx 0x97b4dee7e55e0117, %g1, %r21
	setx 0x8aa68f2828e9e80c, %g1, %r22
	setx 0x8235e4f4ebe38d19, %g1, %r23
	setx 0xcb52a50b7776a932, %g1, %r24
	setx 0x289eb71792f31834, %g1, %r25
	setx 0x0148c63224424b4f, %g1, %r26
	setx 0x778b3324dc070e98, %g1, %r27
	setx 0x7899f3027af5d6bb, %g1, %r28
	setx 0x0888e2d0ef8fe62d, %g1, %r29
	setx 0xf60b9c7838e8a154, %g1, %r30
	setx 0x1ae4427dc13dc244, %g1, %r31
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
	.word 0xb9e4607f  ! 3: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb1e4e019  ! 4: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb7e460d8  ! 6: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb1e5e0f3  ! 7: SAVE_I	save	%r23, 0x0001, %r24
	mov	0x27, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e421bf  ! 10: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xbbe5e1ae  ! 11: SAVE_I	save	%r23, 0x0001, %r29
	setx	0xe942dbdb000088c0, %g1, %r10
	.word 0x839a8000  ! 12: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbfe561b5  ! 14: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb3e5e079  ! 17: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb20da08d  ! 18: AND_I	and 	%r22, 0x008d, %r25
	.word 0xbfe4a11f  ! 19: SAVE_I	save	%r18, 0x0001, %r31
	mov	0x116, %o0
	ta	T_SEND_THRD_INTR
	.word 0x9195208e  ! 23: WRPR_PIL_I	wrpr	%r20, 0x008e, %pil
	.word 0xbf50c000  ! 27: RDPR_TT	<illegal instruction>
	.word 0xb5e4e046  ! 31: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb1e521ec  ! 32: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb9e5a18e  ! 34: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xbfe52046  ! 35: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb7520000  ! 36: RDPR_PIL	<illegal instruction>
	setx	data_start_5, %g1, %r18
	setx	0x9b86b7ed0000b8d1, %g1, %r10
	.word 0x839a8000  ! 38: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb7e46099  ! 41: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb5e5a05d  ! 47: SAVE_I	save	%r22, 0x0001, %r26
	.word 0x8395a103  ! 49: WRPR_TNPC_I	wrpr	%r22, 0x0103, %tnpc
	.word 0xb8b44000  ! 53: ORNcc_R	orncc 	%r17, %r0, %r28
	.word 0x919520bd  ! 54: WRPR_PIL_I	wrpr	%r20, 0x00bd, %pil
	.word 0x83946105  ! 55: WRPR_TNPC_I	wrpr	%r17, 0x0105, %tnpc
	.word 0xb3e4e1c6  ! 58: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb3e4a152  ! 60: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb7e52142  ! 62: SAVE_I	save	%r20, 0x0001, %r27
	mov	0x207, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9520000  ! 65: RDPR_PIL	<illegal instruction>
	.word 0xbbe421f3  ! 74: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xba84a155  ! 75: ADDcc_I	addcc 	%r18, 0x0155, %r29
	.word 0xbfe5200e  ! 83: SAVE_I	save	%r20, 0x0001, %r31
	.word 0x8d942026  ! 84: WRPR_PSTATE_I	wrpr	%r16, 0x0026, %pstate
	.word 0xb3e420a7  ! 85: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb5e4a04a  ! 90: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xbde56188  ! 93: SAVE_I	save	%r21, 0x0001, %r30
	.word 0x8594e13a  ! 103: WRPR_TSTATE_I	wrpr	%r19, 0x013a, %tstate
	.word 0xb1e4a191  ! 106: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb0b5c000  ! 108: SUBCcc_R	orncc 	%r23, %r0, %r24
	.word 0xb9e42070  ! 109: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb7e42136  ! 110: SAVE_I	save	%r16, 0x0001, %r27
	mov	0, %r12
	.word 0x8f930000  ! 113: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb57ce401  ! 114: MOVR_I	movre	%r19, 0x1, %r26
	.word 0xb9e5a07b  ! 117: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xbfe46193  ! 118: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb5e5e109  ! 119: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb7540000  ! 121: RDPR_GL	<illegal instruction>
	.word 0xbf500000  ! 122: RDPR_TPC	<illegal instruction>
	.word 0xb5e46187  ! 124: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb41de11f  ! 125: XOR_I	xor 	%r23, 0x011f, %r26
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	mov	0x126, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e520ca  ! 131: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xbde52063  ! 133: SAVE_I	save	%r20, 0x0001, %r30
	mov	0x21e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e4605b  ! 137: SAVE_I	save	%r17, 0x0001, %r24
	mov	2, %r12
	.word 0xa1930000  ! 140: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb3e460ce  ! 144: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb3350000  ! 148: SRL_R	srl 	%r20, %r0, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbb500000  ! 150: RDPR_TPC	<illegal instruction>
	mov	0x7, %o0
	ta	T_SEND_THRD_INTR
	mov	1, %r12
	.word 0x8f930000  ! 154: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbde4e1cb  ! 156: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xbac5206d  ! 157: ADDCcc_I	addccc 	%r20, 0x006d, %r29
	mov	0x3c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7518000  ! 164: RDPR_PSTATE	<illegal instruction>
	mov	0x22e, %o0
	ta	T_SEND_THRD_INTR
	mov	0x30a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1518000  ! 171: RDPR_PSTATE	<illegal instruction>
	.word 0xb1e5e136  ! 172: SAVE_I	save	%r23, 0x0001, %r24
	setx	data_start_5, %g1, %r18
	.word 0xb72c0000  ! 179: SLL_R	sll 	%r16, %r0, %r27
	.word 0xb7e46019  ! 180: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xbbe5e1c0  ! 184: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb81d4000  ! 186: XOR_R	xor 	%r21, %r0, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0x819521e9  ! 188: WRPR_TPC_I	wrpr	%r20, 0x01e9, %tpc
	.word 0xb1e42035  ! 189: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb7e46146  ! 191: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb9508000  ! 192: RDPR_TSTATE	<illegal instruction>
	.word 0xb6350000  ! 196: SUBC_R	orn 	%r20, %r0, %r27
	.word 0xbb510000  ! 197: RDPR_TICK	<illegal instruction>
	.word 0xbf518000  ! 199: RDPR_PSTATE	<illegal instruction>
	.word 0xbfe4a11d  ! 202: SAVE_I	save	%r18, 0x0001, %r31
	setx	0xa6b714690000ba1f, %g1, %r10
	.word 0x819a8000  ! 206: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbde4a151  ! 208: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb9e56016  ! 209: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb5e46067  ! 210: SAVE_I	save	%r17, 0x0001, %r26
	mov	0x136, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e42171  ! 213: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb1e4e112  ! 214: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbde4a1d2  ! 217: SAVE_I	save	%r18, 0x0001, %r30
	mov	0x325, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe5e079  ! 222: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xbfe5615f  ! 223: SAVE_I	save	%r21, 0x0001, %r31
	.word 0x8595a1b6  ! 232: WRPR_TSTATE_I	wrpr	%r22, 0x01b6, %tstate
	.word 0xb5e521da  ! 237: SAVE_I	save	%r20, 0x0001, %r26
	.word 0x81946093  ! 238: WRPR_TPC_I	wrpr	%r17, 0x0093, %tpc
	.word 0xbfe421f6  ! 241: SAVE_I	save	%r16, 0x0001, %r31
	.word 0x8195e152  ! 248: WRPR_TPC_I	wrpr	%r23, 0x0152, %tpc
	.word 0xbb518000  ! 249: RDPR_PSTATE	<illegal instruction>
	setx	data_start_7, %g1, %r23
	.word 0xb7e5e17b  ! 254: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb7e4e068  ! 255: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb150c000  ! 257: RDPR_TT	<illegal instruction>
	.word 0xbfe5a13e  ! 259: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb3e42076  ! 261: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xbb504000  ! 262: RDPR_TNPC	<illegal instruction>
	.word 0xb245a14f  ! 264: ADDC_I	addc 	%r22, 0x014f, %r25
	.word 0xb9e5a17b  ! 269: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xbbe4a105  ! 272: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb3e4e04c  ! 273: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb3e56069  ! 276: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb3e46182  ! 277: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbbe4e08f  ! 287: SAVE_I	save	%r19, 0x0001, %r29
	mov	0x22c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde5210d  ! 291: SAVE_I	save	%r20, 0x0001, %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbbe4a102  ! 293: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb3508000  ! 298: RDPR_TSTATE	<illegal instruction>
	.word 0xb4b50000  ! 299: SUBCcc_R	orncc 	%r20, %r0, %r26
	.word 0xb1e4e055  ! 304: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb1e5e155  ! 309: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb89c4000  ! 313: XORcc_R	xorcc 	%r17, %r0, %r28
	.word 0xb1e4e103  ! 315: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb5e5e081  ! 316: SAVE_I	save	%r23, 0x0001, %r26
	mov	2, %r12
	.word 0xa1930000  ! 322: WRPR_GL_R	wrpr	%r12, %r0, %-
	mov	0x317, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9480000  ! 324: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xbde4a1f3  ! 328: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xbfe4a086  ! 331: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xbde5a0e7  ! 332: SAVE_I	save	%r22, 0x0001, %r30
	.word 0x819560bf  ! 333: WRPR_TPC_I	wrpr	%r21, 0x00bf, %tpc
	.word 0xbde4a1b3  ! 334: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb49da1e2  ! 338: XORcc_I	xorcc 	%r22, 0x01e2, %r26
	.word 0xbd500000  ! 341: RDPR_TPC	<illegal instruction>
	.word 0xb7540000  ! 346: RDPR_GL	<illegal instruction>
	.word 0xb2b48000  ! 349: SUBCcc_R	orncc 	%r18, %r0, %r25
	.word 0xb9e4a136  ! 350: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xbfe4a019  ! 353: SAVE_I	save	%r18, 0x0001, %r31
	setx	data_start_0, %g1, %r22
	.word 0xbde421d3  ! 359: SAVE_I	save	%r16, 0x0001, %r30
	mov	0xe, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_4, %g1, %r18
	.word 0xb3540000  ! 374: RDPR_GL	<illegal instruction>
	mov	0x115, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd51c000  ! 376: RDPR_TL	<illegal instruction>
	.word 0xb0044000  ! 381: ADD_R	add 	%r17, %r0, %r24
	.word 0xbfe461b3  ! 382: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xbbe5a00c  ! 385: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb1e520b8  ! 386: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xbd508000  ! 387: RDPR_TSTATE	<illegal instruction>
	setx	data_start_7, %g1, %r18
	.word 0xb1e42190  ! 389: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb3e5e0fa  ! 391: SAVE_I	save	%r23, 0x0001, %r25
	.word 0x8d95a09a  ! 392: WRPR_PSTATE_I	wrpr	%r22, 0x009a, %pstate
	.word 0xb2248000  ! 393: SUB_R	sub 	%r18, %r0, %r25
	.word 0x8395e194  ! 398: WRPR_TNPC_I	wrpr	%r23, 0x0194, %tnpc
	.word 0xb0c58000  ! 399: ADDCcc_R	addccc 	%r22, %r0, %r24
	.word 0xbbe521f0  ! 400: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb9e5e02a  ! 402: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xbb480000  ! 403: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xb68da050  ! 406: ANDcc_I	andcc 	%r22, 0x0050, %r27
	.word 0xbde4a187  ! 407: SAVE_I	save	%r18, 0x0001, %r30
	mov	0xc, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e460d2  ! 409: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xbbe4e02b  ! 416: SAVE_I	save	%r19, 0x0001, %r29
	mov	0xb, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5504000  ! 421: RDPR_TNPC	<illegal instruction>
	.word 0xb7e46141  ! 422: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb5e5a02d  ! 424: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb7508000  ! 425: RDPR_TSTATE	<illegal instruction>
	.word 0xb1e4209d  ! 427: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xbfe5a057  ! 430: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb5344000  ! 432: SRL_R	srl 	%r17, %r0, %r26
	.word 0xbbe5602f  ! 433: SAVE_I	save	%r21, 0x0001, %r29
	.word 0x89956021  ! 439: WRPR_TICK_I	wrpr	%r21, 0x0021, %tick
	setx	0x95bc378000001811, %g1, %r10
	.word 0x839a8000  ! 443: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbd518000  ! 445: RDPR_PSTATE	<illegal instruction>
	.word 0xb8bdc000  ! 446: XNORcc_R	xnorcc 	%r23, %r0, %r28
	.word 0xb351c000  ! 450: RDPR_TL	<illegal instruction>
	.word 0xb9e5612d  ! 451: SAVE_I	save	%r21, 0x0001, %r28
	setx	0xe3b17ce00000790a, %g1, %r10
	.word 0x839a8000  ! 452: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	mov	0x23, %o0
	ta	T_SEND_THRD_INTR
	setx	0xf1b3ede100001e5e, %g1, %r10
	.word 0x819a8000  ! 460: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	mov	0x10, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf480000  ! 464: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xbe054000  ! 465: ADD_R	add 	%r21, %r0, %r31
	.word 0xb5e4e138  ! 467: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb1480000  ! 468: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xb7e56030  ! 470: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb625c000  ! 473: SUB_R	sub 	%r23, %r0, %r27
	setx	0xcfc1678400006801, %g1, %r10
	.word 0x839a8000  ! 474: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbde52050  ! 478: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb9e5a1a9  ! 479: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb9e461e6  ! 481: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xbb508000  ! 482: RDPR_TSTATE	<illegal instruction>
	.word 0xbbe5e1be  ! 484: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xbfe421ac  ! 485: SAVE_I	save	%r16, 0x0001, %r31
	mov	0x332, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e5e005  ! 490: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb3e5e17d  ! 495: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb7e4a0dd  ! 498: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xbfe42074  ! 500: SAVE_I	save	%r16, 0x0001, %r31
	setx	0xf16c130400000a56, %g1, %r10
	.word 0x819a8000  ! 505: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbfe4a178  ! 507: SAVE_I	save	%r18, 0x0001, %r31
	mov	0x335, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e5a0a2  ! 513: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb7e5a13f  ! 515: SAVE_I	save	%r22, 0x0001, %r27
	mov	0x135, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3e5219a  ! 519: SAVE_I	save	%r20, 0x0001, %r25
	mov	0x332, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8d94e093  ! 522: WRPR_PSTATE_I	wrpr	%r19, 0x0093, %pstate
	mov	0x103, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9508000  ! 528: RDPR_TSTATE	<illegal instruction>
	.word 0xb7e5605c  ! 529: SAVE_I	save	%r21, 0x0001, %r27
	.word 0x87956122  ! 531: WRPR_TT_I	wrpr	%r21, 0x0122, %tt
	.word 0xb3508000  ! 534: RDPR_TSTATE	<illegal instruction>
	.word 0xb20da1e6  ! 535: AND_I	and 	%r22, 0x01e6, %r25
	mov	0x4, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe4605e  ! 538: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb151c000  ! 540: RDPR_TL	<illegal instruction>
	setx	0x9c7f699b0000ee8b, %g1, %r10
	.word 0x839a8000  ! 543: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x8794e10c  ! 545: WRPR_TT_I	wrpr	%r19, 0x010c, %tt
	.word 0xbfe4218f  ! 546: SAVE_I	save	%r16, 0x0001, %r31
	mov	0x21f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e4a03d  ! 549: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xbbe5a0cb  ! 555: SAVE_I	save	%r22, 0x0001, %r29
	mov	0xc, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_5, %g1, %r20
	setx	0xffb2eb1e0000595b, %g1, %r10
	.word 0x839a8000  ! 562: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	setx	0x5993c4a400007c89, %g1, %r10
	.word 0x839a8000  ! 569: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb7e4e19b  ! 573: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xbde5613b  ! 576: SAVE_I	save	%r21, 0x0001, %r30
	mov	0x35, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe521fd  ! 583: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb5e461dd  ! 585: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb5641800  ! 586: MOVcc_R	<illegal instruction>
	.word 0xb1518000  ! 589: RDPR_PSTATE	<illegal instruction>
	mov	0x1, %o0
	ta	T_SEND_THRD_INTR
	mov	0x309, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8994e013  ! 594: WRPR_TICK_I	wrpr	%r19, 0x0013, %tick
	mov	0x16, %o0
	ta	T_SEND_THRD_INTR
	.word 0x91956068  ! 596: WRPR_PIL_I	wrpr	%r21, 0x0068, %pil
	.word 0xb3500000  ! 597: RDPR_TPC	<illegal instruction>
	.word 0xbde4208b  ! 598: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xbde4a0e7  ! 602: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb3e52160  ! 603: SAVE_I	save	%r20, 0x0001, %r25
	.word 0x83946012  ! 604: WRPR_TNPC_I	wrpr	%r17, 0x0012, %tnpc
	.word 0xbfe5e198  ! 606: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb29560d7  ! 607: ORcc_I	orcc 	%r21, 0x00d7, %r25
	setx	0x4466f19600001c0d, %g1, %r10
	.word 0x819a8000  ! 609: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb3e5e1b1  ! 610: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb9540000  ! 613: RDPR_GL	<illegal instruction>
	mov	0x21d, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8794a108  ! 615: WRPR_TT_I	wrpr	%r18, 0x0108, %tt
	.word 0x839460dd  ! 619: WRPR_TNPC_I	wrpr	%r17, 0x00dd, %tnpc
	mov	0x31b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9500000  ! 622: RDPR_TPC	<illegal instruction>
	mov	0x131, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe4e1b5  ! 624: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb551c000  ! 628: RDPR_TL	<illegal instruction>
	.word 0xbbe5e152  ! 630: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xbfe5a1e6  ! 631: SAVE_I	save	%r22, 0x0001, %r31
	mov	0x111, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbe4a1e7  ! 637: SAVE_I	save	%r18, 0x0001, %r29
	setx	data_start_6, %g1, %r22
	.word 0xb3e46161  ! 645: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb12c2001  ! 649: SLL_I	sll 	%r16, 0x0001, %r24
	.word 0xbbe520d7  ! 650: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xbfe560dc  ! 652: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb1e5a10c  ! 656: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb7510000  ! 665: RDPR_TICK	<illegal instruction>
	.word 0xb7e420d7  ! 666: SAVE_I	save	%r16, 0x0001, %r27
	mov	0x204, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9e4e08a  ! 668: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb5e421b5  ! 669: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xbde4e14f  ! 674: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xbfe5e15c  ! 675: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xbfe520bf  ! 677: SAVE_I	save	%r20, 0x0001, %r31
	.word 0x8394a034  ! 678: WRPR_TNPC_I	wrpr	%r18, 0x0034, %tnpc
	.word 0xb1e46165  ! 680: SAVE_I	save	%r17, 0x0001, %r24
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbf2c8000  ! 683: SLL_R	sll 	%r18, %r0, %r31
	.word 0xb7e4a069  ! 685: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb1e5a0b1  ! 693: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb7e520a5  ! 695: SAVE_I	save	%r20, 0x0001, %r27
	mov	0x14, %o0
	ta	T_SEND_THRD_INTR
	.word 0x839560de  ! 700: WRPR_TNPC_I	wrpr	%r21, 0x00de, %tnpc
	.word 0xb9e5a101  ! 704: SAVE_I	save	%r22, 0x0001, %r28
	.word 0x8d9460df  ! 706: WRPR_PSTATE_I	wrpr	%r17, 0x00df, %pstate
	.word 0xbbe52023  ! 708: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb3e521e4  ! 709: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb3e46041  ! 711: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb3540000  ! 712: RDPR_GL	<illegal instruction>
	setx	0x505de1980000ead1, %g1, %r10
	.word 0x839a8000  ! 720: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x8394218e  ! 721: WRPR_TNPC_I	wrpr	%r16, 0x018e, %tnpc
	.word 0xbfe5605e  ! 723: SAVE_I	save	%r21, 0x0001, %r31
	.word 0x9195e169  ! 726: WRPR_PIL_I	wrpr	%r23, 0x0169, %pil
	.word 0xb1e4e1e5  ! 727: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbfe46032  ! 728: SAVE_I	save	%r17, 0x0001, %r31
	.word 0x8795a177  ! 729: WRPR_TT_I	wrpr	%r22, 0x0177, %tt
	.word 0xb08ce160  ! 730: ANDcc_I	andcc 	%r19, 0x0160, %r24
	mov	0x2a, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8d946058  ! 732: WRPR_PSTATE_I	wrpr	%r17, 0x0058, %pstate
	.word 0xb7518000  ! 735: RDPR_PSTATE	<illegal instruction>
	.word 0xbfe56036  ! 740: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb0442196  ! 741: ADDC_I	addc 	%r16, 0x0196, %r24
	.word 0x8594e0ae  ! 742: WRPR_TSTATE_I	wrpr	%r19, 0x00ae, %tstate
	.word 0x8795a01d  ! 743: WRPR_TT_I	wrpr	%r22, 0x001d, %tt
	.word 0xb614e1de  ! 745: OR_I	or 	%r19, 0x01de, %r27
	.word 0xb3518000  ! 750: RDPR_PSTATE	<illegal instruction>
	.word 0xbfe4a06b  ! 751: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb1480000  ! 755: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xb7e521f5  ! 757: SAVE_I	save	%r20, 0x0001, %r27
	mov	0x33a, %o0
	ta	T_SEND_THRD_INTR
	setx	0xf44aa2dc0000dcd7, %g1, %r10
	.word 0x819a8000  ! 763: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb015a032  ! 768: OR_I	or 	%r22, 0x0032, %r24
	setx	data_start_0, %g1, %r22
	.word 0xbde56016  ! 775: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb1e5a050  ! 776: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb9e5e0bc  ! 777: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xbbe46026  ! 780: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb5518000  ! 782: RDPR_PSTATE	<illegal instruction>
	mov	1, %r12
	.word 0x8f930000  ! 783: WRPR_TL_R	wrpr	%r12, %r0, %tl
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb1e4e147  ! 786: SAVE_I	save	%r19, 0x0001, %r24
	mov	0x32, %o0
	ta	T_SEND_THRD_INTR
	.word 0x81952068  ! 789: WRPR_TPC_I	wrpr	%r20, 0x0068, %tpc
	.word 0xbde5605c  ! 791: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xbfe5a1b7  ! 799: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb3e4a16e  ! 801: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xbfe42131  ! 802: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb1e561b3  ! 807: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xbfe5219f  ! 809: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb7480000  ! 810: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xb950c000  ! 812: RDPR_TT	<illegal instruction>
	.word 0xb9500000  ! 813: RDPR_TPC	<illegal instruction>
	.word 0xbb540000  ! 815: RDPR_GL	<illegal instruction>
	.word 0xb5540000  ! 831: RDPR_GL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb335a001  ! 834: SRL_I	srl 	%r22, 0x0001, %r25
	.word 0xb3e4e0c1  ! 836: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb7e5a1ce  ! 839: SAVE_I	save	%r22, 0x0001, %r27
	mov	0x30d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfe560cf  ! 844: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb4bd2011  ! 845: XNORcc_I	xnorcc 	%r20, 0x0011, %r26
	.word 0xbcc5212b  ! 851: ADDCcc_I	addccc 	%r20, 0x012b, %r30
	.word 0xb93da001  ! 852: SRA_I	sra 	%r22, 0x0001, %r28
	.word 0xb9e420db  ! 859: SAVE_I	save	%r16, 0x0001, %r28
	.word 0x9195a009  ! 861: WRPR_PIL_I	wrpr	%r22, 0x0009, %pil
	mov	0x229, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbde4618f  ! 864: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbde5e196  ! 866: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xbde4e0f1  ! 867: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xbbe561fb  ! 871: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xbde461f8  ! 872: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb7e561cf  ! 873: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb1e461d1  ! 875: SAVE_I	save	%r17, 0x0001, %r24
	mov	0x336, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e4616e  ! 882: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xbbe5a1ae  ! 886: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb9e5a018  ! 889: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb3e4a0c6  ! 891: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xbbe560fd  ! 892: SAVE_I	save	%r21, 0x0001, %r29
	setx	data_start_5, %g1, %r22
	setx	0x1156382600008e85, %g1, %r10
	.word 0x839a8000  ! 897: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb9e52037  ! 901: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb934c000  ! 904: SRL_R	srl 	%r19, %r0, %r28
	setx	data_start_6, %g1, %r23
	.word 0xb93d6001  ! 912: SRA_I	sra 	%r21, 0x0001, %r28
	.word 0xb7e5602f  ! 914: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb7e5a0c9  ! 917: SAVE_I	save	%r22, 0x0001, %r27
	mov	0x318, %o0
	ta	T_SEND_THRD_INTR
	mov	0x11d, %o0
	ta	T_SEND_THRD_INTR
	setx	0x33136fc100000e9c, %g1, %r10
	.word 0x839a8000  ! 924: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb8246162  ! 925: SUB_I	sub 	%r17, 0x0162, %r28
	.word 0xb5e5e070  ! 927: SAVE_I	save	%r23, 0x0001, %r26
	mov	0, %r12
	.word 0xa1930000  ! 928: WRPR_GL_R	wrpr	%r12, %r0, %-
	mov	0x322, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb28c0000  ! 932: ANDcc_R	andcc 	%r16, %r0, %r25
	.word 0xb3540000  ! 933: RDPR_GL	<illegal instruction>
	.word 0xb5e421bd  ! 934: SAVE_I	save	%r16, 0x0001, %r26
	.word 0x85952065  ! 935: WRPR_TSTATE_I	wrpr	%r20, 0x0065, %tstate
	mov	0x31a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1e42123  ! 940: SAVE_I	save	%r16, 0x0001, %r24
	mov	1, %r12
	.word 0x8f930000  ! 941: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb3e56193  ! 942: SAVE_I	save	%r21, 0x0001, %r25
	mov	0x303, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9500000  ! 948: RDPR_TPC	<illegal instruction>
	mov	0x317, %o0
	ta	T_SEND_THRD_INTR
	mov	0x335, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7e56023  ! 953: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb9e521d9  ! 957: SAVE_I	save	%r20, 0x0001, %r28
	mov	2, %r12
	.word 0xa1930000  ! 961: WRPR_GL_R	wrpr	%r12, %r0, %-
	setx	0x9bae215000008cd2, %g1, %r10
	.word 0x839a8000  ! 963: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb151c000  ! 967: RDPR_TL	<illegal instruction>
	.word 0xb13d3001  ! 969: SRAX_I	srax	%r20, 0x0001, %r24
	.word 0xbfe4a1eb  ! 970: SAVE_I	save	%r18, 0x0001, %r31
	.word 0x879520a5  ! 971: WRPR_TT_I	wrpr	%r20, 0x00a5, %tt
	.word 0xbbe461b2  ! 975: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb844e1b9  ! 977: ADDC_I	addc 	%r19, 0x01b9, %r28
	.word 0xb7e46094  ! 979: SAVE_I	save	%r17, 0x0001, %r27
	mov	2, %r12
	.word 0xa1930000  ! 980: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbbe5e0f5  ! 981: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xbb50c000  ! 983: RDPR_TT	<illegal instruction>
	.word 0xbde4e0ef  ! 984: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb150c000  ! 986: RDPR_TT	<illegal instruction>
	mov	1, %r12
	.word 0x8f930000  ! 994: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbde420bf  ! 995: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xbde42061  ! 996: SAVE_I	save	%r16, 0x0001, %r30
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
	mov	0x108, %o0
	ta	T_SEND_THRD_INTR
	setx	0xf707c94700001d01, %g1, %r10
	.word 0x839a8000  ! 12: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf674e0ee  ! 15: STX_I	stx	%r27, [%r19 + 0x00ee]
	.word 0xf874219f  ! 16: STX_I	stx	%r28, [%r16 + 0x019f]
	.word 0xbc0de157  ! 18: AND_I	and 	%r23, 0x0157, %r30
	mov	0x33b, %o0
	ta	T_SEND_THRD_INTR
	.word 0x9194a1ce  ! 23: WRPR_PIL_I	wrpr	%r18, 0x01ce, %pil
	.word 0xff3d4000  ! 24: STDF_R	std	%f31, [%r0, %r21]
	.word 0xfc346108  ! 26: STH_I	sth	%r30, [%r17 + 0x0108]
	.word 0xb550c000  ! 27: RDPR_TT	rdpr	%tt, %r26
	.word 0xb9520000  ! 36: RDPR_PIL	<illegal instruction>
	setx	data_start_1, %g1, %r18
	setx	0xecea11a00003905, %g1, %r10
	.word 0x839a8000  ! 38: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf02d20c9  ! 39: STB_I	stb	%r24, [%r20 + 0x00c9]
	.word 0x83952112  ! 49: WRPR_TNPC_I	wrpr	%r20, 0x0112, %tnpc
	.word 0xb0b44000  ! 53: ORNcc_R	orncc 	%r17, %r0, %r24
	.word 0x919561d2  ! 54: WRPR_PIL_I	wrpr	%r21, 0x01d2, %pil
	.word 0x8394e026  ! 55: WRPR_TNPC_I	wrpr	%r19, 0x0026, %tnpc
	.word 0xff3da101  ! 56: STDF_I	std	%f31, [0x0101, %r22]
	.word 0xf33c2183  ! 61: STDF_I	std	%f25, [0x0183, %r16]
	mov	0x13c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb520000  ! 65: RDPR_PIL	rdpr	%pil, %r29
	.word 0xf4254000  ! 66: STW_R	stw	%r26, [%r21 + %r0]
	.word 0xf224a03b  ! 70: STW_I	stw	%r25, [%r18 + 0x003b]
	.word 0xfc2ca1e1  ! 71: STB_I	stb	%r30, [%r18 + 0x01e1]
	.word 0xf02461ce  ! 72: STW_I	stw	%r24, [%r17 + 0x01ce]
	.word 0xb48420d4  ! 75: ADDcc_I	addcc 	%r16, 0x00d4, %r26
	.word 0xf42c21bc  ! 78: STB_I	stb	%r26, [%r16 + 0x01bc]
	.word 0x8d94a084  ! 84: WRPR_PSTATE_I	wrpr	%r18, 0x0084, %pstate
	.word 0xf82420a5  ! 91: STW_I	stw	%r28, [%r16 + 0x00a5]
	.word 0xf6242129  ! 98: STW_I	stw	%r27, [%r16 + 0x0129]
	.word 0x859461b5  ! 103: WRPR_TSTATE_I	wrpr	%r17, 0x01b5, %tstate
	.word 0xf2340000  ! 105: STH_R	sth	%r25, [%r16 + %r0]
	.word 0xf824c000  ! 107: STW_R	stw	%r28, [%r19 + %r0]
	.word 0xb0b4c000  ! 108: SUBCcc_R	orncc 	%r19, %r0, %r24
	.word 0xf33c8000  ! 112: STDF_R	std	%f25, [%r0, %r18]
	mov	0, %r12
	.word 0x8f930000  ! 113: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbb7c6401  ! 114: MOVR_I	movre	%r17, 0x1, %r29
	.word 0xf33d21e7  ! 115: STDF_I	std	%f25, [0x01e7, %r20]
	.word 0xf63c60ca  ! 116: STD_I	std	%r27, [%r17 + 0x00ca]
	.word 0xf42c8000  ! 120: STB_R	stb	%r26, [%r18 + %r0]
	.word 0xbb540000  ! 121: RDPR_GL	rdpr	%-, %r29
	.word 0xb3500000  ! 122: RDPR_TPC	<illegal instruction>
	.word 0xb01c6048  ! 125: XOR_I	xor 	%r17, 0x0048, %r24
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	mov	0x122, %o0
	ta	T_SEND_THRD_INTR
	mov	0x10c, %o0
	ta	T_SEND_THRD_INTR
	mov	2, %r12
	.word 0xa1930000  ! 140: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf43de0d3  ! 141: STD_I	std	%r26, [%r23 + 0x00d3]
	.word 0xf03c4000  ! 147: STD_R	std	%r24, [%r17 + %r0]
	.word 0xb1354000  ! 148: SRL_R	srl 	%r21, %r0, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbb500000  ! 150: RDPR_TPC	rdpr	%tpc, %r29
	.word 0xf42c0000  ! 151: STB_R	stb	%r26, [%r16 + %r0]
	mov	0x204, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf425c000  ! 153: STW_R	stw	%r26, [%r23 + %r0]
	mov	1, %r12
	.word 0x8f930000  ! 154: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbac4617b  ! 157: ADDCcc_I	addccc 	%r17, 0x017b, %r29
	.word 0xf6354000  ! 158: STH_R	sth	%r27, [%r21 + %r0]
	mov	0x11e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9518000  ! 164: RDPR_PSTATE	rdpr	%pstate, %r28
	mov	0x3d, %o0
	ta	T_SEND_THRD_INTR
	mov	0x23, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc3421ed  ! 168: STH_I	sth	%r30, [%r16 + 0x01ed]
	.word 0xf02d0000  ! 169: STB_R	stb	%r24, [%r20 + %r0]
	.word 0xb5518000  ! 171: RDPR_PSTATE	<illegal instruction>
	setx	data_start_7, %g1, %r22
	.word 0xb52cc000  ! 179: SLL_R	sll 	%r19, %r0, %r26
	.word 0xf82c20e4  ! 185: STB_I	stb	%r28, [%r16 + 0x00e4]
	.word 0xb81d8000  ! 186: XOR_R	xor 	%r22, %r0, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0x8195e1dc  ! 188: WRPR_TPC_I	wrpr	%r23, 0x01dc, %tpc
	.word 0xb1508000  ! 192: RDPR_TSTATE	rdpr	%tstate, %r24
	.word 0xb4350000  ! 196: SUBC_R	orn 	%r20, %r0, %r26
	.word 0xb1510000  ! 197: RDPR_TICK	<illegal instruction>
	.word 0xbb518000  ! 199: RDPR_PSTATE	<illegal instruction>
	.word 0xff3c4000  ! 203: STDF_R	std	%f31, [%r0, %r17]
	.word 0xf73c61cf  ! 205: STDF_I	std	%f27, [0x01cf, %r17]
	setx	0x4f39f3ca0000eac5, %g1, %r10
	.word 0x819a8000  ! 206: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xff3da149  ! 207: STDF_I	std	%f31, [0x0149, %r22]
	mov	0x124, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf234c000  ! 212: STH_R	sth	%r25, [%r19 + %r0]
	.word 0xf4742181  ! 215: STX_I	stx	%r26, [%r16 + 0x0181]
	.word 0xf4348000  ! 216: STH_R	sth	%r26, [%r18 + %r0]
	mov	0x15, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf13da1d0  ! 220: STDF_I	std	%f24, [0x01d0, %r22]
	.word 0xf22d4000  ! 225: STB_R	stb	%r25, [%r21 + %r0]
	.word 0xf8250000  ! 226: STW_R	stw	%r28, [%r20 + %r0]
	.word 0xfc3ca04d  ! 229: STD_I	std	%r30, [%r18 + 0x004d]
	.word 0xfc248000  ! 231: STW_R	stw	%r30, [%r18 + %r0]
	.word 0x8594a0c3  ! 232: WRPR_TSTATE_I	wrpr	%r18, 0x00c3, %tstate
	.word 0xf83c605d  ! 233: STD_I	std	%r28, [%r17 + 0x005d]
	.word 0x81942089  ! 238: WRPR_TPC_I	wrpr	%r16, 0x0089, %tpc
	.word 0xfc2d0000  ! 244: STB_R	stb	%r30, [%r20 + %r0]
	.word 0xf024a069  ! 245: STW_I	stw	%r24, [%r18 + 0x0069]
	.word 0xf0744000  ! 247: STX_R	stx	%r24, [%r17 + %r0]
	.word 0x8195a00f  ! 248: WRPR_TPC_I	wrpr	%r22, 0x000f, %tpc
	.word 0xbb518000  ! 249: RDPR_PSTATE	rdpr	%pstate, %r29
	setx	data_start_1, %g1, %r21
	.word 0xfe754000  ! 253: STX_R	stx	%r31, [%r21 + %r0]
	.word 0xb950c000  ! 257: RDPR_TT	<illegal instruction>
	.word 0xf13de11e  ! 260: STDF_I	std	%f24, [0x011e, %r23]
	.word 0xb7504000  ! 262: RDPR_TNPC	<illegal instruction>
	.word 0xb8456098  ! 264: ADDC_I	addc 	%r21, 0x0098, %r28
	.word 0xfa3da171  ! 266: STD_I	std	%r29, [%r22 + 0x0171]
	.word 0xf22d2079  ! 270: STB_I	stb	%r25, [%r20 + 0x0079]
	.word 0xff3c8000  ! 274: STDF_R	std	%f31, [%r0, %r18]
	.word 0xfc2ce17d  ! 278: STB_I	stb	%r30, [%r19 + 0x017d]
	.word 0xf33de0e1  ! 279: STDF_I	std	%f25, [0x00e1, %r23]
	.word 0xf83dc000  ! 281: STD_R	std	%r28, [%r23 + %r0]
	.word 0xfe340000  ! 282: STH_R	sth	%r31, [%r16 + %r0]
	.word 0xf13d613b  ! 284: STDF_I	std	%f24, [0x013b, %r21]
	mov	0x31b, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf42c219c  ! 294: STB_I	stb	%r26, [%r16 + 0x019c]
	.word 0xbb508000  ! 298: RDPR_TSTATE	<illegal instruction>
	.word 0xbcb54000  ! 299: SUBCcc_R	orncc 	%r21, %r0, %r30
	.word 0xf275a0f6  ! 301: STX_I	stx	%r25, [%r22 + 0x00f6]
	.word 0xfe750000  ! 302: STX_R	stx	%r31, [%r20 + %r0]
	.word 0xf23d8000  ! 303: STD_R	std	%r25, [%r22 + %r0]
	.word 0xf03de184  ! 306: STD_I	std	%r24, [%r23 + 0x0184]
	.word 0xf63c4000  ! 307: STD_R	std	%r27, [%r17 + %r0]
	.word 0xf93d0000  ! 310: STDF_R	std	%f28, [%r0, %r20]
	.word 0xf42da1c4  ! 312: STB_I	stb	%r26, [%r22 + 0x01c4]
	.word 0xbe9d0000  ! 313: XORcc_R	xorcc 	%r20, %r0, %r31
	.word 0xfa348000  ! 317: STH_R	sth	%r29, [%r18 + %r0]
	.word 0xf8342031  ! 318: STH_I	sth	%r28, [%r16 + 0x0031]
	.word 0xf2748000  ! 319: STX_R	stx	%r25, [%r18 + %r0]
	mov	2, %r12
	.word 0xa1930000  ! 322: WRPR_GL_R	wrpr	%r12, %r0, %-
	mov	0x237, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf480000  ! 324: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xf62dc000  ! 326: STB_R	stb	%r27, [%r23 + %r0]
	.word 0xf0748000  ! 327: STX_R	stx	%r24, [%r18 + %r0]
	.word 0xfc2c61ec  ! 329: STB_I	stb	%r30, [%r17 + 0x01ec]
	.word 0xf62c8000  ! 330: STB_R	stb	%r27, [%r18 + %r0]
	.word 0x81956145  ! 333: WRPR_TPC_I	wrpr	%r21, 0x0145, %tpc
	.word 0xf4740000  ! 337: STX_R	stx	%r26, [%r16 + %r0]
	.word 0xba9ca03b  ! 338: XORcc_I	xorcc 	%r18, 0x003b, %r29
	.word 0xb7500000  ! 341: RDPR_TPC	rdpr	%tpc, %r27
	.word 0xf33ca12f  ! 344: STDF_I	std	%f25, [0x012f, %r18]
	.word 0xf22c4000  ! 345: STB_R	stb	%r25, [%r17 + %r0]
	.word 0xb3540000  ! 346: RDPR_GL	<illegal instruction>
	.word 0xb2b58000  ! 349: SUBCcc_R	orncc 	%r22, %r0, %r25
	.word 0xfd3cc000  ! 354: STDF_R	std	%f30, [%r0, %r19]
	.word 0xf2258000  ! 355: STW_R	stw	%r25, [%r22 + %r0]
	.word 0xf42d60cb  ! 356: STB_I	stb	%r26, [%r21 + 0x00cb]
	setx	data_start_3, %g1, %r16
	.word 0xff3d8000  ! 361: STDF_R	std	%f31, [%r0, %r22]
	.word 0xfe358000  ! 363: STH_R	sth	%r31, [%r22 + %r0]
	.word 0xfe2cc000  ! 364: STB_R	stb	%r31, [%r19 + %r0]
	mov	0x317, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r18
	.word 0xb3540000  ! 374: RDPR_GL	<illegal instruction>
	mov	0x115, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb551c000  ! 376: RDPR_TL	<illegal instruction>
	.word 0xf82cc000  ! 379: STB_R	stb	%r28, [%r19 + %r0]
	.word 0xf2750000  ! 380: STX_R	stx	%r25, [%r20 + %r0]
	.word 0xb4058000  ! 381: ADD_R	add 	%r22, %r0, %r26
	.word 0xf93ce058  ! 384: STDF_I	std	%f28, [0x0058, %r19]
	.word 0xb7508000  ! 387: RDPR_TSTATE	<illegal instruction>
	setx	data_start_0, %g1, %r18
	.word 0x8d9560d2  ! 392: WRPR_PSTATE_I	wrpr	%r21, 0x00d2, %pstate
	.word 0xb8244000  ! 393: SUB_R	sub 	%r17, %r0, %r28
	.word 0xf22d0000  ! 395: STB_R	stb	%r25, [%r20 + %r0]
	.word 0xfe244000  ! 396: STW_R	stw	%r31, [%r17 + %r0]
	.word 0xfd3d4000  ! 397: STDF_R	std	%f30, [%r0, %r21]
	.word 0x8395a1a6  ! 398: WRPR_TNPC_I	wrpr	%r22, 0x01a6, %tnpc
	.word 0xb8c4c000  ! 399: ADDCcc_R	addccc 	%r19, %r0, %r28
	.word 0xb5480000  ! 403: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xf73ca10d  ! 404: STDF_I	std	%f27, [0x010d, %r18]
	.word 0xf42dc000  ! 405: STB_R	stb	%r26, [%r23 + %r0]
	.word 0xb88ca091  ! 406: ANDcc_I	andcc 	%r18, 0x0091, %r28
	mov	0x30a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xff3ce1cd  ! 411: STDF_I	std	%f31, [0x01cd, %r19]
	.word 0xfc248000  ! 413: STW_R	stw	%r30, [%r18 + %r0]
	mov	0x2f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1504000  ! 421: RDPR_TNPC	<illegal instruction>
	.word 0xb9508000  ! 425: RDPR_TSTATE	<illegal instruction>
	.word 0xf62ce091  ! 431: STB_I	stb	%r27, [%r19 + 0x0091]
	.word 0xb3344000  ! 432: SRL_R	srl 	%r17, %r0, %r25
	.word 0xfa74c000  ! 434: STX_R	stx	%r29, [%r19 + %r0]
	.word 0xfd3c0000  ! 435: STDF_R	std	%f30, [%r0, %r16]
	.word 0x89942151  ! 439: WRPR_TICK_I	wrpr	%r16, 0x0151, %tick
	setx	0xb31f048300004a9f, %g1, %r10
	.word 0x839a8000  ! 443: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf53c211d  ! 444: STDF_I	std	%f26, [0x011d, %r16]
	.word 0xbb518000  ! 445: RDPR_PSTATE	rdpr	%pstate, %r29
	.word 0xbabd4000  ! 446: XNORcc_R	xnorcc 	%r21, %r0, %r29
	.word 0xf425a085  ! 448: STW_I	stw	%r26, [%r22 + 0x0085]
	.word 0xb551c000  ! 450: RDPR_TL	<illegal instruction>
	setx	0x754dff5900000d47, %g1, %r10
	.word 0x839a8000  ! 452: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf6356040  ! 454: STH_I	sth	%r27, [%r21 + 0x0040]
	.word 0xfa3c8000  ! 455: STD_R	std	%r29, [%r18 + %r0]
	mov	0x301, %o0
	ta	T_SEND_THRD_INTR
	.word 0xff3c20b5  ! 458: STDF_I	std	%f31, [0x00b5, %r16]
	setx	0xd31d4d3200007d59, %g1, %r10
	.word 0x819a8000  ! 460: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf82c0000  ! 461: STB_R	stb	%r28, [%r16 + %r0]
	mov	0x129, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1480000  ! 464: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xb405c000  ! 465: ADD_R	add 	%r23, %r0, %r26
	.word 0xf2246186  ! 466: STW_I	stw	%r25, [%r17 + 0x0186]
	.word 0xb7480000  ! 468: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xf224a0be  ! 469: STW_I	stw	%r25, [%r18 + 0x00be]
	.word 0xf73c8000  ! 471: STDF_R	std	%f27, [%r0, %r18]
	.word 0xfc2420d0  ! 472: STW_I	stw	%r30, [%r16 + 0x00d0]
	.word 0xb4248000  ! 473: SUB_R	sub 	%r18, %r0, %r26
	setx	0xbec07ea0000098c7, %g1, %r10
	.word 0x839a8000  ! 474: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf6240000  ! 480: STW_R	stw	%r27, [%r16 + %r0]
	.word 0xbf508000  ! 482: RDPR_TSTATE	rdpr	%tstate, %r31
	mov	0x31, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa75a149  ! 491: STX_I	stx	%r29, [%r22 + 0x0149]
	.word 0xf73da081  ! 492: STDF_I	std	%f27, [0x0081, %r22]
	.word 0xfa3520c5  ! 493: STH_I	sth	%r29, [%r20 + 0x00c5]
	.word 0xf03c8000  ! 494: STD_R	std	%r24, [%r18 + %r0]
	.word 0xf87520a8  ! 503: STX_I	stx	%r28, [%r20 + 0x00a8]
	setx	0xaf34333100000c0d, %g1, %r10
	.word 0x819a8000  ! 505: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	mov	0x2d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf22c0000  ! 509: STB_R	stb	%r25, [%r16 + %r0]
	mov	0x303, %o0
	ta	T_SEND_THRD_INTR
	mov	0x227, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8d9420c0  ! 522: WRPR_PSTATE_I	wrpr	%r16, 0x00c0, %pstate
	.word 0xff3d6175  ! 524: STDF_I	std	%f31, [0x0175, %r21]
	mov	0x334, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd508000  ! 528: RDPR_TSTATE	rdpr	%tstate, %r30
	.word 0xfb3c8000  ! 530: STDF_R	std	%f29, [%r0, %r18]
	.word 0x8795212c  ! 531: WRPR_TT_I	wrpr	%r20, 0x012c, %tt
	.word 0xbd508000  ! 534: RDPR_TSTATE	rdpr	%tstate, %r30
	.word 0xb40c60da  ! 535: AND_I	and 	%r17, 0x00da, %r26
	mov	0x118, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb151c000  ! 540: RDPR_TL	<illegal instruction>
	setx	0x28df3acd000019d6, %g1, %r10
	.word 0x839a8000  ! 543: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xfe2ca023  ! 544: STB_I	stb	%r31, [%r18 + 0x0023]
	.word 0x8794e158  ! 545: WRPR_TT_I	wrpr	%r19, 0x0158, %tt
	.word 0xf53c8000  ! 547: STDF_R	std	%f26, [%r0, %r18]
	mov	0x1b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa3dc000  ! 551: STD_R	std	%r29, [%r23 + %r0]
	.word 0xf22561e8  ! 554: STW_I	stw	%r25, [%r21 + 0x01e8]
	mov	0x12f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf634c000  ! 559: STH_R	sth	%r27, [%r19 + %r0]
	.word 0xfc346175  ! 560: STH_I	sth	%r30, [%r17 + 0x0175]
	setx	data_start_7, %g1, %r18
	setx	0xa888509d00004950, %g1, %r10
	.word 0x839a8000  ! 562: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xfa3dc000  ! 563: STD_R	std	%r29, [%r23 + %r0]
	.word 0xfc2cc000  ! 567: STB_R	stb	%r30, [%r19 + %r0]
	setx	0x555b211b0000ef82, %g1, %r10
	.word 0x839a8000  ! 569: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf63c8000  ! 571: STD_R	std	%r27, [%r18 + %r0]
	.word 0xf33c612c  ! 572: STDF_I	std	%f25, [0x012c, %r17]
	mov	0x7, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf824a07a  ! 582: STW_I	stw	%r28, [%r18 + 0x007a]
	.word 0xfc2d8000  ! 584: STB_R	stb	%r30, [%r22 + %r0]
	.word 0xb7641800  ! 586: MOVcc_R	<illegal instruction>
	.word 0xb7518000  ! 589: RDPR_PSTATE	rdpr	%pstate, %r27
	mov	0x110, %o0
	ta	T_SEND_THRD_INTR
	mov	0x327, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc254000  ! 593: STW_R	stw	%r30, [%r21 + %r0]
	.word 0x89946098  ! 594: WRPR_TICK_I	wrpr	%r17, 0x0098, %tick
	mov	0x309, %o0
	ta	T_SEND_THRD_INTR
	.word 0x9195202a  ! 596: WRPR_PIL_I	wrpr	%r20, 0x002a, %pil
	.word 0xb5500000  ! 597: RDPR_TPC	rdpr	%tpc, %r26
	.word 0xf4354000  ! 601: STH_R	sth	%r26, [%r21 + %r0]
	.word 0x8394e1c1  ! 604: WRPR_TNPC_I	wrpr	%r19, 0x01c1, %tnpc
	.word 0xb49461c5  ! 607: ORcc_I	orcc 	%r17, 0x01c5, %r26
	.word 0xf8748000  ! 608: STX_R	stx	%r28, [%r18 + %r0]
	setx	0x82b6d83500007ed2, %g1, %r10
	.word 0x819a8000  ! 609: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xfc740000  ! 611: STX_R	stx	%r30, [%r16 + %r0]
	.word 0xb7540000  ! 613: RDPR_GL	rdpr	%-, %r27
	mov	0x122, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8794a02a  ! 615: WRPR_TT_I	wrpr	%r18, 0x002a, %tt
	.word 0xf275e0ce  ! 618: STX_I	stx	%r25, [%r23 + 0x00ce]
	.word 0x83946139  ! 619: WRPR_TNPC_I	wrpr	%r17, 0x0139, %tnpc
	mov	0x2a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5500000  ! 622: RDPR_TPC	rdpr	%tpc, %r26
	mov	0x33a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfb3de06c  ! 625: STDF_I	std	%f29, [0x006c, %r23]
	.word 0xf8244000  ! 626: STW_R	stw	%r28, [%r17 + %r0]
	.word 0xfb3de14a  ! 627: STDF_I	std	%f29, [0x014a, %r23]
	.word 0xb951c000  ! 628: RDPR_TL	<illegal instruction>
	.word 0xf0250000  ! 629: STW_R	stw	%r24, [%r20 + %r0]
	.word 0xfc3dc000  ! 632: STD_R	std	%r30, [%r23 + %r0]
	mov	0x20b, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r19
	.word 0xf53c0000  ! 640: STDF_R	std	%f26, [%r0, %r16]
	.word 0xf07420de  ! 648: STX_I	stx	%r24, [%r16 + 0x00de]
	.word 0xb72c6001  ! 649: SLL_I	sll 	%r17, 0x0001, %r27
	.word 0xf82560b2  ! 653: STW_I	stw	%r28, [%r21 + 0x00b2]
	.word 0xf6748000  ! 654: STX_R	stx	%r27, [%r18 + %r0]
	.word 0xf074e1b7  ! 660: STX_I	stx	%r24, [%r19 + 0x01b7]
	.word 0xf23c4000  ! 664: STD_R	std	%r25, [%r17 + %r0]
	.word 0xbd510000  ! 665: RDPR_TICK	<illegal instruction>
	mov	0x120, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf82d2141  ! 671: STB_I	stb	%r28, [%r20 + 0x0141]
	.word 0x8395a09e  ! 678: WRPR_TNPC_I	wrpr	%r22, 0x009e, %tnpc
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf0754000  ! 682: STX_R	stx	%r24, [%r21 + %r0]
	.word 0xb72c0000  ! 683: SLL_R	sll 	%r16, %r0, %r27
	.word 0xf874a1b4  ! 686: STX_I	stx	%r28, [%r18 + 0x01b4]
	.word 0xf4354000  ! 687: STH_R	sth	%r26, [%r21 + %r0]
	.word 0xf075a060  ! 692: STX_I	stx	%r24, [%r22 + 0x0060]
	.word 0xf83d0000  ! 694: STD_R	std	%r28, [%r20 + %r0]
	.word 0xfe3c8000  ! 696: STD_R	std	%r31, [%r18 + %r0]
	.word 0xf23d605e  ! 697: STD_I	std	%r25, [%r21 + 0x005e]
	mov	0x21a, %o0
	ta	T_SEND_THRD_INTR
	.word 0x83946072  ! 700: WRPR_TNPC_I	wrpr	%r17, 0x0072, %tnpc
	.word 0xf6358000  ! 703: STH_R	sth	%r27, [%r22 + %r0]
	.word 0x8d9420b9  ! 706: WRPR_PSTATE_I	wrpr	%r16, 0x00b9, %pstate
	.word 0xb9540000  ! 712: RDPR_GL	rdpr	%-, %r28
	.word 0xf33dc000  ! 715: STDF_R	std	%f25, [%r0, %r23]
	.word 0xf03c0000  ! 717: STD_R	std	%r24, [%r16 + %r0]
	.word 0xf475a0a5  ! 718: STX_I	stx	%r26, [%r22 + 0x00a5]
	setx	0x14275b900006f58, %g1, %r10
	.word 0x839a8000  ! 720: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x83942193  ! 721: WRPR_TNPC_I	wrpr	%r16, 0x0193, %tnpc
	.word 0xfa2c8000  ! 722: STB_R	stb	%r29, [%r18 + %r0]
	.word 0x919460ea  ! 726: WRPR_PIL_I	wrpr	%r17, 0x00ea, %pil
	.word 0x8794a1e8  ! 729: WRPR_TT_I	wrpr	%r18, 0x01e8, %tt
	.word 0xba8d608b  ! 730: ANDcc_I	andcc 	%r21, 0x008b, %r29
	mov	0x33c, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8d942183  ! 732: WRPR_PSTATE_I	wrpr	%r16, 0x0183, %pstate
	.word 0xf33da1cd  ! 733: STDF_I	std	%f25, [0x01cd, %r22]
	.word 0xb1518000  ! 735: RDPR_PSTATE	rdpr	%pstate, %r24
	.word 0xb644a08b  ! 741: ADDC_I	addc 	%r18, 0x008b, %r27
	.word 0x8595a165  ! 742: WRPR_TSTATE_I	wrpr	%r22, 0x0165, %tstate
	.word 0x8795e17e  ! 743: WRPR_TT_I	wrpr	%r23, 0x017e, %tt
	.word 0xf8250000  ! 744: STW_R	stw	%r28, [%r20 + %r0]
	.word 0xb015a0b0  ! 745: OR_I	or 	%r22, 0x00b0, %r24
	.word 0xfe2d0000  ! 746: STB_R	stb	%r31, [%r20 + %r0]
	.word 0xbb518000  ! 750: RDPR_PSTATE	rdpr	%pstate, %r29
	.word 0xfc24c000  ! 753: STW_R	stw	%r30, [%r19 + %r0]
	.word 0xfa340000  ! 754: STH_R	sth	%r29, [%r16 + %r0]
	.word 0xb3480000  ! 755: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xf825c000  ! 758: STW_R	stw	%r28, [%r23 + %r0]
	mov	0x30c, %o0
	ta	T_SEND_THRD_INTR
	setx	0x381c881400000f16, %g1, %r10
	.word 0x819a8000  ! 763: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf93de12d  ! 764: STDF_I	std	%f28, [0x012d, %r23]
	.word 0xb214a0fe  ! 768: OR_I	or 	%r18, 0x00fe, %r25
	.word 0xf6746032  ! 769: STX_I	stx	%r27, [%r17 + 0x0032]
	.word 0xff3d6034  ! 770: STDF_I	std	%f31, [0x0034, %r21]
	setx	data_start_6, %g1, %r17
	.word 0xf22d4000  ! 773: STB_R	stb	%r25, [%r21 + %r0]
	.word 0xf074c000  ! 774: STX_R	stx	%r24, [%r19 + %r0]
	.word 0xf675a04d  ! 778: STX_I	stx	%r27, [%r22 + 0x004d]
	.word 0xb3518000  ! 782: RDPR_PSTATE	rdpr	%pstate, %r25
	mov	1, %r12
	.word 0x8f930000  ! 783: WRPR_TL_R	wrpr	%r12, %r0, %tl
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	mov	0x12e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf73c8000  ! 788: STDF_R	std	%f27, [%r0, %r18]
	.word 0x8195201f  ! 789: WRPR_TPC_I	wrpr	%r20, 0x001f, %tpc
	.word 0xff3d4000  ! 792: STDF_R	std	%f31, [%r0, %r21]
	.word 0xfd3ce083  ! 793: STDF_I	std	%f30, [0x0083, %r19]
	.word 0xf8256003  ! 794: STW_I	stw	%r28, [%r21 + 0x0003]
	.word 0xf93c6069  ! 795: STDF_I	std	%f28, [0x0069, %r17]
	.word 0xf025c000  ! 796: STW_R	stw	%r24, [%r23 + %r0]
	.word 0xf2254000  ! 798: STW_R	stw	%r25, [%r21 + %r0]
	.word 0xf23cc000  ! 800: STD_R	std	%r25, [%r19 + %r0]
	.word 0xfa74e099  ! 803: STX_I	stx	%r29, [%r19 + 0x0099]
	.word 0xf875e12c  ! 805: STX_I	stx	%r28, [%r23 + 0x012c]
	.word 0xb3480000  ! 810: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xb950c000  ! 812: RDPR_TT	<illegal instruction>
	.word 0xbf500000  ! 813: RDPR_TPC	<illegal instruction>
	.word 0xbd540000  ! 815: RDPR_GL	<illegal instruction>
	.word 0xf235e160  ! 816: STH_I	sth	%r25, [%r23 + 0x0160]
	.word 0xfa35c000  ! 818: STH_R	sth	%r29, [%r23 + %r0]
	.word 0xf274a010  ! 821: STX_I	stx	%r25, [%r18 + 0x0010]
	.word 0xf2356157  ! 829: STH_I	sth	%r25, [%r21 + 0x0157]
	.word 0xfa342156  ! 830: STH_I	sth	%r29, [%r16 + 0x0156]
	.word 0xb9540000  ! 831: RDPR_GL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf22cc000  ! 833: STB_R	stb	%r25, [%r19 + %r0]
	.word 0xb9352001  ! 834: SRL_I	srl 	%r20, 0x0001, %r28
	.word 0xfa2ce1ae  ! 835: STB_I	stb	%r29, [%r19 + 0x01ae]
	.word 0xf67460ea  ! 840: STX_I	stx	%r27, [%r17 + 0x00ea]
	mov	0x32, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbabca1dd  ! 845: XNORcc_I	xnorcc 	%r18, 0x01dd, %r29
	.word 0xbcc46063  ! 851: ADDCcc_I	addccc 	%r17, 0x0063, %r30
	.word 0xb93c6001  ! 852: SRA_I	sra 	%r17, 0x0001, %r28
	.word 0xfe758000  ! 860: STX_R	stx	%r31, [%r22 + %r0]
	.word 0x9195e03f  ! 861: WRPR_PIL_I	wrpr	%r23, 0x003f, %pil
	mov	0x128, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf02560d8  ! 877: STW_I	stw	%r24, [%r21 + 0x00d8]
	mov	0x14, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf03cc000  ! 881: STD_R	std	%r24, [%r19 + %r0]
	.word 0xf634a17d  ! 887: STH_I	sth	%r27, [%r18 + 0x017d]
	.word 0xf42ca0ff  ! 890: STB_I	stb	%r26, [%r18 + 0x00ff]
	setx	data_start_0, %g1, %r21
	setx	0x4adf74cd00009f1d, %g1, %r10
	.word 0x839a8000  ! 897: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf0742196  ! 902: STX_I	stx	%r24, [%r16 + 0x0196]
	.word 0xb334c000  ! 904: SRL_R	srl 	%r19, %r0, %r25
	setx	data_start_0, %g1, %r20
	.word 0xfc250000  ! 910: STW_R	stw	%r30, [%r20 + %r0]
	.word 0xbb3c6001  ! 912: SRA_I	sra 	%r17, 0x0001, %r29
	.word 0xfc3ce1b9  ! 915: STD_I	std	%r30, [%r19 + 0x01b9]
	.word 0xfd3cc000  ! 918: STDF_R	std	%f30, [%r0, %r19]
	mov	0x207, %o0
	ta	T_SEND_THRD_INTR
	mov	0x2b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf635a12d  ! 922: STH_I	sth	%r27, [%r22 + 0x012d]
	.word 0xf63560af  ! 923: STH_I	sth	%r27, [%r21 + 0x00af]
	setx	0xa9a469950000695a, %g1, %r10
	.word 0x839a8000  ! 924: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbe24e0b8  ! 925: SUB_I	sub 	%r19, 0x00b8, %r31
	mov	1, %r12
	.word 0xa1930000  ! 928: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xfa348000  ! 929: STH_R	sth	%r29, [%r18 + %r0]
	.word 0xf874e146  ! 930: STX_I	stx	%r28, [%r19 + 0x0146]
	mov	0x235, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb28c8000  ! 932: ANDcc_R	andcc 	%r18, %r0, %r25
	.word 0xbb540000  ! 933: RDPR_GL	rdpr	%-, %r29
	.word 0x859561ea  ! 935: WRPR_TSTATE_I	wrpr	%r21, 0x01ea, %tstate
	.word 0xfa7420cc  ! 936: STX_I	stx	%r29, [%r16 + 0x00cc]
	mov	0x219, %o0
	ta	T_SEND_THRD_INTR
	mov	0, %r12
	.word 0x8f930000  ! 941: WRPR_TL_R	wrpr	%r12, %r0, %tl
	mov	0x303, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7500000  ! 948: RDPR_TPC	rdpr	%tpc, %r27
	mov	0x14, %o0
	ta	T_SEND_THRD_INTR
	mov	0x7, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf83dc000  ! 956: STD_R	std	%r28, [%r23 + %r0]
	.word 0xfc2c21b8  ! 959: STB_I	stb	%r30, [%r16 + 0x01b8]
	.word 0xf43c0000  ! 960: STD_R	std	%r26, [%r16 + %r0]
	mov	0, %r12
	.word 0xa1930000  ! 961: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xfa74c000  ! 962: STX_R	stx	%r29, [%r19 + %r0]
	setx	0xb11fb5f500007f19, %g1, %r10
	.word 0x839a8000  ! 963: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xfa240000  ! 966: STW_R	stw	%r29, [%r16 + %r0]
	.word 0xbf51c000  ! 967: RDPR_TL	rdpr	%tl, %r31
	.word 0xb73db001  ! 969: SRAX_I	srax	%r22, 0x0001, %r27
	.word 0x8795e01f  ! 971: WRPR_TT_I	wrpr	%r23, 0x001f, %tt
	.word 0xfe3d0000  ! 972: STD_R	std	%r31, [%r20 + %r0]
	.word 0xbe44217c  ! 977: ADDC_I	addc 	%r16, 0x017c, %r31
	mov	1, %r12
	.word 0xa1930000  ! 980: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf2744000  ! 982: STX_R	stx	%r25, [%r17 + %r0]
	.word 0xb350c000  ! 983: RDPR_TT	rdpr	%tt, %r25
	.word 0xb550c000  ! 986: RDPR_TT	<illegal instruction>
	.word 0xfc35a0a6  ! 987: STH_I	sth	%r30, [%r22 + 0x00a6]
	.word 0xfe25e043  ! 989: STW_I	stw	%r31, [%r23 + 0x0043]
	.word 0xf275c000  ! 993: STX_R	stx	%r25, [%r23 + %r0]
	mov	0, %r12
	.word 0x8f930000  ! 994: WRPR_TL_R	wrpr	%r12, %r0, %tl
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
	.word 0xfc1d0000  ! 1: LDD_R	ldd	[%r20 + %r0], %r30
	.word 0xfc444000  ! 8: LDSW_R	ldsw	[%r17 + %r0], %r30
	mov	0x338, %o0
	ta	T_SEND_THRD_INTR
	setx	0xc4caa0a100008811, %g1, %r10
	.word 0x839a8000  ! 12: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb60ca08e  ! 18: AND_I	and 	%r18, 0x008e, %r27
	mov	0x30c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6148000  ! 22: LDUH_R	lduh	[%r18 + %r0], %r27
	.word 0x919460a0  ! 23: WRPR_PIL_I	wrpr	%r17, 0x00a0, %pil
	.word 0xbf50c000  ! 27: RDPR_TT	<illegal instruction>
	.word 0xf844c000  ! 28: LDSW_R	ldsw	[%r19 + %r0], %r28
	.word 0xf21c4000  ! 29: LDD_R	ldd	[%r17 + %r0], %r25
	.word 0xf444c000  ! 30: LDSW_R	ldsw	[%r19 + %r0], %r26
	.word 0xb9520000  ! 36: RDPR_PIL	<illegal instruction>
	setx	data_start_2, %g1, %r19
	setx	0x8371f9b900009e96, %g1, %r10
	.word 0x839a8000  ! 38: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf404a0d5  ! 40: LDUW_I	lduw	[%r18 + 0x00d5], %r26
	.word 0xfe5c614a  ! 43: LDX_I	ldx	[%r17 + 0x014a], %r31
	.word 0xfa040000  ! 48: LDUW_R	lduw	[%r16 + %r0], %r29
	.word 0x83956105  ! 49: WRPR_TNPC_I	wrpr	%r21, 0x0105, %tnpc
	.word 0xf6546156  ! 50: LDSH_I	ldsh	[%r17 + 0x0156], %r27
	.word 0xbcb54000  ! 53: ORNcc_R	orncc 	%r21, %r0, %r30
	.word 0x9194e0c3  ! 54: WRPR_PIL_I	wrpr	%r19, 0x00c3, %pil
	.word 0x8395200d  ! 55: WRPR_TNPC_I	wrpr	%r20, 0x000d, %tnpc
	mov	0x113, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5520000  ! 65: RDPR_PIL	<illegal instruction>
	.word 0xf51d20ef  ! 67: LDDF_I	ldd	[%r20, 0x00ef], %f26
	.word 0xf44d8000  ! 68: LDSB_R	ldsb	[%r22 + %r0], %r26
	.word 0xfe0da096  ! 69: LDUB_I	ldub	[%r22 + 0x0096], %r31
	.word 0xb085e14b  ! 75: ADDcc_I	addcc 	%r23, 0x014b, %r24
	.word 0xfc44c000  ! 77: LDSW_R	ldsw	[%r19 + %r0], %r30
	.word 0xf055c000  ! 80: LDSH_R	ldsh	[%r23 + %r0], %r24
	.word 0xfa04608b  ! 82: LDUW_I	lduw	[%r17 + 0x008b], %r29
	.word 0x8d95a011  ! 84: WRPR_PSTATE_I	wrpr	%r22, 0x0011, %pstate
	.word 0xf40da025  ! 88: LDUB_I	ldub	[%r22 + 0x0025], %r26
	.word 0xfc5d2088  ! 95: LDX_I	ldx	[%r20 + 0x0088], %r30
	.word 0xf214a0bd  ! 97: LDUH_I	lduh	[%r18 + 0x00bd], %r25
	.word 0xf244e1c7  ! 99: LDSW_I	ldsw	[%r19 + 0x01c7], %r25
	.word 0xf31cc000  ! 100: LDDF_R	ldd	[%r19, %r0], %f25
	.word 0xf91cc000  ! 101: LDDF_R	ldd	[%r19, %r0], %f28
	.word 0xf04cc000  ! 102: LDSB_R	ldsb	[%r19 + %r0], %r24
	.word 0x8594e0b5  ! 103: WRPR_TSTATE_I	wrpr	%r19, 0x00b5, %tstate
	.word 0xb4b58000  ! 108: SUBCcc_R	orncc 	%r22, %r0, %r26
	.word 0xfc054000  ! 111: LDUW_R	lduw	[%r21 + %r0], %r30
	mov	0, %r12
	.word 0x8f930000  ! 113: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb57da401  ! 114: MOVR_I	movre	%r22, 0x1, %r26
	.word 0xbd540000  ! 121: RDPR_GL	<illegal instruction>
	.word 0xbf500000  ! 122: RDPR_TPC	<illegal instruction>
	.word 0xf855a06a  ! 123: LDSH_I	ldsh	[%r22 + 0x006a], %r28
	.word 0xb81ca094  ! 125: XOR_I	xor 	%r18, 0x0094, %r28
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xf11da126  ! 127: LDDF_I	ldd	[%r22, 0x0126], %f24
	mov	0x221, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa0cc000  ! 132: LDUB_R	ldub	[%r19 + %r0], %r29
	mov	0x114, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf854c000  ! 136: LDSH_R	ldsh	[%r19 + %r0], %r28
	.word 0xf51de1ff  ! 139: LDDF_I	ldd	[%r23, 0x01ff], %f26
	mov	0, %r12
	.word 0xa1930000  ! 140: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf44da066  ! 143: LDSB_I	ldsb	[%r22 + 0x0066], %r26
	.word 0xf0144000  ! 146: LDUH_R	lduh	[%r17 + %r0], %r24
	.word 0xb334c000  ! 148: SRL_R	srl 	%r19, %r0, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb9500000  ! 150: RDPR_TPC	<illegal instruction>
	mov	0x10f, %o0
	ta	T_SEND_THRD_INTR
	mov	1, %r12
	.word 0x8f930000  ! 154: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xfc15e07e  ! 155: LDUH_I	lduh	[%r23 + 0x007e], %r30
	.word 0xb8c4a0e1  ! 157: ADDCcc_I	addccc 	%r18, 0x00e1, %r28
	.word 0xf414a09d  ! 159: LDUH_I	lduh	[%r18 + 0x009d], %r26
	.word 0xf244a0f7  ! 160: LDSW_I	ldsw	[%r18 + 0x00f7], %r25
	mov	0x13, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd518000  ! 164: RDPR_PSTATE	<illegal instruction>
	mov	0x24, %o0
	ta	T_SEND_THRD_INTR
	mov	0x234, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc1de1a1  ! 170: LDD_I	ldd	[%r23 + 0x01a1], %r30
	.word 0xbf518000  ! 171: RDPR_PSTATE	<illegal instruction>
	.word 0xf4450000  ! 175: LDSW_R	ldsw	[%r20 + %r0], %r26
	.word 0xf64dc000  ! 177: LDSB_R	ldsb	[%r23 + %r0], %r27
	setx	data_start_3, %g1, %r17
	.word 0xb32c4000  ! 179: SLL_R	sll 	%r17, %r0, %r25
	.word 0xf51ca1b5  ! 181: LDDF_I	ldd	[%r18, 0x01b5], %f26
	.word 0xfe040000  ! 182: LDUW_R	lduw	[%r16 + %r0], %r31
	.word 0xb81dc000  ! 186: XOR_R	xor 	%r23, %r0, %r28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0x8194614f  ! 188: WRPR_TPC_I	wrpr	%r17, 0x014f, %tpc
	.word 0xb9508000  ! 192: RDPR_TSTATE	<illegal instruction>
	.word 0xf45d8000  ! 193: LDX_R	ldx	[%r22 + %r0], %r26
	.word 0xf604a112  ! 195: LDUW_I	lduw	[%r18 + 0x0112], %r27
	.word 0xbc340000  ! 196: SUBC_R	orn 	%r16, %r0, %r30
	.word 0xb1510000  ! 197: RDPR_TICK	<illegal instruction>
	.word 0xb3518000  ! 199: RDPR_PSTATE	<illegal instruction>
	.word 0xf444a015  ! 200: LDSW_I	ldsw	[%r18 + 0x0015], %r26
	setx	0x43edb33000004fdb, %g1, %r10
	.word 0x819a8000  ! 206: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	mov	0x32d, %o0
	ta	T_SEND_THRD_INTR
	mov	0x122, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf6158000  ! 227: LDUH_R	lduh	[%r22 + %r0], %r27
	.word 0xf81d615e  ! 228: LDD_I	ldd	[%r21 + 0x015e], %r28
	.word 0xf64d0000  ! 230: LDSB_R	ldsb	[%r20 + %r0], %r27
	.word 0x8595e14b  ! 232: WRPR_TSTATE_I	wrpr	%r23, 0x014b, %tstate
	.word 0xfb1de0db  ! 234: LDDF_I	ldd	[%r23, 0x00db], %f29
	.word 0x8195e1fb  ! 238: WRPR_TPC_I	wrpr	%r23, 0x01fb, %tpc
	.word 0xfe052175  ! 239: LDUW_I	lduw	[%r20 + 0x0175], %r31
	.word 0xfe05c000  ! 242: LDUW_R	lduw	[%r23 + %r0], %r31
	.word 0x81942079  ! 248: WRPR_TPC_I	wrpr	%r16, 0x0079, %tpc
	.word 0xbf518000  ! 249: RDPR_PSTATE	<illegal instruction>
	setx	data_start_4, %g1, %r18
	.word 0xf80d0000  ! 252: LDUB_R	ldub	[%r20 + %r0], %r28
	.word 0xf805e07a  ! 256: LDUW_I	lduw	[%r23 + 0x007a], %r28
	.word 0xb950c000  ! 257: RDPR_TT	<illegal instruction>
	.word 0xb3504000  ! 262: RDPR_TNPC	<illegal instruction>
	.word 0xfa050000  ! 263: LDUW_R	lduw	[%r20 + %r0], %r29
	.word 0xbe4420b1  ! 264: ADDC_I	addc 	%r16, 0x00b1, %r31
	.word 0xf85d2012  ! 267: LDX_I	ldx	[%r20 + 0x0012], %r28
	.word 0xf00d60b6  ! 271: LDUB_I	ldub	[%r21 + 0x00b6], %r24
	.word 0xf4044000  ! 280: LDUW_R	lduw	[%r17 + %r0], %r26
	.word 0xf005612b  ! 283: LDUW_I	lduw	[%r21 + 0x012b], %r24
	.word 0xfc5de052  ! 285: LDX_I	ldx	[%r23 + 0x0052], %r30
	mov	0x13b, %o0
	ta	T_SEND_THRD_INTR
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf255616b  ! 295: LDSH_I	ldsh	[%r21 + 0x016b], %r25
	.word 0xf60d0000  ! 296: LDUB_R	ldub	[%r20 + %r0], %r27
	.word 0xfe0c0000  ! 297: LDUB_R	ldub	[%r16 + %r0], %r31
	.word 0xb7508000  ! 298: RDPR_TSTATE	<illegal instruction>
	.word 0xbcb5c000  ! 299: SUBCcc_R	orncc 	%r23, %r0, %r30
	.word 0xf20c8000  ! 305: LDUB_R	ldub	[%r18 + %r0], %r25
	.word 0xf61c4000  ! 308: LDD_R	ldd	[%r17 + %r0], %r27
	.word 0xbe9c0000  ! 313: XORcc_R	xorcc 	%r16, %r0, %r31
	.word 0xf205e00f  ! 320: LDUW_I	lduw	[%r23 + 0x000f], %r25
	.word 0xf6046057  ! 321: LDUW_I	lduw	[%r17 + 0x0057], %r27
	mov	2, %r12
	.word 0xa1930000  ! 322: WRPR_GL_R	wrpr	%r12, %r0, %-
	mov	0x21a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb480000  ! 324: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0x8195e046  ! 333: WRPR_TPC_I	wrpr	%r23, 0x0046, %tpc
	.word 0xf845a0e0  ! 336: LDSW_I	ldsw	[%r22 + 0x00e0], %r28
	.word 0xb69de132  ! 338: XORcc_I	xorcc 	%r23, 0x0132, %r27
	.word 0xf60da1ce  ! 340: LDUB_I	ldub	[%r22 + 0x01ce], %r27
	.word 0xbf500000  ! 341: RDPR_TPC	<illegal instruction>
	.word 0xf40d4000  ! 342: LDUB_R	ldub	[%r21 + %r0], %r26
	.word 0xfa0c8000  ! 343: LDUB_R	ldub	[%r18 + %r0], %r29
	.word 0xb1540000  ! 346: RDPR_GL	<illegal instruction>
	.word 0xbab5c000  ! 349: SUBCcc_R	orncc 	%r23, %r0, %r29
	.word 0xf20ca03f  ! 351: LDUB_I	ldub	[%r18 + 0x003f], %r25
	.word 0xfa05a0f1  ! 352: LDUW_I	lduw	[%r22 + 0x00f1], %r29
	setx	data_start_5, %g1, %r17
	.word 0xf61c605f  ! 358: LDD_I	ldd	[%r17 + 0x005f], %r27
	.word 0xfc54c000  ! 360: LDSH_R	ldsh	[%r19 + %r0], %r30
	.word 0xf6554000  ! 366: LDSH_R	ldsh	[%r21 + %r0], %r27
	mov	0x31e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf20c6023  ! 368: LDUB_I	ldub	[%r17 + 0x0023], %r25
	setx	data_start_2, %g1, %r17
	.word 0xf65d2045  ! 370: LDX_I	ldx	[%r20 + 0x0045], %r27
	.word 0xb5540000  ! 374: RDPR_GL	<illegal instruction>
	mov	0x329, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb551c000  ! 376: RDPR_TL	<illegal instruction>
	.word 0xb0044000  ! 381: ADD_R	add 	%r17, %r0, %r24
	.word 0xf64de04f  ! 383: LDSB_I	ldsb	[%r23 + 0x004f], %r27
	.word 0xb3508000  ! 387: RDPR_TSTATE	<illegal instruction>
	setx	data_start_2, %g1, %r22
	.word 0xf8152062  ! 390: LDUH_I	lduh	[%r20 + 0x0062], %r28
	.word 0x8d95607e  ! 392: WRPR_PSTATE_I	wrpr	%r21, 0x007e, %pstate
	.word 0xb025c000  ! 393: SUB_R	sub 	%r23, %r0, %r24
	.word 0xf45c61a5  ! 394: LDX_I	ldx	[%r17 + 0x01a5], %r26
	.word 0x8394e1ec  ! 398: WRPR_TNPC_I	wrpr	%r19, 0x01ec, %tnpc
	.word 0xb2c48000  ! 399: ADDCcc_R	addccc 	%r18, %r0, %r25
	.word 0xb5480000  ! 403: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xba8c2080  ! 406: ANDcc_I	andcc 	%r16, 0x0080, %r29
	mov	0x24, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa5d60c4  ! 412: LDX_I	ldx	[%r21 + 0x00c4], %r29
	.word 0xf31ce1e9  ! 415: LDDF_I	ldd	[%r19, 0x01e9], %f25
	mov	0x16, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf014c000  ! 418: LDUH_R	lduh	[%r19 + %r0], %r24
	.word 0xf91d210b  ! 419: LDDF_I	ldd	[%r20, 0x010b], %f28
	.word 0xfe554000  ! 420: LDSH_R	ldsh	[%r21 + %r0], %r31
	.word 0xb1504000  ! 421: RDPR_TNPC	<illegal instruction>
	.word 0xb9508000  ! 425: RDPR_TSTATE	<illegal instruction>
	.word 0xfe5d6017  ! 426: LDX_I	ldx	[%r21 + 0x0017], %r31
	.word 0xf21c608d  ! 428: LDD_I	ldd	[%r17 + 0x008d], %r25
	.word 0xb7340000  ! 432: SRL_R	srl 	%r16, %r0, %r27
	.word 0xf51de101  ! 437: LDDF_I	ldd	[%r23, 0x0101], %f26
	.word 0xfe0c4000  ! 438: LDUB_R	ldub	[%r17 + %r0], %r31
	.word 0x89952198  ! 439: WRPR_TICK_I	wrpr	%r20, 0x0198, %tick
	.word 0xfc558000  ! 440: LDSH_R	ldsh	[%r22 + %r0], %r30
	.word 0xfe5ce1f6  ! 441: LDX_I	ldx	[%r19 + 0x01f6], %r31
	.word 0xfa042000  ! 442: LDUW_I	lduw	[%r16 + 0x0000], %r29
	setx	0x5ce2cc1f0000fd09, %g1, %r10
	.word 0x839a8000  ! 443: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb7518000  ! 445: RDPR_PSTATE	<illegal instruction>
	.word 0xbcbdc000  ! 446: XNORcc_R	xnorcc 	%r23, %r0, %r30
	.word 0xfa54e082  ! 449: LDSH_I	ldsh	[%r19 + 0x0082], %r29
	.word 0xb951c000  ! 450: RDPR_TL	<illegal instruction>
	setx	0x7c96abac0000bc9a, %g1, %r10
	.word 0x839a8000  ! 452: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xfc550000  ! 453: LDSH_R	ldsh	[%r20 + %r0], %r30
	mov	0x314, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf44c8000  ! 457: LDSB_R	ldsb	[%r18 + %r0], %r26
	setx	0xdbc0db6500004e0f, %g1, %r10
	.word 0x819a8000  ! 460: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf81c4000  ! 462: LDD_R	ldd	[%r17 + %r0], %r28
	mov	0x133, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3480000  ! 464: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xba054000  ! 465: ADD_R	add 	%r21, %r0, %r29
	.word 0xbb480000  ! 468: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xba250000  ! 473: SUB_R	sub 	%r20, %r0, %r29
	setx	0x6858c55b00005a18, %g1, %r10
	.word 0x839a8000  ! 474: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf8558000  ! 475: LDSH_R	ldsh	[%r22 + %r0], %r28
	.word 0xf00dc000  ! 476: LDUB_R	ldub	[%r23 + %r0], %r24
	.word 0xb1508000  ! 482: RDPR_TSTATE	rdpr	%tstate, %r24
	.word 0xf25c21bf  ! 486: LDX_I	ldx	[%r16 + 0x01bf], %r25
	mov	0x314, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc040000  ! 496: LDUW_R	lduw	[%r16 + %r0], %r30
	.word 0xfc4d4000  ! 497: LDSB_R	ldsb	[%r21 + %r0], %r30
	.word 0xf044a152  ! 499: LDSW_I	ldsw	[%r18 + 0x0152], %r24
	.word 0xf41cc000  ! 501: LDD_R	ldd	[%r19 + %r0], %r26
	.word 0xf0550000  ! 502: LDSH_R	ldsh	[%r20 + %r0], %r24
	.word 0xf40da011  ! 504: LDUB_I	ldub	[%r22 + 0x0011], %r26
	setx	0x99d8b8b20000bede, %g1, %r10
	.word 0x819a8000  ! 505: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf2040000  ! 506: LDUW_R	lduw	[%r16 + %r0], %r25
	mov	0x122, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf81d0000  ! 510: LDD_R	ldd	[%r20 + %r0], %r28
	.word 0xf2146190  ! 511: LDUH_I	lduh	[%r17 + 0x0190], %r25
	.word 0xfe54205a  ! 517: LDSH_I	ldsh	[%r16 + 0x005a], %r31
	mov	0x3c, %o0
	ta	T_SEND_THRD_INTR
	mov	0x333, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8d946011  ! 522: WRPR_PSTATE_I	wrpr	%r17, 0x0011, %pstate
	mov	0x205, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf65ca192  ! 526: LDX_I	ldx	[%r18 + 0x0192], %r27
	.word 0xb1508000  ! 528: RDPR_TSTATE	<illegal instruction>
	.word 0x8794e15b  ! 531: WRPR_TT_I	wrpr	%r19, 0x015b, %tt
	.word 0xf245e0dc  ! 532: LDSW_I	ldsw	[%r23 + 0x00dc], %r25
	.word 0xf414c000  ! 533: LDUH_R	lduh	[%r19 + %r0], %r26
	.word 0xb3508000  ! 534: RDPR_TSTATE	<illegal instruction>
	.word 0xb80d20fa  ! 535: AND_I	and 	%r20, 0x00fa, %r28
	.word 0xfa148000  ! 536: LDUH_R	lduh	[%r18 + %r0], %r29
	mov	0x331, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf045a02e  ! 539: LDSW_I	ldsw	[%r22 + 0x002e], %r24
	.word 0xb751c000  ! 540: RDPR_TL	<illegal instruction>
	.word 0xf01c2155  ! 541: LDD_I	ldd	[%r16 + 0x0155], %r24
	.word 0xfe146159  ! 542: LDUH_I	lduh	[%r17 + 0x0159], %r31
	setx	0xfdd51fea0000dad5, %g1, %r10
	.word 0x839a8000  ! 543: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x879461a1  ! 545: WRPR_TT_I	wrpr	%r17, 0x01a1, %tt
	mov	0x130, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfa54a057  ! 550: LDSH_I	ldsh	[%r18 + 0x0057], %r29
	.word 0xfc5d8000  ! 552: LDX_R	ldx	[%r22 + %r0], %r30
	.word 0xf25da0a8  ! 553: LDX_I	ldx	[%r22 + 0x00a8], %r25
	.word 0xfe15a059  ! 557: LDUH_I	lduh	[%r22 + 0x0059], %r31
	mov	0x14, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_6, %g1, %r21
	setx	0xc926fa200003ac8, %g1, %r10
	.word 0x839a8000  ! 562: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	setx	0x241876a900001d5c, %g1, %r10
	.word 0x839a8000  ! 569: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf4456064  ! 570: LDSW_I	ldsw	[%r21 + 0x0064], %r26
	.word 0xfa0d60f5  ! 574: LDUB_I	ldub	[%r21 + 0x00f5], %r29
	.word 0xfe54c000  ! 577: LDSH_R	ldsh	[%r19 + %r0], %r31
	.word 0xf64ce038  ! 578: LDSB_I	ldsb	[%r19 + 0x0038], %r27
	.word 0xf054a124  ! 579: LDSH_I	ldsh	[%r18 + 0x0124], %r24
	mov	0x19, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3641800  ! 586: MOVcc_R	<illegal instruction>
	.word 0xf24c207a  ! 587: LDSB_I	ldsb	[%r16 + 0x007a], %r25
	.word 0xb1518000  ! 589: RDPR_PSTATE	<illegal instruction>
	mov	0x32, %o0
	ta	T_SEND_THRD_INTR
	mov	0x1e, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8994a0ac  ! 594: WRPR_TICK_I	wrpr	%r18, 0x00ac, %tick
	mov	0x2a, %o0
	ta	T_SEND_THRD_INTR
	.word 0x9194e1d4  ! 596: WRPR_PIL_I	wrpr	%r19, 0x01d4, %pil
	.word 0xb3500000  ! 597: RDPR_TPC	<illegal instruction>
	.word 0xf445c000  ! 600: LDSW_R	ldsw	[%r23 + %r0], %r26
	.word 0x83956100  ! 604: WRPR_TNPC_I	wrpr	%r21, 0x0100, %tnpc
	.word 0xbe9420c1  ! 607: ORcc_I	orcc 	%r16, 0x00c1, %r31
	setx	0xc363a082000018d1, %g1, %r10
	.word 0x819a8000  ! 609: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf71de07a  ! 612: LDDF_I	ldd	[%r23, 0x007a], %f27
	.word 0xb7540000  ! 613: RDPR_GL	<illegal instruction>
	mov	0x107, %o0
	ta	T_SEND_THRD_INTR
	.word 0x879561ed  ! 615: WRPR_TT_I	wrpr	%r21, 0x01ed, %tt
	.word 0xfc158000  ! 617: LDUH_R	lduh	[%r22 + %r0], %r30
	.word 0x839520b2  ! 619: WRPR_TNPC_I	wrpr	%r20, 0x00b2, %tnpc
	.word 0xf24dc000  ! 620: LDSB_R	ldsb	[%r23 + %r0], %r25
	mov	0x15, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf500000  ! 622: RDPR_TPC	<illegal instruction>
	mov	0x325, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd51c000  ! 628: RDPR_TL	<illegal instruction>
	mov	0x114, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf814217d  ! 634: LDUH_I	lduh	[%r16 + 0x017d], %r28
	setx	data_start_7, %g1, %r16
	.word 0xf815618f  ! 639: LDUH_I	lduh	[%r21 + 0x018f], %r28
	.word 0xf845a0f5  ! 643: LDSW_I	ldsw	[%r22 + 0x00f5], %r28
	.word 0xbf2c2001  ! 649: SLL_I	sll 	%r16, 0x0001, %r31
	.word 0xf44da06c  ! 655: LDSB_I	ldsb	[%r22 + 0x006c], %r26
	.word 0xfa0421dc  ! 657: LDUW_I	lduw	[%r16 + 0x01dc], %r29
	.word 0xfe1c4000  ! 658: LDD_R	ldd	[%r17 + %r0], %r31
	.word 0xfa04c000  ! 659: LDUW_R	lduw	[%r19 + %r0], %r29
	.word 0xfc4c61bd  ! 663: LDSB_I	ldsb	[%r17 + 0x01bd], %r30
	.word 0xb5510000  ! 665: RDPR_TICK	<illegal instruction>
	mov	0x107, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc44e1b1  ! 670: LDSW_I	ldsw	[%r19 + 0x01b1], %r30
	.word 0xf01c6128  ! 672: LDD_I	ldd	[%r17 + 0x0128], %r24
	.word 0xf4148000  ! 676: LDUH_R	lduh	[%r18 + %r0], %r26
	.word 0x8394e066  ! 678: WRPR_TNPC_I	wrpr	%r19, 0x0066, %tnpc
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbd2d0000  ! 683: SLL_R	sll 	%r20, %r0, %r30
	.word 0xf00de098  ! 688: LDUB_I	ldub	[%r23 + 0x0098], %r24
	.word 0xfa556159  ! 691: LDSH_I	ldsh	[%r21 + 0x0159], %r29
	mov	0x326, %o0
	ta	T_SEND_THRD_INTR
	.word 0x83956027  ! 700: WRPR_TNPC_I	wrpr	%r21, 0x0027, %tnpc
	.word 0x8d9521ff  ! 706: WRPR_PSTATE_I	wrpr	%r20, 0x01ff, %pstate
	.word 0xfa1c8000  ! 707: LDD_R	ldd	[%r18 + %r0], %r29
	.word 0xb9540000  ! 712: RDPR_GL	<illegal instruction>
	.word 0xf8456076  ! 713: LDSW_I	ldsw	[%r21 + 0x0076], %r28
	.word 0xf00ca13f  ! 719: LDUB_I	ldub	[%r18 + 0x013f], %r24
	setx	0xdcde037a00005f5c, %g1, %r10
	.word 0x839a8000  ! 720: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x8394a1e0  ! 721: WRPR_TNPC_I	wrpr	%r18, 0x01e0, %tnpc
	.word 0xf2144000  ! 725: LDUH_R	lduh	[%r17 + %r0], %r25
	.word 0x9194e0c6  ! 726: WRPR_PIL_I	wrpr	%r19, 0x00c6, %pil
	.word 0x8794a0e8  ! 729: WRPR_TT_I	wrpr	%r18, 0x00e8, %tt
	.word 0xb88da0df  ! 730: ANDcc_I	andcc 	%r22, 0x00df, %r28
	mov	0x201, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8d94a04c  ! 732: WRPR_PSTATE_I	wrpr	%r18, 0x004c, %pstate
	.word 0xb3518000  ! 735: RDPR_PSTATE	<illegal instruction>
	.word 0xf91d605f  ! 736: LDDF_I	ldd	[%r21, 0x005f], %f28
	.word 0xf61c0000  ! 737: LDD_R	ldd	[%r16 + %r0], %r27
	.word 0xfa45c000  ! 738: LDSW_R	ldsw	[%r23 + %r0], %r29
	.word 0xb045e0ce  ! 741: ADDC_I	addc 	%r23, 0x00ce, %r24
	.word 0x859521cc  ! 742: WRPR_TSTATE_I	wrpr	%r20, 0x01cc, %tstate
	.word 0x8795a042  ! 743: WRPR_TT_I	wrpr	%r22, 0x0042, %tt
	.word 0xb2146179  ! 745: OR_I	or 	%r17, 0x0179, %r25
	.word 0xf91de153  ! 748: LDDF_I	ldd	[%r23, 0x0153], %f28
	.word 0xbd518000  ! 750: RDPR_PSTATE	<illegal instruction>
	.word 0xf055a1c8  ! 752: LDSH_I	ldsh	[%r22 + 0x01c8], %r24
	.word 0xbb480000  ! 755: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xf71d20de  ! 759: LDDF_I	ldd	[%r20, 0x00de], %f27
	mov	0x202, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf215a111  ! 762: LDUH_I	lduh	[%r22 + 0x0111], %r25
	setx	0xe123963100007a4c, %g1, %r10
	.word 0x819a8000  ! 763: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xfa448000  ! 767: LDSW_R	ldsw	[%r18 + %r0], %r29
	.word 0xb414e080  ! 768: OR_I	or 	%r19, 0x0080, %r26
	setx	data_start_7, %g1, %r18
	.word 0xfa14612f  ! 772: LDUH_I	lduh	[%r17 + 0x012f], %r29
	.word 0xf00ce095  ! 779: LDUB_I	ldub	[%r19 + 0x0095], %r24
	.word 0xb7518000  ! 782: RDPR_PSTATE	<illegal instruction>
	mov	1, %r12
	.word 0x8f930000  ! 783: WRPR_TL_R	wrpr	%r12, %r0, %tl
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfc5dc000  ! 785: LDX_R	ldx	[%r23 + %r0], %r30
	mov	0x307, %o0
	ta	T_SEND_THRD_INTR
	.word 0x819421dc  ! 789: WRPR_TPC_I	wrpr	%r16, 0x01dc, %tpc
	.word 0xfc048000  ! 790: LDUW_R	lduw	[%r18 + %r0], %r30
	.word 0xf85dc000  ! 806: LDX_R	ldx	[%r23 + %r0], %r28
	.word 0xf40521ab  ! 808: LDUW_I	lduw	[%r20 + 0x01ab], %r26
	.word 0xb5480000  ! 810: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xb150c000  ! 812: RDPR_TT	<illegal instruction>
	.word 0xbb500000  ! 813: RDPR_TPC	<illegal instruction>
	.word 0xfa554000  ! 814: LDSH_R	ldsh	[%r21 + %r0], %r29
	.word 0xb5540000  ! 815: RDPR_GL	<illegal instruction>
	.word 0xf415a0f4  ! 817: LDUH_I	lduh	[%r22 + 0x00f4], %r26
	.word 0xf20461e2  ! 819: LDUW_I	lduw	[%r17 + 0x01e2], %r25
	.word 0xfb1cc000  ! 823: LDDF_R	ldd	[%r19, %r0], %f29
	.word 0xf65da188  ! 824: LDX_I	ldx	[%r22 + 0x0188], %r27
	.word 0xfc0c2182  ! 825: LDUB_I	ldub	[%r16 + 0x0182], %r30
	.word 0xf04c0000  ! 826: LDSB_R	ldsb	[%r16 + %r0], %r24
	.word 0xf015a078  ! 828: LDUH_I	lduh	[%r22 + 0x0078], %r24
	.word 0xbd540000  ! 831: RDPR_GL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbb346001  ! 834: SRL_I	srl 	%r17, 0x0001, %r29
	.word 0xfe05a02b  ! 838: LDUW_I	lduw	[%r22 + 0x002b], %r31
	mov	0x319, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf844a172  ! 843: LDSW_I	ldsw	[%r18 + 0x0172], %r28
	.word 0xbcbca0fe  ! 845: XNORcc_I	xnorcc 	%r18, 0x00fe, %r30
	.word 0xf80521ba  ! 847: LDUW_I	lduw	[%r20 + 0x01ba], %r28
	.word 0xf6544000  ! 848: LDSH_R	ldsh	[%r17 + %r0], %r27
	.word 0xbac4e07d  ! 851: ADDCcc_I	addccc 	%r19, 0x007d, %r29
	.word 0xb53ca001  ! 852: SRA_I	sra 	%r18, 0x0001, %r26
	.word 0xf11de096  ! 853: LDDF_I	ldd	[%r23, 0x0096], %f24
	.word 0xf71d200d  ! 854: LDDF_I	ldd	[%r20, 0x000d], %f27
	.word 0xf41560c7  ! 855: LDUH_I	lduh	[%r21 + 0x00c7], %r26
	.word 0xfa05e12c  ! 856: LDUW_I	lduw	[%r23 + 0x012c], %r29
	.word 0x9194e194  ! 861: WRPR_PIL_I	wrpr	%r19, 0x0194, %pil
	.word 0xf004c000  ! 862: LDUW_R	lduw	[%r19 + %r0], %r24
	mov	0x10d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf45d4000  ! 868: LDX_R	ldx	[%r21 + %r0], %r26
	.word 0xf60460c1  ! 869: LDUW_I	lduw	[%r17 + 0x00c1], %r27
	.word 0xfb1c0000  ! 879: LDDF_R	ldd	[%r16, %r0], %f29
	mov	0x21d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf0046162  ! 884: LDUW_I	lduw	[%r17 + 0x0162], %r24
	.word 0xf05c21fc  ! 885: LDX_I	ldx	[%r16 + 0x01fc], %r24
	.word 0xfc44e05e  ! 888: LDSW_I	ldsw	[%r19 + 0x005e], %r30
	.word 0xf214a1a2  ! 893: LDUH_I	lduh	[%r18 + 0x01a2], %r25
	.word 0xfc458000  ! 894: LDSW_R	ldsw	[%r22 + %r0], %r30
	setx	data_start_3, %g1, %r22
	.word 0xfc558000  ! 896: LDSH_R	ldsh	[%r22 + %r0], %r30
	setx	0xe9408baf00009bd3, %g1, %r10
	.word 0x839a8000  ! 897: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf6040000  ! 898: LDUW_R	lduw	[%r16 + %r0], %r27
	.word 0xfe0d6163  ! 903: LDUB_I	ldub	[%r21 + 0x0163], %r31
	.word 0xb5344000  ! 904: SRL_R	srl 	%r17, %r0, %r26
	setx	data_start_2, %g1, %r22
	.word 0xf805a161  ! 907: LDUW_I	lduw	[%r22 + 0x0161], %r28
	.word 0xf244a16b  ! 909: LDSW_I	ldsw	[%r18 + 0x016b], %r25
	.word 0xb93c6001  ! 912: SRA_I	sra 	%r17, 0x0001, %r28
	.word 0xf81d21af  ! 913: LDD_I	ldd	[%r20 + 0x01af], %r28
	mov	0x226, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf60c4000  ! 920: LDUB_R	ldub	[%r17 + %r0], %r27
	mov	0x323, %o0
	ta	T_SEND_THRD_INTR
	setx	0x449109aa00009f88, %g1, %r10
	.word 0x839a8000  ! 924: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb224e1fa  ! 925: SUB_I	sub 	%r19, 0x01fa, %r25
	mov	1, %r12
	.word 0xa1930000  ! 928: WRPR_GL_R	wrpr	%r12, %r0, %-
	mov	0x13f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb28d0000  ! 932: ANDcc_R	andcc 	%r20, %r0, %r25
	.word 0xb5540000  ! 933: RDPR_GL	<illegal instruction>
	.word 0x8594a1a5  ! 935: WRPR_TSTATE_I	wrpr	%r18, 0x01a5, %tstate
	mov	0x25, %o0
	ta	T_SEND_THRD_INTR
	mov	2, %r12
	.word 0x8f930000  ! 941: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf85c21ca  ! 943: LDX_I	ldx	[%r16 + 0x01ca], %r28
	.word 0xf00560e4  ! 944: LDUW_I	lduw	[%r21 + 0x00e4], %r24
	mov	0x138, %o0
	ta	T_SEND_THRD_INTR
	.word 0xf84d0000  ! 946: LDSB_R	ldsb	[%r20 + %r0], %r28
	.word 0xb5500000  ! 948: RDPR_TPC	<illegal instruction>
	mov	0x15, %o0
	ta	T_SEND_THRD_INTR
	mov	0x6, %o0
	ta	T_SEND_THRD_INTR
	.word 0xfc548000  ! 952: LDSH_R	ldsh	[%r18 + %r0], %r30
	.word 0xff1ce08f  ! 955: LDDF_I	ldd	[%r19, 0x008f], %f31
	mov	2, %r12
	.word 0xa1930000  ! 961: WRPR_GL_R	wrpr	%r12, %r0, %-
	setx	0x237f726b0000cd46, %g1, %r10
	.word 0x839a8000  ! 963: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xfc45c000  ! 965: LDSW_R	ldsw	[%r23 + %r0], %r30
	.word 0xb151c000  ! 967: RDPR_TL	rdpr	%tl, %r24
	.word 0xf40c600d  ! 968: LDUB_I	ldub	[%r17 + 0x000d], %r26
	.word 0xb13c3001  ! 969: SRAX_I	srax	%r16, 0x0001, %r24
	.word 0x8795e006  ! 971: WRPR_TT_I	wrpr	%r23, 0x0006, %tt
	.word 0xf20d2022  ! 974: LDUB_I	ldub	[%r20 + 0x0022], %r25
	.word 0xbc442128  ! 977: ADDC_I	addc 	%r16, 0x0128, %r30
	mov	2, %r12
	.word 0xa1930000  ! 980: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb150c000  ! 983: RDPR_TT	<illegal instruction>
	.word 0xf51d4000  ! 985: LDDF_R	ldd	[%r21, %r0], %f26
	.word 0xbd50c000  ! 986: RDPR_TT	<illegal instruction>
	.word 0xf6454000  ! 988: LDSW_R	ldsw	[%r21 + %r0], %r27
	.word 0xf614a0c1  ! 990: LDUH_I	lduh	[%r18 + 0x00c1], %r27
	.word 0xff1da0da  ! 991: LDDF_I	ldd	[%r22, 0x00da], %f31
	mov	1, %r12
	.word 0x8f930000  ! 994: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf44d4000  ! 997: LDSB_R	ldsb	[%r21 + %r0], %r26
	.word 0xfa540000  ! 998: LDSH_R	ldsh	[%r16 + %r0], %r29
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	.word 0xb3ab0820  ! 2: FMOVGU	fmovs	%fcc1, %f0, %f25
	.word 0xb3a48860  ! 5: FADDq	dis not found

	mov	0x102, %o0
	ta	T_SEND_THRD_INTR
	setx	0xeaf9678b00000f00, %g1, %r10
	.word 0x839a8000  ! 12: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb9a4c8a0  ! 13: FSUBs	fsubs	%f19, %f0, %f28
	.word 0xb00da0da  ! 18: AND_I	and 	%r22, 0x00da, %r24
	.word 0xb9a98820  ! 20: FMOVNEG	fmovs	%fcc1, %f0, %f28
	mov	0x23b, %o0
	ta	T_SEND_THRD_INTR
	.word 0x9194608b  ! 23: WRPR_PIL_I	wrpr	%r17, 0x008b, %pil
	.word 0xbba00040  ! 25: FMOVd	fmovd	%f0, %f60
	.word 0xb950c000  ! 27: RDPR_TT	<illegal instruction>
	.word 0xbda589e0  ! 33: FDIVq	dis not found

	.word 0xbb520000  ! 36: RDPR_PIL	<illegal instruction>
	setx	data_start_1, %g1, %r20
	setx	0x3d9f968200003e9c, %g1, %r10
	.word 0x839a8000  ! 38: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbfa5c960  ! 42: FMULq	dis not found

	.word 0xb1a448c0  ! 44: FSUBd	fsubd	%f48, %f0, %f24
	.word 0xb9a409e0  ! 45: FDIVq	dis not found

	.word 0xb7ab0820  ! 46: FMOVGU	fmovs	%fcc1, %f0, %f27
	.word 0x8394a094  ! 49: WRPR_TNPC_I	wrpr	%r18, 0x0094, %tnpc
	.word 0xbba48960  ! 51: FMULq	dis not found

	.word 0xb7a00520  ! 52: FSQRTs	fsqrt	
	.word 0xb2b40000  ! 53: ORNcc_R	orncc 	%r16, %r0, %r25
	.word 0x9194615e  ! 54: WRPR_PIL_I	wrpr	%r17, 0x015e, %pil
	.word 0x8394a0e6  ! 55: WRPR_TNPC_I	wrpr	%r18, 0x00e6, %tnpc
	.word 0xb5a84820  ! 57: FMOVE	fmovs	%fcc1, %f0, %f26
	.word 0xb5a489c0  ! 59: FDIVd	fdivd	%f18, %f0, %f26
	.word 0xb7a00520  ! 63: FSQRTs	fsqrt	
	mov	0x10d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbb520000  ! 65: RDPR_PIL	<illegal instruction>
	.word 0xb7a00560  ! 73: FSQRTq	fsqrt	
	.word 0xb085e144  ! 75: ADDcc_I	addcc 	%r23, 0x0144, %r24
	.word 0xbda449c0  ! 76: FDIVd	fdivd	%f48, %f0, %f30
	.word 0xbba44960  ! 79: FMULq	dis not found

	.word 0xb5aac820  ! 81: FMOVGE	fmovs	%fcc1, %f0, %f26
	.word 0x8d9561c9  ! 84: WRPR_PSTATE_I	wrpr	%r21, 0x01c9, %pstate
	.word 0xb1a48840  ! 86: FADDd	faddd	%f18, %f0, %f24
	.word 0xbda84820  ! 87: FMOVE	fmovs	%fcc1, %f0, %f30
	.word 0xb3a58840  ! 89: FADDd	faddd	%f22, %f0, %f56
	.word 0xb7a4c9a0  ! 92: FDIVs	fdivs	%f19, %f0, %f27
	.word 0xbba00520  ! 94: FSQRTs	fsqrt	
	.word 0xb1a4c820  ! 96: FADDs	fadds	%f19, %f0, %f24
	.word 0x8595a072  ! 103: WRPR_TSTATE_I	wrpr	%r22, 0x0072, %tstate
	.word 0xb5a90820  ! 104: FMOVLEU	fmovs	%fcc1, %f0, %f26
	.word 0xb8b40000  ! 108: SUBCcc_R	orncc 	%r16, %r0, %r28
	mov	0, %r12
	.word 0x8f930000  ! 113: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbd7c6401  ! 114: MOVR_I	movre	%r17, 0x1, %r30
	.word 0xbf540000  ! 121: RDPR_GL	<illegal instruction>
	.word 0xbd500000  ! 122: RDPR_TPC	<illegal instruction>
	.word 0xbc1da0b1  ! 125: XOR_I	xor 	%r22, 0x00b1, %r30
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb3a84820  ! 128: FMOVE	fmovs	%fcc1, %f0, %f25
	.word 0xbda88820  ! 129: FMOVLE	fmovs	%fcc1, %f0, %f30
	mov	0x124, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa54940  ! 134: FMULd	fmuld	%f52, %f0, %f62
	mov	0x31b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a548e0  ! 138: FSUBq	dis not found

	mov	0, %r12
	.word 0xa1930000  ! 140: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb1a40860  ! 142: FADDq	dis not found

	.word 0xb9a98820  ! 145: FMOVNEG	fmovs	%fcc1, %f0, %f28
	.word 0xbf344000  ! 148: SRL_R	srl 	%r17, %r0, %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb5500000  ! 150: RDPR_TPC	<illegal instruction>
	mov	0x1c, %o0
	ta	T_SEND_THRD_INTR
	mov	0, %r12
	.word 0x8f930000  ! 154: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb2c5a17c  ! 157: ADDCcc_I	addccc 	%r22, 0x017c, %r25
	mov	0x310, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda00520  ! 162: FSQRTs	fsqrt	
	.word 0xbba40820  ! 163: FADDs	fadds	%f16, %f0, %f29
	.word 0xbf518000  ! 164: RDPR_PSTATE	<illegal instruction>
	.word 0xb7a98820  ! 165: FMOVNEG	fmovs	%fcc1, %f0, %f27
	mov	0x225, %o0
	ta	T_SEND_THRD_INTR
	mov	0x2a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf518000  ! 171: RDPR_PSTATE	<illegal instruction>
	.word 0xbfa48820  ! 173: FADDs	fadds	%f18, %f0, %f31
	.word 0xb3a81420  ! 174: FMOVRNZ	dis not found

	.word 0xb1a00560  ! 176: FSQRTq	fsqrt	
	setx	data_start_3, %g1, %r20
	.word 0xb92d4000  ! 179: SLL_R	sll 	%r21, %r0, %r28
	.word 0xbba58920  ! 183: FMULs	fmuls	%f22, %f0, %f29
	.word 0xb01dc000  ! 186: XOR_R	xor 	%r23, %r0, %r24
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0x819421fc  ! 188: WRPR_TPC_I	wrpr	%r16, 0x01fc, %tpc
	.word 0xb5a50940  ! 190: FMULd	fmuld	%f20, %f0, %f26
	.word 0xb9508000  ! 192: RDPR_TSTATE	<illegal instruction>
	.word 0xbbabc820  ! 194: FMOVVC	fmovs	%fcc1, %f0, %f29
	.word 0xb2348000  ! 196: SUBC_R	orn 	%r18, %r0, %r25
	.word 0xb3510000  ! 197: RDPR_TICK	<illegal instruction>
	.word 0xbfaa4820  ! 198: FMOVNE	fmovs	%fcc1, %f0, %f31
	.word 0xb3518000  ! 199: RDPR_PSTATE	<illegal instruction>
	.word 0xbdab0820  ! 201: FMOVGU	fmovs	%fcc1, %f0, %f30
	.word 0xb5abc820  ! 204: FMOVVC	fmovs	%fcc1, %f0, %f26
	setx	0xbf4506a20000bd90, %g1, %r10
	.word 0x819a8000  ! 206: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	mov	0x22c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a488e0  ! 218: FSUBq	dis not found

	mov	0x306, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda488c0  ! 221: FSUBd	fsubd	%f18, %f0, %f30
	.word 0xb7a00560  ! 224: FSQRTq	fsqrt	
	.word 0x8594e09a  ! 232: WRPR_TSTATE_I	wrpr	%r19, 0x009a, %tstate
	.word 0xb1a80820  ! 235: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
	.word 0xb1a80c20  ! 236: FMOVRLZ	dis not found

	.word 0x819421cf  ! 238: WRPR_TPC_I	wrpr	%r16, 0x01cf, %tpc
	.word 0xbfa54960  ! 240: FMULq	dis not found

	.word 0xb1a81420  ! 243: FMOVRNZ	dis not found

	.word 0xbba80820  ! 246: FMOVRLEZ	fmovs	%fcc1, %f0, %f29
	.word 0x8195a139  ! 248: WRPR_TPC_I	wrpr	%r22, 0x0139, %tpc
	.word 0xb3518000  ! 249: RDPR_PSTATE	<illegal instruction>
	setx	data_start_2, %g1, %r22
	.word 0xb5aa0820  ! 251: FMOVA	fmovs	%fcc1, %f0, %f26
	.word 0xb750c000  ! 257: RDPR_TT	<illegal instruction>
	.word 0xbda00040  ! 258: FMOVd	fmovd	%f0, %f30
	.word 0xbb504000  ! 262: RDPR_TNPC	<illegal instruction>
	.word 0xbe44e14f  ! 264: ADDC_I	addc 	%r19, 0x014f, %r31
	.word 0xbfaa0820  ! 265: FMOVA	fmovs	%fcc1, %f0, %f31
	.word 0xbdab4820  ! 268: FMOVCC	fmovs	%fcc1, %f0, %f30
	.word 0xbba80820  ! 275: FMOVRLEZ	fmovs	%fcc1, %f0, %f29
	.word 0xb9a409c0  ! 286: FDIVd	fdivd	%f16, %f0, %f28
	.word 0xbfab4820  ! 288: FMOVCC	fmovs	%fcc1, %f0, %f31
	mov	0x23, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a88820  ! 290: FMOVLE	fmovs	%fcc1, %f0, %f27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb7508000  ! 298: RDPR_TSTATE	<illegal instruction>
	.word 0xb2b5c000  ! 299: SUBCcc_R	orncc 	%r23, %r0, %r25
	.word 0xbda80420  ! 300: FMOVRZ	dis not found

	.word 0xb3a80820  ! 311: FMOVRLEZ	fmovs	%fcc1, %f0, %f25
	.word 0xb09c4000  ! 313: XORcc_R	xorcc 	%r17, %r0, %r24
	.word 0xb7aa4820  ! 314: FMOVNE	fmovs	%fcc1, %f0, %f27
	mov	2, %r12
	.word 0xa1930000  ! 322: WRPR_GL_R	wrpr	%r12, %r0, %-
	mov	0x133, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbf480000  ! 324: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xbda48920  ! 325: FMULs	fmuls	%f18, %f0, %f30
	.word 0x8195e102  ! 333: WRPR_TPC_I	wrpr	%r23, 0x0102, %tpc
	.word 0xbfa90820  ! 335: FMOVLEU	fmovs	%fcc1, %f0, %f31
	.word 0xba9d2171  ! 338: XORcc_I	xorcc 	%r20, 0x0171, %r29
	.word 0xb1a00540  ! 339: FSQRTd	fsqrt	
	.word 0xbb500000  ! 341: RDPR_TPC	<illegal instruction>
	.word 0xb5540000  ! 346: RDPR_GL	<illegal instruction>
	.word 0xbdabc820  ! 347: FMOVVC	fmovs	%fcc1, %f0, %f30
	.word 0xbba54960  ! 348: FMULq	dis not found

	.word 0xb4b50000  ! 349: SUBCcc_R	orncc 	%r20, %r0, %r26
	setx	data_start_4, %g1, %r18
	.word 0xbdaa4820  ! 362: FMOVNE	fmovs	%fcc1, %f0, %f30
	.word 0xb5a5c960  ! 365: FMULq	dis not found

	mov	0x1f, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_4, %g1, %r17
	.word 0xb1a548a0  ! 371: FSUBs	fsubs	%f21, %f0, %f24
	.word 0xbda88820  ! 372: FMOVLE	fmovs	%fcc1, %f0, %f30
	.word 0xb5a40960  ! 373: FMULq	dis not found

	.word 0xbb540000  ! 374: RDPR_GL	<illegal instruction>
	mov	0x16, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb151c000  ! 376: RDPR_TL	<illegal instruction>
	.word 0xbba00520  ! 377: FSQRTs	fsqrt	
	.word 0xbfa80420  ! 378: FMOVRZ	dis not found

	.word 0xb2058000  ! 381: ADD_R	add 	%r22, %r0, %r25
	.word 0xb9508000  ! 387: RDPR_TSTATE	<illegal instruction>
	setx	data_start_7, %g1, %r23
	.word 0x8d9561fe  ! 392: WRPR_PSTATE_I	wrpr	%r21, 0x01fe, %pstate
	.word 0xba25c000  ! 393: SUB_R	sub 	%r23, %r0, %r29
	.word 0x8394e118  ! 398: WRPR_TNPC_I	wrpr	%r19, 0x0118, %tnpc
	.word 0xbcc48000  ! 399: ADDCcc_R	addccc 	%r18, %r0, %r30
	.word 0xb9a50840  ! 401: FADDd	faddd	%f20, %f0, %f28
	.word 0xbb480000  ! 403: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xb28d20ba  ! 406: ANDcc_I	andcc 	%r20, 0x00ba, %r25
	mov	0x7, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3a509c0  ! 410: FDIVd	fdivd	%f20, %f0, %f56
	.word 0xbda54860  ! 414: FADDq	dis not found

	mov	0x2c, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9504000  ! 421: RDPR_TNPC	<illegal instruction>
	.word 0xbfa4c820  ! 423: FADDs	fadds	%f19, %f0, %f31
	.word 0xb9508000  ! 425: RDPR_TSTATE	<illegal instruction>
	.word 0xb7aac820  ! 429: FMOVGE	fmovs	%fcc1, %f0, %f27
	.word 0xb535c000  ! 432: SRL_R	srl 	%r23, %r0, %r26
	.word 0xbfa00560  ! 436: FSQRTq	fsqrt	
	.word 0x8994a1be  ! 439: WRPR_TICK_I	wrpr	%r18, 0x01be, %tick
	setx	0x84512cb00000fa83, %g1, %r10
	.word 0x839a8000  ! 443: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbf518000  ! 445: RDPR_PSTATE	<illegal instruction>
	.word 0xbcbcc000  ! 446: XNORcc_R	xnorcc 	%r19, %r0, %r30
	.word 0xbda94820  ! 447: FMOVCS	fmovs	%fcc1, %f0, %f30
	.word 0xbb51c000  ! 450: RDPR_TL	<illegal instruction>
	setx	0x81a5760e000079cc, %g1, %r10
	.word 0x839a8000  ! 452: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	mov	0x32e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a4c960  ! 459: FMULq	dis not found

	setx	0xf0d06af800006e91, %g1, %r10
	.word 0x819a8000  ! 460: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	mov	0x20d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb3480000  ! 464: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xb2044000  ! 465: ADD_R	add 	%r17, %r0, %r25
	.word 0xbb480000  ! 468: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xba25c000  ! 473: SUB_R	sub 	%r23, %r0, %r29
	setx	0x9d86b01800001f91, %g1, %r10
	.word 0x839a8000  ! 474: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbda4c9c0  ! 477: FDIVd	fdivd	%f50, %f0, %f30
	.word 0xb1508000  ! 482: RDPR_TSTATE	<illegal instruction>
	.word 0xb1a00040  ! 483: FMOVd	fmovd	%f0, %f24
	.word 0xb9a58960  ! 487: FMULq	dis not found

	.word 0xb3a508c0  ! 488: FSUBd	fsubd	%f20, %f0, %f56
	mov	0x13c, %o0
	ta	T_SEND_THRD_INTR
	setx	0x4a68b9d800006d09, %g1, %r10
	.word 0x819a8000  ! 505: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	mov	0x21d, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a44840  ! 512: FADDd	faddd	%f48, %f0, %f28
	.word 0xb3a00560  ! 514: FSQRTq	fsqrt	
	.word 0xb3a80820  ! 516: FMOVN	fmovs	%fcc1, %f0, %f25
	mov	0x3, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbabc820  ! 520: FMOVVC	fmovs	%fcc1, %f0, %f29
	mov	0x30c, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8d95a09b  ! 522: WRPR_PSTATE_I	wrpr	%r22, 0x009b, %pstate
	.word 0xbda50820  ! 523: FADDs	fadds	%f20, %f0, %f30
	mov	0x21b, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a00520  ! 527: FSQRTs	fsqrt	
	.word 0xb3508000  ! 528: RDPR_TSTATE	<illegal instruction>
	.word 0x87946189  ! 531: WRPR_TT_I	wrpr	%r17, 0x0189, %tt
	.word 0xb3508000  ! 534: RDPR_TSTATE	<illegal instruction>
	.word 0xb00de151  ! 535: AND_I	and 	%r23, 0x0151, %r24
	mov	0x116, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb951c000  ! 540: RDPR_TL	<illegal instruction>
	setx	0xe195e4a00004e0d, %g1, %r10
	.word 0x839a8000  ! 543: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x8795a09c  ! 545: WRPR_TT_I	wrpr	%r22, 0x009c, %tt
	mov	0x31a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb1a80820  ! 556: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
	mov	0x310, %o0
	ta	T_SEND_THRD_INTR
	setx	data_start_2, %g1, %r21
	setx	0xa94651f00009d5f, %g1, %r10
	.word 0x839a8000  ! 562: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb9a409c0  ! 564: FDIVd	fdivd	%f16, %f0, %f28
	.word 0xbfa88820  ! 565: FMOVLE	fmovs	%fcc1, %f0, %f31
	.word 0xb5aa8820  ! 566: FMOVG	fmovs	%fcc1, %f0, %f26
	.word 0xb1a50840  ! 568: FADDd	faddd	%f20, %f0, %f24
	setx	0xdf8cba300004b12, %g1, %r10
	.word 0x839a8000  ! 569: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb9ab8820  ! 575: FMOVPOS	fmovs	%fcc1, %f0, %f28
	.word 0xb1a508a0  ! 580: FSUBs	fsubs	%f20, %f0, %f24
	mov	0x16, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd641800  ! 586: MOVcc_R	<illegal instruction>
	.word 0xb7a00540  ! 588: FSQRTd	fsqrt	
	.word 0xbb518000  ! 589: RDPR_PSTATE	<illegal instruction>
	mov	0x5, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbda94820  ! 591: FMOVCS	fmovs	%fcc1, %f0, %f30
	mov	0x2d, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8994e110  ! 594: WRPR_TICK_I	wrpr	%r19, 0x0110, %tick
	mov	0x212, %o0
	ta	T_SEND_THRD_INTR
	.word 0x9195e0fd  ! 596: WRPR_PIL_I	wrpr	%r23, 0x00fd, %pil
	.word 0xbb500000  ! 597: RDPR_TPC	<illegal instruction>
	.word 0xb9a489e0  ! 599: FDIVq	dis not found

	.word 0x83956000  ! 604: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	.word 0xbba448e0  ! 605: FSUBq	dis not found

	.word 0xbe946080  ! 607: ORcc_I	orcc 	%r17, 0x0080, %r31
	setx	0x9c67964600005a9c, %g1, %r10
	.word 0x819a8000  ! 609: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbf540000  ! 613: RDPR_GL	<illegal instruction>
	mov	0x3b, %o0
	ta	T_SEND_THRD_INTR
	.word 0x87946003  ! 615: WRPR_TT_I	wrpr	%r17, 0x0003, %tt
	.word 0xbda00020  ! 616: FMOVs	fmovs	%f0, %f30
	.word 0x8394e138  ! 619: WRPR_TNPC_I	wrpr	%r19, 0x0138, %tnpc
	mov	0x4, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9500000  ! 622: RDPR_TPC	<illegal instruction>
	mov	0x208, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbd51c000  ! 628: RDPR_TL	<illegal instruction>
	mov	0x11, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb5a549e0  ! 635: FDIVq	dis not found

	.word 0xb5a00520  ! 636: FSQRTs	fsqrt	
	setx	data_start_6, %g1, %r17
	.word 0xb9a5c960  ! 641: FMULq	dis not found

	.word 0xb7a81c20  ! 642: FMOVRGEZ	dis not found

	.word 0xb9a5c9a0  ! 644: FDIVs	fdivs	%f23, %f0, %f28
	.word 0xbda588e0  ! 646: FSUBq	dis not found

	.word 0xbfab4820  ! 647: FMOVCC	fmovs	%fcc1, %f0, %f31
	.word 0xb52ca001  ! 649: SLL_I	sll 	%r18, 0x0001, %r26
	.word 0xb1a80c20  ! 651: FMOVRLZ	dis not found

	.word 0xb5a54940  ! 661: FMULd	fmuld	%f52, %f0, %f26
	.word 0xb7a48840  ! 662: FADDd	faddd	%f18, %f0, %f58
	.word 0xb9510000  ! 665: RDPR_TICK	<illegal instruction>
	mov	0x333, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb9a00020  ! 673: FMOVs	fmovs	%f0, %f28
	.word 0x83942098  ! 678: WRPR_TNPC_I	wrpr	%r16, 0x0098, %tnpc
	.word 0xb7a44940  ! 679: FMULd	fmuld	%f48, %f0, %f58
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xbb2d0000  ! 683: SLL_R	sll 	%r20, %r0, %r29
	.word 0xb5a50940  ! 684: FMULd	fmuld	%f20, %f0, %f26
	.word 0xb7a4c8c0  ! 689: FSUBd	fsubd	%f50, %f0, %f58
	.word 0xb3aa0820  ! 690: FMOVA	fmovs	%fcc1, %f0, %f25
	.word 0xb3a508a0  ! 698: FSUBs	fsubs	%f20, %f0, %f25
	mov	0x6, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8394607b  ! 700: WRPR_TNPC_I	wrpr	%r17, 0x007b, %tnpc
	.word 0xbba00040  ! 701: FMOVd	fmovd	%f0, %f60
	.word 0xbba00560  ! 702: FSQRTq	fsqrt	
	.word 0xbda508a0  ! 705: FSUBs	fsubs	%f20, %f0, %f30
	.word 0x8d9460cc  ! 706: WRPR_PSTATE_I	wrpr	%r17, 0x00cc, %pstate
	.word 0xbda00040  ! 710: FMOVd	fmovd	%f0, %f30
	.word 0xb9540000  ! 712: RDPR_GL	<illegal instruction>
	.word 0xb3a48840  ! 714: FADDd	faddd	%f18, %f0, %f56
	.word 0xb9a408e0  ! 716: FSUBq	dis not found

	setx	0xa6d8f8bc00007d40, %g1, %r10
	.word 0x839a8000  ! 720: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x8394a0bb  ! 721: WRPR_TNPC_I	wrpr	%r18, 0x00bb, %tnpc
	.word 0xb1a80820  ! 724: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
	.word 0x9194a002  ! 726: WRPR_PIL_I	wrpr	%r18, 0x0002, %pil
	.word 0x8795a029  ! 729: WRPR_TT_I	wrpr	%r22, 0x0029, %tt
	.word 0xb68d2141  ! 730: ANDcc_I	andcc 	%r20, 0x0141, %r27
	mov	0x112, %o0
	ta	T_SEND_THRD_INTR
	.word 0x8d94a1b9  ! 732: WRPR_PSTATE_I	wrpr	%r18, 0x01b9, %pstate
	.word 0xbba00560  ! 734: FSQRTq	fsqrt	
	.word 0xbf518000  ! 735: RDPR_PSTATE	<illegal instruction>
	.word 0xb3aa4820  ! 739: FMOVNE	fmovs	%fcc1, %f0, %f25
	.word 0xbc45a189  ! 741: ADDC_I	addc 	%r22, 0x0189, %r30
	.word 0x859521b2  ! 742: WRPR_TSTATE_I	wrpr	%r20, 0x01b2, %tstate
	.word 0x87952103  ! 743: WRPR_TT_I	wrpr	%r20, 0x0103, %tt
	.word 0xb615a1d4  ! 745: OR_I	or 	%r22, 0x01d4, %r27
	.word 0xbbab0820  ! 747: FMOVGU	fmovs	%fcc1, %f0, %f29
	.word 0xb7a48860  ! 749: FADDq	dis not found

	.word 0xbf518000  ! 750: RDPR_PSTATE	<illegal instruction>
	.word 0xb1480000  ! 755: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xbda84820  ! 756: FMOVE	fmovs	%fcc1, %f0, %f30
	.word 0xb7a94820  ! 760: FMOVCS	fmovs	%fcc1, %f0, %f27
	mov	0x200, %o0
	ta	T_SEND_THRD_INTR
	setx	0x87cd76d900002f91, %g1, %r10
	.word 0x819a8000  ! 763: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbfa508a0  ! 765: FSUBs	fsubs	%f20, %f0, %f31
	.word 0xbfa00040  ! 766: FMOVd	fmovd	%f0, %f62
	.word 0xbe15e0c6  ! 768: OR_I	or 	%r23, 0x00c6, %r31
	setx	data_start_4, %g1, %r20
	.word 0xbba00540  ! 781: FSQRTd	fsqrt	
	.word 0xb7518000  ! 782: RDPR_PSTATE	<illegal instruction>
	mov	2, %r12
	.word 0x8f930000  ! 783: WRPR_TL_R	wrpr	%r12, %r0, %tl
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	mov	0x33, %o0
	ta	T_SEND_THRD_INTR
	.word 0x819421dd  ! 789: WRPR_TPC_I	wrpr	%r16, 0x01dd, %tpc
	.word 0xbdab4820  ! 797: FMOVCC	fmovs	%fcc1, %f0, %f30
	.word 0xb5a588e0  ! 804: FSUBq	dis not found

	.word 0xb7480000  ! 810: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xb7a448c0  ! 811: FSUBd	fsubd	%f48, %f0, %f58
	.word 0xb950c000  ! 812: RDPR_TT	<illegal instruction>
	.word 0xbd500000  ! 813: RDPR_TPC	<illegal instruction>
	.word 0xbf540000  ! 815: RDPR_GL	<illegal instruction>
	.word 0xbda508e0  ! 820: FSUBq	dis not found

	.word 0xbda409c0  ! 822: FDIVd	fdivd	%f16, %f0, %f30
	.word 0xb7a588c0  ! 827: FSUBd	fsubd	%f22, %f0, %f58
	.word 0xb7540000  ! 831: RDPR_GL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbd346001  ! 834: SRL_I	srl 	%r17, 0x0001, %r30
	.word 0xb1aa4820  ! 837: FMOVNE	fmovs	%fcc1, %f0, %f24
	.word 0xbda8c820  ! 841: FMOVL	fmovs	%fcc1, %f0, %f30
	mov	0x20f, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb4bce19b  ! 845: XNORcc_I	xnorcc 	%r19, 0x019b, %r26
	.word 0xb7a448e0  ! 846: FSUBq	dis not found

	.word 0xb7aa8820  ! 849: FMOVG	fmovs	%fcc1, %f0, %f27
	.word 0xb7a00540  ! 850: FSQRTd	fsqrt	
	.word 0xb0c5e079  ! 851: ADDCcc_I	addccc 	%r23, 0x0079, %r24
	.word 0xbf3de001  ! 852: SRA_I	sra 	%r23, 0x0001, %r31
	.word 0xbfa80c20  ! 857: FMOVRLZ	dis not found

	.word 0xbda00560  ! 858: FSQRTq	fsqrt	
	.word 0x9195e183  ! 861: WRPR_PIL_I	wrpr	%r23, 0x0183, %pil
	mov	0x238, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbbaac820  ! 865: FMOVGE	fmovs	%fcc1, %f0, %f29
	.word 0xbfa5c840  ! 870: FADDd	faddd	%f54, %f0, %f62
	.word 0xbfaac820  ! 874: FMOVGE	fmovs	%fcc1, %f0, %f31
	.word 0xb3ab0820  ! 876: FMOVGU	fmovs	%fcc1, %f0, %f25
	.word 0xb3a90820  ! 878: FMOVLEU	fmovs	%fcc1, %f0, %f25
	mov	0x202, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa98820  ! 883: FMOVNEG	fmovs	%fcc1, %f0, %f31
	setx	data_start_7, %g1, %r22
	setx	0xd2766ac00000d858, %g1, %r10
	.word 0x839a8000  ! 897: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb9a4c9e0  ! 899: FDIVq	dis not found

	.word 0xb1a00040  ! 900: FMOVd	fmovd	%f0, %f24
	.word 0xb935c000  ! 904: SRL_R	srl 	%r23, %r0, %r28
	.word 0xb7a00540  ! 905: FSQRTd	fsqrt	
	setx	data_start_4, %g1, %r20
	.word 0xb1a509e0  ! 908: FDIVq	dis not found

	.word 0xb7aa8820  ! 911: FMOVG	fmovs	%fcc1, %f0, %f27
	.word 0xb13d6001  ! 912: SRA_I	sra 	%r21, 0x0001, %r24
	.word 0xb7a80820  ! 916: FMOVRLEZ	fmovs	%fcc1, %f0, %f27
	mov	0x23, %o0
	ta	T_SEND_THRD_INTR
	mov	0x27, %o0
	ta	T_SEND_THRD_INTR
	setx	0x2651756a00008c16, %g1, %r10
	.word 0x839a8000  ! 924: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb02520fa  ! 925: SUB_I	sub 	%r20, 0x00fa, %r24
	.word 0xbfa549e0  ! 926: FDIVq	dis not found

	mov	1, %r12
	.word 0xa1930000  ! 928: WRPR_GL_R	wrpr	%r12, %r0, %-
	mov	0x32a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb28cc000  ! 932: ANDcc_R	andcc 	%r19, %r0, %r25
	.word 0xb5540000  ! 933: RDPR_GL	<illegal instruction>
	.word 0x8594e12e  ! 935: WRPR_TSTATE_I	wrpr	%r19, 0x012e, %tstate
	.word 0xb5aa4820  ! 937: FMOVNE	fmovs	%fcc1, %f0, %f26
	.word 0xbfa44940  ! 938: FMULd	fmuld	%f48, %f0, %f62
	mov	0x30f, %o0
	ta	T_SEND_THRD_INTR
	mov	0, %r12
	.word 0x8f930000  ! 941: WRPR_TL_R	wrpr	%r12, %r0, %tl
	mov	0x22a, %o0
	ta	T_SEND_THRD_INTR
	.word 0xbfa81c20  ! 947: FMOVRGEZ	dis not found

	.word 0xb3500000  ! 948: RDPR_TPC	<illegal instruction>
	.word 0xbfa84820  ! 949: FMOVE	fmovs	%fcc1, %f0, %f31
	mov	0x35, %o0
	ta	T_SEND_THRD_INTR
	mov	0x32e, %o0
	ta	T_SEND_THRD_INTR
	.word 0xb7a80420  ! 954: FMOVRZ	dis not found

	.word 0xb3a50820  ! 958: FADDs	fadds	%f20, %f0, %f25
	mov	0, %r12
	.word 0xa1930000  ! 961: WRPR_GL_R	wrpr	%r12, %r0, %-
	setx	0x36885bc900008f04, %g1, %r10
	.word 0x839a8000  ! 963: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbda81c20  ! 964: FMOVRGEZ	dis not found

	.word 0xb951c000  ! 967: RDPR_TL	<illegal instruction>
	.word 0xbb3cf001  ! 969: SRAX_I	srax	%r19, 0x0001, %r29
	.word 0x87942010  ! 971: WRPR_TT_I	wrpr	%r16, 0x0010, %tt
	.word 0xb5a58940  ! 973: FMULd	fmuld	%f22, %f0, %f26
	.word 0xb5a449c0  ! 976: FDIVd	fdivd	%f48, %f0, %f26
	.word 0xb445a07b  ! 977: ADDC_I	addc 	%r22, 0x007b, %r26
	.word 0xbbab0820  ! 978: FMOVGU	fmovs	%fcc1, %f0, %f29
	mov	1, %r12
	.word 0xa1930000  ! 980: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb550c000  ! 983: RDPR_TT	<illegal instruction>
	.word 0xbd50c000  ! 986: RDPR_TT	<illegal instruction>
	.word 0xb7a88820  ! 992: FMOVLE	fmovs	%fcc1, %f0, %f27
	mov	1, %r12
	.word 0x8f930000  ! 994: WRPR_TL_R	wrpr	%r12, %r0, %tl

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

	.xword	0x0266b7358d24ec90
	.xword	0xd4c599347117f43f
	.xword	0xb52c96535bdc3587
	.xword	0x5c7cb90a9a4dae86
	.xword	0x74ee19a532f38c38
	.xword	0x37ec1b370d9e57d8
	.xword	0x263a24aad886f6c8
	.xword	0xa9b5f19245410155
	.xword	0x64cecd6f9167e304
	.xword	0xd96b6045cfdb0356
	.xword	0x3cfb606d5fbb52dd
	.xword	0xaa48d19c525ddfb6
	.xword	0x07420b9b9a55d8d2
	.xword	0x727b937a10c7a77f
	.xword	0xf31a276506a25865
	.xword	0x2b34efab2f9e523c
	.xword	0x9df329b0e6a5384f
	.xword	0xeb3f1ff84f918af1
	.xword	0x84c1c746fd174e2a
	.xword	0x69a9df4ce39ced42
	.xword	0xc724a0b6fe96bb29
	.xword	0xa5b5b243331eda24
	.xword	0xecda6ea91b017060
	.xword	0x04b5c1304c463432
	.xword	0x28b2b14e166985bf
	.xword	0x95a79ce081e55de5
	.xword	0x034d66b2e89512c7
	.xword	0xeb227b6a6bd0099e
	.xword	0xc3456a96804fcdb8
	.xword	0x927bff7e3b84432e
	.xword	0x3246a6e399b7301b
	.xword	0x47f19917da5a9556
	.xword	0xce28f965ccabb061
	.xword	0xfc28ed037fed755a
	.xword	0xa2d0add099c6d987
	.xword	0x02a1501802b44973
	.xword	0x031aaef2f38ef7b4
	.xword	0x23d878176dd6f52e
	.xword	0xc4f12a55fb41fb1d
	.xword	0xea8fbd02e0c0cdb3
	.xword	0x71e97d670b1483d6
	.xword	0x41fa044d97633254
	.xword	0x85605d0e3423108b
	.xword	0x74215cb6ddb9b720
	.xword	0xae6dfffd4cd7382e
	.xword	0x6b61fb4b9fd6f351
	.xword	0x2ed80cda7b3550c4
	.xword	0x3e29049b47742680
	.xword	0xc51b60f2f23a1f08
	.xword	0x766a6db1d5d7cc18
	.xword	0x1c15376bcb18e024
	.xword	0x8925de057714ca5a
	.xword	0x115e25f0fc322f1f
	.xword	0x006eb1e15aac9b80
	.xword	0x09e497695fba27bd
	.xword	0x89066cddbd211352
	.xword	0x55bd560ad008744f
	.xword	0x958af24109d9011e
	.xword	0x15b9991df12f9809
	.xword	0x29a7e6b6711bf0cc
	.xword	0x1a52c3a6789a7d7b
	.xword	0x237b9dfcf5eb2883
	.xword	0xaecdf3a415749c53
	.xword	0xea2f01ed4736d114
	.xword	0x975c133064c97d25
	.xword	0xe3061f0b19690c50
	.xword	0x072f664b3c7b6b35
	.xword	0xf1828a394b5914ad
	.xword	0x890f14779d6392b5
	.xword	0xce0ebd930f55191b
	.xword	0xf85b112c53f31864
	.xword	0xfbc08fca0fb74ed0
	.xword	0xfb6a736f6f62f342
	.xword	0x2b5b1df87a19072a
	.xword	0x3b21a42b4e040fcb
	.xword	0xc874f89340ee3a20
	.xword	0x3f9390dcffabaf48
	.xword	0xc780ec248a9df030
	.xword	0x017788374345c3a0
	.xword	0x324d0d5c8c7f42d2
	.xword	0x946b474069621ac4
	.xword	0x13588010b147bfd6
	.xword	0x7edab558d9c07670
	.xword	0xa5f29f56f3a1be5b
	.xword	0xe5089f46ebcde7f4
	.xword	0xde5df595ccbffa88
	.xword	0x746311423310099d
	.xword	0xf4d9a4fcd364409c
	.xword	0x6e45c7d5bba57255
	.xword	0x950d76ba0e135e85
	.xword	0xea71fb63356ca4c1
	.xword	0xf8df3500289b3000
	.xword	0xd483bfefa3ed4909
	.xword	0x9e6c849965f61372
	.xword	0xd19a597e3eb447f4
	.xword	0xe2eda146855c4091
	.xword	0x25d5952816327b88
	.xword	0x004cd24117d4970e
	.xword	0xaa7bef4d47e491cd
	.xword	0x23c90917ab1b363e
	.xword	0x5cc2e7b344c9cd89
	.xword	0x363114874c994c5e
	.xword	0x34780c141926211c
	.xword	0xdab6d1f541ce161c
	.xword	0x95e35abbeb4d3bc1
	.xword	0xff8a5f2b542d5430
	.xword	0x2474bb90c951154c
	.xword	0x90a1c81b948efbc5
	.xword	0x8ff152dfb602cf61
	.xword	0xa5ec629b67752ccf
	.xword	0x238ea3a1a97297ad
	.xword	0x78e022f36af14b3d
	.xword	0xe90690003359b689
	.xword	0x9c219ed9ce69a4d3
	.xword	0x403635a787a0d515
	.xword	0xd4434cc201203890
	.xword	0x269209c13d946830
	.xword	0xad6b06a7e554ab28
	.xword	0xced2ab9c7494918a
	.xword	0x96953fcebcd3b9de
	.xword	0x6fd3f35895cfa807
	.xword	0xb2226cd9bcba0c07
	.xword	0xc91525881a89820b
	.xword	0xf854273938ebc3f3
	.xword	0x83e6dadba7aabcc0
	.xword	0x15b5b95b2ba311e2
	.xword	0xaa52ac0097f12b37
	.xword	0xb419a3093c103a82
	.xword	0x45fe802f3b99a8d1
	.xword	0x6f21b408d1900929
	.xword	0x44907ff8cb342c9d
	.xword	0x44626a3f93ce9823
	.xword	0xbe64f09faf1e4dad
	.xword	0x0507810d3b158ce8
	.xword	0x0becbf641385f2a0
	.xword	0x1285e29c64c8a782
	.xword	0x9ae1624c831536b4
	.xword	0xa35d7a9b08d6205e
	.xword	0xfb5ca4464967e939
	.xword	0xb42d99e69b3c5d6f
	.xword	0xfbbbbb8aa7d5ecf5
	.xword	0x73d7a9efdf0a72a7
	.xword	0x6062490fde89e214
	.xword	0xb0db12f1b7a0bd91
	.xword	0x50f86aea5cd18a2b
	.xword	0x727830bf3804ba9f
	.xword	0x41485c33954f3eae
	.xword	0x9bb2f8301945a5e3
	.xword	0xf911be19c685557c
	.xword	0x775ca937a7fb601f
	.xword	0x145249eae61c6d3f
	.xword	0x2ec3be9a28703aa0
	.xword	0xf7d333e3fdfb55c5
	.xword	0x8c3433fb842db7b7
	.xword	0xb440d6a98faf45e9
	.xword	0xaf7abb5a075234c9
	.xword	0x43381c31608d4db4
	.xword	0x20b36a1cc19638d6
	.xword	0x35bd68ef891db0da
	.xword	0x0f6847f1bea4ce63
	.xword	0x8564876c944d8232
	.xword	0xf088808a22efd278
	.xword	0x0d6ea50bee13c6cb
	.xword	0x9f4eafc5814f5739
	.xword	0x5dc9283a6ea7e069
	.xword	0xc03528caedc99f2f
	.xword	0xc0749fdc1207c513
	.xword	0xfa62740cf692dc29
	.xword	0x00d97c8c7e530fae
	.xword	0x52334fb9f253f472
	.xword	0x355ca8aa70815779
	.xword	0x8ded9c492dc4ec63
	.xword	0xe5415605ba01af5f
	.xword	0x2c995fbacb57c56f
	.xword	0x79884e907622e37c
	.xword	0x47464db93c9d13f8
	.xword	0xcce50314bb4aeab3
	.xword	0x727c039af8d5ac21
	.xword	0x9b1a9d7747998016
	.xword	0x19c15c67e39d2bfa
	.xword	0x973c6a298fb2b3c8
	.xword	0xb90efba86d7b741c
	.xword	0x58e21530c1f4c6a8
	.xword	0x5cbea5f6e00ac4ff
	.xword	0x0effb98850338961
	.xword	0x77124a3ff029aa80
	.xword	0xbd7f8d75762d1013
	.xword	0x5af370780df71243
	.xword	0xa246c78749a8ad88
	.xword	0x33994726d9036ef8
	.xword	0x81d7beeb0f4efc91
	.xword	0x1da0d45b081ff06e
	.xword	0x044aa6ddd8d332fb
	.xword	0xa9fbcbd22e7c7af0
	.xword	0x95d88e3ed6aba30d
	.xword	0xe458d367c6335e36
	.xword	0xcaa4d0dcbeae57d2
	.xword	0xc9c7db6fbde842ce
	.xword	0x49e7415c6b9320ca
	.xword	0x4487d0487425106f
	.xword	0xdab236f8ba3508e3
	.xword	0xce9ba6f0ab07a124
	.xword	0xbb4bc6e70167b6fc
	.xword	0xcd81c8ed74e58283
	.xword	0x69635f392f36959f
	.xword	0xdd33515be89bb73e
	.xword	0x9b40117c72ecb5b4
	.xword	0x4a98ff8bb2c657da
	.xword	0x74ea16b63c94c34f
	.xword	0x9858a43c15bc40e3
	.xword	0x498874be4e34f8c2
	.xword	0xf91c8c6f5d16f127
	.xword	0x6adebc43ea1f5fd9
	.xword	0xc1c5e13b4e6c0c79
	.xword	0x3a308498867cbb1f
	.xword	0x0e5a5cbb91a6944a
	.xword	0x7e48afa2b34bf099
	.xword	0x806b8255098a1d72
	.xword	0xe701dc39eb1018bc
	.xword	0xae065402d1a9f33c
	.xword	0x9e71651985a1418c
	.xword	0x3141e6bec9dce8a2
	.xword	0x1a6729901565f512
	.xword	0x3f5158e71763217b
	.xword	0x26bb2d2198dcf29d
	.xword	0xc04c14b2b7c48e1b
	.xword	0xe52fc61df7f1a6d1
	.xword	0xcc26da19d3fba5e1
	.xword	0x9a9007c42aa8c12c
	.xword	0x16c2d097217c2d17
	.xword	0x1c4b4734b039b382
	.xword	0x7a66f2857249e64b
	.xword	0x2ca1168d85981392
	.xword	0xa94147988a114767
	.xword	0x5aff6a6493f1b52a
	.xword	0xc95d66cc12fcc5ca
	.xword	0x316d97c693876856
	.xword	0x8180a5a879ca49a8
	.xword	0x5282d49ce0f9941e
	.xword	0xca7db43463d149a0
	.xword	0xe329ff00966f5127
	.xword	0xcf793d8c6d0412d6
	.xword	0x5ece405ccfbde824
	.xword	0xeb26c825411f88e3
	.xword	0x81720b5f24b64016
	.xword	0xf8780e498c8b9d43
	.xword	0xb78b3a6447800470
	.xword	0xc0945c88e1e72d2f
	.xword	0xb5bcb514d1fc35e7
	.xword	0x5fcb3da917651866
	.xword	0xe425055692a489d6
	.xword	0xa2de92a828d2a8c7
	.xword	0x69c3d58cae287605
	.xword	0x7334a071f1786e4d
	.xword	0x8fad7796d54c0083
	.xword	0xaa03043bdab743d0
	.align 0x2000
	.data
data_start_1:

	.xword	0x3d95630aa5de290a
	.xword	0x44fe2d8a843c8da4
	.xword	0x43173dc5e0df8014
	.xword	0x4551d7cb3d55f7c0
	.xword	0x5fcc49bb63257b5b
	.xword	0x97bf2d6e262d6c48
	.xword	0x823babe31f9ba16b
	.xword	0x236fa5f2286afe33
	.xword	0xe57d446cc01b6be5
	.xword	0x0778dab7c0d16011
	.xword	0x151876d895d7b4c6
	.xword	0x8ba237c49e606673
	.xword	0xb83368de5da553ed
	.xword	0x316d63d3e5297ccf
	.xword	0x863e6cee9cd0b8d4
	.xword	0x29dfafde3c352ccb
	.xword	0x6b987d0472933b74
	.xword	0x471fc17cc4374e44
	.xword	0x947ca282e2dcb930
	.xword	0x431c50a551b58e59
	.xword	0xf384cfea1c056497
	.xword	0x8d3d3383d6cc27b3
	.xword	0x2853a89b2af9ac71
	.xword	0xbca0c37bf57e4913
	.xword	0x3eed579d1791b0d8
	.xword	0xbe86638af049d089
	.xword	0x7673a19c1aad8a66
	.xword	0xdb6a62bb8a5a02c2
	.xword	0xe5c4a686ecea4850
	.xword	0x6261d6800f46b19a
	.xword	0x2e497ae11782a3c7
	.xword	0x29f013f999b1f84e
	.xword	0x5f134185f5ba01a3
	.xword	0xa85b090f4301483c
	.xword	0x76f09f0ac32f9374
	.xword	0xcccbd788e21cd000
	.xword	0x1cf8a03087107c07
	.xword	0x29fb2911bf3156b5
	.xword	0xbf8db096e335905f
	.xword	0x370977a402d8db12
	.xword	0x1495d1d51f931d37
	.xword	0xb0d6d30b0c57e2fc
	.xword	0x6a3fd8fa4303ef5e
	.xword	0xb83f1e9f47fa3e25
	.xword	0x086e7cb836f50cc5
	.xword	0x9ae3fcce7e1e0c11
	.xword	0xe8339dea68d62a95
	.xword	0x034805d962b3b0b7
	.xword	0x68451749d3a0339b
	.xword	0x47ba1fa6452f344e
	.xword	0xd49ac4c36f1a141a
	.xword	0x13c66c8060e60dd1
	.xword	0x727ed6f2919f2cd1
	.xword	0xeb7c30b0428e058c
	.xword	0x10e7c81d14218fdc
	.xword	0xbf83b76d8b3ad2a7
	.xword	0xfdb7e16f8625c6a7
	.xword	0x8fd3b3cce84d2717
	.xword	0x0a6335e41fd35ad8
	.xword	0x282b2080e2bf75b7
	.xword	0x938a99cf375fc2d7
	.xword	0xf4680648c924a375
	.xword	0x133b527278afafb0
	.xword	0x6b455decfbcfd871
	.xword	0xe0cd77411845d2d5
	.xword	0xdc0b8c95cdee702b
	.xword	0xac8c4023d1c5443b
	.xword	0x9686cf2290af6206
	.xword	0x4b17897303be23ad
	.xword	0xd3acbfb034bc5bd9
	.xword	0x514c63302d6282ae
	.xword	0x533fe29f4528de18
	.xword	0x2b53c6ce6397252b
	.xword	0xc64f016c6e6017ae
	.xword	0x944ae51c9aeb9a87
	.xword	0xafc37b02ca53fbc6
	.xword	0x227bb4f7116fd449
	.xword	0x316c04989ad104f3
	.xword	0x71c62f391f375138
	.xword	0x9eb57921b6a38e89
	.xword	0xe918915468ea8016
	.xword	0x2b306899f694e8e9
	.xword	0x273667dfef991c30
	.xword	0x612d090fdedcea9a
	.xword	0xda71fe308dff3d6e
	.xword	0xf0228d183d4ffa2b
	.xword	0x76e13bb63cf38f93
	.xword	0x0b653906c5a67449
	.xword	0x8f57d1e6faf52676
	.xword	0x11b3525f6d6e3bde
	.xword	0xa900b261ec4323ec
	.xword	0x71ed6c107f9b7f7e
	.xword	0x70375b750634433c
	.xword	0xd1b5b40126266a3d
	.xword	0x7c98de5920b57ddc
	.xword	0xd331b6aa57c1e0a6
	.xword	0x00aceea8afb140eb
	.xword	0xb94e33d4573d34bd
	.xword	0xd43d371e4ca23e28
	.xword	0xce50a5919d5ae659
	.xword	0xab805bbac49298e6
	.xword	0xeb8b9dbe0efd3fae
	.xword	0x72f852a349187f34
	.xword	0xa4996578e801789d
	.xword	0x4c1207aa4aec4f12
	.xword	0xbed9bfeb75c52a89
	.xword	0x75396423eb174691
	.xword	0x05acfc30388b2df3
	.xword	0xc0b9da5cdf51e9a9
	.xword	0x82e27134f98807c7
	.xword	0xd87ace072d6c7ebc
	.xword	0x68187c3ac143840a
	.xword	0x9727fdbbe9d3985c
	.xword	0xf69e3255a128457a
	.xword	0x1d938157f263470e
	.xword	0x076f28530c32598f
	.xword	0x93cba0f3db062dd0
	.xword	0xb1ac52d6455a9ca7
	.xword	0xb0a6c7519ebbfe92
	.xword	0xe0db77534e3d7b10
	.xword	0x109cbb1a5216fc77
	.xword	0xac57ebefdcf8bce0
	.xword	0x271411eaa1c0e5d6
	.xword	0xaae21e58e89b9c09
	.xword	0x9fb71d11eb09d477
	.xword	0x8268238273a15f4c
	.xword	0x5697fda88fa08ca5
	.xword	0x5115a0a6fc02e072
	.xword	0x1926f949bde9b38b
	.xword	0x3f3d40e89571a811
	.xword	0x55ec057864384986
	.xword	0x5d4019b4382b13e6
	.xword	0xf3385652e6d9160e
	.xword	0x74d63092a674658b
	.xword	0x547e0a9200019255
	.xword	0x96121283e7e6a955
	.xword	0xe5d2c2701974cc02
	.xword	0x17bc255c26a28041
	.xword	0x22ab8f42654bf088
	.xword	0x84448da51dfa1c37
	.xword	0xfd46224ee39304d5
	.xword	0x17afba62a917b7f8
	.xword	0x487730135f073484
	.xword	0xd0916d94d8c9813c
	.xword	0xab3091f1302f4fb4
	.xword	0xc4aa3db3280e6be9
	.xword	0x8b33608d885e69c4
	.xword	0xeb71744b1f2b16ca
	.xword	0x9a1c0ef7ab683fe3
	.xword	0xddc56613d22cf7ee
	.xword	0xd49f16d46be59d50
	.xword	0x858eb48b464602c8
	.xword	0x98b9d3e1f39625c1
	.xword	0x3a847e897cc2d61a
	.xword	0xd3e823e2a22e2693
	.xword	0x5cdb67c0e20fe621
	.xword	0x8266cb2398212291
	.xword	0x614554afd9ca1fb5
	.xword	0xea1a4b3303c9cc2d
	.xword	0x9e43b03c530c7637
	.xword	0xaf40095128d876d6
	.xword	0x76525f7d738db00e
	.xword	0x5c392e5b456cc124
	.xword	0x3dcbe15ed270d05c
	.xword	0x4a9cbe8cf25866ea
	.xword	0xaf074bd79a3b110b
	.xword	0x386fe5a2369f3062
	.xword	0x06dbff99c9484be3
	.xword	0x1eb10d08a300b656
	.xword	0x6b47dbdfbd2ac256
	.xword	0x8e2460c317b89243
	.xword	0x6499243c25865c43
	.xword	0x74dc12c1f91ea6e7
	.xword	0x29f706e7ff6532c8
	.xword	0x62a81e65e733c5fa
	.xword	0xfdb9b1ef668b3515
	.xword	0x1b72f0f716c59265
	.xword	0x136a2e19120fd8f1
	.xword	0x15b84c512368dd19
	.xword	0x200583d48ddcd7a2
	.xword	0x96314deac6461e9f
	.xword	0xf177289cc0b520ea
	.xword	0x6ab6c4c14c474c6e
	.xword	0x04d0f3d3587033d2
	.xword	0x3a8cd6028e1a713e
	.xword	0x1094053bb15133d5
	.xword	0xc5d5c9b29a1b1248
	.xword	0xe1b7518829bbfc80
	.xword	0xcfd00d0c16347d74
	.xword	0x1639218cb3522ce2
	.xword	0x42049714e5c8e24b
	.xword	0xfe76627d98d11b8c
	.xword	0x18574cbd76ae423e
	.xword	0xf70b73960c1d3359
	.xword	0x3c9a6e74f45b7c64
	.xword	0xf3a29bdfdc1b1c35
	.xword	0x982549a829fdb03a
	.xword	0x7779337157bd3c63
	.xword	0xf9682581f753b62e
	.xword	0x78a24b1852af7aae
	.xword	0xc8f058ebb4cc2b92
	.xword	0xca718e37d04848ca
	.xword	0xdf3c452cbedb8747
	.xword	0x2993bf720d20c8b1
	.xword	0x06a31d18e86727cc
	.xword	0x13f4c954b9a29417
	.xword	0xa990719526909e4f
	.xword	0x36e01ca91dc77a0a
	.xword	0x5c88e441f4f43a55
	.xword	0xaae239201838b9de
	.xword	0xa28911bee5467e82
	.xword	0xaa1a21bcfde0b49a
	.xword	0x742987f8a8f8ef79
	.xword	0x17a32e5aa73ee6d6
	.xword	0x31e02ace42944c6d
	.xword	0x9d8204c7fecc258c
	.xword	0x70ea62d44c0fb341
	.xword	0x44090f9a2a63d383
	.xword	0x669fd3caaafa4222
	.xword	0xebafae27e3a7f638
	.xword	0xadd45a8fdace8b15
	.xword	0x0545e9c0c7201ca9
	.xword	0x0ba5100e2181a169
	.xword	0xdee327fcafc9d093
	.xword	0xbaae10fba9d423b5
	.xword	0x3b089a327963be75
	.xword	0x90446f69a4b710d6
	.xword	0xa298589fc1d30a02
	.xword	0xcf452fa1e7871459
	.xword	0xed97f291e0cc8c24
	.xword	0xa28d1e50002d58df
	.xword	0x261a68c1aeae9611
	.xword	0x9f774b7639830053
	.xword	0x20cafd9018496374
	.xword	0x68f66f2562c48968
	.xword	0x03d0ee4cf85649b0
	.xword	0xa887a1739bb9e453
	.xword	0x37bcf2df9570f0c2
	.xword	0x2a2790b059223b22
	.xword	0x93d6122eff0a548f
	.xword	0x31ac30f1604bbe5a
	.xword	0xc6494e8ec43b07c1
	.xword	0x6f9f006caeaa668d
	.xword	0x201ac0d068c12aff
	.xword	0x9a62e90a8206c5ec
	.xword	0x3fcad9f61f45f4ee
	.xword	0x2746d8ed10ff54a5
	.xword	0xfd50580ac8295876
	.xword	0xc45c5bedbd1236fb
	.xword	0x34922f3f72cb9229
	.xword	0x68a6740a509c3db4
	.xword	0xa15daa60761a01a1
	.xword	0x3595204b75450a2d
	.xword	0x6044273a0826fc52
	.xword	0x4af902d9e5627fa6
	.xword	0xef9ef9080c58514e
	.align 0x4000
	.data
data_start_2:

	.xword	0x2259a9309b955ef9
	.xword	0x6bbe91e2a35a2237
	.xword	0x6ab62627a016131a
	.xword	0xd79313e87146d2b3
	.xword	0x925817c637f0fefc
	.xword	0x58baf38a29050862
	.xword	0x7fccb10f582ea65e
	.xword	0x36fdc5e149e80433
	.xword	0x094abda2c9686f46
	.xword	0x74af0f505fae2b70
	.xword	0xd8cf0e63ecadf37b
	.xword	0xe46ab3986ff127eb
	.xword	0x7391cfa20a27a9d4
	.xword	0x25b30c16ed2f946e
	.xword	0x5d61ee7c94648833
	.xword	0xabc97a692ee629b1
	.xword	0xb848c63e99933e3f
	.xword	0x022dd416ae70791a
	.xword	0xe40f8bf044136300
	.xword	0x7cb2a3055d3e7bc3
	.xword	0x8c084b8ee3f5eb62
	.xword	0x444e4ff0aebd3328
	.xword	0x20ea1a34fb2eb686
	.xword	0x176e31cbf57a1278
	.xword	0xf51a8404e3dd9b07
	.xword	0xaa9769806e971084
	.xword	0xd0b740a4d2d2cbb1
	.xword	0x5e96cb535c664288
	.xword	0x87e83cb517d11aeb
	.xword	0xc10fb08f0cf6c202
	.xword	0xff4ee8604cd96b2d
	.xword	0x36b61de75847d056
	.xword	0x84275462d7544ad3
	.xword	0x194df88cda2a1fae
	.xword	0xaa87f20c58b882ff
	.xword	0xfb98232789bcd013
	.xword	0xd570b7c6fd0abb13
	.xword	0x83fd06f73356ba34
	.xword	0x459e82662a6495cf
	.xword	0x2a7a3c61cf14b4f9
	.xword	0x0dfd5f59716dbf11
	.xword	0x434cef3d210f0f89
	.xword	0xce5cecf26d13a71c
	.xword	0xec2b586520bd96e3
	.xword	0x64ed9d41f9d0a201
	.xword	0x69ee66886cb0e6b0
	.xword	0x192948c3ed6ffc66
	.xword	0xc06da88d03f6d3b3
	.xword	0x491bf33c1259a272
	.xword	0xba43a9ac811383e1
	.xword	0xf02d6ee25635cf3a
	.xword	0x34c25e62b148c0f3
	.xword	0x0d1c11021f1b633c
	.xword	0x5b59f66efe2a18bb
	.xword	0x4a5d6262e883f099
	.xword	0x84732165c73277f5
	.xword	0x52766f2f0d0d5faf
	.xword	0xb88366a994bca9d1
	.xword	0x2818c2ee4f941ec1
	.xword	0x888b37db085aaf48
	.xword	0x441dd28f73108409
	.xword	0x5da1078c26af46e3
	.xword	0x61f806cdb8f1ec55
	.xword	0xc5fed60a8a4ecc43
	.xword	0x86d356429e133fd2
	.xword	0xd1468e72711e15cf
	.xword	0xd3225a084ed94c3f
	.xword	0x59f0072fe11b1ccd
	.xword	0xac6d0021e77202ce
	.xword	0xc9812f2d731bae2b
	.xword	0x656aad1d7782eb1a
	.xword	0xdf609ccc5009a60c
	.xword	0xc7407aed569f005f
	.xword	0x52f88da9a8237786
	.xword	0xccc26eae01175ad1
	.xword	0xa3cb898cb45f3676
	.xword	0x95c5e72be8017d3e
	.xword	0xe9bee4f78f6b07c5
	.xword	0xf4b39dd5455088b4
	.xword	0xbd78f2d6c658c689
	.xword	0x042d055993b9fec9
	.xword	0x3ac564c6f4ef352b
	.xword	0x5e01328674d806fd
	.xword	0x31c22797ca9c940d
	.xword	0x336507fb8f58ed73
	.xword	0x8ebe09078aa73988
	.xword	0xbd1f862cd13911f1
	.xword	0x3456278c57f0db6e
	.xword	0x0a1ce21a51437ce5
	.xword	0xfcba7268b43458be
	.xword	0xc4102d7bc2e87704
	.xword	0x25903fea23e4e43a
	.xword	0xf34041100c1c19d4
	.xword	0x5185ba3d24a24fd1
	.xword	0x3a654cc8953a0a86
	.xword	0x297b0453b76458a6
	.xword	0xd370c5345c6dfc59
	.xword	0x9f5c05cbd687dc23
	.xword	0x96cfdc27a68c8da7
	.xword	0x641014fff93fa75e
	.xword	0x64a05550108daff0
	.xword	0x049219e9b84fa2a0
	.xword	0xb09fb38adf0137f2
	.xword	0x570b8c35eae9217d
	.xword	0x60fec0ebed4fda21
	.xword	0x00f920b3756bf53e
	.xword	0x9fe89a4e745ec0e1
	.xword	0x86b4301f3743ac30
	.xword	0x66a82fb2e4100210
	.xword	0x53d7de0aa748f417
	.xword	0x53e3274ac84dde79
	.xword	0xb626ca6f051f1272
	.xword	0xcf594b7c14bc11e3
	.xword	0x2b1f186115309ad0
	.xword	0x50936b265461f9b7
	.xword	0x379c5e1ebe8b2ac0
	.xword	0x98e7e390db59d5f2
	.xword	0xedb7c38f046d9b6e
	.xword	0x938e6e1aeb148770
	.xword	0x896338e0eab1f07d
	.xword	0xfe177dbae3ec0a18
	.xword	0xf0935b7c734bd49e
	.xword	0xaadc556f855adf60
	.xword	0xf7647b7b52768a68
	.xword	0x74aeb4dd1535b4fd
	.xword	0x0f093b50166dd5c2
	.xword	0xe742694b8c2392e3
	.xword	0xd54003f28cea2ff7
	.xword	0x7f12c206280d0a4b
	.xword	0x64fb4b7e8955394d
	.xword	0x835a561316fe84c8
	.xword	0x62161778a8aa688f
	.xword	0xec3d06a0dd14254e
	.xword	0x82d26ce45cb9cdc2
	.xword	0x5cd06dc481d945b6
	.xword	0x0da21b701491e4ac
	.xword	0xfa9d79d6fa9ef68e
	.xword	0x3c7b89a4381cec20
	.xword	0x670c2cac04060ea0
	.xword	0x71ff6dd5086e6911
	.xword	0x982ab4dd3f060dba
	.xword	0x1db81aa9453fe869
	.xword	0xcf9f80ddaeb38bf6
	.xword	0x885935db4bedf129
	.xword	0xbd5bea4d7b4c8d34
	.xword	0x3af2ae9be0542968
	.xword	0x4aa3197246b6d5e3
	.xword	0x5a0c40fbded846a2
	.xword	0xef0c2ed766646b06
	.xword	0x483ac00c5937f669
	.xword	0xd944faaf8b5a41c5
	.xword	0xb6e9bb1388c35bea
	.xword	0xf1b11aa75b7190c3
	.xword	0xf6e5bd10c034fc7f
	.xword	0x21b159abb593e2ba
	.xword	0xc3f92c6c56e0764c
	.xword	0x4abcf8ccca3b6546
	.xword	0xf79e8f7616bd7874
	.xword	0xf4665afd18982867
	.xword	0x56a5e3721e23ad1d
	.xword	0xe8708b2a95c5c692
	.xword	0x978439f7bb18c3a9
	.xword	0xd512f2c4492cc687
	.xword	0x170d6c2a3f008101
	.xword	0x8d28518d45102062
	.xword	0x257f41ab90190e13
	.xword	0x5ddfc6c921b3db8f
	.xword	0xf6e31b6e706365fc
	.xword	0xb97826124a8cecdf
	.xword	0x15f9aef0d6914d29
	.xword	0xa440e56f678eb3b8
	.xword	0x3192be7deb0f9d17
	.xword	0xc016dd47493fc1fc
	.xword	0x2bb2c7aa47c5a650
	.xword	0x90b17b9c59f2ae70
	.xword	0xcb70e331f579396e
	.xword	0x9a6ebd26a05329ea
	.xword	0xbeabbfed67c26421
	.xword	0x9fd5031aeb441486
	.xword	0xcb464bcc115bcff5
	.xword	0x2f6220358ac57ccb
	.xword	0x849d8d531c5ee542
	.xword	0x00a361e32732f489
	.xword	0xe9238f47c7e4ca98
	.xword	0x38c8460b931cd282
	.xword	0xd50a2cc173241464
	.xword	0x719b72047472f530
	.xword	0xfe5b805005f84eea
	.xword	0x45deb20596220bad
	.xword	0x1439bf5c8a1a644b
	.xword	0x464aebe98808ed72
	.xword	0xc8a8ce74fc496049
	.xword	0xf96e166a4c7f1281
	.xword	0x9933202b8d19a02d
	.xword	0x93b41006cb91e9e7
	.xword	0x3652ecd573e53a7e
	.xword	0x7592a6bc12a0d2d2
	.xword	0x411a3d317f709b28
	.xword	0x009e2ecdb4b053c6
	.xword	0xf594874832a55aa0
	.xword	0x8d9c6632812a60bd
	.xword	0xa4b14cc759138cc1
	.xword	0x33fd644eb0f44cfc
	.xword	0xbc5f729bc40892b5
	.xword	0xca6aaf069a265c6f
	.xword	0xf7776c81164304e6
	.xword	0xd4bb426cef9de8ad
	.xword	0xbcfaa527b3a9ecac
	.xword	0x26d3ded6d0501e7d
	.xword	0x89f6595a1dfe053a
	.xword	0xfd8f10e97b923460
	.xword	0x4e2c5c92120293f0
	.xword	0xbec324db6ff3d139
	.xword	0xc84002f5758283c8
	.xword	0xbc37299bfef2f29a
	.xword	0xa092c2925f4c0540
	.xword	0xe9a3666727488480
	.xword	0xf80fe8cd96f32d4e
	.xword	0x8c5fe6b9f3dfa45f
	.xword	0xe35583dff852bf26
	.xword	0xb1970196d048b7d2
	.xword	0xedc81c985d9a8037
	.xword	0xc170470367db0a4a
	.xword	0xf4060785cd4aa8dc
	.xword	0xa35bea793b7f4f45
	.xword	0x298e938f1e47d9a6
	.xword	0x7d1062c4a04cf516
	.xword	0x29f77f8733aa9f3a
	.xword	0x731b1b010d6ab273
	.xword	0xd6ff839951ff48a7
	.xword	0x48ba61a45a4bc844
	.xword	0x508851353f03dc5b
	.xword	0x65f06c64a3c6860e
	.xword	0xe2d8deb1bcae140c
	.xword	0xb95be1198a6cdc40
	.xword	0x64fab05410e7d00c
	.xword	0x98bb0354fc83139e
	.xword	0x9ab9f7332d1ba0b3
	.xword	0x0716daabb60148a2
	.xword	0x0c236f89204f7dc9
	.xword	0xfe0403289c5430eb
	.xword	0x4ee96e304ccee32b
	.xword	0x79f4288b819a6d8a
	.xword	0xd3e3c2288f6fed6d
	.xword	0x8d3bc1231f0e7523
	.xword	0xe3d0b7c409a16068
	.xword	0x3b31f5c8334d0ff6
	.xword	0xfe2778ab20ecb0ec
	.xword	0xd3559231e6c9e663
	.xword	0x6777c7524dc0652d
	.xword	0xbb0aef09b126863b
	.xword	0x8d947616877f81bc
	.xword	0x7ef657a4caef4c34
	.xword	0xd1641553acca772b
	.xword	0x97feafb1da6bff93
	.xword	0x3d1ee0a69ca850fb
	.align 0x8000
	.data
data_start_3:

	.xword	0x6a5c56c690e361cf
	.xword	0xe11381d5f4dce76d
	.xword	0x036b445efa226b03
	.xword	0x7bdc5447ddde271c
	.xword	0x90cf70df546686ab
	.xword	0x1c2b42bc752d924b
	.xword	0x8331959c2cabe6ee
	.xword	0x409edc884745e25b
	.xword	0x6addff12d8922699
	.xword	0x4b299e65134f366b
	.xword	0x994e943089eae1fe
	.xword	0x6427d9be45a2ebc2
	.xword	0xe9fa8a38b6a0438d
	.xword	0x9efc1b25c6488600
	.xword	0xba5896fd3d64edcd
	.xword	0x180f3902c7b0be0a
	.xword	0x1bebf5a6e4f150f6
	.xword	0x3e2cc5516d2b2ea8
	.xword	0x3f4d0319f8834d7e
	.xword	0x14d3cfe89ee47c18
	.xword	0x880fdf5a8e01aa5a
	.xword	0x0146c2dec8f342c1
	.xword	0xfd458bcf18c80f97
	.xword	0xefabbbca61757601
	.xword	0x7d051620df1b0ee9
	.xword	0xf62e0752f1747431
	.xword	0x870f48b23f0a7805
	.xword	0x5cf9504b7ced5301
	.xword	0xb43af1ac274a4253
	.xword	0x9c12a4231a767778
	.xword	0x3d50d630e70ee729
	.xword	0xc87ce282301e214d
	.xword	0xcb1ddbb9aa6488e7
	.xword	0xb8e6c4c8c886058b
	.xword	0xa511dfecda87caaa
	.xword	0xc972f15810f70b4d
	.xword	0x8a01dc65be1e24bc
	.xword	0x79a72c3dbdddcb91
	.xword	0xef76eaa1316b2922
	.xword	0x00f9c06fe80a327c
	.xword	0x27e12d038c3a9824
	.xword	0x53b2c47c348b72d2
	.xword	0xc5b1b719afd29b49
	.xword	0xcc368aeeb905a2c7
	.xword	0x3c5a724d80a78460
	.xword	0xd0b84de22cfa7ac6
	.xword	0x7403baa8c0ec964c
	.xword	0xf7516f8342d4fbfa
	.xword	0xf03723f10c9aec5f
	.xword	0xacc9a18ececcf82d
	.xword	0x6eb4182d25036900
	.xword	0xea06e6d1bf279313
	.xword	0x97ac56eb774d4c0c
	.xword	0x28e0aaf284dccf82
	.xword	0xd1d62180dcbcbec4
	.xword	0x4b98ebf309063879
	.xword	0x63472c1e976afeb4
	.xword	0x33fe290414216abe
	.xword	0xea0699b1855051c5
	.xword	0x1fd3ccf8ccef07fc
	.xword	0x3ad77aca955f6ada
	.xword	0x039cf80dc192b46c
	.xword	0x6a328f29eea809f7
	.xword	0x87cfe7d880f9c47a
	.xword	0xc7a2e72e1c5dbf43
	.xword	0x7ff60a3f61713fbb
	.xword	0xf2e0d92b5d677b0a
	.xword	0x20014edca1d1d940
	.xword	0xe816d0149b341f7d
	.xword	0xa87add35a26eb9bd
	.xword	0x3c25d0f53b59c5d8
	.xword	0xb61c1e9c67808410
	.xword	0x5449e861a34e0392
	.xword	0x83698967cac17b03
	.xword	0xdca9408e8d5f3fd5
	.xword	0xa96848a89d6e1ea9
	.xword	0xdf713396b62d06f9
	.xword	0xbac826432a913e52
	.xword	0xe06cd7a55e1d25a3
	.xword	0x74e5ed4ddd0878ea
	.xword	0x998cb3f2ba397fcb
	.xword	0x784cb3762af0aedf
	.xword	0xe7cec04f43d12fce
	.xword	0x7d6f257a1984eb18
	.xword	0x3988aa795e96d2b2
	.xword	0x9b723f73d4684959
	.xword	0xcb57b8a698a65d5f
	.xword	0x1e78ec5395b0343b
	.xword	0xb26b1a31331b080c
	.xword	0x068d52803f3769c1
	.xword	0xe22d050c6f5427ba
	.xword	0xcf11437eb3ff03a1
	.xword	0x509efc7810278aef
	.xword	0xebcf63f58f799599
	.xword	0xaf320e22cae014c0
	.xword	0x34a5dd8735978709
	.xword	0xb055e1aca62bcce8
	.xword	0x02ac4b9671bf376b
	.xword	0xcab0261c7a8fac86
	.xword	0x6f5ab7fd6360c175
	.xword	0x2c58d998412dd215
	.xword	0x5cb1a7267396a749
	.xword	0x875b9ede92d99bfe
	.xword	0x20d5a0f267037ab8
	.xword	0x0e3553b766d9e0ce
	.xword	0x1d83a7ec8d83d3b4
	.xword	0xa79a71c2bdbd6f00
	.xword	0x2a42cacbeceaa169
	.xword	0xefed3159b8ad9efe
	.xword	0xf62cfa7427b490b6
	.xword	0xda0c95a0e6a1501d
	.xword	0x4024cc40edee0c54
	.xword	0x76c593227199941e
	.xword	0x5620e3b0a42dfa0c
	.xword	0xe61463da04ecb2c6
	.xword	0x249d046de6c142ec
	.xword	0x5e963198b25bc893
	.xword	0x3d4267f6642ec30e
	.xword	0x0a0fcd609e347cc0
	.xword	0x85c575f360ab3e23
	.xword	0x8ac4ef5d300baf62
	.xword	0xd98e92f008ae3b2a
	.xword	0xfb6502effacc8d86
	.xword	0x57f74ac808ecab4b
	.xword	0xb971d14009b61ba7
	.xword	0x05b3c63664a6533a
	.xword	0x491244be6ef02ae8
	.xword	0xa35c7cc8cdba675e
	.xword	0x9751f9e7ef503aa3
	.xword	0xd179bf3ee3276556
	.xword	0xa02729a722c520fc
	.xword	0x8efb967f4ca54073
	.xword	0x02ed34e7ef0529d1
	.xword	0x6bd43f06e98f6654
	.xword	0x7bc4144dcb838780
	.xword	0xb55ab0969c967f49
	.xword	0xd31e6ee24db30536
	.xword	0xfb9f24a0d672b50a
	.xword	0x4f5823589975726a
	.xword	0x8dba93165dd9b643
	.xword	0xa6171b0f71ef4f7b
	.xword	0x1e79d379041990ec
	.xword	0xc516d6138f8ad5d2
	.xword	0x0042557b513590e1
	.xword	0x9fb5fd8da537ec66
	.xword	0x6f5d55c31c96ff66
	.xword	0x853551929aa72c44
	.xword	0x4ce64acae2e0dae0
	.xword	0xf14e83cbe9e86847
	.xword	0x37dfb01a49367e54
	.xword	0x7c8f7a2414e2edf3
	.xword	0x108e2bd6e91ca58b
	.xword	0xa57bcc6d522a3b8d
	.xword	0xb546f34d16b9e437
	.xword	0x14abfd90fddc9c35
	.xword	0x9a7f419874654434
	.xword	0x9b186d8607fed245
	.xword	0x7d43681bbbc1d200
	.xword	0xf839b875c3d41aea
	.xword	0xd3c3d154b982ffa3
	.xword	0x0031f9eda778a2ed
	.xword	0x10debd8497a8a495
	.xword	0xb905964030e6f375
	.xword	0x5264d648c10bcd8b
	.xword	0xca7acc4b9e747f38
	.xword	0x318f0d8d453762a6
	.xword	0x9cc864e199e6292a
	.xword	0x2cbd96a64a03cf92
	.xword	0x4e88a2f57ff6113b
	.xword	0xeaf7b7616875ec66
	.xword	0x96636dec0c83af97
	.xword	0xf97059b83b046aac
	.xword	0x21b81ec36dd76299
	.xword	0x3521f0b1b098422f
	.xword	0x6a185053b330d21c
	.xword	0xcc65a84a04d49151
	.xword	0xf977c3b15cab9b4a
	.xword	0x3826002fae791169
	.xword	0x65a8946893caa72a
	.xword	0xf007b6971bff2712
	.xword	0x0a5b576cdf7215ea
	.xword	0xe096ca92067a383e
	.xword	0xaef59c2358035733
	.xword	0x7764b31493484239
	.xword	0x29c3a96c9767d71c
	.xword	0x23ff767eb48b8f1f
	.xword	0xa52486f1e3a47ee0
	.xword	0xe40fa3a6dd0b87ab
	.xword	0x982df6bf10196780
	.xword	0x368f94512547d7b3
	.xword	0x59ba79b526c9fe82
	.xword	0xd68eaceb3c94dcd9
	.xword	0x6d1507d1e440a9ff
	.xword	0x94d12e36d1b995f6
	.xword	0x6cd851842893460d
	.xword	0x73ef1075b678138b
	.xword	0x5603c16ca002f8db
	.xword	0x515ae560c75ace40
	.xword	0x05362b302b48669d
	.xword	0x3282ef12d2c0741a
	.xword	0x54a8c48c89f75d48
	.xword	0x8431fd1a25b3756f
	.xword	0x4426e3d992aa515b
	.xword	0xdfcca1b172aa5f48
	.xword	0x3c778b6a9566e54e
	.xword	0x22f18cdbb1af7bed
	.xword	0x10c7ef51d631352c
	.xword	0x946cd6dd0fc6f375
	.xword	0x4980307e81436c8d
	.xword	0xf12d745849b8cea4
	.xword	0x83bc0689ab8f4887
	.xword	0xa16a9df41e890abf
	.xword	0x029cf0f1dae647c7
	.xword	0x775d6c3fa0243d2c
	.xword	0x52e5ade4ef7438b9
	.xword	0x91fe1ed758552314
	.xword	0x09357a6461438701
	.xword	0x54cc4923d002a28d
	.xword	0x8d988c4422dcc6a5
	.xword	0xe4796feec88caa21
	.xword	0x31e9be01827acdaa
	.xword	0xccde4788720663dc
	.xword	0xa81f217bed8b2047
	.xword	0xd6f7393a91b98dff
	.xword	0xcba53ffef7bf63d4
	.xword	0x6b8136585d30f655
	.xword	0x54be5843f2499f1e
	.xword	0xd021d41992157277
	.xword	0x5e8986cb5cb3b87c
	.xword	0x70c924cbb0e85db5
	.xword	0xc6eda1d04301c68d
	.xword	0x769459cdaf1d761c
	.xword	0x405e43e5b8936152
	.xword	0x0b6f32acc3118b9e
	.xword	0x0c3d0fc2532fbff3
	.xword	0x15f2f150061ef16d
	.xword	0x82eb77f6b550aee9
	.xword	0xbcdf01bb8d7f6fd1
	.xword	0x9af47ab0ca8785ed
	.xword	0x6a9454d8e2458c46
	.xword	0x69e35a57000471da
	.xword	0x85ab9f9627dade46
	.xword	0x60196060b6a392db
	.xword	0x1e1387223cea05da
	.xword	0x18c99ca4ecea750b
	.xword	0xfa1715f3ab471e4d
	.xword	0x6084bd8e43a56550
	.xword	0x445bf9eadfbadae8
	.xword	0xc163de22e231b228
	.xword	0x5808d40ed8741f3e
	.xword	0x097d9475561a8fdc
	.xword	0x1f6f8d5d67f05be1
	.xword	0xf1365344578ed2fc
	.xword	0xe1b184641745a05c
	.xword	0xa5db5f43b01fa372
	.xword	0x99734af36c91ae36
	.align 0x10000
	.data
data_start_4:

	.xword	0x8f167e9b259ec276
	.xword	0xe6b691835c651037
	.xword	0xedd7f863f1319720
	.xword	0xa7cf2864fa29b992
	.xword	0x599081717dcac189
	.xword	0xa72855a73a786d17
	.xword	0x39250dee5ee1f6b1
	.xword	0xaa30cd79e93ef69c
	.xword	0xb14a07e443e52749
	.xword	0xa10ab53aac3b08e0
	.xword	0xab0da3b5f4601f35
	.xword	0x3d3f59e6df02d442
	.xword	0xbce9cedb9179db95
	.xword	0xff900ef95c932d8d
	.xword	0x039a8db524387b17
	.xword	0xfa462ab38c790a3a
	.xword	0xe4781e9221a4f82d
	.xword	0x488c080e2096cf13
	.xword	0x6bd6f762fdf80729
	.xword	0xb76104b1b0f074aa
	.xword	0x3b52655e60bd0401
	.xword	0x55b912155f229c1b
	.xword	0x68517c45750ae564
	.xword	0xc743fbb41fae63b2
	.xword	0x36f5b66a4f62f252
	.xword	0x39960dff21b510b5
	.xword	0x43a17d93888d72ff
	.xword	0xb7c0076894a6ba32
	.xword	0xd754e9f3adac9fde
	.xword	0x8da446a6059c6abc
	.xword	0x967f39135f1e702a
	.xword	0x32ff8a51c01cf03c
	.xword	0x76fa513a8d6641cc
	.xword	0xb1d35acb6f7a9ad8
	.xword	0x57832f16d161334d
	.xword	0x2bacac46397980f3
	.xword	0x4f03d528d952af1b
	.xword	0x6ca92b861aa6beba
	.xword	0x86f752d26664d56d
	.xword	0xa5f51f88e19af096
	.xword	0xcdf10e651f445389
	.xword	0x6d7f425e74b9fff2
	.xword	0xb110f057e59c3ce7
	.xword	0x4391cb93e9817b2a
	.xword	0x9cf19ea0b7ba7342
	.xword	0x348a7ccd3614633a
	.xword	0x67fbea1bcdb61b21
	.xword	0x5564bfcdc27d789f
	.xword	0xa3bf4c3fdcd7c2fa
	.xword	0xb3cf07dd6e404ef5
	.xword	0x85d3a3b3c2dcd7f8
	.xword	0x07e801efdcf3cd4f
	.xword	0x250ac0f52eaac41d
	.xword	0x6ec8f63f5d7328da
	.xword	0xc3bfb6feabd339fc
	.xword	0x86cfbbcf333b7b48
	.xword	0xf5bea814bfb7f759
	.xword	0x382f12cd6c1e115e
	.xword	0xd6e461dda1d67887
	.xword	0x3ea674eae474ff2f
	.xword	0x32f1470188e183b6
	.xword	0x76aeacc4c504793a
	.xword	0x8824dad3d9b54f62
	.xword	0x42fe63edd325d0b7
	.xword	0xac1e7682d6772e5d
	.xword	0x3877f1a3cdf56f97
	.xword	0x54303322fa675054
	.xword	0x2e9e94c9194985b9
	.xword	0xb7da14a84a81a10e
	.xword	0xab39302afdbbd558
	.xword	0xeaeb30ca3d5a2379
	.xword	0xabe6e4553c6ed884
	.xword	0xe460d90274687112
	.xword	0xeeaf56b035e34cf6
	.xword	0xb17392dc78383033
	.xword	0xe94913bc4f4c7498
	.xword	0x70609b3a2dc33b15
	.xword	0xbdb2f97f6d449648
	.xword	0x52873437b371aa44
	.xword	0x40a136e9d56f95f1
	.xword	0x76597058db8fd0a2
	.xword	0xdcc0f3fd547f7416
	.xword	0x3f84eaad45ab9715
	.xword	0x026006d8a460574c
	.xword	0x9f4bd061d98e3c2b
	.xword	0xf099c338f2e85efa
	.xword	0xcff8d22c099a6fba
	.xword	0x8e0c4126c512acbf
	.xword	0x9e47965cd0257b80
	.xword	0x1fe7a22de4ab03ec
	.xword	0xdf6187fd5d9e3ae1
	.xword	0x716f58bcdf05dd5b
	.xword	0x316274f3cea73d07
	.xword	0x8b644886a3093424
	.xword	0x1ad4ee80b747c212
	.xword	0x176a6ef6c79cc320
	.xword	0xc2e8acaf74f7d4d7
	.xword	0x45c7b7ad66339fe5
	.xword	0xbf3c68e52e5fa21c
	.xword	0xa14bf57c631a165c
	.xword	0x62a64db4d42ecaf8
	.xword	0x7675e45a42533ffb
	.xword	0x8b47cf9d3ad2ed29
	.xword	0x4e10be5c4c6cae56
	.xword	0x4fdf915e1a29f096
	.xword	0x92cbcf26cd772814
	.xword	0x1b570dfbfa901e77
	.xword	0x7462b05753f1dfbb
	.xword	0xa5b308d5ced6381a
	.xword	0xaaf4acf9226658cd
	.xword	0xceff2839dfb9a89d
	.xword	0xf568e31414e40814
	.xword	0x2a082d7ff2baf237
	.xword	0xfa08531246654268
	.xword	0xbfe483c241bd4234
	.xword	0x02f3a0d2b90ddfb9
	.xword	0xa6090bfaddf2863e
	.xword	0xf6ddeb8e0e4ad953
	.xword	0x28494287cb502fc6
	.xword	0x805af236edef51c0
	.xword	0x755f6ec693b34a5b
	.xword	0xe819d4669ea43f91
	.xword	0x76bf31e11908d8a2
	.xword	0x0ad7b9de3bf60249
	.xword	0xfd9c7213719c90be
	.xword	0x7fc81a84c5aebb85
	.xword	0x6d7edd34c6b05b07
	.xword	0x263035cff267283f
	.xword	0x5c17b30566bfec5a
	.xword	0x24edf48a675676e1
	.xword	0x59346819ad1ba30a
	.xword	0xbc3f6ba89361170e
	.xword	0xa1e9f3d3b9d99463
	.xword	0x319fa5d3df08fc30
	.xword	0x7f1a35d07a79df0a
	.xword	0xbdfa646c2a150ed2
	.xword	0xdccf4c0053d88923
	.xword	0x3301aa076ea25fa1
	.xword	0x9a227acc7cafe806
	.xword	0x92ef20b0277b2098
	.xword	0xc642bb6e80f4175e
	.xword	0xfa4755f27a2a88e4
	.xword	0xade1cad092767ab3
	.xword	0x9279fc5b91bfe24e
	.xword	0xecfa47d3fdea0397
	.xword	0x9c024ef1aaebdf9f
	.xword	0x131661f5da95f133
	.xword	0xf07d833cdc29fa3c
	.xword	0x3a799fc7cb17a63c
	.xword	0xed1494e7bf3ac854
	.xword	0x4fae799b0d7e83ff
	.xword	0xbea05d147699667d
	.xword	0x2399c8d3826b1c79
	.xword	0x44238bd5e5ccfce4
	.xword	0x31f94621ce3777ef
	.xword	0xe21ee2288b60a334
	.xword	0xd9107315a010c671
	.xword	0x7d59b5055489ac53
	.xword	0x3881c88f87b84419
	.xword	0x05be2aab3032afa8
	.xword	0xa2c2043b17a577f6
	.xword	0x2e543dc85442afba
	.xword	0xf839e09d93ea4e23
	.xword	0x912604a3d20933d2
	.xword	0x367e09620e1c6afb
	.xword	0x95d59bd3f3d9fef8
	.xword	0xa4a6e8a8064649f1
	.xword	0xd3dc17105588bda9
	.xword	0x93c25bfc8720d5e4
	.xword	0xaf43971dd901e5d0
	.xword	0x11f60275cf71d979
	.xword	0x446dbd97d20ef435
	.xword	0xd42ec8d30418d2d8
	.xword	0x693ae5c318eac6ac
	.xword	0xd63ff5fc197e3e50
	.xword	0xebcbf6b354b65f5e
	.xword	0xe6724487efa4cc4b
	.xword	0x3319c4d4d533ea28
	.xword	0xb8c8fd95932d0689
	.xword	0x26f51a1f10104442
	.xword	0xf8b0f67d7312a2be
	.xword	0xd8631503a2e58861
	.xword	0xe335bcc01e61d9a0
	.xword	0xd0d6f7eb3c01a1bf
	.xword	0xe0ecbcb4094cbe9c
	.xword	0xb86f3d94dee2a471
	.xword	0x20c74cbe19788ebb
	.xword	0xc8bee15f1d27f1c9
	.xword	0xa25225fdf571087a
	.xword	0xaf7663d4fe22f8d2
	.xword	0x0917017de6179af5
	.xword	0xe1101d01996c3b3f
	.xword	0xf5e2227c256047ca
	.xword	0x6552ae453c6ba182
	.xword	0x02eda236ef517e22
	.xword	0x5d317b563d726487
	.xword	0x2389f0b49622dc22
	.xword	0x0476d11834846cd9
	.xword	0xc66903eb929e4c5c
	.xword	0x10ee6c1ea5933de9
	.xword	0x71151e4cbb5fabe7
	.xword	0xa366453971dabd70
	.xword	0x34aa581a787bb7ee
	.xword	0x357cfca874211a48
	.xword	0x9b202f4448f5be4c
	.xword	0xf87a1a7fa8894430
	.xword	0x5470eea193dec506
	.xword	0xedc06eb222c69ab0
	.xword	0x8df357f0acf28e93
	.xword	0x027a352705cfe8db
	.xword	0xca33be07a059b470
	.xword	0x64d7c6901dd605f2
	.xword	0xae469d3ef3b14c3f
	.xword	0x3ac5479a7bc967b7
	.xword	0xd3e55955a8bcf134
	.xword	0x282fa2f1b6bc55bf
	.xword	0xe6d9bd76395a3116
	.xword	0x33ba3c3390c8b2e2
	.xword	0xa0b9c29ae663fd80
	.xword	0x2bba87fd85b2f128
	.xword	0xb3fc1dbb86271fd6
	.xword	0x260360544e4435d9
	.xword	0x27ca2a1df8371697
	.xword	0x5dcc1240d75c719a
	.xword	0x9e822e39a5ebcbd9
	.xword	0xe7e4535d34b72c00
	.xword	0xf819e11a35230091
	.xword	0xd7aeb85466a91d7b
	.xword	0x9a3d7ab78287d81a
	.xword	0x02b7890893097bc4
	.xword	0x8bf1016d441d6a2b
	.xword	0xa5239223f62303f6
	.xword	0x58feae88893a4f19
	.xword	0x8f948c99ba698468
	.xword	0x9c04712435d59d44
	.xword	0xe32892a260210c59
	.xword	0x8563aa24391189eb
	.xword	0xeeb3451b429f4914
	.xword	0xc321d8652e04252f
	.xword	0xe48d361fc711c52c
	.xword	0x9ea878bbe02065f3
	.xword	0x1e0f4e81a8d58665
	.xword	0xaa00028afc72e22a
	.xword	0x88cbf6c49bb2d08a
	.xword	0xb7876e0c1adf203e
	.xword	0x43f64c4a47d97e59
	.xword	0x7557529f9c5f8836
	.xword	0xa7fc7fe0572c1908
	.xword	0x970e0ce8b4522de3
	.xword	0x29352a0c71a52e9d
	.xword	0xcf7c13b450723317
	.xword	0x802e5f0405e8b765
	.xword	0x5daf76dcf0f0ab97
	.xword	0xfef80627b9622c23
	.xword	0x935f2fba3866c2e5
	.xword	0xe98e07a41e2448f0
	.align 0x20000
	.data
data_start_5:

	.xword	0x3e2db910b7c132ff
	.xword	0x760b2586259d7bd6
	.xword	0xfba086f8f2ca782a
	.xword	0x70620b39c954d176
	.xword	0x84069b45d152a696
	.xword	0x25d92c6d9227b4ab
	.xword	0xa736e7d7894e8105
	.xword	0x9a316a09e29de58a
	.xword	0x0a96d2bda4cda605
	.xword	0xc277a26ffa9fbd3d
	.xword	0xd67837a4c87c764f
	.xword	0x4e23b702434008b4
	.xword	0x506ebe4469f80ed2
	.xword	0x4ac09671ebb49b5a
	.xword	0x3ef75f555e366e5e
	.xword	0x760e9458be67398f
	.xword	0x4729fb968c3ce76e
	.xword	0xb2645711e5dca097
	.xword	0xe387045d3106c15c
	.xword	0x918fa7d1f22b1e83
	.xword	0xde960597da2349c9
	.xword	0x9897595ad46df8b5
	.xword	0x19ef0dbf0c7ce059
	.xword	0x6450bc324d397020
	.xword	0x13b35abf9bf930dc
	.xword	0xf3b2cf5ec760fdea
	.xword	0xacb53a1da3085988
	.xword	0x85f8906053ffe752
	.xword	0xb952ceed6494e224
	.xword	0x78b54881906ae243
	.xword	0x59430e74bab79038
	.xword	0x7ae660045349566b
	.xword	0x8ad134e128cf3f58
	.xword	0xa922deb861e70983
	.xword	0x238400773953c5ec
	.xword	0xc4735c246b7f8a07
	.xword	0x061698a809f1211e
	.xword	0x65969a159d67bb08
	.xword	0xd9c12ef2dd064f41
	.xword	0x37c411457dfa4df3
	.xword	0x64a5135bc9e9c1b4
	.xword	0x6bf845bf9d6f4fba
	.xword	0x8a298cb0fedefa5f
	.xword	0xe6c95bdef6b9f704
	.xword	0x497f50f8357dd980
	.xword	0x03402955f61911db
	.xword	0x2404bae669db25eb
	.xword	0x9836d9d528c99f5f
	.xword	0x0a4f28922275cfd6
	.xword	0xe10ffe0e086643ee
	.xword	0x4e9b86f279f7ab29
	.xword	0xddbea56dbf54e9a4
	.xword	0x99f6a70281c99218
	.xword	0x487dd6244900596a
	.xword	0xde1953ba1325d3e0
	.xword	0x2cb09db739644b4b
	.xword	0x107a11f7b401b473
	.xword	0x175b825916d921c7
	.xword	0xba0404bb538dfd3c
	.xword	0x02cd6f4e472c48ef
	.xword	0x6680c2c2d6eaf98f
	.xword	0xdf541f8a0ad22d2b
	.xword	0xa017a52825a7a1a7
	.xword	0xef9f73d8d9468fcd
	.xword	0x7bb8b1db60f4cc66
	.xword	0x7a5380b053dd09f3
	.xword	0xf8466ca65c8a4a9e
	.xword	0xf6744dfa029db41f
	.xword	0xe59b46290a359366
	.xword	0xa559228237157440
	.xword	0xc53ff7a26a0c85a7
	.xword	0x1ab51a23df0b1825
	.xword	0x7225b09c3e7fb241
	.xword	0x1fb828a1d3c1067d
	.xword	0xe15aea547b5a4a56
	.xword	0xa3ac8828feaa2e7e
	.xword	0x7387ca89b896a10c
	.xword	0x9fdd6fad0f99cc6e
	.xword	0x52171f218e94bc65
	.xword	0x6d00583bcef7b8c3
	.xword	0x2da2a28ca36afbc9
	.xword	0xabee1c5d9b14d190
	.xword	0x757c92615149dcfc
	.xword	0x5e477de40d31ff3d
	.xword	0xd5908eb416a22ec5
	.xword	0x2770f5ec42c60483
	.xword	0xb211c848225640b1
	.xword	0x431d27e96881a932
	.xword	0xba46e00906d12d60
	.xword	0x85c59145a0b7df08
	.xword	0x7575793afe3fd02d
	.xword	0x6328d7832492d0b1
	.xword	0x36a9871fa1a10a95
	.xword	0xf43813da04619f5c
	.xword	0x151d8c7095c1ab5d
	.xword	0xcd8ef5b5443482cd
	.xword	0x2772196b67db7ace
	.xword	0x464b2b9e026e0132
	.xword	0x2185f20a1a2e4402
	.xword	0x0e251cc091581ecd
	.xword	0xabc9fc743be890be
	.xword	0x6d18813b5e04bb27
	.xword	0xfa1905c5bc91c03a
	.xword	0xcd1291e45a3811e9
	.xword	0x583032636afec336
	.xword	0xfa66654997e2924c
	.xword	0x1c9094d8c57651a7
	.xword	0x246376f046451703
	.xword	0x57c933ff7d0e2bcf
	.xword	0xbae2b66f51ca88b2
	.xword	0xa5762d94751730d4
	.xword	0xd654b5bca2f5745b
	.xword	0x6869ed41a7fa4d15
	.xword	0x85c696617aacfb16
	.xword	0xe6ebedf98c162fad
	.xword	0x70536f543a4d3282
	.xword	0xe72526cb0ba1ef29
	.xword	0xa71b1fe3cd66f577
	.xword	0xcb449c3cca6327da
	.xword	0x6ec19772918e4e6c
	.xword	0x47617e2a2c89f8ad
	.xword	0xb06c338ee638d991
	.xword	0x6d535a27e1cc5d59
	.xword	0xed360c8824e80e0f
	.xword	0x593a9d5610419571
	.xword	0x07d1bded6068c839
	.xword	0x9976c3db24f8d9e2
	.xword	0xd8c86631d8d1cb15
	.xword	0xbba4fcde29be68f9
	.xword	0xc9946138e4652601
	.xword	0xa871374d27d3d0a4
	.xword	0xbc3697fed747d70b
	.xword	0xe1808c62a8bb5f76
	.xword	0xbc1046e93a18f8e0
	.xword	0x0bf76ae6c270b18e
	.xword	0x19ad19e540979985
	.xword	0xa3a63b32270709fa
	.xword	0x544af02244df9d94
	.xword	0xcb30dddff25629f2
	.xword	0x916342db02cbe490
	.xword	0x10c4282d9bd84da8
	.xword	0x0d42e4757db3bc67
	.xword	0x1cb71aadb243d8e6
	.xword	0x999e85d507c6bb4f
	.xword	0x7f0442542cb155cd
	.xword	0x67916d23a9038975
	.xword	0x32ca8084e39015a7
	.xword	0x84dd6dc264df2c77
	.xword	0x07c39a37d91d26f9
	.xword	0x82c42c19452863b6
	.xword	0x8b564d4524ac375f
	.xword	0x854fbf8f2ddfe641
	.xword	0xef644c6cd95c4d34
	.xword	0xbb95e003a4eb4f9c
	.xword	0xd22ccd6ff483f5de
	.xword	0xc51f0d59abfcefb1
	.xword	0x4e6c3b56f4c02fe2
	.xword	0x604d776c241d95d2
	.xword	0xe8e21a25d1a9624c
	.xword	0xe92fcdbddf9de2a4
	.xword	0x6c36db01051f5ae7
	.xword	0xfceaf699c893b162
	.xword	0x27e76485de9becb4
	.xword	0x600daf9c6c11a1eb
	.xword	0x4f043c84f934cf5f
	.xword	0x833f609b01a335e5
	.xword	0xec7750f770270dcc
	.xword	0x39322dbecf80a0d5
	.xword	0x7baf8c78069c4e5f
	.xword	0xf0c123c12e4c82e0
	.xword	0xf82d0f478d1e8185
	.xword	0x5dc8db8a78353d09
	.xword	0xfc2f38e8c721a943
	.xword	0x2a74f6c5baf2410f
	.xword	0x6247024e29a4a4fc
	.xword	0xf62499f10274efc8
	.xword	0xbc6cd651abaab42a
	.xword	0xae1d14add1f099d3
	.xword	0xd6ba615c9d143536
	.xword	0x8a60aaa83ad0090a
	.xword	0xf7b45b898ee50a78
	.xword	0x15d83ef0896eed80
	.xword	0xc237806acf815de6
	.xword	0x1f377de79e9fe225
	.xword	0x2124c1353d17b3e0
	.xword	0x770ccf7c920c6507
	.xword	0x7ccca70377298ded
	.xword	0x826a935a473e5e16
	.xword	0xc5f89624a435fbfa
	.xword	0xe75d21361f6374bb
	.xword	0x82ca2cba33ef8e17
	.xword	0x87725603a31c91a0
	.xword	0xdd6d8954a0ca1458
	.xword	0x4f903514bd4ad8fe
	.xword	0xf3c776859e94e2ab
	.xword	0x16cd0a5553227018
	.xword	0xea343e88cebe67ad
	.xword	0x63c9a2c75de46cb8
	.xword	0xd035be2f66a12b23
	.xword	0x96d66b28c75c8e8d
	.xword	0x4484fb1fad8a1434
	.xword	0xc6723210ef67d0dc
	.xword	0x1cc601e308f2b60d
	.xword	0x8c23c7e7f19a906a
	.xword	0xf9fbe2608516a55d
	.xword	0xe13b35d9d742a65e
	.xword	0xa6772a3c7bee2f45
	.xword	0xd175c793f3c8adcb
	.xword	0x51c46419ffd38a66
	.xword	0xcdcf4fbc9f57e2c6
	.xword	0x5c1ecd8d4252eec5
	.xword	0xf3897a4038508134
	.xword	0x694f0da244d0c6b2
	.xword	0xf44707a638e561f2
	.xword	0x85c573aedf7566be
	.xword	0xeb885b620968562f
	.xword	0x8dc2352c51275e01
	.xword	0xd60c8d825bdec0d4
	.xword	0x8e3dab43cd4e5644
	.xword	0x528e9c06b9d463e0
	.xword	0xd19686effd06615a
	.xword	0x96882000b67a67d8
	.xword	0xf07a2eeb1042c1c3
	.xword	0xd9e4afbfb49429b0
	.xword	0x07fe8bff720bfaea
	.xword	0xb111da7e7be9e58f
	.xword	0x1facf9ba88b714f2
	.xword	0x7bd9e446e2df6915
	.xword	0x9c20ff684ffdf257
	.xword	0x19eb4a46a040544e
	.xword	0xbffec2fcb21235f5
	.xword	0x8302d50525d99f97
	.xword	0x0796a3b3d2555b27
	.xword	0x3297feed8a7e2a80
	.xword	0x7a0acef3f3a9a8dd
	.xword	0x3e681ba4656c6287
	.xword	0x06226ad0c523625b
	.xword	0xee0bb3c27aa32383
	.xword	0xfe8dec1e9f3cfadd
	.xword	0xaf6731de018bccd5
	.xword	0x545a696651e3fee0
	.xword	0x24c9f8b928161233
	.xword	0x851fa5c039da9d7e
	.xword	0x9e7d26483a1dc14a
	.xword	0xe5d07e1412593dce
	.xword	0x667bc307e9c82c1f
	.xword	0xe9afb496d22b6c98
	.xword	0xbd796ca8b3447474
	.xword	0x0525575c6830ef53
	.xword	0x9c9b3cc8241fd29b
	.xword	0x306d34c3abe9faef
	.xword	0xf190b46e52827bcd
	.xword	0xb3d528d4be9023af
	.xword	0xa7aa611db1ef46e1
	.xword	0xd74f87c107999fbd
	.xword	0x03a6b6efecb27238
	.align 0x40000
	.data
data_start_6:

	.xword	0xed27f317d3d1af9f
	.xword	0xb4663d3bd9cfc729
	.xword	0x2e989d36218d9e24
	.xword	0x9816f974b4d799cf
	.xword	0x71a1e2a83403ea25
	.xword	0xbe8f32f1b8f83d51
	.xword	0x20f9c9589a9d4eec
	.xword	0xd301f05288271969
	.xword	0x3b70a6839332c378
	.xword	0x6eeeb76bf1d40891
	.xword	0xfe5f578472fc0c9c
	.xword	0xee9e678a55e17d94
	.xword	0xae838502078c5211
	.xword	0x15cd5fa33002ee48
	.xword	0x079a2650fa09adae
	.xword	0xfa5d9d8cf494d57f
	.xword	0x9b2592ec2a77692b
	.xword	0xf495d170a7e6d5e4
	.xword	0xd9e0e90c99070a8e
	.xword	0xec78723b02b4858e
	.xword	0x3684d1904e38497e
	.xword	0x27bc91b9337fb618
	.xword	0xb1e646429a182b9a
	.xword	0x7c0afa3692d25909
	.xword	0xfa15e36568825e12
	.xword	0x5257e09f9db9967c
	.xword	0xc85b1374c890b600
	.xword	0x680bcf5d5b325d61
	.xword	0x3c9598e782f6d284
	.xword	0x3ed321fef3e57e87
	.xword	0x7f8c4259e425d21b
	.xword	0xc3d3c0bd05844d18
	.xword	0x9479fe16381652e8
	.xword	0x6e2d76445b00241e
	.xword	0x95d8c6a83a368068
	.xword	0x1ade487833b7d28c
	.xword	0x0c960330657f64fe
	.xword	0x1b58e5cfb1a4be9a
	.xword	0x860cc848739215da
	.xword	0x2dab06d891d267c0
	.xword	0xd2d7d6e3f746a2ee
	.xword	0x9a4114c35bfe8bdf
	.xword	0x523603789425245e
	.xword	0x44e5bd6911393ef6
	.xword	0x89e7f1119a19796a
	.xword	0x40cd5293b737992d
	.xword	0x3e4606b262881ee1
	.xword	0x443f5b3c70ef1255
	.xword	0x8c817062d579ff02
	.xword	0xf704a90419b2804d
	.xword	0xdbaf907649806684
	.xword	0x1a2f28da313db393
	.xword	0xcb31d21f65d21a01
	.xword	0x5b8eee14315dbfc5
	.xword	0xf03df901a32b1e89
	.xword	0x711a22ddbe730423
	.xword	0x8893ef7cc7d5f9d7
	.xword	0x9fbafd7d20eafffc
	.xword	0x69858914edfeacc4
	.xword	0x84fe32903fef9165
	.xword	0xd7c6e905d37c1dcd
	.xword	0x0da533b584b622fc
	.xword	0x6b1d72403475dafc
	.xword	0x886933fbfd6fbca8
	.xword	0xfd97a1b236866036
	.xword	0xfde18a6d40f2753f
	.xword	0x42b8593299e7ebb6
	.xword	0xfde5e42bb72715f4
	.xword	0xc5a84638cb562ca0
	.xword	0xfd39d84708a53573
	.xword	0x36ac32f1c8d69fbd
	.xword	0x55677e2e97899a25
	.xword	0xf4ec8743a365760c
	.xword	0x27a63f402eee5559
	.xword	0xdfc8b841bdfa8aa3
	.xword	0x7f8dfe92db86b5dd
	.xword	0x348376b69e8c31db
	.xword	0xffa6fddb84cf0f63
	.xword	0x8f333b9d9e197fd0
	.xword	0x56c3ff937c51ce7e
	.xword	0x94995218c8da1de1
	.xword	0x086cae18f2c8a255
	.xword	0xdc87a2342d8f6483
	.xword	0x6f3612c57d08e095
	.xword	0x986f64c93a3b4729
	.xword	0x8be343dec87a1049
	.xword	0x2b1354abd7292e20
	.xword	0xa6227c83f8eccfae
	.xword	0xc77895d3030d71d5
	.xword	0x99ffdd272b523258
	.xword	0x495686a84db71703
	.xword	0x5942898ae7abeaa8
	.xword	0x3c4289eca94a9480
	.xword	0xd607d4ae72266b51
	.xword	0x7c1fc0316c2b318c
	.xword	0x36b78b33902b6b4e
	.xword	0xd6c7b22970399408
	.xword	0x03503b031d294072
	.xword	0x6b4be5c946b50bef
	.xword	0x383b1a5da2e6f7a7
	.xword	0xe299e978a73667ee
	.xword	0xa1c9d513a68f775a
	.xword	0xf6fdb910518611c1
	.xword	0x839a667a576953b7
	.xword	0x5a746589b5f67a33
	.xword	0x4c64b8d0cb8c5bb6
	.xword	0x6eb4e89df5d90c84
	.xword	0x5c9e0b77095b6f82
	.xword	0x6cb8ee355ec392f3
	.xword	0x9769a05056165a52
	.xword	0xb58ee29e2bd74daa
	.xword	0xe9fefedee52440a9
	.xword	0x939402b420878244
	.xword	0xa729b0cc215512de
	.xword	0x2bf902bb88a0149f
	.xword	0xae7f596f2329d27b
	.xword	0x32600931be73f1d1
	.xword	0x40b874f291f4e3bb
	.xword	0x629f081bd88978b1
	.xword	0x7ea08c1b450bd7d5
	.xword	0x65bf64171c56d0ce
	.xword	0xc65ff52ae227732e
	.xword	0xccb8c64e97162995
	.xword	0x25c5d5f6bdc5cc28
	.xword	0xf212b9ca2cca1092
	.xword	0x0afac24a7fb997c1
	.xword	0x5493324033b9d5e5
	.xword	0x4b0797e6df0a5842
	.xword	0x4101ab35074d95a9
	.xword	0x21323085dada9bc9
	.xword	0x8138a941568ae1a2
	.xword	0xf83a39b523324e11
	.xword	0x1bff0e4cd169290f
	.xword	0x84563406938545f6
	.xword	0xdd1eb28306179b6d
	.xword	0x6beca9c6a03f9f77
	.xword	0x7cf18595764c09ec
	.xword	0xc5bdfb777dff3844
	.xword	0x2239d86e394bff50
	.xword	0xf3e52f517da180d1
	.xword	0x194b6b1b5f6bc3e6
	.xword	0x249d344c83d35166
	.xword	0xe8e14775ce87bffc
	.xword	0xa31be4b10b584e91
	.xword	0x3aa267e81f88b01f
	.xword	0xe891468d61fbcbc0
	.xword	0x963ba150e8c038bd
	.xword	0x4cba04e1f34c7892
	.xword	0x7c3a1a39916158a9
	.xword	0x7e5a9361610f41db
	.xword	0xf6e5b78587e84266
	.xword	0xf8e382293cea284e
	.xword	0xaf3b9232053c1877
	.xword	0x0c9107d34665447a
	.xword	0x58255af6d69b319a
	.xword	0x36ac742c1351f105
	.xword	0x4c31a6c70413fc15
	.xword	0x2921ef960b6ebdc3
	.xword	0x73718c75711b7607
	.xword	0xff14391dfe581a4b
	.xword	0xb94ce8790543e317
	.xword	0x592b3f5b67526d0e
	.xword	0x6144a7332b16bb9d
	.xword	0xdb82b138d733bc2b
	.xword	0xdde7e2584f4b4dfb
	.xword	0x3e43a1f14fb0ad3f
	.xword	0x1888011f74ddf3db
	.xword	0x0978dcd9155d5f5f
	.xword	0x19ae4a7ac2674d0a
	.xword	0x0db49f36d0b82226
	.xword	0x1eac1d097421c1e9
	.xword	0x2ae7b4826674abbc
	.xword	0x2d9381b07fdda3ae
	.xword	0x19c1766a756ea8a9
	.xword	0xc733c1eda1047a83
	.xword	0x1795fa5f503c053c
	.xword	0x93bd47ee82b6fc68
	.xword	0x841833cee01fceb7
	.xword	0x8f27237c61d0eca7
	.xword	0x65de3077e01b5022
	.xword	0x51059271db2e45cf
	.xword	0x12ec7388804c1928
	.xword	0xdb8d107445692dc1
	.xword	0x03c8dc8dd0f93854
	.xword	0xc3fd2be5ab657dc6
	.xword	0xc2b538fbfbec556e
	.xword	0x944f599d56bc96c5
	.xword	0xc560ae12a3a63260
	.xword	0x3d1f6bc80925e99e
	.xword	0xdd008ee389b1c2b9
	.xword	0x0d7300a46c1199c0
	.xword	0x98c739bcc350dccb
	.xword	0x63748fed45452de5
	.xword	0x644e065e07c6bf16
	.xword	0x5a340b2cbd95fc02
	.xword	0xcf555e115b6e986d
	.xword	0x52a428337e958ea6
	.xword	0xef4218b595d9f589
	.xword	0x83b9c90a5aeabded
	.xword	0xccdb1be2ca03e835
	.xword	0xe60178ce6854b0f7
	.xword	0xf26c7d1717505b3d
	.xword	0xdd68a0f4dade62c2
	.xword	0x381c257d3d84a3fd
	.xword	0xf98cd5e1c86fbbad
	.xword	0xd6de7872b1642ea5
	.xword	0x318278ada3072d95
	.xword	0xaa2b82e4b68e8e0a
	.xword	0x0585874edb6c2d43
	.xword	0xc77079fb402353f9
	.xword	0x766df00820f97887
	.xword	0x03d1b21a9bac98b1
	.xword	0x1addd46dbe7787f2
	.xword	0x53df5389cf973de0
	.xword	0x356df6026fb8c460
	.xword	0x9a0972dd544ed892
	.xword	0xd22c386e75268ca6
	.xword	0xdebaabd74d77ac52
	.xword	0xfba57db37d04bbfd
	.xword	0xa856d553e483b449
	.xword	0xc7a12debbdcc5018
	.xword	0x5e84a04342a4c1a6
	.xword	0x299e61ecaede0c5a
	.xword	0x2cf37ca702447e94
	.xword	0x37b639e14a5dc0d3
	.xword	0x8be9d817c8af9ddb
	.xword	0x4306e782a1198b18
	.xword	0x2c4c7e82995822e9
	.xword	0x318fe4cf02830bc6
	.xword	0x7d4a9946dfa21991
	.xword	0x1942eecaf0dfd8c2
	.xword	0x859e816fb840f18c
	.xword	0x045c0fcca1ec9208
	.xword	0x82e55e3b867e0e84
	.xword	0x07e76f1c318d76b0
	.xword	0x07ccf8cabce9769a
	.xword	0x5068bd91c2d38afc
	.xword	0x7931eb0917fd6934
	.xword	0x23f469e4c429a197
	.xword	0xab9e0b41e1113667
	.xword	0x5b31d8f485540c1a
	.xword	0x42d809212fbe0201
	.xword	0xaea8b81c935d9d72
	.xword	0x0e6e39b69702aed7
	.xword	0x1694976a129486d7
	.xword	0x8f2cd33e2984e46a
	.xword	0x0a69746650c989a1
	.xword	0x90b5515327d9950d
	.xword	0x15c776d4bd8edd0a
	.xword	0xfc74449c83feda3d
	.xword	0xfad30fb00c606b99
	.xword	0xfe7a1fff40c74337
	.xword	0x9909dc1be2e113cd
	.xword	0xbfe5c07ac667ec38
	.xword	0x8aa84c5090d9f53f
	.xword	0x1f754d3ee4710d03
	.align 0x80000
	.data
data_start_7:

	.xword	0x2cd76ef6000add8d
	.xword	0x14b2d399c9b4590f
	.xword	0x4ff866667f87fd93
	.xword	0x7ebfe43d7a0e8ab0
	.xword	0x1d8cf08fc6635021
	.xword	0x9fd2f0cfb3e8cab6
	.xword	0x317bbd01dc1bd077
	.xword	0xb2bcf5df5788957f
	.xword	0x367d2e06f16fb53b
	.xword	0xfd527cb6b334294f
	.xword	0x1cda98339746d555
	.xword	0x843af17ba63c2267
	.xword	0x0bf127390f4ca9d6
	.xword	0x11c76515050c1a66
	.xword	0x5e1711d637607b9b
	.xword	0x244d0e640bf06764
	.xword	0x02be3b1372ba57f6
	.xword	0x5d8fe95592c231b8
	.xword	0x5a53d9ec3dbadd44
	.xword	0x4a0eeadc8d42fd98
	.xword	0x10fe7b179dac3c66
	.xword	0xf90c18205d97b286
	.xword	0xd27ede1d16be7ac1
	.xword	0x9d0bbaf09c1231ca
	.xword	0x63571557b08d8fae
	.xword	0xdcf6b75537df7576
	.xword	0x916cb45ca2a442b8
	.xword	0xb027f1b235cc3377
	.xword	0x25512b8fa91876df
	.xword	0xcc27dbc3ccebd394
	.xword	0x670836ca80b5e34b
	.xword	0x721dc8cef0cb4651
	.xword	0x01e0175483657171
	.xword	0x944b18284f8b0f19
	.xword	0xdd2bc21a17f4c843
	.xword	0x5270e9ba185a70c9
	.xword	0x8ab4704ca775fcb8
	.xword	0x4bb2d47030782c8a
	.xword	0x6620dcf64db76c84
	.xword	0xcca491629f5e8a93
	.xword	0xc85f8fb9bdef8b32
	.xword	0xe1ce03fd5ba1aafb
	.xword	0x6330d60e28137204
	.xword	0x4d0261c970a6fcdf
	.xword	0x3d1b08a02158a45a
	.xword	0xf53cacf90b44d148
	.xword	0x153d7c7b275bcc78
	.xword	0xde405864d5e66152
	.xword	0x20b5867d88364ff5
	.xword	0x66a4466c6771bff2
	.xword	0xaba63aaa411670c5
	.xword	0xa644c2f46693fe23
	.xword	0xd07146bacb46c77a
	.xword	0x07028d844182b7fa
	.xword	0x62ed766c6702dcfe
	.xword	0x28eaafa5105f0472
	.xword	0x84632fd02c1b2e34
	.xword	0xc34f37bb12a90bf2
	.xword	0x21bf4ffa1f88bd41
	.xword	0xd2520bd07755c5c3
	.xword	0xa79fc612087fca09
	.xword	0xdbbde69240231a12
	.xword	0xb532b6d79b603eb4
	.xword	0x48515e444b00080d
	.xword	0xe4de5aead0a2715a
	.xword	0xfedbdc1655539ee7
	.xword	0x124afd3b834069ce
	.xword	0xe064ee644115ba77
	.xword	0xd2eee857dca49adf
	.xword	0x7bed0ff98477645c
	.xword	0xa0448812da763548
	.xword	0xb641cf43e3dbf501
	.xword	0x3607f376c2f84b3f
	.xword	0x5542310b8a7cbc5a
	.xword	0xf22fea7096189e4e
	.xword	0xe22d8cdd7b08de8d
	.xword	0xcdb49c89ca1a049d
	.xword	0xcc64b24ec689fdf7
	.xword	0xc66ede6076b92add
	.xword	0xf2cd1b116b035b7c
	.xword	0xa70ae6819846dc8e
	.xword	0x14514ba7909dfca7
	.xword	0x2a555955c62a44de
	.xword	0xeff73b63f62e69b1
	.xword	0x828ed9d9ab358647
	.xword	0x86588159408ed513
	.xword	0x937f33f8b428a0c1
	.xword	0x72546e1fc0e63ceb
	.xword	0xec80995705840c3e
	.xword	0x6542f25c195e1b66
	.xword	0x65c012ea3b9e3cde
	.xword	0x67db3333989b56bd
	.xword	0x00d4acbc88bc1f61
	.xword	0x813f8503ae5b43b7
	.xword	0x3dbd1a1b10b5991b
	.xword	0x2fe260326d7a509b
	.xword	0xb0bd644b3f41711a
	.xword	0x652bb89eb74221ff
	.xword	0x36e0a5da29b67404
	.xword	0xf6e1b2a51d6c830d
	.xword	0xec124137b057a304
	.xword	0x600d2bb8fa18f884
	.xword	0xb73cae7fd03a2fdd
	.xword	0x73c1a22c3de2b2c3
	.xword	0x2d1bcb53e036c82b
	.xword	0xdc72c72cf07ed4e3
	.xword	0x2ae3f95b57fc8eda
	.xword	0x0268913259bb9e3d
	.xword	0xf46910ddafcd3057
	.xword	0xea16e0ab82755883
	.xword	0x8621c614c854089c
	.xword	0xc23f05b04ce44b78
	.xword	0x1d62ceb060722272
	.xword	0x685fc283f40b62b4
	.xword	0x93bcb8a57cff7bf7
	.xword	0x292d43748152e7eb
	.xword	0x30c2c4bee95a1fa8
	.xword	0xe41bb16c75b05822
	.xword	0xf9450e5b269d88aa
	.xword	0x5953524c56502f4c
	.xword	0x82336706485d266a
	.xword	0x591671f5962f32bd
	.xword	0x7bb0dd8a4eac9806
	.xword	0xa3da2c64154d631d
	.xword	0x138c569c27b07a41
	.xword	0x328342693851d1ce
	.xword	0xbcf767bfaeca260d
	.xword	0x3f0e5c25582a2243
	.xword	0xb37129fbd7eed14c
	.xword	0x9238f39d004e389b
	.xword	0x68c488235301ace3
	.xword	0x52dd81b89bb7b07b
	.xword	0xed4b0def1d5af66e
	.xword	0xe8649a9cd2f388cb
	.xword	0xb59daed5aeb0bdc5
	.xword	0x8155173cb7d142d4
	.xword	0xdf11f3ac0e551eb2
	.xword	0x9b33336fd2d28f9c
	.xword	0x98a81600f1886e3f
	.xword	0x3258efcd57ad9e7b
	.xword	0xd6f809e2918f4c13
	.xword	0x428818c1eef5883a
	.xword	0x28383d9807221072
	.xword	0x141a01546fb8b589
	.xword	0x5fe8e80aed063a92
	.xword	0xeff33892d6ceaf4d
	.xword	0x28a627717681d4e2
	.xword	0x56802fca600daa01
	.xword	0xaf5d0f25745c10aa
	.xword	0xe36a5ec18ee44966
	.xword	0x4ecfcb9527ec0a75
	.xword	0x10b542dcbcbfaaf3
	.xword	0xfcfed170a404ca22
	.xword	0x8e4d40de5601a677
	.xword	0x8369065aaf71dd41
	.xword	0x551b796c54c011c1
	.xword	0x5b421e952bb49301
	.xword	0xb40a768fbdf823c4
	.xword	0x6918f924e0afa520
	.xword	0xab66d6fa3d76d6ff
	.xword	0x8879b3e39d52755c
	.xword	0xe71523163ba70f8f
	.xword	0xfdbaf34547bc6bea
	.xword	0xa603da20cfaff056
	.xword	0xae69ee0766c325cb
	.xword	0xca6a4ad24b20ebc6
	.xword	0x8eef45ffce3bc4b6
	.xword	0x4cceccfb68d153ac
	.xword	0xd3a93f7fbeb01639
	.xword	0xca4a73905e21697d
	.xword	0xc56a2396738b7fc5
	.xword	0x6cb26e708e5e4fd1
	.xword	0x2355c5d8c41a2fd7
	.xword	0x618d93cd2e3bbfc5
	.xword	0x6e504ddc074bbd4b
	.xword	0x7e876f79faf3d6da
	.xword	0x0008018f87f80818
	.xword	0xc4253e1a015f0ded
	.xword	0x4a5921c0cbeab969
	.xword	0x0bd13941c9e5085f
	.xword	0xdcaba79efefda602
	.xword	0x541677eac28363b4
	.xword	0x72d2b7bf508ef65e
	.xword	0x5c0bef2076a90c46
	.xword	0x7f7fd27e662ee334
	.xword	0x13c94e026441c2fb
	.xword	0x315e4b0f12e7c947
	.xword	0x8f4d96a961354b3e
	.xword	0xfb1bbc229e847383
	.xword	0x0d2869df22153343
	.xword	0x3ff7468fe5c9cfde
	.xword	0x130acdb5fba580a2
	.xword	0x34d7616226562fe3
	.xword	0x508cae6850af396c
	.xword	0x1babfcaee6be96a8
	.xword	0xc0126b83b426c9af
	.xword	0xe11fd2f4d32240b0
	.xword	0x752df6d9a26e5972
	.xword	0x732b19ebfaec93ee
	.xword	0xd77bb2bb37f43d7c
	.xword	0x9124e3ae46f14972
	.xword	0x53b3d2d53afcd652
	.xword	0xa0eb42a37c1a49c2
	.xword	0x5cfce38456c6bb6c
	.xword	0x937c75086cbb8d34
	.xword	0x88c93aac45667be0
	.xword	0x5626dfd536258965
	.xword	0xd7efeeb094ce9bd3
	.xword	0xdde1ab0d2bdb4c0e
	.xword	0x40735a3346438c7f
	.xword	0x6cda4e69c518de93
	.xword	0x51fd9a9a13e56805
	.xword	0xd9e09db0f70571ec
	.xword	0x65b3858633c2dd66
	.xword	0x666e008548f058d1
	.xword	0xdb97c5774b42ebe9
	.xword	0x3c27a97b56bf49ee
	.xword	0xc806ddc0578cfcd9
	.xword	0xec32549c08bba256
	.xword	0x40057fe165158fe9
	.xword	0x3f0f1a89932ff2b8
	.xword	0x670017cb4d73e95d
	.xword	0xc35c4cc53bf950fd
	.xword	0x2844072710f7ed4b
	.xword	0x0000d97c002e01ed
	.xword	0xf5cf114102a19646
	.xword	0x19cefaf6da825226
	.xword	0x9b274371b78e4cc3
	.xword	0xb450748018874b37
	.xword	0x7356ea84b0ccd15d
	.xword	0x0d8d568854b1e412
	.xword	0x592d4b8f60958b22
	.xword	0x312548027053f2a6
	.xword	0xd7f6088df277d905
	.xword	0xf76c741ed6ec1023
	.xword	0xdf0631ee890f0458
	.xword	0x0892baa53e9390e6
	.xword	0x409c7c20189bd9e5
	.xword	0x76df6f8948242da3
	.xword	0x584a34f49c0f8c8b
	.xword	0x29f3d25c13179d45
	.xword	0x488bd8c87e0565e4
	.xword	0xcebba93bc4a39340
	.xword	0x8b50407c17eb8126
	.xword	0x2e9bd854d03aea00
	.xword	0xc6de96c44d0fe4bc
	.xword	0xbb2c162e8140cb8c
	.xword	0x5dfecfbce26aab80
	.xword	0xbd934889a57938eb
	.xword	0x40bae83450a29b4f
	.xword	0x02f4134cc6242081
	.xword	0xba46c3cb4e86179f
	.xword	0xa9269dd554914f6d
	.xword	0xc2e5c37ef699a1d5
	.xword	0x0e35c1246b6f444c
	.xword	0xd13a98ad9ba1596c



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
