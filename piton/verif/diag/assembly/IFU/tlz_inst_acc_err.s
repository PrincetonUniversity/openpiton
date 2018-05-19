// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tlz_inst_acc_err.s
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
!This diag puts the m/c into an illegal state, namely
!priv=0 and TL > 0. Any instruction fetched in such a state
!should casue an instruction access exception
	
#define CIOP
#define  MAIN_PAGE_NUCLEUS_ALSO
#include "boot.s"
.global main
main:

ta T_CHANGE_PRIV
wrpr %g0, 0x1, %tl
rdpr %pstate, %g1
wrpr %g1, 0x4, %pstate
add %r0, 0x1234, %r1
add %r0, 0x1234, %r1
add %r0, 0x1234, %r1
add %r0, 0x1234, %r1
add %r0, 0x1234, %r1
add %r0, 0x1234, %r1
ta T_GOOD_TRAP
nop
