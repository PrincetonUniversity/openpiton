// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tlu_asr_access_hl_1_rand_s1.s
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
   random seed:	300109863
   Jal tlu_asr_access_hl_1.j:	
********************************************************************************/



#define PCONTEXT	0x10
#define SCONTEXT	0x10

#define MAIN_PAGE_NUCLEUS_ALSO
#define MAIN_PAGE_HV_ALSO

#define HPV_NONSPLIT_MODE

#define ALL_MY_INTR_HANDLERS
#include "my_intr_handlers.s"
#include "my_trap_handlers.s"
#include "tlu_custom_trap_handlers.s"

#include "enable_traps.h"
#include "boot.s"

.text
.global main

main:

! Register init code

	setx 0xe1412db500001359, %g1, %g0
	setx 0x97b2f109000095d0, %g1, %g1
	setx 0xbd73569100009515, %g1, %g2
	setx 0xba908b1a0000c095, %g1, %g3
	setx 0xae1a60e300002100, %g1, %g4
	setx 0xac299eb800009350, %g1, %g5
	setx 0xcac5caea00003697, %g1, %g6
	setx 0x7473c6cc00007747, %g1, %g7
	setx 0xd3f4e6ed0000f085, %g1, %r16
	setx 0x13163b7e0000d645, %g1, %r17
	setx 0x956df547000007dd, %g1, %r18
	setx 0xf53ef09b00005441, %g1, %r19
	setx 0x00eaeb590000515a, %g1, %r20
	setx 0x1eddaace0000b68b, %g1, %r21
	setx 0x1c9df0c10000031e, %g1, %r22
	setx 0xb97b8f680000d04f, %g1, %r23
	setx 0x243bd9cd00006593, %g1, %r24
	setx 0xef7f51070000b3ca, %g1, %r25
	setx 0x06bdee7400001086, %g1, %r26
	setx 0xe8fd4f5f0000c145, %g1, %r27
	setx 0xe7b355f400005540, %g1, %r28
	setx 0xd4b3ae9200006707, %g1, %r29
	setx 0xdc2af59a000023d4, %g1, %r30
	setx 0x41cc3721000055db, %g1, %r31
	ta	T_CHANGE_TO_TL1
	.word 0xbb480000  ! 1: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0x839d27cf  ! 2: WRHPR_HTSTATE_I	wrhpr	%r20, 0x07cf, %htstate
	.word 0xb18527cf  ! 3: WRASR_I	wr	%r20, 0x07cf, %-
	.word 0x839d770f  ! 4: WRHPR_HTSTATE_I	wrhpr	%r21, 0x170f, %htstate
	.word 0xb9494000  ! 5: RDHPR_HTBA	rdhpr	%htba, %r28
	.word 0xad85770f  ! 6: WRASR_I	wr	%r21, 0x170f, %softint
	.word 0x8594e449  ! 7: WRPR_TSTATE_I	wrpr	%r19, 0x0449, %tstate
	.word 0x8794f68c  ! 8: WRPR_TT_I	wrpr	%r19, 0x168c, %tt
	.word 0x8594f283  ! 9: WRPR_TSTATE_I	wrpr	%r19, 0x1283, %tstate
	.word 0xa195b608  ! 10: WRPR_GL_I	wrpr	%r22, 0x1608, %-
	.word 0xb9464000  ! 11: RDASR	rd	%-, %r28
	.word 0xb5510000  ! 12: RDPR_TICK	rdpr	%tick, %r26
	.word 0x8985b608  ! 13: WRASR_I	wr	%r22, 0x1608, %tick
	.word 0x839d7714  ! 14: WRHPR_HTSTATE_I	wrhpr	%r21, 0x1714, %htstate
	setx	0x34d8470400000298, %r1, %r18
	.word 0xb3480000  ! 16: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0x839db6d4  ! 17: WRHPR_HTSTATE_I	wrhpr	%r22, 0x16d4, %htstate
	.word 0x8985b6d4  ! 18: WRASR_I	wr	%r22, 0x16d4, %tick
	.word 0xb3518000  ! 19: RDPR_PSTATE	rdpr	%pstate, %r25
	.word 0xb3484000  ! 20: RDHPR_HTSTATE	rdhpr	%htstate, %r25
	.word 0x819db7d9  ! 21: WRHPR_HPSTATE_I	wrhpr	%r22, 0x17d9, %hpstate
	.word 0x899423c4  ! 22: WRPR_TICK_I	wrpr	%r16, 0x03c4, %tick
	.word 0xb1500000  ! 23: RDPR_TPC	rdpr	%tpc, %r24
	.word 0x819df75e  ! 24: WRHPR_HPSTATE_I	wrhpr	%r23, 0x175e, %hpstate
	.word 0x819c35c4  ! 25: WRHPR_HPSTATE_I	wrhpr	%r16, 0x15c4, %hpstate
	.word 0xb148c000  ! 26: RDHPR_HINTP	rdhpr	%hintp, %r24
	.word 0x8795f7de  ! 27: WRPR_TT_I	wrpr	%r23, 0x17de, %tt
	.word 0xbf51c000  ! 28: RDPR_TL	rdpr	%tl, %r31
	.word 0xbf444000  ! 29: RDASR	rd	%-, %r31
	.word 0xa385f7de  ! 30: WRASR_I	wr	%r23, 0x17de, %-
	.word 0x8d95f2c4  ! 31: WRPR_PSTATE_I	wrpr	%r23, 0x12c4, %pstate
	setx	0xf997e6910000f28b, %r1, %r21
	.word 0xb5540000  ! 33: RDPR_GL	rdpr	%-, %r26
	.word 0xbd48c000  ! 34: RDHPR_HINTP	rdhpr	%hintp, %r30
	.word 0xb185f2c4  ! 35: WRASR_I	wr	%r23, 0x12c4, %-
	.word 0x819da297  ! 36: WRHPR_HPSTATE_I	wrhpr	%r22, 0x0297, %hpstate
	.word 0xb750c000  ! 37: RDPR_TT	rdpr	%tt, %r27
	.word 0xbd500000  ! 38: RDPR_TPC	<illegal instruction>
	.word 0x85947756  ! 39: WRPR_TSTATE_I	wrpr	%r17, 0x1756, %tstate
	.word 0x819d6510  ! 40: WRHPR_HPSTATE_I	wrhpr	%r21, 0x0510, %hpstate
	.word 0xbd45c000  ! 41: RDASR	rd	%-, %r30
	.word 0x9194a549  ! 42: WRPR_PIL_I	wrpr	%r18, 0x0549, %pil
	.word 0xbd450000  ! 43: RDASR	rd	%set_softint, %r30
	.word 0xb3504000  ! 44: RDPR_TNPC	rdpr	%tnpc, %r25
	.word 0xb5484000  ! 45: RDHPR_HTSTATE	rdhpr	%htstate, %r26
	.word 0xbb48c000  ! 46: RDHPR_HINTP	rdhpr	%hintp, %r29
	.word 0xbf480000  ! 47: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xbd480000  ! 48: RDHPR_HPSTATE	rdhpr	%hpstate, %r30
	.word 0xa384a549  ! 49: WRASR_I	wr	%r18, 0x0549, %-
	setx	0xdfb254d3000005d9, %r1, %r23
	.word 0x8984a549  ! 51: WRASR_I	wr	%r18, 0x0549, %tick
	.word 0xb1514000  ! 52: RDPR_TBA	rdpr	%tba, %r24
	.word 0xb9540000  ! 53: RDPR_GL	<illegal instruction>
	.word 0xa1947796  ! 54: WRPR_GL_I	wrpr	%r17, 0x1796, %-
	.word 0x8d95e110  ! 55: WRPR_PSTATE_I	wrpr	%r23, 0x0110, %pstate
	.word 0xb1510000  ! 56: RDPR_TICK	rdpr	%tick, %r24
	.word 0x9194e407  ! 57: WRPR_PIL_I	wrpr	%r19, 0x0407, %pil
	.word 0xb1444000  ! 58: RDASR	rd	%-, %r24
	setx	0x8ea8c0830000e2d6, %r1, %r23
	.word 0xb1410000  ! 60: RDASR	rd	%tick, %r24
	.word 0x839da05a  ! 61: WRHPR_HTSTATE_I	wrhpr	%r22, 0x005a, %htstate
	.word 0xb9508000  ! 62: RDPR_TSTATE	rdpr	%tstate, %r28
	.word 0x8995b789  ! 63: WRPR_TICK_I	wrpr	%r22, 0x1789, %tick
	.word 0xbd514000  ! 64: RDPR_TBA	rdpr	%tba, %r30
	.word 0xb3520000  ! 65: RDPR_PIL	<illegal instruction>
	.word 0xb748c000  ! 66: RDHPR_HINTP	rdhpr	%hintp, %r27
	.word 0xb1494000  ! 67: RDHPR_HTBA	rdhpr	%htba, %r24
	.word 0x8994e59b  ! 68: WRPR_TICK_I	wrpr	%r19, 0x059b, %tick
	.word 0x819de1d0  ! 69: WRHPR_HPSTATE_I	wrhpr	%r23, 0x01d0, %hpstate
	.word 0x819c73c9  ! 70: WRHPR_HPSTATE_I	wrhpr	%r17, 0x13c9, %hpstate
	.word 0xbb508000  ! 71: RDPR_TSTATE	rdpr	%tstate, %r29
	setx	0x82c6f6da00008553, %r1, %r20
	.word 0x9195f68a  ! 73: WRPR_PIL_I	wrpr	%r23, 0x168a, %pil
	.word 0xbf48c000  ! 74: RDHPR_HINTP	rdhpr	%hintp, %r31
	setx	0x8029a57700005208, %r1, %r19
	.word 0x8595e190  ! 76: WRPR_TSTATE_I	wrpr	%r23, 0x0190, %tstate
	.word 0xb1484000  ! 77: RDHPR_HTSTATE	rdhpr	%htstate, %r24
	.word 0x89947390  ! 78: WRPR_TICK_I	wrpr	%r17, 0x1390, %tick
	.word 0xb3514000  ! 79: RDPR_TBA	rdpr	%tba, %r25
	.word 0xb3444000  ! 80: RDASR	rd	%-, %r25
	.word 0x8995750b  ! 81: WRPR_TICK_I	wrpr	%r21, 0x150b, %tick
	.word 0x819c3180  ! 82: WRHPR_HPSTATE_I	wrhpr	%r16, 0x1180, %hpstate
	.word 0xb3458000  ! 83: RDASR	rd	%softint, %r25
	.word 0xbb494000  ! 84: RDHPR_HTBA	rdhpr	%htba, %r29
	.word 0xb9514000  ! 85: RDPR_TBA	<illegal instruction>
	.word 0x89843180  ! 86: WRASR_I	wr	%r16, 0x1180, %tick
	.word 0xbb48c000  ! 87: RDHPR_HINTP	rdhpr	%hintp, %r29
	.word 0xb5514000  ! 88: RDPR_TBA	<illegal instruction>
	.word 0x819cb306  ! 89: WRHPR_HPSTATE_I	wrhpr	%r18, 0x1306, %hpstate
	.word 0xa384b306  ! 90: WRASR_I	wr	%r18, 0x1306, %-
	.word 0xb1504000  ! 91: RDPR_TNPC	<illegal instruction>
	.word 0xb1458000  ! 92: RDASR	rd	%softint, %r24
	setx	0xa79839ad000086c3, %r1, %r21
	.word 0xb948c000  ! 94: RDHPR_HINTP	rdhpr	%hintp, %r28
	.word 0x839d245d  ! 95: WRHPR_HTSTATE_I	wrhpr	%r20, 0x045d, %htstate
	.word 0x819de688  ! 96: WRHPR_HPSTATE_I	wrhpr	%r23, 0x0688, %hpstate
	.word 0xbf504000  ! 97: RDPR_TNPC	rdpr	%tnpc, %r31
	.word 0xb3514000  ! 98: RDPR_TBA	rdpr	%tba, %r25
	.word 0xbb540000  ! 99: RDPR_GL	<illegal instruction>
	.word 0x8d95769e  ! 100: WRPR_PSTATE_I	wrpr	%r21, 0x169e, %pstate
	setx	0x9723c6d20000d0cf, %r1, %r22
	.word 0xbd48c000  ! 102: RDHPR_HINTP	rdhpr	%hintp, %r30
	.word 0x819c368a  ! 103: WRHPR_HPSTATE_I	wrhpr	%r16, 0x168a, %hpstate
	.word 0x819ca09f  ! 104: WRHPR_HPSTATE_I	wrhpr	%r18, 0x009f, %hpstate
	.word 0xbf514000  ! 105: RDPR_TBA	rdpr	%tba, %r31
	.word 0xbf458000  ! 106: RDASR	rd	%softint, %r31
	.word 0x819d31cc  ! 107: WRHPR_HPSTATE_I	wrhpr	%r20, 0x11cc, %hpstate
	.word 0xb9514000  ! 108: RDPR_TBA	rdpr	%tba, %r28
	.word 0x819cf201  ! 109: WRHPR_HPSTATE_I	wrhpr	%r19, 0x1201, %hpstate
	.word 0x819d3647  ! 110: WRHPR_HPSTATE_I	wrhpr	%r20, 0x1647, %hpstate
	.word 0x839df501  ! 111: WRHPR_HTSTATE_I	wrhpr	%r23, 0x1501, %htstate
	.word 0xb1480000  ! 112: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0x85952747  ! 113: WRPR_TSTATE_I	wrpr	%r20, 0x0747, %tstate
	setx	0x6593fc740000b004, %r1, %r23
	.word 0xb9484000  ! 115: RDHPR_HTSTATE	rdhpr	%htstate, %r28
	.word 0xb748c000  ! 116: RDHPR_HINTP	rdhpr	%hintp, %r27
	.word 0xbf540000  ! 117: RDPR_GL	<illegal instruction>
	.word 0x9195f152  ! 118: WRPR_PIL_I	wrpr	%r23, 0x1152, %pil
	setx	0xa1e6474b000097c5, %r1, %r16
	.word 0xb5518000  ! 120: RDPR_PSTATE	rdpr	%pstate, %r26
	.word 0x839da21b  ! 121: WRHPR_HTSTATE_I	wrhpr	%r22, 0x021b, %htstate
	.word 0x8985a21b  ! 122: WRASR_I	wr	%r22, 0x021b, %tick
	.word 0x8985a21b  ! 123: WRASR_I	wr	%r22, 0x021b, %tick
	.word 0xb9500000  ! 124: RDPR_TPC	rdpr	%tpc, %r28
	.word 0xb5494000  ! 125: RDHPR_HTBA	rdhpr	%htba, %r26
	.word 0x819c20d0  ! 126: WRHPR_HPSTATE_I	wrhpr	%r16, 0x00d0, %hpstate
	.word 0xb5484000  ! 127: RDHPR_HTSTATE	rdhpr	%htstate, %r26
	.word 0x85946257  ! 128: WRPR_TSTATE_I	wrpr	%r17, 0x0257, %tstate
	.word 0xb748c000  ! 129: RDHPR_HINTP	rdhpr	%hintp, %r27
	.word 0xb7410000  ! 130: RDASR	rd	%tick, %r27
	.word 0xad846257  ! 131: WRASR_I	wr	%r17, 0x0257, %softint
	.word 0x819d645b  ! 132: WRHPR_HPSTATE_I	wrhpr	%r21, 0x045b, %hpstate
	.word 0xbf540000  ! 133: RDPR_GL	rdpr	%-, %r31
	.word 0xb7480000  ! 134: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xb1518000  ! 135: RDPR_PSTATE	<illegal instruction>
	.word 0x85943219  ! 136: WRPR_TSTATE_I	wrpr	%r16, 0x1219, %tstate
	.word 0xbd504000  ! 137: RDPR_TNPC	rdpr	%tnpc, %r30
	.word 0x899471da  ! 138: WRPR_TICK_I	wrpr	%r17, 0x11da, %tick
	.word 0xbb540000  ! 139: RDPR_GL	rdpr	%-, %r29
	.word 0xbd484000  ! 140: RDHPR_HTSTATE	rdhpr	%htstate, %r30
	.word 0xbf540000  ! 141: RDPR_GL	<illegal instruction>
	.word 0xbf460000  ! 142: RDASR	rd	%-, %r31
	.word 0x819db71e  ! 143: WRHPR_HPSTATE_I	wrhpr	%r22, 0x171e, %hpstate
	.word 0xb3518000  ! 144: RDPR_PSTATE	rdpr	%pstate, %r25
	.word 0xbd48c000  ! 145: RDHPR_HINTP	rdhpr	%hintp, %r30
	.word 0xb548c000  ! 146: RDHPR_HINTP	rdhpr	%hintp, %r26
	setx	0xed2b9d0e000060c5, %r1, %r21
	.word 0x91943108  ! 148: WRPR_PIL_I	wrpr	%r16, 0x1108, %pil
	.word 0xbf500000  ! 149: RDPR_TPC	rdpr	%tpc, %r31
	.word 0xbd520000  ! 150: RDPR_PIL	rdpr	%pil, %r30
	setx	0x889a2c32000063d9, %r1, %r16
	.word 0xbb51c000  ! 152: RDPR_TL	<illegal instruction>
	.word 0xbd510000  ! 153: RDPR_TICK	<illegal instruction>
	setx	0xc17309560000d0de, %r1, %r17
	.word 0xbd460000  ! 155: RDASR	rd	%-, %r30
	setx	0x2adc6b200000384, %r1, %r22
	.word 0xa3843108  ! 157: WRASR_I	wr	%r16, 0x1108, %-
	.word 0xb548c000  ! 158: RDHPR_HINTP	rdhpr	%hintp, %r26
	.word 0xab843108  ! 159: WRASR_I	wr	%r16, 0x1108, %clear_softint
	.word 0xb1843108  ! 160: WRASR_I	wr	%r16, 0x1108, %-
	.word 0xb5458000  ! 161: RDASR	rd	%softint, %r26
	.word 0x8594e307  ! 162: WRPR_TSTATE_I	wrpr	%r19, 0x0307, %tstate
	.word 0xb184e307  ! 163: WRASR_I	wr	%r19, 0x0307, %-
	setx	0x72c9847a0000169f, %r1, %r19
	setx	0x825e7fa6000041c0, %r1, %r22
	setx	0x67a40d2100008254, %r1, %r18
	.word 0xb7508000  ! 167: RDPR_TSTATE	<illegal instruction>
	setx	0x8d15cac5000000c2, %r1, %r18
	.word 0x8795f39a  ! 169: WRPR_TT_I	wrpr	%r23, 0x139a, %tt
	.word 0x8594f356  ! 170: WRPR_TSTATE_I	wrpr	%r19, 0x1356, %tstate
	.word 0xbb540000  ! 171: RDPR_GL	rdpr	%-, %r29
	.word 0xb7514000  ! 172: RDPR_TBA	<illegal instruction>
	.word 0x819db792  ! 173: WRHPR_HPSTATE_I	wrhpr	%r22, 0x1792, %hpstate
	.word 0x819d7442  ! 174: WRHPR_HPSTATE_I	wrhpr	%r21, 0x1442, %hpstate
	.word 0xb1857442  ! 175: WRASR_I	wr	%r21, 0x1442, %-
	.word 0x919525ce  ! 176: WRPR_PIL_I	wrpr	%r20, 0x05ce, %pil
	setx	0x600f63ae0000c3dc, %r1, %r21
	.word 0xbd510000  ! 178: RDPR_TICK	rdpr	%tick, %r30
	.word 0xb9484000  ! 179: RDHPR_HTSTATE	rdhpr	%htstate, %r28
	.word 0xb945c000  ! 180: RDASR	rd	%-, %r28
	setx	0xae9d62a30000d6c5, %r1, %r19
	.word 0x8594b008  ! 182: WRPR_TSTATE_I	wrpr	%r18, 0x1008, %tstate
	.word 0xbd504000  ! 183: RDPR_TNPC	rdpr	%tnpc, %r30
	.word 0xbd45c000  ! 184: RDASR	rd	%-, %r30
	.word 0xb7508000  ! 185: RDPR_TSTATE	<illegal instruction>
	.word 0xa194b753  ! 186: WRPR_GL_I	wrpr	%r18, 0x1753, %-
	.word 0x819cb096  ! 187: WRHPR_HPSTATE_I	wrhpr	%r18, 0x1096, %hpstate
	setx	0xefb82f2400008214, %r1, %r21
	.word 0xb7410000  ! 189: RDASR	rd	%tick, %r27
	.word 0xbf520000  ! 190: RDPR_PIL	rdpr	%pil, %r31
	.word 0xbf450000  ! 191: RDASR	rd	%set_softint, %r31
	.word 0x819d6799  ! 192: WRHPR_HPSTATE_I	wrhpr	%r21, 0x0799, %hpstate
	.word 0xad856799  ! 193: WRASR_I	wr	%r21, 0x0799, %softint
	.word 0xbb48c000  ! 194: RDHPR_HINTP	rdhpr	%hintp, %r29
	.word 0x839ce40a  ! 195: WRHPR_HTSTATE_I	wrhpr	%r19, 0x040a, %htstate
	.word 0x819d23c9  ! 196: WRHPR_HPSTATE_I	wrhpr	%r20, 0x03c9, %hpstate
	.word 0xb9494000  ! 197: RDHPR_HTBA	rdhpr	%htba, %r28
	setx	0x137a0503000051cf, %r1, %r19
	.word 0xb1518000  ! 199: RDPR_PSTATE	<illegal instruction>
	.word 0xbb540000  ! 200: RDPR_GL	<illegal instruction>
	.word 0xbd50c000  ! 201: RDPR_TT	<illegal instruction>
	.word 0x898523c9  ! 202: WRASR_I	wr	%r20, 0x03c9, %tick
	.word 0xb9480000  ! 203: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xb9458000  ! 204: RDASR	rd	%softint, %r28
	.word 0x819c3649  ! 205: WRHPR_HPSTATE_I	wrhpr	%r16, 0x1649, %hpstate
	.word 0x819d738b  ! 206: WRHPR_HPSTATE_I	wrhpr	%r21, 0x138b, %hpstate
	.word 0x87957285  ! 207: WRPR_TT_I	wrpr	%r21, 0x1285, %tt
	.word 0x839de7d5  ! 208: WRHPR_HTSTATE_I	wrhpr	%r23, 0x07d5, %htstate
	setx	0x6fa4fec00000e244, %r1, %r17
	setx	0x39333f60000031c2, %r1, %r17
	.word 0xb951c000  ! 211: RDPR_TL	rdpr	%tl, %r28
	.word 0xbb48c000  ! 212: RDHPR_HINTP	rdhpr	%hintp, %r29
	.word 0x819d3055  ! 213: WRHPR_HPSTATE_I	wrhpr	%r20, 0x1055, %hpstate
	.word 0xbb50c000  ! 214: RDPR_TT	rdpr	%tt, %r29
	.word 0x819de357  ! 215: WRHPR_HPSTATE_I	wrhpr	%r23, 0x0357, %hpstate
	.word 0x819cb28e  ! 216: WRHPR_HPSTATE_I	wrhpr	%r18, 0x128e, %hpstate
	.word 0xad84b28e  ! 217: WRASR_I	wr	%r18, 0x128e, %softint
	setx	0x8c1493c80000b093, %r1, %r19
	setx	0x3e4035600000f056, %r1, %r18
	.word 0x8995f791  ! 220: WRPR_TICK_I	wrpr	%r23, 0x1791, %tick
	.word 0x919477d0  ! 221: WRPR_PIL_I	wrpr	%r17, 0x17d0, %pil
	.word 0x898477d0  ! 222: WRASR_I	wr	%r17, 0x17d0, %tick
	.word 0x9195b5c1  ! 223: WRPR_PIL_I	wrpr	%r22, 0x15c1, %pil
	.word 0xbb494000  ! 224: RDHPR_HTBA	rdhpr	%htba, %r29
	.word 0xb750c000  ! 225: RDPR_TT	<illegal instruction>
	.word 0xb7410000  ! 226: RDASR	rd	%tick, %r27
	setx	0x1a48d68d00006348, %r1, %r20
	setx	0x393779730000a04e, %r1, %r22
	.word 0xb148c000  ! 229: RDHPR_HINTP	rdhpr	%hintp, %r24
	.word 0xb3484000  ! 230: RDHPR_HTSTATE	rdhpr	%htstate, %r25
	.word 0xb751c000  ! 231: RDPR_TL	<illegal instruction>
	.word 0x819d349f  ! 232: WRHPR_HPSTATE_I	wrhpr	%r20, 0x149f, %hpstate
	.word 0xb348c000  ! 233: RDHPR_HINTP	rdhpr	%hintp, %r25
	.word 0xbb540000  ! 234: RDPR_GL	<illegal instruction>
	.word 0x8795218a  ! 235: WRPR_TT_I	wrpr	%r20, 0x018a, %tt
	.word 0xb1518000  ! 236: RDPR_PSTATE	rdpr	%pstate, %r24
	.word 0xb550c000  ! 237: RDPR_TT	<illegal instruction>
	.word 0xb5540000  ! 238: RDPR_GL	<illegal instruction>
	.word 0x89953758  ! 239: WRPR_TICK_I	wrpr	%r20, 0x1758, %tick
	.word 0xbf520000  ! 240: RDPR_PIL	rdpr	%pil, %r31
	.word 0x819d7301  ! 241: WRHPR_HPSTATE_I	wrhpr	%r21, 0x1301, %hpstate
	.word 0xbd514000  ! 242: RDPR_TBA	rdpr	%tba, %r30
	.word 0xbd440000  ! 243: RDASR	rd	%-, %r30
	.word 0x9195b7ca  ! 244: WRPR_PIL_I	wrpr	%r22, 0x17ca, %pil
	.word 0xbd464000  ! 245: RDASR	rd	%-, %r30
	.word 0xb185b7ca  ! 246: WRASR_I	wr	%r22, 0x17ca, %-
	.word 0xb148c000  ! 247: RDHPR_HINTP	rdhpr	%hintp, %r24
	.word 0xb1440000  ! 248: RDASR	rd	%-, %r24
	.word 0x8794b51e  ! 249: WRPR_TT_I	wrpr	%r18, 0x151e, %tt
	.word 0x9195e65c  ! 250: WRPR_PIL_I	wrpr	%r23, 0x065c, %pil
	.word 0xbf514000  ! 251: RDPR_TBA	rdpr	%tba, %r31
	.word 0x819d2249  ! 252: WRHPR_HPSTATE_I	wrhpr	%r20, 0x0249, %hpstate
	.word 0xbd51c000  ! 253: RDPR_TL	rdpr	%tl, %r30
	.word 0xbf508000  ! 254: RDPR_TSTATE	<illegal instruction>
	setx	0x1300bf490000d591, %r1, %r23
	.word 0x839de11b  ! 256: WRHPR_HTSTATE_I	wrhpr	%r23, 0x011b, %htstate
	setx	0xcc3f39d30000349e, %r1, %r17
	.word 0x819d315e  ! 258: WRHPR_HPSTATE_I	wrhpr	%r20, 0x115e, %hpstate
	.word 0xb7494000  ! 259: RDHPR_HTBA	rdhpr	%htba, %r27
	.word 0xa385315e  ! 260: WRASR_I	wr	%r20, 0x115e, %-
	.word 0xb7460000  ! 261: RDASR	rd	%-, %r27
	.word 0x89943783  ! 262: WRPR_TICK_I	wrpr	%r16, 0x1783, %tick
	.word 0xb7450000  ! 263: RDASR	rd	%set_softint, %r27
	.word 0x839df5c6  ! 264: WRHPR_HTSTATE_I	wrhpr	%r23, 0x15c6, %htstate
	.word 0xb5500000  ! 265: RDPR_TPC	rdpr	%tpc, %r26
	setx	0xbd5c36e2000007c6, %r1, %r18
	.word 0xbf480000  ! 267: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xa194b086  ! 268: WRPR_GL_I	wrpr	%r18, 0x1086, %-
	.word 0xb9510000  ! 269: RDPR_TICK	rdpr	%tick, %r28
	.word 0x8795e35c  ! 270: WRPR_TT_I	wrpr	%r23, 0x035c, %tt
	.word 0xb750c000  ! 271: RDPR_TT	rdpr	%tt, %r27
	.word 0xb7458000  ! 272: RDASR	rd	%softint, %r27
	.word 0xb7410000  ! 273: RDASR	rd	%tick, %r27
	.word 0xb5494000  ! 274: RDHPR_HTBA	rdhpr	%htba, %r26
	.word 0xb7514000  ! 275: RDPR_TBA	<illegal instruction>
	.word 0x8795339d  ! 276: WRPR_TT_I	wrpr	%r20, 0x139d, %tt
	.word 0xab85339d  ! 277: WRASR_I	wr	%r20, 0x139d, %clear_softint
	.word 0xb9518000  ! 278: RDPR_PSTATE	<illegal instruction>
	setx	0xad3fea6b0000025e, %r1, %r17
	setx	0x6010132e00004714, %r1, %r21
	.word 0xb9484000  ! 281: RDHPR_HTSTATE	rdhpr	%htstate, %r28
	.word 0xb3520000  ! 282: RDPR_PIL	<illegal instruction>
	.word 0xbd51c000  ! 283: RDPR_TL	<illegal instruction>
	.word 0xbf518000  ! 284: RDPR_PSTATE	<illegal instruction>
	.word 0xb3494000  ! 285: RDHPR_HTBA	rdhpr	%htba, %r25
	.word 0xb3460000  ! 286: RDASR	rd	%-, %r25
	.word 0x819db18c  ! 287: WRHPR_HPSTATE_I	wrhpr	%r22, 0x118c, %hpstate
	.word 0xb3440000  ! 288: RDASR	rd	%-, %r25
	.word 0x8794b61f  ! 289: WRPR_TT_I	wrpr	%r18, 0x161f, %tt
	.word 0xbb508000  ! 290: RDPR_TSTATE	rdpr	%tstate, %r29
	.word 0xb5500000  ! 291: RDPR_TPC	<illegal instruction>
	.word 0x85953753  ! 292: WRPR_TSTATE_I	wrpr	%r20, 0x1753, %tstate
	.word 0xab853753  ! 293: WRASR_I	wr	%r20, 0x1753, %clear_softint
	.word 0xb5464000  ! 294: RDASR	rd	%-, %r26
	.word 0xb9500000  ! 295: RDPR_TPC	<illegal instruction>
	.word 0xbb494000  ! 296: RDHPR_HTBA	rdhpr	%htba, %r29
	.word 0xbb444000  ! 297: RDASR	rd	%-, %r29
	.word 0xbd520000  ! 298: RDPR_PIL	<illegal instruction>
	.word 0x87952058  ! 299: WRPR_TT_I	wrpr	%r20, 0x0058, %tt
	.word 0xb5494000  ! 300: RDHPR_HTBA	rdhpr	%htba, %r26
	.word 0x89852058  ! 301: WRASR_I	wr	%r20, 0x0058, %tick
	setx	0xe21d7feb0000458a, %r1, %r21
	.word 0x8d9460d4  ! 303: WRPR_PSTATE_I	wrpr	%r17, 0x00d4, %pstate
	.word 0xb948c000  ! 304: RDHPR_HINTP	rdhpr	%hintp, %r28
	.word 0x91942040  ! 305: WRPR_PIL_I	wrpr	%r16, 0x0040, %pil
	.word 0xbf50c000  ! 306: RDPR_TT	rdpr	%tt, %r31
	.word 0xbf440000  ! 307: RDASR	rd	%-, %r31
	.word 0x8994f30b  ! 308: WRPR_TICK_I	wrpr	%r19, 0x130b, %tick
	.word 0xb9514000  ! 309: RDPR_TBA	rdpr	%tba, %r28
	.word 0x819cb7c9  ! 310: WRHPR_HPSTATE_I	wrhpr	%r18, 0x17c9, %hpstate
	.word 0x819d208d  ! 311: WRHPR_HPSTATE_I	wrhpr	%r20, 0x008d, %hpstate
	.word 0x8d94731b  ! 312: WRPR_PSTATE_I	wrpr	%r17, 0x131b, %pstate
	.word 0xa384731b  ! 313: WRASR_I	wr	%r17, 0x131b, %-
	.word 0x819df6c3  ! 314: WRHPR_HPSTATE_I	wrhpr	%r23, 0x16c3, %hpstate
	.word 0xb1500000  ! 315: RDPR_TPC	rdpr	%tpc, %r24
	.word 0xb7520000  ! 316: RDPR_PIL	<illegal instruction>
	.word 0x9195e7c2  ! 317: WRPR_PIL_I	wrpr	%r23, 0x07c2, %pil
	.word 0xb7440000  ! 318: RDASR	rd	%-, %r27
	.word 0x8d9561ca  ! 319: WRPR_PSTATE_I	wrpr	%r21, 0x01ca, %pstate
	.word 0xbb504000  ! 320: RDPR_TNPC	rdpr	%tnpc, %r29
	.word 0x819de700  ! 321: WRHPR_HPSTATE_I	wrhpr	%r23, 0x0700, %hpstate
	.word 0xa985e700  ! 322: WRASR_I	wr	%r23, 0x0700, %set_softint
	.word 0x919433db  ! 323: WRPR_PIL_I	wrpr	%r16, 0x13db, %pil
	setx	0x9d98e35c0000a41a, %r1, %r16
	.word 0xbb464000  ! 325: RDASR	rd	%-, %r29
	.word 0xbd51c000  ! 326: RDPR_TL	rdpr	%tl, %r30
	.word 0xbd410000  ! 327: RDASR	rd	%tick, %r30
	.word 0xbd444000  ! 328: RDASR	rd	%-, %r30
	setx	0xc0111b7a0000e69c, %r1, %r23
	.word 0xbf504000  ! 330: RDPR_TNPC	<illegal instruction>
	.word 0xb5518000  ! 331: RDPR_PSTATE	<illegal instruction>
	.word 0xbf504000  ! 332: RDPR_TNPC	<illegal instruction>
	setx	0x2ea579c800003603, %r1, %r21
	.word 0xbf540000  ! 334: RDPR_GL	<illegal instruction>
	setx	0x5e4decc80000b2cc, %r1, %r21
	.word 0x9194335f  ! 336: WRPR_PIL_I	wrpr	%r16, 0x135f, %pil
	.word 0xbb504000  ! 337: RDPR_TNPC	rdpr	%tnpc, %r29
	.word 0xb150c000  ! 338: RDPR_TT	<illegal instruction>
	.word 0xb1444000  ! 339: RDASR	rd	%-, %r24
	.word 0x919460d9  ! 340: WRPR_PIL_I	wrpr	%r17, 0x00d9, %pil
	.word 0x819c6113  ! 341: WRHPR_HPSTATE_I	wrhpr	%r17, 0x0113, %hpstate
	setx	0xd5ce42640000351d, %r1, %r20
	.word 0xbd508000  ! 343: RDPR_TSTATE	rdpr	%tstate, %r30
	.word 0xb151c000  ! 344: RDPR_TL	<illegal instruction>
	.word 0x819c64c2  ! 345: WRHPR_HPSTATE_I	wrhpr	%r17, 0x04c2, %hpstate
	setx	0x8b564afb000021c4, %r1, %r16
	setx	0x1c66ca890000674e, %r1, %r18
	.word 0xb751c000  ! 348: RDPR_TL	rdpr	%tl, %r27
	.word 0xa194714b  ! 349: WRPR_GL_I	wrpr	%r17, 0x114b, %-
	.word 0xb1510000  ! 350: RDPR_TICK	rdpr	%tick, %r24
	setx	0xadebf68a0000174c, %r1, %r21
	setx	0xc36f7fd70000910f, %r1, %r20
	.word 0x839cb209  ! 353: WRHPR_HTSTATE_I	wrhpr	%r18, 0x1209, %htstate
	.word 0x8794e6cb  ! 354: WRPR_TT_I	wrpr	%r19, 0x06cb, %tt
	.word 0x8984e6cb  ! 355: WRASR_I	wr	%r19, 0x06cb, %tick
	.word 0x8d95f00e  ! 356: WRPR_PSTATE_I	wrpr	%r23, 0x100e, %pstate
	.word 0x819c3398  ! 357: WRHPR_HPSTATE_I	wrhpr	%r16, 0x1398, %hpstate
	.word 0x819da788  ! 358: WRHPR_HPSTATE_I	wrhpr	%r22, 0x0788, %hpstate
	.word 0xb348c000  ! 359: RDHPR_HINTP	rdhpr	%hintp, %r25
	.word 0xb550c000  ! 360: RDPR_TT	<illegal instruction>
	.word 0x8985a788  ! 361: WRASR_I	wr	%r22, 0x0788, %tick
	setx	0xb281a6f30000d511, %r1, %r17
	.word 0x8595751b  ! 363: WRPR_TSTATE_I	wrpr	%r21, 0x151b, %tstate
	.word 0xb5410000  ! 364: RDASR	rd	%tick, %r26
	.word 0x8795f0d8  ! 365: WRPR_TT_I	wrpr	%r23, 0x10d8, %tt
	.word 0xb5464000  ! 366: RDASR	rd	%-, %r26
	.word 0xa385f0d8  ! 367: WRASR_I	wr	%r23, 0x10d8, %-
	.word 0x89956214  ! 368: WRPR_TICK_I	wrpr	%r21, 0x0214, %tick
	.word 0xb5444000  ! 369: RDASR	rd	%-, %r26
	.word 0x87956002  ! 370: WRPR_TT_I	wrpr	%r21, 0x0002, %tt
	.word 0xb5458000  ! 371: RDASR	rd	%softint, %r26
	.word 0xb748c000  ! 372: RDHPR_HINTP	rdhpr	%hintp, %r27
	.word 0x8595729a  ! 373: WRPR_TSTATE_I	wrpr	%r21, 0x129a, %tstate
	.word 0x819d3195  ! 374: WRHPR_HPSTATE_I	wrhpr	%r20, 0x1195, %hpstate
	.word 0x8794e058  ! 375: WRPR_TT_I	wrpr	%r19, 0x0058, %tt
	.word 0xb5494000  ! 376: RDHPR_HTBA	rdhpr	%htba, %r26
	.word 0xb5464000  ! 377: RDASR	rd	%-, %r26
	.word 0x8d952753  ! 378: WRPR_PSTATE_I	wrpr	%r20, 0x0753, %pstate
	.word 0x85953208  ! 379: WRPR_TSTATE_I	wrpr	%r20, 0x1208, %tstate
	setx	0xc3e4974c000056c9, %r1, %r19
	.word 0xbb48c000  ! 381: RDHPR_HINTP	rdhpr	%hintp, %r29
	.word 0x819d304a  ! 382: WRHPR_HPSTATE_I	wrhpr	%r20, 0x104a, %hpstate
	.word 0xa1953312  ! 383: WRPR_GL_I	wrpr	%r20, 0x1312, %-
	.word 0x819cf00c  ! 384: WRHPR_HPSTATE_I	wrhpr	%r19, 0x100c, %hpstate
	.word 0xb3484000  ! 385: RDHPR_HTSTATE	rdhpr	%htstate, %r25
	.word 0x819df659  ! 386: WRHPR_HPSTATE_I	wrhpr	%r23, 0x1659, %hpstate
	.word 0xb9484000  ! 387: RDHPR_HTSTATE	rdhpr	%htstate, %r28
	.word 0xb9494000  ! 388: RDHPR_HTBA	rdhpr	%htba, %r28
	.word 0x91953618  ! 389: WRPR_PIL_I	wrpr	%r20, 0x1618, %pil
	.word 0x819de19e  ! 390: WRHPR_HPSTATE_I	wrhpr	%r23, 0x019e, %hpstate
	.word 0xb185e19e  ! 391: WRASR_I	wr	%r23, 0x019e, %-
	.word 0xb150c000  ! 392: RDPR_TT	<illegal instruction>
	.word 0x8985e19e  ! 393: WRASR_I	wr	%r23, 0x019e, %tick
	.word 0x819d77c0  ! 394: WRHPR_HPSTATE_I	wrhpr	%r21, 0x17c0, %hpstate
	.word 0xbb51c000  ! 395: RDPR_TL	rdpr	%tl, %r29
	.word 0x8995b697  ! 396: WRPR_TICK_I	wrpr	%r22, 0x1697, %tick
	.word 0xbf494000  ! 397: RDHPR_HTBA	rdhpr	%htba, %r31
	.word 0xb748c000  ! 398: RDHPR_HINTP	rdhpr	%hintp, %r27
	.word 0x8985b697  ! 399: WRASR_I	wr	%r22, 0x1697, %tick
	.word 0xa385b697  ! 400: WRASR_I	wr	%r22, 0x1697, %-
	setx	0xd6700ab100006447, %r1, %r22
	.word 0xb7444000  ! 402: RDASR	rd	%-, %r27
	.word 0x919434c7  ! 403: WRPR_PIL_I	wrpr	%r16, 0x14c7, %pil
	.word 0xbf500000  ! 404: RDPR_TPC	rdpr	%tpc, %r31
	.word 0x8795314d  ! 405: WRPR_TT_I	wrpr	%r20, 0x114d, %tt
	.word 0x819db189  ! 406: WRHPR_HPSTATE_I	wrhpr	%r22, 0x1189, %hpstate
	.word 0xb5514000  ! 407: RDPR_TBA	rdpr	%tba, %r26
	.word 0x819cf517  ! 408: WRHPR_HPSTATE_I	wrhpr	%r19, 0x1517, %hpstate
	.word 0x89957711  ! 409: WRPR_TICK_I	wrpr	%r21, 0x1711, %tick
	.word 0xbf508000  ! 410: RDPR_TSTATE	rdpr	%tstate, %r31
	.word 0x85946311  ! 411: WRPR_TSTATE_I	wrpr	%r17, 0x0311, %tstate
	.word 0xb3480000  ! 412: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	setx	0x601ffebe000033d8, %r1, %r19
	.word 0x819da7de  ! 414: WRHPR_HPSTATE_I	wrhpr	%r22, 0x07de, %hpstate
	.word 0xbf484000  ! 415: RDHPR_HTSTATE	rdhpr	%htstate, %r31
	.word 0xb9510000  ! 416: RDPR_TICK	rdpr	%tick, %r28
	.word 0xbf48c000  ! 417: RDHPR_HINTP	rdhpr	%hintp, %r31
	.word 0x819ca00f  ! 418: WRHPR_HPSTATE_I	wrhpr	%r18, 0x000f, %hpstate
	.word 0xb1484000  ! 419: RDHPR_HTSTATE	rdhpr	%htstate, %r24
	.word 0xb5494000  ! 420: RDHPR_HTBA	rdhpr	%htba, %r26
	.word 0xb5460000  ! 421: RDASR	rd	%-, %r26
	.word 0xb5480000  ! 422: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xa984a00f  ! 423: WRASR_I	wr	%r18, 0x000f, %set_softint
	.word 0x8984a00f  ! 424: WRASR_I	wr	%r18, 0x000f, %tick
	.word 0x819db748  ! 425: WRHPR_HPSTATE_I	wrhpr	%r22, 0x1748, %hpstate
	.word 0x8594350d  ! 426: WRPR_TSTATE_I	wrpr	%r16, 0x150d, %tstate
	.word 0x819cb202  ! 427: WRHPR_HPSTATE_I	wrhpr	%r18, 0x1202, %hpstate
	setx	0x77055c590000b29a, %r1, %r20
	.word 0xbd484000  ! 429: RDHPR_HTSTATE	rdhpr	%htstate, %r30
	.word 0x819c3343  ! 430: WRHPR_HPSTATE_I	wrhpr	%r16, 0x1343, %hpstate
	setx	0x2c4ac78b0000d0d3, %r1, %r18
	.word 0xbd460000  ! 432: RDASR	rd	%-, %r30
	.word 0x839cf188  ! 433: WRHPR_HTSTATE_I	wrhpr	%r19, 0x1188, %htstate
	.word 0xb3500000  ! 434: RDPR_TPC	rdpr	%tpc, %r25
	.word 0x8d952499  ! 435: WRPR_PSTATE_I	wrpr	%r20, 0x0499, %pstate
	.word 0xb148c000  ! 436: RDHPR_HINTP	rdhpr	%hintp, %r24
	.word 0xb1454000  ! 437: RDASR	rd	%clear_softint, %r24
	.word 0x89852499  ! 438: WRASR_I	wr	%r20, 0x0499, %tick
	setx	0xd2d7d5c90000f593, %r1, %r17
	setx	0xcc3cafaf0000a603, %r1, %r22
	.word 0xb1450000  ! 441: RDASR	rd	%set_softint, %r24
	.word 0xbb494000  ! 442: RDHPR_HTBA	rdhpr	%htba, %r29
	.word 0xb5484000  ! 443: RDHPR_HTSTATE	rdhpr	%htstate, %r26
	.word 0x8d952200  ! 444: WRPR_PSTATE_I	wrpr	%r20, 0x0200, %pstate
	.word 0xb5464000  ! 445: RDASR	rd	%-, %r26
	setx	0xf597b8f60000d108, %r1, %r18
	.word 0xa9852200  ! 447: WRASR_I	wr	%r20, 0x0200, %set_softint
	.word 0xbb50c000  ! 448: RDPR_TT	<illegal instruction>
	.word 0xbb450000  ! 449: RDASR	rd	%set_softint, %r29
	setx	0x9888d9a10000b5de, %r1, %r16
	.word 0x9194710f  ! 451: WRPR_PIL_I	wrpr	%r17, 0x110f, %pil
	.word 0xbb410000  ! 452: RDASR	rd	%tick, %r29
	.word 0x8795e493  ! 453: WRPR_TT_I	wrpr	%r23, 0x0493, %tt
	.word 0x8d94b5cd  ! 454: WRPR_PSTATE_I	wrpr	%r18, 0x15cd, %pstate
	.word 0xbb464000  ! 455: RDASR	rd	%-, %r29
	.word 0x85946243  ! 456: WRPR_TSTATE_I	wrpr	%r17, 0x0243, %tstate
	.word 0x819d32c8  ! 457: WRHPR_HPSTATE_I	wrhpr	%r20, 0x12c8, %hpstate
	.word 0xb7484000  ! 458: RDHPR_HTSTATE	rdhpr	%htstate, %r27
	.word 0xbd48c000  ! 459: RDHPR_HINTP	rdhpr	%hintp, %r30
	setx	0x59aa9eef0000d38e, %r1, %r19
	.word 0xb5480000  ! 461: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xb9484000  ! 462: RDHPR_HTSTATE	rdhpr	%htstate, %r28
	.word 0xa194224e  ! 463: WRPR_GL_I	wrpr	%r16, 0x024e, %-
	.word 0xb945c000  ! 464: RDASR	rd	%-, %r28
	.word 0xb9450000  ! 465: RDASR	rd	%set_softint, %r28
	.word 0x8984224e  ! 466: WRASR_I	wr	%r16, 0x024e, %tick
	.word 0xab84224e  ! 467: WRASR_I	wr	%r16, 0x024e, %clear_softint
	.word 0x8d94f112  ! 468: WRPR_PSTATE_I	wrpr	%r19, 0x1112, %pstate
	.word 0xa384f112  ! 469: WRASR_I	wr	%r19, 0x1112, %-
	.word 0xb184f112  ! 470: WRASR_I	wr	%r19, 0x1112, %-
	.word 0x8d9420c9  ! 471: WRPR_PSTATE_I	wrpr	%r16, 0x00c9, %pstate
	.word 0xb9450000  ! 472: RDASR	rd	%set_softint, %r28
	.word 0xb9450000  ! 473: RDASR	rd	%set_softint, %r28
	.word 0xbd504000  ! 474: RDPR_TNPC	rdpr	%tnpc, %r30
	setx	0x6aafebf00000071c, %r1, %r23
	setx	0x194b58ed00002444, %r1, %r23
	setx	0x9de13760000012c8, %r1, %r20
	.word 0x8595e244  ! 478: WRPR_TSTATE_I	wrpr	%r23, 0x0244, %tstate
	.word 0xbd410000  ! 479: RDASR	rd	%tick, %r30
	.word 0x8594605e  ! 480: WRPR_TSTATE_I	wrpr	%r17, 0x005e, %tstate
	.word 0xbb494000  ! 481: RDHPR_HTBA	rdhpr	%htba, %r29
	.word 0x8794a792  ! 482: WRPR_TT_I	wrpr	%r18, 0x0792, %tt
	.word 0x9194260d  ! 483: WRPR_PIL_I	wrpr	%r16, 0x060d, %pil
	setx	0x19f771af0000d5ce, %r1, %r18
	.word 0x819d25d2  ! 485: WRHPR_HPSTATE_I	wrhpr	%r20, 0x05d2, %hpstate
	.word 0x819d2799  ! 486: WRHPR_HPSTATE_I	wrhpr	%r20, 0x0799, %hpstate
	.word 0xbb460000  ! 487: RDASR	rd	%-, %r29
	.word 0x8995e0df  ! 488: WRPR_TICK_I	wrpr	%r23, 0x00df, %tick
	.word 0x839ca2c9  ! 489: WRHPR_HTSTATE_I	wrhpr	%r18, 0x02c9, %htstate
	.word 0x9194f34e  ! 490: WRPR_PIL_I	wrpr	%r19, 0x134e, %pil
	.word 0x85947146  ! 491: WRPR_TSTATE_I	wrpr	%r17, 0x1146, %tstate
	.word 0x839ce19a  ! 492: WRHPR_HTSTATE_I	wrhpr	%r19, 0x019a, %htstate
	.word 0xbb454000  ! 493: RDASR	rd	%clear_softint, %r29
	.word 0xbb48c000  ! 494: RDHPR_HINTP	rdhpr	%hintp, %r29
	.word 0x8795a699  ! 495: WRPR_TT_I	wrpr	%r22, 0x0699, %tt
	.word 0x8995f604  ! 496: WRPR_TICK_I	wrpr	%r23, 0x1604, %tick
	.word 0xbf51c000  ! 497: RDPR_TL	rdpr	%tl, %r31
	.word 0xb9508000  ! 498: RDPR_TSTATE	rdpr	%tstate, %r28
	.word 0xb9508000  ! 499: RDPR_TSTATE	<illegal instruction>
	setx	0x26aee44500004303, %r1, %r17
	.word 0xb3480000  ! 501: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0x819ce319  ! 502: WRHPR_HPSTATE_I	wrhpr	%r19, 0x0319, %hpstate
	.word 0xbb484000  ! 503: RDHPR_HTSTATE	rdhpr	%htstate, %r29
	.word 0xbd520000  ! 504: RDPR_PIL	<illegal instruction>
	.word 0xa984e319  ! 505: WRASR_I	wr	%r19, 0x0319, %set_softint
	.word 0x839c3106  ! 506: WRHPR_HTSTATE_I	wrhpr	%r16, 0x1106, %htstate
	.word 0xbf48c000  ! 507: RDHPR_HINTP	rdhpr	%hintp, %r31
	.word 0x879436d3  ! 508: WRPR_TT_I	wrpr	%r16, 0x16d3, %tt
	.word 0xa195f0c6  ! 509: WRPR_GL_I	wrpr	%r23, 0x10c6, %-
	.word 0x9195758a  ! 510: WRPR_PIL_I	wrpr	%r21, 0x158a, %pil
	setx	0xce0628cc0000740a, %r1, %r19
	.word 0xb7494000  ! 512: RDHPR_HTBA	rdhpr	%htba, %r27
	.word 0xb1480000  ! 513: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xb9484000  ! 514: RDHPR_HTSTATE	rdhpr	%htstate, %r28
	.word 0xb550c000  ! 515: RDPR_TT	<illegal instruction>
	.word 0x9194b6cd  ! 516: WRPR_PIL_I	wrpr	%r18, 0x16cd, %pil
	.word 0x8595631c  ! 517: WRPR_TSTATE_I	wrpr	%r21, 0x031c, %tstate
	.word 0x819cb644  ! 518: WRHPR_HPSTATE_I	wrhpr	%r18, 0x1644, %hpstate
	.word 0x819da756  ! 519: WRHPR_HPSTATE_I	wrhpr	%r22, 0x0756, %hpstate
	.word 0x8985a756  ! 520: WRASR_I	wr	%r22, 0x0756, %tick
	.word 0xb5484000  ! 521: RDHPR_HTSTATE	rdhpr	%htstate, %r26
	setx	0x5555f52c0000339c, %r1, %r19
	.word 0xb5410000  ! 523: RDASR	rd	%tick, %r26
	.word 0x819df796  ! 524: WRHPR_HPSTATE_I	wrhpr	%r23, 0x1796, %hpstate
	.word 0xa385f796  ! 525: WRASR_I	wr	%r23, 0x1796, %-
	.word 0xb5444000  ! 526: RDASR	rd	%-, %r26
	.word 0x819de34f  ! 527: WRHPR_HPSTATE_I	wrhpr	%r23, 0x034f, %hpstate
	setx	0xb827c1ac00008085, %r1, %r19
	.word 0xb550c000  ! 529: RDPR_TT	rdpr	%tt, %r26
	.word 0x819c71cc  ! 530: WRHPR_HPSTATE_I	wrhpr	%r17, 0x11cc, %hpstate
	.word 0xa1943345  ! 531: WRPR_GL_I	wrpr	%r16, 0x1345, %-
	.word 0x9195a48e  ! 532: WRPR_PIL_I	wrpr	%r22, 0x048e, %pil
	.word 0xb7510000  ! 533: RDPR_TICK	rdpr	%tick, %r27
	.word 0xab85a48e  ! 534: WRASR_I	wr	%r22, 0x048e, %clear_softint
	.word 0xb7440000  ! 535: RDASR	rd	%-, %r27
	.word 0xb7410000  ! 536: RDASR	rd	%tick, %r27
	setx	0x94af73a00000a10e, %r1, %r21
	.word 0x819d71d9  ! 538: WRHPR_HPSTATE_I	wrhpr	%r21, 0x11d9, %hpstate
	.word 0xb7410000  ! 539: RDASR	rd	%tick, %r27
	.word 0xa194359e  ! 540: WRPR_GL_I	wrpr	%r16, 0x159e, %-
	.word 0xa19460ce  ! 541: WRPR_GL_I	wrpr	%r17, 0x00ce, %-
	.word 0xb1480000  ! 542: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xab8460ce  ! 543: WRASR_I	wr	%r17, 0x00ce, %clear_softint
	.word 0xad8460ce  ! 544: WRASR_I	wr	%r17, 0x00ce, %softint
	.word 0x8995f357  ! 545: WRPR_TICK_I	wrpr	%r23, 0x1357, %tick
	.word 0x839d7443  ! 546: WRHPR_HTSTATE_I	wrhpr	%r21, 0x1443, %htstate
	.word 0xbf508000  ! 547: RDPR_TSTATE	rdpr	%tstate, %r31
	.word 0xbf410000  ! 548: RDASR	rd	%tick, %r31
	.word 0x839df042  ! 549: WRHPR_HTSTATE_I	wrhpr	%r23, 0x1042, %htstate
	.word 0xb5494000  ! 550: RDHPR_HTBA	rdhpr	%htba, %r26
	.word 0x819d3012  ! 551: WRHPR_HPSTATE_I	wrhpr	%r20, 0x1012, %hpstate
	.word 0x8d94371f  ! 552: WRPR_PSTATE_I	wrpr	%r16, 0x171f, %pstate
	setx	0x571fafda0000334a, %r1, %r23
	.word 0xab84371f  ! 554: WRASR_I	wr	%r16, 0x171f, %clear_softint
	.word 0x819da3c7  ! 555: WRHPR_HPSTATE_I	wrhpr	%r22, 0x03c7, %hpstate
	.word 0xbd518000  ! 556: RDPR_PSTATE	rdpr	%pstate, %r30
	.word 0x819c6394  ! 557: WRHPR_HPSTATE_I	wrhpr	%r17, 0x0394, %hpstate
	.word 0x819d2615  ! 558: WRHPR_HPSTATE_I	wrhpr	%r20, 0x0615, %hpstate
	.word 0x819d7114  ! 559: WRHPR_HPSTATE_I	wrhpr	%r21, 0x1114, %hpstate
	.word 0x89857114  ! 560: WRASR_I	wr	%r21, 0x1114, %tick
	.word 0xbd50c000  ! 561: RDPR_TT	rdpr	%tt, %r30
	.word 0xad857114  ! 562: WRASR_I	wr	%r21, 0x1114, %softint
	.word 0xbd454000  ! 563: RDASR	rd	%clear_softint, %r30
	.word 0xb5510000  ! 564: RDPR_TICK	<illegal instruction>
	.word 0x819db31e  ! 565: WRHPR_HPSTATE_I	wrhpr	%r22, 0x131e, %hpstate
	.word 0x819d3458  ! 566: WRHPR_HPSTATE_I	wrhpr	%r20, 0x1458, %hpstate
	.word 0x91957652  ! 567: WRPR_PIL_I	wrpr	%r21, 0x1652, %pil
	.word 0xb5454000  ! 568: RDASR	rd	%clear_softint, %r26
	.word 0x839ce281  ! 569: WRHPR_HTSTATE_I	wrhpr	%r19, 0x0281, %htstate
	.word 0x839db6df  ! 570: WRHPR_HTSTATE_I	wrhpr	%r22, 0x16df, %htstate
	.word 0xb5514000  ! 571: RDPR_TBA	rdpr	%tba, %r26
	.word 0xb148c000  ! 572: RDHPR_HINTP	rdhpr	%hintp, %r24
	.word 0xbf484000  ! 573: RDHPR_HTSTATE	rdhpr	%htstate, %r31
	.word 0x8794774a  ! 574: WRPR_TT_I	wrpr	%r17, 0x174a, %tt
	.word 0xb9480000  ! 575: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	setx	0xc4fb57be00009791, %r1, %r23
	.word 0xa984774a  ! 577: WRASR_I	wr	%r17, 0x174a, %set_softint
	.word 0x839ca08e  ! 578: WRHPR_HTSTATE_I	wrhpr	%r18, 0x008e, %htstate
	.word 0xa384a08e  ! 579: WRASR_I	wr	%r18, 0x008e, %-
	.word 0x85952688  ! 580: WRPR_TSTATE_I	wrpr	%r20, 0x0688, %tstate
	.word 0xb3508000  ! 581: RDPR_TSTATE	rdpr	%tstate, %r25
	.word 0xb1518000  ! 582: RDPR_PSTATE	<illegal instruction>
	.word 0x8d9565c3  ! 583: WRPR_PSTATE_I	wrpr	%r21, 0x05c3, %pstate
	.word 0xb9508000  ! 584: RDPR_TSTATE	rdpr	%tstate, %r28
	setx	0xddce084400007552, %r1, %r19
	.word 0xbb520000  ! 586: RDPR_PIL	<illegal instruction>
	.word 0xb9518000  ! 587: RDPR_PSTATE	<illegal instruction>
	setx	0x53bd09c00002305, %r1, %r22
	.word 0xb9464000  ! 589: RDASR	rd	%-, %r28
	.word 0xb9454000  ! 590: RDASR	rd	%clear_softint, %r28
	.word 0x898565c3  ! 591: WRASR_I	wr	%r21, 0x05c3, %tick
	.word 0xb3480000  ! 592: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0x819da5cf  ! 593: WRHPR_HPSTATE_I	wrhpr	%r22, 0x05cf, %hpstate
	.word 0x9194b545  ! 594: WRPR_PIL_I	wrpr	%r18, 0x1545, %pil
	.word 0xa384b545  ! 595: WRASR_I	wr	%r18, 0x1545, %-
	.word 0x879461d6  ! 596: WRPR_TT_I	wrpr	%r17, 0x01d6, %tt
	.word 0x8795a557  ! 597: WRPR_TT_I	wrpr	%r22, 0x0557, %tt
	.word 0xb948c000  ! 598: RDHPR_HINTP	rdhpr	%hintp, %r28
	.word 0x859560dd  ! 599: WRPR_TSTATE_I	wrpr	%r21, 0x00dd, %tstate
	.word 0xb9458000  ! 600: RDASR	rd	%softint, %r28
	setx	0x30fa8c490000700e, %r1, %r20
	.word 0xb3504000  ! 602: RDPR_TNPC	rdpr	%tnpc, %r25
	setx	0xb9f580450000474f, %r1, %r19
	.word 0xb5540000  ! 604: RDPR_GL	<illegal instruction>
	.word 0x819de6d9  ! 605: WRHPR_HPSTATE_I	wrhpr	%r23, 0x06d9, %hpstate
	.word 0x839c2540  ! 606: WRHPR_HTSTATE_I	wrhpr	%r16, 0x0540, %htstate
	.word 0xbf500000  ! 607: RDPR_TPC	rdpr	%tpc, %r31
	setx	0x947dcf110000c702, %r1, %r17
	.word 0xb1480000  ! 609: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xbd508000  ! 610: RDPR_TSTATE	<illegal instruction>
	setx	0x45187b330000c68c, %r1, %r21
	.word 0x8794f699  ! 612: WRPR_TT_I	wrpr	%r19, 0x1699, %tt
	.word 0x839d278b  ! 613: WRHPR_HTSTATE_I	wrhpr	%r20, 0x078b, %htstate
	setx	0x354d90b60000a5cc, %r1, %r18
	.word 0xbd458000  ! 615: RDASR	rd	%softint, %r30
	.word 0x8985278b  ! 616: WRASR_I	wr	%r20, 0x078b, %tick
	.word 0x8985278b  ! 617: WRASR_I	wr	%r20, 0x078b, %tick
	.word 0x8985278b  ! 618: WRASR_I	wr	%r20, 0x078b, %tick
	.word 0xa1952502  ! 619: WRPR_GL_I	wrpr	%r20, 0x0502, %-
	.word 0xbd410000  ! 620: RDASR	rd	%tick, %r30
	.word 0x819d2396  ! 621: WRHPR_HPSTATE_I	wrhpr	%r20, 0x0396, %hpstate
	.word 0xb1852396  ! 622: WRASR_I	wr	%r20, 0x0396, %-
	.word 0xb9520000  ! 623: RDPR_PIL	<illegal instruction>
	.word 0xb9410000  ! 624: RDASR	rd	%tick, %r28
	.word 0xbd48c000  ! 625: RDHPR_HINTP	rdhpr	%hintp, %r30
	.word 0xbf480000  ! 626: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	setx	0xcc16d2e60000148d, %r1, %r18
	.word 0xab852396  ! 628: WRASR_I	wr	%r20, 0x0396, %clear_softint
	setx	0x92ea70ad0000234e, %r1, %r17
	.word 0xb748c000  ! 630: RDHPR_HINTP	rdhpr	%hintp, %r27
	.word 0xbd540000  ! 631: RDPR_GL	<illegal instruction>
	.word 0xb1510000  ! 632: RDPR_TICK	<illegal instruction>
	.word 0xb1494000  ! 633: RDHPR_HTBA	rdhpr	%htba, %r24
	.word 0xbf480000  ! 634: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0xbf410000  ! 635: RDASR	rd	%tick, %r31
	.word 0xbf410000  ! 636: RDASR	rd	%tick, %r31
	.word 0xbd51c000  ! 637: RDPR_TL	rdpr	%tl, %r30
	.word 0xbd458000  ! 638: RDASR	rd	%softint, %r30
	.word 0x819ce202  ! 639: WRHPR_HPSTATE_I	wrhpr	%r19, 0x0202, %hpstate
	setx	0xcc092d820000675d, %r1, %r17
	.word 0x87947306  ! 641: WRPR_TT_I	wrpr	%r17, 0x1306, %tt
	.word 0xbb494000  ! 642: RDHPR_HTBA	rdhpr	%htba, %r29
	.word 0xb951c000  ! 643: RDPR_TL	<illegal instruction>
	.word 0xb5494000  ! 644: RDHPR_HTBA	rdhpr	%htba, %r26
	.word 0xb948c000  ! 645: RDHPR_HINTP	rdhpr	%hintp, %r28
	.word 0x819ca601  ! 646: WRHPR_HPSTATE_I	wrhpr	%r18, 0x0601, %hpstate
	.word 0xa384a601  ! 647: WRASR_I	wr	%r18, 0x0601, %-
	.word 0xb3484000  ! 648: RDHPR_HTSTATE	rdhpr	%htstate, %r25
	.word 0x819d674b  ! 649: WRHPR_HPSTATE_I	wrhpr	%r21, 0x074b, %hpstate
	.word 0x819d35d8  ! 650: WRHPR_HPSTATE_I	wrhpr	%r20, 0x15d8, %hpstate
	.word 0x819c6091  ! 651: WRHPR_HPSTATE_I	wrhpr	%r17, 0x0091, %hpstate
	.word 0xb3464000  ! 652: RDASR	rd	%-, %r25
	.word 0x819ce0d7  ! 653: WRHPR_HPSTATE_I	wrhpr	%r19, 0x00d7, %hpstate
	.word 0xb3520000  ! 654: RDPR_PIL	rdpr	%pil, %r25
	.word 0xb7510000  ! 655: RDPR_TICK	<illegal instruction>
	.word 0xb7458000  ! 656: RDASR	rd	%softint, %r27
	.word 0xb5520000  ! 657: RDPR_PIL	<illegal instruction>
	.word 0xbb48c000  ! 658: RDHPR_HINTP	rdhpr	%hintp, %r29
	setx	0x3c66532a00003655, %r1, %r20
	.word 0xb7480000  ! 660: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	setx	0x1cfed03700008389, %r1, %r21
	.word 0x819cb256  ! 662: WRHPR_HPSTATE_I	wrhpr	%r18, 0x1256, %hpstate
	.word 0x85942382  ! 663: WRPR_TSTATE_I	wrpr	%r16, 0x0382, %tstate
	setx	0x2659753f0000114f, %r1, %r23
	.word 0x8794a203  ! 665: WRPR_TT_I	wrpr	%r18, 0x0203, %tt
	.word 0xa194b34d  ! 666: WRPR_GL_I	wrpr	%r18, 0x134d, %-
	.word 0xb7518000  ! 667: RDPR_PSTATE	rdpr	%pstate, %r27
	.word 0xa384b34d  ! 668: WRASR_I	wr	%r18, 0x134d, %-
	.word 0xb184b34d  ! 669: WRASR_I	wr	%r18, 0x134d, %-
	.word 0xb7410000  ! 670: RDASR	rd	%tick, %r27
	setx	0x897c8c400000360a, %r1, %r23
	.word 0xb7458000  ! 672: RDASR	rd	%softint, %r27
	.word 0x8595678b  ! 673: WRPR_TSTATE_I	wrpr	%r21, 0x078b, %tstate
	setx	0xa464f1a90000a79d, %r1, %r21
	.word 0xb7520000  ! 675: RDPR_PIL	rdpr	%pil, %r27
	setx	0x537c85010000474a, %r1, %r16
	.word 0xb9500000  ! 677: RDPR_TPC	<illegal instruction>
	.word 0x9195270e  ! 678: WRPR_PIL_I	wrpr	%r20, 0x070e, %pil
	.word 0xa985270e  ! 679: WRASR_I	wr	%r20, 0x070e, %set_softint
	.word 0xbb484000  ! 680: RDHPR_HTSTATE	rdhpr	%htstate, %r29
	.word 0xbb494000  ! 681: RDHPR_HTBA	rdhpr	%htba, %r29
	.word 0xbb464000  ! 682: RDASR	rd	%-, %r29
	.word 0x8d94e709  ! 683: WRPR_PSTATE_I	wrpr	%r19, 0x0709, %pstate
	.word 0xbd508000  ! 684: RDPR_TSTATE	rdpr	%tstate, %r30
	.word 0x819da458  ! 685: WRHPR_HPSTATE_I	wrhpr	%r22, 0x0458, %hpstate
	.word 0xb9508000  ! 686: RDPR_TSTATE	rdpr	%tstate, %r28
	.word 0xa195b347  ! 687: WRPR_GL_I	wrpr	%r22, 0x1347, %-
	.word 0xbb484000  ! 688: RDHPR_HTSTATE	rdhpr	%htstate, %r29
	.word 0xbf504000  ! 689: RDPR_TNPC	<illegal instruction>
	.word 0x8794258f  ! 690: WRPR_TT_I	wrpr	%r16, 0x058f, %tt
	.word 0xb9494000  ! 691: RDHPR_HTBA	rdhpr	%htba, %r28
	.word 0xb3480000  ! 692: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xa195a55c  ! 693: WRPR_GL_I	wrpr	%r22, 0x055c, %-
	.word 0xbb480000  ! 694: RDHPR_HPSTATE	rdhpr	%hpstate, %r29
	.word 0xbb460000  ! 695: RDASR	rd	%-, %r29
	.word 0xb7520000  ! 696: RDPR_PIL	<illegal instruction>
	.word 0xab85a55c  ! 697: WRASR_I	wr	%r22, 0x055c, %clear_softint
	.word 0xb7444000  ! 698: RDASR	rd	%-, %r27
	.word 0x819d3248  ! 699: WRHPR_HPSTATE_I	wrhpr	%r20, 0x1248, %hpstate
	.word 0x819c6212  ! 700: WRHPR_HPSTATE_I	wrhpr	%r17, 0x0212, %hpstate
	.word 0xb7494000  ! 701: RDHPR_HTBA	rdhpr	%htba, %r27
	.word 0xb7454000  ! 702: RDASR	rd	%clear_softint, %r27
	.word 0x839de2c1  ! 703: WRHPR_HTSTATE_I	wrhpr	%r23, 0x02c1, %htstate
	.word 0x8595625d  ! 704: WRPR_TSTATE_I	wrpr	%r21, 0x025d, %tstate
	setx	0x4b74a81800007743, %r1, %r21
	.word 0x89943714  ! 706: WRPR_TICK_I	wrpr	%r16, 0x1714, %tick
	.word 0xb150c000  ! 707: RDPR_TT	rdpr	%tt, %r24
	.word 0xb3518000  ! 708: RDPR_PSTATE	<illegal instruction>
	.word 0x819da594  ! 709: WRHPR_HPSTATE_I	wrhpr	%r22, 0x0594, %hpstate
	.word 0xb1520000  ! 710: RDPR_PIL	rdpr	%pil, %r24
	.word 0x819df593  ! 711: WRHPR_HPSTATE_I	wrhpr	%r23, 0x1593, %hpstate
	.word 0x919437c6  ! 712: WRPR_PIL_I	wrpr	%r16, 0x17c6, %pil
	.word 0xb9500000  ! 713: RDPR_TPC	rdpr	%tpc, %r28
	.word 0xb9464000  ! 714: RDASR	rd	%-, %r28
	.word 0xb9500000  ! 715: RDPR_TPC	<illegal instruction>
	.word 0xb551c000  ! 716: RDPR_TL	<illegal instruction>
	.word 0x839ce50c  ! 717: WRHPR_HTSTATE_I	wrhpr	%r19, 0x050c, %htstate
	.word 0xb184e50c  ! 718: WRASR_I	wr	%r19, 0x050c, %-
	.word 0xbd520000  ! 719: RDPR_PIL	<illegal instruction>
	.word 0x819ce093  ! 720: WRHPR_HPSTATE_I	wrhpr	%r19, 0x0093, %hpstate
	.word 0xad84e093  ! 721: WRASR_I	wr	%r19, 0x0093, %softint
	.word 0x8984e093  ! 722: WRASR_I	wr	%r19, 0x0093, %tick
	.word 0xbf504000  ! 723: RDPR_TNPC	rdpr	%tnpc, %r31
	.word 0xa194278a  ! 724: WRPR_GL_I	wrpr	%r16, 0x078a, %-
	.word 0x819cb74a  ! 725: WRHPR_HPSTATE_I	wrhpr	%r18, 0x174a, %hpstate
	.word 0xb5518000  ! 726: RDPR_PSTATE	rdpr	%pstate, %r26
	.word 0xbd514000  ! 727: RDPR_TBA	<illegal instruction>
	setx	0x4631af0700001491, %r1, %r19
	.word 0x919534d7  ! 729: WRPR_PIL_I	wrpr	%r20, 0x14d7, %pil
	setx	0x904f067100007782, %r1, %r20
	.word 0xbb504000  ! 731: RDPR_TNPC	rdpr	%tnpc, %r29
	.word 0x8595f392  ! 732: WRPR_TSTATE_I	wrpr	%r23, 0x1392, %tstate
	setx	0x718eedb00000809d, %r1, %r21
	.word 0xbb450000  ! 734: RDASR	rd	%set_softint, %r29
	.word 0x9195239d  ! 735: WRPR_PIL_I	wrpr	%r20, 0x039d, %pil
	.word 0xb3480000  ! 736: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xb9500000  ! 737: RDPR_TPC	<illegal instruction>
	.word 0xb748c000  ! 738: RDHPR_HINTP	rdhpr	%hintp, %r27
	.word 0xab85239d  ! 739: WRASR_I	wr	%r20, 0x039d, %clear_softint
	.word 0xb7494000  ! 740: RDHPR_HTBA	rdhpr	%htba, %r27
	.word 0xa985239d  ! 741: WRASR_I	wr	%r20, 0x039d, %set_softint
	setx	0x3d7aa3fc000061d9, %r1, %r23
	.word 0xb7410000  ! 743: RDASR	rd	%tick, %r27
	.word 0xb9494000  ! 744: RDHPR_HTBA	rdhpr	%htba, %r28
	.word 0xb9444000  ! 745: RDASR	rd	%-, %r28
	.word 0xb5500000  ! 746: RDPR_TPC	<illegal instruction>
	.word 0xb1508000  ! 747: RDPR_TSTATE	<illegal instruction>
	.word 0x8794e752  ! 748: WRPR_TT_I	wrpr	%r19, 0x0752, %tt
	.word 0xb3514000  ! 749: RDPR_TBA	rdpr	%tba, %r25
	.word 0x819c614c  ! 750: WRHPR_HPSTATE_I	wrhpr	%r17, 0x014c, %hpstate
	.word 0x819df0c0  ! 751: WRHPR_HPSTATE_I	wrhpr	%r23, 0x10c0, %hpstate
	.word 0x8d95a6d3  ! 752: WRPR_PSTATE_I	wrpr	%r22, 0x06d3, %pstate
	.word 0xbf494000  ! 753: RDHPR_HTBA	rdhpr	%htba, %r31
	.word 0x8795f319  ! 754: WRPR_TT_I	wrpr	%r23, 0x1319, %tt
	.word 0xbb514000  ! 755: RDPR_TBA	rdpr	%tba, %r29
	setx	0xf82cf8330000c44a, %r1, %r19
	.word 0x8985f319  ! 757: WRASR_I	wr	%r23, 0x1319, %tick
	.word 0x8595751d  ! 758: WRPR_TSTATE_I	wrpr	%r21, 0x151d, %tstate
	.word 0x8795709e  ! 759: WRPR_TT_I	wrpr	%r21, 0x109e, %tt
	.word 0xa385709e  ! 760: WRASR_I	wr	%r21, 0x109e, %-
	.word 0xad85709e  ! 761: WRASR_I	wr	%r21, 0x109e, %softint
	.word 0xbb45c000  ! 762: RDASR	rd	%-, %r29
	.word 0xa19464c1  ! 763: WRPR_GL_I	wrpr	%r17, 0x04c1, %-
	setx	0x7f45f2d7000041d1, %r1, %r16
	.word 0x87942151  ! 765: WRPR_TT_I	wrpr	%r16, 0x0151, %tt
	setx	0x1217ec5000003207, %r1, %r17
	.word 0xab842151  ! 767: WRASR_I	wr	%r16, 0x0151, %clear_softint
	.word 0xb9500000  ! 768: RDPR_TPC	<illegal instruction>
	.word 0xb148c000  ! 769: RDHPR_HINTP	rdhpr	%hintp, %r24
	.word 0xa195a081  ! 770: WRPR_GL_I	wrpr	%r22, 0x0081, %-
	.word 0xb1440000  ! 771: RDASR	rd	%-, %r24
	.word 0xa195711b  ! 772: WRPR_GL_I	wrpr	%r21, 0x111b, %-
	.word 0x9194370b  ! 773: WRPR_PIL_I	wrpr	%r16, 0x170b, %pil
	.word 0xb551c000  ! 774: RDPR_TL	rdpr	%tl, %r26
	.word 0x8594b287  ! 775: WRPR_TSTATE_I	wrpr	%r18, 0x1287, %tstate
	.word 0xb545c000  ! 776: RDASR	rd	%-, %r26
	.word 0xa984b287  ! 777: WRASR_I	wr	%r18, 0x1287, %set_softint
	.word 0xb5450000  ! 778: RDASR	rd	%set_softint, %r26
	.word 0x8595a40a  ! 779: WRPR_TSTATE_I	wrpr	%r22, 0x040a, %tstate
	.word 0x8794a752  ! 780: WRPR_TT_I	wrpr	%r18, 0x0752, %tt
	.word 0xbf480000  ! 781: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	setx	0xbecf0092000081d0, %r1, %r20
	.word 0xbf444000  ! 783: RDASR	rd	%-, %r31
	.word 0xbf45c000  ! 784: RDASR	rd	%-, %r31
	.word 0xbd504000  ! 785: RDPR_TNPC	rdpr	%tnpc, %r30
	setx	0xe469edcd0000678e, %r1, %r17
	.word 0x8595b245  ! 787: WRPR_TSTATE_I	wrpr	%r22, 0x1245, %tstate
	.word 0x839cf1c5  ! 788: WRHPR_HTSTATE_I	wrhpr	%r19, 0x11c5, %htstate
	.word 0x8d946783  ! 789: WRPR_PSTATE_I	wrpr	%r17, 0x0783, %pstate
	.word 0x8595f656  ! 790: WRPR_TSTATE_I	wrpr	%r23, 0x1656, %tstate
	.word 0xbd48c000  ! 791: RDHPR_HINTP	rdhpr	%hintp, %r30
	.word 0xa985f656  ! 792: WRASR_I	wr	%r23, 0x1656, %set_softint
	.word 0xb7494000  ! 793: RDHPR_HTBA	rdhpr	%htba, %r27
	.word 0xb9500000  ! 794: RDPR_TPC	<illegal instruction>
	.word 0xbf48c000  ! 795: RDHPR_HINTP	rdhpr	%hintp, %r31
	.word 0xb9540000  ! 796: RDPR_GL	rdpr	%-, %r28
	.word 0xb750c000  ! 797: RDPR_TT	<illegal instruction>
	setx	0x422b3c240000d25a, %r1, %r21
	.word 0xa385f656  ! 799: WRASR_I	wr	%r23, 0x1656, %-
	.word 0xb7444000  ! 800: RDASR	rd	%-, %r27
	.word 0xbf480000  ! 801: RDHPR_HPSTATE	rdhpr	%hpstate, %r31
	.word 0x8995f2c6  ! 802: WRPR_TICK_I	wrpr	%r23, 0x12c6, %tick
	.word 0x85956550  ! 803: WRPR_TSTATE_I	wrpr	%r21, 0x0550, %tstate
	.word 0x819d260d  ! 804: WRHPR_HPSTATE_I	wrhpr	%r20, 0x060d, %hpstate
	.word 0xb3508000  ! 805: RDPR_TSTATE	rdpr	%tstate, %r25
	.word 0xad85260d  ! 806: WRASR_I	wr	%r20, 0x060d, %softint
	.word 0x819d728e  ! 807: WRHPR_HPSTATE_I	wrhpr	%r21, 0x128e, %hpstate
	.word 0xb1504000  ! 808: RDPR_TNPC	rdpr	%tnpc, %r24
	.word 0x819c278c  ! 809: WRHPR_HPSTATE_I	wrhpr	%r16, 0x078c, %hpstate
	.word 0x8d95b447  ! 810: WRPR_PSTATE_I	wrpr	%r22, 0x1447, %pstate
	setx	0x6837f3430000150b, %r1, %r20
	.word 0xb1454000  ! 812: RDASR	rd	%clear_softint, %r24
	.word 0xb9484000  ! 813: RDHPR_HTSTATE	rdhpr	%htstate, %r28
	.word 0xa385b447  ! 814: WRASR_I	wr	%r22, 0x1447, %-
	.word 0xb9410000  ! 815: RDASR	rd	%tick, %r28
	.word 0x819db494  ! 816: WRHPR_HPSTATE_I	wrhpr	%r22, 0x1494, %hpstate
	setx	0xab42e67b000004d6, %r1, %r19
	setx	0x83e195840000a586, %r1, %r23
	.word 0xb9454000  ! 819: RDASR	rd	%clear_softint, %r28
	.word 0xb5508000  ! 820: RDPR_TSTATE	rdpr	%tstate, %r26
	.word 0xbb520000  ! 821: RDPR_PIL	<illegal instruction>
	.word 0x819de25c  ! 822: WRHPR_HPSTATE_I	wrhpr	%r23, 0x025c, %hpstate
	setx	0xafc65480000c71c, %r1, %r22
	.word 0xbb458000  ! 824: RDASR	rd	%softint, %r29
	.word 0xbb484000  ! 825: RDHPR_HTSTATE	rdhpr	%htstate, %r29
	.word 0xb3480000  ! 826: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0xb3510000  ! 827: RDPR_TICK	<illegal instruction>
	.word 0x819de580  ! 828: WRHPR_HPSTATE_I	wrhpr	%r23, 0x0580, %hpstate
	.word 0xb9500000  ! 829: RDPR_TPC	rdpr	%tpc, %r28
	.word 0xb5484000  ! 830: RDHPR_HTSTATE	rdhpr	%htstate, %r26
	.word 0xa195611f  ! 831: WRPR_GL_I	wrpr	%r21, 0x011f, %-
	.word 0xa195b04c  ! 832: WRPR_GL_I	wrpr	%r22, 0x104c, %-
	setx	0x821b90380000d4cf, %r1, %r20
	.word 0x8985b04c  ! 834: WRASR_I	wr	%r22, 0x104c, %tick
	.word 0xad85b04c  ! 835: WRASR_I	wr	%r22, 0x104c, %softint
	setx	0x57a2d8210000f5cc, %r1, %r18
	.word 0xb5508000  ! 837: RDPR_TSTATE	<illegal instruction>
	.word 0xb5518000  ! 838: RDPR_PSTATE	<illegal instruction>
	.word 0xb1520000  ! 839: RDPR_PIL	<illegal instruction>
	setx	0x7a5cdbf40000c108, %r1, %r18
	.word 0xb9518000  ! 841: RDPR_PSTATE	<illegal instruction>
	.word 0x819df04f  ! 842: WRHPR_HPSTATE_I	wrhpr	%r23, 0x104f, %hpstate
	.word 0x899521c7  ! 843: WRPR_TICK_I	wrpr	%r20, 0x01c7, %tick
	.word 0xa195358c  ! 844: WRPR_GL_I	wrpr	%r20, 0x158c, %-
	.word 0x819d3194  ! 845: WRHPR_HPSTATE_I	wrhpr	%r20, 0x1194, %hpstate
	setx	0x637b02720000969e, %r1, %r23
	.word 0xb7508000  ! 847: RDPR_TSTATE	rdpr	%tstate, %r27
	.word 0x8995e647  ! 848: WRPR_TICK_I	wrpr	%r23, 0x0647, %tick
	.word 0xbf500000  ! 849: RDPR_TPC	rdpr	%tpc, %r31
	.word 0x8d95b7c9  ! 850: WRPR_PSTATE_I	wrpr	%r22, 0x17c9, %pstate
	.word 0x8595b5ce  ! 851: WRPR_TSTATE_I	wrpr	%r22, 0x15ce, %tstate
	.word 0x8985b5ce  ! 852: WRASR_I	wr	%r22, 0x15ce, %tick
	.word 0xb185b5ce  ! 853: WRASR_I	wr	%r22, 0x15ce, %-
	.word 0x8994a7d1  ! 854: WRPR_TICK_I	wrpr	%r18, 0x07d1, %tick
	.word 0xbf458000  ! 855: RDASR	rd	%softint, %r31
	.word 0xbf458000  ! 856: RDASR	rd	%softint, %r31
	.word 0xbb508000  ! 857: RDPR_TSTATE	rdpr	%tstate, %r29
	.word 0xbd500000  ! 858: RDPR_TPC	<illegal instruction>
	.word 0x839c72cc  ! 859: WRHPR_HTSTATE_I	wrhpr	%r17, 0x12cc, %htstate
	.word 0xb9480000  ! 860: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	setx	0xee73f6a00000704c, %r1, %r21
	.word 0xb9444000  ! 862: RDASR	rd	%-, %r28
	.word 0x839c2307  ! 863: WRHPR_HTSTATE_I	wrhpr	%r16, 0x0307, %htstate
	.word 0xb9410000  ! 864: RDASR	rd	%tick, %r28
	.word 0xb7484000  ! 865: RDHPR_HTSTATE	rdhpr	%htstate, %r27
	.word 0xb3540000  ! 866: RDPR_GL	<illegal instruction>
	.word 0x819db289  ! 867: WRHPR_HPSTATE_I	wrhpr	%r22, 0x1289, %hpstate
	.word 0xa985b289  ! 868: WRASR_I	wr	%r22, 0x1289, %set_softint
	.word 0xb3440000  ! 869: RDASR	rd	%-, %r25
	.word 0xa385b289  ! 870: WRASR_I	wr	%r22, 0x1289, %-
	.word 0xbd510000  ! 871: RDPR_TICK	<illegal instruction>
	.word 0xb3494000  ! 872: RDHPR_HTBA	rdhpr	%htba, %r25
	.word 0xbb48c000  ! 873: RDHPR_HINTP	rdhpr	%hintp, %r29
	.word 0x919431cf  ! 874: WRPR_PIL_I	wrpr	%r16, 0x11cf, %pil
	.word 0xa98431cf  ! 875: WRASR_I	wr	%r16, 0x11cf, %set_softint
	.word 0xb9480000  ! 876: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.word 0xbd48c000  ! 877: RDHPR_HINTP	rdhpr	%hintp, %r30
	.word 0x87956400  ! 878: WRPR_TT_I	wrpr	%r21, 0x0400, %tt
	.word 0xbf48c000  ! 879: RDHPR_HINTP	rdhpr	%hintp, %r31
	.word 0xb750c000  ! 880: RDPR_TT	rdpr	%tt, %r27
	.word 0x819db119  ! 881: WRHPR_HPSTATE_I	wrhpr	%r22, 0x1119, %hpstate
	.word 0xb7504000  ! 882: RDPR_TNPC	rdpr	%tnpc, %r27
	.word 0x8795640c  ! 883: WRPR_TT_I	wrpr	%r21, 0x040c, %tt
	.word 0xb7440000  ! 884: RDASR	rd	%-, %r27
	.word 0xbd48c000  ! 885: RDHPR_HINTP	rdhpr	%hintp, %r30
	setx	0xf486262000014cf, %r1, %r22
	.word 0x839ce51c  ! 887: WRHPR_HTSTATE_I	wrhpr	%r19, 0x051c, %htstate
	.word 0x819ce0cb  ! 888: WRHPR_HPSTATE_I	wrhpr	%r19, 0x00cb, %hpstate
	.word 0x899572d4  ! 889: WRPR_TICK_I	wrpr	%r21, 0x12d4, %tick
	setx	0x36ed1bd900004407, %r1, %r16
	.word 0xa98572d4  ! 891: WRASR_I	wr	%r21, 0x12d4, %set_softint
	.word 0xb5514000  ! 892: RDPR_TBA	<illegal instruction>
	.word 0x9195e193  ! 893: WRPR_PIL_I	wrpr	%r23, 0x0193, %pil
	.word 0x9195f1db  ! 894: WRPR_PIL_I	wrpr	%r23, 0x11db, %pil
	setx	0xe8c0dd1f00008759, %r1, %r17
	.word 0xb5460000  ! 896: RDASR	rd	%-, %r26
	setx	0x933c16280000b048, %r1, %r18
	.word 0xbb484000  ! 898: RDHPR_HTSTATE	rdhpr	%htstate, %r29
	.word 0x9194a611  ! 899: WRPR_PIL_I	wrpr	%r18, 0x0611, %pil
	.word 0xbf508000  ! 900: RDPR_TSTATE	rdpr	%tstate, %r31
	.word 0x819ca285  ! 901: WRHPR_HPSTATE_I	wrhpr	%r18, 0x0285, %hpstate
	.word 0x8d95254c  ! 902: WRPR_PSTATE_I	wrpr	%r20, 0x054c, %pstate
	.word 0xb1484000  ! 903: RDHPR_HTSTATE	rdhpr	%htstate, %r24
	.word 0xbd500000  ! 904: RDPR_TPC	<illegal instruction>
	.word 0x87946340  ! 905: WRPR_TT_I	wrpr	%r17, 0x0340, %tt
	.word 0x919430d5  ! 906: WRPR_PIL_I	wrpr	%r16, 0x10d5, %pil
	setx	0x6b63c1530000d149, %r1, %r19
	.word 0xb7480000  ! 908: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xb7444000  ! 909: RDASR	rd	%-, %r27
	.word 0xb9508000  ! 910: RDPR_TSTATE	<illegal instruction>
	.word 0x899471dc  ! 911: WRPR_TICK_I	wrpr	%r17, 0x11dc, %tick
	.word 0xb1508000  ! 912: RDPR_TSTATE	rdpr	%tstate, %r24
	.word 0xa1946311  ! 913: WRPR_GL_I	wrpr	%r17, 0x0311, %-
	.word 0xb1410000  ! 914: RDASR	rd	%tick, %r24
	.word 0xb351c000  ! 915: RDPR_TL	rdpr	%tl, %r25
	setx	0x27ee861700005399, %r1, %r22
	.word 0xb5504000  ! 917: RDPR_TNPC	<illegal instruction>
	.word 0x839c208a  ! 918: WRHPR_HTSTATE_I	wrhpr	%r16, 0x008a, %htstate
	.word 0x89947003  ! 919: WRPR_TICK_I	wrpr	%r17, 0x1003, %tick
	setx	0x9ab753e600003540, %r1, %r22
	.word 0xb7480000  ! 921: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0x8d957303  ! 922: WRPR_PSTATE_I	wrpr	%r21, 0x1303, %pstate
	.word 0x8594b1c3  ! 923: WRPR_TSTATE_I	wrpr	%r18, 0x11c3, %tstate
	.word 0xb350c000  ! 924: RDPR_TT	rdpr	%tt, %r25
	.word 0x8595f612  ! 925: WRPR_TSTATE_I	wrpr	%r23, 0x1612, %tstate
	.word 0xbf51c000  ! 926: RDPR_TL	rdpr	%tl, %r31
	setx	0x711cad4a0000f70c, %r1, %r22
	setx	0xb4d9473b0000e1cd, %r1, %r21
	.word 0xb751c000  ! 929: RDPR_TL	rdpr	%tl, %r27
	.word 0xb350c000  ! 930: RDPR_TT	<illegal instruction>
	.word 0xb550c000  ! 931: RDPR_TT	<illegal instruction>
	.word 0xa385f612  ! 932: WRASR_I	wr	%r23, 0x1612, %-
	.word 0xbd494000  ! 933: RDHPR_HTBA	rdhpr	%htba, %r30
	.word 0xb7480000  ! 934: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xb9518000  ! 935: RDPR_PSTATE	<illegal instruction>
	.word 0xb1510000  ! 936: RDPR_TICK	<illegal instruction>
	.word 0x819d3558  ! 937: WRHPR_HPSTATE_I	wrhpr	%r20, 0x1558, %hpstate
	.word 0x8594f28c  ! 938: WRPR_TSTATE_I	wrpr	%r19, 0x128c, %tstate
	.word 0x839c215d  ! 939: WRHPR_HTSTATE_I	wrhpr	%r16, 0x015d, %htstate
	.word 0xb145c000  ! 940: RDASR	rd	%-, %r24
	.word 0x8d9576c0  ! 941: WRPR_PSTATE_I	wrpr	%r21, 0x16c0, %pstate
	.word 0xb9484000  ! 942: RDHPR_HTSTATE	rdhpr	%htstate, %r28
	.word 0xb9460000  ! 943: RDASR	rd	%-, %r28
	setx	0x68aa9a490000461a, %r1, %r18
	.word 0xbb494000  ! 945: RDHPR_HTBA	rdhpr	%htba, %r29
	.word 0xb5518000  ! 946: RDPR_PSTATE	<illegal instruction>
	.word 0x8d94e404  ! 947: WRPR_PSTATE_I	wrpr	%r19, 0x0404, %pstate
	.word 0xb748c000  ! 948: RDHPR_HINTP	rdhpr	%hintp, %r27
	setx	0x6121eb600000f683, %r1, %r19
	.word 0x8995a41f  ! 950: WRPR_TICK_I	wrpr	%r22, 0x041f, %tick
	.word 0xa385a41f  ! 951: WRASR_I	wr	%r22, 0x041f, %-
	setx	0x9d4d1c220000b457, %r1, %r20
	.word 0xb748c000  ! 953: RDHPR_HINTP	rdhpr	%hintp, %r27
	.word 0x85956457  ! 954: WRPR_TSTATE_I	wrpr	%r21, 0x0457, %tstate
	.word 0x89856457  ! 955: WRASR_I	wr	%r21, 0x0457, %tick
	.word 0x8994375b  ! 956: WRPR_TICK_I	wrpr	%r16, 0x175b, %tick
	.word 0x89956592  ! 957: WRPR_TICK_I	wrpr	%r21, 0x0592, %tick
	setx	0x3acddde30000a7cf, %r1, %r21
	.word 0xab856592  ! 959: WRASR_I	wr	%r21, 0x0592, %clear_softint
	.word 0xb5484000  ! 960: RDHPR_HTSTATE	rdhpr	%htstate, %r26
	.word 0xb1480000  ! 961: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xb3514000  ! 962: RDPR_TBA	<illegal instruction>
	.word 0x87952284  ! 963: WRPR_TT_I	wrpr	%r20, 0x0284, %tt
	.word 0xb3444000  ! 964: RDASR	rd	%-, %r25
	.word 0x819d2417  ! 965: WRHPR_HPSTATE_I	wrhpr	%r20, 0x0417, %hpstate
	.word 0xb1514000  ! 966: RDPR_TBA	rdpr	%tba, %r24
	setx	0xe38e48690000a74d, %r1, %r19
	.word 0x819c7097  ! 968: WRHPR_HPSTATE_I	wrhpr	%r17, 0x1097, %hpstate
	.word 0x8995f65e  ! 969: WRPR_TICK_I	wrpr	%r23, 0x165e, %tick
	setx	0xf406ac240000661a, %r1, %r22
	.word 0xbd48c000  ! 971: RDHPR_HINTP	rdhpr	%hintp, %r30
	.word 0x8d942150  ! 972: WRPR_PSTATE_I	wrpr	%r16, 0x0150, %pstate
	.word 0xb1500000  ! 973: RDPR_TPC	rdpr	%tpc, %r24
	.word 0xb1444000  ! 974: RDASR	rd	%-, %r24
	.word 0xbb520000  ! 975: RDPR_PIL	<illegal instruction>
	.word 0xa3842150  ! 976: WRASR_I	wr	%r16, 0x0150, %-
	.word 0xb148c000  ! 977: RDHPR_HINTP	rdhpr	%hintp, %r24
	.word 0x87957417  ! 978: WRPR_TT_I	wrpr	%r21, 0x1417, %tt
	.word 0x91952087  ! 979: WRPR_PIL_I	wrpr	%r20, 0x0087, %pil
	.word 0xb551c000  ! 980: RDPR_TL	rdpr	%tl, %r26
	.word 0xb5464000  ! 981: RDASR	rd	%-, %r26
	.word 0xb5480000  ! 982: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xb9510000  ! 983: RDPR_TICK	<illegal instruction>
	.word 0xbb510000  ! 984: RDPR_TICK	<illegal instruction>
	.word 0x819db548  ! 985: WRHPR_HPSTATE_I	wrhpr	%r22, 0x1548, %hpstate
	.word 0xab85b548  ! 986: WRASR_I	wr	%r22, 0x1548, %clear_softint
	.word 0xa985b548  ! 987: WRASR_I	wr	%r22, 0x1548, %set_softint
	.word 0xb5518000  ! 988: RDPR_PSTATE	<illegal instruction>
	setx	0x6329b6720000f48f, %r1, %r17
	.word 0xb151c000  ! 990: RDPR_TL	<illegal instruction>
	.word 0x8d95241a  ! 991: WRPR_PSTATE_I	wrpr	%r20, 0x041a, %pstate
	setx	0xa087a1a500008412, %r1, %r16
	.word 0xb1450000  ! 993: RDASR	rd	%set_softint, %r24
	.word 0xb1410000  ! 994: RDASR	rd	%tick, %r24
	.word 0xb1504000  ! 995: RDPR_TNPC	rdpr	%tnpc, %r24
	.word 0x839d3580  ! 996: WRHPR_HTSTATE_I	wrhpr	%r20, 0x1580, %htstate
	.word 0x8995e586  ! 997: WRPR_TICK_I	wrpr	%r23, 0x0586, %tick
	.word 0xb9480000  ! 998: RDHPR_HPSTATE	rdhpr	%hpstate, %r28
	.data
