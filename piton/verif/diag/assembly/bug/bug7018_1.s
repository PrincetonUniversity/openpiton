// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: bug7018_1.s
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
   random seed:	866911046
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

        setx  0x306dcde709aa4a7a, %r1, %r1
        setx  0xd72009500bcaffe3, %r1, %r2
        setx  0x18fb956e13323034, %r1, %r3
        setx  0x266646bfb7e5defc, %r1, %r4
        setx  0xc95220ff3f80c143, %r1, %r5
        setx  0xb87c5643becdb860, %r1, %r6
        setx  0x307778bfb7bf93ff, %r1, %r7
        setx  0x6176412c42db7ee6, %r1, %r8
        setx  0x12357a40165863cd, %r1, %r9
        setx  0x597c5866ac8e14a3, %r1, %r10
        setx  0x92a2271c752599f4, %r1, %r11
        setx  0xaf40d6f9c56734a4, %r1, %r12
        setx  0x22ae7f619eb8956e, %r1, %r13
        setx  0x0308ed5117beaac7, %r1, %r14
        setx  0x958cbaa6abdce9d7, %r1, %r15
        setx  0x316dac5153ae4da2, %r1, %r16
        setx  0x0e2fa092a61cc58b, %r1, %r17
        setx  0xb2fb514882700205, %r1, %r18
        setx  0xe830f911467b086b, %r1, %r19
        setx  0x66ddd63098455ac0, %r1, %r20
        setx  0x05a66d433022648a, %r1, %r21
        setx  0xea936c4db6cd5f51, %r1, %r22
        setx  0x1179eb0acb22e4a2, %r1, %r23
        setx  0x3640bd6751e018b3, %r1, %r24
        setx  0x4eae850ccf14dbcb, %r1, %r25
        setx  0xbec6dd6b12fc7e7d, %r1, %r26
        setx  0x939d0a6641f976bf, %r1, %r27
        setx  0x76e80fe0098965c7, %r1, %r28
        setx  0x31219aa499f6fdd4, %r1, %r29
        setx  0x66a6e72c24740184, %r1, %r30
        setx  0x06cf85d29d90adb7, %r1, %r31
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
	.word  0xdcdcf055,0xeaae3d78,0xc216a8ef,0x4c916b52
	.word  0xf15aa95e,0x86365ea3,0x19ec9e3f,0x1ccd566f
	.word  0xe85bf9cc,0x9d58cf89,0xf1138bac,0xc8fbff87
	.word  0xe1426c0c,0x0986331e,0x395fb3c9,0xc0b4a895
	.word  0x70511435,0xc025c409,0x83c1806a,0x8fcb33ea
	.word  0x23d8bb72,0xbaf38fd9,0x9c09fdf0,0x8501a3db
	.word  0xb4aa4687,0x0a87a678,0x5f25674d,0x41b27330
	.word  0xc57ccafe,0xfc88a807,0x8571bc29,0x7827883b
	.word  0x854aa47f,0xa40148fc,0x46bb9282,0xa28f0078
	.word  0x16abf3a6,0xf817781a,0x13238b69,0xfdb1bf25
	.word  0x1d358b44,0x49eea563,0x78d31b72,0x1845cfbb
	.word  0xf226c5d7,0x509e28e3,0x4bd03187,0x4ddc3f8b
	.word  0xa69bbdd4,0x01c880f2,0xdcc71104,0x79800a15
	.word  0xdcb9ca0d,0x7c6a2b07,0xd77a056e,0x7aef0959
	.word  0x862940f9,0xefeb1dc2,0x64e501b9,0x95dd7540
	.word  0xe4c65928,0x1d888188,0x28db4d2c,0xe7566bf5
	.word  0xeffb8af3,0xf5ff2eeb,0x5f270b9a,0xb291cca8
	.word  0xbb917753,0x49ab16e2,0x419a54b7,0xe89f287e
	.word  0x04f64381,0x151c496d,0x9b1b8a53,0x96923eae
	.word  0xb79de0ef,0x118f3ada,0xf13692d2,0x89a9367e
	.word  0xf9bbdd7a,0x684894cb,0x5671e39d,0x4f6acf1a
	.word  0x5596d392,0x4194d787,0x7d5840a0,0x1e0b7eb1
	.word  0x0ebbb545,0x0fa9e733,0x38fa9294,0x6d3b1d41
	.word  0x5a75fd60,0x9adf49ad,0x971294c8,0xae5a9598
	.word  0x77c52032,0xc3ef267d,0x3fb0a869,0x1c3a0819
	.word  0x2c5aaf59,0x090d481b,0x390f965e,0x78d06ca9
	.word  0x4cf0db2c,0xaeb39292,0x0bbe2a78,0x08d30462
	.word  0x719ea832,0x71fedebd,0x86b92af6,0x3eb78e21
	.word  0xa3636c79,0x18e24293,0x9e34d6fb,0x8deaeac3
	.word  0x706a1b42,0xfb9700b0,0xab72a3d3,0x4ffd3082
	.word  0x92d425cd,0xd1d99be8,0x4d7b84ce,0x8ff36440
	.word  0xf6c862e3,0xe0ced46f,0x2362b7a8,0xfb846fc1
	.word  0x7f609250,0xcdd5ff8d,0x3d6feb52,0xadd9fd83
	.word  0xf7d17a9c,0xf65b17c3,0x88d5e3a4,0x58c8c5dd
	.word  0x46f1aa19,0x701080ea,0x66f1719b,0x9b3b0e30
	.word  0x7c6a5d59,0x3c568d03,0x1760a0fb,0xfb14e4ca
	.word  0xe6117990,0xe2e4357c,0x0bd693b9,0x1cd555f9
	.word  0xaa50567b,0x4ea43213,0x6083df85,0xca9e7c12
	.word  0xe93b4738,0x5eed2438,0x22a57b6b,0x769097ee
	.word  0x145053cd,0xf103f80d,0x7d41d642,0xc2075a73
	.word  0x282a1d20,0xc8dad23b,0xbbdb566e,0x186338f2
	.word  0x9eed9508,0x2530f54f,0x833ce9c5,0x1e12f9fc
	.word  0x0169a4c5,0xcc59d72f,0x2c6acd90,0x21075135
	.word  0xb2154012,0xdbcd7ab1,0xdb534143,0x6b0c6819
	.word  0x8198f515,0x816d965c,0xda419579,0xfbe5888f
	.word  0x2cc99353,0xbe96013b,0x89bdda81,0xb9ab2019
	.word  0x53ddde49,0x8c8fe1fe,0x138d0353,0x51e80492
	.word  0xccbe46a4,0xe3a9035d,0x1fbe32db,0xe69c5b67
	.word  0x0d7b0e7a,0xaf736e3c,0xefd9919b,0xbbeaa65b
	.word  0xa57e35ec,0xf0653e90,0x635e5cfc,0x012047f3
	.word  0xcd5581aa,0x4ff29265,0xb9e4a50e,0xffcbeedc
	.word  0x83f98e1d,0x3374e8d8,0x45cfed8d,0x0edd178d
	.word  0xd12dbcca,0x41cb2aaa,0x87f2ae2b,0xa563ec9f
	.word  0x7ee7ece5,0x428adc9f,0x4cbca72c,0x62eafd39
	.word  0xc898c10e,0x33d49d54,0xe30bdfb1,0xe353fe1f
	.word  0x1c267b0b,0x674a98e9,0xf36e2a2f,0xbeccb27d
	.word  0x91f62242,0xea250182,0x13b71cf9,0x8e7d3da5
	.word  0xe15fa0f6,0xb79b8992,0x98989742,0xd829e8a8
	.word  0xbcecb036,0x0c24bb65,0x2899fe45,0xdf39c890
	.word  0xbb468312,0x6a3d3064,0xbb457472,0x0800f3e7
	.word  0xa4e90381,0xdf2b35ae,0x4adf3b03,0xfae42bb1
	.word  0x7f12c9cd,0x843210fc,0xad7f9e7c,0xb5c74f41
	.word  0xa0f1f7a5,0xb915980a,0xfbe3c86b,0x44ba731f
	.word  0xceeb274a,0xa74cec62,0x94ca2717,0xf19763dd
	.word  0xc4cfe50b,0x4ff94960,0xca8647f3,0x237dc27d
	.word  0x87eed20c,0x0e289765,0x5eb034d2,0x829c5084
	.word  0x2127f6e0,0x5c528a86,0xcb58a85b,0x3823982a
	.word  0xc29e5688,0xbea1bc21,0x6f86ed64,0x510a944b
	.word  0x603cfa8f,0x6a8cb833,0xfb9fd77d,0x38cb2735
	.word  0x19d4c625,0x5a428da9,0x68d913f2,0xc5529915
	.word  0x5b4cc619,0x1fb856e0,0xff627e42,0x86f3cfd9
	.word  0x3a12497a,0xb39fe7b6,0x99b8a48e,0x8acc22e4
	.word  0x0f28fc97,0x1abf2ad7,0x6bb1d588,0xe67447c1
	.word  0x83e6f527,0x660a29e5,0xcb5a6b25,0xed83b02d
	.word  0x5967fbbd,0x1b832297,0xda4ff6ee,0xdedd7b05
	.word  0xf26200e7,0x26cd5b47,0x05ce220d,0x51b84c22
	.word  0x806cdd6c,0xa6a461fd,0xe8355c01,0xc805d696
	.word  0xabd3a15e,0xdbe39d0e,0xfef1328f,0xfef99e22
	.word  0xc9df2eaf,0x29f423f7,0x72939109,0x585f2a5a
	.word  0x5394d760,0x32fe5562,0x9819cc86,0x6c73f6e4
	.word  0x84a444db,0x03ff30ed,0xde33abbc,0x396e1ddc
	.word  0xc8d2801d,0x8ac165dc,0x2c72d946,0x5a8c9f3b
	.word  0x2015c0a9,0xba909b45,0xafa1ef9e,0x4c17afe9
	.word  0x2bd58682,0xc184c6ea,0xd802086f,0xc6f7634a
	.word  0x7e57e535,0xb48b8a5e,0xdca9573c,0x3bb6c8d8
	.word  0x36a78921,0xda8f3acc,0x423a92a2,0x9885282f
	.word  0x94b95891,0x971ed1c1,0x014b98bd,0x6b9a0b8f
	.word  0xa4d22db3,0xdca08cbf,0x5477db0f,0x49f0a078
	.word  0x3a4e0f98,0x5dfa5bce,0x54f5fbb4,0x8522afe9
	.word  0x2c4ac428,0xd5f8480a,0x9dc4c3e8,0x300f4705
	.word  0xbccce930,0xbaea1d44,0x581b7a08,0xe3ce70ed
	.word  0x4572e393,0x7ba761b1,0xae3b463e,0x7dad932b
	.word  0x1cac42c3,0x259e93c6,0xb4cf9b80,0xc45c0a6d
	.word  0x6bc209d8,0x7025bc87,0x247e3413,0xb11f27ed
	.word  0x022ee644,0x69df9ee8,0x3b3f64f2,0x47228697
	.word  0x861abd5a,0x8fb2e722,0xab39b8f5,0xc4a08e1d
	.word  0x61e51771,0x1dc5692f,0xcb66787d,0x5ece88e3
	.word  0x9654aaf0,0x73ba96e5,0x566c7037,0x2a2ab468
	.word  0xd0546bb7,0xab9d8df5,0xa0c7cdd0,0x648fec6d
	.word  0xfe033aa6,0xc38500b5,0x060fda83,0x40cd7c51
	.word  0x3e9b5997,0xe4257060,0xeade3cf4,0xebf65092
	.word  0xed8fdf54,0x554582c8,0xad650d6e,0xc2db6c5d
	.word  0x58f79665,0x72e832f2,0xcfdd40c9,0x100be6d0
	.word  0xbb94d747,0xa3f34ee5,0x4c96caf9,0x091dc99c
	.word  0xf9f66de5,0x4fd855ae,0x5129afaa,0x6163a34c
	.word  0xb3565340,0x45424030,0x1f170dcc,0x6e449e09
	.word  0x7c2254b7,0x13152582,0x1b4e7ec8,0xe209b256
	.word  0x6bebf864,0xdbdc4385,0x16368291,0x5f778f18
	.word  0x1a1f2569,0x91552252,0x1d98b7c1,0xb3d6ec66
	.word  0x4e347cc0,0x69e235fe,0x32c9a8e9,0xa79a0aa9
	.word  0xd5d09c82,0x073337a9,0x6fe5d9b3,0x70bc55c6
	.word  0x08eb6068,0xcc891dad,0xf2d32388,0x11af11f4
	.word  0x39bf7370,0xefb406f4,0xc863655b,0x8ddeac72
	.word  0x02c0a006,0x1a9421db,0x57eaaaf8,0xb4183f5a
	.word  0x49cddff7,0x64c5310c,0x4332a04a,0xfc02cf7a
	.word  0xe7080b78,0x9a36ee0f,0xf82caefe,0x3b7a3561
	.word  0xae43c8a9,0x0e0091ab,0xea9ec8ac,0x70e40a98
	.word  0x3fc733c1,0x8cb47ae8,0x36f143c5,0xa225cbc6
	.word  0x2b72eee7,0x7c9f8cdb,0x5087acf7,0xaa69f533
	.word  0x8a0a54e0,0x339c5750,0x1737fadb,0xff97b171
	.word  0x5232b72f,0x34243786,0x6e5b8f0e,0x111ffff5
	.word  0x02eeb7b2,0xf596edb9,0xb191610c,0xa62f5b90
	.word  0xbdc2d76c,0x60471da5,0x080e191c,0xc7aa759a
	.word  0x0ae31ec7,0xf27fed61,0x45f48e7c,0xa7939900
	.word  0x6520d2f0,0x46c69a23,0x6528106c,0xf237aa3a
	.word  0xfc0724ac,0x2493440a,0x969a6251,0xd5639663
	.word  0x1c030ff6,0x03a8647c,0x23045b11,0x7f711533
	.word  0x9bd9c5d5,0xfe6d4d87,0xecc2c80a,0xc5e92da8
	.word  0x6b4ab664,0x95d9666e,0x090b4bae,0xfc1924b9
	.word  0xb6089d28,0xf416e774,0x3ca684cc,0x446cdd68
	.word  0xe622806a,0xf3702520,0xc8697c0c,0xb185751a
	.word  0x4d3b8ee0,0xa27f5904,0x18ac8fa8,0xd1b9680f
	.word  0x6ab8bf97,0xfbba169f,0x0ab9c82c,0x146aa1e8
	.word  0xfc3b1e26,0xa9e00971,0x8ad1d8d0,0x17ce32fb
	.word  0x2e059011,0x1193efc6,0xa1e45ab5,0x764f5bd3
	.word  0x88cfb859,0x4d8cf771,0xc566e650,0x24880815
	.word  0x4d38fe28,0x57c96777,0x5de30c41,0x46830c9a
	.word  0xd2362acf,0x01fb38af,0xe7fe4000,0x543e8b11
	.word  0x63e1f972,0x2881e3b5,0xd7101d64,0x32b90ebc
	.word  0x51a3b1d7,0xae7def53,0x2c0004d5,0x223d37bd
	.word  0x2b0a53d7,0x94e1dd92,0xa16f5d0d,0x81227483
	.word  0xc48c1dd8,0x47151d73,0x6673373b,0x77db8e1e
	.word  0x9ebbfdd5,0xbb584441,0xd8ce3c3f,0x47443a39
	.word  0xbe7fa932,0xc446bd06,0x2ed73785,0x779dc2c8
	.word  0x4cb69966,0x9ec49e7c,0xd87ab255,0x7237bc3f
	.word  0x2def7937,0x350de247,0x9458f54e,0x070c8c5f
	.word  0x7241ae40,0x05dcfe1d,0x5f8f86b4,0x40a54b4e
	.word  0xfd1c5f5a,0xd9d8df5d,0xf3632a5e,0xf9cd5345
	.word  0x3d56fc90,0xfe707c95,0x0277c08e,0x8751875e
	.word  0x654fcd8c,0x43877f89,0x34a1d6a7,0xa4b2831d
	.word  0xa0173578,0x74e9fa9f,0xc9b17d8a,0xa2e09e55
	.word  0x1c60f0a2,0x6a858dd6,0x88c73db7,0x35d9ea6f
	.word  0x279cf803,0x29aa34b9,0x54981d50,0x607379f8
	.word  0xeecccc1b,0x8944b982,0x18cf357f,0xd40c2e29
	.word  0x0c3196ae,0xc91ca198,0xf3b94a3c,0x731a78d6
	.word  0x16b864e9,0x082a513a,0xac71f34e,0x8b89bec3
	.word  0x4483322a,0x918a6644,0x805501ec,0x8b969401
	.word  0x6854eb35,0x913a06ea,0x4f96b76e,0xbf7b16bf
	.word  0x1d57a908,0x54caea31,0x96a5f244,0xbc1396c2
	.word  0xf8f7490a,0xe9f2f191,0xdf6ec3e0,0xf67794c2
	.word  0x2b1e3ae1,0x7f13e730,0x55fb7822,0xa9e3d1e2
	.word  0x8fe08f6f,0x77ae7d41,0x56a19f4c,0x79785fd4
	.word  0xdb2be4e3,0x45f31dd2,0x1432d647,0x6e83097a
	.word  0x7ab62627,0x824efd45,0xa7d03819,0xe7b08038
	.word  0xd9a00caa,0x736972d1,0x905cf206,0x4ce7fcd0
	.word  0x5d0c5a5f,0xa838dccd,0x43bee847,0xdbb80172
	.word  0x5ccb4580,0xfe0cffef,0xac216d07,0x3207d0a4
	.word  0x4cfd4ec2,0x3d155e09,0xab3eeca6,0x6c2d33d0
	.word  0x8dff05e4,0x354a3609,0xd3de5e59,0x9cf2797c
	.word  0x92926176,0xc0977db8,0xe169d85c,0xd4d7d47b
	.word  0xfab4d6c8,0xffc67cbc,0x0d774f79,0x06f7b971
	.word  0x76c46e0e,0xfe4a6dd2,0x23119b37,0x0062d485
	.word  0x01969f56,0xaa1db2c0,0x3a68b79c,0x5c815870
	.word  0x9e9e0661,0x19b5e213,0xb289c3f4,0x6e24f8a3
	.word  0xafc42fd2,0xf787d958,0x213bef6e,0xca14ddfa
	.word  0x290f2f74,0x6df408ab,0x969f117d,0x3f49923d
	.word  0x063b3584,0xcb6b5689,0x518f97c7,0xfd7f64ab
	.word  0x1e0fc7a3,0xa827d14d,0x7a0bf419,0x36572673
	.word  0x886e604c,0xd3dedcf5,0xa1e149c9,0xda460882
	.word  0x0e629687,0x18ba35b7,0x66bb5c45,0x7665cba0
	.word  0x831ddc15,0xb78c269b,0x2dc17e1e,0xbababfa0
	.word  0x532bf089,0xf6d9bf3a,0x2d175383,0xc5bee115
	.word  0xfac848af,0xc6a35eed,0xefa6ffe0,0x695eaee3
	.word  0x630ca8db,0x6e3d6a4c,0x56036a56,0xed2509e7
	.word  0xf63ba6e3,0x11af9085,0x96967fb4,0x0ef4a11a
	.word  0x3a5c4fc0,0xcb682311,0x58e2523d,0x7f93f001
	.word  0x71e02802,0xd88d5978,0x84467489,0x58a4eea2
	.word  0xe832a84c,0xf4db2de3,0xb18e346a,0x4832d9d0
	.word  0x9f4beeda,0x0c948216,0xabe010ed,0x6a383f4f
	.word  0xff985d3e,0xbc51178e,0xe1500c66,0x1ee2ddf8
	.word  0x434d4f4a,0x03d1260d,0x138340fb,0x06c9b03e
	.word  0xe229a4a0,0x542d2dbc,0xfd14f5ba,0x47ddbaa0
	.word  0x0850cc57,0xee842e71,0x4dee1b8f,0x8d82a438
	.word  0xc155ac6a,0x163cf34a,0xd895fbea,0x27e896f5
	.word  0x74b44217,0x0094c2ee,0x1da6867a,0xab478328
	.word  0x94b0edfd,0xd98496b2,0x298e1d15,0xa206370e
	.word  0x30e6ad2d,0x6814d397,0x944fbea0,0x7ecbddd9
	.word  0x43ddae14,0x7f330527,0x53c2b2eb,0x7d842c64
	.word  0x8ce49c74,0xa13556b1,0xdf7dcaaa,0x153f2cc2
	.word  0x3933cbf8,0x6a5c0321,0x42ef49a6,0x928e5440
	.word  0x1007e763,0x85b0b7c1,0xd1ba5d0e,0xb46555a3
	.word  0xadaacd81,0xed474cd0,0x11d92828,0x3e13018b
	.word  0x2ad25819,0x7f5b0efa,0xd33191f8,0xb6d66c5e
	.word  0x0180e962,0x8d68f9a8,0xe1c32fa7,0x567d464a
	.word  0x2e881043,0x1b9c658d,0xf7156fc9,0x652c9a6e
	.word  0xa1073dbb,0xefba3899,0xdbb57dd7,0xb5b56e22
	.word  0x8126af47,0x1c5c3f59,0x5669d836,0xa86b88c4
	.word  0x40245838,0x0cef2423,0xbcb81b52,0x45f6f0f7
	.word  0x11bd9387,0x4a1cd535,0x4ad25a09,0xe70ececd
	.word  0x4081bc2b,0x3d991345,0x57917a5c,0x873edcb8
	.word  0x0cc78014,0x63097f64,0x27c145be,0x3fb7fcf9
	.word  0xd5919737,0x09bfae20,0xb74b49f2,0x94d97519
	.word  0x3d71112a,0xee5e3539,0x298b4671,0xfedf354d
	.word  0x769cd14a,0xf5ee390f,0xd198ed26,0xe48dea9b
	.word  0x943f7e6c,0x5c5f3e00,0x8a651e63,0xc2fc6273
	.word  0x923069ee,0x570469ca,0x4d2da9f6,0x6720b06f
	.word  0x994681a1,0x20f34817,0x3d4f8eef,0x619fca18
	.word  0xa92a74c5,0x09e9e936,0x916137dd,0x546901dc
	.word  0x63fd712e,0x3b521628,0x4d78339e,0xcf7b278c
	.word  0x04fb2c90,0x20c6f944,0x7b6577bf,0xfd78d5c7
	.word  0x601a514f,0xc3da8388,0x493a0989,0x70cbc502
	.word  0x8359a99b,0x3ffc9ae8,0xe4be9b20,0x62ee7264
	.word  0xe3a50565,0x1a4e3526,0x254ce574,0x46776a9b
	.word  0xb43037b5,0xe68188c0,0x74f32ad4,0xdc55bf55
	.word  0x4e7287de,0xca0e7594,0x27aa9e0d,0xdeff15a8
	.word  0x9a85744a,0x4a367718,0x9304a829,0x7c903c07
	.word  0xb1d253da,0xd6a45dcd,0x264fd09a,0x2f91ba6d
	.word  0xa74abbe3,0x10db715d,0x2b2bd8cf,0x5b26e1de
	.word  0x291c5cae,0x95c49ab5,0x7ebcd1b2,0xe0cfc4d7
	.word  0x545f41f0,0xc8fadf67,0x7c4fec7b,0xc206ee65
	.word  0xa9eb5e8e,0x8ca639e5,0x2934a16c,0x7367c1fa
	.word  0xc5a5fa3a,0x8055c172,0xf93284d4,0x7751080d
	.word  0x5b65bd91,0x0e6a4a42,0x25a8aee8,0x2aa061f7
	.word  0xaa331f25,0x4306c0f2,0xf703f581,0x1bdac345
	.word  0x2569ae5a,0x7b2f20b9,0xf6e1c974,0xa2f3c48e
	.word  0xee878969,0x253ff9fc,0x0cc20efe,0x0c9ee920
	.word  0x68d5880b,0xdb5e2fc5,0xdaf287ff,0x4e622e1f
	.word  0x0e651ef1,0x0750b1df,0x65383f89,0x04a65f79
	.word  0xdf7b1c44,0x40aa91dd,0x6101d88c,0xf2327048
	.word  0xd853ad3a,0xbea54baf,0xd9796dd5,0x2f35e254
	.word  0x28dfdc31,0xc04bb23d,0xf702fbcc,0xdd3fb5f2
	.word  0xb60eefe1,0x5d26f8a5,0x487fecb6,0xf8b8ca43
	.word  0x50a3c128,0x11d23ff8,0x21611233,0x754fb79d
	.word  0xcf5afe0b,0xa9d6dca6,0xddbeaff6,0x76047620
	.word  0x7bf4695e,0xbbd1c01e,0xfc48a291,0x212d481b
	.word  0x6b0bee52,0x495053c5,0xe5d99656,0x39a42c47
	.word  0xf1464f12,0x33e4c4c9,0xd604105a,0x4722d134
	.word  0x6a4e3261,0x5e470ce5,0x62b7b291,0x8741e4b8
	.word  0xa213040c,0xe143acbf,0xd35a5429,0x9773fb4d
	.word  0xac8cf0fe,0xb3644916,0xdf6967cd,0x0fd24cde
	.word  0x4686d614,0xa79b2eac,0xc78ba108,0x07b0ff47
	.word  0xb1d69918,0x76da48f0,0xade0cee5,0x38bd7c10
	.word  0x4d609eb2,0x22a8cf9e,0x42c3a311,0x32c679ed
	.word  0x4eae188a,0xb282a60b,0x438f321e,0xb0d40152
	.word  0x74675650,0xff658171,0x60c4b71c,0x847d9902
	.word  0x67e917fe,0x7c4ba6ec,0x0664f52d,0xe8e180f0





