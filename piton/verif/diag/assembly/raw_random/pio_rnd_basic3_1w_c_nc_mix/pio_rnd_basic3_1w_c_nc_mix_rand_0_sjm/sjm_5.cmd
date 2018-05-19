# Modified by Princeton University on June 9th, 2015
# ========== Copyright Header Begin ==========================================
# 
# OpenSPARC T1 Processor File: sjm_5.cmd
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
CONFIG id=30 iosyncadr=0x7EF00BEEF00
TIMEOUT 10000000
IOSYNC
#==================================================
#==================================================


LABEL_0:

WRITEMSKIO  0x0000060e5005fe00 0xff00  0x8c85bd44 0xe1f130a5 0x00000000 0x00000000 

WRITEBLK  0x000000177cc51240 +
        0xca7afe47 0x065bb86b 0xc261a2db 0xe6ef092b +
        0xbbb137dd 0x3bf753d6 0xce52cefa 0xd594b7e5 +
        0x0e07376b 0x3ee095b9 0x4e0e1b04 0x1fc1bc7f +
        0x11948b7d 0xac12a080 0x0be1eac8 0x5b3caa46 

WRITEMSK  0x000000177cc51240 0x00ff000f00000ff0 +
        0x00000000 0x00000000 0x0a1204c2 0x092e82a4 +
        0x00000000 0x00000000 0x00000000 0xee1ade2e +
        0x00000000 0x00000000 0x00000000 0x00000000 +
        0x00000000 0xaae94649 0x46849017 0x00000000 

WRITEBLKIO  0x0000060be7519f00 +
        0xa345aafe 0x63e4f5c2 0xd63eb543 0xb0eee445 +
        0xb520c24d 0xf0a35939 0x3da04c05 0xc301e071 +
        0x25a9d33d 0x233e916f 0x5e802140 0xf21f5824 +
        0xd8d63e8e 0x1443df26 0xe55e2f9f 0xc6f62364 

READMSKIO   0x0000060e5005fe00 0xff00  0x8c85bd44 0xe1f130a5 0x00000000 0x00000000 

WRITEIO  0x00000610cec6f2c0 4 0x49478382 

READBLKIO  0x0000060be7519f00 +
        0xa345aafe 0x63e4f5c2 0xd63eb543 0xb0eee445 +
        0xb520c24d 0xf0a35939 0x3da04c05 0xc301e071 +
        0x25a9d33d 0x233e916f 0x5e802140 0xf21f5824 +
        0xd8d63e8e 0x1443df26 0xe55e2f9f 0xc6f62364 

READBLK  0x000000177cc51240 +
        0xca7afe47 0x065bb86b 0x0a1204c2 0x092e82a4 +
        0xbbb137dd 0x3bf753d6 0xce52cefa 0xee1ade2e +
        0x0e07376b 0x3ee095b9 0x4e0e1b04 0x1fc1bc7f +
        0x11948b7d 0xaae94649 0x46849017 0x5b3caa46 

READIO  0x00000610cec6f2c0 4 0x49478382 
WRITEMSKIO  0x000006052a163cc0 0x000f  0x00000000 0x00000000 0x00000000 0x38113daa 

READMSKIO   0x000006052a163cc0 0x000f  0x00000000 0x00000000 0x00000000 0x38113daa 

WRITEMSKIO  0x000006044721a0c0 0xffff  0xa96de6cd 0xb75bbeb7 0xc9b446e9 0x8add9809 

WRITEIO  0x000006189a24ca40 4 0xe531c0bd 

READIO  0x000006189a24ca40 4 0xe531c0bd 
READMSKIO   0x000006044721a0c0 0xffff  0xa96de6cd 0xb75bbeb7 0xc9b446e9 0x8add9809 

WRITEMSKIO  0x0000061df60dd000 0x0ff0  0x00000000 0x1fde7640 0x3e851694 0x00000000 

WRITEMSKIO  0x00000607e4e56b40 0xff00  0xcb5e5758 0x1d658be6 0x00000000 0x00000000 

WRITEBLK  0x000000055c691ec0 +
        0x0b857619 0xab0e6b7b 0xdd004bda 0x9f8249d9 +
        0xcf7a5692 0xf6b2f56c 0x3e79ef1d 0x4b27f0ec +
        0x1659773b 0xd589213a 0xf3779d3a 0x14fb1528 +
        0xe2bdd183 0xdc3a63d7 0xe43853a5 0xfe510a7c 

WRITEMSKIO  0x0000061e37369f80 0xfff0  0x76d7c772 0x7e55c826 0x94eb8d68 0x00000000 

READMSKIO   0x0000061df60dd000 0x0ff0  0x00000000 0x1fde7640 0x3e851694 0x00000000 

WRITEIO  0x0000061b60037340 8 0xa7603e5e 0x3c8f4bc9 

WRITEIO  0x0000060e744cf6c0 4 0xce4a31f9 

READMSKIO   0x00000607e4e56b40 0xff00  0xcb5e5758 0x1d658be6 0x00000000 0x00000000 

READMSKIO   0x0000061e37369f80 0xfff0  0x76d7c772 0x7e55c826 0x94eb8d68 0x00000000 


BA LABEL_0
