// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tlu_multi_mix_2_hwint_s0_18.s
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
   random seed:	814727783
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

	setx 0x98ecc4158ec9931a, %g1, %g0
	setx 0x8944cad32532f0cc, %g1, %g1
	setx 0x8f5259855b99cf27, %g1, %g2
	setx 0xc4dab420f0fa77ff, %g1, %g3
	setx 0xc7c2b8bb1bd83df6, %g1, %g4
	setx 0x4962b2f1a79a8ce1, %g1, %g5
	setx 0xe002a7464769f4b5, %g1, %g6
	setx 0x6c41d51a295c194e, %g1, %g7
	setx 0xbcb0b2fbdeda293a, %g1, %r16
	setx 0xc397804147497061, %g1, %r17
	setx 0xd7badeacf19bfafe, %g1, %r18
	setx 0x3ac75b7cc6faf7ad, %g1, %r19
	setx 0x76b42aef174718ed, %g1, %r20
	setx 0xe7a1709698d7fc36, %g1, %r21
	setx 0x02caa267bb064158, %g1, %r22
	setx 0x6826db8fd6314faa, %g1, %r23
	setx 0x24a52d76c0d227d1, %g1, %r24
	setx 0x890ee0e6287a91bf, %g1, %r25
	setx 0xcb2b1c6cbcc50165, %g1, %r26
	setx 0xaa5da6545bfc368d, %g1, %r27
	setx 0x3b89ee15ff5db7c0, %g1, %r28
	setx 0xe3182e82874b3ae6, %g1, %r29
	setx 0x47a00d47c1a59afa, %g1, %r30
	setx 0x19b00332b4de758f, %g1, %r31
	save
	setx 0x29d8db213b869151, %g1, %r16
	setx 0x06176957d12efafb, %g1, %r17
	setx 0x321edf7deafb99e6, %g1, %r18
	setx 0x911309eb5d393244, %g1, %r19
	setx 0xeab293f0c6aa83ca, %g1, %r20
	setx 0x9996b884c0f340e8, %g1, %r21
	setx 0xcd59806c40770bd8, %g1, %r22
	setx 0xbde1a11533a35dae, %g1, %r23
	setx 0x2ca13ded5bceb556, %g1, %r24
	setx 0x27ab0abad72f7fa4, %g1, %r25
	setx 0x364dbac3e03e74a5, %g1, %r26
	setx 0x046132c995f7523b, %g1, %r27
	setx 0x8f3efb732b0a0a36, %g1, %r28
	setx 0xf2002f40d0ab19d0, %g1, %r29
	setx 0x9a559c8b87381351, %g1, %r30
	setx 0x333386aba40b1535, %g1, %r31
	save
	setx 0xe6d9069c4ea6a827, %g1, %r16
	setx 0x9a10216a91b34b09, %g1, %r17
	setx 0x95dcd87e06ef7673, %g1, %r18
	setx 0x008ed8f795f316b6, %g1, %r19
	setx 0x264b56117ad924ff, %g1, %r20
	setx 0xcfdeb27e1995114c, %g1, %r21
	setx 0x1aadc6337310c587, %g1, %r22
	setx 0xea6ab3cb8bfdd2a9, %g1, %r23
	setx 0x1e32943607fc5c84, %g1, %r24
	setx 0xf5f23765ad186113, %g1, %r25
	setx 0x5ba06db64265bc99, %g1, %r26
	setx 0x7eadcb4b31c993b7, %g1, %r27
	setx 0x72fc33ea9dea8f1f, %g1, %r28
	setx 0x66aa8804520b733a, %g1, %r29
	setx 0xe53f989ee2763cdd, %g1, %r30
	setx 0xc80f6f01f80b063d, %g1, %r31
	save
	setx 0xe82b1b96ee03d7e9, %g1, %r16
	setx 0xa9c26b215f2d1a4b, %g1, %r17
	setx 0xad8c1f1a984c214c, %g1, %r18
	setx 0x2c7078e82f69f4e0, %g1, %r19
	setx 0x9ceb9ed3847f5138, %g1, %r20
	setx 0x0242ac9261896f46, %g1, %r21
	setx 0x60157c670c7b930f, %g1, %r22
	setx 0xad90385c3f7e1acd, %g1, %r23
	setx 0x6c3548a458c27b30, %g1, %r24
	setx 0x072e71eeb0420055, %g1, %r25
	setx 0x75b828a113785318, %g1, %r26
	setx 0x72f9af8d5f03206c, %g1, %r27
	setx 0x97dbe8c89046d19c, %g1, %r28
	setx 0xee17c83d916b6c87, %g1, %r29
	setx 0x010668f7aaba8d19, %g1, %r30
	setx 0xac718ee8298e6f41, %g1, %r31
	save
	setx 0x201df9238fd18028, %g1, %r16
	setx 0x719bc7a718271109, %g1, %r17
	setx 0x8eedfc59a2182c9c, %g1, %r18
	setx 0x9f604b3f82ace86b, %g1, %r19
	setx 0x5e24a24c22cf7c08, %g1, %r20
	setx 0xb0617ea6d10fbdb2, %g1, %r21
	setx 0x104d19ca0bf303b9, %g1, %r22
	setx 0x7ac84bb441141470, %g1, %r23
	setx 0x5ddeb63ca6ada415, %g1, %r24
	setx 0xee8270894fc89453, %g1, %r25
	setx 0xdc153019c318317e, %g1, %r26
	setx 0x1ec8a32510940b42, %g1, %r27
	setx 0x28a0448dac5d8d3d, %g1, %r28
	setx 0x55ff882d453ca7f4, %g1, %r29
	setx 0x36fe8cfbee544057, %g1, %r30
	setx 0xb41adf9d8df94c89, %g1, %r31
	save
	setx 0x09e05527b71222b9, %g1, %r16
	setx 0x5e1f8cc44e529b6e, %g1, %r17
	setx 0x796c92a3c3a28dc3, %g1, %r18
	setx 0x514e70a67bee24af, %g1, %r19
	setx 0xd01b766bb6c2ec41, %g1, %r20
	setx 0x7e27a8f8f797e6b8, %g1, %r21
	setx 0x4a06ee42f9663341, %g1, %r22
	setx 0xb82dd1fb1ee079d0, %g1, %r23
	setx 0xada547636b1985ee, %g1, %r24
	setx 0xe946ed9d01452180, %g1, %r25
	setx 0x4b7bf6409eb67f2d, %g1, %r26
	setx 0x1c7c1d57fec42008, %g1, %r27
	setx 0xdc5b3b7aca82deef, %g1, %r28
	setx 0x399eff4c337a4c9e, %g1, %r29
	setx 0x1ad369442136a15a, %g1, %r30
	setx 0xd586adf7e9ecab31, %g1, %r31
	save
	setx 0xda2a92f5252d0234, %g1, %r16
	setx 0xa1cbf3c0dd87b056, %g1, %r17
	setx 0x11d75e8323b41f83, %g1, %r18
	setx 0x846ff9571e830e25, %g1, %r19
	setx 0xf521983306e45fb1, %g1, %r20
	setx 0xfbffb7451caf7477, %g1, %r21
	setx 0xf05736b24b58702e, %g1, %r22
	setx 0x6c6a5c3cd4430291, %g1, %r23
	setx 0x5aa64f05b212835a, %g1, %r24
	setx 0xd995a3fd34f66b07, %g1, %r25
	setx 0x421fcd578f67ab4a, %g1, %r26
	setx 0x5375b73d7f8a5b7d, %g1, %r27
	setx 0x49f47965a7757d52, %g1, %r28
	setx 0x32095609bc1dd1f4, %g1, %r29
	setx 0x8ab517d801af19f3, %g1, %r30
	setx 0x7745409efd8d2062, %g1, %r31
	save
	setx 0x472e739df2869aad, %g1, %r16
	setx 0xf4370271ecc4de97, %g1, %r17
	setx 0x07592a23e9247481, %g1, %r18
	setx 0x8870ede16d110d91, %g1, %r19
	setx 0x6e2129f4f96c53b3, %g1, %r20
	setx 0xe8e7b895b561d7d7, %g1, %r21
	setx 0x4174e1d788e80444, %g1, %r22
	setx 0x1cf38e694a783edb, %g1, %r23
	setx 0xb683939dff54205c, %g1, %r24
	setx 0x7acd990d6030c913, %g1, %r25
	setx 0x8da8cf4751ea1f88, %g1, %r26
	setx 0xbbf3bc6127bb9710, %g1, %r27
	setx 0x7c4cefe00dba3d73, %g1, %r28
	setx 0x729cb5aba9e32d38, %g1, %r29
	setx 0xcf4281ef3e8584fa, %g1, %r30
	setx 0xd930fd9aeb229fd3, %g1, %r31
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
	.word 0xbde5a1cd  ! 2: SAVE_I	save	%r22, 0x0001, %r30
hwintr_0_0:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_0), 16, 16)) -> intp(0, 0, 20)
	.word 0xb3e5a04c  ! 7: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb5e4614e  ! 10: SAVE_I	save	%r17, 0x0001, %r26
	.word 0x919420cd  ! 12: WRPR_PIL_I	wrpr	%r16, 0x00cd, %pil
hwintr_0_1:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_1), 16, 16)) -> intp(0, 0, 3e)
	.word 0xbbe5a1cd  ! 14: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb7e4a11f  ! 16: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb3641800  ! 17: MOVcc_R	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0x87956130  ! 21: WRPR_TT_I	wrpr	%r21, 0x0130, %tt
	.word 0xb1e4e1b6  ! 24: SAVE_I	save	%r19, 0x0001, %r24
	.word 0xbbe46000  ! 25: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xb605a018  ! 27: ADD_I	add 	%r22, 0x0018, %r27
	setx	0x1357d2ca00005b5c, %g1, %r10
	.word 0x839a8000  ! 29: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x8d942065  ! 30: WRPR_PSTATE_I	wrpr	%r16, 0x0065, %pstate
hwintr_0_2:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_2), 16, 16)) -> intp(0, 0, 1d)
	.word 0xbfe4e0a2  ! 41: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xbde4e0f1  ! 42: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xbfe420cd  ! 44: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xbde46056  ! 45: SAVE_I	save	%r17, 0x0001, %r30
	setx	0x1559721c0000fb07, %g1, %r10
	.word 0x839a8000  ! 46: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbb7dc400  ! 49: MOVR_R	movre	%r23, %r0, %r29
	.word 0xbfe56049  ! 50: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xbbe5a19d  ! 52: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xbde5a199  ! 53: SAVE_I	save	%r22, 0x0001, %r30
	.word 0xbcaca181  ! 54: ANDNcc_I	andncc 	%r18, 0x0181, %r30
	.word 0xb9e5a091  ! 55: SAVE_I	save	%r22, 0x0001, %r28
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbfe5a1b9  ! 59: SAVE_I	save	%r22, 0x0001, %r31
hwintr_0_3:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_3), 16, 16)) -> intp(0, 0, 2f)
	.word 0xb3e5a121  ! 62: SAVE_I	save	%r22, 0x0001, %r25
	mov	0, %r12
	.word 0x8f930000  ! 63: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x859421b0  ! 64: WRPR_TSTATE_I	wrpr	%r16, 0x01b0, %tstate
hwintr_0_4:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_4), 16, 16)) -> intp(0, 0, 8)
hwintr_0_5:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_5), 16, 16)) -> intp(0, 0, 2a)
	.word 0xbbe461a7  ! 69: SAVE_I	save	%r17, 0x0001, %r29
	setx	data_start_5, %g1, %r18
	.word 0xb3e4a07e  ! 75: SAVE_I	save	%r18, 0x0001, %r25
	setx	0x6faf22360000cc4a, %g1, %r10
	.word 0x839a8000  ! 78: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbfe42033  ! 79: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb7e5a00d  ! 84: SAVE_I	save	%r22, 0x0001, %r27
hwintr_0_6:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_6), 16, 16)) -> intp(0, 0, 7)
	.word 0xb9e4a0d9  ! 88: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xbfe561a8  ! 90: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xb9e4e1e7  ! 94: SAVE_I	save	%r19, 0x0001, %r28
	.word 0xb9e5a1a4  ! 96: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xbbe4e091  ! 105: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb1e4e140  ! 106: SAVE_I	save	%r19, 0x0001, %r24
	setx	data_start_6, %g1, %r18
	mov	1, %r12
	.word 0xa1930000  ! 117: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xb7e460fa  ! 118: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb1e52148  ! 119: SAVE_I	save	%r20, 0x0001, %r24
	.word 0x8394a00d  ! 121: WRPR_TNPC_I	wrpr	%r18, 0x000d, %tnpc
	.word 0xb9e46053  ! 123: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xba84c000  ! 126: ADDcc_R	addcc 	%r19, %r0, %r29
	.word 0xbb508000  ! 127: RDPR_TSTATE	<illegal instruction>
	.word 0xb7520000  ! 128: RDPR_PIL	<illegal instruction>
	.word 0xb1643801  ! 129: MOVcc_I	<illegal instruction>
	.word 0xba950000  ! 138: ORcc_R	orcc 	%r20, %r0, %r29
	.word 0xb3e4611e  ! 139: SAVE_I	save	%r17, 0x0001, %r25
	.word 0xbd504000  ! 142: RDPR_TNPC	<illegal instruction>
	.word 0xb1e5e0fb  ! 144: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb444a09c  ! 148: ADDC_I	addc 	%r18, 0x009c, %r26
	.word 0xbfe42106  ! 150: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb9e56035  ! 151: SAVE_I	save	%r21, 0x0001, %r28
hwintr_0_7:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_7), 16, 16)) -> intp(0, 0, 3e)
	.word 0xb5e4a065  ! 161: SAVE_I	save	%r18, 0x0001, %r26
hwintr_0_8:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_8), 16, 16)) -> intp(0, 0, 21)
	.word 0xbfe5e1d6  ! 166: SAVE_I	save	%r23, 0x0001, %r31
	setx	data_start_0, %g1, %r23
	.word 0xb9e42194  ! 170: SAVE_I	save	%r16, 0x0001, %r28
	setx	0x7877619400009fd6, %g1, %r10
	.word 0x819a8000  ! 172: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb3e5e1df  ! 174: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb3e4a1e9  ! 176: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xbcb5c000  ! 177: SUBCcc_R	orncc 	%r23, %r0, %r30
hwintr_0_9:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_9), 16, 16)) -> intp(0, 0, 27)
hwintr_0_10:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_10), 16, 16)) -> intp(0, 0, 1b)
	.word 0xb9e5a08e  ! 181: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xb5e56027  ! 183: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb5e4e0cb  ! 186: SAVE_I	save	%r19, 0x0001, %r26
hwintr_0_11:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_11), 16, 16)) -> intp(0, 0, 1e)
	.word 0xb3e4e127  ! 188: SAVE_I	save	%r19, 0x0001, %r25
	.word 0xb550c000  ! 190: RDPR_TT	<illegal instruction>
	.word 0xb9e4a048  ! 191: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb7518000  ! 193: RDPR_PSTATE	<illegal instruction>
	.word 0xbde4e134  ! 194: SAVE_I	save	%r19, 0x0001, %r30
	.word 0x8794e17e  ! 195: WRPR_TT_I	wrpr	%r19, 0x017e, %tt
hwintr_0_12:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_12), 16, 16)) -> intp(0, 0, 1a)
	.word 0xbde4e06e  ! 199: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xbde4618f  ! 201: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb6ac0000  ! 203: ANDNcc_R	andncc 	%r16, %r0, %r27
	.word 0xb3504000  ! 205: RDPR_TNPC	<illegal instruction>
	.word 0xb7504000  ! 211: RDPR_TNPC	<illegal instruction>
	setx	data_start_0, %g1, %r18
hwintr_0_13:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_13), 16, 16)) -> intp(0, 0, 35)
	.word 0xb0b5c000  ! 218: SUBCcc_R	orncc 	%r23, %r0, %r24
	.word 0xb1e4a0e1  ! 220: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xb7e5e1e1  ! 222: SAVE_I	save	%r23, 0x0001, %r27
	.word 0xb1e421df  ! 223: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb1e420ab  ! 224: SAVE_I	save	%r16, 0x0001, %r24
	.word 0x9194e191  ! 226: WRPR_PIL_I	wrpr	%r19, 0x0191, %pil
hwintr_0_14:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_14), 16, 16)) -> intp(0, 0, 19)
	.word 0xb3e560ca  ! 234: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb225a025  ! 237: SUB_I	sub 	%r22, 0x0025, %r25
	.word 0xb8b56110  ! 238: ORNcc_I	orncc 	%r21, 0x0110, %r28
	.word 0xbfe42006  ! 244: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xb5480000  ! 246: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xbde5e117  ! 247: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb9e5e11c  ! 254: SAVE_I	save	%r23, 0x0001, %r28
hwintr_0_15:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_15), 16, 16)) -> intp(0, 0, 3d)
	.word 0xb4c5c000  ! 256: ADDCcc_R	addccc 	%r23, %r0, %r26
hwintr_0_16:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_16), 16, 16)) -> intp(0, 0, 1f)
	.word 0xb7e521e3  ! 260: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb1e421ff  ! 262: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb9e52167  ! 263: SAVE_I	save	%r20, 0x0001, %r28
	.word 0xb33c5000  ! 267: SRAX_R	srax	%r17, %r0, %r25
	.word 0xb3e5e090  ! 269: SAVE_I	save	%r23, 0x0001, %r25
	.word 0xb6054000  ! 271: ADD_R	add 	%r21, %r0, %r27
hwintr_0_17:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_17), 16, 16)) -> intp(0, 0, 18)
	.word 0xb5e4e0b4  ! 275: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xbbe5a18e  ! 281: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xb1e460c0  ! 284: SAVE_I	save	%r17, 0x0001, %r24
	.word 0xb9e46049  ! 285: SAVE_I	save	%r17, 0x0001, %r28
hwintr_0_18:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_18), 16, 16)) -> intp(0, 0, 3f)
	.word 0xb7e5a19e  ! 289: SAVE_I	save	%r22, 0x0001, %r27
	setx	0xd3fbf2100000cd8d, %g1, %r10
	.word 0x839a8000  ! 293: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb1e5212a  ! 295: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xbbe4e1af  ! 296: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xbd480000  ! 304: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb7e4610a  ! 310: SAVE_I	save	%r17, 0x0001, %r27
	.word 0xb8044000  ! 311: ADD_R	add 	%r17, %r0, %r28
	.word 0xbfe5a17b  ! 315: SAVE_I	save	%r22, 0x0001, %r31
	.word 0xbde5e031  ! 318: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xbf540000  ! 319: RDPR_GL	<illegal instruction>
	.word 0x8594e0ca  ! 321: WRPR_TSTATE_I	wrpr	%r19, 0x00ca, %tstate
	.word 0xbbe4a047  ! 324: SAVE_I	save	%r18, 0x0001, %r29
	.word 0xb1e5614c  ! 325: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb7e56128  ! 326: SAVE_I	save	%r21, 0x0001, %r27
hwintr_0_19:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_19), 16, 16)) -> intp(0, 0, 18)
	.word 0xb9e42115  ! 333: SAVE_I	save	%r16, 0x0001, %r28
	setx	data_start_5, %g1, %r22
	.word 0xb62d8000  ! 337: ANDN_R	andn 	%r22, %r0, %r27
	.word 0x8d94e12f  ! 341: WRPR_PSTATE_I	wrpr	%r19, 0x012f, %pstate
	.word 0xb7e5603a  ! 346: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xb7520000  ! 347: RDPR_PIL	<illegal instruction>
	.word 0x8994e022  ! 348: WRPR_TICK_I	wrpr	%r19, 0x0022, %tick
	.word 0xbfe4a019  ! 349: SAVE_I	save	%r18, 0x0001, %r31
	.word 0x91952126  ! 351: WRPR_PIL_I	wrpr	%r20, 0x0126, %pil
	.word 0xb1e521a2  ! 354: SAVE_I	save	%r20, 0x0001, %r24
hwintr_0_20:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_20), 16, 16)) -> intp(0, 0, 3a)
	setx	0x94915db900008d12, %g1, %r10
	.word 0x819a8000  ! 357: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb5e46004  ! 360: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb1e5e0e4  ! 361: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb150c000  ! 362: RDPR_TT	<illegal instruction>
	setx	data_start_6, %g1, %r21
	.word 0xb9e5a01e  ! 366: SAVE_I	save	%r22, 0x0001, %r28
hwintr_0_21:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_21), 16, 16)) -> intp(0, 0, 36)
	.word 0xb9e42013  ! 370: SAVE_I	save	%r16, 0x0001, %r28
hwintr_0_22:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_22), 16, 16)) -> intp(0, 0, f)
	.word 0xbb508000  ! 376: RDPR_TSTATE	<illegal instruction>
	setx	data_start_3, %g1, %r22
hwintr_0_23:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_23), 16, 16)) -> intp(0, 0, c)
	.word 0xbfe42164  ! 383: SAVE_I	save	%r16, 0x0001, %r31
	.word 0xba3d8000  ! 384: XNOR_R	xnor 	%r22, %r0, %r29
	.word 0xb3e52088  ! 385: SAVE_I	save	%r20, 0x0001, %r25
hwintr_0_24:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_24), 16, 16)) -> intp(0, 0, 2e)
	.word 0xb7e5a0e3  ! 389: SAVE_I	save	%r22, 0x0001, %r27
hwintr_0_25:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_25), 16, 16)) -> intp(0, 0, 3e)
	.word 0xbfe560a6  ! 394: SAVE_I	save	%r21, 0x0001, %r31
hwintr_0_26:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_26), 16, 16)) -> intp(0, 0, 10)
	.word 0xbfe4a160  ! 396: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb7e5a0ee  ! 399: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xbbe5215a  ! 401: SAVE_I	save	%r20, 0x0001, %r29
	.word 0xb3e56194  ! 405: SAVE_I	save	%r21, 0x0001, %r25
	.word 0xb5e4e11a  ! 407: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xbde460b2  ! 408: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbbe560bd  ! 411: SAVE_I	save	%r21, 0x0001, %r29
hwintr_0_27:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_27), 16, 16)) -> intp(0, 0, 28)
	.word 0xba44a131  ! 421: ADDC_I	addc 	%r18, 0x0131, %r29
	mov	0, %r12
	.word 0x8f930000  ! 425: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb151c000  ! 428: RDPR_TL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb3480000  ! 433: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb1e420bd  ! 435: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb7e56033  ! 436: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xbde5a19b  ! 437: SAVE_I	save	%r22, 0x0001, %r30
	.word 0x8994a1e4  ! 440: WRPR_TICK_I	wrpr	%r18, 0x01e4, %tick
	.word 0xb9e52118  ! 441: SAVE_I	save	%r20, 0x0001, %r28
	.word 0x8195615c  ! 442: WRPR_TPC_I	wrpr	%r21, 0x015c, %tpc
	.word 0xb9480000  ! 443: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xb93c0000  ! 444: SRA_R	sra 	%r16, %r0, %r28
	.word 0xbfe52085  ! 445: SAVE_I	save	%r20, 0x0001, %r31
	setx	0x89bd1ce30000fd43, %g1, %r10
	.word 0x819a8000  ! 446: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	mov	0, %r12
	.word 0xa1930000  ! 449: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbfe4a110  ! 453: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xbfe5e027  ! 454: SAVE_I	save	%r23, 0x0001, %r31
	.word 0x8594217c  ! 456: WRPR_TSTATE_I	wrpr	%r16, 0x017c, %tstate
	.word 0xb7e4e1f8  ! 457: SAVE_I	save	%r19, 0x0001, %r27
hwintr_0_28:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_28), 16, 16)) -> intp(0, 0, 25)
	.word 0xb1e5e1bf  ! 460: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb3e52127  ! 464: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xbbe46084  ! 465: SAVE_I	save	%r17, 0x0001, %r29
	.word 0xbde4e1b8  ! 466: SAVE_I	save	%r19, 0x0001, %r30
	.word 0xb7e4e1a0  ! 469: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb950c000  ! 471: RDPR_TT	<illegal instruction>
	mov	2, %r12
	.word 0x8f930000  ! 473: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb5e46015  ! 475: SAVE_I	save	%r17, 0x0001, %r26
	mov	1, %r12
	.word 0x8f930000  ! 478: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb5e5e196  ! 479: SAVE_I	save	%r23, 0x0001, %r26
hwintr_0_29:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_29), 16, 16)) -> intp(0, 0, 3e)
	.word 0x8d956084  ! 485: WRPR_PSTATE_I	wrpr	%r21, 0x0084, %pstate
	.word 0xb151c000  ! 488: RDPR_TL	<illegal instruction>
	.word 0xbbe4e1ea  ! 489: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xbf480000  ! 490: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xb1e5216f  ! 491: SAVE_I	save	%r20, 0x0001, %r24
	.word 0x9194e122  ! 494: WRPR_PIL_I	wrpr	%r19, 0x0122, %pil
	setx	0xa9618b160000698b, %g1, %r10
	.word 0x839a8000  ! 495: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbde5e113  ! 498: SAVE_I	save	%r23, 0x0001, %r30
	.word 0xb0348000  ! 499: ORN_R	orn 	%r18, %r0, %r24
	.word 0xb21d20c3  ! 500: XOR_I	xor 	%r20, 0x00c3, %r25
	.word 0xb9518000  ! 503: RDPR_PSTATE	<illegal instruction>
	.word 0xbfe560f6  ! 506: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xba9521a0  ! 509: ORcc_I	orcc 	%r20, 0x01a0, %r29
	.word 0xb551c000  ! 515: RDPR_TL	<illegal instruction>
	.word 0xb6a5e15e  ! 516: SUBcc_I	subcc 	%r23, 0x015e, %r27
	.word 0xb7504000  ! 517: RDPR_TNPC	<illegal instruction>
	.word 0x8d94e0de  ! 519: WRPR_PSTATE_I	wrpr	%r19, 0x00de, %pstate
	.word 0xb1e4e1ed  ! 524: SAVE_I	save	%r19, 0x0001, %r24
hwintr_0_30:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_30), 16, 16)) -> intp(0, 0, 35)
	.word 0xbfe46142  ! 527: SAVE_I	save	%r17, 0x0001, %r31
	.word 0xb1e521a6  ! 529: SAVE_I	save	%r20, 0x0001, %r24
	.word 0x8395e1b7  ! 531: WRPR_TNPC_I	wrpr	%r23, 0x01b7, %tnpc
	.word 0xb8ac8000  ! 532: ANDNcc_R	andncc 	%r18, %r0, %r28
hwintr_0_31:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_31), 16, 16)) -> intp(0, 0, 1e)
	.word 0xb7e42128  ! 536: SAVE_I	save	%r16, 0x0001, %r27
	setx	data_start_1, %g1, %r16
	.word 0xb5e4a14b  ! 538: SAVE_I	save	%r18, 0x0001, %r26
	.word 0xbde4605c  ! 542: SAVE_I	save	%r17, 0x0001, %r30
	setx	data_start_3, %g1, %r21
	.word 0xb7e4a054  ! 548: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb7e5202e  ! 551: SAVE_I	save	%r20, 0x0001, %r27
	setx	0xf1347bfa00001a1a, %g1, %r10
	.word 0x819a8000  ! 552: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb7e4e04b  ! 553: SAVE_I	save	%r19, 0x0001, %r27
	.word 0xb1e520bf  ! 555: SAVE_I	save	%r20, 0x0001, %r24
	.word 0x89942129  ! 558: WRPR_TICK_I	wrpr	%r16, 0x0129, %tick
	setx	data_start_6, %g1, %r17
	.word 0xb3e5a139  ! 560: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xbc452091  ! 562: ADDC_I	addc 	%r20, 0x0091, %r30
	.word 0xbf510000  ! 567: RDPR_TICK	<illegal instruction>
	setx	data_start_3, %g1, %r21
	.word 0xbbe421c6  ! 569: SAVE_I	save	%r16, 0x0001, %r29
hwintr_0_32:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_32), 16, 16)) -> intp(0, 0, 2e)
	.word 0xbde46191  ! 575: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbf359000  ! 576: SRLX_R	srlx	%r22, %r0, %r31
hwintr_0_33:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_33), 16, 16)) -> intp(0, 0, 1a)
	setx	data_start_1, %g1, %r18
hwintr_0_34:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_34), 16, 16)) -> intp(0, 0, 20)
	.word 0xb3480000  ! 593: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xbde421b0  ! 594: SAVE_I	save	%r16, 0x0001, %r30
	.word 0xb1e52172  ! 595: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xbc3de053  ! 597: XNOR_I	xnor 	%r23, 0x0053, %r30
	.word 0x839561ed  ! 600: WRPR_TNPC_I	wrpr	%r21, 0x01ed, %tnpc
	.word 0xbca4e018  ! 603: SUBcc_I	subcc 	%r19, 0x0018, %r30
	.word 0xb3e4a092  ! 607: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb9e420a2  ! 610: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xbde46148  ! 612: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xb5e460e2  ! 613: SAVE_I	save	%r17, 0x0001, %r26
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
hwintr_0_35:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_35), 16, 16)) -> intp(0, 0, 33)
	.word 0xb9e5e1fa  ! 619: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb1e5607a  ! 621: SAVE_I	save	%r21, 0x0001, %r24
hwintr_0_36:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_36), 16, 16)) -> intp(0, 0, 6)
	.word 0xbbe56145  ! 625: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb33c5000  ! 629: SRAX_R	srax	%r17, %r0, %r25
	.word 0xb9e46163  ! 630: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xb7e561d8  ! 631: SAVE_I	save	%r21, 0x0001, %r27
	.word 0xbbe5616c  ! 632: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb9504000  ! 635: RDPR_TNPC	<illegal instruction>
	.word 0xbbe5e07b  ! 638: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb9e5e072  ! 640: SAVE_I	save	%r23, 0x0001, %r28
	.word 0xb3e52050  ! 641: SAVE_I	save	%r20, 0x0001, %r25
	.word 0xb3e4a118  ! 643: SAVE_I	save	%r18, 0x0001, %r25
	.word 0xb7e5a1a9  ! 644: SAVE_I	save	%r22, 0x0001, %r27
	.word 0xb9e4a0b7  ! 649: SAVE_I	save	%r18, 0x0001, %r28
	.word 0xb3e4a123  ! 652: SAVE_I	save	%r18, 0x0001, %r25
	setx	0xb0eac378000029c5, %g1, %r10
	.word 0x839a8000  ! 654: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb81cc000  ! 657: XOR_R	xor 	%r19, %r0, %r28
	.word 0xb5e46184  ! 659: SAVE_I	save	%r17, 0x0001, %r26
	.word 0x8795e081  ! 662: WRPR_TT_I	wrpr	%r23, 0x0081, %tt
	.word 0xb2b4212f  ! 663: ORNcc_I	orncc 	%r16, 0x012f, %r25
	.word 0xb5e46176  ! 665: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xbfe4a0fb  ! 667: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xbde460d9  ! 668: SAVE_I	save	%r17, 0x0001, %r30
	.word 0xbbe5218d  ! 670: SAVE_I	save	%r20, 0x0001, %r29
