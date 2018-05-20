! Copyright (c) 2017 Princeton University
! All rights reserved.
! 
! Redistribution and use in source and binary forms, with or without
! modification, are permitted provided that the following conditions are met:
!     * Redistributions of source code must retain the above copyright
!       notice, this list of conditions and the following disclaimer.
!     * Redistributions in binary form must reproduce the above copyright
!       notice, this list of conditions and the following disclaimer in the
!       documentation and/or other materials provided with the distribution.
!     * Neither the name of Princeton University nor the
!       names of its contributors may be used to endorse or promote products
!       derived from this software without specific prior written permission.
! 
! THIS SOFTWARE IS PROVIDED BY PRINCETON UNIVERSITY "AS IS" AND
! ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
! WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
! DISCLAIMED. IN NO EVENT SHALL PRINCETON UNIVERSITY BE LIABLE FOR ANY
! DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
! (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
! LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
! ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
! (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
! SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

SECTION .DATA_CORE0_0 DATA_VA=0xa8200000
attr_data {
    Name = .DATA_CORE0_0,
    VA = 0xa8200000,
    PA = ra2pa(0xa8200000,0),
    RA = 0xa8200000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .global data_core_0
data_core_0:
    .align  PITON_L1D_WAY_SIZE
    .xword 0xe39188f1097ba20b
    .xword 0xd5847855da7660ea
    .xword 0x8162ac1d481516df
    .xword 0x5a0d0467ef1ebbfc
    .xword 0x89fc7884b2d749de
    .xword 0x930fc09c5d53df2a
    .xword 0x7c3d5e56742b76ac
    .xword 0x375ec78a84f4d590

    .align  PITON_L1D_WAY_SIZE
    .xword 0x4206217a10a4ffbf
    .xword 0x866ff2f6f4e3265d
    .xword 0xacb92bb405c86e06
    .xword 0x559dfe552d3470b7
    .xword 0x978fba637866fef3
    .xword 0x6dd81ce6b292f2e4
    .xword 0x9ef15632c0ff5919
    .xword 0xfd77eca3159f1b63

    .align  PITON_L1D_WAY_SIZE
    .xword 0xd21002d5d2ef2c80
    .xword 0x5669db3451162a63
    .xword 0xc7a5f7128a78bc2d
    .xword 0x85481638af7c2f7c
    .xword 0x76cb0e5a871ab8e
    .xword 0x9230b4a50976e594
    .xword 0x5542757a31229e26
    .xword 0xe27c6d60856c368

    .align  PITON_L1D_WAY_SIZE
    .xword 0xe62dd7cdf8e21cb7
    .xword 0xda8d5a35e7ee1774
    .xword 0xd6a44764349507e3
    .xword 0x5e51a63b631f640d
    .xword 0x42a80c9a56e3669c
    .xword 0xa8d222168e7ca4f3
    .xword 0xf38cc5623516c7f3
    .xword 0x9506e6907c17b0c8



SECTION .DATA_CORE0_1 DATA_VA=0xa8202000
attr_data {
    Name = .DATA_CORE0_1,
    VA = 0xa8202000,
    PA = ra2pa(0xa8202000,0),
    RA = 0xa8202000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x9a235216604ea3e1
    .xword 0x7c1181132a99f502
    .xword 0xefa28bcaee53d8b7
    .xword 0xefeba4e7c2fa7bfe
    .xword 0xe4396a678c1a436d
    .xword 0x9e98f505075e3005
    .xword 0xa648895b3c179092
    .xword 0x2f8969048ddcd304

    .align  PITON_L1D_WAY_SIZE
    .xword 0x8bd1d0e51857855f
    .xword 0x6d2883a8cfd07304
    .xword 0xc47d43a6c67e223d
    .xword 0x60242d6ba45eab17
    .xword 0xda07a90204aa263e
    .xword 0xe20164e4765e999e
    .xword 0xd9e4675d95df8bbb
    .xword 0xc33bf9a4cdc99bf2

    .align  PITON_L1D_WAY_SIZE
    .xword 0x105af0c22aa1c23
    .xword 0x1b85cd426f7707c0
    .xword 0x9164831e4215cdb2
    .xword 0x18a411072bfd0f00
    .xword 0x96e81afa62d9c22
    .xword 0x22e259a1531f0bc1
    .xword 0x67bc65e3ebacb2a0
    .xword 0x4472a271a316bdd4

    .align  PITON_L1D_WAY_SIZE
    .xword 0x299031dd3915139a
    .xword 0x4022cb15718a9307
    .xword 0xd42ae6476a74f3b0
    .xword 0x8ee41fdffb3c1250
    .xword 0x7b5dbbe3b09056c1
    .xword 0x20435a0986c0e118
    .xword 0xedd92429f9d5b19
    .xword 0xba28fff73c34901



SECTION .DATA_CORE1_0 DATA_VA=0xa8204000
attr_data {
    Name = .DATA_CORE1_0,
    VA = 0xa8204000,
    PA = ra2pa(0xa8204000,0),
    RA = 0xa8204000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .global data_core_1
data_core_1:
    .align  PITON_L1D_WAY_SIZE
    .xword 0x9abb09af999733e6
    .xword 0x978786377ddca034
    .xword 0x4ee2e7e69f83519c
    .xword 0xca9de261cc4a9d4
    .xword 0x1274e6c64c8863a
    .xword 0x10a39a257847488d
    .xword 0xf2513a9a0099a1f1
    .xword 0x83e1b51c43486364

    .align  PITON_L1D_WAY_SIZE
    .xword 0xcccc01fbb376d57f
    .xword 0x2a72466946d50405
    .xword 0x287f3db05e35fbe1
    .xword 0xcbc69b5f8d86d210
    .xword 0xa755561a71df8742
    .xword 0xc62dbcd8cc0e7a93
    .xword 0x10bb614e5591f9fc
    .xword 0xed72321d3711b199

    .align  PITON_L1D_WAY_SIZE
    .xword 0x9804f54bc955c1b3
    .xword 0xbfffff3f2ef842a4
    .xword 0x9303151951bad0c4
    .xword 0x6c4ebf07abeae5c1
    .xword 0x6832b7ebb093f6ab
    .xword 0x621e8cc373a0ce36
    .xword 0xfc70bbaef3a0c676
    .xword 0x557882912478b336

    .align  PITON_L1D_WAY_SIZE
    .xword 0x569a00edd0f614db
    .xword 0x56b53d280aad4a79
    .xword 0x2978cd5a55cafbb0
    .xword 0xd53f3fa4cad988da
    .xword 0xb1739ed382c59f27
    .xword 0xd545291faa5e4da8
    .xword 0x1fb5a8a331a338ec
    .xword 0xefb25b0f8fb61560



SECTION .DATA_CORE1_1 DATA_VA=0xa8206000
attr_data {
    Name = .DATA_CORE1_1,
    VA = 0xa8206000,
    PA = ra2pa(0xa8206000,0),
    RA = 0xa8206000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0xaa3552588f07657a
    .xword 0x67e04801d4ecb7dd
    .xword 0x9ecd925767f63c92
    .xword 0x547c5fab2c2319cf
    .xword 0xba9937c1ee434791
    .xword 0x5570126c4cf3f800
    .xword 0xbd95c95fdc02ef3e
    .xword 0x3186411ed2d584ca

    .align  PITON_L1D_WAY_SIZE
    .xword 0x3c400c6923c13d08
    .xword 0xf2a06385b9f51c91
    .xword 0x739ad25f097c4cbe
    .xword 0x34116495a7402cfc
    .xword 0x6796942c317b4f12
    .xword 0xbbe797d0932abca5
    .xword 0x216582270afe06bf
    .xword 0x3f7bb96f75850566

    .align  PITON_L1D_WAY_SIZE
    .xword 0x80e833b461c49464
    .xword 0x811cd59e63b37790
    .xword 0xd9a8a39b123766b3
    .xword 0x885960a3268dbdf0
    .xword 0x48b096d2a0f26fde
    .xword 0xf5770e7e0efcb19
    .xword 0x8fb760ad2a5849f2
    .xword 0xbeb7c0e32c0485df

    .align  PITON_L1D_WAY_SIZE
    .xword 0x716c183e7b19d852
    .xword 0x9ba2295ebc51cc5e
    .xword 0x4e836f312c646b88
    .xword 0xbaefd361bf14a57c
    .xword 0xd416817d04d5ee5a
    .xword 0x96c08e266fafa000
    .xword 0x59b89457a4b855a2
    .xword 0xebc2f1ce57d1dc2a



SECTION .DATA_CORE2_0 DATA_VA=0xa8208000
attr_data {
    Name = .DATA_CORE2_0,
    VA = 0xa8208000,
    PA = ra2pa(0xa8208000,0),
    RA = 0xa8208000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .global data_core_2
data_core_2:
    .align  PITON_L1D_WAY_SIZE
    .xword 0x3fd55a539f9a9bc9
    .xword 0xa456b776726e969
    .xword 0xfa161c09a0c17ba1
    .xword 0x89d0217ee081dace
    .xword 0xb29152f2ad5198c1
    .xword 0x56a3eb140b2b7732
    .xword 0xf581577f152a3163
    .xword 0x779f23cc0de75b09

    .align  PITON_L1D_WAY_SIZE
    .xword 0x6ffc7f4393f04b6a
    .xword 0x76b05a3e97147a02
    .xword 0x12bace69f46dee3d
    .xword 0x46ba1247b84abe25
    .xword 0xe08c9d679ef9ce22
    .xword 0x34bec7ed305b5a45
    .xword 0x50ef7a6e73cd9455
    .xword 0xa5b83f2da31b7fe8

    .align  PITON_L1D_WAY_SIZE
    .xword 0x986d086ca4d61860
    .xword 0xf12e3f22a2c8a43a
    .xword 0xd84ada9f514f278a
    .xword 0x77b5556ccfaf8019
    .xword 0x93005ae58066c4ac
    .xword 0x104c5bce06b0957e
    .xword 0x664433ef22b49709
    .xword 0x1ed6382baa3ee3ac

    .align  PITON_L1D_WAY_SIZE
    .xword 0x24564d14bdb3c5f0
    .xword 0x6f5026d20aef5c69
    .xword 0x127f720ff6673cf9
    .xword 0xc12592a7d9b0dc9c
    .xword 0x6eb7801038940197
    .xword 0xb92640a8c5cc7173
    .xword 0x2213e2c7c493d48c
    .xword 0x1d001a5a1ce8bad4



SECTION .DATA_CORE2_1 DATA_VA=0xa820a000
attr_data {
    Name = .DATA_CORE2_1,
    VA = 0xa820a000,
    PA = ra2pa(0xa820a000,0),
    RA = 0xa820a000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x6131dd9c926fe21
    .xword 0xdc5fda367844cd57
    .xword 0xebe7d741a94dfa7
    .xword 0x19dbf1dd5aec28cf
    .xword 0x5269e50d4f310b45
    .xword 0xa5727e4938592e27
    .xword 0xe028c8c00d401388
    .xword 0x9eb8489d95873eab

    .align  PITON_L1D_WAY_SIZE
    .xword 0x4e2a38b4c8ad3a59
    .xword 0xc1a4a4afd6802c2b
    .xword 0x541e2a28e7faa81
    .xword 0xc5d0f49fca1f254b
    .xword 0x737f71257be66121
    .xword 0xa1fa7bba9f2e730f
    .xword 0x90c34aff2c1ae241
    .xword 0x202d57c2330cad81

    .align  PITON_L1D_WAY_SIZE
    .xword 0x178f19cc444a1090
    .xword 0x83eb22b697d7668e
    .xword 0x942147a34617be09
    .xword 0x35dcda56b26b087a
    .xword 0x82fda78de6a7b3dd
    .xword 0x857f3132e34c4c6b
    .xword 0x9c6650b206e42a3d
    .xword 0x8b7945f96491ca74

    .align  PITON_L1D_WAY_SIZE
    .xword 0x6bf73566dafe7916
    .xword 0xeea01ed0de12c193
    .xword 0xd16fb46b511c6df2
    .xword 0x27b675cd4461ca65
    .xword 0x5ba15c1fb30717ee
    .xword 0xd0aa5b3222ee6832
    .xword 0x12e3f2776cc2b410
    .xword 0xe998bf4bc8077451



SECTION .DATA_CORE3_0 DATA_VA=0xa820c000
attr_data {
    Name = .DATA_CORE3_0,
    VA = 0xa820c000,
    PA = ra2pa(0xa820c000,0),
    RA = 0xa820c000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .global data_core_3
data_core_3:
    .align  PITON_L1D_WAY_SIZE
    .xword 0x1942e12a9665bdcc
    .xword 0xfde140eb1f3b627b
    .xword 0x1637783e0bc5bf9a
    .xword 0xe5bc89a9182844e
    .xword 0x3a516bcf66d46df0
    .xword 0xbb26851460b3ce8
    .xword 0x1639cfa35b553c6d
    .xword 0x6a50f93365440717

    .align  PITON_L1D_WAY_SIZE
    .xword 0xc88728b8f39d0648
    .xword 0x2f11f5ac555728c9
    .xword 0x233f0f7a4c76755a
    .xword 0x7dc87d204ef49b7e
    .xword 0xe489372d7eccf613
    .xword 0xc3f45190ec465eb7
    .xword 0xff25bf68d507e5db
    .xword 0x43a66854905d46f5

    .align  PITON_L1D_WAY_SIZE
    .xword 0xdd1432cbb33ded6e
    .xword 0xe0880c39c9ea7b35
    .xword 0x61f273671dfcbd6b
    .xword 0x96cdc403bfebdf98
    .xword 0x3986b068d22a8cf1
    .xword 0x2288b937819942d9
    .xword 0x5757754fedf95240
    .xword 0x3096e990982201f0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x7d611549656e39e6
    .xword 0x9422f5c78401b38
    .xword 0x67f26480b523540d
    .xword 0xdd0dec154d1229c5
    .xword 0xb1642f21ab2c5b5b
    .xword 0x7140b0ada16df54d
    .xword 0x8751e27487e809b4
    .xword 0x8eeb0b977d2d2c92



SECTION .DATA_CORE3_1 DATA_VA=0xa820e000
attr_data {
    Name = .DATA_CORE3_1,
    VA = 0xa820e000,
    PA = ra2pa(0xa820e000,0),
    RA = 0xa820e000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0xe0d526c6943ea1d
    .xword 0xd747b8b701b637dd
    .xword 0x2bab2b1336abfdce
    .xword 0x4e005abbb9d94d1f
    .xword 0xbe2ddf426515191
    .xword 0x4c3e307e7923f4ea
    .xword 0x72989f6df8b480cd
    .xword 0x12e99c048385f3d7

    .align  PITON_L1D_WAY_SIZE
    .xword 0x8cc6510337622999
    .xword 0x8dd4c93a32f7e57
    .xword 0xb478c9f5e8b06be0
    .xword 0x153904402de5ad48
    .xword 0x45e6f8efe04dbf9
    .xword 0xa6ae97b7c011695c
    .xword 0x1aaf9c5001d10537
    .xword 0x24f6d05e522239

    .align  PITON_L1D_WAY_SIZE
    .xword 0x9028fb26754f772
    .xword 0xc0397664325e518f
    .xword 0x4710b06477d8165c
    .xword 0xe9189139df3edcfe
    .xword 0x90fd63b9f3532c31
    .xword 0xc0679984f8de6a7f
    .xword 0x921cd4e4735fee50
    .xword 0x9d71f62a411e00f5

    .align  PITON_L1D_WAY_SIZE
    .xword 0xeda7456dd67925ba
    .xword 0x88944ea18091e8b0
    .xword 0xe92337d4bafa96a8
    .xword 0x215212597028dd01
    .xword 0xee7c450b11458a2f
    .xword 0xed9aa86cf4ddebfe
    .xword 0x299e3f8da99bae87
    .xword 0x6038e076ef23ed95



SECTION .DATA_CORE4_0 DATA_VA=0xa8210000
attr_data {
    Name = .DATA_CORE4_0,
    VA = 0xa8210000,
    PA = ra2pa(0xa8210000,0),
    RA = 0xa8210000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .global data_core_4
data_core_4:
    .align  PITON_L1D_WAY_SIZE
    .xword 0x925e608cc3fc2635
    .xword 0x846aed4a293ae340
    .xword 0x89ebe34b5e7badc7
    .xword 0x7053d9da66a74ea
    .xword 0x972964633a1a1ce4
    .xword 0xa269dd79b1e7bc51
    .xword 0x6010b97ff67e1ea3
    .xword 0x6da1778731b4792a

    .align  PITON_L1D_WAY_SIZE
    .xword 0x5534b9f6c92abf91
    .xword 0x7fdca1064cbf9c13
    .xword 0xc578aa2e4f19f0e3
    .xword 0x5e6abeccf8c8c523
    .xword 0xdcce2493d3ebb47f
    .xword 0xab6170fc005206
    .xword 0xe2babeff98487152
    .xword 0x89d2dade2ef85acf

    .align  PITON_L1D_WAY_SIZE
    .xword 0x81e3050a6031c8f1
    .xword 0x82e2f49fecf1a2a7
    .xword 0x6a2fb606fd98522f
    .xword 0x12dd08146e23ffc4
    .xword 0x3c748f3e3485a8b8
    .xword 0x60828dabb818f35c
    .xword 0x6ac0c57f1174905c
    .xword 0xcaef3c1aa0012177

    .align  PITON_L1D_WAY_SIZE
    .xword 0xb6b927af4a124709
    .xword 0x14e40ed12c4b1480
    .xword 0x614b6964d3cfd400
    .xword 0xa48281117ab6bbd5
    .xword 0x8922b50fc0b0dce5
    .xword 0x49cf48d391533050
    .xword 0x4c798cf60ecd29c7
    .xword 0xcfdfb1634eec45d0



SECTION .DATA_CORE4_1 DATA_VA=0xa8212000
attr_data {
    Name = .DATA_CORE4_1,
    VA = 0xa8212000,
    PA = ra2pa(0xa8212000,0),
    RA = 0xa8212000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x64cc1e5ee876db4b
    .xword 0x10392111445e49be
    .xword 0x76d8bad669b4ebae
    .xword 0x7e86a942394ee0cb
    .xword 0xd327177faf54a027
    .xword 0x45a36ba7abafcf10
    .xword 0x9c761ef6057c041f
    .xword 0xfe5a97c9ce25a9e7

    .align  PITON_L1D_WAY_SIZE
    .xword 0x819ccd856016ac42
    .xword 0x69128ab7c1bd9263
    .xword 0x869aa230c4cc8fb8
    .xword 0xbf9c03eb7565ab2f
    .xword 0xff578a5ccd6d029c
    .xword 0xfa3a55ce23b0a1ad
    .xword 0xceac49b9093769ec
    .xword 0x590a1df8afd1245f

    .align  PITON_L1D_WAY_SIZE
    .xword 0xa48bf9d80e696ace
    .xword 0xf810690177e42da2
    .xword 0x61c96e562461d92
    .xword 0xbe50ef59419a4995
    .xword 0xef70408efee98dc1
    .xword 0x9cebe30f61188d4d
    .xword 0x17a1b6f46ee24e21
    .xword 0xbd090cc9d22465c6

    .align  PITON_L1D_WAY_SIZE
    .xword 0x9280b3e0b59cf399
    .xword 0xc65e2cf34bb4a08a
    .xword 0x853560d1aade69d
    .xword 0x6d68c2200e204dc9
    .xword 0xd0c78388bd69bcef
    .xword 0x3f8c9518d3274204
    .xword 0x9133bca4c064feef
    .xword 0xcd958475a64279b3



SECTION .DATA_CORE5_0 DATA_VA=0xa8214000
attr_data {
    Name = .DATA_CORE5_0,
    VA = 0xa8214000,
    PA = ra2pa(0xa8214000,0),
    RA = 0xa8214000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .global data_core_5
data_core_5:
    .align  PITON_L1D_WAY_SIZE
    .xword 0xaee16ed4ac8f75b
    .xword 0x79eb68d565886762
    .xword 0x7d20049647e55884
    .xword 0x9e75b63d7e82792a
    .xword 0xb9fd4480fec197ef
    .xword 0x19445ae7d10f1a9d
    .xword 0x8f4f3aa5269477d1
    .xword 0xedb65df775600cc6

    .align  PITON_L1D_WAY_SIZE
    .xword 0x9f8703a0e4899af2
    .xword 0xcdbbf2363b7715a5
    .xword 0x944f4d470dbbf534
    .xword 0xef5b88d78f94ff70
    .xword 0x199a582d03fbad9
    .xword 0xdcb4a98f40617bf3
    .xword 0xb6de5880d262f43b
    .xword 0x2c348242fe886af1

    .align  PITON_L1D_WAY_SIZE
    .xword 0x52a935957126ab49
    .xword 0xa5542194a03071f8
    .xword 0xb7c08064647e3816
    .xword 0xffe0cb87317b2d2d
    .xword 0x3c9991d1808d572b
    .xword 0x77878ec851cd8271
    .xword 0xc578ba013d5cb076
    .xword 0x5ba5b4b1b0e96464

    .align  PITON_L1D_WAY_SIZE
    .xword 0x623a639ff1ce0028
    .xword 0x24e486861a7418d6
    .xword 0x1672de74dd2e5bea
    .xword 0x21a66d00b7c877d2
    .xword 0x8c0880ad6af1721f
    .xword 0x6e6513a278ab8ebf
    .xword 0x16c3d5297d4621c7
    .xword 0x32dbf1f327ec81dd



SECTION .DATA_CORE5_1 DATA_VA=0xa8216000
attr_data {
    Name = .DATA_CORE5_1,
    VA = 0xa8216000,
    PA = ra2pa(0xa8216000,0),
    RA = 0xa8216000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x9cff649a4442bdf4
    .xword 0x22feca0702456ecb
    .xword 0x6655682110ef1bea
    .xword 0xda5d6942da1eb7e4
    .xword 0x41f8f48c180d3269
    .xword 0x519a767dce5ece88
    .xword 0x4f1063aeb733c340
    .xword 0xa874445c9fee4473

    .align  PITON_L1D_WAY_SIZE
    .xword 0xe1e2ac142cfe82b8
    .xword 0x6d8bddecd18c5ecc
    .xword 0x42cb2a8352f6e0ea
    .xword 0x646ac84ec809d940
    .xword 0x332b51571e9ecffa
    .xword 0xfb83305f510da29e
    .xword 0x6fbc1f4a4eface9f
    .xword 0x86b67b8dba92dca3

    .align  PITON_L1D_WAY_SIZE
    .xword 0xa2e359454e12c448
    .xword 0xe11ebfaadc005827
    .xword 0x86ef2dbbf860c688
    .xword 0x97a8b4a36187bb0
    .xword 0x8e72b4802384e28a
    .xword 0xadf3e51637d40313
    .xword 0xa678d53645815db2
    .xword 0x7a7718a202d32ff9

    .align  PITON_L1D_WAY_SIZE
    .xword 0x4e3b2a7869497855
    .xword 0xb82d39e88c7319e1
    .xword 0xda090c1b09e647bf
    .xword 0x1c0afbe3092c3937
    .xword 0xcd8a55f68745b069
    .xword 0xb8197efa858eda56
    .xword 0x26ab7ac89d5c52b4
    .xword 0x6059e2bc9b2bd5f0



SECTION .DATA_CORE6_0 DATA_VA=0xa8218000
attr_data {
    Name = .DATA_CORE6_0,
    VA = 0xa8218000,
    PA = ra2pa(0xa8218000,0),
    RA = 0xa8218000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .global data_core_6
data_core_6:
    .align  PITON_L1D_WAY_SIZE
    .xword 0x2018ee5f4fd283db
    .xword 0x4896bc2f3dcdd4f8
    .xword 0x94aca7d8cfa693fe
    .xword 0xf1ed6f2f484c009e
    .xword 0x9cd579643bd361e1
    .xword 0xcf24287bb0200672
    .xword 0xfdac2b6b06bac666
    .xword 0x97d70160f3acc831

    .align  PITON_L1D_WAY_SIZE
    .xword 0x1222a8beba71e348
    .xword 0x27f120ba6b46add2
    .xword 0x542a6c80cc8a1b4b
    .xword 0xc3f1545f7468c27
    .xword 0x5b7329e4e9f3eaa0
    .xword 0x9519c8850ae1bc27
    .xword 0x19c802e77a01b3dc
    .xword 0x97547b1bfdf7bd8c

    .align  PITON_L1D_WAY_SIZE
    .xword 0xdc5a663c4008f48c
    .xword 0x335f251c973a1f30
    .xword 0x2c45619022012b
    .xword 0xa1ccb40f10dbdf72
    .xword 0x2f2b0f1f051645e3
    .xword 0x8fb7b0befec39123
    .xword 0xedaa8ddc6f79e3a5
    .xword 0x12f8d132bf703eb2

    .align  PITON_L1D_WAY_SIZE
    .xword 0x51c89a7dd20ffd30
    .xword 0x1b8f464638c67c19
    .xword 0xf39aa0a31591b840
    .xword 0x4180e4925c89f9ec
    .xword 0xb88ce86a0a301197
    .xword 0xa6e64897586dac4e
    .xword 0x52f3480f20e7a583
    .xword 0xcd8efe7fc52987aa



SECTION .DATA_CORE6_1 DATA_VA=0xa821a000
attr_data {
    Name = .DATA_CORE6_1,
    VA = 0xa821a000,
    PA = ra2pa(0xa821a000,0),
    RA = 0xa821a000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x1801662f7b15b986
    .xword 0x177b0226e4f676a6
    .xword 0xcb34ebbe808d4005
    .xword 0xcd4272df9d174b9f
    .xword 0x7848c98c4590d8e
    .xword 0x77ad02a51c4e794d
    .xword 0x9ebffb5b01b3e2b
    .xword 0xc97857b88770105e

    .align  PITON_L1D_WAY_SIZE
    .xword 0xd6b73397f4008ed6
    .xword 0xeba53ae0ef0bb554
    .xword 0xa994df8bef1185e3
    .xword 0xa220de7e86c80148
    .xword 0x405b07ee8c346079
    .xword 0xbc7369dd429e4592
    .xword 0x9e872a4926ccdf53
    .xword 0xff7f9a96e5fd8657

    .align  PITON_L1D_WAY_SIZE
    .xword 0xb2313c8be3901103
    .xword 0xb4094d8e15e87c5a
    .xword 0x8c5269c74a94f6e5
    .xword 0xef14e6ff27647a98
    .xword 0x96c2d354203eb51a
    .xword 0xc7381e6329e44493
    .xword 0x206a9a0145f5fc95
    .xword 0xc91472acdafa1e57

    .align  PITON_L1D_WAY_SIZE
    .xword 0xf2c80aeafd89eef8
    .xword 0x6a93efaa57a2c48f
    .xword 0x1315093729251db7
    .xword 0xd4c57bce1c410943
    .xword 0x64331bbafa65215a
    .xword 0xd34507001e65e454
    .xword 0x6b770dec9052c197
    .xword 0x4514fde93d573d27



SECTION .DATA_CORE7_0 DATA_VA=0xa821c000
attr_data {
    Name = .DATA_CORE7_0,
    VA = 0xa821c000,
    PA = ra2pa(0xa821c000,0),
    RA = 0xa821c000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .global data_core_7
data_core_7:
    .align  PITON_L1D_WAY_SIZE
    .xword 0x8f6677c80c9beea2
    .xword 0x6e15cad7982aede7
    .xword 0x3e0731c5578cb7a0
    .xword 0x59714075e31121a4
    .xword 0x5aea49b285afa1d0
    .xword 0x805cd85e4f14bfbf
    .xword 0x8d1c9e3c59c14480
    .xword 0x1a08c9544f10e85a

    .align  PITON_L1D_WAY_SIZE
    .xword 0x52cde03533a14bc
    .xword 0xa2a2a85d6721b869
    .xword 0xd2fd5bccc2385f91
    .xword 0x9bb6a3717dda7418
    .xword 0x9d61c6de12cb6b0d
    .xword 0xe8f7ddf39b403414
    .xword 0x74acfa4dbde958dd
    .xword 0x468e14ebcf9eb5df

    .align  PITON_L1D_WAY_SIZE
    .xword 0x798b61eccd6ba8b1
    .xword 0xce260ae85272ef7d
    .xword 0x4ab893d054ee49aa
    .xword 0xac10d16f44e16df3
    .xword 0xcdf89a88333838df
    .xword 0x4053a4bed4d45b46
    .xword 0xea3d8b0ec11eb7d2
    .xword 0xd6b4e2d004dd03a2

    .align  PITON_L1D_WAY_SIZE
    .xword 0x179de7435490ad2b
    .xword 0xd9602d3cf6830aed
    .xword 0xab950fd1c362b3fe
    .xword 0x95c5a1716d2b3014
    .xword 0xe27c27e862d13e49
    .xword 0x1d424a55cd40b8c7
    .xword 0x4c621ba263c9021b
    .xword 0x444a737c0807d9ae



SECTION .DATA_CORE7_1 DATA_VA=0xa821e000
attr_data {
    Name = .DATA_CORE7_1,
    VA = 0xa821e000,
    PA = ra2pa(0xa821e000,0),
    RA = 0xa821e000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0xb70190baabf04af8
    .xword 0xbfa0e6985089ad41
    .xword 0x332fc7ea6526eb53
    .xword 0x576c5b4e20504d97
    .xword 0x896855d3051a5b19
    .xword 0x12015ba2f5e33073
    .xword 0xf393789df734d7c
    .xword 0x1dc513940dddaf1e

    .align  PITON_L1D_WAY_SIZE
    .xword 0x6dabdbd214dfd6eb
    .xword 0x5dbdad667033fcec
    .xword 0x41343f100ca9a3c3
    .xword 0xac7805a7386ee973
    .xword 0x12e45f877eea0deb
    .xword 0x68567d807146a499
    .xword 0xdf3d191dec4cada6
    .xword 0xd6db796176394eeb

    .align  PITON_L1D_WAY_SIZE
    .xword 0x1e3334a9ed5f5d2
    .xword 0x4dea32d3010f7a60
    .xword 0x69ad1cf756d75b6d
    .xword 0x9eef919268d730e9
    .xword 0x416181438fe48d76
    .xword 0x2d99f47620a5590d
    .xword 0xb805e8236decd0a1
    .xword 0x99a8fca656967cb9

    .align  PITON_L1D_WAY_SIZE
    .xword 0xba9747a1561f37c2
    .xword 0x7b8778ace9f86090
    .xword 0xef44890a84f183f8
    .xword 0xbb9102d7ac410083
    .xword 0xd7b0d76d2349e48a
    .xword 0x3354a38efe9a230c
    .xword 0xa54acdfa838dd4c1
    .xword 0x354f3ea6567bde2a



SECTION .DATA_CORE8_0 DATA_VA=0xa8220000
attr_data {
    Name = .DATA_CORE8_0,
    VA = 0xa8220000,
    PA = ra2pa(0xa8220000,0),
    RA = 0xa8220000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .global data_core_8
data_core_8:
    .align  PITON_L1D_WAY_SIZE
    .xword 0x367047a1df7db39c
    .xword 0x9e2b30eb1ca572a7
    .xword 0x886b5d3edd0c55a4
    .xword 0xf503cbbee5980222
    .xword 0x1de6437cc55216c6
    .xword 0xad673b891c98119e
    .xword 0xd3c09176b0db8155
    .xword 0x9779df055f592b37

    .align  PITON_L1D_WAY_SIZE
    .xword 0xaecf2f50a71ab1da
    .xword 0x624c440d5c51e6ca
    .xword 0x3abe6fc55e951fea
    .xword 0x1b348e11f10bafbf
    .xword 0xd97fa5ecda05ad0
    .xword 0x4a8e892c0b49b6b8
    .xword 0xc974eeb3c0b65c97
    .xword 0x39cf92f5807f9dae

    .align  PITON_L1D_WAY_SIZE
    .xword 0xa3b58e13868c7577
    .xword 0x1699fe37bc50b2b4
    .xword 0x989fb554c88bb1bc
    .xword 0x480af8140b94db8d
    .xword 0xb2ef7d8794f5ea65
    .xword 0xfc8c739635e2fdb9
    .xword 0x80155b645523bdc
    .xword 0xa1620dd99a73166

    .align  PITON_L1D_WAY_SIZE
    .xword 0xd37008993bb76ffb
    .xword 0xa9ac275decbe9ec6
    .xword 0xd5c10d5a9206d2c3
    .xword 0x24c18e22e67d97ab
    .xword 0x49d290fa7674f9b
    .xword 0x1c2c3fae804e4d84
    .xword 0x28f6531d19a842b3
    .xword 0x4d45596431a54e2d



SECTION .DATA_CORE8_1 DATA_VA=0xa8222000
attr_data {
    Name = .DATA_CORE8_1,
    VA = 0xa8222000,
    PA = ra2pa(0xa8222000,0),
    RA = 0xa8222000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x7c01887604536db6
    .xword 0x53f8a91fb038bd99
    .xword 0x8349a5198afbc24d
    .xword 0xee053d94cb76aa64
    .xword 0x1ba91f781ab746c8
    .xword 0xfcb85ba89c7e9edb
    .xword 0xb9ba6b108b958c77
    .xword 0x5b06fa8b326e6db6

    .align  PITON_L1D_WAY_SIZE
    .xword 0x9716073bac98297a
    .xword 0x272c8a7ae94bcea9
    .xword 0x1acbe358e6709f7f
    .xword 0xba0a2a747ae93087
    .xword 0x2c419565e7633ac2
    .xword 0xfd9a256ba63c7670
    .xword 0x61ee77491e3fcb82
    .xword 0x6402c7b6f1ea978d

    .align  PITON_L1D_WAY_SIZE
    .xword 0x1921ca86173f3bf3
    .xword 0xf2623ef1dd03b1d4
    .xword 0x9719be8112bc9c2b
    .xword 0xf70bbe1de991fa80
    .xword 0x2633426ccb9026f8
    .xword 0x6c1868b9a444ae81
    .xword 0x866d2730d04ed7be
    .xword 0x50f04ade270c039d

    .align  PITON_L1D_WAY_SIZE
    .xword 0x8b10a7a552a457fe
    .xword 0x6682aecb2a92590e
    .xword 0x100fa72e3d225ba5
    .xword 0xbf7c97795abba999
    .xword 0x66149b1c15dc0603
    .xword 0x8d662576fef8f94b
    .xword 0x4029cc2e4c40a5bb
    .xword 0x8166fbeb5ebf794e



SECTION .DATA_CORE9_0 DATA_VA=0xa8224000
attr_data {
    Name = .DATA_CORE9_0,
    VA = 0xa8224000,
    PA = ra2pa(0xa8224000,0),
    RA = 0xa8224000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .global data_core_9
data_core_9:
    .align  PITON_L1D_WAY_SIZE
    .xword 0x941b6601aa25434f
    .xword 0xb5410c25d9ffc14f
    .xword 0xc93575e46ef88193
    .xword 0x8573a25bd9fa4e4a
    .xword 0x37227789c76b2e2a
    .xword 0xbd5f1ff2c55be3e3
    .xword 0xb259593125f0b3eb
    .xword 0xe241fa2e64dc8032

    .align  PITON_L1D_WAY_SIZE
    .xword 0x10f368e537deb649
    .xword 0x7119e7e1557e7354
    .xword 0x8e65ce7fd54ef2c3
    .xword 0x566ae6acbbb8ba70
    .xword 0x2da7a8c2495386f4
    .xword 0x41fd497dd4f90b5c
    .xword 0x677277292d634c71
    .xword 0xa7db2d353a7e3c57

    .align  PITON_L1D_WAY_SIZE
    .xword 0xd43344437f1164
    .xword 0x842465e38ae4fd91
    .xword 0xd045f0b342e57100
    .xword 0xaf9f23fd5324b24f
    .xword 0x35096014a0e6d1a1
    .xword 0xa64bad2ead949a5
    .xword 0xf6239fe183a2b6b6
    .xword 0xf31f495915c6a1c9

    .align  PITON_L1D_WAY_SIZE
    .xword 0x165a98d4985660f3
    .xword 0x54f0e90a8d78534a
    .xword 0xef0ca93265f48509
    .xword 0x664395e750a7e36b
    .xword 0xc741b5165aa4b889
    .xword 0x1dec522eaa6fd186
    .xword 0xb14deb8fe2100000
    .xword 0x74bf36b90d5f54bb



SECTION .DATA_CORE9_1 DATA_VA=0xa8226000
attr_data {
    Name = .DATA_CORE9_1,
    VA = 0xa8226000,
    PA = ra2pa(0xa8226000,0),
    RA = 0xa8226000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0xbe19a51000b82d79
    .xword 0x67bdb38dbb84aeb2
    .xword 0xc12d46b4b876a3fc
    .xword 0xc38bbdcb2642c21
    .xword 0xd37c8bda60f5d527
    .xword 0xe7271ef52ea8f849
    .xword 0x558b3ac4c4feb17d
    .xword 0xafa854b76a70f

    .align  PITON_L1D_WAY_SIZE
    .xword 0xae41c0f016b38931
    .xword 0xb051e780b63a13d5
    .xword 0xdcdcabb0aeb6dc17
    .xword 0x4a94666e768b54c4
    .xword 0x7e49bff99817006b
    .xword 0x880169ba38ca2f64
    .xword 0xf47c4f39f9302b2c
    .xword 0x136409d95dff944a

    .align  PITON_L1D_WAY_SIZE
    .xword 0x1b495475b4c1e7ad
    .xword 0xc2d221d39b2de6ab
    .xword 0x9aa728fa49e41e39
    .xword 0x85699b8c2b44b674
    .xword 0x8ba186e4434c24b8
    .xword 0xf51da0e08a544e63
    .xword 0xfb41a83ebe5e327b
    .xword 0xefc568606cf9919a

    .align  PITON_L1D_WAY_SIZE
    .xword 0x8d7b26f592821fea
    .xword 0x24de6c70aceee593
    .xword 0xba2c4c18fe79793a
    .xword 0xad2cca130fd49ff3
    .xword 0x31c5899da871883a
    .xword 0xc82c2e254666ca02
    .xword 0xd61db1e49d8c963c
    .xword 0xac01c4e8e393e955



SECTION .DATA_CORE10_0 DATA_VA=0xa8228000
attr_data {
    Name = .DATA_CORE10_0,
    VA = 0xa8228000,
    PA = ra2pa(0xa8228000,0),
    RA = 0xa8228000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .global data_core_10
data_core_10:
    .align  PITON_L1D_WAY_SIZE
    .xword 0x5f2c0ff73483dc9d
    .xword 0x46dc6a154406a82c
    .xword 0xdb614e5b76170941
    .xword 0x284241794fafc157
    .xword 0x8b5d9dba64e2bb99
    .xword 0xf8ccccb83bbd0194
    .xword 0x1c68321952e4b942
    .xword 0xdccab13f89f730f0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x3c45af8f916a4d48
    .xword 0x8ad60f5f8c5a23c1
    .xword 0x298fc47347a526f6
    .xword 0x95c9ac12e0c9a051
    .xword 0x1556f905dd0f033
    .xword 0x780b87dbb2f83d24
    .xword 0xc91b5cdbba983328
    .xword 0xba09787cc6c35150

    .align  PITON_L1D_WAY_SIZE
    .xword 0x19406280aa63c988
    .xword 0x2f73fcd4682cb5f7
    .xword 0xc6d8482db7f62d65
    .xword 0x93be144ba8f9111d
    .xword 0xd3acc39ae85111d8
    .xword 0x315584c365416851
    .xword 0x4d675e2ed4b6df5c
    .xword 0xf92044e66d273229

    .align  PITON_L1D_WAY_SIZE
    .xword 0x6dcc5e858ff2765f
    .xword 0x4f45c02a313afba6
    .xword 0xd39ea7b265b55405
    .xword 0x6a6f1eb27695027a
    .xword 0x5077a5d91bec720e
    .xword 0x9bae005b7e67f94e
    .xword 0x3a44344bf1ce7633
    .xword 0xd313134ebd4938f9



SECTION .DATA_CORE10_1 DATA_VA=0xa822a000
attr_data {
    Name = .DATA_CORE10_1,
    VA = 0xa822a000,
    PA = ra2pa(0xa822a000,0),
    RA = 0xa822a000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0xf9ce38e2cd8cbf17
    .xword 0x79516577336760d1
    .xword 0xed72af97dbfa8e0d
    .xword 0x84da6effb316af40
    .xword 0x9aec5ebf26b75ec3
    .xword 0xe4f6afcc84e9aa97
    .xword 0xe17574bba4841195
    .xword 0x35ff40df5ef9205

    .align  PITON_L1D_WAY_SIZE
    .xword 0x2b76ccb591baee94
    .xword 0x99c065397c63da27
    .xword 0x9971933ea836ebda
    .xword 0xd0715cd053c6d8dd
    .xword 0x8cc225f612458748
    .xword 0x708bea4382f7862e
    .xword 0xdc1c2fe2af07cadd
    .xword 0x26973d624e491149

    .align  PITON_L1D_WAY_SIZE
    .xword 0x6c582e616daf0835
    .xword 0xc1a61a49ee746025
    .xword 0x1f36d86dd5e56eb3
    .xword 0x72405873b443ef62
    .xword 0x38311501d3143f75
    .xword 0x5d9f79ce1940d13b
    .xword 0x7f4f2f338da7bc0a
    .xword 0x40effcb3ac964317

    .align  PITON_L1D_WAY_SIZE
    .xword 0x7352d6b599827c70
    .xword 0x4e9124fbd7a9f4fb
    .xword 0x2d486fd94fc5278c
    .xword 0x95b8cf88f28c333b
    .xword 0xa7e579250ce2db6
    .xword 0x2134788f6c1f16fd
    .xword 0x3f810589a01196f0
    .xword 0x66306a6961b0ecb7



SECTION .DATA_CORE11_0 DATA_VA=0xa822c000
attr_data {
    Name = .DATA_CORE11_0,
    VA = 0xa822c000,
    PA = ra2pa(0xa822c000,0),
    RA = 0xa822c000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .global data_core_11
data_core_11:
    .align  PITON_L1D_WAY_SIZE
    .xword 0x872d826c79eb2f89
    .xword 0x5bb72f5616996f91
    .xword 0xfdeda649f982f3ba
    .xword 0x1fda3f76b699cd68
    .xword 0x28e10f6bec6560b8
    .xword 0x462a7ec6fefddb43
    .xword 0xa5c92c9e4bef1af9
    .xword 0x4bd5e79d95bdec56

    .align  PITON_L1D_WAY_SIZE
    .xword 0xea31abb2e854da
    .xword 0x70216c338b876431
    .xword 0x5b249f01b43b6ad2
    .xword 0x8b4373477e3d0cb0
    .xword 0x4e3406da89f1754d
    .xword 0x8cd306c8c8126153
    .xword 0x86412b029673ce2a
    .xword 0x56118073b03f0800

    .align  PITON_L1D_WAY_SIZE
    .xword 0xf655db54280a9ad0
    .xword 0xd11768d7e03b5a56
    .xword 0x4c47523df8daf6e2
    .xword 0xc165097a82d6bd62
    .xword 0xc2a0345d448ac13
    .xword 0x58222558b6397ae8
    .xword 0x731b1482e2c34f87
    .xword 0x87e133d341814ded

    .align  PITON_L1D_WAY_SIZE
    .xword 0x1f6c0bb8940cd6e1
    .xword 0x7efbf4eb0d90bfe4
    .xword 0xa969f6e072495d64
    .xword 0xbc7c31dc9d57baae
    .xword 0x796e81584a721124
    .xword 0xa1441c804826e5ca
    .xword 0xbbed19dde731d839
    .xword 0xc14834f299baaada



SECTION .DATA_CORE11_1 DATA_VA=0xa822e000
attr_data {
    Name = .DATA_CORE11_1,
    VA = 0xa822e000,
    PA = ra2pa(0xa822e000,0),
    RA = 0xa822e000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0xb2a62e9f95f2a0b
    .xword 0x4c6b70c1c101ff73
    .xword 0xb3ab20f48e8df1be
    .xword 0x869c6c584349ce09
    .xword 0x140ed7d8ec2514c2
    .xword 0xd7394727d2b4627d
    .xword 0x577f5386128dce73
    .xword 0xcc9891abe167792d

    .align  PITON_L1D_WAY_SIZE
    .xword 0xbcd7acb61e4ec8ac
    .xword 0xebef8e906987b6da
    .xword 0x1dac604339701270
    .xword 0x154afdde2390335d
    .xword 0x34a8825d0720c174
    .xword 0xcef554fb80e23b36
    .xword 0xf8ff42e42c179e2d
    .xword 0xbe694a1d1b4d8313

    .align  PITON_L1D_WAY_SIZE
    .xword 0xc0b5f5cd7b3ee993
    .xword 0x64bf91f6e52121f0
    .xword 0x5fcdaf3ff03d9eee
    .xword 0x93815e4598ad667a
    .xword 0xe67456109d3855aa
    .xword 0x3f11a5d26cc325e4
    .xword 0xb2abf53a55a93503
    .xword 0x8fe461447933db0a

    .align  PITON_L1D_WAY_SIZE
    .xword 0x86d0b6888d6b701c
    .xword 0xe04ed7a4e688cf
    .xword 0x321305c8cb6c3481
    .xword 0xef406ee5e844f733
    .xword 0x43a262f4879b9ceb
    .xword 0x512580c16e124576
    .xword 0xb958c143594a8a41
    .xword 0x5d52781ef69e5984



SECTION .DATA_CORE12_0 DATA_VA=0xa8230000
attr_data {
    Name = .DATA_CORE12_0,
    VA = 0xa8230000,
    PA = ra2pa(0xa8230000,0),
    RA = 0xa8230000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .global data_core_12
data_core_12:
    .align  PITON_L1D_WAY_SIZE
    .xword 0xf588bef93831d495
    .xword 0x50b8fb1e8f517c48
    .xword 0x62a158b72b0aab5a
    .xword 0x820e67ef1e0ff8f4
    .xword 0x57cbc32d8ee28efa
    .xword 0x491d655bef4797c7
    .xword 0xfa3ee12b66855c76
    .xword 0x2af44d31773f1b83

    .align  PITON_L1D_WAY_SIZE
    .xword 0x6f4d3fb8beff3c6e
    .xword 0xa53c51bcd971483d
    .xword 0xcb89240b18965e31
    .xword 0xf65286282c99c21f
    .xword 0x3f7ff462bc358c3c
    .xword 0xccbc4150150ecc02
    .xword 0x97aeef88bf0be1c
    .xword 0x89dee2b35f1725fb

    .align  PITON_L1D_WAY_SIZE
    .xword 0xc11b9e475233bba
    .xword 0xe2dd3c51d201e1a6
    .xword 0x891c52ebeb8040d
    .xword 0x681a349bf8ed0b93
    .xword 0xbbb489bd1742685e
    .xword 0xb7ca8ad2fc42afb9
    .xword 0xa5954b9720150b7f
    .xword 0x1e2df891644fb96b

    .align  PITON_L1D_WAY_SIZE
    .xword 0xb927753149657a04
    .xword 0xbf8d240fa4f52404
    .xword 0x2b25ff455623b8cd
    .xword 0x1e61b3c938db75cc
    .xword 0x4312e8b4b8299a50
    .xword 0x48a3b270a0cabbf
    .xword 0x64b7a0923d1eb100
    .xword 0xd95a803b8400fe07



SECTION .DATA_CORE12_1 DATA_VA=0xa8232000
attr_data {
    Name = .DATA_CORE12_1,
    VA = 0xa8232000,
    PA = ra2pa(0xa8232000,0),
    RA = 0xa8232000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x697a84ec52bd6d42
    .xword 0x4afcc9a9acf7119d
    .xword 0xcbdedf7cf01e17cd
    .xword 0x60805299ff083767
    .xword 0x7197510d6d1d720f
    .xword 0x1fa407ac038145d1
    .xword 0x7aaa0391345eb5d5
    .xword 0x5daf2da211581c97

    .align  PITON_L1D_WAY_SIZE
    .xword 0xec2eef6b54f4b154
    .xword 0xde2f6fdece8e47b2
    .xword 0xa79109fc82bfda2
    .xword 0x1d7b357889ee552
    .xword 0x1c16e1bd7e4a05a9
    .xword 0x711ba0a6087f079a
    .xword 0x99308fc0f8d25b04
    .xword 0x2374a6a4bbcd3e7c

    .align  PITON_L1D_WAY_SIZE
    .xword 0x2eddf9ebeeff7b0e
    .xword 0x65f07d7db2cad0f9
    .xword 0x72dbf029e3903cfc
    .xword 0x4dd50a2d76db88ec
    .xword 0x2aae53cbb3d6e79e
    .xword 0x7619d73ed958d7a9
    .xword 0x77688cb95091e930
    .xword 0x6e60b6aa910025f9

    .align  PITON_L1D_WAY_SIZE
    .xword 0x52068f12c96713b2
    .xword 0x2123b36ec21a18ff
    .xword 0x2b2a751ef908caee
    .xword 0x29265c178f98a8ff
    .xword 0x64e9ed89314c036a
    .xword 0x317437b7ccefc3c6
    .xword 0x95e481e1f61aaba3
    .xword 0xb1601e11231696de



SECTION .DATA_CORE13_0 DATA_VA=0xa8234000
attr_data {
    Name = .DATA_CORE13_0,
    VA = 0xa8234000,
    PA = ra2pa(0xa8234000,0),
    RA = 0xa8234000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .global data_core_13
data_core_13:
    .align  PITON_L1D_WAY_SIZE
    .xword 0xd7fbf2de660bb7de
    .xword 0x3c7e0786ed0419d8
    .xword 0x52e8ebaff7759135
    .xword 0x7312523c0fe4085a
    .xword 0x45a1cb78dce7c1ee
    .xword 0x76c9a27260c77797
    .xword 0x4bb60b2a4f06ba0d
    .xword 0x69bc9d3db7ff182a

    .align  PITON_L1D_WAY_SIZE
    .xword 0xa0dd4e91b5a215ac
    .xword 0xc55e5529d5035278
    .xword 0xf21f7c8cbc66e2c4
    .xword 0x4e52ab288f11fd13
    .xword 0x30b5a24cfff26de
    .xword 0x9b88f211180c121f
    .xword 0x539c443028f5a3f0
    .xword 0x5175275f718b5f0d

    .align  PITON_L1D_WAY_SIZE
    .xword 0x5978edc94f4d559a
    .xword 0x8a88cd98a6d07863
    .xword 0xbd22948eaed8b69a
    .xword 0x45e81b1c25723f6d
    .xword 0x21008bb2226c7322
    .xword 0x30a3664bb846a517
    .xword 0x9544a3e699179a90
    .xword 0x5299e1aa543d3eb7

    .align  PITON_L1D_WAY_SIZE
    .xword 0xd41be9b0c777452a
    .xword 0xda717f2cd757b3bc
    .xword 0xc34302cd0b293d48
    .xword 0x7c6dd6a49d266938
    .xword 0x274ef9b8f810823a
    .xword 0x2314c3fcdd18a3e7
    .xword 0x52c9101610bb21d4
    .xword 0xbef4c572bf564d11



SECTION .DATA_CORE13_1 DATA_VA=0xa8236000
attr_data {
    Name = .DATA_CORE13_1,
    VA = 0xa8236000,
    PA = ra2pa(0xa8236000,0),
    RA = 0xa8236000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0xa3553813285b8a22
    .xword 0x138218dd708adf10
    .xword 0x59a28dd3753b4821
    .xword 0xdc415df8d4588122
    .xword 0xcd07f9bb60c56da2
    .xword 0x1dbdb34525a0e0b
    .xword 0xbc23d2371abb951b
    .xword 0x77635315a9209189

    .align  PITON_L1D_WAY_SIZE
    .xword 0xa67aa9c61ef6e840
    .xword 0xb7068807084e35e8
    .xword 0x18662b8c75fc9eb8
    .xword 0xd8da86883329340f
    .xword 0xb50ec80e4a29cd97
    .xword 0x52abe81a3cac202f
    .xword 0xbc6c7e9b364fc2ec
    .xword 0xe16d12628ec2d521

    .align  PITON_L1D_WAY_SIZE
    .xword 0xc6cfcdab74574006
    .xword 0x465152f1f53eea9b
    .xword 0x53465905e9cb0613
    .xword 0x6afc27f2befff1f2
    .xword 0x9b5f0a66603a2dba
    .xword 0x1f487a27446bb788
    .xword 0x967ccd1e0117110e
    .xword 0xe0cc93ff876401b

    .align  PITON_L1D_WAY_SIZE
    .xword 0x9312ae73bbeb8bdd
    .xword 0x41612fc005817d56
    .xword 0x19aa98d09d5676db
    .xword 0x26c2df7c4a23f0ae
    .xword 0x706acfb876510394
    .xword 0x9a13aea328a8558e
    .xword 0xcc885e78f5ae571b
    .xword 0x5900f1219297c1f5



SECTION .DATA_CORE14_0 DATA_VA=0xa8238000
attr_data {
    Name = .DATA_CORE14_0,
    VA = 0xa8238000,
    PA = ra2pa(0xa8238000,0),
    RA = 0xa8238000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .global data_core_14
data_core_14:
    .align  PITON_L1D_WAY_SIZE
    .xword 0x6d3be455b5dc1562
    .xword 0xe9bfdb0cefd1bd98
    .xword 0x5653234a29098034
    .xword 0x3af26c667f4f614c
    .xword 0x34ca673f57d0fec9
    .xword 0xc1201c81aaedf1a5
    .xword 0xfbeedd32b7644ac
    .xword 0x9056b97fb545f42b

    .align  PITON_L1D_WAY_SIZE
    .xword 0xdc9ee9eaf156dfd3
    .xword 0xa475d764e4175db7
    .xword 0x153c8f4c99feeca9
    .xword 0xfa1a3ae72fabad17
    .xword 0xff3d5e361485db1d
    .xword 0xcdea5beffff89bbe
    .xword 0xd83da4f672ee4504
    .xword 0xb564df4ca4897149

    .align  PITON_L1D_WAY_SIZE
    .xword 0x18849b33a2b6d160
    .xword 0x875cedb07b136005
    .xword 0x2551b0e4dfeedabc
    .xword 0xf02749ecac19515d
    .xword 0x2fe8d9055afd45d5
    .xword 0xea3ffdd8a52856f2
    .xword 0x9bd9dccb9d38cf9d
    .xword 0x8b45b03e7b0c9043

    .align  PITON_L1D_WAY_SIZE
    .xword 0xa9a9ae9393da3d44
    .xword 0xa7dc47dd7d083826
    .xword 0xfdfe0a5f83081b3a
    .xword 0xc937bc2f6a19134c
    .xword 0x92f02b6178428f96
    .xword 0xff3541dd5c68c1d4
    .xword 0xa72aaffc45fe2e4b
    .xword 0x6f76c7d26d898478



SECTION .DATA_CORE14_1 DATA_VA=0xa823a000
attr_data {
    Name = .DATA_CORE14_1,
    VA = 0xa823a000,
    PA = ra2pa(0xa823a000,0),
    RA = 0xa823a000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x3fc52e7ef41f498e
    .xword 0x9fb5452e5ce6d05b
    .xword 0x92e185de7c107231
    .xword 0xdf3a57ad3170db6e
    .xword 0x7d85ff4ee002163d
    .xword 0x72d7b255ecf7f457
    .xword 0x3e6c656a14c9ceaf
    .xword 0x362fba54e2de7f72

    .align  PITON_L1D_WAY_SIZE
    .xword 0xd3c120f09b8d8d6a
    .xword 0x8c8a7464f9b58565
    .xword 0x14c5571878eb77cb
    .xword 0x3bdbb11f4416d65d
    .xword 0xfe88eb110307de00
    .xword 0x52393aaa9cb116d6
    .xword 0xda039ad896c11b56
    .xword 0x8f8ab57b97b77efa

    .align  PITON_L1D_WAY_SIZE
    .xword 0xf90a5881b74b4a1e
    .xword 0x553c3de9569b1fdc
    .xword 0x91b8955f16f6b831
    .xword 0x79f86c71dca611de
    .xword 0xf4e6707aca5b6422
    .xword 0x3333d5bf1ada32c3
    .xword 0xde5b8cba99368409
    .xword 0x4798c2b8603f4ba0

    .align  PITON_L1D_WAY_SIZE
    .xword 0x4e51b662bf4bee17
    .xword 0xdd4fa5ab29373342
    .xword 0x2686dec7a9fe853b
    .xword 0x2f9f46746d645e58
    .xword 0xeb17b0e1cde84654
    .xword 0x465a3483788e6ebd
    .xword 0xea8b390e04bbe6c3
    .xword 0x86155875b871ebd5



SECTION .DATA_CORE15_0 DATA_VA=0xa823c000
attr_data {
    Name = .DATA_CORE15_0,
    VA = 0xa823c000,
    PA = ra2pa(0xa823c000,0),
    RA = 0xa823c000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .global data_core_15
data_core_15:
    .align  PITON_L1D_WAY_SIZE
    .xword 0xbeb375e0032a2db4
    .xword 0xc53581c0cc64ecc7
    .xword 0xde42a0e456c211b0
    .xword 0x80f1167832694e0c
    .xword 0xc0a10a2568cabae8
    .xword 0xaaaa50f0b41e58a8
    .xword 0x37d0e1e5ccfe59af
    .xword 0x37827350db676456

    .align  PITON_L1D_WAY_SIZE
    .xword 0xe690b0d79259ca33
    .xword 0x5f0a79113742754
    .xword 0xfd4b26d841b6ecc
    .xword 0xc7d39984f6900114
    .xword 0xdfe4cc4d909e4233
    .xword 0x52ae8ef91e764071
    .xword 0x869efd572cb3b2c6
    .xword 0x549cc14cbd677a95

    .align  PITON_L1D_WAY_SIZE
    .xword 0x7d3485729d84acd3
    .xword 0x69de6952703c2bd3
    .xword 0xd5ae2e20478defea
    .xword 0x6bfdd9de36e8e5a9
    .xword 0x3d6fbf4874d1b7c9
    .xword 0x5d6a87e0daa8697a
    .xword 0xf042a7f9e4a938a9
    .xword 0xcbeb29d303524020

    .align  PITON_L1D_WAY_SIZE
    .xword 0x16055437a6304deb
    .xword 0xe6909682e94d3b3c
    .xword 0x160599ea77ebbb2e
    .xword 0xe936b7696bc82f1
    .xword 0x340260e39652e90
    .xword 0xb98e2c79045f4ba3
    .xword 0x43a7cdd2ccd81f63
    .xword 0x7dbf04be5a51505c



SECTION .DATA_CORE15_1 DATA_VA=0xa823e000
attr_data {
    Name = .DATA_CORE15_1,
    VA = 0xa823e000,
    PA = ra2pa(0xa823e000,0),
    RA = 0xa823e000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x9a1d3ad36270b56a
    .xword 0x4889ae19708b5f3f
    .xword 0x124a64080549e65d
    .xword 0x3e1b1b676bc08922
    .xword 0xb0ba730a654ca52
    .xword 0x7d413503dff35333
    .xword 0x6af66b5185b86b86
    .xword 0xdf716e87d34c9b90

    .align  PITON_L1D_WAY_SIZE
    .xword 0x703b7dc6ca0fe77b
    .xword 0x2934f22467ca0628
    .xword 0x3d84538992a6d61c
    .xword 0x5ccfaa6a8f79c067
    .xword 0x2d038a5edcedab8d
    .xword 0xf7932cf3d4d98eec
    .xword 0x58f6d0b93143c242
    .xword 0x8d5075a671e26fa9

    .align  PITON_L1D_WAY_SIZE
    .xword 0x6e808c4dd00585c2
    .xword 0x9de09e7fef15b0f2
    .xword 0x5456fa4b2810e6a
    .xword 0xcecf5aa457e02f7a
    .xword 0x978b9f68a4a25cb5
    .xword 0xd3a7922019f308c0
    .xword 0x783fae9d797c83ab
    .xword 0x6f6f51eab1eb0770

    .align  PITON_L1D_WAY_SIZE
    .xword 0x40b8d5df366019f4
    .xword 0xf94c01e9828f1769
    .xword 0x4664f5f8d208e17d
    .xword 0x6bee7bf67f83de87
    .xword 0x56c9842700cbb342
    .xword 0x2a9f5edb1feb21b3
    .xword 0x95969e0e436e22a7
    .xword 0x46c39c992010c08c



SECTION .DATA_CORE16_0 DATA_VA=0xa8240000
attr_data {
    Name = .DATA_CORE16_0,
    VA = 0xa8240000,
    PA = ra2pa(0xa8240000,0),
    RA = 0xa8240000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .global data_core_16
data_core_16:
    .align  PITON_L1D_WAY_SIZE
    .xword 0xea86954001d2b37f
    .xword 0x1524fdc6936de8cb
    .xword 0xd7ea48ebb842d71
    .xword 0x8e92ba39bc3168a7
    .xword 0xb108cafe7c8d4ed0
    .xword 0x4d1e0d11b0629f53
    .xword 0xfb14a8b2f713001d
    .xword 0x92ef6d3c529c79d1

    .align  PITON_L1D_WAY_SIZE
    .xword 0x1609b5651ad36542
    .xword 0x736d27a302808422
    .xword 0x32e77642ec02e48d
    .xword 0xa27eeb2628b441a0
    .xword 0xf5ab3d34cec3bf54
    .xword 0x2e5f01ec2a9eed18
    .xword 0x8232c809b942e042
    .xword 0x759f6ab2d78e2b71

    .align  PITON_L1D_WAY_SIZE
    .xword 0x888995dc01a0cf5f
    .xword 0x91770fe790f3ccf1
    .xword 0x56f77104d6834b21
    .xword 0xe341635e54319713
    .xword 0x6821e0fc555d69c7
    .xword 0x9130b6d1ad6bc687
    .xword 0x48475ce7610ca07b
    .xword 0x7d8c9fd3dcd0c95b

    .align  PITON_L1D_WAY_SIZE
    .xword 0xe31e7fd300d154c0
    .xword 0xd7d0edd40ab9470
    .xword 0x11d75979f54eaffd
    .xword 0xe47272d58d929ade
    .xword 0xbad0c3f3ab889196
    .xword 0x6715530b168d8702
    .xword 0xd4992d350916f0f4
    .xword 0x4401d95fb29984f2



SECTION .DATA_CORE16_1 DATA_VA=0xa8242000
attr_data {
    Name = .DATA_CORE16_1,
    VA = 0xa8242000,
    PA = ra2pa(0xa8242000,0),
    RA = 0xa8242000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0xd515ad3e5b401757
    .xword 0xa182c48070c3850e
    .xword 0x6cf23f7baa0ad863
    .xword 0x47197543b3ed7d96
    .xword 0x71a0d89f4fb822e1
    .xword 0x372ccba0da278360
    .xword 0x319cada714080feb
    .xword 0x7b780683475b86d

    .align  PITON_L1D_WAY_SIZE
    .xword 0x1b9e72be497586bd
    .xword 0xb93853ff7855e1ff
    .xword 0x1cd6a3e3b7a856bd
    .xword 0xfab17e4af22de2dd
    .xword 0x3b1aa0fba9bf0be6
    .xword 0x823e57d0ef859052
    .xword 0x884d3bd1a1323cb
    .xword 0x12b7ee18b20641de

    .align  PITON_L1D_WAY_SIZE
    .xword 0xdb4720d07facc83e
    .xword 0xb33c09a3266f737e
    .xword 0xc0de5412f1721cde
    .xword 0xdb2743910d847134
    .xword 0x35bdae9c1ef79a62
    .xword 0x1930f574122e308
    .xword 0xb5f8ff252f1d6f1c
    .xword 0xba9d1225e0fc7d2

    .align  PITON_L1D_WAY_SIZE
    .xword 0x7ce84fb38c723416
    .xword 0xdf0046a504f442d3
    .xword 0xc8102f94567a4341
    .xword 0x1699a2af86a9cd3f
    .xword 0xce30d857bcf75c19
    .xword 0xe8a6fe9e09691ec1
    .xword 0x55938f05183554ff
    .xword 0x9a46219f159029ba



SECTION .DATA_CORE17_0 DATA_VA=0xa8244000
attr_data {
    Name = .DATA_CORE17_0,
    VA = 0xa8244000,
    PA = ra2pa(0xa8244000,0),
    RA = 0xa8244000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .global data_core_17
data_core_17:
    .align  PITON_L1D_WAY_SIZE
    .xword 0x3debe5b13adb30a3
    .xword 0x3e5904e6578fe53c
    .xword 0xc14e56713cb43c9b
    .xword 0x15efc8d9fb167186
    .xword 0xfd17f9893e8a9d6e
    .xword 0xfde0002c80c8c2b9
    .xword 0x320a08c360d70685
    .xword 0x93f8279af8960897

    .align  PITON_L1D_WAY_SIZE
    .xword 0xc15e7299dd73a781
    .xword 0xc1588a21097a7fdb
    .xword 0xa476318b0dc8d5ce
    .xword 0xb86976cad5f9d20
    .xword 0xa5ee39ed0ad71d00
    .xword 0x44af31cad4dec012
    .xword 0x2d05b0d4de44023e
    .xword 0xa15d08171fd7bc50

    .align  PITON_L1D_WAY_SIZE
    .xword 0x650f7aadd93ce211
    .xword 0x1f57711b7aaaf4e3
    .xword 0x625c67dd9d7fadb8
    .xword 0xab8f6589a2534ce3
    .xword 0x366343f8becc01b0
    .xword 0xe689e720526badae
    .xword 0x494b1195fa5aec7e
    .xword 0xf78b29a9872c6ae1

    .align  PITON_L1D_WAY_SIZE
    .xword 0x5432e9dca759d970
    .xword 0xed866b5a42e83251
    .xword 0x6d2f9d0aadbacd4d
    .xword 0x13d085028737351a
    .xword 0xb0306a9d1306a1c8
    .xword 0xa63b17961d40a422
    .xword 0xbf509100b201ef06
    .xword 0xb7c195317fb5e2d



SECTION .DATA_CORE17_1 DATA_VA=0xa8246000
attr_data {
    Name = .DATA_CORE17_1,
    VA = 0xa8246000,
    PA = ra2pa(0xa8246000,0),
    RA = 0xa8246000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0xce239d298ac96cd8
    .xword 0xf81e53c0b13f43aa
    .xword 0xc1dab044b65a567b
    .xword 0x365b91010d42b31a
    .xword 0x5fd7e85082284263
    .xword 0xeb37f47443a6cbc0
    .xword 0x118cc77e925bf878
    .xword 0xdc2a4b2d71ed5984

    .align  PITON_L1D_WAY_SIZE
    .xword 0x85dfad8819f1a6c7
    .xword 0xe51a5df00c942996
    .xword 0xee9ee74d6240dde
    .xword 0x9fcbda382dcc4e80
    .xword 0x305dab4249a7623d
    .xword 0x691c984d6e7f58c8
    .xword 0x5333e7fa7d58fab3
    .xword 0xc55388489a12c762

    .align  PITON_L1D_WAY_SIZE
    .xword 0x90adffbb9a3f487b
    .xword 0x52ee2ad1c8c35625
    .xword 0x52b45fae8109b04d
    .xword 0x79e80f6fd789b8ce
    .xword 0x93d4602da16736a0
    .xword 0x1eb4655fd13345fa
    .xword 0x572d136d47ee27c4
    .xword 0x4a4f7de01a62f30d

    .align  PITON_L1D_WAY_SIZE
    .xword 0xd35b0a48cd60009e
    .xword 0xd4c3da805dcd390f
    .xword 0xc1c236669fae611f
    .xword 0x8df44bd528d9d4c1
    .xword 0x42d16e9dea3b69db
    .xword 0x23577cd2f052ac0
    .xword 0x60facd801bd6fc0
    .xword 0xe91846873554a343



SECTION .DATA_CORE18_0 DATA_VA=0xa8248000
attr_data {
    Name = .DATA_CORE18_0,
    VA = 0xa8248000,
    PA = ra2pa(0xa8248000,0),
    RA = 0xa8248000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .global data_core_18
data_core_18:
    .align  PITON_L1D_WAY_SIZE
    .xword 0xa3c46370a966cf87
    .xword 0xac9e4a65ace3bb63
    .xword 0xe55409e445619e1
    .xword 0x3c65be1ea59086cc
    .xword 0xeb308d7f32c77028
    .xword 0xb6e0530eaae24bf2
    .xword 0x62e367a54db2d7bc
    .xword 0xec3b8b4efacedb90

    .align  PITON_L1D_WAY_SIZE
    .xword 0xda9c19ce329514c6
    .xword 0x65b88f64e04c80d4
    .xword 0x80f56bb657580a80
    .xword 0xbfbdf1040e8f7502
    .xword 0xbff82fddbddea3ad
    .xword 0x9ce2318d7fc595a6
    .xword 0xc16427504f5d8c84
    .xword 0x8104e341b2510652

    .align  PITON_L1D_WAY_SIZE
    .xword 0x9370a7fe1d1bbb3d
    .xword 0x4a0752f6e3313a9f
    .xword 0x13c6c86934970d5b
    .xword 0xb79dc479899439f6
    .xword 0xff646d45ac6a2673
    .xword 0x8098edda53aa71d9
    .xword 0x3a0574e806b33dea
    .xword 0x291c1931a4d58153

    .align  PITON_L1D_WAY_SIZE
    .xword 0xe6e74aa08771151c
    .xword 0xca1a2528c6bbab9e
    .xword 0x4b002dcdf4ee99a6
    .xword 0xbc30b0b4da659afc
    .xword 0x1135f653bd34b1a
    .xword 0xf3101841e0d5d57a
    .xword 0xf2389f3f88e3cdc9
    .xword 0xf19f0ba1bf1c12ec



SECTION .DATA_CORE18_1 DATA_VA=0xa824a000
attr_data {
    Name = .DATA_CORE18_1,
    VA = 0xa824a000,
    PA = ra2pa(0xa824a000,0),
    RA = 0xa824a000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x8129b8d9c2edd94d
    .xword 0xd38ddbb96a84167f
    .xword 0xadfd121be308073f
    .xword 0x209846c956012dcf
    .xword 0xd51ec427f3925f45
    .xword 0x766168104d6043ac
    .xword 0xf12dc986fc5543cc
    .xword 0xde14bb8a1910089d

    .align  PITON_L1D_WAY_SIZE
    .xword 0x19fbfb36c5a78031
    .xword 0x99a6c8c782b08f55
    .xword 0xfd3640d156cab2bc
    .xword 0x63f7157356cdc02a
    .xword 0xe8380f442252a3d
    .xword 0xa02fbb5da53f0b38
    .xword 0x8dbc04cd486d6267
    .xword 0xb3e374cdc1ae89b

    .align  PITON_L1D_WAY_SIZE
    .xword 0xce30bb74df31fb58
    .xword 0xc107e211ce289131
    .xword 0x5612de82338b7ee3
    .xword 0xdb9c1832ff426f01
    .xword 0x6fec7f5fa88a971a
    .xword 0x46a4a7f6cbf3070a
    .xword 0x4b0ed4a304789bb3
    .xword 0x5d4fff7aeed758cc

    .align  PITON_L1D_WAY_SIZE
    .xword 0xf62546426f218cc8
    .xword 0xccb6ca62c37a08b6
    .xword 0x4d36db63cd584f62
    .xword 0x5c038c36d82c4f6c
    .xword 0x3f4151c3de74dab1
    .xword 0xa84278e2f9b7922b
    .xword 0x79468da1038a5043
    .xword 0x5293d7e05c61f8e1



SECTION .DATA_CORE19_0 DATA_VA=0xa824c000
attr_data {
    Name = .DATA_CORE19_0,
    VA = 0xa824c000,
    PA = ra2pa(0xa824c000,0),
    RA = 0xa824c000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .global data_core_19
data_core_19:
    .align  PITON_L1D_WAY_SIZE
    .xword 0xd0556a3e312b529c
    .xword 0x3573694b3f80b671
    .xword 0x3675ce1c5552df3c
    .xword 0x39515db8693c19c2
    .xword 0x44d22cdbf7bc8df2
    .xword 0x2a338d9d92183814
    .xword 0x8c990b91bf979a4
    .xword 0xfd15ec000cff4c21

    .align  PITON_L1D_WAY_SIZE
    .xword 0x4e5c9dce8a415e59
    .xword 0x55449810aacaa212
    .xword 0x1b1e2dc0c0b851
    .xword 0x374fb686141f8a65
    .xword 0x345529213c2cb11b
    .xword 0xb2c6375ca6556aca
    .xword 0xb50a03a25761d6c5
    .xword 0x91016e9e593700c

    .align  PITON_L1D_WAY_SIZE
    .xword 0x2e50c0d8be34ddc5
    .xword 0xbd8b749fc87a7342
    .xword 0x558d9e5894bdadf1
    .xword 0x5a5df5cbf292180f
    .xword 0x9a703802920e9803
    .xword 0x8fb6064ca003ed91
    .xword 0x14ab70553294a9e3
    .xword 0xfffc939adbec67b4

    .align  PITON_L1D_WAY_SIZE
    .xword 0x18782f77569a6f32
    .xword 0x510a0c88a0ca68d9
    .xword 0x733d4c82db0e4d80
    .xword 0x6ba423d994b680d
    .xword 0xd8b3d0aa2d910b5e
    .xword 0x1b54bfa1a9ba9362
    .xword 0x3536e27023f7715
    .xword 0x8a9465e1c97ffd5c



SECTION .DATA_CORE19_1 DATA_VA=0xa824e000
attr_data {
    Name = .DATA_CORE19_1,
    VA = 0xa824e000,
    PA = ra2pa(0xa824e000,0),
    RA = 0xa824e000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0xae37b1a5c5edcd50
    .xword 0x92327b79749223c0
    .xword 0x422b319abb3bfeae
    .xword 0x5b6d593e4a28aba0
    .xword 0x9bfab33c03324304
    .xword 0xa146f8084c7935c3
    .xword 0x710b29bbb914706d
    .xword 0x53ba3f33bb5734c7

    .align  PITON_L1D_WAY_SIZE
    .xword 0x88f168fb81658ffa
    .xword 0x595b8ca03ad9a755
    .xword 0x23aad94584a8d6f
    .xword 0xf4863d70fe05745c
    .xword 0xa2b8e8cd8515400a
    .xword 0xc7c4d5b08b701c8e
    .xword 0xb0005914f2c9f8ee
    .xword 0x31cb7fa212f6b52d

    .align  PITON_L1D_WAY_SIZE
    .xword 0xad57f3c796f7119
    .xword 0x309be09bc195f30e
    .xword 0x719307e26e6f9101
    .xword 0x4f9163609eb87bd7
    .xword 0xec541b7f87e94e4b
    .xword 0x1aa6f1328402eae5
    .xword 0x82a7d2a8cb24d7b2
    .xword 0x6c4a34ca722f6fa7

    .align  PITON_L1D_WAY_SIZE
    .xword 0x80aa8f1e23ce509b
    .xword 0xe4146293675ff5c3
    .xword 0x3cb4587a142b24cc
    .xword 0xbeaab37b3749cc5
    .xword 0xe24c671f6aedb8d9
    .xword 0xeeba08529f94ae98
    .xword 0xe846604fefbb802
    .xword 0x76013a2d9d7ea40f



SECTION .DATA_CORE20_0 DATA_VA=0xa8250000
attr_data {
    Name = .DATA_CORE20_0,
    VA = 0xa8250000,
    PA = ra2pa(0xa8250000,0),
    RA = 0xa8250000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .global data_core_20
data_core_20:
    .align  PITON_L1D_WAY_SIZE
    .xword 0xe930de544c3e1831
    .xword 0xff8b61c7054f03fe
    .xword 0x46a994a37b276ed3
    .xword 0x2fc675078ff546
    .xword 0x4831c47d987ac41
    .xword 0x2a9e56691d51b760
    .xword 0x693f86a1cc0db4a2
    .xword 0x881bb83c34b5c877

    .align  PITON_L1D_WAY_SIZE
    .xword 0xb6d754ab45c6c3e1
    .xword 0x26c32a5c7658b4b5
    .xword 0x9d7a584deac21efd
    .xword 0xc1cce43fbe847d8b
    .xword 0x3eb5c0d2e9b4cc8a
    .xword 0xdcddaeccca8539cc
    .xword 0x8733ef18fe4a8a8a
    .xword 0xe35aea8580e4904

    .align  PITON_L1D_WAY_SIZE
    .xword 0x5e08ead260cb2c6
    .xword 0xaca2ff8dfc1bd5e2
    .xword 0x7548fb039c955b5b
    .xword 0x25820e53cf2d3c6e
    .xword 0xd6a722475b873803
    .xword 0xd8bf6abd7610f0c1
    .xword 0xda1c1fc6ad6da529
    .xword 0xcc30c3247870b448

    .align  PITON_L1D_WAY_SIZE
    .xword 0xe6b5ce773b04ab3a
    .xword 0xf1b3094196d252b4
    .xword 0xc6ff4a5541ad282e
    .xword 0x5ee87d7d26972b47
    .xword 0x8e3cfce9a391ccf0
    .xword 0xd35916f7a1b2d6dc
    .xword 0xf96db9c13113bd0d
    .xword 0x8849d0f0acc7edee



SECTION .DATA_CORE20_1 DATA_VA=0xa8252000
attr_data {
    Name = .DATA_CORE20_1,
    VA = 0xa8252000,
    PA = ra2pa(0xa8252000,0),
    RA = 0xa8252000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x8e5935ef359c079a
    .xword 0x5c3fd2d20c5d95fa
    .xword 0x99e719e079607d0c
    .xword 0x635c344caa3b79cc
    .xword 0x126c16b9d9218f19
    .xword 0xe2049d94d2f4f824
    .xword 0x8a31ae95c018c2a6
    .xword 0xfd347c52cb216e4d

    .align  PITON_L1D_WAY_SIZE
    .xword 0x87b87a616857f1ac
    .xword 0x65527a223ac0c0c2
    .xword 0x2e7e078cf5bd01bf
    .xword 0x4b3a93665ff02fd8
    .xword 0xecaacb4be7de6638
    .xword 0xb71a2e78179ee2fb
    .xword 0xb7b679609c537cef
    .xword 0xd69349998743db8e

    .align  PITON_L1D_WAY_SIZE
    .xword 0x1b176e6f68710344
    .xword 0x4cf2f232e61950c0
    .xword 0xf205bd9a00a2fe45
    .xword 0x167b0bf8f0fd0330
    .xword 0xa0dc4d06a57e734a
    .xword 0x700766c767c0f9e8
    .xword 0xf5389c3f6ca2b209
    .xword 0x9112d16a6bdb7912

    .align  PITON_L1D_WAY_SIZE
    .xword 0xdb932024435ca58b
    .xword 0x83c79c4c14a84a3b
    .xword 0x3994e5b5644fe841
    .xword 0xeb162cf161a9cbb8
    .xword 0xc23e4d2a12aa1301
    .xword 0x10f6df1e1d6b0fdb
    .xword 0xeef6e3d2624d2968
    .xword 0x3421bb94aae88518



SECTION .DATA_CORE21_0 DATA_VA=0xa8254000
attr_data {
    Name = .DATA_CORE21_0,
    VA = 0xa8254000,
    PA = ra2pa(0xa8254000,0),
    RA = 0xa8254000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .global data_core_21
data_core_21:
    .align  PITON_L1D_WAY_SIZE
    .xword 0x566cb4463cbed9f6
    .xword 0x9634d5b4ee21e187
    .xword 0xd9f2afdef66a9c67
    .xword 0x870d4104b9eb2e68
    .xword 0xa558255039710b94
    .xword 0xecff2a11e268622a
    .xword 0x14e27a493883ee49
    .xword 0xdcfcf7732252d934

    .align  PITON_L1D_WAY_SIZE
    .xword 0x8c0cf39f9646d0f9
    .xword 0x9c0511db0902d5fa
    .xword 0xe575b7141e06ba41
    .xword 0xa1fff68e3f74bada
    .xword 0xfbc277a3c76dc822
    .xword 0x58ee1f2eaa101af6
    .xword 0xb973d921c0f0118f
    .xword 0xe525dc9af7411593

    .align  PITON_L1D_WAY_SIZE
    .xword 0x6907716dab680a6c
    .xword 0xf622d1991283026e
    .xword 0xe081b86c22d96e1b
    .xword 0x13f3a8c090dcb8fc
    .xword 0x52291cc3bc089097
    .xword 0xb6daf7da43f00c58
    .xword 0xc76b08fdd994351a
    .xword 0x80d3e1578a68909b

    .align  PITON_L1D_WAY_SIZE
    .xword 0x62d26114accba98b
    .xword 0x5c244e5d7c42fb9f
    .xword 0x5f65286cde4898de
    .xword 0x740150551d41e575
    .xword 0xfea23923450f405e
    .xword 0xc55b4bffa3711e11
    .xword 0x2748fa567e1c364a
    .xword 0xe8055e48d1986913



SECTION .DATA_CORE21_1 DATA_VA=0xa8256000
attr_data {
    Name = .DATA_CORE21_1,
    VA = 0xa8256000,
    PA = ra2pa(0xa8256000,0),
    RA = 0xa8256000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0xc3a578da84948dea
    .xword 0x91956fee8d76735c
    .xword 0xce4068cd3d6b824d
    .xword 0xfc6f43197e4f9438
    .xword 0xe4bdeace5d3cba38
    .xword 0x8a317eb25b3f2e59
    .xword 0x4f12c7b8120c6220
    .xword 0xa611a567abf1939d

    .align  PITON_L1D_WAY_SIZE
    .xword 0xc3ce2a888458febd
    .xword 0x27dafef45db7c6d4
    .xword 0x39ff14f92ab9c57b
    .xword 0x75eea0bc2b0d7ee8
    .xword 0x41afea135e9b6705
    .xword 0x82055fe053755b26
    .xword 0x8d44b0246d29650c
    .xword 0x7b4291d22a2ff19a

    .align  PITON_L1D_WAY_SIZE
    .xword 0xfbaf001504362d11
    .xword 0xaea486263eb77d47
    .xword 0x37f7bc15aa50e80
    .xword 0xfcf678101b3b35e2
    .xword 0xaec1297a991dea69
    .xword 0x18e8d1eb601c9799
    .xword 0x892ad17cc7d22d81
    .xword 0x1a0f5597df7990e1

    .align  PITON_L1D_WAY_SIZE
    .xword 0xa03668a4539ff53d
    .xword 0x40683bc2dda92373
    .xword 0x48bf115de0472c56
    .xword 0xa5ab9f0debe2ca98
    .xword 0x565ec2c471cfc70c
    .xword 0x63e8e1d1543fd942
    .xword 0xfeb57d1ed049e486
    .xword 0xd861e38cfbc85614



SECTION .DATA_CORE22_0 DATA_VA=0xa8258000
attr_data {
    Name = .DATA_CORE22_0,
    VA = 0xa8258000,
    PA = ra2pa(0xa8258000,0),
    RA = 0xa8258000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .global data_core_22
data_core_22:
    .align  PITON_L1D_WAY_SIZE
    .xword 0xd40ba29983d26222
    .xword 0x2bbeb2b32daf5364
    .xword 0x555ed1f1209cf56c
    .xword 0x41447d8cc49c791c
    .xword 0x7ddff415a2c7ad8e
    .xword 0x5dd000b523271aa8
    .xword 0x500dab163840cbc7
    .xword 0x305ecb857019b53b

    .align  PITON_L1D_WAY_SIZE
    .xword 0x2997dcfc999fdb45
    .xword 0x14751a2fbd296722
    .xword 0x1082debcb394b276
    .xword 0xeda4bf54f80df088
    .xword 0x1dcd8fa799b5cde1
    .xword 0x7b59ebf2aad0a252
    .xword 0xea8feb7c083c343f
    .xword 0x2a7025d386939ac8

    .align  PITON_L1D_WAY_SIZE
    .xword 0x287c79eb42306155
    .xword 0x899c4aaa74f7ef81
    .xword 0xcb5458805afeb58a
    .xword 0x1803f769e9aaf5ac
    .xword 0x8c13b0ac4c905963
    .xword 0xab914deeaf352c28
    .xword 0xc2d4809eb11101d6
    .xword 0x11701dfe3ab4649f

    .align  PITON_L1D_WAY_SIZE
    .xword 0x75f59016e9464f46
    .xword 0xc94719c08420f0d2
    .xword 0xc1963b5d7a16e403
    .xword 0x9f33edbd9044057d
    .xword 0x4b31796748e44d65
    .xword 0xb540791782541c66
    .xword 0xfcdff10308fef944
    .xword 0xb7981e438d212797



SECTION .DATA_CORE22_1 DATA_VA=0xa825a000
attr_data {
    Name = .DATA_CORE22_1,
    VA = 0xa825a000,
    PA = ra2pa(0xa825a000,0),
    RA = 0xa825a000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x3db95a74150ebcbb
    .xword 0x1e09ac264ae45888
    .xword 0xc4b1221aff2f66f3
    .xword 0xa86b15de9f743078
    .xword 0x130ea07767340f67
    .xword 0x7810c693c3fc8f27
    .xword 0x7fbda1943786695b
    .xword 0x7fc13e9ff699ee37

    .align  PITON_L1D_WAY_SIZE
    .xword 0xbafb3350f9fa3ea1
    .xword 0xca84fdaf6ecb2bfb
    .xword 0x1b0eba9ff7934768
    .xword 0x5831959ea7fa2e4a
    .xword 0xe312a90e44c5426f
    .xword 0x8811f2a0573395c2
    .xword 0xe6e54774bfc3ae3b
    .xword 0x5da5e39a2e59b449

    .align  PITON_L1D_WAY_SIZE
    .xword 0x79c15c76d30da70b
    .xword 0x27c54555c3f6cfc1
    .xword 0x4657adb68eb8a2de
    .xword 0xeedd075be5d10c4a
    .xword 0x5372a80626f0ff30
    .xword 0x5730f001e18a713d
    .xword 0xa4faa697497ebe62
    .xword 0x7636d0536a41790

    .align  PITON_L1D_WAY_SIZE
    .xword 0xe28f7624598c28d8
    .xword 0x7e3f7c8139694106
    .xword 0x245b7c6ba7174583
    .xword 0xf752dbc8ea9769a8
    .xword 0x5d0d142ec0124ffd
    .xword 0x6fe4d1ff8acf5fb4
    .xword 0x67a91f51911d8695
    .xword 0x7be083598fa4f2f3



SECTION .DATA_CORE23_0 DATA_VA=0xa825c000
attr_data {
    Name = .DATA_CORE23_0,
    VA = 0xa825c000,
    PA = ra2pa(0xa825c000,0),
    RA = 0xa825c000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .global data_core_23
data_core_23:
    .align  PITON_L1D_WAY_SIZE
    .xword 0xd2d72bdbd08fa198
    .xword 0x9aa424c6c8fe0f1b
    .xword 0xf99f68d217137bf9
    .xword 0x3d5cf98522b8d6f4
    .xword 0xb090d29af9a81ceb
    .xword 0x1bdeeb143062a4b3
    .xword 0x265584f6bf2eb9ef
    .xword 0x6515cd74f06063e9

    .align  PITON_L1D_WAY_SIZE
    .xword 0x32a6fdae6ca67743
    .xword 0x68b5267d9a246292
    .xword 0xefc2cbf580f14c6d
    .xword 0xf21b229564060282
    .xword 0x699773da34ab72f8
    .xword 0xcb43a551b770f46b
    .xword 0xcf8fec6a47349035
    .xword 0xeedf9dd2ff93c7ac

    .align  PITON_L1D_WAY_SIZE
    .xword 0xf878d1409854735f
    .xword 0xf50976fdf9b96af5
    .xword 0x20f0be5f344bc625
    .xword 0x4c9dc4fdca59ed0f
    .xword 0xc3d5a94c4f3f6cf2
    .xword 0x3045559b4b92739d
    .xword 0x499f157c8d523b2c
    .xword 0x169d1e4f2f1cf07b

    .align  PITON_L1D_WAY_SIZE
    .xword 0x346ff73a5ff92c64
    .xword 0xb495c4596484151d
    .xword 0x6b089237d2327ab7
    .xword 0xbc1512b67ebfeab7
    .xword 0x2db200ea5d954c80
    .xword 0xe58fec71995745ab
    .xword 0x93b43121dd64e00d
    .xword 0x4d884577fadea628



SECTION .DATA_CORE23_1 DATA_VA=0xa825e000
attr_data {
    Name = .DATA_CORE23_1,
    VA = 0xa825e000,
    PA = ra2pa(0xa825e000,0),
    RA = 0xa825e000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0xa316692bbea123ac
    .xword 0xdc08278f07cc690a
    .xword 0x39f01d2b732fd83e
    .xword 0x2dcae449f06ba4a5
    .xword 0xc16e57211c7f3aa6
    .xword 0x507140dbb0a60704
    .xword 0xbc5ac55855ee1556
    .xword 0x64aff1a84305aafe

    .align  PITON_L1D_WAY_SIZE
    .xword 0x499732e946037f2e
    .xword 0xd5038cc0c627e798
    .xword 0xd9a6cf1aa1157298
    .xword 0x31a3ea92ea81154b
    .xword 0x656790224ce0e323
    .xword 0xf4262066c188d0a2
    .xword 0x31161259f9ffa542
    .xword 0x5b7c8f4b757cae02

    .align  PITON_L1D_WAY_SIZE
    .xword 0xbc9ed52594197e49
    .xword 0xca049fe413c8e3a4
    .xword 0x2865a82828e9a65d
    .xword 0xc3ac7b958e270375
    .xword 0x66d462d728b24c4
    .xword 0x16ae8ca1ac62f8fd
    .xword 0xad06b62dac272b5b
    .xword 0x7d07941f87747127

    .align  PITON_L1D_WAY_SIZE
    .xword 0x4a94d0c45436e0f9
    .xword 0xf2703473c0ed5df6
    .xword 0x66732d17edea1fd2
    .xword 0x7eb969295c1d7d0e
    .xword 0xe9a2126f1586a8e7
    .xword 0xccf8ecc17b19640a
    .xword 0x70f64b307b24b539
    .xword 0x7b36ed2ee8819baf



SECTION .DATA_CORE24_0 DATA_VA=0xa8260000
attr_data {
    Name = .DATA_CORE24_0,
    VA = 0xa8260000,
    PA = ra2pa(0xa8260000,0),
    RA = 0xa8260000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .global data_core_24
data_core_24:
    .align  PITON_L1D_WAY_SIZE
    .xword 0x86c509d9bb2cc802
    .xword 0xee3d47c3a3d205c6
    .xword 0x97d9dc6e0d0610f1
    .xword 0xaf033d9b9630bbb3
    .xword 0x295b9b8c84ceed0e
    .xword 0x9c7dca34763ce4bc
    .xword 0xdb6ba38698090cd0
    .xword 0x67a7e851ba8d234a

    .align  PITON_L1D_WAY_SIZE
    .xword 0x64891a12e3dab4ae
    .xword 0x2125e23e1cb7c04a
    .xword 0x3b3b2d2c05e5902f
    .xword 0xcae7d0ef8e45750d
    .xword 0x7d4a46c632b1dbe1
    .xword 0x27d59a6cfe38ee94
    .xword 0x91d0523036bf1ef
    .xword 0xa2483f045bb29a5d

    .align  PITON_L1D_WAY_SIZE
    .xword 0x3341667b62d0675d
    .xword 0xa6582c6f2f1499f6
    .xword 0x76960481391a01cb
    .xword 0x18780514860a5d10
    .xword 0x8ea6bd875ee466a0
    .xword 0x3644c423ec31c316
    .xword 0x7fa13dce55aae6c3
    .xword 0xa6f7293fa6765ffc

    .align  PITON_L1D_WAY_SIZE
    .xword 0xd8a446b68f4aad2f
    .xword 0x815dae65c0e80e5a
    .xword 0x5a0596badbf9a406
    .xword 0xcfd28fdcbbb5d5
    .xword 0xb887940d9365a37f
    .xword 0x41224dd1d1d3c701
    .xword 0x2a8187683e5b668b
    .xword 0x8b92fc5aff63a423



SECTION .DATA_CORE24_1 DATA_VA=0xa8262000
attr_data {
    Name = .DATA_CORE24_1,
    VA = 0xa8262000,
    PA = ra2pa(0xa8262000,0),
    RA = 0xa8262000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x3cc5fc1dda951137
    .xword 0x220d5dd13d108d07
    .xword 0x2a04b7e115ce939d
    .xword 0xce706ac573cb3f65
    .xword 0x809699a80b3c8c5c
    .xword 0xdc685fbf9b90bba8
    .xword 0xfebf01392eb161c3
    .xword 0x448a1d9647ba0c73

    .align  PITON_L1D_WAY_SIZE
    .xword 0xb48cb5c4f9047ac5
    .xword 0xddabdcd6d4668af2
    .xword 0xdf4c444d4fb295ff
    .xword 0xd5230dcf24abfec6
    .xword 0xda76a04704a842b7
    .xword 0x2b382c61950200a1
    .xword 0x2c6d91289e9a609d
    .xword 0x8d8a99293921fa12

    .align  PITON_L1D_WAY_SIZE
    .xword 0xb674285e59a6b357
    .xword 0xb5a3ba10c99af304
    .xword 0xb36bd77dab1d3841
    .xword 0x74efe0b41ba60722
    .xword 0xb845bbee6ff31950
    .xword 0x276f00eb167f7d4
    .xword 0xec1e79cb8989b9a5
    .xword 0x21cc6532de8bfc8b

    .align  PITON_L1D_WAY_SIZE
    .xword 0x4e863401f0d3cf7e
    .xword 0x7bcb2d04480e1ecc
    .xword 0x71668d56987046e7
    .xword 0xc839f38ee7e00b5
    .xword 0x7ea4ddaecad2efe2
    .xword 0xd6cd7c3b4f1eda9b
    .xword 0xdcb395fb85380e48
    .xword 0x196c52ebf41d2f49



