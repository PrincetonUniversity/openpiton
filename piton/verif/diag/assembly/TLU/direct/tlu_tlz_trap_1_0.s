// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tlu_tlz_trap_1_0.s
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
   random seed:	36987304
   Jal tlu_tlz_trap_1.j:	
********************************************************************************/



#define PCONTEXT	0x10
#define SCONTEXT	0x10

#define MAIN_PAGE_NUCLEUS_ALSO
#define MAIN_PAGE_HV_ALSO

#define ALL_MY_INTR_HANDLERS
#include "my_intr_handlers.s"
#include "my_trap_handlers.s"

#define H_HT0_Reserved_0x5f
#define My_HT0_Reserved_0x5f \
	rdhpr	%hpstate, %g7; \
	wrhpr	%g7, 1, %hpstate; \
	rdhpr	%htstate, %g7; \
	wrhpr	%g7, 1, %htstate; \
	mov	55, %r20; \
	done; \
	nop; \
	nop

#include "enable_traps.h"
#include "boot.s"

.text
.global main

main:

! Register init code

	setx 0xed83dcbb00001b28, %g1, %g0
	setx 0x8ca0d75900000cff, %g1, %g1
	setx 0x8cbb43c400008a2a, %g1, %g2
	setx 0x96927e58000078de, %g1, %g3
	setx 0x82fe9cca0000f809, %g1, %g4
	setx 0xc39049480000585f, %g1, %g5
	setx 0x72fcfd3500002e19, %g1, %g6
	setx 0x9a4588b400000daa, %g1, %g7
	setx 0x67ee320900002e5e, %g1, %r16
	setx 0x82e9f39d0000a93d, %g1, %r17
	setx 0x112acd100000fcde, %g1, %r18
	setx 0x54e6c2bd00006c47, %g1, %r19
	setx 0xa77cf4b400006930, %g1, %r20
	setx 0x77ae957b0000dd26, %g1, %r21
	setx 0x2e2eb0750000af68, %g1, %r22
	setx 0x81afc6d100002ec8, %g1, %r23
	setx 0x6788803d000078b8, %g1, %r24
	setx 0xe0bcec240000380e, %g1, %r25
	setx 0xc367ce020000d924, %g1, %r26
	setx 0x558fa37d00004f36, %g1, %r27
	setx 0xe2ec675f00000f6a, %g1, %r28
	setx 0x8d78a3ad00002ec8, %g1, %r29
	setx 0xd728892200009bff, %g1, %r30
	setx 0x9746d08f000059b5, %g1, %r31
	setx	data_start, %r1, %r25
	setx	0xc05, %r1, %r0
	setx	0xc05, %r1, %r31
	mov	0x1, %r23
	mov	0x2, %r24
	mov	0x3, %r25
	mov	0x0, %r26
	mov	0x1, %r27
	mov	0x2, %r28
	mov	0x3, %r29
	mov	0x0, %r30
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
	.word 0x8d956000  ! 2: WRPR_PSTATE_I	wrpr	%r21, 0x0000, %pstate
	.word 0x819fe000  ! 3: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0xa3856000  ! 4: WRASR_I	wr	%r21, 0x0000, %-
	.word 0xab856000  ! 5: WRASR_I	wr	%r21, 0x0000, %clear_softint
	ta	T_CHANGE_PRIV	! macro
	.word 0xad518000  ! 7: RDPR_PSTATE	<illegal instruction>
	.word 0x89856000  ! 8: WRASR_I	wr	%r21, 0x0000, %tick
	.word 0x879ca000  ! 9: WRHPR_HINTP_I	wrhpr	%r18, 0x0000, %hintp
	.word 0xad464000  ! 10: RDASR	rd	%-, %r22
	.word 0x819fe000  ! 11: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0xad440000  ! 12: RDASR	rd	%-, %r22
	.word 0x8984a000  ! 13: WRASR_I	wr	%r18, 0x0000, %tick
	.word 0xab84a000  ! 14: WRASR_I	wr	%r18, 0x0000, %clear_softint
	.word 0x8f95e000  ! 15: WRPR_TL_I	wrpr	%r23, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xad458000  ! 18: RDASR	rd	%softint, %r22
	.word 0xb184a000  ! 19: WRASR_I	wr	%r18, 0x0000, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0x819fe000  ! 21: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0xa148c000  ! 22: RDHPR_HINTP	rdhpr	%hintp, %r16
	.word 0x879ce000  ! 23: WRHPR_HINTP_I	wrhpr	%r19, 0x0000, %hintp
	ta	T_CHANGE_HPRIV	! macro
	.word 0xa3494000  ! 25: RDHPR_HTBA	rdhpr	%htba, %r17
	.word 0x8f97a000  ! 26: WRPR_TL_I	wrpr	%r30, 0x0000, %tl
	.word 0x8d942000  ! 27: WRPR_PSTATE_I	wrpr	%r16, 0x0000, %pstate
	.word 0xa3842000  ! 28: WRASR_I	wr	%r16, 0x0000, %-
	.word 0xab842000  ! 29: WRASR_I	wr	%r16, 0x0000, %clear_softint
	.word 0x91946000  ! 30: WRPR_PIL_I	wrpr	%r17, 0x0000, %pil
	.word 0xa3454000  ! 31: RDASR	rd	%clear_softint, %r17
	.word 0x8d956000  ! 32: WRPR_PSTATE_I	wrpr	%r21, 0x0000, %pstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa3856000  ! 34: WRASR_I	wr	%r21, 0x0000, %-
	ta	T_CHANGE_NONHPRIV	! macro
	ta	T_CHANGE_NONPRIV	! macro
	ta	T_CHANGE_HPRIV	! macro
hwintr_0_0:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_0), 16, 16)) -> intp(0, 0, 2)
	.word 0x01000000  ! 38: NOP	nop
	.word 0x91946000  ! 39: WRPR_PIL_I	wrpr	%r17, 0x0000, %pil
	.word 0x879d6000  ! 40: WRHPR_HINTP_I	wrhpr	%r21, 0x0000, %hintp
	.word 0x819fe000  ! 41: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8f97a000  ! 43: WRPR_TL_I	wrpr	%r30, 0x0000, %tl
	.word 0xa3440000  ! 44: RDASR	rd	%-, %r17
	.word 0x8d946000  ! 45: WRPR_PSTATE_I	wrpr	%r17, 0x0000, %pstate
	.word 0xab480000  ! 46: RDHPR_HPSTATE	rdhpr	%hpstate, %r21
	.word 0xa9504000  ! 48: RDPR_TNPC	<illegal instruction>
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xa9508000  ! 50: RDPR_TSTATE	<illegal instruction>
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x879ca000  ! 51: WRHPR_HINTP_I	wrhpr	%r18, 0x0000, %hintp
	ta	T_CHANGE_NONPRIV	! macro
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa984a000  ! 54: WRASR_I	wr	%r18, 0x0000, %set_softint
	.word 0xa384a000  ! 55: WRASR_I	wr	%r18, 0x0000, %-
	.word 0xa9444000  ! 56: RDASR	rd	%-, %r20
	.word 0xa948c000  ! 57: RDHPR_HINTP	rdhpr	%hintp, %r20
	.word 0xa5514000  ! 58: RDPR_TBA	<illegal instruction>
	.word 0xa5494000  ! 59: RDHPR_HTBA	rdhpr	%htba, %r18
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xab84a000  ! 61: WRASR_I	wr	%r18, 0x0000, %clear_softint
	.word 0xa1540000  ! 62: RDPR_GL	<illegal instruction>
	.word 0x8f97a000  ! 63: WRPR_TL_I	wrpr	%r30, 0x0000, %tl
	.word 0x91946000  ! 64: WRPR_PIL_I	wrpr	%r17, 0x0000, %pil
	.word 0xb1846000  ! 65: WRASR_I	wr	%r17, 0x0000, %-
	.word 0x839fe000  ! 67: WRHPR_HTSTATE_I	wrhpr	%r31, 0x0000, %htstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xad51c000  ! 68: RDPR_TL	<illegal instruction>
	.word 0x89846000  ! 69: WRASR_I	wr	%r17, 0x0000, %tick
	.word 0xab494000  ! 70: RDHPR_HTBA	rdhpr	%htba, %r21
	.word 0xab450000  ! 71: RDASR	rd	%set_softint, %r21
	ta	T_CHANGE_HPRIV	! macro
hwintr_0_1:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_1), 16, 16)) -> intp(0, 0, 2)
	.word 0x01000000  ! 73: NOP	nop
	ta	T_CHANGE_HPRIV	! macro
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91946000  ! 76: WRPR_PIL_I	wrpr	%r17, 0x0000, %pil
	.word 0x879ca000  ! 77: WRHPR_HINTP_I	wrhpr	%r18, 0x0000, %hintp
hwintr_0_2:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_2), 16, 16)) -> intp(0, 0, 2)
	.word 0x01000000  ! 78: NOP	nop
	.word 0x9194a000  ! 79: WRPR_PIL_I	wrpr	%r18, 0x0000, %pil
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xab45c000  ! 81: RDASR	rd	%-, %r21
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d946000  ! 83: WRPR_PSTATE_I	wrpr	%r17, 0x0000, %pstate
	.word 0x879ca000  ! 84: WRHPR_HINTP_I	wrhpr	%r18, 0x0000, %hintp
	.word 0xa751c000  ! 85: RDPR_TL	<illegal instruction>
	.word 0x91952000  ! 86: WRPR_PIL_I	wrpr	%r20, 0x0000, %pil
	ta	T_CHANGE_NONHPRIV	! macro
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8d94a000  ! 89: WRPR_PSTATE_I	wrpr	%r18, 0x0000, %pstate
	.word 0x819fe000  ! 90: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
hwintr_0_3:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_3), 16, 16)) -> intp(0, 0, 2)
	.word 0x01000000  ! 91: NOP	nop
	.word 0x89946000  ! 92: WRPR_TICK_I	wrpr	%r17, 0x0000, %tick
	.word 0x819fe000  ! 93: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa5520000  ! 95: RDPR_PIL	<illegal instruction>
	.word 0xa5450000  ! 96: RDASR	rd	%set_softint, %r18
	.word 0xa9494000  ! 97: RDHPR_HTBA	rdhpr	%htba, %r20
	.word 0x8f97a000  ! 98: WRPR_TL_I	wrpr	%r30, 0x0000, %tl
	.word 0x89846000  ! 99: WRASR_I	wr	%r17, 0x0000, %tick
	.word 0xa551c000  ! 100: RDPR_TL	<illegal instruction>
	.word 0xad494000  ! 101: RDHPR_HTBA	rdhpr	%htba, %r22
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x879ce000  ! 103: WRHPR_HINTP_I	wrhpr	%r19, 0x0000, %hintp
	.word 0xad518000  ! 104: RDPR_PSTATE	<illegal instruction>
	.word 0xa7518000  ! 105: RDPR_PSTATE	<illegal instruction>
	.word 0xab48c000  ! 106: RDHPR_HINTP	rdhpr	%hintp, %r21
	.word 0x8994a000  ! 107: WRPR_TICK_I	wrpr	%r18, 0x0000, %tick
	.word 0xa384a000  ! 108: WRASR_I	wr	%r18, 0x0000, %-
	.word 0xab45c000  ! 109: RDASR	rd	%-, %r21
	.word 0x8984a000  ! 110: WRASR_I	wr	%r18, 0x0000, %tick
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f97a000  ! 112: WRPR_TL_I	wrpr	%r30, 0x0000, %tl
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8984a000  ! 114: WRASR_I	wr	%r18, 0x0000, %tick
	.word 0xab51c000  ! 115: RDPR_TL	<illegal instruction>
	ta	T_CHANGE_NONPRIV	! macro
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8d95a000  ! 118: WRPR_PSTATE_I	wrpr	%r22, 0x0000, %pstate
	.word 0x879da000  ! 119: WRHPR_HINTP_I	wrhpr	%r22, 0x0000, %hintp
	.word 0xab45c000  ! 120: RDASR	rd	%-, %r21
	.word 0xab444000  ! 121: RDASR	rd	%-, %r21
	.word 0xa9484000  ! 122: RDHPR_HTSTATE	rdhpr	%htstate, %r20
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa9458000  ! 124: RDASR	rd	%softint, %r20
	.word 0xa985a000  ! 125: WRASR_I	wr	%r22, 0x0000, %set_softint
	.word 0xa945c000  ! 126: RDASR	rd	%-, %r20
	.word 0x879ca000  ! 127: WRHPR_HINTP_I	wrhpr	%r18, 0x0000, %hintp
	.word 0xa9440000  ! 128: RDASR	rd	%-, %r20
	.word 0xa7494000  ! 129: RDHPR_HTBA	rdhpr	%htba, %r19
	.word 0xa384a000  ! 130: WRASR_I	wr	%r18, 0x0000, %-
	.word 0xa7464000  ! 131: RDASR	rd	%-, %r19
	.word 0x8d94e000  ! 132: WRPR_PSTATE_I	wrpr	%r19, 0x0000, %pstate
	.word 0xad84e000  ! 133: WRASR_I	wr	%r19, 0x0000, %softint
	.word 0x879ca000  ! 134: WRHPR_HINTP_I	wrhpr	%r18, 0x0000, %hintp
	.word 0x91952000  ! 135: WRPR_PIL_I	wrpr	%r20, 0x0000, %pil
	.word 0x8d94e000  ! 136: WRPR_PSTATE_I	wrpr	%r19, 0x0000, %pstate
	.word 0x879d6000  ! 137: WRHPR_HINTP_I	wrhpr	%r21, 0x0000, %hintp
	ta	T_CHANGE_PRIV	! macro
	.word 0xa7464000  ! 139: RDASR	rd	%-, %r19
	ta	T_CHANGE_HPRIV	! macro
	.word 0x839fe000  ! 142: WRHPR_HTSTATE_I	wrhpr	%r31, 0x0000, %htstate
	ta	T_CHANGE_TO_TL1	! macro
	.word 0xa7520000  ! 143: RDPR_PIL	<illegal instruction>
	.word 0x8f96e000  ! 144: WRPR_TL_I	wrpr	%r27, 0x0000, %tl
	.word 0xa351c000  ! 145: RDPR_TL	<illegal instruction>
	.word 0xad48c000  ! 146: RDHPR_HINTP	rdhpr	%hintp, %r22
	ta	T_CHANGE_NONPRIV	! macro
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xab856000  ! 149: WRASR_I	wr	%r21, 0x0000, %clear_softint
	.word 0x879d2000  ! 150: WRHPR_HINTP_I	wrhpr	%r20, 0x0000, %hintp
	.word 0xad450000  ! 151: RDASR	rd	%set_softint, %r22
	.word 0x91952000  ! 152: WRPR_PIL_I	wrpr	%r20, 0x0000, %pil
	.word 0xad464000  ! 153: RDASR	rd	%-, %r22
	.word 0x879ce000  ! 154: WRHPR_HINTP_I	wrhpr	%r19, 0x0000, %hintp
hwintr_0_4:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_4), 16, 16)) -> intp(0, 0, 2)
	.word 0x01000000  ! 155: NOP	nop
	.word 0x85952000  ! 157: WRPR_TSTATE_I	wrpr	%r20, 0x0000, %tstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xad852000  ! 158: WRASR_I	wr	%r20, 0x0000, %softint
	.word 0xab518000  ! 159: RDPR_PSTATE	<illegal instruction>
	.word 0x91956000  ! 160: WRPR_PIL_I	wrpr	%r21, 0x0000, %pil
	.word 0xa1514000  ! 161: RDPR_TBA	<illegal instruction>
	.word 0xa351c000  ! 162: RDPR_TL	<illegal instruction>
	.word 0xa9480000  ! 163: RDHPR_HPSTATE	rdhpr	%hpstate, %r20
	ta	T_CHANGE_NONHPRIV	! macro
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x819fe000  ! 166: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0xa3500000  ! 168: RDPR_TPC	<illegal instruction>
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x8994a000  ! 169: WRPR_TICK_I	wrpr	%r18, 0x0000, %tick
	.word 0xa7494000  ! 170: RDHPR_HTBA	rdhpr	%htba, %r19
	.word 0xa3540000  ! 171: RDPR_GL	<illegal instruction>
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8d952000  ! 173: WRPR_PSTATE_I	wrpr	%r20, 0x0000, %pstate
	.word 0xa3440000  ! 174: RDASR	rd	%-, %r17
	.word 0xa5518000  ! 175: RDPR_PSTATE	<illegal instruction>
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa5520000  ! 177: RDPR_PIL	<illegal instruction>
	.word 0xa7518000  ! 178: RDPR_PSTATE	<illegal instruction>
	.word 0xab518000  ! 179: RDPR_PSTATE	<illegal instruction>
	.word 0xb1852000  ! 180: WRASR_I	wr	%r20, 0x0000, %-
	.word 0x879d2000  ! 181: WRHPR_HINTP_I	wrhpr	%r20, 0x0000, %hintp
	.word 0xa948c000  ! 182: RDHPR_HINTP	rdhpr	%hintp, %r20
	.word 0x8f97a000  ! 183: WRPR_TL_I	wrpr	%r30, 0x0000, %tl
	.word 0xa9440000  ! 184: RDASR	rd	%-, %r20
	.word 0xa9458000  ! 185: RDASR	rd	%softint, %r20
	.word 0xa9450000  ! 186: RDASR	rd	%set_softint, %r20
hwintr_0_5:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_5), 16, 16)) -> intp(0, 0, 2)
	.word 0x01000000  ! 187: NOP	nop
	.word 0xad484000  ! 188: RDHPR_HTSTATE	rdhpr	%htstate, %r22
	.word 0x879ca000  ! 189: WRHPR_HINTP_I	wrhpr	%r18, 0x0000, %hintp
	.word 0xad440000  ! 190: RDASR	rd	%-, %r22
	.word 0xa9484000  ! 191: RDHPR_HTSTATE	rdhpr	%htstate, %r20
	.word 0xa951c000  ! 192: RDPR_TL	<illegal instruction>
	.word 0xab518000  ! 193: RDPR_PSTATE	<illegal instruction>
	.word 0xad480000  ! 194: RDHPR_HPSTATE	rdhpr	%hpstate, %r22
	.word 0xa984a000  ! 195: WRASR_I	wr	%r18, 0x0000, %set_softint
	.word 0xad51c000  ! 196: RDPR_TL	<illegal instruction>
	.word 0xa984a000  ! 197: WRASR_I	wr	%r18, 0x0000, %set_softint
	.word 0xad458000  ! 198: RDASR	rd	%softint, %r22
	.word 0xa148c000  ! 199: RDHPR_HINTP	rdhpr	%hintp, %r16
	.word 0x819fe000  ! 200: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0xad540000  ! 201: RDPR_GL	<illegal instruction>
	ta	T_CHANGE_PRIV	! macro
	.word 0xa384a000  ! 203: WRASR_I	wr	%r18, 0x0000, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0x879ce000  ! 205: WRHPR_HINTP_I	wrhpr	%r19, 0x0000, %hintp
	.word 0x8995a000  ! 206: WRPR_TICK_I	wrpr	%r22, 0x0000, %tick
	.word 0x8985a000  ! 207: WRASR_I	wr	%r22, 0x0000, %tick
	.word 0x91956000  ! 208: WRPR_PIL_I	wrpr	%r21, 0x0000, %pil
	ta	T_CHANGE_HPRIV	! macro
	.word 0x819fe000  ! 210: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0x819fe000  ! 211: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0xab856000  ! 213: WRASR_I	wr	%r21, 0x0000, %clear_softint
	.word 0x9195a000  ! 214: WRPR_PIL_I	wrpr	%r22, 0x0000, %pil
	.word 0xa3518000  ! 215: RDPR_PSTATE	<illegal instruction>
	.word 0x879c2000  ! 216: WRHPR_HINTP_I	wrhpr	%r16, 0x0000, %hintp
	.word 0x8d952000  ! 217: WRPR_PSTATE_I	wrpr	%r20, 0x0000, %pstate
	.word 0xab852000  ! 218: WRASR_I	wr	%r20, 0x0000, %clear_softint
	.word 0x8d956000  ! 219: WRPR_PSTATE_I	wrpr	%r21, 0x0000, %pstate
	.word 0xb1856000  ! 220: WRASR_I	wr	%r21, 0x0000, %-
	.word 0x879d6000  ! 221: WRHPR_HINTP_I	wrhpr	%r21, 0x0000, %hintp
	.word 0xa9540000  ! 222: RDPR_GL	<illegal instruction>
	.word 0xa9540000  ! 223: RDPR_GL	<illegal instruction>
	.word 0xa9450000  ! 224: RDASR	rd	%set_softint, %r20
	.word 0x819fe000  ! 225: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0xa5514000  ! 226: RDPR_TBA	<illegal instruction>
	.word 0x819fe000  ! 227: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0xa5440000  ! 228: RDASR	rd	%-, %r18
	.word 0xa351c000  ! 229: RDPR_TL	<illegal instruction>
	.word 0x819fe000  ! 230: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0xa3480000  ! 231: RDHPR_HPSTATE	rdhpr	%hpstate, %r17
	.word 0xab856000  ! 232: WRASR_I	wr	%r21, 0x0000, %clear_softint
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa3454000  ! 234: RDASR	rd	%clear_softint, %r17
	.word 0xab540000  ! 235: RDPR_GL	<illegal instruction>
	.word 0xa5540000  ! 236: RDPR_GL	<illegal instruction>
	.word 0x83952000  ! 238: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xa5440000  ! 239: RDASR	rd	%-, %r18
	.word 0x8995a000  ! 240: WRPR_TICK_I	wrpr	%r22, 0x0000, %tick
	.word 0xa5454000  ! 241: RDASR	rd	%clear_softint, %r18
	.word 0x8d94e000  ! 242: WRPR_PSTATE_I	wrpr	%r19, 0x0000, %pstate
	.word 0xa384e000  ! 243: WRASR_I	wr	%r19, 0x0000, %-
	.word 0x819fe000  ! 244: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