SECTION .ISEG_0 TEXT_VA = 0x0000000800000000, DATA_VA = 0x0000008037da4000
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
	VA = 0x0000008037da4000,
	RA = 0x0000008037da4000,
	PA = 0x0000008037da4000,
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
	.word 0xdd04242c  ! 2: LDF_I	ld	[%r16, 0x042c], %f14
	setx  0x0000000000000440, %r1, %r2
	ta T_CHANGE_PRIV
	mov 0x7, %r31
thr0_loop_cnt_0:
	.word 0xd85967c8  ! 4: LDX_I	ldx	[%r5 + 0x07c8], %r12
	stx %fsr, [%g5 + %g2]
	.word 0xc6a40462  ! 4: STWA_R	stwa	%r3, [%r16 + %r2] 0x23
	membar #Sync
	ldx [%r16 + %g2], %fsr
	.word 0xc6f15002  ! 4: STXA_R	stxa	%r3, [%r5 + %r2] 0x80
	.word 0x907c29f9  ! 4: SDIV_I	sdiv 	%r16, 0x09f9, %r8
	.word 0xfa841002  ! 4: LDUWA_R	lduwa	[%r16, %r2] 0x80, %r29
	.word 0xada40922  ! 4: FMULs	fmuls	%f16, %f2, %f22
	membar      #Sync|#MemIssue|#LoadStore
	.word 0xc6f40542  ! 4: STXA_R	stxa	%r3, [%r16 + %r2] 0x2a
	membar #Sync
	dec %r31
	.word 0xd0c41002  ! 4: LDSWA_R	ldswa	[%r16, %r2] 0x80, %r8
	.word 0xc6314002  ! 4: STH_R	sth	%r3, [%r5 + %r2]
	.word 0x87ac0a42  ! 4: FCMPd	fcmpd	%fcc<n>, %f16, %f2
	.word 0xe8c41002  ! 4: LDSWA_R	ldswa	[%r16, %r2] 0x80, %r20
	brnz %r31,thr0_loop_cnt_0
	.word 0xc6f40442  ! 4: STXA_R	stxa	%r3, [%r16 + %r2] 0x22
	ta T_CHANGE_NONPRIV
	.word 0xd72429d8  ! 4: STF_I	st	%f11, [0x09d8, %r16]
	.word 0xd53c0002  ! 5: STDF_R	std	%f10, [%r2, %r16]
	.word 0x86940002  ! 6: ORcc_R	orcc 	%r16, %r2, %r3
	.word 0xc614210a  ! 7: LDUH_I	lduh	[%r16 + 0x010a], %r3
	setx  0x0000000000000c00, %r1, %r2
	ta T_CHANGE_PRIV
	mov 0x7, %r31
