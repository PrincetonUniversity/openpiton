// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: exu_byp_rs1_1.s
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
   random seed:	21972656
   Jal exu_byp_rs1_mulhit.j:	
********************************************************************************/

#ifndef OVERRIDE_THREAD_COUNT
# define THREAD_COUNT 1
#endif

#define ENABLE_T0_Fp_disabled_0x20
#include "enable_traps.h"
#include "boot.s"


.text
.global main


main:
     wr    %g0, 7, %fprs


/*===========================================*/
/* The diag_fini section of the diag          */
/*===========================================*/

! Register init code

	setx 0x70a16bd309b2a4db, %g1, %g0
	setx 0x69f2190e279f81da, %g1, %g1
	setx 0xbabe51fb2df9dc32, %g1, %g2
	setx 0xad6a5b446ad8e1bc, %g1, %g3
	setx 0x3bff79421fff10c4, %g1, %g4
	setx 0xe48e0c0052c8e667, %g1, %g5
	setx 0x1360aced7978a7d4, %g1, %g6
	setx 0x3e16145fc5376691, %g1, %g7
	setx 0xf4674d571ca83500, %g1, %r16
	setx 0x9676855a48075bbb, %g1, %r17
	setx 0x571f125baf12294e, %g1, %r18
	setx 0x6d78e8ccc0cbe5f5, %g1, %r19
	setx 0x67467369973ecb1c, %g1, %r20
	setx 0x7a518f0a538edba8, %g1, %r21
	setx 0xf239187087505d03, %g1, %r22
	setx 0xaa069aa4afe04ca9, %g1, %r23
	setx 0xb607a3ea2dcd2fbc, %g1, %r24
	setx 0x96b4b93ad40d1828, %g1, %r25
	setx 0x835a5166d27a990d, %g1, %r26
	setx 0x6f8c6f23418a7c9a, %g1, %r27
	setx 0x09a0ee146359a12a, %g1, %r28
	setx 0x5159da89b9b34098, %g1, %r29
	setx 0xbe779cc131cbcbdd, %g1, %r30
	setx 0x54bbb7d14781263a, %g1, %r31
	save
	setx 0x997d946538369ff5, %g1, %r16
	setx 0xe233767b386b630b, %g1, %r17
	setx 0x73720f913d400796, %g1, %r18
	setx 0xa4e4d330ec2ab473, %g1, %r19
	setx 0xd56d707b9e917dae, %g1, %r20
	setx 0x5cebaa85e34d72df, %g1, %r21
	setx 0xcb9a0990746e8094, %g1, %r22
	setx 0xab72a90fb55baaf3, %g1, %r23
	setx 0xe252af8e6cbefc58, %g1, %r24
	setx 0x5cb4d3b789996842, %g1, %r25
	setx 0x8877749a05210c3f, %g1, %r26
	setx 0x3ddeeba81b6d9e7a, %g1, %r27
	setx 0x80a7b61478c217df, %g1, %r28
	setx 0xb8ec2aac4b750549, %g1, %r29
	setx 0x487ca818d1433a28, %g1, %r30
	setx 0x83b3bc283882f763, %g1, %r31
	restore
	setx	t0_data_start_0,%g0, %r1
	.word 0x9002389f  ! 5: ADD_I	add 	%r8, 0xfffff89f, %r8
	.word 0x90ba000b  ! 6: XNORcc_R	xnorcc 	%r8, %r11, %r8
	.word 0x9022000b  ! 7: SUB_R	sub 	%r8, %r11, %r8
	.word 0x90a20009  ! 8: SUBcc_R	subcc 	%r8, %r9, %r8
	.word 0x90022ec3  ! 9: ADD_I	add 	%r8, 0x0ec3, %r8
	.word 0x902236f9  ! 10: SUB_I	sub 	%r8, 0xfffff6f9, %r8
	.word 0x900a000a  ! 11: AND_R	and 	%r8, %r10, %r8
	.word 0x90a2000a  ! 12: SUBcc_R	subcc 	%r8, %r10, %r8
	.word 0x902233a7  ! 13: SUB_I	sub 	%r8, 0xfffff3a7, %r8
	.word 0x90a234ba  ! 14: SUBcc_I	subcc 	%r8, 0xfffff4ba, %r8
	.word 0xd0004000  ! 15: LDUW_R	lduw	[%r1 + %r0], %r8
	.word 0x90820008  ! 16: ADDcc_R	addcc 	%r8, %r8, %r8
	.word 0x90020008  ! 17: ADD_R	add 	%r8, %r8, %r8
	.word 0xd0404000  ! 18: LDSW_R	ldsw	[%r1 + %r0], %r8
	.word 0x90b227bd  ! 19: ORNcc_I	orncc 	%r8, 0x07bd, %r8
	.word 0x903a2f55  ! 20: XNOR_I	xnor 	%r8, 0x0f55, %r8
	.word 0x90020008  ! 21: ADD_R	add 	%r8, %r8, %r8
	.word 0xd0104000  ! 22: LDUH_R	lduh	[%r1 + %r0], %r8
	.word 0x90223cd5  ! 23: SUB_I	sub 	%r8, 0xfffffcd5, %r8
	.word 0xd0486034  ! 24: LDSB_I	ldsb	[%r1 + 0x0034], %r8
	.word 0x9002000a  ! 25: ADD_R	add 	%r8, %r10, %r8
	.word 0xd008602a  ! 26: LDUB_I	ldub	[%r1 + 0x002a], %r8
	.word 0x9082000b  ! 27: ADDcc_R	addcc 	%r8, %r11, %r8
	.word 0x90823f25  ! 28: ADDcc_I	addcc 	%r8, 0xffffff25, %r8
	.word 0xd0086024  ! 29: LDUB_I	ldub	[%r1 + 0x0024], %r8
	.word 0xd040600d  ! 30: LDSW_I	ldsw	[%r1 + 0x000d], %r8
	.word 0xd0006057  ! 31: LDUW_I	lduw	[%r1 + 0x0057], %r8
	.word 0x90023512  ! 32: ADD_I	add 	%r8, 0xfffff512, %r8
	.word 0x90220008  ! 33: SUB_R	sub 	%r8, %r8, %r8
	.word 0x90b20009  ! 34: ORNcc_R	orncc 	%r8, %r9, %r8
	.word 0x9002244e  ! 35: ADD_I	add 	%r8, 0x044e, %r8
	.word 0xd0086047  ! 36: LDUB_I	ldub	[%r1 + 0x0047], %r8
	.word 0xd0506043  ! 37: LDSH_I	ldsh	[%r1 + 0x0043], %r8
	.word 0x90aa3aba  ! 38: ANDNcc_I	andncc 	%r8, 0xfffffaba, %r8
	.word 0x90a20008  ! 39: SUBcc_R	subcc 	%r8, %r8, %r8
	.word 0xd0404000  ! 40: LDSW_R	ldsw	[%r1 + %r0], %r8
	.word 0x90a2000c  ! 41: SUBcc_R	subcc 	%r8, %r12, %r8
	.word 0x909a3a4a  ! 42: XORcc_I	xorcc 	%r8, 0xfffffa4a, %r8
	.word 0x903a000a  ! 43: XNOR_R	xnor 	%r8, %r10, %r8
	.word 0x901a330f  ! 44: XOR_I	xor 	%r8, 0xfffff30f, %r8
	.word 0x90820008  ! 45: ADDcc_R	addcc 	%r8, %r8, %r8
	.word 0x900a21a2  ! 46: AND_I	and 	%r8, 0x01a2, %r8
	.word 0x90a22ab8  ! 47: SUBcc_I	subcc 	%r8, 0x0ab8, %r8
	.word 0x901a000b  ! 48: XOR_R	xor 	%r8, %r11, %r8
	.word 0x900235a9  ! 49: ADD_I	add 	%r8, 0xfffff5a9, %r8
	.word 0x901a33a0  ! 50: XOR_I	xor 	%r8, 0xfffff3a0, %r8
	.word 0x903a2cb7  ! 51: XNOR_I	xnor 	%r8, 0x0cb7, %r8
	.word 0x9002000b  ! 52: ADD_R	add 	%r8, %r11, %r8
	.word 0xd0486074  ! 53: LDSB_I	ldsb	[%r1 + 0x0074], %r8
	.word 0x90220009  ! 54: SUB_R	sub 	%r8, %r9, %r8
	.word 0x909a38e6  ! 55: XORcc_I	xorcc 	%r8, 0xfffff8e6, %r8
	.word 0x9082000a  ! 56: ADDcc_R	addcc 	%r8, %r10, %r8
	.word 0x90aa0008  ! 57: ANDNcc_R	andncc 	%r8, %r8, %r8
	.word 0x90323250  ! 58: ORN_I	orn 	%r8, 0xfffff250, %r8
	.word 0x9002000a  ! 59: ADD_R	add 	%r8, %r10, %r8
	.word 0x902a0008  ! 60: ANDN_R	andn 	%r8, %r8, %r8
	.word 0x903a23a7  ! 61: XNOR_I	xnor 	%r8, 0x03a7, %r8
	.word 0x90220009  ! 62: SUB_R	sub 	%r8, %r9, %r8
	.word 0x901a000c  ! 63: XOR_R	xor 	%r8, %r12, %r8
	.word 0xd0406046  ! 64: LDSW_I	ldsw	[%r1 + 0x0046], %r8
	.word 0x902222f8  ! 65: SUB_I	sub 	%r8, 0x02f8, %r8
	.word 0x90a2000a  ! 66: SUBcc_R	subcc 	%r8, %r10, %r8
	.word 0x90820008  ! 67: ADDcc_R	addcc 	%r8, %r8, %r8
	.word 0xd040600d  ! 68: LDSW_I	ldsw	[%r1 + 0x000d], %r8
	.word 0x90ba3954  ! 69: XNORcc_I	xnorcc 	%r8, 0xfffff954, %r8
	.word 0x90823069  ! 70: ADDcc_I	addcc 	%r8, 0xfffff069, %r8
	.word 0x9022000b  ! 71: SUB_R	sub 	%r8, %r11, %r8
	.word 0x9012203e  ! 72: OR_I	or 	%r8, 0x003e, %r8
	.word 0xd0084000  ! 73: LDUB_R	ldub	[%r1 + %r0], %r8
	.word 0x90aa2c87  ! 74: ANDNcc_I	andncc 	%r8, 0x0c87, %r8
	.word 0xd0004000  ! 75: LDUW_R	lduw	[%r1 + %r0], %r8
	.word 0x9012000b  ! 76: OR_R	or 	%r8, %r11, %r8
	.word 0x902a298a  ! 77: ANDN_I	andn 	%r8, 0x098a, %r8
	.word 0xd0404000  ! 78: LDSW_R	ldsw	[%r1 + %r0], %r8
	.word 0x908a3a3d  ! 79: ANDcc_I	andcc 	%r8, 0xfffffa3d, %r8
	.word 0x90a2000a  ! 80: SUBcc_R	subcc 	%r8, %r10, %r8
	.word 0x9022000b  ! 81: SUB_R	sub 	%r8, %r11, %r8
	.word 0x9092000c  ! 82: ORcc_R	orcc 	%r8, %r12, %r8
	.word 0x90ba3eb9  ! 83: XNORcc_I	xnorcc 	%r8, 0xfffffeb9, %r8
	.word 0x90822849  ! 84: ADDcc_I	addcc 	%r8, 0x0849, %r8
	.word 0x90120008  ! 85: OR_R	or 	%r8, %r8, %r8
	.word 0xd050606c  ! 86: LDSH_I	ldsh	[%r1 + 0x006c], %r8
	.word 0xd0104000  ! 87: LDUH_R	lduh	[%r1 + %r0], %r8
	.word 0x90920008  ! 88: ORcc_R	orcc 	%r8, %r8, %r8
	.word 0xd0006058  ! 89: LDUW_I	lduw	[%r1 + 0x0058], %r8
	.word 0x902a0009  ! 90: ANDN_R	andn 	%r8, %r9, %r8
	.word 0x90a2000a  ! 91: SUBcc_R	subcc 	%r8, %r10, %r8
	.word 0x90aa3cb2  ! 92: ANDNcc_I	andncc 	%r8, 0xfffffcb2, %r8
	.word 0x9092000c  ! 93: ORcc_R	orcc 	%r8, %r12, %r8
	.word 0xd0004000  ! 94: LDUW_R	lduw	[%r1 + %r0], %r8
	.word 0x9082000b  ! 95: ADDcc_R	addcc 	%r8, %r11, %r8
	.word 0x902a000b  ! 96: ANDN_R	andn 	%r8, %r11, %r8
	.word 0x902a000b  ! 97: ANDN_R	andn 	%r8, %r11, %r8
	.word 0x90aa0008  ! 98: ANDNcc_R	andncc 	%r8, %r8, %r8
	.word 0x902a3599  ! 99: ANDN_I	andn 	%r8, 0xfffff599, %r8
	.word 0x90a20008  ! 100: SUBcc_R	subcc 	%r8, %r8, %r8
	.word 0x908238ee  ! 101: ADDcc_I	addcc 	%r8, 0xfffff8ee, %r8
	.word 0xd0504000  ! 102: LDSH_R	ldsh	[%r1 + %r0], %r8
	.word 0x90022e46  ! 103: ADD_I	add 	%r8, 0x0e46, %r8
	.word 0x9012000c  ! 104: OR_R	or 	%r8, %r12, %r8
	.word 0x908a257c  ! 105: ANDcc_I	andcc 	%r8, 0x057c, %r8
	.word 0x903a0008  ! 106: XNOR_R	xnor 	%r8, %r8, %r8
	.word 0x90123ec6  ! 107: OR_I	or 	%r8, 0xfffffec6, %r8
	.word 0x909a3c13  ! 108: XORcc_I	xorcc 	%r8, 0xfffffc13, %r8
	.word 0xd0404000  ! 109: LDSW_R	ldsw	[%r1 + %r0], %r8
	.word 0x9022000c  ! 110: SUB_R	sub 	%r8, %r12, %r8
	.word 0x90ba2728  ! 111: XNORcc_I	xnorcc 	%r8, 0x0728, %r8
	.word 0xd0004000  ! 112: LDUW_R	lduw	[%r1 + %r0], %r8
	.word 0x901a30cb  ! 113: XOR_I	xor 	%r8, 0xfffff0cb, %r8
	.word 0x9082000a  ! 114: ADDcc_R	addcc 	%r8, %r10, %r8
	.word 0x9022000c  ! 115: SUB_R	sub 	%r8, %r12, %r8
	.word 0xd0486057  ! 116: LDSB_I	ldsb	[%r1 + 0x0057], %r8
	.word 0xd0404000  ! 117: LDSW_R	ldsw	[%r1 + %r0], %r8
	.word 0x9092000c  ! 118: ORcc_R	orcc 	%r8, %r12, %r8
	.word 0xd0084000  ! 119: LDUB_R	ldub	[%r1 + %r0], %r8
	.word 0xd0084000  ! 120: LDUB_R	ldub	[%r1 + %r0], %r8
	.word 0x9002320e  ! 121: ADD_I	add 	%r8, 0xfffff20e, %r8
	.word 0x90922bc3  ! 122: ORcc_I	orcc 	%r8, 0x0bc3, %r8
	.word 0x9002283a  ! 123: ADD_I	add 	%r8, 0x083a, %r8
	.word 0x9002000b  ! 124: ADD_R	add 	%r8, %r11, %r8
	.word 0xd0406033  ! 125: LDSW_I	ldsw	[%r1 + 0x0033], %r8
	.word 0x9032000b  ! 126: ORN_R	orn 	%r8, %r11, %r8
	.word 0x9002000c  ! 127: ADD_R	add 	%r8, %r12, %r8
	.word 0x90a2375a  ! 128: SUBcc_I	subcc 	%r8, 0xfffff75a, %r8
	.word 0xd0106070  ! 129: LDUH_I	lduh	[%r1 + 0x0070], %r8
	.word 0x9022200a  ! 130: SUB_I	sub 	%r8, 0x000a, %r8
	.word 0xd0404000  ! 131: LDSW_R	ldsw	[%r1 + %r0], %r8
	.word 0x908a3680  ! 132: ANDcc_I	andcc 	%r8, 0xfffff680, %r8
	.word 0xd0484000  ! 133: LDSB_R	ldsb	[%r1 + %r0], %r8
	.word 0xd0006009  ! 134: LDUW_I	lduw	[%r1 + 0x0009], %r8
	.word 0x908a2c23  ! 135: ANDcc_I	andcc 	%r8, 0x0c23, %r8
	.word 0x903a355e  ! 136: XNOR_I	xnor 	%r8, 0xfffff55e, %r8
	.word 0x902a0008  ! 137: ANDN_R	andn 	%r8, %r8, %r8
	.word 0x90ba000b  ! 138: XNORcc_R	xnorcc 	%r8, %r11, %r8
	.word 0x902226c9  ! 139: SUB_I	sub 	%r8, 0x06c9, %r8
	.word 0xd010605a  ! 140: LDUH_I	lduh	[%r1 + 0x005a], %r8
	.word 0xd0004000  ! 141: LDUW_R	lduw	[%r1 + %r0], %r8
	.word 0x900a20e2  ! 142: AND_I	and 	%r8, 0x00e2, %r8
	.word 0x9002000c  ! 143: ADD_R	add 	%r8, %r12, %r8
	.word 0x900223dd  ! 144: ADD_I	add 	%r8, 0x03dd, %r8
	.word 0x90a23b97  ! 145: SUBcc_I	subcc 	%r8, 0xfffffb97, %r8
	.word 0x90123a5d  ! 146: OR_I	or 	%r8, 0xfffffa5d, %r8
	.word 0xd0484000  ! 147: LDSB_R	ldsb	[%r1 + %r0], %r8
	.word 0x901a0009  ! 148: XOR_R	xor 	%r8, %r9, %r8
	.word 0x90a224e2  ! 149: SUBcc_I	subcc 	%r8, 0x04e2, %r8
	.word 0x90b2216c  ! 150: ORNcc_I	orncc 	%r8, 0x016c, %r8
	.word 0x9022259f  ! 151: SUB_I	sub 	%r8, 0x059f, %r8
	.word 0xd0484000  ! 152: LDSB_R	ldsb	[%r1 + %r0], %r8
	.word 0x90ba0008  ! 153: XNORcc_R	xnorcc 	%r8, %r8, %r8
	.word 0xd0486051  ! 154: LDSB_I	ldsb	[%r1 + 0x0051], %r8
	.word 0xd0084000  ! 155: LDUB_R	ldub	[%r1 + %r0], %r8
	.word 0x90922f12  ! 156: ORcc_I	orcc 	%r8, 0x0f12, %r8
	.word 0x901a000a  ! 157: XOR_R	xor 	%r8, %r10, %r8
	.word 0x9032000a  ! 158: ORN_R	orn 	%r8, %r10, %r8
	.word 0x90820009  ! 159: ADDcc_R	addcc 	%r8, %r9, %r8
	.word 0x900a000b  ! 160: AND_R	and 	%r8, %r11, %r8
	.word 0x90ba3a40  ! 161: XNORcc_I	xnorcc 	%r8, 0xfffffa40, %r8
	.word 0x90aa3940  ! 162: ANDNcc_I	andncc 	%r8, 0xfffff940, %r8
	.word 0x90ba3f64  ! 163: XNORcc_I	xnorcc 	%r8, 0xffffff64, %r8
	.word 0x9092000c  ! 164: ORcc_R	orcc 	%r8, %r12, %r8
	.word 0x90120009  ! 165: OR_R	or 	%r8, %r9, %r8
	.word 0x90023af3  ! 166: ADD_I	add 	%r8, 0xfffffaf3, %r8
	.word 0xd0484000  ! 167: LDSB_R	ldsb	[%r1 + %r0], %r8
	.word 0x90222278  ! 168: SUB_I	sub 	%r8, 0x0278, %r8
	.word 0x90b2000a  ! 169: ORNcc_R	orncc 	%r8, %r10, %r8
	.word 0xd0004000  ! 170: LDUW_R	lduw	[%r1 + %r0], %r8
	.word 0x90920009  ! 171: ORcc_R	orcc 	%r8, %r9, %r8
	.word 0x903a0008  ! 172: XNOR_R	xnor 	%r8, %r8, %r8
	.word 0xd0086020  ! 173: LDUB_I	ldub	[%r1 + 0x0020], %r8
	.word 0x90b2000c  ! 174: ORNcc_R	orncc 	%r8, %r12, %r8
	.word 0x909a0008  ! 175: XORcc_R	xorcc 	%r8, %r8, %r8
	.word 0x900230a4  ! 176: ADD_I	add 	%r8, 0xfffff0a4, %r8
	.word 0x90b2000a  ! 177: ORNcc_R	orncc 	%r8, %r10, %r8
	.word 0x90b220e1  ! 178: ORNcc_I	orncc 	%r8, 0x00e1, %r8
	.word 0x900a000c  ! 179: AND_R	and 	%r8, %r12, %r8
	.word 0x90ba0008  ! 180: XNORcc_R	xnorcc 	%r8, %r8, %r8
	.word 0x903a2bd6  ! 181: XNOR_I	xnor 	%r8, 0x0bd6, %r8
	.word 0x902a3eb8  ! 182: ANDN_I	andn 	%r8, 0xfffffeb8, %r8
	.word 0x903226d1  ! 183: ORN_I	orn 	%r8, 0x06d1, %r8
	.word 0xd0084000  ! 184: LDUB_R	ldub	[%r1 + %r0], %r8
	.word 0x90aa0009  ! 185: ANDNcc_R	andncc 	%r8, %r9, %r8
	.word 0xd0006031  ! 186: LDUW_I	lduw	[%r1 + 0x0031], %r8
	.word 0x90ba3083  ! 187: XNORcc_I	xnorcc 	%r8, 0xfffff083, %r8
	.word 0x900a0008  ! 188: AND_R	and 	%r8, %r8, %r8
	.word 0x90b2000c  ! 189: ORNcc_R	orncc 	%r8, %r12, %r8
	.word 0x908a0008  ! 190: ANDcc_R	andcc 	%r8, %r8, %r8
	.word 0x9032000b  ! 191: ORN_R	orn 	%r8, %r11, %r8
	.word 0x90020008  ! 192: ADD_R	add 	%r8, %r8, %r8
	.word 0x901a000c  ! 193: XOR_R	xor 	%r8, %r12, %r8
	.word 0x90320008  ! 194: ORN_R	orn 	%r8, %r8, %r8
	.word 0x90923d00  ! 195: ORcc_I	orcc 	%r8, 0xfffffd00, %r8
	.word 0x90120009  ! 196: OR_R	or 	%r8, %r9, %r8
	.word 0x90aa33f4  ! 197: ANDNcc_I	andncc 	%r8, 0xfffff3f4, %r8
	.word 0xd0404000  ! 198: LDSW_R	ldsw	[%r1 + %r0], %r8
	.word 0x90a20008  ! 199: SUBcc_R	subcc 	%r8, %r8, %r8
	.word 0xd0484000  ! 200: LDSB_R	ldsb	[%r1 + %r0], %r8
	.word 0x90a22bfa  ! 201: SUBcc_I	subcc 	%r8, 0x0bfa, %r8
	.word 0x90aa0008  ! 202: ANDNcc_R	andncc 	%r8, %r8, %r8
	.word 0xd0104000  ! 203: LDUH_R	lduh	[%r1 + %r0], %r8
	.word 0x901a229d  ! 204: XOR_I	xor 	%r8, 0x029d, %r8
	.word 0x90a20008  ! 205: SUBcc_R	subcc 	%r8, %r8, %r8
	.word 0x909a3b2b  ! 206: XORcc_I	xorcc 	%r8, 0xfffffb2b, %r8
	.word 0xd0104000  ! 207: LDUH_R	lduh	[%r1 + %r0], %r8
	.word 0x90ba3c98  ! 208: XNORcc_I	xnorcc 	%r8, 0xfffffc98, %r8
	.word 0x908a000b  ! 209: ANDcc_R	andcc 	%r8, %r11, %r8
	.word 0x903a3cc9  ! 210: XNOR_I	xnor 	%r8, 0xfffffcc9, %r8
	.word 0x903a2d48  ! 211: XNOR_I	xnor 	%r8, 0x0d48, %r8
	.word 0xd008601a  ! 212: LDUB_I	ldub	[%r1 + 0x001a], %r8
	.word 0x909a0009  ! 213: XORcc_R	xorcc 	%r8, %r9, %r8
	.word 0x9032000c  ! 214: ORN_R	orn 	%r8, %r12, %r8
	.word 0x90122c2c  ! 215: OR_I	or 	%r8, 0x0c2c, %r8
	.word 0x9012245f  ! 216: OR_I	or 	%r8, 0x045f, %r8
	.word 0x90aa000a  ! 217: ANDNcc_R	andncc 	%r8, %r10, %r8
	.word 0x90823951  ! 218: ADDcc_I	addcc 	%r8, 0xfffff951, %r8
	.word 0xd040600f  ! 219: LDSW_I	ldsw	[%r1 + 0x000f], %r8
	.word 0x909a000c  ! 220: XORcc_R	xorcc 	%r8, %r12, %r8
	.word 0x9082231c  ! 221: ADDcc_I	addcc 	%r8, 0x031c, %r8
	.word 0xd0006079  ! 222: LDUW_I	lduw	[%r1 + 0x0079], %r8
	.word 0x900a3baf  ! 223: AND_I	and 	%r8, 0xfffffbaf, %r8
	.word 0x90020009  ! 224: ADD_R	add 	%r8, %r9, %r8
	.word 0x9002000a  ! 225: ADD_R	add 	%r8, %r10, %r8
	.word 0x90b23f43  ! 226: ORNcc_I	orncc 	%r8, 0xffffff43, %r8
	.word 0xd0484000  ! 227: LDSB_R	ldsb	[%r1 + %r0], %r8
	.word 0x90823818  ! 228: ADDcc_I	addcc 	%r8, 0xfffff818, %r8
	.word 0x9002323c  ! 229: ADD_I	add 	%r8, 0xfffff23c, %r8
	.word 0x90820008  ! 230: ADDcc_R	addcc 	%r8, %r8, %r8
	.word 0x90020008  ! 231: ADD_R	add 	%r8, %r8, %r8
	.word 0x90a23373  ! 232: SUBcc_I	subcc 	%r8, 0xfffff373, %r8
	.word 0xd008605f  ! 233: LDUB_I	ldub	[%r1 + 0x005f], %r8
	.word 0x9032000c  ! 234: ORN_R	orn 	%r8, %r12, %r8
	.word 0xd0484000  ! 235: LDSB_R	ldsb	[%r1 + %r0], %r8
	.word 0x90a23681  ! 236: SUBcc_I	subcc 	%r8, 0xfffff681, %r8
	.word 0x903a2c90  ! 237: XNOR_I	xnor 	%r8, 0x0c90, %r8
	.word 0x90a20008  ! 238: SUBcc_R	subcc 	%r8, %r8, %r8
	.word 0x90020009  ! 239: ADD_R	add 	%r8, %r9, %r8
	.word 0x900a3219  ! 240: AND_I	and 	%r8, 0xfffff219, %r8
	.word 0xd0506028  ! 241: LDSH_I	ldsh	[%r1 + 0x0028], %r8
	.word 0x901a3f92  ! 242: XOR_I	xor 	%r8, 0xffffff92, %r8
	.word 0x908a000b  ! 243: ANDcc_R	andcc 	%r8, %r11, %r8
	.word 0x90820008  ! 244: ADDcc_R	addcc 	%r8, %r8, %r8
	.word 0x901a2df5  ! 245: XOR_I	xor 	%r8, 0x0df5, %r8
	.word 0x9022000b  ! 246: SUB_R	sub 	%r8, %r11, %r8
	.word 0x90a2314f  ! 247: SUBcc_I	subcc 	%r8, 0xfffff14f, %r8
	.word 0x90aa0008  ! 248: ANDNcc_R	andncc 	%r8, %r8, %r8
	.word 0xd040603d  ! 249: LDSW_I	ldsw	[%r1 + 0x003d], %r8
	.word 0x90822a73  ! 250: ADDcc_I	addcc 	%r8, 0x0a73, %r8
	.word 0x90022aba  ! 251: ADD_I	add 	%r8, 0x0aba, %r8
	.word 0x908a000c  ! 252: ANDcc_R	andcc 	%r8, %r12, %r8
	.word 0xd010603e  ! 253: LDUH_I	lduh	[%r1 + 0x003e], %r8
	.word 0xd0006003  ! 254: LDUW_I	lduw	[%r1 + 0x0003], %r8
	.word 0x9022000b  ! 255: SUB_R	sub 	%r8, %r11, %r8
	.word 0xd048602c  ! 256: LDSB_I	ldsb	[%r1 + 0x002c], %r8
	.word 0xd0084000  ! 257: LDUB_R	ldub	[%r1 + %r0], %r8
	.word 0xd0106033  ! 258: LDUH_I	lduh	[%r1 + 0x0033], %r8
	.word 0xd0486052  ! 259: LDSB_I	ldsb	[%r1 + 0x0052], %r8
	.word 0xd0484000  ! 260: LDSB_R	ldsb	[%r1 + %r0], %r8
	.word 0xd0404000  ! 261: LDSW_R	ldsw	[%r1 + %r0], %r8
	.word 0xd0006052  ! 262: LDUW_I	lduw	[%r1 + 0x0052], %r8
	.word 0x9012000b  ! 263: OR_R	or 	%r8, %r11, %r8
	.word 0x9082261d  ! 264: ADDcc_I	addcc 	%r8, 0x061d, %r8
	.word 0x909a3562  ! 265: XORcc_I	xorcc 	%r8, 0xfffff562, %r8
	.word 0xd0106047  ! 266: LDUH_I	lduh	[%r1 + 0x0047], %r8
	.word 0x9002000c  ! 267: ADD_R	add 	%r8, %r12, %r8
	.word 0x902230b3  ! 268: SUB_I	sub 	%r8, 0xfffff0b3, %r8
	.word 0x908a0009  ! 269: ANDcc_R	andcc 	%r8, %r9, %r8
	.word 0x9082206e  ! 270: ADDcc_I	addcc 	%r8, 0x006e, %r8
	.word 0x901a000a  ! 271: XOR_R	xor 	%r8, %r10, %r8
	.word 0x90223515  ! 272: SUB_I	sub 	%r8, 0xfffff515, %r8
	.word 0xd0506067  ! 273: LDSH_I	ldsh	[%r1 + 0x0067], %r8
	.word 0xd0104000  ! 274: LDUH_R	lduh	[%r1 + %r0], %r8
	.word 0x900a3f0b  ! 275: AND_I	and 	%r8, 0xffffff0b, %r8
	.word 0xd0004000  ! 276: LDUW_R	lduw	[%r1 + %r0], %r8
	.word 0x9022000c  ! 277: SUB_R	sub 	%r8, %r12, %r8
	.word 0x901a25c4  ! 278: XOR_I	xor 	%r8, 0x05c4, %r8
	.word 0x90023fb8  ! 279: ADD_I	add 	%r8, 0xffffffb8, %r8
	.word 0x901a325b  ! 280: XOR_I	xor 	%r8, 0xfffff25b, %r8
	.word 0x901a000c  ! 281: XOR_R	xor 	%r8, %r12, %r8
	.word 0x90a231df  ! 282: SUBcc_I	subcc 	%r8, 0xfffff1df, %r8
	.word 0x90b23b03  ! 283: ORNcc_I	orncc 	%r8, 0xfffffb03, %r8
	.word 0x9022000a  ! 284: SUB_R	sub 	%r8, %r10, %r8
	.word 0x9002000a  ! 285: ADD_R	add 	%r8, %r10, %r8
	.word 0x9022208e  ! 286: SUB_I	sub 	%r8, 0x008e, %r8
	.word 0x90323c09  ! 287: ORN_I	orn 	%r8, 0xfffffc09, %r8
	.word 0x90120009  ! 288: OR_R	or 	%r8, %r9, %r8
	.word 0x90a2000a  ! 289: SUBcc_R	subcc 	%r8, %r10, %r8
	.word 0x900a2195  ! 290: AND_I	and 	%r8, 0x0195, %r8
	.word 0x90a225e5  ! 291: SUBcc_I	subcc 	%r8, 0x05e5, %r8
	.word 0x90a23385  ! 292: SUBcc_I	subcc 	%r8, 0xfffff385, %r8
	.word 0x90a23c4a  ! 293: SUBcc_I	subcc 	%r8, 0xfffffc4a, %r8
	.word 0x90820008  ! 294: ADDcc_R	addcc 	%r8, %r8, %r8
	.word 0x90020008  ! 295: ADD_R	add 	%r8, %r8, %r8
	.word 0x9002000a  ! 296: ADD_R	add 	%r8, %r10, %r8
	.word 0xd048604b  ! 297: LDSB_I	ldsb	[%r1 + 0x004b], %r8
	.word 0x90a229b7  ! 298: SUBcc_I	subcc 	%r8, 0x09b7, %r8
	.word 0xd0504000  ! 299: LDSH_R	ldsh	[%r1 + %r0], %r8
	.word 0x90a2000b  ! 300: SUBcc_R	subcc 	%r8, %r11, %r8
	.word 0x900a000a  ! 301: AND_R	and 	%r8, %r10, %r8
	.word 0x9002000b  ! 302: ADD_R	add 	%r8, %r11, %r8
	.word 0xd0104000  ! 303: LDUH_R	lduh	[%r1 + %r0], %r8
	.word 0xd0084000  ! 304: LDUB_R	ldub	[%r1 + %r0], %r8
	.word 0x90a2367f  ! 305: SUBcc_I	subcc 	%r8, 0xfffff67f, %r8
	.word 0xd0506051  ! 306: LDSH_I	ldsh	[%r1 + 0x0051], %r8
	.word 0x90ba0009  ! 307: XNORcc_R	xnorcc 	%r8, %r9, %r8
	.word 0x90923e33  ! 308: ORcc_I	orcc 	%r8, 0xfffffe33, %r8
	.word 0x902230e1  ! 309: SUB_I	sub 	%r8, 0xfffff0e1, %r8
	.word 0x90023965  ! 310: ADD_I	add 	%r8, 0xfffff965, %r8
	.word 0x90a20009  ! 311: SUBcc_R	subcc 	%r8, %r9, %r8
	.word 0x900a3299  ! 312: AND_I	and 	%r8, 0xfffff299, %r8
	.word 0x9022000b  ! 313: SUB_R	sub 	%r8, %r11, %r8
	.word 0xd0106018  ! 314: LDUH_I	lduh	[%r1 + 0x0018], %r8
	.word 0x901a000b  ! 315: XOR_R	xor 	%r8, %r11, %r8
	.word 0x909a260c  ! 316: XORcc_I	xorcc 	%r8, 0x060c, %r8
	.word 0x902a0009  ! 317: ANDN_R	andn 	%r8, %r9, %r8
	.word 0x90b22506  ! 318: ORNcc_I	orncc 	%r8, 0x0506, %r8
	.word 0x90aa2f07  ! 319: ANDNcc_I	andncc 	%r8, 0x0f07, %r8
	.word 0x9002000b  ! 320: ADD_R	add 	%r8, %r11, %r8
	.word 0xd0084000  ! 321: LDUB_R	ldub	[%r1 + %r0], %r8
	.word 0xd0404000  ! 322: LDSW_R	ldsw	[%r1 + %r0], %r8
	.word 0x90120009  ! 323: OR_R	or 	%r8, %r9, %r8
	.word 0x90a2000a  ! 324: SUBcc_R	subcc 	%r8, %r10, %r8
	.word 0x903a000a  ! 325: XNOR_R	xnor 	%r8, %r10, %r8
	.word 0xd0404000  ! 326: LDSW_R	ldsw	[%r1 + %r0], %r8
	.word 0x90822da4  ! 327: ADDcc_I	addcc 	%r8, 0x0da4, %r8
	.word 0x90320009  ! 328: ORN_R	orn 	%r8, %r9, %r8
	.word 0x90a2000b  ! 329: SUBcc_R	subcc 	%r8, %r11, %r8
	.word 0xd0006077  ! 330: LDUW_I	lduw	[%r1 + 0x0077], %r8
	.word 0x908a3c0f  ! 331: ANDcc_I	andcc 	%r8, 0xfffffc0f, %r8
	.word 0x900a2725  ! 332: AND_I	and 	%r8, 0x0725, %r8
	.word 0x90a20009  ! 333: SUBcc_R	subcc 	%r8, %r9, %r8
	.word 0x902a3fe8  ! 334: ANDN_I	andn 	%r8, 0xffffffe8, %r8
	.word 0x9002270c  ! 335: ADD_I	add 	%r8, 0x070c, %r8
	.word 0x9022000a  ! 336: SUB_R	sub 	%r8, %r10, %r8
	.word 0x901a20a2  ! 337: XOR_I	xor 	%r8, 0x00a2, %r8
	.word 0x90b20009  ! 338: ORNcc_R	orncc 	%r8, %r9, %r8
	.word 0x9022000c  ! 339: SUB_R	sub 	%r8, %r12, %r8
	.word 0xd0486038  ! 340: LDSB_I	ldsb	[%r1 + 0x0038], %r8
	.word 0x9022000b  ! 341: SUB_R	sub 	%r8, %r11, %r8
	.word 0x90aa3dc5  ! 342: ANDNcc_I	andncc 	%r8, 0xfffffdc5, %r8
	.word 0x90922fd5  ! 343: ORcc_I	orcc 	%r8, 0x0fd5, %r8
	.word 0x90320009  ! 344: ORN_R	orn 	%r8, %r9, %r8
	.word 0x900236ab  ! 345: ADD_I	add 	%r8, 0xfffff6ab, %r8
	.word 0x90923112  ! 346: ORcc_I	orcc 	%r8, 0xfffff112, %r8
	.word 0x90a23783  ! 347: SUBcc_I	subcc 	%r8, 0xfffff783, %r8
	.word 0x9022253e  ! 348: SUB_I	sub 	%r8, 0x053e, %r8
	.word 0x9002000a  ! 349: ADD_R	add 	%r8, %r10, %r8
	.word 0x90ba3862  ! 350: XNORcc_I	xnorcc 	%r8, 0xfffff862, %r8
	.word 0xd0084000  ! 351: LDUB_R	ldub	[%r1 + %r0], %r8
	.word 0xd0106020  ! 352: LDUH_I	lduh	[%r1 + 0x0020], %r8
	.word 0x90a20008  ! 353: SUBcc_R	subcc 	%r8, %r8, %r8
	.word 0x90323763  ! 354: ORN_I	orn 	%r8, 0xfffff763, %r8
	.word 0xd0486013  ! 355: LDSB_I	ldsb	[%r1 + 0x0013], %r8
	.word 0x9002000a  ! 356: ADD_R	add 	%r8, %r10, %r8
	.word 0xd0104000  ! 357: LDUH_R	lduh	[%r1 + %r0], %r8
	.word 0x90b22bf2  ! 358: ORNcc_I	orncc 	%r8, 0x0bf2, %r8
	.word 0x9082000c  ! 359: ADDcc_R	addcc 	%r8, %r12, %r8
	.word 0x90aa2464  ! 360: ANDNcc_I	andncc 	%r8, 0x0464, %r8
	.word 0xd0104000  ! 361: LDUH_R	lduh	[%r1 + %r0], %r8
	.word 0x900235f2  ! 362: ADD_I	add 	%r8, 0xfffff5f2, %r8
	.word 0x9002000a  ! 363: ADD_R	add 	%r8, %r10, %r8
	.word 0x90b20009  ! 364: ORNcc_R	orncc 	%r8, %r9, %r8
	.word 0x90222a6e  ! 365: SUB_I	sub 	%r8, 0x0a6e, %r8
	.word 0x901a35f1  ! 366: XOR_I	xor 	%r8, 0xfffff5f1, %r8
	.word 0x90a2000c  ! 367: SUBcc_R	subcc 	%r8, %r12, %r8
	.word 0xd0084000  ! 368: LDUB_R	ldub	[%r1 + %r0], %r8
	.word 0x90022241  ! 369: ADD_I	add 	%r8, 0x0241, %r8
	.word 0x909220fe  ! 370: ORcc_I	orcc 	%r8, 0x00fe, %r8
	.word 0x9022338c  ! 371: SUB_I	sub 	%r8, 0xfffff38c, %r8
	.word 0xd000607d  ! 372: LDUW_I	lduw	[%r1 + 0x007d], %r8
	.word 0x903a3f47  ! 373: XNOR_I	xnor 	%r8, 0xffffff47, %r8
	.word 0x90223bfe  ! 374: SUB_I	sub 	%r8, 0xfffffbfe, %r8
	.word 0x9032000a  ! 375: ORN_R	orn 	%r8, %r10, %r8
	.word 0x903a3c05  ! 376: XNOR_I	xnor 	%r8, 0xfffffc05, %r8
	.word 0x90023d43  ! 377: ADD_I	add 	%r8, 0xfffffd43, %r8
	.word 0xd0004000  ! 378: LDUW_R	lduw	[%r1 + %r0], %r8
	.word 0x90ba3248  ! 379: XNORcc_I	xnorcc 	%r8, 0xfffff248, %r8
	.word 0x90820008  ! 380: ADDcc_R	addcc 	%r8, %r8, %r8
	.word 0x90023f4c  ! 381: ADD_I	add 	%r8, 0xffffff4c, %r8
	.word 0x90a2000c  ! 382: SUBcc_R	subcc 	%r8, %r12, %r8
	.word 0x90920009  ! 383: ORcc_R	orcc 	%r8, %r9, %r8
	.word 0x900229b0  ! 384: ADD_I	add 	%r8, 0x09b0, %r8
	.word 0xd0484000  ! 385: LDSB_R	ldsb	[%r1 + %r0], %r8
	.word 0x9022000c  ! 386: SUB_R	sub 	%r8, %r12, %r8
	.word 0xd0404000  ! 387: LDSW_R	ldsw	[%r1 + %r0], %r8
	.word 0xd0406008  ! 388: LDSW_I	ldsw	[%r1 + 0x0008], %r8
	.word 0x901226db  ! 389: OR_I	or 	%r8, 0x06db, %r8
	.word 0xd0104000  ! 390: LDUH_R	lduh	[%r1 + %r0], %r8
	.word 0x9082000a  ! 391: ADDcc_R	addcc 	%r8, %r10, %r8
	.word 0x90020009  ! 392: ADD_R	add 	%r8, %r9, %r8
	.word 0x90822773  ! 393: ADDcc_I	addcc 	%r8, 0x0773, %r8
	.word 0xd000601c  ! 394: LDUW_I	lduw	[%r1 + 0x001c], %r8
	.word 0x901a0008  ! 395: XOR_R	xor 	%r8, %r8, %r8
	.word 0x90023b17  ! 396: ADD_I	add 	%r8, 0xfffffb17, %r8
	.word 0xd0086016  ! 397: LDUB_I	ldub	[%r1 + 0x0016], %r8
	.word 0x90923ea1  ! 398: ORcc_I	orcc 	%r8, 0xfffffea1, %r8
	.word 0x901a2989  ! 399: XOR_I	xor 	%r8, 0x0989, %r8
	.word 0x901a27b8  ! 400: XOR_I	xor 	%r8, 0x07b8, %r8
	.word 0xd0506006  ! 401: LDSH_I	ldsh	[%r1 + 0x0006], %r8
	.word 0x90a225cc  ! 402: SUBcc_I	subcc 	%r8, 0x05cc, %r8
	.word 0x90320009  ! 403: ORN_R	orn 	%r8, %r9, %r8
	.word 0xd0504000  ! 404: LDSH_R	ldsh	[%r1 + %r0], %r8
	.word 0x90220008  ! 405: SUB_R	sub 	%r8, %r8, %r8
	.word 0x90222474  ! 406: SUB_I	sub 	%r8, 0x0474, %r8
	.word 0x90a2000c  ! 407: SUBcc_R	subcc 	%r8, %r12, %r8
	.word 0x90920009  ! 408: ORcc_R	orcc 	%r8, %r9, %r8
	.word 0xd0506002  ! 409: LDSH_I	ldsh	[%r1 + 0x0002], %r8
	.word 0x90223415  ! 410: SUB_I	sub 	%r8, 0xfffff415, %r8
	.word 0x90b23dd9  ! 411: ORNcc_I	orncc 	%r8, 0xfffffdd9, %r8
	.word 0x909a282d  ! 412: XORcc_I	xorcc 	%r8, 0x082d, %r8
	.word 0x90aa346a  ! 413: ANDNcc_I	andncc 	%r8, 0xfffff46a, %r8
	.word 0x90a232a6  ! 414: SUBcc_I	subcc 	%r8, 0xfffff2a6, %r8
	.word 0x909a2adb  ! 415: XORcc_I	xorcc 	%r8, 0x0adb, %r8
	.word 0xd050602e  ! 416: LDSH_I	ldsh	[%r1 + 0x002e], %r8
	.word 0x90822e3d  ! 417: ADDcc_I	addcc 	%r8, 0x0e3d, %r8
	.word 0x9002000c  ! 418: ADD_R	add 	%r8, %r12, %r8
	.word 0x901a27d8  ! 419: XOR_I	xor 	%r8, 0x07d8, %r8
	.word 0xd0404000  ! 420: LDSW_R	ldsw	[%r1 + %r0], %r8
	.word 0x908a2731  ! 421: ANDcc_I	andcc 	%r8, 0x0731, %r8
	.word 0x9022000b  ! 422: SUB_R	sub 	%r8, %r11, %r8
	.word 0xd0084000  ! 423: LDUB_R	ldub	[%r1 + %r0], %r8
	.word 0x9082000b  ! 424: ADDcc_R	addcc 	%r8, %r11, %r8
	.word 0x902a2c18  ! 425: ANDN_I	andn 	%r8, 0x0c18, %r8
	.word 0xd0504000  ! 426: LDSH_R	ldsh	[%r1 + %r0], %r8
	.word 0x901a2798  ! 427: XOR_I	xor 	%r8, 0x0798, %r8
	.word 0x90222d41  ! 428: SUB_I	sub 	%r8, 0x0d41, %r8
	.word 0x903a2054  ! 429: XNOR_I	xnor 	%r8, 0x0054, %r8
	.word 0x90ba000a  ! 430: XNORcc_R	xnorcc 	%r8, %r10, %r8
	.word 0x90923566  ! 431: ORcc_I	orcc 	%r8, 0xfffff566, %r8
	.word 0x900a28eb  ! 432: AND_I	and 	%r8, 0x08eb, %r8
	.word 0x90b23449  ! 433: ORNcc_I	orncc 	%r8, 0xfffff449, %r8
	.word 0xd0106038  ! 434: LDUH_I	lduh	[%r1 + 0x0038], %r8
	.word 0x90a20009  ! 435: SUBcc_R	subcc 	%r8, %r9, %r8
	.word 0x90b20008  ! 436: ORNcc_R	orncc 	%r8, %r8, %r8
	.word 0x90022774  ! 437: ADD_I	add 	%r8, 0x0774, %r8
	.word 0x90322f69  ! 438: ORN_I	orn 	%r8, 0x0f69, %r8
	.word 0x902222f1  ! 439: SUB_I	sub 	%r8, 0x02f1, %r8
	.word 0x908a3de5  ! 440: ANDcc_I	andcc 	%r8, 0xfffffde5, %r8
	.word 0x900a3a1b  ! 441: AND_I	and 	%r8, 0xfffffa1b, %r8
	.word 0x90b22a7b  ! 442: ORNcc_I	orncc 	%r8, 0x0a7b, %r8
	.word 0x9022279c  ! 443: SUB_I	sub 	%r8, 0x079c, %r8
	.word 0x900a000b  ! 444: AND_R	and 	%r8, %r11, %r8
	.word 0x90020008  ! 445: ADD_R	add 	%r8, %r8, %r8
	.word 0x90222eb9  ! 446: SUB_I	sub 	%r8, 0x0eb9, %r8
	.word 0x903a0009  ! 447: XNOR_R	xnor 	%r8, %r9, %r8
	.word 0x90a22733  ! 448: SUBcc_I	subcc 	%r8, 0x0733, %r8
	.word 0x90ba000a  ! 449: XNORcc_R	xnorcc 	%r8, %r10, %r8
	.word 0x9022000a  ! 450: SUB_R	sub 	%r8, %r10, %r8
	.word 0x901a000a  ! 451: XOR_R	xor 	%r8, %r10, %r8
	.word 0x9002342b  ! 452: ADD_I	add 	%r8, 0xfffff42b, %r8
	.word 0x90922952  ! 453: ORcc_I	orcc 	%r8, 0x0952, %r8
	.word 0x90123b18  ! 454: OR_I	or 	%r8, 0xfffffb18, %r8
	.word 0xd0486008  ! 455: LDSB_I	ldsb	[%r1 + 0x0008], %r8
	.word 0x9022219c  ! 456: SUB_I	sub 	%r8, 0x019c, %r8
	.word 0x9012000b  ! 457: OR_R	or 	%r8, %r11, %r8
	.word 0x903a000b  ! 458: XNOR_R	xnor 	%r8, %r11, %r8
	.word 0x9002300a  ! 459: ADD_I	add 	%r8, 0xfffff00a, %r8
	.word 0x903a0009  ! 460: XNOR_R	xnor 	%r8, %r9, %r8
	.word 0xd0086036  ! 461: LDUB_I	ldub	[%r1 + 0x0036], %r8
	.word 0x903a32df  ! 462: XNOR_I	xnor 	%r8, 0xfffff2df, %r8
	.word 0xd000602e  ! 463: LDUW_I	lduw	[%r1 + 0x002e], %r8
	.word 0x90ba000a  ! 464: XNORcc_R	xnorcc 	%r8, %r10, %r8
	.word 0x90923f50  ! 465: ORcc_I	orcc 	%r8, 0xffffff50, %r8
	.word 0x908a2d5a  ! 466: ANDcc_I	andcc 	%r8, 0x0d5a, %r8
	.word 0xd0084000  ! 467: LDUB_R	ldub	[%r1 + %r0], %r8
	.word 0x902228e8  ! 468: SUB_I	sub 	%r8, 0x08e8, %r8
	.word 0x90a2000b  ! 469: SUBcc_R	subcc 	%r8, %r11, %r8
	.word 0x90ba3525  ! 470: XNORcc_I	xnorcc 	%r8, 0xfffff525, %r8
	.word 0x901230f6  ! 471: OR_I	or 	%r8, 0xfffff0f6, %r8
	.word 0x9022338e  ! 472: SUB_I	sub 	%r8, 0xfffff38e, %r8
	.word 0x9012000c  ! 473: OR_R	or 	%r8, %r12, %r8
	.word 0x90023ba1  ! 474: ADD_I	add 	%r8, 0xfffffba1, %r8
	.word 0x902a3980  ! 475: ANDN_I	andn 	%r8, 0xfffff980, %r8
	.word 0x909a2123  ! 476: XORcc_I	xorcc 	%r8, 0x0123, %r8
	.word 0x903a000c  ! 477: XNOR_R	xnor 	%r8, %r12, %r8
	.word 0x9032000a  ! 478: ORN_R	orn 	%r8, %r10, %r8
	.word 0x9032245e  ! 479: ORN_I	orn 	%r8, 0x045e, %r8
	.word 0x9022000b  ! 480: SUB_R	sub 	%r8, %r11, %r8
	.word 0xd0104000  ! 481: LDUH_R	lduh	[%r1 + %r0], %r8
	.word 0x90a20009  ! 482: SUBcc_R	subcc 	%r8, %r9, %r8
	.word 0x901a000a  ! 483: XOR_R	xor 	%r8, %r10, %r8
	.word 0x90a2000c  ! 484: SUBcc_R	subcc 	%r8, %r12, %r8
	.word 0xd050601e  ! 485: LDSH_I	ldsh	[%r1 + 0x001e], %r8
	.word 0xd048607b  ! 486: LDSB_I	ldsb	[%r1 + 0x007b], %r8
	.word 0x903a000c  ! 487: XNOR_R	xnor 	%r8, %r12, %r8
	.word 0xd0484000  ! 488: LDSB_R	ldsb	[%r1 + %r0], %r8
	.word 0x9012000c  ! 489: OR_R	or 	%r8, %r12, %r8
	.word 0x90aa000b  ! 490: ANDNcc_R	andncc 	%r8, %r11, %r8
	.word 0x90023a09  ! 491: ADD_I	add 	%r8, 0xfffffa09, %r8
	.word 0x90a23f82  ! 492: SUBcc_I	subcc 	%r8, 0xffffff82, %r8
	.word 0x90122ac7  ! 493: OR_I	or 	%r8, 0x0ac7, %r8
	.word 0xd0404000  ! 494: LDSW_R	ldsw	[%r1 + %r0], %r8
	.word 0x9032000c  ! 495: ORN_R	orn 	%r8, %r12, %r8
	.word 0xd050600c  ! 496: LDSH_I	ldsh	[%r1 + 0x000c], %r8
	.word 0x90a22ec1  ! 497: SUBcc_I	subcc 	%r8, 0x0ec1, %r8
	.word 0x90a229a1  ! 498: SUBcc_I	subcc 	%r8, 0x09a1, %r8
	.word 0x90023838  ! 499: ADD_I	add 	%r8, 0xfffff838, %r8
	.word 0x9082000b  ! 500: ADDcc_R	addcc 	%r8, %r11, %r8
	.word 0xd0506049  ! 501: LDSH_I	ldsh	[%r1 + 0x0049], %r8
	.word 0x90020009  ! 502: ADD_R	add 	%r8, %r9, %r8
	.word 0x900228e1  ! 503: ADD_I	add 	%r8, 0x08e1, %r8
	.word 0x902a000b  ! 504: ANDN_R	andn 	%r8, %r11, %r8
	.word 0x90a20009  ! 505: SUBcc_R	subcc 	%r8, %r9, %r8
	.word 0x901a3a6c  ! 506: XOR_I	xor 	%r8, 0xfffffa6c, %r8
	.word 0x90020008  ! 507: ADD_R	add 	%r8, %r8, %r8
	.word 0x90a23817  ! 508: SUBcc_I	subcc 	%r8, 0xfffff817, %r8
	.word 0x909a0008  ! 509: XORcc_R	xorcc 	%r8, %r8, %r8
	.word 0x90222c35  ! 510: SUB_I	sub 	%r8, 0x0c35, %r8
	.word 0x90a20009  ! 511: SUBcc_R	subcc 	%r8, %r9, %r8
	.word 0x90320008  ! 512: ORN_R	orn 	%r8, %r8, %r8
	.word 0xd0104000  ! 513: LDUH_R	lduh	[%r1 + %r0], %r8
	.word 0x908a000a  ! 514: ANDcc_R	andcc 	%r8, %r10, %r8
	.word 0x902a2324  ! 515: ANDN_I	andn 	%r8, 0x0324, %r8
	.word 0x90a22dcb  ! 516: SUBcc_I	subcc 	%r8, 0x0dcb, %r8
	.word 0x90823888  ! 517: ADDcc_I	addcc 	%r8, 0xfffff888, %r8
	.word 0x90823512  ! 518: ADDcc_I	addcc 	%r8, 0xfffff512, %r8
	.word 0x90aa3ea3  ! 519: ANDNcc_I	andncc 	%r8, 0xfffffea3, %r8
	.word 0x90aa000b  ! 520: ANDNcc_R	andncc 	%r8, %r11, %r8
	.word 0xd0404000  ! 521: LDSW_R	ldsw	[%r1 + %r0], %r8
	.word 0xd0004000  ! 522: LDUW_R	lduw	[%r1 + %r0], %r8
	.word 0x90123f66  ! 523: OR_I	or 	%r8, 0xffffff66, %r8
	.word 0x90823a72  ! 524: ADDcc_I	addcc 	%r8, 0xfffffa72, %r8
	.word 0xd0486070  ! 525: LDSB_I	ldsb	[%r1 + 0x0070], %r8
	.word 0xd0404000  ! 526: LDSW_R	ldsw	[%r1 + %r0], %r8
	.word 0x902232ad  ! 527: SUB_I	sub 	%r8, 0xfffff2ad, %r8
	.word 0xd0106056  ! 528: LDUH_I	lduh	[%r1 + 0x0056], %r8
	.word 0x9022000a  ! 529: SUB_R	sub 	%r8, %r10, %r8
	.word 0x90aa2fff  ! 530: ANDNcc_I	andncc 	%r8, 0x0fff, %r8
	.word 0xd0484000  ! 531: LDSB_R	ldsb	[%r1 + %r0], %r8
	.word 0x909a2e0a  ! 532: XORcc_I	xorcc 	%r8, 0x0e0a, %r8
	.word 0xd0086021  ! 533: LDUB_I	ldub	[%r1 + 0x0021], %r8
	.word 0xd0006027  ! 534: LDUW_I	lduw	[%r1 + 0x0027], %r8
	.word 0xd0104000  ! 535: LDUH_R	lduh	[%r1 + %r0], %r8
	.word 0x90a22955  ! 536: SUBcc_I	subcc 	%r8, 0x0955, %r8
	.word 0x900a3123  ! 537: AND_I	and 	%r8, 0xfffff123, %r8
	.word 0x90a2000a  ! 538: SUBcc_R	subcc 	%r8, %r10, %r8
	.word 0x903a0009  ! 539: XNOR_R	xnor 	%r8, %r9, %r8
	.word 0x9022000a  ! 540: SUB_R	sub 	%r8, %r10, %r8
	.word 0xd0484000  ! 541: LDSB_R	ldsb	[%r1 + %r0], %r8
	.word 0xd000600e  ! 542: LDUW_I	lduw	[%r1 + 0x000e], %r8
	.word 0x9002000a  ! 543: ADD_R	add 	%r8, %r10, %r8
	.word 0xd0004000  ! 544: LDUW_R	lduw	[%r1 + %r0], %r8
	.word 0x90220009  ! 545: SUB_R	sub 	%r8, %r9, %r8
	.word 0x90a23ce6  ! 546: SUBcc_I	subcc 	%r8, 0xfffffce6, %r8
	.word 0x909a2358  ! 547: XORcc_I	xorcc 	%r8, 0x0358, %r8
	.word 0x90a20009  ! 548: SUBcc_R	subcc 	%r8, %r9, %r8
	.word 0x90a2000a  ! 549: SUBcc_R	subcc 	%r8, %r10, %r8
	.word 0xd0484000  ! 550: LDSB_R	ldsb	[%r1 + %r0], %r8
	.word 0x90820009  ! 551: ADDcc_R	addcc 	%r8, %r9, %r8
	.word 0x9082000a  ! 552: ADDcc_R	addcc 	%r8, %r10, %r8
	.word 0x90023e1b  ! 553: ADD_I	add 	%r8, 0xfffffe1b, %r8
	.word 0x9032000b  ! 554: ORN_R	orn 	%r8, %r11, %r8
	.word 0x9082000a  ! 555: ADDcc_R	addcc 	%r8, %r10, %r8
	.word 0x90aa2866  ! 556: ANDNcc_I	andncc 	%r8, 0x0866, %r8
	.word 0xd0004000  ! 557: LDUW_R	lduw	[%r1 + %r0], %r8
	.word 0xd0486071  ! 558: LDSB_I	ldsb	[%r1 + 0x0071], %r8
	.word 0x90aa306b  ! 559: ANDNcc_I	andncc 	%r8, 0xfffff06b, %r8
	.word 0x9032000b  ! 560: ORN_R	orn 	%r8, %r11, %r8
	.word 0x90ba0009  ! 561: XNORcc_R	xnorcc 	%r8, %r9, %r8
	.word 0x90aa000b  ! 562: ANDNcc_R	andncc 	%r8, %r11, %r8
	.word 0x9082213a  ! 563: ADDcc_I	addcc 	%r8, 0x013a, %r8
	.word 0x90a20008  ! 564: SUBcc_R	subcc 	%r8, %r8, %r8
	.word 0x9012000a  ! 565: OR_R	or 	%r8, %r10, %r8
	.word 0x908221e3  ! 566: ADDcc_I	addcc 	%r8, 0x01e3, %r8
	.word 0x90823f28  ! 567: ADDcc_I	addcc 	%r8, 0xffffff28, %r8
	.word 0x9022000b  ! 568: SUB_R	sub 	%r8, %r11, %r8
	.word 0x90822db7  ! 569: ADDcc_I	addcc 	%r8, 0x0db7, %r8
	.word 0x90822269  ! 570: ADDcc_I	addcc 	%r8, 0x0269, %r8
	.word 0x90223b04  ! 571: SUB_I	sub 	%r8, 0xfffffb04, %r8
	.word 0x903a267d  ! 572: XNOR_I	xnor 	%r8, 0x067d, %r8
	.word 0x90023dca  ! 573: ADD_I	add 	%r8, 0xfffffdca, %r8
	.word 0x9012000a  ! 574: OR_R	or 	%r8, %r10, %r8
	.word 0x90823f80  ! 575: ADDcc_I	addcc 	%r8, 0xffffff80, %r8
	.word 0x90023634  ! 576: ADD_I	add 	%r8, 0xfffff634, %r8
	.word 0x90a20009  ! 577: SUBcc_R	subcc 	%r8, %r9, %r8
	.word 0x90122d29  ! 578: OR_I	or 	%r8, 0x0d29, %r8
	.word 0xd0404000  ! 579: LDSW_R	ldsw	[%r1 + %r0], %r8
	.word 0x90a22213  ! 580: SUBcc_I	subcc 	%r8, 0x0213, %r8
	.word 0xd0404000  ! 581: LDSW_R	ldsw	[%r1 + %r0], %r8
	.word 0x90ba000a  ! 582: XNORcc_R	xnorcc 	%r8, %r10, %r8
	.word 0xd0506062  ! 583: LDSH_I	ldsh	[%r1 + 0x0062], %r8
	.word 0xd000602f  ! 584: LDUW_I	lduw	[%r1 + 0x002f], %r8
	.word 0x90322321  ! 585: ORN_I	orn 	%r8, 0x0321, %r8
	.word 0x90822bba  ! 586: ADDcc_I	addcc 	%r8, 0x0bba, %r8
	.word 0xd0004000  ! 587: LDUW_R	lduw	[%r1 + %r0], %r8
	.word 0xd0404000  ! 588: LDSW_R	ldsw	[%r1 + %r0], %r8
	.word 0x90ba000b  ! 589: XNORcc_R	xnorcc 	%r8, %r11, %r8
	.word 0x9082000b  ! 590: ADDcc_R	addcc 	%r8, %r11, %r8
	.word 0x900a0009  ! 591: AND_R	and 	%r8, %r9, %r8
	.word 0x902a2224  ! 592: ANDN_I	andn 	%r8, 0x0224, %r8
	.word 0x9082000c  ! 593: ADDcc_R	addcc 	%r8, %r12, %r8
	.word 0x90822da5  ! 594: ADDcc_I	addcc 	%r8, 0x0da5, %r8
	.word 0x9002200d  ! 595: ADD_I	add 	%r8, 0x000d, %r8
	.word 0xd0086044  ! 596: LDUB_I	ldub	[%r1 + 0x0044], %r8
	.word 0xd0486037  ! 597: LDSB_I	ldsb	[%r1 + 0x0037], %r8
	.word 0x900a3904  ! 598: AND_I	and 	%r8, 0xfffff904, %r8
	.word 0xd0084000  ! 599: LDUB_R	ldub	[%r1 + %r0], %r8
	.word 0x90a22ea4  ! 600: SUBcc_I	subcc 	%r8, 0x0ea4, %r8
	.word 0x90823326  ! 601: ADDcc_I	addcc 	%r8, 0xfffff326, %r8
	.word 0x903a000c  ! 602: XNOR_R	xnor 	%r8, %r12, %r8
	.word 0x900220b7  ! 603: ADD_I	add 	%r8, 0x00b7, %r8
	.word 0x909a3d00  ! 604: XORcc_I	xorcc 	%r8, 0xfffffd00, %r8
	.word 0x9032000c  ! 605: ORN_R	orn 	%r8, %r12, %r8
	.word 0x90a2222d  ! 606: SUBcc_I	subcc 	%r8, 0x022d, %r8
	.word 0x90a2000a  ! 607: SUBcc_R	subcc 	%r8, %r10, %r8
	.word 0x90ba3cef  ! 608: XNORcc_I	xnorcc 	%r8, 0xfffffcef, %r8
	.word 0x902a000c  ! 609: ANDN_R	andn 	%r8, %r12, %r8
	.word 0x900a2640  ! 610: AND_I	and 	%r8, 0x0640, %r8
	.word 0xd0484000  ! 611: LDSB_R	ldsb	[%r1 + %r0], %r8
	.word 0xd0406073  ! 612: LDSW_I	ldsw	[%r1 + 0x0073], %r8
	.word 0x900a3331  ! 613: AND_I	and 	%r8, 0xfffff331, %r8
	.word 0x90b22e4d  ! 614: ORNcc_I	orncc 	%r8, 0x0e4d, %r8
	.word 0x90220009  ! 615: SUB_R	sub 	%r8, %r9, %r8
	.word 0x908a000b  ! 616: ANDcc_R	andcc 	%r8, %r11, %r8
	.word 0x9032000a  ! 617: ORN_R	orn 	%r8, %r10, %r8
	.word 0x90ba303d  ! 618: XNORcc_I	xnorcc 	%r8, 0xfffff03d, %r8
	.word 0x903a3b63  ! 619: XNOR_I	xnor 	%r8, 0xfffffb63, %r8
	.word 0x90020009  ! 620: ADD_R	add 	%r8, %r9, %r8
	.word 0x900a000c  ! 621: AND_R	and 	%r8, %r12, %r8
	.word 0x90a20008  ! 622: SUBcc_R	subcc 	%r8, %r8, %r8
	.word 0xd0106075  ! 623: LDUH_I	lduh	[%r1 + 0x0075], %r8
	.word 0x903235c4  ! 624: ORN_I	orn 	%r8, 0xfffff5c4, %r8
	.word 0x908a000b  ! 625: ANDcc_R	andcc 	%r8, %r11, %r8
	.word 0xd0084000  ! 626: LDUB_R	ldub	[%r1 + %r0], %r8
	.word 0xd0086003  ! 627: LDUB_I	ldub	[%r1 + 0x0003], %r8
	.word 0x90a23f38  ! 628: SUBcc_I	subcc 	%r8, 0xffffff38, %r8
	.word 0x90a20008  ! 629: SUBcc_R	subcc 	%r8, %r8, %r8
	.word 0xd0486028  ! 630: LDSB_I	ldsb	[%r1 + 0x0028], %r8
	.word 0x903a0008  ! 631: XNOR_R	xnor 	%r8, %r8, %r8
	.word 0x90ba0009  ! 632: XNORcc_R	xnorcc 	%r8, %r9, %r8
	.word 0x903a3076  ! 633: XNOR_I	xnor 	%r8, 0xfffff076, %r8
	.word 0xd0086019  ! 634: LDUB_I	ldub	[%r1 + 0x0019], %r8
	.word 0xd0104000  ! 635: LDUH_R	lduh	[%r1 + %r0], %r8
	.word 0xd0084000  ! 636: LDUB_R	ldub	[%r1 + %r0], %r8
	.word 0x900a3c67  ! 637: AND_I	and 	%r8, 0xfffffc67, %r8
	.word 0x908223f4  ! 638: ADDcc_I	addcc 	%r8, 0x03f4, %r8
	.word 0x901a24de  ! 639: XOR_I	xor 	%r8, 0x04de, %r8
	.word 0x90220009  ! 640: SUB_R	sub 	%r8, %r9, %r8
	.word 0xd0004000  ! 641: LDUW_R	lduw	[%r1 + %r0], %r8
	.word 0x90aa3810  ! 642: ANDNcc_I	andncc 	%r8, 0xfffff810, %r8
	.word 0xd000606c  ! 643: LDUW_I	lduw	[%r1 + 0x006c], %r8
	.word 0x909a3bce  ! 644: XORcc_I	xorcc 	%r8, 0xfffffbce, %r8
	.word 0x9032000b  ! 645: ORN_R	orn 	%r8, %r11, %r8
	.word 0x900235ed  ! 646: ADD_I	add 	%r8, 0xfffff5ed, %r8
	.word 0x908a000c  ! 647: ANDcc_R	andcc 	%r8, %r12, %r8
	.word 0xd010604c  ! 648: LDUH_I	lduh	[%r1 + 0x004c], %r8
	.word 0x90a20008  ! 649: SUBcc_R	subcc 	%r8, %r8, %r8
	.word 0x90823112  ! 650: ADDcc_I	addcc 	%r8, 0xfffff112, %r8
	.word 0x9002000a  ! 651: ADD_R	add 	%r8, %r10, %r8
	.word 0x90ba29c2  ! 652: XNORcc_I	xnorcc 	%r8, 0x09c2, %r8
	.word 0xd0004000  ! 653: LDUW_R	lduw	[%r1 + %r0], %r8
	.word 0x90a23613  ! 654: SUBcc_I	subcc 	%r8, 0xfffff613, %r8
	.word 0x901a0008  ! 655: XOR_R	xor 	%r8, %r8, %r8
	.word 0x901a26ac  ! 656: XOR_I	xor 	%r8, 0x06ac, %r8
	.word 0x9022000c  ! 657: SUB_R	sub 	%r8, %r12, %r8
	.word 0x90a23d36  ! 658: SUBcc_I	subcc 	%r8, 0xfffffd36, %r8
	.word 0x90a237fd  ! 659: SUBcc_I	subcc 	%r8, 0xfffff7fd, %r8
	.word 0xd0406056  ! 660: LDSW_I	ldsw	[%r1 + 0x0056], %r8
	.word 0x903236c9  ! 661: ORN_I	orn 	%r8, 0xfffff6c9, %r8
	.word 0x90122a15  ! 662: OR_I	or 	%r8, 0x0a15, %r8
	.word 0x90b23b19  ! 663: ORNcc_I	orncc 	%r8, 0xfffffb19, %r8
	.word 0x9092000b  ! 664: ORcc_R	orcc 	%r8, %r11, %r8
	.word 0x90a2000b  ! 665: SUBcc_R	subcc 	%r8, %r11, %r8
	.word 0x900a238a  ! 666: AND_I	and 	%r8, 0x038a, %r8
	.word 0x90220009  ! 667: SUB_R	sub 	%r8, %r9, %r8
	.word 0xd048605e  ! 668: LDSB_I	ldsb	[%r1 + 0x005e], %r8
	.word 0xd0106062  ! 669: LDUH_I	lduh	[%r1 + 0x0062], %r8
	.word 0xd0404000  ! 670: LDSW_R	ldsw	[%r1 + %r0], %r8
	.word 0xd0084000  ! 671: LDUB_R	ldub	[%r1 + %r0], %r8
	.word 0x90ba000a  ! 672: XNORcc_R	xnorcc 	%r8, %r10, %r8
	.word 0x902a2203  ! 673: ANDN_I	andn 	%r8, 0x0203, %r8
	.word 0x90a22adc  ! 674: SUBcc_I	subcc 	%r8, 0x0adc, %r8
	.word 0x90b23dbf  ! 675: ORNcc_I	orncc 	%r8, 0xfffffdbf, %r8
	.word 0x903a3c4f  ! 676: XNOR_I	xnor 	%r8, 0xfffffc4f, %r8
	.word 0x90323270  ! 677: ORN_I	orn 	%r8, 0xfffff270, %r8
	.word 0x90223176  ! 678: SUB_I	sub 	%r8, 0xfffff176, %r8
	.word 0x902a30f4  ! 679: ANDN_I	andn 	%r8, 0xfffff0f4, %r8
	.word 0x90220009  ! 680: SUB_R	sub 	%r8, %r9, %r8
	.word 0x9082385c  ! 681: ADDcc_I	addcc 	%r8, 0xfffff85c, %r8
	.word 0x901237ff  ! 682: OR_I	or 	%r8, 0xfffff7ff, %r8
	.word 0xd0406026  ! 683: LDSW_I	ldsw	[%r1 + 0x0026], %r8
	.word 0x90222c06  ! 684: SUB_I	sub 	%r8, 0x0c06, %r8
	.word 0x90a2354b  ! 685: SUBcc_I	subcc 	%r8, 0xfffff54b, %r8
	.word 0xd0006059  ! 686: LDUW_I	lduw	[%r1 + 0x0059], %r8
	.word 0x909a000c  ! 687: XORcc_R	xorcc 	%r8, %r12, %r8
	.word 0x903a3711  ! 688: XNOR_I	xnor 	%r8, 0xfffff711, %r8
	.word 0xd0484000  ! 689: LDSB_R	ldsb	[%r1 + %r0], %r8
	.word 0x903a0009  ! 690: XNOR_R	xnor 	%r8, %r9, %r8
	.word 0xd048603e  ! 691: LDSB_I	ldsb	[%r1 + 0x003e], %r8
	.word 0x9002000b  ! 692: ADD_R	add 	%r8, %r11, %r8
	.word 0xd040603b  ! 693: LDSW_I	ldsw	[%r1 + 0x003b], %r8
	.word 0x9082000b  ! 694: ADDcc_R	addcc 	%r8, %r11, %r8
	.word 0xd0006025  ! 695: LDUW_I	lduw	[%r1 + 0x0025], %r8
	.word 0x903a0008  ! 696: XNOR_R	xnor 	%r8, %r8, %r8
	.word 0x9032000a  ! 697: ORN_R	orn 	%r8, %r10, %r8
	.word 0x901a35e8  ! 698: XOR_I	xor 	%r8, 0xfffff5e8, %r8
	.word 0x9082000a  ! 699: ADDcc_R	addcc 	%r8, %r10, %r8
	.word 0x90923534  ! 700: ORcc_I	orcc 	%r8, 0xfffff534, %r8
	.word 0x90ba0009  ! 701: XNORcc_R	xnorcc 	%r8, %r9, %r8
	.word 0x90122528  ! 702: OR_I	or 	%r8, 0x0528, %r8
	.word 0x9082000c  ! 703: ADDcc_R	addcc 	%r8, %r12, %r8
	.word 0x90822360  ! 704: ADDcc_I	addcc 	%r8, 0x0360, %r8
	.word 0x90a20009  ! 705: SUBcc_R	subcc 	%r8, %r9, %r8
	.word 0x90ba000a  ! 706: XNORcc_R	xnorcc 	%r8, %r10, %r8
	.word 0x9022000a  ! 707: SUB_R	sub 	%r8, %r10, %r8
	.word 0x90a20009  ! 708: SUBcc_R	subcc 	%r8, %r9, %r8
	.word 0x9092287e  ! 709: ORcc_I	orcc 	%r8, 0x087e, %r8
	.word 0x90122dff  ! 710: OR_I	or 	%r8, 0x0dff, %r8
	.word 0x900a000c  ! 711: AND_R	and 	%r8, %r12, %r8
	.word 0xd0004000  ! 712: LDUW_R	lduw	[%r1 + %r0], %r8
	.word 0xd010605e  ! 713: LDUH_I	lduh	[%r1 + 0x005e], %r8
	.word 0x90222300  ! 714: SUB_I	sub 	%r8, 0x0300, %r8
	.word 0x9082000a  ! 715: ADDcc_R	addcc 	%r8, %r10, %r8
	.word 0x90a22a18  ! 716: SUBcc_I	subcc 	%r8, 0x0a18, %r8
	.word 0x9022000a  ! 717: SUB_R	sub 	%r8, %r10, %r8
	.word 0x908a29e9  ! 718: ANDcc_I	andcc 	%r8, 0x09e9, %r8
	.word 0x90a20008  ! 719: SUBcc_R	subcc 	%r8, %r8, %r8
	.word 0x909a0008  ! 720: XORcc_R	xorcc 	%r8, %r8, %r8
	.word 0x903a3dc5  ! 721: XNOR_I	xnor 	%r8, 0xfffffdc5, %r8
	.word 0x900a000c  ! 722: AND_R	and 	%r8, %r12, %r8
	.word 0x900a0009  ! 723: AND_R	and 	%r8, %r9, %r8
	.word 0x903a000c  ! 724: XNOR_R	xnor 	%r8, %r12, %r8
	.word 0x90823def  ! 725: ADDcc_I	addcc 	%r8, 0xfffffdef, %r8
	.word 0x90ba000a  ! 726: XNORcc_R	xnorcc 	%r8, %r10, %r8
	.word 0x90322977  ! 727: ORN_I	orn 	%r8, 0x0977, %r8
	.word 0xd0404000  ! 728: LDSW_R	ldsw	[%r1 + %r0], %r8
	.word 0x903a0009  ! 729: XNOR_R	xnor 	%r8, %r9, %r8
	.word 0x902a0009  ! 730: ANDN_R	andn 	%r8, %r9, %r8
	.word 0x90ba000b  ! 731: XNORcc_R	xnorcc 	%r8, %r11, %r8
	.word 0x90b2000c  ! 732: ORNcc_R	orncc 	%r8, %r12, %r8
	.word 0x9092370c  ! 733: ORcc_I	orcc 	%r8, 0xfffff70c, %r8
	.word 0xd0404000  ! 734: LDSW_R	ldsw	[%r1 + %r0], %r8
	.word 0xd0404000  ! 735: LDSW_R	ldsw	[%r1 + %r0], %r8
	.word 0xd0506007  ! 736: LDSH_I	ldsh	[%r1 + 0x0007], %r8
	.word 0x908a0008  ! 737: ANDcc_R	andcc 	%r8, %r8, %r8
	.word 0xd0106068  ! 738: LDUH_I	lduh	[%r1 + 0x0068], %r8
	.word 0x9082000c  ! 739: ADDcc_R	addcc 	%r8, %r12, %r8
	.word 0x90820009  ! 740: ADDcc_R	addcc 	%r8, %r9, %r8
	.word 0x90aa2d8d  ! 741: ANDNcc_I	andncc 	%r8, 0x0d8d, %r8
	.word 0x909a000c  ! 742: XORcc_R	xorcc 	%r8, %r12, %r8
	.word 0xd0406027  ! 743: LDSW_I	ldsw	[%r1 + 0x0027], %r8
	.word 0xd0006018  ! 744: LDUW_I	lduw	[%r1 + 0x0018], %r8
	.word 0x901a3535  ! 745: XOR_I	xor 	%r8, 0xfffff535, %r8
	.word 0x90b2000a  ! 746: ORNcc_R	orncc 	%r8, %r10, %r8
	.word 0x908a000c  ! 747: ANDcc_R	andcc 	%r8, %r12, %r8
	.word 0x9012224d  ! 748: OR_I	or 	%r8, 0x024d, %r8
	.word 0xd0106066  ! 749: LDUH_I	lduh	[%r1 + 0x0066], %r8
	.word 0x902a274d  ! 750: ANDN_I	andn 	%r8, 0x074d, %r8
	.word 0x90120008  ! 751: OR_R	or 	%r8, %r8, %r8
	.word 0x902a33d4  ! 752: ANDN_I	andn 	%r8, 0xfffff3d4, %r8
	.word 0x909a000c  ! 753: XORcc_R	xorcc 	%r8, %r12, %r8
	.word 0xd0004000  ! 754: LDUW_R	lduw	[%r1 + %r0], %r8
	.word 0x90022ad6  ! 755: ADD_I	add 	%r8, 0x0ad6, %r8
	.word 0x9002000a  ! 756: ADD_R	add 	%r8, %r10, %r8
	.word 0x90020008  ! 757: ADD_R	add 	%r8, %r8, %r8
	.word 0x9082000a  ! 758: ADDcc_R	addcc 	%r8, %r10, %r8
	.word 0x909a000a  ! 759: XORcc_R	xorcc 	%r8, %r10, %r8
	.word 0x90aa0008  ! 760: ANDNcc_R	andncc 	%r8, %r8, %r8
	.word 0x90220009  ! 761: SUB_R	sub 	%r8, %r9, %r8
	.word 0x902232a3  ! 762: SUB_I	sub 	%r8, 0xfffff2a3, %r8
	.word 0x90223f94  ! 763: SUB_I	sub 	%r8, 0xffffff94, %r8
	.word 0xd040602e  ! 764: LDSW_I	ldsw	[%r1 + 0x002e], %r8
	.word 0x90223894  ! 765: SUB_I	sub 	%r8, 0xfffff894, %r8
	.word 0x90aa2553  ! 766: ANDNcc_I	andncc 	%r8, 0x0553, %r8
	.word 0x90aa000b  ! 767: ANDNcc_R	andncc 	%r8, %r11, %r8
	.word 0x9002000a  ! 768: ADD_R	add 	%r8, %r10, %r8
	.word 0x909a2aac  ! 769: XORcc_I	xorcc 	%r8, 0x0aac, %r8
	.word 0x9012000a  ! 770: OR_R	or 	%r8, %r10, %r8
	.word 0xd0106050  ! 771: LDUH_I	lduh	[%r1 + 0x0050], %r8
	.word 0x900a0008  ! 772: AND_R	and 	%r8, %r8, %r8
	.word 0x9082000b  ! 773: ADDcc_R	addcc 	%r8, %r11, %r8
	.word 0x90223e45  ! 774: SUB_I	sub 	%r8, 0xfffffe45, %r8
	.word 0x900227a3  ! 775: ADD_I	add 	%r8, 0x07a3, %r8
	.word 0x9032315d  ! 776: ORN_I	orn 	%r8, 0xfffff15d, %r8
	.word 0xd008605d  ! 777: LDUB_I	ldub	[%r1 + 0x005d], %r8
	.word 0x902a0008  ! 778: ANDN_R	andn 	%r8, %r8, %r8
	.word 0x90220008  ! 779: SUB_R	sub 	%r8, %r8, %r8
	.word 0x908a2e0a  ! 780: ANDcc_I	andcc 	%r8, 0x0e0a, %r8
	.word 0x90a22ef4  ! 781: SUBcc_I	subcc 	%r8, 0x0ef4, %r8
	.word 0xd0506068  ! 782: LDSH_I	ldsh	[%r1 + 0x0068], %r8
	.word 0x9002000a  ! 783: ADD_R	add 	%r8, %r10, %r8
	.word 0x908a000a  ! 784: ANDcc_R	andcc 	%r8, %r10, %r8
	.word 0x901a2a54  ! 785: XOR_I	xor 	%r8, 0x0a54, %r8
	.word 0x90a20009  ! 786: SUBcc_R	subcc 	%r8, %r9, %r8
	.word 0xd0086049  ! 787: LDUB_I	ldub	[%r1 + 0x0049], %r8
	.word 0x9012000c  ! 788: OR_R	or 	%r8, %r12, %r8
	.word 0x903a3e43  ! 789: XNOR_I	xnor 	%r8, 0xfffffe43, %r8
	.word 0x909a000b  ! 790: XORcc_R	xorcc 	%r8, %r11, %r8
	.word 0x90122d19  ! 791: OR_I	or 	%r8, 0x0d19, %r8
	.word 0x90020008  ! 792: ADD_R	add 	%r8, %r8, %r8
	.word 0x900a0009  ! 793: AND_R	and 	%r8, %r9, %r8
	.word 0xd0504000  ! 794: LDSH_R	ldsh	[%r1 + %r0], %r8
	.word 0x9082000b  ! 795: ADDcc_R	addcc 	%r8, %r11, %r8
	.word 0x902a0008  ! 796: ANDN_R	andn 	%r8, %r8, %r8
	.word 0x90a2000c  ! 797: SUBcc_R	subcc 	%r8, %r12, %r8
	.word 0x908239e7  ! 798: ADDcc_I	addcc 	%r8, 0xfffff9e7, %r8
	.word 0xd050602f  ! 799: LDSH_I	ldsh	[%r1 + 0x002f], %r8
	.word 0x903a301b  ! 800: XNOR_I	xnor 	%r8, 0xfffff01b, %r8
	.word 0x9082255a  ! 801: ADDcc_I	addcc 	%r8, 0x055a, %r8
	.word 0x90a2000c  ! 802: SUBcc_R	subcc 	%r8, %r12, %r8
	.word 0x90220008  ! 803: SUB_R	sub 	%r8, %r8, %r8
	.word 0x901a3651  ! 804: XOR_I	xor 	%r8, 0xfffff651, %r8
	.word 0xd0086010  ! 805: LDUB_I	ldub	[%r1 + 0x0010], %r8
	.word 0x90a2000a  ! 806: SUBcc_R	subcc 	%r8, %r10, %r8
	.word 0x903a000b  ! 807: XNOR_R	xnor 	%r8, %r11, %r8
	.word 0xd0504000  ! 808: LDSH_R	ldsh	[%r1 + %r0], %r8
	.word 0x908a0008  ! 809: ANDcc_R	andcc 	%r8, %r8, %r8
	.word 0x9032000a  ! 810: ORN_R	orn 	%r8, %r10, %r8
	.word 0x9092000a  ! 811: ORcc_R	orcc 	%r8, %r10, %r8
	.word 0x9082000c  ! 812: ADDcc_R	addcc 	%r8, %r12, %r8
	.word 0xd0486022  ! 813: LDSB_I	ldsb	[%r1 + 0x0022], %r8
	.word 0xd0484000  ! 814: LDSB_R	ldsb	[%r1 + %r0], %r8
	.word 0x900a284e  ! 815: AND_I	and 	%r8, 0x084e, %r8
	.word 0xd0006009  ! 816: LDUW_I	lduw	[%r1 + 0x0009], %r8
	.word 0x902239b0  ! 817: SUB_I	sub 	%r8, 0xfffff9b0, %r8
	.word 0x90822a4b  ! 818: ADDcc_I	addcc 	%r8, 0x0a4b, %r8
	.word 0x90122efc  ! 819: OR_I	or 	%r8, 0x0efc, %r8
	.word 0x909a2c30  ! 820: XORcc_I	xorcc 	%r8, 0x0c30, %r8
	.word 0xd0404000  ! 821: LDSW_R	ldsw	[%r1 + %r0], %r8
	.word 0x90a23418  ! 822: SUBcc_I	subcc 	%r8, 0xfffff418, %r8
	.word 0x90b20008  ! 823: ORNcc_R	orncc 	%r8, %r8, %r8
	.word 0xd0486035  ! 824: LDSB_I	ldsb	[%r1 + 0x0035], %r8
	.word 0x9082366b  ! 825: ADDcc_I	addcc 	%r8, 0xfffff66b, %r8
	.word 0x90aa000c  ! 826: ANDNcc_R	andncc 	%r8, %r12, %r8
	.word 0x908a0009  ! 827: ANDcc_R	andcc 	%r8, %r9, %r8
	.word 0xd010600a  ! 828: LDUH_I	lduh	[%r1 + 0x000a], %r8
	.word 0xd0404000  ! 829: LDSW_R	ldsw	[%r1 + %r0], %r8
	.word 0x90b2000a  ! 830: ORNcc_R	orncc 	%r8, %r10, %r8
	.word 0x9002000b  ! 831: ADD_R	add 	%r8, %r11, %r8
	.word 0x9002000b  ! 832: ADD_R	add 	%r8, %r11, %r8
	.word 0xd050601d  ! 833: LDSH_I	ldsh	[%r1 + 0x001d], %r8
	.word 0x90ba000c  ! 834: XNORcc_R	xnorcc 	%r8, %r12, %r8
	.word 0x9082000a  ! 835: ADDcc_R	addcc 	%r8, %r10, %r8
	.word 0x90222c97  ! 836: SUB_I	sub 	%r8, 0x0c97, %r8
	.word 0xd0404000  ! 837: LDSW_R	ldsw	[%r1 + %r0], %r8
	.word 0x908a2661  ! 838: ANDcc_I	andcc 	%r8, 0x0661, %r8
	.word 0x9082331f  ! 839: ADDcc_I	addcc 	%r8, 0xfffff31f, %r8
	.word 0xd0084000  ! 840: LDUB_R	ldub	[%r1 + %r0], %r8
	.word 0x90023242  ! 841: ADD_I	add 	%r8, 0xfffff242, %r8
	.word 0x90022ce4  ! 842: ADD_I	add 	%r8, 0x0ce4, %r8
	.word 0x90022f24  ! 843: ADD_I	add 	%r8, 0x0f24, %r8
	.word 0xd000606d  ! 844: LDUW_I	lduw	[%r1 + 0x006d], %r8
	.word 0x9022000b  ! 845: SUB_R	sub 	%r8, %r11, %r8
	.word 0x9082000c  ! 846: ADDcc_R	addcc 	%r8, %r12, %r8
	.word 0xd0506066  ! 847: LDSH_I	ldsh	[%r1 + 0x0066], %r8
	.word 0x90022a41  ! 848: ADD_I	add 	%r8, 0x0a41, %r8
	.word 0xd0084000  ! 849: LDUB_R	ldub	[%r1 + %r0], %r8
	.word 0x90020008  ! 850: ADD_R	add 	%r8, %r8, %r8
	.word 0x90023d36  ! 851: ADD_I	add 	%r8, 0xfffffd36, %r8
	.word 0x90a226c2  ! 852: SUBcc_I	subcc 	%r8, 0x06c2, %r8
	.word 0xd0084000  ! 853: LDUB_R	ldub	[%r1 + %r0], %r8
	.word 0x90b23a1a  ! 854: ORNcc_I	orncc 	%r8, 0xfffffa1a, %r8
	.word 0x903a000c  ! 855: XNOR_R	xnor 	%r8, %r12, %r8
	.word 0x903a0008  ! 856: XNOR_R	xnor 	%r8, %r8, %r8
	.word 0x9082000c  ! 857: ADDcc_R	addcc 	%r8, %r12, %r8
	.word 0xd0506050  ! 858: LDSH_I	ldsh	[%r1 + 0x0050], %r8
	.word 0x9012000b  ! 859: OR_R	or 	%r8, %r11, %r8
	.word 0xd0506072  ! 860: LDSH_I	ldsh	[%r1 + 0x0072], %r8
	.word 0x901a2cdb  ! 861: XOR_I	xor 	%r8, 0x0cdb, %r8
	.word 0x90aa20e1  ! 862: ANDNcc_I	andncc 	%r8, 0x00e1, %r8
	.word 0x90a20008  ! 863: SUBcc_R	subcc 	%r8, %r8, %r8
	.word 0x9032331c  ! 864: ORN_I	orn 	%r8, 0xfffff31c, %r8
	.word 0x9002000b  ! 865: ADD_R	add 	%r8, %r11, %r8
	.word 0xd010606e  ! 866: LDUH_I	lduh	[%r1 + 0x006e], %r8
	.word 0x903a2632  ! 867: XNOR_I	xnor 	%r8, 0x0632, %r8
	.word 0x90922ea6  ! 868: ORcc_I	orcc 	%r8, 0x0ea6, %r8
	.word 0x9012283e  ! 869: OR_I	or 	%r8, 0x083e, %r8
	.word 0x900a0008  ! 870: AND_R	and 	%r8, %r8, %r8
	.word 0x90023814  ! 871: ADD_I	add 	%r8, 0xfffff814, %r8
	.word 0x903a3a63  ! 872: XNOR_I	xnor 	%r8, 0xfffffa63, %r8
	.word 0x90320008  ! 873: ORN_R	orn 	%r8, %r8, %r8
	.word 0x90aa000a  ! 874: ANDNcc_R	andncc 	%r8, %r10, %r8
	.word 0x908a2ede  ! 875: ANDcc_I	andcc 	%r8, 0x0ede, %r8
	.word 0x90aa000a  ! 876: ANDNcc_R	andncc 	%r8, %r10, %r8
	.word 0x90a20008  ! 877: SUBcc_R	subcc 	%r8, %r8, %r8
	.word 0x903a2f92  ! 878: XNOR_I	xnor 	%r8, 0x0f92, %r8
	.word 0x90822741  ! 879: ADDcc_I	addcc 	%r8, 0x0741, %r8
	.word 0xd0404000  ! 880: LDSW_R	ldsw	[%r1 + %r0], %r8
	.word 0x902a388a  ! 881: ANDN_I	andn 	%r8, 0xfffff88a, %r8
	.word 0x90ba000b  ! 882: XNORcc_R	xnorcc 	%r8, %r11, %r8
	.word 0x90823483  ! 883: ADDcc_I	addcc 	%r8, 0xfffff483, %r8
	.word 0x90b2000b  ! 884: ORNcc_R	orncc 	%r8, %r11, %r8
	.word 0x9032000c  ! 885: ORN_R	orn 	%r8, %r12, %r8
	.word 0x90ba28dd  ! 886: XNORcc_I	xnorcc 	%r8, 0x08dd, %r8
	.word 0x90023f41  ! 887: ADD_I	add 	%r8, 0xffffff41, %r8
	.word 0x90220008  ! 888: SUB_R	sub 	%r8, %r8, %r8
	.word 0xd0084000  ! 889: LDUB_R	ldub	[%r1 + %r0], %r8
	.word 0x90a20009  ! 890: SUBcc_R	subcc 	%r8, %r9, %r8
	.word 0xd0006040  ! 891: LDUW_I	lduw	[%r1 + 0x0040], %r8
	.word 0x90220008  ! 892: SUB_R	sub 	%r8, %r8, %r8
	.word 0x900a0008  ! 893: AND_R	and 	%r8, %r8, %r8
	.word 0xd0506044  ! 894: LDSH_I	ldsh	[%r1 + 0x0044], %r8
	.word 0x90220009  ! 895: SUB_R	sub 	%r8, %r9, %r8
	.word 0xd0006005  ! 896: LDUW_I	lduw	[%r1 + 0x0005], %r8
	.word 0x90120009  ! 897: OR_R	or 	%r8, %r9, %r8
	.word 0x901a3ecb  ! 898: XOR_I	xor 	%r8, 0xfffffecb, %r8
	.word 0x902a0008  ! 899: ANDN_R	andn 	%r8, %r8, %r8
	.word 0x902235e0  ! 900: SUB_I	sub 	%r8, 0xfffff5e0, %r8
	.word 0x901230a1  ! 901: OR_I	or 	%r8, 0xfffff0a1, %r8
	.word 0x903238e8  ! 902: ORN_I	orn 	%r8, 0xfffff8e8, %r8
	.word 0x9082333a  ! 903: ADDcc_I	addcc 	%r8, 0xfffff33a, %r8
	.word 0xd0504000  ! 904: LDSH_R	ldsh	[%r1 + %r0], %r8
	.word 0x908a3126  ! 905: ANDcc_I	andcc 	%r8, 0xfffff126, %r8
	.word 0x90ba000a  ! 906: XNORcc_R	xnorcc 	%r8, %r10, %r8
	.word 0x90320008  ! 907: ORN_R	orn 	%r8, %r8, %r8
	.word 0x90b20009  ! 908: ORNcc_R	orncc 	%r8, %r9, %r8
	.word 0x90822270  ! 909: ADDcc_I	addcc 	%r8, 0x0270, %r8
	.word 0x90aa000b  ! 910: ANDNcc_R	andncc 	%r8, %r11, %r8
	.word 0x90923181  ! 911: ORcc_I	orcc 	%r8, 0xfffff181, %r8
	.word 0xd0506012  ! 912: LDSH_I	ldsh	[%r1 + 0x0012], %r8
	.word 0x90020008  ! 913: ADD_R	add 	%r8, %r8, %r8
	.word 0xd0506012  ! 914: LDSH_I	ldsh	[%r1 + 0x0012], %r8
	.word 0x9022000c  ! 915: SUB_R	sub 	%r8, %r12, %r8
	.word 0x9022000a  ! 916: SUB_R	sub 	%r8, %r10, %r8
	.word 0x903a3f82  ! 917: XNOR_I	xnor 	%r8, 0xffffff82, %r8
	.word 0x902220e5  ! 918: SUB_I	sub 	%r8, 0x00e5, %r8
	.word 0x908224c2  ! 919: ADDcc_I	addcc 	%r8, 0x04c2, %r8
	.word 0x90a20009  ! 920: SUBcc_R	subcc 	%r8, %r9, %r8
	.word 0x9032000c  ! 921: ORN_R	orn 	%r8, %r12, %r8
	.word 0x9002000c  ! 922: ADD_R	add 	%r8, %r12, %r8
	.word 0xd0084000  ! 923: LDUB_R	ldub	[%r1 + %r0], %r8
	.word 0x90022930  ! 924: ADD_I	add 	%r8, 0x0930, %r8
	.word 0x90922277  ! 925: ORcc_I	orcc 	%r8, 0x0277, %r8
	.word 0x9002393b  ! 926: ADD_I	add 	%r8, 0xfffff93b, %r8
	.word 0x90a22621  ! 927: SUBcc_I	subcc 	%r8, 0x0621, %r8
	.word 0x903a37a1  ! 928: XNOR_I	xnor 	%r8, 0xfffff7a1, %r8
	.word 0xd0486007  ! 929: LDSB_I	ldsb	[%r1 + 0x0007], %r8
	.word 0x90220009  ! 930: SUB_R	sub 	%r8, %r9, %r8
	.word 0xd0506070  ! 931: LDSH_I	ldsh	[%r1 + 0x0070], %r8
	.word 0xd0004000  ! 932: LDUW_R	lduw	[%r1 + %r0], %r8
	.word 0x90823924  ! 933: ADDcc_I	addcc 	%r8, 0xfffff924, %r8
	.word 0x9002000c  ! 934: ADD_R	add 	%r8, %r12, %r8
	.word 0x909a34c2  ! 935: XORcc_I	xorcc 	%r8, 0xfffff4c2, %r8
	.word 0x90ba3ca5  ! 936: XNORcc_I	xnorcc 	%r8, 0xfffffca5, %r8
	.word 0xd0004000  ! 937: LDUW_R	lduw	[%r1 + %r0], %r8
	.word 0xd0404000  ! 938: LDSW_R	ldsw	[%r1 + %r0], %r8
	.word 0xd048602d  ! 939: LDSB_I	ldsb	[%r1 + 0x002d], %r8
	.word 0x9082000c  ! 940: ADDcc_R	addcc 	%r8, %r12, %r8
	.word 0xd000607f  ! 941: LDUW_I	lduw	[%r1 + 0x007f], %r8
	.word 0x90822d10  ! 942: ADDcc_I	addcc 	%r8, 0x0d10, %r8
	.word 0x90a2000a  ! 943: SUBcc_R	subcc 	%r8, %r10, %r8
	.word 0x90922e94  ! 944: ORcc_I	orcc 	%r8, 0x0e94, %r8
	.word 0x908a000c  ! 945: ANDcc_R	andcc 	%r8, %r12, %r8
	.word 0xd0104000  ! 946: LDUH_R	lduh	[%r1 + %r0], %r8
	.word 0xd0506064  ! 947: LDSH_I	ldsh	[%r1 + 0x0064], %r8
	.word 0x909a0008  ! 948: XORcc_R	xorcc 	%r8, %r8, %r8
	.word 0x908a0008  ! 949: ANDcc_R	andcc 	%r8, %r8, %r8
	.word 0x902224b9  ! 950: SUB_I	sub 	%r8, 0x04b9, %r8
	.word 0x90ba27be  ! 951: XNORcc_I	xnorcc 	%r8, 0x07be, %r8
	.word 0x901a31e1  ! 952: XOR_I	xor 	%r8, 0xfffff1e1, %r8
	.word 0x90a22b5e  ! 953: SUBcc_I	subcc 	%r8, 0x0b5e, %r8
	.word 0x90823bd6  ! 954: ADDcc_I	addcc 	%r8, 0xfffffbd6, %r8
	.word 0x9022000c  ! 955: SUB_R	sub 	%r8, %r12, %r8
	.word 0x90923960  ! 956: ORcc_I	orcc 	%r8, 0xfffff960, %r8
	.word 0x902a3bbd  ! 957: ANDN_I	andn 	%r8, 0xfffffbbd, %r8
	.word 0x90aa000c  ! 958: ANDNcc_R	andncc 	%r8, %r12, %r8
	.word 0xd0006039  ! 959: LDUW_I	lduw	[%r1 + 0x0039], %r8
	.word 0x90aa37cc  ! 960: ANDNcc_I	andncc 	%r8, 0xfffff7cc, %r8
	.word 0x900a000b  ! 961: AND_R	and 	%r8, %r11, %r8
	.word 0x909a2a9a  ! 962: XORcc_I	xorcc 	%r8, 0x0a9a, %r8
	.word 0x90ba000a  ! 963: XNORcc_R	xnorcc 	%r8, %r10, %r8
	.word 0xd0504000  ! 964: LDSH_R	ldsh	[%r1 + %r0], %r8
	.word 0xd050606d  ! 965: LDSH_I	ldsh	[%r1 + 0x006d], %r8
	.word 0x90022164  ! 966: ADD_I	add 	%r8, 0x0164, %r8
	.word 0x90820008  ! 967: ADDcc_R	addcc 	%r8, %r8, %r8
	.word 0x90222b9c  ! 968: SUB_I	sub 	%r8, 0x0b9c, %r8
	.word 0xd0086025  ! 969: LDUB_I	ldub	[%r1 + 0x0025], %r8
	.word 0x9012000b  ! 970: OR_R	or 	%r8, %r11, %r8
	.word 0x902a0008  ! 971: ANDN_R	andn 	%r8, %r8, %r8
	.word 0xd0104000  ! 972: LDUH_R	lduh	[%r1 + %r0], %r8
	.word 0x90ba000b  ! 973: XNORcc_R	xnorcc 	%r8, %r11, %r8
	.word 0x900a000c  ! 974: AND_R	and 	%r8, %r12, %r8
	.word 0xd0084000  ! 975: LDUB_R	ldub	[%r1 + %r0], %r8
	.word 0xd0484000  ! 976: LDSB_R	ldsb	[%r1 + %r0], %r8
	.word 0x900233f7  ! 977: ADD_I	add 	%r8, 0xfffff3f7, %r8
	.word 0x9002000b  ! 978: ADD_R	add 	%r8, %r11, %r8
	.word 0x90b20009  ! 979: ORNcc_R	orncc 	%r8, %r9, %r8
	.word 0x902a22b6  ! 980: ANDN_I	andn 	%r8, 0x02b6, %r8
	.word 0x90820009  ! 981: ADDcc_R	addcc 	%r8, %r9, %r8
	.word 0x90b20008  ! 982: ORNcc_R	orncc 	%r8, %r8, %r8
	.word 0x90a22c06  ! 983: SUBcc_I	subcc 	%r8, 0x0c06, %r8
	.word 0x90022073  ! 984: ADD_I	add 	%r8, 0x0073, %r8
	.word 0x90a2000b  ! 985: SUBcc_R	subcc 	%r8, %r11, %r8
	.word 0x90a2000c  ! 986: SUBcc_R	subcc 	%r8, %r12, %r8
	.word 0x9002000b  ! 987: ADD_R	add 	%r8, %r11, %r8
	.word 0x901a2df2  ! 988: XOR_I	xor 	%r8, 0x0df2, %r8
	.word 0x901a000a  ! 989: XOR_R	xor 	%r8, %r10, %r8
	.word 0x9022000c  ! 990: SUB_R	sub 	%r8, %r12, %r8
	.word 0x90a20008  ! 991: SUBcc_R	subcc 	%r8, %r8, %r8
	.word 0x900a30e6  ! 992: AND_I	and 	%r8, 0xfffff0e6, %r8
	.word 0x9082000b  ! 993: ADDcc_R	addcc 	%r8, %r11, %r8
	.word 0x90a23e41  ! 994: SUBcc_I	subcc 	%r8, 0xfffffe41, %r8
	.word 0x90823ed0  ! 995: ADDcc_I	addcc 	%r8, 0xfffffed0, %r8
	.word 0x901a000b  ! 996: XOR_R	xor 	%r8, %r11, %r8
	.word 0x900a000a  ! 997: AND_R	and 	%r8, %r10, %r8
	.word 0x90123753  ! 998: OR_I	or 	%r8, 0xfffff753, %r8
	.word 0xd040605f  ! 999: LDSW_I	ldsw	[%r1 + 0x005f], %r8