hwintr_0_6:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_6), 16, 16)) -> intp(0, 0, 2)
	.word 0x01000000  ! 245: NOP	nop
	.word 0xa384e000  ! 246: WRASR_I	wr	%r19, 0x0000, %-
	.word 0xa3480000  ! 247: RDHPR_HPSTATE	rdhpr	%hpstate, %r17
	.word 0xa3520000  ! 248: RDPR_PIL	<illegal instruction>
	.word 0x819fe000  ! 249: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0x9194e000  ! 250: WRPR_PIL_I	wrpr	%r19, 0x0000, %pil
	.word 0xa1518000  ! 251: RDPR_PSTATE	<illegal instruction>
	.word 0xa1454000  ! 252: RDASR	rd	%clear_softint, %r16
	.word 0xa1454000  ! 253: RDASR	rd	%clear_softint, %r16
	ta	T_CHANGE_PRIV	! macro
	.word 0xad504000  ! 256: RDPR_TNPC	<illegal instruction>
	ta	T_CHANGE_TO_TL1	! macro
	.word 0xad450000  ! 257: RDASR	rd	%set_softint, %r22
	.word 0x83956000  ! 259: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xa7494000  ! 260: RDHPR_HTBA	rdhpr	%htba, %r19
	.word 0x8f97a000  ! 261: WRPR_TL_I	wrpr	%r30, 0x0000, %tl
	.word 0x8d942000  ! 262: WRPR_PSTATE_I	wrpr	%r16, 0x0000, %pstate
	.word 0xa5508000  ! 264: RDPR_TSTATE	<illegal instruction>
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8f97a000  ! 265: WRPR_TL_I	wrpr	%r30, 0x0000, %tl
	.word 0xa5464000  ! 266: RDASR	rd	%-, %r18
	.word 0xab500000  ! 268: RDPR_TPC	<illegal instruction>
	ta	T_CHANGE_TO_TL0	! macro
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xad520000  ! 270: RDPR_PIL	<illegal instruction>
	.word 0xad458000  ! 271: RDASR	rd	%softint, %r22
	.word 0x91952000  ! 272: WRPR_PIL_I	wrpr	%r20, 0x0000, %pil
	.word 0xad514000  ! 273: RDPR_TBA	<illegal instruction>
	.word 0xa7484000  ! 274: RDHPR_HTSTATE	rdhpr	%htstate, %r19
	.word 0xa548c000  ! 275: RDHPR_HINTP	rdhpr	%hintp, %r18
	ta	T_CHANGE_HPRIV	! macro
	.word 0x819fe000  ! 277: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0xa5464000  ! 278: RDASR	rd	%-, %r18
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x879d6000  ! 280: WRHPR_HINTP_I	wrhpr	%r21, 0x0000, %hintp
	ta	T_CHANGE_HPRIV	! macro
	.word 0xa5450000  ! 282: RDASR	rd	%set_softint, %r18
	.word 0x879da000  ! 283: WRHPR_HINTP_I	wrhpr	%r22, 0x0000, %hintp
	.word 0xab85a000  ! 284: WRASR_I	wr	%r22, 0x0000, %clear_softint
	.word 0xa948c000  ! 285: RDHPR_HINTP	rdhpr	%hintp, %r20
	.word 0x8f962000  ! 286: WRPR_TL_I	wrpr	%r24, 0x0000, %tl
	.word 0x9194e000  ! 287: WRPR_PIL_I	wrpr	%r19, 0x0000, %pil
	.word 0xa9450000  ! 288: RDASR	rd	%set_softint, %r20
	.word 0xa384e000  ! 289: WRASR_I	wr	%r19, 0x0000, %-
	ta	T_CHANGE_HPRIV	! macro
	.word 0x819fe000  ! 291: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0xa5518000  ! 292: RDPR_PSTATE	<illegal instruction>
	ta	T_CHANGE_NONPRIV	! macro
	ta	T_CHANGE_PRIV	! macro
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x819fe000  ! 296: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0xa748c000  ! 297: RDHPR_HINTP	rdhpr	%hintp, %r19
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa1518000  ! 299: RDPR_PSTATE	<illegal instruction>
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8984e000  ! 301: WRASR_I	wr	%r19, 0x0000, %tick
	.word 0xa5484000  ! 302: RDHPR_HTSTATE	rdhpr	%htstate, %r18
	.word 0xa9520000  ! 303: RDPR_PIL	<illegal instruction>
	.word 0x879ca000  ! 304: WRHPR_HINTP_I	wrhpr	%r18, 0x0000, %hintp
	.word 0xa9514000  ! 305: RDPR_TBA	<illegal instruction>
	.word 0x8984a000  ! 306: WRASR_I	wr	%r18, 0x0000, %tick
	.word 0xa9458000  ! 307: RDASR	rd	%softint, %r20
	.word 0xa148c000  ! 308: RDHPR_HINTP	rdhpr	%hintp, %r16
	.word 0xa145c000  ! 309: RDASR	rd	%-, %r16
	.word 0x879c6000  ! 310: WRHPR_HINTP_I	wrhpr	%r17, 0x0000, %hintp
	.word 0xa3846000  ! 311: WRASR_I	wr	%r17, 0x0000, %-
	.word 0xa1458000  ! 312: RDASR	rd	%softint, %r16
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1464000  ! 314: RDASR	rd	%-, %r16
	.word 0x819fe000  ! 315: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0x89942000  ! 316: WRPR_TICK_I	wrpr	%r16, 0x0000, %tick
hwintr_0_7:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_7), 16, 16)) -> intp(0, 0, 2)
	.word 0x01000000  ! 317: NOP	nop
	.word 0xa1484000  ! 318: RDHPR_HTSTATE	rdhpr	%htstate, %r16
	.word 0xa1444000  ! 319: RDASR	rd	%-, %r16
	.word 0x89842000  ! 320: WRASR_I	wr	%r16, 0x0000, %tick
	.word 0xa548c000  ! 321: RDHPR_HINTP	rdhpr	%hintp, %r18
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x83956000  ! 324: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x819fe000  ! 325: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0xa5444000  ! 326: RDASR	rd	%-, %r18
	.word 0xab51c000  ! 327: RDPR_TL	<illegal instruction>
	.word 0xa9856000  ! 328: WRASR_I	wr	%r21, 0x0000, %set_softint
	.word 0x879d6000  ! 329: WRHPR_HINTP_I	wrhpr	%r21, 0x0000, %hintp
	.word 0xa9520000  ! 330: RDPR_PIL	<illegal instruction>
	.word 0xa9464000  ! 331: RDASR	rd	%-, %r20
	.word 0xa9856000  ! 332: WRASR_I	wr	%r21, 0x0000, %set_softint
	.word 0xa9440000  ! 333: RDASR	rd	%-, %r20
	ta	T_CHANGE_NONPRIV	! macro
hwintr_0_8:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_8), 16, 16)) -> intp(0, 0, 2)
	.word 0x01000000  ! 335: NOP	nop
	.word 0xa945c000  ! 336: RDASR	rd	%-, %r20
	.word 0xa9454000  ! 337: RDASR	rd	%clear_softint, %r20
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa751c000  ! 339: RDPR_TL	<illegal instruction>
	.word 0x8594e000  ! 341: WRPR_TSTATE_I	wrpr	%r19, 0x0000, %tstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xa7440000  ! 342: RDASR	rd	%-, %r19
	ta	T_CHANGE_HPRIV	! macro
	.word 0xa7464000  ! 344: RDASR	rd	%-, %r19
	.word 0x8994e000  ! 345: WRPR_TICK_I	wrpr	%r19, 0x0000, %tick
	.word 0xa5520000  ! 346: RDPR_PIL	<illegal instruction>
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa3484000  ! 348: RDHPR_HTSTATE	rdhpr	%htstate, %r17
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa948c000  ! 350: RDHPR_HINTP	rdhpr	%hintp, %r20
	ta	T_CHANGE_HPRIV	! macro
	ta	T_CHANGE_NONPRIV	! macro
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa9440000  ! 354: RDASR	rd	%-, %r20
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa5494000  ! 356: RDHPR_HTBA	rdhpr	%htba, %r18
	.word 0xa9480000  ! 357: RDHPR_HPSTATE	rdhpr	%hpstate, %r20
	ta	T_CHANGE_NONPRIV	! macro
	ta	T_CHANGE_NONPRIV	! macro
	ta	T_CHANGE_HPRIV	! macro
	.word 0xab514000  ! 361: RDPR_TBA	<illegal instruction>
	.word 0x879d2000  ! 362: WRHPR_HINTP_I	wrhpr	%r20, 0x0000, %hintp
	.word 0xa9852000  ! 363: WRASR_I	wr	%r20, 0x0000, %set_softint
	.word 0x89942000  ! 364: WRPR_TICK_I	wrpr	%r16, 0x0000, %tick
	.word 0xa9484000  ! 365: RDHPR_HTSTATE	rdhpr	%htstate, %r20
	.word 0xa1484000  ! 366: RDHPR_HTSTATE	rdhpr	%htstate, %r16
hwintr_0_9:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_9), 16, 16)) -> intp(0, 0, 2)
	.word 0x01000000  ! 367: NOP	nop
	.word 0xa1444000  ! 368: RDASR	rd	%-, %r16
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa9842000  ! 370: WRASR_I	wr	%r16, 0x0000, %set_softint
	.word 0x8f96a000  ! 371: WRPR_TL_I	wrpr	%r26, 0x0000, %tl
	ta	T_CHANGE_PRIV	! macro
	.word 0x9194e000  ! 373: WRPR_PIL_I	wrpr	%r19, 0x0000, %pil
	.word 0xab84e000  ! 374: WRASR_I	wr	%r19, 0x0000, %clear_softint
	ta	T_CHANGE_NONPRIV	! macro
	ta	T_CHANGE_PRIV	! macro
	.word 0x879d2000  ! 377: WRHPR_HINTP_I	wrhpr	%r20, 0x0000, %hintp
	.word 0xa1444000  ! 378: RDASR	rd	%-, %r16
	.word 0xab480000  ! 379: RDHPR_HPSTATE	rdhpr	%hpstate, %r21
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa1494000  ! 381: RDHPR_HTBA	rdhpr	%htba, %r16
	.word 0xa145c000  ! 382: RDASR	rd	%-, %r16
	.word 0x819fe000  ! 383: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0xa9852000  ! 384: WRASR_I	wr	%r20, 0x0000, %set_softint
	ta	T_CHANGE_HPRIV	! macro
	.word 0x879c2000  ! 386: WRHPR_HINTP_I	wrhpr	%r16, 0x0000, %hintp
	.word 0xab540000  ! 387: RDPR_GL	<illegal instruction>
	.word 0x8d952000  ! 388: WRPR_PSTATE_I	wrpr	%r20, 0x0000, %pstate
	.word 0xab458000  ! 389: RDASR	rd	%softint, %r21
	.word 0xad852000  ! 390: WRASR_I	wr	%r20, 0x0000, %softint
	.word 0x819fe000  ! 391: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0xab852000  ! 392: WRASR_I	wr	%r20, 0x0000, %clear_softint
	.word 0xa9520000  ! 393: RDPR_PIL	<illegal instruction>
	.word 0xa9852000  ! 394: WRASR_I	wr	%r20, 0x0000, %set_softint
	.word 0x819fe000  ! 395: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x879c2000  ! 397: WRHPR_HINTP_I	wrhpr	%r16, 0x0000, %hintp
	.word 0xa9480000  ! 398: RDHPR_HPSTATE	rdhpr	%hpstate, %r20
	.word 0x8994e000  ! 399: WRPR_TICK_I	wrpr	%r19, 0x0000, %tick
	.word 0xa9450000  ! 400: RDASR	rd	%set_softint, %r20
hwintr_0_10:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_10), 16, 16)) -> intp(0, 0, 2)
	.word 0x01000000  ! 401: NOP	nop
	.word 0xa9454000  ! 402: RDASR	rd	%clear_softint, %r20
	.word 0xa3520000  ! 403: RDPR_PIL	<illegal instruction>
	.word 0xab540000  ! 404: RDPR_GL	<illegal instruction>
	.word 0x8d952000  ! 405: WRPR_PSTATE_I	wrpr	%r20, 0x0000, %pstate
hwintr_0_11:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_11), 16, 16)) -> intp(0, 0, 2)
	.word 0x01000000  ! 406: NOP	nop
	.word 0xab458000  ! 407: RDASR	rd	%softint, %r21
	.word 0xab440000  ! 408: RDASR	rd	%-, %r21
	.word 0x819fe000  ! 409: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0x89852000  ! 410: WRASR_I	wr	%r20, 0x0000, %tick
	.word 0xab454000  ! 411: RDASR	rd	%clear_softint, %r21
	.word 0xa9484000  ! 412: RDHPR_HTSTATE	rdhpr	%htstate, %r20
	.word 0xa348c000  ! 413: RDHPR_HINTP	rdhpr	%hintp, %r17
	ta	T_CHANGE_PRIV	! macro
	.word 0xab480000  ! 415: RDHPR_HPSTATE	rdhpr	%hpstate, %r21
	ta	T_CHANGE_PRIV	! macro
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x879d6000  ! 418: WRHPR_HINTP_I	wrhpr	%r21, 0x0000, %hintp
	.word 0x8f97a000  ! 419: WRPR_TL_I	wrpr	%r30, 0x0000, %tl
	.word 0x89856000  ! 420: WRASR_I	wr	%r21, 0x0000, %tick
	ta	T_CHANGE_NONHPRIV	! macro
	ta	T_CHANGE_PRIV	! macro
	.word 0x87956000  ! 424: WRPR_TT_I	wrpr	%r21, 0x0000, %tt
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xa1494000  ! 425: RDHPR_HTBA	rdhpr	%htba, %r16
	.word 0x89856000  ! 426: WRASR_I	wr	%r21, 0x0000, %tick
	.word 0xa145c000  ! 427: RDASR	rd	%-, %r16
	.word 0x879d6000  ! 428: WRHPR_HINTP_I	wrhpr	%r21, 0x0000, %hintp
	.word 0xad518000  ! 429: RDPR_PSTATE	<illegal instruction>
	.word 0xa7520000  ! 430: RDPR_PIL	<illegal instruction>
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1514000  ! 432: RDPR_TBA	<illegal instruction>
hwintr_0_12:
!$EV trig_pc_d(0,expr(@VA(.MAIN.hwintr_0_12), 16, 16)) -> intp(0, 0, 2)
	.word 0x01000000  ! 433: NOP	nop
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9194e000  ! 435: WRPR_PIL_I	wrpr	%r19, 0x0000, %pil
	.word 0x89942000  ! 436: WRPR_TICK_I	wrpr	%r16, 0x0000, %tick
	.word 0x91952000  ! 437: WRPR_PIL_I	wrpr	%r20, 0x0000, %pil
	.word 0xab518000  ! 438: RDPR_PSTATE	<illegal instruction>
	.word 0x879c6000  ! 439: WRHPR_HINTP_I	wrhpr	%r17, 0x0000, %hintp
	.word 0x819fe000  ! 440: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0xab458000  ! 441: RDASR	rd	%softint, %r21
	.word 0xad846000  ! 442: WRASR_I	wr	%r17, 0x0000, %softint
	.word 0xab440000  ! 443: RDASR	rd	%-, %r21
	.word 0xa7484000  ! 444: RDHPR_HTSTATE	rdhpr	%htstate, %r19
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x819fe000  ! 446: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0xa1480000  ! 447: RDHPR_HPSTATE	rdhpr	%hpstate, %r16
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xab520000  ! 449: RDPR_PIL	<illegal instruction>
	.word 0xa9846000  ! 450: WRASR_I	wr	%r17, 0x0000, %set_softint
	.word 0x819fe000  ! 451: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0xa9846000  ! 452: WRASR_I	wr	%r17, 0x0000, %set_softint
	.word 0xab444000  ! 453: RDASR	rd	%-, %r21
	.word 0xa3520000  ! 454: RDPR_PIL	<illegal instruction>
	.word 0x8d94a000  ! 455: WRPR_PSTATE_I	wrpr	%r18, 0x0000, %pstate
	.word 0xa9520000  ! 456: RDPR_PIL	<illegal instruction>
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa9450000  ! 458: RDASR	rd	%set_softint, %r20
	.word 0x8d956000  ! 459: WRPR_PSTATE_I	wrpr	%r21, 0x0000, %pstate
	.word 0x8f962000  ! 460: WRPR_TL_I	wrpr	%r24, 0x0000, %tl
	.word 0xa3856000  ! 461: WRASR_I	wr	%r21, 0x0000, %-
	.word 0xa9450000  ! 462: RDASR	rd	%set_softint, %r20
	ta	T_CHANGE_NONPRIV	! macro
	ta	T_CHANGE_HPRIV	! macro
	.word 0xa3514000  ! 465: RDPR_TBA	<illegal instruction>
	.word 0xa9484000  ! 466: RDHPR_HTSTATE	rdhpr	%htstate, %r20
	.word 0x879c2000  ! 467: WRHPR_HINTP_I	wrhpr	%r16, 0x0000, %hintp
	.word 0x8f97a000  ! 468: WRPR_TL_I	wrpr	%r30, 0x0000, %tl
	.word 0x8994a000  ! 469: WRPR_TICK_I	wrpr	%r18, 0x0000, %tick
	.word 0xa1518000  ! 470: RDPR_PSTATE	<illegal instruction>
	.word 0xad540000  ! 471: RDPR_GL	<illegal instruction>
	.word 0xa3514000  ! 472: RDPR_TBA	<illegal instruction>
	.word 0xad494000  ! 473: RDHPR_HTBA	rdhpr	%htba, %r22
	.word 0x8f97a000  ! 474: WRPR_TL_I	wrpr	%r30, 0x0000, %tl
	.word 0x819fe000  ! 475: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0x839fe000  ! 477: WRHPR_HTSTATE_I	wrhpr	%r31, 0x0000, %htstate
	ta	T_CHANGE_TO_TL0	! macro
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f97a000  ! 479: WRPR_TL_I	wrpr	%r30, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91952000  ! 481: WRPR_PIL_I	wrpr	%r20, 0x0000, %pil
	.word 0xa3852000  ! 482: WRASR_I	wr	%r20, 0x0000, %-
	.word 0xa950c000  ! 484: RDPR_TT	<illegal instruction>
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x879c6000  ! 485: WRHPR_HINTP_I	wrhpr	%r17, 0x0000, %hintp
	.word 0xab480000  ! 486: RDHPR_HPSTATE	rdhpr	%hpstate, %r21
	ta	T_CHANGE_PRIV	! macro
	.word 0xab458000  ! 488: RDASR	rd	%softint, %r21
	.word 0xa3846000  ! 489: WRASR_I	wr	%r17, 0x0000, %-
	.word 0x819fe000  ! 490: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0xa9508000  ! 492: RDPR_TSTATE	<illegal instruction>
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xab504000  ! 494: RDPR_TNPC	<illegal instruction>
	ta	T_CHANGE_TO_TL1	! macro
	ta	T_CHANGE_PRIV	! macro
	.word 0xad494000  ! 496: RDHPR_HTBA	rdhpr	%htba, %r22
	.word 0x8994e000  ! 497: WRPR_TICK_I	wrpr	%r19, 0x0000, %tick
	.word 0x879d2000  ! 498: WRHPR_HINTP_I	wrhpr	%r20, 0x0000, %hintp
	.word 0xad454000  ! 499: RDASR	rd	%clear_softint, %r22
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_3:
	.word 0x8d956000  ! 2: WRPR_PSTATE_I	wrpr	%r21, 0x0000, %pstate
	.word 0x819fe000  ! 3: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0x89856000  ! 4: WRASR_I	wr	%r21, 0x0000, %tick
	.word 0xb1856000  ! 5: WRASR_I	wr	%r21, 0x0000, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa3518000  ! 7: RDPR_PSTATE	<illegal instruction>
	.word 0xad856000  ! 8: WRASR_I	wr	%r21, 0x0000, %softint
	.word 0x879ca000  ! 9: WRHPR_HINTP_I	wrhpr	%r18, 0x0000, %hintp
	.word 0xad450000  ! 10: RDASR	rd	%set_softint, %r22
	.word 0x819fe000  ! 11: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0xad464000  ! 12: RDASR	rd	%-, %r22
	.word 0xb184a000  ! 13: WRASR_I	wr	%r18, 0x0000, %-
	.word 0xa984a000  ! 14: WRASR_I	wr	%r18, 0x0000, %set_softint
	.word 0x8f97a000  ! 15: WRPR_TL_I	wrpr	%r30, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xad454000  ! 18: RDASR	rd	%clear_softint, %r22
	.word 0xab84a000  ! 19: WRASR_I	wr	%r18, 0x0000, %clear_softint
	ta	T_CHANGE_PRIV	! macro
	.word 0x819fe000  ! 21: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0xa348c000  ! 22: RDHPR_HINTP	rdhpr	%hintp, %r17
	.word 0x879da000  ! 23: WRHPR_HINTP_I	wrhpr	%r22, 0x0000, %hintp
	ta	T_CHANGE_HPRIV	! macro
	.word 0xa9494000  ! 25: RDHPR_HTBA	rdhpr	%htba, %r20
	.word 0x8f972000  ! 26: WRPR_TL_I	wrpr	%r28, 0x0000, %tl
	.word 0x8d946000  ! 27: WRPR_PSTATE_I	wrpr	%r17, 0x0000, %pstate
	.word 0x89842000  ! 28: WRASR_I	wr	%r16, 0x0000, %tick
	.word 0xb1842000  ! 29: WRASR_I	wr	%r16, 0x0000, %-
	.word 0x9194a000  ! 30: WRPR_PIL_I	wrpr	%r18, 0x0000, %pil
	.word 0xa3464000  ! 31: RDASR	rd	%-, %r17
	.word 0x8d952000  ! 32: WRPR_PSTATE_I	wrpr	%r20, 0x0000, %pstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xad856000  ! 34: WRASR_I	wr	%r21, 0x0000, %softint
	ta	T_CHANGE_NONHPRIV	! macro
	ta	T_CHANGE_NONPRIV	! macro
	ta	T_CHANGE_HPRIV	! macro
