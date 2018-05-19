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
IOSYNC

READBLK 0x01170000040 +
	0xF1111111 0xF2222222 0xF3333333 0xF4444444 +
	0xF5555555 0xF6666666 0xF7777777 0xF8888888 +
	0xF9999999 0xFAAAAAAA 0xFBBBBBBB 0xFCCCCCCC +
	0xFDDDDDDD 0xFEEEEEEE 0xFABABABA 0xFEBEBEF0 

WRITEBLK 0x011700000C0 +
	0xC1111111 0xC2222222 0xC3333333 0xC4444444 +
	0xC5555555 0xC6666666 0xC7777777 0xC8888888 +
	0xC9999999 0xCAAAAAAA 0xCBBBBBBB 0xCCCCCCCC +
	0xCDDDDDDD 0xCEEEEEEE 0xCABABABA 0xCEBEBEF0 
