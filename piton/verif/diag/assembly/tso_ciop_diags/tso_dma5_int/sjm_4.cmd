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
TIMEOUT 100000
IOSYNC

WRITEBLK 0x1170000000 +
        0x00000000 0x00000055 0x00000002 0x00000003 +
        0x00000004 0x00000005 0x00000006 0x00000007 +
        0x00000008 0x00000009 0x0000000A 0x0000000B +
        0x0000000C 0x0000000D 0x0000000E 0x0000000F
INT 0x00E00000000 +
	0x00000001 0x00000002 0x00000003 0x00000004 +
	0x00000005 0x00000006 0x00000007 0x00000008 +
	0x00000009 0x0000000a 0x0000000b 0x0000000c +
	0x0000000d 0x0000000e 0x0000000f 0x00000000 
READBLK 0x01170000000 +
        0x00000000 0x00000055 0x00000002 0x00000003 +
        0x00000004 0x00000005 0x00000006 0x00000007 +
        0x00000008 0x00000009 0x0000000a 0x0000000b +
        0x0000000c 0x0000000d 0x0000000e 0x0000000f

LABEL0:
READIO 0x61170000000 8 0x00000000 0x00000000 setcc
BNE LABEL0


WRITEBLK 0x1170000000 +
        0x00000000 0x00000055 0x00000002 0x00000003 +
        0x00000004 0x00000005 0x00000006 0x00000007 +
        0x00000008 0x00000009 0x0000000A 0x0000000B +
        0x0000000C 0x0000000D 0x0000000E 0x0000000F
INT 0x00E00000000 +
	0x00000001 0x00000002 0x00000003 0x00000004 +
	0x00000005 0x00000006 0x00000007 0x00000008 +
	0x00000009 0x0000000a 0x0000000b 0x0000000c +
	0x0000000d 0x0000000e 0x0000000f 0x00000000 
READBLK 0x01170000000 +
        0x00000000 0x00000055 0x00000002 0x00000003 +
        0x00000004 0x00000005 0x00000006 0x00000007 +
        0x00000008 0x00000009 0x0000000a 0x0000000b +
        0x0000000c 0x0000000d 0x0000000e 0x0000000f
