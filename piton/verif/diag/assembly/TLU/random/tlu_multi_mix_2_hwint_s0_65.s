// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tlu_multi_mix_2_hwint_s0_65.s
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
   random seed:	803131103
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

	setx 0xc3be8cc95088e41a, %g1, %g0
	setx 0xb4b49787b0fe44bc, %g1, %g1
	setx 0x5a7c9585a3bb758b, %g1, %g2
	setx 0x1cb647804c23bfc3, %g1, %g3
	setx 0xed11711f9ad4840e, %g1, %g4
	setx 0x7ff48751c8562d7d, %g1, %g5
	setx 0xcadcdaee5ca880cd, %g1, %g6
	setx 0x28351ec67014455e, %g1, %g7
	setx 0x072d8cb766c33312, %g1, %r16
	setx 0x681f4cb128dc9a4d, %g1, %r17
	setx 0x6689c49c26289362, %g1, %r18
	setx 0xd72a33308af069d9, %g1, %r19
	setx 0x03b6d317642b6ce9, %g1, %r20
	setx 0x4510e16609fd72aa, %g1, %r21
	setx 0x2c2037bbe0b427c0, %g1, %r22
	setx 0x785bf0afa962c81a, %g1, %r23
	setx 0x8018d156130bc851, %g1, %r24
	setx 0xb08fe4e694a15c9b, %g1, %r25
	setx 0xe4780620079a5825, %g1, %r26
	setx 0x4acc95a8d2bb99fd, %g1, %r27
	setx 0xb55c5f3dd785e2d0, %g1, %r28
	setx 0xcc24620ee096a572, %g1, %r29
	setx 0x726e134b76c234f6, %g1, %r30
	setx 0x8f5249a22bea7fc3, %g1, %r31
	save
	setx 0x07235ba155e0b9f1, %g1, %r16
	setx 0xcf25a2ff5615e0db, %g1, %r17
	setx 0x482c4e895aaaf24e, %g1, %r18
	setx 0x83e423f3a1aa206c, %g1, %r19
	setx 0x22d5d814df8b635e, %g1, %r20
	setx 0x86951f2c2f611e60, %g1, %r21
	setx 0x2abdc584d824fba8, %g1, %r22
	setx 0x9441d3013841603a, %g1, %r23
	setx 0x3c4355e9e1d41826, %g1, %r24
	setx 0x003f98429aee3eec, %g1, %r25
	setx 0x1c53b32beea76b75, %g1, %r26
	setx 0xa7a728a979d7e51b, %g1, %r27
	setx 0x33af3bdb2c9d714a, %g1, %r28
	setx 0x265b3a006d6a977c, %g1, %r29
	setx 0xb7a73a0f8697d029, %g1, %r30
	setx 0xd01291037d6e79b5, %g1, %r31
	save
	setx 0x1e4f72c8d5105f3f, %g1, %r16
	setx 0xe7d595ea44eacead, %g1, %r17
	setx 0x0493549ef8345c53, %g1, %r18
	setx 0x505667b34d0c9f9e, %g1, %r19
	setx 0xc2c89afdc35ea397, %g1, %r20
	setx 0xc18f625a418f9ffc, %g1, %r21
	setx 0xd29d24bfb901f637, %g1, %r22
	setx 0xcdcc591f053a4989, %g1, %r23
	setx 0xcf20ad8adf166998, %g1, %r24
	setx 0xb218f82da5cc05cf, %g1, %r25
	setx 0x194aeffafc17d331, %g1, %r26
	setx 0x6954c6ab5300d10f, %g1, %r27
	setx 0xfd5b4e023f516fbf, %g1, %r28
	setx 0x91ae66044cc49df6, %g1, %r29
	setx 0x661a0d3e24e734c5, %g1, %r30
	setx 0xaa96b3d15c142471, %g1, %r31
	save
	setx 0x9ca874e6db0fa1f9, %g1, %r16
	setx 0x08fb306509baad97, %g1, %r17
	setx 0xa64aff8ecf85e5c4, %g1, %r18
	setx 0x17277f948e77cd98, %g1, %r19
	setx 0xe9d2d227dc3d73fc, %g1, %r20
	setx 0x26fb81964b93ed22, %g1, %r21
	setx 0x6f0dfaafee794ddb, %g1, %r22
	setx 0x6e97982857544ab1, %g1, %r23
	setx 0xc521de3c7bfbf034, %g1, %r24
	setx 0x39d8a5ba88d0b801, %g1, %r25
	setx 0x51cdaef13248a67c, %g1, %r26
	setx 0x435ced81bcef3c4c, %g1, %r27
	setx 0x1cd0e8f008430618, %g1, %r28
	setx 0x830b42bd08bfaf5f, %g1, %r29
	setx 0xa1ba12ab57ff0fd5, %g1, %r30
	setx 0x045a18982f43e049, %g1, %r31
	save
	setx 0x0a7f16f73956d5d0, %g1, %r16
	setx 0x198cff1f7462ac0d, %g1, %r17
	setx 0x3f003571436955e8, %g1, %r18
	setx 0x8848220f24efe1a3, %g1, %r19
	setx 0x9f2ed81865851a68, %g1, %r20
	setx 0x0b681efe9b544e16, %g1, %r21
	setx 0x95d5b8ca7813ff9d, %g1, %r22
	setx 0xe0bf02c40eaf9874, %g1, %r23
	setx 0xac048dd4ac452335, %g1, %r24
	setx 0x8c30dd1d64c8ee33, %g1, %r25
	setx 0x389bf7f5d140ec6a, %g1, %r26
	setx 0xfab8c485d1708c2e, %g1, %r27
	setx 0xd130fa05bd9cd201, %g1, %r28
	setx 0x4d2cb30142b76518, %g1, %r29
	setx 0xb9a3fcf7baedd5af, %g1, %r30
	setx 0x41f93fe50b6438e1, %g1, %r31
	save
	setx 0xe9dd4f1b02534f49, %g1, %r16
	setx 0xa6c07d10d5dce8ce, %g1, %r17
	setx 0x891679df52fa4093, %g1, %r18
	setx 0xef2c038e590ea83b, %g1, %r19
	setx 0x0bb100c744c03be1, %g1, %r20
	setx 0xc52708401f3a9568, %g1, %r21
	setx 0xa0ce366a56b153a1, %g1, %r22
	setx 0x24337c4facd81984, %g1, %r23
	setx 0x11beac6b7e90a86e, %g1, %r24
	setx 0xb938b3d992f915c8, %g1, %r25
	setx 0x7f72a15478c42f01, %g1, %r26
	setx 0xb63125c74a88a648, %g1, %r27
	setx 0xa6b8a93a16f9c7e3, %g1, %r28
	setx 0x9ff714cc454f7b6a, %g1, %r29
	setx 0x121b9f7452e141a2, %g1, %r30
	setx 0x8729468321034f81, %g1, %r31
	save
	setx 0xc3f943a93b9b8d0c, %g1, %r16
	setx 0xe60b0830c19ae302, %g1, %r17
	setx 0xe62fa7f3bebfb367, %g1, %r18
	setx 0x5ac6e21f15b9c5ad, %g1, %r19
	setx 0x640e1c7bc18f3ac5, %g1, %r20
	setx 0xf496baddbe8c0843, %g1, %r21
	setx 0x8dfb1c9aae1f41c2, %g1, %r22
	setx 0x2c6cf7b47b762055, %g1, %r23
	setx 0x7d4ff9b987c3f2be, %g1, %r24
	setx 0x1c97222d1ecc3b37, %g1, %r25
	setx 0x66062a534dad7386, %g1, %r26
	setx 0x18afd795852b4691, %g1, %r27
	setx 0x0a18e57d47731da6, %g1, %r28
	setx 0x1922f541468c26d8, %g1, %r29
	setx 0x31943f989f07dc77, %g1, %r30
	setx 0xb9735b2a5e6fceb6, %g1, %r31
	save
	setx 0x4df244f5b0757911, %g1, %r16
	setx 0x2bef9b1921e877d3, %g1, %r17
	setx 0xb80ddb47eb21f199, %g1, %r18
	setx 0xb156e2b9ee6d60e1, %g1, %r19
	setx 0x6f8669e09b45acaf, %g1, %r20
	setx 0xfbb97ddd153dce83, %g1, %r21
	setx 0x1c86e597a3262008, %g1, %r22
	setx 0xf171a3e5b1f1749f, %g1, %r23
	setx 0xb41808fde678df50, %g1, %r24
	setx 0x3f0b7cb56ea35e03, %g1, %r25
	setx 0xb4d49cb37ec467a8, %g1, %r26
	setx 0x993797f51d865ed8, %g1, %r27
	setx 0x8d1d5060b1a035c7, %g1, %r28
	setx 0x48c50b6b7e348be4, %g1, %r29
	setx 0x8638e57f686d133a, %g1, %r30
	setx 0x28a7ebc61fb3c43b, %g1, %r31
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
	.word 0xb7e52072  ! 1: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb01c8000  ! 2: XOR_R	xor 	%r18, %r0, %r24
	.word 0xbf540000  ! 3: RDPR_GL	<illegal instruction>
	.word 0xb5e521c9  ! 4: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb3e5e1aa  ! 6: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb3508000  ! 9: RDPR_TSTATE	<illegal instruction>
	.word 0xb3500000  ! 10: RDPR_TPC	<illegal instruction>
	.word 0xb0b44000  ! 11: ORNcc_R	orncc 	%r17, %r0, %r24
	.word 0xb9e5a0d6  ! 12: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb7e4e00e  ! 13: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb1e4e1c7  ! 15: SAVE_I	save	%r19, 0x0001, %r24
	.word 0x8594a0c8  ! 16: WRPR_TSTATE_I	wrpr	%r18, 0x00c8, %tstate
	.word 0xb7508000  ! 19: RDPR_TSTATE	<illegal instruction>
hwintr_0_0:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_0), 16, 16)) -> intp(0, 0, 23)
	.word 0xbbe520a7  ! 24: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb5e5a111  ! 25: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xbbe5211f  ! 27: SAVE_I	save	%r20, 0x0001, %r29
	.word 0x8394e119  ! 30: WRPR_TNPC_I	wrpr	%r19, 0x0119, %tnpc
	mov	1, %r12
	.word 0xa1930000  ! 31: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbde5e01d  ! 35: SAVE_I	save	%r23, 0x0001, %r30
hwintr_0_1:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_1), 16, 16)) -> intp(0, 0, 2b)
	.word 0xbe34a025  ! 39: SUBC_I	orn 	%r18, 0x0025, %r31
	.word 0x8794e09c  ! 40: WRPR_TT_I	wrpr	%r19, 0x009c, %tt
	.word 0xb7e4e0f9  ! 43: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb9e5e1c4  ! 44: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb1e521de  ! 45: SAVE_I	save	%r20, 0x0001, %r24
hwintr_0_2:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_2), 16, 16)) -> intp(0, 0, 1c)
	.word 0xb5e4a0ce  ! 52: SAVE_I	save	%r18, 0x0001, %r26
	.word 0x919520dc  ! 54: WRPR_PIL_I	wrpr	%r20, 0x00dc, %pil
	.word 0xb9e42092  ! 57: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xbfe5609d  ! 58: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xbfe56034  ! 61: SAVE_I	save	%r21, 0x0001, %r31
hwintr_0_3:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_3), 16, 16)) -> intp(0, 0, 8)
hwintr_0_4:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_4), 16, 16)) -> intp(0, 0, 2f)
hwintr_0_5:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_5), 16, 16)) -> intp(0, 0, 4)
	.word 0xbc454000  ! 68: ADDC_R	addc 	%r21, %r0, %r30
	mov	2, %r12
	.word 0xa1930000  ! 70: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb1e5a009  ! 79: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb5e461a6  ! 90: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xbc24a1b9  ! 92: SUB_I	sub 	%r18, 0x01b9, %r30
	.word 0xb9e5a16f  ! 94: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xbbe5a1bc  ! 106: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb9e4e095  ! 112: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb7e42122  ! 115: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb1e56102  ! 116: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb3e5e081  ! 117: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xbfe4a11f  ! 122: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xbde4e138  ! 123: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb1e46128  ! 128: SAVE_I	save	%r17, 0x0001, %r24
hwintr_0_6:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_6), 16, 16)) -> intp(0, 0, 14)
	.word 0xb1504000  ! 131: RDPR_TNPC	<illegal instruction>
	.word 0xbde5e057  ! 132: SAVE_I	save	%r23, 0x0001, %r30
	.word 0x87942149  ! 134: WRPR_TT_I	wrpr	%r16, 0x0149, %tt
	.word 0xb7e520e4  ! 136: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb4c521c1  ! 137: ADDCcc_I	addccc 	%r20, 0x01c1, %r26
	.word 0xb9540000  ! 139: RDPR_GL	<illegal instruction>
	.word 0xb9e461b5  ! 141: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb7e56011  ! 142: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xbfe4e071  ! 143: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xbde4a125  ! 145: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb5e5a07e  ! 146: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb5e5a0d4  ! 152: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xbb2cd000  ! 153: SLLX_R	sllx	%r19, %r0, %r29
hwintr_0_7:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_7), 16, 16)) -> intp(0, 0, 2e)
	.word 0xb7e4a00e  ! 157: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb9510000  ! 159: RDPR_TICK	<illegal instruction>
	.word 0xb3540000  ! 162: RDPR_GL	<illegal instruction>
	.word 0xbfe460c5  ! 164: SAVE_I	save	%r17, 0x0001, %r31
	.word 0x8395615e  ! 166: WRPR_TNPC_I	wrpr	%r21, 0x015e, %tnpc
	.word 0xb57c2401  ! 168: MOVR_I	movre	%r16, 0x1, %r26
	.word 0xb3e46157  ! 171: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbfe46049  ! 172: SAVE_I	save	%r17, 0x0001, %r31
	.word 0x8394a115  ! 174: WRPR_TNPC_I	wrpr	%r18, 0x0115, %tnpc
	mov	0, %r12
	.word 0x8f930000  ! 186: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x8195a1a1  ! 187: WRPR_TPC_I	wrpr	%r22, 0x01a1, %tpc
	.word 0xbbe461cf  ! 189: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xbf480000  ! 191: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xb40561b9  ! 192: ADD_I	add 	%r21, 0x01b9, %r26
	.word 0xb9e4a1b1  ! 193: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb6256010  ! 194: SUB_I	sub 	%r21, 0x0010, %r27
	.word 0xb1e4a0ae  ! 199: SAVE_I	save	%r18, 0x0001, %r24
	setx	data_start_3, %g1, %r21
	.word 0x8195e006  ! 207: WRPR_TPC_I	wrpr	%r23, 0x0006, %tpc
	setx	data_start_0, %g1, %r18
	.word 0xb285e082  ! 210: ADDcc_I	addcc 	%r23, 0x0082, %r25
	.word 0xb40d0000  ! 211: AND_R	and 	%r20, %r0, %r26
	.word 0xb1e4208f  ! 214: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xbde4a1c9  ! 215: SAVE_I	save	%r18, 0x0001, %r30
	.word 0x91942029  ! 218: WRPR_PIL_I	wrpr	%r16, 0x0029, %pil
	.word 0xbfe4208d  ! 219: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb9e4a067  ! 224: SAVE_I	save	%r18, 0x0001, %r28
	.word 0x8795202c  ! 226: WRPR_TT_I	wrpr	%r20, 0x002c, %tt
hwintr_0_8:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_8), 16, 16)) -> intp(0, 0, 2f)
	.word 0xb3e4a0b1  ! 228: SAVE_I	save	%r18, 0x0001, %r25
	.word 0x8d94e0c2  ! 229: WRPR_PSTATE_I	wrpr	%r19, 0x00c2, %pstate
	.word 0xb9e5e0cf  ! 233: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb1e5600a  ! 234: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb7e5a1a3  ! 236: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb7480000  ! 238: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xb7e5e176  ! 239: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xbde5a012  ! 240: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb33c5000  ! 244: SRAX_R	srax	%r17, %r0, %r25
	.word 0xbde460e4  ! 247: SAVE_I	save	%r17, 0x0001, %r30
hwintr_0_9:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_9), 16, 16)) -> intp(0, 0, 33)
	.word 0xb7e521ef  ! 253: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xbd504000  ! 254: RDPR_TNPC	<illegal instruction>
hwintr_0_10:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_10), 16, 16)) -> intp(0, 0, 11)
	.word 0xb9480000  ! 257: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xb22dc000  ! 260: ANDN_R	andn 	%r23, %r0, %r25
	.word 0xb3e4215b  ! 267: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb1e5e12c  ! 268: SAVE_I	save	%r23, 0x0001, %r24
	.word 0x85946064  ! 270: WRPR_TSTATE_I	wrpr	%r17, 0x0064, %tstate
	.word 0xb9540000  ! 271: RDPR_GL	<illegal instruction>
hwintr_0_11:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_11), 16, 16)) -> intp(0, 0, 3b)
	.word 0xb5e560bc  ! 282: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xbde4a0a0  ! 283: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xb5e5e0eb  ! 294: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb5e42193  ! 295: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb9480000  ! 296: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xb9540000  ! 297: RDPR_GL	<illegal instruction>
hwintr_0_12:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_12), 16, 16)) -> intp(0, 0, 14)
hwintr_0_13:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_13), 16, 16)) -> intp(0, 0, 9)
	.word 0xb3e4a180  ! 310: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb1e46118  ! 314: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb1e5e0c7  ! 316: SAVE_I	save	%r23, 0x0001, %r24
	.word 0x8594e119  ! 320: WRPR_TSTATE_I	wrpr	%r19, 0x0119, %tstate
	.word 0xb3e421bf  ! 323: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xbe8ca0ea  ! 325: ANDcc_I	andcc 	%r18, 0x00ea, %r31
	.word 0xbbe4a1e0  ! 328: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb5e46104  ! 329: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb9504000  ! 331: RDPR_TNPC	<illegal instruction>
	.word 0xbfe561f7  ! 335: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xbbe5a082  ! 337: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xbbe46143  ! 339: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb7e421b3  ! 340: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xbd50c000  ! 342: RDPR_TT	<illegal instruction>
	.word 0xb4358000  ! 347: SUBC_R	orn 	%r22, %r0, %r26
	.word 0xb5e5e107  ! 356: SAVE_I	save	%r23, 0x0001, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	data_start_4, %g1, %r20
	.word 0x8995a001  ! 364: WRPR_TICK_I	wrpr	%r22, 0x0001, %tick
	.word 0xbbe4e0fa  ! 371: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb3e5e022  ! 373: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xbde4e1cc  ! 374: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb5e4213b  ! 376: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xbcbde19e  ! 378: XNORcc_I	xnorcc 	%r23, 0x019e, %r30
	.word 0xbf50c000  ! 380: RDPR_TT	<illegal instruction>
	.word 0xb9e5a154  ! 383: SAVE_I	save	%r22, 0x0001, %r28
hwintr_0_14:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_14), 16, 16)) -> intp(0, 0, 38)
	.word 0xb1508000  ! 391: RDPR_TSTATE	<illegal instruction>
	.word 0xbd520000  ! 392: RDPR_PIL	<illegal instruction>
	mov	0, %r12
	.word 0xa1930000  ! 393: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb3518000  ! 398: RDPR_PSTATE	<illegal instruction>
	.word 0xb3e4a1d8  ! 403: SAVE_I	save	%r18, 0x0001, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb7e4e039  ! 405: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb9e56066  ! 406: SAVE_I	save	%r21, 0x0001, %r28
	mov	0, %r12
	.word 0x8f930000  ! 407: WRPR_TL_R	wrpr	%r12, %r0, %tl
	setx	data_start_2, %g1, %r20
	.word 0xbfe46044  ! 409: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb404604e  ! 411: ADD_I	add 	%r17, 0x004e, %r26
	.word 0xb7e5e0fd  ! 415: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb1e4e0d7  ! 416: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb750c000  ! 418: RDPR_TT	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
hwintr_0_15:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_15), 16, 16)) -> intp(0, 0, 39)
	.word 0xbbe4a15e  ! 425: SAVE_I	save	%r18, 0x0001, %r29
	.word 0x8195e062  ! 427: WRPR_TPC_I	wrpr	%r23, 0x0062, %tpc
	.word 0xbb500000  ! 428: RDPR_TPC	<illegal instruction>
	.word 0xb9e5a1f3  ! 429: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb350c000  ! 431: RDPR_TT	<illegal instruction>
	.word 0xbb518000  ! 432: RDPR_PSTATE	<illegal instruction>
	.word 0xb5e4e102  ! 435: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb9e5a1b2  ! 438: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb77de401  ! 439: MOVR_I	movre	%r23, 0x1, %r27
	.word 0xb0250000  ! 443: SUB_R	sub 	%r20, %r0, %r24
hwintr_0_16:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_16), 16, 16)) -> intp(0, 0, 1e)
	.word 0xb9350000  ! 449: SRL_R	srl 	%r20, %r0, %r28
	.word 0xb9e52123  ! 451: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb3e56052  ! 454: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb1e421a4  ! 458: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb7e5a12f  ! 460: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xbb500000  ! 461: RDPR_TPC	<illegal instruction>
	.word 0xbbe5a07d  ! 463: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xbde46109  ! 464: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb750c000  ! 468: RDPR_TT	<illegal instruction>
	.word 0xbbe46119  ! 470: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb3480000  ! 472: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
hwintr_0_17:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_17), 16, 16)) -> intp(0, 0, 37)
	.word 0xb3e52152  ! 478: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xbbe561e8  ! 479: SAVE_I	save	%r21, 0x0001, %r29
	.word 0x8595a1ff  ! 480: WRPR_TSTATE_I	wrpr	%r22, 0x01ff, %tstate
	setx	data_start_0, %g1, %r23
	.word 0xb1e5617d  ! 482: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xbb51c000  ! 487: RDPR_TL	<illegal instruction>
	.word 0x8195619b  ! 491: WRPR_TPC_I	wrpr	%r21, 0x019b, %tpc
	setx	data_start_5, %g1, %r20
	.word 0xb1e42008  ! 496: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb5e520f3  ! 497: SAVE_I	save	%r20, 0x0001, %r26
	mov	0, %r12
	.word 0xa1930000  ! 498: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbd7d0400  ! 499: MOVR_R	movre	%r20, %r0, %r30
	.word 0xb7518000  ! 500: RDPR_PSTATE	<illegal instruction>
	.word 0xbfe4e1a6  ! 501: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb1e5a0ab  ! 504: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb7e46004  ! 506: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xbfe52045  ! 511: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xbde5e05f  ! 512: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xbfe561a7  ! 517: SAVE_I	save	%r21, 0x0001, %r31
	.word 0x8194a19b  ! 520: WRPR_TPC_I	wrpr	%r18, 0x019b, %tpc
	.word 0xb9510000  ! 521: RDPR_TICK	<illegal instruction>
	.word 0xb3e461c5  ! 522: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbde460da  ! 524: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbbe561f4  ! 526: SAVE_I	save	%r21, 0x0001, %r29
hwintr_0_18:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_18), 16, 16)) -> intp(0, 0, 3)
	.word 0xb3e5e17e  ! 531: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb0240000  ! 532: SUB_R	sub 	%r16, %r0, %r24
	.word 0xb5e420b5  ! 537: SAVE_I	save	%r16, 0x0001, %r26
	.word 0x87952087  ! 541: WRPR_TT_I	wrpr	%r20, 0x0087, %tt
	.word 0xbfe4a1a3  ! 545: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb1e521f6  ! 546: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb0b4a038  ! 547: SUBCcc_I	orncc 	%r18, 0x0038, %r24
	.word 0xb7e46143  ! 548: SAVE_I	save	%r17, 0x0001, %r27
hwintr_0_19:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_19), 16, 16)) -> intp(0, 0, 1f)
	.word 0xb9e5e083  ! 557: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb02d6141  ! 558: ANDN_I	andn 	%r21, 0x0141, %r24
	.word 0xbb510000  ! 561: RDPR_TICK	<illegal instruction>
	.word 0xbbe5a0ba  ! 562: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb92c4000  ! 563: SLL_R	sll 	%r17, %r0, %r28
	.word 0xbbe4607e  ! 566: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xbfe52034  ! 567: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb3e420f8  ! 572: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xbbe5e094  ! 574: SAVE_I	save	%r23, 0x0001, %r29
hwintr_0_20:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_20), 16, 16)) -> intp(0, 0, 2d)
	.word 0xb7e5610c  ! 579: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xbf540000  ! 580: RDPR_GL	<illegal instruction>
	mov	1, %r12
	.word 0xa1930000  ! 581: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbfe5e024  ! 586: SAVE_I	save	%r23, 0x0001, %r31
	.word 0x8594a09a  ! 588: WRPR_TSTATE_I	wrpr	%r18, 0x009a, %tstate
	.word 0xb1e4a02e  ! 591: SAVE_I	save	%r18, 0x0001, %r24
	.word 0x8995e13b  ! 592: WRPR_TICK_I	wrpr	%r23, 0x013b, %tick
	setx	data_start_2, %g1, %r20
	.word 0xb7e4201d  ! 594: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xbd51c000  ! 596: RDPR_TL	<illegal instruction>
	.word 0xb7e4a054  ! 597: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb3e5218d  ! 598: SAVE_I	save	%r20, 0x0001, %r25
hwintr_0_21:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_21), 16, 16)) -> intp(0, 0, 3f)
	.word 0xb3e4e115  ! 602: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xbde5e18d  ! 603: SAVE_I	save	%r23, 0x0001, %r30
	.word 0x859521c7  ! 607: WRPR_TSTATE_I	wrpr	%r20, 0x01c7, %tstate
	.word 0x919460b9  ! 611: WRPR_PIL_I	wrpr	%r17, 0x00b9, %pil
hwintr_0_22:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_22), 16, 16)) -> intp(0, 0, 4)
	.word 0xbfe5a066  ! 614: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb9508000  ! 616: RDPR_TSTATE	<illegal instruction>
	.word 0xb9480000  ! 617: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xb9e5a11e  ! 619: SAVE_I	save	%r22, 0x0001, %r28
	.word 0x8794e1bd  ! 621: WRPR_TT_I	wrpr	%r19, 0x01bd, %tt
	.word 0xb7e5e0ac  ! 627: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xbbe4e0f9  ! 629: SAVE_I	save	%r19, 0x0001, %r29
hwintr_0_23:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_23), 16, 16)) -> intp(0, 0, 1d)
	.word 0xb1e4e118  ! 633: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb9e46123  ! 635: SAVE_I	save	%r17, 0x0001, %r28
hwintr_0_24:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_24), 16, 16)) -> intp(0, 0, 1d)
	.word 0xb9e4a0ea  ! 648: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb6354000  ! 651: ORN_R	orn 	%r21, %r0, %r27
	.word 0xbde4e0ce  ! 652: SAVE_I	save	%r19, 0x0001, %r30
	.word 0x87956091  ! 653: WRPR_TT_I	wrpr	%r21, 0x0091, %tt
	.word 0xb1e4e1cc  ! 654: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbfe4e07d  ! 661: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb5e56079  ! 664: SAVE_I	save	%r21, 0x0001, %r26
	setx	0xcc42d73f0000c91d, %g1, %r10
	.word 0x839a8000  ! 665: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb9e4a1da  ! 666: SAVE_I	save	%r18, 0x0001, %r28
	.word 0x8595207e  ! 668: WRPR_TSTATE_I	wrpr	%r20, 0x007e, %tstate
	.word 0xbbe5a0ae  ! 671: SAVE_I	save	%r22, 0x0001, %r29
hwintr_0_25:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_25), 16, 16)) -> intp(0, 0, 3f)
hwintr_0_26:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_26), 16, 16)) -> intp(0, 0, 3c)
	.word 0xbfe4a06c  ! 676: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb7e5e056  ! 678: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb3e460fe  ! 679: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb1e5a004  ! 680: SAVE_I	save	%r22, 0x0001, %r24
	.word 0x85956075  ! 681: WRPR_TSTATE_I	wrpr	%r21, 0x0075, %tstate
	.word 0xbfe560e9  ! 682: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb3e5e06e  ! 684: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xbde4a1c2  ! 687: SAVE_I	save	%r18, 0x0001, %r30
	.word 0xbfe42161  ! 688: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb9e4a02c  ! 689: SAVE_I	save	%r18, 0x0001, %r28
	.word 0x8994e0d8  ! 694: WRPR_TICK_I	wrpr	%r19, 0x00d8, %tick
	.word 0xb9e5214c  ! 695: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb5e560b9  ! 699: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xbde561d9  ! 701: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb1e5208e  ! 705: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb3e4a101  ! 706: SAVE_I	save	%r18, 0x0001, %r25
	setx	data_start_0, %g1, %r23
	mov	0, %r12
	.word 0xa1930000  ! 708: WRPR_GL_R	wrpr	%r12, %r0, %-
	mov	0, %r12
	.word 0x8f930000  ! 711: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbde52048  ! 716: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xbfe520e6  ! 719: SAVE_I	save	%r20, 0x0001, %r31
	setx	0x96265b500006c4d, %g1, %r10
	.word 0x819a8000  ! 725: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb7e461f9  ! 726: SAVE_I	save	%r17, 0x0001, %r27
	mov	1, %r12
	.word 0x8f930000  ! 727: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb9520000  ! 734: RDPR_PIL	<illegal instruction>
	.word 0xb5e5a014  ! 735: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xbde5a13e  ! 737: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb1e560f9  ! 738: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb1e5a1c2  ! 739: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb52d7001  ! 741: SLLX_I	sllx	%r21, 0x0001, %r26
	.word 0xbde460c0  ! 744: SAVE_I	save	%r17, 0x0001, %r30
	.word 0x819420a4  ! 745: WRPR_TPC_I	wrpr	%r16, 0x00a4, %tpc
	.word 0xb1e4216e  ! 746: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb5e560e4  ! 747: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xbfe4e03e  ! 748: SAVE_I	save	%r19, 0x0001, %r31
	.word 0x87952165  ! 749: WRPR_TT_I	wrpr	%r20, 0x0165, %tt
	.word 0xb7e4e0f6  ! 750: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb1480000  ! 751: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xb005e029  ! 754: ADD_I	add 	%r23, 0x0029, %r24
	.word 0xb3e5a010  ! 755: SAVE_I	save	%r22, 0x0001, %r25
	.word 0x89956060  ! 758: WRPR_TICK_I	wrpr	%r21, 0x0060, %tick
	.word 0xbbe460ba  ! 759: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb7e561ba  ! 761: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb9e5607e  ! 763: SAVE_I	save	%r21, 0x0001, %r28
	setx	0xb6f180e00003b80, %g1, %r10
	.word 0x839a8000  ! 765: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x8594212a  ! 768: WRPR_TSTATE_I	wrpr	%r16, 0x012a, %tstate
	.word 0x8595209d  ! 769: WRPR_TSTATE_I	wrpr	%r20, 0x009d, %tstate
	.word 0xbbe5205d  ! 770: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb1e5a0c2  ! 774: SAVE_I	save	%r22, 0x0001, %r24
	.word 0x8994a07a  ! 776: WRPR_TICK_I	wrpr	%r18, 0x007a, %tick
	.word 0x8395e114  ! 779: WRPR_TNPC_I	wrpr	%r23, 0x0114, %tnpc
	.word 0x89942031  ! 782: WRPR_TICK_I	wrpr	%r16, 0x0031, %tick
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0xb9e5e048  ! 787: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb3e5e077  ! 788: SAVE_I	save	%r23, 0x0001, %r25
	setx	data_start_6, %g1, %r22
	mov	1, %r12
	.word 0x8f930000  ! 791: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb17ca401  ! 792: MOVR_I	movre	%r18, 0x1, %r24
	.word 0xb9e56176  ! 793: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xbbe461de  ! 797: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xbde5a0aa  ! 798: SAVE_I	save	%r22, 0x0001, %r30
