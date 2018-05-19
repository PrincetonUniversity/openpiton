// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: pio_rnd_basic3_byte_addr_rand_0.s
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
   random seed:	756371717
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

	setx	0x000000800ed1a25a, %r1, %r9
	setx	0xd880338246b5d36e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f59142b, %r1, %r9
	setx	0xb27457b281e5ee06, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c1926f5977, %r1, %r9
	setx	0x55a1a76f05b168be, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d84a5afc1c, %r1, %r9
	setx	0xb913c2c27a098a11, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000efe5c4da25, %r1, %r9
	setx	0xc83649216fccf500, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fa09d553ee, %r1, %r9
	setx	0x425d7115f295fe91, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800eaa2eb4, %r1, %r9
	setx	0xca94d24ae4aca6d4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f403d60, %r1, %r9
	setx	0x9a9b979a849801db, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ca8577604c, %r1, %r9
	setx	0x836b5a1b1960defb, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d39dbdd532, %r1, %r9
	setx	0xcf059252776bb5f1, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ef1e4c6ed4, %r1, %r9
	setx	0xa4f67b7123d104c5, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fa289049e4, %r1, %r9
	setx	0x01b102ad843333c4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ebf2aa8, %r1, %r9
	setx	0x2391754baa98bb46, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f9dcc40, %r1, %r9
	setx	0x7fac23792c7c556a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c65bf05924, %r1, %r9
	setx	0x0b3e7e86e79492b2, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000db11745cd0, %r1, %r9
	setx	0x5c71cecd2661c31a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000eb2bdc61f8, %r1, %r9
	setx	0xd92cff13c3e2287c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f0eb9837d4, %r1, %r9
	setx	0x6f8debf153250260, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e1c24f8, %r1, %r9
	setx	0x453618828497b245, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fcce308, %r1, %r9
	setx	0x35501ac0f3f654cc, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ceb44c9f30, %r1, %r9
	setx	0x45ade9a7353f700c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d4c8bf47d8, %r1, %r9
	setx	0x3773fa0922b29787, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e0c7ac08f0, %r1, %r9
	setx	0xd9005f45db7e89a6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f2516ef6e0, %r1, %r9
	setx	0xdb823ae34053deaa, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e211279, %r1, %r9
	setx	0xddfd9fbcec776533, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f5c2523, %r1, %r9
	setx	0xd99bf77a16d47fa2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cd591b3e40, %r1, %r9
	setx	0xcd4ca2677b6e36b9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dcb32b12f7, %r1, %r9
	setx	0xb78594aa5a564e83, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e3a391c7cc, %r1, %r9
	setx	0x8c3eb2c0cb4752f6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f4e7c066c3, %r1, %r9
	setx	0xaec9b4de74f696be, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ecca9ee, %r1, %r9
	setx	0x227c1e1eb20e5e2e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f38f15e, %r1, %r9
	setx	0xf2ed6fe5cee3d5cf, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cdddc48c60, %r1, %r9
	setx	0xbcc1260c8571327b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d71a5a1e4a, %r1, %r9
	setx	0xa99664d8464affab, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e8e03c8e8c, %r1, %r9
	setx	0xb3fa8392de06d1e1, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fa4802a8e8, %r1, %r9
	setx	0x1e2193e82f5ad003, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e5a5830, %r1, %r9
	setx	0x1a10da1586a0b1ee, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f907520, %r1, %r9
	setx	0xb42a3b781aca3114, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c3f121216c, %r1, %r9
	setx	0x22a883a8f92781ff, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d4d7745e38, %r1, %r9
	setx	0xa504c0c1d7693d75, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ea76672918, %r1, %r9
	setx	0x5b26da0e782b988a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f29417137c, %r1, %r9
	setx	0xebec39516ae87038, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e369438, %r1, %r9
	setx	0xfc204a46a28d442e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fb35850, %r1, %r9
	setx	0xce21f6ab4cb92127, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c250c85520, %r1, %r9
	setx	0x45bdd7072e89a507, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d6ca556518, %r1, %r9
	setx	0x0f21ca3fcd44c402, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e8493fe320, %r1, %r9
	setx	0xe3a90b82715210ea, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fa22924960, %r1, %r9
	setx	0x73cbaf202d3d4701, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c1926f5977, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f59142b, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f403d60, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d4d7745e38, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c3f121216c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f907520, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e5a5830, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f0eb9837d4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000eb2bdc61f8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000db11745cd0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800fb35850, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e369438, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f2516ef6e0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e0c7ac08f0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d4c8bf47d8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000ceb44c9f30, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ea7ad10, %r1, %r9
	setx	0xc6ba5909d3e43788, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fa97352, %r1, %r9
	setx	0x755d23fb4376b1de, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c46bf91d0a, %r1, %r9
	setx	0x4189d8d72a07192b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dfc8efbc95, %r1, %r9
	setx	0xf217da3d533e0ab6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e970f6c313, %r1, %r9
	setx	0x1cf8d15141c198c1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f24422dd04, %r1, %r9
	setx	0x193cf1cf52b298d0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ec05408, %r1, %r9
	setx	0x2f06ab5e2bdad602, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f4928c6, %r1, %r9
	setx	0x614cd8623597d776, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ca77a6d0cc, %r1, %r9
	setx	0x7ae3e4d45588c8b0, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d696908b3e, %r1, %r9
	setx	0x4912f6927f2243e1, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e8d93d5fb2, %r1, %r9
	setx	0x4a8fa80a9772e762, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f04b712968, %r1, %r9
	setx	0xea46d2199a217f3e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800eb4beb8, %r1, %r9
	setx	0x1772a5fc0d62e707, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fdbfa18, %r1, %r9
	setx	0xb5653ec0fe144eeb, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ca9933005c, %r1, %r9
	setx	0x5574f7e34b511164, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d5364a4034, %r1, %r9
	setx	0x8444a87ea280d359, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e50f6e6994, %r1, %r9
	setx	0xe08e0d49baa9f92d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fefa0ea6c8, %r1, %r9
	setx	0xa2a515160dceec95, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e24c220, %r1, %r9
	setx	0xc560ff00a60dcb4f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f324950, %r1, %r9
	setx	0x94db2dc6aeaf2d68, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cdccc2ac88, %r1, %r9
	setx	0x43f526dce97daaa6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000db2e4f1848, %r1, %r9
	setx	0xbc9c60e10b79d496, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ef5a82da50, %r1, %r9
	setx	0xc08a0c06f09653c4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f884189908, %r1, %r9
	setx	0xade51988f578f520, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dfc8efbc95, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c46bf91d0a, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fa97352, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ea7ad10, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f4e7c066c3, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e3a391c7cc, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000dcb32b12f7, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000cdddc48c60, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f38f15e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ecca9ee, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f0eb9837d4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000eb2bdc61f8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000db11745cd0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c65bf05924, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e0c7ac08f0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d4c8bf47d8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000ceb44c9f30, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fcce308, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e1049f8, %r1, %r9
	setx	0x33ea3e32084ba4d6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f50c03d, %r1, %r9
	setx	0x2b69de2f885f0679, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cca2d7f5da, %r1, %r9
	setx	0x04768c258c4857e1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d3d543d56c, %r1, %r9
	setx	0x5753615c7208e777, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e15d1e4871, %r1, %r9
	setx	0x31c837b7d5ba6975, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f68bac5b1a, %r1, %r9
	setx	0x3dbade29e6ae529f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e7dc75e, %r1, %r9
	setx	0xf6aaa6ce585b8fb9, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fd79128, %r1, %r9
	setx	0x5e126ccd451d7281, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c1c1b1e9d6, %r1, %r9
	setx	0x7611868f78375b65, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dd1fe4fe3a, %r1, %r9
	setx	0xf4c56154902d70fd, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ed8d0c1d86, %r1, %r9
	setx	0x0e254e3165ef177c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fc0c89f64a, %r1, %r9
	setx	0xe24916ca3f87b961, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e46712c, %r1, %r9
	setx	0xce9486f82be729a3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fefcb5c, %r1, %r9
	setx	0xbc3187fb3967ab18, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c8aed474a0, %r1, %r9
	setx	0x79e1809a5e18de46, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d9853cc9a4, %r1, %r9
	setx	0x9750dfd27fb48bf1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e6d547ac58, %r1, %r9
	setx	0x5f54bbd639a8afe8, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fe98292e98, %r1, %r9
	setx	0xe9c704ab65f9d7de, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e77bbf8, %r1, %r9
	setx	0xfca4adfeb004ed33, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f845908, %r1, %r9
	setx	0x74c7785acdbfa030, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c7422697b0, %r1, %r9
	setx	0x1b7eacc47d4fd80a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d5a2c41c10, %r1, %r9
	setx	0x9980093d8bf57bb4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e6da218880, %r1, %r9
	setx	0x6db88360ffc93a3b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f415983790, %r1, %r9
	setx	0x65e8734eec047171, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cd591b3e40, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f5c2523, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e211279, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fa09d553ee, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000efe5c4da25, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d84a5afc1c, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c1c1b1e9d6, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fd79128, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e7dc75e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f04b712968, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e8d93d5fb2, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d696908b3e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f29417137c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ea76672918, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d4d7745e38, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d4c8bf47d8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000ceb44c9f30, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ee1a6a5, %r1, %r9
	setx	0x57405060ff3049f2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fba367d, %r1, %r9
	setx	0x2a2e49a9cfbd5070, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cb8c4cb201, %r1, %r9
	setx	0xe042eeb3cccedcc0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d80c71150f, %r1, %r9
	setx	0x70bae1482d56f049, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ec5d421ff3, %r1, %r9
	setx	0x66b9eb5c903e5683, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f67c43db30, %r1, %r9
	setx	0x05f23d49b54edd55, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800eb3cb6e, %r1, %r9
	setx	0xb22e7c351cf46b2e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fd40780, %r1, %r9
	setx	0xb8d6d3b7204c8710, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c59b39f70a, %r1, %r9
	setx	0x024c58f7a9d3a517, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d4e2663f46, %r1, %r9
	setx	0x3166a2931dc8b187, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e2dc508e90, %r1, %r9
	setx	0x360c97cfe0baab1c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fc69e49c00, %r1, %r9
	setx	0x1ba9cabe28f35562, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e9d83cc, %r1, %r9
	setx	0x5364afe15894ba32, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800febef7c, %r1, %r9
	setx	0x6c50b61951f1707a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cf0eecfa34, %r1, %r9
	setx	0x18c398d8cae3001e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d423e49670, %r1, %r9
	setx	0x808575e86ab676c9, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ed8bd57080, %r1, %r9
	setx	0xebbbe18b2a666ca4, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f6570757f4, %r1, %r9
	setx	0x533f46d52f57bacd, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800eea2a08, %r1, %r9
	setx	0x34203f7dca11d1c5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f816868, %r1, %r9
	setx	0xea1fd097a4b8aef7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c668f88078, %r1, %r9
	setx	0xe1df81f027f36d5d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d55a0d61b0, %r1, %r9
	setx	0xbf879ba25ecfaaa3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e37ca23c60, %r1, %r9
	setx	0xa425d27a9800a2ba, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fad36e5f50, %r1, %r9
	setx	0xd0bf5ac16e0dfae5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000efe5c4da25, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d84a5afc1c, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fa289049e4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f907520, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e5a5830, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f0eb9837d4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800eaebb5a, %r1, %r9
	setx	0x5bb4863c8de56927, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f9abb7b, %r1, %r9
	setx	0x95f7265c767d701f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c4cae6999e, %r1, %r9
	setx	0xa42bc30759c8b421, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dc0434514e, %r1, %r9
	setx	0xb88f8926a42c9402, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e42caadfbb, %r1, %r9
	setx	0x56df378e32ea78ea, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f2582fd7bc, %r1, %r9
	setx	0x7af61430d4c86205, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ebf5cb2, %r1, %r9
	setx	0x1e18feb4b25053ba, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fe08940, %r1, %r9
	setx	0x064da6f3d664c552, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c21ca0ca88, %r1, %r9
	setx	0xca93ada8bc5ad943, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dee008dd96, %r1, %r9
	setx	0xc491df5229607973, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e3714980e4, %r1, %r9
	setx	0xc613dade297bc860, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fc223dae6a, %r1, %r9
	setx	0x8758c0eefa1c8cdd, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800eb35b98, %r1, %r9
	setx	0x9610f423f6e2406f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f37b988, %r1, %r9
	setx	0x7afe6805132d6aa7, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ce5c5db1f8, %r1, %r9
	setx	0x4aaff1f41f03837a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d9ae9f5364, %r1, %r9
	setx	0x4cb0cf068e3a91f4, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ea08892b94, %r1, %r9
	setx	0x044f417ab2c875ca, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f824775e10, %r1, %r9
	setx	0xaa3c472fbc470fcb, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800eb1d9d8, %r1, %r9
	setx	0x1aebd32e76372e07, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f356558, %r1, %r9
	setx	0x1a0a7eaa6b7d1c36, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c9b6176cb8, %r1, %r9
	setx	0x007f9222f1f600bc, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dd12141a58, %r1, %r9
	setx	0x373d2f16cb399b2f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e3d04ca028, %r1, %r9
	setx	0x68c59b6d53fd5ea7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fa4f4e8230, %r1, %r9
	setx	0xed6b587ce0798b3d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fba367d, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ee1a6a5, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fa4802a8e8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e8e03c8e8c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d71a5a1e4a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cdddc48c60, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d9853cc9a4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f884189908, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000ef5a82da50, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ed1e67c, %r1, %r9
	setx	0xd14664499807e2c2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f3eb747, %r1, %r9
	setx	0xaea9e3f08006a4b7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ceafd0bbb1, %r1, %r9
	setx	0x7d51439a508d7c20, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d2fe3baf0d, %r1, %r9
	setx	0xf872e884a8b60192, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e71060c1c2, %r1, %r9
	setx	0xc20cd9af3b67d048, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f8b8bf22da, %r1, %r9
	setx	0x4ab13e3049162e66, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e553dd0, %r1, %r9
	setx	0x163922340b1ffa3a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f5a8988, %r1, %r9
	setx	0xb9cde31aa25c0913, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ca1fa18954, %r1, %r9
	setx	0x37834b543d3eba51, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d3b89bcdd6, %r1, %r9
	setx	0xbfb43bec805285d0, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e28ea29c06, %r1, %r9
	setx	0xd36ad5dd6170abc0, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f09b77c48e, %r1, %r9
	setx	0xb085369852866a46, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ec8e544, %r1, %r9
	setx	0xb0e64a79f099c87c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f3bfe2c, %r1, %r9
	setx	0x5975bdbdc67a3ff0, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c8a0e4a46c, %r1, %r9
	setx	0x0ce2f000afc2314a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d6825f6ba8, %r1, %r9
	setx	0x5bcad590007f458e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000eaf5162b74, %r1, %r9
	setx	0x7a882f96f0e5d913, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fcbb218a28, %r1, %r9
	setx	0xe247f6b353879ac9, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ea3dd80, %r1, %r9
	setx	0xc0d075799c34acce, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fa5ac60, %r1, %r9
	setx	0xb6fe34039020aa83, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c28faf6368, %r1, %r9
	setx	0xbcdd1fc72cb53ed8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dddba8c640, %r1, %r9
	setx	0x59fa852eaa935ece, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e6ea247718, %r1, %r9
	setx	0xb8764bcd6a220426, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f24c2cc838, %r1, %r9
	setx	0x2a826a83efbd2afe, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800eb3cb6e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fc0c89f64a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ed8d0c1d86, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000dd1fe4fe3a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c1c1b1e9d6, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800eea37fc, %r1, %r9
	setx	0xea6e9b4150444653, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f94c4bd, %r1, %r9
	setx	0x85e3a9f2aa68193c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c9e2e5c2f6, %r1, %r9
	setx	0x3c6d0726be20615e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000de5679cb5f, %r1, %r9
	setx	0x2111ae10dc6504b7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e7af02a3d6, %r1, %r9
	setx	0x900df58982619fb9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f48b278015, %r1, %r9
	setx	0xa81c68bd61aa88ce, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ecc3ab6, %r1, %r9
	setx	0xfaf9c7018b440d59, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ff668a8, %r1, %r9
	setx	0xf2373159b73b329e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c2c607a566, %r1, %r9
	setx	0x76c16689596abb60, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dcd4b2ad52, %r1, %r9
	setx	0xe4501ec507630139, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e6b825eab8, %r1, %r9
	setx	0xf2d40dcca24ce300, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f4e7e38928, %r1, %r9
	setx	0x5649ef897ffae7e5, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800eaadfe8, %r1, %r9
	setx	0xa0bc9311ebc59d7c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fca5508, %r1, %r9
	setx	0xcaabd6b8edf2d1d9, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cc6e890ff8, %r1, %r9
	setx	0xe0743acfa8ae24e8, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000da91c407e0, %r1, %r9
	setx	0x047094b724443fc9, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e83c321ab0, %r1, %r9
	setx	0xbd62488725b2d4ab, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fca4f4e92c, %r1, %r9
	setx	0xd8646ae3ab98718c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e982400, %r1, %r9
	setx	0x4f7d321f2405311c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f8383e8, %r1, %r9
	setx	0x0f7ed538e22a8f3f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cd2e2b1228, %r1, %r9
	setx	0xe605e0e52ab3e069, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dbc339a1b0, %r1, %r9
	setx	0xde6e94fe5dde512b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000eacdbda960, %r1, %r9
	setx	0xeed0eb5b2467c001, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f040e7ac08, %r1, %r9
	setx	0x90076ed5643566b4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c46bf91d0a, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fa97352, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ea7ad10, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f4e7c066c3, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e3a391c7cc, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000dcb32b12f7, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e2dc508e90, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d4e2663f46, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c59b39f70a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fd40780, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d9ae9f5364, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ce5c5db1f8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f37b988, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800eb35b98, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f6570757f4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ed8bd57080, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e369438, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f2516ef6e0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e0c7ac08f0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d4c8bf47d8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000ceb44c9f30, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fcce308, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e9dc437, %r1, %r9
	setx	0x2c1e8f85b93daf52, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fc52bc7, %r1, %r9
	setx	0x49c14df2c25c1cda, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ca4ec319af, %r1, %r9
	setx	0x907d24e3c04e4a3e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d6d7a5884f, %r1, %r9
	setx	0x21f40213233e92fc, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000eee13c9194, %r1, %r9
	setx	0x546db3bb1b6161eb, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f2ddc62da6, %r1, %r9
	setx	0x80ce5eaa387ed47f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800eb073d8, %r1, %r9
	setx	0xfc65192fe06ac2c6, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f025df4, %r1, %r9
	setx	0xcc27c48b2c856c63, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c63bd6d23e, %r1, %r9
	setx	0x9bb10b877ef784ce, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d93049f022, %r1, %r9
	setx	0x26bdd4b29b7202de, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e3a3b088bc, %r1, %r9
	setx	0x608436e6fcb30948, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f6bd007526, %r1, %r9
	setx	0x805240f3636a1f28, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e45823c, %r1, %r9
	setx	0xd9bf95d78ebdc920, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fb7e2e8, %r1, %r9
	setx	0xda65c6158ea5ac56, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ce13322184, %r1, %r9
	setx	0x9d2398f53c165684, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000de50cccb54, %r1, %r9
	setx	0x38d244882e4e0842, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ea7c9cff54, %r1, %r9
	setx	0xf6dba1c8f4db7827, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f28f26ab04, %r1, %r9
	setx	0x4f97bbe3d381503d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800efa73e0, %r1, %r9
	setx	0xeb9d5d2d564b3604, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fcdc890, %r1, %r9
	setx	0xa9b676cfbd57c534, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c3edcb8590, %r1, %r9
	setx	0x81db08df57d72cea, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dabc220f38, %r1, %r9
	setx	0xeb43e93bdbdf85dd, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ed7a458550, %r1, %r9
	setx	0xaa46edff01837acb, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f4fa224230, %r1, %r9
	setx	0x6d78b1dd38d6fab9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c4cae6999e, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e7dc75e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f04b712968, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e8d93d5fb2, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d696908b3e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ca77a6d0cc, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fe98292e98, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e0f26e7, %r1, %r9
	setx	0x565f6640620ca915, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f1d4fee, %r1, %r9
	setx	0x3b27640e901fa409, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cc6db7aa55, %r1, %r9
	setx	0x782e11dae39648ce, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000db8a31cfdb, %r1, %r9
	setx	0xd02584525eb4418f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e28d2c901d, %r1, %r9
	setx	0x4c4f89b92a3bb15d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f48bcda075, %r1, %r9
	setx	0xd002a0d88a1f4735, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ee5705a, %r1, %r9
	setx	0x2540e6da98f8ffee, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f107774, %r1, %r9
	setx	0x1c8a3d608bbe928e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c00d6c1872, %r1, %r9
	setx	0x1401f4351e7d5cfd, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d851a1bada, %r1, %r9
	setx	0x2d37dd3220259046, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e46181ff6e, %r1, %r9
	setx	0x647a6c9b7882c08a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f406d5f576, %r1, %r9
	setx	0x1e83471f506dff06, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e9c19b8, %r1, %r9
	setx	0x0d929c289a9ff533, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f636460, %r1, %r9
	setx	0xdd8b87605867c9f2, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c9fca6ff5c, %r1, %r9
	setx	0xc79c36a669667d4d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d07290f318, %r1, %r9
	setx	0x4f265791674f2aca, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ef0e372708, %r1, %r9
	setx	0x878dc80a9e1fe66a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fe5eceea50, %r1, %r9
	setx	0xece12b5da6719316, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ede7028, %r1, %r9
	setx	0x073e3edd569eb253, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ff6a6e0, %r1, %r9
	setx	0x240e0adc29669348, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c253f65a40, %r1, %r9
	setx	0x9c7db8676596c689, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d80d005980, %r1, %r9
	setx	0x25db8706c9d7cce2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e26a8c9110, %r1, %r9
	setx	0xb491de5f2eefe92f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8a34ec2e0, %r1, %r9
	setx	0xd2370178cb847241, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d3d543d56c, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000cca2d7f5da, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f50c03d, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e1049f8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fd40780, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fefcb5c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e46712c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fefa0ea6c8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e50f6e6994, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d5364a4034, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ca9933005c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e982400, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f24c2cc838, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e6ea247718, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000dddba8c640, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c28faf6368, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fa5ac60, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e328442, %r1, %r9
	setx	0x9237a178a92c4f53, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fb97755, %r1, %r9
	setx	0xd361c50ab94b6177, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cf0c94f96d, %r1, %r9
	setx	0x5142a7a90e12b66d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d47a5dc0f7, %r1, %r9
	setx	0x9986b2613aa4ba63, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e7dfb6467b, %r1, %r9
	setx	0x3291142841563e11, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fa9c79a512, %r1, %r9
	setx	0x2330677e04ba3295, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ec8fb70, %r1, %r9
	setx	0xe846b5e6289fc99a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f98cd06, %r1, %r9
	setx	0x8d7eda035c980918, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ce562317b0, %r1, %r9
	setx	0xbe23bafff66ca8b6, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dd67d0f340, %r1, %r9
	setx	0xc39a309ef1712bbf, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000eb0f951e88, %r1, %r9
	setx	0x3284a3463ff8ac02, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f4ad75c0d4, %r1, %r9
	setx	0xa303c5d77aab3a4e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e8718f4, %r1, %r9
	setx	0xb7b57293ee1c74a8, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f73a6b4, %r1, %r9
	setx	0xb5b977385fdbb2cd, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c5a800237c, %r1, %r9
	setx	0x046736ca8f68ca91, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d185824910, %r1, %r9
	setx	0x5e0e6aeb09b92f5b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e9fb49e228, %r1, %r9
	setx	0x6170f105b6d9cc84, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f4fa0cdb60, %r1, %r9
	setx	0xc3fa6f47973ce5c8, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ed84a60, %r1, %r9
	setx	0x68afd9fdf33f9d12, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f042130, %r1, %r9
	setx	0x23e784b0ff9ebac0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c679b1a6f0, %r1, %r9
	setx	0xd3ff26f9f547726f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d3b5014a08, %r1, %r9
	setx	0x4e8387c6e7a5e3a1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e64b483860, %r1, %r9
	setx	0xa0461ff04a80e8d7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f21f75bba0, %r1, %r9
	setx	0x0309e6ffc7d46bef, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fa09d553ee, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000efe5c4da25, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d84a5afc1c, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f107774, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ee5705a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f6bd007526, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e3a3b088bc, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d93049f022, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c8a0e4a46c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f3bfe2c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800ec8e544, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000cd2e2b1228, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f8383e8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e982400, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f24c2cc838, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e6ea247718, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000dddba8c640, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ea55076, %r1, %r9
	setx	0x05d34272e7dda758, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fa59ee8, %r1, %r9
	setx	0x7d1b197819eb968e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c35575047e, %r1, %r9
	setx	0x1edb0f33d4308234, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000da596bd2bd, %r1, %r9
	setx	0x8ba0a87a7bf7b15d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000eaeff98443, %r1, %r9
	setx	0xd347eed5962d337b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f24ca6a39c, %r1, %r9
	setx	0xc825439bdd02a22d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e5dfb10, %r1, %r9
	setx	0x7959b1b0bbb0c554, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f297390, %r1, %r9
	setx	0x5451953770c95592, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cac65a064c, %r1, %r9
	setx	0x24aa43f4d97b5f1a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000db626dd938, %r1, %r9
	setx	0x5c5c49a05f3fb96e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e6dfdba512, %r1, %r9
	setx	0xe3cae224c1a43569, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f419577bba, %r1, %r9
	setx	0x25f678fd27fc143b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e1bc9a8, %r1, %r9
	setx	0x24b8c3f2bbde1cfd, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fb02228, %r1, %r9
	setx	0x618409603327ddab, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c27e78f314, %r1, %r9
	setx	0xec39ea8ce63bab70, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d80b40ebe4, %r1, %r9
	setx	0x53b77bf2acc2db7f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e44285d494, %r1, %r9
	setx	0x3dc187b49404f070, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fef96e01bc, %r1, %r9
	setx	0x656225a42ccf8912, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e1bccc8, %r1, %r9
	setx	0x573be723b5c6243f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f6215d0, %r1, %r9
	setx	0x3e24bc753565fbe3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c10be03848, %r1, %r9
	setx	0xa51b58ef835c6b1c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dcf8ece9d8, %r1, %r9
	setx	0x21a52362da48c6c2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e55d1522b8, %r1, %r9
	setx	0x1b9825638d31c06a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f4a7fac850, %r1, %r9
	setx	0x9caac16d77328f76, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d84a5afc1c, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c1926f5977, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ec05408, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fa4802a8e8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d5364a4034, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ca9933005c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800fdbfa18, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fa4f4e8230, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e3d04ca028, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000dd12141a58, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800eb871d4, %r1, %r9
	setx	0x52842083eb62bae3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f1c9b80, %r1, %r9
	setx	0xe695671b97392946, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cdb5e440c4, %r1, %r9
	setx	0xa41f11e9305ce6f1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d41f1805a2, %r1, %r9
	setx	0x90075743b1ae25e7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ee448f6733, %r1, %r9
	setx	0x5ff1901ef61281e8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fe05f79e70, %r1, %r9
	setx	0xba834b174c956860, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e9f16d6, %r1, %r9
	setx	0x10bfe3dc36514fa6, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f604456, %r1, %r9
	setx	0xba79decef41e5e52, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c667268c9c, %r1, %r9
	setx	0x4126acd7bbfeaa23, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d8492a5432, %r1, %r9
	setx	0x12802e86f3140fe5, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e96b7dbcc2, %r1, %r9
	setx	0x98249e91bdc66410, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f818444902, %r1, %r9
	setx	0x8108f53c6fe9a668, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e0b28b0, %r1, %r9
	setx	0x2587d5eb447a1f75, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f9478e8, %r1, %r9
	setx	0x86a413f1d2efa6ec, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cd48217790, %r1, %r9
	setx	0xbb4375ede019c4a2, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000df93a55a54, %r1, %r9
	setx	0xa08869cc4f360ff2, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e6e016f37c, %r1, %r9
	setx	0x4487759c38eab3d1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fa1ffc6598, %r1, %r9
	setx	0x4631ef9f67d14075, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ea7cc20, %r1, %r9
	setx	0x4e579cf0c9167c5a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fef3f10, %r1, %r9
	setx	0x274da063eee0a23a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c992f19770, %r1, %r9
	setx	0xb52a20c98c3ca81d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d3ee014bf8, %r1, %r9
	setx	0x90a4f0539e644530, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e6040e5068, %r1, %r9
	setx	0x791ca92b2a34874c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f478fb7098, %r1, %r9
	setx	0x8ddad6b308b3c753, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dee008dd96, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c21ca0ca88, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fe08940, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ebf5cb2, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fc69e49c00, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e2dc508e90, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d4e2663f46, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800eb1d9d8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000fad36e5f50, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e37ca23c60, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d55a0d61b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c668f88078, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f816868, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e7cce79, %r1, %r9
	setx	0xdabf82eb5061a712, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fcd8324, %r1, %r9
	setx	0xbf2b2a2167b52e0b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c24c5433a7, %r1, %r9
	setx	0xefd7ce3833d21e76, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d103b8cf81, %r1, %r9
	setx	0x9baa1c8396b540f4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000eef2e6e590, %r1, %r9
	setx	0x94f9adc2fb2bb7da, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000febe9a1794, %r1, %r9
	setx	0x29a54d0a3ed47866, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ed25568, %r1, %r9
	setx	0xdd065a3c67ba1d92, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f9ef9c0, %r1, %r9
	setx	0x67878d914dc0abc3, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c49b1a9774, %r1, %r9
	setx	0xf2de479918bea886, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d530e261dc, %r1, %r9
	setx	0x66a1004fcd71f639, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e70e5823b4, %r1, %r9
	setx	0xf8b26848de1163b3, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f45dd9aafc, %r1, %r9
	setx	0xf394ef2d61a44812, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e7f34c4, %r1, %r9
	setx	0x97a53fd10c720027, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f95b470, %r1, %r9
	setx	0x6d56012c75bb394b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cd4a0dca4c, %r1, %r9
	setx	0xde1cc4207fea4ee8, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000da6aeba600, %r1, %r9
	setx	0x52d09b3d515a472c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ecb6605454, %r1, %r9
	setx	0xc97f5c9647b73313, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fc98058308, %r1, %r9
	setx	0xcab6051010e88d29, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ee20de8, %r1, %r9
	setx	0x02d681582fb2c00e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f49f4f0, %r1, %r9
	setx	0x092518f77d5ae4d0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ce8e88a478, %r1, %r9
	setx	0x603c7b3fda350e89, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d2ce9f4908, %r1, %r9
	setx	0x80642157623e76eb, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e1b4f0f260, %r1, %r9
	setx	0x61fa4d39f7deb684, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f617b46928, %r1, %r9
	setx	0xa3538dd9dbf0e6d6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e7dfb6467b, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d47a5dc0f7, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000cf0c94f96d, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fb97755, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e328442, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f419577bba, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e6dfdba512, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f824775e10, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ea08892b94, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d9ae9f5364, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000dcf8ece9d8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c10be03848, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f6215d0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e1bccc8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f21f75bba0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e3222f2, %r1, %r9
	setx	0xcde6bb9589ba26bf, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fceeb4f, %r1, %r9
	setx	0x70bc07305f535728, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c79711df19, %r1, %r9
	setx	0xd252154c23a8025e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000df4985235c, %r1, %r9
	setx	0x3670181d0d2a9783, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ec7523412a, %r1, %r9
	setx	0xaacd397df3ac2302, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f0a8e6c1bd, %r1, %r9
	setx	0x018476429060a2ff, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e73e0b0, %r1, %r9
	setx	0xf4310d65b0165eea, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fb516b8, %r1, %r9
	setx	0x99b536a592a0e68d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cdf81be080, %r1, %r9
	setx	0x03e3edb4ecd279ab, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d365e0aa1c, %r1, %r9
	setx	0xb078ea816db2d9da, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e9f8a0766a, %r1, %r9
	setx	0xb37c8328aa042504, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f2f506c666, %r1, %r9
	setx	0x7fc8e0e13f653c5b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800eb475c0, %r1, %r9
	setx	0xf76689e3fb75e05b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fc93628, %r1, %r9
	setx	0x7ed660f420c31335, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c90e0a9fd8, %r1, %r9
	setx	0x29eef6c10b9bd23c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d127c8f5d0, %r1, %r9
	setx	0x6722a39197f636c8, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e6cc51f520, %r1, %r9
	setx	0x1c41c387fe01b2ff, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f27b31a540, %r1, %r9
	setx	0x8a4dcc8a121c8c07, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ee4d6c8, %r1, %r9
	setx	0xb9975e41ac68e38b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f1f59c8, %r1, %r9
	setx	0x65b8572a1f02f36b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c6cd4fc7d8, %r1, %r9
	setx	0xcec89399a5bfb601, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d656319c50, %r1, %r9
	setx	0x81fa889a5dda0f40, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e9580b37c8, %r1, %r9
	setx	0x50e46448c3754fd6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f0ac278cd0, %r1, %r9
	setx	0x65ee6bd49d2982da, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800eaebb5a, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f67c43db30, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ec5d421ff3, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f025df4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800eb073d8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fe98292e98, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e6d547ac58, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d9853cc9a4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c8aed474a0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800fefcb5c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e46712c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f415983790, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e6da218880, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d5a2c41c10, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c7422697b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f845908, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e77bbf8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e9f3144, %r1, %r9
	setx	0x5dea95902e8221fa, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f3c4471, %r1, %r9
	setx	0x09bb7c380e77d94a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cfc2eaa1fb, %r1, %r9
	setx	0xc06a9e6d2379ccdb, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d1f82995db, %r1, %r9
	setx	0xab53859c7f6490b6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e6ab868be6, %r1, %r9
	setx	0x9ad01c3899002308, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f8fbe98c41, %r1, %r9
	setx	0xac40ffa7ccb2d611, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e9159a6, %r1, %r9
	setx	0xe18f78899d1f4d1d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f08cf24, %r1, %r9
	setx	0x83e6604f446b928d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cec3aaf2d4, %r1, %r9
	setx	0x4b19c4759d724000, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000db4544c212, %r1, %r9
	setx	0x7b3a6490a03175d8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e60618e4f0, %r1, %r9
	setx	0x65a5da4353d03826, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f86b0a8b38, %r1, %r9
	setx	0x334e846eb574490d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800efa3290, %r1, %r9
	setx	0x1d7d7488b13087d5, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fb0941c, %r1, %r9
	setx	0x3e3a5919b04549d5, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c0861dffc0, %r1, %r9
	setx	0xb701e336ec82584c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d40308a624, %r1, %r9
	setx	0xd3a959583c41fcdf, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e663566c5c, %r1, %r9
	setx	0x988c2175a7baa384, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f88cfad7c0, %r1, %r9
	setx	0xf0ad7c877f4dbd34, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ea3a130, %r1, %r9
	setx	0x322c146b1ad77441, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f2f6510, %r1, %r9
	setx	0xebd5196f3455d6da, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c24b8ebf40, %r1, %r9
	setx	0x4b83ad7b9a000245, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dfaaf3d120, %r1, %r9
	setx	0x541b47da0b7f32e7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ef8c6489f0, %r1, %r9
	setx	0x44ff4bfc5bcb491e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8043d6800, %r1, %r9
	setx	0x77a9f6ee3ef86f4f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f1d4fee, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e0f26e7, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f2ddc62da6, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000eee13c9194, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c21ca0ca88, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fe08940, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e1bc9a8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f4fa0cdb60, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e9fb49e228, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d185824910, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c5a800237c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f73a6b4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c10be03848, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f6215d0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e139a87, %r1, %r9
	setx	0x255b57cd6170cbe9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800faf5853, %r1, %r9
	setx	0x5355ca79b5a8e5bb, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c109f6fece, %r1, %r9
	setx	0xb04cd2864f33ac37, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dd70fd5197, %r1, %r9
	setx	0xf9cfbe068fc6d18b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e2d9aa079a, %r1, %r9
	setx	0xb64039c7b6c7b9db, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000feb0634349, %r1, %r9
	setx	0x15418241a8315244, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e139b32, %r1, %r9
	setx	0xead180dfb022da93, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f7610b8, %r1, %r9
	setx	0xb339f21ef53d2476, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c7e68adda8, %r1, %r9
	setx	0x3b854f98a8b0b4ad, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d0e7d5a28c, %r1, %r9
	setx	0xe643f721cafc60e0, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e9c9c7125c, %r1, %r9
	setx	0x806162fefc903ed0, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fe0cbcca92, %r1, %r9
	setx	0x0df8d403ddbd60df, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800eca8134, %r1, %r9
	setx	0x704f38985c51242e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f3180fc, %r1, %r9
	setx	0xfda16e83108e4eea, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cd9f131e94, %r1, %r9
	setx	0x73f49d8011432e72, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d53e992f58, %r1, %r9
	setx	0x54c1e0d4bc0dfae9, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e579100eb4, %r1, %r9
	setx	0x75c49e08b9d8fa89, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fcf3b959bc, %r1, %r9
	setx	0x7caeb195bb04a428, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ef3cae0, %r1, %r9
	setx	0x7ad931690e19c0d1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fbea800, %r1, %r9
	setx	0x3145321dc32cedac, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cfb2be5c18, %r1, %r9
	setx	0x6603de0993bedd69, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dfe947c0c8, %r1, %r9
	setx	0x6d877832cbf196cc, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ef4f40d500, %r1, %r9
	setx	0xd3d79d4afe69f255, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6deef1290, %r1, %r9
	setx	0xf481c9eea878cca7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f9abb7b, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800eaebb5a, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f67c43db30, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ec5d421ff3, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d80c71150f, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000cb8c4cb201, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f2f506c666, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d423e49670, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f21f75bba0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e64b483860, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d3b5014a08, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c679b1a6f0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f042130, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ed84a60, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ef8ea62, %r1, %r9
	setx	0x601517be5c1c5b67, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f0faa47, %r1, %r9
	setx	0x2fe1f1a65467781e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c2543bb2bb, %r1, %r9
	setx	0x7edbc79473dc491d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000db131be61b, %r1, %r9
	setx	0x616d8f413836717d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e77db3a441, %r1, %r9
	setx	0xbc88da2f7faa15e1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f8331d962e, %r1, %r9
	setx	0x723e7b8e2936cc14, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e4d551a, %r1, %r9
	setx	0x0481a888b63413a7, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f8c4980, %r1, %r9
	setx	0x29efcb6f4956a5d9, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c96a2fc89c, %r1, %r9
	setx	0x40684cea2a1a45c3, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dff97a30e8, %r1, %r9
	setx	0x18f63e4c2a677a61, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e3c16259f4, %r1, %r9
	setx	0x971251755fd37dfe, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fec0a0af1e, %r1, %r9
	setx	0x8bee7abfae44bcec, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e544850, %r1, %r9
	setx	0xcccf9c6d93c4acfd, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f86fbe0, %r1, %r9
	setx	0x0ded8232c089808c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c1299da610, %r1, %r9
	setx	0x75ed59d49cd6baf0, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d48b727668, %r1, %r9
	setx	0x42cfa52016c6ec2d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e117ec3214, %r1, %r9
	setx	0x81da90bb47dfbca0, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f4e8b1a0fc, %r1, %r9
	setx	0x049ec1bbb77276a8, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e1dd8b8, %r1, %r9
	setx	0x4b96d867de36163c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fea93a0, %r1, %r9
	setx	0x3d203cb45546d102, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c03e5a1c40, %r1, %r9
	setx	0xed92dfae13b891f4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000df472e5740, %r1, %r9
	setx	0xba9e754c421fdd21, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e78ff0ac28, %r1, %r9
	setx	0x9daf0774d562833c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f4081397b0, %r1, %r9
	setx	0x52dd8849c907ac09, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fb97755, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e328442, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f48bcda075, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e28d2c901d, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000db8a31cfdb, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000cc6db7aa55, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f1d4fee, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d3b89bcdd6, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ca1fa18954, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e45823c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fca4f4e92c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e83c321ab0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000da91c407e0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000cc6e890ff8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800fca5508, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800eaadfe8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f2f6510, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ea3a130, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ee2b38f, %r1, %r9
	setx	0x7347e4ada1bf9ada, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f3fa80e, %r1, %r9
	setx	0x4cebc7394eb1dfc6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c8f3f258e9, %r1, %r9
	setx	0xc591c119fe2d582c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d27bc84499, %r1, %r9
	setx	0x5608f31d68be12a8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ecfe257529, %r1, %r9
	setx	0xc0b732ea4a5fbd92, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000feaa1dca0a, %r1, %r9
	setx	0x3d2724ce3fadc300, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e917498, %r1, %r9
	setx	0xbce078c6e4917d3a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f5fdc68, %r1, %r9
	setx	0x75c71f01a605095e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ce55a3184a, %r1, %r9
	setx	0xc93d58135286415f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d8438b14d2, %r1, %r9
	setx	0xc6a5329cfac519ec, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e1b3080f88, %r1, %r9
	setx	0x5c52135a7ddf9c27, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fe77e343e2, %r1, %r9
	setx	0x9a2824dd7cec97ef, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e3a01d4, %r1, %r9
	setx	0x9b3803117e1e0dec, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f52ceb8, %r1, %r9
	setx	0xa8a64d7fb4f1710f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c04e9b4880, %r1, %r9
	setx	0x34cdf273902e2165, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000db054bd1c4, %r1, %r9
	setx	0xf55a2a5dbb98fb3d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e84a3048a4, %r1, %r9
	setx	0x70bd3a714bdc5916, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f835124460, %r1, %r9
	setx	0x2490495f005a29bb, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800eca12a8, %r1, %r9
	setx	0x1c1e159b5c2c6ffb, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800faaf070, %r1, %r9
	setx	0x934038de42bc536b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c35fe450f0, %r1, %r9
	setx	0xa6f21505da1bdb7d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d69abaaec0, %r1, %r9
	setx	0x9ebb8fa4a43262ba, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e33f63a0a0, %r1, %r9
	setx	0xf6e349cb88547d97, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f65b8d1b60, %r1, %r9
	setx	0xa82bdc1bddc0c7a6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c24c5433a7, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fcd8324, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e7cce79, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000dd67d0f340, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ce562317b0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800efa3290, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f27b31a540, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e6cc51f520, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d127c8f5d0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c90e0a9fd8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f8a34ec2e0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e26a8c9110, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d80d005980, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c253f65a40, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ff6a6e0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ede7028, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e14a1d7, %r1, %r9
	setx	0xe225ed4b59bcd3aa, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f5e505b, %r1, %r9
	setx	0xd7d0337955b6f74a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c7e2bf07bc, %r1, %r9
	setx	0x48fa1c382f74bc3d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000db582470d8, %r1, %r9
	setx	0xe8ca36a39d4ca8b7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000eb40d365d2, %r1, %r9
	setx	0xdd5c4a0c2317be7e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f85290548b, %r1, %r9
	setx	0xfac6ac4f229381c8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800eee4c48, %r1, %r9
	setx	0x040c08a7f29dcd3d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f4956ec, %r1, %r9
	setx	0x0a035ccf37206d0f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c373bcdef2, %r1, %r9
	setx	0x226ea9b6c56708f8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d6d4401cac, %r1, %r9
	setx	0x61bdf5d6611d017c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ec7e5840e8, %r1, %r9
	setx	0x3985774a5edfb363, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f455ac5fb4, %r1, %r9
	setx	0x0da4603ac3956000, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e7ff12c, %r1, %r9
	setx	0xe0416df1b5a0bd23, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fc265ec, %r1, %r9
	setx	0xd77e68f9e929b648, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c2ecfeb314, %r1, %r9
	setx	0x2548bd07a951f2ec, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d5d9ce5c10, %r1, %r9
	setx	0xde928503f75115af, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e2921ba1ac, %r1, %r9
	setx	0xaacd31aef4330363, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fa41dddd4c, %r1, %r9
	setx	0x275cb1007316dba0, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ebc32d8, %r1, %r9
	setx	0x9498f199289044d7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fd53c88, %r1, %r9
	setx	0x309bf27bb2c132e3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c1e7f7a668, %r1, %r9
	setx	0xede40e303ba1468c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d8b9599e10, %r1, %r9
	setx	0xa141be1d5bd4d343, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e689484b08, %r1, %r9
	setx	0xa938946030a1798f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6045141f0, %r1, %r9
	setx	0x6ae270085f0e41f4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d0e7d5a28c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c7e68adda8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c27e78f314, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800fb02228, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f0ac278cd0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e9580b37c8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d656319c50, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c6cd4fc7d8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e7793fc, %r1, %r9
	setx	0x56320268cb814446, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fb6a908, %r1, %r9
	setx	0x789c467a693cf412, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c44d19c35e, %r1, %r9
	setx	0x257bccf9094a525c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d8e5df8a7a, %r1, %r9
	setx	0x3acb6206c3435f03, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ee03670951, %r1, %r9
	setx	0xc0f61f456942d26b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f426b34c01, %r1, %r9
	setx	0x6995bfeeadde8b79, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e9ff448, %r1, %r9
	setx	0x1d53aaa7a05e5e87, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ff7f39a, %r1, %r9
	setx	0x689ebe410c6c1a7f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cbe8f37b98, %r1, %r9
	setx	0xf4217a1bb99e3974, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d112a686a4, %r1, %r9
	setx	0x87d6b57b5960b5c1, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e5c2cb3266, %r1, %r9
	setx	0x29fec42960e447eb, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f8492d4bf4, %r1, %r9
	setx	0x7fcd4061245f7c68, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e08d964, %r1, %r9
	setx	0x728a03a4c17ba22c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f4bf0b0, %r1, %r9
	setx	0x85e58dbace9847e1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c2bde634b4, %r1, %r9
	setx	0x0ad6596d015136bf, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d3cebdbc48, %r1, %r9
	setx	0x829ee4e588f5e420, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e82d40cf70, %r1, %r9
	setx	0x6e057881ea8ab1ff, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f2cc42ee04, %r1, %r9
	setx	0xaf1edfe305afbe72, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e7bda00, %r1, %r9
	setx	0x9fa4ce076e7d0e5c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f2da4c0, %r1, %r9
	setx	0x20759e51ce6bf88c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ce7cdfec00, %r1, %r9
	setx	0x03ec2ae4e5a97fe6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d8461b8450, %r1, %r9
	setx	0x01648bfb95be4fe7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000eb3570ae40, %r1, %r9
	setx	0x60a01743be537941, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fcceec2c48, %r1, %r9
	setx	0xeb5f600cd0e85a66, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c59b39f70a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f6570757f4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ed8bd57080, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d423e49670, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000cf0eecfa34, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800febef7c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800eca12a8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f4081397b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e78ff0ac28, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000df472e5740, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e44a561, %r1, %r9
	setx	0xd6daedd6b152063f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fd56f3f, %r1, %r9
	setx	0xe1278bd2e3343b2d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cf5e0ef921, %r1, %r9
	setx	0xd28185e48df723dc, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d63549ca91, %r1, %r9
	setx	0x5adc4ad723e7d328, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ec943ed023, %r1, %r9
	setx	0xd3cdebe9e9158fe5, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fcebd31970, %r1, %r9
	setx	0xff977f4d319863ab, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e7c7b14, %r1, %r9
	setx	0xdf42be8311f6ed95, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fbe0778, %r1, %r9
	setx	0xeb84735a7da81f2c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ca75c3cc40, %r1, %r9
	setx	0x8bbc8522d9842657, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d4bfc43a54, %r1, %r9
	setx	0xc9a205375cc05ec2, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000eeed2551ec, %r1, %r9
	setx	0x9ee541bc83bf4aba, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fccbcebe28, %r1, %r9
	setx	0x7c7c4857a4dc2e66, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e9f4154, %r1, %r9
	setx	0x9a93f819b25c85b2, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fff3a14, %r1, %r9
	setx	0x13fd4afee2e9c8b1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c08c0ae0e4, %r1, %r9
	setx	0xbbc14728caeb2670, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d213386bb8, %r1, %r9
	setx	0xdacfdcc28d00e374, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e3a5dfc090, %r1, %r9
	setx	0xa3f221e9c8179c2e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f08c3ff5f4, %r1, %r9
	setx	0xc21f9ee7794f1fa8, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800eac84b8, %r1, %r9
	setx	0x6fb5cfe1d18587ad, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fb39138, %r1, %r9
	setx	0x34de26f434080fa8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c475eccec8, %r1, %r9
	setx	0x475f9ab51f90bb03, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d4e3c59d10, %r1, %r9
	setx	0x1e3648122ec88d28, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ee3222aa40, %r1, %r9
	setx	0xa345a91563bd95d8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f22ba84db8, %r1, %r9
	setx	0xe63293827ea8de7d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c8a0e4a46c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f3bfe2c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800ec8e544, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f824775e10, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fcceec2c48, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000eb3570ae40, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d8461b8450, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000ce7cdfec00, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f2da4c0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e7bda00, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f6045141f0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800eb6b57b, %r1, %r9
	setx	0x4729ee1fd437d64d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f8f139f, %r1, %r9
	setx	0xbb926524104c12a4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c91893b8c0, %r1, %r9
	setx	0x69d079dc7c68fdd0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d5a4827222, %r1, %r9
	setx	0x52e960f48a1dae29, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e457dc2c03, %r1, %r9
	setx	0xad7470471991e07c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f6429a4697, %r1, %r9
	setx	0xdd9f9828cb36a633, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e99a4b8, %r1, %r9
	setx	0xd12475325624f3a6, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f091dfa, %r1, %r9
	setx	0x23929ae885b633d7, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c87ddc754e, %r1, %r9
	setx	0xcbab9cf681d8fdb9, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d1ba58d62c, %r1, %r9
	setx	0x36398f0e595de426, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e1426f9bc0, %r1, %r9
	setx	0x7b96b90cd94fdfd5, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f87aa16288, %r1, %r9
	setx	0xf7f3c81da4e20a4c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e959790, %r1, %r9
	setx	0x49716a4f10ddd959, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f0a175c, %r1, %r9
	setx	0x95d749ab807149e7, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cb616ab57c, %r1, %r9
	setx	0x7634768ec5246372, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000dca2879f88, %r1, %r9
	setx	0x2654284fd1ca09af, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000eb1c0690f4, %r1, %r9
	setx	0x8db0f8f353a57d3c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f056bda174, %r1, %r9
	setx	0x6f3662d6ba1b0987, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e746788, %r1, %r9
	setx	0x1a7169d53dcf70f4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ff05050, %r1, %r9
	setx	0x56f48b162591f310, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c1b878f6d0, %r1, %r9
	setx	0xbe070d499f58ee79, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d55bc3e108, %r1, %r9
	setx	0x570c01325b9a2773, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e6a3f78bc0, %r1, %r9
	setx	0x95330ae73ec09166, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f81cf981d8, %r1, %r9
	setx	0x93b0c8953c86f612, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000eaeff98443, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000da596bd2bd, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c35575047e, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fa59ee8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d3b89bcdd6, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ca1fa18954, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f5a8988, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f2cc42ee04, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e82d40cf70, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d80d005980, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c253f65a40, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ff6a6e0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ede7028, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ec2d11b, %r1, %r9
	setx	0x9b93d7ea9eb83d8c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f200295, %r1, %r9
	setx	0xc87db45c1f4c48dd, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c7c685296c, %r1, %r9
	setx	0x52b86e593042afc2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000de177af458, %r1, %r9
	setx	0xe2c41dabeef2000b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ed6f3cc315, %r1, %r9
	setx	0xa8e98fed28cb4dde, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f01283c787, %r1, %r9
	setx	0xeb9217624be7c98b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e3a8780, %r1, %r9
	setx	0x58879d6366de4b7f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fd1062c, %r1, %r9
	setx	0x214214c3a9147c67, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c6d4b6870a, %r1, %r9
	setx	0x6c1a30b51ec68475, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d3607c461e, %r1, %r9
	setx	0x4beb1889ed5b9568, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000edfc8faac2, %r1, %r9
	setx	0x9c08bad30d797a6c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f47477fef2, %r1, %r9
	setx	0x10de8bbfdbb1c89f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e3a689c, %r1, %r9
	setx	0x43dce612950b5dbe, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f352c60, %r1, %r9
	setx	0x0f2a9935e1293de4, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c7f7cfd358, %r1, %r9
	setx	0x1a410035beba1da6, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d7b29e9f70, %r1, %r9
	setx	0x57b0a72cb8afc2d9, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e65b5149b0, %r1, %r9
	setx	0x4fe4b4a51ba5a04d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f0f0896fdc, %r1, %r9
	setx	0xfa4b74ec20a7f62c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e885f60, %r1, %r9
	setx	0xff2811a290988477, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fede3a0, %r1, %r9
	setx	0xf078558929e91208, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c452b131a0, %r1, %r9
	setx	0xfcf6019ff99e7ea5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d7d5e9eba0, %r1, %r9
	setx	0x1384f3bc999b97b0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000edbf345458, %r1, %r9
	setx	0xa3f323953cd27fb2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f00fc435b0, %r1, %r9
	setx	0x0a7a789036c4e2ea, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000df4985235c, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c79711df19, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f455ac5fb4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ec7e5840e8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d6d4401cac, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c373bcdef2, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f4956ec, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800eee4c48, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fe77e343e2, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ef0c5be, %r1, %r9
	setx	0x014048f9c7fb6acf, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f2357a3, %r1, %r9
	setx	0x3940bf394a530114, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c94ca6c53f, %r1, %r9
	setx	0x3c9a8179202fc09b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000de197e3bfc, %r1, %r9
	setx	0x3469d11d5e028a1b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e60d0532fd, %r1, %r9
	setx	0x9b27d3d239645fed, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f84d9b2ec3, %r1, %r9
	setx	0x0078aaaa5704a668, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800edc09f6, %r1, %r9
	setx	0xcc0814febebdbf7f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f5fac74, %r1, %r9
	setx	0xb7b90354bfc21190, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c65a4f8e70, %r1, %r9
	setx	0xedb62020f9707cd3, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d4f38d8c6e, %r1, %r9
	setx	0x0976fa236ba518e3, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e5eeca6a5e, %r1, %r9
	setx	0x080b7373c34b1ca1, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f2edcf21ba, %r1, %r9
	setx	0xb66005f887f01146, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800eb2bf0c, %r1, %r9
	setx	0xfb4f7c5b1608b625, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f9bd388, %r1, %r9
	setx	0xf313e13c6dac9ddb, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c4e0e947cc, %r1, %r9
	setx	0xbff627ae196e82ce, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d43d248d58, %r1, %r9
	setx	0x89bf5d6071e2abfd, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e7a9e76310, %r1, %r9
	setx	0xf1dcee1f40b172a5, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fcd8270d9c, %r1, %r9
	setx	0xd44c9bd3430b7a6e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ef10550, %r1, %r9
	setx	0x5d741ff679a5176f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f0e94d8, %r1, %r9
	setx	0x3756cc5e918bf5ea, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c4dcf23d48, %r1, %r9
	setx	0x4be7f52f9823c5a3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d13f82c210, %r1, %r9
	setx	0xa5bac72973965cd6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e17d71ff58, %r1, %r9
	setx	0x942e9117970176a6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6fda1f4c0, %r1, %r9
	setx	0xd9c367f8a3296ced, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c91893b8c0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f8f139f, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f6570757f4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ed8bd57080, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d423e49670, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000cf0eecfa34, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800febef7c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d3ee014bf8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c992f19770, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fef3f10, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ecef721, %r1, %r9
	setx	0xb4604d4c56c99402, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f364244, %r1, %r9
	setx	0x52121caf44252f33, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cfa21adcb0, %r1, %r9
	setx	0xde19488c50ca8d6a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d4517c16f6, %r1, %r9
	setx	0x6322ff4d4029a6fa, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e39bc5a103, %r1, %r9
	setx	0x69f86330e51af074, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f66b1fe9b3, %r1, %r9
	setx	0x2cf1ac0c3439293f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800eafcf48, %r1, %r9
	setx	0x1df41ff795e02e8c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fddb862, %r1, %r9
	setx	0xe7a883d208c9ecd1, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c457054280, %r1, %r9
	setx	0xbd126689d73cccd2, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dde191844c, %r1, %r9
	setx	0xfe32615240cf8a49, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ef19fb8ae4, %r1, %r9
	setx	0xf1299a04239974a8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f0df0e7596, %r1, %r9
	setx	0x6a3dc7e31e834aab, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e093fb0, %r1, %r9
	setx	0x76345ee5b5b07d44, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f3b8d90, %r1, %r9
	setx	0xcccad1dd5e7cce14, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c06d7c77a4, %r1, %r9
	setx	0x353879d04a56bed7, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d77a9a73f0, %r1, %r9
	setx	0x069d5ed0489fca4f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e331ec05dc, %r1, %r9
	setx	0xfb09010ffb620007, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f4597fe054, %r1, %r9
	setx	0x9203098feca34aec, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e373018, %r1, %r9
	setx	0xac7b5ef2bd6708b8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fbf1888, %r1, %r9
	setx	0xffebf8983da79510, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c2224eee10, %r1, %r9
	setx	0x0d2c40cb38b5fc31, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d771abd178, %r1, %r9
	setx	0x5114e6ffb6fac000, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e5e5b95068, %r1, %r9
	setx	0x90e9aa730818ea99, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f2e21ffa00, %r1, %r9
	setx	0x0eed34f8a52f6636, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f84d9b2ec3, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e60d0532fd, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000de197e3bfc, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c94ca6c53f, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f2357a3, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ef0c5be, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e3a8780, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f87aa16288, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e1426f9bc0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d1ba58d62c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c90e0a9fd8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800fc93628, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800eb475c0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fc98058308, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ecb6605454, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000da6aeba600, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f24c2cc838, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800efbed0a, %r1, %r9
	setx	0x6752c175ac5e415c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f4fabfe, %r1, %r9
	setx	0xa82f09989c869f9d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cd1ba73f02, %r1, %r9
	setx	0x37e99f8453625e5f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d114961611, %r1, %r9
	setx	0x83de9a669eb5e818, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e03a516f67, %r1, %r9
	setx	0xabff6d7a44bce43c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f8dac91b23, %r1, %r9
	setx	0x3cc7ab9a87cc5222, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e8256c2, %r1, %r9
	setx	0x7b3e4513806bb931, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f0226fc, %r1, %r9
	setx	0xb905684201e8fe12, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c8dded99de, %r1, %r9
	setx	0x3108dbc1ee2145e7, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d89435559c, %r1, %r9
	setx	0x6cfc64e673eeb53d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e151de5684, %r1, %r9
	setx	0x6c5fde0941bdc228, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f666a1b8c6, %r1, %r9
	setx	0x14b1e48eb9709b11, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e060c5c, %r1, %r9
	setx	0x3a6d90bdd25b1466, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f7e7f88, %r1, %r9
	setx	0xdf2b665c4ddf6b64, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c47e47c12c, %r1, %r9
	setx	0x12e0d22a59790106, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d6cf6e4324, %r1, %r9
	setx	0x657ef09fbee71114, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ea7bbea5c8, %r1, %r9
	setx	0x473b938cda7e514d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fa2d23112c, %r1, %r9
	setx	0x40e2f653670a35c3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ec10b08, %r1, %r9
	setx	0xcce2da17b274d435, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f61c788, %r1, %r9
	setx	0x10908ac0fda6fd4b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c0992c77f0, %r1, %r9
	setx	0x8e3543f47d2a95df, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d9968a2750, %r1, %r9
	setx	0x9ccd5ffd293de5df, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ecca0b4098, %r1, %r9
	setx	0x33a496e663ab194b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f43e199e38, %r1, %r9
	setx	0xec661a86087a1d39, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e139a87, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f8fbe98c41, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e6ab868be6, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e9159a6, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ca9933005c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800fdbfa18, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800eb4beb8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f29417137c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ea76672918, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f22ba84db8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000ee3222aa40, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d4e3c59d10, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c475eccec8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fb39138, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800eac84b8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e7ef1d5, %r1, %r9
	setx	0x815a16330150051a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fc76e6e, %r1, %r9
	setx	0x547e2cb349e5381f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c3ebddaac4, %r1, %r9
	setx	0x082d7d8c3a0de10b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d9a246ff92, %r1, %r9
	setx	0x52dd7b0a279d35f0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ef6f4896fb, %r1, %r9
	setx	0x145883476bde193b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f0fac38e03, %r1, %r9
	setx	0x3425ad00f8c64dcd, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800edc7186, %r1, %r9
	setx	0x735dbd75cbedf5d5, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f0a94b4, %r1, %r9
	setx	0xa0aba769bad96580, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c811d8cbd6, %r1, %r9
	setx	0xf21081f9789d26ea, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d68ba95efa, %r1, %r9
	setx	0x59f3f34c13bae34c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ec3e62f502, %r1, %r9
	setx	0xf6030df63b8f9f24, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f0628567f2, %r1, %r9
	setx	0x1d1db8e437bdbd8d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e0c500c, %r1, %r9
	setx	0xfd6ce11dcdba88a4, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f909294, %r1, %r9
	setx	0x650f68f73ead918e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ceab997da4, %r1, %r9
	setx	0x0d6d93b6676a1b47, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d5f957017c, %r1, %r9
	setx	0x87b2f879ba67f1f5, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e5beef837c, %r1, %r9
	setx	0x6bfbf7896bd30462, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fe173157bc, %r1, %r9
	setx	0xd99c91b675c7806d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e64d938, %r1, %r9
	setx	0x9644583315407610, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f4946f0, %r1, %r9
	setx	0xd3492cd2ea66898e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cccbf2bab0, %r1, %r9
	setx	0x8eed5943a35c73da, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d980d0e920, %r1, %r9
	setx	0x8a0c1e0670d0d1ce, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000eb11bccea0, %r1, %r9
	setx	0x61685567b4237e52, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6a5924808, %r1, %r9
	setx	0x45d4065822b5ea89, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ca4ec319af, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fc52bc7, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e9dc437, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f48b278015, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e7af02a3d6, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000de5679cb5f, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c9e2e5c2f6, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000cac65a064c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f297390, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e5dfb10, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ef8c6489f0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000dfaaf3d120, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c24b8ebf40, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f2f6510, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ea3a130, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e07fbde, %r1, %r9
	setx	0x4edafb7f4ef7f8c6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f0222e4, %r1, %r9
	setx	0x853d0a104c108aba, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c619bd8d57, %r1, %r9
	setx	0xef9c3406d0edd187, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000da91c2b699, %r1, %r9
	setx	0x6c5ca9f78e19eeb9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e8549936ae, %r1, %r9
	setx	0x1fc30c7ab02df322, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fe6e091ec2, %r1, %r9
	setx	0x08d14d67241b86ab, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e382b3e, %r1, %r9
	setx	0xd5647197ded902a5, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f22deba, %r1, %r9
	setx	0x79cf9e2282ade1e2, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c91fb994e2, %r1, %r9
	setx	0x61526054d620f623, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dc31666860, %r1, %r9
	setx	0x64fc9668754cd06c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e688826d58, %r1, %r9
	setx	0x1c4797010112f31d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f05fd9c6c2, %r1, %r9
	setx	0x08de229ce71420db, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e44f100, %r1, %r9
	setx	0x661f09570317d157, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f9c6644, %r1, %r9
	setx	0x3fd2cd7a8c17c2f3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cf52d091f0, %r1, %r9
	setx	0x79dfb89225d9c8e6, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000dfcacbc8fc, %r1, %r9
	setx	0x33eb4dfcdff62b19, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e2d71e1d0c, %r1, %r9
	setx	0xb18a52ca22289ae4, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f6c41da410, %r1, %r9
	setx	0xb4802a48bdf0f360, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e657450, %r1, %r9
	setx	0x61814a6d96a1e3b5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f51a240, %r1, %r9
	setx	0x3e7503b1e9bcb058, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c11eb414a0, %r1, %r9
	setx	0x8f925f12bb4d99a9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000df32b9ae70, %r1, %r9
	setx	0x13fba49f267b0277, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e083d60bd8, %r1, %r9
	setx	0xb3edd11db371e340, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f43c256de0, %r1, %r9
	setx	0x13a029228d113fbd, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f9abb7b, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800eaebb5a, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f67c43db30, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ec5d421ff3, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fc69e49c00, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e2dc508e90, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d4e2663f46, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ef4f40d500, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e9d3cfe, %r1, %r9
	setx	0x4d8245a5a8f40ec8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f5f82dc, %r1, %r9
	setx	0x72cc5052cc2ed27e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c4e4da79a4, %r1, %r9
	setx	0x1a45d8ee2450e91a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d224656737, %r1, %r9
	setx	0x1074c0a78b8db82a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e6572b2640, %r1, %r9
	setx	0xeec3dda8422564cd, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fc9100efef, %r1, %r9
	setx	0xc543020ce40a3866, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ed575be, %r1, %r9
	setx	0xa418919481fa142b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f72aefe, %r1, %r9
	setx	0x5f1d61d8c9348818, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cc8a50910a, %r1, %r9
	setx	0x274dae4d1cf711c0, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d2362a7af8, %r1, %r9
	setx	0xe2645dbbdf08d60d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e24bc6325a, %r1, %r9
	setx	0x9ac91b69ea5ea1ea, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f0955f4344, %r1, %r9
	setx	0x6a3bc2f33b390b77, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e183fe0, %r1, %r9
	setx	0x487f0492087d3c9d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fec49d4, %r1, %r9
	setx	0x014b3b3e7562c58f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c7cd02e478, %r1, %r9
	setx	0x953c604585ad481b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d3bb60a258, %r1, %r9
	setx	0x138b227016f2ff3b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000edae3020f0, %r1, %r9
	setx	0xc933f22a3fcc68e0, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f61390c478, %r1, %r9
	setx	0xecfb59ea0c14c730, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e1545d0, %r1, %r9
	setx	0x8fc0de22c523f1e6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f136d60, %r1, %r9
	setx	0x5d238481d4e8ec38, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c4e050a840, %r1, %r9
	setx	0xc9146716fd8234f3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d2c5458130, %r1, %r9
	setx	0xb21bc4468b8bfc75, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ee0ad893d8, %r1, %r9
	setx	0x8a7f68fea41d0e7b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fa30367338, %r1, %r9
	setx	0x64568da1d17422fb, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f50c03d, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e1049f8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f24422dd04, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f604456, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f0a175c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e959790, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f08c3ff5f4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e3a5dfc090, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d213386bb8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c08c0ae0e4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800fff3a14, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000eb11bccea0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d980d0e920, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000cccbf2bab0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e8d565d, %r1, %r9
	setx	0x2764a25b357342d9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f7127af, %r1, %r9
	setx	0x1c3236cf7283b019, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ca9c333411, %r1, %r9
	setx	0xc34a77d04918c088, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d7f2f550e5, %r1, %r9
	setx	0x270409f734ee7068, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000eae21803ad, %r1, %r9
	setx	0xc077f68f0237d939, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f6e7d4ad8d, %r1, %r9
	setx	0x8450b9acfe7c0c66, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ee69332, %r1, %r9
	setx	0x253e865e92a95ae4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ffc9966, %r1, %r9
	setx	0xdf1eaf4ffb5fbb01, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c97e5f15a2, %r1, %r9
	setx	0xc1b726228e13d823, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d930c5f1dc, %r1, %r9
	setx	0x5f3853f383cae739, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e09658622a, %r1, %r9
	setx	0xba0306eb6aa4f846, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f44189ad66, %r1, %r9
	setx	0x2a7bae6b35b0c102, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e7e774c, %r1, %r9
	setx	0x4ef666bf7fba6f8c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f35a768, %r1, %r9
	setx	0xcd6ae2316296e601, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c67fed6dc0, %r1, %r9
	setx	0xbf4beb84b21e57e4, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d8f48445a0, %r1, %r9
	setx	0x35cadae4fd9dba11, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e57d7b79d8, %r1, %r9
	setx	0x8751025f9a76c4ae, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f0cf3b6608, %r1, %r9
	setx	0xe04ed7140b10e352, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ed04d48, %r1, %r9
	setx	0x00c9ac85d9286cf7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f9403f0, %r1, %r9
	setx	0xcc9d347adb1915d2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c4403caaf0, %r1, %r9
	setx	0x38d5c43c1a769eb7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d44e700260, %r1, %r9
	setx	0x5ea81ecdc66188ac, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e9b08323f0, %r1, %r9
	setx	0xe1367ac79acd11fe, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8567df6c8, %r1, %r9
	setx	0x979d76dd53890cb8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ec943ed023, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d63549ca91, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000cf5e0ef921, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fd56f3f, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e44a561, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fe0cbcca92, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e9c9c7125c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d0e7d5a28c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c7e68adda8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f7610b8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ecb6605454, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000da6aeba600, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000cd4a0dca4c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800ef32594, %r1, %r9
	setx	0x26710041e544de6c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f922e7b, %r1, %r9
	setx	0x6d8944955c880856, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ce2afcc023, %r1, %r9
	setx	0xd19d010a927ac358, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d4433c0174, %r1, %r9
	setx	0xd895c13ab8f88608, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e311b3cdda, %r1, %r9
	setx	0x7d9dc4ef248391f0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f4e4c2f1e7, %r1, %r9
	setx	0xdf74a7d20f45d5cf, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e51091a, %r1, %r9
	setx	0xa462aa08df347bf2, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f3065e2, %r1, %r9
	setx	0xfa32756e6c12dd2c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c7ace13f56, %r1, %r9
	setx	0x4cd84e8ce6b25879, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d2db52e018, %r1, %r9
	setx	0x8718ac73d8ff034d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e232efca4a, %r1, %r9
	setx	0x851eaf82cf338e3e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fa20bda1f4, %r1, %r9
	setx	0xc37c8c22f2377c54, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e1ba060, %r1, %r9
	setx	0x694d53cf04aab87c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fbd3d90, %r1, %r9
	setx	0x3698fb5de3b28aa3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cef304de78, %r1, %r9
	setx	0x21f3f1c5385f2aa3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000df21ce8780, %r1, %r9
	setx	0xaae3e93f9a1f404c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ea34ff8f7c, %r1, %r9
	setx	0xbf9d461616a1bc7e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fcf951cfe4, %r1, %r9
	setx	0x6d29297dc4882097, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ebd1928, %r1, %r9
	setx	0x8de9878e954d0394, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f6ff080, %r1, %r9
	setx	0xaa91ddea7e86db4c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ce56c583f8, %r1, %r9
	setx	0xde2a6e68b5b2b9ea, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dd34c31438, %r1, %r9
	setx	0x132ce8ea26a8eca5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e85418dac0, %r1, %r9
	setx	0x4de6faee98c4ba05, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f0f3efd350, %r1, %r9
	setx	0x2c4200361146569b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dd70fd5197, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c109f6fece, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800faf5853, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e139a87, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f8fbe98c41, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e6ab868be6, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d1f82995db, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e70e5823b4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d530e261dc, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c49b1a9774, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f9ef9c0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ed25568, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f818444902, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c4e0e947cc, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800ec10b08, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f2e21ffa00, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e5e5b95068, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d771abd178, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c2224eee10, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e72f1d9, %r1, %r9
	setx	0x6c11a8e9b6fe5088, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f8bf06d, %r1, %r9
	setx	0x1eeb38307b703129, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c7ea0f5ec0, %r1, %r9
	setx	0x62821c154a1bec8a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d2129bc091, %r1, %r9
	setx	0x2befb7f651980398, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ed1d183a22, %r1, %r9
	setx	0x45b1f64cb7e1eb84, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f63407487e, %r1, %r9
	setx	0x5509fa4b53bd7099, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e5f7cd6, %r1, %r9
	setx	0x0520acbd2e52813a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ff4b502, %r1, %r9
	setx	0xc575d20ac198ee62, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cdd06d6320, %r1, %r9
	setx	0x3fe12a5823dfa5ec, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dffa76b61c, %r1, %r9
	setx	0x5a986315c28bee5e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e7c7658a8e, %r1, %r9
	setx	0xd3d5e5d805469d97, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fccf776bae, %r1, %r9
	setx	0x94be15a95401b85a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e83978c, %r1, %r9
	setx	0xf0cb0a6a095a266e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f6d7120, %r1, %r9
	setx	0x9baf6b8d57b2823c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c2022a25bc, %r1, %r9
	setx	0x57a6488ba9da6907, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d1d34004fc, %r1, %r9
	setx	0x19f459d355838463, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ea2c3c2f88, %r1, %r9
	setx	0x2866ab1723cf3bce, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f07fbad230, %r1, %r9
	setx	0xedccf5f56232261f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e9fdca0, %r1, %r9
	setx	0x26786a13c2194812, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f477b10, %r1, %r9
	setx	0xa4f806197378cb41, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c058194e98, %r1, %r9
	setx	0x53805842779b7a72, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d2afc69d18, %r1, %r9
	setx	0x69d0e2700094797e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e7347a38c0, %r1, %r9
	setx	0x12326c208903ff19, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f83d23cae0, %r1, %r9
	setx	0x9d62cc08722e345f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6429a4697, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c7e68adda8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f7610b8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e139b32, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f86b0a8b38, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e60618e4f0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cef304de78, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800fbd3d90, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e1ba060, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f0cf3b6608, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e57d7b79d8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d8f48445a0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e6a3f78bc0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d55bc3e108, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c1b878f6d0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ff05050, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e767a3c, %r1, %r9
	setx	0xec285d7822951e27, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f6e5689, %r1, %r9
	setx	0x88ab86b616875e90, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c3721858f9, %r1, %r9
	setx	0x98987f74c822aa71, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ddf59337ff, %r1, %r9
	setx	0x29facf2f308466d5, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e306b81d03, %r1, %r9
	setx	0xd1512a1955b53c3f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f01feb12a4, %r1, %r9
	setx	0x0498f4088de222b4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e6105f8, %r1, %r9
	setx	0x71dec2ad903d672b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f86bb54, %r1, %r9
	setx	0x6cb8e79cf1647a19, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c0dbd110e8, %r1, %r9
	setx	0x5c9e2ee4700e1fd8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d6bf9772ba, %r1, %r9
	setx	0xbaa8386c95aa2a34, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e8c373f84a, %r1, %r9
	setx	0x57a828cdeb22984a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f26f1fd8fa, %r1, %r9
	setx	0xe07e7aa7e7623375, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ea79468, %r1, %r9
	setx	0x909b13aebc6175f3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fe208ec, %r1, %r9
	setx	0x6113a9ddbe59e1ed, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cf01f180f8, %r1, %r9
	setx	0x0cd9fa79cd728353, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d1d7257a14, %r1, %r9
	setx	0xb900edb3702f8868, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e79dcc3954, %r1, %r9
	setx	0x4c5621c5a0663a08, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f0d0ba1f30, %r1, %r9
	setx	0x963bd65527a8c397, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ed1b748, %r1, %r9
	setx	0x28574a5e1bb3ff6c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f18c428, %r1, %r9
	setx	0x6e2412d478562742, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c7d7948c60, %r1, %r9
	setx	0x552806f8fe58ee04, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d22c496238, %r1, %r9
	setx	0x4e22335ad283ae5b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000efac6d3b18, %r1, %r9
	setx	0xe3908845fe19c3ac, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f2b33296e0, %r1, %r9
	setx	0xc659691e61241ec3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000eae21803ad, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d7f2f550e5, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ca9c333411, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f7127af, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e8d565d, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fc9100efef, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e2dc508e90, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d4e2663f46, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ceab997da4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f909294, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e0c500c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fa2d23112c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ea7bbea5c8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d44e700260, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e073878, %r1, %r9
	setx	0xdce398e1e68dd746, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fa883e9, %r1, %r9
	setx	0x74aa632b97f575c0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cf4b16aec3, %r1, %r9
	setx	0xb0ea784209fe96c9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d537ba5060, %r1, %r9
	setx	0xcc8eb305830be7c8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000edcfd8f870, %r1, %r9
	setx	0xbcd6adb95529ad43, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000feeff099e3, %r1, %r9
	setx	0x19d8da559715f80c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ea38cc8, %r1, %r9
	setx	0x86249f738170eba8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fa8b7ac, %r1, %r9
	setx	0x223e3bc58e3ba627, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cb95a54d72, %r1, %r9
	setx	0x6dd8aacd91484ff0, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d6e388279c, %r1, %r9
	setx	0x6823b7db0f01986a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ee0a803984, %r1, %r9
	setx	0xe011098182e1897a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f4da117fd2, %r1, %r9
	setx	0xbf21f31509e0460d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ea70f9c, %r1, %r9
	setx	0xd8ec521a07604d11, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fdc3f38, %r1, %r9
	setx	0x58074e51b1b413ed, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c3f1dbbe34, %r1, %r9
	setx	0xb551d3680ff2716c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d0b1349168, %r1, %r9
	setx	0xaad7fc92bea52278, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e4c2ad4958, %r1, %r9
	setx	0x779a123994dc1ba3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f2906a77e4, %r1, %r9
	setx	0x479b8ae7655d922c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e108c48, %r1, %r9
	setx	0xce2f860b04e2dad9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f058b90, %r1, %r9
	setx	0xe8868dd43af91b88, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cc3c777190, %r1, %r9
	setx	0xfd0460e13aec6dd9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d092cddb88, %r1, %r9
	setx	0x8fc9fd4746a181fc, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ec7a2b56c0, %r1, %r9
	setx	0xbae0bf2091431d73, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f659f24388, %r1, %r9
	setx	0xa0697d43e83ad5b0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f6e5689, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e767a3c, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f63407487e, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ed1d183a22, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d2129bc091, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c7ea0f5ec0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f8bf06d, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000dee008dd96, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c21ca0ca88, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fe08940, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ebf5cb2, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ea3a130, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f0ac278cd0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e9580b37c8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d656319c50, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c6cd4fc7d8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f1f59c8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e53ebaf, %r1, %r9
	setx	0x901f76dc3805d2c7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f641cb1, %r1, %r9
	setx	0x4b2fdeedbd0590c0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c6565c09d6, %r1, %r9
	setx	0xf2d833bca9663dcc, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d4de7fcab1, %r1, %r9
	setx	0x24fc00770facd0d6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e081174b7b, %r1, %r9
	setx	0xa228a89b7023c6fe, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f4bc72bdec, %r1, %r9
	setx	0x92a3b1f8679566ab, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e2e1518, %r1, %r9
	setx	0xf289555dded5dce9, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fbcdcf2, %r1, %r9
	setx	0xe0d4d6a745d6e141, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ccd5a70dda, %r1, %r9
	setx	0xb5f5fc7150ac4a3d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d9d080e89e, %r1, %r9
	setx	0x69d2da19172ba033, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e198630c3e, %r1, %r9
	setx	0x7d139c4ef7a10ea3, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fe3e085550, %r1, %r9
	setx	0x803e4d7eb563483a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e4dfd98, %r1, %r9
	setx	0x561a514d36c25086, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f1c6ad4, %r1, %r9
	setx	0xd7c0dc41033e1b82, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cb3ab966b8, %r1, %r9
	setx	0x3179438afbaf9afb, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000dd10151304, %r1, %r9
	setx	0xcc0ee02a31a0962b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ef5b58ee98, %r1, %r9
	setx	0xf7fa1d755140b56d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f02346c4f4, %r1, %r9
	setx	0x96032b0b658e8340, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e8f77c8, %r1, %r9
	setx	0x05a7817da421a2f9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fedf830, %r1, %r9
	setx	0xc1973d345000dc1d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ce41993ef0, %r1, %r9
	setx	0xd0472985ed8e27c0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dbdea1df40, %r1, %r9
	setx	0x10c08b8f17a77850, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e906626cd8, %r1, %r9
	setx	0xf6f2f188a777ef6e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fe5ae297c0, %r1, %r9
	setx	0x0018f3acd1e59f15, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f604456, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e9f16d6, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f419577bba, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e6dfdba512, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000db626dd938, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cac65a064c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f297390, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c67fed6dc0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e85418dac0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000dd34c31438, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800edf8b33, %r1, %r9
	setx	0x5f816d0b4572341b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f5dc16e, %r1, %r9
	setx	0xdb21a543a6987554, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000caab9bedc8, %r1, %r9
	setx	0xe2a029d003257616, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d89f5aeb03, %r1, %r9
	setx	0xb83a9f99f2440b4a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ec72ef5ec7, %r1, %r9
	setx	0x5e190fa76fc3a5df, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fa6977779b, %r1, %r9
	setx	0x9a8abac50b131120, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ea8c972, %r1, %r9
	setx	0x729f173c33a2177f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fe1c798, %r1, %r9
	setx	0xe26818f2a9213c15, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c11e5ca728, %r1, %r9
	setx	0x3f2af8e7628b803a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dd17852884, %r1, %r9
	setx	0x24db132c2c59a5a5, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ef1d5cbf0c, %r1, %r9
	setx	0x977c4aff8ace6de4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f86bcc3066, %r1, %r9
	setx	0xcb07655739b3a68c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e597b08, %r1, %r9
	setx	0x3f6ebb4684e99110, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fb08fd4, %r1, %r9
	setx	0xbb32d8370764686b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ca3f2a0150, %r1, %r9
	setx	0xcb63ba4a1c576919, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d6db614b50, %r1, %r9
	setx	0xea14c7f092f8a1b7, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e4c20897dc, %r1, %r9
	setx	0xe36baae08c2cca14, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fe7b8fb618, %r1, %r9
	setx	0x34404d2454ba17d5, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800eee0710, %r1, %r9
	setx	0x869ad9b6f7cef442, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f9f7388, %r1, %r9
	setx	0x9af7b862fdb8c772, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cff73efdc0, %r1, %r9
	setx	0xf12f2470a4a14c97, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dfefe48510, %r1, %r9
	setx	0x203e04e94c126f17, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e6003bbb58, %r1, %r9
	setx	0x495178592764c1b8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f28c630ad0, %r1, %r9
	setx	0xc21d47dc43ce6764, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c9e2e5c2f6, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f94c4bd, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800eea37fc, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f8b8bf22da, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e71060c1c2, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d2fe3baf0d, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d530e261dc, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d4d7745e38, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e075a64, %r1, %r9
	setx	0x1c6b3f452a57bbbd, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ffe6ec0, %r1, %r9
	setx	0xc64293f5979a3acd, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cee7a7aabb, %r1, %r9
	setx	0x389c9e55a2f7bcf2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dbd56aa889, %r1, %r9
	setx	0xd98c93e60ccd9985, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ee142b4ac3, %r1, %r9
	setx	0x62081f601b2a766c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f0a28a4eff, %r1, %r9
	setx	0x8d7d41913d9124d4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e70d288, %r1, %r9
	setx	0xfa1e91761b9cf3ec, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f4a7d08, %r1, %r9
	setx	0x1e8e485e3df82162, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c5734df830, %r1, %r9
	setx	0xaf0b244edc92d975, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d0c234fcb0, %r1, %r9
	setx	0x1b4d3ad246f1371b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e17ab5dcc0, %r1, %r9
	setx	0x04cdd6ba39abb2e1, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f69311f118, %r1, %r9
	setx	0x2f33507f3a1fc112, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ef94130, %r1, %r9
	setx	0x7a06ae15b3019e21, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fef9130, %r1, %r9
	setx	0x0a54516429c800a8, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c4cdf6da5c, %r1, %r9
	setx	0x86e95ff4d9e51dd1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d90460df58, %r1, %r9
	setx	0xe39117c0e96c4a5f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e5d2ef1f14, %r1, %r9
	setx	0x2cb3063f8318f204, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fc1e813ee8, %r1, %r9
	setx	0xa750a11ecb8ea89b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e999eb0, %r1, %r9
	setx	0x7dd5491141499a7d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fe08f48, %r1, %r9
	setx	0x0be99f70cf16912b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cefb22e318, %r1, %r9
	setx	0x3dfec75628375404, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000df91743b50, %r1, %r9
	setx	0x1232af097fbcdc52, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e776778e58, %r1, %r9
	setx	0x4a6a716d2f8f8847, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fec6d8cd98, %r1, %r9
	setx	0xd56869d216403ea5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d9a246ff92, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c3ebddaac4, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d3b89bcdd6, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ca1fa18954, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f5a8988, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fb35850, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e369438, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f2516ef6e0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e0c7ac08f0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d4c8bf47d8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000ceb44c9f30, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fcce308, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ed45c28, %r1, %r9
	setx	0x04808d486c1a9dd9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fd26d65, %r1, %r9
	setx	0x995e4158fff635d9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c50fa98600, %r1, %r9
	setx	0xfe0135183db0f018, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000df3a122198, %r1, %r9
	setx	0xaa231237800c1ca4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e48b04e7f4, %r1, %r9
	setx	0x725c009591a57298, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f4d96d7e5d, %r1, %r9
	setx	0x22cf4dcdf7148842, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e2e06f4, %r1, %r9
	setx	0x22a9332e7ac810cd, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f9af472, %r1, %r9
	setx	0x5af7f5aa3e463e94, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c7b5746ef2, %r1, %r9
	setx	0x4f3e1b569d290670, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d6b734506c, %r1, %r9
	setx	0xdaa1d985524900a2, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e05709f352, %r1, %r9
	setx	0xb133e480233ae487, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fa01d42e82, %r1, %r9
	setx	0xbf3761df13986fc6, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e6621fc, %r1, %r9
	setx	0xf72026cc481e1789, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f8747a4, %r1, %r9
	setx	0xa5faf529f1c2298f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cbe4b6b17c, %r1, %r9
	setx	0xf01e2d954f04690e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d7c4877ffc, %r1, %r9
	setx	0xad3dc59596f3bb0b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e6ce8258dc, %r1, %r9
	setx	0x04b93472e395cf54, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f02ea3d988, %r1, %r9
	setx	0x2201df639005b68b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e455d58, %r1, %r9
	setx	0x14e3e332b8e32f52, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fc8e810, %r1, %r9
	setx	0x96be93814b53acf7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c5cec563d8, %r1, %r9
	setx	0x508132d14088b50c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d3cf918b78, %r1, %r9
	setx	0x907694b3476aee16, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000edb3ea6a90, %r1, %r9
	setx	0xed4473b9066ea38f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6bb4986c8, %r1, %r9
	setx	0xf998344f0a8309dd, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e7793fc, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f85290548b, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f403d60, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ed84a60, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e12e101, %r1, %r9
	setx	0xdd9eefa3c6ef03d0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fdd7903, %r1, %r9
	setx	0xf4bf86d8f49856b6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c5b4fbe586, %r1, %r9
	setx	0x3fac6d4ace8ca38a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000da4df45b59, %r1, %r9
	setx	0xa8636728dd2a1355, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e0e5423207, %r1, %r9
	setx	0x43c8ed811845cfb7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fcc47a551b, %r1, %r9
	setx	0x851b44ceaacf2ae1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e86e2ce, %r1, %r9
	setx	0x67a3ca62423bc414, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f3566c6, %r1, %r9
	setx	0x311c04b1d32f10da, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c4bdc04936, %r1, %r9
	setx	0xa2e93fe92e2a2840, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d08aa96aba, %r1, %r9
	setx	0xd0bb6e1bc2f9713a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e95790ff8c, %r1, %r9
	setx	0x4d8a9bf535443296, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f2b4cc589a, %r1, %r9
	setx	0x1665557e5f29bcb7, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e9020b4, %r1, %r9
	setx	0xd0591a2ae752fe6c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f95804c, %r1, %r9
	setx	0x9594c96c337264e0, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c17efb14b0, %r1, %r9
	setx	0x14404bab38b9edc6, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000db1ea08f6c, %r1, %r9
	setx	0xc503e6875449daa1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e8d016d9e4, %r1, %r9
	setx	0xe9b3be83cd7587da, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f80892455c, %r1, %r9
	setx	0x404f599e5f35b239, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e438cc0, %r1, %r9
	setx	0x30e79758aeb534ef, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f113ff8, %r1, %r9
	setx	0x8d866a15ac1dc2c8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c974151ac8, %r1, %r9
	setx	0x240d05942aa85bee, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dfe5b6f808, %r1, %r9
	setx	0xada21716db30269e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e1ec37ad30, %r1, %r9
	setx	0x145249ab89af5075, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6e081aeb8, %r1, %r9
	setx	0xeca177d3b863db36, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000da91c2b699, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c619bd8d57, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d0b1349168, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c3f1dbbe34, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800fdc3f38, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800ea70f9c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f136d60, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e1545d0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f43c256de0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e083d60bd8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000df32b9ae70, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c11eb414a0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800efbbf61, %r1, %r9
	setx	0x3d2390955fba057b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f2a95ee, %r1, %r9
	setx	0x14bd6a21f937020a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c1dc6c3bc3, %r1, %r9
	setx	0xaffe0fa8208ffaea, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d32cb5b932, %r1, %r9
	setx	0xc1cfad4f241f38f6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e0471d1e90, %r1, %r9
	setx	0x4974e6a233237b90, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f2fd8f3dc8, %r1, %r9
	setx	0xd236be28152f8f49, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800eee81ce, %r1, %r9
	setx	0x080bd7cfe5f69958, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f841ac0, %r1, %r9
	setx	0xff9f4ff3755b8c08, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ca0ce738d4, %r1, %r9
	setx	0xad51530da41e7e40, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d6547f0454, %r1, %r9
	setx	0x9cb1bb6713b11172, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e7b466186e, %r1, %r9
	setx	0x940e08c60b2a4da1, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f8aad892b8, %r1, %r9
	setx	0xdb3f46d998206c2a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e8bbc7c, %r1, %r9
	setx	0x8fb27960f2bb2c25, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f39692c, %r1, %r9
	setx	0x48453b2e733400d6, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c651a31b6c, %r1, %r9
	setx	0x304716106245a804, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000da5de6f73c, %r1, %r9
	setx	0x8df4baf6b99e8a3c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e42df6a588, %r1, %r9
	setx	0x2fe9337cf3a73d79, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f8cc3bd174, %r1, %r9
	setx	0x4c455221d0414498, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ef60158, %r1, %r9
	setx	0xa063601d1b45d020, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f37b708, %r1, %r9
	setx	0x6b0a15a5832625c9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c873efc4c0, %r1, %r9
	setx	0x78d658c6561a322d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000db59946500, %r1, %r9
	setx	0x8c1245f4263fc212, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e3795c0720, %r1, %r9
	setx	0xc83cf1d8df52f918, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fe57adf760, %r1, %r9
	setx	0x97db924159f8aae1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c50fa98600, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fd26d65, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ed45c28, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f0a28a4eff, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f87aa16288, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e9c19b8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f28f26ab04, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ea7c9cff54, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000de50cccb54, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ce13322184, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800fb7e2e8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e45823c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000df91743b50, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000cefb22e318, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fe08f48, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e999eb0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f28c630ad0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e6003bbb58, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000dfefe48510, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e22e319, %r1, %r9
	setx	0x280c039dfe450855, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fb1319f, %r1, %r9
	setx	0x641b4f445e821499, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cea3a70f33, %r1, %r9
	setx	0x60fee5904b6eba95, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d4a0211aa4, %r1, %r9
	setx	0x72e1424a19f2411c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e3407ca131, %r1, %r9
	setx	0x65f3ff072ac2af1b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f812439fe6, %r1, %r9
	setx	0x2ddde3c4783217ea, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ea435de, %r1, %r9
	setx	0x8ef78264462752ad, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f60d71a, %r1, %r9
	setx	0xc6febfea8dede451, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c536f0d800, %r1, %r9
	setx	0xb8fe001108a95458, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d8dac1458a, %r1, %r9
	setx	0xba1f07eee56a7e28, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e8f6d7d950, %r1, %r9
	setx	0xd40d6ef0fc127cbb, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fc3380b694, %r1, %r9
	setx	0xf2e2808f24fa3419, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ed77c58, %r1, %r9
	setx	0x46f311558bddf92b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f012b5c, %r1, %r9
	setx	0x78bdfdf0d39387bb, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ca6d50e900, %r1, %r9
	setx	0x5a4ca4cf53eb5b68, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000dddc8197b8, %r1, %r9
	setx	0xf5435f4e258f3bb0, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e049b5cc84, %r1, %r9
	setx	0x59136d5d7db9bd8c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f2b4522188, %r1, %r9
	setx	0xa7f70070f617693c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800efc4748, %r1, %r9
	setx	0x58e61c678ab397f8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f967b78, %r1, %r9
	setx	0x9452fd90bcb3b7eb, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cbb826ee70, %r1, %r9
	setx	0x46864e7a4c9c368a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d226f40a10, %r1, %r9
	setx	0x5ca56e21fae36ad0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e2577f5368, %r1, %r9
	setx	0xa7078ed1cf9d5e4a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f49d8a56b0, %r1, %r9
	setx	0xcd1ba283bf07ee1d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f0a28a4eff, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ee142b4ac3, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000dbd56aa889, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000cee7a7aabb, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800eb3cb6e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fc0c89f64a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c873efc4c0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f37b708, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ef60158, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f6e081aeb8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ea9d49d, %r1, %r9
	setx	0x30a46105773658ef, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f7df73c, %r1, %r9
	setx	0xbef38582bc0fd2d0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c1f5a28d5e, %r1, %r9
	setx	0x509ce10041d771d5, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d9b62de96f, %r1, %r9
	setx	0x5c5c7b8779ffa783, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e996883906, %r1, %r9
	setx	0xcaabab6afb0c9630, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f8e3e603f3, %r1, %r9
	setx	0xe5208e3c55d02c0d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e584c44, %r1, %r9
	setx	0xd5e8dad9e51d0e2e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fc59640, %r1, %r9
	setx	0xddbe19089031f291, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c00c5d0f56, %r1, %r9
	setx	0x2f2841b23592d5ba, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d612cda7ee, %r1, %r9
	setx	0x84b2492928a1b2cb, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e8e12df1ba, %r1, %r9
	setx	0x4882245960ae4537, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f266707d1c, %r1, %r9
	setx	0x5627e3f959d44362, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e89ec3c, %r1, %r9
	setx	0x1f3fe5964a48a2f1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f556448, %r1, %r9
	setx	0x48cfeec6f53ec266, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c391ffbd0c, %r1, %r9
	setx	0x84eb4abad093dfe9, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000dc5317cfe8, %r1, %r9
	setx	0x315ad76d4a8db5e0, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e64db7b810, %r1, %r9
	setx	0x50a9b9a41b520e62, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fe130ea8b4, %r1, %r9
	setx	0x29cec745898eab75, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e807088, %r1, %r9
	setx	0xc6bc0c7a08c2bb59, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fec98d8, %r1, %r9
	setx	0x862cb4ff0e6ccac8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c7f0899ba0, %r1, %r9
	setx	0x51dd5febe03619d1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dd1633e6a0, %r1, %r9
	setx	0xf9af9995e5c7bdaa, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e6a2662ef0, %r1, %r9
	setx	0x61359f181a990420, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000faffbae668, %r1, %r9
	setx	0x280f081f422acd46, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c9e2e5c2f6, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e9c9c7125c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d0e7d5a28c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c7e68adda8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f2cc42ee04, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e82d40cf70, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d3cebdbc48, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d80d005980, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c253f65a40, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800edd81b2, %r1, %r9
	setx	0x8835fa42c11083c8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f3b8ab7, %r1, %r9
	setx	0x2b8b780cce1b555f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c4a2205bd3, %r1, %r9
	setx	0x1d775aa2fc408b63, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d2f0ed7f0e, %r1, %r9
	setx	0xc6dc5fd9561f9099, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e40a099fb5, %r1, %r9
	setx	0xd0257d258ea397e9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f4e2b15271, %r1, %r9
	setx	0x50f089a59e44f609, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ea6ce64, %r1, %r9
	setx	0xa0ee6646cab8662a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f99e22e, %r1, %r9
	setx	0x9814c8300e7b05c0, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c88b1dc912, %r1, %r9
	setx	0x8eaa1726404fde9a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d1943f83c8, %r1, %r9
	setx	0xa13347088ac67f36, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e61b47bae2, %r1, %r9
	setx	0x1029d7b395defdd3, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f2ca324e1e, %r1, %r9
	setx	0x37c5551073412086, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e554894, %r1, %r9
	setx	0xc5430224347a14fb, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ff95010, %r1, %r9
	setx	0xafa2f1ac3da7176e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c69e8d927c, %r1, %r9
	setx	0x559c25261e4bd656, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d372769590, %r1, %r9
	setx	0x7db76c1f87d1e4fa, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ec22f20340, %r1, %r9
	setx	0x8f38e668a560f6ac, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f0eacd1054, %r1, %r9
	setx	0x05b4fabd091ee732, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800eb9dd60, %r1, %r9
	setx	0x5eaec5ef24801369, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f3b56b0, %r1, %r9
	setx	0x41a7b1e0fbf7420f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ce75cb0e18, %r1, %r9
	setx	0xe026b093549c7f15, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000df57c9bd90, %r1, %r9
	setx	0xdb6bf4685b20079e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e24f899c50, %r1, %r9
	setx	0xd8c6e36216d2c304, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f4c329bd50, %r1, %r9
	setx	0xd1045b9135e98e22, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ef0c5be, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f01283c787, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ed6f3cc315, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000de177af458, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c7c685296c, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f200295, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e049b5cc84, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000dddc8197b8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800fbf1888, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e373018, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f6fda1f4c0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e17d71ff58, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d13f82c210, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e37ef8d, %r1, %r9
	setx	0x754e3825077dd38f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fb70a76, %r1, %r9
	setx	0xa9a27723dc7f7a6f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cfb33ba316, %r1, %r9
	setx	0x0eee3a51a4605e2e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d22eb64ecc, %r1, %r9
	setx	0x982fb5e793eb83db, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ef719cad17, %r1, %r9
	setx	0x415e623ab2d8aeb9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f23f8e3fe0, %r1, %r9
	setx	0x8cc2d1d622201028, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e6d5b92, %r1, %r9
	setx	0x5ea5b7cb0a9a70bd, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f2e27da, %r1, %r9
	setx	0xedd36a9c8fd899e9, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c335a1b55e, %r1, %r9
	setx	0x2467d4c467fbbd9e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dd865bcc44, %r1, %r9
	setx	0xa4aefe883c84372c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e0cf9cd052, %r1, %r9
	setx	0xf6fc4367b50efc50, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fcb970a9da, %r1, %r9
	setx	0xc53b38e948d36511, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e61270c, %r1, %r9
	setx	0xab13e807cc57c0ee, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fb8716c, %r1, %r9
	setx	0x74fb4dedf66f1246, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c72b9cc698, %r1, %r9
	setx	0x638ddd123c5d84f6, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000df27ef7bb0, %r1, %r9
	setx	0xd1a10d2991453ec1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e6808298f0, %r1, %r9
	setx	0x148ff2c646dfc4a9, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fa40696dcc, %r1, %r9
	setx	0x835978e157df6d93, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e43acb8, %r1, %r9
	setx	0xc9db98af29000930, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f353278, %r1, %r9
	setx	0x136adf6e4e136631, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c03b282968, %r1, %r9
	setx	0x8044c363f83fdf33, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d784432540, %r1, %r9
	setx	0x7a8820fc100b788e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e9c305c668, %r1, %r9
	setx	0x3eb7c39aa0479794, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f4b94ec9d0, %r1, %r9
	setx	0x4a1164cb9983e9ef, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c79711df19, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fceeb4f, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e3222f2, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000febe9a1794, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000db4544c212, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cec3aaf2d4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e1ba060, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f0cf3b6608, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e57d7b79d8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d8f48445a0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c67fed6dc0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f35a768, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800eb0b049, %r1, %r9
	setx	0xc7964d58c944f19b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f86f4af, %r1, %r9
	setx	0x55f38001f57c0b85, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cf81891a22, %r1, %r9
	setx	0x1cbe6c9e66006f6f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d0f968c0ff, %r1, %r9
	setx	0x3f101d5e73b06322, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000efc9cecb94, %r1, %r9
	setx	0x11331e8cdee8286b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f87582d5af, %r1, %r9
	setx	0xb78f548730f6fbbc, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e9f29e2, %r1, %r9
	setx	0xdb14419bc8a8cfc2, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ff2f11e, %r1, %r9
	setx	0x5d57646384a3eb07, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cec0ec16d2, %r1, %r9
	setx	0xacf6981943379f66, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d346d2efea, %r1, %r9
	setx	0x727fbbb656ba1958, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000efd5b30808, %r1, %r9
	setx	0x1fdaa2b854e0a0da, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fceba8a1a4, %r1, %r9
	setx	0xf031b333fedc249a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ed126e4, %r1, %r9
	setx	0x5f631b0428ab5924, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fb1b694, %r1, %r9
	setx	0xdaff778a51d111da, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cbe8cf04f8, %r1, %r9
	setx	0x0355525cef8a0a38, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d39e148140, %r1, %r9
	setx	0x11492b88f039b90b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ee4646e660, %r1, %r9
	setx	0x4882ef0be3862764, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f416728ad0, %r1, %r9
	setx	0x56b9ae656b522bda, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e98a458, %r1, %r9
	setx	0xcbe20231b9e42529, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f8076e8, %r1, %r9
	setx	0x6e2a4ecd11557f6c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c4b81376d0, %r1, %r9
	setx	0x37077a84b72acbfa, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d9cb13dc50, %r1, %r9
	setx	0xe170a313e01d97f0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e8d5fb08f0, %r1, %r9
	setx	0xee3bde1438616b1d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f49b0c86b8, %r1, %r9
	setx	0x3a068a50e43e3077, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d2f0ed7f0e, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c4a2205bd3, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f3b8ab7, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d365e0aa1c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cdf81be080, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fb516b8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e73e0b0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f45dd9aafc, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e70e5823b4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f07fbad230, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ea2c3c2f88, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d1d34004fc, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f478fb7098, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e6040e5068, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d3ee014bf8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c992f19770, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fef3f10, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e5256af, %r1, %r9
	setx	0xe27f253459006184, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f9168c5, %r1, %r9
	setx	0x4db7d930a92e8b67, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ccbb35f68a, %r1, %r9
	setx	0x6470c08fcfd1eb93, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d097fe5296, %r1, %r9
	setx	0xc739d9a573d80f4d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e46e422b40, %r1, %r9
	setx	0x0fb26c9f45347ac9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f8964a71bc, %r1, %r9
	setx	0x2aaf7f14fc2a1070, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e3d9f28, %r1, %r9
	setx	0x61d5f91b40481d2c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fc5ebd2, %r1, %r9
	setx	0x52cb77435c484f84, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c132db54c8, %r1, %r9
	setx	0x480e8e69706ebc60, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d5b5bb16be, %r1, %r9
	setx	0xd8de52e6a48bf131, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e0b2a126c8, %r1, %r9
	setx	0x2a610ef452a0543d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fc569dca4a, %r1, %r9
	setx	0x3aa307e9e5b3dde7, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e53ada8, %r1, %r9
	setx	0xb6122ed5601345cd, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f447440, %r1, %r9
	setx	0xc08061d7e95e8e4c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ceaa57fb34, %r1, %r9
	setx	0x3925ea93e3f3ac40, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d623519b5c, %r1, %r9
	setx	0xe1b5ec9de9416205, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e77f852700, %r1, %r9
	setx	0x3b12e8a1b9da2280, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fe6672fd78, %r1, %r9
	setx	0x96d7a2f49aae7425, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800eb77340, %r1, %r9
	setx	0x76c3fc47fb51e367, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f28e960, %r1, %r9
	setx	0xb76cafe866874889, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cef0a3aaa8, %r1, %r9
	setx	0x0e6777e9987577f1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d9b6805ca0, %r1, %r9
	setx	0x6afbe57eaea77beb, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ea8f45ad98, %r1, %r9
	setx	0x9b8cf1f0ae7c4459, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fa285093c0, %r1, %r9
	setx	0xc8443a3bcff5a259, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c6565c09d6, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f641cb1, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e53ebaf, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000feeff099e3, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000edcfd8f870, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d537ba5060, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800eee81ce, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f2b4cc589a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e95790ff8c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d127c8f5d0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c90e0a9fd8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800fc93628, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800eb475c0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fc98058308, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000df57c9bd90, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000ce75cb0e18, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f3b56b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e14111c, %r1, %r9
	setx	0x259f05d0a4af84e5, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f8defd9, %r1, %r9
	setx	0xb906e30b6171b977, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c51f3879b8, %r1, %r9
	setx	0x9b2daebf27be52e7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d20d797d31, %r1, %r9
	setx	0xcba8b64104dd00cc, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000efd61605e2, %r1, %r9
	setx	0x12111c8ed22e606b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f4da8e04f1, %r1, %r9
	setx	0x3616cab30c66db0a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e13eb82, %r1, %r9
	setx	0xfda2941837e36e70, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f97adf0, %r1, %r9
	setx	0x28d33cfdc0780d88, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c7ba7d3ac8, %r1, %r9
	setx	0x8e68fbe28099d673, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d7dcb1afca, %r1, %r9
	setx	0x6c9b6aeb4a729e34, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ee4e077114, %r1, %r9
	setx	0x4fbd47cdc7d8c5b5, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f61d352e3e, %r1, %r9
	setx	0xc000aee1955d27dc, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800eea8788, %r1, %r9
	setx	0xf2c4c1e905d8a8c0, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f71dae0, %r1, %r9
	setx	0x552b55b4b1e4d2c7, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c6353fcf60, %r1, %r9
	setx	0x19feb4c3b56211dd, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d54835029c, %r1, %r9
	setx	0x53fd2990eb8648f9, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e6d5a4b310, %r1, %r9
	setx	0xf794dea7c81ace43, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fa25bb9ea0, %r1, %r9
	setx	0xd9e26b41491a8d44, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e4f83b8, %r1, %r9
	setx	0x02bd24cad0d2323a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fa31b58, %r1, %r9
	setx	0xf18f067313170229, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c2dd64fdc8, %r1, %r9
	setx	0xb01dcd7abd4cee4a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d0cdbf2ba0, %r1, %r9
	setx	0x2ece5fa1432e8dcb, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000eddccef8e0, %r1, %r9
	setx	0xaf808fafbfce3386, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000faeaca1930, %r1, %r9
	setx	0xa5f1accd802b194d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e5c2cb3266, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d112a686a4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cbe8f37b98, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fcbb218a28, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000eaf5162b74, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c1e7f7a668, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fd53c88, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ebc32d8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f65b8d1b60, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e33f63a0a0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d69abaaec0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ee74dbb, %r1, %r9
	setx	0x409dfa2bd7aa2c69, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ffed966, %r1, %r9
	setx	0x362f4470a90e4ec8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cadcf69121, %r1, %r9
	setx	0xa85b5c709d42a6bb, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d5bc91bd6d, %r1, %r9
	setx	0xb0505f30bd066726, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000eb92a7a294, %r1, %r9
	setx	0xb0419cc7926e475d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f4710ded84, %r1, %r9
	setx	0x857ab8b84935f643, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e5f3372, %r1, %r9
	setx	0x4134014d1473cefd, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f68943a, %r1, %r9
	setx	0x834aff5bdfb567fa, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cb163434ba, %r1, %r9
	setx	0x571382d74aff8cbc, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000df9c6ac0a8, %r1, %r9
	setx	0x9d7e2876a37878b1, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e71db4b196, %r1, %r9
	setx	0x31a7529fd762d32a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f22e075bea, %r1, %r9
	setx	0xf20b8186351da34f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e4f7130, %r1, %r9
	setx	0x3edc98005943ca99, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f160468, %r1, %r9
	setx	0xf4739796e9f62995, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c9bee4cb44, %r1, %r9
	setx	0x2a0cbd6b633800b3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000da97f95750, %r1, %r9
	setx	0x1291b6af922dddaf, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ec48d76b84, %r1, %r9
	setx	0xfe9906f2bf9520dd, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fe9caa6124, %r1, %r9
	setx	0xa827b18e20e421bf, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800eedbc90, %r1, %r9
	setx	0xde115af6298e1f28, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f193750, %r1, %r9
	setx	0xb6ab776c3af5259a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cdd5874a70, %r1, %r9
	setx	0xe8171eb15a6d3968, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000de1fe68bd8, %r1, %r9
	setx	0xd0387e03f2e6f721, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000efa8ea7ac8, %r1, %r9
	setx	0x894bb9c75cae85a0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fc7f90b4a8, %r1, %r9
	setx	0x1f16db0abdd368b4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ca4ec319af, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fc52bc7, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e9dc437, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fe0cbcca92, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e9c9c7125c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d0e7d5a28c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c7e68adda8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f7610b8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e82d40cf70, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d3cebdbc48, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c2bde634b4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f4bf0b0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e5669a4, %r1, %r9
	setx	0x6f4bcbf47f9b7847, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f3be12e, %r1, %r9
	setx	0x4e270bff42ca3c72, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c88126ecdd, %r1, %r9
	setx	0xd7063d6452725508, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d418842266, %r1, %r9
	setx	0xf1992ee64343ce46, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e941f081f4, %r1, %r9
	setx	0xbcf70754fa4861a3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f6d65b4833, %r1, %r9
	setx	0xf239944ea4c9ffa7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e361782, %r1, %r9
	setx	0x42a7cbffb35bbd3e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f7d166e, %r1, %r9
	setx	0xf2e34d638b8c4f28, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c70e0da82c, %r1, %r9
	setx	0x78c44a1ca6a5a1e9, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000de787d58aa, %r1, %r9
	setx	0x6b700e8d539d1cf4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e2017b7186, %r1, %r9
	setx	0x6de09053615ab840, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f20911a6f6, %r1, %r9
	setx	0x00bbf62d2ddca283, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ea67914, %r1, %r9
	setx	0x1cfdfbeafe2bb56f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f6d42a0, %r1, %r9
	setx	0x4334273e00a4bcea, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c23f19bdf0, %r1, %r9
	setx	0x39a5447d11e2dd99, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d7458b95e8, %r1, %r9
	setx	0x0e7033037bdba315, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e3e7efacf4, %r1, %r9
	setx	0x4045348f1622e365, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f20b2621fc, %r1, %r9
	setx	0x9c2ef4f5c7437dfb, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e0526e8, %r1, %r9
	setx	0x861f214cda750dd3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f2690a8, %r1, %r9
	setx	0x968a190ba60cac1d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c3601e4ad0, %r1, %r9
	setx	0x254e4bda9039a339, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dde5efbe88, %r1, %r9
	setx	0x74326bb647e4b1ae, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e9341f4eb0, %r1, %r9
	setx	0x67ce9f3be3b2fb74, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f0d6e51278, %r1, %r9
	setx	0xd6ffd953b70ac7a0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ec7523412a, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000df4985235c, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c79711df19, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fceeb4f, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f025df4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800eb073d8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f4e7e38928, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e8718f4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fe5eceea50, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ef0e372708, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d07290f318, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c9fca6ff5c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000efac6d3b18, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d22c496238, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c7d7948c60, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f18c428, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ed1b748, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f83d23cae0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e47a142, %r1, %r9
	setx	0x0e27057e423b1a72, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f3728a3, %r1, %r9
	setx	0xeecbbe7da35f4b05, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c79d81ecef, %r1, %r9
	setx	0x822ee5029b8c63a7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d87f5f0880, %r1, %r9
	setx	0x95fc729688f6563c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e0497bb0b6, %r1, %r9
	setx	0xb045514da07c0bf1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fea1dde552, %r1, %r9
	setx	0xefb4f9801b8a44a1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800eb9d6dc, %r1, %r9
	setx	0xc190aee16ee37f70, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ffd73e6, %r1, %r9
	setx	0x3dfb83e874f58b36, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c5559e2cb4, %r1, %r9
	setx	0x067a5f6f3f49af37, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d5f9c5cbca, %r1, %r9
	setx	0x3447ef0a67cb0db0, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000eb5356cbba, %r1, %r9
	setx	0x27c8513c5ac6a663, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fcd9ed0922, %r1, %r9
	setx	0x0cceeba0b896fba2, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e10446c, %r1, %r9
	setx	0xbf9effd173549087, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f5ff8b8, %r1, %r9
	setx	0x8da5cfcae4c15745, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c57d9421fc, %r1, %r9
	setx	0x3e94d88b692537c9, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000dabf76391c, %r1, %r9
	setx	0xf6aae7653958f8ed, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e6bbf3b26c, %r1, %r9
	setx	0x336e76f970f8e910, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f6fab1b8b0, %r1, %r9
	setx	0x994f1cdafa1e4ce4, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e84e4e8, %r1, %r9
	setx	0xe64d3ffd34005c83, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f6ccc40, %r1, %r9
	setx	0x938b6d1b17996435, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ceed1a5e98, %r1, %r9
	setx	0xff8f98ea4adb275e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000db55e7af98, %r1, %r9
	setx	0x478afea2194025e2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e66bffa5e8, %r1, %r9
	setx	0xf6e1d821f73ccd2e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000faecd83460, %r1, %r9
	setx	0x21810c1c7fb18f94, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d3d543d56c, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000cca2d7f5da, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f50c03d, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e1049f8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f24422dd04, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f0a94b4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800febef7c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e9d83cc, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fe98292e98, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e6d547ac58, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d9853cc9a4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f0ac278cd0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e9580b37c8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d656319c50, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c6cd4fc7d8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f1f59c8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ee4d6c8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f617b46928, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e7172dc, %r1, %r9
	setx	0x7289edcf741286c8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fa22f0d, %r1, %r9
	setx	0x5e757ad13c983b4c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c0247f5e7c, %r1, %r9
	setx	0x1159540eed824f3f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000da0f2dd894, %r1, %r9
	setx	0x2eb8b7a5535fa0b8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e276f3a7c9, %r1, %r9
	setx	0xe33117f15a17b0f8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fa157a9711, %r1, %r9
	setx	0x81e528a66d409705, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e2b3714, %r1, %r9
	setx	0xa0ea27b3c4058b28, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ffe298e, %r1, %r9
	setx	0x87bb03e67938cedd, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cc5636917c, %r1, %r9
	setx	0x8e3afb6aac3f4f20, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d855ebbb26, %r1, %r9
	setx	0x6fef0f6bbc8749db, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ea9c8463f8, %r1, %r9
	setx	0x83de5bab037dc1aa, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f8ed414428, %r1, %r9
	setx	0xd8219b77b9fd3f57, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e4d5b94, %r1, %r9
	setx	0x9d4409efb6ca8173, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fe66a34, %r1, %r9
	setx	0x9164232d23160320, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cb752de810, %r1, %r9
	setx	0xf7f290a5da0e41cf, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d5729c2498, %r1, %r9
	setx	0xe0ff7fb3ec60b779, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ee3c63c1a8, %r1, %r9
	setx	0xe9aa23bfb3eecadf, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f80bc428f0, %r1, %r9
	setx	0x5f932467d9e61845, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ef4c9b0, %r1, %r9
	setx	0xed35ac4198d3e539, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f6339a8, %r1, %r9
	setx	0x8146af0a5013b685, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c1e195c9c0, %r1, %r9
	setx	0xe1b0d3295a4ba4f2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d04c7b0c58, %r1, %r9
	setx	0x6f3e54285e91c5fc, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e316cf08a8, %r1, %r9
	setx	0xd04e40e12aad6500, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000faf329d768, %r1, %r9
	setx	0xf390b26019080791, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cf4b16aec3, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fa883e9, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e073878, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f01feb12a4, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e306b81d03, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ddf59337ff, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c57d9421fc, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f5ff8b8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e10446c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f20b2621fc, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e3e7efacf4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d7458b95e8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c23f19bdf0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f2da4c0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e7bda00, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f6045141f0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e689484b08, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d8b9599e10, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800eacacff, %r1, %r9
	setx	0xc5640669d7bd1540, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f6bbc8e, %r1, %r9
	setx	0xe834b5c7272d713b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c2c67993f4, %r1, %r9
	setx	0xbb6e5a50091ab517, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d2eb66da1d, %r1, %r9
	setx	0x92071c2ae9c802e4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e752da2893, %r1, %r9
	setx	0x987f6c7ad8593779, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f2c6c0695f, %r1, %r9
	setx	0x8c5629f562c8f27a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e9a198c, %r1, %r9
	setx	0x3906d95cca6560a5, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f7a6764, %r1, %r9
	setx	0x5e98e230dd7851f8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c1acf74c02, %r1, %r9
	setx	0x035277dce61c9f17, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dca69c271c, %r1, %r9
	setx	0x0d09617173526d8d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ea25aaf1fc, %r1, %r9
	setx	0x3a9566be706d5309, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f09646deae, %r1, %r9
	setx	0x76132e21158f9a29, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ed83528, %r1, %r9
	setx	0x048a5f43581f72f3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fc55054, %r1, %r9
	setx	0x5ed850aad0bccade, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ce6f8fe920, %r1, %r9
	setx	0xf5b43616d38de67c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000de4442fe14, %r1, %r9
	setx	0x7fc7c3a5abdfb9c8, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e261a779f0, %r1, %r9
	setx	0x2233e9df355244d9, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fcc2efd9b0, %r1, %r9
	setx	0x703c31357e6515b0, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e9a3a18, %r1, %r9
	setx	0xade46f5243f0a654, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fea8c88, %r1, %r9
	setx	0xa7741a6de80c684a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c29b238bb0, %r1, %r9
	setx	0x29f2a99397e8ab3d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d04155a6c0, %r1, %r9
	setx	0x26feaba9659c2f17, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ed041c33c0, %r1, %r9
	setx	0xab4df15deb7c36b3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f01a327b08, %r1, %r9
	setx	0xeca8b179eb8aa5dd, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f200295, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ec2d11b, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f6429a4697, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d2db52e018, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c7ace13f56, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f3065e2, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d7458b95e8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c23f19bdf0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f6d42a0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e0d81fd, %r1, %r9
	setx	0x0b9e7de8def4467b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f07222b, %r1, %r9
	setx	0x65bdfa503376e01e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cbd14ffee2, %r1, %r9
	setx	0x9f731ebc7bc9d5c6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dbd9ab8359, %r1, %r9
	setx	0xebbd8218a322eb77, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e202f9ff34, %r1, %r9
	setx	0x666560d28afaba06, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f217f6e810, %r1, %r9
	setx	0x1ee9d8156e06c243, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ee029ac, %r1, %r9
	setx	0xb1e55b0d50abb77a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f76de56, %r1, %r9
	setx	0x95295cf9081e7584, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ca8de7a7aa, %r1, %r9
	setx	0xf03f07fa62417058, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d9bc1d0e8e, %r1, %r9
	setx	0x97a180a44f1adfb0, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000eefb704992, %r1, %r9
	setx	0xe9856477b46babf8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f04cc264fe, %r1, %r9
	setx	0xc77d312901aef9c8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e425f10, %r1, %r9
	setx	0x12c7edd6abbc9dc0, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f034e94, %r1, %r9
	setx	0x9d5b78c0dbac6b8f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ccca3f5380, %r1, %r9
	setx	0xcdbd6cd884ba01ad, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d4f9bc85ac, %r1, %r9
	setx	0xee251501cb41e5ff, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e2cc08dd24, %r1, %r9
	setx	0xe9cfecb5a08cc2c6, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f86fd05b90, %r1, %r9
	setx	0x9c48b8913f3b9ae2, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e6c4458, %r1, %r9
	setx	0xd685bc3960415792, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fa9d498, %r1, %r9
	setx	0xf0313bce497f0aca, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c7659f70d0, %r1, %r9
	setx	0x4140bf19abb3b427, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000de9ce74248, %r1, %r9
	setx	0xf4bcc897fbd2fbc7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e7ce8e1860, %r1, %r9
	setx	0x8046a38c7b13b54c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f4de1d6648, %r1, %r9
	setx	0xad674c9db042cdaf, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cea3a70f33, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fb1319f, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e22e319, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f2fd8f3dc8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e0471d1e90, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d32cb5b932, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c1dc6c3bc3, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e4d551a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fe0cbcca92, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e9c9c7125c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d0e7d5a28c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c7e68adda8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c2022a25bc, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f6d7120, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e5ddb6d, %r1, %r9
	setx	0x98ca76fecc48e812, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fc7ebcb, %r1, %r9
	setx	0x6c99e0337ca51aa2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c23dd1803a, %r1, %r9
	setx	0xd49a04a617a9be41, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dc2aade47c, %r1, %r9
	setx	0xdd29d84fc6bdd743, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e6c3fd1184, %r1, %r9
	setx	0xc480beee52b56df0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f8439fe772, %r1, %r9
	setx	0xed0a5ef217cfd931, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ee86c56, %r1, %r9
	setx	0x7e750e9a3622aadb, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fcfb016, %r1, %r9
	setx	0xfeb40eccf8790937, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c146ffd264, %r1, %r9
	setx	0x42036ce624a6d900, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000db9cbc1b96, %r1, %r9
	setx	0x12ed2532695ee174, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e70f2d1eae, %r1, %r9
	setx	0x2ab4680f61c72981, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fc19e2315c, %r1, %r9
	setx	0x4c75d2a700446518, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e859ad0, %r1, %r9
	setx	0x1067de50d9b2f4f1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f87099c, %r1, %r9
	setx	0x3444a71bc36d339b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c5419a1f88, %r1, %r9
	setx	0xcfb1586cced786f8, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000dadbd34790, %r1, %r9
	setx	0x686e6c211a497f00, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ebf656e1e0, %r1, %r9
	setx	0xb038d811c83582f5, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f29343fdf8, %r1, %r9
	setx	0xcd140b973197d9be, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e7bd610, %r1, %r9
	setx	0xaf76c188a0df95fb, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800faa4258, %r1, %r9
	setx	0x47d95f2ab1989762, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c19443dce0, %r1, %r9
	setx	0xc998721b986a6f8a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dad4329fa8, %r1, %r9
	setx	0x228215bbe884165d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000eca7bbff40, %r1, %r9
	setx	0xf43e8e3602d43eb5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f4797742b8, %r1, %r9
	setx	0x525607400f4ddd1a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e0471d1e90, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d32cb5b932, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c1dc6c3bc3, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f2a95ee, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800efbbf61, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e05709f352, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d6b734506c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e7e774c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e316cf08a8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d04c7b0c58, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c1e195c9c0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f6339a8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ef4c9b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000faecd83460, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e9b605d, %r1, %r9
	setx	0x6f7cdffa0598c3a3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f4794c7, %r1, %r9
	setx	0x694de158ff8674d4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cbb2f12473, %r1, %r9
	setx	0x8d6e5c228c31568d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d4633dc127, %r1, %r9
	setx	0xb0f30290d98a0017, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e9f62e9989, %r1, %r9
	setx	0xc71accfd8fac820b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f8da25bf45, %r1, %r9
	setx	0x2ba60c6d081b67e2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e923ba8, %r1, %r9
	setx	0x19daf1b8a1705a51, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f264ad6, %r1, %r9
	setx	0xe83d701b26b9406a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cf7c525d10, %r1, %r9
	setx	0xa16443512ea5b1a8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d49229e6fa, %r1, %r9
	setx	0xc08be9f6e3cfc00d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e03fd70d5c, %r1, %r9
	setx	0x01238e1dd3b884cb, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f858d2da98, %r1, %r9
	setx	0x634ccfa382c2bad4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e528d5c, %r1, %r9
	setx	0xf14255154b87439a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f5da1e0, %r1, %r9
	setx	0x3d0f4602820c796e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cc14e627f0, %r1, %r9
	setx	0x2a03d229be70b3e3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d5b5526320, %r1, %r9
	setx	0x63b659e2dc9aa32f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000eb44503cf4, %r1, %r9
	setx	0x45dbb9d0360df3e9, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f81542df74, %r1, %r9
	setx	0x71f3b0924a701d6a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e7e24c0, %r1, %r9
	setx	0x8327a37f5f114602, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fa33620, %r1, %r9
	setx	0x9febfe2e5b6aab05, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c313015138, %r1, %r9
	setx	0xd728ef6f0201c1e3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d90d17d8e8, %r1, %r9
	setx	0x4d729a066438a82a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e2a284af30, %r1, %r9
	setx	0x9c74a21c4e51af03, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f07718f900, %r1, %r9
	setx	0x85040963b988911c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f4da8e04f1, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000efd61605e2, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d20d797d31, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c51f3879b8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f8defd9, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e14111c, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d1ba58d62c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c87ddc754e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e10446c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f20b2621fc, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e3e7efacf4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ce41993ef0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fedf830, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e8f77c8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f659f24388, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000ec7a2b56c0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d092cddb88, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800eee291e, %r1, %r9
	setx	0xb66b555430334942, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f49be42, %r1, %r9
	setx	0x815be37d2d98df3f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c7950c414e, %r1, %r9
	setx	0xcc232f0017e3dedb, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d4a0b4a5a5, %r1, %r9
	setx	0xbb99c7e92dd23538, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e2c7429235, %r1, %r9
	setx	0xb99df5d2b9ed0021, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f40c4fdcde, %r1, %r9
	setx	0x2eba98d691d46c84, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e992acc, %r1, %r9
	setx	0x1353f1df209d1b20, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fc93494, %r1, %r9
	setx	0xa8c0b5806c955138, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cee3f2068e, %r1, %r9
	setx	0x9a75b065b7ffd442, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000da011a929c, %r1, %r9
	setx	0x2865eb1116fe553e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e3f932009c, %r1, %r9
	setx	0xf8c1a1bc2d3aae79, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f0b00aafda, %r1, %r9
	setx	0x86b7bed0475cdf2d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e7bf5c4, %r1, %r9
	setx	0xd102b6435c1f0205, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f65a22c, %r1, %r9
	setx	0x40b06d5b5fac286d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cd50a588d4, %r1, %r9
	setx	0x50a707f85bc742e0, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000df57b75b94, %r1, %r9
	setx	0x68c877dc34726f77, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ef739df77c, %r1, %r9
	setx	0x15e66d4904c2fcbd, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f807a92df8, %r1, %r9
	setx	0x36666204c3329a01, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e9e5180, %r1, %r9
	setx	0xbabc9ccff1ca98a0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f423b40, %r1, %r9
	setx	0xa0ab2f6d152bd1bf, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c444e42bd8, %r1, %r9
	setx	0xb0ba59683d938a9e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d9e88dcba8, %r1, %r9
	setx	0x2f496c7aadb3b840, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e097ae1e78, %r1, %r9
	setx	0xd017f91ef9aff149, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f26ba09d08, %r1, %r9
	setx	0x539bd9ace493615e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e5dfb10, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f4ad75c0d4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000eb0f951e88, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c2bde634b4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f4bf0b0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e08d964, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fa41dddd4c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d3b5014a08, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c679b1a6f0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f042130, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ed84a60, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ec64d28, %r1, %r9
	setx	0xd818f8636caf1a97, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fca17a3, %r1, %r9
	setx	0x95bdc4ca2e8a3229, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cb71f7e240, %r1, %r9
	setx	0x4643eaed60aa29f3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000df0d594d5a, %r1, %r9
	setx	0x58752c1b9cdc802a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e876565894, %r1, %r9
	setx	0x427d46831241f138, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fa7f798cb5, %r1, %r9
	setx	0xf1d6c332be63bf8f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e531fdc, %r1, %r9
	setx	0x94d2d3f41ec40008, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fa64704, %r1, %r9
	setx	0x5110a7a47e586993, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ce727eae0a, %r1, %r9
	setx	0xa980044246a7963f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d80b875d1e, %r1, %r9
	setx	0x53eff6e4c72f4a88, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000edc8a2e1f4, %r1, %r9
	setx	0x0b7a353b001c8c0a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fc1dbaf1cc, %r1, %r9
	setx	0x438db19cb51b6315, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ec0eba4, %r1, %r9
	setx	0x347b59b309efc4af, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f921638, %r1, %r9
	setx	0xa49d5936fce0578d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cb6261930c, %r1, %r9
	setx	0x67b70d590b120ddb, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d16bfc2a10, %r1, %r9
	setx	0x5cdd7397943cbe8d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e7a7b4d280, %r1, %r9
	setx	0xb90e0f17390fd5ce, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f299145278, %r1, %r9
	setx	0x2e59f6496abfadba, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e9a9bf0, %r1, %r9
	setx	0xcd17dbb43e97bf3e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fc15438, %r1, %r9
	setx	0x7ed0d0aff6741c9a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c6201f4aa0, %r1, %r9
	setx	0x2dcdc0195330a951, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d4915eaba8, %r1, %r9
	setx	0x52e04f2d9e74a804, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e9e2dd6348, %r1, %r9
	setx	0x7fb1aaf60e26826f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fef85c81b0, %r1, %r9
	setx	0x0e3c9742b0a959fc, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e073878, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f01feb12a4, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e306b81d03, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ddf59337ff, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c3721858f9, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d127c8f5d0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c90e0a9fd8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800fc93628, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800eb475c0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fc98058308, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ecb6605454, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e8493fe320, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d6ca556518, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c250c85520, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fb35850, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e369438, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e2ce416, %r1, %r9
	setx	0xa9dff9c3690c9c0f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fd4ae35, %r1, %r9
	setx	0x237aa4169a0064c8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c6a4ce97c2, %r1, %r9
	setx	0xdf98e7878c5a0d62, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d700a4b142, %r1, %r9
	setx	0x1cb6609552f6f306, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e06792decd, %r1, %r9
	setx	0xe068ab4be663dc7c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f2fdd1036e, %r1, %r9
	setx	0xffa9e92571093f0f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ec50458, %r1, %r9
	setx	0x0fd01c98491bdb05, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f837132, %r1, %r9
	setx	0xf5fc12122536b330, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cd352061ec, %r1, %r9
	setx	0x62e82e0d8ec6119c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d2551e4a1c, %r1, %r9
	setx	0xd7e000a46c88086d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000eba66bd97a, %r1, %r9
	setx	0xaaa6c197a2855f33, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f478a939f4, %r1, %r9
	setx	0x740290e5478c7c5b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e88f634, %r1, %r9
	setx	0x6898a7170ee9a1f5, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f651874, %r1, %r9
	setx	0x5e795a235c567da1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cf8ecdb290, %r1, %r9
	setx	0xdf04ba9c599d00e1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d761d0774c, %r1, %r9
	setx	0x8d7970ed620926ab, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000eea86d2a0c, %r1, %r9
	setx	0x3bc8c61724ea52b0, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000faadb027e4, %r1, %r9
	setx	0x4ce75381f0352b4b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e5f3058, %r1, %r9
	setx	0x7764905e46272695, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fcb01d8, %r1, %r9
	setx	0xf9ed0319f9fe53e4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c498017a50, %r1, %r9
	setx	0x5499d088d1a3ae74, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dd3b5b91b8, %r1, %r9
	setx	0x4a69bee8a50b7252, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e900f85d40, %r1, %r9
	setx	0x077b0fc638952bb2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f0b4f690c8, %r1, %r9
	setx	0x41b86feccc13fd70, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f49be42, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800eee291e, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f8da25bf45, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e9f62e9989, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d4633dc127, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e1426f9bc0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d1ba58d62c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c87ddc754e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f091dfa, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e99a4b8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e44285d494, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d80b40ebe4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c27e78f314, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800fb02228, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e1bc9a8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f4fa0cdb60, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ea8f45ad98, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d9b6805ca0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000cef0a3aaa8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e49b042, %r1, %r9
	setx	0xa6d3a9c964d85a3b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ff6bf5a, %r1, %r9
	setx	0x383a7e67661c1d85, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ce8430ae9f, %r1, %r9
	setx	0xf41e856bb5b8a782, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d52379ebc6, %r1, %r9
	setx	0x723c79899da53175, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e659213340, %r1, %r9
	setx	0x4711a785f3799953, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f43a4758ac, %r1, %r9
	setx	0x2ee5eddcf76a0a58, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800eeec95a, %r1, %r9
	setx	0x13a6b101c958915c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ff069be, %r1, %r9
	setx	0xbfa0ff072eac202b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c73488b45e, %r1, %r9
	setx	0xcbe0209b054d18e4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000df8fae3ac6, %r1, %r9
	setx	0x8b702dd13d887a95, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e98c294c80, %r1, %r9
	setx	0x77d6ed1ddd403939, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f2d1adeca6, %r1, %r9
	setx	0x40aa09e8c08f8fd7, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e620d8c, %r1, %r9
	setx	0x9f9aa17af5990357, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f93ef2c, %r1, %r9
	setx	0xa04079dd35249453, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c2b3daba70, %r1, %r9
	setx	0x8ce79f967df17675, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000db1a82c7f8, %r1, %r9
	setx	0x640b9a1401e79531, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e48693de5c, %r1, %r9
	setx	0x58322afc36bda790, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f02c9309bc, %r1, %r9
	setx	0x8d69f1385e300c93, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e018b40, %r1, %r9
	setx	0xd7ede0babb8b8587, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ffeadc8, %r1, %r9
	setx	0xaa11d4ade3baaa87, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c112a5ba90, %r1, %r9
	setx	0x1e999efc5b43cced, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d4edcf0060, %r1, %r9
	setx	0x69c4d5e8379ffa30, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ebb28c1f60, %r1, %r9
	setx	0x6edfe0ebdf2abc1f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f45211ca78, %r1, %r9
	setx	0x8f56fbe6b5c3b190, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ec50458, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ef5b58ee98, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000dd10151304, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000cb3ab966b8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e9e5180, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f07718f900, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e2d364d, %r1, %r9
	setx	0x96d39d6c02cb90c6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fbe2486, %r1, %r9
	setx	0x408319d728e6e080, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c389bff223, %r1, %r9
	setx	0x8a32bef9ab0b8be1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d11310b22f, %r1, %r9
	setx	0x1a592de54dccd6a6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e80b2cb754, %r1, %r9
	setx	0xa68224e650f1f4d6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f4635af1e7, %r1, %r9
	setx	0x07f8231177b9511d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e9d5798, %r1, %r9
	setx	0xcf33acf4a6dd73c4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f789030, %r1, %r9
	setx	0x9235bf4ccf3814e2, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cc91ace374, %r1, %r9
	setx	0xba98e233222fdbab, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d3d61f158c, %r1, %r9
	setx	0xc943d78a2ce71f6d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e887e61034, %r1, %r9
	setx	0xcb58fbef2e133687, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f840bf4502, %r1, %r9
	setx	0xe2727ba558f17711, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e447d18, %r1, %r9
	setx	0x3529b15a25c89ce9, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fac5d34, %r1, %r9
	setx	0x7e317485d1202430, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ca22ad60fc, %r1, %r9
	setx	0x908b3ed09b4d365e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d2cf23b7a8, %r1, %r9
	setx	0xf89ddf8a5654a7be, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e3a814cdb0, %r1, %r9
	setx	0xe39bbf3ffc8262a8, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f4759a3da8, %r1, %r9
	setx	0x22330e6b54b797cb, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e132a08, %r1, %r9
	setx	0x2851b29c6824b1e1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f3e31b0, %r1, %r9
	setx	0xa615e6993cb07a27, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c8ee612ad8, %r1, %r9
	setx	0x3fba836a3239edbb, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d23efdaf88, %r1, %r9
	setx	0x268f2804ddf0b72a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e00af503c8, %r1, %r9
	setx	0x874d396c393e8151, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fc5df11cd0, %r1, %r9
	setx	0x3df6cb77fca95d93, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c4cae6999e, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f9abb7b, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800eaebb5a, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f67c43db30, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ec5d421ff3, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d80c71150f, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e2e06f4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f69311f118, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e17ab5dcc0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d0c234fcb0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cb3ab966b8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f1c6ad4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e4dfd98, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f2906a77e4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e4c2ad4958, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d0b1349168, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f83d23cae0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ebbd376, %r1, %r9
	setx	0xe43f5d7181d0f209, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f10aff2, %r1, %r9
	setx	0xe105a42368ab248c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c6017a16d0, %r1, %r9
	setx	0x97abbd217f7af1b0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d07fe69904, %r1, %r9
	setx	0x7f39133a0c309874, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ea7d6c6958, %r1, %r9
	setx	0x1c62e47b32a5f9dc, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f4624047cc, %r1, %r9
	setx	0x7645b5e54239a8a6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ed49d70, %r1, %r9
	setx	0x4517c4e4715f9daf, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f651d54, %r1, %r9
	setx	0x491589fbc5fb74ae, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ceb013d96e, %r1, %r9
	setx	0x3d739b40c9295b0d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dd129226fe, %r1, %r9
	setx	0x2706c5bc06cea680, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e04f94b978, %r1, %r9
	setx	0x10decacea940593d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fef3a1aeaa, %r1, %r9
	setx	0x90d0648c44d5a650, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e786cc4, %r1, %r9
	setx	0xdc0c8e5457529ac5, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fe97fbc, %r1, %r9
	setx	0x5c1769bf9a6e9481, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cee12ff3a0, %r1, %r9
	setx	0x1d5ad41ee1f4aa04, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d07b75e788, %r1, %r9
	setx	0x4cfbf29bfd25561a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e76d6b3d2c, %r1, %r9
	setx	0x77445c5bdeffcd37, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f03dd3bcdc, %r1, %r9
	setx	0xf0dbddeebdb97e6f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e469dc8, %r1, %r9
	setx	0x46919fb1342f64cb, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ff30b90, %r1, %r9
	setx	0xbc1725ddcb005de0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000caae43a838, %r1, %r9
	setx	0x7ff96a9325dca15a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d1e2733bf0, %r1, %r9
	setx	0x6d639e5e878b9f29, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000edf7931dd8, %r1, %r9
	setx	0x0c1cade239242007, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fe025a3ad8, %r1, %r9
	setx	0xe1dc23ade77bb071, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dcb32b12f7, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000cd591b3e40, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000dca2879f88, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000cb616ab57c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f0a175c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e959790, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f08c3ff5f4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e3a5dfc090, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d213386bb8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f26ba09d08, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e097ae1e78, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d9e88dcba8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c444e42bd8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f423b40, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e9e5180, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e901482, %r1, %r9
	setx	0xce82f104a7a1d604, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f10c2a5, %r1, %r9
	setx	0x9bdc0f8e9d826c8d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ce225d94cf, %r1, %r9
	setx	0x946a2ff98d72875c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d281cf1726, %r1, %r9
	setx	0x51b0f5f3f2b2ba39, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e04a716b0b, %r1, %r9
	setx	0x763504aa2295156c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f2ea8b1364, %r1, %r9
	setx	0xff2aa744309767b6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e872716, %r1, %r9
	setx	0xbbf61165c1a1062c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f096cf8, %r1, %r9
	setx	0xf1bf95cd8ac74ef6, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c73cca8b8a, %r1, %r9
	setx	0x4111f223a58909c9, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d709e58d0a, %r1, %r9
	setx	0x80b7c6937c47b527, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e140d2c6e8, %r1, %r9
	setx	0x148dcdcc6ea5bd82, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fef40bb69a, %r1, %r9
	setx	0x3e56fb3f6bc6aee3, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ee4560c, %r1, %r9
	setx	0x897ba21ceefcf93e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fe9fed8, %r1, %r9
	setx	0x16e8d67bbc45d7b2, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cffc5aaf88, %r1, %r9
	setx	0x0f33420b2c2e8a7d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d3e884df54, %r1, %r9
	setx	0x3f02051ae665a638, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ebe2332440, %r1, %r9
	setx	0xf4f35a72f28bb969, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f2527d8fa0, %r1, %r9
	setx	0x44717058e50b00e3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800efb39b8, %r1, %r9
	setx	0x61d4b167bead303d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fad5f50, %r1, %r9
	setx	0x4a4358eacdbea148, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c2cd19fcc0, %r1, %r9
	setx	0x2f5737ad7a6972f3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d7ab93b6e0, %r1, %r9
	setx	0xde9d8411961bb438, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ea00100ae0, %r1, %r9
	setx	0x2a37a31264549d03, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f6bd842a88, %r1, %r9
	setx	0x4866808740e34e3b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d89f5aeb03, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000dff97a30e8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c96a2fc89c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e44f100, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fe173157bc, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e5beef837c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d5f957017c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ceab997da4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800efc4748, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ea8abdc, %r1, %r9
	setx	0x007d787a90336582, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f4d9f6e, %r1, %r9
	setx	0xbf6d0b85ebc2cc43, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c1efc849f0, %r1, %r9
	setx	0x3c6b95f43262b992, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d4d193ca1b, %r1, %r9
	setx	0x27e705608d2bb882, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ed9a9a24e4, %r1, %r9
	setx	0xfc63175055a4b18f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fa5b46c3f9, %r1, %r9
	setx	0x67e5b6597d4e1dc1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e64cdee, %r1, %r9
	setx	0x80d7d0d340f19df6, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f979c96, %r1, %r9
	setx	0xad32a2e7fd9e61e3, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cc0074ae20, %r1, %r9
	setx	0x7782b5c435d7b6fa, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d9c86faa0c, %r1, %r9
	setx	0x18b6344a285d55eb, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e39b568a30, %r1, %r9
	setx	0x625f0dd5b01b5868, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fa1f81e944, %r1, %r9
	setx	0xed362d9e26fac87b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e7dce44, %r1, %r9
	setx	0xc82fbb2439b80b6f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f16d190, %r1, %r9
	setx	0x2e2387b139596490, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c992bc7ffc, %r1, %r9
	setx	0xd72fe07d749c508f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d5edaac2b0, %r1, %r9
	setx	0x751846490f748e05, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e927bba848, %r1, %r9
	setx	0xb0ae2e19819b99cf, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f8d73c2ef4, %r1, %r9
	setx	0xcb6c1ec46af3be4e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e4af448, %r1, %r9
	setx	0xdd2f6f236b3c38c5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f235df8, %r1, %r9
	setx	0x98521a93dcc7e96e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cef7a00c78, %r1, %r9
	setx	0x2b89ba195c52a6f0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d30cece8c8, %r1, %r9
	setx	0x624ec5be3df072e2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e7292dd558, %r1, %r9
	setx	0x630c9181dbabf65a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fea86c9978, %r1, %r9
	setx	0x3ea57c34bb245d0b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cfb33ba316, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fb70a76, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e86e2ce, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fa01d42e82, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e05709f352, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d6b734506c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f02ea3d988, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e6ce8258dc, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d7c4877ffc, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e7bd610, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f4de1d6648, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e7ce8e1860, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ef515c5, %r1, %r9
	setx	0xc2a9b4c22bb76507, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f5f4187, %r1, %r9
	setx	0x3c008e487756c2e4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ca6bfd7049, %r1, %r9
	setx	0xf12bcc0d94e70351, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dc31c8a644, %r1, %r9
	setx	0x6001429f138a5d3e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e358b14e7b, %r1, %r9
	setx	0x7671eb39fac8c68e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fcde81b68d, %r1, %r9
	setx	0x98b2ff2d4e9cf71b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e8581fe, %r1, %r9
	setx	0x12c6f8b5326aa3cf, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f2eb856, %r1, %r9
	setx	0x5069ae8b94aa38c6, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cc40c1c752, %r1, %r9
	setx	0x471f108c3fc67d2b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d4fc06360c, %r1, %r9
	setx	0x3b46371616ccdcf6, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e1ac1b7300, %r1, %r9
	setx	0x96157773031ff890, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f64201fb78, %r1, %r9
	setx	0x09ca36b6a6c1bacd, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800eb655e0, %r1, %r9
	setx	0xba9350460f10ad33, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fd5d8f8, %r1, %r9
	setx	0x5ff68ae9a6e9ed6f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cb684f1568, %r1, %r9
	setx	0x2ff11b2d66382b10, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000da19aeb5f8, %r1, %r9
	setx	0x4053fbd5ad549819, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e1d88ff844, %r1, %r9
	setx	0xc011b059cd99ef0c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f8567c028c, %r1, %r9
	setx	0x3d08a84852c57daf, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ea84f00, %r1, %r9
	setx	0xdafffb98a6a363df, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fb7a8f0, %r1, %r9
	setx	0x7a154471090f385b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c101db92a8, %r1, %r9
	setx	0xbd5407d682bb4008, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d49f7e4480, %r1, %r9
	setx	0x6b29546eb117931f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ec81e996a8, %r1, %r9
	setx	0x6ad4a2dca4ada375, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f0e5542190, %r1, %r9
	setx	0xe0c97b1e915c9543, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e0471d1e90, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d32cb5b932, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e28ea29c06, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d3b89bcdd6, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ca1fa18954, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f5a8988, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d6cf6e4324, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c47e47c12c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e9e5180, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e937d42, %r1, %r9
	setx	0xd138b93f97f9aa10, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f538456, %r1, %r9
	setx	0x5783e4f49c0dd083, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c0f3a57c1c, %r1, %r9
	setx	0x257e19cd3d209dba, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d7793ffd45, %r1, %r9
	setx	0x9559510e5d265b54, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e15bbea79f, %r1, %r9
	setx	0x2311927076e68c97, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f8647763d1, %r1, %r9
	setx	0xe14074fa6ee147c8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e9ea6aa, %r1, %r9
	setx	0xac0887792ac93670, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ff57288, %r1, %r9
	setx	0x58299f4fe2e630b6, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cfd789c69e, %r1, %r9
	setx	0x64bdfaa800e4b3b2, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ddb10e26d4, %r1, %r9
	setx	0x17ab2730fd1340ae, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e7b0b6e1d4, %r1, %r9
	setx	0xccbfab0ba56cf4cc, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000faf126c968, %r1, %r9
	setx	0xff587ccf6270adeb, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800eec9638, %r1, %r9
	setx	0xa9210ff7aec0a155, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f9e4ce8, %r1, %r9
	setx	0xa546068fc9c7bb4b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cd07575834, %r1, %r9
	setx	0xbdbd86d8d4337a85, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d0f2a76964, %r1, %r9
	setx	0xea6e952cad868fe7, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000eaf2ca6940, %r1, %r9
	setx	0xb54cee20e6b5d525, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f8b0084588, %r1, %r9
	setx	0x199c8180f066783c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e5b1240, %r1, %r9
	setx	0x70f49608bd96c393, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f2394e8, %r1, %r9
	setx	0xcb33d8dc214916b8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c77cde3cc8, %r1, %r9
	setx	0xb0d5dbf75318b067, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d87ff3d070, %r1, %r9
	setx	0x937485d6ca652845, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e32aca27f0, %r1, %r9
	setx	0x649e4e1f6fa5c5cf, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f2a3084478, %r1, %r9
	setx	0x60e6aeb508c67125, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ce6f8fe920, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f0e94d8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ef10550, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ea8e165, %r1, %r9
	setx	0xd598e09595a0b3fa, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f50e1f6, %r1, %r9
	setx	0xa838327647ce7a1b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c54ecae96c, %r1, %r9
	setx	0x070ae1f656ab0166, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d47a4c72f6, %r1, %r9
	setx	0x0ac357c3840fbe4e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000eddd52e363, %r1, %r9
	setx	0x99462cdb4dc13d55, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fe99de62c5, %r1, %r9
	setx	0xbb17232a0097d9e5, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800eadb980, %r1, %r9
	setx	0x81f43f284b5fa4fe, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f139876, %r1, %r9
	setx	0xce210bcb5946de3d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cc0aaa565e, %r1, %r9
	setx	0x985ec9b5be4c081b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d892749ab6, %r1, %r9
	setx	0xc0ed5533f52b57f1, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e5b6da3486, %r1, %r9
	setx	0x8ce6efdb75afdf02, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f00def0a80, %r1, %r9
	setx	0x0582f8bed321c187, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e1433c4, %r1, %r9
	setx	0x10b4aa628c4e9a3e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fee2a60, %r1, %r9
	setx	0xac44665e1dc59be7, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c5d0a955bc, %r1, %r9
	setx	0xa1e264911c491e81, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d892dc4e40, %r1, %r9
	setx	0x22ec4464443cc347, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e70719d2e0, %r1, %r9
	setx	0x4e59d134e62a0c1d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fe9b2561c4, %r1, %r9
	setx	0x40df97d43b6f31e0, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ef22c18, %r1, %r9
	setx	0x952e09580234ab5f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fda4188, %r1, %r9
	setx	0x658881d6f0e9520d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cf609ea798, %r1, %r9
	setx	0x89b3b64acb5018a6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dbd07f2200, %r1, %r9
	setx	0x385f383b6143718f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ef8665d510, %r1, %r9
	setx	0xde39a3407d185fea, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f650bdc5e8, %r1, %r9
	setx	0x7f28a318df1ad9dd, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e139a87, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f8fbe98c41, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e6ab868be6, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d1f82995db, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000cfc2eaa1fb, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f3c4471, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e9f3144, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f8aad892b8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000faadb027e4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000eea86d2a0c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d761d0774c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000cf8ecdb290, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f651874, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e88f634, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f299145278, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f21f75bba0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e64b483860, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800eeb1306, %r1, %r9
	setx	0x5446e1ce048f482e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f75b5d5, %r1, %r9
	setx	0x336a4c6423648234, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cc2242f80d, %r1, %r9
	setx	0x6d9ac7d30be0c02c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000da22635ec0, %r1, %r9
	setx	0xfd3680974b5de4e6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e8a4fb8751, %r1, %r9
	setx	0x93a675279546c049, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fc57cba611, %r1, %r9
	setx	0x7ef1e5d74651d228, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ea910f4, %r1, %r9
	setx	0xbad1a3d3e4b46cc6, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f7639b2, %r1, %r9
	setx	0x508d138e4977851e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c900024278, %r1, %r9
	setx	0xdcd45d31c2a0b5f0, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d6f452724e, %r1, %r9
	setx	0x35ff78b53a5f628d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e961c96d00, %r1, %r9
	setx	0xd51686b9285029b2, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f673fae696, %r1, %r9
	setx	0x08a2af037c20cb1d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e199608, %r1, %r9
	setx	0xda24dcf95145eb6d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f8d639c, %r1, %r9
	setx	0x5953f4a374639479, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cfb51c3468, %r1, %r9
	setx	0xcf198199dda2c014, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000da5bb339d8, %r1, %r9
	setx	0xfcc17852cd245c16, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e14a7690c4, %r1, %r9
	setx	0x31ff91a92f642be3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f4723ca804, %r1, %r9
	setx	0xa26c702d80fb557a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800efd8df8, %r1, %r9
	setx	0x7111568c15210d3a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f1cc1d8, %r1, %r9
	setx	0x8e002832a1f986f6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c4d883d908, %r1, %r9
	setx	0x53c81e499c8e8043, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d863f818f8, %r1, %r9
	setx	0x1a35d7e52520c258, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e6cc8c2ea8, %r1, %r9
	setx	0xd968779959256d69, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f4e3f75d20, %r1, %r9
	setx	0xc2ac705dbf1a7b14, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e4d5b94, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f6fab1b8b0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e6bbf3b26c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d9e88dcba8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c444e42bd8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f423b40, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e9e5180, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f07718f900, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e324c63, %r1, %r9
	setx	0x54584da839e0976e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ff34c73, %r1, %r9
	setx	0x005e4d82325f5a16, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cd81d23e6e, %r1, %r9
	setx	0x7b3b3a39a6a57b11, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d5113ab727, %r1, %r9
	setx	0x286e19cc851370e2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e446242d6c, %r1, %r9
	setx	0x90599132a887d3c7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fc65ae5349, %r1, %r9
	setx	0x9e9d095a4cd12436, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ef7319c, %r1, %r9
	setx	0x994d1cf8f7215a45, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fa0aeec, %r1, %r9
	setx	0x01635c10c113301b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cc5723bc82, %r1, %r9
	setx	0x1c45ecaed7747a78, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dad1e1b664, %r1, %r9
	setx	0x39e00f881dce2dc2, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ea4dd61680, %r1, %r9
	setx	0x11c5349bc0ff3524, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f0dee05b06, %r1, %r9
	setx	0xbdb82e545699fa87, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ee2a13c, %r1, %r9
	setx	0xd28fc8a2c4738532, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f1bb164, %r1, %r9
	setx	0x55140699dc6062e7, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c3576f2f68, %r1, %r9
	setx	0x21a33c950e2ddda2, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d9a23de2e0, %r1, %r9
	setx	0x932213e4d34388d3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e56af5968c, %r1, %r9
	setx	0x8a4c4e58dfdf8f94, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fe35337030, %r1, %r9
	setx	0x42579d299b06b372, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ef9fa30, %r1, %r9
	setx	0xb8ac9cf7f384c685, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ffd82e8, %r1, %r9
	setx	0xe3c8a3643126e1ea, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ccacd8d928, %r1, %r9
	setx	0xd338c20228f7fad3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d67c264470, %r1, %r9
	setx	0x7af3c2cab9c77ee3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e25f8bd6c0, %r1, %r9
	setx	0x35b798a04d156c2e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fa3124c1e0, %r1, %r9
	setx	0xf0e4afe9a0792799, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d07fe69904, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c6017a16d0, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f10aff2, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ebbd376, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f4635af1e7, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e80b2cb754, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d11310b22f, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000eb1c0690f4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d656319c50, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800eeae75a, %r1, %r9
	setx	0xb634c5cb8be92883, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fbd4bcb, %r1, %r9
	setx	0xf650e1415af69871, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c0addd3269, %r1, %r9
	setx	0x6883c108dcd92dfa, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d4afe29c04, %r1, %r9
	setx	0xdd8726de984780d9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e18ba6ac12, %r1, %r9
	setx	0x843246cd4a153352, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f211187155, %r1, %r9
	setx	0xa7d0942deae25155, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ea77d7e, %r1, %r9
	setx	0x711d8bb9744d1efa, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fcc3b1c, %r1, %r9
	setx	0xba0fdf41736ac601, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c12283b096, %r1, %r9
	setx	0x50ef98a128e687a4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000da74374096, %r1, %r9
	setx	0xa2751e91d4d09633, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ee82fe652c, %r1, %r9
	setx	0xef3b1aac71c52673, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fe01edf2b2, %r1, %r9
	setx	0x8525aa4fab31f1ed, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e7e7464, %r1, %r9
	setx	0x28a3fe1b650b292f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fce10b4, %r1, %r9
	setx	0xdec3da210575846f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c7bbc6a94c, %r1, %r9
	setx	0xc37a0dda6b89c17c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d142a63758, %r1, %r9
	setx	0xbbe01b88096fc48e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e966ae0568, %r1, %r9
	setx	0xc2b966219779c620, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f6c07cd4e0, %r1, %r9
	setx	0xf19bb9934ac8e89e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e7eb258, %r1, %r9
	setx	0x2c29829392a84b06, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fd4fe50, %r1, %r9
	setx	0x554a57aece8eb8ed, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ce62a3c0a0, %r1, %r9
	setx	0x9aade11a1de0c4ef, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d186eec8d0, %r1, %r9
	setx	0x87ff70984dc24fe2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ec54c6ee30, %r1, %r9
	setx	0x85e4ca69179ba9e1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f82d36b1b0, %r1, %r9
	setx	0x31d250bc49aa41b6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f4794c7, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e9b605d, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f8439fe772, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e6c3fd1184, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e64cdee, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fef40bb69a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c5cec563d8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fc8e810, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e455d58, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000fec6d8cd98, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e776778e58, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ebd1bac, %r1, %r9
	setx	0x6141a806f3a6a857, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fd90144, %r1, %r9
	setx	0xc59cf9437ceac90c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c12d8131ae, %r1, %r9
	setx	0x6764e9b16fc69e7d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d0084f3340, %r1, %r9
	setx	0x6a12e62fd08f6ccb, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e48f8805ae, %r1, %r9
	setx	0x88269cef7b01364c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f6e0a8ba6f, %r1, %r9
	setx	0xcfe5acf842a91d58, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ece8458, %r1, %r9
	setx	0x8f44c6044b0a5da5, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f2832fa, %r1, %r9
	setx	0x394153faa1fe5ac2, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ca5a1d3a1a, %r1, %r9
	setx	0x8c5c53f363d4a14f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d540ecb1a2, %r1, %r9
	setx	0x2c43b3a20e10d0f4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e0af2032b6, %r1, %r9
	setx	0x1dfac1c9a0f2c1fb, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f2c89eddb4, %r1, %r9
	setx	0x21b737999e73bf01, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e2e2ef8, %r1, %r9
	setx	0xf3d3ca10fb966f9f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f9c66f0, %r1, %r9
	setx	0xea499eafe72894ee, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c30d52286c, %r1, %r9
	setx	0xe47ea20372967c0a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d7cd5f0ef8, %r1, %r9
	setx	0x5be2b314ba99779e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e133d8478c, %r1, %r9
	setx	0x8ebdc0f3127ac64f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fe78369aa0, %r1, %r9
	setx	0x8c3b17b99f55f4fe, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e0a6498, %r1, %r9
	setx	0xc02058c540e0a06a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f8682a8, %r1, %r9
	setx	0x93010b5a324194de, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cb54f7b6c8, %r1, %r9
	setx	0xf3740cec687dcfea, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d71b4ac650, %r1, %r9
	setx	0x44ee8e3e10a4044e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e1c7fa5000, %r1, %r9
	setx	0x352287fb2989cb02, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000faf5f41ab8, %r1, %r9
	setx	0x971baf54fb1a83f1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000da4df45b59, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c5b4fbe586, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fdd7903, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e12e101, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f4d96d7e5d, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e48b04e7f4, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f8492d4bf4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e5c2cb3266, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d112a686a4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f37b988, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800eb35b98, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e240149, %r1, %r9
	setx	0x5b1f2302c59d0832, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fe337c4, %r1, %r9
	setx	0x951ad48eefcc30a3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c8515d1034, %r1, %r9
	setx	0x8e936a5caffaa388, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dafdafd91a, %r1, %r9
	setx	0x76765de00315480e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000eed947c1d2, %r1, %r9
	setx	0xcb9a9b7c844f2799, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fa13b1fea9, %r1, %r9
	setx	0x02507068668f843c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ea308be, %r1, %r9
	setx	0x755eb092e11524f7, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f7721a8, %r1, %r9
	setx	0xa555f2aada4f228c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c8be45908e, %r1, %r9
	setx	0xf7ecff83669878f8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d1d849e314, %r1, %r9
	setx	0x8a2ff0a30487819c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e901c43ee6, %r1, %r9
	setx	0x5dcfcb9046e2c6f7, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f656640b2a, %r1, %r9
	setx	0x2635b23dcc24eead, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e687a84, %r1, %r9
	setx	0xe1be58c9a935f3dd, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f4bcc58, %r1, %r9
	setx	0xa96e3d644a24c225, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c47e30cb38, %r1, %r9
	setx	0xc15d7fea7bbcea7c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000de5f4c8794, %r1, %r9
	setx	0xacb821bbcd784e92, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ed66b170a0, %r1, %r9
	setx	0x3da9850aa7654473, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f44c395908, %r1, %r9
	setx	0xd93c5f6483286802, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e02f898, %r1, %r9
	setx	0x3537b7ed2b959d15, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fe9b9f8, %r1, %r9
	setx	0xc5d3421b9c923e15, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c5238b81c0, %r1, %r9
	setx	0x27af8610986bfdda, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d0e20fb298, %r1, %r9
	setx	0x62605d6918c11d01, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000eaa5d01680, %r1, %r9
	setx	0xfb5507e0106301a8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f20c0384f0, %r1, %r9
	setx	0xb8b2ff7b7d8119e3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f4d9f6e, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ea8abdc, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f2ea8b1364, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e04a716b0b, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d281cf1726, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ce225d94cf, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e5c2cb3266, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d112a686a4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cbe8f37b98, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ff7f39a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e9ff448, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f455ac5fb4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ef5b58ee98, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000dd10151304, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e719d20, %r1, %r9
	setx	0x354fe1180d19cf05, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800feb89a8, %r1, %r9
	setx	0x0206a2885b18fa17, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c9323314ba, %r1, %r9
	setx	0x7df1d534795c55df, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dc35491133, %r1, %r9
	setx	0x0b3b074467af9acf, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e2d47263bc, %r1, %r9
	setx	0x88c6a274bb7a8fed, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f6e3bbca45, %r1, %r9
	setx	0x571b4f14e029cc3c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ed4fd70, %r1, %r9
	setx	0xaf746d8dc263bac4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f73057e, %r1, %r9
	setx	0x69193f54f2ae45be, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c3d7beea34, %r1, %r9
	setx	0x14dd504e94cf9632, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d6b2cb7074, %r1, %r9
	setx	0xc24955da7d353c62, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e53416f1ee, %r1, %r9
	setx	0xfbfda501ea76582a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f0516a75c4, %r1, %r9
	setx	0x19359cb11ace2b37, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ef3c084, %r1, %r9
	setx	0xe771d15646fb91d6, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f9db760, %r1, %r9
	setx	0x42b2eb77ab838c14, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cb64431d84, %r1, %r9
	setx	0xb17b9f6979c5d5a3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d4b4f63438, %r1, %r9
	setx	0xb6304ff281fb7f37, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e7016bbfe4, %r1, %r9
	setx	0xbf7d55cbc4c25377, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fe295b07e0, %r1, %r9
	setx	0x3a09e61f479f58f8, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e04c3a0, %r1, %r9
	setx	0xc7eb2cd5c0a9dd9b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f90b598, %r1, %r9
	setx	0x4168b02fb5f0dd7a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c0b8463360, %r1, %r9
	setx	0xb340b2378c35af94, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d7b2a0b2e0, %r1, %r9
	setx	0x538513e7b2715c6a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000eb9c2c7188, %r1, %r9
	setx	0x7aa2e2a17697ffb1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fa45274cb0, %r1, %r9
	setx	0x2c98105dc51ed627, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e240149, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e6d5b92, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f2ca324e1e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e61b47bae2, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d1943f83c8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cef304de78, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f4de1d6648, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e7ce8e1860, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000de9ce74248, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c7659f70d0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fa9d498, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e6c4458, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ee068aa, %r1, %r9
	setx	0x546f5d1be2584410, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fdcb20b, %r1, %r9
	setx	0xb774ba0a2a2a25a8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c369904357, %r1, %r9
	setx	0x067539865915017f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d5f2976ad7, %r1, %r9
	setx	0x064de0e8942ac111, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e7378472e0, %r1, %r9
	setx	0xf7c3df24d609cd88, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f6c1d76846, %r1, %r9
	setx	0xb9751589a57e1274, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ef8bbc8, %r1, %r9
	setx	0xf7e8eaa95da17daf, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ffb0b1a, %r1, %r9
	setx	0x837dbbf97c18f765, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c6b9b0e3b6, %r1, %r9
	setx	0x5336ac0822a2c01f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d1e17045ea, %r1, %r9
	setx	0xda7efa5eb0c5c459, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e87172fb0a, %r1, %r9
	setx	0x58a8f760df60612c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fe391f7a4c, %r1, %r9
	setx	0x10c35045ba1ecd63, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ecd793c, %r1, %r9
	setx	0xa6159d39178f4e4e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f4ad840, %r1, %r9
	setx	0xc67998775bb33d7b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cb5feab558, %r1, %r9
	setx	0xfb518068029e956f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d06477a870, %r1, %r9
	setx	0x96277ae86d25b981, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ec7f6874a4, %r1, %r9
	setx	0x62ca7985f35dabad, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f6e5f6af04, %r1, %r9
	setx	0xb376b265403f98b9, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e93d8a0, %r1, %r9
	setx	0x8f5e0d1d751f3d77, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f0331c0, %r1, %r9
	setx	0xa61a36b5d41f2e01, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c61948bc70, %r1, %r9
	setx	0x205471e132bc2bea, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d22a1a9af0, %r1, %r9
	setx	0x90e8c0a22daab7e5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e37f9fa080, %r1, %r9
	setx	0xac72af8f221bb1bc, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f2259a6230, %r1, %r9
	setx	0x3e0d7aed0a2904e1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e46e422b40, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d097fe5296, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f8492d4bf4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e5c2cb3266, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d112a686a4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cbe8f37b98, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ff7f39a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e9ff448, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f455ac5fb4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d761d0774c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000cf8ecdb290, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f651874, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e88f634, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f299145278, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e822797, %r1, %r9
	setx	0x086d36d7b069ff08, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fe5b610, %r1, %r9
	setx	0x728b64913800f143, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c68c0a014e, %r1, %r9
	setx	0x6af6af4f9dc5d88f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d1179d8a61, %r1, %r9
	setx	0xfb0f32ea691b9825, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e6097af116, %r1, %r9
	setx	0xadbe629abc44e170, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fec514cefd, %r1, %r9
	setx	0x16bf951290ef9744, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ed4081c, %r1, %r9
	setx	0x9105f996956a27bb, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f0378e4, %r1, %r9
	setx	0x1f3822a17b201727, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c8aed54738, %r1, %r9
	setx	0x141b601783c07a0b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d07c481fd4, %r1, %r9
	setx	0x2aa6ca0c28510fc9, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e31b5e4368, %r1, %r9
	setx	0x70defd925913a77f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fe576b6810, %r1, %r9
	setx	0x811a01ec88c01b81, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800eb89c94, %r1, %r9
	setx	0x0fab78b8de047a17, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fea3b1c, %r1, %r9
	setx	0xf849550989cea0b8, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c1fbd27780, %r1, %r9
	setx	0xbd375c9376737a1a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d9f32bb5c0, %r1, %r9
	setx	0xc9edfd389acd6356, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000efc46f50a0, %r1, %r9
	setx	0x923355812330181d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f2ee7034a0, %r1, %r9
	setx	0x2017849dd6748506, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e6bbd20, %r1, %r9
	setx	0x8eb2bbe9b64ce869, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f888060, %r1, %r9
	setx	0x461f92bb6a29d49e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c301053200, %r1, %r9
	setx	0x0543ad3bf1919a1c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d0e02ef9c0, %r1, %r9
	setx	0xfaf34c529ea72372, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e8396f32e0, %r1, %r9
	setx	0x5adaf9dfd3e833de, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f884c6e1e0, %r1, %r9
	setx	0x408caa3461075a4d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d4a0b4a5a5, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c7950c414e, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f49be42, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800eee291e, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f8da25bf45, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e9f62e9989, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d4633dc127, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f05fd9c6c2, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e688826d58, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000dc31666860, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c91fb994e2, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f22deba, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e382b3e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e3a01d4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f4e8b1a0fc, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e117ec3214, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c475eccec8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fb39138, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800eac84b8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000fcceec2c48, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000eb3570ae40, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d8461b8450, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e7023b2, %r1, %r9
	setx	0xc43fb6d1b694b87b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f4ebb9f, %r1, %r9
	setx	0x8775012bc2862829, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c06a0f6031, %r1, %r9
	setx	0x963d2911d48b542e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dbd9af0488, %r1, %r9
	setx	0xd1c23971d62b1002, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ebfef51746, %r1, %r9
	setx	0x18b4bbb760cb1dcf, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f4813f9733, %r1, %r9
	setx	0xdbcc38b828d8d9a7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e652718, %r1, %r9
	setx	0xa54135d32948e761, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fbc2972, %r1, %r9
	setx	0x132c5966b3bfdec6, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cecd586e7c, %r1, %r9
	setx	0xf23b0c429b01e9ff, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dbe3025bf8, %r1, %r9
	setx	0x28f33a69edb2c17a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e272d25368, %r1, %r9
	setx	0xb7f23f8dbb4e5719, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fc0ce73ff8, %r1, %r9
	setx	0x644142617553532e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e5a2418, %r1, %r9
	setx	0x19862f3f3ce55e07, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fc45dbc, %r1, %r9
	setx	0x6eb7b2a2bbfd84de, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c45d60eb30, %r1, %r9
	setx	0x8320d70db92adc18, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d59fa3d290, %r1, %r9
	setx	0x1c16e815df9cd5d9, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e98c3b0938, %r1, %r9
	setx	0x0e61a16d17716ab3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f436a045c8, %r1, %r9
	setx	0xb220d28726df506d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e140020, %r1, %r9
	setx	0x1235e1024c7ed770, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f369b78, %r1, %r9
	setx	0x83290a51db57d9d6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c95f0a89f0, %r1, %r9
	setx	0xcd6e2eba8c521917, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d79a705c00, %r1, %r9
	setx	0x5ea7a8190f6313ff, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e4245cc3d8, %r1, %r9
	setx	0x9a0cf7c237ae174f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f45fa80c28, %r1, %r9
	setx	0x803fb3c43051f76c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f4da8e04f1, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000efd61605e2, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fe1c798, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ea8c972, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fe3e085550, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f4ad840, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800ecd793c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d2afc69d18, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c058194e98, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f477b10, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e9fdca0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e634300, %r1, %r9
	setx	0xac4290d4f891dbd6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fd63ac7, %r1, %r9
	setx	0xdc11003b6afb1686, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cc2c239cd9, %r1, %r9
	setx	0xb20d0bfbdeb70e3e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000da4af2cd19, %r1, %r9
	setx	0xaca4e422a4a74c6d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000eb76dc7b70, %r1, %r9
	setx	0xe2dc0c693602a423, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f61df03d9d, %r1, %r9
	setx	0x8ab1262a9bb9115a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e792c22, %r1, %r9
	setx	0x3d5d19a734cb1d38, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fe54e6e, %r1, %r9
	setx	0xbcfa447dbede5132, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ca308e4cd4, %r1, %r9
	setx	0xd2ce25117407bebf, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d832cc0c28, %r1, %r9
	setx	0xb80763815b257d00, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e535b88e08, %r1, %r9
	setx	0x518ca43761489641, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f8f50cf8f8, %r1, %r9
	setx	0x1d3e072c170b48bf, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e482464, %r1, %r9
	setx	0x0ecb57142602f62d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f467aec, %r1, %r9
	setx	0x06605d2097439cca, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c480094338, %r1, %r9
	setx	0xeb0d219b50d856e3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000de4ab80d28, %r1, %r9
	setx	0x941563a740593504, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ea4f2d796c, %r1, %r9
	setx	0x0415b173999afbf1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f47a5917c8, %r1, %r9
	setx	0xff3c1c1c947f2a91, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e37c740, %r1, %r9
	setx	0x37ad4223a75bfefd, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f5f9c90, %r1, %r9
	setx	0x33475b3c3eb71972, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ce19735d70, %r1, %r9
	setx	0x2dd2cf172e5ba4c5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d2a7ef13d0, %r1, %r9
	setx	0xd712cff158a790e4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000eb2ea5ca60, %r1, %r9
	setx	0x9a75a58d7460dfd4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fc62500558, %r1, %r9
	setx	0x11b8e7c5e0a70e56, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fa13b1fea9, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d0e7d5a28c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c7e68adda8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f7610b8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e139b32, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f86b0a8b38, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e60618e4f0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000da91c407e0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f324950, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e24c220, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000fa22924960, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ed90947, %r1, %r9
	setx	0x5ec3cd96369f1e62, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f7a4df3, %r1, %r9
	setx	0x6a71fb5aa39e0329, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c04aa032ad, %r1, %r9
	setx	0x9bef3ed1d5069b93, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dcfce54601, %r1, %r9
	setx	0x598b494c2bf2c4e9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e422f0aa17, %r1, %r9
	setx	0x7cefcc040881a90e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fa68c319c5, %r1, %r9
	setx	0xabd2d14fe6e06b1e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e05efc6, %r1, %r9
	setx	0x2270412f998af8ae, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f19d378, %r1, %r9
	setx	0x904168ecd5f0c4a8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cc9b9a3480, %r1, %r9
	setx	0x6268227cedb6356d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d112b6cf58, %r1, %r9
	setx	0x6ead58362a70f0bf, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e951a89d46, %r1, %r9
	setx	0xf92b82052cb13262, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f6bc8e04ce, %r1, %r9
	setx	0x0243cbee7efca602, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e7ad430, %r1, %r9
	setx	0x84ebb5385b0d1365, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f9476f4, %r1, %r9
	setx	0xb9d1925bfd7f5272, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ca25eb8b08, %r1, %r9
	setx	0x8ea9eb588d9293fd, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d70869e75c, %r1, %r9
	setx	0xde577f74edf8fe39, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000efa6c393c4, %r1, %r9
	setx	0x9a17f21547128bde, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fe1d9d0bf0, %r1, %r9
	setx	0x2ced38e9295128a6, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800efd6168, %r1, %r9
	setx	0x2561d1b8d212f9f2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f0e2038, %r1, %r9
	setx	0x99dce310c3af55b4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c86ee63f38, %r1, %r9
	setx	0x9011432f94147c80, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000defe216018, %r1, %r9
	setx	0x014d747f40fc6233, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ed4de64ef0, %r1, %r9
	setx	0x84e376c095ebaa7c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fcb1dbd800, %r1, %r9
	setx	0x256e9e05e82e63a9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f4ebb9f, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e7023b2, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fec514cefd, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e0b2a126c8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000de5f4c8794, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c47e30cb38, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f4bcc58, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e687a84, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fe78369aa0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e133d8478c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d7cd5f0ef8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c992f19770, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e416238, %r1, %r9
	setx	0xb007246f515355ba, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f545f12, %r1, %r9
	setx	0x27bbc4732cfba008, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ccfea36aba, %r1, %r9
	setx	0x26ba4d802b208059, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000de0bd83f50, %r1, %r9
	setx	0x0872a5fba15ec3ad, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e35fe3c48d, %r1, %r9
	setx	0x504d1561d00801b4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f0054e17e8, %r1, %r9
	setx	0x55ca00c231fb72f5, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e7772ba, %r1, %r9
	setx	0x02a86c726e3311ae, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f33a88e, %r1, %r9
	setx	0xe1551f60c0adc5d6, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c46c8b8d22, %r1, %r9
	setx	0xba6b594b129d0195, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dc099d7008, %r1, %r9
	setx	0xb79bcee4882f0626, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e62df54b2c, %r1, %r9
	setx	0xa8139174bd6ce97a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fab6bd6d24, %r1, %r9
	setx	0x2005460df09e9ef5, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ec83c48, %r1, %r9
	setx	0x88adcbfd696951d7, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f437a70, %r1, %r9
	setx	0x81027018ccf617a8, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cf08f4f438, %r1, %r9
	setx	0xf5ca6af23175eed9, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d3dde8fe40, %r1, %r9
	setx	0x28cc27098ab42bac, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e791543864, %r1, %r9
	setx	0xf3b281d11d57cf1f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f4b69a4c2c, %r1, %r9
	setx	0xc0f094dad053c596, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ebc0800, %r1, %r9
	setx	0x06ec703ac0a74a48, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f7c26f8, %r1, %r9
	setx	0x8f46b7b05c6283ba, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c22d75cb38, %r1, %r9
	setx	0xd60b392832dd290d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d5cc21a0b8, %r1, %r9
	setx	0x2905618d0d831821, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000eb69fa3300, %r1, %r9
	setx	0x70c9255ec77241ae, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fcaf511a00, %r1, %r9
	setx	0x662cdfe42ea56c57, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000da4af2cd19, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000cc2c239cd9, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fd63ac7, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e634300, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f4813f9733, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ebfef51746, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ef8bbc8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f0516a75c4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d54835029c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c6353fcf60, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000edbf345458, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d7d5e9eba0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ed43fec, %r1, %r9
	setx	0x4e7ec1c0bd578750, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f69845a, %r1, %r9
	setx	0x54ea8bfe1cb4d730, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c66c57c7f7, %r1, %r9
	setx	0x25331b2851dfa817, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000df903c3131, %r1, %r9
	setx	0x9ef3325b3f54ee9c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e92f69823e, %r1, %r9
	setx	0xc74eb3cd159510e1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f80c4acf6a, %r1, %r9
	setx	0xfe2e125a1a7b2d26, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800eabd2d8, %r1, %r9
	setx	0xfe251a4c59204ee9, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fffc8d0, %r1, %r9
	setx	0x2eacc9e706d2c2d9, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cdaf33deae, %r1, %r9
	setx	0x726d7db4cfd131c8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000de1d236afa, %r1, %r9
	setx	0x44832f06b42cee89, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000efbd8d8a20, %r1, %r9
	setx	0xa087031e85f97276, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f6b4288a0a, %r1, %r9
	setx	0x8ca996c263098aae, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e285c58, %r1, %r9
	setx	0x50d3b7132732bb18, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f265d54, %r1, %r9
	setx	0x2d9aa43599a9331d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cd9e7e9f40, %r1, %r9
	setx	0xf4fe13dbf0f856fc, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000db623b4dc8, %r1, %r9
	setx	0x3626a0d376abd8fd, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e31bdd2040, %r1, %r9
	setx	0x6f93b65ef0ce7096, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f838d26cb4, %r1, %r9
	setx	0x322a9d9913a2e5e0, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e0ba8e0, %r1, %r9
	setx	0xe474448bdd6bd739, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f521b00, %r1, %r9
	setx	0xaf0256472e18d63a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cc470f52c0, %r1, %r9
	setx	0x48c9de1d2fba8c1b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d4fc5c64b8, %r1, %r9
	setx	0x7631d56474233f05, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e1fd146aa8, %r1, %r9
	setx	0x5e4a78ceda337181, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f4983221b0, %r1, %r9
	setx	0xa622afa6a9c6b65f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000feb0634349, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e2d9aa079a, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000dd70fd5197, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c109f6fece, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800faf5853, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e139a87, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d49229e6fa, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cf7c525d10, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cf08f4f438, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f437a70, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800ec83c48, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fe1d9d0bf0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000efa6c393c4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d70869e75c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ca25eb8b08, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d22a1a9af0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c61948bc70, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f0331c0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e93d8a0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ed30777, %r1, %r9
	setx	0xb11f1ae27fa86fc0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fa16ddc, %r1, %r9
	setx	0x927bfcd849dd13f9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ca5f292085, %r1, %r9
	setx	0xb9077dc2231ebaf1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d499c0804e, %r1, %r9
	setx	0xefb15ceecf7c22d0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e080a6032c, %r1, %r9
	setx	0x6d5d8915a78e714d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f202b8d48b, %r1, %r9
	setx	0x9ace62718e0439df, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ee374b4, %r1, %r9
	setx	0x9b55a139b00eae3b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fe105dc, %r1, %r9
	setx	0x64de83eae2c9e7a5, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c84f654e08, %r1, %r9
	setx	0xfc3e033879bd414e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d19ef59a10, %r1, %r9
	setx	0xd2d656908f2242aa, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e45fc30564, %r1, %r9
	setx	0x63fba87bf7178413, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fee0a7c27a, %r1, %r9
	setx	0xd85e7af4fa7e63fe, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ef5c350, %r1, %r9
	setx	0x01ffa50dce0e1ecd, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f5e1a6c, %r1, %r9
	setx	0x5266e825646ac1c5, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c884c0367c, %r1, %r9
	setx	0x5e893028fba64417, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000dbb34955d4, %r1, %r9
	setx	0x4f6df88d281e7064, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e8b5605054, %r1, %r9
	setx	0x04b1f0ab0dab345b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fe81e3df08, %r1, %r9
	setx	0xc73399b2a0c4af6a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e983728, %r1, %r9
	setx	0x207a86bc90177168, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f976260, %r1, %r9
	setx	0x1ee15c26fb43becd, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c5387ddf50, %r1, %r9
	setx	0x30076f66f13d3c1c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d6184fe0c8, %r1, %r9
	setx	0xb8eed400fc8621d0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e7d6e46e40, %r1, %r9
	setx	0xa5679bec56ed688b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fcbb240f60, %r1, %r9
	setx	0x0d41fc912a04dd00, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f24422dd04, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e970f6c313, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000dfc8efbc95, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c46bf91d0a, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e53416f1ee, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d6b2cb7074, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c3d7beea34, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cd4a0dca4c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f95b470, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e7f34c4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800ebc0800, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000fcb1dbd800, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000ed4de64ef0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000defe216018, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c86ee63f38, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e5cef9f, %r1, %r9
	setx	0xb98c50563d075ae5, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fc75f9d, %r1, %r9
	setx	0xddc406f0e3835969, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cf890fd900, %r1, %r9
	setx	0x81ae472cc145bd3e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000da186c0810, %r1, %r9
	setx	0x72e7876327f32ba1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000eeefb3c06c, %r1, %r9
	setx	0xfcfde74c1643f70a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f0eae71660, %r1, %r9
	setx	0x4933e3f4aa6df211, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ee98e56, %r1, %r9
	setx	0x3be9c386e64d0259, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f9ef08a, %r1, %r9
	setx	0x5e37aecca4aaa8cf, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c284f592aa, %r1, %r9
	setx	0xb61f3dbbb1c0a5bd, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000de72acf968, %r1, %r9
	setx	0x8e83818798dabf85, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ec26b9b664, %r1, %r9
	setx	0x62c8c825250241aa, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f6fbcf65c4, %r1, %r9
	setx	0x708b699c446c7ee8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800eb0a764, %r1, %r9
	setx	0x905fd058b740a080, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f038638, %r1, %r9
	setx	0x4130da242cc5e829, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c2cbbb9b84, %r1, %r9
	setx	0xa47d50e791454786, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d4e7488138, %r1, %r9
	setx	0x2e42148dd2041ede, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e153c45b7c, %r1, %r9
	setx	0x6df524e314435181, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f6b375014c, %r1, %r9
	setx	0x24630bdd27d71546, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e3648e0, %r1, %r9
	setx	0x6d53093137e1eee6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f483f00, %r1, %r9
	setx	0x050bd79bc17ed766, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cde2157f40, %r1, %r9
	setx	0xba687799c84e1a1c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d55a3e2320, %r1, %r9
	setx	0x6461067b2e463f80, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e692655d98, %r1, %r9
	setx	0x3d5ca63533bd64d8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f87fd5aa58, %r1, %r9
	setx	0x53823562a1f5cbda, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fa5b46c3f9, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e7b0b6e1d4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ddb10e26d4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cfd789c69e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ff57288, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e9ea6aa, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f71dae0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800eea8788, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f423b40, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e9e5180, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f07718f900, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e452e1a, %r1, %r9
	setx	0xb6f6d1b805c34799, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f7a2f3c, %r1, %r9
	setx	0x260bb73a9d624353, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c2993cab7e, %r1, %r9
	setx	0x92b3675c977b986b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d5cb19b7a1, %r1, %r9
	setx	0xf83c287ff41f9164, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ec63727857, %r1, %r9
	setx	0x766bdcad22c15f69, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f83c6034ab, %r1, %r9
	setx	0xa01e1b667eacc989, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e8ecca0, %r1, %r9
	setx	0x7916276553ca7b38, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f2a21c0, %r1, %r9
	setx	0x3b9b86c77c475eda, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c55deb5f6e, %r1, %r9
	setx	0x1f3d4b55d5878dfc, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d610d2d1ba, %r1, %r9
	setx	0xf4e2f56eacfa3da8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000eab7ae7c14, %r1, %r9
	setx	0x9ca887216809e8ca, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f457fa86da, %r1, %r9
	setx	0x47035f032e800a2b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e77cdb8, %r1, %r9
	setx	0x1556993aacd5bfb2, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f053438, %r1, %r9
	setx	0xa98f63f6e75aa2b4, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c5a3e0819c, %r1, %r9
	setx	0x7cb725d876fd91a2, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000daf900449c, %r1, %r9
	setx	0x88e604b54dfaabd8, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ebb4421fdc, %r1, %r9
	setx	0x41d67fa6d99924e4, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fe42332e2c, %r1, %r9
	setx	0x7bc54173b1c86e36, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e18a080, %r1, %r9
	setx	0x9b4a3c32e9995e00, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fab0110, %r1, %r9
	setx	0xb063d7e485628585, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c64d5f1d10, %r1, %r9
	setx	0xab62d2751c5cbe8b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000de455c9078, %r1, %r9
	setx	0xfb032fc6c7ae876f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ec2eeecc18, %r1, %r9
	setx	0x02fdfe380a71942c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fc815004f8, %r1, %r9
	setx	0x932a1947bc73c316, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d7f2f550e5, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ca9c333411, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f7127af, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d71a5a1e4a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cdddc48c60, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f38f15e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ecca9ee, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fa289049e4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f2ee7034a0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000efc46f50a0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d9f32bb5c0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c1fbd27780, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800fea3b1c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800eb89c94, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000dabc220f38, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c3edcb8590, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fcdc890, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800efa73e0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f040e7ac08, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000eacdbda960, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000dbc339a1b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e86ff79, %r1, %r9
	setx	0x2d0a7d508c616900, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fe4a7e9, %r1, %r9
	setx	0x2c74d75509742041, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c196f11d3a, %r1, %r9
	setx	0xc76f1f3b0b8f889a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dd8beb9c8f, %r1, %r9
	setx	0xf214ebf25686b05b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e21ec0bc1c, %r1, %r9
	setx	0x1cf978bafd3fad78, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f26dde590b, %r1, %r9
	setx	0xab777e7f0baa5091, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ec53026, %r1, %r9
	setx	0x430c7cf15e4ecd24, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f521006, %r1, %r9
	setx	0xa80188a46306f164, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c69b2334a0, %r1, %r9
	setx	0xf473dd546c2c623f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d36367786a, %r1, %r9
	setx	0x607c96626cd7b3cd, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ed67a48238, %r1, %r9
	setx	0x773d3a040e362394, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f0a76d9306, %r1, %r9
	setx	0xa974e77ee32cc735, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e9b4264, %r1, %r9
	setx	0x8416cf4c54fa0526, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f906978, %r1, %r9
	setx	0x7a50ec05c9c38c78, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cf2d603224, %r1, %r9
	setx	0x40ceb42d44966190, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d23beb6e38, %r1, %r9
	setx	0xac6ef1384be849ff, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000efc5cad594, %r1, %r9
	setx	0x17a9aacb54b3d503, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f65af01ad4, %r1, %r9
	setx	0xc8652e28665b904a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e3b2e08, %r1, %r9
	setx	0x6bbd7ca83c08709b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f019000, %r1, %r9
	setx	0x8776333ae9fd9b85, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ce0738d418, %r1, %r9
	setx	0xcd7f616435a98c36, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d74014f0d0, %r1, %r9
	setx	0x6711e81e765489f5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e00707d090, %r1, %r9
	setx	0x48d5994096a7e68a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8beaf9818, %r1, %r9
	setx	0xf54d0527fe61e8d4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f24ca6a39c, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e232efca4a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d2db52e018, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c7ace13f56, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f3065e2, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e51091a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f44189ad66, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e09658622a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f8cc3bd174, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e42df6a588, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000da5de6f73c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000defe216018, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c86ee63f38, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e561ad6, %r1, %r9
	setx	0x40096afb8ee3b7b8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f36e63d, %r1, %r9
	setx	0xcef91f47d2a16af8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cbebfd0be5, %r1, %r9
	setx	0xf7f8e466cd7cdfb4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d9cea79bad, %r1, %r9
	setx	0x9bb8970bdaaa248a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e2657f91f0, %r1, %r9
	setx	0x52c9e932bc0c2be2, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f463502c49, %r1, %r9
	setx	0x0bbf5115bfb68778, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800eb1c1a4, %r1, %r9
	setx	0xc47f14bd758dab1e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fcf7cde, %r1, %r9
	setx	0x76400e7221c5fa81, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c31c23a082, %r1, %r9
	setx	0x980143f84449f520, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d8deb0f6b8, %r1, %r9
	setx	0x4902082dfb1c2414, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e76ca38e96, %r1, %r9
	setx	0xa745f4908bbf85d6, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fc7b6d277e, %r1, %r9
	setx	0xec3497afe15a5a61, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e0abd90, %r1, %r9
	setx	0x7f42f112aad293ff, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f2b6c30, %r1, %r9
	setx	0x741102db6eba9b96, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cb8084824c, %r1, %r9
	setx	0xa96f1dcd7551246a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d30bc3f9a4, %r1, %r9
	setx	0x473db34c9015e500, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e5f32cdc54, %r1, %r9
	setx	0x4cb8dcaae7078a76, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fe3c69f918, %r1, %r9
	setx	0xf0b8ae61b3417aa7, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e6c8350, %r1, %r9
	setx	0xa17d0ea937862db5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f4fcee0, %r1, %r9
	setx	0xfa764d914db4b879, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c74d79d2f0, %r1, %r9
	setx	0xd319e09351a6dcb1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d7b58998a8, %r1, %r9
	setx	0x0013c224b02b8ee4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e14527b060, %r1, %r9
	setx	0xda53d3d1c832f6c5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f8b6a54e68, %r1, %r9
	setx	0xf3e7f93b18c22959, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800eeb1306, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fe99de62c5, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000eddd52e363, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d47a4c72f6, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e6d547ac58, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d9853cc9a4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c8aed474a0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800fefcb5c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e46712c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fefa0ea6c8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e24c220, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000fa22924960, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e8493fe320, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ee68690, %r1, %r9
	setx	0xfbe4fcef68d4613c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f9464fd, %r1, %r9
	setx	0xc7e0221dee952339, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cf21ab83e7, %r1, %r9
	setx	0x68afc7409b43bd94, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dea53c1f8b, %r1, %r9
	setx	0x1532a7f949ae919c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e108f39ece, %r1, %r9
	setx	0x7bc427467c817070, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fe91a7f013, %r1, %r9
	setx	0x0059c95ab3330623, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ee4e90a, %r1, %r9
	setx	0x8995c506c9eddab2, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f440164, %r1, %r9
	setx	0xd2c16cea0ebf9f27, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cf686115ca, %r1, %r9
	setx	0x8d644c6d17d93b8f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d33679c5fa, %r1, %r9
	setx	0x5f586c0fb9a4ae04, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e857e91756, %r1, %r9
	setx	0x9a20131bdc0b457b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f8137d985c, %r1, %r9
	setx	0x46428a2ccc292c67, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e68bdc4, %r1, %r9
	setx	0xf6ade60e86450d1a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f7b0330, %r1, %r9
	setx	0x0e8a31f5a5c5ab04, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cfa79176c8, %r1, %r9
	setx	0x8171b675fb9ae254, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000debfd62d40, %r1, %r9
	setx	0x479a1d195bf81f46, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e717c46134, %r1, %r9
	setx	0x538238694249cca2, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fa808aade0, %r1, %r9
	setx	0xb5f3e97a50fa287f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e5809a0, %r1, %r9
	setx	0x98e146061e2dd2f3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f769120, %r1, %r9
	setx	0x810011e597b8d382, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c113f4a940, %r1, %r9
	setx	0x4e19e0877889f644, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d5c6d7f4f0, %r1, %r9
	setx	0x1377adf345620892, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e423d6db10, %r1, %r9
	setx	0x74c436e21bcac472, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fc44f21100, %r1, %r9
	setx	0x04723b958231bd9b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c619bd8d57, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f0222e4, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e07fbde, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000cf0eecfa34, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f82d36b1b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000ec54c6ee30, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d186eec8d0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000ce62a3c0a0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fd4fe50, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e8b2353, %r1, %r9
	setx	0xcb1798b255e21af7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fa5a18d, %r1, %r9
	setx	0x3d0ec145b61faae6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cd0abd5f7e, %r1, %r9
	setx	0xd706fbf51022f90c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000db1ac786b5, %r1, %r9
	setx	0x2e27408e49d7cddb, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000edaa733e9c, %r1, %r9
	setx	0x8b4c761d30f7b441, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fc0963797b, %r1, %r9
	setx	0xdf8144943d069083, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e3e4652, %r1, %r9
	setx	0xdf5d00a91331113d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f4590ca, %r1, %r9
	setx	0x3a5a592e887e9ac6, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c3cf23db32, %r1, %r9
	setx	0x9f5fa62ae51fb7f1, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d2972b3360, %r1, %r9
	setx	0x32d44fc9133520b0, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000eb88c8f450, %r1, %r9
	setx	0x3ccf9e5a51d7770c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f6f20d3964, %r1, %r9
	setx	0x645d74e4dbd7d4c1, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e4bd45c, %r1, %r9
	setx	0x6d9cfa8deb0118c7, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ff5e028, %r1, %r9
	setx	0x2f0ee4b13caf815b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c56155f4c8, %r1, %r9
	setx	0xf1327fd89d7118e8, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000dc9a8c2da4, %r1, %r9
	setx	0x0531066c33c7705d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000edc3809c3c, %r1, %r9
	setx	0x185d1ec6f6a68726, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fed5cf6a5c, %r1, %r9
	setx	0x24f698287caa7f9d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e593ef0, %r1, %r9
	setx	0x7c7ff4f21ab994bd, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f39d5e8, %r1, %r9
	setx	0xc1bc81f82fa7aa08, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cc3462a780, %r1, %r9
	setx	0xec3dcff67b0541a1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d3b5c71938, %r1, %r9
	setx	0xdde683df9c8168f6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ebb99a0f88, %r1, %r9
	setx	0xf349d27630cb6a1a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fe7c5e1398, %r1, %r9
	setx	0x006e9bbf8e0f2801, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e8ecca0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f6fbcf65c4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ec26b9b664, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000de72acf968, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c284f592aa, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f9ef08a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ea4f2d796c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000de4ab80d28, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c480094338, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f467aec, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e482464, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f436a045c8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ceb44c9f30, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fcce308, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ee5d680, %r1, %r9
	setx	0x13e67f06e3115e8f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f80269f, %r1, %r9
	setx	0x1522be6610864b81, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c2cbc947a0, %r1, %r9
	setx	0x83387cb3cf530165, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000de85fc8fa0, %r1, %r9
	setx	0xc787980f15698f52, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000efbd98d11f, %r1, %r9
	setx	0xd0913404d2d30cfa, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f01b442a5c, %r1, %r9
	setx	0xa78cf416a81a38d9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ee5bf9a, %r1, %r9
	setx	0xff7160d05ca913ec, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f8759ba, %r1, %r9
	setx	0x0e59633de04d0ac5, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cb4dd46b48, %r1, %r9
	setx	0x34bc2ca9f2759d86, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d4cac96642, %r1, %r9
	setx	0x9219f4587fe883aa, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e3d970cef6, %r1, %r9
	setx	0x289ecdfe0a19c61c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f0f00d4cfc, %r1, %r9
	setx	0xc2bc0a2c3c0b483e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ed15458, %r1, %r9
	setx	0x2a160dc8a58a653a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f3bc4c0, %r1, %r9
	setx	0x9c28ad2e94edc6d6, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c38e44ab9c, %r1, %r9
	setx	0x0307b3a015457bcc, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000dd082f8b30, %r1, %r9
	setx	0x2a00dc43eb9b98c0, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e98c2c7664, %r1, %r9
	setx	0x0d3b5a2f66123abd, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f2391d2a14, %r1, %r9
	setx	0x5ce67c0ed85bda18, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ee39520, %r1, %r9
	setx	0xba07453d29637995, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800faad2b0, %r1, %r9
	setx	0xbb8a43354c41d537, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000caf5c59298, %r1, %r9
	setx	0xf60973f16fd7ad08, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d1291b53e8, %r1, %r9
	setx	0xb9d7b5dab65a4952, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e14186a500, %r1, %r9
	setx	0x43bf9a5857037c8b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fa72c3d508, %r1, %r9
	setx	0x51025dba0dae4fbf, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fa7f798cb5, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e876565894, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000df0d594d5a, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000cb71f7e240, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fca17a3, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000cac65a064c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f297390, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e5dfb10, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f4ad75c0d4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000eb0f951e88, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000dddc8197b8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ca6d50e900, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e875099, %r1, %r9
	setx	0x30bcb745a3d854e9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f9fb344, %r1, %r9
	setx	0x15b44f43b95b1e14, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c5ebcb2866, %r1, %r9
	setx	0x2d482a352b26090d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d08b3e6e1c, %r1, %r9
	setx	0x0b71aa160d7eac86, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e8c5d5a905, %r1, %r9
	setx	0xf7d6fa5ab7d82199, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f0f754d076, %r1, %r9
	setx	0xeaf379ef7247f7ee, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e8e27c6, %r1, %r9
	setx	0x9d71b31535e2edd8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f35fd64, %r1, %r9
	setx	0x145755ebd5fb362d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cd00194570, %r1, %r9
	setx	0x20537e4ef24b5d3e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000df8b172f70, %r1, %r9
	setx	0x43cc9e7d59a2d79d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e0f36e506a, %r1, %r9
	setx	0x5d96751db7862cc7, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fecec17912, %r1, %r9
	setx	0xbee624471a9c905f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e529060, %r1, %r9
	setx	0x439412198162bad0, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f72fbc0, %r1, %r9
	setx	0x37d31d386a7a3b95, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c37edbf7e4, %r1, %r9
	setx	0x5abc77602e53fd65, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d805d1091c, %r1, %r9
	setx	0x9479b5864eb93b4c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000eed17a3f98, %r1, %r9
	setx	0xeb83974027b22a41, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fe2b95f4fc, %r1, %r9
	setx	0x219398390a3f9e39, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e142cb8, %r1, %r9
	setx	0x86238a46b015036e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fb09768, %r1, %r9
	setx	0xe20f2288b2c1e2a1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c13c872780, %r1, %r9
	setx	0x6889dac079c4e01f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d78095f228, %r1, %r9
	setx	0x8c34550611adb94f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e9f5fa2f08, %r1, %r9
	setx	0x5213da0af3f7e499, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000faa194dae8, %r1, %r9
	setx	0x9839260713971379, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e71060c1c2, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d2fe3baf0d, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ceafd0bbb1, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ea435de, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f8aad892b8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e7b466186e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d6547f0454, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ca0ce738d4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f841ac0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f467aec, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e482464, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c4b81376d0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f8076e8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e98a458, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f4b94ec9d0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e9c305c668, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d784432540, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ee71b43, %r1, %r9
	setx	0xa74a9297ed92120f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f469c19, %r1, %r9
	setx	0x54447d7e27ea0ca6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c248ab9062, %r1, %r9
	setx	0x65c3285e2a8b86cd, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d3b6a76f7d, %r1, %r9
	setx	0x51f56a71d2c75d08, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ea30d912dd, %r1, %r9
	setx	0x203330e15416c1f5, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fc9f688bef, %r1, %r9
	setx	0x34896e7e1fd503fd, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e25104c, %r1, %r9
	setx	0x5ccfc631754e5b65, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f75445c, %r1, %r9
	setx	0xddb7136ca85f3c25, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cee51db6a2, %r1, %r9
	setx	0x8fd5d1e1a282ce9e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d22619a41c, %r1, %r9
	setx	0xd2ea7ef5b12f9ba7, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e361aa3978, %r1, %r9
	setx	0xfec35f329fad75bb, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fafeb61d0a, %r1, %r9
	setx	0x5a163095605034ac, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e34f854, %r1, %r9
	setx	0x3c43796489f2ede3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f86cfd8, %r1, %r9
	setx	0xbb142abb312b24a9, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c4c1f2a288, %r1, %r9
	setx	0x38019c6714e7a980, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d4bd5c6f88, %r1, %r9
	setx	0x1620d87aa986d8c3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ed2a9f4c58, %r1, %r9
	setx	0x0df4fd8d490dc723, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f413a44b04, %r1, %r9
	setx	0x811dac8f950222b3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e3a5ff8, %r1, %r9
	setx	0xfe29044eb98df9a5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f277ad8, %r1, %r9
	setx	0xafab455df0a11e7e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ccc5a56690, %r1, %r9
	setx	0x6a4289ef532ef678, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d3a7810a38, %r1, %r9
	setx	0xad1b00f86cbb32c5, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e901881668, %r1, %r9
	setx	0x1c3204b34516493a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f0388fd980, %r1, %r9
	setx	0x385e4effff4c8f43, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e081174b7b, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d4de7fcab1, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c6565c09d6, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ea8c972, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fe3e085550, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cb64431d84, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f9db760, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c35fe450f0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800faaf070, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800eca12a8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f4081397b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e78ff0ac28, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ef9127e, %r1, %r9
	setx	0xda9f77d61d3a04e4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fcaa580, %r1, %r9
	setx	0x68985cfbbcc931ac, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cf754d45b0, %r1, %r9
	setx	0xdd48e7dcd0849895, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000deed083676, %r1, %r9
	setx	0x7a3dfde19fb9a09f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000eb34e5cb84, %r1, %r9
	setx	0xaa3131999ecc6f15, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f8c9d691c8, %r1, %r9
	setx	0x972a5a1231de264b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e83d52a, %r1, %r9
	setx	0x46ed4debae724d4b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f652fd8, %r1, %r9
	setx	0xcb2242c959b684ea, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ce01883634, %r1, %r9
	setx	0xf23fd5899a55aaa4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dfc4e313a6, %r1, %r9
	setx	0x2b7830f6b3427ed1, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e00570c948, %r1, %r9
	setx	0x5354e9f3cb09319f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f6a6886fac, %r1, %r9
	setx	0x10ec40c30a4f8d7e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e9d116c, %r1, %r9
	setx	0x07d16549882fefda, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f16c6e8, %r1, %r9
	setx	0x256571ef9b830a71, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c889e44918, %r1, %r9
	setx	0x408166aed116696e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d0b16b5128, %r1, %r9
	setx	0x0b9fe8c5e88a3773, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000eadc9a346c, %r1, %r9
	setx	0xcd3f2303e06a8bf0, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f04608f188, %r1, %r9
	setx	0x75828d627ac5cdea, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e3136e8, %r1, %r9
	setx	0x9a18a3601e75ee17, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f972650, %r1, %r9
	setx	0x4bb46091a5940ff9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c57564d5f0, %r1, %r9
	setx	0xe4521c195f4cbd41, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d4bc4b4498, %r1, %r9
	setx	0x70db06a9d0b250a3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ed0c110340, %r1, %r9
	setx	0x3bfa437202ab5f76, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fa64fed040, %r1, %r9
	setx	0xaf5ee72fc38680aa, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cf5e0ef921, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fd56f3f, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e44a561, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f426b34c01, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ee03670951, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d8e5df8a7a, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e1b3080f88, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fe66a34, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e4d5b94, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f6fab1b8b0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e6bbf3b26c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000dabf76391c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f6ff080, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ebd1928, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f8567df6c8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e9b08323f0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d44e700260, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e46b790, %r1, %r9
	setx	0x65a4dfbed6b7189b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fb69e7e, %r1, %r9
	setx	0x7335994f298a58fe, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c1250eacc6, %r1, %r9
	setx	0x36ae89fb8ca1f5c5, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d4d104fdab, %r1, %r9
	setx	0xf9dd26626c29ebaf, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ecb8f49584, %r1, %r9
	setx	0x763ebdb1e7296504, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fa85199480, %r1, %r9
	setx	0x8131d53606631d35, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800eef8bac, %r1, %r9
	setx	0xc63eb0be084c524b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ffebd48, %r1, %r9
	setx	0xf7f3efe8f17bbd59, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c921a8bc78, %r1, %r9
	setx	0x909ed20ae17d9d81, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d9f31e023a, %r1, %r9
	setx	0x861963f42967ad99, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e6a8bde6a6, %r1, %r9
	setx	0x6e6e6978cbfa5ad1, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f0f3cae99c, %r1, %r9
	setx	0x7b9ade45b5d7ca4d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ead0274, %r1, %r9
	setx	0x93f5fcc00d35d73e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ffcdc8c, %r1, %r9
	setx	0x6684afa8c65db9d3, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c57c05b6b0, %r1, %r9
	setx	0xcf9d067f3677d76a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000dd380fb0e8, %r1, %r9
	setx	0xf41f0973b0a210d7, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ec4d0f7cd8, %r1, %r9
	setx	0x62ac503b67fd7f1b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fa8db8e450, %r1, %r9
	setx	0x2172f23ff16ad84c, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e34aed8, %r1, %r9
	setx	0x3035dc2a8f9d924c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f2b3f58, %r1, %r9
	setx	0x2e9bf605d8e7c7ab, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c7793515e8, %r1, %r9
	setx	0x25003ea94a03e5e0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d33888df00, %r1, %r9
	setx	0xb453db5bc3d28fbc, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e2c8a83cc0, %r1, %r9
	setx	0xc6966ece223e0d9e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fc2a21b210, %r1, %r9
	setx	0x0430b2a011eb446c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ce8430ae9f, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800ff6bf5a, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e49b042, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f2fdd1036e, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e06792decd, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d700a4b142, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000eefb704992, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d9bc1d0e8e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f437a70, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800ec83c48, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fe1d9d0bf0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000efa6c393c4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d70869e75c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ca25eb8b08, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d49f7e4480, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e9a407b, %r1, %r9
	setx	0x5c638953b44da81b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ff89cb9, %r1, %r9
	setx	0xbfd8962e75422a05, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c6d5e58882, %r1, %r9
	setx	0x421d8d3c38f03d46, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d2a87af7d9, %r1, %r9
	setx	0xe7674448896e4a00, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ed6117cdb5, %r1, %r9
	setx	0xc6ce98d82a1cefa1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f6ccacdcd8, %r1, %r9
	setx	0x4d20bfab0f345747, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800edef246, %r1, %r9
	setx	0x1f82065eed33954f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f08be52, %r1, %r9
	setx	0x9066e74a716bad91, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c05463bd84, %r1, %r9
	setx	0x6b79766ec3c4b27b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d75a9ea050, %r1, %r9
	setx	0x6d9717be4479f5fc, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000edd03884fa, %r1, %r9
	setx	0x45c2887373fb31a8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f86464d9d0, %r1, %r9
	setx	0x039a9738595f9a11, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e4a662c, %r1, %r9
	setx	0x9753f33204304fe0, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fe97ba0, %r1, %r9
	setx	0x02fb3abcdc8b580f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cca18decd0, %r1, %r9
	setx	0xcd2436931dcaf660, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d30f65e5a4, %r1, %r9
	setx	0xee15661d4de76585, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ecbf109524, %r1, %r9
	setx	0x49e84a154d45be1b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fe04a7c790, %r1, %r9
	setx	0xdc4df966d89c97b7, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e81bd38, %r1, %r9
	setx	0x3e8101bd505686ee, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f98daf8, %r1, %r9
	setx	0x7b8b9ac8330f13df, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c3d18debb8, %r1, %r9
	setx	0x292e774d24e6f440, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d4c88f9638, %r1, %r9
	setx	0x2a9535e76d720339, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e40c0685d8, %r1, %r9
	setx	0x65ab35bc6dd091fa, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fef18a1928, %r1, %r9
	setx	0x7ff7ae29297e42b6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800eeae75a, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fc65ae5349, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e446242d6c, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d5113ab727, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000cd81d23e6e, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800fbc2972, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e652718, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fe576b6810, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e31b5e4368, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cb616ab57c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f0a175c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e959790, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f08c3ff5f4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e3a5dfc090, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d213386bb8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c08c0ae0e4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e85418dac0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000dd34c31438, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000ce56c583f8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f6ff080, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ebd1928, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f8567df6c8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800edb3939, %r1, %r9
	setx	0x4d7091a07c611227, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fa150ad, %r1, %r9
	setx	0x5761f340d4e64a23, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c466e803e0, %r1, %r9
	setx	0x6b35fbb886b746b7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d04cae9d1d, %r1, %r9
	setx	0xa3439a76c83965ec, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000eb43fbc7bb, %r1, %r9
	setx	0x77eb4fd8183ba476, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fe6c0a2cb8, %r1, %r9
	setx	0x244cb7720bc9d306, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e98a5e6, %r1, %r9
	setx	0x6f4ff7889c7890f8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fb66068, %r1, %r9
	setx	0x45ad6e17224d1faf, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c03ec64c52, %r1, %r9
	setx	0x1da435b0c84098fc, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000da9ae39d82, %r1, %r9
	setx	0x46233f1ad80d3773, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ec43c05ed0, %r1, %r9
	setx	0x1ec8d897157ead6d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f44d3e3548, %r1, %r9
	setx	0x89197bd9e6db01b2, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e283374, %r1, %r9
	setx	0xf5fcd7eb6791d8a2, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fbc4564, %r1, %r9
	setx	0xe79024b70431cf2b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c8a37dab58, %r1, %r9
	setx	0xb1d6b5518b6aa42a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d930772a28, %r1, %r9
	setx	0x46841323bfa1c973, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ed0bc1885c, %r1, %r9
	setx	0xef09f52f1c2f648d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f6d535d3d0, %r1, %r9
	setx	0x534bafbd3bd3d66b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ef904b0, %r1, %r9
	setx	0x70098b5b5de0a392, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f8e13c0, %r1, %r9
	setx	0xf7cad7a5e53e1f5d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cae8bea7f0, %r1, %r9
	setx	0xe489e7175ce82862, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d0e226b7c8, %r1, %r9
	setx	0xe38c533756c3be9f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e4cc45d188, %r1, %r9
	setx	0xffc1bd2d76da1d98, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f272bc55b8, %r1, %r9
	setx	0xd968064e677623d6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c1dc6c3bc3, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f2a95ee, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800efbbf61, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fcc47a551b, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e0e5423207, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ef19fb8ae4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000dde191844c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c457054280, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fddb862, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000dbdea1df40, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000ce41993ef0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fedf830, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e10e709, %r1, %r9
	setx	0xc260f2c34755c2e9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f0239b7, %r1, %r9
	setx	0x17f500a16656040f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c3265ed356, %r1, %r9
	setx	0xe36197830b755f93, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d817830334, %r1, %r9
	setx	0xbc21ac59f281fd95, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000eaef07cac2, %r1, %r9
	setx	0x2df0615064d57f49, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f843959ef6, %r1, %r9
	setx	0xb3752387ea47138f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e08511e, %r1, %r9
	setx	0x9646c68aa08c5c38, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f2fe976, %r1, %r9
	setx	0x31db45150abb93b8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cb5e35e7b6, %r1, %r9
	setx	0x755d7f3cf6223a48, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d8185b8a7e, %r1, %r9
	setx	0x2f01587588ee0173, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e097cb983e, %r1, %r9
	setx	0xcb10ec1828e8a702, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fa0384b25c, %r1, %r9
	setx	0x91cf498d06ddd245, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ed054e8, %r1, %r9
	setx	0x0a6dbfe2d58b3209, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f7be1dc, %r1, %r9
	setx	0x3b36081bcd0164c0, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c304880c5c, %r1, %r9
	setx	0x131c9b7ced1ca82e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d3c5ab7298, %r1, %r9
	setx	0xb1dbc4c4aede3673, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e34fb60b18, %r1, %r9
	setx	0x392fb27b6996a650, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f622794c70, %r1, %r9
	setx	0x1524eadc937d51ed, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ee1e0a0, %r1, %r9
	setx	0x58fcf74ef221ac45, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f566a78, %r1, %r9
	setx	0x0defac098f0cf7d1, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ca05c64d48, %r1, %r9
	setx	0x93376bb82f36292b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dd85902e30, %r1, %r9
	setx	0xd82878ccbf2efb5a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e726f392a0, %r1, %r9
	setx	0xf8ab32f7cc24a97e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f2a7a62000, %r1, %r9
	setx	0x281d8de531e6d9a8, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f4e2b15271, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e40a099fb5, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d2f0ed7f0e, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e3714980e4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000dee008dd96, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c21ca0ca88, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fe08940, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800ebf5cb2, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fc69e49c00, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e2dc508e90, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e65b5149b0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f659f24388, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000ec7a2b56c0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d092cddb88, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000cc3c777190, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e86e0a6, %r1, %r9
	setx	0x0fcf8213ecf36a4a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fd31afc, %r1, %r9
	setx	0x967f149dd0c3488e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c32380e4e3, %r1, %r9
	setx	0x1bc4d5e555c0d91c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d4579e5abb, %r1, %r9
	setx	0x11c6950320c6e2ae, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000efb7e683e5, %r1, %r9
	setx	0x0a51d8eb6e6a5014, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fe7aa557b7, %r1, %r9
	setx	0xebcf38c9ae483b15, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e320424, %r1, %r9
	setx	0xd67a561a940480e3, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fd71a94, %r1, %r9
	setx	0x338cbf789c7297db, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c84d241a82, %r1, %r9
	setx	0x8f8d31790da749aa, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d88277ae88, %r1, %r9
	setx	0x4e26e6694c7a70f6, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ed0bfb4f3e, %r1, %r9
	setx	0x590f71a9d5e4550c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f8f2b22676, %r1, %r9
	setx	0x2b8e171ed6e02ff3, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e8ac15c, %r1, %r9
	setx	0xa209c02e7936879d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f07fbd8, %r1, %r9
	setx	0xcbf2da173bb425e1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c7b4aab154, %r1, %r9
	setx	0x8acd637005f5447f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000dfae0e9a18, %r1, %r9
	setx	0xac9ee454f2104195, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e708490868, %r1, %r9
	setx	0xc5d8018828b3a26b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f0379c8c00, %r1, %r9
	setx	0x7f6543f1a3295b3d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e125af8, %r1, %r9
	setx	0x01b7445080eab776, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fd117e8, %r1, %r9
	setx	0x5a97058d08121a65, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c0febdee68, %r1, %r9
	setx	0x301e22c0d22de9cd, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d4762bbc40, %r1, %r9
	setx	0x537b9c71ac19fefd, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ec431b0960, %r1, %r9
	setx	0x532ea96fef6bf8eb, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f20c9d1d28, %r1, %r9
	setx	0x0dade691f988fc0a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fa59ee8, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e95790ff8c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d08aa96aba, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c4bdc04936, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f3566c6, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e86e2ce, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d4e7488138, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c2cbbb9b84, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f038638, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f324950, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e24c220, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e864bbd, %r1, %r9
	setx	0x3c346b2e88e11a5f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fa33b26, %r1, %r9
	setx	0x83cd1be13a221031, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c7d0c5cf5f, %r1, %r9
	setx	0x63952078dbec58d5, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d131fad8e9, %r1, %r9
	setx	0x1448b6194cfda9e5, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e15b935067, %r1, %r9
	setx	0xbf981b04a1a1343b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fe05619f6a, %r1, %r9
	setx	0x12edc513294f1dcf, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800efd56a8, %r1, %r9
	setx	0x41d4442053b5c54d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ff1088a, %r1, %r9
	setx	0xaddc494f37c24906, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cdbb074a14, %r1, %r9
	setx	0x35a5227859c1d299, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d49c8e4a94, %r1, %r9
	setx	0x528498c2bd88f25e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000eda622408a, %r1, %r9
	setx	0x214b2ed6d8ad3dea, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f8271fe7e6, %r1, %r9
	setx	0x41521af49de27a30, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e341ef4, %r1, %r9
	setx	0x930d3f3cd99e4d3b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f36daa8, %r1, %r9
	setx	0xbbdbac68c970c5f5, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ca96adbc58, %r1, %r9
	setx	0xdbeb4519558338da, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d0105dfc60, %r1, %r9
	setx	0x1da1744092a182b5, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e4ee374fd0, %r1, %r9
	setx	0x4c938dd5f00343fc, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f0bfb1f3a4, %r1, %r9
	setx	0x0e6e146222a3b220, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e692470, %r1, %r9
	setx	0x3b5a0b68dbc2cb21, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f2ff550, %r1, %r9
	setx	0x2f0f40cc57ff73a9, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c7c03235e8, %r1, %r9
	setx	0x65b00fda79920e3d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d82ad609e8, %r1, %r9
	setx	0x6aa31569ff77b3f0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e81cfb1a20, %r1, %r9
	setx	0x355c00d58601516c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fa8dfd7900, %r1, %r9
	setx	0xc25316a7d9d21c61, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000feeff099e3, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000cc40c1c752, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f2eb856, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ec48d76b84, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000da97f95750, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e983728, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f4983221b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e1fd146aa8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ed5c273, %r1, %r9
	setx	0x5e271eacf0bad253, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f3ff14b, %r1, %r9
	setx	0x6c9d9c2a846dcbe7, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c84ec086cb, %r1, %r9
	setx	0x743d5bd9adcb5d71, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000db58d501af, %r1, %r9
	setx	0x9d606f91515af396, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e28bde2627, %r1, %r9
	setx	0xa54dce65b31ff3f9, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fc12a8c6d6, %r1, %r9
	setx	0xa90222f2e40415f6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e806e56, %r1, %r9
	setx	0x4cf5a5bd63cddb4c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f114d46, %r1, %r9
	setx	0xe09d55accac37ddc, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c0f3d1ca48, %r1, %r9
	setx	0x0a9f4b9e47aa1658, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d66d06b8ce, %r1, %r9
	setx	0x1bb7799a8e0d2424, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e6b22e8548, %r1, %r9
	setx	0xaf4b9ff445d09dff, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fa48ec6e86, %r1, %r9
	setx	0xa4bf25bd920c04ad, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e9ff624, %r1, %r9
	setx	0x6002ad762d5912d4, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f3f9ac0, %r1, %r9
	setx	0x2e1460c580593526, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c6e0526b98, %r1, %r9
	setx	0x0346fab2758e557e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d92af33e20, %r1, %r9
	setx	0xc241e9e7ad38aba9, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e6edf30474, %r1, %r9
	setx	0x9d1e3c83ba164541, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f69b89f634, %r1, %r9
	setx	0x03cd025caa6303ff, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e9098c0, %r1, %r9
	setx	0x27c715af188da899, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fd9e940, %r1, %r9
	setx	0x2fa8b652755c26a7, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cc104f9190, %r1, %r9
	setx	0xed3430e53893968a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dff4cc0e78, %r1, %r9
	setx	0x0f5e1fdac453faf4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e3277f4d50, %r1, %r9
	setx	0x1c24d44a18712510, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fa3af72d38, %r1, %r9
	setx	0x3434ac121e932bc3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d4433c0174, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ce2afcc023, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f979c96, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e64cdee, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fef40bb69a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e140d2c6e8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e2e2ef8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f6c07cd4e0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e966ae0568, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d142a63758, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000c7bbc6a94c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e0a6498, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f82d36b1b0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000ec54c6ee30, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d186eec8d0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000ce62a3c0a0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800fd4fe50, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e7eb258, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e0aef12, %r1, %r9
	setx	0xb2a3fd2394772a3f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f9765ee, %r1, %r9
	setx	0xd33d8c5c1df4a834, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cca6631891, %r1, %r9
	setx	0x95f45a5c5a873153, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d5e60d04cd, %r1, %r9
	setx	0x5df2a149684ad44c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e335691ed1, %r1, %r9
	setx	0xf5d3af7d64f2dd8b, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f07a763f09, %r1, %r9
	setx	0xd0e299657449c084, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ef35c54, %r1, %r9
	setx	0xd3960a75a163d85c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f6559ca, %r1, %r9
	setx	0xc8d2ce49430940dc, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cfefa7f5ba, %r1, %r9
	setx	0x21e16cd2e37fcf72, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000daee1e7c2a, %r1, %r9
	setx	0x562067327fc5d075, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ec6e0b13dc, %r1, %r9
	setx	0x2736126bcbcc6d03, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f89c416630, %r1, %r9
	setx	0xb020004a16d5dbab, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e13e7d0, %r1, %r9
	setx	0xab96ffffb3efc0c7, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f866c3c, %r1, %r9
	setx	0x2a1903d6a502a45d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cf46a0cedc, %r1, %r9
	setx	0xc69fa52b2761534f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d4931a0d54, %r1, %r9
	setx	0xb1dcfd55573a4e7a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000ea2b6ecd08, %r1, %r9
	setx	0xf43bb51b4ca7ac5a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000febf80f33c, %r1, %r9
	setx	0x391d2110d628b82d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800eef1690, %r1, %r9
	setx	0x96d23040c6312ca3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f241688, %r1, %r9
	setx	0xd22e07520e20ba31, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cba0b7da88, %r1, %r9
	setx	0x01c943f9d7fb20ab, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dfc148ab48, %r1, %r9
	setx	0xad97f6b20c9ffbbf, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ed6e73b720, %r1, %r9
	setx	0xb89712f0f3660990, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f22c5440e0, %r1, %r9
	setx	0x033257d2c0b8b5da, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f139876, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800eadb980, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e9fb49e228, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e18a080, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f87fd5aa58, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e692655d98, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000d55a3e2320, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000cde2157f40, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f483f00, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e918009, %r1, %r9
	setx	0xe0f876f34f7fdf0c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f19f692, %r1, %r9
	setx	0x28587a399e7972c1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c3f2977f94, %r1, %r9
	setx	0x337f66c37b91f172, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d52f72621d, %r1, %r9
	setx	0x6a01a9947e3a737a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e6ada82660, %r1, %r9
	setx	0x6edb0254e7521152, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f40234a1a3, %r1, %r9
	setx	0x7ed0afe08d5f96ef, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800eb938c0, %r1, %r9
	setx	0x9905577291a14e30, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fd59b1e, %r1, %r9
	setx	0xaa6a6e0cf2504ac9, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c302f99780, %r1, %r9
	setx	0x94c3593365103420, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000df1fa3adca, %r1, %r9
	setx	0xc8135bb06502a404, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000efb5056778, %r1, %r9
	setx	0x78e3235530ebae2e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fa7e660822, %r1, %r9
	setx	0xe9df7badd8aeeb11, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e61bc0c, %r1, %r9
	setx	0x3a7b6ef33c42a9ea, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f2ac31c, %r1, %r9
	setx	0xc074bf5938dbff52, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c83918de3c, %r1, %r9
	setx	0xfc88a1c5b128427b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000da263ce0c4, %r1, %r9
	setx	0xc20db1a6f4cf21ba, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e83c05d1f8, %r1, %r9
	setx	0x6f721efb95d5ece4, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f6b9908e98, %r1, %r9
	setx	0x4cb01077449f7289, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e8dbfe0, %r1, %r9
	setx	0x3e09e4c0bff59b44, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f0de5e8, %r1, %r9
	setx	0xa9de7f842263a55b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cc72192d48, %r1, %r9
	setx	0x982f63e679654914, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d255bd0198, %r1, %r9
	setx	0xf0f0716c66438072, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ebc5200d18, %r1, %r9
	setx	0xb8c3e8e5df153da6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f4d60e1690, %r1, %r9
	setx	0x8893f3540c2d6d87, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e71db4b196, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000df9c6ac0a8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000cb163434ba, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f68943a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e5f3372, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f61d352e3e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ee4e077114, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d06477a870, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000cb5feab558, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800f4ad840, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800ecd793c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fe295b07e0, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e7016bbfe4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e3d04ca028, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000dd12141a58, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c9b6176cb8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f356558, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800eb1d9d8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000fad36e5f50, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000e37ca23c60, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e02645f, %r1, %r9
	setx	0xa180f9610c5c87f0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f522b4d, %r1, %r9
	setx	0x36974116363547a8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c9af281eff, %r1, %r9
	setx	0xaead3c1f375ef0e8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d7d0fb6a24, %r1, %r9
	setx	0x4c55fae745f2e726, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ee6e3b522c, %r1, %r9
	setx	0x7deb2f23cc237699, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f630b0c147, %r1, %r9
	setx	0x7dd36acae033c103, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ef121ea, %r1, %r9
	setx	0x6bedfa26b4e42b56, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ff12622, %r1, %r9
	setx	0xe79b47ca9a3a06ea, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c77b4ed926, %r1, %r9
	setx	0x9c5227e21e4fb746, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dcbb8105cc, %r1, %r9
	setx	0xae6275be4f53679e, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e7978cd37e, %r1, %r9
	setx	0x76b91eff58397fcf, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f2b0d92be0, %r1, %r9
	setx	0x0da6b89ef74b9c0f, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e352414, %r1, %r9
	setx	0x8507c4c9a9072369, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f42dca8, %r1, %r9
	setx	0x1482400a6fe41772, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cb9f9e7ea8, %r1, %r9
	setx	0x110e6640ce03a2ee, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d3868ee564, %r1, %r9
	setx	0xd035cfb34aef3654, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000eb3aea10a4, %r1, %r9
	setx	0xa4947a0224435ed2, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f0b7949908, %r1, %r9
	setx	0xb1f5fe78d757d903, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e41daf0, %r1, %r9
	setx	0x11563128522b04c3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f06fa10, %r1, %r9
	setx	0xd94270d33c3467c6, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ca8a77d798, %r1, %r9
	setx	0x9bcf0aada2779c57, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d7e17c4838, %r1, %r9
	setx	0xf5482c98c085bb86, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ee90ac1080, %r1, %r9
	setx	0x104d04e951c94dac, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fce1611b78, %r1, %r9
	setx	0x46bd6846f8bee52a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d0084f3340, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c12d8131ae, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800f012b5c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800ed77c58, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800fedf830, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e8f77c8, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f659f24388, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000ec7a2b56c0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e726f02, %r1, %r9
	setx	0xf27f8623327c942d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f34c95b, %r1, %r9
	setx	0xad2302b89d7f281f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ca286ca273, %r1, %r9
	setx	0xf8ad4b04d57d9a91, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d690fbaccb, %r1, %r9
	setx	0xb7248efb7c07e31a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ea557a5cc3, %r1, %r9
	setx	0x83675f136aaa5a42, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f67c02edf9, %r1, %r9
	setx	0x2e3136e63999f85f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ece5f9e, %r1, %r9
	setx	0x0fbcd54f7a9374a2, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fa5bcfe, %r1, %r9
	setx	0x291851af5c36d344, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c432260780, %r1, %r9
	setx	0x8f804da92a478952, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dd3fa634b0, %r1, %r9
	setx	0x9bc7abc0e6f2209a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e2ed37e4aa, %r1, %r9
	setx	0x67f02f88b295ec7c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f4169dd586, %r1, %r9
	setx	0x39d014631239472d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ed23020, %r1, %r9
	setx	0xea184f1da1061a94, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f8f6090, %r1, %r9
	setx	0xf45e1365c801872e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c3fb7e66ec, %r1, %r9
	setx	0x710732b5c5a6d806, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d162f61a30, %r1, %r9
	setx	0xc7acb76a9f7895c6, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e751a2dd58, %r1, %r9
	setx	0xdb56d79566afb121, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f4ef259860, %r1, %r9
	setx	0x4f72efd514e05cda, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800eda4488, %r1, %r9
	setx	0x780eebd55d55f418, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f318f30, %r1, %r9
	setx	0x85264c0312ffa266, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cf3a6df448, %r1, %r9
	setx	0xd4021fe30b546e6d, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000db42c31208, %r1, %r9
	setx	0x7b73eeb97d61db8c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e2c1c89228, %r1, %r9
	setx	0x0a730c5d8f959770, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f446dc4ec0, %r1, %r9
	setx	0x26f4f2cc5baa4628, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cbd14ffee2, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c4bdc04936, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f3566c6, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e86e2ce, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800eea2a08, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e4a8ca4, %r1, %r9
	setx	0xdc2ec2cfa01229e3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f6ba9ef, %r1, %r9
	setx	0xb1caa23a66c7665f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cc20eebe3f, %r1, %r9
	setx	0xdd9c54cffe359afe, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000d8b9ffab79, %r1, %r9
	setx	0x247209c2a617c9c6, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e9945d7b20, %r1, %r9
	setx	0xe43eb8da04412175, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f0a7184f6b, %r1, %r9
	setx	0xd6b27d07f6cc0343, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800eb3e290, %r1, %r9
	setx	0x71c2229e95701e9b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f07590c, %r1, %r9
	setx	0x04003f594f7aa4f5, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cf1f98b572, %r1, %r9
	setx	0xb5abf25f6dfe7dd0, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d7a163d1e6, %r1, %r9
	setx	0x76172047d50fdebe, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e4040fbd8a, %r1, %r9
	setx	0x8440947cfa1ea11a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fabe0f29fe, %r1, %r9
	setx	0xbb15ec7425675841, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e58e47c, %r1, %r9
	setx	0x8509843c618cb73e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800feffd84, %r1, %r9
	setx	0xb0ececbbe15e8408, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cc9c362450, %r1, %r9
	setx	0x176f65cf1a002c5e, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000db2d003460, %r1, %r9
	setx	0x0ab6b41cf7d4c42f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e8314d1224, %r1, %r9
	setx	0xc8f33a5b4ead0a1d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f8a556dda0, %r1, %r9
	setx	0x3f8cea6685fc21be, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e5f8208, %r1, %r9
	setx	0x871cddc8f4945bb2, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f912b38, %r1, %r9
	setx	0xd12735c8aa69698e, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c259ac89a0, %r1, %r9
	setx	0x34bd2f5bac39cfea, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d107889fa8, %r1, %r9
	setx	0x2f89960ec7d8fe66, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ef93f09b48, %r1, %r9
	setx	0x3f1c91bf31dc133b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f4997aae18, %r1, %r9
	setx	0x4f000a211eb00c63, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ec7523412a, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000df4985235c, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000c79711df19, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000cc91ace374, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c3f1dbbe34, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800fdc3f38, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800ea70f9c, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f0d0ba1f30, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800ed2632d, %r1, %r9
	setx	0x397bdc8d84f77fec, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fd7047e, %r1, %r9
	setx	0xa30988e7b8ebfbfc, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cfa1128357, %r1, %r9
	setx	0xa5cbd39d776316e3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dce245a75b, %r1, %r9
	setx	0x229aa728f6776457, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ea3b8e2ac1, %r1, %r9
	setx	0x1c408f0a76ef47ee, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f0df9ad958, %r1, %r9
	setx	0xf3145e3d76d7de9f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e91c55e, %r1, %r9
	setx	0x6abc6cf23c98f768, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fbbbfec, %r1, %r9
	setx	0x3b1faa38b2879427, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c40b35bf86, %r1, %r9
	setx	0x639b15ec4a20440b, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d37b4e6a00, %r1, %r9
	setx	0x445936af228ed02d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000ee80270c0c, %r1, %r9
	setx	0x2a8bb6cfe0f35478, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f2d0554d06, %r1, %r9
	setx	0x888e26a9894ede8a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800ec6d71c, %r1, %r9
	setx	0x6836b72b07b454fd, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f20c564, %r1, %r9
	setx	0x1ea8ca918791a732, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c63afeef00, %r1, %r9
	setx	0x0c349d34e8b260f1, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000dd46c34400, %r1, %r9
	setx	0x5e40e4d09c56573a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e313ee3bbc, %r1, %r9
	setx	0x7825685ba280333d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000feba82777c, %r1, %r9
	setx	0x97867f1200e6a4fc, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800efb26a0, %r1, %r9
	setx	0x19529d3f4c0b6088, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f5ba9d8, %r1, %r9
	setx	0xdd2ce15ee6e6e1e3, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c65e95f7c8, %r1, %r9
	setx	0xa9745265e7e5936f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000df9564bb80, %r1, %r9
	setx	0x772d8195d5956079, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e7f6955c78, %r1, %r9
	setx	0xfa14f1cc9dd076dc, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f0d3b478c8, %r1, %r9
	setx	0x6b36cf199ed61b73, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ed30777, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f80c4acf6a, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e92f69823e, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000df903c3131, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000fc569dca4a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e0b2a126c8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d5b5bb16be, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c132db54c8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800fc5ebd2, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e482464, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000f436a045c8, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000e98c3b0938, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d8461b8450, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000ce7cdfec00, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f2da4c0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e7bda00, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f6045141f0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800ebd6b5f, %r1, %r9
	setx	0x4b05dd6590e165c3, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fda28e3, %r1, %r9
	setx	0x61845412f6664f0f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c80fdf80cd, %r1, %r9
	setx	0x0e1d4e5a994c1600, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000da10a5ffa3, %r1, %r9
	setx	0x83e6efd31bb13fda, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000ee636ca130, %r1, %r9
	setx	0x641c3fbf254b401e, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f6ff19772e, %r1, %r9
	setx	0x239b289d88434a03, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e9f8f0a, %r1, %r9
	setx	0x3285030c9a539c31, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f6fb0b8, %r1, %r9
	setx	0x1cf8eb38b56b169d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c09e010a8e, %r1, %r9
	setx	0x4f09d9e049cd29a4, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000dd6b791088, %r1, %r9
	setx	0xee5ea08738c9d3c7, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e48bc8641a, %r1, %r9
	setx	0x67b69733a0470c36, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fe00863bfa, %r1, %r9
	setx	0xd0cbcda25eb64645, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e3f3a40, %r1, %r9
	setx	0x2669d39d65a8b897, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f057bc8, %r1, %r9
	setx	0xd494a9a50e12f096, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c01d059b64, %r1, %r9
	setx	0x4f1b040f1ca7e2fe, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d1b9f0c544, %r1, %r9
	setx	0x57568e2c4f1a4433, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e839581e88, %r1, %r9
	setx	0x0b93cfdb045788c2, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f45da72774, %r1, %r9
	setx	0xe3c09cc14d340099, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e2f56c0, %r1, %r9
	setx	0x6b866bf5490ad6ed, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f739130, %r1, %r9
	setx	0xdb1a4c82a348c95f, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c9126a6c28, %r1, %r9
	setx	0x047bfd5d3dbfa24a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dec1405b00, %r1, %r9
	setx	0x3e196267f9878398, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000edc26cc4e0, %r1, %r9
	setx	0xf0a0b8b4de79bd8a, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fafdfe72e8, %r1, %r9
	setx	0x32801adc4eb7ec33, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800e901482, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f4624047cc, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000ea7d6c6958, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d07fe69904, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e70e5823b4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d530e261dc, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c49b1a9774, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fa40696dcc, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e590c37, %r1, %r9
	setx	0x507db07dbaf9ead1, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f54bc82, %r1, %r9
	setx	0xb8ebf10824e8fb5f, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000cb666113a3, %r1, %r9
	setx	0x7d45128ed5240393, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000dc66a11616, %r1, %r9
	setx	0x84c341a6ea71c110, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e89385977a, %r1, %r9
	setx	0x14481a972b94d5cf, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000f4faa432cc, %r1, %r9
	setx	0xd2a74f2a1ea52d66, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ea90e04, %r1, %r9
	setx	0x6d72e953b088275a, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f6d92e6, %r1, %r9
	setx	0xcfda2c14ade9544c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cd2e3581da, %r1, %r9
	setx	0xb5d54a3f4566ca01, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d0b712bbe8, %r1, %r9
	setx	0xa996f08ddc9df8b3, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e4ef848c2e, %r1, %r9
	setx	0x7a718652412dc1b8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000fa0a286252, %r1, %r9
	setx	0x645f405fb120e6e7, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800eaa710c, %r1, %r9
	setx	0x7c1ece4e5001fa07, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800fc94a74, %r1, %r9
	setx	0x3c18a51e5fad44c4, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cea61b0874, %r1, %r9
	setx	0x87c0d9726833da1f, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000dad2b7da3c, %r1, %r9
	setx	0x841ee8c411688d5a, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e7c5c49f80, %r1, %r9
	setx	0x76632c25bea8bbbe, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f24330df74, %r1, %r9
	setx	0x63cdadeb9eef4f12, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e8a1678, %r1, %r9
	setx	0x654ae39c3852d68b, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f6a66d0, %r1, %r9
	setx	0x006afd705cf749ec, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cf52b877c8, %r1, %r9
	setx	0x42ec3c8c423becaa, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dbe260c578, %r1, %r9
	setx	0x6fe9f83298dc1560, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000e40ca12410, %r1, %r9
	setx	0x551981f4dfff7f00, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fedabb0bc0, %r1, %r9
	setx	0x526bcb73e388e025, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800fcf7cde, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800eb1c1a4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000f0a76d9306, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000ed67a48238, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d36367786a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c69b2334a0, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f521006, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800e8718f4, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000fe5eceea50, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000ef0e372708, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000d07290f318, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800ec7b83a, %r1, %r9
	setx	0x13847de61c4eacd4, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800fba5ba6, %r1, %r9
	setx	0xa6fbdc769a7bc2ce, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c1dee7cb4c, %r1, %r9
	setx	0x79a39250b77f1bcc, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000da47383e6a, %r1, %r9
	setx	0x8790a79fe91ca870, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000eff098d93c, %r1, %r9
	setx	0xfb7168cda4428c21, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fe10532ace, %r1, %r9
	setx	0xb9d7a77b9cb8ed2c, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800e335ab4, %r1, %r9
	setx	0x3c07d0aa115accd3, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800fff36ca, %r1, %r9
	setx	0x1d695c0759e49451, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000c3ecdfadae, %r1, %r9
	setx	0xd48f77fef7a2575d, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d062716b94, %r1, %r9
	setx	0xd34de2c479548329, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000e6183b5c74, %r1, %r9
	setx	0x4e2ee58942860fa3, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f21ff503a2, %r1, %r9
	setx	0x8ec19d8bdd13ef75, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e7f2ec0, %r1, %r9
	setx	0x27d4143260ec49d4, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800ff8a548, %r1, %r9
	setx	0xfecb03f23a00999b, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000cc27d2bd90, %r1, %r9
	setx	0x71aebcea15fbd106, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000d52f38cd84, %r1, %r9
	setx	0x107913c8e5bcdf22, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e5143575a8, %r1, %r9
	setx	0x54af97b12e647b6d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000fa0d6eb7e8, %r1, %r9
	setx	0x0f2d8392696702fa, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e598db8, %r1, %r9
	setx	0x12d627f732d02109, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ff14910, %r1, %r9
	setx	0xf7bcc305436626dd, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000cbd947add8, %r1, %r9
	setx	0x7ea3eee67f0c0df0, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000dc9cfbd6e0, %r1, %r9
	setx	0xda941abaa4819594, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ead7ee7ca8, %r1, %r9
	setx	0x43794b15abe26db4, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000f4f68ed0a8, %r1, %r9
	setx	0x4ffc46d1a62cb9be, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800ea9d49d, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000f812439fe6, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000e3407ca131, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000d4a0211aa4, %r1, %r12
	ldub	[%r12], %r11
	setx	0x000000800e917498, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000fec0a0af1e, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000e3c16259f4, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000dff97a30e8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000c96a2fc89c, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f8c4980, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d0f2a76964, %r1, %r12
	lduw	[%r12], %r11
	setx	0x000000800e556072, %r1, %r9
	setx	0x7232ea03b83ca3be, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800f449610, %r1, %r9
	setx	0x5230d1e020742b1d, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000c65535112e, %r1, %r9
	setx	0x1182aff620434ca0, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000de97f88dd1, %r1, %r9
	setx	0x32c380eaa3fbcd3a, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000e69edb5685, %r1, %r9
	setx	0xfecda9af06ec7a57, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000fae67d091f, %r1, %r9
	setx	0x81489f6bc03f40c8, %r1, %r10
	stb	%r10, [%r9]
	setx	0x000000800ebd904c, %r1, %r9
	setx	0x6e29a03c9ede0908, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800f104638, %r1, %r9
	setx	0xae3cb820378d3d88, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000cfbf5dd6da, %r1, %r9
	setx	0xd8d29cef8b1783a8, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000d1158b0c16, %r1, %r9
	setx	0x6634de3ffe597af0, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000eb1242f45e, %r1, %r9
	setx	0xf22eb1ee4839e24c, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000f800888a28, %r1, %r9
	setx	0x8db979845f1d4595, %r1, %r10
	sth	%r10, [%r9]
	setx	0x000000800e800794, %r1, %r9
	setx	0xbf3137fdc4760f7d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800f961ba0, %r1, %r9
	setx	0xb39777ff15582348, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000c026ad6488, %r1, %r9
	setx	0x347f7c60eb2e3558, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000db2ff3c698, %r1, %r9
	setx	0xce76307978acab3d, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000e2d41ec628, %r1, %r9
	setx	0x03e456bfb11a8191, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000f23c5dc48c, %r1, %r9
	setx	0x53be00bdff37a0eb, %r1, %r10
	stw	%r10, [%r9]
	setx	0x000000800e003e30, %r1, %r9
	setx	0xdba712181d2d6241, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000800f4b5468, %r1, %r9
	setx	0xbe58fd3438a37a3c, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c9eedae718, %r1, %r9
	setx	0x22df25e430108432, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000d7d9311800, %r1, %r9
	setx	0x370428c5d5dba068, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000ebea7edf18, %r1, %r9
	setx	0xfc43fbcd7e7b1186, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000fa83bef070, %r1, %r9
	setx	0x42bd4e1f3c694920, %r1, %r10
	stx	%r10, [%r9]
	setx	0x000000c73cca8b8a, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000800f096cf8, %r1, %r12
	lduh	[%r12], %r11
	setx	0x000000d79a705c00, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000c95f0a89f0, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800f369b78, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000800e140020, %r1, %r12
	ldx	[%r12], %r11
	setx	0x000000f884c6e1e0, %r1, %r12
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
