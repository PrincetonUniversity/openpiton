// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: bug7018_2.s
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
   random seed:	49749318
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

        setx  0x1316fce7c156d67a, %r1, %r1
        setx  0xc8915950d3cf1fe3, %r1, %r2
        setx  0xfeaa3c6e5f4eda34, %r1, %r3
        setx  0x1b987fbf195f0ffc, %r1, %r4
        setx  0x0521a2ff25a2b043, %r1, %r5
        setx  0x347e6243afdd5d60, %r1, %r6
        setx  0xf20ae6bfffcfaeff, %r1, %r7
        setx  0x5a07a22c91e10ce6, %r1, %r8
        setx  0xa4eebf401bc571cd, %r1, %r9
        setx  0x3025e26615a004a3, %r1, %r10
        setx  0xf41ea61c3f44f8f4, %r1, %r11
        setx  0xd506edf9d4d325a4, %r1, %r12
        setx  0x4316ee618f5b476e, %r1, %r13
        setx  0x6206f851f3f32dc7, %r1, %r14
        setx  0x4069e5a6e5a096d7, %r1, %r15
        setx  0x5eec985164328ea2, %r1, %r16
        setx  0xc353bf92e62b4c8b, %r1, %r17
        setx  0x38a1b2489b4a6605, %r1, %r18
        setx  0x0f5ebe1109d4db6b, %r1, %r19
        setx  0xed641130c68803c0, %r1, %r20
        setx  0x7a094e43fc1cf68a, %r1, %r21
        setx  0x9e23ed4d2412be51, %r1, %r22
        setx  0xf2fbbe0aed8d50a2, %r1, %r23
        setx  0x27e772677a95f5b3, %r1, %r24
        setx  0x7ee1eb0c236b8dcb, %r1, %r25
        setx  0xfcbcb16be769607d, %r1, %r26
        setx  0xeca0df66522b63bf, %r1, %r27
        setx  0xf24896e0c3c3bdc7, %r1, %r28
        setx  0x6e3977a47b1f7ad4, %r1, %r29
        setx  0x0baa542c899f7584, %r1, %r30
        setx  0x22b0dcd2fa57c0b7, %r1, %r31
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
	.word  0xa09839e5,0xe4e0444a,0xf932a413,0x3bff165c
	.word  0xab0df874,0x7623da33,0x0aac072b,0x6971b0a6
	.word  0xc5571fcd,0xe25472c0,0xa910a353,0x893f7041
	.word  0xf6798cff,0xbd563d0b,0x8b338a21,0x46f50474
	.word  0xed08aa32,0x8c15e9a9,0xd197daa0,0x4c5f8318
	.word  0xdf7d9962,0x1f0c4f68,0x7ae397cf,0xdb56add2
	.word  0xd20c9975,0x1d4ac276,0x614ee9a7,0xd9991c24
	.word  0x0c8cefad,0xd1676ef6,0xe26de58c,0x6fac2041
	.word  0xfb119630,0xf3084b96,0x1cc64148,0xe0324574
	.word  0x471bcdd3,0x842b5b60,0xacce9b74,0x75dec30a
	.word  0x409e69c6,0x6137c5d2,0x00369052,0x8b2f73da
	.word  0x7883b202,0x19359226,0x6a1b9351,0xe5f72907
	.word  0x79c2b8de,0x12c726a3,0xcdd3ba5c,0x42c4516c
	.word  0x99d4b426,0xd9683042,0xcb3cd55b,0x75555f05
	.word  0x26fd99cb,0x6cf54d1f,0x8883e210,0xd4880f37
	.word  0xe0b03c80,0xb2d66a8f,0x801fb28b,0x795d93ab
	.word  0x1ba19898,0xd40c28b5,0xc9b5fc8a,0x400238d9
	.word  0x06df4f0d,0x0bd51f5e,0xa453bd58,0xdaa25b72
	.word  0xb1887604,0xa86a4777,0x9dabd0a9,0xe4cc2db2
	.word  0x91d352ae,0x29f914cb,0x34f87b08,0xdc180f7d
	.word  0xa8fa8b9e,0x6c85391c,0xaedba3cf,0x5897fc1e
	.word  0x0ba8a5dd,0xd244d4ae,0x98a01a2f,0x88e6b763
	.word  0x212aff5d,0x0460fec6,0x657ace69,0x9969c23c
	.word  0x8c066e92,0x92c8395b,0x66949771,0x60f0cd4e
	.word  0x3a969790,0x4eeb8a7c,0x4b0e6ff9,0xe84dad89
	.word  0x0e1192dc,0x368b3fff,0x6971081a,0x77c6894f
	.word  0x1577b399,0x8910b47a,0x3a45b664,0xd3e85617
	.word  0x291f1759,0x1f41ac36,0x617647b8,0xab80a737
	.word  0xadb7e7b4,0xf9bffc4d,0xfa3d4698,0x4a44dca2
	.word  0x07cd1df9,0x05fc941e,0xb4f10188,0xe68caf85
	.word  0x4f2d7eef,0x2510bde7,0xb33080c3,0x157277f1
	.word  0x9dd5c3a3,0xb5019a00,0xc752c4f3,0x89bd82e9
	.word  0x6a702dae,0x54827482,0x97cd08fc,0xfad88b57
	.word  0xccc850e2,0x01eadbbc,0x0767902b,0x2240da9b
	.word  0xc1c5c183,0xc76e20d3,0x7beb8757,0xa10ed0d5
	.word  0x017df747,0x159875cc,0x4037e159,0xa26dd1f3
	.word  0x43391cec,0xac4dbd60,0x7c649a3f,0x3311ed92
	.word  0x10db20b5,0x0d5fba6c,0x7b9d176a,0xf840189f
	.word  0x9e707d76,0xa8a258d7,0x4ec387f7,0xe0e34d91
	.word  0x0d8910ec,0x4320a151,0x9b40d3f7,0x436a9081
	.word  0x3dbfbddd,0xac864e37,0x3a0c9dcc,0xc35ae36b
	.word  0xa40ee15e,0xc6e2324f,0x74abf535,0xfd4b4d11
	.word  0xf1213a1b,0x77aee324,0x748b18e3,0xdf020718
	.word  0x03c217e1,0xeebbe4d3,0xcb815596,0xde69e8b1
	.word  0x8d1795d5,0x64cb9887,0xf40a38ac,0xae8ae3eb
	.word  0x6700d216,0x834738c3,0xc8b03b55,0xd91ed80a
	.word  0x7994b632,0x7fb01d83,0x09d10c5a,0xcd18e86f
	.word  0x7f1204d1,0xab948cd1,0x956c19a0,0xfe503869
	.word  0x99d19a40,0x88493334,0xee2f3797,0xad6ab3d8
	.word  0xda37a0a4,0xa66d394b,0x29023acc,0x46571da6
	.word  0x49a89562,0xb065241e,0x57a47ad7,0xdbd1a9ef
	.word  0xef51bab3,0xf2efe831,0x1d249cbc,0x3496ea80
	.word  0xd60702b9,0xedfaf932,0x66e01de8,0x9fcd9570
	.word  0x5f316635,0xf69abc1a,0xc295f0bc,0x2b62e3dc
	.word  0x99828126,0x2ba36107,0x1af11dc1,0xd6598129
	.word  0x9ac18b69,0x6f6964e3,0xdcd04933,0xe7ab93d6
	.word  0x0eb92582,0xb0421d6a,0x00e5289e,0xf2941c93
	.word  0x63225b8b,0xb552f086,0x436d5e7e,0x95ada3b3
	.word  0x8f5a5abf,0x75c6e34b,0x0182e0b7,0xea60be17
	.word  0xa517f253,0x0b6c6c71,0xeb660da8,0x2d9b7118
	.word  0x23df94ec,0xcc2bd6d6,0x01960829,0xdfedec6b
	.word  0x49c7d376,0xdfbb66c1,0x92e54453,0x434fa073
	.word  0x166124c5,0xd95ac0d9,0x43598dfd,0x7897e4b0
	.word  0x4c01e328,0x098ae036,0x5dc59222,0x2aac369e
	.word  0xb475760a,0xfca81005,0xce85c4cb,0x2b92e51e
	.word  0x807dfe2d,0x32d91d95,0x90ad040d,0x53d0ad69
	.word  0x8862fc0d,0x33d25049,0x62f52476,0xa6703a20
	.word  0x4ad061a1,0xcabb9661,0xf50750c0,0x17c5d14c
	.word  0x5c8c3c99,0x866eb382,0x2f6235a0,0x420a2887
	.word  0x60596be7,0xcd6015bc,0xedf4d879,0x0d96ab5a
	.word  0xb3069e28,0xd714bf1a,0x9754e921,0xeddeea6c
	.word  0xcb6e8026,0x63ea84ae,0xf3063ac3,0x70ebb798
	.word  0x736c0813,0xe93c1872,0x4224cc02,0xc1f71609
	.word  0xc473e3cc,0xae9e7eaf,0x63082825,0x6f971967
	.word  0x5a2d0109,0x4a4b208b,0xd36d2511,0xa7a11c66
	.word  0x67415718,0x9a4bd68b,0xbdc4b6ca,0x4bc468cc
	.word  0x20faf6b8,0xf4ddd3e3,0x13e3719a,0x9cbc6f07
	.word  0x9ce553e2,0x88dd8c9d,0x36981aac,0xd7b49b69
	.word  0xb2758179,0xda51794f,0xaa327331,0xc814c577
	.word  0x11d396be,0x60f7fcf2,0x8505fe00,0x73d1afd2
	.word  0x7865ada3,0x7ae07137,0x28f62d0a,0x38902874
	.word  0xcbd9993b,0xf43d6eb6,0xd7110dee,0xd6800f56
	.word  0x76ac1cac,0xb06e1ef0,0x97ee270e,0x642700c7
	.word  0x4f992cfa,0x5ad95e25,0x71109f4c,0xaa827361
	.word  0xec1480f7,0xfa3411bf,0xf22429b8,0x8555dae8
	.word  0xd1f3580a,0x640d78fc,0xc3b453a0,0x7db1b998
	.word  0x3a18c2cd,0xe9431659,0xea43f59b,0x1bd23ef2
	.word  0x34e794a6,0x447833c4,0x66f15d45,0x75007f2c
	.word  0x8ea5fb91,0x9189d200,0xb7811d4d,0x2a8d2c33
	.word  0xe534e25f,0x366a1bb6,0x83f558fe,0xc000613f
	.word  0x9e0fc72b,0x8ae1070b,0xa281b8a6,0x0a387d1c
	.word  0xab7a22ed,0x597b9c27,0xdc0e1213,0x88f3acfd
	.word  0x4c90892c,0x55d602c5,0x8b1f6192,0xe2eafcef
	.word  0x068a0726,0x5f5a6acf,0x09438666,0x91fd97d3
	.word  0x71c78676,0xe6d5ab4c,0x90266df3,0x27cb4822
	.word  0x6a10fc80,0x43f2ab6f,0x39a909c8,0xaa19754f
	.word  0xb7b44c63,0x5e6d33ad,0xb147b613,0x21224fa2
	.word  0x2d1e3422,0x75d3479b,0x936cec6a,0xf9882151
	.word  0x0793feef,0xd0a2bf66,0xc8ddc11d,0x509cc8b1
	.word  0x0833ecc0,0xfa48c2a6,0x6b18a9e8,0x808e267a
	.word  0x8f2f3a68,0x30b998a5,0x0eb4ce41,0x01b69724
	.word  0x8d8f3407,0x31e23893,0x08eb16fd,0xd870bc02
	.word  0xea776fd6,0x26fe9339,0x8b131f37,0x4123d415
	.word  0x7ae1162c,0xc7dfffff,0x8ce7d081,0x9aa17834
	.word  0xc1ce69ac,0xb93a23d6,0x99ddc947,0x2bbf8a61
	.word  0xddbd1bd9,0x91f1821b,0xba72c059,0x1a0258ee
	.word  0xfceba674,0x9b7897a4,0xc69231fe,0x01dd7deb
	.word  0x7bee54e3,0x7429db93,0x50038e9b,0x8716f0fa
	.word  0xa6c45d20,0xf12ae0b3,0xae199813,0xf43c5f67
	.word  0x4b79c656,0xa5276764,0x17abbd72,0x3b1579e2
	.word  0x711048df,0x7b18d8e6,0x07004d1d,0x02353140
	.word  0x52c5dcfe,0x8d920bf0,0xda659106,0x7ff8b117
	.word  0x0802594f,0x7ce33478,0xe70dc570,0x190a95d4
	.word  0x1fff2174,0x7bb0a49c,0xda92ce90,0x80ad6751
	.word  0xcd04cab6,0xf82bccc3,0x5eac919d,0x75b20eb9
	.word  0x7a37a9d0,0xfae73b1c,0x3a85288f,0xb11902ce
	.word  0x73760247,0xf2763aae,0xf93a8786,0x4618a37a
	.word  0xc952a386,0xa45251b7,0xd112090f,0x70fb3cc3
	.word  0x7ee8cc92,0x916af80d,0xda9f89e3,0x24fd0686
	.word  0x63e6883d,0xe58dd2c3,0x9ced0950,0xac57acae
	.word  0x438b8788,0x43529e97,0x67ebfde4,0xf112465b
	.word  0xe5bb6ade,0x7cd384a4,0x7c33c89d,0xbc87cb76
	.word  0x9ccb489c,0x26866b79,0x579f226a,0x6ecad437
	.word  0xfcdca645,0xc6c58ad5,0x4b305c0e,0x373f36bd
	.word  0x2d75b577,0x996befe7,0x04a95b62,0xa4074c15
	.word  0xe77ab2e1,0x2de06cbf,0x3093cf06,0xa090ba20
	.word  0xae6de500,0xbbec2aa6,0x0766d2dc,0xd3e56146
	.word  0x06db1b25,0x0562b27e,0x1f3dc30c,0xc2426b5d
	.word  0xcc3f69d1,0xb71bf6b2,0x8d140e7f,0xb17350b2
	.word  0x3073b728,0x4b951c00,0xb484da25,0x811094bb
	.word  0xc392c2cb,0x3a46adf2,0xc04c4404,0x948e4d06
	.word  0x55b5150e,0x2f4fa2aa,0x6e589796,0xe974fd64
	.word  0x83a62de5,0x98605805,0x0b5fcb64,0xc4ec0652
	.word  0x708ef748,0xedb4351f,0xbd186140,0xedbe2595
	.word  0x0eef8fe8,0xe64bd808,0x83aa400a,0x21df9a45
	.word  0x1176894c,0x79c62786,0x0de018a6,0x6542d0c0
	.word  0x396162dd,0x3a2eea94,0x93a89b24,0x754d63c5
	.word  0x1cad6ce3,0x8f53d509,0xb6c0b38a,0x92604118
	.word  0x03fc4d6a,0x67e8c6d7,0x496da7f2,0xdb4b133e
	.word  0x5f76f5c3,0x8457bb58,0x8bdf5317,0xbbcceb77
	.word  0xbc0517ea,0x59321d2b,0x2c2730f1,0xa9314b3f
	.word  0xf6c04787,0xf1998b18,0xb90d8ef1,0x7a67608e
	.word  0xad2f25a3,0xb42cf1b3,0x9c64e89a,0x9f1078a1
	.word  0x173c9221,0x75bbebd7,0xe1d44477,0x0290a6ec
	.word  0xdf969051,0x5b31beee,0x55ade04c,0x3c5c38f1
	.word  0x1f2a75da,0x8311bda7,0xe9e61b4f,0x444cf392
	.word  0x88034238,0x435ae7f4,0x14a65a9c,0x921d343e
	.word  0x23e4cde0,0x2b60e7b4,0x130a3adb,0x82d803eb
	.word  0x09977cf4,0x95025b46,0x7c92df89,0x943eaf39
	.word  0x5c60c5ce,0x8b40329a,0xb6204c51,0x6a0f077d
	.word  0xa73353d9,0xaf2cbb44,0xf1decd89,0x0b073382
	.word  0xdeaf670b,0x1f448ac6,0x94c4a40b,0x06b990ce
	.word  0xd8b8dba1,0x5ac6c7d7,0x94498fab,0x90b0b8eb
	.word  0x761fa7bf,0xb26e5698,0x333acca3,0x61b30a26
	.word  0x1dd57359,0xc9585b39,0x4397c207,0xdc2964c5
	.word  0x775839d0,0x6493a1cb,0x7459b2c6,0xb2eaed2c
	.word  0xa3d9c909,0xaba96041,0x04e9c0eb,0xa13cfa77
	.word  0xf7d79fb9,0xc73ab4f3,0x15641490,0x7503bcac
	.word  0x8484f62c,0x1a0498bf,0xe232df25,0x0d873c67
	.word  0x835dc5bd,0x54e74c5c,0x303c44ec,0x421ee64b
	.word  0x25e7d903,0x354738a3,0x017c30ef,0xee616927
	.word  0x07057229,0xa795cbd5,0x226edecd,0xb1fdb976
	.word  0x1d9ba8cf,0x5e56c822,0xdd2e7cdf,0x04946b97
	.word  0xe6db5719,0xfac74aeb,0x6c35a553,0xd12e54d3
	.word  0x705ba6d7,0x86d6fdd4,0xe43fd16f,0xf408309e
	.word  0x0ef08241,0x101380f5,0xa20a9121,0x2a353349
	.word  0x15432420,0x1e97bd3c,0xeef497e4,0x44cb02c5
	.word  0xce1ac8a6,0x2f682697,0xc2580c01,0xa581ea97
	.word  0x9d7fc430,0x56219126,0x6e9b9475,0x96006412
	.word  0x998a1398,0xcf1f3c0d,0x3031824a,0xbbe833f9
	.word  0xda882885,0x7ade8397,0xaf82db86,0x2d1ce339
	.word  0xa0b1a1fb,0x083c3e8b,0x7bc5809d,0xe1f1da62
	.word  0x39bda7b3,0xd33657f1,0xa427227a,0x34f66585
	.word  0x3f4915c5,0xc25a48bd,0x0c9844ef,0xda5978fc
	.word  0x11fd0215,0x331830b4,0x8ef237c0,0xb062b44d
	.word  0xe49831fb,0x389dc77d,0x477ac594,0xa41c9286
	.word  0x950baf71,0xa0bd665c,0x1c0980ad,0x4d02909c
	.word  0x9f530504,0xd22c5d47,0x85d5edfa,0xb15fd47f
	.word  0x7c305267,0x5269a8cf,0x52fe83de,0xea8f0fb8
	.word  0xecc16743,0x4d84da57,0xa74ba4e4,0x1bebb07f
	.word  0x4bf3f3bd,0x5ae454b2,0x38036a7b,0x16a47392
	.word  0xd2caa6d0,0x257819e6,0xc3838959,0xed1a0637
	.word  0x69dc53bb,0x94dc5f13,0xf7339d17,0x35e6d9d8
	.word  0xd0f3b86e,0x5cd64b03,0x68e4b640,0x9447792f
	.word  0xf798e00d,0x7770cdf5,0x09e172c2,0xd68fe772
	.word  0xec40d701,0x8943db78,0x146bdce0,0x4968e27a
	.word  0x705d5b8a,0xa0ba001a,0x854b9e76,0x05acd425
	.word  0xadb950f9,0x2e17d2f0,0x65aa8f71,0xe3f59387
	.word  0x53b641cc,0x66fb4cbf,0xab0c760e,0xd7014c00
	.word  0x9ee2f061,0x6bdf7fef,0x3a7a3d9e,0xfdbb533c
	.word  0x8e9e2028,0xfcd1f253,0x1782fbba,0x4344dd3e
	.word  0x9d9e2a30,0xc3b72d92,0xd40adbd5,0x3948cc2a
	.word  0x6b779822,0xe37fec0a,0x6cac26fe,0x16751d97
	.word  0x026b1eb1,0xe8186ff0,0x87c28cf3,0x46dabf05
	.word  0x5bc38088,0x7903a38f,0xc24ac71c,0xf45fda87
	.word  0x9fb78e83,0xa0184728,0x0e91bf09,0xa21d6b6d
	.word  0x0f3c0ed2,0x076b8f13,0xeffc2092,0x62f0a88f
	.word  0xcb22b11e,0x9260548c,0xc716b73b,0x10c19884
	.word  0x2fdf0f99,0xfbc7a343,0x65a61a90,0xa7cb9b19
	.word  0xea5635cb,0xfd012853,0xae21addb,0xe67ebee7
	.word  0xa904925a,0xc3672404,0x2aff5dd4,0x67f905af
	.word  0xa93b95fa,0x57147263,0x06badc9e,0x80dd73c6
	.word  0x6c1f7a70,0xbd860cda,0x66e07caf,0x0a6c8f21
	.word  0x11252da5,0x0b60a0c9,0x82073f47,0x2730b9f8
	.word  0xc8225c45,0xea90cbeb,0xf383b4a4,0x4abb4e1c
	.word  0xb0d1c82d,0x6b2d7540,0x9426d777,0xa022d14e
	.word  0xc171bd5e,0xb44d7bcc,0xff99314b,0xa435cb2e
	.word  0x5b0a1032,0x959c8cc7,0x3001a0fb,0x30670f90
	.word  0xbeb61b6c,0x6e6218e0,0x20e6f027,0x9b15fe16
	.word  0x10bfd733,0x866b4773,0x94e8c653,0x0427f14e
	.word  0xc8e49eb3,0xc601f544,0x211dcd6b,0xf0e46ae2
	.word  0x2d024217,0x299c84eb,0x0fd8add1,0x8f443964
	.word  0x4b31c06d,0x628a33f9,0x598a58e0,0x70e9bb13
	.word  0x257a8e26,0x20564bcf,0xd78fcb2e,0xf5929a74
	.word  0xe5906c37,0x3482ccc2,0x11db2a4f,0x2dea8109
	.word  0xff6b0992,0x9f86d22e,0xaffa9410,0xce8021cc
	.word  0x83a39810,0x555dce87,0xbb5266b0,0xb4bbcef5
	.word  0xcac5f7f7,0x7f164239,0x49aa69cc,0x058e707a
	.word  0xc3215cfa,0x885ff0d5,0xed3f851b,0x845c93a8
	.word  0x5f15bcd3,0xb6d9a81a,0xc72c10f7,0x8ce034c6
	.word  0x254df909,0x409d252b,0x36445f5c,0x6bdc798e
	.word  0xf37f090f,0x98610c8e,0x318f0f09,0xf158e8db
	.word  0xee649f1e,0xb3096bbd,0x5d69d55d,0x7f2977a7
	.word  0x2dc74849,0xff1521d2,0xce5a0320,0x6302506a
	.word  0x7955adef,0x4d28609b,0x5fe4502a,0xeddef145
	.word  0x0c217780,0xac4ed5d7,0xfdf30eba,0xb2b30d47
	.word  0x777bd2e4,0xd4d4be52,0x0076c9fb,0xbcadff21
	.word  0x18f5333c,0x49461eb9,0x2ec0df5c,0x223b338e
	.word  0x90a40606,0x4f771073,0x38492819,0x4ccf5238
	.word  0x12b334e1,0x42ea72c1,0xf7d5d3bf,0x1162609e
	.word  0x25fd6216,0x9ef9872d,0xa1768d53,0x4aa0f0b1
	.word  0x2f12910c,0x7f7fc69a,0x16ce3855,0xbadbc546
	.word  0x0b1dfd28,0xfd02b7b5,0xb3a11151,0x8d6bd7bb
	.word  0x65567adc,0xee4b48f0,0xf9fd5eea,0x77a309ed
	.word  0xe0305005,0x1519862d,0xbb9ceee5,0xdee3494d
	.word  0x7e66b229,0xb4743b19,0x9cf04d08,0xf2249fe9
	.word  0x33290b40,0x02062f9b,0x3f1ad796,0xa0ae5f62
	.word  0x4a8bead2,0xb6750bae,0xc0adbcfd,0xd73bb1a2
	.word  0x94d7e80a,0xda5c436e,0x54630a08,0xf079008e
	.word  0x8ff34d62,0x8e155da0,0x9734c2bf,0x5d6a3d18
	.word  0x6494549a,0x89eda791,0x6a8300f4,0x1ee46b3a
	.word  0x04a90c43,0x26e8853b,0xc7c551a8,0xc1f23b30
	.word  0x931cafb5,0xa21211d9,0x079e0fe5,0x712a94fb
	.word  0xfaf3da42,0x68404e3e,0xb5b5a408,0x20a419e5
	.word  0x831018c4,0x87b666c6,0x4f871723,0x9d6e245e
	.word  0xbb95ee7e,0xd95c17f1,0xfc73d2bb,0x93613c82
	.word  0xa7ff996b,0xc55179ac,0x3db0d3da,0xb0907bfc
	.word  0x542db7a8,0x39a56f2e,0xe0b62f72,0x43f43dec
	.word  0x4661cab1,0x676def60,0xdd95c03c,0x73e1e255
	.word  0x7a1795e3,0xb6f76123,0xa45d29a2,0x91ffe55c
	.word  0x1f691777,0xc8b8df64,0xd5582684,0xee3db2d0
	.word  0x42082804,0x7c81b449,0x4d1d8288,0x818a48ed
	.word  0x57688ead,0x95565c26,0xc8327c11,0xde0ab174
	.word  0x9e052218,0x046e7e2e,0x0736f222,0x9db02b35
	.word  0x5bfffe7a,0xe23dc91d,0x505a89af,0x54fc5fa9
	.word  0xe7062ba2,0x6d687e16,0x3204f456,0x54153d1f