hwintr_3_0:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_0), 16, 16)) -> intp(3, 0, 2)
	.word 0x01000000  ! 38: NOP	nop
	.word 0x9194a000  ! 39: WRPR_PIL_I	wrpr	%r18, 0x0000, %pil
	.word 0x879ca000  ! 40: WRHPR_HINTP_I	wrhpr	%r18, 0x0000, %hintp
	.word 0x819fe000  ! 41: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8f962000  ! 43: WRPR_TL_I	wrpr	%r24, 0x0000, %tl
	.word 0xa3464000  ! 44: RDASR	rd	%-, %r17
	.word 0x8d956000  ! 45: WRPR_PSTATE_I	wrpr	%r21, 0x0000, %pstate
	.word 0xa7480000  ! 46: RDHPR_HPSTATE	rdhpr	%hpstate, %r19
	.word 0xad504000  ! 48: RDPR_TNPC	<illegal instruction>
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xa3508000  ! 50: RDPR_TSTATE	<illegal instruction>
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x879d6000  ! 51: WRHPR_HINTP_I	wrhpr	%r21, 0x0000, %hintp
	ta	T_CHANGE_NONPRIV	! macro
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xb184a000  ! 54: WRASR_I	wr	%r18, 0x0000, %-
	.word 0x8984a000  ! 55: WRASR_I	wr	%r18, 0x0000, %tick
	.word 0xa9444000  ! 56: RDASR	rd	%-, %r20
	.word 0xa148c000  ! 57: RDHPR_HINTP	rdhpr	%hintp, %r16
	.word 0xad514000  ! 58: RDPR_TBA	<illegal instruction>
	.word 0xa3494000  ! 59: RDHPR_HTBA	rdhpr	%htba, %r17
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa384a000  ! 61: WRASR_I	wr	%r18, 0x0000, %-
	.word 0xa7540000  ! 62: RDPR_GL	<illegal instruction>
	.word 0x8f972000  ! 63: WRPR_TL_I	wrpr	%r28, 0x0000, %tl
	.word 0x9194a000  ! 64: WRPR_PIL_I	wrpr	%r18, 0x0000, %pil
	.word 0x89846000  ! 65: WRASR_I	wr	%r17, 0x0000, %tick
	.word 0x839fe000  ! 67: WRHPR_HTSTATE_I	wrhpr	%r31, 0x0000, %htstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xa351c000  ! 68: RDPR_TL	rdpr	%tl, %r17
	.word 0xab846000  ! 69: WRASR_I	wr	%r17, 0x0000, %clear_softint
	.word 0xa1494000  ! 70: RDHPR_HTBA	rdhpr	%htba, %r16
	.word 0xab440000  ! 71: RDASR	rd	%-, %r21
	ta	T_CHANGE_HPRIV	! macro
hwintr_3_1:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_1), 16, 16)) -> intp(3, 0, 2)
	.word 0x01000000  ! 73: NOP	nop
	ta	T_CHANGE_HPRIV	! macro
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9194a000  ! 76: WRPR_PIL_I	wrpr	%r18, 0x0000, %pil
	.word 0x879c6000  ! 77: WRHPR_HINTP_I	wrhpr	%r17, 0x0000, %hintp
hwintr_3_2:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_2), 16, 16)) -> intp(3, 0, 2)
	.word 0x01000000  ! 78: NOP	nop
	.word 0x9194a000  ! 79: WRPR_PIL_I	wrpr	%r18, 0x0000, %pil
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xab454000  ! 81: RDASR	rd	%clear_softint, %r21
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d946000  ! 83: WRPR_PSTATE_I	wrpr	%r17, 0x0000, %pstate
	.word 0x879da000  ! 84: WRHPR_HINTP_I	wrhpr	%r22, 0x0000, %hintp
	.word 0xa551c000  ! 85: RDPR_TL	rdpr	%tl, %r18
	.word 0x91942000  ! 86: WRPR_PIL_I	wrpr	%r16, 0x0000, %pil
	ta	T_CHANGE_NONHPRIV	! macro
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8d94e000  ! 89: WRPR_PSTATE_I	wrpr	%r19, 0x0000, %pstate
	.word 0x819fe000  ! 90: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
hwintr_3_3:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_3), 16, 16)) -> intp(3, 0, 2)
	.word 0x01000000  ! 91: NOP	nop
	.word 0x8994e000  ! 92: WRPR_TICK_I	wrpr	%r19, 0x0000, %tick
	.word 0x819fe000  ! 93: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xab520000  ! 95: RDPR_PIL	rdpr	%pil, %r21
	.word 0xa5444000  ! 96: RDASR	rd	%-, %r18
	.word 0xa9494000  ! 97: RDHPR_HTBA	rdhpr	%htba, %r20
	.word 0x8f97a000  ! 98: WRPR_TL_I	wrpr	%r30, 0x0000, %tl
	.word 0x89846000  ! 99: WRASR_I	wr	%r17, 0x0000, %tick
	.word 0xa351c000  ! 100: RDPR_TL	rdpr	%tl, %r17
	.word 0xab494000  ! 101: RDHPR_HTBA	rdhpr	%htba, %r21
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x879c6000  ! 103: WRHPR_HINTP_I	wrhpr	%r17, 0x0000, %hintp
	.word 0xa5518000  ! 104: RDPR_PSTATE	rdpr	%pstate, %r18
	.word 0xa5518000  ! 105: RDPR_PSTATE	<illegal instruction>
	.word 0xa548c000  ! 106: RDHPR_HINTP	rdhpr	%hintp, %r18
	.word 0x89942000  ! 107: WRPR_TICK_I	wrpr	%r16, 0x0000, %tick
	.word 0x8984a000  ! 108: WRASR_I	wr	%r18, 0x0000, %tick
	.word 0xab440000  ! 109: RDASR	rd	%-, %r21
	.word 0xa984a000  ! 110: WRASR_I	wr	%r18, 0x0000, %set_softint
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f97a000  ! 112: WRPR_TL_I	wrpr	%r30, 0x0000, %tl
	ta	T_CHANGE_HPRIV	! macro
	.word 0xa984a000  ! 114: WRASR_I	wr	%r18, 0x0000, %set_softint
	.word 0xa551c000  ! 115: RDPR_TL	rdpr	%tl, %r18
	ta	T_CHANGE_NONPRIV	! macro
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8d94a000  ! 118: WRPR_PSTATE_I	wrpr	%r18, 0x0000, %pstate
	.word 0x879d2000  ! 119: WRHPR_HINTP_I	wrhpr	%r20, 0x0000, %hintp
	.word 0xab440000  ! 120: RDASR	rd	%-, %r21
	.word 0xab464000  ! 121: RDASR	rd	%-, %r21
	.word 0xa5484000  ! 122: RDHPR_HTSTATE	rdhpr	%htstate, %r18
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa9440000  ! 124: RDASR	rd	%-, %r20
	.word 0xad85a000  ! 125: WRASR_I	wr	%r22, 0x0000, %softint
	.word 0xa9454000  ! 126: RDASR	rd	%clear_softint, %r20
	.word 0x879d2000  ! 127: WRHPR_HINTP_I	wrhpr	%r20, 0x0000, %hintp
	.word 0xa9450000  ! 128: RDASR	rd	%set_softint, %r20
	.word 0xa3494000  ! 129: RDHPR_HTBA	rdhpr	%htba, %r17
	.word 0x8984a000  ! 130: WRASR_I	wr	%r18, 0x0000, %tick
	.word 0xa745c000  ! 131: RDASR	rd	%-, %r19
	.word 0x8d95a000  ! 132: WRPR_PSTATE_I	wrpr	%r22, 0x0000, %pstate
	.word 0x8984e000  ! 133: WRASR_I	wr	%r19, 0x0000, %tick
	.word 0x879da000  ! 134: WRHPR_HINTP_I	wrhpr	%r22, 0x0000, %hintp
	.word 0x9194a000  ! 135: WRPR_PIL_I	wrpr	%r18, 0x0000, %pil
	.word 0x8d95a000  ! 136: WRPR_PSTATE_I	wrpr	%r22, 0x0000, %pstate
	.word 0x879ce000  ! 137: WRHPR_HINTP_I	wrhpr	%r19, 0x0000, %hintp
	ta	T_CHANGE_PRIV	! macro
	.word 0xa7440000  ! 139: RDASR	rd	%-, %r19
	ta	T_CHANGE_HPRIV	! macro
	.word 0x839fe000  ! 142: WRHPR_HTSTATE_I	wrhpr	%r31, 0x0000, %htstate
	ta	T_CHANGE_TO_TL1	! macro
	.word 0xa3520000  ! 143: RDPR_PIL	rdpr	%pil, %r17
	.word 0x8f97a000  ! 144: WRPR_TL_I	wrpr	%r30, 0x0000, %tl
	.word 0xa751c000  ! 145: RDPR_TL	rdpr	%tl, %r19
	.word 0xa148c000  ! 146: RDHPR_HINTP	rdhpr	%hintp, %r16
	ta	T_CHANGE_NONPRIV	! macro
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xb1856000  ! 149: WRASR_I	wr	%r21, 0x0000, %-
	.word 0x879c2000  ! 150: WRHPR_HINTP_I	wrhpr	%r16, 0x0000, %hintp
	.word 0xad458000  ! 151: RDASR	rd	%softint, %r22
	.word 0x91956000  ! 152: WRPR_PIL_I	wrpr	%r21, 0x0000, %pil
	.word 0xad454000  ! 153: RDASR	rd	%clear_softint, %r22
	.word 0x879c6000  ! 154: WRHPR_HINTP_I	wrhpr	%r17, 0x0000, %hintp
hwintr_3_4:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_4), 16, 16)) -> intp(3, 0, 2)
	.word 0x01000000  ! 155: NOP	nop
	.word 0x8594e000  ! 157: WRPR_TSTATE_I	wrpr	%r19, 0x0000, %tstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xad852000  ! 158: WRASR_I	wr	%r20, 0x0000, %softint
	.word 0xa3518000  ! 159: RDPR_PSTATE	<illegal instruction>
	.word 0x9194a000  ! 160: WRPR_PIL_I	wrpr	%r18, 0x0000, %pil
	.word 0xa1514000  ! 161: RDPR_TBA	rdpr	%tba, %r16
	.word 0xad51c000  ! 162: RDPR_TL	<illegal instruction>
	.word 0xa1480000  ! 163: RDHPR_HPSTATE	rdhpr	%hpstate, %r16
	ta	T_CHANGE_NONHPRIV	! macro
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x819fe000  ! 166: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0xa3500000  ! 168: RDPR_TPC	rdpr	%tpc, %r17
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x89956000  ! 169: WRPR_TICK_I	wrpr	%r21, 0x0000, %tick
	.word 0xad494000  ! 170: RDHPR_HTBA	rdhpr	%htba, %r22
	.word 0xa1540000  ! 171: RDPR_GL	<illegal instruction>
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8d952000  ! 173: WRPR_PSTATE_I	wrpr	%r20, 0x0000, %pstate
	.word 0xa3440000  ! 174: RDASR	rd	%-, %r17
	.word 0xa7518000  ! 175: RDPR_PSTATE	rdpr	%pstate, %r19
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1520000  ! 177: RDPR_PIL	<illegal instruction>
	.word 0xab518000  ! 178: RDPR_PSTATE	<illegal instruction>
	.word 0xa7518000  ! 179: RDPR_PSTATE	<illegal instruction>
	.word 0xab852000  ! 180: WRASR_I	wr	%r20, 0x0000, %clear_softint
	.word 0x879d6000  ! 181: WRHPR_HINTP_I	wrhpr	%r21, 0x0000, %hintp
	.word 0xa548c000  ! 182: RDHPR_HINTP	rdhpr	%hintp, %r18
	.word 0x8f97a000  ! 183: WRPR_TL_I	wrpr	%r30, 0x0000, %tl
	.word 0xa9440000  ! 184: RDASR	rd	%-, %r20
	.word 0xa945c000  ! 185: RDASR	rd	%-, %r20
	.word 0xa945c000  ! 186: RDASR	rd	%-, %r20
hwintr_3_5:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_5), 16, 16)) -> intp(3, 0, 2)
	.word 0x01000000  ! 187: NOP	nop
	.word 0xad484000  ! 188: RDHPR_HTSTATE	rdhpr	%htstate, %r22
	.word 0x879d6000  ! 189: WRHPR_HINTP_I	wrhpr	%r21, 0x0000, %hintp
	.word 0xad454000  ! 190: RDASR	rd	%clear_softint, %r22
	.word 0xad484000  ! 191: RDHPR_HTSTATE	rdhpr	%htstate, %r22
	.word 0xad51c000  ! 192: RDPR_TL	<illegal instruction>
	.word 0xa3518000  ! 193: RDPR_PSTATE	<illegal instruction>
	.word 0xa7480000  ! 194: RDHPR_HPSTATE	rdhpr	%hpstate, %r19
	.word 0x8984a000  ! 195: WRASR_I	wr	%r18, 0x0000, %tick
	.word 0xa351c000  ! 196: RDPR_TL	<illegal instruction>
	.word 0xb184a000  ! 197: WRASR_I	wr	%r18, 0x0000, %-
	.word 0xad458000  ! 198: RDASR	rd	%softint, %r22
	.word 0xa548c000  ! 199: RDHPR_HINTP	rdhpr	%hintp, %r18
	.word 0x819fe000  ! 200: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0xa7540000  ! 201: RDPR_GL	rdpr	%-, %r19
	ta	T_CHANGE_PRIV	! macro
	.word 0xab84a000  ! 203: WRASR_I	wr	%r18, 0x0000, %clear_softint
	ta	T_CHANGE_PRIV	! macro
	.word 0x879ce000  ! 205: WRHPR_HINTP_I	wrhpr	%r19, 0x0000, %hintp
	.word 0x89942000  ! 206: WRPR_TICK_I	wrpr	%r16, 0x0000, %tick
	.word 0x8985a000  ! 207: WRASR_I	wr	%r22, 0x0000, %tick
	.word 0x9195a000  ! 208: WRPR_PIL_I	wrpr	%r22, 0x0000, %pil
	ta	T_CHANGE_HPRIV	! macro
	.word 0x819fe000  ! 210: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0x819fe000  ! 211: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0x89856000  ! 213: WRASR_I	wr	%r21, 0x0000, %tick
	.word 0x91952000  ! 214: WRPR_PIL_I	wrpr	%r20, 0x0000, %pil
	.word 0xa5518000  ! 215: RDPR_PSTATE	rdpr	%pstate, %r18
	.word 0x879c2000  ! 216: WRHPR_HINTP_I	wrhpr	%r16, 0x0000, %hintp
	.word 0x8d94a000  ! 217: WRPR_PSTATE_I	wrpr	%r18, 0x0000, %pstate
	.word 0xad852000  ! 218: WRASR_I	wr	%r20, 0x0000, %softint
	.word 0x8d94e000  ! 219: WRPR_PSTATE_I	wrpr	%r19, 0x0000, %pstate
	.word 0xad856000  ! 220: WRASR_I	wr	%r21, 0x0000, %softint
	.word 0x879c6000  ! 221: WRHPR_HINTP_I	wrhpr	%r17, 0x0000, %hintp
	.word 0xa7540000  ! 222: RDPR_GL	rdpr	%-, %r19
	.word 0xa5540000  ! 223: RDPR_GL	<illegal instruction>
	.word 0xa9458000  ! 224: RDASR	rd	%softint, %r20
	.word 0x819fe000  ! 225: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0xa5514000  ! 226: RDPR_TBA	rdpr	%tba, %r18
	.word 0x819fe000  ! 227: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0xa5450000  ! 228: RDASR	rd	%set_softint, %r18
	.word 0xa151c000  ! 229: RDPR_TL	rdpr	%tl, %r16
	.word 0x819fe000  ! 230: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0xab480000  ! 231: RDHPR_HPSTATE	rdhpr	%hpstate, %r21
	.word 0x89856000  ! 232: WRASR_I	wr	%r21, 0x0000, %tick
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa3440000  ! 234: RDASR	rd	%-, %r17
	.word 0xa7540000  ! 235: RDPR_GL	<illegal instruction>
	.word 0xa1540000  ! 236: RDPR_GL	<illegal instruction>
	.word 0x83956000  ! 238: WRPR_TNPC_I	wrpr	%r21, 0x0000, %tnpc
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xa5464000  ! 239: RDASR	rd	%-, %r18
	.word 0x89956000  ! 240: WRPR_TICK_I	wrpr	%r21, 0x0000, %tick
	.word 0xa5440000  ! 241: RDASR	rd	%-, %r18
	.word 0x8d952000  ! 242: WRPR_PSTATE_I	wrpr	%r20, 0x0000, %pstate
	.word 0x8984e000  ! 243: WRASR_I	wr	%r19, 0x0000, %tick
	.word 0x819fe000  ! 244: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