thr0_loop_cnt_1:
	.word 0xc6c16540  ! 9: LDSWA_I	ldswa	[%r5, + 0x0540] %asi, %r3
	stx %fsr, [%g5 + %g2]
	.word 0xeea40442  ! 9: STWA_R	stwa	%r23, [%r16 + %r2] 0x22
	membar #Sync
	ldx [%r16 + %g2], %fsr
	.word 0xc6a96558  ! 9: STBA_I	stba	%r3, [%r5 + 0x0558] %asi
	.word 0x867c0002  ! 9: SDIV_R	sdiv 	%r16, %r2, %r3
	.word 0xc654233a  ! 9: LDSH_I	ldsh	[%r16 + 0x033a], %r3
	.word 0x87a40842  ! 9: FADDd	faddd	%f16, %f2, %f34
	membar      #Sync|#MemIssue|#LoadStore
	.word 0xc6ac0562  ! 9: STBA_R	stba	%r3, [%r16 + %r2] 0x2b
	membar #Sync
	dec %r31
	.word 0xc6cc1002  ! 9: LDSBA_R	ldsba	[%r16, %r2] 0x80, %r3
	.word 0xc629607d  ! 9: STB_I	stb	%r3, [%r5 + 0x007d]
	.word 0x87ac0a42  ! 9: FCMPd	fcmpd	%fcc<n>, %f16, %f2
	.word 0xc6140002  ! 9: LDUH_R	lduh	[%r16 + %r2], %r3
	brnz %r31,thr0_loop_cnt_1
	.word 0xcea40442  ! 9: STWA_R	stwa	%r7, [%r16 + %r2] 0x22
	ta T_CHANGE_NONPRIV
	setx  0x0000000000000190, %r1, %r2
	ta T_CHANGE_PRIV
	mov 0x9, %r31
