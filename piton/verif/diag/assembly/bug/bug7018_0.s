// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: bug7018_0.s
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
   random seed:	246973766
   Jal fakedma_1th.j:	
********************************************************************************/


#define CIOP

#define PCONTEXT 0x44
#define SCONTEXT 0x44

#define THREAD_MASK 0x1
#define NO_TRAPCHECK
#include "enable_traps.h"
#include "hboot.s"

.text
.global main

main:

        setx  0x120920e7ba3f267a, %r1, %r1
        setx  0x034c9950b0c59fe3, %r1, %r2
        setx  0x3567986eda503234, %r1, %r3
        setx  0x91019bbf841acbfc, %r1, %r4
        setx  0xd174baff071c7443, %r1, %r5
        setx  0x3479b24371182960, %r1, %r6
        setx  0x977dbebf8e9992ff, %r1, %r7
        setx  0xb6d8a62c36b4c4e6, %r1, %r8
        setx  0x267d034067afb9cd, %r1, %r9
        setx  0x09961a66845044a3, %r1, %r10
        setx  0x90813a1cee6584f4, %r1, %r11
        setx  0xc8ec49f9efd169a4, %r1, %r12
        setx  0x07feaa61915b0f6e, %r1, %r13
        setx  0xc47ecc51d8b3a1c7, %r1, %r14
        setx  0xb2b7d1a6b3dbbad7, %r1, %r15
        setx  0xbf6ea851c4db0aa2, %r1, %r16
        setx  0x1dfbe392435da08b, %r1, %r17
        setx  0x37a03e48994e7605, %r1, %r18
        setx  0x1d855a11d086176b, %r1, %r19
        setx  0xb3f48d307305afc0, %r1, %r20
        setx  0x24f7c2434b853e8a, %r1, %r21
        setx  0x6d3ae94d8b9a8251, %r1, %r22
        setx  0x2eac920a1c2d80a2, %r1, %r23
        setx  0xffd1be677303c1b3, %r1, %r24
        setx  0x29fea30c86b925cb, %r1, %r25
        setx  0x46aa216b9cbf887d, %r1, %r26
        setx  0x1c760366d3810fbf, %r1, %r27
        setx  0x316a32e0f78eddc7, %r1, %r28
        setx  0x90bebba4acc216d4, %r1, %r29
        setx  0x66c2982cf756a584, %r1, %r30
        setx  0xeac8b0d2a16ddcb7, %r1, %r31
        setx  0x00000000000009e0, %r1, %r2
	setx shared_data, %r1, %r16
        wr %g0, 0x80, %asi
        wr %g0, 0x4, %fprs
	ldd	[%r16 + 0], %f0
	ldd	[%r16 + 8], %f2
	ldd	[%r16 + 16], %f4
	ldd	[%r16 + 24], %f6
	ldd	[%r16 + 32], %f8
	ldd	[%r16 + 40], %f10
	ldd	[%r16 + 48], %f12
	ldd	[%r16 + 56], %f14
	ldd	[%r16 + 64], %f16
	ldd	[%r16 + 72], %f18
	ldd	[%r16 + 80], %f20
	ldd	[%r16 + 88], %f22
	ldd	[%r16 + 96], %f24
	ldd	[%r16 + 104], %f26
	ldd	[%r16 + 112], %f28
	ldd	[%r16 + 120], %f30
	ldd	[%r16 + 128], %f32
	ldd	[%r16 + 136], %f34
	ldd	[%r16 + 144], %f36
	ldd	[%r16 + 152], %f38
	ldd	[%r16 + 160], %f40
	ldd	[%r16 + 168], %f42
	ldd	[%r16 + 176], %f44
	ldd	[%r16 + 184], %f46
	ldd	[%r16 + 192], %f48
	ldd	[%r16 + 200], %f50
	ldd	[%r16 + 208], %f52
	ldd	[%r16 + 216], %f54
	ldd	[%r16 + 224], %f56
	ldd	[%r16 + 232], %f58
	ldd	[%r16 + 240], %f60
	ldd	[%r16 + 248], %f62
	setx thr0_data_seg, %r1, %r5
	setx thr0_inst_seg, %r1, %r31
	jmp  %r31
	nop
	nop
	nop
	nop
	nop
	ta    T_GOOD_TRAP

.global fail
fail:
	nop
	nop
	ta    T_BAD_TRAP

	nop
	nop

.data

