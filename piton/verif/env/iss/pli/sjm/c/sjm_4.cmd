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
CONFIG id=12
TIMEOUT 10000
WRITEBLK 0x000AF3FC980 +
	0xF1F1F1F1 0xF2F2F2F2 0xF3F3F3F3 0xF4F4F4F4 +
	0xF5F5F5F5 0xF6F6F6F6 0xF7F7F7F7 0xF8F8F8F8 +
	0xF9F9F9F9 0xFaFaFaFa 0xFbFbFbFb 0xFcFcFcFc +
	0xFdFdFdFd 0xFeFeFeFe 0xFfFfFfFf 0xF0F0F0F0 
WAIT    200
WRITEMSK 0x000C3560200 0xFFFF0000FFFF0000 +
	0x4FB46A33 0x1CF4F766 0x575CDFCE 0x5F980597 +
	0x2FEEA7B6 0x2450C661 0x6037AE20 0x2F3599F0 +
	0xE7A8846C 0x726097D0 0x1802C376 0xAB6D4E15 +
	0x10C25609 0xD99FC9B3 0x9221BFD4 0x71B63A9B 
READBLK 0x000AF3FC980 +
	0xF1F1F1F1 0xF2F2F2F2 0xF3F3F3F3 0xF4F4F4F4 +
	0xF5F5F5F5 0xF6F6F6F6 0xF7F7F7F7 0xF8F8F8F8 +
	0xF9F9F9F9 0xFaFaFaFa 0xFbFbFbFb 0xFcFcFcFc +
	0xFdFdFdFd 0xFeFeFeFe 0xFfFfFfFf 0xF0F0F0F0  
READ    0x010F4616340 64 +
	0xE0E0E0E0 0xE1E1E1E1 0xE2E2E2E2 0xE3E3E3E3 +
	0xE4E4E4E4 0xE5E5E5E5 0xE6E6E6E6 0xE7E7E7E7 +
	0xE8E8E8E8 0xE9E9E9E9 0xEaEaEaEa 0xEbEbEbEb +
	0xEcEcEcEc 0xEdEdEdEd 0xEeEeEeEe 0xEfEfEfEf 
WRITEBLK 0x010F4616340 +
	0xA0A0A0A0 0xA1A1A1A1 0xA2A2A2A2 0xA3A3A3A3 +
	0xA4A4A4A4 0xA5A5A5A5 0xA6A6A6A6 0xA7A7A7A7 +
	0xA8A8A8A8 0xA9A9A9A9 0xAaAaAaAa 0xAbAbAbAb +
	0xAcAcAcAc 0xAdAdAdAd 0xAeAeAeAe 0xAfAfAfAf 
WAIT    1000