thr0_loop_cnt_2:
	.word 0xe4896ca8  ! 10: LDUBA_I	lduba	[%r5, + 0x0ca8] %asi, %r18
	stx %fsr, [%g5 + %g2]
	.word 0xc6a40542  ! 10: STWA_R	stwa	%r3, [%r16 + %r2] 0x2a
	membar #Sync
	ldx [%r16 + %g2], %fsr
	.word 0xc62967e5  ! 10: STB_I	stb	%r3, [%r5 + 0x07e5]
	.word 0x8e7422d5  ! 10: UDIV_I	udiv 	%r16, 0x02d5, %r7
	.word 0xc65c2238  ! 10: LDX_I	ldx	[%r16 + 0x0238], %r3
	.word 0xa3a409c2  ! 10: FDIVd	fdivd	%f16, %f2, %f48
	membar      #Sync|#MemIssue|#LoadStore
	.word 0xc6b40542  ! 10: STHA_R	stha	%r3, [%r16 + %r2] 0x2a
	membar #Sync
	dec %r31
	.word 0xdcdc1002  ! 10: LDXA_R	ldxa	[%r16, %r2] 0x80, %r14
	.word 0xc6a95002  ! 10: STBA_R	stba	%r3, [%r5 + %r2] 0x80
	.word 0x87ac0a42  ! 10: FCMPd	fcmpd	%fcc<n>, %f16, %f2
	.word 0xc60c2789  ! 10: LDUB_I	ldub	[%r16 + 0x0789], %r3
	brnz %r31,thr0_loop_cnt_2
	.word 0xc6a40462  ! 10: STWA_R	stwa	%r3, [%r16 + %r2] 0x23
	ta T_CHANGE_NONPRIV
	setx  0x0000000000000960, %r1, %r2
	ta T_CHANGE_PRIV
	mov 0x5, %r31