hwintr_0_37:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_37), 16, 16)) -> intp(0, 0, 26)
	setx	0xb6fdc250000fbdb, %g1, %r10
	.word 0x839a8000  ! 673: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbfe56001  ! 674: SAVE_I	save	%r21, 0x0001, %r31
	.word 0xbde42174  ! 675: SAVE_I	save	%r16, 0x0001, %r30
	mov	2, %r12
	.word 0x8f930000  ! 676: WRPR_TL_R	wrpr	%r12, %r0, %tl
	mov	0, %r12
	.word 0x8f930000  ! 677: WRPR_TL_R	wrpr	%r12, %r0, %tl
	setx	data_start_2, %g1, %r18
	.word 0xba3d8000  ! 689: XNOR_R	xnor 	%r22, %r0, %r29
hwintr_0_38:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_38), 16, 16)) -> intp(0, 0, 29)
	setx	0xec6d259500008bcc, %g1, %r10
	.word 0x819a8000  ! 691: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb3e4a041  ! 692: SAVE_I	save	%r18, 0x0001, %r25
	setx	data_start_4, %g1, %r21
	.word 0xbbe4601b  ! 696: SAVE_I	save	%r17, 0x0001, %r29
	.word 0x9195a111  ! 699: WRPR_PIL_I	wrpr	%r22, 0x0111, %pil
	.word 0xb1e5e02f  ! 700: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xb1508000  ! 701: RDPR_TSTATE	<illegal instruction>
	.word 0xb7504000  ! 704: RDPR_TNPC	<illegal instruction>
	.word 0xbe34a09b  ! 705: ORN_I	orn 	%r18, 0x009b, %r31
	setx	0xf79bea0900005b10, %g1, %r10
	.word 0x839a8000  ! 707: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb5e461a8  ! 708: SAVE_I	save	%r17, 0x0001, %r26
	.word 0xb951c000  ! 709: RDPR_TL	<illegal instruction>
	.word 0xb1e521c0  ! 710: SAVE_I	save	%r20, 0x0001, %r24
	.word 0x87956104  ! 713: WRPR_TT_I	wrpr	%r21, 0x0104, %tt
	.word 0xb9e4e184  ! 714: SAVE_I	save	%r19, 0x0001, %r28
	.word 0x87942028  ! 717: WRPR_TT_I	wrpr	%r16, 0x0028, %tt
	setx	0xd0b9a9b90000ae55, %g1, %r10
	.word 0x819a8000  ! 718: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb7e4a10b  ! 724: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xb1e56060  ! 725: SAVE_I	save	%r21, 0x0001, %r24
	.word 0xb5e4e0a8  ! 726: SAVE_I	save	%r19, 0x0001, %r26
	.word 0xbfe5a0ac  ! 730: SAVE_I	save	%r22, 0x0001, %r31
	.word 0x819461a4  ! 733: WRPR_TPC_I	wrpr	%r17, 0x01a4, %tpc
hwintr_0_39:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_39), 16, 16)) -> intp(0, 0, 19)
	.word 0xb1e42080  ! 735: SAVE_I	save	%r16, 0x0001, %r24
hwintr_0_40:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_40), 16, 16)) -> intp(0, 0, 18)
	.word 0xb3e56050  ! 744: SAVE_I	save	%r21, 0x0001, %r25
	.word 0x8195e0f9  ! 745: WRPR_TPC_I	wrpr	%r23, 0x00f9, %tpc
	setx	data_start_1, %g1, %r23
	.word 0xbf354000  ! 748: SRL_R	srl 	%r21, %r0, %r31
	.word 0xb1e460bf  ! 751: SAVE_I	save	%r17, 0x0001, %r24
	setx	data_start_0, %g1, %r18
	setx	data_start_5, %g1, %r16
	.word 0xb5e4e1d7  ! 769: SAVE_I	save	%r19, 0x0001, %r26
hwintr_0_41:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_41), 16, 16)) -> intp(0, 0, 2b)
	.word 0xb9e561dd  ! 771: SAVE_I	save	%r21, 0x0001, %r28
	.word 0xb5e42057  ! 773: SAVE_I	save	%r16, 0x0001, %r26
	mov	1, %r12
	.word 0xa1930000  ! 774: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbfe4a00f  ! 775: SAVE_I	save	%r18, 0x0001, %r31
	.word 0xb5e56063  ! 776: SAVE_I	save	%r21, 0x0001, %r26
	.word 0xb9e52179  ! 777: SAVE_I	save	%r20, 0x0001, %r28
hwintr_0_42:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_42), 16, 16)) -> intp(0, 0, 33)
	.word 0x8594e0ae  ! 781: WRPR_TSTATE_I	wrpr	%r19, 0x00ae, %tstate
	.word 0xb1e4a158  ! 782: SAVE_I	save	%r18, 0x0001, %r24
	.word 0xbde5e084  ! 783: SAVE_I	save	%r23, 0x0001, %r30
hwintr_0_43:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_43), 16, 16)) -> intp(0, 0, 34)
	.word 0xb1e5e035  ! 788: SAVE_I	save	%r23, 0x0001, %r24
	.word 0xbbe420c1  ! 789: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb1e42166  ! 790: SAVE_I	save	%r16, 0x0001, %r24
	.word 0xb9e460e0  ! 791: SAVE_I	save	%r17, 0x0001, %r28
	.word 0xbbe420f2  ! 797: SAVE_I	save	%r16, 0x0001, %r29
	.word 0x8395e004  ! 798: WRPR_TNPC_I	wrpr	%r23, 0x0004, %tnpc
	.word 0xbbe5606c  ! 801: SAVE_I	save	%r21, 0x0001, %r29
	.word 0xb5540000  ! 807: RDPR_GL	<illegal instruction>
	.word 0xb9e5a076  ! 820: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xbbe5e169  ! 821: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb1e5a0cf  ! 824: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xbbe5e07b  ! 825: SAVE_I	save	%r23, 0x0001, %r29
	.word 0x83952123  ! 828: WRPR_TNPC_I	wrpr	%r20, 0x0123, %tnpc
	.word 0xb1e5a148  ! 830: SAVE_I	save	%r22, 0x0001, %r24
	.word 0xb5e461a4  ! 832: SAVE_I	save	%r17, 0x0001, %r26
	setx	data_start_2, %g1, %r20
	.word 0xb7e4a000  ! 839: SAVE_I	save	%r18, 0x0001, %r27
	.word 0xbbe5e14b  ! 840: SAVE_I	save	%r23, 0x0001, %r29
	.word 0xb9e46160  ! 841: SAVE_I	save	%r17, 0x0001, %r28
hwintr_0_44:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_44), 16, 16)) -> intp(0, 0, 17)
	.word 0xb1e4e1c2  ! 843: SAVE_I	save	%r19, 0x0001, %r24
	mov	2, %r12
	.word 0xa1930000  ! 847: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xbbe52057  ! 848: SAVE_I	save	%r20, 0x0001, %r29
	mov	0, %r12
	.word 0x8f930000  ! 851: WRPR_TL_R	wrpr	%r12, %r0, %tl
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb7e52006  ! 854: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xbd520000  ! 855: RDPR_PIL	<illegal instruction>
	.word 0xb3e5a0ce  ! 861: SAVE_I	save	%r22, 0x0001, %r25
	.word 0xb5510000  ! 862: RDPR_TICK	<illegal instruction>
hwintr_0_45:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_45), 16, 16)) -> intp(0, 0, 2b)
	.word 0xb7e5205b  ! 868: SAVE_I	save	%r20, 0x0001, %r27
	.word 0xb5e5a01a  ! 869: SAVE_I	save	%r22, 0x0001, %r26
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xbde4217e  ! 872: SAVE_I	save	%r16, 0x0001, %r30
	.word 0x839421cb  ! 873: WRPR_TNPC_I	wrpr	%r16, 0x01cb, %tnpc
	.word 0x85956128  ! 877: WRPR_TSTATE_I	wrpr	%r21, 0x0128, %tstate
	.word 0xb635c000  ! 882: SUBC_R	orn 	%r23, %r0, %r27
	.word 0xbbe4206f  ! 883: SAVE_I	save	%r16, 0x0001, %r29
	.word 0xb42de156  ! 886: ANDN_I	andn 	%r23, 0x0156, %r26
	mov	0, %r12
	.word 0x8f930000  ! 887: WRPR_TL_R	wrpr	%r12, %r0, %tl
	setx	0x7001f6690000ca11, %g1, %r10
	.word 0x819a8000  ! 888: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbbe4a189  ! 889: SAVE_I	save	%r18, 0x0001, %r29
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xb3e4a14d  ! 898: SAVE_I	save	%r18, 0x0001, %r25
	.word 0x879521c7  ! 899: WRPR_TT_I	wrpr	%r20, 0x01c7, %tt
	.word 0xbfe56106  ! 902: SAVE_I	save	%r21, 0x0001, %r31
hwintr_0_46:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_46), 16, 16)) -> intp(0, 0, 5)
	.word 0xbd510000  ! 904: RDPR_TICK	<illegal instruction>
	.word 0xbde521a4  ! 908: SAVE_I	save	%r20, 0x0001, %r30
	.word 0xbd51c000  ! 909: RDPR_TL	<illegal instruction>
	.word 0xb1e52103  ! 916: SAVE_I	save	%r20, 0x0001, %r24
	.word 0xbbe4e12a  ! 917: SAVE_I	save	%r19, 0x0001, %r29
	.word 0xb8148000  ! 921: OR_R	or 	%r18, %r0, %r28
hwintr_0_47:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_47), 16, 16)) -> intp(0, 0, 3b)
	.word 0x8995e1e2  ! 934: WRPR_TICK_I	wrpr	%r23, 0x01e2, %tick
	.word 0xbfe4e0fb  ! 948: SAVE_I	save	%r19, 0x0001, %r31
	.word 0xbf480000  ! 953: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xb7e4a0a6  ! 954: SAVE_I	save	%r18, 0x0001, %r27
	setx	0xab20af9800004a46, %g1, %r10
	.word 0x819a8000  ! 956: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb9e56189  ! 957: SAVE_I	save	%r21, 0x0001, %r28
hwintr_0_48:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_48), 16, 16)) -> intp(0, 0, 23)
	setx	0x794df79c00007b44, %g1, %r10
	.word 0x839a8000  ! 963: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbd480000  ! 966: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xb9e42104  ! 969: SAVE_I	save	%r16, 0x0001, %r28
	.word 0xb9e5a065  ! 970: SAVE_I	save	%r22, 0x0001, %r28
	.word 0xbbe4e1f1  ! 971: SAVE_I	save	%r19, 0x0001, %r29
	setx	0x2b4d893c0000bd82, %g1, %r10
	.word 0x819a8000  ! 972: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb7e42014  ! 976: SAVE_I	save	%r16, 0x0001, %r27
hwintr_0_49:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_49), 16, 16)) -> intp(0, 0, c)
hwintr_0_50:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_50), 16, 16)) -> intp(0, 0, 1a)
	.word 0xbe45e051  ! 985: ADDC_I	addc 	%r23, 0x0051, %r31
	.word 0xbbe461d1  ! 986: SAVE_I	save	%r17, 0x0001, %r29
	setx	data_start_2, %g1, %r18
	.word 0xbbe5a174  ! 988: SAVE_I	save	%r22, 0x0001, %r29
	.word 0xbfe5a12c  ! 990: SAVE_I	save	%r22, 0x0001, %r31
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb3e521bb  ! 992: SAVE_I	save	%r20, 0x0001, %r25
	setx	data_start_3, %g1, %r18
	.word 0xb5e4a1cf  ! 997: SAVE_I	save	%r18, 0x0001, %r26
hwintr_0_51:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_51), 16, 16)) -> intp(0, 0, 0)
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
hwintr_3_0:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_0), 16, 16)) -> intp(3, 0, 3)
	.word 0xf13ce1ee  ! 9: STDF_I	std	%f24, [0x01ee, %r19]
	.word 0x9194617b  ! 12: WRPR_PIL_I	wrpr	%r17, 0x017b, %pil
hwintr_3_1:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_1), 16, 16)) -> intp(3, 0, c)
	.word 0xb5641800  ! 17: MOVcc_R	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0x879461c1  ! 21: WRPR_TT_I	wrpr	%r17, 0x01c1, %tt
	.word 0xf6250000  ! 26: STW_R	stw	%r27, [%r20 + %r0]
	.word 0xb605e1f8  ! 27: ADD_I	add 	%r23, 0x01f8, %r27
	.word 0xfa25a0ac  ! 28: STW_I	stw	%r29, [%r22 + 0x00ac]
	setx	0x65b9ba1d0000df8f, %g1, %r10
	.word 0x839a8000  ! 29: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x8d9520d0  ! 30: WRPR_PSTATE_I	wrpr	%r20, 0x00d0, %pstate
	.word 0xfd3c0000  ! 31: STDF_R	std	%f30, [%r0, %r16]
	.word 0xf6344000  ! 32: STH_R	sth	%r27, [%r17 + %r0]
hwintr_3_2:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_2), 16, 16)) -> intp(3, 0, d)
	.word 0xf13cc000  ! 34: STDF_R	std	%f24, [%r0, %r19]
	.word 0xfa748000  ! 43: STX_R	stx	%r29, [%r18 + %r0]
	setx	0xa90be1200008a45, %g1, %r10
	.word 0x839a8000  ! 46: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb97c8400  ! 49: MOVR_R	movre	%r18, %r0, %r28
	.word 0xb2ada04c  ! 54: ANDNcc_I	andncc 	%r22, 0x004c, %r25
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
hwintr_3_3:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_3), 16, 16)) -> intp(3, 0, 2b)
	mov	1, %r12
	.word 0x8f930000  ! 63: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x8595e0ec  ! 64: WRPR_TSTATE_I	wrpr	%r23, 0x00ec, %tstate
hwintr_3_4:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_4), 16, 16)) -> intp(3, 0, 19)
hwintr_3_5:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_5), 16, 16)) -> intp(3, 0, 29)
	setx	data_start_5, %g1, %r20
	.word 0xf63c4000  ! 71: STD_R	std	%r27, [%r17 + %r0]
	.word 0xfc3d20fc  ! 72: STD_I	std	%r30, [%r20 + 0x00fc]
	.word 0xfc25a0b5  ! 77: STW_I	stw	%r30, [%r22 + 0x00b5]
	setx	0x138d669f0000188c, %g1, %r10
	.word 0x839a8000  ! 78: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf42c4000  ! 80: STB_R	stb	%r26, [%r17 + %r0]
	.word 0xf63d0000  ! 81: STD_R	std	%r27, [%r20 + %r0]
	.word 0xf024c000  ! 85: STW_R	stw	%r24, [%r19 + %r0]
hwintr_3_6:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_6), 16, 16)) -> intp(3, 0, 1e)
	.word 0xf874615e  ! 93: STX_I	stx	%r28, [%r17 + 0x015e]
	.word 0xf43d0000  ! 102: STD_R	std	%r26, [%r20 + %r0]
	.word 0xf33d21f5  ! 109: STDF_I	std	%f25, [0x01f5, %r20]
	setx	data_start_6, %g1, %r21
	.word 0xf73ca049  ! 111: STDF_I	std	%f27, [0x0049, %r18]
	.word 0xf53c8000  ! 112: STDF_R	std	%f26, [%r0, %r18]
	.word 0xfd3c6096  ! 113: STDF_I	std	%f30, [0x0096, %r17]
	.word 0xf4758000  ! 115: STX_R	stx	%r26, [%r22 + %r0]
	mov	2, %r12
	.word 0xa1930000  ! 117: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x83946064  ! 121: WRPR_TNPC_I	wrpr	%r17, 0x0064, %tnpc
	.word 0xf62dc000  ! 122: STB_R	stb	%r27, [%r23 + %r0]
	.word 0xbc854000  ! 126: ADDcc_R	addcc 	%r21, %r0, %r30
	.word 0xb5508000  ! 127: RDPR_TSTATE	rdpr	%tstate, %r26
	.word 0xbd520000  ! 128: RDPR_PIL	<illegal instruction>
	.word 0xbf643801  ! 129: MOVcc_I	<illegal instruction>
	.word 0xf33d0000  ! 133: STDF_R	std	%f25, [%r0, %r20]
	.word 0xf73c4000  ! 136: STDF_R	std	%f27, [%r0, %r17]
	.word 0xba948000  ! 138: ORcc_R	orcc 	%r18, %r0, %r29
	.word 0xb9504000  ! 142: RDPR_TNPC	<illegal instruction>
	.word 0xff3c8000  ! 145: STDF_R	std	%f31, [%r0, %r18]
	.word 0xfa35e0ff  ! 146: STH_I	sth	%r29, [%r23 + 0x00ff]
	.word 0xb6442086  ! 148: ADDC_I	addc 	%r16, 0x0086, %r27
hwintr_3_7:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_7), 16, 16)) -> intp(3, 0, 22)
	.word 0xf434e145  ! 159: STH_I	sth	%r26, [%r19 + 0x0145]
	.word 0xf074e173  ! 163: STX_I	stx	%r24, [%r19 + 0x0173]
hwintr_3_8:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_8), 16, 16)) -> intp(3, 0, 32)
	.word 0xfe744000  ! 168: STX_R	stx	%r31, [%r17 + %r0]
	setx	data_start_6, %g1, %r21
	.word 0xff3c4000  ! 171: STDF_R	std	%f31, [%r0, %r17]
	setx	0x5607899600007ad2, %g1, %r10
	.word 0x819a8000  ! 172: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xfc3d8000  ! 175: STD_R	std	%r30, [%r22 + %r0]
	.word 0xb4b50000  ! 177: SUBCcc_R	orncc 	%r20, %r0, %r26
hwintr_3_9:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_9), 16, 16)) -> intp(3, 0, 39)
hwintr_3_10:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_10), 16, 16)) -> intp(3, 0, 29)
	.word 0xf93c2087  ! 185: STDF_I	std	%f28, [0x0087, %r16]
hwintr_3_11:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_11), 16, 16)) -> intp(3, 0, 3b)
	.word 0xbf50c000  ! 190: RDPR_TT	rdpr	%tt, %r31
	.word 0xf02da1ae  ! 192: STB_I	stb	%r24, [%r22 + 0x01ae]
	.word 0xb7518000  ! 193: RDPR_PSTATE	<illegal instruction>
	.word 0x8795a1b1  ! 195: WRPR_TT_I	wrpr	%r22, 0x01b1, %tt
hwintr_3_12:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_12), 16, 16)) -> intp(3, 0, 4)
	.word 0xfa7520d4  ! 200: STX_I	stx	%r29, [%r20 + 0x00d4]
	.word 0xb8ac8000  ! 203: ANDNcc_R	andncc 	%r18, %r0, %r28
	.word 0xb7504000  ! 205: RDPR_TNPC	rdpr	%tnpc, %r27
	.word 0xf8350000  ! 206: STH_R	sth	%r28, [%r20 + %r0]
	.word 0xfa2c8000  ! 207: STB_R	stb	%r29, [%r18 + %r0]
	.word 0xbf504000  ! 211: RDPR_TNPC	<illegal instruction>
	.word 0xff3c8000  ! 214: STDF_R	std	%f31, [%r0, %r18]
	setx	data_start_1, %g1, %r16
hwintr_3_13:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_13), 16, 16)) -> intp(3, 0, 9)
	.word 0xb6b50000  ! 218: SUBCcc_R	orncc 	%r20, %r0, %r27
	.word 0xf2750000  ! 221: STX_R	stx	%r25, [%r20 + %r0]
	.word 0x9194605f  ! 226: WRPR_PIL_I	wrpr	%r17, 0x005f, %pil
hwintr_3_14:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_14), 16, 16)) -> intp(3, 0, 6)
	.word 0xf33dc000  ! 230: STDF_R	std	%f25, [%r0, %r23]
	.word 0xf02d4000  ! 233: STB_R	stb	%r24, [%r21 + %r0]
	.word 0xf62d0000  ! 235: STB_R	stb	%r27, [%r20 + %r0]
	.word 0xf22521c5  ! 236: STW_I	stw	%r25, [%r20 + 0x01c5]
	.word 0xb024a166  ! 237: SUB_I	sub 	%r18, 0x0166, %r24
	.word 0xbab5e05d  ! 238: ORNcc_I	orncc 	%r23, 0x005d, %r29
	.word 0xf4348000  ! 243: STH_R	sth	%r26, [%r18 + %r0]
	.word 0xf83cc000  ! 245: STD_R	std	%r28, [%r19 + %r0]
	.word 0xb7480000  ! 246: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xf53c4000  ! 248: STDF_R	std	%f26, [%r0, %r17]
	.word 0xf53cc000  ! 251: STDF_R	std	%f26, [%r0, %r19]
hwintr_3_15:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_15), 16, 16)) -> intp(3, 0, 1b)
	.word 0xb6c5c000  ! 256: ADDCcc_R	addccc 	%r23, %r0, %r27
hwintr_3_16:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_16), 16, 16)) -> intp(3, 0, 28)
	.word 0xfc2560e4  ! 266: STW_I	stw	%r30, [%r21 + 0x00e4]
	.word 0xb53d1000  ! 267: SRAX_R	srax	%r20, %r0, %r26
	.word 0xf43cc000  ! 270: STD_R	std	%r26, [%r19 + %r0]
	.word 0xbc048000  ! 271: ADD_R	add 	%r18, %r0, %r30
	.word 0xfe2cc000  ! 272: STB_R	stb	%r31, [%r19 + %r0]
hwintr_3_17:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_17), 16, 16)) -> intp(3, 0, 11)
	.word 0xf02d2028  ! 274: STB_I	stb	%r24, [%r20 + 0x0028]
	.word 0xf02c8000  ! 277: STB_R	stb	%r24, [%r18 + %r0]
	.word 0xf93d4000  ! 278: STDF_R	std	%f28, [%r0, %r21]
hwintr_3_18:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_18), 16, 16)) -> intp(3, 0, 34)
	.word 0xfa2de05d  ! 290: STB_I	stb	%r29, [%r23 + 0x005d]
	.word 0xf075e11e  ! 291: STX_I	stx	%r24, [%r23 + 0x011e]
	setx	0x17bc062700003e19, %g1, %r10
	.word 0x839a8000  ! 293: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf62cc000  ! 297: STB_R	stb	%r27, [%r19 + %r0]
	.word 0xf675e086  ! 302: STX_I	stx	%r27, [%r23 + 0x0086]
	.word 0xf0244000  ! 303: STW_R	stw	%r24, [%r17 + %r0]
	.word 0xb3480000  ! 304: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf03c214f  ! 309: STD_I	std	%r24, [%r16 + 0x014f]
	.word 0xbe05c000  ! 311: ADD_R	add 	%r23, %r0, %r31
	.word 0xfe2d0000  ! 312: STB_R	stb	%r31, [%r20 + %r0]
	.word 0xfe750000  ! 314: STX_R	stx	%r31, [%r20 + %r0]
	.word 0xfa3c8000  ! 317: STD_R	std	%r29, [%r18 + %r0]
	.word 0xbf540000  ! 319: RDPR_GL	<illegal instruction>
	.word 0x85952093  ! 321: WRPR_TSTATE_I	wrpr	%r20, 0x0093, %tstate
	.word 0xfd3ce119  ! 327: STDF_I	std	%f30, [0x0119, %r19]
hwintr_3_19:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_19), 16, 16)) -> intp(3, 0, 6)
	setx	data_start_0, %g1, %r21
	.word 0xf4354000  ! 336: STH_R	sth	%r26, [%r21 + %r0]
	.word 0xb02cc000  ! 337: ANDN_R	andn 	%r19, %r0, %r24
	.word 0x8d95213d  ! 341: WRPR_PSTATE_I	wrpr	%r20, 0x013d, %pstate
	.word 0xfc2c6046  ! 343: STB_I	stb	%r30, [%r17 + 0x0046]
	.word 0xfa758000  ! 344: STX_R	stx	%r29, [%r22 + %r0]
	.word 0xb9520000  ! 347: RDPR_PIL	rdpr	%pil, %r28
	.word 0x8994a1a1  ! 348: WRPR_TICK_I	wrpr	%r18, 0x01a1, %tick
	.word 0xf0250000  ! 350: STW_R	stw	%r24, [%r20 + %r0]
	.word 0x919421b9  ! 351: WRPR_PIL_I	wrpr	%r16, 0x01b9, %pil
	.word 0xf62d4000  ! 352: STB_R	stb	%r27, [%r21 + %r0]
	.word 0xfb3cc000  ! 355: STDF_R	std	%f29, [%r0, %r19]
hwintr_3_20:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_20), 16, 16)) -> intp(3, 0, 16)
	setx	0xc4ac74a00004a83, %g1, %r10
	.word 0x819a8000  ! 357: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb750c000  ! 362: RDPR_TT	rdpr	%tt, %r27
	setx	data_start_0, %g1, %r22
	.word 0xf73ca102  ! 364: STDF_I	std	%f27, [0x0102, %r18]
hwintr_3_21:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_21), 16, 16)) -> intp(3, 0, a)
	.word 0xf03de133  ! 371: STD_I	std	%r24, [%r23 + 0x0133]
hwintr_3_22:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_22), 16, 16)) -> intp(3, 0, 2a)
	.word 0xfa258000  ! 375: STW_R	stw	%r29, [%r22 + %r0]
	.word 0xbd508000  ! 376: RDPR_TSTATE	<illegal instruction>
	setx	data_start_7, %g1, %r19
hwintr_3_23:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_23), 16, 16)) -> intp(3, 0, 16)
	.word 0xbe3d0000  ! 384: XNOR_R	xnor 	%r20, %r0, %r31
hwintr_3_24:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_24), 16, 16)) -> intp(3, 0, 9)
	.word 0xf63de14e  ! 391: STD_I	std	%r27, [%r23 + 0x014e]
	.word 0xf82c4000  ! 392: STB_R	stb	%r28, [%r17 + %r0]
hwintr_3_25:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_25), 16, 16)) -> intp(3, 0, 35)
hwintr_3_26:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_26), 16, 16)) -> intp(3, 0, 3a)
	.word 0xfa748000  ! 397: STX_R	stx	%r29, [%r18 + %r0]
	.word 0xf23ca068  ! 400: STD_I	std	%r25, [%r18 + 0x0068]
	.word 0xf42ca123  ! 402: STB_I	stb	%r26, [%r18 + 0x0123]
	.word 0xfa2c605f  ! 404: STB_I	stb	%r29, [%r17 + 0x005f]
	.word 0xfc2ce043  ! 406: STB_I	stb	%r30, [%r19 + 0x0043]
	.word 0xf73c4000  ! 409: STDF_R	std	%f27, [%r0, %r17]
	.word 0xf0348000  ! 415: STH_R	sth	%r24, [%r18 + %r0]
hwintr_3_27:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_27), 16, 16)) -> intp(3, 0, 10)
	.word 0xf0254000  ! 418: STW_R	stw	%r24, [%r21 + %r0]
	.word 0xba44219b  ! 421: ADDC_I	addc 	%r16, 0x019b, %r29
	.word 0xfe2dc000  ! 422: STB_R	stb	%r31, [%r23 + %r0]
	.word 0xf435e19e  ! 423: STH_I	sth	%r26, [%r23 + 0x019e]
	mov	0, %r12
	.word 0x8f930000  ! 425: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb751c000  ! 428: RDPR_TL	rdpr	%tl, %r27
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xfd3ca166  ! 432: STDF_I	std	%f30, [0x0166, %r18]
	.word 0xbf480000  ! 433: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0x8994a146  ! 440: WRPR_TICK_I	wrpr	%r18, 0x0146, %tick
	.word 0x819420f7  ! 442: WRPR_TPC_I	wrpr	%r16, 0x00f7, %tpc
	.word 0xb3480000  ! 443: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xbb3c8000  ! 444: SRA_R	sra 	%r18, %r0, %r29
	setx	0xab57a1d900009ad6, %g1, %r10
	.word 0x819a8000  ! 446: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	mov	0, %r12
	.word 0xa1930000  ! 449: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xfa2ce040  ! 450: STB_I	stb	%r29, [%r19 + 0x0040]
	.word 0xf23ce1f2  ! 451: STD_I	std	%r25, [%r19 + 0x01f2]
	.word 0x859520b7  ! 456: WRPR_TSTATE_I	wrpr	%r20, 0x00b7, %tstate
hwintr_3_28:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_28), 16, 16)) -> intp(3, 0, 2b)
	.word 0xf53c8000  ! 462: STDF_R	std	%f26, [%r0, %r18]
	.word 0xfe2cc000  ! 467: STB_R	stb	%r31, [%r19 + %r0]
	.word 0xfc35a002  ! 468: STH_I	sth	%r30, [%r22 + 0x0002]
	.word 0xb350c000  ! 471: RDPR_TT	rdpr	%tt, %r25
	.word 0xfa3dc000  ! 472: STD_R	std	%r29, [%r23 + %r0]
	mov	1, %r12
	.word 0x8f930000  ! 473: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf825601d  ! 476: STW_I	stw	%r28, [%r21 + 0x001d]
	.word 0xfa74619e  ! 477: STX_I	stx	%r29, [%r17 + 0x019e]
	mov	1, %r12
	.word 0x8f930000  ! 478: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf274a195  ! 480: STX_I	stx	%r25, [%r18 + 0x0195]
hwintr_3_29:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_29), 16, 16)) -> intp(3, 0, 3a)
	.word 0x8d95a03c  ! 485: WRPR_PSTATE_I	wrpr	%r22, 0x003c, %pstate
	.word 0xf42dc000  ! 487: STB_R	stb	%r26, [%r23 + %r0]
	.word 0xbd51c000  ! 488: RDPR_TL	rdpr	%tl, %r30
	.word 0xbd480000  ! 490: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0x919420fc  ! 494: WRPR_PIL_I	wrpr	%r16, 0x00fc, %pil
	setx	0xdb5b0f0f00006e87, %g1, %r10
	.word 0x839a8000  ! 495: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf93cc000  ! 496: STDF_R	std	%f28, [%r0, %r19]
	.word 0xf82d211a  ! 497: STB_I	stb	%r28, [%r20 + 0x011a]
	.word 0xb2340000  ! 499: ORN_R	orn 	%r16, %r0, %r25
	.word 0xbe1c61d2  ! 500: XOR_I	xor 	%r17, 0x01d2, %r31
	.word 0xf4742114  ! 502: STX_I	stx	%r26, [%r16 + 0x0114]
	.word 0xbd518000  ! 503: RDPR_PSTATE	rdpr	%pstate, %r30
	.word 0xfe3c4000  ! 504: STD_R	std	%r31, [%r17 + %r0]
	.word 0xbc95214b  ! 509: ORcc_I	orcc 	%r20, 0x014b, %r30
	.word 0xfe3c8000  ! 510: STD_R	std	%r31, [%r18 + %r0]
	.word 0xb951c000  ! 515: RDPR_TL	<illegal instruction>
	.word 0xbaa5612c  ! 516: SUBcc_I	subcc 	%r21, 0x012c, %r29
	.word 0xbf504000  ! 517: RDPR_TNPC	<illegal instruction>
	.word 0x8d9521f0  ! 519: WRPR_PSTATE_I	wrpr	%r20, 0x01f0, %pstate
	.word 0xfc25c000  ! 520: STW_R	stw	%r30, [%r23 + %r0]
	.word 0xfe3de00c  ! 522: STD_I	std	%r31, [%r23 + 0x000c]
