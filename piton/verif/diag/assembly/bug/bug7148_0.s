// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: bug7148_0.s
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
/**** 
    * mode : priv; 
    *  asi : 0x20;
    *   va : 0x0;
    *inst1 : sth
    *inst2 : stxa
    * trap : 1 - data_access_mmu_miss_0x68;
    *      : 2 - data_access_protection_0x6c
    *      : 3 - mem_misalign
    *      : 4 - illegal_inst
    *      : 5 - va watchpoint
    *      : 6 - data_exception_0x30
    *      : 7 - data_exception_0x30 by NFO
    *      : == 1 (this test)
    */

#define PCONTEXT	0x10
#define SCONTEXT	0x10

#define MAIN_PAGE_NUCLEUS_ALSO
#define MAIN_PAGE_HV_ALSO

#define H_HT0_data_access_protection_0x6c
#define SUN_H_HT0_data_access_protection_0x6c \
   mov 0x0, %l0; mov 0xde, %o7; set 0xbeef, %l5; ldxa  [%l0]0x20, %l5; done
       

#define H_T0_Cpu_Mondo_Trap_0x7c
#define My_T0_Cpu_Mondo_Trap_0x7c \
        mov     0x3c8, %g3; \
        ldxa    [%g3] 0x25, %g5; \
        mov     0x3c0, %g3; \
        stxa    %g5, [%g3] 0x25; \
        retry; \
        nop; \
        nop; \
        nop
        
#define H_T0_Dev_Mondo_Trap_0x7d
#define My_T0_Dev_Mondo_Trap_0x7d \
        mov     0x3d8, %g3; \
        ldxa    [%g3] 0x25, %g5; \
        mov     0x3d0, %g3; \
        stxa    %g5, [%g3] 0x25; \
        retry; \
        nop; \
        nop; \
        nop
        
#define H_T0_Resumable_Error_0x7e
#define My_T0_Resumable_Error_0x7e \
        mov     0x3e8, %g3; \
        ldxa    [%g3] 0x25, %g5; \
        mov     0x3e0, %g3; \
        stxa    %g5, [%g3] 0x25; \
        retry; \
        nop; \
        nop; \
        nop


#include "enable_traps.h"
#include "boot.s"

.text
.global main
main:
       ta		T_CHANGE_PRIV ;nop !-- priv mode
       call init_reg;nop;
       mov    0x14, %o4
       mov    0x17, %o7
       mov    0x02, %l6
       mov    0x0, %l0             !-- asi_va = 0x0
       stxa    %g0, [%l0]0x20      !-- write (get away X)

       setx	data_start, %g1, %l6
       setx	data_start, %g1, %l7
       add     %l6, 0xa50, %l6
.align 0x10
       nop;nop;
st_dtlb:
!! priv_mod= priv; st_inst=sth;
       sth     %o4, [%l6]              !-- priv/user mode, sth
asi:
       stxa    %o7, [%l0]0x20      !-- asi:0x20
       mov     %o7, %l0
       ta      T_GOOD_TRAP
       nop
       nop
fail:
       ta      T_BAD_TRAP
       nop
/**
 * some non-leaf subs to setup hardware/debug traps
 **/
set_pstate_pef:
       rdpr   %pstate, %g1
       or      %g1, 0x10, %g1
       wrpr    %g1, 0x0, %pstate       !xor PRIV - bit 2
       retl                            ! PEF - bit 4
       nop
       
init_reg:
       or      %g0,%g0,%g1
       or      %g0,%g0,%g2
       or      %g0,%g0,%g3
       or      %g0,%g0,%g4
       or      %g0,%g0,%g5
       or      %g0,%g0,%g6
       or      %g0,%g0,%g7
       or      %g0,%g0,%l0
       or      %g0,%g0,%l1
       or      %g0,%g0,%l2
       or      %g0,%g0,%l3
       or      %g0,%g0,%l4
       or      %g0,%g0,%l5
       or      %g0,%g0,%l6
       or      %g0,%g0,%l7
       retl
       nop