thr0_loop_cnt_3:
	.word 0xea094002  ! 11: LDUB_R	ldub	[%r5 + %r2], %r21
	stx %fsr, [%g5 + %g2]
	.word 0xc6ac0442  ! 11: STBA_R	stba	%r3, [%r16 + %r2] 0x22
	membar #Sync
	ldx [%r16 + %g2], %fsr
	.word 0xc6a16318  ! 11: STWA_I	stwa	%r3, [%r5 + 0x0318] %asi
	.word 0x8f6c2c45  ! 11: SDIVX_I	sdivx	%r16, 0x0c45, %r7
	.word 0xc60c27b4  ! 11: LDUB_I	ldub	[%r16 + 0x07b4], %r3
	.word 0xb5a408a2  ! 11: FSUBs	fsubs	%f16, %f2, %f26
	membar      #Sync|#MemIssue|#LoadStore
	.word 0xcef40542  ! 11: STXA_R	stxa	%r7, [%r16 + %r2] 0x2a
	membar #Sync
	dec %r31
	.word 0xe8941002  ! 11: LDUHA_R	lduha	[%r16, %r2] 0x80, %r20
	.word 0xc6296535  ! 11: STB_I	stb	%r3, [%r5 + 0x0535]
	.word 0x87ac0a42  ! 11: FCMPd	fcmpd	%fcc<n>, %f16, %f2
	.word 0xc644204c  ! 11: LDSW_I	ldsw	[%r16 + 0x004c], %r3
	brnz %r31,thr0_loop_cnt_3
	.word 0xcca40462  ! 11: STWA_R	stwa	%r6, [%r16 + %r2] 0x23
	ta T_CHANGE_NONPRIV
	.word 0xc7bc1002  ! 11: STDFA_R	stda	%f3, [%r2, %r16]
	.word 0xc7396ca0  ! 13: STDF_I	std	%f3, [0x0ca0, %r5]
	setx  0x0000000000000380, %r1, %r2
	ta T_CHANGE_PRIV
	mov 0x6, %r31
