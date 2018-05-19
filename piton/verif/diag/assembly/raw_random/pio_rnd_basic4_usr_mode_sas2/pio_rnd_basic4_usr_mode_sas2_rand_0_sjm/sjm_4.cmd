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

WRITEBLKIO  0x0000060f97c62240 +
        0xf3d70a33 0xa73de738 0x79e6cd94 0x6a243f80 +
        0xb8213ce7 0x57f06f82 0x470da1e3 0x310454a2 +
        0x61075730 0x2a62b30f 0xa13a881e 0x2942b67b +
        0x9879fcf0 0xf6750ffb 0x80fcfd3b 0x272df717 

WRITEBLKIO  0x000006197f697080 +
        0xbf448278 0xbfb3a379 0xd747f86c 0x701b8c73 +
        0xf607a624 0x1664fc07 0x94375f5c 0x05c774ec +
        0x903c4c1c 0x12abb10f 0x47802571 0x054d08fc +
        0xb8b04d6b 0xbc81c2f7 0xb1496da9 0x6f36ef4c 

WRITEBLKIO  0x0000061d9814e500 +
        0x43696853 0x16cfb4b8 0x28ee6449 0xf79c4402 +
        0x621992a7 0xe2760e57 0xe4585805 0xc8990ff0 +
        0xf96bd745 0x52d9d2bb 0x0cde548e 0xe3369150 +
        0x076f97f9 0x5e69df2a 0x9b2914b3 0x70f49b35 

WRITEBLK  0x0000000e447810c0 +
        0x57b92f6f 0xd4ae713d 0x7a9e3b7b 0xebdd59a2 +
        0xdb742fa8 0x375492e6 0xa793a023 0xa47bf391 +
        0x2ba73deb 0xbf24208a 0xdcefcebc 0x933ed2be +
        0xbe81abf2 0xab08ee32 0x2cd9df6b 0xb0921c94 


BA LABEL_0
