// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: pio_rnd_basic3_byte_addr_rand_1.s
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
   random seed:	115848068
   Jal pio_rnd_basic3_byte_addr.j:	
********************************************************************************/



#define JBI_CONFIG
#define ASI_SWVR_INTR_RECEIVE		0x72
#define ASI_SWVR_UDB_INTR_W		0x73
#define ASI_SWVR_UDB_INTR_R		0x74

#define H_T0_Trap_Instruction_0	
#define My_T0_Trap_Instruction_0	\
	ta	0x90;			\
	done;

#define H_HT0_HTrap_Instruction_0 intr0x190_custom_trap
#define H_HT0_Interrupt_0x60      intr0x60_custom_trap

#include "boot.s"

.text
.global main

main:

th_fork(th_main, %l0)

th_main_0:
	ta	0x30

	setx	user_data_start, %l0, %l1
	setx	0xf0, %l0, %l2
loop0:	
	ldub	[%l1 + 0x7f], %l3
        deccc   %l2
	bnz	loop0
	nop
!	prefetch [%l1 + 0x3f], #n_writes

normal_end:
        ta      T_GOOD_TRAP
bad_end:
        ta      T_BAD_TRAP

user_text_end:

!***********************************************************************
!  Test case data start
!***********************************************************************
.data
user_data_start:
	.skip 1000
user_data_end:

SECTION .MY_HYP_SEC TEXT_VA = 0x1100000000, DATA_VA = 0x1100260000
attr_text {
        Name=.MY_HYP_SEC,
        hypervisor
	}

.global intr0x60_custom_trap
intr0x60_custom_trap:
	ldxa	[%g0] ASI_SWVR_INTR_RECEIVE, %g2;
	ldxa	[%g0] ASI_SWVR_UDB_INTR_R, %g1;	
	retry;

.global intr0x190_custom_trap
intr0x190_custom_trap:

!***********************************************************************
!IOSYNC cycles to start sjm
!***********************************************************************

setx 0xdeadbeefdeadbeef, %g1, %g2
setx 0xcf00beef00, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0xdeadbeefdeadbeef, %g1, %g2
setx 0xef00beef00, %g1, %g3
stx %g2, [%g3]
!=====================