thr0_loop_cnt_4:
	.word 0xc6d968f8  ! 14: LDXA_I	ldxa	[%r5, + 0x08f8] %asi, %r3
	stx %fsr, [%g5 + %g2]
	.word 0xe8b40442  ! 14: STHA_R	stha	%r20, [%r16 + %r2] 0x22
	membar #Sync
	ldx [%r16 + %g2], %fsr
	.word 0xf4b15002  ! 14: STHA_R	stha	%r26, [%r5 + %r2] 0x80
	.word 0x866c0002  ! 14: UDIVX_R	udivx 	%r16, %r2, %r3
	.word 0xcecc1002  ! 14: LDSBA_R	ldsba	[%r16, %r2] 0x80, %r7
	.word 0xafa40922  ! 14: FMULs	fmuls	%f16, %f2, %f23
	membar      #Sync|#MemIssue|#LoadStore
	.word 0xc6b40542  ! 14: STHA_R	stha	%r3, [%r16 + %r2] 0x2a
	membar #Sync
	dec %r31
	.word 0xd84c0002  ! 14: LDSB_R	ldsb	[%r16 + %r2], %r12
	.word 0xeab15002  ! 14: STHA_R	stha	%r21, [%r5 + %r2] 0x80
	.word 0x87ac0a42  ! 14: FCMPd	fcmpd	%fcc<n>, %f16, %f2
	.word 0xc6d42e58  ! 14: LDSHA_I	ldsha	[%r16, + 0x0e58] %asi, %r3
	brnz %r31,thr0_loop_cnt_4
	.word 0xc6b40462  ! 14: STHA_R	stha	%r3, [%r16 + %r2] 0x23
	ta T_CHANGE_NONPRIV
	setx  0x0000000000000e40, %r1, %r2
	ta T_CHANGE_PRIV
	mov 0x5, %r31
thr0_loop_cnt_5:
	.word 0xc6895002  ! 15: LDUBA_R	lduba	[%r5, %r2] 0x80, %r3
	stx %fsr, [%g5 + %g2]
	.word 0xe4b40542  ! 15: STHA_R	stha	%r18, [%r16 + %r2] 0x2a
	membar #Sync
	ldx [%r16 + %g2], %fsr
	.word 0xc6b15002  ! 15: STHA_R	stha	%r3, [%r5 + %r2] 0x80
	.word 0xac740002  ! 15: UDIV_R	udiv 	%r16, %r2, %r22
	.word 0xc6042f48  ! 15: LDUW_I	lduw	[%r16 + 0x0f48], %r3
	.word 0x87a40842  ! 15: FADDd	faddd	%f16, %f2, %f34
	membar      #Sync|#MemIssue|#LoadStore
	.word 0xe6b40442  ! 15: STHA_R	stha	%r19, [%r16 + %r2] 0x22
	membar #Sync
	dec %r31
	.word 0xc6042450  ! 15: LDUW_I	lduw	[%r16 + 0x0450], %r3
	.word 0xfaa96e20  ! 15: STBA_I	stba	%r29, [%r5 + 0x0e20] %asi
	.word 0x87ac0a42  ! 15: FCMPd	fcmpd	%fcc<n>, %f16, %f2
	.word 0xd04c2f68  ! 15: LDSB_I	ldsb	[%r16 + 0x0f68], %r8
	brnz %r31,thr0_loop_cnt_5
	.word 0xc6ac0562  ! 15: STBA_R	stba	%r3, [%r16 + %r2] 0x2b
	ta T_CHANGE_NONPRIV
	setx  0x0000000000000b70, %r1, %r2
	ta T_CHANGE_PRIV
	mov 0x8, %r31