hwintr_0_27:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_27), 16, 16)) -> intp(0, 0, 21)
	.word 0xb3e5e071  ! 801: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xbde5a07e  ! 807: SAVE_I	save	%r22, 0x0001, %r30
hwintr_0_28:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_28), 16, 16)) -> intp(0, 0, 2c)
	.word 0xbfe5e02d  ! 815: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb1e4a09a  ! 816: SAVE_I	save	%r18, 0x0001, %r24
	.word 0x89952143  ! 821: WRPR_TICK_I	wrpr	%r20, 0x0143, %tick
	.word 0xb6bcc000  ! 822: XNORcc_R	xnorcc 	%r19, %r0, %r27
	.word 0xb1e56076  ! 823: SAVE_I	save	%r21, 0x0001, %r24
	.word 0x859560e5  ! 827: WRPR_TSTATE_I	wrpr	%r21, 0x00e5, %tstate
	setx	data_start_7, %g1, %r20
	.word 0xb9e4e1c5  ! 834: SAVE_I	save	%r19, 0x0001, %r28
	.word 0x8195e1af  ! 838: WRPR_TPC_I	wrpr	%r23, 0x01af, %tpc
	.word 0x83952120  ! 839: WRPR_TNPC_I	wrpr	%r20, 0x0120, %tnpc
	.word 0xb3e5a084  ! 843: SAVE_I	save	%r22, 0x0001, %r25
	.word 0x8395e12d  ! 844: WRPR_TNPC_I	wrpr	%r23, 0x012d, %tnpc
	.word 0x8994e116  ! 845: WRPR_TICK_I	wrpr	%r19, 0x0116, %tick
	.word 0xb3e5a0d2  ! 848: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xbde5a130  ! 850: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb5e5608d  ! 852: SAVE_I	save	%r21, 0x0001, %r26
hwintr_0_29:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_29), 16, 16)) -> intp(0, 0, 8)
	.word 0xb9e5e040  ! 860: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb5e42033  ! 863: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb1e4600b  ! 864: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xbbe46042  ! 867: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb00d8000  ! 878: AND_R	and 	%r22, %r0, %r24
	.word 0xbc1c6138  ! 881: XOR_I	xor 	%r17, 0x0138, %r30
	.word 0xb1500000  ! 882: RDPR_TPC	<illegal instruction>
	.word 0x8594e051  ! 884: WRPR_TSTATE_I	wrpr	%r19, 0x0051, %tstate
hwintr_0_30:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_30), 16, 16)) -> intp(0, 0, 26)
	.word 0xb9e5617d  ! 887: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb3e52088  ! 888: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xbc8da1c7  ! 890: ANDcc_I	andcc 	%r22, 0x01c7, %r30
	mov	2, %r12
	.word 0xa1930000  ! 893: WRPR_GL_R	wrpr	%r12, %r0, %-
hwintr_0_31:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_31), 16, 16)) -> intp(0, 0, c)
	.word 0xbbe4a076  ! 902: SAVE_I	save	%r18, 0x0001, %r29
hwintr_0_32:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_32), 16, 16)) -> intp(0, 0, 1a)
	.word 0xbfe4a1d7  ! 909: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xbf2c7001  ! 913: SLLX_I	sllx	%r17, 0x0001, %r31
	.word 0xb9e5e09e  ! 924: SAVE_I	save	%r23, 0x0001, %r28
hwintr_0_33:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_33), 16, 16)) -> intp(0, 0, 32)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0x8d95a08a  ! 930: WRPR_PSTATE_I	wrpr	%r22, 0x008a, %pstate
	.word 0xb5e5217e  ! 933: SAVE_I	save	%r20, 0x0001, %r26
	setx	0x48ff994f0000bc45, %g1, %r10
	.word 0x819a8000  ! 936: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x87956013  ! 940: WRPR_TT_I	wrpr	%r21, 0x0013, %tt
	.word 0xb351c000  ! 943: RDPR_TL	<illegal instruction>
hwintr_0_34:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_34), 16, 16)) -> intp(0, 0, 8)
	.word 0xb3e46027  ! 946: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb9e5e051  ! 951: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xbbe4a0e6  ! 952: SAVE_I	save	%r18, 0x0001, %r29
	setx	data_start_6, %g1, %r16
	.word 0xb5e5e0d2  ! 954: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xb1e5a05e  ! 955: SAVE_I	save	%r22, 0x0001, %r24
	.word 0x8595a062  ! 959: WRPR_TSTATE_I	wrpr	%r22, 0x0062, %tstate
	.word 0xbde560a9  ! 963: SAVE_I	save	%r21, 0x0001, %r30
	.word 0x8994a0fa  ! 965: WRPR_TICK_I	wrpr	%r18, 0x00fa, %tick
	.word 0xbf50c000  ! 969: RDPR_TT	<illegal instruction>
	.word 0xb5e4609b  ! 970: SAVE_I	save	%r17, 0x0001, %r26
hwintr_0_35:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_35), 16, 16)) -> intp(0, 0, 13)
	.word 0x8d9461de  ! 974: WRPR_PSTATE_I	wrpr	%r17, 0x01de, %pstate
	.word 0xbde521ee  ! 977: SAVE_I	save	%r20, 0x0001, %r30
	mov	2, %r12
	.word 0x8f930000  ! 980: WRPR_TL_R	wrpr	%r12, %r0, %tl
hwintr_0_36:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_36), 16, 16)) -> intp(0, 0, 2f)
	.word 0xb3e561d0  ! 984: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xbc940000  ! 985: ORcc_R	orcc 	%r16, %r0, %r30
hwintr_0_37:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_37), 16, 16)) -> intp(0, 0, 1f)
	.word 0xbfe5a0e3  ! 990: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb3480000  ! 991: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xbfe46072  ! 993: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb1e5e140  ! 994: SAVE_I	save	%r23, 0x0001, %r24
	.word 0x8595213f  ! 998: WRPR_TSTATE_I	wrpr	%r20, 0x013f, %tstate
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
	.word 0xbc1d4000  ! 2: XOR_R	xor 	%r21, %r0, %r30
	.word 0xbd540000  ! 3: RDPR_GL	rdpr	%-, %r30
	.word 0xbb508000  ! 9: RDPR_TSTATE	<illegal instruction>
	.word 0xb5500000  ! 10: RDPR_TPC	<illegal instruction>
	.word 0xbeb44000  ! 11: ORNcc_R	orncc 	%r17, %r0, %r31
	.word 0x85946017  ! 16: WRPR_TSTATE_I	wrpr	%r17, 0x0017, %tstate
	.word 0xb1508000  ! 19: RDPR_TSTATE	rdpr	%tstate, %r24
	.word 0xf8344000  ! 20: STH_R	sth	%r28, [%r17 + %r0]
hwintr_3_0:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_0), 16, 16)) -> intp(3, 0, 7)
	.word 0xfa3de1be  ! 29: STD_I	std	%r29, [%r23 + 0x01be]
	.word 0x8395e096  ! 30: WRPR_TNPC_I	wrpr	%r23, 0x0096, %tnpc
	mov	2, %r12
	.word 0xa1930000  ! 31: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf53c0000  ! 33: STDF_R	std	%f26, [%r0, %r16]
hwintr_3_1:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_1), 16, 16)) -> intp(3, 0, 34)
	.word 0xf23ca096  ! 38: STD_I	std	%r25, [%r18 + 0x0096]
	.word 0xba3460e2  ! 39: SUBC_I	orn 	%r17, 0x00e2, %r29
	.word 0x87942013  ! 40: WRPR_TT_I	wrpr	%r16, 0x0013, %tt
	.word 0xf0254000  ! 41: STW_R	stw	%r24, [%r21 + %r0]
	.word 0xf62c2135  ! 47: STB_I	stb	%r27, [%r16 + 0x0135]
	.word 0xfe25e0bf  ! 48: STW_I	stw	%r31, [%r23 + 0x00bf]
hwintr_3_2:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_2), 16, 16)) -> intp(3, 0, 31)
	.word 0x9194a0c5  ! 54: WRPR_PIL_I	wrpr	%r18, 0x00c5, %pil
hwintr_3_3:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_3), 16, 16)) -> intp(3, 0, 2f)
hwintr_3_4:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_4), 16, 16)) -> intp(3, 0, e)
hwintr_3_5:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_5), 16, 16)) -> intp(3, 0, 0)
	.word 0xf2744000  ! 67: STX_R	stx	%r25, [%r17 + %r0]
	.word 0xbc44c000  ! 68: ADDC_R	addc 	%r19, %r0, %r30
	mov	0, %r12
	.word 0xa1930000  ! 70: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xfe3c6194  ! 72: STD_I	std	%r31, [%r17 + 0x0194]
	.word 0xf874c000  ! 73: STX_R	stx	%r28, [%r19 + %r0]
	.word 0xfe75c000  ! 75: STX_R	stx	%r31, [%r23 + %r0]
	.word 0xf22521c1  ! 77: STW_I	stw	%r25, [%r20 + 0x01c1]
	.word 0xf53d0000  ! 85: STDF_R	std	%f26, [%r0, %r20]
	.word 0xbe24a01a  ! 92: SUB_I	sub 	%r18, 0x001a, %r31
	.word 0xfa340000  ! 93: STH_R	sth	%r29, [%r16 + %r0]
	.word 0xf62560dc  ! 101: STW_I	stw	%r27, [%r21 + 0x00dc]
	.word 0xf63da1c2  ! 105: STD_I	std	%r27, [%r22 + 0x01c2]
	.word 0xfc2c6045  ! 107: STB_I	stb	%r30, [%r17 + 0x0045]
	.word 0xfe3561bf  ! 111: STH_I	sth	%r31, [%r21 + 0x01bf]
	.word 0xfc3c60d0  ! 113: STD_I	std	%r30, [%r17 + 0x00d0]
	.word 0xfc25a107  ! 124: STW_I	stw	%r30, [%r22 + 0x0107]
hwintr_3_6:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_6), 16, 16)) -> intp(3, 0, 30)
	.word 0xfc2c20f6  ! 130: STB_I	stb	%r30, [%r16 + 0x00f6]
	.word 0xbf504000  ! 131: RDPR_TNPC	rdpr	%tnpc, %r31
	.word 0xf63da095  ! 133: STD_I	std	%r27, [%r22 + 0x0095]
	.word 0x8795e1f4  ! 134: WRPR_TT_I	wrpr	%r23, 0x01f4, %tt
	.word 0xb8c56059  ! 137: ADDCcc_I	addccc 	%r21, 0x0059, %r28
	.word 0xf2244000  ! 138: STW_R	stw	%r25, [%r17 + %r0]
	.word 0xb1540000  ! 139: RDPR_GL	rdpr	%-, %r24
	.word 0xf4752139  ! 140: STX_I	stx	%r26, [%r20 + 0x0139]
	.word 0xfc356017  ! 150: STH_I	sth	%r30, [%r21 + 0x0017]
	.word 0xbf2cd000  ! 153: SLLX_R	sllx	%r19, %r0, %r31
hwintr_3_7:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_7), 16, 16)) -> intp(3, 0, 9)
	.word 0xfa3d611b  ! 158: STD_I	std	%r29, [%r21 + 0x011b]
	.word 0xbf510000  ! 159: RDPR_TICK	<illegal instruction>
	.word 0xf6252060  ! 160: STW_I	stw	%r27, [%r20 + 0x0060]
	.word 0xb9540000  ! 162: RDPR_GL	<illegal instruction>
	.word 0x83952056  ! 166: WRPR_TNPC_I	wrpr	%r20, 0x0056, %tnpc
	.word 0xbd7da401  ! 168: MOVR_I	movre	%r22, 0x1, %r30
	.word 0x839421aa  ! 174: WRPR_TNPC_I	wrpr	%r16, 0x01aa, %tnpc
	.word 0xfc750000  ! 175: STX_R	stx	%r30, [%r20 + %r0]
	.word 0xfb3ca05c  ! 177: STDF_I	std	%f29, [0x005c, %r18]
	.word 0xf63d8000  ! 185: STD_R	std	%r27, [%r22 + %r0]
	mov	1, %r12
	.word 0x8f930000  ! 186: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x819421cd  ! 187: WRPR_TPC_I	wrpr	%r16, 0x01cd, %tpc
	.word 0xfe24c000  ! 188: STW_R	stw	%r31, [%r19 + %r0]
	.word 0xf0758000  ! 190: STX_R	stx	%r24, [%r22 + %r0]
	.word 0xbd480000  ! 191: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xb604a0d9  ! 192: ADD_I	add 	%r18, 0x00d9, %r27
	.word 0xbe24a0f5  ! 194: SUB_I	sub 	%r18, 0x00f5, %r31
	.word 0xf73d61e2  ! 197: STDF_I	std	%f27, [0x01e2, %r21]
	.word 0xfa35e181  ! 198: STH_I	sth	%r29, [%r23 + 0x0181]
	.word 0xf675c000  ! 200: STX_R	stx	%r27, [%r23 + %r0]
	.word 0xfd3cc000  ! 203: STDF_R	std	%f30, [%r0, %r19]
	setx	data_start_0, %g1, %r17
	.word 0xfc254000  ! 206: STW_R	stw	%r30, [%r21 + %r0]
	.word 0x8195215d  ! 207: WRPR_TPC_I	wrpr	%r20, 0x015d, %tpc
	setx	data_start_2, %g1, %r21
	.word 0xf53c4000  ! 209: STDF_R	std	%f26, [%r0, %r17]
	.word 0xb884612c  ! 210: ADDcc_I	addcc 	%r17, 0x012c, %r28
	.word 0xba0d4000  ! 211: AND_R	and 	%r21, %r0, %r29
	.word 0xfc2420bf  ! 217: STW_I	stw	%r30, [%r16 + 0x00bf]
	.word 0x9195e166  ! 218: WRPR_PIL_I	wrpr	%r23, 0x0166, %pil
	.word 0xf425a04c  ! 220: STW_I	stw	%r26, [%r22 + 0x004c]
	.word 0xfc25e070  ! 221: STW_I	stw	%r30, [%r23 + 0x0070]
	.word 0x8794600c  ! 226: WRPR_TT_I	wrpr	%r17, 0x000c, %tt
hwintr_3_8:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_8), 16, 16)) -> intp(3, 0, f)
	.word 0x8d94a11e  ! 229: WRPR_PSTATE_I	wrpr	%r18, 0x011e, %pstate
	.word 0xb9480000  ! 238: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xbb3d1000  ! 244: SRAX_R	srax	%r20, %r0, %r29
	.word 0xfe3ce1d1  ! 249: STD_I	std	%r31, [%r19 + 0x01d1]
hwintr_3_9:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_9), 16, 16)) -> intp(3, 0, 3c)
	.word 0xb5504000  ! 254: RDPR_TNPC	<illegal instruction>
hwintr_3_10:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_10), 16, 16)) -> intp(3, 0, 5)
	.word 0xb7480000  ! 257: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xf43d6061  ! 258: STD_I	std	%r26, [%r21 + 0x0061]
	.word 0xf02c4000  ! 259: STB_R	stb	%r24, [%r17 + %r0]
	.word 0xb42d0000  ! 260: ANDN_R	andn 	%r20, %r0, %r26
	.word 0xfc2c2093  ! 264: STB_I	stb	%r30, [%r16 + 0x0093]
	.word 0xf424e08e  ! 265: STW_I	stw	%r26, [%r19 + 0x008e]
	.word 0xf0348000  ! 269: STH_R	sth	%r24, [%r18 + %r0]
	.word 0x859560d4  ! 270: WRPR_TSTATE_I	wrpr	%r21, 0x00d4, %tstate
	.word 0xbf540000  ! 271: RDPR_GL	rdpr	%-, %r31
hwintr_3_11:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_11), 16, 16)) -> intp(3, 0, 4)
	.word 0xfe250000  ! 292: STW_R	stw	%r31, [%r20 + %r0]
	.word 0xb1480000  ! 296: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xbf540000  ! 297: RDPR_GL	<illegal instruction>
hwintr_3_12:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_12), 16, 16)) -> intp(3, 0, 15)
	.word 0xf4254000  ! 302: STW_R	stw	%r26, [%r21 + %r0]
	.word 0xfc24a0be  ! 307: STW_I	stw	%r30, [%r18 + 0x00be]
	.word 0xf22d4000  ! 308: STB_R	stb	%r25, [%r21 + %r0]
hwintr_3_13:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_13), 16, 16)) -> intp(3, 0, 33)
	.word 0xf625e17d  ! 317: STW_I	stw	%r27, [%r23 + 0x017d]
	.word 0xf0340000  ! 319: STH_R	sth	%r24, [%r16 + %r0]
	.word 0x8594a0bf  ! 320: WRPR_TSTATE_I	wrpr	%r18, 0x00bf, %tstate
	.word 0xbc8da1f3  ! 325: ANDcc_I	andcc 	%r22, 0x01f3, %r30
	.word 0xf635e163  ! 326: STH_I	sth	%r27, [%r23 + 0x0163]
	.word 0xb3504000  ! 331: RDPR_TNPC	rdpr	%tnpc, %r25
	.word 0xb150c000  ! 342: RDPR_TT	<illegal instruction>
	.word 0xf275c000  ! 344: STX_R	stx	%r25, [%r23 + %r0]
	.word 0xfa754000  ! 345: STX_R	stx	%r29, [%r21 + %r0]
	.word 0xbc350000  ! 347: SUBC_R	orn 	%r20, %r0, %r30
	.word 0xfa350000  ! 348: STH_R	sth	%r29, [%r20 + %r0]
	.word 0xf824202f  ! 354: STW_I	stw	%r28, [%r16 + 0x002f]
	.word 0xf4740000  ! 357: STX_R	stx	%r26, [%r16 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	data_start_4, %g1, %r16
	.word 0xf4248000  ! 363: STW_R	stw	%r26, [%r18 + %r0]
	.word 0x8995a171  ! 364: WRPR_TICK_I	wrpr	%r22, 0x0171, %tick
	.word 0xf43c4000  ! 365: STD_R	std	%r26, [%r17 + %r0]
	.word 0xfa34219f  ! 367: STH_I	sth	%r29, [%r16 + 0x019f]
	.word 0xf225c000  ! 370: STW_R	stw	%r25, [%r23 + %r0]
	.word 0xbcbce194  ! 378: XNORcc_I	xnorcc 	%r19, 0x0194, %r30
	.word 0xb750c000  ! 380: RDPR_TT	rdpr	%tt, %r27
	.word 0xf42c60bf  ! 384: STB_I	stb	%r26, [%r17 + 0x00bf]
	.word 0xfa3d8000  ! 385: STD_R	std	%r29, [%r22 + %r0]
hwintr_3_14:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_14), 16, 16)) -> intp(3, 0, 28)
	.word 0xbd508000  ! 391: RDPR_TSTATE	<illegal instruction>
	.word 0xb1520000  ! 392: RDPR_PIL	<illegal instruction>
	mov	0, %r12
	.word 0xa1930000  ! 393: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xfe248000  ! 396: STW_R	stw	%r31, [%r18 + %r0]
	.word 0xfb3c4000  ! 397: STDF_R	std	%f29, [%r0, %r17]
	.word 0xbd518000  ! 398: RDPR_PSTATE	rdpr	%pstate, %r30
	.word 0xfe758000  ! 399: STX_R	stx	%r31, [%r22 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	mov	0, %r12
	.word 0x8f930000  ! 407: WRPR_TL_R	wrpr	%r12, %r0, %tl
	setx	data_start_6, %g1, %r23
	.word 0xb604e1e6  ! 411: ADD_I	add 	%r19, 0x01e6, %r27
	.word 0xf674c000  ! 413: STX_R	stx	%r27, [%r19 + %r0]
	.word 0xf13d600c  ! 414: STDF_I	std	%f24, [0x000c, %r21]
	.word 0xbf50c000  ! 418: RDPR_TT	rdpr	%tt, %r31
	.word 0xf2254000  ! 419: STW_R	stw	%r25, [%r21 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
hwintr_3_15:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_15), 16, 16)) -> intp(3, 0, 13)
	.word 0x8194e000  ! 427: WRPR_TPC_I	wrpr	%r19, 0x0000, %tpc
	.word 0xbb500000  ! 428: RDPR_TPC	rdpr	%tpc, %r29
	.word 0xbf50c000  ! 431: RDPR_TT	<illegal instruction>
	.word 0xbd518000  ! 432: RDPR_PSTATE	<illegal instruction>
	.word 0xf874213c  ! 433: STX_I	stx	%r28, [%r16 + 0x013c]
	.word 0xb57c2401  ! 439: MOVR_I	movre	%r16, 0x1, %r26
	.word 0xb8258000  ! 443: SUB_R	sub 	%r22, %r0, %r28
hwintr_3_16:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_16), 16, 16)) -> intp(3, 0, 3f)
	.word 0xb5354000  ! 449: SRL_R	srl 	%r21, %r0, %r26
	.word 0xfa356079  ! 450: STH_I	sth	%r29, [%r21 + 0x0079]
	.word 0xf73d2127  ! 457: STDF_I	std	%f27, [0x0127, %r20]
	.word 0xb3500000  ! 461: RDPR_TPC	<illegal instruction>
	.word 0xf4744000  ! 465: STX_R	stx	%r26, [%r17 + %r0]
	.word 0xf2350000  ! 467: STH_R	sth	%r25, [%r20 + %r0]
	.word 0xb750c000  ! 468: RDPR_TT	<illegal instruction>
	.word 0xb3480000  ! 472: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xfc2d6157  ! 475: STB_I	stb	%r30, [%r21 + 0x0157]
hwintr_3_17:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_17), 16, 16)) -> intp(3, 0, 4)
	.word 0x8594a1a8  ! 480: WRPR_TSTATE_I	wrpr	%r18, 0x01a8, %tstate
	setx	data_start_5, %g1, %r23
	.word 0xf4248000  ! 484: STW_R	stw	%r26, [%r18 + %r0]
	.word 0xfc3cc000  ! 485: STD_R	std	%r30, [%r19 + %r0]
	.word 0xb551c000  ! 487: RDPR_TL	rdpr	%tl, %r26
	.word 0xfe2d8000  ! 489: STB_R	stb	%r31, [%r22 + %r0]
	.word 0x8194e1fe  ! 491: WRPR_TPC_I	wrpr	%r19, 0x01fe, %tpc
	setx	data_start_6, %g1, %r21
	.word 0xf83d6008  ! 495: STD_I	std	%r28, [%r21 + 0x0008]
	mov	2, %r12
	.word 0xa1930000  ! 498: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbf7d4400  ! 499: MOVR_R	movre	%r21, %r0, %r31
	.word 0xb7518000  ! 500: RDPR_PSTATE	rdpr	%pstate, %r27
	.word 0xf8748000  ! 502: STX_R	stx	%r28, [%r18 + %r0]
	.word 0xf634609c  ! 509: STH_I	sth	%r27, [%r17 + 0x009c]
	.word 0xfe34a1bc  ! 510: STH_I	sth	%r31, [%r18 + 0x01bc]
	.word 0xf6250000  ! 515: STW_R	stw	%r27, [%r20 + %r0]
	.word 0x819560a3  ! 520: WRPR_TPC_I	wrpr	%r21, 0x00a3, %tpc
	.word 0xb7510000  ! 521: RDPR_TICK	rdpr	%tick, %r27
hwintr_3_18:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_18), 16, 16)) -> intp(3, 0, 21)
	.word 0xb8248000  ! 532: SUB_R	sub 	%r18, %r0, %r28
	.word 0xf82d4000  ! 534: STB_R	stb	%r28, [%r21 + %r0]
	.word 0xfc2c8000  ! 538: STB_R	stb	%r30, [%r18 + %r0]
	.word 0xfa740000  ! 540: STX_R	stx	%r29, [%r16 + %r0]
	.word 0x87946116  ! 541: WRPR_TT_I	wrpr	%r17, 0x0116, %tt
	.word 0xf435e02e  ! 542: STH_I	sth	%r26, [%r23 + 0x002e]
	.word 0xf83dc000  ! 543: STD_R	std	%r28, [%r23 + %r0]
	.word 0xb6b4e119  ! 547: SUBCcc_I	orncc 	%r19, 0x0119, %r27
hwintr_3_19:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_19), 16, 16)) -> intp(3, 0, 3)
	.word 0xfe7461a8  ! 553: STX_I	stx	%r31, [%r17 + 0x01a8]
	.word 0xb02c2113  ! 558: ANDN_I	andn 	%r16, 0x0113, %r24
	.word 0xb9510000  ! 561: RDPR_TICK	rdpr	%tick, %r28
	.word 0xb52d8000  ! 563: SLL_R	sll 	%r22, %r0, %r26
	.word 0xf834e1a0  ! 564: STH_I	sth	%r28, [%r19 + 0x01a0]
	.word 0xf224a046  ! 573: STW_I	stw	%r25, [%r18 + 0x0046]
hwintr_3_20:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_20), 16, 16)) -> intp(3, 0, 12)
	.word 0xf43cc000  ! 577: STD_R	std	%r26, [%r19 + %r0]
	.word 0xf33da021  ! 578: STDF_I	std	%f25, [0x0021, %r22]
	.word 0xbd540000  ! 580: RDPR_GL	<illegal instruction>
	mov	0, %r12
	.word 0xa1930000  ! 581: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf6752171  ! 582: STX_I	stx	%r27, [%r20 + 0x0171]
	.word 0xf02cc000  ! 585: STB_R	stb	%r24, [%r19 + %r0]
	.word 0xf02d4000  ! 587: STB_R	stb	%r24, [%r21 + %r0]
	.word 0x8594a1fc  ! 588: WRPR_TSTATE_I	wrpr	%r18, 0x01fc, %tstate
	.word 0x89952149  ! 592: WRPR_TICK_I	wrpr	%r20, 0x0149, %tick
	setx	data_start_5, %g1, %r22
	.word 0xbf51c000  ! 596: RDPR_TL	rdpr	%tl, %r31
hwintr_3_21:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_21), 16, 16)) -> intp(3, 0, 15)
	.word 0xf43de11d  ! 606: STD_I	std	%r26, [%r23 + 0x011d]
	.word 0x8595a030  ! 607: WRPR_TSTATE_I	wrpr	%r22, 0x0030, %tstate
	.word 0x919521fd  ! 611: WRPR_PIL_I	wrpr	%r20, 0x01fd, %pil
hwintr_3_22:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_22), 16, 16)) -> intp(3, 0, 8)
	.word 0xbf508000  ! 616: RDPR_TSTATE	rdpr	%tstate, %r31
	.word 0xb9480000  ! 617: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xfc25214c  ! 618: STW_I	stw	%r30, [%r20 + 0x014c]
	.word 0x8794e035  ! 621: WRPR_TT_I	wrpr	%r19, 0x0035, %tt
hwintr_3_23:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_23), 16, 16)) -> intp(3, 0, 33)
hwintr_3_24:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_24), 16, 16)) -> intp(3, 0, 29)
	.word 0xfc3c8000  ! 639: STD_R	std	%r30, [%r18 + %r0]
	.word 0xf4358000  ! 641: STH_R	sth	%r26, [%r22 + %r0]
	.word 0xf03cc000  ! 645: STD_R	std	%r24, [%r19 + %r0]
	.word 0xfe2c20c8  ! 647: STB_I	stb	%r31, [%r16 + 0x00c8]
	.word 0xf0240000  ! 649: STW_R	stw	%r24, [%r16 + %r0]
	.word 0xbe348000  ! 651: ORN_R	orn 	%r18, %r0, %r31
	.word 0x8795a032  ! 653: WRPR_TT_I	wrpr	%r22, 0x0032, %tt
	.word 0xf23c8000  ! 657: STD_R	std	%r25, [%r18 + %r0]
	.word 0xf43c0000  ! 660: STD_R	std	%r26, [%r16 + %r0]
	.word 0xf2256020  ! 662: STW_I	stw	%r25, [%r21 + 0x0020]
	setx	0xfc7fdab90000989f, %g1, %r10
	.word 0x839a8000  ! 665: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf234a021  ! 667: STH_I	sth	%r25, [%r18 + 0x0021]
	.word 0x8595a1c2  ! 668: WRPR_TSTATE_I	wrpr	%r22, 0x01c2, %tstate
	.word 0xf53cc000  ! 669: STDF_R	std	%f26, [%r0, %r19]
hwintr_3_25:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_25), 16, 16)) -> intp(3, 0, f)
	.word 0xfa754000  ! 673: STX_R	stx	%r29, [%r21 + %r0]
	.word 0xfe24c000  ! 674: STW_R	stw	%r31, [%r19 + %r0]
