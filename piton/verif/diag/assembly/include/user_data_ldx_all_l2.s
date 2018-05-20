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

SECTION .DATA_CORE0_0 DATA_VA=0xa8020000
attr_data {
    Name = .DATA_CORE0_0,
    VA = 0xa8020000,
    PA = ra2pa(0xa8020000,0),
    RA = 0xa8020000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .global data_core_0
data_core_0:
    .align  PITON_L1D_WAY_SIZE
    .xword 0xa3a2f417a09391aa
    .xword 0xa9574b89933edce2
    .xword 0x93e1a48c324d9b7c
    .xword 0x8ef2e6cbcb4cb09a
    .xword 0x5c1dc4514b7b258c
    .xword 0x8625ffe99692b0be
    .xword 0xdf75ce529c6c3d0a
    .xword 0xf2078caf83a0fba1



SECTION .DATA_CORE0_1 DATA_VA=0xa8022000
attr_data {
    Name = .DATA_CORE0_1,
    VA = 0xa8022000,
    PA = ra2pa(0xa8022000,0),
    RA = 0xa8022000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0xab7a203f657ba36a
    .xword 0xa95a4cf1e74b89b6
    .xword 0x4d585ce0e59184c6
    .xword 0x37e3953214f4b108
    .xword 0xab37845fadfb6075
    .xword 0xbfc7012dcec95ec
    .xword 0x39ed4de62f5f96b2
    .xword 0xc4361080f4146b7b



SECTION .DATA_CORE0_2 DATA_VA=0xa8024000
attr_data {
    Name = .DATA_CORE0_2,
    VA = 0xa8024000,
    PA = ra2pa(0xa8024000,0),
    RA = 0xa8024000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x6d22b82839b7c638
    .xword 0x2c34f3faa710c634
    .xword 0x4b30f3bc4523ffe6
    .xword 0x1fcdc31de5ca7cb7
    .xword 0x421b6da12fdfec1e
    .xword 0x4e74f561e66f37c9
    .xword 0xc929900e484451d
    .xword 0x1e1982452860cfa4



SECTION .DATA_CORE0_3 DATA_VA=0xa8026000
attr_data {
    Name = .DATA_CORE0_3,
    VA = 0xa8026000,
    PA = ra2pa(0xa8026000,0),
    RA = 0xa8026000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x5eb690a1dcfab1b3
    .xword 0xed0951e46fb2be71
    .xword 0x48a44cf0552bfb43
    .xword 0x8295a320b85e83bf
    .xword 0x92c7a93661b731f4
    .xword 0x89aac522528f10ea
    .xword 0x1b51086f4fc4d566
    .xword 0x96d835280722d4e8



SECTION .DATA_CORE0_4 DATA_VA=0xa8028000
attr_data {
    Name = .DATA_CORE0_4,
    VA = 0xa8028000,
    PA = ra2pa(0xa8028000,0),
    RA = 0xa8028000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x56f460661ee8437
    .xword 0x2ae125e624caba56
    .xword 0x490e49c82db7c039
    .xword 0x8fa4e3270827c9d2
    .xword 0x1b279cddd32d5b3b
    .xword 0xd88566ae51a6bd78
    .xword 0x34c4e5e1c9d5aad0
    .xword 0xffcbd60801b30e39



SECTION .DATA_CORE0_5 DATA_VA=0xa802a000
attr_data {
    Name = .DATA_CORE0_5,
    VA = 0xa802a000,
    PA = ra2pa(0xa802a000,0),
    RA = 0xa802a000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0xf9d5b3b5291d49f4
    .xword 0xd6026f7cc5cfa49
    .xword 0xba9a1ff22a43f76c
    .xword 0x73d5d2843605c0d0
    .xword 0x7f6b61f4d85f3672
    .xword 0x5caad28b49949f4b
    .xword 0x9cfd117689a8a1b8
    .xword 0x34d4eeab32488fea



SECTION .DATA_CORE0_6 DATA_VA=0xa802c000
attr_data {
    Name = .DATA_CORE0_6,
    VA = 0xa802c000,
    PA = ra2pa(0xa802c000,0),
    RA = 0xa802c000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x3dbbf1a6b8f2f9a1
    .xword 0xf4288bb8ef4d773a
    .xword 0xa1d252338ea8028d
    .xword 0x200e813dcf1e8800
    .xword 0x8f04a50ca6476bd8
    .xword 0x1e929057a007c1af
    .xword 0xbac2bc1afca3afc7
    .xword 0x54a15fdc1a415bd3



SECTION .DATA_CORE0_7 DATA_VA=0xa802e000
attr_data {
    Name = .DATA_CORE0_7,
    VA = 0xa802e000,
    PA = ra2pa(0xa802e000,0),
    RA = 0xa802e000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x8dc936215103e828
    .xword 0x650a92eb1ee11e2e
    .xword 0xbdb8577c98a83644
    .xword 0x1310539d7f86cc55
    .xword 0x60d272ae336a364e
    .xword 0xa570b860a1d8710d
    .xword 0x7290ee04116fc36f
    .xword 0x1eda4eaf1b53e36a



SECTION .DATA_CORE1_0 DATA_VA=0xa8030000
attr_data {
    Name = .DATA_CORE1_0,
    VA = 0xa8030000,
    PA = ra2pa(0xa8030000,0),
    RA = 0xa8030000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .global data_core_1
data_core_1:
    .align  PITON_L1D_WAY_SIZE
    .xword 0xe444bba0bb6226ea
    .xword 0xb7b5979a1d28295b
    .xword 0x1541bd29c5de35ca
    .xword 0xa41ebabbe57af54f
    .xword 0xd8c857a7f827b9c6
    .xword 0xa531e960c7b14442
    .xword 0x3531eaa4999392a8
    .xword 0x5f51d499be858360



SECTION .DATA_CORE1_1 DATA_VA=0xa8032000
attr_data {
    Name = .DATA_CORE1_1,
    VA = 0xa8032000,
    PA = ra2pa(0xa8032000,0),
    RA = 0xa8032000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x5942f47128b9b384
    .xword 0x6153615fa4badc15
    .xword 0x4d016bf657cdb234
    .xword 0xdfde85a959a43c0d
    .xword 0x16cf231ec7c90785
    .xword 0xb9b0b3cbe7e7e56a
    .xword 0x6fdb37ce68d695a
    .xword 0xc839005c939ade17



SECTION .DATA_CORE1_2 DATA_VA=0xa8034000
attr_data {
    Name = .DATA_CORE1_2,
    VA = 0xa8034000,
    PA = ra2pa(0xa8034000,0),
    RA = 0xa8034000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0xae28eae4aa77dc1b
    .xword 0x2ee2296e412724fc
    .xword 0xba5ded0d0bb06e25
    .xword 0x6466349eee0228ee
    .xword 0xdd23070e74061ecf
    .xword 0x12f769600bbc9ca3
    .xword 0x54c22d2600c1591c
    .xword 0xcb6301d7ee193bb5



SECTION .DATA_CORE1_3 DATA_VA=0xa8036000
attr_data {
    Name = .DATA_CORE1_3,
    VA = 0xa8036000,
    PA = ra2pa(0xa8036000,0),
    RA = 0xa8036000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x5638be875424cece
    .xword 0xf39764f215b1f4f9
    .xword 0xae0cd2024f01ae23
    .xword 0x62b894d731598eb8
    .xword 0xd3b23a35977af191
    .xword 0x8110fe2d802b5ecf
    .xword 0x75a5205084a98c2c
    .xword 0xc5b9ac79ef11baf5



SECTION .DATA_CORE1_4 DATA_VA=0xa8038000
attr_data {
    Name = .DATA_CORE1_4,
    VA = 0xa8038000,
    PA = ra2pa(0xa8038000,0),
    RA = 0xa8038000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x545c08aab6ff9638
    .xword 0xfc0203497de69605
    .xword 0x1d56ae1cdc4c6583
    .xword 0x3117fc21f950ade5
    .xword 0x4ffab8150cd59c8e
    .xword 0x702ab7566cd07027
    .xword 0xabfe7bd90b0e8801
    .xword 0xd0f9e75ad3931ef8



SECTION .DATA_CORE1_5 DATA_VA=0xa803a000
attr_data {
    Name = .DATA_CORE1_5,
    VA = 0xa803a000,
    PA = ra2pa(0xa803a000,0),
    RA = 0xa803a000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0xc7e8d04ae44262d3
    .xword 0x2b625f388b66236a
    .xword 0xc6b91dfb2ec23c8b
    .xword 0x5d581a713d446b6a
    .xword 0x46b3a372debef6cb
    .xword 0xd44f9e6d7bc2899c
    .xword 0x5858819a394cd9fd
    .xword 0xc71d097d870024a6



SECTION .DATA_CORE1_6 DATA_VA=0xa803c000
attr_data {
    Name = .DATA_CORE1_6,
    VA = 0xa803c000,
    PA = ra2pa(0xa803c000,0),
    RA = 0xa803c000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0xf7b9e36cb8aee9a3
    .xword 0x728dbe3866c23e5f
    .xword 0xa21fcf4d5c082ce0
    .xword 0xd112bc7c6fcf31ee
    .xword 0x57d24f414abcc80d
    .xword 0xbcf834825f478377
    .xword 0x561bc569adb5f7bf
    .xword 0x826e380f77968998



SECTION .DATA_CORE1_7 DATA_VA=0xa803e000
attr_data {
    Name = .DATA_CORE1_7,
    VA = 0xa803e000,
    PA = ra2pa(0xa803e000,0),
    RA = 0xa803e000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0xc481df9b6a33b904
    .xword 0x9f2fa52b3216aed1
    .xword 0x7f1b09b5d0360fe6
    .xword 0x985737c95dcabefd
    .xword 0x4b6a5b514ade92d2
    .xword 0xe93666eade474e92
    .xword 0xfc64ace823c3bfd2
    .xword 0x564d570b5c23b28a



SECTION .DATA_CORE2_0 DATA_VA=0xa8040000
attr_data {
    Name = .DATA_CORE2_0,
    VA = 0xa8040000,
    PA = ra2pa(0xa8040000,0),
    RA = 0xa8040000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .global data_core_2
data_core_2:
    .align  PITON_L1D_WAY_SIZE
    .xword 0xb5b47e7f79f484c3
    .xword 0xb1a4609f1898679f
    .xword 0xd476f998fa00375d
    .xword 0xb48e16bcc35fd350
    .xword 0x6a734cb814185076
    .xword 0x6907a71a9c556b70
    .xword 0x65fd9c503b45fb0c
    .xword 0xd73a165c283f9238



SECTION .DATA_CORE2_1 DATA_VA=0xa8042000
attr_data {
    Name = .DATA_CORE2_1,
    VA = 0xa8042000,
    PA = ra2pa(0xa8042000,0),
    RA = 0xa8042000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0xa74e7715ad87a978
    .xword 0x34b5787a004d8a54
    .xword 0x9d009569d7cef696
    .xword 0xb220b0fcdd8f1f45
    .xword 0x900c6811aae969a
    .xword 0x9745a381d61ccbfe
    .xword 0xae06a05a9303bd7d
    .xword 0xa0d99f4171381b1b



SECTION .DATA_CORE2_2 DATA_VA=0xa8044000
attr_data {
    Name = .DATA_CORE2_2,
    VA = 0xa8044000,
    PA = ra2pa(0xa8044000,0),
    RA = 0xa8044000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x45ed8822c9d0205e
    .xword 0x51e18db669df6f91
    .xword 0x6441e894358480e2
    .xword 0xdc603ab02cda66c9
    .xword 0x8aade6cf4ec20c1f
    .xword 0x414660d478d595f9
    .xword 0x94dfbb9e3d9cba8b
    .xword 0x1ff1108b4c20d556



SECTION .DATA_CORE2_3 DATA_VA=0xa8046000
attr_data {
    Name = .DATA_CORE2_3,
    VA = 0xa8046000,
    PA = ra2pa(0xa8046000,0),
    RA = 0xa8046000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0xac9706ed469324f7
    .xword 0xce5e8440737867e9
    .xword 0x94905aeb8258fc43
    .xword 0x9c4b173c797beb0a
    .xword 0x3581b2c1dd561200
    .xword 0x9f5e867df1342b21
    .xword 0xf313121fd78fde1e
    .xword 0xd2f502ddbb1e5ad1



SECTION .DATA_CORE2_4 DATA_VA=0xa8048000
attr_data {
    Name = .DATA_CORE2_4,
    VA = 0xa8048000,
    PA = ra2pa(0xa8048000,0),
    RA = 0xa8048000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0xdc04b4bf1f7a8ad1
    .xword 0x58d91829e06b1035
    .xword 0xbd2b89660592e225
    .xword 0xef1d282d11f7c944
    .xword 0x2983be4de434f8bb
    .xword 0x4f804cc4c34b4744
    .xword 0x70fe372d077dc7c1
    .xword 0x1e62cc45741e17f5



SECTION .DATA_CORE2_5 DATA_VA=0xa804a000
attr_data {
    Name = .DATA_CORE2_5,
    VA = 0xa804a000,
    PA = ra2pa(0xa804a000,0),
    RA = 0xa804a000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x636dd441f72de1db
    .xword 0xd24b6c24a44de1f8
    .xword 0xed544a39ca45bad3
    .xword 0xf6b2078ac3ab62ce
    .xword 0xbc6167309472178f
    .xword 0x54d79b587172c906
    .xword 0xb634e8828794e61a
    .xword 0x1b2cf4006628ad8f



SECTION .DATA_CORE2_6 DATA_VA=0xa804c000
attr_data {
    Name = .DATA_CORE2_6,
    VA = 0xa804c000,
    PA = ra2pa(0xa804c000,0),
    RA = 0xa804c000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x749d16625899d5d6
    .xword 0xd2ca4a4246bf0e5b
    .xword 0xe4f7527ad4af8f5f
    .xword 0x2d29e66ea65c9935
    .xword 0x2aa62235e9d31dcd
    .xword 0x61cf62453ab8e577
    .xword 0xa3fa367d3c7d91e9
    .xword 0xa0edaea54275ee63



SECTION .DATA_CORE2_7 DATA_VA=0xa804e000
attr_data {
    Name = .DATA_CORE2_7,
    VA = 0xa804e000,
    PA = ra2pa(0xa804e000,0),
    RA = 0xa804e000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x556a1f1c20906bb2
    .xword 0x9b01b0cb0489fc01
    .xword 0xb967fa9d180c53f2
    .xword 0xa4d9df56bb1d2134
    .xword 0x6152945806ae3085
    .xword 0x35b5b3f3624f98d6
    .xword 0xa1b9dae7ba292749
    .xword 0xbe9785dcf290c020



SECTION .DATA_CORE3_0 DATA_VA=0xa8050000
attr_data {
    Name = .DATA_CORE3_0,
    VA = 0xa8050000,
    PA = ra2pa(0xa8050000,0),
    RA = 0xa8050000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .global data_core_3
data_core_3:
    .align  PITON_L1D_WAY_SIZE
    .xword 0x81e156040f83f240
    .xword 0x6e0a016e84ac35c
    .xword 0xf4bcf52318fef4d2
    .xword 0x9fa67d7f570677cc
    .xword 0xa28cda247fdda9fb
    .xword 0x4bd56086b6236438
    .xword 0x6882094d04d62e35
    .xword 0x3c7e6871d3424760



SECTION .DATA_CORE3_1 DATA_VA=0xa8052000
attr_data {
    Name = .DATA_CORE3_1,
    VA = 0xa8052000,
    PA = ra2pa(0xa8052000,0),
    RA = 0xa8052000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x74ce326cee4d4737
    .xword 0x7db7429e7cdb63d
    .xword 0xb4e14e553d0c884a
    .xword 0x8741a43dad5ff778
    .xword 0xbb89d64bdbcfe1a1
    .xword 0xf9ceda7bb580eee4
    .xword 0x8cb264ee649f9f5
    .xword 0xa4e15757ff6cb220



SECTION .DATA_CORE3_2 DATA_VA=0xa8054000
attr_data {
    Name = .DATA_CORE3_2,
    VA = 0xa8054000,
    PA = ra2pa(0xa8054000,0),
    RA = 0xa8054000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0xcbe4d1622132083b
    .xword 0x92f23182775a2709
    .xword 0xeb15a92257c23ae5
    .xword 0x7d50377aeaea710c
    .xword 0x968829662edd7fb
    .xword 0xf49c98e03f520592
    .xword 0x3b0cc4ead6bfa99b
    .xword 0x70d1b752ed9d9d89



SECTION .DATA_CORE3_3 DATA_VA=0xa8056000
attr_data {
    Name = .DATA_CORE3_3,
    VA = 0xa8056000,
    PA = ra2pa(0xa8056000,0),
    RA = 0xa8056000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x2941143310f3edab
    .xword 0x812aaf404ee9020f
    .xword 0xe9e35631cccb0f8
    .xword 0xe5b7cf29eff476cd
    .xword 0x55a940935219cc8b
    .xword 0x33b71853f4b1eb8d
    .xword 0x86c549be4b515ab0
    .xword 0x6b94b8d00db55c93



SECTION .DATA_CORE3_4 DATA_VA=0xa8058000
attr_data {
    Name = .DATA_CORE3_4,
    VA = 0xa8058000,
    PA = ra2pa(0xa8058000,0),
    RA = 0xa8058000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x147d579247d286e7
    .xword 0x5b71c7b02c85223f
    .xword 0xf1d11348a92ec2d1
    .xword 0x9f327175c45671e
    .xword 0x5c8cdc4b653c8905
    .xword 0x3a8aab6af751f51d
    .xword 0x16b93d37a177a3cf
    .xword 0xdc36384395067021



SECTION .DATA_CORE3_5 DATA_VA=0xa805a000
attr_data {
    Name = .DATA_CORE3_5,
    VA = 0xa805a000,
    PA = ra2pa(0xa805a000,0),
    RA = 0xa805a000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0xd8db41c71e322c3b
    .xword 0x103800bdb0d7db0a
    .xword 0x410096a6d4e27b5a
    .xword 0x76a8222457f01f9b
    .xword 0xb085f55caac58b23
    .xword 0xee0b4cef6b6e920d
    .xword 0x2da9fca2861e09e3
    .xword 0xcfeb21ff97fcbbe9



SECTION .DATA_CORE3_6 DATA_VA=0xa805c000
attr_data {
    Name = .DATA_CORE3_6,
    VA = 0xa805c000,
    PA = ra2pa(0xa805c000,0),
    RA = 0xa805c000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0xdde4dfab9d789ba0
    .xword 0xd2339418ab139729
    .xword 0x71390174692f6bac
    .xword 0x245df63f21018d4
    .xword 0xb3032abe986d74af
    .xword 0x916637084962d367
    .xword 0x880619e7d1a76e56
    .xword 0xfdcaa17c70fa39e3



SECTION .DATA_CORE3_7 DATA_VA=0xa805e000
attr_data {
    Name = .DATA_CORE3_7,
    VA = 0xa805e000,
    PA = ra2pa(0xa805e000,0),
    RA = 0xa805e000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0xfcb9226931f7b58a
    .xword 0xfa303b7da4420b46
    .xword 0xb248bf162514b6a0
    .xword 0x4bb8441934d1d1c6
    .xword 0xd8cd556a86234fbc
    .xword 0x4208b958d2c53a2f
    .xword 0x1d0f13ef69e1269b
    .xword 0x943d35374ba6e6cc



SECTION .DATA_CORE4_0 DATA_VA=0xa8060000
attr_data {
    Name = .DATA_CORE4_0,
    VA = 0xa8060000,
    PA = ra2pa(0xa8060000,0),
    RA = 0xa8060000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .global data_core_4
data_core_4:
    .align  PITON_L1D_WAY_SIZE
    .xword 0x3a3f180fc7fba063
    .xword 0xe131aa1ab59dd0fd
    .xword 0x7808f9e6ed194dc9
    .xword 0x7a32020dbf96a299
    .xword 0x86084d9f523fe427
    .xword 0x3f0f6e7e43635c8
    .xword 0x3686f3def2f67f09
    .xword 0xa5d9b41f9607587d



SECTION .DATA_CORE4_1 DATA_VA=0xa8062000
attr_data {
    Name = .DATA_CORE4_1,
    VA = 0xa8062000,
    PA = ra2pa(0xa8062000,0),
    RA = 0xa8062000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0xcffdb7429358c120
    .xword 0x6ed5f81f150aee7f
    .xword 0x83d4c4b3f0dd8fcc
    .xword 0x3449f9270469e2df
    .xword 0x4944f17e86f39d86
    .xword 0xd34dbcc27bf3edc1
    .xword 0x18966cd890544af5
    .xword 0xa9ad55a6584e0e8e



SECTION .DATA_CORE4_2 DATA_VA=0xa8064000
attr_data {
    Name = .DATA_CORE4_2,
    VA = 0xa8064000,
    PA = ra2pa(0xa8064000,0),
    RA = 0xa8064000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0xdacd4bc442da0748
    .xword 0x12ec0b9d2c29a9d7
    .xword 0xedf2b110144d27c0
    .xword 0x83a56197095ebc7f
    .xword 0x79c52988294c3f6e
    .xword 0xfdb4d55d89ceded8
    .xword 0xc83cda1c30348479
    .xword 0x791397053e82350d



SECTION .DATA_CORE4_3 DATA_VA=0xa8066000
attr_data {
    Name = .DATA_CORE4_3,
    VA = 0xa8066000,
    PA = ra2pa(0xa8066000,0),
    RA = 0xa8066000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x4ea7f73e9c07e067
    .xword 0xb202f1343d0ca72
    .xword 0x9b08fb927345a638
    .xword 0x9955c69145bed228
    .xword 0x8c4821eb8f74f550
    .xword 0xa690240e6d13aa6a
    .xword 0x12e218b07a5228e0
    .xword 0x89ae58a96e16cd69



SECTION .DATA_CORE4_4 DATA_VA=0xa8068000
attr_data {
    Name = .DATA_CORE4_4,
    VA = 0xa8068000,
    PA = ra2pa(0xa8068000,0),
    RA = 0xa8068000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0xdfa93c337d411d2b
    .xword 0xe9a50745372ea28b
    .xword 0x3109e6d67db0ea61
    .xword 0x2cb7a215d1ca18e2
    .xword 0x37b0a24b665f8592
    .xword 0x857ee5fdb30f1ae
    .xword 0xf396225d5dea7b22
    .xword 0x70c4017a984bcb2f



SECTION .DATA_CORE4_5 DATA_VA=0xa806a000
attr_data {
    Name = .DATA_CORE4_5,
    VA = 0xa806a000,
    PA = ra2pa(0xa806a000,0),
    RA = 0xa806a000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x73e5aee9958fe4d7
    .xword 0x71b6fbc0baf608fc
    .xword 0xaedc1d47933f5c98
    .xword 0xd40f874e23f6ed78
    .xword 0xf74549067f7200b6
    .xword 0xe41166181266fe60
    .xword 0xe91c454cc9af6f63
    .xword 0x722b00ba7858ebc1



SECTION .DATA_CORE4_6 DATA_VA=0xa806c000
attr_data {
    Name = .DATA_CORE4_6,
    VA = 0xa806c000,
    PA = ra2pa(0xa806c000,0),
    RA = 0xa806c000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x7207fa68e8f4b45d
    .xword 0xc6ecb4807c8334f6
    .xword 0x64188cbb281f382
    .xword 0xfca17ba7a36dec86
    .xword 0x6e3c37f445c370f4
    .xword 0x82035492c3c3a217
    .xword 0xcd65abbbfa06cdbd
    .xword 0xbd720b005a066c41



SECTION .DATA_CORE4_7 DATA_VA=0xa806e000
attr_data {
    Name = .DATA_CORE4_7,
    VA = 0xa806e000,
    PA = ra2pa(0xa806e000,0),
    RA = 0xa806e000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x85bd7c3219c2b407
    .xword 0x1133486ecc1fcef1
    .xword 0x50e95a1a75df56d7
    .xword 0xbe2b18c8656dc1db
    .xword 0xbdc34d3f7c95ec8e
    .xword 0x2fcee2446f28f9ed
    .xword 0x2975847579c3eccc
    .xword 0x86473de1bde68ad6



SECTION .DATA_CORE5_0 DATA_VA=0xa8070000
attr_data {
    Name = .DATA_CORE5_0,
    VA = 0xa8070000,
    PA = ra2pa(0xa8070000,0),
    RA = 0xa8070000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .global data_core_5
data_core_5:
    .align  PITON_L1D_WAY_SIZE
    .xword 0x2841914084ff591f
    .xword 0xe0b527ddd9f0a2aa
    .xword 0x5894292d27a8fd16
    .xword 0x4dc1d70b11596fef
    .xword 0x59a2bf8c16566962
    .xword 0xd8ee6ba9b4623cd9
    .xword 0x2ff3603550a8c49f
    .xword 0x2cd936f33c87d067



SECTION .DATA_CORE5_1 DATA_VA=0xa8072000
attr_data {
    Name = .DATA_CORE5_1,
    VA = 0xa8072000,
    PA = ra2pa(0xa8072000,0),
    RA = 0xa8072000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0xe5838cee97edd64e
    .xword 0x5433e81184a7b0ff
    .xword 0x53505270dbeb210c
    .xword 0x73d401bc2a1873c9
    .xword 0x8f754f7354c2e78e
    .xword 0x4dcd44afed4bca9b
    .xword 0x2599b411f30a8405
    .xword 0xea7b42a8564b3cd1



SECTION .DATA_CORE5_2 DATA_VA=0xa8074000
attr_data {
    Name = .DATA_CORE5_2,
    VA = 0xa8074000,
    PA = ra2pa(0xa8074000,0),
    RA = 0xa8074000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x7bd8fd7849806827
    .xword 0xc343a1f9bb9e8c21
    .xword 0xe2b796e8201c5f52
    .xword 0x542fc8d971d7c585
    .xword 0x987a4b58c4b41fcb
    .xword 0x1d6915639f1e07a8
    .xword 0x25e0c3617332884e
    .xword 0xf0cc60df730e0546



SECTION .DATA_CORE5_3 DATA_VA=0xa8076000
attr_data {
    Name = .DATA_CORE5_3,
    VA = 0xa8076000,
    PA = ra2pa(0xa8076000,0),
    RA = 0xa8076000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x6b66547be000785b
    .xword 0x188f6adf98a01fba
    .xword 0x45dc5a9375c6ec53
    .xword 0xe211d1e0d956ea27
    .xword 0x260fdb590d96aca7
    .xword 0xf9da620d90650ad8
    .xword 0x3b12541ef007091e
    .xword 0x419a37919b17731a



SECTION .DATA_CORE5_4 DATA_VA=0xa8078000
attr_data {
    Name = .DATA_CORE5_4,
    VA = 0xa8078000,
    PA = ra2pa(0xa8078000,0),
    RA = 0xa8078000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x805baba1f44057c1
    .xword 0x8da4ef6c45241b1c
    .xword 0xbb2f858f2e08029e
    .xword 0x59087bfa43692339
    .xword 0x6ef2cc12ccf630cd
    .xword 0x187a3b357755565b
    .xword 0x3fc7f357ee9ee45f
    .xword 0xd8c83c34fc0f3ade



SECTION .DATA_CORE5_5 DATA_VA=0xa807a000
attr_data {
    Name = .DATA_CORE5_5,
    VA = 0xa807a000,
    PA = ra2pa(0xa807a000,0),
    RA = 0xa807a000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0xbbd26fa0f868b8a9
    .xword 0x7da90c7b277fd430
    .xword 0x6eb4e2c38b2b2488
    .xword 0xd45f4a580e86e73
    .xword 0x44e1987c20ab6e97
    .xword 0x4c264fdb5637d406
    .xword 0xa9deef84c593c0de
    .xword 0x17a5ee4c17b4dedc



SECTION .DATA_CORE5_6 DATA_VA=0xa807c000
attr_data {
    Name = .DATA_CORE5_6,
    VA = 0xa807c000,
    PA = ra2pa(0xa807c000,0),
    RA = 0xa807c000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0xa85d4aa6d203b64f
    .xword 0x2cb9e8ead3d6d49d
    .xword 0x769821960b93c28f
    .xword 0xcad0f008543f8bb8
    .xword 0x94f8e74661ed3a33
    .xword 0xf232a84149b46f92
    .xword 0x52e867c92223f154
    .xword 0x1a07747b9e00fb5f



SECTION .DATA_CORE5_7 DATA_VA=0xa807e000
attr_data {
    Name = .DATA_CORE5_7,
    VA = 0xa807e000,
    PA = ra2pa(0xa807e000,0),
    RA = 0xa807e000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0xd8db0437cba4375c
    .xword 0x35b0040e27f0cffc
    .xword 0xbeb5536f975b6c24
    .xword 0xe3e76431f29b82f5
    .xword 0x2347e49b009be4df
    .xword 0xbe0fd45894013636
    .xword 0x1027b30f2d947c54
    .xword 0xf95a030cef2be984



SECTION .DATA_CORE6_0 DATA_VA=0xa8080000
attr_data {
    Name = .DATA_CORE6_0,
    VA = 0xa8080000,
    PA = ra2pa(0xa8080000,0),
    RA = 0xa8080000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .global data_core_6
data_core_6:
    .align  PITON_L1D_WAY_SIZE
    .xword 0x54c1a020071a932e
    .xword 0x70ba98bfebe4ab72
    .xword 0x6da5638695afda3d
    .xword 0x577ff464edc52731
    .xword 0x1202a5ec9881905a
    .xword 0x811b97ed254765d1
    .xword 0x25d5922a399a7f7c
    .xword 0x3a26aeb9c75fca5a



SECTION .DATA_CORE6_1 DATA_VA=0xa8082000
attr_data {
    Name = .DATA_CORE6_1,
    VA = 0xa8082000,
    PA = ra2pa(0xa8082000,0),
    RA = 0xa8082000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0xb9c702ccc33ea54
    .xword 0x322e5991138e0b
    .xword 0xec7e03a595ad748e
    .xword 0x612e22177a3c46a6
    .xword 0xdb8e70c3b31714c9
    .xword 0x5fafecd6a0d5cf74
    .xword 0x561c7689b3766dec
    .xword 0x6f3225217d70c05b



SECTION .DATA_CORE6_2 DATA_VA=0xa8084000
attr_data {
    Name = .DATA_CORE6_2,
    VA = 0xa8084000,
    PA = ra2pa(0xa8084000,0),
    RA = 0xa8084000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0xef9de5e933a72ae8
    .xword 0xeedd23f35e694049
    .xword 0x18a3447ef2e0f7e4
    .xword 0x24592ef864851d8a
    .xword 0xec788ea56868774a
    .xword 0xd653c9d637d92dc3
    .xword 0x45b295906c96a382
    .xword 0x67856717c75828d1



SECTION .DATA_CORE6_3 DATA_VA=0xa8086000
attr_data {
    Name = .DATA_CORE6_3,
    VA = 0xa8086000,
    PA = ra2pa(0xa8086000,0),
    RA = 0xa8086000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x5f7c7d7037f27c19
    .xword 0xda2c478e7d259b86
    .xword 0x3892dc8ca48e2f31
    .xword 0xff1445515c4fa082
    .xword 0x7a2728a7e4aae4e7
    .xword 0x89add4d42f4fd38c
    .xword 0x1243353090998e32
    .xword 0x4a97601380a59360



SECTION .DATA_CORE6_4 DATA_VA=0xa8088000
attr_data {
    Name = .DATA_CORE6_4,
    VA = 0xa8088000,
    PA = ra2pa(0xa8088000,0),
    RA = 0xa8088000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x84a96bb85a927af
    .xword 0x200dd080ebc5c142
    .xword 0x1bafda8be1990c2b
    .xword 0x52a82e47224d522a
    .xword 0x3ce1579c129e0d3a
    .xword 0x2870c60f9fcff47e
    .xword 0x3936e0848e273832
    .xword 0x8ae6d00120302c5e



SECTION .DATA_CORE6_5 DATA_VA=0xa808a000
attr_data {
    Name = .DATA_CORE6_5,
    VA = 0xa808a000,
    PA = ra2pa(0xa808a000,0),
    RA = 0xa808a000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x2c8e59ab8e857fbd
    .xword 0x44212fea773d07ca
    .xword 0x5649fcd26a8b6d72
    .xword 0x44233ac2b5036790
    .xword 0x324847588af9cd83
    .xword 0xdbaa38849ddc0cf6
    .xword 0x7caa7361f24c7779
    .xword 0xa42d32870cd7bb74



SECTION .DATA_CORE6_6 DATA_VA=0xa808c000
attr_data {
    Name = .DATA_CORE6_6,
    VA = 0xa808c000,
    PA = ra2pa(0xa808c000,0),
    RA = 0xa808c000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x13a5d38e4c73218f
    .xword 0xc9de8ceb854daf1b
    .xword 0x7268e1aaa75050d
    .xword 0x580c2c86b874a3f4
    .xword 0xd43cbb59bd98bfc7
    .xword 0xcda37c3c2e4c2c5a
    .xword 0xee24d7a17dedbbe3
    .xword 0xc81f112c5cbae27



SECTION .DATA_CORE6_7 DATA_VA=0xa808e000
attr_data {
    Name = .DATA_CORE6_7,
    VA = 0xa808e000,
    PA = ra2pa(0xa808e000,0),
    RA = 0xa808e000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x293fa512bfa94bd7
    .xword 0x57e147975579bff
    .xword 0x556e25d61875f752
    .xword 0x803abc5bed4a29da
    .xword 0x904f1fe69fd80a4a
    .xword 0x4b42b64024ab31c2
    .xword 0xd3b7cca1d8c2d8f
    .xword 0x32dafb11b2ae83f0



SECTION .DATA_CORE7_0 DATA_VA=0xa8090000
attr_data {
    Name = .DATA_CORE7_0,
    VA = 0xa8090000,
    PA = ra2pa(0xa8090000,0),
    RA = 0xa8090000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .global data_core_7
data_core_7:
    .align  PITON_L1D_WAY_SIZE
    .xword 0x50c4a514d30247be
    .xword 0x721fc5603d322f7d
    .xword 0x9240d7e6eb12e9c8
    .xword 0x858cb3fb49ea7f29
    .xword 0x4b6a05216a3e8c75
    .xword 0xa0ceeb836a68d5d5
    .xword 0x95978e63d2708e41
    .xword 0x1228d8a8790eed63



SECTION .DATA_CORE7_1 DATA_VA=0xa8092000
attr_data {
    Name = .DATA_CORE7_1,
    VA = 0xa8092000,
    PA = ra2pa(0xa8092000,0),
    RA = 0xa8092000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0xa4c0881ba78e4b55
    .xword 0xb4d5a09427c1aa21
    .xword 0x55a9f569319f13ea
    .xword 0x613c644dbc646091
    .xword 0xdcf2fcb1d0ef05
    .xword 0xe0ccb1be3541c1f8
    .xword 0xa87682e2af130cdd
    .xword 0x4683c053b49ad21c



SECTION .DATA_CORE7_2 DATA_VA=0xa8094000
attr_data {
    Name = .DATA_CORE7_2,
    VA = 0xa8094000,
    PA = ra2pa(0xa8094000,0),
    RA = 0xa8094000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x6927573e187a53f2
    .xword 0x5465ebf5773191e5
    .xword 0xb8fcf903cbd7b91a
    .xword 0x9450e48062f933c7
    .xword 0xf232ec56932cba90
    .xword 0xd89e98e2b3567692
    .xword 0x7ea5342485274148
    .xword 0x9eee4ff0d8b9bdb9



SECTION .DATA_CORE7_3 DATA_VA=0xa8096000
attr_data {
    Name = .DATA_CORE7_3,
    VA = 0xa8096000,
    PA = ra2pa(0xa8096000,0),
    RA = 0xa8096000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0xd28fea8d0faff790
    .xword 0x89ba90f43c32b9a3
    .xword 0x116c72a43c089e60
    .xword 0x297dc6fec23ec673
    .xword 0x95521a66aba22153
    .xword 0x6f31361bb3e6e0d
    .xword 0x4fe6dd7fe30731d1
    .xword 0x7fad5212ac025eee



SECTION .DATA_CORE7_4 DATA_VA=0xa8098000
attr_data {
    Name = .DATA_CORE7_4,
    VA = 0xa8098000,
    PA = ra2pa(0xa8098000,0),
    RA = 0xa8098000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0xc44cd531bee40bad
    .xword 0x9ac5574b294d9ab5
    .xword 0x240cd87f5b209a08
    .xword 0xfbe03739b89c7b8e
    .xword 0x1fe57a96e949ecc9
    .xword 0xca4b5113965f31d7
    .xword 0xdb581599055ab93b
    .xword 0x67d3e46299944093



SECTION .DATA_CORE7_5 DATA_VA=0xa809a000
attr_data {
    Name = .DATA_CORE7_5,
    VA = 0xa809a000,
    PA = ra2pa(0xa809a000,0),
    RA = 0xa809a000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x61f6ac5ff9dc8b01
    .xword 0x6b8f04ddc9ae16af
    .xword 0xbb31a8361973165d
    .xword 0x5b0cbb14786cb60d
    .xword 0x8aac02c22ef99259
    .xword 0x2185f5e940a39d0d
    .xword 0xeefd2dcde6b267c4
    .xword 0xc90811eb0188d6a6



SECTION .DATA_CORE7_6 DATA_VA=0xa809c000
attr_data {
    Name = .DATA_CORE7_6,
    VA = 0xa809c000,
    PA = ra2pa(0xa809c000,0),
    RA = 0xa809c000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x64d14fee28884999
    .xword 0x1305676d03b81289
    .xword 0x9692e87d56296b1a
    .xword 0x90947b5464854745
    .xword 0xb8bd0a58102f3d96
    .xword 0xc9b5c26a8d1d55d2
    .xword 0x942da30213181a9
    .xword 0x5d2ba0124f9a4efd



SECTION .DATA_CORE7_7 DATA_VA=0xa809e000
attr_data {
    Name = .DATA_CORE7_7,
    VA = 0xa809e000,
    PA = ra2pa(0xa809e000,0),
    RA = 0xa809e000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x1337f81ee695c4a6
    .xword 0x439032741f90cf2b
    .xword 0x5e6da6a122ee2c
    .xword 0xc027193a716983dc
    .xword 0x5174085041552738
    .xword 0x405a3e07d31abcdd
    .xword 0x2ffa4dfa6ae80673
    .xword 0xbc31330c8f0ef0fc



SECTION .DATA_CORE8_0 DATA_VA=0xa80a0000
attr_data {
    Name = .DATA_CORE8_0,
    VA = 0xa80a0000,
    PA = ra2pa(0xa80a0000,0),
    RA = 0xa80a0000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .global data_core_8
data_core_8:
    .align  PITON_L1D_WAY_SIZE
    .xword 0x784295f297b25f13
    .xword 0x972df8802c48dbb9
    .xword 0x1c5098befb1351da
    .xword 0xd835ad5c3e94d1b2
    .xword 0x612f90ad6b969d89
    .xword 0xb6d2314e041dee0c
    .xword 0x71bcad7e9934a8f1
    .xword 0x388bdf992c51ea98



SECTION .DATA_CORE8_1 DATA_VA=0xa80a2000
attr_data {
    Name = .DATA_CORE8_1,
    VA = 0xa80a2000,
    PA = ra2pa(0xa80a2000,0),
    RA = 0xa80a2000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x1a6125ba5e0385ce
    .xword 0x1b587bfe7ace186d
    .xword 0x9734d4d52aff8892
    .xword 0x1b26abe1d6c4a898
    .xword 0x227463602c30c7d6
    .xword 0xfebbfc50d715906a
    .xword 0xfb5d1dbd4f80826a
    .xword 0x7a2a67699248e63



SECTION .DATA_CORE8_2 DATA_VA=0xa80a4000
attr_data {
    Name = .DATA_CORE8_2,
    VA = 0xa80a4000,
    PA = ra2pa(0xa80a4000,0),
    RA = 0xa80a4000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x99be0d3cbce931d3
    .xword 0xaffa41e6863cedd6
    .xword 0xb603aca0be1315d6
    .xword 0x3a01dd0795eec9d3
    .xword 0x50bec6b738208f4f
    .xword 0x70c4db772b30ca4c
    .xword 0x5ba9cfe1252beedd
    .xword 0x261d7cbe517a2db5



SECTION .DATA_CORE8_3 DATA_VA=0xa80a6000
attr_data {
    Name = .DATA_CORE8_3,
    VA = 0xa80a6000,
    PA = ra2pa(0xa80a6000,0),
    RA = 0xa80a6000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x8dbd950abc1cb0cc
    .xword 0x19accd33b69e300b
    .xword 0x11a700c21d192d97
    .xword 0x18fdd81150960378
    .xword 0x5385bc2203222571
    .xword 0xe64f405a5618ef8d
    .xword 0x171fba449158fa53
    .xword 0x1ce986feb38f72d0



SECTION .DATA_CORE8_4 DATA_VA=0xa80a8000
attr_data {
    Name = .DATA_CORE8_4,
    VA = 0xa80a8000,
    PA = ra2pa(0xa80a8000,0),
    RA = 0xa80a8000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0xb422abd7de5d336e
    .xword 0xcafb113db3178c4a
    .xword 0xc1c74cf73e0822f9
    .xword 0x86b5660a399a1413
    .xword 0x3db2f07c9b6f7f44
    .xword 0x7386ec75462d5121
    .xword 0x69b697f3baa15818
    .xword 0x318a2682db8b6b42



SECTION .DATA_CORE8_5 DATA_VA=0xa80aa000
attr_data {
    Name = .DATA_CORE8_5,
    VA = 0xa80aa000,
    PA = ra2pa(0xa80aa000,0),
    RA = 0xa80aa000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0xa721df3cd67a4dba
    .xword 0x9b0d1b20d55919
    .xword 0xe9d07597b0efafa7
    .xword 0x2b84a539a8367ffc
    .xword 0x49e5e8c1873bcd59
    .xword 0x9d38ce14e16701a9
    .xword 0x41412a40c2163eb8
    .xword 0xa0d7705912504f8d



SECTION .DATA_CORE8_6 DATA_VA=0xa80ac000
attr_data {
    Name = .DATA_CORE8_6,
    VA = 0xa80ac000,
    PA = ra2pa(0xa80ac000,0),
    RA = 0xa80ac000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x32dbf252b0de4d81
    .xword 0x8223c1cb2be9d53e
    .xword 0xd2605b899fe8a48c
    .xword 0x81d0fcd2700fbded
    .xword 0xc36523c1cb278ffe
    .xword 0x5cd251f8f7b8b7d9
    .xword 0x413c6d92c2bd4812
    .xword 0x3b0390e636c6be38



SECTION .DATA_CORE8_7 DATA_VA=0xa80ae000
attr_data {
    Name = .DATA_CORE8_7,
    VA = 0xa80ae000,
    PA = ra2pa(0xa80ae000,0),
    RA = 0xa80ae000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0xfdda857512383656
    .xword 0x475624632c037d3e
    .xword 0x3880d17e25b8ead2
    .xword 0xcb7072182dc66ba
    .xword 0x9df0b703c82b3021
    .xword 0x61bfbc042f8ee4e6
    .xword 0xa4b94622dab426e7
    .xword 0x568c2ef03d7e3e62



SECTION .DATA_CORE9_0 DATA_VA=0xa80b0000
attr_data {
    Name = .DATA_CORE9_0,
    VA = 0xa80b0000,
    PA = ra2pa(0xa80b0000,0),
    RA = 0xa80b0000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .global data_core_9
data_core_9:
    .align  PITON_L1D_WAY_SIZE
    .xword 0xafde25f56fcb0fc3
    .xword 0x3bcdce667e0864b0
    .xword 0x76d90e65d74962e5
    .xword 0xc9d830ac49283c56
    .xword 0x733181b41f079680
    .xword 0x2fc8f1ca7ded3db
    .xword 0xde4a31d01a2171ab
    .xword 0x7d1edb73d1e15ac0



SECTION .DATA_CORE9_1 DATA_VA=0xa80b2000
attr_data {
    Name = .DATA_CORE9_1,
    VA = 0xa80b2000,
    PA = ra2pa(0xa80b2000,0),
    RA = 0xa80b2000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x5896838e5439f1d
    .xword 0x6b6963f26ac6d08f
    .xword 0xb4b8682ee656929b
    .xword 0x475ef3046fbfe825
    .xword 0xe3dd0ecc6ff82b66
    .xword 0xf0b6453f4a5bc54b
    .xword 0x1720ab8831415ac2
    .xword 0x7390e35db694bb3c



SECTION .DATA_CORE9_2 DATA_VA=0xa80b4000
attr_data {
    Name = .DATA_CORE9_2,
    VA = 0xa80b4000,
    PA = ra2pa(0xa80b4000,0),
    RA = 0xa80b4000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x1c26d887883c1866
    .xword 0xde18935f70565581
    .xword 0x96f0b0bbf6eb19de
    .xword 0x5d7235ad2ffccd91
    .xword 0x500df691d7c6be74
    .xword 0xa17d271abab370a4
    .xword 0xfce0dee7f2c377ac
    .xword 0x79c97cbf484092bf



SECTION .DATA_CORE9_3 DATA_VA=0xa80b6000
attr_data {
    Name = .DATA_CORE9_3,
    VA = 0xa80b6000,
    PA = ra2pa(0xa80b6000,0),
    RA = 0xa80b6000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x6a7cf824c92366b5
    .xword 0x28143ae98613096b
    .xword 0xb09cdf3431214ca8
    .xword 0x2e6d681933a086d6
    .xword 0x65c4a95f0367957f
    .xword 0xf77ec97035a4e6ca
    .xword 0xe59214b0a2048361
    .xword 0x4d8f3c4f376b01f9



SECTION .DATA_CORE9_4 DATA_VA=0xa80b8000
attr_data {
    Name = .DATA_CORE9_4,
    VA = 0xa80b8000,
    PA = ra2pa(0xa80b8000,0),
    RA = 0xa80b8000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x5517746b2168015d
    .xword 0x8e08e71e1521183
    .xword 0x8805bce147d8827f
    .xword 0xd6f3188f06d9a7fa
    .xword 0xed6d4d1561a22c62
    .xword 0xda3054ee4f428b97
    .xword 0x270489a9e9012360
    .xword 0x5c199f668873eeef



SECTION .DATA_CORE9_5 DATA_VA=0xa80ba000
attr_data {
    Name = .DATA_CORE9_5,
    VA = 0xa80ba000,
    PA = ra2pa(0xa80ba000,0),
    RA = 0xa80ba000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0xc60dde596b282843
    .xword 0xa7850db736fda784
    .xword 0x9c9ae9e90210e13
    .xword 0xd24de7ef1e7a5a55
    .xword 0x56b85875efa73b8c
    .xword 0x36a07261ffc5bc41
    .xword 0xd5d9148d2781c07a
    .xword 0xf7ac53bcc537d41b



SECTION .DATA_CORE9_6 DATA_VA=0xa80bc000
attr_data {
    Name = .DATA_CORE9_6,
    VA = 0xa80bc000,
    PA = ra2pa(0xa80bc000,0),
    RA = 0xa80bc000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0xf5dc88b21f756756
    .xword 0x149220eb59c50d13
    .xword 0xfbaf1ec8723b5417
    .xword 0xf72e79019117eca1
    .xword 0xbac2967d553ef30
    .xword 0xa39bfa42fa95e041
    .xword 0x2e372b67fb1ed11d
    .xword 0xe4f76161b0a26ebf



SECTION .DATA_CORE9_7 DATA_VA=0xa80be000
attr_data {
    Name = .DATA_CORE9_7,
    VA = 0xa80be000,
    PA = ra2pa(0xa80be000,0),
    RA = 0xa80be000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0xe32a72907870386
    .xword 0xe6ccdc038f610e32
    .xword 0x57246a33ee715cfa
    .xword 0xa26532360705aa7
    .xword 0xb68f7449fcda531e
    .xword 0x53887d1d5a04427
    .xword 0x3264c40426d05b03
    .xword 0x7bc0aaf88573b489



SECTION .DATA_CORE10_0 DATA_VA=0xa80c0000
attr_data {
    Name = .DATA_CORE10_0,
    VA = 0xa80c0000,
    PA = ra2pa(0xa80c0000,0),
    RA = 0xa80c0000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .global data_core_10
data_core_10:
    .align  PITON_L1D_WAY_SIZE
    .xword 0x938ca9433d1c5212
    .xword 0xff4700450eb34a16
    .xword 0x73e25d30e077d695
    .xword 0x949d8dbed2bfd01b
    .xword 0x526811575b753762
    .xword 0x91159540db9d5afd
    .xword 0xecaec0ebd891c1b
    .xword 0xb8fdbe7b0be4c6d1



SECTION .DATA_CORE10_1 DATA_VA=0xa80c2000
attr_data {
    Name = .DATA_CORE10_1,
    VA = 0xa80c2000,
    PA = ra2pa(0xa80c2000,0),
    RA = 0xa80c2000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x30b181617bf72446
    .xword 0x228eaa35fc732d24
    .xword 0x5786d15fe20aeb8
    .xword 0x6eb9d57cc2b6cf38
    .xword 0xdeb7446355c41bb1
    .xword 0x815b206ce28d049f
    .xword 0x9eb691d258c53d57
    .xword 0x1a47a7414df0d8de



SECTION .DATA_CORE10_2 DATA_VA=0xa80c4000
attr_data {
    Name = .DATA_CORE10_2,
    VA = 0xa80c4000,
    PA = ra2pa(0xa80c4000,0),
    RA = 0xa80c4000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x1d7d3b0edec98636
    .xword 0x342954e523f92185
    .xword 0xb99f8b730e035300
    .xword 0x52998575b366a609
    .xword 0x18c4234a7b316952
    .xword 0x83fccdbd3a4c621f
    .xword 0x6f3c3f5f50da4204
    .xword 0x17f17b4ad0584a47



SECTION .DATA_CORE10_3 DATA_VA=0xa80c6000
attr_data {
    Name = .DATA_CORE10_3,
    VA = 0xa80c6000,
    PA = ra2pa(0xa80c6000,0),
    RA = 0xa80c6000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0xa274accfe36938a8
    .xword 0x6cf3d20c7ab88d1
    .xword 0x4391b84d12d50601
    .xword 0xe8f4ba179ed68143
    .xword 0x72fbae21037152cd
    .xword 0xb97d58cf61f1e513
    .xword 0x1669fa4357e2d467
    .xword 0xef06cde08f4010e



SECTION .DATA_CORE10_4 DATA_VA=0xa80c8000
attr_data {
    Name = .DATA_CORE10_4,
    VA = 0xa80c8000,
    PA = ra2pa(0xa80c8000,0),
    RA = 0xa80c8000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0xee6cee52b9adf340
    .xword 0x8c407025f4af9a40
    .xword 0xe00d5ab81a6565a8
    .xword 0x3ba26e565b2f8d5f
    .xword 0xe7cfcd46e2af2354
    .xword 0xea1559a7ab07dba3
    .xword 0x9f54d6713582afd5
    .xword 0x87c7ce6a1d898b93



SECTION .DATA_CORE10_5 DATA_VA=0xa80ca000
attr_data {
    Name = .DATA_CORE10_5,
    VA = 0xa80ca000,
    PA = ra2pa(0xa80ca000,0),
    RA = 0xa80ca000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x6225b5b6bf77321b
    .xword 0xf8f45e8f6b4966ac
    .xword 0x4aa0105b779ce11b
    .xword 0x4328334084b3db81
    .xword 0xb7f72a3bb1265432
    .xword 0x7ab29af93645a269
    .xword 0xa73730287ccdc963
    .xword 0xb30fc87777df3696



SECTION .DATA_CORE10_6 DATA_VA=0xa80cc000
attr_data {
    Name = .DATA_CORE10_6,
    VA = 0xa80cc000,
    PA = ra2pa(0xa80cc000,0),
    RA = 0xa80cc000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x827d956d5b01f182
    .xword 0x28a14a789613eed7
    .xword 0xeb1b8a08647c1997
    .xword 0xf6e0f0f7d6403f15
    .xword 0x318e699caf9ce2b4
    .xword 0x970494232cd348b9
    .xword 0x2c9462a36267b42c
    .xword 0xde9eab0a4a47e09a



SECTION .DATA_CORE10_7 DATA_VA=0xa80ce000
attr_data {
    Name = .DATA_CORE10_7,
    VA = 0xa80ce000,
    PA = ra2pa(0xa80ce000,0),
    RA = 0xa80ce000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0xbd42a3ddaf7d63e3
    .xword 0x9916f3602c3fbd87
    .xword 0x8c43394f41b0cf06
    .xword 0xd0db3faf05c47b3
    .xword 0xa534f4624b104f66
    .xword 0x276f5d50d815fba1
    .xword 0xb60bf200c576b7e1
    .xword 0xf1e6b267965216cd



SECTION .DATA_CORE11_0 DATA_VA=0xa80d0000
attr_data {
    Name = .DATA_CORE11_0,
    VA = 0xa80d0000,
    PA = ra2pa(0xa80d0000,0),
    RA = 0xa80d0000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .global data_core_11
data_core_11:
    .align  PITON_L1D_WAY_SIZE
    .xword 0xb9023f4cf94fc2cb
    .xword 0x606bf7dcbdb9444
    .xword 0x259458187c4f2079
    .xword 0x3a2a744170f2e8b3
    .xword 0x7172bd0bdb238a10
    .xword 0x113a4cddabbd4759
    .xword 0xf7ddce24780d704
    .xword 0xd8b432ca21e8ff79



SECTION .DATA_CORE11_1 DATA_VA=0xa80d2000
attr_data {
    Name = .DATA_CORE11_1,
    VA = 0xa80d2000,
    PA = ra2pa(0xa80d2000,0),
    RA = 0xa80d2000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x9ea4a617d9ebd68b
    .xword 0x4feed43867f578e9
    .xword 0x174c58d0f06b0ea3
    .xword 0x4867c247e5ee9f5
    .xword 0xd48039b965e9d4fe
    .xword 0x23d532dadc3e6176
    .xword 0x42bff65199b5dd8c
    .xword 0x88598d9d947401fa



SECTION .DATA_CORE11_2 DATA_VA=0xa80d4000
attr_data {
    Name = .DATA_CORE11_2,
    VA = 0xa80d4000,
    PA = ra2pa(0xa80d4000,0),
    RA = 0xa80d4000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x95848f6a9d6327d2
    .xword 0x469f11f6e405b1f2
    .xword 0x9a23770248120d59
    .xword 0x2230454b23ba4167
    .xword 0xe1aadd43e1a73375
    .xword 0xa976078a48fd6922
    .xword 0xfefe9fc4c849be38
    .xword 0x2982dc6ea8fc0d8



SECTION .DATA_CORE11_3 DATA_VA=0xa80d6000
attr_data {
    Name = .DATA_CORE11_3,
    VA = 0xa80d6000,
    PA = ra2pa(0xa80d6000,0),
    RA = 0xa80d6000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x77c1bd9f00f00e2e
    .xword 0x4333536906433608
    .xword 0xf67b8dd93b8776c9
    .xword 0x4f3692b8b1e01585
    .xword 0xa2e23f12587f264b
    .xword 0xf9797e54414e3008
    .xword 0xa40a8cbbf5032524
    .xword 0x993a7d2b36a2b41f



SECTION .DATA_CORE11_4 DATA_VA=0xa80d8000
attr_data {
    Name = .DATA_CORE11_4,
    VA = 0xa80d8000,
    PA = ra2pa(0xa80d8000,0),
    RA = 0xa80d8000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x98d2764fa8723f14
    .xword 0x5bcb4ecd2af5d5b1
    .xword 0xbae6bffc2112f51e
    .xword 0xbe9960a787b2bf36
    .xword 0xe5a1cb6aec75554f
    .xword 0xfb1bf9dddd1e64d5
    .xword 0xc9f2c06947b4c2b
    .xword 0xf1605263c87d354d



SECTION .DATA_CORE11_5 DATA_VA=0xa80da000
attr_data {
    Name = .DATA_CORE11_5,
    VA = 0xa80da000,
    PA = ra2pa(0xa80da000,0),
    RA = 0xa80da000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x50c623a8d471eb4b
    .xword 0x75b103550eb4423d
    .xword 0x710875f745a37041
    .xword 0x67b41972915b8b58
    .xword 0x85f46ebfe919880f
    .xword 0x2dd69ed5b152d68
    .xword 0x94a8bb4699428b92
    .xword 0xec2e87e816bd7d



SECTION .DATA_CORE11_6 DATA_VA=0xa80dc000
attr_data {
    Name = .DATA_CORE11_6,
    VA = 0xa80dc000,
    PA = ra2pa(0xa80dc000,0),
    RA = 0xa80dc000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x8718d5478b6d60b3
    .xword 0xb885c3d59089c492
    .xword 0x6900daf469f4061a
    .xword 0x8014d4212565260c
    .xword 0xf62dcb3f95d3d1bf
    .xword 0x823954f43756597e
    .xword 0x6bcd6c425298eb09
    .xword 0x33f9551f2384622a



SECTION .DATA_CORE11_7 DATA_VA=0xa80de000
attr_data {
    Name = .DATA_CORE11_7,
    VA = 0xa80de000,
    PA = ra2pa(0xa80de000,0),
    RA = 0xa80de000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x696d742def68d861
    .xword 0x61e9d177b4db0452
    .xword 0x8005b4a497e96057
    .xword 0xf9cd97dc56f17020
    .xword 0x563498c0f9c8812c
    .xword 0x2b4626834252d187
    .xword 0x9bfe03ec525beeb7
    .xword 0xb41b30ca73b43cb3



SECTION .DATA_CORE12_0 DATA_VA=0xa80e0000
attr_data {
    Name = .DATA_CORE12_0,
    VA = 0xa80e0000,
    PA = ra2pa(0xa80e0000,0),
    RA = 0xa80e0000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .global data_core_12
data_core_12:
    .align  PITON_L1D_WAY_SIZE
    .xword 0xa237b876892dd8c9
    .xword 0x686b9ef28f9f948a
    .xword 0xa27b892a1a070ca6
    .xword 0xcbb0c71750825a25
    .xword 0xc5c05f0340bc103
    .xword 0x7597b8293c73ff1b
    .xword 0xe96f015b4380f2cc
    .xword 0x3f3f086bbe5c3968



SECTION .DATA_CORE12_1 DATA_VA=0xa80e2000
attr_data {
    Name = .DATA_CORE12_1,
    VA = 0xa80e2000,
    PA = ra2pa(0xa80e2000,0),
    RA = 0xa80e2000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0xfa0bd5eda15142b7
    .xword 0xbef6b8fe61b794ac
    .xword 0xb8a0d3f86f8289ea
    .xword 0xba4a1d52546830d7
    .xword 0x6662191067ec58b9
    .xword 0xea55b66c028467ec
    .xword 0x371e9a0e601e8aaa
    .xword 0x1835aa994893a7b1



SECTION .DATA_CORE12_2 DATA_VA=0xa80e4000
attr_data {
    Name = .DATA_CORE12_2,
    VA = 0xa80e4000,
    PA = ra2pa(0xa80e4000,0),
    RA = 0xa80e4000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0xbc8187a9c0b9b676
    .xword 0xee261c7bc949b087
    .xword 0xad38a7bbd6f79ea0
    .xword 0xd5998e552d85772b
    .xword 0x61bee5fed79cb8e0
    .xword 0xd089743dedd8ddda
    .xword 0xb8eccb2fd4cf9c3e
    .xword 0x7cb4bec8c086d747



SECTION .DATA_CORE12_3 DATA_VA=0xa80e6000
attr_data {
    Name = .DATA_CORE12_3,
    VA = 0xa80e6000,
    PA = ra2pa(0xa80e6000,0),
    RA = 0xa80e6000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0xd2aeafd11480c4da
    .xword 0x4de4f537ab9cc859
    .xword 0x89f0850d087b70b1
    .xword 0xeb4e8354dcd5e381
    .xword 0xd5788af487d307b5
    .xword 0xa662f9b0bb94ad8f
    .xword 0x8ec03f32abb8ffcc
    .xword 0x40642da01805f9c5



SECTION .DATA_CORE12_4 DATA_VA=0xa80e8000
attr_data {
    Name = .DATA_CORE12_4,
    VA = 0xa80e8000,
    PA = ra2pa(0xa80e8000,0),
    RA = 0xa80e8000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0xe70a7c928267bd9
    .xword 0xcc8a298710fdfea2
    .xword 0xc976416612892128
    .xword 0xcc6c773151414df3
    .xword 0xfeb4a3e86fd983ab
    .xword 0x61373766e90f51df
    .xword 0xb4117c4a9f5cf798
    .xword 0x51d5c0e7ca868710



SECTION .DATA_CORE12_5 DATA_VA=0xa80ea000
attr_data {
    Name = .DATA_CORE12_5,
    VA = 0xa80ea000,
    PA = ra2pa(0xa80ea000,0),
    RA = 0xa80ea000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x46230f421854c34f
    .xword 0xabbe6711b77d6a6b
    .xword 0xcfc4a2be80f758c2
    .xword 0x43db804be02d94c0
    .xword 0x3c058abafa449bbc
    .xword 0xf963bc993ce8139c
    .xword 0x611161b2999f837d
    .xword 0xfb2a0bdea13c84bc



SECTION .DATA_CORE12_6 DATA_VA=0xa80ec000
attr_data {
    Name = .DATA_CORE12_6,
    VA = 0xa80ec000,
    PA = ra2pa(0xa80ec000,0),
    RA = 0xa80ec000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0xbd973b58119ef12f
    .xword 0x6f3669e4fe398e98
    .xword 0xc91f41af0b7d5365
    .xword 0x7c845dfe1137da7e
    .xword 0x2e95934689092119
    .xword 0x48b392d36e2b8aba
    .xword 0xbf5d295364f05ff4
    .xword 0x846dd2ea201df549



SECTION .DATA_CORE12_7 DATA_VA=0xa80ee000
attr_data {
    Name = .DATA_CORE12_7,
    VA = 0xa80ee000,
    PA = ra2pa(0xa80ee000,0),
    RA = 0xa80ee000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0xdeac9f92b4117ce2
    .xword 0x8c845bb4e8ab70c1
    .xword 0x98abdd3741d5ca67
    .xword 0x7d8397cbe37a3f42
    .xword 0xace00708a12ff906
    .xword 0x5a3d5d5b8cc88f58
    .xword 0x791674a52949431f
    .xword 0x9caaf1aba6651385



SECTION .DATA_CORE13_0 DATA_VA=0xa80f0000
attr_data {
    Name = .DATA_CORE13_0,
    VA = 0xa80f0000,
    PA = ra2pa(0xa80f0000,0),
    RA = 0xa80f0000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .global data_core_13
data_core_13:
    .align  PITON_L1D_WAY_SIZE
    .xword 0x75f8227a020f39a
    .xword 0x48ef30a5aca82c5b
    .xword 0xe4c905e591cce5a2
    .xword 0xda26d42bc587f564
    .xword 0xa83d8187649f0eff
    .xword 0x4daf094421de12f2
    .xword 0xfc1ac3f42311ad20
    .xword 0x304f7496664d9635



SECTION .DATA_CORE13_1 DATA_VA=0xa80f2000
attr_data {
    Name = .DATA_CORE13_1,
    VA = 0xa80f2000,
    PA = ra2pa(0xa80f2000,0),
    RA = 0xa80f2000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0xcb66f0e9b49acd61
    .xword 0xc7551e73aef2a719
    .xword 0x54c8e34b9f3769fe
    .xword 0xbb09fb3d7b99c134
    .xword 0xb9cfbd394857e16c
    .xword 0x22c17de0b1d23ce4
    .xword 0xce41681927f0ef3c
    .xword 0x5d8a6d2687debb8a



SECTION .DATA_CORE13_2 DATA_VA=0xa80f4000
attr_data {
    Name = .DATA_CORE13_2,
    VA = 0xa80f4000,
    PA = ra2pa(0xa80f4000,0),
    RA = 0xa80f4000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x467553150c6dd264
    .xword 0x81564be44b205e3e
    .xword 0xea79791fb756b824
    .xword 0xa4bd6f0d1c5f2ed4
    .xword 0x6fc3f844bb1d1d26
    .xword 0xa1112a3811212d20
    .xword 0x66cdece08fb0e3ea
    .xword 0x294e53c6035f72e1



SECTION .DATA_CORE13_3 DATA_VA=0xa80f6000
attr_data {
    Name = .DATA_CORE13_3,
    VA = 0xa80f6000,
    PA = ra2pa(0xa80f6000,0),
    RA = 0xa80f6000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0xdf2c23669a0262d
    .xword 0x9802f343bb2d99f7
    .xword 0x301ceef06a2abb1b
    .xword 0xc927dd360777969f
    .xword 0xd9fdb2fff316e050
    .xword 0x3d023a557cc983cd
    .xword 0xc290fa607710251b
    .xword 0x8e850124901b8c78



SECTION .DATA_CORE13_4 DATA_VA=0xa80f8000
attr_data {
    Name = .DATA_CORE13_4,
    VA = 0xa80f8000,
    PA = ra2pa(0xa80f8000,0),
    RA = 0xa80f8000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x760adf23608718d1
    .xword 0x133bf8b1403f93e3
    .xword 0xeef19834d5be29d2
    .xword 0x8a5ebd4ae248217c
    .xword 0xbb33ebb12d186f93
    .xword 0x4da6e53c62a31fe9
    .xword 0x3a23b77c8fa748c2
    .xword 0x20cc7d41a07cc67



SECTION .DATA_CORE13_5 DATA_VA=0xa80fa000
attr_data {
    Name = .DATA_CORE13_5,
    VA = 0xa80fa000,
    PA = ra2pa(0xa80fa000,0),
    RA = 0xa80fa000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0xd6752d4f4e5ec041
    .xword 0xae26c91c35e1e941
    .xword 0x8710727f7c7a4f74
    .xword 0xafa099d630a7399
    .xword 0x9b82483705dc974b
    .xword 0xf56e77227c7fe91e
    .xword 0x15080ec5850db050
    .xword 0x61e3a0bb19d6af2c



SECTION .DATA_CORE13_6 DATA_VA=0xa80fc000
attr_data {
    Name = .DATA_CORE13_6,
    VA = 0xa80fc000,
    PA = ra2pa(0xa80fc000,0),
    RA = 0xa80fc000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x1318edc965db3e89
    .xword 0x99411ad2d4c476d5
    .xword 0x3a874e0d05e889fe
    .xword 0x3eef70a808ae41ff
    .xword 0x53e3133eb05addab
    .xword 0x9c608f69e2b78ad9
    .xword 0x2ed4430c2f0b51c2
    .xword 0xbdcc23a78ae4b7b8



SECTION .DATA_CORE13_7 DATA_VA=0xa80fe000
attr_data {
    Name = .DATA_CORE13_7,
    VA = 0xa80fe000,
    PA = ra2pa(0xa80fe000,0),
    RA = 0xa80fe000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x62004a219255bd28
    .xword 0x818a995e3133318e
    .xword 0x5814408ba8fed5c
    .xword 0x882e39b77dce0f8d
    .xword 0x6c1c649e25a88783
    .xword 0x8181716e5ab559ce
    .xword 0xe2845bac39fa630b
    .xword 0x8d4959732cf2e16f



SECTION .DATA_CORE14_0 DATA_VA=0xa8100000
attr_data {
    Name = .DATA_CORE14_0,
    VA = 0xa8100000,
    PA = ra2pa(0xa8100000,0),
    RA = 0xa8100000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .global data_core_14
data_core_14:
    .align  PITON_L1D_WAY_SIZE
    .xword 0xc104587d7d93f252
    .xword 0x99e84c9377ae4e45
    .xword 0xc5f89c9ceb931e11
    .xword 0x4d53ee1e782e4138
    .xword 0x19f129a09e60d255
    .xword 0x14fb468710df63cb
    .xword 0xc1e12a9b4ef57515
    .xword 0xfe844ab391b265d7



SECTION .DATA_CORE14_1 DATA_VA=0xa8102000
attr_data {
    Name = .DATA_CORE14_1,
    VA = 0xa8102000,
    PA = ra2pa(0xa8102000,0),
    RA = 0xa8102000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x3bd439c7a9e1a929
    .xword 0x5fb3157078e62bf6
    .xword 0x7b5b7c2adbcc726f
    .xword 0x48b6b006fa74fd9e
    .xword 0x35251ac982aad914
    .xword 0x5586734ac0eed2ae
    .xword 0x23e069418ec6ac92
    .xword 0x79bcac159f68ee5c



SECTION .DATA_CORE14_2 DATA_VA=0xa8104000
attr_data {
    Name = .DATA_CORE14_2,
    VA = 0xa8104000,
    PA = ra2pa(0xa8104000,0),
    RA = 0xa8104000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0xea9b73f1b922944d
    .xword 0x539a8a7dfb581c13
    .xword 0xce707bc78ca48eb5
    .xword 0xc1b84b8496f14bd
    .xword 0xbd985646942bd313
    .xword 0x9e8cb877c4a3d776
    .xword 0x98b3171bc9537101
    .xword 0x2252eb13e2135a28



SECTION .DATA_CORE14_3 DATA_VA=0xa8106000
attr_data {
    Name = .DATA_CORE14_3,
    VA = 0xa8106000,
    PA = ra2pa(0xa8106000,0),
    RA = 0xa8106000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0xc1517bbae4694dff
    .xword 0xf612d6ee46bc08c3
    .xword 0xc4f80dead7773908
    .xword 0x7768df41469bb5a3
    .xword 0x4245f925984d5019
    .xword 0x1ff171c5eef36d56
    .xword 0x3bc7405bd45ad6fd
    .xword 0x5407a798d62fdd33



SECTION .DATA_CORE14_4 DATA_VA=0xa8108000
attr_data {
    Name = .DATA_CORE14_4,
    VA = 0xa8108000,
    PA = ra2pa(0xa8108000,0),
    RA = 0xa8108000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0xd2a00b64b59673e7
    .xword 0x8cd2a9b088ff9f5c
    .xword 0xb4808c173af92389
    .xword 0x9cacc0670a38fe6
    .xword 0x42601388beb7e5a3
    .xword 0x4c49595cc91e851e
    .xword 0xc5ef5f39d64b9ccd
    .xword 0x550a162af083e1fb



SECTION .DATA_CORE14_5 DATA_VA=0xa810a000
attr_data {
    Name = .DATA_CORE14_5,
    VA = 0xa810a000,
    PA = ra2pa(0xa810a000,0),
    RA = 0xa810a000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x9b6cd259b5e67485
    .xword 0x48484c5c75cda602
    .xword 0x9166aa79611a4199
    .xword 0xab3d7e3f9ef7d249
    .xword 0x5a5284010e86b45b
    .xword 0xeb08451e1b98aad3
    .xword 0xfca508eda9fee5a5
    .xword 0x3d9449a030bad83a



SECTION .DATA_CORE14_6 DATA_VA=0xa810c000
attr_data {
    Name = .DATA_CORE14_6,
    VA = 0xa810c000,
    PA = ra2pa(0xa810c000,0),
    RA = 0xa810c000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0xa24f8da4f207255b
    .xword 0x6652419e23d9513c
    .xword 0x8f298d1a2a55227e
    .xword 0x4a1a4ab0c2234dd3
    .xword 0x2b01451aedb9e308
    .xword 0x9fbee26778fd27a9
    .xword 0xa5599d7627080f2c
    .xword 0x7163833f3f7135f9



SECTION .DATA_CORE14_7 DATA_VA=0xa810e000
attr_data {
    Name = .DATA_CORE14_7,
    VA = 0xa810e000,
    PA = ra2pa(0xa810e000,0),
    RA = 0xa810e000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x752e5904d6dbac34
    .xword 0x3385c81c2d9c8d37
    .xword 0x7f25e5e5e20e5fa2
    .xword 0xa6c9fe25d732cb12
    .xword 0x6747beca8d3fab2
    .xword 0x754a47bbe50989a9
    .xword 0xb7ae11e7f6a01b7c
    .xword 0x469359b6cb6d316b



SECTION .DATA_CORE15_0 DATA_VA=0xa8110000
attr_data {
    Name = .DATA_CORE15_0,
    VA = 0xa8110000,
    PA = ra2pa(0xa8110000,0),
    RA = 0xa8110000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .global data_core_15
data_core_15:
    .align  PITON_L1D_WAY_SIZE
    .xword 0x747f6204a1c5b8de
    .xword 0x725aa24b66efcb23
    .xword 0xb2e744ed71a77a7d
    .xword 0xb5773d40b19afe3
    .xword 0x7faa69e269fb0fc8
    .xword 0x1ed1d4f6b78761e0
    .xword 0xfab6df2fcfa97a35
    .xword 0x853d8f0661513204



SECTION .DATA_CORE15_1 DATA_VA=0xa8112000
attr_data {
    Name = .DATA_CORE15_1,
    VA = 0xa8112000,
    PA = ra2pa(0xa8112000,0),
    RA = 0xa8112000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0xa83ccaf31c63ffc4
    .xword 0x9c447f625a109f50
    .xword 0xd876c7a631fec7d6
    .xword 0xfc3d2bf677861637
    .xword 0x4f4bf0c2cf7f4a32
    .xword 0x1a139422ea480db
    .xword 0xdcca80561f8e5cac
    .xword 0xe6617489aeec0410



SECTION .DATA_CORE15_2 DATA_VA=0xa8114000
attr_data {
    Name = .DATA_CORE15_2,
    VA = 0xa8114000,
    PA = ra2pa(0xa8114000,0),
    RA = 0xa8114000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x17c8cda97cc63da6
    .xword 0x88cd70a6d30e1956
    .xword 0x77d3c28c7a3abca4
    .xword 0x2cc9e8149161b0f3
    .xword 0x6fc6cb5eb274e71a
    .xword 0x1a96644a7e9689bc
    .xword 0x56403eaeb56728c7
    .xword 0x125e99d8542d5610



SECTION .DATA_CORE15_3 DATA_VA=0xa8116000
attr_data {
    Name = .DATA_CORE15_3,
    VA = 0xa8116000,
    PA = ra2pa(0xa8116000,0),
    RA = 0xa8116000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x6cdb2d1b62d1e860
    .xword 0xadcd81d8d1a6b511
    .xword 0x7b7ad3ef555797c6
    .xword 0xe91705a3029bda39
    .xword 0x730867cb515f3913
    .xword 0xc417922e12e5f095
    .xword 0xacf315ca518409d5
    .xword 0x1546e8e28f416b63



SECTION .DATA_CORE15_4 DATA_VA=0xa8118000
attr_data {
    Name = .DATA_CORE15_4,
    VA = 0xa8118000,
    PA = ra2pa(0xa8118000,0),
    RA = 0xa8118000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0xcfcc0c1d68b94801
    .xword 0xf9614c4f8e81c745
    .xword 0xacbf2fef10793114
    .xword 0xd473acec87871e96
    .xword 0x9b15ffd0fc650f2c
    .xword 0x7895defff61e5236
    .xword 0x2af016dbb26da66f
    .xword 0x40efc371840072e5



SECTION .DATA_CORE15_5 DATA_VA=0xa811a000
attr_data {
    Name = .DATA_CORE15_5,
    VA = 0xa811a000,
    PA = ra2pa(0xa811a000,0),
    RA = 0xa811a000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0xa9fe17e720326c24
    .xword 0x6630cbdd4ed4a34d
    .xword 0x4cf1667c0edf7e63
    .xword 0xaf91641d7c7cd624
    .xword 0x268100a6978de991
    .xword 0x25d6d9179e7d6aaf
    .xword 0x89e192a736329d8b
    .xword 0xaf39ab33ba9a403



SECTION .DATA_CORE15_6 DATA_VA=0xa811c000
attr_data {
    Name = .DATA_CORE15_6,
    VA = 0xa811c000,
    PA = ra2pa(0xa811c000,0),
    RA = 0xa811c000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x6cebc485cb7b9d6b
    .xword 0x25e889569805ccef
    .xword 0x3f17b92b73d35d81
    .xword 0x458054178d3dd0e6
    .xword 0xfc3fec920ef84f20
    .xword 0xf76a6ee4c5078a35
    .xword 0x7405569cacc245d3
    .xword 0x555e261affabc490



SECTION .DATA_CORE15_7 DATA_VA=0xa811e000
attr_data {
    Name = .DATA_CORE15_7,
    VA = 0xa811e000,
    PA = ra2pa(0xa811e000,0),
    RA = 0xa811e000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x5bd12fc9cf51156e
    .xword 0x5e2dc6e31dbbcb34
    .xword 0x7fea1e631e63e3ef
    .xword 0x7d0dadf822eca45
    .xword 0x64066863406aab1a
    .xword 0xb31529f31c50101e
    .xword 0x4c8fa1e986a414f0
    .xword 0xd41fe7d7a15b76c0



SECTION .DATA_CORE16_0 DATA_VA=0xa8120000
attr_data {
    Name = .DATA_CORE16_0,
    VA = 0xa8120000,
    PA = ra2pa(0xa8120000,0),
    RA = 0xa8120000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .global data_core_16
data_core_16:
    .align  PITON_L1D_WAY_SIZE
    .xword 0x20735fb694fdde63
    .xword 0x19d626ec0be3fe64
    .xword 0x4636f42756dd6854
    .xword 0xc048a0d50e1a10ee
    .xword 0x58e93884b1c74a3f
    .xword 0xe4caec5d282d98dc
    .xword 0x33f4be6687b7c957
    .xword 0x9ba6a0d114b902b1



SECTION .DATA_CORE16_1 DATA_VA=0xa8122000
attr_data {
    Name = .DATA_CORE16_1,
    VA = 0xa8122000,
    PA = ra2pa(0xa8122000,0),
    RA = 0xa8122000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x27dc35bd27114c5d
    .xword 0xa2d83252f1ac27e7
    .xword 0x48ccc2a663d30edf
    .xword 0x8e04395f015fdfbc
    .xword 0xe2deb19dd919c1f4
    .xword 0xdf7f6af389577d4
    .xword 0xdf837fc037543edf
    .xword 0x4267c2c07ab66823



SECTION .DATA_CORE16_2 DATA_VA=0xa8124000
attr_data {
    Name = .DATA_CORE16_2,
    VA = 0xa8124000,
    PA = ra2pa(0xa8124000,0),
    RA = 0xa8124000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0xe30ece6e66a5c75b
    .xword 0xc679b0f2de2150da
    .xword 0x6b297002bf73914b
    .xword 0x9570d174410ba1aa
    .xword 0x3fb44afc71ec43ac
    .xword 0x7091e4fe8bb45962
    .xword 0x24c0b02592c6c488
    .xword 0xb1e3dd1950b2db39



SECTION .DATA_CORE16_3 DATA_VA=0xa8126000
attr_data {
    Name = .DATA_CORE16_3,
    VA = 0xa8126000,
    PA = ra2pa(0xa8126000,0),
    RA = 0xa8126000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x4a6391c72441370b
    .xword 0x2f7aab0b0564a3e6
    .xword 0x90fbe1b955c640b7
    .xword 0xc2843b5ac7b63769
    .xword 0x1618d66ff78afa89
    .xword 0x43dcf8ee44602394
    .xword 0xcf634da6b92330d3
    .xword 0x12f17d09454a0281



SECTION .DATA_CORE16_4 DATA_VA=0xa8128000
attr_data {
    Name = .DATA_CORE16_4,
    VA = 0xa8128000,
    PA = ra2pa(0xa8128000,0),
    RA = 0xa8128000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0xc72c491ebf3a5d50
    .xword 0xce870057ed10eb6c
    .xword 0xf219d57e64f74aa3
    .xword 0x8671d12520bdb46f
    .xword 0xa1717836b3b0a987
    .xword 0x4e2f180981dfcd9f
    .xword 0xc45ea49cfd5d2a34
    .xword 0x468b3d629affee01



SECTION .DATA_CORE16_5 DATA_VA=0xa812a000
attr_data {
    Name = .DATA_CORE16_5,
    VA = 0xa812a000,
    PA = ra2pa(0xa812a000,0),
    RA = 0xa812a000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x79bafb67f3fc656d
    .xword 0xaad66024724f87fe
    .xword 0x86eb9484bb9bf0d3
    .xword 0x4fee32632b074840
    .xword 0x1aac23914f33c270
    .xword 0xf03ef2e66c93ebee
    .xword 0x422233482ae6be8a
    .xword 0x64359769834254cd



SECTION .DATA_CORE16_6 DATA_VA=0xa812c000
attr_data {
    Name = .DATA_CORE16_6,
    VA = 0xa812c000,
    PA = ra2pa(0xa812c000,0),
    RA = 0xa812c000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0xe7eca8d154339dc6
    .xword 0x952e42d95dc318bc
    .xword 0xdc7042b07ecfe398
    .xword 0x9c5afb994fb8168f
    .xword 0x16917db212c34ced
    .xword 0xb8ffdc2b5ae83c70
    .xword 0x529421b733dbf362
    .xword 0xfd96c509fc46e523



SECTION .DATA_CORE16_7 DATA_VA=0xa812e000
attr_data {
    Name = .DATA_CORE16_7,
    VA = 0xa812e000,
    PA = ra2pa(0xa812e000,0),
    RA = 0xa812e000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0xa208dce120b35f10
    .xword 0x1b575d998ef75d15
    .xword 0xba0faef5977a7ce3
    .xword 0xff83417de6efec6d
    .xword 0x9aacecf8528fae16
    .xword 0x76a36588eddb9006
    .xword 0x3491dd8b45c54ea4
    .xword 0x76200185dfc91c33



SECTION .DATA_CORE17_0 DATA_VA=0xa8130000
attr_data {
    Name = .DATA_CORE17_0,
    VA = 0xa8130000,
    PA = ra2pa(0xa8130000,0),
    RA = 0xa8130000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .global data_core_17
data_core_17:
    .align  PITON_L1D_WAY_SIZE
    .xword 0x7e051b43190f6b91
    .xword 0xe371fb1356b596a1
    .xword 0xe36b9adc54b8e862
    .xword 0x383ac6f2ce9164e1
    .xword 0x1a0672b31e7f1310
    .xword 0xc3ae8be4f82bd7c2
    .xword 0x53e81a71fa424913
    .xword 0x6f8a9a5969bac226



SECTION .DATA_CORE17_1 DATA_VA=0xa8132000
attr_data {
    Name = .DATA_CORE17_1,
    VA = 0xa8132000,
    PA = ra2pa(0xa8132000,0),
    RA = 0xa8132000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0xd0c068cc1e4549ba
    .xword 0xfa88961e4d3b3717
    .xword 0xddd5fffb2e09ab4
    .xword 0xec1ed1e97da532f
    .xword 0x59ac4d181ec02877
    .xword 0xf4d7f6d56045831e
    .xword 0xbbd791d9b13c38f6
    .xword 0x65fdebac532e3ea4



SECTION .DATA_CORE17_2 DATA_VA=0xa8134000
attr_data {
    Name = .DATA_CORE17_2,
    VA = 0xa8134000,
    PA = ra2pa(0xa8134000,0),
    RA = 0xa8134000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x2e6a6c488d3af268
    .xword 0xb3305b8ee331d25
    .xword 0xd5278f96af5bae1b
    .xword 0x32bc0224db865962
    .xword 0x5dc85722b3d2796
    .xword 0xd9dba2a279e5ec1f
    .xword 0x633f43e9591582a9
    .xword 0xb9f4c0c54290ed4b



SECTION .DATA_CORE17_3 DATA_VA=0xa8136000
attr_data {
    Name = .DATA_CORE17_3,
    VA = 0xa8136000,
    PA = ra2pa(0xa8136000,0),
    RA = 0xa8136000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0xa76e9ded7e04ad7b
    .xword 0xcb31c8657a0d37da
    .xword 0xf80d2766ab61385c
    .xword 0x55533ac9bcfcdff7
    .xword 0x2212b7b5ee0c72ab
    .xword 0x596016cc8dac8482
    .xword 0xc939ceb2edd2443a
    .xword 0xf41b1b6f34cfa1d0



SECTION .DATA_CORE17_4 DATA_VA=0xa8138000
attr_data {
    Name = .DATA_CORE17_4,
    VA = 0xa8138000,
    PA = ra2pa(0xa8138000,0),
    RA = 0xa8138000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x4d022e4fc551543
    .xword 0x4ad16946ef5975dd
    .xword 0x1ad2044684d34a53
    .xword 0x32a30c0e8d9ebd23
    .xword 0xa824b7e33faa588a
    .xword 0xa0710b6e5bac7bf6
    .xword 0xa526bc8f03f6e72e
    .xword 0xa5f9539a7bd7a992



SECTION .DATA_CORE17_5 DATA_VA=0xa813a000
attr_data {
    Name = .DATA_CORE17_5,
    VA = 0xa813a000,
    PA = ra2pa(0xa813a000,0),
    RA = 0xa813a000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x62613d460acd9bc
    .xword 0xa9b7cad0fdfe7167
    .xword 0xc78c347d227fa42
    .xword 0x3b6ce0874fddb6cd
    .xword 0xdd4c66dac1695c1d
    .xword 0x84f48018a25c64b3
    .xword 0x253f0618c13804ab
    .xword 0x2b4ff87d9baac275



SECTION .DATA_CORE17_6 DATA_VA=0xa813c000
attr_data {
    Name = .DATA_CORE17_6,
    VA = 0xa813c000,
    PA = ra2pa(0xa813c000,0),
    RA = 0xa813c000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x4e2679c8be8792c5
    .xword 0x9ff81f4714e3247a
    .xword 0x9a3809026d867584
    .xword 0x742dae38e315100b
    .xword 0x1a647578675312b1
    .xword 0xa85a18d931e7579d
    .xword 0x408ee89f466cc956
    .xword 0x21be405d78f3d1a9



SECTION .DATA_CORE17_7 DATA_VA=0xa813e000
attr_data {
    Name = .DATA_CORE17_7,
    VA = 0xa813e000,
    PA = ra2pa(0xa813e000,0),
    RA = 0xa813e000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x15e29f221517c1a1
    .xword 0x2f4c9338597eb418
    .xword 0x4a63311a1e6b23d6
    .xword 0xf6590fae26dd736b
    .xword 0x607e0fb6bb69be35
    .xword 0xbf02494f01c4d261
    .xword 0x60f6a6026aaf8857
    .xword 0xde0c3aa35528e85a



SECTION .DATA_CORE18_0 DATA_VA=0xa8140000
attr_data {
    Name = .DATA_CORE18_0,
    VA = 0xa8140000,
    PA = ra2pa(0xa8140000,0),
    RA = 0xa8140000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .global data_core_18
data_core_18:
    .align  PITON_L1D_WAY_SIZE
    .xword 0x8c78604933d2deb
    .xword 0x213baab5d71e5079
    .xword 0x1b0021c4db2d24c7
    .xword 0x65e8824053bed96a
    .xword 0xce7ed84343bdfa17
    .xword 0x955e1afcac78a04
    .xword 0xd8c3a5b7a3780c58
    .xword 0xbea48c4d526f6dcf



SECTION .DATA_CORE18_1 DATA_VA=0xa8142000
attr_data {
    Name = .DATA_CORE18_1,
    VA = 0xa8142000,
    PA = ra2pa(0xa8142000,0),
    RA = 0xa8142000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0xf89feda300ecf107
    .xword 0x444a6509371a6c4f
    .xword 0x42ae99a48a5030d4
    .xword 0xbb32846404759aa7
    .xword 0xf43afc3dab857c48
    .xword 0xa72bf9daa1515ff5
    .xword 0xa84edd2af85a3bea
    .xword 0x9d78faa44b587381



SECTION .DATA_CORE18_2 DATA_VA=0xa8144000
attr_data {
    Name = .DATA_CORE18_2,
    VA = 0xa8144000,
    PA = ra2pa(0xa8144000,0),
    RA = 0xa8144000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x4a76c6cd8e5d0a2e
    .xword 0x389a01864035301e
    .xword 0xe432d35bce291b9d
    .xword 0x74329e68e6dab381
    .xword 0x36f52973b1897ade
    .xword 0xf0abe5ac397e23a3
    .xword 0xb008df2c3b8f2303
    .xword 0x64211f6489c8d4e0



SECTION .DATA_CORE18_3 DATA_VA=0xa8146000
attr_data {
    Name = .DATA_CORE18_3,
    VA = 0xa8146000,
    PA = ra2pa(0xa8146000,0),
    RA = 0xa8146000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0xaef18783da49c6ee
    .xword 0x620afa79f992d032
    .xword 0x742ab25e0168b350
    .xword 0xee20b03bf1b2cb00
    .xword 0x119a332d4655f9af
    .xword 0x7279fc2db25740a4
    .xword 0x626e0d0bb534afd3
    .xword 0xd40942648b633e4a



SECTION .DATA_CORE18_4 DATA_VA=0xa8148000
attr_data {
    Name = .DATA_CORE18_4,
    VA = 0xa8148000,
    PA = ra2pa(0xa8148000,0),
    RA = 0xa8148000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x7fa0d3745355ce0a
    .xword 0x49118a818b4f2436
    .xword 0x9f47bfd5bca2f04e
    .xword 0x9c420cc20115ecf2
    .xword 0xbd5fef3eb5cc8600
    .xword 0x76baff01b571ffed
    .xword 0xde65d2d18d1b6e55
    .xword 0x6d7feb431fd112a5



SECTION .DATA_CORE18_5 DATA_VA=0xa814a000
attr_data {
    Name = .DATA_CORE18_5,
    VA = 0xa814a000,
    PA = ra2pa(0xa814a000,0),
    RA = 0xa814a000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x6ee2d927a2c46dbb
    .xword 0x5b619fd25819f1cd
    .xword 0x6b36a8a5a1e0c421
    .xword 0x3411eb541b91fc90
    .xword 0xf4e3676cecf6e6f4
    .xword 0x4a0d9b8edb64841c
    .xword 0x204c847c5d5e5ab4
    .xword 0xe02def14e04639f8



SECTION .DATA_CORE18_6 DATA_VA=0xa814c000
attr_data {
    Name = .DATA_CORE18_6,
    VA = 0xa814c000,
    PA = ra2pa(0xa814c000,0),
    RA = 0xa814c000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0xd7ccdbc5e5e5c4ac
    .xword 0xa35f6eb011b3641a
    .xword 0x9197c07838de9fc8
    .xword 0x5e4741e5240aeb8f
    .xword 0xe8dc1b00918f53f7
    .xword 0xf8d96aa51cebeafb
    .xword 0x81b9f984c6941751
    .xword 0xc1a178688ca79d91



SECTION .DATA_CORE18_7 DATA_VA=0xa814e000
attr_data {
    Name = .DATA_CORE18_7,
    VA = 0xa814e000,
    PA = ra2pa(0xa814e000,0),
    RA = 0xa814e000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x5343e0a615b98cc0
    .xword 0x9b92d10565cd881a
    .xword 0xc6aa5602225fce2b
    .xword 0x769b7289222c6e90
    .xword 0x301f7b1cc9f765
    .xword 0xc2ab58da1a8ad6f8
    .xword 0x19e6d50c970408db
    .xword 0x9a9d8a5b8e3a53d



SECTION .DATA_CORE19_0 DATA_VA=0xa8150000
attr_data {
    Name = .DATA_CORE19_0,
    VA = 0xa8150000,
    PA = ra2pa(0xa8150000,0),
    RA = 0xa8150000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .global data_core_19
data_core_19:
    .align  PITON_L1D_WAY_SIZE
    .xword 0x2e30c7dd98729903
    .xword 0x3af463ebb9c84aa6
    .xword 0x8034818e43d40e98
    .xword 0xe213bf189e9e1213
    .xword 0xd1d851645bdcd7c1
    .xword 0x5694dd82685dcd16
    .xword 0x2aa80640b660b119
    .xword 0x450b4abef37ba250



SECTION .DATA_CORE19_1 DATA_VA=0xa8152000
attr_data {
    Name = .DATA_CORE19_1,
    VA = 0xa8152000,
    PA = ra2pa(0xa8152000,0),
    RA = 0xa8152000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x2cebfe0f463261f4
    .xword 0xf4b80b50cc52a7
    .xword 0x14247fd38dcafe9f
    .xword 0xf306954fed2ed406
    .xword 0x8ed4611edeef6c7d
    .xword 0x8b67a9a7078d9fd6
    .xword 0xaa9111c6918d178e
    .xword 0x3ad5144e7d3f33fa



SECTION .DATA_CORE19_2 DATA_VA=0xa8154000
attr_data {
    Name = .DATA_CORE19_2,
    VA = 0xa8154000,
    PA = ra2pa(0xa8154000,0),
    RA = 0xa8154000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x7e83f50bc5151f9a
    .xword 0x4a8072493d191bea
    .xword 0x6ef00efb5e274cc6
    .xword 0xda3cacedb60dac81
    .xword 0xef553f5f0c1e95af
    .xword 0x5bb91ab6367dfbdf
    .xword 0x60ea604bfc7aeecb
    .xword 0x565793775ef12376



SECTION .DATA_CORE19_3 DATA_VA=0xa8156000
attr_data {
    Name = .DATA_CORE19_3,
    VA = 0xa8156000,
    PA = ra2pa(0xa8156000,0),
    RA = 0xa8156000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x61445def4bd80166
    .xword 0xa022f908dd95710d
    .xword 0xe247d034c8205cc1
    .xword 0x50139830a82cd269
    .xword 0xba8a2c69f7560911
    .xword 0x2748fad94eba8846
    .xword 0xb2a4db9c2bdd0351
    .xword 0x2109e127fbf030e9



SECTION .DATA_CORE19_4 DATA_VA=0xa8158000
attr_data {
    Name = .DATA_CORE19_4,
    VA = 0xa8158000,
    PA = ra2pa(0xa8158000,0),
    RA = 0xa8158000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x7925dc1cff9c9003
    .xword 0x592246f571c5becc
    .xword 0x614a162acf84ba07
    .xword 0xd14863cd9a1c0ea2
    .xword 0x97670ab44676a88b
    .xword 0x52ee1403d0deb5d7
    .xword 0xb27bad32ea2f8fea
    .xword 0xb193f174ab85d733



SECTION .DATA_CORE19_5 DATA_VA=0xa815a000
attr_data {
    Name = .DATA_CORE19_5,
    VA = 0xa815a000,
    PA = ra2pa(0xa815a000,0),
    RA = 0xa815a000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x50b09520a2064d51
    .xword 0x69b9bf3733d69301
    .xword 0x609463a68489a786
    .xword 0xd5982c84da68ef05
    .xword 0x5cce5b71e93946ff
    .xword 0x31ec1c5001d6467d
    .xword 0x1c3dee512bbf9333
    .xword 0xa2d583d56153473d



SECTION .DATA_CORE19_6 DATA_VA=0xa815c000
attr_data {
    Name = .DATA_CORE19_6,
    VA = 0xa815c000,
    PA = ra2pa(0xa815c000,0),
    RA = 0xa815c000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0xe11f20acfc9e3cfd
    .xword 0xb354c472bb13db8f
    .xword 0x22636ec48f5d9d88
    .xword 0x74ab42b3ebed0e0b
    .xword 0x38ad30d6380ba17f
    .xword 0x9796b0bb6db78947
    .xword 0x73fd03a5478dbd67
    .xword 0x9216213fef1a0cca



SECTION .DATA_CORE19_7 DATA_VA=0xa815e000
attr_data {
    Name = .DATA_CORE19_7,
    VA = 0xa815e000,
    PA = ra2pa(0xa815e000,0),
    RA = 0xa815e000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x9faab152ae94a2eb
    .xword 0xa382f7b76aa77c94
    .xword 0xd0bcbaaefef958f4
    .xword 0x92343994683eccfa
    .xword 0xbe9e5b9839d669da
    .xword 0x23217061003422f1
    .xword 0xe4d3baba8e568cbd
    .xword 0xac7c8e399da0856c



SECTION .DATA_CORE20_0 DATA_VA=0xa8160000
attr_data {
    Name = .DATA_CORE20_0,
    VA = 0xa8160000,
    PA = ra2pa(0xa8160000,0),
    RA = 0xa8160000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .global data_core_20
data_core_20:
    .align  PITON_L1D_WAY_SIZE
    .xword 0xee20a2e82d5dd70a
    .xword 0x73134fe6d2359997
    .xword 0xe315e638cea63f6f
    .xword 0xf5bb06b78b689c3a
    .xword 0x9061e3b9a714a64d
    .xword 0xb07381ec722cef5a
    .xword 0x33f31c731b20b5da
    .xword 0xe6853f856e093a83



SECTION .DATA_CORE20_1 DATA_VA=0xa8162000
attr_data {
    Name = .DATA_CORE20_1,
    VA = 0xa8162000,
    PA = ra2pa(0xa8162000,0),
    RA = 0xa8162000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x4d598f6153d8902e
    .xword 0x2a707da7180013b6
    .xword 0x999bcf893892492f
    .xword 0x7bb714a688bf5c60
    .xword 0x58a36dfd01ec41de
    .xword 0x1d25e4b64f39b273
    .xword 0x6dbb6c851d493bf1
    .xword 0x4b7f3bc7619b2079



SECTION .DATA_CORE20_2 DATA_VA=0xa8164000
attr_data {
    Name = .DATA_CORE20_2,
    VA = 0xa8164000,
    PA = ra2pa(0xa8164000,0),
    RA = 0xa8164000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x9f64b9cdd90b8424
    .xword 0x2a2530b8cb85b778
    .xword 0x20cc1071439fd171
    .xword 0x5dcd78a783604864
    .xword 0x34343b6f14e5139f
    .xword 0x1c95bcf820408b37
    .xword 0x637ac945fb2c97e6
    .xword 0xfc6e04cd8356a204



SECTION .DATA_CORE20_3 DATA_VA=0xa8166000
attr_data {
    Name = .DATA_CORE20_3,
    VA = 0xa8166000,
    PA = ra2pa(0xa8166000,0),
    RA = 0xa8166000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0xb88d468c37f5781a
    .xword 0xe2c3a279a979f1c2
    .xword 0x3d13b9577224ec85
    .xword 0x508cc72f3a33e2af
    .xword 0x55e42b8d8b4de4f2
    .xword 0xbfed046ffec7a5f
    .xword 0x5c554fe928477fec
    .xword 0xcc6f7eb0ae11247b



SECTION .DATA_CORE20_4 DATA_VA=0xa8168000
attr_data {
    Name = .DATA_CORE20_4,
    VA = 0xa8168000,
    PA = ra2pa(0xa8168000,0),
    RA = 0xa8168000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x11b5aa76c6559856
    .xword 0x2fce8c89e6a57ff5
    .xword 0xe306e11bda424602
    .xword 0x6538aa1555313dcd
    .xword 0x5908d7d22aa8b81d
    .xword 0x1fb0cd98daf47f1f
    .xword 0xec0fe15418319503
    .xword 0xb0f75cc44cdc9956



SECTION .DATA_CORE20_5 DATA_VA=0xa816a000
attr_data {
    Name = .DATA_CORE20_5,
    VA = 0xa816a000,
    PA = ra2pa(0xa816a000,0),
    RA = 0xa816a000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x1f88939ddd085ef9
    .xword 0xe36f1df70577c0c4
    .xword 0x3db553dae858088d
    .xword 0x9bea06267607cb24
    .xword 0x61d5adf34aa11226
    .xword 0x57870ab24cc2fbcd
    .xword 0xf6f1fbf1e7bc7340
    .xword 0x1582e0105497697c



SECTION .DATA_CORE20_6 DATA_VA=0xa816c000
attr_data {
    Name = .DATA_CORE20_6,
    VA = 0xa816c000,
    PA = ra2pa(0xa816c000,0),
    RA = 0xa816c000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0xde3bb80e472eee73
    .xword 0x358ee2efcfa7586d
    .xword 0x69c70c0586e90642
    .xword 0x8c9b87ec319dd6d2
    .xword 0xc577fcb3e27bd491
    .xword 0x6a3e9b6f92bc1ed
    .xword 0xa078c690c7a08354
    .xword 0xc099a492a27414fd



SECTION .DATA_CORE20_7 DATA_VA=0xa816e000
attr_data {
    Name = .DATA_CORE20_7,
    VA = 0xa816e000,
    PA = ra2pa(0xa816e000,0),
    RA = 0xa816e000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x54ac2cac0c105fc6
    .xword 0x21573c15fd626d6c
    .xword 0xc056f53e614ac6d8
    .xword 0x3fc221c467f25266
    .xword 0x64315508a599de8d
    .xword 0x83bf4499b1766c7b
    .xword 0xcffcd89d77815d93
    .xword 0xe042770eb4a84325



SECTION .DATA_CORE21_0 DATA_VA=0xa8170000
attr_data {
    Name = .DATA_CORE21_0,
    VA = 0xa8170000,
    PA = ra2pa(0xa8170000,0),
    RA = 0xa8170000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .global data_core_21
data_core_21:
    .align  PITON_L1D_WAY_SIZE
    .xword 0x790e17a4d1a3e8dc
    .xword 0xd19f1c8b8d34dde0
    .xword 0xdb30a402ff2fc20c
    .xword 0x86f4678f30005e72
    .xword 0xc60fb1d0943ebf63
    .xword 0xd5780c8b0f6c4574
    .xword 0x3d4eb92f1318bb78
    .xword 0xbd41c87631a1cc48



SECTION .DATA_CORE21_1 DATA_VA=0xa8172000
attr_data {
    Name = .DATA_CORE21_1,
    VA = 0xa8172000,
    PA = ra2pa(0xa8172000,0),
    RA = 0xa8172000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0xa412e48c9e79d752
    .xword 0x15d2d9f7fa26e670
    .xword 0x5c66e627407c15b3
    .xword 0xd445c59d7193cd2c
    .xword 0xe0a477b91aa9e96e
    .xword 0x8e452dbe3a147652
    .xword 0x4bbf4c16ca9dce28
    .xword 0xb1119ae5375b900a



SECTION .DATA_CORE21_2 DATA_VA=0xa8174000
attr_data {
    Name = .DATA_CORE21_2,
    VA = 0xa8174000,
    PA = ra2pa(0xa8174000,0),
    RA = 0xa8174000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x43f8405aaef27a64
    .xword 0x52a51fe2234e81d9
    .xword 0x11556c9df449cc59
    .xword 0xb5cb098a14feeac6
    .xword 0xfcc7c90064f17a14
    .xword 0xd1f8ec2ce95a24d0
    .xword 0x5ff18dc1dfcdcc15
    .xword 0xc9a8ae704a85b0a1



SECTION .DATA_CORE21_3 DATA_VA=0xa8176000
attr_data {
    Name = .DATA_CORE21_3,
    VA = 0xa8176000,
    PA = ra2pa(0xa8176000,0),
    RA = 0xa8176000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0xe71a59ef3c355885
    .xword 0xa2bbe7d6e0d7eeee
    .xword 0x42204871139ebd1e
    .xword 0x7db2a9401af66289
    .xword 0xad1e854903982735
    .xword 0x3e77a95b423fd01f
    .xword 0x5c0d92e3f01b3bd
    .xword 0x7d90d7b6512401f0



SECTION .DATA_CORE21_4 DATA_VA=0xa8178000
attr_data {
    Name = .DATA_CORE21_4,
    VA = 0xa8178000,
    PA = ra2pa(0xa8178000,0),
    RA = 0xa8178000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x1cc7f526d75f8525
    .xword 0x9639dd6b947d0d29
    .xword 0xf93c755d90664bbb
    .xword 0x7b1fd14aa0aafa62
    .xword 0x1c17ede89c68e6f9
    .xword 0xebd0d921a01a3ddd
    .xword 0x38e40b4dfc06466c
    .xword 0x89b400e6a3b13bd1



SECTION .DATA_CORE21_5 DATA_VA=0xa817a000
attr_data {
    Name = .DATA_CORE21_5,
    VA = 0xa817a000,
    PA = ra2pa(0xa817a000,0),
    RA = 0xa817a000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0xf80ab03d285801b
    .xword 0x7aca255288eecd45
    .xword 0x84c28f21aaef4dd5
    .xword 0xa7cf637f7df9d7db
    .xword 0xbea59da939c339e
    .xword 0xf354bb61695ee14d
    .xword 0xd4291e8cceefbafb
    .xword 0xc21b58594f3cf753



SECTION .DATA_CORE21_6 DATA_VA=0xa817c000
attr_data {
    Name = .DATA_CORE21_6,
    VA = 0xa817c000,
    PA = ra2pa(0xa817c000,0),
    RA = 0xa817c000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x4c3b6a0c59fd8fd3
    .xword 0xed75434319a2f3dc
    .xword 0x1fa9b4c888f5ef24
    .xword 0xe2520c9aa17c8a07
    .xword 0x4a4b8cc41fd61d6b
    .xword 0x841305e2360725d2
    .xword 0xc9e5a47a12ddb726
    .xword 0x29a7d19a0a9cd960



SECTION .DATA_CORE21_7 DATA_VA=0xa817e000
attr_data {
    Name = .DATA_CORE21_7,
    VA = 0xa817e000,
    PA = ra2pa(0xa817e000,0),
    RA = 0xa817e000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x752847024efc7ab5
    .xword 0x973c68f1fb21197d
    .xword 0x79c8e7cb16fa9a15
    .xword 0x2312a59a07b3a938
    .xword 0xada6b1b55fec8e96
    .xword 0x2adf8fefe856304e
    .xword 0x2105a9d73e597b6
    .xword 0xff4000094bb6ff58



SECTION .DATA_CORE22_0 DATA_VA=0xa8180000
attr_data {
    Name = .DATA_CORE22_0,
    VA = 0xa8180000,
    PA = ra2pa(0xa8180000,0),
    RA = 0xa8180000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .global data_core_22
data_core_22:
    .align  PITON_L1D_WAY_SIZE
    .xword 0x4013d1db879d586f
    .xword 0x3e70b8eb9158b8fa
    .xword 0xd0dc6ec30cb27c4
    .xword 0x2c951afb016940f7
    .xword 0xf88b18c7dfdc016f
    .xword 0xa6c4fdeb8d56f55e
    .xword 0x86119af24949950b
    .xword 0x541e59eaca24f229



SECTION .DATA_CORE22_1 DATA_VA=0xa8182000
attr_data {
    Name = .DATA_CORE22_1,
    VA = 0xa8182000,
    PA = ra2pa(0xa8182000,0),
    RA = 0xa8182000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x109245257bc2cbdf
    .xword 0xf970b9161bf49a07
    .xword 0x298f3ccc749d143e
    .xword 0x7b0c4dcee078bae
    .xword 0xcd40192ee20b7f3f
    .xword 0x86a3eb4f01395607
    .xword 0x1bd1733a86f70d59
    .xword 0xa6835a1f7fabece0



SECTION .DATA_CORE22_2 DATA_VA=0xa8184000
attr_data {
    Name = .DATA_CORE22_2,
    VA = 0xa8184000,
    PA = ra2pa(0xa8184000,0),
    RA = 0xa8184000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x807b215a77c3c954
    .xword 0xc3c5d1458cb8265c
    .xword 0x9e232ada05fd3d21
    .xword 0xa37527b4306a925d
    .xword 0x11ba47d4c38791ee
    .xword 0x5b76f547492ab71e
    .xword 0xcf7d00061fb9f44e
    .xword 0xb29f94eb054d7157



SECTION .DATA_CORE22_3 DATA_VA=0xa8186000
attr_data {
    Name = .DATA_CORE22_3,
    VA = 0xa8186000,
    PA = ra2pa(0xa8186000,0),
    RA = 0xa8186000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x56fae6372670f07c
    .xword 0x6644c88cfc66797e
    .xword 0xe3c5d2059c1e4b7e
    .xword 0x20b9797a2e0685de
    .xword 0x6403cd58b0a3a8a6
    .xword 0xc5ea0f41d941ed15
    .xword 0x595f9c83aafc1a50
    .xword 0x169508912bab32e



SECTION .DATA_CORE22_4 DATA_VA=0xa8188000
attr_data {
    Name = .DATA_CORE22_4,
    VA = 0xa8188000,
    PA = ra2pa(0xa8188000,0),
    RA = 0xa8188000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x1772de9cecb19780
    .xword 0x4faab3fb0574fd7a
    .xword 0x90122861eca55b95
    .xword 0x4c2d697f3425dfe9
    .xword 0xbc3a038f054755d
    .xword 0xa2334757cf0a723c
    .xword 0x1210e87e8aa93d45
    .xword 0xca0209c3a6f614e2



SECTION .DATA_CORE22_5 DATA_VA=0xa818a000
attr_data {
    Name = .DATA_CORE22_5,
    VA = 0xa818a000,
    PA = ra2pa(0xa818a000,0),
    RA = 0xa818a000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x991bbcbe923b11de
    .xword 0x18af8d8d26945145
    .xword 0x6b0a9f2d396f62f2
    .xword 0x40917bb3a3511f2f
    .xword 0xfeadaba5d4fa70da
    .xword 0xe95d6db42c7f6b31
    .xword 0x4f22f5709024cf07
    .xword 0xbc41119c2ce498f5



SECTION .DATA_CORE22_6 DATA_VA=0xa818c000
attr_data {
    Name = .DATA_CORE22_6,
    VA = 0xa818c000,
    PA = ra2pa(0xa818c000,0),
    RA = 0xa818c000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x26f1a25c4f82e13c
    .xword 0xe9f649938082a1ad
    .xword 0xfc1feb139d8ce8c8
    .xword 0x392fc1879f59ac61
    .xword 0x5acf880afac611fe
    .xword 0x77cec5ecf9b7ef47
    .xword 0x585e743bb9a54e68
    .xword 0x296a0735ec52a56d



SECTION .DATA_CORE22_7 DATA_VA=0xa818e000
attr_data {
    Name = .DATA_CORE22_7,
    VA = 0xa818e000,
    PA = ra2pa(0xa818e000,0),
    RA = 0xa818e000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0xc10273a8d47b71e1
    .xword 0x584e4dd43cf2258d
    .xword 0x61a1e333a6b33c9
    .xword 0x7259fbc9d40d8344
    .xword 0xf8ce4dd8a92bb060
    .xword 0x870768a1b04a472
    .xword 0x979b48e25f104ed
    .xword 0x332a71e3fc618daf



SECTION .DATA_CORE23_0 DATA_VA=0xa8190000
attr_data {
    Name = .DATA_CORE23_0,
    VA = 0xa8190000,
    PA = ra2pa(0xa8190000,0),
    RA = 0xa8190000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .global data_core_23
data_core_23:
    .align  PITON_L1D_WAY_SIZE
    .xword 0xa1bbb3eabeb2cb2d
    .xword 0x20ee93da96d2bfd0
    .xword 0xb06782e38b2837f1
    .xword 0x55cd449a2ea737d8
    .xword 0x54e1ea1bcaae8e6e
    .xword 0x651db2c8961a0bea
    .xword 0xf6570a7bea48944
    .xword 0x9dbc3c6262c520f6



SECTION .DATA_CORE23_1 DATA_VA=0xa8192000
attr_data {
    Name = .DATA_CORE23_1,
    VA = 0xa8192000,
    PA = ra2pa(0xa8192000,0),
    RA = 0xa8192000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x4d95b6ca35246384
    .xword 0xa3a106e9f7e9b251
    .xword 0x3b79532453fda2a7
    .xword 0x492699f14860ab6c
    .xword 0x91b2411e5aecbcd7
    .xword 0x8a7ea1e48b71de00
    .xword 0xa2d4bb992ab50c55
    .xword 0xf10b4989319df119



SECTION .DATA_CORE23_2 DATA_VA=0xa8194000
attr_data {
    Name = .DATA_CORE23_2,
    VA = 0xa8194000,
    PA = ra2pa(0xa8194000,0),
    RA = 0xa8194000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0xb42bd59c59db718b
    .xword 0xb9a355f93892051c
    .xword 0x760d8dfe213a7c42
    .xword 0xa00c9a7ce068e49d
    .xword 0xd02c5a27df71d6b8
    .xword 0x121d72728aed950
    .xword 0x356c5562aae6851a
    .xword 0x3c6dcfe13ef39367



SECTION .DATA_CORE23_3 DATA_VA=0xa8196000
attr_data {
    Name = .DATA_CORE23_3,
    VA = 0xa8196000,
    PA = ra2pa(0xa8196000,0),
    RA = 0xa8196000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x4543c729d02b158
    .xword 0x6ca1a71d53b048a7
    .xword 0xbaebe7a00dbec038
    .xword 0x8af833985b5764c0
    .xword 0xe6ed5f3643f48e3e
    .xword 0xd8333815beb3e37e
    .xword 0xd5917b1a4962201d
    .xword 0x2e566993f8347839



SECTION .DATA_CORE23_4 DATA_VA=0xa8198000
attr_data {
    Name = .DATA_CORE23_4,
    VA = 0xa8198000,
    PA = ra2pa(0xa8198000,0),
    RA = 0xa8198000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0xe72eb8df4c6dc776
    .xword 0x8209effff1dd1fc2
    .xword 0x6817064aa0fff030
    .xword 0x197d390fcd299cce
    .xword 0xea6ae90d7e8a163e
    .xword 0xe0259e1b4c44ce4
    .xword 0x628a92bc36e9cbd7
    .xword 0x7b2b9c6a38cb31



SECTION .DATA_CORE23_5 DATA_VA=0xa819a000
attr_data {
    Name = .DATA_CORE23_5,
    VA = 0xa819a000,
    PA = ra2pa(0xa819a000,0),
    RA = 0xa819a000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x6f78105fb47507b2
    .xword 0xdcd79b681be961c5
    .xword 0xfe86f2340c80e590
    .xword 0x51d708f16d7362c7
    .xword 0x5aceba397f86866e
    .xword 0x7f3b01556f6dba31
    .xword 0x7ef12d30c83140e6
    .xword 0x86a1f1ae21607298



SECTION .DATA_CORE23_6 DATA_VA=0xa819c000
attr_data {
    Name = .DATA_CORE23_6,
    VA = 0xa819c000,
    PA = ra2pa(0xa819c000,0),
    RA = 0xa819c000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x1703d93858312697
    .xword 0x5c069da409ded2c9
    .xword 0xdef0f9a2ac1a1f04
    .xword 0xc7fa900a2239bd44
    .xword 0x259e86f8b6f4a631
    .xword 0x68043362ff92b51
    .xword 0xccfad2fe75717da7
    .xword 0x714a513ac5127c10



SECTION .DATA_CORE23_7 DATA_VA=0xa819e000
attr_data {
    Name = .DATA_CORE23_7,
    VA = 0xa819e000,
    PA = ra2pa(0xa819e000,0),
    RA = 0xa819e000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x3bd1f8e5567ac7ae
    .xword 0xbee00fa81082da0f
    .xword 0x35b88d7a91b68c6e
    .xword 0xb1a159e0cc18f370
    .xword 0x84e613b7705319e0
    .xword 0x19dac64dfee0a639
    .xword 0xd59f52812a222a60
    .xword 0xa08a6e274cb2b456



SECTION .DATA_CORE24_0 DATA_VA=0xa81a0000
attr_data {
    Name = .DATA_CORE24_0,
    VA = 0xa81a0000,
    PA = ra2pa(0xa81a0000,0),
    RA = 0xa81a0000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .global data_core_24
data_core_24:
    .align  PITON_L1D_WAY_SIZE
    .xword 0x4b8e41bdfba822e2
    .xword 0xe8b65d672462ef0f
    .xword 0x2135117e1e538184
    .xword 0x4ea8ad73ac246e95
    .xword 0xb6d0cb9174463cfe
    .xword 0x59a69df520f0041d
    .xword 0xdb6d6d090c0427a5
    .xword 0xe548b70c0ae9091d



SECTION .DATA_CORE24_1 DATA_VA=0xa81a2000
attr_data {
    Name = .DATA_CORE24_1,
    VA = 0xa81a2000,
    PA = ra2pa(0xa81a2000,0),
    RA = 0xa81a2000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0xc0cbbbb8c43fe765
    .xword 0xcf412e4279216903
    .xword 0xb4068536fb23edd8
    .xword 0x47dc4f6edf431cee
    .xword 0x27496e9d7404b38
    .xword 0xc1da5570cb2f50aa
    .xword 0x561ba0052aec9d0e
    .xword 0x75c5369a52ccd52b



SECTION .DATA_CORE24_2 DATA_VA=0xa81a4000
attr_data {
    Name = .DATA_CORE24_2,
    VA = 0xa81a4000,
    PA = ra2pa(0xa81a4000,0),
    RA = 0xa81a4000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0xd9639d74bdf6b29e
    .xword 0xf74362d1964d0665
    .xword 0xc7f3ccbe1cbd0d38
    .xword 0x4500374d356df86
    .xword 0x61263b222cba6b9e
    .xword 0x8f351205b6ce728c
    .xword 0xc7f8b64dd2e2ff58
    .xword 0xa9360548d811a8d3



SECTION .DATA_CORE24_3 DATA_VA=0xa81a6000
attr_data {
    Name = .DATA_CORE24_3,
    VA = 0xa81a6000,
    PA = ra2pa(0xa81a6000,0),
    RA = 0xa81a6000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0xfe771f7b1aab58b2
    .xword 0x93c5bb1a0b1dd238
    .xword 0xca71d8bada3c3084
    .xword 0xeaa750dd6a1eacb9
    .xword 0x81c6339c1436afd0
    .xword 0x13b59252c3c50ab0
    .xword 0x5e691d64c669c43e
    .xword 0xdebcc84924cc578



SECTION .DATA_CORE24_4 DATA_VA=0xa81a8000
attr_data {
    Name = .DATA_CORE24_4,
    VA = 0xa81a8000,
    PA = ra2pa(0xa81a8000,0),
    RA = 0xa81a8000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x3df76ce146c4e04
    .xword 0x836fe2c380e237dd
    .xword 0x309986d5484d4b16
    .xword 0xf7e377c19700dea0
    .xword 0x14878c3f2d20714b
    .xword 0xbf94cff955c7648f
    .xword 0x478bdded13cfef7
    .xword 0x3dfb6cbfd0647baa



SECTION .DATA_CORE24_5 DATA_VA=0xa81aa000
attr_data {
    Name = .DATA_CORE24_5,
    VA = 0xa81aa000,
    PA = ra2pa(0xa81aa000,0),
    RA = 0xa81aa000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x43d551283b43729b
    .xword 0xd10ccb73cd6f82c
    .xword 0xc15da96a90ac147d
    .xword 0xd1116f9c34e1aa4
    .xword 0x1732ebc30263647a
    .xword 0x1a3151cfd52af25e
    .xword 0x92e04f015fb05c48
    .xword 0x9d6d75e4a0d91e58



SECTION .DATA_CORE24_6 DATA_VA=0xa81ac000
attr_data {
    Name = .DATA_CORE24_6,
    VA = 0xa81ac000,
    PA = ra2pa(0xa81ac000,0),
    RA = 0xa81ac000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x611731d3e180efe4
    .xword 0x38c363b1ed9d4003
    .xword 0x98deba2bd5e245ac
    .xword 0x52f497627ff1cb90
    .xword 0x701fe1ca8bc9e47a
    .xword 0x898013eaee2afb09
    .xword 0x3d935b31c2bad37a
    .xword 0xa49f0826d46abad



SECTION .DATA_CORE24_7 DATA_VA=0xa81ae000
attr_data {
    Name = .DATA_CORE24_7,
    VA = 0xa81ae000,
    PA = ra2pa(0xa81ae000,0),
    RA = 0xa81ae000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L1D_WAY_SIZE
    .xword 0x5fa8336d1cb6fd5b
    .xword 0x64284c5e49b0fc07
    .xword 0x3b89d29b6b0e7987
    .xword 0x2821be90cdd9432e
    .xword 0x4c21e7c2b2ab6321
    .xword 0x60689ca2ee33e49b
    .xword 0x342e7c9845ce5b40
    .xword 0x4cd75e05ee942bb8