shared_data:
	.word  0xbfccbfe8,0x59ad3dce,0xc6ba6540,0xaaa517e3
	.word  0xac75866f,0x0bd04ca8,0x07bfe2c1,0x2c0a6f50
	.word  0x2f5eec8d,0x05665052,0x49279c83,0xd15fee9c
	.word  0x4d1865c3,0x91f38fa4,0x403778dd,0x6d803219
	.word  0xe71840ea,0x5b04a49b,0x4140b230,0x81bbb459
	.word  0x15ee5c03,0x37da86fb,0x0f1605ca,0xba1cbd90
	.word  0x8329b57c,0x52e862b9,0xb141a8f9,0xc2231b7b
	.word  0xaf545b13,0x5aa61085,0xee4b0f12,0x2ecbec38
	.word  0x27f84838,0xc27b556b,0x16ce8fee,0x9b9b35cd
	.word  0xcee1a50d,0x4dcff542,0x8cba6373,0x67e41d20
	.word  0x99c54c3b,0xf143bc6e,0x2537b6f2,0xa9a08b08
	.word  0xdc3f4d4f,0xc2f146c5,0xbfaefdfc,0x4a5d0ac5
	.word  0x766df92f,0x2a448990,0x515e2e35,0xe1bbf512
	.word  0x33ecfcb1,0xb878bd43,0x978f7519,0x1c833515
	.word  0x348f8d5c,0x955ebf79,0x7d82a18f,0x60469553
	.word  0x3b937c3b,0xce6cda81,0x2686b719,0x83e35149
	.word  0x74e17bfe,0xa05a5a53,0xae9e0392,0xec67bfa4
	.word  0x3b41675d,0x1b9728db,0x21567067,0xc6883e7a
	.word  0xdc803a3c,0x3c22109b,0xf3b67c5b,0xcb8987ec
	.word  0x9c55d290,0xb99874fc,0x50ebcbf3,0x03201daa
	.word  0x14928c65,0x6d1b2e0e,0x66978bdc,0xc6ff1c1d
	.word  0x37536fd8,0x47de0b8d,0x18d9118d,0xe04096ca
	.word  0x6ad2a2aa,0x1f6ce12b,0x7cb28e9f,0x9038e5e5
	.word  0xb669479f,0xef615a2c,0x426eff39,0x3ca61e0e
	.word  0xf742a954,0xb79232b1,0xf649241f,0xe3efe90b
	.word  0xe2dacfe9,0xb870432f,0xeff1047d,0x73077b42
	.word  0xc4960782,0xde5010f9,0xf3aafaa5,0xf9f3aaf6
	.word  0x93942b92,0xdad04642,0xa94a18a8,0x1a10e836
	.word  0xbceb2f65,0x5ac3a345,0x1701fc90,0xd9119c12
	.word  0x4b4abd64,0xcbe47c72,0x0d45d2e7,0x0b130a81
	.word  0x57835aae,0xb72fe203,0x2d5e8bb1,0x3a0b8bcd
	.word  0x974ca6fc,0x669bc07c,0x45a74a41,0x96adf1a5
	.word  0x5e602b0a,0xe1b00d6b,0x50a7491f,0xaef7a14a
	.word  0xe3799462,0x73609117,0x1c3bfcdd,0x1abe0d0b
	.word  0x9d84a160,0x33d231f3,0x47259e7d,0x8b34f80c
	.word  0xb0d6a265,0x831254d2,0x15ed4e84,0x46cb45e0
	.word  0x1de5a986,0xc14d885b,0x29702e2a,0x93d1ee88
	.word  0x15848821,0x1c14e064,0x3205d94b,0x1d0fe78f
	.word  0xe63d1233,0x3a57107d,0xf84ed835,0xd48e7e25
	.word  0x79f42aa9,0xc0e02ff2,0x8a15b315,0xfbba2219
	.word  0x3abe29e0,0xa75fbc42,0x40449dd9,0x82ffa27a
	.word  0xc832b7b6,0xd4743d8e,0xf2e6d5e4,0xc707e297
	.word  0x976c15d7,0xb55ad288,0x347c5dc1,0x4ba6fd27
	.word  0xfb4262e5,0xb0fb2d25,0x21de4b2d,0x053f89bd
	.word  0x9d1bb897,0x7d51a5ee,0x33e82905,0xef4642e7
	.word  0x2f66e347,0x9193ab0d,0x9a66bb22,0xd666556c
	.word  0x6f79d1fd,0x7513e601,0xf5f69496,0xf0d8f05e
	.word  0x8d472f0e,0xb26ae48f,0x56928122,0xe715e5af
	.word  0xadad3bf7,0x24d77809,0x0ea94e5a,0x3fca0360
	.word  0xa0223b62,0x1ffa8186,0x73ea12e4,0x0c2b4bdb
	.word  0x4a9b56ed,0xc52df5bc,0x320446dc,0x8b47971d
	.word  0x51be2fdc,0x50265d46,0xa17bf23b,0x27adbaa9
	.word  0x0c081e45,0x04a8469e,0x66e019e9,0x41823182
	.word  0x5e94c2ea,0xd7c02f6f,0x00aaaa4a,0x03836535
	.word  0xebb4ab5e,0x3c8f283c,0x396a4fd8,0x437ad421
	.word  0x1ff31fcc,0x031aa4a2,0x2eab062f,0xaf3af191
	.word  0x7591cac1,0xafba84bd,0xeaac2a8f,0x1c319eb3
	.word  0x5a99cfbf,0x71e1f00f,0x8ba37478,0xa8687c98
	.word  0xd5044cce,0x32a2fab4,0x40a053e9,0x31386f28
	.word  0xdc7b430a,0x28991ce8,0x638d1005,0x805c5330
	.word  0xdefdf144,0x70851908,0xc41a25ed,0xe8827593
	.word  0x026d89b1,0x4f8f623e,0x9b4a732b,0xda5bd3c3
	.word  0xca9904c6,0xe7f5ba80,0xb093f66d,0x611781d8
	.word  0xd5a28387,0xbe9b3413,0xfb6adaed,0x1bf27844
	.word  0x90195ae8,0x46817ef2,0x35073f97,0x0a3ec45a
	.word  0xa8f9ae22,0x248069f5,0x373dd21d,0x61ac9d71
	.word  0xd40ef72f,0x34214a7d,0xce1005e3,0xad5461f0
	.word  0x7494a7e5,0x68abd237,0xdd0dbb68,0x96afb4b7
	.word  0x895080f5,0x1fd229d0,0x72470f6d,0xccc7d1a6
	.word  0xdfd442b5,0x4dbfc383,0xfc72fc51,0x6d500c97
	.word  0xc2bb0260,0x1bea38f4,0x70fba992,0x4279c854
	.word  0x5409ccc8,0x23b5456e,0x0f8b935d,0x70ee2a65
	.word  0xf22a06f2,0x2de5fac9,0x80ab51d0,0x97b07447
	.word  0x1c18ede5,0x0223bff9,0x5492c69c,0x95e968e5
	.word  0xdb5edaae,0xd93447aa,0x2d6ad54c,0x1ad6c340
	.word  0xfde15030,0xadc6fccc,0x975c0d09,0xce99dbb7
	.word  0x8303ee82,0x1e2dc2c8,0xcc21fc56,0xa4a47f64
	.word  0x8ea3de85,0x5484ba91,0xb03bf918,0x07254a69
	.word  0x73d1d852,0xf56b24c1,0xb0536c66,0x5b0b1cc0
	.word  0x34246efe,0x7a8411e9,0x3bc82ca9,0x10f8fb82
	.word  0xb8fde6a9,0xea467cb3,0xafd9c9c6,0x6e75fc68
	.word  0x16d28dad,0xd710e888,0x184510f4,0xc67a9e70
	.word  0xcc74c5f4,0xdf4e685b,0xd4510772,0x4575f906
	.word  0x2e3b99db,0x05761af8,0x79a3475a,0xcbd28af7
	.word  0xca4a4f0c,0x8377fc4a,0xd31b777a,0xf54ed078
	.word  0x3e661a0f,0xd68438fe,0x5c53df61,0xca521ca9
	.word  0xd16d76ab,0x8cc590ac,0xd394f098,0xae0467c1
	.word  0x8aaae1e8,0x736d23c5,0x9ff3dcc6,0xf801f6e7
	.word  0x6f38b7db,0x9c9827f7,0x50ef3133,0xafb423e0
	.word  0x684f5750,0x0c7495db,0x83d24971,0x50121e2f
	.word  0x2036ab86,0x27cf120e,0x3363c1f5,0x4e424fb2
	.word  0x84bebab9,0xeac7e90c,0x920f5690,0x6483546c
	.word  0x39f095a5,0x2b559a1c,0x4ce2a39a,0x95946ec7
	.word  0x9c6e8c61,0xfda9d67c,0x54601b00,0xf942b8f0
	.word  0x4e913c23,0x5f8ab86c,0x95d2f23a,0x0b5dddac
	.word  0x0851640a,0x18d14b51,0x9fddb363,0xbe719ef6
	.word  0x8715227c,0xe2148e11,0x10d31b33,0x76ca53d5
	.word  0x30e82b87,0x8ff07c0a,0x04b61aa8,0x067d8c64
	.word  0xa13e976e,0x730e2eae,0x89a332b9,0x4a486728
	.word  0xac8adc74,0xf20739cc,0x33feec68,0xa121356a
	.word  0x8c06b520,0x61189b0c,0xa679501a,0x3388ede0
	.word  0x1f28d604,0xb36f60a8,0x8472710f,0x1c749a97
	.word  0x6103399f,0x325dc32c,0x7bbc2fe8,0xce65ff26
	.word  0x0bc1ef71,0x05112bd0,0x8cdf80fb,0x7858ae11
	.word  0x45a813c6,0x87b00ab5,0x4f9335d3,0x56af3c59
	.word  0xf153ad71,0xeafe0b50,0xb325c015,0xcf69dd28
	.word  0xba0e0d77,0x5b89f841,0x6b1d839a,0xa439dbcf
	.word  0x37e7e7af,0x6376ca00,0x71282711,0x6a3fb072
	.word  0x9bebcab5,0x518e6464,0xa8336abc,0x038405d7
	.word  0xa5353b53,0x986697d5,0x2de0f4bd,0xc9d5b0d7
	.word  0x24962b92,0x1caca40d,0xe08cce83,0x979fc3d8
	.word  0x12987773,0x58d27d3b,0x6b2a3e1e,0xf18e3fd5
	.word  0x7f81d041,0x85c5643f,0xe0014a39,0xfdfb9332
	.word  0x5866e406,0xb9979785,0x62ac4fc8,0x7e7bce66
	.word  0xbd25007c,0x7efd5c55,0xca37ea3f,0x2e20de37
	.word  0x5d7d5e47,0xcce3034e,0x09a7845f,0x40287d40
	.word  0x8d22b31d,0x5d3af2b4,0x5da6f04e,0xd420845a
	.word  0x674f485d,0x68602a5e,0xe2025545,0x64a26390
	.word  0x9687a795,0xc50b308e,0xa6acaa5e,0x0f0e1a8c
	.word  0x9fd39b89,0x8ae1f7a7,0xd19dde1d,0x9df3a178
	.word  0x3214979f,0xb81c968a,0x5f03d055,0xb3e4a0a2
	.word  0xb472bcd6,0xa22912b7,0x81c9116f,0x7e67f103
	.word  0xbdc07db9,0x7e8b7e50,0x4f7b03f8,0xeedc2d1b
	.word  0xd0562882,0x42215f7f,0x32e5d829,0x30d6a4ae
	.word  0x80cc9798,0x67cedd3c,0x7d0a35d6,0xe14a43e9
	.word  0xd77b223a,0x3bb2d64e,0x8adcacc3,0xdd0aea2a
	.word  0xc5596f44,0x1e2862ec,0x22bfcf01,0x52138c35
	.word  0x9bc13aea,0xf5cbbf6e,0x9bc583bf,0xd6300608
	.word  0xa0d77131,0x58da5944,0x099125c2,0x41e9370a
	.word  0x46dd6f91,0x451b8de0,0xbddf3dc2,0xce0d03e1
	.word  0x8c3e5a30,0x2e2ef922,0xf963f1e2,0x6ed45d6f
	.word  0x7a33c641,0x6f885d4c,0x0f192bd4,0x5d6869e3
	.word  0xc777f0d2,0x66fb4d47,0xd5b7d97a,0x80f94a27
	.word  0x5f659d45,0x2df3ea19,0xf106e838,0xd5b45faa
	.word  0x73e36dd1,0x19fded06,0xb7bcc2d0,0x1445e75f
	.word  0x23e2bfcd,0x6c802b47,0x1a154172,0x3b13db80
	.word  0xebf631ef,0x3bad6607,0xc84e82a4,0xa6c092c2
	.word  0xc3470d09,0x745543a6,0x030d74d0,0xc2d2ebe4
	.word  0xd2636809,0x65ff0759,0x983cff7c,0xfa700876
	.word  0x4e94d8b8,0x1328145c,0x0d4eee7b,0xe446fcc8
	.word  0xbe87c5bc,0xbf016d79,0x38eb6d71,0xddfafb0e
	.word  0x666fe9d2,0x32599937,0xe1ac9e85,0x0dc24c56
	.word  0xdd745dc0,0x36ae839c,0xb4a7a670,0x0180b661
	.word  0x53254d13,0x4b059ff4,0x2b5306a3,0xa619acd2
	.word  0x602c3c58,0xfb87c16e,0x8ba146fa,0x96be4774
	.word  0xd0bb5fab,0x6d0d1d7d,0x7228e83d,0x94466e84
	.word  0xb8cb1f89,0x48eae1c7,0xb93314ab,0xcf4b9ba3
	.word  0x82638f4d,0x318a1419,0x161d2073,0x9901654c
	.word  0xd81ea4f5,0x76c731c9,0xb9898082,0x41869887
	.word  0x9d1143b7,0x0cf2b045,0x2ce0c6a0,0xce3e8f15
	.word  0x277c949b,0xe9550f1e,0xd51758a0,0xec57d189
	.word  0x0d63c63a,0x7153c883,0xb54f3715,0x12aba4af
	.word  0xf04629ed,0x59ea50e0,0x89746ae3,0xf6560adb
	.word  0x9290134c,0xb9e31456,0x759b9ce7,0x1cab46e3
	.word  0x39bf4e85,0x513644b4,0x5d5c6b1a,0x789421c0
	.word  0x3114a811,0x56bc183d,0xbf669501,0x7c9e8102
	.word  0x3cb09f78,0x29859789,0x78de4da2,0xa663844c
	.word  0x0a2cfce3,0x1335046a,0x64d5e8d0,0x89c703da
	.word  0xa7a72316,0x2f9686ed,0xe22feb4f,0xf8c64f3e
	.word  0x38cb608e,0x655f1866,0x0b5d03f8,0x0352c14a
	.word  0xd8b5850d,0xe84cfefb,0x0aed223e,0xf4b3daa0
	.word  0xa91b7dbc,0x5f9d3cba,0x2b3a60a0,0x0b991c57
	.word  0xa9110e71,0xaf20918f,0xba24a238,0x755d656a
	.word  0x36328f4a,0xdcd3c6ea,0xb8d600f5,0x876d5417
	.word  0x24aa72ee,0x07b95f7a,0x0d41c128,0x1bc326fd
	.word  0xa80289b2,0x46775815,0x67512f0e,0xffbca72d
	.word  0x6ac68297,0x15b25aa0,0x1501bdd9,0x550b4414
	.word  0xd55ae727,0x1deacceb,0x5eb26a64,0x6ae43b74
	.word  0x2462aeb1,0x2ef7c2aa,0xb06463c2,0xeb049bf8
	.word  0x146d8221,0x7ce2c8a6,0x08a6d240,0xa6783063
	.word  0x977446c1,0x78bef30e,0x4e7853a3,0x95cdbe81
	.word  0xd48f27d0,0x0a7ed028,0xddcece8b,0x0fb53719
	.word  0x98b26bfa,0x85b356f8,0xbc866e5e,0x2434cb62
	.word  0x60d8b3a8,0x9185cba7,0xe7adc84a,0x61710743
	.word  0x1148078d,0xe694f3c9,0x7c4fa96e,0xfc9f25bb
	.word  0x96877c99,0xb34cf8d7,0xb48a2722,0x5bae9547
	.word  0xc4477c59,0xbea4cc36,0x2a4338c4,0x0edcd438
	.word  0xfc1e9323,0x8a678952,0x437e27f7,0xd8cbf787
	.word  0x43226735,0x6165e509,0xc0d75fcd,0x4295732b
	.word  0xba8d3645,0xf7a4265c,0x26fa7cb8,0x2cae0014
	.word  0xa2ec9064,0xe6af29be,0x132432f9,0x7790a837
	.word  0xae635a20,0x15538ff2,0x34e94d19,0xd0a64d2a
	.word  0xca06f339,0xc6648371,0x5d01574d,0x21e0694a
	.word  0x18c9910f,0x0cb14226,0xf7ccd09b,0xa8e43d6c
	.word  0x248dc500,0x8abe3663,0x84c8d973,0x79d18fee
	.word  0xd9c299ca,0xd98f0df6,0xdd20666f,0xe3572ba1
	.word  0x9549cd17,0x9c7c6def,0xd10b7f18,0x5e9e06c5
	.word  0x12b9c036,0x419f0cdd,0xb3eec5dc,0x1e07c92e
	.word  0x68723728,0xd83c079e,0xada3288c,0xab2ef190
	.word  0x367b5f44,0x2fc5c8bf,0x2e5700c7,0x7212e54f
	.word  0x731ced88,0x16b4f289,0x25906702,0xb510e19b
	.word  0xb3a8b2e8,0xdc4a6920,0x03c82164,0xc9444665
	.word  0xa4ed6726,0xb06ca374,0xc107939b,0x6593a7b5
	.word  0xd39d8cc0,0x415a8bd4,0x76aed355,0xcfe5c6de
	.word  0x9b11a394,0xcbc94f0d,0x42c3caa8,0x2bc7994a
	.word  0x361d3118,0x1d2c3529,0xd72bd107,0xcac790da
	.word  0xb92e1ccd,0xf0a8dc9a,0x151e2a6d,0xee477ee3
	.word  0x5e31185d,0x4f9fa9cf,0x092498de,0x2dc243ae
	.word  0x0b8b0ab5,0xe89a7cb2,0x94602fd7,0x858e8bf0
	.word  0xc7019c67,0xa59a027b,0xeed1a165,0xadeb5d8e
	.word  0x34152fe5,0x6cd5136c,0x4db810fa,0x1c673c3a
	.word  0xf46aa272,0xa1b0b9d4,0x6c47f30d,0x1343b691
	.word  0x10aee442,0xc0c4e4e8,0xf0476bf7,0x6f532d25
	.word  0x5b0697f2,0x94d48281,0x5356d045,0x1708d25a
	.word  0x78157fb9,0xc36c9074,0xaa8a2d8e,0x9395d169
	.word  0x5f97fffc,0x792064fe,0x465cc420,0x4bb7f40b
	.word  0x7d786ac5,0xcc89bdff,0x48c7001f,0x30dc38f1
	.word  0x4c55b9df,0x3b354a89,0xad9d5e79,0xeb499044
	.word  0xea42c2dd,0xe8b5cc8c,0x0cd95c48,0x35c48f3a
	.word  0xdbce7eaf,0x1e640ad5,0x0d44e154,0x30465f31
	.word  0x0dc6c33d,0xf842a6cc,0x18b19af2,0x9fc301e1
	.word  0xa7dd56a5,0xc188eab6,0x1fc77e43,0x23792c28
	.word  0xd759c0f8,0xe738f333,0x4bb2849d,0x72e0350b
	.word  0xe5f777a6,0x51c25ff6,0x07c7d720,0x4448f55e
	.word  0xa931441e,0xf4cbfd91,0xeae0881b,0x355b5c52
	.word  0x9be309c5,0xd93edd56,0x66228647,0xb09ae412
	.word  0x115d19c9,0xaf82305a,0x5b2bec34,0x18c23661
	.word  0xa030d7e5,0x4cf6f091,0xabf70db8,0x5508040c
	.word  0xf9ddcfbf,0xd57e0c29,0x44c3cb4d,0xb4e0a9fe
	.word  0xc5064316,0x0ad817cd,0x77e516de,0xa9635314
	.word  0xc4594dac,0x6970c808,0xd5bf2d47,0x89f42918
	.word  0x859b91f0,0xef42d3e5,0x00dfb410,0xe217c7b2
	.word  0x7736119e,0xa3d46511,0x4d5ea0ed,0xc788f08a
	.word  0xb30b850b,0x27a5411e,0x4d288452,0x82800e50
	.word  0xc80f2671,0xf1af8f1c,0x4b9e2302,0x247197fe
	.word  0xd77f90ec,0xe2930a2d,0xa3ba96f0,0xce430f48
	.word  0x4772f05b,0x386cd744,0x7ca57f91,0x4ade73a1
	.word  0xe2ab204a,0x713a97a2,0x9dc9305b,0xc62e8610
	.word  0xcb39d465,0x79cb4671,0x03431f71,0xbf297bab
	.word  0xad832e6f,0xa5f14cd5,0x85b83ae0,0x856be04a
	.word  0xa1de10fb,0xc9da4491,0x23c1ce29,0x6fe64cac
	.word  0xdac0da09,0x5ff6564e,0xc87f6aeb,0xc94cfdb6
	.word  0xd9dc188b,0xb417bf15,0x463563ad,0xff1541f7
	.word  0xd8e83c36,0x09bc58a7,0x6e1e0e14,0xa0d5c5be
	.word  0x9759c82c,0xc59c6555,0xa4c77128,0xcf7a26e0
	.word  0x1f640a06,0xcc7ef28e,0x7897b61f,0x9daefb56
	.word  0x3e548560,0x46ac7ea0,0x4480e5a7,0x9d5b2896
	.word  0x39cd28e5,0xa60af6d5,0x8b28cb33,0xcf8541da
	.word  0x1a3c78a3,0xb1e2cd64,0x9760cbbb,0x6e3d8408
	.word  0x91789709,0x16a02653,0xc7d5e0ab,0x5a8c49ac
	.word  0x60a42f9c,0xe7e3ced7,0xa1ab4acf,0x9c53346e
	.word  0x84388b9b,0x3b757ca0,0xb0e1d3ed,0x977765d1
	.word  0x31b9eda2,0xfd408ef7,0x76075bf5,0x25b9c220
	.word  0x16a3285a,0x1ac1f6b8,0xe33aac14,0x94810049
	.word  0x2b60d5e0,0x4ea29b37,0xaa0f0f3e,0x7393edfe
	.word  0x4123120a,0x82765633,0x636031b0,0x78ec77ed
	.word  0xd6fdbd7d,0x14e7a479,0x93063fbe,0xefcd8f5b
	.word  0x07d86fa4,0xd03d97e0,0x18587f88,0x7a55cc58
	.word  0xbbe7aa9a,0x46c9127c,0xec53343a,0x183e0881
	.word  0x18b93542,0x6d246424,0x702f29c4,0xda14756f
	.word  0x1756a24e,0x54c2f224,0x5d93cada,0xc2eb88c4
	.word  0xfa3c0cb0,0x667264c8,0x94f3961b,0x3226cc57
	.word  0xf58f45d5,0xc0dfb6ba,0x260c476d,0xda99d838
	.word  0xe9889250,0xe55afa2d,0x0d062caf,0x357962aa
	.word  0xa37e2ea7,0x55d91bed,0xb41d195b,0x949a41a8
	.word  0x1e7bc325,0xdba9eb06,0x03165375,0x7f37ea53





