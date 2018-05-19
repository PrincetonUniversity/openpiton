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

WRITEIO  0x000006182ac4da80 8 0x4c5979e3 0xfd9e148c 

WRITEIO  0x0000060ee4b14380 8 0xa477703b 0x74b2ea4c 

WRITEBLKIO  0x00000610b884c840 +
        0x62214956 0xee71e54f 0x0e8cdc0e 0xd03dec8f +
        0x0ed6e459 0xbd2c6ac9 0x026ff0ff 0xc94ba2cb +
        0x7a1b5b88 0xbb93c2a9 0xf7974d2e 0xf1b19846 +
        0xafbcdc32 0xf2792a6e 0xd97e90c2 0xcaa986fd 

READBLKIO  0x00000610b884c840 +
        0x62214956 0xee71e54f 0x0e8cdc0e 0xd03dec8f +
        0x0ed6e459 0xbd2c6ac9 0x026ff0ff 0xc94ba2cb +
        0x7a1b5b88 0xbb93c2a9 0xf7974d2e 0xf1b19846 +
        0xafbcdc32 0xf2792a6e 0xd97e90c2 0xcaa986fd 


BA LABEL_0