hwintr_3_30:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_30), 16, 16)) -> intp(3, 0, 1)
	.word 0xf825c000  ! 528: STW_R	stw	%r28, [%r23 + %r0]
	.word 0xff3c60d2  ! 530: STDF_I	std	%f31, [0x00d2, %r17]
	.word 0x8395e112  ! 531: WRPR_TNPC_I	wrpr	%r23, 0x0112, %tnpc
	.word 0xbaac4000  ! 532: ANDNcc_R	andncc 	%r17, %r0, %r29
hwintr_3_31:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_31), 16, 16)) -> intp(3, 0, 2b)
	setx	data_start_3, %g1, %r21
	.word 0xf27560ea  ! 543: STX_I	stx	%r25, [%r21 + 0x00ea]
	.word 0xf8740000  ! 544: STX_R	stx	%r28, [%r16 + %r0]
	setx	data_start_4, %g1, %r16
	setx	0x5901efb60000bc1e, %g1, %r10
	.word 0x819a8000  ! 552: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x8995a199  ! 558: WRPR_TICK_I	wrpr	%r22, 0x0199, %tick
	setx	data_start_3, %g1, %r19
	.word 0xbc442189  ! 562: ADDC_I	addc 	%r16, 0x0189, %r30
	.word 0xf4758000  ! 563: STX_R	stx	%r26, [%r22 + %r0]
	.word 0xf02c6061  ! 564: STB_I	stb	%r24, [%r17 + 0x0061]
	.word 0xb5510000  ! 567: RDPR_TICK	rdpr	%tick, %r26
	setx	data_start_5, %g1, %r18
	.word 0xf82ca0dd  ! 570: STB_I	stb	%r28, [%r18 + 0x00dd]
hwintr_3_32:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_32), 16, 16)) -> intp(3, 0, 36)
	.word 0xbd35d000  ! 576: SRLX_R	srlx	%r23, %r0, %r30
	.word 0xf8256129  ! 577: STW_I	stw	%r28, [%r21 + 0x0129]
hwintr_3_33:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_33), 16, 16)) -> intp(3, 0, 10)
	.word 0xf4250000  ! 580: STW_R	stw	%r26, [%r20 + %r0]
	.word 0xfa354000  ! 581: STH_R	sth	%r29, [%r21 + %r0]
	setx	data_start_6, %g1, %r19
	.word 0xf62cc000  ! 585: STB_R	stb	%r27, [%r19 + %r0]
	.word 0xf8250000  ! 586: STW_R	stw	%r28, [%r20 + %r0]
	.word 0xf674e0b1  ! 587: STX_I	stx	%r27, [%r19 + 0x00b1]
hwintr_3_34:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_34), 16, 16)) -> intp(3, 0, 3)
	.word 0xf42c0000  ! 591: STB_R	stb	%r26, [%r16 + %r0]
	.word 0xb7480000  ! 593: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xbe3de0d1  ! 597: XNOR_I	xnor 	%r23, 0x00d1, %r31
	.word 0x8395a1b0  ! 600: WRPR_TNPC_I	wrpr	%r22, 0x01b0, %tnpc
	.word 0xb6a5200d  ! 603: SUBcc_I	subcc 	%r20, 0x000d, %r27
	.word 0xf035a008  ! 608: STH_I	sth	%r24, [%r22 + 0x0008]
	.word 0xf224c000  ! 609: STW_R	stw	%r25, [%r19 + %r0]
	.word 0xfa758000  ! 614: STX_R	stx	%r29, [%r22 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
hwintr_3_35:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_35), 16, 16)) -> intp(3, 0, 30)
	.word 0xfc2d8000  ! 617: STB_R	stb	%r30, [%r22 + %r0]
	.word 0xf425c000  ! 620: STW_R	stw	%r26, [%r23 + %r0]
hwintr_3_36:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_36), 16, 16)) -> intp(3, 0, 24)
	.word 0xfa2de144  ! 626: STB_I	stb	%r29, [%r23 + 0x0144]
	.word 0xfe35a122  ! 627: STH_I	sth	%r31, [%r22 + 0x0122]
	.word 0xf33da1fc  ! 628: STDF_I	std	%f25, [0x01fc, %r22]
	.word 0xb93c9000  ! 629: SRAX_R	srax	%r18, %r0, %r28
	.word 0xb1504000  ! 635: RDPR_TNPC	rdpr	%tnpc, %r24
	.word 0xf22dc000  ! 636: STB_R	stb	%r25, [%r23 + %r0]
	.word 0xf83de190  ! 642: STD_I	std	%r28, [%r23 + 0x0190]
	.word 0xfa25e067  ! 648: STW_I	stw	%r29, [%r23 + 0x0067]
	setx	0x9c315c4d0000afd9, %g1, %r10
	.word 0x839a8000  ! 654: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xfe3c2117  ! 656: STD_I	std	%r31, [%r16 + 0x0117]
	.word 0xb61c0000  ! 657: XOR_R	xor 	%r16, %r0, %r27
	.word 0xf62c8000  ! 660: STB_R	stb	%r27, [%r18 + %r0]
	.word 0x87956052  ! 662: WRPR_TT_I	wrpr	%r21, 0x0052, %tt
	.word 0xb2b5a16c  ! 663: ORNcc_I	orncc 	%r22, 0x016c, %r25
	.word 0xf224c000  ! 669: STW_R	stw	%r25, [%r19 + %r0]
	.word 0xfc75e035  ! 671: STX_I	stx	%r30, [%r23 + 0x0035]
hwintr_3_37:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_37), 16, 16)) -> intp(3, 0, 2b)
	setx	0xaa30671e00000a4d, %g1, %r10
	.word 0x839a8000  ! 673: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	mov	0, %r12
	.word 0x8f930000  ! 676: WRPR_TL_R	wrpr	%r12, %r0, %tl
	mov	2, %r12
	.word 0x8f930000  ! 677: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf53ce1c9  ! 678: STDF_I	std	%f26, [0x01c9, %r19]
	.word 0xf83da01d  ! 680: STD_I	std	%r28, [%r22 + 0x001d]
	setx	data_start_3, %g1, %r16
	.word 0xf8240000  ! 685: STW_R	stw	%r28, [%r16 + %r0]
	.word 0xf0240000  ! 687: STW_R	stw	%r24, [%r16 + %r0]
	.word 0xb63c8000  ! 689: XNOR_R	xnor 	%r18, %r0, %r27
hwintr_3_38:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_38), 16, 16)) -> intp(3, 0, 4)
	setx	0xb0f09df300008b55, %g1, %r10
	.word 0x819a8000  ! 691: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	setx	data_start_0, %g1, %r16
	.word 0x9195a0c0  ! 699: WRPR_PIL_I	wrpr	%r22, 0x00c0, %pil
	.word 0xb3508000  ! 701: RDPR_TSTATE	rdpr	%tstate, %r25
	.word 0xbf504000  ! 704: RDPR_TNPC	<illegal instruction>
	.word 0xbe35e1d5  ! 705: ORN_I	orn 	%r23, 0x01d5, %r31
	.word 0xf8748000  ! 706: STX_R	stx	%r28, [%r18 + %r0]
	setx	0xf45b3c7f0000dc4b, %g1, %r10
	.word 0x839a8000  ! 707: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb551c000  ! 709: RDPR_TL	rdpr	%tl, %r26
	.word 0xfe2c4000  ! 711: STB_R	stb	%r31, [%r17 + %r0]
	.word 0xf82d2006  ! 712: STB_I	stb	%r28, [%r20 + 0x0006]
	.word 0x87952036  ! 713: WRPR_TT_I	wrpr	%r20, 0x0036, %tt
	.word 0xf835604c  ! 716: STH_I	sth	%r28, [%r21 + 0x004c]
	.word 0x8795a1e5  ! 717: WRPR_TT_I	wrpr	%r22, 0x01e5, %tt
	setx	0xd6be403f0000ca93, %g1, %r10
	.word 0x819a8000  ! 718: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf83460db  ! 720: STH_I	sth	%r28, [%r17 + 0x00db]
	.word 0xfe35605e  ! 723: STH_I	sth	%r31, [%r21 + 0x005e]
	.word 0xfa2dc000  ! 727: STB_R	stb	%r29, [%r23 + %r0]
	.word 0xf43d602b  ! 728: STD_I	std	%r26, [%r21 + 0x002b]
	.word 0xff3d8000  ! 729: STDF_R	std	%f31, [%r0, %r22]
	.word 0x8194e12f  ! 733: WRPR_TPC_I	wrpr	%r19, 0x012f, %tpc
hwintr_3_39:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_39), 16, 16)) -> intp(3, 0, 28)
hwintr_3_40:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_40), 16, 16)) -> intp(3, 0, 0)
	.word 0xf8358000  ! 742: STH_R	sth	%r28, [%r22 + %r0]
	.word 0xf13cc000  ! 743: STDF_R	std	%f24, [%r0, %r19]
	.word 0x8194212c  ! 745: WRPR_TPC_I	wrpr	%r16, 0x012c, %tpc
	setx	data_start_6, %g1, %r16
	.word 0xbb354000  ! 748: SRL_R	srl 	%r21, %r0, %r29
	.word 0xfa3d8000  ! 750: STD_R	std	%r29, [%r22 + %r0]
	setx	data_start_2, %g1, %r18
	.word 0xf22c607a  ! 754: STB_I	stb	%r25, [%r17 + 0x007a]
	.word 0xfa740000  ! 761: STX_R	stx	%r29, [%r16 + %r0]
	setx	data_start_7, %g1, %r22
	.word 0xf13d0000  ! 764: STDF_R	std	%f24, [%r0, %r20]
	.word 0xfc2d0000  ! 768: STB_R	stb	%r30, [%r20 + %r0]
hwintr_3_41:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_41), 16, 16)) -> intp(3, 0, 2)
	mov	0, %r12
	.word 0xa1930000  ! 774: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf4358000  ! 778: STH_R	sth	%r26, [%r22 + %r0]
	.word 0xf02c6136  ! 779: STB_I	stb	%r24, [%r17 + 0x0136]
hwintr_3_42:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_42), 16, 16)) -> intp(3, 0, 20)
	.word 0x8595e196  ! 781: WRPR_TSTATE_I	wrpr	%r23, 0x0196, %tstate
hwintr_3_43:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_43), 16, 16)) -> intp(3, 0, 3f)
	.word 0xfc24c000  ! 787: STW_R	stw	%r30, [%r19 + %r0]
	.word 0xf2352002  ! 792: STH_I	sth	%r25, [%r20 + 0x0002]
	.word 0xf63c0000  ! 793: STD_R	std	%r27, [%r16 + %r0]
	.word 0x83952187  ! 798: WRPR_TNPC_I	wrpr	%r20, 0x0187, %tnpc
	.word 0xfa7461c0  ! 800: STX_I	stx	%r29, [%r17 + 0x01c0]
	.word 0xf22d201a  ! 802: STB_I	stb	%r25, [%r20 + 0x001a]
	.word 0xf075e14e  ! 803: STX_I	stx	%r24, [%r23 + 0x014e]
	.word 0xfe2dc000  ! 806: STB_R	stb	%r31, [%r23 + %r0]
	.word 0xb5540000  ! 807: RDPR_GL	rdpr	%-, %r26
	.word 0xf434c000  ! 809: STH_R	sth	%r26, [%r19 + %r0]
	.word 0xf82d0000  ! 811: STB_R	stb	%r28, [%r20 + %r0]
	.word 0xf22d61a8  ! 822: STB_I	stb	%r25, [%r21 + 0x01a8]
	.word 0xf02de14f  ! 827: STB_I	stb	%r24, [%r23 + 0x014f]
	.word 0x8395e10c  ! 828: WRPR_TNPC_I	wrpr	%r23, 0x010c, %tnpc
	.word 0xf2344000  ! 831: STH_R	sth	%r25, [%r17 + %r0]
	.word 0xf274c000  ! 833: STX_R	stx	%r25, [%r19 + %r0]
	setx	data_start_3, %g1, %r16
	.word 0xfe34a19f  ! 835: STH_I	sth	%r31, [%r18 + 0x019f]
hwintr_3_44:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_44), 16, 16)) -> intp(3, 0, 25)
	.word 0xf835e005  ! 845: STH_I	sth	%r28, [%r23 + 0x0005]
	mov	0, %r12
	.word 0xa1930000  ! 847: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xfb3de0fd  ! 849: STDF_I	std	%f29, [0x00fd, %r23]
	.word 0xfa3c8000  ! 850: STD_R	std	%r29, [%r18 + %r0]
	mov	0, %r12
	.word 0x8f930000  ! 851: WRPR_TL_R	wrpr	%r12, %r0, %tl
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbf520000  ! 855: RDPR_PIL	rdpr	%pil, %r31
	.word 0xb5510000  ! 862: RDPR_TICK	<illegal instruction>
hwintr_3_45:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_45), 16, 16)) -> intp(3, 0, 8)
	.word 0xfe3ca002  ! 864: STD_I	std	%r31, [%r18 + 0x0002]
	.word 0xfe35610c  ! 866: STH_I	sth	%r31, [%r21 + 0x010c]
	.word 0xfe248000  ! 867: STW_R	stw	%r31, [%r18 + %r0]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xfc348000  ! 871: STH_R	sth	%r30, [%r18 + %r0]
	.word 0x8395e1eb  ! 873: WRPR_TNPC_I	wrpr	%r23, 0x01eb, %tnpc
	.word 0xf93c2110  ! 874: STDF_I	std	%f28, [0x0110, %r16]
	.word 0x85952185  ! 877: WRPR_TSTATE_I	wrpr	%r20, 0x0185, %tstate
	.word 0xfe35e157  ! 880: STH_I	sth	%r31, [%r23 + 0x0157]
	.word 0xb0348000  ! 882: SUBC_R	orn 	%r18, %r0, %r24
	.word 0xbc2ca1e6  ! 886: ANDN_I	andn 	%r18, 0x01e6, %r30
	mov	0, %r12
	.word 0x8f930000  ! 887: WRPR_TL_R	wrpr	%r12, %r0, %tl
	setx	0x4e7044ab00003f9a, %g1, %r10
	.word 0x819a8000  ! 888: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xfe3da09c  ! 892: STD_I	std	%r31, [%r22 + 0x009c]
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf93d6068  ! 896: STDF_I	std	%f28, [0x0068, %r21]
	.word 0x8794e186  ! 899: WRPR_TT_I	wrpr	%r19, 0x0186, %tt
	.word 0xf33c4000  ! 900: STDF_R	std	%f25, [%r0, %r17]
hwintr_3_46:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_46), 16, 16)) -> intp(3, 0, 2b)
	.word 0xbd510000  ! 904: RDPR_TICK	rdpr	%tick, %r30
	.word 0xf225c000  ! 906: STW_R	stw	%r25, [%r23 + %r0]
	.word 0xfb3cc000  ! 907: STDF_R	std	%f29, [%r0, %r19]
	.word 0xb551c000  ! 909: RDPR_TL	<illegal instruction>
	.word 0xf93cc000  ! 911: STDF_R	std	%f28, [%r0, %r19]
	.word 0xfc350000  ! 912: STH_R	sth	%r30, [%r20 + %r0]
	.word 0xf8246088  ! 913: STW_I	stw	%r28, [%r17 + 0x0088]
	.word 0xfc248000  ! 918: STW_R	stw	%r30, [%r18 + %r0]
	.word 0xf2350000  ! 919: STH_R	sth	%r25, [%r20 + %r0]
	.word 0xb4140000  ! 921: OR_R	or 	%r16, %r0, %r26
	.word 0xf93d4000  ! 924: STDF_R	std	%f28, [%r0, %r21]
	.word 0xf73c2022  ! 926: STDF_I	std	%f27, [0x0022, %r16]
	.word 0xf8756051  ! 928: STX_I	stx	%r28, [%r21 + 0x0051]
hwintr_3_47:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_47), 16, 16)) -> intp(3, 0, 14)
	.word 0x8994a17e  ! 934: WRPR_TICK_I	wrpr	%r18, 0x017e, %tick
	.word 0xfa244000  ! 937: STW_R	stw	%r29, [%r17 + %r0]
	.word 0xf27520fd  ! 940: STX_I	stx	%r25, [%r20 + 0x00fd]
	.word 0xf03ca0cc  ! 943: STD_I	std	%r24, [%r18 + 0x00cc]
	.word 0xfe2ca012  ! 946: STB_I	stb	%r31, [%r18 + 0x0012]
	.word 0xf6754000  ! 950: STX_R	stx	%r27, [%r21 + %r0]
	.word 0xb5480000  ! 953: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	setx	0x4e7b0f8a0000dc46, %g1, %r10
	.word 0x819a8000  ! 956: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf8254000  ! 960: STW_R	stw	%r28, [%r21 + %r0]
hwintr_3_48:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_48), 16, 16)) -> intp(3, 0, 2c)
	setx	0x25da5c1d000098ce, %g1, %r10
	.word 0x839a8000  ! 963: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xf53dc000  ! 964: STDF_R	std	%f26, [%r0, %r23]
	.word 0xb5480000  ! 966: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	setx	0xacdd2bf00000cd7, %g1, %r10
	.word 0x819a8000  ! 972: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xfe2520e2  ! 973: STW_I	stw	%r31, [%r20 + 0x00e2]
	.word 0xf43c20dd  ! 974: STD_I	std	%r26, [%r16 + 0x00dd]
	.word 0xf4758000  ! 980: STX_R	stx	%r26, [%r22 + %r0]
	.word 0xff3c8000  ! 981: STDF_R	std	%f31, [%r0, %r18]
hwintr_3_49:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_49), 16, 16)) -> intp(3, 0, 38)
hwintr_3_50:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_50), 16, 16)) -> intp(3, 0, 3e)
	.word 0xb045a0ba  ! 985: ADDC_I	addc 	%r22, 0x00ba, %r24
	setx	data_start_3, %g1, %r17
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf62da093  ! 995: STB_I	stb	%r27, [%r22 + 0x0093]
	setx	data_start_4, %g1, %r19
hwintr_3_51:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_51), 16, 16)) -> intp(3, 0, 3)
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
	.word 0xfe0420aa  ! 1: LDUW_I	lduw	[%r16 + 0x00aa], %r31
	.word 0xf85d4000  ! 3: LDX_R	ldx	[%r21 + %r0], %r28
	.word 0xfa050000  ! 5: LDUW_R	lduw	[%r20 + %r0], %r29
hwintr_2_0:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_0), 16, 16)) -> intp(2, 0, 2e)
	.word 0x9195e187  ! 12: WRPR_PIL_I	wrpr	%r23, 0x0187, %pil
hwintr_2_1:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_1), 16, 16)) -> intp(2, 0, 24)
	.word 0xb9641800  ! 17: MOVcc_R	<illegal instruction>
	.word 0xf2540000  ! 18: LDSH_R	ldsh	[%r16 + %r0], %r25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0x8795a1f8  ! 21: WRPR_TT_I	wrpr	%r22, 0x01f8, %tt
	.word 0xb00460f0  ! 27: ADD_I	add 	%r17, 0x00f0, %r24
	setx	0x4d2cb49d0000fbd6, %g1, %r10
	.word 0x839a8000  ! 29: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x8d95e02b  ! 30: WRPR_PSTATE_I	wrpr	%r23, 0x002b, %pstate
hwintr_2_2:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_2), 16, 16)) -> intp(2, 0, 1b)
	.word 0xfa5c0000  ! 35: LDX_R	ldx	[%r16 + %r0], %r29
	.word 0xf454203e  ! 37: LDSH_I	ldsh	[%r16 + 0x003e], %r26
	.word 0xf6152059  ! 38: LDUH_I	lduh	[%r20 + 0x0059], %r27
	.word 0xfe5d2091  ! 39: LDX_I	ldx	[%r20 + 0x0091], %r31
	setx	0xf8c6d20a0000cb5c, %g1, %r10
	.word 0x839a8000  ! 46: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xfc1d0000  ! 47: LDD_R	ldd	[%r20 + %r0], %r30
	.word 0xfe054000  ! 48: LDUW_R	lduw	[%r21 + %r0], %r31
	.word 0xb37c4400  ! 49: MOVR_R	movre	%r17, %r0, %r25
	.word 0xb4ac61d7  ! 54: ANDNcc_I	andncc 	%r17, 0x01d7, %r26
	.word 0xf44ca069  ! 57: LDSB_I	ldsb	[%r18 + 0x0069], %r26
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
hwintr_2_3:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_3), 16, 16)) -> intp(2, 0, d)
	mov	2, %r12
	.word 0x8f930000  ! 63: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x8594e157  ! 64: WRPR_TSTATE_I	wrpr	%r19, 0x0157, %tstate
	.word 0xf51c8000  ! 65: LDDF_R	ldd	[%r18, %r0], %f26
hwintr_2_4:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_4), 16, 16)) -> intp(2, 0, 29)
hwintr_2_5:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_5), 16, 16)) -> intp(2, 0, 23)
	setx	data_start_7, %g1, %r22
	.word 0xfc0d4000  ! 73: LDUB_R	ldub	[%r21 + %r0], %r30
	.word 0xf31d6195  ! 74: LDDF_I	ldd	[%r21, 0x0195], %f25
	.word 0xf65d4000  ! 76: LDX_R	ldx	[%r21 + %r0], %r27
	setx	0xbbc970420000ea10, %g1, %r10
	.word 0x839a8000  ! 78: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xfa4d4000  ! 82: LDSB_R	ldsb	[%r21 + %r0], %r29
	.word 0xf605a095  ! 83: LDUW_I	lduw	[%r22 + 0x0095], %r27
	.word 0xf41c61d2  ! 86: LDD_I	ldd	[%r17 + 0x01d2], %r26
hwintr_2_6:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_6), 16, 16)) -> intp(2, 0, 5)
	.word 0xf8558000  ! 89: LDSH_R	ldsh	[%r22 + %r0], %r28
	.word 0xfc5dc000  ! 91: LDX_R	ldx	[%r23 + %r0], %r30
	.word 0xfa5d6100  ! 95: LDX_I	ldx	[%r21 + 0x0100], %r29
	.word 0xf404c000  ! 100: LDUW_R	lduw	[%r19 + %r0], %r26
	.word 0xf854a0ce  ! 101: LDSH_I	ldsh	[%r18 + 0x00ce], %r28
	.word 0xfa454000  ! 103: LDSW_R	ldsw	[%r21 + %r0], %r29
	.word 0xf0048000  ! 104: LDUW_R	lduw	[%r18 + %r0], %r24
	.word 0xf24d0000  ! 107: LDSB_R	ldsb	[%r20 + %r0], %r25
	setx	data_start_4, %g1, %r23
	.word 0xf91d21a1  ! 114: LDDF_I	ldd	[%r20, 0x01a1], %f28
	.word 0xf24d60c9  ! 116: LDSB_I	ldsb	[%r21 + 0x00c9], %r25
	mov	1, %r12
	.word 0xa1930000  ! 117: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf61ce048  ! 120: LDD_I	ldd	[%r19 + 0x0048], %r27
	.word 0x8394a11f  ! 121: WRPR_TNPC_I	wrpr	%r18, 0x011f, %tnpc
	.word 0xfc142080  ! 124: LDUH_I	lduh	[%r16 + 0x0080], %r30
	.word 0xf0158000  ! 125: LDUH_R	lduh	[%r22 + %r0], %r24
	.word 0xb4848000  ! 126: ADDcc_R	addcc 	%r18, %r0, %r26
	.word 0xbb508000  ! 127: RDPR_TSTATE	<illegal instruction>
	.word 0xbf520000  ! 128: RDPR_PIL	<illegal instruction>
	.word 0xb1643801  ! 129: MOVcc_I	<illegal instruction>
	.word 0xfa5c610f  ! 130: LDX_I	ldx	[%r17 + 0x010f], %r29
	.word 0xf805c000  ! 131: LDUW_R	lduw	[%r23 + %r0], %r28
	.word 0xf4452126  ! 135: LDSW_I	ldsw	[%r20 + 0x0126], %r26
	.word 0xf81d4000  ! 137: LDD_R	ldd	[%r21 + %r0], %r28
	.word 0xb0944000  ! 138: ORcc_R	orcc 	%r17, %r0, %r24
	.word 0xff1c6022  ! 141: LDDF_I	ldd	[%r17, 0x0022], %f31
	.word 0xb1504000  ! 142: RDPR_TNPC	<illegal instruction>
	.word 0xf814e111  ! 143: LDUH_I	lduh	[%r19 + 0x0111], %r28
	.word 0xb84421e4  ! 148: ADDC_I	addc 	%r16, 0x01e4, %r28
	.word 0xf05c4000  ! 149: LDX_R	ldx	[%r17 + %r0], %r24
hwintr_2_7:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_7), 16, 16)) -> intp(2, 0, 26)
	.word 0xf21cc000  ! 157: LDD_R	ldd	[%r19 + %r0], %r25
	.word 0xfa550000  ! 158: LDSH_R	ldsh	[%r20 + %r0], %r29
	.word 0xf84d8000  ! 164: LDSB_R	ldsb	[%r22 + %r0], %r28
hwintr_2_8:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_8), 16, 16)) -> intp(2, 0, 24)
	.word 0xf25c4000  ! 167: LDX_R	ldx	[%r17 + %r0], %r25
	setx	data_start_5, %g1, %r20
	setx	0xe437ca630000880b, %g1, %r10
	.word 0x819a8000  ! 172: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf605c000  ! 173: LDUW_R	lduw	[%r23 + %r0], %r27
	.word 0xb8b58000  ! 177: SUBCcc_R	orncc 	%r22, %r0, %r28
hwintr_2_9:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_9), 16, 16)) -> intp(2, 0, 1c)
hwintr_2_10:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_10), 16, 16)) -> intp(2, 0, 3c)
	.word 0xfc440000  ! 182: LDSW_R	ldsw	[%r16 + %r0], %r30
	.word 0xf45d0000  ! 184: LDX_R	ldx	[%r20 + %r0], %r26
hwintr_2_11:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_11), 16, 16)) -> intp(2, 0, 3e)
	.word 0xb950c000  ! 190: RDPR_TT	rdpr	%tt, %r28
	.word 0xbf518000  ! 193: RDPR_PSTATE	<illegal instruction>
	.word 0x8794e1ac  ! 195: WRPR_TT_I	wrpr	%r19, 0x01ac, %tt
hwintr_2_12:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_12), 16, 16)) -> intp(2, 0, 1d)
	.word 0xb6ac0000  ! 203: ANDNcc_R	andncc 	%r16, %r0, %r27
	.word 0xbb504000  ! 205: RDPR_TNPC	<illegal instruction>
	.word 0xf05ce005  ! 208: LDX_I	ldx	[%r19 + 0x0005], %r24
	.word 0xfa5d2124  ! 210: LDX_I	ldx	[%r20 + 0x0124], %r29
	.word 0xb9504000  ! 211: RDPR_TNPC	<illegal instruction>
	.word 0xf81c4000  ! 212: LDD_R	ldd	[%r17 + %r0], %r28
	setx	data_start_5, %g1, %r20
hwintr_2_13:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_13), 16, 16)) -> intp(2, 0, 2f)
	.word 0xf80c0000  ! 217: LDUB_R	ldub	[%r16 + %r0], %r28
	.word 0xbcb44000  ! 218: SUBCcc_R	orncc 	%r17, %r0, %r30
	.word 0xf05d203a  ! 219: LDX_I	ldx	[%r20 + 0x003a], %r24
	.word 0xf65420b3  ! 225: LDSH_I	ldsh	[%r16 + 0x00b3], %r27
	.word 0x9195e039  ! 226: WRPR_PIL_I	wrpr	%r23, 0x0039, %pil
	.word 0xf41ce1dc  ! 227: LDD_I	ldd	[%r19 + 0x01dc], %r26
hwintr_2_14:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_14), 16, 16)) -> intp(2, 0, c)
	.word 0xf44d0000  ! 231: LDSB_R	ldsb	[%r20 + %r0], %r26
	.word 0xb0252173  ! 237: SUB_I	sub 	%r20, 0x0173, %r24
	.word 0xbab520af  ! 238: ORNcc_I	orncc 	%r20, 0x00af, %r29
	.word 0xfa1c0000  ! 239: LDD_R	ldd	[%r16 + %r0], %r29
	.word 0xff1c2050  ! 240: LDDF_I	ldd	[%r16, 0x0050], %f31
	.word 0xf41d0000  ! 241: LDD_R	ldd	[%r20 + %r0], %r26
	.word 0xf6150000  ! 242: LDUH_R	lduh	[%r20 + %r0], %r27
	.word 0xb5480000  ! 246: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xfc1dc000  ! 249: LDD_R	ldd	[%r23 + %r0], %r30
	.word 0xf25c4000  ! 250: LDX_R	ldx	[%r17 + %r0], %r25
	.word 0xf65c0000  ! 252: LDX_R	ldx	[%r16 + %r0], %r27
	.word 0xf91c210f  ! 253: LDDF_I	ldd	[%r16, 0x010f], %f28
hwintr_2_15:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_15), 16, 16)) -> intp(2, 0, 14)
	.word 0xb8c5c000  ! 256: ADDCcc_R	addccc 	%r23, %r0, %r28
hwintr_2_16:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_16), 16, 16)) -> intp(2, 0, d)
	.word 0xfc15e1cd  ! 258: LDUH_I	lduh	[%r23 + 0x01cd], %r30
	.word 0xf4454000  ! 259: LDSW_R	ldsw	[%r21 + %r0], %r26
	.word 0xf91d618d  ! 261: LDDF_I	ldd	[%r21, 0x018d], %f28
	.word 0xb13c5000  ! 267: SRAX_R	srax	%r17, %r0, %r24
	.word 0xfc5da1d8  ! 268: LDX_I	ldx	[%r22 + 0x01d8], %r30
	.word 0xb805c000  ! 271: ADD_R	add 	%r23, %r0, %r28
