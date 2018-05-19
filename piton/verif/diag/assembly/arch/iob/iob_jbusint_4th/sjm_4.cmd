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

INT 0x00000000000 +
	0x01010101 0x01010101 0x00000000 0x00000000 +
	0xE0E0E0E0 0xE0E0E0E0 0xE0E0E0E0 0xE0E0E0E0 +
	0xE0E0E0E0 0xE0E0E0E0 0xE0E0E0E0 0xE0E0E0E0 +
	0xE0E0E0E0 0xE0E0E0E0 0xE0E0E0E0 0xE0E0E0E0 

INT 0x02000000000 +
	0x21212121 0x21212121 0x20202020 0x20202020 +
	0xE0E0E0E0 0xE0E0E0E0 0xE0E0E0E0 0xE0E0E0E0 +
	0xE0E0E0E0 0xE0E0E0E0 0xE0E0E0E0 0xE0E0E0E0 +
	0xE0E0E0E0 0xE0E0E0E0 0xE0E0E0E0 0xE0E0E0E0 

INT 0x00000000000 +
	0x03030303 0x03030303 0x02020202 0x02020202 +
	0xE0E0E0E0 0xE0E0E0E0 0xE0E0E0E0 0xE0E0E0E0 +
	0xE0E0E0E0 0xE0E0E0E0 0xE0E0E0E0 0xE0E0E0E0 +
	0xE0E0E0E0 0xE0E0E0E0 0xE0E0E0E0 0xE0E0E0E0 

INT 0x02000000000 +
	0x23232323 0x23232323 0x22222222 0x22222222 +
	0xE0E0E0E0 0xE0E0E0E0 0xE0E0E0E0 0xE0E0E0E0 +
	0xE0E0E0E0 0xE0E0E0E0 0xE0E0E0E0 0xE0E0E0E0 +
	0xE0E0E0E0 0xE0E0E0E0 0xE0E0E0E0 0xE0E0E0E0 