SECTION .ISEG_0 TEXT_VA = 0x0000000800000000, DATA_VA = 0x00000080f7b7e000
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
	VA = 0x00000080f7b7e000,
	RA = 0x00000080f7b7e000,
	PA = 0x00000080f7b7e000,
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
	.word 0xc6514002  ! 2: LDSH_R	ldsh	[%r5 + %r2], %r3
	setx  0x0000000000000440, %r1, %r2
	ta T_CHANGE_PRIV
	mov 0x8, %r31
thr0_loop_cnt_0:
	.word 0xc6116dce  ! 3: LDUH_I	lduh	[%r5 + 0x0dce], %r3
	stx %fsr, [%g5 + %g2]
	.word 0xe2a40442  ! 3: STWA_R	stwa	%r17, [%r16 + %r2] 0x22
	membar #Sync
	ldx [%r16 + %g2], %fsr
	.word 0xc6214002  ! 3: STW_R	stw	%r3, [%r5 + %r2]
	.word 0x8e6c2b2c  ! 3: UDIVX_I	udivx 	%r16, 0x0b2c, %r7
	.word 0xc65c2590  ! 3: LDX_I	ldx	[%r16 + 0x0590], %r3
	.word 0xb1a40822  ! 3: FADDs	fadds	%f16, %f2, %f24
	membar      #Sync|#MemIssue|#LoadStore
	.word 0xf0a40562  ! 3: STWA_R	stwa	%r24, [%r16 + %r2] 0x2b
	membar #Sync
	dec %r31
	.word 0xf8841002  ! 3: LDUWA_R	lduwa	[%r16, %r2] 0x80, %r28
	.word 0xf8a9625b  ! 3: STBA_I	stba	%r28, [%r5 + 0x025b] %asi
	.word 0x87ac0a22  ! 3: FCMPs	fcmps	%fcc<n>, %f16, %f2
	.word 0xc60c0002  ! 3: LDUB_R	ldub	[%r16 + %r2], %r3
	brnz %r31,thr0_loop_cnt_0
	.word 0xc6f40562  ! 3: STXA_R	stxa	%r3, [%r16 + %r2] 0x2b
	ta T_CHANGE_NONPRIV
	.word 0x8654205f  ! 3: UMUL_I	umul 	%r16, 0x005f, %r3
	.word 0xd5a42768  ! 4: STFA_I	sta	%f10, [0x0768, %r16]
	.word 0xfa440002  ! 5: LDSW_R	ldsw	[%r16 + %r2], %r29
	.word 0xc7240002  ! 6: STF_R	st	%f3, [%r2, %r16]
	.word 0xa7643001  ! 7: MOVcc_I	movn	%xcc, 0x1, %r19
	.word 0xc6b16d28  ! 9: STHA_I	stha	%r3, [%r5 + 0x0d28] %asi
	.word 0x87340002  ! 9: SRL_R	srl 	%r16, %r2, %r3
	setx  0x0000000000000310, %r1, %r2
	ta T_CHANGE_PRIV
	mov 0x8, %r31
