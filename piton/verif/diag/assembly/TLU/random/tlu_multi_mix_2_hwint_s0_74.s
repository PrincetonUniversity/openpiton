// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tlu_multi_mix_2_hwint_s0_74.s
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
   random seed:	706512451
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

	setx 0x7ae067cf0ee7759a, %g1, %g0
	setx 0x69e7015dc4aa1c14, %g1, %g1
	setx 0x19181985e4e67e09, %g1, %g2
	setx 0x0b07d5303111ec81, %g1, %g3
	setx 0x75dfe8bd3f310082, %g1, %g4
	setx 0xac65aa01f98ff46f, %g1, %g5
	setx 0x581ac7baa52c6531, %g1, %g6
	setx 0x34f8d480a54ec316, %g1, %g7
	setx 0xba41cc297e5f3266, %g1, %r16
	setx 0x538a794920f51907, %g1, %r17
	setx 0x2a7e52d41601a4e0, %g1, %r18
	setx 0xf6f25c462b791db3, %g1, %r19
	setx 0x7cb0514307faa83b, %g1, %r20
	setx 0x3d59d7ae60f063f0, %g1, %r21
	setx 0x8e8cc0111590db6c, %g1, %r22
	setx 0x8fc4871ff1cee692, %g1, %r23
	setx 0xb83102e60faec111, %g1, %r24
	setx 0x7ba47fe6a38ba8dd, %g1, %r25
	setx 0x814c2bf6a6c9bc85, %g1, %r26
	setx 0x3e0bbdfe242e7bc5, %g1, %r27
	setx 0x7fbda9e9be162d88, %g1, %r28
	setx 0xfa9d593824253d3c, %g1, %r29
	setx 0x7779077981dce388, %g1, %r30
	setx 0x987dff2a1b09a039, %g1, %r31
	save
	setx 0x45e8d9e1c3b8b641, %g1, %r16
	setx 0xa085e7abb0ef224b, %g1, %r17
	setx 0x29dc3e43b369ecfa, %g1, %r18
	setx 0x22bf208f1cb5ccf8, %g1, %r19
	setx 0x3fa1ed729ef63944, %g1, %r20
	setx 0xc1e180381c5a5b84, %g1, %r21
	setx 0xd993c2f8871047b0, %g1, %r22
	setx 0xa6e7fe1b6b116084, %g1, %r23
	setx 0x2944c1dbacff745e, %g1, %r24
	setx 0x977e8c5eff2a4d28, %g1, %r25
	setx 0x152014177a894c0d, %g1, %r26
	setx 0xdba10cb9f23a932b, %g1, %r27
	setx 0x88c8bc278222a5c0, %g1, %r28
	setx 0xbbcc1fa04149ac56, %g1, %r29
	setx 0x0a134cfd902296bd, %g1, %r30
	setx 0x39fbc9972d00b835, %g1, %r31
	save
	setx 0x02c34fc2d225e703, %g1, %r16
	setx 0x24e8512a2c93146b, %g1, %r17
	setx 0x3466a88ee95be243, %g1, %r18
	setx 0x4f98218503f78e4a, %g1, %r19
	setx 0x8f248ad7322c1b0b, %g1, %r20
	setx 0xbe5284bc8a9d51f4, %g1, %r21
	setx 0x35df1209ee0c139f, %g1, %r22
	setx 0x76ac036540ee2a99, %g1, %r23
	setx 0x177b2f409de2b12e, %g1, %r24
	setx 0xbcf4efa944c42101, %g1, %r25
	setx 0xc8f095c80d2ce145, %g1, %r26
	setx 0xe9ee5cbb90b1bff3, %g1, %r27
	setx 0x9d8908d6133856ef, %g1, %r28
	setx 0x7b5f63044c397b08, %g1, %r29
	setx 0x7cd8112e8343cf31, %g1, %r30
	setx 0x1a13f1a92b306367, %g1, %r31
	save
	setx 0x44d31b6e0416b5b1, %g1, %r16
	setx 0xdd5c183313fcb891, %g1, %r17
	setx 0xf4c0d0d4afc2f6a8, %g1, %r18
	setx 0x07c5408ea19f6cdc, %g1, %r19
	setx 0x88f189bdd2d38f2a, %g1, %r20
	setx 0xfe8776445aa42cc4, %g1, %r21
	setx 0xaaf4542b63395c85, %g1, %r22
	setx 0x8e5fd392a0d81b3f, %g1, %r23
	setx 0xc2da7ac0b2cd75c2, %g1, %r24
	setx 0x8dfc41646f04a43b, %g1, %r25
	setx 0x115e9ac98400863a, %g1, %r26
	setx 0xee04b2374bdc019c, %g1, %r27
	setx 0xd43b314c7cebc82a, %g1, %r28
	setx 0xa89eb1bd271e3203, %g1, %r29
	setx 0x659b414169a6d1a7, %g1, %r30
	setx 0xe88f384002fe7e65, %g1, %r31
	save
	setx 0xb06abeed807da9ec, %g1, %r16
	setx 0xae5e803360712adb, %g1, %r17
	setx 0x3c346745e8da35f2, %g1, %r18
	setx 0x416f44a712f50ce7, %g1, %r19
	setx 0x7ba37f52144ba378, %g1, %r20
	setx 0xe88b4ba24735b934, %g1, %r21
	setx 0x1b9d174af9fc915b, %g1, %r22
	setx 0xd6e84a5c08e42da2, %g1, %r23
	setx 0x8a8958e837c91625, %g1, %r24
	setx 0x152ed5c35893d3c3, %g1, %r25
	setx 0xc333b7b7f1727bc4, %g1, %r26
	setx 0x99bfb75574d99188, %g1, %r27
	setx 0x13d03669bbc7414f, %g1, %r28
	setx 0x2f31d087ce3954f6, %g1, %r29
	setx 0x0e050ba94972cd03, %g1, %r30
	setx 0x969c58f1f9f5b835, %g1, %r31
	save
	setx 0xc1d60d91b87895a1, %g1, %r16
	setx 0xa1ab05ea471d6dde, %g1, %r17
	setx 0xbc19bf31ae59592b, %g1, %r18
	setx 0x4bed46baf3584085, %g1, %r19
	setx 0xf6624b4981d3b191, %g1, %r20
	setx 0x3761455c7e6f0290, %g1, %r21
	setx 0x3434d3563013b131, %g1, %r22
	setx 0x07400e35c840b3ca, %g1, %r23
	setx 0x09c172c7fb23b0ae, %g1, %r24
	setx 0x53d4936bb05ad744, %g1, %r25
	setx 0x40fe2b6a6d68f627, %g1, %r26
	setx 0xe2b4a88fff1997e8, %g1, %r27
	setx 0xdd1dcc1a523e02d9, %g1, %r28
	setx 0xcfd1a34ce019b694, %g1, %r29
	setx 0x913a723c1033b5ae, %g1, %r30
	setx 0x1a46995d5d3e88b9, %g1, %r31
	save
	setx 0xc510912f4a6c7ea0, %g1, %r16
	setx 0x12d204b88f4d8efc, %g1, %r17
	setx 0x7d928f8b00cc8fc5, %g1, %r18
	setx 0x5f8daddb5a7f1f89, %g1, %r19
	setx 0x716e9137544b154b, %g1, %r20
	setx 0x59ec97a1b8cc1ced, %g1, %r21
	setx 0xf0a3baa62060fc68, %g1, %r22
	setx 0x7b51d198783dcee3, %g1, %r23
	setx 0x6b43c4bf07703abc, %g1, %r24
	setx 0x252d128594ad2ecf, %g1, %r25
	setx 0x6dae8ae53ae36a38, %g1, %r26
	setx 0x8f4993892c46e017, %g1, %r27
	setx 0x46fa9a11bdf0d9dc, %g1, %r28
	setx 0xd5f5d105cdcfe636, %g1, %r29
	setx 0x2a88c8f8f50e6765, %g1, %r30
	setx 0x09118e74c5109b7c, %g1, %r31
	save
	setx 0xcc6a5ba9720bd88f, %g1, %r16
	setx 0x91d9fca564ef05e5, %g1, %r17
	setx 0xe1356b4514d9c46d, %g1, %r18
	setx 0xa312f73d9e3c6d39, %g1, %r19
	setx 0x8ff450faad78eed1, %g1, %r20
	setx 0x9b60a8d9aa9237ed, %g1, %r21
	setx 0x0cedb93719867116, %g1, %r22
	setx 0xf83feb57e33270cd, %g1, %r23
	setx 0xc42e1f8da795ebe6, %g1, %r24
	setx 0x16838641998b165b, %g1, %r25
	setx 0xfacc013df19c7298, %g1, %r26
	setx 0x4607729b35b3d994, %g1, %r27
	setx 0x8d8a0320d5d2d4dd, %g1, %r28
	setx 0x45db4e0b1379c08e, %g1, %r29
	setx 0x219b40e7982de29a, %g1, %r30
	setx 0x281428800b91e507, %g1, %r31
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
	.word 0x8394a047  ! 4: WRPR_TNPC_I	wrpr	%r18, 0x0047, %tnpc
	.word 0xbde4e0ea  ! 5: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xbbe4e0a3  ! 7: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb7e460dc  ! 9: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb3e4e04e  ! 15: SAVE_I	save	%r19, 0x0001, %r25
hwintr_0_0:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_0), 16, 16)) -> intp(0, 0, 17)
hwintr_0_1:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_1), 16, 16)) -> intp(0, 0, 4)
	.word 0xbc154000  ! 26: OR_R	or 	%r21, %r0, %r30
	.word 0xbe8da08a  ! 27: ANDcc_I	andcc 	%r22, 0x008a, %r31
hwintr_0_2:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_2), 16, 16)) -> intp(0, 0, 23)
hwintr_0_3:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_3), 16, 16)) -> intp(0, 0, 26)
	.word 0x8195a174  ! 32: WRPR_TPC_I	wrpr	%r22, 0x0174, %tpc
	.word 0xbbe4a124  ! 33: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb9e421f3  ! 41: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb3e521b9  ! 49: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb1e520ad  ! 50: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xb3e46000  ! 53: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb3e52055  ! 55: SAVE_I	save	%r20, 0x0001, %r25
	setx	0xbfcc9f6b00009b82, %g1, %r10
	.word 0x819a8000  ! 57: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb41c8000  ! 58: XOR_R	xor 	%r18, %r0, %r26
	.word 0xb5e421b0  ! 61: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb9350000  ! 63: SRL_R	srl 	%r20, %r0, %r28
	.word 0x85942167  ! 65: WRPR_TSTATE_I	wrpr	%r16, 0x0167, %tstate
	.word 0xbc95200b  ! 69: ORcc_I	orcc 	%r20, 0x000b, %r30
hwintr_0_4:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_4), 16, 16)) -> intp(0, 0, 2d)
	.word 0x8994a08f  ! 75: WRPR_TICK_I	wrpr	%r18, 0x008f, %tick
	.word 0xb3e52129  ! 76: SAVE_I	save	%r20, 0x0001, %r25
hwintr_0_5:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_5), 16, 16)) -> intp(0, 0, 2f)
	.word 0xbfe5e1c0  ! 80: SAVE_I	save	%r23, 0x0001, %r31
	setx	0x55cfdf4a00006b8e, %g1, %r10
	.word 0x819a8000  ! 83: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
hwintr_0_6:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_6), 16, 16)) -> intp(0, 0, 20)
	.word 0xb7e42176  ! 93: SAVE_I	save	%r16, 0x0001, %r27
	setx	0x58fed4090000ab08, %g1, %r10
	.word 0x839a8000  ! 95: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb63c0000  ! 97: XNOR_R	xnor 	%r16, %r0, %r27
	.word 0xb7540000  ! 101: RDPR_GL	<illegal instruction>
	.word 0x89956137  ! 103: WRPR_TICK_I	wrpr	%r21, 0x0137, %tick
hwintr_0_7:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_7), 16, 16)) -> intp(0, 0, 29)
	.word 0xb8bc60f0  ! 108: XNORcc_I	xnorcc 	%r17, 0x00f0, %r28
	.word 0x8394614d  ! 112: WRPR_TNPC_I	wrpr	%r17, 0x014d, %tnpc
	mov	1, %r12
	.word 0x8f930000  ! 114: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbfe42009  ! 116: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb9e5e04a  ! 118: SAVE_I	save	%r23, 0x0001, %r28
	mov	0, %r12
	.word 0x8f930000  ! 119: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb09d2182  ! 120: XORcc_I	xorcc 	%r20, 0x0182, %r24
	mov	2, %r12
	.word 0xa1930000  ! 121: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbde4a149  ! 124: SAVE_I	save	%r18, 0x0001, %r30
hwintr_0_8:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_8), 16, 16)) -> intp(0, 0, 10)
	.word 0xb5e4219a  ! 126: SAVE_I	save	%r16, 0x0001, %r26
	setx	0xbc5981fc00008882, %g1, %r10
	.word 0x819a8000  ! 128: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb3e4209c  ! 131: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb1e5606c  ! 141: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb9e5e162  ! 144: SAVE_I	save	%r23, 0x0001, %r28
	setx	0x994bb2f00000d842, %g1, %r10
	.word 0x819a8000  ! 145: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb5e420ed  ! 148: SAVE_I	save	%r16, 0x0001, %r26
hwintr_0_9:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_9), 16, 16)) -> intp(0, 0, 3e)
	.word 0xb3e560a8  ! 150: SAVE_I	save	%r21, 0x0001, %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbfe4a1f5  ! 153: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb3e56069  ! 157: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb3e5a13a  ! 161: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb3e4e1e0  ! 163: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb5e4e023  ! 165: SAVE_I	save	%r19, 0x0001, %r26
	.word 0x91956149  ! 168: WRPR_PIL_I	wrpr	%r21, 0x0149, %pil
hwintr_0_10:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_10), 16, 16)) -> intp(0, 0, 14)
	.word 0x8594a122  ! 177: WRPR_TSTATE_I	wrpr	%r18, 0x0122, %tstate
	.word 0xbbe56009  ! 179: SAVE_I	save	%r21, 0x0001, %r29
	.word 0x839460c2  ! 181: WRPR_TNPC_I	wrpr	%r17, 0x00c2, %tnpc
	.word 0xb9e4a1d1  ! 187: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb7e4e087  ! 188: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xba35e04c  ! 192: ORN_I	orn 	%r23, 0x004c, %r29
	.word 0x8d942044  ! 193: WRPR_PSTATE_I	wrpr	%r16, 0x0044, %pstate
	.word 0xb3e5a108  ! 195: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb9e56056  ! 198: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb7e4e160  ! 199: SAVE_I	save	%r19, 0x0001, %r27
hwintr_0_11:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_11), 16, 16)) -> intp(0, 0, 2c)
	.word 0xb9e461cd  ! 201: SAVE_I	save	%r17, 0x0001, %r28
	mov	0, %r12
	.word 0x8f930000  ! 203: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x8195a053  ! 205: WRPR_TPC_I	wrpr	%r22, 0x0053, %tpc
	.word 0xbaa40000  ! 206: SUBcc_R	subcc 	%r16, %r0, %r29
	.word 0xb1e420e2  ! 213: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xbcb560be  ! 214: SUBCcc_I	orncc 	%r21, 0x00be, %r30
	.word 0xbf7c2401  ! 217: MOVR_I	movre	%r16, 0x1, %r31
	.word 0xb73ce001  ! 218: SRA_I	sra 	%r19, 0x0001, %r27
	.word 0xb7480000  ! 219: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	setx	data_start_5, %g1, %r20
	.word 0xbde4e010  ! 225: SAVE_I	save	%r19, 0x0001, %r30
hwintr_0_12:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_12), 16, 16)) -> intp(0, 0, 2d)
hwintr_0_13:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_13), 16, 16)) -> intp(0, 0, 18)
	.word 0xbbe42085  ! 234: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xbde5e0b8  ! 235: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xbcc50000  ! 243: ADDCcc_R	addccc 	%r20, %r0, %r30
hwintr_0_14:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_14), 16, 16)) -> intp(0, 0, 35)
hwintr_0_15:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_15), 16, 16)) -> intp(0, 0, 8)
	.word 0xb7e4a0af  ! 246: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb2946050  ! 248: ORcc_I	orcc 	%r17, 0x0050, %r25
hwintr_0_16:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_16), 16, 16)) -> intp(0, 0, b)
	.word 0x8194a0ea  ! 256: WRPR_TPC_I	wrpr	%r18, 0x00ea, %tpc
	.word 0x8d946002  ! 259: WRPR_PSTATE_I	wrpr	%r17, 0x0002, %pstate
	.word 0xb5504000  ! 260: RDPR_TNPC	<illegal instruction>
	.word 0xb5e5a04a  ! 264: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xbb500000  ! 266: RDPR_TPC	<illegal instruction>
	.word 0xbb540000  ! 273: RDPR_GL	<illegal instruction>
	.word 0xb7e520a0  ! 274: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb5e5a059  ! 276: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb3e46040  ! 278: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbbe5a054  ! 283: SAVE_I	save	%r22, 0x0001, %r29
	.word 0x819521a6  ! 290: WRPR_TPC_I	wrpr	%r20, 0x01a6, %tpc
hwintr_0_17:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_17), 16, 16)) -> intp(0, 0, 13)
	.word 0xb0a4a03d  ! 292: SUBcc_I	subcc 	%r18, 0x003d, %r24
	.word 0xb1e5e0c0  ! 294: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xbd510000  ! 296: RDPR_TICK	<illegal instruction>
	.word 0xb551c000  ! 299: RDPR_TL	<illegal instruction>
	.word 0x8594e19d  ! 301: WRPR_TSTATE_I	wrpr	%r19, 0x019d, %tstate
	.word 0xbfe5a008  ! 302: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xb7e5608c  ! 303: SAVE_I	save	%r21, 0x0001, %r27
	.word 0x859521b9  ! 308: WRPR_TSTATE_I	wrpr	%r20, 0x01b9, %tstate
	setx	0xd36eb21900006b50, %g1, %r10
	.word 0x839a8000  ! 310: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbbe4a05f  ! 313: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xbbe5a10e  ! 314: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xbfe4608d  ! 318: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb3e5e1c6  ! 324: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb3e4a163  ! 327: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb9e5202c  ! 329: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb1e4a038  ! 330: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb9e5e109  ! 332: SAVE_I	save	%r23, 0x0001, %r28
	.word 0x8195e02c  ! 333: WRPR_TPC_I	wrpr	%r23, 0x002c, %tpc
	.word 0xbbe5e157  ! 334: SAVE_I	save	%r23, 0x0001, %r29
	.word 0x8595a0bd  ! 335: WRPR_TSTATE_I	wrpr	%r22, 0x00bd, %tstate
	.word 0xbd504000  ! 338: RDPR_TNPC	<illegal instruction>
	.word 0xbb50c000  ! 339: RDPR_TT	<illegal instruction>
	.word 0xb151c000  ! 341: RDPR_TL	<illegal instruction>
hwintr_0_18:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_18), 16, 16)) -> intp(0, 0, 2f)
	setx	0xe659ed0d00009857, %g1, %r10
	.word 0x839a8000  ! 345: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbd480000  ! 349: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xb7e4e0ae  ! 351: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xbbe561cd  ! 353: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb7e4e0d7  ! 354: SAVE_I	save	%r19, 0x0001, %r27
hwintr_0_19:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_19), 16, 16)) -> intp(0, 0, 1f)
hwintr_0_20:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_20), 16, 16)) -> intp(0, 0, 30)
	.word 0xbfe561f6  ! 362: SAVE_I	save	%r21, 0x0001, %r31
	.word 0x8395e0ad  ! 365: WRPR_TNPC_I	wrpr	%r23, 0x00ad, %tnpc
	.word 0xb9e4a1f0  ! 368: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb88d8000  ! 372: ANDcc_R	andcc 	%r22, %r0, %r28
	.word 0xb7e4a15f  ! 379: SAVE_I	save	%r18, 0x0001, %r27
	mov	2, %r12
	.word 0xa1930000  ! 380: WRPR_GL_R	wrpr	%r12, %r0, %-
hwintr_0_21:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_21), 16, 16)) -> intp(0, 0, 16)
	.word 0xb5e4e11c  ! 388: SAVE_I	save	%r19, 0x0001, %r26
	.word 0x8d94a1ac  ! 389: WRPR_PSTATE_I	wrpr	%r18, 0x01ac, %pstate
	.word 0xb7540000  ! 392: RDPR_GL	<illegal instruction>
	.word 0xbac520f4  ! 394: ADDCcc_I	addccc 	%r20, 0x00f4, %r29
	.word 0xbbe5600d  ! 395: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xbbe5a0ee  ! 397: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb9e4a0f8  ! 398: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb7e4e013  ! 400: SAVE_I	save	%r19, 0x0001, %r27
	.word 0x81956122  ! 402: WRPR_TPC_I	wrpr	%r21, 0x0122, %tpc
	.word 0xb7e420a0  ! 403: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xbbe521a2  ! 405: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xbfe4e109  ! 406: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xb3518000  ! 407: RDPR_PSTATE	<illegal instruction>
	setx	data_start_5, %g1, %r23
	.word 0xb3359000  ! 419: SRLX_R	srlx	%r22, %r0, %r25
	.word 0x859560e8  ! 423: WRPR_TSTATE_I	wrpr	%r21, 0x00e8, %tstate
	.word 0xb9518000  ! 425: RDPR_PSTATE	<illegal instruction>
	.word 0xb7e421f3  ! 434: SAVE_I	save	%r16, 0x0001, %r27
	.word 0xb351c000  ! 436: RDPR_TL	<illegal instruction>
	.word 0xbb344000  ! 439: SRL_R	srl 	%r17, %r0, %r29
	.word 0xb2b54000  ! 443: ORNcc_R	orncc 	%r21, %r0, %r25
	.word 0xbd643801  ! 448: MOVcc_I	<illegal instruction>
	.word 0xb9e460d2  ! 450: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb9518000  ! 452: RDPR_PSTATE	<illegal instruction>
	.word 0xb4948000  ! 453: ORcc_R	orcc 	%r18, %r0, %r26
	.word 0xb5e42181  ! 454: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb1e4a104  ! 456: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb1508000  ! 464: RDPR_TSTATE	<illegal instruction>
	.word 0xb40cc000  ! 465: AND_R	and 	%r19, %r0, %r26
	.word 0xb7e5602a  ! 466: SAVE_I	save	%r21, 0x0001, %r27
	.word 0x87956124  ! 467: WRPR_TT_I	wrpr	%r21, 0x0124, %tt
hwintr_0_22:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_22), 16, 16)) -> intp(0, 0, 13)
	.word 0xbcb4c000  ! 472: ORNcc_R	orncc 	%r19, %r0, %r30
	.word 0xbde4205b  ! 478: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb3e420ec  ! 479: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xbd480000  ! 480: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0x8d94e0ff  ! 485: WRPR_PSTATE_I	wrpr	%r19, 0x00ff, %pstate
hwintr_0_23:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_23), 16, 16)) -> intp(0, 0, 21)
hwintr_0_24:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_24), 16, 16)) -> intp(0, 0, 1e)
	.word 0xb7e42081  ! 491: SAVE_I	save	%r16, 0x0001, %r27
hwintr_0_25:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_25), 16, 16)) -> intp(0, 0, 19)
	.word 0x899520d3  ! 496: WRPR_TICK_I	wrpr	%r20, 0x00d3, %tick
	.word 0xbfe4e01a  ! 498: SAVE_I	save	%r19, 0x0001, %r31
hwintr_0_26:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_26), 16, 16)) -> intp(0, 0, 3d)
	.word 0xbde520d0  ! 503: SAVE_I	save	%r20, 0x0001, %r30
	mov	1, %r12
	.word 0x8f930000  ! 505: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb9e4a0ff  ! 507: SAVE_I	save	%r18, 0x0001, %r28
	mov	0, %r12
	.word 0xa1930000  ! 513: WRPR_GL_R	wrpr	%r12, %r0, %-
hwintr_0_27:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_27), 16, 16)) -> intp(0, 0, 3a)
	.word 0xbde5a042  ! 517: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xb32d5000  ! 520: SLLX_R	sllx	%r21, %r0, %r25
	.word 0xb5e42161  ! 522: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xbbe52133  ! 523: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb1e5e1ef  ! 525: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xbfe56120  ! 527: SAVE_I	save	%r21, 0x0001, %r31
	.word 0x83952111  ! 529: WRPR_TNPC_I	wrpr	%r20, 0x0111, %tnpc
	.word 0x8794e086  ! 533: WRPR_TT_I	wrpr	%r19, 0x0086, %tt
	.word 0xb1e56196  ! 534: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xbde521b6  ! 539: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xb7e5e140  ! 541: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb225a1e4  ! 545: SUB_I	sub 	%r22, 0x01e4, %r25
	.word 0x8995e07d  ! 549: WRPR_TICK_I	wrpr	%r23, 0x007d, %tick
	mov	1, %r12
	.word 0xa1930000  ! 550: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbc25e17e  ! 552: SUB_I	sub 	%r23, 0x017e, %r30
hwintr_0_28:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_28), 16, 16)) -> intp(0, 0, 27)
hwintr_0_29:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_29), 16, 16)) -> intp(0, 0, 34)
	.word 0xb3641800  ! 560: MOVcc_R	<illegal instruction>
	.word 0x8d95e193  ! 562: WRPR_PSTATE_I	wrpr	%r23, 0x0193, %pstate
	.word 0xbbe5a034  ! 563: SAVE_I	save	%r22, 0x0001, %r29
hwintr_0_30:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_30), 16, 16)) -> intp(0, 0, 3d)
	.word 0xb9e4a1b7  ! 567: SAVE_I	save	%r18, 0x0001, %r28
	setx	0x9551470000008a46, %g1, %r10
	.word 0x839a8000  ! 575: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb3e5a197  ! 577: SAVE_I	save	%r22, 0x0001, %r25
	.word 0x8595a187  ! 580: WRPR_TSTATE_I	wrpr	%r22, 0x0187, %tstate
	setx	data_start_0, %g1, %r19
	setx	data_start_4, %g1, %r18
	.word 0xb7508000  ! 583: RDPR_TSTATE	<illegal instruction>
	.word 0xb1e46104  ! 585: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xbbe4a19d  ! 587: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xbb50c000  ! 590: RDPR_TT	<illegal instruction>
	.word 0xbde561e3  ! 594: SAVE_I	save	%r21, 0x0001, %r30
	.word 0xb151c000  ! 596: RDPR_TL	<illegal instruction>
	.word 0xb1520000  ! 598: RDPR_PIL	<illegal instruction>
	.word 0xb8250000  ! 606: SUB_R	sub 	%r20, %r0, %r28
	.word 0xb950c000  ! 608: RDPR_TT	<illegal instruction>
hwintr_0_31:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_31), 16, 16)) -> intp(0, 0, 2a)
	.word 0xbde46179  ! 610: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb2c58000  ! 611: ADDCcc_R	addccc 	%r22, %r0, %r25
hwintr_0_32:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_32), 16, 16)) -> intp(0, 0, c)
	.word 0xb5e52141  ! 613: SAVE_I	save	%r20, 0x0001, %r26
	.word 0xb7e5217e  ! 614: SAVE_I	save	%r20, 0x0001, %r27
hwintr_0_33:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_33), 16, 16)) -> intp(0, 0, 11)
	.word 0xb1e4a0bc  ! 619: SAVE_I	save	%r18, 0x0001, %r24
hwintr_0_34:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_34), 16, 16)) -> intp(0, 0, 2)
	.word 0xb9e42034  ! 625: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xbd2c8000  ! 626: SLL_R	sll 	%r18, %r0, %r30
	.word 0xbe350000  ! 627: SUBC_R	orn 	%r20, %r0, %r31
	.word 0xb9e4a029  ! 628: SAVE_I	save	%r18, 0x0001, %r28
	.word 0x8394a120  ! 629: WRPR_TNPC_I	wrpr	%r18, 0x0120, %tnpc
	.word 0xb9500000  ! 633: RDPR_TPC	<illegal instruction>
	.word 0xb7e52098  ! 635: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xbfe5e169  ! 636: SAVE_I	save	%r23, 0x0001, %r31
	.word 0xb3480000  ! 639: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
hwintr_0_35:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_35), 16, 16)) -> intp(0, 0, c)
	.word 0xbfe520c6  ! 643: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xbde5a15f  ! 644: SAVE_I	save	%r22, 0x0001, %r30
	mov	1, %r12
	.word 0x8f930000  ! 648: WRPR_TL_R	wrpr	%r12, %r0, %tl
hwintr_0_36:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_36), 16, 16)) -> intp(0, 0, 29)
hwintr_0_37:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_37), 16, 16)) -> intp(0, 0, 37)
	.word 0xbfe46177  ! 661: SAVE_I	save	%r17, 0x0001, %r31
	setx	data_start_6, %g1, %r20
	.word 0xbde46142  ! 665: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb1e56168  ! 666: SAVE_I	save	%r21, 0x0001, %r24
	.word 0x919421f1  ! 667: WRPR_PIL_I	wrpr	%r16, 0x01f1, %pil
	.word 0xbfe5a047  ! 670: SAVE_I	save	%r22, 0x0001, %r31
hwintr_0_38:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_38), 16, 16)) -> intp(0, 0, 28)
	.word 0xb77c2401  ! 675: MOVR_I	movre	%r16, 0x1, %r27
	.word 0xb415604b  ! 679: OR_I	or 	%r21, 0x004b, %r26
	.word 0xb5e4a067  ! 680: SAVE_I	save	%r18, 0x0001, %r26
hwintr_0_39:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_39), 16, 16)) -> intp(0, 0, 2f)
hwintr_0_40:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_40), 16, 16)) -> intp(0, 0, 36)
	.word 0xbe25610c  ! 685: SUB_I	sub 	%r21, 0x010c, %r31
	.word 0xb7e56135  ! 687: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb7e52180  ! 689: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb1e4e19f  ! 691: SAVE_I	save	%r19, 0x0001, %r24
	setx	0xcb0c3a7e0000c88c, %g1, %r10
	.word 0x819a8000  ! 692: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x819521a0  ! 696: WRPR_TPC_I	wrpr	%r20, 0x01a0, %tpc
	.word 0xb3e5a182  ! 701: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb9e5a08c  ! 704: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb5e5a074  ! 705: SAVE_I	save	%r22, 0x0001, %r26
	setx	0xcabf93280000e890, %g1, %r10
	.word 0x839a8000  ! 706: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb5e4203f  ! 709: SAVE_I	save	%r16, 0x0001, %r26
	.word 0xb63d8000  ! 710: XNOR_R	xnor 	%r22, %r0, %r27
	.word 0x9194e016  ! 711: WRPR_PIL_I	wrpr	%r19, 0x0016, %pil
	.word 0xb5e561e2  ! 712: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb5e5a13c  ! 713: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb1e4a0e2  ! 714: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb3e5e05e  ! 715: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb3e420e5  ! 716: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xbbe5e13b  ! 717: SAVE_I	save	%r23, 0x0001, %r29
	.word 0x81942080  ! 719: WRPR_TPC_I	wrpr	%r16, 0x0080, %tpc
	.word 0xb3e5e018  ! 724: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb1e46198  ! 729: SAVE_I	save	%r17, 0x0001, %r24
	.word 0x8995e0b5  ! 730: WRPR_TICK_I	wrpr	%r23, 0x00b5, %tick
hwintr_0_41:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_41), 16, 16)) -> intp(0, 0, 1)
	.word 0xbb3d6001  ! 732: SRA_I	sra 	%r21, 0x0001, %r29
	.word 0xbbe5e149  ! 733: SAVE_I	save	%r23, 0x0001, %r29
