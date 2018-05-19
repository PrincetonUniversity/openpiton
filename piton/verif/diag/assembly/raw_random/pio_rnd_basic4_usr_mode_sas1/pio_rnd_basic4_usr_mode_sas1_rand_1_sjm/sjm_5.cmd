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

WRITEBLKIO  0x0000061d6cddc340 +
        0xa7cda134 0x4f9e067e 0x34760330 0x4f412bd9 +
        0xa9443771 0xb258a173 0xcdc40c68 0x32a53ed2 +
        0x81048a96 0xef7169e6 0xf065a6f6 0x3c5a2da3 +
        0x9987cd0f 0x2473d0d2 0xfb491228 0xe01e5d98 

WRITEMSKIO  0x00000609125f3540 0x00ff  0x00000000 0x00000000 0x23758f50 0x61be4343 

WRITEBLK  0x0000001391ff6e00 +
        0x148608ee 0x4d514f87 0x7395462c 0x5e0800af +
        0x09280dc5 0x1c3118be 0x0b57a9c4 0x0d23b8b6 +
        0xd492ab85 0x4562103f 0x86041465 0x22fd9eb7 +
        0xbe9eab2f 0xf4d2d99e 0x87eec104 0x9a88715f 


BA LABEL_0