thr0_loop_cnt_6:
	.word 0xc6496675  ! 16: LDSB_I	ldsb	[%r5 + 0x0675], %r3
	stx %fsr, [%g5 + %g2]
	.word 0xf2a40562  ! 16: STWA_R	stwa	%r25, [%r16 + %r2] 0x2b
	membar #Sync
	ldx [%r16 + %g2], %fsr
	.word 0xf02961ca  ! 16: STB_I	stb	%r24, [%r5 + 0x01ca]
	.word 0x866c2d22  ! 16: UDIVX_I	udivx 	%r16, 0x0d22, %r3
	.word 0xd8842424  ! 16: LDUWA_I	lduwa	[%r16, + 0x0424] %asi, %r12
	.word 0xb5a40822  ! 16: FADDs	fadds	%f16, %f2, %f26
	membar      #Sync|#MemIssue|#LoadStore
	.word 0xc6f40542  ! 16: STXA_R	stxa	%r3, [%r16 + %r2] 0x2a
	membar #Sync
	dec %r31
	.word 0xc6941002  ! 16: LDUHA_R	lduha	[%r16, %r2] 0x80, %r3
	.word 0xc6b15002  ! 16: STHA_R	stha	%r3, [%r5 + %r2] 0x80
	.word 0x87ac0a22  ! 16: FCMPs	fcmps	%fcc<n>, %f16, %f2
	.word 0xd00c0002  ! 16: LDUB_R	ldub	[%r16 + %r2], %r8
	brnz %r31,thr0_loop_cnt_6
	.word 0xc6ac0542  ! 16: STBA_R	stba	%r3, [%r16 + %r2] 0x2a
	ta T_CHANGE_NONPRIV
	.word 0xf6142604  ! 16: LDUH_I	lduh	[%r16 + 0x0604], %r27
	.word 0xe79c1002  ! 17: LDDFA_R	ldda	[%r16, %r2], %f19
	.word 0x877c2401  ! 18: MOVR_I	movre	%r16, 0x1, %r3
	.word 0xb8240002  ! 19: SUB_R	sub 	%r16, %r2, %r28
	.word 0xc6ac23c6  ! 20: STBA_I	stba	%r3, [%r16 + 0x03c6] %asi
	setx  0x00000000000008a0, %r1, %r2
	ta T_CHANGE_PRIV
	mov 0x8, %r31
thr0_loop_cnt_7:
	.word 0xc6916ca2  ! 22: LDUHA_I	lduha	[%r5, + 0x0ca2] %asi, %r3
	stx %fsr, [%g5 + %g2]
	.word 0xd8f40542  ! 22: STXA_R	stxa	%r12, [%r16 + %r2] 0x2a
	membar #Sync
	ldx [%r16 + %g2], %fsr
	.word 0xc6f16ef8  ! 22: STXA_I	stxa	%r3, [%r5 + 0x0ef8] %asi
	.word 0x8c6c2239  ! 22: UDIVX_I	udivx 	%r16, 0x0239, %r6
	.word 0xccdc1002  ! 22: LDXA_R	ldxa	[%r16, %r2] 0x80, %r6
	.word 0x97a40822  ! 22: FADDs	fadds	%f16, %f2, %f11
	membar      #Sync|#MemIssue|#LoadStore
	.word 0xc6f40442  ! 22: STXA_R	stxa	%r3, [%r16 + %r2] 0x22
	membar #Sync
	dec %r31
	.word 0xeec41002  ! 22: LDSWA_R	ldswa	[%r16, %r2] 0x80, %r23
	.word 0xc6a95002  ! 22: STBA_R	stba	%r3, [%r5 + %r2] 0x80
	.word 0x87ac0a42  ! 22: FCMPd	fcmpd	%fcc<n>, %f16, %f2
	.word 0xc6042358  ! 22: LDUW_I	lduw	[%r16 + 0x0358], %r3
	brnz %r31,thr0_loop_cnt_7
	.word 0xc6ac0462  ! 22: STBA_R	stba	%r3, [%r16 + %r2] 0x23
	ta T_CHANGE_NONPRIV
	.word 0x86442814  ! 22: ADDC_I	addc 	%r16, 0x0814, %r3
	setx  0x00000000000004d0, %r1, %r2
	ta T_CHANGE_PRIV
	mov 0x6, %r31
thr0_loop_cnt_8:
	.word 0xe4d95002  ! 24: LDXA_R	ldxa	[%r5, %r2] 0x80, %r18
	stx %fsr, [%g5 + %g2]
	.word 0xd2b40442  ! 24: STHA_R	stha	%r9, [%r16 + %r2] 0x22
	membar #Sync
	ldx [%r16 + %g2], %fsr
	.word 0xe4f15002  ! 24: STXA_R	stxa	%r18, [%r5 + %r2] 0x80
	.word 0x866c2fef  ! 24: UDIVX_I	udivx 	%r16, 0x0fef, %r3
	.word 0xc64c2fd2  ! 24: LDSB_I	ldsb	[%r16 + 0x0fd2], %r3
	.word 0x9ba409c2  ! 24: FDIVd	fdivd	%f16, %f2, %f44
	membar      #Sync|#MemIssue|#LoadStore
	.word 0xc6ac0542  ! 24: STBA_R	stba	%r3, [%r16 + %r2] 0x2a
	membar #Sync
	dec %r31
	.word 0xc68c28d4  ! 24: LDUBA_I	lduba	[%r16, + 0x08d4] %asi, %r3
	.word 0xcca95002  ! 24: STBA_R	stba	%r6, [%r5 + %r2] 0x80
	.word 0x87ac0a22  ! 24: FCMPs	fcmps	%fcc<n>, %f16, %f2
	.word 0xc64c0002  ! 24: LDSB_R	ldsb	[%r16 + %r2], %r3
	brnz %r31,thr0_loop_cnt_8
	.word 0xc6ac0442  ! 24: STBA_R	stba	%r3, [%r16 + %r2] 0x22
	ta T_CHANGE_NONPRIV
	ta T_GOOD_TRAP

.data
.global thr0_data_seg
thr0_data_seg:
	.xword 0x0



SECTION .ISEG_1 TEXT_VA = 0x0000000840000000, DATA_VA = 0x000000805aa8e000
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
	VA = 0x000000805aa8e000,
	RA = 0x000000805aa8e000,
	PA = 0x000000805aa8e000,
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




SECTION .ISEG_2 TEXT_VA = 0x0000000880000000, DATA_VA = 0x0000008073710000
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
	VA = 0x0000008073710000,
	RA = 0x0000008073710000,
	PA = 0x0000008073710000,
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




SECTION .ISEG_3 TEXT_VA = 0x00000008c0000000, DATA_VA = 0x000000801a716000
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
	VA = 0x000000801a716000,
	RA = 0x000000801a716000,
	PA = 0x000000801a716000,
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




SECTION .ISEG_4 TEXT_VA = 0x0000000900000000, DATA_VA = 0x00000080f41c2000
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
	VA = 0x00000080f41c2000,
	RA = 0x00000080f41c2000,
	PA = 0x00000080f41c2000,
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




SECTION .ISEG_5 TEXT_VA = 0x0000000940000000, DATA_VA = 0x00000080b2dfe000
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
	VA = 0x00000080b2dfe000,
	RA = 0x00000080b2dfe000,
	PA = 0x00000080b2dfe000,
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