hwintr_0_42:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_42), 16, 16)) -> intp(0, 0, b)
	.word 0xb3e461cf  ! 747: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xb3510000  ! 748: RDPR_TICK	<illegal instruction>
hwintr_0_43:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_43), 16, 16)) -> intp(0, 0, 30)
	.word 0xb7e5608b  ! 750: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xbfe5a119  ! 753: SAVE_I	save	%r22, 0x0001, %r31
	.word 0x9195a182  ! 760: WRPR_PIL_I	wrpr	%r22, 0x0182, %pil
	.word 0xb1e5e182  ! 761: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb1e460a2  ! 764: SAVE_I	save	%r17, 0x0001, %r24
	.word 0x8194e1b9  ! 767: WRPR_TPC_I	wrpr	%r19, 0x01b9, %tpc
	setx	0x13b421f600005f0a, %g1, %r10
	.word 0x819a8000  ! 768: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb9520000  ! 770: RDPR_PIL	<illegal instruction>
	.word 0x91952175  ! 774: WRPR_PIL_I	wrpr	%r20, 0x0175, %pil
hwintr_0_44:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_44), 16, 16)) -> intp(0, 0, 2a)
	.word 0xbb355000  ! 776: SRLX_R	srlx	%r21, %r0, %r29
	.word 0xbbe460e6  ! 778: SAVE_I	save	%r17, 0x0001, %r29
	.word 0x8594e112  ! 779: WRPR_TSTATE_I	wrpr	%r19, 0x0112, %tstate
	.word 0x89946096  ! 780: WRPR_TICK_I	wrpr	%r17, 0x0096, %tick
	.word 0x8d94601c  ! 781: WRPR_PSTATE_I	wrpr	%r17, 0x001c, %pstate
	.word 0xb1e4a12b  ! 787: SAVE_I	save	%r18, 0x0001, %r24
	mov	2, %r12
	.word 0x8f930000  ! 789: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x8995612e  ! 793: WRPR_TICK_I	wrpr	%r21, 0x012e, %tick
	.word 0x8d94a1ab  ! 797: WRPR_PSTATE_I	wrpr	%r18, 0x01ab, %pstate
hwintr_0_45:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_45), 16, 16)) -> intp(0, 0, 7)
hwintr_0_46:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_46), 16, 16)) -> intp(0, 0, 39)
	.word 0xb3e42152  ! 812: SAVE_I	save	%r16, 0x0001, %r25
	.word 0xb3e560f0  ! 813: SAVE_I	save	%r21, 0x0001, %r25
hwintr_0_47:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_47), 16, 16)) -> intp(0, 0, 2c)
	.word 0xb1e5a1b6  ! 815: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xbde5e0d6  ! 819: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb5e5a0d0  ! 823: SAVE_I	save	%r22, 0x0001, %r26
	.word 0xb9510000  ! 826: RDPR_TICK	<illegal instruction>
	.word 0x8595a18b  ! 827: WRPR_TSTATE_I	wrpr	%r22, 0x018b, %tstate
	.word 0x83946141  ! 828: WRPR_TNPC_I	wrpr	%r17, 0x0141, %tnpc
	.word 0x8d95e1f6  ! 830: WRPR_PSTATE_I	wrpr	%r23, 0x01f6, %pstate
	.word 0xbde5e14f  ! 831: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb5e4e13d  ! 832: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xb9e5e05a  ! 837: SAVE_I	save	%r23, 0x0001, %r28
	.word 0x8394a0d0  ! 839: WRPR_TNPC_I	wrpr	%r18, 0x00d0, %tnpc
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbfe5a190  ! 843: SAVE_I	save	%r22, 0x0001, %r31
hwintr_0_48:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_48), 16, 16)) -> intp(0, 0, f)
	.word 0x8794e16e  ! 848: WRPR_TT_I	wrpr	%r19, 0x016e, %tt
	.word 0xb5e5e19d  ! 849: SAVE_I	save	%r23, 0x0001, %r26
	.word 0xbcacc000  ! 854: ANDNcc_R	andncc 	%r19, %r0, %r30
	.word 0xb5e461bd  ! 855: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xbbe5a0e0  ! 856: SAVE_I	save	%r22, 0x0001, %r29
	.word 0x8195a0b0  ! 857: WRPR_TPC_I	wrpr	%r22, 0x00b0, %tpc
	.word 0xbbe4207e  ! 859: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb3e56063  ! 863: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb4b5a134  ! 867: SUBCcc_I	orncc 	%r22, 0x0134, %r26
	.word 0xb1e4e1a4  ! 868: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xb5480000  ! 869: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xb41c4000  ! 876: XOR_R	xor 	%r17, %r0, %r26
	.word 0xb1e52138  ! 877: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xbc154000  ! 883: OR_R	or 	%r21, %r0, %r30
	.word 0xbc940000  ! 886: ORcc_R	orcc 	%r16, %r0, %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb151c000  ! 894: RDPR_TL	<illegal instruction>
	.word 0xb3500000  ! 897: RDPR_TPC	<illegal instruction>
hwintr_0_49:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_49), 16, 16)) -> intp(0, 0, 19)
	mov	2, %r12
	.word 0x8f930000  ! 903: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbfe520b2  ! 908: SAVE_I	save	%r20, 0x0001, %r31
	.word 0xb1e420ff  ! 910: SAVE_I	save	%r16, 0x0001, %r24
	.word 0x879520a2  ! 912: WRPR_TT_I	wrpr	%r20, 0x00a2, %tt
	.word 0xb7e52048  ! 914: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb9e5e1dc  ! 915: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb9e5212e  ! 918: SAVE_I	save	%r20, 0x0001, %r28
hwintr_0_50:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_50), 16, 16)) -> intp(0, 0, c)
	.word 0xb9480000  ! 930: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xb1e4601a  ! 931: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb3e4a036  ! 932: SAVE_I	save	%r18, 0x0001, %r25
	.word 0x819560cf  ! 939: WRPR_TPC_I	wrpr	%r21, 0x00cf, %tpc
	.word 0x8194e0ec  ! 940: WRPR_TPC_I	wrpr	%r19, 0x00ec, %tpc
	.word 0xb3540000  ! 941: RDPR_GL	<illegal instruction>
	.word 0xb3e4e063  ! 945: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xbfe4a1a5  ! 950: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb9e4e157  ! 951: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb5e561b4  ! 954: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb3e461f7  ! 960: SAVE_I	save	%r17, 0x0001, %r25
	.word 0x8d94213c  ! 967: WRPR_PSTATE_I	wrpr	%r16, 0x013c, %pstate
	.word 0xb7e5e0aa  ! 970: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb2a48000  ! 973: SUBcc_R	subcc 	%r18, %r0, %r25
	.word 0xb1520000  ! 980: RDPR_PIL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb3e5a0e2  ! 985: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb5518000  ! 989: RDPR_PSTATE	<illegal instruction>
	.word 0x8395616e  ! 990: WRPR_TNPC_I	wrpr	%r21, 0x016e, %tnpc
	.word 0xb7e5e1ee  ! 993: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xbf540000  ! 994: RDPR_GL	<illegal instruction>
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
	.word 0xf53c0000  ! 2: STDF_R	std	%f26, [%r0, %r16]
	.word 0xf82ca06e  ! 3: STB_I	stb	%r28, [%r18 + 0x006e]
	.word 0x839560c0  ! 4: WRPR_TNPC_I	wrpr	%r21, 0x00c0, %tnpc
	.word 0xf0754000  ! 6: STX_R	stx	%r24, [%r21 + %r0]
	.word 0xfd3cc000  ! 10: STDF_R	std	%f30, [%r0, %r19]
	.word 0xf02c8000  ! 11: STB_R	stb	%r24, [%r18 + %r0]
	.word 0xfc2d4000  ! 16: STB_R	stb	%r30, [%r21 + %r0]
	.word 0xf8354000  ! 19: STH_R	sth	%r28, [%r21 + %r0]
hwintr_3_0:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_0), 16, 16)) -> intp(3, 0, 35)
hwintr_3_1:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_1), 16, 16)) -> intp(3, 0, 22)
	.word 0xf83cc000  ! 24: STD_R	std	%r28, [%r19 + %r0]
	.word 0xb4144000  ! 26: OR_R	or 	%r17, %r0, %r26
	.word 0xb28da150  ! 27: ANDcc_I	andcc 	%r22, 0x0150, %r25
	.word 0xfb3ce158  ! 28: STDF_I	std	%f29, [0x0158, %r19]
hwintr_3_2:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_2), 16, 16)) -> intp(3, 0, 8)
hwintr_3_3:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_3), 16, 16)) -> intp(3, 0, 1e)
	.word 0xfe7420db  ! 31: STX_I	stx	%r31, [%r16 + 0x00db]
	.word 0x8194e159  ! 32: WRPR_TPC_I	wrpr	%r19, 0x0159, %tpc
	.word 0xfe240000  ! 34: STW_R	stw	%r31, [%r16 + %r0]
	.word 0xf22c0000  ! 35: STB_R	stb	%r25, [%r16 + %r0]
	.word 0xf73c0000  ! 37: STDF_R	std	%f27, [%r0, %r16]
	.word 0xf474c000  ! 39: STX_R	stx	%r26, [%r19 + %r0]
	.word 0xf0350000  ! 44: STH_R	sth	%r24, [%r20 + %r0]
	.word 0xf03c8000  ! 46: STD_R	std	%r24, [%r18 + %r0]
	.word 0xfc2d6080  ! 48: STB_I	stb	%r30, [%r21 + 0x0080]
	setx	0xe3cad33b00003c17, %g1, %r10
	.word 0x819a8000  ! 57: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb21c8000  ! 58: XOR_R	xor 	%r18, %r0, %r25
	.word 0xf0748000  ! 62: STX_R	stx	%r24, [%r18 + %r0]
	.word 0xb3348000  ! 63: SRL_R	srl 	%r18, %r0, %r25
	.word 0xf225e1ce  ! 64: STW_I	stw	%r25, [%r23 + 0x01ce]
	.word 0x8594e073  ! 65: WRPR_TSTATE_I	wrpr	%r19, 0x0073, %tstate
	.word 0xb8946104  ! 69: ORcc_I	orcc 	%r17, 0x0104, %r28
hwintr_3_4:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_4), 16, 16)) -> intp(3, 0, 14)
	.word 0x8995e0fc  ! 75: WRPR_TICK_I	wrpr	%r23, 0x00fc, %tick
	.word 0xf62cc000  ! 77: STB_R	stb	%r27, [%r19 + %r0]
hwintr_3_5:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_5), 16, 16)) -> intp(3, 0, 7)
	.word 0xf02d61ca  ! 81: STB_I	stb	%r24, [%r21 + 0x01ca]
	.word 0xfa750000  ! 82: STX_R	stx	%r29, [%r20 + %r0]
	setx	0xe48a138d0000dc49, %g1, %r10
	.word 0x819a8000  ! 83: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf224c000  ! 85: STW_R	stw	%r25, [%r19 + %r0]
	.word 0xfc2ca063  ! 86: STB_I	stb	%r30, [%r18 + 0x0063]
	.word 0xf23c0000  ! 88: STD_R	std	%r25, [%r16 + %r0]
hwintr_3_6:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_6), 16, 16)) -> intp(3, 0, 2a)
	setx	0x1a0cde1600009846, %g1, %r10
	.word 0x839a8000  ! 95: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbe3dc000  ! 97: XNOR_R	xnor 	%r23, %r0, %r31
	.word 0xf93d0000  ! 98: STDF_R	std	%f28, [%r0, %r20]
	.word 0xf43560f3  ! 100: STH_I	sth	%r26, [%r21 + 0x00f3]
	.word 0xb5540000  ! 101: RDPR_GL	rdpr	%-, %r26
	.word 0x8994a13f  ! 103: WRPR_TICK_I	wrpr	%r18, 0x013f, %tick
	.word 0xf82d8000  ! 104: STB_R	stb	%r28, [%r22 + %r0]
hwintr_3_7:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_7), 16, 16)) -> intp(3, 0, b)
	.word 0xbcbc608e  ! 108: XNORcc_I	xnorcc 	%r17, 0x008e, %r30
	.word 0xfc348000  ! 110: STH_R	sth	%r30, [%r18 + %r0]
	.word 0xf835c000  ! 111: STH_R	sth	%r28, [%r23 + %r0]
	.word 0x8394a092  ! 112: WRPR_TNPC_I	wrpr	%r18, 0x0092, %tnpc
	mov	2, %r12
	.word 0x8f930000  ! 114: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf6746197  ! 115: STX_I	stx	%r27, [%r17 + 0x0197]
	mov	0, %r12
	.word 0x8f930000  ! 119: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb29da02b  ! 120: XORcc_I	xorcc 	%r22, 0x002b, %r25
	mov	0, %r12
	.word 0xa1930000  ! 121: WRPR_GL_R	wrpr	%r12, %r0, %-
hwintr_3_8:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_8), 16, 16)) -> intp(3, 0, 18)
	setx	0x7debcb8900000e4d, %g1, %r10
	.word 0x819a8000  ! 128: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf0356104  ! 129: STH_I	sth	%r24, [%r21 + 0x0104]
	.word 0xfc350000  ! 130: STH_R	sth	%r30, [%r20 + %r0]
	.word 0xf825203d  ! 136: STW_I	stw	%r28, [%r20 + 0x003d]
	.word 0xfa2da099  ! 140: STB_I	stb	%r29, [%r22 + 0x0099]
	.word 0xfa744000  ! 143: STX_R	stx	%r29, [%r17 + %r0]
	setx	0x4a6c9a270000dad4, %g1, %r10
	.word 0x819a8000  ! 145: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
hwintr_3_9:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_9), 16, 16)) -> intp(3, 0, 2a)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfe3d61d8  ! 156: STD_I	std	%r31, [%r21 + 0x01d8]
	.word 0xf235a02b  ! 160: STH_I	sth	%r25, [%r22 + 0x002b]
	.word 0xf475c000  ! 164: STX_R	stx	%r26, [%r23 + %r0]
	.word 0x91942065  ! 168: WRPR_PIL_I	wrpr	%r16, 0x0065, %pil
	.word 0xf8348000  ! 169: STH_R	sth	%r28, [%r18 + %r0]
hwintr_3_10:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_10), 16, 16)) -> intp(3, 0, 35)
	.word 0xf835e00c  ! 174: STH_I	sth	%r28, [%r23 + 0x000c]
	.word 0x8594e0be  ! 177: WRPR_TSTATE_I	wrpr	%r19, 0x00be, %tstate
	.word 0xf63c200c  ! 180: STD_I	std	%r27, [%r16 + 0x000c]
	.word 0x8395213b  ! 181: WRPR_TNPC_I	wrpr	%r20, 0x013b, %tnpc
	.word 0xf8358000  ! 184: STH_R	sth	%r28, [%r22 + %r0]
	.word 0xf13ce1a2  ! 189: STDF_I	std	%f24, [0x01a2, %r19]
	.word 0xb434a1ef  ! 192: ORN_I	orn 	%r18, 0x01ef, %r26
	.word 0x8d95e1f7  ! 193: WRPR_PSTATE_I	wrpr	%r23, 0x01f7, %pstate
	.word 0xf22c4000  ! 197: STB_R	stb	%r25, [%r17 + %r0]
hwintr_3_11:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_11), 16, 16)) -> intp(3, 0, 3b)
	mov	2, %r12
	.word 0x8f930000  ! 203: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x8194e035  ! 205: WRPR_TPC_I	wrpr	%r19, 0x0035, %tpc
	.word 0xb4a5c000  ! 206: SUBcc_R	subcc 	%r23, %r0, %r26
	.word 0xf83d6122  ! 207: STD_I	std	%r28, [%r21 + 0x0122]
	.word 0xf53dc000  ! 208: STDF_R	std	%f26, [%r0, %r23]
	.word 0xbab52054  ! 214: SUBCcc_I	orncc 	%r20, 0x0054, %r29
	.word 0xfc3ce018  ! 215: STD_I	std	%r30, [%r19 + 0x0018]
	.word 0xfa2c8000  ! 216: STB_R	stb	%r29, [%r18 + %r0]
	.word 0xb17de401  ! 217: MOVR_I	movre	%r23, 0x1, %r24
	.word 0xb73d6001  ! 218: SRA_I	sra 	%r21, 0x0001, %r27
	.word 0xbf480000  ! 219: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	setx	data_start_4, %g1, %r19
	.word 0xf43d613f  ! 226: STD_I	std	%r26, [%r21 + 0x013f]
hwintr_3_12:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_12), 16, 16)) -> intp(3, 0, 22)
	.word 0xf0758000  ! 229: STX_R	stx	%r24, [%r22 + %r0]
	.word 0xf03d0000  ! 230: STD_R	std	%r24, [%r20 + %r0]
hwintr_3_13:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_13), 16, 16)) -> intp(3, 0, 11)
	.word 0xf8750000  ! 237: STX_R	stx	%r28, [%r20 + %r0]
	.word 0xf8344000  ! 238: STH_R	sth	%r28, [%r17 + %r0]
	.word 0xfe2d21c4  ! 241: STB_I	stb	%r31, [%r20 + 0x01c4]
	.word 0xb2c44000  ! 243: ADDCcc_R	addccc 	%r17, %r0, %r25
hwintr_3_14:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_14), 16, 16)) -> intp(3, 0, 1b)
hwintr_3_15:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_15), 16, 16)) -> intp(3, 0, 13)
	.word 0xb295e108  ! 248: ORcc_I	orcc 	%r23, 0x0108, %r25
	.word 0xf6752033  ! 251: STX_I	stx	%r27, [%r20 + 0x0033]
hwintr_3_16:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_16), 16, 16)) -> intp(3, 0, 24)
	.word 0x8194210c  ! 256: WRPR_TPC_I	wrpr	%r16, 0x010c, %tpc
	.word 0x8d95a1d8  ! 259: WRPR_PSTATE_I	wrpr	%r22, 0x01d8, %pstate
	.word 0xb1504000  ! 260: RDPR_TNPC	rdpr	%tnpc, %r24
	.word 0xf73c8000  ! 262: STDF_R	std	%f27, [%r0, %r18]
	.word 0xf635610b  ! 263: STH_I	sth	%r27, [%r21 + 0x010b]
	.word 0xb3500000  ! 266: RDPR_TPC	<illegal instruction>
	.word 0xf22da150  ! 267: STB_I	stb	%r25, [%r22 + 0x0150]
	.word 0xfa24c000  ! 269: STW_R	stw	%r29, [%r19 + %r0]
	.word 0xfe34e12f  ! 271: STH_I	sth	%r31, [%r19 + 0x012f]
	.word 0xfa340000  ! 272: STH_R	sth	%r29, [%r16 + %r0]
	.word 0xb7540000  ! 273: RDPR_GL	<illegal instruction>
	.word 0xf4752105  ! 277: STX_I	stx	%r26, [%r20 + 0x0105]
	.word 0xf474e1f3  ! 279: STX_I	stx	%r26, [%r19 + 0x01f3]
	.word 0xf73d6132  ! 280: STDF_I	std	%f27, [0x0132, %r21]
	.word 0xf03c20f4  ! 281: STD_I	std	%r24, [%r16 + 0x00f4]
	.word 0xf03de09f  ! 282: STD_I	std	%r24, [%r23 + 0x009f]
	.word 0xf0248000  ! 285: STW_R	stw	%r24, [%r18 + %r0]
	.word 0xf23d60b7  ! 288: STD_I	std	%r25, [%r21 + 0x00b7]
	.word 0x819420b9  ! 290: WRPR_TPC_I	wrpr	%r16, 0x00b9, %tpc
hwintr_3_17:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_17), 16, 16)) -> intp(3, 0, 1)
	.word 0xbea56180  ! 292: SUBcc_I	subcc 	%r21, 0x0180, %r31
	.word 0xf93d2067  ! 293: STDF_I	std	%f28, [0x0067, %r20]
	.word 0xf074a122  ! 295: STX_I	stx	%r24, [%r18 + 0x0122]
	.word 0xb5510000  ! 296: RDPR_TICK	rdpr	%tick, %r26
	.word 0xb551c000  ! 299: RDPR_TL	<illegal instruction>
	.word 0x8594e1c1  ! 301: WRPR_TSTATE_I	wrpr	%r19, 0x01c1, %tstate
	.word 0xf074e155  ! 305: STX_I	stx	%r24, [%r19 + 0x0155]
	.word 0x85952147  ! 308: WRPR_TSTATE_I	wrpr	%r20, 0x0147, %tstate
	setx	0xac70086000008f50, %g1, %r10
	.word 0x839a8000  ! 310: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf13c8000  ! 316: STDF_R	std	%f24, [%r0, %r18]
	.word 0xf425c000  ! 317: STW_R	stw	%r26, [%r23 + %r0]
	.word 0xf834c000  ! 319: STH_R	sth	%r28, [%r19 + %r0]
	.word 0xfe2460ba  ! 320: STW_I	stw	%r31, [%r17 + 0x00ba]
	.word 0xff3c4000  ! 323: STDF_R	std	%f31, [%r0, %r17]
	.word 0xfc7520b7  ! 325: STX_I	stx	%r30, [%r20 + 0x00b7]
	.word 0xfa3c602f  ! 326: STD_I	std	%r29, [%r17 + 0x002f]
	.word 0x8194e060  ! 333: WRPR_TPC_I	wrpr	%r19, 0x0060, %tpc
	.word 0x8594a0e6  ! 335: WRPR_TSTATE_I	wrpr	%r18, 0x00e6, %tstate
	.word 0xb3504000  ! 338: RDPR_TNPC	rdpr	%tnpc, %r25
	.word 0xb550c000  ! 339: RDPR_TT	<illegal instruction>
	.word 0xff3ca172  ! 340: STDF_I	std	%f31, [0x0172, %r18]
	.word 0xb551c000  ! 341: RDPR_TL	<illegal instruction>
hwintr_3_18:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_18), 16, 16)) -> intp(3, 0, 32)
	.word 0xf225c000  ! 343: STW_R	stw	%r25, [%r23 + %r0]
	.word 0xf43c217f  ! 344: STD_I	std	%r26, [%r16 + 0x017f]
	setx	0xd7fc785a0000bc48, %g1, %r10
	.word 0x839a8000  ! 345: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf625e1aa  ! 347: STW_I	stw	%r27, [%r23 + 0x01aa]
	.word 0xb1480000  ! 349: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
hwintr_3_19:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_19), 16, 16)) -> intp(3, 0, e)
hwintr_3_20:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_20), 16, 16)) -> intp(3, 0, 26)
	.word 0xfc25c000  ! 363: STW_R	stw	%r30, [%r23 + %r0]
	.word 0x8395e0a7  ! 365: WRPR_TNPC_I	wrpr	%r23, 0x00a7, %tnpc
	.word 0xf83ce11c  ! 366: STD_I	std	%r28, [%r19 + 0x011c]
	.word 0xf03d61ea  ! 367: STD_I	std	%r24, [%r21 + 0x01ea]
	.word 0xbe8d0000  ! 372: ANDcc_R	andcc 	%r20, %r0, %r31
	.word 0xf87421d5  ! 376: STX_I	stx	%r28, [%r16 + 0x01d5]
	mov	1, %r12
	.word 0xa1930000  ! 380: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf42dc000  ! 382: STB_R	stb	%r26, [%r23 + %r0]
hwintr_3_21:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_21), 16, 16)) -> intp(3, 0, 2e)
	.word 0xf6342033  ! 387: STH_I	sth	%r27, [%r16 + 0x0033]
	.word 0x8d95216f  ! 389: WRPR_PSTATE_I	wrpr	%r20, 0x016f, %pstate
	.word 0xb5540000  ! 392: RDPR_GL	rdpr	%-, %r26
	.word 0xf434c000  ! 393: STH_R	sth	%r26, [%r19 + %r0]
	.word 0xb4c561be  ! 394: ADDCcc_I	addccc 	%r21, 0x01be, %r26
	.word 0xf475e0fe  ! 396: STX_I	stx	%r26, [%r23 + 0x00fe]
	.word 0x8194e0ae  ! 402: WRPR_TPC_I	wrpr	%r19, 0x00ae, %tpc
	.word 0xb5518000  ! 407: RDPR_PSTATE	rdpr	%pstate, %r26
	.word 0xfd3c2043  ! 411: STDF_I	std	%f30, [0x0043, %r16]
	.word 0xf33ce0a6  ! 412: STDF_I	std	%f25, [0x00a6, %r19]
	setx	data_start_6, %g1, %r20
	.word 0xfc256188  ! 417: STW_I	stw	%r30, [%r21 + 0x0188]
	.word 0xbf359000  ! 419: SRLX_R	srlx	%r22, %r0, %r31
	.word 0x8594a1c6  ! 423: WRPR_TSTATE_I	wrpr	%r18, 0x01c6, %tstate
	.word 0xbf518000  ! 425: RDPR_PSTATE	rdpr	%pstate, %r31
	.word 0xf23c4000  ! 426: STD_R	std	%r25, [%r17 + %r0]
	.word 0xfe34a0bc  ! 429: STH_I	sth	%r31, [%r18 + 0x00bc]
	.word 0xb751c000  ! 436: RDPR_TL	<illegal instruction>
	.word 0xf42d0000  ! 437: STB_R	stb	%r26, [%r20 + %r0]
	.word 0xb134c000  ! 439: SRL_R	srl 	%r19, %r0, %r24
	.word 0xbab5c000  ! 443: ORNcc_R	orncc 	%r23, %r0, %r29
	.word 0xfc3d2090  ! 447: STD_I	std	%r30, [%r20 + 0x0090]
	.word 0xb1643801  ! 448: MOVcc_I	<illegal instruction>
	.word 0xf13da1fc  ! 449: STDF_I	std	%f24, [0x01fc, %r22]
	.word 0xfc354000  ! 451: STH_R	sth	%r30, [%r21 + %r0]
	.word 0xbb518000  ! 452: RDPR_PSTATE	<illegal instruction>
	.word 0xb4950000  ! 453: ORcc_R	orcc 	%r20, %r0, %r26
	.word 0xf63de107  ! 455: STD_I	std	%r27, [%r23 + 0x0107]
	.word 0xfa248000  ! 458: STW_R	stw	%r29, [%r18 + %r0]
	.word 0xfe746010  ! 459: STX_I	stx	%r31, [%r17 + 0x0010]
	.word 0xf224a023  ! 462: STW_I	stw	%r25, [%r18 + 0x0023]
	.word 0xb5508000  ! 464: RDPR_TSTATE	<illegal instruction>
	.word 0xba0c8000  ! 465: AND_R	and 	%r18, %r0, %r29
	.word 0x8795e06d  ! 467: WRPR_TT_I	wrpr	%r23, 0x006d, %tt
hwintr_3_22:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_22), 16, 16)) -> intp(3, 0, 1b)
	.word 0xf82c8000  ! 470: STB_R	stb	%r28, [%r18 + %r0]
	.word 0xb4b58000  ! 472: ORNcc_R	orncc 	%r22, %r0, %r26
	.word 0xfe74a1a2  ! 473: STX_I	stx	%r31, [%r18 + 0x01a2]
	.word 0xf6750000  ! 475: STX_R	stx	%r27, [%r20 + %r0]
	.word 0xf625601b  ! 477: STW_I	stw	%r27, [%r21 + 0x001b]
	.word 0xbb480000  ! 480: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xf8350000  ! 481: STH_R	sth	%r28, [%r20 + %r0]
	.word 0x8d956070  ! 485: WRPR_PSTATE_I	wrpr	%r21, 0x0070, %pstate
hwintr_3_23:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_23), 16, 16)) -> intp(3, 0, 2c)
	.word 0xf6248000  ! 488: STW_R	stw	%r27, [%r18 + %r0]
hwintr_3_24:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_24), 16, 16)) -> intp(3, 0, 35)
hwintr_3_25:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_25), 16, 16)) -> intp(3, 0, 19)
	.word 0x89956080  ! 496: WRPR_TICK_I	wrpr	%r21, 0x0080, %tick
hwintr_3_26:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_26), 16, 16)) -> intp(3, 0, 20)
	.word 0xff3c4000  ! 504: STDF_R	std	%f31, [%r0, %r17]
	mov	2, %r12
	.word 0x8f930000  ! 505: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf22461e3  ! 509: STW_I	stw	%r25, [%r17 + 0x01e3]
	.word 0xf074c000  ! 510: STX_R	stx	%r24, [%r19 + %r0]
	mov	1, %r12
	.word 0xa1930000  ! 513: WRPR_GL_R	wrpr	%r12, %r0, %-
hwintr_3_27:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_27), 16, 16)) -> intp(3, 0, 35)
	.word 0xf33cc000  ! 518: STDF_R	std	%f25, [%r0, %r19]
	.word 0xb12d9000  ! 520: SLLX_R	sllx	%r22, %r0, %r24
	.word 0xfa344000  ! 526: STH_R	sth	%r29, [%r17 + %r0]
	.word 0x839420fd  ! 529: WRPR_TNPC_I	wrpr	%r16, 0x00fd, %tnpc
	.word 0xfc34e194  ! 530: STH_I	sth	%r30, [%r19 + 0x0194]
	.word 0x8795610c  ! 533: WRPR_TT_I	wrpr	%r21, 0x010c, %tt
	.word 0xf63d8000  ! 543: STD_R	std	%r27, [%r22 + %r0]
	.word 0xf225e1f2  ! 544: STW_I	stw	%r25, [%r23 + 0x01f2]
	.word 0xb62421e2  ! 545: SUB_I	sub 	%r16, 0x01e2, %r27
	.word 0xfa2ca1b0  ! 547: STB_I	stb	%r29, [%r18 + 0x01b0]
	.word 0xf0344000  ! 548: STH_R	sth	%r24, [%r17 + %r0]
	.word 0x8995a0ef  ! 549: WRPR_TICK_I	wrpr	%r22, 0x00ef, %tick
	mov	0, %r12
	.word 0xa1930000  ! 550: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbc2520fc  ! 552: SUB_I	sub 	%r20, 0x00fc, %r30
hwintr_3_28:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_28), 16, 16)) -> intp(3, 0, 1d)
hwintr_3_29:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_29), 16, 16)) -> intp(3, 0, 10)
	.word 0xf13c0000  ! 556: STDF_R	std	%f24, [%r0, %r16]
	.word 0xfe75a1f1  ! 558: STX_I	stx	%r31, [%r22 + 0x01f1]
	.word 0xb3641800  ! 560: MOVcc_R	<illegal instruction>
	.word 0x8d95e1d8  ! 562: WRPR_PSTATE_I	wrpr	%r23, 0x01d8, %pstate