.data
.align	256
t0_data_start_0:
	.xword	0x16a476ad5cefa112
	.xword	0x2d111b003bdd2a29
	.xword	0xf4556c8529a38c3b
	.xword	0xe0e9e43c0f8945e8
	.xword	0x51c47794833f72bd
	.xword	0x472d3ed5e8c8cb97
	.xword	0x4d633a60974c710f
	.xword	0x863e5529ef3ce7a6
	.xword	0x87ee43afec08d54a
	.xword	0xd2ec4cea30e71403
	.xword	0x4492b8837f52548c
	.xword	0x6ee2898847ed370b
	.xword	0x7dfcbd2028047b3c
	.xword	0xd6edb18f1462ee7d
	.xword	0x2cf2b4bfba83ec92
	.xword	0xe1c6f92df57764df
	.xword	0x9fd712dd5ad118ff
	.xword	0xf68104025d45e1fb
	.xword	0xbb0e4f658f840d3a
	.xword	0x7f8ae7983a5b7d51
	.xword	0x3cfc3fa0bc73ce03
	.xword	0x9e4aebeee42ef857
	.xword	0xd04b3b66631723a2
	.xword	0x376a52b48889ac19
	.xword	0x9acc4e37f8f32991
	.xword	0x0c8df18842441f9b
	.xword	0x5db983ed88ed53b3
	.xword	0x0fabc509adfc637c
	.xword	0x50603ee104a895ec
	.xword	0xcabcf9e0b0d5540e
	.xword	0xbd1c9c71ae03d4dc
	.xword	0x618b897de2f1a747
	.xword	0xfd550e4f093ea7d2
	.xword	0x5cd7260505be688b
	.xword	0xb08397f2f87c705c
	.xword	0x54d204654487318c
	.xword	0x1f0253f35c3927db
	.xword	0x35ed66f588dbdd2a
	.xword	0xff454d74c082dc4c
	.xword	0x2e5ead57c185b974
	.xword	0xa12abb2bbb780010
	.xword	0x011c73e469e49786
	.xword	0x6d4370fdec9f4bf9
	.xword	0x789e981aa9bd8ec7
	.xword	0x4a2c8ee62f609b9e
	.xword	0xb9f26f54b504838c
	.xword	0xc166505915ace9c4
	.xword	0x111b76b7bf053b7b
	.xword	0x52f746c506081a0a
	.xword	0xb1e30566120909c2
	.xword	0x80ab1f66f3ef21e2
	.xword	0xb0edd429f4dbbf51
	.xword	0x656c29fb2384fdc0
	.xword	0xb01629d7e44f8b98
	.xword	0x290df2c53a7e545d
	.xword	0xded584fcdd8dbf12
	.xword	0x7c821a4628d4b7fd
	.xword	0xceb06461f2ce3e86
	.xword	0x05c6b501e7439eac
	.xword	0xb73a6e2094fcfcc6
	.xword	0xeb39c94cbfc075e4
	.xword	0xdd9b04bae3edf137
	.xword	0x725d77a64ec8a129
	.xword	0xb6870a1b95f3df8b
	.xword	0x49978b7d9ecb276d
	.xword	0x1a3e0c8de52c143f
	.xword	0xc13ded5317ca7e13
	.xword	0xdb50017548baaced
	.xword	0x668c2c3d79904d9e
	.xword	0x070e1f626644ddc3
	.xword	0x033e53f7ab16b690
	.xword	0xae0a8cdcd84f97b0
	.xword	0x907d0537f0056ddf
	.xword	0x5373e63ae96b1388
	.xword	0xeea33b399cdbb437
	.xword	0x7bcedc9f9ab28b66
	.xword	0xa4c562eae7de4b28
	.xword	0xe043a1d78e071077
	.xword	0xa0dcab54db4175a8
	.xword	0xed98aba5d73bc139
	.xword	0xa630b004c58f5741
	.xword	0x6881592f247b36f9
	.xword	0xf72bc76c866fb5f4
	.xword	0x3cd3e44d002b8489
	.xword	0xbb9b0644f30250a2
	.xword	0x7f9a939f3f844dec
	.xword	0xdbd78b470a8cdade
	.xword	0x1a70299c51876f37
	.xword	0x2ada3dd20504b7b7
	.xword	0x8e3b23a54238b118
	.xword	0xd0cc6cdfac246b7a
	.xword	0x6469bedb9d0c6ad4
	.xword	0x4add08b1f2f679d8
	.xword	0x13010c26dbbefb8e
	.xword	0xb7e200cbf9b05bb0
	.xword	0x93bd5813469834a0
	.xword	0x7285097d02877696
	.xword	0x729f52f13abf5d80
	.xword	0x9831978fd4d8e4c9
	.xword	0x206f6caaf6733e53
	.xword	0xdf004a4be232d3e1
	.xword	0x4260e97a63ef6ad2
	.xword	0x1228cddd56b275b3
	.xword	0x5b758ca1136fedcf
	.xword	0x8f8eb8a6b0b9bec8
	.xword	0x4b7eeb0b01e6ff79
	.xword	0x2b843b99969ad1d6
	.xword	0xa3ce925d0b5d60f6
	.xword	0x29c7b68e2b83561a
	.xword	0x6943ca6bd2c26d62
	.xword	0xef443c5b88b46075
	.xword	0x88caee7dd6fc6a94
	.xword	0xec90a259af9c9ceb
	.xword	0x5d4e621f0734906c
	.xword	0xbdb358ea21d27809
	.xword	0x591c5bababa96fda
	.xword	0xeab02708ec69aac9
	.xword	0x16280cad5104e654
	.xword	0x6d3e6f3c192976cb
	.xword	0x0f951049d512c838
	.xword	0x658cd52ebdb0cf03
	.xword	0x876becedd9dd24fe
	.xword	0xd0ae53ee8079d6b6
	.xword	0xf98b1ec3d3c146d4
	.xword	0x70bf5962133c8e10
	.xword	0x11e9dc3a1f81ec2b
	.xword	0x958b1c17214d1bdd
	.xword	0xbeab5ffbe7ed68bd
	.xword	0x51950ae6b6f422ca
	.xword	0x985b94a82f2567fe
	.xword	0x3f44a5085118598e
	.xword	0x7e42e9bbc5cd212c
	.xword	0x9f46f1275d19beb2
	.xword	0xcc443fea5214bdef
	.xword	0x4d13e0db67c2eaff
	.xword	0x8bdef5a0e72afda0
	.xword	0x511bca4d6e3ce9df
	.xword	0xe5690f693287fedb
	.xword	0xe4d370b3e475360a
	.xword	0xfbeace8940bcb7de
	.xword	0x1b3be8fa5f154862
	.xword	0xacef90174772c051
	.xword	0x1c82780d8e5595f3
	.xword	0xd39fa458f097705f
	.xword	0xab6387e30b725db8
	.xword	0xa632ab56b1db9e91
	.xword	0xabe8e7fccf396045
	.xword	0x6ce22be40e389724
	.xword	0xf9014b9b3d130ab7
	.xword	0xbabd8d28942f31fd
	.xword	0x0d83181dc7eb03e7
	.xword	0xa6b8155280301fe8
	.xword	0x39e22e98e688f1d9
	.xword	0x810c8420936d5af1
	.xword	0x4f675995b77cf669
	.xword	0xc3354b98232fa57d
	.xword	0xf0640213d2ecfc55
	.xword	0xad310dcdd065e728
	.xword	0xed5bf41070e761c8
	.xword	0x483f515d4b310e8f
	.xword	0xa82a2eef26addfac
	.xword	0x2df7647890de7cd4
	.xword	0xe092b9f9fdb09db7
	.xword	0x446dd41c50a0878a
	.xword	0x39cf3c13d129a732
	.xword	0x47856cf17c77327d
	.xword	0xac8e0014cce22191
	.xword	0xe7bcc4332e12b12b
	.xword	0x768bb51be57b518f
	.xword	0xcd5dde91e7716e83
	.xword	0x67c42fef28c6cc13
	.xword	0xca422ab9de1edc84
	.xword	0x93230f9ad75444d0
	.xword	0xc0c254b2f4469e85
	.xword	0xcf31cd43152c1562
	.xword	0x6d123b0230bb3f08
	.xword	0x8e63cd0dfadd0ab0
	.xword	0xacdfd53eb9c0e8f1
	.xword	0x0af0a464aa3317f5
	.xword	0x97afb703e0dcfcb3
	.xword	0xe5e7e5625c401e68
	.xword	0x5b84625c73284d1d
	.xword	0xad9390e38813001b
	.xword	0x4f40549af04e797f
	.xword	0x04faa73b8ad25a8b
	.xword	0x102fe8acb8da126a
	.xword	0x248a86b228510be4
	.xword	0x49ed6cc7ea7ee3ac
	.xword	0x4deb82576917a984
	.xword	0xd5dd83629c0da206
	.xword	0x29ab1a1e34b649c9
	.xword	0x51cdeae266f040a0
	.xword	0xff180bc71d56c1af
	.xword	0x23d6a6b94440d6d5
	.xword	0xde659079a1310dff
	.xword	0x4464fba658bec4ec
	.xword	0xb1a393c67aa1021f
	.xword	0x8d88a43cb6e838da
	.xword	0x200c11f97f5c8b98
	.xword	0x2b18a67c0a42620c
	.xword	0x6e20100ba7cfaceb
	.xword	0x1b7addb534a54fec
	.xword	0x8121fc964040cff3
	.xword	0xc7daf146e714d0e3
	.xword	0x6f1faa3033a9d9d0
	.xword	0x9a1d0661d51117eb
	.xword	0xd4b58807a6bad7a4
	.xword	0x869abca7448d23dc
	.xword	0x6778577154be5fe3
	.xword	0x67bee3d15887669d
	.xword	0x5cea6c23d8626d65
	.xword	0x78128893fe54185e
	.xword	0x8e69bf51c3caa26b
	.xword	0x9f5ed259b48191a6
	.xword	0xaa761ca6eda424c5
	.xword	0x56e92a5eeee06981
	.xword	0x096f753b44385b2e
	.xword	0x1fa85f94aa071f7f
	.xword	0xa2ce0d2db7e200ed
	.xword	0xffd7a6d0ce138625
	.xword	0x7389a7a0567271c3
	.xword	0x5cb48df517ca8447
	.xword	0xe3966aee529d5f9e
	.xword	0x6fb8ff6b1afab79c
	.xword	0x27484c8810f57b51
	.xword	0x93564e284c832b81
	.xword	0xc0084077ebe472f2
	.xword	0x038cff580fb86547
	.xword	0xa9ed72878787343c
	.xword	0x5e28a2d81b42b8b5
	.xword	0x235c617b84f0bc6a
	.xword	0x09170ff07c12c1c9
	.xword	0x17d39d4e4aaeabf2
	.xword	0xf69aa5f9cbc39940
	.xword	0x654fe6ae8315fd02
	.xword	0x075feffab8b100bf
	.xword	0x1236e58408693dd2
	.xword	0xa59c52631fed4c80
	.xword	0xee9581522cf417ea
	.xword	0x9afabbcf16fa4e0c
	.xword	0x94e922761e88aa75
	.xword	0x2e65031a92fc9ae2
	.xword	0x7f444769ea5fc984
	.xword	0x9dcda1b21d10eb88
	.xword	0xde959b4c53047a0e
	.xword	0x530311bc82904443
	.xword	0x9e6eca744fcca7b0
	.xword	0xa9a1fadbadd33c5e
	.xword	0xd4b6878a1f6e391e
	.xword	0x6048de3f11f5aed5
	.xword	0xf64a2181b68b6934
	.xword	0x0e30febb14ad605d
	.xword	0x142092611e967ab1
	.xword	0xa00a24ddc5056a92
	.xword	0xb9d1d0dd7c1a7b4d
	.xword	0x37df324cf3afe0d2
	.xword	0xde2c2d83512438a9
	.xword	0xb72299f37e48f99f
	.xword	0xbd48a25c7174b82a
	.xword	0x77b0a40891508d53
	.xword	0x765083ff214ee457
	.xword	0x1227df3cda66c83f
	.xword	0x74d67e64228f39fb
	.xword	0xf9edc203191c3fb4
	.xword	0x692d3d4410748f8f
	.xword	0x4f31ef93d1e79fd8
	.xword	0x609f99c0b3bcbe30
	.xword	0x7d707c7488427290
	.xword	0xb76747e1f10b5768
	.xword	0x67de79d909451c92
	.xword	0x7bda70b57d34401f
	.xword	0x9c718e4077c5152a
	.xword	0x674abbff6924f061
	.xword	0xd214980639debb27
	.xword	0xa023a907fbf0fc5e
	.xword	0x71557a1b6738123b
	.xword	0xceefe939ffc0ec40
	.xword	0xf4358f7ef9f97108
	.xword	0x75d725db8742b157
	.xword	0xddd274d3242aebac
	.xword	0x8f26e9d5590521cf
	.xword	0xc2b2034d75e53913
	.xword	0x1a00e3dfa43df3b8
	.xword	0x8f9c2207d899a8e2
	.xword	0xbb55cb03817c6be5
	.xword	0xc81b23ea384090cd
	.xword	0x5639caebb1469fae
	.xword	0xe667c744361ee84c
	.xword	0x594e88b649f03714
	.xword	0x1c5f88b0eaa2bf30
	.xword	0x8a55af01a85b4dd8
	.xword	0x16038977d5abfcb2
	.xword	0x5d2eea3ba9345fd5
	.xword	0x53cc0b1ae0110d2e
	.xword	0x1c1c2527cb209fed
	.xword	0xa1b24bf1c8b379a7
	.xword	0x120350efb5a7e549
	.xword	0xf73bda2e8d90cc77
	.xword	0x36a5ce89c208172a
	.xword	0x739a7cab1ae0dce4
	.xword	0xe49eff8d530e2f3b
	.xword	0xe73925d649b92e46
	.xword	0xd28aea6d3f9a936d
	.xword	0xb0f74c729cbd86b9
	.xword	0xfe72fc6bd2302264
	.xword	0x5f2ea11f76c18ad7
	.xword	0x67cddd401411f24d
	.xword	0x8b000e336db25024
	.xword	0x8c8f8997955439a8
	.xword	0x8739775bbfc493de
	.xword	0x18f82ef5f4a6219c
	.xword	0xe92c204f64380615
	.xword	0x58414ff5287ddc42
	.xword	0x8dfad91b367820e8
	.xword	0x7b2031081d7cce26
	.xword	0x22408595d73450fe
	.xword	0x71fbe1fece3452bd
	.xword	0x3bf4869121b3499d
	.xword	0xd0f7134f88c5d5aa
	.xword	0x90c6fcc931b523e9
	.xword	0x7670dea919429fd7
	.xword	0x0950cc65a3092342
	.xword	0xc1ea48f6f0d1962a
	.xword	0x13424eacaf66b4f5
	.xword	0x47ab2c4328d24189
	.xword	0x6a5fc8d213fbe668
	.xword	0xe760854f1e8cd4ad
	.xword	0x852ed62d44c6d049
	.xword	0xff274de9f01a19fb
	.xword	0x23404e496d4a3de4
	.xword	0xe97a08818d5298fd
	.xword	0xad1c78fd9a8b6a36
	.xword	0x090091953b8a667f
	.xword	0x1dfe1bb8c82ad721
	.xword	0x6fedfab65ba6c63f
	.xword	0x479d158e0be7e4ab
	.xword	0x68cb4f4b70935bbe
	.xword	0xc931cf60c0d41211
	.xword	0x4ff02f916406e9ab
	.xword	0x67fa5b1923c3e364
	.xword	0x326aca2cbc75344f
	.xword	0xbab76d943790323c
	.xword	0xf15dd563cecc4101
	.xword	0x20aaeaaea1ab1a30
	.xword	0x296c76845fe7bc94
	.xword	0x0e3709fadb2e1bc3
	.xword	0xdd1939a0ad197fd3
	.xword	0x10a1730901efca30
	.xword	0x269e963f32cd747f
	.xword	0xcc0e702e2a701e7d
	.xword	0x4fbd2ba710922c60
	.xword	0x199b46277efbe012
	.xword	0xe28a8ac4740ee1b2
	.xword	0xef3e3d8bdae42cbd
	.xword	0x3435f56422eac48f
	.xword	0xaf40b2c9b60897e1
	.xword	0x467dbf78f1e4e39f
	.xword	0x0240e353e1b3085f
	.xword	0x5fe5caf6d8599a7c
	.xword	0x7aae56978389fa54
	.xword	0xa5b2f3c909bb9ae6
	.xword	0xcfd5e6d2bb30e54a
	.xword	0x206bc5e44d60022f
	.xword	0xdbb5c57920dbbded
	.xword	0xda4e99e663807d0f
	.xword	0x5d36d1f3b9eee860
	.xword	0x2229ff76acac92c7
	.xword	0x381d13f3f065e8df
	.xword	0x5ed78f23c4e9fe6c
	.xword	0xb07097f4c8c249ee
	.xword	0x7386bcfe99cb4d9d
	.xword	0xb208f74e10bde01e
	.xword	0xecff7f7f9d57d5c8
	.xword	0x99cc1c79e7f039a5
	.xword	0x6a4ea87756b1fb9b
	.xword	0xb9ad9116332f3fbe
	.xword	0x49d8fb88fc61f0de
	.xword	0x81a5e84f6739c409
	.xword	0x2a501a315d75e5d0
	.xword	0x30e9db5b69f79551
	.xword	0xb37feb41248c62ab
	.xword	0x7ebcc59b3985d1a1
	.xword	0x0e204c6ce6e03dff
	.xword	0xa0e9f818a13d36d2
	.xword	0x53fc8c0780948183
	.xword	0xf14fd1af3a9ed52c
	.xword	0xfdcde199b5f38d3d
	.xword	0x4e3e39a3d4839522
	.xword	0xf3aa937638664278
	.xword	0xe9d2f3ff4deb13f7
	.xword	0xfc493177c9d19991
	.xword	0x2da9fd1ca8721577
	.xword	0x6f06de1143485fe9
	.xword	0x45325798b5225ae9
	.xword	0x67efe2c2ee037ac9
	.xword	0xa75a379de6c1578f
	.xword	0x2b6d956c439bdca3
	.xword	0x96ffa5eed6bee2c8
	.xword	0xe83197f52a228f7a
	.xword	0xe7cf44bd12973202
	.xword	0xc335b57399801806
	.xword	0x66488f6f630404a4
	.xword	0x93f90f364cb4fbb1
	.xword	0xc8d159fc3304093e
	.xword	0x4e0bee65fdd36405
	.xword	0x8d07c7205a0e684e
	.xword	0x1116f16e2f55343d
	.xword	0xea2e372d14f86dee
	.xword	0x624093cb9b10abf4
	.xword	0x1c83df4ac7fdf92a
	.xword	0xb4746f63ea3e2b7d
	.xword	0xdd5d6019343b405a
	.xword	0x096add3db22c7e31
	.xword	0x5d52249a71b85fd9
	.xword	0x9b2f3ee6e2e117ff
	.xword	0xc3e523d26883a199
	.xword	0x831b16dced22e161
	.xword	0x46da78e088cefdca
	.xword	0x26f9bb2963822bba
	.xword	0x43216e533d10bd13
	.xword	0x9ff494c66f6d8e99
	.xword	0x4ac0d35669847e11
	.xword	0x3a790306d6f538ec
	.xword	0x735feb6563029915
	.xword	0xdd5da1e9d619962a
	.xword	0x9344392944961b9a
	.xword	0x6c921a4b41135fc8
	.xword	0xe99c8a8c559511be
	.xword	0xeec5bccb344a7b52
	.xword	0x20d0ac85dd257517
	.xword	0x6e171b60dccaeb9a
	.xword	0x26c365cd2757dc0a
	.xword	0xcba9f4c87c78ff74
	.xword	0x748d71d33a33231b
	.xword	0xf813b9f0847b2f10
	.xword	0x8731175db8a80851
	.xword	0x02705ce7d192046b
	.xword	0xd2e7923e1c0adf94
	.xword	0xb98d225f767d0b15
	.xword	0x13c9a953083d9017
	.xword	0x4c69fe08e639296d
	.xword	0xa1d0ab5bdb42b937
	.xword	0x40b6b2d87d30d7d1
	.xword	0x419ab2cce4398b25
	.xword	0xbd69c7ac97d7c788
	.xword	0x12dc6455c5fe4157
	.xword	0x7ed671b6ba771199
	.xword	0x2c6ea29dfbb084d3
	.xword	0xc0eee3f95eafe6df
	.xword	0x97a34885d07305c4
	.xword	0xf95a040eeeb65dac
	.xword	0xc9d601c940490ddc
	.xword	0x9a5513a19b155b7d
	.xword	0x835ecd4e266145ec
	.xword	0xbab114ad7deb1d75
	.xword	0xbd8e88dd1ddfadc8
	.xword	0xe306aca1f309bacc
	.xword	0xfe3aba06d224cf50
	.xword	0x8e1c22c1c4d69978
	.xword	0xcaba34386dfdf48b
	.xword	0x7cbc77d13a14b34b
	.xword	0x27d3ab881350623c
	.xword	0xd2bb18ccf2931f4e
	.xword	0xdf528414103978b8
	.xword	0x5a261f33b5284698
	.xword	0xcfe5ecdaad46b0a7
	.xword	0xd59d6fb447c6ca88
	.xword	0xb79b049dbffe9beb
	.xword	0xe11c9cef3e8c0d9b
	.xword	0x4c85f26054edb250
	.xword	0x334b68220d3827ea
	.xword	0xc3cc71b879ce98b0
	.xword	0x1f91d84e394e7976
	.xword	0xe7efb4b409aeabf5
	.xword	0x503f727976254e53
	.xword	0x824d7b6e5cdb36da
	.xword	0xfd21ff41b5305a39
	.xword	0x2c7153ef983d189a
	.xword	0x848241f0836ea2bd
	.xword	0xc233a37012c8135d
	.xword	0x2c4cf85c6930ad52
	.xword	0xaee47c56bc818e93
	.xword	0x5cdfbf7253b269eb
	.xword	0x8be9f4589c9c95d8
	.xword	0x5be35e4ac2c48a31
	.xword	0xbf13a556c695c9e7
	.xword	0xec18d858904556bd
	.xword	0xdb2a342333abb7c8
	.xword	0x71b41ac6646b8d9d
	.xword	0x69a6a596e5e18b7d
	.xword	0x70e88b9c581aedff
	.xword	0xaf373bf55efe7bb1
	.xword	0xd652ec3e40dec6d9
	.xword	0x1bf2af714fcf67a3
	.xword	0x8d079743a3b42ee9
	.xword	0x4a3b2958d675962f
	.xword	0x53e1b125e146ace5
	.xword	0x11031abb383b271d
	.xword	0x9a28eb6fd5289cac
	.xword	0x8fc1be243fc69033
	.xword	0x719c23960ecfe8dc
	.xword	0xb1471b0394e5b9ed
	.xword	0xac308710a61bd906
	.xword	0x8e241acffa4ad28b
	.xword	0x9191e55159058bb0
	.xword	0xe6e1d4fed24e40c0
	.xword	0xd0d3513c330e52fc
	.xword	0x9b00a4f33d9b9ea5
	.xword	0x0f5856b1d4ac2fc1
	.xword	0x51ff82c8aeb26545
	.xword	0xa399639ce89b8ede
	.xword	0xd34e00305886809d
	.xword	0x27898ee76b49e240
	.xword	0x39a8188f948405ed
	.xword	0xec470af1af8b1e33
	.xword	0x472507cd09dbfc31
	.xword	0x496f2da79ac0492d
	.xword	0xf6fdb4ebfffafcab
	.xword	0x5353626248c2fa80
	.xword	0x058f120f602e4839
	.xword	0xf692ef0ef70ce077
	.xword	0x71bf70514e659deb
	.xword	0x8e3431a1f429508e
	.xword	0x130f4b598fc128f0
	.xword	0x7b4cba9ad2c44d23
	.xword	0xb37a54fd3cce1f02
	.xword	0xb94db26697456a7d
	.xword	0xcceec9031b74f4e3
	.xword	0x637078e9e3ac2cac
	.xword	0x96d1532282001935
	.xword	0xa9b5c46ac562df13
	.xword	0x4cce706969eec2b0
	.xword	0xab55c32810f354af
	.xword	0x9dd2ec8a60830ad1
	.xword	0x2a320abfebee02fc
	.xword	0x3ce49f2927a72c75
	.xword	0x56ae79ddd449781d
	.xword	0x56b5965dbf58e7c2
	.xword	0x35ad97e7673c0b99
	.xword	0xd605db6aef72f39e
	.xword	0xfd89e5a090db1ded
	.xword	0x6aad4c9cfb738989
	.xword	0xfce03fbf9639bab2
	.xword	0xd521ad92dd981e55
	.xword	0x529f00b60a5ac9dd
	.xword	0x5781b2ad039d28a7
	.xword	0xb7de43882846e300
	.xword	0xcfdddc0bf1da1830
	.xword	0xd3590574ed58f7ed
	.xword	0x0007e764d1bcb05d
	.xword	0x3b1219b7f5824136
	.xword	0x28c91f5301dcff77
	.xword	0xf2ddfb4d6af983e5
	.xword	0x95f82381cf667a07
	.xword	0x7d576dfeb57ae199
	.xword	0xc8ea0e5d7aa1c137
	.xword	0x39e97d230f0d365f
	.xword	0x7d8b1081e37027cd
	.xword	0xcd67244b13d80145
	.xword	0xde0c5d589546078a
	.xword	0x1dfb95738f5862bd
	.xword	0x004f9842a2afe4b6
	.xword	0x11091429091899d7
	.xword	0x702ac7f5135e1552
	.xword	0x91005bf117be2728
	.xword	0x69fa389c06450c40
	.xword	0xc5ffcef2d12a9cae
	.xword	0x41166530cf313236
	.xword	0x23b7789baadae7e6
	.xword	0xdc7b1cab50c1c64e
	.xword	0x9573c3d1d3d63245
	.xword	0x30b02dd6f1b37a97
	.xword	0xb716ab7786ff4db6
	.xword	0xc189f50eb6a55982
	.xword	0x754d8073d8eddcea
	.xword	0xa9370ce2565d8666
	.xword	0xcd5498ac5d7a2303
	.xword	0x8126b2cd942ada93
	.xword	0x3a0bb0bdee18bc0f
	.xword	0xefe8c124fb2778ac
	.xword	0x619906b8c7bb92bd
	.xword	0xd8a09e6ad54f0bb8
	.xword	0x15fef510aabce58a
	.xword	0x77b829ff3d57366c
	.xword	0x437df4eea916d65b
	.xword	0xccc62817aac4a423
	.xword	0x0c47894490e72dc7
	.xword	0xdaea938141b89f7a
	.xword	0x072dc387a8f65e5e
	.xword	0x781bd526a0faa6e1
	.xword	0x440cd0074f5003ef
	.xword	0x96209811d8b56e2c
	.xword	0x359f2902c0c59efd
	.xword	0x1e6eeeb91c912db4
	.xword	0x3e6e1e1567959d64
	.xword	0x8c60a34ad069e56e
	.xword	0xdb923b22c17d67bc
	.xword	0xc33c9fca6730b407
	.xword	0xf9dc8f287b56bc63
	.xword	0x9d9ef03186b4c8f4
	.xword	0xe0288563c0e64134
	.xword	0x1b857b943b0c0f30
	.xword	0x24e7b2a1d5b1b9af
	.xword	0xdcf7ea12923a4691
	.xword	0xdb7e6ae5355bf651
	.xword	0x174477922113b24e
	.xword	0x4795287fbe3b592a
	.xword	0xcb38458e94bd034e
	.xword	0x40775cb85323f865
	.xword	0xed2795091be9ad0e
	.xword	0x2874c6350692ba97
	.xword	0x7c4f5b4ea2088fd9
	.xword	0x046b12afec5ad950
	.xword	0x77b6c23be97ae3eb
	.xword	0x57057519fd230658
	.xword	0x81cc2071299c7a7f
	.xword	0x07961e5fe010b233
	.xword	0x379d8325c1d48ab4
	.xword	0x64222262f43a4f76
	.xword	0x420c8bbd37f79b2d
	.xword	0xbfa3726fe5abeb67
	.xword	0x9257d3389a5a8c3a
	.xword	0xe3c496f8ce00736a
	.xword	0xc4c782f6dbcf0e5f
	.xword	0x5009acb9823f70b8
	.xword	0xd536efcd650f5bba
	.xword	0x9add3cfed7282b3d
	.xword	0x1a8e0dea607dc375
	.xword	0x4a08f1134a8d4dcf
	.xword	0x62fa6201886120c5
	.xword	0x3a63cb82368f5362
	.xword	0xb4f372402047b2c3
	.xword	0x2aa972ebe1f5e8cb
	.xword	0x83a57b01879ac13c
	.xword	0x1d91073db3458c14
	.xword	0x6335291633a9edff
	.xword	0x5b8e4e27545cce8e
	.xword	0x7b399c4d5c8bdb65
	.xword	0x9280389990368324
	.xword	0xce3dc79a679e11ec
	.xword	0x6870ea197c5ae39b
	.xword	0x36e0837080a88d04
	.xword	0x70d6511a15ba3fa3
	.xword	0xa0b98873c4e4981f
	.xword	0xd8c0cf9edf3146ac
	.xword	0x656a15260d464f22
	.xword	0x4134bbb96c4f4c36
	.xword	0x8ecfc8ac2307b552
	.xword	0xa54b9777ee66bb25
	.xword	0x0ed4814e1a47a028
	.xword	0x886fd27f8258e0ac
	.xword	0x5a0a4079f85912fa
	.xword	0x16713fcd497b2a7e
	.xword	0x1321cabecdb2de90
	.xword	0xa13c89650201f6d2
	.xword	0xb1ed02dbbff851fe
	.xword	0x2f2ecc4a8d971b8c
	.xword	0xefd495d342c5735c
	.xword	0xdc1baa000f5255ae
	.xword	0x6d4ed51a41bf2763
	.xword	0x39216be1a0fc21ec
	.xword	0x4ed9e30846aeb0c0
	.xword	0x034be893d5c7c019
	.xword	0x146bba99a2b7c16b
	.xword	0xcc186790dfbba8b7
	.xword	0x66c3530c6fa5cf81
	.xword	0x34a4c78a77ef716f
	.xword	0x575b65485d375f35
	.xword	0xc55682148f1e9b82
	.xword	0x6aef68b659e1920a
	.xword	0xc9b0f494b3de1638
	.xword	0x59ca43989b0a887e
	.xword	0xb30651f87dc970d8
	.xword	0xa8227f3817f2203d
	.xword	0xf71ac1c3d5e2c1c9
	.xword	0x7c198ac61b3baa6b
	.xword	0x39e536e5ee33e1a5
	.xword	0xdc355d4d0e5f0f28
	.xword	0x79ded1db6c02b5ca
	.xword	0xc9750e23368e4846
	.xword	0x356e12f87abcdf67
	.xword	0xfef28616a6e5007e
	.xword	0x7516a0fef87bda54
	.xword	0xf14bbe6552b32085
	.xword	0xacdc55959b918586
	.xword	0xc5177e81f8bd3b7e
	.xword	0x772d8637fca7e17e
	.xword	0x526fc6abb0113438
	.xword	0x13a152503c0b8604
	.xword	0x396323c969afec4e
	.xword	0x4afb711796f7114d
	.xword	0xef3fbba823ccdf91
	.xword	0xc4f7d3a480501543
	.xword	0x1684c0a51765d535
	.xword	0x3e173dc23ce8f1b3
	.xword	0x6102de6249eb23ef
	.xword	0x26ebbf4b7b6f36a4
	.xword	0x7b0cd70ff2068899
	.xword	0x6a46347c472007f9
	.xword	0x7e9c428360a0138f
	.xword	0xdb2d31c633a0ea75
	.xword	0xe9613a6beaf5f054
	.xword	0xe2ada4c9c683c27e
	.xword	0x2e70b54bc16d25bb
	.xword	0x6342103411dca043
	.xword	0x65423121759f5370
	.xword	0x35a974f78503c148
	.xword	0x9cc44d6b2d9968c3
	.xword	0x4836498357b4f84f
	.xword	0x0ef7d9f4ebfc4bcd
	.xword	0xf99f49689e875801
	.xword	0x74a4c5667073c4f1
	.xword	0xa071d9ac4c88fc06
	.xword	0xe4ac500b05c45823
	.xword	0xadf9cba069c3b2c8
	.xword	0x80088369f7090f49
	.xword	0x6baa9a56e4d306cf
	.xword	0xa09324ef8e7691ae
	.xword	0xaac36fcd7048dd5e
	.xword	0xccea7444820e78c4
	.xword	0x4cf7d48d90b5b6e5
	.xword	0x1f6d961e0ecb49f4
	.xword	0x30de490e422cb1e4
	.xword	0xfba55f916db14d9b
	.xword	0xa2149656a77075e4
	.xword	0x39957313feb7aaa2
	.xword	0xec4bd921d0426234
	.xword	0x23520814d549c16a
	.xword	0x21618d12d054e0f7
	.xword	0xd3aa2e556d5583e6
	.xword	0xafa50de81b972e81
	.xword	0xde768bca5f04a7f4
	.xword	0xcc1f9a3ee5da495e
	.xword	0x1bf84c727adac601
	.xword	0x1ecda36da3f576fb
	.xword	0xec7e4c09b953bd03
	.xword	0xa58782cebc7c5adf
	.xword	0xb8ede78406549ded
	.xword	0x9d1c091aab69e731
	.xword	0x2ab8fa8739512ef8
	.xword	0x704d6c579ef7d440
	.xword	0xa2f2e4a3f5a86b01
	.xword	0x2497a68fdc302f57
	.xword	0xde2b55237f19332d
	.xword	0xe4fc4b5e39e799c4
	.xword	0x562c0836bbbdd83b
	.xword	0xc6f34852437a1bdf
	.xword	0xdfb00518a3a742cc
	.xword	0x9ed1ca60436c5ead
	.xword	0x8b80decfab31fbd8
	.xword	0x7d381d2f7b37d266
	.xword	0xbb2c92a0c5c448d3
	.xword	0x19c9b9fbc80a25c7
	.xword	0x51fbcec6e5d61a26
	.xword	0xd2d4505b04b3c5ef
	.xword	0x76c2d8fff27af34b
	.xword	0x6e6d07709b3765bd
	.xword	0xe4038f6134c90902
	.xword	0x62fe28d5337b7c5e
	.xword	0x6cfa634e49e10696
	.xword	0x9206bd4001047a64
	.xword	0x79913bd6342cd0a5
	.xword	0xbd0111e7352d26d0
	.xword	0x060bd2496c40e1ca
	.xword	0x32e60d12956c6faf
	.xword	0xcfbf5aadb27f4296
	.xword	0x569b795e3c5937f9
	.xword	0xb719b860c3c90fb4
	.xword	0x9a017e5a34aa63f5
	.xword	0x73f9dc4331f83d1f
	.xword	0x06721ee5774eea34
	.xword	0xb16012fb17be7975
	.xword	0xfc10344ab587284a
	.xword	0x63c649088d1284a1
	.xword	0xa2a1e5c817d7f112
	.xword	0xbe4c904a27b34313
	.xword	0x173850c044e8b762
	.xword	0xa7807ed231735655
	.xword	0x53cf299e79ae9562
	.xword	0xfd8a2799a5ae72b5
	.xword	0x39f39b5f005a9407
	.xword	0x94551656eff24a81
	.xword	0x851336fb08b82c1b
	.xword	0xb16755272ba61f54
	.xword	0x6293e29b33d3f6ca
	.xword	0xc694e22c942730d2
	.xword	0xcb4d2021353f6a21
	.xword	0xcd5ede0cfa069290
	.xword	0xe35561326a066769
	.xword	0xcd7f46b237b1634a
	.xword	0xcbd9759d6dd1563b
	.xword	0xfbdba010672e4306
	.xword	0xe5f3b90949c7eeb2
	.xword	0x81b1477f981c83d2
	.xword	0x89c204268941ad36
	.xword	0x312fa2934db9b982
	.xword	0x9db84b84853037c2
	.xword	0x82fdb558352162c5
	.xword	0xcb3351f252f63914
	.xword	0xdb7556db417b8826
	.xword	0x1d6f4f78c46755ef
	.xword	0xfa09710c39da69c4
	.xword	0xfa636a44587e18b6
	.xword	0x60c16f6475324614
	.xword	0xdadee28d35328f98
	.xword	0x923909380c415547
	.xword	0xc8d819516fbc95ba
	.xword	0x3ee9cee69949967d
	.xword	0x3ac57c828858c341
	.xword	0xd55f785202ccf14c
	.xword	0x8156e48119956c9e
	.xword	0x294f456e300de4fc
	.xword	0x9b4ab170bdd4e747
	.xword	0x399d1b0c251df79c
	.xword	0x8b5264e6c50b3806
	.xword	0x97457f63f62db15d
	.xword	0xac39d8d9964becff
	.xword	0xbd179b74591504c3
	.xword	0x83bee36386aee078
	.xword	0x2929b10a180cbfc1
	.xword	0x22db71252a2ea8d3
	.xword	0x4ec460900db307f4
	.xword	0xd30f8575650756a5
	.xword	0xc0f8f4b5baab792d
	.xword	0x647705a9e74ca873
	.xword	0x87ebcf1bb3ea66e7
	.xword	0x7a671e2ba54427ec
	.xword	0x105d37d4c797c099
	.xword	0x07c9072d1b358d44
	.xword	0x6cff9800f4abf4cb
	.xword	0x11d0a646a7f049e1
	.xword	0xca85575b4b44ac74
	.xword	0x1af71b381f25e72b
	.xword	0x82a706ae4172ddde
	.xword	0xbc4e606d6658165a
	.xword	0x92a38093fc19a8ef
	.xword	0xe2e7582f8ac4ff77
	.xword	0xbb928ec089573eed
	.xword	0x298958ee1b03d40a
	.xword	0x2cf0ac6529e836da
	.xword	0x452a56a636a45ab6
	.xword	0xa76c5cbb7251fc81
	.xword	0x73fc190a363984af
	.xword	0xbcb7a07481cc3458
	.xword	0xf3537d50fcfbf661
	.xword	0xaa1dd9ff6e739b4a
	.xword	0xbdcafcfc3ab841f1
	.xword	0xa08f13515f55312e
	.xword	0xd0983fddd8bf5f63
	.xword	0xabeb56fbe5c5d245
	.xword	0x3e3686605488d551
	.xword	0x77d6d11009150efa
	.xword	0x6a55baf1529ecc6c
	.xword	0xfada56a951d8ba5c
	.xword	0xee579f35f4d27b1d
	.xword	0xee6c2cfa5ae932c4
	.xword	0xe34d8bb4d1700502
	.xword	0xcc069aadf9fd0d17
	.xword	0x164cfa6c28ba2ecb
	.xword	0x9d49d9cc71302541
	.xword	0x686471cba4ad19ca
	.xword	0x5baab89c7abfc288
	.xword	0xe4608a52d7161e5b
	.xword	0x8544377325d9ba77
	.xword	0x99c27cafb362eeca
	.xword	0x85ad4acd810a2e81
	.xword	0x3d3d1df862b745c0
	.xword	0x691948d240283c1e
	.xword	0x99080fa38ea37f1a
	.xword	0x92c7e0e0ee2f99ff
	.xword	0x0419c2335279da2f
	.xword	0x7b1021bb3e358564
	.xword	0xbb01aee3b8fdf653
	.xword	0xc4704e30900443f9
	.xword	0xc20bce3956c7dfef
	.xword	0x86a7046227787492
	.xword	0x45474ae445559859
	.xword	0x9badfa3b8f28378e
	.xword	0x010b320a25adc344
	.xword	0x588ea5096bb12802
	.xword	0xd60705228e24a029
	.xword	0xaeee6076703b29e7
	.xword	0xd9af4852eb9f18da
	.xword	0x194099d766137424
	.xword	0xaf6b1e46b738177f
	.xword	0x37944afde4b129f6
	.xword	0x244c67da4e6fb5f5
	.xword	0x3c348cf8b2c83935
	.xword	0x1a7be1a158cfe757
	.xword	0x6e2e621ba54cafa4
	.xword	0x4de9b25bb94d200d
	.xword	0x6b2ce60da0c62f08
	.xword	0x0b668cfaaa60bfba
	.xword	0x2e6e56015f43efb6
	.xword	0x8e582629475758b6
	.xword	0x8f2b65accf65b58d
	.xword	0xca39133ac113b309
	.xword	0xef79dc8369aa892a
	.xword	0x635be0121344abbb
	.xword	0x6e2ca9cb2d14f0d4
	.xword	0x375017d48ffa7b97
	.xword	0x0fcccfcf423ec086
	.xword	0x58e4da4e7d483a62
	.xword	0xada7205aa6435809
	.xword	0xf26319ef4c2ca1da
	.xword	0x98c7232be7b50c8a
	.xword	0x81e4e85b8ddf27b5
	.xword	0x0408a079c1be6312
	.xword	0x73e2d8c88445d04f
	.xword	0x6eca0e5e2d5f56b9
	.xword	0x67dffe8c9069fbc6
	.xword	0x4c3201917a817129
	.xword	0xf137c3d9cfe7133b
	.xword	0x0fa5abec73c16c47
	.xword	0x7ee568a23e8d4ca7
	.xword	0x516a9369390111aa
	.xword	0x3184943fe03b56c9
	.xword	0x00a4b9a45eb9eb01
	.xword	0x2c247e54f09f7720
	.xword	0x1f1e0a0a1422a977
	.xword	0x0c8452f5517f8578
	.xword	0x3e2915f3ad4b4fd4
	.xword	0xd943e8bd3ecb1d68
	.xword	0x2253186cf30e1e4a
	.xword	0xaa33620191c7ec32
	.xword	0x4f0f8b7b858b895d
	.xword	0x7c7c73990bad14b1
	.xword	0xd2e46096772f4b0a
	.xword	0x7ea0e7e2de1b648c
	.xword	0xf2a7d1fa0a492cb3
	.xword	0x516bda5f406f916d
	.xword	0x2bc84294ad2400cd
	.xword	0xa7a762a8f0dbb736
	.xword	0x30de9ef4b60be037
	.xword	0x5219a633b083cbef
	.xword	0x88405d4c8cb2c0b5
	.xword	0x3ee582fc665919a6
	.xword	0xe757309c560baee0
	.xword	0xf9e91b4cd2ea2e22
	.xword	0xc0a386d605a9d2aa
	.xword	0xb257d129b0fddbe3
	.xword	0xa80db277be9aebc8
	.xword	0x93cbf0bd0f5bd8f3
	.xword	0xbca7d9ae5e00a3d2
	.xword	0x871f22b1027b2cea
	.xword	0xaa210d3af4c88e2f
	.xword	0x0fa7f33019ca086f
	.xword	0xa0c6cb8a34f833ba
	.xword	0xf9955826722db284
	.xword	0x2f7781a46a5c9ff7
	.xword	0x9ff4918e3e330814
	.xword	0xa1be0a46c657ec8e
	.xword	0x825496142a1f8d39
	.xword	0xe33d6568083c7b3b
	.xword	0x73a96d9f0d45033c
	.xword	0xc6a5c5d8af3e1f8e
	.xword	0x0193dc5173a21394
	.xword	0x6419903546cf0da6
	.xword	0xc0ab83d96115d6b3
	.xword	0xcb65853f92ed846b
	.xword	0xe80fbbf303369283
	.xword	0xd98e038257f030ea
	.xword	0xfa7996d703577c57
	.xword	0xa0a604471145951d
	.xword	0x73e41da0f34e14e4
	.xword	0x8e1df1db5a1f6ad0
	.xword	0x75e959513e0cefbd
	.xword	0x0ded9993673ba6d1
	.xword	0x7c5685115850235f
	.xword	0x0eb8df4f76234cfd
	.xword	0x76607c517863fee3
	.xword	0x3c74a8afb57a00a0
	.xword	0x27dd0d7a1b9043a3
	.xword	0x5ef8d67f63c43580
	.xword	0x86af946e3304cf2a
	.xword	0x591f6152fbd5b0e5
	.xword	0xe80e337732a50fc8
	.xword	0x365f122ea26418d8
	.xword	0x6c398bbfa6dada11
	.xword	0x2f17c93cf3fa15f8
	.xword	0x9c8d25486c7c1dd6
	.xword	0x3c9530930f57d709
	.xword	0x50c69113f35b252f
	.xword	0xfd99a17043937f85
	.xword	0x30d7b96ec988bc47
	.xword	0x5fe26f2d3c2f4061
	.xword	0x53de38bb8c456010
	.xword	0xda18b1abb16c5943
	.xword	0xd086051de4ee1046
	.xword	0xf5c302eada245b15
	.xword	0xc78f1d04536d6035
	.xword	0x60f85aaa12f7166d
	.xword	0x6d35fa6da11ce4c3
	.xword	0xd0fcbd05ef4cf303
	.xword	0x06888cf3a3564dd4
	.xword	0x730e5af1bc10b4ee
	.xword	0xffc92ab6d259c498
	.xword	0x6a0884e97f2dd801
	.xword	0xd4386477dbf924e8
	.xword	0x66dc5a0738c31a2b
	.xword	0x21abca5e2e167cd0
	.xword	0x110fcfcafa1cac4e
	.xword	0xd5264a1934094399
	.xword	0xfb6c7611f9a30086
	.xword	0xaff1e36752b1b372
	.xword	0xd3986a5ea35255a2
	.xword	0x9dc90348ba395c96
	.xword	0x6cd5db2470f9f8a0
	.xword	0xcfb1564376d3db43
	.xword	0x9391d37c7c09a50a
	.xword	0xafc11d99192c5ffe
	.xword	0x781cdb6d327b7fa4
	.xword	0x841585828727c914
	.xword	0x86c87050702ba574
	.xword	0x9a41b677fcd248e1
	.xword	0x9599515e77f5f848
	.xword	0xa2b1427852b23191
	.xword	0x742eebcc585250e3
	.xword	0xcc195a44c630b6e7
	.xword	0x1c7fccb8ec33d67e
	.xword	0x19e873afefe70278
	.xword	0xa544f191c5a2a18f
	.xword	0x453eddf3e5e2bc8c
	.xword	0x62d85eaac90b03df

