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

WRITEMSKIO  0x0000060fe1c0e680 0x0f00  0x00000000 0xf42f14fa 0x00000000 0x00000000 

WRITEBLKIO  0x0000061bb8509340 +
        0x01e56643 0x4f79d236 0x295aa310 0xeb492a5d +
        0xf8971b95 0xff206d69 0xbe7f7e7c 0xd585d144 +
        0xa46ae8e5 0xb62d69dc 0xdc6c7765 0x74ba875a +
        0x1e5fc53b 0xb8723a12 0x352eb7f3 0x249ad1b6 

READBLKIO  0x0000061bb8509340 +
        0x01e56643 0x4f79d236 0x295aa310 0xeb492a5d +
        0xf8971b95 0xff206d69 0xbe7f7e7c 0xd585d144 +
        0xa46ae8e5 0xb62d69dc 0xdc6c7765 0x74ba875a +
        0x1e5fc53b 0xb8723a12 0x352eb7f3 0x249ad1b6 

READMSKIO   0x0000060fe1c0e680 0x0f00  0x00000000 0xf42f14fa 0x00000000 0x00000000 

WRITEBLKIO  0x00000600a1c42ac0 +
        0x4b63d2eb 0x789862fa 0xec294ef5 0x13fc95ce +
        0xdac55b42 0x7e7a7e2f 0xc0b8d1ba 0xcd11095d +
        0x1e33d9ea 0xce265efc 0x919edb14 0x48370a4e +
        0xe4d72e22 0x93b2a2d3 0xfa60184f 0xeb2126e6 

WRITEBLK  0x0000000775b06140 +
        0xd4b77fa4 0x1bba0665 0x5ea240e7 0x09389c67 +
        0xcf243559 0xd3c54d52 0x05284d9d 0x7a3d6a11 +
        0xe1f76f5e 0x6b76d120 0x5bf92753 0xad2cc2ca +
        0xee35752b 0xbf87c57e 0x80ff6879 0x93b60bc6 

WRITEMSK  0x0000000775b06140 0x0ff0ff0000f00fff +
        0x00000000 0x2299a146 0x79472f7b 0x00000000 +
        0x8350524c 0x957cd88e 0x00000000 0x00000000 +
        0x00000000 0x00000000 0x956392e6 0x00000000 +
        0x00000000 0xdc825a7e 0x604c5567 0x763abd4c 

WRITEBLKIO  0x0000060d4bd1af80 +
        0x5176a6a8 0x4e3d7e0a 0xfd509326 0xd8e8082c +
        0x8b8ee81d 0x6f503206 0x46b11e48 0x624940ff +
        0xb5a70247 0x3aae7387 0xc59e5d79 0xa701a3ab +
        0xc8d664f2 0x54bc7557 0x1254bb7c 0x8bef443b 

WRITEBLK  0x0000000b9efb3c80 +
        0xd761782e 0xa4afe80b 0x1ac8b9c4 0x746d5b02 +
        0x488e5f21 0x33d8e9c1 0x9fc5c738 0x461621d2 +
        0x125045ae 0xc76ddd07 0xc843a6c0 0xaf326061 +
        0xad4530db 0xc15e3549 0x0ae8cf6e 0x7ce5b8d7 

READBLK  0x0000000775b06140 +
        0xd4b77fa4 0x2299a146 0x79472f7b 0x09389c67 +
        0x8350524c 0x957cd88e 0x05284d9d 0x7a3d6a11 +
        0xe1f76f5e 0x6b76d120 0x956392e6 0xad2cc2ca +
        0xee35752b 0xdc825a7e 0x604c5567 0x763abd4c 

WRITEMSK  0x0000000b9efb3c80 0x00ffff000f00000f +
        0x00000000 0x00000000 0xeba4cea7 0xc5cc9bde +
        0x27b44318 0x4da955d4 0x00000000 0x00000000 +
        0x00000000 0x66ad0436 0x00000000 0x00000000 +
        0x00000000 0x00000000 0x00000000 0xcb63615e 

READBLK  0x0000000b9efb3c80 +
        0xd761782e 0xa4afe80b 0xeba4cea7 0xc5cc9bde +
        0x27b44318 0x4da955d4 0x9fc5c738 0x461621d2 +
        0x125045ae 0x66ad0436 0xc843a6c0 0xaf326061 +
        0xad4530db 0xc15e3549 0x0ae8cf6e 0xcb63615e 

READBLKIO  0x00000600a1c42ac0 +
        0x4b63d2eb 0x789862fa 0xec294ef5 0x13fc95ce +
        0xdac55b42 0x7e7a7e2f 0xc0b8d1ba 0xcd11095d +
        0x1e33d9ea 0xce265efc 0x919edb14 0x48370a4e +
        0xe4d72e22 0x93b2a2d3 0xfa60184f 0xeb2126e6 


BA LABEL_0