hwintr_3_6:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_6), 16, 16)) -> intp(3, 0, 2)
	.word 0x01000000  ! 245: NOP	nop
	.word 0xa984e000  ! 246: WRASR_I	wr	%r19, 0x0000, %set_softint
	.word 0xa3480000  ! 247: RDHPR_HPSTATE	rdhpr	%hpstate, %r17
	.word 0xa7520000  ! 248: RDPR_PIL	<illegal instruction>
	.word 0x819fe000  ! 249: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0x9195a000  ! 250: WRPR_PIL_I	wrpr	%r22, 0x0000, %pil
	.word 0xa9518000  ! 251: RDPR_PSTATE	rdpr	%pstate, %r20
	.word 0xa1444000  ! 252: RDASR	rd	%-, %r16
	.word 0xa1464000  ! 253: RDASR	rd	%-, %r16
	ta	T_CHANGE_PRIV	! macro
	.word 0xa3504000  ! 256: RDPR_TNPC	<illegal instruction>
	ta	T_CHANGE_TO_TL1	! macro
	.word 0xad45c000  ! 257: RDASR	rd	%-, %r22
	.word 0x83952000  ! 259: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xa5494000  ! 260: RDHPR_HTBA	rdhpr	%htba, %r18
	.word 0x8f97a000  ! 261: WRPR_TL_I	wrpr	%r30, 0x0000, %tl
	.word 0x8d952000  ! 262: WRPR_PSTATE_I	wrpr	%r20, 0x0000, %pstate
	.word 0xab508000  ! 264: RDPR_TSTATE	rdpr	%tstate, %r21
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8f97a000  ! 265: WRPR_TL_I	wrpr	%r30, 0x0000, %tl
	.word 0xa5458000  ! 266: RDASR	rd	%softint, %r18
	.word 0xab500000  ! 268: RDPR_TPC	rdpr	%tpc, %r21
	ta	T_CHANGE_TO_TL0	! macro
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa9520000  ! 270: RDPR_PIL	<illegal instruction>
	.word 0xad440000  ! 271: RDASR	rd	%-, %r22
	.word 0x91952000  ! 272: WRPR_PIL_I	wrpr	%r20, 0x0000, %pil
	.word 0xa1514000  ! 273: RDPR_TBA	rdpr	%tba, %r16
	.word 0xa5484000  ! 274: RDHPR_HTSTATE	rdhpr	%htstate, %r18
	.word 0xa548c000  ! 275: RDHPR_HINTP	rdhpr	%hintp, %r18
	ta	T_CHANGE_HPRIV	! macro
	.word 0x819fe000  ! 277: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0xa5440000  ! 278: RDASR	rd	%-, %r18
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x879c6000  ! 280: WRHPR_HINTP_I	wrhpr	%r17, 0x0000, %hintp
	ta	T_CHANGE_HPRIV	! macro
	.word 0xa5450000  ! 282: RDASR	rd	%set_softint, %r18
	.word 0x879ca000  ! 283: WRHPR_HINTP_I	wrhpr	%r18, 0x0000, %hintp
	.word 0x8985a000  ! 284: WRASR_I	wr	%r22, 0x0000, %tick
	.word 0xad48c000  ! 285: RDHPR_HINTP	rdhpr	%hintp, %r22
	.word 0x8f97a000  ! 286: WRPR_TL_I	wrpr	%r30, 0x0000, %tl
	.word 0x9194a000  ! 287: WRPR_PIL_I	wrpr	%r18, 0x0000, %pil
	.word 0xa9458000  ! 288: RDASR	rd	%softint, %r20
	.word 0xa984e000  ! 289: WRASR_I	wr	%r19, 0x0000, %set_softint
	ta	T_CHANGE_HPRIV	! macro
	.word 0x819fe000  ! 291: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0xa1518000  ! 292: RDPR_PSTATE	rdpr	%pstate, %r16
	ta	T_CHANGE_NONPRIV	! macro
	ta	T_CHANGE_PRIV	! macro
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x819fe000  ! 296: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0xab48c000  ! 297: RDHPR_HINTP	rdhpr	%hintp, %r21
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa7518000  ! 299: RDPR_PSTATE	<illegal instruction>
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xab84e000  ! 301: WRASR_I	wr	%r19, 0x0000, %clear_softint
	.word 0xad484000  ! 302: RDHPR_HTSTATE	rdhpr	%htstate, %r22
	.word 0xad520000  ! 303: RDPR_PIL	<illegal instruction>
	.word 0x879c2000  ! 304: WRHPR_HINTP_I	wrhpr	%r16, 0x0000, %hintp
	.word 0xad514000  ! 305: RDPR_TBA	rdpr	%tba, %r22
	.word 0x8984a000  ! 306: WRASR_I	wr	%r18, 0x0000, %tick
	.word 0xa9444000  ! 307: RDASR	rd	%-, %r20
	.word 0xa148c000  ! 308: RDHPR_HINTP	rdhpr	%hintp, %r16
	.word 0xa145c000  ! 309: RDASR	rd	%-, %r16
	.word 0x879c6000  ! 310: WRHPR_HINTP_I	wrhpr	%r17, 0x0000, %hintp
	.word 0xa3846000  ! 311: WRASR_I	wr	%r17, 0x0000, %-
	.word 0xa1440000  ! 312: RDASR	rd	%-, %r16
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1458000  ! 314: RDASR	rd	%softint, %r16
	.word 0x819fe000  ! 315: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0x8995a000  ! 316: WRPR_TICK_I	wrpr	%r22, 0x0000, %tick
hwintr_3_7:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_7), 16, 16)) -> intp(3, 0, 2)
	.word 0x01000000  ! 317: NOP	nop
	.word 0xa1484000  ! 318: RDHPR_HTSTATE	rdhpr	%htstate, %r16
	.word 0xa1464000  ! 319: RDASR	rd	%-, %r16
	.word 0xa9842000  ! 320: WRASR_I	wr	%r16, 0x0000, %set_softint
	.word 0xa548c000  ! 321: RDHPR_HINTP	rdhpr	%hintp, %r18
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x83952000  ! 324: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x819fe000  ! 325: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0xa5440000  ! 326: RDASR	rd	%-, %r18
	.word 0xa751c000  ! 327: RDPR_TL	rdpr	%tl, %r19
	.word 0xb1856000  ! 328: WRASR_I	wr	%r21, 0x0000, %-
	.word 0x879d2000  ! 329: WRHPR_HINTP_I	wrhpr	%r20, 0x0000, %hintp
	.word 0xab520000  ! 330: RDPR_PIL	rdpr	%pil, %r21
	.word 0xa9464000  ! 331: RDASR	rd	%-, %r20
	.word 0x89856000  ! 332: WRASR_I	wr	%r21, 0x0000, %tick
	.word 0xa9450000  ! 333: RDASR	rd	%set_softint, %r20
	ta	T_CHANGE_NONPRIV	! macro
hwintr_3_8:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_8), 16, 16)) -> intp(3, 0, 2)
	.word 0x01000000  ! 335: NOP	nop
	.word 0xa945c000  ! 336: RDASR	rd	%-, %r20
	.word 0xa9458000  ! 337: RDASR	rd	%softint, %r20
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa351c000  ! 339: RDPR_TL	<illegal instruction>
	.word 0x8594a000  ! 341: WRPR_TSTATE_I	wrpr	%r18, 0x0000, %tstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xa7464000  ! 342: RDASR	rd	%-, %r19
	ta	T_CHANGE_HPRIV	! macro
	.word 0xa7450000  ! 344: RDASR	rd	%set_softint, %r19
	.word 0x8994e000  ! 345: WRPR_TICK_I	wrpr	%r19, 0x0000, %tick
	.word 0xa1520000  ! 346: RDPR_PIL	rdpr	%pil, %r16
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xab484000  ! 348: RDHPR_HTSTATE	rdhpr	%htstate, %r21
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xad48c000  ! 350: RDHPR_HINTP	rdhpr	%hintp, %r22
	ta	T_CHANGE_HPRIV	! macro
	ta	T_CHANGE_NONPRIV	! macro
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa9440000  ! 354: RDASR	rd	%-, %r20
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xab494000  ! 356: RDHPR_HTBA	rdhpr	%htba, %r21
	.word 0xa9480000  ! 357: RDHPR_HPSTATE	rdhpr	%hpstate, %r20
	ta	T_CHANGE_NONPRIV	! macro
	ta	T_CHANGE_NONPRIV	! macro
	ta	T_CHANGE_HPRIV	! macro
	.word 0xa5514000  ! 361: RDPR_TBA	<illegal instruction>
	.word 0x879c6000  ! 362: WRHPR_HINTP_I	wrhpr	%r17, 0x0000, %hintp
	.word 0xad852000  ! 363: WRASR_I	wr	%r20, 0x0000, %softint
	.word 0x89942000  ! 364: WRPR_TICK_I	wrpr	%r16, 0x0000, %tick
	.word 0xa7484000  ! 365: RDHPR_HTSTATE	rdhpr	%htstate, %r19
	.word 0xad484000  ! 366: RDHPR_HTSTATE	rdhpr	%htstate, %r22
hwintr_3_9:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_9), 16, 16)) -> intp(3, 0, 2)
	.word 0x01000000  ! 367: NOP	nop
	.word 0xa145c000  ! 368: RDASR	rd	%-, %r16
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x89842000  ! 370: WRASR_I	wr	%r16, 0x0000, %tick
	.word 0x8f97a000  ! 371: WRPR_TL_I	wrpr	%r30, 0x0000, %tl
	ta	T_CHANGE_PRIV	! macro
	.word 0x91956000  ! 373: WRPR_PIL_I	wrpr	%r21, 0x0000, %pil
	.word 0x8984e000  ! 374: WRASR_I	wr	%r19, 0x0000, %tick
	ta	T_CHANGE_NONPRIV	! macro
	ta	T_CHANGE_PRIV	! macro
	.word 0x879d2000  ! 377: WRHPR_HINTP_I	wrhpr	%r20, 0x0000, %hintp
	.word 0xa1450000  ! 378: RDASR	rd	%set_softint, %r16
	.word 0xad480000  ! 379: RDHPR_HPSTATE	rdhpr	%hpstate, %r22
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa5494000  ! 381: RDHPR_HTBA	rdhpr	%htba, %r18
	.word 0xa145c000  ! 382: RDASR	rd	%-, %r16
	.word 0x819fe000  ! 383: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0xa3852000  ! 384: WRASR_I	wr	%r20, 0x0000, %-
	ta	T_CHANGE_HPRIV	! macro
	.word 0x879c6000  ! 386: WRHPR_HINTP_I	wrhpr	%r17, 0x0000, %hintp
	.word 0xa5540000  ! 387: RDPR_GL	rdpr	%-, %r18
	.word 0x8d95a000  ! 388: WRPR_PSTATE_I	wrpr	%r22, 0x0000, %pstate
	.word 0xab440000  ! 389: RDASR	rd	%-, %r21
	.word 0x89852000  ! 390: WRASR_I	wr	%r20, 0x0000, %tick
	.word 0x819fe000  ! 391: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0x89852000  ! 392: WRASR_I	wr	%r20, 0x0000, %tick
	.word 0xab520000  ! 393: RDPR_PIL	<illegal instruction>
	.word 0xab852000  ! 394: WRASR_I	wr	%r20, 0x0000, %clear_softint
	.word 0x819fe000  ! 395: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x879d6000  ! 397: WRHPR_HINTP_I	wrhpr	%r21, 0x0000, %hintp
	.word 0xab480000  ! 398: RDHPR_HPSTATE	rdhpr	%hpstate, %r21
	.word 0x8995a000  ! 399: WRPR_TICK_I	wrpr	%r22, 0x0000, %tick
	.word 0xa9440000  ! 400: RDASR	rd	%-, %r20
hwintr_3_10:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_10), 16, 16)) -> intp(3, 0, 2)
	.word 0x01000000  ! 401: NOP	nop
	.word 0xa9444000  ! 402: RDASR	rd	%-, %r20
	.word 0xa9520000  ! 403: RDPR_PIL	rdpr	%pil, %r20
	.word 0xa9540000  ! 404: RDPR_GL	<illegal instruction>
	.word 0x8d946000  ! 405: WRPR_PSTATE_I	wrpr	%r17, 0x0000, %pstate
hwintr_3_11:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_11), 16, 16)) -> intp(3, 0, 2)
	.word 0x01000000  ! 406: NOP	nop
	.word 0xab450000  ! 407: RDASR	rd	%set_softint, %r21
	.word 0xab454000  ! 408: RDASR	rd	%clear_softint, %r21
	.word 0x819fe000  ! 409: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0xa9852000  ! 410: WRASR_I	wr	%r20, 0x0000, %set_softint
	.word 0xab444000  ! 411: RDASR	rd	%-, %r21
	.word 0xa9484000  ! 412: RDHPR_HTSTATE	rdhpr	%htstate, %r20
	.word 0xa748c000  ! 413: RDHPR_HINTP	rdhpr	%hintp, %r19
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1480000  ! 415: RDHPR_HPSTATE	rdhpr	%hpstate, %r16
	ta	T_CHANGE_PRIV	! macro
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x879da000  ! 418: WRHPR_HINTP_I	wrhpr	%r22, 0x0000, %hintp
	.word 0x8f97a000  ! 419: WRPR_TL_I	wrpr	%r30, 0x0000, %tl
	.word 0xa9856000  ! 420: WRASR_I	wr	%r21, 0x0000, %set_softint
	ta	T_CHANGE_NONHPRIV	! macro
	ta	T_CHANGE_PRIV	! macro
	.word 0x87946000  ! 424: WRPR_TT_I	wrpr	%r17, 0x0000, %tt
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xa7494000  ! 425: RDHPR_HTBA	rdhpr	%htba, %r19
	.word 0xad856000  ! 426: WRASR_I	wr	%r21, 0x0000, %softint
	.word 0xa1450000  ! 427: RDASR	rd	%set_softint, %r16
	.word 0x879da000  ! 428: WRHPR_HINTP_I	wrhpr	%r22, 0x0000, %hintp
	.word 0xa3518000  ! 429: RDPR_PSTATE	rdpr	%pstate, %r17
	.word 0xa3520000  ! 430: RDPR_PIL	<illegal instruction>
	ta	T_CHANGE_PRIV	! macro
	.word 0xab514000  ! 432: RDPR_TBA	<illegal instruction>
hwintr_3_12:
!$EV trig_pc_d(3,expr(@VA(.MAIN.hwintr_3_12), 16, 16)) -> intp(3, 0, 2)
	.word 0x01000000  ! 433: NOP	nop
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91952000  ! 435: WRPR_PIL_I	wrpr	%r20, 0x0000, %pil
	.word 0x8994a000  ! 436: WRPR_TICK_I	wrpr	%r18, 0x0000, %tick
	.word 0x91956000  ! 437: WRPR_PIL_I	wrpr	%r21, 0x0000, %pil
	.word 0xad518000  ! 438: RDPR_PSTATE	rdpr	%pstate, %r22
	.word 0x879da000  ! 439: WRHPR_HINTP_I	wrhpr	%r22, 0x0000, %hintp
	.word 0x819fe000  ! 440: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0xab440000  ! 441: RDASR	rd	%-, %r21
	.word 0x89846000  ! 442: WRASR_I	wr	%r17, 0x0000, %tick
	.word 0xab440000  ! 443: RDASR	rd	%-, %r21
	.word 0xa9484000  ! 444: RDHPR_HTSTATE	rdhpr	%htstate, %r20
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x819fe000  ! 446: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0xa3480000  ! 447: RDHPR_HPSTATE	rdhpr	%hpstate, %r17
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa7520000  ! 449: RDPR_PIL	rdpr	%pil, %r19
	.word 0xb1846000  ! 450: WRASR_I	wr	%r17, 0x0000, %-
	.word 0x819fe000  ! 451: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0xa9846000  ! 452: WRASR_I	wr	%r17, 0x0000, %set_softint
	.word 0xab440000  ! 453: RDASR	rd	%-, %r21
	.word 0xa5520000  ! 454: RDPR_PIL	<illegal instruction>
	.word 0x8d942000  ! 455: WRPR_PSTATE_I	wrpr	%r16, 0x0000, %pstate
	.word 0xad520000  ! 456: RDPR_PIL	rdpr	%pil, %r22
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa9440000  ! 458: RDASR	rd	%-, %r20
	.word 0x8d942000  ! 459: WRPR_PSTATE_I	wrpr	%r16, 0x0000, %pstate
	.word 0x8f972000  ! 460: WRPR_TL_I	wrpr	%r28, 0x0000, %tl
	.word 0x89856000  ! 461: WRASR_I	wr	%r21, 0x0000, %tick
	.word 0xa9440000  ! 462: RDASR	rd	%-, %r20
	ta	T_CHANGE_NONPRIV	! macro
	ta	T_CHANGE_HPRIV	! macro
	.word 0xa5514000  ! 465: RDPR_TBA	rdpr	%tba, %r18
	.word 0xa3484000  ! 466: RDHPR_HTSTATE	rdhpr	%htstate, %r17
	.word 0x879ce000  ! 467: WRHPR_HINTP_I	wrhpr	%r19, 0x0000, %hintp
	.word 0x8f97a000  ! 468: WRPR_TL_I	wrpr	%r30, 0x0000, %tl
	.word 0x8994e000  ! 469: WRPR_TICK_I	wrpr	%r19, 0x0000, %tick
	.word 0xa3518000  ! 470: RDPR_PSTATE	rdpr	%pstate, %r17
	.word 0xa5540000  ! 471: RDPR_GL	<illegal instruction>
	.word 0xa9514000  ! 472: RDPR_TBA	<illegal instruction>
	.word 0xa3494000  ! 473: RDHPR_HTBA	rdhpr	%htba, %r17
	.word 0x8f962000  ! 474: WRPR_TL_I	wrpr	%r24, 0x0000, %tl
	.word 0x819fe000  ! 475: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0x839fe000  ! 477: WRHPR_HTSTATE_I	wrhpr	%r31, 0x0000, %htstate
	ta	T_CHANGE_TO_TL0	! macro
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f97a000  ! 479: WRPR_TL_I	wrpr	%r30, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91942000  ! 481: WRPR_PIL_I	wrpr	%r16, 0x0000, %pil
	.word 0xa9852000  ! 482: WRASR_I	wr	%r20, 0x0000, %set_softint
	.word 0xa950c000  ! 484: RDPR_TT	<illegal instruction>
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x879d2000  ! 485: WRHPR_HINTP_I	wrhpr	%r20, 0x0000, %hintp
	.word 0xad480000  ! 486: RDHPR_HPSTATE	rdhpr	%hpstate, %r22
	ta	T_CHANGE_PRIV	! macro
	.word 0xab450000  ! 488: RDASR	rd	%set_softint, %r21
	.word 0xab846000  ! 489: WRASR_I	wr	%r17, 0x0000, %clear_softint
	.word 0x819fe000  ! 490: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0xab508000  ! 492: RDPR_TSTATE	rdpr	%tstate, %r21
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xa3504000  ! 494: RDPR_TNPC	<illegal instruction>
	ta	T_CHANGE_TO_TL1	! macro
	ta	T_CHANGE_PRIV	! macro
	.word 0xa7494000  ! 496: RDHPR_HTBA	rdhpr	%htba, %r19
	.word 0x89946000  ! 497: WRPR_TICK_I	wrpr	%r17, 0x0000, %tick
	.word 0x879ce000  ! 498: WRHPR_HINTP_I	wrhpr	%r19, 0x0000, %hintp
	.word 0xad464000  ! 499: RDASR	rd	%-, %r22
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_2:
	.word 0x8d946000  ! 2: WRPR_PSTATE_I	wrpr	%r17, 0x0000, %pstate
	.word 0x819fe000  ! 3: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0x89856000  ! 4: WRASR_I	wr	%r21, 0x0000, %tick
	.word 0x89856000  ! 5: WRASR_I	wr	%r21, 0x0000, %tick
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1518000  ! 7: RDPR_PSTATE	<illegal instruction>
	.word 0xa9856000  ! 8: WRASR_I	wr	%r21, 0x0000, %set_softint
	.word 0x879d6000  ! 9: WRHPR_HINTP_I	wrhpr	%r21, 0x0000, %hintp
	.word 0xad444000  ! 10: RDASR	rd	%-, %r22
	.word 0x819fe000  ! 11: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0xad458000  ! 12: RDASR	rd	%softint, %r22
	.word 0xb184a000  ! 13: WRASR_I	wr	%r18, 0x0000, %-
	.word 0x8984a000  ! 14: WRASR_I	wr	%r18, 0x0000, %tick
	.word 0x8f97a000  ! 15: WRPR_TL_I	wrpr	%r30, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xad45c000  ! 18: RDASR	rd	%-, %r22
	.word 0xb184a000  ! 19: WRASR_I	wr	%r18, 0x0000, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0x819fe000  ! 21: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0xa548c000  ! 22: RDHPR_HINTP	rdhpr	%hintp, %r18
	.word 0x879d6000  ! 23: WRHPR_HINTP_I	wrhpr	%r21, 0x0000, %hintp
	ta	T_CHANGE_HPRIV	! macro
	.word 0xa9494000  ! 25: RDHPR_HTBA	rdhpr	%htba, %r20
	.word 0x8f97a000  ! 26: WRPR_TL_I	wrpr	%r30, 0x0000, %tl
	.word 0x8d956000  ! 27: WRPR_PSTATE_I	wrpr	%r21, 0x0000, %pstate
	.word 0xb1842000  ! 28: WRASR_I	wr	%r16, 0x0000, %-
	.word 0xab842000  ! 29: WRASR_I	wr	%r16, 0x0000, %clear_softint
	.word 0x91956000  ! 30: WRPR_PIL_I	wrpr	%r21, 0x0000, %pil
	.word 0xa3454000  ! 31: RDASR	rd	%clear_softint, %r17
	.word 0x8d95a000  ! 32: WRPR_PSTATE_I	wrpr	%r22, 0x0000, %pstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa3856000  ! 34: WRASR_I	wr	%r21, 0x0000, %-
	ta	T_CHANGE_NONHPRIV	! macro
	ta	T_CHANGE_NONPRIV	! macro
	ta	T_CHANGE_HPRIV	! macro