hwintr_2_17:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_17), 16, 16)) -> intp(2, 0, 13)
	.word 0xf2544000  ! 276: LDSH_R	ldsh	[%r17 + %r0], %r25
	.word 0xfe048000  ! 280: LDUW_R	lduw	[%r18 + %r0], %r31
	.word 0xf31d4000  ! 283: LDDF_R	ldd	[%r21, %r0], %f25
hwintr_2_18:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_18), 16, 16)) -> intp(2, 0, 24)
	.word 0xf31de18f  ! 287: LDDF_I	ldd	[%r23, 0x018f], %f25
	.word 0xf44c6080  ! 292: LDSB_I	ldsb	[%r17 + 0x0080], %r26
	setx	0x6ac9078200009fc5, %g1, %r10
	.word 0x839a8000  ! 293: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xfe4ce138  ! 298: LDSB_I	ldsb	[%r19 + 0x0138], %r31
	.word 0xf644615f  ! 300: LDSW_I	ldsw	[%r17 + 0x015f], %r27
	.word 0xf804e120  ! 301: LDUW_I	lduw	[%r19 + 0x0120], %r28
	.word 0xbd480000  ! 304: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf60d61c0  ! 308: LDUB_I	ldub	[%r21 + 0x01c0], %r27
	.word 0xb0044000  ! 311: ADD_R	add 	%r17, %r0, %r24
	.word 0xf2444000  ! 316: LDSW_R	ldsw	[%r17 + %r0], %r25
	.word 0xbb540000  ! 319: RDPR_GL	<illegal instruction>
	.word 0x8594e040  ! 321: WRPR_TSTATE_I	wrpr	%r19, 0x0040, %tstate
	.word 0xf80c8000  ! 322: LDUB_R	ldub	[%r18 + %r0], %r28
hwintr_2_19:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_19), 16, 16)) -> intp(2, 0, 3)
	.word 0xfa4d217c  ! 332: LDSB_I	ldsb	[%r20 + 0x017c], %r29
	.word 0xf31ce00d  ! 334: LDDF_I	ldd	[%r19, 0x000d], %f25
	setx	data_start_6, %g1, %r19
	.word 0xbc2c0000  ! 337: ANDN_R	andn 	%r16, %r0, %r30
	.word 0xf645c000  ! 338: LDSW_R	ldsw	[%r23 + %r0], %r27
	.word 0xf4058000  ! 340: LDUW_R	lduw	[%r22 + %r0], %r26
	.word 0x8d94616f  ! 341: WRPR_PSTATE_I	wrpr	%r17, 0x016f, %pstate
	.word 0xb7520000  ! 347: RDPR_PIL	<illegal instruction>
	.word 0x8995618a  ! 348: WRPR_TICK_I	wrpr	%r21, 0x018a, %tick
	.word 0x91942123  ! 351: WRPR_PIL_I	wrpr	%r16, 0x0123, %pil
	.word 0xf4450000  ! 353: LDSW_R	ldsw	[%r20 + %r0], %r26
hwintr_2_20:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_20), 16, 16)) -> intp(2, 0, 13)
	setx	0xeef7336b00003804, %g1, %r10
	.word 0x819a8000  ! 357: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xfe0d617b  ! 358: LDUB_I	ldub	[%r21 + 0x017b], %r31
	.word 0xbf50c000  ! 362: RDPR_TT	<illegal instruction>
	setx	data_start_7, %g1, %r23
	.word 0xf644c000  ! 365: LDSW_R	ldsw	[%r19 + %r0], %r27
hwintr_2_21:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_21), 16, 16)) -> intp(2, 0, 29)
	.word 0xf844c000  ! 369: LDSW_R	ldsw	[%r19 + %r0], %r28
hwintr_2_22:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_22), 16, 16)) -> intp(2, 0, b)
	.word 0xf91dc000  ! 373: LDDF_R	ldd	[%r23, %r0], %f28
	.word 0xb5508000  ! 376: RDPR_TSTATE	<illegal instruction>
	setx	data_start_7, %g1, %r18
	.word 0xf405a19d  ! 378: LDUW_I	lduw	[%r22 + 0x019d], %r26
	.word 0xf65d4000  ! 379: LDX_R	ldx	[%r21 + %r0], %r27
	.word 0xf6550000  ! 380: LDSH_R	ldsh	[%r20 + %r0], %r27
hwintr_2_23:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_23), 16, 16)) -> intp(2, 0, 15)
	.word 0xb43d4000  ! 384: XNOR_R	xnor 	%r21, %r0, %r26
hwintr_2_24:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_24), 16, 16)) -> intp(2, 0, 3)
	.word 0xf815a053  ! 388: LDUH_I	lduh	[%r22 + 0x0053], %r28
	.word 0xfc0d4000  ! 390: LDUB_R	ldub	[%r21 + %r0], %r30
hwintr_2_25:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_25), 16, 16)) -> intp(2, 0, 2b)
hwintr_2_26:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_26), 16, 16)) -> intp(2, 0, e)
	.word 0xfc1ca157  ! 410: LDD_I	ldd	[%r18 + 0x0157], %r30
	.word 0xf0150000  ! 412: LDUH_R	lduh	[%r20 + %r0], %r24
hwintr_2_27:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_27), 16, 16)) -> intp(2, 0, 19)
	.word 0xb445e15f  ! 421: ADDC_I	addc 	%r23, 0x015f, %r26
	.word 0xf85c8000  ! 424: LDX_R	ldx	[%r18 + %r0], %r28
	mov	1, %r12
	.word 0x8f930000  ! 425: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbb51c000  ! 428: RDPR_TL	<illegal instruction>
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xfa450000  ! 431: LDSW_R	ldsw	[%r20 + %r0], %r29
	.word 0xb5480000  ! 433: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xfe54c000  ! 438: LDSH_R	ldsh	[%r19 + %r0], %r31
	.word 0x8994206b  ! 440: WRPR_TICK_I	wrpr	%r16, 0x006b, %tick
	.word 0x8194600a  ! 442: WRPR_TPC_I	wrpr	%r17, 0x000a, %tpc
	.word 0xbf480000  ! 443: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xb13c8000  ! 444: SRA_R	sra 	%r18, %r0, %r24
	setx	0x8a6bb4350000f90a, %g1, %r10
	.word 0x819a8000  ! 446: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf454c000  ! 447: LDSH_R	ldsh	[%r19 + %r0], %r26
	.word 0xf71d4000  ! 448: LDDF_R	ldd	[%r21, %r0], %f27
	mov	0, %r12
	.word 0xa1930000  ! 449: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xf014c000  ! 452: LDUH_R	lduh	[%r19 + %r0], %r24
	.word 0xf8050000  ! 455: LDUW_R	lduw	[%r20 + %r0], %r28
	.word 0x85952118  ! 456: WRPR_TSTATE_I	wrpr	%r20, 0x0118, %tstate
hwintr_2_28:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_28), 16, 16)) -> intp(2, 0, 2f)
	.word 0xf21c4000  ! 470: LDD_R	ldd	[%r17 + %r0], %r25
	.word 0xb550c000  ! 471: RDPR_TT	<illegal instruction>
	mov	0, %r12
	.word 0x8f930000  ! 473: WRPR_TL_R	wrpr	%r12, %r0, %tl
	mov	2, %r12
	.word 0x8f930000  ! 478: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xf01c2161  ! 481: LDD_I	ldd	[%r16 + 0x0161], %r24
hwintr_2_29:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_29), 16, 16)) -> intp(2, 0, 14)
	.word 0x8d946017  ! 485: WRPR_PSTATE_I	wrpr	%r17, 0x0017, %pstate
	.word 0xf8144000  ! 486: LDUH_R	lduh	[%r17 + %r0], %r28
	.word 0xb551c000  ! 488: RDPR_TL	<illegal instruction>
	.word 0xbf480000  ! 490: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xf91c21f9  ! 492: LDDF_I	ldd	[%r16, 0x01f9], %f28
	.word 0xfe550000  ! 493: LDSH_R	ldsh	[%r20 + %r0], %r31
	.word 0x9195e1e6  ! 494: WRPR_PIL_I	wrpr	%r23, 0x01e6, %pil
	setx	0x375b919700009fc2, %g1, %r10
	.word 0x839a8000  ! 495: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb8344000  ! 499: ORN_R	orn 	%r17, %r0, %r28
	.word 0xbe1c2024  ! 500: XOR_I	xor 	%r16, 0x0024, %r31
	.word 0xbd518000  ! 503: RDPR_PSTATE	<illegal instruction>
	.word 0xfc150000  ! 505: LDUH_R	lduh	[%r20 + %r0], %r30
	.word 0xf31ca0cf  ! 507: LDDF_I	ldd	[%r18, 0x00cf], %f25
	.word 0xb095e0e7  ! 509: ORcc_I	orcc 	%r23, 0x00e7, %r24
	.word 0xf60dc000  ! 512: LDUB_R	ldub	[%r23 + %r0], %r27
	.word 0xf6146173  ! 513: LDUH_I	lduh	[%r17 + 0x0173], %r27
	.word 0xb751c000  ! 515: RDPR_TL	<illegal instruction>
	.word 0xb2a521a1  ! 516: SUBcc_I	subcc 	%r20, 0x01a1, %r25
	.word 0xb9504000  ! 517: RDPR_TNPC	<illegal instruction>
	.word 0xf8554000  ! 518: LDSH_R	ldsh	[%r21 + %r0], %r28
	.word 0x8d95e196  ! 519: WRPR_PSTATE_I	wrpr	%r23, 0x0196, %pstate
	.word 0xf11c0000  ! 521: LDDF_R	ldd	[%r16, %r0], %f24
	.word 0xfc5d0000  ! 525: LDX_R	ldx	[%r20 + %r0], %r30
hwintr_2_30:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_30), 16, 16)) -> intp(2, 0, 9)
	.word 0x83942139  ! 531: WRPR_TNPC_I	wrpr	%r16, 0x0139, %tnpc
	.word 0xb0ac4000  ! 532: ANDNcc_R	andncc 	%r17, %r0, %r24
	.word 0xfe0c8000  ! 533: LDUB_R	ldub	[%r18 + %r0], %r31
hwintr_2_31:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_31), 16, 16)) -> intp(2, 0, 27)
	setx	data_start_3, %g1, %r17
	.word 0xf6040000  ! 539: LDUW_R	lduw	[%r16 + %r0], %r27
	.word 0xfc150000  ! 541: LDUH_R	lduh	[%r20 + %r0], %r30
	setx	data_start_7, %g1, %r19
	.word 0xf81d2015  ! 549: LDD_I	ldd	[%r20 + 0x0015], %r28
	setx	0xd08f11a600002a09, %g1, %r10
	.word 0x819a8000  ! 552: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xfc058000  ! 554: LDUW_R	lduw	[%r22 + %r0], %r30
	.word 0xfc550000  ! 556: LDSH_R	ldsh	[%r20 + %r0], %r30
	.word 0xf20521ca  ! 557: LDUW_I	lduw	[%r20 + 0x01ca], %r25
	.word 0x8994a1be  ! 558: WRPR_TICK_I	wrpr	%r18, 0x01be, %tick
	setx	data_start_6, %g1, %r21
	.word 0xf605e15c  ! 561: LDUW_I	lduw	[%r23 + 0x015c], %r27
	.word 0xb64561ed  ! 562: ADDC_I	addc 	%r21, 0x01ed, %r27
	.word 0xf60ca155  ! 565: LDUB_I	ldub	[%r18 + 0x0155], %r27
	.word 0xfc1c2106  ! 566: LDD_I	ldd	[%r16 + 0x0106], %r30
	.word 0xb7510000  ! 567: RDPR_TICK	<illegal instruction>
	setx	data_start_7, %g1, %r21
	.word 0xf60de0f8  ! 571: LDUB_I	ldub	[%r23 + 0x00f8], %r27
	.word 0xf254a174  ! 573: LDSH_I	ldsh	[%r18 + 0x0174], %r25
hwintr_2_32:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_32), 16, 16)) -> intp(2, 0, 1f)
	.word 0xbd351000  ! 576: SRLX_R	srlx	%r20, %r0, %r30
hwintr_2_33:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_33), 16, 16)) -> intp(2, 0, 30)
	.word 0xf25ca07e  ! 579: LDX_I	ldx	[%r18 + 0x007e], %r25
	setx	data_start_5, %g1, %r21
	.word 0xf51cc000  ! 588: LDDF_R	ldd	[%r19, %r0], %f26
hwintr_2_34:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_34), 16, 16)) -> intp(2, 0, 39)
	.word 0xf40dc000  ! 592: LDUB_R	ldub	[%r23 + %r0], %r26
	.word 0xbf480000  ! 593: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xf45420f3  ! 596: LDSH_I	ldsh	[%r16 + 0x00f3], %r26
	.word 0xb03d611d  ! 597: XNOR_I	xnor 	%r21, 0x011d, %r24
	.word 0x8395607a  ! 600: WRPR_TNPC_I	wrpr	%r21, 0x007a, %tnpc
	.word 0xff1de0c3  ! 602: LDDF_I	ldd	[%r23, 0x00c3], %f31
	.word 0xbea4a1cc  ! 603: SUBcc_I	subcc 	%r18, 0x01cc, %r31
	.word 0xf61420e1  ! 604: LDUH_I	lduh	[%r16 + 0x00e1], %r27
	.word 0xf654e0b8  ! 605: LDSH_I	ldsh	[%r19 + 0x00b8], %r27
	.word 0xf24da08f  ! 611: LDSB_I	ldsb	[%r22 + 0x008f], %r25
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
hwintr_2_35:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_35), 16, 16)) -> intp(2, 0, 24)
	.word 0xfc1d8000  ! 618: LDD_R	ldd	[%r22 + %r0], %r30
hwintr_2_36:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_36), 16, 16)) -> intp(2, 0, f)
	.word 0xb93c1000  ! 629: SRAX_R	srax	%r16, %r0, %r28
	.word 0xfc55a1c4  ! 633: LDSH_I	ldsh	[%r22 + 0x01c4], %r30
	.word 0xbb504000  ! 635: RDPR_TNPC	<illegal instruction>
	.word 0xf0558000  ! 637: LDSH_R	ldsh	[%r22 + %r0], %r24
	.word 0xf6442049  ! 639: LDSW_I	ldsw	[%r16 + 0x0049], %r27
	.word 0xf805a058  ! 645: LDUW_I	lduw	[%r22 + 0x0058], %r28
	.word 0xf21d8000  ! 647: LDD_R	ldd	[%r22 + %r0], %r25
	setx	0xfa9dce9100002e86, %g1, %r10
	.word 0x839a8000  ! 654: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbc1dc000  ! 657: XOR_R	xor 	%r23, %r0, %r30
	.word 0xf44cc000  ! 658: LDSB_R	ldsb	[%r19 + %r0], %r26
	.word 0x8794e089  ! 662: WRPR_TT_I	wrpr	%r19, 0x0089, %tt
	.word 0xb4b4a043  ! 663: ORNcc_I	orncc 	%r18, 0x0043, %r26
	.word 0xfe04a1ae  ! 666: LDUW_I	lduw	[%r18 + 0x01ae], %r31
hwintr_2_37:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_37), 16, 16)) -> intp(2, 0, 39)
	setx	0xde973bd700002c87, %g1, %r10
	.word 0x839a8000  ! 673: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	mov	1, %r12
	.word 0x8f930000  ! 676: WRPR_TL_R	wrpr	%r12, %r0, %tl
	mov	0, %r12
	.word 0x8f930000  ! 677: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xfa5da03d  ! 679: LDX_I	ldx	[%r22 + 0x003d], %r29
	setx	data_start_4, %g1, %r21
	.word 0xfd1d619a  ! 686: LDDF_I	ldd	[%r21, 0x019a], %f30
	.word 0xf2554000  ! 688: LDSH_R	ldsh	[%r21 + %r0], %r25
	.word 0xb83c4000  ! 689: XNOR_R	xnor 	%r17, %r0, %r28
hwintr_2_38:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_38), 16, 16)) -> intp(2, 0, b)
	setx	0x8131ffed0000d9cc, %g1, %r10
	.word 0x819a8000  ! 691: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	setx	data_start_4, %g1, %r16
	.word 0xfc4c20fc  ! 698: LDSB_I	ldsb	[%r16 + 0x00fc], %r30
	.word 0x919460c2  ! 699: WRPR_PIL_I	wrpr	%r17, 0x00c2, %pil
	.word 0xb9508000  ! 701: RDPR_TSTATE	<illegal instruction>
	.word 0xb5504000  ! 704: RDPR_TNPC	<illegal instruction>
	.word 0xbe35e149  ! 705: ORN_I	orn 	%r23, 0x0149, %r31
	setx	0xc8fc3cfd000038d6, %g1, %r10
	.word 0x839a8000  ! 707: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbf51c000  ! 709: RDPR_TL	<illegal instruction>
	.word 0x8795e07c  ! 713: WRPR_TT_I	wrpr	%r23, 0x007c, %tt
	.word 0xf404c000  ! 715: LDUW_R	lduw	[%r19 + %r0], %r26
	.word 0x8795a114  ! 717: WRPR_TT_I	wrpr	%r22, 0x0114, %tt
	setx	0x4ea4eaaf0000cfce, %g1, %r10
	.word 0x819a8000  ! 718: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xfa04e1ef  ! 719: LDUW_I	lduw	[%r19 + 0x01ef], %r29
	.word 0xf04dc000  ! 722: LDSB_R	ldsb	[%r23 + %r0], %r24
	.word 0xfa55218c  ! 731: LDSH_I	ldsh	[%r20 + 0x018c], %r29
	.word 0xf00d0000  ! 732: LDUB_R	ldub	[%r20 + %r0], %r24
	.word 0x8195a056  ! 733: WRPR_TPC_I	wrpr	%r22, 0x0056, %tpc
hwintr_2_39:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_39), 16, 16)) -> intp(2, 0, 3c)
	.word 0xf45c0000  ! 736: LDX_R	ldx	[%r16 + %r0], %r26
	.word 0xf21c61e2  ! 738: LDD_I	ldd	[%r17 + 0x01e2], %r25
	.word 0xf4458000  ! 739: LDSW_R	ldsw	[%r22 + %r0], %r26
hwintr_2_40:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_40), 16, 16)) -> intp(2, 0, 38)
	.word 0x819561e9  ! 745: WRPR_TPC_I	wrpr	%r21, 0x01e9, %tpc
	setx	data_start_4, %g1, %r17
	.word 0xb7344000  ! 748: SRL_R	srl 	%r17, %r0, %r27
	.word 0xf81d4000  ! 749: LDD_R	ldd	[%r21 + %r0], %r28
	setx	data_start_1, %g1, %r22
	.word 0xf11de128  ! 753: LDDF_I	ldd	[%r23, 0x0128], %f24
	.word 0xfc5d0000  ! 758: LDX_R	ldx	[%r20 + %r0], %r30
	.word 0xf404c000  ! 759: LDUW_R	lduw	[%r19 + %r0], %r26
	.word 0xf415200f  ! 760: LDUH_I	lduh	[%r20 + 0x000f], %r26
	setx	data_start_2, %g1, %r16
	.word 0xfe458000  ! 766: LDSW_R	ldsw	[%r22 + %r0], %r31
hwintr_2_41:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_41), 16, 16)) -> intp(2, 0, 31)
	mov	0, %r12
	.word 0xa1930000  ! 774: WRPR_GL_R	wrpr	%r12, %r0, %-
hwintr_2_42:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_42), 16, 16)) -> intp(2, 0, 8)
	.word 0x859521dc  ! 781: WRPR_TSTATE_I	wrpr	%r20, 0x01dc, %tstate
hwintr_2_43:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_43), 16, 16)) -> intp(2, 0, 7)
	.word 0xf11d211a  ! 785: LDDF_I	ldd	[%r20, 0x011a], %f24
	.word 0xfc1dc000  ! 795: LDD_R	ldd	[%r23 + %r0], %r30
	.word 0x839461e7  ! 798: WRPR_TNPC_I	wrpr	%r17, 0x01e7, %tnpc
	.word 0xfd1ca022  ! 805: LDDF_I	ldd	[%r18, 0x0022], %f30
	.word 0xb5540000  ! 807: RDPR_GL	<illegal instruction>
	.word 0xff1c21ba  ! 812: LDDF_I	ldd	[%r16, 0x01ba], %f31
	.word 0xf015e177  ! 814: LDUH_I	lduh	[%r23 + 0x0177], %r24
	.word 0xf61cc000  ! 819: LDD_R	ldd	[%r19 + %r0], %r27
	.word 0xfa14a0a7  ! 823: LDUH_I	lduh	[%r18 + 0x00a7], %r29
	.word 0x839521bb  ! 828: WRPR_TNPC_I	wrpr	%r20, 0x01bb, %tnpc
	setx	data_start_5, %g1, %r16
	.word 0xf415a074  ! 837: LDUH_I	lduh	[%r22 + 0x0074], %r26
hwintr_2_44:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_44), 16, 16)) -> intp(2, 0, 2b)
	.word 0xf6142151  ! 846: LDUH_I	lduh	[%r16 + 0x0151], %r27
	mov	2, %r12
	.word 0xa1930000  ! 847: WRPR_GL_R	wrpr	%r12, %r0, %-
	mov	0, %r12
	.word 0x8f930000  ! 851: WRPR_TL_R	wrpr	%r12, %r0, %tl
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf00d21de  ! 853: LDUB_I	ldub	[%r20 + 0x01de], %r24
	.word 0xb5520000  ! 855: RDPR_PIL	rdpr	%pil, %r26
	.word 0xff1de06d  ! 857: LDDF_I	ldd	[%r23, 0x006d], %f31
	.word 0xfe14a030  ! 859: LDUH_I	lduh	[%r18 + 0x0030], %r31
	.word 0xb3510000  ! 862: RDPR_TICK	<illegal instruction>
hwintr_2_45:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_45), 16, 16)) -> intp(2, 0, 29)
	.word 0xf255a105  ! 865: LDSH_I	ldsh	[%r22 + 0x0105], %r25
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0x8394e11b  ! 873: WRPR_TNPC_I	wrpr	%r19, 0x011b, %tnpc
	.word 0xf854a0f4  ! 876: LDSH_I	ldsh	[%r18 + 0x00f4], %r28
	.word 0x8594e13e  ! 877: WRPR_TSTATE_I	wrpr	%r19, 0x013e, %tstate
	.word 0xf91ca024  ! 878: LDDF_I	ldd	[%r18, 0x0024], %f28
	.word 0xf21560f7  ! 879: LDUH_I	lduh	[%r21 + 0x00f7], %r25
	.word 0xbc358000  ! 882: SUBC_R	orn 	%r22, %r0, %r30
	.word 0xf854a1bd  ! 884: LDSH_I	ldsh	[%r18 + 0x01bd], %r28
	.word 0xba2ce0a2  ! 886: ANDN_I	andn 	%r19, 0x00a2, %r29
	mov	0, %r12
	.word 0x8f930000  ! 887: WRPR_TL_R	wrpr	%r12, %r0, %tl
	setx	0x1df586ae0000fbc7, %g1, %r10
	.word 0x819a8000  ! 888: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf51c4000  ! 890: LDDF_R	ldd	[%r17, %r0], %f26
	.word 0xfe144000  ! 894: LDUH_R	lduh	[%r17 + %r0], %r31
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x140, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0xf24de08e  ! 897: LDSB_I	ldsb	[%r23 + 0x008e], %r25
	.word 0x8795a020  ! 899: WRPR_TT_I	wrpr	%r22, 0x0020, %tt
hwintr_2_46:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_46), 16, 16)) -> intp(2, 0, 2f)
	.word 0xb7510000  ! 904: RDPR_TICK	<illegal instruction>
	.word 0xbb51c000  ! 909: RDPR_TL	<illegal instruction>
	.word 0xfe4c8000  ! 910: LDSB_R	ldsb	[%r18 + %r0], %r31
	.word 0xfc5d6150  ! 915: LDX_I	ldx	[%r21 + 0x0150], %r30
	.word 0xb4148000  ! 921: OR_R	or 	%r18, %r0, %r26
	.word 0xfa0da1f6  ! 922: LDUB_I	ldub	[%r22 + 0x01f6], %r29
	.word 0xf80c0000  ! 929: LDUB_R	ldub	[%r16 + %r0], %r28
hwintr_2_47:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_47), 16, 16)) -> intp(2, 0, 36)
	.word 0x89942158  ! 934: WRPR_TICK_I	wrpr	%r16, 0x0158, %tick
	.word 0xf80c4000  ! 942: LDUB_R	ldub	[%r17 + %r0], %r28
	.word 0xf45561ee  ! 947: LDSH_I	ldsh	[%r21 + 0x01ee], %r26
	.word 0xfe0421d9  ! 949: LDUW_I	lduw	[%r16 + 0x01d9], %r31
	.word 0xf0150000  ! 952: LDUH_R	lduh	[%r20 + %r0], %r24
	.word 0xbb480000  ! 953: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	setx	0xff692fb80000eb52, %g1, %r10
	.word 0x819a8000  ! 956: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xf60ca1a9  ! 958: LDUB_I	ldub	[%r18 + 0x01a9], %r27
	.word 0xfc05a15a  ! 959: LDUW_I	lduw	[%r22 + 0x015a], %r30
hwintr_2_48:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_48), 16, 16)) -> intp(2, 0, b)
	setx	0x2be7b311000019d6, %g1, %r10
	.word 0x839a8000  ! 963: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb7480000  ! 966: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xf11de140  ! 968: LDDF_I	ldd	[%r23, 0x0140], %f24
	setx	0x48a8fdde0000784a, %g1, %r10
	.word 0x819a8000  ! 972: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xfd1dc000  ! 975: LDDF_R	ldd	[%r23, %r0], %f30
	.word 0xf85dc000  ! 979: LDX_R	ldx	[%r23 + %r0], %r28
hwintr_2_49:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_49), 16, 16)) -> intp(2, 0, 2d)
hwintr_2_50:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_50), 16, 16)) -> intp(2, 0, 23)
	.word 0xba45e01f  ! 985: ADDC_I	addc 	%r23, 0x001f, %r29
	setx	data_start_4, %g1, %r17
	.word 0xf4054000  ! 989: LDUW_R	lduw	[%r21 + %r0], %r26
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xf80cc000  ! 993: LDUB_R	ldub	[%r19 + %r0], %r28
	.word 0xfe4ce081  ! 994: LDSB_I	ldsb	[%r19 + 0x0081], %r31
	setx	data_start_0, %g1, %r19
hwintr_2_51:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_51), 16, 16)) -> intp(2, 0, 28)
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	.word 0xb1a80c20  ! 4: FMOVRLZ	dis not found

hwintr_1_0:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_0), 16, 16)) -> intp(1, 0, 9)
	.word 0xb9a98820  ! 8: FMOVNEG	fmovs	%fcc1, %f0, %f28
	.word 0xb3a90820  ! 11: FMOVLEU	fmovs	%fcc1, %f0, %f25
	.word 0x9195e1a5  ! 12: WRPR_PIL_I	wrpr	%r23, 0x01a5, %pil
hwintr_1_1:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_1), 16, 16)) -> intp(1, 0, 3a)
	.word 0xbfa8c820  ! 15: FMOVL	fmovs	%fcc1, %f0, %f31
	.word 0xb1641800  ! 17: MOVcc_R	<illegal instruction>
	.word 0xb7a5c8e0  ! 19: FSUBq	dis not found

	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	.word 0x8794a0c7  ! 21: WRPR_TT_I	wrpr	%r18, 0x00c7, %tt
	.word 0xb5a58840  ! 22: FADDd	faddd	%f22, %f0, %f26
	.word 0xb5a80c20  ! 23: FMOVRLZ	dis not found

	.word 0xb205213f  ! 27: ADD_I	add 	%r20, 0x013f, %r25
	setx	0xd89020e900002c00, %g1, %r10
	.word 0x839a8000  ! 29: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x8d95a080  ! 30: WRPR_PSTATE_I	wrpr	%r22, 0x0080, %pstate
hwintr_1_2:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_2), 16, 16)) -> intp(1, 0, 1c)
	.word 0xb3a81c20  ! 36: FMOVRGEZ	dis not found

	.word 0xb7a44940  ! 40: FMULd	fmuld	%f48, %f0, %f58
	setx	0x28e023030000ac8a, %g1, %r10
	.word 0x839a8000  ! 46: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbb7cc400  ! 49: MOVR_R	movre	%r19, %r0, %r29
	.word 0xb5a589e0  ! 51: FDIVq	dis not found

	.word 0xbeaca125  ! 54: ANDNcc_I	andncc 	%r18, 0x0125, %r31
	.word 0xbda94820  ! 56: FMOVCS	fmovs	%fcc1, %f0, %f30
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
hwintr_1_3:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_3), 16, 16)) -> intp(1, 0, 19)
	.word 0xb9a80c20  ! 61: FMOVRLZ	dis not found

	mov	0, %r12
	.word 0x8f930000  ! 63: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x85942025  ! 64: WRPR_TSTATE_I	wrpr	%r16, 0x0025, %tstate
hwintr_1_4:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_4), 16, 16)) -> intp(1, 0, 37)
	.word 0xb9ab0820  ! 67: FMOVGU	fmovs	%fcc1, %f0, %f28
hwintr_1_5:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_5), 16, 16)) -> intp(1, 0, 3e)
	setx	data_start_7, %g1, %r16
	setx	0x3ffcdeab00003c95, %g1, %r10
	.word 0x839a8000  ! 78: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
hwintr_1_6:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_6), 16, 16)) -> intp(1, 0, 9)
	.word 0xbda84820  ! 92: FMOVE	fmovs	%fcc1, %f0, %f30
	.word 0xb1a5c9c0  ! 97: FDIVd	fdivd	%f54, %f0, %f24
	.word 0xbba549e0  ! 98: FDIVq	dis not found

	.word 0xbfa50860  ! 99: FADDq	dis not found

	.word 0xb7a00540  ! 108: FSQRTd	fsqrt	
	setx	data_start_5, %g1, %r23
	mov	2, %r12
	.word 0xa1930000  ! 117: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x83952088  ! 121: WRPR_TNPC_I	wrpr	%r20, 0x0088, %tnpc
	.word 0xb484c000  ! 126: ADDcc_R	addcc 	%r19, %r0, %r26
	.word 0xb7508000  ! 127: RDPR_TSTATE	<illegal instruction>
	.word 0xb1520000  ! 128: RDPR_PIL	<illegal instruction>
	.word 0xbd643801  ! 129: MOVcc_I	<illegal instruction>
	.word 0xb1a8c820  ! 132: FMOVL	fmovs	%fcc1, %f0, %f24
	.word 0xbfa44940  ! 134: FMULd	fmuld	%f48, %f0, %f62
	.word 0xbc954000  ! 138: ORcc_R	orcc 	%r21, %r0, %r30
	.word 0xbba4c820  ! 140: FADDs	fadds	%f19, %f0, %f29
	.word 0xb9504000  ! 142: RDPR_TNPC	<illegal instruction>
	.word 0xb1a548c0  ! 147: FSUBd	fsubd	%f52, %f0, %f24
	.word 0xbe45600d  ! 148: ADDC_I	addc 	%r21, 0x000d, %r31
	.word 0xb9a00520  ! 152: FSQRTs	fsqrt	
	.word 0xb5a40920  ! 153: FMULs	fmuls	%f16, %f0, %f26
	.word 0xb7a54820  ! 154: FADDs	fadds	%f21, %f0, %f27