thr0_loop_cnt_1:
	.word 0xc6915002  ! 11: LDUHA_R	lduha	[%r5, %r2] 0x80, %r3
	stx %fsr, [%g5 + %g2]
	.word 0xc6a40562  ! 11: STWA_R	stwa	%r3, [%r16 + %r2] 0x2b
	membar #Sync
	ldx [%r16 + %g2], %fsr
	.word 0xc6216018  ! 11: STW_I	stw	%r3, [%r5 + 0x0018]
	.word 0x86740002  ! 11: UDIV_R	udiv 	%r16, %r2, %r3
	.word 0xf44c23f0  ! 11: LDSB_I	ldsb	[%r16 + 0x03f0], %r26
	.word 0x87a40922  ! 11: FMULs	fmuls	%f16, %f2, %f3
	membar      #Sync|#MemIssue|#LoadStore
	.word 0xc6a40562  ! 11: STWA_R	stwa	%r3, [%r16 + %r2] 0x2b
	membar #Sync
	dec %r31
	.word 0xd6c41002  ! 11: LDSWA_R	ldswa	[%r16, %r2] 0x80, %r11
	.word 0xc6a16de0  ! 11: STWA_I	stwa	%r3, [%r5 + 0x0de0] %asi
	.word 0x87ac0a22  ! 11: FCMPs	fcmps	%fcc<n>, %f16, %f2
	.word 0xde5c0002  ! 11: LDX_R	ldx	[%r16 + %r2], %r15
	brnz %r31,thr0_loop_cnt_1
	.word 0xf2b40562  ! 11: STHA_R	stha	%r25, [%r16 + %r2] 0x2b
	ta T_CHANGE_NONPRIV
	.word 0xc73c0002  ! 11: STDF_R	std	%f3, [%r2, %r16]
	.word 0x9e840002  ! 12: ADDcc_R	addcc 	%r16, %r2, %r15
	.word 0xcdbc1002  ! 13: STDFA_R	stda	%f6, [%r2, %r16]
	.word 0xc6040002  ! 14: LDUW_R	lduw	[%r16 + %r2], %r3
	.word 0xd9214002  ! 16: STF_R	st	%f12, [%r2, %r5]
	.word 0xc6294002  ! 17: STB_R	stb	%r3, [%r5 + %r2]
	.word 0xc6a96f56  ! 18: STBA_I	stba	%r3, [%r5 + 0x0f56] %asi
	.word 0xe6c41002  ! 18: LDSWA_R	ldswa	[%r16, %r2] 0x80, %r19
	.word 0xd33c0002  ! 19: STDF_R	std	%f9, [%r2, %r16]
	setx  0x00000000000007d0, %r1, %r2
	ta T_CHANGE_PRIV
	mov 0x5, %r31