hwintr_2_0:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_0), 16, 16)) -> intp(2, 0, 2)
	.word 0x01000000  ! 38: NOP	nop
	.word 0x9194a000  ! 39: WRPR_PIL_I	wrpr	%r18, 0x0000, %pil
	.word 0x879da000  ! 40: WRHPR_HINTP_I	wrhpr	%r22, 0x0000, %hintp
	.word 0x819fe000  ! 41: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8f972000  ! 43: WRPR_TL_I	wrpr	%r28, 0x0000, %tl
	.word 0xa3440000  ! 44: RDASR	rd	%-, %r17
	.word 0x8d95a000  ! 45: WRPR_PSTATE_I	wrpr	%r22, 0x0000, %pstate
	.word 0xab480000  ! 46: RDHPR_HPSTATE	rdhpr	%hpstate, %r21
	.word 0xa3504000  ! 48: RDPR_TNPC	<illegal instruction>
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xa7508000  ! 50: RDPR_TSTATE	<illegal instruction>
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x879d6000  ! 51: WRHPR_HINTP_I	wrhpr	%r21, 0x0000, %hintp
	ta	T_CHANGE_NONPRIV	! macro
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa984a000  ! 54: WRASR_I	wr	%r18, 0x0000, %set_softint
	.word 0xb184a000  ! 55: WRASR_I	wr	%r18, 0x0000, %-
	.word 0xa9440000  ! 56: RDASR	rd	%-, %r20
	.word 0xad48c000  ! 57: RDHPR_HINTP	rdhpr	%hintp, %r22
	.word 0xa5514000  ! 58: RDPR_TBA	<illegal instruction>
	.word 0xa1494000  ! 59: RDHPR_HTBA	rdhpr	%htba, %r16
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8984a000  ! 61: WRASR_I	wr	%r18, 0x0000, %tick
	.word 0xa1540000  ! 62: RDPR_GL	<illegal instruction>
	.word 0x8f97a000  ! 63: WRPR_TL_I	wrpr	%r30, 0x0000, %tl
	.word 0x91942000  ! 64: WRPR_PIL_I	wrpr	%r16, 0x0000, %pil
	.word 0xa3846000  ! 65: WRASR_I	wr	%r17, 0x0000, %-
	.word 0x839fe000  ! 67: WRHPR_HTSTATE_I	wrhpr	%r31, 0x0000, %htstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xa151c000  ! 68: RDPR_TL	<illegal instruction>
	.word 0xa3846000  ! 69: WRASR_I	wr	%r17, 0x0000, %-
	.word 0xa3494000  ! 70: RDHPR_HTBA	rdhpr	%htba, %r17
	.word 0xab450000  ! 71: RDASR	rd	%set_softint, %r21
	ta	T_CHANGE_HPRIV	! macro
hwintr_2_1:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_1), 16, 16)) -> intp(2, 0, 2)
	.word 0x01000000  ! 73: NOP	nop
	ta	T_CHANGE_HPRIV	! macro
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91946000  ! 76: WRPR_PIL_I	wrpr	%r17, 0x0000, %pil
	.word 0x879c2000  ! 77: WRHPR_HINTP_I	wrhpr	%r16, 0x0000, %hintp
hwintr_2_2:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_2), 16, 16)) -> intp(2, 0, 2)
	.word 0x01000000  ! 78: NOP	nop
	.word 0x91946000  ! 79: WRPR_PIL_I	wrpr	%r17, 0x0000, %pil
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xab450000  ! 81: RDASR	rd	%set_softint, %r21
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d952000  ! 83: WRPR_PSTATE_I	wrpr	%r20, 0x0000, %pstate
	.word 0x879d6000  ! 84: WRHPR_HINTP_I	wrhpr	%r21, 0x0000, %hintp
	.word 0xa351c000  ! 85: RDPR_TL	<illegal instruction>
	.word 0x91942000  ! 86: WRPR_PIL_I	wrpr	%r16, 0x0000, %pil
	ta	T_CHANGE_NONHPRIV	! macro
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8d95a000  ! 89: WRPR_PSTATE_I	wrpr	%r22, 0x0000, %pstate
	.word 0x819fe000  ! 90: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
hwintr_2_3:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_3), 16, 16)) -> intp(2, 0, 2)
	.word 0x01000000  ! 91: NOP	nop
	.word 0x89952000  ! 92: WRPR_TICK_I	wrpr	%r20, 0x0000, %tick
	.word 0x819fe000  ! 93: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xab520000  ! 95: RDPR_PIL	<illegal instruction>
	.word 0xa545c000  ! 96: RDASR	rd	%-, %r18
	.word 0xa3494000  ! 97: RDHPR_HTBA	rdhpr	%htba, %r17
	.word 0x8f97a000  ! 98: WRPR_TL_I	wrpr	%r30, 0x0000, %tl
	.word 0xa3846000  ! 99: WRASR_I	wr	%r17, 0x0000, %-
	.word 0xa351c000  ! 100: RDPR_TL	<illegal instruction>
	.word 0xad494000  ! 101: RDHPR_HTBA	rdhpr	%htba, %r22
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x879ca000  ! 103: WRHPR_HINTP_I	wrhpr	%r18, 0x0000, %hintp
	.word 0xad518000  ! 104: RDPR_PSTATE	<illegal instruction>
	.word 0xa3518000  ! 105: RDPR_PSTATE	<illegal instruction>
	.word 0xab48c000  ! 106: RDHPR_HINTP	rdhpr	%hintp, %r21
	.word 0x89946000  ! 107: WRPR_TICK_I	wrpr	%r17, 0x0000, %tick
	.word 0xa984a000  ! 108: WRASR_I	wr	%r18, 0x0000, %set_softint
	.word 0xab440000  ! 109: RDASR	rd	%-, %r21
	.word 0xb184a000  ! 110: WRASR_I	wr	%r18, 0x0000, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f962000  ! 112: WRPR_TL_I	wrpr	%r24, 0x0000, %tl
	ta	T_CHANGE_HPRIV	! macro
	.word 0xa384a000  ! 114: WRASR_I	wr	%r18, 0x0000, %-
	.word 0xa751c000  ! 115: RDPR_TL	<illegal instruction>
	ta	T_CHANGE_NONPRIV	! macro
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8d94a000  ! 118: WRPR_PSTATE_I	wrpr	%r18, 0x0000, %pstate
	.word 0x879da000  ! 119: WRHPR_HINTP_I	wrhpr	%r22, 0x0000, %hintp
	.word 0xab464000  ! 120: RDASR	rd	%-, %r21
	.word 0xab458000  ! 121: RDASR	rd	%softint, %r21
	.word 0xa3484000  ! 122: RDHPR_HTSTATE	rdhpr	%htstate, %r17
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa9458000  ! 124: RDASR	rd	%softint, %r20
	.word 0xa985a000  ! 125: WRASR_I	wr	%r22, 0x0000, %set_softint
	.word 0xa9464000  ! 126: RDASR	rd	%-, %r20
	.word 0x879ce000  ! 127: WRHPR_HINTP_I	wrhpr	%r19, 0x0000, %hintp
	.word 0xa945c000  ! 128: RDASR	rd	%-, %r20
	.word 0xad494000  ! 129: RDHPR_HTBA	rdhpr	%htba, %r22
	.word 0x8984a000  ! 130: WRASR_I	wr	%r18, 0x0000, %tick
	.word 0xa7464000  ! 131: RDASR	rd	%-, %r19
	.word 0x8d956000  ! 132: WRPR_PSTATE_I	wrpr	%r21, 0x0000, %pstate
	.word 0x8984e000  ! 133: WRASR_I	wr	%r19, 0x0000, %tick
	.word 0x879da000  ! 134: WRHPR_HINTP_I	wrhpr	%r22, 0x0000, %hintp
	.word 0x9194e000  ! 135: WRPR_PIL_I	wrpr	%r19, 0x0000, %pil
	.word 0x8d94a000  ! 136: WRPR_PSTATE_I	wrpr	%r18, 0x0000, %pstate
	.word 0x879c6000  ! 137: WRHPR_HINTP_I	wrhpr	%r17, 0x0000, %hintp
	ta	T_CHANGE_PRIV	! macro
	.word 0xa7440000  ! 139: RDASR	rd	%-, %r19
	ta	T_CHANGE_HPRIV	! macro
	.word 0x839fe000  ! 142: WRHPR_HTSTATE_I	wrhpr	%r31, 0x0000, %htstate
	ta	T_CHANGE_TO_TL1	! macro
	.word 0xa3520000  ! 143: RDPR_PIL	<illegal instruction>
	.word 0x8f97a000  ! 144: WRPR_TL_I	wrpr	%r30, 0x0000, %tl
	.word 0xa151c000  ! 145: RDPR_TL	<illegal instruction>
	.word 0xa748c000  ! 146: RDHPR_HINTP	rdhpr	%hintp, %r19
	ta	T_CHANGE_NONPRIV	! macro
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xab856000  ! 149: WRASR_I	wr	%r21, 0x0000, %clear_softint
	.word 0x879d2000  ! 150: WRHPR_HINTP_I	wrhpr	%r20, 0x0000, %hintp
	.word 0xad454000  ! 151: RDASR	rd	%clear_softint, %r22
	.word 0x91946000  ! 152: WRPR_PIL_I	wrpr	%r17, 0x0000, %pil
	.word 0xad454000  ! 153: RDASR	rd	%clear_softint, %r22
	.word 0x879d6000  ! 154: WRHPR_HINTP_I	wrhpr	%r21, 0x0000, %hintp
hwintr_2_4:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_4), 16, 16)) -> intp(2, 0, 2)
	.word 0x01000000  ! 155: NOP	nop
	.word 0x8594a000  ! 157: WRPR_TSTATE_I	wrpr	%r18, 0x0000, %tstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xa9852000  ! 158: WRASR_I	wr	%r20, 0x0000, %set_softint
	.word 0xa9518000  ! 159: RDPR_PSTATE	<illegal instruction>
	.word 0x91956000  ! 160: WRPR_PIL_I	wrpr	%r21, 0x0000, %pil
	.word 0xad514000  ! 161: RDPR_TBA	rdpr	%tba, %r22
	.word 0xa951c000  ! 162: RDPR_TL	<illegal instruction>
	.word 0xad480000  ! 163: RDHPR_HPSTATE	rdhpr	%hpstate, %r22
	ta	T_CHANGE_NONHPRIV	! macro
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x819fe000  ! 166: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0xa9500000  ! 168: RDPR_TPC	<illegal instruction>
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x8995a000  ! 169: WRPR_TICK_I	wrpr	%r22, 0x0000, %tick
	.word 0xa9494000  ! 170: RDHPR_HTBA	rdhpr	%htba, %r20
	.word 0xad540000  ! 171: RDPR_GL	<illegal instruction>
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8d94a000  ! 173: WRPR_PSTATE_I	wrpr	%r18, 0x0000, %pstate
	.word 0xa3444000  ! 174: RDASR	rd	%-, %r17
	.word 0xa1518000  ! 175: RDPR_PSTATE	<illegal instruction>
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1520000  ! 177: RDPR_PIL	<illegal instruction>
	.word 0xa3518000  ! 178: RDPR_PSTATE	<illegal instruction>
	.word 0xa5518000  ! 179: RDPR_PSTATE	<illegal instruction>
	.word 0x89852000  ! 180: WRASR_I	wr	%r20, 0x0000, %tick
	.word 0x879da000  ! 181: WRHPR_HINTP_I	wrhpr	%r22, 0x0000, %hintp
	.word 0xa148c000  ! 182: RDHPR_HINTP	rdhpr	%hintp, %r16
	.word 0x8f97a000  ! 183: WRPR_TL_I	wrpr	%r30, 0x0000, %tl
	.word 0xa945c000  ! 184: RDASR	rd	%-, %r20
	.word 0xa9440000  ! 185: RDASR	rd	%-, %r20
	.word 0xa9464000  ! 186: RDASR	rd	%-, %r20
hwintr_2_5:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_5), 16, 16)) -> intp(2, 0, 2)
	.word 0x01000000  ! 187: NOP	nop
	.word 0xa1484000  ! 188: RDHPR_HTSTATE	rdhpr	%htstate, %r16
	.word 0x879c6000  ! 189: WRHPR_HINTP_I	wrhpr	%r17, 0x0000, %hintp
	.word 0xad440000  ! 190: RDASR	rd	%-, %r22
	.word 0xa7484000  ! 191: RDHPR_HTSTATE	rdhpr	%htstate, %r19
	.word 0xab51c000  ! 192: RDPR_TL	<illegal instruction>
	.word 0xa9518000  ! 193: RDPR_PSTATE	<illegal instruction>
	.word 0xa9480000  ! 194: RDHPR_HPSTATE	rdhpr	%hpstate, %r20
	.word 0x8984a000  ! 195: WRASR_I	wr	%r18, 0x0000, %tick
	.word 0xa951c000  ! 196: RDPR_TL	<illegal instruction>
	.word 0xb184a000  ! 197: WRASR_I	wr	%r18, 0x0000, %-
	.word 0xad45c000  ! 198: RDASR	rd	%-, %r22
	.word 0xab48c000  ! 199: RDHPR_HINTP	rdhpr	%hintp, %r21
	.word 0x819fe000  ! 200: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0xa1540000  ! 201: RDPR_GL	<illegal instruction>
	ta	T_CHANGE_PRIV	! macro
	.word 0xb184a000  ! 203: WRASR_I	wr	%r18, 0x0000, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0x879c2000  ! 205: WRHPR_HINTP_I	wrhpr	%r16, 0x0000, %hintp
	.word 0x8994e000  ! 206: WRPR_TICK_I	wrpr	%r19, 0x0000, %tick
	.word 0xa385a000  ! 207: WRASR_I	wr	%r22, 0x0000, %-
	.word 0x91956000  ! 208: WRPR_PIL_I	wrpr	%r21, 0x0000, %pil
	ta	T_CHANGE_HPRIV	! macro
	.word 0x819fe000  ! 210: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0x819fe000  ! 211: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0xad856000  ! 213: WRASR_I	wr	%r21, 0x0000, %softint
	.word 0x91942000  ! 214: WRPR_PIL_I	wrpr	%r16, 0x0000, %pil
	.word 0xa7518000  ! 215: RDPR_PSTATE	<illegal instruction>
	.word 0x879c2000  ! 216: WRHPR_HINTP_I	wrhpr	%r16, 0x0000, %hintp
	.word 0x8d946000  ! 217: WRPR_PSTATE_I	wrpr	%r17, 0x0000, %pstate
	.word 0xa9852000  ! 218: WRASR_I	wr	%r20, 0x0000, %set_softint
	.word 0x8d94a000  ! 219: WRPR_PSTATE_I	wrpr	%r18, 0x0000, %pstate
	.word 0x89856000  ! 220: WRASR_I	wr	%r21, 0x0000, %tick
	.word 0x879ce000  ! 221: WRHPR_HINTP_I	wrhpr	%r19, 0x0000, %hintp
	.word 0xa5540000  ! 222: RDPR_GL	<illegal instruction>
	.word 0xa1540000  ! 223: RDPR_GL	<illegal instruction>
	.word 0xa9454000  ! 224: RDASR	rd	%clear_softint, %r20
	.word 0x819fe000  ! 225: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0xa3514000  ! 226: RDPR_TBA	<illegal instruction>
	.word 0x819fe000  ! 227: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0xa5440000  ! 228: RDASR	rd	%-, %r18
	.word 0xa151c000  ! 229: RDPR_TL	rdpr	%tl, %r16
	.word 0x819fe000  ! 230: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0xa9480000  ! 231: RDHPR_HPSTATE	rdhpr	%hpstate, %r20
	.word 0xab856000  ! 232: WRASR_I	wr	%r21, 0x0000, %clear_softint
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa3440000  ! 234: RDASR	rd	%-, %r17
	.word 0xab540000  ! 235: RDPR_GL	<illegal instruction>
	.word 0xa3540000  ! 236: RDPR_GL	<illegal instruction>
	.word 0x8395a000  ! 238: WRPR_TNPC_I	wrpr	%r22, 0x0000, %tnpc
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xa5454000  ! 239: RDASR	rd	%clear_softint, %r18
	.word 0x8994e000  ! 240: WRPR_TICK_I	wrpr	%r19, 0x0000, %tick
	.word 0xa545c000  ! 241: RDASR	rd	%-, %r18
	.word 0x8d952000  ! 242: WRPR_PSTATE_I	wrpr	%r20, 0x0000, %pstate
	.word 0xb184e000  ! 243: WRASR_I	wr	%r19, 0x0000, %-
	.word 0x819fe000  ! 244: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
hwintr_2_6:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_6), 16, 16)) -> intp(2, 0, 2)
	.word 0x01000000  ! 245: NOP	nop
	.word 0xa984e000  ! 246: WRASR_I	wr	%r19, 0x0000, %set_softint
	.word 0xab480000  ! 247: RDHPR_HPSTATE	rdhpr	%hpstate, %r21
	.word 0xad520000  ! 248: RDPR_PIL	<illegal instruction>
	.word 0x819fe000  ! 249: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0x91956000  ! 250: WRPR_PIL_I	wrpr	%r21, 0x0000, %pil
	.word 0xa5518000  ! 251: RDPR_PSTATE	<illegal instruction>
	.word 0xa1444000  ! 252: RDASR	rd	%-, %r16
	.word 0xa1440000  ! 253: RDASR	rd	%-, %r16
	ta	T_CHANGE_PRIV	! macro
	.word 0xa7504000  ! 256: RDPR_TNPC	<illegal instruction>
	ta	T_CHANGE_TO_TL1	! macro
	.word 0xad454000  ! 257: RDASR	rd	%clear_softint, %r22
	.word 0x83952000  ! 259: WRPR_TNPC_I	wrpr	%r20, 0x0000, %tnpc
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xab494000  ! 260: RDHPR_HTBA	rdhpr	%htba, %r21
	.word 0x8f97a000  ! 261: WRPR_TL_I	wrpr	%r30, 0x0000, %tl
	.word 0x8d94a000  ! 262: WRPR_PSTATE_I	wrpr	%r18, 0x0000, %pstate
	.word 0xad508000  ! 264: RDPR_TSTATE	<illegal instruction>
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8f97a000  ! 265: WRPR_TL_I	wrpr	%r30, 0x0000, %tl
	.word 0xa5440000  ! 266: RDASR	rd	%-, %r18
	.word 0xad500000  ! 268: RDPR_TPC	<illegal instruction>
	ta	T_CHANGE_TO_TL0	! macro
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xad520000  ! 270: RDPR_PIL	<illegal instruction>
	.word 0xad440000  ! 271: RDASR	rd	%-, %r22
	.word 0x91942000  ! 272: WRPR_PIL_I	wrpr	%r16, 0x0000, %pil
	.word 0xad514000  ! 273: RDPR_TBA	rdpr	%tba, %r22
	.word 0xa5484000  ! 274: RDHPR_HTSTATE	rdhpr	%htstate, %r18
	.word 0xa148c000  ! 275: RDHPR_HINTP	rdhpr	%hintp, %r16
	ta	T_CHANGE_HPRIV	! macro
	.word 0x819fe000  ! 277: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0xa5444000  ! 278: RDASR	rd	%-, %r18
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x879c6000  ! 280: WRHPR_HINTP_I	wrhpr	%r17, 0x0000, %hintp
	ta	T_CHANGE_HPRIV	! macro
	.word 0xa5450000  ! 282: RDASR	rd	%set_softint, %r18
	.word 0x879c2000  ! 283: WRHPR_HINTP_I	wrhpr	%r16, 0x0000, %hintp
	.word 0xab85a000  ! 284: WRASR_I	wr	%r22, 0x0000, %clear_softint
	.word 0xad48c000  ! 285: RDHPR_HINTP	rdhpr	%hintp, %r22
	.word 0x8f97a000  ! 286: WRPR_TL_I	wrpr	%r30, 0x0000, %tl
	.word 0x91942000  ! 287: WRPR_PIL_I	wrpr	%r16, 0x0000, %pil
	.word 0xa9444000  ! 288: RDASR	rd	%-, %r20
	.word 0xab84e000  ! 289: WRASR_I	wr	%r19, 0x0000, %clear_softint
	ta	T_CHANGE_HPRIV	! macro
	.word 0x819fe000  ! 291: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0xa7518000  ! 292: RDPR_PSTATE	rdpr	%pstate, %r19
	ta	T_CHANGE_NONPRIV	! macro
	ta	T_CHANGE_PRIV	! macro
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x819fe000  ! 296: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0xa548c000  ! 297: RDHPR_HINTP	rdhpr	%hintp, %r18
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa9518000  ! 299: RDPR_PSTATE	<illegal instruction>
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8984e000  ! 301: WRASR_I	wr	%r19, 0x0000, %tick
	.word 0xa9484000  ! 302: RDHPR_HTSTATE	rdhpr	%htstate, %r20
	.word 0xab520000  ! 303: RDPR_PIL	<illegal instruction>
	.word 0x879c2000  ! 304: WRHPR_HINTP_I	wrhpr	%r16, 0x0000, %hintp
	.word 0xa7514000  ! 305: RDPR_TBA	<illegal instruction>
	.word 0x8984a000  ! 306: WRASR_I	wr	%r18, 0x0000, %tick
	.word 0xa9454000  ! 307: RDASR	rd	%clear_softint, %r20
	.word 0xa548c000  ! 308: RDHPR_HINTP	rdhpr	%hintp, %r18
	.word 0xa1444000  ! 309: RDASR	rd	%-, %r16
	.word 0x879d6000  ! 310: WRHPR_HINTP_I	wrhpr	%r21, 0x0000, %hintp
	.word 0xa9846000  ! 311: WRASR_I	wr	%r17, 0x0000, %set_softint
	.word 0xa1444000  ! 312: RDASR	rd	%-, %r16
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1444000  ! 314: RDASR	rd	%-, %r16
	.word 0x819fe000  ! 315: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0x89946000  ! 316: WRPR_TICK_I	wrpr	%r17, 0x0000, %tick