hwintr_3_26:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_26), 16, 16)) -> intp(3, 0, 19)
	.word 0xf42d0000  ! 677: STB_R	stb	%r26, [%r20 + %r0]
	.word 0x8595e184  ! 681: WRPR_TSTATE_I	wrpr	%r23, 0x0184, %tstate
	.word 0xfa2dc000  ! 683: STB_R	stb	%r29, [%r23 + %r0]
	.word 0xf63ca185  ! 685: STD_I	std	%r27, [%r18 + 0x0185]
	.word 0xfa240000  ! 690: STW_R	stw	%r29, [%r16 + %r0]
	.word 0xf42d6045  ! 691: STB_I	stb	%r26, [%r21 + 0x0045]
	.word 0x8995a18e  ! 694: WRPR_TICK_I	wrpr	%r22, 0x018e, %tick
	.word 0xfc3d4000  ! 697: STD_R	std	%r30, [%r21 + %r0]
	.word 0xf62c4000  ! 700: STB_R	stb	%r27, [%r17 + %r0]
	.word 0xf2748000  ! 703: STX_R	stx	%r25, [%r18 + %r0]
	setx	data_start_4, %g1, %r21
	mov	1, %r12
	.word 0xa1930000  ! 708: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf4246134  ! 709: STW_I	stw	%r26, [%r17 + 0x0134]
	mov	1, %r12
	.word 0x8f930000  ! 711: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf93de028  ! 714: STDF_I	std	%f28, [0x0028, %r23]
	.word 0xf875a139  ! 715: STX_I	stx	%r28, [%r22 + 0x0139]
	.word 0xfa3c61f5  ! 718: STD_I	std	%r29, [%r17 + 0x01f5]
	.word 0xf8358000  ! 722: STH_R	sth	%r28, [%r22 + %r0]
	.word 0xf93d8000  ! 723: STDF_R	std	%f28, [%r0, %r22]
	setx	0xdca50b8800007f94, %g1, %r10
	.word 0x819a8000  ! 725: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	mov	1, %r12
	.word 0x8f930000  ! 727: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf63460d3  ! 729: STH_I	sth	%r27, [%r17 + 0x00d3]
	.word 0xb5520000  ! 734: RDPR_PIL	rdpr	%pil, %r26
	.word 0xf83c607c  ! 736: STD_I	std	%r28, [%r17 + 0x007c]
	.word 0xbf2c7001  ! 741: SLLX_I	sllx	%r17, 0x0001, %r31
	.word 0xf03ca0c5  ! 742: STD_I	std	%r24, [%r18 + 0x00c5]
	.word 0xf0350000  ! 743: STH_R	sth	%r24, [%r20 + %r0]
	.word 0x8194210f  ! 745: WRPR_TPC_I	wrpr	%r16, 0x010f, %tpc
	.word 0x879420c6  ! 749: WRPR_TT_I	wrpr	%r16, 0x00c6, %tt
	.word 0xb3480000  ! 751: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xf4350000  ! 752: STH_R	sth	%r26, [%r20 + %r0]
	.word 0xb005600b  ! 754: ADD_I	add 	%r21, 0x000b, %r24
	.word 0x8994a1bb  ! 758: WRPR_TICK_I	wrpr	%r18, 0x01bb, %tick
	.word 0xf33d4000  ! 760: STDF_R	std	%f25, [%r0, %r21]
	.word 0xf224219b  ! 764: STW_I	stw	%r25, [%r16 + 0x019b]
	setx	0x74b77f7d00007fd4, %g1, %r10
	.word 0x839a8000  ! 765: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf83d20b2  ! 766: STD_I	std	%r28, [%r20 + 0x00b2]
	.word 0xfa35c000  ! 767: STH_R	sth	%r29, [%r23 + %r0]
	.word 0x8595a1ba  ! 768: WRPR_TSTATE_I	wrpr	%r22, 0x01ba, %tstate
	.word 0x85952133  ! 769: WRPR_TSTATE_I	wrpr	%r20, 0x0133, %tstate
	.word 0x8995e092  ! 776: WRPR_TICK_I	wrpr	%r23, 0x0092, %tick
	.word 0xfc340000  ! 777: STH_R	sth	%r30, [%r16 + %r0]
	.word 0x839420e0  ! 779: WRPR_TNPC_I	wrpr	%r16, 0x00e0, %tnpc
	.word 0xfc750000  ! 780: STX_R	stx	%r30, [%r20 + %r0]
	.word 0x899420f6  ! 782: WRPR_TICK_I	wrpr	%r16, 0x00f6, %tick
	.word 0xf23da02f  ! 783: STD_I	std	%r25, [%r22 + 0x002f]
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	setx	data_start_7, %g1, %r21
	mov	0, %r12
	.word 0x8f930000  ! 791: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbd7de401  ! 792: MOVR_I	movre	%r23, 0x1, %r30
	.word 0xf6258000  ! 794: STW_R	stw	%r27, [%r22 + %r0]
	.word 0xf6240000  ! 795: STW_R	stw	%r27, [%r16 + %r0]
hwintr_3_27:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_27), 16, 16)) -> intp(3, 0, 23)
	.word 0xfa3dc000  ! 804: STD_R	std	%r29, [%r23 + %r0]
	.word 0xf03da19a  ! 808: STD_I	std	%r24, [%r22 + 0x019a]
hwintr_3_28:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_28), 16, 16)) -> intp(3, 0, 10)
	.word 0xff3d0000  ! 811: STDF_R	std	%f31, [%r0, %r20]
	.word 0xf82d6158  ! 813: STB_I	stb	%r28, [%r21 + 0x0158]
	.word 0xf225c000  ! 817: STW_R	stw	%r25, [%r23 + %r0]
	.word 0xf624c000  ! 820: STW_R	stw	%r27, [%r19 + %r0]
	.word 0x89942012  ! 821: WRPR_TICK_I	wrpr	%r16, 0x0012, %tick
	.word 0xbcbc4000  ! 822: XNORcc_R	xnorcc 	%r17, %r0, %r30
	.word 0xff3c8000  ! 824: STDF_R	std	%f31, [%r0, %r18]
	.word 0x85946006  ! 827: WRPR_TSTATE_I	wrpr	%r17, 0x0006, %tstate
	setx	data_start_0, %g1, %r18
	.word 0xf634214e  ! 830: STH_I	sth	%r27, [%r16 + 0x014e]
	.word 0xf93c4000  ! 831: STDF_R	std	%f28, [%r0, %r17]
	.word 0x819561a1  ! 838: WRPR_TPC_I	wrpr	%r21, 0x01a1, %tpc
	.word 0x8395e15e  ! 839: WRPR_TNPC_I	wrpr	%r23, 0x015e, %tnpc
	.word 0xf42c210b  ! 841: STB_I	stb	%r26, [%r16 + 0x010b]
	.word 0x8395e0b1  ! 844: WRPR_TNPC_I	wrpr	%r23, 0x00b1, %tnpc
	.word 0x8994e132  ! 845: WRPR_TICK_I	wrpr	%r19, 0x0132, %tick
	.word 0xf93d600e  ! 847: STDF_I	std	%f28, [0x000e, %r21]
	.word 0xff3da186  ! 851: STDF_I	std	%f31, [0x0186, %r22]
hwintr_3_29:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_29), 16, 16)) -> intp(3, 0, 38)
	.word 0xf674c000  ! 858: STX_R	stx	%r27, [%r19 + %r0]
	.word 0xf4250000  ! 862: STW_R	stw	%r26, [%r20 + %r0]
	.word 0xfc2c6120  ! 870: STB_I	stb	%r30, [%r17 + 0x0120]
	.word 0xfc24e0f2  ! 871: STW_I	stw	%r30, [%r19 + 0x00f2]
	.word 0xff3de157  ! 875: STDF_I	std	%f31, [0x0157, %r23]
	.word 0xb00d8000  ! 878: AND_R	and 	%r22, %r0, %r24
	.word 0xf82d6176  ! 880: STB_I	stb	%r28, [%r21 + 0x0176]
	.word 0xbe1d60f6  ! 881: XOR_I	xor 	%r21, 0x00f6, %r31
	.word 0xbf500000  ! 882: RDPR_TPC	rdpr	%tpc, %r31
	.word 0xfc3d4000  ! 883: STD_R	std	%r30, [%r21 + %r0]
	.word 0x8594e061  ! 884: WRPR_TSTATE_I	wrpr	%r19, 0x0061, %tstate
hwintr_3_30:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_30), 16, 16)) -> intp(3, 0, 10)
	.word 0xf235e15f  ! 886: STH_I	sth	%r25, [%r23 + 0x015f]
	.word 0xb88d203a  ! 890: ANDcc_I	andcc 	%r20, 0x003a, %r28
	.word 0xfa750000  ! 891: STX_R	stx	%r29, [%r20 + %r0]
	mov	2, %r12
	.word 0xa1930000  ! 893: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf8748000  ! 894: STX_R	stx	%r28, [%r18 + %r0]
	.word 0xf43ce1ee  ! 895: STD_I	std	%r26, [%r19 + 0x01ee]
	.word 0xfe2d6151  ! 896: STB_I	stb	%r31, [%r21 + 0x0151]
hwintr_3_31:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_31), 16, 16)) -> intp(3, 0, 3f)
	.word 0xf22ca1ef  ! 901: STB_I	stb	%r25, [%r18 + 0x01ef]
	.word 0xf424c000  ! 904: STW_R	stw	%r26, [%r19 + %r0]
hwintr_3_32:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_32), 16, 16)) -> intp(3, 0, 24)
	.word 0xbb2cb001  ! 913: SLLX_I	sllx	%r18, 0x0001, %r29
	.word 0xf235a1be  ! 918: STH_I	sth	%r25, [%r22 + 0x01be]
	.word 0xf2344000  ! 919: STH_R	sth	%r25, [%r17 + %r0]
	.word 0xf62c4000  ! 920: STB_R	stb	%r27, [%r17 + %r0]
	.word 0xf22dc000  ! 921: STB_R	stb	%r25, [%r23 + %r0]
hwintr_3_33:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_33), 16, 16)) -> intp(3, 0, 1)
	.word 0xfa25a1a4  ! 927: STW_I	stw	%r29, [%r22 + 0x01a4]
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0x8d9561f7  ! 930: WRPR_PSTATE_I	wrpr	%r21, 0x01f7, %pstate
	.word 0xf0750000  ! 935: STX_R	stx	%r24, [%r20 + %r0]
	setx	0xbb229fb70000699f, %g1, %r10
	.word 0x819a8000  ! 936: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf62d2053  ! 939: STB_I	stb	%r27, [%r20 + 0x0053]
	.word 0x8795a1c8  ! 940: WRPR_TT_I	wrpr	%r22, 0x01c8, %tt
	.word 0xb551c000  ! 943: RDPR_TL	rdpr	%tl, %r26
	.word 0xf6748000  ! 944: STX_R	stx	%r27, [%r18 + %r0]
hwintr_3_34:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_34), 16, 16)) -> intp(3, 0, 30)
	setx	data_start_3, %g1, %r17
	.word 0x8595607b  ! 959: WRPR_TSTATE_I	wrpr	%r21, 0x007b, %tstate
	.word 0xfa254000  ! 961: STW_R	stw	%r29, [%r21 + %r0]
	.word 0x89942194  ! 965: WRPR_TICK_I	wrpr	%r16, 0x0194, %tick
	.word 0xf83d0000  ! 967: STD_R	std	%r28, [%r20 + %r0]
	.word 0xb150c000  ! 969: RDPR_TT	rdpr	%tt, %r24
hwintr_3_35:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_35), 16, 16)) -> intp(3, 0, 1f)
	.word 0x8d95a036  ! 974: WRPR_PSTATE_I	wrpr	%r22, 0x0036, %pstate
	.word 0xf23d0000  ! 979: STD_R	std	%r25, [%r20 + %r0]
	mov	2, %r12
	.word 0x8f930000  ! 980: WRPR_TL_R	wrpr	%r12, %r0, %tl
hwintr_3_36:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_36), 16, 16)) -> intp(3, 0, 38)
	.word 0xf82d4000  ! 982: STB_R	stb	%r28, [%r21 + %r0]
	.word 0xbe95c000  ! 985: ORcc_R	orcc 	%r23, %r0, %r31
	.word 0xf6354000  ! 986: STH_R	sth	%r27, [%r21 + %r0]
	.word 0xf03ce13a  ! 987: STD_I	std	%r24, [%r19 + 0x013a]
hwintr_3_37:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_37), 16, 16)) -> intp(3, 0, 3)
	.word 0xb5480000  ! 991: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xf53ce0b6  ! 995: STDF_I	std	%f26, [0x00b6, %r19]
	.word 0x8595617d  ! 998: WRPR_TSTATE_I	wrpr	%r21, 0x017d, %tstate
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
	.word 0xbc1c8000  ! 2: XOR_R	xor 	%r18, %r0, %r30
	.word 0xbb540000  ! 3: RDPR_GL	<illegal instruction>
	.word 0xb3508000  ! 9: RDPR_TSTATE	<illegal instruction>
	.word 0xb7500000  ! 10: RDPR_TPC	<illegal instruction>
	.word 0xbab40000  ! 11: ORNcc_R	orncc 	%r16, %r0, %r29
	.word 0xf4148000  ! 14: LDUH_R	lduh	[%r18 + %r0], %r26
	.word 0x85956176  ! 16: WRPR_TSTATE_I	wrpr	%r21, 0x0176, %tstate
	.word 0xb5508000  ! 19: RDPR_TSTATE	<illegal instruction>
hwintr_2_0:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_0), 16, 16)) -> intp(2, 0, 3f)
	.word 0xfc0ce12b  ! 23: LDUB_I	ldub	[%r19 + 0x012b], %r30
	.word 0xfc05e1d0  ! 26: LDUW_I	lduw	[%r23 + 0x01d0], %r30
	.word 0xf8058000  ! 28: LDUW_R	lduw	[%r22 + %r0], %r28
	.word 0x83942085  ! 30: WRPR_TNPC_I	wrpr	%r16, 0x0085, %tnpc
	mov	0, %r12
	.word 0xa1930000  ! 31: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf41c611a  ! 32: LDD_I	ldd	[%r17 + 0x011a], %r26
	.word 0xf51c6171  ! 34: LDDF_I	ldd	[%r17, 0x0171], %f26
hwintr_2_1:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_1), 16, 16)) -> intp(2, 0, 27)
	.word 0xfc1d8000  ! 37: LDD_R	ldd	[%r22 + %r0], %r30
	.word 0xbe342079  ! 39: SUBC_I	orn 	%r16, 0x0079, %r31
	.word 0x87946034  ! 40: WRPR_TT_I	wrpr	%r17, 0x0034, %tt
	.word 0xf25c0000  ! 42: LDX_R	ldx	[%r16 + %r0], %r25
hwintr_2_2:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_2), 16, 16)) -> intp(2, 0, 1)
	.word 0xf244a121  ! 50: LDSW_I	ldsw	[%r18 + 0x0121], %r25
	.word 0xfa542030  ! 51: LDSH_I	ldsh	[%r16 + 0x0030], %r29
	.word 0x9195a0e4  ! 54: WRPR_PIL_I	wrpr	%r22, 0x00e4, %pil
	.word 0xfa04a003  ! 60: LDUW_I	lduw	[%r18 + 0x0003], %r29
hwintr_2_3:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_3), 16, 16)) -> intp(2, 0, 31)
hwintr_2_4:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_4), 16, 16)) -> intp(2, 0, 9)
hwintr_2_5:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_5), 16, 16)) -> intp(2, 0, 19)
	.word 0xb0454000  ! 68: ADDC_R	addc 	%r21, %r0, %r24
	.word 0xff1c20c9  ! 69: LDDF_I	ldd	[%r16, 0x00c9], %f31
	mov	0, %r12
	.word 0xa1930000  ! 70: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xfe15215c  ! 71: LDUH_I	lduh	[%r20 + 0x015c], %r31
	.word 0xf8448000  ! 74: LDSW_R	ldsw	[%r18 + %r0], %r28
	.word 0xfc152171  ! 81: LDUH_I	lduh	[%r20 + 0x0171], %r30
	.word 0xf04d8000  ! 86: LDSB_R	ldsb	[%r22 + %r0], %r24
	.word 0xf0450000  ! 88: LDSW_R	ldsw	[%r20 + %r0], %r24
	.word 0xfc1c8000  ! 91: LDD_R	ldd	[%r18 + %r0], %r30
	.word 0xb825201d  ! 92: SUB_I	sub 	%r20, 0x001d, %r28
	.word 0xf44d4000  ! 95: LDSB_R	ldsb	[%r21 + %r0], %r26
	.word 0xf2154000  ! 97: LDUH_R	lduh	[%r21 + %r0], %r25
	.word 0xf0458000  ! 98: LDSW_R	ldsw	[%r22 + %r0], %r24
	.word 0xf31da100  ! 99: LDDF_I	ldd	[%r22, 0x0100], %f25
	.word 0xf4542023  ! 102: LDSH_I	ldsh	[%r16 + 0x0023], %r26
	.word 0xf04ca1d5  ! 103: LDSB_I	ldsb	[%r18 + 0x01d5], %r24
	.word 0xfb1d6041  ! 104: LDDF_I	ldd	[%r21, 0x0041], %f29
	.word 0xfe15c000  ! 118: LDUH_R	lduh	[%r23 + %r0], %r31
	.word 0xfa1dc000  ! 120: LDD_R	ldd	[%r23 + %r0], %r29
	.word 0xfa0da035  ! 121: LDUB_I	ldub	[%r22 + 0x0035], %r29
	.word 0xf91c203f  ! 125: LDDF_I	ldd	[%r16, 0x003f], %f28
	.word 0xf41d21a5  ! 126: LDD_I	ldd	[%r20 + 0x01a5], %r26
	.word 0xf60d8000  ! 127: LDUB_R	ldub	[%r22 + %r0], %r27
hwintr_2_6:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_6), 16, 16)) -> intp(2, 0, 2c)
	.word 0xbd504000  ! 131: RDPR_TNPC	rdpr	%tnpc, %r30
	.word 0x87946105  ! 134: WRPR_TT_I	wrpr	%r17, 0x0105, %tt
	.word 0xb4c5600c  ! 137: ADDCcc_I	addccc 	%r21, 0x000c, %r26
	.word 0xb7540000  ! 139: RDPR_GL	<illegal instruction>
	.word 0xf04d6062  ! 147: LDSB_I	ldsb	[%r21 + 0x0062], %r24
	.word 0xf40d0000  ! 151: LDUB_R	ldub	[%r20 + %r0], %r26
	.word 0xb92c9000  ! 153: SLLX_R	sllx	%r18, %r0, %r28
hwintr_2_7:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_7), 16, 16)) -> intp(2, 0, 7)
	.word 0xf2150000  ! 155: LDUH_R	lduh	[%r20 + %r0], %r25
	.word 0xf444e1b5  ! 156: LDSW_I	ldsw	[%r19 + 0x01b5], %r26
	.word 0xbf510000  ! 159: RDPR_TICK	<illegal instruction>
	.word 0xbf540000  ! 162: RDPR_GL	<illegal instruction>
	.word 0xf2142150  ! 163: LDUH_I	lduh	[%r16 + 0x0150], %r25
	.word 0x83952101  ! 166: WRPR_TNPC_I	wrpr	%r20, 0x0101, %tnpc
	.word 0xfe1c61d3  ! 167: LDD_I	ldd	[%r17 + 0x01d3], %r31
	.word 0xb37c2401  ! 168: MOVR_I	movre	%r16, 0x1, %r25
	.word 0xfa0dc000  ! 173: LDUB_R	ldub	[%r23 + %r0], %r29
	.word 0x8395a007  ! 174: WRPR_TNPC_I	wrpr	%r22, 0x0007, %tnpc
	.word 0xf40d2112  ! 176: LDUB_I	ldub	[%r20 + 0x0112], %r26
	.word 0xf64ce0c4  ! 178: LDSB_I	ldsb	[%r19 + 0x00c4], %r27
	.word 0xfc140000  ! 181: LDUH_R	lduh	[%r16 + %r0], %r30
	mov	0, %r12
	.word 0x8f930000  ! 186: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x8194e107  ! 187: WRPR_TPC_I	wrpr	%r19, 0x0107, %tpc
	.word 0xb3480000  ! 191: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xb804a08d  ! 192: ADD_I	add 	%r18, 0x008d, %r28
	.word 0xbc2420ed  ! 194: SUB_I	sub 	%r16, 0x00ed, %r30
	.word 0xfa0c0000  ! 195: LDUB_R	ldub	[%r16 + %r0], %r29
	.word 0xfa1ce10a  ! 196: LDD_I	ldd	[%r19 + 0x010a], %r29
	.word 0xf8046104  ! 201: LDUW_I	lduw	[%r17 + 0x0104], %r28
	setx	data_start_4, %g1, %r20
	.word 0x8195e183  ! 207: WRPR_TPC_I	wrpr	%r23, 0x0183, %tpc
	setx	data_start_7, %g1, %r21
	.word 0xbc84e1a1  ! 210: ADDcc_I	addcc 	%r19, 0x01a1, %r30
	.word 0xb20d4000  ! 211: AND_R	and 	%r21, %r0, %r25
	.word 0xf04c6125  ! 212: LDSB_I	ldsb	[%r17 + 0x0125], %r24
	.word 0x91956139  ! 218: WRPR_PIL_I	wrpr	%r21, 0x0139, %pil
	.word 0xfa0d2040  ! 222: LDUB_I	ldub	[%r20 + 0x0040], %r29
	.word 0xf60cc000  ! 223: LDUB_R	ldub	[%r19 + %r0], %r27
	.word 0xfa4d60f1  ! 225: LDSB_I	ldsb	[%r21 + 0x00f1], %r29
	.word 0x87942095  ! 226: WRPR_TT_I	wrpr	%r16, 0x0095, %tt
hwintr_2_8:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_8), 16, 16)) -> intp(2, 0, 2b)
	.word 0x8d94217a  ! 229: WRPR_PSTATE_I	wrpr	%r16, 0x017a, %pstate
	.word 0xf01d8000  ! 230: LDD_R	ldd	[%r22 + %r0], %r24
	.word 0xfa5d6149  ! 232: LDX_I	ldx	[%r21 + 0x0149], %r29
	.word 0xfe0ce0e0  ! 235: LDUB_I	ldub	[%r19 + 0x00e0], %r31
	.word 0xfc1dc000  ! 237: LDD_R	ldd	[%r23 + %r0], %r30
	.word 0xbf480000  ! 238: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xfc050000  ! 241: LDUW_R	lduw	[%r20 + %r0], %r30
	.word 0xf41d4000  ! 243: LDD_R	ldd	[%r21 + %r0], %r26
	.word 0xbb3c5000  ! 244: SRAX_R	srax	%r17, %r0, %r29
	.word 0xf05c8000  ! 246: LDX_R	ldx	[%r18 + %r0], %r24
	.word 0xfa4d0000  ! 248: LDSB_R	ldsb	[%r20 + %r0], %r29
	.word 0xfc1d0000  ! 250: LDD_R	ldd	[%r20 + %r0], %r30
hwintr_2_9:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_9), 16, 16)) -> intp(2, 0, 2f)
	.word 0xb7504000  ! 254: RDPR_TNPC	<illegal instruction>
hwintr_2_10:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_10), 16, 16)) -> intp(2, 0, 34)
	.word 0xb9480000  ! 257: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xb82d4000  ! 260: ANDN_R	andn 	%r21, %r0, %r28
	.word 0xf71de073  ! 262: LDDF_I	ldd	[%r23, 0x0073], %f27
	.word 0xf2048000  ! 266: LDUW_R	lduw	[%r18 + %r0], %r25
	.word 0x85956023  ! 270: WRPR_TSTATE_I	wrpr	%r21, 0x0023, %tstate
	.word 0xb9540000  ! 271: RDPR_GL	rdpr	%-, %r28
hwintr_2_11:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_11), 16, 16)) -> intp(2, 0, 32)
	.word 0xff1c4000  ! 273: LDDF_R	ldd	[%r17, %r0], %f31
	.word 0xf05ca18b  ! 276: LDX_I	ldx	[%r18 + 0x018b], %r24
	.word 0xfc5d0000  ! 277: LDX_R	ldx	[%r20 + %r0], %r30
	.word 0xf45da1d8  ! 280: LDX_I	ldx	[%r22 + 0x01d8], %r26
	.word 0xf4154000  ! 284: LDUH_R	lduh	[%r21 + %r0], %r26
	.word 0xf31cc000  ! 285: LDDF_R	ldd	[%r19, %r0], %f25
	.word 0xf205e0d2  ! 288: LDUW_I	lduw	[%r23 + 0x00d2], %r25
	.word 0xf005e178  ! 289: LDUW_I	lduw	[%r23 + 0x0178], %r24
	.word 0xf01420cc  ! 291: LDUH_I	lduh	[%r16 + 0x00cc], %r24
	.word 0xfc4c8000  ! 293: LDSB_R	ldsb	[%r18 + %r0], %r30
	.word 0xbd480000  ! 296: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xb1540000  ! 297: RDPR_GL	<illegal instruction>
hwintr_2_12:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_12), 16, 16)) -> intp(2, 0, b)
	.word 0xfe1d2088  ! 300: LDD_I	ldd	[%r20 + 0x0088], %r31
	.word 0xf60c217b  ! 301: LDUB_I	ldub	[%r16 + 0x017b], %r27
	.word 0xf01de1d7  ! 304: LDD_I	ldd	[%r23 + 0x01d7], %r24
	.word 0xfd1d8000  ! 306: LDDF_R	ldd	[%r22, %r0], %f30
hwintr_2_13:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_13), 16, 16)) -> intp(2, 0, 12)
	.word 0xfc0d600c  ! 311: LDUB_I	ldub	[%r21 + 0x000c], %r30
	.word 0xf25ca0eb  ! 312: LDX_I	ldx	[%r18 + 0x00eb], %r25
	.word 0xfa150000  ! 313: LDUH_R	lduh	[%r20 + %r0], %r29
	.word 0xf44c0000  ! 315: LDSB_R	ldsb	[%r16 + %r0], %r26
	.word 0x8595e16e  ! 320: WRPR_TSTATE_I	wrpr	%r23, 0x016e, %tstate
	.word 0xf0454000  ! 321: LDSW_R	ldsw	[%r21 + %r0], %r24
	.word 0xb08c20ea  ! 325: ANDcc_I	andcc 	%r16, 0x00ea, %r24
	.word 0xbd504000  ! 331: RDPR_TNPC	<illegal instruction>
	.word 0xfa4ce107  ! 332: LDSB_I	ldsb	[%r19 + 0x0107], %r29
	.word 0xf41dc000  ! 336: LDD_R	ldd	[%r23 + %r0], %r26
	.word 0xbf50c000  ! 342: RDPR_TT	<illegal instruction>
	.word 0xf6448000  ! 343: LDSW_R	ldsw	[%r18 + %r0], %r27
	.word 0xbe348000  ! 347: SUBC_R	orn 	%r18, %r0, %r31
	.word 0xff1dc000  ! 350: LDDF_R	ldd	[%r23, %r0], %f31
	.word 0xf81da089  ! 351: LDD_I	ldd	[%r22 + 0x0089], %r28
	.word 0xf91c0000  ! 352: LDDF_R	ldd	[%r16, %r0], %f28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	setx	data_start_1, %g1, %r22
	.word 0x8995e103  ! 364: WRPR_TICK_I	wrpr	%r23, 0x0103, %tick
	.word 0xf31ca022  ! 369: LDDF_I	ldd	[%r18, 0x0022], %f25
	.word 0xfa4d8000  ! 372: LDSB_R	ldsb	[%r22 + %r0], %r29
	.word 0xf41c0000  ! 377: LDD_R	ldd	[%r16 + %r0], %r26
	.word 0xb2bde0a3  ! 378: XNORcc_I	xnorcc 	%r23, 0x00a3, %r25
	.word 0xbb50c000  ! 380: RDPR_TT	<illegal instruction>
hwintr_2_14:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_14), 16, 16)) -> intp(2, 0, 9)
	.word 0xfe54a138  ! 389: LDSH_I	ldsh	[%r18 + 0x0138], %r31
	.word 0xb7508000  ! 391: RDPR_TSTATE	<illegal instruction>
	.word 0xb7520000  ! 392: RDPR_PIL	<illegal instruction>
	mov	2, %r12
	.word 0xa1930000  ! 393: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf455a15b  ! 395: LDSH_I	ldsh	[%r22 + 0x015b], %r26
	.word 0xb9518000  ! 398: RDPR_PSTATE	<illegal instruction>
	.word 0xf0144000  ! 401: LDUH_R	lduh	[%r17 + %r0], %r24
	.word 0xf24dc000  ! 402: LDSB_R	ldsb	[%r23 + %r0], %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	mov	1, %r12
	.word 0x8f930000  ! 407: WRPR_TL_R	wrpr	%r12, %r0, %tl
	setx	data_start_2, %g1, %r16
	.word 0xb604e1ff  ! 411: ADD_I	add 	%r19, 0x01ff, %r27
	.word 0xfe4c0000  ! 412: LDSB_R	ldsb	[%r16 + %r0], %r31
	.word 0xf045a13c  ! 417: LDSW_I	ldsw	[%r22 + 0x013c], %r24
	.word 0xb350c000  ! 418: RDPR_TT	rdpr	%tt, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
