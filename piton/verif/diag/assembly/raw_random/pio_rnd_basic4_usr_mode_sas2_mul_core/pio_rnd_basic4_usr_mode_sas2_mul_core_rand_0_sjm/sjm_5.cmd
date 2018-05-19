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

WRITEBLK  0x00000005f95b8940 +
        0xcc390bab 0x00ac937e 0x23ef8b5f 0x3377b096 +
        0x7ff7ba4e 0xdda83f70 0x592ca02f 0x68f52e5d +
        0x7854e879 0xa0833de4 0xb7c4d05e 0xb4bd1e82 +
        0xaee350f9 0x0b1074a0 0xf3693a95 0x22a9c607 

WRITEMSK  0x00000005f95b8940 0x00ff0fffff00f0f0 +
        0x00000000 0x00000000 0xb7df2c5c 0x63796efd +
        0x00000000 0xcd06848d 0x701cad2f 0x19af048b +
        0xbd05e25a 0x576b5dfc 0x00000000 0x00000000 +
        0x85818728 0x00000000 0xb66b32d0 0x00000000 

WRITEBLKIO  0x0000061590654d00 +
        0xd6baa931 0x41e20b0a 0xafe962ba 0xdf57c8dc +
        0x20760551 0x35cf4790 0x8de62d63 0x1f647e76 +
        0xa5b95d26 0x0a5e8344 0xd88d15ec 0x1f1cbbd7 +
        0x3170d9c2 0x8361ef82 0xce662d10 0xaf8de45b 

READBLK  0x00000005f95b8940 +
        0xcc390bab 0x00ac937e 0xb7df2c5c 0x63796efd +
        0x7ff7ba4e 0xcd06848d 0x701cad2f 0x19af048b +
        0xbd05e25a 0x576b5dfc 0xb7c4d05e 0xb4bd1e82 +
        0x85818728 0x0b1074a0 0xb66b32d0 0x22a9c607 


BA LABEL_0