hwintr_2_7:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_7), 16, 16)) -> intp(2, 0, 2)
	.word 0x01000000  ! 317: NOP	nop
	.word 0xa3484000  ! 318: RDHPR_HTSTATE	rdhpr	%htstate, %r17
	.word 0xa1440000  ! 319: RDASR	rd	%-, %r16
	.word 0x89842000  ! 320: WRASR_I	wr	%r16, 0x0000, %tick
	.word 0xa548c000  ! 321: RDHPR_HINTP	rdhpr	%hintp, %r18
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x83946000  ! 324: WRPR_TNPC_I	wrpr	%r17, 0x0000, %tnpc
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x819fe000  ! 325: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0xa545c000  ! 326: RDASR	rd	%-, %r18
	.word 0xad51c000  ! 327: RDPR_TL	<illegal instruction>
	.word 0xa9856000  ! 328: WRASR_I	wr	%r21, 0x0000, %set_softint
	.word 0x879c2000  ! 329: WRHPR_HINTP_I	wrhpr	%r16, 0x0000, %hintp
	.word 0xa3520000  ! 330: RDPR_PIL	<illegal instruction>
	.word 0xa945c000  ! 331: RDASR	rd	%-, %r20
	.word 0xa3856000  ! 332: WRASR_I	wr	%r21, 0x0000, %-
	.word 0xa9444000  ! 333: RDASR	rd	%-, %r20
	ta	T_CHANGE_NONPRIV	! macro
hwintr_2_8:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_8), 16, 16)) -> intp(2, 0, 2)
	.word 0x01000000  ! 335: NOP	nop
	.word 0xa9464000  ! 336: RDASR	rd	%-, %r20
	.word 0xa9454000  ! 337: RDASR	rd	%clear_softint, %r20
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa551c000  ! 339: RDPR_TL	<illegal instruction>
	.word 0x8595a000  ! 341: WRPR_TSTATE_I	wrpr	%r22, 0x0000, %tstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xa7444000  ! 342: RDASR	rd	%-, %r19
	ta	T_CHANGE_HPRIV	! macro
	.word 0xa7444000  ! 344: RDASR	rd	%-, %r19
	.word 0x89942000  ! 345: WRPR_TICK_I	wrpr	%r16, 0x0000, %tick
	.word 0xa3520000  ! 346: RDPR_PIL	rdpr	%pil, %r17
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1484000  ! 348: RDHPR_HTSTATE	rdhpr	%htstate, %r16
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa548c000  ! 350: RDHPR_HINTP	rdhpr	%hintp, %r18
	ta	T_CHANGE_HPRIV	! macro
	ta	T_CHANGE_NONPRIV	! macro
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa945c000  ! 354: RDASR	rd	%-, %r20
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa7494000  ! 356: RDHPR_HTBA	rdhpr	%htba, %r19
	.word 0xa7480000  ! 357: RDHPR_HPSTATE	rdhpr	%hpstate, %r19
	ta	T_CHANGE_NONPRIV	! macro
	ta	T_CHANGE_NONPRIV	! macro
	ta	T_CHANGE_HPRIV	! macro
	.word 0xa9514000  ! 361: RDPR_TBA	<illegal instruction>
	.word 0x879c6000  ! 362: WRHPR_HINTP_I	wrhpr	%r17, 0x0000, %hintp
	.word 0xad852000  ! 363: WRASR_I	wr	%r20, 0x0000, %softint
	.word 0x89952000  ! 364: WRPR_TICK_I	wrpr	%r20, 0x0000, %tick
	.word 0xa7484000  ! 365: RDHPR_HTSTATE	rdhpr	%htstate, %r19
	.word 0xa7484000  ! 366: RDHPR_HTSTATE	rdhpr	%htstate, %r19
hwintr_2_9:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_9), 16, 16)) -> intp(2, 0, 2)
	.word 0x01000000  ! 367: NOP	nop
	.word 0xa1458000  ! 368: RDASR	rd	%softint, %r16
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x89842000  ! 370: WRASR_I	wr	%r16, 0x0000, %tick
	.word 0x8f97a000  ! 371: WRPR_TL_I	wrpr	%r30, 0x0000, %tl
	ta	T_CHANGE_PRIV	! macro
	.word 0x91946000  ! 373: WRPR_PIL_I	wrpr	%r17, 0x0000, %pil
	.word 0x8984e000  ! 374: WRASR_I	wr	%r19, 0x0000, %tick
	ta	T_CHANGE_NONPRIV	! macro
	ta	T_CHANGE_PRIV	! macro
	.word 0x879da000  ! 377: WRHPR_HINTP_I	wrhpr	%r22, 0x0000, %hintp
	.word 0xa1458000  ! 378: RDASR	rd	%softint, %r16
	.word 0xa5480000  ! 379: RDHPR_HPSTATE	rdhpr	%hpstate, %r18
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa7494000  ! 381: RDHPR_HTBA	rdhpr	%htba, %r19
	.word 0xa1440000  ! 382: RDASR	rd	%-, %r16
	.word 0x819fe000  ! 383: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0x89852000  ! 384: WRASR_I	wr	%r20, 0x0000, %tick
	ta	T_CHANGE_HPRIV	! macro
	.word 0x879d6000  ! 386: WRHPR_HINTP_I	wrhpr	%r21, 0x0000, %hintp
	.word 0xa3540000  ! 387: RDPR_GL	<illegal instruction>
	.word 0x8d94a000  ! 388: WRPR_PSTATE_I	wrpr	%r18, 0x0000, %pstate
	.word 0xab450000  ! 389: RDASR	rd	%set_softint, %r21
	.word 0xab852000  ! 390: WRASR_I	wr	%r20, 0x0000, %clear_softint
	.word 0x819fe000  ! 391: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0xa3852000  ! 392: WRASR_I	wr	%r20, 0x0000, %-
	.word 0xab520000  ! 393: RDPR_PIL	<illegal instruction>
	.word 0x89852000  ! 394: WRASR_I	wr	%r20, 0x0000, %tick
	.word 0x819fe000  ! 395: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x879c2000  ! 397: WRHPR_HINTP_I	wrhpr	%r16, 0x0000, %hintp
	.word 0xa3480000  ! 398: RDHPR_HPSTATE	rdhpr	%hpstate, %r17
	.word 0x89942000  ! 399: WRPR_TICK_I	wrpr	%r16, 0x0000, %tick
	.word 0xa9440000  ! 400: RDASR	rd	%-, %r20
hwintr_2_10:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_10), 16, 16)) -> intp(2, 0, 2)
	.word 0x01000000  ! 401: NOP	nop
	.word 0xa9450000  ! 402: RDASR	rd	%set_softint, %r20
	.word 0xad520000  ! 403: RDPR_PIL	<illegal instruction>
	.word 0xa1540000  ! 404: RDPR_GL	<illegal instruction>
	.word 0x8d952000  ! 405: WRPR_PSTATE_I	wrpr	%r20, 0x0000, %pstate
hwintr_2_11:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_11), 16, 16)) -> intp(2, 0, 2)
	.word 0x01000000  ! 406: NOP	nop
	.word 0xab440000  ! 407: RDASR	rd	%-, %r21
	.word 0xab458000  ! 408: RDASR	rd	%softint, %r21
	.word 0x819fe000  ! 409: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0xa3852000  ! 410: WRASR_I	wr	%r20, 0x0000, %-
	.word 0xab450000  ! 411: RDASR	rd	%set_softint, %r21
	.word 0xa7484000  ! 412: RDHPR_HTSTATE	rdhpr	%htstate, %r19
	.word 0xa548c000  ! 413: RDHPR_HINTP	rdhpr	%hintp, %r18
	ta	T_CHANGE_PRIV	! macro
	.word 0xad480000  ! 415: RDHPR_HPSTATE	rdhpr	%hpstate, %r22
	ta	T_CHANGE_PRIV	! macro
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x879ce000  ! 418: WRHPR_HINTP_I	wrhpr	%r19, 0x0000, %hintp
	.word 0x8f97a000  ! 419: WRPR_TL_I	wrpr	%r30, 0x0000, %tl
	.word 0xab856000  ! 420: WRASR_I	wr	%r21, 0x0000, %clear_softint
	ta	T_CHANGE_NONHPRIV	! macro
	ta	T_CHANGE_PRIV	! macro
	.word 0x8794e000  ! 424: WRPR_TT_I	wrpr	%r19, 0x0000, %tt
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xa1494000  ! 425: RDHPR_HTBA	rdhpr	%htba, %r16
	.word 0x89856000  ! 426: WRASR_I	wr	%r21, 0x0000, %tick
	.word 0xa1444000  ! 427: RDASR	rd	%-, %r16
	.word 0x879ca000  ! 428: WRHPR_HINTP_I	wrhpr	%r18, 0x0000, %hintp
	.word 0xa7518000  ! 429: RDPR_PSTATE	<illegal instruction>
	.word 0xad520000  ! 430: RDPR_PIL	<illegal instruction>
	ta	T_CHANGE_PRIV	! macro
	.word 0xa3514000  ! 432: RDPR_TBA	<illegal instruction>
hwintr_2_12:
!$EV trig_pc_d(2,expr(@VA(.MAIN.hwintr_2_12), 16, 16)) -> intp(2, 0, 2)
	.word 0x01000000  ! 433: NOP	nop
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9195a000  ! 435: WRPR_PIL_I	wrpr	%r22, 0x0000, %pil
	.word 0x89952000  ! 436: WRPR_TICK_I	wrpr	%r20, 0x0000, %tick
	.word 0x91956000  ! 437: WRPR_PIL_I	wrpr	%r21, 0x0000, %pil
	.word 0xab518000  ! 438: RDPR_PSTATE	<illegal instruction>
	.word 0x879c6000  ! 439: WRHPR_HINTP_I	wrhpr	%r17, 0x0000, %hintp
	.word 0x819fe000  ! 440: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0xab440000  ! 441: RDASR	rd	%-, %r21
	.word 0xad846000  ! 442: WRASR_I	wr	%r17, 0x0000, %softint
	.word 0xab440000  ! 443: RDASR	rd	%-, %r21
	.word 0xa7484000  ! 444: RDHPR_HTSTATE	rdhpr	%htstate, %r19
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x819fe000  ! 446: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0xa7480000  ! 447: RDHPR_HPSTATE	rdhpr	%hpstate, %r19
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xad520000  ! 449: RDPR_PIL	<illegal instruction>
	.word 0xa3846000  ! 450: WRASR_I	wr	%r17, 0x0000, %-
	.word 0x819fe000  ! 451: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0xa9846000  ! 452: WRASR_I	wr	%r17, 0x0000, %set_softint
	.word 0xab440000  ! 453: RDASR	rd	%-, %r21
	.word 0xad520000  ! 454: RDPR_PIL	<illegal instruction>
	.word 0x8d95a000  ! 455: WRPR_PSTATE_I	wrpr	%r22, 0x0000, %pstate
	.word 0xad520000  ! 456: RDPR_PIL	<illegal instruction>
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa9464000  ! 458: RDASR	rd	%-, %r20
	.word 0x8d94a000  ! 459: WRPR_PSTATE_I	wrpr	%r18, 0x0000, %pstate
	.word 0x8f97a000  ! 460: WRPR_TL_I	wrpr	%r30, 0x0000, %tl
	.word 0x89856000  ! 461: WRASR_I	wr	%r21, 0x0000, %tick
	.word 0xa9440000  ! 462: RDASR	rd	%-, %r20
	ta	T_CHANGE_NONPRIV	! macro
	ta	T_CHANGE_HPRIV	! macro
	.word 0xa1514000  ! 465: RDPR_TBA	<illegal instruction>
	.word 0xa9484000  ! 466: RDHPR_HTSTATE	rdhpr	%htstate, %r20
	.word 0x879ca000  ! 467: WRHPR_HINTP_I	wrhpr	%r18, 0x0000, %hintp
	.word 0x8f97a000  ! 468: WRPR_TL_I	wrpr	%r30, 0x0000, %tl
	.word 0x89952000  ! 469: WRPR_TICK_I	wrpr	%r20, 0x0000, %tick
	.word 0xad518000  ! 470: RDPR_PSTATE	<illegal instruction>
	.word 0xa7540000  ! 471: RDPR_GL	<illegal instruction>
	.word 0xa7514000  ! 472: RDPR_TBA	<illegal instruction>
	.word 0xa7494000  ! 473: RDHPR_HTBA	rdhpr	%htba, %r19
	.word 0x8f97a000  ! 474: WRPR_TL_I	wrpr	%r30, 0x0000, %tl
	.word 0x819fe000  ! 475: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0x839fe000  ! 477: WRHPR_HTSTATE_I	wrhpr	%r31, 0x0000, %htstate
	ta	T_CHANGE_TO_TL0	! macro
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f97a000  ! 479: WRPR_TL_I	wrpr	%r30, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91946000  ! 481: WRPR_PIL_I	wrpr	%r17, 0x0000, %pil
	.word 0xab852000  ! 482: WRASR_I	wr	%r20, 0x0000, %clear_softint
	.word 0xa950c000  ! 484: RDPR_TT	<illegal instruction>
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x879d2000  ! 485: WRHPR_HINTP_I	wrhpr	%r20, 0x0000, %hintp
	.word 0xad480000  ! 486: RDHPR_HPSTATE	rdhpr	%hpstate, %r22
	ta	T_CHANGE_PRIV	! macro
	.word 0xab444000  ! 488: RDASR	rd	%-, %r21
	.word 0xa3846000  ! 489: WRASR_I	wr	%r17, 0x0000, %-
	.word 0x819fe000  ! 490: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0xa9508000  ! 492: RDPR_TSTATE	<illegal instruction>
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xab504000  ! 494: RDPR_TNPC	<illegal instruction>
	ta	T_CHANGE_TO_TL1	! macro
	ta	T_CHANGE_PRIV	! macro
	.word 0xa7494000  ! 496: RDHPR_HTBA	rdhpr	%htba, %r19
	.word 0x8995a000  ! 497: WRPR_TICK_I	wrpr	%r22, 0x0000, %tick
	.word 0x879d6000  ! 498: WRHPR_HINTP_I	wrhpr	%r21, 0x0000, %hintp
	.word 0xad444000  ! 499: RDASR	rd	%-, %r22
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	.word 0x8d94e000  ! 2: WRPR_PSTATE_I	wrpr	%r19, 0x0000, %pstate
	.word 0x819fe000  ! 3: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0xb1856000  ! 4: WRASR_I	wr	%r21, 0x0000, %-
	.word 0xab856000  ! 5: WRASR_I	wr	%r21, 0x0000, %clear_softint
	ta	T_CHANGE_PRIV	! macro
	.word 0xa9518000  ! 7: RDPR_PSTATE	rdpr	%pstate, %r20
	.word 0xab856000  ! 8: WRASR_I	wr	%r21, 0x0000, %clear_softint
	.word 0x879d2000  ! 9: WRHPR_HINTP_I	wrhpr	%r20, 0x0000, %hintp
	.word 0xad440000  ! 10: RDASR	rd	%-, %r22
	.word 0x819fe000  ! 11: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0xad444000  ! 12: RDASR	rd	%-, %r22
	.word 0x8984a000  ! 13: WRASR_I	wr	%r18, 0x0000, %tick
	.word 0xa984a000  ! 14: WRASR_I	wr	%r18, 0x0000, %set_softint
	.word 0x8f976000  ! 15: WRPR_TL_I	wrpr	%r29, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xad440000  ! 18: RDASR	rd	%-, %r22
	.word 0xb184a000  ! 19: WRASR_I	wr	%r18, 0x0000, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0x819fe000  ! 21: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0xab48c000  ! 22: RDHPR_HINTP	rdhpr	%hintp, %r21
	.word 0x879da000  ! 23: WRHPR_HINTP_I	wrhpr	%r22, 0x0000, %hintp
	ta	T_CHANGE_HPRIV	! macro
	.word 0xa3494000  ! 25: RDHPR_HTBA	rdhpr	%htba, %r17
	.word 0x8f97a000  ! 26: WRPR_TL_I	wrpr	%r30, 0x0000, %tl
	.word 0x8d942000  ! 27: WRPR_PSTATE_I	wrpr	%r16, 0x0000, %pstate
	.word 0xab842000  ! 28: WRASR_I	wr	%r16, 0x0000, %clear_softint
	.word 0x89842000  ! 29: WRASR_I	wr	%r16, 0x0000, %tick
	.word 0x9194a000  ! 30: WRPR_PIL_I	wrpr	%r18, 0x0000, %pil
	.word 0xa3440000  ! 31: RDASR	rd	%-, %r17
	.word 0x8d95a000  ! 32: WRPR_PSTATE_I	wrpr	%r22, 0x0000, %pstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xb1856000  ! 34: WRASR_I	wr	%r21, 0x0000, %-
	ta	T_CHANGE_NONHPRIV	! macro
	ta	T_CHANGE_NONPRIV	! macro
	ta	T_CHANGE_HPRIV	! macro
hwintr_1_0:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_0), 16, 16)) -> intp(1, 0, 2)
	.word 0x01000000  ! 38: NOP	nop
	.word 0x9194e000  ! 39: WRPR_PIL_I	wrpr	%r19, 0x0000, %pil
	.word 0x879da000  ! 40: WRHPR_HINTP_I	wrhpr	%r22, 0x0000, %hintp
	.word 0x819fe000  ! 41: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8f97a000  ! 43: WRPR_TL_I	wrpr	%r30, 0x0000, %tl
	.word 0xa345c000  ! 44: RDASR	rd	%-, %r17
	.word 0x8d95a000  ! 45: WRPR_PSTATE_I	wrpr	%r22, 0x0000, %pstate
	.word 0xab480000  ! 46: RDHPR_HPSTATE	rdhpr	%hpstate, %r21
	.word 0xa1504000  ! 48: RDPR_TNPC	<illegal instruction>
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xad508000  ! 50: RDPR_TSTATE	<illegal instruction>
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x879d2000  ! 51: WRHPR_HINTP_I	wrhpr	%r20, 0x0000, %hintp
	ta	T_CHANGE_NONPRIV	! macro
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xb184a000  ! 54: WRASR_I	wr	%r18, 0x0000, %-
	.word 0xab84a000  ! 55: WRASR_I	wr	%r18, 0x0000, %clear_softint
	.word 0xa945c000  ! 56: RDASR	rd	%-, %r20
	.word 0xa148c000  ! 57: RDHPR_HINTP	rdhpr	%hintp, %r16
	.word 0xa3514000  ! 58: RDPR_TBA	<illegal instruction>
	.word 0xa9494000  ! 59: RDHPR_HTBA	rdhpr	%htba, %r20
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8984a000  ! 61: WRASR_I	wr	%r18, 0x0000, %tick
	.word 0xa7540000  ! 62: RDPR_GL	<illegal instruction>
	.word 0x8f97a000  ! 63: WRPR_TL_I	wrpr	%r30, 0x0000, %tl
	.word 0x9194e000  ! 64: WRPR_PIL_I	wrpr	%r19, 0x0000, %pil
	.word 0xab846000  ! 65: WRASR_I	wr	%r17, 0x0000, %clear_softint
	.word 0x839fe000  ! 67: WRHPR_HTSTATE_I	wrhpr	%r31, 0x0000, %htstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xa351c000  ! 68: RDPR_TL	<illegal instruction>
	.word 0x89846000  ! 69: WRASR_I	wr	%r17, 0x0000, %tick
	.word 0xa3494000  ! 70: RDHPR_HTBA	rdhpr	%htba, %r17
	.word 0xab458000  ! 71: RDASR	rd	%softint, %r21
	ta	T_CHANGE_HPRIV	! macro
hwintr_1_1:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_1), 16, 16)) -> intp(1, 0, 2)
	.word 0x01000000  ! 73: NOP	nop
	ta	T_CHANGE_HPRIV	! macro
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91952000  ! 76: WRPR_PIL_I	wrpr	%r20, 0x0000, %pil
	.word 0x879c2000  ! 77: WRHPR_HINTP_I	wrhpr	%r16, 0x0000, %hintp
hwintr_1_2:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_2), 16, 16)) -> intp(1, 0, 2)
	.word 0x01000000  ! 78: NOP	nop
	.word 0x91942000  ! 79: WRPR_PIL_I	wrpr	%r16, 0x0000, %pil
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xab454000  ! 81: RDASR	rd	%clear_softint, %r21
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d956000  ! 83: WRPR_PSTATE_I	wrpr	%r21, 0x0000, %pstate
	.word 0x879ca000  ! 84: WRHPR_HINTP_I	wrhpr	%r18, 0x0000, %hintp
	.word 0xad51c000  ! 85: RDPR_TL	<illegal instruction>
	.word 0x91952000  ! 86: WRPR_PIL_I	wrpr	%r20, 0x0000, %pil
	ta	T_CHANGE_NONHPRIV	! macro
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8d94e000  ! 89: WRPR_PSTATE_I	wrpr	%r19, 0x0000, %pstate
	.word 0x819fe000  ! 90: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