thr0_loop_cnt_2:
	.word 0xc6c15002  ! 21: LDSWA_R	ldswa	[%r5, %r2] 0x80, %r3
	stx %fsr, [%g5 + %g2]
	.word 0xf6b40542  ! 21: STHA_R	stha	%r27, [%r16 + %r2] 0x2a
	membar #Sync
	ldx [%r16 + %g2], %fsr
	.word 0xc6216a90  ! 21: STW_I	stw	%r3, [%r5 + 0x0a90]
	.word 0x876c2f86  ! 21: SDIVX_I	sdivx	%r16, 0x0f86, %r3
	.word 0xe8941002  ! 21: LDUHA_R	lduha	[%r16, %r2] 0x80, %r20
	.word 0x87a40822  ! 21: FADDs	fadds	%f16, %f2, %f3
	membar      #Sync|#MemIssue|#LoadStore
	.word 0xd4ac0442  ! 21: STBA_R	stba	%r10, [%r16 + %r2] 0x22
	membar #Sync
	dec %r31
	.word 0xc6dc1002  ! 21: LDXA_R	ldxa	[%r16, %r2] 0x80, %r3
	.word 0xc6216614  ! 21: STW_I	stw	%r3, [%r5 + 0x0614]
	.word 0x87ac0a22  ! 21: FCMPs	fcmps	%fcc<n>, %f16, %f2
	.word 0xf0440002  ! 21: LDSW_R	ldsw	[%r16 + %r2], %r24
	brnz %r31,thr0_loop_cnt_2
	.word 0xc6ac0542  ! 21: STBA_R	stba	%r3, [%r16 + %r2] 0x2a
	ta T_CHANGE_NONPRIV
	.word 0x937c2401  ! 21: MOVR_I	movre	%r16, 0x1, %r9
	setx  0x0000000000000080, %r1, %r2
	ta T_CHANGE_PRIV
	mov 0x9, %r31