SECTION .ISEG_0 TEXT_VA = 0x0000000800000000, DATA_VA = 0x000000805eb4e000
attr_text {
	Name	 = .ISEG_0,
	VA	 = 0x0000000800000000,
	RA	 = 0x0000000800000000,
	PA	 = ra2pa(0x0000000800000000,0),
	part_0_i_ctx_nonzero_ps0_tsb,
	part_0_i_ctx_zero_ps0_tsb,
	TTE_Context	 = 0x44,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}


attr_data {
	Name	 = .ISEG_0,
	VA = 0x000000805eb4e000,
	RA = 0x000000805eb4e000,
	PA = 0x000000805eb4e000,
	part_0_d_ctx_nonzero_ps0_tsb,
	part_0_i_ctx_zero_ps0_tsb,
	TTE_Context	 = 0x44,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}


.text
.global thr0_inst_seg
thr0_inst_seg:
	setx  0x0000000000000440, %r1, %r2
	ta T_CHANGE_PRIV
	mov 0x5, %r31
thr0_loop_cnt_0:
	.word 0xd8514002  ! 2: LDSH_R	ldsh	[%r5 + %r2], %r12
	stx %fsr, [%g5 + %g2]
	.word 0xc6ac0442  ! 2: STBA_R	stba	%r3, [%r16 + %r2] 0x22
	membar #Sync
	ldx [%r16 + %g2], %fsr
	.word 0xccf165c8  ! 2: STXA_I	stxa	%r6, [%r5 + 0x05c8] %asi
	.word 0x876c0002  ! 2: SDIVX_R	sdivx	%r16, %r2, %r3
	.word 0xc60c272c  ! 2: LDUB_I	ldub	[%r16 + 0x072c], %r3
	.word 0x87a40922  ! 2: FMULs	fmuls	%f16, %f2, %f3
	membar      #Sync|#MemIssue|#LoadStore
	.word 0xeca40442  ! 2: STWA_R	stwa	%r22, [%r16 + %r2] 0x22
	membar #Sync
	dec %r31
	.word 0xc65c2fe8  ! 2: LDX_I	ldx	[%r16 + 0x0fe8], %r3
	.word 0xeca963ce  ! 2: STBA_I	stba	%r22, [%r5 + 0x03ce] %asi
	.word 0x87ac0a22  ! 2: FCMPs	fcmps	%fcc<n>, %f16, %f2
	.word 0xc64c20fa  ! 2: LDSB_I	ldsb	[%r16 + 0x00fa], %r3
	brnz %r31,thr0_loop_cnt_0
	.word 0xd4ac0542  ! 2: STBA_R	stba	%r10, [%r16 + %r2] 0x2a
	ta T_CHANGE_NONPRIV
	.word 0xc36c0002  ! 3: PREFETCH_R	prefetch	[%r16 + %r2], #one_read
	setx  0x0000000000000d00, %r1, %r2
	ta T_CHANGE_PRIV
	mov 0x7, %r31
thr0_loop_cnt_1:
	.word 0xc6d16ae2  ! 5: LDSHA_I	ldsha	[%r5, + 0x0ae2] %asi, %r3
	stx %fsr, [%g5 + %g2]
	.word 0xe2ac0442  ! 5: STBA_R	stba	%r17, [%r16 + %r2] 0x22
	membar #Sync
	ldx [%r16 + %g2], %fsr
	.word 0xd6316956  ! 5: STH_I	sth	%r11, [%r5 + 0x0956]
	.word 0x86742101  ! 5: UDIV_I	udiv 	%r16, 0x0101, %r3
	.word 0xc6140002  ! 5: LDUH_R	lduh	[%r16 + %r2], %r3
	.word 0x87a40842  ! 5: FADDd	faddd	%f16, %f2, %f34
	membar      #Sync|#MemIssue|#LoadStore
	.word 0xe8ac0442  ! 5: STBA_R	stba	%r20, [%r16 + %r2] 0x22
	membar #Sync
	dec %r31
	.word 0xe2c41002  ! 5: LDSWA_R	ldswa	[%r16, %r2] 0x80, %r17
	.word 0xd6314002  ! 5: STH_R	sth	%r11, [%r5 + %r2]
	.word 0x87ac0a22  ! 5: FCMPs	fcmps	%fcc<n>, %f16, %f2
	.word 0xe24c0002  ! 5: LDSB_R	ldsb	[%r16 + %r2], %r17
	brnz %r31,thr0_loop_cnt_1
	.word 0xc6ac0442  ! 5: STBA_R	stba	%r3, [%r16 + %r2] 0x22
	ta T_CHANGE_NONPRIV
	setx  0x0000000000000b40, %r1, %r2
	ta T_CHANGE_PRIV
	mov 0x6, %r31
thr0_loop_cnt_2:
	.word 0xf8594002  ! 6: LDX_R	ldx	[%r5 + %r2], %r28
	stx %fsr, [%g5 + %g2]
	.word 0xc6ac0562  ! 6: STBA_R	stba	%r3, [%r16 + %r2] 0x2b
	membar #Sync
	ldx [%r16 + %g2], %fsr
	.word 0xf0294002  ! 6: STB_R	stb	%r24, [%r5 + %r2]
	.word 0xa674288e  ! 6: UDIV_I	udiv 	%r16, 0x088e, %r19
	.word 0xf05c2350  ! 6: LDX_I	ldx	[%r16 + 0x0350], %r24
	.word 0x87a409a2  ! 6: FDIVs	fdivs	%f16, %f2, %f3
	membar      #Sync|#MemIssue|#LoadStore
	.word 0xe8ac0562  ! 6: STBA_R	stba	%r20, [%r16 + %r2] 0x2b
	membar #Sync
	dec %r31
	.word 0xc6c42834  ! 6: LDSWA_I	ldswa	[%r16, + 0x0834] %asi, %r3
	.word 0xcca15002  ! 6: STWA_R	stwa	%r6, [%r5 + %r2] 0x80
	.word 0x87ac0a42  ! 6: FCMPd	fcmpd	%fcc<n>, %f16, %f2
	.word 0xc6dc1002  ! 6: LDXA_R	ldxa	[%r16, %r2] 0x80, %r3
	brnz %r31,thr0_loop_cnt_2
	.word 0xd4ac0442  ! 6: STBA_R	stba	%r10, [%r16 + %r2] 0x22
	ta T_CHANGE_NONPRIV
	.word 0x8d7c2401  ! 6: MOVR_I	movre	%r16, 0x1, %r6
	setx  0x0000000000000340, %r1, %r2
	ta T_CHANGE_PRIV
	mov 0x9, %r31
thr0_loop_cnt_3:
	.word 0xc68165f4  ! 8: LDUWA_I	lduwa	[%r5, + 0x05f4] %asi, %r3
	stx %fsr, [%g5 + %g2]
	.word 0xc6f40462  ! 8: STXA_R	stxa	%r3, [%r16 + %r2] 0x23
	membar #Sync
	ldx [%r16 + %g2], %fsr
	.word 0xd4a169b4  ! 8: STWA_I	stwa	%r10, [%r5 + 0x09b4] %asi
	.word 0x867c0002  ! 8: SDIV_R	sdiv 	%r16, %r2, %r3
	.word 0xe85c2948  ! 8: LDX_I	ldx	[%r16 + 0x0948], %r20
	.word 0x91a409c2  ! 8: FDIVd	fdivd	%f16, %f2, %f8
	membar      #Sync|#MemIssue|#LoadStore
	.word 0xd6ac0542  ! 8: STBA_R	stba	%r11, [%r16 + %r2] 0x2a
	membar #Sync
	dec %r31
	.word 0xc6c41002  ! 8: LDSWA_R	ldswa	[%r16, %r2] 0x80, %r3
	.word 0xc6a15002  ! 8: STWA_R	stwa	%r3, [%r5 + %r2] 0x80
	.word 0x87ac0a42  ! 8: FCMPd	fcmpd	%fcc<n>, %f16, %f2
	.word 0xc6842688  ! 8: LDUWA_I	lduwa	[%r16, + 0x0688] %asi, %r3
	brnz %r31,thr0_loop_cnt_3
	.word 0xfcf40442  ! 8: STXA_R	stxa	%r30, [%r16 + %r2] 0x22
	ta T_CHANGE_NONPRIV
	setx  0x0000000000000c80, %r1, %r2
	ta T_CHANGE_PRIV
	mov 0x9, %r31
thr0_loop_cnt_4:
	.word 0xe6596cc8  ! 9: LDX_I	ldx	[%r5 + 0x0cc8], %r19
	stx %fsr, [%g5 + %g2]
	.word 0xc6a40542  ! 9: STWA_R	stwa	%r3, [%r16 + %r2] 0x2a
	membar #Sync
	ldx [%r16 + %g2], %fsr
	.word 0xdc294002  ! 9: STB_R	stb	%r14, [%r5 + %r2]
	.word 0x86742429  ! 9: UDIV_I	udiv 	%r16, 0x0429, %r3
	.word 0xc68c1002  ! 9: LDUBA_R	lduba	[%r16, %r2] 0x80, %r3
	.word 0x87a409c2  ! 9: FDIVd	fdivd	%f16, %f2, %f34
	membar      #Sync|#MemIssue|#LoadStore
	.word 0xc6b40562  ! 9: STHA_R	stha	%r3, [%r16 + %r2] 0x2b
	membar #Sync
	dec %r31
	.word 0xd8142210  ! 9: LDUH_I	lduh	[%r16 + 0x0210], %r12
	.word 0xc6294002  ! 9: STB_R	stb	%r3, [%r5 + %r2]
	.word 0x87ac0a22  ! 9: FCMPs	fcmps	%fcc<n>, %f16, %f2
	.word 0xc68c1002  ! 9: LDUBA_R	lduba	[%r16, %r2] 0x80, %r3
	brnz %r31,thr0_loop_cnt_4
	.word 0xc6a40462  ! 9: STWA_R	stwa	%r3, [%r16 + %r2] 0x23
	ta T_CHANGE_NONPRIV
	setx  0x00000000000009a0, %r1, %r2
	ta T_CHANGE_PRIV
	mov 0x8, %r31
