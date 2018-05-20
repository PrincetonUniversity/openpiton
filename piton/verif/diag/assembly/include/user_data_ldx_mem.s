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

SECTION .DATA_CORE0_0 DATA_VA=0xa8202000
attr_data {
    Name = .DATA_CORE0_0,
    VA = 0xa8202000,
    PA = ra2pa(0xa8202000,0),
    RA = 0xa8202000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .global data_core_0
data_core_0:
    .align  PITON_L2_LOW_SIZE
    .xword 0xe62cd37dfbb535f
    .xword 0x741a3291e385e1f6
    .xword 0x8fd1d0f8390fbd03
    .xword 0xd5a9674b955a9cbc
    .xword 0xe94148943b13ef2d
    .xword 0x7d1e3fe0fff00ee9
    .xword 0xf5656612c12d2840
    .xword 0x4cf0c0cc37388d6

    .align  PITON_L2_LOW_SIZE
    .xword 0xaabf4943f2aae32f
    .xword 0x49096d567ee9d993
    .xword 0xbca0628632551e73
    .xword 0x22789ff57dfffe66
    .xword 0x701f9a669883e3c2
    .xword 0x2e93f898b4d81cf5
    .xword 0x4c4f74323f1bd1f4
    .xword 0xb8b096c0ab84dc55

    .align  PITON_L2_LOW_SIZE
    .xword 0xd4c979b46e0c86de
    .xword 0xe16d858ad8213849
    .xword 0xc825d05759b2befe
    .xword 0x17e6d8676d853af8
    .xword 0xd972f904c0098985
    .xword 0x42669cf3b742e597
    .xword 0x5a8d367a031edea8
    .xword 0x301d5e947405de9

    .align  PITON_L2_LOW_SIZE
    .xword 0xa2c9e73d5438f5e9
    .xword 0xa12141b49e60590e
    .xword 0x6806b1fd370de362
    .xword 0xe26dcc1b70372600
    .xword 0xb250b62050450d44
    .xword 0x4ab245d02e4d843
    .xword 0x6e919e941cd9ffb3
    .xword 0x7b1bc929a24cdc1b

    .align  PITON_L2_LOW_SIZE
    .xword 0x533bb8d89f4c7154
    .xword 0x3994f7aa11a2263c
    .xword 0x102c08ffd4f3108a
    .xword 0xaf096c35e45575d5
    .xword 0x9b72b806815ecff3
    .xword 0xfdaa3833a4cce12d
    .xword 0xf63bc026d99e66f7
    .xword 0x52daecc08114b9f7

    .align  PITON_L2_LOW_SIZE
    .xword 0x22b1461b7925922c
    .xword 0x69857cdcc3d55588
    .xword 0x4a6f0188c9bdaf96
    .xword 0xf8cc010232d3f335
    .xword 0xec7dd24b9171494e
    .xword 0xe3be28815a02fdb0
    .xword 0x831f15775531a75f
    .xword 0xef72397156e4629e

    .align  PITON_L2_LOW_SIZE
    .xword 0x3ec0c60ee10c0f7e
    .xword 0xe506f465b8700a86
    .xword 0xc31f4333bae146d0
    .xword 0xf36875ed040e5e42
    .xword 0xdea1b70fd9ff6780
    .xword 0x4a1a7492f03c40c7
    .xword 0x615db52b3151a24
    .xword 0x1018e9009126dc5e

    .align  PITON_L2_LOW_SIZE
    .xword 0xfc51755d5adf5ab0
    .xword 0xb74bb13bdb845c37
    .xword 0x54cb846c9e06408a
    .xword 0x554ba4bd3a64f27e
    .xword 0x55bae45c729bca4
    .xword 0x34f2f4ccf6c65ea1
    .xword 0xab8a5d117a7985f5
    .xword 0x5fa13cd5e5e996e5

    .align  PITON_L2_LOW_SIZE
    .xword 0x8b7f26e6429ef39e
    .xword 0x2a4a9a885b41bfd3
    .xword 0x507bc8be1485d008
    .xword 0x45d54c38cbf48985
    .xword 0x44f7b009e6d5690
    .xword 0xfb42dbfe29169401
    .xword 0x4077652cb839da88
    .xword 0x939278e48705acda

    .align  PITON_L2_LOW_SIZE
    .xword 0x14c7fb86c0c9138c
    .xword 0xd1556caab795e772
    .xword 0x52fd4746b89b07b0
    .xword 0x7fa75ddff7edcdbb
    .xword 0xc9c9dc353865d1c9
    .xword 0xcd1680c2c3540eb3
    .xword 0x72adcbede6279429
    .xword 0xc203542cb62ca230

    .align  PITON_L2_LOW_SIZE
    .xword 0xed9d72b4d23690af
    .xword 0x2af3a96153f73876
    .xword 0xd6b8c0c112228bf9
    .xword 0xef3764c7f10bd1ae
    .xword 0xb2214799be58fa1e
    .xword 0x649a21093a95b597
    .xword 0xfe35ea889caeaeb9
    .xword 0x1e1b421d155f74d8

    .align  PITON_L2_LOW_SIZE
    .xword 0xdc4947afc96dde45
    .xword 0xa0ae8ceeba900307
    .xword 0xa664296006f167e3
    .xword 0x57a66fdf6226640b
    .xword 0xa0f1e46956d00196
    .xword 0x43b2ac5b0b34fac
    .xword 0x51f1f5e245a36eb0
    .xword 0xfb7f865d50a916aa

    .align  PITON_L2_LOW_SIZE
    .xword 0xca32cb13cfb25fa7
    .xword 0xe613d12158c69ee8
    .xword 0xa58463f3a3ff09b2
    .xword 0x2f145e444f14041a
    .xword 0xed8414945411768e
    .xword 0x24b2865a33f47cac
    .xword 0xa051cc3822c6d2b7
    .xword 0x436d83a83d8e7ac6

    .align  PITON_L2_LOW_SIZE
    .xword 0xdb4335d4ed76c57b
    .xword 0x1f7db121bd81a00c
    .xword 0xf7e54fc10cd6fc79
    .xword 0x51ca0a4ffd32669f
    .xword 0x1d9a17be844f2241
    .xword 0x89e5633f7063f3b3
    .xword 0xcfc94e7f2e9de34a
    .xword 0xfba0a843a30c8df6

    .align  PITON_L2_LOW_SIZE
    .xword 0x4092268b471b24f6
    .xword 0xdebab82e32eadb82
    .xword 0x166fae251cc15c95
    .xword 0xc0e06c6f793705d0
    .xword 0xd5a229dc11d46be1
    .xword 0x8618245389e444c
    .xword 0x95be1f3746aa28e0
    .xword 0x89daf2ff148bc3c0

    .align  PITON_L2_LOW_SIZE
    .xword 0x89c7a0d8677423a1
    .xword 0xf0e3ff13e8749b29
    .xword 0x70ab2f4d1c71e8af
    .xword 0xef4eee50b5253110
    .xword 0x273a4d431f6578c9
    .xword 0xdbd4a30ce2a9afc3
    .xword 0x3f9cbbd49bc651c5
    .xword 0xfc51b98fdbfe0bf8

    .align  PITON_L2_LOW_SIZE
    .xword 0x847547b77fa828f7
    .xword 0xdade46f52cfe2a4b
    .xword 0x311a4adda304a50d
    .xword 0x73ad20f3106dcd7b
    .xword 0x98107bf5d94cb1fb
    .xword 0xf5b115d5b71e4e53
    .xword 0xb874d50afef65b3a
    .xword 0xe1b737877870c505

    .align  PITON_L2_LOW_SIZE
    .xword 0x7da8a75c2222b40b
    .xword 0x861e984e77b799f0
    .xword 0x8eabe40441df025f
    .xword 0x836fcb4c736135ef
    .xword 0x7e17cb3f71ff6965
    .xword 0xd1994763037e7b5
    .xword 0x9c1d39a1b278f3c8
    .xword 0x803cc85a1516fefa

    .align  PITON_L2_LOW_SIZE
    .xword 0x67b50b257c9d22f0
    .xword 0xe666d66cd655b03f
    .xword 0x86380b02c224eb31
    .xword 0x2bd858a7decb89af
    .xword 0xbaf295cf889c97c6
    .xword 0xef2283833e90d7d4
    .xword 0x569365049b638117
    .xword 0x5e03c2e86c463b63

    .align  PITON_L2_LOW_SIZE
    .xword 0x64ab5e96565c932b
    .xword 0xe06c6ab413e4b730
    .xword 0x9e579796d16dc824
    .xword 0xa082c78d1627cca9
    .xword 0xb3c635a7194198f9
    .xword 0x7f2a81c2c911f1b9
    .xword 0x1a205719690f8ba3
    .xword 0x971ee8ed315512cf

    .align  PITON_L2_LOW_SIZE
    .xword 0xcf64033cdcf3e6fb
    .xword 0xf00c1e3f77b35203
    .xword 0x83bbfc81a58ccc30
    .xword 0xacb8dde332c6dd5f
    .xword 0xe0032fcddd6020c6
    .xword 0xe150788beea0e4
    .xword 0xf9f284e43fcb72d3
    .xword 0xc55858bf4d8e5da0

    .align  PITON_L2_LOW_SIZE
    .xword 0xb47bb4e71ac3d96a
    .xword 0xf3be2f558235432d
    .xword 0xc3d3b622dd19bfda
    .xword 0x5b1b2b0ea43ec463
    .xword 0xa55f29e8c1953f97
    .xword 0x97798fc14f0ae27a
    .xword 0x3c15bdb0a88a855a
    .xword 0x11dd70a1265a9fc3

    .align  PITON_L2_LOW_SIZE
    .xword 0xb7dbb1ab4306cf63
    .xword 0x3a48328f52a25ffa
    .xword 0x3b1e7de796a85789
    .xword 0xfabb769af8afdf48
    .xword 0xad07b063cdc25675
    .xword 0x5f2666919c814adc
    .xword 0x6d5ee4f5124f2d21
    .xword 0x5fd47918741f8fd1

    .align  PITON_L2_LOW_SIZE
    .xword 0x133aeeb11d2cfcb4
    .xword 0x58f6c6ef23d9483b
    .xword 0x6f69e80b960349fd
    .xword 0x5edf0e4588242d4a
    .xword 0x2611a71066414c46
    .xword 0xc0077b9016076112
    .xword 0x9803bb6b8fff54ce
    .xword 0xcd12bc39f699d732

    .align  PITON_L2_LOW_SIZE
    .xword 0x8d5196ec831aca13
    .xword 0x6a6ce5f5053d68fc
    .xword 0xfb088f36ba5c9ee5
    .xword 0x6897bf4e5f715cea
    .xword 0x151433cff886083e
    .xword 0x31f2844f9cf4e052
    .xword 0x4714734aed5e2e78
    .xword 0xbe4766ed06ff8416



SECTION .DATA_CORE0_1 DATA_VA=0xa8206000
attr_data {
    Name = .DATA_CORE0_1,
    VA = 0xa8206000,
    PA = ra2pa(0xa8206000,0),
    RA = 0xa8206000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L2_LOW_SIZE
    .xword 0x8d05a763f430d368
    .xword 0xbf1624d5ce7524c3
    .xword 0x2b993d3bc86a2fe6
    .xword 0xa605a47cda122648
    .xword 0x2ddb8ebd4af513aa
    .xword 0x991a8905a7d9c878
    .xword 0xee41ebfa2bdd12ea
    .xword 0x3ed583bfee04f70d

    .align  PITON_L2_LOW_SIZE
    .xword 0x299d8d45eab5e43b
    .xword 0x814b0b60d5219852
    .xword 0xff25618750454598
    .xword 0x27bd20822864c246
    .xword 0xe84a2bd76470eba3
    .xword 0x63d48a7892026b1c
    .xword 0x76d77f43365a8172
    .xword 0x82643646fda9909e

    .align  PITON_L2_LOW_SIZE
    .xword 0xe723b8313ac2904e
    .xword 0x388c1162a49dbfa3
    .xword 0xeb59ef5babaed37a
    .xword 0xc4a4b9ddd64e4b3f
    .xword 0xbffb9bd2d808fc48
    .xword 0xf4603f8487d74ba0
    .xword 0x9f0020109f84250f
    .xword 0x179b80c0aabb9a65

    .align  PITON_L2_LOW_SIZE
    .xword 0xdff7c5c66c224c42
    .xword 0x23ddaa562564beeb
    .xword 0xfff2e636632ab9fc
    .xword 0x61f3a4e101a30393
    .xword 0xb3e7207dcb5e2ca7
    .xword 0x4c869f4960e9968a
    .xword 0xf252f6dc246eab16
    .xword 0x9b59ef972f43ed49

    .align  PITON_L2_LOW_SIZE
    .xword 0x90ad9ef78a8e8a9d
    .xword 0x3e6916800f6a3e7b
    .xword 0xf701c87481790e89
    .xword 0x3979d9f76564e611
    .xword 0xde7c93ddfdadada0
    .xword 0x84a6ecd3ca858d7e
    .xword 0x62153970a1407cbe
    .xword 0x85c1017f9f59e094

    .align  PITON_L2_LOW_SIZE
    .xword 0x4647e508235fce0f
    .xword 0x18d41c5b2633385d
    .xword 0x9e05c10274256d1c
    .xword 0x89bdee558086c686
    .xword 0x2ce07b93a653aa86
    .xword 0x1e83f69d4253b331
    .xword 0xe685befcf3e84b61
    .xword 0x63cbe1c6309b0624

    .align  PITON_L2_LOW_SIZE
    .xword 0x92e5c079d24fd9b
    .xword 0xeb798f65b10f023f
    .xword 0xe866d0b17e18bccf
    .xword 0x97c4acf7704152cb
    .xword 0xc25b914b08365261
    .xword 0x12e453f938bbbca4
    .xword 0xe466c8e8fb5619ff
    .xword 0x66abfe52939395c3

    .align  PITON_L2_LOW_SIZE
    .xword 0x1d72c3bc7b688a3d
    .xword 0x59f5fe360e7939c6
    .xword 0x8a2f4dbe49ef6401
    .xword 0x5003d371a786372
    .xword 0x690b121596cb3c76
    .xword 0xcfed5b77e365d34b
    .xword 0x12de256c8eede384
    .xword 0xe9ff111886e20576

    .align  PITON_L2_LOW_SIZE
    .xword 0x5036420f33534c38
    .xword 0xb4d2293825c34d6c
    .xword 0xa18ed7065fd0bced
    .xword 0x11f9c5c190328e77
    .xword 0x1579f81d625a3927
    .xword 0x3059b0bde4869fd6
    .xword 0x3a972f4a7581fe97
    .xword 0x286680305f8caeb8

    .align  PITON_L2_LOW_SIZE
    .xword 0xf65eab671e2d9eb7
    .xword 0x48e98cda774564f1
    .xword 0xecf03d96989d798f
    .xword 0xc7f78faf1e4fa1b5
    .xword 0x65a9877861058cc9
    .xword 0x691a26565de0965a
    .xword 0x5ca81c30837732a1
    .xword 0xb463e92c96e26924

    .align  PITON_L2_LOW_SIZE
    .xword 0xab6c895594de8951
    .xword 0x345ef38c8753540a
    .xword 0x12794acf1c59c6fc
    .xword 0xa70c5c68f0fc581a
    .xword 0x1d788739b1d7b23a
    .xword 0xd09d90bfa63ee3e
    .xword 0xcf3cfef09d129672
    .xword 0x8f3a75737617d1fc

    .align  PITON_L2_LOW_SIZE
    .xword 0x2c801b4f068c7595
    .xword 0x6f74409f51193322
    .xword 0x16c52b7195c221df
    .xword 0xc60743591a1a019e
    .xword 0x2bc1c5c913e13b2c
    .xword 0xcd36c41a00c7e802
    .xword 0x8a3487b4169c364e
    .xword 0xbbd6ad3dda72ff52

    .align  PITON_L2_LOW_SIZE
    .xword 0x4ebfaf3f0ce5ada3
    .xword 0xa603b9ffc91ffc7a
    .xword 0x55ff3fb66fa9c3ae
    .xword 0xdd8dff8f49f8ac5c
    .xword 0xd6bb5ab83592c3f
    .xword 0x95a71cd2f801a32b
    .xword 0xe08d6e6d1a0e0d93
    .xword 0xd3faafb33c970bf9

    .align  PITON_L2_LOW_SIZE
    .xword 0x198ebbb403dcf448
    .xword 0xe08e00f50daa8333
    .xword 0xe72e1a7ec99e0207
    .xword 0x8eae79dd71f1751d
    .xword 0x3694e93f6157563c
    .xword 0x9e7854a0bea7511d
    .xword 0xce3b151baceb46af
    .xword 0x31eb4c99e7cd3d0e

    .align  PITON_L2_LOW_SIZE
    .xword 0xc54cf6bd65bdbb06
    .xword 0x1514396bb0f3db85
    .xword 0x43d064e136b0af1d
    .xword 0x1e936616018d1445
    .xword 0x3fbcad6eebfc2417
    .xword 0x31bd681d7f4d5172
    .xword 0x1804cd1b5cd34e02
    .xword 0x8bc09fd7cb70591a

    .align  PITON_L2_LOW_SIZE
    .xword 0xac16b953e35f59e5
    .xword 0xb054249a54ca9a73
    .xword 0x409f05c029d51399
    .xword 0x44cd18a8ebfe334e
    .xword 0xda4403472f4bc295
    .xword 0x73a5c53e3c3eaf3
    .xword 0xb78359ccee359457
    .xword 0x8aebbbd95ea33806

    .align  PITON_L2_LOW_SIZE
    .xword 0xf17d31e6d24546e1
    .xword 0xd67e6c8ddb0de5dd
    .xword 0xbb24ee0a498aeb32
    .xword 0x5ea312c71ad194a2
    .xword 0x14d8268e8c7a54be
    .xword 0xe2af1f8aad24d4ce
    .xword 0x9cfc1ce2732bb84c
    .xword 0x6c2b8651b391f93f

    .align  PITON_L2_LOW_SIZE
    .xword 0x931f8e5560722f22
    .xword 0xcd91e5f5eb871e77
    .xword 0xfa9187e3918d1042
    .xword 0xd6f9a6c5a05fd1f4
    .xword 0x60add7d272425f9b
    .xword 0xdae5c215928c75cd
    .xword 0x8070f2c706406896
    .xword 0x20298a7dfecee774

    .align  PITON_L2_LOW_SIZE
    .xword 0x54f672d342aa0994
    .xword 0x12e9f20343a0482e
    .xword 0xb4d01d062a315be0
    .xword 0xac2eacce47532deb
    .xword 0x80629e502e5851e7
    .xword 0x1892e3c4d798d0bd
    .xword 0xe262e0a649ee791b
    .xword 0xed08b7f242cc3031

    .align  PITON_L2_LOW_SIZE
    .xword 0x6113f5254f38f134
    .xword 0x924ca1c27cddee81
    .xword 0xccdad707b5c84330
    .xword 0xf3d8f57538e91f09
    .xword 0xf8080b9409ab31cd
    .xword 0x9da607d4504cc9e6
    .xword 0xee8a5fd0c3b95b67
    .xword 0x86c8072474dd5870

    .align  PITON_L2_LOW_SIZE
    .xword 0x85858d131ac8682d
    .xword 0xdcf0e5a3c52ae13f
    .xword 0x7b241b786d77fc5d
    .xword 0x15009147598961e8
    .xword 0x9a870b7adc9f8f26
    .xword 0xae54987c28960b02
    .xword 0x65c6f6262a8b2dfd
    .xword 0xbe16b9a89018bb45

    .align  PITON_L2_LOW_SIZE
    .xword 0x7aa316476ddd655e
    .xword 0xe82e50bb7cfff6c4
    .xword 0x3c23dc6bcef43b07
    .xword 0xb8d763eedc4b223
    .xword 0x2beca83f88e15fac
    .xword 0xcf5ea7a58cc5429c
    .xword 0x3a185ebbec8f4b6b
    .xword 0xdb8e4fb9801ceb8a

    .align  PITON_L2_LOW_SIZE
    .xword 0xef586fbb22509398
    .xword 0x59f423190f9b2e56
    .xword 0xf2f53d100ca71b4b
    .xword 0xb00a248332ff24ef
    .xword 0x6c3a5a59b5d753b5
    .xword 0xc9e21ffa0f696a5c
    .xword 0xa000e55c8fbef02f
    .xword 0xbad5d54cc3f98f75

    .align  PITON_L2_LOW_SIZE
    .xword 0x7d4846feed10c4d7
    .xword 0x77a96e32b584391e
    .xword 0xa0764fb886910ee0
    .xword 0xe81713ba7e698cd3
    .xword 0x9a6309a12a11430d
    .xword 0x14425a21075883f1
    .xword 0x21afa33bd5490c1c
    .xword 0xe36a5eb6129a382c

    .align  PITON_L2_LOW_SIZE
    .xword 0xdff360afcb8e5737
    .xword 0x8acda37d7245ae43
    .xword 0xd9a103b1fe62a3ad
    .xword 0x7d4a9bb1128b9aaa
    .xword 0x3fbe8d3a1360d744
    .xword 0x56004eeb97a308a3
    .xword 0x14c7a75c1b6ccdc5
    .xword 0xebeb3df1a60a6727



SECTION .DATA_CORE0_2 DATA_VA=0xa820a000
attr_data {
    Name = .DATA_CORE0_2,
    VA = 0xa820a000,
    PA = ra2pa(0xa820a000,0),
    RA = 0xa820a000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L2_LOW_SIZE
    .xword 0x7e1b8a003a3163b1
    .xword 0x178e512797a090d7
    .xword 0x4ada41d87cdcc07
    .xword 0x13dfd1adc5d8b563
    .xword 0xf3d73974705b60ad
    .xword 0xebca1a0d40401bf9
    .xword 0xb806bf8b604dd32
    .xword 0x5434cae855a7f2b5

    .align  PITON_L2_LOW_SIZE
    .xword 0x989347515de10fe1
    .xword 0x5067389ac9275086
    .xword 0x6df22f1954c71aa5
    .xword 0x6abac58e473000bd
    .xword 0x26e65f4d5a9f8587
    .xword 0x5dd071de9d9689fc
    .xword 0xfe477d674205c1c8
    .xword 0xc1dd7088ecbf4f8

    .align  PITON_L2_LOW_SIZE
    .xword 0x5f0ba498a1520f41
    .xword 0xf504ab31d063d87c
    .xword 0x757fa9f050eaeb46
    .xword 0x6d31888a4871392f
    .xword 0x944e499128ad951e
    .xword 0x2919572b05d8706e
    .xword 0x9e7cefc1ac74c28
    .xword 0xe4740b4cf423e455

    .align  PITON_L2_LOW_SIZE
    .xword 0x540b261b8832c70b
    .xword 0xcbe3a34e76fd9a5d
    .xword 0x6495f5c22bfcc3e3
    .xword 0x4840980769f4c786
    .xword 0x59b6e3b0353f608d
    .xword 0x6b00a9eb8a0e8f4e
    .xword 0x4d20553011f2d76e
    .xword 0xb90a758f8826353e

    .align  PITON_L2_LOW_SIZE
    .xword 0xddfa2c3b8e680ee
    .xword 0x1e2f10f43f58b794
    .xword 0x1f6f65776a6389fc
    .xword 0x7e950f1e15703a55
    .xword 0x39f717e59cef711c
    .xword 0x7f6ce5f6fd52da8f
    .xword 0x5eb80e75c998a391
    .xword 0x1f77080cfcf3020f

    .align  PITON_L2_LOW_SIZE
    .xword 0x25acd4ed72de35af
    .xword 0xac5e45af26f58212
    .xword 0xaea13f706f6407ca
    .xword 0xe7cb2d679b75ccaa
    .xword 0xd5bad0609f9c83b9
    .xword 0xe97e148b2a570d78
    .xword 0x2622fb8a514d690
    .xword 0x8554df1f68f586d5

    .align  PITON_L2_LOW_SIZE
    .xword 0x86bc68c492c23b4c
    .xword 0x4cc767635d28d1f8
    .xword 0x44bded7f148fbe6
    .xword 0xfdd0e3bd38bbb2a4
    .xword 0x1dcdd52a09812109
    .xword 0x2fd7de021c203aa2
    .xword 0xb801afc3701eac59
    .xword 0xd697f11d0ec5da96

    .align  PITON_L2_LOW_SIZE
    .xword 0x8f3db6fa8adf0b92
    .xword 0xa3923de9db1a3314
    .xword 0x661c2eb27f1bbedb
    .xword 0x99785085adfc35c9
    .xword 0x4968eeaee73d3ec0
    .xword 0xaa1644756b8ea6e7
    .xword 0xa54d08ac9899b4d7
    .xword 0xf4c03aca6d7377b1

    .align  PITON_L2_LOW_SIZE
    .xword 0x7cbf01050b64e79e
    .xword 0xfa09c015413ed29d
    .xword 0x3abb686026ed977f
    .xword 0x77c52570e2382dfe
    .xword 0xab81f750b2bd417e
    .xword 0x7989678864d24852
    .xword 0x6ba43a63e302c8c9
    .xword 0x4de11f6a02de5d54

    .align  PITON_L2_LOW_SIZE
    .xword 0x86823a1ec4b18780
    .xword 0xea60b3d479828c78
    .xword 0x64fbde562a85e5d4
    .xword 0x80b78da5cdca7fac
    .xword 0x7819538a4745b820
    .xword 0x256288e26ba48ca5
    .xword 0x2cc05b9aeac91be4
    .xword 0xd7afaf057e4c0a6d

    .align  PITON_L2_LOW_SIZE
    .xword 0x9cfaf0d6b4ca334c
    .xword 0xb5632f032b8446e9
    .xword 0x2604fdc92fcecda5
    .xword 0xc683042b470b1125
    .xword 0x47194a42ccb4e873
    .xword 0xb4ded3559bbfe283
    .xword 0x4caf3cb69730c201
    .xword 0x471d1ba4720d93dd

    .align  PITON_L2_LOW_SIZE
    .xword 0x9f3a218fcb08aa31
    .xword 0x15bb542513c355cf
    .xword 0x8402f768e81f4dfd
    .xword 0x8a68b897e4c126cd
    .xword 0xf830d339c58accf0
    .xword 0x606ffed3c5ed14c2
    .xword 0xef853f33bd9fe6ee
    .xword 0x600f0568c692a73a

    .align  PITON_L2_LOW_SIZE
    .xword 0x6039d964df32ab20
    .xword 0xcf16d8a5e6d7ec32
    .xword 0xe0d3d4d4253d9362
    .xword 0xe9cb4b5d51193b0e
    .xword 0x52d5930e791c3640
    .xword 0xda8e7acaa35847be
    .xword 0x7a15aac0dcfe8bcc
    .xword 0xc93ba307d732f6bd

    .align  PITON_L2_LOW_SIZE
    .xword 0x1857ce3cdcb75102
    .xword 0x35305e522443b02c
    .xword 0x24e40881c999643f
    .xword 0x750c69631e1506ec
    .xword 0x2e0fa04622191b18
    .xword 0xd129009094ccf3b1
    .xword 0x4c6fcae87b6ad08c
    .xword 0x9469421cdef1d9e6

    .align  PITON_L2_LOW_SIZE
    .xword 0xf486ec8836a819ca
    .xword 0x28d0b58358f14070
    .xword 0xdb414a2fe0ed21c3
    .xword 0x7ecf88ab1ab992a4
    .xword 0xec646261e5a5218a
    .xword 0x170dda34d8746093
    .xword 0x3328187cd93da3be
    .xword 0x75acfc9f79470e5f

    .align  PITON_L2_LOW_SIZE
    .xword 0x20696e43be4f126b
    .xword 0x7b1635365dc2ed5d
    .xword 0xe79c4c05537c3d30
    .xword 0x9021b487bd4ccf09
    .xword 0x6cb982a1a97d5ca5
    .xword 0x83d07bc6db12ce60
    .xword 0x8f210130f84182cb
    .xword 0x7f13a2d15de4897e

    .align  PITON_L2_LOW_SIZE
    .xword 0x3f0b72e97d8105f3
    .xword 0x7504ad3edf4bd799
    .xword 0x13f34f4a3141b18a
    .xword 0xe8e0af9985a0f436
    .xword 0xec39550fc11afe85
    .xword 0x2dbdcb0db98bca41
    .xword 0xf36cab1bbbc3af52
    .xword 0x3247b8151cf5c6e5

    .align  PITON_L2_LOW_SIZE
    .xword 0x20e434799d02fab8
    .xword 0xf792dd78162122f4
    .xword 0xfd170a7637cdabf1
    .xword 0x5c27f5aff7be4e3c
    .xword 0x33f37c77efe6601f
    .xword 0xba6c98256882b16b
    .xword 0xb439aff807508bb4
    .xword 0x18f8c7cbeb8ec7df

    .align  PITON_L2_LOW_SIZE
    .xword 0x88912f866c79c3ca
    .xword 0xf51044fa8f242ca2
    .xword 0xb11fe3efbd6cf4aa
    .xword 0x1055b82133c1778c
    .xword 0x379e2673801e5f9b
    .xword 0x5fa23e4d5a44fc62
    .xword 0xc091ab1d07951677
    .xword 0xda49e32d0a1a99c6

    .align  PITON_L2_LOW_SIZE
    .xword 0xa9ec218df162a970
    .xword 0x95a22593ccb32b38
    .xword 0x77f321de4fc73c5
    .xword 0x4ec85bbe8f5b2f52
    .xword 0xb4188e2dca915c63
    .xword 0xcdbebc5e4be308fe
    .xword 0x886a21f8c633ff87
    .xword 0xd62f228013898359

    .align  PITON_L2_LOW_SIZE
    .xword 0xa058575c53aca3ce
    .xword 0xc0ddcec16e62a899
    .xword 0x293dbc81d7fa6fdd
    .xword 0x563ffa7efe884865
    .xword 0x47a9e884f1cc5152
    .xword 0xd1dbf377708816bd
    .xword 0x801ba6020859969a
    .xword 0x14291a4490cecb43

    .align  PITON_L2_LOW_SIZE
    .xword 0x964227e0f011c15d
    .xword 0x9800cf5100d209da
    .xword 0xd18dc5be6b0a6f94
    .xword 0x19fb13ccad313a1
    .xword 0xde22cc2677c7bfca
    .xword 0x6f443650edaf9692
    .xword 0xde9f3f760fb98604
    .xword 0x43d141743671084a

    .align  PITON_L2_LOW_SIZE
    .xword 0xd896966ac8878e5e
    .xword 0xdd0a84793698b35
    .xword 0xc60389a651d7856f
    .xword 0x730a40ec9b3bf55f
    .xword 0x160004a0e3e83946
    .xword 0x37d0916b7ecbe434
    .xword 0x2fc96789e266eac6
    .xword 0xe28049a95122f17b

    .align  PITON_L2_LOW_SIZE
    .xword 0x3efd762d1b2fe4b8
    .xword 0xcda775db83ffa483
    .xword 0x4b1082a6639f33e1
    .xword 0x5cc9a1001e3d3b02
    .xword 0xe5fe6e3b91827fcd
    .xword 0xf33dba17d7a7e6d6
    .xword 0xd048db67999d527f
    .xword 0xe305bd311504ce76

    .align  PITON_L2_LOW_SIZE
    .xword 0x418059a13cdd178f
    .xword 0x75306eca11d2de50
    .xword 0xa990556cc6b8b02
    .xword 0xf3d6c408a1d31be2
    .xword 0x151519e4fa5ed06
    .xword 0x42d5302a7d261f98
    .xword 0xeff237aa2027bea2
    .xword 0xe66fc1a21cc647c7



SECTION .DATA_CORE0_3 DATA_VA=0xa820e000
attr_data {
    Name = .DATA_CORE0_3,
    VA = 0xa820e000,
    PA = ra2pa(0xa820e000,0),
    RA = 0xa820e000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L2_LOW_SIZE
    .xword 0xed5fc15aa41ee518
    .xword 0x26121bd55f261b86
    .xword 0xb6eb4c591da2fadc
    .xword 0x5866b1f00521d5af
    .xword 0x21f42abefa81ae81
    .xword 0xf6f376566c826850
    .xword 0xfaa2e50581d360c9
    .xword 0x53bdf7ef5e4377b4

    .align  PITON_L2_LOW_SIZE
    .xword 0x5c9915575d4db028
    .xword 0x49d34faaaa1d29cd
    .xword 0xa7b4569e1f8ea41f
    .xword 0xb253885667d16dfd
    .xword 0x952614496dd0e2ce
    .xword 0xe98349927cc6ad1f
    .xword 0xe61b6bdd2f56e1d4
    .xword 0x588405cfdf2c951f

    .align  PITON_L2_LOW_SIZE
    .xword 0xff241aa33b75fadc
    .xword 0x5ab7499b98c71610
    .xword 0x91a4244faa987db2
    .xword 0xd05e9b8dd5aea934
    .xword 0xfd5f22f4f88ee1a4
    .xword 0x37c4508c2128d720
    .xword 0xfdd4598942650f2c
    .xword 0x478385d1746f35a

    .align  PITON_L2_LOW_SIZE
    .xword 0x8153dcd291e29350
    .xword 0xc7f6b67927824c63
    .xword 0x9071d20b8c12b7c7
    .xword 0x9a1082b0bfd84f19
    .xword 0x75fec1e9702363b2
    .xword 0xb5409631c5f9837
    .xword 0xb4c5dbb486cace44
    .xword 0xbcf3f167de08afcf

    .align  PITON_L2_LOW_SIZE
    .xword 0x1e8e25370436bbaa
    .xword 0xa9f5d1558326e983
    .xword 0x106b8320b774d59f
    .xword 0xa7c29dd164ddebe
    .xword 0xd4259ad117a4b25f
    .xword 0x82437ea5d3e258a8
    .xword 0xafac03d46b72659c
    .xword 0x5dcdd477eae39554

    .align  PITON_L2_LOW_SIZE
    .xword 0xaa109b130baa622d
    .xword 0x4099374b5d7d7161
    .xword 0xc6a20e77e48c94ec
    .xword 0x310b1969ab13f030
    .xword 0xad8f6c8d57d3fbcd
    .xword 0xfe6155b8b56bef0b
    .xword 0x918a153d5323137a
    .xword 0x57f0e3d5a2c550b1

    .align  PITON_L2_LOW_SIZE
    .xword 0xea08a38364656052
    .xword 0xb4630ec58ea9157d
    .xword 0x4f7695137eaac4ef
    .xword 0xc9a98a631072ff01
    .xword 0xb2a342d0d6b0d268
    .xword 0xe5ca38ca1d0d6fcc
    .xword 0xf3b47ce71214476a
    .xword 0x15bb56f4203c132f

    .align  PITON_L2_LOW_SIZE
    .xword 0x32ca763f93f0ea32
    .xword 0xacb48c18d93393ab
    .xword 0xdd99d304bcaaf077
    .xword 0x3304ccfc81e23c7c
    .xword 0x6251316546d8e0d8
    .xword 0xc2aacc6e89234399
    .xword 0x89fb29767a5702cc
    .xword 0xb237e55a30f86fb9

    .align  PITON_L2_LOW_SIZE
    .xword 0xadd611dedc7c58a9
    .xword 0x954ea5ca27265f4f
    .xword 0x45c88a4d08c7fc2f
    .xword 0x9e1cae4ea3aad4a8
    .xword 0x1d96e7d7bf7e00d9
    .xword 0x5e1658b57d343f71
    .xword 0x6f5128dd1e39d37a
    .xword 0xa8c5d910f486101d

    .align  PITON_L2_LOW_SIZE
    .xword 0x2a670794d7890d45
    .xword 0xd0d30555546eff80
    .xword 0x3fed3909e76a4c21
    .xword 0xae7b01113cb0cc4d
    .xword 0x329a941bfe658ed4
    .xword 0x5734e47e1c34db01
    .xword 0x2f07083d0c335338
    .xword 0xc6a669146ec159b3

    .align  PITON_L2_LOW_SIZE
    .xword 0x9d53eef2d8036bbb
    .xword 0xe07aede52521852a
    .xword 0x72a4b81467aca9f2
    .xword 0x66783502e15d8485
    .xword 0x4b2722e2487fe936
    .xword 0x2fe34d326cc95e2d
    .xword 0x31956b1bf2e1b598
    .xword 0xc87684ace697a274

    .align  PITON_L2_LOW_SIZE
    .xword 0xa57c256175f52f5b
    .xword 0xf1f2701b49fb5ae2
    .xword 0x525ca5233703ba3a
    .xword 0xf10b5ac2be0f34a6
    .xword 0x2b10915d0b8997a5
    .xword 0xceb0a46299daeb76
    .xword 0x5d705f2fc0777988
    .xword 0x9f7550ad970fc4d4

    .align  PITON_L2_LOW_SIZE
    .xword 0x304d76216e739063
    .xword 0xd5b3e15c14c4e4b1
    .xword 0x20cc4517d2927cfe
    .xword 0xacbf30c5130af455
    .xword 0x6a35f518e24b9630
    .xword 0x713d850b41d93ea6
    .xword 0xd51e7ac9692fb471
    .xword 0x583d65122db41274

    .align  PITON_L2_LOW_SIZE
    .xword 0x85de05794e606d94
    .xword 0x7f0aa85853f825f5
    .xword 0xde2039b8ad41407b
    .xword 0xde38e7f721588e5f
    .xword 0x8def8b4eb4300b69
    .xword 0x2fd277c0def659cf
    .xword 0x5c465ca07c2d7d20
    .xword 0x55f7f8b739905ae9

    .align  PITON_L2_LOW_SIZE
    .xword 0xaec6fb4636dd447e
    .xword 0xd24c9bf9d04a6e80
    .xword 0xc964857b663d362d
    .xword 0xbf19e340cc8532f6
    .xword 0x758caec7b8373de7
    .xword 0xec999c7d98b4970f
    .xword 0xf51a9a5e54d62487
    .xword 0x7c57605ca61ad664

    .align  PITON_L2_LOW_SIZE
    .xword 0xad32ce1a106869ee
    .xword 0x6d90fde291e9de13
    .xword 0x8ac7e3595a0b9ee5
    .xword 0xa5f00b94c778c39
    .xword 0x225bc7601dcaf241
    .xword 0x2d5b34b644f33e0a
    .xword 0x5a5922496e41c002
    .xword 0xe803dca0955f6f0f

    .align  PITON_L2_LOW_SIZE
    .xword 0xb5a5c237715ca4d2
    .xword 0xfe246a8e45e07513
    .xword 0xd30f8e1138008d8c
    .xword 0x2b076fb998455287
    .xword 0xc5d3832c91778a23
    .xword 0xcbd7849fef7b8e1f
    .xword 0xa5f08d02bff537cc
    .xword 0xfd932229074eed2c

    .align  PITON_L2_LOW_SIZE
    .xword 0x3774d0c8f97c321f
    .xword 0x54c31ec01647af00
    .xword 0x2b265de26667046b
    .xword 0xaa52a97be91133d1
    .xword 0x68d606f5a45b4ba5
    .xword 0xcd1c6c83bf868189
    .xword 0x44512b772e50157
    .xword 0x2bca9410997c2e32

    .align  PITON_L2_LOW_SIZE
    .xword 0x8e454517f8e8bd17
    .xword 0xd73d7e8fb5384b7c
    .xword 0xf0efb9188be1584e
    .xword 0x49b9394e5db6d34a
    .xword 0x249f884b9e97e5a7
    .xword 0x62a9ec54c84980e1
    .xword 0x81705bd69ab7c5e9
    .xword 0x5495339a14f6d37c

    .align  PITON_L2_LOW_SIZE
    .xword 0x3358e0b40bcbdd78
    .xword 0xd3c9918dfe94c2f7
    .xword 0xe01456ad969409c8
    .xword 0x3db7d439d1281da5
    .xword 0x633033ad0f8adbf8
    .xword 0x383420c4966be718
    .xword 0x40bc48cde3640014
    .xword 0x5a3a02454f815a97

    .align  PITON_L2_LOW_SIZE
    .xword 0xbfc8a19e7c053119
    .xword 0xa983055ddaf22cd9
    .xword 0x2c6c781f56efaca7
    .xword 0x69f30becbdb2c376
    .xword 0xa6735317bed258ff
    .xword 0xdffd9338b56f0e46
    .xword 0xab567ae2a7db6a8a
    .xword 0xa7fde1f67a12155

    .align  PITON_L2_LOW_SIZE
    .xword 0x303caff6da381a57
    .xword 0x827aa1a1c0fa2a91
    .xword 0xb9b45aff63ac3729
    .xword 0xac1d4bdaef8d0606
    .xword 0x6ed36962af4631c4
    .xword 0xec3e652274430521
    .xword 0xe730a02ca879cbb4
    .xword 0x8f2b62b6fff395a4

    .align  PITON_L2_LOW_SIZE
    .xword 0xe1d4f76313c130fe
    .xword 0x432ba94ab07ee970
    .xword 0x1099ac4b1a0b0f15
    .xword 0x5ecba0b9e11a74fe
    .xword 0x657e17f455f8cb23
    .xword 0xec679e59934c000f
    .xword 0xfbdb287a484832ad
    .xword 0x6c5a119daa0709bf

    .align  PITON_L2_LOW_SIZE
    .xword 0x68dca3492f1839bf
    .xword 0x30e9b739e1dac625
    .xword 0xd44c2b1484e08ca4
    .xword 0x2fcced2cf13771ab
    .xword 0x213cc574179f581e
    .xword 0x8a1f2e110865b848
    .xword 0xe2386c1b39d8bfba
    .xword 0xc4bb38d3df646b97

    .align  PITON_L2_LOW_SIZE
    .xword 0xb409f1c0bfbee2e0
    .xword 0x4845619c9c49db22
    .xword 0xc8c838823acfc39d
    .xword 0x8822cf7cd0693520
    .xword 0xff715bf182dba9c
    .xword 0xa0e1a26080deb8cd
    .xword 0x72134d0fb8ec743a
    .xword 0xc9e03f1b0f7ac7b7



SECTION .DATA_CORE0_4 DATA_VA=0xa8212000
attr_data {
    Name = .DATA_CORE0_4,
    VA = 0xa8212000,
    PA = ra2pa(0xa8212000,0),
    RA = 0xa8212000,
    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}

.data

    .align  PITON_L2_LOW_SIZE
    .xword 0x619dc670d7691659
    .xword 0xdf19152717275fe4
    .xword 0x2f159f41ca452a7a
    .xword 0x7de9fb5d015596bc
    .xword 0x8c631cfb62b824f5
    .xword 0xb822d8ad1f58a276
    .xword 0x6f9217d11fbd8c75
    .xword 0x552ceb60c5dac200

    .align  PITON_L2_LOW_SIZE
    .xword 0xa1e551f255c4188c
    .xword 0xf7aba4a40c0a67e
    .xword 0x198df5592096c976
    .xword 0x58780c5ce42a83f7
    .xword 0x838cf24014ac1bc
    .xword 0x15edec4af113c9e3
    .xword 0x9a58b6b04ac25e7e
    .xword 0xddb6be516a7a3f75

    .align  PITON_L2_LOW_SIZE
    .xword 0x8c7e489172a3d139
    .xword 0xfc7edbd7b556e7d9
    .xword 0x779a022d25a214f
    .xword 0x1dd09f8fb90acfcc
    .xword 0x67b5348c9a22eea9
    .xword 0x7f279a72932914b9
    .xword 0x738abe6d0d2057b
    .xword 0x3caa3f47964b11f8

    .align  PITON_L2_LOW_SIZE
    .xword 0x174a2f3d78d910c6
    .xword 0x6bd81816db55ea4
    .xword 0x8e1032fc0b825dd8
    .xword 0xa80306df533f3545
    .xword 0xed53f4cb1f90e139
    .xword 0x8af79c0644314039
    .xword 0x7c857a7da04cfc75
    .xword 0x8972b3990ca5e8bb

    .align  PITON_L2_LOW_SIZE
    .xword 0xcebbf01a0654c305
    .xword 0x8d5c4903925ad83f
    .xword 0x1d58fe1e969b572c
    .xword 0xd7b639cc57896b79
    .xword 0xb214cb342c8c2e12
    .xword 0xe714ea9860778de6
    .xword 0x812643c1d6539236
    .xword 0x62f60f4229ddef87

    .align  PITON_L2_LOW_SIZE
    .xword 0xcf3db4dadb55416c
    .xword 0xb956f37b9c6c813d
    .xword 0x5ed7b8388f7cf344
    .xword 0x301595c443883b66
    .xword 0x3f2ee941851fe224
    .xword 0xf8ad3b014b43cfd7
    .xword 0xa21016afa12f48f
    .xword 0x259260e36427de3b

    .align  PITON_L2_LOW_SIZE
    .xword 0x572c3fa2e3ee5842
    .xword 0xb12100762bedcbb0
    .xword 0x645accc4422d7f8a
    .xword 0x7eea18464cd2e4a0
    .xword 0xa8fa150c3f651152
    .xword 0xf0557a4f459c4e6e
    .xword 0x33367d0fc1740794
    .xword 0xfeb271f6f14b8c9d

    .align  PITON_L2_LOW_SIZE
    .xword 0x2f32d44f3f9223dd
    .xword 0x540e17ee9629f39e
    .xword 0x47b0d764f1f972e7
    .xword 0x328870bd910a507f
    .xword 0xc183be9f7d8acde5
    .xword 0xd3b0ec1b76e72740
    .xword 0x9f9a542b7149f8ca
    .xword 0x1de656add6d5378e

    .align  PITON_L2_LOW_SIZE
    .xword 0x76fe0b6a202169e4
    .xword 0xcabd518f1b502b66
    .xword 0x13aeccabc3948b49
    .xword 0x95b3dcf4493232a1
    .xword 0x3c51cd346195bf7e
    .xword 0x9114f9e454d4eb20
    .xword 0x65dead75e67d5638
    .xword 0x2a29e8e76839408e

    .align  PITON_L2_LOW_SIZE
    .xword 0xf3f68d0b7ca9edd9
    .xword 0xa11764b3d59d9ad1
    .xword 0xb38a90a5c24d37da
    .xword 0xd5b54fef6104f66f
    .xword 0x411c22169e9f80d9
    .xword 0x4bb43c225281144b
    .xword 0xbb216d974d1fb13c
    .xword 0xdf4af9f5e2a4463f

    .align  PITON_L2_LOW_SIZE
    .xword 0x3f99a7b0be96968e
    .xword 0x2b6fddd28cedfd36
    .xword 0x492f071270d61d20
    .xword 0xd94be6bea5ca697
    .xword 0x6d1a4a86a01fb41b
    .xword 0x964c3215ec17b9d7
    .xword 0xa6f52f6f29f1252f
    .xword 0x5cc9afa677707e8

    .align  PITON_L2_LOW_SIZE
    .xword 0x741b2922938cea49
    .xword 0xfb9fa3704d74d247
    .xword 0x56bc9faf0921d3c8
    .xword 0xd413941732cffb6a
    .xword 0x3379d96dac294916
    .xword 0x4281fd461a9897c4
    .xword 0xa6e78a1c2085da65
    .xword 0x745a8ffcf42d4cf3

    .align  PITON_L2_LOW_SIZE
    .xword 0x35bcfece73eb699c
    .xword 0x37da3c93b383b630
    .xword 0xe778fd590adcd4ee
    .xword 0xf629a8590beb1607
    .xword 0x1e054463d6b64c30
    .xword 0x581b88624fd2b6c7
    .xword 0x279ba7619a022803
    .xword 0x1f02d1c5918c3c11

    .align  PITON_L2_LOW_SIZE
    .xword 0x6d22c907bc964e8f
    .xword 0x3978df6c1ae4f7ba
    .xword 0x9a17e2e146f536c4
    .xword 0xc13865dea49c9ac8
    .xword 0xe6f3612ceb0ab049
    .xword 0xf35ab9a7a6e13246
    .xword 0x624a804ac4f5e297
    .xword 0x469fd3c20885aea4

    .align  PITON_L2_LOW_SIZE
    .xword 0xb49f1e62bda84fb0
    .xword 0x53927df363eae558
    .xword 0xd621cf0aa0c86be3
    .xword 0x44bfa75638baedde
    .xword 0xe95f134277b834ab
    .xword 0xca954c44943fa39d
    .xword 0xb6d105e794f4a838
    .xword 0x36b1bec2c5bae421

    .align  PITON_L2_LOW_SIZE
    .xword 0x9eb3f688a8490b7f
    .xword 0x58faf620da9bb67a
    .xword 0x715a549226afe0f7
    .xword 0x25d987185b294747
    .xword 0x5990abc1c1be811a
    .xword 0xa875ecc317d6d635
    .xword 0x9759916c8171adee
    .xword 0xd932bb8d521ace3b

    .align  PITON_L2_LOW_SIZE
    .xword 0x6e17da5366b922ed
    .xword 0xd63277e3fb7fc12e
    .xword 0x8203f44fc2c9a0d7
    .xword 0xc00c02d3d53c0682
    .xword 0x74cdc9ef77a87851
    .xword 0x137c95164267f079
    .xword 0x37e2008d3453e39
    .xword 0xbb4aae28b89413f7

    .align  PITON_L2_LOW_SIZE
    .xword 0x68ceb3f802ffba74
    .xword 0x1af0f3b214447cdb
    .xword 0xc2aa1b0a1bdd2629
    .xword 0xd236aadd7e9f41d6
    .xword 0xf4f44be247e3a6ff
    .xword 0x2a2c11613e6e89cf
    .xword 0x51beffc2f52e5743
    .xword 0x6e5f084641809b52

    .align  PITON_L2_LOW_SIZE
    .xword 0xdad30f19f4580d6a
    .xword 0x1e06cb5fda2beec3
    .xword 0xeecdc3cec4d36488
    .xword 0x7ecf6a317cd71034
    .xword 0xa65c62a88ab62ec
    .xword 0x720b580dae6c9613
    .xword 0x1575000f89fa1cf
    .xword 0x7e08a15e88a79a08

    .align  PITON_L2_LOW_SIZE
    .xword 0x88eaf9c2547381d5
    .xword 0x3df90581bd18b76a
    .xword 0xa35c4064f2e6c0f2
    .xword 0x8ecd3faff0b4462a
    .xword 0x19d23cface739c46
    .xword 0x6277ff2c26512779
    .xword 0x6dd7e23cec3399d2
    .xword 0x120388e3b36d0ce1

    .align  PITON_L2_LOW_SIZE
    .xword 0x48c42f81a6f8dcfa
    .xword 0xd98411b1aa31d3fa
    .xword 0x304acb3934143a70
    .xword 0x828a3fa36253857b
    .xword 0x9e06fa7d412a3979
    .xword 0x575958801ab10fb6
    .xword 0x1857230f584add52
    .xword 0xd4209f9d75d61b44

    .align  PITON_L2_LOW_SIZE
    .xword 0xcf0a6f4bbdf8fae7
    .xword 0x6f40de9f59eda878
    .xword 0x6b403ea03fc4e116
    .xword 0xc2da67a91f46e98f
    .xword 0x30f832c0d99b7975
    .xword 0x37ed48009cd7c9f6
    .xword 0xffe917d853390c4c
    .xword 0xd2d35588e8f44f1c

    .align  PITON_L2_LOW_SIZE
    .xword 0xdfe62a5bc4323c56
    .xword 0x1af57b26e38aaa72
    .xword 0xbed226159e9c63e4
    .xword 0x641c03d93ee490ed
    .xword 0x9e0e5c7301601e05
    .xword 0xda1b5a8b6caf8e38
    .xword 0x281fdd39cdf4d9f6
    .xword 0xfbd3c60c156b1fc7

    .align  PITON_L2_LOW_SIZE
    .xword 0x2cfdb7b06d00271e
    .xword 0xeb155f7b5a51c54c
    .xword 0x998ec52b6adf53ad
    .xword 0x4144ea78c08d5328
    .xword 0xa8b7497bcd8fa25d
    .xword 0x4d3f5b4c775ac407
    .xword 0x348fba273e4af340
    .xword 0x45102caf481d48f8

    .align  PITON_L2_LOW_SIZE
    .xword 0x2f3ba25e52c32241
    .xword 0x2dcb82dbf0af4137
    .xword 0xa306dc7efb08f342
    .xword 0xea05defa77fcce69
    .xword 0x58e6f5b0c8f13a73
    .xword 0x619ceb0f17b397ce
    .xword 0x32b066c8325146ed
    .xword 0xef72eba6e4eea70c