hwintr_3_30:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_30), 16, 16)) -> intp(3, 0, 3f)
	.word 0xf6246066  ! 570: STW_I	stw	%r27, [%r17 + 0x0066]
	.word 0xf82c8000  ! 572: STB_R	stb	%r28, [%r18 + %r0]
	.word 0xfb3ca0fd  ! 573: STDF_I	std	%f29, [0x00fd, %r18]
	.word 0xfc2d61da  ! 574: STB_I	stb	%r30, [%r21 + 0x01da]
	setx	0x3c9ad83400001814, %g1, %r10
	.word 0x839a8000  ! 575: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf2346057  ! 578: STH_I	sth	%r25, [%r17 + 0x0057]
	.word 0x859421b7  ! 580: WRPR_TSTATE_I	wrpr	%r16, 0x01b7, %tstate
	setx	data_start_1, %g1, %r19
	setx	data_start_5, %g1, %r21
	.word 0xb1508000  ! 583: RDPR_TSTATE	rdpr	%tstate, %r24
	.word 0xf4358000  ! 588: STH_R	sth	%r26, [%r22 + %r0]
	.word 0xfc2d4000  ! 589: STB_R	stb	%r30, [%r21 + %r0]
	.word 0xb350c000  ! 590: RDPR_TT	<illegal instruction>
	.word 0xf63d6107  ! 593: STD_I	std	%r27, [%r21 + 0x0107]
	.word 0xbf51c000  ! 596: RDPR_TL	<illegal instruction>
	.word 0xbf520000  ! 598: RDPR_PIL	<illegal instruction>
	.word 0xfe24e08f  ! 599: STW_I	stw	%r31, [%r19 + 0x008f]
	.word 0xf83da0f3  ! 601: STD_I	std	%r28, [%r22 + 0x00f3]
	.word 0xf93ce03f  ! 603: STDF_I	std	%f28, [0x003f, %r19]
	.word 0xf93ca091  ! 604: STDF_I	std	%f28, [0x0091, %r18]
	.word 0xff3cc000  ! 605: STDF_R	std	%f31, [%r0, %r19]
	.word 0xb6240000  ! 606: SUB_R	sub 	%r16, %r0, %r27
	.word 0xbb50c000  ! 608: RDPR_TT	<illegal instruction>
hwintr_3_31:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_31), 16, 16)) -> intp(3, 0, d)
	.word 0xb2c58000  ! 611: ADDCcc_R	addccc 	%r22, %r0, %r25
hwintr_3_32:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_32), 16, 16)) -> intp(3, 0, b)
	.word 0xf8344000  ! 615: STH_R	sth	%r28, [%r17 + %r0]
hwintr_3_33:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_33), 16, 16)) -> intp(3, 0, 18)
	.word 0xf33c0000  ! 617: STDF_R	std	%f25, [%r0, %r16]
	.word 0xf42d0000  ! 618: STB_R	stb	%r26, [%r20 + %r0]
	.word 0xf23c612c  ! 621: STD_I	std	%r25, [%r17 + 0x012c]
hwintr_3_34:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_34), 16, 16)) -> intp(3, 0, 2c)
	.word 0xf274a101  ! 624: STX_I	stx	%r25, [%r18 + 0x0101]
	.word 0xbb2d8000  ! 626: SLL_R	sll 	%r22, %r0, %r29
	.word 0xb434c000  ! 627: SUBC_R	orn 	%r19, %r0, %r26
	.word 0x8394210a  ! 629: WRPR_TNPC_I	wrpr	%r16, 0x010a, %tnpc
	.word 0xbf500000  ! 633: RDPR_TPC	rdpr	%tpc, %r31
	.word 0xbb480000  ! 639: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
hwintr_3_35:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_35), 16, 16)) -> intp(3, 0, 39)
	.word 0xf13d6068  ! 641: STDF_I	std	%f24, [0x0068, %r21]
	.word 0xfe2cc000  ! 642: STB_R	stb	%r31, [%r19 + %r0]
	mov	2, %r12
	.word 0x8f930000  ! 648: WRPR_TL_R	wrpr	%r12, %r0, %tl
hwintr_3_36:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_36), 16, 16)) -> intp(3, 0, 3b)
hwintr_3_37:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_37), 16, 16)) -> intp(3, 0, 29)
	.word 0xf825a1cb  ! 652: STW_I	stw	%r28, [%r22 + 0x01cb]
	.word 0xf13dc000  ! 653: STDF_R	std	%f24, [%r0, %r23]
	.word 0xfe3d6129  ! 654: STD_I	std	%r31, [%r21 + 0x0129]
	.word 0xf23ce1b1  ! 655: STD_I	std	%r25, [%r19 + 0x01b1]
	.word 0xfe7461e0  ! 656: STX_I	stx	%r31, [%r17 + 0x01e0]
	.word 0xfc250000  ! 657: STW_R	stw	%r30, [%r20 + %r0]
	.word 0xfc754000  ! 658: STX_R	stx	%r30, [%r21 + %r0]
	.word 0xf63da11a  ! 659: STD_I	std	%r27, [%r22 + 0x011a]
	.word 0xf03c4000  ! 662: STD_R	std	%r24, [%r17 + %r0]
	setx	data_start_5, %g1, %r23
	.word 0x919560f4  ! 667: WRPR_PIL_I	wrpr	%r21, 0x00f4, %pil
	.word 0xfe3ce197  ! 672: STD_I	std	%r31, [%r19 + 0x0197]
hwintr_3_38:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_38), 16, 16)) -> intp(3, 0, 2)
	.word 0xbd7de401  ! 675: MOVR_I	movre	%r23, 0x1, %r30
	.word 0xf82c6042  ! 677: STB_I	stb	%r28, [%r17 + 0x0042]
	.word 0xb615a0b6  ! 679: OR_I	or 	%r22, 0x00b6, %r27
hwintr_3_39:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_39), 16, 16)) -> intp(3, 0, 3d)
hwintr_3_40:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_40), 16, 16)) -> intp(3, 0, a)
	.word 0xb824608c  ! 685: SUB_I	sub 	%r17, 0x008c, %r28
	.word 0xfa354000  ! 686: STH_R	sth	%r29, [%r21 + %r0]
	setx	0x5c8e782000003d43, %g1, %r10
	.word 0x819a8000  ! 692: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf225e0c9  ! 695: STW_I	stw	%r25, [%r23 + 0x00c9]
	.word 0x8194a19e  ! 696: WRPR_TPC_I	wrpr	%r18, 0x019e, %tpc
	.word 0xf8358000  ! 697: STH_R	sth	%r28, [%r22 + %r0]
	.word 0xf6240000  ! 700: STW_R	stw	%r27, [%r16 + %r0]
	.word 0xf4254000  ! 702: STW_R	stw	%r26, [%r21 + %r0]
	.word 0xf33ca1d1  ! 703: STDF_I	std	%f25, [0x01d1, %r18]
	setx	0xdcf2618d0000e8c5, %g1, %r10
	.word 0x839a8000  ! 706: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf4358000  ! 708: STH_R	sth	%r26, [%r22 + %r0]
	.word 0xbc3c0000  ! 710: XNOR_R	xnor 	%r16, %r0, %r30
	.word 0x91956077  ! 711: WRPR_PIL_I	wrpr	%r21, 0x0077, %pil
	.word 0x81946126  ! 719: WRPR_TPC_I	wrpr	%r17, 0x0126, %tpc
	.word 0xfa342094  ! 726: STH_I	sth	%r29, [%r16 + 0x0094]
	.word 0xfe2dc000  ! 727: STB_R	stb	%r31, [%r23 + %r0]
	.word 0xf635a086  ! 728: STH_I	sth	%r27, [%r22 + 0x0086]
	.word 0x8995615a  ! 730: WRPR_TICK_I	wrpr	%r21, 0x015a, %tick
hwintr_3_41:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_41), 16, 16)) -> intp(3, 0, 3d)
	.word 0xb73c2001  ! 732: SRA_I	sra 	%r16, 0x0001, %r27
	.word 0xf33de199  ! 738: STDF_I	std	%f25, [0x0199, %r23]
hwintr_3_42:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_42), 16, 16)) -> intp(3, 0, 3e)
	.word 0xfc2d6097  ! 743: STB_I	stb	%r30, [%r21 + 0x0097]
	.word 0xfe35a161  ! 746: STH_I	sth	%r31, [%r22 + 0x0161]
	.word 0xb5510000  ! 748: RDPR_TICK	rdpr	%tick, %r26
hwintr_3_43:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_43), 16, 16)) -> intp(3, 0, 1)
	.word 0xf8748000  ! 751: STX_R	stx	%r28, [%r18 + %r0]
	.word 0xfc2ce14b  ! 752: STB_I	stb	%r30, [%r19 + 0x014b]
	.word 0xfc2d8000  ! 758: STB_R	stb	%r30, [%r22 + %r0]
	.word 0x9194a11f  ! 760: WRPR_PIL_I	wrpr	%r18, 0x011f, %pil
	.word 0xf234a0a0  ! 766: STH_I	sth	%r25, [%r18 + 0x00a0]
	.word 0x819560b1  ! 767: WRPR_TPC_I	wrpr	%r21, 0x00b1, %tpc
	setx	0x8d0ca84300006d83, %g1, %r10
	.word 0x819a8000  ! 768: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbb520000  ! 770: RDPR_PIL	rdpr	%pil, %r29
	.word 0x9195a022  ! 774: WRPR_PIL_I	wrpr	%r22, 0x0022, %pil
hwintr_3_44:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_44), 16, 16)) -> intp(3, 0, d)
	.word 0xb3345000  ! 776: SRLX_R	srlx	%r17, %r0, %r25
	.word 0x859461ce  ! 779: WRPR_TSTATE_I	wrpr	%r17, 0x01ce, %tstate
	.word 0x899521d8  ! 780: WRPR_TICK_I	wrpr	%r20, 0x01d8, %tick
	.word 0x8d95a0ca  ! 781: WRPR_PSTATE_I	wrpr	%r22, 0x00ca, %pstate
	.word 0xfd3d0000  ! 783: STDF_R	std	%f30, [%r0, %r20]
	.word 0xfc74a033  ! 785: STX_I	stx	%r30, [%r18 + 0x0033]
	.word 0xfb3ca01c  ! 788: STDF_I	std	%f29, [0x001c, %r18]
	mov	1, %r12
	.word 0x8f930000  ! 789: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf4758000  ! 791: STX_R	stx	%r26, [%r22 + %r0]
	.word 0x89946044  ! 793: WRPR_TICK_I	wrpr	%r17, 0x0044, %tick
	.word 0xfa750000  ! 795: STX_R	stx	%r29, [%r20 + %r0]
	.word 0x8d9521b8  ! 797: WRPR_PSTATE_I	wrpr	%r20, 0x01b8, %pstate
hwintr_3_45:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_45), 16, 16)) -> intp(3, 0, 12)
hwintr_3_46:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_46), 16, 16)) -> intp(3, 0, 24)
	.word 0xf4254000  ! 802: STW_R	stw	%r26, [%r21 + %r0]
	.word 0xf674c000  ! 804: STX_R	stx	%r27, [%r19 + %r0]
	.word 0xf03c0000  ! 805: STD_R	std	%r24, [%r16 + %r0]
	.word 0xf8258000  ! 809: STW_R	stw	%r28, [%r22 + %r0]
hwintr_3_47:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_47), 16, 16)) -> intp(3, 0, 3c)
	.word 0xf2254000  ! 820: STW_R	stw	%r25, [%r21 + %r0]
	.word 0xf33ce011  ! 821: STDF_I	std	%f25, [0x0011, %r19]
	.word 0xf8340000  ! 822: STH_R	sth	%r28, [%r16 + %r0]
	.word 0xf22d61cb  ! 825: STB_I	stb	%r25, [%r21 + 0x01cb]
	.word 0xb3510000  ! 826: RDPR_TICK	rdpr	%tick, %r25
	.word 0x859421d9  ! 827: WRPR_TSTATE_I	wrpr	%r16, 0x01d9, %tstate
	.word 0x8395a002  ! 828: WRPR_TNPC_I	wrpr	%r22, 0x0002, %tnpc
	.word 0x8d95200f  ! 830: WRPR_PSTATE_I	wrpr	%r20, 0x000f, %pstate
	.word 0xf93c0000  ! 833: STDF_R	std	%f28, [%r0, %r16]
	.word 0x83956050  ! 839: WRPR_TNPC_I	wrpr	%r21, 0x0050, %tnpc
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
hwintr_3_48:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_48), 16, 16)) -> intp(3, 0, b)
	.word 0xfd3c21cb  ! 846: STDF_I	std	%f30, [0x01cb, %r16]
	.word 0x8795a0ee  ! 848: WRPR_TT_I	wrpr	%r22, 0x00ee, %tt
	.word 0xf82c8000  ! 850: STB_R	stb	%r28, [%r18 + %r0]
	.word 0xf93d61c4  ! 853: STDF_I	std	%f28, [0x01c4, %r21]
	.word 0xb4ac8000  ! 854: ANDNcc_R	andncc 	%r18, %r0, %r26
	.word 0x8194a08a  ! 857: WRPR_TPC_I	wrpr	%r18, 0x008a, %tpc
	.word 0xf0254000  ! 864: STW_R	stw	%r24, [%r21 + %r0]
	.word 0xf53d0000  ! 866: STDF_R	std	%f26, [%r0, %r20]
	.word 0xb0b5212b  ! 867: SUBCcc_I	orncc 	%r20, 0x012b, %r24
	.word 0xb3480000  ! 869: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xf4746182  ! 872: STX_I	stx	%r26, [%r17 + 0x0182]
	.word 0xf22d606a  ! 873: STB_I	stb	%r25, [%r21 + 0x006a]
	.word 0xbc1cc000  ! 876: XOR_R	xor 	%r19, %r0, %r30
	.word 0xf42c2066  ! 878: STB_I	stb	%r26, [%r16 + 0x0066]
	.word 0xf33d4000  ! 882: STDF_R	std	%f25, [%r0, %r21]
	.word 0xb4140000  ! 883: OR_R	or 	%r16, %r0, %r26
	.word 0xf53c8000  ! 885: STDF_R	std	%f26, [%r0, %r18]
	.word 0xba944000  ! 886: ORcc_R	orcc 	%r17, %r0, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb551c000  ! 894: RDPR_TL	<illegal instruction>
	.word 0xb3500000  ! 897: RDPR_TPC	<illegal instruction>
	.word 0xf834a1b0  ! 898: STH_I	sth	%r28, [%r18 + 0x01b0]
hwintr_3_49:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_49), 16, 16)) -> intp(3, 0, 2f)
	mov	2, %r12
	.word 0x8f930000  ! 903: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf43c0000  ! 907: STD_R	std	%r26, [%r16 + %r0]
	.word 0xfe24e0c2  ! 911: STW_I	stw	%r31, [%r19 + 0x00c2]
	.word 0x8795a1b0  ! 912: WRPR_TT_I	wrpr	%r22, 0x01b0, %tt
	.word 0xfe2de1f3  ! 917: STB_I	stb	%r31, [%r23 + 0x01f3]
	.word 0xfe2d6071  ! 920: STB_I	stb	%r31, [%r21 + 0x0071]
	.word 0xf22d21f3  ! 924: STB_I	stb	%r25, [%r20 + 0x01f3]
hwintr_3_50:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_50), 16, 16)) -> intp(3, 0, 26)
	.word 0xb9480000  ! 930: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xfe240000  ! 933: STW_R	stw	%r31, [%r16 + %r0]
	.word 0xf82de14c  ! 934: STB_I	stb	%r28, [%r23 + 0x014c]
	.word 0xf22d0000  ! 935: STB_R	stb	%r25, [%r20 + %r0]
	.word 0x819460f5  ! 939: WRPR_TPC_I	wrpr	%r17, 0x00f5, %tpc
	.word 0x81942095  ! 940: WRPR_TPC_I	wrpr	%r16, 0x0095, %tpc
	.word 0xb7540000  ! 941: RDPR_GL	rdpr	%-, %r27
	.word 0xf4352073  ! 942: STH_I	sth	%r26, [%r20 + 0x0073]
	.word 0xff3d219e  ! 944: STDF_I	std	%f31, [0x019e, %r20]
	.word 0xfc740000  ! 946: STX_R	stx	%r30, [%r16 + %r0]
	.word 0xf83c8000  ! 947: STD_R	std	%r28, [%r18 + %r0]
	.word 0xf03ca09d  ! 948: STD_I	std	%r24, [%r18 + 0x009d]
	.word 0xf4244000  ! 958: STW_R	stw	%r26, [%r17 + %r0]
	.word 0xf62d0000  ! 959: STB_R	stb	%r27, [%r20 + %r0]
	.word 0xf635c000  ! 963: STH_R	sth	%r27, [%r23 + %r0]
	.word 0xfe3d4000  ! 964: STD_R	std	%r31, [%r21 + %r0]
	.word 0x8d95e1aa  ! 967: WRPR_PSTATE_I	wrpr	%r23, 0x01aa, %pstate
	.word 0xf034c000  ! 968: STH_R	sth	%r24, [%r19 + %r0]
	.word 0xf8344000  ! 971: STH_R	sth	%r28, [%r17 + %r0]
	.word 0xb8a50000  ! 973: SUBcc_R	subcc 	%r20, %r0, %r28
	.word 0xfa244000  ! 975: STW_R	stw	%r29, [%r17 + %r0]
	.word 0xf53c0000  ! 977: STDF_R	std	%f26, [%r0, %r16]
	.word 0xb9520000  ! 980: RDPR_PIL	rdpr	%pil, %r28
	.word 0xf42d4000  ! 981: STB_R	stb	%r26, [%r21 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbd518000  ! 989: RDPR_PSTATE	<illegal instruction>
	.word 0x8395a012  ! 990: WRPR_TNPC_I	wrpr	%r22, 0x0012, %tnpc
	.word 0xf02da119  ! 991: STB_I	stb	%r24, [%r22 + 0x0119]
	.word 0xb5540000  ! 994: RDPR_GL	rdpr	%-, %r26
	.word 0xfe25615d  ! 996: STW_I	stw	%r31, [%r21 + 0x015d]
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
	.word 0x8394e09e  ! 4: WRPR_TNPC_I	wrpr	%r19, 0x009e, %tnpc
	.word 0xfa45e0fa  ! 8: LDSW_I	ldsw	[%r23 + 0x00fa], %r29
	.word 0xf61ce164  ! 12: LDD_I	ldd	[%r19 + 0x0164], %r27
	.word 0xf45c8000  ! 13: LDX_R	ldx	[%r18 + %r0], %r26
hwintr_2_0:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_0), 16, 16)) -> intp(2, 0, 34)
	.word 0xfc0421cc  ! 21: LDUW_I	lduw	[%r16 + 0x01cc], %r30
hwintr_2_1:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_1), 16, 16)) -> intp(2, 0, 2b)
	.word 0xf615a0d3  ! 23: LDUH_I	lduh	[%r22 + 0x00d3], %r27
	.word 0xfa5c0000  ! 25: LDX_R	ldx	[%r16 + %r0], %r29
	.word 0xb815c000  ! 26: OR_R	or 	%r23, %r0, %r28
	.word 0xb48de114  ! 27: ANDcc_I	andcc 	%r23, 0x0114, %r26
hwintr_2_2:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_2), 16, 16)) -> intp(2, 0, 1a)
hwintr_2_3:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_3), 16, 16)) -> intp(2, 0, 8)
	.word 0x8195a075  ! 32: WRPR_TPC_I	wrpr	%r22, 0x0075, %tpc
	.word 0xf61c4000  ! 38: LDD_R	ldd	[%r17 + %r0], %r27
	setx	0x828abb390000ec94, %g1, %r10
	.word 0x819a8000  ! 57: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb21c4000  ! 58: XOR_R	xor 	%r17, %r0, %r25
	.word 0xf014a1b8  ! 60: LDUH_I	lduh	[%r18 + 0x01b8], %r24
	.word 0xb7344000  ! 63: SRL_R	srl 	%r17, %r0, %r27
	.word 0x8595a0d4  ! 65: WRPR_TSTATE_I	wrpr	%r22, 0x00d4, %tstate
	.word 0xfc55c000  ! 67: LDSH_R	ldsh	[%r23 + %r0], %r30
	.word 0xba9461b6  ! 69: ORcc_I	orcc 	%r17, 0x01b6, %r29
	.word 0xfe4c4000  ! 70: LDSB_R	ldsb	[%r17 + %r0], %r31
hwintr_2_4:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_4), 16, 16)) -> intp(2, 0, 2a)
	.word 0xf8146177  ! 73: LDUH_I	lduh	[%r17 + 0x0177], %r28
	.word 0xf41cc000  ! 74: LDD_R	ldd	[%r19 + %r0], %r26
	.word 0x899460fa  ! 75: WRPR_TICK_I	wrpr	%r17, 0x00fa, %tick
hwintr_2_5:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_5), 16, 16)) -> intp(2, 0, 2b)
	.word 0xf2556135  ! 79: LDSH_I	ldsh	[%r21 + 0x0135], %r25
	setx	0x9f53ed8400001d05, %g1, %r10
	.word 0x819a8000  ! 83: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
hwintr_2_6:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_6), 16, 16)) -> intp(2, 0, 3e)
	.word 0xf01c0000  ! 90: LDD_R	ldd	[%r16 + %r0], %r24
	.word 0xf80dc000  ! 92: LDUB_R	ldub	[%r23 + %r0], %r28
	.word 0xfe55611b  ! 94: LDSH_I	ldsh	[%r21 + 0x011b], %r31
	setx	0x2f19b5c70000ce99, %g1, %r10
	.word 0x839a8000  ! 95: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb03d8000  ! 97: XNOR_R	xnor 	%r22, %r0, %r24
	.word 0xfe440000  ! 99: LDSW_R	ldsw	[%r16 + %r0], %r31
	.word 0xbd540000  ! 101: RDPR_GL	<illegal instruction>
	.word 0xf04de04c  ! 102: LDSB_I	ldsb	[%r23 + 0x004c], %r24
	.word 0x8995e0b1  ! 103: WRPR_TICK_I	wrpr	%r23, 0x00b1, %tick
	.word 0xf41de0eb  ! 105: LDD_I	ldd	[%r23 + 0x00eb], %r26
hwintr_2_7:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_7), 16, 16)) -> intp(2, 0, 3e)
	.word 0xff1d604e  ! 107: LDDF_I	ldd	[%r21, 0x004e], %f31
	.word 0xbabda0bd  ! 108: XNORcc_I	xnorcc 	%r22, 0x00bd, %r29
	.word 0x83956067  ! 112: WRPR_TNPC_I	wrpr	%r21, 0x0067, %tnpc
	mov	0, %r12
	.word 0x8f930000  ! 114: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf044e1dc  ! 117: LDSW_I	ldsw	[%r19 + 0x01dc], %r24
	mov	1, %r12
	.word 0x8f930000  ! 119: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xba9de1c3  ! 120: XORcc_I	xorcc 	%r23, 0x01c3, %r29
	mov	0, %r12
	.word 0xa1930000  ! 121: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf20d8000  ! 122: LDUB_R	ldub	[%r22 + %r0], %r25
	.word 0xfa55205e  ! 123: LDSH_I	ldsh	[%r20 + 0x005e], %r29
hwintr_2_8:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_8), 16, 16)) -> intp(2, 0, 20)
	.word 0xfc05c000  ! 127: LDUW_R	lduw	[%r23 + %r0], %r30
	setx	0x62b1d55e0000c88b, %g1, %r10
	.word 0x819a8000  ! 128: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xfc1c21eb  ! 132: LDD_I	ldd	[%r16 + 0x01eb], %r30
	.word 0xf2054000  ! 134: LDUW_R	lduw	[%r21 + %r0], %r25
	.word 0xf254c000  ! 135: LDSH_R	ldsh	[%r19 + %r0], %r25
	.word 0xf60d614c  ! 137: LDUB_I	ldub	[%r21 + 0x014c], %r27
	setx	0x4cc40c5500003edd, %g1, %r10
	.word 0x819a8000  ! 145: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf21d8000  ! 146: LDD_R	ldd	[%r22 + %r0], %r25
	.word 0xf214c000  ! 147: LDUH_R	lduh	[%r19 + %r0], %r25
hwintr_2_9:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_9), 16, 16)) -> intp(2, 0, e)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf31c218f  ! 154: LDDF_I	ldd	[%r16, 0x018f], %f25
	.word 0xf01c6018  ! 158: LDD_I	ldd	[%r17 + 0x0018], %r24
	.word 0xfc0c6104  ! 162: LDUB_I	ldub	[%r17 + 0x0104], %r30
	.word 0xf0546036  ! 166: LDSH_I	ldsh	[%r17 + 0x0036], %r24
	.word 0xfa55c000  ! 167: LDSH_R	ldsh	[%r23 + %r0], %r29
	.word 0x9194200d  ! 168: WRPR_PIL_I	wrpr	%r16, 0x000d, %pil
hwintr_2_10:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_10), 16, 16)) -> intp(2, 0, 8)
	.word 0xfa444000  ! 172: LDSW_R	ldsw	[%r17 + %r0], %r29
	.word 0xfe444000  ! 173: LDSW_R	ldsw	[%r17 + %r0], %r31
	.word 0xf2140000  ! 176: LDUH_R	lduh	[%r16 + %r0], %r25
	.word 0x8595213a  ! 177: WRPR_TSTATE_I	wrpr	%r20, 0x013a, %tstate
	.word 0x8395a132  ! 181: WRPR_TNPC_I	wrpr	%r22, 0x0132, %tnpc
	.word 0xf645216c  ! 182: LDSW_I	ldsw	[%r20 + 0x016c], %r27
	.word 0xf41dc000  ! 186: LDD_R	ldd	[%r23 + %r0], %r26
	.word 0xfe0d0000  ! 190: LDUB_R	ldub	[%r20 + %r0], %r31
	.word 0xb835e12e  ! 192: ORN_I	orn 	%r23, 0x012e, %r28
	.word 0x8d956161  ! 193: WRPR_PSTATE_I	wrpr	%r21, 0x0161, %pstate
	.word 0xfc140000  ! 194: LDUH_R	lduh	[%r16 + %r0], %r30
	.word 0xf805a0dd  ! 196: LDUW_I	lduw	[%r22 + 0x00dd], %r28
hwintr_2_11:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_11), 16, 16)) -> intp(2, 0, 3d)
	.word 0xf40de0c6  ! 202: LDUB_I	ldub	[%r23 + 0x00c6], %r26
	mov	1, %r12
	.word 0x8f930000  ! 203: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf85d2091  ! 204: LDX_I	ldx	[%r20 + 0x0091], %r28
	.word 0x8194210d  ! 205: WRPR_TPC_I	wrpr	%r16, 0x010d, %tpc
	.word 0xbca54000  ! 206: SUBcc_R	subcc 	%r21, %r0, %r30
	.word 0xfa450000  ! 209: LDSW_R	ldsw	[%r20 + %r0], %r29
	.word 0xf614a08b  ! 211: LDUH_I	lduh	[%r18 + 0x008b], %r27
	.word 0xf604e099  ! 212: LDUW_I	lduw	[%r19 + 0x0099], %r27
	.word 0xb0b4e00d  ! 214: SUBCcc_I	orncc 	%r19, 0x000d, %r24
	.word 0xbd7d6401  ! 217: MOVR_I	movre	%r21, 0x1, %r30
	.word 0xbb3ca001  ! 218: SRA_I	sra 	%r18, 0x0001, %r29
	.word 0xb7480000  ! 219: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xf8054000  ! 220: LDUW_R	lduw	[%r21 + %r0], %r28
	.word 0xf24dc000  ! 222: LDSB_R	ldsb	[%r23 + %r0], %r25
	setx	data_start_0, %g1, %r18
	.word 0xf85c0000  ! 224: LDX_R	ldx	[%r16 + %r0], %r28
	.word 0xf64dc000  ! 227: LDSB_R	ldsb	[%r23 + %r0], %r27
hwintr_2_12:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_12), 16, 16)) -> intp(2, 0, 30)
hwintr_2_13:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_13), 16, 16)) -> intp(2, 0, 1f)
	.word 0xff1ca1e8  ! 240: LDDF_I	ldd	[%r18, 0x01e8], %f31
	.word 0xf71c4000  ! 242: LDDF_R	ldd	[%r17, %r0], %f27
	.word 0xbcc48000  ! 243: ADDCcc_R	addccc 	%r18, %r0, %r30
hwintr_2_14:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_14), 16, 16)) -> intp(2, 0, 1a)
hwintr_2_15:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_15), 16, 16)) -> intp(2, 0, 37)
	.word 0xb495216c  ! 248: ORcc_I	orcc 	%r20, 0x016c, %r26
	.word 0xfe548000  ! 250: LDSH_R	ldsh	[%r18 + %r0], %r31
hwintr_2_16:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_16), 16, 16)) -> intp(2, 0, 30)
	.word 0xfc5dc000  ! 253: LDX_R	ldx	[%r23 + %r0], %r30
	.word 0x8195a127  ! 256: WRPR_TPC_I	wrpr	%r22, 0x0127, %tpc
	.word 0xf61561dc  ! 257: LDUH_I	lduh	[%r21 + 0x01dc], %r27
	.word 0x8d946161  ! 259: WRPR_PSTATE_I	wrpr	%r17, 0x0161, %pstate
	.word 0xb7504000  ! 260: RDPR_TNPC	<illegal instruction>
	.word 0xf65dc000  ! 265: LDX_R	ldx	[%r23 + %r0], %r27
	.word 0xbb500000  ! 266: RDPR_TPC	<illegal instruction>
	.word 0xf00421a5  ! 268: LDUW_I	lduw	[%r16 + 0x01a5], %r24
	.word 0xb9540000  ! 273: RDPR_GL	<illegal instruction>
	.word 0xfe1d0000  ! 286: LDD_R	ldd	[%r20 + %r0], %r31
	.word 0x8195a1df  ! 290: WRPR_TPC_I	wrpr	%r22, 0x01df, %tpc
hwintr_2_17:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_17), 16, 16)) -> intp(2, 0, 29)
	.word 0xb2a56092  ! 292: SUBcc_I	subcc 	%r21, 0x0092, %r25
	.word 0xbf510000  ! 296: RDPR_TICK	<illegal instruction>
	.word 0xfa0520a5  ! 297: LDUW_I	lduw	[%r20 + 0x00a5], %r29
	.word 0xb551c000  ! 299: RDPR_TL	<illegal instruction>
	.word 0x8595e1f5  ! 301: WRPR_TSTATE_I	wrpr	%r23, 0x01f5, %tstate
	.word 0xf605212f  ! 304: LDUW_I	lduw	[%r20 + 0x012f], %r27
	.word 0xf64520ff  ! 306: LDSW_I	ldsw	[%r20 + 0x00ff], %r27
	.word 0xfc4d2162  ! 307: LDSB_I	ldsb	[%r20 + 0x0162], %r30
	.word 0x8594a160  ! 308: WRPR_TSTATE_I	wrpr	%r18, 0x0160, %tstate
	.word 0xf05c6197  ! 309: LDX_I	ldx	[%r17 + 0x0197], %r24
	setx	0xee08e6a00000cc0b, %g1, %r10
	.word 0x839a8000  ! 310: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xfe14a04f  ! 312: LDUH_I	lduh	[%r18 + 0x004f], %r31
	.word 0xf4158000  ! 321: LDUH_R	lduh	[%r22 + %r0], %r26
	.word 0xf014c000  ! 322: LDUH_R	lduh	[%r19 + %r0], %r24
	.word 0xf0150000  ! 331: LDUH_R	lduh	[%r20 + %r0], %r24
	.word 0x819561f3  ! 333: WRPR_TPC_I	wrpr	%r21, 0x01f3, %tpc
	.word 0x8594e055  ! 335: WRPR_TSTATE_I	wrpr	%r19, 0x0055, %tstate
	.word 0xbb504000  ! 338: RDPR_TNPC	<illegal instruction>
	.word 0xb150c000  ! 339: RDPR_TT	<illegal instruction>
	.word 0xbd51c000  ! 341: RDPR_TL	<illegal instruction>