thr0_loop_cnt_5:
	.word 0xd4516c7c  ! 10: LDSH_I	ldsh	[%r5 + 0x0c7c], %r10
	stx %fsr, [%g5 + %g2]
	.word 0xceac0462  ! 10: STBA_R	stba	%r7, [%r16 + %r2] 0x23
	membar #Sync
	ldx [%r16 + %g2], %fsr
	.word 0xe6f16c88  ! 10: STXA_I	stxa	%r19, [%r5 + 0x0c88] %asi
	.word 0x866c0002  ! 10: UDIVX_R	udivx 	%r16, %r2, %r3
	.word 0xf6440002  ! 10: LDSW_R	ldsw	[%r16 + %r2], %r27
	.word 0x87a409c2  ! 10: FDIVd	fdivd	%f16, %f2, %f34
	membar      #Sync|#MemIssue|#LoadStore
	.word 0xf0ac0462  ! 10: STBA_R	stba	%r24, [%r16 + %r2] 0x23
	membar #Sync
	dec %r31
	.word 0xf44c22ec  ! 10: LDSB_I	ldsb	[%r16 + 0x02ec], %r26
	.word 0xde314002  ! 10: STH_R	sth	%r15, [%r5 + %r2]
	.word 0x87ac0a42  ! 10: FCMPd	fcmpd	%fcc<n>, %f16, %f2
	.word 0xda5c0002  ! 10: LDX_R	ldx	[%r16 + %r2], %r13
	brnz %r31,thr0_loop_cnt_5
	.word 0xe8ac0542  ! 10: STBA_R	stba	%r20, [%r16 + %r2] 0x2a
	ta T_CHANGE_NONPRIV
	.word 0xb0242f68  ! 10: SUB_I	sub 	%r16, 0x0f68, %r24
	setx  0x00000000000004c0, %r1, %r2
	ta T_CHANGE_PRIV
	mov 0x5, %r31
thr0_loop_cnt_6:
	.word 0xd0016738  ! 12: LDUW_I	lduw	[%r5 + 0x0738], %r8
	stx %fsr, [%g5 + %g2]
	.word 0xceac0542  ! 12: STBA_R	stba	%r7, [%r16 + %r2] 0x2a
	membar #Sync
	ldx [%r16 + %g2], %fsr
	.word 0xc6716010  ! 12: STX_I	stx	%r3, [%r5 + 0x0010]
	.word 0x967c0002  ! 12: SDIV_R	sdiv 	%r16, %r2, %r11
	.word 0xc6c41002  ! 12: LDSWA_R	ldswa	[%r16, %r2] 0x80, %r3
	.word 0x87a408a2  ! 12: FSUBs	fsubs	%f16, %f2, %f3
	membar      #Sync|#MemIssue|#LoadStore
	.word 0xcca40542  ! 12: STWA_R	stwa	%r6, [%r16 + %r2] 0x2a
	membar #Sync
	dec %r31
	.word 0xce0c21d6  ! 12: LDUB_I	ldub	[%r16 + 0x01d6], %r7
	.word 0xf82968cf  ! 12: STB_I	stb	%r28, [%r5 + 0x08cf]
	.word 0x87ac0a22  ! 12: FCMPs	fcmps	%fcc<n>, %f16, %f2
	.word 0xec0c0002  ! 12: LDUB_R	ldub	[%r16 + %r2], %r22
	brnz %r31,thr0_loop_cnt_6
	.word 0xeab40542  ! 12: STHA_R	stha	%r21, [%r16 + %r2] 0x2a
	ta T_CHANGE_NONPRIV
	setx  0x0000000000000b90, %r1, %r2
	ta T_CHANGE_PRIV
	mov 0x5, %r31
thr0_loop_cnt_7:
	.word 0xc6895002  ! 13: LDUBA_R	lduba	[%r5, %r2] 0x80, %r3
	stx %fsr, [%g5 + %g2]
	.word 0xfca40542  ! 13: STWA_R	stwa	%r30, [%r16 + %r2] 0x2a
	membar #Sync
	ldx [%r16 + %g2], %fsr
	.word 0xd4b15002  ! 13: STHA_R	stha	%r10, [%r5 + %r2] 0x80
	.word 0x866c0002  ! 13: UDIVX_R	udivx 	%r16, %r2, %r3
	.word 0xce5c2108  ! 13: LDX_I	ldx	[%r16 + 0x0108], %r7
	.word 0x87a40922  ! 13: FMULs	fmuls	%f16, %f2, %f3
	membar      #Sync|#MemIssue|#LoadStore
	.word 0xeea40542  ! 13: STWA_R	stwa	%r23, [%r16 + %r2] 0x2a
	membar #Sync
	dec %r31
	.word 0xfa042874  ! 13: LDUW_I	lduw	[%r16 + 0x0874], %r29
	.word 0xdca15002  ! 13: STWA_R	stwa	%r14, [%r5 + %r2] 0x80
	.word 0x87ac0a42  ! 13: FCMPd	fcmpd	%fcc<n>, %f16, %f2
	.word 0xc6040002  ! 13: LDUW_R	lduw	[%r16 + %r2], %r3
	brnz %r31,thr0_loop_cnt_7
	.word 0xe8f40542  ! 13: STXA_R	stxa	%r20, [%r16 + %r2] 0x2a
	ta T_CHANGE_NONPRIV
	.word 0xb3641002  ! 13: MOVcc_R	movn	%xcc, %r2, %r25
	.word 0xe9a42b10  ! 14: STFA_I	sta	%f20, [0x0b10, %r16]
	setx  0x0000000000000ab0, %r1, %r2
	ta T_CHANGE_PRIV
	mov 0x6, %r31
thr0_loop_cnt_8:
	.word 0xeac16038  ! 16: LDSWA_I	ldswa	[%r5, + 0x0038] %asi, %r21
	stx %fsr, [%g5 + %g2]
	.word 0xd0a40462  ! 16: STWA_R	stwa	%r8, [%r16 + %r2] 0x23
	membar #Sync
	ldx [%r16 + %g2], %fsr
	.word 0xdc3162d4  ! 16: STH_I	sth	%r14, [%r5 + 0x02d4]
	.word 0xa96c21ff  ! 16: SDIVX_I	sdivx	%r16, 0x01ff, %r20
	.word 0xc6040002  ! 16: LDUW_R	lduw	[%r16 + %r2], %r3
	.word 0x87a40942  ! 16: FMULd	fmuld	%f16, %f2, %f34
	membar      #Sync|#MemIssue|#LoadStore
	.word 0xc6a40542  ! 16: STWA_R	stwa	%r3, [%r16 + %r2] 0x2a
	membar #Sync
	dec %r31
	.word 0xf65c2630  ! 16: LDX_I	ldx	[%r16 + 0x0630], %r27
	.word 0xc6b16b0a  ! 16: STHA_I	stha	%r3, [%r5 + 0x0b0a] %asi
	.word 0x87ac0a22  ! 16: FCMPs	fcmps	%fcc<n>, %f16, %f2
	.word 0xf6540002  ! 16: LDSH_R	ldsh	[%r16 + %r2], %r27
	brnz %r31,thr0_loop_cnt_8
	.word 0xdeac0542  ! 16: STBA_R	stba	%r15, [%r16 + %r2] 0x2a
	ta T_CHANGE_NONPRIV
	.word 0x99a408c2  ! 16: FSUBd	fsubd	%f16, %f2, %f12
	.word 0x903c0002  ! 17: XNOR_R	xnor 	%r16, %r2, %r8
	setx  0x0000000000000c90, %r1, %r2
	ta T_CHANGE_PRIV
	mov 0x7, %r31
thr0_loop_cnt_9:
	.word 0xc6c16150  ! 19: LDSWA_I	ldswa	[%r5, + 0x0150] %asi, %r3
	stx %fsr, [%g5 + %g2]
	.word 0xd8b40542  ! 19: STHA_R	stha	%r12, [%r16 + %r2] 0x2a
	membar #Sync
	ldx [%r16 + %g2], %fsr
	.word 0xc6216650  ! 19: STW_I	stw	%r3, [%r5 + 0x0650]
	.word 0x876c0002  ! 19: SDIVX_R	sdivx	%r16, %r2, %r3
	.word 0xdc941002  ! 19: LDUHA_R	lduha	[%r16, %r2] 0x80, %r14
	.word 0x87a409a2  ! 19: FDIVs	fdivs	%f16, %f2, %f3
	membar      #Sync|#MemIssue|#LoadStore
	.word 0xc6a40542  ! 19: STWA_R	stwa	%r3, [%r16 + %r2] 0x2a
	membar #Sync
	dec %r31
	.word 0xce040002  ! 19: LDUW_R	lduw	[%r16 + %r2], %r7
	.word 0xf0216a34  ! 19: STW_I	stw	%r24, [%r5 + 0x0a34]
	.word 0x87ac0a22  ! 19: FCMPs	fcmps	%fcc<n>, %f16, %f2
	.word 0xc6842650  ! 19: LDUWA_I	lduwa	[%r16, + 0x0650] %asi, %r3
	brnz %r31,thr0_loop_cnt_9
	.word 0xdeb40542  ! 19: STHA_R	stha	%r15, [%r16 + %r2] 0x2a
	ta T_CHANGE_NONPRIV
	.word 0xc7a42fec  ! 19: STFA_I	sta	%f3, [0x0fec, %r16]
	setx  0x0000000000000510, %r1, %r2
	ta T_CHANGE_PRIV
	mov 0x6, %r31
thr0_loop_cnt_10:
	.word 0xc6c96608  ! 21: LDSBA_I	ldsba	[%r5, + 0x0608] %asi, %r3
	stx %fsr, [%g5 + %g2]
	.word 0xf2b40462  ! 21: STHA_R	stha	%r25, [%r16 + %r2] 0x23
	membar #Sync
	ldx [%r16 + %g2], %fsr
	.word 0xc6a15002  ! 21: STWA_R	stwa	%r3, [%r5 + %r2] 0x80
	.word 0xa67c0002  ! 21: SDIV_R	sdiv 	%r16, %r2, %r19
	.word 0xc60c2187  ! 21: LDUB_I	ldub	[%r16 + 0x0187], %r3
	.word 0x87a409a2  ! 21: FDIVs	fdivs	%f16, %f2, %f3
	membar      #Sync|#MemIssue|#LoadStore
	.word 0xc6a40542  ! 21: STWA_R	stwa	%r3, [%r16 + %r2] 0x2a
	membar #Sync
	dec %r31
	.word 0xf4d41002  ! 21: LDSHA_R	ldsha	[%r16, %r2] 0x80, %r26
	.word 0xc6716ef0  ! 21: STX_I	stx	%r3, [%r5 + 0x0ef0]
	.word 0x87ac0a22  ! 21: FCMPs	fcmps	%fcc<n>, %f16, %f2
	.word 0xea040002  ! 21: LDUW_R	lduw	[%r16 + %r2], %r21
	brnz %r31,thr0_loop_cnt_10
	.word 0xc6b40542  ! 21: STHA_R	stha	%r3, [%r16 + %r2] 0x2a
	ta T_CHANGE_NONPRIV
	.word 0xd9a15002  ! 22: STFA_R	sta	%f12, [%r2, %r5]
	setx  0x00000000000007a0, %r1, %r2
	ta T_CHANGE_PRIV
	mov 0x9, %r31
thr0_loop_cnt_11:
	.word 0xe8496a31  ! 23: LDSB_I	ldsb	[%r5 + 0x0a31], %r20
	stx %fsr, [%g5 + %g2]
	.word 0xc6f40542  ! 23: STXA_R	stxa	%r3, [%r16 + %r2] 0x2a
	membar #Sync
	ldx [%r16 + %g2], %fsr
	.word 0xe8316170  ! 23: STH_I	sth	%r20, [%r5 + 0x0170]
	.word 0x866c0002  ! 23: UDIVX_R	udivx 	%r16, %r2, %r3
	.word 0xc614247e  ! 23: LDUH_I	lduh	[%r16 + 0x047e], %r3
	.word 0x95a40922  ! 23: FMULs	fmuls	%f16, %f2, %f10
	membar      #Sync|#MemIssue|#LoadStore
	.word 0xccac0542  ! 23: STBA_R	stba	%r6, [%r16 + %r2] 0x2a
	membar #Sync
	dec %r31
	.word 0xc6841002  ! 23: LDUWA_R	lduwa	[%r16, %r2] 0x80, %r3
	.word 0xec214002  ! 23: STW_R	stw	%r22, [%r5 + %r2]
	.word 0x87ac0a22  ! 23: FCMPs	fcmps	%fcc<n>, %f16, %f2
	.word 0xc60c2bda  ! 23: LDUB_I	ldub	[%r16 + 0x0bda], %r3
	brnz %r31,thr0_loop_cnt_11
	.word 0xd2f40562  ! 23: STXA_R	stxa	%r9, [%r16 + %r2] 0x2b
	ta T_CHANGE_NONPRIV
	.word 0xdab41002  ! 23: STHA_R	stha	%r13, [%r16 + %r2] 0x80
	ta T_GOOD_TRAP

