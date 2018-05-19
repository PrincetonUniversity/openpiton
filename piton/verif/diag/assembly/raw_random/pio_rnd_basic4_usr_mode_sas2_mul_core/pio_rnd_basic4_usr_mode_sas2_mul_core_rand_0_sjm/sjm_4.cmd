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

WRITEBLKIO  0x00000618ff47ccc0 +
        0xb970cfd4 0x03dd8a5a 0x21e91bc1 0x8013cb6e +
        0xa5f8ecef 0xbeeca35a 0x4affef00 0x36cad057 +
        0xe0432480 0xc4477c47 0xe0478cb2 0x01a39a19 +
        0xe664307f 0x56a68065 0x49a31ae2 0x31c70d9b 

WRITEMSKIO  0x0000060c53695700 0xf00f  0xb979fd68 0x00000000 0x00000000 0xff2f2c23 


BA LABEL_0