hwintr_2_18:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_18), 16, 16)) -> intp(2, 0, 8)
	setx	0x5484b2a800000a0a, %g1, %r10
	.word 0x839a8000  ! 345: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xfa4c0000  ! 346: LDSB_R	ldsb	[%r16 + %r0], %r29
	.word 0xb5480000  ! 349: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xf64ce17f  ! 350: LDSB_I	ldsb	[%r19 + 0x017f], %r27
	.word 0xfa0c8000  ! 352: LDUB_R	ldub	[%r18 + %r0], %r29
	.word 0xf0454000  ! 356: LDSW_R	ldsw	[%r21 + %r0], %r24
hwintr_2_19:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_19), 16, 16)) -> intp(2, 0, 28)
	.word 0xf71dc000  ! 358: LDDF_R	ldd	[%r23, %r0], %f27
hwintr_2_20:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_20), 16, 16)) -> intp(2, 0, 2)
	.word 0xf455c000  ! 360: LDSH_R	ldsh	[%r23 + %r0], %r26
	.word 0xfa4d0000  ! 361: LDSB_R	ldsb	[%r20 + %r0], %r29
	.word 0xf8042005  ! 364: LDUW_I	lduw	[%r16 + 0x0005], %r28
	.word 0x8395a166  ! 365: WRPR_TNPC_I	wrpr	%r22, 0x0166, %tnpc
	.word 0xfc0c8000  ! 369: LDUB_R	ldub	[%r18 + %r0], %r30
	.word 0xfe14e050  ! 370: LDUH_I	lduh	[%r19 + 0x0050], %r31
	.word 0xb48d0000  ! 372: ANDcc_R	andcc 	%r20, %r0, %r26
	.word 0xfe55203d  ! 373: LDSH_I	ldsh	[%r20 + 0x003d], %r31
	.word 0xf41c209d  ! 374: LDD_I	ldd	[%r16 + 0x009d], %r26
	.word 0xf81c2052  ! 377: LDD_I	ldd	[%r16 + 0x0052], %r28
	mov	1, %r12
	.word 0xa1930000  ! 380: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xfc052027  ! 381: LDUW_I	lduw	[%r20 + 0x0027], %r30
	.word 0xf2048000  ! 383: LDUW_R	lduw	[%r18 + %r0], %r25
hwintr_2_21:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_21), 16, 16)) -> intp(2, 0, 14)
	.word 0xfc440000  ! 386: LDSW_R	ldsw	[%r16 + %r0], %r30
	.word 0x8d94a163  ! 389: WRPR_PSTATE_I	wrpr	%r18, 0x0163, %pstate
	.word 0xb1540000  ! 392: RDPR_GL	<illegal instruction>
	.word 0xb8c4e19f  ! 394: ADDCcc_I	addccc 	%r19, 0x019f, %r28
	.word 0xfc4d619c  ! 399: LDSB_I	ldsb	[%r21 + 0x019c], %r30
	.word 0x8194e096  ! 402: WRPR_TPC_I	wrpr	%r19, 0x0096, %tpc
	.word 0xb9518000  ! 407: RDPR_PSTATE	<illegal instruction>
	.word 0xf645a192  ! 408: LDSW_I	ldsw	[%r22 + 0x0192], %r27
	.word 0xf84de074  ! 409: LDSB_I	ldsb	[%r23 + 0x0074], %r28
	setx	data_start_7, %g1, %r16
	.word 0xf21421b6  ! 418: LDUH_I	lduh	[%r16 + 0x01b6], %r25
	.word 0xbf351000  ! 419: SRLX_R	srlx	%r20, %r0, %r31
	.word 0xf415a1fc  ! 422: LDUH_I	lduh	[%r22 + 0x01fc], %r26
	.word 0x8594a144  ! 423: WRPR_TSTATE_I	wrpr	%r18, 0x0144, %tstate
	.word 0xf645a1f3  ! 424: LDSW_I	ldsw	[%r22 + 0x01f3], %r27
	.word 0xbb518000  ! 425: RDPR_PSTATE	rdpr	%pstate, %r29
	.word 0xfd1cc000  ! 431: LDDF_R	ldd	[%r19, %r0], %f30
	.word 0xf45c6160  ! 432: LDX_I	ldx	[%r17 + 0x0160], %r26
	.word 0xf21da0c2  ! 433: LDD_I	ldd	[%r22 + 0x00c2], %r25
	.word 0xbf51c000  ! 436: RDPR_TL	<illegal instruction>
	.word 0xfc0dc000  ! 438: LDUB_R	ldub	[%r23 + %r0], %r30
	.word 0xbb354000  ! 439: SRL_R	srl 	%r21, %r0, %r29
	.word 0xb6b4c000  ! 443: ORNcc_R	orncc 	%r19, %r0, %r27
	.word 0xf01dc000  ! 446: LDD_R	ldd	[%r23 + %r0], %r24
	.word 0xb7643801  ! 448: MOVcc_I	<illegal instruction>
	.word 0xb5518000  ! 452: RDPR_PSTATE	<illegal instruction>
	.word 0xb2954000  ! 453: ORcc_R	orcc 	%r21, %r0, %r25
	.word 0xfa154000  ! 460: LDUH_R	lduh	[%r21 + %r0], %r29
	.word 0xbb508000  ! 464: RDPR_TSTATE	<illegal instruction>
	.word 0xbe0c8000  ! 465: AND_R	and 	%r18, %r0, %r31
	.word 0x8795e10b  ! 467: WRPR_TT_I	wrpr	%r23, 0x010b, %tt
	.word 0xf11d61df  ! 468: LDDF_I	ldd	[%r21, 0x01df], %f24
hwintr_2_22:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_22), 16, 16)) -> intp(2, 0, 14)
	.word 0xb0b5c000  ! 472: ORNcc_R	orncc 	%r23, %r0, %r24
	.word 0xf4444000  ! 474: LDSW_R	ldsw	[%r17 + %r0], %r26
	.word 0xf414207e  ! 476: LDUH_I	lduh	[%r16 + 0x007e], %r26
	.word 0xb1480000  ! 480: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xf64420db  ! 482: LDSW_I	ldsw	[%r16 + 0x00db], %r27
	.word 0xfc050000  ! 484: LDUW_R	lduw	[%r20 + %r0], %r30
	.word 0x8d95a0f1  ! 485: WRPR_PSTATE_I	wrpr	%r22, 0x00f1, %pstate
	.word 0xf45c0000  ! 486: LDX_R	ldx	[%r16 + %r0], %r26
hwintr_2_23:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_23), 16, 16)) -> intp(2, 0, 2)
	.word 0xf214c000  ! 489: LDUH_R	lduh	[%r19 + %r0], %r25
hwintr_2_24:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_24), 16, 16)) -> intp(2, 0, 18)
	.word 0xfa4560e2  ! 492: LDSW_I	ldsw	[%r21 + 0x00e2], %r29
	.word 0xfe4d0000  ! 493: LDSB_R	ldsb	[%r20 + %r0], %r31
hwintr_2_25:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_25), 16, 16)) -> intp(2, 0, 3)
	.word 0x8995e0e9  ! 496: WRPR_TICK_I	wrpr	%r23, 0x00e9, %tick
	.word 0xf40da1c5  ! 497: LDUB_I	ldub	[%r22 + 0x01c5], %r26
	.word 0xf80d60c9  ! 499: LDUB_I	ldub	[%r21 + 0x00c9], %r28
hwintr_2_26:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_26), 16, 16)) -> intp(2, 0, 4)
	mov	0, %r12
	.word 0x8f930000  ! 505: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf45de15f  ! 511: LDX_I	ldx	[%r23 + 0x015f], %r26
	mov	1, %r12
	.word 0xa1930000  ! 513: WRPR_GL_R	wrpr	%r12, %r0, %-
hwintr_2_27:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_27), 16, 16)) -> intp(2, 0, 16)
	.word 0xfe042036  ! 516: LDUW_I	lduw	[%r16 + 0x0036], %r31
	.word 0xf4142032  ! 519: LDUH_I	lduh	[%r16 + 0x0032], %r26
	.word 0xbf2d5000  ! 520: SLLX_R	sllx	%r21, %r0, %r31
	.word 0xfa0d0000  ! 524: LDUB_R	ldub	[%r20 + %r0], %r29
	.word 0xfe148000  ! 528: LDUH_R	lduh	[%r18 + %r0], %r31
	.word 0x83946130  ! 529: WRPR_TNPC_I	wrpr	%r17, 0x0130, %tnpc
	.word 0x879421bd  ! 533: WRPR_TT_I	wrpr	%r16, 0x01bd, %tt
	.word 0xf055c000  ! 535: LDSH_R	ldsh	[%r23 + %r0], %r24
	.word 0xf60d4000  ! 536: LDUB_R	ldub	[%r21 + %r0], %r27
	.word 0xfe558000  ! 537: LDSH_R	ldsh	[%r22 + %r0], %r31
	.word 0xf64c4000  ! 540: LDSB_R	ldsb	[%r17 + %r0], %r27
	.word 0xb825a088  ! 545: SUB_I	sub 	%r22, 0x0088, %r28
	.word 0xff1d0000  ! 546: LDDF_R	ldd	[%r20, %r0], %f31
	.word 0x8994e0e6  ! 549: WRPR_TICK_I	wrpr	%r19, 0x00e6, %tick
	mov	0, %r12
	.word 0xa1930000  ! 550: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbe24e1a7  ! 552: SUB_I	sub 	%r19, 0x01a7, %r31
hwintr_2_28:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_28), 16, 16)) -> intp(2, 0, 19)
hwintr_2_29:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_29), 16, 16)) -> intp(2, 0, 25)
	.word 0xf64c4000  ! 555: LDSB_R	ldsb	[%r17 + %r0], %r27
	.word 0xb5641800  ! 560: MOVcc_R	<illegal instruction>
	.word 0xf414c000  ! 561: LDUH_R	lduh	[%r19 + %r0], %r26
	.word 0x8d942193  ! 562: WRPR_PSTATE_I	wrpr	%r16, 0x0193, %pstate
	.word 0xfa558000  ! 564: LDSH_R	ldsh	[%r22 + %r0], %r29
hwintr_2_30:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_30), 16, 16)) -> intp(2, 0, 30)
	.word 0xfa0ce007  ! 566: LDUB_I	ldub	[%r19 + 0x0007], %r29
	.word 0xf04d61e2  ! 568: LDSB_I	ldsb	[%r21 + 0x01e2], %r24
	.word 0xf605215b  ! 571: LDUW_I	lduw	[%r20 + 0x015b], %r27
	setx	0xccf969f600001c11, %g1, %r10
	.word 0x839a8000  ! 575: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf81d210c  ! 579: LDD_I	ldd	[%r20 + 0x010c], %r28
	.word 0x8595e0d0  ! 580: WRPR_TSTATE_I	wrpr	%r23, 0x00d0, %tstate
	setx	data_start_6, %g1, %r19
	setx	data_start_3, %g1, %r22
	.word 0xb3508000  ! 583: RDPR_TSTATE	<illegal instruction>
	.word 0xf04d4000  ! 586: LDSB_R	ldsb	[%r21 + %r0], %r24
	.word 0xbf50c000  ! 590: RDPR_TT	<illegal instruction>
	.word 0xfa14c000  ! 592: LDUH_R	lduh	[%r19 + %r0], %r29
	.word 0xbd51c000  ! 596: RDPR_TL	<illegal instruction>
	.word 0xbb520000  ! 598: RDPR_PIL	<illegal instruction>
	.word 0xbe254000  ! 606: SUB_R	sub 	%r21, %r0, %r31
	.word 0xf91d21ad  ! 607: LDDF_I	ldd	[%r20, 0x01ad], %f28
	.word 0xb350c000  ! 608: RDPR_TT	<illegal instruction>
hwintr_2_31:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_31), 16, 16)) -> intp(2, 0, 1d)
	.word 0xbac44000  ! 611: ADDCcc_R	addccc 	%r17, %r0, %r29
hwintr_2_32:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_32), 16, 16)) -> intp(2, 0, 37)
hwintr_2_33:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_33), 16, 16)) -> intp(2, 0, 8)
	.word 0xfa0d6190  ! 620: LDUB_I	ldub	[%r21 + 0x0190], %r29
hwintr_2_34:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_34), 16, 16)) -> intp(2, 0, 35)
	.word 0xb72d8000  ! 626: SLL_R	sll 	%r22, %r0, %r27
	.word 0xb6358000  ! 627: SUBC_R	orn 	%r22, %r0, %r27
	.word 0x8394e0ee  ! 629: WRPR_TNPC_I	wrpr	%r19, 0x00ee, %tnpc
	.word 0xf245c000  ! 631: LDSW_R	ldsw	[%r23 + %r0], %r25
	.word 0xb3500000  ! 633: RDPR_TPC	rdpr	%tpc, %r25
	.word 0xf4150000  ! 637: LDUH_R	lduh	[%r20 + %r0], %r26
	.word 0xfa45a00e  ! 638: LDSW_I	ldsw	[%r22 + 0x000e], %r29
	.word 0xb3480000  ! 639: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
hwintr_2_35:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_35), 16, 16)) -> intp(2, 0, 2a)
	.word 0xf11c6018  ! 647: LDDF_I	ldd	[%r17, 0x0018], %f24
	mov	0, %r12
	.word 0x8f930000  ! 648: WRPR_TL_R	wrpr	%r12, %r0, %tl
hwintr_2_36:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_36), 16, 16)) -> intp(2, 0, 27)
hwintr_2_37:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_37), 16, 16)) -> intp(2, 0, 11)
	setx	data_start_0, %g1, %r19
	.word 0x9195606e  ! 667: WRPR_PIL_I	wrpr	%r21, 0x006e, %pil
	.word 0xf11d8000  ! 668: LDDF_R	ldd	[%r22, %r0], %f24
	.word 0xfe0d4000  ! 671: LDUB_R	ldub	[%r21 + %r0], %r31
	.word 0xf454c000  ! 673: LDSH_R	ldsh	[%r19 + %r0], %r26
hwintr_2_38:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_38), 16, 16)) -> intp(2, 0, 1e)
	.word 0xbb7c2401  ! 675: MOVR_I	movre	%r16, 0x1, %r29
	.word 0xf31ca05b  ! 676: LDDF_I	ldd	[%r18, 0x005b], %f25
	.word 0xf81cc000  ! 678: LDD_R	ldd	[%r19 + %r0], %r28
	.word 0xbc14a14b  ! 679: OR_I	or 	%r18, 0x014b, %r30
hwintr_2_39:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_39), 16, 16)) -> intp(2, 0, 2b)
	.word 0xfb1dc000  ! 683: LDDF_R	ldd	[%r23, %r0], %f29
hwintr_2_40:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_40), 16, 16)) -> intp(2, 0, 17)
	.word 0xbe25a05f  ! 685: SUB_I	sub 	%r22, 0x005f, %r31
	.word 0xfe04e09e  ! 690: LDUW_I	lduw	[%r19 + 0x009e], %r31
	setx	0x78b5942a00001b80, %g1, %r10
	.word 0x819a8000  ! 692: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xfe4de106  ! 693: LDSB_I	ldsb	[%r23 + 0x0106], %r31
	.word 0x81952156  ! 696: WRPR_TPC_I	wrpr	%r20, 0x0156, %tpc
	.word 0xf2040000  ! 698: LDUW_R	lduw	[%r16 + %r0], %r25
	.word 0xf85d2139  ! 699: LDX_I	ldx	[%r20 + 0x0139], %r28
	setx	0x4710c29c00006949, %g1, %r10
	.word 0x839a8000  ! 706: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf71ca0a1  ! 707: LDDF_I	ldd	[%r18, 0x00a1], %f27
	.word 0xb03d8000  ! 710: XNOR_R	xnor 	%r22, %r0, %r24
	.word 0x9194e027  ! 711: WRPR_PIL_I	wrpr	%r19, 0x0027, %pil
	.word 0x8194619f  ! 719: WRPR_TPC_I	wrpr	%r17, 0x019f, %tpc
	.word 0xf445e136  ! 720: LDSW_I	ldsw	[%r23 + 0x0136], %r26
	.word 0xfa5dc000  ! 721: LDX_R	ldx	[%r23 + %r0], %r29
	.word 0xf24ca17a  ! 722: LDSB_I	ldsb	[%r18 + 0x017a], %r25
	.word 0x89952016  ! 730: WRPR_TICK_I	wrpr	%r20, 0x0016, %tick
hwintr_2_41:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_41), 16, 16)) -> intp(2, 0, 2)
	.word 0xb93c6001  ! 732: SRA_I	sra 	%r17, 0x0001, %r28
	.word 0xf25d4000  ! 734: LDX_R	ldx	[%r21 + %r0], %r25
	.word 0xfd1d8000  ! 736: LDDF_R	ldd	[%r22, %r0], %f30
	.word 0xfe5460a4  ! 737: LDSH_I	ldsh	[%r17 + 0x00a4], %r31
	.word 0xf01c6126  ! 739: LDD_I	ldd	[%r17 + 0x0126], %r24
	.word 0xf245e135  ! 740: LDSW_I	ldsw	[%r23 + 0x0135], %r25
hwintr_2_42:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_42), 16, 16)) -> intp(2, 0, f)
	.word 0xfe1de04e  ! 742: LDD_I	ldd	[%r23 + 0x004e], %r31
	.word 0xf20ce196  ! 744: LDUB_I	ldub	[%r19 + 0x0196], %r25
	.word 0xf64ca0a7  ! 745: LDSB_I	ldsb	[%r18 + 0x00a7], %r27
	.word 0xb5510000  ! 748: RDPR_TICK	<illegal instruction>
hwintr_2_43:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_43), 16, 16)) -> intp(2, 0, c)
	.word 0xf84d8000  ! 756: LDSB_R	ldsb	[%r22 + %r0], %r28
	.word 0xf41de1c4  ! 757: LDD_I	ldd	[%r23 + 0x01c4], %r26
	.word 0x919460b7  ! 760: WRPR_PIL_I	wrpr	%r17, 0x00b7, %pil
	.word 0xf31d8000  ! 762: LDDF_R	ldd	[%r22, %r0], %f25
	.word 0xf11c6173  ! 763: LDDF_I	ldd	[%r17, 0x0173], %f24
	.word 0x8194207b  ! 767: WRPR_TPC_I	wrpr	%r16, 0x007b, %tpc
	setx	0xaeb61d4900009993, %g1, %r10
	.word 0x819a8000  ! 768: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb7520000  ! 770: RDPR_PIL	<illegal instruction>
	.word 0xf04c61db  ! 772: LDSB_I	ldsb	[%r17 + 0x01db], %r24
	.word 0xfa4c219a  ! 773: LDSB_I	ldsb	[%r16 + 0x019a], %r29
	.word 0x9195208f  ! 774: WRPR_PIL_I	wrpr	%r20, 0x008f, %pil
hwintr_2_44:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_44), 16, 16)) -> intp(2, 0, 3)
	.word 0xb135d000  ! 776: SRLX_R	srlx	%r23, %r0, %r24
	.word 0xfc55606b  ! 777: LDSH_I	ldsh	[%r21 + 0x006b], %r30
	.word 0x8594a130  ! 779: WRPR_TSTATE_I	wrpr	%r18, 0x0130, %tstate
	.word 0x899560eb  ! 780: WRPR_TICK_I	wrpr	%r21, 0x00eb, %tick
	.word 0x8d94213c  ! 781: WRPR_PSTATE_I	wrpr	%r16, 0x013c, %pstate
	.word 0xf60521c9  ! 786: LDUW_I	lduw	[%r20 + 0x01c9], %r27
	mov	0, %r12
	.word 0x8f930000  ! 789: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x89956171  ! 793: WRPR_TICK_I	wrpr	%r21, 0x0171, %tick
	.word 0xfc0c2081  ! 794: LDUB_I	ldub	[%r16 + 0x0081], %r30
	.word 0xf20c6110  ! 796: LDUB_I	ldub	[%r17 + 0x0110], %r25
	.word 0x8d946171  ! 797: WRPR_PSTATE_I	wrpr	%r17, 0x0171, %pstate
hwintr_2_45:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_45), 16, 16)) -> intp(2, 0, 9)
hwintr_2_46:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_46), 16, 16)) -> intp(2, 0, 8)
	.word 0xfe1d4000  ! 803: LDD_R	ldd	[%r21 + %r0], %r31
	.word 0xfc040000  ! 807: LDUW_R	lduw	[%r16 + %r0], %r30
	.word 0xf41561dd  ! 810: LDUH_I	lduh	[%r21 + 0x01dd], %r26
	.word 0xf815a1cf  ! 811: LDUH_I	lduh	[%r22 + 0x01cf], %r28
hwintr_2_47:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_47), 16, 16)) -> intp(2, 0, 13)
	.word 0xf8444000  ! 816: LDSW_R	ldsw	[%r17 + %r0], %r28
	.word 0xf6048000  ! 817: LDUW_R	lduw	[%r18 + %r0], %r27
	.word 0xfa05612e  ! 818: LDUW_I	lduw	[%r21 + 0x012e], %r29
	.word 0xbf510000  ! 826: RDPR_TICK	<illegal instruction>
	.word 0x8594e039  ! 827: WRPR_TSTATE_I	wrpr	%r19, 0x0039, %tstate
	.word 0x8394e17b  ! 828: WRPR_TNPC_I	wrpr	%r19, 0x017b, %tnpc
	.word 0x8d9560de  ! 830: WRPR_PSTATE_I	wrpr	%r21, 0x00de, %pstate
	.word 0xfc5cc000  ! 834: LDX_R	ldx	[%r19 + %r0], %r30
	.word 0xf60d21ed  ! 835: LDUB_I	ldub	[%r20 + 0x01ed], %r27
	.word 0xf00de1aa  ! 836: LDUB_I	ldub	[%r23 + 0x01aa], %r24
	.word 0x839421a7  ! 839: WRPR_TNPC_I	wrpr	%r16, 0x01a7, %tnpc
	.word 0xfe1420ca  ! 840: LDUH_I	lduh	[%r16 + 0x00ca], %r31
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
hwintr_2_48:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_48), 16, 16)) -> intp(2, 0, 17)
	.word 0x87956058  ! 848: WRPR_TT_I	wrpr	%r21, 0x0058, %tt
	.word 0xfc040000  ! 851: LDUW_R	lduw	[%r16 + %r0], %r30
	.word 0xb6adc000  ! 854: ANDNcc_R	andncc 	%r23, %r0, %r27
	.word 0x8194e049  ! 857: WRPR_TPC_I	wrpr	%r19, 0x0049, %tpc
	.word 0xbcb4208b  ! 867: SUBCcc_I	orncc 	%r16, 0x008b, %r30
	.word 0xb3480000  ! 869: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xfe4ca041  ! 870: LDSB_I	ldsb	[%r18 + 0x0041], %r31
	.word 0xfa0cc000  ! 871: LDUB_R	ldub	[%r19 + %r0], %r29
	.word 0xba1dc000  ! 876: XOR_R	xor 	%r23, %r0, %r29
	.word 0xfc0d21cb  ! 880: LDUB_I	ldub	[%r20 + 0x01cb], %r30
	.word 0xf8550000  ! 881: LDSH_R	ldsh	[%r20 + %r0], %r28
	.word 0xb4158000  ! 883: OR_R	or 	%r22, %r0, %r26
	.word 0xb4940000  ! 886: ORcc_R	orcc 	%r16, %r0, %r26
	.word 0xfa0ca1fa  ! 889: LDUB_I	ldub	[%r18 + 0x01fa], %r29
	.word 0xfe1c4000  ! 890: LDD_R	ldd	[%r17 + %r0], %r31
	.word 0xfc1c0000  ! 891: LDD_R	ldd	[%r16 + %r0], %r30
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb951c000  ! 894: RDPR_TL	<illegal instruction>
	.word 0xfa148000  ! 895: LDUH_R	lduh	[%r18 + %r0], %r29
	.word 0xbf500000  ! 897: RDPR_TPC	<illegal instruction>
hwintr_2_49:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_49), 16, 16)) -> intp(2, 0, 39)
	mov	2, %r12
	.word 0x8f930000  ! 903: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf055c000  ! 909: LDSH_R	ldsh	[%r23 + %r0], %r24
	.word 0x879561a7  ! 912: WRPR_TT_I	wrpr	%r21, 0x01a7, %tt
	.word 0xfe554000  ! 919: LDSH_R	ldsh	[%r21 + %r0], %r31
	.word 0xf8148000  ! 921: LDUH_R	lduh	[%r18 + %r0], %r28
	.word 0xf81c20f5  ! 922: LDD_I	ldd	[%r16 + 0x00f5], %r28
	.word 0xfe058000  ! 926: LDUW_R	lduw	[%r22 + %r0], %r31
	.word 0xf91d8000  ! 927: LDDF_R	ldd	[%r22, %r0], %f28
hwintr_2_50:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_50), 16, 16)) -> intp(2, 0, f)
	.word 0xb1480000  ! 930: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xfa044000  ! 937: LDUW_R	lduw	[%r17 + %r0], %r29
	.word 0xf61d2193  ! 938: LDD_I	ldd	[%r20 + 0x0193], %r27
	.word 0x8194a19c  ! 939: WRPR_TPC_I	wrpr	%r18, 0x019c, %tpc
	.word 0x8195a03e  ! 940: WRPR_TPC_I	wrpr	%r22, 0x003e, %tpc
	.word 0xb1540000  ! 941: RDPR_GL	<illegal instruction>
	.word 0xf045e1a5  ! 943: LDSW_I	ldsw	[%r23 + 0x01a5], %r24
	.word 0xf8054000  ! 949: LDUW_R	lduw	[%r21 + %r0], %r28
	.word 0xf45c0000  ! 952: LDX_R	ldx	[%r16 + %r0], %r26
	.word 0xf11d4000  ! 953: LDDF_R	ldd	[%r21, %r0], %f24
	.word 0xfc5420a9  ! 957: LDSH_I	ldsh	[%r16 + 0x00a9], %r30
	.word 0xf65da0c5  ! 962: LDX_I	ldx	[%r22 + 0x00c5], %r27
	.word 0xf655e17d  ! 966: LDSH_I	ldsh	[%r23 + 0x017d], %r27
	.word 0x8d942017  ! 967: WRPR_PSTATE_I	wrpr	%r16, 0x0017, %pstate
	.word 0xfe544000  ! 969: LDSH_R	ldsh	[%r17 + %r0], %r31
	.word 0xb0a4c000  ! 973: SUBcc_R	subcc 	%r19, %r0, %r24
	.word 0xfc44e0d5  ! 978: LDSW_I	ldsw	[%r19 + 0x00d5], %r30
	.word 0xf00c8000  ! 979: LDUB_R	ldub	[%r18 + %r0], %r24
	.word 0xb3520000  ! 980: RDPR_PIL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfa5d6115  ! 986: LDX_I	ldx	[%r21 + 0x0115], %r29
	.word 0xb5518000  ! 989: RDPR_PSTATE	<illegal instruction>
	.word 0x8395e0f4  ! 990: WRPR_TNPC_I	wrpr	%r23, 0x00f4, %tnpc
	.word 0xfa1cc000  ! 992: LDD_R	ldd	[%r19 + %r0], %r29
	.word 0xb3540000  ! 994: RDPR_GL	<illegal instruction>
	.word 0xf45d61b4  ! 995: LDX_I	ldx	[%r21 + 0x01b4], %r26
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	.word 0xb9a489e0  ! 1: FDIVq	dis not found

	.word 0x839420c7  ! 4: WRPR_TNPC_I	wrpr	%r16, 0x00c7, %tnpc
	.word 0xb7a80420  ! 14: FMOVRZ	dis not found

	.word 0xb1a00520  ! 17: FSQRTs	fsqrt	
	.word 0xb7a88820  ! 18: FMOVLE	fmovs	%fcc1, %f0, %f27
hwintr_1_0:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_0), 16, 16)) -> intp(1, 0, 16)
hwintr_1_1:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_1), 16, 16)) -> intp(1, 0, 2c)
	.word 0xb8154000  ! 26: OR_R	or 	%r21, %r0, %r28
	.word 0xb48da191  ! 27: ANDcc_I	andcc 	%r22, 0x0191, %r26
hwintr_1_2:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_2), 16, 16)) -> intp(1, 0, 14)
hwintr_1_3:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_3), 16, 16)) -> intp(1, 0, 3e)
	.word 0x819521a1  ! 32: WRPR_TPC_I	wrpr	%r20, 0x01a1, %tpc
	.word 0xb9a00560  ! 36: FSQRTq	fsqrt	
	.word 0xbfa00040  ! 40: FMOVd	fmovd	%f0, %f62
	.word 0xb9a8c820  ! 42: FMOVL	fmovs	%fcc1, %f0, %f28
	.word 0xbfa00020  ! 43: FMOVs	fmovs	%f0, %f31
	.word 0xb3a488e0  ! 45: FSUBq	dis not found

	.word 0xb1a54840  ! 47: FADDd	faddd	%f52, %f0, %f24
	.word 0xb5a98820  ! 51: FMOVNEG	fmovs	%fcc1, %f0, %f26
	.word 0xb5a84820  ! 52: FMOVE	fmovs	%fcc1, %f0, %f26
	.word 0xbda488c0  ! 54: FSUBd	fsubd	%f18, %f0, %f30
	.word 0xb1a80420  ! 56: FMOVRZ	dis not found

	setx	0x47739eb70000ee5d, %g1, %r10
	.word 0x819a8000  ! 57: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbc1c4000  ! 58: XOR_R	xor 	%r17, %r0, %r30
	.word 0xb7a549c0  ! 59: FDIVd	fdivd	%f52, %f0, %f58
	.word 0xbd34c000  ! 63: SRL_R	srl 	%r19, %r0, %r30
	.word 0x8595e056  ! 65: WRPR_TSTATE_I	wrpr	%r23, 0x0056, %tstate
	.word 0xb5a00540  ! 66: FSQRTd	fsqrt	
	.word 0xb5aa8820  ! 68: FMOVG	fmovs	%fcc1, %f0, %f26
	.word 0xb094e029  ! 69: ORcc_I	orcc 	%r19, 0x0029, %r24
hwintr_1_4:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_4), 16, 16)) -> intp(1, 0, 2d)
	.word 0xb3ab4820  ! 72: FMOVCC	fmovs	%fcc1, %f0, %f25
	.word 0x899420d1  ! 75: WRPR_TICK_I	wrpr	%r16, 0x00d1, %tick
hwintr_1_5:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_5), 16, 16)) -> intp(1, 0, 14)
	setx	0xd01cf4280000ab07, %g1, %r10
	.word 0x819a8000  ! 83: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb3a98820  ! 84: FMOVNEG	fmovs	%fcc1, %f0, %f25
	.word 0xb5a00520  ! 87: FSQRTs	fsqrt	
hwintr_1_6:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_6), 16, 16)) -> intp(1, 0, 23)
	.word 0xb1ab8820  ! 91: FMOVPOS	fmovs	%fcc1, %f0, %f24
	setx	0xe620afdd00008ade, %g1, %r10
	.word 0x839a8000  ! 95: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb1a00520  ! 96: FSQRTs	fsqrt	
	.word 0xbc3c0000  ! 97: XNOR_R	xnor 	%r16, %r0, %r30
	.word 0xb9540000  ! 101: RDPR_GL	<illegal instruction>
	.word 0x8994606b  ! 103: WRPR_TICK_I	wrpr	%r17, 0x006b, %tick
