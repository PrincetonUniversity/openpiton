// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tlu_gl_lvl_mt_1_rand_s1.s
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
   random seed:	199493408
   Jal tlu_gl_lvl_mt_1.j:	
********************************************************************************/



#define PCONTEXT	0x10
#define SCONTEXT	0x10

#define MAIN_PAGE_NUCLEUS_ALSO
#define MAIN_PAGE_HV_ALSO

#include "tlu_custom_trap_handlers.s"
#include "enable_traps.h"
#include "boot.s"

.text
.global main

main:

! Register init code

	setx 0x1df170e7c854b218, %g1, %g0
	setx 0xc3881999b870344b, %g1, %g1
	setx 0x192534ee3051adf2, %g1, %g2
	setx 0x2f8df30d0c68c23e, %g1, %g3
	setx 0x3b77916b93448e22, %g1, %g4
	setx 0xe47307859cc8e068, %g1, %g5
	setx 0xefd6a7adae87a48f, %g1, %g6
	setx 0x108fa049aed0ae91, %g1, %g7
	setx 0x665169859ad9a602, %g1, %r16
	setx 0x0711785dae068625, %g1, %r17
	setx 0x1a736f1a943010ef, %g1, %r18
	setx 0x92edcc6ed5ae49bf, %g1, %r19
	setx 0x3af913aa86c04d9c, %g1, %r20
	setx 0xa0baea8247ade6cb, %g1, %r21
	setx 0x4c1cf036d22ca09f, %g1, %r22
	setx 0xd4120972ae454d29, %g1, %r23
	setx 0x4716ea2dc13098e9, %g1, %r24
	setx 0xe784afabd7fbb648, %g1, %r25
	setx 0x6eb65ead9e19d93f, %g1, %r26
	setx 0xda95e1bfc7bf8c6f, %g1, %r27
	setx 0x91419dd0b92b7e24, %g1, %r28
	setx 0x35fd5bfbe4e2dd35, %g1, %r29
	setx 0x89c818b023014698, %g1, %r30
	setx 0x71ded30ab56416b0, %g1, %r31
	save
	setx 0xddd6caa964dfa139, %g1, %r16
	setx 0xb21be2f5fba312c1, %g1, %r17
	setx 0x515814f6411a274b, %g1, %r18
	setx 0x2e7793d5570189a7, %g1, %r19
	setx 0x7716873156ca343b, %g1, %r20
	setx 0x0a10b2e3f2bc52eb, %g1, %r21
	setx 0x80c72129b6100188, %g1, %r22
	setx 0x2dc570f39e01c9e3, %g1, %r23
	setx 0xf87f36aaca924892, %g1, %r24
	setx 0xeb6af69b9de17c9e, %g1, %r25
	setx 0x0706409a1dbc2ef0, %g1, %r26
	setx 0x3a00da47b3ef4471, %g1, %r27
	setx 0xf8c7185828f6ca1f, %g1, %r28
	setx 0x25221bbdf38f02a0, %g1, %r29
	setx 0x21e31c1b6c61b082, %g1, %r30
	setx 0xbc4478b4eec6db5c, %g1, %r31
	restore
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
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa192f860  ! 2: WRPR_GL_I	wrpr	%r11, 0x1860, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa195636b  ! 4: WRPR_GL_I	wrpr	%r21, 0x036b, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa197ee81  ! 6: WRPR_GL_I	wrpr	%r31, 0x0e81, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa195f1bd  ! 8: WRPR_GL_I	wrpr	%r23, 0x11bd, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1957987  ! 10: WRPR_GL_I	wrpr	%r21, 0x1987, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1933779  ! 12: WRPR_GL_I	wrpr	%r12, 0x1779, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1926e60  ! 14: WRPR_GL_I	wrpr	%r9, 0x0e60, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa193bce7  ! 16: WRPR_GL_I	wrpr	%r14, 0x1ce7, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1953f8c  ! 18: WRPR_GL_I	wrpr	%r20, 0x1f8c, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19233fa  ! 20: WRPR_GL_I	wrpr	%r8, 0x13fa, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa197bab2  ! 22: WRPR_GL_I	wrpr	%r30, 0x1ab2, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1973b98  ! 24: WRPR_GL_I	wrpr	%r28, 0x1b98, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa192a6fd  ! 26: WRPR_GL_I	wrpr	%r10, 0x06fd, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1932ab9  ! 28: WRPR_GL_I	wrpr	%r12, 0x0ab9, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19567cf  ! 30: WRPR_GL_I	wrpr	%r21, 0x07cf, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa192f3f0  ! 32: WRPR_GL_I	wrpr	%r11, 0x13f0, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19421ff  ! 34: WRPR_GL_I	wrpr	%r16, 0x01ff, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa192e9ab  ! 36: WRPR_GL_I	wrpr	%r11, 0x09ab, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1962c92  ! 38: WRPR_GL_I	wrpr	%r24, 0x0c92, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa194ed8d  ! 40: WRPR_GL_I	wrpr	%r19, 0x0d8d, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa192e72d  ! 42: WRPR_GL_I	wrpr	%r11, 0x072d, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19533cd  ! 44: WRPR_GL_I	wrpr	%r20, 0x13cd, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1976c27  ! 46: WRPR_GL_I	wrpr	%r29, 0x0c27, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1946f0d  ! 48: WRPR_GL_I	wrpr	%r17, 0x0f0d, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa196681e  ! 50: WRPR_GL_I	wrpr	%r25, 0x081e, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa197adb1  ! 52: WRPR_GL_I	wrpr	%r30, 0x0db1, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa197f506  ! 54: WRPR_GL_I	wrpr	%r31, 0x1506, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa192b936  ! 56: WRPR_GL_I	wrpr	%r10, 0x1936, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa192ec60  ! 58: WRPR_GL_I	wrpr	%r11, 0x0c60, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa196a967  ! 60: WRPR_GL_I	wrpr	%r26, 0x0967, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1936e35  ! 62: WRPR_GL_I	wrpr	%r13, 0x0e35, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa192a4b8  ! 64: WRPR_GL_I	wrpr	%r10, 0x04b8, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa196f6fa  ! 66: WRPR_GL_I	wrpr	%r27, 0x16fa, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19628f0  ! 68: WRPR_GL_I	wrpr	%r24, 0x08f0, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1953d4f  ! 70: WRPR_GL_I	wrpr	%r20, 0x1d4f, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1932007  ! 72: WRPR_GL_I	wrpr	%r12, 0x0007, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa193ed2f  ! 74: WRPR_GL_I	wrpr	%r15, 0x0d2f, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa192f605  ! 76: WRPR_GL_I	wrpr	%r11, 0x1605, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1942cde  ! 78: WRPR_GL_I	wrpr	%r16, 0x0cde, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa195eb68  ! 80: WRPR_GL_I	wrpr	%r23, 0x0b68, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa192ab9e  ! 82: WRPR_GL_I	wrpr	%r10, 0x0b9e, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19221d7  ! 84: WRPR_GL_I	wrpr	%r8, 0x01d7, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa192f062  ! 86: WRPR_GL_I	wrpr	%r11, 0x1062, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1966ced  ! 88: WRPR_GL_I	wrpr	%r25, 0x0ced, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa192bb43  ! 90: WRPR_GL_I	wrpr	%r10, 0x1b43, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1966364  ! 92: WRPR_GL_I	wrpr	%r25, 0x0364, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa194e257  ! 94: WRPR_GL_I	wrpr	%r19, 0x0257, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1922987  ! 96: WRPR_GL_I	wrpr	%r8, 0x0987, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1972197  ! 98: WRPR_GL_I	wrpr	%r28, 0x0197, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1952393  ! 100: WRPR_GL_I	wrpr	%r20, 0x0393, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa193f539  ! 102: WRPR_GL_I	wrpr	%r15, 0x1539, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1972322  ! 104: WRPR_GL_I	wrpr	%r28, 0x0322, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1963371  ! 106: WRPR_GL_I	wrpr	%r24, 0x1371, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa194ba22  ! 108: WRPR_GL_I	wrpr	%r18, 0x1a22, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19474e3  ! 110: WRPR_GL_I	wrpr	%r17, 0x14e3, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa195714c  ! 112: WRPR_GL_I	wrpr	%r21, 0x114c, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1977560  ! 114: WRPR_GL_I	wrpr	%r29, 0x1560, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1926d36  ! 116: WRPR_GL_I	wrpr	%r9, 0x0d36, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1937500  ! 118: WRPR_GL_I	wrpr	%r13, 0x1500, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa197fb84  ! 120: WRPR_GL_I	wrpr	%r31, 0x1b84, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1962070  ! 122: WRPR_GL_I	wrpr	%r24, 0x0070, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa193e4e2  ! 124: WRPR_GL_I	wrpr	%r15, 0x04e2, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa197f516  ! 126: WRPR_GL_I	wrpr	%r31, 0x1516, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa196a298  ! 128: WRPR_GL_I	wrpr	%r26, 0x0298, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1937798  ! 130: WRPR_GL_I	wrpr	%r13, 0x1798, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1922f1a  ! 132: WRPR_GL_I	wrpr	%r8, 0x0f1a, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19326dc  ! 134: WRPR_GL_I	wrpr	%r12, 0x06dc, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1932f47  ! 136: WRPR_GL_I	wrpr	%r12, 0x0f47, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa196e830  ! 138: WRPR_GL_I	wrpr	%r27, 0x0830, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa19361f1  ! 140: WRPR_GL_I	wrpr	%r13, 0x01f1, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa196f126  ! 142: WRPR_GL_I	wrpr	%r27, 0x1126, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa194bf24  ! 144: WRPR_GL_I	wrpr	%r18, 0x1f24, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1967739  ! 146: WRPR_GL_I	wrpr	%r25, 0x1739, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa194ac2d  ! 148: WRPR_GL_I	wrpr	%r18, 0x0c2d, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa194e261  ! 150: WRPR_GL_I	wrpr	%r19, 0x0261, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1946b35  ! 152: WRPR_GL_I	wrpr	%r17, 0x0b35, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1927dd4  ! 154: WRPR_GL_I	wrpr	%r9, 0x1dd4, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1943689  ! 156: WRPR_GL_I	wrpr	%r16, 0x1689, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa192a449  ! 158: WRPR_GL_I	wrpr	%r10, 0x0449, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1943815  ! 160: WRPR_GL_I	wrpr	%r16, 0x1815, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa193f5c8  ! 162: WRPR_GL_I	wrpr	%r15, 0x15c8, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1926c73  ! 164: WRPR_GL_I	wrpr	%r9, 0x0c73, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa194fb67  ! 166: WRPR_GL_I	wrpr	%r19, 0x1b67, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa193672f  ! 168: WRPR_GL_I	wrpr	%r13, 0x072f, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa196e155  ! 170: WRPR_GL_I	wrpr	%r27, 0x0155, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19261fd  ! 172: WRPR_GL_I	wrpr	%r9, 0x01fd, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa195f15f  ! 174: WRPR_GL_I	wrpr	%r23, 0x115f, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa193610d  ! 176: WRPR_GL_I	wrpr	%r13, 0x010d, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa193fdfb  ! 178: WRPR_GL_I	wrpr	%r15, 0x1dfb, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa196e806  ! 180: WRPR_GL_I	wrpr	%r27, 0x0806, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1956eda  ! 182: WRPR_GL_I	wrpr	%r21, 0x0eda, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa192ae77  ! 184: WRPR_GL_I	wrpr	%r10, 0x0e77, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa195ac7d  ! 186: WRPR_GL_I	wrpr	%r22, 0x0c7d, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa197231f  ! 188: WRPR_GL_I	wrpr	%r28, 0x031f, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1963655  ! 190: WRPR_GL_I	wrpr	%r24, 0x1655, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa197ee77  ! 192: WRPR_GL_I	wrpr	%r31, 0x0e77, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1962d1c  ! 194: WRPR_GL_I	wrpr	%r24, 0x0d1c, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa194f570  ! 196: WRPR_GL_I	wrpr	%r19, 0x1570, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa196f98a  ! 198: WRPR_GL_I	wrpr	%r27, 0x198a, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1962548  ! 200: WRPR_GL_I	wrpr	%r24, 0x0548, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1972d51  ! 202: WRPR_GL_I	wrpr	%r28, 0x0d51, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19574be  ! 204: WRPR_GL_I	wrpr	%r21, 0x14be, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa194a97d  ! 206: WRPR_GL_I	wrpr	%r18, 0x097d, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa196f0d9  ! 208: WRPR_GL_I	wrpr	%r27, 0x10d9, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa193f8af  ! 210: WRPR_GL_I	wrpr	%r15, 0x18af, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1976e0e  ! 212: WRPR_GL_I	wrpr	%r29, 0x0e0e, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa197649b  ! 214: WRPR_GL_I	wrpr	%r29, 0x049b, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa196fe1f  ! 216: WRPR_GL_I	wrpr	%r27, 0x1e1f, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa197a368  ! 218: WRPR_GL_I	wrpr	%r30, 0x0368, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa19626ff  ! 220: WRPR_GL_I	wrpr	%r24, 0x06ff, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19471e3  ! 222: WRPR_GL_I	wrpr	%r17, 0x11e3, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa19675e8  ! 224: WRPR_GL_I	wrpr	%r25, 0x15e8, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa192fa71  ! 226: WRPR_GL_I	wrpr	%r11, 0x1a71, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa192307e  ! 228: WRPR_GL_I	wrpr	%r8, 0x107e, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa19331b9  ! 230: WRPR_GL_I	wrpr	%r12, 0x11b9, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa194a0d1  ! 232: WRPR_GL_I	wrpr	%r18, 0x00d1, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa197a305  ! 234: WRPR_GL_I	wrpr	%r30, 0x0305, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19776ec  ! 236: WRPR_GL_I	wrpr	%r29, 0x16ec, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa194b06d  ! 238: WRPR_GL_I	wrpr	%r18, 0x106d, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1966714  ! 240: WRPR_GL_I	wrpr	%r25, 0x0714, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa193be11  ! 242: WRPR_GL_I	wrpr	%r14, 0x1e11, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19236a7  ! 244: WRPR_GL_I	wrpr	%r8, 0x16a7, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa197e0b7  ! 246: WRPR_GL_I	wrpr	%r31, 0x00b7, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa195ad82  ! 248: WRPR_GL_I	wrpr	%r22, 0x0d82, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa196308d  ! 250: WRPR_GL_I	wrpr	%r24, 0x108d, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa196bc6e  ! 252: WRPR_GL_I	wrpr	%r26, 0x1c6e, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa192ec73  ! 254: WRPR_GL_I	wrpr	%r11, 0x0c73, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa192a0c6  ! 256: WRPR_GL_I	wrpr	%r10, 0x00c6, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa196e0ea  ! 258: WRPR_GL_I	wrpr	%r27, 0x00ea, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa192e514  ! 260: WRPR_GL_I	wrpr	%r11, 0x0514, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa193e17e  ! 262: WRPR_GL_I	wrpr	%r15, 0x017e, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa192bbb2  ! 264: WRPR_GL_I	wrpr	%r10, 0x1bb2, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa192ba06  ! 266: WRPR_GL_I	wrpr	%r10, 0x1a06, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19263ce  ! 268: WRPR_GL_I	wrpr	%r9, 0x03ce, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1933f3f  ! 270: WRPR_GL_I	wrpr	%r12, 0x1f3f, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1923feb  ! 272: WRPR_GL_I	wrpr	%r8, 0x1feb, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa195e4c7  ! 274: WRPR_GL_I	wrpr	%r23, 0x04c7, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa196bcca  ! 276: WRPR_GL_I	wrpr	%r26, 0x1cca, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1946632  ! 278: WRPR_GL_I	wrpr	%r17, 0x0632, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1943754  ! 280: WRPR_GL_I	wrpr	%r16, 0x1754, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1937945  ! 282: WRPR_GL_I	wrpr	%r13, 0x1945, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1947f8c  ! 284: WRPR_GL_I	wrpr	%r17, 0x1f8c, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1952457  ! 286: WRPR_GL_I	wrpr	%r20, 0x0457, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa19372fa  ! 288: WRPR_GL_I	wrpr	%r13, 0x12fa, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa194eaec  ! 290: WRPR_GL_I	wrpr	%r19, 0x0aec, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa192bce9  ! 292: WRPR_GL_I	wrpr	%r10, 0x1ce9, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa197f5e8  ! 294: WRPR_GL_I	wrpr	%r31, 0x15e8, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa195ef4b  ! 296: WRPR_GL_I	wrpr	%r23, 0x0f4b, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa197e181  ! 298: WRPR_GL_I	wrpr	%r31, 0x0181, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa193b88a  ! 300: WRPR_GL_I	wrpr	%r14, 0x188a, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa192e6c8  ! 302: WRPR_GL_I	wrpr	%r11, 0x06c8, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1936518  ! 304: WRPR_GL_I	wrpr	%r13, 0x0518, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa19665e5  ! 306: WRPR_GL_I	wrpr	%r25, 0x05e5, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1957516  ! 308: WRPR_GL_I	wrpr	%r21, 0x1516, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1946689  ! 310: WRPR_GL_I	wrpr	%r17, 0x0689, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa194a058  ! 312: WRPR_GL_I	wrpr	%r18, 0x0058, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19624bb  ! 314: WRPR_GL_I	wrpr	%r24, 0x04bb, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa197e3fc  ! 316: WRPR_GL_I	wrpr	%r31, 0x03fc, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19769f1  ! 318: WRPR_GL_I	wrpr	%r29, 0x09f1, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1972074  ! 320: WRPR_GL_I	wrpr	%r28, 0x0074, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1957d05  ! 322: WRPR_GL_I	wrpr	%r21, 0x1d05, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa195a8ee  ! 324: WRPR_GL_I	wrpr	%r22, 0x08ee, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa197f2c3  ! 326: WRPR_GL_I	wrpr	%r31, 0x12c3, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa196ed77  ! 328: WRPR_GL_I	wrpr	%r27, 0x0d77, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa19424b7  ! 330: WRPR_GL_I	wrpr	%r16, 0x04b7, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1922b5a  ! 332: WRPR_GL_I	wrpr	%r8, 0x0b5a, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1966570  ! 334: WRPR_GL_I	wrpr	%r25, 0x0570, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1973c50  ! 336: WRPR_GL_I	wrpr	%r28, 0x1c50, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1943220  ! 338: WRPR_GL_I	wrpr	%r16, 0x1220, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa195ef82  ! 340: WRPR_GL_I	wrpr	%r23, 0x0f82, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa195f595  ! 342: WRPR_GL_I	wrpr	%r23, 0x1595, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa194635f  ! 344: WRPR_GL_I	wrpr	%r17, 0x035f, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa194339b  ! 346: WRPR_GL_I	wrpr	%r16, 0x139b, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa19226a4  ! 348: WRPR_GL_I	wrpr	%r8, 0x06a4, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa193f40f  ! 350: WRPR_GL_I	wrpr	%r15, 0x140f, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1932fe2  ! 352: WRPR_GL_I	wrpr	%r12, 0x0fe2, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1942fa7  ! 354: WRPR_GL_I	wrpr	%r16, 0x0fa7, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19376ad  ! 356: WRPR_GL_I	wrpr	%r13, 0x16ad, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa19665cb  ! 358: WRPR_GL_I	wrpr	%r25, 0x05cb, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa195ba11  ! 360: WRPR_GL_I	wrpr	%r22, 0x1a11, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa192ed3f  ! 362: WRPR_GL_I	wrpr	%r11, 0x0d3f, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1947da3  ! 364: WRPR_GL_I	wrpr	%r17, 0x1da3, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa196ffe2  ! 366: WRPR_GL_I	wrpr	%r27, 0x1fe2, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa195e60a  ! 368: WRPR_GL_I	wrpr	%r23, 0x060a, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa194b413  ! 370: WRPR_GL_I	wrpr	%r18, 0x1413, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa193be24  ! 372: WRPR_GL_I	wrpr	%r14, 0x1e24, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa197f1e5  ! 374: WRPR_GL_I	wrpr	%r31, 0x11e5, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa197a921  ! 376: WRPR_GL_I	wrpr	%r30, 0x0921, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1962f6f  ! 378: WRPR_GL_I	wrpr	%r24, 0x0f6f, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa197b8e8  ! 380: WRPR_GL_I	wrpr	%r30, 0x18e8, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa193ab63  ! 382: WRPR_GL_I	wrpr	%r14, 0x0b63, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa192f636  ! 384: WRPR_GL_I	wrpr	%r11, 0x1636, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa196bb8d  ! 386: WRPR_GL_I	wrpr	%r26, 0x1b8d, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa193f9cb  ! 388: WRPR_GL_I	wrpr	%r15, 0x19cb, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1957190  ! 390: WRPR_GL_I	wrpr	%r21, 0x1190, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19772ac  ! 392: WRPR_GL_I	wrpr	%r29, 0x12ac, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa195e628  ! 394: WRPR_GL_I	wrpr	%r23, 0x0628, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa197b951  ! 396: WRPR_GL_I	wrpr	%r30, 0x1951, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa19379e1  ! 398: WRPR_GL_I	wrpr	%r13, 0x19e1, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa196e4ef  ! 400: WRPR_GL_I	wrpr	%r27, 0x04ef, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa196e1f4  ! 402: WRPR_GL_I	wrpr	%r27, 0x01f4, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa195fad5  ! 404: WRPR_GL_I	wrpr	%r23, 0x1ad5, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19561b9  ! 406: WRPR_GL_I	wrpr	%r21, 0x01b9, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1932953  ! 408: WRPR_GL_I	wrpr	%r12, 0x0953, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19463bc  ! 410: WRPR_GL_I	wrpr	%r17, 0x03bc, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa192fd59  ! 412: WRPR_GL_I	wrpr	%r11, 0x1d59, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1952de7  ! 414: WRPR_GL_I	wrpr	%r20, 0x0de7, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa195364a  ! 416: WRPR_GL_I	wrpr	%r20, 0x164a, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa192f36d  ! 418: WRPR_GL_I	wrpr	%r11, 0x136d, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa192fc2c  ! 420: WRPR_GL_I	wrpr	%r11, 0x1c2c, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa192225b  ! 422: WRPR_GL_I	wrpr	%r8, 0x025b, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19637d5  ! 424: WRPR_GL_I	wrpr	%r24, 0x17d5, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa193fe9f  ! 426: WRPR_GL_I	wrpr	%r15, 0x1e9f, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa195f82b  ! 428: WRPR_GL_I	wrpr	%r23, 0x182b, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa197695f  ! 430: WRPR_GL_I	wrpr	%r29, 0x095f, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa194e0ac  ! 432: WRPR_GL_I	wrpr	%r19, 0x00ac, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1972beb  ! 434: WRPR_GL_I	wrpr	%r28, 0x0beb, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1936c60  ! 436: WRPR_GL_I	wrpr	%r13, 0x0c60, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa197fc96  ! 438: WRPR_GL_I	wrpr	%r31, 0x1c96, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa192aab3  ! 440: WRPR_GL_I	wrpr	%r10, 0x0ab3, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1946d40  ! 442: WRPR_GL_I	wrpr	%r17, 0x0d40, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa196bdc9  ! 444: WRPR_GL_I	wrpr	%r26, 0x1dc9, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa192b021  ! 446: WRPR_GL_I	wrpr	%r10, 0x1021, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa19575c4  ! 448: WRPR_GL_I	wrpr	%r21, 0x15c4, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1972847  ! 450: WRPR_GL_I	wrpr	%r28, 0x0847, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa194bcab  ! 452: WRPR_GL_I	wrpr	%r18, 0x1cab, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa193bca5  ! 454: WRPR_GL_I	wrpr	%r14, 0x1ca5, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1967e0b  ! 456: WRPR_GL_I	wrpr	%r25, 0x1e0b, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa194a146  ! 458: WRPR_GL_I	wrpr	%r18, 0x0146, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa195add0  ! 460: WRPR_GL_I	wrpr	%r22, 0x0dd0, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa19679f1  ! 462: WRPR_GL_I	wrpr	%r25, 0x19f1, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa197a233  ! 464: WRPR_GL_I	wrpr	%r30, 0x0233, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa194b0c5  ! 466: WRPR_GL_I	wrpr	%r18, 0x10c5, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa193beca  ! 468: WRPR_GL_I	wrpr	%r14, 0x1eca, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19762d8  ! 470: WRPR_GL_I	wrpr	%r29, 0x02d8, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa194e69d  ! 472: WRPR_GL_I	wrpr	%r19, 0x069d, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1943218  ! 474: WRPR_GL_I	wrpr	%r16, 0x1218, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa195f367  ! 476: WRPR_GL_I	wrpr	%r23, 0x1367, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1953539  ! 478: WRPR_GL_I	wrpr	%r20, 0x1539, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa196394a  ! 480: WRPR_GL_I	wrpr	%r24, 0x194a, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1973287  ! 482: WRPR_GL_I	wrpr	%r28, 0x1287, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1967cf2  ! 484: WRPR_GL_I	wrpr	%r25, 0x1cf2, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa196651f  ! 486: WRPR_GL_I	wrpr	%r25, 0x051f, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1933719  ! 488: WRPR_GL_I	wrpr	%r12, 0x1719, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa195addd  ! 490: WRPR_GL_I	wrpr	%r22, 0x0ddd, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1957218  ! 492: WRPR_GL_I	wrpr	%r21, 0x1218, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa193f8c7  ! 494: WRPR_GL_I	wrpr	%r15, 0x18c7, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1922ed7  ! 496: WRPR_GL_I	wrpr	%r8, 0x0ed7, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa19660d5  ! 498: WRPR_GL_I	wrpr	%r25, 0x00d5, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa194746b  ! 500: WRPR_GL_I	wrpr	%r17, 0x146b, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa194a14c  ! 502: WRPR_GL_I	wrpr	%r18, 0x014c, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa19237e8  ! 504: WRPR_GL_I	wrpr	%r8, 0x17e8, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa19671fb  ! 506: WRPR_GL_I	wrpr	%r25, 0x11fb, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1926be8  ! 508: WRPR_GL_I	wrpr	%r9, 0x0be8, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1926c25  ! 510: WRPR_GL_I	wrpr	%r9, 0x0c25, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa197f820  ! 512: WRPR_GL_I	wrpr	%r31, 0x1820, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1932db6  ! 514: WRPR_GL_I	wrpr	%r12, 0x0db6, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa192e056  ! 516: WRPR_GL_I	wrpr	%r11, 0x0056, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa192fd22  ! 518: WRPR_GL_I	wrpr	%r11, 0x1d22, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa194a2b3  ! 520: WRPR_GL_I	wrpr	%r18, 0x02b3, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa197f809  ! 522: WRPR_GL_I	wrpr	%r31, 0x1809, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa194ae66  ! 524: WRPR_GL_I	wrpr	%r18, 0x0e66, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa192ac65  ! 526: WRPR_GL_I	wrpr	%r10, 0x0c65, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1952caa  ! 528: WRPR_GL_I	wrpr	%r20, 0x0caa, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa196b1cf  ! 530: WRPR_GL_I	wrpr	%r26, 0x11cf, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1933f92  ! 532: WRPR_GL_I	wrpr	%r12, 0x1f92, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1973539  ! 534: WRPR_GL_I	wrpr	%r28, 0x1539, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa195b57b  ! 536: WRPR_GL_I	wrpr	%r22, 0x157b, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1926bd3  ! 538: WRPR_GL_I	wrpr	%r9, 0x0bd3, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19372e0  ! 540: WRPR_GL_I	wrpr	%r13, 0x12e0, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa195f9e5  ! 542: WRPR_GL_I	wrpr	%r23, 0x19e5, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1963acb  ! 544: WRPR_GL_I	wrpr	%r24, 0x1acb, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa193fd90  ! 546: WRPR_GL_I	wrpr	%r15, 0x1d90, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa196eab3  ! 548: WRPR_GL_I	wrpr	%r27, 0x0ab3, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa196ee72  ! 550: WRPR_GL_I	wrpr	%r27, 0x0e72, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1922a57  ! 552: WRPR_GL_I	wrpr	%r8, 0x0a57, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa197a6f7  ! 554: WRPR_GL_I	wrpr	%r30, 0x06f7, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa195fa95  ! 556: WRPR_GL_I	wrpr	%r23, 0x1a95, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa194e844  ! 558: WRPR_GL_I	wrpr	%r19, 0x0844, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19579ec  ! 560: WRPR_GL_I	wrpr	%r21, 0x19ec, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa195b8ce  ! 562: WRPR_GL_I	wrpr	%r22, 0x18ce, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa195f728  ! 564: WRPR_GL_I	wrpr	%r23, 0x1728, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa197755a  ! 566: WRPR_GL_I	wrpr	%r29, 0x155a, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa196b924  ! 568: WRPR_GL_I	wrpr	%r26, 0x1924, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa194fc8e  ! 570: WRPR_GL_I	wrpr	%r19, 0x1c8e, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1962bb5  ! 572: WRPR_GL_I	wrpr	%r24, 0x0bb5, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa196fef5  ! 574: WRPR_GL_I	wrpr	%r27, 0x1ef5, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa194e342  ! 576: WRPR_GL_I	wrpr	%r19, 0x0342, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa194f582  ! 578: WRPR_GL_I	wrpr	%r19, 0x1582, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1952788  ! 580: WRPR_GL_I	wrpr	%r20, 0x0788, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa195e741  ! 582: WRPR_GL_I	wrpr	%r23, 0x0741, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1956da9  ! 584: WRPR_GL_I	wrpr	%r21, 0x0da9, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa193fcd0  ! 586: WRPR_GL_I	wrpr	%r15, 0x1cd0, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa193f906  ! 588: WRPR_GL_I	wrpr	%r15, 0x1906, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa19437eb  ! 590: WRPR_GL_I	wrpr	%r16, 0x17eb, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1977a67  ! 592: WRPR_GL_I	wrpr	%r29, 0x1a67, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1977057  ! 594: WRPR_GL_I	wrpr	%r29, 0x1057, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19430c7  ! 596: WRPR_GL_I	wrpr	%r16, 0x10c7, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa193b1a1  ! 598: WRPR_GL_I	wrpr	%r14, 0x11a1, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa192fd8b  ! 600: WRPR_GL_I	wrpr	%r11, 0x1d8b, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa192a6a4  ! 602: WRPR_GL_I	wrpr	%r10, 0x06a4, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1966eb5  ! 604: WRPR_GL_I	wrpr	%r25, 0x0eb5, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1962f1f  ! 606: WRPR_GL_I	wrpr	%r24, 0x0f1f, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa19421ef  ! 608: WRPR_GL_I	wrpr	%r16, 0x01ef, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19320e5  ! 610: WRPR_GL_I	wrpr	%r12, 0x00e5, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1946f7c  ! 612: WRPR_GL_I	wrpr	%r17, 0x0f7c, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa193ff6f  ! 614: WRPR_GL_I	wrpr	%r15, 0x1f6f, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1946ede  ! 616: WRPR_GL_I	wrpr	%r17, 0x0ede, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa195fb22  ! 618: WRPR_GL_I	wrpr	%r23, 0x1b22, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa197e40a  ! 620: WRPR_GL_I	wrpr	%r31, 0x040a, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa193236c  ! 622: WRPR_GL_I	wrpr	%r12, 0x036c, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa19530b2  ! 624: WRPR_GL_I	wrpr	%r20, 0x10b2, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa196a9d8  ! 626: WRPR_GL_I	wrpr	%r26, 0x09d8, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa193245d  ! 628: WRPR_GL_I	wrpr	%r12, 0x045d, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1967ef4  ! 630: WRPR_GL_I	wrpr	%r25, 0x1ef4, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa194216a  ! 632: WRPR_GL_I	wrpr	%r16, 0x016a, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1966114  ! 634: WRPR_GL_I	wrpr	%r25, 0x0114, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1942138  ! 636: WRPR_GL_I	wrpr	%r16, 0x0138, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa19530ff  ! 638: WRPR_GL_I	wrpr	%r20, 0x10ff, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1936f09  ! 640: WRPR_GL_I	wrpr	%r13, 0x0f09, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1967f36  ! 642: WRPR_GL_I	wrpr	%r25, 0x1f36, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1977edf  ! 644: WRPR_GL_I	wrpr	%r29, 0x1edf, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa197e521  ! 646: WRPR_GL_I	wrpr	%r31, 0x0521, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa193b220  ! 648: WRPR_GL_I	wrpr	%r14, 0x1220, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19379cf  ! 650: WRPR_GL_I	wrpr	%r13, 0x19cf, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa196ecd3  ! 652: WRPR_GL_I	wrpr	%r27, 0x0cd3, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa195a9f5  ! 654: WRPR_GL_I	wrpr	%r22, 0x09f5, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa194ffa1  ! 656: WRPR_GL_I	wrpr	%r19, 0x1fa1, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa194643d  ! 658: WRPR_GL_I	wrpr	%r17, 0x043d, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa197a67b  ! 660: WRPR_GL_I	wrpr	%r30, 0x067b, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa194a4ab  ! 662: WRPR_GL_I	wrpr	%r18, 0x04ab, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1957a37  ! 664: WRPR_GL_I	wrpr	%r21, 0x1a37, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa193eb39  ! 666: WRPR_GL_I	wrpr	%r15, 0x0b39, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa194f1eb  ! 668: WRPR_GL_I	wrpr	%r19, 0x11eb, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1977adc  ! 670: WRPR_GL_I	wrpr	%r29, 0x1adc, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1922337  ! 672: WRPR_GL_I	wrpr	%r8, 0x0337, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1932f0d  ! 674: WRPR_GL_I	wrpr	%r12, 0x0f0d, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa192bf24  ! 676: WRPR_GL_I	wrpr	%r10, 0x1f24, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1962556  ! 678: WRPR_GL_I	wrpr	%r24, 0x0556, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1957916  ! 680: WRPR_GL_I	wrpr	%r21, 0x1916, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa193ee82  ! 682: WRPR_GL_I	wrpr	%r15, 0x0e82, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa193fee9  ! 684: WRPR_GL_I	wrpr	%r15, 0x1ee9, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1966075  ! 686: WRPR_GL_I	wrpr	%r25, 0x0075, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa195f579  ! 688: WRPR_GL_I	wrpr	%r23, 0x1579, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa192710b  ! 690: WRPR_GL_I	wrpr	%r9, 0x110b, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1947a68  ! 692: WRPR_GL_I	wrpr	%r17, 0x1a68, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa193f630  ! 694: WRPR_GL_I	wrpr	%r15, 0x1630, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa195e319  ! 696: WRPR_GL_I	wrpr	%r23, 0x0319, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1943fe0  ! 698: WRPR_GL_I	wrpr	%r16, 0x1fe0, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1967530  ! 700: WRPR_GL_I	wrpr	%r25, 0x1530, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa192a8dc  ! 702: WRPR_GL_I	wrpr	%r10, 0x08dc, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1967636  ! 704: WRPR_GL_I	wrpr	%r25, 0x1636, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa195aebe  ! 706: WRPR_GL_I	wrpr	%r22, 0x0ebe, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa19329ec  ! 708: WRPR_GL_I	wrpr	%r12, 0x09ec, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa194ada1  ! 710: WRPR_GL_I	wrpr	%r18, 0x0da1, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa196374f  ! 712: WRPR_GL_I	wrpr	%r24, 0x174f, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1956c06  ! 714: WRPR_GL_I	wrpr	%r21, 0x0c06, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1953dc5  ! 716: WRPR_GL_I	wrpr	%r20, 0x1dc5, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1963261  ! 718: WRPR_GL_I	wrpr	%r24, 0x1261, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa193f985  ! 720: WRPR_GL_I	wrpr	%r15, 0x1985, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1972631  ! 722: WRPR_GL_I	wrpr	%r28, 0x0631, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa193ef94  ! 724: WRPR_GL_I	wrpr	%r15, 0x0f94, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa196bc64  ! 726: WRPR_GL_I	wrpr	%r26, 0x1c64, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1922286  ! 728: WRPR_GL_I	wrpr	%r8, 0x0286, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa194baad  ! 730: WRPR_GL_I	wrpr	%r18, 0x1aad, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1956021  ! 732: WRPR_GL_I	wrpr	%r21, 0x0021, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa194654f  ! 734: WRPR_GL_I	wrpr	%r17, 0x054f, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa192287f  ! 736: WRPR_GL_I	wrpr	%r8, 0x087f, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa192eb12  ! 738: WRPR_GL_I	wrpr	%r11, 0x0b12, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1977dfb  ! 740: WRPR_GL_I	wrpr	%r29, 0x1dfb, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1933b8e  ! 742: WRPR_GL_I	wrpr	%r12, 0x1b8e, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa195ed43  ! 744: WRPR_GL_I	wrpr	%r23, 0x0d43, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa197639e  ! 746: WRPR_GL_I	wrpr	%r29, 0x039e, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa192bee1  ! 748: WRPR_GL_I	wrpr	%r10, 0x1ee1, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1962085  ! 750: WRPR_GL_I	wrpr	%r24, 0x0085, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa197f30b  ! 752: WRPR_GL_I	wrpr	%r31, 0x130b, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa193e2f2  ! 754: WRPR_GL_I	wrpr	%r15, 0x02f2, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19668ff  ! 756: WRPR_GL_I	wrpr	%r25, 0x08ff, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa194302c  ! 758: WRPR_GL_I	wrpr	%r16, 0x102c, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa194aaf0  ! 760: WRPR_GL_I	wrpr	%r18, 0x0af0, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa194fa70  ! 762: WRPR_GL_I	wrpr	%r19, 0x1a70, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19475aa  ! 764: WRPR_GL_I	wrpr	%r17, 0x15aa, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa192e5c6  ! 766: WRPR_GL_I	wrpr	%r11, 0x05c6, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa196683a  ! 768: WRPR_GL_I	wrpr	%r25, 0x083a, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa194a559  ! 770: WRPR_GL_I	wrpr	%r18, 0x0559, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa193b888  ! 772: WRPR_GL_I	wrpr	%r14, 0x1888, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1926e64  ! 774: WRPR_GL_I	wrpr	%r9, 0x0e64, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa193f705  ! 776: WRPR_GL_I	wrpr	%r15, 0x1705, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1952fe4  ! 778: WRPR_GL_I	wrpr	%r20, 0x0fe4, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa192bdde  ! 780: WRPR_GL_I	wrpr	%r10, 0x1dde, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1977852  ! 782: WRPR_GL_I	wrpr	%r29, 0x1852, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa192f7e1  ! 784: WRPR_GL_I	wrpr	%r11, 0x17e1, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa197f483  ! 786: WRPR_GL_I	wrpr	%r31, 0x1483, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa195efdf  ! 788: WRPR_GL_I	wrpr	%r23, 0x0fdf, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1957d26  ! 790: WRPR_GL_I	wrpr	%r21, 0x1d26, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1957350  ! 792: WRPR_GL_I	wrpr	%r21, 0x1350, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1942d3a  ! 794: WRPR_GL_I	wrpr	%r16, 0x0d3a, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa197a8f9  ! 796: WRPR_GL_I	wrpr	%r30, 0x08f9, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1927db5  ! 798: WRPR_GL_I	wrpr	%r9, 0x1db5, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa193775d  ! 800: WRPR_GL_I	wrpr	%r13, 0x175d, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1947648  ! 802: WRPR_GL_I	wrpr	%r17, 0x1648, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa197e0a1  ! 804: WRPR_GL_I	wrpr	%r31, 0x00a1, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa197a976  ! 806: WRPR_GL_I	wrpr	%r30, 0x0976, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa195aed2  ! 808: WRPR_GL_I	wrpr	%r22, 0x0ed2, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa195bc22  ! 810: WRPR_GL_I	wrpr	%r22, 0x1c22, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa197fa88  ! 812: WRPR_GL_I	wrpr	%r31, 0x1a88, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1937e26  ! 814: WRPR_GL_I	wrpr	%r13, 0x1e26, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1923079  ! 816: WRPR_GL_I	wrpr	%r8, 0x1079, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa196224a  ! 818: WRPR_GL_I	wrpr	%r24, 0x024a, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa197633f  ! 820: WRPR_GL_I	wrpr	%r29, 0x033f, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1946389  ! 822: WRPR_GL_I	wrpr	%r17, 0x0389, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1976191  ! 824: WRPR_GL_I	wrpr	%r29, 0x0191, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19776ea  ! 826: WRPR_GL_I	wrpr	%r29, 0x16ea, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa196f929  ! 828: WRPR_GL_I	wrpr	%r27, 0x1929, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19326a5  ! 830: WRPR_GL_I	wrpr	%r12, 0x06a5, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa193e35d  ! 832: WRPR_GL_I	wrpr	%r15, 0x035d, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa195751a  ! 834: WRPR_GL_I	wrpr	%r21, 0x151a, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa196b299  ! 836: WRPR_GL_I	wrpr	%r26, 0x1299, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa197e5c5  ! 838: WRPR_GL_I	wrpr	%r31, 0x05c5, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa196f5dc  ! 840: WRPR_GL_I	wrpr	%r27, 0x15dc, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1937204  ! 842: WRPR_GL_I	wrpr	%r13, 0x1204, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1926787  ! 844: WRPR_GL_I	wrpr	%r9, 0x0787, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa194e7ad  ! 846: WRPR_GL_I	wrpr	%r19, 0x07ad, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa192a55b  ! 848: WRPR_GL_I	wrpr	%r10, 0x055b, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1927ead  ! 850: WRPR_GL_I	wrpr	%r9, 0x1ead, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa194f98b  ! 852: WRPR_GL_I	wrpr	%r19, 0x198b, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa197b5f2  ! 854: WRPR_GL_I	wrpr	%r30, 0x15f2, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa195a2e6  ! 856: WRPR_GL_I	wrpr	%r22, 0x02e6, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1953b34  ! 858: WRPR_GL_I	wrpr	%r20, 0x1b34, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa195370b  ! 860: WRPR_GL_I	wrpr	%r20, 0x170b, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1956546  ! 862: WRPR_GL_I	wrpr	%r21, 0x0546, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa197f9f3  ! 864: WRPR_GL_I	wrpr	%r31, 0x19f3, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa195e32c  ! 866: WRPR_GL_I	wrpr	%r23, 0x032c, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19221b3  ! 868: WRPR_GL_I	wrpr	%r8, 0x01b3, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa193e6ed  ! 870: WRPR_GL_I	wrpr	%r15, 0x06ed, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1967152  ! 872: WRPR_GL_I	wrpr	%r25, 0x1152, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa194ef91  ! 874: WRPR_GL_I	wrpr	%r19, 0x0f91, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19336f0  ! 876: WRPR_GL_I	wrpr	%r12, 0x16f0, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa195ba84  ! 878: WRPR_GL_I	wrpr	%r22, 0x1a84, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1946a53  ! 880: WRPR_GL_I	wrpr	%r17, 0x0a53, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa193f5ec  ! 882: WRPR_GL_I	wrpr	%r15, 0x15ec, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa197a429  ! 884: WRPR_GL_I	wrpr	%r30, 0x0429, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa197a77a  ! 886: WRPR_GL_I	wrpr	%r30, 0x077a, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa196f6a4  ! 888: WRPR_GL_I	wrpr	%r27, 0x16a4, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa195f641  ! 890: WRPR_GL_I	wrpr	%r23, 0x1641, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa195a351  ! 892: WRPR_GL_I	wrpr	%r22, 0x0351, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19737e4  ! 894: WRPR_GL_I	wrpr	%r28, 0x17e4, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1966175  ! 896: WRPR_GL_I	wrpr	%r25, 0x0175, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1923898  ! 898: WRPR_GL_I	wrpr	%r8, 0x1898, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa193eb16  ! 900: WRPR_GL_I	wrpr	%r15, 0x0b16, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1972703  ! 902: WRPR_GL_I	wrpr	%r28, 0x0703, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19471ea  ! 904: WRPR_GL_I	wrpr	%r17, 0x11ea, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa197f54f  ! 906: WRPR_GL_I	wrpr	%r31, 0x154f, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa192271a  ! 908: WRPR_GL_I	wrpr	%r8, 0x071a, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa194f0df  ! 910: WRPR_GL_I	wrpr	%r19, 0x10df, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1926299  ! 912: WRPR_GL_I	wrpr	%r9, 0x0299, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1963a94  ! 914: WRPR_GL_I	wrpr	%r24, 0x1a94, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1976b44  ! 916: WRPR_GL_I	wrpr	%r29, 0x0b44, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa193ea57  ! 918: WRPR_GL_I	wrpr	%r15, 0x0a57, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa196b341  ! 920: WRPR_GL_I	wrpr	%r26, 0x1341, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa194a861  ! 922: WRPR_GL_I	wrpr	%r18, 0x0861, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa192a1fb  ! 924: WRPR_GL_I	wrpr	%r10, 0x01fb, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1956bef  ! 926: WRPR_GL_I	wrpr	%r21, 0x0bef, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa192aad6  ! 928: WRPR_GL_I	wrpr	%r10, 0x0ad6, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa196f17b  ! 930: WRPR_GL_I	wrpr	%r27, 0x117b, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa193f4c1  ! 932: WRPR_GL_I	wrpr	%r15, 0x14c1, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1946e46  ! 934: WRPR_GL_I	wrpr	%r17, 0x0e46, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19233df  ! 936: WRPR_GL_I	wrpr	%r8, 0x13df, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1926df8  ! 938: WRPR_GL_I	wrpr	%r9, 0x0df8, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa192b6d0  ! 940: WRPR_GL_I	wrpr	%r10, 0x16d0, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa193f8c7  ! 942: WRPR_GL_I	wrpr	%r15, 0x18c7, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa197ecd5  ! 944: WRPR_GL_I	wrpr	%r31, 0x0cd5, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa192258c  ! 946: WRPR_GL_I	wrpr	%r8, 0x058c, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1946603  ! 948: WRPR_GL_I	wrpr	%r17, 0x0603, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa194b969  ! 950: WRPR_GL_I	wrpr	%r18, 0x1969, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1926516  ! 952: WRPR_GL_I	wrpr	%r9, 0x0516, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1937871  ! 954: WRPR_GL_I	wrpr	%r13, 0x1871, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1936615  ! 956: WRPR_GL_I	wrpr	%r13, 0x0615, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1972f5e  ! 958: WRPR_GL_I	wrpr	%r28, 0x0f5e, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19739cd  ! 960: WRPR_GL_I	wrpr	%r28, 0x19cd, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa192f9ce  ! 962: WRPR_GL_I	wrpr	%r11, 0x19ce, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa196b9c4  ! 964: WRPR_GL_I	wrpr	%r26, 0x19c4, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1966238  ! 966: WRPR_GL_I	wrpr	%r25, 0x0238, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa194ffd5  ! 968: WRPR_GL_I	wrpr	%r19, 0x1fd5, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19334c4  ! 970: WRPR_GL_I	wrpr	%r12, 0x14c4, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa197eb89  ! 972: WRPR_GL_I	wrpr	%r31, 0x0b89, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1976077  ! 974: WRPR_GL_I	wrpr	%r29, 0x0077, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa197ec0d  ! 976: WRPR_GL_I	wrpr	%r31, 0x0c0d, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1966b09  ! 978: WRPR_GL_I	wrpr	%r25, 0x0b09, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa195e05e  ! 980: WRPR_GL_I	wrpr	%r23, 0x005e, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1972025  ! 982: WRPR_GL_I	wrpr	%r28, 0x0025, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1966273  ! 984: WRPR_GL_I	wrpr	%r25, 0x0273, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa195f06f  ! 986: WRPR_GL_I	wrpr	%r23, 0x106f, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1963a5c  ! 988: WRPR_GL_I	wrpr	%r24, 0x1a5c, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa195f323  ! 990: WRPR_GL_I	wrpr	%r23, 0x1323, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa192643b  ! 992: WRPR_GL_I	wrpr	%r9, 0x043b, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa196235e  ! 994: WRPR_GL_I	wrpr	%r24, 0x035e, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa195af11  ! 996: WRPR_GL_I	wrpr	%r22, 0x0f11, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa193a305  ! 998: WRPR_GL_I	wrpr	%r14, 0x0305, %-
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_3:
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa195e3d8  ! 2: WRPR_GL_I	wrpr	%r23, 0x03d8, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa19539d4  ! 4: WRPR_GL_I	wrpr	%r20, 0x19d4, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa197b5bd  ! 6: WRPR_GL_I	wrpr	%r30, 0x15bd, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1962fc5  ! 8: WRPR_GL_I	wrpr	%r24, 0x0fc5, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa194a639  ! 10: WRPR_GL_I	wrpr	%r18, 0x0639, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1966e52  ! 12: WRPR_GL_I	wrpr	%r25, 0x0e52, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa197a021  ! 14: WRPR_GL_I	wrpr	%r30, 0x0021, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa192e3f7  ! 16: WRPR_GL_I	wrpr	%r11, 0x03f7, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19466f2  ! 18: WRPR_GL_I	wrpr	%r17, 0x06f2, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1963b8b  ! 20: WRPR_GL_I	wrpr	%r24, 0x1b8b, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa195b11c  ! 22: WRPR_GL_I	wrpr	%r22, 0x111c, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa196a5ee  ! 24: WRPR_GL_I	wrpr	%r26, 0x05ee, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa194b6e5  ! 26: WRPR_GL_I	wrpr	%r18, 0x16e5, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa194a443  ! 28: WRPR_GL_I	wrpr	%r18, 0x0443, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19423b4  ! 30: WRPR_GL_I	wrpr	%r16, 0x03b4, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa194f333  ! 32: WRPR_GL_I	wrpr	%r19, 0x1333, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1937c91  ! 34: WRPR_GL_I	wrpr	%r13, 0x1c91, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1973d38  ! 36: WRPR_GL_I	wrpr	%r28, 0x1d38, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa194bee2  ! 38: WRPR_GL_I	wrpr	%r18, 0x1ee2, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa196f33f  ! 40: WRPR_GL_I	wrpr	%r27, 0x133f, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa192e9fe  ! 42: WRPR_GL_I	wrpr	%r11, 0x09fe, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa193a560  ! 44: WRPR_GL_I	wrpr	%r14, 0x0560, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19327a6  ! 46: WRPR_GL_I	wrpr	%r12, 0x07a6, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1927b01  ! 48: WRPR_GL_I	wrpr	%r9, 0x1b01, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa196ff98  ! 50: WRPR_GL_I	wrpr	%r27, 0x1f98, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa195ebfc  ! 52: WRPR_GL_I	wrpr	%r23, 0x0bfc, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1927b60  ! 54: WRPR_GL_I	wrpr	%r9, 0x1b60, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1953c4e  ! 56: WRPR_GL_I	wrpr	%r20, 0x1c4e, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1943073  ! 58: WRPR_GL_I	wrpr	%r16, 0x1073, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1927eb2  ! 60: WRPR_GL_I	wrpr	%r9, 0x1eb2, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19321e7  ! 62: WRPR_GL_I	wrpr	%r12, 0x01e7, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1933165  ! 64: WRPR_GL_I	wrpr	%r12, 0x1165, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa197a791  ! 66: WRPR_GL_I	wrpr	%r30, 0x0791, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1976261  ! 68: WRPR_GL_I	wrpr	%r29, 0x0261, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1926cf2  ! 70: WRPR_GL_I	wrpr	%r9, 0x0cf2, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19523a0  ! 72: WRPR_GL_I	wrpr	%r20, 0x03a0, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1976ff1  ! 74: WRPR_GL_I	wrpr	%r29, 0x0ff1, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1956108  ! 76: WRPR_GL_I	wrpr	%r21, 0x0108, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1926b6e  ! 78: WRPR_GL_I	wrpr	%r9, 0x0b6e, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19536b1  ! 80: WRPR_GL_I	wrpr	%r20, 0x16b1, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa195e56c  ! 82: WRPR_GL_I	wrpr	%r23, 0x056c, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1963a3d  ! 84: WRPR_GL_I	wrpr	%r24, 0x1a3d, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1966ece  ! 86: WRPR_GL_I	wrpr	%r25, 0x0ece, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa195a32e  ! 88: WRPR_GL_I	wrpr	%r22, 0x032e, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1952fe5  ! 90: WRPR_GL_I	wrpr	%r20, 0x0fe5, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa193e777  ! 92: WRPR_GL_I	wrpr	%r15, 0x0777, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa19337f2  ! 94: WRPR_GL_I	wrpr	%r12, 0x17f2, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa194b3f0  ! 96: WRPR_GL_I	wrpr	%r18, 0x13f0, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa197a692  ! 98: WRPR_GL_I	wrpr	%r30, 0x0692, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa195f755  ! 100: WRPR_GL_I	wrpr	%r23, 0x1755, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1923479  ! 102: WRPR_GL_I	wrpr	%r8, 0x1479, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa195fdb5  ! 104: WRPR_GL_I	wrpr	%r23, 0x1db5, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa193b181  ! 106: WRPR_GL_I	wrpr	%r14, 0x1181, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa192aa73  ! 108: WRPR_GL_I	wrpr	%r10, 0x0a73, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19475e5  ! 110: WRPR_GL_I	wrpr	%r17, 0x15e5, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa193b633  ! 112: WRPR_GL_I	wrpr	%r14, 0x1633, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1957b17  ! 114: WRPR_GL_I	wrpr	%r21, 0x1b17, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa192f829  ! 116: WRPR_GL_I	wrpr	%r11, 0x1829, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1927368  ! 118: WRPR_GL_I	wrpr	%r9, 0x1368, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa195b288  ! 120: WRPR_GL_I	wrpr	%r22, 0x1288, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa192320f  ! 122: WRPR_GL_I	wrpr	%r8, 0x120f, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa192efb3  ! 124: WRPR_GL_I	wrpr	%r11, 0x0fb3, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa197a94c  ! 126: WRPR_GL_I	wrpr	%r30, 0x094c, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa192a12b  ! 128: WRPR_GL_I	wrpr	%r10, 0x012b, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1962a41  ! 130: WRPR_GL_I	wrpr	%r24, 0x0a41, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa196a297  ! 132: WRPR_GL_I	wrpr	%r26, 0x0297, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1962340  ! 134: WRPR_GL_I	wrpr	%r24, 0x0340, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1966317  ! 136: WRPR_GL_I	wrpr	%r25, 0x0317, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19564ce  ! 138: WRPR_GL_I	wrpr	%r21, 0x04ce, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa197fba7  ! 140: WRPR_GL_I	wrpr	%r31, 0x1ba7, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa195322e  ! 142: WRPR_GL_I	wrpr	%r20, 0x122e, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa197e2ff  ! 144: WRPR_GL_I	wrpr	%r31, 0x02ff, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa194e8c4  ! 146: WRPR_GL_I	wrpr	%r19, 0x08c4, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19430d5  ! 148: WRPR_GL_I	wrpr	%r16, 0x10d5, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa194f815  ! 150: WRPR_GL_I	wrpr	%r19, 0x1815, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1973a47  ! 152: WRPR_GL_I	wrpr	%r28, 0x1a47, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1937bc6  ! 154: WRPR_GL_I	wrpr	%r13, 0x1bc6, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa192b807  ! 156: WRPR_GL_I	wrpr	%r10, 0x1807, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa196e967  ! 158: WRPR_GL_I	wrpr	%r27, 0x0967, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1947de0  ! 160: WRPR_GL_I	wrpr	%r17, 0x1de0, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa194e6d7  ! 162: WRPR_GL_I	wrpr	%r19, 0x06d7, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa192b0f2  ! 164: WRPR_GL_I	wrpr	%r10, 0x10f2, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa193b03b  ! 166: WRPR_GL_I	wrpr	%r14, 0x103b, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19368bf  ! 168: WRPR_GL_I	wrpr	%r13, 0x08bf, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa192b81e  ! 170: WRPR_GL_I	wrpr	%r10, 0x181e, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa192a5e8  ! 172: WRPR_GL_I	wrpr	%r10, 0x05e8, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19328cf  ! 174: WRPR_GL_I	wrpr	%r12, 0x08cf, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa194693a  ! 176: WRPR_GL_I	wrpr	%r17, 0x093a, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa192e8c7  ! 178: WRPR_GL_I	wrpr	%r11, 0x08c7, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa195b550  ! 180: WRPR_GL_I	wrpr	%r22, 0x1550, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1922097  ! 182: WRPR_GL_I	wrpr	%r8, 0x0097, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19422f0  ! 184: WRPR_GL_I	wrpr	%r16, 0x02f0, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa192205c  ! 186: WRPR_GL_I	wrpr	%r8, 0x005c, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1966add  ! 188: WRPR_GL_I	wrpr	%r25, 0x0add, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa192fedf  ! 190: WRPR_GL_I	wrpr	%r11, 0x1edf, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa193ee61  ! 192: WRPR_GL_I	wrpr	%r15, 0x0e61, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa194b480  ! 194: WRPR_GL_I	wrpr	%r18, 0x1480, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa196a8db  ! 196: WRPR_GL_I	wrpr	%r26, 0x08db, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa192bf04  ! 198: WRPR_GL_I	wrpr	%r10, 0x1f04, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1947fd3  ! 200: WRPR_GL_I	wrpr	%r17, 0x1fd3, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1927b6c  ! 202: WRPR_GL_I	wrpr	%r9, 0x1b6c, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa192bbdb  ! 204: WRPR_GL_I	wrpr	%r10, 0x1bdb, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa19330c0  ! 206: WRPR_GL_I	wrpr	%r12, 0x10c0, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa19322d8  ! 208: WRPR_GL_I	wrpr	%r12, 0x02d8, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19420ce  ! 210: WRPR_GL_I	wrpr	%r16, 0x00ce, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1936f09  ! 212: WRPR_GL_I	wrpr	%r13, 0x0f09, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa194fa05  ! 214: WRPR_GL_I	wrpr	%r19, 0x1a05, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1923978  ! 216: WRPR_GL_I	wrpr	%r8, 0x1978, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa194fdb5  ! 218: WRPR_GL_I	wrpr	%r19, 0x1db5, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa195a41b  ! 220: WRPR_GL_I	wrpr	%r22, 0x041b, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa193fa39  ! 222: WRPR_GL_I	wrpr	%r15, 0x1a39, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1947a35  ! 224: WRPR_GL_I	wrpr	%r17, 0x1a35, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1957280  ! 226: WRPR_GL_I	wrpr	%r21, 0x1280, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa197e793  ! 228: WRPR_GL_I	wrpr	%r31, 0x0793, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa19634fe  ! 230: WRPR_GL_I	wrpr	%r24, 0x14fe, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1962752  ! 232: WRPR_GL_I	wrpr	%r24, 0x0752, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1943848  ! 234: WRPR_GL_I	wrpr	%r16, 0x1848, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa197b235  ! 236: WRPR_GL_I	wrpr	%r30, 0x1235, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1952241  ! 238: WRPR_GL_I	wrpr	%r20, 0x0241, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa196f870  ! 240: WRPR_GL_I	wrpr	%r27, 0x1870, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa19261c5  ! 242: WRPR_GL_I	wrpr	%r9, 0x01c5, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1963847  ! 244: WRPR_GL_I	wrpr	%r24, 0x1847, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa197e747  ! 246: WRPR_GL_I	wrpr	%r31, 0x0747, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa197e3f8  ! 248: WRPR_GL_I	wrpr	%r31, 0x03f8, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1927381  ! 250: WRPR_GL_I	wrpr	%r9, 0x1381, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1966a2f  ! 252: WRPR_GL_I	wrpr	%r25, 0x0a2f, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa19666c3  ! 254: WRPR_GL_I	wrpr	%r25, 0x06c3, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19265a7  ! 256: WRPR_GL_I	wrpr	%r9, 0x05a7, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa19674ca  ! 258: WRPR_GL_I	wrpr	%r25, 0x14ca, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa192f237  ! 260: WRPR_GL_I	wrpr	%r11, 0x1237, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa196b00f  ! 262: WRPR_GL_I	wrpr	%r26, 0x100f, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1936146  ! 264: WRPR_GL_I	wrpr	%r13, 0x0146, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1926e0d  ! 266: WRPR_GL_I	wrpr	%r9, 0x0e0d, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa194e77e  ! 268: WRPR_GL_I	wrpr	%r19, 0x077e, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1947f73  ! 270: WRPR_GL_I	wrpr	%r17, 0x1f73, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa197a20c  ! 272: WRPR_GL_I	wrpr	%r30, 0x020c, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa195bf3f  ! 274: WRPR_GL_I	wrpr	%r22, 0x1f3f, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa197f314  ! 276: WRPR_GL_I	wrpr	%r31, 0x1314, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa195a06a  ! 278: WRPR_GL_I	wrpr	%r22, 0x006a, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa197284a  ! 280: WRPR_GL_I	wrpr	%r28, 0x084a, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1942234  ! 282: WRPR_GL_I	wrpr	%r16, 0x0234, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa19579fb  ! 284: WRPR_GL_I	wrpr	%r21, 0x19fb, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa194607a  ! 286: WRPR_GL_I	wrpr	%r17, 0x007a, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1972ce9  ! 288: WRPR_GL_I	wrpr	%r28, 0x0ce9, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa195e4ac  ! 290: WRPR_GL_I	wrpr	%r23, 0x04ac, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa192a028  ! 292: WRPR_GL_I	wrpr	%r10, 0x0028, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa19278eb  ! 294: WRPR_GL_I	wrpr	%r9, 0x18eb, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19574b1  ! 296: WRPR_GL_I	wrpr	%r21, 0x14b1, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1923125  ! 298: WRPR_GL_I	wrpr	%r8, 0x1125, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa197bec8  ! 300: WRPR_GL_I	wrpr	%r30, 0x1ec8, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa194eb34  ! 302: WRPR_GL_I	wrpr	%r19, 0x0b34, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa192a9da  ! 304: WRPR_GL_I	wrpr	%r10, 0x09da, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa197ab24  ! 306: WRPR_GL_I	wrpr	%r30, 0x0b24, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa196bfe6  ! 308: WRPR_GL_I	wrpr	%r26, 0x1fe6, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1947ab4  ! 310: WRPR_GL_I	wrpr	%r17, 0x1ab4, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa194fc6e  ! 312: WRPR_GL_I	wrpr	%r19, 0x1c6e, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1932c1d  ! 314: WRPR_GL_I	wrpr	%r12, 0x0c1d, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa194e7fb  ! 316: WRPR_GL_I	wrpr	%r19, 0x07fb, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa196768e  ! 318: WRPR_GL_I	wrpr	%r25, 0x168e, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa194b25d  ! 320: WRPR_GL_I	wrpr	%r18, 0x125d, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa192ac16  ! 322: WRPR_GL_I	wrpr	%r10, 0x0c16, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1936693  ! 324: WRPR_GL_I	wrpr	%r13, 0x0693, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa195e0f3  ! 326: WRPR_GL_I	wrpr	%r23, 0x00f3, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa196f34c  ! 328: WRPR_GL_I	wrpr	%r27, 0x134c, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1966eeb  ! 330: WRPR_GL_I	wrpr	%r25, 0x0eeb, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa196648e  ! 332: WRPR_GL_I	wrpr	%r25, 0x048e, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa197f192  ! 334: WRPR_GL_I	wrpr	%r31, 0x1192, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa193bb69  ! 336: WRPR_GL_I	wrpr	%r14, 0x1b69, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa195ba27  ! 338: WRPR_GL_I	wrpr	%r22, 0x1a27, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa195f65f  ! 340: WRPR_GL_I	wrpr	%r23, 0x165f, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa196f1d3  ! 342: WRPR_GL_I	wrpr	%r27, 0x11d3, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1962477  ! 344: WRPR_GL_I	wrpr	%r24, 0x0477, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa196f959  ! 346: WRPR_GL_I	wrpr	%r27, 0x1959, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa19677e7  ! 348: WRPR_GL_I	wrpr	%r25, 0x17e7, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa197bcdf  ! 350: WRPR_GL_I	wrpr	%r30, 0x1cdf, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa192b4fd  ! 352: WRPR_GL_I	wrpr	%r10, 0x14fd, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa193ef61  ! 354: WRPR_GL_I	wrpr	%r15, 0x0f61, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1943e29  ! 356: WRPR_GL_I	wrpr	%r16, 0x1e29, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa19635b9  ! 358: WRPR_GL_I	wrpr	%r24, 0x15b9, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1977355  ! 360: WRPR_GL_I	wrpr	%r29, 0x1355, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19225b4  ! 362: WRPR_GL_I	wrpr	%r8, 0x05b4, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa193e458  ! 364: WRPR_GL_I	wrpr	%r15, 0x0458, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa195b156  ! 366: WRPR_GL_I	wrpr	%r22, 0x1156, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1963f4a  ! 368: WRPR_GL_I	wrpr	%r24, 0x1f4a, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa195ed0b  ! 370: WRPR_GL_I	wrpr	%r23, 0x0d0b, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa197e711  ! 372: WRPR_GL_I	wrpr	%r31, 0x0711, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa197b454  ! 374: WRPR_GL_I	wrpr	%r30, 0x1454, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa194f2a3  ! 376: WRPR_GL_I	wrpr	%r19, 0x12a3, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa197a458  ! 378: WRPR_GL_I	wrpr	%r30, 0x0458, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa19236c5  ! 380: WRPR_GL_I	wrpr	%r8, 0x16c5, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa197e324  ! 382: WRPR_GL_I	wrpr	%r31, 0x0324, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa197f1da  ! 384: WRPR_GL_I	wrpr	%r31, 0x11da, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1936024  ! 386: WRPR_GL_I	wrpr	%r13, 0x0024, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1936176  ! 388: WRPR_GL_I	wrpr	%r13, 0x0176, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19328cb  ! 390: WRPR_GL_I	wrpr	%r12, 0x08cb, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa194f643  ! 392: WRPR_GL_I	wrpr	%r19, 0x1643, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa194a24a  ! 394: WRPR_GL_I	wrpr	%r18, 0x024a, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa192a436  ! 396: WRPR_GL_I	wrpr	%r10, 0x0436, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa196f684  ! 398: WRPR_GL_I	wrpr	%r27, 0x1684, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1933338  ! 400: WRPR_GL_I	wrpr	%r12, 0x1338, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1966aad  ! 402: WRPR_GL_I	wrpr	%r25, 0x0aad, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1922c33  ! 404: WRPR_GL_I	wrpr	%r8, 0x0c33, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa192635e  ! 406: WRPR_GL_I	wrpr	%r9, 0x035e, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1936387  ! 408: WRPR_GL_I	wrpr	%r13, 0x0387, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1947830  ! 410: WRPR_GL_I	wrpr	%r17, 0x1830, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa192eaa3  ! 412: WRPR_GL_I	wrpr	%r11, 0x0aa3, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa195b1e4  ! 414: WRPR_GL_I	wrpr	%r22, 0x11e4, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa19269cb  ! 416: WRPR_GL_I	wrpr	%r9, 0x09cb, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa194b113  ! 418: WRPR_GL_I	wrpr	%r18, 0x1113, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1942d40  ! 420: WRPR_GL_I	wrpr	%r16, 0x0d40, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1952ab6  ! 422: WRPR_GL_I	wrpr	%r20, 0x0ab6, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa196a634  ! 424: WRPR_GL_I	wrpr	%r26, 0x0634, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa197ae27  ! 426: WRPR_GL_I	wrpr	%r30, 0x0e27, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1963bf5  ! 428: WRPR_GL_I	wrpr	%r24, 0x1bf5, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19660b6  ! 430: WRPR_GL_I	wrpr	%r25, 0x00b6, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa197a844  ! 432: WRPR_GL_I	wrpr	%r30, 0x0844, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1923e7b  ! 434: WRPR_GL_I	wrpr	%r8, 0x1e7b, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1943870  ! 436: WRPR_GL_I	wrpr	%r16, 0x1870, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa193bdfb  ! 438: WRPR_GL_I	wrpr	%r14, 0x1dfb, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa194a60d  ! 440: WRPR_GL_I	wrpr	%r18, 0x060d, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa193eee2  ! 442: WRPR_GL_I	wrpr	%r15, 0x0ee2, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1952132  ! 444: WRPR_GL_I	wrpr	%r20, 0x0132, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa195e952  ! 446: WRPR_GL_I	wrpr	%r23, 0x0952, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1972848  ! 448: WRPR_GL_I	wrpr	%r28, 0x0848, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa195a3b9  ! 450: WRPR_GL_I	wrpr	%r22, 0x03b9, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1937780  ! 452: WRPR_GL_I	wrpr	%r13, 0x1780, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1942874  ! 454: WRPR_GL_I	wrpr	%r16, 0x0874, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1956a18  ! 456: WRPR_GL_I	wrpr	%r21, 0x0a18, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1977f14  ! 458: WRPR_GL_I	wrpr	%r29, 0x1f14, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19375c1  ! 460: WRPR_GL_I	wrpr	%r13, 0x15c1, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1943eea  ! 462: WRPR_GL_I	wrpr	%r16, 0x1eea, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa197adfc  ! 464: WRPR_GL_I	wrpr	%r30, 0x0dfc, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1952870  ! 466: WRPR_GL_I	wrpr	%r20, 0x0870, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa196fc3c  ! 468: WRPR_GL_I	wrpr	%r27, 0x1c3c, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1933f92  ! 470: WRPR_GL_I	wrpr	%r12, 0x1f92, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1923f08  ! 472: WRPR_GL_I	wrpr	%r8, 0x1f08, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa197b494  ! 474: WRPR_GL_I	wrpr	%r30, 0x1494, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1932282  ! 476: WRPR_GL_I	wrpr	%r12, 0x0282, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa195e3f7  ! 478: WRPR_GL_I	wrpr	%r23, 0x03f7, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa194a7ce  ! 480: WRPR_GL_I	wrpr	%r18, 0x07ce, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa192f42a  ! 482: WRPR_GL_I	wrpr	%r11, 0x142a, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa196752a  ! 484: WRPR_GL_I	wrpr	%r25, 0x152a, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa192ed8c  ! 486: WRPR_GL_I	wrpr	%r11, 0x0d8c, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa194fd79  ! 488: WRPR_GL_I	wrpr	%r19, 0x1d79, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa193f586  ! 490: WRPR_GL_I	wrpr	%r15, 0x1586, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1932286  ! 492: WRPR_GL_I	wrpr	%r12, 0x0286, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa19660f8  ! 494: WRPR_GL_I	wrpr	%r25, 0x00f8, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa196aee4  ! 496: WRPR_GL_I	wrpr	%r26, 0x0ee4, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa194be54  ! 498: WRPR_GL_I	wrpr	%r18, 0x1e54, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa192bd99  ! 500: WRPR_GL_I	wrpr	%r10, 0x1d99, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1937c7a  ! 502: WRPR_GL_I	wrpr	%r13, 0x1c7a, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa195fc6b  ! 504: WRPR_GL_I	wrpr	%r23, 0x1c6b, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa195ea4f  ! 506: WRPR_GL_I	wrpr	%r23, 0x0a4f, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa19420f6  ! 508: WRPR_GL_I	wrpr	%r16, 0x00f6, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa194f957  ! 510: WRPR_GL_I	wrpr	%r19, 0x1957, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1936084  ! 512: WRPR_GL_I	wrpr	%r13, 0x0084, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1947a04  ! 514: WRPR_GL_I	wrpr	%r17, 0x1a04, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1943f4e  ! 516: WRPR_GL_I	wrpr	%r16, 0x1f4e, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa196375e  ! 518: WRPR_GL_I	wrpr	%r24, 0x175e, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa194786a  ! 520: WRPR_GL_I	wrpr	%r17, 0x186a, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1967e00  ! 522: WRPR_GL_I	wrpr	%r25, 0x1e00, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa195a994  ! 524: WRPR_GL_I	wrpr	%r22, 0x0994, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1963f54  ! 526: WRPR_GL_I	wrpr	%r24, 0x1f54, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa195e1e5  ! 528: WRPR_GL_I	wrpr	%r23, 0x01e5, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa195e52a  ! 530: WRPR_GL_I	wrpr	%r23, 0x052a, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1932702  ! 532: WRPR_GL_I	wrpr	%r12, 0x0702, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1952728  ! 534: WRPR_GL_I	wrpr	%r20, 0x0728, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa196f9c7  ! 536: WRPR_GL_I	wrpr	%r27, 0x19c7, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa194e68d  ! 538: WRPR_GL_I	wrpr	%r19, 0x068d, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19368f4  ! 540: WRPR_GL_I	wrpr	%r13, 0x08f4, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa196bff6  ! 542: WRPR_GL_I	wrpr	%r26, 0x1ff6, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa194aa2f  ! 544: WRPR_GL_I	wrpr	%r18, 0x0a2f, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1923bc8  ! 546: WRPR_GL_I	wrpr	%r8, 0x1bc8, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa192ac5c  ! 548: WRPR_GL_I	wrpr	%r10, 0x0c5c, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1973cb4  ! 550: WRPR_GL_I	wrpr	%r28, 0x1cb4, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa196e0d0  ! 552: WRPR_GL_I	wrpr	%r27, 0x00d0, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa19739a4  ! 554: WRPR_GL_I	wrpr	%r28, 0x19a4, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa192ee38  ! 556: WRPR_GL_I	wrpr	%r11, 0x0e38, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1973ab8  ! 558: WRPR_GL_I	wrpr	%r28, 0x1ab8, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa193a6ab  ! 560: WRPR_GL_I	wrpr	%r14, 0x06ab, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa19776ee  ! 562: WRPR_GL_I	wrpr	%r29, 0x16ee, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1946d2d  ! 564: WRPR_GL_I	wrpr	%r17, 0x0d2d, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa19573df  ! 566: WRPR_GL_I	wrpr	%r21, 0x13df, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1933263  ! 568: WRPR_GL_I	wrpr	%r12, 0x1263, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa197a875  ! 570: WRPR_GL_I	wrpr	%r30, 0x0875, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1956415  ! 572: WRPR_GL_I	wrpr	%r21, 0x0415, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa195213a  ! 574: WRPR_GL_I	wrpr	%r20, 0x013a, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1927ea9  ! 576: WRPR_GL_I	wrpr	%r9, 0x1ea9, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1952b92  ! 578: WRPR_GL_I	wrpr	%r20, 0x0b92, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa196ebc9  ! 580: WRPR_GL_I	wrpr	%r27, 0x0bc9, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa192ea4e  ! 582: WRPR_GL_I	wrpr	%r11, 0x0a4e, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa197ed98  ! 584: WRPR_GL_I	wrpr	%r31, 0x0d98, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa196a697  ! 586: WRPR_GL_I	wrpr	%r26, 0x0697, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa193f30b  ! 588: WRPR_GL_I	wrpr	%r15, 0x130b, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1932de9  ! 590: WRPR_GL_I	wrpr	%r12, 0x0de9, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa19635df  ! 592: WRPR_GL_I	wrpr	%r24, 0x15df, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa192f803  ! 594: WRPR_GL_I	wrpr	%r11, 0x1803, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa194f84c  ! 596: WRPR_GL_I	wrpr	%r19, 0x184c, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa192b74a  ! 598: WRPR_GL_I	wrpr	%r10, 0x174a, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa195a57b  ! 600: WRPR_GL_I	wrpr	%r22, 0x057b, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa193bd99  ! 602: WRPR_GL_I	wrpr	%r14, 0x1d99, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa196a17a  ! 604: WRPR_GL_I	wrpr	%r26, 0x017a, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa197255f  ! 606: WRPR_GL_I	wrpr	%r28, 0x055f, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa19374fe  ! 608: WRPR_GL_I	wrpr	%r13, 0x14fe, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1977405  ! 610: WRPR_GL_I	wrpr	%r29, 0x1405, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa195fda2  ! 612: WRPR_GL_I	wrpr	%r23, 0x1da2, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19733b8  ! 614: WRPR_GL_I	wrpr	%r28, 0x13b8, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19472e0  ! 616: WRPR_GL_I	wrpr	%r17, 0x12e0, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1962bb1  ! 618: WRPR_GL_I	wrpr	%r24, 0x0bb1, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa192f770  ! 620: WRPR_GL_I	wrpr	%r11, 0x1770, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa193a5da  ! 622: WRPR_GL_I	wrpr	%r14, 0x05da, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa194e881  ! 624: WRPR_GL_I	wrpr	%r19, 0x0881, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa196b9c5  ! 626: WRPR_GL_I	wrpr	%r26, 0x19c5, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa194a18f  ! 628: WRPR_GL_I	wrpr	%r18, 0x018f, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1977509  ! 630: WRPR_GL_I	wrpr	%r29, 0x1509, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa195f994  ! 632: WRPR_GL_I	wrpr	%r23, 0x1994, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa196b7d4  ! 634: WRPR_GL_I	wrpr	%r26, 0x17d4, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1956f0b  ! 636: WRPR_GL_I	wrpr	%r21, 0x0f0b, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa196f691  ! 638: WRPR_GL_I	wrpr	%r27, 0x1691, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1946bc4  ! 640: WRPR_GL_I	wrpr	%r17, 0x0bc4, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa194e4f7  ! 642: WRPR_GL_I	wrpr	%r19, 0x04f7, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19324c4  ! 644: WRPR_GL_I	wrpr	%r12, 0x04c4, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa193ae0c  ! 646: WRPR_GL_I	wrpr	%r14, 0x0e0c, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa197239f  ! 648: WRPR_GL_I	wrpr	%r28, 0x039f, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa193e6b5  ! 650: WRPR_GL_I	wrpr	%r15, 0x06b5, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa196e88b  ! 652: WRPR_GL_I	wrpr	%r27, 0x088b, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa19564fc  ! 654: WRPR_GL_I	wrpr	%r21, 0x04fc, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1922417  ! 656: WRPR_GL_I	wrpr	%r8, 0x0417, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1953026  ! 658: WRPR_GL_I	wrpr	%r20, 0x1026, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa194610d  ! 660: WRPR_GL_I	wrpr	%r17, 0x010d, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1937fea  ! 662: WRPR_GL_I	wrpr	%r13, 0x1fea, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa195701a  ! 664: WRPR_GL_I	wrpr	%r21, 0x101a, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19563b8  ! 666: WRPR_GL_I	wrpr	%r21, 0x03b8, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1942734  ! 668: WRPR_GL_I	wrpr	%r16, 0x0734, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1957980  ! 670: WRPR_GL_I	wrpr	%r21, 0x1980, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1973401  ! 672: WRPR_GL_I	wrpr	%r28, 0x1401, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1943203  ! 674: WRPR_GL_I	wrpr	%r16, 0x1203, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa194e291  ! 676: WRPR_GL_I	wrpr	%r19, 0x0291, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1923399  ! 678: WRPR_GL_I	wrpr	%r8, 0x1399, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1922f86  ! 680: WRPR_GL_I	wrpr	%r8, 0x0f86, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa196f71d  ! 682: WRPR_GL_I	wrpr	%r27, 0x171d, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19473d6  ! 684: WRPR_GL_I	wrpr	%r17, 0x13d6, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa197ef77  ! 686: WRPR_GL_I	wrpr	%r31, 0x0f77, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa194f947  ! 688: WRPR_GL_I	wrpr	%r19, 0x1947, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1937ccd  ! 690: WRPR_GL_I	wrpr	%r13, 0x1ccd, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa195eb79  ! 692: WRPR_GL_I	wrpr	%r23, 0x0b79, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa197a843  ! 694: WRPR_GL_I	wrpr	%r30, 0x0843, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa192bcce  ! 696: WRPR_GL_I	wrpr	%r10, 0x1cce, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1963c1d  ! 698: WRPR_GL_I	wrpr	%r24, 0x1c1d, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1923a63  ! 700: WRPR_GL_I	wrpr	%r8, 0x1a63, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa192f549  ! 702: WRPR_GL_I	wrpr	%r11, 0x1549, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa197f094  ! 704: WRPR_GL_I	wrpr	%r31, 0x1094, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa193f249  ! 706: WRPR_GL_I	wrpr	%r15, 0x1249, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1976b79  ! 708: WRPR_GL_I	wrpr	%r29, 0x0b79, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa192b090  ! 710: WRPR_GL_I	wrpr	%r10, 0x1090, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa196aaa3  ! 712: WRPR_GL_I	wrpr	%r26, 0x0aa3, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa192e790  ! 714: WRPR_GL_I	wrpr	%r11, 0x0790, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa192ee40  ! 716: WRPR_GL_I	wrpr	%r11, 0x0e40, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1926ee9  ! 718: WRPR_GL_I	wrpr	%r9, 0x0ee9, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa195ac94  ! 720: WRPR_GL_I	wrpr	%r22, 0x0c94, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa192200a  ! 722: WRPR_GL_I	wrpr	%r8, 0x000a, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19625f9  ! 724: WRPR_GL_I	wrpr	%r24, 0x05f9, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa193eacb  ! 726: WRPR_GL_I	wrpr	%r15, 0x0acb, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa197bb6e  ! 728: WRPR_GL_I	wrpr	%r30, 0x1b6e, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa192b8ea  ! 730: WRPR_GL_I	wrpr	%r10, 0x18ea, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1937108  ! 732: WRPR_GL_I	wrpr	%r13, 0x1108, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1967302  ! 734: WRPR_GL_I	wrpr	%r25, 0x1302, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa197f575  ! 736: WRPR_GL_I	wrpr	%r31, 0x1575, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1957d3e  ! 738: WRPR_GL_I	wrpr	%r21, 0x1d3e, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1967075  ! 740: WRPR_GL_I	wrpr	%r25, 0x1075, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa192b083  ! 742: WRPR_GL_I	wrpr	%r10, 0x1083, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1957bb0  ! 744: WRPR_GL_I	wrpr	%r21, 0x1bb0, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa19569dd  ! 746: WRPR_GL_I	wrpr	%r21, 0x09dd, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa192fb39  ! 748: WRPR_GL_I	wrpr	%r11, 0x1b39, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa193f719  ! 750: WRPR_GL_I	wrpr	%r15, 0x1719, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1953525  ! 752: WRPR_GL_I	wrpr	%r20, 0x1525, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa192bedc  ! 754: WRPR_GL_I	wrpr	%r10, 0x1edc, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa196bc46  ! 756: WRPR_GL_I	wrpr	%r26, 0x1c46, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa194bc9f  ! 758: WRPR_GL_I	wrpr	%r18, 0x1c9f, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa193bef7  ! 760: WRPR_GL_I	wrpr	%r14, 0x1ef7, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa194ff1b  ! 762: WRPR_GL_I	wrpr	%r19, 0x1f1b, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa195ac7a  ! 764: WRPR_GL_I	wrpr	%r22, 0x0c7a, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1923d48  ! 766: WRPR_GL_I	wrpr	%r8, 0x1d48, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa193e51f  ! 768: WRPR_GL_I	wrpr	%r15, 0x051f, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1952e9d  ! 770: WRPR_GL_I	wrpr	%r20, 0x0e9d, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19525fe  ! 772: WRPR_GL_I	wrpr	%r20, 0x05fe, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1922e48  ! 774: WRPR_GL_I	wrpr	%r8, 0x0e48, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa195ba7f  ! 776: WRPR_GL_I	wrpr	%r22, 0x1a7f, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa197e2c6  ! 778: WRPR_GL_I	wrpr	%r31, 0x02c6, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1926939  ! 780: WRPR_GL_I	wrpr	%r9, 0x0939, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa192ab9b  ! 782: WRPR_GL_I	wrpr	%r10, 0x0b9b, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa196a1f4  ! 784: WRPR_GL_I	wrpr	%r26, 0x01f4, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1937df9  ! 786: WRPR_GL_I	wrpr	%r13, 0x1df9, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa194af39  ! 788: WRPR_GL_I	wrpr	%r18, 0x0f39, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa19226a5  ! 790: WRPR_GL_I	wrpr	%r8, 0x06a5, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa197b207  ! 792: WRPR_GL_I	wrpr	%r30, 0x1207, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa195bba9  ! 794: WRPR_GL_I	wrpr	%r22, 0x1ba9, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa194a682  ! 796: WRPR_GL_I	wrpr	%r18, 0x0682, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa197e3db  ! 798: WRPR_GL_I	wrpr	%r31, 0x03db, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa193797c  ! 800: WRPR_GL_I	wrpr	%r13, 0x197c, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa197f5ee  ! 802: WRPR_GL_I	wrpr	%r31, 0x15ee, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa195b74f  ! 804: WRPR_GL_I	wrpr	%r22, 0x174f, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa194ac4f  ! 806: WRPR_GL_I	wrpr	%r18, 0x0c4f, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa195b95a  ! 808: WRPR_GL_I	wrpr	%r22, 0x195a, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa194a891  ! 810: WRPR_GL_I	wrpr	%r18, 0x0891, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa197b87b  ! 812: WRPR_GL_I	wrpr	%r30, 0x187b, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa195f94f  ! 814: WRPR_GL_I	wrpr	%r23, 0x194f, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19527b4  ! 816: WRPR_GL_I	wrpr	%r20, 0x07b4, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1967021  ! 818: WRPR_GL_I	wrpr	%r25, 0x1021, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa194f207  ! 820: WRPR_GL_I	wrpr	%r19, 0x1207, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1926ba2  ! 822: WRPR_GL_I	wrpr	%r9, 0x0ba2, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1922abc  ! 824: WRPR_GL_I	wrpr	%r8, 0x0abc, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa195fe29  ! 826: WRPR_GL_I	wrpr	%r23, 0x1e29, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19669ed  ! 828: WRPR_GL_I	wrpr	%r25, 0x09ed, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa195abd3  ! 830: WRPR_GL_I	wrpr	%r22, 0x0bd3, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1972e58  ! 832: WRPR_GL_I	wrpr	%r28, 0x0e58, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa197297a  ! 834: WRPR_GL_I	wrpr	%r28, 0x097a, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa194e2f3  ! 836: WRPR_GL_I	wrpr	%r19, 0x02f3, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1946701  ! 838: WRPR_GL_I	wrpr	%r17, 0x0701, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa194f7f5  ! 840: WRPR_GL_I	wrpr	%r19, 0x17f5, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1943f0a  ! 842: WRPR_GL_I	wrpr	%r16, 0x1f0a, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa196e63f  ! 844: WRPR_GL_I	wrpr	%r27, 0x063f, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa194637f  ! 846: WRPR_GL_I	wrpr	%r17, 0x037f, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa196645a  ! 848: WRPR_GL_I	wrpr	%r25, 0x045a, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1947cf4  ! 850: WRPR_GL_I	wrpr	%r17, 0x1cf4, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1962738  ! 852: WRPR_GL_I	wrpr	%r24, 0x0738, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa192e3bd  ! 854: WRPR_GL_I	wrpr	%r11, 0x03bd, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa193b586  ! 856: WRPR_GL_I	wrpr	%r14, 0x1586, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa192a9f2  ! 858: WRPR_GL_I	wrpr	%r10, 0x09f2, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1952688  ! 860: WRPR_GL_I	wrpr	%r20, 0x0688, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa192ecfa  ! 862: WRPR_GL_I	wrpr	%r11, 0x0cfa, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19461d7  ! 864: WRPR_GL_I	wrpr	%r17, 0x01d7, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa197a678  ! 866: WRPR_GL_I	wrpr	%r30, 0x0678, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa195f555  ! 868: WRPR_GL_I	wrpr	%r23, 0x1555, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1952065  ! 870: WRPR_GL_I	wrpr	%r20, 0x0065, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa194f29a  ! 872: WRPR_GL_I	wrpr	%r19, 0x129a, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa194bc8d  ! 874: WRPR_GL_I	wrpr	%r18, 0x1c8d, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1933b51  ! 876: WRPR_GL_I	wrpr	%r12, 0x1b51, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa194fd27  ! 878: WRPR_GL_I	wrpr	%r19, 0x1d27, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa193e107  ! 880: WRPR_GL_I	wrpr	%r15, 0x0107, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1937938  ! 882: WRPR_GL_I	wrpr	%r13, 0x1938, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1966951  ! 884: WRPR_GL_I	wrpr	%r25, 0x0951, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa194e381  ! 886: WRPR_GL_I	wrpr	%r19, 0x0381, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa192a2c7  ! 888: WRPR_GL_I	wrpr	%r10, 0x02c7, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa192b578  ! 890: WRPR_GL_I	wrpr	%r10, 0x1578, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1977e15  ! 892: WRPR_GL_I	wrpr	%r29, 0x1e15, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19662ec  ! 894: WRPR_GL_I	wrpr	%r25, 0x02ec, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19230f6  ! 896: WRPR_GL_I	wrpr	%r8, 0x10f6, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19369e3  ! 898: WRPR_GL_I	wrpr	%r13, 0x09e3, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa196e2ed  ! 900: WRPR_GL_I	wrpr	%r27, 0x02ed, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1937e6c  ! 902: WRPR_GL_I	wrpr	%r13, 0x1e6c, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa197b54e  ! 904: WRPR_GL_I	wrpr	%r30, 0x154e, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa194a096  ! 906: WRPR_GL_I	wrpr	%r18, 0x0096, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1927b6c  ! 908: WRPR_GL_I	wrpr	%r9, 0x1b6c, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa195b1c8  ! 910: WRPR_GL_I	wrpr	%r22, 0x11c8, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa193b405  ! 912: WRPR_GL_I	wrpr	%r14, 0x1405, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa194a6cd  ! 914: WRPR_GL_I	wrpr	%r18, 0x06cd, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1952e92  ! 916: WRPR_GL_I	wrpr	%r20, 0x0e92, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa193225c  ! 918: WRPR_GL_I	wrpr	%r12, 0x025c, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa194e5a2  ! 920: WRPR_GL_I	wrpr	%r19, 0x05a2, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1977f36  ! 922: WRPR_GL_I	wrpr	%r29, 0x1f36, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa196b9ea  ! 924: WRPR_GL_I	wrpr	%r26, 0x19ea, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa193ac7b  ! 926: WRPR_GL_I	wrpr	%r14, 0x0c7b, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19630e2  ! 928: WRPR_GL_I	wrpr	%r24, 0x10e2, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1957957  ! 930: WRPR_GL_I	wrpr	%r21, 0x1957, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa195acb2  ! 932: WRPR_GL_I	wrpr	%r22, 0x0cb2, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1942cb5  ! 934: WRPR_GL_I	wrpr	%r16, 0x0cb5, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa196fd16  ! 936: WRPR_GL_I	wrpr	%r27, 0x1d16, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1942aa0  ! 938: WRPR_GL_I	wrpr	%r16, 0x0aa0, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa196a98c  ! 940: WRPR_GL_I	wrpr	%r26, 0x098c, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1932ce1  ! 942: WRPR_GL_I	wrpr	%r12, 0x0ce1, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1933036  ! 944: WRPR_GL_I	wrpr	%r12, 0x1036, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa192fa58  ! 946: WRPR_GL_I	wrpr	%r11, 0x1a58, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1942f2a  ! 948: WRPR_GL_I	wrpr	%r16, 0x0f2a, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa193e671  ! 950: WRPR_GL_I	wrpr	%r15, 0x0671, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa196755c  ! 952: WRPR_GL_I	wrpr	%r25, 0x155c, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa192b236  ! 954: WRPR_GL_I	wrpr	%r10, 0x1236, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa197e195  ! 956: WRPR_GL_I	wrpr	%r31, 0x0195, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19761b2  ! 958: WRPR_GL_I	wrpr	%r29, 0x01b2, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa194bc41  ! 960: WRPR_GL_I	wrpr	%r18, 0x1c41, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19671a3  ! 962: WRPR_GL_I	wrpr	%r25, 0x11a3, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19628a7  ! 964: WRPR_GL_I	wrpr	%r24, 0x08a7, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1946222  ! 966: WRPR_GL_I	wrpr	%r17, 0x0222, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa192341e  ! 968: WRPR_GL_I	wrpr	%r8, 0x141e, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa193a145  ! 970: WRPR_GL_I	wrpr	%r14, 0x0145, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa197e3e8  ! 972: WRPR_GL_I	wrpr	%r31, 0x03e8, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa193b745  ! 974: WRPR_GL_I	wrpr	%r14, 0x1745, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1923f0b  ! 976: WRPR_GL_I	wrpr	%r8, 0x1f0b, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa193239c  ! 978: WRPR_GL_I	wrpr	%r12, 0x039c, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa194617d  ! 980: WRPR_GL_I	wrpr	%r17, 0x017d, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa194eb21  ! 982: WRPR_GL_I	wrpr	%r19, 0x0b21, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1963385  ! 984: WRPR_GL_I	wrpr	%r24, 0x1385, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa195ae49  ! 986: WRPR_GL_I	wrpr	%r22, 0x0e49, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1943a19  ! 988: WRPR_GL_I	wrpr	%r16, 0x1a19, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa193ee3b  ! 990: WRPR_GL_I	wrpr	%r15, 0x0e3b, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1972b6c  ! 992: WRPR_GL_I	wrpr	%r28, 0x0b6c, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1926218  ! 994: WRPR_GL_I	wrpr	%r9, 0x0218, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa196a1d9  ! 996: WRPR_GL_I	wrpr	%r26, 0x01d9, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa19425e0  ! 998: WRPR_GL_I	wrpr	%r16, 0x05e0, %-
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_2:
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa194fac8  ! 2: WRPR_GL_I	wrpr	%r19, 0x1ac8, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1967b62  ! 4: WRPR_GL_I	wrpr	%r25, 0x1b62, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1926840  ! 6: WRPR_GL_I	wrpr	%r9, 0x0840, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa197e879  ! 8: WRPR_GL_I	wrpr	%r31, 0x0879, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19726e9  ! 10: WRPR_GL_I	wrpr	%r28, 0x06e9, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1952935  ! 12: WRPR_GL_I	wrpr	%r20, 0x0935, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa196625c  ! 14: WRPR_GL_I	wrpr	%r25, 0x025c, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1972699  ! 16: WRPR_GL_I	wrpr	%r28, 0x0699, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19231e4  ! 18: WRPR_GL_I	wrpr	%r8, 0x11e4, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa195f96f  ! 20: WRPR_GL_I	wrpr	%r23, 0x196f, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa193b201  ! 22: WRPR_GL_I	wrpr	%r14, 0x1201, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1923ebe  ! 24: WRPR_GL_I	wrpr	%r8, 0x1ebe, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa194a3db  ! 26: WRPR_GL_I	wrpr	%r18, 0x03db, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa197b695  ! 28: WRPR_GL_I	wrpr	%r30, 0x1695, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa192f7d9  ! 30: WRPR_GL_I	wrpr	%r11, 0x17d9, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1963792  ! 32: WRPR_GL_I	wrpr	%r24, 0x1792, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa194b40d  ! 34: WRPR_GL_I	wrpr	%r18, 0x140d, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1933f66  ! 36: WRPR_GL_I	wrpr	%r12, 0x1f66, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19670a5  ! 38: WRPR_GL_I	wrpr	%r25, 0x10a5, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa197e280  ! 40: WRPR_GL_I	wrpr	%r31, 0x0280, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa195fb76  ! 42: WRPR_GL_I	wrpr	%r23, 0x1b76, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa197f8b4  ! 44: WRPR_GL_I	wrpr	%r31, 0x18b4, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa195a7f1  ! 46: WRPR_GL_I	wrpr	%r22, 0x07f1, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa19725fe  ! 48: WRPR_GL_I	wrpr	%r28, 0x05fe, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1946742  ! 50: WRPR_GL_I	wrpr	%r17, 0x0742, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa193ed41  ! 52: WRPR_GL_I	wrpr	%r15, 0x0d41, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa197a72a  ! 54: WRPR_GL_I	wrpr	%r30, 0x072a, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa192fe5a  ! 56: WRPR_GL_I	wrpr	%r11, 0x1e5a, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa195a5ee  ! 58: WRPR_GL_I	wrpr	%r22, 0x05ee, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19561e0  ! 60: WRPR_GL_I	wrpr	%r21, 0x01e0, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1952967  ! 62: WRPR_GL_I	wrpr	%r20, 0x0967, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1957026  ! 64: WRPR_GL_I	wrpr	%r21, 0x1026, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa192b8b9  ! 66: WRPR_GL_I	wrpr	%r10, 0x18b9, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1957642  ! 68: WRPR_GL_I	wrpr	%r21, 0x1642, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa196325e  ! 70: WRPR_GL_I	wrpr	%r24, 0x125e, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1963861  ! 72: WRPR_GL_I	wrpr	%r24, 0x1861, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1937c9a  ! 74: WRPR_GL_I	wrpr	%r13, 0x1c9a, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa196f244  ! 76: WRPR_GL_I	wrpr	%r27, 0x1244, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa197fc82  ! 78: WRPR_GL_I	wrpr	%r31, 0x1c82, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1953cc8  ! 80: WRPR_GL_I	wrpr	%r20, 0x1cc8, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa193e227  ! 82: WRPR_GL_I	wrpr	%r15, 0x0227, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1953a00  ! 84: WRPR_GL_I	wrpr	%r20, 0x1a00, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa193f614  ! 86: WRPR_GL_I	wrpr	%r15, 0x1614, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1927005  ! 88: WRPR_GL_I	wrpr	%r9, 0x1005, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa192353c  ! 90: WRPR_GL_I	wrpr	%r8, 0x153c, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1963398  ! 92: WRPR_GL_I	wrpr	%r24, 0x1398, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1947f3c  ! 94: WRPR_GL_I	wrpr	%r17, 0x1f3c, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1972b15  ! 96: WRPR_GL_I	wrpr	%r28, 0x0b15, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa19334f6  ! 98: WRPR_GL_I	wrpr	%r12, 0x14f6, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa196724b  ! 100: WRPR_GL_I	wrpr	%r25, 0x124b, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1976f54  ! 102: WRPR_GL_I	wrpr	%r29, 0x0f54, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1957c62  ! 104: WRPR_GL_I	wrpr	%r21, 0x1c62, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1972cab  ! 106: WRPR_GL_I	wrpr	%r28, 0x0cab, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1932ef0  ! 108: WRPR_GL_I	wrpr	%r12, 0x0ef0, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa193f9ec  ! 110: WRPR_GL_I	wrpr	%r15, 0x19ec, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1947fc6  ! 112: WRPR_GL_I	wrpr	%r17, 0x1fc6, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1966278  ! 114: WRPR_GL_I	wrpr	%r25, 0x0278, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1977f2a  ! 116: WRPR_GL_I	wrpr	%r29, 0x1f2a, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa194ea3c  ! 118: WRPR_GL_I	wrpr	%r19, 0x0a3c, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1977ac6  ! 120: WRPR_GL_I	wrpr	%r29, 0x1ac6, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1977020  ! 122: WRPR_GL_I	wrpr	%r29, 0x1020, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1956c7e  ! 124: WRPR_GL_I	wrpr	%r21, 0x0c7e, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa196a401  ! 126: WRPR_GL_I	wrpr	%r26, 0x0401, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1952a87  ! 128: WRPR_GL_I	wrpr	%r20, 0x0a87, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1933cd1  ! 130: WRPR_GL_I	wrpr	%r12, 0x1cd1, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa197a42e  ! 132: WRPR_GL_I	wrpr	%r30, 0x042e, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa194af08  ! 134: WRPR_GL_I	wrpr	%r18, 0x0f08, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1966801  ! 136: WRPR_GL_I	wrpr	%r25, 0x0801, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa196a509  ! 138: WRPR_GL_I	wrpr	%r26, 0x0509, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa196387c  ! 140: WRPR_GL_I	wrpr	%r24, 0x187c, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa194bfaa  ! 142: WRPR_GL_I	wrpr	%r18, 0x1faa, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa19638a2  ! 144: WRPR_GL_I	wrpr	%r24, 0x18a2, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1937dc1  ! 146: WRPR_GL_I	wrpr	%r13, 0x1dc1, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa195ff0d  ! 148: WRPR_GL_I	wrpr	%r23, 0x1f0d, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa193e6db  ! 150: WRPR_GL_I	wrpr	%r15, 0x06db, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1932c0c  ! 152: WRPR_GL_I	wrpr	%r12, 0x0c0c, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa197ad33  ! 154: WRPR_GL_I	wrpr	%r30, 0x0d33, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa193b51a  ! 156: WRPR_GL_I	wrpr	%r14, 0x151a, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19627ae  ! 158: WRPR_GL_I	wrpr	%r24, 0x07ae, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19477b5  ! 160: WRPR_GL_I	wrpr	%r17, 0x17b5, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1957c0f  ! 162: WRPR_GL_I	wrpr	%r21, 0x1c0f, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa196b6b7  ! 164: WRPR_GL_I	wrpr	%r26, 0x16b7, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1947881  ! 166: WRPR_GL_I	wrpr	%r17, 0x1881, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa192fe53  ! 168: WRPR_GL_I	wrpr	%r11, 0x1e53, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa196f645  ! 170: WRPR_GL_I	wrpr	%r27, 0x1645, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa197a27e  ! 172: WRPR_GL_I	wrpr	%r30, 0x027e, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa196b5f5  ! 174: WRPR_GL_I	wrpr	%r26, 0x15f5, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1946863  ! 176: WRPR_GL_I	wrpr	%r17, 0x0863, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1952f79  ! 178: WRPR_GL_I	wrpr	%r20, 0x0f79, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1952cbb  ! 180: WRPR_GL_I	wrpr	%r20, 0x0cbb, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1927014  ! 182: WRPR_GL_I	wrpr	%r9, 0x1014, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa195b636  ! 184: WRPR_GL_I	wrpr	%r22, 0x1636, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1926ee3  ! 186: WRPR_GL_I	wrpr	%r9, 0x0ee3, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa193b88c  ! 188: WRPR_GL_I	wrpr	%r14, 0x188c, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1952add  ! 190: WRPR_GL_I	wrpr	%r20, 0x0add, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1953233  ! 192: WRPR_GL_I	wrpr	%r20, 0x1233, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa192a549  ! 194: WRPR_GL_I	wrpr	%r10, 0x0549, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1972b64  ! 196: WRPR_GL_I	wrpr	%r28, 0x0b64, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa19637ca  ! 198: WRPR_GL_I	wrpr	%r24, 0x17ca, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa196ae6b  ! 200: WRPR_GL_I	wrpr	%r26, 0x0e6b, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1942341  ! 202: WRPR_GL_I	wrpr	%r16, 0x0341, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa195fba9  ! 204: WRPR_GL_I	wrpr	%r23, 0x1ba9, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1926f83  ! 206: WRPR_GL_I	wrpr	%r9, 0x0f83, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa195f35e  ! 208: WRPR_GL_I	wrpr	%r23, 0x135e, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa197f329  ! 210: WRPR_GL_I	wrpr	%r31, 0x1329, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa192af7d  ! 212: WRPR_GL_I	wrpr	%r10, 0x0f7d, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1953956  ! 214: WRPR_GL_I	wrpr	%r20, 0x1956, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa196e6d4  ! 216: WRPR_GL_I	wrpr	%r27, 0x06d4, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa192a088  ! 218: WRPR_GL_I	wrpr	%r10, 0x0088, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa196bacc  ! 220: WRPR_GL_I	wrpr	%r26, 0x1acc, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa193bfd1  ! 222: WRPR_GL_I	wrpr	%r14, 0x1fd1, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa192626f  ! 224: WRPR_GL_I	wrpr	%r9, 0x026f, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1927246  ! 226: WRPR_GL_I	wrpr	%r9, 0x1246, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa197264a  ! 228: WRPR_GL_I	wrpr	%r28, 0x064a, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa196fbe1  ! 230: WRPR_GL_I	wrpr	%r27, 0x1be1, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1923151  ! 232: WRPR_GL_I	wrpr	%r8, 0x1151, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1977af0  ! 234: WRPR_GL_I	wrpr	%r29, 0x1af0, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa196a888  ! 236: WRPR_GL_I	wrpr	%r26, 0x0888, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa196691d  ! 238: WRPR_GL_I	wrpr	%r25, 0x091d, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1933ee8  ! 240: WRPR_GL_I	wrpr	%r12, 0x1ee8, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa193b86c  ! 242: WRPR_GL_I	wrpr	%r14, 0x186c, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1926789  ! 244: WRPR_GL_I	wrpr	%r9, 0x0789, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1976861  ! 246: WRPR_GL_I	wrpr	%r29, 0x0861, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1972562  ! 248: WRPR_GL_I	wrpr	%r28, 0x0562, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1923380  ! 250: WRPR_GL_I	wrpr	%r8, 0x1380, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19568c2  ! 252: WRPR_GL_I	wrpr	%r21, 0x08c2, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa192add9  ! 254: WRPR_GL_I	wrpr	%r10, 0x0dd9, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa194e441  ! 256: WRPR_GL_I	wrpr	%r19, 0x0441, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa19321c6  ! 258: WRPR_GL_I	wrpr	%r12, 0x01c6, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa197b973  ! 260: WRPR_GL_I	wrpr	%r30, 0x1973, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa194bffa  ! 262: WRPR_GL_I	wrpr	%r18, 0x1ffa, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1937494  ! 264: WRPR_GL_I	wrpr	%r13, 0x1494, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1976f39  ! 266: WRPR_GL_I	wrpr	%r29, 0x0f39, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa197bc38  ! 268: WRPR_GL_I	wrpr	%r30, 0x1c38, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1937ca1  ! 270: WRPR_GL_I	wrpr	%r13, 0x1ca1, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1973c67  ! 272: WRPR_GL_I	wrpr	%r28, 0x1c67, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa197eb00  ! 274: WRPR_GL_I	wrpr	%r31, 0x0b00, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa193ac74  ! 276: WRPR_GL_I	wrpr	%r14, 0x0c74, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa194e13b  ! 278: WRPR_GL_I	wrpr	%r19, 0x013b, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa193f8c8  ! 280: WRPR_GL_I	wrpr	%r15, 0x18c8, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1946acf  ! 282: WRPR_GL_I	wrpr	%r17, 0x0acf, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa194f1e3  ! 284: WRPR_GL_I	wrpr	%r19, 0x11e3, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1966285  ! 286: WRPR_GL_I	wrpr	%r25, 0x0285, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1957462  ! 288: WRPR_GL_I	wrpr	%r21, 0x1462, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa193b0f7  ! 290: WRPR_GL_I	wrpr	%r14, 0x10f7, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa196364b  ! 292: WRPR_GL_I	wrpr	%r24, 0x164b, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa194fcdf  ! 294: WRPR_GL_I	wrpr	%r19, 0x1cdf, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa194f32f  ! 296: WRPR_GL_I	wrpr	%r19, 0x132f, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1962d46  ! 298: WRPR_GL_I	wrpr	%r24, 0x0d46, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa196a4c9  ! 300: WRPR_GL_I	wrpr	%r26, 0x04c9, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa193325f  ! 302: WRPR_GL_I	wrpr	%r12, 0x125f, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa197f31c  ! 304: WRPR_GL_I	wrpr	%r31, 0x131c, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1963ba8  ! 306: WRPR_GL_I	wrpr	%r24, 0x1ba8, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa196be0e  ! 308: WRPR_GL_I	wrpr	%r26, 0x1e0e, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa194e1af  ! 310: WRPR_GL_I	wrpr	%r19, 0x01af, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa194b993  ! 312: WRPR_GL_I	wrpr	%r18, 0x1993, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa194fb78  ! 314: WRPR_GL_I	wrpr	%r19, 0x1b78, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa193b68f  ! 316: WRPR_GL_I	wrpr	%r14, 0x168f, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19328c4  ! 318: WRPR_GL_I	wrpr	%r12, 0x08c4, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa192ec5b  ! 320: WRPR_GL_I	wrpr	%r11, 0x0c5b, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1946655  ! 322: WRPR_GL_I	wrpr	%r17, 0x0655, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa195a0f6  ! 324: WRPR_GL_I	wrpr	%r22, 0x00f6, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa192a364  ! 326: WRPR_GL_I	wrpr	%r10, 0x0364, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa192fa58  ! 328: WRPR_GL_I	wrpr	%r11, 0x1a58, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa197e710  ! 330: WRPR_GL_I	wrpr	%r31, 0x0710, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa196f9ab  ! 332: WRPR_GL_I	wrpr	%r27, 0x19ab, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa194f0ba  ! 334: WRPR_GL_I	wrpr	%r19, 0x10ba, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa196bea4  ! 336: WRPR_GL_I	wrpr	%r26, 0x1ea4, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa194e7dd  ! 338: WRPR_GL_I	wrpr	%r19, 0x07dd, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa195b3fa  ! 340: WRPR_GL_I	wrpr	%r22, 0x13fa, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa194a9fc  ! 342: WRPR_GL_I	wrpr	%r18, 0x09fc, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa195b473  ! 344: WRPR_GL_I	wrpr	%r22, 0x1473, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1963d16  ! 346: WRPR_GL_I	wrpr	%r24, 0x1d16, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa19327a3  ! 348: WRPR_GL_I	wrpr	%r12, 0x07a3, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1972176  ! 350: WRPR_GL_I	wrpr	%r28, 0x0176, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa193a3e7  ! 352: WRPR_GL_I	wrpr	%r14, 0x03e7, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1962487  ! 354: WRPR_GL_I	wrpr	%r24, 0x0487, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa195e9e5  ! 356: WRPR_GL_I	wrpr	%r23, 0x09e5, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1976f30  ! 358: WRPR_GL_I	wrpr	%r29, 0x0f30, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa194b005  ! 360: WRPR_GL_I	wrpr	%r18, 0x1005, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1943e11  ! 362: WRPR_GL_I	wrpr	%r16, 0x1e11, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa192e263  ! 364: WRPR_GL_I	wrpr	%r11, 0x0263, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1952ba0  ! 366: WRPR_GL_I	wrpr	%r20, 0x0ba0, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa195e263  ! 368: WRPR_GL_I	wrpr	%r23, 0x0263, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1937d15  ! 370: WRPR_GL_I	wrpr	%r13, 0x1d15, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1972a62  ! 372: WRPR_GL_I	wrpr	%r28, 0x0a62, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa195fd53  ! 374: WRPR_GL_I	wrpr	%r23, 0x1d53, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa195fb8a  ! 376: WRPR_GL_I	wrpr	%r23, 0x1b8a, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1976f8c  ! 378: WRPR_GL_I	wrpr	%r29, 0x0f8c, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1966dde  ! 380: WRPR_GL_I	wrpr	%r25, 0x0dde, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19622b3  ! 382: WRPR_GL_I	wrpr	%r24, 0x02b3, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa194bd81  ! 384: WRPR_GL_I	wrpr	%r18, 0x1d81, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa195384f  ! 386: WRPR_GL_I	wrpr	%r20, 0x184f, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa193e09e  ! 388: WRPR_GL_I	wrpr	%r15, 0x009e, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa194f7b8  ! 390: WRPR_GL_I	wrpr	%r19, 0x17b8, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1952a42  ! 392: WRPR_GL_I	wrpr	%r20, 0x0a42, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1956c44  ! 394: WRPR_GL_I	wrpr	%r21, 0x0c44, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1972e73  ! 396: WRPR_GL_I	wrpr	%r28, 0x0e73, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1922875  ! 398: WRPR_GL_I	wrpr	%r8, 0x0875, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa196a647  ! 400: WRPR_GL_I	wrpr	%r26, 0x0647, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa192bcae  ! 402: WRPR_GL_I	wrpr	%r10, 0x1cae, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa195677c  ! 404: WRPR_GL_I	wrpr	%r21, 0x077c, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa196b5c5  ! 406: WRPR_GL_I	wrpr	%r26, 0x15c5, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa196e6c1  ! 408: WRPR_GL_I	wrpr	%r27, 0x06c1, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa197226a  ! 410: WRPR_GL_I	wrpr	%r28, 0x026a, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa193e801  ! 412: WRPR_GL_I	wrpr	%r15, 0x0801, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa192ea7b  ! 414: WRPR_GL_I	wrpr	%r11, 0x0a7b, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa195ff03  ! 416: WRPR_GL_I	wrpr	%r23, 0x1f03, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1943b53  ! 418: WRPR_GL_I	wrpr	%r16, 0x1b53, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa197a143  ! 420: WRPR_GL_I	wrpr	%r30, 0x0143, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa195ff40  ! 422: WRPR_GL_I	wrpr	%r23, 0x1f40, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa192b9e3  ! 424: WRPR_GL_I	wrpr	%r10, 0x19e3, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa193eacb  ! 426: WRPR_GL_I	wrpr	%r15, 0x0acb, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1963ce8  ! 428: WRPR_GL_I	wrpr	%r24, 0x1ce8, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1927e40  ! 430: WRPR_GL_I	wrpr	%r9, 0x1e40, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1967285  ! 432: WRPR_GL_I	wrpr	%r25, 0x1285, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1947d8d  ! 434: WRPR_GL_I	wrpr	%r17, 0x1d8d, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1926d5f  ! 436: WRPR_GL_I	wrpr	%r9, 0x0d5f, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19679eb  ! 438: WRPR_GL_I	wrpr	%r25, 0x19eb, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1922d25  ! 440: WRPR_GL_I	wrpr	%r8, 0x0d25, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa196f2a4  ! 442: WRPR_GL_I	wrpr	%r27, 0x12a4, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1963a2d  ! 444: WRPR_GL_I	wrpr	%r24, 0x1a2d, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa192751a  ! 446: WRPR_GL_I	wrpr	%r9, 0x151a, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1966394  ! 448: WRPR_GL_I	wrpr	%r25, 0x0394, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1952357  ! 450: WRPR_GL_I	wrpr	%r20, 0x0357, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1953740  ! 452: WRPR_GL_I	wrpr	%r20, 0x1740, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa194acfa  ! 454: WRPR_GL_I	wrpr	%r18, 0x0cfa, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1973bb1  ! 456: WRPR_GL_I	wrpr	%r28, 0x1bb1, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1932d5e  ! 458: WRPR_GL_I	wrpr	%r12, 0x0d5e, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1953934  ! 460: WRPR_GL_I	wrpr	%r20, 0x1934, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa195e23f  ! 462: WRPR_GL_I	wrpr	%r23, 0x023f, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa196aa51  ! 464: WRPR_GL_I	wrpr	%r26, 0x0a51, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa192f29f  ! 466: WRPR_GL_I	wrpr	%r11, 0x129f, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa193f58a  ! 468: WRPR_GL_I	wrpr	%r15, 0x158a, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1942612  ! 470: WRPR_GL_I	wrpr	%r16, 0x0612, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa197bf16  ! 472: WRPR_GL_I	wrpr	%r30, 0x1f16, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa193a1e5  ! 474: WRPR_GL_I	wrpr	%r14, 0x01e5, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1946807  ! 476: WRPR_GL_I	wrpr	%r17, 0x0807, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa195b811  ! 478: WRPR_GL_I	wrpr	%r22, 0x1811, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa195330e  ! 480: WRPR_GL_I	wrpr	%r20, 0x130e, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa194e914  ! 482: WRPR_GL_I	wrpr	%r19, 0x0914, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa192fc12  ! 484: WRPR_GL_I	wrpr	%r11, 0x1c12, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa196b4e6  ! 486: WRPR_GL_I	wrpr	%r26, 0x14e6, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa196e17c  ! 488: WRPR_GL_I	wrpr	%r27, 0x017c, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1952781  ! 490: WRPR_GL_I	wrpr	%r20, 0x0781, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1967b27  ! 492: WRPR_GL_I	wrpr	%r25, 0x1b27, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa193635e  ! 494: WRPR_GL_I	wrpr	%r13, 0x035e, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1932900  ! 496: WRPR_GL_I	wrpr	%r12, 0x0900, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1923402  ! 498: WRPR_GL_I	wrpr	%r8, 0x1402, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1936866  ! 500: WRPR_GL_I	wrpr	%r13, 0x0866, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa195f382  ! 502: WRPR_GL_I	wrpr	%r23, 0x1382, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa197779f  ! 504: WRPR_GL_I	wrpr	%r29, 0x179f, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa197f9d2  ! 506: WRPR_GL_I	wrpr	%r31, 0x19d2, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa19337c6  ! 508: WRPR_GL_I	wrpr	%r12, 0x17c6, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa193f524  ! 510: WRPR_GL_I	wrpr	%r15, 0x1524, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1947171  ! 512: WRPR_GL_I	wrpr	%r17, 0x1171, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1972f50  ! 514: WRPR_GL_I	wrpr	%r28, 0x0f50, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa192e865  ! 516: WRPR_GL_I	wrpr	%r11, 0x0865, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa193fbfc  ! 518: WRPR_GL_I	wrpr	%r15, 0x1bfc, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa197fae3  ! 520: WRPR_GL_I	wrpr	%r31, 0x1ae3, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa196e4ca  ! 522: WRPR_GL_I	wrpr	%r27, 0x04ca, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa197a02d  ! 524: WRPR_GL_I	wrpr	%r30, 0x002d, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1962a3a  ! 526: WRPR_GL_I	wrpr	%r24, 0x0a3a, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1957865  ! 528: WRPR_GL_I	wrpr	%r21, 0x1865, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa196779e  ! 530: WRPR_GL_I	wrpr	%r25, 0x179e, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa193ff12  ! 532: WRPR_GL_I	wrpr	%r15, 0x1f12, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa192ba53  ! 534: WRPR_GL_I	wrpr	%r10, 0x1a53, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa193abad  ! 536: WRPR_GL_I	wrpr	%r14, 0x0bad, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1923fc8  ! 538: WRPR_GL_I	wrpr	%r8, 0x1fc8, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa196bfee  ! 540: WRPR_GL_I	wrpr	%r26, 0x1fee, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa194f4a7  ! 542: WRPR_GL_I	wrpr	%r19, 0x14a7, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1923910  ! 544: WRPR_GL_I	wrpr	%r8, 0x1910, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa194ea85  ! 546: WRPR_GL_I	wrpr	%r19, 0x0a85, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1947d61  ! 548: WRPR_GL_I	wrpr	%r17, 0x1d61, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa197e78a  ! 550: WRPR_GL_I	wrpr	%r31, 0x078a, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa196b26d  ! 552: WRPR_GL_I	wrpr	%r26, 0x126d, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa196e6e6  ! 554: WRPR_GL_I	wrpr	%r27, 0x06e6, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa197a4db  ! 556: WRPR_GL_I	wrpr	%r30, 0x04db, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19337ce  ! 558: WRPR_GL_I	wrpr	%r12, 0x17ce, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa197e02e  ! 560: WRPR_GL_I	wrpr	%r31, 0x002e, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa192f956  ! 562: WRPR_GL_I	wrpr	%r11, 0x1956, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1947d6e  ! 564: WRPR_GL_I	wrpr	%r17, 0x1d6e, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1977829  ! 566: WRPR_GL_I	wrpr	%r29, 0x1829, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa192bfa9  ! 568: WRPR_GL_I	wrpr	%r10, 0x1fa9, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa197a3b6  ! 570: WRPR_GL_I	wrpr	%r30, 0x03b6, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa19420bf  ! 572: WRPR_GL_I	wrpr	%r16, 0x00bf, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1933789  ! 574: WRPR_GL_I	wrpr	%r12, 0x1789, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19777de  ! 576: WRPR_GL_I	wrpr	%r29, 0x17de, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19671f3  ! 578: WRPR_GL_I	wrpr	%r25, 0x11f3, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1963b07  ! 580: WRPR_GL_I	wrpr	%r24, 0x1b07, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa195eaaa  ! 582: WRPR_GL_I	wrpr	%r23, 0x0aaa, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1972698  ! 584: WRPR_GL_I	wrpr	%r28, 0x0698, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1972047  ! 586: WRPR_GL_I	wrpr	%r28, 0x0047, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1976915  ! 588: WRPR_GL_I	wrpr	%r29, 0x0915, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1966b5c  ! 590: WRPR_GL_I	wrpr	%r25, 0x0b5c, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1943382  ! 592: WRPR_GL_I	wrpr	%r16, 0x1382, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa194a38a  ! 594: WRPR_GL_I	wrpr	%r18, 0x038a, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa196e5a9  ! 596: WRPR_GL_I	wrpr	%r27, 0x05a9, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1933c8a  ! 598: WRPR_GL_I	wrpr	%r12, 0x1c8a, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa193bc57  ! 600: WRPR_GL_I	wrpr	%r14, 0x1c57, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa196f7d8  ! 602: WRPR_GL_I	wrpr	%r27, 0x17d8, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa197b452  ! 604: WRPR_GL_I	wrpr	%r30, 0x1452, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1932c56  ! 606: WRPR_GL_I	wrpr	%r12, 0x0c56, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa197784a  ! 608: WRPR_GL_I	wrpr	%r29, 0x184a, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa195e342  ! 610: WRPR_GL_I	wrpr	%r23, 0x0342, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1957d9a  ! 612: WRPR_GL_I	wrpr	%r21, 0x1d9a, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1927025  ! 614: WRPR_GL_I	wrpr	%r9, 0x1025, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1952c6c  ! 616: WRPR_GL_I	wrpr	%r20, 0x0c6c, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1956dd0  ! 618: WRPR_GL_I	wrpr	%r21, 0x0dd0, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa197e5a0  ! 620: WRPR_GL_I	wrpr	%r31, 0x05a0, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa196bbc2  ! 622: WRPR_GL_I	wrpr	%r26, 0x1bc2, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa197eb0c  ! 624: WRPR_GL_I	wrpr	%r31, 0x0b0c, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa192e3e7  ! 626: WRPR_GL_I	wrpr	%r11, 0x03e7, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19338fa  ! 628: WRPR_GL_I	wrpr	%r12, 0x18fa, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1936cb7  ! 630: WRPR_GL_I	wrpr	%r13, 0x0cb7, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa196afb2  ! 632: WRPR_GL_I	wrpr	%r26, 0x0fb2, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa192e23a  ! 634: WRPR_GL_I	wrpr	%r11, 0x023a, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1977793  ! 636: WRPR_GL_I	wrpr	%r29, 0x1793, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1976c09  ! 638: WRPR_GL_I	wrpr	%r29, 0x0c09, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa193748b  ! 640: WRPR_GL_I	wrpr	%r13, 0x148b, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1937991  ! 642: WRPR_GL_I	wrpr	%r13, 0x1991, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa192ab42  ! 644: WRPR_GL_I	wrpr	%r10, 0x0b42, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1926fa9  ! 646: WRPR_GL_I	wrpr	%r9, 0x0fa9, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1977e46  ! 648: WRPR_GL_I	wrpr	%r29, 0x1e46, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1922408  ! 650: WRPR_GL_I	wrpr	%r8, 0x0408, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa194ecc4  ! 652: WRPR_GL_I	wrpr	%r19, 0x0cc4, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa194ec5c  ! 654: WRPR_GL_I	wrpr	%r19, 0x0c5c, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa196f395  ! 656: WRPR_GL_I	wrpr	%r27, 0x1395, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa194f49b  ! 658: WRPR_GL_I	wrpr	%r19, 0x149b, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa193b88e  ! 660: WRPR_GL_I	wrpr	%r14, 0x188e, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1922f4d  ! 662: WRPR_GL_I	wrpr	%r8, 0x0f4d, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa193ae81  ! 664: WRPR_GL_I	wrpr	%r14, 0x0e81, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa196e9ad  ! 666: WRPR_GL_I	wrpr	%r27, 0x09ad, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa196b9a5  ! 668: WRPR_GL_I	wrpr	%r26, 0x19a5, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa194f8b1  ! 670: WRPR_GL_I	wrpr	%r19, 0x18b1, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1933754  ! 672: WRPR_GL_I	wrpr	%r12, 0x1754, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa193e45e  ! 674: WRPR_GL_I	wrpr	%r15, 0x045e, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa195ef9f  ! 676: WRPR_GL_I	wrpr	%r23, 0x0f9f, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19368f3  ! 678: WRPR_GL_I	wrpr	%r13, 0x08f3, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1977528  ! 680: WRPR_GL_I	wrpr	%r29, 0x1528, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1956432  ! 682: WRPR_GL_I	wrpr	%r21, 0x0432, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19631b6  ! 684: WRPR_GL_I	wrpr	%r24, 0x11b6, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa194b9a2  ! 686: WRPR_GL_I	wrpr	%r18, 0x19a2, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1926eab  ! 688: WRPR_GL_I	wrpr	%r9, 0x0eab, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa197302d  ! 690: WRPR_GL_I	wrpr	%r28, 0x102d, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa192abab  ! 692: WRPR_GL_I	wrpr	%r10, 0x0bab, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa197a18b  ! 694: WRPR_GL_I	wrpr	%r30, 0x018b, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19738a0  ! 696: WRPR_GL_I	wrpr	%r28, 0x18a0, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1962361  ! 698: WRPR_GL_I	wrpr	%r24, 0x0361, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa195abb6  ! 700: WRPR_GL_I	wrpr	%r22, 0x0bb6, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa196e9b5  ! 702: WRPR_GL_I	wrpr	%r27, 0x09b5, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa197a54f  ! 704: WRPR_GL_I	wrpr	%r30, 0x054f, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa197757b  ! 706: WRPR_GL_I	wrpr	%r29, 0x157b, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa19424e3  ! 708: WRPR_GL_I	wrpr	%r16, 0x04e3, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa192aefd  ! 710: WRPR_GL_I	wrpr	%r10, 0x0efd, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa197ec31  ! 712: WRPR_GL_I	wrpr	%r31, 0x0c31, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1942b48  ! 714: WRPR_GL_I	wrpr	%r16, 0x0b48, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa196bf15  ! 716: WRPR_GL_I	wrpr	%r26, 0x1f15, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa19469d3  ! 718: WRPR_GL_I	wrpr	%r17, 0x09d3, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa19462ae  ! 720: WRPR_GL_I	wrpr	%r17, 0x02ae, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1966450  ! 722: WRPR_GL_I	wrpr	%r25, 0x0450, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa193e767  ! 724: WRPR_GL_I	wrpr	%r15, 0x0767, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19420ad  ! 726: WRPR_GL_I	wrpr	%r16, 0x00ad, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa195f69a  ! 728: WRPR_GL_I	wrpr	%r23, 0x169a, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1922485  ! 730: WRPR_GL_I	wrpr	%r8, 0x0485, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa195f988  ! 732: WRPR_GL_I	wrpr	%r23, 0x1988, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1953495  ! 734: WRPR_GL_I	wrpr	%r20, 0x1495, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa192afcc  ! 736: WRPR_GL_I	wrpr	%r10, 0x0fcc, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19460ff  ! 738: WRPR_GL_I	wrpr	%r17, 0x00ff, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa194e73e  ! 740: WRPR_GL_I	wrpr	%r19, 0x073e, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1977c19  ! 742: WRPR_GL_I	wrpr	%r29, 0x1c19, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa195eea7  ! 744: WRPR_GL_I	wrpr	%r23, 0x0ea7, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa192a9ca  ! 746: WRPR_GL_I	wrpr	%r10, 0x09ca, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa194ff40  ! 748: WRPR_GL_I	wrpr	%r19, 0x1f40, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa197e26a  ! 750: WRPR_GL_I	wrpr	%r31, 0x026a, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1922c02  ! 752: WRPR_GL_I	wrpr	%r8, 0x0c02, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa192237c  ! 754: WRPR_GL_I	wrpr	%r8, 0x037c, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa193be50  ! 756: WRPR_GL_I	wrpr	%r14, 0x1e50, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa197627c  ! 758: WRPR_GL_I	wrpr	%r29, 0x027c, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa19324cb  ! 760: WRPR_GL_I	wrpr	%r12, 0x04cb, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa193a9da  ! 762: WRPR_GL_I	wrpr	%r14, 0x09da, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa192facb  ! 764: WRPR_GL_I	wrpr	%r11, 0x1acb, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa197ee9c  ! 766: WRPR_GL_I	wrpr	%r31, 0x0e9c, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa197b1a6  ! 768: WRPR_GL_I	wrpr	%r30, 0x11a6, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1962db6  ! 770: WRPR_GL_I	wrpr	%r24, 0x0db6, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa196f1c0  ! 772: WRPR_GL_I	wrpr	%r27, 0x11c0, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa192e348  ! 774: WRPR_GL_I	wrpr	%r11, 0x0348, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa197fd63  ! 776: WRPR_GL_I	wrpr	%r31, 0x1d63, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa195aa55  ! 778: WRPR_GL_I	wrpr	%r22, 0x0a55, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1976fef  ! 780: WRPR_GL_I	wrpr	%r29, 0x0fef, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1922995  ! 782: WRPR_GL_I	wrpr	%r8, 0x0995, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1957935  ! 784: WRPR_GL_I	wrpr	%r21, 0x1935, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa192f246  ! 786: WRPR_GL_I	wrpr	%r11, 0x1246, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa194ab4b  ! 788: WRPR_GL_I	wrpr	%r18, 0x0b4b, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1943092  ! 790: WRPR_GL_I	wrpr	%r16, 0x1092, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1927342  ! 792: WRPR_GL_I	wrpr	%r9, 0x1342, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa193f2cc  ! 794: WRPR_GL_I	wrpr	%r15, 0x12cc, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa19331c4  ! 796: WRPR_GL_I	wrpr	%r12, 0x11c4, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa197223f  ! 798: WRPR_GL_I	wrpr	%r28, 0x023f, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa196238f  ! 800: WRPR_GL_I	wrpr	%r24, 0x038f, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa197b1d1  ! 802: WRPR_GL_I	wrpr	%r30, 0x11d1, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa193720c  ! 804: WRPR_GL_I	wrpr	%r13, 0x120c, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa195ff9b  ! 806: WRPR_GL_I	wrpr	%r23, 0x1f9b, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1962347  ! 808: WRPR_GL_I	wrpr	%r24, 0x0347, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa19238ae  ! 810: WRPR_GL_I	wrpr	%r8, 0x18ae, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa192a4fb  ! 812: WRPR_GL_I	wrpr	%r10, 0x04fb, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa195ac90  ! 814: WRPR_GL_I	wrpr	%r22, 0x0c90, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19363d3  ! 816: WRPR_GL_I	wrpr	%r13, 0x03d3, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa194274a  ! 818: WRPR_GL_I	wrpr	%r16, 0x074a, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa193f054  ! 820: WRPR_GL_I	wrpr	%r15, 0x1054, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1923e06  ! 822: WRPR_GL_I	wrpr	%r8, 0x1e06, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1957ee0  ! 824: WRPR_GL_I	wrpr	%r21, 0x1ee0, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa195baa5  ! 826: WRPR_GL_I	wrpr	%r22, 0x1aa5, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa194ae36  ! 828: WRPR_GL_I	wrpr	%r18, 0x0e36, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa196b153  ! 830: WRPR_GL_I	wrpr	%r26, 0x1153, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa193ef92  ! 832: WRPR_GL_I	wrpr	%r15, 0x0f92, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19673d0  ! 834: WRPR_GL_I	wrpr	%r25, 0x13d0, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa194f865  ! 836: WRPR_GL_I	wrpr	%r19, 0x1865, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa197719c  ! 838: WRPR_GL_I	wrpr	%r29, 0x119c, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa192a5f6  ! 840: WRPR_GL_I	wrpr	%r10, 0x05f6, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa197b9a4  ! 842: WRPR_GL_I	wrpr	%r30, 0x19a4, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1956980  ! 844: WRPR_GL_I	wrpr	%r21, 0x0980, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1947027  ! 846: WRPR_GL_I	wrpr	%r17, 0x1027, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa195372b  ! 848: WRPR_GL_I	wrpr	%r20, 0x172b, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19666de  ! 850: WRPR_GL_I	wrpr	%r25, 0x06de, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1966f96  ! 852: WRPR_GL_I	wrpr	%r25, 0x0f96, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa19338f2  ! 854: WRPR_GL_I	wrpr	%r12, 0x18f2, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa196211b  ! 856: WRPR_GL_I	wrpr	%r24, 0x011b, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa194be9f  ! 858: WRPR_GL_I	wrpr	%r18, 0x1e9f, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa19568a3  ! 860: WRPR_GL_I	wrpr	%r21, 0x08a3, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa192f4c9  ! 862: WRPR_GL_I	wrpr	%r11, 0x14c9, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa195b37b  ! 864: WRPR_GL_I	wrpr	%r22, 0x137b, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa194347e  ! 866: WRPR_GL_I	wrpr	%r16, 0x147e, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa197a72f  ! 868: WRPR_GL_I	wrpr	%r30, 0x072f, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa196e735  ! 870: WRPR_GL_I	wrpr	%r27, 0x0735, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa196a8c2  ! 872: WRPR_GL_I	wrpr	%r26, 0x08c2, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa192387c  ! 874: WRPR_GL_I	wrpr	%r8, 0x187c, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa193b491  ! 876: WRPR_GL_I	wrpr	%r14, 0x1491, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa194bc21  ! 878: WRPR_GL_I	wrpr	%r18, 0x1c21, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19664b4  ! 880: WRPR_GL_I	wrpr	%r25, 0x04b4, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa195fe44  ! 882: WRPR_GL_I	wrpr	%r23, 0x1e44, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa193b79d  ! 884: WRPR_GL_I	wrpr	%r14, 0x179d, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa196ba3e  ! 886: WRPR_GL_I	wrpr	%r26, 0x1a3e, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa197bb39  ! 888: WRPR_GL_I	wrpr	%r30, 0x1b39, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa194f65f  ! 890: WRPR_GL_I	wrpr	%r19, 0x165f, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19777f2  ! 892: WRPR_GL_I	wrpr	%r29, 0x17f2, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa195aad4  ! 894: WRPR_GL_I	wrpr	%r22, 0x0ad4, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa194309e  ! 896: WRPR_GL_I	wrpr	%r16, 0x109e, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa197b665  ! 898: WRPR_GL_I	wrpr	%r30, 0x1665, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa194676d  ! 900: WRPR_GL_I	wrpr	%r17, 0x076d, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa195b5b0  ! 902: WRPR_GL_I	wrpr	%r22, 0x15b0, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa192e72b  ! 904: WRPR_GL_I	wrpr	%r11, 0x072b, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa196aa1a  ! 906: WRPR_GL_I	wrpr	%r26, 0x0a1a, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa195222a  ! 908: WRPR_GL_I	wrpr	%r20, 0x022a, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1927090  ! 910: WRPR_GL_I	wrpr	%r9, 0x1090, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa193252c  ! 912: WRPR_GL_I	wrpr	%r12, 0x052c, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1977d82  ! 914: WRPR_GL_I	wrpr	%r29, 0x1d82, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa195b9f2  ! 916: WRPR_GL_I	wrpr	%r22, 0x19f2, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1973460  ! 918: WRPR_GL_I	wrpr	%r28, 0x1460, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa194f526  ! 920: WRPR_GL_I	wrpr	%r19, 0x1526, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa19365a7  ! 922: WRPR_GL_I	wrpr	%r13, 0x05a7, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa197792b  ! 924: WRPR_GL_I	wrpr	%r29, 0x192b, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa197ab95  ! 926: WRPR_GL_I	wrpr	%r30, 0x0b95, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1962759  ! 928: WRPR_GL_I	wrpr	%r24, 0x0759, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1942e17  ! 930: WRPR_GL_I	wrpr	%r16, 0x0e17, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1926010  ! 932: WRPR_GL_I	wrpr	%r9, 0x0010, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa197e598  ! 934: WRPR_GL_I	wrpr	%r31, 0x0598, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1933ce6  ! 936: WRPR_GL_I	wrpr	%r12, 0x1ce6, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa197bf57  ! 938: WRPR_GL_I	wrpr	%r30, 0x1f57, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa196a5eb  ! 940: WRPR_GL_I	wrpr	%r26, 0x05eb, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa195b551  ! 942: WRPR_GL_I	wrpr	%r22, 0x1551, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1927372  ! 944: WRPR_GL_I	wrpr	%r9, 0x1372, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa194eb76  ! 946: WRPR_GL_I	wrpr	%r19, 0x0b76, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa193ae72  ! 948: WRPR_GL_I	wrpr	%r14, 0x0e72, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa197f5cd  ! 950: WRPR_GL_I	wrpr	%r31, 0x15cd, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1962f6e  ! 952: WRPR_GL_I	wrpr	%r24, 0x0f6e, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19532b5  ! 954: WRPR_GL_I	wrpr	%r20, 0x12b5, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1963b68  ! 956: WRPR_GL_I	wrpr	%r24, 0x1b68, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa194fb32  ! 958: WRPR_GL_I	wrpr	%r19, 0x1b32, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1966b68  ! 960: WRPR_GL_I	wrpr	%r25, 0x0b68, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19772cd  ! 962: WRPR_GL_I	wrpr	%r29, 0x12cd, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa194feda  ! 964: WRPR_GL_I	wrpr	%r19, 0x1eda, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa192fc00  ! 966: WRPR_GL_I	wrpr	%r11, 0x1c00, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa197eefa  ! 968: WRPR_GL_I	wrpr	%r31, 0x0efa, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19529c8  ! 970: WRPR_GL_I	wrpr	%r20, 0x09c8, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa194e663  ! 972: WRPR_GL_I	wrpr	%r19, 0x0663, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1953b0c  ! 974: WRPR_GL_I	wrpr	%r20, 0x1b0c, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1972406  ! 976: WRPR_GL_I	wrpr	%r28, 0x0406, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa196bc25  ! 978: WRPR_GL_I	wrpr	%r26, 0x1c25, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa193fc69  ! 980: WRPR_GL_I	wrpr	%r15, 0x1c69, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1976afa  ! 982: WRPR_GL_I	wrpr	%r29, 0x0afa, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa194669b  ! 984: WRPR_GL_I	wrpr	%r17, 0x069b, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1952fee  ! 986: WRPR_GL_I	wrpr	%r20, 0x0fee, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19673cc  ! 988: WRPR_GL_I	wrpr	%r25, 0x13cc, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa195f646  ! 990: WRPR_GL_I	wrpr	%r23, 0x1646, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1933931  ! 992: WRPR_GL_I	wrpr	%r12, 0x1931, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa195b84f  ! 994: WRPR_GL_I	wrpr	%r22, 0x184f, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa195f7b7  ! 996: WRPR_GL_I	wrpr	%r23, 0x17b7, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa194ac4c  ! 998: WRPR_GL_I	wrpr	%r18, 0x0c4c, %-
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa192af0f  ! 2: WRPR_GL_I	wrpr	%r10, 0x0f0f, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa194e98e  ! 4: WRPR_GL_I	wrpr	%r19, 0x098e, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1972277  ! 6: WRPR_GL_I	wrpr	%r28, 0x0277, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1957558  ! 8: WRPR_GL_I	wrpr	%r21, 0x1558, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa195ab83  ! 10: WRPR_GL_I	wrpr	%r22, 0x0b83, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa195f445  ! 12: WRPR_GL_I	wrpr	%r23, 0x1445, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa192a206  ! 14: WRPR_GL_I	wrpr	%r10, 0x0206, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1933d4a  ! 16: WRPR_GL_I	wrpr	%r12, 0x1d4a, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19471bb  ! 18: WRPR_GL_I	wrpr	%r17, 0x11bb, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa197ebb9  ! 20: WRPR_GL_I	wrpr	%r31, 0x0bb9, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa196fd45  ! 22: WRPR_GL_I	wrpr	%r27, 0x1d45, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa19535ca  ! 24: WRPR_GL_I	wrpr	%r20, 0x15ca, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa196ef68  ! 26: WRPR_GL_I	wrpr	%r27, 0x0f68, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19735d5  ! 28: WRPR_GL_I	wrpr	%r28, 0x15d5, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19633ae  ! 30: WRPR_GL_I	wrpr	%r24, 0x13ae, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1953320  ! 32: WRPR_GL_I	wrpr	%r20, 0x1320, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa194f238  ! 34: WRPR_GL_I	wrpr	%r19, 0x1238, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1932bac  ! 36: WRPR_GL_I	wrpr	%r12, 0x0bac, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa196747b  ! 38: WRPR_GL_I	wrpr	%r25, 0x147b, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1977327  ! 40: WRPR_GL_I	wrpr	%r29, 0x1327, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa193e538  ! 42: WRPR_GL_I	wrpr	%r15, 0x0538, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1942129  ! 44: WRPR_GL_I	wrpr	%r16, 0x0129, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1957e88  ! 46: WRPR_GL_I	wrpr	%r21, 0x1e88, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa195fbd1  ! 48: WRPR_GL_I	wrpr	%r23, 0x1bd1, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1927f6e  ! 50: WRPR_GL_I	wrpr	%r9, 0x1f6e, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa193a885  ! 52: WRPR_GL_I	wrpr	%r14, 0x0885, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1976845  ! 54: WRPR_GL_I	wrpr	%r29, 0x0845, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa193ac1c  ! 56: WRPR_GL_I	wrpr	%r14, 0x0c1c, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1947e7d  ! 58: WRPR_GL_I	wrpr	%r17, 0x1e7d, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1926f5e  ! 60: WRPR_GL_I	wrpr	%r9, 0x0f5e, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1933752  ! 62: WRPR_GL_I	wrpr	%r12, 0x1752, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa197f849  ! 64: WRPR_GL_I	wrpr	%r31, 0x1849, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa194f05a  ! 66: WRPR_GL_I	wrpr	%r19, 0x105a, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1977201  ! 68: WRPR_GL_I	wrpr	%r29, 0x1201, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa192fc3b  ! 70: WRPR_GL_I	wrpr	%r11, 0x1c3b, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1966531  ! 72: WRPR_GL_I	wrpr	%r25, 0x0531, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa192bb62  ! 74: WRPR_GL_I	wrpr	%r10, 0x1b62, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa194e052  ! 76: WRPR_GL_I	wrpr	%r19, 0x0052, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa196e82f  ! 78: WRPR_GL_I	wrpr	%r27, 0x082f, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa194b066  ! 80: WRPR_GL_I	wrpr	%r18, 0x1066, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1942c01  ! 82: WRPR_GL_I	wrpr	%r16, 0x0c01, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa195bc33  ! 84: WRPR_GL_I	wrpr	%r22, 0x1c33, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1922081  ! 86: WRPR_GL_I	wrpr	%r8, 0x0081, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa195b29a  ! 88: WRPR_GL_I	wrpr	%r22, 0x129a, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1936e07  ! 90: WRPR_GL_I	wrpr	%r13, 0x0e07, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa196e171  ! 92: WRPR_GL_I	wrpr	%r27, 0x0171, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1973b43  ! 94: WRPR_GL_I	wrpr	%r28, 0x1b43, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa192be9e  ! 96: WRPR_GL_I	wrpr	%r10, 0x1e9e, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa195b537  ! 98: WRPR_GL_I	wrpr	%r22, 0x1537, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa192fe37  ! 100: WRPR_GL_I	wrpr	%r11, 0x1e37, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1943565  ! 102: WRPR_GL_I	wrpr	%r16, 0x1565, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa194bf64  ! 104: WRPR_GL_I	wrpr	%r18, 0x1f64, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1927593  ! 106: WRPR_GL_I	wrpr	%r9, 0x1593, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa193b12a  ! 108: WRPR_GL_I	wrpr	%r14, 0x112a, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1956a29  ! 110: WRPR_GL_I	wrpr	%r21, 0x0a29, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa193f727  ! 112: WRPR_GL_I	wrpr	%r15, 0x1727, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa196e067  ! 114: WRPR_GL_I	wrpr	%r27, 0x0067, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa195e545  ! 116: WRPR_GL_I	wrpr	%r23, 0x0545, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa197fc6f  ! 118: WRPR_GL_I	wrpr	%r31, 0x1c6f, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1943f1e  ! 120: WRPR_GL_I	wrpr	%r16, 0x1f1e, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa192bb13  ! 122: WRPR_GL_I	wrpr	%r10, 0x1b13, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa195e639  ! 124: WRPR_GL_I	wrpr	%r23, 0x0639, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa193a1f5  ! 126: WRPR_GL_I	wrpr	%r14, 0x01f5, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa194607a  ! 128: WRPR_GL_I	wrpr	%r17, 0x007a, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa192789d  ! 130: WRPR_GL_I	wrpr	%r9, 0x189d, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa194bf38  ! 132: WRPR_GL_I	wrpr	%r18, 0x1f38, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa197a212  ! 134: WRPR_GL_I	wrpr	%r30, 0x0212, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1963da5  ! 136: WRPR_GL_I	wrpr	%r24, 0x1da5, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19270a4  ! 138: WRPR_GL_I	wrpr	%r9, 0x10a4, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1976220  ! 140: WRPR_GL_I	wrpr	%r29, 0x0220, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa196ada6  ! 142: WRPR_GL_I	wrpr	%r26, 0x0da6, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1952505  ! 144: WRPR_GL_I	wrpr	%r20, 0x0505, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1926b52  ! 146: WRPR_GL_I	wrpr	%r9, 0x0b52, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1963438  ! 148: WRPR_GL_I	wrpr	%r24, 0x1438, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19425f1  ! 150: WRPR_GL_I	wrpr	%r16, 0x05f1, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1926f32  ! 152: WRPR_GL_I	wrpr	%r9, 0x0f32, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa194efa3  ! 154: WRPR_GL_I	wrpr	%r19, 0x0fa3, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa193ac3c  ! 156: WRPR_GL_I	wrpr	%r14, 0x0c3c, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1973f78  ! 158: WRPR_GL_I	wrpr	%r28, 0x1f78, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1953905  ! 160: WRPR_GL_I	wrpr	%r20, 0x1905, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa195bb65  ! 162: WRPR_GL_I	wrpr	%r22, 0x1b65, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1952986  ! 164: WRPR_GL_I	wrpr	%r20, 0x0986, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19774d2  ! 166: WRPR_GL_I	wrpr	%r29, 0x14d2, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa193fe87  ! 168: WRPR_GL_I	wrpr	%r15, 0x1e87, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa195e50d  ! 170: WRPR_GL_I	wrpr	%r23, 0x050d, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa197e73a  ! 172: WRPR_GL_I	wrpr	%r31, 0x073a, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa192f92f  ! 174: WRPR_GL_I	wrpr	%r11, 0x192f, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa196e233  ! 176: WRPR_GL_I	wrpr	%r27, 0x0233, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19628bc  ! 178: WRPR_GL_I	wrpr	%r24, 0x08bc, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1926fbd  ! 180: WRPR_GL_I	wrpr	%r9, 0x0fbd, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa195bd42  ! 182: WRPR_GL_I	wrpr	%r22, 0x1d42, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19573ba  ! 184: WRPR_GL_I	wrpr	%r21, 0x13ba, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa194fb1f  ! 186: WRPR_GL_I	wrpr	%r19, 0x1b1f, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa196bc44  ! 188: WRPR_GL_I	wrpr	%r26, 0x1c44, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1942c39  ! 190: WRPR_GL_I	wrpr	%r16, 0x0c39, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa19233c0  ! 192: WRPR_GL_I	wrpr	%r8, 0x13c0, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa19577ab  ! 194: WRPR_GL_I	wrpr	%r21, 0x17ab, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa195bc12  ! 196: WRPR_GL_I	wrpr	%r22, 0x1c12, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1953fc3  ! 198: WRPR_GL_I	wrpr	%r20, 0x1fc3, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa195a503  ! 200: WRPR_GL_I	wrpr	%r22, 0x0503, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa194fdc5  ! 202: WRPR_GL_I	wrpr	%r19, 0x1dc5, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1943b5e  ! 204: WRPR_GL_I	wrpr	%r16, 0x1b5e, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa19429c2  ! 206: WRPR_GL_I	wrpr	%r16, 0x09c2, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa195e93c  ! 208: WRPR_GL_I	wrpr	%r23, 0x093c, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa192ef75  ! 210: WRPR_GL_I	wrpr	%r11, 0x0f75, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa19760e0  ! 212: WRPR_GL_I	wrpr	%r29, 0x00e0, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1962035  ! 214: WRPR_GL_I	wrpr	%r24, 0x0035, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa194a483  ! 216: WRPR_GL_I	wrpr	%r18, 0x0483, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa196308a  ! 218: WRPR_GL_I	wrpr	%r24, 0x108a, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa192b033  ! 220: WRPR_GL_I	wrpr	%r10, 0x1033, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19270e1  ! 222: WRPR_GL_I	wrpr	%r9, 0x10e1, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1947689  ! 224: WRPR_GL_I	wrpr	%r17, 0x1689, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa194211e  ! 226: WRPR_GL_I	wrpr	%r16, 0x011e, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa197bb03  ! 228: WRPR_GL_I	wrpr	%r30, 0x1b03, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa195ffe8  ! 230: WRPR_GL_I	wrpr	%r23, 0x1fe8, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1962f84  ! 232: WRPR_GL_I	wrpr	%r24, 0x0f84, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa196eb75  ! 234: WRPR_GL_I	wrpr	%r27, 0x0b75, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa193b25e  ! 236: WRPR_GL_I	wrpr	%r14, 0x125e, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa194345a  ! 238: WRPR_GL_I	wrpr	%r16, 0x145a, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1937c5b  ! 240: WRPR_GL_I	wrpr	%r13, 0x1c5b, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa197e657  ! 242: WRPR_GL_I	wrpr	%r31, 0x0657, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa194b2dd  ! 244: WRPR_GL_I	wrpr	%r18, 0x12dd, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa197bb94  ! 246: WRPR_GL_I	wrpr	%r30, 0x1b94, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1942d17  ! 248: WRPR_GL_I	wrpr	%r16, 0x0d17, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa192eead  ! 250: WRPR_GL_I	wrpr	%r11, 0x0ead, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1976b83  ! 252: WRPR_GL_I	wrpr	%r29, 0x0b83, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1962612  ! 254: WRPR_GL_I	wrpr	%r24, 0x0612, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa192ffaa  ! 256: WRPR_GL_I	wrpr	%r11, 0x1faa, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa196fbbc  ! 258: WRPR_GL_I	wrpr	%r27, 0x1bbc, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa194eedb  ! 260: WRPR_GL_I	wrpr	%r19, 0x0edb, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1952a52  ! 262: WRPR_GL_I	wrpr	%r20, 0x0a52, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1936b84  ! 264: WRPR_GL_I	wrpr	%r13, 0x0b84, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1947345  ! 266: WRPR_GL_I	wrpr	%r17, 0x1345, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa195e5db  ! 268: WRPR_GL_I	wrpr	%r23, 0x05db, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1957bda  ! 270: WRPR_GL_I	wrpr	%r21, 0x1bda, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa194638e  ! 272: WRPR_GL_I	wrpr	%r17, 0x038e, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1946781  ! 274: WRPR_GL_I	wrpr	%r17, 0x0781, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa193e15e  ! 276: WRPR_GL_I	wrpr	%r15, 0x015e, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa196742a  ! 278: WRPR_GL_I	wrpr	%r25, 0x142a, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1927a51  ! 280: WRPR_GL_I	wrpr	%r9, 0x1a51, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa19722bf  ! 282: WRPR_GL_I	wrpr	%r28, 0x02bf, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa193ebf8  ! 284: WRPR_GL_I	wrpr	%r15, 0x0bf8, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa194a363  ! 286: WRPR_GL_I	wrpr	%r18, 0x0363, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa192e006  ! 288: WRPR_GL_I	wrpr	%r11, 0x0006, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa19466d6  ! 290: WRPR_GL_I	wrpr	%r17, 0x06d6, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1923a66  ! 292: WRPR_GL_I	wrpr	%r8, 0x1a66, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa193357d  ! 294: WRPR_GL_I	wrpr	%r12, 0x157d, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa193237b  ! 296: WRPR_GL_I	wrpr	%r12, 0x037b, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa193e5b0  ! 298: WRPR_GL_I	wrpr	%r15, 0x05b0, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa196b71b  ! 300: WRPR_GL_I	wrpr	%r26, 0x171b, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1973df6  ! 302: WRPR_GL_I	wrpr	%r28, 0x1df6, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa19569ac  ! 304: WRPR_GL_I	wrpr	%r21, 0x09ac, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa194335c  ! 306: WRPR_GL_I	wrpr	%r16, 0x135c, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1956f54  ! 308: WRPR_GL_I	wrpr	%r21, 0x0f54, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa192eabd  ! 310: WRPR_GL_I	wrpr	%r11, 0x0abd, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa196273f  ! 312: WRPR_GL_I	wrpr	%r24, 0x073f, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa193fc7d  ! 314: WRPR_GL_I	wrpr	%r15, 0x1c7d, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa196aa74  ! 316: WRPR_GL_I	wrpr	%r26, 0x0a74, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa192b0de  ! 318: WRPR_GL_I	wrpr	%r10, 0x10de, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19373b9  ! 320: WRPR_GL_I	wrpr	%r13, 0x13b9, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1937480  ! 322: WRPR_GL_I	wrpr	%r13, 0x1480, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa196e988  ! 324: WRPR_GL_I	wrpr	%r27, 0x0988, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa196312b  ! 326: WRPR_GL_I	wrpr	%r24, 0x112b, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa194703b  ! 328: WRPR_GL_I	wrpr	%r17, 0x103b, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1956907  ! 330: WRPR_GL_I	wrpr	%r21, 0x0907, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa197ecd3  ! 332: WRPR_GL_I	wrpr	%r31, 0x0cd3, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa19636de  ! 334: WRPR_GL_I	wrpr	%r24, 0x16de, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa196f908  ! 336: WRPR_GL_I	wrpr	%r27, 0x1908, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1936f8c  ! 338: WRPR_GL_I	wrpr	%r13, 0x0f8c, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa193a80f  ! 340: WRPR_GL_I	wrpr	%r14, 0x080f, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa193bd3b  ! 342: WRPR_GL_I	wrpr	%r14, 0x1d3b, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa19631a4  ! 344: WRPR_GL_I	wrpr	%r24, 0x11a4, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19632fd  ! 346: WRPR_GL_I	wrpr	%r24, 0x12fd, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa196e174  ! 348: WRPR_GL_I	wrpr	%r27, 0x0174, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1967ffb  ! 350: WRPR_GL_I	wrpr	%r25, 0x1ffb, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa197edd8  ! 352: WRPR_GL_I	wrpr	%r31, 0x0dd8, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1926f33  ! 354: WRPR_GL_I	wrpr	%r9, 0x0f33, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa192be1f  ! 356: WRPR_GL_I	wrpr	%r10, 0x1e1f, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa193e230  ! 358: WRPR_GL_I	wrpr	%r15, 0x0230, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1926650  ! 360: WRPR_GL_I	wrpr	%r9, 0x0650, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa195b827  ! 362: WRPR_GL_I	wrpr	%r22, 0x1827, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1973e0c  ! 364: WRPR_GL_I	wrpr	%r28, 0x1e0c, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1923fa9  ! 366: WRPR_GL_I	wrpr	%r8, 0x1fa9, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa196fcaf  ! 368: WRPR_GL_I	wrpr	%r27, 0x1caf, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19668f8  ! 370: WRPR_GL_I	wrpr	%r25, 0x08f8, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1962343  ! 372: WRPR_GL_I	wrpr	%r24, 0x0343, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1922313  ! 374: WRPR_GL_I	wrpr	%r8, 0x0313, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa197eaf5  ! 376: WRPR_GL_I	wrpr	%r31, 0x0af5, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1962871  ! 378: WRPR_GL_I	wrpr	%r24, 0x0871, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1977756  ! 380: WRPR_GL_I	wrpr	%r29, 0x1756, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1932d81  ! 382: WRPR_GL_I	wrpr	%r12, 0x0d81, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1923161  ! 384: WRPR_GL_I	wrpr	%r8, 0x1161, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1967589  ! 386: WRPR_GL_I	wrpr	%r25, 0x1589, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1973e2a  ! 388: WRPR_GL_I	wrpr	%r28, 0x1e2a, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa193e2cc  ! 390: WRPR_GL_I	wrpr	%r15, 0x02cc, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa193a2b8  ! 392: WRPR_GL_I	wrpr	%r14, 0x02b8, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa194b9d1  ! 394: WRPR_GL_I	wrpr	%r18, 0x19d1, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1927eec  ! 396: WRPR_GL_I	wrpr	%r9, 0x1eec, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1977e4d  ! 398: WRPR_GL_I	wrpr	%r29, 0x1e4d, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa193ecaa  ! 400: WRPR_GL_I	wrpr	%r15, 0x0caa, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa195770c  ! 402: WRPR_GL_I	wrpr	%r21, 0x170c, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa196e9c8  ! 404: WRPR_GL_I	wrpr	%r27, 0x09c8, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1943bd2  ! 406: WRPR_GL_I	wrpr	%r16, 0x1bd2, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19427ab  ! 408: WRPR_GL_I	wrpr	%r16, 0x07ab, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa192e7ff  ! 410: WRPR_GL_I	wrpr	%r11, 0x07ff, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa193283f  ! 412: WRPR_GL_I	wrpr	%r12, 0x083f, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1933e39  ! 414: WRPR_GL_I	wrpr	%r12, 0x1e39, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1936b85  ! 416: WRPR_GL_I	wrpr	%r13, 0x0b85, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa195fb10  ! 418: WRPR_GL_I	wrpr	%r23, 0x1b10, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa195e4e4  ! 420: WRPR_GL_I	wrpr	%r23, 0x04e4, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa192bdfc  ! 422: WRPR_GL_I	wrpr	%r10, 0x1dfc, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19274fd  ! 424: WRPR_GL_I	wrpr	%r9, 0x14fd, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1946364  ! 426: WRPR_GL_I	wrpr	%r17, 0x0364, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa192afac  ! 428: WRPR_GL_I	wrpr	%r10, 0x0fac, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa194bd9b  ! 430: WRPR_GL_I	wrpr	%r18, 0x1d9b, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa195bcef  ! 432: WRPR_GL_I	wrpr	%r22, 0x1cef, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1952b85  ! 434: WRPR_GL_I	wrpr	%r20, 0x0b85, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa194fd23  ! 436: WRPR_GL_I	wrpr	%r19, 0x1d23, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1932f88  ! 438: WRPR_GL_I	wrpr	%r12, 0x0f88, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa193b673  ! 440: WRPR_GL_I	wrpr	%r14, 0x1673, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1922202  ! 442: WRPR_GL_I	wrpr	%r8, 0x0202, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa194f5f8  ! 444: WRPR_GL_I	wrpr	%r19, 0x15f8, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa193ef27  ! 446: WRPR_GL_I	wrpr	%r15, 0x0f27, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa197720f  ! 448: WRPR_GL_I	wrpr	%r29, 0x120f, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1967a43  ! 450: WRPR_GL_I	wrpr	%r25, 0x1a43, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1976b02  ! 452: WRPR_GL_I	wrpr	%r29, 0x0b02, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa196fe7a  ! 454: WRPR_GL_I	wrpr	%r27, 0x1e7a, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1976601  ! 456: WRPR_GL_I	wrpr	%r29, 0x0601, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1952941  ! 458: WRPR_GL_I	wrpr	%r20, 0x0941, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa193e3b8  ! 460: WRPR_GL_I	wrpr	%r15, 0x03b8, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa194b075  ! 462: WRPR_GL_I	wrpr	%r18, 0x1075, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19471b4  ! 464: WRPR_GL_I	wrpr	%r17, 0x11b4, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa195a86f  ! 466: WRPR_GL_I	wrpr	%r22, 0x086f, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa193f23e  ! 468: WRPR_GL_I	wrpr	%r15, 0x123e, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa197221a  ! 470: WRPR_GL_I	wrpr	%r28, 0x021a, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa192fcf5  ! 472: WRPR_GL_I	wrpr	%r11, 0x1cf5, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa193b0bb  ! 474: WRPR_GL_I	wrpr	%r14, 0x10bb, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1952c20  ! 476: WRPR_GL_I	wrpr	%r20, 0x0c20, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1937822  ! 478: WRPR_GL_I	wrpr	%r13, 0x1822, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa193748d  ! 480: WRPR_GL_I	wrpr	%r13, 0x148d, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa195e509  ! 482: WRPR_GL_I	wrpr	%r23, 0x0509, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1967c08  ! 484: WRPR_GL_I	wrpr	%r25, 0x1c08, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1943838  ! 486: WRPR_GL_I	wrpr	%r16, 0x1838, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1926461  ! 488: WRPR_GL_I	wrpr	%r9, 0x0461, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa197a467  ! 490: WRPR_GL_I	wrpr	%r30, 0x0467, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa195378d  ! 492: WRPR_GL_I	wrpr	%r20, 0x178d, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa196af70  ! 494: WRPR_GL_I	wrpr	%r26, 0x0f70, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa194ef65  ! 496: WRPR_GL_I	wrpr	%r19, 0x0f65, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa192e196  ! 498: WRPR_GL_I	wrpr	%r11, 0x0196, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1953672  ! 500: WRPR_GL_I	wrpr	%r20, 0x1672, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19560b8  ! 502: WRPR_GL_I	wrpr	%r21, 0x00b8, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa192e160  ! 504: WRPR_GL_I	wrpr	%r11, 0x0160, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa194eb0d  ! 506: WRPR_GL_I	wrpr	%r19, 0x0b0d, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa19229dc  ! 508: WRPR_GL_I	wrpr	%r8, 0x09dc, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa196693d  ! 510: WRPR_GL_I	wrpr	%r25, 0x093d, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa195bc1f  ! 512: WRPR_GL_I	wrpr	%r22, 0x1c1f, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa193a908  ! 514: WRPR_GL_I	wrpr	%r14, 0x0908, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa197eb46  ! 516: WRPR_GL_I	wrpr	%r31, 0x0b46, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa194735a  ! 518: WRPR_GL_I	wrpr	%r17, 0x135a, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa194a1e4  ! 520: WRPR_GL_I	wrpr	%r18, 0x01e4, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa196e281  ! 522: WRPR_GL_I	wrpr	%r27, 0x0281, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa195bcde  ! 524: WRPR_GL_I	wrpr	%r22, 0x1cde, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa197fd44  ! 526: WRPR_GL_I	wrpr	%r31, 0x1d44, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa195273d  ! 528: WRPR_GL_I	wrpr	%r20, 0x073d, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1973f49  ! 530: WRPR_GL_I	wrpr	%r28, 0x1f49, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa197e01e  ! 532: WRPR_GL_I	wrpr	%r31, 0x001e, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa194ea29  ! 534: WRPR_GL_I	wrpr	%r19, 0x0a29, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa196a94a  ! 536: WRPR_GL_I	wrpr	%r26, 0x094a, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1943e9f  ! 538: WRPR_GL_I	wrpr	%r16, 0x1e9f, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1933cdc  ! 540: WRPR_GL_I	wrpr	%r12, 0x1cdc, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa193b093  ! 542: WRPR_GL_I	wrpr	%r14, 0x1093, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1962dee  ! 544: WRPR_GL_I	wrpr	%r24, 0x0dee, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa19373d9  ! 546: WRPR_GL_I	wrpr	%r13, 0x13d9, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19578a2  ! 548: WRPR_GL_I	wrpr	%r21, 0x18a2, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa193e550  ! 550: WRPR_GL_I	wrpr	%r15, 0x0550, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1977374  ! 552: WRPR_GL_I	wrpr	%r29, 0x1374, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa196a733  ! 554: WRPR_GL_I	wrpr	%r26, 0x0733, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa19730c7  ! 556: WRPR_GL_I	wrpr	%r28, 0x10c7, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1933c21  ! 558: WRPR_GL_I	wrpr	%r12, 0x1c21, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1972c88  ! 560: WRPR_GL_I	wrpr	%r28, 0x0c88, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa197bd21  ! 562: WRPR_GL_I	wrpr	%r30, 0x1d21, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1922281  ! 564: WRPR_GL_I	wrpr	%r8, 0x0281, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa197f6dc  ! 566: WRPR_GL_I	wrpr	%r31, 0x16dc, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa192b40e  ! 568: WRPR_GL_I	wrpr	%r10, 0x140e, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa192ea61  ! 570: WRPR_GL_I	wrpr	%r11, 0x0a61, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa196363e  ! 572: WRPR_GL_I	wrpr	%r24, 0x163e, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1962c81  ! 574: WRPR_GL_I	wrpr	%r24, 0x0c81, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa196e21f  ! 576: WRPR_GL_I	wrpr	%r27, 0x021f, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa195b300  ! 578: WRPR_GL_I	wrpr	%r22, 0x1300, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19231d6  ! 580: WRPR_GL_I	wrpr	%r8, 0x11d6, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1967a6f  ! 582: WRPR_GL_I	wrpr	%r25, 0x1a6f, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa196f193  ! 584: WRPR_GL_I	wrpr	%r27, 0x1193, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa195a5c1  ! 586: WRPR_GL_I	wrpr	%r22, 0x05c1, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa193ba62  ! 588: WRPR_GL_I	wrpr	%r14, 0x1a62, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa195f940  ! 590: WRPR_GL_I	wrpr	%r23, 0x1940, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa194aeb9  ! 592: WRPR_GL_I	wrpr	%r18, 0x0eb9, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1936aa1  ! 594: WRPR_GL_I	wrpr	%r13, 0x0aa1, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa197282a  ! 596: WRPR_GL_I	wrpr	%r28, 0x082a, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa193afa0  ! 598: WRPR_GL_I	wrpr	%r14, 0x0fa0, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1946d30  ! 600: WRPR_GL_I	wrpr	%r17, 0x0d30, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa193a047  ! 602: WRPR_GL_I	wrpr	%r14, 0x0047, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19264f9  ! 604: WRPR_GL_I	wrpr	%r9, 0x04f9, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa195f489  ! 606: WRPR_GL_I	wrpr	%r23, 0x1489, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa195ef25  ! 608: WRPR_GL_I	wrpr	%r23, 0x0f25, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa195667c  ! 610: WRPR_GL_I	wrpr	%r21, 0x067c, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa196fa92  ! 612: WRPR_GL_I	wrpr	%r27, 0x1a92, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa197781f  ! 614: WRPR_GL_I	wrpr	%r29, 0x181f, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1967ed7  ! 616: WRPR_GL_I	wrpr	%r25, 0x1ed7, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa192b8cb  ! 618: WRPR_GL_I	wrpr	%r10, 0x18cb, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa196eb0f  ! 620: WRPR_GL_I	wrpr	%r27, 0x0b0f, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa196b8e8  ! 622: WRPR_GL_I	wrpr	%r26, 0x18e8, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1977f2d  ! 624: WRPR_GL_I	wrpr	%r29, 0x1f2d, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa194e62b  ! 626: WRPR_GL_I	wrpr	%r19, 0x062b, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa195249e  ! 628: WRPR_GL_I	wrpr	%r20, 0x049e, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa195a45c  ! 630: WRPR_GL_I	wrpr	%r22, 0x045c, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa195b52f  ! 632: WRPR_GL_I	wrpr	%r22, 0x152f, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa192708a  ! 634: WRPR_GL_I	wrpr	%r9, 0x108a, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa195ee4d  ! 636: WRPR_GL_I	wrpr	%r23, 0x0e4d, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1943413  ! 638: WRPR_GL_I	wrpr	%r16, 0x1413, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19461ef  ! 640: WRPR_GL_I	wrpr	%r17, 0x01ef, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa194a763  ! 642: WRPR_GL_I	wrpr	%r18, 0x0763, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa192f2be  ! 644: WRPR_GL_I	wrpr	%r11, 0x12be, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19674a5  ! 646: WRPR_GL_I	wrpr	%r25, 0x14a5, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa196fcba  ! 648: WRPR_GL_I	wrpr	%r27, 0x1cba, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa195695d  ! 650: WRPR_GL_I	wrpr	%r21, 0x095d, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa194ee8f  ! 652: WRPR_GL_I	wrpr	%r19, 0x0e8f, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1927649  ! 654: WRPR_GL_I	wrpr	%r9, 0x1649, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa197f7e7  ! 656: WRPR_GL_I	wrpr	%r31, 0x17e7, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19264ea  ! 658: WRPR_GL_I	wrpr	%r9, 0x04ea, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1957969  ! 660: WRPR_GL_I	wrpr	%r21, 0x1969, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa194a9a9  ! 662: WRPR_GL_I	wrpr	%r18, 0x09a9, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa192a931  ! 664: WRPR_GL_I	wrpr	%r10, 0x0931, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa194e7b6  ! 666: WRPR_GL_I	wrpr	%r19, 0x07b6, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa192331c  ! 668: WRPR_GL_I	wrpr	%r8, 0x131c, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa197ae9c  ! 670: WRPR_GL_I	wrpr	%r30, 0x0e9c, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa196b3f8  ! 672: WRPR_GL_I	wrpr	%r26, 0x13f8, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa193f133  ! 674: WRPR_GL_I	wrpr	%r15, 0x1133, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa194ef49  ! 676: WRPR_GL_I	wrpr	%r19, 0x0f49, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa195e61b  ! 678: WRPR_GL_I	wrpr	%r23, 0x061b, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1947c35  ! 680: WRPR_GL_I	wrpr	%r17, 0x1c35, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1936458  ! 682: WRPR_GL_I	wrpr	%r13, 0x0458, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1922457  ! 684: WRPR_GL_I	wrpr	%r8, 0x0457, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa193e37d  ! 686: WRPR_GL_I	wrpr	%r15, 0x037d, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1942765  ! 688: WRPR_GL_I	wrpr	%r16, 0x0765, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa197b5ab  ! 690: WRPR_GL_I	wrpr	%r30, 0x15ab, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa194a7ba  ! 692: WRPR_GL_I	wrpr	%r18, 0x07ba, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1937b95  ! 694: WRPR_GL_I	wrpr	%r13, 0x1b95, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa197b320  ! 696: WRPR_GL_I	wrpr	%r30, 0x1320, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1972e14  ! 698: WRPR_GL_I	wrpr	%r28, 0x0e14, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19660e4  ! 700: WRPR_GL_I	wrpr	%r25, 0x00e4, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa194b4ba  ! 702: WRPR_GL_I	wrpr	%r18, 0x14ba, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1953f26  ! 704: WRPR_GL_I	wrpr	%r20, 0x1f26, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa192baa0  ! 706: WRPR_GL_I	wrpr	%r10, 0x1aa0, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa195b284  ! 708: WRPR_GL_I	wrpr	%r22, 0x1284, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa192a500  ! 710: WRPR_GL_I	wrpr	%r10, 0x0500, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1953d60  ! 712: WRPR_GL_I	wrpr	%r20, 0x1d60, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1943d83  ! 714: WRPR_GL_I	wrpr	%r16, 0x1d83, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1933dd1  ! 716: WRPR_GL_I	wrpr	%r12, 0x1dd1, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa197eda7  ! 718: WRPR_GL_I	wrpr	%r31, 0x0da7, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa19638c1  ! 720: WRPR_GL_I	wrpr	%r24, 0x18c1, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa195aebd  ! 722: WRPR_GL_I	wrpr	%r22, 0x0ebd, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa196e233  ! 724: WRPR_GL_I	wrpr	%r27, 0x0233, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19321b6  ! 726: WRPR_GL_I	wrpr	%r12, 0x01b6, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa197e4c1  ! 728: WRPR_GL_I	wrpr	%r31, 0x04c1, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1946b16  ! 730: WRPR_GL_I	wrpr	%r17, 0x0b16, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa197fa82  ! 732: WRPR_GL_I	wrpr	%r31, 0x1a82, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1947470  ! 734: WRPR_GL_I	wrpr	%r17, 0x1470, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa197250c  ! 736: WRPR_GL_I	wrpr	%r28, 0x050c, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa195327d  ! 738: WRPR_GL_I	wrpr	%r20, 0x127d, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa197bb63  ! 740: WRPR_GL_I	wrpr	%r30, 0x1b63, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa195b5ff  ! 742: WRPR_GL_I	wrpr	%r22, 0x15ff, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa196f653  ! 744: WRPR_GL_I	wrpr	%r27, 0x1653, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa193e2a5  ! 746: WRPR_GL_I	wrpr	%r15, 0x02a5, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa193b803  ! 748: WRPR_GL_I	wrpr	%r14, 0x1803, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa193bb4c  ! 750: WRPR_GL_I	wrpr	%r14, 0x1b4c, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1966b93  ! 752: WRPR_GL_I	wrpr	%r25, 0x0b93, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa196a57e  ! 754: WRPR_GL_I	wrpr	%r26, 0x057e, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19667a8  ! 756: WRPR_GL_I	wrpr	%r25, 0x07a8, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa193ed0c  ! 758: WRPR_GL_I	wrpr	%r15, 0x0d0c, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa197e2ab  ! 760: WRPR_GL_I	wrpr	%r31, 0x02ab, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa194b399  ! 762: WRPR_GL_I	wrpr	%r18, 0x1399, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1972913  ! 764: WRPR_GL_I	wrpr	%r28, 0x0913, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa19531d4  ! 766: WRPR_GL_I	wrpr	%r20, 0x11d4, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1952530  ! 768: WRPR_GL_I	wrpr	%r20, 0x0530, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa195ea9e  ! 770: WRPR_GL_I	wrpr	%r23, 0x0a9e, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa195fea9  ! 772: WRPR_GL_I	wrpr	%r23, 0x1ea9, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa19261c9  ! 774: WRPR_GL_I	wrpr	%r9, 0x01c9, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa193aa99  ! 776: WRPR_GL_I	wrpr	%r14, 0x0a99, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1943748  ! 778: WRPR_GL_I	wrpr	%r16, 0x1748, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa193f642  ! 780: WRPR_GL_I	wrpr	%r15, 0x1642, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1942577  ! 782: WRPR_GL_I	wrpr	%r16, 0x0577, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1946ddc  ! 784: WRPR_GL_I	wrpr	%r17, 0x0ddc, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa197f33e  ! 786: WRPR_GL_I	wrpr	%r31, 0x133e, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1972c79  ! 788: WRPR_GL_I	wrpr	%r28, 0x0c79, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa196b8ae  ! 790: WRPR_GL_I	wrpr	%r26, 0x18ae, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa194b823  ! 792: WRPR_GL_I	wrpr	%r18, 0x1823, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1937e98  ! 794: WRPR_GL_I	wrpr	%r13, 0x1e98, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa196f7eb  ! 796: WRPR_GL_I	wrpr	%r27, 0x17eb, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19232dc  ! 798: WRPR_GL_I	wrpr	%r8, 0x12dc, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19624ca  ! 800: WRPR_GL_I	wrpr	%r24, 0x04ca, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa19739b3  ! 802: WRPR_GL_I	wrpr	%r28, 0x19b3, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa195b9db  ! 804: WRPR_GL_I	wrpr	%r22, 0x19db, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa195e0d1  ! 806: WRPR_GL_I	wrpr	%r23, 0x00d1, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa196b922  ! 808: WRPR_GL_I	wrpr	%r26, 0x1922, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa194aa35  ! 810: WRPR_GL_I	wrpr	%r18, 0x0a35, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa197666d  ! 812: WRPR_GL_I	wrpr	%r29, 0x066d, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa197f876  ! 814: WRPR_GL_I	wrpr	%r31, 0x1876, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1942d9d  ! 816: WRPR_GL_I	wrpr	%r16, 0x0d9d, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa192b819  ! 818: WRPR_GL_I	wrpr	%r10, 0x1819, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1966a2d  ! 820: WRPR_GL_I	wrpr	%r25, 0x0a2d, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa196f683  ! 822: WRPR_GL_I	wrpr	%r27, 0x1683, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa196f002  ! 824: WRPR_GL_I	wrpr	%r27, 0x1002, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa197799a  ! 826: WRPR_GL_I	wrpr	%r29, 0x199a, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa195f1a7  ! 828: WRPR_GL_I	wrpr	%r23, 0x11a7, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa193fb78  ! 830: WRPR_GL_I	wrpr	%r15, 0x1b78, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa196356c  ! 832: WRPR_GL_I	wrpr	%r24, 0x156c, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa194b5d8  ! 834: WRPR_GL_I	wrpr	%r18, 0x15d8, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa192f9f2  ! 836: WRPR_GL_I	wrpr	%r11, 0x19f2, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa197a20e  ! 838: WRPR_GL_I	wrpr	%r30, 0x020e, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa193f61f  ! 840: WRPR_GL_I	wrpr	%r15, 0x161f, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa197e3e9  ! 842: WRPR_GL_I	wrpr	%r31, 0x03e9, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa195f528  ! 844: WRPR_GL_I	wrpr	%r23, 0x1528, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa192a743  ! 846: WRPR_GL_I	wrpr	%r10, 0x0743, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa195f8fd  ! 848: WRPR_GL_I	wrpr	%r23, 0x18fd, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19425fd  ! 850: WRPR_GL_I	wrpr	%r16, 0x05fd, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa192bf23  ! 852: WRPR_GL_I	wrpr	%r10, 0x1f23, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa193b4af  ! 854: WRPR_GL_I	wrpr	%r14, 0x14af, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa194e075  ! 856: WRPR_GL_I	wrpr	%r19, 0x0075, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1936f8a  ! 858: WRPR_GL_I	wrpr	%r13, 0x0f8a, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1923e22  ! 860: WRPR_GL_I	wrpr	%r8, 0x1e22, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1922c80  ! 862: WRPR_GL_I	wrpr	%r8, 0x0c80, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa196b150  ! 864: WRPR_GL_I	wrpr	%r26, 0x1150, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1976e80  ! 866: WRPR_GL_I	wrpr	%r29, 0x0e80, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1973c1e  ! 868: WRPR_GL_I	wrpr	%r28, 0x1c1e, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1966a20  ! 870: WRPR_GL_I	wrpr	%r25, 0x0a20, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa193edc0  ! 872: WRPR_GL_I	wrpr	%r15, 0x0dc0, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19224f1  ! 874: WRPR_GL_I	wrpr	%r8, 0x04f1, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa194b8a5  ! 876: WRPR_GL_I	wrpr	%r18, 0x18a5, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1937cf2  ! 878: WRPR_GL_I	wrpr	%r13, 0x1cf2, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1953c85  ! 880: WRPR_GL_I	wrpr	%r20, 0x1c85, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa192a734  ! 882: WRPR_GL_I	wrpr	%r10, 0x0734, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa193b808  ! 884: WRPR_GL_I	wrpr	%r14, 0x1808, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa197b852  ! 886: WRPR_GL_I	wrpr	%r30, 0x1852, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1922221  ! 888: WRPR_GL_I	wrpr	%r8, 0x0221, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa195e073  ! 890: WRPR_GL_I	wrpr	%r23, 0x0073, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa197f737  ! 892: WRPR_GL_I	wrpr	%r31, 0x1737, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19360c8  ! 894: WRPR_GL_I	wrpr	%r13, 0x00c8, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19437c0  ! 896: WRPR_GL_I	wrpr	%r16, 0x17c0, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1937d9b  ! 898: WRPR_GL_I	wrpr	%r13, 0x1d9b, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa197fd93  ! 900: WRPR_GL_I	wrpr	%r31, 0x1d93, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1927770  ! 902: WRPR_GL_I	wrpr	%r9, 0x1770, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa194f1e3  ! 904: WRPR_GL_I	wrpr	%r19, 0x11e3, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa193a7cd  ! 906: WRPR_GL_I	wrpr	%r14, 0x07cd, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa192ecd9  ! 908: WRPR_GL_I	wrpr	%r11, 0x0cd9, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa192ed07  ! 910: WRPR_GL_I	wrpr	%r11, 0x0d07, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa193f088  ! 912: WRPR_GL_I	wrpr	%r15, 0x1088, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa195af63  ! 914: WRPR_GL_I	wrpr	%r22, 0x0f63, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1942069  ! 916: WRPR_GL_I	wrpr	%r16, 0x0069, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1976750  ! 918: WRPR_GL_I	wrpr	%r29, 0x0750, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1923e63  ! 920: WRPR_GL_I	wrpr	%r8, 0x1e63, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1952922  ! 922: WRPR_GL_I	wrpr	%r20, 0x0922, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa193a465  ! 924: WRPR_GL_I	wrpr	%r14, 0x0465, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa193e190  ! 926: WRPR_GL_I	wrpr	%r15, 0x0190, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa195e490  ! 928: WRPR_GL_I	wrpr	%r23, 0x0490, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa197be05  ! 930: WRPR_GL_I	wrpr	%r30, 0x1e05, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1923a8e  ! 932: WRPR_GL_I	wrpr	%r8, 0x1a8e, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa195b279  ! 934: WRPR_GL_I	wrpr	%r22, 0x1279, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa197ab45  ! 936: WRPR_GL_I	wrpr	%r30, 0x0b45, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa193eb24  ! 938: WRPR_GL_I	wrpr	%r15, 0x0b24, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa192ec61  ! 940: WRPR_GL_I	wrpr	%r11, 0x0c61, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa197e643  ! 942: WRPR_GL_I	wrpr	%r31, 0x0643, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa193a86a  ! 944: WRPR_GL_I	wrpr	%r14, 0x086a, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19734ff  ! 946: WRPR_GL_I	wrpr	%r28, 0x14ff, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1966fa1  ! 948: WRPR_GL_I	wrpr	%r25, 0x0fa1, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa195a5b2  ! 950: WRPR_GL_I	wrpr	%r22, 0x05b2, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa193366f  ! 952: WRPR_GL_I	wrpr	%r12, 0x166f, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa194249b  ! 954: WRPR_GL_I	wrpr	%r16, 0x049b, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19638d3  ! 956: WRPR_GL_I	wrpr	%r24, 0x18d3, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa193b2f1  ! 958: WRPR_GL_I	wrpr	%r14, 0x12f1, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa193305c  ! 960: WRPR_GL_I	wrpr	%r12, 0x105c, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa195adc1  ! 962: WRPR_GL_I	wrpr	%r22, 0x0dc1, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1942696  ! 964: WRPR_GL_I	wrpr	%r16, 0x0696, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa196ad6c  ! 966: WRPR_GL_I	wrpr	%r26, 0x0d6c, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1936dce  ! 968: WRPR_GL_I	wrpr	%r13, 0x0dce, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa197f6cf  ! 970: WRPR_GL_I	wrpr	%r31, 0x16cf, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa195e1fd  ! 972: WRPR_GL_I	wrpr	%r23, 0x01fd, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1956a78  ! 974: WRPR_GL_I	wrpr	%r21, 0x0a78, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa19370bf  ! 976: WRPR_GL_I	wrpr	%r13, 0x10bf, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa194fca2  ! 978: WRPR_GL_I	wrpr	%r19, 0x1ca2, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa195b280  ! 980: WRPR_GL_I	wrpr	%r22, 0x1280, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa194ad59  ! 982: WRPR_GL_I	wrpr	%r18, 0x0d59, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa192fd91  ! 984: WRPR_GL_I	wrpr	%r11, 0x1d91, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa196fe5a  ! 986: WRPR_GL_I	wrpr	%r27, 0x1e5a, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa192b797  ! 988: WRPR_GL_I	wrpr	%r10, 0x1797, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1946180  ! 990: WRPR_GL_I	wrpr	%r17, 0x0180, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa195ab43  ! 992: WRPR_GL_I	wrpr	%r22, 0x0b43, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1926ae6  ! 994: WRPR_GL_I	wrpr	%r9, 0x0ae6, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa196650b  ! 996: WRPR_GL_I	wrpr	%r25, 0x050b, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa194b57f  ! 998: WRPR_GL_I	wrpr	%r18, 0x157f, %-