!#define MAIN_PAGE_HV_ALSO
!
!#include "enable_traps.h"
!#include "boot.s"
!
!.text
!.global main
!
!main:
!
!  ta    T_CHANGE_HPRIV
!  //ta    T_CHANGE_NONHPRIV

	setx	0x000000800e8b274e, %r1, %r9
	setx	0x05eb21235ad944b6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fdbfd3e, %r1, %r9
	setx	0xb4da22033c666e7b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c37bdd7cd2, %r1, %r9
	setx	0x70a7f74aec275c6e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d5a610bf22, %r1, %r9
	setx	0xbc96369440b052cf, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e87dde0493, %r1, %r9
	setx	0x2ec7f490bb90b26b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f8699e5842, %r1, %r9
	setx	0x551f81f2c1affdc8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ed05974, %r1, %r9
	setx	0xf084f077e0b5a1c6, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f57767e, %r1, %r9
	setx	0x492c27d45b264bfa, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c7e84643c8, %r1, %r9
	setx	0x1945eb83db836e06, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d2ee73c672, %r1, %r9
	setx	0xf4b22b659d45a598, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e97d0364b8, %r1, %r9
	setx	0xbb9447f94c4a0f70, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f2d7f65b4a, %r1, %r9
	setx	0x1e34a7728c960907, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800eb7bb68, %r1, %r9
	setx	0x251920b1e318faab, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fe790c8, %r1, %r9
	setx	0x4303bf60e1633d57, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cbe9628578, %r1, %r9
	setx	0x7c85391847d242ff, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d780991168, %r1, %r9
	setx	0xb51d743cc4239665, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ea192ce6e8, %r1, %r9
	setx	0x8677565673b40172, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fac28d60d4, %r1, %r9
	setx	0x6bf590f8b26e1e47, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ecdef20, %r1, %r9
	setx	0x57804012d0ded7c3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f441098, %r1, %r9
	setx	0xd44d342d085f402f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c34de1c490, %r1, %r9
	setx	0x65d41696ca75c02c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d25923f928, %r1, %r9
	setx	0x95bee1f03740bf90, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e1c5fb8498, %r1, %r9
	setx	0xd842dbcdcab8115e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f83e55f330, %r1, %r9
	setx	0x83936eacb15dc4a0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ef21a25, %r1, %r9
	setx	0x21e1e06f978daebd, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f4f36a4, %r1, %r9
	setx	0x1c914c7aa3dd78fa, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ce94f1a87a, %r1, %r9
	setx	0x48b4c77e523078a2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d072b3032c, %r1, %r9
	setx	0x7730e32655f68281, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e0c022375a, %r1, %r9
	setx	0x86c907add953fd52, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f8a03b23b1, %r1, %r9
	setx	0xe5fbf2c44a915b8f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e1e9200, %r1, %r9
	setx	0x961504dffbc12546, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fcf66e4, %r1, %r9
	setx	0x59a0320c3d5c1925, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ccca582418, %r1, %r9
	setx	0xcc6c98ad99b2eb91, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d4f96f87d8, %r1, %r9
	setx	0x6e0bdb53fa5d5476, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e44850b250, %r1, %r9
	setx	0x0320e4306999e180, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fa23c8d4f2, %r1, %r9
	setx	0x92f437d3fdc0984b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ef14348, %r1, %r9
	setx	0x771e848cafe29f2f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f066b98, %r1, %r9
	setx	0xf8d756bcfa4eef88, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cfb10d75d8, %r1, %r9
	setx	0xa08a8abe96b09295, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d51b3f4b00, %r1, %r9
	setx	0x4514fe34d221dc43, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e43c6a3124, %r1, %r9
	setx	0xd74f7e2e61ad1bb0, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fecd7c92d0, %r1, %r9
	setx	0x9876b5d86a55d1c0, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ebf4c60, %r1, %r9
	setx	0xae0304905398769d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f025fa0, %r1, %r9
	setx	0xc455f41c8c4a8267, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c9e502edc8, %r1, %r9
	setx	0xe1e198cd512ded3c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dcdd713dc8, %r1, %r9
	setx	0x04f3fb1248f8391a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ebe5c1a8f8, %r1, %r9
	setx	0xff1b161eb959e8b1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fe89ac9ea8, %r1, %r9
	setx	0xdbc6185117459cb2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e87dde0493, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d5a610bf22, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c37bdd7cd2, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fcf66e4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e1e9200, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f2d7f65b4a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e97d0364b8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d2ee73c672, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c7e84643c8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f57767e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f066b98, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800ef14348, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fac28d60d4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ea192ce6e8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d780991168, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e1c5fb8498, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d25923f928, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e549aba, %r1, %r9
	setx	0xb28be38a0dd990ee, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f61dc56, %r1, %r9
	setx	0x5456b10e4ac58cbd, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c02eb42aae, %r1, %r9
	setx	0x10e6dfb6854257a0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d17a334e00, %r1, %r9
	setx	0x798c9ee8c5063eb0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ea028e959b, %r1, %r9
	setx	0x3f280310161eb7de, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fc31e25104, %r1, %r9
	setx	0xd3f54f1369d2e45b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e2977d0, %r1, %r9
	setx	0xcbf9a97f3b0031a2, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f7c77a4, %r1, %r9
	setx	0x465dcda00cedd7d4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c18cd866de, %r1, %r9
	setx	0x66fc3d4eeb7bcc12, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000daf657c564, %r1, %r9
	setx	0xbc99ad81d31ef81e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e1fb6f2772, %r1, %r9
	setx	0x3c939584a9e25ca5, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f003a99e1e, %r1, %r9
	setx	0x79b66f7b725f1ae6, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800eb81d30, %r1, %r9
	setx	0x7fce16226b6f4395, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f37fa1c, %r1, %r9
	setx	0xd5e61205b19521d3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c3475dede8, %r1, %r9
	setx	0x5761b5979134bd74, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d93106b530, %r1, %r9
	setx	0xfffdb9d030fcaf4b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ee5de908f4, %r1, %r9
	setx	0xe63bccca66223715, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f64c04bb4c, %r1, %r9
	setx	0xa17cddad69a99d00, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e4d8e18, %r1, %r9
	setx	0x17d8e675022f0eda, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f6f4dd0, %r1, %r9
	setx	0xfeec606c73110907, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c6a6b38130, %r1, %r9
	setx	0x00cd5e2f06cfed2a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d69c046398, %r1, %r9
	setx	0x04104ab2a91d1eb7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e67542f190, %r1, %r9
	setx	0xefcb0c4a7b182937, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6b3a6f288, %r1, %r9
	setx	0xb6f5ee4325ff7fea, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ce94f1a87a, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f4f36a4, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d51b3f4b00, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000cfb10d75d8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f066b98, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800ef14348, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ebe5c1a8f8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000dcdd713dc8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c9e502edc8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f025fa0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ec2be7a, %r1, %r9
	setx	0x6007881f132ffa2e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f4ec284, %r1, %r9
	setx	0xa72f3ba42b53e375, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c7bfb679da, %r1, %r9
	setx	0xc76ea602e0840805, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dfc92e1683, %r1, %r9
	setx	0x9a3bc411cf449fd2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e94c9db19c, %r1, %r9
	setx	0xc6681dcf10049942, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fe6cdc9b62, %r1, %r9
	setx	0x8883e0bd2229e353, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e5b488a, %r1, %r9
	setx	0x50030ff68e8157d5, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f2352de, %r1, %r9
	setx	0x6ca1ac4e703e4dcd, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ccd2fe237a, %r1, %r9
	setx	0x58e177e1153d58c4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000db4972f4c0, %r1, %r9
	setx	0x5704bd5c4889f4f6, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ee5e436c36, %r1, %r9
	setx	0xe44fd2b347f92b0f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f6b6765c8a, %r1, %r9
	setx	0x04364c06f6311c79, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ecd49e8, %r1, %r9
	setx	0x6ee13a3256ec23aa, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ff55fa0, %r1, %r9
	setx	0x898fe39e9013ef23, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cc6944d674, %r1, %r9
	setx	0x2566ebf945709df4, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000dda86698dc, %r1, %r9
	setx	0xbeb0efd62d261c91, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000eba8e368a8, %r1, %r9
	setx	0x174d399f4a3b35b1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fc126b27ac, %r1, %r9
	setx	0xafd60dd29bff2c38, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e605b30, %r1, %r9
	setx	0xaaaf7e63be6a57c4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f4eba50, %r1, %r9
	setx	0x6e682bcd977db4d7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cabda0abe0, %r1, %r9
	setx	0x3f6f66c7183f7c02, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d65c920660, %r1, %r9
	setx	0x1f880a62fc01e758, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e23c4be4a0, %r1, %r9
	setx	0x09d602d03340500c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f0d92e2ed0, %r1, %r9
	setx	0xf2d6dc42e378b8b9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d17a334e00, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c02eb42aae, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c18cd866de, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f7c77a4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e2977d0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fa23c8d4f2, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e44850b250, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f64c04bb4c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ee5de908f4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d93106b530, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c3475dede8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f37fa1c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800eb81d30, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fecd7c92d0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fe89ac9ea8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000ebe5c1a8f8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e5f82c5, %r1, %r9
	setx	0x173b7782985b2cff, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f5425ca, %r1, %r9
	setx	0x8d7622a0bf840de2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c261012a57, %r1, %r9
	setx	0x4946df57e7f4b241, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d8ca505ce5, %r1, %r9
	setx	0xb7b6546ab3e5ebad, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ee23f61831, %r1, %r9
	setx	0xa0999cfd97354363, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fac99c1d81, %r1, %r9
	setx	0xf121fa294705820e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e93584a, %r1, %r9
	setx	0x5bf88224ffe42eef, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f260568, %r1, %r9
	setx	0xaeb58e2f8a841461, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c944e1fed2, %r1, %r9
	setx	0xf8777d31dd3a0732, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d32c9ea6f4, %r1, %r9
	setx	0x0336bc200812c488, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e149fb5eae, %r1, %r9
	setx	0x5b0498362d0f2a4b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f61b2b0800, %r1, %r9
	setx	0x6c2255ed0e7b7f9f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e8d84d0, %r1, %r9
	setx	0x65c75e981f7445ff, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fec0d28, %r1, %r9
	setx	0x3aa0cf1cc5a60ff8, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c25dda09a4, %r1, %r9
	setx	0x187534986911f1c0, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000dae06d8190, %r1, %r9
	setx	0x8caa79a214e9d303, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e903027e48, %r1, %r9
	setx	0x88c4c4b3504bd336, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f07efdc000, %r1, %r9
	setx	0xff1b9ab03372f013, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ec8bb18, %r1, %r9
	setx	0xc5196e7a8360b83d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fe155b0, %r1, %r9
	setx	0x1a597245c11cd815, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cc7dbe8618, %r1, %r9
	setx	0xd91f476e72954889, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d4520ca988, %r1, %r9
	setx	0x421185ae77a9903c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000efbf4a38d0, %r1, %r9
	setx	0xfa634e4b19d73583, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f26f3a9170, %r1, %r9
	setx	0x488ffca599f0b4e0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f61dc56, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e549aba, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f8a03b23b1, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e0c022375a, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e97d0364b8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d2ee73c672, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c7e84643c8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ecd49e8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f64c04bb4c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ee5de908f4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d93106b530, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c3475dede8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f37fa1c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e4d8e18, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000fe89ac9ea8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000ebe5c1a8f8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800eaa1a74, %r1, %r9
	setx	0x554c91d8b562b9e9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f8467ee, %r1, %r9
	setx	0x88b42d3fb822f2b6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cb38eda179, %r1, %r9
	setx	0x2db7813852f907ed, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dcc8515be1, %r1, %r9
	setx	0xf799769f6f0c4754, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000efbf7608ce, %r1, %r9
	setx	0xbbc2dee7ff54c6bb, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fe9d8e1e3c, %r1, %r9
	setx	0xd96b247878a564fd, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e48345c, %r1, %r9
	setx	0xda5b5ebab66a9799, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fa8665a, %r1, %r9
	setx	0x96e20c29ce45f956, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c567a106fc, %r1, %r9
	setx	0xbd72e10fdddf407e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d23ff84b3c, %r1, %r9
	setx	0x5fc4296a4db4bccc, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e3f83a9696, %r1, %r9
	setx	0xc17e06ce695ea213, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fe5482e1fe, %r1, %r9
	setx	0x132a481c9596209f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e2e570c, %r1, %r9
	setx	0x7d5b19604bbb7041, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f481438, %r1, %r9
	setx	0x1d3310691a6c9f43, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c98a9c2f5c, %r1, %r9
	setx	0x6488baff3c01ab2e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000da668c2ed8, %r1, %r9
	setx	0xadf7aaf5ff9a1ecb, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e78ce81918, %r1, %r9
	setx	0x818c50f05bf111ee, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f87b8afbb4, %r1, %r9
	setx	0x8f0eaabf99b914c7, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e7099d8, %r1, %r9
	setx	0xec530ca3f599942f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fb582d0, %r1, %r9
	setx	0xe317039abcdb9a0e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c672e73078, %r1, %r9
	setx	0xab188c4f709defb4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dad5d75db0, %r1, %r9
	setx	0xdea742a50a001a6c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ef7b4a4730, %r1, %r9
	setx	0x4d8e0f0adff4cda2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f697904e50, %r1, %r9
	setx	0xff0fa114414a1c67, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ec2be7a, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fc31e25104, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ccca582418, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fcf66e4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e1e9200, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f2d7f65b4a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c98a9c2f5c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f481438, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e2e570c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f07efdc000, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e903027e48, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000dae06d8190, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c25dda09a4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d25923f928, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c34de1c490, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e798d5c, %r1, %r9
	setx	0x856739d91a394e94, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f9aa148, %r1, %r9
	setx	0x295eeef0ecc0ec02, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c5ac610493, %r1, %r9
	setx	0xc6ff0aee56507ae8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d8772aa778, %r1, %r9
	setx	0x9043050ea35e824d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e09fb27864, %r1, %r9
	setx	0x6b6f333b6fc52cd3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f061bb2a35, %r1, %r9
	setx	0x70e08efd870b65aa, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ee08696, %r1, %r9
	setx	0x238fa6f5e89163fa, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fcc01ac, %r1, %r9
	setx	0xa3753ee88394acc1, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ca105acf30, %r1, %r9
	setx	0x392db8e711e3b3ac, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dfaf7403f4, %r1, %r9
	setx	0x01b654e02e305815, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e2ec5d5f10, %r1, %r9
	setx	0x055fcc9c2827a1c8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f80a7a5fd2, %r1, %r9
	setx	0xa20872767270ceaf, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800eb78b1c, %r1, %r9
	setx	0x5148ab65ed94a7e5, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f280644, %r1, %r9
	setx	0x45e4f77203c3ad39, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c1b60125bc, %r1, %r9
	setx	0x2ba9142e514ac09f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d445a3e1bc, %r1, %r9
	setx	0x28a8cd1e470a7f19, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ed6a624ea4, %r1, %r9
	setx	0x7f7b3584ec73e400, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f29e7d7b10, %r1, %r9
	setx	0xcbea21ac9802ce4c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ea7d690, %r1, %r9
	setx	0x49a93d6b93ef6938, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f4d7938, %r1, %r9
	setx	0x3bb91aa6170d7407, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c136bebd68, %r1, %r9
	setx	0x86e94a6e11058e01, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d22e865ec0, %r1, %r9
	setx	0x77d2565e1152e9f6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e5f41bc3c8, %r1, %r9
	setx	0xdc39e8df3ab08e15, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f45fb00740, %r1, %r9
	setx	0x11d8e9744c3f72eb, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f5425ca, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e5f82c5, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fe6cdc9b62, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ccd2fe237a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f2352de, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e5b488a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f003a99e1e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e1fb6f2772, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000daf657c564, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000eba8e368a8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000dda86698dc, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000cc6944d674, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800ff55fa0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f6f4dd0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e4d8e18, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000fe89ac9ea8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000ebe5c1a8f8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000dcdd713dc8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e403e0d, %r1, %r9
	setx	0x5fac1eeef319e48e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f97d95b, %r1, %r9
	setx	0x4aa2ceb99fbce5c4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cdce0de097, %r1, %r9
	setx	0x2b148195b50445ca, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dca1058cd9, %r1, %r9
	setx	0x2e534c5fa09afaae, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e3fa3f9df8, %r1, %r9
	setx	0x17e5886e3c4151f6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fcaba1c206, %r1, %r9
	setx	0x9672ee500897bdec, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e4fcdaa, %r1, %r9
	setx	0x5b64ea87cc3d8c9d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ff0f9ce, %r1, %r9
	setx	0xdbd6e07c1e4b9e8e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c3114c4c40, %r1, %r9
	setx	0xb668b749f8c79ac3, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d63000ff32, %r1, %r9
	setx	0x15d84b18d67fe703, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e18f67f5c2, %r1, %r9
	setx	0xc05464e724ecee92, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f4e2f265be, %r1, %r9
	setx	0x4ff3dd4d78656d38, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e3cb1f0, %r1, %r9
	setx	0xe71387f282cfe3c1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f8f817c, %r1, %r9
	setx	0xbe00b46669eada1d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c1a340bc98, %r1, %r9
	setx	0x5317f6415b2b93a2, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d5018e5cdc, %r1, %r9
	setx	0xf483f46fb35f989a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ebe887faf4, %r1, %r9
	setx	0x5705a7b277eca634, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f245564014, %r1, %r9
	setx	0xc9bd883702dc7c0d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ec3b310, %r1, %r9
	setx	0xb48318435133bc92, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f625040, %r1, %r9
	setx	0xd32682e4497442fc, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c4fe112930, %r1, %r9
	setx	0xd1f06a264e9bf27a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000db9a89c570, %r1, %r9
	setx	0x76aaad7f5c28dafb, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ef0d143ed8, %r1, %r9
	setx	0x84792bff01958b1f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000febe36b5b0, %r1, %r9
	setx	0x0c42d27842ad27ce, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d17a334e00, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c02eb42aae, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f61dc56, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e549aba, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f8a03b23b1, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e0c022375a, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d072b3032c, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e2ec5d5f10, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000dfaf7403f4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ca105acf30, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fcc01ac, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ee08696, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fe5482e1fe, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e3f83a9696, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ea192ce6e8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e9ebc36, %r1, %r9
	setx	0x316b0ac42d593311, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f1a7033, %r1, %r9
	setx	0xe45e59953180dd89, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cd8e205cea, %r1, %r9
	setx	0x5e46b71004659ebb, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d690890c22, %r1, %r9
	setx	0x9aaeec85a44b4533, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e7dac1fc99, %r1, %r9
	setx	0x6e7f5a4c02914222, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fc51ad6d1a, %r1, %r9
	setx	0xc20228ef4e67a392, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e2867ac, %r1, %r9
	setx	0x2d61459156d99520, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f99e4b4, %r1, %r9
	setx	0xbf16a6fc46dc5527, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c79b0942e0, %r1, %r9
	setx	0x9e4e733aa6c6ca9e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d4fa97b6e0, %r1, %r9
	setx	0x7e1c7f6c39b29a7e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000edd6a5e720, %r1, %r9
	setx	0x2aeffdda7cdc3cfb, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f48b810374, %r1, %r9
	setx	0xe4bce75449b964f4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800eb94e88, %r1, %r9
	setx	0x383653414d878e76, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fe7d31c, %r1, %r9
	setx	0x41b3fd0e59aa264d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c64a74751c, %r1, %r9
	setx	0xabc14e28e3ae36f9, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d8ec727be8, %r1, %r9
	setx	0x1dcccf6cdad87e7d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e8f5d6b134, %r1, %r9
	setx	0xd543c244a1c71675, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fe3348e190, %r1, %r9
	setx	0x38d4114e6025176f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e5511d0, %r1, %r9
	setx	0x29226594d214766b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f737f68, %r1, %r9
	setx	0x8153c234197d97d7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c0364694a8, %r1, %r9
	setx	0x8bfa2ba0dfe53f35, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d67d1b3258, %r1, %r9
	setx	0xfc5191d23f6c1a37, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e489e3f588, %r1, %r9
	setx	0x7a834c568d26d98b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fc86480dc8, %r1, %r9
	setx	0x6fddf16de0334912, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f4f36a4, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ef21a25, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f8699e5842, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e87dde0493, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d5a610bf22, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c37bdd7cd2, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ccca582418, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fcf66e4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e1e9200, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000eba8e368a8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d4520ca988, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000cc7dbe8618, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fe155b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ec8bb18, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e32f07b, %r1, %r9
	setx	0x100416780c74e675, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f6abc69, %r1, %r9
	setx	0xc3bbaa86a86c7259, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c6409dd4e5, %r1, %r9
	setx	0x499a9df7f4c0bad3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dfd335d300, %r1, %r9
	setx	0xc56655f68e126d66, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ef0863a37a, %r1, %r9
	setx	0x16ace7076cba6263, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fcca6a9c83, %r1, %r9
	setx	0x7c13b8a6ba8c4172, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800eb2ffa8, %r1, %r9
	setx	0x51d632780bd22f5a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f6a2cfa, %r1, %r9
	setx	0x934eab923bcad7ef, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000caaebd1b72, %r1, %r9
	setx	0x8387de01046cb7d2, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d0b5c9d8c4, %r1, %r9
	setx	0xbb7e9d550da86d27, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000eb3ca842e0, %r1, %r9
	setx	0xc96f9999963850d2, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f0cc0bfda0, %r1, %r9
	setx	0xd3e4b4f71ebff6db, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e57e614, %r1, %r9
	setx	0x792c9044b65b8372, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f3d3164, %r1, %r9
	setx	0xeeb8dfd2c695f907, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c989d92510, %r1, %r9
	setx	0xb73749258b0b4c63, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d75438cae4, %r1, %r9
	setx	0xbc75c9ef3588ad65, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ed5c21446c, %r1, %r9
	setx	0x4dd0d6986f8dfc17, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f410bbd1f8, %r1, %r9
	setx	0xda655e11408dc3f2, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e041a18, %r1, %r9
	setx	0x7f20d98fe899a150, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fed2098, %r1, %r9
	setx	0xb8d3f2268b5199c5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c58cfa3990, %r1, %r9
	setx	0xc29a203452536fc5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d6f0daeb78, %r1, %r9
	setx	0x058f520a0a284710, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000eed8546680, %r1, %r9
	setx	0x9248b2abc20337e3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f49f9225e0, %r1, %r9
	setx	0x39b03188abb4c114, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cd8e205cea, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f1a7033, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e9ebc36, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fcaba1c206, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e3fa3f9df8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000dca1058cd9, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000cdce0de097, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e4fcdaa, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f80a7a5fd2, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e2ec5d5f10, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ee5de908f4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d93106b530, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c3475dede8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ef7b4a4730, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000dad5d75db0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800edaea28, %r1, %r9
	setx	0xea80aa6c9cfe30c5, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f2165b1, %r1, %r9
	setx	0xab920a6980097558, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c3bf80d397, %r1, %r9
	setx	0x8ec99bbab907d241, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dee380dbfc, %r1, %r9
	setx	0xca5fc31ea4a0ba95, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e4949d76eb, %r1, %r9
	setx	0xadcc14857ee598ea, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fad370108f, %r1, %r9
	setx	0x1cef58e2a00d4cb9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e658788, %r1, %r9
	setx	0xdf81b851b7d9edb2, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f205db0, %r1, %r9
	setx	0xeb579736ded373d7, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c900119336, %r1, %r9
	setx	0xb23677c077f4c2ac, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d1c1ecfb3e, %r1, %r9
	setx	0xb9e89e696944861e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ef46748c3c, %r1, %r9
	setx	0xabf21972aa49e10b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fa814fc406, %r1, %r9
	setx	0x11c41721e4ee2edc, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e0cf9e8, %r1, %r9
	setx	0x3f22fa09b68f4cf0, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f715058, %r1, %r9
	setx	0xb943f562db0ef695, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c8d543600c, %r1, %r9
	setx	0xe0f6e0470449e25d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000dd7bdbdddc, %r1, %r9
	setx	0x1607bb8304d06c42, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000eb19457068, %r1, %r9
	setx	0xadd4840f65830332, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fa94a45bb0, %r1, %r9
	setx	0x0695d44959915b2a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e028818, %r1, %r9
	setx	0x15a3b690c31a8536, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f1fafa0, %r1, %r9
	setx	0x3f1028821468af9d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c52b3f76b8, %r1, %r9
	setx	0x9d1667946748e3d4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000db8499e688, %r1, %r9
	setx	0xa204553d5ad6ee0a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e5bec82088, %r1, %r9
	setx	0xcc2fe87315d1ad32, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f4bc6e3dc0, %r1, %r9
	setx	0x5c08dbf6a20c6114, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f4ec284, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ec2be7a, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e18f67f5c2, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fe7d31c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800eb94e88, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f6b3a6f288, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e67542f190, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d69c046398, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c6a6b38130, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f6f4dd0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e4d8e18, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e2c7f1a, %r1, %r9
	setx	0x03fb727039e32783, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fe4f8e6, %r1, %r9
	setx	0x9c5d68637ad90d1e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c2cbae9909, %r1, %r9
	setx	0x28b4ef22a4b5987b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d12385cf08, %r1, %r9
	setx	0x49381222c1dc0c38, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e4cc774b9e, %r1, %r9
	setx	0x7770a09426df32e0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f6fe9c4585, %r1, %r9
	setx	0x9c2fadb3e35af618, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e7d7f6e, %r1, %r9
	setx	0xb2853b71461dc8f2, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f4bf440, %r1, %r9
	setx	0x92ae1957a8b90b81, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cbc74508d2, %r1, %r9
	setx	0x9d2cf19a8ecabc59, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d94d132e36, %r1, %r9
	setx	0xee76ea28218784e4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ee23d979e8, %r1, %r9
	setx	0x6fb7bc798e8e5137, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f48a609e50, %r1, %r9
	setx	0x1170e2cf035c551e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e29c9ac, %r1, %r9
	setx	0xd9d0d2fdf78bc38b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fe5e0ac, %r1, %r9
	setx	0x3c8135e0a266b114, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ccb9528e70, %r1, %r9
	setx	0xaccdf9b4a46a1f4b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d33e38d500, %r1, %r9
	setx	0xbcacd1b88cbc83a4, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000eb909dfbf8, %r1, %r9
	setx	0x670d0811dd568a17, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fe09fe5e00, %r1, %r9
	setx	0x087b18b8039fbdcf, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e8064e0, %r1, %r9
	setx	0x5c4a6c6369a0771c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f47c1b0, %r1, %r9
	setx	0xfd13517241571fff, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c937613078, %r1, %r9
	setx	0x25f2891f437b5a74, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d5e2f73dd8, %r1, %r9
	setx	0xd6a94c7b8af3cc95, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e700c82400, %r1, %r9
	setx	0xfdf3d2d9064a7f4c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f225206fb0, %r1, %r9
	setx	0xed10d7b77e1a8347, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f1a7033, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e9ebc36, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fcaba1c206, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e3fa3f9df8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000dca1058cd9, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000cdce0de097, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f97d95b, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d4f96f87d8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ccca582418, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fcf66e4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e1e9200, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000db8499e688, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800eef1589, %r1, %r9
	setx	0xb264c3fc2cd54e6a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f3526f0, %r1, %r9
	setx	0x010b92e1d1f7eda0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c162754a1d, %r1, %r9
	setx	0x8f2e6e513790b6af, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d68d5a00f6, %r1, %r9
	setx	0xc9f45f856d395a0d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e82b1563c0, %r1, %r9
	setx	0x447192eb88486f0f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fa4cac1687, %r1, %r9
	setx	0xa1e873d8b490ed32, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e546bb8, %r1, %r9
	setx	0xfb09f737b2ad3215, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f1cc634, %r1, %r9
	setx	0xc03c7b3f479c69f8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c0341f3e62, %r1, %r9
	setx	0xf5da041a510ce266, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d1bafa86e6, %r1, %r9
	setx	0x591dc91a72f9daac, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e82a177244, %r1, %r9
	setx	0x47cf5a58ad3119c3, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fe0a8e4844, %r1, %r9
	setx	0x5b4fe802a3ca6cf0, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e6890c0, %r1, %r9
	setx	0xaa0173aaaac25e42, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f732b14, %r1, %r9
	setx	0xa110efb177203f8f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cb83c649f0, %r1, %r9
	setx	0x00da545e6c19a466, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d7e9ef1180, %r1, %r9
	setx	0x9a7d50055b751556, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ef7347bd08, %r1, %r9
	setx	0x10ff969a45ce2172, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f65b2beb34, %r1, %r9
	setx	0xce7f3b817f382631, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e8d0990, %r1, %r9
	setx	0xa642ec30812f6959, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fbfb170, %r1, %r9
	setx	0x89ca90774622dcd4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c770c85918, %r1, %r9
	setx	0x5a5abf81091878f2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dc875e71f0, %r1, %r9
	setx	0x80dcced604fd6a2d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e4ee441e10, %r1, %r9
	setx	0xb855d469a6135609, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fab18375f8, %r1, %r9
	setx	0xd9685c68ffbee412, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8699e5842, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e87dde0493, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d5a610bf22, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c37bdd7cd2, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fdbfd3e, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e149fb5eae, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d32c9ea6f4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c944e1fed2, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ed6a624ea4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d445a3e1bc, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c1b60125bc, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f280644, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800eb78b1c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f87b8afbb4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000cc7dbe8618, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fe155b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ec8bb18, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e7849ad, %r1, %r9
	setx	0x580334491c7bce6d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f231c53, %r1, %r9
	setx	0xd7aaca8cd08868ad, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c8516fa799, %r1, %r9
	setx	0xfeae205732e9b8f4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ddb4ad8e9b, %r1, %r9
	setx	0xe4c41a1fb75c9530, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e96fd76a6f, %r1, %r9
	setx	0x1416e0e3cddabb91, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fcb704e654, %r1, %r9
	setx	0x21c5131fd8f710cb, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e368224, %r1, %r9
	setx	0x8ffe191cc1baac90, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f0f6e4a, %r1, %r9
	setx	0x9b9d1e5817231974, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cd3ec85ca6, %r1, %r9
	setx	0x24c19473f9cda7d3, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d708d9713a, %r1, %r9
	setx	0x2d3605dfc6e35c27, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e9961118fc, %r1, %r9
	setx	0x9d5a94bc0317852d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f29afa619c, %r1, %r9
	setx	0xe89bdbb01123bf5f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e5a91d4, %r1, %r9
	setx	0xcb6818752becb11b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f5f1da4, %r1, %r9
	setx	0xb2a6e8d1c1c78bcb, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c9c4e044e8, %r1, %r9
	setx	0x5fa8b3e36a8b9df6, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d3ee4104f8, %r1, %r9
	setx	0x488f6cbdd7c1bde1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e6f7c25d54, %r1, %r9
	setx	0x58cf01492452c96f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fe444f95e8, %r1, %r9
	setx	0x9f7e9838a88b8817, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e27f2d8, %r1, %r9
	setx	0x9f4fb0b2e0daa046, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f69ba90, %r1, %r9
	setx	0xa55509dcbbb8bf00, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cf0e3eeb20, %r1, %r9
	setx	0xc5001b95cad09212, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d79c512238, %r1, %r9
	setx	0xbfde16ce11d60d04, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e1418bbdb0, %r1, %r9
	setx	0xedfdfd219b2b8edf, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f461b6e648, %r1, %r9
	setx	0x2e92c30a337cec72, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c5ac610493, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f9aa148, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e798d5c, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fe9d8e1e3c, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000efbf7608ce, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000dcc8515be1, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e78ce81918, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000da668c2ed8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c98a9c2f5c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f481438, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e2e570c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e1c5fb8498, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d25923f928, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c34de1c490, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f441098, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e99d348, %r1, %r9
	setx	0x832615eb677b998f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f557753, %r1, %r9
	setx	0xc3357723787bc100, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c542ba828e, %r1, %r9
	setx	0x71dc1b5678f6b8f4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dc2ddc5b30, %r1, %r9
	setx	0x10a28236f12f413a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000efd1131234, %r1, %r9
	setx	0x6573cffaaafe456e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f0d178dd7b, %r1, %r9
	setx	0x740933897c033bf9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e47ff18, %r1, %r9
	setx	0xae87da3146fe0e0f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fb288d0, %r1, %r9
	setx	0x25e2407e66c28711, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ce5d175e40, %r1, %r9
	setx	0x07b1c8e654caad1b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d698eb27c2, %r1, %r9
	setx	0xb777c2834557a408, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e3c550c65a, %r1, %r9
	setx	0xcc361dd900f6d9e2, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fe69fe669c, %r1, %r9
	setx	0x333ea14636e2ff5b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ec78454, %r1, %r9
	setx	0x152937a1cad8a757, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f022084, %r1, %r9
	setx	0x6659a1b719718728, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cb588c2cec, %r1, %r9
	setx	0x16d8721daaafef6e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000dfcc458650, %r1, %r9
	setx	0x1a70e6a423ca82b9, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000edbcafbe64, %r1, %r9
	setx	0x503349dc3b45af21, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fa3d8b3204, %r1, %r9
	setx	0xd93a3b0a53814ada, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e7acf60, %r1, %r9
	setx	0x4c34e52f2b272bc8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fac5420, %r1, %r9
	setx	0x97285702ded1c29e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c04f91d7b8, %r1, %r9
	setx	0x135b4a3d85602687, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d157b6cb08, %r1, %r9
	setx	0xedf6a9913c652216, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ed0182cf48, %r1, %r9
	setx	0x273b3bcefec8e7cf, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8f1925a98, %r1, %r9
	setx	0xada8f8cfb14a77c8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ea028e959b, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d17a334e00, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c02eb42aae, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f61dc56, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e549aba, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f8a03b23b1, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ee23d979e8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d94d132e36, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cbc74508d2, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f4bf440, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e7d7f6e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f066b98, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800ef14348, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fac28d60d4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ea192ce6e8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e489e3f588, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d67d1b3258, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c0364694a8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f737f68, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e5511d0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000febe36b5b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000ef0d143ed8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800eabe1c9, %r1, %r9
	setx	0x6f5f95b2214d395a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f4dc630, %r1, %r9
	setx	0xf91416d286910344, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ca141b59b9, %r1, %r9
	setx	0xcac55aadd941c8ae, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d3dd175642, %r1, %r9
	setx	0xc4186ab04e99c0ee, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000eed00984ed, %r1, %r9
	setx	0x8f639775c0e56f09, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f8f5f39cd1, %r1, %r9
	setx	0xf8f77a5c25cd2ce6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800edd0fe6, %r1, %r9
	setx	0xef35f706e241be0f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f531504, %r1, %r9
	setx	0x2b413b9261ec5056, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c324a17a44, %r1, %r9
	setx	0x8111b8f249589a30, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000db0666e20a, %r1, %r9
	setx	0x94547313a85e68c1, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e3f3409750, %r1, %r9
	setx	0x744130488b9fe269, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f8406851b6, %r1, %r9
	setx	0x1e0487b5f78b6d9b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e2480b0, %r1, %r9
	setx	0xa97fb12b17891b13, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fbc150c, %r1, %r9
	setx	0xe280cacb3bc6ae72, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c935c87090, %r1, %r9
	setx	0x78432dfc42d65d6b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d06da98ef0, %r1, %r9
	setx	0x4eb72ec89d70dc03, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e7eba98088, %r1, %r9
	setx	0xebeeb39215db56f4, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f01bde28bc, %r1, %r9
	setx	0x0634d38f84a0ccdb, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e80ac40, %r1, %r9
	setx	0xbad99d2529005a25, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f150e90, %r1, %r9
	setx	0x35894e4ab5b4cc82, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c51c44b3b0, %r1, %r9
	setx	0x741a1ced8e4d9f24, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d19354d768, %r1, %r9
	setx	0x26add2b8ac9b23b2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e77b7638b0, %r1, %r9
	setx	0xd48e6db3b2a1a96e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f26c1814b0, %r1, %r9
	setx	0xb94529eb395973c5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ee23f61831, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d8ca505ce5, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c261012a57, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f5425ca, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e5f82c5, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fe6cdc9b62, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d708d9713a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cd3ec85ca6, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f0f6e4a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e368224, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fe0a8e4844, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c8d543600c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f715058, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e0cf9e8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f410bbd1f8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d157b6cb08, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c04f91d7b8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fac5420, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e7acf60, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f461b6e648, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e1418bbdb0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800eb1a50f, %r1, %r9
	setx	0x253bad62c9a0786f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ff820e2, %r1, %r9
	setx	0xa79a2d699fbffae3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c278ef6439, %r1, %r9
	setx	0x6cd9737f22d7aa0d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d7e54cebf5, %r1, %r9
	setx	0x18f20d081baacc65, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e6e95140f6, %r1, %r9
	setx	0xa3fd3aafaa11c25b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f8023147c1, %r1, %r9
	setx	0x64e24c1a03c17a7d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800eff1320, %r1, %r9
	setx	0x59b91da924857e5e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f170572, %r1, %r9
	setx	0x8e6b52d1e739315a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cc77324e3e, %r1, %r9
	setx	0x32da6748260d4618, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000de75037fb2, %r1, %r9
	setx	0x4c928d97300f238f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000eeceaa2446, %r1, %r9
	setx	0x82c95c04265c3229, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f49208e72e, %r1, %r9
	setx	0xcc2b99df935f2d47, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ea63870, %r1, %r9
	setx	0x29b4470dc6bd553f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fc11b40, %r1, %r9
	setx	0xcad675f4f90b1abd, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cced532860, %r1, %r9
	setx	0xabdfff9fb06fce5f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d6032975fc, %r1, %r9
	setx	0xa6d2fe9a8cf2a48f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e9786c8dc8, %r1, %r9
	setx	0x81c5ac2029e3e9c3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f2a1f7ec40, %r1, %r9
	setx	0xa9ef91b2c4882287, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e80c848, %r1, %r9
	setx	0xe736fc01b4d859aa, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f3a5730, %r1, %r9
	setx	0xffa0970b3653cc99, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c81fefed88, %r1, %r9
	setx	0xb355d7190cae8486, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dbdd3cc878, %r1, %r9
	setx	0xde549163208c69f6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e17fd73160, %r1, %r9
	setx	0x26d6ab285409ffbb, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f0b8036b30, %r1, %r9
	setx	0x24d891ac7582c017, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dca1058cd9, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000cdce0de097, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f97d95b, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e403e0d, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f061bb2a35, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e09fb27864, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d32c9ea6f4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c944e1fed2, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f260568, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e93584a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f6b6765c8a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ee5e436c36, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e5a91d4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f65b2beb34, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f0d92e2ed0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e23c4be4a0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d65c920660, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000cabda0abe0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f4eba50, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e605b30, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e21bf1e, %r1, %r9
	setx	0x2c398e9bea91d3e3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f3851a2, %r1, %r9
	setx	0x082e8dbe5a3f16f0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c3a1a3611a, %r1, %r9
	setx	0xd2521253b6881bf9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d16553df85, %r1, %r9
	setx	0x019a42a9774f51d4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ea0e277884, %r1, %r9
	setx	0x1e3e093bfe97321f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f46225ae3e, %r1, %r9
	setx	0x3d874d8d8fb9f483, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ef3d4a8, %r1, %r9
	setx	0x174fd6a0e3623728, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f96c808, %r1, %r9
	setx	0x6a71529f857a12e7, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cb9b8dffbe, %r1, %r9
	setx	0xbfe27e47a8e2f652, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d04a1e8e2a, %r1, %r9
	setx	0x44cb4468f0848ade, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e7e0c74bc6, %r1, %r9
	setx	0x568e1fc656cf25b3, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f475f1c656, %r1, %r9
	setx	0x33e73e711f16d367, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e47ec08, %r1, %r9
	setx	0x8083122727a9c01f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f0bbf20, %r1, %r9
	setx	0x5ec3805f6fe79a1b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c22d6c93c0, %r1, %r9
	setx	0x6ed80223693d7ccb, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000dfc78904c0, %r1, %r9
	setx	0x3988c06c52a87d3d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ece16b2250, %r1, %r9
	setx	0x59f7ede74af138ec, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f82064190c, %r1, %r9
	setx	0x3962adc7205431f8, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e36e010, %r1, %r9
	setx	0xf9a3c1b75913074a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f0184e0, %r1, %r9
	setx	0xa003812e5d9f82ad, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ca72782400, %r1, %r9
	setx	0x159b97be29fb4dc2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d4280d4310, %r1, %r9
	setx	0x00a06c2cdbd4fccf, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e70d418570, %r1, %r9
	setx	0x639462f9c12867e3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f205fc0230, %r1, %r9
	setx	0x00a2ebe6d43c2336, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f61dc56, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e549aba, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f8a03b23b1, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e0c022375a, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d072b3032c, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ce94f1a87a, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f4f36a4, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000cb9b8dffbe, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f96c808, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ef3d4a8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f49208e72e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000eeceaa2446, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000de75037fb2, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f481438, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e2e570c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f07efdc000, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f83e55f330, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e777ba2, %r1, %r9
	setx	0x7c3069c0e2d20b35, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f60d7e9, %r1, %r9
	setx	0x6c0f7d6fe6113ec6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c1b61fae2c, %r1, %r9
	setx	0x20e92b3c2f2c5107, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d856127072, %r1, %r9
	setx	0x00a0ec1d93cddf01, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e0b6e3f78c, %r1, %r9
	setx	0x98d448b246fcc5dd, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f8484bcb25, %r1, %r9
	setx	0x0de05da4bd1e9991, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ec25934, %r1, %r9
	setx	0x504184817a439ee3, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fe917c8, %r1, %r9
	setx	0xf04569ac07ebfb31, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c3eb93052e, %r1, %r9
	setx	0x3f2464293355a4cd, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d83f7818c4, %r1, %r9
	setx	0x7b0d83cefcfc614e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ead67f98ce, %r1, %r9
	setx	0x453892e56b712b9e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fcc418a3b4, %r1, %r9
	setx	0x524c51e7ad1599cd, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e0f7330, %r1, %r9
	setx	0x192494b95c022147, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f6d30a8, %r1, %r9
	setx	0x2d31faadd69688ea, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c7bc3ae18c, %r1, %r9
	setx	0xe1a3598a578a4b97, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000dab053a758, %r1, %r9
	setx	0x910eda586bdc05b5, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e10c103cbc, %r1, %r9
	setx	0x0893122e1c35d50c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f484179a98, %r1, %r9
	setx	0x0c54e2006274ec7d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e81c1f8, %r1, %r9
	setx	0x41bdbadce84451b1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f7c60b8, %r1, %r9
	setx	0xc1c439c85213b71e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cbd8a33738, %r1, %r9
	setx	0xe5a125753af2f481, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dd66deda70, %r1, %r9
	setx	0x4bf08e39da7b37a2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e022a399c8, %r1, %r9
	setx	0x9967eedf3f13827a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f2d2932348, %r1, %r9
	setx	0xd8285e57ace673a8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c6409dd4e5, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f6abc69, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e658788, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f0cc0bfda0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000eb3ca842e0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d0b5c9d8c4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000caaebd1b72, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f6a2cfa, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800eb2ffa8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f066b98, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800ef14348, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fac28d60d4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ea192ce6e8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d780991168, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000cbe9628578, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d6f0daeb78, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c58cfa3990, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800edb1215, %r1, %r9
	setx	0x30b68f49892a516d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fc915ef, %r1, %r9
	setx	0xed958b0136c0851e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c0b384164b, %r1, %r9
	setx	0x74219399812a4760, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000df54c2b8e0, %r1, %r9
	setx	0x32cfe1fa76cf90d7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ebcee8fc64, %r1, %r9
	setx	0x141d3bd0c6b33084, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fc82e2972b, %r1, %r9
	setx	0xb5a529c68057df2d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e7172f0, %r1, %r9
	setx	0x89a0fe214d25a455, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f47530e, %r1, %r9
	setx	0x3f13a996729e3213, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cd29e218f2, %r1, %r9
	setx	0xfc599beda07da7b9, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d7a20315de, %r1, %r9
	setx	0xfa0f57cbff5b5790, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000efbd34277c, %r1, %r9
	setx	0x17c3d6d9da05f9d9, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f478df984e, %r1, %r9
	setx	0x5ee7df0da549baae, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e796eec, %r1, %r9
	setx	0x9610d46f0963aaf4, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f6727c8, %r1, %r9
	setx	0x0ce6db7ca9dd793a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cd227b9c50, %r1, %r9
	setx	0x21fc92dca82b1e25, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d0eb67ab2c, %r1, %r9
	setx	0xd8fc0c4b9af46584, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000edb6655b70, %r1, %r9
	setx	0x9e34610889641f2e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f22307a114, %r1, %r9
	setx	0x5b6a5bedaa659854, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e412da8, %r1, %r9
	setx	0x4e9da3aecdffb127, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f44e280, %r1, %r9
	setx	0x546fd8b55d027b20, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c5bf543d00, %r1, %r9
	setx	0x8473adc4be5aece4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000daec7dd4f8, %r1, %r9
	setx	0xa8a867bbd02bdca3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ee2c7fb828, %r1, %r9
	setx	0x066dcaf7c44b0d6e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fa51ce54e8, %r1, %r9
	setx	0x410e839b9e8ed3d7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ea028e959b, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d708d9713a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cd3ec85ca6, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f0f6e4a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e368224, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e5a91d4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f65b2beb34, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ef7347bd08, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d7e9ef1180, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f3a5730, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e80c848, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f26c1814b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e77b7638b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e5e8bd3, %r1, %r9
	setx	0x523f8d8af1711e00, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f6586c2, %r1, %r9
	setx	0x66ba61bc11aaa6cf, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c575527624, %r1, %r9
	setx	0xa99ffa860d39c3df, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000da72c1c7d0, %r1, %r9
	setx	0xb927d39b7e7e7693, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ee6c793409, %r1, %r9
	setx	0xe097bb54214571ba, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f0fb50bdd4, %r1, %r9
	setx	0x36fefa460fc87d75, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e4c6c60, %r1, %r9
	setx	0xba1fb2449ad8d9e6, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f398564, %r1, %r9
	setx	0x901c1b107845070f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cfb36dcad8, %r1, %r9
	setx	0x01d7a694c8b33a8e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d055c3f96c, %r1, %r9
	setx	0xee0baba4c56e26e5, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e50a7b5b4e, %r1, %r9
	setx	0x1274a28bbacb1b7f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fc35f7cb2c, %r1, %r9
	setx	0xf9a947ef59d4174d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800edb5ee8, %r1, %r9
	setx	0x0be4fe902e8fed38, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fe9fc38, %r1, %r9
	setx	0x2216153f8b50143f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ca1d4af7a0, %r1, %r9
	setx	0xa92f46bfebd0ff45, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000df2bf0e2e4, %r1, %r9
	setx	0xd336334a5cf05282, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ef699a0d70, %r1, %r9
	setx	0xb4e4e578b6706159, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f608800eb0, %r1, %r9
	setx	0x2888dd776e963a91, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e54dfe0, %r1, %r9
	setx	0x834b0baba06c389c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fd82a10, %r1, %r9
	setx	0xdcefe6b0a0499568, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c0a8d64770, %r1, %r9
	setx	0x30d812e0e9766e9a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dbf86f0038, %r1, %r9
	setx	0xf40c16a627743303, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e4dd7a1320, %r1, %r9
	setx	0x97cc86434726bac6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fc3eaec250, %r1, %r9
	setx	0x37938099dd828627, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dfc92e1683, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ead67f98ce, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d83f7818c4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c3eb93052e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fe917c8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ec25934, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f475f1c656, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e7e0c74bc6, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e0f7330, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000cbd8a33738, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e8a040d, %r1, %r9
	setx	0x4aa154e61f6e967b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fea0ed0, %r1, %r9
	setx	0x392a81d77ecdfede, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c87e0c4284, %r1, %r9
	setx	0xf95285d6c93169d3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d2a880241c, %r1, %r9
	setx	0xd65b4148ae38eab5, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e5f931a6c7, %r1, %r9
	setx	0xe976ca1df1962c47, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f0d77f2e47, %r1, %r9
	setx	0xb4a65bf5d63cb872, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e283eac, %r1, %r9
	setx	0xc3c7599368423835, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f281860, %r1, %r9
	setx	0xd7f76a260d494a2d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cda6444988, %r1, %r9
	setx	0x75c1c6896e392d36, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000db531222b0, %r1, %r9
	setx	0x61cdecbb308a4f92, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ee0a8eef44, %r1, %r9
	setx	0x1f0d319ccb1ec85d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fe2d2669b2, %r1, %r9
	setx	0x2b7682ada6497bde, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e58f840, %r1, %r9
	setx	0x436256747b483bd8, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800faef0e8, %r1, %r9
	setx	0x6a29b586b9c105ac, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c527ca79c4, %r1, %r9
	setx	0x4f48f8f7517b8f2d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ddc2220074, %r1, %r9
	setx	0x13618ef3102fb9f8, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e490012f38, %r1, %r9
	setx	0x8fbc3c79f623acf9, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f42aeb3f98, %r1, %r9
	setx	0x604d2c00900707cd, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800edc3e00, %r1, %r9
	setx	0x90ca53a9721d8838, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fd736e8, %r1, %r9
	setx	0xcef7c35709a92977, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c419377008, %r1, %r9
	setx	0x932b49cf7e9754f0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dff00a8428, %r1, %r9
	setx	0x11bdbbaf7c7735fc, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e342fa4a70, %r1, %r9
	setx	0xb8461d69e703d19c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6dd7a4130, %r1, %r9
	setx	0x1234aaeaff1d7eeb, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e0b6e3f78c, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d856127072, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c1b61fae2c, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f60d7e9, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e777ba2, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c944e1fed2, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f260568, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e93584a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f6b6765c8a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ee5e436c36, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e17fd73160, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000dbdd3cc878, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c81fefed88, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f3a5730, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e80c848, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f26c1814b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ecc2fbf, %r1, %r9
	setx	0xf254fdb286cb2f8a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f3cceea, %r1, %r9
	setx	0xf3b80a165386a663, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c702fa3b7c, %r1, %r9
	setx	0xc441936eff589aa8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d18808d19a, %r1, %r9
	setx	0xafdd64f843bb8425, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e4a509ca5c, %r1, %r9
	setx	0x00ad43c8a4129ca9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fe7f1f7de5, %r1, %r9
	setx	0xaa1d10633ee846c8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e14b232, %r1, %r9
	setx	0xd7b8e90ccb0ab98b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fd999fc, %r1, %r9
	setx	0xeb15a3c815bef6dd, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c0243a6e00, %r1, %r9
	setx	0xf0864d8d5e7866df, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dc45f5b0bc, %r1, %r9
	setx	0x53804dadeef636c4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e8c841dc8c, %r1, %r9
	setx	0x3c57cc27be6f220e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f6aa253764, %r1, %r9
	setx	0x54945ebaae38b892, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800eff6a80, %r1, %r9
	setx	0xb954bd42acc93389, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f302360, %r1, %r9
	setx	0xa3f389f4a963b5ab, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c52e23be78, %r1, %r9
	setx	0xee62b13559c8b2ec, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ddc1bc9824, %r1, %r9
	setx	0x6cce3a605399c3b7, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e6d96e138c, %r1, %r9
	setx	0xac89f6a63c32ba26, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f0c5454894, %r1, %r9
	setx	0xfcafa01c70b1a1f8, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ea9ff38, %r1, %r9
	setx	0xbbf7bac4dce821af, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ffa63b8, %r1, %r9
	setx	0x40dd854d0c44534b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cb4d4aab18, %r1, %r9
	setx	0xf88796614d7bdd53, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000da7899bf48, %r1, %r9
	setx	0xa46e99c474c8239a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e4bc6a0248, %r1, %r9
	setx	0x7500e9e48e19f8ff, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f83c7769f8, %r1, %r9
	setx	0xa1a98d8a6d48f7db, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c3bf80d397, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f2165b1, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800edaea28, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fcca6a9c83, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ef0863a37a, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000dfd335d300, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e78ce81918, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000da668c2ed8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f697904e50, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000ef7b4a4730, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000dad5d75db0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c672e73078, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800eb08ae3, %r1, %r9
	setx	0xb85ecf1eb171b05e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f6a9db3, %r1, %r9
	setx	0x480f53d8e45b1aba, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ce32e333f1, %r1, %r9
	setx	0x15bdd18246a3d9c4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000de87437156, %r1, %r9
	setx	0x98e633738bc38506, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e5c8d7a020, %r1, %r9
	setx	0xeb981e5ff2d1fec5, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f6fa6f769d, %r1, %r9
	setx	0x6d1febc278500ddd, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e3f13ac, %r1, %r9
	setx	0x7b926675b07217bf, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f2ac8a6, %r1, %r9
	setx	0xb790be883a2b5cb6, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cd95e00f6a, %r1, %r9
	setx	0xf00421ae0fd4090e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000de8061c81e, %r1, %r9
	setx	0x7265e5cda17fa77d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ea6233857c, %r1, %r9
	setx	0xe225ccc9d7ced530, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fcef1de424, %r1, %r9
	setx	0xa93ecf9a18a0df28, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e7cd338, %r1, %r9
	setx	0x7bb513e3bd12449b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fc2fd74, %r1, %r9
	setx	0x3870c6a79f52267e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cc86065e0c, %r1, %r9
	setx	0xb41d5f46e499dfa3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d14e66567c, %r1, %r9
	setx	0xfe18c67a8b2263c8, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e36fb3ffa4, %r1, %r9
	setx	0xedce8e0a52a5d07e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f0e9d173bc, %r1, %r9
	setx	0x4e940399b7134996, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ef3d550, %r1, %r9
	setx	0x712dd45554d212ac, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f79c238, %r1, %r9
	setx	0xeb5598b49cb90694, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c67564b520, %r1, %r9
	setx	0xd9bc27d8facb321b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d5800d58d8, %r1, %r9
	setx	0x63a07f09dff16c91, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e8ca98e270, %r1, %r9
	setx	0x3756bfe2b4c89e10, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6e95cb448, %r1, %r9
	setx	0xff08b310b7e16d3e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f4ec284, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ec2be7a, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fc31e25104, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ea028e959b, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d17a334e00, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f99e4b4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e2867ac, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f4e2f265be, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e18f67f5c2, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d63000ff32, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c3114c4c40, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ff0f9ce, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f481438, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e2e570c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f07efdc000, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e8064e0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ec52b74, %r1, %r9
	setx	0xb35854fd1dd5f799, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fd972ac, %r1, %r9
	setx	0x8850516164081cd5, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cc646f13c3, %r1, %r9
	setx	0xfa07cdea99d22f38, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d87eb79672, %r1, %r9
	setx	0x73ab26c774e3951d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ecd8cc51fd, %r1, %r9
	setx	0xa36e94cbff8d98e9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fa996d661e, %r1, %r9
	setx	0xcfa3ce5c56c22896, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e23a41a, %r1, %r9
	setx	0xfd63d6cb4c684d7b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fb57a1e, %r1, %r9
	setx	0xdba7080fadf7575a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cb9a9f4726, %r1, %r9
	setx	0x73b65b716c641b01, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d86ddb6fc8, %r1, %r9
	setx	0x682466b5edb9314d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e4ea9ad54e, %r1, %r9
	setx	0x5c5695c83fe6cd7c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f2a95436b8, %r1, %r9
	setx	0x32f28e205cb81527, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e4ba6ec, %r1, %r9
	setx	0x04a11a8aae685bf1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f1449a8, %r1, %r9
	setx	0x52ed682240353bda, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cbc55fc72c, %r1, %r9
	setx	0x58201fad829f15bb, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d80f3f1a8c, %r1, %r9
	setx	0xc2092ce53494560b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e068a59564, %r1, %r9
	setx	0xab9ab8ebf725df47, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f03f06e3ec, %r1, %r9
	setx	0x2053319a769dfba2, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800edeab70, %r1, %r9
	setx	0x7742aee3aad43fdf, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f6db268, %r1, %r9
	setx	0xeb9fe3e17ae25924, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ce29f184d0, %r1, %r9
	setx	0xf0790686c791b4b2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d2ae18c040, %r1, %r9
	setx	0x345b525e6913bad7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e1a744e8f8, %r1, %r9
	setx	0xc413c7827069d8f7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f027b4faf0, %r1, %r9
	setx	0x0a511765ea7328f8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8484bcb25, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e0b6e3f78c, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d856127072, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c1b61fae2c, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f60d7e9, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000db531222b0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cda6444988, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f281860, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e283eac, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fc35f7cb2c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ee2c7fb828, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000daec7dd4f8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c5bf543d00, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f44e280, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e412da8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e524cc2, %r1, %r9
	setx	0xc70a7bf0f86dcf55, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f39609e, %r1, %r9
	setx	0x2408cea11dd563a4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cad81f1438, %r1, %r9
	setx	0x26dbebc23a484014, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000de3b3326e4, %r1, %r9
	setx	0x3fd6f09dfdaa7f29, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e4ec58a94e, %r1, %r9
	setx	0x5f5c24ba614feea2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fedc16c3c3, %r1, %r9
	setx	0x6933f50423e3e8d8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e4d015e, %r1, %r9
	setx	0xc9888bb890b593b9, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ff0090c, %r1, %r9
	setx	0x3b0ea70ae95ade50, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c2125840a6, %r1, %r9
	setx	0xbd3cd221887fa624, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d8fe71212a, %r1, %r9
	setx	0x65135d772720c8e4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000efc54ce19e, %r1, %r9
	setx	0x1cc8d429aae24466, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f23c88f4de, %r1, %r9
	setx	0x7d647f8826f51615, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ea1c7e4, %r1, %r9
	setx	0x57ddf24a24c6f1cc, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ff23dac, %r1, %r9
	setx	0x957127dcadc5dde5, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cc2628fe18, %r1, %r9
	setx	0xe0f5d0dea3c071f4, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d655353db8, %r1, %r9
	setx	0x9c0d72d8ec6b288d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e59d2949f8, %r1, %r9
	setx	0x6c7ecf13b112bb1f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f8fccbad8c, %r1, %r9
	setx	0x29c029af67f9986e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e656420, %r1, %r9
	setx	0x24c23aa7d3085c7d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f4deb38, %r1, %r9
	setx	0x487b5b6e5132863a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c4563ed1f0, %r1, %r9
	setx	0x582225d841a3f06c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000db9c9a6818, %r1, %r9
	setx	0xce354a306dfd6705, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e53e389300, %r1, %r9
	setx	0xee84d82a19ba4d7e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000facd3dfa20, %r1, %r9
	setx	0xa6d59ad64bbaa0be, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f3851a2, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e21bf1e, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f8023147c1, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fcf66e4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e1e9200, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e58f840, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f608800eb0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ef699a0d70, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000df2bf0e2e4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ca1d4af7a0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d5e2f73dd8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c937613078, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f47c1b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e8064e0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f4bc6e3dc0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e5bec82088, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ed579d3, %r1, %r9
	setx	0xc86a253ca2a7ffc1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f2e802c, %r1, %r9
	setx	0xac90117bfb680263, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c45b1a6663, %r1, %r9
	setx	0x76641186a6bb376e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d9d4e61a98, %r1, %r9
	setx	0xf03eb8f16ae0a3dc, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000eb2caad385, %r1, %r9
	setx	0xd76c1f88c602def3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fedc8a318e, %r1, %r9
	setx	0xb532df917c10f015, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e036c68, %r1, %r9
	setx	0x6ebd9e835e9ded39, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f23d3c0, %r1, %r9
	setx	0x82b31dc4c44f2ec4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c984b246f4, %r1, %r9
	setx	0x6ccc4bcbb6dcf757, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d10110bf9c, %r1, %r9
	setx	0x273108fbd08a7dc3, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e90a03b390, %r1, %r9
	setx	0x8ae99749e30c5a59, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fc32e4c76e, %r1, %r9
	setx	0x877c08f9530a8a7d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e11b9f8, %r1, %r9
	setx	0x46e7936436429581, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f7af3a8, %r1, %r9
	setx	0xf2b4268e5908d888, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cf4a970fa8, %r1, %r9
	setx	0x2f81886756ae5f8f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d8d10dd1e0, %r1, %r9
	setx	0x7e7f59af42db05e1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000efee8124ac, %r1, %r9
	setx	0xca691aaf8fa3b62c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f6b960d798, %r1, %r9
	setx	0x87b9df45f6da943d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e0fcc08, %r1, %r9
	setx	0xbe1e04aa72da5b14, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f775350, %r1, %r9
	setx	0x41e7a0c06b3b02e6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c47b03d218, %r1, %r9
	setx	0x5afebbf5828821de, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d91f122260, %r1, %r9
	setx	0x990904cd3f19eb32, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e4730df0e0, %r1, %r9
	setx	0x911023010ce2dbc0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fef4a68d78, %r1, %r9
	setx	0xb74785fab5610566, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d4f96f87d8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ccca582418, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fcf66e4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e1e9200, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f2d7f65b4a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e97d0364b8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d2ee73c672, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e59d2949f8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d655353db8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ef7b4a4730, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e39c45b, %r1, %r9
	setx	0x33fb2bf45ac4d866, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f3ecfec, %r1, %r9
	setx	0xd265452d45ea9824, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cbc335baf6, %r1, %r9
	setx	0x02ffa9d54c0452b9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d26972ff12, %r1, %r9
	setx	0xa1387d15ca46a70b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000edeb3ab263, %r1, %r9
	setx	0xf4583a4fd6092819, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fadc727ee2, %r1, %r9
	setx	0xe5f0f11d879489cb, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e08c934, %r1, %r9
	setx	0xc36c188e169f2d13, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f19508c, %r1, %r9
	setx	0xd59ed6e7e7224c43, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c4a51d940c, %r1, %r9
	setx	0x878b618d91e01771, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000df40ee1bd8, %r1, %r9
	setx	0xa355b4cec7e6b851, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ebf9cbd6a2, %r1, %r9
	setx	0x482647b6e3ed2414, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fa7c3f2f46, %r1, %r9
	setx	0x75edabbece1599e6, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e70e768, %r1, %r9
	setx	0x3faf41da6f35235c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f2f24d4, %r1, %r9
	setx	0xb21410db17aa064f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c72280c738, %r1, %r9
	setx	0x06d5788a9c6872f6, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000de76b8b878, %r1, %r9
	setx	0x4e3d2ddae6fd451d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e39e907b50, %r1, %r9
	setx	0xdbb97a315ad6a29b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fedac8f9c8, %r1, %r9
	setx	0xda804801c518ab0b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ef1bb40, %r1, %r9
	setx	0x96e076113fc4022f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f1d4270, %r1, %r9
	setx	0xc39593ab2358d93a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ce1dd0b468, %r1, %r9
	setx	0x63aee85b0a038f7c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000db40d81010, %r1, %r9
	setx	0x7cd129d3900f3ab3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e807960af8, %r1, %r9
	setx	0x8467249c12752d75, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fa81a97890, %r1, %r9
	setx	0x77d1a0cf434fe3b2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ea028e959b, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d17a334e00, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c02eb42aae, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f61dc56, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e549aba, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f8a03b23b1, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d83f7818c4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c3eb93052e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fe917c8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ec25934, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fe9fc38, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fc86480dc8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e489e3f588, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d67d1b3258, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c0364694a8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f737f68, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e5511d0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000febe36b5b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e517d51, %r1, %r9
	setx	0x52ec72f6bda2bec4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f8c32cf, %r1, %r9
	setx	0x909663bd740b2589, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ced9a0c15f, %r1, %r9
	setx	0x1ca0571ae9bedbb0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d2c07f7570, %r1, %r9
	setx	0xa0290d4c6bf15825, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e2de82ed3e, %r1, %r9
	setx	0x59589788f4c28a2e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fe8825d6c0, %r1, %r9
	setx	0x53f2d29edaee4afc, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e08925a, %r1, %r9
	setx	0x642890f003c476e9, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fc7f0d2, %r1, %r9
	setx	0x0d73f833484ae560, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c15c0e388a, %r1, %r9
	setx	0x2dbdbb4c2f250dd2, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dd3fd2f270, %r1, %r9
	setx	0x42ae891e2f6e190b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e763f8808a, %r1, %r9
	setx	0x38015ce91551c5cf, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f0f5c9d8c6, %r1, %r9
	setx	0x65cbfdbae1ebc69a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e972ebc, %r1, %r9
	setx	0x65cdd853a4bb35d3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f051100, %r1, %r9
	setx	0xb9372934de156b26, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ca1cc65514, %r1, %r9
	setx	0x50f0f91ab37b5555, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000dbb985bcb0, %r1, %r9
	setx	0xe25e4de3c3f92f0e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e5b211ff00, %r1, %r9
	setx	0xcaaf396c759d27d9, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f6b0f21108, %r1, %r9
	setx	0xd4642c16b3e4dc92, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e2b63d8, %r1, %r9
	setx	0xc32eaa89f3b16878, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f686fa0, %r1, %r9
	setx	0xad722316218b2725, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c62ac13f58, %r1, %r9
	setx	0x5975dba5b2bb5d54, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d7a1ce3100, %r1, %r9
	setx	0x7f47ee9d3fe08ed7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000eccfe353f8, %r1, %r9
	setx	0x3dae4015f123d10c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f623398680, %r1, %r9
	setx	0x278db0b3b15d6b80, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e32f07b, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e53e389300, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e9eb372, %r1, %r9
	setx	0x7aaf92155247ce29, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f7855d9, %r1, %r9
	setx	0x95a747d29a2a4ad3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c8f3d6d5d5, %r1, %r9
	setx	0xe9d4ffaab0595617, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000db0eac9c45, %r1, %r9
	setx	0xb9db15a764ccf1c2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ef1138bdb7, %r1, %r9
	setx	0xd6b97d409cc01732, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f8dbdf57e1, %r1, %r9
	setx	0xdf156c636b7ebb9a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e8d47f6, %r1, %r9
	setx	0x183711f4fa9bfce8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f0b5756, %r1, %r9
	setx	0xb7d853ad1d2c964d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c76f9cfdaa, %r1, %r9
	setx	0xde47f299cadb6a25, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dc92ca30ca, %r1, %r9
	setx	0x5678d8190c171ccf, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e6b501cae6, %r1, %r9
	setx	0x99b0d15885849d73, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f0fd18b1ea, %r1, %r9
	setx	0x8c1d412c04cb49d2, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e725f30, %r1, %r9
	setx	0xb56a34ecefe8b163, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f462ae0, %r1, %r9
	setx	0x943ff9a2a22ce48d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c78d785748, %r1, %r9
	setx	0x9a5eaadb408e2d83, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d3b29d1f1c, %r1, %r9
	setx	0x7fe6c87ee883ee04, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000eab065c94c, %r1, %r9
	setx	0x5a6f8f5d709be5ab, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fc8ed846c4, %r1, %r9
	setx	0xa196e98fd66f383c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ea966a0, %r1, %r9
	setx	0xd6ec57323ee5c7b4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f11c7e8, %r1, %r9
	setx	0xb7142be15d195ff1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cd79791170, %r1, %r9
	setx	0x4f4c44d1f68af6bf, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dd75bcf6d0, %r1, %r9
	setx	0x1d7e987c3945bad7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000eb3cb85000, %r1, %r9
	setx	0x4eb7ad75595574c1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fa2d0c28b0, %r1, %r9
	setx	0xf8d831bb8ebef9a6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f61dc56, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e08925a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fa7c3f2f46, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ebf9cbd6a2, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000df40ee1bd8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e9786c8dc8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d6032975fc, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000cced532860, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800fc11b40, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800ea63870, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f01bde28bc, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e7eba98088, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e1418bbdb0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d79c512238, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000cf0e3eeb20, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f69ba90, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e27f2d8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000fab18375f8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e0b2aea, %r1, %r9
	setx	0x4431bf318556e894, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f11bb6b, %r1, %r9
	setx	0x5fd2c7e7454782fb, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cb45e5042c, %r1, %r9
	setx	0x6111f9d1e3ebaa49, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dffe0dc8d3, %r1, %r9
	setx	0x9d8f8426d55b823e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e3459fccb7, %r1, %r9
	setx	0x6ffff6ab886197f3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f2795b116c, %r1, %r9
	setx	0xcf6deee44ef4f93e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e5ef71a, %r1, %r9
	setx	0x015ca7c3fdce5bb0, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f38deb6, %r1, %r9
	setx	0x3a926823f04077da, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cc2c63486e, %r1, %r9
	setx	0x8a6bb67b6ec32835, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d78ded2436, %r1, %r9
	setx	0x8ec88101785affa9, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ead0a6420a, %r1, %r9
	setx	0x590bf1b13bdfc660, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f605e0661c, %r1, %r9
	setx	0x7bec1518d18e25bd, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e179ec0, %r1, %r9
	setx	0x0ea41abd410ce236, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f8202c8, %r1, %r9
	setx	0x91e739b98b7e62a2, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c834fe4e28, %r1, %r9
	setx	0xe35ec3bdcc55d3dc, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d9b155ce94, %r1, %r9
	setx	0xc0135bc5099672ae, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e3b3168d50, %r1, %r9
	setx	0x3806a8d447e4c993, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f6148d5b1c, %r1, %r9
	setx	0x665d2d281b393790, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ef23718, %r1, %r9
	setx	0x41a163daf87ca741, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f705ec8, %r1, %r9
	setx	0x03d8687c40eeb629, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c8f25cb8c8, %r1, %r9
	setx	0x49d74e89bb166585, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d1aab4dd70, %r1, %r9
	setx	0xd55b376d9e14ed61, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e90e9fd078, %r1, %r9
	setx	0xeb1d6814bcd2702e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fe62f42390, %r1, %r9
	setx	0x5f8a56c1be38ea9e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d4fa97b6e0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c79b0942e0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f99e4b4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e2867ac, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f4e2f265be, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ea1c7e4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f03f06e3ec, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e068a59564, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fef4a68d78, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e4730df0e0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d91f122260, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c47b03d218, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e960fa9, %r1, %r9
	setx	0x1eb849731bb71e9a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ffedecf, %r1, %r9
	setx	0xf41b4332127d25d6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c9b6cf5801, %r1, %r9
	setx	0x18d4ba51b1e8de6a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dd3fb1aec9, %r1, %r9
	setx	0x46c5a11c13845d1d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e8fea8677f, %r1, %r9
	setx	0x5bc9565018cd9ef2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f06c9a57fc, %r1, %r9
	setx	0x0f71aa8622bc7ff2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e39e70c, %r1, %r9
	setx	0xb3e18520be0fbe49, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f541340, %r1, %r9
	setx	0x0a23c03c43af9818, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c97a0d3b22, %r1, %r9
	setx	0x8f21ae430132b579, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d6e53dc0f2, %r1, %r9
	setx	0xac78eb153f0f7abe, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e7f67f48a2, %r1, %r9
	setx	0xdc2f7226bfbd1337, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fa2da9da9a, %r1, %r9
	setx	0x9c4e7ad7505e095f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e0d58cc, %r1, %r9
	setx	0xaa854515b2401320, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f1890c0, %r1, %r9
	setx	0xa1d50c91d1b2ce58, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cbc0da3560, %r1, %r9
	setx	0x6696adb545229aa3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d537294c90, %r1, %r9
	setx	0x4f6f230aa18b1a23, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000eb09afde30, %r1, %r9
	setx	0x32b63059b7d74ee4, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fc515b8a00, %r1, %r9
	setx	0xc37d9008f4b3c923, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800eb4d870, %r1, %r9
	setx	0x47236f5a631a49ed, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ffd12b0, %r1, %r9
	setx	0x85b184109089c67c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c4e7898828, %r1, %r9
	setx	0x6e11f509946f7db5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dd6cb044c0, %r1, %r9
	setx	0xcab91e904d1370dc, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e2384c6770, %r1, %r9
	setx	0x7af3671840c5ccf3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fe9459a1b8, %r1, %r9
	setx	0x8e88dd3dcd1bafde, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e87dde0493, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d5a610bf22, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c37bdd7cd2, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f96c808, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ef3d4a8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e4ba6ec, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f0e9d173bc, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e6b9635, %r1, %r9
	setx	0x7e0248cc385f0c7e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800faf26f0, %r1, %r9
	setx	0x463ff5a2081a81c3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ca1f51d48e, %r1, %r9
	setx	0xec5659821048bd3b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d30d552595, %r1, %r9
	setx	0x0c5f7eec2453a387, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e947da5d2c, %r1, %r9
	setx	0x7b23be2d3f1edd79, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f2fb088312, %r1, %r9
	setx	0xa92ba567df5311ed, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e73a5a0, %r1, %r9
	setx	0xa18d72f0fe1d9b2e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f57fbac, %r1, %r9
	setx	0x64d8167f2342acf4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c9ee0b1f12, %r1, %r9
	setx	0xdc18a78f4dc3273a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d021926074, %r1, %r9
	setx	0x3226edf3db80c401, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e9383b6920, %r1, %r9
	setx	0x271ece5b5a9f4aac, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f68f0d390c, %r1, %r9
	setx	0x3696fd981f541435, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ed36538, %r1, %r9
	setx	0x1f26f3d8de719de4, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f219dfc, %r1, %r9
	setx	0x93db3a68e76a0fe8, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c96660039c, %r1, %r9
	setx	0xf0d5da77802ff060, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d2dcf3c4b4, %r1, %r9
	setx	0x8f89959cacb97410, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000eae106f124, %r1, %r9
	setx	0x6b2a9b42404f7dee, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f0d4a24c84, %r1, %r9
	setx	0x519b48dd476f6c22, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e95e768, %r1, %r9
	setx	0x5d53e0df3385a260, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f50b328, %r1, %r9
	setx	0xd06fb2f8e45e177f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c9f6f698a0, %r1, %r9
	setx	0x25b5fbb321fe9214, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dede9e07a8, %r1, %r9
	setx	0x4396d30b3408e4c2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e617dd2010, %r1, %r9
	setx	0xfb77e324a7a9d680, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f888825070, %r1, %r9
	setx	0x90540d4429d2c5cd, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000edeb3ab263, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d26972ff12, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000cbc335baf6, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f3ecfec, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e39c45b, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ce5d175e40, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fb288d0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e47ff18, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f29afa619c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e9961118fc, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d708d9713a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cd3ec85ca6, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d8d10dd1e0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000cf4a970fa8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f7af3a8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e11b9f8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c04f91d7b8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fac5420, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e7acf60, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f461b6e648, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e1418bbdb0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d79c512238, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e00bdc6, %r1, %r9
	setx	0xd2de265dc9cae0da, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ffcdf10, %r1, %r9
	setx	0xe1132821ad3ac121, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c19cfc2702, %r1, %r9
	setx	0x9efade919d7b7797, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d42b820d08, %r1, %r9
	setx	0x1de8253de4990eab, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e14399ce16, %r1, %r9
	setx	0x55ef3f7339e5869b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f4722b1c6f, %r1, %r9
	setx	0x3b9e14d18b09b3f0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800efb760e, %r1, %r9
	setx	0x235c0dae0a5f1149, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f41a5b4, %r1, %r9
	setx	0x0173aa6d3e795d4a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c7ab2cc744, %r1, %r9
	setx	0x05e5ef0a67e0ef3b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000da98662954, %r1, %r9
	setx	0x54562ea6b7ceb88e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e73bd1bc9c, %r1, %r9
	setx	0xe8953bd8507365a7, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f45c8b48c6, %r1, %r9
	setx	0x0ca810e1f362ca06, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e2271e8, %r1, %r9
	setx	0x18ec4f67e32208db, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f6b1344, %r1, %r9
	setx	0xba4e7bda876ed321, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cb50a8b6a4, %r1, %r9
	setx	0x4f240f86bc18e914, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000dbcd68c458, %r1, %r9
	setx	0x0c99b49daa8ae4a0, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e3f5e62714, %r1, %r9
	setx	0x03eead3e41b31b77, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f6a728f528, %r1, %r9
	setx	0x2e6e1c20ae8db980, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e1d2eb8, %r1, %r9
	setx	0xd3f2994427b6f0e4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fd88710, %r1, %r9
	setx	0xb9a0c8270da5427b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ce3b25f258, %r1, %r9
	setx	0x30c24a73182af3ff, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d145f4b1e8, %r1, %r9
	setx	0x7fe8216900bdddec, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e8000bd890, %r1, %r9
	setx	0x53744343bd9fe61d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fcae656508, %r1, %r9
	setx	0x124e3c2e1165a066, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e777ba2, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f46225ae3e, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f170572, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800eff1320, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f8406851b6, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e3f3409750, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000db0666e20a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c324a17a44, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d9b155ce94, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c834fe4e28, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f8202c8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e179ec0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fc8ed846c4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000eab065c94c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d3b29d1f1c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800fd736e8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800edc3e00, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000fc3eaec250, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e4dd7a1320, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000dbf86f0038, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c0a8d64770, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e826c0f, %r1, %r9
	setx	0x7a0fc27a0835dc5e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f97b12a, %r1, %r9
	setx	0x19d3f993da963d75, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c64f6c0ef1, %r1, %r9
	setx	0x0b5e33d84c4d1c19, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d4565c58da, %r1, %r9
	setx	0xfdbc808252360776, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e785d57a2d, %r1, %r9
	setx	0x6ad22d2ef3eb38e6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fc8e12ab50, %r1, %r9
	setx	0x30cb7722063a88c6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ea861f0, %r1, %r9
	setx	0xb4cea85ab86bf97d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f8865f0, %r1, %r9
	setx	0x4a27457011b69320, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cf9aceb1d4, %r1, %r9
	setx	0x71a7032dbef84747, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dce24aeaf4, %r1, %r9
	setx	0x454b3e151c9814ee, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e709f80868, %r1, %r9
	setx	0x826354b90a208b55, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fece1f4ba6, %r1, %r9
	setx	0xe3715f1e8f93206d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e6a7a04, %r1, %r9
	setx	0x117fee2adb868477, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800faaa340, %r1, %r9
	setx	0xc63274e002f83181, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c42a8e1478, %r1, %r9
	setx	0xb0c06a72dd0c192f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d27289eb40, %r1, %r9
	setx	0x35b9b876a667c43e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ee1b6b9e78, %r1, %r9
	setx	0x07d337831b31f6ea, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fa20def9ac, %r1, %r9
	setx	0x128f73b514ee6dea, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ed14e30, %r1, %r9
	setx	0x9b4b2cc80956d12e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f9fc560, %r1, %r9
	setx	0x86bd1c94bbb500fb, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c9783b3700, %r1, %r9
	setx	0xa992de4bbc99b947, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d1161c1398, %r1, %r9
	setx	0xb36f43d8d4bd4366, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e88c5a93f8, %r1, %r9
	setx	0x0d6d3d888421a948, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f42ec25008, %r1, %r9
	setx	0x3c315fb72fbf2896, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dfd335d300, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c6409dd4e5, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f6abc69, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e32f07b, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fc51ad6d1a, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e7dac1fc99, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d690890c22, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e9383b6920, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d021926074, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cb588c2cec, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f022084, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d67d1b3258, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c0364694a8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f737f68, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e5511d0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000febe36b5b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000ef0d143ed8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000db9a89c570, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e1a7d1c, %r1, %r9
	setx	0x0e78899f36cc0e93, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f2483f1, %r1, %r9
	setx	0x85c473916183212f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c38b0de095, %r1, %r9
	setx	0xc86174cc159e6c05, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000df959f0de2, %r1, %r9
	setx	0x86df964e28aec092, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ef586f22c7, %r1, %r9
	setx	0x37af357edb35a2b3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fc5116d660, %r1, %r9
	setx	0x41ee7bf5b911d66e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e0f97ac, %r1, %r9
	setx	0x8358b9867ee1673b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f3a2c24, %r1, %r9
	setx	0x58508e649ab630a4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cf5216482e, %r1, %r9
	setx	0x78ae6a33afe3baac, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000de00ab0d6a, %r1, %r9
	setx	0x05298c3aa5d36a5d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e0d293356e, %r1, %r9
	setx	0xf2599943b57a68fe, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f2cc19b574, %r1, %r9
	setx	0x6d4701d34147325d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e1460d8, %r1, %r9
	setx	0xe92eefdd310570ce, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ffb8940, %r1, %r9
	setx	0xabdc6cfe021c352d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cc90e5dd78, %r1, %r9
	setx	0x850ef9541f262ebe, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d9f1e8ee28, %r1, %r9
	setx	0x0460177e876968bd, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000edf6448968, %r1, %r9
	setx	0xe7db769bfa0a647e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f2b5fe3750, %r1, %r9
	setx	0xac722de841253112, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e2f8800, %r1, %r9
	setx	0xf838d8df24c122ac, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f252f88, %r1, %r9
	setx	0x3f3587fb8527134e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cfcbff8eb8, %r1, %r9
	setx	0x3948f59af08d62cd, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000de80a34040, %r1, %r9
	setx	0xf014dc50536f90bb, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e1cdfb6f38, %r1, %r9
	setx	0xecaed754dc9643f3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fe0b255060, %r1, %r9
	setx	0x9866c2763ca74468, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c278ef6439, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ff820e2, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f19508c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e08c934, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e725f30, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f6b0f21108, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e5b211ff00, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000dbb985bcb0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ca1cc65514, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e54dfe0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000fa51ce54e8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000ee2c7fb828, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000daec7dd4f8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c5bf543d00, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f44e280, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e27f0b9, %r1, %r9
	setx	0x9b92554293e4c3a4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fbbb3d7, %r1, %r9
	setx	0xc0d4435ff3e2942d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c7975963b9, %r1, %r9
	setx	0x12cea2eb7c1d4787, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d441123297, %r1, %r9
	setx	0x354e7d17617e281f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ec32daec20, %r1, %r9
	setx	0xb9aadb35548ab362, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f0c3be2e97, %r1, %r9
	setx	0xf52f21986d5a6bf2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e92f758, %r1, %r9
	setx	0x0fc085982ea09e7e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f6c69d0, %r1, %r9
	setx	0x032a25899d218273, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c62b036628, %r1, %r9
	setx	0x0965f37493c0dafc, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d5d2ebb060, %r1, %r9
	setx	0xe283a900223f91d5, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e2b7f8c5a4, %r1, %r9
	setx	0x77c1b48b5d49b5ad, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f2cd55321a, %r1, %r9
	setx	0x3128ebdfccc91d20, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e02491c, %r1, %r9
	setx	0x9479280657ff2f9d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f1b1c48, %r1, %r9
	setx	0x11749d19200d5609, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ce61f17348, %r1, %r9
	setx	0xff4cea6feead1a1f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d9839a7bc4, %r1, %r9
	setx	0x4946279ccb990251, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000eddf3b40ac, %r1, %r9
	setx	0xd9c2d361bd1d87be, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f0980260dc, %r1, %r9
	setx	0x96020fdac894079c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e51a038, %r1, %r9
	setx	0x6e59d8fc6ac9f422, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ff584e0, %r1, %r9
	setx	0xa2e8b476ef11b20c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c44779f420, %r1, %r9
	setx	0xd11efd507bad7252, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d5ecbfc470, %r1, %r9
	setx	0x458120b2cffac0c6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000eea5a9ab10, %r1, %r9
	setx	0x3a914c17046a4184, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f4c5ef8fd0, %r1, %r9
	setx	0x4e1e2c3753c546b0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fd999fc, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e490012f38, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ddc2220074, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c527ca79c4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800faef0e8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e58f840, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e5511d0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000febe36b5b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000ef0d143ed8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000db9a89c570, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c4fe112930, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e69ac92, %r1, %r9
	setx	0xaee70146fe07b7e5, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fb19e3a, %r1, %r9
	setx	0xe5be3d7627356c33, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c250420a93, %r1, %r9
	setx	0x8abd6cf887a099c6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d76736d2f5, %r1, %r9
	setx	0x79353ef1fa9bb93c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e077c8b150, %r1, %r9
	setx	0x743c8dc7de830f81, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f824fa884a, %r1, %r9
	setx	0xaf6a62a0a6491824, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e218328, %r1, %r9
	setx	0xfb952aebc98e5f29, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f77e6f8, %r1, %r9
	setx	0xac1804de39d226fd, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ca1adc6072, %r1, %r9
	setx	0xdc40d8e09ae5282c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d80d706202, %r1, %r9
	setx	0x1345cb145d8c46e5, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ef3094ad34, %r1, %r9
	setx	0x34bc05d730607605, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f27b6646c2, %r1, %r9
	setx	0xe7640219ae2f2db1, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e2a1be8, %r1, %r9
	setx	0xd154d2ec43a4c60e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ff55640, %r1, %r9
	setx	0xea6762c495eebca1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c82dcbb958, %r1, %r9
	setx	0xd60c993e30cf66ed, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d323f68d54, %r1, %r9
	setx	0x05170e4df2d1f667, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e3f0ee65ec, %r1, %r9
	setx	0xe2f33e736ef61d5c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f69d8566cc, %r1, %r9
	setx	0xb575615ee1c81400, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ea75b88, %r1, %r9
	setx	0xc7ba328cef3b8a1a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fb21428, %r1, %r9
	setx	0x2a018b82120ea5f4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c03b713068, %r1, %r9
	setx	0xa6e8189d6953b54c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000df192300b0, %r1, %r9
	setx	0x77d3c29236bf932c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e967c34698, %r1, %r9
	setx	0x0fea67dc8e3f59fd, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fe18834bc8, %r1, %r9
	setx	0x9e76fa165f949d65, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e785d57a2d, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d4565c58da, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f65b2beb34, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ef7347bd08, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f4deb38, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e656420, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e0ec5cc, %r1, %r9
	setx	0x77c479a3b0a03338, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ff705a5, %r1, %r9
	setx	0x1518a4bcf0a4b917, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c405ff83fd, %r1, %r9
	setx	0x415302f9c41f251a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d212589dbe, %r1, %r9
	setx	0xdc4690516f9b35d6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e8bc6c7d95, %r1, %r9
	setx	0xa394ec9d20eb5334, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fcda4f6e23, %r1, %r9
	setx	0x3d6310c29ae3d0b0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ec815e0, %r1, %r9
	setx	0x3bb1a3988d53b336, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fc1293e, %r1, %r9
	setx	0x08aa32e29b0d2ee5, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c9c4f254b2, %r1, %r9
	setx	0x3c6070c5e6e5b96e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d374357f9a, %r1, %r9
	setx	0x0ac16287647b220e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e79e5cf06c, %r1, %r9
	setx	0xe2febbd666bd6847, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f6fa76415c, %r1, %r9
	setx	0x94cf2c3e1657e7b1, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e1ef42c, %r1, %r9
	setx	0x8f6fed1f2a64796e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fcf1560, %r1, %r9
	setx	0x6afc7bd5f4ced8da, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c83ab303c8, %r1, %r9
	setx	0xb52acb918985cd1f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d9030fe140, %r1, %r9
	setx	0x36ba55b810bdf7a1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ee0a70fe70, %r1, %r9
	setx	0xdaf5ba43ea77f3dc, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fa27b9f17c, %r1, %r9
	setx	0x7712371d0e8acfc1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e18c998, %r1, %r9
	setx	0xab685e531156f413, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f806e70, %r1, %r9
	setx	0x50d95249c323065f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c726dde568, %r1, %r9
	setx	0x7f14f32804ca6e3a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d011a76168, %r1, %r9
	setx	0xd9d8ba2198b981fe, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e1b8c19e00, %r1, %r9
	setx	0x1aece6300cb5f8d6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f02f070b40, %r1, %r9
	setx	0x82266b7ca4c0fa0d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d18808d19a, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c702fa3b7c, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f3cceea, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ecc2fbf, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f0d77f2e47, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e5f931a6c7, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d2a880241c, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d0b5c9d8c4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000caaebd1b72, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f6a2cfa, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800eb2ffa8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f48b810374, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000edd6a5e720, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d2dcf3c4b4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c96660039c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800fb582d0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ede03b1, %r1, %r9
	setx	0x605fe7cdc6499890, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f37b27c, %r1, %r9
	setx	0x5af6dc3884d6f113, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c0402a2f68, %r1, %r9
	setx	0x35c205cf8c5dad48, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d184245a2d, %r1, %r9
	setx	0xf3217b13eabd4587, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000eb415627e9, %r1, %r9
	setx	0x3cd5d4ae5a35f12d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f608443dd9, %r1, %r9
	setx	0x12278c89d034e584, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e9864dc, %r1, %r9
	setx	0x15934ee09859c934, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f5d6480, %r1, %r9
	setx	0x8500aedfe616d2c1, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c9c882eaa6, %r1, %r9
	setx	0x509f9e9263e92f70, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000da5e5341cc, %r1, %r9
	setx	0xdef73dc340880339, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e66d3e205c, %r1, %r9
	setx	0x8a41463b43f29dd1, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000faabefa6ca, %r1, %r9
	setx	0xde17a1c982bd8a93, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e5b1748, %r1, %r9
	setx	0xbbfb0ac8f8f36d33, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f131044, %r1, %r9
	setx	0xd290a971d2ff7e90, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cd228448b4, %r1, %r9
	setx	0x53c6e615e4a71d72, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d5872e9fe4, %r1, %r9
	setx	0xa753a5cf9a77bfb6, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e5b1922748, %r1, %r9
	setx	0xbf3f8a7caacfab93, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000faa0a28a40, %r1, %r9
	setx	0xae6b50ce940c147f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e29a250, %r1, %r9
	setx	0x9ff168b175eaf7f6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fc388b0, %r1, %r9
	setx	0x85e632386861e4bd, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cc1f2a8e48, %r1, %r9
	setx	0x38ee79e91429a54f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d00fcc3ad0, %r1, %r9
	setx	0x6e317d771691a83f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e405c635d0, %r1, %r9
	setx	0x79aefc7aa5eaf6f5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f4d50b1a30, %r1, %r9
	setx	0x662dddd425ae859e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fe7f1f7de5, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e4a509ca5c, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d18808d19a, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c702fa3b7c, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f3cceea, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ecc2fbf, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f0d77f2e47, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ead0a6420a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d78ded2436, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cc2c63486e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f38deb6, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e5ef71a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f0fd18b1ea, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e6b501cae6, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800eff6a80, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e18c998, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000fe18834bc8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e967c34698, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000df192300b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c03b713068, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fb21428, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ebbe424, %r1, %r9
	setx	0x5a46f8e60e503534, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f5543a2, %r1, %r9
	setx	0xf2aab9e996b4f73d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c6089fad2e, %r1, %r9
	setx	0x849501208b74196d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d2bc65d6d9, %r1, %r9
	setx	0x6193949c7609434f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e894d8fee4, %r1, %r9
	setx	0x58f131aa573d9a11, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fa9f3849eb, %r1, %r9
	setx	0xe51c9fb70b4a2d33, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ec5290e, %r1, %r9
	setx	0xda1cb11723705751, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fcfd9f0, %r1, %r9
	setx	0xda1dd5d95b005ff8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c1b7ac6cf0, %r1, %r9
	setx	0xe4b1b0f1cefd04c2, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d51d65bf8e, %r1, %r9
	setx	0x05592eeb8a8cf69c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ebb4005ae4, %r1, %r9
	setx	0xeadf1c0ed9a89f23, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f8ffbdfb12, %r1, %r9
	setx	0xbeabeac893d832ec, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e3299f0, %r1, %r9
	setx	0x14b55a702d7fcf9c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fa250c4, %r1, %r9
	setx	0x3c2878881ad0d538, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cad765fb24, %r1, %r9
	setx	0x1b117c1354747cf9, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d3921631d8, %r1, %r9
	setx	0xa51c223286e21b75, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e14effa91c, %r1, %r9
	setx	0x3d961af46d8666a9, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fa1137138c, %r1, %r9
	setx	0xd9c3e9557ba05273, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e1b0728, %r1, %r9
	setx	0x7b82cd60be8e125b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fd5af80, %r1, %r9
	setx	0xa2a5b9894c42662c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c740a865c0, %r1, %r9
	setx	0xfda145f0fa3181a9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000deb798fc28, %r1, %r9
	setx	0xa1f49f208709d5c9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e56b3742f0, %r1, %r9
	setx	0x400b0b823f6572c4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f057545760, %r1, %r9
	setx	0xb00725059c92f454, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cdce0de097, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f97d95b, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e403e0d, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f061bb2a35, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e09fb27864, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d8772aa778, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c5ac610493, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f003a99e1e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e1fb6f2772, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000daf657c564, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c18cd866de, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f7c77a4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f462ae0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e725f30, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f6b0f21108, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e5b211ff00, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000dbb985bcb0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ca1cc65514, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f051100, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f625040, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ec3b310, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e81dd2e, %r1, %r9
	setx	0xa380e590c24c538e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f32680b, %r1, %r9
	setx	0xc1e5e4e3ffddc0a0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c771b2e1ec, %r1, %r9
	setx	0xc01598bdc6f5db9a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d69a11cfe3, %r1, %r9
	setx	0xff8d734a8eb0a1e6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ebc6339d9c, %r1, %r9
	setx	0x9560994d3c19cff9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fe68dd21a9, %r1, %r9
	setx	0xb237b4b2d3f11eee, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e403cb4, %r1, %r9
	setx	0xb74f22a05f9a4155, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f884060, %r1, %r9
	setx	0x33f888b15010398a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c33c6dc982, %r1, %r9
	setx	0xe4e73a3b341faa0c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dc39734dd2, %r1, %r9
	setx	0x2feda7a5f48fc7f1, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e0f564f22c, %r1, %r9
	setx	0xc8a5936a6f14b613, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f8c7764a76, %r1, %r9
	setx	0x586a25f307828b11, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e6bd3e4, %r1, %r9
	setx	0x0bf9d7806a107b44, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f2a1660, %r1, %r9
	setx	0xc576fadee58d0df7, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c9fb6ff4f0, %r1, %r9
	setx	0x8408139cf18820a2, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000dcd5fab3cc, %r1, %r9
	setx	0xb723304a667da6c5, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e4502dff34, %r1, %r9
	setx	0x8375932fff7f6985, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f8eefa3580, %r1, %r9
	setx	0x049ed38c243b4b31, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e65aab0, %r1, %r9
	setx	0xbdffa637c266751f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ff7eb38, %r1, %r9
	setx	0x023a17837d13e824, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c0214ce850, %r1, %r9
	setx	0xd4200899cf525628, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d049e6e6e0, %r1, %r9
	setx	0x158c85e1954f37ed, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e1751d8a20, %r1, %r9
	setx	0x9fca84c5feb5ac8e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f04df397d0, %r1, %r9
	setx	0x9ea9817affa9ab93, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6fe9c4585, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e4cc774b9e, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d4fa97b6e0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c79b0942e0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f99e4b4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e2867ac, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f4e2f265be, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000eab065c94c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d3b29d1f1c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c78d785748, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e412da8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f2d2932348, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e022a399c8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e211f78, %r1, %r9
	setx	0xc6adbf2731171fb4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f0e808f, %r1, %r9
	setx	0xbba166684aa26f07, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cfda639982, %r1, %r9
	setx	0x568cf3fcad6dc319, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d30eeb6baf, %r1, %r9
	setx	0xd4b88042e52ac5dd, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e74e4072a3, %r1, %r9
	setx	0x24a846a94a654665, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fe1ecffac8, %r1, %r9
	setx	0x12878fe09111ef48, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e1cdce2, %r1, %r9
	setx	0xbb279fed555f551c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f8c283e, %r1, %r9
	setx	0x90d0b7938f16b99c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cc25a195b0, %r1, %r9
	setx	0x3d668b2fdc1022d5, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dbf589562a, %r1, %r9
	setx	0x9a70dc7509f51ced, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e3fbd71faa, %r1, %r9
	setx	0x4754b3ffe0f1e6c4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000faa343b402, %r1, %r9
	setx	0xaf7e901da7ff93b1, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ed21310, %r1, %r9
	setx	0x1e83744ae49f2300, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f71ad24, %r1, %r9
	setx	0xf6c7c92517386ca4, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cae0ab6cac, %r1, %r9
	setx	0x3eb274f3ab06ea58, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d142e56e98, %r1, %r9
	setx	0x807e8e854dcc5c51, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e1d692b78c, %r1, %r9
	setx	0xf61fb97073eb50e4, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fe75c485ac, %r1, %r9
	setx	0x9aa358702cc4dc14, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ebf35b0, %r1, %r9
	setx	0xb9858947695c37cb, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f2c8b90, %r1, %r9
	setx	0xd8f5238e2ca5d625, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c997cdcb98, %r1, %r9
	setx	0xe89aba2a0f64d00e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000da4def7b20, %r1, %r9
	setx	0x47e8d4e5fcf82ee9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000efdfdfce40, %r1, %r9
	setx	0x248c3c34ef1acb97, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f448d5a610, %r1, %r9
	setx	0x79cc2d48b73c7b31, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e94c9db19c, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d021926074, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c9ee0b1f12, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f57fbac, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e73a5a0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fa2da9da9a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e4502dff34, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000dcd5fab3cc, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c9fb6ff4f0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f2a1660, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e6bd3e4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800ea75b88, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f4c5ef8fd0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000eea5a9ab10, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d5ecbfc470, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c44779f420, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ff584e0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ebe1f8d, %r1, %r9
	setx	0x532a5e81d1915d79, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f124ae8, %r1, %r9
	setx	0xa6043e41ae134dbe, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c6e51aba34, %r1, %r9
	setx	0xcf3fc67456d1549b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d1ab8aeddb, %r1, %r9
	setx	0x0104ef76d0861f13, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e53edd25ca, %r1, %r9
	setx	0xdc490ec8e5ef3fbe, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f8674804d2, %r1, %r9
	setx	0x6f36512954e1fe10, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ec42df8, %r1, %r9
	setx	0xcae2b0d3a945c6f3, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fc84f94, %r1, %r9
	setx	0x3c264d0060787d01, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c6d28c3d88, %r1, %r9
	setx	0x89a16aa1b7eea0fe, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d50b19c248, %r1, %r9
	setx	0xd9a9850f703914f4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e6e58c034a, %r1, %r9
	setx	0x510c28f19b922fb1, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fcf9743cda, %r1, %r9
	setx	0x00093a3197c0e5b4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800eea6228, %r1, %r9
	setx	0xa03d3204b83b22c6, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f904a20, %r1, %r9
	setx	0x5808a9b106f284c0, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ce3e2a1600, %r1, %r9
	setx	0x1e93877c18bac070, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000df5687cd88, %r1, %r9
	setx	0x4d865d5d79a5079e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e31f45ffc8, %r1, %r9
	setx	0xa65552ef709c2bfd, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f408d4b1c4, %r1, %r9
	setx	0x303f620c3b797426, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800eddb1d8, %r1, %r9
	setx	0x064a20e1c0531a86, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fb1be50, %r1, %r9
	setx	0x8a9b04dff4fd8476, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c1c3c9b0d0, %r1, %r9
	setx	0xde5b24f6226d9eb2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dbf93937c0, %r1, %r9
	setx	0x1e9c54d6e1f6bc17, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e08db9d180, %r1, %r9
	setx	0x57937d15864c5fe1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fc2c8a21d8, %r1, %r9
	setx	0xbf03d70a3768ec78, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e4a509ca5c, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d18808d19a, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c702fa3b7c, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f3cceea, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ecc2fbf, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f29afa619c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e9961118fc, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d708d9713a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cd3ec85ca6, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f0f6e4a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e972ebc, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fedac8f9c8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e39e907b50, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000de76b8b878, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e53e389300, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000db9c9a6818, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c4563ed1f0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f4deb38, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e656420, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e90efe1, %r1, %r9
	setx	0xe75e614fe30fd71d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fc627b3, %r1, %r9
	setx	0xcc053d72b2034435, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cda55ac40c, %r1, %r9
	setx	0x8719fd6f1723aa86, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dcc3322c3b, %r1, %r9
	setx	0xa6e16a7022b6a4e7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000eb54d0db02, %r1, %r9
	setx	0xedb68495e4bccc69, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fcfa94226d, %r1, %r9
	setx	0xadf3c3c7750279fb, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e5050be, %r1, %r9
	setx	0x3072d887c76bf86c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f7b9358, %r1, %r9
	setx	0x5f59eaeeb2d28cc4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c9d30efb82, %r1, %r9
	setx	0x8a1becb18a354874, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d1311079b2, %r1, %r9
	setx	0x6b04309ba33f219e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ecdf399b00, %r1, %r9
	setx	0xaa6fa7948e77a4eb, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fe8b910f82, %r1, %r9
	setx	0x63235b56a6d33561, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e3ea9c4, %r1, %r9
	setx	0x2b3a7376c18f0e50, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fcf5bf8, %r1, %r9
	setx	0xfdf0b140d8487871, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c117f38d38, %r1, %r9
	setx	0x8eec8891ce0b122a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d322e664f4, %r1, %r9
	setx	0x42aee87edd7e106f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ea152528a4, %r1, %r9
	setx	0x4e1e537e0428f3e4, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f4347ae4d4, %r1, %r9
	setx	0xce0c5d389b2654f9, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e2a3540, %r1, %r9
	setx	0xa16259a3c83fc78b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f29c8b8, %r1, %r9
	setx	0x41f92052576a3a3d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ce9c4c9cf0, %r1, %r9
	setx	0x299dc65ef9200bee, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d8a7362348, %r1, %r9
	setx	0x5e170d05b278afea, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e5f03e6980, %r1, %r9
	setx	0x65b24df991d6ebd1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8f4427b40, %r1, %r9
	setx	0xf9c3fa04cfeb9bfe, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fd972ac, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d708d9713a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cd3ec85ca6, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f0f6e4a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e368224, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e4502dff34, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000dcd5fab3cc, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c9fb6ff4f0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f2a1660, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e6bd3e4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fa1137138c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e14effa91c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800ebab4c6, %r1, %r9
	setx	0x0b7f83a46ddb46d4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f33afe7, %r1, %r9
	setx	0xd3593acde8ab3a48, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c7a6ba46ab, %r1, %r9
	setx	0x16bd4b2446a762e1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dbcb2c63b8, %r1, %r9
	setx	0xa71a3b20cc170da9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ea3078aa01, %r1, %r9
	setx	0xcfd7448af018efef, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fcfcb54759, %r1, %r9
	setx	0xbcda723ffaad207e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e15faf2, %r1, %r9
	setx	0xb9e3ef04adbcb77d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fc54bbe, %r1, %r9
	setx	0x39ace237cc9d5a47, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c25547fdee, %r1, %r9
	setx	0x9bfa931c89ab19b2, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d28c3aa174, %r1, %r9
	setx	0x371630fa46db0a15, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ea6d8c7436, %r1, %r9
	setx	0xb09bd2e10c2dfe44, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f67f524536, %r1, %r9
	setx	0xebf1778733aaeaeb, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e76a8c8, %r1, %r9
	setx	0x3f1503ad63e34c00, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fec10dc, %r1, %r9
	setx	0x4bede6acf832b7a8, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c8a2a5dcc0, %r1, %r9
	setx	0x18616d119bf59cb1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000da6c166448, %r1, %r9
	setx	0xdbc2917b975429a8, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e3387ee7a4, %r1, %r9
	setx	0x124f274b19173503, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f6dbbef3ec, %r1, %r9
	setx	0xbcb3df04940bbd30, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e39f2e8, %r1, %r9
	setx	0x4a42c3e86f0fc076, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fe4bc28, %r1, %r9
	setx	0x93445f052824419f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c0816153c0, %r1, %r9
	setx	0xf072a409fc0288c8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d3f38b4ab0, %r1, %r9
	setx	0xe0faf9880304771d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e4c14ddd20, %r1, %r9
	setx	0x660dec21aae2d7e5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fe61e99d08, %r1, %r9
	setx	0x30f79195634900b4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cd8e205cea, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f1a7033, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e9ebc36, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fcaba1c206, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000cb9a9f4726, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fb57a1e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e23a41a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fcef1de424, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ea6233857c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000de8061c81e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cd95e00f6a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f6b0f21108, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e5b211ff00, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000dbb985bcb0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ca1cc65514, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f051100, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e972ebc, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fedac8f9c8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c03b713068, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800edd8fac, %r1, %r9
	setx	0x4a17986e6ac6141f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f6b9d6b, %r1, %r9
	setx	0xd42d73a1ba62f0be, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cf561c783d, %r1, %r9
	setx	0x761f5addd3692331, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d334cba728, %r1, %r9
	setx	0xf17d8ab7bb696780, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e7bed84c60, %r1, %r9
	setx	0xfb96f93191966eb4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fe34fd23e3, %r1, %r9
	setx	0x398eaded7e9121ba, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e77c81e, %r1, %r9
	setx	0xecd6c084d0a1cf06, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fe38dd4, %r1, %r9
	setx	0x3220275fadf77fa6, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c840279b7a, %r1, %r9
	setx	0x4439d3f017fd0798, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dfcd04bb48, %r1, %r9
	setx	0xf06912e40c76fc42, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ea072fa872, %r1, %r9
	setx	0x45967c8093e7e637, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f4ec9c3bae, %r1, %r9
	setx	0xd9e7accaaae9ded7, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e96ad70, %r1, %r9
	setx	0x9a537ce9eea8922c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f5bcba0, %r1, %r9
	setx	0x0d53084ff91826d7, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ccbad24f78, %r1, %r9
	setx	0x88323d6b35d5ea6f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d4a8275c9c, %r1, %r9
	setx	0x9959e9bb7bd707af, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e5cb810db0, %r1, %r9
	setx	0x8c315175fb6c456d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f236690ec8, %r1, %r9
	setx	0x871951c8d3643f83, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ed345b0, %r1, %r9
	setx	0x5d5f1c0591030b4a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f81a230, %r1, %r9
	setx	0x8aeb28dfcfd013b8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cb795257d0, %r1, %r9
	setx	0xd89b2ad1f2f1f1fb, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d87d93c310, %r1, %r9
	setx	0x41dd9bc407424275, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e6260b7640, %r1, %r9
	setx	0x0947d33d988fc356, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f4065b6fb8, %r1, %r9
	setx	0xe3448d5328b6cdac, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e3459fccb7, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000dffe0dc8d3, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000cb45e5042c, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f11bb6b, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e0b2aea, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e972ebc, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fedac8f9c8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e39e907b50, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000de76b8b878, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c72280c738, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f2f24d4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f4deb38, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e656420, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f027b4faf0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e1a744e8f8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e22a98f, %r1, %r9
	setx	0xd44e1223aa895c00, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f8e0980, %r1, %r9
	setx	0x71a2c7cc6ffe014b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c31a0a7ee0, %r1, %r9
	setx	0xe6a8deadcac90781, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dd14c5d38b, %r1, %r9
	setx	0x7509be151e530fc3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e90cf1a672, %r1, %r9
	setx	0xe381424dbadebdca, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f81df82b35, %r1, %r9
	setx	0x145544fc037407d2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e881b7a, %r1, %r9
	setx	0x50b00979547b38ca, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fad3d90, %r1, %r9
	setx	0xf420d37b15036922, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c0723f2006, %r1, %r9
	setx	0xc387877d2de33c58, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d9ec350636, %r1, %r9
	setx	0xb094c00ee5699cc3, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e531bfba04, %r1, %r9
	setx	0x01066e9428b40a8e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f0988e3084, %r1, %r9
	setx	0xc385103ddbe021ae, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e0b6e90, %r1, %r9
	setx	0x223e2f677390cd25, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f7de340, %r1, %r9
	setx	0x34d6ada95d406bd4, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c2421f741c, %r1, %r9
	setx	0xd17d5050139397c6, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d8961965f4, %r1, %r9
	setx	0xdcac412559ed6f8b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ece341b4cc, %r1, %r9
	setx	0xe1a0118cf50d10e5, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f6ad8cc530, %r1, %r9
	setx	0x4e04893728db0e18, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e4dde28, %r1, %r9
	setx	0xa7ead3473f756252, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ff4ed40, %r1, %r9
	setx	0x2076d1be2da533f8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cea3747ee8, %r1, %r9
	setx	0x1dc7571b57f789e5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d6f59313e8, %r1, %r9
	setx	0x42209b99e4513375, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e5858ddf58, %r1, %r9
	setx	0x42dd46a05819d37f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f210cb2da0, %r1, %r9
	setx	0xa1181060a33a0bdc, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d690890c22, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000cd8e205cea, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f1a7033, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e9ebc36, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fcaba1c206, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e3fa3f9df8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e29c9ac, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fa94a45bb0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000eb19457068, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000dd7bdbdddc, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c8d543600c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f715058, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f4c5ef8fd0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000eea5a9ab10, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d5ecbfc470, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c44779f420, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e19ceac, %r1, %r9
	setx	0x2e0c747bcb54178b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f566665, %r1, %r9
	setx	0x89fe6d5824037c5d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cb2b083ad6, %r1, %r9
	setx	0x14961a4326b83d77, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d2b4680530, %r1, %r9
	setx	0xbfb3c59f9cc22041, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e2125deb1b, %r1, %r9
	setx	0xd7a1bc17acd32d15, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f229e5c1d8, %r1, %r9
	setx	0xa4579f0f2a4b06c4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e726cd0, %r1, %r9
	setx	0x0bd5db156009e7b8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f5a5f38, %r1, %r9
	setx	0x494af93eec3ee061, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c86c60ef84, %r1, %r9
	setx	0xfea4198014b96f86, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d55a27fe12, %r1, %r9
	setx	0xd4c5bfa0a81f2b97, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ea1c2ac2ca, %r1, %r9
	setx	0x6b22067750359c1f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f8fe980d54, %r1, %r9
	setx	0x16bdf7d0274b7734, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e32c19c, %r1, %r9
	setx	0x875c08b97f6a7b0e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f762f60, %r1, %r9
	setx	0x7d2272a0fe4c3e64, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cd12def920, %r1, %r9
	setx	0xa6df0678e7d77e78, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000dfd105f9d0, %r1, %r9
	setx	0x30c6b3605e0c207f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e0d4d6b5d0, %r1, %r9
	setx	0x31f14b69d33a1a23, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000feb405fc60, %r1, %r9
	setx	0x957def40224baf7c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800eab6870, %r1, %r9
	setx	0x3512b09f799a15c0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f5d2638, %r1, %r9
	setx	0xa641b3ba55283793, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cc65067910, %r1, %r9
	setx	0xdb42cd777737ebb5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d759f21548, %r1, %r9
	setx	0xcbf3d6215b869380, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000efd263daf8, %r1, %r9
	setx	0x55736701ff6f4399, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000faccb09468, %r1, %r9
	setx	0x3c53ed72e80eec30, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cb45e5042c, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f11bb6b, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e0b2aea, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f8dbdf57e1, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ef1138bdb7, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e18f67f5c2, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d63000ff32, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d51b3f4b00, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000cfb10d75d8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f066b98, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800ef14348, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fac28d60d4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c4563ed1f0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f4deb38, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e656420, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f027b4faf0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e1a744e8f8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d2ae18c040, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ed1d24c, %r1, %r9
	setx	0x740679216e22681e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f1164ec, %r1, %r9
	setx	0x467a18930bbb79b7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c8b4e2332a, %r1, %r9
	setx	0xb206e4607c398091, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d79e72ed3a, %r1, %r9
	setx	0x6838ada0c28cf97e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000eed579af97, %r1, %r9
	setx	0x2c0584051e56fa12, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f24b20bd24, %r1, %r9
	setx	0xb9dea4b5f3fcd382, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800edd7168, %r1, %r9
	setx	0x694c12b175dafa41, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f0bd3fa, %r1, %r9
	setx	0xc4e9a2c8aceb767d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c678f87446, %r1, %r9
	setx	0x7b2517bb92fb9c1b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d755a2b280, %r1, %r9
	setx	0x25e61e1aad75a4fd, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e729b2c630, %r1, %r9
	setx	0xe9ee26686806ebd3, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fcaf72e6fe, %r1, %r9
	setx	0x22ec8a2af4a53f53, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ebb2370, %r1, %r9
	setx	0x3ad387e2a0786e2a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f4a13b0, %r1, %r9
	setx	0xe13da2df824f2f5d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c672d1b274, %r1, %r9
	setx	0xc47674afe35e445e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d4c88e8350, %r1, %r9
	setx	0xa976ac25dd6ae304, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ef764d827c, %r1, %r9
	setx	0x253e6d674f2cb34c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f629449270, %r1, %r9
	setx	0x184c6919cb5c055c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e228860, %r1, %r9
	setx	0xde5f7b7648474428, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fa044b0, %r1, %r9
	setx	0xda1e84fd667f48c1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c87c9f7400, %r1, %r9
	setx	0x8a2d0513569e89ef, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d9202591a0, %r1, %r9
	setx	0xcb1f32e23014366d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e7141068f8, %r1, %r9
	setx	0xe8579fe17a26d987, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f2ccd6bea0, %r1, %r9
	setx	0x01113eaab1ac5870, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c6089fad2e, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f5543a2, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ebbe424, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f0f5c9d8c6, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e763f8808a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000dd3fd2f270, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c15c0e388a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fc7f0d2, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e08925a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ed5c21446c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d75438cae4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e656420, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f027b4faf0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e1a744e8f8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d2ae18c040, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000ce29f184d0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f6db268, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800eb4c4bc, %r1, %r9
	setx	0x1e617e64eaff8074, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f8b8ea0, %r1, %r9
	setx	0xebcbce4e9a07ffe9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c722abe095, %r1, %r9
	setx	0x5044f85a2b1b9055, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d383f766dc, %r1, %r9
	setx	0x86d2e36059a15869, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e9330b5056, %r1, %r9
	setx	0xd8d9d02057daf17e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000faf3333cff, %r1, %r9
	setx	0x0ce8076d72ee9f46, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e971df6, %r1, %r9
	setx	0x50ccfedd8eb87834, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f562f48, %r1, %r9
	setx	0x6ff36a55b2432ec3, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cff77d5472, %r1, %r9
	setx	0xac492e81a7210f5e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d40bde59be, %r1, %r9
	setx	0x41d45af52b372bc9, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e49714bdf0, %r1, %r9
	setx	0x525eb4b45c45c8e1, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f8b10f3abe, %r1, %r9
	setx	0xbd1fc24d62048362, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e3be888, %r1, %r9
	setx	0xd5c0a377caea3d79, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f200218, %r1, %r9
	setx	0xfb653cc147a3aab2, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c502b80130, %r1, %r9
	setx	0x26ffbb69b72486f5, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d098257338, %r1, %r9
	setx	0xdba096dfa2f59897, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e16a7226ac, %r1, %r9
	setx	0x63a3fbfd05854277, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f69cf57850, %r1, %r9
	setx	0xbddb5962ad12ef95, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ee3fb90, %r1, %r9
	setx	0x7bd430d3213bf0fa, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f02c440, %r1, %r9
	setx	0x0469b5d7e3480f77, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c6c238ee40, %r1, %r9
	setx	0xbcafaab40eaa639a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d943587050, %r1, %r9
	setx	0x4b7d20a8b9873915, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e03d7a8f48, %r1, %r9
	setx	0x30df4e3f3ddf9b86, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f4365413d8, %r1, %r9
	setx	0x1dfcbc1ef43f9c5b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e3ea9c4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f408d4b1c4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e31f45ffc8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000df5687cd88, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ce3e2a1600, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f904a20, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800ffa63b8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ea9ff38, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f6dd7a4130, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e342fa4a70, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000dff00a8428, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c419377008, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ebebc77, %r1, %r9
	setx	0x4bd5b8e29236b5ba, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f8aba78, %r1, %r9
	setx	0xaebfb3b51c2bd72a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c43accfce4, %r1, %r9
	setx	0x848f3be30a9ef820, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d030b35017, %r1, %r9
	setx	0xe5bd6c8d8a15e34f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e41fad25cc, %r1, %r9
	setx	0x92c12272442decbb, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f632408e28, %r1, %r9
	setx	0xa1dc85eed52ad426, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e9db8d0, %r1, %r9
	setx	0x8d5a4aa852e5b7d5, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f8e1ef8, %r1, %r9
	setx	0x453f1c1f0d042b2e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cabffcdaf6, %r1, %r9
	setx	0x2adf13be5ed86eb5, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000da89dae558, %r1, %r9
	setx	0x247105c01f824960, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e56f51f78e, %r1, %r9
	setx	0x1022cd3991ac1b3c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fe72ae6294, %r1, %r9
	setx	0x69f287adc4e35eb8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800eba4738, %r1, %r9
	setx	0xa4dff186bc09509d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fa50908, %r1, %r9
	setx	0x0fa26b58ea35ac52, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c7bfc1b42c, %r1, %r9
	setx	0xc00a4bb06be48028, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d87f586a44, %r1, %r9
	setx	0x6be67937e4c5122d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ed1403b51c, %r1, %r9
	setx	0x159e81dbc98fa7b3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f699896998, %r1, %r9
	setx	0xce019044838bcee8, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800eef61c0, %r1, %r9
	setx	0x263cafa6c6845bb9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f052800, %r1, %r9
	setx	0x9893973e8f7c58cb, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cf0923b3c8, %r1, %r9
	setx	0x749d55bef1cd4c26, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000da1d18b040, %r1, %r9
	setx	0x69d6805f4b0c664f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ee82fc3070, %r1, %r9
	setx	0x1b8829cbc05d5b51, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fa22a1fe08, %r1, %r9
	setx	0xccec126beb941050, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c3a1a3611a, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f3851a2, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e21bf1e, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f4ec9c3bae, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ea072fa872, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000dfcd04bb48, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c840279b7a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fe38dd4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e77c81e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f67f524536, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d0eb67ab2c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000cd227b9c50, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f6727c8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c770c85918, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fbfb170, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e8d0990, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f225206fb0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e700c82400, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e3cc382, %r1, %r9
	setx	0x77f47579e19fa7bd, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f129c88, %r1, %r9
	setx	0x9c6ebe4ff888531e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ca9ea70970, %r1, %r9
	setx	0x5dac244625d7d7b8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d49e2d9610, %r1, %r9
	setx	0x3b2e746b46dfc3ff, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ec017a0881, %r1, %r9
	setx	0x617f2a03487c8ab7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000feb1edb22a, %r1, %r9
	setx	0xb7f919fa8e2ca71f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e75b808, %r1, %r9
	setx	0x14cbaf273221a8f5, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f853af8, %r1, %r9
	setx	0x35d43728c439e04c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c8d8ce5ebe, %r1, %r9
	setx	0x354b511a1dc0ba0e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d141fbfa7a, %r1, %r9
	setx	0xad5bbe20b3a39db5, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e3bc14713e, %r1, %r9
	setx	0x632842329738b425, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fcea8ac3ac, %r1, %r9
	setx	0x05e022222639fb2b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ed97fe4, %r1, %r9
	setx	0x93098ff16c153b4c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fd838d4, %r1, %r9
	setx	0x96de3ec07bd79001, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c0e3ae0c48, %r1, %r9
	setx	0xe3caf9e2b4f645a0, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d16c261290, %r1, %r9
	setx	0xca9f0fd82bc6d128, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ed937c4c78, %r1, %r9
	setx	0xe18ccfb400557385, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f645edf964, %r1, %r9
	setx	0x2ff599a0ca790ad7, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e91ada0, %r1, %r9
	setx	0xfeff0a9a06c10a96, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fa5b1b8, %r1, %r9
	setx	0x8fd365bc0adba857, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c54d7cc6f0, %r1, %r9
	setx	0x6f3edf431bb178e7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d0d52c6490, %r1, %r9
	setx	0x9ef61a706ac38296, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e0c93d2a50, %r1, %r9
	setx	0x6355ee5824500f93, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f05a7dc420, %r1, %r9
	setx	0xb3dcef234e633d16, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f8c32cf, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000cb9a9f4726, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fb57a1e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e23a41a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fcef1de424, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ea6233857c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000de8061c81e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cd95e00f6a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e70e768, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f6b960d798, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000efee8124ac, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e36e010, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f0b8036b30, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e17fd73160, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e824198, %r1, %r9
	setx	0xcde641a515532a50, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fd68162, %r1, %r9
	setx	0x10f8cc26cae77e14, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c268f5fde9, %r1, %r9
	setx	0x28427c5857f51012, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000df17a08be6, %r1, %r9
	setx	0xd4537e0fefb75b64, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e70f0c2986, %r1, %r9
	setx	0xa0a2e3e069c19b31, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fab7f2a17c, %r1, %r9
	setx	0x94f19c00f516942a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e8c0e1c, %r1, %r9
	setx	0xe97d2505a92aaf9f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f4a4974, %r1, %r9
	setx	0xca706f52b48080e4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c71e8cf3f2, %r1, %r9
	setx	0x39ee4ec6cbbcb86d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dc658730a2, %r1, %r9
	setx	0x057250f9783c2148, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e313fb61b0, %r1, %r9
	setx	0xad9ec3f73f785ebb, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f67518d76c, %r1, %r9
	setx	0xe398100ebc78a05a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ef2dfa8, %r1, %r9
	setx	0xdcb88ad972258565, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f21249c, %r1, %r9
	setx	0x5f3be9436686ca63, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c796b5305c, %r1, %r9
	setx	0x9ed270a11bad22a1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d497d4607c, %r1, %r9
	setx	0x1c1cc5488524f5b7, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e493d56f44, %r1, %r9
	setx	0xbf7634c3e8f00f78, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fed9c2fc0c, %r1, %r9
	setx	0x91441d139d1b2d64, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e9ca0c8, %r1, %r9
	setx	0x3e774932a81cf012, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fccf8d0, %r1, %r9
	setx	0x26b6a936daaa6226, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c2ebb9fb08, %r1, %r9
	setx	0x77733e4ce63108ce, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000db9b61c548, %r1, %r9
	setx	0xcb7240c6c9de18d4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e40e12f418, %r1, %r9
	setx	0xb2e02d5e5ad65591, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fe5ba30850, %r1, %r9
	setx	0x3ce965bfda0c3acc, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8484bcb25, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e0b6e3f78c, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d856127072, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c1b61fae2c, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f60d7e9, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e777ba2, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f46225ae3e, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fb57a1e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e6a7a04, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f6a728f528, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e3f5e62714, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000dbcd68c458, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000cb50a8b6a4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800ed91c3d, %r1, %r9
	setx	0x33606b9060569139, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f46a0d0, %r1, %r9
	setx	0xdfd7f00a3ed51900, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c0f28be6b8, %r1, %r9
	setx	0x2ab1a32a8d92e384, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d080cc5873, %r1, %r9
	setx	0x9f10d166653c10d8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ec54ebcfe6, %r1, %r9
	setx	0xb7269003d051b443, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f088506837, %r1, %r9
	setx	0x627db2db9720ba0b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e71444a, %r1, %r9
	setx	0xf59e81264efd12e3, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f18426a, %r1, %r9
	setx	0x1a0a783bf57e0538, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cf2fda67fe, %r1, %r9
	setx	0x36fcfeb1fb59c9aa, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d7d97a400e, %r1, %r9
	setx	0x6e80f5b3486b6277, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e04cd90e1a, %r1, %r9
	setx	0xc50a4c5e85db9bcb, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f86c1b0c78, %r1, %r9
	setx	0xe5629fbd8e36aff1, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e93a3e8, %r1, %r9
	setx	0x07076fc4bc1b374c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f3ff5c4, %r1, %r9
	setx	0x3594b3cf8a60aaae, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cf81e4aacc, %r1, %r9
	setx	0x47187d8bf63968e6, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000dc0611fd90, %r1, %r9
	setx	0x9d4b1e969644dc6f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000eecd317aac, %r1, %r9
	setx	0x20256559935f553a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f853547b24, %r1, %r9
	setx	0xda7b905a51219c25, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e1c26e0, %r1, %r9
	setx	0xf4ee332449872379, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f915aa8, %r1, %r9
	setx	0xb95870fc955ed2f7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cfcca2de00, %r1, %r9
	setx	0x74a732b9df194227, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dc188501f0, %r1, %r9
	setx	0x7f0ba6ea2e704d43, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e627b88cb8, %r1, %r9
	setx	0xfcceac5cf42e403d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f61e5e8d68, %r1, %r9
	setx	0x0c31b713149d2f9c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f80a7a5fd2, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e2ec5d5f10, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000dfaf7403f4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ca105acf30, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ff55640, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800ffd12b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800eb4d870, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000fe62f42390, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e90e9fd078, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d1aab4dd70, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c8f25cb8c8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f705ec8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ece7012, %r1, %r9
	setx	0xbd634c0f317c51ea, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fd5099f, %r1, %r9
	setx	0x68526fb3760bfb1b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c42968b5a9, %r1, %r9
	setx	0xe281b5d5c2382ce1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d8590fd1e6, %r1, %r9
	setx	0xefbb09d556711b70, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e98f63de47, %r1, %r9
	setx	0x08fb019b9c3e44b2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f8eb57edbf, %r1, %r9
	setx	0xbc81d9d2de01f76c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ec98cfc, %r1, %r9
	setx	0xdf8ae2ef1e3e9b9a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f7b8888, %r1, %r9
	setx	0x3d9304fc9facbdca, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ca7c75b7a0, %r1, %r9
	setx	0x75c35941b6809310, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ddf57e6326, %r1, %r9
	setx	0xf31bf173208c754f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e188123c70, %r1, %r9
	setx	0xad30f56c44d8fd2d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f093205436, %r1, %r9
	setx	0x0c5d3bcb0d787ec0, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ed64510, %r1, %r9
	setx	0x4705213b76e58a76, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fc61f30, %r1, %r9
	setx	0x7a8c5e8a347e39b3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cfa3750b48, %r1, %r9
	setx	0x8f9f702832067cdb, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000dbbf54fb98, %r1, %r9
	setx	0xe6bd4b12c4740e86, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e1c75a1d78, %r1, %r9
	setx	0x673aef995476f7f7, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f8074ef1d8, %r1, %r9
	setx	0x98cef10cf2c75c22, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e69a370, %r1, %r9
	setx	0x02a3c4027bebe317, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f47cf38, %r1, %r9
	setx	0x16934898f3514048, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c72fcdbf50, %r1, %r9
	setx	0x4baf41656894c807, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d012779fc8, %r1, %r9
	setx	0x5140d291fc681bbd, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ee4888a8f0, %r1, %r9
	setx	0x18c716be76b48838, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fc3c29b668, %r1, %r9
	setx	0x7af20ad76158053c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fe34fd23e3, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e7bed84c60, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d334cba728, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000cf561c783d, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f6b9d6b, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800edd8fac, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e763f8808a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000dd3fd2f270, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c15c0e388a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fc7f0d2, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e08925a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fa7c3f2f46, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cb4d4aab18, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ffa63b8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ea9ff38, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f6dd7a4130, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e342fa4a70, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000dff00a8428, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c419377008, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e1f2f0f, %r1, %r9
	setx	0x8a8eebda60a564fc, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f6ab848, %r1, %r9
	setx	0xcde90e38b317267d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ccb1501f51, %r1, %r9
	setx	0xcfd9cea4833d2d78, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d001eb9daa, %r1, %r9
	setx	0x06db6d57d84f8ca9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ee9c657e0c, %r1, %r9
	setx	0x6eddd26aaeeb7c2c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f47398d190, %r1, %r9
	setx	0x023197da50097ebd, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e2c9f92, %r1, %r9
	setx	0x01634ba465de04e2, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f6b908c, %r1, %r9
	setx	0x5206e2eb28411346, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cc535b7c86, %r1, %r9
	setx	0x69a15c7dbaa92e8b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000da93e5ead2, %r1, %r9
	setx	0x500f11e427fbc5ae, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e7ea5736d8, %r1, %r9
	setx	0x20e107165f9e0206, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f0b2f08d1c, %r1, %r9
	setx	0x7d8452857149bb62, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ed67c74, %r1, %r9
	setx	0xa8fa4055d56616f5, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fa161e8, %r1, %r9
	setx	0x25635a0640e050bb, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c5783dbd98, %r1, %r9
	setx	0xf9e50ae5f7f3e0b9, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ddc7e26eac, %r1, %r9
	setx	0xb5a34fb2d4c321f0, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ea83660954, %r1, %r9
	setx	0xbe4c1b4519acc467, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f45ed93174, %r1, %r9
	setx	0x64001f8a812f1d73, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ecd8bc8, %r1, %r9
	setx	0x8440de9cc5c7d92c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f3095a8, %r1, %r9
	setx	0x871a7c496e677cf3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c704132090, %r1, %r9
	setx	0x3ab9f57c1c71da71, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d176131030, %r1, %r9
	setx	0xfe11e2dd70f11b67, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e9fe128d78, %r1, %r9
	setx	0x9ed0f285e92f7448, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f602862d00, %r1, %r9
	setx	0x941e996f1f4c2d3c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f824fa884a, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e077c8b150, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d76736d2f5, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c250420a93, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fb19e3a, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e69ac92, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fcc01ac, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ee08696, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fe5482e1fe, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e3f83a9696, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d23ff84b3c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c567a106fc, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e6a7a04, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f6a728f528, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e3f5e62714, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000dbcd68c458, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000cb50a8b6a4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f6b1344, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e2271e8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800fe155b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ecba232, %r1, %r9
	setx	0x3c5503cd22167322, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f86fb3a, %r1, %r9
	setx	0xa40f0dda2da99b81, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cacc95f159, %r1, %r9
	setx	0x88e15b9169197bfe, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d381502efa, %r1, %r9
	setx	0xe4fda4a787ca1b89, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e0eb2c2830, %r1, %r9
	setx	0xd845932384804432, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fc35802733, %r1, %r9
	setx	0x2af3151f05009d10, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ec981b2, %r1, %r9
	setx	0x434e4469eb3ea6cb, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ff520b2, %r1, %r9
	setx	0xb5a6e46dd524fb55, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c28b5c2534, %r1, %r9
	setx	0xadeb525dca169e72, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d3bf5a5a12, %r1, %r9
	setx	0x0066b09fe39a6186, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ebeddb205e, %r1, %r9
	setx	0x3a937142b4e118c5, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f67b3d6af6, %r1, %r9
	setx	0xc6a5fd0ae908ce77, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ecee090, %r1, %r9
	setx	0xeeac81c4cc6a99bb, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fc06bc4, %r1, %r9
	setx	0x7d8e6c43a662a720, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ccbf10847c, %r1, %r9
	setx	0x05311a9ee96fd9b6, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d65e5dcc24, %r1, %r9
	setx	0x248f25700290b079, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e758b72ed8, %r1, %r9
	setx	0xffe114e7009d8164, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f01bd35d5c, %r1, %r9
	setx	0x6307f4445478a012, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e92f040, %r1, %r9
	setx	0xb21b592c88d52d0f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f2e2be0, %r1, %r9
	setx	0x5c28f1eb988ec384, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c84fc5edc8, %r1, %r9
	setx	0x348065ee99cc9315, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d56a5da428, %r1, %r9
	setx	0xe019324344b9885b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000eee5babe88, %r1, %r9
	setx	0x2d71674d39a3f102, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f67affe9d0, %r1, %r9
	setx	0xb668feb23d0533b4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f45c8b48c6, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e73bd1bc9c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000da98662954, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c7ab2cc744, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f41a5b4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800efb760e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f68f0d390c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e5b1748, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fa27b9f17c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ee0a70fe70, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d9030fe140, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c83ab303c8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800fcf1560, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e412da8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ed7051b, %r1, %r9
	setx	0xcf20e6980c2d8ee7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f6614c6, %r1, %r9
	setx	0x412080015fa1f8a8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ca83b13b9f, %r1, %r9
	setx	0xbed8e4eb6e1a2361, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d84ec701e3, %r1, %r9
	setx	0x1c667a705a8b4840, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ef6d3539ea, %r1, %r9
	setx	0x2d518535bff82c24, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fcd6e33364, %r1, %r9
	setx	0x53acf4355655590d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ea83dfe, %r1, %r9
	setx	0x4aa43b7586bfec60, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fb3f2cc, %r1, %r9
	setx	0x750e8596d09e168e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c70229ee6c, %r1, %r9
	setx	0x20c1820c94a04434, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d18140dff0, %r1, %r9
	setx	0x1fc53ddac01d4ef8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e3231169da, %r1, %r9
	setx	0x373ffdab474dc9e8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f4f4eb4974, %r1, %r9
	setx	0xe6b3406ab5eb7478, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e242c84, %r1, %r9
	setx	0x2fe829161c4dd4c4, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fec39f4, %r1, %r9
	setx	0x030c95a41d0d8b5d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c2d072096c, %r1, %r9
	setx	0x247726c6dc5ac574, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d29634bd2c, %r1, %r9
	setx	0xc31b345ad8512681, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000eb071ad660, %r1, %r9
	setx	0x52ad62c993847a40, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f4bb172c60, %r1, %r9
	setx	0xb97fd8580a3b68f8, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800efb8a28, %r1, %r9
	setx	0xe353d2766a6c021b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f5bf868, %r1, %r9
	setx	0x4110f22c8204bbb6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cad2ce4420, %r1, %r9
	setx	0xb1be1ce8afb90980, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d20ffedce0, %r1, %r9
	setx	0x65a36f8123195e27, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e799aa27d8, %r1, %r9
	setx	0xa9bc97fa881526bf, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8f82d27c8, %r1, %r9
	setx	0xb3369cb9509b0aba, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f0d77f2e47, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e5f931a6c7, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d2a880241c, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c87e0c4284, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fea0ed0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e8a040d, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800eff6a80, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f42aeb3f98, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e490012f38, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e65aab0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f057545760, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e56b3742f0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e58580a, %r1, %r9
	setx	0x0787410a8947e84d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f7c3b51, %r1, %r9
	setx	0x4ec1fb5891d28e7f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c9624562de, %r1, %r9
	setx	0x054acf3c0a631a00, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d660294bd1, %r1, %r9
	setx	0x511caf750d98b991, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e37ec8755b, %r1, %r9
	setx	0x44b4e0d64ca04424, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f8b25b5463, %r1, %r9
	setx	0x3aecc7003b6a4101, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e32abbe, %r1, %r9
	setx	0x8abfb465296ca29e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f027e5e, %r1, %r9
	setx	0xb0e50290ab176069, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c6263ace84, %r1, %r9
	setx	0x4a9e0ecce133f1c9, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000de1abb01e4, %r1, %r9
	setx	0x926b2fae0d25e8ea, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e4c2142712, %r1, %r9
	setx	0x226257b7c42b4a51, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fc52d3e0f2, %r1, %r9
	setx	0x95934a8d1a2d35d8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e9ed014, %r1, %r9
	setx	0xbe78d519ee59ad5e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f1d6340, %r1, %r9
	setx	0x9b4e08498708ca14, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c26c3122fc, %r1, %r9
	setx	0xd6f0eef2ece3732b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d570869bc8, %r1, %r9
	setx	0x5e7c9b5cbf3c00c7, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e2309acee0, %r1, %r9
	setx	0x6210ed5ce6263813, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000faf8611fa4, %r1, %r9
	setx	0x45837025a55c7dd5, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e058270, %r1, %r9
	setx	0x7156dcec4e4dea7a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ff338a8, %r1, %r9
	setx	0xbf5b24025d0865a3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cba9b215e8, %r1, %r9
	setx	0x92632b2e6d22dcaf, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d54d9b3b20, %r1, %r9
	setx	0xa939610f5dd81e8e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e93a139fe0, %r1, %r9
	setx	0xc2d4c1d02b519630, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fa1b31b010, %r1, %r9
	setx	0x0aaf949b5a26128a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e6e95140f6, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d7e54cebf5, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d51d65bf8e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000edbcafbe64, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000dfcc458650, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000cb588c2cec, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f022084, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c81fefed88, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f3a5730, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e80c848, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e20e9c2, %r1, %r9
	setx	0xbc22e4a8ed6048da, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ffa113c, %r1, %r9
	setx	0xce0e8e1ed325d4d3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ceb6aac053, %r1, %r9
	setx	0xe255514d1d5bbeda, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dbf91e2f84, %r1, %r9
	setx	0x351a0932072af174, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e01fecbe97, %r1, %r9
	setx	0x1b1ce5f2cde23813, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f0d73362e1, %r1, %r9
	setx	0xeed0ea81139579a4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800eab9f26, %r1, %r9
	setx	0xe1a40dacbece709c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800facc8d4, %r1, %r9
	setx	0x27038e9eedf6c033, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ca44c6c896, %r1, %r9
	setx	0x88f262b37543b265, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d50799abc6, %r1, %r9
	setx	0x535379d92a55f07c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000efa44c095e, %r1, %r9
	setx	0x921d95110f0b137c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f6562f9b7c, %r1, %r9
	setx	0xb0cdb25a702b5645, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e62fce8, %r1, %r9
	setx	0xcfba3197119b8c61, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ffe6eec, %r1, %r9
	setx	0xca62b2af7bb2e1c9, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ca4b6390e0, %r1, %r9
	setx	0x011144c9701fd5a7, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000db57458cc0, %r1, %r9
	setx	0x6c7961b347b7026c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e31f35ad3c, %r1, %r9
	setx	0x054a82b137e04d59, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fe5fe58628, %r1, %r9
	setx	0xdf5cbf3ad77048fd, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e6f9638, %r1, %r9
	setx	0xc940288fb0171db0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fa29030, %r1, %r9
	setx	0xc5aa4abd4d2ad677, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cd3891d7b0, %r1, %r9
	setx	0x364220619b07e591, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d4702f7f40, %r1, %r9
	setx	0x7e116fefa4a6d37f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ea8f347fe0, %r1, %r9
	setx	0x7c620e5cd12e29fb, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f62e8ef1e0, %r1, %r9
	setx	0x0c503aed78f52176, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ffa113c, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e20e9c2, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f8b25b5463, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e37ec8755b, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d660294bd1, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c9624562de, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f0184e0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e36e010, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f0b8036b30, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e17fd73160, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000dbdd3cc878, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c81fefed88, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f3a5730, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e6f438b, %r1, %r9
	setx	0xd8ad759cca557c27, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f01f314, %r1, %r9
	setx	0x1d6a2961b79faecb, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c5770a927b, %r1, %r9
	setx	0xbc8f46b3c9b71299, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d51a04be1c, %r1, %r9
	setx	0xa490ec6719ed7e8a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e567b458ad, %r1, %r9
	setx	0x97c8deeedfb5e553, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fa54067f5d, %r1, %r9
	setx	0x956eaa438dd7aefe, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e87102c, %r1, %r9
	setx	0x62326a175b858368, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fa21ad0, %r1, %r9
	setx	0x6ad9a558fce39b4d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cd3b902482, %r1, %r9
	setx	0x38f668430f40de96, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d2b010057c, %r1, %r9
	setx	0x94b5f88f1e8300dd, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ef73c0e620, %r1, %r9
	setx	0x04ef1d1a5857f8e9, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f28172307c, %r1, %r9
	setx	0x204143ef97d2b5ac, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ed7246c, %r1, %r9
	setx	0x5120d3f0c228a4c7, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fad7ae4, %r1, %r9
	setx	0xd399950a323fe566, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c74cd59500, %r1, %r9
	setx	0x0cdf53e880edd7a4, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d6f7c56bf8, %r1, %r9
	setx	0x6a385adca4f93f67, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e7ab5dbc54, %r1, %r9
	setx	0x9db1bf2d58c3f59b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f408a1cfd8, %r1, %r9
	setx	0xace23ff10ae66969, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e541200, %r1, %r9
	setx	0x90f04df83eff0ad3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fba8948, %r1, %r9
	setx	0x7c34b0e6fd41d530, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c19d04c978, %r1, %r9
	setx	0xc259671961028eee, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000da2fecc3a0, %r1, %r9
	setx	0x1d0e42789990be2f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ee3ca39c50, %r1, %r9
	setx	0x2026eed2d4f6034f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f092def760, %r1, %r9
	setx	0xe00b13b40500a58c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e99d348, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fcb704e654, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e96fd76a6f, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ddb4ad8e9b, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c8516fa799, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f231c53, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c0341f3e62, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c2421f741c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f7de340, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e0b6e90, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e2f9759, %r1, %r9
	setx	0xa86c4c4328853a96, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f3ead15, %r1, %r9
	setx	0x5ac422795cba1417, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c3780d17a8, %r1, %r9
	setx	0x2de7e99d0b559e8e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d510ba32d4, %r1, %r9
	setx	0x48e26fc3ae3b1bff, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e9765d727b, %r1, %r9
	setx	0x537ec56f5e2bf730, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f65cdaf7db, %r1, %r9
	setx	0x64c68a80ecddb956, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e0eb840, %r1, %r9
	setx	0xfb948ac112de5702, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fc3c1ce, %r1, %r9
	setx	0xb31002cef6d70e1f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c228020df6, %r1, %r9
	setx	0xf2d797bb1ae26c40, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000db8f3c5272, %r1, %r9
	setx	0x48d957a0fe8405da, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e4e24a5bbc, %r1, %r9
	setx	0x628f0442ede4a293, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fa10dcd6f8, %r1, %r9
	setx	0xa5d99fc0592c4612, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ee3c8b8, %r1, %r9
	setx	0xbfc7fec9149c3e7c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fa02dc8, %r1, %r9
	setx	0xf007378ae277fbf6, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c66ee7a774, %r1, %r9
	setx	0xd2f102af2b6794ab, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000daff181b6c, %r1, %r9
	setx	0x1b8f772a99335f15, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e8454d8adc, %r1, %r9
	setx	0x949374952a4e7fc9, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fa2377feb0, %r1, %r9
	setx	0x933d74e8459a76c3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e86f8e8, %r1, %r9
	setx	0x4291ab81f3863ce3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f455840, %r1, %r9
	setx	0x4524abf859ba001a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c0500c1e40, %r1, %r9
	setx	0x9afa748c5b333fb3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d787a65250, %r1, %r9
	setx	0xe3fb7b1916d01245, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000eb38e5d728, %r1, %r9
	setx	0x3f23c79cba4fec0f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fed63af7d0, %r1, %r9
	setx	0x9098427945b3e912, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d18808d19a, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c702fa3b7c, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f3cceea, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c900119336, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800eef61c0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f4365413d8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e03d7a8f48, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d943587050, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ef062f3, %r1, %r9
	setx	0x38dd86ef4c97fa59, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f71b1bb, %r1, %r9
	setx	0xae829da16e8ffcd3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cc6270637e, %r1, %r9
	setx	0x22bc7b892538a045, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dd949fc053, %r1, %r9
	setx	0xb27853bad8d51776, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ee1c1a7ab3, %r1, %r9
	setx	0xe1706983994ee1fd, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fae7567b07, %r1, %r9
	setx	0xb970b3d68ad58dad, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800eacb8b6, %r1, %r9
	setx	0xe9873a9b7db755e7, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f2a735e, %r1, %r9
	setx	0x303dbea6ec227864, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c7c6c4b694, %r1, %r9
	setx	0xd0c2972d12711db4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000deed308cc2, %r1, %r9
	setx	0xe7fc6e1cb8a8f61b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000eb97ef5ef6, %r1, %r9
	setx	0xad627ef7cc7879f5, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f01b2e4cc2, %r1, %r9
	setx	0x6902c8b43d072d9c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e4474fc, %r1, %r9
	setx	0xe4753787713da3d4, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f0e60a8, %r1, %r9
	setx	0xb1c3eacfe1434a96, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c64dfd3d34, %r1, %r9
	setx	0x9984b1f62416712a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d82c7c0988, %r1, %r9
	setx	0x937327f2ef801525, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e55c2d8a20, %r1, %r9
	setx	0xf0f95b956a7c07e0, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f4300f857c, %r1, %r9
	setx	0x74fc3d8610f7a32e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e276378, %r1, %r9
	setx	0x06fd8c62cd05b45a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f8a3c10, %r1, %r9
	setx	0xe6b1d0355c159895, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c4832bb1e0, %r1, %r9
	setx	0x7a7088d903a9de59, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000df7aee72f8, %r1, %r9
	setx	0x55245258cb69d7fc, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e921a430c8, %r1, %r9
	setx	0x3104a0e7c15705b7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f03754b9f8, %r1, %r9
	setx	0x2159fb23f992c067, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d69a11cfe3, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c771b2e1ec, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d055c3f96c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f302360, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800eff6a80, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f42aeb3f98, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e490012f38, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ddc2220074, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c527ca79c4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800faef0e8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e1a744e8f8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ef3f587, %r1, %r9
	setx	0x2ed6af3d28c2a2fb, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f1c6867, %r1, %r9
	setx	0xb6a06d8928af6641, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c22c3fb665, %r1, %r9
	setx	0x0593106888770829, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dba0c751c5, %r1, %r9
	setx	0xb659f486a9d3f4fa, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e8ff3cab78, %r1, %r9
	setx	0x3d5a2bbbb226702a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f2141928fd, %r1, %r9
	setx	0xee5656f6cb72ad15, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ea0bd14, %r1, %r9
	setx	0x0bb084ec6ac28211, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fdd1538, %r1, %r9
	setx	0x389ad3ba6dd95325, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c31401f256, %r1, %r9
	setx	0x8406bbab83767fae, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d48160741a, %r1, %r9
	setx	0x8daee5984b5a3a7d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e6ac16bdbe, %r1, %r9
	setx	0x260990476d631ef7, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f8af65f6aa, %r1, %r9
	setx	0x3627fef45b22b0fc, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e004fc8, %r1, %r9
	setx	0x101fc6e3a571c321, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f9a0794, %r1, %r9
	setx	0x405902b8d98a3775, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c8ac4206e0, %r1, %r9
	setx	0x9105d7db7bdd5a86, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d756d899d0, %r1, %r9
	setx	0x0d49faf39f2a780e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e8ce6f9e24, %r1, %r9
	setx	0x9a64f25921db34b0, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f216535984, %r1, %r9
	setx	0xbd05499e94bffbca, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ef309b8, %r1, %r9
	setx	0x773b5c3d84b9f281, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f09cec0, %r1, %r9
	setx	0xf26605859edf17f3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c09ce68850, %r1, %r9
	setx	0x3949c4e951fdcbde, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000df4d5b37a0, %r1, %r9
	setx	0xdd51157ba2d4c7b0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e37c611830, %r1, %r9
	setx	0x733c7cd63984d957, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f86c71aab0, %r1, %r9
	setx	0x61ea564f1ff6bcd2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dffe0dc8d3, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000cb45e5042c, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c0723f2006, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fad3d90, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e881b7a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f4ec9c3bae, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ea072fa872, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cc6944d674, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800ff55fa0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f057545760, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e9ed8a6, %r1, %r9
	setx	0xcd46fbcbd5328639, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fce5ce4, %r1, %r9
	setx	0x4939492610ab3d6c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c58d4acd72, %r1, %r9
	setx	0x4499bbb7350e8fbf, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000df8841c50d, %r1, %r9
	setx	0xc8382c8e8255edce, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e8d7ef9f3a, %r1, %r9
	setx	0x23afe47e78cec22f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fa241067b4, %r1, %r9
	setx	0x87cc5b21ce4db121, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e69bd52, %r1, %r9
	setx	0x6d8d103544f75c2c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f1987be, %r1, %r9
	setx	0xd9c7bcbfe3700c96, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c9d18ac4f8, %r1, %r9
	setx	0x585b9eda507846ff, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d8b7ecc61c, %r1, %r9
	setx	0x35e429812eda4e6c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e74b02c47a, %r1, %r9
	setx	0x95533aa25d05aa5e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f42901475a, %r1, %r9
	setx	0xd72ca5c0664ebed1, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e411014, %r1, %r9
	setx	0x445422c0bb681822, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f00ba28, %r1, %r9
	setx	0x1f87184d60a677e0, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c8b51cedf8, %r1, %r9
	setx	0x646fc9d2bebcbd9b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000df38170f9c, %r1, %r9
	setx	0x06521bd0df0f9690, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e9fb125588, %r1, %r9
	setx	0xdeeee9849edb52f6, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f2ecbae2b0, %r1, %r9
	setx	0xefab1c508de2d29d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e27b870, %r1, %r9
	setx	0x6868ce2c90cada2c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f0b13a0, %r1, %r9
	setx	0x8a5b91588a5cdef3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cf5e4c2b20, %r1, %r9
	setx	0x46f283995cf4f81d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d0e79c88b8, %r1, %r9
	setx	0x989e104c578aad15, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000eb66c7a580, %r1, %r9
	setx	0xc382059f25897fc9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8803aa6c0, %r1, %r9
	setx	0x89a9ce111a5bf819, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f566665, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e19ceac, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c15c0e388a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fc7f0d2, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e08925a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fa7c3f2f46, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e411014, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f216535984, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e8ce6f9e24, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d756d899d0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c8ac4206e0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f9a0794, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e004fc8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e65aab0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f057545760, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e56b3742f0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000deb798fc28, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c740a865c0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fd5af80, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e1b0728, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e0c7169, %r1, %r9
	setx	0x76a6e4c11083fead, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fa9f3a5, %r1, %r9
	setx	0xe61f3b0a7c373218, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c70d1dae47, %r1, %r9
	setx	0x3ddecc3e0b4cab53, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d0fe4ed743, %r1, %r9
	setx	0x5fcf5c6ce4f0e56e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ee2079bb76, %r1, %r9
	setx	0xc51bbde5913614b6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fcf34cb2f1, %r1, %r9
	setx	0x27a8bbd22b2d8fdc, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e2910d0, %r1, %r9
	setx	0x9129659944c01d55, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f352db8, %r1, %r9
	setx	0x3c489443e3099b81, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c77b2411b2, %r1, %r9
	setx	0x8a6846804b5f0468, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d9ce7de244, %r1, %r9
	setx	0x449f0ce31534c4aa, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e488337eba, %r1, %r9
	setx	0xa933e2f85f4ca30f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fef4acc3c0, %r1, %r9
	setx	0xcdb9dd7e67fba473, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e0ad0d8, %r1, %r9
	setx	0x62fe39ef5e9e3a6d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f8a344c, %r1, %r9
	setx	0x61637588fa512d15, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cbd960df9c, %r1, %r9
	setx	0xdc58e668dfdf2fc3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000df286efcd0, %r1, %r9
	setx	0x9d75f4b749b144b5, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e24fc5f50c, %r1, %r9
	setx	0x219a3e88da0bf9e9, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f2759ab198, %r1, %r9
	setx	0x56b0a026c4c0087d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e813668, %r1, %r9
	setx	0xe21c3c179b928d3d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f934048, %r1, %r9
	setx	0x4b2189c67bcd8c0c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c9d29bd7f0, %r1, %r9
	setx	0x95ee38d5f1bd614b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d148fe2a38, %r1, %r9
	setx	0x5ccdcfb6f8dd161b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e7ffe85ba8, %r1, %r9
	setx	0xa848580cba11cfbf, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f081e899e8, %r1, %r9
	setx	0x839e151e4ae19382, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c268f5fde9, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fd68162, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f2352de, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e5b488a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f003a99e1e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f236690ec8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e5cb810db0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d4a8275c9c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ccbad24f78, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800eef2c60, %r1, %r9
	setx	0xc7b4549520716dac, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fd3021b, %r1, %r9
	setx	0x7c3c28faef5eafba, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c715a5a7c8, %r1, %r9
	setx	0x7d3542ef7757fa6d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d79a72ebbf, %r1, %r9
	setx	0xc72c1ad086bdf29f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ecab181169, %r1, %r9
	setx	0x896d6649cd62d75a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f8597ff5a8, %r1, %r9
	setx	0x7c8dbf0b70d47186, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e734b52, %r1, %r9
	setx	0xd939dfad5f49449b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f855f38, %r1, %r9
	setx	0xaa1ac84252ec03af, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c171c02a28, %r1, %r9
	setx	0x2eed01b3746a627f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000de22291d92, %r1, %r9
	setx	0x0760dd9958dc2706, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000eb4129a0c6, %r1, %r9
	setx	0x8533044cd41fac1f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fe29dbff22, %r1, %r9
	setx	0x382fab5d7e058c9e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ef21444, %r1, %r9
	setx	0xeee68eee6dde3ef2, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f02cfe4, %r1, %r9
	setx	0xfe7c738974416f59, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c8a8acd120, %r1, %r9
	setx	0xa14d54b4b1ba8502, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000df9c2b31ac, %r1, %r9
	setx	0x07fe8331764fd88a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e37c689a38, %r1, %r9
	setx	0x125224eb9b83d348, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f8dcf41c78, %r1, %r9
	setx	0x0c0d58714cab9fdd, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ea91160, %r1, %r9
	setx	0xc333e5e652c9671a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fe04558, %r1, %r9
	setx	0xaa62de930c985d70, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c4d45198a8, %r1, %r9
	setx	0x56ee02051c28e038, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000da03104eb0, %r1, %r9
	setx	0xece7bd6f22c276dc, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000efde562388, %r1, %r9
	setx	0xbb6ebe7711e518bb, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f2e7a3f3d0, %r1, %r9
	setx	0xad90200b11ec92a6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f8467ee, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800eaa1a74, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fac99c1d81, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ee23f61831, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d8ca505ce5, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c261012a57, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f5425ca, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000efc54ce19e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d8fe71212a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c2125840a6, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000df38170f9c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c8b51cedf8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f705ec8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ef23718, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000fa2d0c28b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000eb3cb85000, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000dd75bcf6d0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000cd79791170, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f11c7e8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ec83cf6, %r1, %r9
	setx	0xf235a25a0d194182, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fbbf767, %r1, %r9
	setx	0xc87c9715fd185cd5, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c3ee9acb83, %r1, %r9
	setx	0x359425c9c5312818, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d81065b390, %r1, %r9
	setx	0xd474630b607f8f7d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e87a874db8, %r1, %r9
	setx	0xe6de7347fb97057e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f0462ddf11, %r1, %r9
	setx	0x45663228dcb54787, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e2e909c, %r1, %r9
	setx	0x9b304837c05a1e6d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f348bdc, %r1, %r9
	setx	0x59f11f44dd8bbee7, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cb10d9eaae, %r1, %r9
	setx	0xe7096838321570e3, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d74220b8f8, %r1, %r9
	setx	0x24b7de9fe3b28990, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e58e94cd1e, %r1, %r9
	setx	0x98f1d3ac8f0f9181, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f4abaca04a, %r1, %r9
	setx	0xb7c6e6e826762887, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e3d0e6c, %r1, %r9
	setx	0x22678c56cb247160, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f355d7c, %r1, %r9
	setx	0xe3f157050953dca8, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c36190c2cc, %r1, %r9
	setx	0x0a71456cbd517ff6, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d353ce446c, %r1, %r9
	setx	0x77711d0d7a2d1937, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e387fe6058, %r1, %r9
	setx	0x684d7d8a6cc754e1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f60a82e36c, %r1, %r9
	setx	0x38a27af3e0cb1d9d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e0dc400, %r1, %r9
	setx	0x22a66677abe87323, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f2ada38, %r1, %r9
	setx	0x35c45da329ef2b0d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ce6bc27c68, %r1, %r9
	setx	0x3d1aec320026bb15, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dfadde0258, %r1, %r9
	setx	0x19afb506992da9f7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e9f9e98028, %r1, %r9
	setx	0x9cccdcbbde875d36, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f040444ac0, %r1, %r9
	setx	0x37a25f0dc11c43ce, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ed91c3d, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fab7f2a17c, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e70f0c2986, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000df17a08be6, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c268f5fde9, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fd68162, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e824198, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e47ff18, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f29afa619c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e9961118fc, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d708d9713a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cd3ec85ca6, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f0f6e4a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e368224, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fc2fd74, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e7cd338, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f0c5454894, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e6d96e138c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e8d0990, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f225206fb0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e700c82400, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d5e2f73dd8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800eae32db, %r1, %r9
	setx	0xd102ccf1d660d0bf, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ff015f5, %r1, %r9
	setx	0xcf076372362ee193, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cefe9bed79, %r1, %r9
	setx	0xf254c01f2ebb6b16, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d245fba5d7, %r1, %r9
	setx	0x010a6b30c46d5916, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e2ac441d5a, %r1, %r9
	setx	0xb761c407b46a680e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f4d609f465, %r1, %r9
	setx	0xa3aafd0a089e20e1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e81e2c0, %r1, %r9
	setx	0x5597f4b2aed8af31, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800faebb82, %r1, %r9
	setx	0x9d11631ae9ed694b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ceca5938b4, %r1, %r9
	setx	0xec738b7892877fb4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d8d9c09dea, %r1, %r9
	setx	0x5153acae0e155412, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ede7040b9e, %r1, %r9
	setx	0xcabeeb9cf265c761, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000feb660e2a2, %r1, %r9
	setx	0x2286805b8c866cdb, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e1e3f10, %r1, %r9
	setx	0xa72e3065422f9a9f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f35b180, %r1, %r9
	setx	0x24d482d3b590dfe8, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c1d70e3988, %r1, %r9
	setx	0x2b8c380686906f52, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d3ae374d94, %r1, %r9
	setx	0x427baa0b01f5e5e4, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ebc590c9d0, %r1, %r9
	setx	0xe5783ff7dca090ad, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fc0aefe5cc, %r1, %r9
	setx	0xe25b9db1d3f98d14, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ed3a2c0, %r1, %r9
	setx	0x8d8fc184248bd08b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f243610, %r1, %r9
	setx	0x730d0642f798c5cd, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cd86c9ebd8, %r1, %r9
	setx	0x556377eb6e2c3dee, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d74c434b38, %r1, %r9
	setx	0x681fc766a9ddb2e9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e865ecc1a0, %r1, %r9
	setx	0x22bb4caa9d90f09f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000feff871398, %r1, %r9
	setx	0xdba6047e30dbb569, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e798d5c, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fe9d8e1e3c, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000efbf7608ce, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000eb4129a0c6, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000de22291d92, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c171c02a28, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f855f38, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e734b52, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fef4acc3c0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e488337eba, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f5f1da4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e5a91d4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000dff00a8428, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c419377008, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fd736e8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800edc3e00, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e548529, %r1, %r9
	setx	0x0f5af87f13dba295, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f777b9e, %r1, %r9
	setx	0x69cc448f189171a9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c6036a0073, %r1, %r9
	setx	0xbc90e371e50d4182, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d90ae4b9ab, %r1, %r9
	setx	0x6707edd85c3cc5aa, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ee443dc33a, %r1, %r9
	setx	0x654774bc14ff18f9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f0e59e24f1, %r1, %r9
	setx	0xa57ad3009b75e143, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e3b14fa, %r1, %r9
	setx	0x71d726c96485f485, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fc649ba, %r1, %r9
	setx	0x95f197d0a470814d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c5ceaacf02, %r1, %r9
	setx	0x2df811e5fbb46776, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d1462caf02, %r1, %r9
	setx	0x7353733c8b3c887b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000efbd7591d4, %r1, %r9
	setx	0x666e49e6fbc6d364, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fa2981c72e, %r1, %r9
	setx	0x07fd66ff32ad8ca0, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e065660, %r1, %r9
	setx	0x0bac805048dcc721, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f1412c4, %r1, %r9
	setx	0x9d0288eb528dcc93, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c665f51fd4, %r1, %r9
	setx	0xdd06d7b1f6c20718, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d34d37a788, %r1, %r9
	setx	0x5d66f09c8ecc0563, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e00d927234, %r1, %r9
	setx	0x17e81bdabeffa825, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f853bc0f74, %r1, %r9
	setx	0x24752fb483e120be, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e84b4e0, %r1, %r9
	setx	0x2adf384c52172519, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f9d3a88, %r1, %r9
	setx	0xc864b5a8c155b979, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ce12a3ae80, %r1, %r9
	setx	0x5053021fe3f800f6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d489c99d70, %r1, %r9
	setx	0xe4573fa9315f7f86, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e421354770, %r1, %r9
	setx	0x45541487ecfb8c02, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fccf57c360, %r1, %r9
	setx	0x71f9790333f12044, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e2ac441d5a, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d245fba5d7, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000cefe9bed79, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e08925a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fa7c3f2f46, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ebf9cbd6a2, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000df40ee1bd8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f07efdc000, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e903027e48, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000dae06d8190, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d67d1b3258, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c0364694a8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f737f68, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e5511d0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e49c913, %r1, %r9
	setx	0x29469dcb99fdf1de, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fb64cfe, %r1, %r9
	setx	0xc30d8c0301594669, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cb592dae71, %r1, %r9
	setx	0x844649dd16a8db13, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d7cee2af1f, %r1, %r9
	setx	0x130a8c5482d7cac9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ec98829e75, %r1, %r9
	setx	0x08b0f4c81a22f70b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f66f058d54, %r1, %r9
	setx	0x908a78bfcf4a20d7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ee35074, %r1, %r9
	setx	0x6d2430f29a9d163c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ff391f4, %r1, %r9
	setx	0x9dc59f7dcd5778d6, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c80fed593c, %r1, %r9
	setx	0xaaf38ca551a98bc5, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d83a837a84, %r1, %r9
	setx	0x4eda742ca8353b3d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e8ca6d6800, %r1, %r9
	setx	0xb4aac06a921241e9, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fa60d8533a, %r1, %r9
	setx	0xacf8eabeaf7647d6, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e2f60ac, %r1, %r9
	setx	0xb4744d489a99e7f0, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f4cf078, %r1, %r9
	setx	0xbeae61f8ebdcc8cc, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c897a04244, %r1, %r9
	setx	0xa6e944d5f650d45a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000de93b1abfc, %r1, %r9
	setx	0x8fcce15f6eddfe6b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ec69aa82dc, %r1, %r9
	setx	0x74d094af454e7097, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fc663516d0, %r1, %r9
	setx	0xfc3dd65128794d47, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e858c98, %r1, %r9
	setx	0x7aeeaf0a10ed783f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f8efd30, %r1, %r9
	setx	0xcca37b39edfce4a7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c430d01fe0, %r1, %r9
	setx	0x736a7e1a430c1f85, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d2bd4e4438, %r1, %r9
	setx	0xe2932b3612fc3c0c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e82f68d5c0, %r1, %r9
	setx	0x01f7bc3878eeae49, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fa3b985818, %r1, %r9
	setx	0x7eb72dbeb3ff8a31, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f06c9a57fc, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e8fea8677f, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000dd3fb1aec9, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e44850b250, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d4f96f87d8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ccca582418, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fcf66e4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e1e9200, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fe5e0ac, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e29c9ac, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fa94a45bb0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000eb19457068, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000dd7bdbdddc, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c8d543600c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f715058, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800ea9ff38, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f6dd7a4130, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e342fa4a70, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000dff00a8428, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c419377008, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ef5cb5f, %r1, %r9
	setx	0xbff88fa67adc5489, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f8641eb, %r1, %r9
	setx	0x302b82c84a47331c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c02d949b4c, %r1, %r9
	setx	0x5d17c4cc5c134fe3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000df170d5b2f, %r1, %r9
	setx	0x067741609d8dab3d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e29cc994ef, %r1, %r9
	setx	0x23d10b99010097a6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f63f51679f, %r1, %r9
	setx	0x79581577f32cb099, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e7a6404, %r1, %r9
	setx	0x8a7484fd53f2c289, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f01ea28, %r1, %r9
	setx	0xa76246bb75b82d42, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c2daafa466, %r1, %r9
	setx	0x6526fe48fc92ccf3, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000de1f6c2bc6, %r1, %r9
	setx	0xb302e5e8096f7795, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e6f9bf4d3c, %r1, %r9
	setx	0xfbfb86fcd69ec501, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f840c6b518, %r1, %r9
	setx	0x4c488f320b68da4a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e4f76b0, %r1, %r9
	setx	0xfaaf75dcc44b4582, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ff4aa08, %r1, %r9
	setx	0xb8561060807af7f0, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c50ca6eec0, %r1, %r9
	setx	0x6fd62742f9b1b180, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d5d3dc8848, %r1, %r9
	setx	0xd2c7925fc774cbe1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e134569c50, %r1, %r9
	setx	0xd0e78608f8834b18, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f60fb7cb68, %r1, %r9
	setx	0x794a29ccfce89314, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ee1ef20, %r1, %r9
	setx	0x76dd61378a1a0b69, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f415968, %r1, %r9
	setx	0x3266d9d8f3990c7f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c0e4136d48, %r1, %r9
	setx	0x403af86a688bd9de, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d05b11c460, %r1, %r9
	setx	0xa648deb5c454d90a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e836c8aa08, %r1, %r9
	setx	0x8474561dd53aa71d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fe381647e8, %r1, %r9
	setx	0xb01e8f0f6b113587, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fae7567b07, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ee1c1a7ab3, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000dd949fc053, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000cc6270637e, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f8c283e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e3b3168d50, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d9b155ce94, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c834fe4e28, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800edeab70, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f6e95cb448, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e0a6455, %r1, %r9
	setx	0x9c22b381b4a431a2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f9c015f, %r1, %r9
	setx	0x9b8fa8155b8b71e5, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cb6db1fd26, %r1, %r9
	setx	0xd6e13e9a65a0d852, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d968fb8d8c, %r1, %r9
	setx	0xae8a718a7bff3da9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e21e959b53, %r1, %r9
	setx	0x0a08c05d609b211e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f6dc9850d7, %r1, %r9
	setx	0x2203557c0e94abc1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e194730, %r1, %r9
	setx	0xe7ad434713ff1aea, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f74d874, %r1, %r9
	setx	0xc26ded1e157b862f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cc710c257a, %r1, %r9
	setx	0x864328d84c78e30c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000db15a5e5fe, %r1, %r9
	setx	0x4765ce3397a10a7c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e4e0f68182, %r1, %r9
	setx	0xf10c816f78ba985c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fce973a9fa, %r1, %r9
	setx	0xb3be2231200e4248, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e0a04b0, %r1, %r9
	setx	0x8e4ca08934ab21b5, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ff178e0, %r1, %r9
	setx	0xd44619103387b7c8, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c0cb391d04, %r1, %r9
	setx	0xfc22d8ee5853ae6a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000dbfb63f3e4, %r1, %r9
	setx	0x210edbee7197d253, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000efc9affed0, %r1, %r9
	setx	0x7a89f79f146679e8, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f4d6192068, %r1, %r9
	setx	0x340cfa0d8253534f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ebde238, %r1, %r9
	setx	0x64c6b88fb30c1801, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ff4fba8, %r1, %r9
	setx	0xb250525569362cc7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c687ccb848, %r1, %r9
	setx	0xbd9bc2766267014c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d9165a40e0, %r1, %r9
	setx	0x8ccab8203d19361c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ef37daf668, %r1, %r9
	setx	0xb25062f9ffc9cbd9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f0cea862d8, %r1, %r9
	setx	0xeba9d024fa1f9449, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d3dd175642, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ca141b59b9, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f4dc630, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800eabe1c9, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f0d178dd7b, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000dfd105f9d0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000cd12def920, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f6b3a6f288, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e67542f190, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d69c046398, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c6a6b38130, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f6f4dd0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e4d8e18, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000fe89ac9ea8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ed8240f, %r1, %r9
	setx	0x7443a44d65e612f4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f890e03, %r1, %r9
	setx	0xddbe2670886e0a47, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c970968e39, %r1, %r9
	setx	0xa74a71605175726a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d6e8ae350e, %r1, %r9
	setx	0x08935009a1b20f47, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ee37be86c5, %r1, %r9
	setx	0xf3c65946f80c3362, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f6eb5b7878, %r1, %r9
	setx	0xb4f0e6ef94d957b0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e421bc8, %r1, %r9
	setx	0x2e1e3183195992ba, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fbc6cdc, %r1, %r9
	setx	0x2cf4030694266a02, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c789d698e4, %r1, %r9
	setx	0xbcb91f34922f461b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d8cfc1041a, %r1, %r9
	setx	0x5ce18ff453ddfab9, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e65ba522e2, %r1, %r9
	setx	0xbfef84e5128017b0, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f89ef397c0, %r1, %r9
	setx	0x267bd428a9187ba5, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e176bf8, %r1, %r9
	setx	0x602ec57b1e2a7244, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800faa6b6c, %r1, %r9
	setx	0x665a5e0ded17094c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c1687b0ad8, %r1, %r9
	setx	0x0efab3cc97f99d83, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000deef987eac, %r1, %r9
	setx	0xb12290d51aeab87c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e342d7cec0, %r1, %r9
	setx	0x0efda5186affecc9, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f02d7de9bc, %r1, %r9
	setx	0x202ce06cd6067b02, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e771d80, %r1, %r9
	setx	0x2de6a9ca43cbcd77, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fe8e9c0, %r1, %r9
	setx	0x74658aa2e71763d7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c1a683f7c8, %r1, %r9
	setx	0xc09002a832b590e1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dfcfb56e58, %r1, %r9
	setx	0x4eed843cc1fe008e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e8f9948e30, %r1, %r9
	setx	0xb3027e3b19465b1c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f4b5be64a8, %r1, %r9
	setx	0x8c1dd90f4f543197, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fe8b910f82, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ecdf399b00, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d1311079b2, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c9d30efb82, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000dbfb63f3e4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c0cb391d04, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800eb23319, %r1, %r9
	setx	0x097c94bbd00b5eab, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fa4a667, %r1, %r9
	setx	0x0984c1328b723e69, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c6ff66f101, %r1, %r9
	setx	0x1f30ec77fa6d4e9f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dc798a47d4, %r1, %r9
	setx	0xaceff29241c7be0e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e78a6b5121, %r1, %r9
	setx	0x6d7d100e0e6c70cf, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f0a311f5a7, %r1, %r9
	setx	0x6c414f728f2d3c0f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e9810ec, %r1, %r9
	setx	0x3b69c4b45aea9b0e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f8b82ca, %r1, %r9
	setx	0xce05eccdbf0e85ad, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cbb1efc46c, %r1, %r9
	setx	0xcc7a10f8b1a741d3, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d0fd6f1bb4, %r1, %r9
	setx	0x9805e1328eb98ebb, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e7803cf090, %r1, %r9
	setx	0x73819010a643a093, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f4d0952574, %r1, %r9
	setx	0x7494b718354b56ec, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e674aac, %r1, %r9
	setx	0xd561206cce2916c6, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f8a6f94, %r1, %r9
	setx	0x44f64d55219769d6, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c79e6127a0, %r1, %r9
	setx	0x5d6b0db05910b891, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000da7c468378, %r1, %r9
	setx	0xb6f85a95ef719580, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ea6a5f3d58, %r1, %r9
	setx	0xf1fde1d3e58c549e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f82ddac840, %r1, %r9
	setx	0xe9e58533e59addf2, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e73d9f0, %r1, %r9
	setx	0x08cb0be220204cd6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f353418, %r1, %r9
	setx	0x272611d13bc22eda, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c3bd775110, %r1, %r9
	setx	0xb0d88115f4bb8973, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d98273a410, %r1, %r9
	setx	0xcddcaa119977a6e1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e4a1596878, %r1, %r9
	setx	0x5632d2052d736ba4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f296950570, %r1, %r9
	setx	0xe79dd356120a0eb9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cbc335baf6, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f3ecfec, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e39c45b, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fedc8a318e, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f67b3d6af6, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ebeddb205e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d3bf5a5a12, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c28b5c2534, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e36fb3ffa4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fa1b31b010, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e93a139fe0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d54d9b3b20, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000cba9b215e8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ff338a8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e9144fe, %r1, %r9
	setx	0x4293d992d192095f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ffe1225, %r1, %r9
	setx	0x8628db1495943c5c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cd20725974, %r1, %r9
	setx	0x87183b4616f6f6a4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d7ef299860, %r1, %r9
	setx	0x7746cd31592bd17b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e7b18fcdc4, %r1, %r9
	setx	0xd4c4b4b1377d13ad, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f4a39105b0, %r1, %r9
	setx	0x2b0ac5e62fa15ddf, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ea136d0, %r1, %r9
	setx	0x17aa60991b02104d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f4bfb8e, %r1, %r9
	setx	0x9e1b6109bd853063, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cb0aa3824a, %r1, %r9
	setx	0x5ca10f7b7f7df5a8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d8f8b57b08, %r1, %r9
	setx	0x7e411b2de7a2bc89, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000efb86f29fc, %r1, %r9
	setx	0xe8e82ea0c53b5809, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fc91138f6c, %r1, %r9
	setx	0xca3c8705921e722d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e78d140, %r1, %r9
	setx	0x785696a4a67b1e18, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f8a5aac, %r1, %r9
	setx	0x95049d064a958cc5, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c40651c958, %r1, %r9
	setx	0x0325e70fe7f79b1c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d084c352b0, %r1, %r9
	setx	0x58d08f52815ff175, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e23a7354bc, %r1, %r9
	setx	0x6b9772b93f844031, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f89d015594, %r1, %r9
	setx	0xe07c29c51e450fb2, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800efcaa10, %r1, %r9
	setx	0x6777d6369b63ab4f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fd4d798, %r1, %r9
	setx	0x53688699e3ab784b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cd13c07b08, %r1, %r9
	setx	0xbb49a28a25856743, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d764814028, %r1, %r9
	setx	0x066599bda130b684, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e877869c30, %r1, %r9
	setx	0x49829e4f1c0ad74f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fa1bcde408, %r1, %r9
	setx	0x6b5cc58312f50f07, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dc2ddc5b30, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f86c1b0c78, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e04cd90e1a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d3b29d1f1c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c78d785748, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f462ae0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e725f30, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d9165a40e0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c687ccb848, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ff4fba8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e7bfb1b, %r1, %r9
	setx	0xc98de125db7fe4e6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f89ad65, %r1, %r9
	setx	0x9a077c98c0f4ec83, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c36681d11a, %r1, %r9
	setx	0x4cf9215df67b703b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d1ef8b7154, %r1, %r9
	setx	0xf67d1596eb01e52a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ec80b259a9, %r1, %r9
	setx	0xa59e631530a0cf9e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f47b4035a3, %r1, %r9
	setx	0xeafe47278f77b7b4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ef45540, %r1, %r9
	setx	0x6cff620d11c41a8b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fb2d4c8, %r1, %r9
	setx	0xa8f13f0db3971fac, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c96041ed3c, %r1, %r9
	setx	0x205f972ce645716a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d91e7e01f8, %r1, %r9
	setx	0x60a46f9fb1d4b6f9, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000efc6c67d3e, %r1, %r9
	setx	0xb982dbf9eaaf7d67, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f2e39a49fc, %r1, %r9
	setx	0xea455925648943bc, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e3ed1d4, %r1, %r9
	setx	0xa448ac55a92dd9fb, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f71a4c8, %r1, %r9
	setx	0x76ffed35ba310dce, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c7e3e5347c, %r1, %r9
	setx	0x0cd9dbc400bc4574, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d709e379dc, %r1, %r9
	setx	0x9de085abe4f79fb1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ef3ff01b88, %r1, %r9
	setx	0xba8d25e88fbcf0c8, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f48b637e08, %r1, %r9
	setx	0xe610cb112ddbed3a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e439448, %r1, %r9
	setx	0x40fd947f08d001ea, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f4506c0, %r1, %r9
	setx	0x57ddef5ea6c986aa, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c08e84f1a8, %r1, %r9
	setx	0x56ac829ab5c7f4b6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d1469a5878, %r1, %r9
	setx	0x68b6344201d0e602, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e077e97f58, %r1, %r9
	setx	0x3f0957049d254ce2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fcfc7bd050, %r1, %r9
	setx	0x73259596d62503b4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d78ded2436, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cc2c63486e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f38deb6, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e5ef71a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f0fd18b1ea, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f4bb172c60, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000eb071ad660, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d29634bd2c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e5734ed, %r1, %r9
	setx	0x8f9fc79f42fa0de8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f73c4d8, %r1, %r9
	setx	0xe9fe93aaf49c0c73, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c3875fd125, %r1, %r9
	setx	0x239c04120d49c4f2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d08e96eac0, %r1, %r9
	setx	0xcef81c44dbfac0b5, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000eae145f1eb, %r1, %r9
	setx	0xc63208e5d19b8ffd, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f2baaa7450, %r1, %r9
	setx	0xbb81ffbe6d0a6eb6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e6744a8, %r1, %r9
	setx	0xd5a7ee2fe34427a9, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f3c91f2, %r1, %r9
	setx	0x919cc7ec77536808, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cbff75bd58, %r1, %r9
	setx	0x1d60f881fd35a405, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d4a43ef56c, %r1, %r9
	setx	0x6df00a5d7bcdb17e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e61d284f8a, %r1, %r9
	setx	0x7f8785b688f90c40, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f8a9374324, %r1, %r9
	setx	0x31e6bfb3f2eaa2e9, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e06fc5c, %r1, %r9
	setx	0xb5ab0cd5ded89511, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fb607fc, %r1, %r9
	setx	0x8597b47418eae0a2, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c9da260ef8, %r1, %r9
	setx	0xee41220ca18d102f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d4d34dd67c, %r1, %r9
	setx	0x6bfd1fc0ff15e7ed, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e6f94800b4, %r1, %r9
	setx	0xd5296fa2da187c1d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fa3d6a3734, %r1, %r9
	setx	0x1e9d4a21cb40014f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e810228, %r1, %r9
	setx	0x7479e37a028385eb, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fced8a8, %r1, %r9
	setx	0xe3a6c43231b3e92a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c13d46f7a0, %r1, %r9
	setx	0xf4bb8768afa42ad1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d6fd3e5b50, %r1, %r9
	setx	0xfe2381bfa1cce555, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e8c5168090, %r1, %r9
	setx	0x10c458b3d321dfae, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f0fe5a9060, %r1, %r9
	setx	0x668e6898b2192e93, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800eef1589, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f6fe9c4585, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e4cc774b9e, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d12385cf08, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c2cbae9909, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fe4f8e6, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c28b5c2534, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ff520b2, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ec981b2, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f0b2f08d1c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e7ea5736d8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ff4aa08, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f79c238, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ef3d550, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f83c7769f8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e4bc6a0248, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000da7899bf48, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ea80ad6, %r1, %r9
	setx	0xd46c625bbc0338b5, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fc37dc7, %r1, %r9
	setx	0x124b21e715a64c68, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c8fee8b0b3, %r1, %r9
	setx	0x53d23ab602904ac5, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000df5cab2fe1, %r1, %r9
	setx	0xd1acade055d9fe79, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e86ee3d75e, %r1, %r9
	setx	0xd8877c0e32c1bff9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f67f7fd489, %r1, %r9
	setx	0xc8c956cbb9777393, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ee8179e, %r1, %r9
	setx	0xdd84e6ebeb2e8b13, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fae234c, %r1, %r9
	setx	0x64eb498ae748b090, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c2c1de2746, %r1, %r9
	setx	0x3b47cb72fb394e81, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d1028546f8, %r1, %r9
	setx	0x67fc3068f3cc75e3, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e28ff40db0, %r1, %r9
	setx	0xab76d5ce1513d5c3, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f837bfdfe4, %r1, %r9
	setx	0x75f3d1816a90bb11, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e6547c8, %r1, %r9
	setx	0xe6350efc2efa242e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f0a8268, %r1, %r9
	setx	0x1f7deb747efd083c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cd32cebd84, %r1, %r9
	setx	0xa020cacb2993613e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000df555b1dd0, %r1, %r9
	setx	0xc6f9186ffc9f54cb, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ecd34b5c90, %r1, %r9
	setx	0x584bf171ecf18954, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fe34c66ec8, %r1, %r9
	setx	0xef31b3f1d7630503, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ed62160, %r1, %r9
	setx	0x24c96f80e4052003, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f1adfa0, %r1, %r9
	setx	0xad958e46ee0dc5b7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c803395168, %r1, %r9
	setx	0x3c30c03532ab021a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000def8eb7f20, %r1, %r9
	setx	0xc0eaa0279899f1b5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e6a95cfba8, %r1, %r9
	setx	0x92cfedf3c989c3d2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000feef964060, %r1, %r9
	setx	0xf38d40f74a12da21, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6fe9c4585, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e4cc774b9e, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d12385cf08, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c2cbae9909, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e4d015e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e36fb3ffa4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d14e66567c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000cc86065e0c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800fc2fd74, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e7cd338, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f4d7938, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ea7d690, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f697904e50, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000ef7b4a4730, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000dad5d75db0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c672e73078, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fb582d0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e8dbd2a, %r1, %r9
	setx	0x9170b3b997d65d7e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f2f181e, %r1, %r9
	setx	0xfce66fadac02831b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cc96d90ec6, %r1, %r9
	setx	0x9b5b78e41acafe3b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d1241a146b, %r1, %r9
	setx	0x0fe0ec8ed835d190, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e5016913dd, %r1, %r9
	setx	0xc45d42768902e214, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fc1aa861f9, %r1, %r9
	setx	0xec3e22a7fc09c192, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e0d2e2c, %r1, %r9
	setx	0x60d1037888c3bd1a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f61a062, %r1, %r9
	setx	0xace067541053be8b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c68e2505a0, %r1, %r9
	setx	0x3262131f52a8067a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dcfdb63bf2, %r1, %r9
	setx	0xfdb080403af8b60d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e377a411a0, %r1, %r9
	setx	0x4b165c54a36a30cb, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f6771204ae, %r1, %r9
	setx	0x21df9c50c1c892ce, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e0d5370, %r1, %r9
	setx	0x862b62fcfe99afca, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f644268, %r1, %r9
	setx	0xbcbf283f817566c0, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c9bd1493bc, %r1, %r9
	setx	0xe94db73622df2f1d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d181d9e048, %r1, %r9
	setx	0xba7853e41ccbdbc3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e218b5242c, %r1, %r9
	setx	0xb337d00274386b9b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fc0267299c, %r1, %r9
	setx	0x2a403f3d7d80bf15, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e7d5118, %r1, %r9
	setx	0xfed8fecfdb16f5bb, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f94c328, %r1, %r9
	setx	0xf9f169342c72093b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c2a62b3090, %r1, %r9
	setx	0xc0cd4643b265738e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d4a06698a0, %r1, %r9
	setx	0xe0e02dcddac69150, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e42675c7a0, %r1, %r9
	setx	0x701f05fee2cc1333, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fcd36e79c0, %r1, %r9
	setx	0x54324b170e6e9ba7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e5e8bd3, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fc82e2972b, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ebcee8fc64, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000df54c2b8e0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c0b384164b, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f8074ef1d8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e1c75a1d78, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d00fcc3ad0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000cc1f2a8e48, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fc388b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e29a250, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f02f070b40, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e1b8c19e00, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e94a4a4, %r1, %r9
	setx	0x2175d5556df8e46c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fad0aae, %r1, %r9
	setx	0x9df5603cf5b4ea3f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c191a48883, %r1, %r9
	setx	0x6df9e94a38402016, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dab304a455, %r1, %r9
	setx	0x76886c9277869612, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000eab9429a59, %r1, %r9
	setx	0xfb855df8e8a97b95, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000feb1d6e961, %r1, %r9
	setx	0x6cd312d8f628611d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ef55578, %r1, %r9
	setx	0xdb11db35f4478d3d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f24b03c, %r1, %r9
	setx	0xbf1c8e49599706c4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cd4967decc, %r1, %r9
	setx	0x0386a700673e4303, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d10a01bee6, %r1, %r9
	setx	0x309146bc31ee3c91, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e448ffdc4e, %r1, %r9
	setx	0x7602c7ae076b1a59, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f42ab7d1c8, %r1, %r9
	setx	0x036f5c54f3449754, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e3bab60, %r1, %r9
	setx	0x63dbfba441c25d05, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ff804f0, %r1, %r9
	setx	0x242a74788c6883bc, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ce7dfac47c, %r1, %r9
	setx	0x3115bff09d0b9fdc, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d870984c40, %r1, %r9
	setx	0xe98bca5befe3efca, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000eddf7374c0, %r1, %r9
	setx	0x7af566b25824ca3a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f2e4f60a28, %r1, %r9
	setx	0xe61e15dc6897555e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ee96688, %r1, %r9
	setx	0x9dab36d47adbc87f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f171ad0, %r1, %r9
	setx	0x54a9c757a16d03f7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c6c79789e8, %r1, %r9
	setx	0x9522634fe5d10b87, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d9bd895948, %r1, %r9
	setx	0xbd1a393425bf7e9d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e9441668f0, %r1, %r9
	setx	0xda7f2c16c5168aae, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f0f55c0588, %r1, %r9
	setx	0x927e0896d0d9ca50, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c771b2e1ec, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f32680b, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e18f67f5c2, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d63000ff32, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c7bfc1b42c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800fa50908, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800eba4738, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f69cf57850, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e16a7226ac, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d1469a5878, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c08e84f1a8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f4506c0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e439448, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000fa1bcde408, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e877869c30, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d764814028, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e319f1d, %r1, %r9
	setx	0x5d97c8917e50eb10, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fd7325f, %r1, %r9
	setx	0x0d37f45cd37acab8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cc3d5768b8, %r1, %r9
	setx	0xe4d934c2738acddc, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d067f6b071, %r1, %r9
	setx	0x149ebea804a8dd40, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e96cf9321e, %r1, %r9
	setx	0x7ee3cd7ab5ee85be, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f695852cbd, %r1, %r9
	setx	0x0b88cba2ab96784e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ee5a9de, %r1, %r9
	setx	0xde3e24432f9ce226, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f86ed58, %r1, %r9
	setx	0xcad634e96e48b9c4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c6d0e2eb4c, %r1, %r9
	setx	0xa5cb3ace5f4afa63, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d2aeba8d9a, %r1, %r9
	setx	0x6dba12d497b71716, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e6ea2410b6, %r1, %r9
	setx	0xc36b49d34d916d35, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f854c7e508, %r1, %r9
	setx	0x3b712a10d2f1e2c4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e8fcad8, %r1, %r9
	setx	0x5fb28a540a51c500, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fe49b24, %r1, %r9
	setx	0x821fd960f70c9488, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c47bae67dc, %r1, %r9
	setx	0x88951f962faf0056, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000df58f81f58, %r1, %r9
	setx	0xa998b15e90a292d2, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e526cbea9c, %r1, %r9
	setx	0xf364c799622fb4b2, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fc5dd2fe8c, %r1, %r9
	setx	0x4001abbe364499a8, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ec38570, %r1, %r9
	setx	0x6b5c85816f1f25a6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f1993e8, %r1, %r9
	setx	0x07d863462dc0b4ed, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c2bd5a2798, %r1, %r9
	setx	0xf3f5849b8afab79a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d28f8bf640, %r1, %r9
	setx	0x78b41ac66b6fdccd, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ea20a157f8, %r1, %r9
	setx	0xdee6196621131d8a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8c7e35e78, %r1, %r9
	setx	0xbb2abf14e890be75, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d067f6b071, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000cc3d5768b8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fd7325f, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e319f1d, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000feb1d6e961, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000eab9429a59, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000dab304a455, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e58e94cd1e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d74220b8f8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cb10d9eaae, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f348bdc, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e2e909c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f35b180, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e1e3f10, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f60a82e36c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e387fe6058, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d353ce446c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c36190c2cc, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f355d7c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c72fcdbf50, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f47cf38, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e69a370, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f61e5e8d68, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e8dfda3, %r1, %r9
	setx	0x75743f38258cf009, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f5d03ae, %r1, %r9
	setx	0xcb6037a0a3fcd2c1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cfc2159919, %r1, %r9
	setx	0xee66a720da15e2a3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d70c5f0424, %r1, %r9
	setx	0xa7921b70c51874d5, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ea20b00808, %r1, %r9
	setx	0x3b2efe73006d06d7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f2cfcb9b3a, %r1, %r9
	setx	0x33d3fee5269ffb4b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ef69dac, %r1, %r9
	setx	0x4144db9f0639a6b8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fba6912, %r1, %r9
	setx	0xa40c7c22f3f6521a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c4f71f98b2, %r1, %r9
	setx	0x17c174c67dd4562d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000db062b1ea2, %r1, %r9
	setx	0x44c449af0c89cf9d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e0c8e59462, %r1, %r9
	setx	0xfbe340836ae52fc1, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fc6a6dec64, %r1, %r9
	setx	0x83ef9f8f98eaea71, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e479afc, %r1, %r9
	setx	0x028fe22a9d759034, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ff90f4c, %r1, %r9
	setx	0xe7ae6b32dbfce09c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ce8ebd47e4, %r1, %r9
	setx	0x09eba63ef981f6f1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ddb4d71518, %r1, %r9
	setx	0x11d8c59fc28ef2b5, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e0228d3084, %r1, %r9
	setx	0x22b2d5301baf289a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fcb8f53cd8, %r1, %r9
	setx	0xc1a587f80ae4f714, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e0b8a50, %r1, %r9
	setx	0x9846008494ce47c0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f627628, %r1, %r9
	setx	0xed8adf3fce2e6174, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cf09213d38, %r1, %r9
	setx	0xc88c601ab9548d70, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dc511ca810, %r1, %r9
	setx	0x738f8290966ba4bc, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ee6b821e68, %r1, %r9
	setx	0xb43623b5d3fde714, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fa9a521858, %r1, %r9
	setx	0xf0eddd574cb555a1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800edb1215, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f8484bcb25, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e0b6e3f78c, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d856127072, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c1b61fae2c, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f60d7e9, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f0f5c9d8c6, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e763f8808a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000dd3fd2f270, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c15c0e388a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fc7f0d2, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e08925a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c5783dbd98, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800fa161e8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800ed67c74, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f8074ef1d8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e1c75a1d78, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000dbbf54fb98, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000cfa3750b48, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e80ac40, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f8f1925a98, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000ed0182cf48, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d157b6cb08, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c04f91d7b8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fac5420, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e6182d8, %r1, %r9
	setx	0x9be1245890218702, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f142dd6, %r1, %r9
	setx	0x3cf75b7aceb1c023, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c3f41ca9fd, %r1, %r9
	setx	0x3d6cfeadc56fd8df, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d604793e0c, %r1, %r9
	setx	0xf26275c323de0d24, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ebb49d772d, %r1, %r9
	setx	0x3e89590c63bdf66b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f6a45f4dd6, %r1, %r9
	setx	0x34da21131094eef8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e229442, %r1, %r9
	setx	0xac57b72669345664, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f7fc976, %r1, %r9
	setx	0xb573b153c0db2041, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c5204cc89c, %r1, %r9
	setx	0x68d9b2f10b3cccb2, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d9e4d6a736, %r1, %r9
	setx	0x70a751fc364f05b5, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ec1a63b4aa, %r1, %r9
	setx	0x3fe4fdd33218685b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000faea3a6392, %r1, %r9
	setx	0xaf9b7cfdc7060371, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e587c50, %r1, %r9
	setx	0x7d6e5d58eeed637f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f6f0d98, %r1, %r9
	setx	0x260837cb984a5051, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c5379b0750, %r1, %r9
	setx	0x1a9c2fc155e76d45, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d49f73f474, %r1, %r9
	setx	0x73464dec7edadc6f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e36af07f40, %r1, %r9
	setx	0xef32cc2cd329b718, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f43a7e689c, %r1, %r9
	setx	0x75c67b14aead741f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800eb1cdb8, %r1, %r9
	setx	0xf4f038a6a43ce3bd, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fb479e0, %r1, %r9
	setx	0xf1612c3ab829a84f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cd65735990, %r1, %r9
	setx	0xb6e71217bb409f58, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000df0d593250, %r1, %r9
	setx	0x46c0c5a360bfead2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ea5197e468, %r1, %r9
	setx	0x21a2d7523a6cfe0c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f05a4ae2c0, %r1, %r9
	setx	0x6c38a114ff878cfa, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ea80ad6, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f2baaa7450, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f7b8888, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ec98cfc, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f86c1b0c78, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e04cd90e1a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f645edf964, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ed937c4c78, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d16c261290, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c0e3ae0c48, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800fd838d4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e1751d8a20, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d049e6e6e0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e2494eb, %r1, %r9
	setx	0xb843cb90ddbe8f1a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f78d892, %r1, %r9
	setx	0x4c03d89494a00e21, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cde6dc33ea, %r1, %r9
	setx	0xb0dbd6bcf687b8f7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000db9f96280f, %r1, %r9
	setx	0xdee47469205ab1af, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000eadc72550b, %r1, %r9
	setx	0xdc05647d5565fbae, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f2804bb962, %r1, %r9
	setx	0xf5ebbc3859c172d3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ead390c, %r1, %r9
	setx	0xb724da6b3fc954de, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fdd1254, %r1, %r9
	setx	0xe970631e05f6e565, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cf331377a6, %r1, %r9
	setx	0x078cacc377906bdf, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d3e7b69108, %r1, %r9
	setx	0xe0f60d59e956dac4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000eeae952350, %r1, %r9
	setx	0x5e7079e21a7dd976, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fc664bc4a6, %r1, %r9
	setx	0x71847e5779f3cd6d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e8c2874, %r1, %r9
	setx	0x701ce4af07068c3c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f93f15c, %r1, %r9
	setx	0x01790fd7f950f730, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ca3002813c, %r1, %r9
	setx	0x0e5db866e15409a3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d7891985c4, %r1, %r9
	setx	0xa0e8545ba3a507a8, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e90e117f0c, %r1, %r9
	setx	0x7691947083a212bc, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fc48dd8a88, %r1, %r9
	setx	0xca5afa2cda238b9c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ed274c8, %r1, %r9
	setx	0x7c131ceebdcd27da, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ff8bc20, %r1, %r9
	setx	0x4467d717e29fd131, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c38a7583d8, %r1, %r9
	setx	0x1af32742286abc27, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000df8eb43330, %r1, %r9
	setx	0x3d47e0b060b4ffa6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e2593f7878, %r1, %r9
	setx	0x7ba87585403ac403, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fa6fce9528, %r1, %r9
	setx	0x441ae011b3bf23f0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cd20725974, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ffe1225, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e9144fe, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f0a311f5a7, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e78a6b5121, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fe29dbff22, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000eb4129a0c6, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000de22291d92, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c171c02a28, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fa250c4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e3299f0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c19d04c978, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e53ebe5, %r1, %r9
	setx	0xe1675387723f45ca, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ff99a1a, %r1, %r9
	setx	0x89c3907f30879a30, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ce8fc707fe, %r1, %r9
	setx	0x857e5152314e3c2a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d1eea6e652, %r1, %r9
	setx	0xa68f2a171afc3b06, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e851a1602d, %r1, %r9
	setx	0x0e96abb69e9cd516, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f0da84fb10, %r1, %r9
	setx	0xf72e79135687e3fa, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e6e9adc, %r1, %r9
	setx	0xc14077ae454ca87c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ff85b7a, %r1, %r9
	setx	0x8453bdbb881a1a77, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cb78dd1196, %r1, %r9
	setx	0x9e030d6265c12c87, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000de06213722, %r1, %r9
	setx	0x71770e7a009d10d4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ecb4c002f4, %r1, %r9
	setx	0xdb19b365f268646f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f82fd9e2e4, %r1, %r9
	setx	0x4e62dd9ff665f7e7, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800edcaab0, %r1, %r9
	setx	0xdd97e9214ee04c8e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fff83c4, %r1, %r9
	setx	0xa581092dc689104a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c6ea7c93c0, %r1, %r9
	setx	0xb1328ac64a8e5c0f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000dc7b809f00, %r1, %r9
	setx	0x480cfcba6f29d43f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ef788c6490, %r1, %r9
	setx	0xf2e6cf6c17e03c34, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fa5e1261f4, %r1, %r9
	setx	0xe509035f3062c249, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ebb6140, %r1, %r9
	setx	0xcc1fa43ae61fa221, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f134c88, %r1, %r9
	setx	0xac9ea53fa048bdee, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cb78d799c0, %r1, %r9
	setx	0x9c3c93b29a6bda8f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dfc837fc60, %r1, %r9
	setx	0x2216e4649f008d2e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ec6ca9ad90, %r1, %r9
	setx	0xc749540c5953413d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f400f81a68, %r1, %r9
	setx	0xbf6fd330f4f35114, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000feb1edb22a, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ec017a0881, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d49e2d9610, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ca9ea70970, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f129c88, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e3cc382, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ea6233857c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000de8061c81e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cd95e00f6a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f2ac8a6, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e3f13ac, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f6aa253764, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000da1d18b040, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000cf0923b3c8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f052800, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800eef61c0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e6a2224, %r1, %r9
	setx	0xae5e3b0e5d6e6f80, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fd96892, %r1, %r9
	setx	0xbff9af9f09775e1d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c40a7630df, %r1, %r9
	setx	0xbcb8b9aaa8e1ed68, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d86725e6bd, %r1, %r9
	setx	0x79d082a1b4c86a7a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e0316bbd85, %r1, %r9
	setx	0xd156857892319fee, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fc5d5359c8, %r1, %r9
	setx	0x952545f79159641a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800edee528, %r1, %r9
	setx	0x8e506185ce88e2af, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f7493d0, %r1, %r9
	setx	0x851f98b9ae52ab81, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ce595a06b8, %r1, %r9
	setx	0x14a24062f16ba8e5, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d5f8009aa2, %r1, %r9
	setx	0x04bb6decbde9e5ad, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ec780dbbee, %r1, %r9
	setx	0x9371d73bddc1e738, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fe96ae217e, %r1, %r9
	setx	0xf1e587fe16bcc3f5, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ebbc09c, %r1, %r9
	setx	0xc657db034d19b7f2, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f4eabf4, %r1, %r9
	setx	0xbd9753760a76a337, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cd2b3ebdfc, %r1, %r9
	setx	0x752bf035298d999e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d73cc68ed4, %r1, %r9
	setx	0xbef81a0934838422, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e5af2f614c, %r1, %r9
	setx	0xf3f551c15778dc2e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f40c4e1408, %r1, %r9
	setx	0x9471eaf4c38958b7, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ea245f0, %r1, %r9
	setx	0x0707a338c5857419, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f83bc50, %r1, %r9
	setx	0x3fde4724fbf353c8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c05d993e58, %r1, %r9
	setx	0xcb9922ad64126eea, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dff9e6f3b8, %r1, %r9
	setx	0x595dc11a316938b2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e48cfda4c0, %r1, %r9
	setx	0x331d5daa6b9ef107, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000faa1bb7a70, %r1, %r9
	setx	0x684f74e14f2cf06e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e798d5c, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fe9d8e1e3c, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000efbf7608ce, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d7d97a400e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cf2fda67fe, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f18426a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e71444a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f408a1cfd8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e7ab5dbc54, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800fd5af80, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e1b0728, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f4d50b1a30, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800eb14e01, %r1, %r9
	setx	0x12ca5cd4b22b2546, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f9a3a17, %r1, %r9
	setx	0xac82e527edca316b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c752c69ddc, %r1, %r9
	setx	0x64e14dc4562cb90c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d0c580dc20, %r1, %r9
	setx	0x273df13cdc1c90a3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e1efbfc3d7, %r1, %r9
	setx	0x26323e415d6843aa, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fcf1980f8f, %r1, %r9
	setx	0x367b9daa90d1d2c0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800efbb0d2, %r1, %r9
	setx	0xef94bfb5c0f63f66, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f0f8262, %r1, %r9
	setx	0xf4d2438c9ea63eb0, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ceaec75edc, %r1, %r9
	setx	0x536dd1054720a34e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000df16ff4f70, %r1, %r9
	setx	0x6654a65b3f91adfb, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000eb31fc0912, %r1, %r9
	setx	0x86dea2b3db38237d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f21d4ace1e, %r1, %r9
	setx	0x2dbcb97ae9f923d9, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ea18e58, %r1, %r9
	setx	0x97203ca6ce6aa903, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f4d4d10, %r1, %r9
	setx	0x99ffdda88df53cb2, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ca31710d8c, %r1, %r9
	setx	0xe920792750ec8109, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000deec53b2bc, %r1, %r9
	setx	0xa8f892042275c5d1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ee2e109e4c, %r1, %r9
	setx	0x30c5be617700fd79, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f87431054c, %r1, %r9
	setx	0xd5de4fb07a74257e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e949e28, %r1, %r9
	setx	0x21c6fbbae372c9bc, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ff7f630, %r1, %r9
	setx	0x5551d1fe02f72665, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c327834808, %r1, %r9
	setx	0xb0403f3cc7bee0ff, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d838fa87d0, %r1, %r9
	setx	0x148f5237e9fe5575, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e1ab02ce20, %r1, %r9
	setx	0x7fdfc0a2802dfd27, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f87c7cd690, %r1, %r9
	setx	0x3a1a78ced1634605, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e82b1563c0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d68d5a00f6, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c162754a1d, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d4f96f87d8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ccca582418, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d3921631d8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000cad765fb24, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e60ec5a, %r1, %r9
	setx	0x105f04a7823fa979, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fa1f931, %r1, %r9
	setx	0x9160076daa0c07ec, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c71cedca0f, %r1, %r9
	setx	0x77516f7f3699dab8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d554e411d3, %r1, %r9
	setx	0xe12cef396f87fd54, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e97c3f04d4, %r1, %r9
	setx	0xe7b79748a56e0ca8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f048efae61, %r1, %r9
	setx	0x411cec1b59828bf1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800eca699a, %r1, %r9
	setx	0xb633e3e325e6bf5e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fd4a6e4, %r1, %r9
	setx	0x220bb1549f0ec088, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c2bce11cc0, %r1, %r9
	setx	0x64d58b1a6d58254a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dc6bc53c80, %r1, %r9
	setx	0x5dac1b1fa89b0e16, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e502eab8e8, %r1, %r9
	setx	0x3d5178bda0048a15, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f8c904cfc6, %r1, %r9
	setx	0x12931fab4aeff3e2, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ee48780, %r1, %r9
	setx	0xceb7a9af1d28244c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ff0a600, %r1, %r9
	setx	0x379139729156f591, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ccfc479adc, %r1, %r9
	setx	0x5190ecd18f3b19ea, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000dfd3930534, %r1, %r9
	setx	0xcbef008486257083, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000edd7908d14, %r1, %r9
	setx	0x14db32bc075a93b8, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f22fefe9d4, %r1, %r9
	setx	0x8fddb2fdf1d7ebc7, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e6852d0, %r1, %r9
	setx	0x0ec4b97200efe5e9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f008f88, %r1, %r9
	setx	0xd22467dc3fac33e3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c922e19e60, %r1, %r9
	setx	0xb6ae3b8863211f69, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d1f2400058, %r1, %r9
	setx	0x6751825cea239dd9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ef0222f408, %r1, %r9
	setx	0x18e3eac735081d73, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f47416fb18, %r1, %r9
	setx	0x7396f438c3834f04, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e0c7169, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fa241067b4, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e8d7ef9f3a, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000df8841c50d, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c58d4acd72, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e49714bdf0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fe75c485ac, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e1d692b78c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c34de1c490, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ef101bf, %r1, %r9
	setx	0x51eac62c6d148c7e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f9206ed, %r1, %r9
	setx	0xbf92b58c193afa71, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c60f92a83b, %r1, %r9
	setx	0x07e811ca1eb50470, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d42f5ba0e8, %r1, %r9
	setx	0x6495acd6c9e38982, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e928b30956, %r1, %r9
	setx	0x948df526700f07e9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f0cf24ca60, %r1, %r9
	setx	0x8f8144d643f6aec1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e4fc488, %r1, %r9
	setx	0x9ba9d2e2305e4703, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f4c281e, %r1, %r9
	setx	0xd4fdcb32bd00d5ad, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c5763dd14a, %r1, %r9
	setx	0x6d22a92908ca4d6c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d117922634, %r1, %r9
	setx	0x3b5c70c436e0e5e0, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e2918e8adc, %r1, %r9
	setx	0x77ded3bb6bb7b77a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fec947205c, %r1, %r9
	setx	0x8c7a72e9353006d3, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e1516ac, %r1, %r9
	setx	0xe471c5cc851ccecf, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fea6118, %r1, %r9
	setx	0x1ae05ddebd2c5e21, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ca6efece88, %r1, %r9
	setx	0x231d80a3c248f402, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000db0d1fb578, %r1, %r9
	setx	0xe02233579e2d48a7, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ee95c7a384, %r1, %r9
	setx	0xc47cd43081f5744e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fcb2b51354, %r1, %r9
	setx	0xe426a3d3d7e623ca, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e36e798, %r1, %r9
	setx	0x3b22a6cb6368c369, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f1ab2a8, %r1, %r9
	setx	0x633d81aad8195a47, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c973901df0, %r1, %r9
	setx	0xd21727bdd8393543, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d3a146aa50, %r1, %r9
	setx	0x0bd3e909a9616931, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e16e4b2328, %r1, %r9
	setx	0x8b49afaa3c7f87bc, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8afd4d2e0, %r1, %r9
	setx	0x7a730b8c4bde9814, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ee23f61831, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d8ca505ce5, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c261012a57, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f5425ca, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e5f82c5, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fe6cdc9b62, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e94c9db19c, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c9c4f254b2, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fc1293e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fe9fc38, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000deb798fc28, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c740a865c0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e0bc75c, %r1, %r9
	setx	0xdd4ccd994e3e84e2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f2ae2e3, %r1, %r9
	setx	0xbb272b2d9db88dd7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ce2bf5560a, %r1, %r9
	setx	0x5bad5e2d807c667b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dfd97f8970, %r1, %r9
	setx	0x7d4cc95eae419f58, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000eee21c915c, %r1, %r9
	setx	0x85f0982a1b23fd25, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fc131a5c4d, %r1, %r9
	setx	0x4f2541add823fd12, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e4f5a88, %r1, %r9
	setx	0xca50bfd782fb99f8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f70f01a, %r1, %r9
	setx	0x4674899f4928d4ef, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cc80a046a0, %r1, %r9
	setx	0x7ad55b888be33746, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000daa0137a1a, %r1, %r9
	setx	0x1fb503a3f43968f3, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000eee062abb4, %r1, %r9
	setx	0x475abbb27a832b41, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fa53ec2e9a, %r1, %r9
	setx	0x874ba981b2597ef5, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ee41c88, %r1, %r9
	setx	0x6a2a6cd622d05599, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f389ce0, %r1, %r9
	setx	0x61f31ba98b866ee3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c370d91fe0, %r1, %r9
	setx	0x09276f6e71bf5340, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d4907a4804, %r1, %r9
	setx	0xe25cb4dad626537e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e748cd1c14, %r1, %r9
	setx	0xcdbc7bccd3942eae, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f88c2c0878, %r1, %r9
	setx	0x3760d0dfc90769bc, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e296328, %r1, %r9
	setx	0xfa3d95c3dba54e42, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f2c4070, %r1, %r9
	setx	0xe65696465d7f36c9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c8eb335d98, %r1, %r9
	setx	0x7960bb2f95602e73, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d256779800, %r1, %r9
	setx	0x1443c66e15962ce2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e3fd0ef5e8, %r1, %r9
	setx	0x7f2df265865c70e9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fae05cf2b8, %r1, %r9
	setx	0xa78f1d0dfb0c85b9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000eb2caad385, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d9d4e61a98, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c45b1a6663, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f2e802c, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f8fccbad8c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e59d2949f8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d655353db8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000cc2628fe18, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800ff23dac, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800ebf35b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f04df397d0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e1751d8a20, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d049e6e6e0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c0214ce850, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e7d3b87, %r1, %r9
	setx	0xa765ff9879a4aabb, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fb42afc, %r1, %r9
	setx	0xdf959473d9d09cd3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cb2b69713a, %r1, %r9
	setx	0xc91f149b5408b2a3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d9e754561b, %r1, %r9
	setx	0x1ebbef5e1381ada4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e05ff8ccf5, %r1, %r9
	setx	0xfb44f3aca045b547, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f4c70abb0a, %r1, %r9
	setx	0x71f89329a1b37fc9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e998ac8, %r1, %r9
	setx	0x4973d92c068d4c57, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f62ec9a, %r1, %r9
	setx	0xaaaf89ed73c613d4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c451f4d3c8, %r1, %r9
	setx	0x77c118d33c4d3396, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d63b9f2b04, %r1, %r9
	setx	0x4663211746e525fb, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e68fdb90f6, %r1, %r9
	setx	0xd343096b583c6299, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fe473f6b42, %r1, %r9
	setx	0xe3dc068b84dad5e3, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e484c90, %r1, %r9
	setx	0x70a0adc03a3de684, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f598704, %r1, %r9
	setx	0x3703d2986edb5bfa, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c253234d4c, %r1, %r9
	setx	0xd54fc3922547081d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000da45b0f0b0, %r1, %r9
	setx	0x505ceaa89902d8a6, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ed18f36944, %r1, %r9
	setx	0x5a814ee8281514ee, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f0d2e008b8, %r1, %r9
	setx	0x988a1bf42b2ed1c4, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e5f1a68, %r1, %r9
	setx	0x176b9ff426b737b6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f862e80, %r1, %r9
	setx	0x7a1b8fdaf324da92, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cbb1e9dd00, %r1, %r9
	setx	0x6cf875aeb634bbd9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d96b81a348, %r1, %r9
	setx	0xfbd67b679593402c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000eb2a6621f0, %r1, %r9
	setx	0x7659f9c48a4143f0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f4c9476398, %r1, %r9
	setx	0x3ce244a017b92d9e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e74e4072a3, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d30eeb6baf, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000cfda639982, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f0e808f, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e211f78, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f541340, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ffb8940, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e1460d8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fa20def9ac, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ee1b6b9e78, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d27289eb40, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c42a8e1478, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e022a399c8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000dd66deda70, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e1b8f92, %r1, %r9
	setx	0xa2e49968ccf7c2be, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f247871, %r1, %r9
	setx	0x4a321b19d20c8bc2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c2b0476f22, %r1, %r9
	setx	0x86a2d69844f0c8c2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d04e4df2fe, %r1, %r9
	setx	0x37c1ea679754f962, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e3d46fcb49, %r1, %r9
	setx	0xfbccb8ffec855d2e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f64fa8a339, %r1, %r9
	setx	0x06f39da3d84cba84, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e2021fe, %r1, %r9
	setx	0xe5c8fac90ba03456, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ff989d2, %r1, %r9
	setx	0xdabe23f454dcc8da, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c8d36522fa, %r1, %r9
	setx	0x17c4b94b60084b60, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d87973cfa8, %r1, %r9
	setx	0xc8b0cc83adb284b7, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ef09082838, %r1, %r9
	setx	0xfa34a5d4590c1a86, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fe0e3c1482, %r1, %r9
	setx	0x77da647467b888fb, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e12cfd8, %r1, %r9
	setx	0x44e73934462bcfaa, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f95f624, %r1, %r9
	setx	0xdbf2c84eafedaa4d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c21f3bf5a4, %r1, %r9
	setx	0x9e32c48881cbe900, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d8d4276d18, %r1, %r9
	setx	0x944e7dd919f8ce26, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e3b2af855c, %r1, %r9
	setx	0x6cb945aa72e87138, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f616583ae8, %r1, %r9
	setx	0x2383386dc1125d05, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800efe9338, %r1, %r9
	setx	0x0c52a5f7a7ee0132, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fed9d18, %r1, %r9
	setx	0xf57efdf5476208fe, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cead91d5e0, %r1, %r9
	setx	0xe9f5ed42f7400084, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d39a9cafa0, %r1, %r9
	setx	0xe2fa045bfe1267b7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000eb7a817df8, %r1, %r9
	setx	0x062ed24e637ba501, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f2727e5df8, %r1, %r9
	setx	0x9cd10df30ea03b01, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f2ac8a6, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e3f13ac, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f6aa253764, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e8c841dc8c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d5872e9fe4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000cd228448b4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f131044, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e5b1748, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fa27b9f17c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ee0a70fe70, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fa51ce54e8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000ee2c7fb828, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000daec7dd4f8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c5bf543d00, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f44e280, %r1, %r12
	ldx	[%r12], %r11