hwintr_1_7:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_7), 16, 16)) -> intp(1, 0, 3f)
	.word 0xbabca058  ! 108: XNORcc_I	xnorcc 	%r18, 0x0058, %r29
	.word 0xbfa4c840  ! 109: FADDd	faddd	%f50, %f0, %f62
	.word 0x8394e03c  ! 112: WRPR_TNPC_I	wrpr	%r19, 0x003c, %tnpc
	.word 0xb3a00020  ! 113: FMOVs	fmovs	%f0, %f25
	mov	0, %r12
	.word 0x8f930000  ! 114: WRPR_TL_R	wrpr	%r12, %r0, %tl
	mov	1, %r12
	.word 0x8f930000  ! 119: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb89ca061  ! 120: XORcc_I	xorcc 	%r18, 0x0061, %r28
	mov	0, %r12
	.word 0xa1930000  ! 121: WRPR_GL_R	wrpr	%r12, %r0, %-
hwintr_1_8:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_8), 16, 16)) -> intp(1, 0, 1d)
	setx	0x4dd2ec000005a81, %g1, %r10
	.word 0x819a8000  ! 128: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb9ab4820  ! 133: FMOVCC	fmovs	%fcc1, %f0, %f28
	.word 0xb1a58920  ! 138: FMULs	fmuls	%f22, %f0, %f24
	.word 0xb3a81820  ! 139: FMOVRGZ	fmovs	%fcc3, %f0, %f25
	.word 0xbfa44840  ! 142: FADDd	faddd	%f48, %f0, %f62
	setx	0x46dddc8100002c9f, %g1, %r10
	.word 0x819a8000  ! 145: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
hwintr_1_9:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_9), 16, 16)) -> intp(1, 0, 1d)
	.word 0xbfa90820  ! 151: FMOVLEU	fmovs	%fcc1, %f0, %f31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb1a40820  ! 155: FADDs	fadds	%f16, %f0, %f24
	.word 0xbfa44860  ! 159: FADDq	dis not found

	.word 0x91946114  ! 168: WRPR_PIL_I	wrpr	%r17, 0x0114, %pil
	.word 0xbfa98820  ! 170: FMOVNEG	fmovs	%fcc1, %f0, %f31
hwintr_1_10:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_10), 16, 16)) -> intp(1, 0, 15)
	.word 0xbdabc820  ! 175: FMOVVC	fmovs	%fcc1, %f0, %f30
	.word 0x8594216e  ! 177: WRPR_TSTATE_I	wrpr	%r16, 0x016e, %tstate
	.word 0xbda549e0  ! 178: FDIVq	dis not found

	.word 0x8394e0d7  ! 181: WRPR_TNPC_I	wrpr	%r19, 0x00d7, %tnpc
	.word 0xbba80420  ! 183: FMOVRZ	dis not found

	.word 0xb9a94820  ! 185: FMOVCS	fmovs	%fcc1, %f0, %f28
	.word 0xbfa4c860  ! 191: FADDq	dis not found

	.word 0xba34e0dc  ! 192: ORN_I	orn 	%r19, 0x00dc, %r29
	.word 0x8d95a0a5  ! 193: WRPR_PSTATE_I	wrpr	%r22, 0x00a5, %pstate
hwintr_1_11:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_11), 16, 16)) -> intp(1, 0, 3d)
	mov	2, %r12
	.word 0x8f930000  ! 203: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x819420fa  ! 205: WRPR_TPC_I	wrpr	%r16, 0x00fa, %tpc
	.word 0xb6a54000  ! 206: SUBcc_R	subcc 	%r21, %r0, %r27
	.word 0xb9a00040  ! 210: FMOVd	fmovd	%f0, %f28
	.word 0xb6b5e1b8  ! 214: SUBCcc_I	orncc 	%r23, 0x01b8, %r27
	.word 0xb57c2401  ! 217: MOVR_I	movre	%r16, 0x1, %r26
	.word 0xbd3da001  ! 218: SRA_I	sra 	%r22, 0x0001, %r30
	.word 0xbb480000  ! 219: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xbba549c0  ! 221: FDIVd	fdivd	%f52, %f0, %f60
	setx	data_start_4, %g1, %r20
hwintr_1_12:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_12), 16, 16)) -> intp(1, 0, 2f)
hwintr_1_13:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_13), 16, 16)) -> intp(1, 0, 11)
	.word 0xb7a81820  ! 232: FMOVRGZ	fmovs	%fcc3, %f0, %f27
	.word 0xbfa94820  ! 233: FMOVCS	fmovs	%fcc1, %f0, %f31
	.word 0xbda549e0  ! 236: FDIVq	dis not found

	.word 0xbda80c20  ! 239: FMOVRLZ	dis not found

	.word 0xb4c4c000  ! 243: ADDCcc_R	addccc 	%r19, %r0, %r26
hwintr_1_14:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_14), 16, 16)) -> intp(1, 0, 33)
hwintr_1_15:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_15), 16, 16)) -> intp(1, 0, b)
	.word 0xb3a44940  ! 247: FMULd	fmuld	%f48, %f0, %f56
	.word 0xba956139  ! 248: ORcc_I	orcc 	%r21, 0x0139, %r29
	.word 0xb5a84820  ! 249: FMOVE	fmovs	%fcc1, %f0, %f26
hwintr_1_16:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_16), 16, 16)) -> intp(1, 0, 5)
	.word 0xb9a00020  ! 254: FMOVs	fmovs	%f0, %f28
	.word 0xb7a9c820  ! 255: FMOVVS	fmovs	%fcc1, %f0, %f27
	.word 0x8195e0a0  ! 256: WRPR_TPC_I	wrpr	%r23, 0x00a0, %tpc
	.word 0xb1a488c0  ! 258: FSUBd	fsubd	%f18, %f0, %f24
	.word 0x8d94a074  ! 259: WRPR_PSTATE_I	wrpr	%r18, 0x0074, %pstate
	.word 0xbb504000  ! 260: RDPR_TNPC	<illegal instruction>
	.word 0xb1a00560  ! 261: FSQRTq	fsqrt	
	.word 0xb7500000  ! 266: RDPR_TPC	<illegal instruction>
	.word 0xb1a88820  ! 270: FMOVLE	fmovs	%fcc1, %f0, %f24
	.word 0xbb540000  ! 273: RDPR_GL	<illegal instruction>
	.word 0xb9aa0820  ! 275: FMOVA	fmovs	%fcc1, %f0, %f28
	.word 0xb3a9c820  ! 284: FMOVVS	fmovs	%fcc1, %f0, %f25
	.word 0xb1a98820  ! 287: FMOVNEG	fmovs	%fcc1, %f0, %f24
	.word 0xbfa9c820  ! 289: FMOVVS	fmovs	%fcc1, %f0, %f31
	.word 0x819421f9  ! 290: WRPR_TPC_I	wrpr	%r16, 0x01f9, %tpc
hwintr_1_17:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_17), 16, 16)) -> intp(1, 0, 37)
	.word 0xb2a4214a  ! 292: SUBcc_I	subcc 	%r16, 0x014a, %r25
	.word 0xb3510000  ! 296: RDPR_TICK	<illegal instruction>
	.word 0xb5aa0820  ! 298: FMOVA	fmovs	%fcc1, %f0, %f26
	.word 0xbd51c000  ! 299: RDPR_TL	<illegal instruction>
	.word 0xbfaa8820  ! 300: FMOVG	fmovs	%fcc1, %f0, %f31
	.word 0x859560e5  ! 301: WRPR_TSTATE_I	wrpr	%r21, 0x00e5, %tstate
	.word 0x85952012  ! 308: WRPR_TSTATE_I	wrpr	%r20, 0x0012, %tstate
	setx	0x8ed927de0000bd82, %g1, %r10
	.word 0x839a8000  ! 310: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb5a40920  ! 311: FMULs	fmuls	%f16, %f0, %f26
	.word 0xb7a4c920  ! 315: FMULs	fmuls	%f19, %f0, %f27
	.word 0xb1a5c920  ! 328: FMULs	fmuls	%f23, %f0, %f24
	.word 0x819460d2  ! 333: WRPR_TPC_I	wrpr	%r17, 0x00d2, %tpc
	.word 0x859520a8  ! 335: WRPR_TSTATE_I	wrpr	%r20, 0x00a8, %tstate
	.word 0xb3abc820  ! 336: FMOVVC	fmovs	%fcc1, %f0, %f25
	.word 0xb5abc820  ! 337: FMOVVC	fmovs	%fcc1, %f0, %f26
	.word 0xbb504000  ! 338: RDPR_TNPC	<illegal instruction>
	.word 0xb350c000  ! 339: RDPR_TT	<illegal instruction>
	.word 0xb951c000  ! 341: RDPR_TL	<illegal instruction>
hwintr_1_18:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_18), 16, 16)) -> intp(1, 0, 11)
	setx	0xd5f1016c0000b896, %g1, %r10
	.word 0x839a8000  ! 345: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb5a488a0  ! 348: FSUBs	fsubs	%f18, %f0, %f26
	.word 0xb1480000  ! 349: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xb5a509c0  ! 355: FDIVd	fdivd	%f20, %f0, %f26
hwintr_1_19:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_19), 16, 16)) -> intp(1, 0, 10)
hwintr_1_20:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_20), 16, 16)) -> intp(1, 0, 14)
	.word 0x83952095  ! 365: WRPR_TNPC_I	wrpr	%r20, 0x0095, %tnpc
	.word 0xb9a548a0  ! 371: FSUBs	fsubs	%f21, %f0, %f28
	.word 0xbe8cc000  ! 372: ANDcc_R	andcc 	%r19, %r0, %r31
	.word 0xbda00520  ! 375: FSQRTs	fsqrt	
	.word 0xb7a94820  ! 378: FMOVCS	fmovs	%fcc1, %f0, %f27
	mov	2, %r12
	.word 0xa1930000  ! 380: WRPR_GL_R	wrpr	%r12, %r0, %-
hwintr_1_21:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_21), 16, 16)) -> intp(1, 0, 12)
	.word 0xbfaac820  ! 385: FMOVGE	fmovs	%fcc1, %f0, %f31
	.word 0x8d95a122  ! 389: WRPR_PSTATE_I	wrpr	%r22, 0x0122, %pstate
	.word 0xb3a00540  ! 390: FSQRTd	fsqrt	
	.word 0xb3a81c20  ! 391: FMOVRGEZ	dis not found

	.word 0xb7540000  ! 392: RDPR_GL	<illegal instruction>
	.word 0xb2c5e0df  ! 394: ADDCcc_I	addccc 	%r23, 0x00df, %r25
	.word 0xb1a00520  ! 401: FSQRTs	fsqrt	
	.word 0x8195a090  ! 402: WRPR_TPC_I	wrpr	%r22, 0x0090, %tpc
	.word 0xbda00040  ! 404: FMOVd	fmovd	%f0, %f30
	.word 0xb7518000  ! 407: RDPR_PSTATE	<illegal instruction>
	.word 0xb3a98820  ! 410: FMOVNEG	fmovs	%fcc1, %f0, %f25
	.word 0xb3a4c940  ! 413: FMULd	fmuld	%f50, %f0, %f56
	setx	data_start_2, %g1, %r18
	.word 0xb3ab0820  ! 415: FMOVGU	fmovs	%fcc1, %f0, %f25
	.word 0xbfa00560  ! 416: FSQRTq	fsqrt	
	.word 0xbf349000  ! 419: SRLX_R	srlx	%r18, %r0, %r31
	.word 0xb7a00520  ! 420: FSQRTs	fsqrt	
	.word 0xb7a408a0  ! 421: FSUBs	fsubs	%f16, %f0, %f27
	.word 0x8595e1c8  ! 423: WRPR_TSTATE_I	wrpr	%r23, 0x01c8, %tstate
	.word 0xb9518000  ! 425: RDPR_PSTATE	<illegal instruction>
	.word 0xbfa81820  ! 427: FMOVRGZ	fmovs	%fcc3, %f0, %f31
	.word 0xb1a50940  ! 428: FMULd	fmuld	%f20, %f0, %f24
	.word 0xb9a489a0  ! 430: FDIVs	fdivs	%f18, %f0, %f28
	.word 0xb1a54940  ! 435: FMULd	fmuld	%f52, %f0, %f24
	.word 0xb751c000  ! 436: RDPR_TL	<illegal instruction>
	.word 0xbf358000  ! 439: SRL_R	srl 	%r22, %r0, %r31
	.word 0xb7a80820  ! 440: FMOVN	fmovs	%fcc1, %f0, %f27
	.word 0xb5a488e0  ! 441: FSUBq	dis not found

	.word 0xb9a58840  ! 442: FADDd	faddd	%f22, %f0, %f28
	.word 0xbcb5c000  ! 443: ORNcc_R	orncc 	%r23, %r0, %r30
	.word 0xb1a4c8a0  ! 444: FSUBs	fsubs	%f19, %f0, %f24
	.word 0xbba00560  ! 445: FSQRTq	fsqrt	
	.word 0xb5643801  ! 448: MOVcc_I	<illegal instruction>
	.word 0xb5518000  ! 452: RDPR_PSTATE	<illegal instruction>
	.word 0xbe958000  ! 453: ORcc_R	orcc 	%r22, %r0, %r31
	.word 0xb5a50860  ! 457: FADDq	dis not found

	.word 0xb3a548a0  ! 461: FSUBs	fsubs	%f21, %f0, %f25
	.word 0xbda5c9c0  ! 463: FDIVd	fdivd	%f54, %f0, %f30
	.word 0xb7508000  ! 464: RDPR_TSTATE	<illegal instruction>
	.word 0xbc0d4000  ! 465: AND_R	and 	%r21, %r0, %r30
	.word 0x8795603e  ! 467: WRPR_TT_I	wrpr	%r21, 0x003e, %tt
hwintr_1_22:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_22), 16, 16)) -> intp(1, 0, 25)
	.word 0xb9a5c860  ! 471: FADDq	dis not found

	.word 0xb8b5c000  ! 472: ORNcc_R	orncc 	%r23, %r0, %r28
	.word 0xb5480000  ! 480: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xb5a00560  ! 483: FSQRTq	fsqrt	
	.word 0x8d95e04b  ! 485: WRPR_PSTATE_I	wrpr	%r23, 0x004b, %pstate
hwintr_1_23:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_23), 16, 16)) -> intp(1, 0, 2b)
hwintr_1_24:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_24), 16, 16)) -> intp(1, 0, f)
	.word 0xb5a8c820  ! 494: FMOVL	fmovs	%fcc1, %f0, %f26
hwintr_1_25:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_25), 16, 16)) -> intp(1, 0, 0)
	.word 0x89946048  ! 496: WRPR_TICK_I	wrpr	%r17, 0x0048, %tick
	.word 0xbba409a0  ! 500: FDIVs	fdivs	%f16, %f0, %f29
hwintr_1_26:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_26), 16, 16)) -> intp(1, 0, 3)
	.word 0xb7ab4820  ! 502: FMOVCC	fmovs	%fcc1, %f0, %f27
	mov	2, %r12
	.word 0x8f930000  ! 505: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbda88820  ! 506: FMOVLE	fmovs	%fcc1, %f0, %f30
	.word 0xbda48920  ! 508: FMULs	fmuls	%f18, %f0, %f30
	.word 0xbda489e0  ! 512: FDIVq	dis not found

	mov	2, %r12
	.word 0xa1930000  ! 513: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb9a50820  ! 514: FADDs	fadds	%f20, %f0, %f28
hwintr_1_27:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_27), 16, 16)) -> intp(1, 0, 31)
	.word 0xb12d1000  ! 520: SLLX_R	sllx	%r20, %r0, %r24
	.word 0xb5a40960  ! 521: FMULq	dis not found

	.word 0x83942046  ! 529: WRPR_TNPC_I	wrpr	%r16, 0x0046, %tnpc
	.word 0xb5a50860  ! 531: FADDq	dis not found

	.word 0xb7a94820  ! 532: FMOVCS	fmovs	%fcc1, %f0, %f27
	.word 0x879460d0  ! 533: WRPR_TT_I	wrpr	%r17, 0x00d0, %tt
	.word 0xb5a00020  ! 538: FMOVs	fmovs	%f0, %f26
	.word 0xb3a00040  ! 542: FMOVd	fmovd	%f0, %f56
	.word 0xbc25e16f  ! 545: SUB_I	sub 	%r23, 0x016f, %r30
	.word 0x8994205f  ! 549: WRPR_TICK_I	wrpr	%r16, 0x005f, %tick
	mov	0, %r12
	.word 0xa1930000  ! 550: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb9ab8820  ! 551: FMOVPOS	fmovs	%fcc1, %f0, %f28
	.word 0xba2561e6  ! 552: SUB_I	sub 	%r21, 0x01e6, %r29
hwintr_1_28:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_28), 16, 16)) -> intp(1, 0, 28)
hwintr_1_29:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_29), 16, 16)) -> intp(1, 0, 2b)
	.word 0xb5a80c20  ! 557: FMOVRLZ	dis not found

	.word 0xbda00020  ! 559: FMOVs	fmovs	%f0, %f30
	.word 0xb7641800  ! 560: MOVcc_R	<illegal instruction>
	.word 0x8d9421c0  ! 562: WRPR_PSTATE_I	wrpr	%r16, 0x01c0, %pstate
hwintr_1_30:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_30), 16, 16)) -> intp(1, 0, 8)
	.word 0xb1a40920  ! 569: FMULs	fmuls	%f16, %f0, %f24
	setx	0x2e4b37e600002b88, %g1, %r10
	.word 0x839a8000  ! 575: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbfa50920  ! 576: FMULs	fmuls	%f20, %f0, %f31
	.word 0x859521e5  ! 580: WRPR_TSTATE_I	wrpr	%r20, 0x01e5, %tstate
	setx	data_start_2, %g1, %r17
	setx	data_start_2, %g1, %r20
	.word 0xb3508000  ! 583: RDPR_TSTATE	<illegal instruction>
	.word 0xb5abc820  ! 584: FMOVVC	fmovs	%fcc1, %f0, %f26
	.word 0xb350c000  ! 590: RDPR_TT	<illegal instruction>
	.word 0xb3ab0820  ! 591: FMOVGU	fmovs	%fcc1, %f0, %f25
	.word 0xb5a8c820  ! 595: FMOVL	fmovs	%fcc1, %f0, %f26
	.word 0xbd51c000  ! 596: RDPR_TL	<illegal instruction>
	.word 0xbba48820  ! 597: FADDs	fadds	%f18, %f0, %f29
	.word 0xb3520000  ! 598: RDPR_PIL	<illegal instruction>
	.word 0xbba40820  ! 600: FADDs	fadds	%f16, %f0, %f29
	.word 0xbba00040  ! 602: FMOVd	fmovd	%f0, %f60
	.word 0xba240000  ! 606: SUB_R	sub 	%r16, %r0, %r29
	.word 0xb550c000  ! 608: RDPR_TT	<illegal instruction>
hwintr_1_31:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_31), 16, 16)) -> intp(1, 0, 7)
	.word 0xbcc50000  ! 611: ADDCcc_R	addccc 	%r20, %r0, %r30
hwintr_1_32:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_32), 16, 16)) -> intp(1, 0, 29)
hwintr_1_33:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_33), 16, 16)) -> intp(1, 0, 34)
	.word 0xb3aa8820  ! 622: FMOVG	fmovs	%fcc1, %f0, %f25
hwintr_1_34:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_34), 16, 16)) -> intp(1, 0, 24)
	.word 0xb32d0000  ! 626: SLL_R	sll 	%r20, %r0, %r25
	.word 0xb0354000  ! 627: SUBC_R	orn 	%r21, %r0, %r24
	.word 0x8394e062  ! 629: WRPR_TNPC_I	wrpr	%r19, 0x0062, %tnpc
	.word 0xbfa589c0  ! 630: FDIVd	fdivd	%f22, %f0, %f62
	.word 0xb7a488a0  ! 632: FSUBs	fsubs	%f18, %f0, %f27
	.word 0xb9500000  ! 633: RDPR_TPC	<illegal instruction>
	.word 0xb7a48860  ! 634: FADDq	dis not found

	.word 0xbb480000  ! 639: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
hwintr_1_35:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_35), 16, 16)) -> intp(1, 0, 33)
	.word 0xbda54940  ! 645: FMULd	fmuld	%f52, %f0, %f30
	.word 0xb1a00520  ! 646: FSQRTs	fsqrt	
	mov	0, %r12
	.word 0x8f930000  ! 648: WRPR_TL_R	wrpr	%r12, %r0, %tl
hwintr_1_36:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_36), 16, 16)) -> intp(1, 0, 35)
	.word 0xbba94820  ! 650: FMOVCS	fmovs	%fcc1, %f0, %f29
hwintr_1_37:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_37), 16, 16)) -> intp(1, 0, e)
	.word 0xb1abc820  ! 660: FMOVVC	fmovs	%fcc1, %f0, %f24
	setx	data_start_5, %g1, %r17
	.word 0xb3a488e0  ! 664: FSUBq	dis not found

	.word 0x9195a137  ! 667: WRPR_PIL_I	wrpr	%r22, 0x0137, %pil
	.word 0xb9a5c860  ! 669: FADDq	dis not found

hwintr_1_38:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_38), 16, 16)) -> intp(1, 0, 18)
	.word 0xb77c2401  ! 675: MOVR_I	movre	%r16, 0x1, %r27
	.word 0xb61460c1  ! 679: OR_I	or 	%r17, 0x00c1, %r27
hwintr_1_39:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_39), 16, 16)) -> intp(1, 0, 3)
	.word 0xb1ab4820  ! 682: FMOVCC	fmovs	%fcc1, %f0, %f24
hwintr_1_40:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_40), 16, 16)) -> intp(1, 0, 21)
	.word 0xba24206a  ! 685: SUB_I	sub 	%r16, 0x006a, %r29
	.word 0xbdab0820  ! 688: FMOVGU	fmovs	%fcc1, %f0, %f30
	setx	0xc7855e670000785d, %g1, %r10
	.word 0x819a8000  ! 692: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbfa81c20  ! 694: FMOVRGEZ	dis not found

	.word 0x8194a0c7  ! 696: WRPR_TPC_I	wrpr	%r18, 0x00c7, %tpc
	setx	0xb040a2ec00000bd1, %g1, %r10
	.word 0x839a8000  ! 706: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb23c8000  ! 710: XNOR_R	xnor 	%r18, %r0, %r25
	.word 0x91946128  ! 711: WRPR_PIL_I	wrpr	%r17, 0x0128, %pil
	.word 0xb1a81820  ! 718: FMOVRGZ	fmovs	%fcc3, %f0, %f24
	.word 0x8194606a  ! 719: WRPR_TPC_I	wrpr	%r17, 0x006a, %tpc
	.word 0xb7a588a0  ! 723: FSUBs	fsubs	%f22, %f0, %f27
	.word 0xbda94820  ! 725: FMOVCS	fmovs	%fcc1, %f0, %f30
	.word 0x899421c3  ! 730: WRPR_TICK_I	wrpr	%r16, 0x01c3, %tick
hwintr_1_41:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_41), 16, 16)) -> intp(1, 0, 20)
	.word 0xb33d2001  ! 732: SRA_I	sra 	%r20, 0x0001, %r25
	.word 0xbbaa4820  ! 735: FMOVNE	fmovs	%fcc1, %f0, %f29
hwintr_1_42:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_42), 16, 16)) -> intp(1, 0, 6)
	.word 0xb5510000  ! 748: RDPR_TICK	<illegal instruction>
hwintr_1_43:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_43), 16, 16)) -> intp(1, 0, 3b)
	.word 0xb5a5c8a0  ! 754: FSUBs	fsubs	%f23, %f0, %f26
	.word 0xb3a48840  ! 755: FADDd	faddd	%f18, %f0, %f56
	.word 0xb9a509a0  ! 759: FDIVs	fdivs	%f20, %f0, %f28
	.word 0x91956056  ! 760: WRPR_PIL_I	wrpr	%r21, 0x0056, %pil
	.word 0xbdabc820  ! 765: FMOVVC	fmovs	%fcc1, %f0, %f30
	.word 0x8195e191  ! 767: WRPR_TPC_I	wrpr	%r23, 0x0191, %tpc
	setx	0x97f2a96a0000185f, %g1, %r10
	.word 0x819a8000  ! 768: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb7a4c8e0  ! 769: FSUBq	dis not found

	.word 0xb1520000  ! 770: RDPR_PIL	<illegal instruction>
	.word 0xb5a54860  ! 771: FADDq	dis not found

	.word 0x919420d3  ! 774: WRPR_PIL_I	wrpr	%r16, 0x00d3, %pil
hwintr_1_44:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_44), 16, 16)) -> intp(1, 0, 39)
	.word 0xb5355000  ! 776: SRLX_R	srlx	%r21, %r0, %r26
	.word 0x8594212e  ! 779: WRPR_TSTATE_I	wrpr	%r16, 0x012e, %tstate
	.word 0x8995a049  ! 780: WRPR_TICK_I	wrpr	%r22, 0x0049, %tick
	.word 0x8d94607f  ! 781: WRPR_PSTATE_I	wrpr	%r17, 0x007f, %pstate
	.word 0xb9a00540  ! 782: FSQRTd	fsqrt	
	.word 0xbda81c20  ! 784: FMOVRGEZ	dis not found

	mov	1, %r12
	.word 0x8f930000  ! 789: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb3aa0820  ! 790: FMOVA	fmovs	%fcc1, %f0, %f25
	.word 0xbfaa8820  ! 792: FMOVG	fmovs	%fcc1, %f0, %f31
	.word 0x8994e03e  ! 793: WRPR_TICK_I	wrpr	%r19, 0x003e, %tick
	.word 0x8d94610f  ! 797: WRPR_PSTATE_I	wrpr	%r17, 0x010f, %pstate
	.word 0xb7a00540  ! 798: FSQRTd	fsqrt	
hwintr_1_45:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_45), 16, 16)) -> intp(1, 0, 26)
hwintr_1_46:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_46), 16, 16)) -> intp(1, 0, 1a)
	.word 0xb7a9c820  ! 801: FMOVVS	fmovs	%fcc1, %f0, %f27
	.word 0xb9a5c8a0  ! 806: FSUBs	fsubs	%f23, %f0, %f28
	.word 0xb1abc820  ! 808: FMOVVC	fmovs	%fcc1, %f0, %f24
hwintr_1_47:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_47), 16, 16)) -> intp(1, 0, 28)
	.word 0xb3aa4820  ! 824: FMOVNE	fmovs	%fcc1, %f0, %f25
	.word 0xb3510000  ! 826: RDPR_TICK	<illegal instruction>
	.word 0x859461f2  ! 827: WRPR_TSTATE_I	wrpr	%r17, 0x01f2, %tstate
	.word 0x83952009  ! 828: WRPR_TNPC_I	wrpr	%r20, 0x0009, %tnpc
	.word 0xbda40840  ! 829: FADDd	faddd	%f16, %f0, %f30
	.word 0x8d94e0e6  ! 830: WRPR_PSTATE_I	wrpr	%r19, 0x00e6, %pstate
	.word 0xb5a88820  ! 838: FMOVLE	fmovs	%fcc1, %f0, %f26
	.word 0x8394203c  ! 839: WRPR_TNPC_I	wrpr	%r16, 0x003c, %tnpc
	.word 0xb3a81820  ! 841: FMOVRGZ	fmovs	%fcc3, %f0, %f25
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbda5c8c0  ! 844: FSUBd	fsubd	%f54, %f0, %f30
hwintr_1_48:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_48), 16, 16)) -> intp(1, 0, 3a)
	.word 0xb7a00040  ! 847: FMOVd	fmovd	%f0, %f58
	.word 0x8795202f  ! 848: WRPR_TT_I	wrpr	%r20, 0x002f, %tt
	.word 0xbba90820  ! 852: FMOVLEU	fmovs	%fcc1, %f0, %f29
	.word 0xbaac0000  ! 854: ANDNcc_R	andncc 	%r16, %r0, %r29
	.word 0x8194e090  ! 857: WRPR_TPC_I	wrpr	%r19, 0x0090, %tpc
	.word 0xb9a58920  ! 858: FMULs	fmuls	%f22, %f0, %f28
	.word 0xb5a88820  ! 860: FMOVLE	fmovs	%fcc1, %f0, %f26
	.word 0xb9a508e0  ! 861: FSUBq	dis not found

	.word 0xb9a508a0  ! 862: FSUBs	fsubs	%f20, %f0, %f28
	.word 0xbfa00520  ! 865: FSQRTs	fsqrt	
	.word 0xb6b5a194  ! 867: SUBCcc_I	orncc 	%r22, 0x0194, %r27
	.word 0xbf480000  ! 869: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xb1a00520  ! 874: FSQRTs	fsqrt	
	.word 0xb7a00540  ! 875: FSQRTd	fsqrt	
	.word 0xb01dc000  ! 876: XOR_R	xor 	%r23, %r0, %r24
	.word 0xbda00520  ! 879: FSQRTs	fsqrt	
	.word 0xb014c000  ! 883: OR_R	or 	%r19, %r0, %r24
	.word 0xb7a88820  ! 884: FMOVLE	fmovs	%fcc1, %f0, %f27
	.word 0xb6944000  ! 886: ORcc_R	orcc 	%r17, %r0, %r27
	.word 0xb7a00560  ! 887: FSQRTq	fsqrt	
	.word 0xb7a84820  ! 888: FMOVE	fmovs	%fcc1, %f0, %f27
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb9a00520  ! 893: FSQRTs	fsqrt	
	.word 0xb351c000  ! 894: RDPR_TL	<illegal instruction>
	.word 0xbba00520  ! 896: FSQRTs	fsqrt	
	.word 0xbd500000  ! 897: RDPR_TPC	<illegal instruction>
	.word 0xb5a80820  ! 899: FMOVRLEZ	fmovs	%fcc1, %f0, %f26
	.word 0xb5a50920  ! 900: FMULs	fmuls	%f20, %f0, %f26
hwintr_1_49:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_49), 16, 16)) -> intp(1, 0, 38)
	.word 0xbba00020  ! 902: FMOVs	fmovs	%f0, %f29
	mov	1, %r12
	.word 0x8f930000  ! 903: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbda509a0  ! 904: FDIVs	fdivs	%f20, %f0, %f30
	.word 0xbba508e0  ! 905: FSUBq	dis not found

	.word 0xbba8c820  ! 906: FMOVL	fmovs	%fcc1, %f0, %f29
	.word 0x8795206e  ! 912: WRPR_TT_I	wrpr	%r20, 0x006e, %tt
	.word 0xb7a4c9a0  ! 913: FDIVs	fdivs	%f19, %f0, %f27
	.word 0xb3a80c20  ! 916: FMOVRLZ	dis not found

	.word 0xb9a81420  ! 923: FMOVRNZ	dis not found

	.word 0xb5a50840  ! 925: FADDd	faddd	%f20, %f0, %f26