SECTION .ISEG_6 TEXT_VA = 0x0000000980000000, DATA_VA = 0x00000080b9fca000
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
	VA = 0x00000080b9fca000,
	RA = 0x00000080b9fca000,
	PA = 0x00000080b9fca000,
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




SECTION .ISEG_7 TEXT_VA = 0x00000009c0000000, DATA_VA = 0x00000080fceac000
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
	VA = 0x00000080fceac000,
	RA = 0x00000080fceac000,
	PA = 0x00000080fceac000,
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




SECTION .ISEG_8 TEXT_VA = 0x0000000a00000000, DATA_VA = 0x0000008058106000
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
	VA = 0x0000008058106000,
	RA = 0x0000008058106000,
	PA = 0x0000008058106000,
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




SECTION .ISEG_9 TEXT_VA = 0x0000000a40000000, DATA_VA = 0x00000080b69c0000
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
	VA = 0x00000080b69c0000,
	RA = 0x00000080b69c0000,
	PA = 0x00000080b69c0000,
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




SECTION .ISEG_10 TEXT_VA = 0x0000000a80000000, DATA_VA = 0x000000801b8b8000
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
	VA = 0x000000801b8b8000,
	RA = 0x000000801b8b8000,
	PA = 0x000000801b8b8000,
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




SECTION .ISEG_11 TEXT_VA = 0x0000000ac0000000, DATA_VA = 0x0000008033ece000
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
	VA = 0x0000008033ece000,
	RA = 0x0000008033ece000,
	PA = 0x0000008033ece000,
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




SECTION .ISEG_12 TEXT_VA = 0x0000000b00000000, DATA_VA = 0x00000080d4776000
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
	VA = 0x00000080d4776000,
	RA = 0x00000080d4776000,
	PA = 0x00000080d4776000,
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




SECTION .ISEG_13 TEXT_VA = 0x0000000b40000000, DATA_VA = 0x000000809782a000
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
	VA = 0x000000809782a000,
	RA = 0x000000809782a000,
	PA = 0x000000809782a000,
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




SECTION .ISEG_14 TEXT_VA = 0x0000000b80000000, DATA_VA = 0x00000080fa538000
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
	VA = 0x00000080fa538000,
	RA = 0x00000080fa538000,
	PA = 0x00000080fa538000,
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




SECTION .ISEG_15 TEXT_VA = 0x0000000bc0000000, DATA_VA = 0x000000807c650000
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
	VA = 0x000000807c650000,
	RA = 0x000000807c650000,
	PA = 0x000000807c650000,
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




SECTION .ISEG_16 TEXT_VA = 0x0000000c00000000, DATA_VA = 0x00000080f8744000
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
	VA = 0x00000080f8744000,
	RA = 0x00000080f8744000,
	PA = 0x00000080f8744000,
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




SECTION .ISEG_17 TEXT_VA = 0x0000000c40000000, DATA_VA = 0x000000805cffa000
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
	VA = 0x000000805cffa000,
	RA = 0x000000805cffa000,
	PA = 0x000000805cffa000,
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




SECTION .ISEG_18 TEXT_VA = 0x0000000c80000000, DATA_VA = 0x00000080bd224000
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
	VA = 0x00000080bd224000,
	RA = 0x00000080bd224000,
	PA = 0x00000080bd224000,
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




SECTION .ISEG_19 TEXT_VA = 0x0000000cc0000000, DATA_VA = 0x00000080148b2000
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
	VA = 0x00000080148b2000,
	RA = 0x00000080148b2000,
	PA = 0x00000080148b2000,
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




SECTION .ISEG_20 TEXT_VA = 0x0000000d00000000, DATA_VA = 0x000000803545e000
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
	VA = 0x000000803545e000,
	RA = 0x000000803545e000,
	PA = 0x000000803545e000,
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




SECTION .ISEG_21 TEXT_VA = 0x0000000d40000000, DATA_VA = 0x000000803c254000
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
	VA = 0x000000803c254000,
	RA = 0x000000803c254000,
	PA = 0x000000803c254000,
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




SECTION .ISEG_22 TEXT_VA = 0x0000000d80000000, DATA_VA = 0x00000080195ce000
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
	VA = 0x00000080195ce000,
	RA = 0x00000080195ce000,
	PA = 0x00000080195ce000,
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




SECTION .ISEG_23 TEXT_VA = 0x0000000dc0000000, DATA_VA = 0x00000080331b6000
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
	VA = 0x00000080331b6000,
	RA = 0x00000080331b6000,
	PA = 0x00000080331b6000,
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




SECTION .ISEG_24 TEXT_VA = 0x0000000e00000000, DATA_VA = 0x000000803ce6e000
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
	VA = 0x000000803ce6e000,
	RA = 0x000000803ce6e000,
	PA = 0x000000803ce6e000,
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




SECTION .ISEG_25 TEXT_VA = 0x0000000e40000000, DATA_VA = 0x000000801f1a4000
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
	VA = 0x000000801f1a4000,
	RA = 0x000000801f1a4000,
	PA = 0x000000801f1a4000,
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




SECTION .ISEG_26 TEXT_VA = 0x0000000e80000000, DATA_VA = 0x00000080798f0000
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
	VA = 0x00000080798f0000,
	RA = 0x00000080798f0000,
	PA = 0x00000080798f0000,
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




SECTION .ISEG_27 TEXT_VA = 0x0000000ec0000000, DATA_VA = 0x00000080f8434000
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
	VA = 0x00000080f8434000,
	RA = 0x00000080f8434000,
	PA = 0x00000080f8434000,
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




SECTION .ISEG_28 TEXT_VA = 0x0000000f00000000, DATA_VA = 0x00000080f71e8000
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
	VA = 0x00000080f71e8000,
	RA = 0x00000080f71e8000,
	PA = 0x00000080f71e8000,
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




SECTION .ISEG_29 TEXT_VA = 0x0000000f40000000, DATA_VA = 0x000000801e2f0000
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
	VA = 0x000000801e2f0000,
	RA = 0x000000801e2f0000,
	PA = 0x000000801e2f0000,
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




SECTION .ISEG_30 TEXT_VA = 0x0000000f80000000, DATA_VA = 0x000000809235a000
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
	VA = 0x000000809235a000,
	RA = 0x000000809235a000,
	PA = 0x000000809235a000,
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




SECTION .ISEG_31 TEXT_VA = 0x0000000fc0000000, DATA_VA = 0x00000080121a2000
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
	VA = 0x00000080121a2000,
	RA = 0x00000080121a2000,
	PA = 0x00000080121a2000,
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

