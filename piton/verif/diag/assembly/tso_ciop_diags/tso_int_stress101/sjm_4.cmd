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

WRITEIO 0x7CF00BEE100 8 0x00000000 0x00000000
LABEL001:

INT  0x0000002e00000000 +
        0x00000000 0x00000001 0x00000000 0x00000011 +
        0xbadcafe1 0xbadcafe1 0xbadcafe1 0xbadcafe1 +
        0x00000001 0x00000001 0x00000001 0xbadcafe1 +
        0xbadcafe1 0xbadcafe1 0xbadcafe1 0xbadcafe1 

READIO 0x7CF00BEE100 8 0x00000000 0x00000000 setcc
BE LABEL001
