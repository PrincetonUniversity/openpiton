// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tlu_asr_access_1_rand_s1.s
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
   random seed:	452606201
   Jal tlu_asr_access_1.j:	
********************************************************************************/



#define PCONTEXT	0x10
#define SCONTEXT	0x10

#define MAIN_PAGE_NUCLEUS_ALSO
#define MAIN_PAGE_HV_ALSO

#include "my_trap_handlers.s"
#include "tlu_custom_trap_handlers.s"
#include "my_intr_handlers.s"
#include "enable_traps.h"
#include "boot.s"

.text
.global main

main:

! Register init code

	setx 0x97b3659febfc97a8, %g1, %g0
	setx 0x796ec16521fa7688, %g1, %g1
	setx 0x1c0d63da70f85fe5, %g1, %g2
	setx 0x1d3d3d989dee3af8, %g1, %g3
	setx 0xcdb1eb7d8eca38fe, %g1, %g4
	setx 0x5fc848f55ccd5062, %g1, %g5
	setx 0x0dbe6a9e0e805aef, %g1, %g6
	setx 0x83ce9e39f29683c7, %g1, %g7
	setx 0x459ec545f1788d14, %g1, %r16
	setx 0x83eaa941981c4164, %g1, %r17
	setx 0x51922ff6bd201e77, %g1, %r18
	setx 0xa971b673180d59e2, %g1, %r19
	setx 0x0815554dc89caa67, %g1, %r20
	setx 0xde80ad182f086b44, %g1, %r21
	setx 0x7f711bc669a00a35, %g1, %r22
	setx 0x1fb1a5bdc1649dc9, %g1, %r23
	setx 0xdaabc8f2590f6462, %g1, %r24
	setx 0xf004f3bc658f77af, %g1, %r25
	setx 0x8b54b79e463fe166, %g1, %r26
	setx 0x72cf1b5138d80430, %g1, %r27
	setx 0x1e595da344984851, %g1, %r28
	setx 0xc3c8e12b00b85e2d, %g1, %r29
	setx 0xbd35db19aca60a40, %g1, %r30
	setx 0xdabeb0682c72af31, %g1, %r31
	setx	data_start, %r1, %r25
	mov	1, %r12
	setx	0x6727c70f00003f12, %g1, %r10
	.word 0x819a8000  ! 1: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xa750c000  ! 2: RDPR_TT	rdpr	%tt, %r19
	.word 0xab500000  ! 3: RDPR_TPC	<illegal instruction>
	.word 0x87952308  ! 4: WRPR_TT_I	wrpr	%r20, 0x0308, %tt
	.word 0xad520000  ! 5: RDPR_PIL	rdpr	%pil, %r22
	setx	0x886f415b0000e980, %g1, %r10
	.word 0x839a8000  ! 6: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xad500000  ! 7: RDPR_TPC	rdpr	%tpc, %r22
	.word 0x87956293  ! 8: WRPR_TT_I	wrpr	%r21, 0x0293, %tt
	.word 0x8595bcce  ! 9: WRPR_TSTATE_I	wrpr	%r22, 0x1cce, %tstate
	.word 0x879572e8  ! 10: WRPR_TT_I	wrpr	%r21, 0x12e8, %tt
	.word 0xa1504000  ! 11: RDPR_TNPC	rdpr	%tnpc, %r16
	setx	0x46a0c2930000d810, %g1, %r10
	.word 0x819a8000  ! 12: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x83943870  ! 13: WRPR_TNPC_I	wrpr	%r16, 0x1870, %tnpc
	.word 0x879df71c  ! 14: WRHPR_HINTP_I	wrhpr	%r23, 0x171c, %hintp
	.word 0xa985f71c  ! 15: WRASR_I	wr	%r23, 0x171c, %set_softint
	.word 0x8985f71c  ! 16: WRASR_I	wr	%r23, 0x171c, %tick
	setx	0x364e935700006c8b, %g1, %r10
	.word 0x819a8000  ! 17: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xa1504000  ! 18: RDPR_TNPC	rdpr	%tnpc, %r16
	.word 0xa7508000  ! 19: RDPR_TSTATE	rdpr	%tstate, %r19
	.word 0xb185f71c  ! 20: WRASR_I	wr	%r23, 0x171c, %-
	mov	1, %r12
	.word 0xa1930000  ! 21: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xa985f71c  ! 22: WRASR_I	wr	%r23, 0x171c, %set_softint
	.word 0xab540000  ! 23: RDPR_GL	<illegal instruction>
	.word 0xa3500000  ! 24: RDPR_TPC	<illegal instruction>
	.word 0xa3500000  ! 25: RDPR_TPC	<illegal instruction>
	.word 0xa7514000  ! 26: RDPR_TBA	<illegal instruction>
	.word 0xaf484000  ! 27: RDHPR_HTSTATE	rdhpr	%htstate, %r23
	.word 0xab50c000  ! 28: RDPR_TT	<illegal instruction>
	.word 0xab458000  ! 29: RDASR	rd	%softint, %r21
	setx	0x3993e9f000009d5f, %g1, %r10
	.word 0x839a8000  ! 30: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	setx	0xefbf893600009c02, %g1, %r10
	.word 0x839a8000  ! 31: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xab450000  ! 32: RDASR	rd	%set_softint, %r21
	.word 0xad500000  ! 33: RDPR_TPC	rdpr	%tpc, %r22
	.word 0x83943037  ! 34: WRPR_TNPC_I	wrpr	%r16, 0x1037, %tnpc
	.word 0xa9508000  ! 35: RDPR_TSTATE	rdpr	%tstate, %r20
	.word 0xaf843037  ! 36: WRASR_I	wr	%r16, 0x1037, %-
	.word 0x8195ac13  ! 37: WRPR_TPC_I	wrpr	%r22, 0x0c13, %tpc
	.word 0x879c6dd6  ! 38: WRHPR_HINTP_I	wrhpr	%r17, 0x0dd6, %hintp
	.word 0x8794b361  ! 39: WRPR_TT_I	wrpr	%r18, 0x1361, %tt
	.word 0xa148c000  ! 40: RDHPR_HINTP	rdhpr	%hintp, %r16
	.word 0xa7504000  ! 41: RDPR_TNPC	rdpr	%tnpc, %r19
	.word 0x83956eaf  ! 42: WRPR_TNPC_I	wrpr	%r21, 0x0eaf, %tnpc
	setx	0x878cb94d00003b5f, %g1, %r10
	.word 0x819a8000  ! 43: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xa5508000  ! 44: RDPR_TSTATE	rdpr	%tstate, %r18
	.word 0xa5410000  ! 45: RDASR	rd	%tick, %r18
	.word 0xaf500000  ! 46: RDPR_TPC	<illegal instruction>
	.word 0xa950c000  ! 47: RDPR_TT	<illegal instruction>
	.word 0xaf50c000  ! 48: RDPR_TT	<illegal instruction>
	setx	0xb10e92680000d8c7, %g1, %r10
	.word 0x839a8000  ! 49: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xaf410000  ! 50: RDASR	rd	%tick, %r23
	.word 0xaf508000  ! 51: RDPR_TSTATE	rdpr	%tstate, %r23
	.word 0x8195bc3d  ! 52: WRPR_TPC_I	wrpr	%r22, 0x1c3d, %tpc
	.word 0xad484000  ! 53: RDHPR_HTSTATE	rdhpr	%htstate, %r22
	ta	T_CHANGE_HPRIV
	WRPR	%g0, 0, %tick
	.word 0xab85bc3d  ! 54: WRASR_I	wr	%r22, 0x1c3d, %clear_softint
	.word 0xab508000  ! 55: RDPR_TSTATE	<illegal instruction>
	.word 0xab458000  ! 56: RDASR	rd	%softint, %r21
	.word 0xa9508000  ! 57: RDPR_TSTATE	<illegal instruction>
	setx	0x423f00080000ce42, %g1, %r10
	.word 0x839a8000  ! 58: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xa9454000  ! 59: RDASR	rd	%clear_softint, %r20
	.word 0x8395f11d  ! 60: WRPR_TNPC_I	wrpr	%r23, 0x111d, %tnpc
	.word 0x8195a4f8  ! 61: WRPR_TPC_I	wrpr	%r22, 0x04f8, %tpc
	.word 0x81956856  ! 62: WRPR_TPC_I	wrpr	%r21, 0x0856, %tpc
	.word 0xa5504000  ! 63: RDPR_TNPC	rdpr	%tnpc, %r18
	.word 0xab50c000  ! 64: RDPR_TT	<illegal instruction>
	.word 0xab504000  ! 65: RDPR_TNPC	<illegal instruction>
	.word 0x89943fbe  ! 66: WRPR_TICK_I	wrpr	%r16, 0x1fbe, %tick
	.word 0x879da57d  ! 67: WRHPR_HINTP_I	wrhpr	%r22, 0x057d, %hintp
	.word 0xab464000  ! 68: RDASR	rd	%-, %r21
	.word 0xab50c000  ! 69: RDPR_TT	rdpr	%tt, %r21
	.word 0x8595e34b  ! 70: WRPR_TSTATE_I	wrpr	%r23, 0x034b, %tstate
	.word 0x8395b380  ! 71: WRPR_TNPC_I	wrpr	%r22, 0x1380, %tnpc
	setx	0xd3a9eab700008b01, %g1, %r10
	.word 0x839a8000  ! 72: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xab500000  ! 73: RDPR_TPC	rdpr	%tpc, %r21
	.word 0x8194a45e  ! 74: WRPR_TPC_I	wrpr	%r18, 0x045e, %tpc
	.word 0xa5494000  ! 75: RDHPR_HTBA	rdhpr	%htba, %r18
	.word 0xa9540000  ! 76: RDPR_GL	<illegal instruction>
	.word 0xaf508000  ! 77: RDPR_TSTATE	<illegal instruction>
	.word 0x839432c5  ! 78: WRPR_TNPC_I	wrpr	%r16, 0x12c5, %tnpc
	.word 0xad480000  ! 79: RDHPR_HPSTATE	rdhpr	%hpstate, %r22
	.word 0xa9504000  ! 80: RDPR_TNPC	<illegal instruction>
	.word 0xa3494000  ! 81: RDHPR_HTBA	rdhpr	%htba, %r17
	.word 0xa3504000  ! 82: RDPR_TNPC	<illegal instruction>
	.word 0x8194a800  ! 83: WRPR_TPC_I	wrpr	%r18, 0x0800, %tpc
	.word 0x8795b575  ! 84: WRPR_TT_I	wrpr	%r22, 0x1575, %tt
	.word 0x8194367b  ! 85: WRPR_TPC_I	wrpr	%r16, 0x167b, %tpc
	mov	0, %r12
	.word 0x8f930000  ! 86: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xaf520000  ! 87: RDPR_PIL	rdpr	%pil, %r23
	.word 0xaf540000  ! 88: RDPR_GL	<illegal instruction>
	.word 0xb384367b  ! 89: WRASR_I	wr	%r16, 0x167b, %-
	.word 0xa3480000  ! 90: RDHPR_HPSTATE	rdhpr	%hpstate, %r17
	.word 0x8994783b  ! 91: WRPR_TICK_I	wrpr	%r17, 0x183b, %tick
	setx	0x8035c2f300009d04, %g1, %r10
	.word 0x819a8000  ! 92: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xaf50c000  ! 93: RDPR_TT	rdpr	%tt, %r23
	ta	T_CHANGE_PRIV	! macro
	.word 0xab50c000  ! 95: RDPR_TT	<illegal instruction>
	.word 0xad500000  ! 96: RDPR_TPC	<illegal instruction>
	.word 0xad440000  ! 97: RDASR	rd	%-, %r22
	.word 0xa550c000  ! 98: RDPR_TT	<illegal instruction>
	.word 0xa5458000  ! 99: RDASR	rd	%softint, %r18
	setx	0x616db75100004841, %g1, %r10
	.word 0x819a8000  ! 100: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xa748c000  ! 101: RDHPR_HINTP	rdhpr	%hintp, %r19
	.word 0x87946bdd  ! 102: WRPR_TT_I	wrpr	%r17, 0x0bdd, %tt
	.word 0x879dee8f  ! 103: WRHPR_HINTP_I	wrhpr	%r23, 0x0e8f, %hintp
	setx	0xa803048e00000d5e, %g1, %r10
	.word 0x839a8000  ! 104: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	setx	0x1defa0f0000be10, %g1, %r10
	.word 0x839a8000  ! 105: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x8595e843  ! 106: WRPR_TSTATE_I	wrpr	%r23, 0x0843, %tstate
	.word 0xaf504000  ! 107: RDPR_TNPC	rdpr	%tnpc, %r23
	.word 0xab510000  ! 108: RDPR_TICK	<illegal instruction>
	.word 0xab510000  ! 109: RDPR_TICK	<illegal instruction>
	ta	T_CHANGE_HPRIV
	WRPR	%g0, 0, %tick
	.word 0xaf85e843  ! 110: WRASR_I	wr	%r23, 0x0843, %-
	setx	0x12ba4f2f0000e81e, %g1, %r10
	.word 0x819a8000  ! 111: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xa7480000  ! 112: RDHPR_HPSTATE	rdhpr	%hpstate, %r19
	.word 0xa5484000  ! 113: RDHPR_HTSTATE	rdhpr	%htstate, %r18
	.word 0xa548c000  ! 114: RDHPR_HINTP	rdhpr	%hintp, %r18
	.word 0xaf500000  ! 115: RDPR_TPC	<illegal instruction>
	ta	T_CHANGE_HPRIV
	WRPR	%g0, 0, %tick
	.word 0xaf85e843  ! 116: WRASR_I	wr	%r23, 0x0843, %-
	.word 0x81957514  ! 117: WRPR_TPC_I	wrpr	%r21, 0x1514, %tpc
	.word 0x879cea06  ! 118: WRHPR_HINTP_I	wrhpr	%r19, 0x0a06, %hintp
	.word 0x8394ab96  ! 119: WRPR_TNPC_I	wrpr	%r18, 0x0b96, %tnpc
	.word 0x8794fb66  ! 120: WRPR_TT_I	wrpr	%r19, 0x1b66, %tt
	.word 0xa9540000  ! 121: RDPR_GL	rdpr	%-, %r20
	.word 0xaf51c000  ! 122: RDPR_TL	<illegal instruction>
	.word 0xad494000  ! 123: RDHPR_HTBA	rdhpr	%htba, %r22
	.word 0xab504000  ! 124: RDPR_TNPC	<illegal instruction>
	.word 0xad508000  ! 125: RDPR_TSTATE	<illegal instruction>
	setx	0x361064870000ea55, %g1, %r10
	.word 0x839a8000  ! 126: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xa9508000  ! 127: RDPR_TSTATE	rdpr	%tstate, %r20
	.word 0xab50c000  ! 128: RDPR_TT	<illegal instruction>
	.word 0xa7510000  ! 129: RDPR_TICK	<illegal instruction>
	.word 0xab508000  ! 130: RDPR_TSTATE	<illegal instruction>
	.word 0x85946e3a  ! 131: WRPR_TSTATE_I	wrpr	%r17, 0x0e3a, %tstate
	.word 0x8d9471fe  ! 132: WRPR_PSTATE_I	wrpr	%r17, 0x11fe, %pstate
	.word 0xa5514000  ! 133: RDPR_TBA	rdpr	%tba, %r18
	.word 0xa545c000  ! 134: RDASR	rd	%-, %r18
	.word 0xaf50c000  ! 135: RDPR_TT	<illegal instruction>
	ta	T_CHANGE_HPRIV
	WRPR	%g0, 0, %tick
	.word 0x898471fe  ! 136: WRASR_I	wr	%r17, 0x11fe, %tick
	.word 0xaf480000  ! 137: RDHPR_HPSTATE	rdhpr	%hpstate, %r23
	.word 0xa3514000  ! 138: RDPR_TBA	<illegal instruction>
	.word 0xa3508000  ! 139: RDPR_TSTATE	<illegal instruction>
	.word 0xa5508000  ! 140: RDPR_TSTATE	<illegal instruction>
	.word 0x81956985  ! 141: WRPR_TPC_I	wrpr	%r21, 0x0985, %tpc
	.word 0x85946924  ! 142: WRPR_TSTATE_I	wrpr	%r17, 0x0924, %tstate
	setx	0xd94f0d9d00001e9c, %g1, %r10
	.word 0x839a8000  ! 143: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xa1494000  ! 144: RDHPR_HTBA	rdhpr	%htba, %r16
	.word 0xa948c000  ! 145: RDHPR_HINTP	rdhpr	%hintp, %r20
	.word 0x89846924  ! 146: WRASR_I	wr	%r17, 0x0924, %tick
	.word 0xb1846924  ! 147: WRASR_I	wr	%r17, 0x0924, %-
	.word 0x8795e251  ! 148: WRPR_TT_I	wrpr	%r23, 0x0251, %tt
	.word 0xa7520000  ! 149: RDPR_PIL	rdpr	%pil, %r19
	.word 0xad484000  ! 150: RDHPR_HTSTATE	rdhpr	%htstate, %r22
	.word 0xa5508000  ! 151: RDPR_TSTATE	<illegal instruction>
	.word 0x8195b6a2  ! 152: WRPR_TPC_I	wrpr	%r22, 0x16a2, %tpc
	.word 0xad484000  ! 153: RDHPR_HTSTATE	rdhpr	%htstate, %r22
	.word 0xa750c000  ! 154: RDPR_TT	<illegal instruction>
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa3504000  ! 156: RDPR_TNPC	<illegal instruction>
	.word 0xa1520000  ! 157: RDPR_PIL	<illegal instruction>
	setx	0x174eabc0000f89a, %g1, %r10
	.word 0x839a8000  ! 158: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xa3504000  ! 159: RDPR_TNPC	rdpr	%tnpc, %r17
	.word 0x8594bfeb  ! 160: WRPR_TSTATE_I	wrpr	%r18, 0x1feb, %tstate
	setx	0x6e27d61b00009c19, %g1, %r10
	.word 0x839a8000  ! 161: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb384bfeb  ! 162: WRASR_I	wr	%r18, 0x1feb, %-
	.word 0xa3458000  ! 163: RDASR	rd	%softint, %r17
	.word 0xa7504000  ! 164: RDPR_TNPC	<illegal instruction>
	.word 0x8795aa30  ! 165: WRPR_TT_I	wrpr	%r22, 0x0a30, %tt
	.word 0x83953d6d  ! 166: WRPR_TNPC_I	wrpr	%r20, 0x1d6d, %tnpc
	.word 0xa1514000  ! 167: RDPR_TBA	rdpr	%tba, %r16
	.word 0xa9504000  ! 168: RDPR_TNPC	rdpr	%tnpc, %r20
	.word 0xa1494000  ! 169: RDHPR_HTBA	rdhpr	%htba, %r16
	.word 0x8194b034  ! 170: WRPR_TPC_I	wrpr	%r18, 0x1034, %tpc
	.word 0xad508000  ! 171: RDPR_TSTATE	rdpr	%tstate, %r22
	.word 0x83946d19  ! 172: WRPR_TNPC_I	wrpr	%r17, 0x0d19, %tnpc
	.word 0xad484000  ! 173: RDHPR_HTSTATE	rdhpr	%htstate, %r22
	.word 0x81946e99  ! 174: WRPR_TPC_I	wrpr	%r17, 0x0e99, %tpc
	ta	T_CHANGE_PRIV	! macro
	ta	T_CHANGE_HPRIV
	WRPR	%g0, 0, %tick
	.word 0xa9846e99  ! 176: WRASR_I	wr	%r17, 0x0e99, %set_softint
	.word 0xaf504000  ! 177: RDPR_TNPC	<illegal instruction>
	.word 0x81953b09  ! 178: WRPR_TPC_I	wrpr	%r20, 0x1b09, %tpc
	.word 0xa9518000  ! 179: RDPR_PSTATE	rdpr	%pstate, %r20
	.word 0x87953f52  ! 180: WRPR_TT_I	wrpr	%r20, 0x1f52, %tt
	.word 0xa3504000  ! 181: RDPR_TNPC	rdpr	%tnpc, %r17
	.word 0xab540000  ! 182: RDPR_GL	<illegal instruction>
	.word 0xa7508000  ! 183: RDPR_TSTATE	<illegal instruction>
	.word 0xa9853f52  ! 184: WRASR_I	wr	%r20, 0x1f52, %set_softint
	.word 0x879d79de  ! 185: WRHPR_HINTP_I	wrhpr	%r21, 0x19de, %hintp
	.word 0x879d2f63  ! 186: WRHPR_HINTP_I	wrhpr	%r20, 0x0f63, %hintp
	.word 0x8794e106  ! 187: WRPR_TT_I	wrpr	%r19, 0x0106, %tt
	.word 0x8395fb32  ! 188: WRPR_TNPC_I	wrpr	%r23, 0x1b32, %tnpc
	.word 0xa985fb32  ! 189: WRASR_I	wr	%r23, 0x1b32, %set_softint
	.word 0x8595e73a  ! 190: WRPR_TSTATE_I	wrpr	%r23, 0x073a, %tstate
	.word 0xab480000  ! 191: RDHPR_HPSTATE	rdhpr	%hpstate, %r21
	.word 0xa7484000  ! 192: RDHPR_HTSTATE	rdhpr	%htstate, %r19
	.word 0xa750c000  ! 193: RDPR_TT	<illegal instruction>
	.word 0x89943149  ! 194: WRPR_TICK_I	wrpr	%r16, 0x1149, %tick
	.word 0xa5504000  ! 195: RDPR_TNPC	rdpr	%tnpc, %r18
	.word 0xad843149  ! 196: WRASR_I	wr	%r16, 0x1149, %softint
	.word 0xa5460000  ! 197: RDASR	rd	%-, %r18
	.word 0x879d6e29  ! 198: WRHPR_HINTP_I	wrhpr	%r21, 0x0e29, %hintp
	.word 0xa550c000  ! 199: RDPR_TT	rdpr	%tt, %r18
	.word 0xab484000  ! 200: RDHPR_HTSTATE	rdhpr	%htstate, %r21
	.word 0x81952aff  ! 201: WRPR_TPC_I	wrpr	%r20, 0x0aff, %tpc
	.word 0x85943ce1  ! 202: WRPR_TSTATE_I	wrpr	%r16, 0x1ce1, %tstate
	setx	0xdebeb0900007e5c, %g1, %r10
	.word 0x819a8000  ! 203: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xa3504000  ! 204: RDPR_TNPC	rdpr	%tnpc, %r17
	.word 0x8395e831  ! 205: WRPR_TNPC_I	wrpr	%r23, 0x0831, %tnpc
	.word 0xa3464000  ! 206: RDASR	rd	%-, %r17
	.word 0xa7514000  ! 207: RDPR_TBA	rdpr	%tba, %r19
	.word 0xaf508000  ! 208: RDPR_TSTATE	<illegal instruction>
	.word 0xa3494000  ! 209: RDHPR_HTBA	rdhpr	%htba, %r17
	.word 0x8194a825  ! 210: WRPR_TPC_I	wrpr	%r18, 0x0825, %tpc
	.word 0xaf84a825  ! 211: WRASR_I	wr	%r18, 0x0825, %-
	.word 0xa345c000  ! 212: RDASR	rd	%-, %r17
	.word 0xa3450000  ! 213: RDASR	rd	%set_softint, %r17
	rd	%pcr, %g2
	wr	%g2, 0, %pcr
	.word 0x91957520  ! 215: WRPR_PIL_I	wrpr	%r21, 0x1520, %pil
	.word 0xa7480000  ! 216: RDHPR_HPSTATE	rdhpr	%hpstate, %r19
	.word 0xa5504000  ! 217: RDPR_TNPC	<illegal instruction>
	.word 0x8794a7eb  ! 218: WRPR_TT_I	wrpr	%r18, 0x07eb, %tt
	.word 0xa5454000  ! 219: RDASR	rd	%clear_softint, %r18
	.word 0x8d95b7e1  ! 220: WRPR_PSTATE_I	wrpr	%r22, 0x17e1, %pstate
	.word 0xa9504000  ! 221: RDPR_TNPC	rdpr	%tnpc, %r20
	setx	0xc51e60ac00002c1a, %g1, %r10
	.word 0x839a8000  ! 222: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x8594b971  ! 223: WRPR_TSTATE_I	wrpr	%r18, 0x1971, %tstate
	.word 0xa3508000  ! 224: RDPR_TSTATE	rdpr	%tstate, %r17
	.word 0xa7510000  ! 225: RDPR_TICK	<illegal instruction>
	.word 0xa3520000  ! 226: RDPR_PIL	<illegal instruction>
	mov	2, %r12
	.word 0x8f930000  ! 227: WRPR_TL_R	wrpr	%r12, %r0, %tl
	setx	0x972fa10e0000b885, %g1, %r10
	.word 0x819a8000  ! 228: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xa9520000  ! 229: RDPR_PIL	rdpr	%pil, %r20
	ta	T_CHANGE_HPRIV
	WRPR	%g0, 0, %tick
	.word 0xb184b971  ! 230: WRASR_I	wr	%r18, 0x1971, %-
	setx	0x86b2611d0000a88c, %g1, %r10
	.word 0x839a8000  ! 231: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xa3504000  ! 232: RDPR_TNPC	rdpr	%tnpc, %r17
	.word 0xa950c000  ! 233: RDPR_TT	<illegal instruction>
	rd	%pcr, %g2
	wr	%g2, 0, %pcr
	.word 0x819438d8  ! 235: WRPR_TPC_I	wrpr	%r16, 0x18d8, %tpc
	.word 0xad494000  ! 236: RDHPR_HTBA	rdhpr	%htba, %r22
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xad464000  ! 238: RDASR	rd	%-, %r22
	.word 0xa7504000  ! 239: RDPR_TNPC	<illegal instruction>
	.word 0xa951c000  ! 240: RDPR_TL	<illegal instruction>
	mov	1, %r12
	.word 0x8f930000  ! 241: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x8794e48e  ! 242: WRPR_TT_I	wrpr	%r19, 0x048e, %tt
	setx	0x6c66c05f00002897, %g1, %r10
	.word 0x819a8000  ! 243: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xa5508000  ! 244: RDPR_TSTATE	rdpr	%tstate, %r18
	.word 0xa1540000  ! 245: RDPR_GL	<illegal instruction>
	.word 0x81947b8b  ! 246: WRPR_TPC_I	wrpr	%r17, 0x1b8b, %tpc
	.word 0xab504000  ! 247: RDPR_TNPC	rdpr	%tnpc, %r21
	.word 0xa9500000  ! 248: RDPR_TPC	<illegal instruction>
	.word 0x87946915  ! 249: WRPR_TT_I	wrpr	%r17, 0x0915, %tt
	setx	0x2067413100006bc5, %g1, %r10
	.word 0x839a8000  ! 250: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x89946c3a  ! 251: WRPR_TICK_I	wrpr	%r17, 0x0c3a, %tick
	.word 0x89846c3a  ! 252: WRASR_I	wr	%r17, 0x0c3a, %tick
	.word 0xa9440000  ! 253: RDASR	rd	%-, %r20
	.word 0xa3508000  ! 254: RDPR_TSTATE	rdpr	%tstate, %r17
	.word 0x83947ee7  ! 255: WRPR_TNPC_I	wrpr	%r17, 0x1ee7, %tnpc
	.word 0xa350c000  ! 256: RDPR_TT	rdpr	%tt, %r17
	setx	0x945b468d00001f43, %g1, %r10
	.word 0x819a8000  ! 257: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xaf480000  ! 258: RDHPR_HPSTATE	rdhpr	%hpstate, %r23
	.word 0x819471ec  ! 259: WRPR_TPC_I	wrpr	%r17, 0x11ec, %tpc
	.word 0xa9540000  ! 260: RDPR_GL	rdpr	%-, %r20
	.word 0x8794fa10  ! 261: WRPR_TT_I	wrpr	%r19, 0x1a10, %tt
	.word 0x87942135  ! 262: WRPR_TT_I	wrpr	%r16, 0x0135, %tt
	.word 0xa950c000  ! 263: RDPR_TT	rdpr	%tt, %r20
	.word 0xab504000  ! 264: RDPR_TNPC	<illegal instruction>
	.word 0xb1842135  ! 265: WRASR_I	wr	%r16, 0x0135, %-
	.word 0x8594b041  ! 266: WRPR_TSTATE_I	wrpr	%r18, 0x1041, %tstate
	.word 0x899434a2  ! 267: WRPR_TICK_I	wrpr	%r16, 0x14a2, %tick
	.word 0xa7494000  ! 268: RDHPR_HTBA	rdhpr	%htba, %r19
	.word 0xa3500000  ! 269: RDPR_TPC	<illegal instruction>
	.word 0x83947d07  ! 270: WRPR_TNPC_I	wrpr	%r17, 0x1d07, %tnpc
	.word 0xa1494000  ! 271: RDHPR_HTBA	rdhpr	%htba, %r16
	.word 0xab500000  ! 272: RDPR_TPC	rdpr	%tpc, %r21
	.word 0xa3847d07  ! 273: WRASR_I	wr	%r17, 0x1d07, %-
	.word 0xab440000  ! 274: RDASR	rd	%-, %r21
	.word 0x839525ba  ! 275: WRPR_TNPC_I	wrpr	%r20, 0x05ba, %tnpc
	.word 0x8794a664  ! 276: WRPR_TT_I	wrpr	%r18, 0x0664, %tt
	.word 0xa5508000  ! 277: RDPR_TSTATE	rdpr	%tstate, %r18
	.word 0xab504000  ! 278: RDPR_TNPC	<illegal instruction>
	.word 0xad508000  ! 279: RDPR_TSTATE	<illegal instruction>
	setx	0x827f749f00003e50, %g1, %r10
	.word 0x839a8000  ! 280: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xaf500000  ! 281: RDPR_TPC	rdpr	%tpc, %r23
	.word 0xaf484000  ! 282: RDHPR_HTSTATE	rdhpr	%htstate, %r23
	.word 0x8d9569a4  ! 283: WRPR_PSTATE_I	wrpr	%r21, 0x09a4, %pstate
	.word 0x899566dc  ! 284: WRPR_TICK_I	wrpr	%r21, 0x06dc, %tick
	.word 0x879435ac  ! 285: WRPR_TT_I	wrpr	%r16, 0x15ac, %tt
	.word 0xaf450000  ! 286: RDASR	rd	%set_softint, %r23
	.word 0x8d95a188  ! 287: WRPR_PSTATE_I	wrpr	%r22, 0x0188, %pstate
	.word 0xa9500000  ! 288: RDPR_TPC	rdpr	%tpc, %r20
	setx	0x13216c7900000dcb, %g1, %r10
	.word 0x839a8000  ! 289: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xa3500000  ! 290: RDPR_TPC	rdpr	%tpc, %r17
	setx	0x7e484f0500004f40, %g1, %r10
	.word 0x819a8000  ! 291: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x8995a2b4  ! 292: WRPR_TICK_I	wrpr	%r22, 0x02b4, %tick
	setx	0x180faa110000ce0e, %g1, %r10
	.word 0x839a8000  ! 293: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xa3450000  ! 294: RDASR	rd	%set_softint, %r17
	.word 0xa3504000  ! 295: RDPR_TNPC	rdpr	%tnpc, %r17
	.word 0xb185a2b4  ! 296: WRASR_I	wr	%r22, 0x02b4, %-
	.word 0xa3440000  ! 297: RDASR	rd	%-, %r17
	.word 0xa9518000  ! 298: RDPR_PSTATE	<illegal instruction>
	.word 0xa7494000  ! 299: RDHPR_HTBA	rdhpr	%htba, %r19
	.word 0xa385a2b4  ! 300: WRASR_I	wr	%r22, 0x02b4, %-
	.word 0xa3504000  ! 301: RDPR_TNPC	<illegal instruction>
	.word 0xad51c000  ! 302: RDPR_TL	<illegal instruction>
	setx	0x4f47040f0000b917, %g1, %r10
	.word 0x819a8000  ! 303: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xad484000  ! 304: RDHPR_HTSTATE	rdhpr	%htstate, %r22
	.word 0xa1518000  ! 305: RDPR_PSTATE	<illegal instruction>
	.word 0xa3508000  ! 306: RDPR_TSTATE	<illegal instruction>
	.word 0x879dea3d  ! 307: WRHPR_HINTP_I	wrhpr	%r23, 0x0a3d, %hintp
	.word 0xaf480000  ! 308: RDHPR_HPSTATE	rdhpr	%hpstate, %r23
	.word 0xaf410000  ! 309: RDASR	rd	%tick, %r23
	.word 0x8595ed15  ! 310: WRPR_TSTATE_I	wrpr	%r23, 0x0d15, %tstate
	.word 0x8194bd6c  ! 311: WRPR_TPC_I	wrpr	%r18, 0x1d6c, %tpc
	rd	%pcr, %g2
	wr	%g2, 0, %pcr
	.word 0xab508000  ! 313: RDPR_TSTATE	rdpr	%tstate, %r21
	setx	0x92ad07e100006c05, %g1, %r10
	.word 0x819a8000  ! 314: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xa150c000  ! 315: RDPR_TT	rdpr	%tt, %r16
	.word 0xa1454000  ! 316: RDASR	rd	%clear_softint, %r16
	rd	%pcr, %g2
	wr	%g2, 0, %pcr
	.word 0x8794a4b4  ! 318: WRPR_TT_I	wrpr	%r18, 0x04b4, %tt
	.word 0xa384a4b4  ! 319: WRASR_I	wr	%r18, 0x04b4, %-
	.word 0x879dfee6  ! 320: WRHPR_HINTP_I	wrhpr	%r23, 0x1ee6, %hintp
	mov	2, %r12
	.word 0xa1930000  ! 321: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xa950c000  ! 322: RDPR_TT	rdpr	%tt, %r20
	.word 0x8995fc90  ! 323: WRPR_TICK_I	wrpr	%r23, 0x1c90, %tick
	.word 0xa3480000  ! 324: RDHPR_HPSTATE	rdhpr	%hpstate, %r17
	.word 0xa150c000  ! 325: RDPR_TT	<illegal instruction>
	.word 0xb385fc90  ! 326: WRASR_I	wr	%r23, 0x1c90, %-
	.word 0x81947f38  ! 327: WRPR_TPC_I	wrpr	%r17, 0x1f38, %tpc
	mov	1, %r12
	.word 0xa1930000  ! 328: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xa1450000  ! 329: RDASR	rd	%set_softint, %r16
	setx	0xb7faad610000ab4c, %g1, %r10
	.word 0x839a8000  ! 330: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	ta	T_CHANGE_HPRIV
	WRPR	%g0, 0, %tick
	.word 0xa3847f38  ! 331: WRASR_I	wr	%r17, 0x1f38, %-
	.word 0x8195a4b1  ! 332: WRPR_TPC_I	wrpr	%r22, 0x04b1, %tpc
	.word 0xa5494000  ! 333: RDHPR_HTBA	rdhpr	%htba, %r18
	.word 0xa5410000  ! 334: RDASR	rd	%tick, %r18
	ta	T_CHANGE_HPRIV	! macro
	.word 0x9195257c  ! 336: WRPR_PIL_I	wrpr	%r20, 0x057c, %pil
	.word 0xa985257c  ! 337: WRASR_I	wr	%r20, 0x057c, %set_softint
	.word 0xa7500000  ! 338: RDPR_TPC	<illegal instruction>
	.word 0xa7460000  ! 339: RDASR	rd	%-, %r19
	setx	0x9236d50e0000bc4a, %g1, %r10
	.word 0x839a8000  ! 340: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xa3500000  ! 341: RDPR_TPC	rdpr	%tpc, %r17
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8795e56c  ! 343: WRPR_TT_I	wrpr	%r23, 0x056c, %tt
	.word 0xab85e56c  ! 344: WRASR_I	wr	%r23, 0x056c, %clear_softint
	.word 0x8d9537e5  ! 345: WRPR_PSTATE_I	wrpr	%r20, 0x17e5, %pstate
	.word 0x898537e5  ! 346: WRASR_I	wr	%r20, 0x17e5, %tick
	.word 0xa5518000  ! 347: RDPR_PSTATE	rdpr	%pstate, %r18
	.word 0x8594f24d  ! 348: WRPR_TSTATE_I	wrpr	%r19, 0x124d, %tstate
	.word 0xa1520000  ! 349: RDPR_PIL	rdpr	%pil, %r16
	.word 0xa3494000  ! 350: RDHPR_HTBA	rdhpr	%htba, %r17
	.word 0x83953093  ! 351: WRPR_TNPC_I	wrpr	%r20, 0x1093, %tnpc
	setx	0x6fd033210000c944, %g1, %r10
	.word 0x839a8000  ! 352: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x8195772a  ! 353: WRPR_TPC_I	wrpr	%r21, 0x172a, %tpc
	.word 0x8795306d  ! 354: WRPR_TT_I	wrpr	%r20, 0x106d, %tt
	.word 0xa550c000  ! 355: RDPR_TT	rdpr	%tt, %r18
	.word 0xa7484000  ! 356: RDHPR_HTSTATE	rdhpr	%htstate, %r19
	.word 0xa9508000  ! 357: RDPR_TSTATE	<illegal instruction>
	.word 0x8985306d  ! 358: WRASR_I	wr	%r20, 0x106d, %tick
	setx	0x1843a770000079d5, %g1, %r10
	.word 0x819a8000  ! 359: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xa148c000  ! 360: RDHPR_HINTP	rdhpr	%hintp, %r16
	.word 0x879de7bf  ! 361: WRHPR_HINTP_I	wrhpr	%r23, 0x07bf, %hintp
	.word 0xb385e7bf  ! 362: WRASR_I	wr	%r23, 0x07bf, %-
	.word 0x879d68b6  ! 363: WRHPR_HINTP_I	wrhpr	%r21, 0x08b6, %hintp
	.word 0xa1464000  ! 364: RDASR	rd	%-, %r16
	ta	T_CHANGE_PRIV	! macro
	.word 0xad520000  ! 366: RDPR_PIL	rdpr	%pil, %r22
	.word 0x8595ff6b  ! 367: WRPR_TSTATE_I	wrpr	%r23, 0x1f6b, %tstate
	.word 0x879c61c2  ! 368: WRHPR_HINTP_I	wrhpr	%r17, 0x01c2, %hintp
	.word 0xa548c000  ! 369: RDHPR_HINTP	rdhpr	%hintp, %r18
	.word 0x9195f9b5  ! 370: WRPR_PIL_I	wrpr	%r23, 0x19b5, %pil
	setx	0x509b75400000ae85, %g1, %r10
	.word 0x819a8000  ! 371: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x83957051  ! 372: WRPR_TNPC_I	wrpr	%r21, 0x1051, %tnpc
	.word 0xab540000  ! 373: RDPR_GL	rdpr	%-, %r21
	.word 0xab508000  ! 374: RDPR_TSTATE	<illegal instruction>
	.word 0x87947a3d  ! 375: WRPR_TT_I	wrpr	%r17, 0x1a3d, %tt
	ta	T_CHANGE_HPRIV
	WRPR	%g0, 0, %tick
	.word 0xb1847a3d  ! 376: WRASR_I	wr	%r17, 0x1a3d, %-
	.word 0xaf50c000  ! 377: RDPR_TT	<illegal instruction>
	.word 0xb1847a3d  ! 378: WRASR_I	wr	%r17, 0x1a3d, %-
	.word 0xab484000  ! 379: RDHPR_HTSTATE	rdhpr	%htstate, %r21
	.word 0x8395b7cf  ! 380: WRPR_TNPC_I	wrpr	%r22, 0x17cf, %tnpc
	.word 0xaf504000  ! 381: RDPR_TNPC	rdpr	%tnpc, %r23
	.word 0xa5508000  ! 382: RDPR_TSTATE	<illegal instruction>
	.word 0x8795b6ad  ! 383: WRPR_TT_I	wrpr	%r22, 0x16ad, %tt
	.word 0x89957029  ! 384: WRPR_TICK_I	wrpr	%r21, 0x1029, %tick
	.word 0x9194bbcb  ! 385: WRPR_PIL_I	wrpr	%r18, 0x1bcb, %pil
	rd	%pcr, %g2
	wr	%g2, 0, %pcr
	.word 0xab504000  ! 387: RDPR_TNPC	rdpr	%tnpc, %r21
	.word 0xab508000  ! 388: RDPR_TSTATE	<illegal instruction>
	.word 0xa5484000  ! 389: RDHPR_HTSTATE	rdhpr	%htstate, %r18
	.word 0xb384bbcb  ! 390: WRASR_I	wr	%r18, 0x1bcb, %-
	.word 0x81947e6e  ! 391: WRPR_TPC_I	wrpr	%r17, 0x1e6e, %tpc
	.word 0xad500000  ! 392: RDPR_TPC	rdpr	%tpc, %r22
	.word 0x83947b29  ! 393: WRPR_TNPC_I	wrpr	%r17, 0x1b29, %tnpc
	setx	0xeb5714840000ed8b, %g1, %r10
	.word 0x839a8000  ! 394: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xa1494000  ! 395: RDHPR_HTBA	rdhpr	%htba, %r16
	.word 0xaf500000  ! 396: RDPR_TPC	rdpr	%tpc, %r23
	.word 0x8194ff6c  ! 397: WRPR_TPC_I	wrpr	%r19, 0x1f6c, %tpc
	setx	0x26b03e250000f857, %g1, %r10
	.word 0x819a8000  ! 398: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xa950c000  ! 399: RDPR_TT	rdpr	%tt, %r20
	.word 0xaf484000  ! 400: RDHPR_HTSTATE	rdhpr	%htstate, %r23
	.word 0xad494000  ! 401: RDHPR_HTBA	rdhpr	%htba, %r22
	.word 0xa9494000  ! 402: RDHPR_HTBA	rdhpr	%htba, %r20
	.word 0xab508000  ! 403: RDPR_TSTATE	<illegal instruction>
	.word 0x9194a085  ! 404: WRPR_PIL_I	wrpr	%r18, 0x0085, %pil
	.word 0xad50c000  ! 405: RDPR_TT	rdpr	%tt, %r22
	.word 0x8394e42d  ! 406: WRPR_TNPC_I	wrpr	%r19, 0x042d, %tnpc
	.word 0xa1500000  ! 407: RDPR_TPC	rdpr	%tpc, %r16
	.word 0xab48c000  ! 408: RDHPR_HINTP	rdhpr	%hintp, %r21
	.word 0x8395e0d7  ! 409: WRPR_TNPC_I	wrpr	%r23, 0x00d7, %tnpc
	.word 0x8594b82b  ! 410: WRPR_TSTATE_I	wrpr	%r18, 0x182b, %tstate
	.word 0xa950c000  ! 411: RDPR_TT	rdpr	%tt, %r20
	.word 0xa9444000  ! 412: RDASR	rd	%-, %r20
	mov	1, %r12
	.word 0xa1930000  ! 413: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x879c63ce  ! 414: WRHPR_HINTP_I	wrhpr	%r17, 0x03ce, %hintp
	.word 0xa950c000  ! 415: RDPR_TT	rdpr	%tt, %r20
	.word 0xa9454000  ! 416: RDASR	rd	%clear_softint, %r20
	.word 0xab518000  ! 417: RDPR_PSTATE	<illegal instruction>
	.word 0x8d957cd5  ! 418: WRPR_PSTATE_I	wrpr	%r21, 0x1cd5, %pstate
	.word 0xad510000  ! 419: RDPR_TICK	rdpr	%tick, %r22
	.word 0xad508000  ! 420: RDPR_TSTATE	<illegal instruction>
	.word 0xa550c000  ! 421: RDPR_TT	<illegal instruction>
	.word 0x8595f3c7  ! 422: WRPR_TSTATE_I	wrpr	%r23, 0x13c7, %tstate
	.word 0x8594294d  ! 423: WRPR_TSTATE_I	wrpr	%r16, 0x094d, %tstate
	.word 0xaf504000  ! 424: RDPR_TNPC	rdpr	%tnpc, %r23
	.word 0xa5484000  ! 425: RDHPR_HTSTATE	rdhpr	%htstate, %r18
	.word 0x85957ac2  ! 426: WRPR_TSTATE_I	wrpr	%r21, 0x1ac2, %tstate
	.word 0xa1500000  ! 427: RDPR_TPC	rdpr	%tpc, %r16
	.word 0xa1480000  ! 428: RDHPR_HPSTATE	rdhpr	%hpstate, %r16
	.word 0x8194b1bb  ! 429: WRPR_TPC_I	wrpr	%r18, 0x11bb, %tpc
	.word 0xa9500000  ! 430: RDPR_TPC	rdpr	%tpc, %r20
	.word 0xa550c000  ! 431: RDPR_TT	<illegal instruction>
	.word 0xa950c000  ! 432: RDPR_TT	<illegal instruction>
	.word 0xaf520000  ! 433: RDPR_PIL	<illegal instruction>
	.word 0xab484000  ! 434: RDHPR_HTSTATE	rdhpr	%htstate, %r21
	.word 0xaf480000  ! 435: RDHPR_HPSTATE	rdhpr	%hpstate, %r23
	.word 0x8794657b  ! 436: WRPR_TT_I	wrpr	%r17, 0x057b, %tt
	.word 0xa3484000  ! 437: RDHPR_HTSTATE	rdhpr	%htstate, %r17
	.word 0xa1484000  ! 438: RDHPR_HTSTATE	rdhpr	%htstate, %r16
	ta	T_CHANGE_HPRIV
	WRPR	%g0, 0, %tick
	.word 0xaf84657b  ! 439: WRASR_I	wr	%r17, 0x057b, %-
	.word 0x81956b56  ! 440: WRPR_TPC_I	wrpr	%r21, 0x0b56, %tpc
	.word 0x8595b8fc  ! 441: WRPR_TSTATE_I	wrpr	%r22, 0x18fc, %tstate
	ta	T_CHANGE_HPRIV
	WRPR	%g0, 0, %tick
	.word 0xb385b8fc  ! 442: WRASR_I	wr	%r22, 0x18fc, %-
	.word 0xab500000  ! 443: RDPR_TPC	<illegal instruction>
	.word 0xa550c000  ! 444: RDPR_TT	<illegal instruction>
	.word 0x8d95eb58  ! 445: WRPR_PSTATE_I	wrpr	%r23, 0x0b58, %pstate
	.word 0xa148c000  ! 446: RDHPR_HINTP	rdhpr	%hintp, %r16
	.word 0xa9518000  ! 447: RDPR_PSTATE	rdpr	%pstate, %r20
	.word 0xad494000  ! 448: RDHPR_HTBA	rdhpr	%htba, %r22
	.word 0x819570f9  ! 449: WRPR_TPC_I	wrpr	%r21, 0x10f9, %tpc
	.word 0xa548c000  ! 450: RDHPR_HINTP	rdhpr	%hintp, %r18
	.word 0xab500000  ! 451: RDPR_TPC	<illegal instruction>
	.word 0xa3480000  ! 452: RDHPR_HPSTATE	rdhpr	%hpstate, %r17
	.word 0xab504000  ! 453: RDPR_TNPC	<illegal instruction>
	mov	0, %r12
	.word 0x8f930000  ! 454: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x87947d64  ! 455: WRPR_TT_I	wrpr	%r17, 0x1d64, %tt
	setx	0xf0d21a100000eccc, %g1, %r10
	.word 0x819a8000  ! 456: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xaf504000  ! 457: RDPR_TNPC	rdpr	%tnpc, %r23
	.word 0x879de264  ! 458: WRHPR_HINTP_I	wrhpr	%r23, 0x0264, %hintp
	.word 0x83942dba  ! 459: WRPR_TNPC_I	wrpr	%r16, 0x0dba, %tnpc
	.word 0x85946655  ! 460: WRPR_TSTATE_I	wrpr	%r17, 0x0655, %tstate
	.word 0xaf450000  ! 461: RDASR	rd	%set_softint, %r23
	.word 0xa5508000  ! 462: RDPR_TSTATE	rdpr	%tstate, %r18
	.word 0xa5460000  ! 463: RDASR	rd	%-, %r18
	.word 0xa1480000  ! 464: RDHPR_HPSTATE	rdhpr	%hpstate, %r16
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xad518000  ! 466: RDPR_PSTATE	rdpr	%pstate, %r22
	.word 0xad450000  ! 467: RDASR	rd	%set_softint, %r22
	ta	T_CHANGE_HPRIV
	WRPR	%g0, 0, %tick
	.word 0xa9846655  ! 468: WRASR_I	wr	%r17, 0x0655, %set_softint
	.word 0xab480000  ! 469: RDHPR_HPSTATE	rdhpr	%hpstate, %r21
	.word 0xab484000  ! 470: RDHPR_HTSTATE	rdhpr	%htstate, %r21
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa348c000  ! 472: RDHPR_HINTP	rdhpr	%hintp, %r17
	.word 0x9194ed45  ! 473: WRPR_PIL_I	wrpr	%r19, 0x0d45, %pil
	.word 0xa9518000  ! 474: RDPR_PSTATE	rdpr	%pstate, %r20
	.word 0xa1494000  ! 475: RDHPR_HTBA	rdhpr	%htba, %r16
	.word 0xad510000  ! 476: RDPR_TICK	rdpr	%tick, %r22
	.word 0xa7494000  ! 477: RDHPR_HTBA	rdhpr	%htba, %r19
	.word 0x8984ed45  ! 478: WRASR_I	wr	%r19, 0x0d45, %tick
	.word 0xa7458000  ! 479: RDASR	rd	%softint, %r19
	setx	0x41c489960000be52, %g1, %r10
	.word 0x819a8000  ! 480: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x8395a38a  ! 481: WRPR_TNPC_I	wrpr	%r22, 0x038a, %tnpc
	.word 0x879cedf2  ! 482: WRHPR_HINTP_I	wrhpr	%r19, 0x0df2, %hintp
	.word 0x8194a66f  ! 483: WRPR_TPC_I	wrpr	%r18, 0x066f, %tpc
	.word 0x81943882  ! 484: WRPR_TPC_I	wrpr	%r16, 0x1882, %tpc
	.word 0xa3480000  ! 485: RDHPR_HPSTATE	rdhpr	%hpstate, %r17
	.word 0xaf504000  ! 486: RDPR_TNPC	<illegal instruction>
	.word 0xa5480000  ! 487: RDHPR_HPSTATE	rdhpr	%hpstate, %r18
	.word 0xad500000  ! 488: RDPR_TPC	<illegal instruction>
	rd	%pcr, %g2
	wr	%g2, 0, %pcr
	.word 0xad510000  ! 490: RDPR_TICK	<illegal instruction>
	.word 0xad458000  ! 491: RDASR	rd	%softint, %r22
	.word 0xa7540000  ! 492: RDPR_GL	<illegal instruction>
	.word 0xa5484000  ! 493: RDHPR_HTSTATE	rdhpr	%htstate, %r18
	.word 0xad843882  ! 494: WRASR_I	wr	%r16, 0x1882, %softint
	.word 0xab50c000  ! 495: RDPR_TT	<illegal instruction>
	.word 0x8d942c8a  ! 496: WRPR_PSTATE_I	wrpr	%r16, 0x0c8a, %pstate
	.word 0xb1842c8a  ! 497: WRASR_I	wr	%r16, 0x0c8a, %-
	.word 0xab460000  ! 498: RDASR	rd	%-, %r21
	.word 0xad500000  ! 499: RDPR_TPC	<illegal instruction>
	.word 0xa9520000  ! 500: RDPR_PIL	<illegal instruction>
	.word 0xa548c000  ! 501: RDHPR_HINTP	rdhpr	%hintp, %r18
	setx	0x85b0a6b700000c1e, %g1, %r10
	.word 0x839a8000  ! 502: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x8394ea3d  ! 503: WRPR_TNPC_I	wrpr	%r19, 0x0a3d, %tnpc
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa984ea3d  ! 505: WRASR_I	wr	%r19, 0x0a3d, %set_softint
	.word 0xa1540000  ! 506: RDPR_GL	<illegal instruction>
	.word 0xa9500000  ! 507: RDPR_TPC	<illegal instruction>
	.word 0xa384ea3d  ! 508: WRASR_I	wr	%r19, 0x0a3d, %-
	mov	1, %r12
	.word 0x8f930000  ! 509: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xaf494000  ! 510: RDHPR_HTBA	rdhpr	%htba, %r23
	setx	0xc963203000004a5b, %g1, %r10
	.word 0x839a8000  ! 511: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xa7494000  ! 512: RDHPR_HTBA	rdhpr	%htba, %r19
	setx	0x121fb5030000d855, %g1, %r10
	.word 0x819a8000  ! 513: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xa3500000  ! 514: RDPR_TPC	rdpr	%tpc, %r17
	.word 0x8195ee06  ! 515: WRPR_TPC_I	wrpr	%r23, 0x0e06, %tpc
	.word 0xa3458000  ! 516: RDASR	rd	%softint, %r17
	.word 0xab85ee06  ! 517: WRASR_I	wr	%r23, 0x0e06, %clear_softint
	setx	0x3e708db700003885, %g1, %r10
	.word 0x839a8000  ! 518: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xad494000  ! 519: RDHPR_HTBA	rdhpr	%htba, %r22
	.word 0xa5484000  ! 520: RDHPR_HTSTATE	rdhpr	%htstate, %r18
	.word 0xa9494000  ! 521: RDHPR_HTBA	rdhpr	%htba, %r20
	.word 0xa3508000  ! 522: RDPR_TSTATE	<illegal instruction>
	.word 0xab508000  ! 523: RDPR_TSTATE	<illegal instruction>
	setx	0xee14d0630000bed7, %g1, %r10
	.word 0x839a8000  ! 524: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xab50c000  ! 525: RDPR_TT	rdpr	%tt, %r21
	.word 0x8794e936  ! 526: WRPR_TT_I	wrpr	%r19, 0x0936, %tt
	.word 0xa1504000  ! 527: RDPR_TNPC	rdpr	%tnpc, %r16
	.word 0x8d95a181  ! 528: WRPR_PSTATE_I	wrpr	%r22, 0x0181, %pstate
	.word 0xad508000  ! 529: RDPR_TSTATE	rdpr	%tstate, %r22
	.word 0xad508000  ! 530: RDPR_TSTATE	<illegal instruction>
	.word 0xa5508000  ! 531: RDPR_TSTATE	<illegal instruction>
	.word 0x8195e95f  ! 532: WRPR_TPC_I	wrpr	%r23, 0x095f, %tpc
	.word 0x87946406  ! 533: WRPR_TT_I	wrpr	%r17, 0x0406, %tt
	.word 0xad504000  ! 534: RDPR_TNPC	rdpr	%tnpc, %r22
	.word 0x81943dae  ! 535: WRPR_TPC_I	wrpr	%r16, 0x1dae, %tpc
	.word 0xa948c000  ! 536: RDHPR_HINTP	rdhpr	%hintp, %r20
	.word 0x89843dae  ! 537: WRASR_I	wr	%r16, 0x1dae, %tick
	.word 0xa9480000  ! 538: RDHPR_HPSTATE	rdhpr	%hpstate, %r20
	.word 0x8395b8fc  ! 539: WRPR_TNPC_I	wrpr	%r22, 0x18fc, %tnpc
	.word 0x8194f1ea  ! 540: WRPR_TPC_I	wrpr	%r19, 0x11ea, %tpc
	.word 0xa348c000  ! 541: RDHPR_HINTP	rdhpr	%hintp, %r17
	setx	0x2e16833e00007902, %g1, %r10
	.word 0x839a8000  ! 542: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x8d957edb  ! 543: WRPR_PSTATE_I	wrpr	%r21, 0x1edb, %pstate
	.word 0x8394fbd5  ! 544: WRPR_TNPC_I	wrpr	%r19, 0x1bd5, %tnpc
	setx	0xfb7e5f2500002941, %g1, %r10
	.word 0x839a8000  ! 545: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	mov	1, %r12
	.word 0xa1930000  ! 546: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x87943dc3  ! 547: WRPR_TT_I	wrpr	%r16, 0x1dc3, %tt
	.word 0xad50c000  ! 548: RDPR_TT	rdpr	%tt, %r22
	rd	%pcr, %g2
	wr	%g2, 0, %pcr
	.word 0xab50c000  ! 550: RDPR_TT	<illegal instruction>
	.word 0xaf48c000  ! 551: RDHPR_HINTP	rdhpr	%hintp, %r23
	.word 0x89843dc3  ! 552: WRASR_I	wr	%r16, 0x1dc3, %tick
	setx	0x3047aaac0000abd0, %g1, %r10
	.word 0x839a8000  ! 553: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xab504000  ! 554: RDPR_TNPC	rdpr	%tnpc, %r21
	.word 0xaf504000  ! 555: RDPR_TNPC	<illegal instruction>
	.word 0xa7504000  ! 556: RDPR_TNPC	<illegal instruction>
	.word 0x89957bfa  ! 557: WRPR_TICK_I	wrpr	%r21, 0x1bfa, %tick
	.word 0xa7464000  ! 558: RDASR	rd	%-, %r19
	.word 0xa3494000  ! 559: RDHPR_HTBA	rdhpr	%htba, %r17
	.word 0xa9508000  ! 560: RDPR_TSTATE	<illegal instruction>
	.word 0xad500000  ! 561: RDPR_TPC	<illegal instruction>
	.word 0x8d94f875  ! 562: WRPR_PSTATE_I	wrpr	%r19, 0x1875, %pstate
	.word 0xa9480000  ! 563: RDHPR_HPSTATE	rdhpr	%hpstate, %r20
	.word 0xab508000  ! 564: RDPR_TSTATE	<illegal instruction>
	.word 0x8984f875  ! 565: WRASR_I	wr	%r19, 0x1875, %tick
	.word 0xa5484000  ! 566: RDHPR_HTSTATE	rdhpr	%htstate, %r18
	.word 0x8984f875  ! 567: WRASR_I	wr	%r19, 0x1875, %tick
	.word 0xa9494000  ! 568: RDHPR_HTBA	rdhpr	%htba, %r20
	.word 0x819576f9  ! 569: WRPR_TPC_I	wrpr	%r21, 0x16f9, %tpc
	.word 0xa3504000  ! 570: RDPR_TNPC	rdpr	%tnpc, %r17
	.word 0xa1504000  ! 571: RDPR_TNPC	<illegal instruction>
	.word 0xa5508000  ! 572: RDPR_TSTATE	<illegal instruction>
	.word 0xa7494000  ! 573: RDHPR_HTBA	rdhpr	%htba, %r19
	mov	0, %r12
	.word 0x8f930000  ! 574: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xa7484000  ! 575: RDHPR_HTSTATE	rdhpr	%htstate, %r19
	.word 0xa7460000  ! 576: RDASR	rd	%-, %r19
	.word 0x8194399b  ! 577: WRPR_TPC_I	wrpr	%r16, 0x199b, %tpc
	.word 0xa9518000  ! 578: RDPR_PSTATE	rdpr	%pstate, %r20
	.word 0x8194fd29  ! 579: WRPR_TPC_I	wrpr	%r19, 0x1d29, %tpc
	mov	1, %r12
	.word 0x8f930000  ! 580: WRPR_TL_R	wrpr	%r12, %r0, %tl
	setx	0x263a36e70000e984, %g1, %r10
	.word 0x839a8000  ! 581: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x8195f32a  ! 582: WRPR_TPC_I	wrpr	%r23, 0x132a, %tpc
	.word 0xab48c000  ! 583: RDHPR_HINTP	rdhpr	%hintp, %r21
	.word 0x81943de8  ! 584: WRPR_TPC_I	wrpr	%r16, 0x1de8, %tpc
	.word 0xa550c000  ! 585: RDPR_TT	rdpr	%tt, %r18
	.word 0xaf48c000  ! 586: RDHPR_HINTP	rdhpr	%hintp, %r23
	.word 0x8194e881  ! 587: WRPR_TPC_I	wrpr	%r19, 0x0881, %tpc
	.word 0xaf500000  ! 588: RDPR_TPC	rdpr	%tpc, %r23
	.word 0x9194e065  ! 589: WRPR_PIL_I	wrpr	%r19, 0x0065, %pil
	.word 0xa9508000  ! 590: RDPR_TSTATE	rdpr	%tstate, %r20
	setx	0xd5604fe600007e41, %g1, %r10
	.word 0x819a8000  ! 591: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	setx	0x1383280500002f19, %g1, %r10
	.word 0x819a8000  ! 592: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	mov	0, %r12
	.word 0x8f930000  ! 593: WRPR_TL_R	wrpr	%r12, %r0, %tl
	setx	0x199aa59c000019c7, %g1, %r10
	.word 0x839a8000  ! 594: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xab484000  ! 595: RDHPR_HTSTATE	rdhpr	%htstate, %r21
	.word 0x8394603f  ! 596: WRPR_TNPC_I	wrpr	%r17, 0x003f, %tnpc
	ta	T_CHANGE_HPRIV	! macro
	.word 0xab410000  ! 598: RDASR	rd	%tick, %r21
	.word 0xab520000  ! 599: RDPR_PIL	rdpr	%pil, %r21
	.word 0xa3484000  ! 600: RDHPR_HTSTATE	rdhpr	%htstate, %r17
	.word 0xb184603f  ! 601: WRASR_I	wr	%r17, 0x003f, %-
	.word 0x87942bab  ! 602: WRPR_TT_I	wrpr	%r16, 0x0bab, %tt
	.word 0xad842bab  ! 603: WRASR_I	wr	%r16, 0x0bab, %softint
	setx	0xdbb8795b0000aa0c, %g1, %r10
	.word 0x839a8000  ! 604: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xa3484000  ! 605: RDHPR_HTSTATE	rdhpr	%htstate, %r17
	.word 0x85946c25  ! 606: WRPR_TSTATE_I	wrpr	%r17, 0x0c25, %tstate
	setx	0xfeba20860000ab53, %g1, %r10
	.word 0x839a8000  ! 607: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xad480000  ! 608: RDHPR_HPSTATE	rdhpr	%hpstate, %r22
	.word 0x8794a121  ! 609: WRPR_TT_I	wrpr	%r18, 0x0121, %tt
	.word 0x81946b85  ! 610: WRPR_TPC_I	wrpr	%r17, 0x0b85, %tpc
	.word 0xa9846b85  ! 611: WRASR_I	wr	%r17, 0x0b85, %set_softint
	.word 0xa3500000  ! 612: RDPR_TPC	<illegal instruction>
	.word 0xa3484000  ! 613: RDHPR_HTSTATE	rdhpr	%htstate, %r17
	.word 0x8394e79e  ! 614: WRPR_TNPC_I	wrpr	%r19, 0x079e, %tnpc
	setx	0x94e5c9b10000bb9b, %g1, %r10
	.word 0x839a8000  ! 615: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xa7494000  ! 616: RDHPR_HTBA	rdhpr	%htba, %r19
	.word 0x8d947232  ! 617: WRPR_PSTATE_I	wrpr	%r17, 0x1232, %pstate
	.word 0x879566fd  ! 618: WRPR_TT_I	wrpr	%r21, 0x06fd, %tt
	.word 0xa9520000  ! 619: RDPR_PIL	rdpr	%pil, %r20
	rd	%pcr, %g2
	wr	%g2, 0, %pcr
	.word 0xa98566fd  ! 621: WRASR_I	wr	%r21, 0x06fd, %set_softint
	setx	0xa1bc63ea0000b9da, %g1, %r10
	.word 0x839a8000  ! 622: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xaf510000  ! 623: RDPR_TICK	rdpr	%tick, %r23
	.word 0x8395bcb4  ! 624: WRPR_TNPC_I	wrpr	%r22, 0x1cb4, %tnpc
	setx	0xcd73b256000028c6, %g1, %r10
	.word 0x839a8000  ! 625: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xb385bcb4  ! 626: WRASR_I	wr	%r22, 0x1cb4, %-
	.word 0xa1504000  ! 627: RDPR_TNPC	<illegal instruction>
	.word 0xa145c000  ! 628: RDASR	rd	%-, %r16
	.word 0xad48c000  ! 629: RDHPR_HINTP	rdhpr	%hintp, %r22
	.word 0xab50c000  ! 630: RDPR_TT	<illegal instruction>
	setx	0x4d044ec80000de1d, %g1, %r10
	.word 0x839a8000  ! 631: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x8394a2b5  ! 632: WRPR_TNPC_I	wrpr	%r18, 0x02b5, %tnpc
	.word 0x8794a2a5  ! 633: WRPR_TT_I	wrpr	%r18, 0x02a5, %tt
	.word 0xa1480000  ! 634: RDHPR_HPSTATE	rdhpr	%hpstate, %r16
	setx	0x786ae39700004cd4, %g1, %r10
	.word 0x819a8000  ! 635: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x8595662b  ! 636: WRPR_TSTATE_I	wrpr	%r21, 0x062b, %tstate
	.word 0xa1458000  ! 637: RDASR	rd	%softint, %r16
	.word 0xa9480000  ! 638: RDHPR_HPSTATE	rdhpr	%hpstate, %r20
	.word 0xa3514000  ! 639: RDPR_TBA	<illegal instruction>
	.word 0xa9508000  ! 640: RDPR_TSTATE	<illegal instruction>
	mov	1, %r12
	.word 0xa1930000  ! 641: WRPR_GL_R	wrpr	%r12, %r0, %-
	ta	T_CHANGE_HPRIV
	WRPR	%g0, 0, %tick
	.word 0xa385662b  ! 642: WRASR_I	wr	%r21, 0x062b, %-
	.word 0xa3508000  ! 643: RDPR_TSTATE	<illegal instruction>
	.word 0xab500000  ! 644: RDPR_TPC	<illegal instruction>
	.word 0x819465b0  ! 645: WRPR_TPC_I	wrpr	%r17, 0x05b0, %tpc
	.word 0xa9500000  ! 646: RDPR_TPC	rdpr	%tpc, %r20
	.word 0xa1500000  ! 647: RDPR_TPC	<illegal instruction>
	.word 0x8d946ea3  ! 648: WRPR_PSTATE_I	wrpr	%r17, 0x0ea3, %pstate
	setx	0xd7e6d4060000da19, %g1, %r10
	.word 0x819a8000  ! 649: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x81943145  ! 650: WRPR_TPC_I	wrpr	%r16, 0x1145, %tpc
	.word 0x87947d46  ! 651: WRPR_TT_I	wrpr	%r17, 0x1d46, %tt
	.word 0xa9504000  ! 652: RDPR_TNPC	rdpr	%tnpc, %r20
	.word 0xad484000  ! 653: RDHPR_HTSTATE	rdhpr	%htstate, %r22
	setx	0x1d52c20c00007999, %g1, %r10
	.word 0x839a8000  ! 654: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x83947fab  ! 655: WRPR_TNPC_I	wrpr	%r17, 0x1fab, %tnpc
	.word 0xa950c000  ! 656: RDPR_TT	rdpr	%tt, %r20
	.word 0x81943443  ! 657: WRPR_TPC_I	wrpr	%r16, 0x1443, %tpc
	.word 0x8194ad53  ! 658: WRPR_TPC_I	wrpr	%r18, 0x0d53, %tpc
	.word 0xaf510000  ! 659: RDPR_TICK	rdpr	%tick, %r23
	.word 0x8994a3b8  ! 660: WRPR_TICK_I	wrpr	%r18, 0x03b8, %tick
	setx	0xd18f969d00004d89, %g1, %r10
	.word 0x819a8000  ! 661: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xa3540000  ! 662: RDPR_GL	rdpr	%-, %r17
	.word 0x81942b2c  ! 663: WRPR_TPC_I	wrpr	%r16, 0x0b2c, %tpc
	.word 0xa7504000  ! 664: RDPR_TNPC	rdpr	%tnpc, %r19
	.word 0xa1518000  ! 665: RDPR_PSTATE	<illegal instruction>
	.word 0xa7510000  ! 666: RDPR_TICK	<illegal instruction>
	.word 0x81947d6f  ! 667: WRPR_TPC_I	wrpr	%r17, 0x1d6f, %tpc
	.word 0x89847d6f  ! 668: WRASR_I	wr	%r17, 0x1d6f, %tick
	.word 0x8394285f  ! 669: WRPR_TNPC_I	wrpr	%r16, 0x085f, %tnpc
	.word 0xab84285f  ! 670: WRASR_I	wr	%r16, 0x085f, %clear_softint
	.word 0x8984285f  ! 671: WRASR_I	wr	%r16, 0x085f, %tick
	.word 0xa7518000  ! 672: RDPR_PSTATE	rdpr	%pstate, %r19
	.word 0xaf504000  ! 673: RDPR_TNPC	<illegal instruction>
	.word 0x879d7833  ! 674: WRHPR_HINTP_I	wrhpr	%r21, 0x1833, %hintp
	.word 0xaf410000  ! 675: RDASR	rd	%tick, %r23
	.word 0x8d95b519  ! 676: WRPR_PSTATE_I	wrpr	%r22, 0x1519, %pstate
	.word 0xad484000  ! 677: RDHPR_HTSTATE	rdhpr	%htstate, %r22
	.word 0xa9494000  ! 678: RDHPR_HTBA	rdhpr	%htba, %r20
	.word 0xad500000  ! 679: RDPR_TPC	<illegal instruction>
	.word 0x8594f21c  ! 680: WRPR_TSTATE_I	wrpr	%r19, 0x121c, %tstate
	.word 0xab84f21c  ! 681: WRASR_I	wr	%r19, 0x121c, %clear_softint
	.word 0x8395e229  ! 682: WRPR_TNPC_I	wrpr	%r23, 0x0229, %tnpc
	.word 0x879cb836  ! 683: WRHPR_HINTP_I	wrhpr	%r18, 0x1836, %hintp
	setx	0xe24406700000d984, %g1, %r10
	.word 0x839a8000  ! 684: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x8595a65e  ! 685: WRPR_TSTATE_I	wrpr	%r22, 0x065e, %tstate
	setx	0xa63262de00004a85, %g1, %r10
	.word 0x819a8000  ! 686: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xa9484000  ! 687: RDHPR_HTSTATE	rdhpr	%htstate, %r20
	.word 0x85943a85  ! 688: WRPR_TSTATE_I	wrpr	%r16, 0x1a85, %tstate
	.word 0x899574d2  ! 689: WRPR_TICK_I	wrpr	%r21, 0x14d2, %tick
	.word 0x8d95a7b7  ! 690: WRPR_PSTATE_I	wrpr	%r22, 0x07b7, %pstate
	.word 0x8d953dd1  ! 691: WRPR_PSTATE_I	wrpr	%r20, 0x1dd1, %pstate
	.word 0xa9853dd1  ! 692: WRASR_I	wr	%r20, 0x1dd1, %set_softint
	.word 0x8995f9bf  ! 693: WRPR_TICK_I	wrpr	%r23, 0x19bf, %tick
	.word 0xa5508000  ! 694: RDPR_TSTATE	rdpr	%tstate, %r18
	.word 0xa7508000  ! 695: RDPR_TSTATE	<illegal instruction>
	.word 0x8194f2d7  ! 696: WRPR_TPC_I	wrpr	%r19, 0x12d7, %tpc
	.word 0x879dab0d  ! 697: WRHPR_HINTP_I	wrhpr	%r22, 0x0b0d, %hintp
	.word 0xa7460000  ! 698: RDASR	rd	%-, %r19
	.word 0xa551c000  ! 699: RDPR_TL	rdpr	%tl, %r18
	.word 0x8194f40b  ! 700: WRPR_TPC_I	wrpr	%r19, 0x140b, %tpc
	.word 0x83946d88  ! 701: WRPR_TNPC_I	wrpr	%r17, 0x0d88, %tnpc
	.word 0x879dfab3  ! 702: WRHPR_HINTP_I	wrhpr	%r23, 0x1ab3, %hintp
	setx	0x5ad0cda700001b4b, %g1, %r10
	.word 0x819a8000  ! 703: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xa5444000  ! 704: RDASR	rd	%-, %r18
	.word 0xaf48c000  ! 705: RDHPR_HINTP	rdhpr	%hintp, %r23
	setx	0x7b95225a00009fde, %g1, %r10
	.word 0x839a8000  ! 706: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x8395718b  ! 707: WRPR_TNPC_I	wrpr	%r21, 0x118b, %tnpc
	setx	0x704efaf200008c9e, %g1, %r10
	.word 0x819a8000  ! 708: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xad494000  ! 709: RDHPR_HTBA	rdhpr	%htba, %r22
	.word 0xad454000  ! 710: RDASR	rd	%clear_softint, %r22
	.word 0x8795b5c8  ! 711: WRPR_TT_I	wrpr	%r22, 0x15c8, %tt
	.word 0xa7484000  ! 712: RDHPR_HTSTATE	rdhpr	%htstate, %r19
	.word 0x879db625  ! 713: WRHPR_HINTP_I	wrhpr	%r22, 0x1625, %hintp
	.word 0x83943887  ! 714: WRPR_TNPC_I	wrpr	%r16, 0x1887, %tnpc
	.word 0xa5484000  ! 715: RDHPR_HTSTATE	rdhpr	%htstate, %r18
	.word 0x8195f7d7  ! 716: WRPR_TPC_I	wrpr	%r23, 0x17d7, %tpc
	.word 0xb185f7d7  ! 717: WRASR_I	wr	%r23, 0x17d7, %-
	setx	0xc58809e200009d10, %g1, %r10
	.word 0x839a8000  ! 718: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xaf510000  ! 719: RDPR_TICK	rdpr	%tick, %r23
	.word 0xaf444000  ! 720: RDASR	rd	%-, %r23
	.word 0x8395207e  ! 721: WRPR_TNPC_I	wrpr	%r20, 0x007e, %tnpc
	.word 0x85957b78  ! 722: WRPR_TSTATE_I	wrpr	%r21, 0x1b78, %tstate
	.word 0xa548c000  ! 723: RDHPR_HINTP	rdhpr	%hintp, %r18
	.word 0xa7500000  ! 724: RDPR_TPC	<illegal instruction>
	.word 0x8d95ae5a  ! 725: WRPR_PSTATE_I	wrpr	%r22, 0x0e5a, %pstate
	.word 0xab50c000  ! 726: RDPR_TT	rdpr	%tt, %r21
	.word 0xa3504000  ! 727: RDPR_TNPC	<illegal instruction>
	.word 0xa5484000  ! 728: RDHPR_HTSTATE	rdhpr	%htstate, %r18
	.word 0x8195a6cd  ! 729: WRPR_TPC_I	wrpr	%r22, 0x06cd, %tpc
	.word 0xa1480000  ! 730: RDHPR_HPSTATE	rdhpr	%hpstate, %r16
	.word 0x879de225  ! 731: WRHPR_HINTP_I	wrhpr	%r23, 0x0225, %hintp
	.word 0xa1504000  ! 732: RDPR_TNPC	rdpr	%tnpc, %r16
	setx	0xf15b147c0000ba05, %g1, %r10
	.word 0x819a8000  ! 733: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xa145c000  ! 734: RDASR	rd	%-, %r16
	.word 0xad50c000  ! 735: RDPR_TT	rdpr	%tt, %r22
	setx	0x3db6bb2f0000ee47, %g1, %r10
	.word 0x839a8000  ! 736: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xaf514000  ! 737: RDPR_TBA	rdpr	%tba, %r23
	.word 0x8595ebb0  ! 738: WRPR_TSTATE_I	wrpr	%r23, 0x0bb0, %tstate
	.word 0xab508000  ! 739: RDPR_TSTATE	rdpr	%tstate, %r21
	setx	0x71908bac000038d1, %g1, %r10
	.word 0x839a8000  ! 740: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xab51c000  ! 741: RDPR_TL	rdpr	%tl, %r21
	.word 0xa1504000  ! 742: RDPR_TNPC	<illegal instruction>
	.word 0xa3504000  ! 743: RDPR_TNPC	<illegal instruction>
	.word 0x83952662  ! 744: WRPR_TNPC_I	wrpr	%r20, 0x0662, %tnpc
	.word 0x8994b12f  ! 745: WRPR_TICK_I	wrpr	%r18, 0x112f, %tick
	.word 0x8395ac1c  ! 746: WRPR_TNPC_I	wrpr	%r22, 0x0c1c, %tnpc
	.word 0x8395711c  ! 747: WRPR_TNPC_I	wrpr	%r21, 0x111c, %tnpc
	mov	1, %r12
	.word 0xa1930000  ! 748: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x879cad4b  ! 749: WRHPR_HINTP_I	wrhpr	%r18, 0x0d4b, %hintp
	.word 0xa3410000  ! 750: RDASR	rd	%tick, %r17
	.word 0xa5480000  ! 751: RDHPR_HPSTATE	rdhpr	%hpstate, %r18
	.word 0xa7504000  ! 752: RDPR_TNPC	<illegal instruction>
	.word 0x8194e913  ! 753: WRPR_TPC_I	wrpr	%r19, 0x0913, %tpc
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1500000  ! 755: RDPR_TPC	rdpr	%tpc, %r16
	.word 0xa548c000  ! 756: RDHPR_HINTP	rdhpr	%hintp, %r18
	.word 0xa9484000  ! 757: RDHPR_HTSTATE	rdhpr	%htstate, %r20
	.word 0xa7508000  ! 758: RDPR_TSTATE	<illegal instruction>
	setx	0xd0a68b3500000c5c, %g1, %r10
	.word 0x839a8000  ! 759: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	ta	T_CHANGE_PRIV	! macro
	.word 0x83947e3f  ! 761: WRPR_TNPC_I	wrpr	%r17, 0x1e3f, %tnpc
	.word 0xa5504000  ! 762: RDPR_TNPC	rdpr	%tnpc, %r18
	.word 0x8794346f  ! 763: WRPR_TT_I	wrpr	%r16, 0x146f, %tt
	.word 0xad84346f  ! 764: WRASR_I	wr	%r16, 0x146f, %softint
	.word 0xa9504000  ! 765: RDPR_TNPC	<illegal instruction>
	setx	0xfb2eaeba0000dc45, %g1, %r10
	.word 0x819a8000  ! 766: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xa5508000  ! 767: RDPR_TSTATE	rdpr	%tstate, %r18
	.word 0xa5510000  ! 768: RDPR_TICK	<illegal instruction>
	.word 0x879d2683  ! 769: WRHPR_HINTP_I	wrhpr	%r20, 0x0683, %hintp
	.word 0xaf852683  ! 770: WRASR_I	wr	%r20, 0x0683, %-
	.word 0xa5504000  ! 771: RDPR_TNPC	<illegal instruction>
	.word 0xa5458000  ! 772: RDASR	rd	%softint, %r18
	.word 0xa3504000  ! 773: RDPR_TNPC	<illegal instruction>
	ta	T_CHANGE_HPRIV
	WRPR	%g0, 0, %tick
	.word 0xab852683  ! 774: WRASR_I	wr	%r20, 0x0683, %clear_softint
	.word 0xa7504000  ! 775: RDPR_TNPC	<illegal instruction>
	setx	0xa50eb3780000e80a, %g1, %r10
	.word 0x819a8000  ! 776: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	setx	0xfb75047d00008b49, %g1, %r10
	.word 0x819a8000  ! 777: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	mov	2, %r12
	.word 0x8f930000  ! 778: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xa5500000  ! 779: RDPR_TPC	rdpr	%tpc, %r18
	.word 0xa5458000  ! 780: RDASR	rd	%softint, %r18
	.word 0x87943d89  ! 781: WRPR_TT_I	wrpr	%r16, 0x1d89, %tt
	.word 0xa1484000  ! 782: RDHPR_HTSTATE	rdhpr	%htstate, %r16
	.word 0xab50c000  ! 783: RDPR_TT	rdpr	%tt, %r21
	setx	0x679daa4700007cdc, %g1, %r10
	.word 0x819a8000  ! 784: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x8795e99f  ! 785: WRPR_TT_I	wrpr	%r23, 0x099f, %tt
	.word 0xa1508000  ! 786: RDPR_TSTATE	rdpr	%tstate, %r16
	.word 0xa1508000  ! 787: RDPR_TSTATE	rdpr	%tstate, %r16
	.word 0x83947286  ! 788: WRPR_TNPC_I	wrpr	%r17, 0x1286, %tnpc
	setx	0x6dac761e0000aecb, %g1, %r10
	.word 0x839a8000  ! 789: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xaf484000  ! 790: RDHPR_HTSTATE	rdhpr	%htstate, %r23
	.word 0xa5508000  ! 791: RDPR_TSTATE	<illegal instruction>
	.word 0xa5410000  ! 792: RDASR	rd	%tick, %r18
	.word 0xa150c000  ! 793: RDPR_TT	<illegal instruction>
	.word 0xad504000  ! 794: RDPR_TNPC	<illegal instruction>
	setx	0xe2fd21b90000ac5e, %g1, %r10
	.word 0x819a8000  ! 795: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xa9508000  ! 796: RDPR_TSTATE	rdpr	%tstate, %r20
	.word 0x87943280  ! 797: WRPR_TT_I	wrpr	%r16, 0x1280, %tt
	mov	0, %r12
	.word 0x8f930000  ! 798: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xa3480000  ! 799: RDHPR_HPSTATE	rdhpr	%hpstate, %r17
	.word 0x8395f134  ! 800: WRPR_TNPC_I	wrpr	%r23, 0x1134, %tnpc
	setx	0xe32585790000cfcf, %g1, %r10
	.word 0x839a8000  ! 801: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x879c7c05  ! 802: WRHPR_HINTP_I	wrhpr	%r17, 0x1c05, %hintp
	.word 0xa5504000  ! 803: RDPR_TNPC	rdpr	%tnpc, %r18
	.word 0xaf508000  ! 804: RDPR_TSTATE	<illegal instruction>
	setx	0xd61d8a7b0000fb4c, %g1, %r10
	.word 0x819a8000  ! 805: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xa9484000  ! 806: RDHPR_HTSTATE	rdhpr	%htstate, %r20
	.word 0x899424c5  ! 807: WRPR_TICK_I	wrpr	%r16, 0x04c5, %tick
	.word 0x879db4ab  ! 808: WRHPR_HINTP_I	wrhpr	%r22, 0x14ab, %hintp
	.word 0xab85b4ab  ! 809: WRASR_I	wr	%r22, 0x14ab, %clear_softint
	.word 0x879dade9  ! 810: WRHPR_HINTP_I	wrhpr	%r22, 0x0de9, %hintp
	ta	T_CHANGE_PRIV	! macro
	.word 0x8985ade9  ! 812: WRASR_I	wr	%r22, 0x0de9, %tick
	.word 0xa548c000  ! 813: RDHPR_HINTP	rdhpr	%hintp, %r18
	mov	0, %r12
	.word 0x8f930000  ! 814: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xa150c000  ! 815: RDPR_TT	rdpr	%tt, %r16
	.word 0xab520000  ! 816: RDPR_PIL	rdpr	%pil, %r21
	.word 0xab410000  ! 817: RDASR	rd	%tick, %r21
	.word 0x919420ff  ! 818: WRPR_PIL_I	wrpr	%r16, 0x00ff, %pil
	.word 0xab8420ff  ! 819: WRASR_I	wr	%r16, 0x00ff, %clear_softint
	setx	0x4690015400001e4a, %g1, %r10
	.word 0x839a8000  ! 820: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x8595a81c  ! 821: WRPR_TSTATE_I	wrpr	%r22, 0x081c, %tstate
	.word 0x8395f8df  ! 822: WRPR_TNPC_I	wrpr	%r23, 0x18df, %tnpc
	.word 0xad518000  ! 823: RDPR_PSTATE	rdpr	%pstate, %r22
	.word 0xa3484000  ! 824: RDHPR_HTSTATE	rdhpr	%htstate, %r17
	.word 0xa5484000  ! 825: RDHPR_HTSTATE	rdhpr	%htstate, %r18
	.word 0xab508000  ! 826: RDPR_TSTATE	<illegal instruction>
	.word 0x87957567  ! 827: WRPR_TT_I	wrpr	%r21, 0x1567, %tt
	setx	0x2b60f59500006fd1, %g1, %r10
	.word 0x839a8000  ! 828: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x879c63b1  ! 829: WRHPR_HINTP_I	wrhpr	%r17, 0x03b1, %hintp
	.word 0xaf500000  ! 830: RDPR_TPC	rdpr	%tpc, %r23
	.word 0xad484000  ! 831: RDHPR_HTSTATE	rdhpr	%htstate, %r22
	.word 0xa3510000  ! 832: RDPR_TICK	<illegal instruction>
	.word 0x879dfb44  ! 833: WRHPR_HINTP_I	wrhpr	%r23, 0x1b44, %hintp
	.word 0xad85fb44  ! 834: WRASR_I	wr	%r23, 0x1b44, %softint
	.word 0xa1500000  ! 835: RDPR_TPC	<illegal instruction>
	.word 0xaf508000  ! 836: RDPR_TSTATE	<illegal instruction>
	.word 0xa3480000  ! 837: RDHPR_HPSTATE	rdhpr	%hpstate, %r17
	.word 0x819430ce  ! 838: WRPR_TPC_I	wrpr	%r16, 0x10ce, %tpc
	.word 0xa3444000  ! 839: RDASR	rd	%-, %r17
	.word 0xa150c000  ! 840: RDPR_TT	rdpr	%tt, %r16
	.word 0x879570dd  ! 841: WRPR_TT_I	wrpr	%r21, 0x10dd, %tt
	.word 0xa7494000  ! 842: RDHPR_HTBA	rdhpr	%htba, %r19
	.word 0xa151c000  ! 843: RDPR_TL	<illegal instruction>
	.word 0x9195b06b  ! 844: WRPR_PIL_I	wrpr	%r22, 0x106b, %pil
	.word 0xa5500000  ! 845: RDPR_TPC	rdpr	%tpc, %r18
	.word 0xa950c000  ! 846: RDPR_TT	<illegal instruction>
	setx	0x54ac702e00005816, %g1, %r10
	.word 0x819a8000  ! 847: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	mov	0, %r12
	.word 0x8f930000  ! 848: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xaf504000  ! 849: RDPR_TNPC	rdpr	%tnpc, %r23
	.word 0xa1484000  ! 850: RDHPR_HTSTATE	rdhpr	%htstate, %r16
	.word 0x91956945  ! 851: WRPR_PIL_I	wrpr	%r21, 0x0945, %pil
	.word 0xaf856945  ! 852: WRASR_I	wr	%r21, 0x0945, %-
	.word 0xab508000  ! 853: RDPR_TSTATE	<illegal instruction>
	.word 0xad480000  ! 854: RDHPR_HPSTATE	rdhpr	%hpstate, %r22
	.word 0x879c66fb  ! 855: WRHPR_HINTP_I	wrhpr	%r17, 0x06fb, %hintp
	.word 0x8195efa0  ! 856: WRPR_TPC_I	wrpr	%r23, 0x0fa0, %tpc
	.word 0xad454000  ! 857: RDASR	rd	%clear_softint, %r22
	.word 0x8595a3df  ! 858: WRPR_TSTATE_I	wrpr	%r22, 0x03df, %tstate
	.word 0x87957971  ! 859: WRPR_TT_I	wrpr	%r21, 0x1971, %tt
	.word 0xa1520000  ! 860: RDPR_PIL	rdpr	%pil, %r16
	mov	1, %r12
	.word 0x8f930000  ! 861: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xaf48c000  ! 862: RDHPR_HINTP	rdhpr	%hintp, %r23
	.word 0xa5504000  ! 863: RDPR_TNPC	<illegal instruction>
	setx	0xf5c8660e00002b4e, %g1, %r10
	.word 0x819a8000  ! 864: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	ta	T_CHANGE_HPRIV
	WRPR	%g0, 0, %tick
	.word 0xad857971  ! 865: WRASR_I	wr	%r21, 0x1971, %softint
	setx	0xd51e34cd00009f50, %g1, %r10
	.word 0x839a8000  ! 866: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xaf510000  ! 867: RDPR_TICK	rdpr	%tick, %r23
	.word 0xa1484000  ! 868: RDHPR_HTSTATE	rdhpr	%htstate, %r16
	setx	0x677f887100008bd3, %g1, %r10
	.word 0x819a8000  ! 869: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x8195fae7  ! 870: WRPR_TPC_I	wrpr	%r23, 0x1ae7, %tpc
	.word 0xa9500000  ! 871: RDPR_TPC	rdpr	%tpc, %r20
	.word 0x879536c7  ! 872: WRPR_TT_I	wrpr	%r20, 0x16c7, %tt
	.word 0xa1508000  ! 873: RDPR_TSTATE	rdpr	%tstate, %r16
	.word 0x81956301  ! 874: WRPR_TPC_I	wrpr	%r21, 0x0301, %tpc
	.word 0xaf856301  ! 875: WRASR_I	wr	%r21, 0x0301, %-
	.word 0x81942488  ! 876: WRPR_TPC_I	wrpr	%r16, 0x0488, %tpc
	.word 0xa3500000  ! 877: RDPR_TPC	rdpr	%tpc, %r17
	.word 0xa345c000  ! 878: RDASR	rd	%-, %r17
	.word 0xa3480000  ! 879: RDHPR_HPSTATE	rdhpr	%hpstate, %r17
	.word 0xa5518000  ! 880: RDPR_PSTATE	<illegal instruction>
	.word 0xaf48c000  ! 881: RDHPR_HINTP	rdhpr	%hintp, %r23
	.word 0xa9500000  ! 882: RDPR_TPC	<illegal instruction>
	.word 0xa9464000  ! 883: RDASR	rd	%-, %r20
	.word 0xa7494000  ! 884: RDHPR_HTBA	rdhpr	%htba, %r19
	.word 0x8395b777  ! 885: WRPR_TNPC_I	wrpr	%r22, 0x1777, %tnpc
	.word 0x819531e9  ! 886: WRPR_TPC_I	wrpr	%r20, 0x11e9, %tpc
	.word 0xa7410000  ! 887: RDASR	rd	%tick, %r19
	.word 0xa7410000  ! 888: RDASR	rd	%tick, %r19
	.word 0xa348c000  ! 889: RDHPR_HINTP	rdhpr	%hintp, %r17
	.word 0x879d619a  ! 890: WRHPR_HINTP_I	wrhpr	%r21, 0x019a, %hintp
	.word 0xaf508000  ! 891: RDPR_TSTATE	rdpr	%tstate, %r23
	.word 0xad504000  ! 892: RDPR_TNPC	<illegal instruction>
	.word 0x879d2e98  ! 893: WRHPR_HINTP_I	wrhpr	%r20, 0x0e98, %hintp
	.word 0xa9484000  ! 894: RDHPR_HTSTATE	rdhpr	%htstate, %r20
	.word 0x8394acd9  ! 895: WRPR_TNPC_I	wrpr	%r18, 0x0cd9, %tnpc
	.word 0xab508000  ! 896: RDPR_TSTATE	rdpr	%tstate, %r21
	.word 0x8595a0ee  ! 897: WRPR_TSTATE_I	wrpr	%r22, 0x00ee, %tstate
	.word 0xa7500000  ! 898: RDPR_TPC	rdpr	%tpc, %r19
	.word 0xab508000  ! 899: RDPR_TSTATE	<illegal instruction>
	.word 0x9194710d  ! 900: WRPR_PIL_I	wrpr	%r17, 0x110d, %pil
	ta	T_CHANGE_HPRIV
	WRPR	%g0, 0, %tick
	.word 0xab84710d  ! 901: WRASR_I	wr	%r17, 0x110d, %clear_softint
	.word 0xab84710d  ! 902: WRASR_I	wr	%r17, 0x110d, %clear_softint
	.word 0x8194e235  ! 903: WRPR_TPC_I	wrpr	%r19, 0x0235, %tpc
	.word 0xad500000  ! 904: RDPR_TPC	rdpr	%tpc, %r22
	.word 0xa7508000  ! 905: RDPR_TSTATE	<illegal instruction>
	.word 0xa7508000  ! 906: RDPR_TSTATE	<illegal instruction>
	.word 0x819571ef  ! 907: WRPR_TPC_I	wrpr	%r21, 0x11ef, %tpc
	.word 0xab510000  ! 908: RDPR_TICK	rdpr	%tick, %r21
	mov	1, %r12
	.word 0x8f930000  ! 909: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xab450000  ! 910: RDASR	rd	%set_softint, %r21
	setx	0x695072e200001a91, %g1, %r10
	.word 0x839a8000  ! 911: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xa3508000  ! 912: RDPR_TSTATE	rdpr	%tstate, %r17
	.word 0x898571ef  ! 913: WRASR_I	wr	%r21, 0x11ef, %tick
	.word 0xa3504000  ! 914: RDPR_TNPC	rdpr	%tnpc, %r17
	.word 0xa98571ef  ! 915: WRASR_I	wr	%r21, 0x11ef, %set_softint
	.word 0xa9504000  ! 916: RDPR_TNPC	<illegal instruction>
	.word 0xa7520000  ! 917: RDPR_PIL	<illegal instruction>
	.word 0xa7410000  ! 918: RDASR	rd	%tick, %r19
	.word 0xa351c000  ! 919: RDPR_TL	<illegal instruction>
	.word 0xad8571ef  ! 920: WRASR_I	wr	%r21, 0x11ef, %softint
	.word 0xa3504000  ! 921: RDPR_TNPC	<illegal instruction>
	.word 0xab504000  ! 922: RDPR_TNPC	<illegal instruction>
	.word 0xa7500000  ! 923: RDPR_TPC	<illegal instruction>
	.word 0x8594ed5a  ! 924: WRPR_TSTATE_I	wrpr	%r19, 0x0d5a, %tstate
	setx	0x6c0df660000ab43, %g1, %r10
	.word 0x839a8000  ! 925: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xa1504000  ! 926: RDPR_TNPC	rdpr	%tnpc, %r16
	.word 0xab84ed5a  ! 927: WRASR_I	wr	%r19, 0x0d5a, %clear_softint
	.word 0x839526a4  ! 928: WRPR_TNPC_I	wrpr	%r20, 0x06a4, %tnpc
	.word 0x8594f9ee  ! 929: WRPR_TSTATE_I	wrpr	%r19, 0x19ee, %tstate
	.word 0xa7514000  ! 930: RDPR_TBA	rdpr	%tba, %r19
	.word 0x8394260f  ! 931: WRPR_TNPC_I	wrpr	%r16, 0x060f, %tnpc
	.word 0xa1500000  ! 932: RDPR_TPC	rdpr	%tpc, %r16
	.word 0xaf50c000  ! 933: RDPR_TT	rdpr	%tt, %r23
	.word 0x87953e92  ! 934: WRPR_TT_I	wrpr	%r20, 0x1e92, %tt
	.word 0xab50c000  ! 935: RDPR_TT	rdpr	%tt, %r21
	.word 0xa9484000  ! 936: RDHPR_HTSTATE	rdhpr	%htstate, %r20
	.word 0x8194f5f3  ! 937: WRPR_TPC_I	wrpr	%r19, 0x15f3, %tpc
	.word 0xaf494000  ! 938: RDHPR_HTBA	rdhpr	%htba, %r23
	.word 0xa3504000  ! 939: RDPR_TNPC	<illegal instruction>
	.word 0xa3484000  ! 940: RDHPR_HTSTATE	rdhpr	%htstate, %r17
	.word 0xa3410000  ! 941: RDASR	rd	%tick, %r17
	.word 0x839566c1  ! 942: WRPR_TNPC_I	wrpr	%r21, 0x06c1, %tnpc
	.word 0x8d95b239  ! 943: WRPR_PSTATE_I	wrpr	%r22, 0x1239, %pstate
	.word 0xa3454000  ! 944: RDASR	rd	%clear_softint, %r17
	.word 0xa3454000  ! 945: RDASR	rd	%clear_softint, %r17
	.word 0xad504000  ! 946: RDPR_TNPC	rdpr	%tnpc, %r22
	.word 0x879ceec6  ! 947: WRHPR_HINTP_I	wrhpr	%r19, 0x0ec6, %hintp
	.word 0xad50c000  ! 948: RDPR_TT	rdpr	%tt, %r22
	.word 0xab84eec6  ! 949: WRASR_I	wr	%r19, 0x0ec6, %clear_softint
	.word 0x8984eec6  ! 950: WRASR_I	wr	%r19, 0x0ec6, %tick
	.word 0xad50c000  ! 951: RDPR_TT	rdpr	%tt, %r22
	.word 0xaf508000  ! 952: RDPR_TSTATE	<illegal instruction>
	.word 0xaf444000  ! 953: RDASR	rd	%-, %r23
	.word 0x8794735e  ! 954: WRPR_TT_I	wrpr	%r17, 0x135e, %tt
	.word 0xad48c000  ! 955: RDHPR_HINTP	rdhpr	%hintp, %r22
	.word 0xa550c000  ! 956: RDPR_TT	<illegal instruction>
	.word 0x859525f6  ! 957: WRPR_TSTATE_I	wrpr	%r20, 0x05f6, %tstate
	.word 0x819460a2  ! 958: WRPR_TPC_I	wrpr	%r17, 0x00a2, %tpc
	.word 0xad540000  ! 959: RDPR_GL	rdpr	%-, %r22
	.word 0x9194bfd4  ! 960: WRPR_PIL_I	wrpr	%r18, 0x1fd4, %pil
	.word 0xad504000  ! 961: RDPR_TNPC	rdpr	%tnpc, %r22
	.word 0x81953b43  ! 962: WRPR_TPC_I	wrpr	%r20, 0x1b43, %tpc
	.word 0xa150c000  ! 963: RDPR_TT	rdpr	%tt, %r16
	.word 0x8995731b  ! 964: WRPR_TICK_I	wrpr	%r21, 0x131b, %tick
	.word 0x8d95fef9  ! 965: WRPR_PSTATE_I	wrpr	%r23, 0x1ef9, %pstate
	.word 0xa3484000  ! 966: RDHPR_HTSTATE	rdhpr	%htstate, %r17
	.word 0x879c6e19  ! 967: WRHPR_HINTP_I	wrhpr	%r17, 0x0e19, %hintp
	.word 0x879db0db  ! 968: WRHPR_HINTP_I	wrhpr	%r22, 0x10db, %hintp
	.word 0x8195adab  ! 969: WRPR_TPC_I	wrpr	%r22, 0x0dab, %tpc
	.word 0xaf85adab  ! 970: WRASR_I	wr	%r22, 0x0dab, %-
	.word 0xa3480000  ! 971: RDHPR_HPSTATE	rdhpr	%hpstate, %r17
	.word 0x91957c12  ! 972: WRPR_PIL_I	wrpr	%r21, 0x1c12, %pil
	.word 0xa3484000  ! 973: RDHPR_HTSTATE	rdhpr	%htstate, %r17
	.word 0xa7500000  ! 974: RDPR_TPC	<illegal instruction>
	.word 0x8d95f6a2  ! 975: WRPR_PSTATE_I	wrpr	%r23, 0x16a2, %pstate
	.word 0xa9510000  ! 976: RDPR_TICK	rdpr	%tick, %r20
	.word 0xa9504000  ! 977: RDPR_TNPC	<illegal instruction>
	.word 0xa5518000  ! 978: RDPR_PSTATE	<illegal instruction>
	setx	0x82447b2d00005a5a, %g1, %r10
	.word 0x819a8000  ! 979: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xa3504000  ! 980: RDPR_TNPC	rdpr	%tnpc, %r17
	ta	T_CHANGE_HPRIV
	WRPR	%g0, 0, %tick
	.word 0xaf85f6a2  ! 981: WRASR_I	wr	%r23, 0x16a2, %-
	.word 0xa9484000  ! 982: RDHPR_HTSTATE	rdhpr	%htstate, %r20
	.word 0x8195f0e6  ! 983: WRPR_TPC_I	wrpr	%r23, 0x10e6, %tpc
	.word 0xaf510000  ! 984: RDPR_TICK	rdpr	%tick, %r23
	.word 0xaf508000  ! 985: RDPR_TSTATE	<illegal instruction>
	.word 0x879cf1b5  ! 986: WRHPR_HINTP_I	wrhpr	%r19, 0x11b5, %hintp
	.word 0xa1514000  ! 987: RDPR_TBA	rdpr	%tba, %r16
	.word 0xa5504000  ! 988: RDPR_TNPC	rdpr	%tnpc, %r18
	.word 0xa5440000  ! 989: RDASR	rd	%-, %r18
	.word 0x8395b1ae  ! 990: WRPR_TNPC_I	wrpr	%r22, 0x11ae, %tnpc
	.word 0x8595fb91  ! 991: WRPR_TSTATE_I	wrpr	%r23, 0x1b91, %tstate
	.word 0xa1484000  ! 992: RDHPR_HTSTATE	rdhpr	%htstate, %r16
	.word 0xa1444000  ! 993: RDASR	rd	%-, %r16
	.word 0x839529de  ! 994: WRPR_TNPC_I	wrpr	%r20, 0x09de, %tnpc
	.word 0x8595e3ab  ! 995: WRPR_TSTATE_I	wrpr	%r23, 0x03ab, %tstate
	setx	0xcefbcb940000acdd, %g1, %r10
	.word 0x819a8000  ! 996: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xa7504000  ! 997: RDPR_TNPC	rdpr	%tnpc, %r19
	.word 0xa3520000  ! 998: RDPR_PIL	<illegal instruction>
	.data