thr0_loop_cnt_3:
	.word 0xccd96b28  ! 23: LDXA_I	ldxa	[%r5, + 0x0b28] %asi, %r6
	stx %fsr, [%g5 + %g2]
	.word 0xdea40442  ! 23: STWA_R	stwa	%r15, [%r16 + %r2] 0x22
	membar #Sync
	ldx [%r16 + %g2], %fsr
	.word 0xcca965d4  ! 23: STBA_I	stba	%r6, [%r5 + 0x05d4] %asi
	.word 0x867c0002  ! 23: SDIV_R	sdiv 	%r16, %r2, %r3
	.word 0xc68c2029  ! 23: LDUBA_I	lduba	[%r16, + 0x0029] %asi, %r3
	.word 0x87a409a2  ! 23: FDIVs	fdivs	%f16, %f2, %f3
	membar      #Sync|#MemIssue|#LoadStore
	.word 0xc6b40562  ! 23: STHA_R	stha	%r3, [%r16 + %r2] 0x2b
	membar #Sync
	dec %r31
	.word 0xf65c0002  ! 23: LDX_R	ldx	[%r16 + %r2], %r27
	.word 0xd62968a0  ! 23: STB_I	stb	%r11, [%r5 + 0x08a0]
	.word 0x87ac0a42  ! 23: FCMPd	fcmpd	%fcc<n>, %f16, %f2
	.word 0xf0841002  ! 23: LDUWA_R	lduwa	[%r16, %r2] 0x80, %r24
	brnz %r31,thr0_loop_cnt_3
	.word 0xe8a40542  ! 23: STWA_R	stwa	%r20, [%r16 + %r2] 0x2a
	ta T_CHANGE_NONPRIV
	.word 0xc3ec1002  ! 23: PREFETCHA_R	prefetcha	[%r16, %r2] 0x80, #one_read
	ta T_GOOD_TRAP