hwintr_1_50:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_50), 16, 16)) -> intp(1, 0, 1b)
	.word 0xb7a94820  ! 929: FMOVCS	fmovs	%fcc1, %f0, %f27
	.word 0xb7480000  ! 930: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xb5a5c8e0  ! 936: FSUBq	dis not found

	.word 0x8194e044  ! 939: WRPR_TPC_I	wrpr	%r19, 0x0044, %tpc
	.word 0x8195a1ca  ! 940: WRPR_TPC_I	wrpr	%r22, 0x01ca, %tpc
	.word 0xbf540000  ! 941: RDPR_GL	<illegal instruction>
	.word 0xb5a00540  ! 955: FSQRTd	fsqrt	
	.word 0xb7a58960  ! 956: FMULq	dis not found

	.word 0xb5abc820  ! 961: FMOVVC	fmovs	%fcc1, %f0, %f26
	.word 0xb9a80c20  ! 965: FMOVRLZ	dis not found

	.word 0x8d9521fc  ! 967: WRPR_PSTATE_I	wrpr	%r20, 0x01fc, %pstate
	.word 0xb9a00520  ! 972: FSQRTs	fsqrt	
	.word 0xbea44000  ! 973: SUBcc_R	subcc 	%r17, %r0, %r31
	.word 0xb9a508e0  ! 974: FSUBq	dis not found

	.word 0xbda588c0  ! 976: FSUBd	fsubd	%f22, %f0, %f30
	.word 0xb3520000  ! 980: RDPR_PIL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb3a589e0  ! 983: FDIVq	dis not found

	.word 0xbfa80420  ! 984: FMOVRZ	dis not found

	.word 0xb1a90820  ! 987: FMOVLEU	fmovs	%fcc1, %f0, %f24
	.word 0xb5a509e0  ! 988: FDIVq	dis not found

	.word 0xb3518000  ! 989: RDPR_PSTATE	<illegal instruction>
	.word 0x8394e1c0  ! 990: WRPR_TNPC_I	wrpr	%r19, 0x01c0, %tnpc
	.word 0xbf540000  ! 994: RDPR_GL	<illegal instruction>
	.word 0xbda548a0  ! 997: FSUBs	fsubs	%f21, %f0, %f30
	.word 0xbbab0820  ! 998: FMOVGU	fmovs	%fcc1, %f0, %f29

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

	.xword	0xd6747d388c23504e
	.xword	0x3eea7883ef3d806e
	.xword	0x13ca922faf29f626
	.xword	0xd219bd1a8d8928de
	.xword	0x7c4003368f69f732
	.xword	0x4b7d9870b7be5ff0
	.xword	0x2dcfe5b15be89e53
	.xword	0x180d4d5020b4f243
	.xword	0xc4c757fa3a301407
	.xword	0xc04de01f018193f8
	.xword	0x89339d40cff2e20e
	.xword	0xbb0196af14a9a4fc
	.xword	0x0b651b8eaf2dd532
	.xword	0xf3dd249bc6b17b00
	.xword	0xf5975906a8edb1c5
	.xword	0x2cdb7709cc6abe21
	.xword	0x9bd216e30531de37
	.xword	0xdb1ce53e58e67460
	.xword	0x4d51c385778f09d0
	.xword	0x2d2a496463c610fd
	.xword	0xe0ca612d0b84e9ec
	.xword	0xc67f8bc10e129cba
	.xword	0x4db33104864dc9aa
	.xword	0x9ca4ca6f3fe1dae7
	.xword	0xf81c807f56a946fb
	.xword	0x01361328861d9acb
	.xword	0xd6fd2810648d2536
	.xword	0x3fe98005c25d0eb0
	.xword	0xee55ee3bae687250
	.xword	0xbc36352808b03274
	.xword	0xe500e942f5bc801d
	.xword	0xf4ff581c26050bb0
	.xword	0xf2ce1d6e9f42929c
	.xword	0x2f651e24ec1f4e54
	.xword	0x279499952a8908bb
	.xword	0x2291331b07e45992
	.xword	0x6c62d2bea770d74a
	.xword	0xf5bea9c2494ee58b
	.xword	0x6cd187c71dad849b
	.xword	0xe5e06bdc04a2f603
	.xword	0xe3ce28ea6f577e1d
	.xword	0x68750f7204844e6f
	.xword	0x26e19464f9a14bbf
	.xword	0xbeb2809c977ed3df
	.xword	0xbe2a8bd2ea397252
	.xword	0x52d41245cd63b1d7
	.xword	0xbc4d6e5b66eb2455
	.xword	0xfa47e003905a9030
	.xword	0x0d6eece8f6f56122
	.xword	0x485f8655b8d232ce
	.xword	0x6d355f96074d3aff
	.xword	0xa48320d4cc720474
	.xword	0x323fc7fae5e5bde7
	.xword	0xd73d7cb970500ad9
	.xword	0xb181f13e9e7a5ec8
	.xword	0xf133ebde1f23fc1c
	.xword	0xc4e588c755f371b6
	.xword	0x94b566277a12d3b6
	.xword	0x2d7c96a1cce6b6d7
	.xword	0x68657e1153362253
	.xword	0x9bfaff49562a0d68
	.xword	0x99837491c6083091
	.xword	0x2dd102f4538975ea
	.xword	0x7a93385c992db35d
	.xword	0x9374c726c2396f0e
	.xword	0x2ce5d973a7f52925
	.xword	0x3f4bc85e3232e87d
	.xword	0x0e9e1c67296ed5aa
	.xword	0x09b8b5c90a2309fe
	.xword	0x5bf3fca69e6cdc39
	.xword	0x0181686ffc65d1c2
	.xword	0x177d9c8176214811
	.xword	0x66aaa4f6c84e9c74
	.xword	0xebe4531d26a2aaac
	.xword	0xd599bb26ad85190d
	.xword	0x6b330a201bf0b459
	.xword	0xb3f5cfec6676e22e
	.xword	0xa5dd3a8f631b7357
	.xword	0x06dd103546d326c4
	.xword	0xe1fb5fdbc4db4a9f
	.xword	0xb6f5992145444878
	.xword	0x55d348205b9ba04a
	.xword	0x1eebe38583c4a060
	.xword	0xb32c8fb52f2f3b5c
	.xword	0x9a967eb1538f2a93
	.xword	0xe393612d0ae5e54f
	.xword	0x6f7aaffec75e83cf
	.xword	0xa307c4524346ca16
	.xword	0xb7a3fcca13710e48
	.xword	0x76b35b430786f75e
	.xword	0xe7601e6fab15c9b1
	.xword	0x082f70183795474b
	.xword	0xe0f4b3ca6ba80267
	.xword	0xcb55cfccf744da28
	.xword	0xe9fb818bcb7755b3
	.xword	0x4b89f8985d3db34d
	.xword	0x262aa7f71cbab6ad
	.xword	0x2b9771d953bdbd2d
	.xword	0x0c50c6956f00bc5e
	.xword	0x988647920b3da03c
	.xword	0x38e11cd7ba93db89
	.xword	0x051460c21927533c
	.xword	0xcdd787338a694ebf
	.xword	0xa4081628d802ecd9
	.xword	0x2e408ff20d1fd134
	.xword	0x2ce5521181762935
	.xword	0x5db316ca89dcfdfa
	.xword	0xd0fa5037fbd86c54
	.xword	0xda8fd9c5b267cfdd
	.xword	0x41a909f7ff8fd47a
	.xword	0xcba0bdc37a61beab
	.xword	0xbfb0c435362d000d
	.xword	0xae9cb06928e638f2
	.xword	0x227ed34bf3bb8682
	.xword	0x1cf9f033645b6a7c
	.xword	0x3fa7946ccf082436
	.xword	0xf7df7492d031b962
	.xword	0xf653805d34825d4d
	.xword	0x59821865de81c642
	.xword	0xfe1d9dfe75c2719f
	.xword	0xd314804aa0be095c
	.xword	0x81c7e7783e678724
	.xword	0x5c19060fb9cd6209
	.xword	0x09d245c9cdcaaa5d
	.xword	0x168f10e07da10db3
	.xword	0x23a13c437fc1a753
	.xword	0x598e33adac4023f2
	.xword	0xf4ad22bcd2d5fbdf
	.xword	0xedd4c9cabb1a69af
	.xword	0x663af9a6b4a4c992
	.xword	0xd5970dce9c6f6fd1
	.xword	0x35368adb55109786
	.xword	0x19073e17460679a8
	.xword	0x37d32d9b9f68834a
	.xword	0xbc088b6ca5c071bb
	.xword	0x81df18bab830627d
	.xword	0x4647cc033b1fd26e
	.xword	0x6a685b0955d621ad
	.xword	0xc324b73d473f122d
	.xword	0x653e3d8abe70d62d
	.xword	0xc9029bf7bc5d4bd6
	.xword	0xf5b840dbbf82c53c
	.xword	0x7cea6832cd033491
	.xword	0xb34c4c2788a78a06
	.xword	0x40f2004e6546cdf8
	.xword	0x4605932642b7238d
	.xword	0x5b6780c089ebcdf7
	.xword	0x2029723f7a158a31
	.xword	0x208cd896145c0d44
	.xword	0xb7cc6a1e295f6eed
	.xword	0xa0c5f7c4f5037091
	.xword	0xbe6cfaaa813751f2
	.xword	0x765013b1dc460aa4
	.xword	0x4b1938e74ecf05ae
	.xword	0x353dc636d71557c8
	.xword	0xaa4110c7fcb09c7e
	.xword	0xe46e370cdb7cbd74
	.xword	0x6d6d0c28c4d1ea63
	.xword	0x4ec4db0af83a1118
	.xword	0xbf6f482ccfa8a98d
	.xword	0x51b2086c9e364192
	.xword	0xc68e488cfeb566c9
	.xword	0x4b3470e561d5d21f
	.xword	0x92834b1afae6e4c3
	.xword	0x46996a6edfa0c36a
	.xword	0x5528ccf106a39ed6
	.xword	0xca446c4498dff9d7
	.xword	0xb24dc6e1cdb7e029
	.xword	0x3831b4cea5ea5e57
	.xword	0x562ac744a3fa9bfd
	.xword	0x9e8baa34319832e4
	.xword	0xddfc680b3267c32b
	.xword	0x92d516ee49974a75
	.xword	0x1aff356b434e072e
	.xword	0x0db281c6cd692557
	.xword	0xf3ffc59ed4a7a9d6
	.xword	0xe72202cce09b66f1
	.xword	0x1f249c048d448e2f
	.xword	0x186656ce3e03a84d
	.xword	0x32b56a381a4e2b1f
	.xword	0x6cdc7dbd28cb6358
	.xword	0x70753b340ad2a915
	.xword	0x7b31c9e583c49faf
	.xword	0x3303c6a31f9dd5d1
	.xword	0x187e7c6c9d0911da
	.xword	0x865497dee30ea2ee
	.xword	0x4f22abb05c239991
	.xword	0x9a6ff519d0516402
	.xword	0x8039310b072c2359
	.xword	0xe11a7dff9b82afef
	.xword	0x194fc47eff4cc708
	.xword	0x9a5d9e4641320889
	.xword	0x8fb86c363374619f
	.xword	0xeb85f8d89905b6d8
	.xword	0xb7534522ec2bca31
	.xword	0xc5ac842faec4231d
	.xword	0x279c066ebc58ff14
	.xword	0x50077cd8df10cd7f
	.xword	0x980edc9a36ed2840
	.xword	0x0ff8c6009bb5ea25
	.xword	0xa32510f2ee44ac4c
	.xword	0xb1f3d3e166d002c0
	.xword	0xb2df3a33cd3a651e
	.xword	0x8078aa9c2a42353d
	.xword	0x4922502f7d6268e9
	.xword	0x1b583df6b4497319
	.xword	0xdf79eea561ed6935
	.xword	0x6377ea892ee49ea6
	.xword	0xf212407a1f546ec9
	.xword	0x2b1a4e52929609ea
	.xword	0x16da0b95671e5c53
	.xword	0x4a5d1c1f3570fa7f
	.xword	0xa3f97876fb3ef70a
	.xword	0xb2222f0f2b6f1059
	.xword	0x3b30acc9bd562ace
	.xword	0xb467f0d919efaa02
	.xword	0x5be29fdd512cb288
	.xword	0x4d80441fedb8e837
	.xword	0x2629e41caa51181a
	.xword	0x992ea1523a80d7f8
	.xword	0x78f14e259dd3bba5
	.xword	0x787620ba947d2f84
	.xword	0x2b54d6854e215ee4
	.xword	0x81e17940500c6722
	.xword	0x0279aac3ca686b08
	.xword	0xeb04ded0a677eb9a
	.xword	0x5e07df6a2e11e63b
	.xword	0x53c7fcb7d39108b0
	.xword	0x53d13337bd93f142
	.xword	0x2c2574f98ad6033f
	.xword	0x2c112a66a1e8dd53
	.xword	0x3bca0f7c25e15895
	.xword	0x5d65a07d1454966a
	.xword	0x2db090c05a511b4e
	.xword	0x295ac87b2822164b
	.xword	0x76a74641dcfb1ae4
	.xword	0x6371e25c31335481
	.xword	0x29001297b53f063d
	.xword	0x5afd66cea2f771de
	.xword	0x5db3be875eda5fb1
	.xword	0x7d25be9a48ef5d99
	.xword	0xf87129a50402ff14
	.xword	0x05bfc5b2e35ad929
	.xword	0x3e2fbf794d389326
	.xword	0x082fef42bd654185
	.xword	0x1af32a9d3c0b0f66
	.xword	0xbd0929efc8163c7e
	.xword	0x131bc6eb7846ddff
	.xword	0x2577e4fcc5153e59
	.xword	0x016871cbf11c1340
	.xword	0x6f70c76d1018bbdd
	.xword	0x7229da177ba5da28
	.xword	0xafd331f1505fb007
	.xword	0xe399bcc59275dd4f
	.xword	0x9ce43377c4533b10
	.xword	0xc7ff27b0726275a8
	.align 0x2000
	.data
data_start_1:

	.xword	0x2727800e0c689d79
	.xword	0x03272a7e8093563b
	.xword	0xe6ed77fc8d02596e
	.xword	0xe67c712baebf49ad
	.xword	0xce595c81db52f686
	.xword	0xb56c0fca33d858fa
	.xword	0xe2a5db97c0e403f3
	.xword	0xb5b58c2a94ca79f2
	.xword	0x5cb4d2c14cb37699
	.xword	0x213199116c47ba06
	.xword	0x71f4a034233ed7dd
	.xword	0x63839a4dd1c8087f
	.xword	0xba71dbe9b5ad4577
	.xword	0xd48382e6a4db5afe
	.xword	0x6f7a6e5f1b9f9e08
	.xword	0x472674ff4e36805f
	.xword	0x3baaf61483cd264d
	.xword	0x5aa9de91bda586d3
	.xword	0x9b68fef515555425
	.xword	0x3574239d4d142dd7
	.xword	0x84a9c1342caa1fbd
	.xword	0x24cf94b5b55edcd1
	.xword	0x0cd965ae7a5a3a4c
	.xword	0x27db14c6547898cd
	.xword	0x26f99f0165744152
	.xword	0x6ac49f88a646317f
	.xword	0x61df8dddf05d741b
	.xword	0xa69d8ae8c2fddf34
	.xword	0x6b92dc0ef6eb83b3
	.xword	0xf5e2453bdca172ba
	.xword	0x9a20c016d067a30e
	.xword	0x4aaceab80910cae2
	.xword	0x1e7aa99aeb3a7cbf
	.xword	0xf2be17a73f492a55
	.xword	0x1edcfa0ade9eb459
	.xword	0xe31b949f1acdcdf6
	.xword	0x86fb4183f4c17cb3
	.xword	0x50b2b5470e36f772
	.xword	0xf7d7f7a6bdaaf8d1
	.xword	0x1c271e82b7ad5ccf
	.xword	0xb6c27380cb92dd58
	.xword	0xce88a2846511c06b
	.xword	0xb426bdbe12d42ff7
	.xword	0x35439c231c542193
	.xword	0xf3e46460dc8ce775
	.xword	0xe7c37220f1e3a9bc
	.xword	0xb2b49abe0516cc11
	.xword	0x4c9e1ceda0701ecc
	.xword	0xa24f79eef5d6cfb1
	.xword	0xc4ad3398ad82ece6
	.xword	0x2670e287f70690c5
	.xword	0x8d1127406eecb6c5
	.xword	0xd63cb23da9d26707
	.xword	0x13e1332d5d7101ec
	.xword	0x7889016985d19ebe
	.xword	0xcfab282d4e62591f
	.xword	0x8c0d29d5dc696732
	.xword	0xea96e96afdbb91b3
	.xword	0x035d8031a8474e9b
	.xword	0x2ccf6f5aae7c798c
	.xword	0xdf06a0676129db39
	.xword	0x9c988710d4082483
	.xword	0x0723b6b655db9ecd
	.xword	0x02426a811d35b6a5
	.xword	0x0c8538dc4ec1bf51
	.xword	0x9081e1d043bb7353
	.xword	0x5e4838281372a5eb
	.xword	0xd73cdb6586b46297
	.xword	0xd79849ade93f3652
	.xword	0x2fe10d419eee7d93
	.xword	0x9a948f5640bd9217
	.xword	0x80a25a5fa64130ef
	.xword	0x6b2b0e579f433eb1
	.xword	0xa1ab77b203fd9cbe
	.xword	0x71c4034271b8d3c1
	.xword	0xefa6b0b766a75b81
	.xword	0x0cdb44f2550b817c
	.xword	0xef9fee9fe95c0ffb
	.xword	0x0b09f4b0786e8c24
	.xword	0xab134c37491ea1a0
	.xword	0xdcb70c99faf48db8
	.xword	0x1c7d32d522fd4cda
	.xword	0xcbd0b91aae59ce97
	.xword	0x6803bd26aaac829b
	.xword	0x455c8fb45826d04c
	.xword	0x47dd93bd64ade161
	.xword	0x06b662b758b72cbf
	.xword	0xb1ad1b1f87fc40e2
	.xword	0x8ed426478ef26b07
	.xword	0xd800452c879509e0
	.xword	0xa5e7b5ebcf376b5a
	.xword	0x42d82a8c823bf548
	.xword	0x065dd4bc5ab25597
	.xword	0xd51b4a231656aa52
	.xword	0x60c287a375cbddec
	.xword	0xf3886b435056cebf
	.xword	0xea5f0d4d8f311061
	.xword	0x2d11d6c84e8e3dff
	.xword	0xc75f45715ba45181
	.xword	0xdb8de440b8797f8a
	.xword	0x32678f7b881989bd
	.xword	0x24d39e4f63844a21
	.xword	0x96fc29f169973353
	.xword	0x446908842cef3161
	.xword	0xb5c1cd952fc2a96c
	.xword	0xe101711d0ca102e4
	.xword	0x6cfef5432dd4dda8
	.xword	0x89141c18713c8a9c
	.xword	0x1e8a822c061a6ceb
	.xword	0x850f89eba1ebc752
	.xword	0xe8fdff36519b875f
	.xword	0x2de057e13de9b6eb
	.xword	0xc084d2a762432478
	.xword	0xc3e9545f35c8c7ba
	.xword	0x034c4bc8f33b83d1
	.xword	0x0d0494decf96998a
	.xword	0x7e99cd923fde5838
	.xword	0x8ad92d2ec42130ac
	.xword	0x5cd129355de45f4b
	.xword	0x4eee64db68419cbc
	.xword	0xbb0f08b421a9d13d
	.xword	0x24251c2505a4d539
	.xword	0xd0adc2ac9c5b7f32
	.xword	0x5910b09d82be5299
	.xword	0xe70171c635dc688b
	.xword	0x7d1c32b4fa347c9a
	.xword	0x6bcd2d330642dbc4
	.xword	0xc82bba772d4a5af9
	.xword	0x9b5f7c2782bdad00
	.xword	0x7575d96e1a1fe6a7
	.xword	0xb951e69d24615388
	.xword	0xa0d5a46620d4101f
	.xword	0x85e681b1b8f9bf63
	.xword	0x10719d5d03b48a80
	.xword	0xfe9f5e5b66390eb3
	.xword	0x0ee48ac008b87455
	.xword	0x7b92093aecee2010
	.xword	0xed97f0649732b460
	.xword	0x1434119a70295af0
	.xword	0x4a3dd1d187fb93d5
	.xword	0xf9ffd176442fe4a9
	.xword	0x39564c94b10a78e0
	.xword	0x95b8bcc9895ffe22
	.xword	0xf84efdbf496cb889
	.xword	0x0f7b237b43255f92
	.xword	0xe1921559d62490cc
	.xword	0x6d0588b4d42dc992
	.xword	0x912508ecc927e578
	.xword	0xb5b61406296cbbda
	.xword	0xf4f5aae827586fac
	.xword	0xadb9ac4ae12e9e0d
	.xword	0x6cb476e83fc4684e
	.xword	0x749abf553a78d695
	.xword	0xef8cb279d17a8449
	.xword	0xc90fb57524a8e147
	.xword	0xf382cc7b0e0c700b
	.xword	0x9ae7e553d8ed2fc2
	.xword	0x253d2246b70d23c2
	.xword	0xb0fcf2fc94010b92
	.xword	0x5a6648e8c330c1b2
	.xword	0xb348dd1b4e93f5da
	.xword	0xa9f83994543b2e40
	.xword	0xcbbdb222d41ad0e7
	.xword	0x9b28954b09c76d86
	.xword	0x27a756ac65944599
	.xword	0xf05ff22fccaf1d80
	.xword	0xe05351b28cb33906
	.xword	0x8ab3b273479ab0f8
	.xword	0x3d8254844720da85
	.xword	0x3cfbaf1f08dc2911
	.xword	0xff394fe8d94aff7f
	.xword	0xab14cc02dccb0cea
	.xword	0xd1b34b8cc29f0d58
	.xword	0x478b2b2d2f20021e
	.xword	0x79544adae68c4537
	.xword	0x68d396566e0493e7
	.xword	0x987113d09c83f53a
	.xword	0x4a3bb52ac5c74206
	.xword	0xc40c90c8a77e1d0d
	.xword	0x48c1dbda07ecec8b
	.xword	0xcddca059cf66a331
	.xword	0x39f35d5f6ca71e72
	.xword	0xcbf2bb00fc6c9071
	.xword	0x89826bd59ca2cd82
	.xword	0xc779e2072ba6f8e2
	.xword	0x7339cb2cfcca3f0a
	.xword	0xdb27070db95bb704
	.xword	0xdf413e6b1cb0886c
	.xword	0xc7bc5d4751036c8b
	.xword	0x8ca629866bc66ef9
	.xword	0x733bf7cb5307fd8d
	.xword	0x0618995d361d2ec9
	.xword	0x7e62793ddc7c82d8
	.xword	0x6c693b7ad81a31f9
	.xword	0x0cdacd625e1c40ab
	.xword	0xfff39be2f579bdf4
	.xword	0x73b38f623cd8f650
	.xword	0xbd04d2a5fa585774
	.xword	0x45f9ceeb9b1332a2
	.xword	0x03d18e6bf2f026c1
	.xword	0xffc503d71371f292
	.xword	0x3fa4efdf710d7db9
	.xword	0x109480cc5048eb5e
	.xword	0x6471902964309c1f
	.xword	0x68230a72ef9405d8
	.xword	0x6775c2373f25b16c
	.xword	0x9190ee003c591f62
	.xword	0x90797a36ebe592e8
	.xword	0xe98b1bff025b066a
	.xword	0xc128fb39f7afa11b
	.xword	0xf54687425044f50a
	.xword	0xfd183f448341c357
	.xword	0xc64b28d161b6920f
	.xword	0x25b5b7ed432d9ece
	.xword	0x518b01dc8c4c74bf
	.xword	0x1116349ea8f846ff
	.xword	0xa7565fb26c5b1189
	.xword	0xa85f471f511f9e4e
	.xword	0x6a1f6f1888fd26a2
	.xword	0x119f71333122bc9b
	.xword	0xff177a3637e944f1
	.xword	0xf44b84f95b11a3a9
	.xword	0x1e4ec46bb789d973
	.xword	0xa3f45c61d6ba2811
	.xword	0x06bacaed06594747
	.xword	0x58490285c64b5ce8
	.xword	0x4d9b3ba940b069eb
	.xword	0xc04f29a89b01a984
	.xword	0xd0b38147fe1ab0f0
	.xword	0xba265b6676fb67f4
	.xword	0x58cc02f6347de4a6
	.xword	0x07a8f4ce7075a3b1
	.xword	0x3318688afb8e4b45
	.xword	0xf88644b5dcceebc7
	.xword	0x58d2fc6637fe3c00
	.xword	0xbafd1cf4180b926c
	.xword	0x8dbc4401e50da6f5
	.xword	0x260eed10be3af4a4
	.xword	0xffd3d71a6bf731c9
	.xword	0xb7537c4f6c0151db
	.xword	0x1837466a2ba04674
	.xword	0xc8899f4b4810f4ed
	.xword	0x9ee876184dfeefe4
	.xword	0x5dd70167e11d8138
	.xword	0xe23acf5f29387b55
	.xword	0x5706e03faaa143f1
	.xword	0x585a86d44feb0d29
	.xword	0x6bcef4b53902a557
	.xword	0xd856107dd99d2a09
	.xword	0x6e48902942173ae9
	.xword	0x57a3e58f220ad3b1
	.xword	0x895e615dc1c2553c
	.xword	0xd361fa6e5709c97a
	.xword	0x27285400836e4432
	.xword	0x108c7c63a2e43f81
	.xword	0x71df685551bfa444
	.align 0x4000
	.data
data_start_2:

	.xword	0xcf6e0187dce85671
	.xword	0xb6677c7acaa15b5b
	.xword	0x42a1d8af8116bc6b
	.xword	0x595bf85b6dbe665c
	.xword	0xbfe6f3f00b2c0b51
	.xword	0xaa33d08d92aee433
	.xword	0x7adcd0b9c29da6ec
	.xword	0x6d17998a887b271d
	.xword	0x2f6cdf0d67b37d25
	.xword	0x657d9469f003322f
	.xword	0x3991421ee8b732b1
	.xword	0x8aafddfb059b80ba
	.xword	0x2ac66dcc2e8f8395
	.xword	0xcb2799c9d05750fc
	.xword	0x94ecf18675fa01f7
	.xword	0x7c8452218dcd80f8
	.xword	0x8d948acbff3964cb
	.xword	0xc54da4b54c4433bc
	.xword	0x14a476655d3dff0f
	.xword	0x88db74ea440bf78b
	.xword	0x0e64dbfad6130044
	.xword	0xd72ab5671ed7d19a
	.xword	0x764f9d9a426a6d56
	.xword	0xcb5bff2e1e744d5d
	.xword	0x25c1cf5e8c1154c0
	.xword	0x4be50a3aff8d3754
	.xword	0x04f625c8f891769a
	.xword	0x2c8b52e4c7765eda
	.xword	0xaeaa5f0f5aacd4b8
	.xword	0x68de63c0e2348d48
	.xword	0x77985c71e09eff7f
	.xword	0x0eff93707367a73e
	.xword	0xdbbfa00a30baec34
	.xword	0xa8a87e248b9028ef
	.xword	0xb49d7b8fb39ba821
	.xword	0xdfb6c7663268d861
	.xword	0x77129778260c8ce0
	.xword	0xd034a092e27be83f
	.xword	0x29fce959c0fefd56
	.xword	0x157197712750fa86
	.xword	0xdb50b00617dd2458
	.xword	0x68a029d46d3c2ae7
	.xword	0x808a2319eeb07fc5
	.xword	0x5c840bfbc403b57c
	.xword	0x9f10b68800955630
	.xword	0x989e75459933a0f8
	.xword	0x88d6880d045051f9
	.xword	0x4bb3805df2414e13
	.xword	0x02a97ae973fc6f15
	.xword	0x9767571410f28651
	.xword	0xf9e663bd328a5cf9
	.xword	0xc0ac7df20edf6dcb
	.xword	0x4a1b1a68ae7c0853
	.xword	0x7e8d9d1b34a0f4f0
	.xword	0xaaf275d2ae3fe7a6
	.xword	0x7b9500059cbcd897
	.xword	0x0c6e59f77e272586
	.xword	0xcf521ac5ab263757
	.xword	0x537a388415fcb1f4
	.xword	0xd165a46c3ab9b5fa
	.xword	0x7850b276d52b34bc
	.xword	0xc153a4f62e9ff448
	.xword	0xbf9881a5fb549c75
	.xword	0x41ef6d05cda78f5d
	.xword	0x48ee052ec4c6cb63
	.xword	0xcfc9e27d5a0aa207
	.xword	0xcddef132dd2bfb37
	.xword	0x52ef463d88d1b6d9
	.xword	0x6205b71607450787
	.xword	0x4a6bf26bab38d96f
	.xword	0x037f12e0ac1407cd
	.xword	0x331ea64357cb70e2
	.xword	0xef3ebd101c2a913b
	.xword	0x56eb082fa7a4e2a7
	.xword	0xe3a3c233eda6440b
	.xword	0x3015a8c5f0be7e6c
	.xword	0xa2bccab7197511e1
	.xword	0x87ecab55457cf6ba
	.xword	0xc54ad4b6628ca58b
	.xword	0x92a8bfa027b4dba6
	.xword	0xf354a3881d93a129
	.xword	0x113595aa6b871c0f
	.xword	0xce3b07f2705bfb9e
	.xword	0x1ffd344b2725dfc0
	.xword	0x9c64c4c270aa0291
	.xword	0x5842ddb8dd822861
	.xword	0x2835862c232e1d12
	.xword	0xfdeaeeca847e29e1
	.xword	0xb431e3608467b35b
	.xword	0x364990bf1c660258
	.xword	0x539827d7288c9e83
	.xword	0xdb9ae1a6babab649
	.xword	0x0b679197f1e81d71
	.xword	0xd168e2abb246497f
	.xword	0xa68cbba9856628f8
	.xword	0x5c3d8beb4a48087f
	.xword	0x3d00ac907974c8cd
	.xword	0x741b43460aa71a68
	.xword	0xcfc3227ae03ec6c1
	.xword	0xc3171f3c2f3696ea
	.xword	0x390494dc6c0c6b9d
	.xword	0x2001c5a3c758ef6e
	.xword	0xcf6e6cfd78c93b7f
	.xword	0x5bc35fb2420bae53
	.xword	0x1e0e8fe94221a0aa
	.xword	0x1608da543676cca9
	.xword	0xaed1e6d38caf02f1
	.xword	0x5946ceb54fab2595
	.xword	0x064c8ee7d58a7bd9
	.xword	0x691718d5b9b5db77
	.xword	0xf698928ce2c012a6
	.xword	0x46fce71a73da51da
	.xword	0xbd29d1e34e39015f
	.xword	0x77e53c728eaa6a1f
	.xword	0xf024d79e89227093
	.xword	0xe989a0678ebc56fc
	.xword	0x2204066493c9198e
	.xword	0x84dd117d0c6f7e7d
	.xword	0x7da2ff823a772011
	.xword	0xb8f12c6e05941287
	.xword	0x174bac5e9665255f
	.xword	0x9a0a23864d7dea17
	.xword	0x93b0d438ef3c0cf4
	.xword	0x15efcf21c2343357
	.xword	0xb25b3e23fbaa6644
	.xword	0xc4f00c08371c1842
	.xword	0xbeb0218ebf658de6
	.xword	0x3bf3790a0f81b2ba
	.xword	0xecf3da1a430a5555
	.xword	0xfa5ce370c15ce343
	.xword	0x9d854ba484f80850
	.xword	0xe0bfb3f89df6e606
	.xword	0xbfa3e568ec66f383
	.xword	0x0197522abfaf4ad4
	.xword	0x5e384f2573456f1d
	.xword	0x1d92b3cb5b658549
	.xword	0x043c2d03a023aedb
	.xword	0x9bed4be134bfedc2
	.xword	0x19ac8027f18bbd9a
	.xword	0x990171c22b2189d0
	.xword	0x3c31ff1f67a596f4
	.xword	0x2624c833dec3c820
	.xword	0x36bd1a308782626a
	.xword	0xcf813104f3ad641c
	.xword	0xedc47893e9a5b99c
	.xword	0x7cf99084dcfcd48d
	.xword	0x7cbef6275c6cd602
	.xword	0x5c51c2d88f5ef33d
	.xword	0x15253ec8cd01303b
	.xword	0x9a5cff5698c9e899
	.xword	0x7e6a2a718528b299
	.xword	0x21505014eb98154b
	.xword	0xffd6baadad6b9f9e
	.xword	0x7a4f2253f54b2eeb
	.xword	0xbf24d65726dd4adb
	.xword	0x7a3c140a7385a269
	.xword	0x5bb6f7359d75a2b3
	.xword	0x2dc358752a2636ab
	.xword	0x90e7954d1e772e5a
	.xword	0x31ec4572d92947a0
	.xword	0xc5fbf4ad1c4bb401
	.xword	0x34f7de80ae7f8f73
	.xword	0x3bcf3c16e0807852
	.xword	0x18a41038d8864c66
	.xword	0xa0e23d1412582ae0
	.xword	0x46b8f7d4dffe52fc
	.xword	0xc245d725fa1ca360
	.xword	0x17fa82e4739af11f
	.xword	0xb7abd149a6723f47
	.xword	0x374f0c86f204e87f
	.xword	0x6dd4cebff6f70cb0
	.xword	0xf13af2402764ca7a
	.xword	0xa855f59e876a0883
	.xword	0xe7047032b171365e
	.xword	0x79c306eb90736c0c
	.xword	0xe8104723ef4b048b
	.xword	0xb6de479087237040
	.xword	0x0b1b92161a32b57f
	.xword	0x9e4f2e5531133da9
	.xword	0x21394a770b6edb41
	.xword	0x498128fc9a427c0b
	.xword	0x1ddf459b8d8503ed
	.xword	0x56305870f3a4c8de
	.xword	0xe97a17b06587417a
	.xword	0x6322664bbd78a095
	.xword	0x0602eaa3824c0892
	.xword	0x7dafa3ebede402c8
	.xword	0x06d9da079774c529
	.xword	0xb38b3961c0e48cd8
	.xword	0x739ef45e5412d22b
	.xword	0x95606f46d58ff877
	.xword	0xdd610afe195b4d5b
	.xword	0x371a245d47b98bd1
	.xword	0x2695916cad062c57
	.xword	0xa0d9e982c6ca723b
	.xword	0x301be7684369c737
	.xword	0x9745e43c6587314e
	.xword	0x34a9097d099ab039
	.xword	0x75ae508aee124588
	.xword	0x3157684d1fca2150
	.xword	0x92bd1710a0dabaa4
	.xword	0x4f01e15d2c588f80
	.xword	0xe42ba3fc7b469d75
	.xword	0x86482d1d0d7ff640
	.xword	0xdf67640ade6ce804
	.xword	0x7548e28948ec452d
	.xword	0x4b84800153ea3d3b
	.xword	0x1ffe9a657dac33c2
	.xword	0xfa2efd26a427f7ed
	.xword	0xf985410094dab8e3
	.xword	0x92b4f4404b7cee68
	.xword	0x748038ec9145897a
	.xword	0x0d6b1a68b524bb3e
	.xword	0x3f03dfbc3d477de5
	.xword	0x81cc8dc4951fecff
	.xword	0xd27695fd04661531
	.xword	0xaba5b867f936f6da
	.xword	0x9adae8e0cbd93beb
	.xword	0xb4868cf26975f08c
	.xword	0xf4fd55f5bb4181d1
	.xword	0x688d052fbb7814ce
	.xword	0xf65931860edc9835
	.xword	0xbf6b1fd19d729e10
	.xword	0x27dbaa9d359ec8d3
	.xword	0x2e993218680ef11b
	.xword	0x86ae501027fa3153
	.xword	0x2a7b815280c20c6a
	.xword	0x9c2e1376a7597bfc
	.xword	0x56b5ce219f590db0
	.xword	0x7e32cd7a0227565b
	.xword	0xa93a2c0f4b3ffcf2
	.xword	0xa4cdc81571dacb52
	.xword	0x82e160b28e38066b
	.xword	0x3c9fd854f0466dae
	.xword	0x1581d2a7e9250e89
	.xword	0xc1157b09ba1ce44e
	.xword	0x5769ad0a455d3e65
	.xword	0xf4d1db228bba17d3
	.xword	0x603fcc9c34cf4d54
	.xword	0x90cde941c151c4bc
	.xword	0xbe62a11e33958379
	.xword	0xd0d16b15bd65f66f
	.xword	0x424ee34350749b6d
	.xword	0x235691091a62af7f
	.xword	0xfb84e208316d13f4
	.xword	0x2392c76766734a1d
	.xword	0xf9d934f214ed4260
	.xword	0xb4ada6eefd70b75a
	.xword	0x0027c6c7d0435f0e
	.xword	0x50b3741ce7e9db43
	.xword	0xdfb3f9045d705e4d
	.xword	0x21295c93790d7cd3
	.xword	0x131db5af06ba2af5
	.xword	0x3b809c6f250d8c0f
	.xword	0xcd48193d71ad2af6
	.xword	0xfba5c1f2842b3ff5
	.align 0x8000
	.data
