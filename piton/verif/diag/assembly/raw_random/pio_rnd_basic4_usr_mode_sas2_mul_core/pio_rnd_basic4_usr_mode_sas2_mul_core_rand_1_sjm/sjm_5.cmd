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

WRITEBLKIO  0x0000060f02ca8080 +
        0xf675ccdb 0xa1b55c9b 0x6ffd8580 0x7f21cf0f +
        0x3105382a 0x650ebcbd 0x0346fe0e 0x04c1748a +
        0xbda9e971 0x38d48a93 0x6f4f46aa 0x3ac726ec +
        0x011def49 0x60bc7742 0x14242084 0xe2690f0e 

WRITEBLKIO  0x00000600c4ecf2c0 +
        0xd99a8976 0xb0f2c8c0 0x89dd2c98 0xad6cb1cc +
        0xa4048c84 0x40891311 0x43ce15b2 0x3473a3d3 +
        0xe4f4dc58 0x7284e3d1 0x84a8d4d7 0xa3dcc1e8 +
        0x9e7763e9 0x0d3b5135 0x04bc82c1 0x08072449 

READBLKIO  0x0000060f02ca8080 +
        0xf675ccdb 0xa1b55c9b 0x6ffd8580 0x7f21cf0f +
        0x3105382a 0x650ebcbd 0x0346fe0e 0x04c1748a +
        0xbda9e971 0x38d48a93 0x6f4f46aa 0x3ac726ec +
        0x011def49 0x60bc7742 0x14242084 0xe2690f0e 


BA LABEL_0
