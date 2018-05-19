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

WRITEBLK  0x000000093ae2efc0 +
        0xd1609563 0xa9f098ac 0x1a19915e 0xdf200c7a +
        0x9f99664e 0xa9a31e62 0xc2de1dbb 0x34c5775e +
        0x69725ecc 0x9075e108 0x7217abee 0x34261175 +
        0x60710f87 0x1638e47f 0x7788b3da 0xcae16cde 

WRITEBLKIO  0x000006001831db80 +
        0xc0857ef7 0xdce823a8 0x2b653275 0x33fded73 +
        0x621e3b8e 0x56c5c3f4 0x4b9bb14b 0x00d03553 +
        0x3c1a4011 0x82914cde 0x44da8130 0x534d823f +
        0xe886e74a 0x5069c8c4 0xe1ebcc4f 0x8ab8eb6e 


BA LABEL_0
