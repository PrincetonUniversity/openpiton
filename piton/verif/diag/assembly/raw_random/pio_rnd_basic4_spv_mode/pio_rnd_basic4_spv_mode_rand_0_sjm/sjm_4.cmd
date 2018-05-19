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

WRITEIO  0x0000061d054c6840 4 0xfa6bedcb 

WRITEBLK  0x00000017627fab40 +
        0x183a1556 0x79d4e509 0xed9a5bb2 0x465c376e +
        0xbe93eab5 0x506f65da 0x47539e20 0xfe6257b1 +
        0x1e2484fb 0x1be2dea6 0xe22a024d 0x097b3f05 +
        0xb5191673 0x54d8e6b4 0xc68c5ec1 0x105674da 

WRITEMSKIO  0x0000061fd1cf0900 0xf0ff  0xc689460f 0x00000000 0x39beb04d 0xf5e19f26 


BA LABEL_0