hwintr_2_15:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_15), 16, 16)) -> intp(2, 0, c)
	.word 0xfc54c000  ! 422: LDSH_R	ldsh	[%r19 + %r0], %r30
	.word 0xfe1c0000  ! 423: LDD_R	ldd	[%r16 + %r0], %r31
	.word 0xfc5ca047  ! 424: LDX_I	ldx	[%r18 + 0x0047], %r30
	.word 0xf805e104  ! 426: LDUW_I	lduw	[%r23 + 0x0104], %r28
	.word 0x819420f1  ! 427: WRPR_TPC_I	wrpr	%r16, 0x00f1, %tpc
	.word 0xb7500000  ! 428: RDPR_TPC	<illegal instruction>
	.word 0xfa44a046  ! 430: LDSW_I	ldsw	[%r18 + 0x0046], %r29
	.word 0xb950c000  ! 431: RDPR_TT	<illegal instruction>
	.word 0xbd518000  ! 432: RDPR_PSTATE	<illegal instruction>
	.word 0xfa15a079  ! 434: LDUH_I	lduh	[%r22 + 0x0079], %r29
	.word 0xf01ca112  ! 436: LDD_I	ldd	[%r18 + 0x0112], %r24
	.word 0xb97c2401  ! 439: MOVR_I	movre	%r16, 0x1, %r28
	.word 0xba25c000  ! 443: SUB_R	sub 	%r23, %r0, %r29
hwintr_2_16:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_16), 16, 16)) -> intp(2, 0, 38)
	.word 0xfb1c0000  ! 447: LDDF_R	ldd	[%r16, %r0], %f29
	.word 0xf015c000  ! 448: LDUH_R	lduh	[%r23 + %r0], %r24
	.word 0xb3350000  ! 449: SRL_R	srl 	%r20, %r0, %r25
	.word 0xff1d8000  ! 455: LDDF_R	ldd	[%r22, %r0], %f31
	.word 0xb7500000  ! 461: RDPR_TPC	<illegal instruction>
	.word 0xf61461bf  ! 462: LDUH_I	lduh	[%r17 + 0x01bf], %r27
	.word 0xfa44a1e4  ! 466: LDSW_I	ldsw	[%r18 + 0x01e4], %r29
	.word 0xb350c000  ! 468: RDPR_TT	<illegal instruction>
	.word 0xf604616a  ! 469: LDUW_I	lduw	[%r17 + 0x016a], %r27
	.word 0xb1480000  ! 472: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
hwintr_2_17:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_17), 16, 16)) -> intp(2, 0, d)
	.word 0xf6454000  ! 477: LDSW_R	ldsw	[%r21 + %r0], %r27
	.word 0x8595605a  ! 480: WRPR_TSTATE_I	wrpr	%r21, 0x005a, %tstate
	setx	data_start_4, %g1, %r17
	.word 0xfc1d6012  ! 483: LDD_I	ldd	[%r21 + 0x0012], %r30
	.word 0xf91c8000  ! 486: LDDF_R	ldd	[%r18, %r0], %f28
	.word 0xb551c000  ! 487: RDPR_TL	<illegal instruction>
	.word 0xf65421a4  ! 490: LDSH_I	ldsh	[%r16 + 0x01a4], %r27
	.word 0x8195a116  ! 491: WRPR_TPC_I	wrpr	%r22, 0x0116, %tpc
	setx	data_start_6, %g1, %r21
	mov	2, %r12
	.word 0xa1930000  ! 498: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb97c0400  ! 499: MOVR_R	movre	%r16, %r0, %r28
	.word 0xbd518000  ! 500: RDPR_PSTATE	<illegal instruction>
	.word 0xf60ce10b  ! 505: LDUB_I	ldub	[%r19 + 0x010b], %r27
	.word 0xf64d60b2  ! 508: LDSB_I	ldsb	[%r21 + 0x00b2], %r27
	.word 0xf01dc000  ! 514: LDD_R	ldd	[%r23 + %r0], %r24
	.word 0x81946184  ! 520: WRPR_TPC_I	wrpr	%r17, 0x0184, %tpc
	.word 0xb1510000  ! 521: RDPR_TICK	<illegal instruction>
	.word 0xfe15218a  ! 525: LDUH_I	lduh	[%r20 + 0x018a], %r31
hwintr_2_18:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_18), 16, 16)) -> intp(2, 0, 8)
	.word 0xf04c4000  ! 529: LDSB_R	ldsb	[%r17 + %r0], %r24
	.word 0xff1dc000  ! 530: LDDF_R	ldd	[%r23, %r0], %f31
	.word 0xbe250000  ! 532: SUB_R	sub 	%r20, %r0, %r31
	.word 0xfa5ce0b8  ! 533: LDX_I	ldx	[%r19 + 0x00b8], %r29
	.word 0xfe152093  ! 535: LDUH_I	lduh	[%r20 + 0x0093], %r31
	.word 0xfa45e0f8  ! 536: LDSW_I	ldsw	[%r23 + 0x00f8], %r29
	.word 0xfa456050  ! 539: LDSW_I	ldsw	[%r21 + 0x0050], %r29
	.word 0x8795a01d  ! 541: WRPR_TT_I	wrpr	%r22, 0x001d, %tt
	.word 0xbeb521d1  ! 547: SUBCcc_I	orncc 	%r20, 0x01d1, %r31
	.word 0xf91de0a4  ! 549: LDDF_I	ldd	[%r23, 0x00a4], %f28
hwintr_2_19:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_19), 16, 16)) -> intp(2, 0, 19)
	.word 0xfc54a07f  ! 552: LDSH_I	ldsh	[%r18 + 0x007f], %r30
	.word 0xf24da12b  ! 554: LDSB_I	ldsb	[%r22 + 0x012b], %r25
	.word 0xfe5da035  ! 555: LDX_I	ldx	[%r22 + 0x0035], %r31
	.word 0xf014a1c6  ! 556: LDUH_I	lduh	[%r18 + 0x01c6], %r24
	.word 0xbc2d20de  ! 558: ANDN_I	andn 	%r20, 0x00de, %r30
	.word 0xf244a177  ! 559: LDSW_I	ldsw	[%r18 + 0x0177], %r25
	.word 0xf31d8000  ! 560: LDDF_R	ldd	[%r22, %r0], %f25
	.word 0xbf510000  ! 561: RDPR_TICK	<illegal instruction>
	.word 0xbf2c8000  ! 563: SLL_R	sll 	%r18, %r0, %r31
	.word 0xf614209e  ! 568: LDUH_I	lduh	[%r16 + 0x009e], %r27
	.word 0xf4158000  ! 569: LDUH_R	lduh	[%r22 + %r0], %r26
	.word 0xf61c204b  ! 570: LDD_I	ldd	[%r16 + 0x004b], %r27
hwintr_2_20:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_20), 16, 16)) -> intp(2, 0, b)
	.word 0xfc158000  ! 576: LDUH_R	lduh	[%r22 + %r0], %r30
	.word 0xb9540000  ! 580: RDPR_GL	<illegal instruction>
	mov	0, %r12
	.word 0xa1930000  ! 581: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xfc4ca1a9  ! 583: LDSB_I	ldsb	[%r18 + 0x01a9], %r30
	.word 0xfc05e1ff  ! 584: LDUW_I	lduw	[%r23 + 0x01ff], %r30
	.word 0x859421a7  ! 588: WRPR_TSTATE_I	wrpr	%r16, 0x01a7, %tstate
	.word 0x899520a7  ! 592: WRPR_TICK_I	wrpr	%r20, 0x00a7, %tick
	setx	data_start_2, %g1, %r23
	.word 0xf60c4000  ! 595: LDUB_R	ldub	[%r17 + %r0], %r27
	.word 0xbb51c000  ! 596: RDPR_TL	rdpr	%tl, %r29
	.word 0xfa54a041  ! 599: LDSH_I	ldsh	[%r18 + 0x0041], %r29
hwintr_2_21:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_21), 16, 16)) -> intp(2, 0, 10)
	.word 0xfe5c0000  ! 604: LDX_R	ldx	[%r16 + %r0], %r31
	.word 0x8595206d  ! 607: WRPR_TSTATE_I	wrpr	%r20, 0x006d, %tstate
	.word 0xf85ce0f1  ! 608: LDX_I	ldx	[%r19 + 0x00f1], %r28
	.word 0x919561cf  ! 611: WRPR_PIL_I	wrpr	%r21, 0x01cf, %pil
hwintr_2_22:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_22), 16, 16)) -> intp(2, 0, 22)
	.word 0xf64cc000  ! 613: LDSB_R	ldsb	[%r19 + %r0], %r27
	.word 0xf41c213e  ! 615: LDD_I	ldd	[%r16 + 0x013e], %r26
	.word 0xb5508000  ! 616: RDPR_TSTATE	rdpr	%tstate, %r26
	.word 0xb7480000  ! 617: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xf604e0eb  ! 620: LDUW_I	lduw	[%r19 + 0x00eb], %r27
	.word 0x87956136  ! 621: WRPR_TT_I	wrpr	%r21, 0x0136, %tt
	.word 0xf05ca14a  ! 622: LDX_I	ldx	[%r18 + 0x014a], %r24
	.word 0xf91d4000  ! 624: LDDF_R	ldd	[%r21, %r0], %f28
	.word 0xf854e03d  ! 625: LDSH_I	ldsh	[%r19 + 0x003d], %r28
	.word 0xfc148000  ! 628: LDUH_R	lduh	[%r18 + %r0], %r30
hwintr_2_23:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_23), 16, 16)) -> intp(2, 0, 3b)
	.word 0xf71c8000  ! 631: LDDF_R	ldd	[%r18, %r0], %f27
	.word 0xfe140000  ! 637: LDUH_R	lduh	[%r16 + %r0], %r31
hwintr_2_24:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_24), 16, 16)) -> intp(2, 0, 3f)
	.word 0xf65ca1b5  ! 642: LDX_I	ldx	[%r18 + 0x01b5], %r27
	.word 0xf05d8000  ! 643: LDX_R	ldx	[%r22 + %r0], %r24
	.word 0xf4558000  ! 644: LDSH_R	ldsh	[%r22 + %r0], %r26
	.word 0xbe358000  ! 651: ORN_R	orn 	%r22, %r0, %r31
	.word 0x87952160  ! 653: WRPR_TT_I	wrpr	%r20, 0x0160, %tt
	.word 0xf45ca178  ! 655: LDX_I	ldx	[%r18 + 0x0178], %r26
	.word 0xfc55c000  ! 656: LDSH_R	ldsh	[%r23 + %r0], %r30
	.word 0xf6150000  ! 663: LDUH_R	lduh	[%r20 + %r0], %r27
	setx	0x583a27420000d807, %g1, %r10
	.word 0x839a8000  ! 665: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x8594e1ea  ! 668: WRPR_TSTATE_I	wrpr	%r19, 0x01ea, %tstate
	.word 0xf31dc000  ! 670: LDDF_R	ldd	[%r23, %r0], %f25
hwintr_2_25:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_25), 16, 16)) -> intp(2, 0, 20)
hwintr_2_26:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_26), 16, 16)) -> intp(2, 0, 10)
	.word 0x85956046  ! 681: WRPR_TSTATE_I	wrpr	%r21, 0x0046, %tstate
	.word 0xf91ce005  ! 692: LDDF_I	ldd	[%r19, 0x0005], %f28
	.word 0xf45c0000  ! 693: LDX_R	ldx	[%r16 + %r0], %r26
	.word 0x8995615c  ! 694: WRPR_TICK_I	wrpr	%r21, 0x015c, %tick
	.word 0xf11c6181  ! 696: LDDF_I	ldd	[%r17, 0x0181], %f24
	.word 0xf6450000  ! 702: LDSW_R	ldsw	[%r20 + %r0], %r27
	.word 0xf855e06a  ! 704: LDSH_I	ldsh	[%r23 + 0x006a], %r28
	setx	data_start_6, %g1, %r23
	mov	2, %r12
	.word 0xa1930000  ! 708: WRPR_GL_R	wrpr	%r12, %r0, %-
	mov	1, %r12
	.word 0x8f930000  ! 711: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf614e00e  ! 712: LDUH_I	lduh	[%r19 + 0x000e], %r27
	.word 0xfa44c000  ! 713: LDSW_R	ldsw	[%r19 + %r0], %r29
	.word 0xf44d4000  ! 717: LDSB_R	ldsb	[%r21 + %r0], %r26
	.word 0xfd1c0000  ! 720: LDDF_R	ldd	[%r16, %r0], %f30
	.word 0xfe5d60b8  ! 724: LDX_I	ldx	[%r21 + 0x00b8], %r31
	setx	0x8c071f5600008b1c, %g1, %r10
	.word 0x819a8000  ! 725: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	mov	0, %r12
	.word 0x8f930000  ! 727: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf4150000  ! 731: LDUH_R	lduh	[%r20 + %r0], %r26
	.word 0xb5520000  ! 734: RDPR_PIL	<illegal instruction>
	.word 0xb32cf001  ! 741: SLLX_I	sllx	%r19, 0x0001, %r25
	.word 0x8195a064  ! 745: WRPR_TPC_I	wrpr	%r22, 0x0064, %tpc
	.word 0x8794e07e  ! 749: WRPR_TT_I	wrpr	%r19, 0x007e, %tt
	.word 0xb1480000  ! 751: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xba042165  ! 754: ADD_I	add 	%r16, 0x0165, %r29
	.word 0x8994207e  ! 758: WRPR_TICK_I	wrpr	%r16, 0x007e, %tick
	setx	0xc6afefc200005e86, %g1, %r10
	.word 0x839a8000  ! 765: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x8595e1c1  ! 768: WRPR_TSTATE_I	wrpr	%r23, 0x01c1, %tstate
	.word 0x8594a17f  ! 769: WRPR_TSTATE_I	wrpr	%r18, 0x017f, %tstate
	.word 0xfa042101  ! 772: LDUW_I	lduw	[%r16 + 0x0101], %r29
	.word 0xf20de0a5  ! 773: LDUB_I	ldub	[%r23 + 0x00a5], %r25
	.word 0xf00560ba  ! 775: LDUW_I	lduw	[%r21 + 0x00ba], %r24
	.word 0x89956022  ! 776: WRPR_TICK_I	wrpr	%r21, 0x0022, %tick
	.word 0x8394607c  ! 779: WRPR_TNPC_I	wrpr	%r17, 0x007c, %tnpc
	.word 0xfe4521e9  ! 781: LDSW_I	ldsw	[%r20 + 0x01e9], %r31
	.word 0x8994e1d8  ! 782: WRPR_TICK_I	wrpr	%r19, 0x01d8, %tick
	.word 0xfe454000  ! 784: LDSW_R	ldsw	[%r21 + %r0], %r31
	.word 0xf20ce040  ! 785: LDUB_I	ldub	[%r19 + 0x0040], %r25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	setx	data_start_6, %g1, %r23
	mov	0, %r12
	.word 0x8f930000  ! 791: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb37d2401  ! 792: MOVR_I	movre	%r20, 0x1, %r25
hwintr_2_27:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_27), 16, 16)) -> intp(2, 0, b)
	.word 0xfe1560c4  ! 802: LDUH_I	lduh	[%r21 + 0x00c4], %r31
	.word 0xf655209c  ! 805: LDSH_I	ldsh	[%r20 + 0x009c], %r27
	.word 0xf41d0000  ! 809: LDD_R	ldd	[%r20 + %r0], %r26
hwintr_2_28:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_28), 16, 16)) -> intp(2, 0, 39)
	.word 0xf04460e6  ! 818: LDSW_I	ldsw	[%r17 + 0x00e6], %r24
	.word 0xf41421d6  ! 819: LDUH_I	lduh	[%r16 + 0x01d6], %r26
	.word 0x899461e8  ! 821: WRPR_TICK_I	wrpr	%r17, 0x01e8, %tick
	.word 0xb0bc8000  ! 822: XNORcc_R	xnorcc 	%r18, %r0, %r24
	.word 0xf245a19f  ! 825: LDSW_I	ldsw	[%r22 + 0x019f], %r25
	.word 0x85946077  ! 827: WRPR_TSTATE_I	wrpr	%r17, 0x0077, %tstate
	setx	data_start_2, %g1, %r22
	.word 0xf51d6001  ! 833: LDDF_I	ldd	[%r21, 0x0001], %f26
	.word 0xf91d0000  ! 836: LDDF_R	ldd	[%r20, %r0], %f28
	.word 0x81946046  ! 838: WRPR_TPC_I	wrpr	%r17, 0x0046, %tpc
	.word 0x8395605a  ! 839: WRPR_TNPC_I	wrpr	%r21, 0x005a, %tnpc
	.word 0xf60d4000  ! 840: LDUB_R	ldub	[%r21 + %r0], %r27
	.word 0xfc4c2084  ! 842: LDSB_I	ldsb	[%r16 + 0x0084], %r30
	.word 0x8394a15a  ! 844: WRPR_TNPC_I	wrpr	%r18, 0x015a, %tnpc
	.word 0x899561e5  ! 845: WRPR_TICK_I	wrpr	%r21, 0x01e5, %tick
	.word 0xf215215c  ! 846: LDUH_I	lduh	[%r20 + 0x015c], %r25
hwintr_2_29:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_29), 16, 16)) -> intp(2, 0, b)
	.word 0xfe4c8000  ! 855: LDSB_R	ldsb	[%r18 + %r0], %r31
	.word 0xf71ce0be  ! 859: LDDF_I	ldd	[%r19, 0x00be], %f27
	.word 0xfd1de1e0  ! 861: LDDF_I	ldd	[%r23, 0x01e0], %f30
	.word 0xfe540000  ! 865: LDSH_R	ldsh	[%r16 + %r0], %r31
	.word 0xf71de1b2  ! 866: LDDF_I	ldd	[%r23, 0x01b2], %f27
	.word 0xfc142083  ! 872: LDUH_I	lduh	[%r16 + 0x0083], %r30
	.word 0xb00d8000  ! 878: AND_R	and 	%r22, %r0, %r24
	.word 0xbc1da0c5  ! 881: XOR_I	xor 	%r22, 0x00c5, %r30
	.word 0xb1500000  ! 882: RDPR_TPC	rdpr	%tpc, %r24
	.word 0x85946045  ! 884: WRPR_TSTATE_I	wrpr	%r17, 0x0045, %tstate
hwintr_2_30:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_30), 16, 16)) -> intp(2, 0, 0)
	.word 0xf44d8000  ! 889: LDSB_R	ldsb	[%r22 + %r0], %r26
	.word 0xbc8c613e  ! 890: ANDcc_I	andcc 	%r17, 0x013e, %r30
	mov	1, %r12
	.word 0xa1930000  ! 893: WRPR_GL_R	wrpr	%r12, %r0, %-
hwintr_2_31:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_31), 16, 16)) -> intp(2, 0, 1e)
	.word 0xfa5cc000  ! 903: LDX_R	ldx	[%r19 + %r0], %r29
	.word 0xf84de0a9  ! 907: LDSB_I	ldsb	[%r23 + 0x00a9], %r28
hwintr_2_32:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_32), 16, 16)) -> intp(2, 0, 3b)
	.word 0xfe150000  ! 910: LDUH_R	lduh	[%r20 + %r0], %r31
	.word 0xb32d3001  ! 913: SLLX_I	sllx	%r20, 0x0001, %r25
	.word 0xf24d0000  ! 923: LDSB_R	ldsb	[%r20 + %r0], %r25
hwintr_2_33:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_33), 16, 16)) -> intp(2, 0, 18)
	.word 0xf00de08a  ! 926: LDUB_I	ldub	[%r23 + 0x008a], %r24
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf2558000  ! 929: LDSH_R	ldsh	[%r22 + %r0], %r25
	.word 0x8d94e1bd  ! 930: WRPR_PSTATE_I	wrpr	%r19, 0x01bd, %pstate
	.word 0xf6048000  ! 931: LDUW_R	lduw	[%r18 + %r0], %r27
	.word 0xfa4460a1  ! 934: LDSW_I	ldsw	[%r17 + 0x00a1], %r29
	setx	0x4f525bcd00007b46, %g1, %r10
	.word 0x819a8000  ! 936: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf6146101  ! 938: LDUH_I	lduh	[%r17 + 0x0101], %r27
	.word 0x87956157  ! 940: WRPR_TT_I	wrpr	%r21, 0x0157, %tt
	.word 0xf61d4000  ! 941: LDD_R	ldd	[%r21 + %r0], %r27
	.word 0xb551c000  ! 943: RDPR_TL	<illegal instruction>
hwintr_2_34:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_34), 16, 16)) -> intp(2, 0, 2e)
	.word 0xfa45c000  ! 947: LDSW_R	ldsw	[%r23 + %r0], %r29
	.word 0xf60da061  ! 949: LDUB_I	ldub	[%r22 + 0x0061], %r27
	.word 0xfc5520da  ! 950: LDSH_I	ldsh	[%r20 + 0x00da], %r30
	setx	data_start_5, %g1, %r17
	.word 0xfe45a158  ! 956: LDSW_I	ldsw	[%r22 + 0x0158], %r31
	.word 0xf44d0000  ! 957: LDSB_R	ldsb	[%r20 + %r0], %r26
	.word 0xfe5ce109  ! 958: LDX_I	ldx	[%r19 + 0x0109], %r31
	.word 0x8594a177  ! 959: WRPR_TSTATE_I	wrpr	%r18, 0x0177, %tstate
	.word 0xf31c61b2  ! 960: LDDF_I	ldd	[%r17, 0x01b2], %f25
	.word 0xf45ce11a  ! 962: LDX_I	ldx	[%r19 + 0x011a], %r26
	.word 0x8995a04f  ! 965: WRPR_TICK_I	wrpr	%r22, 0x004f, %tick
	.word 0xf25c4000  ! 968: LDX_R	ldx	[%r17 + %r0], %r25
	.word 0xb350c000  ! 969: RDPR_TT	<illegal instruction>
hwintr_2_35:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_35), 16, 16)) -> intp(2, 0, 2d)
	.word 0xfc5d0000  ! 972: LDX_R	ldx	[%r20 + %r0], %r30
	.word 0x8d94a171  ! 974: WRPR_PSTATE_I	wrpr	%r18, 0x0171, %pstate
	.word 0xf21d20e8  ! 976: LDD_I	ldd	[%r20 + 0x00e8], %r25
	.word 0xf05d0000  ! 978: LDX_R	ldx	[%r20 + %r0], %r24
	mov	2, %r12
	.word 0x8f930000  ! 980: WRPR_TL_R	wrpr	%r12, %r0, %tl
hwintr_2_36:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_36), 16, 16)) -> intp(2, 0, 36)
	.word 0xf8054000  ! 983: LDUW_R	lduw	[%r21 + %r0], %r28
	.word 0xba954000  ! 985: ORcc_R	orcc 	%r21, %r0, %r29
hwintr_2_37:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_37), 16, 16)) -> intp(2, 0, 2b)
	.word 0xbb480000  ! 991: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xf405a046  ! 992: LDUW_I	lduw	[%r22 + 0x0046], %r26
	.word 0xf8548000  ! 997: LDSH_R	ldsh	[%r18 + %r0], %r28
	.word 0x8595e17e  ! 998: WRPR_TSTATE_I	wrpr	%r23, 0x017e, %tstate
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	.word 0xba1dc000  ! 2: XOR_R	xor 	%r23, %r0, %r29
	.word 0xb9540000  ! 3: RDPR_GL	<illegal instruction>
	.word 0xb7ab4820  ! 5: FMOVCC	fmovs	%fcc1, %f0, %f27
	.word 0xbdab4820  ! 7: FMOVCC	fmovs	%fcc1, %f0, %f30
	.word 0xb9abc820  ! 8: FMOVVC	fmovs	%fcc1, %f0, %f28
	.word 0xb9508000  ! 9: RDPR_TSTATE	<illegal instruction>
	.word 0xb5500000  ! 10: RDPR_TPC	<illegal instruction>
	.word 0xbab44000  ! 11: ORNcc_R	orncc 	%r17, %r0, %r29
	.word 0x859421f7  ! 16: WRPR_TSTATE_I	wrpr	%r16, 0x01f7, %tstate
	.word 0xb3a509a0  ! 17: FDIVs	fdivs	%f20, %f0, %f25
	.word 0xb5a489c0  ! 18: FDIVd	fdivd	%f18, %f0, %f26
	.word 0xbd508000  ! 19: RDPR_TSTATE	<illegal instruction>
hwintr_1_0:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_0), 16, 16)) -> intp(1, 0, 1a)
	.word 0xb5a81420  ! 22: FMOVRNZ	dis not found

	.word 0x83942017  ! 30: WRPR_TNPC_I	wrpr	%r16, 0x0017, %tnpc
	mov	0, %r12
	.word 0xa1930000  ! 31: WRPR_GL_R	wrpr	%r12, %r0, %-
hwintr_1_1:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_1), 16, 16)) -> intp(1, 0, 1b)
	.word 0xb435216a  ! 39: SUBC_I	orn 	%r20, 0x016a, %r26
	.word 0x8795201d  ! 40: WRPR_TT_I	wrpr	%r20, 0x001d, %tt
	.word 0xb1aac820  ! 46: FMOVGE	fmovs	%fcc1, %f0, %f24
hwintr_1_2:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_2), 16, 16)) -> intp(1, 0, 36)
	.word 0xb5a48920  ! 53: FMULs	fmuls	%f18, %f0, %f26
	.word 0x9195208d  ! 54: WRPR_PIL_I	wrpr	%r20, 0x008d, %pil
	.word 0xb9a00560  ! 55: FSQRTq	fsqrt	
	.word 0xb1a44820  ! 56: FADDs	fadds	%f17, %f0, %f24
	.word 0xbda448e0  ! 59: FSUBq	dis not found

hwintr_1_3:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_3), 16, 16)) -> intp(1, 0, 27)
	.word 0xb7aa8820  ! 63: FMOVG	fmovs	%fcc1, %f0, %f27
hwintr_1_4:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_4), 16, 16)) -> intp(1, 0, 21)
	.word 0xb3a44920  ! 65: FMULs	fmuls	%f17, %f0, %f25
hwintr_1_5:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_5), 16, 16)) -> intp(1, 0, 23)
	.word 0xb0448000  ! 68: ADDC_R	addc 	%r18, %r0, %r24
	mov	0, %r12
	.word 0xa1930000  ! 70: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbda80c20  ! 76: FMOVRLZ	dis not found

	.word 0xb1a00020  ! 78: FMOVs	fmovs	%f0, %f24
	.word 0xbfa81420  ! 80: FMOVRNZ	dis not found

	.word 0xbfa4c940  ! 82: FMULd	fmuld	%f50, %f0, %f62
	.word 0xb1a4c9a0  ! 83: FDIVs	fdivs	%f19, %f0, %f24
	.word 0xbba90820  ! 84: FMOVLEU	fmovs	%fcc1, %f0, %f29
	.word 0xb3aac820  ! 87: FMOVGE	fmovs	%fcc1, %f0, %f25
	.word 0xbda00560  ! 89: FSQRTq	fsqrt	
	.word 0xb824a084  ! 92: SUB_I	sub 	%r18, 0x0084, %r28
	.word 0xbba50860  ! 96: FADDq	dis not found

	.word 0xbda548a0  ! 100: FSUBs	fsubs	%f21, %f0, %f30
	.word 0xb3aa0820  ! 108: FMOVA	fmovs	%fcc1, %f0, %f25
	.word 0xb7abc820  ! 109: FMOVVC	fmovs	%fcc1, %f0, %f27
	.word 0xbfab4820  ! 110: FMOVCC	fmovs	%fcc1, %f0, %f31
	.word 0xb3a58860  ! 114: FADDq	dis not found

	.word 0xb9ab0820  ! 119: FMOVGU	fmovs	%fcc1, %f0, %f28
hwintr_1_6:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_6), 16, 16)) -> intp(1, 0, 2)
	.word 0xbb504000  ! 131: RDPR_TNPC	<illegal instruction>
	.word 0x879421f6  ! 134: WRPR_TT_I	wrpr	%r16, 0x01f6, %tt
	.word 0xb5a44940  ! 135: FMULd	fmuld	%f48, %f0, %f26
	.word 0xbcc460b7  ! 137: ADDCcc_I	addccc 	%r17, 0x00b7, %r30
	.word 0xb3540000  ! 139: RDPR_GL	<illegal instruction>
	.word 0xb7a00520  ! 144: FSQRTs	fsqrt	
	.word 0xbfab0820  ! 148: FMOVGU	fmovs	%fcc1, %f0, %f31
	.word 0xbda54840  ! 149: FADDd	faddd	%f52, %f0, %f30
	.word 0xb92dd000  ! 153: SLLX_R	sllx	%r23, %r0, %r28
hwintr_1_7:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_7), 16, 16)) -> intp(1, 0, 3e)
	.word 0xbb510000  ! 159: RDPR_TICK	<illegal instruction>
	.word 0xbba00040  ! 161: FMOVd	fmovd	%f0, %f60
	.word 0xb9540000  ! 162: RDPR_GL	<illegal instruction>
	.word 0xbfa40820  ! 165: FADDs	fadds	%f16, %f0, %f31
	.word 0x8395e112  ! 166: WRPR_TNPC_I	wrpr	%r23, 0x0112, %tnpc
	.word 0xb77ce401  ! 168: MOVR_I	movre	%r19, 0x1, %r27
	.word 0xb7a00540  ! 169: FSQRTd	fsqrt	
	.word 0xbba4c8c0  ! 170: FSUBd	fsubd	%f50, %f0, %f60
	.word 0x8394e1e3  ! 174: WRPR_TNPC_I	wrpr	%r19, 0x01e3, %tnpc
	.word 0xb9a54940  ! 179: FMULd	fmuld	%f52, %f0, %f28
	.word 0xbfa00560  ! 180: FSQRTq	fsqrt	
	.word 0xb9a88820  ! 182: FMOVLE	fmovs	%fcc1, %f0, %f28
	.word 0xb1a54960  ! 183: FMULq	dis not found

	.word 0xbba5c960  ! 184: FMULq	dis not found

	mov	0, %r12
	.word 0x8f930000  ! 186: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x8194213a  ! 187: WRPR_TPC_I	wrpr	%r16, 0x013a, %tpc
	.word 0xbf480000  ! 191: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xb804e1c4  ! 192: ADD_I	add 	%r19, 0x01c4, %r28
	.word 0xb424a102  ! 194: SUB_I	sub 	%r18, 0x0102, %r26
	.word 0xbba409a0  ! 202: FDIVs	fdivs	%f16, %f0, %f29
	.word 0xb3a81c20  ! 204: FMOVRGEZ	dis not found

	setx	data_start_1, %g1, %r17
	.word 0x819560e5  ! 207: WRPR_TPC_I	wrpr	%r21, 0x00e5, %tpc
	setx	data_start_0, %g1, %r21
	.word 0xba8460a3  ! 210: ADDcc_I	addcc 	%r17, 0x00a3, %r29
	.word 0xba0d0000  ! 211: AND_R	and 	%r20, %r0, %r29
	.word 0xb1a4c9a0  ! 213: FDIVs	fdivs	%f19, %f0, %f24
	.word 0xb9a44820  ! 216: FADDs	fadds	%f17, %f0, %f28
	.word 0x91952087  ! 218: WRPR_PIL_I	wrpr	%r20, 0x0087, %pil
	.word 0x8795e1e5  ! 226: WRPR_TT_I	wrpr	%r23, 0x01e5, %tt