join_lbl_0_0:
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 4, 16, 16)) -> intp(1, 1, 1)
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 8, 16, 16)) -> intp(2, 1, 1)
!		$EV trig_pc_d(1,expr(@VA(.RED_EXT_SEC.HRedmode_Reset_Handler) + 12, 16, 16)) -> intp(3, 1, 1)



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
!!#   IJ_bind_thread_group("diag.j", 17, th_all,    0xf);
!!# 
!!#   IJ_set_rvar ("diag.j", 19, Rv_rand64, "64'hrrrr rrrr rrrr rrrr");
!!# 
!!#   IJ_set_ropr_fld ("diag.j", 21, ijdefault, Ft_Rs1, "{8..31}");
!!#   IJ_set_ropr_fld ("diag.j", 22, ijdefault, Ft_Rs2, "{16..23}");
!!#   IJ_set_ropr_fld ("diag.j", 23, ijdefault, Ft_Simm13, "13'br rrrr rrrr rrrr");
!!#   IJ_set_ropr_fld ("diag.j", 24, ijdefault, Ft_Rd, "{16..23}");
!!# 
!!#   IJ_init_regs_by_setx ("diag.j", 26, th_all, 2, 1, Rv_rand64);
!!# 
!!#   IJ_th_fork("diag.j", 29,0x2, 0x4, 0x8, -1);;
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
!!#   IJ_th_join("diag.j", 35,0xf);
!!#   IJ_th_start ("diag.j", 36,Seq_Start, NULL, 1);
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
!!# 	change_priv write_gl
!!# 	{
!!# 		IJ_generate_va ("diag.j", 70,th_all, $1, $2, -1);;
!!# 	};
!!# 
!!# change_priv:
!!# 	tCHANGE_PRIV	
!!# 	| tCHANGE_NONPRIV
!!# ;
!!# 
!!# write_gl:
!!# 	  tWRPR_GL_I
!!# ;
!!# 
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