.data
.global thr0_data_seg
thr0_data_seg:
	.xword 0x0



SECTION .ISEG_1 TEXT_VA = 0x0000000840000000, DATA_VA = 0x0000008034ee0000
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
	VA = 0x0000008034ee0000,
	RA = 0x0000008034ee0000,
	PA = 0x0000008034ee0000,
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




SECTION .ISEG_2 TEXT_VA = 0x0000000880000000, DATA_VA = 0x00000080dc8ce000
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
	VA = 0x00000080dc8ce000,
	RA = 0x00000080dc8ce000,
	PA = 0x00000080dc8ce000,
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




SECTION .ISEG_3 TEXT_VA = 0x00000008c0000000, DATA_VA = 0x00000080b9274000
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
	VA = 0x00000080b9274000,
	RA = 0x00000080b9274000,
	PA = 0x00000080b9274000,
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




SECTION .ISEG_4 TEXT_VA = 0x0000000900000000, DATA_VA = 0x000000803e5dc000
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
	VA = 0x000000803e5dc000,
	RA = 0x000000803e5dc000,
	PA = 0x000000803e5dc000,
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




SECTION .ISEG_5 TEXT_VA = 0x0000000940000000, DATA_VA = 0x00000080bce20000
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
	VA = 0x00000080bce20000,
	RA = 0x00000080bce20000,
	PA = 0x00000080bce20000,
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




