// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tlu_asr_access_1_rand_s2.s
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
   random seed:	41534423
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

	setx 0x70c26b763be7d66c, %g1, %g0
	setx 0x4db8c5e1f503668b, %g1, %g1
	setx 0x2c7210764dbb7489, %g1, %g2
	setx 0x35588be9dd30c9e3, %g1, %g3
	setx 0x634149e2a4008cdc, %g1, %g4
	setx 0x90c54900dbe2aed0, %g1, %g5
	setx 0x83a5817bbb057960, %g1, %g6
	setx 0x4485cd5a009ce3be, %g1, %g7
	setx 0xb0fe0d17a3251027, %g1, %r16
	setx 0xcdc454b44f7278b5, %g1, %r17
	setx 0xb76a5434632545f8, %g1, %r18
	setx 0x22421a86e692b32d, %g1, %r19
	setx 0x7a5401c1e5e5b180, %g1, %r20
	setx 0x57597c759112412c, %g1, %r21
	setx 0xdfac53b8ddd24654, %g1, %r22
	setx 0xcb9af33d75f42097, %g1, %r23
	setx 0x2282d9df5d634551, %g1, %r24
	setx 0x2ad32c486843a6b1, %g1, %r25
	setx 0x8b8ce64be3578218, %g1, %r26
	setx 0xf2688077ea7d3131, %g1, %r27
	setx 0xbcead809518eea34, %g1, %r28
	setx 0x080e665ff22f599b, %g1, %r29
	setx 0x6fae91e49326de48, %g1, %r30
	setx 0xc22e6cb6f5ac2eba, %g1, %r31
	setx	data_start, %r1, %r25
	.word 0xa3500000  ! 1: RDPR_TPC	rdpr	%tpc, %r17
	.word 0xa3504000  ! 2: RDPR_TNPC	<illegal instruction>
	mov	1, %r12
	.word 0x8f930000  ! 3: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xa985e2f2  ! 4: WRASR_I	wr	%r23, 0x02f2, %set_softint
	.word 0xa7480000  ! 5: RDHPR_HPSTATE	rdhpr	%hpstate, %r19
	.word 0x919420b7  ! 6: WRPR_PIL_I	wrpr	%r16, 0x00b7, %pil
	.word 0xad500000  ! 7: RDPR_TPC	rdpr	%tpc, %r22
	.word 0x8d94f72b  ! 8: WRPR_PSTATE_I	wrpr	%r19, 0x172b, %pstate
	.word 0xaf504000  ! 9: RDPR_TNPC	rdpr	%tnpc, %r23
	.word 0xa9484000  ! 10: RDHPR_HTSTATE	rdhpr	%htstate, %r20
	.word 0x8194acd9  ! 11: WRPR_TPC_I	wrpr	%r18, 0x0cd9, %tpc
	.word 0x9194e506  ! 12: WRPR_PIL_I	wrpr	%r19, 0x0506, %pil
	.word 0xab484000  ! 13: RDHPR_HTSTATE	rdhpr	%htstate, %r21
	.word 0xa9494000  ! 14: RDHPR_HTBA	rdhpr	%htba, %r20
	.word 0xa1514000  ! 15: RDPR_TBA	<illegal instruction>
	.word 0x8984e506  ! 16: WRASR_I	wr	%r19, 0x0506, %tick
	.word 0xaf510000  ! 17: RDPR_TICK	rdpr	%tick, %r23
	.word 0xa9484000  ! 18: RDHPR_HTSTATE	rdhpr	%htstate, %r20
	.word 0xa1540000  ! 19: RDPR_GL	<illegal instruction>
	.word 0xa984e506  ! 20: WRASR_I	wr	%r19, 0x0506, %set_softint
	.word 0xa1440000  ! 21: RDASR	rd	%-, %r16
	.word 0xad520000  ! 22: RDPR_PIL	<illegal instruction>
	.word 0xab484000  ! 23: RDHPR_HTSTATE	rdhpr	%htstate, %r21
	.word 0x8194691a  ! 24: WRPR_TPC_I	wrpr	%r17, 0x091a, %tpc
	ta	T_CHANGE_HPRIV	! macro
	.word 0xa5484000  ! 26: RDHPR_HTSTATE	rdhpr	%htstate, %r18
	.word 0x859430a9  ! 27: WRPR_TSTATE_I	wrpr	%r16, 0x10a9, %tstate
	mov	1, %r12
	.word 0x8f930000  ! 28: WRPR_TL_R	wrpr	%r12, %r0, %tl
	setx	0x38e9212c00005ad0, %g1, %r10
	.word 0x839a8000  ! 29: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	setx	0x7bfb6c190000cf87, %g1, %r10
	.word 0x839a8000  ! 30: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x8794634c  ! 31: WRPR_TT_I	wrpr	%r17, 0x034c, %tt
	.word 0xa3500000  ! 32: RDPR_TPC	rdpr	%tpc, %r17
	.word 0xa1504000  ! 33: RDPR_TNPC	<illegal instruction>
	.word 0x83957e83  ! 34: WRPR_TNPC_I	wrpr	%r21, 0x1e83, %tnpc
	.word 0x879c28f0  ! 35: WRHPR_HINTP_I	wrhpr	%r16, 0x08f0, %hintp
	.word 0xab504000  ! 36: RDPR_TNPC	rdpr	%tnpc, %r21
	.word 0xad504000  ! 37: RDPR_TNPC	<illegal instruction>
	.word 0x83947d58  ! 38: WRPR_TNPC_I	wrpr	%r17, 0x1d58, %tnpc
	.word 0xad508000  ! 39: RDPR_TSTATE	rdpr	%tstate, %r22
	.word 0x83957c97  ! 40: WRPR_TNPC_I	wrpr	%r21, 0x1c97, %tnpc
	.word 0xab484000  ! 41: RDHPR_HTSTATE	rdhpr	%htstate, %r21
	setx	0xcacb3d2700003fd7, %g1, %r10
	.word 0x819a8000  ! 42: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	setx	0xb4d1682b0000dddc, %g1, %r10
	.word 0x819a8000  ! 43: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xa3857c97  ! 44: WRASR_I	wr	%r21, 0x1c97, %-
	.word 0xa3484000  ! 45: RDHPR_HTSTATE	rdhpr	%htstate, %r17
	.word 0xad480000  ! 46: RDHPR_HPSTATE	rdhpr	%hpstate, %r22
	.word 0xad51c000  ! 47: RDPR_TL	<illegal instruction>
	setx	0xdaf493660000a8cf, %g1, %r10
	.word 0x839a8000  ! 48: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	mov	2, %r12
	.word 0x8f930000  ! 49: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xad857c97  ! 50: WRASR_I	wr	%r21, 0x1c97, %softint
	.word 0xa3484000  ! 51: RDHPR_HTSTATE	rdhpr	%htstate, %r17
	setx	0xaef2511f00004a96, %g1, %r10
	.word 0x819a8000  ! 52: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x85953f06  ! 53: WRPR_TSTATE_I	wrpr	%r20, 0x1f06, %tstate
	.word 0xa9853f06  ! 54: WRASR_I	wr	%r20, 0x1f06, %set_softint
	.word 0xa5480000  ! 55: RDHPR_HPSTATE	rdhpr	%hpstate, %r18
	.word 0xaf494000  ! 56: RDHPR_HTBA	rdhpr	%htba, %r23
	.word 0x8d94e659  ! 57: WRPR_PSTATE_I	wrpr	%r19, 0x0659, %pstate
	.word 0xad484000  ! 58: RDHPR_HTSTATE	rdhpr	%htstate, %r22
	.word 0xad410000  ! 59: RDASR	rd	%tick, %r22
	.word 0x879d220f  ! 60: WRHPR_HINTP_I	wrhpr	%r20, 0x020f, %hintp
	.word 0xad410000  ! 61: RDASR	rd	%tick, %r22
	setx	0xea71776c00005999, %g1, %r10
	.word 0x819a8000  ! 62: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xb185220f  ! 63: WRASR_I	wr	%r20, 0x020f, %-
	.word 0xa1508000  ! 64: RDPR_TSTATE	<illegal instruction>
	.word 0xa9500000  ! 65: RDPR_TPC	<illegal instruction>
	.word 0x8795b2e2  ! 66: WRPR_TT_I	wrpr	%r22, 0x12e2, %tt
	.word 0xaf484000  ! 67: RDHPR_HTSTATE	rdhpr	%htstate, %r23
	.word 0xa548c000  ! 68: RDHPR_HINTP	rdhpr	%hintp, %r18
	.word 0xa5444000  ! 69: RDASR	rd	%-, %r18
	.word 0xad51c000  ! 70: RDPR_TL	<illegal instruction>
	.word 0xad540000  ! 71: RDPR_GL	<illegal instruction>
	.word 0x8995201d  ! 72: WRPR_TICK_I	wrpr	%r20, 0x001d, %tick
	.word 0xaf508000  ! 73: RDPR_TSTATE	rdpr	%tstate, %r23
	.word 0xa1500000  ! 74: RDPR_TPC	<illegal instruction>
	setx	0x3caa540c00008d88, %g1, %r10
	.word 0x819a8000  ! 75: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x83957239  ! 76: WRPR_TNPC_I	wrpr	%r21, 0x1239, %tnpc
	.word 0xad520000  ! 77: RDPR_PIL	rdpr	%pil, %r22
	.word 0x89857239  ! 78: WRASR_I	wr	%r21, 0x1239, %tick
	rd	%pcr, %g2
	wr	%g2, 0, %pcr
	.word 0xad480000  ! 80: RDHPR_HPSTATE	rdhpr	%hpstate, %r22
	.word 0xaf857239  ! 81: WRASR_I	wr	%r21, 0x1239, %-
	mov	2, %r12
	.word 0xa1930000  ! 82: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0x879d2fde  ! 83: WRHPR_HINTP_I	wrhpr	%r20, 0x0fde, %hintp
	.word 0xad464000  ! 84: RDASR	rd	%-, %r22
	.word 0xad500000  ! 85: RDPR_TPC	rdpr	%tpc, %r22
	.word 0x8595f0e0  ! 86: WRPR_TSTATE_I	wrpr	%r23, 0x10e0, %tstate
	.word 0xa550c000  ! 87: RDPR_TT	rdpr	%tt, %r18
	.word 0xa1484000  ! 88: RDHPR_HTSTATE	rdhpr	%htstate, %r16
	.word 0xa950c000  ! 89: RDPR_TT	rdpr	%tt, %r20
	.word 0xa7500000  ! 90: RDPR_TPC	<illegal instruction>
	setx	0x48510b0300001f15, %g1, %r10
	.word 0x839a8000  ! 91: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	mov	1, %r12
	.word 0x8f930000  ! 92: WRPR_TL_R	wrpr	%r12, %r0, %tl
	setx	0x3b1266800005dc2, %g1, %r10
	.word 0x819a8000  ! 93: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xa7504000  ! 94: RDPR_TNPC	rdpr	%tnpc, %r19
	.word 0x8794bdf7  ! 95: WRPR_TT_I	wrpr	%r18, 0x1df7, %tt
	.word 0xaf48c000  ! 96: RDHPR_HINTP	rdhpr	%hintp, %r23
	.word 0xaf464000  ! 97: RDASR	rd	%-, %r23
	.word 0xa348c000  ! 98: RDHPR_HINTP	rdhpr	%hintp, %r17
	.word 0x879d354e  ! 99: WRHPR_HINTP_I	wrhpr	%r20, 0x154e, %hintp
	.word 0xab484000  ! 100: RDHPR_HTSTATE	rdhpr	%htstate, %r21
	rd	%pcr, %g2
	wr	%g2, 0, %pcr
	.word 0x87956e62  ! 102: WRPR_TT_I	wrpr	%r21, 0x0e62, %tt
	.word 0xa7504000  ! 103: RDPR_TNPC	rdpr	%tnpc, %r19
	setx	0xcc0fa3ca0000bc0b, %g1, %r10
	.word 0x839a8000  ! 104: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xa9520000  ! 105: RDPR_PIL	rdpr	%pil, %r20
	.word 0xab50c000  ! 106: RDPR_TT	<illegal instruction>
	ta	T_CHANGE_HPRIV
	WRPR	%g0, 0, %tick
	.word 0xb3856e62  ! 107: WRASR_I	wr	%r21, 0x0e62, %-
	.word 0x8795f1f4  ! 108: WRPR_TT_I	wrpr	%r23, 0x11f4, %tt
	.word 0x8d947063  ! 109: WRPR_PSTATE_I	wrpr	%r17, 0x1063, %pstate
	.word 0xad504000  ! 110: RDPR_TNPC	rdpr	%tnpc, %r22
	.word 0x8195b79b  ! 111: WRPR_TPC_I	wrpr	%r22, 0x179b, %tpc
	.word 0x83947a66  ! 112: WRPR_TNPC_I	wrpr	%r17, 0x1a66, %tnpc
	.word 0xa551c000  ! 113: RDPR_TL	rdpr	%tl, %r18
	ta	T_CHANGE_HPRIV
	WRPR	%g0, 0, %tick
	.word 0xb1847a66  ! 114: WRASR_I	wr	%r17, 0x1a66, %-
	.word 0xa5444000  ! 115: RDASR	rd	%-, %r18
	.word 0xa5460000  ! 116: RDASR	rd	%-, %r18
	.word 0xa3508000  ! 117: RDPR_TSTATE	<illegal instruction>
	.word 0x879c3052  ! 118: WRHPR_HINTP_I	wrhpr	%r16, 0x1052, %hintp
	.word 0xa3504000  ! 119: RDPR_TNPC	rdpr	%tnpc, %r17
	.word 0x8994e6bc  ! 120: WRPR_TICK_I	wrpr	%r19, 0x06bc, %tick
	.word 0xa551c000  ! 121: RDPR_TL	rdpr	%tl, %r18
	.word 0xa5464000  ! 122: RDASR	rd	%-, %r18
	.word 0x8d95f0e5  ! 123: WRPR_PSTATE_I	wrpr	%r23, 0x10e5, %pstate
	.word 0xa5454000  ! 124: RDASR	rd	%clear_softint, %r18
	.word 0xa3484000  ! 125: RDHPR_HTSTATE	rdhpr	%htstate, %r17
	.word 0xad85f0e5  ! 126: WRASR_I	wr	%r23, 0x10e5, %softint
	.word 0xa348c000  ! 127: RDHPR_HINTP	rdhpr	%hintp, %r17
	.word 0x879d76d2  ! 128: WRHPR_HINTP_I	wrhpr	%r21, 0x16d2, %hintp
	.word 0xa7520000  ! 129: RDPR_PIL	rdpr	%pil, %r19
	.word 0xa9480000  ! 130: RDHPR_HPSTATE	rdhpr	%hpstate, %r20
	.word 0x81952d83  ! 131: WRPR_TPC_I	wrpr	%r20, 0x0d83, %tpc
	.word 0xa150c000  ! 132: RDPR_TT	rdpr	%tt, %r16
	setx	0x2945153f00006c95, %g1, %r10
	.word 0x819a8000  ! 133: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xa148c000  ! 134: RDHPR_HINTP	rdhpr	%hintp, %r16
	.word 0x87947438  ! 135: WRPR_TT_I	wrpr	%r17, 0x1438, %tt
	.word 0x8394aade  ! 136: WRPR_TNPC_I	wrpr	%r18, 0x0ade, %tnpc
	setx	0x73a7b7b000001f5e, %g1, %r10
	.word 0x839a8000  ! 137: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xa1458000  ! 138: RDASR	rd	%softint, %r16
	.word 0x8195bd15  ! 139: WRPR_TPC_I	wrpr	%r22, 0x1d15, %tpc
	.word 0x879d3127  ! 140: WRHPR_HINTP_I	wrhpr	%r20, 0x1127, %hintp
	.word 0xaf484000  ! 141: RDHPR_HTSTATE	rdhpr	%htstate, %r23
	.word 0x8195aa9f  ! 142: WRPR_TPC_I	wrpr	%r22, 0x0a9f, %tpc
	.word 0x8595766b  ! 143: WRPR_TSTATE_I	wrpr	%r21, 0x166b, %tstate
	.word 0x85952f8b  ! 144: WRPR_TSTATE_I	wrpr	%r20, 0x0f8b, %tstate
	.word 0xaf504000  ! 145: RDPR_TNPC	rdpr	%tnpc, %r23
	.word 0x8595a5ff  ! 146: WRPR_TSTATE_I	wrpr	%r22, 0x05ff, %tstate
	.word 0xa750c000  ! 147: RDPR_TT	rdpr	%tt, %r19
	.word 0xaf85a5ff  ! 148: WRASR_I	wr	%r22, 0x05ff, %-
	.word 0x879c61ec  ! 149: WRHPR_HINTP_I	wrhpr	%r17, 0x01ec, %hintp
	setx	0x41b1f6ec0000eec0, %g1, %r10
	.word 0x839a8000  ! 150: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xa7450000  ! 151: RDASR	rd	%set_softint, %r19
	.word 0x8795b0c8  ! 152: WRPR_TT_I	wrpr	%r22, 0x10c8, %tt
	.word 0x879d322e  ! 153: WRHPR_HINTP_I	wrhpr	%r20, 0x122e, %hintp
	ta	T_CHANGE_HPRIV
	WRPR	%g0, 0, %tick
	.word 0x8985322e  ! 154: WRASR_I	wr	%r20, 0x122e, %tick
	setx	0xbea3af0e000088cc, %g1, %r10
	.word 0x819a8000  ! 155: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x8d94352c  ! 156: WRPR_PSTATE_I	wrpr	%r16, 0x152c, %pstate
	.word 0xa1500000  ! 157: RDPR_TPC	rdpr	%tpc, %r16
	.word 0xaf84352c  ! 158: WRASR_I	wr	%r16, 0x152c, %-
	.word 0x859532d2  ! 159: WRPR_TSTATE_I	wrpr	%r20, 0x12d2, %tstate
	.word 0xa9504000  ! 160: RDPR_TNPC	rdpr	%tnpc, %r20
	.word 0xad514000  ! 161: RDPR_TBA	<illegal instruction>
	.word 0xa7500000  ! 162: RDPR_TPC	<illegal instruction>
	ta	T_CHANGE_HPRIV
	WRPR	%g0, 0, %tick
	.word 0x898532d2  ! 163: WRASR_I	wr	%r20, 0x12d2, %tick
	mov	0, %r12
	.word 0x8f930000  ! 164: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xa7464000  ! 165: RDASR	rd	%-, %r19
	.word 0xaf50c000  ! 166: RDPR_TT	rdpr	%tt, %r23
	.word 0xaf520000  ! 167: RDPR_PIL	rdpr	%pil, %r23
	.word 0x879439b2  ! 168: WRPR_TT_I	wrpr	%r16, 0x19b2, %tt
	.word 0xa9508000  ! 169: RDPR_TSTATE	rdpr	%tstate, %r20
	.word 0x8394bf33  ! 170: WRPR_TNPC_I	wrpr	%r18, 0x1f33, %tnpc
	.word 0x8195e9fd  ! 171: WRPR_TPC_I	wrpr	%r23, 0x09fd, %tpc
	.word 0x8d953e50  ! 172: WRPR_PSTATE_I	wrpr	%r20, 0x1e50, %pstate
	.word 0xa948c000  ! 173: RDHPR_HINTP	rdhpr	%hintp, %r20
	.word 0xa7504000  ! 174: RDPR_TNPC	<illegal instruction>
	.word 0xa7410000  ! 175: RDASR	rd	%tick, %r19
	.word 0xa9480000  ! 176: RDHPR_HPSTATE	rdhpr	%hpstate, %r20
	.word 0xa5484000  ! 177: RDHPR_HTSTATE	rdhpr	%htstate, %r18
	.word 0xa545c000  ! 178: RDASR	rd	%-, %r18
	.word 0xa5458000  ! 179: RDASR	rd	%softint, %r18
	.word 0xb1853e50  ! 180: WRASR_I	wr	%r20, 0x1e50, %-
	.word 0xa951c000  ! 181: RDPR_TL	<illegal instruction>
	.word 0xa9460000  ! 182: RDASR	rd	%-, %r20
	.word 0xa5500000  ! 183: RDPR_TPC	<illegal instruction>
	setx	0x4b38e5250000dbdf, %g1, %r10
	.word 0x819a8000  ! 184: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x8195a2d8  ! 185: WRPR_TPC_I	wrpr	%r22, 0x02d8, %tpc
	.word 0x81943af2  ! 186: WRPR_TPC_I	wrpr	%r16, 0x1af2, %tpc
	.word 0x8994f464  ! 187: WRPR_TICK_I	wrpr	%r19, 0x1464, %tick
	.word 0xb384f464  ! 188: WRASR_I	wr	%r19, 0x1464, %-
	.word 0xa3500000  ! 189: RDPR_TPC	<illegal instruction>
	.word 0xaf50c000  ! 190: RDPR_TT	<illegal instruction>
	.word 0x8d95ef1d  ! 191: WRPR_PSTATE_I	wrpr	%r23, 0x0f1d, %pstate
	ta	T_CHANGE_HPRIV
	WRPR	%g0, 0, %tick
	.word 0xb185ef1d  ! 192: WRASR_I	wr	%r23, 0x0f1d, %-
	.word 0xad48c000  ! 193: RDHPR_HINTP	rdhpr	%hintp, %r22
	setx	0x4fc95d890000cecf, %g1, %r10
	.word 0x819a8000  ! 194: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xaf85ef1d  ! 195: WRASR_I	wr	%r23, 0x0f1d, %-
	.word 0x819535df  ! 196: WRPR_TPC_I	wrpr	%r20, 0x15df, %tpc
	.word 0xa9504000  ! 197: RDPR_TNPC	rdpr	%tnpc, %r20
	.word 0x89943538  ! 198: WRPR_TICK_I	wrpr	%r16, 0x1538, %tick
	.word 0xaf494000  ! 199: RDHPR_HTBA	rdhpr	%htba, %r23
	.word 0xa950c000  ! 200: RDPR_TT	<illegal instruction>
	.word 0xa9504000  ! 201: RDPR_TNPC	<illegal instruction>
	ta	T_CHANGE_HPRIV
	WRPR	%g0, 0, %tick
	.word 0x89843538  ! 202: WRASR_I	wr	%r16, 0x1538, %tick
	setx	0xd5053c4900006c55, %g1, %r10
	.word 0x819a8000  ! 203: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	mov	1, %r12
	.word 0xa1930000  ! 204: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xa9480000  ! 205: RDHPR_HPSTATE	rdhpr	%hpstate, %r20
	.word 0xa1480000  ! 206: RDHPR_HPSTATE	rdhpr	%hpstate, %r16
	.word 0x8394f657  ! 207: WRPR_TNPC_I	wrpr	%r19, 0x1657, %tnpc
	.word 0x8194bab1  ! 208: WRPR_TPC_I	wrpr	%r18, 0x1ab1, %tpc
	.word 0x8d957573  ! 209: WRPR_PSTATE_I	wrpr	%r21, 0x1573, %pstate
	.word 0xa148c000  ! 210: RDHPR_HINTP	rdhpr	%hintp, %r16
	.word 0xa1504000  ! 211: RDPR_TNPC	rdpr	%tnpc, %r16
	.word 0x89947d38  ! 212: WRPR_TICK_I	wrpr	%r17, 0x1d38, %tick
	.word 0x8395fa8b  ! 213: WRPR_TNPC_I	wrpr	%r23, 0x1a8b, %tnpc
	.word 0x8595a989  ! 214: WRPR_TSTATE_I	wrpr	%r22, 0x0989, %tstate
	.word 0x879c77d9  ! 215: WRHPR_HINTP_I	wrhpr	%r17, 0x17d9, %hintp
	.word 0xad508000  ! 216: RDPR_TSTATE	rdpr	%tstate, %r22
	.word 0xa38477d9  ! 217: WRASR_I	wr	%r17, 0x17d9, %-
	.word 0xa9494000  ! 218: RDHPR_HTBA	rdhpr	%htba, %r20
	setx	0x269993e700006f58, %g1, %r10
	.word 0x839a8000  ! 219: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x83956f12  ! 220: WRPR_TNPC_I	wrpr	%r21, 0x0f12, %tnpc
	.word 0x8594b7b1  ! 221: WRPR_TSTATE_I	wrpr	%r18, 0x17b1, %tstate
	.word 0xab48c000  ! 222: RDHPR_HINTP	rdhpr	%hintp, %r21
	.word 0xa5484000  ! 223: RDHPR_HTSTATE	rdhpr	%htstate, %r18
	.word 0xab520000  ! 224: RDPR_PIL	<illegal instruction>
	.word 0x8195ac8f  ! 225: WRPR_TPC_I	wrpr	%r22, 0x0c8f, %tpc
	.word 0xab460000  ! 226: RDASR	rd	%-, %r21
	.word 0x8994e59e  ! 227: WRPR_TICK_I	wrpr	%r19, 0x059e, %tick
	.word 0x8995398c  ! 228: WRPR_TICK_I	wrpr	%r20, 0x198c, %tick
	.word 0xab48c000  ! 229: RDHPR_HINTP	rdhpr	%hintp, %r21
	.word 0xa5484000  ! 230: RDHPR_HTSTATE	rdhpr	%htstate, %r18
	.word 0xad85398c  ! 231: WRASR_I	wr	%r20, 0x198c, %softint
	setx	0xa8b6b2090000b959, %g1, %r10
	.word 0x819a8000  ! 232: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x839526af  ! 233: WRPR_TNPC_I	wrpr	%r20, 0x06af, %tnpc
	.word 0xaf500000  ! 234: RDPR_TPC	rdpr	%tpc, %r23
	.word 0xad514000  ! 235: RDPR_TBA	<illegal instruction>
	.word 0x85946a42  ! 236: WRPR_TSTATE_I	wrpr	%r17, 0x0a42, %tstate
	.word 0xa9494000  ! 237: RDHPR_HTBA	rdhpr	%htba, %r20
	.word 0xa1508000  ! 238: RDPR_TSTATE	<illegal instruction>
	.word 0x8195f991  ! 239: WRPR_TPC_I	wrpr	%r23, 0x1991, %tpc
	.word 0xa5504000  ! 240: RDPR_TNPC	rdpr	%tnpc, %r18
	.word 0xaf504000  ! 241: RDPR_TNPC	<illegal instruction>
	.word 0xa3480000  ! 242: RDHPR_HPSTATE	rdhpr	%hpstate, %r17
	.word 0x8195ff45  ! 243: WRPR_TPC_I	wrpr	%r23, 0x1f45, %tpc
	setx	0x1a6330da0000bdc5, %g1, %r10
	.word 0x819a8000  ! 244: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xa3484000  ! 245: RDHPR_HTSTATE	rdhpr	%htstate, %r17
	.word 0xad85ff45  ! 246: WRASR_I	wr	%r23, 0x1f45, %softint
	.word 0xa3458000  ! 247: RDASR	rd	%softint, %r17
	.word 0x9194bf57  ! 248: WRPR_PIL_I	wrpr	%r18, 0x1f57, %pil
	.word 0xad510000  ! 249: RDPR_TICK	rdpr	%tick, %r22
	.word 0xad508000  ! 250: RDPR_TSTATE	<illegal instruction>
	.word 0x8794ed17  ! 251: WRPR_TT_I	wrpr	%r19, 0x0d17, %tt
	.word 0xaf500000  ! 252: RDPR_TPC	rdpr	%tpc, %r23
	.word 0xad514000  ! 253: RDPR_TBA	<illegal instruction>
	.word 0x879cf6d3  ! 254: WRHPR_HINTP_I	wrhpr	%r19, 0x16d3, %hintp
	.word 0xab508000  ! 255: RDPR_TSTATE	rdpr	%tstate, %r21
	.word 0xa384f6d3  ! 256: WRASR_I	wr	%r19, 0x16d3, %-
	setx	0xca3f78100000be5f, %g1, %r10
	.word 0x839a8000  ! 257: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xa7540000  ! 258: RDPR_GL	rdpr	%-, %r19
	.word 0xa1494000  ! 259: RDHPR_HTBA	rdhpr	%htba, %r16
	.word 0x8195e4b2  ! 260: WRPR_TPC_I	wrpr	%r23, 0x04b2, %tpc
	.word 0xab504000  ! 261: RDPR_TNPC	rdpr	%tnpc, %r21
	.word 0xa7480000  ! 262: RDHPR_HPSTATE	rdhpr	%hpstate, %r19
	.word 0x8995f0e3  ! 263: WRPR_TICK_I	wrpr	%r23, 0x10e3, %tick
	.word 0xa7494000  ! 264: RDHPR_HTBA	rdhpr	%htba, %r19
	.word 0xad500000  ! 265: RDPR_TPC	<illegal instruction>
	ta	T_CHANGE_NONPRIV	! macro
	ta	T_CHANGE_HPRIV	! macro
	rd	%pcr, %g2
	wr	%g2, 0, %pcr
	.word 0xaf518000  ! 269: RDPR_PSTATE	<illegal instruction>
	.word 0xaf410000  ! 270: RDASR	rd	%tick, %r23
	.word 0xaf454000  ! 271: RDASR	rd	%clear_softint, %r23
	.word 0xad50c000  ! 272: RDPR_TT	<illegal instruction>
	.word 0xa5500000  ! 273: RDPR_TPC	<illegal instruction>
	.word 0xa950c000  ! 274: RDPR_TT	<illegal instruction>
	.word 0x8394f927  ! 275: WRPR_TNPC_I	wrpr	%r19, 0x1927, %tnpc
	.word 0xb184f927  ! 276: WRASR_I	wr	%r19, 0x1927, %-
	.word 0xa9450000  ! 277: RDASR	rd	%set_softint, %r20
	.word 0xa9410000  ! 278: RDASR	rd	%tick, %r20
	.word 0xab84f927  ! 279: WRASR_I	wr	%r19, 0x1927, %clear_softint
	.word 0x89942eb2  ! 280: WRPR_TICK_I	wrpr	%r16, 0x0eb2, %tick
	.word 0xad50c000  ! 281: RDPR_TT	rdpr	%tt, %r22
	setx	0x8468b5c40000be86, %g1, %r10
	.word 0x839a8000  ! 282: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x8795eedb  ! 283: WRPR_TT_I	wrpr	%r23, 0x0edb, %tt
	setx	0x2c9f59500004c0b, %g1, %r10
	.word 0x839a8000  ! 284: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xa5508000  ! 285: RDPR_TSTATE	rdpr	%tstate, %r18
	.word 0x8d9573b3  ! 286: WRPR_PSTATE_I	wrpr	%r21, 0x13b3, %pstate
	.word 0x8795e54f  ! 287: WRPR_TT_I	wrpr	%r23, 0x054f, %tt
	.word 0xa3494000  ! 288: RDHPR_HTBA	rdhpr	%htba, %r17
	.word 0xad504000  ! 289: RDPR_TNPC	<illegal instruction>
	.word 0x8194e84d  ! 290: WRPR_TPC_I	wrpr	%r19, 0x084d, %tpc
	.word 0xab494000  ! 291: RDHPR_HTBA	rdhpr	%htba, %r21
	.word 0xa7494000  ! 292: RDHPR_HTBA	rdhpr	%htba, %r19
	.word 0xaf480000  ! 293: RDHPR_HPSTATE	rdhpr	%hpstate, %r23
	.word 0xb384e84d  ! 294: WRASR_I	wr	%r19, 0x084d, %-
	.word 0x8395f95a  ! 295: WRPR_TNPC_I	wrpr	%r23, 0x195a, %tnpc
	.word 0xa7484000  ! 296: RDHPR_HTSTATE	rdhpr	%htstate, %r19
	.word 0x83957d59  ! 297: WRPR_TNPC_I	wrpr	%r21, 0x1d59, %tnpc
	.word 0xaf504000  ! 298: RDPR_TNPC	rdpr	%tnpc, %r23
	.word 0x89947546  ! 299: WRPR_TICK_I	wrpr	%r17, 0x1546, %tick
	.word 0xa350c000  ! 300: RDPR_TT	rdpr	%tt, %r17
	.word 0x8394a96b  ! 301: WRPR_TNPC_I	wrpr	%r18, 0x096b, %tnpc
	.word 0xa5484000  ! 302: RDHPR_HTSTATE	rdhpr	%htstate, %r18
	.word 0xa3504000  ! 303: RDPR_TNPC	<illegal instruction>
	.word 0xaf508000  ! 304: RDPR_TSTATE	<illegal instruction>
	.word 0xaf410000  ! 305: RDASR	rd	%tick, %r23
	.word 0x9194af8c  ! 306: WRPR_PIL_I	wrpr	%r18, 0x0f8c, %pil
	ta	T_CHANGE_HPRIV
	WRPR	%g0, 0, %tick
	.word 0x8984af8c  ! 307: WRASR_I	wr	%r18, 0x0f8c, %tick
	rd	%pcr, %g2
	wr	%g2, 0, %pcr
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8984af8c  ! 310: WRASR_I	wr	%r18, 0x0f8c, %tick
	.word 0x8195b69d  ! 311: WRPR_TPC_I	wrpr	%r22, 0x169d, %tpc
	.word 0xaf410000  ! 312: RDASR	rd	%tick, %r23
	.word 0xa9480000  ! 313: RDHPR_HPSTATE	rdhpr	%hpstate, %r20
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa5500000  ! 315: RDPR_TPC	<illegal instruction>
	.word 0xa7484000  ! 316: RDHPR_HTSTATE	rdhpr	%htstate, %r19
	.word 0x81952b7e  ! 317: WRPR_TPC_I	wrpr	%r20, 0x0b7e, %tpc
	ta	T_CHANGE_PRIV	! macro
	.word 0xab514000  ! 319: RDPR_TBA	rdpr	%tba, %r21
	.word 0xaf508000  ! 320: RDPR_TSTATE	<illegal instruction>
	.word 0xad520000  ! 321: RDPR_PIL	<illegal instruction>
	.word 0xa9480000  ! 322: RDHPR_HPSTATE	rdhpr	%hpstate, %r20
	.word 0x8595e1d9  ! 323: WRPR_TSTATE_I	wrpr	%r23, 0x01d9, %tstate
	setx	0xbf06217d0000581e, %g1, %r10
	.word 0x819a8000  ! 324: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xab85e1d9  ! 325: WRASR_I	wr	%r23, 0x01d9, %clear_softint
	setx	0x27e658b90000add6, %g1, %r10
	.word 0x839a8000  ! 326: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	setx	0x555f9cda0000b81d, %g1, %r10
	.word 0x839a8000  ! 327: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xa7540000  ! 328: RDPR_GL	rdpr	%-, %r19
	.word 0xaf510000  ! 329: RDPR_TICK	<illegal instruction>
	.word 0x8394b000  ! 330: WRPR_TNPC_I	wrpr	%r18, 0x1000, %tnpc
	.word 0x8795b391  ! 331: WRPR_TT_I	wrpr	%r22, 0x1391, %tt
	.word 0xa7504000  ! 332: RDPR_TNPC	rdpr	%tnpc, %r19
	.word 0x879c7430  ! 333: WRHPR_HINTP_I	wrhpr	%r17, 0x1430, %hintp
	setx	0xc743958100006c4d, %g1, %r10
	.word 0x839a8000  ! 334: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x879dbd7c  ! 335: WRHPR_HINTP_I	wrhpr	%r22, 0x1d7c, %hintp
	mov	2, %r12
	.word 0x8f930000  ! 336: WRPR_TL_R	wrpr	%r12, %r0, %tl
	setx	0x5b245d8400002b55, %g1, %r10
	.word 0x839a8000  ! 337: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x8394779b  ! 338: WRPR_TNPC_I	wrpr	%r17, 0x179b, %tnpc
	.word 0x81942d24  ! 339: WRPR_TPC_I	wrpr	%r16, 0x0d24, %tpc
	.word 0x8594e23e  ! 340: WRPR_TSTATE_I	wrpr	%r19, 0x023e, %tstate
	.word 0xa7410000  ! 341: RDASR	rd	%tick, %r19
	.word 0xa7460000  ! 342: RDASR	rd	%-, %r19
	.word 0xa1500000  ! 343: RDPR_TPC	rdpr	%tpc, %r16
	.word 0xa984e23e  ! 344: WRASR_I	wr	%r19, 0x023e, %set_softint
	.word 0x81957c56  ! 345: WRPR_TPC_I	wrpr	%r21, 0x1c56, %tpc
	.word 0x9194b25b  ! 346: WRPR_PIL_I	wrpr	%r18, 0x125b, %pil
	.word 0xa3504000  ! 347: RDPR_TNPC	rdpr	%tnpc, %r17
	.word 0xa3454000  ! 348: RDASR	rd	%clear_softint, %r17
	.word 0x8795b729  ! 349: WRPR_TT_I	wrpr	%r22, 0x1729, %tt
	.word 0xa948c000  ! 350: RDHPR_HINTP	rdhpr	%hintp, %r20
	.word 0xad484000  ! 351: RDHPR_HTSTATE	rdhpr	%htstate, %r22
	.word 0xa148c000  ! 352: RDHPR_HINTP	rdhpr	%hintp, %r16
	.word 0xa3504000  ! 353: RDPR_TNPC	rdpr	%tnpc, %r17
	setx	0x9633d7c800001b8e, %g1, %r10
	.word 0x819a8000  ! 354: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xad494000  ! 355: RDHPR_HTBA	rdhpr	%htba, %r22
	.word 0xa1484000  ! 356: RDHPR_HTSTATE	rdhpr	%htstate, %r16
	mov	0, %r12
	.word 0x8f930000  ! 357: WRPR_TL_R	wrpr	%r12, %r0, %tl
	setx	0xafe166d600006e09, %g1, %r10
	.word 0x839a8000  ! 358: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xa1410000  ! 359: RDASR	rd	%tick, %r16
	rd	%pcr, %g2
	wr	%g2, 0, %pcr
	.word 0xab50c000  ! 361: RDPR_TT	rdpr	%tt, %r21
	.word 0xa3480000  ! 362: RDHPR_HPSTATE	rdhpr	%hpstate, %r17
	rd	%pcr, %g2
	wr	%g2, 0, %pcr
	.word 0xab480000  ! 364: RDHPR_HPSTATE	rdhpr	%hpstate, %r21
	.word 0xa3480000  ! 365: RDHPR_HPSTATE	rdhpr	%hpstate, %r17
	.word 0xa3500000  ! 366: RDPR_TPC	<illegal instruction>
	.word 0xa1494000  ! 367: RDHPR_HTBA	rdhpr	%htba, %r16
	.word 0xaf48c000  ! 368: RDHPR_HINTP	rdhpr	%hintp, %r23
	.word 0xab500000  ! 369: RDPR_TPC	<illegal instruction>
	.word 0x87957535  ! 370: WRPR_TT_I	wrpr	%r21, 0x1535, %tt
	.word 0xa7508000  ! 371: RDPR_TSTATE	rdpr	%tstate, %r19
	.word 0x8394b164  ! 372: WRPR_TNPC_I	wrpr	%r18, 0x1164, %tnpc
	.word 0xaf508000  ! 373: RDPR_TSTATE	rdpr	%tstate, %r23
	setx	0x3134f300007e0f, %g1, %r10
	.word 0x839a8000  ! 374: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xab51c000  ! 375: RDPR_TL	rdpr	%tl, %r21
	setx	0x2bb1d59900007b42, %g1, %r10
	.word 0x839a8000  ! 376: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xa750c000  ! 377: RDPR_TT	rdpr	%tt, %r19
	.word 0x879c24e7  ! 378: WRHPR_HINTP_I	wrhpr	%r16, 0x04e7, %hintp
	.word 0x879df5be  ! 379: WRHPR_HINTP_I	wrhpr	%r23, 0x15be, %hintp
	.word 0xa7410000  ! 380: RDASR	rd	%tick, %r19
	.word 0xa9500000  ! 381: RDPR_TPC	rdpr	%tpc, %r20
	.word 0x8194eb17  ! 382: WRPR_TPC_I	wrpr	%r19, 0x0b17, %tpc
	.word 0xaf84eb17  ! 383: WRASR_I	wr	%r19, 0x0b17, %-
	.word 0x87942fac  ! 384: WRPR_TT_I	wrpr	%r16, 0x0fac, %tt
	rd	%pcr, %g2
	wr	%g2, 0, %pcr
	.word 0xad484000  ! 386: RDHPR_HTSTATE	rdhpr	%htstate, %r22
	.word 0xad504000  ! 387: RDPR_TNPC	<illegal instruction>
	.word 0xad458000  ! 388: RDASR	rd	%softint, %r22
	.word 0xad508000  ! 389: RDPR_TSTATE	<illegal instruction>
	.word 0x91942699  ! 390: WRPR_PIL_I	wrpr	%r16, 0x0699, %pil
	.word 0x81957e02  ! 391: WRPR_TPC_I	wrpr	%r21, 0x1e02, %tpc
	.word 0xad45c000  ! 392: RDASR	rd	%-, %r22
	.word 0xad508000  ! 393: RDPR_TSTATE	rdpr	%tstate, %r22
	ta	T_CHANGE_HPRIV
	WRPR	%g0, 0, %tick
	.word 0xb3857e02  ! 394: WRASR_I	wr	%r21, 0x1e02, %-
	.word 0xab484000  ! 395: RDHPR_HTSTATE	rdhpr	%htstate, %r21
	setx	0x8e921a1100008f4d, %g1, %r10
	.word 0x819a8000  ! 396: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xa3504000  ! 397: RDPR_TNPC	rdpr	%tnpc, %r17
	ta	T_CHANGE_HPRIV
	WRPR	%g0, 0, %tick
	.word 0x89857e02  ! 398: WRASR_I	wr	%r21, 0x1e02, %tick
	.word 0xa348c000  ! 399: RDHPR_HINTP	rdhpr	%hintp, %r17
	.word 0x8795a095  ! 400: WRPR_TT_I	wrpr	%r22, 0x0095, %tt
	.word 0x8395e149  ! 401: WRPR_TNPC_I	wrpr	%r23, 0x0149, %tnpc
	.word 0xaf85e149  ! 402: WRASR_I	wr	%r23, 0x0149, %-
	ta	T_CHANGE_PRIV	! macro
	mov	0, %r12
	.word 0x8f930000  ! 404: WRPR_TL_R	wrpr	%r12, %r0, %tl
	ta	T_CHANGE_HPRIV
	WRPR	%g0, 0, %tick
	.word 0xa385e149  ! 405: WRASR_I	wr	%r23, 0x0149, %-
	.word 0x91953cee  ! 406: WRPR_PIL_I	wrpr	%r20, 0x1cee, %pil
	.word 0xa9484000  ! 407: RDHPR_HTSTATE	rdhpr	%htstate, %r20
	.word 0xa750c000  ! 408: RDPR_TT	<illegal instruction>
	.word 0xaf540000  ! 409: RDPR_GL	<illegal instruction>
	.word 0x879de29e  ! 410: WRHPR_HINTP_I	wrhpr	%r23, 0x029e, %hintp
	.word 0xad508000  ! 411: RDPR_TSTATE	rdpr	%tstate, %r22
	.word 0xad520000  ! 412: RDPR_PIL	<illegal instruction>
	.word 0xa1504000  ! 413: RDPR_TNPC	<illegal instruction>
	.word 0xa7494000  ! 414: RDHPR_HTBA	rdhpr	%htba, %r19
	.word 0xb385e29e  ! 415: WRASR_I	wr	%r23, 0x029e, %-
	.word 0x83947902  ! 416: WRPR_TNPC_I	wrpr	%r17, 0x1902, %tnpc
	ta	T_CHANGE_HPRIV
	WRPR	%g0, 0, %tick
	.word 0x89847902  ! 417: WRASR_I	wr	%r17, 0x1902, %tick
	setx	0x3ad44c8a0000acdf, %g1, %r10
	.word 0x839a8000  ! 418: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xad480000  ! 419: RDHPR_HPSTATE	rdhpr	%hpstate, %r22
	.word 0x879df792  ! 420: WRHPR_HINTP_I	wrhpr	%r23, 0x1792, %hintp
	.word 0x879dfe31  ! 421: WRHPR_HINTP_I	wrhpr	%r23, 0x1e31, %hintp
	.word 0xa1514000  ! 422: RDPR_TBA	rdpr	%tba, %r16
	.word 0xaf85fe31  ! 423: WRASR_I	wr	%r23, 0x1e31, %-
	.word 0x8195b564  ! 424: WRPR_TPC_I	wrpr	%r22, 0x1564, %tpc
	.word 0x85946bda  ! 425: WRPR_TSTATE_I	wrpr	%r17, 0x0bda, %tstate
	.word 0xad48c000  ! 426: RDHPR_HINTP	rdhpr	%hintp, %r22
	.word 0x9194e8c4  ! 427: WRPR_PIL_I	wrpr	%r19, 0x08c4, %pil
	mov	2, %r12
	.word 0xa1930000  ! 428: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xa5540000  ! 429: RDPR_GL	rdpr	%-, %r18
	.word 0x8595e978  ! 430: WRPR_TSTATE_I	wrpr	%r23, 0x0978, %tstate
	setx	0xef7e67a500005c99, %g1, %r10
	.word 0x839a8000  ! 431: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x81943879  ! 432: WRPR_TPC_I	wrpr	%r16, 0x1879, %tpc
	.word 0x8995b680  ! 433: WRPR_TICK_I	wrpr	%r22, 0x1680, %tick
	.word 0xa5464000  ! 434: RDASR	rd	%-, %r18
	.word 0xad484000  ! 435: RDHPR_HTSTATE	rdhpr	%htstate, %r22
	.word 0xad410000  ! 436: RDASR	rd	%tick, %r22
	.word 0xab508000  ! 437: RDPR_TSTATE	<illegal instruction>
	.word 0xad484000  ! 438: RDHPR_HTSTATE	rdhpr	%htstate, %r22
	.word 0xa3484000  ! 439: RDHPR_HTSTATE	rdhpr	%htstate, %r17
	.word 0x8594a301  ! 440: WRPR_TSTATE_I	wrpr	%r18, 0x0301, %tstate
	.word 0xa9540000  ! 441: RDPR_GL	rdpr	%-, %r20
	.word 0xaf50c000  ! 442: RDPR_TT	<illegal instruction>
	.word 0xad514000  ! 443: RDPR_TBA	<illegal instruction>
	.word 0xab50c000  ! 444: RDPR_TT	<illegal instruction>
	.word 0xa9510000  ! 445: RDPR_TICK	<illegal instruction>
	.word 0xa9410000  ! 446: RDASR	rd	%tick, %r20
	.word 0xad50c000  ! 447: RDPR_TT	<illegal instruction>
	.word 0x879c2bc8  ! 448: WRHPR_HINTP_I	wrhpr	%r16, 0x0bc8, %hintp
	.word 0xa1500000  ! 449: RDPR_TPC	rdpr	%tpc, %r16
	.word 0x8395f263  ! 450: WRPR_TNPC_I	wrpr	%r23, 0x1263, %tnpc
	.word 0xa1504000  ! 451: RDPR_TNPC	rdpr	%tnpc, %r16
	.word 0xa1500000  ! 452: RDPR_TPC	rdpr	%tpc, %r16
	.word 0x879dba54  ! 453: WRHPR_HINTP_I	wrhpr	%r22, 0x1a54, %hintp
	setx	0xfbbd944f00003cd7, %g1, %r10
	.word 0x819a8000  ! 454: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x91943c7c  ! 455: WRPR_PIL_I	wrpr	%r16, 0x1c7c, %pil
	.word 0x8394bbe9  ! 456: WRPR_TNPC_I	wrpr	%r18, 0x1be9, %tnpc
	setx	0xf428378200001c18, %g1, %r10
	.word 0x819a8000  ! 457: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xa148c000  ! 458: RDHPR_HINTP	rdhpr	%hintp, %r16
	.word 0x8794abab  ! 459: WRPR_TT_I	wrpr	%r18, 0x0bab, %tt
	.word 0xaf484000  ! 460: RDHPR_HTSTATE	rdhpr	%htstate, %r23
	.word 0xa3480000  ! 461: RDHPR_HPSTATE	rdhpr	%hpstate, %r17
	.word 0xaf480000  ! 462: RDHPR_HPSTATE	rdhpr	%hpstate, %r23
	.word 0xa1520000  ! 463: RDPR_PIL	<illegal instruction>
	rd	%pcr, %g2
	wr	%g2, 0, %pcr
	.word 0x8395ab30  ! 465: WRPR_TNPC_I	wrpr	%r22, 0x0b30, %tnpc
	.word 0x8995f80c  ! 466: WRPR_TICK_I	wrpr	%r23, 0x180c, %tick
	.word 0xa1450000  ! 467: RDASR	rd	%set_softint, %r16
	.word 0xaf50c000  ! 468: RDPR_TT	rdpr	%tt, %r23
	.word 0xaf460000  ! 469: RDASR	rd	%-, %r23
	ta	T_CHANGE_HPRIV
	WRPR	%g0, 0, %tick
	.word 0xb385f80c  ! 470: WRASR_I	wr	%r23, 0x180c, %-
	.word 0xaf494000  ! 471: RDHPR_HTBA	rdhpr	%htba, %r23
	setx	0xdaca3bca00005e8f, %g1, %r10
	.word 0x819a8000  ! 472: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	ta	T_CHANGE_HPRIV
	WRPR	%g0, 0, %tick
	.word 0x8985f80c  ! 473: WRASR_I	wr	%r23, 0x180c, %tick
	.word 0xa3510000  ! 474: RDPR_TICK	rdpr	%tick, %r17
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x879db41e  ! 476: WRHPR_HINTP_I	wrhpr	%r22, 0x141e, %hintp
	ta	T_CHANGE_HPRIV	! macro
	.word 0x89956a86  ! 478: WRPR_TICK_I	wrpr	%r21, 0x0a86, %tick
	.word 0xa3508000  ! 479: RDPR_TSTATE	rdpr	%tstate, %r17
	.word 0xa7518000  ! 480: RDPR_PSTATE	<illegal instruction>
	.word 0x8594a43e  ! 481: WRPR_TSTATE_I	wrpr	%r18, 0x043e, %tstate
	.word 0x8995af8e  ! 482: WRPR_TICK_I	wrpr	%r22, 0x0f8e, %tick
	.word 0xad508000  ! 483: RDPR_TSTATE	rdpr	%tstate, %r22
	.word 0xad440000  ! 484: RDASR	rd	%-, %r22
	setx	0xbcea56f500003e8d, %g1, %r10
	.word 0x819a8000  ! 485: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xa5508000  ! 486: RDPR_TSTATE	rdpr	%tstate, %r18
	.word 0xa5454000  ! 487: RDASR	rd	%clear_softint, %r18
	.word 0x8995bbb2  ! 488: WRPR_TICK_I	wrpr	%r22, 0x1bb2, %tick
	.word 0xab508000  ! 489: RDPR_TSTATE	rdpr	%tstate, %r21
	.word 0x8d942b93  ! 490: WRPR_PSTATE_I	wrpr	%r16, 0x0b93, %pstate
	.word 0xa7504000  ! 491: RDPR_TNPC	rdpr	%tnpc, %r19
	.word 0xa1508000  ! 492: RDPR_TSTATE	<illegal instruction>
	.word 0x8794be51  ! 493: WRPR_TT_I	wrpr	%r18, 0x1e51, %tt
	.word 0xaf508000  ! 494: RDPR_TSTATE	rdpr	%tstate, %r23
	.word 0xa5500000  ! 495: RDPR_TPC	<illegal instruction>
	rd	%pcr, %g2
	wr	%g2, 0, %pcr
	.word 0xa7484000  ! 497: RDHPR_HTSTATE	rdhpr	%htstate, %r19
	setx	0x69b6f43b00004f12, %g1, %r10
	.word 0x819a8000  ! 498: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xa7464000  ! 499: RDASR	rd	%-, %r19
	.word 0xa5480000  ! 500: RDHPR_HPSTATE	rdhpr	%hpstate, %r18
	.word 0xab510000  ! 501: RDPR_TICK	<illegal instruction>
	.word 0xaf504000  ! 502: RDPR_TNPC	<illegal instruction>
	rd	%pcr, %g2
	wr	%g2, 0, %pcr
	.word 0xa5484000  ! 504: RDHPR_HTSTATE	rdhpr	%htstate, %r18
	.word 0xab500000  ! 505: RDPR_TPC	<illegal instruction>
	.word 0x83956c42  ! 506: WRPR_TNPC_I	wrpr	%r21, 0x0c42, %tnpc
	setx	0xa57b15ac0000b9d2, %g1, %r10
	.word 0x839a8000  ! 507: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xab440000  ! 508: RDASR	rd	%-, %r21
	.word 0x81956867  ! 509: WRPR_TPC_I	wrpr	%r21, 0x0867, %tpc
	.word 0xa9504000  ! 510: RDPR_TNPC	rdpr	%tnpc, %r20
	.word 0x83952fa6  ! 511: WRPR_TNPC_I	wrpr	%r20, 0x0fa6, %tnpc
	.word 0xab852fa6  ! 512: WRASR_I	wr	%r20, 0x0fa6, %clear_softint
	.word 0xa945c000  ! 513: RDASR	rd	%-, %r20
	.word 0xa9494000  ! 514: RDHPR_HTBA	rdhpr	%htba, %r20
	.word 0x81943c12  ! 515: WRPR_TPC_I	wrpr	%r16, 0x1c12, %tpc
	.word 0x8194763f  ! 516: WRPR_TPC_I	wrpr	%r17, 0x163f, %tpc
	.word 0xa948c000  ! 517: RDHPR_HINTP	rdhpr	%hintp, %r20
	.word 0x8395bb86  ! 518: WRPR_TNPC_I	wrpr	%r22, 0x1b86, %tnpc
	.word 0xa9450000  ! 519: RDASR	rd	%set_softint, %r20
	.word 0xb185bb86  ! 520: WRASR_I	wr	%r22, 0x1b86, %-
	.word 0x8394fb8d  ! 521: WRPR_TNPC_I	wrpr	%r19, 0x1b8d, %tnpc
	.word 0xa9410000  ! 522: RDASR	rd	%tick, %r20
	.word 0xa3514000  ! 523: RDPR_TBA	rdpr	%tba, %r17
	.word 0x9194b188  ! 524: WRPR_PIL_I	wrpr	%r18, 0x1188, %pil
	.word 0xa3484000  ! 525: RDHPR_HTSTATE	rdhpr	%htstate, %r17
	.word 0x83952314  ! 526: WRPR_TNPC_I	wrpr	%r20, 0x0314, %tnpc
	setx	0x4068b9af00006848, %g1, %r10
	.word 0x839a8000  ! 527: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x8194242f  ! 528: WRPR_TPC_I	wrpr	%r16, 0x042f, %tpc
	.word 0x91956e22  ! 529: WRPR_PIL_I	wrpr	%r21, 0x0e22, %pil
	.word 0xa345c000  ! 530: RDASR	rd	%-, %r17
	.word 0xa3540000  ! 531: RDPR_GL	rdpr	%-, %r17
	.word 0xad484000  ! 532: RDHPR_HTSTATE	rdhpr	%htstate, %r22
	.word 0x879ca8da  ! 533: WRHPR_HINTP_I	wrhpr	%r18, 0x08da, %hintp
	.word 0xad45c000  ! 534: RDASR	rd	%-, %r22
	.word 0xa9520000  ! 535: RDPR_PIL	rdpr	%pil, %r20
	.word 0x8395ffc0  ! 536: WRPR_TNPC_I	wrpr	%r23, 0x1fc0, %tnpc
	.word 0xaf508000  ! 537: RDPR_TSTATE	rdpr	%tstate, %r23
	ta	T_CHANGE_NONPRIV	! macro
	setx	0x61a18a5700000803, %g1, %r10
	.word 0x839a8000  ! 539: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xa148c000  ! 540: RDHPR_HINTP	rdhpr	%hintp, %r16
	setx	0x2c4cf97b00004902, %g1, %r10
	.word 0x839a8000  ! 541: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xa385ffc0  ! 542: WRASR_I	wr	%r23, 0x1fc0, %-
	.word 0xa7518000  ! 543: RDPR_PSTATE	<illegal instruction>
	.word 0xa3484000  ! 544: RDHPR_HTSTATE	rdhpr	%htstate, %r17
	.word 0xb385ffc0  ! 545: WRASR_I	wr	%r23, 0x1fc0, %-
	.word 0x87942506  ! 546: WRPR_TT_I	wrpr	%r16, 0x0506, %tt
	ta	T_CHANGE_HPRIV
	WRPR	%g0, 0, %tick
	.word 0xaf842506  ! 547: WRASR_I	wr	%r16, 0x0506, %-
	.word 0x89946271  ! 548: WRPR_TICK_I	wrpr	%r17, 0x0271, %tick
	.word 0xa3518000  ! 549: RDPR_PSTATE	rdpr	%pstate, %r17
	setx	0xddcf6bfa0000ec0c, %g1, %r10
	.word 0x839a8000  ! 550: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xa9508000  ! 551: RDPR_TSTATE	rdpr	%tstate, %r20
	.word 0xad50c000  ! 552: RDPR_TT	<illegal instruction>
	.word 0x8395f78f  ! 553: WRPR_TNPC_I	wrpr	%r23, 0x178f, %tnpc
	.word 0x9194ff6d  ! 554: WRPR_PIL_I	wrpr	%r19, 0x1f6d, %pil
	.word 0xa5484000  ! 555: RDHPR_HTSTATE	rdhpr	%htstate, %r18
	.word 0xa948c000  ! 556: RDHPR_HINTP	rdhpr	%hintp, %r20
	.word 0x87957de3  ! 557: WRPR_TT_I	wrpr	%r21, 0x1de3, %tt
	.word 0x81956ee1  ! 558: WRPR_TPC_I	wrpr	%r21, 0x0ee1, %tpc
	setx	0x86f5b66800000805, %g1, %r10
	.word 0x839a8000  ! 559: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x85952b43  ! 560: WRPR_TSTATE_I	wrpr	%r20, 0x0b43, %tstate
	.word 0xa750c000  ! 561: RDPR_TT	rdpr	%tt, %r19
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa3518000  ! 563: RDPR_PSTATE	<illegal instruction>
	.word 0x8195f658  ! 564: WRPR_TPC_I	wrpr	%r23, 0x1658, %tpc
	.word 0x879da3f6  ! 565: WRHPR_HINTP_I	wrhpr	%r22, 0x03f6, %hintp
	setx	0xc673e80a0000fd98, %g1, %r10
	.word 0x819a8000  ! 566: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	rd	%pcr, %g2
	wr	%g2, 0, %pcr
	.word 0xa3440000  ! 568: RDASR	rd	%-, %r17
	.word 0xaf484000  ! 569: RDHPR_HTSTATE	rdhpr	%htstate, %r23
	.word 0x8795fefc  ! 570: WRPR_TT_I	wrpr	%r23, 0x1efc, %tt
	setx	0x26bedaf600006fc4, %g1, %r10
	.word 0x819a8000  ! 571: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x879d2c34  ! 572: WRHPR_HINTP_I	wrhpr	%r20, 0x0c34, %hintp
	.word 0xab500000  ! 573: RDPR_TPC	rdpr	%tpc, %r21
	.word 0xa3500000  ! 574: RDPR_TPC	<illegal instruction>
	ta	T_CHANGE_HPRIV
	WRPR	%g0, 0, %tick
	.word 0xb3852c34  ! 575: WRASR_I	wr	%r20, 0x0c34, %-
	mov	2, %r12
	.word 0xa1930000  ! 576: WRPR_GL_R	wrpr	%r12, %r0, %-
	ta	T_CHANGE_HPRIV
	WRPR	%g0, 0, %tick
	.word 0xaf852c34  ! 577: WRASR_I	wr	%r20, 0x0c34, %-
	.word 0xab518000  ! 578: RDPR_PSTATE	<illegal instruction>
	.word 0xab494000  ! 579: RDHPR_HTBA	rdhpr	%htba, %r21
	.word 0x8d947eb8  ! 580: WRPR_PSTATE_I	wrpr	%r17, 0x1eb8, %pstate
	.word 0x8d953e99  ! 581: WRPR_PSTATE_I	wrpr	%r20, 0x1e99, %pstate
	.word 0xad48c000  ! 582: RDHPR_HINTP	rdhpr	%hintp, %r22
	.word 0xa550c000  ! 583: RDPR_TT	<illegal instruction>
	.word 0x8794eca7  ! 584: WRPR_TT_I	wrpr	%r19, 0x0ca7, %tt
	.word 0x85957b66  ! 585: WRPR_TSTATE_I	wrpr	%r21, 0x1b66, %tstate
	.word 0xa9504000  ! 586: RDPR_TNPC	rdpr	%tnpc, %r20
	.word 0xa9410000  ! 587: RDASR	rd	%tick, %r20
	mov	0, %r12
	.word 0x8f930000  ! 588: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xaf518000  ! 589: RDPR_PSTATE	rdpr	%pstate, %r23
	.word 0xa748c000  ! 590: RDHPR_HINTP	rdhpr	%hintp, %r19
	ta	T_CHANGE_HPRIV	! macro
	ta	T_CHANGE_HPRIV
	WRPR	%g0, 0, %tick
	.word 0xb3857b66  ! 592: WRASR_I	wr	%r21, 0x1b66, %-
	setx	0x2ee074500007cc0, %g1, %r10
	.word 0x839a8000  ! 593: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xa550c000  ! 594: RDPR_TT	rdpr	%tt, %r18
	rd	%pcr, %g2
	wr	%g2, 0, %pcr
	.word 0xa5440000  ! 596: RDASR	rd	%-, %r18
	ta	T_CHANGE_HPRIV
	WRPR	%g0, 0, %tick
	.word 0x89857b66  ! 597: WRASR_I	wr	%r21, 0x1b66, %tick
	.word 0x8595e502  ! 598: WRPR_TSTATE_I	wrpr	%r23, 0x0502, %tstate
	.word 0xad484000  ! 599: RDHPR_HTSTATE	rdhpr	%htstate, %r22
	.word 0x85947bdd  ! 600: WRPR_TSTATE_I	wrpr	%r17, 0x1bdd, %tstate
	setx	0xea579f0d0000e859, %g1, %r10
	.word 0x819a8000  ! 601: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x8d9477b5  ! 602: WRPR_PSTATE_I	wrpr	%r17, 0x17b5, %pstate
	.word 0xaf508000  ! 603: RDPR_TSTATE	rdpr	%tstate, %r23
	.word 0xaf514000  ! 604: RDPR_TBA	<illegal instruction>
	ta	T_CHANGE_PRIV	! macro
	.word 0xaf494000  ! 606: RDHPR_HTBA	rdhpr	%htba, %r23
	.word 0xa9480000  ! 607: RDHPR_HPSTATE	rdhpr	%hpstate, %r20
	.word 0xaf508000  ! 608: RDPR_TSTATE	<illegal instruction>
	.word 0xa9504000  ! 609: RDPR_TNPC	<illegal instruction>
	.word 0x9194fd9d  ! 610: WRPR_PIL_I	wrpr	%r19, 0x1d9d, %pil
	.word 0xad510000  ! 611: RDPR_TICK	rdpr	%tick, %r22
	.word 0xaf484000  ! 612: RDHPR_HTSTATE	rdhpr	%htstate, %r23
	.word 0xa5508000  ! 613: RDPR_TSTATE	<illegal instruction>
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91952ddd  ! 615: WRPR_PIL_I	wrpr	%r20, 0x0ddd, %pil
	.word 0xab50c000  ! 616: RDPR_TT	rdpr	%tt, %r21
	.word 0xa1508000  ! 617: RDPR_TSTATE	<illegal instruction>
	.word 0xa1510000  ! 618: RDPR_TICK	<illegal instruction>
	.word 0xaf500000  ! 619: RDPR_TPC	<illegal instruction>
	mov	0, %r12
	.word 0x8f930000  ! 620: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x89942914  ! 621: WRPR_TICK_I	wrpr	%r16, 0x0914, %tick
	.word 0xa150c000  ! 622: RDPR_TT	rdpr	%tt, %r16
	.word 0xa5480000  ! 623: RDHPR_HPSTATE	rdhpr	%hpstate, %r18
	setx	0xf98e78ba00001a8f, %g1, %r10
	.word 0x839a8000  ! 624: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xab842914  ! 625: WRASR_I	wr	%r16, 0x0914, %clear_softint
	.word 0xa9494000  ! 626: RDHPR_HTBA	rdhpr	%htba, %r20
	.word 0x819579f8  ! 627: WRPR_TPC_I	wrpr	%r21, 0x19f8, %tpc
	.word 0xaf494000  ! 628: RDHPR_HTBA	rdhpr	%htba, %r23
	.word 0x879cb4e9  ! 629: WRHPR_HINTP_I	wrhpr	%r18, 0x14e9, %hintp
	.word 0xad520000  ! 630: RDPR_PIL	rdpr	%pil, %r22
	.word 0xa9504000  ! 631: RDPR_TNPC	<illegal instruction>
	.word 0xab508000  ! 632: RDPR_TSTATE	<illegal instruction>
	.word 0x859531fb  ! 633: WRPR_TSTATE_I	wrpr	%r20, 0x11fb, %tstate
	.word 0x87947d06  ! 634: WRPR_TT_I	wrpr	%r17, 0x1d06, %tt
	.word 0xa3504000  ! 635: RDPR_TNPC	rdpr	%tnpc, %r17
	.word 0xad847d06  ! 636: WRASR_I	wr	%r17, 0x1d06, %softint
	.word 0xad494000  ! 637: RDHPR_HTBA	rdhpr	%htba, %r22
	.word 0xa7484000  ! 638: RDHPR_HTSTATE	rdhpr	%htstate, %r19
	.word 0x879ce71f  ! 639: WRHPR_HINTP_I	wrhpr	%r19, 0x071f, %hintp
	.word 0xa7450000  ! 640: RDASR	rd	%set_softint, %r19
	.word 0xa1510000  ! 641: RDPR_TICK	rdpr	%tick, %r16
	.word 0xab508000  ! 642: RDPR_TSTATE	rdpr	%tstate, %r21
	.word 0x8594bbfc  ! 643: WRPR_TSTATE_I	wrpr	%r18, 0x1bfc, %tstate
	.word 0x91947074  ! 644: WRPR_PIL_I	wrpr	%r17, 0x1074, %pil
	.word 0x8d94bc0b  ! 645: WRPR_PSTATE_I	wrpr	%r18, 0x1c0b, %pstate
	.word 0xad484000  ! 646: RDHPR_HTSTATE	rdhpr	%htstate, %r22
	.word 0xa9480000  ! 647: RDHPR_HPSTATE	rdhpr	%hpstate, %r20
	.word 0xa9450000  ! 648: RDASR	rd	%set_softint, %r20
	.word 0xa9504000  ! 649: RDPR_TNPC	<illegal instruction>
	.word 0xa150c000  ! 650: RDPR_TT	<illegal instruction>
	.word 0x91956d52  ! 651: WRPR_PIL_I	wrpr	%r21, 0x0d52, %pil
	.word 0xa148c000  ! 652: RDHPR_HINTP	rdhpr	%hintp, %r16
	.word 0x8595a8b4  ! 653: WRPR_TSTATE_I	wrpr	%r22, 0x08b4, %tstate
	.word 0xa1518000  ! 654: RDPR_PSTATE	rdpr	%pstate, %r16
	.word 0x879d7706  ! 655: WRHPR_HINTP_I	wrhpr	%r21, 0x1706, %hintp
	.word 0x91947be1  ! 656: WRPR_PIL_I	wrpr	%r17, 0x1be1, %pil
	.word 0xa5518000  ! 657: RDPR_PSTATE	rdpr	%pstate, %r18
	.word 0xa5458000  ! 658: RDASR	rd	%softint, %r18
	.word 0xaf48c000  ! 659: RDHPR_HINTP	rdhpr	%hintp, %r23
	.word 0xaf500000  ! 660: RDPR_TPC	<illegal instruction>
	.word 0x8194f503  ! 661: WRPR_TPC_I	wrpr	%r19, 0x1503, %tpc
	.word 0xad520000  ! 662: RDPR_PIL	rdpr	%pil, %r22
	.word 0xab500000  ! 663: RDPR_TPC	<illegal instruction>
	setx	0xa17248740000ef9c, %g1, %r10
	.word 0x839a8000  ! 664: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	rd	%pcr, %g2
	wr	%g2, 0, %pcr
	.word 0xab458000  ! 666: RDASR	rd	%softint, %r21
	.word 0x879c2e09  ! 667: WRHPR_HINTP_I	wrhpr	%r16, 0x0e09, %hintp
	.word 0xa5500000  ! 668: RDPR_TPC	rdpr	%tpc, %r18
	.word 0xa1540000  ! 669: RDPR_GL	<illegal instruction>
	.word 0xa9484000  ! 670: RDHPR_HTSTATE	rdhpr	%htstate, %r20
	.word 0xa9460000  ! 671: RDASR	rd	%-, %r20
	.word 0x89842e09  ! 672: WRASR_I	wr	%r16, 0x0e09, %tick
	.word 0x87947048  ! 673: WRPR_TT_I	wrpr	%r17, 0x1048, %tt
	.word 0xa9484000  ! 674: RDHPR_HTSTATE	rdhpr	%htstate, %r20
	.word 0x83952532  ! 675: WRPR_TNPC_I	wrpr	%r20, 0x0532, %tnpc
	.word 0x89852532  ! 676: WRASR_I	wr	%r20, 0x0532, %tick
	.word 0xa9458000  ! 677: RDASR	rd	%softint, %r20
	.word 0x8794f00f  ! 678: WRPR_TT_I	wrpr	%r19, 0x100f, %tt
	.word 0xa9458000  ! 679: RDASR	rd	%softint, %r20
	.word 0x85952abd  ! 680: WRPR_TSTATE_I	wrpr	%r20, 0x0abd, %tstate
	.word 0xa548c000  ! 681: RDHPR_HINTP	rdhpr	%hintp, %r18
	.word 0xaf852abd  ! 682: WRASR_I	wr	%r20, 0x0abd, %-
	.word 0xa5460000  ! 683: RDASR	rd	%-, %r18
	.word 0xa7480000  ! 684: RDHPR_HPSTATE	rdhpr	%hpstate, %r19
	.word 0x879cb52c  ! 685: WRHPR_HINTP_I	wrhpr	%r18, 0x152c, %hintp
	ta	T_CHANGE_HPRIV
	WRPR	%g0, 0, %tick
	.word 0xab84b52c  ! 686: WRASR_I	wr	%r18, 0x152c, %clear_softint
	.word 0x85957f1c  ! 687: WRPR_TSTATE_I	wrpr	%r21, 0x1f1c, %tstate
	.word 0x8395fc38  ! 688: WRPR_TNPC_I	wrpr	%r23, 0x1c38, %tnpc
	.word 0x83942921  ! 689: WRPR_TNPC_I	wrpr	%r16, 0x0921, %tnpc
	.word 0x8595f557  ! 690: WRPR_TSTATE_I	wrpr	%r23, 0x1557, %tstate
	.word 0xa748c000  ! 691: RDHPR_HINTP	rdhpr	%hintp, %r19
	.word 0x8194bc3e  ! 692: WRPR_TPC_I	wrpr	%r18, 0x1c3e, %tpc
	.word 0x879d3ce2  ! 693: WRHPR_HINTP_I	wrhpr	%r20, 0x1ce2, %hintp
	.word 0xa7410000  ! 694: RDASR	rd	%tick, %r19
	.word 0xa550c000  ! 695: RDPR_TT	rdpr	%tt, %r18
	.word 0xa9853ce2  ! 696: WRASR_I	wr	%r20, 0x1ce2, %set_softint
	.word 0xa3518000  ! 697: RDPR_PSTATE	<illegal instruction>
	.word 0x83956641  ! 698: WRPR_TNPC_I	wrpr	%r21, 0x0641, %tnpc
	.word 0x8194b422  ! 699: WRPR_TPC_I	wrpr	%r18, 0x1422, %tpc
	.word 0x819561e4  ! 700: WRPR_TPC_I	wrpr	%r21, 0x01e4, %tpc
	.word 0xa150c000  ! 701: RDPR_TT	rdpr	%tt, %r16
	setx	0xce1b85b00000ff0f, %g1, %r10
	.word 0x839a8000  ! 702: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x89943047  ! 703: WRPR_TICK_I	wrpr	%r16, 0x1047, %tick
	.word 0xa5540000  ! 704: RDPR_GL	rdpr	%-, %r18
	.word 0x879cab64  ! 705: WRHPR_HINTP_I	wrhpr	%r18, 0x0b64, %hintp
	.word 0x91952ffd  ! 706: WRPR_PIL_I	wrpr	%r20, 0x0ffd, %pil
	mov	2, %r12
	.word 0x8f930000  ! 707: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xa7504000  ! 708: RDPR_TNPC	rdpr	%tnpc, %r19
	.word 0x819539ea  ! 709: WRPR_TPC_I	wrpr	%r20, 0x19ea, %tpc
	.word 0xa7444000  ! 710: RDASR	rd	%-, %r19
	.word 0x8795f17d  ! 711: WRPR_TT_I	wrpr	%r23, 0x117d, %tt
	.word 0x81942c3a  ! 712: WRPR_TPC_I	wrpr	%r16, 0x0c3a, %tpc
	.word 0xad48c000  ! 713: RDHPR_HINTP	rdhpr	%hintp, %r22
	.word 0x9194b415  ! 714: WRPR_PIL_I	wrpr	%r18, 0x1415, %pil
	.word 0x8595ac65  ! 715: WRPR_TSTATE_I	wrpr	%r22, 0x0c65, %tstate
	.word 0xa548c000  ! 716: RDHPR_HINTP	rdhpr	%hintp, %r18
	.word 0xab85ac65  ! 717: WRASR_I	wr	%r22, 0x0c65, %clear_softint
	ta	T_CHANGE_NONPRIV	! macro
	setx	0x1ccaa15e00001bd6, %g1, %r10
	.word 0x839a8000  ! 719: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xaf508000  ! 720: RDPR_TSTATE	rdpr	%tstate, %r23
	setx	0x885e1fa50000e95c, %g1, %r10
	.word 0x839a8000  ! 721: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xaf460000  ! 722: RDASR	rd	%-, %r23
	.word 0x8595a755  ! 723: WRPR_TSTATE_I	wrpr	%r22, 0x0755, %tstate
	.word 0x8594ba0c  ! 724: WRPR_TSTATE_I	wrpr	%r18, 0x1a0c, %tstate
	.word 0xaf454000  ! 725: RDASR	rd	%clear_softint, %r23
	setx	0x7ec59db500000bc0, %g1, %r10
	.word 0x839a8000  ! 726: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xa7484000  ! 727: RDHPR_HTSTATE	rdhpr	%htstate, %r19
	setx	0x8b597ede0000fd96, %g1, %r10
	.word 0x819a8000  ! 728: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8795e211  ! 730: WRPR_TT_I	wrpr	%r23, 0x0211, %tt
	.word 0xa7500000  ! 731: RDPR_TPC	rdpr	%tpc, %r19
	.word 0x87946da6  ! 732: WRPR_TT_I	wrpr	%r17, 0x0da6, %tt
	.word 0xa7458000  ! 733: RDASR	rd	%softint, %r19
	.word 0x839538f1  ! 734: WRPR_TNPC_I	wrpr	%r20, 0x18f1, %tnpc
	.word 0xa745c000  ! 735: RDASR	rd	%-, %r19
	.word 0x8195f8a7  ! 736: WRPR_TPC_I	wrpr	%r23, 0x18a7, %tpc
	.word 0xa1484000  ! 737: RDHPR_HTSTATE	rdhpr	%htstate, %r16
	.word 0xa3500000  ! 738: RDPR_TPC	rdpr	%tpc, %r17
	.word 0xa9504000  ! 739: RDPR_TNPC	<illegal instruction>
	.word 0x8594f64c  ! 740: WRPR_TSTATE_I	wrpr	%r19, 0x164c, %tstate
	setx	0xa13a650c0000cf5f, %g1, %r10
	.word 0x819a8000  ! 741: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x9195f435  ! 742: WRPR_PIL_I	wrpr	%r23, 0x1435, %pil
	.word 0x87943fa8  ! 743: WRPR_TT_I	wrpr	%r16, 0x1fa8, %tt
	.word 0x91947b20  ! 744: WRPR_PIL_I	wrpr	%r17, 0x1b20, %pil
	.word 0xa9504000  ! 745: RDPR_TNPC	rdpr	%tnpc, %r20
	.word 0xaf508000  ! 746: RDPR_TSTATE	<illegal instruction>
	.word 0x83957ccb  ! 747: WRPR_TNPC_I	wrpr	%r21, 0x1ccb, %tnpc
	.word 0x8394b5b4  ! 748: WRPR_TNPC_I	wrpr	%r18, 0x15b4, %tnpc
	.word 0xad50c000  ! 749: RDPR_TT	rdpr	%tt, %r22
	.word 0x9194601e  ! 750: WRPR_PIL_I	wrpr	%r17, 0x001e, %pil
	.word 0xb384601e  ! 751: WRASR_I	wr	%r17, 0x001e, %-
	setx	0x77b559c900001b84, %g1, %r10
	.word 0x839a8000  ! 752: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xad454000  ! 753: RDASR	rd	%clear_softint, %r22
	.word 0x8794e520  ! 754: WRPR_TT_I	wrpr	%r19, 0x0520, %tt
	.word 0x8794b09b  ! 755: WRPR_TT_I	wrpr	%r18, 0x109b, %tt
	ta	T_CHANGE_HPRIV
	WRPR	%g0, 0, %tick
	.word 0xb384b09b  ! 756: WRASR_I	wr	%r18, 0x109b, %-
	.word 0x879db2a1  ! 757: WRHPR_HINTP_I	wrhpr	%r22, 0x12a1, %hintp
	.word 0x8594ee49  ! 758: WRPR_TSTATE_I	wrpr	%r19, 0x0e49, %tstate
	.word 0xaf540000  ! 759: RDPR_GL	rdpr	%-, %r23
	.word 0x8194e9d8  ! 760: WRPR_TPC_I	wrpr	%r19, 0x09d8, %tpc
	setx	0xe7dc86400005d95, %g1, %r10
	.word 0x839a8000  ! 761: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xa3504000  ! 762: RDPR_TNPC	rdpr	%tnpc, %r17
	mov	2, %r12
	.word 0x8f930000  ! 763: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0x8d957f06  ! 764: WRPR_PSTATE_I	wrpr	%r21, 0x1f06, %pstate
	mov	0, %r12
	.word 0xa1930000  ! 765: WRPR_GL_R	wrpr	%r12, %r0, %-
	ta	T_CHANGE_HPRIV
	WRPR	%g0, 0, %tick
	.word 0x89857f06  ! 766: WRASR_I	wr	%r21, 0x1f06, %tick
	.word 0xa550c000  ! 767: RDPR_TT	rdpr	%tt, %r18
	.word 0xaf857f06  ! 768: WRASR_I	wr	%r21, 0x1f06, %-
	ta	T_CHANGE_HPRIV	! macro
	setx	0x11b6a04800007bd2, %g1, %r10
	.word 0x839a8000  ! 770: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	setx	0x817e082f00003f93, %g1, %r10
	.word 0x839a8000  ! 771: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	setx	0xf3a4d99a0000288b, %g1, %r10
	.word 0x839a8000  ! 772: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xa3520000  ! 773: RDPR_PIL	rdpr	%pil, %r17
	.word 0x8d94225a  ! 774: WRPR_PSTATE_I	wrpr	%r16, 0x025a, %pstate
	.word 0xa1494000  ! 775: RDHPR_HTBA	rdhpr	%htba, %r16
	setx	0x85830e7b00005c9b, %g1, %r10
	.word 0x819a8000  ! 776: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x8395f637  ! 777: WRPR_TNPC_I	wrpr	%r23, 0x1637, %tnpc
	.word 0x81947213  ! 778: WRPR_TPC_I	wrpr	%r17, 0x1213, %tpc
	.word 0x879c3052  ! 779: WRHPR_HINTP_I	wrhpr	%r16, 0x1052, %hintp
	.word 0xa5494000  ! 780: RDHPR_HTBA	rdhpr	%htba, %r18
	.word 0xa5458000  ! 781: RDASR	rd	%softint, %r18
	.word 0xaf480000  ! 782: RDHPR_HPSTATE	rdhpr	%hpstate, %r23
	.word 0xad50c000  ! 783: RDPR_TT	<illegal instruction>
	.word 0xa548c000  ! 784: RDHPR_HINTP	rdhpr	%hintp, %r18
	.word 0x8194eb1f  ! 785: WRPR_TPC_I	wrpr	%r19, 0x0b1f, %tpc
	.word 0x8795a663  ! 786: WRPR_TT_I	wrpr	%r22, 0x0663, %tt
	.word 0xaf484000  ! 787: RDHPR_HTSTATE	rdhpr	%htstate, %r23
	.word 0xab484000  ! 788: RDHPR_HTSTATE	rdhpr	%htstate, %r21
	.word 0xa950c000  ! 789: RDPR_TT	<illegal instruction>
	.word 0x8795b5a1  ! 790: WRPR_TT_I	wrpr	%r22, 0x15a1, %tt
	.word 0xa5518000  ! 791: RDPR_PSTATE	rdpr	%pstate, %r18
	mov	0, %r12
	.word 0xa1930000  ! 792: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xa3500000  ! 793: RDPR_TPC	rdpr	%tpc, %r17
	setx	0x2fdef7640000ab47, %g1, %r10
	.word 0x819a8000  ! 794: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xa3410000  ! 795: RDASR	rd	%tick, %r17
	.word 0xa3458000  ! 796: RDASR	rd	%softint, %r17
	ta	T_CHANGE_HPRIV
	WRPR	%g0, 0, %tick
	.word 0xa385b5a1  ! 797: WRASR_I	wr	%r22, 0x15a1, %-
	setx	0xa5bf72800001889, %g1, %r10
	.word 0x839a8000  ! 798: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x9194b36b  ! 799: WRPR_PIL_I	wrpr	%r18, 0x136b, %pil
	.word 0xb184b36b  ! 800: WRASR_I	wr	%r18, 0x136b, %-
	.word 0xa3504000  ! 801: RDPR_TNPC	<illegal instruction>
	.word 0x89943734  ! 802: WRPR_TICK_I	wrpr	%r16, 0x1734, %tick
	.word 0xa3484000  ! 803: RDHPR_HTSTATE	rdhpr	%htstate, %r17
	.word 0xa9508000  ! 804: RDPR_TSTATE	<illegal instruction>
	.word 0xa3520000  ! 805: RDPR_PIL	<illegal instruction>
	.word 0xab484000  ! 806: RDHPR_HTSTATE	rdhpr	%htstate, %r21
	.word 0xa9494000  ! 807: RDHPR_HTBA	rdhpr	%htba, %r20
	.word 0xa9843734  ! 808: WRASR_I	wr	%r16, 0x1734, %set_softint
	.word 0x8394a19d  ! 809: WRPR_TNPC_I	wrpr	%r18, 0x019d, %tnpc
	.word 0x8984a19d  ! 810: WRASR_I	wr	%r18, 0x019d, %tick
	.word 0xa9450000  ! 811: RDASR	rd	%set_softint, %r20
	.word 0xa3484000  ! 812: RDHPR_HTSTATE	rdhpr	%htstate, %r17
	setx	0x8ba4b64b0000695f, %g1, %r10
	.word 0x839a8000  ! 813: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x879d3b45  ! 814: WRHPR_HINTP_I	wrhpr	%r20, 0x1b45, %hintp
	.word 0x879c3088  ! 815: WRHPR_HINTP_I	wrhpr	%r16, 0x1088, %hintp
	.word 0xad51c000  ! 816: RDPR_TL	rdpr	%tl, %r22
	.word 0xaf484000  ! 817: RDHPR_HTSTATE	rdhpr	%htstate, %r23
	.word 0x85952e61  ! 818: WRPR_TSTATE_I	wrpr	%r20, 0x0e61, %tstate
	.word 0xa7484000  ! 819: RDHPR_HTSTATE	rdhpr	%htstate, %r19
	.word 0xa9510000  ! 820: RDPR_TICK	<illegal instruction>
	.word 0xa9500000  ! 821: RDPR_TPC	<illegal instruction>
	.word 0xa3852e61  ! 822: WRASR_I	wr	%r20, 0x0e61, %-
	.word 0xab500000  ! 823: RDPR_TPC	<illegal instruction>
	.word 0xa9504000  ! 824: RDPR_TNPC	<illegal instruction>
	.word 0xa1484000  ! 825: RDHPR_HTSTATE	rdhpr	%htstate, %r16
	.word 0xa7500000  ! 826: RDPR_TPC	rdpr	%tpc, %r19
	.word 0x8994fd9c  ! 827: WRPR_TICK_I	wrpr	%r19, 0x1d9c, %tick
	setx	0x628183af00005c8a, %g1, %r10
	.word 0x839a8000  ! 828: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xad84fd9c  ! 829: WRASR_I	wr	%r19, 0x1d9c, %softint
	.word 0xa5508000  ! 830: RDPR_TSTATE	<illegal instruction>
	.word 0xa9510000  ! 831: RDPR_TICK	<illegal instruction>
	.word 0xa1484000  ! 832: RDHPR_HTSTATE	rdhpr	%htstate, %r16
	.word 0xa3480000  ! 833: RDHPR_HPSTATE	rdhpr	%hpstate, %r17
	.word 0xa150c000  ! 834: RDPR_TT	<illegal instruction>
	.word 0x85947826  ! 835: WRPR_TSTATE_I	wrpr	%r17, 0x1826, %tstate
	.word 0xa3847826  ! 836: WRASR_I	wr	%r17, 0x1826, %-
	.word 0x8d94fb1f  ! 837: WRPR_PSTATE_I	wrpr	%r19, 0x1b1f, %pstate
	.word 0x8994eb61  ! 838: WRPR_TICK_I	wrpr	%r19, 0x0b61, %tick
	.word 0xa1454000  ! 839: RDASR	rd	%clear_softint, %r16
	.word 0x83957649  ! 840: WRPR_TNPC_I	wrpr	%r21, 0x1649, %tnpc
	setx	0xa071508800002911, %g1, %r10
	.word 0x839a8000  ! 841: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x8794a2ef  ! 842: WRPR_TT_I	wrpr	%r18, 0x02ef, %tt
	setx	0x60e086f600002c04, %g1, %r10
	.word 0x819a8000  ! 843: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xa9500000  ! 844: RDPR_TPC	rdpr	%tpc, %r20
	.word 0x81957fc5  ! 845: WRPR_TPC_I	wrpr	%r21, 0x1fc5, %tpc
	.word 0xad508000  ! 846: RDPR_TSTATE	rdpr	%tstate, %r22
	.word 0xab857fc5  ! 847: WRASR_I	wr	%r21, 0x1fc5, %clear_softint
	.word 0xa1514000  ! 848: RDPR_TBA	<illegal instruction>
	.word 0xa1410000  ! 849: RDASR	rd	%tick, %r16
	.word 0xad504000  ! 850: RDPR_TNPC	<illegal instruction>
	.word 0xab857fc5  ! 851: WRASR_I	wr	%r21, 0x1fc5, %clear_softint
	.word 0xad508000  ! 852: RDPR_TSTATE	<illegal instruction>
	.word 0xab857fc5  ! 853: WRASR_I	wr	%r21, 0x1fc5, %clear_softint
	.word 0x87956949  ! 854: WRPR_TT_I	wrpr	%r21, 0x0949, %tt
	setx	0x116424ff00003c92, %g1, %r10
	.word 0x839a8000  ! 855: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	setx	0xefba954f0000884d, %g1, %r10
	.word 0x839a8000  ! 856: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xab508000  ! 857: RDPR_TSTATE	rdpr	%tstate, %r21
	.word 0xa9480000  ! 858: RDHPR_HPSTATE	rdhpr	%hpstate, %r20
	.word 0xa9410000  ! 859: RDASR	rd	%tick, %r20
	.word 0xaf48c000  ! 860: RDHPR_HINTP	rdhpr	%hintp, %r23
	.word 0x89856949  ! 861: WRASR_I	wr	%r21, 0x0949, %tick
	.word 0xa1510000  ! 862: RDPR_TICK	rdpr	%tick, %r16
	.word 0x8795fa06  ! 863: WRPR_TT_I	wrpr	%r23, 0x1a06, %tt
	.word 0x8d95fd5e  ! 864: WRPR_PSTATE_I	wrpr	%r23, 0x1d5e, %pstate
	.word 0x8194ac64  ! 865: WRPR_TPC_I	wrpr	%r18, 0x0c64, %tpc
	setx	0xcbdef59000009c2, %g1, %r10
	.word 0x839a8000  ! 866: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0x81953014  ! 867: WRPR_TPC_I	wrpr	%r20, 0x1014, %tpc
	.word 0xa5484000  ! 868: RDHPR_HTSTATE	rdhpr	%htstate, %r18
	.word 0xa3508000  ! 869: RDPR_TSTATE	<illegal instruction>
	.word 0xad484000  ! 870: RDHPR_HTSTATE	rdhpr	%htstate, %r22
	.word 0xa9484000  ! 871: RDHPR_HTSTATE	rdhpr	%htstate, %r20
	.word 0x87952ef7  ! 872: WRPR_TT_I	wrpr	%r20, 0x0ef7, %tt
	.word 0xa9410000  ! 873: RDASR	rd	%tick, %r20
	.word 0xaf50c000  ! 874: RDPR_TT	rdpr	%tt, %r23
	.word 0xa3484000  ! 875: RDHPR_HTSTATE	rdhpr	%htstate, %r17
	mov	0, %r12
	.word 0x8f930000  ! 876: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xa3458000  ! 877: RDASR	rd	%softint, %r17
	.word 0xa1484000  ! 878: RDHPR_HTSTATE	rdhpr	%htstate, %r16
	.word 0x879d3764  ! 879: WRHPR_HINTP_I	wrhpr	%r20, 0x1764, %hintp
	.word 0xa9853764  ! 880: WRASR_I	wr	%r20, 0x1764, %set_softint
	.word 0x879c2d63  ! 881: WRHPR_HINTP_I	wrhpr	%r16, 0x0d63, %hintp
	.word 0xa3500000  ! 882: RDPR_TPC	rdpr	%tpc, %r17
	.word 0xa551c000  ! 883: RDPR_TL	<illegal instruction>
	.word 0xad504000  ! 884: RDPR_TNPC	<illegal instruction>
	.word 0xaf48c000  ! 885: RDHPR_HINTP	rdhpr	%hintp, %r23
	.word 0x9195777d  ! 886: WRPR_PIL_I	wrpr	%r21, 0x177d, %pil
	.word 0x83946f3a  ! 887: WRPR_TNPC_I	wrpr	%r17, 0x0f3a, %tnpc
	.word 0x8d9536a9  ! 888: WRPR_PSTATE_I	wrpr	%r20, 0x16a9, %pstate
	setx	0xac79f94800005945, %g1, %r10
	.word 0x839a8000  ! 889: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xa3494000  ! 890: RDHPR_HTBA	rdhpr	%htba, %r17
	.word 0xab484000  ! 891: RDHPR_HTSTATE	rdhpr	%htstate, %r21
	.word 0xa950c000  ! 892: RDPR_TT	<illegal instruction>
	.word 0x8594e727  ! 893: WRPR_TSTATE_I	wrpr	%r19, 0x0727, %tstate
	.word 0x87942b63  ! 894: WRPR_TT_I	wrpr	%r16, 0x0b63, %tt
	.word 0xa3500000  ! 895: RDPR_TPC	rdpr	%tpc, %r17
	.word 0xa3454000  ! 896: RDASR	rd	%clear_softint, %r17
	.word 0xa5508000  ! 897: RDPR_TSTATE	<illegal instruction>
	.word 0x879da7c2  ! 898: WRHPR_HINTP_I	wrhpr	%r22, 0x07c2, %hintp
	.word 0xaf504000  ! 899: RDPR_TNPC	rdpr	%tnpc, %r23
	.word 0x85952ae0  ! 900: WRPR_TSTATE_I	wrpr	%r20, 0x0ae0, %tstate
	.word 0xa5484000  ! 901: RDHPR_HTSTATE	rdhpr	%htstate, %r18
	.word 0xa148c000  ! 902: RDHPR_HINTP	rdhpr	%hintp, %r16
	.word 0x8395e385  ! 903: WRPR_TNPC_I	wrpr	%r23, 0x0385, %tnpc
	.word 0xa7508000  ! 904: RDPR_TSTATE	rdpr	%tstate, %r19
	.word 0xa985e385  ! 905: WRASR_I	wr	%r23, 0x0385, %set_softint
	setx	0x2581c1c5000059d4, %g1, %r10
	.word 0x819a8000  ! 906: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0x879424cd  ! 907: WRPR_TT_I	wrpr	%r16, 0x04cd, %tt
	.word 0xa950c000  ! 908: RDPR_TT	rdpr	%tt, %r20
	.word 0xa9508000  ! 909: RDPR_TSTATE	<illegal instruction>
	.word 0xa3494000  ! 910: RDHPR_HTBA	rdhpr	%htba, %r17
	.word 0xad480000  ! 911: RDHPR_HPSTATE	rdhpr	%hpstate, %r22
	.word 0xad410000  ! 912: RDASR	rd	%tick, %r22
	.word 0xa950c000  ! 913: RDPR_TT	<illegal instruction>
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8395bfc1  ! 915: WRPR_TNPC_I	wrpr	%r22, 0x1fc1, %tnpc
	.word 0xa548c000  ! 916: RDHPR_HINTP	rdhpr	%hintp, %r18
	.word 0x8194bfe7  ! 917: WRPR_TPC_I	wrpr	%r18, 0x1fe7, %tpc
	.word 0x87947c7e  ! 918: WRPR_TT_I	wrpr	%r17, 0x1c7e, %tt
	.word 0xa9494000  ! 919: RDHPR_HTBA	rdhpr	%htba, %r20
	setx	0xcbefcc9e00001f01, %g1, %r10
	.word 0x839a8000  ! 920: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xa751c000  ! 921: RDPR_TL	rdpr	%tl, %r19
	.word 0x9195683e  ! 922: WRPR_PIL_I	wrpr	%r21, 0x083e, %pil
	.word 0xa7458000  ! 923: RDASR	rd	%softint, %r19
	.word 0x85952b41  ! 924: WRPR_TSTATE_I	wrpr	%r20, 0x0b41, %tstate
	.word 0x83943195  ! 925: WRPR_TNPC_I	wrpr	%r16, 0x1195, %tnpc
	mov	1, %r12
	.word 0x8f930000  ! 926: WRPR_TL_R	wrpr	%r12, %r0, %tl
	mov	0, %r12
	.word 0xa1930000  ! 927: WRPR_GL_R	wrpr	%r12, %r0, %-
	.word 0xad50c000  ! 928: RDPR_TT	rdpr	%tt, %r22
	.word 0xab540000  ! 929: RDPR_GL	<illegal instruction>
	ta	T_CHANGE_NONHPRIV	! macro
	setx	0xa1f6a3390000ce14, %g1, %r10
	.word 0x839a8000  ! 931: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xa1504000  ! 932: RDPR_TNPC	rdpr	%tnpc, %r16
	.word 0xa5508000  ! 933: RDPR_TSTATE	rdpr	%tstate, %r18
	.word 0x8994fed4  ! 934: WRPR_TICK_I	wrpr	%r19, 0x1ed4, %tick
	.word 0xa5410000  ! 935: RDASR	rd	%tick, %r18
	.word 0xa1500000  ! 936: RDPR_TPC	rdpr	%tpc, %r16
	.word 0x8194a9fd  ! 937: WRPR_TPC_I	wrpr	%r18, 0x09fd, %tpc
	setx	0x6f39253f0000a917, %g1, %r10
	.word 0x819a8000  ! 938: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xa9484000  ! 939: RDHPR_HTSTATE	rdhpr	%htstate, %r20
	.word 0xa348c000  ! 940: RDHPR_HINTP	rdhpr	%hintp, %r17
	setx	0x111bc99e00006d16, %g1, %r10
	.word 0x819a8000  ! 941: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xa3410000  ! 942: RDASR	rd	%tick, %r17
	.word 0x8594f24a  ! 943: WRPR_TSTATE_I	wrpr	%r19, 0x124a, %tstate
	.word 0x83943aff  ! 944: WRPR_TNPC_I	wrpr	%r16, 0x1aff, %tnpc
	.word 0x9194e4aa  ! 945: WRPR_PIL_I	wrpr	%r19, 0x04aa, %pil
	.word 0xa350c000  ! 946: RDPR_TT	rdpr	%tt, %r17
	.word 0xab480000  ! 947: RDHPR_HPSTATE	rdhpr	%hpstate, %r21
	.word 0x8d95ad34  ! 948: WRPR_PSTATE_I	wrpr	%r22, 0x0d34, %pstate
	.word 0x85953cde  ! 949: WRPR_TSTATE_I	wrpr	%r20, 0x1cde, %tstate
	.word 0xa1484000  ! 950: RDHPR_HTSTATE	rdhpr	%htstate, %r16
	.word 0xb3853cde  ! 951: WRASR_I	wr	%r20, 0x1cde, %-
	.word 0xa1454000  ! 952: RDASR	rd	%clear_softint, %r16
	rd	%pcr, %g2
	wr	%g2, 0, %pcr
	.word 0x8594f2cc  ! 954: WRPR_TSTATE_I	wrpr	%r19, 0x12cc, %tstate
	ta	T_CHANGE_HPRIV
	WRPR	%g0, 0, %tick
	.word 0x8984f2cc  ! 955: WRASR_I	wr	%r19, 0x12cc, %tick
	.word 0xb384f2cc  ! 956: WRASR_I	wr	%r19, 0x12cc, %-
	ta	T_CHANGE_HPRIV
	WRPR	%g0, 0, %tick
	.word 0xb184f2cc  ! 957: WRASR_I	wr	%r19, 0x12cc, %-
	.word 0xa9484000  ! 958: RDHPR_HTSTATE	rdhpr	%htstate, %r20
	.word 0x879c7e84  ! 959: WRHPR_HINTP_I	wrhpr	%r17, 0x1e84, %hintp
	.word 0xb3847e84  ! 960: WRASR_I	wr	%r17, 0x1e84, %-
	ta	T_CHANGE_HPRIV
	WRPR	%g0, 0, %tick
	.word 0xad847e84  ! 961: WRASR_I	wr	%r17, 0x1e84, %softint
	.word 0xa5480000  ! 962: RDHPR_HPSTATE	rdhpr	%hpstate, %r18
	.word 0x87943c77  ! 963: WRPR_TT_I	wrpr	%r16, 0x1c77, %tt
	.word 0xa9508000  ! 964: RDPR_TSTATE	rdpr	%tstate, %r20
	.word 0x879cef06  ! 965: WRHPR_HINTP_I	wrhpr	%r19, 0x0f06, %hintp
	.word 0x8795f52b  ! 966: WRPR_TT_I	wrpr	%r23, 0x152b, %tt
	.word 0x8794ec9c  ! 967: WRPR_TT_I	wrpr	%r19, 0x0c9c, %tt
	.word 0xa150c000  ! 968: RDPR_TT	rdpr	%tt, %r16
	setx	0xcd46e7c10000bd05, %g1, %r10
	.word 0x819a8000  ! 969: WRHPR_HPSTATE_R	wrhpr	%r10, %r0, %hpstate
	.word 0xab84ec9c  ! 970: WRASR_I	wr	%r19, 0x0c9c, %clear_softint
	.word 0xa948c000  ! 971: RDHPR_HINTP	rdhpr	%hintp, %r20
	.word 0xaf480000  ! 972: RDHPR_HPSTATE	rdhpr	%hpstate, %r23
	.word 0x879db242  ! 973: WRHPR_HINTP_I	wrhpr	%r22, 0x1242, %hintp
	.word 0xa7520000  ! 974: RDPR_PIL	rdpr	%pil, %r19
	.word 0x8195efa3  ! 975: WRPR_TPC_I	wrpr	%r23, 0x0fa3, %tpc
	.word 0x8795adc2  ! 976: WRPR_TT_I	wrpr	%r22, 0x0dc2, %tt
	.word 0x8d95ec90  ! 977: WRPR_PSTATE_I	wrpr	%r23, 0x0c90, %pstate
	.word 0xab50c000  ! 978: RDPR_TT	rdpr	%tt, %r21
	.word 0xa950c000  ! 979: RDPR_TT	<illegal instruction>
	.word 0x8195ba0e  ! 980: WRPR_TPC_I	wrpr	%r22, 0x1a0e, %tpc
	.word 0x81956d57  ! 981: WRPR_TPC_I	wrpr	%r21, 0x0d57, %tpc
	.word 0x87942505  ! 982: WRPR_TT_I	wrpr	%r16, 0x0505, %tt
	rd	%pcr, %g2
	wr	%g2, 0, %pcr
	mov	2, %r12
	.word 0x8f930000  ! 984: WRPR_TL_R	wrpr	%r12, %r0, %tl
	.word 0xa9440000  ! 985: RDASR	rd	%-, %r20
	.word 0x819465bc  ! 986: WRPR_TPC_I	wrpr	%r17, 0x05bc, %tpc
	.word 0xad8465bc  ! 987: WRASR_I	wr	%r17, 0x05bc, %softint
	.word 0x8594fb8a  ! 988: WRPR_TSTATE_I	wrpr	%r19, 0x1b8a, %tstate
	setx	0xcf69700d00004ecd, %g1, %r10
	.word 0x839a8000  ! 989: WRHPR_HTSTATE_R	wrhpr	%r10, %r0, %htstate
	.word 0xa7510000  ! 990: RDPR_TICK	rdpr	%tick, %r19
	.word 0x87947668  ! 991: WRPR_TT_I	wrpr	%r17, 0x1668, %tt
	.word 0xa5484000  ! 992: RDHPR_HTSTATE	rdhpr	%htstate, %r18
	.word 0x8d94b3c3  ! 993: WRPR_PSTATE_I	wrpr	%r18, 0x13c3, %pstate
	.word 0x8794e5aa  ! 994: WRPR_TT_I	wrpr	%r19, 0x05aa, %tt
	.word 0x8794b598  ! 995: WRPR_TT_I	wrpr	%r18, 0x1598, %tt
	.word 0xab84b598  ! 996: WRASR_I	wr	%r18, 0x1598, %clear_softint
	.word 0x8984b598  ! 997: WRASR_I	wr	%r18, 0x1598, %tick
	.word 0xab504000  ! 998: RDPR_TNPC	rdpr	%tnpc, %r21
	.data
data_start:

	.xword	0x5699d214be8e0438
	.xword	0x07372772cd180082
	.xword	0x06658e729cd8c8f2
	.xword	0xb6a6664dd2e6d303
	.xword	0x806b475ecf9f0ee7
	.xword	0xb4b4ea2f6de30d24
	.xword	0xff5685efe141b17e
	.xword	0xc206435c300da4f3
	.xword	0xcca224c3a6df0f3b
	.xword	0x9d1a237fff02c6ad
	.xword	0x5393e2cd167c8993
	.xword	0x4e06525e88fc83d5
	.xword	0x004a91057adf825c
	.xword	0x1ecab3284964b2c3
	.xword	0x2157b803fd65d4d8
	.xword	0x6f0a5d5954c9b5cd



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