data_start:

	.xword	0x02cd6aa50000f005
	.xword	0x678b261f00009191
	.xword	0xc12fac9a000074c2
	.xword	0x8a6b4a850000c397
	.xword	0x7ed308c20000e147
	.xword	0x442596f900002216
	.xword	0x5c85614600002240
	.xword	0xf144eda500000599
	.xword	0x2cb150fb000024d7
	.xword	0x0a9d2fd50000b456
	.xword	0xfd239fe400005409
	.xword	0x09fa6e68000085ca
	.xword	0xd4c918740000c7ca
	.xword	0x00a7595f0000a211
	.xword	0x15cfb48500000449
	.xword	0xb6e77fa600006204



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
!!# 
!!# %%
!!# %%section control
!!# 
!!# %%
!!# %%section init
!!# {
!!# 
!!# 
!!#   IJ_bind_thread_group("diag.j", 13, th_M,    0x01);
!!# 
!!#   IJ_set_rvar ("diag.j", 16, Rv_rand64, "48'hrrrr rrrr rrrr," "16'brrrr 0rrr rr0r rrrr");
!!# 
!!#   IJ_set_ropr_fld ("diag.j", 18, ijdefault, Ft_Rs1, "{16..23}");
!!#   IJ_set_ropr_fld ("diag.j", 19, ijdefault, Ft_Rs2, "{0}");
!!#   IJ_set_ropr_fld ("diag.j", 20, ijdefault, Ft_Simm13, "13'br 0rrr rr0r rrrr");
!!#   IJ_set_ropr_fld ("diag.j", 21, ijdefault, Ft_Rd, "{24..31}");
!!# 
!!#   IJ_set_rvar ("diag.j", 23, Rv_reg, "{16..23}");
!!# 
!!#   IJ_set_ropr_fld ("diag.j", 25, Rrd_reg_asr, Ft_Rs1, "{0x4, 0x10, 0x11, 0x14, 0x15, 0x16, 0x17, 0x18, 0x19}");
!!#   IJ_set_ropr_fld ("diag.j", 26, Rwr_reg_asr, Ft_Rd,  "{0x4, 0x11, 0x14, 0x15, 0x16, 0x18}");
!!# 
!!#   IJ_init_regs_by_setx ("diag.j", 28, th_M, 1, 0, Rv_rand64);
!!# 
!!#   IJ_printf ("diag.j", 30, th_M, "\tta\tT_CHANGE_TO_TL1\n");
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
!!#   IJ_printf ("diag.j", 38, th_M, "\t.data\ndata_start:\n\n");
!!#   for (i = 0; i < 16; i++) {
!!# 		IJ_printf  ("diag.j", 40, th_M,"\t.xword\t0x%016llrx\n", Rv_rand64);
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
!!# 		IJ_generate ("diag.j", 78, th_M, $2);
!!# 	}
!!# ;
!!# 
!!# inst_type: 
!!# 	update_reg
!!# 	| read_asr 
!!# 	| write_asr 
!!# 	| rd_priv_asr
!!# 	| wr_priv_asr
!!# 	| rd_hpriv_asr
!!# 	| wr_hpriv_asr
!!# 	| rd_tsa_asr 
!!# 	| wr_tsa_asr 
!!# ;
!!# 
!!# read_asr: 
!!# 	tRDASR %ropr  Rrd_reg_asr
!!# ;
!!# 
!!# write_asr: 
!!# 	tWRASR_I %ropr  Rwr_reg_asr
!!# ;
!!# 
!!# rd_hpriv_asr: 
!!# 	tRDHPR_HPSTATE 
!!# 	| tRDHPR_HINTP
!!# 	| tRDHPR_HTBA
!!# ;
!!# 
!!# wr_hpriv_asr: 
!!# 	tWRHPR_HPSTATE_I 
!!# 	//| tWRHPR_HINTP_I
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
!!# 	tWRPR_PSTATE_I 
!!# 	| tWRPR_PIL_I 
!!# 	| tWRPR_GL_I 
!!# 	| tWRPR_TICK_I
!!# ;
!!# 
!!# rd_tsa_asr: 
!!# 	tRDHPR_HTSTATE
!!# 	| tRDPR_TSTATE 
!!# 	| tRDPR_TPC 
!!# 	| tRDPR_TNPC 
!!# 	| tRDPR_TT 
!!# ;
!!# 
!!# wr_tsa_asr: 
!!# 	tWRHPR_HTSTATE_I
!!# 	| tWRPR_TSTATE_I 
!!# 	| tWRPR_TT_I 
!!# ;
!!# 
!!# update_reg: mDUMMY1
!!# 	{
!!# 	  IJ_printf ("diag.j", 146, th_M, "\tsetx\t0x%llrx, %%r1, %%r%rd\n", Rv_rand64, Rv_reg);
!!# 	};
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