hwintr_1_7:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_7), 16, 16)) -> intp(1, 0, 8)
	.word 0xb1a88820  ! 156: FMOVLE	fmovs	%fcc1, %f0, %f24
	.word 0xbba00520  ! 160: FSQRTs	fsqrt	
	.word 0xb1a00040  ! 162: FMOVd	fmovd	%f0, %f24
hwintr_1_8:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_8), 16, 16)) -> intp(1, 0, 25)
	setx	data_start_4, %g1, %r20
	setx	0x26f7be200000dd15, %g1, %r10
	.word 0x819a8000  ! 172: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbab58000  ! 177: SUBCcc_R	orncc 	%r22, %r0, %r29
hwintr_1_9:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_9), 16, 16)) -> intp(1, 0, 3e)
hwintr_1_10:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_10), 16, 16)) -> intp(1, 0, a)
	.word 0xbfa548e0  ! 180: FSUBq	dis not found

hwintr_1_11:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_11), 16, 16)) -> intp(1, 0, 19)
	.word 0xbfa408a0  ! 189: FSUBs	fsubs	%f16, %f0, %f31
	.word 0xb350c000  ! 190: RDPR_TT	<illegal instruction>
	.word 0xb5518000  ! 193: RDPR_PSTATE	<illegal instruction>
	.word 0x87946039  ! 195: WRPR_TT_I	wrpr	%r17, 0x0039, %tt
	.word 0xb9a00020  ! 196: FMOVs	fmovs	%f0, %f28
	.word 0xb9a81420  ! 197: FMOVRNZ	dis not found

hwintr_1_12:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_12), 16, 16)) -> intp(1, 0, 15)
	.word 0xb9abc820  ! 202: FMOVVC	fmovs	%fcc1, %f0, %f28
	.word 0xbcac4000  ! 203: ANDNcc_R	andncc 	%r17, %r0, %r30
	.word 0xbda448c0  ! 204: FSUBd	fsubd	%f48, %f0, %f30
	.word 0xbd504000  ! 205: RDPR_TNPC	<illegal instruction>
	.word 0xb9a44940  ! 209: FMULd	fmuld	%f48, %f0, %f28
	.word 0xb5504000  ! 211: RDPR_TNPC	<illegal instruction>
	.word 0xb1ab0820  ! 213: FMOVGU	fmovs	%fcc1, %f0, %f24
	setx	data_start_4, %g1, %r17
hwintr_1_13:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_13), 16, 16)) -> intp(1, 0, 2c)
	.word 0xb0b44000  ! 218: SUBCcc_R	orncc 	%r17, %r0, %r24
	.word 0x9195a00b  ! 226: WRPR_PIL_I	wrpr	%r22, 0x000b, %pil
hwintr_1_14:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_14), 16, 16)) -> intp(1, 0, 3d)
	.word 0xb3a4c960  ! 229: FMULq	dis not found

	.word 0xbba98820  ! 232: FMOVNEG	fmovs	%fcc1, %f0, %f29
	.word 0xb0242017  ! 237: SUB_I	sub 	%r16, 0x0017, %r24
	.word 0xb2b4618b  ! 238: ORNcc_I	orncc 	%r17, 0x018b, %r25
	.word 0xb1480000  ! 246: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
hwintr_1_15:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_15), 16, 16)) -> intp(1, 0, 37)
	.word 0xb6c4c000  ! 256: ADDCcc_R	addccc 	%r19, %r0, %r27
hwintr_1_16:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_16), 16, 16)) -> intp(1, 0, c)
	.word 0xb7aac820  ! 264: FMOVGE	fmovs	%fcc1, %f0, %f27
	.word 0xbfab4820  ! 265: FMOVCC	fmovs	%fcc1, %f0, %f31
	.word 0xbb3c5000  ! 267: SRAX_R	srax	%r17, %r0, %r29
	.word 0xb2050000  ! 271: ADD_R	add 	%r20, %r0, %r25
hwintr_1_17:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_17), 16, 16)) -> intp(1, 0, 22)
	.word 0xbfa81820  ! 279: FMOVRGZ	fmovs	%fcc3, %f0, %f31
	.word 0xb1a90820  ! 282: FMOVLEU	fmovs	%fcc1, %f0, %f24
hwintr_1_18:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_18), 16, 16)) -> intp(1, 0, 28)
	.word 0xb5a44920  ! 288: FMULs	fmuls	%f17, %f0, %f26
	setx	0xe47b5b0400009dde, %g1, %r10
	.word 0x839a8000  ! 293: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbba00020  ! 294: FMOVs	fmovs	%f0, %f29
	.word 0xbda81c20  ! 299: FMOVRGEZ	dis not found

	.word 0xb7480000  ! 304: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xb7a48860  ! 305: FADDq	dis not found

	.word 0xb9a00560  ! 306: FSQRTq	fsqrt	
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb8040000  ! 311: ADD_R	add 	%r16, %r0, %r28
	.word 0xbba00560  ! 313: FSQRTq	fsqrt	
	.word 0xb1540000  ! 319: RDPR_GL	<illegal instruction>
	.word 0xb9a80420  ! 320: FMOVRZ	dis not found

	.word 0x8595a05d  ! 321: WRPR_TSTATE_I	wrpr	%r22, 0x005d, %tstate
	.word 0xb1a5c960  ! 323: FMULq	dis not found

	.word 0xbbab0820  ! 328: FMOVGU	fmovs	%fcc1, %f0, %f29
	.word 0xbdaac820  ! 329: FMOVGE	fmovs	%fcc1, %f0, %f30
hwintr_1_19:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_19), 16, 16)) -> intp(1, 0, e)
	.word 0xbda54860  ! 331: FADDq	dis not found

	setx	data_start_1, %g1, %r18
	.word 0xba2cc000  ! 337: ANDN_R	andn 	%r19, %r0, %r29
	.word 0xb3a81420  ! 339: FMOVRNZ	dis not found

	.word 0x8d946050  ! 341: WRPR_PSTATE_I	wrpr	%r17, 0x0050, %pstate
	.word 0xb9a98820  ! 342: FMOVNEG	fmovs	%fcc1, %f0, %f28
	.word 0xbda48840  ! 345: FADDd	faddd	%f18, %f0, %f30
	.word 0xb7520000  ! 347: RDPR_PIL	<illegal instruction>
	.word 0x89946122  ! 348: WRPR_TICK_I	wrpr	%r17, 0x0122, %tick
	.word 0x91952185  ! 351: WRPR_PIL_I	wrpr	%r20, 0x0185, %pil
hwintr_1_20:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_20), 16, 16)) -> intp(1, 0, 38)
	setx	0xf0b00df10000af17, %g1, %r10
	.word 0x819a8000  ! 357: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb5a4c960  ! 359: FMULq	dis not found

	.word 0xbd50c000  ! 362: RDPR_TT	<illegal instruction>
	setx	data_start_4, %g1, %r16
hwintr_1_21:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_21), 16, 16)) -> intp(1, 0, 6)
	.word 0xb7a488a0  ! 368: FSUBs	fsubs	%f18, %f0, %f27
hwintr_1_22:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_22), 16, 16)) -> intp(1, 0, 36)
	.word 0xb1aa4820  ! 374: FMOVNE	fmovs	%fcc1, %f0, %f24
	.word 0xbd508000  ! 376: RDPR_TSTATE	<illegal instruction>
	setx	data_start_6, %g1, %r23
hwintr_1_23:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_23), 16, 16)) -> intp(1, 0, 14)
	.word 0xbba00040  ! 382: FMOVd	fmovd	%f0, %f60
	.word 0xb63d8000  ! 384: XNOR_R	xnor 	%r22, %r0, %r27
	.word 0xb1a80420  ! 386: FMOVRZ	dis not found

hwintr_1_24:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_24), 16, 16)) -> intp(1, 0, 32)
hwintr_1_25:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_25), 16, 16)) -> intp(1, 0, 32)
hwintr_1_26:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_26), 16, 16)) -> intp(1, 0, e)
	.word 0xb1a548c0  ! 398: FSUBd	fsubd	%f52, %f0, %f24
	.word 0xb5a48820  ! 403: FADDs	fadds	%f18, %f0, %f26
	.word 0xb1a00540  ! 413: FSQRTd	fsqrt	
	.word 0xb9a81c20  ! 414: FMOVRGEZ	dis not found

hwintr_1_27:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_27), 16, 16)) -> intp(1, 0, 9)
	.word 0xbda50840  ! 417: FADDd	faddd	%f20, %f0, %f30
	.word 0xb1a48960  ! 419: FMULq	dis not found

	.word 0xb7a548a0  ! 420: FSUBs	fsubs	%f21, %f0, %f27
	.word 0xb2452167  ! 421: ADDC_I	addc 	%r20, 0x0167, %r25
	mov	2, %r12
	.word 0x8f930000  ! 425: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xbfa90820  ! 426: FMOVLEU	fmovs	%fcc1, %f0, %f31
	.word 0xbba81420  ! 427: FMOVRNZ	dis not found

	.word 0xb751c000  ! 428: RDPR_TL	<illegal instruction>
	.word 0xb3aa8820  ! 429: FMOVG	fmovs	%fcc1, %f0, %f25
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xbb480000  ! 433: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb3a80820  ! 439: FMOVRLEZ	fmovs	%fcc1, %f0, %f25
	.word 0x8995e012  ! 440: WRPR_TICK_I	wrpr	%r23, 0x0012, %tick
	.word 0x8194e079  ! 442: WRPR_TPC_I	wrpr	%r19, 0x0079, %tpc
	.word 0xb9480000  ! 443: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xb13c8000  ! 444: SRA_R	sra 	%r18, %r0, %r24
	setx	0x656a423f0000695a, %g1, %r10
	.word 0x819a8000  ! 446: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	mov	0, %r12
	.word 0xa1930000  ! 449: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x8594e016  ! 456: WRPR_TSTATE_I	wrpr	%r19, 0x0016, %tstate
hwintr_1_28:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_28), 16, 16)) -> intp(1, 0, 38)
	.word 0xb3a4c8a0  ! 459: FSUBs	fsubs	%f19, %f0, %f25
	.word 0xb5a5c9e0  ! 461: FDIVq	dis not found

	.word 0xbba81820  ! 463: FMOVRGZ	fmovs	%fcc3, %f0, %f29
	.word 0xb950c000  ! 471: RDPR_TT	<illegal instruction>
	mov	2, %r12
	.word 0x8f930000  ! 473: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb1a00040  ! 474: FMOVd	fmovd	%f0, %f24
	mov	2, %r12
	.word 0x8f930000  ! 478: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xb5ab8820  ! 482: FMOVPOS	fmovs	%fcc1, %f0, %f26
hwintr_1_29:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_29), 16, 16)) -> intp(1, 0, 24)
	.word 0xb7a80820  ! 484: FMOVRLEZ	fmovs	%fcc1, %f0, %f27
	.word 0x8d94a1ff  ! 485: WRPR_PSTATE_I	wrpr	%r18, 0x01ff, %pstate
	.word 0xbf51c000  ! 488: RDPR_TL	<illegal instruction>
	.word 0xb9480000  ! 490: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0x91956123  ! 494: WRPR_PIL_I	wrpr	%r21, 0x0123, %pil
	setx	0x7f5863d300003d4a, %g1, %r10
	.word 0x839a8000  ! 495: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb8358000  ! 499: ORN_R	orn 	%r22, %r0, %r28
	.word 0xbe1c20b4  ! 500: XOR_I	xor 	%r16, 0x00b4, %r31
	.word 0xb3aa8820  ! 501: FMOVG	fmovs	%fcc1, %f0, %f25
	.word 0xbb518000  ! 503: RDPR_PSTATE	<illegal instruction>
	.word 0xb7a5c820  ! 508: FADDs	fadds	%f23, %f0, %f27
	.word 0xbe95a0d8  ! 509: ORcc_I	orcc 	%r22, 0x00d8, %r31
	.word 0xbfa8c820  ! 511: FMOVL	fmovs	%fcc1, %f0, %f31
	.word 0xb7a408c0  ! 514: FSUBd	fsubd	%f16, %f0, %f58
	.word 0xb551c000  ! 515: RDPR_TL	<illegal instruction>
	.word 0xb0a56076  ! 516: SUBcc_I	subcc 	%r21, 0x0076, %r24
	.word 0xbf504000  ! 517: RDPR_TNPC	<illegal instruction>
	.word 0x8d94e142  ! 519: WRPR_PSTATE_I	wrpr	%r19, 0x0142, %pstate
	.word 0xbbaa4820  ! 523: FMOVNE	fmovs	%fcc1, %f0, %f29
hwintr_1_30:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_30), 16, 16)) -> intp(1, 0, 4)
	.word 0x83952044  ! 531: WRPR_TNPC_I	wrpr	%r20, 0x0044, %tnpc
	.word 0xb4ac0000  ! 532: ANDNcc_R	andncc 	%r16, %r0, %r26
hwintr_1_31:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_31), 16, 16)) -> intp(1, 0, a)
	.word 0xbba40860  ! 535: FADDq	dis not found

	setx	data_start_0, %g1, %r17
	.word 0xbfa588e0  ! 540: FSUBq	dis not found

	.word 0xb1a00560  ! 545: FSQRTq	fsqrt	
	.word 0xb7a00560  ! 546: FSQRTq	fsqrt	
	setx	data_start_2, %g1, %r20
	.word 0xbba80820  ! 550: FMOVN	fmovs	%fcc1, %f0, %f29
	setx	0x8c54fa320000c9c5, %g1, %r10
	.word 0x819a8000  ! 552: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x899520a7  ! 558: WRPR_TICK_I	wrpr	%r20, 0x00a7, %tick
	setx	data_start_6, %g1, %r20
	.word 0xbe4461c3  ! 562: ADDC_I	addc 	%r17, 0x01c3, %r31
	.word 0xb7510000  ! 567: RDPR_TICK	<illegal instruction>
	setx	data_start_1, %g1, %r23
	.word 0xb5aac820  ! 572: FMOVGE	fmovs	%fcc1, %f0, %f26
hwintr_1_32:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_32), 16, 16)) -> intp(1, 0, 26)
	.word 0xbd351000  ! 576: SRLX_R	srlx	%r20, %r0, %r30
hwintr_1_33:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_33), 16, 16)) -> intp(1, 0, 30)
	.word 0xbbab8820  ! 582: FMOVPOS	fmovs	%fcc1, %f0, %f29
	.word 0xb1a44920  ! 583: FMULs	fmuls	%f17, %f0, %f24
	setx	data_start_4, %g1, %r22
	.word 0xbfa548a0  ! 589: FSUBs	fsubs	%f21, %f0, %f31
hwintr_1_34:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_34), 16, 16)) -> intp(1, 0, 1b)
	.word 0xb1480000  ! 593: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xb83c2178  ! 597: XNOR_I	xnor 	%r16, 0x0178, %r28
	.word 0xb9a5c940  ! 598: FMULd	fmuld	%f54, %f0, %f28
	.word 0xb1a81820  ! 599: FMOVRGZ	fmovs	%fcc3, %f0, %f24
	.word 0x8394a1a8  ! 600: WRPR_TNPC_I	wrpr	%r18, 0x01a8, %tnpc
	.word 0xb1a54940  ! 601: FMULd	fmuld	%f52, %f0, %f24
	.word 0xb6a5a170  ! 603: SUBcc_I	subcc 	%r22, 0x0170, %r27
	.word 0xbfa84820  ! 606: FMOVE	fmovs	%fcc1, %f0, %f31
	ta	T_CHANGE_HPRIV
	mov	0, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
hwintr_1_35:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_35), 16, 16)) -> intp(1, 0, 21)
	.word 0xb9ab8820  ! 622: FMOVPOS	fmovs	%fcc1, %f0, %f28
hwintr_1_36:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_36), 16, 16)) -> intp(1, 0, 4)
	.word 0xb3a80c20  ! 624: FMOVRLZ	dis not found

	.word 0xb93c5000  ! 629: SRAX_R	srax	%r17, %r0, %r28
	.word 0xbba00560  ! 634: FSQRTq	fsqrt	
	.word 0xb9504000  ! 635: RDPR_TNPC	<illegal instruction>
	.word 0xb5ab4820  ! 646: FMOVCC	fmovs	%fcc1, %f0, %f26
	.word 0xbda00520  ! 650: FSQRTs	fsqrt	
	.word 0xb3a489c0  ! 651: FDIVd	fdivd	%f18, %f0, %f56
	.word 0xbbaa8820  ! 653: FMOVG	fmovs	%fcc1, %f0, %f29
	setx	0xe542395e0000ec11, %g1, %r10
	.word 0x839a8000  ! 654: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbfa98820  ! 655: FMOVNEG	fmovs	%fcc1, %f0, %f31
	.word 0xb41c8000  ! 657: XOR_R	xor 	%r18, %r0, %r26
	.word 0xb7aac820  ! 661: FMOVGE	fmovs	%fcc1, %f0, %f27
	.word 0x8795e052  ! 662: WRPR_TT_I	wrpr	%r23, 0x0052, %tt
	.word 0xbeb520e1  ! 663: ORNcc_I	orncc 	%r20, 0x00e1, %r31
	.word 0xb9a80820  ! 664: FMOVRLEZ	fmovs	%fcc1, %f0, %f28
hwintr_1_37:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_37), 16, 16)) -> intp(1, 0, 19)
	setx	0x594a6d4000002d0c, %g1, %r10
	.word 0x839a8000  ! 673: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	mov	0, %r12
	.word 0x8f930000  ! 676: WRPR_TL_R	wrpr	%r12, %r0, %tl
	mov	0, %r12
	.word 0x8f930000  ! 677: WRPR_TL_R	wrpr	%r12, %r0, %tl
	setx	data_start_3, %g1, %r19
	.word 0xbba00020  ! 682: FMOVs	fmovs	%f0, %f29
	.word 0xb1a5c8e0  ! 683: FSUBq	dis not found

	.word 0xb5a449e0  ! 684: FDIVq	dis not found

	.word 0xb63c0000  ! 689: XNOR_R	xnor 	%r16, %r0, %r27
hwintr_1_38:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_38), 16, 16)) -> intp(1, 0, 1b)
	setx	0x7ff6d8ef00008c47, %g1, %r10
	.word 0x819a8000  ! 691: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	setx	data_start_1, %g1, %r17
	.word 0xbba00020  ! 694: FMOVs	fmovs	%f0, %f29
	.word 0xb7a84820  ! 695: FMOVE	fmovs	%fcc1, %f0, %f27
	.word 0xb3aa8820  ! 697: FMOVG	fmovs	%fcc1, %f0, %f25
	.word 0x9194e130  ! 699: WRPR_PIL_I	wrpr	%r19, 0x0130, %pil
	.word 0xb9508000  ! 701: RDPR_TSTATE	<illegal instruction>
	.word 0xbba408c0  ! 702: FSUBd	fsubd	%f16, %f0, %f60
	.word 0xb9a509c0  ! 703: FDIVd	fdivd	%f20, %f0, %f28
	.word 0xb9504000  ! 704: RDPR_TNPC	<illegal instruction>
	.word 0xb6342198  ! 705: ORN_I	orn 	%r16, 0x0198, %r27
	setx	0x5f6c536f00002dd6, %g1, %r10
	.word 0x839a8000  ! 707: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xbd51c000  ! 709: RDPR_TL	<illegal instruction>
	.word 0x8795600b  ! 713: WRPR_TT_I	wrpr	%r21, 0x000b, %tt
	.word 0x8794e11d  ! 717: WRPR_TT_I	wrpr	%r19, 0x011d, %tt
	setx	0x3972700f0000c90c, %g1, %r10
	.word 0x819a8000  ! 718: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb5a50860  ! 721: FADDq	dis not found

	.word 0x8194202e  ! 733: WRPR_TPC_I	wrpr	%r16, 0x002e, %tpc
hwintr_1_39:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_39), 16, 16)) -> intp(1, 0, 35)
	.word 0xb1a00020  ! 737: FMOVs	fmovs	%f0, %f24
	.word 0xbfaa4820  ! 740: FMOVNE	fmovs	%fcc1, %f0, %f31
hwintr_1_40:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_40), 16, 16)) -> intp(1, 0, 3f)
	.word 0x8195e11a  ! 745: WRPR_TPC_I	wrpr	%r23, 0x011a, %tpc
	.word 0xbba00020  ! 746: FMOVs	fmovs	%f0, %f29
	setx	data_start_5, %g1, %r22
	.word 0xbb344000  ! 748: SRL_R	srl 	%r17, %r0, %r29
	setx	data_start_3, %g1, %r17
	.word 0xb1ab0820  ! 755: FMOVGU	fmovs	%fcc1, %f0, %f24
	.word 0xbfab8820  ! 756: FMOVPOS	fmovs	%fcc1, %f0, %f31
	.word 0xb9a58820  ! 757: FADDs	fadds	%f22, %f0, %f28
	setx	data_start_1, %g1, %r22
	.word 0xbda81c20  ! 763: FMOVRGEZ	dis not found

	.word 0xb9a00540  ! 765: FSQRTd	fsqrt	
	.word 0xbba80420  ! 767: FMOVRZ	dis not found

hwintr_1_41:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_41), 16, 16)) -> intp(1, 0, a)
	.word 0xb3a80c20  ! 772: FMOVRLZ	dis not found

	mov	1, %r12
	.word 0xa1930000  ! 774: WRPR_GL_R	wrpr	%r12, %r0, %-
hwintr_1_42:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_42), 16, 16)) -> intp(1, 0, 1a)
	.word 0x85952171  ! 781: WRPR_TSTATE_I	wrpr	%r20, 0x0171, %tstate
hwintr_1_43:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_43), 16, 16)) -> intp(1, 0, 10)
	.word 0xb7a94820  ! 786: FMOVCS	fmovs	%fcc1, %f0, %f27
	.word 0xb3a81820  ! 794: FMOVRGZ	fmovs	%fcc3, %f0, %f25
	.word 0xb1a00540  ! 796: FSQRTd	fsqrt	
	.word 0x839461cb  ! 798: WRPR_TNPC_I	wrpr	%r17, 0x01cb, %tnpc
	.word 0xbda94820  ! 799: FMOVCS	fmovs	%fcc1, %f0, %f30
	.word 0xbbabc820  ! 804: FMOVVC	fmovs	%fcc1, %f0, %f29
	.word 0xb5540000  ! 807: RDPR_GL	<illegal instruction>
	.word 0xbba9c820  ! 808: FMOVVS	fmovs	%fcc1, %f0, %f29
	.word 0xb3a44820  ! 810: FADDs	fadds	%f17, %f0, %f25
	.word 0xb9a489a0  ! 813: FDIVs	fdivs	%f18, %f0, %f28
	.word 0xbfab0820  ! 815: FMOVGU	fmovs	%fcc1, %f0, %f31
	.word 0xb5a00040  ! 816: FMOVd	fmovd	%f0, %f26
	.word 0xb1a94820  ! 817: FMOVCS	fmovs	%fcc1, %f0, %f24
	.word 0xbdaa0820  ! 818: FMOVA	fmovs	%fcc1, %f0, %f30
	.word 0xbfa509c0  ! 826: FDIVd	fdivd	%f20, %f0, %f62
	.word 0x83946050  ! 828: WRPR_TNPC_I	wrpr	%r17, 0x0050, %tnpc
	.word 0xb3a54940  ! 829: FMULd	fmuld	%f52, %f0, %f56
	setx	data_start_5, %g1, %r17
	.word 0xbba00520  ! 836: FSQRTs	fsqrt	
	.word 0xbba80420  ! 838: FMOVRZ	dis not found

hwintr_1_44:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_44), 16, 16)) -> intp(1, 0, 5)
	.word 0xbda54940  ! 844: FMULd	fmuld	%f52, %f0, %f30
	mov	0, %r12
	.word 0xa1930000  ! 847: WRPR_GL_R	wrpr	%r12, %r0, %-
	mov	0, %r12
	.word 0x8f930000  ! 851: WRPR_TL_R	wrpr	%r12, %r0, %tl
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	.word 0xb3520000  ! 855: RDPR_PIL	<illegal instruction>
	.word 0xb7a54940  ! 856: FMULd	fmuld	%f52, %f0, %f58
	.word 0xb5a00020  ! 858: FMOVs	fmovs	%f0, %f26
	.word 0xb9a00560  ! 860: FSQRTq	fsqrt	
	.word 0xb5510000  ! 862: RDPR_TICK	<illegal instruction>
hwintr_1_45:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_45), 16, 16)) -> intp(1, 0, 36)
	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0x8395e0ef  ! 873: WRPR_TNPC_I	wrpr	%r23, 0x00ef, %tnpc
	.word 0xb9a88820  ! 875: FMOVLE	fmovs	%fcc1, %f0, %f28
	.word 0x85956124  ! 877: WRPR_TSTATE_I	wrpr	%r21, 0x0124, %tstate
	.word 0xb1a94820  ! 881: FMOVCS	fmovs	%fcc1, %f0, %f24
	.word 0xbe340000  ! 882: SUBC_R	orn 	%r16, %r0, %r31
	.word 0xbbab4820  ! 885: FMOVCC	fmovs	%fcc1, %f0, %f29
	.word 0xb42ca088  ! 886: ANDN_I	andn 	%r18, 0x0088, %r26
	mov	0, %r12
	.word 0x8f930000  ! 887: WRPR_TL_R	wrpr	%r12, %r0, %tl
	setx	0x13861ecc0000ab97, %g1, %r10
	.word 0x819a8000  ! 888: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xbda50940  ! 891: FMULd	fmuld	%f20, %f0, %f30
	.word 0xb9a81420  ! 893: FMOVRNZ	dis not found

	ta	T_CHANGE_HPRIV
	mov	0x80, %g1
	mov	0x1c0, %g2
!	stxa	%g2, [%g1] 0x40
	ta	T_CHANGE_NONHPRIV
	.word 0x8794a0e2  ! 899: WRPR_TT_I	wrpr	%r18, 0x00e2, %tt
	.word 0xb7a5c960  ! 901: FMULq	dis not found

hwintr_1_46:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_46), 16, 16)) -> intp(1, 0, 16)
	.word 0xbf510000  ! 904: RDPR_TICK	<illegal instruction>
	.word 0xbfa589c0  ! 905: FDIVd	fdivd	%f22, %f0, %f62
	.word 0xbf51c000  ! 909: RDPR_TL	<illegal instruction>
	.word 0xb5ab0820  ! 914: FMOVGU	fmovs	%fcc1, %f0, %f26
	.word 0xbdaa4820  ! 920: FMOVNE	fmovs	%fcc1, %f0, %f30
	.word 0xb214c000  ! 921: OR_R	or 	%r19, %r0, %r25
	.word 0xb1a40920  ! 923: FMULs	fmuls	%f16, %f0, %f24
	.word 0xbba81420  ! 925: FMOVRNZ	dis not found

	.word 0xb1a81c20  ! 927: FMOVRGEZ	dis not found

	.word 0xbda8c820  ! 930: FMOVL	fmovs	%fcc1, %f0, %f30
hwintr_1_47:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_47), 16, 16)) -> intp(1, 0, 36)
	.word 0xb9a508e0  ! 932: FSUBq	dis not found

	.word 0xb5a40820  ! 933: FADDs	fadds	%f16, %f0, %f26
	.word 0x89942182  ! 934: WRPR_TICK_I	wrpr	%r16, 0x0182, %tick
	.word 0xb9a44960  ! 935: FMULq	dis not found

	.word 0xb1a9c820  ! 936: FMOVVS	fmovs	%fcc1, %f0, %f24
	.word 0xb7a00540  ! 938: FSQRTd	fsqrt	
	.word 0xb9a5c960  ! 939: FMULq	dis not found

	.word 0xbba5c920  ! 941: FMULs	fmuls	%f23, %f0, %f29
	.word 0xb5a54960  ! 944: FMULq	dis not found

	.word 0xbfaac820  ! 945: FMOVGE	fmovs	%fcc1, %f0, %f31
	.word 0xbba9c820  ! 951: FMOVVS	fmovs	%fcc1, %f0, %f29
	.word 0xb1480000  ! 953: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xb9a84820  ! 955: FMOVE	fmovs	%fcc1, %f0, %f28
	setx	0x9fb1875a00008905, %g1, %r10
	.word 0x819a8000  ! 956: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
hwintr_1_48:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_48), 16, 16)) -> intp(1, 0, 18)
	.word 0xb3a90820  ! 962: FMOVLEU	fmovs	%fcc1, %f0, %f25
	setx	0x7d43db3200007959, %g1, %r10
	.word 0x839a8000  ! 963: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb7a90820  ! 965: FMOVLEU	fmovs	%fcc1, %f0, %f27
	.word 0xb5480000  ! 966: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xb3a508e0  ! 967: FSUBq	dis not found

	setx	0x1a6e275500007d4f, %g1, %r10
	.word 0x819a8000  ! 972: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb3a58860  ! 977: FADDq	dis not found

	.word 0xb3a409a0  ! 978: FDIVs	fdivs	%f16, %f0, %f25
	.word 0xbbab8820  ! 982: FMOVPOS	fmovs	%fcc1, %f0, %f29
hwintr_1_49:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_49), 16, 16)) -> intp(1, 0, 32)
hwintr_1_50:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_50), 16, 16)) -> intp(1, 0, 2f)
	.word 0xb445e172  ! 985: ADDC_I	addc 	%r23, 0x0172, %r26
	setx	data_start_7, %g1, %r22
	ta	T_CHANGE_HPRIV
	mov	8, %g1
	stxa	%g0, [%g1] 0x60
	flush
	ta	T_CHANGE_NONHPRIV
	flush
	setx	data_start_1, %g1, %r19
