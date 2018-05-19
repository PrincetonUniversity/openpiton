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

WRITEBLK  0x00000005f16a3a40 +
        0xe7004d5b 0x72b8ad0a 0xec260d5d 0xa4a313cc +
        0xc51efff0 0x22c60f23 0xfe2c9fcc 0x5ce6dfaa +
        0x0b2a4ba1 0x164c19f1 0x5e93a909 0x2927e9a5 +
        0x20696cbd 0xce6bafb4 0x5cd76264 0x3e39b329 

WRITEMSK  0x00000005f16a3a40 0xff000f0000f000f0 +
        0xacda205a 0xf3a6932e 0x00000000 0x00000000 +
        0x00000000 0x4720e312 0x00000000 0x00000000 +
        0x00000000 0x00000000 0x666f67b8 0x00000000 +
        0x00000000 0x00000000 0x027cb3d6 0x00000000 


BA LABEL_0