hwintr_1_8:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_8), 16, 16)) -> intp(1, 0, 9)
	.word 0x8d94208d  ! 229: WRPR_PSTATE_I	wrpr	%r16, 0x008d, %pstate
	.word 0xb7a409a0  ! 231: FDIVs	fdivs	%f16, %f0, %f27
	.word 0xb1480000  ! 238: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xb1aac820  ! 242: FMOVGE	fmovs	%fcc1, %f0, %f24
	.word 0xb13c5000  ! 244: SRAX_R	srax	%r17, %r0, %r24
	.word 0xb3ab0820  ! 245: FMOVGU	fmovs	%fcc1, %f0, %f25
	.word 0xb1aa8820  ! 251: FMOVG	fmovs	%fcc1, %f0, %f24
hwintr_1_9:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_9), 16, 16)) -> intp(1, 0, 26)
	.word 0xb1504000  ! 254: RDPR_TNPC	<illegal instruction>
	.word 0xbfab8820  ! 255: FMOVPOS	fmovs	%fcc1, %f0, %f31
hwintr_1_10:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_10), 16, 16)) -> intp(1, 0, 28)
	.word 0xbd480000  ! 257: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xb82c4000  ! 260: ANDN_R	andn 	%r17, %r0, %r28
	.word 0xbda50840  ! 261: FADDd	faddd	%f20, %f0, %f30
	.word 0xb7a00540  ! 263: FSQRTd	fsqrt	
	.word 0x8595e05c  ! 270: WRPR_TSTATE_I	wrpr	%r23, 0x005c, %tstate
	.word 0xbd540000  ! 271: RDPR_GL	<illegal instruction>
hwintr_1_11:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_11), 16, 16)) -> intp(1, 0, 30)
	.word 0xbda4c9a0  ! 274: FDIVs	fdivs	%f19, %f0, %f30
	.word 0xbfa409a0  ! 275: FDIVs	fdivs	%f16, %f0, %f31
	.word 0xb5a44860  ! 278: FADDq	dis not found

	.word 0xb1ab0820  ! 279: FMOVGU	fmovs	%fcc1, %f0, %f24
	.word 0xbfa80420  ! 281: FMOVRZ	dis not found

	.word 0xbda00520  ! 286: FSQRTs	fsqrt	
	.word 0xb3a5c840  ! 287: FADDd	faddd	%f54, %f0, %f56
	.word 0xb3ab4820  ! 290: FMOVCC	fmovs	%fcc1, %f0, %f25
	.word 0xb5480000  ! 296: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xb7540000  ! 297: RDPR_GL	<illegal instruction>
hwintr_1_12:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_12), 16, 16)) -> intp(1, 0, a)
	.word 0xbfaac820  ! 299: FMOVGE	fmovs	%fcc1, %f0, %f31
	.word 0xbba549e0  ! 303: FDIVq	dis not found

	.word 0xbba509c0  ! 305: FDIVd	fdivd	%f20, %f0, %f60
hwintr_1_13:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_13), 16, 16)) -> intp(1, 0, 25)
	.word 0xb9a9c820  ! 318: FMOVVS	fmovs	%fcc1, %f0, %f28
	.word 0x8595a065  ! 320: WRPR_TSTATE_I	wrpr	%r22, 0x0065, %tstate
	.word 0xb1a488c0  ! 322: FSUBd	fsubd	%f18, %f0, %f24
	.word 0xb7a88820  ! 324: FMOVLE	fmovs	%fcc1, %f0, %f27
	.word 0xb28ca0ea  ! 325: ANDcc_I	andcc 	%r18, 0x00ea, %r25
	.word 0xb3a80820  ! 327: FMOVN	fmovs	%fcc1, %f0, %f25
	.word 0xbfa00040  ! 330: FMOVd	fmovd	%f0, %f62
	.word 0xbb504000  ! 331: RDPR_TNPC	<illegal instruction>
	.word 0xbfa54960  ! 333: FMULq	dis not found

	.word 0xbfa44840  ! 334: FADDd	faddd	%f48, %f0, %f62
	.word 0xb5a54960  ! 338: FMULq	dis not found

	.word 0xb7abc820  ! 341: FMOVVC	fmovs	%fcc1, %f0, %f27
	.word 0xb950c000  ! 342: RDPR_TT	<illegal instruction>
	.word 0xbba94820  ! 346: FMOVCS	fmovs	%fcc1, %f0, %f29
	.word 0xb4340000  ! 347: SUBC_R	orn 	%r16, %r0, %r26
	.word 0xb3a00020  ! 349: FMOVs	fmovs	%f0, %f25
	.word 0xb1a548e0  ! 353: FSUBq	dis not found

	.word 0xb3a88820  ! 355: FMOVLE	fmovs	%fcc1, %f0, %f25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb3a80820  ! 359: FMOVN	fmovs	%fcc1, %f0, %f25
	.word 0xb7a40860  ! 360: FADDq	dis not found

	.word 0xbba589c0  ! 361: FDIVd	fdivd	%f22, %f0, %f60
	setx	data_start_6, %g1, %r18
	.word 0x8994619f  ! 364: WRPR_TICK_I	wrpr	%r17, 0x019f, %tick
	.word 0xbda88820  ! 366: FMOVLE	fmovs	%fcc1, %f0, %f30
	.word 0xb1a80420  ! 368: FMOVRZ	dis not found

	.word 0xbdab0820  ! 375: FMOVGU	fmovs	%fcc1, %f0, %f30
	.word 0xbebda10a  ! 378: XNORcc_I	xnorcc 	%r22, 0x010a, %r31
	.word 0xb7aa0820  ! 379: FMOVA	fmovs	%fcc1, %f0, %f27
	.word 0xbb50c000  ! 380: RDPR_TT	<illegal instruction>
	.word 0xb9a00560  ! 381: FSQRTq	fsqrt	
	.word 0xb5aa8820  ! 382: FMOVG	fmovs	%fcc1, %f0, %f26
hwintr_1_14:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_14), 16, 16)) -> intp(1, 0, 16)
	.word 0xbfa00540  ! 387: FSQRTd	fsqrt	
	.word 0xb3a4c8e0  ! 388: FSUBq	dis not found

	.word 0xb9a48920  ! 390: FMULs	fmuls	%f18, %f0, %f28
	.word 0xb7508000  ! 391: RDPR_TSTATE	<illegal instruction>
	.word 0xbf520000  ! 392: RDPR_PIL	<illegal instruction>
	mov	0, %r12
	.word 0xa1930000  ! 393: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb5a98820  ! 394: FMOVNEG	fmovs	%fcc1, %f0, %f26
	.word 0xbd518000  ! 398: RDPR_PSTATE	<illegal instruction>
	.word 0xb9a00040  ! 400: FMOVd	fmovd	%f0, %f28
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	mov	2, %r12
	.word 0x8f930000  ! 407: WRPR_TL_R	wrpr	%r12, %r0, %tl
	setx	data_start_3, %g1, %r17
	.word 0xbfab4820  ! 410: FMOVCC	fmovs	%fcc1, %f0, %f31
	.word 0xbc05a0c3  ! 411: ADD_I	add 	%r22, 0x00c3, %r30
	.word 0xb750c000  ! 418: RDPR_TT	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
hwintr_1_15:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_15), 16, 16)) -> intp(1, 0, 3)
	.word 0x81946059  ! 427: WRPR_TPC_I	wrpr	%r17, 0x0059, %tpc
	.word 0xb9500000  ! 428: RDPR_TPC	<illegal instruction>
	.word 0xbd50c000  ! 431: RDPR_TT	<illegal instruction>
	.word 0xbf518000  ! 432: RDPR_PSTATE	<illegal instruction>
	.word 0xb1a5c820  ! 437: FADDs	fadds	%f23, %f0, %f24
	.word 0xb37de401  ! 439: MOVR_I	movre	%r23, 0x1, %r25
	.word 0xb7a80c20  ! 440: FMOVRLZ	dis not found

	.word 0xb7aa0820  ! 441: FMOVA	fmovs	%fcc1, %f0, %f27
	.word 0xbda90820  ! 442: FMOVLEU	fmovs	%fcc1, %f0, %f30
	.word 0xb4240000  ! 443: SUB_R	sub 	%r16, %r0, %r26
	.word 0xb5a449a0  ! 444: FDIVs	fdivs	%f17, %f0, %f26
hwintr_1_16:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_16), 16, 16)) -> intp(1, 0, 7)
	.word 0xbfa80420  ! 446: FMOVRZ	dis not found

	.word 0xb9340000  ! 449: SRL_R	srl 	%r16, %r0, %r28
	.word 0xb3aa0820  ! 452: FMOVA	fmovs	%fcc1, %f0, %f25
	.word 0xbda50860  ! 453: FADDq	dis not found

	.word 0xbbaa0820  ! 456: FMOVA	fmovs	%fcc1, %f0, %f29
	.word 0xb3a00040  ! 459: FMOVd	fmovd	%f0, %f56
	.word 0xbd500000  ! 461: RDPR_TPC	<illegal instruction>
	.word 0xbf50c000  ! 468: RDPR_TT	<illegal instruction>
	.word 0xb3a40840  ! 471: FADDd	faddd	%f16, %f0, %f56
	.word 0xb5480000  ! 472: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xbda9c820  ! 473: FMOVVS	fmovs	%fcc1, %f0, %f30
	.word 0xb3a5c9a0  ! 474: FDIVs	fdivs	%f23, %f0, %f25
hwintr_1_17:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_17), 16, 16)) -> intp(1, 0, 39)
	.word 0x85946166  ! 480: WRPR_TSTATE_I	wrpr	%r17, 0x0166, %tstate
	setx	data_start_2, %g1, %r18
	.word 0xb551c000  ! 487: RDPR_TL	<illegal instruction>
	.word 0xb5a44920  ! 488: FMULs	fmuls	%f17, %f0, %f26
	.word 0x819561b4  ! 491: WRPR_TPC_I	wrpr	%r21, 0x01b4, %tpc
	setx	data_start_4, %g1, %r18
	.word 0xb3a00560  ! 493: FSQRTq	fsqrt	
	.word 0xb9a00560  ! 494: FSQRTq	fsqrt	
	mov	2, %r12
	.word 0xa1930000  ! 498: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb57c4400  ! 499: MOVR_R	movre	%r17, %r0, %r26
	.word 0xb1518000  ! 500: RDPR_PSTATE	<illegal instruction>
	.word 0xb7aa0820  ! 503: FMOVA	fmovs	%fcc1, %f0, %f27
	.word 0xbba84820  ! 507: FMOVE	fmovs	%fcc1, %f0, %f29
	.word 0xbfa00520  ! 513: FSQRTs	fsqrt	
	.word 0xbda5c920  ! 516: FMULs	fmuls	%f23, %f0, %f30
	.word 0xbda80820  ! 518: FMOVN	fmovs	%fcc1, %f0, %f30
	.word 0xbda80c20  ! 519: FMOVRLZ	dis not found

	.word 0x819521d2  ! 520: WRPR_TPC_I	wrpr	%r20, 0x01d2, %tpc
	.word 0xbd510000  ! 521: RDPR_TICK	<illegal instruction>
	.word 0xb9a5c9a0  ! 523: FDIVs	fdivs	%f23, %f0, %f28
	.word 0xbfa84820  ! 527: FMOVE	fmovs	%fcc1, %f0, %f31
hwintr_1_18:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_18), 16, 16)) -> intp(1, 0, 22)
	.word 0xb425c000  ! 532: SUB_R	sub 	%r23, %r0, %r26
	.word 0x8795a184  ! 541: WRPR_TT_I	wrpr	%r22, 0x0184, %tt
	.word 0xbba4c920  ! 544: FMULs	fmuls	%f19, %f0, %f29
	.word 0xb8b4a0b0  ! 547: SUBCcc_I	orncc 	%r18, 0x00b0, %r28
hwintr_1_19:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_19), 16, 16)) -> intp(1, 0, 35)
	.word 0xb5a5c8e0  ! 551: FSUBq	dis not found

	.word 0xba2d20e9  ! 558: ANDN_I	andn 	%r20, 0x00e9, %r29
	.word 0xbd510000  ! 561: RDPR_TICK	<illegal instruction>
	.word 0xbd2dc000  ! 563: SLL_R	sll 	%r23, %r0, %r30
	.word 0xbda80420  ! 565: FMOVRZ	dis not found

	.word 0xbba84820  ! 571: FMOVE	fmovs	%fcc1, %f0, %f29
hwintr_1_20:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_20), 16, 16)) -> intp(1, 0, 36)
	.word 0xbd540000  ! 580: RDPR_GL	<illegal instruction>
	mov	0, %r12
	.word 0xa1930000  ! 581: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x8595a176  ! 588: WRPR_TSTATE_I	wrpr	%r22, 0x0176, %tstate
	.word 0xb9a54960  ! 589: FMULq	dis not found

	.word 0xbba9c820  ! 590: FMOVVS	fmovs	%fcc1, %f0, %f29
	.word 0x8994e174  ! 592: WRPR_TICK_I	wrpr	%r19, 0x0174, %tick
	setx	data_start_4, %g1, %r18
	.word 0xb551c000  ! 596: RDPR_TL	<illegal instruction>
hwintr_1_21:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_21), 16, 16)) -> intp(1, 0, 20)
	.word 0xb5a00020  ! 601: FMOVs	fmovs	%f0, %f26
	.word 0xbfa98820  ! 605: FMOVNEG	fmovs	%fcc1, %f0, %f31
	.word 0x85952156  ! 607: WRPR_TSTATE_I	wrpr	%r20, 0x0156, %tstate
	.word 0xb5ab0820  ! 609: FMOVGU	fmovs	%fcc1, %f0, %f26
	.word 0xb1a5c840  ! 610: FADDd	faddd	%f54, %f0, %f24
	.word 0x9195616e  ! 611: WRPR_PIL_I	wrpr	%r21, 0x016e, %pil
hwintr_1_22:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_22), 16, 16)) -> intp(1, 0, 10)
	.word 0xb1508000  ! 616: RDPR_TSTATE	<illegal instruction>
	.word 0xb3480000  ! 617: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0x879521f3  ! 621: WRPR_TT_I	wrpr	%r20, 0x01f3, %tt
	.word 0xb5aac820  ! 623: FMOVGE	fmovs	%fcc1, %f0, %f26
	.word 0xb7abc820  ! 626: FMOVVC	fmovs	%fcc1, %f0, %f27
hwintr_1_23:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_23), 16, 16)) -> intp(1, 0, 25)
	.word 0xbfa509e0  ! 632: FDIVq	dis not found

	.word 0xb9a9c820  ! 634: FMOVVS	fmovs	%fcc1, %f0, %f28
	.word 0xb5a4c860  ! 636: FADDq	dis not found

hwintr_1_24:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_24), 16, 16)) -> intp(1, 0, 3c)
	.word 0xb7ab0820  ! 640: FMOVGU	fmovs	%fcc1, %f0, %f27
	.word 0xbfa88820  ! 646: FMOVLE	fmovs	%fcc1, %f0, %f31
	.word 0xb3a00020  ! 650: FMOVs	fmovs	%f0, %f25
	.word 0xb2358000  ! 651: ORN_R	orn 	%r22, %r0, %r25
	.word 0x87956013  ! 653: WRPR_TT_I	wrpr	%r21, 0x0013, %tt
	.word 0xb5a84820  ! 658: FMOVE	fmovs	%fcc1, %f0, %f26
	.word 0xb1aa8820  ! 659: FMOVG	fmovs	%fcc1, %f0, %f24
	setx	0xae8a281400000c5c, %g1, %r10
	.word 0x839a8000  ! 665: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x8594e04b  ! 668: WRPR_TSTATE_I	wrpr	%r19, 0x004b, %tstate
hwintr_1_25:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_25), 16, 16)) -> intp(1, 0, 19)
hwintr_1_26:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_26), 16, 16)) -> intp(1, 0, 1b)
	.word 0x8594a105  ! 681: WRPR_TSTATE_I	wrpr	%r18, 0x0105, %tstate
	.word 0xbfa80c20  ! 686: FMOVRLZ	dis not found

	.word 0x89952057  ! 694: WRPR_TICK_I	wrpr	%r20, 0x0057, %tick
	.word 0xb1a80820  ! 698: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
	setx	data_start_1, %g1, %r23
	mov	1, %r12
	.word 0xa1930000  ! 708: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb7a50940  ! 710: FMULd	fmuld	%f20, %f0, %f58
	mov	1, %r12
	.word 0x8f930000  ! 711: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb3a80420  ! 721: FMOVRZ	dis not found

	setx	0x37f27fe80000698c, %g1, %r10
	.word 0x819a8000  ! 725: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	mov	2, %r12
	.word 0x8f930000  ! 727: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb1a00040  ! 728: FMOVd	fmovd	%f0, %f24
	.word 0xbba00560  ! 730: FSQRTq	fsqrt	
	.word 0xb1a54940  ! 732: FMULd	fmuld	%f52, %f0, %f24
	.word 0xbfa54920  ! 733: FMULs	fmuls	%f21, %f0, %f31
	.word 0xbd520000  ! 734: RDPR_PIL	<illegal instruction>
	.word 0xbfaa8820  ! 740: FMOVG	fmovs	%fcc1, %f0, %f31
	.word 0xbd2c7001  ! 741: SLLX_I	sllx	%r17, 0x0001, %r30
	.word 0x8194e0d8  ! 745: WRPR_TPC_I	wrpr	%r19, 0x00d8, %tpc
	.word 0x879460dd  ! 749: WRPR_TT_I	wrpr	%r17, 0x00dd, %tt
	.word 0xb3480000  ! 751: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xbfa00560  ! 753: FSQRTq	fsqrt	
	.word 0xb80461d1  ! 754: ADD_I	add 	%r17, 0x01d1, %r28
	.word 0xb9a589c0  ! 756: FDIVd	fdivd	%f22, %f0, %f28
	.word 0xb7a549e0  ! 757: FDIVq	dis not found

	.word 0x899460ea  ! 758: WRPR_TICK_I	wrpr	%r17, 0x00ea, %tick
	.word 0xb9a488a0  ! 762: FSUBs	fsubs	%f18, %f0, %f28
	setx	0xc8fd63c300006b98, %g1, %r10
	.word 0x839a8000  ! 765: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x8594e050  ! 768: WRPR_TSTATE_I	wrpr	%r19, 0x0050, %tstate
	.word 0x8595a109  ! 769: WRPR_TSTATE_I	wrpr	%r22, 0x0109, %tstate
	.word 0xbba00520  ! 771: FSQRTs	fsqrt	
	.word 0x89952178  ! 776: WRPR_TICK_I	wrpr	%r20, 0x0178, %tick
	.word 0xb1a40840  ! 778: FADDd	faddd	%f16, %f0, %f24
	.word 0x8395e0ba  ! 779: WRPR_TNPC_I	wrpr	%r23, 0x00ba, %tnpc
	.word 0x89952159  ! 782: WRPR_TICK_I	wrpr	%r20, 0x0159, %tick
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	setx	data_start_4, %g1, %r23
	.word 0xbda8c820  ! 790: FMOVL	fmovs	%fcc1, %f0, %f30
	mov	1, %r12
	.word 0x8f930000  ! 791: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb57de401  ! 792: MOVR_I	movre	%r23, 0x1, %r26
	.word 0xbfa48960  ! 796: FMULq	dis not found

hwintr_1_27:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_27), 16, 16)) -> intp(1, 0, 27)
	.word 0xb3a00020  ! 800: FMOVs	fmovs	%f0, %f25
	.word 0xb5a50820  ! 803: FADDs	fadds	%f20, %f0, %f26
	.word 0xbda44820  ! 806: FADDs	fadds	%f17, %f0, %f30
hwintr_1_28:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_28), 16, 16)) -> intp(1, 0, 1f)
	.word 0xb7a00540  ! 812: FSQRTd	fsqrt	
	.word 0xb5a449e0  ! 814: FDIVq	dis not found

	.word 0x899560e2  ! 821: WRPR_TICK_I	wrpr	%r21, 0x00e2, %tick
	.word 0xbebc8000  ! 822: XNORcc_R	xnorcc 	%r18, %r0, %r31
	.word 0xb1a588e0  ! 826: FSUBq	dis not found

	.word 0x8594a02e  ! 827: WRPR_TSTATE_I	wrpr	%r18, 0x002e, %tstate
	setx	data_start_3, %g1, %r21
	.word 0xb9a509c0  ! 829: FDIVd	fdivd	%f20, %f0, %f28
	.word 0xbda81820  ! 832: FMOVRGZ	fmovs	%fcc3, %f0, %f30
	.word 0xbda00520  ! 835: FSQRTs	fsqrt	
	.word 0xbda94820  ! 837: FMOVCS	fmovs	%fcc1, %f0, %f30
	.word 0x81956156  ! 838: WRPR_TPC_I	wrpr	%r21, 0x0156, %tpc
	.word 0x8395a169  ! 839: WRPR_TNPC_I	wrpr	%r22, 0x0169, %tnpc
	.word 0x83942120  ! 844: WRPR_TNPC_I	wrpr	%r16, 0x0120, %tnpc
	.word 0x89942163  ! 845: WRPR_TICK_I	wrpr	%r16, 0x0163, %tick
	.word 0xbba44940  ! 849: FMULd	fmuld	%f48, %f0, %f60
hwintr_1_29:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_29), 16, 16)) -> intp(1, 0, 28)
	.word 0xb1aa4820  ! 854: FMOVNE	fmovs	%fcc1, %f0, %f24
	.word 0xb1aa0820  ! 856: FMOVA	fmovs	%fcc1, %f0, %f24
	.word 0xbba80c20  ! 857: FMOVRLZ	dis not found

	.word 0xb7a44960  ! 868: FMULq	dis not found

	.word 0xbfa4c8c0  ! 869: FSUBd	fsubd	%f50, %f0, %f62
	.word 0xb1a80820  ! 873: FMOVRLEZ	fmovs	%fcc1, %f0, %f24
	.word 0xb3aa8820  ! 874: FMOVG	fmovs	%fcc1, %f0, %f25
	.word 0xbba4c8e0  ! 876: FSUBq	dis not found

	.word 0xb5a81c20  ! 877: FMOVRGEZ	dis not found

	.word 0xbe0d8000  ! 878: AND_R	and 	%r22, %r0, %r31
	.word 0xb5a44820  ! 879: FADDs	fadds	%f17, %f0, %f26
	.word 0xba1ce0b1  ! 881: XOR_I	xor 	%r19, 0x00b1, %r29
	.word 0xbf500000  ! 882: RDPR_TPC	<illegal instruction>
	.word 0x8595e0ee  ! 884: WRPR_TSTATE_I	wrpr	%r23, 0x00ee, %tstate
hwintr_1_30:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_30), 16, 16)) -> intp(1, 0, 1)
	.word 0xb08c205c  ! 890: ANDcc_I	andcc 	%r16, 0x005c, %r24
	.word 0xb7a589e0  ! 892: FDIVq	dis not found

	mov	0, %r12
	.word 0xa1930000  ! 893: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb9a80c20  ! 897: FMOVRLZ	dis not found

	.word 0xbfa81c20  ! 898: FMOVRGEZ	dis not found

	.word 0xb5a80420  ! 899: FMOVRZ	dis not found

hwintr_1_31:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_31), 16, 16)) -> intp(1, 0, 13)
	.word 0xb3a4c860  ! 905: FADDq	dis not found

	.word 0xbfab8820  ! 906: FMOVPOS	fmovs	%fcc1, %f0, %f31
hwintr_1_32:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_32), 16, 16)) -> intp(1, 0, 38)
	.word 0xb5a44860  ! 911: FADDq	dis not found

	.word 0xb3a588c0  ! 912: FSUBd	fsubd	%f22, %f0, %f56
	.word 0xb12d3001  ! 913: SLLX_I	sllx	%r20, 0x0001, %r24
	.word 0xbfa489c0  ! 914: FDIVd	fdivd	%f18, %f0, %f62
	.word 0xb7a48840  ! 915: FADDd	faddd	%f18, %f0, %f58
	.word 0xb5a00040  ! 916: FMOVd	fmovd	%f0, %f26
	.word 0xb7a00560  ! 917: FSQRTq	fsqrt	
	.word 0xb9aa8820  ! 922: FMOVG	fmovs	%fcc1, %f0, %f28
hwintr_1_33:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_33), 16, 16)) -> intp(1, 0, 1a)
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0x8d94a0f4  ! 930: WRPR_PSTATE_I	wrpr	%r18, 0x00f4, %pstate
	.word 0xb5a50820  ! 932: FADDs	fadds	%f20, %f0, %f26
	setx	0x3a9688890000eb1f, %g1, %r10
	.word 0x819a8000  ! 936: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb9a81c20  ! 937: FMOVRGEZ	dis not found

	.word 0x8795a1a6  ! 940: WRPR_TT_I	wrpr	%r22, 0x01a6, %tt
	.word 0xbdab0820  ! 942: FMOVGU	fmovs	%fcc1, %f0, %f30
	.word 0xbf51c000  ! 943: RDPR_TL	<illegal instruction>
hwintr_1_34:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_34), 16, 16)) -> intp(1, 0, 36)
	.word 0xb1a58960  ! 948: FMULq	dis not found

	setx	data_start_2, %g1, %r19
	.word 0x859561bf  ! 959: WRPR_TSTATE_I	wrpr	%r21, 0x01bf, %tstate
	.word 0xbfa80c20  ! 964: FMOVRLZ	dis not found

	.word 0x8994e135  ! 965: WRPR_TICK_I	wrpr	%r19, 0x0135, %tick
	.word 0xbba80420  ! 966: FMOVRZ	dis not found

	.word 0xbf50c000  ! 969: RDPR_TT	<illegal instruction>
hwintr_1_35:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_35), 16, 16)) -> intp(1, 0, 18)
	.word 0xb5a84820  ! 973: FMOVE	fmovs	%fcc1, %f0, %f26
	.word 0x8d9561ff  ! 974: WRPR_PSTATE_I	wrpr	%r21, 0x01ff, %pstate
	.word 0xb7a84820  ! 975: FMOVE	fmovs	%fcc1, %f0, %f27
	mov	0, %r12
	.word 0x8f930000  ! 980: WRPR_TL_R	wrpr	%r12, %r0, %tl
hwintr_1_36:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_36), 16, 16)) -> intp(1, 0, 0)
	.word 0xb6944000  ! 985: ORcc_R	orcc 	%r17, %r0, %r27