hwintr_1_51:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_51), 16, 16)) -> intp(1, 0, 13)

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

	.xword	0x0feb68180977f9a8
	.xword	0xd87d7d9231a8a6a2
	.xword	0xfeac8a2dc7ab28f8
	.xword	0xf65f9e3be4fd9162
	.xword	0x8a30cfa87bd436cf
	.xword	0x714a3463b3e13846
	.xword	0x15218764b7966d95
	.xword	0x05bf2b6c35332669
	.xword	0xf58f8e987605d188
	.xword	0xa6957804a7a8cc0e
	.xword	0x2d943b14d552ac10
	.xword	0x14c87974e5fb8039
	.xword	0x3270bfdf58c9fea6
	.xword	0xf7d3106e67db5607
	.xword	0x1c8750076683a0c5
	.xword	0xdd9631b6ac1f2df2
	.xword	0x72c88e42ca101eaa
	.xword	0xb0d0699548504250
	.xword	0xcecb7675fa95c082
	.xword	0x5b4a610e1e2ac774
	.xword	0x981c1a459e4b68f6
	.xword	0x3af1cb4b85b46485
	.xword	0xbafe369d866e49e9
	.xword	0x4ebe60ebca1d5e2a
	.xword	0x1f7b6c4f305a100c
	.xword	0x30a2992fbfe84888
	.xword	0x9df06070f26ef34a
	.xword	0x673ba5ada823bd9b
	.xword	0xdda97098921332bf
	.xword	0x9eb194aaf58b2a8e
	.xword	0xffc8b7be984298a8
	.xword	0x91423856400d6301
	.xword	0x15dc78f0f2cc85d0
	.xword	0x762f475fd99e5d03
	.xword	0x45d0c926181621ce
	.xword	0x3a50496dcea3fe8f
	.xword	0x1f402f84eb83d219
	.xword	0xf1b2393038fa0bac
	.xword	0x9e5fa894eb49f401
	.xword	0x91ff8a0864bf97ad
	.xword	0x2f8ca695f38bf90e
	.xword	0xecd2c3282ed15550
	.xword	0xd90fafc614ceb1eb
	.xword	0x334217fd903226ad
	.xword	0x511512e8250c3161
	.xword	0x4d45310c24c91154
	.xword	0xca1dc896313c12a3
	.xword	0x50995b0c5308eaa3
	.xword	0x6bfdec33fa33bcf7
	.xword	0x5d3fc96c07903597
	.xword	0x858f87facff06801
	.xword	0xab5e4edf95cba8a3
	.xword	0x59a8d78e4de5e6b7
	.xword	0xc112bfcd42ee44b6
	.xword	0x62b80ca0faadd7c7
	.xword	0x59c25c40078664c8
	.xword	0xf607d5f0c3aee5af
	.xword	0xa976778d900568f5
	.xword	0x4998297ca6c76db9
	.xword	0xeb72a6959951e18d
	.xword	0x1516e6eed4c2a824
	.xword	0x04f465f090892e51
	.xword	0xf2aaab7ca7c39b91
	.xword	0x3fe9c477fce10522
	.xword	0x822bd94d98e03cba
	.xword	0xc68137263e595a70
	.xword	0xf35c3916cf1a8aab
	.xword	0x48c2580129daffd9
	.xword	0x4faa136d959082ca
	.xword	0x5ca1d21dbeb23c91
	.xword	0x079caa44c1820824
	.xword	0xc27404abc6c9a5d4
	.xword	0xb54575bac5d1374f
	.xword	0xf243aa874c397130
	.xword	0x0e19daf481f17615
	.xword	0x9d4f8471e407ae03
	.xword	0x3157b3bae1853633
	.xword	0xca1148f299203318
	.xword	0x030a8cae28a2bfc0
	.xword	0xae0103837fdaaa63
	.xword	0xba040d1aba5b59a6
	.xword	0xa8e50a6d28f250b3
	.xword	0x39646dadd5efe853
	.xword	0x37ba542a1bb6647c
	.xword	0x457849968b957f55
	.xword	0xc71ca02b740c4bbe
	.xword	0x2f268eb1b54aac7d
	.xword	0x7cef112319857645
	.xword	0x78a4f442872f4e23
	.xword	0xff3d73cdcac1fce0
	.xword	0xb2de5843df07dfed
	.xword	0x329688d1aeee5f8b
	.xword	0xe9c0ef8606239bd3
	.xword	0xe597e08118484f5d
	.xword	0x36b31824c42a1dcd
	.xword	0x1255f9feb81402a0
	.xword	0x049de70a9b90db25
	.xword	0xbd93af9eddfa7e28
	.xword	0x823d66356fae3d6c
	.xword	0x6cc1e374e2b21b7c
	.xword	0x0118a5d293190c30
	.xword	0x19924774923819ea
	.xword	0x8a67fc66885d362a
	.xword	0x8af29c77c1424079
	.xword	0x4af537f18c596335
	.xword	0x54897b7942048f5c
	.xword	0x4f05b03e715fedf4
	.xword	0xdbee7b073fc50560
	.xword	0x85814002bef19943
	.xword	0x97d8ec80e8d7dcf3
	.xword	0xc6dbd1dfd9649acb
	.xword	0x9bb90ff7a64ea26e
	.xword	0x21ab960e5be7c840
	.xword	0xf623aa3dae2414ac
	.xword	0x3dbeb809e9224348
	.xword	0xddf4604a036f0339
	.xword	0x16b5774070da8924
	.xword	0xe17650ba37244d05
	.xword	0xfdf1a3bdce36cbb4
	.xword	0x6fec1303ff2a1bfc
	.xword	0x2c548b107005d6af
	.xword	0xe9331430fb390a7f
	.xword	0xa8766ebd8b610bbc
	.xword	0x687a4936953c74a1
	.xword	0xb33af47a42c5bd0f
	.xword	0x362fed1595b45cd9
	.xword	0x2b44ed01e3936d09
	.xword	0x14720eff2ff4b411
	.xword	0xfa0742c3b9a811b5
	.xword	0x06fd68602131315c
	.xword	0x3fec591e1d02a78f
	.xword	0xff7707d168d259a5
	.xword	0x2e311392bb02ed01
	.xword	0x457d9808b0593668
	.xword	0x93ee01dc13ba6814
	.xword	0x8720384ed02c22ff
	.xword	0x0490da40c0bcacfa
	.xword	0x2b2f98a1d924ae76
	.xword	0x4a8d3c8c164342ba
	.xword	0x4705d7f5b6eda1ca
	.xword	0x99e40489eed42ce6
	.xword	0xe0b6774c6f204690
	.xword	0xa9ee5c56a8384512
	.xword	0x40efd9c3dfef1d06
	.xword	0x6670b3cfa3dae998
	.xword	0xbb48ddba8e8e3076
	.xword	0xa8378052c432023e
	.xword	0x7a6bf8aab6aa8131
	.xword	0x511ad59d50c00c19
	.xword	0xa2497d1d193c08eb
	.xword	0xfb1cdd467e54f9f0
	.xword	0x152b5d56b193bb5a
	.xword	0x78c63afb38b2e8c3
	.xword	0xea820a9b2db36e3e
	.xword	0x5c266b2cc9b76955
	.xword	0x40c7c8413e7eff47
	.xword	0x86714031133317e5
	.xword	0xf7e5ce07e2703806
	.xword	0x9104f9a107fabc78
	.xword	0xba538b31be94bc3e
	.xword	0x02a86f97e85fb2a3
	.xword	0x1bf2c7fb6d1828ac
	.xword	0x9491e4914669095e
	.xword	0x67c5541f095a760f
	.xword	0x30965204bba07c71
	.xword	0x1fbbf9d8b8b95aef
	.xword	0xf93c1ec732171682
	.xword	0xaa7acd031e9d8ca4
	.xword	0x8f0d140a360e6ee2
	.xword	0x5d84e8647f2926c0
	.xword	0xcb9806c54ac38bf2
	.xword	0x8d7622b5b82767b2
	.xword	0x07431f88acf34ddf
	.xword	0xa4e9f89fb21a9d5b
	.xword	0xf876c9d3c2fd604a
	.xword	0xdf626aa9cc31f5cb
	.xword	0x9f859a19340d6932
	.xword	0x863199e43fd8522a
	.xword	0xe22e4b61f7cafa41
	.xword	0x903b845c894a7a29
	.xword	0x8ff0fe6e97393b35
	.xword	0x42825de49b8fd0f7
	.xword	0xd755a943d44d2486
	.xword	0xc244c725fe3913e5
	.xword	0x301b03b9deaaaffb
	.xword	0x9d711f176f0cd4e5
	.xword	0x3b59315895dea2f9
	.xword	0xdf755ff9e0b0d681
	.xword	0x761d803d6fb71b95
	.xword	0x77d3233274d5649e
	.xword	0x1da27cf9d0b61b20
	.xword	0x6ee3f0282f4c70f8
	.xword	0x227a7154002d0bc4
	.xword	0x9c544b2886186062
	.xword	0xeb67a1d018ac7abd
	.xword	0x26c2e9bf3e666d4d
	.xword	0x7bb4fa8a9c6375a5
	.xword	0x04c365be5a21e3fc
	.xword	0xad82545b8235d67a
	.xword	0x7ea0a1f04385c2cd
	.xword	0xed662287b7551616
	.xword	0x9ce45301f4c696ac
	.xword	0x92e75d920d993863
	.xword	0x6c897dbbb6eb1381
	.xword	0x322953bf37e0ad61
	.xword	0x77674449d6f77f50
	.xword	0xb0da31fcd2b7c7b8
	.xword	0x938228a62712030c
	.xword	0xdb587827cc343b1f
	.xword	0xd2b8937988162f19
	.xword	0x8a438cfc0a0478b5
	.xword	0xc05760cb259b0401
	.xword	0x7ec419b645e7e96c
	.xword	0xede806db26830041
	.xword	0x4ce5339e86f1043a
	.xword	0x22e74853dac9fb26
	.xword	0x48caddca4817d5f6
	.xword	0xcfb92b21a145f91c
	.xword	0x4ca9408e93d914d2
	.xword	0xd5f919a5ffd6499b
	.xword	0x9e92621b2a07145f
	.xword	0x5be0b751cef1bec2
	.xword	0x9ed01a2d42d58bec
	.xword	0x28e03ba52decd98c
	.xword	0x1c58b2e99e4892da
	.xword	0x690cba23a42c1f39
	.xword	0xb4e827bd3378b476
	.xword	0x4f46c65ba2a68d45
	.xword	0x565b3486f6d71c2d
	.xword	0x97b977e63ac23a16
	.xword	0x44d1fbf9c9344b9e
	.xword	0xc5bd85350bb16594
	.xword	0xa025dc9049eedc97
	.xword	0x193f2e879271a780
	.xword	0xb4da775bc28eae57
	.xword	0x19d1b655920dd7e3
	.xword	0xae97224c56f4eb46
	.xword	0x35e46b778d0e5ef0
	.xword	0x9ca2c570d898eb2b
	.xword	0x1dc8c4f78b124056
	.xword	0x658e269a41d98991
	.xword	0xe5f88d4bc6dffd3f
	.xword	0x917add7fccc3cfb8
	.xword	0xe4c4d72a44bc0df2
	.xword	0x570d7c246f28be86
	.xword	0x4077cb9a8b33270d
	.xword	0x22706551971c1d1c
	.xword	0x8ab47bb5a7b4729e
	.xword	0x04eababf990fc5b4
	.xword	0x77da8ba904d10282
	.xword	0x874542969f7061ef
	.xword	0x10df83ca5e76c2fd
	.xword	0x55b6bd5776e9dee8
	.xword	0xf993419e071d6d4b
	.xword	0x04773542b47d1c99
	.xword	0x91aded1887f19b2a
	.align 0x2000
	.data
data_start_1:

	.xword	0x0fa7cd70f23d658e
	.xword	0xc118bdb0c449ea7a
	.xword	0xd80765c540f7d045
	.xword	0xd03b884129c0638d
	.xword	0x2108207766f5a7e4
	.xword	0x95b9e1051d85a7b2
	.xword	0xfe8d383d513dd03d
	.xword	0x96c9754fc154f87a
	.xword	0xf83df239b7a1dc4c
	.xword	0xf48c261cbc3969e1
	.xword	0xc3a080966cf578f0
	.xword	0x6b977a6cb5096fda
	.xword	0x3d6cfbd6332eb79b
	.xword	0xf9f6dcdaf50236b3
	.xword	0xf00dbf3930228fb9
	.xword	0xe66537d3f5e9155f
	.xword	0xba3bf478c7e7fcaf
	.xword	0xe7ca19db76a69049
	.xword	0x1af18335ff4f1c65
	.xword	0xf63ac4ab3524cfb4
	.xword	0x0fd4af9682dba8a8
	.xword	0xb2204f5630aa13ff
	.xword	0xb7eebd7b3650540e
	.xword	0xc263d267f206e97e
	.xword	0x79f07eba9ad869bf
	.xword	0x2c1038dabc044141
	.xword	0xbbae861f4a170a24
	.xword	0xd1c1c8aa2330902f
	.xword	0x66b4e06925cb5248
	.xword	0xc496fc8af75d3fb3
	.xword	0xba093f61c2c4bf39
	.xword	0xfc348901fe419317
	.xword	0x992a6ad28a77f2e2
	.xword	0xf7f25b8b41bcf318
	.xword	0x1da2adc315458097
	.xword	0x9585a222dff1f0a9
	.xword	0x8790a79850987ec9
	.xword	0x9b073f46cc9d45d0
	.xword	0x51f0145a170e668d
	.xword	0x843ad7cc0cb55fed
	.xword	0x2c1744a7328a4ebd
	.xword	0x4ff4c0c27fd24cd5
	.xword	0xc7df3bab6609c02c
	.xword	0x147ed145b42b9495
	.xword	0x9597124a27783e32
	.xword	0xb1b29b95b19de7b1
	.xword	0xfbb51bd3ae9a55d2
	.xword	0xef918b37e30c4a50
	.xword	0x4221424f0dd87330
	.xword	0x715e9787a454e19b
	.xword	0x44d1afb3a92c3b71
	.xword	0x4c753b3a1dee5964
	.xword	0x1830fdba2c2251fb
	.xword	0x376e24f628055f29
	.xword	0x8bebf04ed00cad9d
	.xword	0xb88cc4ab71ba1b30
	.xword	0xcc103eaee3ba79e0
	.xword	0xc2060dd4838581da
	.xword	0x3218b72fee469344
	.xword	0x04f2675ee7a1571e
	.xword	0xc5e07dd7873b6627
	.xword	0xc374366e1b685eb6
	.xword	0xaf5ef1ffd83d2b41
	.xword	0x4b53af21de6c6c01
	.xword	0x09daae9b64295622
	.xword	0x3ad7344beb9f29cf
	.xword	0xb28e2ba498f0de4f
	.xword	0x231449420c8af4d8
	.xword	0x83b0914a440c6cb3
	.xword	0xbcff9ffeb631502c
	.xword	0x04438efcef960163
	.xword	0xd50c62ab6839ef6e
	.xword	0x6dbb13ec2415bc12
	.xword	0x5bf4998273d31e8c
	.xword	0xb604e8a58041279d
	.xword	0xb0f1ad0622eb47b7
	.xword	0xc7090cc29bd320e5
	.xword	0x1b9374d19f7f88c0
	.xword	0x90664bc2d213449e
	.xword	0xaf61869d62c5f10c
	.xword	0x161c3b8e3384a146
	.xword	0xb102bab1c8def95d
	.xword	0xe9a043912ac6ae80
	.xword	0xf286635ca8cdbbe9
	.xword	0x5136e418781d5453
	.xword	0x49b5306fd9123f7d
	.xword	0xac69ac61d8979bc2
	.xword	0x142561f75a0aa42b
	.xword	0xf7cd2a72f88f185e
	.xword	0x4e5cb767ee06c9ec
	.xword	0xc3558a08468edf39
	.xword	0xaeadd4bc470d84d2
	.xword	0xf70458ec64a57c2b
	.xword	0xd0ea0d42e0c307b4
	.xword	0xa74bb2bfbfa60566
	.xword	0xa28eb1fe6c2a1c5a
	.xword	0xd4b45a3def057ed9
	.xword	0x28707c056fbdae4e
	.xword	0x467bd691d658dc1b
	.xword	0x6b5ebfb651400cb8
	.xword	0xf9332c2d90ab76b9
	.xword	0x32ed2b4068a163a9
	.xword	0xd7855a72006d8d3d
	.xword	0xa6491e3c12a5cdfd
	.xword	0x21bd446d4542dbe0
	.xword	0xb6f1b3ca3af16407
	.xword	0x0df9ad760e3cbd49
	.xword	0x8996975c1ea6326b
	.xword	0x3993098dd69c6173
	.xword	0x8fded2f2c560e2bf
	.xword	0x27ce828748b04738
	.xword	0x2000407fbbb26bcf
	.xword	0xe435cf38c4caff2c
	.xword	0xee6c088915df5adb
	.xword	0x4c6f84b3d6f53012
	.xword	0x5c3e02576cd10b1c
	.xword	0xce2f2c3300d108ec
	.xword	0xca692bd6d52c4b8c
	.xword	0x053ec8c848b85ec7
	.xword	0x84ebecbbefb181f6
	.xword	0x986a41802cb73c83
	.xword	0x6d4ce0f62a8b5933
	.xword	0x7779fed1403861eb
	.xword	0xec61832196e463fa
	.xword	0x08315e5ff890cb20
	.xword	0xb3bdca9f6c09a8a4
	.xword	0xabeb4c4e275751c1
	.xword	0x9dc99d14e02abe1c
	.xword	0x5ec58a458254602b
	.xword	0x5efc438b77f05bf6
	.xword	0x3f0c9f03d5c41988
	.xword	0xef819b89a4f306dc
	.xword	0x235c193eed1c333d
	.xword	0xcf7684613dd07cae
	.xword	0xe9272cd012e13d01
	.xword	0x6ee4cefdf879d28d
	.xword	0x584c2f5cddb209fb
	.xword	0xd270345c50e86e7d
	.xword	0x5e4ed52f10ecfa16
	.xword	0x5ea5e6adace1cf5e
	.xword	0x5a7e96b5a7cf8a2d
	.xword	0xd01b0fc754cc2747
	.xword	0x23259e5479ad61bd
	.xword	0xdbbc7ca85ddd19d7
	.xword	0x9391c79321ce159c
	.xword	0x16796806e3f8b92a
	.xword	0x2ecbe971f3c09afc
	.xword	0x4c275d349b672519
	.xword	0x2606ee2b0c9fd795
	.xword	0xe90fa484ae44b6a7
	.xword	0x5518db1c85b3e047
	.xword	0xdc3963c3c2673c9a
	.xword	0x5c0eb254beba123d
	.xword	0xa015fc6504096dd1
	.xword	0x2bd824e9086cda9d
	.xword	0x5f47e2bd2fd813e5
	.xword	0xcac44ab961d0b86b
	.xword	0x33588f35818ea15a
	.xword	0xd241e2bd113fa58c
	.xword	0xa84cb2a43bea35d3
	.xword	0xb8f722e71c70fffb
	.xword	0x00240313a2a8e43f
	.xword	0xb50abf2706dfdd7c
	.xword	0x0044c8ef422dff4d
	.xword	0x9b7099298182b0f0
	.xword	0xbad2e2f6593f5c5b
	.xword	0x1d05b2a4f1815986
	.xword	0x8ffe496f76b323f6
	.xword	0x6f223d85e89f6f1d
	.xword	0xe6be702c76afe1e3
	.xword	0xd677d784523277c6
	.xword	0x007f47548ed59e8c
	.xword	0xef432d655cf9395a
	.xword	0x3cd035ee6b2e7732
	.xword	0x64eb38e23f6e49da
	.xword	0xcf95647768f92b3b
	.xword	0x30589b8522f403a8
	.xword	0x819e617199ba4312
	.xword	0x660cd7f23565b837
	.xword	0xa8a31a1ec576d6f4
	.xword	0x38f1f51009789fab
	.xword	0xb337a5cad8d78eeb
	.xword	0x91ad2d48af0202b9
	.xword	0x4a61bfc471216cd1
	.xword	0xd4beb4e3199eeaf3
	.xword	0x61f64da5d583cdba
	.xword	0xbf9470fa3c59c3db
	.xword	0x8564d41d21c8c585
	.xword	0xbd908b8c1f0e5f99
	.xword	0x7bfe2de65d8da489
	.xword	0x5791c72cfbb44d78
	.xword	0x7c862307cc05ed07
	.xword	0x0c65fbd97e9f92e0
	.xword	0xa856ce4c230f960a
	.xword	0x106eb240b892a885
	.xword	0xd17cbbe9fd76b4f7
	.xword	0x6e08f8bca4430659
	.xword	0xac76e27b4179b7ad
	.xword	0x41e842fe57b4f236
	.xword	0x2a970026a8898abc
	.xword	0xdbb958af1586fce9
	.xword	0x1ba0ec81295a0497
	.xword	0x49045cd6e7c0a259
	.xword	0x45578a97cdef184f
	.xword	0x6686c4931c9d86ed
	.xword	0x16a7779c846c0df6
	.xword	0x1d916331da371528
	.xword	0xd0c84f1c9a41fb18
	.xword	0x9d455643fa6c8d17
	.xword	0xd7c5c048c4f3c72c
	.xword	0x18c0e882f8d8a53d
	.xword	0x1d9f7dda2b4b178a
	.xword	0xc9eefef6c64653c2
	.xword	0x9e4601c78de14f6f
	.xword	0x4d5175ad883b86a0
	.xword	0x6c818ebeb69ed3bf
	.xword	0x16f05de611acf716
	.xword	0xcdb9180318009d9b
	.xword	0xcc6fac9bb315899a
	.xword	0x3f241e61ed19a3fb
	.xword	0x0ad924bcbeb9df41
	.xword	0xb1000f55a14cb837
	.xword	0xc415c0168d203c83
	.xword	0x5c6d5a32b7c81ac9
	.xword	0x9b6900f3bee8ff93
	.xword	0x0f49ed43efd38abb
	.xword	0x23473ecb52a29710
	.xword	0xbb4778cc823e647f
	.xword	0x0254b24a26fc503a
	.xword	0xef2dc57bc9cf5f17
	.xword	0xd3ee3a26d4f20d26
	.xword	0x042a13dc62b549ee
	.xword	0x8c04f1023e69e9d8
	.xword	0x64a9fb9072280c1c
	.xword	0x18585f1a74e80e6e
	.xword	0x8e2131734d19dd42
	.xword	0x6ae49231e52b03cd
	.xword	0x133adf4fe6cca196
	.xword	0xb7be4798f2654184
	.xword	0xc58f5b3786d722fe
	.xword	0x3b8bf54c672c9a65
	.xword	0x7304d6a0ea618841
	.xword	0x7525af595e62c983
	.xword	0x2bb9b3bff0f3b8da
	.xword	0xaa14bfeefbed57e2
	.xword	0x2bda669ba0cd2d7b
	.xword	0xc7ac7abd99e5e03b
	.xword	0xcf763c0fd3328079
	.xword	0x9e0cb768794b720c
	.xword	0xbe581decc5e3e8d6
	.xword	0x59d9399b8cab000f
	.xword	0x19dafc688efee150
	.xword	0x26ffa126893f6b05
	.xword	0x46619485f443cb70
	.xword	0x2bface57f07c43af
	.xword	0xb87cfdaad9c98270
	.align 0x4000
	.data
data_start_2:

	.xword	0xec90ffca228fabf9
	.xword	0x6828da39385e4baa
	.xword	0xa33617dac7bb8076
	.xword	0x03aae4f3c370969d
	.xword	0xf6716dc4e2f70e47
	.xword	0xb63993b2626b49b1
	.xword	0xf67bacadaf5dfab0
	.xword	0x97f2c15bf3c52868
	.xword	0x45c028bd243e1770
	.xword	0xaadd4d98aacc0315
	.xword	0xa8633507866e99c2
	.xword	0x93854ea64d7364c7
	.xword	0xc96a39b79a99fd7c
	.xword	0xdb4e8ca1d8aa6243
	.xword	0x7864a85f5a3572f5
	.xword	0xe211088a8f9d2435
	.xword	0x1c7c7a34d16ce08a
	.xword	0x989513e0a337f5b5
	.xword	0xa61199dafc45e04b
	.xword	0x38f9fba7f9042a3d
	.xword	0x7fd0bfa00e4493ae
	.xword	0xe5949566ba38ea9d
	.xword	0x09f4232a133ad995
	.xword	0x40a0c5b0daaf1a56
	.xword	0x8820becc076ef2fa
	.xword	0xedffcc44855dfff0
	.xword	0x8634c03cd3886dfd
	.xword	0x794d225fbd2ae196
	.xword	0x1f14b06a96f82cb1
	.xword	0x0ecfb209ec8c6b97
	.xword	0xb1c0342472109f9c
	.xword	0xb2a1398074374121
	.xword	0xe84177a8ba6ccdd6
	.xword	0x965c327d08323434
	.xword	0x83e5bf40df9252f6
	.xword	0x253ddc712a1228ad
	.xword	0x16ef79226b1a9c69
	.xword	0x8585ba3207a145f3
	.xword	0x51bbbb063e823cff
	.xword	0x6ce8ac91081fbfcf
	.xword	0x702f20c7c1400ca5
	.xword	0x20c148222e998298
	.xword	0x30ac0ec901a4903f
	.xword	0x6c84bec8a94974b8
	.xword	0xc4d6620a2162684d
	.xword	0x803d8c9a595066b3
	.xword	0xff6107fe7ba4f218
	.xword	0x66704f15d1b3f508
	.xword	0xe860c401a4be3383
	.xword	0x78b908cd629669c9
	.xword	0x7ee47bba4594be07
	.xword	0x7efca7416ee688c8
	.xword	0xec858638ccad600a
	.xword	0xc06ecb1c79acf718
	.xword	0x71844ae512f4d337
	.xword	0x5696e623cd2d201d
	.xword	0x8a58e1e964fd35da
	.xword	0x3f4a1f2dac8577f6
	.xword	0xf712870dfa359683
	.xword	0x2a695177627ccf22
	.xword	0x0e9a7cc347bf272d
	.xword	0x1fd534051bfef94d
	.xword	0x304b79e4345cc41b
	.xword	0x3162c887c34ff5ff
	.xword	0x3459d07e4a021d73
	.xword	0xc873d60a8c0557ef
	.xword	0x31647ba48cc60bec
	.xword	0x99e31d7910aee361
	.xword	0x76efa20358192c31
	.xword	0xac1e16b10c578dd0
	.xword	0xe9da097c27dfd806
	.xword	0x73f7b51cce420b86
	.xword	0x353ac650b811097e
	.xword	0xaeb8f434ee2b65b7
	.xword	0xc10cec8bde7a4729
	.xword	0xeb229b64ff3ced33
	.xword	0x17ce1d2fef4422fb
	.xword	0x7f0fc5edb6ea8d64
	.xword	0x0ead4f4aaac679e2
	.xword	0x3bf47d5a6d4bd1aa
	.xword	0xa75a227cd83950a8
	.xword	0xade1e2258d9ba4d4
	.xword	0x24dc21944a8d50ec
	.xword	0x4f71bff12a69790c
	.xword	0x0ffe039282acd277
	.xword	0x3f4d34d867b6fb47
	.xword	0x6e62a06186175781
	.xword	0x616fa34650e34073
	.xword	0x2bef888c46aec393
	.xword	0xfd2804bcb6aa19dc
	.xword	0x171550f88874d4e2
	.xword	0xf3b86965dfae53bb
	.xword	0xfab4b34a72fd953f
	.xword	0xb7e36d4b501abe48
	.xword	0xee30bf59dab7677d
	.xword	0xd6e4db76849eef55
	.xword	0x08c79e5c47149d57
	.xword	0xde88530afc28e5bb
	.xword	0x1794d15c5ca65367
	.xword	0xc00d903748bfc12c
	.xword	0xbef62a3aa248178e
	.xword	0xcc6d24256a4a1a1d
	.xword	0x35e8320b7287e6a8
	.xword	0xf1526e029f3a6842
	.xword	0x79d004a4422ddc2d
	.xword	0xd40a15a27376f661
	.xword	0x8b730c1b1b10aef8
	.xword	0x78dcef2de789e586
	.xword	0x20d57fada7a604dd
	.xword	0xb686cb1a2eb17512
	.xword	0xa7c8ee9b3fdc81e1
	.xword	0x1dd1e8c26834be4f
	.xword	0xda7ae0ddeb9c8ed7
	.xword	0x878a16c6e63c4c5b
	.xword	0xe1b7ea0018988e28
	.xword	0xccba98f045d312bd
	.xword	0x4d690ca729db655f
	.xword	0x476a661b5535b689
	.xword	0xfa8c09234e377d59
	.xword	0xbe4e3e3e40b36e9e
	.xword	0xe69f6ba83440f4b6
	.xword	0x722eafadc3d3a014
	.xword	0x4419c48a201f50c7
	.xword	0x33eaf97e2b940233
	.xword	0xa8b6fa4f6dd8421f
	.xword	0x322ca64a1910db41
	.xword	0xb2bc450d5dfb169d
	.xword	0xf3e5bdb8073d2727
	.xword	0x5fa666098a196397
	.xword	0x19b97ffd0915e596
	.xword	0xd5aa210c1e5dcab9
	.xword	0x12af75a137e3c60c
	.xword	0x1fb6cf0ac785b70f
	.xword	0xea9dcb27eb6ca001
	.xword	0xa8508046c91b3d61
	.xword	0x742ae148e05d5156
	.xword	0xd771582ed870dc14
	.xword	0x724759726c0f8499
	.xword	0xb7c60c1ace4c2ded
	.xword	0x08fd748ea77cd400
	.xword	0x6a693a0e2859cff7
	.xword	0xa9e00fd27d1794a6
	.xword	0xb38b03e11e7bdd4c
	.xword	0xf4d7a97070e3be29
	.xword	0x81bab10dfd494220
	.xword	0x9b754a5b28cf200e
	.xword	0xad1a53f0eb172337
	.xword	0x62b23a222e8284f5
	.xword	0xd7e0c59e85d42bc2
	.xword	0xaae63ce89bdb6c90
	.xword	0x3dd2a813279ba909
	.xword	0xd57f24a6f3cc7ebb
	.xword	0x1bd5f912cc589d2d
	.xword	0xf5cecc3e48740ff4
	.xword	0xf87fcb8b26cb7185
	.xword	0x203872f1cba17d9a
	.xword	0xdd18dedc992b5e51
	.xword	0x35727072d0814d37
	.xword	0xa3a64228a693571c
	.xword	0x6bab997ac4faf846
	.xword	0x29dd65c9800b336c
	.xword	0x6f5305e189567380
	.xword	0x184ea2fda60c45e8
	.xword	0xc86b04080c5c764f
	.xword	0x8141f1f1e82f22f0
	.xword	0xf9ae72ef7575db44
	.xword	0xa618a71f4052632c
	.xword	0x6a0953da779de961
	.xword	0xd7eacc2f670f361f
	.xword	0xafcd3ec06f2279c8
	.xword	0xc3a5a289cccca0a5
	.xword	0x2dd65ae8a071a3e4
	.xword	0xacf7fd4aea09a6e8
	.xword	0xfa67de7763db21eb
	.xword	0xb4519b554bbaf990
	.xword	0x8865ffaf00d7c345
	.xword	0xe44c33a070ba5f0f
	.xword	0x6f00da54f191b762
	.xword	0x79725d327dd2d2b3
	.xword	0x50ed8622549b975f
	.xword	0x98d42e66234e8fa4
	.xword	0x63de333e321bca38
	.xword	0x3ed12ea929c99678
	.xword	0x2d639796269b3432
	.xword	0x04845ac29944b7e5
	.xword	0xc733c066271e7067
	.xword	0x9323b7fdd7e30443
	.xword	0xbecb0a787bba157d
	.xword	0x4464b32aa78d5f37
	.xword	0xce8c372d7d10e01f
	.xword	0x303ac058a36bc5f4
	.xword	0x8f1ac55d3d586f75
	.xword	0x90b9ec8eda3388d9
	.xword	0xea74c59560204fc5
	.xword	0x3f2a66ef752c0f0c
	.xword	0xb21e69bdcd780370
	.xword	0x20358ec7cbea1bfd
	.xword	0x17ffb0df93f1dc09
	.xword	0xd3cc2594767d0768
	.xword	0x99c0b3f146eb4ca6
	.xword	0x8261a8e00c57573d
	.xword	0x42b2f188d1c9c37a
	.xword	0x6f112adc9d493922
	.xword	0x781682418963e354
	.xword	0x03ec45b9195e2da3
	.xword	0x548982fd3494e47c
	.xword	0x172e8b4810759e5d
	.xword	0x36576a0a47a0691e
	.xword	0x05655b456569d4d4
	.xword	0x4e08e336581c0502
	.xword	0xe282af53d96c6a5c
	.xword	0xaa90fd80b4405031
	.xword	0xf9d075a400b60f65
	.xword	0x9973f4d10b825972
	.xword	0x098ac608e11d1c1c
	.xword	0x220976598421981b
	.xword	0xa9e15ba0ca3f6934
	.xword	0x77e3e12e0c14d6c4
	.xword	0x240c4f9722fe64cc
	.xword	0x0cb68114ded83305
	.xword	0xc2b25e3d952c796b
	.xword	0x2038365bae9a7602
	.xword	0xdc1f93e6f9b7cad8
	.xword	0x7e58e27857593378
	.xword	0x3943004a1eaedd2d
	.xword	0x9e28e49dd82c4e77
	.xword	0xdb11f4bfcf42b685
	.xword	0x208b79fc956fd633
	.xword	0x1889d1db904d0e3d
	.xword	0xaac2b123a69ca315
	.xword	0x1656d7966a53aa9e
	.xword	0xf5bd81ac2d534a50
	.xword	0xf47c2cbf6ea3cbb2
	.xword	0xe3a5538009597378
	.xword	0xef0032c5fda3d639
	.xword	0x09739b3eaaf8e3f0
	.xword	0xcadf131e6d519924
	.xword	0xef100f7c74325d05
	.xword	0x6379c89071852575
	.xword	0x48bc1f6c5f0167bc
	.xword	0x4120417406195e2e
	.xword	0x88fdb50e9ad8206e
	.xword	0xee2fbf51f8c55e4f
	.xword	0x4974d5e51acc0095
	.xword	0x486864aaccf6bb0b
	.xword	0x28be33412c83d749
	.xword	0x84b79f8ff5cd0adc
	.xword	0x5288d38cdf4a5765
	.xword	0x635898adaa4238f7
	.xword	0xa281ec88e6ea33c6
	.xword	0xd48f277e639634f2
	.xword	0xcd99f50a3fba2de9
	.xword	0x2cb77df97e5a3db4
	.xword	0xa926b3e46678b001
	.xword	0x6f61d2ab6038b5b5
	.xword	0x99b9134476665d52
	.align 0x8000
	.data
