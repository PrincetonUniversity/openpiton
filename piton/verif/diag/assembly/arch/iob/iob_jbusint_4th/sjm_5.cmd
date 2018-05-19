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

INT 0x01000000000 +
	0x11111111 0x11111111 0x10101010 0x10101010 +
	0xE0E0E0E0 0xE0E0E0E0 0xE0E0E0E0 0xE0E0E0E0 +
	0xE0E0E0E0 0xE0E0E0E0 0xE0E0E0E0 0xE0E0E0E0 +
	0xE0E0E0E0 0xE0E0E0E0 0xE0E0E0E0 0xE0E0E0E0 

INT 0x03000000000 +
	0x31313131 0x31313131 0x30303030 0x30303030 +
	0xE0E0E0E0 0xE0E0E0E0 0xE0E0E0E0 0xE0E0E0E0 +
	0xE0E0E0E0 0xE0E0E0E0 0xE0E0E0E0 0xE0E0E0E0 +
	0xE0E0E0E0 0xE0E0E0E0 0xE0E0E0E0 0xE0E0E0E0 

INT 0x01000000000 +
	0x13131313 0x13131313 0x12121212 0x12121212 +
	0xE0E0E0E0 0xE0E0E0E0 0xE0E0E0E0 0xE0E0E0E0 +
	0xE0E0E0E0 0xE0E0E0E0 0xE0E0E0E0 0xE0E0E0E0 +
	0xE0E0E0E0 0xE0E0E0E0 0xE0E0E0E0 0xE0E0E0E0 

INT 0x03000000000 +
	0x33333333 0x33333333 0x32323232 0x32323232 +
	0xE0E0E0E0 0xE0E0E0E0 0xE0E0E0E0 0xE0E0E0E0 +
	0xE0E0E0E0 0xE0E0E0E0 0xE0E0E0E0 0xE0E0E0E0 +
	0xE0E0E0E0 0xE0E0E0E0 0xE0E0E0E0 0xE0E0E0E0 
