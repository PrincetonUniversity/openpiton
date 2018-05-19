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
CONFIG id=14
TIMEOUT 10000
WRITEBLK 0x010F4616340 +
	0xE0E0E0E0 0xE1E1E1E1 0xE2E2E2E2 0xE3E3E3E3 +
	0xE4E4E4E4 0xE5E5E5E5 0xE6E6E6E6 0xE7E7E7E7 +
	0xE8E8E8E8 0xE9E9E9E9 0xEaEaEaEa 0xEbEbEbEb +
	0xEcEcEcEc 0xEdEdEdEd 0xEeEeEeEe 0xEfEfEfEf 
WAIT    100
WRITEMSK 0x010643205C0 0x00FF00FF00FF00FF +
	0x7B9DE04E 0x97B77DFD 0x23CE8477 0x28C7CF90 +
	0x552BEE7D 0xFABFBCC3 0xEF3042E5 0x2447B56C +
	0x790B4CDB 0xB933E418 0x1C03B72c 0x5FECABF2 +
	0xAD08D705 0xC1915904 0x42C81C80 0x6BD0F0F9 
WAIT    50
#READBLK 0x010F4616340 +
#	0xE0E0E0E0 0xE1E1E1E1 0xE2E2E2E2 0xE3E3E3E3 +
#	0xE4E4E4E4 0xE5E5E5E5 0xE6E6E6E6 0xE7E7E7E7 +
#	0xE8E8E8E8 0xE9E9E9E9 0xEaEaEaEa 0xEbEbEbEb +
#	0xEcEcEcEc 0xEdEdEdEd 0xEeEeEeEe 0xEfEfEfEf 
## 32-Byte aligned RDD
READBLK 0x010F4616360 +
	0xE0E0E0E0 0xE1E1E1E1 0xE2E2E2E2 0xE3E3E3E3 +
	0xE4E4E4E4 0xE5E5E5E5 0xE6E6E6E6 0xE7E7E7E7 +
	0xE8E8E8E8 0xE9E9E9E9 0xEaEaEaEa 0xEbEbEbEb +
	0xEcEcEcEc 0xEdEdEdEd 0xEeEeEeEe 0xEfEfEfEf 
IFETCH 0x000AF3FC980 64 +
	0xF1F1F1F1 0xF2F2F2F2 0xF3F3F3F3 0xF4F4F4F4 +
	0xF5F5F5F5 0xF6F6F6F6 0xF7F7F7F7 0xF8F8F8F8 +
	0xF9F9F9F9 0xFaFaFaFa 0xFbFbFbFb 0xFcFcFcFc +
	0xFdFdFdFd 0xFeFeFeFe 0xFfFfFfFf 0xF0F0F0F0  
WAIT    1000