data_start_3:

	.xword	0x3e251b76edc056ef
	.xword	0x1e3dba84f90e652d
	.xword	0xdd00ff205b7f5ff7
	.xword	0xd2a2a4e66009c0f3
	.xword	0xa3d2a236b2e17470
	.xword	0x202533bdcdfd5ff8
	.xword	0xcb41737b5295105a
	.xword	0xb46d67cf28662f1d
	.xword	0x7ed9eab588133f99
	.xword	0x194c07104935ff76
	.xword	0xb38bf48b3962c91c
	.xword	0xb60d508d03233c80
	.xword	0x6355650b25fd905c
	.xword	0xc1843e9d01e1d1dd
	.xword	0x8c9c57357e18b422
	.xword	0x5ba1484a4db08f81
	.xword	0x0846081a4dfe38a1
	.xword	0x261ff7a03f2b85cd
	.xword	0xa4def09e413e0f6b
	.xword	0x5d41870f0ada207f
	.xword	0xa7cc5e9cee90d83f
	.xword	0xbbe7a9415facc7f1
	.xword	0x06f06c7a7d19148a
	.xword	0xf2d468010363695f
	.xword	0xe493e1614618e2f3
	.xword	0x478d55ca4781055d
	.xword	0xca58def38e015718
	.xword	0x8b6d20247aff5e24
	.xword	0x8d802b6c08933e07
	.xword	0x2249e5a27536954d
	.xword	0x36ee6ff06a022603
	.xword	0xdd700832d938eac1
	.xword	0xa832215175f4cabf
	.xword	0x11dd19a381ba163a
	.xword	0xe07f339585c92970
	.xword	0xee2981049360b0a3
	.xword	0xcd23f049005ab6d6
	.xword	0xb194a47de06a9178
	.xword	0x8935f1a06f886a88
	.xword	0x88d70fb7bbd7677d
	.xword	0x69bc800cfa5364be
	.xword	0x72dfdb5bb603ccbb
	.xword	0x8f4453077f560a82
	.xword	0x4787d4aa432d3cf8
	.xword	0x8f546d93a67a772b
	.xword	0xad0ffacee1394f8c
	.xword	0x3807a297a0f4af3a
	.xword	0x944ff1192641c532
	.xword	0x3cc4658fc8c1ddd1
	.xword	0x06c197ae86a5e27c
	.xword	0xf7b5dbfbd181be19
	.xword	0x462bbac6bfefc1bf
	.xword	0x246392a1327ce9db
	.xword	0xee88f385b93024d9
	.xword	0x221f4421a7943829
	.xword	0x1efe6ea15e0e376b
	.xword	0x9a4512f9b8e0feba
	.xword	0x73917e8af68db531
	.xword	0xeaddfc1b2d155238
	.xword	0x0b0497a4aa1d9c3d
	.xword	0x46bd9780540a86ce
	.xword	0xb68421eab76da53f
	.xword	0x62f1b82dc5ed2a3a
	.xword	0x5f4c7c437cbf0fd2
	.xword	0xb006089f5f5e45ec
	.xword	0xb9c00d8c9b8cdcc3
	.xword	0xae8c47bebffc788a
	.xword	0x33008f1afefe9cd6
	.xword	0x050cfb30c4ae2cb2
	.xword	0xd89243e24494c746
	.xword	0xb2bf9215df35d528
	.xword	0x80299f5201b76b9a
	.xword	0x92519640db1d1a9d
	.xword	0x88d6c34608baedcd
	.xword	0x0a708fe32e7b93a9
	.xword	0xe9fadda9e87f08b9
	.xword	0x7ef3606e17764e89
	.xword	0x4ef89115d899152c
	.xword	0x6b64459e1cfd4a73
	.xword	0xbd9a8fd76ab1e5a2
	.xword	0x21cd16d34ab15095
	.xword	0x94d3f047b95d0052
	.xword	0x54f240663eece71b
	.xword	0x66c72ffa55f5d6a9
	.xword	0xb2bee85f60536921
	.xword	0x9aad3222a5cae588
	.xword	0x8a07842a818b3009
	.xword	0xc309b90adee16c0f
	.xword	0x41a7df05f232be1d
	.xword	0xce8f5d2becef7b77
	.xword	0xa7976ffdca75261b
	.xword	0x86267dc7a7f258c2
	.xword	0xf6a5777a19368637
	.xword	0x6f861fb01ff6eb44
	.xword	0xdcb7b19c9cc5ca25
	.xword	0xaca8cdd231527fa9
	.xword	0x6514eab03af04cf8
	.xword	0x8cb0aec40b418823
	.xword	0x45d0615c232ce09b
	.xword	0xa721b015ab508811
	.xword	0x05179ca0d882b488
	.xword	0x5fdda7fc8c70481e
	.xword	0xcfe1c26d512b5f29
	.xword	0x57dd4f551e67b2e1
	.xword	0x944ae8d0524ba4f1
	.xword	0x79a825bf56c787b6
	.xword	0x9e31414f98229aa8
	.xword	0x706453b4d809d314
	.xword	0x6d6749a2d360b027
	.xword	0xdfc1b95f324cb72b
	.xword	0x0861a72bf981e9a8
	.xword	0xa9969ac0df2323a4
	.xword	0x0881425db38771c2
	.xword	0xb8ae5fc1a63a5c93
	.xword	0x24532408dbadac89
	.xword	0xeb1a2b856554a343
	.xword	0xbb5c8c76d21e4e6a
	.xword	0x1dc354be0d18d90f
	.xword	0x9301fc305b8e0b14
	.xword	0xb7c82559739fbcb1
	.xword	0x93321a11727de3e9
	.xword	0x4c4e0c9331d5c79e
	.xword	0xeadf7270ef345901
	.xword	0x1a20e29778e31295
	.xword	0xbfde101e109e01c5
	.xword	0xc5dab65f429966ca
	.xword	0x249ab8db9b12a9a6
	.xword	0x63180a0add4cea0a
	.xword	0xe10ba7ee7731405f
	.xword	0xdc07aaf539087544
	.xword	0x12ab00774d074cdb
	.xword	0x8c1913f61a48957f
	.xword	0x5c5b17cdb9004f02
	.xword	0x180c672c1ebc24ab
	.xword	0x0b3a6588d85cead0
	.xword	0x6347afdc01fac602
	.xword	0xfd8a36a28e23e8ff
	.xword	0x25f26fc333d88374
	.xword	0x663525c8787b60a9
	.xword	0xb55cbd724ab8ed78
	.xword	0x75100284ad50bcf9
	.xword	0x546ad772a93c397a
	.xword	0xfa7d2bdd1fb1bda9
	.xword	0x2ac1a9ca434a4c51
	.xword	0xb79a2e721b39df46
	.xword	0x2ca63d775d3d6b99
	.xword	0xd51327b73884a688
	.xword	0xfa7250ec7159ced1
	.xword	0xa68cad5426714fa1
	.xword	0x0db4cfd534789ec2
	.xword	0x89243e0509b9821e
	.xword	0xab5b8aadb4cafdaf
	.xword	0x6106a8b9b694f1a2
	.xword	0xce107fa0dfa4bec0
	.xword	0x286fe161238e9211
	.xword	0x1dc71b69c7d2db60
	.xword	0x7dac3146909dbe9f
	.xword	0x483346d7083365d5
	.xword	0x35a68c8dde2d9586
	.xword	0xee23a32d035c164e
	.xword	0x4d8fc29be760c477
	.xword	0x4941ed303a8b12fe
	.xword	0xa9078b6bfb8224c9
	.xword	0xab6ed5d4bd0ff083
	.xword	0x0a6583babedb2490
	.xword	0x228f8a400c638d90
	.xword	0x152fd74bd06e323f
	.xword	0x44300ad8ce819a16
	.xword	0x9005918f32bfc076
	.xword	0x08c79b6b65f1a6bb
	.xword	0xaf5004e782a60dd4
	.xword	0xa7a72e5472a4b50f
	.xword	0x31a787aaffadbe74
	.xword	0x863c3490dc3fd49a
	.xword	0x9345bd806cbf7c03
	.xword	0x25d5ec658e1a4ff6
	.xword	0xd4092eb291052942
	.xword	0x46b6be95595fa775
	.xword	0xd8a5db3f120e1d72
	.xword	0xf518af3402b29d10
	.xword	0x60d73c2ceefe1178
	.xword	0x87f43ed2ed96a08b
	.xword	0x965d8044e1d9a3f2
	.xword	0x4c3fa535686894f4
	.xword	0xf6ba11d3ccae15c2
	.xword	0xe8534093d2cd4d9b
	.xword	0xb21dcce411cc7a8e
	.xword	0xc215c531f41cdd1b
	.xword	0xc19fffd737311dc2
	.xword	0x8d8cec5780d8fc70
	.xword	0x64bfdc2e2d6d92ed
	.xword	0xdfdecd85ad68b9ef
	.xword	0x40230b654602af60
	.xword	0x47019a80a693d37c
	.xword	0x792b2f410e4ba63f
	.xword	0x53a6dfd9eb3ae0df
	.xword	0xb508bf9cae1ec43e
	.xword	0xf6ca943a3208f961
	.xword	0xb1fad976c501dec6
	.xword	0xacbf85472abf5231
	.xword	0x25fd2c342f8521e7
	.xword	0xd49b7060a4647b54
	.xword	0x9c967c7d2ec75e34
	.xword	0x7fb2fbc6931579eb
	.xword	0x89a8527c0d9d3807
	.xword	0x4cda10fb48658fef
	.xword	0x69be305de4fbe35c
	.xword	0x52d869933bffd2f7
	.xword	0x352e907ea8d662e7
	.xword	0xb2c9f19a7cba4d3c
	.xword	0x0631dc9ffff00a6a
	.xword	0x23a8f9962fc374b4
	.xword	0x8895ceff24854867
	.xword	0x453f5902d149543b
	.xword	0x0f7103ff3fd4480a
	.xword	0x2f4a264461132e2d
	.xword	0x4bab7cae83034a9c
	.xword	0x54d56b7a567e181e
	.xword	0x4e6186a8143d9600
	.xword	0x9c52aecf4027ad5d
	.xword	0xe9a59570aa737015
	.xword	0x3f51a774b0a5d432
	.xword	0x8f0f83d5e00dd539
	.xword	0x9159bd53fccc9afd
	.xword	0x3818ef1d584a9b55
	.xword	0x787de68b17e3c599
	.xword	0xb941b5f943d7a4fd
	.xword	0x9786dd29bbbc20b1
	.xword	0x07c6751c68aa665b
	.xword	0xae46ea43a5b49ef2
	.xword	0x32a7d8f5babe97be
	.xword	0x367f686275a3091a
	.xword	0x050b52caf5f674a2
	.xword	0x93bcb4f55991823a
	.xword	0xbdfd12ef0dea2789
	.xword	0xeb396a81cf7cb534
	.xword	0x8f1188796bd72827
	.xword	0xddebfe10b1c4fc83
	.xword	0xcb83dbef73230cab
	.xword	0xb3ae187463b15de5
	.xword	0x7d8e2e3eb2211b98
	.xword	0x765167bb449e7c01
	.xword	0x32e2e2d3c2ae91e6
	.xword	0xd7c9bbaffada0260
	.xword	0x205b351135cc091e
	.xword	0x25727fd2252cb78f
	.xword	0xd1735dee5b17bb6b
	.xword	0x748cf6cd15990578
	.xword	0xccc071ec72d87b49
	.xword	0x4d9a90633765ae7f
	.xword	0xf65aea27b32b6741
	.xword	0xed0611ef8c2c7e31
	.xword	0x28794d6c946fe8d5
	.xword	0x5062cc1574d58b29
	.xword	0x6658cb6834468332
	.xword	0xd35ad1183ccecb4a
	.align 0x10000
	.data
data_start_4:

	.xword	0x69a0d69c676fbb47
	.xword	0xa74296b0579c1f7d
	.xword	0xf8066cc589a73874
	.xword	0x3571068b3ecacd33
	.xword	0x5541f12abd87761f
	.xword	0x13a53b45ae156451
	.xword	0xad8bab0891957613
	.xword	0x6e5731f85480d9be
	.xword	0xbc730acf3c45f062
	.xword	0x85fc45671f29b434
	.xword	0x74bb3c376b5b79ac
	.xword	0x83ca1674e4dc0a2d
	.xword	0x464fd9e535bc101e
	.xword	0x0b8b48ef9960172b
	.xword	0x8e006cf00a7d2947
	.xword	0xff6be7c6eebbe7cb
	.xword	0xc81e08a8095edc15
	.xword	0x0c8710f19c7d396a
	.xword	0x0f30997f583a1aa1
	.xword	0x0dea6e2f98d3bed3
	.xword	0x179c77d5734f1b11
	.xword	0xef1af9849511df5d
	.xword	0x3f55aa0461f77201
	.xword	0x3568dc05df50bdf2
	.xword	0x8a525f75545a48d5
	.xword	0x77a5ae47a75f35a9
	.xword	0x0b4c49156e4cd5f1
	.xword	0x0987f37779cf5d3d
	.xword	0x1a4e0c5a1e6920c8
	.xword	0x8ff3fd50d9043ea6
	.xword	0x901eb7d14bc1ab75
	.xword	0xdb6180f3fe06584d
	.xword	0x29573e831dd24cbf
	.xword	0x35faf54bf29a87fa
	.xword	0x31563f729284d8ad
	.xword	0x3de6b29bfa3cbd7e
	.xword	0x80011927fe90593d
	.xword	0x52d90030dd2fdb8d
	.xword	0x37fa7622475f020f
	.xword	0xf29269e5868e4185
	.xword	0x9e1cd6bd3ef494c8
	.xword	0xe8bc6486d056ee04
	.xword	0x74d5f2c52f7a27e0
	.xword	0x3a2919f38a76195a
	.xword	0x69a727ed773d33d8
	.xword	0x25b064883ec1d444
	.xword	0x4c182965dfcb3655
	.xword	0x9dd9d6229f5ed2b6
	.xword	0xb2908fabab12646a
	.xword	0xba2711c5b9a2834d
	.xword	0x6ad94996e7bc8fb7
	.xword	0xf249eadbfc9be04c
	.xword	0x37cd310edbbfa943
	.xword	0x442d7ec493a2bc86
	.xword	0x1c87d8a039102b1e
	.xword	0x21bfc2c9f03f5070
	.xword	0x5ba8040f8ea6a691
	.xword	0xcb960238da2c3b1d
	.xword	0xb422da2659f27f4c
	.xword	0x203447d0d76ae146
	.xword	0xf7324239ffcf7147
	.xword	0x0a6a65f0a56a1edf
	.xword	0xbefeece7a0ea2c51
	.xword	0x79516d0bcb36901e
	.xword	0xe35fb5eef0520efc
	.xword	0xbcc407b8511e74fe
	.xword	0xce9da0e5fcaf6bac
	.xword	0xaa8cf0bd5d9bed38
	.xword	0x4f3e611c9ed4229b
	.xword	0x30946a7788f4da3d
	.xword	0xf16ab6db2bd1fad4
	.xword	0x1ec75e2f7bea6077
	.xword	0xa8c70799c04af144
	.xword	0xf7d20ba02794b4de
	.xword	0x636fddaf3934e6c0
	.xword	0x0333e810f4c50b51
	.xword	0xda320e52341fa1d1
	.xword	0x5d4b497bcccef43c
	.xword	0x1fb68bdb1f679e8e
	.xword	0x3133c2c1c2b2dc57
	.xword	0xf6376a2d280e55f9
	.xword	0xcf26a5f5baf95f09
	.xword	0xd5284f769a08915a
	.xword	0x0500d6dac0430cb8
	.xword	0x1a54bcd82f6f4d2e
	.xword	0xd46fee02acf902ac
	.xword	0x363df795eeb022c6
	.xword	0x331abc037dbd2b0f
	.xword	0x0f221b2ec2895fed
	.xword	0xa7a2fbb2be81cd29
	.xword	0x5d18f49d764b3ae6
	.xword	0xa6c4b6ba69c1b2c3
	.xword	0x806270a6b7878fba
	.xword	0x21b1bb8f0d3b7267
	.xword	0xcdae97279c6f3dba
	.xword	0xcca4e1ba16bef587
	.xword	0x052abfe264a74613
	.xword	0x59ae1711fd3d0345
	.xword	0xb0eb8ba6c31180b3
	.xword	0x865fd9ba6bcb85e1
	.xword	0xb91fea9c275579ef
	.xword	0x466b9e06916a820a
	.xword	0x615e225c2737a2f7
	.xword	0xe4fd96d62fcf7306
	.xword	0xabc58ed361f78475
	.xword	0x5f9caebd15a6e1c7
	.xword	0xb4477b2c3edcae85
	.xword	0x3e1ddd6c7f4f26d1
	.xword	0xf189ef73b0904a9a
	.xword	0xc51712630c08a411
	.xword	0x3e04b879fb670a57
	.xword	0x506183bd712eb236
	.xword	0xe3683c950767c68d
	.xword	0x483ab350f6f3fe29
	.xword	0x659535530fef5fc3
	.xword	0x9e7e29f265182c16
	.xword	0x311242ddedcb1f0c
	.xword	0xa8f6fa47377dc138
	.xword	0x9a3bf46cadaf08aa
	.xword	0x07dedebaa6864bd6
	.xword	0xb487f2b4ad1410ef
	.xword	0x4a23204d675ac321
	.xword	0x4e3d85e63e3bf97a
	.xword	0xaac062e6d5c2d944
	.xword	0x6c8c42b73a495a19
	.xword	0x29d32cbb95154d4c
	.xword	0xe095159c72840382
	.xword	0x20ff14900656cbd3
	.xword	0x7afdbde11bd572ff
	.xword	0x3af5bf939cf521dd
	.xword	0x94c9e7a531540c65
	.xword	0xda95109b80001832
	.xword	0x2cdda48d3a927835
	.xword	0x30b75d2ce5e48bc1
	.xword	0xe6d636a475c05abe
	.xword	0xe12175f0e1458918
	.xword	0x19b03dda2cdb6571
	.xword	0x95115595710a0601
	.xword	0xe70c7acade8cffc9
	.xword	0xa35ca87fb69a23a1
	.xword	0x0579f0738af7a769
	.xword	0x245ddd22ea4a8e56
	.xword	0xe4aeb38c21c12686
	.xword	0x8130a622977812e0
	.xword	0xa29ce7dea13726b2
	.xword	0x2208389a83889cab
	.xword	0xde2dbf8e48dedbcb
	.xword	0x909b10a47172efa3
	.xword	0x172744f8f015a92e
	.xword	0x5c901568110c6239
	.xword	0x73ca8ad0a097e0f2
	.xword	0xcd614c22274f14e7
	.xword	0x522579f9fbb16010
	.xword	0x4bf6b0a0c4e36ea2
	.xword	0xaba4f622976fdb7b
	.xword	0x5659bf68b119d06b
	.xword	0x8d249fce612ba0ea
	.xword	0xb902d32414825734
	.xword	0x206228e5d7cd7f52
	.xword	0x350d9017619b67b2
	.xword	0x17bdc21851feb51e
	.xword	0xb0b33e9698115785
	.xword	0x400526e519a4faf2
	.xword	0x9959b59988c29021
	.xword	0x325c05e9da5d993e
	.xword	0x4d7d026b9321aefc
	.xword	0xa8f39f2217583f65
	.xword	0xbff203274db3819d
	.xword	0x77098aca4a797237
	.xword	0xe0d32deaa2f93f7c
	.xword	0x31616fd1a5564854
	.xword	0x305949f678cd59f1
	.xword	0xeddce043acb693ba
	.xword	0xb945875976501946
	.xword	0x73ec090fd3fa140a
	.xword	0x999986786e4a8828
	.xword	0x665dfd2c3760eab7
	.xword	0xfd2577a086e6fecf
	.xword	0x988b4a46eed2d74a
	.xword	0xcea447b9239573b1
	.xword	0x2ea7d9b71162f8f3
	.xword	0x7a201ea6cd48c407
	.xword	0xb2954dfda8b6c4ac
	.xword	0x8c09a52318793960
	.xword	0x1b523ed7566c184d
	.xword	0xdd12b6fa02c2d3c8
	.xword	0xa0e42ed07be8c9d0
	.xword	0x86226aaf44cc805e
	.xword	0xc187514db7659408
	.xword	0x3828125dfe82400b
	.xword	0xdc805e6223831375
	.xword	0xfe8690717078886e
	.xword	0xe2d78229eac01fe5
	.xword	0x8970faf789f56e84
	.xword	0xc26a80ccb76aef3a
	.xword	0x611dea44a84cc303
	.xword	0xf575f6d8bc44fb42
	.xword	0xf8cc0c81a435db5e
	.xword	0x5adae0316da1409d
	.xword	0xcb2667314cd619e4
	.xword	0x218506fd6fdd4320
	.xword	0xa98efde3db44b7b4
	.xword	0xa8220bdd60911885
	.xword	0xac1b9a2aefa72d85
	.xword	0xc6c28922c95db499
	.xword	0xbbf2e6ffaf9afc3c
	.xword	0x52284550dcb02cee
	.xword	0x9b31e17cffc43cc5
	.xword	0xd431307b1955adca
	.xword	0xadd8591112a20c2c
	.xword	0x5c136343b14b7f76
	.xword	0x6c6816e867f61f71
	.xword	0xdce40c0f46bc6076
	.xword	0x03b1882b9fae93db
	.xword	0x4acb1a27fbef9dbc
	.xword	0xa29cbf86bda4a4fa
	.xword	0x6bb94f1666cd0fa5
	.xword	0x42fede54c4fe9bc7
	.xword	0x0bfcb2063b7ab423
	.xword	0x88fa84440c9edfac
	.xword	0x8dc710fb2ef7d1ef
	.xword	0xdebe8c1d3579847b
	.xword	0x082b550accdc7a6a
	.xword	0x7fed84399955756b
	.xword	0x33a71b1bf820da29
	.xword	0xefb51f4c894d34dc
	.xword	0x39ba7d55a7bad686
	.xword	0x51f9c3842c284bf9
	.xword	0xac5cf8e4141c7e1e
	.xword	0x003e4ed6a267cee0
	.xword	0x3b1e7f9eb3c72b01
	.xword	0x8347c4f1a272d196
	.xword	0x0448ca04a0074288
	.xword	0xe5b123aeaf4c0750
	.xword	0x4333d739ec225814
	.xword	0xc1867f7c55e474ae
	.xword	0xb179a4e382839b40
	.xword	0xd0e7dc44bccff35c
	.xword	0x3ec40bf31f6e126d
	.xword	0xe68dbff820480c67
	.xword	0xa207866704609873
	.xword	0x64cb7ed1890f96a5
	.xword	0x3c909ac5259b3d6b
	.xword	0x491972e476686ddf
	.xword	0x401ac818c9267f55
	.xword	0x395e8785b0e55353
	.xword	0xce7286448fc895ce
	.xword	0x3df1acb0e3bae514
	.xword	0x2292a429029c4bd9
	.xword	0x86819cc68e353eb1
	.xword	0x5e40e971ccf944a0
	.xword	0x72723cd39014b202
	.xword	0xeee5ca38927f634d
	.xword	0x236f030932ddd605
	.xword	0xf3a4b52c3ec5d96b
	.xword	0xd24daf832da7405c
	.align 0x20000
	.data