data_start:

	.xword	0xe818d6803d2d7357
	.xword	0xbbb5176f9dd1060f
	.xword	0xf4cc01bbabfcdfe8
	.xword	0x09504f9fe01a0b4d
	.xword	0x7af5023135c40b9e
	.xword	0x81d10645cf1a2e88
	.xword	0xd9caf5819e82411b
	.xword	0xcf141f722c8a6b97
	.xword	0x6851d742db26e9b5
	.xword	0x2880d8a33c838706
	.xword	0x51483cb8ceb60e58
	.xword	0x707eda7e2895712f
	.xword	0x895300ebb0659c0a
	.xword	0x8f28ab64c04c41ea
	.xword	0xbc6e285cc1e6bf18
	.xword	0x4933adf3fdcbf8e7



.text
	ta	T_GOOD_TRAP

.data
	.xword 0x1234567887654321

#if 0
!!# /*
!!#  */
!!# 
!!# %%section c_declarations
!!# 
!!# 
!!# int asr_val;
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
!!#   IJ_bind_thread_group("diag.j", 15, th_M,    0x01);
!!# 
!!#   IJ_set_rvar ("diag.j", 17, Rv_low_wt, "{1}");
!!#   IJ_set_rvar ("diag.j", 18, Rv_mid_wt, "{8}");
!!#   IJ_set_default_rule_wt_rvar ( "diag.j", 19,"{16}" );
!!# 
!!#   IJ_set_rvar ("diag.j", 21, Rv_rand64, "64'hrrrr rrrr rrrr rrrr");
!!# 
!!#   // HPSTATE/HTSTATE write data
!!#   IJ_set_rvar ("diag.j", 24, Rv_hpstate, "48'hrrrr rrrr rrrr, 16'brrrr 1rrr rr0r rrrr");
!!#   IJ_set_ropr_fld ("diag.j", 25, Rop_hpstate_rs1, Ft_Rs1, "{10}");
!!#   IJ_set_rvar ("diag.j", 26, Rv_tl_lvl, "{0..2}");
!!#   IJ_set_ropr_fld ("diag.j", 27, Rop_tl_rs1, Ft_Rs1, "{12}");
!!# 
!!#   IJ_set_ropr_fld ("diag.j", 29, ijdefault, Ft_Rs1, "{16..23}");
!!#   IJ_set_ropr_fld ("diag.j", 30, ijdefault, Ft_Rs2, "{0}");
!!#   IJ_set_ropr_fld ("diag.j", 31, ijdefault, Ft_Simm13, "13'br rrrr rrrr rrrr");
!!#   IJ_set_ropr_fld ("diag.j", 32, ijdefault, Ft_Rd, "{16..23}");
!!# 
!!#   IJ_set_ropr_fld ("diag.j", 34, Rrd_reg_asr, Ft_Rs1, "{0x4, 0x10, 0x11, 0x14, 0x15, 0x16, 0x17, 0x18, 0x19}");
!!#   IJ_set_ropr_fld ("diag.j", 35, Rwr_reg_asr, Ft_Rd,  "{0x4, 0x11, 0x14, 0x15, 0x16, 0x17, 0x18, 0x19}");
!!# 
!!#   IJ_init_regs_by_setx ("diag.j", 37, th_M, 1, 0, Rv_rand64);
!!#   IJ_printf ("diag.j", 38, th_M, "\tsetx\tdata_start, %%r1, %%r25\n");
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
!!#   int i, j;
!!# 
!!#   IJ_printf ("diag.j", 46, th_M, "\t.data\ndata_start:\n\n");
!!#   for (i = 0; i < 16; i++) {
!!# 		IJ_printf  ("diag.j", 48, th_M,"\t.xword\t0x%016llrx\n", Rv_rand64);
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
!!# 	{
!!# 		IJ_generate ("diag.j", 82, th_M, $2);
!!# 	}
!!# ;
!!# 
!!# inst_type: 
!!# 	read_asr 
!!# 	| write_asr 
!!# 	| rd_tsa_asr 
!!# 	| wr_tsa_asr 
!!# 	| pcr_wr %rvar  Rv_low_wt
!!# 	| change_priv %rvar  Rv_low_wt
!!# ;
!!# 
!!# read_asr: 
!!# 	rd_reg_asr 
!!# 	| rd_hpriv_asr 
!!# 	| rd_priv_asr
!!# ;
!!# 
!!# write_asr: 
!!# 	wr_reg_asr 
!!# 	| wr_hpriv_asr 
!!# 	| wr_priv_asr 
!!# ;
!!# 
!!# rd_reg_asr: 
!!# 	tRDASR %ropr  Rrd_reg_asr
!!# ;
!!# 
!!# wr_reg_asr: 
!!# 	tWRASR_I %ropr  Rwr_reg_asr
!!# 	{
!!# 	  asr_val = IJ_get_ropr_fld_val ("diag.j", 115, Rwr_reg_asr, Ft_Rd);
!!# 	  if ((asr_val == 0x17) || (asr_val == 0x19)) {
!!# 	     IJ_printf ("diag.j", 117, th_M, "\tta\tT_CHANGE_HPRIV\n");
!!# 	     IJ_printf ("diag.j", 118, th_M, "\tWRPR\t%%g0, 0, %%tick\n");
!!#           }
!!# 	}
!!# ;
!!# 
!!# rd_hpriv_asr: 
!!# 	tRDHPR_HPSTATE 
!!# 	| tRDHPR_HINTP
!!# 	| tRDHPR_HTBA
!!# ;
!!# 
!!# wr_hpriv_asr: 
!!# 	tWRHPR_HPSTATE_R 	%ropr  Rop_hpstate_rs1
!!#         {
!!#           IJ_printf ("diag.j", 132, th_M, "\tsetx\t0x%llrx, %%g1, %%r10\n", Rv_hpstate);
!!#         }
!!# 	| tWRHPR_HINTP_I
!!# ;
!!# 
!!# rd_priv_asr: 
!!# 	tRDPR_TBA 
!!# 	| tRDPR_PSTATE 
!!# 	| tRDPR_TL 
!!# 	| tRDPR_PIL 
!!# 	| tRDPR_GL 
!!# 	| tRDPR_TICK
!!# ;
!!# 
!!# wr_priv_asr: 
!!# 	tWRPR_TICK_I 
!!# 	| tWRPR_PSTATE_I 
!!# 	| tWRPR_TL_R	%ropr  Rop_tl_rs1
!!#         {
!!#           IJ_printf ("diag.j", 151, th_M, "\tmov\t%rd, %%r12\n", Rv_tl_lvl);
!!#         }
!!# 	| tWRPR_PIL_I 
!!# 	| tWRPR_GL_R	%ropr  Rop_tl_rs1
!!#         {
!!#           IJ_printf ("diag.j", 156, th_M, "\tmov\t%rd, %%r12\n", Rv_tl_lvl);
!!#         }
!!# ;
!!# 
!!# rd_tsa_asr: 
!!# 	tRDHPR_HTSTATE
!!# 	| tRDPR_TPC 
!!# 	| tRDPR_TNPC 
!!# 	| tRDPR_TSTATE 
!!# 	| tRDPR_TT 
!!# ;
!!# 
!!# wr_tsa_asr: 
!!# 	tWRHPR_HTSTATE_R	%ropr  Rop_hpstate_rs1
!!#         {
!!#           IJ_printf ("diag.j", 171, th_M, "\tsetx\t0x%llrx, %%g1, %%r10\n", Rv_hpstate);
!!#         }
!!# 	| tWRPR_TPC_I 
!!# 	| tWRPR_TNPC_I 
!!# 	| tWRPR_TSTATE_I 
!!# 	| tWRPR_TT_I 
!!# ;
!!# 
!!# pcr_wr: mPCR_WR
!!# 	{
!!# 	  IJ_printf ("diag.j", 181, th_M, "\trd\t%%pcr, %%g2\n");
!!# 	  IJ_printf ("diag.j", 182, th_M, "\twr\t%%g2, 0, %%pcr\n");
!!# 	}
!!# change_priv: 
!!# 	tCHANGE_NONPRIV 
!!# 	| tCHANGE_PRIV 
!!# 	| tCHANGE_NONHPRIV 
!!# 	| tCHANGE_HPRIV 
!!# ;
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