data_start_3:

	.xword	0xdf5f7a8d5f01e30d
	.xword	0x719dff84c35b625e
	.xword	0x14ffcea8a2d063f1
	.xword	0x755e2df8ee881b2e
	.xword	0x4bdd885001185f07
	.xword	0xd850bdd244546606
	.xword	0xf6c629a63869b416
	.xword	0x07756b066204a0bf
	.xword	0x628a54ba12b75dfe
	.xword	0x49a668c46fdecd30
	.xword	0xc5238044b521fe23
	.xword	0x66d38355ed323174
	.xword	0xcde4190cab259044
	.xword	0xa47da315f6cea438
	.xword	0x02b6de58d0eb362e
	.xword	0xff8c347b3f5b18aa
	.xword	0x68f084a882a6e2ac
	.xword	0x61a03f948d0827b5
	.xword	0x479477f2e7e0c6bd
	.xword	0x8961019ddb921af4
	.xword	0xf07b65d67132a2d9
	.xword	0x577302989de7aeee
	.xword	0x5aa4b3dba4355e9c
	.xword	0x8ea60e0ce4f1c9c3
	.xword	0x0b054d10e6d1d33d
	.xword	0xf85774d07d0238fb
	.xword	0xdc3cd33b84eed99a
	.xword	0xb975a6e1fd14dbff
	.xword	0x229be60ab587f98b
	.xword	0x87626ad9c6c0ef6d
	.xword	0x071825ccad1d2959
	.xword	0x90c40b87d3c6cfe6
	.xword	0x6fb2d214b253ba80
	.xword	0x366e258719df9ac2
	.xword	0xc8048bc0ce568c54
	.xword	0xd5d8c435501258cf
	.xword	0x76ec46fae4410689
	.xword	0x3a197155f88cb774
	.xword	0xb0fb32d013465364
	.xword	0xfaba3c66de578ea1
	.xword	0x11eff034a82b7ce0
	.xword	0x8b2c2cd240eda7e2
	.xword	0x8df7363a12fdae82
	.xword	0xb181929648fe1753
	.xword	0x636e7f69780059b0
	.xword	0x9e3ea595efb9702c
	.xword	0x622e99220507c2f4
	.xword	0x6476e41c419e3cbb
	.xword	0xba338b3dd4f283e4
	.xword	0x18d7932a636945b9
	.xword	0x77af491d74413d30
	.xword	0x57847e9c261c00d4
	.xword	0x11c4e0d5c56ea7eb
	.xword	0xee785bb8e88fe92f
	.xword	0x7b2589e014c3b217
	.xword	0xa23302c402355b12
	.xword	0x7e6d558d6463ad7e
	.xword	0xd40f006b0bc2bd53
	.xword	0x0835d2d091337bde
	.xword	0x11a6b43e819b5472
	.xword	0xccf6c9ff51587e12
	.xword	0xb81cc470b18a755e
	.xword	0xd6f5f0b1d30d2d3e
	.xword	0x6b4dc48683d7267d
	.xword	0x753b14d07266a7de
	.xword	0x563fb4764aad8376
	.xword	0xb7426f327ebdb0c7
	.xword	0xe873b8349484c043
	.xword	0xe653d76be00171f7
	.xword	0x6bf78127c4d7c359
	.xword	0x6299bc8e44d540b2
	.xword	0x0f7fd33dc4d460ec
	.xword	0xc93fa70caa6ab044
	.xword	0xc29a25f4aa77bbfb
	.xword	0x0c4cd6d5f684f291
	.xword	0xdffbde1d7b890b12
	.xword	0x4b79fb07bccbb81b
	.xword	0x115089a34463e61b
	.xword	0x3b873a35d48957df
	.xword	0x43e3ae1fa2dce817
	.xword	0xebe55857e2a17f5f
	.xword	0x3290e240483a7b0b
	.xword	0xb29e636d646a2d49
	.xword	0x26d9fae0105332b5
	.xword	0xdb265baed5a108c1
	.xword	0xea4d01691d2e4dac
	.xword	0x88f2c537fe18e42a
	.xword	0x6badd66eb3eacb69
	.xword	0x59389dbc6e1ae0c1
	.xword	0x2f60c881d102d66e
	.xword	0x152bb232e1057223
	.xword	0x83751c46739b1653
	.xword	0x01dd6cb0da225787
	.xword	0x1c28e2742efbba79
	.xword	0x896efdee0e482037
	.xword	0x084333f22e65a229
	.xword	0xf7cddf5097e5c69c
	.xword	0x35264089863af638
	.xword	0x47a3e460047aea3c
	.xword	0x758ee85a4d5561ef
	.xword	0x423e4a659a579ffc
	.xword	0x35195295181105de
	.xword	0xe88387a4457f6626
	.xword	0x81efacf0781d3365
	.xword	0x6b1001e17aaf18b4
	.xword	0x4073e25d5b9c7ced
	.xword	0x95d33603ef8fbbe2
	.xword	0xd1241e039d304cb6
	.xword	0x66dd57cdb7036796
	.xword	0xca82eeb06317a6e3
	.xword	0xb73e9e6ba5732af5
	.xword	0xa42a4e70c0c9f73e
	.xword	0x0e838541091efec5
	.xword	0x9abddaa635e85299
	.xword	0x297ffa53164a7b09
	.xword	0x359efd78147a63d9
	.xword	0xdb73d66400b8e21e
	.xword	0x5bd2675af949582c
	.xword	0xe9f759ce605ee85e
	.xword	0xfa419dd860466642
	.xword	0x75a0de648262693a
	.xword	0x5651d7774b8556ae
	.xword	0x423c1979ba29ae37
	.xword	0x8562aae4d3d8dff8
	.xword	0xf8398bb32eb3309b
	.xword	0x71a007fea00b1a37
	.xword	0x63285c3cc9e5f25c
	.xword	0x25ae1914c1e19aa5
	.xword	0x659a0069e2128d97
	.xword	0x3fee4c41d55501df
	.xword	0xcbe7ac896daa1df7
	.xword	0x31cb688042868016
	.xword	0x243e0c984daa0f10
	.xword	0xbf396d8c4e402082
	.xword	0x4d8f735a992caa43
	.xword	0x97a31b938d99b901
	.xword	0xb3a658be6201178c
	.xword	0x1fdb0e8216c6485c
	.xword	0x37fae379aa86b082
	.xword	0x1ef197fd44c55456
	.xword	0x31616bdb8186a60d
	.xword	0xad98da0d51b0e0c1
	.xword	0x4c0f97bbea780206
	.xword	0x5836213a517709da
	.xword	0xd1b14ec0000d612d
	.xword	0x065ff6db3802a601
	.xword	0x8f199db0337a26dd
	.xword	0xf7a3e048abcc8b02
	.xword	0xe8c863101f5b8d97
	.xword	0xd39090b19e876dcb
	.xword	0x80ccac4c09553487
	.xword	0xdeca170e9d47fb14
	.xword	0x7dc8f26a2a0bd86b
	.xword	0x86029d5463a06587
	.xword	0x317a76feaf193347
	.xword	0x474728aed6f4d791
	.xword	0xfc8e009d4be3e508
	.xword	0x1ce8cdcc8295e549
	.xword	0x92d9e0ebed1bf161
	.xword	0xcb060a3945110120
	.xword	0xa219df5ffa5eb02a
	.xword	0x8492b60de7923d59
	.xword	0xdefdbf798b759fa7
	.xword	0x6005aad0f14ca0db
	.xword	0x7d094fc1631899b9
	.xword	0x67cca22185076247
	.xword	0xc7d08a6ec468aceb
	.xword	0x95d7c1c331f26c9b
	.xword	0xfbdc1fda066cfdd1
	.xword	0x343c3b29ab679572
	.xword	0xeeb76c3bf6651ced
	.xword	0xde0ccf2c610d0246
	.xword	0x0fb76384dd600120
	.xword	0x19ce9820ab99a0d9
	.xword	0x41ab6546e3883b35
	.xword	0x2950d07865d2af76
	.xword	0x0c09a5a1db1898bd
	.xword	0x709c8aaefc820ed7
	.xword	0xd18d9e0b2ad5b094
	.xword	0x1b32199a6a0759b1
	.xword	0x86c33584f6ea6f56
	.xword	0xbfe300dd87868917
	.xword	0x95be394b611d9867
	.xword	0xcdf26e6a497b937b
	.xword	0xe0c5cc25352b2db9
	.xword	0x42a8fa75657ccde6
	.xword	0xd200981cd6c4cc7a
	.xword	0x51219d0847b523fd
	.xword	0xc103e5297c7efcf7
	.xword	0xc9a1f4a429d5872f
	.xword	0xa774dd78598a5074
	.xword	0xb842b676424bff60
	.xword	0x3151fd95f20f7de9
	.xword	0x4e08a9a79a27ae7c
	.xword	0x5e3a7c3d1a7decbc
	.xword	0x4f38310bcf9ab6b6
	.xword	0x08d6eda41adef989
	.xword	0xa819201ccd7af2c9
	.xword	0xad375d73105e5a0a
	.xword	0x996954789dcfa333
	.xword	0x39f296bb2e6bc013
	.xword	0xf4b40d73b80a3d7f
	.xword	0x793073a137c05c38
	.xword	0xc28b9ab7334e2523
	.xword	0x79e242bf0a694790
	.xword	0x57bdc9d9af8e9fed
	.xword	0xcd55238a16a5891a
	.xword	0xe6c3f5fb5e14a760
	.xword	0xa55ed1969a8159c0
	.xword	0x7695be4c19f1707a
	.xword	0xa669a2e5406fe2c1
	.xword	0xbe6b34044fa9611a
	.xword	0x18d7af367c0d41d1
	.xword	0x17726fe62ca91d35
	.xword	0xf249e7e7732cb554
	.xword	0xaa9154b9727d8d71
	.xword	0xfbffc8570d94341a
	.xword	0xb46f80478ce4803e
	.xword	0xb6a313cf8942744b
	.xword	0xe0bb08bad07913dc
	.xword	0xb35892758a6c9ad6
	.xword	0xe5446dbebc75c96e
	.xword	0x486e3cef73a5d7c0
	.xword	0x392146d7bf6d10ac
	.xword	0x390454677811b0e2
	.xword	0x7b27ef92842594dd
	.xword	0xc0d8d2e80bae3b8e
	.xword	0x678c813241f9a6d2
	.xword	0x2c090b2d21f37d1d
	.xword	0xcf07e76d935d827b
	.xword	0xc21b1222ab8df007
	.xword	0x56e39d41da0afff3
	.xword	0x61de6ccdd5af29ae
	.xword	0x7da1b7dfa79f5e8b
	.xword	0xfd9830ebb5f3428b
	.xword	0x52d75eae9683fbcb
	.xword	0x2f601583a9dfe7d5
	.xword	0xe17d5b47f3257a76
	.xword	0xe9c7404fa0d80e0d
	.xword	0x7dbac9da89653dd1
	.xword	0x19830bdf85769973
	.xword	0xed15b36ee5b29749
	.xword	0xdaa3c0201e27f4cd
	.xword	0xe2c8c2292fe2305c
	.xword	0xf9c06d771a8216c0
	.xword	0x41f684799adf7f5b
	.xword	0x70a12a32d0f11712
	.xword	0xb91912f7fb995fd2
	.xword	0x0532db611cbbc004
	.xword	0xdab1ff8664dcd837
	.xword	0x513dc055be89c9de
	.xword	0x3181c54d46db05c9
	.xword	0xc43b84fe8c72bba9
	.xword	0x6105079b23bad04f
	.xword	0xe47ae198f55a5f63
	.xword	0x0193a11a0b423b77
	.align 0x10000
	.data
data_start_4:

	.xword	0x97370475dd6853bf
	.xword	0xd5410547b3508f07
	.xword	0xadb38c6092c69530
	.xword	0xd45e94a5d52a214e
	.xword	0x311fa6328c081134
	.xword	0xe6db25fc9723216c
	.xword	0xe6b49a33c0829f1e
	.xword	0xe8623cd509830319
	.xword	0x50d3baa9c891a8d9
	.xword	0x3cd1f1c6fcc900fa
	.xword	0x229545c3d7eb0f2e
	.xword	0x460a98ada0b1e58b
	.xword	0x6b9fa2990a3c4d11
	.xword	0x5a892c28e7b0012c
	.xword	0x01b7105d048fd7b0
	.xword	0x9ce2932993b92fd5
	.xword	0x34b91040746e72a0
	.xword	0x70b05e0a2b2a3ce7
	.xword	0x13b8ef30a9952667
	.xword	0x9c68c4e99ff96306
	.xword	0xfd0f110506c83d93
	.xword	0xa9a6ffe3e0cc988f
	.xword	0x3872efb47ad66e9a
	.xword	0x5522aace4754c1ec
	.xword	0xaee4e3897bcb0345
	.xword	0x642407634c7c7e26
	.xword	0x8faa4e883c8d871f
	.xword	0x1b1ab05036f5321c
	.xword	0xa8d40f19ca261e6b
	.xword	0xea41a2ef9839facb
	.xword	0xc4bcbaadc55755fb
	.xword	0xfd8c5bfe4099329a
	.xword	0x39a821de68e51d47
	.xword	0xb006406d6dbea44e
	.xword	0xbd701e5738ddd398
	.xword	0x62a37d521e3237de
	.xword	0x528c4dcf1cbed75b
	.xword	0xc03e64cf54185711
	.xword	0x28964dbb4c646de4
	.xword	0x3fb3c4d8e0b53b09
	.xword	0x508ed891f79e9c54
	.xword	0x484da8c0f1006c51
	.xword	0xb9495a1ae696dcb5
	.xword	0xd1e916faaab083a8
	.xword	0x643fb2deb17e0041
	.xword	0x2706473f978b3528
	.xword	0xed5e44f72e21b9cc
	.xword	0x33960404ba11e330
	.xword	0x2f842db14870b71d
	.xword	0x9b9e699b32cd3920
	.xword	0x946aa73042710b3d
	.xword	0x897ff0f2b346ad8a
	.xword	0x517cb465c61fe5f8
	.xword	0xd04b1e174a998a71
	.xword	0x99dbac576239a05f
	.xword	0x44dd4ad641954209
	.xword	0xf29a5e5e863ce291
	.xword	0x0f3e747c88d281c4
	.xword	0xa7327bbc3987396e
	.xword	0x5eba6f26cee24607
	.xword	0x5bd0a4c1b617f394
	.xword	0x4a0aec6594e9c714
	.xword	0x8d8f61976407d6d8
	.xword	0x97a87efd9e9b5853
	.xword	0x12f5053171c9f765
	.xword	0x3cf05cbe2bd9e555
	.xword	0x20749aae02ffe000
	.xword	0x35a5e37dab45c146
	.xword	0x83ca5a9f055e6c5e
	.xword	0x4c17e293b49eef12
	.xword	0x33d74ebbaeac2228
	.xword	0xada46dccd4eb584a
	.xword	0x942823a9e777a4b5
	.xword	0xb4b3ab24b19434fd
	.xword	0x0e432db8bc7b691a
	.xword	0x1cf0348f8a3d00e8
	.xword	0x3c63085db91c9498
	.xword	0x21b6b26b717d9577
	.xword	0x4c3df9048ddcf48f
	.xword	0x55058f454a7b8d2e
	.xword	0xcbf9a659a9b29bbc
	.xword	0xdb44aecab9fedaf2
	.xword	0xa70d382b1a3b92d5
	.xword	0x29dfa03e73ba3f14
	.xword	0x15382d22ef6362a4
	.xword	0x1a9840a034fdb7b0
	.xword	0x741649755ab699d6
	.xword	0x391ec93ef01e80f5
	.xword	0x8da46b65a105ee05
	.xword	0xdfef09f18a9904e1
	.xword	0x9d6735709ae8395a
	.xword	0xbf47b3bcbe98186b
	.xword	0x5cb976abbebe7936
	.xword	0xe12aa9c3d7e41b22
	.xword	0xd2e303a0a676fd89
	.xword	0xc5b779eacabe5b14
	.xword	0x6e5620e2244cffac
	.xword	0x1949e2082b8e3455
	.xword	0x224d2054f37bcc08
	.xword	0x26f9f5424192ab24
	.xword	0x62e8d7e3c3d8f53d
	.xword	0xc917ac55f8e71563
	.xword	0xfbdab874b615ee56
	.xword	0xb05421b5376e5867
	.xword	0xfc88a0bbf7a8fe2b
	.xword	0x7f363c40f899025e
	.xword	0x490f025805ecda37
	.xword	0xc9424aba56c10787
	.xword	0x1331a94dbab0cbc1
	.xword	0x6eecd7adb29e116d
	.xword	0x4a04ceb8d0681747
	.xword	0x807213571b19bdd9
	.xword	0xa018576a0eea8918
	.xword	0x0028e933285d52d3
	.xword	0xbcd2204a010fdcfa
	.xword	0xb77aae7801b1760c
	.xword	0xb7319f9536535092
	.xword	0xd76d920d57e8d670
	.xword	0x04d22fc0f879aa35
	.xword	0xa91164dd44b44e9c
	.xword	0xc737cc62c72cf189
	.xword	0x1890ff7951911fc1
	.xword	0x39989d2fd2c2f839
	.xword	0x67a0ad0baf4fe490
	.xword	0x528d9dd2c79051fc
	.xword	0x9261bc3ddf505c1a
	.xword	0x440fb42f1b91d3a5
	.xword	0xa440a6192ccc5770
	.xword	0xe710a3debf7391b2
	.xword	0x10a467e8924445f8
	.xword	0xcdd7007cfbf890fd
	.xword	0x4b4ab1d3da1d715a
	.xword	0x840555358c22cea8
	.xword	0xfb53a46f32bb31df
	.xword	0x3752e270771449a6
	.xword	0x04053222fabb15a9
	.xword	0xfd8fc1cee8372d04
	.xword	0x21c8bc7a5aa9b9bb
	.xword	0x762f15b0510cde5f
	.xword	0xca172501dba7af19
	.xword	0x064bc5c0cb006cf1
	.xword	0x96573c48db9a6f74
	.xword	0x4dedbc6887756c90
	.xword	0x855e7171554df43b
	.xword	0x2ac60ac08fb57c98
	.xword	0x2afb5860328fd52b
	.xword	0xe3445e121cf555ad
	.xword	0xad2e7e36d01c24fb
	.xword	0x32513ccc7b042f38
	.xword	0x298c4ed8ccb62cd8
	.xword	0xbeda5f09ec7eb5a8
	.xword	0x9c14e7512009a055
	.xword	0xfb63cde69b08d05c
	.xword	0x4e24867248fa3a22
	.xword	0x9b91f80abcc555da
	.xword	0x3b3d041a8918ee17
	.xword	0x9e0180e560a15d69
	.xword	0x034176efa04434a1
	.xword	0xc162f40145df62c7
	.xword	0x0eeafec1102f7db0
	.xword	0x112de04cf61c5f9c
	.xword	0x64857272ea43679d
	.xword	0x912780768315df93
	.xword	0x0848ba266ad8f483
	.xword	0x7bcc5815f08ddaf7
	.xword	0xc3f9bf5f33e24e74
	.xword	0x78d287af3beaeb38
	.xword	0x2af60aa118c7eb35
	.xword	0xad0557e6fe7f0e48
	.xword	0x82ef832a68065fd6
	.xword	0xb4670f51bbc94fa9
	.xword	0x0487264187d4bff3
	.xword	0xded81e1868c1097d
	.xword	0xc4c70a63b11b8295
	.xword	0xebd4c39a70efbb54
	.xword	0xb5ded36a81ecbd53
	.xword	0xef23212066ecb748
	.xword	0x01694748296f7566
	.xword	0xbae14344784b2bf6
	.xword	0x57f980438f05771a
	.xword	0xba9bfd7c3764bcbb
	.xword	0xabaac2ad76e5f84c
	.xword	0xb28e39c41f88a129
	.xword	0xfaf6f11dd712542e
	.xword	0x37d231a60ddfd0c8
	.xword	0xa696cac2e6ebae38
	.xword	0x22061ce921cdf79a
	.xword	0x3270933b48b15c5b
	.xword	0x85c9d25f80cd1e85
	.xword	0x194a58fb384fd2c8
	.xword	0x1015b787e2333fb9
	.xword	0x264e3cc06913a423
	.xword	0x92ed6fe1fcbc0be9
	.xword	0xafb1f02326aac945
	.xword	0xc54467a684bbbbcd
	.xword	0x55a943f906556cde
	.xword	0x593f8d8a1033bac7
	.xword	0x156a953134f28a1f
	.xword	0x6fa2fc53cae0df6b
	.xword	0xc511e85eb185253b
	.xword	0x5c5e1bb009d70734
	.xword	0x71c0f715c8583153
	.xword	0xda73331ad024b7c9
	.xword	0xe8037fdee1bc97fc
	.xword	0x2d689257baf49de9
	.xword	0x50dad45e5b6f6823
	.xword	0xe29b310d8465dc16
	.xword	0x057a5a07b06879d1
	.xword	0xbc99f2da013c9ec5
	.xword	0x95d5d9aeb2e6eddb
	.xword	0x931e47e17ef8ced7
	.xword	0x97d31464600fc675
	.xword	0x356f21557d2b315b
	.xword	0xd05bb438085cdacc
	.xword	0xa510143ecdcc1255
	.xword	0x68af7d1b9fd4dd07
	.xword	0xf7e8030eb8209c08
	.xword	0x6f992c2f0e61d3b0
	.xword	0xde1f05cf31e5079a
	.xword	0xada506681eddde4a
	.xword	0x6a59783c17c8bfd9
	.xword	0xfa0be6e49938c167
	.xword	0x401e2f2e656505b4
	.xword	0xc461446f8f93dd8b
	.xword	0x80d14ee4ec582f32
	.xword	0x24d8b26f5564ede5
	.xword	0x3e66a94f7a6eb586
	.xword	0xaff73a3ae6a988fe
	.xword	0xdc76ff19677a6bfa
	.xword	0x784477cc6a21f126
	.xword	0x55b13594a4b79351
	.xword	0xa087785fb7823625
	.xword	0x8d04470024bc4455
	.xword	0xeb7c7c0b51f1e7bf
	.xword	0xd5e8dd09e72c684f
	.xword	0xcb5a53f58cc22191
	.xword	0x72ffa12752cb9923
	.xword	0xb64a4532ab031bdd
	.xword	0x060cd58af1038867
	.xword	0x9237679e934392ff
	.xword	0x75d1dea616984983
	.xword	0xd4473f69cb0e367c
	.xword	0xf6617498fdcf1442
	.xword	0x9c956a030c347b10
	.xword	0x7c7069af47ce45cd
	.xword	0xd4f92be508a3b548
	.xword	0xd05236a07859348d
	.xword	0x026284a422754594
	.xword	0x86dd0d8172efcff7
	.xword	0x705c8b6b6ff1ffe4
	.xword	0x21809ec98fb49d50
	.xword	0x064bc9090748175a
	.xword	0x909d87257748b48f
	.xword	0xac1cd30b286e753d
	.xword	0x092d5f79cda9ef32
	.xword	0x100d1ffd46f028ca
	.align 0x20000
	.data