.text
        ta      T_GOOD_TRAP



/*===========================================*/
/* The grammar  section of the diag          */
/*===========================================*/

!!# /************************************************************
!!# *
!!# * File:         exu_bypass_1.j
!!# *
!!# * Description:
!!# * only one thread and Rd hit of Rs1 in multiple pipeline stage..
!!# * * 
!!# **************************************************************/
!!# 
!!# 
!!# --setup
!!# 
!!# 
!!# /* Define the number of threads */
!!# /*==============================*/
!!#   IJ_set_thread_count(1);
!!# 
!!# 
!!# /*===========================================*/
!!# /* The init section of the diag */
!!# /*===========================================*/
!!# --init
!!# 
!!# /* set up some token weighting vars */
!!# /*==================================*/
!!#   IJ_set_rvar(wt_addsub, 	"{8}");     
!!#   IJ_set_rvar(wt_ld, 		"{5}");
!!#   IJ_set_rvar(wt_logic, 	"{10}");
!!# 
!!# 
!!# /* define random variables (rvar)s for register initialization */
!!# /*===========================================*/
!!#   IJ_set_rvar(init_64,		"64'hrrrrrrrr_rrrrrrrr");
!!# 
!!# 
!!# /* define DEFAULT RS1, RS2, RD register usage */
!!# /*===========================================*/
!!#   IJ_set_ropr_fld(ijdefault, Ft_Rs1, "{8}");		
!!#   IJ_set_ropr_fld(ijdefault, Ft_Rs2, "{8..12}");
!!#   IJ_set_ropr_fld(ijdefault, Ft_Rd,  "{8}");
!!#   IJ_set_ropr_fld(ijdefault, Ft_Simm13,  "13'hrrrr");
!!# 
!!# 
!!# /* define custom register usage  */
!!# /*===============================*/
!!#   IJ_set_ropr_fld(op_ld, Ft_Rs1, "{1}");		
!!#   IJ_set_ropr_fld(op_ld, Ft_Rs2, "{0}");		
!!#   IJ_set_ropr_fld(op_ld, Ft_Rd,  "{8}");		
!!#   IJ_set_ropr_fld(op_ld, Ft_Simm13, "13'b000_000rr_rrrrr");		
!!#  
!!# 
!!# /* register initialization */
!!# /*=========================*/
!!# 
!!#   IJ_init_regs_by_setx ("th0", 2, 1, init_64);
!!# 
!!#   IJ_printf("th0", "\tsetx\tt0_data_start_0,%%g0, %%r1\n");
!!# 
!!# 
!!#   return 0;
!!# 
!!# 
!!# /*===========================================*/
!!# /* The finish section of the diag            */
!!# /*===========================================*/
!!# --finish
!!# 
!!#   	IJ_printf ("th0", ".data\n.align\t256\nt0_data_start_0:\n");
!!#   int i;
!!# 
!!#   for (i= 0; i < 1024; i++) 
!!#  {	IJ_printf ("th", "\t.xword\t0x%016llrx\n", init_64);
!!# 
!!#  }
!!# 
!!# /*===========================================*/
!!# /* The diag_ini section of the diag          */
!!# /*===========================================*/
!!# --diag_ini
!!# 
!!# #define ENABLE_T0_Fp_disabled_0x20
!!# #include "enable_traps.h"
!!# #include "boot.s"
!!# 
!!# 
!!# .text
!!# .global main
!!# 
!!# 
!!# main:
!!#      wr    %g0, 7, %fprs
!!# 
!!# 
!!# /*===========================================*/
!!# /* The diag_fini section of the diag          */
!!# /*===========================================*/
!!# --diag_fini
!!# 
!!# !<<IJ>>include "th0.s"
!!# 
!!# .text
!!#         ta      T_GOOD_TRAP
!!# 
!!# 
!!# 
!!# /*===========================================*/
!!# /* The grammar  section of the diag          */
!!# /*===========================================*/
!!# 
!!# --grammar
!!# 
!!# 
!!# /* The main recursive sequence               */
!!# /* generates code when inst_type is executed */
!!# /*===========================================*/
!!# inst_block: inst_type
!!#             | inst_block inst_type
!!#               {
!!#                IJ_generate ("th", $2);
!!#               };
!!# 
!!# /*==================================================*/
!!# inst_type:  addsub  %rvar wt_addsub
!!# 	    | ld    %rvar wt_ld
!!# 	    | logic   %rvar wt_logic
!!# ;
!!# 
!!# 
!!# /* the permutation of different types */
!!# /*===============================================*/
!!# 
!!# addsub:		tADD_R | tADD_I | tADDcc_R | tADDcc_I
!!# 		| tSUB_R | tSUB_I | tSUBcc_R | tSUBcc_I
!!# ;
!!# 
!!# 
!!# ld:		ld_inst %ropr	op_ld
!!# ;
!!# 
!!# 
!!# 
!!# ld_inst:		tLDSB_R | tLDSB_I
!!# 		| tLDSH_R | tLDSH_I
!!# 		| tLDSW_R | tLDSW_I
!!# 		| tLDUB_R | tLDUB_I
!!# 		| tLDUH_R | tLDUH_I
!!# 		| tLDUW_R | tLDUW_I
!!# 		| tLDSB_R | tLDSB_I
!!# //		| tSTH_R | tSTH_I
!!# //		| tSTW_R | tSTW_I
!!# //		| tSTB_R | tSTB_I
!!# ;
!!# 
!!# 
!!# logic:		tAND_R | tAND_I
!!# 		| tANDcc_R | tANDcc_I
!!# 		| tANDN_R  | tANDN_I
!!# 		| tANDNcc_R | tANDNcc_I
!!# 		| tOR_R | tOR_I
!!# 		| tORcc_R | tORcc_I
!!# 		| tORN_R | tORN_I
!!# 		| tORNcc_R | tORNcc_I
!!# 		| tXOR_R | tXOR_I
!!# 		| tXORcc_R | tXORcc_I
!!# 		| tXNOR_R | tXNOR_I
!!# 		| tXNORcc_R | tXNORcc_I
!!# ;
!! Token Generation Statistics
!! ---------------------------------
!! 
!! Rule   1 (line  114), Count:   999  inst_block           -> inst_type 
!! Rule   2 (line  115), Count:   999  inst_block           -> inst_block inst_type 
!! Rule   3 (line  121), Count:   357  inst_type            -> addsub 
!! Rule   4 (line  122), Count:   225  inst_type            -> ld 
!! Rule   5 (line  123), Count:   415  inst_type            -> logic 
!! Rule   6 (line  130), Count:    44  addsub               -> tADD_R 
!! Rule   7 (line  130), Count:    49  addsub               -> tADD_I 
!! Rule   8 (line  130), Count:    37  addsub               -> tADDcc_R 
!! Rule   9 (line  130), Count:    43  addsub               -> tADDcc_I 
!! Rule  10 (line  131), Count:    43  addsub               -> tSUB_R 
!! Rule  11 (line  131), Count:    41  addsub               -> tSUB_I 
!! Rule  12 (line  131), Count:    51  addsub               -> tSUBcc_R 
!! Rule  13 (line  131), Count:    42  addsub               -> tSUBcc_I 
!! Rule  14 (line  135), Count:   225  ld                   -> ld_inst 
!! Rule  15 (line  140), Count:    16  ld_inst              -> tLDSB_R 
!! Rule  16 (line  140), Count:    20  ld_inst              -> tLDSB_I 
!! Rule  17 (line  141), Count:     7  ld_inst              -> tLDSH_R 
!! Rule  18 (line  141), Count:    24  ld_inst              -> tLDSH_I 
!! Rule  19 (line  142), Count:    26  ld_inst              -> tLDSW_R 
!! Rule  20 (line  142), Count:    13  ld_inst              -> tLDSW_I 
!! Rule  21 (line  143), Count:    21  ld_inst              -> tLDUB_R 
!! Rule  22 (line  143), Count:    15  ld_inst              -> tLDUB_I 
!! Rule  23 (line  144), Count:    14  ld_inst              -> tLDUH_R 
!! Rule  24 (line  144), Count:    18  ld_inst              -> tLDUH_I 
!! Rule  25 (line  145), Count:    17  ld_inst              -> tLDUW_R 
!! Rule  26 (line  145), Count:    23  ld_inst              -> tLDUW_I 
!! Rule  29 (line  153), Count:    17  logic                -> tAND_R 
!! Rule  30 (line  153), Count:    17  logic                -> tAND_I 
!! Rule  31 (line  154), Count:    15  logic                -> tANDcc_R 
!! Rule  32 (line  154), Count:    12  logic                -> tANDcc_I 
!! Rule  33 (line  155), Count:    13  logic                -> tANDN_R 
!! Rule  34 (line  155), Count:    14  logic                -> tANDN_I 
!! Rule  35 (line  156), Count:    15  logic                -> tANDNcc_R 
!! Rule  36 (line  156), Count:    17  logic                -> tANDNcc_I 
!! Rule  37 (line  157), Count:    18  logic                -> tOR_R 
!! Rule  38 (line  157), Count:    20  logic                -> tOR_I 
!! Rule  39 (line  158), Count:     9  logic                -> tORcc_R 
!! Rule  40 (line  158), Count:    18  logic                -> tORcc_I 
!! Rule  41 (line  159), Count:    23  logic                -> tORN_R 
!! Rule  42 (line  159), Count:    13  logic                -> tORN_I 
!! Rule  43 (line  160), Count:    15  logic                -> tORNcc_R 
!! Rule  44 (line  160), Count:    14  logic                -> tORNcc_I 
!! Rule  45 (line  161), Count:    13  logic                -> tXOR_R 
!! Rule  46 (line  161), Count:    24  logic                -> tXOR_I 
!! Rule  47 (line  162), Count:    10  logic                -> tXORcc_R 
!! Rule  48 (line  162), Count:    16  logic                -> tXORcc_I 
!! Rule  49 (line  163), Count:    18  logic                -> tXNOR_R 
!! Rule  50 (line  163), Count:    25  logic                -> tXNOR_I 
!! Rule  51 (line  164), Count:    21  logic                -> tXNORcc_R 
!! 
!!   257: Token tADD_R	Count = 45
!!   258: Token tADD_I	Count = 50
!!   259: Token tADDcc_R	Count = 38
!!   260: Token tADDcc_I	Count = 44
!!   261: Token tSUB_R	Count = 44
!!   262: Token tSUB_I	Count = 42
!!   263: Token tSUBcc_R	Count = 52
!!   264: Token tSUBcc_I	Count = 43
!!   265: Token tLDSB_R	Count = 17
!!   266: Token tLDSB_I	Count = 21
!!   267: Token tLDSH_R	Count = 8
!!   268: Token tLDSH_I	Count = 25
!!   269: Token tLDSW_R	Count = 27
!!   270: Token tLDSW_I	Count = 14
!!   271: Token tLDUB_R	Count = 22
!!   272: Token tLDUB_I	Count = 16
!!   273: Token tLDUH_R	Count = 15
!!   274: Token tLDUH_I	Count = 19
!!   275: Token tLDUW_R	Count = 18
!!   276: Token tLDUW_I	Count = 24
!!   277: Token tAND_R	Count = 18
!!   278: Token tAND_I	Count = 18
!!   279: Token tANDcc_R	Count = 16
!!   280: Token tANDcc_I	Count = 13
!!   281: Token tANDN_R	Count = 14
!!   282: Token tANDN_I	Count = 15
!!   283: Token tANDNcc_R	Count = 16
!!   284: Token tANDNcc_I	Count = 18
!!   285: Token tOR_R	Count = 19
!!   286: Token tOR_I	Count = 21
!!   287: Token tORcc_R	Count = 10
!!   288: Token tORcc_I	Count = 19
!!   289: Token tORN_R	Count = 24
!!   290: Token tORN_I	Count = 14
!!   291: Token tORNcc_R	Count = 16
!!   292: Token tORNcc_I	Count = 15
!!   293: Token tXOR_R	Count = 14
!!   294: Token tXOR_I	Count = 25
!!   295: Token tXORcc_R	Count = 11
!!   296: Token tXORcc_I	Count = 17
!!   297: Token tXNOR_R	Count = 19
!!   298: Token tXNOR_I	Count = 26
!!   299: Token tXNORcc_R	Count = 22
!!   300: Token tXNORcc_I	Count = 16
!! 
!! 
!! +++ finish +++