done;

h_bad_end:
        ta T_BAD_TRAP

attr_data {
        Name=.MY_HYP_SEC,
        hypervisor
        }

.global my_hyp_data
.align 0x40
my_hyp_data:
        .skip 0x200

.end

#if 0
!!# /*
!!#  */
!!# 
!!# %%section c_declarations
!!# 
!!# 
!!#   uint64 b_DATA_ARRAY[12000], h_DATA_ARRAY[12000], w_DATA_ARRAY[12000], x_DATA_ARRAY[12000];
!!#   uint64 b_ADDR_ARRAY[12000], h_ADDR_ARRAY[12000], w_ADDR_ARRAY[12000], x_ADDR_ARRAY[12000];
!!#   uint64 data_st = 0;
!!#   uint64 addr_st = 0;
!!#   uint64 noise_data_st = 0;
!!#   uint64 data_ld = 0;
!!#   int wr_cntr = 0;
!!#   int rd_cntr = 0;
!!#   int b_wr_cntr = 0;
!!#   int b_rd_cntr = 0;
!!#   int h_wr_cntr = 0;
!!#   int h_rd_cntr = 0;
!!#   int w_wr_cntr = 0;
!!#   int w_rd_cntr = 0;
!!#   int x_wr_cntr = 0;
!!#   int x_rd_cntr = 0;
!!#   int a_addr_sel = 0;
!!#   int a_wr_cntr = 0;
!!#   int a_rd_cntr = 0;
!!#   int b_a_wr_cntr = 0;
!!#   int b_a_rd_cntr = 0;
!!#   int h_a_wr_cntr = 0;
!!#   int h_a_rd_cntr = 0;
!!#   int w_a_wr_cntr = 0;
!!#   int w_a_rd_cntr = 0;
!!#   int x_a_wr_cntr = 0;
!!#   int x_a_rd_cntr = 0;
!!#   int i =0;
!!#   uint64 jbi1, jbi2, jbi3, jbi4, jbi5, jbi6, jbi_addr;
!!#   int addr_sel = 0;
!!#   int store_addr = 0;
!!#   int rnd_cnt = 0;
!!# 
!!#   int sjm0_w_mask = 0, sjm1_w_mask = 0;
!!#   int m_tmp = 0;
!!#   uint64 mask = 0;
!!#   int sjm_rd0 = 0, sjm_wr0 = 0, sjm_rd1 = 0, sjm_wr1 = 0;
!!#   int sjm4_dat = 0, sjm5_dat = 0, sjm4_cnt = 0, sjm5_cnt = 0;
!!#   int sjm0_data[8][16];
!!#   int sjm1_data[8][16];
!!#   uint64 sjm0_addr[8], sj4_ad = 0;
!!#   uint64 sjm1_addr[8], sj5_ad = 0;
!!# 
!!#   int sjm_rd0_io = 0, sjm_wr0_io = 0, sjm_rd1_io = 0, sjm_wr1_io = 0;
!!#   int sjm4_cnt_io = 0, sjm5_cnt_io = 0;
!!#   int sjm0_data_io[8][16];
!!#   int sjm1_data_io[8][16];
!!#   uint64 sjm0_addr_io[8];
!!#   uint64 sjm1_addr_io[8];
!!# 
!!#   int sjm_rd0_io1 = 0, sjm_wr0_io1 = 0, sjm_rd1_io1 = 0, sjm_wr1_io1 = 0;
!!#   int sjm4_cnt_io1 = 0, sjm5_cnt_io1 = 0;
!!#   int sjm0_data_io1[8][16];
!!#   int sjm1_data_io1[8][16];
!!#   uint64 sjm0_addr_io1[8];
!!#   uint64 sjm1_addr_io1[8];
!!# 
!!#   int sjm0_w_mask_m_io = 0, sjm1_w_mask_m_io = 0;
!!#   int sjm_rd0_m_io = 0, sjm_wr0_m_io = 0, sjm_rd1_m_io = 0, sjm_wr1_m_io = 0;
!!#   int sjm4_cnt_m_io = 0, sjm5_cnt_m_io = 0;
!!#   int sjm0_data_m_io[8][16];
!!#   int sjm1_data_m_io[8][16];
!!#   uint64 sjm0_addr_m_io[8];
!!#   uint64 sjm1_addr_m_io[8];
!!#   int     rnd_n,b_sz;
!!# 
!!# #define MY_HYP_SEC	0
!!# 
!!# %%
!!# %%section control
!!# 
!!# %%
!!# %%section init
!!# {
!!# 
!!# 
!!#   IJ_set_rvar ("diag.j", 100, rv_0, "{11}");
!!# 
!!#   IJ_set_rvar ("diag.j", 103, Rv_rand64, "64'hrrrr rrrr rrrr rrrr");
!!#   IJ_set_rvar ("diag.j", 104, Rv_Simm13, "13'b0 0000 00rr r000");
!!#   IJ_set_rvar ("diag.j", 105, Rv_addr_sel, "3'brrr");
!!# 
!!#   IJ_set_rvar ("diag.j", 109, Rv_memaddr_pattern_dma,
!!#         "24'{0},"
!!# 
!!#         "20'b 000r rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rr00 0000,");
!!# 
!!#   ! only 60* or 61*
!!#   IJ_set_rvar ("diag.j", 118, Rv_memaddr_pattern_io,
!!#         "4'{0},"
!!# 
!!#         "20'b 0000 0000 0000 0000 0110,"
!!#         "20'b 000r rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rr00 0000,");
!!# 
!!#   IJ_set_rvar ("diag.j", 127, Rv_rand32, "32'hrrrr rrrr");
!!#   IJ_set_rvar ("diag.j", 128, Rv_rand_mask, "32'h0000 rrrr");
!!# 
!!#   ! Define address patterns for all the various address
!!#   ! spaces in JBI
!!# 
!!#   ! 80_1000_0000 - 80_FFFF_FFFF (Should not be 80_0*)
!!#   IJ_set_rvar ("diag.j", 134, Rv_jbiaddr_pattern0,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 rrr1 rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! 80_0E00_0000 - 80_0EFF_FFFF
!!#   IJ_set_rvar ("diag.j", 143, Rv_jbiaddr_pattern1,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 0000 1110 rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! 80_0F00_0000 - 80_0FFF_FFFF
!!#   IJ_set_rvar ("diag.j", 153, Rv_jbiaddr_pattern2,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 0000 1111 rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! C0_0000_0000 - CF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 163, Rv_jbiaddr_pattern3,
!!#         "24'{0},"
!!# 
!!#         "20'b 1100 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! D0_0000_0000 - DF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 173, Rv_jbiaddr_pattern4,
!!#         "24'{0},"
!!# 
!!#         "20'b 1101 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! E0_0000_0000 - EF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 183, Rv_jbiaddr_pattern5,
!!#         "24'{0},"
!!# 
!!#         "20'b 1110 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! F0_0000_0000 - FE_FFFF_FFFF ( Should not be FF*)
!!#   IJ_set_rvar ("diag.j", 193, Rv_jbiaddr_pattern6,
!!#         "24'{0},"
!!# 
!!#         "20'b 1111 rrr0 rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! FF_F000_0000 - FF_FFFF_FFFF 
!!#   IJ_set_rvar ("diag.j", 203, Rv_ssiaddr_pattern,
!!#         "24'{0},"
!!# 
!!#         "20'b 1111 1111 1111 rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr r000,");
!!# 
!!#   ! BYTE ALIGNED
!!# 
!!#   ! 80_1000_0000 - 80_FFFF_FFFF (Should not be 80_0*)
!!#   IJ_set_rvar ("diag.j", 214, Rv_jbi_b_addr_pattern0,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 rrr1 rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrrr,");
!!# 
!!#   ! 80_0E00_0000 - 80_0EFF_FFFF
!!#   IJ_set_rvar ("diag.j", 223, Rv_jbi_b_addr_pattern1,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 0000 1110 rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrrr,");
!!# 
!!#   ! 80_0F00_0000 - 80_0FFF_FFFF
!!#   IJ_set_rvar ("diag.j", 233, Rv_jbi_b_addr_pattern2,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 0000 1111 rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrrr,");
!!# 
!!#   ! C0_0000_0000 - CF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 243, Rv_jbi_b_addr_pattern3,
!!#         "24'{0},"
!!# 
!!#         "20'b 1100 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrrr,");
!!# 
!!#   ! D0_0000_0000 - DF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 253, Rv_jbi_b_addr_pattern4,
!!#         "24'{0},"
!!# 
!!#         "20'b 1101 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrrr,");
!!# 
!!#   ! E0_0000_0000 - EF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 263, Rv_jbi_b_addr_pattern5,
!!#         "24'{0},"
!!# 
!!#         "20'b 1110 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrrr,");
!!# 
!!#   ! F0_0000_0000 - FE_FFFF_FFFF ( Should not be FF*)
!!#   IJ_set_rvar ("diag.j", 273, Rv_jbi_b_addr_pattern6,
!!#         "24'{0},"
!!# 
!!#         "20'b 1111 rrr0 rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrrr,");
!!# 
!!#   ! FF_F000_0000 - FF_FFFF_FFFF 
!!#   IJ_set_rvar ("diag.j", 283, Rv_ssi_b_addr_pattern,
!!#         "24'{0},"
!!# 
!!#         "20'b 1111 1111 1111 rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrrr,");
!!# 
!!#   ! HWORD ADDRESS
!!# 
!!#   ! 80_1000_0000 - 80_FFFF_FFFF (Should not be 80_0*)
!!#   IJ_set_rvar ("diag.j", 295, Rv_jbi_h_addr_pattern0,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 rrr1 rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrr0,");
!!# 
!!#   ! 80_0E00_0000 - 80_0EFF_FFFF
!!#   IJ_set_rvar ("diag.j", 304, Rv_jbi_h_addr_pattern1,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 0000 1110 rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrr0,");
!!# 
!!#   ! 80_0F00_0000 - 80_0FFF_FFFF
!!#   IJ_set_rvar ("diag.j", 314, Rv_jbi_h_addr_pattern2,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 0000 1111 rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrr0,");
!!# 
!!#   ! C0_0000_0000 - CF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 324, Rv_jbi_h_addr_pattern3,
!!#         "24'{0},"
!!# 
!!#         "20'b 1100 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrr0,");
!!# 
!!#   ! D0_0000_0000 - DF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 334, Rv_jbi_h_addr_pattern4,
!!#         "24'{0},"
!!# 
!!#         "20'b 1101 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrr0,");
!!# 
!!#   ! E0_0000_0000 - EF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 344, Rv_jbi_h_addr_pattern5,
!!#         "24'{0},"
!!# 
!!#         "20'b 1110 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrr0,");
!!# 
!!#   ! F0_0000_0000 - FE_FFFF_FFFF ( Should not be FF*)
!!#   IJ_set_rvar ("diag.j", 354, Rv_jbi_h_addr_pattern6,
!!#         "24'{0},"
!!# 
!!#         "20'b 1111 rrr0 rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrr0,");
!!# 
!!#   ! FF_F000_0000 - FF_FFFF_FFFF 
!!#   IJ_set_rvar ("diag.j", 364, Rv_ssi_h_addr_pattern,
!!#         "24'{0},"
!!# 
!!#         "20'b 1111 1111 1111 rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rrr0,");
!!# 
!!#   ! WORD Address
!!# 
!!#   ! 80_1000_0000 - 80_FFFF_FFFF (Should not be 80_0*)
!!#   IJ_set_rvar ("diag.j", 375, Rv_jbi_w_addr_pattern0,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 rrr1 rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rr00,");
!!# 
!!#   ! 80_0E00_0000 - 80_0EFF_FFFF
!!#   IJ_set_rvar ("diag.j", 384, Rv_jbi_w_addr_pattern1,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 0000 1110 rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rr00,");
!!# 
!!#   ! 80_0F00_0000 - 80_0FFF_FFFF
!!#   IJ_set_rvar ("diag.j", 394, Rv_jbi_w_addr_pattern2,
!!#         "24'{0},"
!!# 
!!#         "20'b 1000 0000 0000 1111 rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rr00,");
!!# 
!!#   ! C0_0000_0000 - CF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 404, Rv_jbi_w_addr_pattern3,
!!#         "24'{0},"
!!# 
!!#         "20'b 1100 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rr00,");
!!# 
!!#   ! D0_0000_0000 - DF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 414, Rv_jbi_w_addr_pattern4,
!!#         "24'{0},"
!!# 
!!#         "20'b 1101 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rr00,");
!!# 
!!#   ! E0_0000_0000 - EF_FFFF_FFFF
!!#   IJ_set_rvar ("diag.j", 424, Rv_jbi_w_addr_pattern5,
!!#         "24'{0},"
!!# 
!!#         "20'b 1110 rrrr rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rr00,");
!!# 
!!#   ! F0_0000_0000 - FE_FFFF_FFFF ( Should not be FF*)
!!#   IJ_set_rvar ("diag.j", 434, Rv_jbi_w_addr_pattern6,
!!#         "24'{0},"
!!# 
!!#         "20'b 1111 rrr0 rrrr rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rr00,");
!!# 
!!#   ! FF_F000_0000 - FF_FFFF_FFFF 
!!#   IJ_set_rvar ("diag.j", 444, Rv_ssi_w_addr_pattern,
!!#         "24'{0},"
!!# 
!!#         "20'b 1111 1111 1111 rrrr rrrr,"
!!#         "20'b rrrr rrrr rrrr rrrr rr00,");
!!# 
!!#   IJ_set_ropr_fld    ("diag.j", 452, ijdefault, Ft_Rs1, "{9}");  ! BASE
!!#   IJ_set_ropr_fld    ("diag.j", 453, ijdefault, Ft_Rs2, "{8}");
!!#   IJ_set_ropr_fld    ("diag.j", 454, ijdefault, Ft_Rd, "{16..23}");
!!# 
!!#   !IJ_set_ropr_fld    (ijdefault, Ft_Simm13, "13'b0 0000 0000 0000");
!!#   IJ_set_ropr_fld    ("diag.j", 457, ijdefault, Ft_Simm13, "13'b0 00rr 0000 0000");
!!# 
!!#   IJ_bind_file_group("diag.j", 460, sjm_4,"sjm_4.cmd", NULL);;
!!#   IJ_bind_file_group("diag.j", 461, sjm_5,"sjm_5.cmd", NULL);;
!!# 
!!#   IJ_bind_thread_group("diag.j", 464, th_M, 0x1);
!!# 
!!#   IJ_printf ("diag.j", 466, sjm_4, "CONFIG id=28 iosyncadr=0x7CF00BEEF00\n");
!!#   IJ_printf ("diag.j", 467, sjm_4, "TIMEOUT 10000000\n");
!!#   IJ_printf ("diag.j", 468, sjm_4, "IOSYNC\n");
!!# 
!!#   IJ_printf ("diag.j", 470, sjm_4, "#==================================================\n");
!!#   IJ_printf ("diag.j", 472, sjm_4, "#==================================================\n");
!!#   IJ_printf ("diag.j", 473, sjm_4, "\n\nLABEL_0:\n");
!!# 
!!#   IJ_printf ("diag.j", 475, sjm_5, "CONFIG id=30 iosyncadr=0x7EF00BEEF00\n");
!!#   IJ_printf ("diag.j", 476, sjm_5, "TIMEOUT 10000000\n");
!!#   IJ_printf ("diag.j", 477, sjm_5, "IOSYNC\n");
!!#   IJ_printf ("diag.j", 478, sjm_5, "#==================================================\n");
!!#   IJ_printf ("diag.j", 480, sjm_5, "#==================================================\n");
!!#   IJ_printf ("diag.j", 481, sjm_5, "\n\nLABEL_0:\n");
!!# 
!!#   !IJ_printf (th_M, "\tmov\t0, %%r8\n");
!!# 
!!# }
!!# 
!!# %%
!!# %%section finish
!!# {
!!# 
!!# 
!!# !  IJ_printf(th_M,"\tnop\n\tta T_GOOD_TRAP\n\tnop\n");
!!# !  IJ_printf(th_M,"\ttest_fail:\n\tta T_BAD_TRAP\n\tnop\n");
!!#   IJ_printf ("diag.j", 500, sjm_4, "\n\nBA LABEL_0\n");
!!#   IJ_printf ("diag.j", 501, sjm_5, "\n\nBA LABEL_0\n");
!!#   IJ_th_start ("diag.j", 502,Seq_Start, NULL, 2);
!!# 
!!# }
!!# 
!!# 
!!# 
!!# %%
!!# %%section map
!!# 
!!# 
!!# 
!!# 
!!# 
!!# %%
!!# %%section grammar
!!# 
!!# 
!!# inst_block: inst_type
!!#             | inst_block inst_type
!!# 	{
!!# 		IJ_generate ("diag.j", 630, th_M, $2);
!!# 	}
!!# ;
!!# 
!!# inst_type: set_reg9  |
!!#            sjm4      |
!!#            sjm5
!!# 
!!# {
!!# 		!IJ_generate (th_all, $2);
!!# 		!IJ_generate (th_all, $3);
!!# 		!IJ_generate (th_all, $4);
!!# }
!!# 
!!# ;
!!# 
!!# sjm4: set_sjm4_wr_b | set_sjm4_rd_b |  set_sjm4_wr_b_io | set_sjm4_rd_b_io | set_sjm4_wr_io | set_sjm4_rd_io | set_sjm4_wr_m | set_sjm4_wr_m_io | set_sjm4_rd_m_io 
!!# ;
!!# 
!!# set_sjm4_wr_b : mSET_SJM4_WR_B
!!#                 {
!!# 
!!#                   if (sjm4_cnt < 8) { 
!!#                    IJ_printf ("diag.j", 658, sjm_4, "\n");
!!#                      sjm4_cnt++;
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 661, Rv_memaddr_pattern_dma);
!!#                      sjm0_addr[sjm_wr0] = sj4_ad; 
!!#                      IJ_printf ("diag.j", 663, sjm_4, "WRITEBLK  0x%016llx +\n",sj4_ad);
!!#                      IJ_update_rvar("diag.j", 664, Rv_memaddr_pattern_dma);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          !IJ_printf (sjm_4, "# debug %d \n",i);
!!#                          sjm0_data[sjm_wr0][i] = IJ_get_rvar_val32("diag.j", 668, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 669, Rv_rand32);
!!#                          if (i%4 == 0) {IJ_printf ("diag.j", 670, sjm_4, "        "); }
!!#                          IJ_printf ("diag.j", 671, sjm_4, "0x%08x ",sjm0_data[sjm_wr0][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 673, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 674, sjm_4, "+\n");
!!#                           }
!!#                         }
!!#                       if (sjm_wr0 == 7) sjm_wr0 = 0; else sjm_wr0++;
!!#                     }
!!#                 }
!!# 
!!# ;  
!!# 
!!# set_sjm4_rd_b : mSET_SJM4_RD_B
!!#                 {
!!# 
!!#                   if (sjm4_cnt > 0) { 
!!#                    IJ_printf ("diag.j", 687, sjm_4, "\n");
!!#                      sjm4_cnt--;
!!# 
!!#                      sj4_ad = sjm0_addr[sjm_rd0];
!!#                      IJ_printf ("diag.j", 692, sjm_4, "READBLK  0x%016llx +\n",sj4_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 696, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 697, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 699, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 700, sjm_4, "+\n");
!!#                            }
!!#                         }
!!#                       if (sjm_rd0 == 7) sjm_rd0 = 0; else sjm_rd0++;
!!#                     }
!!#                 }
!!# 
!!# ;  
!!# 
!!# set_sjm4_wr_m : mSET_SJM4_WR_M
!!#                 {
!!# 
!!#                   if (sjm4_cnt > 0) { 
!!#                    IJ_printf ("diag.j", 714, sjm_4, "\n");
!!#                      !sjm4_cnt--;
!!# 
!!#  		     sjm0_w_mask =  IJ_get_rvar_val32("diag.j", 718, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 719, Rv_rand_mask);
!!# 
!!#                       m_tmp = sjm0_w_mask;
!!#                       mask  = 0;
!!#                      for (i=0;i<16;i++) {
!!#                       if (m_tmp & 0x1 ) {
!!#                         mask = mask << 4;
!!#                         mask = mask | 0xf;
!!#                         } else {
!!#                         mask = mask << 4;
!!#                        }
!!# 
!!#                       m_tmp = m_tmp >> 1;
!!#                      }
!!# 
!!#                      sj4_ad = sjm0_addr[sjm_rd0];
!!#                      IJ_printf ("diag.j", 736, sjm_4, "WRITEMSK  0x%016llx 0x%016llx +\n",sj4_ad,mask);
!!# 
!!#                       m_tmp = sjm0_w_mask;
!!#                       for (i=0;i<16;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm0_data[sjm_rd0][i] = IJ_get_rvar_val32("diag.j", 741, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 742, Rv_rand32);
!!#                          sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 744, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 745, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 747, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 748, sjm_4, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          sjm4_dat = 0;
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 753, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 754, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 756, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 757, sjm_4, "+\n");
!!#                            }
!!#                         }
!!#                         m_tmp = m_tmp >> 1;
!!#                        }
!!#                       !if (sjm_rd0 == 7) sjm_rd0 = 0; else sjm_rd0++;
!!#                     }
!!#                 }
!!# 
!!# ;  
!!# 
!!# set_sjm4_wr_b_io : mSET_SJM4_WR_B_IO
!!#                 {
!!# 
!!#                   if (sjm4_cnt_io < 8) { 
!!#                    IJ_printf ("diag.j", 774, sjm_4, "\n");
!!#                      sjm4_cnt_io++;
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 777, Rv_memaddr_pattern_io);
!!#                      sjm0_addr_io[sjm_wr0_io] = sj4_ad; 
!!#                      IJ_printf ("diag.j", 779, sjm_4, "WRITEBLKIO  0x%016llx +\n",sj4_ad);
!!#                      IJ_update_rvar("diag.j", 780, Rv_memaddr_pattern_io);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          !IJ_printf (sjm_4, "# debug %d \n",i);
!!#                          sjm0_data_io[sjm_wr0_io][i] = IJ_get_rvar_val32("diag.j", 784, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 785, Rv_rand32);
!!#                          if (i%4 == 0) {IJ_printf ("diag.j", 786, sjm_4, "        "); }
!!#                          IJ_printf ("diag.j", 787, sjm_4, "0x%08x ",sjm0_data_io[sjm_wr0_io][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 789, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 790, sjm_4, "+\n");
!!#                           }
!!#                         }
!!#                       if (sjm_wr0_io == 7) sjm_wr0_io = 0; else sjm_wr0_io++;
!!#                     }
!!#                 }
!!# 
!!# ;  
!!# 
!!# set_sjm4_rd_b_io : mSET_SJM4_RD_B_IO
!!#                 {
!!# 
!!#                   if (sjm4_cnt_io > 0) { 
!!#                    IJ_printf ("diag.j", 803, sjm_4, "\n");
!!#                      sjm4_cnt_io--;
!!# 
!!#                      sj4_ad = sjm0_addr_io[sjm_rd0_io];
!!#                      IJ_printf ("diag.j", 808, sjm_4, "READBLKIO  0x%016llx +\n",sj4_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm4_dat = sjm0_data_io[sjm_rd0_io][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 812, sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 813, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 815, sjm_4, "\n"); else 
!!#                             IJ_printf ("diag.j", 816, sjm_4, "+\n");
!!#                            }
!!#                         }
!!#                       if (sjm_rd0_io == 7) sjm_rd0_io = 0; else sjm_rd0_io++;
!!#                     }
!!#                 }
!!# 
!!# ;  
!!# 
!!# set_sjm4_wr_io : mSET_SJM4_WR_IO
!!#                 {
!!# 
!!#                   if (sjm4_cnt_io1 < 8) { 
!!#                    IJ_printf ("diag.j", 831, sjm_4, "\n");
!!#                      sjm4_cnt_io1++;
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 834, Rv_memaddr_pattern_io);
!!#                      sjm0_addr_io1[sjm_wr0_io1] = sj4_ad; 
!!#                      IJ_printf ("diag.j", 836, sjm_4, "WRITEIO  0x%016llx ",sj4_ad);
!!#                      IJ_update_rvar("diag.j", 837, Rv_memaddr_pattern_io);
!!# 
!!#                      rnd_n = random()%5;
!!#                      switch (rnd_n) {
!!#                        case 0 : b_sz = 4; break;
!!#                        case 1 : b_sz = 8; break;
!!#                        !case 0 : b_sz = 1; break;
!!#                        !case 1 : b_sz = 2; break;
!!#                        case 2 : b_sz = 4; break;
!!#                        case 3 : b_sz = 8; break;
!!#                        default :b_sz = 16; break;
!!#                       } 
!!# 
!!#                      sjm0_data_io1[sjm_wr0_io1][15] = b_sz; ! byte size in entry 15, for read
!!# 
!!#                       IJ_printf ("diag.j", 852, sjm_4, "%d ",b_sz);
!!#                       for (i=0;i<4;i++) { 
!!#                          !IJ_printf (sjm_4, "# debug %d \n",i);
!!#                          sjm0_data_io1[sjm_wr0_io1][i] = IJ_get_rvar_val32("diag.j", 855, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 856, Rv_rand32);
!!#                          IJ_printf ("diag.j", 857, sjm_4, "0x%08x ",sjm0_data_io1[sjm_wr0_io1][i]);
!!#                          if((i==0) && ((b_sz == 1) | (b_sz == 2) | (b_sz == 4)) ) break; 
!!#                          if((i==1) && (b_sz == 8)) break; 
!!#                       }
!!#                       if ( random()%2 == 0) {
!!#                       IJ_printf ("diag.j", 862, sjm_4, "\n");
!!#                       } else {
!!#                       IJ_printf ("diag.j", 864, sjm_4, "\n");
!!#                       }
!!# 
!!#                       if (sjm_wr0_io1 == 7) sjm_wr0_io1 = 0; else sjm_wr0_io1++;
!!#                     }
!!#                 }
!!# 
!!# ;  
!!# 
!!# set_sjm4_rd_io : mSET_SJM4_RD_IO
!!#                 {
!!# 
!!#                   if (sjm4_cnt_io1 > 0) {
!!#                    IJ_printf ("diag.j", 878, sjm_4, "\n");
!!#                      sjm4_cnt_io1--;
!!# 
!!#                      sj4_ad = sjm0_addr_io1[sjm_rd0_io1];
!!#                      b_sz   = sjm0_data_io1[sjm_rd0_io1][15];
!!#                      IJ_printf ("diag.j", 884, sjm_4, "READIO  0x%016llx %d ",sj4_ad,b_sz);
!!# 
!!#                       for (i=0;i<4;i++) {
!!#                          sjm4_dat = sjm0_data_io1[sjm_rd0_io1][i];
!!#                          IJ_printf ("diag.j", 888, sjm_4, "0x%08x ",sjm4_dat);
!!#                          if((i==0) && ((b_sz == 1) | (b_sz == 2) | (b_sz == 4)) ) break;
!!#                          if((i==1) && (b_sz == 8)) break;
!!#                         }
!!#                       if (sjm_rd0_io1 == 7) sjm_rd0_io1 = 0; else sjm_rd0_io1++;
!!#                     }
!!#                 }
!!# 
!!# ;
!!# 
!!# set_sjm4_wr_m_io : mSET_SJM4_WR_M_IO
!!#                 {
!!# 
!!#                   if (sjm4_cnt_m_io < 8) { 
!!#                    IJ_printf ("diag.j", 903, sjm_4, "\n");
!!# 
!!#                      sj4_ad =  IJ_get_rvar_val64("diag.j", 905, Rv_memaddr_pattern_io);
!!#                      sjm0_addr_m_io[sjm_wr0_m_io] = sj4_ad; 
!!#                      IJ_update_rvar("diag.j", 907, Rv_memaddr_pattern_io);
!!# 
!!#                      sjm4_cnt_m_io++;
!!# 
!!#  		     sjm0_w_mask_m_io =  IJ_get_rvar_val32("diag.j", 913, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 914, Rv_rand_mask);
!!# 
!!#                       m_tmp = sjm0_w_mask_m_io & 0xf; ! 4 bits * 4 = 16 bit mask
!!#                       mask  = 0;
!!#                      for (i=0;i<4;i++) {
!!#                       if (m_tmp & 0x1 ) {
!!#                         mask = mask << 4;
!!#                         mask = mask | 0xf;
!!#                         } else {
!!#                         mask = mask << 4;
!!#                        }
!!# 
!!#                       m_tmp = m_tmp >> 1;
!!#                      }
!!# 
!!#                      !IJ_printf (sjm_4, "# debug WRITEMSK  0x%016llx 0x%016llx +\n",mask_flip,mask);
!!#                      ! mask_flip = 0;
!!#                      ! for (i=0;i<15;i++) { 
!!#                      !  fl_tmp = mask & 0xf;
!!#                      !  mask_flip = mask_flip | fl_tmp;
!!#                      !  mask_flip = mask_flip << 4;
!!#                      !  mask      = mask      >> 4;
!!#                      ! }
!!#                      !IJ_printf (sjm_4, "# debug WRITEMSK  0x%016llx 0x%016llx +\n",mask_flip,mask);
!!#                      !mask = mask_flip | mask;
!!# 
!!#                      IJ_printf ("diag.j", 941, sjm_4, "WRITEMSKIO  0x%016llx 0x%04x  ",sj4_ad,mask);
!!#                      sjm0_data_m_io[sjm_wr0_m_io][15] = mask; ! data fifo , 15 stores address
!!# 
!!#                       m_tmp = sjm0_w_mask_m_io & 0xf;
!!#                       for (i=0;i<4;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm0_data_m_io[sjm_wr0_m_io][i] = IJ_get_rvar_val32("diag.j", 947, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 948, Rv_rand32);
!!#                          sjm4_dat = sjm0_data_m_io[sjm_wr0_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 951, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                              IJ_printf ("diag.j", 953, sjm_4, "\n"); 
!!#                             !if (i==15 ) IJ_printf (sjm_4, "\n"); else 
!!#                             !IJ_printf (sjm_4, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm4_dat = sjm0_data[sjm_rd0][i];
!!#                          sjm4_dat = 0;
!!#                          sjm0_data_m_io[sjm_wr0_m_io][i] = sjm4_dat;
!!#                          !if (i%4 == 0) IJ_printf (sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 962, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 964, sjm_4, "\n"); 
!!#                             !if (i==15 ) IJ_printf (sjm_4, "\n"); else 
!!#                             !IJ_printf (sjm_4, "+\n");
!!#                            }
!!#                         }
!!#                         m_tmp = m_tmp >> 1;
!!#                        }
!!#                       if (sjm_wr0_m_io == 7) sjm_wr0_m_io = 0; else sjm_wr0_m_io++;
!!#                     }
!!#                 }
!!# 
!!# ;  
!!# 
!!# set_sjm4_rd_m_io : mSET_SJM4_RD_M_IO
!!#                 {
!!# 
!!#                   if (sjm4_cnt_m_io > 0) { 
!!#                    IJ_printf ("diag.j", 982, sjm_4, "\n");
!!#                      sjm4_cnt_m_io--;
!!# 
!!#                      sj4_ad = sjm0_addr_m_io[sjm_rd0_m_io];
!!#                      mask   = sjm0_data_m_io[sjm_rd0_m_io][15];
!!#                      IJ_printf ("diag.j", 988, sjm_4, "READMSKIO   0x%016llx 0x%04llx  ",sj4_ad,mask);
!!# 
!!#                       for (i=0;i<4;i++) { 
!!#                          sjm4_dat = sjm0_data_m_io[sjm_rd0_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_4, "        ");
!!#                          IJ_printf ("diag.j", 993, sjm_4, "0x%08x ",sjm4_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 995, sjm_4, "\n");
!!#                             !if (i==15 ) IJ_printf (sjm_4, "\n"); else 
!!#                             !IJ_printf (sjm_4, "+\n");
!!#                            }
!!#                         }
!!#                       if (sjm_rd0_m_io == 7) sjm_rd0_m_io = 0; else sjm_rd0_m_io++;
!!#                     }
!!#                 }
!!# 
!!# ;  
!!# 
!!# sjm5: set_sjm5_wr_b | set_sjm5_rd_b |  set_sjm5_wr_b_io | set_sjm5_rd_b_io | set_sjm5_wr_io | set_sjm5_rd_io | set_sjm5_wr_m | set_sjm5_wr_m_io | set_sjm5_rd_m_io 
!!# ;
!!# 
!!# set_sjm5_wr_b : mSET_SJM5_WR_B
!!#                 {
!!# 
!!#                   if (sjm5_cnt < 8) { 
!!#                    IJ_printf ("diag.j", 1013, sjm_5, "\n");
!!#                      sjm5_cnt++;
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 1016, Rv_memaddr_pattern_dma);
!!#                      sjm1_addr[sjm_wr1] = sj5_ad; 
!!#                      IJ_printf ("diag.j", 1018, sjm_5, "WRITEBLK  0x%016llx +\n",sj5_ad);
!!#                      IJ_update_rvar("diag.j", 1019, Rv_memaddr_pattern_dma);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm1_data[sjm_wr1][i] = IJ_get_rvar_val32("diag.j", 1022, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1023, Rv_rand32);
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1024, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1025, sjm_5, "0x%08x ",sjm1_data[sjm_wr1][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1027, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1028, sjm_5, "+\n");
!!#                            }
!!#                         }
!!#                       if (sjm_wr1 == 7) sjm_wr1 = 0; else sjm_wr1++;
!!#                     }
!!#                 }
!!# 
!!# ;  
!!# 
!!# set_sjm5_rd_b : mSET_SJM5_RD_B
!!#                 {
!!# 
!!#                   if (sjm5_cnt > 0) { 
!!#                    IJ_printf ("diag.j", 1041, sjm_5, "\n");
!!#                      sjm5_cnt--;
!!# 
!!#                      sj5_ad = sjm1_addr[sjm_rd1];
!!#                      IJ_printf ("diag.j", 1046, sjm_5, "READBLK  0x%016llx +\n",sj5_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1050, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1051, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1053, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1054, sjm_5, "+\n");
!!#                            }
!!#                         }
!!#                       if (sjm_rd1 == 7) sjm_rd1 = 0; else sjm_rd1++;
!!#                     }
!!#                 }
!!# 
!!# ;  
!!# 
!!# set_sjm5_wr_m : mSET_SJM5_WR_M
!!#                 {
!!# 
!!#                   if (sjm5_cnt > 0) { 
!!#                    IJ_printf ("diag.j", 1068, sjm_5, "\n");
!!#                      !sjm4_cnt--;
!!# 
!!#  		     sjm1_w_mask =  IJ_get_rvar_val32("diag.j", 1072, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 1073, Rv_rand_mask);
!!# 
!!#                       m_tmp = sjm1_w_mask;
!!#                       mask  = 0;
!!#                      for (i=0;i<16;i++) {
!!#                       if (m_tmp & 0x1 ) {
!!#                         mask = mask << 4;
!!#                         mask = mask | 0xf;
!!#                         } else {
!!#                         mask = mask << 4;
!!#                        }
!!# 
!!#                       m_tmp = m_tmp >> 1;
!!#                      }
!!# 
!!#                      sj5_ad = sjm1_addr[sjm_rd1];
!!#                      IJ_printf ("diag.j", 1090, sjm_5, "WRITEMSK  0x%016llx 0x%016llx +\n",sj5_ad,mask);
!!# 
!!#                       m_tmp = sjm1_w_mask;
!!#                       for (i=0;i<16;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm1_data[sjm_rd1][i] = IJ_get_rvar_val32("diag.j", 1095, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1096, Rv_rand32);
!!#                          sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1098, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1099, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1101, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1102, sjm_5, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          sjm5_dat = 0;
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1107, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1108, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1110, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1111, sjm_5, "+\n");
!!#                            }
!!#                         }
!!#                         m_tmp = m_tmp >> 1;
!!#                        }
!!#                       !if (sjm_rd1 == 7) sjm_rd1 = 0; else sjm_rd1++;
!!#                     }
!!#                 }
!!# 
!!# ;  
!!# 
!!# set_sjm5_wr_b_io : mSET_SJM5_WR_B_IO
!!#                 {
!!# 
!!#                   if (sjm5_cnt_io < 8) { 
!!#                    IJ_printf ("diag.j", 1128, sjm_5, "\n");
!!#                      sjm5_cnt_io++;
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 1131, Rv_memaddr_pattern_io);
!!#                      sjm1_addr_io[sjm_wr1_io] = sj5_ad; 
!!#                      IJ_printf ("diag.j", 1133, sjm_5, "WRITEBLKIO  0x%016llx +\n",sj5_ad);
!!#                      IJ_update_rvar("diag.j", 1134, Rv_memaddr_pattern_io);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          !IJ_printf (sjm_5, "# debug %d \n",i);
!!#                          sjm1_data_io[sjm_wr1_io][i] = IJ_get_rvar_val32("diag.j", 1138, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1139, Rv_rand32);
!!#                          if (i%4 == 0) {IJ_printf ("diag.j", 1140, sjm_5, "        "); }
!!#                          IJ_printf ("diag.j", 1141, sjm_5, "0x%08x ",sjm1_data_io[sjm_wr1_io][i]);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1143, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1144, sjm_5, "+\n");
!!#                           }
!!#                         }
!!#                       if (sjm_wr1_io == 7) sjm_wr1_io = 0; else sjm_wr1_io++;
!!#                     }
!!#                 }
!!# 
!!# ;  
!!# 
!!# set_sjm5_rd_b_io : mSET_SJM5_RD_B_IO
!!#                 {
!!# 
!!#                   if (sjm5_cnt_io > 0) { 
!!#                    IJ_printf ("diag.j", 1157, sjm_5, "\n");
!!#                      sjm5_cnt_io--;
!!# 
!!#                      sj5_ad = sjm1_addr_io[sjm_rd1_io];
!!#                      IJ_printf ("diag.j", 1162, sjm_5, "READBLKIO  0x%016llx +\n",sj5_ad);
!!# 
!!#                       for (i=0;i<16;i++) { 
!!#                          sjm5_dat = sjm1_data_io[sjm_rd1_io][i];
!!#                          if (i%4 == 0) IJ_printf ("diag.j", 1166, sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1167, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             if (i==15 ) IJ_printf ("diag.j", 1169, sjm_5, "\n"); else 
!!#                             IJ_printf ("diag.j", 1170, sjm_5, "+\n");
!!#                            }
!!#                         }
!!#                       if (sjm_rd1_io == 7) sjm_rd1_io = 0; else sjm_rd1_io++;
!!#                     }
!!#                 }
!!# 
!!# ;  
!!# 
!!# set_sjm5_wr_io : mSET_SJM5_WR_IO
!!#                 {
!!# 
!!#                   if (sjm5_cnt_io1 < 8) { 
!!#                    IJ_printf ("diag.j", 1186, sjm_5, "\n");
!!#                      sjm5_cnt_io1++;
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 1189, Rv_memaddr_pattern_io);
!!#                      sjm1_addr_io1[sjm_wr1_io1] = sj5_ad; 
!!#                      IJ_printf ("diag.j", 1191, sjm_5, "WRITEIO  0x%016llx ",sj5_ad);
!!#                      IJ_update_rvar("diag.j", 1192, Rv_memaddr_pattern_io);
!!# 
!!#                      rnd_n = random()%5;
!!#                      switch (rnd_n) {
!!#                        case 0 : b_sz = 4; break;
!!#                        case 1 : b_sz = 8; break;
!!#                        !case 0 : b_sz = 1; break;
!!#                        !case 1 : b_sz = 2; break;
!!#                        case 2 : b_sz = 4; break;
!!#                        case 3 : b_sz = 8; break;
!!#                        default :b_sz = 16; break;
!!#                       } 
!!# 
!!#                      sjm1_data_io1[sjm_wr1_io1][15] = b_sz; ! byte size in entry 15, for read
!!# 
!!#                       IJ_printf ("diag.j", 1207, sjm_5, "%d ",b_sz);
!!#                       for (i=0;i<4;i++) { 
!!#                          !IJ_printf (sjm_5, "# debug %d \n",i);
!!#                          sjm1_data_io1[sjm_wr1_io1][i] = IJ_get_rvar_val32("diag.j", 1210, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1211, Rv_rand32);
!!#                          IJ_printf ("diag.j", 1212, sjm_5, "0x%08x ",sjm1_data_io1[sjm_wr1_io1][i]);
!!#                          if((i==0) && ((b_sz == 1) | (b_sz == 2) | (b_sz == 4)) ) break; 
!!#                          if((i==1) && (b_sz == 8)) break; 
!!#                       }
!!#                       if ( random()%2 == 0) {
!!#                       IJ_printf ("diag.j", 1217, sjm_5, "\n");
!!#                       } else {
!!#                       IJ_printf ("diag.j", 1219, sjm_5, "\n");
!!#                       }
!!# 
!!#                       if (sjm_wr1_io1 == 7) sjm_wr1_io1 = 0; else sjm_wr1_io1++;
!!#                     }
!!#                 }
!!# 
!!# ;  
!!# 
!!# set_sjm5_rd_io : mSET_SJM5_RD_IO
!!#                 {
!!# 
!!#                   if (sjm5_cnt_io1 > 0) {
!!#                    IJ_printf ("diag.j", 1233, sjm_5, "\n");
!!#                      sjm5_cnt_io1--;
!!# 
!!#                      sj5_ad = sjm1_addr_io1[sjm_rd1_io1];
!!#                      b_sz   = sjm1_data_io1[sjm_rd1_io1][15];
!!#                      IJ_printf ("diag.j", 1239, sjm_5, "READIO  0x%016llx %d ",sj5_ad,b_sz);
!!# 
!!#                       for (i=0;i<4;i++) {
!!#                          sjm5_dat = sjm1_data_io1[sjm_rd1_io1][i];
!!#                          IJ_printf ("diag.j", 1243, sjm_5, "0x%08x ",sjm5_dat);
!!#                          if((i==0) && ((b_sz == 1) | (b_sz == 2) | (b_sz == 4)) ) break;
!!#                          if((i==1) && (b_sz == 8)) break;
!!#                         }
!!#                       if (sjm_rd1_io1 == 7) sjm_rd1_io1 = 0; else sjm_rd1_io1++;
!!#                     }
!!#                 }
!!# 
!!# ;
!!# 
!!# set_sjm5_wr_m_io : mSET_SJM5_WR_M_IO
!!#                 {
!!# 
!!#                   if (sjm5_cnt_m_io < 8) { 
!!#                    IJ_printf ("diag.j", 1258, sjm_5, "\n");
!!# 
!!#                      sj5_ad =  IJ_get_rvar_val64("diag.j", 1260, Rv_memaddr_pattern_io);
!!#                      sjm1_addr_m_io[sjm_wr1_m_io] = sj5_ad; 
!!#                      IJ_update_rvar("diag.j", 1262, Rv_memaddr_pattern_io);
!!# 
!!#                      sjm5_cnt_m_io++;
!!# 
!!#  		     sjm1_w_mask_m_io =  IJ_get_rvar_val32("diag.j", 1268, Rv_rand_mask);
!!#                      IJ_update_rvar("diag.j", 1269, Rv_rand_mask);
!!# 
!!#                       m_tmp = sjm1_w_mask_m_io & 0xf; ! 4 bits * 4 = 16 bit mask
!!#                       mask  = 0;
!!#                      for (i=0;i<4;i++) {
!!#                       if (m_tmp & 0x1 ) {
!!#                         mask = mask << 4;
!!#                         mask = mask | 0xf;
!!#                         } else {
!!#                         mask = mask << 4;
!!#                        }
!!# 
!!#                       m_tmp = m_tmp >> 1;
!!#                      }
!!# 
!!#                      !IJ_printf (sjm_5, "# debug WRITEMSK  0x%016llx 0x%016llx +\n",mask_flip,mask);
!!#                      ! mask_flip = 0;
!!#                      ! for (i=0;i<15;i++) { 
!!#                      !  fl_tmp = mask & 0xf;
!!#                      !  mask_flip = mask_flip | fl_tmp;
!!#                      !  mask_flip = mask_flip << 4;
!!#                      !  mask      = mask      >> 4;
!!#                      ! }
!!#                      !IJ_printf (sjm_5, "# debug WRITEMSK  0x%016llx 0x%016llx +\n",mask_flip,mask);
!!#                      !mask = mask_flip | mask;
!!# 
!!#                      IJ_printf ("diag.j", 1296, sjm_5, "WRITEMSKIO  0x%016llx 0x%04x  ",sj5_ad,mask);
!!#                      sjm1_data_m_io[sjm_wr1_m_io][15] = mask; ! data fifo , 15 stores address
!!# 
!!#                       m_tmp = sjm1_w_mask_m_io & 0xf;
!!#                       for (i=0;i<4;i++) { 
!!#                        if (m_tmp & 0x1 ) {
!!#                          sjm1_data_m_io[sjm_wr1_m_io][i] = IJ_get_rvar_val32("diag.j", 1302, Rv_rand32);
!!# 			 IJ_update_rvar("diag.j", 1303, Rv_rand32);
!!#                          sjm5_dat = sjm1_data_m_io[sjm_wr1_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1306, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                              IJ_printf ("diag.j", 1308, sjm_5, "\n"); 
!!#                             !if (i==15 ) IJ_printf (sjm_5, "\n"); else 
!!#                             !IJ_printf (sjm_5, "+\n");
!!#                            }
!!#                         } else {
!!#                          !sjm5_dat = sjm1_data[sjm_rd1][i];
!!#                          sjm5_dat = 0;
!!#                          sjm1_data_m_io[sjm_wr1_m_io][i] = sjm5_dat;
!!#                          !if (i%4 == 0) IJ_printf (sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1317, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 1319, sjm_5, "\n"); 
!!#                             !if (i==15 ) IJ_printf (sjm_5, "\n"); else 
!!#                             !IJ_printf (sjm_5, "+\n");
!!#                            }
!!#                         }
!!#                         m_tmp = m_tmp >> 1;
!!#                        }
!!#                       if (sjm_wr1_m_io == 7) sjm_wr1_m_io = 0; else sjm_wr1_m_io++;
!!#                     }
!!#                 }
!!# 
!!# ;  
!!# 
!!# set_sjm5_rd_m_io : mSET_SJM5_RD_M_IO
!!#                 {
!!# 
!!#                   if (sjm5_cnt_m_io > 0) { 
!!#                    IJ_printf ("diag.j", 1337, sjm_5, "\n");
!!#                      sjm5_cnt_m_io--;
!!# 
!!#                      sj5_ad = sjm1_addr_m_io[sjm_rd1_m_io];
!!#                      mask   = sjm1_data_m_io[sjm_rd1_m_io][15];
!!#                      IJ_printf ("diag.j", 1343, sjm_5, "READMSKIO   0x%016llx 0x%04llx  ",sj5_ad,mask);
!!# 
!!#                       for (i=0;i<4;i++) { 
!!#                          sjm5_dat = sjm1_data_m_io[sjm_rd1_m_io][i];
!!#                          !if (i%4 == 0) IJ_printf (sjm_5, "        ");
!!#                          IJ_printf ("diag.j", 1348, sjm_5, "0x%08x ",sjm5_dat);
!!#                           if ((i+1)%4 == 0) { 
!!#                             IJ_printf ("diag.j", 1350, sjm_5, "\n");
!!#                             !if (i==15 ) IJ_printf (sjm_5, "\n"); else 
!!#                             !IJ_printf (sjm_5, "+\n");
!!#                            }
!!#                         }
!!#                       if (sjm_rd1_m_io == 7) sjm_rd1_m_io = 0; else sjm_rd1_m_io++;
!!#                     }
!!#                 }
!!# 
!!# ;  
!!# 
!!# set_reg9:  set_memaddr9
!!# ;
!!# 
!!# set_memaddr9: mSET_MEMADDR9
!!#                 {
!!#                         ! add a mechanism to control addr1, addr5 in range ??
!!#                         ! addr
!!#                         jbi1 = IJ_get_rvar_val64("diag.j", 1370, Rv_jbi_b_addr_pattern1);
!!#                         jbi2 = IJ_get_rvar_val64("diag.j", 1371, Rv_jbi_b_addr_pattern2);
!!#                         jbi3 = IJ_get_rvar_val64("diag.j", 1372, Rv_jbi_b_addr_pattern3);
!!#                         jbi4 = IJ_get_rvar_val64("diag.j", 1373, Rv_jbi_b_addr_pattern4);
!!#                         jbi5 = IJ_get_rvar_val64("diag.j", 1374, Rv_jbi_b_addr_pattern5);
!!#                         jbi6 = IJ_get_rvar_val64("diag.j", 1375, Rv_jbi_b_addr_pattern6);
!!# 			IJ_update_rvar("diag.j", 1376, Rv_jbi_b_addr_pattern1);
!!# 			IJ_update_rvar("diag.j", 1377, Rv_jbi_b_addr_pattern2);
!!# 			IJ_update_rvar("diag.j", 1378, Rv_jbi_b_addr_pattern3);
!!# 			IJ_update_rvar("diag.j", 1379, Rv_jbi_b_addr_pattern4);
!!# 			IJ_update_rvar("diag.j", 1380, Rv_jbi_b_addr_pattern5);
!!# 			IJ_update_rvar("diag.j", 1381, Rv_jbi_b_addr_pattern6);
!!# 
!!#                         !addr_sel = random() % 5;
!!# 			!IJ_update_rvar(Rv_addr_sel);
!!# 	                !printf ("!DEBUG: %d, jbi1 = 0x%016llx, jbi2 = 0x%016llx, jbi3 = 0x%016llx, jbi4 = 0x%016llx, jbi5 = 0x%016llx, jbi6 = 0x%016llx \n", addr_sel, jbi1, jbi2,jbi3,jbi4,jbi5,jbi6); 
!!#                         !store_addr = addr_sel;
!!# 
!!#                         !switch (addr_sel) {
!!#                         !case 1 : jbi_addr = jbi1; break;
!!#                         !case 2 : jbi_addr = jbi2; break;
!!#                         !case 3 : jbi_addr = jbi3; break;
!!#                         !case 4 : jbi_addr = jbi4; break;
!!#                         !case 5 : jbi_addr = jbi5; break;
!!#                         !case 0 : jbi_addr = jbi6; break;
!!#                         !default : jbi_addr = jbi5; break;
!!#                         !}
!!# 
!!#                         b_ADDR_ARRAY[b_a_wr_cntr] = jbi1; b_a_wr_cntr = b_a_wr_cntr + 1; ! store the stx address
!!#                         b_ADDR_ARRAY[b_a_wr_cntr] = jbi2; b_a_wr_cntr = b_a_wr_cntr + 1; ! store the stx address
!!#                         b_ADDR_ARRAY[b_a_wr_cntr] = jbi3; b_a_wr_cntr = b_a_wr_cntr + 1; ! store the stx address
!!#                         b_ADDR_ARRAY[b_a_wr_cntr] = jbi4; b_a_wr_cntr = b_a_wr_cntr + 1; ! store the stx address
!!#                         b_ADDR_ARRAY[b_a_wr_cntr] = jbi5; b_a_wr_cntr = b_a_wr_cntr + 1; ! store the stx address
!!#                         b_ADDR_ARRAY[b_a_wr_cntr] = jbi6; b_a_wr_cntr = b_a_wr_cntr + 1; ! store the stx address
!!# 
!!#                         for (i=0;i<6;i++) {
!!#                         b_DATA_ARRAY[b_wr_cntr] = IJ_get_rvar_val64("diag.j", 1406, Rv_rand64);
!!# 			IJ_update_rvar("diag.j", 1407, Rv_rand64);
!!#                         data_st = b_DATA_ARRAY[b_wr_cntr];
!!#                         addr_st = b_ADDR_ARRAY[b_a_wr_cntr -6 + i];
!!#                         IJ_printf ("diag.j", 1410, th_M, "\tsetx\t0x%016llx, %%r1, %%r9\n",
!!#                                 addr_st);
!!#                         IJ_printf ("diag.j", 1412, th_M, "\tsetx\t0x%016llx, %%r1, %%r10\n",
!!#                                 data_st);
!!#                         IJ_printf ("diag.j", 1414, th_M, "\tstb\t%%r10, [%%r9]\n");
!!# 
!!#                         b_wr_cntr++;
!!#                         } ! end for 
!!# 
!!#                         ! HALF WORD
!!#                         ! add a mechanism to control addr1, addr5 in range ??
!!#                         ! addr
!!#                         jbi1 = IJ_get_rvar_val64("diag.j", 1423, Rv_jbi_h_addr_pattern1);
!!#                         jbi2 = IJ_get_rvar_val64("diag.j", 1424, Rv_jbi_h_addr_pattern2);
!!#                         jbi3 = IJ_get_rvar_val64("diag.j", 1425, Rv_jbi_h_addr_pattern3);
!!#                         jbi4 = IJ_get_rvar_val64("diag.j", 1426, Rv_jbi_h_addr_pattern4);
!!#                         jbi5 = IJ_get_rvar_val64("diag.j", 1427, Rv_jbi_h_addr_pattern5);
!!#                         jbi6 = IJ_get_rvar_val64("diag.j", 1428, Rv_jbi_h_addr_pattern6);
!!# 			IJ_update_rvar("diag.j", 1429, Rv_jbi_h_addr_pattern1);
!!# 			IJ_update_rvar("diag.j", 1430, Rv_jbi_h_addr_pattern2);
!!# 			IJ_update_rvar("diag.j", 1431, Rv_jbi_h_addr_pattern3);
!!# 			IJ_update_rvar("diag.j", 1432, Rv_jbi_h_addr_pattern4);
!!# 			IJ_update_rvar("diag.j", 1433, Rv_jbi_h_addr_pattern5);
!!# 			IJ_update_rvar("diag.j", 1434, Rv_jbi_h_addr_pattern6);
!!# 
!!#                         !addr_sel = random() % 5;
!!# 			!IJ_update_rvar(Rv_addr_sel);
!!# 	                !printf ("!DEBUG: %d, jbi1 = 0x%016llx, jbi2 = 0x%016llx, jbi3 = 0x%016llx, jbi4 = 0x%016llx, jbi5 = 0x%016llx, jbi6 = 0x%016llx \n", addr_sel, jbi1, jbi2,jbi3,jbi4,jbi5,jbi6); 
!!#                         !store_addr = addr_sel;
!!# 
!!#                         h_ADDR_ARRAY[h_a_wr_cntr] = jbi1; h_a_wr_cntr = h_a_wr_cntr + 1; ! store the stx address
!!#                         h_ADDR_ARRAY[h_a_wr_cntr] = jbi2; h_a_wr_cntr = h_a_wr_cntr + 1; ! store the stx address
!!#                         h_ADDR_ARRAY[h_a_wr_cntr] = jbi3; h_a_wr_cntr = h_a_wr_cntr + 1; ! store the stx address
!!#                         h_ADDR_ARRAY[h_a_wr_cntr] = jbi4; h_a_wr_cntr = h_a_wr_cntr + 1; ! store the stx address
!!#                         h_ADDR_ARRAY[h_a_wr_cntr] = jbi5; h_a_wr_cntr = h_a_wr_cntr + 1; ! store the stx address
!!#                         h_ADDR_ARRAY[h_a_wr_cntr] = jbi6; h_a_wr_cntr = h_a_wr_cntr + 1; ! store the stx address
!!# 
!!#                         for (i=0;i<6;i++) {
!!#                         h_DATA_ARRAY[h_wr_cntr] = IJ_get_rvar_val64("diag.j", 1450, Rv_rand64);
!!# 			IJ_update_rvar("diag.j", 1451, Rv_rand64);
!!#                         data_st = h_DATA_ARRAY[h_wr_cntr];
!!#                         addr_st = h_ADDR_ARRAY[h_a_wr_cntr -6 + i];
!!#                         IJ_printf ("diag.j", 1454, th_M, "\tsetx\t0x%016llx, %%r1, %%r9\n",
!!#                                 addr_st);
!!#                         IJ_printf ("diag.j", 1456, th_M, "\tsetx\t0x%016llx, %%r1, %%r10\n",
!!#                                 data_st);
!!#                         IJ_printf ("diag.j", 1458, th_M, "\tsth\t%%r10, [%%r9]\n");
!!# 
!!#                         h_wr_cntr++;
!!#                         } ! end for 
!!# 
!!#                         !  WORD
!!#                         ! add a mechanism to control addr1, addr5 in range ??
!!#                         ! addr
!!#                         jbi1 = IJ_get_rvar_val64("diag.j", 1467, Rv_jbi_w_addr_pattern1);
!!#                         jbi2 = IJ_get_rvar_val64("diag.j", 1468, Rv_jbi_w_addr_pattern2);
!!#                         jbi3 = IJ_get_rvar_val64("diag.j", 1469, Rv_jbi_w_addr_pattern3);
!!#                         jbi4 = IJ_get_rvar_val64("diag.j", 1470, Rv_jbi_w_addr_pattern4);
!!#                         jbi5 = IJ_get_rvar_val64("diag.j", 1471, Rv_jbi_w_addr_pattern5);
!!#                         jbi6 = IJ_get_rvar_val64("diag.j", 1472, Rv_jbi_w_addr_pattern6);
!!# 			IJ_update_rvar("diag.j", 1473, Rv_jbi_w_addr_pattern1);
!!# 			IJ_update_rvar("diag.j", 1474, Rv_jbi_w_addr_pattern2);
!!# 			IJ_update_rvar("diag.j", 1475, Rv_jbi_w_addr_pattern3);
!!# 			IJ_update_rvar("diag.j", 1476, Rv_jbi_w_addr_pattern4);
!!# 			IJ_update_rvar("diag.j", 1477, Rv_jbi_w_addr_pattern5);
!!# 			IJ_update_rvar("diag.j", 1478, Rv_jbi_w_addr_pattern6);
!!# 
!!#                         !addr_sel = random() % 5;
!!# 			!IJ_update_rvar(Rv_addr_sel);
!!# 	                !printf ("!DEBUG: %d, jbi1 = 0x%016llx, jbi2 = 0x%016llx, jbi3 = 0x%016llx, jbi4 = 0x%016llx, jbi5 = 0x%016llx, jbi6 = 0x%016llx \n", addr_sel, jbi1, jbi2,jbi3,jbi4,jbi5,jbi6); 
!!#                         !store_addr = addr_sel;
!!# 
!!#                         w_ADDR_ARRAY[w_a_wr_cntr] = jbi1; w_a_wr_cntr = w_a_wr_cntr + 1; ! store the stx address
!!#                         w_ADDR_ARRAY[w_a_wr_cntr] = jbi2; w_a_wr_cntr = w_a_wr_cntr + 1; ! store the stx address
!!#                         w_ADDR_ARRAY[w_a_wr_cntr] = jbi3; w_a_wr_cntr = w_a_wr_cntr + 1; ! store the stx address
!!#                         w_ADDR_ARRAY[w_a_wr_cntr] = jbi4; w_a_wr_cntr = w_a_wr_cntr + 1; ! store the stx address
!!#                         w_ADDR_ARRAY[w_a_wr_cntr] = jbi5; w_a_wr_cntr = w_a_wr_cntr + 1; ! store the stx address
!!#                         w_ADDR_ARRAY[w_a_wr_cntr] = jbi6; w_a_wr_cntr = w_a_wr_cntr + 1; ! store the stx address
!!# 
!!#                         for (i=0;i<6;i++) {
!!#                         w_DATA_ARRAY[w_wr_cntr] = IJ_get_rvar_val64("diag.j", 1494, Rv_rand64);
!!# 			IJ_update_rvar("diag.j", 1495, Rv_rand64);
!!#                         data_st = w_DATA_ARRAY[w_wr_cntr];
!!#                         addr_st = w_ADDR_ARRAY[w_a_wr_cntr -6 + i];
!!#                         IJ_printf ("diag.j", 1498, th_M, "\tsetx\t0x%016llx, %%r1, %%r9\n",
!!#                                 addr_st);
!!#                         IJ_printf ("diag.j", 1500, th_M, "\tsetx\t0x%016llx, %%r1, %%r10\n",
!!#                                 data_st);
!!#                         IJ_printf ("diag.j", 1502, th_M, "\tstw\t%%r10, [%%r9]\n");
!!# 
!!#                         w_wr_cntr++;
!!#                         } ! end for 
!!# 
!!#                         ! Double WORD (x-word)
!!#                         ! add a mechanism to control addr1, addr5 in range ??
!!#                         ! addr
!!#                         jbi1 = IJ_get_rvar_val64("diag.j", 1510, Rv_jbiaddr_pattern1);
!!#                         jbi2 = IJ_get_rvar_val64("diag.j", 1511, Rv_jbiaddr_pattern2);
!!#                         jbi3 = IJ_get_rvar_val64("diag.j", 1512, Rv_jbiaddr_pattern3);
!!#                         jbi4 = IJ_get_rvar_val64("diag.j", 1513, Rv_jbiaddr_pattern4);
!!#                         jbi5 = IJ_get_rvar_val64("diag.j", 1514, Rv_jbiaddr_pattern5);
!!#                         jbi6 = IJ_get_rvar_val64("diag.j", 1515, Rv_jbiaddr_pattern6);
!!# 			IJ_update_rvar("diag.j", 1516, Rv_jbiaddr_pattern1);
!!# 			IJ_update_rvar("diag.j", 1517, Rv_jbiaddr_pattern2);
!!# 			IJ_update_rvar("diag.j", 1518, Rv_jbiaddr_pattern3);
!!# 			IJ_update_rvar("diag.j", 1519, Rv_jbiaddr_pattern4);
!!# 			IJ_update_rvar("diag.j", 1520, Rv_jbiaddr_pattern5);
!!# 			IJ_update_rvar("diag.j", 1521, Rv_jbiaddr_pattern6);
!!# 
!!#                         !addr_sel = random() % 5;
!!# 			!IJ_update_rvar(Rv_addr_sel);
!!# 	                !printf ("!DEBUG: %d, jbi1 = 0x%016llx, jbi2 = 0x%016llx, jbi3 = 0x%016llx, jbi4 = 0x%016llx, jbi5 = 0x%016llx, jbi6 = 0x%016llx \n", addr_sel, jbi1, jbi2,jbi3,jbi4,jbi5,jbi6); 
!!#                         !store_addr = addr_sel;
!!# 
!!#                         x_ADDR_ARRAY[x_a_wr_cntr] = jbi1; x_a_wr_cntr = x_a_wr_cntr + 1; ! store the stx address
!!#                         x_ADDR_ARRAY[x_a_wr_cntr] = jbi2; x_a_wr_cntr = x_a_wr_cntr + 1; ! store the stx address
!!#                         x_ADDR_ARRAY[x_a_wr_cntr] = jbi3; x_a_wr_cntr = x_a_wr_cntr + 1; ! store the stx address
!!#                         x_ADDR_ARRAY[x_a_wr_cntr] = jbi4; x_a_wr_cntr = x_a_wr_cntr + 1; ! store the stx address
!!#                         x_ADDR_ARRAY[x_a_wr_cntr] = jbi5; x_a_wr_cntr = x_a_wr_cntr + 1; ! store the stx address
!!#                         x_ADDR_ARRAY[x_a_wr_cntr] = jbi6; x_a_wr_cntr = x_a_wr_cntr + 1; ! store the stx address
!!# 
!!#                         for (i=0;i<6;i++) {
!!#                         x_DATA_ARRAY[x_wr_cntr] = IJ_get_rvar_val64("diag.j", 1537, Rv_rand64);
!!# 			IJ_update_rvar("diag.j", 1538, Rv_rand64);
!!#                         data_st = x_DATA_ARRAY[x_wr_cntr];
!!#                         addr_st = x_ADDR_ARRAY[x_a_wr_cntr -6 + i];
!!#                         IJ_printf ("diag.j", 1541, th_M, "\tsetx\t0x%016llx, %%r1, %%r9\n",
!!#                                 addr_st);
!!#                         IJ_printf ("diag.j", 1543, th_M, "\tsetx\t0x%016llx, %%r1, %%r10\n",
!!#                                 data_st);
!!#                         IJ_printf ("diag.j", 1545, th_M, "\tstx\t%%r10, [%%r9]\n");
!!# 
!!#                         x_wr_cntr++;
!!#                         } ! end for 
!!# 
!!# !                        // EXTRA NOISE STX
!!# !                        rnd_cnt =  addr_sel ;
!!# !                        while(rnd_cnt > 0 ) {
!!# !                        // noise load and store
!!# !                        while (addr_sel == store_addr ) {
!!# !                        //addr_sel = IJ_get_rvar_val64(Rv_addr_sel);
!!# !			//IJ_update_rvar(Rv_addr_sel);
!!# !                        addr_sel = random() % 5;
!!# !                        }
!!# !	                //printf ("!DEBUG 2: %d\n", addr_sel); 
!!# !                        switch (addr_sel) {
!!# !                        case 1 : jbi_addr = jbi1; break;
!!# !                        case 2 : jbi_addr = jbi2; break;
!!# !                        case 3 : jbi_addr = jbi3; break;
!!# !                        case 4 : jbi_addr = jbi4; break;
!!# !                        case 5 : jbi_addr = jbi5; break;
!!# !                        case 0 : jbi_addr = jbi6; break;
!!# !                        default : jbi_addr = jbi5; break;
!!# !                        }
!!# !
!!# !	                //printf ("!DEBUG 3: jbi_addr =  0x%016llx\n", jbi_addr); 
!!# !
!!# !                        IJ_printf (th_M, "\tsetx\t0x%016llx, %%r1, %%r12\n",
!!# !                                jbi_addr);
!!# !                        noise_data_st = b_DATA_ARRAY[addr_sel];
!!# !                        IJ_printf (th_M, "\tsetx\t0x%016llx, %%r1, %%r13\n",
!!# !                                noise_data_st);
!!# !                        IJ_printf (th_M, "\tstx\t%%r13, [%%r12]\n");
!!# !                        rnd_cnt--;
!!# !                        addr_sel = IJ_get_rvar_val64(Rv_addr_sel);
!!# !			IJ_update_rvar(Rv_addr_sel);
!!# !                        }
!!# 
!!#                         ! Loads (1/2/4/8)
!!#                         !for(i=0; i <60; i++){
!!#                         !IJ_printf (th_M, "!\tdata_array = 0x%016llx, addr_array %d = 0x%016llx  \n",b_DATA_ARRAY[i], i,b_ADDR_ARRAY[i]);
!!#                         !}
!!# 
!!#                         ! BYTE LOADS
!!#                         a_addr_sel = random() %500;
!!# 
!!#                         if(b_a_wr_cntr >= 10 ) {
!!#                         while (a_addr_sel + 9 >= b_a_wr_cntr ) {
!!#                         a_addr_sel = random() %500;
!!# 	                !IJ_printf (th_M, "!DEBUG 3: a_addr_sel =  0x%016llx, a_wr_cntr = %d\n", a_addr_sel, a_wr_cntr); 
!!#                          }
!!#                         rnd_cnt = random() % 8; ! 4 ld(.) from random loc which is already stored
!!# 	                !IJ_printf (th_M, "!DEBUG 4: rnd_cnt =  0x%016llx, b_a_wr_cntr= %d,a_addr_sel= %d\n", rnd_cnt,b_a_wr_cntr,a_addr_sel); 
!!#                         while(rnd_cnt > 0 ) {
!!#                         IJ_printf ("diag.j", 1599, th_M, "\tsetx\t0x%016llx, %%r1, %%r12\n",
!!#                                 b_ADDR_ARRAY[rnd_cnt+a_addr_sel]);
!!#                         IJ_printf ("diag.j", 1601, th_M, "\tldub\t[%%r12], %%r11\n");
!!#                         !data_ld = b_DATA_ARRAY[rnd_cnt+a_addr_sel];
!!#                         !IJ_printf (th_M, "\tsetx\t0x%016llx, %%r1, %%r10\n",
!!#                         !        data_ld);
!!#                         !IJ_printf (th_M, "\tsetx\t0x%016llx, %%r1, %%r14\n",
!!#                         !        0x00000000000000ff);
!!#                         !IJ_printf (th_M, "\tand\t%%r10, %%r14, %%r10\n");
!!#                         !IJ_printf (th_M, "\tcmp\t%%r10, %%r11\n");
!!#                         !IJ_printf (th_M, "\tbne h_bad_end\n");
!!#                         !IJ_printf (th_M, "\tnop\n");
!!#                         rnd_cnt--;
!!#                          }
!!#                         } ! of if(b_a_wr_cntr >=10)
!!# 
!!#                         ! HALF WORD LOADS
!!#                         a_addr_sel = random() %500;
!!# 
!!#                         if(h_a_wr_cntr >= 10 ) {
!!#                         while (a_addr_sel + 9 >= h_a_wr_cntr ) {
!!#                         a_addr_sel = random() %500;
!!# 	                !IJ_printf (th_M, "!DEBUG 3: a_addr_sel =  0x%016llx, a_wr_cntr = %d\n", a_addr_sel, a_wr_cntr); 
!!#                          }
!!#                         rnd_cnt = random() % 8; ! 4 ld(.) from random loc which is already stored
!!# 	                !IJ_printf (th_M, "!DEBUG 4: rnd_cnt =  0x%016llx, h_a_wr_cntr= %d,a_addr_sel= %d\n", rnd_cnt,h_a_wr_cntr,a_addr_sel); 
!!#                         while(rnd_cnt > 0 ) {
!!#                         IJ_printf ("diag.j", 1628, th_M, "\tsetx\t0x%016llx, %%r1, %%r12\n",
!!#                                 h_ADDR_ARRAY[rnd_cnt+a_addr_sel]);
!!#                         IJ_printf ("diag.j", 1630, th_M, "\tlduh\t[%%r12], %%r11\n");
!!#                         !data_ld = h_DATA_ARRAY[rnd_cnt+a_addr_sel];
!!#                         !IJ_printf (th_M, "\tsetx\t0x%016llx, %%r1, %%r10\n",
!!#                         !        data_ld);
!!#                         !IJ_printf (th_M, "\tsetx\t0x%016llx, %%r1, %%r14\n",
!!#                         !        0x000000000000ffff);
!!#                         !IJ_printf (th_M, "\tand\t%%r10, %%r14, %%r10\n");
!!#                         !IJ_printf (th_M, "\tcmp\t%%r10, %%r11\n");
!!#                         !IJ_printf (th_M, "\tbne h_bad_end\n");
!!#                         !IJ_printf (th_M, "\tnop\n");
!!#                         rnd_cnt--;
!!#                          }
!!#                         } ! of if(h_a_wr_cntr >=10)
!!# 
!!#                         ! WORD LOADS
!!#                         a_addr_sel = random() %500;
!!# 
!!#                         if(w_a_wr_cntr >= 10 ) {
!!#                         while (a_addr_sel + 9 >= w_a_wr_cntr ) {
!!#                         a_addr_sel = random() %500;
!!# 	                !IJ_printf (th_M, "!DEBUG 3: a_addr_sel =  0x%016llx, a_wr_cntr = %d\n", a_addr_sel, a_wr_cntr); 
!!#                          }
!!#                         rnd_cnt = random() % 8; ! 4 ld(.) from random loc which is already stored
!!# 	                !IJ_printf (th_M, "!DEBUG 4: rnd_cnt =  0x%016llx, w_a_wr_cntr= %d,a_addr_sel= %d\n", rnd_cnt,w_a_wr_cntr,a_addr_sel); 
!!#                         while(rnd_cnt > 0 ) {
!!#                         IJ_printf ("diag.j", 1657, th_M, "\tsetx\t0x%016llx, %%r1, %%r12\n",
!!#                                 w_ADDR_ARRAY[rnd_cnt+a_addr_sel]);
!!#                         IJ_printf ("diag.j", 1659, th_M, "\tlduw\t[%%r12], %%r11\n");
!!#                         !data_ld = w_DATA_ARRAY[rnd_cnt+a_addr_sel];
!!#                         !IJ_printf (th_M, "\tsetx\t0x%016llx, %%r1, %%r10\n",
!!#                         !        data_ld);
!!#                         !IJ_printf (th_M, "\tsetx\t0x%016llx, %%r1, %%r14\n",
!!#                         !        0x00000000ffffffff);
!!#                         !IJ_printf (th_M, "\tand\t%%r10, %%r14, %%r10\n");
!!#                         !IJ_printf (th_M, "\tcmp\t%%r10, %%r11\n");
!!#                         !IJ_printf (th_M, "\tbne h_bad_end\n");
!!#                         !IJ_printf (th_M, "\tnop\n");
!!#                         rnd_cnt--;
!!#                          }
!!#                         } ! of if(w_a_wr_cntr >=10)
!!# 
!!#                         ! X-WORD LOADS
!!#                         a_addr_sel = random() %500;
!!# 
!!#                         if(x_a_wr_cntr >= 10 ) {
!!#                         while (a_addr_sel + 9 >= x_a_wr_cntr ) {
!!#                         a_addr_sel = random() %500;
!!# 	                !IJ_printf (th_M, "!DEBUG 3: a_addr_sel =  0x%016llx, a_wr_cntr = %d\n", a_addr_sel, a_wr_cntr); 
!!#                          }
!!#                         rnd_cnt = random() % 8; ! 4 ld(.) from random loc which is already stored
!!# 	                !IJ_printf (th_M, "!DEBUG 4: rnd_cnt =  0x%016llx, x_a_wr_cntr= %d,a_addr_sel= %d\n", rnd_cnt,x_a_wr_cntr,a_addr_sel); 
!!#                         while(rnd_cnt > 0 ) {
!!#                         IJ_printf ("diag.j", 1686, th_M, "\tsetx\t0x%016llx, %%r1, %%r12\n",
!!#                                 x_ADDR_ARRAY[rnd_cnt+a_addr_sel]);
!!#                         IJ_printf ("diag.j", 1688, th_M, "\tldx\t[%%r12], %%r11\n");
!!#                         !data_ld = x_DATA_ARRAY[rnd_cnt+a_addr_sel];
!!#                         !IJ_printf (th_M, "\tsetx\t0x%016llx, %%r1, %%r10\n",
!!#                         !        data_ld);
!!#                         !IJ_printf (th_M, "\tcmp\t%%r10, %%r11\n");
!!#                         !IJ_printf (th_M, "\tbne h_bad_end\n");
!!#                         !IJ_printf (th_M, "\tnop\n");
!!#                         rnd_cnt--;
!!#                          }
!!#                         } ! of if(x_a_wr_cntr >=10)
!!# 
!!#                         !i=0;
!!#                         !IJ_printf (th_M, "!\tdata_array %d = 0x%016llx , rd_cntr = %d, wr_cntr = %d\n", i,ADDR_ARRAY[i],rd_cntr, wr_cntr);
!!#                         !i=1;
!!#                         !IJ_printf (th_M, "!\tdata_array %d = 0x%016llx , rd_cntr = %d, wr_cntr = %d\n", i,ADDR_ARRAY[i],rd_cntr, wr_cntr);
!!#                         !i=2;
!!#                         !IJ_printf (th_M, "!\tdata_array %d = 0x%016llx , rd_cntr = %d, wr_cntr = %d\n", i,ADDR_ARRAY[i],rd_cntr, wr_cntr);
!!#                         !i=3;
!!#                         !IJ_printf (th_M, "!\tdata_array %d = 0x%016llx , rd_cntr = %d, wr_cntr = %d\n", i,ADDR_ARRAY[i],rd_cntr, wr_cntr);
!!# 
!!#                 }
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