.data
.global thr0_data_seg
thr0_data_seg:
	.xword 0x0



SECTION .ISEG_1 TEXT_VA = 0x0000000840000000, DATA_VA = 0x00000080bd4ea000
attr_text {
	Name	 = .ISEG_1,
	VA	 = 0x0000000840000000,
	RA	 = 0x0000000840000000,
	PA	 = ra2pa(0x0000000840000000,0),
	part_0_i_ctx_nonzero_ps0_tsb,
	part_0_i_ctx_zero_ps0_tsb,
	TTE_Context	 = 0x44,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}


attr_data {
	Name	 = .ISEG_1,
	VA = 0x00000080bd4ea000,
	RA = 0x00000080bd4ea000,
	PA = 0x00000080bd4ea000,
	part_0_d_ctx_nonzero_ps0_tsb,
	part_0_i_ctx_zero_ps0_tsb,
	TTE_Context	 = 0x44,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}




SECTION .ISEG_2 TEXT_VA = 0x0000000880000000, DATA_VA = 0x000000803726e000
attr_text {
	Name	 = .ISEG_2,
	VA	 = 0x0000000880000000,
	RA	 = 0x0000000880000000,
	PA	 = ra2pa(0x0000000880000000,0),
	part_0_i_ctx_nonzero_ps0_tsb,
	part_0_i_ctx_zero_ps0_tsb,
	TTE_Context	 = 0x44,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}


attr_data {
	Name	 = .ISEG_2,
	VA = 0x000000803726e000,
	RA = 0x000000803726e000,
	PA = 0x000000803726e000,
	part_0_d_ctx_nonzero_ps0_tsb,
	part_0_i_ctx_zero_ps0_tsb,
	TTE_Context	 = 0x44,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}




SECTION .ISEG_3 TEXT_VA = 0x00000008c0000000, DATA_VA = 0x00000080b1eaa000
attr_text {
	Name	 = .ISEG_3,
	VA	 = 0x00000008c0000000,
	RA	 = 0x00000008c0000000,
	PA	 = ra2pa(0x00000008c0000000,0),
	part_0_i_ctx_nonzero_ps0_tsb,
	part_0_i_ctx_zero_ps0_tsb,
	TTE_Context	 = 0x44,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}


attr_data {
	Name	 = .ISEG_3,
	VA = 0x00000080b1eaa000,
	RA = 0x00000080b1eaa000,
	PA = 0x00000080b1eaa000,
	part_0_d_ctx_nonzero_ps0_tsb,
	part_0_i_ctx_zero_ps0_tsb,
	TTE_Context	 = 0x44,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}




SECTION .ISEG_4 TEXT_VA = 0x0000000900000000, DATA_VA = 0x000000805df18000
attr_text {
	Name	 = .ISEG_4,
	VA	 = 0x0000000900000000,
	RA	 = 0x0000000900000000,
	PA	 = ra2pa(0x0000000900000000,0),
	part_0_i_ctx_nonzero_ps0_tsb,
	part_0_i_ctx_zero_ps0_tsb,
	TTE_Context	 = 0x44,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}


attr_data {
	Name	 = .ISEG_4,
	VA = 0x000000805df18000,
	RA = 0x000000805df18000,
	PA = 0x000000805df18000,
	part_0_d_ctx_nonzero_ps0_tsb,
	part_0_i_ctx_zero_ps0_tsb,
	TTE_Context	 = 0x44,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}




SECTION .ISEG_5 TEXT_VA = 0x0000000940000000, DATA_VA = 0x00000080d8c6c000
attr_text {
	Name	 = .ISEG_5,
	VA	 = 0x0000000940000000,
	RA	 = 0x0000000940000000,
	PA	 = ra2pa(0x0000000940000000,0),
	part_0_i_ctx_nonzero_ps0_tsb,
	part_0_i_ctx_zero_ps0_tsb,
	TTE_Context	 = 0x44,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}


attr_data {
	Name	 = .ISEG_5,
	VA = 0x00000080d8c6c000,
	RA = 0x00000080d8c6c000,
	PA = 0x00000080d8c6c000,
	part_0_d_ctx_nonzero_ps0_tsb,
	part_0_i_ctx_zero_ps0_tsb,
	TTE_Context	 = 0x44,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}




SECTION .ISEG_6 TEXT_VA = 0x0000000980000000, DATA_VA = 0x00000080dfcd8000
attr_text {
	Name	 = .ISEG_6,
	VA	 = 0x0000000980000000,
	RA	 = 0x0000000980000000,
	PA	 = ra2pa(0x0000000980000000,0),
	part_0_i_ctx_nonzero_ps0_tsb,
	part_0_i_ctx_zero_ps0_tsb,
	TTE_Context	 = 0x44,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}


attr_data {
	Name	 = .ISEG_6,
	VA = 0x00000080dfcd8000,
	RA = 0x00000080dfcd8000,
	PA = 0x00000080dfcd8000,
	part_0_d_ctx_nonzero_ps0_tsb,
	part_0_i_ctx_zero_ps0_tsb,
	TTE_Context	 = 0x44,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}




SECTION .ISEG_7 TEXT_VA = 0x00000009c0000000, DATA_VA = 0x00000080b2f12000
attr_text {
	Name	 = .ISEG_7,
	VA	 = 0x00000009c0000000,
	RA	 = 0x00000009c0000000,
	PA	 = ra2pa(0x00000009c0000000,0),
	part_0_i_ctx_nonzero_ps0_tsb,
	part_0_i_ctx_zero_ps0_tsb,
	TTE_Context	 = 0x44,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}


attr_data {
	Name	 = .ISEG_7,
	VA = 0x00000080b2f12000,
	RA = 0x00000080b2f12000,
	PA = 0x00000080b2f12000,
	part_0_d_ctx_nonzero_ps0_tsb,
	part_0_i_ctx_zero_ps0_tsb,
	TTE_Context	 = 0x44,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}




SECTION .ISEG_8 TEXT_VA = 0x0000000a00000000, DATA_VA = 0x0000008055f0c000
attr_text {
	Name	 = .ISEG_8,
	VA	 = 0x0000000a00000000,
	RA	 = 0x0000000a00000000,
	PA	 = ra2pa(0x0000000a00000000,0),
	part_0_i_ctx_nonzero_ps0_tsb,
	part_0_i_ctx_zero_ps0_tsb,
	TTE_Context	 = 0x44,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}


attr_data {
	Name	 = .ISEG_8,
	VA = 0x0000008055f0c000,
	RA = 0x0000008055f0c000,
	PA = 0x0000008055f0c000,
	part_0_d_ctx_nonzero_ps0_tsb,
	part_0_i_ctx_zero_ps0_tsb,
	TTE_Context	 = 0x44,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}




SECTION .ISEG_9 TEXT_VA = 0x0000000a40000000, DATA_VA = 0x00000080dd890000
attr_text {
	Name	 = .ISEG_9,
	VA	 = 0x0000000a40000000,
	RA	 = 0x0000000a40000000,
	PA	 = ra2pa(0x0000000a40000000,0),
	part_0_i_ctx_nonzero_ps0_tsb,
	part_0_i_ctx_zero_ps0_tsb,
	TTE_Context	 = 0x44,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}


attr_data {
	Name	 = .ISEG_9,
	VA = 0x00000080dd890000,
	RA = 0x00000080dd890000,
	PA = 0x00000080dd890000,
	part_0_d_ctx_nonzero_ps0_tsb,
	part_0_i_ctx_zero_ps0_tsb,
	TTE_Context	 = 0x44,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}




SECTION .ISEG_10 TEXT_VA = 0x0000000a80000000, DATA_VA = 0x0000008012284000
attr_text {
	Name	 = .ISEG_10,
	VA	 = 0x0000000a80000000,
	RA	 = 0x0000000a80000000,
	PA	 = ra2pa(0x0000000a80000000,0),
	part_0_i_ctx_nonzero_ps0_tsb,
	part_0_i_ctx_zero_ps0_tsb,
	TTE_Context	 = 0x44,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}


attr_data {
	Name	 = .ISEG_10,
	VA = 0x0000008012284000,
	RA = 0x0000008012284000,
	PA = 0x0000008012284000,
	part_0_d_ctx_nonzero_ps0_tsb,
	part_0_i_ctx_zero_ps0_tsb,
	TTE_Context	 = 0x44,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}




SECTION .ISEG_11 TEXT_VA = 0x0000000ac0000000, DATA_VA = 0x000000807703a000
attr_text {
	Name	 = .ISEG_11,
	VA	 = 0x0000000ac0000000,
	RA	 = 0x0000000ac0000000,
	PA	 = ra2pa(0x0000000ac0000000,0),
	part_0_i_ctx_nonzero_ps0_tsb,
	part_0_i_ctx_zero_ps0_tsb,
	TTE_Context	 = 0x44,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}


attr_data {
	Name	 = .ISEG_11,
	VA = 0x000000807703a000,
	RA = 0x000000807703a000,
	PA = 0x000000807703a000,
	part_0_d_ctx_nonzero_ps0_tsb,
	part_0_i_ctx_zero_ps0_tsb,
	TTE_Context	 = 0x44,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}




SECTION .ISEG_12 TEXT_VA = 0x0000000b00000000, DATA_VA = 0x000000805044a000
attr_text {
	Name	 = .ISEG_12,
	VA	 = 0x0000000b00000000,
	RA	 = 0x0000000b00000000,
	PA	 = ra2pa(0x0000000b00000000,0),
	part_0_i_ctx_nonzero_ps0_tsb,
	part_0_i_ctx_zero_ps0_tsb,
	TTE_Context	 = 0x44,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}


attr_data {
	Name	 = .ISEG_12,
	VA = 0x000000805044a000,
	RA = 0x000000805044a000,
	PA = 0x000000805044a000,
	part_0_d_ctx_nonzero_ps0_tsb,
	part_0_i_ctx_zero_ps0_tsb,
	TTE_Context	 = 0x44,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}




SECTION .ISEG_13 TEXT_VA = 0x0000000b40000000, DATA_VA = 0x00000080deb9e000
attr_text {
	Name	 = .ISEG_13,
	VA	 = 0x0000000b40000000,
	RA	 = 0x0000000b40000000,
	PA	 = ra2pa(0x0000000b40000000,0),
	part_0_i_ctx_nonzero_ps0_tsb,
	part_0_i_ctx_zero_ps0_tsb,
	TTE_Context	 = 0x44,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}


attr_data {
	Name	 = .ISEG_13,
	VA = 0x00000080deb9e000,
	RA = 0x00000080deb9e000,
	PA = 0x00000080deb9e000,
	part_0_d_ctx_nonzero_ps0_tsb,
	part_0_i_ctx_zero_ps0_tsb,
	TTE_Context	 = 0x44,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}




SECTION .ISEG_14 TEXT_VA = 0x0000000b80000000, DATA_VA = 0x00000080dd4f8000
attr_text {
	Name	 = .ISEG_14,
	VA	 = 0x0000000b80000000,
	RA	 = 0x0000000b80000000,
	PA	 = ra2pa(0x0000000b80000000,0),
	part_0_i_ctx_nonzero_ps0_tsb,
	part_0_i_ctx_zero_ps0_tsb,
	TTE_Context	 = 0x44,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}


attr_data {
	Name	 = .ISEG_14,
	VA = 0x00000080dd4f8000,
	RA = 0x00000080dd4f8000,
	PA = 0x00000080dd4f8000,
	part_0_d_ctx_nonzero_ps0_tsb,
	part_0_i_ctx_zero_ps0_tsb,
	TTE_Context	 = 0x44,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}




SECTION .ISEG_15 TEXT_VA = 0x0000000bc0000000, DATA_VA = 0x00000080d259c000
attr_text {
	Name	 = .ISEG_15,
	VA	 = 0x0000000bc0000000,
	RA	 = 0x0000000bc0000000,
	PA	 = ra2pa(0x0000000bc0000000,0),
	part_0_i_ctx_nonzero_ps0_tsb,
	part_0_i_ctx_zero_ps0_tsb,
	TTE_Context	 = 0x44,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}


attr_data {
	Name	 = .ISEG_15,
	VA = 0x00000080d259c000,
	RA = 0x00000080d259c000,
	PA = 0x00000080d259c000,
	part_0_d_ctx_nonzero_ps0_tsb,
	part_0_i_ctx_zero_ps0_tsb,
	TTE_Context	 = 0x44,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}




SECTION .ISEG_16 TEXT_VA = 0x0000000c00000000, DATA_VA = 0x00000080f9418000
attr_text {
	Name	 = .ISEG_16,
	VA	 = 0x0000000c00000000,
	RA	 = 0x0000000c00000000,
	PA	 = ra2pa(0x0000000c00000000,0),
	part_0_i_ctx_nonzero_ps0_tsb,
	part_0_i_ctx_zero_ps0_tsb,
	TTE_Context	 = 0x44,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}