data_start_5:

	.xword	0x5f4a5ae4e61764b8
	.xword	0xc46620ab19b239bc
	.xword	0x2aba9af0c6c0a62f
	.xword	0x3df907fa9f3d32c2
	.xword	0xd2919c3726f8ec32
	.xword	0x03eafb84543335df
	.xword	0xd178e3a6ba444bbc
	.xword	0xa8eeb1cb29c7e103
	.xword	0x485f3b0722fa7d17
	.xword	0xd98ddccb37341dc6
	.xword	0xefb2b564ddb80286
	.xword	0x783bc28dbc12f8e2
	.xword	0xa3c620e417affb2d
	.xword	0x7bd81f9605a3bf3e
	.xword	0x963320daca8a4e6e
	.xword	0xbcdcda45fe4de411
	.xword	0xa514cbf907223e36
	.xword	0xe3a4320b81d7e870
	.xword	0x5dd32b5942d0f960
	.xword	0xbd651c5ad34c6236
	.xword	0x932bc2a5d4c8ec65
	.xword	0x0159ed77cc166eec
	.xword	0x635e0a8ac420b0c6
	.xword	0x663d0b472c4bbf4a
	.xword	0x0e90e3855e76eb29
	.xword	0x8fcb73c838ed0fca
	.xword	0x3d76aad0e0d87640
	.xword	0xeca7d57c5ac64652
	.xword	0x38eb2cd7166fd6ba
	.xword	0x3be67ace7b161c14
	.xword	0x8c7cd4aff8691dae
	.xword	0x7377ccb24aea3761
	.xword	0x25ba435505008cdf
	.xword	0x0d0c3142432412f4
	.xword	0x831194bfe9463585
	.xword	0x400b83d284b29a4b
	.xword	0x9b56fbb4d451c6f4
	.xword	0xe1fd2c90beda40c2
	.xword	0xf648c81e5c582778
	.xword	0xcae3d9b4c02e8687
	.xword	0x1525d53d1251e6b2
	.xword	0xd0db44f801918871
	.xword	0xbfdaaf914f0c089c
	.xword	0x289a84e49913b3be
	.xword	0x7b49ae1e8d18343a
	.xword	0xa9cb5acbc2cb7e8e
	.xword	0xacd60e56e75793f8
	.xword	0xe47a2ac41bc48690
	.xword	0x397f62e4168086b5
	.xword	0x6b5d06f6af11ae71
	.xword	0x23218b4395a76733
	.xword	0x5fdfd2ba870cd98b
	.xword	0x3980724e09dd65d4
	.xword	0x44d513d2fd2ffdb8
	.xword	0x983d9b505ca67cd9
	.xword	0xa66ece75538dd8fe
	.xword	0x73dcaed3adcbc860
	.xword	0xde169cc5d0dd3a4c
	.xword	0x3bae9cad4af708d0
	.xword	0x953fee5f26959652
	.xword	0x537be617ac0d8740
	.xword	0x993824728aa8355e
	.xword	0x1ba1e9de41e80a4b
	.xword	0xd7395bd6364480b5
	.xword	0x61f68e1c06d68f7f
	.xword	0xe636bdae4057eff1
	.xword	0x2762d0c0990d7beb
	.xword	0xc756655c50c8cc79
	.xword	0xd385a37e40a831eb
	.xword	0xe399ecdd7faca6b4
	.xword	0xb3cf706115d69797
	.xword	0xe4d5b8e73f07a49f
	.xword	0x96c7a69174418d7b
	.xword	0xeb4815f68af74eff
	.xword	0x1d35b611d29e1121
	.xword	0x055f60d7ffbd104a
	.xword	0xb2bc29e07d6bf7fd
	.xword	0x5a7d7a2de2563549
	.xword	0x2af7aa7aaf7efa3d
	.xword	0x1df4a74bc61b8c32
	.xword	0xb564290b58b26e4d
	.xword	0xe0e90e98c656e856
	.xword	0x68ab98daef88795c
	.xword	0x79aa0147ae45d57e
	.xword	0xc7a2f26d4701a449
	.xword	0x06019b3680858387
	.xword	0x687d439abde6c49b
	.xword	0x53b32a9937cdb39b
	.xword	0x3880daaf9973acf5
	.xword	0xfc37c03013863587
	.xword	0x8e384fae56bf49e9
	.xword	0x2329572e1063dd09
	.xword	0x33ff43d6e4c4ed56
	.xword	0x6f29d2449550d36d
	.xword	0x2f7fa68abd8a4701
	.xword	0x5fc74cdcb61206f9
	.xword	0xf6633cd34371d509
	.xword	0xbfe4229601d60d00
	.xword	0x62af3c9398aaae9a
	.xword	0x1f3aadd80958d1d0
	.xword	0xe2bd83842e8af4d7
	.xword	0xefdb1a4959749875
	.xword	0xd1bba20a978916db
	.xword	0xa97cf87894a7012f
	.xword	0x4f47418732f453a4
	.xword	0x1e18743cb0714282
	.xword	0x4a9ea8e24972debc
	.xword	0xee356cfdc95ccb48
	.xword	0xe161e9ab708d7547
	.xword	0x51287c3f77038661
	.xword	0x6e32db980844f7ec
	.xword	0xf115d470baa0dbce
	.xword	0x12b28c0cf1a3cbc9
	.xword	0x0b2bfb9283369b6b
	.xword	0xd9b56c395ac360b1
	.xword	0x5ef797777562b49a
	.xword	0x6c8bd0ad54dd7597
	.xword	0x576566425c919332
	.xword	0xb0bc80315bdaeae7
	.xword	0xe84d0a1e3ad9d8fb
	.xword	0x889805881690457c
	.xword	0x3ef657821b44946a
	.xword	0x773dd9d0b4afd52f
	.xword	0x3341d2ca1713f5fa
	.xword	0x4b173f52330e3842
	.xword	0x5cf78525b526a450
	.xword	0x63d1b65c90e41a7a
	.xword	0x202eb0bd4f17398a
	.xword	0x526d5b49cac703b3
	.xword	0x7097a2350b9354e3
	.xword	0x60c5f825752abc3a
	.xword	0x590d320c08fb6901
	.xword	0xc9e02ebf50251ffe
	.xword	0x20ef9b9fb0fdcf6c
	.xword	0x2372f35e989d12e9
	.xword	0x2ec6391c755b6728
	.xword	0x1adca9b3275f86aa
	.xword	0x0255fef42b235c52
	.xword	0x7468e893eb12df3b
	.xword	0x8460c959b894a0aa
	.xword	0x40c39c380a0d7a53
	.xword	0xf46e79fb8d9f59c9
	.xword	0xb49661148755b816
	.xword	0x0e7da069098703e3
	.xword	0x689f311d1f7a5621
	.xword	0xa044c30b77c8043d
	.xword	0xb27c1f6700ad0976
	.xword	0x346768a16066ade0
	.xword	0x6045beadb1a26766
	.xword	0x121c6d34f4af6107
	.xword	0x82eaf28621cd7cbd
	.xword	0xa721f8438a7f3c76
	.xword	0x92c256fb3d763af9
	.xword	0x1d016aae87a07b77
	.xword	0x869ff99f1c716e96
	.xword	0xf5a17ead94d1455b
	.xword	0x9f891d2f5e30034f
	.xword	0x309fc1d38db98d1c
	.xword	0x76cb96279129df06
	.xword	0x2ef9a15705173052
	.xword	0xd3a6e5196b712a54
	.xword	0xd63e8bbf90e2eb96
	.xword	0x99c492f49ff490dc
	.xword	0x9fd3547b3c4cf583
	.xword	0xe739efa447b0be10
	.xword	0x5a3fa67f70fdfb86
	.xword	0x2b735b16dc71dfdd
	.xword	0xcd68fd8093b312f1
	.xword	0x2d83ee9dbc01a117
	.xword	0xbb239b0a6c22f4bb
	.xword	0xcdecbcb624a6923b
	.xword	0x005b55a687b59efe
	.xword	0xb8823e2990ee41e1
	.xword	0x734ba1c292b1b735
	.xword	0xafe288ffbab6dcbc
	.xword	0xba9fe089321f6a85
	.xword	0x56e43be2ab07222a
	.xword	0xa5b730ee8d28b93f
	.xword	0x707b3fd553bdefab
	.xword	0x85d72201867109ae
	.xword	0x15e9e3170ac71026
	.xword	0x2c3cea516e120063
	.xword	0xfc8d85c75b01cef7
	.xword	0xa67fe626efc0af0b
	.xword	0x5f604b19cfc2b394
	.xword	0xbb8b85977264896b
	.xword	0x9db448266ae4bd26
	.xword	0xc3cd2e4b92aee753
	.xword	0x86b76d2a29de91f3
	.xword	0xacc06d7dba34c5ef
	.xword	0x8a76138d0777e84e
	.xword	0x286766e954a4810e
	.xword	0xafaddffddcdbacdd
	.xword	0x2e8584281d8df4f7
	.xword	0x954e0f35097053f3
	.xword	0x38ca9da873933650
	.xword	0x916a54ccee974cb5
	.xword	0x00a7b65dcf2cb38f
	.xword	0xb5546989cb336663
	.xword	0xb7b391703cc2771b
	.xword	0x59a1bea26f0e9b91
	.xword	0x2bcceba20fed0130
	.xword	0x5eff788c02506604
	.xword	0xeb250917fe3c07fe
	.xword	0xfeff32ab138d345d
	.xword	0xc7f7adfda9b66ab2
	.xword	0xb31371332efca6f8
	.xword	0x540fa48081e17b1e
	.xword	0xd39950c165581e0e
	.xword	0x2d0445dab77c6418
	.xword	0x7a5b154b3da5f2fc
	.xword	0x6d54040453f93b5c
	.xword	0xbe7da8f18a84d5a9
	.xword	0x3acc1cd23771c81f
	.xword	0x30ad452b4e8a212c
	.xword	0x2a0ab5ec36f1b1cd
	.xword	0x52f2782cd2677d4e
	.xword	0xf00f99a40f1ec43a
	.xword	0xaf80455e51c14ea0
	.xword	0x4b99af45a89e92f2
	.xword	0x997ec8c771476118
	.xword	0x64299528d31a8117
	.xword	0x140d2652ecba13b4
	.xword	0x6bdcc2d9447587d5
	.xword	0xaceaf48d6e7c5165
	.xword	0x05d45fc78c7b7253
	.xword	0x585922745cedc8bc
	.xword	0x63a00fc08252ed46
	.xword	0xb1e648c9a7a3097d
	.xword	0x60c78756e18b33c1
	.xword	0x9fd7ccb167c45693
	.xword	0x4ad439ce6c78431d
	.xword	0xae7dd282233a41d0
	.xword	0xe1bfee6ab75a1797
	.xword	0xb2f0792ccbfb4e87
	.xword	0xf949d99be6ccea1b
	.xword	0x8712edaa54d5b1d9
	.xword	0x421c59ed24e0e5d2
	.xword	0x2716d044d8eb43ef
	.xword	0xbc30a0ec7331b468
	.xword	0x6f8e0481377a001e
	.xword	0x657f5c85687bfe1d
	.xword	0x619cd173c6738072
	.xword	0x6e4cc9eaa56235b3
	.xword	0x0fe6a49355d7bf8a
	.xword	0x10acb07ea28f23d3
	.xword	0x0c84b2abb7b71e2e
	.xword	0xcafe317f00110f92
	.xword	0xaf52c2560fc53552
	.xword	0x4e203233db49faea
	.xword	0x6609a1c60c377627
	.xword	0x408d5cb57c87c7d4
	.xword	0x2598ef6d0c532fb5
	.xword	0xdbe16f77250c25e1
	.xword	0x7fd99382340c18fe
	.xword	0x0445b13cc50bd713
	.align 0x40000
	.data
data_start_6:

	.xword	0x8678cd9e2e2ee5bd
	.xword	0x991f032dc27b98d2
	.xword	0x97002039dd34c42e
	.xword	0x6aadd2c086667a68
	.xword	0x797994ef79075c47
	.xword	0xa3012bf50e9464b4
	.xword	0x1e7c0db281397f6a
	.xword	0x7a5fee39d967f472
	.xword	0x911b42ca186c5646
	.xword	0x4b395a0f214315f1
	.xword	0x32d8cc413cc686af
	.xword	0x7dcb0f55fb36767d
	.xword	0x8c0f84b255b4edf8
	.xword	0x8028325f169b1630
	.xword	0xd7fbd4a2ecdbe664
	.xword	0xe5ceb2fdd8e22632
	.xword	0x24a4d03308a7f4de
	.xword	0x9d8a6de7b90e3c5e
	.xword	0x7801b594c3e55002
	.xword	0x715f5f9fbb1bfdb4
	.xword	0xeac531c4f5e10f32
	.xword	0x1b06618da7e0c491
	.xword	0x9d3be185f0d5a806
	.xword	0x2006186fca59f504
	.xword	0x736e1d7d83e5825d
	.xword	0x04e8b8f5ba236dbe
	.xword	0xfea4a55e7e3b4028
	.xword	0x1e9d043a77abaf7e
	.xword	0xb450899581073c21
	.xword	0x1c54e79128c148c1
	.xword	0x6a03efa6081d037c
	.xword	0xe23d8d7684666066
	.xword	0x92c2080d968da629
	.xword	0x094c1849be75da07
	.xword	0x7a9add34c8819a14
	.xword	0x5a97ba42b257cae8
	.xword	0x63ec6281dac937ef
	.xword	0x0271ba9c8aadbd0d
	.xword	0x077383c62ccbbaca
	.xword	0xf2d2b28c887d8f41
	.xword	0xfc54290ce9f5b7cc
	.xword	0x93cc1a219302947c
	.xword	0x5036f241ca3dae4c
	.xword	0x824df27738b8be2a
	.xword	0xd762ca0718ccc54b
	.xword	0x611f5e954c9e035e
	.xword	0xaca028739ff54ff2
	.xword	0xeece4bb5fc85be14
	.xword	0xdd6ce81f081800a3
	.xword	0x2343f86baab9adae
	.xword	0x00637bd2e42ff872
	.xword	0xaba7541f89a116ef
	.xword	0x08b3ec3fca488dff
	.xword	0x0942eb53c863b866
	.xword	0x20129a39e0fe88ff
	.xword	0xde2271a19caffcf7
	.xword	0x0055fc93007b58ba
	.xword	0xdef59b21149bd8d4
	.xword	0x06770b3f81a48685
	.xword	0x8e738ca4452d1954
	.xword	0xa08b412d8c20a86d
	.xword	0x48323c2c9cb98e47
	.xword	0x345ef373b649c2e4
	.xword	0xa5922865b9321fba
	.xword	0xde2c1691a423fd89
	.xword	0xa5982f3c7cf35630
	.xword	0xfd27b2dcf91e3972
	.xword	0xaa4d78327af33c1e
	.xword	0x0e294644a994b9dc
	.xword	0xd713c5bb3ae74668
	.xword	0xc899d9d0fb83136e
	.xword	0x31f815a70e5f6576
	.xword	0xf0376e2ab6447ddb
	.xword	0x729a7ca667c0f978
	.xword	0xe00e68c25161b6df
	.xword	0xcd25a99fbe95eadd
	.xword	0xdee5929a91685ae7
	.xword	0x560d99c875907fc6
	.xword	0xc2ecb52a60835828
	.xword	0x1ae734c547f5b325
	.xword	0x9710faa492e6b545
	.xword	0x3c916b66ea20dded
	.xword	0xf9d67ddb91ac2bda
	.xword	0x71562f87631b3c28
	.xword	0x197b1379a13c2982
	.xword	0x71037ea49ca73b72
	.xword	0xf89b05efc46351f9
	.xword	0xa3ab646b094d7214
	.xword	0x83d78af321211497
	.xword	0x32274b7f57f5a83d
	.xword	0xfc0b772b01f536e4
	.xword	0xf6723e162ce95708
	.xword	0x90a2e4aa12656a68
	.xword	0x3b2795aebb4f4840
	.xword	0x1b24b505eb930818
	.xword	0x72f1c490cde6aa3d
	.xword	0xdfb0d8eff09c0219
	.xword	0x829ef07ac56d1d89
	.xword	0x085447e3c79a3041
	.xword	0xc1dfdbb267afe201
	.xword	0x278c61cb37c57a2e
	.xword	0x3f42c7bc8e9eae08
	.xword	0x1eb9c311ba086b32
	.xword	0x5808f547a5ddf6e1
	.xword	0xe239688a41029a6e
	.xword	0xc6af0e0e78b7b384
	.xword	0x8f88b974e0d2e404
	.xword	0x9da23645d7edd38c
	.xword	0x79a8a962ebccb926
	.xword	0x57d6ca40ff9a97cb
	.xword	0x13fa959fc053a895
	.xword	0xd218c300b9584757
	.xword	0x18fddb37f02416a1
	.xword	0x2cb29f8abbcead6a
	.xword	0x0f62b2283fb50756
	.xword	0x71ed41eee56725b2
	.xword	0xa0aea07bd9718978
	.xword	0xdeb25afd40fb8e80
	.xword	0x175f44b16faee8ee
	.xword	0xd7985367569efb24
	.xword	0xee9ebc0a6daa10a5
	.xword	0xd54612aff878e7ec
	.xword	0xc92c3220c563f4b2
	.xword	0xcd83409e5060902f
	.xword	0x5eee02cd79814730
	.xword	0x4136a7e6419d04ee
	.xword	0x2ba23f542702a4fb
	.xword	0x49e516b3d3a3e425
	.xword	0x178623b99f22d20b
	.xword	0x2a495074358e3f82
	.xword	0xa674536dda8159a4
	.xword	0xdf27b8d37ed503e7
	.xword	0xf132cac027416728
	.xword	0x4630c8ad12184348
	.xword	0x3f6501c47a5798fe
	.xword	0x9de10cdd75d0adfa
	.xword	0xe3a886b0a12b44b8
	.xword	0x0e95dccf43cc2aae
	.xword	0x571b05e07fe25cdb
	.xword	0x824e6f6d1b08c476
	.xword	0x4c9cf0f42117696e
	.xword	0x7749bc06f703fb0e
	.xword	0x24a82d48ff486771
	.xword	0xe80a2b3e499f9dac
	.xword	0xd9fc54ffda354a39
	.xword	0x6bfcffc1f922a3a4
	.xword	0xe1e2350ce983453f
	.xword	0x3f25fd6afa53d198
	.xword	0x25659153beb9d4de
	.xword	0xa7ce70f7eb970712
	.xword	0x29147110db2e870d
	.xword	0xb44d03ae1627d71f
	.xword	0x4822e85907499b2c
	.xword	0xcb1d42cc6acb89fb
	.xword	0x2b253533c64e23a9
	.xword	0x6d82b91b7fc78a65
	.xword	0x1856126b10834e8d
	.xword	0xc330fe13f1113930
	.xword	0x59e1a1649a3916a6
	.xword	0x0dfeedc9a0efb3b4
	.xword	0xcdf16a71fdc0e74c
	.xword	0xc76f56910e02dc1b
	.xword	0x7d2a3f389ea4d45b
	.xword	0x93fc28690a557ae2
	.xword	0xdcdd0db98f8a5f3c
	.xword	0x80caea1d3b771ba0
	.xword	0x0a35297605dc7f6a
	.xword	0x32d0c8677b74f237
	.xword	0x67308aa391353b3a
	.xword	0x3743edf21ff42848
	.xword	0x702a4d70eba64f68
	.xword	0x0e526788d5b48a57
	.xword	0x2475be9a60f9c20d
	.xword	0x2fe678c760dd0b95
	.xword	0x773cf84e5dd372de
	.xword	0x55cecdfe96823468
	.xword	0xb7bfbfe564b24e09
	.xword	0xeaeac63b1aa6ea5a
	.xword	0x0f199a9d6bf9a47a
	.xword	0xbf234b571cf6e0f9
	.xword	0x82af672958dd9d09
	.xword	0x68f66d080aa01f23
	.xword	0x66ade7ef3fea2925
	.xword	0x4841cea21f30c5da
	.xword	0xede9831c23655298
	.xword	0x61c9aaa762825fbf
	.xword	0xcd62e87320708165
	.xword	0x84a4a12d04b97d34
	.xword	0x230a81a6e8542eec
	.xword	0x09255513f0c97ebc
	.xword	0xee6b91a06ca92727
	.xword	0x4cb77e40f74a5ea7
	.xword	0xaafa412d58009dc1
	.xword	0xd7f16e6b9bc8a100
	.xword	0x447e526968d02836
	.xword	0xfaf453d28e384f8b
	.xword	0xabe59fec0a5bb5ed
	.xword	0xc7f312c074b2524b
	.xword	0x2d2b5dc1e8c0cf80
	.xword	0xb1e18f7fb91f9f1f
	.xword	0x065a17cac851d179
	.xword	0xce8331186d45cc33
	.xword	0xc69a3554208e1095
	.xword	0x81410e5a29071b62
	.xword	0xb4907af1e92661c4
	.xword	0x55490365b31e218d
	.xword	0xfe28159c797ff357
	.xword	0x1ffdd63ca6f6ef65
	.xword	0x84cf1d3f211ae468
	.xword	0x71b72f213ba3689f
	.xword	0xe2ec3c15b47da729
	.xword	0xb10a9aa684680e40
	.xword	0x73b6569c4fe4c0e0
	.xword	0xc165e9df0984606e
	.xword	0x0b958e2ba49b650d
	.xword	0x4f7a09b9f44a7635
	.xword	0x5178317b120a102a
	.xword	0x93617daa511f0236
	.xword	0xec96170ccee25af0
	.xword	0x725c8d2f7b3f1dcf
	.xword	0x0875d624e2363c2f
	.xword	0x3c95fd2b302fb02e
	.xword	0x8527f9e83069feda
	.xword	0xeedd861994b487f5
	.xword	0x0dcae691662d8ec9
	.xword	0xb00141beae7b8568
	.xword	0xf36c74d1f7e1cf10
	.xword	0x2e40c6f62bbbc2c4
	.xword	0x889e0161a5abce83
	.xword	0xfd357b7769b6b884
	.xword	0x736dea2df7ee0a82
	.xword	0x6cf8883b93582412
	.xword	0xb2aca9c0d598c432
	.xword	0x3b510e6226ed00b0
	.xword	0xe5253e69c1cfd7fc
	.xword	0x7dc0395e244a4b4a
	.xword	0x6ba15e3da1910fe3
	.xword	0xe430823e660e2813
	.xword	0x55807aa513e7bacd
	.xword	0x4b02670a2cf119fc
	.xword	0xd178f93b1b918f71
	.xword	0x61a5119404113618
	.xword	0x1355c48ff1c23483
	.xword	0x8bafd5a263453809
	.xword	0x0fa86cb1b2ff4225
	.xword	0x2e4880858b761375
	.xword	0xeff9fcd5a391a841
	.xword	0x0ee00d8b76682347
	.xword	0xfc4d136ba3c7a0c1
	.xword	0xd04656ee5e9d04c4
	.xword	0x8861058288d690fc
	.xword	0x9787f7f3eb271d2f
	.xword	0xc47a2d69a0e89c33
	.xword	0x17b3958ada78200d
	.xword	0xe76d37f806a561fb
	.xword	0x6aab371f6d971159
	.align 0x80000
	.data
data_start_7:

	.xword	0x836fd2d74c3a76ad
	.xword	0xad70695f705a67fc
	.xword	0x2f0afc71a491f1bd
	.xword	0x7077472b7a34b7a0
	.xword	0x1c7435fef4dec62b
	.xword	0x1ef1fb69bf90f739
	.xword	0x6f423a6e2dccbfce
	.xword	0x4c94cf9aea653d87
	.xword	0x1cb1d717bf5b4448
	.xword	0x52a4aa7b617d230c
	.xword	0xcde2f4df343e940d
	.xword	0xb29a3947ec68de70
	.xword	0xd2a72c73bdfa3bfa
	.xword	0x2315095551a9ac4e
	.xword	0xb3d6cee0eb9d5698
	.xword	0xbe8d818d18abca9a
	.xword	0xc6e36fd90ddaa150
	.xword	0x5744816e362427a3
	.xword	0x9722ecd781697016
	.xword	0x9ca848a9d31518fa
	.xword	0x9f56001656d21d75
	.xword	0xb1c50c577af6c687
	.xword	0x7cbbd6ad4193ac3f
	.xword	0x8546943af613fe34
	.xword	0xd8201d9b9d32abaa
	.xword	0xc59e81251a3f3198
	.xword	0x16d1ec6c6cb9e881
	.xword	0x4e0c4d56de3ea777
	.xword	0xa1304d7cd43893f3
	.xword	0x6c6eab6f6e1d0f49
	.xword	0xcd87a42c426ab1a1
	.xword	0xcc87bcec12ed5e8a
	.xword	0xa8c226a3e2e0a227
	.xword	0x386dbc5b71d0adfc
	.xword	0x1535f358b0b29c07
	.xword	0x8200dc8b01a429dc
	.xword	0x72f5e6f662da14b6
	.xword	0x637d86727e38894b
	.xword	0x454210868664af5e
	.xword	0x5bb2a35efe0a589d
	.xword	0x75ef647cc30ae16d
	.xword	0xa9240463e4616e8e
	.xword	0x7124942fc147c41b
	.xword	0xcc1231b138f4a0fb
	.xword	0x1212f3555dfdbd1b
	.xword	0x64dffbe26f0f77c0
	.xword	0x88af087effa4c21f
	.xword	0xc3d47f6835b35b79
	.xword	0x2ff28d19dedc63de
	.xword	0x96152123b4315a4b
	.xword	0x986b18e6cfd7608c
	.xword	0xc5bb732b3b33fcbc
	.xword	0xb314d17514776741
	.xword	0x893ac1df770327ee
	.xword	0x5369f41a6f6f15f0
	.xword	0x91316d43bc5d2b30
	.xword	0xe50cb9814ab3cb7f
	.xword	0xd0e6689ccf5e9a3e
	.xword	0x5d8e81addf2c2a48
	.xword	0xf6bddec75bb9edd7
	.xword	0xcb88ef1f77e331ce
	.xword	0x12428f7835364643
	.xword	0xe360506aba754d6d
	.xword	0xfce8f6977da89c99
	.xword	0x2b5a6645ef529579
	.xword	0x7f416f742a742f51
	.xword	0x26fec1ed53cdcbfb
	.xword	0x1cc1b995b97d8d3f
	.xword	0xb25482d79b06c718
	.xword	0x2437fd4c3738008b
	.xword	0x6aee95018a7af3b6
	.xword	0x401564178ded9c38
	.xword	0xfee6c8a26ff23f4c
	.xword	0x5c7ab03e557b3072
	.xword	0x2a9986f4b52bfd22
	.xword	0xac4d2d10a6b86cd4
	.xword	0xb730a961ca0ded6b
	.xword	0x1f7bcd47b589e145
	.xword	0x00540c48cdb4a751
	.xword	0x4c95d8da4eb53341
	.xword	0x4f0066befd6fe53a
	.xword	0x9f64528c2b7d9410
	.xword	0xfc0d67e585fc8f05
	.xword	0x7c3a77caebd676cc
	.xword	0xaaec1fae1f460ca1
	.xword	0xa01b4e757fc5b8c9
	.xword	0xd17d46b1e8481c21
	.xword	0xa5bc7a923b150845
	.xword	0x900934c15fbbf321
	.xword	0x9b508be1c94b2d35
	.xword	0xc3759bbf8d44a78b
	.xword	0x8222ad05842a7ee3
	.xword	0x0ac745f64106f09c
	.xword	0x74bd406b474f911a
	.xword	0xdb8e928a464c03c6
	.xword	0xaccfd9f8d1c76064
	.xword	0xb4ac8c150aac9587
	.xword	0x5f6666750fb35810
	.xword	0x775f9d08f7c930cb
	.xword	0xfba7563c015481f2
	.xword	0x8bc5014544e13ce0
	.xword	0xfc511cff6c40f294
	.xword	0xf4682e21c5572bd1
	.xword	0xd14dfd4e23ef5336
	.xword	0x249526af401b9afa
	.xword	0xedcae553561b600f
	.xword	0x715b8e4bb1f3098a
	.xword	0x3d56d2171c08c4ef
	.xword	0x6b38c9bfcc47c4b4
	.xword	0x39127979712f53c2
	.xword	0xe8b4e513c945af67
	.xword	0xe92877b51daa7704
	.xword	0xa9a5557afa8543e1
	.xword	0x2b1cf950b8838740
	.xword	0x5b3aa08add2d4071
	.xword	0x36a00d1ee32f72f8
	.xword	0x95008dcb0a672015
	.xword	0x9b6fca8abb5a5604
	.xword	0x484493b49f6d26eb
	.xword	0x2c9fbde6eb3a1187
	.xword	0xad6bfc6a782df0f6
	.xword	0x4e414f842dcb5973
	.xword	0xf15f0fe2d5a07fb1
	.xword	0xcd2c095e1effd59d
	.xword	0x794cecbf08082f9c
	.xword	0x9cff32b369ab94bc
	.xword	0x97ef2c2ba5e93c02
	.xword	0xc7212b2426af845d
	.xword	0xb6cfa67ce75710cc
	.xword	0x3111a3e088e722f0
	.xword	0xc9409e9920666782
	.xword	0x78d68ca71f2d5e47
	.xword	0xad06d14c630d52d6
	.xword	0xb1855a8b3261cff2
	.xword	0x595405d3419942d0
	.xword	0x0b95306088eb5c2e
	.xword	0xb98fe52ee698836d
	.xword	0x91cc4a03b08e773a
	.xword	0xe9eac4be01e61171
	.xword	0xa536bd1a55a82407
	.xword	0xcbf49eb88df3e0ff
	.xword	0xea8dc13e4e36a305
	.xword	0xc8fece3e0c759631
	.xword	0x3ce89c90d52a6c66
	.xword	0x5db48fa6cb27745b
	.xword	0x52a0b4630d6d001b
	.xword	0x29393ca14a8c3840
	.xword	0x4b7a599bcd58f791
	.xword	0x2243e1d2ade2e145
	.xword	0xaef0fea8169c3d23
	.xword	0x7c31d07e85b19c19
	.xword	0xb9feda98ae80ca04
	.xword	0x4f727ed0a99f14f3
	.xword	0x419ae5961aacbc41
	.xword	0x7045fef3846a0afa
	.xword	0x60ef525013f3b8f7
	.xword	0xec3adf5940dd88ae
	.xword	0x285db361b2700130
	.xword	0xbc69e76ef33e2e88
	.xword	0x8c09656bbe2d234d
	.xword	0x6c49e62c3e58983e
	.xword	0x843f17ed4732e959
	.xword	0x3366acb513fdf04e
	.xword	0x5ac415e8b4326c5f
	.xword	0xc1b1acd8d8a5a3c1
	.xword	0x5b63c95c41f01cc2
	.xword	0x49bf9deae5348ddf
	.xword	0xb01223df7af87ad0
	.xword	0x9dd55dd16a4f9a5b
	.xword	0xa18d70a6bb59c20f
	.xword	0x5c02483985a1d235
	.xword	0xecfa9e97c42aac6d
	.xword	0x713ede35766267df
	.xword	0xdfae26fc4a9e298b
	.xword	0xf7e9f816286dfe39
	.xword	0xca7cb14926ef0166
	.xword	0xafe4dfa9ad6a6d41
	.xword	0xc3ad0872702faccc
	.xword	0x9d43adaaa0b41862
	.xword	0x28daba835c6783af
	.xword	0x399e51663ba06ddb
	.xword	0x71634f5bad32c56d
	.xword	0x08a8e6532d1996d7
	.xword	0xe5250fcd85ebdbdd
	.xword	0x1a843965b6ae30c4
	.xword	0x0132f975f0a30ec5
	.xword	0xa43921d2f2bc8128
	.xword	0xf278981f08781c03
	.xword	0xf7134b8bba66226d
	.xword	0x3639c226c1b38bb1
	.xword	0x7028c6dafeec5897
	.xword	0x5cf1850a88eecb07
	.xword	0x6482ffee8e4fba0d
	.xword	0x4ce242ec78823051
	.xword	0x7815960f9d931777
	.xword	0x12b5ba69bd686931
	.xword	0xce50e89291b81724
	.xword	0xad899f4103ca0a97
	.xword	0x7131cc0f3727f384
	.xword	0x77d5b3e239295c04
	.xword	0x50afc75b5a01b80b
	.xword	0xe356657e2b850946
	.xword	0x5f527f984eee15dd
	.xword	0x38db9bff8256a3d3
	.xword	0x95ea4034b61ec848
	.xword	0xcf50277bc5c28408
	.xword	0xee2a811ab0d76664
	.xword	0x380aab8a52b4f3c5
	.xword	0x191c884a35c19fc4
	.xword	0xf7a8712bf9153116
	.xword	0x397250a74fe5a2c9
	.xword	0x82d5eacc4628a1ef
	.xword	0xbea0ae448551596f
	.xword	0x1e3dc11f085d5846
	.xword	0x376268b751f39b97
	.xword	0xa0ad31ffb8db06cb
	.xword	0x818ac7e6b379e641
	.xword	0x1a8e3db97e84f6fb
	.xword	0x190fe2d482f1e20a
	.xword	0xccc74e3ed53ab1a8
	.xword	0x58e374b9ceda367f
	.xword	0x1557a14dab936bc7
	.xword	0x4e80738791f40b2f
	.xword	0xe4817b1934fded4d
	.xword	0x2099175fb554f3f9
	.xword	0xe0b4dc50188eec86
	.xword	0x264eab255661319c
	.xword	0xd253cb46ef15aedd
	.xword	0xea79d2255068ce8e
	.xword	0x35eac802a28ded16
	.xword	0x2af26d3bcf9f0421
	.xword	0x5d1188f71ab9f2cd
	.xword	0x00fcc4eb38df901a
	.xword	0x225e49c5cb45729e
	.xword	0xf9deaf6eda9e8932
	.xword	0x7f4dcf2b0a63dcf5
	.xword	0xbce9001d1063f45f
	.xword	0xcb995ae26e20d90e
	.xword	0x2e42042d53b86be5
	.xword	0x416c05ac9dfc9038
	.xword	0x684df799c318105e
	.xword	0x3db98a2ecd5e5f1a
	.xword	0xf5ed23b9aa10b57f
	.xword	0x8ddc3affac407b77
	.xword	0x3e61c72ae0959bda
	.xword	0x1d0c30e93920493f
	.xword	0xac9f5750da1d1a38
	.xword	0x88db361907c80f45
	.xword	0xdac36b3178f4984c
	.xword	0xd53677a28b4fda63
	.xword	0x3717a38b11c8be6c
	.xword	0xc8911938fb5eae3a
	.xword	0xf46ddd7dc481c38b
	.xword	0x8ee0ad0d04dcce73
	.xword	0x5844b434ad987b9e
	.xword	0xce8ade02c1679412



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
