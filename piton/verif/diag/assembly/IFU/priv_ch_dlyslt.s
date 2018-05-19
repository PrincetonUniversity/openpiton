// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: priv_ch_dlyslt.s
* Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
* DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
* 
* The above named program is free software; you can redistribute it and/or
* modify it under the terms of the GNU General Public
* License version 2 as published by the Free Software Foundation.
* 
* The above named program is distributed in the hope that it will be 
* useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
* General Public License for more details.
* 
* You should have received a copy of the GNU General Public
* License along with this work; if not, write to the Free Software
* Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
* 
* ========== Copyright Header End ============================================
*/
!This diag changes the priv bit in the delay slot of a branch
	
#define CIOP
#define  MAIN_PAGE_NUCLEUS_ALSO
#define  MAIN_PAGE_HV_ALSO	
#include "boot.s"
.global main
main:

setx target0, %r1, %r2
ta T_CHANGE_PRIV
rdpr %pstate, %g1
jmpl %r2, %r0
wrpr %g1, 0x4, %pstate
nop
nop
nop
nop	
target0:
ta T_CHANGE_NONPRIV
save %r0, %r0, %r0
setx target1, %r1, %r2	
ta T_CHANGE_HPRIV	
rdhpr %hpstate, %g1
return %r2
wrhpr %g1, 0x4, %hpstate
nop
nop
nop
nop
target1:	
ta T_GOOD_TRAP