SECTION .ISEG_6 TEXT_VA = 0x0000000980000000, DATA_VA = 0x00000080d4e88000
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
	VA = 0x00000080d4e88000,
	RA = 0x00000080d4e88000,
	PA = 0x00000080d4e88000,
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




SECTION .ISEG_7 TEXT_VA = 0x00000009c0000000, DATA_VA = 0x000000803b162000
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
	VA = 0x000000803b162000,
	RA = 0x000000803b162000,
	PA = 0x000000803b162000,
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




SECTION .ISEG_8 TEXT_VA = 0x0000000a00000000, DATA_VA = 0x000000801ccb8000
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
	VA = 0x000000801ccb8000,
	RA = 0x000000801ccb8000,
	PA = 0x000000801ccb8000,
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




SECTION .ISEG_9 TEXT_VA = 0x0000000a40000000, DATA_VA = 0x00000080f993a000
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
	VA = 0x00000080f993a000,
	RA = 0x00000080f993a000,
	PA = 0x00000080f993a000,
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




SECTION .ISEG_10 TEXT_VA = 0x0000000a80000000, DATA_VA = 0x000000801d01c000
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
	VA = 0x000000801d01c000,
	RA = 0x000000801d01c000,
	PA = 0x000000801d01c000,
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




SECTION .ISEG_11 TEXT_VA = 0x0000000ac0000000, DATA_VA = 0x000000809d768000
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
	VA = 0x000000809d768000,
	RA = 0x000000809d768000,
	PA = 0x000000809d768000,
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




