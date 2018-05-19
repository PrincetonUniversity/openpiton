// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tlu_tick_read_2.s
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
!/******************************************************************************
This diag excercises the tick/stick write by user/supervisor/hypervisor on
all 4 threads
*******************************************************************************/

#define PCONTEXT	0x10
#define SCONTEXT	0x10

#define MAIN_PAGE_NUCLEUS_ALSO
#define MAIN_PAGE_HV_ALSO

#define ALL_MY_INTRP_HANDLERS
#include "my_intr_handlers.s"
#include "my_trap_handlers.s"

#include "enable_traps.h"
#include "boot.s"

.text
.global main

main:
	nop
	rd	%sys_tick, %r20
	nop
	ta	T_CHANGE_PRIV	! macro
	rd	%sys_tick, %r20
	ta	T_CHANGE_NONPRIV	! macro
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd	%sys_tick, %r20
	nop
	setx	0xf000000000000000, %g1, %r20
	wrpr	%r20, %tick
	rd	%sys_tick, %r20
	ta	T_CHANGE_NONHPRIV	! macro
	nop
	rd	%sys_tick, %r20
	nop
	ta	T_CHANGE_PRIV	! macro
	rd	%sys_tick, %r20
	ta	T_CHANGE_NONPRIV	! macro
	nop
	nop
	nop
	nop
 /********************************
  *      Diag PASSED !           *
  ********************************/
diag_pass:
	ta	T_GOOD_TRAP
	nop
	.data
data_start:
	.xword 0x0000000000000000
	.xword 0x0000000000000000
	.xword 0x0000000000000000
	.xword 0x0000000000000000