hwintr_1_37:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_37), 16, 16)) -> intp(1, 0, 20)
	.word 0xbfa50960  ! 989: FMULq	dis not found

	.word 0xbf480000  ! 991: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xb5a58940  ! 996: FMULd	fmuld	%f22, %f0, %f26
	.word 0x8594e0f8  ! 998: WRPR_TSTATE_I	wrpr	%r19, 0x00f8, %tstate

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

	.xword	0xdba1ac58a7dc1e74
	.xword	0x7b21e7a9ab6e1a6c
	.xword	0x123165922a7bd187
	.xword	0x510a914e99541e08
	.xword	0x0699beee60d28020
	.xword	0x734cb3fecfabeb73
	.xword	0x252a2ac0e299e13e
	.xword	0xb8fb9c982ddcfdf8
	.xword	0xb72e83b26835ac6d
	.xword	0xbae7c209c6ae681f
	.xword	0xb781ecad731c2f70
	.xword	0xedb8838251004174
	.xword	0xd61510242ba81806
	.xword	0x7135ace701b7075a
	.xword	0x3dd1280e3fadd9a6
	.xword	0x6b644f408a68ce8c
	.xword	0x6bee50469de094e5
	.xword	0x1f33b9c785b14350
	.xword	0x211e135e5da98224
	.xword	0x1585c0590640e2d8
	.xword	0xc5e0dd4254137595
	.xword	0x34fed4e64764ec53
	.xword	0xcd73c07b56398127
	.xword	0x9de92cfc13f3c33f
	.xword	0x0b6d8bc2b5fe2f35
	.xword	0x75c496b28ba79e06
	.xword	0x1b29c69b8a74e5ee
	.xword	0xef7aac724ae58088
	.xword	0x84bdb3a19f7e99b2
	.xword	0x640e726b89b42ec6
	.xword	0x017fb3ee735355a5
	.xword	0x6660fb037ce4ae68
	.xword	0x3c4633c85737e8d5
	.xword	0xd01676c6ae5b7c61
	.xword	0x02cdec60454ba94c
	.xword	0xe09c12cb7d2fd2af
	.xword	0x2f7cf5137bb86b3e
	.xword	0x0356e7e54de6f467
	.xword	0x287174c890172b76
	.xword	0xee50611ea1d7dfc1
	.xword	0x1af14d27ccd55dc6
	.xword	0x2f9da39f92217d04
	.xword	0x973f7fbe1e0f905f
	.xword	0x5c36f2cbaec33c1b
	.xword	0x1b903cf7225df10f
	.xword	0x7935b5e579ba28dc
	.xword	0x781f834e4dd32d28
	.xword	0x8a06dd8828e11924
	.xword	0x29f287515d964494
	.xword	0xdf959d3137d3635d
	.xword	0x353b2ef192477310
	.xword	0xd3f278a6922034d5
	.xword	0xf013bbe26b6ca431
	.xword	0x221fa6b7ca13ebf3
	.xword	0x62d48fcd75e4e9ba
	.xword	0x528743cd966acc1f
	.xword	0xb9c477e0c423663e
	.xword	0xd311c5c9ac1aa718
	.xword	0x1a49cb5f38e7c8ca
	.xword	0x8bbc45b5f4ccd949
	.xword	0xd8fd274adde1937c
	.xword	0xf884cd59bc1e33c4
	.xword	0x9c5b43461917a711
	.xword	0x699edee69da6ed24
	.xword	0xb31530fae7ad5252
	.xword	0x3c74f2cd6521f93e
	.xword	0xe6106426e77c5221
	.xword	0x15d37bc403778a77
	.xword	0x1e3330f44eb3bb6a
	.xword	0xdfe2944c97e8ed75
	.xword	0x145403f8abb68c7e
	.xword	0x5c664335ab25fa4d
	.xword	0x017a544e261339d9
	.xword	0xa1a0e2967fcd90ed
	.xword	0x128ea1d5b143cb24
	.xword	0xfc53180e2f56c628
	.xword	0xdbb7638d60b91053
	.xword	0x436bf02a4775f41d
	.xword	0x89d67ba3f893d489
	.xword	0x12d4997d271bfee5
	.xword	0xf20fc421403b5243
	.xword	0x5c7a1174e860dbeb
	.xword	0xc366c7fde67f58a3
	.xword	0xd39e4533c2599589
	.xword	0x5c78618de2ac128a
	.xword	0xd61d47ab5fa275b2
	.xword	0x187f87b3095b9010
	.xword	0xab0c1f06587de0ba
	.xword	0xc968378c03063a5a
	.xword	0xa1ed10e40dba53dc
	.xword	0xb68c83cd41892bcf
	.xword	0xcd8056a27609d4dd
	.xword	0x322099fa3956a38b
	.xword	0xbdfa8c25da8590e0
	.xword	0xff19b1f421e63d4e
	.xword	0x69e66375176bb05c
	.xword	0x1e7a95e895ee1d16
	.xword	0xbc746ec36ba93e38
	.xword	0x3f686d02f2a6e7df
	.xword	0x2c60ff0bfcdcfa63
	.xword	0x2735a5c193068345
	.xword	0x2dab18bc68f00c08
	.xword	0xf347c18fdddaf0dc
	.xword	0x1ce1349409c68dcb
	.xword	0x7f32990b8604b852
	.xword	0x98399a4b2ece50f2
	.xword	0x5dc23e4ed4986478
	.xword	0x8a1625bb970bc8b5
	.xword	0x2df84ab10959e905
	.xword	0x05e1a4d854599777
	.xword	0xbd1e57e2bb040d28
	.xword	0xfc2ecb255de9f3a0
	.xword	0x460fcf23b63e658a
	.xword	0x0d85592caf0d3856
	.xword	0xa2adf07a17690b09
	.xword	0xb8794590d9a772ce
	.xword	0x4d0c6fc608fc6850
	.xword	0x9fb8c6fc50978eb8
	.xword	0xf4f091adb83b589d
	.xword	0xcf9244bd34d85f14
	.xword	0x880b9ebc246af15a
	.xword	0xa4fb24e2fdda04cf
	.xword	0x3f46b6514c6365d7
	.xword	0xa8791894274c6bcf
	.xword	0xc84ba81ee19f4e51
	.xword	0x06578ce8a6deee7f
	.xword	0x250a4bf4a64c91a3
	.xword	0x2e37537ce2c53a57
	.xword	0x5c3e649087969fd2
	.xword	0x0e7e007352fb9c6d
	.xword	0xc75c07e594c503bd
	.xword	0x319f8a3b576ccbc0
	.xword	0x74ed72b6174f144c
	.xword	0xd481c3ab7913e810
	.xword	0x2903995633ce8719
	.xword	0xebe34cfacb2e173c
	.xword	0x3057f884666650ef
	.xword	0xc2bd77eb01b173b9
	.xword	0xf4047e246f3aed96
	.xword	0x5bfbe8fa582d9af8
	.xword	0xa82176f36da7bcdc
	.xword	0x361659dbe07ce9dc
	.xword	0xc64230e12c4b68db
	.xword	0x58d6c58946bcec05
	.xword	0x8ee94f5dd266460a
	.xword	0x58f3d66dfa240015
	.xword	0xda478d90f9a6ecdc
	.xword	0xfed6648c60812f2d
	.xword	0x6d15935aa2fec62c
	.xword	0x3a70e7d3ae311c43
	.xword	0xf1d8e7c02d8ce0ef
	.xword	0x8470f7c36e23b9b8
	.xword	0x5bc12f5fd191f194
	.xword	0x33b6f8c04c324b4f
	.xword	0x4299bb774ac98b70
	.xword	0x6f0d1049bfb8cae7
	.xword	0x051ff7463f2e542e
	.xword	0x6c41cb1d7c3a04fa
	.xword	0x704832a675afe97b
	.xword	0x00d383fef71dda87
	.xword	0x0794967c8d1eef82
	.xword	0xb5f76bbf280e9f3b
	.xword	0xe89fffeb25890fc6
	.xword	0x64229f634bbfea7b
	.xword	0x225761154f9154a0
	.xword	0x5b16df0242554bfa
	.xword	0x4bd57529080f31c4
	.xword	0x56e2b525812c30a0
	.xword	0x2b68b225fc0fc523
	.xword	0x548166ebc03de015
	.xword	0xf346c6ac3fd5e571
	.xword	0x54170be2e5ebd800
	.xword	0xbe6e29921bc5d2f4
	.xword	0x338588f9fb2c5172
	.xword	0x339e03e16b2d3215
	.xword	0x7dbdda9c1130bbf9
	.xword	0x01fef26ea113fbb1
	.xword	0x44b911da29a80792
	.xword	0x9d0ad161139044a5
	.xword	0x377cee446d189899
	.xword	0xdb6e44af4f2569ab
	.xword	0xe3b4cde97f8e5997
	.xword	0x10020a21edaf9354
	.xword	0x045e6cbcd584f594
	.xword	0x318a59f3f0b00c17
	.xword	0xba1d2ea82b504f26
	.xword	0xc9a4d113cb579259
	.xword	0x485d1a1eee117611
	.xword	0xf441bd4a3c95da22
	.xword	0x3df3a98bbbd9a40f
	.xword	0xe146569cd1622984
	.xword	0xa2b796234c151fe2
	.xword	0xfcd8a87dad34ccff
	.xword	0x6637e29fad52de12
	.xword	0x28a75c4791b74fb7
	.xword	0x4470e949c49a61bf
	.xword	0x27723eebc2179c18
	.xword	0x9d346ced5a868ae6
	.xword	0xf9bcb81f5f1c3f24
	.xword	0x873c35d42787c4f4
	.xword	0xa1286f8214e74f92
	.xword	0x5e5c662b3ecbc625
	.xword	0xf4b42b83457f4372
	.xword	0x35fe02ea2e23bda7
	.xword	0xec15fa54bc3480d4
	.xword	0x74324a4e14a6e200
	.xword	0x3d4dad238596ed5b
	.xword	0xd577c77d44b123e9
	.xword	0xb0e52a8cf283a0af
	.xword	0x22392cb5e130d81b
	.xword	0xecb5d967e77279e6
	.xword	0x87e6dcd88ea4f0e1
	.xword	0x289ae4068a19bf33
	.xword	0x93e4067c83038c86
	.xword	0x7e92310e774324d3
	.xword	0xb65263596f0901c6
	.xword	0x685a505d1561a07c
	.xword	0x292a5387a53fd352
	.xword	0xb8609b629d7c32df
	.xword	0x53cd3cdafb32b0e3
	.xword	0xe39c7e9b2c046c56
	.xword	0x5fe3aeb16caceff9
	.xword	0xe07a287d0980f7b1
	.xword	0x2fdd8c62c1177deb
	.xword	0x906df53fe75e3ac8
	.xword	0xa4bdfbb32c070af0
	.xword	0x61c7bd8e2e1f2eaf
	.xword	0x28db67b9958187d0
	.xword	0x73107caa41d63510
	.xword	0x99cef828c9c3939d
	.xword	0x44f33b98b6bc435b
	.xword	0x7de570a18ea6e3f9
	.xword	0x9d0d3be40ce87c70
	.xword	0x3babaccc8114fde5
	.xword	0x05d4634e259cf5cd
	.xword	0x66371622b528878e
	.xword	0x5cf34eef542d83d4
	.xword	0xf3fff2d716a10b70
	.xword	0xe7b3e0884a653e76
	.xword	0xe2e5e607264ede8a
	.xword	0xe008afb8c761ad00
	.xword	0xf2842a7869fa8021
	.xword	0xedb5a40a37f2e9f8
	.xword	0x13fc40e8756721fb
	.xword	0xee815352e7a963f2
	.xword	0xd99980aedab5efb1
	.xword	0x577d2907a00ae87d
	.xword	0xc0a718c288a43171
	.xword	0x792a390645a62ec2
	.xword	0x62f747492d13bffe
	.xword	0x7b4466a49dc58513
	.xword	0x299f8d4d26411825
	.xword	0xcc7897167d4c8a23
	.xword	0x76581f7416d842d9
	.xword	0xf4e5261c4fb061e6
	.xword	0x811df1c752601b5f
	.align 0x2000
	.data
data_start_1:

	.xword	0x333bad1a72d2fc3b
	.xword	0xed0d383713369d30
	.xword	0x2edc56d4237ce7a5
	.xword	0x4eb0d5140323a80c
	.xword	0xbff401ceccfc9637
	.xword	0x7348f34643e92b61
	.xword	0x811e9ed6a5df8513
	.xword	0x2cb399eed1507abd
	.xword	0xe844c657103ef4b6
	.xword	0x9feb70529f3367f7
	.xword	0x9554ba8f65bd85cd
	.xword	0xa16e7ca795a8dfd3
	.xword	0xa61fdc7002496f4a
	.xword	0x6136fd6a21baafc4
	.xword	0x16b799bc536ad415
	.xword	0x7a553a21e2e9f6a4
	.xword	0xf02c203b8cc32953
	.xword	0xa59c0ea3aa8ed953
	.xword	0xfadd2aaa2709df6e
	.xword	0xf323b4f477e13b29
	.xword	0xf202f55a8e1fc309
	.xword	0x372ce57803b8bbf2
	.xword	0xd7a78bc08efbae57
	.xword	0x708d5ab9b63ff443
	.xword	0x3942cf32060a8b66
	.xword	0xf55b69ec131a910d
	.xword	0x506e9fb8eb52896e
	.xword	0x6e038d568482394b
	.xword	0x78baaf7e744eb842
	.xword	0xd7401299e15a39c4
	.xword	0xf21f3fa90b9208e6
	.xword	0x22014d96a98b6519
	.xword	0xdf03a34fa437a08b
	.xword	0xbbfb3dc4f756d0cd
	.xword	0x1373d56ff8aa7fc9
	.xword	0xe2fc9d0b0355387a
	.xword	0x1fd8a166a379a72b
	.xword	0x62dc15ea7e983f7e
	.xword	0x95791ac502068dd3
	.xword	0xf560eb65ddca0ff3
	.xword	0xab651d1a7728b254
	.xword	0x4a6295a398244bf1
	.xword	0x263c7f7fb547f15e
	.xword	0xebac680707df8ac4
	.xword	0x5333e2590670f87c
	.xword	0x477c8b93a41258e5
	.xword	0xbd712daef0f24024
	.xword	0xba1953c075f6a5f2
	.xword	0xbe64a7c56d4061cb
	.xword	0x5eba11e2f8e8bc54
	.xword	0x9a3fbfd1b943643c
	.xword	0x2d8704f059b67a4a
	.xword	0x2aa665a3b8e7d416
	.xword	0x9fb76432f7ff3e66
	.xword	0x4dba579a8e27560b
	.xword	0xc52a3c697b07c014
	.xword	0x22a7b937dd86613c
	.xword	0x9a3dd2b1832ffb63
	.xword	0x86022de28cc1c42b
	.xword	0x0bb308d450db196d
	.xword	0x5050dd056fa4b0ee
	.xword	0xec32fbd270036cce
	.xword	0x8359f2df1514976b
	.xword	0x36a2bdf78cece23a
	.xword	0x20aac30ee162b2af
	.xword	0xfb214c49ee45a9e5
	.xword	0x36bd2ffe95b5e826
	.xword	0x17695ed7d4bc4fa1
	.xword	0x680fbec4b6e6f751
	.xword	0xe4ee4f5feae32cd8
	.xword	0x3ba45dbc34bd9309
	.xword	0xdbe681e35b9d74f4
	.xword	0xd2c87874a9774e0f
	.xword	0x58a0b4458169a8d6
	.xword	0x6b3ea7e14d3d0518
	.xword	0x91d24cbfd50e611b
	.xword	0x1eaf6dde746803a5
	.xword	0xde730eb525ba39dc
	.xword	0x7881a9831ad57d43
	.xword	0xa52dbe89fc40931c
	.xword	0x9e7bc84fc9dfb9bd
	.xword	0x8b930f5bed61ffdf
	.xword	0x7a7d90050648483a
	.xword	0xcb07e7f67ed0470a
	.xword	0x914e49ca7017538d
	.xword	0x91fc146e81a8ab13
	.xword	0x578147e0c362cc08
	.xword	0xcabff1333d2c4035
	.xword	0x81f8b015cd411b04
	.xword	0xd5983b229c8cebc2
	.xword	0xf51ab45f7f4a640d
	.xword	0x0f686572fce902a6
	.xword	0xc4f3689f2e8990ef
	.xword	0xae2569ff6ce9a746
	.xword	0x052f94fa9f2bf4c1
	.xword	0xdc02a91dc215d053
	.xword	0x02cace1f03366f7b
	.xword	0x8f3cc80ef506aac6
	.xword	0x36f443b597126694
	.xword	0xb8e741c941982167
	.xword	0x55cee1c68095efa9
	.xword	0x72a328e1d2337f33
	.xword	0x2ed5197b184b2093
	.xword	0x99e208fbf757a76b
	.xword	0xc73f19bcfb784da3
	.xword	0x1113f6238cdf529b
	.xword	0xcb9bd35265ecbf34
	.xword	0xcbf20632b8382ca5
	.xword	0xf1d736758fea9534
	.xword	0x9178b70a058c16b7
	.xword	0x243e7e65735dfa01
	.xword	0x66d18258d8056376
	.xword	0xfecfe52203962e6f
	.xword	0xb59b0ab92ad4d430
	.xword	0x4a5c893e3023e078
	.xword	0xbe331c4ee1ebf0b6
	.xword	0xb73ce0b29ce44f23
	.xword	0xffa4b95dc57a39a1
	.xword	0xa870bdc608524541
	.xword	0x1f239c5dcf4e5720
	.xword	0x48c06923137f7259
	.xword	0x79ea7255a2dbff10
	.xword	0x4debf32aed9e91bb
	.xword	0x636dc2122e1116ef
	.xword	0x56dcc3705c37f694
	.xword	0x0e8640a2b20ec361
	.xword	0x62508afc75500ecd
	.xword	0xad774279f7e1140b
	.xword	0xa642bee6d287c585
	.xword	0xd453ab80d5554182
	.xword	0x2c313b384b9e3a5b
	.xword	0x8715738714618d50
	.xword	0xeb23dcdafe1d7465
	.xword	0x5dc9ef826ff935be
	.xword	0x9e679f0d3d5cb291
	.xword	0x0ca88f549e1d7707
	.xword	0xc74467dbc8017243
	.xword	0x91d5eb695bd347ce
	.xword	0x1ccf991736698d62
	.xword	0x7e03659d03ca21b7
	.xword	0xad7d17f9bb573c30
	.xword	0xfa7d81102f6ab9eb
	.xword	0xdafb5b27ec3fd1b3
	.xword	0x67318f22ae87edc2
	.xword	0xc10ea9516a15f971
	.xword	0x980fce20d2ee348f
	.xword	0x8b27f3821f46775b
	.xword	0xb6dccee70ad72013
	.xword	0x5d01d48cb460f769
	.xword	0xc542250a3ca5869f
	.xword	0x43091ae2f86e48f7
	.xword	0x27f097f9f5983939
	.xword	0x790b89df43a7b34a
	.xword	0x6b1a889d6dbb2b4f
	.xword	0xfd59a4c4d0fd3781
	.xword	0xb3aa1f33a6871585
	.xword	0xecc7e99b33db48ab
	.xword	0x358c479aac2ef8d6
	.xword	0xd0849b48f2384389
	.xword	0x3e69b077e132322f
	.xword	0x58f6dd7497b04be8
	.xword	0xa8d5909946ecbabf
	.xword	0x6595b95a2bcd590a
	.xword	0xca2b7631e80723f6
	.xword	0xc2699559dc959d10
	.xword	0x58ef8993f10f800a
	.xword	0x542be0525e38c0b7
	.xword	0xe272a61ea111f623
	.xword	0x0c084c82e924e4aa
	.xword	0x2cea56d1520aa0df
	.xword	0x7134d03d65fc38f3
	.xword	0xd56b0c7b3e7f37b8
	.xword	0xf1826283d5ec0a4b
	.xword	0x47cdc8006f76d19a
	.xword	0xaef6e9eb12658d88
	.xword	0x4f99ed62a19e5a64
	.xword	0xc2e0678ee8d0f02b
	.xword	0xc491ac23a201ae46
	.xword	0x65e3af994d911182
	.xword	0xe91b18f743e85801
	.xword	0x7b7c71f5c0b72581
	.xword	0xa0ca56089d67690b
	.xword	0x844fc3ed555d9249
	.xword	0x5694c44e5f96e946
	.xword	0x96fab531d31c8885
	.xword	0xdae57e05a13e1407
	.xword	0xb30a8c9f10b16fd3
	.xword	0x6325cfdaa647abfd
	.xword	0x46d65cab3c67a302
	.xword	0x08286b21b109d1be
	.xword	0x5a12aeab59d9d7c6
	.xword	0x019cd980fe6a6e4e
	.xword	0x0f155302dba84cf5
	.xword	0x374bd6ab32a2d87e
	.xword	0xcb90dbda88c48c19
	.xword	0xc66ae14769553bcf
	.xword	0x6ee1284394f6f0d6
	.xword	0xa8d5a74d46d6ae6a
	.xword	0x6ed05264193c1c5b
	.xword	0x96879a3ec9fba9ec
	.xword	0x7001dcc07c6df5b6
	.xword	0xd65ce94a29333bb2
	.xword	0x753b245be53bf0e7
	.xword	0xa7846fe3c9a52b48
	.xword	0x693cce7a97e13109
	.xword	0x32cc6bc92f64a52b
	.xword	0x65b20b9ccfab4a54
	.xword	0x170994f921fdd171
	.xword	0xa6889802e3b7d993
	.xword	0xf3d4a106330fe09e
	.xword	0xdc068cbdf2745706
	.xword	0xe1b5fe0f5bd05007
	.xword	0x0d34e9778f0c16b0
	.xword	0xc82b0cc80aefad13
	.xword	0xd44bf1452f3e0982
	.xword	0xbc88ca4ec5212bc1
	.xword	0x0eb69315b7d34685
	.xword	0xb3afa00bb1afb21a
	.xword	0x1d5e7e73b642c7ad
	.xword	0x52e3c734053c2b2d
	.xword	0x146f27d4991022be
	.xword	0xb3fd961aeef651de
	.xword	0x24476b1248fa60ba
	.xword	0x27b70b2fb37b4665
	.xword	0xd47df41e0a30afc5
	.xword	0x47b792f2dead0e30
	.xword	0xed2202cf17d33f06
	.xword	0xf1246c5f3159c717
	.xword	0x9e6dfa85ab47c60c
	.xword	0xd23efc75b6d69a86
	.xword	0xd6378b8ecd7de416
	.xword	0xf308c69ec2db55ae
	.xword	0x5392ae8e8e59b720
	.xword	0x41a007e680511a7c
	.xword	0x2b2488122e5686dd
	.xword	0x3eae2efc92d918a4
	.xword	0x3a7f031fc5c726cd
	.xword	0x3ada898b5bd14071
	.xword	0x8e2a1b59d60bf4dd
	.xword	0xb6641cdb8920d549
	.xword	0x6a30669754baef0e
	.xword	0xa20666644304d8dc
	.xword	0x5565a3e26e4bdfc0
	.xword	0x18dcb080e47a0ca6
	.xword	0xda5731251287214a
	.xword	0xd36830b4768c744c
	.xword	0x48b3a578ac196f1d
	.xword	0xa94b9cfbf5d95042
	.xword	0x1b1e78bcbcd57701
	.xword	0x6b8491818404f100
	.xword	0xfbee2b0814e45662
	.xword	0x1355cff1dbed8a06
	.xword	0xe84828a8873020d5
	.xword	0xb934073fba82011d
	.xword	0x415064f49edd8905
	.xword	0xb447f89affd011c4
	.align 0x4000
	.data
data_start_2:

	.xword	0x051241465d4716d4
	.xword	0xf25490614f43d1a2
	.xword	0x3d03cbe0132bd8df
	.xword	0xf044b7ccfe7185fd
	.xword	0x4ec5323c86c0e2ea
	.xword	0x042ce320d2027da8
	.xword	0xe84cf472848cc0cb
	.xword	0x242adf963faa9aa9
	.xword	0x34edc9a369e9ce0b
	.xword	0xc2afe007bd174464
	.xword	0x1c269fd294919a95
	.xword	0xd3b83d47b11d4fd6
	.xword	0x09e06bd52248cfe8
	.xword	0xaf041d7e21d00ca2
	.xword	0x82faeff30eb563e8
	.xword	0x7a5bb3c1b8dddb0a
	.xword	0x9995b213adc91b47
	.xword	0x07d2c6209b382375
	.xword	0x8e2b4b6f37dc0997
	.xword	0x6848f3e12af18373
	.xword	0xefdc254b5156ae0c
	.xword	0x9a943c4eaf0c6703
	.xword	0x70e846907399cb0b
	.xword	0x334ccd8a6bb078e2
	.xword	0xb75e082a3af69c1c
	.xword	0xe4e0cded5b515c4a
	.xword	0xb20ec8cd9250eb78
	.xword	0x8d8cb975ddba53fd
	.xword	0xb19ccbafbde9fa12
	.xword	0x9ff8497f3178c4dd
	.xword	0x63ef130e67889fa8
	.xword	0xc2042df1b71b8269
	.xword	0x001a2acc90b67364
	.xword	0x44abae497d172ae4
	.xword	0x6ba1cef2b3bd229a
	.xword	0x37b5a2dc52c94654
	.xword	0xac0c749fe886d66c
	.xword	0x086fe4f761325a37
	.xword	0xa923c11a11bf9996
	.xword	0x85dff52863a17dd7
	.xword	0x707bd9fb1ed01b3d
	.xword	0x83c09f29263032e4
	.xword	0x6747ee84907f9b3b
	.xword	0xaa899d9ab663c999
	.xword	0xd5dc14204b794709
	.xword	0x5ce1abf397b63338
	.xword	0x862367a8f23c88bc
	.xword	0xb6d51f95c7d05897
	.xword	0x72d48366da4893f9
	.xword	0xbf7cb2d76991a459
	.xword	0x9cfb20abd4880e51
	.xword	0xa8f7b54d445cf18f
	.xword	0xf2adcaefed2c1aa5
	.xword	0xb5969da9923e78b2
	.xword	0xc2808befdfb9eb1b
	.xword	0x58d4fea03c155018
	.xword	0x382e4bcddd564950
	.xword	0x22ad94b4ffef8b7e
	.xword	0xccbfccb8cfe30908
	.xword	0xdae349c02df3fb4d
	.xword	0x03f02ff430465755
	.xword	0x858a9415813d316b
	.xword	0x86a0c36ab7169d92
	.xword	0x8649d9b0aa1471ce
	.xword	0x10ed169f858e9669
	.xword	0x7d14c9009ad4d414
	.xword	0xaa3404cef7bbb03f
	.xword	0x8febda0150a3ac33
	.xword	0x1e4958d61807edb6
	.xword	0x866a09e1aaa543e5
	.xword	0xdc21fe58ee3967b2
	.xword	0xd051de37cd7c32c2
	.xword	0xd1208555b92e4e1f
	.xword	0xa9eeecb978ad4157
	.xword	0x126d74f40f9fca01
	.xword	0x49fd00bbfc9fc043
	.xword	0x39498f1dff67fe8d
	.xword	0x6ccf867b507cd43b
	.xword	0x8d517f25210dc5f7
	.xword	0x57f4de6931cd53b4
	.xword	0x5e506d8c04296bce
	.xword	0x31b951c851481672
	.xword	0xe3a5d9113f08977f
	.xword	0xe4bae3bb68c56f8c
	.xword	0x59f4a00797d690b5
	.xword	0xe8b5acd86cadeb71
	.xword	0x7d4275f347651361
	.xword	0x050229d3bea8c7b8
	.xword	0x5a6009bc78cb6ef3
	.xword	0xce25f537681fc215
	.xword	0x6df659f142a968a0
	.xword	0x1b18292ee462019d
	.xword	0x0057776771ceefdf
	.xword	0xffd1f2539a5be517
	.xword	0x49cd40368aef7785
	.xword	0x1523ef91aed09968
	.xword	0xcf485a8c8bf35283
	.xword	0x024790bf527cde0e
	.xword	0xc41119143593783d
	.xword	0x061edcf523d7c0d0
	.xword	0xab4e0df5ad43d2f3
	.xword	0x0105fd19a45defac
	.xword	0xf382436ba59a3e39
	.xword	0x4bedf7682ed1ddbf
	.xword	0xd3b53a789e4f0a1c
	.xword	0xadaf35218f35beb8
	.xword	0x42225fb6e195d644
	.xword	0xe6a6145acd6e5d71
	.xword	0xd19b6b5e18875fbe
	.xword	0xb5a11cf84cf8052a
	.xword	0xf2dd10dece543f76
	.xword	0xb8e76a7eb94b68fa
	.xword	0xfd116fcd74cdf1aa
	.xword	0x59dbdcd4c3cd1240
	.xword	0xb9f37c13959dfce1
	.xword	0x746e126caf90850e
	.xword	0xfb76ff2e3659f1cc
	.xword	0x540e6aeea796252f
	.xword	0x9637348107218261
	.xword	0xd8dda54e2cf8e807
	.xword	0x608e7a3e10f4dbac
	.xword	0x7304a7ce851e6649
	.xword	0x9f8bb423b7ca8e26
	.xword	0x389b11fb2fb6bfd2
	.xword	0x2aec9a6411ac2f7a
	.xword	0x3386aa6609009aed
	.xword	0x895f05f5bedf901f
	.xword	0xb4df97df7ab727c0
	.xword	0x7c1e5f1069429dd2
	.xword	0x1030e5af4c8869a6
	.xword	0xfc84d53f5374aef5
	.xword	0xce886bf3d2dc21cb
	.xword	0xbcf4a6d387700bf7
	.xword	0x0b51f1ec1cc4f305
	.xword	0xca53033b02356afb
	.xword	0x6fe489806a62a313
	.xword	0x4356605e692132cb
	.xword	0x57a01f61dbb48d04
	.xword	0xc8126750ec1104ca
	.xword	0xa6b5e3f3107545a5
	.xword	0xdd76e493d41e81d2
	.xword	0x3b98194b57d2a339
	.xword	0x53500cf6a21e3fec
	.xword	0xed40c8da303b1e46
	.xword	0xe1a872dc809f4ca6
	.xword	0x561415fe3c0da1d4
	.xword	0xd5eaed359980c6db
	.xword	0x46e63f0ff0443695
	.xword	0xc2f38ef630de96c1
	.xword	0x1d97477d088fe01b
	.xword	0xf353cb50b817b40b
	.xword	0xa54caa15a06c2997
	.xword	0x6dd3ab00bf569aa3
	.xword	0x33f8b89958d2cc75
	.xword	0xa43a882ecdf09735
	.xword	0xd5407cdb5fe42e22
	.xword	0x3ad522b26798b633
	.xword	0x90837c53a6d26a55
	.xword	0xbfd19a2dd45a8ba5
	.xword	0x9adb1a29afa6d342
	.xword	0x73da79e3ea6d17e5
	.xword	0xa2c1a975ce08e776
	.xword	0x7c331b5ce800a4fd
	.xword	0x7d49fd2403f2918a
	.xword	0x7a6d1d7e187b1c73
	.xword	0x882f4054bdb08229
	.xword	0xfb141c74e1e7185a
	.xword	0x4f0812ebc674cea4
	.xword	0x091204d8dc05137b
	.xword	0x178ffde21643bdef
	.xword	0x52d719c6d44a308c
	.xword	0xd680ce78466a978b
	.xword	0x8e3cc0a84ccfe2eb
	.xword	0xcbb5fd35480cb160
	.xword	0x9ca7ea217083e739
	.xword	0x3b1daffc05a12c45
	.xword	0x923a1e29cac5089b
	.xword	0xe5d8b6b1c4f53735
	.xword	0xf7513769a6795c74
	.xword	0x58baa5176e224ad5
	.xword	0xc05b8bc62ab636a9
	.xword	0x79445d8a4d57dd1a
	.xword	0x088f6b68d8011c73
	.xword	0xd8cb831eab128632
	.xword	0x2d7aac0e51d69cbb
	.xword	0xdc4f7677def46352
	.xword	0xc577846d76969a11
	.xword	0x883357e29c5f7443
	.xword	0x8261aaedecd94f6a
	.xword	0x0dea1f4e8e950a15
	.xword	0x5d44e3d19f4553ef
	.xword	0x3dbf1029d65aad43
	.xword	0x43b825bbeb5a5185
	.xword	0x0f8bde613f8a2099
	.xword	0xfcc8c01833c02dee
	.xword	0x0191f18cba7224de
	.xword	0xa154eb27c7899923
	.xword	0x87c0787a1a5dc6e7
	.xword	0x720980f8b56ab177
	.xword	0x147ad79ff8641d72
	.xword	0x002833006943f41e
	.xword	0x4f33f599c4b4de9d
	.xword	0xa45900d09a7315b5
	.xword	0x76ada5c838ba0cf7
	.xword	0x680bb20c6b88e8ab
	.xword	0xf8f3e93eff18f28d
	.xword	0x33f4902ea1e03fca
	.xword	0x3989572f4b6a347d
	.xword	0xfd2f86c9de86e504
	.xword	0x052a51d6b452f7c6
	.xword	0x6142ab209e1fdfe2
	.xword	0x0f1f489624ff5e66
	.xword	0x3bd6e5b664ba7bbb
	.xword	0xbf1988186b4d2657
	.xword	0x3d80cd624a0b5bf6
	.xword	0x82dc978c911b558c
	.xword	0x82ad49fe0a0189e7
	.xword	0xc97eb8be908a0466
	.xword	0x4043f02f049c6675
	.xword	0xbb14d0ff9654e0c7
	.xword	0x75dcbb37622cfcb3
	.xword	0xa0bbc49517341f22
	.xword	0x028f5ac356e31a6e
	.xword	0xb9258fe27afe4ee0
	.xword	0xfb0a99ab64de6bb6
	.xword	0x8a0fe51f8332f76a
	.xword	0x0f46ec6a515e9d86
	.xword	0x63b4c10a1b5a5918
	.xword	0xbc75ddabf2e0536a
	.xword	0xa007ac1635ca6507
	.xword	0xfb67e3b716eafb44
	.xword	0x7c568c3a0050b8a3
	.xword	0x5760c9f87d49fd45
	.xword	0x598067824649527f
	.xword	0xa7982b656d3d2537
	.xword	0x0efc15560943f3ed
	.xword	0x5dee063bb115f392
	.xword	0xd742eb4172952785
	.xword	0xc8ae4b5751bb3c0d
	.xword	0x5c7c842c105669ed
	.xword	0xc33ce5bf748ee2b3
	.xword	0xb52a871fc490e04d
	.xword	0xf6537b0f5ade230c
	.xword	0x3d3d057852933f36
	.xword	0x890f70278fd676cf
	.xword	0x82fb5db8d67bc8cb
	.xword	0xb03fde6e55933fcc
	.xword	0x8836b014bae99b26
	.xword	0xac304770308af5c4
	.xword	0x043c3c1ec22d6eb2
	.xword	0xc65c4dafda98abb4
	.xword	0x8eaf6808e20de71d
	.xword	0x126ebdede1b366f7
	.xword	0x04ed891cdc476881
	.xword	0x34db0e751033d474
	.xword	0xeda371fcfd9036ee
	.align 0x8000
	.data