SECTION .ISEG_12 TEXT_VA = 0x0000000b00000000, DATA_VA = 0x00000080160cc000
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
	VA = 0x00000080160cc000,
	RA = 0x00000080160cc000,
	PA = 0x00000080160cc000,
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




SECTION .ISEG_13 TEXT_VA = 0x0000000b40000000, DATA_VA = 0x00000080df774000
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
	VA = 0x00000080df774000,
	RA = 0x00000080df774000,
	PA = 0x00000080df774000,
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




SECTION .ISEG_14 TEXT_VA = 0x0000000b80000000, DATA_VA = 0x0000008017fda000
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
	VA = 0x0000008017fda000,
	RA = 0x0000008017fda000,
	PA = 0x0000008017fda000,
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




SECTION .ISEG_15 TEXT_VA = 0x0000000bc0000000, DATA_VA = 0x00000080dee0a000
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
	VA = 0x00000080dee0a000,
	RA = 0x00000080dee0a000,
	PA = 0x00000080dee0a000,
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




SECTION .ISEG_16 TEXT_VA = 0x0000000c00000000, DATA_VA = 0x00000080b9956000
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
	VA = 0x00000080b9956000,
	RA = 0x00000080b9956000,
	PA = 0x00000080b9956000,
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




SECTION .ISEG_17 TEXT_VA = 0x0000000c40000000, DATA_VA = 0x0000008016794000
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
	VA = 0x0000008016794000,
	RA = 0x0000008016794000,
	PA = 0x0000008016794000,
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




SECTION .ISEG_18 TEXT_VA = 0x0000000c80000000, DATA_VA = 0x00000080f78a6000
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
	VA = 0x00000080f78a6000,
	RA = 0x00000080f78a6000,
	PA = 0x00000080f78a6000,
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




SECTION .ISEG_19 TEXT_VA = 0x0000000cc0000000, DATA_VA = 0x000000801b6a2000
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
	VA = 0x000000801b6a2000,
	RA = 0x000000801b6a2000,
	PA = 0x000000801b6a2000,
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




SECTION .ISEG_20 TEXT_VA = 0x0000000d00000000, DATA_VA = 0x0000008094162000
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
	VA = 0x0000008094162000,
	RA = 0x0000008094162000,
	PA = 0x0000008094162000,
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




SECTION .ISEG_21 TEXT_VA = 0x0000000d40000000, DATA_VA = 0x0000008019f82000
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
	VA = 0x0000008019f82000,
	RA = 0x0000008019f82000,
	PA = 0x0000008019f82000,
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




SECTION .ISEG_22 TEXT_VA = 0x0000000d80000000, DATA_VA = 0x000000809a710000
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
	VA = 0x000000809a710000,
	RA = 0x000000809a710000,
	PA = 0x000000809a710000,
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




SECTION .ISEG_23 TEXT_VA = 0x0000000dc0000000, DATA_VA = 0x00000080549a2000
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
	VA = 0x00000080549a2000,
	RA = 0x00000080549a2000,
	PA = 0x00000080549a2000,
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




SECTION .ISEG_24 TEXT_VA = 0x0000000e00000000, DATA_VA = 0x00000080562ae000
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
	VA = 0x00000080562ae000,
	RA = 0x00000080562ae000,
	PA = 0x00000080562ae000,
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




SECTION .ISEG_25 TEXT_VA = 0x0000000e40000000, DATA_VA = 0x0000008012914000
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
	VA = 0x0000008012914000,
	RA = 0x0000008012914000,
	PA = 0x0000008012914000,
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




SECTION .ISEG_26 TEXT_VA = 0x0000000e80000000, DATA_VA = 0x0000008030d8e000
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
	VA = 0x0000008030d8e000,
	RA = 0x0000008030d8e000,
	PA = 0x0000008030d8e000,
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




SECTION .ISEG_27 TEXT_VA = 0x0000000ec0000000, DATA_VA = 0x0000008056caa000
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
	VA = 0x0000008056caa000,
	RA = 0x0000008056caa000,
	PA = 0x0000008056caa000,
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




SECTION .ISEG_28 TEXT_VA = 0x0000000f00000000, DATA_VA = 0x00000080b52d2000
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
	VA = 0x00000080b52d2000,
	RA = 0x00000080b52d2000,
	PA = 0x00000080b52d2000,
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




SECTION .ISEG_29 TEXT_VA = 0x0000000f40000000, DATA_VA = 0x00000080345f2000
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
	VA = 0x00000080345f2000,
	RA = 0x00000080345f2000,
	PA = 0x00000080345f2000,
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




SECTION .ISEG_30 TEXT_VA = 0x0000000f80000000, DATA_VA = 0x00000080196f4000
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
	VA = 0x00000080196f4000,
	RA = 0x00000080196f4000,
	PA = 0x00000080196f4000,
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




SECTION .ISEG_31 TEXT_VA = 0x0000000fc0000000, DATA_VA = 0x00000080d805e000
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
	VA = 0x00000080d805e000,
	RA = 0x00000080d805e000,
	PA = 0x00000080d805e000,
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