data_start_5:

	.xword	0x06158166d51e91b8
	.xword	0x7d32d819117a3395
	.xword	0x9959e465e0edc834
	.xword	0x72dfb53a0c22bdb2
	.xword	0x0ca16968f5ce26e8
	.xword	0x5bdefa735040f5c4
	.xword	0xe610e818d795451a
	.xword	0xea6cfbe2fce451e5
	.xword	0x6bed9deb4db35c9a
	.xword	0x1e69dab6097852d1
	.xword	0x4936eda8150b43d9
	.xword	0xa12b815049e31051
	.xword	0x44bdf9b558c64a88
	.xword	0xb53ceebe24a3abb2
	.xword	0x96a30487cb7428e7
	.xword	0x0008bb7a999ed51b
	.xword	0xd2f21a3498fe1ab1
	.xword	0xda0eb95f4929a62e
	.xword	0x9210a43f0f39afd5
	.xword	0xc18ffd19e8691999
	.xword	0x0be68db854e9f749
	.xword	0x7b37df8d6a11b16a
	.xword	0x968116f5b0837016
	.xword	0x12ae327096e26a2c
	.xword	0xb6844e0161366847
	.xword	0x244ee66085bed815
	.xword	0x0f2e038395c352e8
	.xword	0x981b60f2d8e1b1a8
	.xword	0xd429e10bd29052e4
	.xword	0x30e6f4e689b7f11a
	.xword	0xa037b0c7f470a2e3
	.xword	0x897d59b0ab794a27
	.xword	0xab4ba519c808b58b
	.xword	0xb23a66b7c50ae66c
	.xword	0x969d833eab67d758
	.xword	0x27e1bffb1628fe8a
	.xword	0xd72c9986530f9412
	.xword	0x79acafd47b388229
	.xword	0x2c9d8c4228efbdf1
	.xword	0xb2d9ad0842badd3a
	.xword	0xed9bb4a191f12dfd
	.xword	0x75e782e7da17a6a0
	.xword	0x6b6512be478aac6d
	.xword	0xcde82dbf2a98f8ac
	.xword	0x4067f2521cc10098
	.xword	0xab5ef3dd7599487f
	.xword	0xa9a2fe51eed4abb5
	.xword	0x3f1d529372d83340
	.xword	0x5bbe107906f90bcf
	.xword	0x0240c4a1e164d3a6
	.xword	0xeffc92586d6424f6
	.xword	0x756eeb365f8ad015
	.xword	0x89c0ef13c2835a7c
	.xword	0x33abe54a7dbe970f
	.xword	0xcfe8edb09b865db3
	.xword	0x29cb4b0d16f48152
	.xword	0x08e589350f7e0355
	.xword	0x371aec9c93098d21
	.xword	0xe49e6a066248cc7a
	.xword	0xc2318145b27ef62b
	.xword	0x6e74d50cd10582f9
	.xword	0x319098e9a3e14513
	.xword	0xae9b45d0a67887ac
	.xword	0xf5344242a8c892ba
	.xword	0x0a5cb477fb0f17d6
	.xword	0xf0893b4830a14a2d
	.xword	0x30f0ee24a991538d
	.xword	0xed398a65f70079f4
	.xword	0x6326a920e1b5aaad
	.xword	0x714b245a34a19e0b
	.xword	0x6c5289f3232a3dac
	.xword	0x9419701b0e321b9f
	.xword	0xe22190a36086064b
	.xword	0x9315016e5219abbc
	.xword	0x59587a5568b612c1
	.xword	0x51ad3bb6608cae89
	.xword	0x633b3a830986cc2f
	.xword	0xb325cfc04362201c
	.xword	0x3271af05684d09a1
	.xword	0x74a30d1d1a7d1526
	.xword	0x5a52c488bb1f3ce9
	.xword	0x63bcd17cc7d0128c
	.xword	0x5b54faa7427d5bcf
	.xword	0x4e48ca8335158083
	.xword	0xc81f754387a79dc1
	.xword	0xc91f13677df9751e
	.xword	0x306f49b6f0f42009
	.xword	0x7b1aee4efbfbd70e
	.xword	0x56b6ba27e90f083f
	.xword	0x1977b7b294f32fc6
	.xword	0xbffcc8105ab4d922
	.xword	0xbd08db00cb4fbe66
	.xword	0x18dd286d95067237
	.xword	0xf68eb0d01a7b441a
	.xword	0xc532537b333bdb8c
	.xword	0x7b1260614dbb982a
	.xword	0x221b0ba920c25f26
	.xword	0xab184a936366c79b
	.xword	0xd2cf96f9bff76d32
	.xword	0x35568b9c44815937
	.xword	0x80bf6640f9ad0bf5
	.xword	0xd3e006b7348cd71f
	.xword	0x6e6eb33e3044fd39
	.xword	0x62240b0de5a4e6e9
	.xword	0x92bb3afa23e5fca2
	.xword	0x5fb30587f3d28ddb
	.xword	0xdf154d7e5bc9b485
	.xword	0x05e8fec330e361ec
	.xword	0xa81546c6c8983d73
	.xword	0x5e1bbee863062566
	.xword	0x2898694879649f26
	.xword	0xb67c967ffd07bf91
	.xword	0x04d183c440fc87cb
	.xword	0x3ae41b9439e8df95
	.xword	0x7686085e39a8da35
	.xword	0x0fe41ab2f97d67d9
	.xword	0xc50097a0cf9e522d
	.xword	0x76e91d6878a0f7cd
	.xword	0x1fb95b0d129ee63f
	.xword	0x801c0423b83809ae
	.xword	0xa3faa073576054d2
	.xword	0x959d7f8114739a85
	.xword	0x60916e01d963a664
	.xword	0xf3fbc8d150dc282c
	.xword	0x00d64caba6a5ece5
	.xword	0x9f8e5b1555dc9406
	.xword	0x6dc2457495fd2799
	.xword	0x20c1061cb8544dd6
	.xword	0x787c8a77b05e5a60
	.xword	0x9501498ea69a6b90
	.xword	0x2eb1ccd890b23226
	.xword	0xc7a234af0c57cd5b
	.xword	0x53784b3c29b9530f
	.xword	0xb446dc6fcfb47bf2
	.xword	0x9b765716c1eefea3
	.xword	0x68206c274d208c16
	.xword	0xbecbd776e0e98071
	.xword	0xf8111acefcb06c40
	.xword	0x485e0f4db3a6e0f4
	.xword	0x03123e75d2eef716
	.xword	0x15f1d6f329188f26
	.xword	0xc5103f54d8fec30b
	.xword	0x6c9df8f85c972a3c
	.xword	0xaef84b267a35cf50
	.xword	0x47a5c149c11a7e28
	.xword	0x33c83b12354d1559
	.xword	0xc493b6d164d78765
	.xword	0x5adace51678f3ff9
	.xword	0x0a6819a48b3e56c5
	.xword	0x3ceb294d51471523
	.xword	0x3d0f83629f5dac8d
	.xword	0x3d0eca50794a1d72
	.xword	0xc7b8ea6dbaea3bae
	.xword	0xffc3287fdb95a928
	.xword	0x09a030552e0bb269
	.xword	0x8c5a7737c421b425
	.xword	0xac2551ea6f038d04
	.xword	0x757ba040664cfd7d
	.xword	0xf72fe0febd18ac59
	.xword	0x5fe07232a5df3d8f
	.xword	0x938fe1416a47be51
	.xword	0xd0995e12eca05c5d
	.xword	0x10b1ef0e91fee9f0
	.xword	0x2efed05dd4f1b5fc
	.xword	0xdd40c70b4b4ac374
	.xword	0xffec1deaf247b7ac
	.xword	0xa06279fa1f937f2e
	.xword	0x1a8484275e51e612
	.xword	0xeb5d2d8dec97f420
	.xword	0x4eaf254f7640f0ab
	.xword	0x21a94a80c1ab83a2
	.xword	0xf6292e6cae328799
	.xword	0x6cc992b2c88ebeff
	.xword	0x2466652e23320c78
	.xword	0x0bcdd04a3190d325
	.xword	0x2c2e492cc1a98dee
	.xword	0x0aa313a2f57ad2d1
	.xword	0x07db169128bfdfc3
	.xword	0x145b4725d706e3d8
	.xword	0xb8f878bea53a07fc
	.xword	0xee6564289f5f5096
	.xword	0x04c66b2a0d31e704
	.xword	0x17890f02de6f4b54
	.xword	0x606edf5d33d47e6c
	.xword	0x6de3e857053b0558
	.xword	0xae5c740c99f0e1b7
	.xword	0xcd1763c1716b0691
	.xword	0xb97b94f875be7386
	.xword	0xef1aef05717f97a1
	.xword	0xc772d91e884461b9
	.xword	0x936206f174c448ce
	.xword	0x6cb66c2bf0f8e144
	.xword	0x9fdbe207c3845abe
	.xword	0x7af3626e8f779d43
	.xword	0xe815a6ad8fee5506
	.xword	0xa8dcc4fe3f280f25
	.xword	0x07eebea9cd07e806
	.xword	0xdb6136d5615a14cd
	.xword	0x347a1cad9b39404a
	.xword	0x83c04fd1015188cf
	.xword	0xd2eddcd7b6d4dc61
	.xword	0xc857b319906f30f0
	.xword	0xec92551576ce894c
	.xword	0x8e63c173380fc578
	.xword	0xfaf5d0b3631294e0
	.xword	0xe941ca82e2749200
	.xword	0xcb7514fe5afc69e0
	.xword	0x09e629110ced72e9
	.xword	0x0bec42602ebaafcd
	.xword	0x4793533686837a70
	.xword	0xde409d4f9cca738d
	.xword	0x2db82112bc877e03
	.xword	0x38062d3cb04e4ea9
	.xword	0x6068bd923695777c
	.xword	0x7eff32ad436f7423
	.xword	0xef8302d9c7bd5b54
	.xword	0xce19a32188b1dd5b
	.xword	0x56d17fc0bc0d6e0e
	.xword	0xb29fb42288491c3c
	.xword	0x260490bdb9e87901
	.xword	0xee0fc6ea4771cd87
	.xword	0x9c9c7c7fe6e7e13c
	.xword	0xa39fa35ed5b8f396
	.xword	0xad0927b1e86b27fa
	.xword	0xee440838718f83ae
	.xword	0xb27b46a6494b3df4
	.xword	0x13fcb0fdd11fc320
	.xword	0xb6eb2f85699fb6a9
	.xword	0x8fa08972603791e7
	.xword	0xebbe61faf15e9ef3
	.xword	0xc468afb41f676127
	.xword	0x032924da885de4e1
	.xword	0x1de676efdc9caf3c
	.xword	0x26b8b47fd5ae405e
	.xword	0x8784e62df4863413
	.xword	0xd23ac481a504d4da
	.xword	0x13b3ac84acf823bf
	.xword	0x2ef7b9556219134a
	.xword	0xdf4cd6e56ec53f42
	.xword	0xc1b41f18c0dd43af
	.xword	0x19ec36372398fdea
	.xword	0x7f0f12882924fe05
	.xword	0x00534f299fd9395e
	.xword	0x9c8690b0eba23cb5
	.xword	0x848f7215d344cb46
	.xword	0x88314477c3d934d7
	.xword	0x63f6beecf9943a2d
	.xword	0x06ed560c47638dc8
	.xword	0xf8ed85f5144f2b80
	.xword	0xdec50a829d693a7c
	.xword	0x5e6dce4e0d37d15e
	.xword	0x60960275115cae54
	.xword	0xdf8263f38ffc4039
	.xword	0x475af06dce4c088d
	.xword	0x5273d6bf5c3e765b
	.xword	0x82084c9c6f5fdffe
	.align 0x40000
	.data
data_start_6:

	.xword	0x1db6bc783ad8bf27
	.xword	0xf163da5f4b40263e
	.xword	0xa7080a0c0e3a043c
	.xword	0xe83da3439f1b46c8
	.xword	0x004da5ef7c9392d4
	.xword	0xf264ca7a0b2f985d
	.xword	0xd873d9e62dc04de3
	.xword	0x18682fe64c344490
	.xword	0x7516313481723cb3
	.xword	0x5155772461cdab18
	.xword	0x67b71bff3224d197
	.xword	0x6c472e0496692819
	.xword	0x9e2d900336d31eb8
	.xword	0x94a3c236289ecb0c
	.xword	0x4ff50dd95c05187f
	.xword	0xc2eaf18c5bbf0f67
	.xword	0x104b1fd4f27b7072
	.xword	0x98dcaef8a7d76332
	.xword	0x74cf9281547d1aa2
	.xword	0x749104b3fb08af36
	.xword	0xa42fc00924bfe2bf
	.xword	0xd70d7aaa9b2c5db6
	.xword	0x97760dec4422b903
	.xword	0x72dd8546f47f3cc0
	.xword	0xd6d999a255351b1f
	.xword	0x0f19adb3e721e1b6
	.xword	0x29fca03434ab3d55
	.xword	0x532d559e54753d6c
	.xword	0xdedf9e48bcb1c29d
	.xword	0xb0fd435cebb9e24c
	.xword	0x436e53c8c5521cbc
	.xword	0x930d5042fc384cb1
	.xword	0xbf1652ec42e3c9d6
	.xword	0x388e818d805a4239
	.xword	0x67bc7e0e296a55a5
	.xword	0x4a95f763a9767a49
	.xword	0x4a6bd041243de1da
	.xword	0x5b77b83febc7f792
	.xword	0x2b1af7e2038c15d3
	.xword	0xeec1b64942a8875c
	.xword	0x932b8824b7971101
	.xword	0x973929dc747911ee
	.xword	0x49713585e0138439
	.xword	0xe886ae2e38b5acaf
	.xword	0xc18b326bc9b4fc38
	.xword	0x1215fc51b2f9b0f8
	.xword	0x250b4c9ac6a7acdb
	.xword	0x9c54cc5667d64882
	.xword	0x55e77dacbc8b1cf6
	.xword	0x0314b77830b7ab3b
	.xword	0xe197412fd506cd2a
	.xword	0x925691683875f594
	.xword	0x3c1b1ffa9a95428c
	.xword	0x3b3302407a95b007
	.xword	0xa2d7dbfb9fa6c9ee
	.xword	0xf5a080675d150f40
	.xword	0x4e5d298321060233
	.xword	0xac61d5d40453fd67
	.xword	0x11bb4bf420e5b13b
	.xword	0x9bd772598704ad5d
	.xword	0x76d9623edb1b1bc7
	.xword	0xea15f8fa20d92a46
	.xword	0xb8aa173fa141e7dd
	.xword	0x9f4a48614c51f8b7
	.xword	0xa4ce72c53c893569
	.xword	0xdfae0984765fbe9a
	.xword	0x0ba95c4edd60fc3a
	.xword	0x2c95dbe046eecb50
	.xword	0x96704317f36b6970
	.xword	0x0d9ce8191df05c84
	.xword	0x4e8663202c3b858e
	.xword	0x51b66e237282f4ec
	.xword	0x6f439ae1614184a0
	.xword	0x9b49b02fcf86c421
	.xword	0x520471acea35a803
	.xword	0x3a5c0bd2576108c3
	.xword	0xb45d3b88d41f015c
	.xword	0x6ce585d37162b49b
	.xword	0x4c6580bb00d9ab8e
	.xword	0x5a063d152bdffc5e
	.xword	0xc0edc1c99348312b
	.xword	0x5f1ea1ddace8d070
	.xword	0x3227c38401ea7b66
	.xword	0x6e962aa9c420603e
	.xword	0xae7cff3838641fa0
	.xword	0x639967438ad7a631
	.xword	0x6bfe98129cd335ef
	.xword	0x2f30ceed3174c692
	.xword	0x0ee5b3c7ed1d514c
	.xword	0xb95acceed51c1ee0
	.xword	0x959a5da6c360c883
	.xword	0x49a129c3468bd096
	.xword	0x165e3589c5d8356d
	.xword	0xb4d4affdd55f89c1
	.xword	0xb0659a3d42aa68f4
	.xword	0xc36eb3c2bb53b860
	.xword	0xeb888604c668f0ed
	.xword	0xbb576742bd01a2ff
	.xword	0x5ffdc5a1ad08263d
	.xword	0x7a9cf599a02e84fb
	.xword	0x0a369b76ddfc9e6b
	.xword	0xb8f50e6d32a6af64
	.xword	0xfc33c7c2aff8623e
	.xword	0x60b802ebe9e5e258
	.xword	0x89a3d22d3e891e7f
	.xword	0xb1efed6939143faf
	.xword	0xb1716443d45efe00
	.xword	0xb21e53b37997dedc
	.xword	0x2405c65e138f7c39
	.xword	0x69e6df03f1140876
	.xword	0x6cfea580b13a45ee
	.xword	0xc3b15ba522b2cd57
	.xword	0xc28b12eae19e0b34
	.xword	0x4c1ef5a862118b90
	.xword	0xbd6689f526855007
	.xword	0xd3a98d623dd921c6
	.xword	0x052f5b4c8e34a70c
	.xword	0x11ede6d012593cd7
	.xword	0xc14a109042799eb7
	.xword	0x49d1f33ecd960397
	.xword	0xde9a853fc55e9c5f
	.xword	0xa94f772df639f2ec
	.xword	0x718a3f62ed6cd742
	.xword	0x4215fef156b50f76
	.xword	0x83ee0aa6afc54a8a
	.xword	0xccb17370b0c1490d
	.xword	0x9aeedbeb4e1c4d0f
	.xword	0xd9e8259a71a2f665
	.xword	0x466f03f588ff88a4
	.xword	0xd3f474e14bce5d33
	.xword	0xaff6d31689668869
	.xword	0xf841db93272d8666
	.xword	0x9cdffcc52e637d17
	.xword	0x96c9e9778a7b09fd
	.xword	0xfa54a3d86535830b
	.xword	0x52f2b689810f5309
	.xword	0x4d6378bb0fe2d761
	.xword	0x4f4838401c9f893d
	.xword	0xe09457111d9601f1
	.xword	0x01b5821807cb7f73
	.xword	0x3880686eb0454e84
	.xword	0x26efdd9069afc1e7
	.xword	0x4f87a46489dbe338
	.xword	0x2ed2fa067c73b5cd
	.xword	0x46ac30d144bfed78
	.xword	0x854bd27d1c48258a
	.xword	0xbac35b55b7c39617
	.xword	0x0c72be29d75a0793
	.xword	0xdd9bfb3114a9b36f
	.xword	0xf041a6a4bcdffd74
	.xword	0x5349caf199e0f787
	.xword	0x4f27f11e99007e69
	.xword	0xd7c84ab2f3a8cbe2
	.xword	0x8f78a7263f639159
	.xword	0x3f8d63639fb49407
	.xword	0x4f828f55bcf4ca4d
	.xword	0xe4197305d369e0e9
	.xword	0x96fffdebc36b90fc
	.xword	0xe44ce7e8f67dc6fe
	.xword	0x05eaba10fdc0b5a2
	.xword	0xfb6d2a4c79087674
	.xword	0xadbe2f620cfb34fc
	.xword	0xc48ce33130b36561
	.xword	0x42598e22c89ff589
	.xword	0xc4af8897175717c5
	.xword	0x08b1eea390cc1787
	.xword	0x3793e4607c3a78df
	.xword	0xd6f20602c397d225
	.xword	0x2cf349358ea302e9
	.xword	0xeff77c74ee70ea77
	.xword	0x3dcae7e439f5e8f2
	.xword	0xd34d958cb1fc235e
	.xword	0x2ed2afc8a3716933
	.xword	0x0ea404b8e6406717
	.xword	0x9cec52594bb9f1f6
	.xword	0xd8f58fff2ecab3a1
	.xword	0x99b7a6014a9dbef0
	.xword	0x205ef178511dc69b
	.xword	0x8a410e483c2a18c6
	.xword	0xa0858d12d165d617
	.xword	0xad2d62fa89d35962
	.xword	0xf9374b34531e3bc7
	.xword	0x8c97a4f8f11f16e7
	.xword	0xba26a0faa3a0a031
	.xword	0xe3da7524cf1bf62e
	.xword	0x47ec167ee22206e4
	.xword	0xbd4bbfefd4f16290
	.xword	0x99f2a001cd3e7e35
	.xword	0x6a7ebd48303c8fc3
	.xword	0xcbc3f31c21297029
	.xword	0x135a4e131465816b
	.xword	0x1a6b95f9bc263182
	.xword	0xb9a226782ac319fe
	.xword	0xb9b117e60a1de7f4
	.xword	0x20d1711796454dc8
	.xword	0x1acbc84ee0007e06
	.xword	0x5bf9b08e0dee9582
	.xword	0x1f997df51df53b1a
	.xword	0x721af47fabf83adb
	.xword	0x6cea69afe5eb9062
	.xword	0x028ff5e8f4bf883d
	.xword	0x764e437bd05d8634
	.xword	0x6325634cad925700
	.xword	0x039773e51f658a05
	.xword	0xde964b92678bb75a
	.xword	0x7d01c222d70debb5
	.xword	0xa93e3923856049d0
	.xword	0x277954a6b3ff3000
	.xword	0x9e759a67cf9ae1da
	.xword	0x4e2d95c188475c38
	.xword	0x577b078c4471cf8c
	.xword	0x260041e539578080
	.xword	0x9c7874835c2f9628
	.xword	0x8657ea78c0b8fdef
	.xword	0x4bcd8794788f504f
	.xword	0x132bc4f26ad38f9c
	.xword	0x7e349ffef045175f
	.xword	0x9f3bf32df500e95b
	.xword	0x5f3ccf3fa261d753
	.xword	0x3b481064a54c1bec
	.xword	0xaf75501fe9ae89ea
	.xword	0x71142458fec2f33d
	.xword	0x076fb4f17ee4c4b4
	.xword	0x65769e6033f7befd
	.xword	0x3c4c438319f50937
	.xword	0x0d767975fa2cf42f
	.xword	0x36382c306678abf3
	.xword	0x14f0458ddbf96ae2
	.xword	0x8ecdaf5e9e6c02f9
	.xword	0xf7ddb58bdab159ef
	.xword	0x246f96ac946996fe
	.xword	0x2f79764d1a906f7d
	.xword	0x8cd2a4f4dae8ca03
	.xword	0x7c7777dc83d3a3a4
	.xword	0xb33730cf1959fdf0
	.xword	0xe02e6fe544b15a95
	.xword	0x7ca67676100ae51d
	.xword	0x7076a4c3aa21aced
	.xword	0x2c58550a413dd6eb
	.xword	0x06ed0e97b8173288
	.xword	0xc050b8b05b7689e0
	.xword	0xabdfc3e7e4f81737
	.xword	0x5bdaee5b8e35eb81
	.xword	0x623e660e2fd2e058
	.xword	0x36be2d0639b2f9e7
	.xword	0xb15dc675966875f7
	.xword	0xe610444b2f1be3bb
	.xword	0xdfd3f8ad3271edd0
	.xword	0x2fe2472c3a6d4850
	.xword	0xd26f856d2d7beb5f
	.xword	0x55e3a9480644e4d4
	.xword	0x3a15435e49f2b1fb
	.xword	0xc8cafeb6dd25f85e
	.xword	0x66d796017a205b7c
	.xword	0x0a9c8ec6d1d064e4
	.xword	0x89a11a0706f2cdf5
	.align 0x80000
	.data
data_start_7:

	.xword	0x14bac308a3bb0fe4
	.xword	0xb0b1c3c3617a36b1
	.xword	0x98564d27100b4b13
	.xword	0x232334700040f259
	.xword	0x3510243eaf1b20cd
	.xword	0xdb5d579b64b71bf7
	.xword	0x4deae2030c1473ea
	.xword	0x6a0a2400c7921a40
	.xword	0x2567303340344550
	.xword	0x506b21242ce923b9
	.xword	0x4d2161a4d81009d9
	.xword	0x289229b12750d20d
	.xword	0x211c818138fc8c4d
	.xword	0xe7cf128feffb789c
	.xword	0xd306c3b829bf6eb2
	.xword	0x71c11e56ba47cc8a
	.xword	0xeca874e25661b6ee
	.xword	0x7711e039b5bc6c6d
	.xword	0x69c8a5bb751e4fc7
	.xword	0x56000ecf88aa9962
	.xword	0xcaa5d84339b14767
	.xword	0x541f6090046fe8e8
	.xword	0x6b5d4a1d3288ed44
	.xword	0xf0b44b3be2a1ab23
	.xword	0x136b52dc1a2891f9
	.xword	0xf91284796d4acb50
	.xword	0x8817878f7fe0a770
	.xword	0x47d515c501b32c3b
	.xword	0x21a4b0760823cc68
	.xword	0x9ebdee941a2d0130
	.xword	0x1b8fe4167b39118e
	.xword	0xffa3a65ee4bd71fa
	.xword	0xb121c2d82e3067a2
	.xword	0x1d0c34e7dbb7b247
	.xword	0x6933d774490c1528
	.xword	0x7a39ebf19d5b5b2b
	.xword	0x957698bb7052c506
	.xword	0x9e9ac04e16c73604
	.xword	0xc3bdd3e8640c72d3
	.xword	0x8cea7529944eebc0
	.xword	0xfc52100667ff6f91
	.xword	0x858f5f82f3ee2756
	.xword	0x275eb89ae507e33f
	.xword	0x891c3bbfdf9545ed
	.xword	0xced5ee0212cb0f25
	.xword	0xc47617ff1706781a
	.xword	0xc377465d2340e71c
	.xword	0x0806d3824b2a42a3
	.xword	0xeacddff35ab0dc51
	.xword	0x8fb49d0732a99c2f
	.xword	0x0da84ad36f50417e
	.xword	0x1dc4011b69f1b4c7
	.xword	0xd5029e984be5c69c
	.xword	0x2d6b0481f791278a
	.xword	0x8a5ddeedc423479e
	.xword	0x2411fd709af8e037
	.xword	0x390a42a782ee5f60
	.xword	0x5d1ff85b6b1f18cf
	.xword	0x2bd6e5c3bfddae95
	.xword	0x4929e448852800f8
	.xword	0xc8baf809d7cb43ae
	.xword	0x61fac6bdaffb9e50
	.xword	0x0a1622a4015cd1d4
	.xword	0x9c6eaa8b66ae3e57
	.xword	0x870f2eb4a77ae65c
	.xword	0x70509cb5132eaa18
	.xword	0xb938db35492f4ef8
	.xword	0x8428b27bc0131207
	.xword	0xc0394f6cef8d14a3
	.xword	0x9b8b1046d7d74544
	.xword	0x92b672352a7aabb2
	.xword	0x7ebaa9aa92c6bb97
	.xword	0x969455441c331d89
	.xword	0x8742205f0d165331
	.xword	0xe977c6219b75ca7a
	.xword	0x168f55d488b3ef04
	.xword	0x1ae876cc35225312
	.xword	0x2165f99a7d7d26eb
	.xword	0x8106d39341b2a57c
	.xword	0x4299005722c37226
	.xword	0x775b88ce88af7f73
	.xword	0x28214d735a83181b
	.xword	0x9f5b2e2e44110ba8
	.xword	0x94eb563774e0b79f
	.xword	0x6dd53771256dee3a
	.xword	0x81298d89b67d7df6
	.xword	0x9541e10eca12bf6e
	.xword	0xe8cf19817abda223
	.xword	0x410d440d9ec778ac
	.xword	0x5c9128186acd6468
	.xword	0x99872b91d78684fc
	.xword	0x1ab1a26ced15f876
	.xword	0xe50e2b97067126ab
	.xword	0x0bb3b499e5d87f48
	.xword	0x64d49724f2bda8d3
	.xword	0x653c3e4fc5e0ea67
	.xword	0x3caa0912c35ad11d
	.xword	0x71840d223f0f30d6
	.xword	0x50793b63d1666ad2
	.xword	0x7b3234b807f5d4dc
	.xword	0x6f66096bad4466e7
	.xword	0xe659176e290bfaef
	.xword	0xdbe2ea9438da94b1
	.xword	0xe6e484d8a7d30e48
	.xword	0xc19a7a5dd8d9df67
	.xword	0x039d156230ba3d81
	.xword	0xdd4f5b1610cbb9a3
	.xword	0xaf27dfa331875f6a
	.xword	0x89df11550ea4a280
	.xword	0x4f85b973f1260357
	.xword	0xa0b4a8a0869adcd7
	.xword	0xb509131aa52e2957
	.xword	0x7ea39c9370b4ee1f
	.xword	0xed2eca389585fb48
	.xword	0x957c2e78485335aa
	.xword	0x034b31c83b8c762f
	.xword	0x74060468ce1edf4f
	.xword	0xcc5e4701443cfa95
	.xword	0xd837b9e943cbb79c
	.xword	0xfce4621459b7d1c7
	.xword	0xfb3ca9dabaa9e2db
	.xword	0x4d61c095cbcfb8dc
	.xword	0xf050c2be4d571e76
	.xword	0x7750f94a4322d5e6
	.xword	0xd567a5160ce18847
	.xword	0x716192d650f353f6
	.xword	0xdec7f08050355627
	.xword	0xdaf5a2e47a12f8f1
	.xword	0xcf135f0d0fb69e08
	.xword	0x6663d8f5b5f2c7d0
	.xword	0x1e453f0704744264
	.xword	0x486f4120455a983c
	.xword	0xfd0764323796bdd1
	.xword	0x6b3b1cac8f505965
	.xword	0x96186d9fafa636f6
	.xword	0x9b8288e4ee750390
	.xword	0xb7b718c6884bdf13
	.xword	0xc58183e19fc25bf3
	.xword	0xfabe1f98a46f294b
	.xword	0x18eaf6e8b4db6bdc
	.xword	0x072fa7ee978fdca2
	.xword	0xebd6d2c0389103da
	.xword	0x07393ad41709ae72
	.xword	0xc9d98b881544e6d2
	.xword	0xc761dc4daf80a207
	.xword	0x1d5c6b64688b9cfd
	.xword	0x0dc6fbecb501837e
	.xword	0x9e99e47b9d93be0a
	.xword	0x303469a20f8dcee6
	.xword	0x29364cb94696c4cd
	.xword	0xd6f9e7b87617bc87
	.xword	0x75477f7faa658b9d
	.xword	0xcf5a58016f09b38d
	.xword	0x56f6b9ff2b25cef9
	.xword	0xec5a1f8bebf0e462
	.xword	0x6fe6a06ba7fbcbae
	.xword	0xcd08c80d3f5c1149
	.xword	0xe387c03e2efcf7b8
	.xword	0x26f5668a707bb361
	.xword	0x4bf948ea7bb69a5d
	.xword	0xc83914d2428a402a
	.xword	0xf1f4053ef7b54649
	.xword	0x511d3012faf06833
	.xword	0x9866ce1fed8aac44
	.xword	0x00fdca0303f2c18b
	.xword	0x7c641d4963fa7158
	.xword	0x4268fb85db4e9e32
	.xword	0x5eec7c0cf55fbcfc
	.xword	0xa0a3c7e3c82a5b76
	.xword	0xac5fa732b07093db
	.xword	0xed4ea0a2aa5d5587
	.xword	0xf117e4691d86f715
	.xword	0x10429bfc37274554
	.xword	0x0928c63d17ce327a
	.xword	0x0e8dfe6e71470453
	.xword	0x9f5dd8c2d6833f4b
	.xword	0x5d9479006b491b09
	.xword	0xd4f169f1f48b0ca5
	.xword	0x7a362edcc1a2c58e
	.xword	0xb26928b3976b776b
	.xword	0x68813bd2c3a2e227
	.xword	0x21adf64d7a0e0ba3
	.xword	0xfd55e1870c280d4e
	.xword	0x8d43fde425b3c664
	.xword	0x81bcd11de6d536cb
	.xword	0x4fe0730069dd8fa7
	.xword	0x00af1db8c54017c7
	.xword	0x517bc4fe546c90f3
	.xword	0xc5c2704e5792b617
	.xword	0xd5a888fbabaf63c7
	.xword	0xa329cfdf3726258b
	.xword	0x3546c39642b6b2e9
	.xword	0x45110162f361ec17
	.xword	0x932e1bbd90d96ea8
	.xword	0x4d15f8f167a9db9f
	.xword	0x23ece7e1e8e85294
	.xword	0xd63db2b9b7fdb4c1
	.xword	0x8d25777fcc7b686b
	.xword	0x1c130b656f459e8a
	.xword	0x08ccd312e8490b37
	.xword	0x84d964a39d0b79db
	.xword	0xe15046d645816191
	.xword	0xf3a37e47aa26894a
	.xword	0xdde62ae6c76a19bf
	.xword	0xc0eaa3c32c1b247b
	.xword	0xff62d99c5332d39b
	.xword	0xf053d5a216676af0
	.xword	0x008e60b751defd83
	.xword	0x971e3198afd20d18
	.xword	0xc4896e74e2c0d9af
	.xword	0x71c80e428d04312f
	.xword	0xc9feb4cfc0b5d698
	.xword	0x8db1abb13ad4a06e
	.xword	0xf368990fdb6ad469
	.xword	0xf62c63ba5a167d7e
	.xword	0x19e554a7974932a8
	.xword	0x8d89813fa59a94ce
	.xword	0x1e6759f7a8c519d4
	.xword	0x61e7df76b667c14d
	.xword	0x17eef5210c06b314
	.xword	0x94468f050ffdcd20
	.xword	0xdbde87c050b909a8
	.xword	0xf7be11cc9756360f
	.xword	0x88d87eac03999c91
	.xword	0x44ab770019eb599b
	.xword	0xd0954ff5e0778dd9
	.xword	0x863f7e12c3d5351d
	.xword	0x4e32597d2ecf0176
	.xword	0x2286a78d06504727
	.xword	0xf67ffc274b6f9fdd
	.xword	0xc629c268c1cf12b8
	.xword	0x3256605532b75613
	.xword	0xe7f42550df777487
	.xword	0x77bba11ad78ee2b3
	.xword	0xc148d7da8cca98e1
	.xword	0xd42ec487b1977b0d
	.xword	0xbc4b32cd8dc29c1c
	.xword	0xdd7a6dd77b7fa52e
	.xword	0x4befef35393a87e3
	.xword	0x5bb90ba23768de48
	.xword	0xe5c8420093058461
	.xword	0x7519f5e117ba3e1b
	.xword	0x11a79e5ddbb17251
	.xword	0xcf66de569de6223e
	.xword	0x9691c39499f61bb1
	.xword	0x542977d5fd6b0126
	.xword	0x76b2d581c6e5dbbe
	.xword	0xc631975bde713eca
	.xword	0x2c84ac5658a8546e
	.xword	0x67476a574b18fdca
	.xword	0xb854fce04e3d93c0
	.xword	0xf2fa434a2d988553
	.xword	0x6cf0dd70b6cfa730
	.xword	0x191f06642108e0d7
	.xword	0x4054064d1cadab1b
	.xword	0x256beaa548c89c51



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