data_start_3:

	.xword	0x683cd7d265c6e9a7
	.xword	0xfc7111da8391ceba
	.xword	0xd5f50889bbdddad4
	.xword	0xba2ed6399ab6abc9
	.xword	0xeb3c821a94b2a138
	.xword	0x34e6d8a47571de03
	.xword	0x4539ffd90956ba3d
	.xword	0xcdcc180b4077ab87
	.xword	0x3538b8867eb21da3
	.xword	0xb0b0f4e913eda281
	.xword	0xdff052023af6059e
	.xword	0x16c33e400d1c4c66
	.xword	0xc5feb22108a994c3
	.xword	0x17beac53c94d5356
	.xword	0x4b63201b27edad56
	.xword	0xa7c16e1b7e419615
	.xword	0xeb8083b779b624d8
	.xword	0x4263c94e75ff11b7
	.xword	0x05527a129920bbc5
	.xword	0xd2c871820b5a1953
	.xword	0xbc5281f5114e3c9f
	.xword	0x3c9e37943a097289
	.xword	0x009cecc6c240931f
	.xword	0x49a174b0f0822e6b
	.xword	0x4f7ebe9e47ed2d22
	.xword	0x523bed01559690b9
	.xword	0x5152ae2470a50006
	.xword	0x0b9515391ff55f96
	.xword	0x3b4487c4ad8515ca
	.xword	0xde459c11260eb036
	.xword	0xeb242884f7065bbb
	.xword	0x32d335792b16f6de
	.xword	0x4ee096ce5a56f056
	.xword	0x00075073e288cf7f
	.xword	0xf0a3042d6b7d38c3
	.xword	0xd5194ea9fb5a43da
	.xword	0x269c621e8a203697
	.xword	0x46fcc6ec5f1b5d1d
	.xword	0xba1fecfc86bb25b2
	.xword	0xd4a777760fbb354c
	.xword	0x3704a3480ed6ab44
	.xword	0x22d43988900517d3
	.xword	0xe92ee886642d9109
	.xword	0xaf545db15f7ec6b9
	.xword	0x41a75569cf788d56
	.xword	0xcfb8623c33f86acf
	.xword	0x282f1520fe848ce8
	.xword	0xdab6a57b0a8d63f5
	.xword	0x131eaef36d7363fe
	.xword	0xd469b41e5f19e9b3
	.xword	0x54a5b4333e17c70a
	.xword	0x6b7fc1e773210665
	.xword	0x856b6f08b1e1627f
	.xword	0x7e89b80056dd4857
	.xword	0x463620648918f780
	.xword	0x087015e20a86e78a
	.xword	0xeb3f32b755134104
	.xword	0x0688b76c218b93a1
	.xword	0x2c77f7ff2d0ac4f4
	.xword	0x1077afd5ab8fe124
	.xword	0x4c2c75bc5b74704f
	.xword	0x01b06cb6c61cee5c
	.xword	0x92bade372b4f38c7
	.xword	0xc8d81541b4639b44
	.xword	0xe94780d2b86b4c55
	.xword	0x07173f069896131b
	.xword	0xf4f04c487c44f562
	.xword	0x14cbe7d94c72f8e8
	.xword	0x931443c6fda5adf1
	.xword	0xe640a8cdbfd20feb
	.xword	0x0edd894197e807a3
	.xword	0xff619c8feae2c48b
	.xword	0x1b2d6380ae409a54
	.xword	0x3417e055f32ca0e5
	.xword	0x08da3c12b1ddb744
	.xword	0x12c5be1eb9fca2fa
	.xword	0x865d88fdcacabbaa
	.xword	0x3f911f9c242e22f3
	.xword	0x006c5b1c092aff1d
	.xword	0x6765ef4575259c3f
	.xword	0xd741c2d53efcd243
	.xword	0x7b2cd62da163420f
	.xword	0x8d3cc8d199cedcce
	.xword	0x3e601072179603d3
	.xword	0xde6915c889d1af2d
	.xword	0xa07265c0438b2953
	.xword	0x56c202ae0536de77
	.xword	0x2a61d364308e4a47
	.xword	0x8403407091a19350
	.xword	0x228c5e93ce1d524e
	.xword	0x0da2a8c9ee90844a
	.xword	0xea71313ba0490437
	.xword	0xa9f7decb417a3a03
	.xword	0x9e9ac1585d12ecac
	.xword	0x8021215584d36610
	.xword	0x176e890d1d58033c
	.xword	0x224a7a21b2bdf5fe
	.xword	0xf0a3eb751d8a34ad
	.xword	0x27b6b267fd550fc4
	.xword	0x28051f3ec5aa5f15
	.xword	0xa12a34dcfca7c3b3
	.xword	0x250fbfa65b2dcbdf
	.xword	0x0c9fc8508d750357
	.xword	0x7302ac3d97e55e77
	.xword	0x278a23fcf4e40585
	.xword	0x36b327015a9825af
	.xword	0xfbefea988dbf5f36
	.xword	0x391a101518fc68e7
	.xword	0xe6267f9fbb0cc445
	.xword	0x932cc19a175998ef
	.xword	0xfd9b649b5d2961b0
	.xword	0x15085f2457783666
	.xword	0xa65559e64a78907b
	.xword	0xfd67ce0882e7c977
	.xword	0x23ec54905a592131
	.xword	0x928171482ce0a5db
	.xword	0xeb6f29c9f05284e7
	.xword	0x60c1eadfa33aabe2
	.xword	0xbeb4bfedd8b2796a
	.xword	0x685734e222df25c9
	.xword	0x547b5dc9bd28234c
	.xword	0x94b1138972f27872
	.xword	0x3a228de227154258
	.xword	0xda8f6ee3e146d947
	.xword	0x09126d1a81a23ab8
	.xword	0x90791f09087d5e5f
	.xword	0x13902583c35fcaba
	.xword	0xd3573d089c8da26c
	.xword	0x1c7eadfbd3ee4a4f
	.xword	0xc2185912bd779a5a
	.xword	0x37712fa99ab5ece8
	.xword	0xe3227f31404d0840
	.xword	0x53ddff672e62e095
	.xword	0x731f00aa9be6eed8
	.xword	0xde8f969589c26ed3
	.xword	0x5d62067c062c8fbb
	.xword	0x2b40e2edb58c482b
	.xword	0xad8947c7aafbab63
	.xword	0xd10d96d12a15208f
	.xword	0x5fad6c216dc13bbd
	.xword	0x393a7c871190be8a
	.xword	0x1d9775dc16368a35
	.xword	0x811077cb42598d40
	.xword	0x5f90f0b2135ee2f5
	.xword	0xc0054f9e750ac88c
	.xword	0xc031fef225c47323
	.xword	0x7177d6e3ae9a472e
	.xword	0x9b9123d7bf953958
	.xword	0x4c3b361d1cdd1982
	.xword	0xe2223310d05f3c71
	.xword	0x4eeb4a76719e64f2
	.xword	0xd7a2d4ec5b0fd30c
	.xword	0xb26056428ba78b7c
	.xword	0x95d5174011b53a76
	.xword	0xef3b42fb94fd3172
	.xword	0xa218516ac3f5fce4
	.xword	0xc83d9b769401e6f5
	.xword	0xda91a1ea08aaecf1
	.xword	0x2cca62870c770da3
	.xword	0x2f9eba3b70869937
	.xword	0x9f755870c78f366b
	.xword	0x531826c7b49119b4
	.xword	0xf22f95ec9bd3a051
	.xword	0xe2beefe932e676d6
	.xword	0x7ee1cd49c6d2900b
	.xword	0x03a2b70f170ffbd0
	.xword	0x8ebabe3c05e05aef
	.xword	0x12f5c58298b2ca25
	.xword	0x4394996f9a475289
	.xword	0x8124401889e38afa
	.xword	0xe015bca439b98411
	.xword	0x7a336710115e66d9
	.xword	0xf26710a5ea564afd
	.xword	0xc3d63e27a504bb31
	.xword	0xfd51cda584328d6f
	.xword	0x45044cbda132c276
	.xword	0x610d2c38e1d2d89d
	.xword	0x0bc6815666726256
	.xword	0x8778577615cd6827
	.xword	0x4df4d132376ebc69
	.xword	0x4f0d0d347e3d053e
	.xword	0xf7ac9a9e948755bf
	.xword	0xb5267904365687c7
	.xword	0xe2843f5135011f21
	.xword	0x260caf44e6914b88
	.xword	0x50a16186d3370580
	.xword	0x1aa1a29b00460c3d
	.xword	0x01a1bdf342c1469b
	.xword	0xc7b74f3aae6e725d
	.xword	0x6b9a5d5da075ad96
	.xword	0xccd3cea31c603648
	.xword	0x5082c196a039e1a2
	.xword	0x2c645cbc264df165
	.xword	0xdcbbd8c95b1b9e71
	.xword	0xc1de3a3723d2dd52
	.xword	0x9cf2ddaa8cd12aa8
	.xword	0x3513b3616fd876d8
	.xword	0x029ace151a53839b
	.xword	0x3ba51dee56bd4a1f
	.xword	0x94932347bebe7f63
	.xword	0xa357904409c88c42
	.xword	0xd1d26a26597e9d41
	.xword	0xcaad7caea380f6a8
	.xword	0x0c00f0b9178ba0b3
	.xword	0x92cb1c930a53685b
	.xword	0x3d692ba7731142ee
	.xword	0xc3aac1b028aa74f1
	.xword	0xbe07616fb606d8c1
	.xword	0xd3fee540f7f4b9ab
	.xword	0x34d48547f99fab2a
	.xword	0x76955721bf6f6088
	.xword	0x92d9ad1e60f7c428
	.xword	0x826e4366220fd5db
	.xword	0x08e2fd6fab0f3388
	.xword	0x6cdd5499e20b48f5
	.xword	0xfff52ba2271adc69
	.xword	0x9061fd27dc312988
	.xword	0x556ec35229fd0089
	.xword	0xbe6a927a214100f8
	.xword	0x954950e0dfcd6f46
	.xword	0x52d6bc087fe5bc41
	.xword	0x6597beeb1f2ac53a
	.xword	0x1c64465c47b4f4a7
	.xword	0xd4a458463e95fdc8
	.xword	0x970a01d2afccc057
	.xword	0xbce4b994030b0dd8
	.xword	0x052efc0b25fb3e89
	.xword	0x4dc8ab040717aec3
	.xword	0x018343c44c093e46
	.xword	0xa0a3f49f3f105609
	.xword	0x337603550a71cf4e
	.xword	0x7652b7da7c89fd1b
	.xword	0xc6c2828893d87fc7
	.xword	0x5b18fb9b393f31b0
	.xword	0x07181d01787f1c6e
	.xword	0x116328618c9041d5
	.xword	0x83036107a1198696
	.xword	0xd72a8a665c5d26b2
	.xword	0x3917807debb7c67d
	.xword	0x690b481b71778b44
	.xword	0x3dfd9612f77b73cd
	.xword	0x72821a8f8fdbe471
	.xword	0x2392a72f96bdd94e
	.xword	0x5fe2dae747939228
	.xword	0x88ecc9d50479eeb1
	.xword	0xb4c722889061cbe0
	.xword	0x38b00e4f2c3fd649
	.xword	0x1e3f9cdceb35b225
	.xword	0x80d83e98543821ce
	.xword	0xdf2d0e64d71b1c8c
	.xword	0x19fb5d5d182007fb
	.xword	0x127ba916dc40c6ba
	.xword	0x430b867b05c40df4
	.xword	0xaa50503beb1ff5d7
	.xword	0xf665c4b9596307ae
	.xword	0x69d130389c078155
	.align 0x10000
	.data
data_start_4:

	.xword	0x68a263fe2073a4ee
	.xword	0x10e95648db43a0d4
	.xword	0x2e0259269f83e8e3
	.xword	0x27bed7555a9e07ae
	.xword	0x710817609f137684
	.xword	0x57e76d1700625239
	.xword	0x2ca697c1dce52fbe
	.xword	0x1f2621ae7fd1f9dc
	.xword	0x2ac40c8014e0cda2
	.xword	0x556b001249bbd9a5
	.xword	0x44416d4a62c69394
	.xword	0x8e810a61ac13b1ba
	.xword	0xe4271f8fa85ead36
	.xword	0x38dfba7d6d18a0f7
	.xword	0x2575865871711924
	.xword	0x71b8b69355b605e3
	.xword	0x40ba93432e526ef8
	.xword	0x0c9574235d994788
	.xword	0x1c2d497e7e7370c9
	.xword	0x6025e9a30c339e7b
	.xword	0xca2835c7c8e91ca6
	.xword	0xa10ab0a8c0ab4742
	.xword	0x870caf89a0858edd
	.xword	0x78fa1dd98ec53c2b
	.xword	0xac09a4fc0cb46c1e
	.xword	0xe0736e9c53055a27
	.xword	0xf281cf9ea9759068
	.xword	0xb6ad731944a0884b
	.xword	0xf997c644b0e65195
	.xword	0x98bdd0682c396d5c
	.xword	0xc5837167271caf1e
	.xword	0x3440d60453dd2875
	.xword	0xcf433884fd2742dd
	.xword	0x1450a8a9a031d519
	.xword	0x2482c59527dc3132
	.xword	0x9797dfdb02751973
	.xword	0x662ad36600751d23
	.xword	0x4a73fb684b77e08e
	.xword	0x176359f33b4a6f14
	.xword	0xbcddc334de2ac966
	.xword	0x6765c20bd8fd9463
	.xword	0xa4fc55922830faa9
	.xword	0x8ae4e989d2057610
	.xword	0x2e7773f6fd4bb7c5
	.xword	0xa4a033a469666864
	.xword	0xdb2772342da8d156
	.xword	0x57c344546b9fe2fc
	.xword	0xccfabdaf8fcd00b7
	.xword	0x587b785e354cd397
	.xword	0xd19f287e6af693aa
	.xword	0x0967f493d3cbb919
	.xword	0xe8a11fdf1634f0f1
	.xword	0x269d7739e75acd2f
	.xword	0x279214e576964dcd
	.xword	0x6e806f532a2af74b
	.xword	0x79e2a4411aadc159
	.xword	0xd49709165a0f050f
	.xword	0x672e9be3f15cd072
	.xword	0xcdf4c36df5da7824
	.xword	0xe7cddb9468931eea
	.xword	0x8a2d29087d437728
	.xword	0xf4439ce3716daf6c
	.xword	0x61e6e5ab51a7969f
	.xword	0x5bc6e4c94acc6e50
	.xword	0x1e904e6def6aca95
	.xword	0xc8395ac07560fcb9
	.xword	0x7fa2673ba90c588b
	.xword	0x022c0768a65143c5
	.xword	0xa7d2ae1497f69964
	.xword	0x126ddb75f6e8447b
	.xword	0xf3f2772171af605e
	.xword	0x6d425f31d0cea88e
	.xword	0xbb7b97a3d97620b0
	.xword	0x356a7cee11f30e41
	.xword	0x8d8f6830773b0535
	.xword	0x8981c38384577b06
	.xword	0x8a75121601915de3
	.xword	0xf7f97b1d878205c1
	.xword	0x14ac8b3105843789
	.xword	0x1511e63f01e08393
	.xword	0x98a8e30a562f6269
	.xword	0x330e93ef0de6b287
	.xword	0x953a906023fd0192
	.xword	0xc3ad425c35b7b21e
	.xword	0xf8c6a960d80038fd
	.xword	0x3e89e1ca229a9f65
	.xword	0x597f316b458b3eaa
	.xword	0x2fb4b11555fd3e4b
	.xword	0x6d19d860b390f215
	.xword	0xb827e5f3958453b7
	.xword	0x0b62d530f7fea1eb
	.xword	0xf9649c22395c0578
	.xword	0xa4d19b993dbd3b18
	.xword	0x3fbf8abb65dc8356
	.xword	0x3853075746d9c53a
	.xword	0xd82c26ea39cee731
	.xword	0x16cbde9f97c52c54
	.xword	0x6bc7807f0892f4eb
	.xword	0xbb4f2dc04ef8b565
	.xword	0xc54cb0deb34bce9f
	.xword	0x53f4af8a6b1e497d
	.xword	0x951e0e514d4623d8
	.xword	0x3dec936b6da996c9
	.xword	0x477a34efebe021d7
	.xword	0x7eb1b2a55bbe6019
	.xword	0x69721c22a23e462b
	.xword	0x8c5a9ef0a446c721
	.xword	0x1d157ad59c4480d6
	.xword	0x1167d3e97ee27409
	.xword	0xd3f73675554cc0f9
	.xword	0x4fd94eab401282e3
	.xword	0xc90ca7c5cc97941f
	.xword	0x2030f95204f4d752
	.xword	0x6f7ee0d0b5d8b5dc
	.xword	0x20c5977b618f16a3
	.xword	0x5925c0bd75c510a9
	.xword	0x57fcf29931aacddf
	.xword	0xff92fd432b8fc8ce
	.xword	0xdd15a334e5d22b09
	.xword	0x8085be1dc4f90714
	.xword	0x284d7ded7a4d2ddd
	.xword	0x4a05767ab95dc0c3
	.xword	0xecc6c37efa153c7d
	.xword	0xee96a00338c0c2db
	.xword	0x2c54a1790e262ad8
	.xword	0xd9434a78159d2df6
	.xword	0x76b9fc5b9cc2834c
	.xword	0xa8f4cd15ec47193e
	.xword	0xe0744f3f8729e9b2
	.xword	0x57a5998eaa72b988
	.xword	0x62c10517e732d08b
	.xword	0xfe20814a490a5b32
	.xword	0xf026d8eb6796f8a6
	.xword	0x66efcc07e67c7e03
	.xword	0x086d6f40237b20b5
	.xword	0x754f9ff385774964
	.xword	0xde6c0fe0987a4281
	.xword	0x36e2f47062fd753a
	.xword	0x8e5a7bd215833a5c
	.xword	0x59127ead686bd320
	.xword	0x42ed936352093377
	.xword	0x555293b41fadb1db
	.xword	0x826dc7981d8675f2
	.xword	0x15c855561a3e90fe
	.xword	0xa542e80147bf0ff5
	.xword	0x0904e03a75268bc1
	.xword	0xf8ecec95126795ed
	.xword	0x5d95adc987c8ce2e
	.xword	0x28f57e30751d914e
	.xword	0x61b9d180c952e0d8
	.xword	0x58f1dff75a4b0bea
	.xword	0xa77eec8799208982
	.xword	0xdcbaad5272656c73
	.xword	0x586c4b95fccf4fc7
	.xword	0x9cfd6d3f431fb946
	.xword	0xc2ca5e2f9a4fa493
	.xword	0x09dfc6bd469fd922
	.xword	0x996582d6823c5802
	.xword	0xd689b98b91703a92
	.xword	0xd09b81a0a61b528f
	.xword	0xd1cfe886980b0f21
	.xword	0x5c99a8619a756762
	.xword	0x117bb5519a6ec576
	.xword	0x289a4d1573ee5c01
	.xword	0xe66ab45776854b47
	.xword	0xf502e20b0b78fa1b
	.xword	0xf07d1942730543f0
	.xword	0xb898b4d889647fe8
	.xword	0x269a06c8dc1f8006
	.xword	0x560039b637000a24
	.xword	0xf1379dd79e8ded66
	.xword	0xd1259759ee2c2c51
	.xword	0x3aa7ced24ea310b5
	.xword	0xf52cc8bc1f241875
	.xword	0x29443c7f86136520
	.xword	0xa27a3026e2efad3b
	.xword	0xc3bbfd5059fa85de
	.xword	0x9c9e3765d678b8c5
	.xword	0x5dad7c45f59405ac
	.xword	0x780a8842c6ae0325
	.xword	0x56df6c02e0816d37
	.xword	0xeff400a16e35c5cf
	.xword	0x1bb1cdfcdc2c7635
	.xword	0x65ca012efab01ab1
	.xword	0x4d51e220e52038fd
	.xword	0xc61d052836cec6f8
	.xword	0xe4bedade0f38bb93
	.xword	0x6309c6a6968a9dc8
	.xword	0xe6b2f9197055f3cd
	.xword	0x57e8608161a710cf
	.xword	0x1ffa65e682735949
	.xword	0x8016ee34b662cf71
	.xword	0x44a3527b1a5e83a4
	.xword	0xa48f446bcb2d9677
	.xword	0xd948e455ac6b6d3d
	.xword	0x40a28257742fa046
	.xword	0xa79b36dd456cb2f7
	.xword	0x4d410642a82a96d7
	.xword	0x98129d2d54d9e28f
	.xword	0x0bccc84683635ad6
	.xword	0x55ec49f185968f82
	.xword	0xeca2be57d94c8476
	.xword	0x38df683aa9e0f548
	.xword	0xae895c70133dcef8
	.xword	0x4026078af992dc99
	.xword	0x07b6790140feeab1
	.xword	0xf8b6938633df126e
	.xword	0x085dabaefbbb0fc6
	.xword	0x71cc40b912388c0d
	.xword	0x304d7b07e51213c0
	.xword	0xf62308a2cdda25b2
	.xword	0xf49f5574782713eb
	.xword	0x03e7685bfa1e39b1
	.xword	0x5378482de5a200e5
	.xword	0xd2bb4b9d4b973e33
	.xword	0x00fe8ddf5731b73c
	.xword	0xe8927c8dc681c483
	.xword	0x855c08027e1fb777
	.xword	0xf38ce98e0389e2b2
	.xword	0xe81a2bd20bf45260
	.xword	0xd9e12c6cd604658b
	.xword	0xef906ccd3906af03
	.xword	0x4c0e18aeefaec9a1
	.xword	0xbbe30a0df4510fbb
	.xword	0x9360738dda2e9e93
	.xword	0x3943e43256da9fc4
	.xword	0x33093bb2e8845584
	.xword	0x1c30d66a05d67d14
	.xword	0x8397ef4a569da74c
	.xword	0x1df30cd69cf3bc9b
	.xword	0xb5ebb6fe7a17de05
	.xword	0x8c90ae68585929c9
	.xword	0x6ce53ea890e0ef08
	.xword	0x9420508e9237cdad
	.xword	0x839158742dc1faec
	.xword	0xc2ec23a229cfb735
	.xword	0x76f70b17208f9d1c
	.xword	0x910049f230e79f2a
	.xword	0x7b27d10ef613b053
	.xword	0x70e5ebb27d671427
	.xword	0xb796ccbe031a3982
	.xword	0x2f7ded3ca25d13d8
	.xword	0x6c99410fac25cdda
	.xword	0x69f386d323e00cdc
	.xword	0x46a4315839bea574
	.xword	0xf64b17845c722fd3
	.xword	0x4bb83ce798d0540a
	.xword	0x8b90258da81074db
	.xword	0x1a457a6b87082ff0
	.xword	0xcb97ce25ffea7b3c
	.xword	0x1f3ce664296979f5
	.xword	0x5d662ffb3c131a21
	.xword	0x6f9225e67c229639
	.xword	0xf5a774706d7e13a6
	.xword	0xd76a20dd4060ed0a
	.xword	0xcdc0429265da1679
	.align 0x20000
	.data
