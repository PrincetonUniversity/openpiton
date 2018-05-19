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
# SEED = 3890546260
TIMEOUT 1000000
IOSYNC
INT 0x00F00000000 +
	0xD84FA62D 0x4E4E83C9 0xF4D586F9 0xA2F4743B +
	0xC6C0DAC0 0x7AFB8545 0x7AE960C4 0x82D44FA9 +
	0x9A024F6F 0xE2527097 0x8D25D14B 0x1FE845AD +
	0xD18ED9F 0xF73ABC29 0x6D4809B4 0x5BF58FD3 