attr_data {
	Name	 = .ISEG_16,
	VA = 0x00000080f9418000,
	RA = 0x00000080f9418000,
	PA = 0x00000080f9418000,
	part_0_d_ctx_nonzero_ps0_tsb,
	part_0_i_ctx_zero_ps0_tsb,
	TTE_Context	 = 0x44,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}




SECTION .ISEG_17 TEXT_VA = 0x0000000c40000000, DATA_VA = 0x000000805f2f6000
attr_text {
	Name	 = .ISEG_17,
	VA	 = 0x0000000c40000000,
	RA	 = 0x0000000c40000000,
	PA	 = ra2pa(0x0000000c40000000,0),
	part_0_i_ctx_nonzero_ps0_tsb,
	part_0_i_ctx_zero_ps0_tsb,
	TTE_Context	 = 0x44,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}


attr_data {
	Name	 = .ISEG_17,
	VA = 0x000000805f2f6000,
	RA = 0x000000805f2f6000,
	PA = 0x000000805f2f6000,
	part_0_d_ctx_nonzero_ps0_tsb,
	part_0_i_ctx_zero_ps0_tsb,
	TTE_Context	 = 0x44,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}




SECTION .ISEG_18 TEXT_VA = 0x0000000c80000000, DATA_VA = 0x00000080fdbfa000
attr_text {
	Name	 = .ISEG_18,
	VA	 = 0x0000000c80000000,
	RA	 = 0x0000000c80000000,
	PA	 = ra2pa(0x0000000c80000000,0),
	part_0_i_ctx_nonzero_ps0_tsb,
	part_0_i_ctx_zero_ps0_tsb,
	TTE_Context	 = 0x44,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}


attr_data {
	Name	 = .ISEG_18,
	VA = 0x00000080fdbfa000,
	RA = 0x00000080fdbfa000,
	PA = 0x00000080fdbfa000,
	part_0_d_ctx_nonzero_ps0_tsb,
	part_0_i_ctx_zero_ps0_tsb,
	TTE_Context	 = 0x44,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}




SECTION .ISEG_19 TEXT_VA = 0x0000000cc0000000, DATA_VA = 0x00000080d0d5e000
attr_text {
	Name	 = .ISEG_19,
	VA	 = 0x0000000cc0000000,
	RA	 = 0x0000000cc0000000,
	PA	 = ra2pa(0x0000000cc0000000,0),
	part_0_i_ctx_nonzero_ps0_tsb,
	part_0_i_ctx_zero_ps0_tsb,
	TTE_Context	 = 0x44,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}


attr_data {
	Name	 = .ISEG_19,
	VA = 0x00000080d0d5e000,
	RA = 0x00000080d0d5e000,
	PA = 0x00000080d0d5e000,
	part_0_d_ctx_nonzero_ps0_tsb,
	part_0_i_ctx_zero_ps0_tsb,
	TTE_Context	 = 0x44,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}




SECTION .ISEG_20 TEXT_VA = 0x0000000d00000000, DATA_VA = 0x000000805dc8a000
attr_text {
	Name	 = .ISEG_20,
	VA	 = 0x0000000d00000000,
	RA	 = 0x0000000d00000000,
	PA	 = ra2pa(0x0000000d00000000,0),
	part_0_i_ctx_nonzero_ps0_tsb,
	part_0_i_ctx_zero_ps0_tsb,
	TTE_Context	 = 0x44,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}


attr_data {
	Name	 = .ISEG_20,
	VA = 0x000000805dc8a000,
	RA = 0x000000805dc8a000,
	PA = 0x000000805dc8a000,
	part_0_d_ctx_nonzero_ps0_tsb,
	part_0_i_ctx_zero_ps0_tsb,
	TTE_Context	 = 0x44,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}




SECTION .ISEG_21 TEXT_VA = 0x0000000d40000000, DATA_VA = 0x00000080d43ac000
attr_text {
	Name	 = .ISEG_21,
	VA	 = 0x0000000d40000000,
	RA	 = 0x0000000d40000000,
	PA	 = ra2pa(0x0000000d40000000,0),
	part_0_i_ctx_nonzero_ps0_tsb,
	part_0_i_ctx_zero_ps0_tsb,
	TTE_Context	 = 0x44,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}


attr_data {
	Name	 = .ISEG_21,
	VA = 0x00000080d43ac000,
	RA = 0x00000080d43ac000,
	PA = 0x00000080d43ac000,
	part_0_d_ctx_nonzero_ps0_tsb,
	part_0_i_ctx_zero_ps0_tsb,
	TTE_Context	 = 0x44,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}




SECTION .ISEG_22 TEXT_VA = 0x0000000d80000000, DATA_VA = 0x000000805fe26000
attr_text {
	Name	 = .ISEG_22,
	VA	 = 0x0000000d80000000,
	RA	 = 0x0000000d80000000,
	PA	 = ra2pa(0x0000000d80000000,0),
	part_0_i_ctx_nonzero_ps0_tsb,
	part_0_i_ctx_zero_ps0_tsb,
	TTE_Context	 = 0x44,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}


attr_data {
	Name	 = .ISEG_22,
	VA = 0x000000805fe26000,
	RA = 0x000000805fe26000,
	PA = 0x000000805fe26000,
	part_0_d_ctx_nonzero_ps0_tsb,
	part_0_i_ctx_zero_ps0_tsb,
	TTE_Context	 = 0x44,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}




SECTION .ISEG_23 TEXT_VA = 0x0000000dc0000000, DATA_VA = 0x000000801d534000
attr_text {
	Name	 = .ISEG_23,
	VA	 = 0x0000000dc0000000,
	RA	 = 0x0000000dc0000000,
	PA	 = ra2pa(0x0000000dc0000000,0),
	part_0_i_ctx_nonzero_ps0_tsb,
	part_0_i_ctx_zero_ps0_tsb,
	TTE_Context	 = 0x44,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}


attr_data {
	Name	 = .ISEG_23,
	VA = 0x000000801d534000,
	RA = 0x000000801d534000,
	PA = 0x000000801d534000,
	part_0_d_ctx_nonzero_ps0_tsb,
	part_0_i_ctx_zero_ps0_tsb,
	TTE_Context	 = 0x44,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}




SECTION .ISEG_24 TEXT_VA = 0x0000000e00000000, DATA_VA = 0x00000080392ec000
attr_text {
	Name	 = .ISEG_24,
	VA	 = 0x0000000e00000000,
	RA	 = 0x0000000e00000000,
	PA	 = ra2pa(0x0000000e00000000,0),
	part_0_i_ctx_nonzero_ps0_tsb,
	part_0_i_ctx_zero_ps0_tsb,
	TTE_Context	 = 0x44,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}


attr_data {
	Name	 = .ISEG_24,
	VA = 0x00000080392ec000,
	RA = 0x00000080392ec000,
	PA = 0x00000080392ec000,
	part_0_d_ctx_nonzero_ps0_tsb,
	part_0_i_ctx_zero_ps0_tsb,
	TTE_Context	 = 0x44,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}




SECTION .ISEG_25 TEXT_VA = 0x0000000e40000000, DATA_VA = 0x0000008092a06000
attr_text {
	Name	 = .ISEG_25,
	VA	 = 0x0000000e40000000,
	RA	 = 0x0000000e40000000,
	PA	 = ra2pa(0x0000000e40000000,0),
	part_0_i_ctx_nonzero_ps0_tsb,
	part_0_i_ctx_zero_ps0_tsb,
	TTE_Context	 = 0x44,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}


attr_data {
	Name	 = .ISEG_25,
	VA = 0x0000008092a06000,
	RA = 0x0000008092a06000,
	PA = 0x0000008092a06000,
	part_0_d_ctx_nonzero_ps0_tsb,
	part_0_i_ctx_zero_ps0_tsb,
	TTE_Context	 = 0x44,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}




SECTION .ISEG_26 TEXT_VA = 0x0000000e80000000, DATA_VA = 0x00000080b1d5c000
attr_text {
	Name	 = .ISEG_26,
	VA	 = 0x0000000e80000000,
	RA	 = 0x0000000e80000000,
	PA	 = ra2pa(0x0000000e80000000,0),
	part_0_i_ctx_nonzero_ps0_tsb,
	part_0_i_ctx_zero_ps0_tsb,
	TTE_Context	 = 0x44,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}


attr_data {
	Name	 = .ISEG_26,
	VA = 0x00000080b1d5c000,
	RA = 0x00000080b1d5c000,
	PA = 0x00000080b1d5c000,
	part_0_d_ctx_nonzero_ps0_tsb,
	part_0_i_ctx_zero_ps0_tsb,
	TTE_Context	 = 0x44,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}




SECTION .ISEG_27 TEXT_VA = 0x0000000ec0000000, DATA_VA = 0x000000807bc86000
attr_text {
	Name	 = .ISEG_27,
	VA	 = 0x0000000ec0000000,
	RA	 = 0x0000000ec0000000,
	PA	 = ra2pa(0x0000000ec0000000,0),
	part_0_i_ctx_nonzero_ps0_tsb,
	part_0_i_ctx_zero_ps0_tsb,
	TTE_Context	 = 0x44,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}


attr_data {
	Name	 = .ISEG_27,
	VA = 0x000000807bc86000,
	RA = 0x000000807bc86000,
	PA = 0x000000807bc86000,
	part_0_d_ctx_nonzero_ps0_tsb,
	part_0_i_ctx_zero_ps0_tsb,
	TTE_Context	 = 0x44,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}




SECTION .ISEG_28 TEXT_VA = 0x0000000f00000000, DATA_VA = 0x000000805b794000
attr_text {
	Name	 = .ISEG_28,
	VA	 = 0x0000000f00000000,
	RA	 = 0x0000000f00000000,
	PA	 = ra2pa(0x0000000f00000000,0),
	part_0_i_ctx_nonzero_ps0_tsb,
	part_0_i_ctx_zero_ps0_tsb,
	TTE_Context	 = 0x44,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}


attr_data {
	Name	 = .ISEG_28,
	VA = 0x000000805b794000,
	RA = 0x000000805b794000,
	PA = 0x000000805b794000,
	part_0_d_ctx_nonzero_ps0_tsb,
	part_0_i_ctx_zero_ps0_tsb,
	TTE_Context	 = 0x44,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}




SECTION .ISEG_29 TEXT_VA = 0x0000000f40000000, DATA_VA = 0x000000805a94a000
attr_text {
	Name	 = .ISEG_29,
	VA	 = 0x0000000f40000000,
	RA	 = 0x0000000f40000000,
	PA	 = ra2pa(0x0000000f40000000,0),
	part_0_i_ctx_nonzero_ps0_tsb,
	part_0_i_ctx_zero_ps0_tsb,
	TTE_Context	 = 0x44,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}


attr_data {
	Name	 = .ISEG_29,
	VA = 0x000000805a94a000,
	RA = 0x000000805a94a000,
	PA = 0x000000805a94a000,
	part_0_d_ctx_nonzero_ps0_tsb,
	part_0_i_ctx_zero_ps0_tsb,
	TTE_Context	 = 0x44,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}




SECTION .ISEG_30 TEXT_VA = 0x0000000f80000000, DATA_VA = 0x00000080f2858000
attr_text {
	Name	 = .ISEG_30,
	VA	 = 0x0000000f80000000,
	RA	 = 0x0000000f80000000,
	PA	 = ra2pa(0x0000000f80000000,0),
	part_0_i_ctx_nonzero_ps0_tsb,
	part_0_i_ctx_zero_ps0_tsb,
	TTE_Context	 = 0x44,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}


attr_data {
	Name	 = .ISEG_30,
	VA = 0x00000080f2858000,
	RA = 0x00000080f2858000,
	PA = 0x00000080f2858000,
	part_0_d_ctx_nonzero_ps0_tsb,
	part_0_i_ctx_zero_ps0_tsb,
	TTE_Context	 = 0x44,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}




SECTION .ISEG_31 TEXT_VA = 0x0000000fc0000000, DATA_VA = 0x00000080bdac6000
attr_text {
	Name	 = .ISEG_31,
	VA	 = 0x0000000fc0000000,
	RA	 = 0x0000000fc0000000,
	PA	 = ra2pa(0x0000000fc0000000,0),
	part_0_i_ctx_nonzero_ps0_tsb,
	part_0_i_ctx_zero_ps0_tsb,
	TTE_Context	 = 0x44,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}


attr_data {
	Name	 = .ISEG_31,
	VA = 0x00000080bdac6000,
	RA = 0x00000080bdac6000,
	PA = 0x00000080bdac6000,
	part_0_d_ctx_nonzero_ps0_tsb,
	part_0_i_ctx_zero_ps0_tsb,
	TTE_Context	 = 0x44,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}