data_start_5:

	.xword	0x69ffed9d6aa2d370
	.xword	0xdac241d5ff949f8c
	.xword	0x5dfb7e25353f0eae
	.xword	0xa5a2d24888c9b8de
	.xword	0x73c0484a77561cdb
	.xword	0xfae415645821e8d7
	.xword	0xaae4bc54880f7d1e
	.xword	0x4335430150f2cfdf
	.xword	0xd41e5b83784707fd
	.xword	0xfc73e404f580f66d
	.xword	0x2b8d1d9ba33fac7c
	.xword	0xca8465095bdd180c
	.xword	0x0708530f136fb643
	.xword	0x889df176da9ebbae
	.xword	0xedc13b407d440840
	.xword	0x0cadb4138284a646
	.xword	0x8f6379d1ab3ab5ae
	.xword	0x6bf7e613cb97aeed
	.xword	0x8c764d34d0f5b3df
	.xword	0x3e3ca5d5f0e044ce
	.xword	0x00a54017fa2e951b
	.xword	0xfd90831dd5776f20
	.xword	0xf84fba28978c938e
	.xword	0xb45c1a82c1b211af
	.xword	0xe54a42f68c59e73e
	.xword	0xafa292cb193270aa
	.xword	0x1fbf6157543300e9
	.xword	0x2de0e01fdf91ddaa
	.xword	0x54b53ea19e49c180
	.xword	0xad14f1af2f2f7b14
	.xword	0x98812c97d8f8b57f
	.xword	0xdfb9e0eae9ba5b19
	.xword	0x43ffec7c092c3d61
	.xword	0xb44b38095675928e
	.xword	0xabc4af08baa39e16
	.xword	0x76cdbcfaade8f5c7
	.xword	0x8d56f6170284cb16
	.xword	0x505053f1d24176ba
	.xword	0xf6dca5e90bc00e1c
	.xword	0x29b5e34e2b48acbf
	.xword	0x27c7409de0027022
	.xword	0xbfc18d5f3dbb574b
	.xword	0x1fa869ddebcff8c2
	.xword	0xdce436b2de8ba97a
	.xword	0xe85605dcf4f17cf5
	.xword	0x2ce532b86c481b2d
	.xword	0xf3274124aeee6be9
	.xword	0x9dd13b9085af6dae
	.xword	0xe189c0db32c83b83
	.xword	0xba8dce998d07755d
	.xword	0xf8d8bbf2810ff00a
	.xword	0x88b74c0f08d5852b
	.xword	0x0440402b5ef5b373
	.xword	0xb2c11fd6b04b177a
	.xword	0x2f0a6afb6280a6ce
	.xword	0xb65b63b607cdb0fd
	.xword	0x37486efcccb67d00
	.xword	0x8bf4bfa89a256386
	.xword	0x20755f1801fa373b
	.xword	0xb5f9e299ac1130e0
	.xword	0xcf40998829985e1e
	.xword	0xa8c84ebacf7d5e2c
	.xword	0x949617950d926a34
	.xword	0xf3e61ceed2ab98d0
	.xword	0x3d2f845364a68d10
	.xword	0x9393a9faae454be2
	.xword	0x1f47d6bd54c18777
	.xword	0x10e4ac54daab638f
	.xword	0xc752ffffc87274fd
	.xword	0xbe93c2918870cca3
	.xword	0x0f6587f7142861e9
	.xword	0x4b8d01b82ae7ce9d
	.xword	0xd19270262b50ccf7
	.xword	0xaf6c5417dce972eb
	.xword	0xc10bdeb0f35ae696
	.xword	0xef0e73f6dbd29986
	.xword	0xac2927952b02222d
	.xword	0xb3c8fdb2290a5159
	.xword	0x6e331703fda74ac8
	.xword	0x91bf9ad5017c7bf6
	.xword	0xa22609f4a483ad5f
	.xword	0x904c6eb5d9f9a96b
	.xword	0xd8ce337cf219b0a3
	.xword	0xa219f47760204752
	.xword	0x42d2a2ae6f729f82
	.xword	0xd54ce273742f4fc0
	.xword	0x3c469b7c4d6e1fc7
	.xword	0xe7e844e4483416da
	.xword	0x0ad5fc87919f2f84
	.xword	0x0a4a28c482496873
	.xword	0x995b1494b6351d44
	.xword	0xf8dbdca53b0e55a3
	.xword	0x79aa1f6b46c1e02b
	.xword	0x0eebc4933e958322
	.xword	0xfeb8cb202df9bc00
	.xword	0x843294cdf3b942c8
	.xword	0xfd65779a7ae26bc7
	.xword	0x9007c25e6c362f46
	.xword	0x2966f7845a06f4a2
	.xword	0xbc29c3916ee0514d
	.xword	0x06dd4e2b7e7be6dc
	.xword	0xffa784dd426eba4c
	.xword	0xf6fb2131517609b4
	.xword	0x205c544059ba0b46
	.xword	0x25fe0d873a3942e9
	.xword	0xa15088ef4fd03ea0
	.xword	0x825f868c9aa26370
	.xword	0x36c8c4cb55dfeaf4
	.xword	0x7442ebdbf2fc145d
	.xword	0xc079e0ea8f57776a
	.xword	0x139a9672035fca16
	.xword	0x3841e1e6a3339b72
	.xword	0x62fe9f0135777026
	.xword	0x7d5bd5fc7a9f202a
	.xword	0x4452c6a5f88f69ea
	.xword	0x962c7b1a33858739
	.xword	0x974510055e903f69
	.xword	0xf3c5fa8cfb79dcb2
	.xword	0xa22e8493f092ade1
	.xword	0xf0e76e04fe78a089
	.xword	0x665a25f058f2eba4
	.xword	0xe5d1a244add563fc
	.xword	0xd2657d8ebbd77298
	.xword	0x4e807b445de633cd
	.xword	0x48020785a14c1fe6
	.xword	0x0018920425e7f11d
	.xword	0xd838eaddb9e4e2d4
	.xword	0x872a22821a04d27c
	.xword	0xbb3d62181cb76d48
	.xword	0x1346fbdd972ca806
	.xword	0x27f66e885328e0a4
	.xword	0x67cd212cd9c6fcc8
	.xword	0xeb08d05ad6bf2b59
	.xword	0x5d5dc5a6a1481dfd
	.xword	0x79db414b0fb189d7
	.xword	0x49527eceb5563867
	.xword	0x8c799826845a2a98
	.xword	0x702b82f8776d7a5a
	.xword	0x05648a3ae5de526d
	.xword	0x455616ef24c58eb0
	.xword	0x9d3b9b1b02c79f00
	.xword	0x55c4dd13b3cffeb0
	.xword	0x59ac2ba3a3a32e36
	.xword	0x333f7b55be3c6908
	.xword	0x56295ccb5d6ad0ba
	.xword	0xd6098d18a5457e38
	.xword	0xa3dd4ca231f6e811
	.xword	0xa9b170a8b0d839e5
	.xword	0x8bc5528a4bdad41d
	.xword	0xdbe1b466413d3d4d
	.xword	0xca63fe52221f9c03
	.xword	0x7bb9069c408ceeab
	.xword	0xa23110ecbaa044bf
	.xword	0xfd3eb07d282a9886
	.xword	0x5a5ae10f715f1585
	.xword	0x7388de77e6213a6f
	.xword	0x47c07be7a5da7a63
	.xword	0x839703a6162e1fa5
	.xword	0x16a7feed3cc2dd75
	.xword	0x33ab679b796b3b5a
	.xword	0x6d390efe6c6ed957
	.xword	0x13aa3e355d4b6cf7
	.xword	0xc2d24d8812507b99
	.xword	0x4b133d45883745c6
	.xword	0x5c1aae1f81158ba3
	.xword	0x446c63487fc9a280
	.xword	0x3c3cc8d80a532990
	.xword	0x7f8271e116c42892
	.xword	0xa29c1b2b0be66d31
	.xword	0xbec4ff6644a660ff
	.xword	0x0414d118d051dd29
	.xword	0x66e86205dd685d01
	.xword	0xaf0afa3bc0e792e9
	.xword	0x871bb2b021bd2219
	.xword	0xc7f49b745bddbbc3
	.xword	0xaa2a81d031f91517
	.xword	0xb38f718cb56a1b5a
	.xword	0x3260a056a785ad17
	.xword	0x3f6c32f629daecb5
	.xword	0x432a3e8689f34de9
	.xword	0x473caf83bc3393cf
	.xword	0xd71f96aecc2d2856
	.xword	0x558f8fe9a504e858
	.xword	0x21bf4a28314f0142
	.xword	0x2014aed2b92420f3
	.xword	0x226f2663831e41bf
	.xword	0x6910da4277c5744b
	.xword	0xa1512dba503e76c5
	.xword	0xd7ecaecf5b37be8a
	.xword	0xf5d3d6baf4b80f8a
	.xword	0x089fc0aed2b72128
	.xword	0x0ff7c3e51bba315c
	.xword	0x8a01254dc8a4c829
	.xword	0x9e74bdbf1f4cd757
	.xword	0xf9e674008dce207c
	.xword	0x0b632bf237c9835c
	.xword	0x292e005e87d97027
	.xword	0xc29b1878bad6ce8f
	.xword	0x6a59f18544ff92c5
	.xword	0xab0e68453dfd8198
	.xword	0xd239393d2af8ea5d
	.xword	0x7502afcaaa6df000
	.xword	0x6f841a97ceb20417
	.xword	0x4cbae170328790df
	.xword	0xbfd3bd4886e07868
	.xword	0x129de7bc8d993888
	.xword	0x7e006876eb9f54af
	.xword	0x36d2d7ece01c5640
	.xword	0x17a3c88e92340830
	.xword	0x99bf66c957b49f84
	.xword	0xb1899590765b2c6e
	.xword	0xf68cb0b54b5c59d2
	.xword	0x8a205a81d6276189
	.xword	0x8218412772519e13
	.xword	0xc073cc0f79866d22
	.xword	0xa8ddeba6dc7b23b7
	.xword	0xf10498575372cda2
	.xword	0xe354a14bcf371d0e
	.xword	0x0f139a8abaccc4eb
	.xword	0x2f7285d487e2aaea
	.xword	0x1d7bb965ab849364
	.xword	0xa50977f617eb73d4
	.xword	0x998f7e3b3268c225
	.xword	0xcef7d0d729d49b62
	.xword	0xa9e270a898a3ebf5
	.xword	0xcf30055123271895
	.xword	0xadfec806a682239a
	.xword	0x64f1a15706606ea3
	.xword	0xa690f04d17f56639
	.xword	0x007ab8eb517888c9
	.xword	0x93970d53a07b65a0
	.xword	0xac02ecb56611dbec
	.xword	0x7382e8f16068e1ca
	.xword	0x1db0886eba06c5fd
	.xword	0x4b38788ea9eddf33
	.xword	0xdf7c3b59a7710256
	.xword	0xaf21a9d506cc16cb
	.xword	0x953238f826334b43
	.xword	0xc1102d3bdc6151ca
	.xword	0x5b12567d73347b97
	.xword	0xa51679157a481263
	.xword	0xaf6530c944b9d918
	.xword	0xb5f91817aba18a92
	.xword	0xc06ef7db2d015ef4
	.xword	0x0628b6b989f1ef32
	.xword	0xca5f894d54a32876
	.xword	0xe38cd8e478812fce
	.xword	0x42610fa98ff61a37
	.xword	0x1bd6a59823e065a8
	.xword	0x21fcdb1102150c32
	.xword	0x6618063a48171e1f
	.xword	0x5ce5a770861610b1
	.xword	0x5bc8d1fdeb2b382b
	.xword	0x74b12316bcd0866f
	.xword	0x89225564c3022b43
	.xword	0x2e77257405235140
	.align 0x40000
	.data
data_start_6:

	.xword	0x8d4d3daf14b780ff
	.xword	0x683d755a68da9965
	.xword	0x2691cd5df5f02f74
	.xword	0xb160d7892780afd7
	.xword	0x34d4cbe8c6c565ec
	.xword	0x59e416de9804084d
	.xword	0xf3128e638ca45c99
	.xword	0x52d9b1f92b40a2f0
	.xword	0x0081b4b3255445fe
	.xword	0xc1e28ce78a8995a1
	.xword	0xc811b8ff744ec68f
	.xword	0xf4ba9aaaf60f6947
	.xword	0x135cd65dc5fe6a42
	.xword	0x19aab293414b4d0d
	.xword	0xe5705b2eb7042b52
	.xword	0x338e0749d6f0e6ef
	.xword	0x3cc1941e7c04f739
	.xword	0x34fc1bd3403f0521
	.xword	0xd1ffe139e22bbfe0
	.xword	0x22a42d5b85c8c7ae
	.xword	0x0ba77f57c6192b09
	.xword	0x2a52e0e825efdc17
	.xword	0x74b82f7b0a678933
	.xword	0xeee6257487016f7c
	.xword	0xba0a6a881cf63079
	.xword	0x6088b093be4c93bd
	.xword	0xadb40f4f47152239
	.xword	0xa151e1c4c283ea83
	.xword	0x7cecb04e1e4fe895
	.xword	0x7aea0a8e014c900a
	.xword	0x7d566576363ae99c
	.xword	0x9efa77276364bf3a
	.xword	0x93051a75be1f208f
	.xword	0x4fa4e55f5770ad5c
	.xword	0x87c86bbf0d3f82be
	.xword	0x6f688a121418edaa
	.xword	0xe0f3b1c5aab7faa0
	.xword	0xc16dcc3ef8f1ce56
	.xword	0xd69e60d943353d6e
	.xword	0x37b507366393db4a
	.xword	0xe427ac37a7f10969
	.xword	0x1cfe6ab003d7dafb
	.xword	0xfb5e1ed94f802bca
	.xword	0x989d142a8280c95d
	.xword	0x603fc26681c7264a
	.xword	0x6b97222e257cd30c
	.xword	0x749600de5218f9b2
	.xword	0x5d098f89a10e21ec
	.xword	0xa3ca5a8f8bcdbb58
	.xword	0xbe976460ec95206d
	.xword	0xe0874e44ec15a108
	.xword	0x956ffc4dcee0baaf
	.xword	0xd81fc42700b92b11
	.xword	0x0dae563160cebe15
	.xword	0x0f49d9c074adfe4c
	.xword	0x5c579e4418c398f8
	.xword	0xb280a2d963fd2d8f
	.xword	0x81401a8c69d5dfaf
	.xword	0x449e1a0b6ce09c0d
	.xword	0xc70bd146fc94fd93
	.xword	0x350b28b6af13e114
	.xword	0x335fee52c7401cb7
	.xword	0x862f298416ea3a3d
	.xword	0x86ff33618f3e2213
	.xword	0xd841ddd6d5cefe3d
	.xword	0x3d783ce34ddfebf6
	.xword	0xf688323685280c97
	.xword	0x0102106c6d0e5e6e
	.xword	0x4c511109a6a73dd6
	.xword	0x50e8b86de9a62c91
	.xword	0x19043d814a2c77be
	.xword	0x520134fa5d67403f
	.xword	0xe861d9c72b98816a
	.xword	0x896922ea8419e7f1
	.xword	0x950713898c6fab1c
	.xword	0xbb846067dbedd476
	.xword	0xce208e92e3578688
	.xword	0xa8e0bf0551e52848
	.xword	0x03fbbbb43c8d8101
	.xword	0xba31e981f54f951a
	.xword	0xc60a4d456da535f5
	.xword	0xd800c597a092fc5d
	.xword	0x8c028892d519492a
	.xword	0x8971bc0232b9c8a3
	.xword	0xfcc2cd5a14168b83
	.xword	0x81e070cb434cbd98
	.xword	0x8effc3cda34811c0
	.xword	0x36baab0a48951824
	.xword	0x8720045da9cd8b91
	.xword	0x3131a65fa77a003e
	.xword	0x2ff249b4984e4a2c
	.xword	0x945409af78deebdc
	.xword	0x9e9f31309ed15434
	.xword	0x4e26649df6400035
	.xword	0xb9fdf76d2870daeb
	.xword	0xbf5814c5457389af
	.xword	0xddf2126a0e16c50e
	.xword	0x1fb81a65b1053b88
	.xword	0x5b4b72bcea3882c2
	.xword	0xe0605c3dc8106a2a
	.xword	0x59711667a3aaaebc
	.xword	0x25df27d7789369aa
	.xword	0xd025798c42cca648
	.xword	0xef0f9f837d23ef4c
	.xword	0xa59c2e6c8bd89206
	.xword	0x7813df278d67f409
	.xword	0x2daddde7ef8b4dee
	.xword	0x02f53793dd98edbe
	.xword	0xec002e5f30076071
	.xword	0xebc665ffcdcead82
	.xword	0xa7dccf0ac2f7b468
	.xword	0x8cf01b3282f4568a
	.xword	0xd04ed133a936b2ed
	.xword	0x953b8e33c5da2ce9
	.xword	0x93507a185a0e2050
	.xword	0x7a4688540ce1c228
	.xword	0x844f946975b13d85
	.xword	0xb445ba515748e99f
	.xword	0x7ae9825015a639a2
	.xword	0xb71344507a801aec
	.xword	0x5665c5818e1a605b
	.xword	0x6ed2b9bc2e7f2cad
	.xword	0xef5d706ab2394614
	.xword	0xd98d1a1a57aa6b65
	.xword	0x67ff6e4c0b4eec2a
	.xword	0xa3e8cba7452f0b30
	.xword	0x1d7d842de3a527cc
	.xword	0x4fc7e6c9a96bfdaa
	.xword	0xad72c7290ed6d537
	.xword	0x79e9bfd38911aca8
	.xword	0x99d504a9a6b02f6c
	.xword	0x7b0b68ab89507342
	.xword	0x5b95c79161212361
	.xword	0x5fa099551446a8e6
	.xword	0xbd5c31ece5635eca
	.xword	0x15da83953082c5d5
	.xword	0xaed0fa335919f4e9
	.xword	0x4fff4aa9aa3fb38a
	.xword	0x31ef49d15d42adc9
	.xword	0x0a071419b8e35a13
	.xword	0xf623e2cfa1a2f194
	.xword	0x1ba7b115c14a596c
	.xword	0xee0754abdb052f0f
	.xword	0xfb236bca5d4d3490
	.xword	0x096543a1db199e4b
	.xword	0x4166dc6c885d593f
	.xword	0x46d34c1bace0bdc0
	.xword	0xbf5dc77dba9d5148
	.xword	0xb7d56281b78553ff
	.xword	0x62cec028fa3fa89e
	.xword	0x63bdc546f10844ec
	.xword	0x181e0254b4c85198
	.xword	0x8b269edcef9eddb2
	.xword	0x64af03575d72022c
	.xword	0x949001686dec53fa
	.xword	0x6210777315fcbc5e
	.xword	0xbdf12c2088f6e5db
	.xword	0x96c701d8fc34daf0
	.xword	0x0cd220e4e6c0029b
	.xword	0x8ab7a7e383e67931
	.xword	0x2f0eb054db760f7d
	.xword	0x6f1e690afc77214e
	.xword	0x2b1e834cdc08c2d8
	.xword	0x339c4fd1cc24bbdd
	.xword	0x7495b65eba4431fd
	.xword	0xf0fa90f4576778f5
	.xword	0x4149188dd25cc8e0
	.xword	0xd2c2aec19ab60394
	.xword	0xf075de496f140cd8
	.xword	0xd50fc14826910584
	.xword	0xb42fa2c509263fe5
	.xword	0x494a99a57e4417fa
	.xword	0x055405f358f9bcbf
	.xword	0xb400652bc391c689
	.xword	0xc0a6159fd64b17ea
	.xword	0x62853e5e4ddc4b4c
	.xword	0xfb85d016b4cc0df2
	.xword	0x739651f6f5cbb9d0
	.xword	0x6998c9294848c6cc
	.xword	0x3bd48d6cc162d279
	.xword	0xb261141fe06f3e2f
	.xword	0xf96c098c0ef1e605
	.xword	0x685448efe148cedd
	.xword	0xab344628f8321461
	.xword	0x9f10350bc6abbfb6
	.xword	0x0ffd5896ef280c00
	.xword	0xee7e792df462f996
	.xword	0xf97a73cb0d943889
	.xword	0xd8ddd5226bfebd26
	.xword	0x30f06d70ece3bf6c
	.xword	0x9f49ba4a741dee4c
	.xword	0x3f2e87ab4bd279fe
	.xword	0xf914422efdaff6d8
	.xword	0x7154a2d29d9d4717
	.xword	0x61e6b88b67c32da5
	.xword	0x3d1cf04447ce721d
	.xword	0xcdb92bb74c000a53
	.xword	0xf4dd86a87eaf62d8
	.xword	0x42b35aec1fb42ddc
	.xword	0x12785b8c6742ff1a
	.xword	0xf8a12ab751bc1d0e
	.xword	0xc4b5a86d3893f09c
	.xword	0xe28c09217d68ab36
	.xword	0x43cf2f33a8c1fd3e
	.xword	0xb2cc1d12e21a1403
	.xword	0xdcf3b343b60e8d66
	.xword	0xc20917e0509938c4
	.xword	0xf7db562613021b5b
	.xword	0xa7671cf5681bcd18
	.xword	0xe0a40f8ee6db2a54
	.xword	0x3b4e1c2476befb95
	.xword	0x1df10073faefa643
	.xword	0x346f360b1d153a91
	.xword	0x8d8fecfa11916588
	.xword	0xe22a9d339e431dc2
	.xword	0x230ebd01bd7fff59
	.xword	0xf31d975c7e6c9ad6
	.xword	0x2b56d031f3669012
	.xword	0xafae01ee3e0b0794
	.xword	0x9892d14ba0135490
	.xword	0x875b4beaa1e2ff32
	.xword	0x979caa9b756cfc30
	.xword	0xade3da32f2a5263b
	.xword	0xbf570135f5631708
	.xword	0x0189f6740ae4199a
	.xword	0xf3399d6cfe1e0060
	.xword	0x941a8ed6919174a3
	.xword	0x0f7222b6614365f2
	.xword	0x4b19688d7c8a58f5
	.xword	0x696bcc3d7f740e4e
	.xword	0x32caeefc60652f97
	.xword	0x16f3aed0aa5bdffc
	.xword	0x088f81055deef600
	.xword	0x8d66a5ebc2e4c864
	.xword	0xf504864c1860d713
	.xword	0x069432e8cd482a4b
	.xword	0xfb7464d3cd95b5d2
	.xword	0x840614a41e12c1e1
	.xword	0xb24f4173fdb4a245
	.xword	0xe1f79fc9c798b301
	.xword	0xba1a1b855fcfda85
	.xword	0xbd86ba4bcb1e8cfe
	.xword	0x35ebb32cb840ebd2
	.xword	0xde4037f12724c9d4
	.xword	0x508040d3222822b0
	.xword	0x1bb7063116879325
	.xword	0x50da4f8023d6ae83
	.xword	0x32adb443c57762d6
	.xword	0x69445f0b9d5f56c8
	.xword	0x356381f31f83b3f6
	.xword	0xfde99e1a5fe6d3fa
	.xword	0x87e9cf51049bea7f
	.xword	0xad7354a7cf3bb2d6
	.xword	0x00777d9ae9534564
	.xword	0x4d3a251e7b724db6
	.xword	0x8c7ee6527bb43115
	.align 0x80000
	.data
data_start_7:

	.xword	0xb3a4fdd4814ce553
	.xword	0x93a4c217111a2af1
	.xword	0x91234d327f9b09c8
	.xword	0xa187eb22469acecc
	.xword	0x6ef45eadba7d9555
	.xword	0xce10e23f8ddd95d8
	.xword	0xd231830b8a17a5bc
	.xword	0x74869a1b57264cdb
	.xword	0x6d9702233311d149
	.xword	0x77b7e21c8ebe98a1
	.xword	0x7752429f55f208d9
	.xword	0x7bc9d50e3298ff12
	.xword	0x22327448c8805980
	.xword	0xd40d226f8e1ca27f
	.xword	0x57fdf4855421fbad
	.xword	0x4dcddee911e6979c
	.xword	0xf771c074b91d473a
	.xword	0x7b267ff70315c376
	.xword	0xb02760fe70f01ae7
	.xword	0xa0748dbee24fd2f7
	.xword	0xd2a7f189821e5285
	.xword	0xe696715305eaa3f0
	.xword	0xedfbc9217e884226
	.xword	0xf1451424113dfbab
	.xword	0xadc4069cb23f0f87
	.xword	0x450393a225a1578d
	.xword	0x9cb34e5b73e5d1d4
	.xword	0x31826e831daa4be3
	.xword	0xdb75f252fbac7b07
	.xword	0x01c444d42494aee3
	.xword	0x5db8215a1e7ba02d
	.xword	0x2f73d5067aaedf4e
	.xword	0xcacaba3ba1680090
	.xword	0x2488769da25ff607
	.xword	0x657d9c5255e2f5c5
	.xword	0x40197198ec40e539
	.xword	0xc6db7df1d5e8948a
	.xword	0x6acd7f6ff07d8821
	.xword	0x44a4bd09a87505bf
	.xword	0x64a949c0ff4277be
	.xword	0xefe86354f15a1bf4
	.xword	0xdadc4a8931c4697a
	.xword	0x66b011e7baf1fb47
	.xword	0x54d7fadfa345127b
	.xword	0xaf13bd63fd31a9d6
	.xword	0x60901af63f5fdca6
	.xword	0x533509168e34a39a
	.xword	0x74be0cf377975cef
	.xword	0xe75562b6a4acd39b
	.xword	0x8cd3e5617a8a9c90
	.xword	0xb6fbfaea557bdcd4
	.xword	0x7a5f305ffc508061
	.xword	0x64ab43df9f1f5965
	.xword	0x716238c8d66e5af2
	.xword	0x0660b6d17bf372ce
	.xword	0x84f756fadd33c516
	.xword	0xb4755dbd61bccc7f
	.xword	0xd2ade985bbaeaf24
	.xword	0x542195674e9a03b8
	.xword	0xb5935b5f10408836
	.xword	0xb29bd444926b7be0
	.xword	0x2609061a0e9ebed4
	.xword	0xb20c1c29eea4988a
	.xword	0x0d3505b08c8bebd6
	.xword	0x736bfe773db494c3
	.xword	0x293aed14399c440f
	.xword	0x8f44d91f09572361
	.xword	0x54012b8a99ebc102
	.xword	0x408a8e51e34cf1a5
	.xword	0x8b18a5fc38b30cc0
	.xword	0xe11dec13ef9c9a6b
	.xword	0x03ba7bdc61f0dfb9
	.xword	0xbd8468d50544afdd
	.xword	0x5838578f122fed07
	.xword	0x793abebf8e8aada9
	.xword	0x1529f1838126ef11
	.xword	0x57a488cb1f1835c5
	.xword	0xfb88647287d49a78
	.xword	0xc111045a90282f12
	.xword	0xbe65eb6df6f31a09
	.xword	0xd4ba9089e7063f4d
	.xword	0xe120f4ee9957dce5
	.xword	0xd639a72c2e57c4cb
	.xword	0xe28dcef15dba3fa3
	.xword	0xfc156c036f93f5a1
	.xword	0xb40e7d5d3263c100
	.xword	0x47ef6c25ad2af909
	.xword	0x8d4202f94d0323d8
	.xword	0xab0c7424a26f5663
	.xword	0x65b38ce3f9b30897
	.xword	0xef98f4cc66070cb0
	.xword	0x39583e14a64ca905
	.xword	0xcfcdcdad2521ca6a
	.xword	0xed37e2a5ebec47a8
	.xword	0x743c941f60ba8231
	.xword	0x64be2245325366b2
	.xword	0x3463566101620e3c
	.xword	0xb1157b3749129cea
	.xword	0xc2952a3a9550c21e
	.xword	0xb2f7a8cd352406ea
	.xword	0xbe5ad8014d7e59de
	.xword	0xaf2b4fd0ad83f52b
	.xword	0x85762cf353cd8994
	.xword	0x0ce5dfbf8e19a00a
	.xword	0xbc91e8d0469aa6a5
	.xword	0xa4f803b1b2b990d1
	.xword	0xfd0a35c317185e2f
	.xword	0xbf8a9f00a6c2d652
	.xword	0x4e0ac86193e9509a
	.xword	0x6cbdb27b4219dcc0
	.xword	0x07cbe8d03b465c71
	.xword	0x5bfcbc3ab2aa406d
	.xword	0x669ef9e6aa39ec55
	.xword	0xc69360217f371c79
	.xword	0x4ae896ba05092167
	.xword	0x8c98e88a40ddaaae
	.xword	0x21bba5b357d2e729
	.xword	0x339bc3afffd22454
	.xword	0x370b869c189ad989
	.xword	0x5963640d388b68f0
	.xword	0x8dade426b534b502
	.xword	0x43b8764e8a3ff6b3
	.xword	0x67eca6de372d9698
	.xword	0x8fdee4a800367535
	.xword	0xd3d9846858c675a7
	.xword	0x9af2be3154b3d682
	.xword	0xf10e7b219a1c7253
	.xword	0xc800cb176f38f7c7
	.xword	0xee5bbca5e736f87f
	.xword	0x1dd13e8c8bf0d28a
	.xword	0x6fd7c38a48e10431
	.xword	0xe8830fd64ccb8ea7
	.xword	0x013bd827753ac818
	.xword	0x01e1ee63bbab8393
	.xword	0x11d7222003462ef0
	.xword	0x1f3546f52a6c0db6
	.xword	0xdc1d764394259c85
	.xword	0xbc3110439a39f9c8
	.xword	0xf994ed543da8f5f6
	.xword	0xcc08ca25b8551b4c
	.xword	0x45d4a66f13e76eaf
	.xword	0x2873a8ca7c533bdc
	.xword	0x7946aafbf376889c
	.xword	0xf3f16d27537441c3
	.xword	0x728a9a41bff00014
	.xword	0x3a98c2d681ae0c8f
	.xword	0x77bb16b83cd2c28f
	.xword	0xd11f71058cff5abb
	.xword	0xd2f6b6e707f37d55
	.xword	0xf2a93a1eb708c3e7
	.xword	0x78918f31a21c29c7
	.xword	0x6a53a605866f7a2d
	.xword	0xaee327e98e939668
	.xword	0x61b051220eb8281b
	.xword	0x3c1dcaeb285f6974
	.xword	0xf7878d9119989700
	.xword	0x8888b86e7c304c46
	.xword	0x3ef43e40d9346412
	.xword	0x241723e6c9e2077c
	.xword	0x21435ef89bbcd290
	.xword	0xd571c41beeef7bb7
	.xword	0x595a4eb389276f95
	.xword	0x479bc764656faf4b
	.xword	0xaec85242dfb37675
	.xword	0x73517df6cb9085cc
	.xword	0xf0e2cb52759691a4
	.xword	0xe5d8596dcd88562d
	.xword	0x34ca395ec061bd8a
	.xword	0xfbece2e8213d230d
	.xword	0xa6b482b1b85a5501
	.xword	0xc1b04535b20c97b3
	.xword	0x8b4f5a62bc788ffb
	.xword	0x1cc3372bbc86106f
	.xword	0xaa901005713c1fd7
	.xword	0x4c12670d5bbc2dc5
	.xword	0x5b9699a38c1a62bb
	.xword	0x999ed834e222c904
	.xword	0x02bc95a34a3f78be
	.xword	0xa631d784ba485790
	.xword	0x310599a68ca44de6
	.xword	0x37127113b34c677d
	.xword	0xdb659577053683de
	.xword	0x8ebb56ee8491b7db
	.xword	0xe39f76203baf0042
	.xword	0x616b4bbb441e44a2
	.xword	0x6db89861b7444380
	.xword	0x0e149b13e1acec43
	.xword	0x9b12592807bba84c
	.xword	0xb3dc95c75981f4d2
	.xword	0x3243399d49cd0f69
	.xword	0xda1b713f94428cc2
	.xword	0xf18b5d9792d00951
	.xword	0x7f8e102953a8b7bc
	.xword	0xc4d22593fcea762e
	.xword	0x2aeb69b7f4af7b8d
	.xword	0x89b1e57d629d296c
	.xword	0x71622736ae267bef
	.xword	0xcde1fd403f6870c0
	.xword	0x0ec4652a43965fe9
	.xword	0xc8a33f081835749a
	.xword	0x97229e61febd0c37
	.xword	0x3314048a19b13f5a
	.xword	0xed27b91ce5b62d03
	.xword	0xc425b6be9a37dde5
	.xword	0x21976242fd4fc6fc
	.xword	0xa98c9fe6a3f05889
	.xword	0xf7c90ce25343681b
	.xword	0x4de85f367842a0e3
	.xword	0x2376721dd9bc97de
	.xword	0x110feecff17b9bfc
	.xword	0x76111217acc1e640
	.xword	0x48b9f7a8fde4fc2b
	.xword	0x01ca0c1acbc707ae
	.xword	0x4bf20a580a250f96
	.xword	0xaf83bc8f7337f49c
	.xword	0x23918b1119d3fec3
	.xword	0xadd60cda372590de
	.xword	0xf310144b0cad32aa
	.xword	0xf53f415d9cb55fee
	.xword	0x0f17fca409999ba4
	.xword	0x9592baa639b5a1e7
	.xword	0xdae8c3d9329366cc
	.xword	0xec891d6000931f59
	.xword	0x9199cff05989f103
	.xword	0x364a01a83aff5551
	.xword	0x4b2db336911800f9
	.xword	0xee40d8b4827ff44f
	.xword	0x4d1856a68cc84954
	.xword	0x5ce67e0a5153d927
	.xword	0xea428c2f0cb7af93
	.xword	0xa3b5906dc747eb1c
	.xword	0x8aa1473da89f7dc7
	.xword	0x71407b0836f25249
	.xword	0xdf1cb314215c8d21
	.xword	0xf294b7160ad05a7f
	.xword	0x5cc5f376450d5f86
	.xword	0x9c688da83fe3d5e3
	.xword	0x41d6ee901b266f9b
	.xword	0x322aaba70748ed74
	.xword	0x8016b95c567c7601
	.xword	0x366eef8392deec7c
	.xword	0x71a7620b099f3250
	.xword	0x4d470e52568281d2
	.xword	0x7cc5dfd14148bb8b
	.xword	0x3add37d8aff234a4
	.xword	0xcd334b099290dabd
	.xword	0xe546fa15d143d9ba
	.xword	0xd3f5d9b213bb3f81
	.xword	0xed75a4da2588ff43
	.xword	0xae5eb522afe662a8
	.xword	0x39016b2c447dbb43
	.xword	0x1486b751f830e75e
	.xword	0x6b65b0a9c5910375
	.xword	0x6025a6c8dca8fd5b
	.xword	0x5c195bcb79089be5
	.xword	0xdd04885fbb4aad75



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
