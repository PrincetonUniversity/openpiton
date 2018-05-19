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
IOSYNC

READBLK 0x01170000000 +
	0x11111111 0x22222222 0x33333333 0x44444444 +
	0x55555555 0x66666666 0x77777777 0x88888888 +
	0x99999999 0xAAAAAAAA 0xBBBBBBBB 0xCCCCCCCC +
	0xDDDDDDDD 0xEEEEEEEE 0xBABABABA 0xBEBEBEF0 

WRITEBLK 0x01170000080 +
	0x91111111 0x92222222 0x93333333 0x94444444 +
	0x95555555 0x96666666 0x97777777 0x98888888 +
	0x99999999 0x9AAAAAAA 0x9BBBBBBB 0x9CCCCCCC +
	0x9DDDDDDD 0x9EEEEEEE 0x9ABABABA 0x9EBEBEF0 