#define DEXEC_PG0_BASE_DATA_ADDR	0x60002000
#define DEXEC_PG0_BASE_DATA_ADDR_PA	0x1170002000
#define DEXEC_PG0_BASE_DATA_ADDR_RA	0x170002000
SECTION .DEXEC_PG0	DATA_VA = DEXEC_PG0_BASE_DATA_ADDR
attr_data {
	Name = .DEXEC_PG0,
	VA=DEXEC_PG0_BASE_DATA_ADDR,
	PA=DEXEC_PG0_BASE_DATA_ADDR_PA,
	RA=DEXEC_PG0_BASE_DATA_ADDR_RA,
	part_0_d_ctx_nonzero_ps0_tsb,
	TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
	TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
	TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=0
}
	.data
	.global data_start
data_start:
	.xword	0x9796d5b7342e574d
	.xword	0xaa659b49a35bd982
	.xword	0xfc07a7312e149cd3
	.xword	0x84d1bc14af1a3654
	.xword	0x6a5d5fe6d1535c4c
	.xword	0x7f799e7f514eb479
	.xword	0x0aebb8e61906175e
	.xword	0xcb29f5c5b7a6e879
	.xword	0xd82461b2c591490d
.skip 0x2000
	.xword	0x6f6ef1da8951416e
	.xword	0x264319cf56d6a99f
	.xword	0x9605d871aee36f3e
	.xword	0x9fc7a60d21d9f3cd
	.xword	0xa3d5e78fa0e6f700
	.xword	0x3cc61734a9db5913
	.xword	0xf068f2ddcf5f4046
	.xword	0x82e1c69e2e516d07
	.xword	0xa383c7a1a193adb5
	.xword	0x8c28083b44dec91b
	.xword	0x956b2809b5550e0a
	.xword	0xc06ccab1ef46d93f
	.xword	0xdfa6b08b061b1786
	.xword	0x29bbc8769bba62ec
	.xword	0xf763c82b6a8c503b
	.xword	0x1097bc15cd61d026
	.xword	0x576b40ec544ce2d6
	.xword	0x6f08cbc58b543da9
	.xword	0xd1e1a6ae46457a23
	.xword	0xc2ea0c2679a20f66
	.xword	0x038ddb2814dd1923
	.xword	0x0a42f955f6d14525
	.xword	0x4d3d2b4c7296e212
	.xword	0xdd53e79289371c85
	.xword	0x48a881ccb5f46313
	.xword	0x04cb97e2804f172f
	.xword	0x0f7f8c892046c5eb
	.xword	0x278834ac4ea008b1
	.xword	0x39d1573749dc6e42
	.xword	0x744db5bbc9e4ea7e
	.xword	0x1f83827ccc9c9e0b
	.xword	0x858aeeba5f601f21
	.xword	0x372564196adb35a0
	.xword	0x508c11b598873818
	.xword	0x1f22dcdc16f53509
	.xword	0x08bf89d38a9b798f
	.xword	0x4104b3b96cae262c
	.xword	0x59fe8aee1909390d
	.xword	0x40584d31c5e515ce
	.xword	0x927530bccf28840a
	.xword	0xfeb63f581a6f6bf9
	.xword	0x2f7a7ab8558c66d7
	.xword	0x7476feeb81333584
	.xword	0x93a03c2ae768c205
	.xword	0x1884f1cf040e0327
	.xword	0xc615866478cc052d
	.xword	0x9d5432718c5d783b
	.xword	0x0cb21a59abce88e7
	.xword	0xa7b59f102153a0b0
	.xword	0xd6ed0f052e082719
	.xword	0xa0784c05665c5ac1
	.xword	0x210d7b3107a6879a
	.xword	0xbb0a88df9c7e02c0
	.xword	0xc916f6b2ecc4779e
	.xword	0xaa62964052ecfe86
	.xword	0xd1e6f8b2aa5a4443
	.xword	0x565ced75153d4592
	.xword	0x4b359f872badc3ab
	.xword	0x4c664339adc3cf38
	.xword	0x0b114dba46bf6226
	.xword	0xc2123a628f075d47
	.xword	0x2d206d48df008002
	.xword	0xd01aa765739b3a89
	.xword	0xe4c0f9abd392902f
	.xword	0xd73db65032672adb
	.xword	0x071939624b2ab58e
	.xword	0x3c8990fd13233740
	.xword	0x4441929df89987fe
	.xword	0xd6c9b0217d1b5dec
	.xword	0x7c4dc61597052b5c
	.xword	0xce9115fc00f34b08
	.xword	0x2193942f1bbbf82c
	.xword	0xa528efeb0ccf6163
	.xword	0xf732a2f27de8fccd
	.xword	0xe4d66865584a0a79
	.xword	0x9a71cc02dd2c60d3
	.xword	0x9b8db441a71f7dfe
	.xword	0xc081c2da6f5f7e53
	.xword	0xa8ca88e88525f123
	.xword	0x6c0976c94118c23c
	.xword	0x1fd71048ee05d9c8
	.xword	0x70e7aee65458d705
	.xword	0x1e8b9347cb2afe7c
	.xword	0x139efdf40d5bc8f4
	.xword	0x80ef70d534692002
	.xword	0x447ee0bd90f249ea
	.xword	0xe48c1c05d87bc47c
	.xword	0xd26baa8576b4ebf3
	.xword	0x5a64820854072328
	.xword	0xafcb1bbdbcdcfcfa
	.xword	0xfbfb3a54bb903d25
	.xword	0x56d7ddaa709979b6
	.xword	0xc454479162c5f4ef
	.xword	0x07f29f9e6e4f47b8
	.xword	0x7867a4b3f0a8c9ca
	.xword	0xf500cd39061bb5c0
	.xword	0xada5dba831241d33
	.xword	0xb5670fb66fe55c95
	.xword	0xb0eeaa279ce17549
	.xword	0xd2f885967469337c
	.xword	0x2f4fb88e46dd3091
	.xword	0xeaea44658837dba2
	.xword	0x0ee265220d214c4b
	.xword	0xd614d6eae3d8c4df
	.xword	0xb2d9e1df62fd6e71
	.xword	0x4df08dc8ed1335aa
	.xword	0xc0c33eee5cf3cbd0
	.xword	0x14e6e766d15430e4
	.xword	0x2f139f0748b0f091
	.xword	0x1b9245b50e9c0cfb
	.xword	0xcf298a57cad3965a
	.xword	0xd3d950124d19b749
	.xword	0x66da9c1150f805d1
	.xword	0x040dd824edd3bd85
	.xword	0x9a4676e9ba78f629
	.xword	0x12c05828d17a761e
	.xword	0x261ce7115daf46fc
	.xword	0x20867937abe9aa1e
	.xword	0xe07ee0671e5ee050
	.xword	0x75f8a6cbb219ce8c
	.xword	0x0371b3f4d335b1b0
	.xword	0x3fe3b1883a20b1cf
	.xword	0x6ec7e1f6a1e089f7
	.xword	0x84c4fe508dcd282f
	.xword	0xb3cfab7cdde1f4e2
	.xword	0x533298fccf68ba80
	.xword	0x8900b13b2c88a8be
	.xword	0x39ec743d0895c45a
	.xword	0x7d03e5753257e7a7
	.xword	0xbacfb23985fde2ff
	.xword	0xe49c70d094fbad70
	.xword	0x95f1671fce850f74
	.xword	0x3c9d5405ecfb47bf
	.xword	0x107c69b5a292b05a
	.xword	0x8f97a8c2e4265413
	.xword	0x5f5b304fb40e6256
	.xword	0xa34192957951b339
	.xword	0x5d4ccaf0bc8ecbcc
	.xword	0x7238242c2658298a
	.xword	0xefe2e85f0a9d3811
	.xword	0xbce26fc91673fbf7
	.xword	0xf7b56cf1af54532d
	.xword	0x44e62c8689690492
	.xword	0x200b4ab380eb3d01
	.xword	0x96b7d537167e40b3
	.xword	0x58c4313db2ceb619
	.xword	0x2d314f3f3f0fec62
	.xword	0x89ca5b1a56c5d494
	.xword	0x942d17f396e84882
	.xword	0x503e419d428890f9
	.xword	0xa2204f6fad2f360e
	.xword	0xc1238c2b4846cf7b
	.xword	0xc964d5a939428c45
	.xword	0xf6a0e45aaf5b02ed
	.xword	0x85901d2af2d22eea
	.xword	0x66e337abb0df6cdc
	.xword	0x22294d6e4d0b4033
	.xword	0x64731ae76a52618e
	.xword	0xdf04a80ba123992e
	.xword	0x71dea3301e572ca8
	.xword	0x6169307f58c19fef
	.xword	0x709ac2e36670b270
	.xword	0x9f7f12a2e76d2e40
	.xword	0x70e82a8e5267ca3e
	.xword	0x9b4f7251839f081b
	.xword	0x9025bfc5ffe2bdd5
	.xword	0x80fe96fec848490e
	.xword	0x6f56b0b1062ac7a0
	.xword	0x80628d2bba503b6c
	.xword	0x4515eae98bb23d46
	.xword	0xbbec2bdf3cc20a64
	.xword	0x5290129f7080a29a
	.xword	0x3601bf382a017602
	.xword	0x78e625e905be170d
	.xword	0x0fea7fd6ce47c4f0
	.xword	0x92983a925a27c57b
	.xword	0xa3f98c8330cb0441
	.xword	0xc3fe675a09fb33f3
	.xword	0x98140f266daf8684
	.xword	0x58a2bb128a060caf
	.xword	0xc3e7270e348f71cb
	.xword	0x1bd2df89ee26e98e
	.xword	0xbfeac4dc8ea62e62
	.xword	0x078309754e1e7279
	.xword	0x2572549612d6cc2b
	.xword	0xd584c1cb1c301d8e
	.xword	0x11088b3b5d09b782
	.xword	0xb43b9faded0367c0
	.xword	0xa61c4bf9213809b8
	.xword	0x388d3e7121685e5f
	.xword	0x73638ab05066028b
	.xword	0x9dfa91ccefc6e711
	.xword	0xd4b084831aa4fff1
	.xword	0xc350a3ec19634da0
	.xword	0x0a91077e92452cdd
	.xword	0x3cb626e30aeee727
	.xword	0x25f2bcd88bf68923
	.xword	0x6fb3176cb73d0709
	.xword	0x8b0816eb61046994
	.xword	0x466ed42690e0a20f
	.xword	0x12f7c649ba5c60d4
	.xword	0xdf559bb027ddf381
	.xword	0x61b21334e7b9d03c
	.xword	0xa10a8a80a5751e6c
	.xword	0x137cb1cd0e2066cf
	.xword	0xe6686deefc76c30e
	.xword	0xd05d13d6e39c0756
	.xword	0x850e2325064ca9e4
	.xword	0xaac164305bb0fda3
	.xword	0xa18b7aabe5e07b3a
	.xword	0x06973e2766d6a588
	.xword	0x217167a443390810
	.xword	0x000ff97237cd0fb5
	.xword	0xb421ef459052cdf9
	.xword	0x0ca481dca2ba03a4
	.xword	0xfa586adb820a0213
	.xword	0x4abc54df634e2dea
	.xword	0xbec23d9883adafde
	.xword	0xd093164d6734f17b
	.xword	0x2185ee9f2bdbc1df
	.xword	0x9a02f85f0cf2d88a
	.xword	0x7c88e5ee9cb39aae
	.xword	0xaefde6da32f806ee
	.xword	0x2d5768d4705f46a5
	.xword	0x0347af77e9de436f
	.xword	0xa9a717c7e06fb9ce
	.xword	0xb35051bc28d5ad2d
	.xword	0x975aa207caa4a2b3
	.xword	0x8c48a91c25bbf9ba
	.xword	0xfdcdebedb5dc7bac
	.xword	0xd933c4c6ad35d2c3
	.xword	0x0651581b742a8cdc
	.xword	0x14f4a3edf6daa10e
	.xword	0x682d13f0cac3f10e
	.xword	0xcfcbe5b6e30fee1b
	.xword	0xfc1fd1035904c643
	.xword	0xcc59fe9e362ab523
	.xword	0x8e75be129b66914a
	.xword	0xbd328c2c267bd500
	.xword	0x9c72ff1c26cdd552
	.xword	0x70803c02de4e2043
	.xword	0x1e50755383f00aff