hwintr_1_3:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_3), 16, 16)) -> intp(1, 0, 2)
	.word 0x01000000  ! 91: NOP	nop
	.word 0x89952000  ! 92: WRPR_TICK_I	wrpr	%r20, 0x0000, %tick
	.word 0x819fe000  ! 93: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa3520000  ! 95: RDPR_PIL	<illegal instruction>
	.word 0xa5464000  ! 96: RDASR	rd	%-, %r18
	.word 0xa9494000  ! 97: RDHPR_HTBA	rdhpr	%htba, %r20
	.word 0x8f97a000  ! 98: WRPR_TL_I	wrpr	%r30, 0x0000, %tl
	.word 0xad846000  ! 99: WRASR_I	wr	%r17, 0x0000, %softint
	.word 0xa551c000  ! 100: RDPR_TL	<illegal instruction>
	.word 0xa7494000  ! 101: RDHPR_HTBA	rdhpr	%htba, %r19
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x879ce000  ! 103: WRHPR_HINTP_I	wrhpr	%r19, 0x0000, %hintp
	.word 0xa9518000  ! 104: RDPR_PSTATE	<illegal instruction>
	.word 0xad518000  ! 105: RDPR_PSTATE	<illegal instruction>
	.word 0xa948c000  ! 106: RDHPR_HINTP	rdhpr	%hintp, %r20
	.word 0x89956000  ! 107: WRPR_TICK_I	wrpr	%r21, 0x0000, %tick
	.word 0xab84a000  ! 108: WRASR_I	wr	%r18, 0x0000, %clear_softint
	.word 0xab464000  ! 109: RDASR	rd	%-, %r21
	.word 0xb184a000  ! 110: WRASR_I	wr	%r18, 0x0000, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f97a000  ! 112: WRPR_TL_I	wrpr	%r30, 0x0000, %tl
	ta	T_CHANGE_HPRIV	! macro
	.word 0xad84a000  ! 114: WRASR_I	wr	%r18, 0x0000, %softint
	.word 0xab51c000  ! 115: RDPR_TL	<illegal instruction>
	ta	T_CHANGE_NONPRIV	! macro
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8d952000  ! 118: WRPR_PSTATE_I	wrpr	%r20, 0x0000, %pstate
	.word 0x879ce000  ! 119: WRHPR_HINTP_I	wrhpr	%r19, 0x0000, %hintp
	.word 0xab464000  ! 120: RDASR	rd	%-, %r21
	.word 0xab464000  ! 121: RDASR	rd	%-, %r21
	.word 0xad484000  ! 122: RDHPR_HTSTATE	rdhpr	%htstate, %r22
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa9458000  ! 124: RDASR	rd	%softint, %r20
	.word 0xb185a000  ! 125: WRASR_I	wr	%r22, 0x0000, %-
	.word 0xa9444000  ! 126: RDASR	rd	%-, %r20
	.word 0x879ca000  ! 127: WRHPR_HINTP_I	wrhpr	%r18, 0x0000, %hintp
	.word 0xa9464000  ! 128: RDASR	rd	%-, %r20
	.word 0xab494000  ! 129: RDHPR_HTBA	rdhpr	%htba, %r21
	.word 0xad84a000  ! 130: WRASR_I	wr	%r18, 0x0000, %softint
	.word 0xa7440000  ! 131: RDASR	rd	%-, %r19
	.word 0x8d94a000  ! 132: WRPR_PSTATE_I	wrpr	%r18, 0x0000, %pstate
	.word 0xa984e000  ! 133: WRASR_I	wr	%r19, 0x0000, %set_softint
	.word 0x879ce000  ! 134: WRHPR_HINTP_I	wrhpr	%r19, 0x0000, %hintp
	.word 0x9194a000  ! 135: WRPR_PIL_I	wrpr	%r18, 0x0000, %pil
	.word 0x8d95a000  ! 136: WRPR_PSTATE_I	wrpr	%r22, 0x0000, %pstate
	.word 0x879c6000  ! 137: WRHPR_HINTP_I	wrhpr	%r17, 0x0000, %hintp
	ta	T_CHANGE_PRIV	! macro
	.word 0xa7440000  ! 139: RDASR	rd	%-, %r19
	ta	T_CHANGE_HPRIV	! macro
	.word 0x839fe000  ! 142: WRHPR_HTSTATE_I	wrhpr	%r31, 0x0000, %htstate
	ta	T_CHANGE_TO_TL1	! macro
	.word 0xa5520000  ! 143: RDPR_PIL	<illegal instruction>
	.word 0x8f97a000  ! 144: WRPR_TL_I	wrpr	%r30, 0x0000, %tl
	.word 0xa951c000  ! 145: RDPR_TL	<illegal instruction>
	.word 0xa748c000  ! 146: RDHPR_HINTP	rdhpr	%hintp, %r19
	ta	T_CHANGE_NONPRIV	! macro
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x89856000  ! 149: WRASR_I	wr	%r21, 0x0000, %tick
	.word 0x879ce000  ! 150: WRHPR_HINTP_I	wrhpr	%r19, 0x0000, %hintp
	.word 0xad464000  ! 151: RDASR	rd	%-, %r22
	.word 0x9194e000  ! 152: WRPR_PIL_I	wrpr	%r19, 0x0000, %pil
	.word 0xad440000  ! 153: RDASR	rd	%-, %r22
	.word 0x879d2000  ! 154: WRHPR_HINTP_I	wrhpr	%r20, 0x0000, %hintp
hwintr_1_4:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_4), 16, 16)) -> intp(1, 0, 2)
	.word 0x01000000  ! 155: NOP	nop
	.word 0x85952000  ! 157: WRPR_TSTATE_I	wrpr	%r20, 0x0000, %tstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xa9852000  ! 158: WRASR_I	wr	%r20, 0x0000, %set_softint
	.word 0xa3518000  ! 159: RDPR_PSTATE	<illegal instruction>
	.word 0x91956000  ! 160: WRPR_PIL_I	wrpr	%r21, 0x0000, %pil
	.word 0xa9514000  ! 161: RDPR_TBA	<illegal instruction>
	.word 0xa751c000  ! 162: RDPR_TL	<illegal instruction>
	.word 0xa9480000  ! 163: RDHPR_HPSTATE	rdhpr	%hpstate, %r20
	ta	T_CHANGE_NONHPRIV	! macro
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x819fe000  ! 166: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0xad500000  ! 168: RDPR_TPC	<illegal instruction>
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x89942000  ! 169: WRPR_TICK_I	wrpr	%r16, 0x0000, %tick
	.word 0xa7494000  ! 170: RDHPR_HTBA	rdhpr	%htba, %r19
	.word 0xa5540000  ! 171: RDPR_GL	<illegal instruction>
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8d946000  ! 173: WRPR_PSTATE_I	wrpr	%r17, 0x0000, %pstate
	.word 0xa3440000  ! 174: RDASR	rd	%-, %r17
	.word 0xa3518000  ! 175: RDPR_PSTATE	<illegal instruction>
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa5520000  ! 177: RDPR_PIL	<illegal instruction>
	.word 0xad518000  ! 178: RDPR_PSTATE	<illegal instruction>
	.word 0xa9518000  ! 179: RDPR_PSTATE	<illegal instruction>
	.word 0xa9852000  ! 180: WRASR_I	wr	%r20, 0x0000, %set_softint
	.word 0x879d2000  ! 181: WRHPR_HINTP_I	wrhpr	%r20, 0x0000, %hintp
	.word 0xad48c000  ! 182: RDHPR_HINTP	rdhpr	%hintp, %r22
	.word 0x8f97a000  ! 183: WRPR_TL_I	wrpr	%r30, 0x0000, %tl
	.word 0xa9458000  ! 184: RDASR	rd	%softint, %r20
	.word 0xa9444000  ! 185: RDASR	rd	%-, %r20
	.word 0xa945c000  ! 186: RDASR	rd	%-, %r20
hwintr_1_5:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_5), 16, 16)) -> intp(1, 0, 2)
	.word 0x01000000  ! 187: NOP	nop
	.word 0xab484000  ! 188: RDHPR_HTSTATE	rdhpr	%htstate, %r21
	.word 0x879c2000  ! 189: WRHPR_HINTP_I	wrhpr	%r16, 0x0000, %hintp
	.word 0xad458000  ! 190: RDASR	rd	%softint, %r22
	.word 0xa9484000  ! 191: RDHPR_HTSTATE	rdhpr	%htstate, %r20
	.word 0xab51c000  ! 192: RDPR_TL	<illegal instruction>
	.word 0xa9518000  ! 193: RDPR_PSTATE	<illegal instruction>
	.word 0xa1480000  ! 194: RDHPR_HPSTATE	rdhpr	%hpstate, %r16
	.word 0x8984a000  ! 195: WRASR_I	wr	%r18, 0x0000, %tick
	.word 0xa751c000  ! 196: RDPR_TL	<illegal instruction>
	.word 0x8984a000  ! 197: WRASR_I	wr	%r18, 0x0000, %tick
	.word 0xad464000  ! 198: RDASR	rd	%-, %r22
	.word 0xa748c000  ! 199: RDHPR_HINTP	rdhpr	%hintp, %r19
	.word 0x819fe000  ! 200: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0xa1540000  ! 201: RDPR_GL	<illegal instruction>
	ta	T_CHANGE_PRIV	! macro
	.word 0xa384a000  ! 203: WRASR_I	wr	%r18, 0x0000, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0x879d6000  ! 205: WRHPR_HINTP_I	wrhpr	%r21, 0x0000, %hintp
	.word 0x8994a000  ! 206: WRPR_TICK_I	wrpr	%r18, 0x0000, %tick
	.word 0xa385a000  ! 207: WRASR_I	wr	%r22, 0x0000, %-
	.word 0x9195a000  ! 208: WRPR_PIL_I	wrpr	%r22, 0x0000, %pil
	ta	T_CHANGE_HPRIV	! macro
	.word 0x819fe000  ! 210: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0x819fe000  ! 211: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0xa9856000  ! 213: WRASR_I	wr	%r21, 0x0000, %set_softint
	.word 0x91946000  ! 214: WRPR_PIL_I	wrpr	%r17, 0x0000, %pil
	.word 0xa7518000  ! 215: RDPR_PSTATE	<illegal instruction>
	.word 0x879da000  ! 216: WRHPR_HINTP_I	wrhpr	%r22, 0x0000, %hintp
	.word 0x8d946000  ! 217: WRPR_PSTATE_I	wrpr	%r17, 0x0000, %pstate
	.word 0x89852000  ! 218: WRASR_I	wr	%r20, 0x0000, %tick
	.word 0x8d942000  ! 219: WRPR_PSTATE_I	wrpr	%r16, 0x0000, %pstate
	.word 0x89856000  ! 220: WRASR_I	wr	%r21, 0x0000, %tick
	.word 0x879ca000  ! 221: WRHPR_HINTP_I	wrhpr	%r18, 0x0000, %hintp
	.word 0xa7540000  ! 222: RDPR_GL	<illegal instruction>
	.word 0xa7540000  ! 223: RDPR_GL	<illegal instruction>
	.word 0xa9440000  ! 224: RDASR	rd	%-, %r20
	.word 0x819fe000  ! 225: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0xa9514000  ! 226: RDPR_TBA	<illegal instruction>
	.word 0x819fe000  ! 227: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0xa5450000  ! 228: RDASR	rd	%set_softint, %r18
	.word 0xa751c000  ! 229: RDPR_TL	rdpr	%tl, %r19
	.word 0x819fe000  ! 230: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0xa5480000  ! 231: RDHPR_HPSTATE	rdhpr	%hpstate, %r18
	.word 0xa3856000  ! 232: WRASR_I	wr	%r21, 0x0000, %-
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa3440000  ! 234: RDASR	rd	%-, %r17
	.word 0xa5540000  ! 235: RDPR_GL	<illegal instruction>
	.word 0xa9540000  ! 236: RDPR_GL	<illegal instruction>
	.word 0x83942000  ! 238: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xa5440000  ! 239: RDASR	rd	%-, %r18
	.word 0x89946000  ! 240: WRPR_TICK_I	wrpr	%r17, 0x0000, %tick
	.word 0xa5440000  ! 241: RDASR	rd	%-, %r18
	.word 0x8d952000  ! 242: WRPR_PSTATE_I	wrpr	%r20, 0x0000, %pstate
	.word 0xb184e000  ! 243: WRASR_I	wr	%r19, 0x0000, %-
	.word 0x819fe000  ! 244: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
hwintr_1_6:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_6), 16, 16)) -> intp(1, 0, 2)
	.word 0x01000000  ! 245: NOP	nop
	.word 0xa984e000  ! 246: WRASR_I	wr	%r19, 0x0000, %set_softint
	.word 0xa7480000  ! 247: RDHPR_HPSTATE	rdhpr	%hpstate, %r19
	.word 0xa7520000  ! 248: RDPR_PIL	<illegal instruction>
	.word 0x819fe000  ! 249: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0x9194e000  ! 250: WRPR_PIL_I	wrpr	%r19, 0x0000, %pil
	.word 0xad518000  ! 251: RDPR_PSTATE	<illegal instruction>
	.word 0xa145c000  ! 252: RDASR	rd	%-, %r16
	.word 0xa1450000  ! 253: RDASR	rd	%set_softint, %r16
	ta	T_CHANGE_PRIV	! macro
	.word 0xa3504000  ! 256: RDPR_TNPC	<illegal instruction>
	ta	T_CHANGE_TO_TL1	! macro
	.word 0xad450000  ! 257: RDASR	rd	%set_softint, %r22
	.word 0x83942000  ! 259: WRPR_TNPC_I	wrpr	%r16, 0x0000, %tnpc
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xa9494000  ! 260: RDHPR_HTBA	rdhpr	%htba, %r20
	.word 0x8f97a000  ! 261: WRPR_TL_I	wrpr	%r30, 0x0000, %tl
	.word 0x8d942000  ! 262: WRPR_PSTATE_I	wrpr	%r16, 0x0000, %pstate
	.word 0xa9508000  ! 264: RDPR_TSTATE	<illegal instruction>
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8f97a000  ! 265: WRPR_TL_I	wrpr	%r30, 0x0000, %tl
	.word 0xa5444000  ! 266: RDASR	rd	%-, %r18
	.word 0xa1500000  ! 268: RDPR_TPC	<illegal instruction>
	ta	T_CHANGE_TO_TL0	! macro
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa5520000  ! 270: RDPR_PIL	<illegal instruction>
	.word 0xad454000  ! 271: RDASR	rd	%clear_softint, %r22
	.word 0x9194e000  ! 272: WRPR_PIL_I	wrpr	%r19, 0x0000, %pil
	.word 0xa9514000  ! 273: RDPR_TBA	<illegal instruction>
	.word 0xa5484000  ! 274: RDHPR_HTSTATE	rdhpr	%htstate, %r18
	.word 0xa348c000  ! 275: RDHPR_HINTP	rdhpr	%hintp, %r17
	ta	T_CHANGE_HPRIV	! macro
	.word 0x819fe000  ! 277: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0xa5444000  ! 278: RDASR	rd	%-, %r18
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x879ce000  ! 280: WRHPR_HINTP_I	wrhpr	%r19, 0x0000, %hintp
	ta	T_CHANGE_HPRIV	! macro
	.word 0xa5454000  ! 282: RDASR	rd	%clear_softint, %r18
	.word 0x879c2000  ! 283: WRHPR_HINTP_I	wrhpr	%r16, 0x0000, %hintp
	.word 0xa385a000  ! 284: WRASR_I	wr	%r22, 0x0000, %-
	.word 0xab48c000  ! 285: RDHPR_HINTP	rdhpr	%hintp, %r21
	.word 0x8f97a000  ! 286: WRPR_TL_I	wrpr	%r30, 0x0000, %tl
	.word 0x9195a000  ! 287: WRPR_PIL_I	wrpr	%r22, 0x0000, %pil
	.word 0xa945c000  ! 288: RDASR	rd	%-, %r20
	.word 0xa384e000  ! 289: WRASR_I	wr	%r19, 0x0000, %-
	ta	T_CHANGE_HPRIV	! macro
	.word 0x819fe000  ! 291: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0xa7518000  ! 292: RDPR_PSTATE	<illegal instruction>
	ta	T_CHANGE_NONPRIV	! macro
	ta	T_CHANGE_PRIV	! macro
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x819fe000  ! 296: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0xa348c000  ! 297: RDHPR_HINTP	rdhpr	%hintp, %r17
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa7518000  ! 299: RDPR_PSTATE	<illegal instruction>
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xb184e000  ! 301: WRASR_I	wr	%r19, 0x0000, %-
	.word 0xa3484000  ! 302: RDHPR_HTSTATE	rdhpr	%htstate, %r17
	.word 0xa5520000  ! 303: RDPR_PIL	<illegal instruction>
	.word 0x879d6000  ! 304: WRHPR_HINTP_I	wrhpr	%r21, 0x0000, %hintp
	.word 0xa1514000  ! 305: RDPR_TBA	<illegal instruction>
	.word 0xb184a000  ! 306: WRASR_I	wr	%r18, 0x0000, %-
	.word 0xa9450000  ! 307: RDASR	rd	%set_softint, %r20
	.word 0xab48c000  ! 308: RDHPR_HINTP	rdhpr	%hintp, %r21
	.word 0xa1464000  ! 309: RDASR	rd	%-, %r16
	.word 0x879da000  ! 310: WRHPR_HINTP_I	wrhpr	%r22, 0x0000, %hintp
	.word 0xad846000  ! 311: WRASR_I	wr	%r17, 0x0000, %softint
	.word 0xa145c000  ! 312: RDASR	rd	%-, %r16
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1444000  ! 314: RDASR	rd	%-, %r16
	.word 0x819fe000  ! 315: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0x89946000  ! 316: WRPR_TICK_I	wrpr	%r17, 0x0000, %tick
hwintr_1_7:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_7), 16, 16)) -> intp(1, 0, 2)
	.word 0x01000000  ! 317: NOP	nop
	.word 0xa5484000  ! 318: RDHPR_HTSTATE	rdhpr	%htstate, %r18
	.word 0xa1454000  ! 319: RDASR	rd	%clear_softint, %r16
	.word 0xa9842000  ! 320: WRASR_I	wr	%r16, 0x0000, %set_softint
	.word 0xa948c000  ! 321: RDHPR_HINTP	rdhpr	%hintp, %r20
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8395a000  ! 324: WRPR_TNPC_I	wrpr	%r22, 0x0000, %tnpc
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x819fe000  ! 325: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0xa5454000  ! 326: RDASR	rd	%clear_softint, %r18
	.word 0xa751c000  ! 327: RDPR_TL	<illegal instruction>
	.word 0x89856000  ! 328: WRASR_I	wr	%r21, 0x0000, %tick
	.word 0x879d6000  ! 329: WRHPR_HINTP_I	wrhpr	%r21, 0x0000, %hintp
	.word 0xa9520000  ! 330: RDPR_PIL	<illegal instruction>
	.word 0xa9444000  ! 331: RDASR	rd	%-, %r20
	.word 0xab856000  ! 332: WRASR_I	wr	%r21, 0x0000, %clear_softint
	.word 0xa9440000  ! 333: RDASR	rd	%-, %r20
	ta	T_CHANGE_NONPRIV	! macro
hwintr_1_8:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_8), 16, 16)) -> intp(1, 0, 2)
	.word 0x01000000  ! 335: NOP	nop
	.word 0xa9440000  ! 336: RDASR	rd	%-, %r20
	.word 0xa9450000  ! 337: RDASR	rd	%set_softint, %r20
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa951c000  ! 339: RDPR_TL	<illegal instruction>
	.word 0x8594a000  ! 341: WRPR_TSTATE_I	wrpr	%r18, 0x0000, %tstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xa7464000  ! 342: RDASR	rd	%-, %r19
	ta	T_CHANGE_HPRIV	! macro
	.word 0xa7440000  ! 344: RDASR	rd	%-, %r19
	.word 0x8994a000  ! 345: WRPR_TICK_I	wrpr	%r18, 0x0000, %tick
	.word 0xa3520000  ! 346: RDPR_PIL	<illegal instruction>
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1484000  ! 348: RDHPR_HTSTATE	rdhpr	%htstate, %r16
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa548c000  ! 350: RDHPR_HINTP	rdhpr	%hintp, %r18
	ta	T_CHANGE_HPRIV	! macro
	ta	T_CHANGE_NONPRIV	! macro
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa9458000  ! 354: RDASR	rd	%softint, %r20
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa7494000  ! 356: RDHPR_HTBA	rdhpr	%htba, %r19
	.word 0xa9480000  ! 357: RDHPR_HPSTATE	rdhpr	%hpstate, %r20
	ta	T_CHANGE_NONPRIV	! macro
	ta	T_CHANGE_NONPRIV	! macro
	ta	T_CHANGE_HPRIV	! macro
	.word 0xa7514000  ! 361: RDPR_TBA	<illegal instruction>
	.word 0x879d6000  ! 362: WRHPR_HINTP_I	wrhpr	%r21, 0x0000, %hintp
	.word 0x89852000  ! 363: WRASR_I	wr	%r20, 0x0000, %tick
	.word 0x8995a000  ! 364: WRPR_TICK_I	wrpr	%r22, 0x0000, %tick
	.word 0xa3484000  ! 365: RDHPR_HTSTATE	rdhpr	%htstate, %r17
	.word 0xa1484000  ! 366: RDHPR_HTSTATE	rdhpr	%htstate, %r16