#if 0
!!# /*
!!#  */
!!# 
!!# %%section c_declarations
!!# 
!!# 
!!#   int i = 0;
!!#   int inst_cnt = 0;
!!#   int fakedma_loop = 0;
!!#   int loop_cnt = 0;
!!#   int burst_cnt = 0;
!!#   int burst_cnt2 = 0;
!!# 
!!# #define ISEG	0
!!# 
!!# %%
!!# %%section control
!!# 
!!# %%
!!# %%section init
!!# {
!!# 
!!# 
!!#   printf ("**********************************\n");
!!# 
!!#   IJ_set_ropr_fld ("diag.j", 32, ijdefault, Ft_Rs1, "{16}");
!!#   IJ_set_ropr_fld ("diag.j", 33, ijdefault, Ft_Rs2, "{2}");
!!#   IJ_set_ropr_fld ("diag.j", 34, ijdefault, Ft_Rd, "{3,6..15,17..30}");
!!#   IJ_set_ropr_fld ("diag.j", 35, ijdefault, Fm_align_Rd, "1'b1");
!!#   IJ_set_ropr_fld ("diag.j", 36, ijdefault, Ft_Simm13, "13'b0rrrrrrrrrrrr");
!!#   IJ_set_ropr_fld ("diag.j", 37, ijdefault, Fm_align_Simm13, "3'b111");
!!#   IJ_set_ropr_fld ("diag.j", 38, ijdefault, Ft_Imm_Asi, "{0x80}");
!!#   IJ_set_ropr_fld ("diag.j", 39, ijdefault, Ft_Cc2, "1'b1");
!!#   IJ_set_ropr_fld ("diag.j", 40, ijdefault, Ft_Cc1_f4, "1'br");
!!#   IJ_set_ropr_fld ("diag.j", 41, ijdefault, Ft_Cc0_f4, "1'b0");
!!#   IJ_set_ropr_fld ("diag.j", 42, ijdefault, Ft_Cond_f4, "{0x1..0xf}");
!!#   IJ_set_ropr_fld ("diag.j", 43, ijdefault, Ft_P, "1'br");
!!#   IJ_set_ropr_fld ("diag.j", 44, ijdefault, Ft_A, "1'br");  
!!#   IJ_set_ropr_fld ("diag.j", 45, ijdefault, Ft_D16, "{0x1, 0x3, 0x5}");
!!#   IJ_set_ropr_fld ("diag.j", 46, ijdefault, Ft_Disp22, "{0x1, 0x3, 0x5}");
!!#   IJ_set_ropr_fld ("diag.j", 47, ijdefault, Ft_Disp19, "{0x1, 0x3, 0x5}");
!!#   IJ_set_ropr_fld ("diag.j", 48, ijdefault, Ft_Disp30, "{0x1, 0x3, 0x5}");
!!#   IJ_set_ropr_fld ("diag.j", 49, ijdefault, Ft_Cmask, "3'brrr");
!!#   IJ_set_ropr_fld ("diag.j", 50, ijdefault, Ft_Mmask, "4'brrrr");
!!# 
!!#   IJ_copy_ropr ("diag.j", 52, Ro_fakedma, ijdefault);
!!#   IJ_set_ropr_fld ("diag.j", 53, Ro_fakedma, Ft_Rs1, "{5}");
!!#   IJ_set_ropr_fld ("diag.j", 54, Ro_fakedma, Ft_Rs2, "{2}");
!!#   IJ_set_ropr_fld ("diag.j", 55, Ro_fakedma, Ft_Rd, "{3,6..15,17..30}");
!!#   IJ_set_ropr_fld ("diag.j", 56, Ro_fakedma, Ft_Simm13, "13'b0rrrrrrrrrrrr");
!!#   IJ_set_ropr_fld ("diag.j", 57, Ro_fakedma, Fm_align_Simm13, "3'b111");
!!# 
!!#   IJ_copy_ropr ("diag.j", 59, Ro_blkasi, ijdefault);
!!#   IJ_set_ropr_fld ("diag.j", 60, Ro_blkasi, Ft_Imm_Asi, "{0x2A,0x2B,0x22,0x23}");
!!# 
!!#   IJ_bind_thread_group("diag.j", 62, th_all, 0x1);
!!#   IJ_bind_thread_group("diag.j", 63, th_0, 0x1);
!!# 
!!#   IJ_set_rvar ("diag.j", 65, reg_rand_init, "64'hrrrrrrrr rrrrrrrr");
!!#   for (i = 1; i < 32; i++) {
!!#      IJ_printf ("diag.j", 67, th_all, "        setx  0x%016llrx, %%r1, %%r%d\n", reg_rand_init, i);
!!#   }
!!# 
!!#   IJ_set_rvar ("diag.j", 70, reg_rand_init, "64'h00000000 00000rr0");
!!#   IJ_set_rvar ("diag.j", 71, max_wt, "{10}");
!!# 
!!#   IJ_printf ("diag.j", 73, th_all, "        setx  0x%016llrx, %%r1, %%r2\n", reg_rand_init);
!!# 
!!#   IJ_printf ("diag.j", 75, th_all, "\tsetx shared_data, %%r1, %%r16\n");
!!# 
!!#   IJ_printf ("diag.j", 77, th_all, "        wr %%g0, 0x80, %%asi\n");
!!#   IJ_printf ("diag.j", 78, th_all, "        wr %%g0, 0x4, %%fprs\n");
!!#   IJ_init_fp_regs ("diag.j", 79, th_all, 16);
!!# 
!!#   IJ_printf ("diag.j", 81, th_all, "\tsetx thr%y_data_seg, %%r1, %%r5\n");
!!#   IJ_printf ("diag.j", 82, th_all, "\tsetx thr%y_inst_seg, %%r1, %%r31\n");
!!#   IJ_printf ("diag.j", 83, th_all, "\tjmp  %%r31\n");
!!#   IJ_printf ("diag.j", 84, th_all, "\tnop\n");
!!# 
!!# }
!!# 
!!# %%
!!# %%section finish
!!# {
!!# 
!!# 
!!#   IJ_printf ("diag.j", 119, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 120, th_all, "	nop\n");
!!#   IJ_th_join ("diag.j", 121,0xffffffff);
!!#   IJ_th_start ("diag.j", 122,Seq_Start, NULL, 2); 
!!#   IJ_printf ("diag.j", 123, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 124, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 125, th_all, "	ta    T_GOOD_TRAP\n\n");
!!#   IJ_printf ("diag.j", 126, th_all, ".global fail\n");
!!#   IJ_printf ("diag.j", 127, th_all, "fail:\n");
!!#   IJ_printf ("diag.j", 128, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 129, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 130, th_all, "	ta    T_BAD_TRAP\n\n");
!!#   IJ_printf ("diag.j", 131, th_all, "	nop\n");
!!#   IJ_printf ("diag.j", 132, th_all, "	nop\n");
!!# 
!!#   IJ_set_rvar ("diag.j", 134, data_rand_init, "32'hrrrrrrrr");
!!#   IJ_printf ("diag.j", 135, th_all, "\n.data\n");
!!#   IJ_printf ("diag.j", 136, th_all, "\nshared_data:\n");
!!#   for (i = 0; i < 128; i++) {
!!#     IJ_printf ("diag.j", 138, th_all, "	.word  0x%08rx,0x%08rx,0x%08rx,0x%08rx\n", data_rand_init, data_rand_init, data_rand_init, data_rand_init);
!!#     IJ_printf ("diag.j", 139, th_all, "	.word  0x%08rx,0x%08rx,0x%08rx,0x%08rx\n", data_rand_init, data_rand_init, data_rand_init, data_rand_init);
!!#   }  
!!# 
!!#   IJ_iseg_printf ("diag.j", 142,ISEG, 0, th_0, "\n.data\n");
!!#   IJ_iseg_printf ("diag.j", 143,ISEG, 0, th_0, ".global thr0_data_seg\n");
!!#   IJ_iseg_printf ("diag.j", 144,ISEG, 0, th_0, "thr0_data_seg:\n");
!!#   IJ_iseg_printf ("diag.j", 145,ISEG, 0, th_0, "	.xword 0x0\n");
!!# 
!!# }
!!# 
!!# %%
!!# %%section map
!!# 
!!# 
!!#   SECTION .ISEG TEXT_VA = "28'{0}, 6'b1iiiii, 30'{0}",
!!# 		DATA_VA = "24'{0}, 27'b1000 0000 rrr1 rrrr rrrr rrrr rrr, 13'{0}",
!!# 
!!#   attr_text {
!!#         Name = .ISEG,
!!# 	VA = "28'{0}, 6'b1iiiii, 30'{0}",
!!# 	RA = "28'{0}, 6'b1iiiii, 30'{0}",
!!#         part_0_i_ctx_nonzero_ps0_tsb,
!!#         part_0_i_ctx_zero_ps0_tsb,
!!#         TTE_Context = 0x44, TTE_V = 1, TTE_Size = 0,
!!#         TTE_NFO = 0, TTE_IE = 0, TTE_Soft2 = 0, TTE_Diag = 0, TTE_Soft = 0,
!!#         TTE_L = 0, TTE_CP = 1, TTE_CV = 1, TTE_E = 0, TTE_P = 0, TTE_W = 1
!!#   }
!!# 
!!#   attr_data {
!!#         Name = .ISEG,
!!# 	bypass,
!!#         part_0_d_ctx_nonzero_ps0_tsb,
!!#         part_0_i_ctx_zero_ps0_tsb,
!!#         TTE_Context = 0x44, TTE_V = 1, TTE_Size = 0,
!!#         TTE_NFO = 0, TTE_IE = 0, TTE_Soft2 = 0, TTE_Diag = 0, TTE_Soft = 0,
!!#         TTE_L = 0, TTE_CP = 1, TTE_CV = 1, TTE_E = 0, TTE_P = 0, TTE_W = 1
!!#   }
!!# 
!!#   enumerate {
!!#         TEXT_VA
!!#  }
!!# 
!!# 
!!# 
!!# %%
!!# %%section grammar
!!# 
!!# 
!!# diag: print_label inst_block
!!# ;
!!# 
!!# inst_block: inst
!!#             | inst_block inst
!!# 		{
!!# 		   if (fakedma_loop == 0) {
!!#                      IJ_iseg_generate ("diag.j", 174,ISEG, 0, th_0, $2);
!!# 		   }
!!# 		   else {
!!# 		     fakedma_loop = 0;
!!# 		   }
!!# 		   if (inst_cnt > 20) {
!!#                       IJ_iseg_printf ("diag.j", 180,ISEG, 0, th_0, "\tta T_GOOD_TRAP\n");
!!# 		      IJ_finish("diag.j", 181);
!!# 		   }
!!# 		   inst_cnt++;
!!# 		}
!!# ;
!!# 
!!# inst: mul_i
!!#       | mul_r
!!# //      | div_i 
!!# //      | div_r 
!!#       | load_i
!!#       | load_r
!!#       | store_i
!!#       | store_r
!!#       | atomic_r
!!#       | atomic_i
!!#       | prefetch_i
!!#       | prefetch_r
!!#       | alu_i 
!!#       | alu_r
!!#       | mov_i
!!#       | mov_r
!!#       | st_fp_i_d
!!#       | st_fp_r_d
!!#       | st_fp_i_s
!!#       | st_fp_r_s
!!# //      | arith_fp_s
!!#       | arith_fp_d
!!#       | ld_fp_i
!!#       | ld_fp_r
!!#       | fakedma_ld 
!!#       | fakedma_st 
!!#       | fakedma_raw_st3 %rvar  max_wt
!!# ;
!!# 
!!# fakedma_raw_st3: mMETAfakedma_raw_st3
!!# {
!!#    fakedma_loop = 1;
!!# 
!!#    IJ_iseg_printf ("diag.j", 220,ISEG, 0, th_0, "\tsetx  0x%016llrx, %%r1, %%r2\n", reg_rand_init);
!!#    IJ_iseg_printf ("diag.j", 221,ISEG, 0, th_0, "\tta T_CHANGE_PRIV\n");
!!#    IJ_iseg_printf ("diag.j", 222,ISEG, 0, th_0, "\tmov 0x%x, %%r31\n", random () % 5 + 5);
!!#    IJ_iseg_printf ("diag.j", 223,ISEG, 0, th_0, "thr%y_loop_cnt_%d:\n", loop_cnt);
!!# 
!!#    IJ_iseg_generate_from_token ("diag.j", 225,1, ISEG, 0, th_0, Ro_fakedma, tLDSB_R, tLDSH_R, tLDSW_R, tLDUB_R, tLDUH_R, tLDUW_R, tLDX_R, tLDSBA_R, tLDSHA_R, tLDSWA_R, tLDUBA_R, tLDUHA_R, tLDUWA_R, tLDXA_R, tLDSB_I, tLDSH_I, tLDSW_I, tLDUB_I, tLDUH_I, tLDUW_I, tLDX_I,  tLDSBA_I, tLDSHA_I, tLDSWA_I, tLDUBA_I, tLDUHA_I, tLDUWA_I, tLDXA_I, -1);;
!!# 
!!#    IJ_iseg_printf ("diag.j", 227,ISEG, 0, th_0, "\tstx %%fsr, [%%g5 + %%g2]\n");
!!#    IJ_iseg_generate_from_token ("diag.j", 228,1, ISEG, 0,th_0,  Ro_blkasi, tSTBA_R, tSTHA_R, tSTWA_R, tSTXA_R, -1);;
!!#    IJ_iseg_printf ("diag.j", 229,ISEG, 0, th_0, "\tmembar #Sync\n");
!!#    IJ_iseg_printf ("diag.j", 230,ISEG, 0, th_0, "\tldx [%%r16 + %%g2], %%fsr\n");
!!#    IJ_iseg_generate_from_token ("diag.j", 231,1, ISEG, 0,th_0,  Ro_fakedma, tSTB_I, tSTH_I, tSTW_I, tSTX_I, tSTBA_I, tSTHA_I, tSTWA_I, tSTXA_I, tSTB_R, tSTH_R, tSTW_R, tSTX_R, tSTBA_R, tSTHA_R, tSTWA_R, tSTXA_R, -1);;
!!#    IJ_iseg_generate_from_token ("diag.j", 232,1, ISEG, 0,th_0,  ijdefault, tUDIV_I, tSDIV_I, tSDIVX_I, tUDIVX_I, tUDIV_R, tSDIV_R, tSDIVX_R, tUDIVX_R, -1);;
!!#    IJ_iseg_generate_from_token ("diag.j", 233,1, ISEG, 0, th_0, ijdefault, tLDSB_R, tLDSH_R, tLDSW_R, tLDUB_R, tLDUH_R, tLDUW_R, tLDX_R, tLDSBA_R, tLDSHA_R, tLDSWA_R, tLDUBA_R, tLDUHA_R, tLDUWA_R, tLDXA_R, tLDSB_I, tLDSH_I, tLDSW_I, tLDUB_I, tLDUH_I, tLDUW_I, tLDX_I,  tLDSBA_I, tLDSHA_I, tLDSWA_I, tLDUBA_I, tLDUHA_I, tLDUWA_I, tLDXA_I, -1);;
!!# 
!!#    IJ_iseg_generate_from_token ("diag.j", 235,1, ISEG, 0,th_0,  ijdefault, tFADDs, tFSUBs, tFMULs, tFDIVs, tFADDd, tFSUBd, tFMULd, tFDIVd, -1);;
!!# 
!!#    IJ_iseg_printf ("diag.j", 237,ISEG, 0, th_0, "\tmembar      #Sync|#MemIssue|#LoadStore\n");
!!#    IJ_iseg_generate_from_token ("diag.j", 238,1, ISEG, 0,th_0,  Ro_blkasi, tSTBA_R, tSTHA_R, tSTWA_R, tSTXA_R, -1);;
!!#    IJ_iseg_printf ("diag.j", 239,ISEG, 0, th_0, "\tmembar #Sync\n");
!!#    IJ_iseg_printf ("diag.j", 240,ISEG, 0, th_0, "\tdec %%r31\n");
!!# 
!!#    IJ_iseg_generate_from_token ("diag.j", 242,1, ISEG, 0, th_0, ijdefault, tLDSB_R, tLDSH_R, tLDSW_R, tLDUB_R, tLDUH_R, tLDUW_R, tLDX_R, tLDSBA_R, tLDSHA_R, tLDSWA_R, tLDUBA_R, tLDUHA_R, tLDUWA_R, tLDXA_R, tLDSB_I, tLDSH_I, tLDSW_I, tLDUB_I, tLDUH_I, tLDUW_I, tLDX_I,  tLDSBA_I, tLDSHA_I, tLDSWA_I, tLDUBA_I, tLDUHA_I, tLDUWA_I, tLDXA_I, -1);;
!!# 
!!#    IJ_iseg_generate_from_token ("diag.j", 244,1, ISEG, 0,th_0,  Ro_fakedma, tSTB_I, tSTH_I, tSTW_I, tSTX_I, tSTBA_I, tSTHA_I, tSTWA_I, tSTXA_I, tSTB_R, tSTH_R, tSTW_R, tSTX_R, tSTBA_R, tSTHA_R, tSTWA_R, tSTXA_R, -1);;
!!# 
!!#    IJ_iseg_generate_from_token ("diag.j", 246,1, ISEG, 0,th_0,  ijdefault, tFCMPs, tFCMPd, -1);;
!!# 
!!#    IJ_iseg_generate_from_token ("diag.j", 248,1, ISEG, 0, th_0, ijdefault, tLDSB_R, tLDSH_R, tLDSW_R, tLDUB_R, tLDUH_R, tLDUW_R, tLDX_R, tLDSBA_R, tLDSHA_R, tLDSWA_R, tLDUBA_R, tLDUHA_R, tLDUWA_R, tLDXA_R, tLDSB_I, tLDSH_I, tLDSW_I, tLDUB_I, tLDUH_I, tLDUW_I, tLDX_I,  tLDSBA_I, tLDSHA_I, tLDSWA_I, tLDUBA_I, tLDUHA_I, tLDUWA_I, tLDXA_I, -1);;
!!# 
!!#    IJ_iseg_printf ("diag.j", 250,ISEG, 0, th_0, "\tbrnz %%r31,thr%y_loop_cnt_%d\n", loop_cnt);
!!#    IJ_iseg_generate_from_token ("diag.j", 251,1, ISEG, 0,th_0,  Ro_blkasi, tSTBA_R, tSTHA_R, tSTWA_R, tSTXA_R, -1);;
!!# 
!!#    loop_cnt++;
!!# 
!!#    IJ_iseg_printf ("diag.j", 255,ISEG, 0, th_0, "\tta T_CHANGE_NONPRIV\n");
!!# }
!!# ;
!!# 
!!# fakedma_ld: mMETAfakedma_ld
!!# {
!!#    fakedma_loop = 1;
!!#    IJ_iseg_generate_from_token ("diag.j", 262,1, ISEG, 0, th_0, Ro_fakedma, tLDSB_R, tLDSH_R, tLDSW_R, tLDUB_R, tLDUH_R, tLDUW_R, tLDX_R, tLDSBA_R, tLDSHA_R, tLDSWA_R, tLDUBA_R, tLDUHA_R, tLDUWA_R, tLDXA_R, tLDSB_I, tLDSH_I, tLDSW_I, tLDUB_I, tLDUH_I, tLDUW_I, tLDX_I,  tLDSBA_I, tLDSHA_I, tLDSWA_I, tLDUBA_I, tLDUHA_I, tLDUWA_I, tLDXA_I, -1);;
!!# }
!!# ;
!!# 
!!# fakedma_st: mMETAfakedma_st
!!# {
!!#    fakedma_loop = 1;
!!#    IJ_iseg_generate_from_token ("diag.j", 269,1, ISEG, 0,th_0,  Ro_fakedma, tSTB_I, tSTH_I, tSTW_I, tSTX_I, tSTBA_I, tSTHA_I, tSTWA_I, tSTXA_I, tSTB_R, tSTH_R, tSTW_R, tSTX_R, tSTBA_R, tSTHA_R, tSTWA_R, tSTXA_R, tSTF_R, tSTFA_R, tSTDF_R, tSTDFA_R, tSTF_I, tSTFA_I, tSTDF_I, tSTDFA_I, -1);;
!!# }
!!# ;
!!# 
!!# ld_fp_i: tLDFA_I | tLDDFA_I | tLDF_I | tLDDF_I
!!# ;
!!# 
!!# ld_fp_r: tLDFA_R | tLDDFA_R | tLDF_R | tLDDF_R
!!# ;
!!# 
!!# mul_i: tMULX_I | tUMUL_I | tSMUL_I | tUMULcc_I | tSMULcc_I | tMULScc_I
!!# ;
!!# 
!!# mul_r: tMULX_R | tUMUL_R | tSMUL_R | tUMULcc_R | tSMULcc_R | tMULScc_R
!!# ;
!!# 
!!# div_i: tUDIV_I | tSDIV_I | tSDIVX_I | tUDIVX_I | tUDIVcc_I | tSDIVcc_I 
!!# ;
!!# 
!!# div_r: tUDIV_R | tSDIV_R | tSDIVX_R | tUDIVX_R | tUDIVcc_R | tSDIVcc_R 
!!# ;
!!# 
!!# load_r: tLDSB_R | tLDSH_R | tLDSW_R | tLDUB_R | tLDUH_R | tLDUW_R | tLDX_R 
!!# 	| tLDSBA_R | tLDSHA_R | tLDSWA_R | tLDUBA_R | tLDUHA_R | tLDUWA_R | tLDXA_R
!!# ;
!!# 
!!# load_i: tLDSB_I | tLDSH_I | tLDSW_I | tLDUB_I | tLDUH_I | tLDUW_I | tLDX_I 
!!# 	| tLDSBA_I | tLDSHA_I | tLDSWA_I | tLDUBA_I | tLDUHA_I | tLDUWA_I | tLDXA_I
!!# ;
!!# 
!!# atomic_r: tCASA_R | tCASXA_R | tLDSTUB_R | tLDSTUBA_R | tSWAP_R | tSWAPA_R
!!# ;
!!# 
!!# atomic_i: tCASA_I | tCASXA_I | tLDSTUBA_I | tLDSTUB_I | tSWAP_I | tSWAPA_I  
!!# ;
!!# 
!!# st_fp_r_s: tSTF_R | tSTFA_R
!!# ;
!!# 
!!# st_fp_r_d: tSTDF_R | tSTDFA_R
!!# ;
!!# 
!!# st_fp_i_s: tSTF_I | tSTFA_I
!!# ;
!!# 
!!# st_fp_i_d: tSTDF_I | tSTDFA_I
!!# ;
!!# 
!!# arith_fp_s:tFADDs | tFSUBs | tFMULs | tFDIVs 
!!# ;
!!# 
!!# arith_fp_d:tFADDd | tFSUBd | tFMULd | tFDIVd
!!# ;
!!# 
!!# prefetch_i: tPREFETCH_I | tPREFETCHA_I 
!!# ;
!!# 
!!# prefetch_r: tPREFETCH_R | tPREFETCHA_R 
!!# ;
!!# 
!!# store_i: tSTB_I | tSTH_I | tSTW_I | tSTX_I | tSTBA_I | tSTHA_I | tSTWA_I | tSTXA_I 
!!# ;
!!# 
!!# store_r: tSTB_R | tSTH_R | tSTW_R | tSTX_R | tSTBA_R | tSTHA_R | tSTWA_R | tSTXA_R 
!!# ;
!!# 
!!# alu_i: tADD_I | tADDcc_I | tADDC_I | tADDCcc_I | tAND_I | tANDcc_I | tANDN_I
!!#        | tANDNcc_I | tOR_I | tORcc_I | tORN_I | tORNcc_I | tXOR_I  | tXORcc_I 
!!#        | tXNOR_I | tXNORcc_I | tSLL_I | tSRL_I
!!#        |  tSRA_I | tSLLX_I | tSRLX_I | tSRAX_I | tSUB_I | tSUBcc_I | tSUBC_I 
!!# ;
!!# 
!!# alu_r: tADD_R | tADDcc_R | tADDC_R | tADDCcc_R | tAND_R | tANDcc_R | tANDN_R
!!# 	     | tANDNcc_R | tOR_R | tORcc_R | tORN_R |  tORNcc_R | tXOR_R | tXORcc_R |  tXNOR_R 
!!# 	     | tSLL_R | tSRL_R | tSRA_R | tSLLX_R | tSRLX_R | tSRAX_R | tSUB_R 
!!# 	     | tSUBcc_R | tSUBC_R | tXNORcc_R
!!# ;
!!# 
!!# mov_i: tMOVcc_I | tMOVR_I  
!!# ;
!!# 
!!# mov_r: tMOVcc_R | tMOVR_R  
!!# ;
!!# 
!!# log_fp: tFCMPs | tFCMPd
!!# ;
!!# 
!!# print_label: mMETAprint_label
!!# {
!!# 
!!#   IJ_iseg_printf ("diag.j", 359,ISEG, 0, th_0, "\n.text\n");
!!#   IJ_iseg_printf ("diag.j", 360,ISEG, 0, th_0, ".global thr0_inst_seg\n");
!!#   IJ_iseg_printf ("diag.j", 361,ISEG, 0, th_0, "thr0_inst_seg:\n");
!!# }
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

