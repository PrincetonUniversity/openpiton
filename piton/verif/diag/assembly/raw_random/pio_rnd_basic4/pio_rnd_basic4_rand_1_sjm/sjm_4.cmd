# Modified by Princeton University on June 9th, 2015
# ========== Copyright Header Begin ==========================================
# 
# OpenSPARC T1 Processor File: sjm_4.cmd
# Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
# DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
# 
# The above named program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public
# License version 2 as published by the Free Software Foundation.
# 
# The above named program is distributed in the hope that it will be 
# useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# General Public License for more details.
# 
# You should have received a copy of the GNU General Public
# License along with this work; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
# 
# ========== Copyright Header End ============================================
CONFIG id=28 iosyncadr=0x7CF00BEEF00
TIMEOUT 10000000
IOSYNC
#==================================================
#==================================================


LABEL_0:

WRITEMSKIO  0x0000061202165280 0x0fff  0x00000000 0x55fc7ee2 0xb6f5d808 0xfa2eb039 

WRITEIO  0x0000061078071300 4 0x3283056c 

WRITEMSKIO  0x000006198d249280 0xff00  0xcdd48b7b 0xef56b8af 0x00000000 0x00000000 

READIO  0x0000061078071300 4 0x3283056c 
READMSKIO   0x0000061202165280 0x0fff  0x00000000 0x55fc7ee2 0xb6f5d808 0xfa2eb039 

WRITEBLKIO  0x0000061ed38f0980 +
        0x420a5ed9 0xa02944ac 0x4de6c400 0x8cf45d56 +
        0x86dbcffb 0xe513726f 0x76940010 0x1b3954e5 +
        0x244e591c 0x38e27cf0 0x740863e2 0xe77f8a44 +
        0xe3b68608 0x0aea96d0 0xd8e82716 0x2c3ab5da 

WRITEBLKIO  0x0000060fe90d0640 +
        0x38a68d69 0x1176d0c7 0xd4749170 0x4e862017 +
        0x0db55225 0x95f70dd4 0xe2b69fd6 0xbd67c9cc +
        0x61f5b522 0x490f905e 0x1976b500 0x5419b19d +
        0xed5c850b 0x587f9e11 0xe87d10c1 0xf8dc83c2 

WRITEIO  0x0000061fb2980e40 4 0x65788a1c 

READMSKIO   0x000006198d249280 0xff00  0xcdd48b7b 0xef56b8af 0x00000000 0x00000000 

WRITEIO  0x00000615bd10e9c0 8 0x286a9adb 0x6e13321a 

READBLKIO  0x0000061ed38f0980 +
        0x420a5ed9 0xa02944ac 0x4de6c400 0x8cf45d56 +
        0x86dbcffb 0xe513726f 0x76940010 0x1b3954e5 +
        0x244e591c 0x38e27cf0 0x740863e2 0xe77f8a44 +
        0xe3b68608 0x0aea96d0 0xd8e82716 0x2c3ab5da 

WRITEIO  0x00000617b9ab4080 4 0x95c90a3a 

WRITEMSKIO  0x0000060d0a3a7840 0xff0f  0x69ccee7a 0x722d6107 0x00000000 0xa31948ce 

WRITEMSKIO  0x00000616e1710380 0xf00f  0x78a22b6d 0x00000000 0x00000000 0xcecf83bf 

WRITEBLK  0x00000000edabc900 +
        0xe47c9138 0x1abb14cb 0x7547d9be 0x8adfd3d3 +
        0x59d68456 0x930c9f01 0xb447e988 0xb5d95aa2 +
        0x68bb357e 0x9f951bc8 0x4604fd9d 0x36cddb4c +
        0x66509f63 0x0d6b0220 0x065685ca 0xfd6d8e3a 

WRITEIO  0x0000061efc33ff00 4 0x1a6e81ac 

READIO  0x0000061fb2980e40 4 0x65788a1c 
WRITEBLKIO  0x00000607e9c99e00 +
        0x68c54461 0xa84e8be5 0xca25022e 0xc9198813 +
        0x7073c32e 0x90552f59 0x7ec656c8 0x884475ae +
        0x84fd1c32 0x49524750 0x7ea9233c 0xe17ae4f3 +
        0x5c3c9a50 0xc702c4fb 0x0b7786ba 0x2d0c3e9b 

READBLK  0x00000000edabc900 +
        0xe47c9138 0x1abb14cb 0x7547d9be 0x8adfd3d3 +
        0x59d68456 0x930c9f01 0xb447e988 0xb5d95aa2 +
        0x68bb357e 0x9f951bc8 0x4604fd9d 0x36cddb4c +
        0x66509f63 0x0d6b0220 0x065685ca 0xfd6d8e3a 

READIO  0x00000615bd10e9c0 8 0x286a9adb 0x6e13321a 
READMSKIO   0x0000060d0a3a7840 0xff0f  0x69ccee7a 0x722d6107 0x00000000 0xa31948ce 

READMSKIO   0x00000616e1710380 0xf00f  0x78a22b6d 0x00000000 0x00000000 0xcecf83bf 

READIO  0x00000617b9ab4080 4 0x95c90a3a 
READBLKIO  0x0000060fe90d0640 +
        0x38a68d69 0x1176d0c7 0xd4749170 0x4e862017 +
        0x0db55225 0x95f70dd4 0xe2b69fd6 0xbd67c9cc +
        0x61f5b522 0x490f905e 0x1976b500 0x5419b19d +
        0xed5c850b 0x587f9e11 0xe87d10c1 0xf8dc83c2 

WRITEBLK  0x00000010de58b540 +
        0x211bd5fb 0x1d1c4062 0x72e96f1c 0x3d119c7f +
        0x200266d0 0x89c38592 0xd94534b6 0x62706dc5 +
        0xf29d819a 0xd6079dc5 0xcbeba43e 0x28a38c4e +
        0x7b3a7ca4 0x661370a9 0x2edb39d9 0xbd28401d 

READIO  0x0000061efc33ff00 4 0x1a6e81ac 
WRITEMSKIO  0x0000061860fb3b40 0xffff  0x26279b82 0x01a2c4f7 0x08d1d8c6 0x511dd223 

READBLKIO  0x00000607e9c99e00 +
        0x68c54461 0xa84e8be5 0xca25022e 0xc9198813 +
        0x7073c32e 0x90552f59 0x7ec656c8 0x884475ae +
        0x84fd1c32 0x49524750 0x7ea9233c 0xe17ae4f3 +
        0x5c3c9a50 0xc702c4fb 0x0b7786ba 0x2d0c3e9b 


BA LABEL_0