hwintr_1_9:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_9), 16, 16)) -> intp(1, 0, 2)
	.word 0x01000000  ! 367: NOP	nop
	.word 0xa1440000  ! 368: RDASR	rd	%-, %r16
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa9842000  ! 370: WRASR_I	wr	%r16, 0x0000, %set_softint
	.word 0x8f97a000  ! 371: WRPR_TL_I	wrpr	%r30, 0x0000, %tl
	ta	T_CHANGE_PRIV	! macro
	.word 0x91946000  ! 373: WRPR_PIL_I	wrpr	%r17, 0x0000, %pil
	.word 0x8984e000  ! 374: WRASR_I	wr	%r19, 0x0000, %tick
	ta	T_CHANGE_NONPRIV	! macro
	ta	T_CHANGE_PRIV	! macro
	.word 0x879d6000  ! 377: WRHPR_HINTP_I	wrhpr	%r21, 0x0000, %hintp
	.word 0xa1458000  ! 378: RDASR	rd	%softint, %r16
	.word 0xa1480000  ! 379: RDHPR_HPSTATE	rdhpr	%hpstate, %r16
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa3494000  ! 381: RDHPR_HTBA	rdhpr	%htba, %r17
	.word 0xa1454000  ! 382: RDASR	rd	%clear_softint, %r16
	.word 0x819fe000  ! 383: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0xa9852000  ! 384: WRASR_I	wr	%r20, 0x0000, %set_softint
	ta	T_CHANGE_HPRIV	! macro
	.word 0x879d2000  ! 386: WRHPR_HINTP_I	wrhpr	%r20, 0x0000, %hintp
	.word 0xa7540000  ! 387: RDPR_GL	<illegal instruction>
	.word 0x8d94a000  ! 388: WRPR_PSTATE_I	wrpr	%r18, 0x0000, %pstate
	.word 0xab454000  ! 389: RDASR	rd	%clear_softint, %r21
	.word 0xab852000  ! 390: WRASR_I	wr	%r20, 0x0000, %clear_softint
	.word 0x819fe000  ! 391: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0x89852000  ! 392: WRASR_I	wr	%r20, 0x0000, %tick
	.word 0xab520000  ! 393: RDPR_PIL	<illegal instruction>
	.word 0xa9852000  ! 394: WRASR_I	wr	%r20, 0x0000, %set_softint
	.word 0x819fe000  ! 395: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x879da000  ! 397: WRHPR_HINTP_I	wrhpr	%r22, 0x0000, %hintp
	.word 0xa9480000  ! 398: RDHPR_HPSTATE	rdhpr	%hpstate, %r20
	.word 0x89956000  ! 399: WRPR_TICK_I	wrpr	%r21, 0x0000, %tick
	.word 0xa9458000  ! 400: RDASR	rd	%softint, %r20
hwintr_1_10:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_10), 16, 16)) -> intp(1, 0, 2)
	.word 0x01000000  ! 401: NOP	nop
	.word 0xa9454000  ! 402: RDASR	rd	%clear_softint, %r20
	.word 0xa3520000  ! 403: RDPR_PIL	<illegal instruction>
	.word 0xa9540000  ! 404: RDPR_GL	<illegal instruction>
	.word 0x8d94e000  ! 405: WRPR_PSTATE_I	wrpr	%r19, 0x0000, %pstate
hwintr_1_11:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_11), 16, 16)) -> intp(1, 0, 2)
	.word 0x01000000  ! 406: NOP	nop
	.word 0xab450000  ! 407: RDASR	rd	%set_softint, %r21
	.word 0xab458000  ! 408: RDASR	rd	%softint, %r21
	.word 0x819fe000  ! 409: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0x89852000  ! 410: WRASR_I	wr	%r20, 0x0000, %tick
	.word 0xab444000  ! 411: RDASR	rd	%-, %r21
	.word 0xad484000  ! 412: RDHPR_HTSTATE	rdhpr	%htstate, %r22
	.word 0xa748c000  ! 413: RDHPR_HINTP	rdhpr	%hintp, %r19
	ta	T_CHANGE_PRIV	! macro
	.word 0xad480000  ! 415: RDHPR_HPSTATE	rdhpr	%hpstate, %r22
	ta	T_CHANGE_PRIV	! macro
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x879ce000  ! 418: WRHPR_HINTP_I	wrhpr	%r19, 0x0000, %hintp
	.word 0x8f97a000  ! 419: WRPR_TL_I	wrpr	%r30, 0x0000, %tl
	.word 0xa3856000  ! 420: WRASR_I	wr	%r21, 0x0000, %-
	ta	T_CHANGE_NONHPRIV	! macro
	ta	T_CHANGE_PRIV	! macro
	.word 0x87942000  ! 424: WRPR_TT_I	wrpr	%r16, 0x0000, %tt
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xad494000  ! 425: RDHPR_HTBA	rdhpr	%htba, %r22
	.word 0xa9856000  ! 426: WRASR_I	wr	%r21, 0x0000, %set_softint
	.word 0xa1440000  ! 427: RDASR	rd	%-, %r16
	.word 0x879c6000  ! 428: WRHPR_HINTP_I	wrhpr	%r17, 0x0000, %hintp
	.word 0xa9518000  ! 429: RDPR_PSTATE	<illegal instruction>
	.word 0xa3520000  ! 430: RDPR_PIL	<illegal instruction>
	ta	T_CHANGE_PRIV	! macro
	.word 0xab514000  ! 432: RDPR_TBA	<illegal instruction>
hwintr_1_12:
!$EV trig_pc_d(1,expr(@VA(.MAIN.hwintr_1_12), 16, 16)) -> intp(1, 0, 2)
	.word 0x01000000  ! 433: NOP	nop
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91942000  ! 435: WRPR_PIL_I	wrpr	%r16, 0x0000, %pil
	.word 0x89952000  ! 436: WRPR_TICK_I	wrpr	%r20, 0x0000, %tick
	.word 0x91946000  ! 437: WRPR_PIL_I	wrpr	%r17, 0x0000, %pil
	.word 0xa5518000  ! 438: RDPR_PSTATE	<illegal instruction>
	.word 0x879d6000  ! 439: WRHPR_HINTP_I	wrhpr	%r21, 0x0000, %hintp
	.word 0x819fe000  ! 440: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0xab458000  ! 441: RDASR	rd	%softint, %r21
	.word 0x89846000  ! 442: WRASR_I	wr	%r17, 0x0000, %tick
	.word 0xab440000  ! 443: RDASR	rd	%-, %r21
	.word 0xa1484000  ! 444: RDHPR_HTSTATE	rdhpr	%htstate, %r16
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x819fe000  ! 446: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0xa3480000  ! 447: RDHPR_HPSTATE	rdhpr	%hpstate, %r17
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa3520000  ! 449: RDPR_PIL	<illegal instruction>
	.word 0xb1846000  ! 450: WRASR_I	wr	%r17, 0x0000, %-
	.word 0x819fe000  ! 451: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0xa3846000  ! 452: WRASR_I	wr	%r17, 0x0000, %-
	.word 0xab444000  ! 453: RDASR	rd	%-, %r21
	.word 0xa1520000  ! 454: RDPR_PIL	<illegal instruction>
	.word 0x8d95a000  ! 455: WRPR_PSTATE_I	wrpr	%r22, 0x0000, %pstate
	.word 0xa5520000  ! 456: RDPR_PIL	<illegal instruction>
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa945c000  ! 458: RDASR	rd	%-, %r20
	.word 0x8d942000  ! 459: WRPR_PSTATE_I	wrpr	%r16, 0x0000, %pstate
	.word 0x8f96e000  ! 460: WRPR_TL_I	wrpr	%r27, 0x0000, %tl
	.word 0xab856000  ! 461: WRASR_I	wr	%r21, 0x0000, %clear_softint
	.word 0xa9464000  ! 462: RDASR	rd	%-, %r20
	ta	T_CHANGE_NONPRIV	! macro
	ta	T_CHANGE_HPRIV	! macro
	.word 0xab514000  ! 465: RDPR_TBA	<illegal instruction>
	.word 0xab484000  ! 466: RDHPR_HTSTATE	rdhpr	%htstate, %r21
	.word 0x879d2000  ! 467: WRHPR_HINTP_I	wrhpr	%r20, 0x0000, %hintp
	.word 0x8f962000  ! 468: WRPR_TL_I	wrpr	%r24, 0x0000, %tl
	.word 0x8994a000  ! 469: WRPR_TICK_I	wrpr	%r18, 0x0000, %tick
	.word 0xad518000  ! 470: RDPR_PSTATE	<illegal instruction>
	.word 0xad540000  ! 471: RDPR_GL	<illegal instruction>
	.word 0xa1514000  ! 472: RDPR_TBA	<illegal instruction>
	.word 0xa5494000  ! 473: RDHPR_HTBA	rdhpr	%htba, %r18
	.word 0x8f966000  ! 474: WRPR_TL_I	wrpr	%r25, 0x0000, %tl
	.word 0x819fe000  ! 475: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0x839fe000  ! 477: WRHPR_HTSTATE_I	wrhpr	%r31, 0x0000, %htstate
	ta	T_CHANGE_TO_TL0	! macro
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f97a000  ! 479: WRPR_TL_I	wrpr	%r30, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91942000  ! 481: WRPR_PIL_I	wrpr	%r16, 0x0000, %pil
	.word 0xb1852000  ! 482: WRASR_I	wr	%r20, 0x0000, %-
	.word 0xa350c000  ! 484: RDPR_TT	<illegal instruction>
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x879c6000  ! 485: WRHPR_HINTP_I	wrhpr	%r17, 0x0000, %hintp
	.word 0xa5480000  ! 486: RDHPR_HPSTATE	rdhpr	%hpstate, %r18
	ta	T_CHANGE_PRIV	! macro
	.word 0xab458000  ! 488: RDASR	rd	%softint, %r21
	.word 0xa3846000  ! 489: WRASR_I	wr	%r17, 0x0000, %-
	.word 0x819fe000  ! 490: WRHPR_HPSTATE_I	wrhpr	%r31, 0x0000, %hpstate
	.word 0xa9508000  ! 492: RDPR_TSTATE	<illegal instruction>
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xa1504000  ! 494: RDPR_TNPC	<illegal instruction>
	ta	T_CHANGE_TO_TL1	! macro
	ta	T_CHANGE_PRIV	! macro
	.word 0xad494000  ! 496: RDHPR_HTBA	rdhpr	%htba, %r22
	.word 0x89942000  ! 497: WRPR_TICK_I	wrpr	%r16, 0x0000, %tick
	.word 0x879da000  ! 498: WRHPR_HINTP_I	wrhpr	%r22, 0x0000, %hintp
	.word 0xad444000  ! 499: RDASR	rd	%-, %r22

join_lbl_0_0:
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 4, 16, 16)) -> intp(1, 1, 1)
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 8, 16, 16)) -> intp(2, 1, 1)
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 12, 16, 16)) -> intp(3, 1, 1)
	.data
data_start:

	.xword	0x957458e80000db6f
	.xword	0xb7fc30eb00002bd1
	.xword	0x883e0e260000c96c
	.xword	0x16ad2bb900000c51
	.xword	0xbad87eec0000f9c7
	.xword	0x9ff56eaf0000caf7
	.xword	0xb790826a00003f03
	.xword	0x32f75b410000be1f
	.xword	0x5ea5ac8e00001d48
	.xword	0x972667bf00001efd
	.xword	0x77e65a110000bfe0
	.xword	0xaca96e7d0000fe50
	.xword	0x9e8c69c90000e90a
	.xword	0xcf95740000003cdd
	.xword	0xa1e7630d00003e45
	.xword	0xfaa712bf00001c0c



.text
	ta	T_GOOD_TRAP
	nop

.data
	.xword 0x1234567887654321

#if 0
!!# /* File:	tlu_tlz_trap_1.j
!!#  * Description:
!!#  */
!!# 
!!# template main ();
!!# 
!!# 
!!# %%section c_declarations
!!# 
!!#   int loop_cnt = 0;
!!# 
!!# %%section init
!!# 
!!#   IJ_bind_thread_group(th_all,    0xf);
!!# 
!!#   IJ_set_rvar (Rv_intr_vect, "5'brrrrr");
!!# 
!!#   IJ_set_rvar (Rv_low_wt, "{1}");
!!#   IJ_set_rvar (Rv_mid_wt, "{8}");
!!#   IJ_set_default_rule_wt_rvar ( "{16}" );
!!# 
!!#   IJ_set_rvar (Rv_rand64, "48'hrrrr rrrr rrrr," "16'brrrr 1rrr rrrr rrrr");
!!#   IJ_set_rvar (Rv_tlval, "3'b0ii");
!!# 
!!#   IJ_set_ropr_fld (ijdefault, Ft_Rs1, "{16..22}");
!!#   IJ_set_ropr_fld (ijdefault, Ft_Rs2, "{0}");
!!#   IJ_set_ropr_fld (ijdefault, Ft_Simm13, "13'b0 0000 0000 0000");
!!#   IJ_set_ropr_fld (ijdefault, Ft_Rd, "{16..22}");
!!# 
!!#   IJ_set_ropr_fld (Rwr_tl, Ft_Rs1, "{23..29:1, 30:7}");
!!#   IJ_set_ropr_fld (Rwr_hpstate, Ft_Rs1, "{31}");
!!#   IJ_set_ropr_fld (Rrd_reg_asr, Ft_Rs1, "{0x10, 0x11, 0x14, 0x15, 0x16, 0x17, 0x19}");
!!#   IJ_set_ropr_fld (Rwr_reg_asr, Ft_Rd,  "{0x4, 0x11, 0x14, 0x15, 0x16, 0x18}");
!!# 
!!#   IJ_init_regs_by_setx (th_all, 1, 0, Rv_rand64);
!!#   IJ_printf (th_all, "\tsetx\tdata_start, %%r1, %%r25\n");
!!# 
!!#   IJ_printf (th_all, "\tsetx\t0xc05, %%r1, %%r0\n");
!!#   IJ_printf (th_all, "\tsetx\t0xc05, %%r1, %%r31\n");
!!#   IJ_printf (th_all, "\tmov\t0x%rx, %%r23\n", Rv_tlval);
!!#   IJ_printf (th_all, "\tmov\t0x%rx, %%r24\n", Rv_tlval);
!!#   IJ_printf (th_all, "\tmov\t0x%rx, %%r25\n", Rv_tlval);
!!#   IJ_printf (th_all, "\tmov\t0x%rx, %%r26\n", Rv_tlval);
!!#   IJ_printf (th_all, "\tmov\t0x%rx, %%r27\n", Rv_tlval);
!!#   IJ_printf (th_all, "\tmov\t0x%rx, %%r28\n", Rv_tlval);
!!#   IJ_printf (th_all, "\tmov\t0x%rx, %%r29\n", Rv_tlval);
!!#   IJ_printf (th_all, "\tmov\t0x%rx, %%r30\n", Rv_tlval);
!!# 
!!#   IJ_th_fork(0x2, 0x4, 0x8);
!!# 
!!#   return 0;
!!# 	
!!# %%section finish
!!# 
!!#   int i, j;
!!# 
!!#   IJ_th_join(0xf);
!!#   IJ_th_start (Seq_Start, NULL, 1);
!!# 
!!#   IJ_printf (th_all, "\t.data\ndata_start:\n\n");
!!#   for (i = 0; i < 16; i++) {
!!# 		IJ_printf  (th_all,"\t.xword\t0x%016llrx\n", Rv_rand64);
!!#   }
!!# 
!!# %%section diag_ini
!!# 
!!# #define PCONTEXT	0x10
!!# #define SCONTEXT	0x10
!!# 
!!# #define MAIN_PAGE_NUCLEUS_ALSO
!!# #define MAIN_PAGE_HV_ALSO
!!# 
!!# #define ALL_MY_INTR_HANDLERS
!!# #include "my_intr_handlers.s"
!!# #include "my_trap_handlers.s"
!!# 
!!# #define H_HT0_Reserved_0x5f
!!# #define My_HT0_Reserved_0x5f \
!!# 	rdhpr	%hpstate, %g7; \
!!# 	wrhpr	%g7, 1, %hpstate; \
!!# 	rdhpr	%htstate, %g7; \
!!# 	wrhpr	%g7, 1, %htstate; \
!!# 	mov	55, %r20; \
!!# 	done; \
!!# 	nop; \
!!# 	nop
!!# 
!!# #include "enable_traps.h"
!!# #include "boot.s"
!!# 
!!# .text
!!# .global main
!!# 
!!# main:
!!# 
!!# %%section diag_fini
!!# 
!!# .text
!!# 	ta	T_GOOD_TRAP
!!# 	nop
!!# 
!!# .data
!!# 	.xword 0x1234567887654321
!!# 
!!# %%section grammar
!!# 
!!# inst_block: inst_type
!!# 	| inst_block inst_type
!!# 	{
!!# 		IJ_generate (th_all, $2);
!!# 	}
!!# ;
!!# 
!!# 
!!# inst_type: 
!!# 	read_asr 
!!# 	| write_asr 
!!# 	| hw_intr %rvar Rv_low_wt
!!# 	| tCHANGE_TO_TL1 rd_tsa_asr %rvar Rv_low_wt
!!# 	{
!!# 		IJ_generate (th_all, $2);
!!# 	}
!!# 	| tCHANGE_TO_TL1 wr_tsa_asr %rvar Rv_low_wt
!!# 	{
!!# 		IJ_generate (th_all, $2);
!!# 	}
!!# 	| tCHANGE_TO_TL0 rd_tsa_asr %rvar Rv_low_wt
!!# 	{
!!# 		IJ_generate (th_all, $2);
!!# 	}
!!# 	| tCHANGE_TO_TL0 wr_tsa_asr %rvar Rv_low_wt
!!# 	{
!!# 		IJ_generate (th_all, $2);
!!# 	}
!!# 	| change_priv %rvar Rv_mid_wt
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
!!# 	tRDASR %ropr Rrd_reg_asr
!!# ;
!!# 
!!# wr_reg_asr: 
!!# 	tWRASR_I %ropr Rwr_reg_asr
!!# ;
!!# 
!!# rd_hpriv_asr: 
!!# 	tRDHPR_HPSTATE 
!!# 	| tRDHPR_HTSTATE
!!# 	| tRDHPR_HINTP
!!# 	| tRDHPR_HTBA
!!# ;
!!# 
!!# wr_hpriv_asr: 
!!# 	tWRHPR_HINTP_I
!!# 	| tWRHPR_HPSTATE_I %ropr Rwr_hpstate
!!# ;
!!# 
!!# rd_priv_asr: 
!!# 	tRDPR_TBA 
!!# 	| tRDPR_PSTATE 
!!# 	| tRDPR_TL 
!!# 	| tRDPR_PIL 
!!# 	| tRDPR_GL 
!!# ;
!!# 
!!# wr_priv_asr: 
!!# 	tWRPR_TICK_I
!!# 	| tWRPR_PSTATE_I 
!!# 	| tWRPR_TL_I %ropr Rwr_tl
!!# 	| tWRPR_PIL_I 
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
!!# 	tWRHPR_HTSTATE_I %ropr Rwr_hpstate
!!# 	| tWRPR_TPC_I 
!!# 	| tWRPR_TNPC_I 
!!# 	| tWRPR_TSTATE_I 
!!# 	| tWRPR_TT_I 
!!# ;
!!# 
!!# change_priv: 
!!# 	tCHANGE_NONPRIV 
!!# 	| tCHANGE_PRIV 
!!# 	| tCHANGE_NONHPRIV 
!!# 	| tCHANGE_HPRIV 
!!# ;
!!# 
!!# hw_intr: tNOP
!!# 	{
!!#           IJ_printf (th_all, "hwintr_%y_%d:\n", loop_cnt);
!!# 	  IJ_printf (th_all, "!$EV trig_pc_d(%y,expr(@VA(.MAIN.hwintr_%y_%d), 16, 16)) -> intp(%y, 0, %d)\n", loop_cnt, Rv_intr_vect);
!!#           loop_cnt++;
!!# 	} ;
!!# 
!!# %%
!!# 
!!# endtemplate
#endif

