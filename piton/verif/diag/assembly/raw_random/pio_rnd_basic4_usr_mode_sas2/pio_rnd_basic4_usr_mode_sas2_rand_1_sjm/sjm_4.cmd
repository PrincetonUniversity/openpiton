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

WRITEBLK  0x000000179498a540 +
        0x49e02d6b 0xc207d00e 0x94886ddb 0x7930608d +
        0x3942b869 0x6a9f8417 0x577a16ae 0x33ed44de +
        0xea0411d0 0x76f59012 0xcd454ea7 0x1b1c0c52 +
        0x5251a03b 0x335bb20f 0x76d51ca8 0x44f55af2 

WRITEBLKIO  0x0000061fdb43d7c0 +
        0x62a52230 0xcad624d9 0x9d9640cd 0x10910d9c +
        0x84348427 0x0893a9ae 0x2ee20537 0xae367008 +
        0xbbfacc6d 0xb924b245 0xf5c1ab94 0x0626151a +
        0x33e8ebff 0x85f652df 0x3b308e88 0x4cfa6ff3 


BA LABEL_0
