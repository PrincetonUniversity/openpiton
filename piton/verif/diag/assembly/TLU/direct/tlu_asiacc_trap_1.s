// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tlu_asiacc_trap_1.s
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

#define PCONTEXT	0x10
#define SCONTEXT	0x10

#define MAIN_PAGE_NUCLEUS_ALSO
#define MAIN_PAGE_HV_ALSO

#include "enable_traps.h"
#include "boot.s"

.text
.global main

main:
	th_fork(main_th)

main_th_0:
main_th_1:
main_th_2:
main_th_3:
	nop
	mov	63,   %r16
	stxa	%r16, [%g0] 0x72	!irr
	nop
	stxa	%r16, [%g0] 0x73	!ivd
	nop
	stxa	%r16, [%g0] 0x74	!ivr
	nop
	ldxa	[%g0] 0x72, %g2		!irr
	nop                                
	ldxa	[%g0] 0x73, %g2		!ivd
	nop                                
	ldxa	[%g0] 0x74, %g2		!ivr
	nop
	mov	64,  %r18
	mov	0x3c0,  %r20
	stxa	%r18, [%r20] 0x25	!cpu_head
	nop
        add	%r20, 8, %r20
	stxa	%r18, [%r20] 0x25	!cpu_tail
	nop
        add	%r20, 8, %r20
	stxa	%r18, [%r20] 0x25	!dev_head
	nop
        add	%r20, 8, %r20
	stxa	%r18, [%r20] 0x25	!dev_tail
	nop
        add	%r20, 8, %r20
	stxa	%r18, [%r20] 0x25	!ressume_err_head
	nop
        add	%r20, 8, %r20
	stxa	%r18, [%r20] 0x25	!ressume_err_tail
	nop
        add	%r20, 8, %r20
	stxa	%r18, [%r20] 0x25	!nonresume_err_head
	nop
        add	%r20, 8, %r20
	stxa	%r18, [%r20] 0x25	!nonresume_err_tail
	nop
	mov	0x3c0, %r20
	ldxa	[%r20] 0x25, %g2	!cpu_head
	nop                                               
	add	%r20, 8, %r20                             
	ldxa	[%r20] 0x25, %g2	!cpu_tail
	nop                                               
	add	%r20, 8, %r20                             
	ldxa	[%r20] 0x25, %g2	!dev_head
	nop                                               
	add	%r20, 8, %r20                             
	ldxa	[%r20] 0x25, %g2	!dev_tail
	nop                                               
	add	%r20, 8, %r20                             
	ldxa	[%r20] 0x25, %g2	!ressume_err_head
	nop                                               
	add	%r20, 8, %r20                             
	ldxa	[%r20] 0x25, %g2	!ressume_err_tail
	nop                                               
	add	%r20, 8, %r20                             
	ldxa	[%r20] 0x25, %g2	!nonresume_err_head
	nop                                               
	add	%r20, 8, %r20                             
	ldxa	[%r20] 0x25, %g2	!nonresume_err_tail
	nop
	mov	1, %r18
	mov	0, %r20
	stxa	%r18, [%r20] 0x20	!scpd0
	nop
	add	%r18, 4, %r18
	add	%r20, 8, %r20
	stxa	%r18, [%r20] 0x20	!scpd1
	nop
	add	%r18, 4, %r18
	add	%r20, 8, %r20
	stxa	%r18, [%r20] 0x20	!scpd2
	nop
	add	%r18, 4, %r18
	add	%r20, 8, %r20
	stxa	%r18, [%r20] 0x20	!scpd3
	nop
	add	%r18, 4, %r18
	add	%r20, 8, %r20
	stxa	%r18, [%r20] 0x20	!scpd4
	nop
	add	%r18, 4, %r18
	add	%r20, 8, %r20
	stxa	%r18, [%r20] 0x20	!scpd5
	nop
	add	%r18, 4, %r18
	add	%r20, 8, %r20
	stxa	%r18, [%r20] 0x20	!scpd6
	nop
	add	%r18, 4, %r18
	add	%r20, 8, %r20
	stxa	%r18, [%r20] 0x20	!scpd7
	nop
	mov	0, %r20
	ldxa	[%r20] 0x20, %g2	!scpd0
	nop                                               
	add	%r20, 8, %r20
	ldxa	[%r20] 0x20, %g2	!scpd1
	nop                                               
	add	%r20, 8, %r20
	ldxa	[%r20] 0x20, %g2	!scpd2
	nop                                               
	add	%r20, 8, %r20
	ldxa	[%r20] 0x20, %g2	!scpd3
	nop                                               
	add	%r20, 8, %r20
	ldxa	[%r20] 0x20, %g2	!scpd4
	nop                                               
	add	%r20, 8, %r20
	ldxa	[%r20] 0x20, %g2	!scpd5
	nop                                               
	add	%r20, 8, %r20
	ldxa	[%r20] 0x20, %g2	!scpd6
	nop                                               
	add	%r20, 8, %r20
	ldxa	[%r20] 0x20, %g2	!scpd7
	nop                                               
	mov	1, %r18
	mov	0, %r20
	stxa	%r18, [%r20] 0x4f	!hscpd0
	nop
	add	%r18, 4, %r18
	add	%r20, 8, %r20
	stxa	%r18, [%r20] 0x4f	!hscpd1
	nop
	add	%r18, 4, %r18
	add	%r20, 8, %r20
	stxa	%r18, [%r20] 0x4f	!hscpd2
	nop
	add	%r18, 4, %r18
	add	%r20, 8, %r20
	stxa	%r18, [%r20] 0x4f	!hscpd3
	nop
	add	%r18, 4, %r18
	add	%r20, 8, %r20
	stxa	%r18, [%r20] 0x4f	!hscpd4
	nop
	add	%r18, 4, %r18
	add	%r20, 8, %r20
	stxa	%r18, [%r20] 0x4f	!hscpd5
	nop
	add	%r18, 4, %r18
	add	%r20, 8, %r20
	stxa	%r18, [%r20] 0x4f	!hscpd6
	nop
	add	%r18, 4, %r18
	add	%r20, 8, %r20
	stxa	%r18, [%r20] 0x4f	!hscpd7
	nop
	mov	0, %r20
	ldxa	[%r20] 0x4f, %g2	!hscpd0
	nop                                               
	add	%r20, 8, %r20
	ldxa	[%r20] 0x4f, %g2	!hscpd1
	nop                                               
	add	%r20, 8, %r20
	ldxa	[%r20] 0x4f, %g2	!hscpd2
	nop                                               
	add	%r20, 8, %r20
	ldxa	[%r20] 0x4f, %g2	!hscpd3
	nop                                               
	add	%r20, 8, %r20
	ldxa	[%r20] 0x4f, %g2	!hscpd4
	nop                                               
	add	%r20, 8, %r20
	ldxa	[%r20] 0x4f, %g2	!hscpd5
	nop                                               
	add	%r20, 8, %r20
	ldxa	[%r20] 0x4f, %g2	!hscpd6
	nop                                               
	add	%r20, 8, %r20
	ldxa	[%r20] 0x4f, %g2	!hscpd7
	nop                                               
	nop
	ta	T_CHANGE_PRIV	! macro
	nop
	mov	63,   %r16
	stxa	%r16, [%g0] 0x72	!irr
	nop
	stxa	%r16, [%g0] 0x73	!ivd
	nop
	stxa	%r16, [%g0] 0x74	!ivr
	nop
	ldxa	[%g0] 0x72, %g2		!irr
	nop                                
	ldxa	[%g0] 0x73, %g2		!ivd
	nop                                
	ldxa	[%g0] 0x74, %g2		!ivr
	nop
	mov	128,  %r18
	mov	0x3c8,  %r20
	stxa	%r18, [%r20] 0x25	!cpu_tail
	nop
        add	%r20, 16, %r20
	stxa	%r18, [%r20] 0x25	!dev_tail
	nop
        add	%r20, 16, %r20
	stxa	%r18, [%r20] 0x25	!ressume_err_tail
	nop
        add	%r20, 16, %r20
	stxa	%r18, [%r20] 0x25	!nonresume_err_tail
	nop
	mov	16, %r18
	mov	0x20, %r20
	stxa	%r18, [%r20] 0x20	!scpd4
	nop
	add	%r18, 16, %r18
	add	%r20, 8, %r20
	stxa	%r18, [%r20] 0x20	!scpd5
	nop
	mov	0x20, %r20
	ldxa	[%r20] 0x20, %g2	!scpd4
	nop                                               
	add	%r20, 8, %r20
	ldxa	[%r20] 0x20, %g2	!scpd5
	nop                                               
	mov	1, %r18
	mov	0, %r20
	stxa	%r18, [%r20] 0x4f	!hscpd0
	nop
	add	%r18, 4, %r18
	add	%r20, 8, %r20
	stxa	%r18, [%r20] 0x4f	!hscpd1
	nop
	add	%r18, 4, %r18
	add	%r20, 8, %r20
	stxa	%r18, [%r20] 0x4f	!hscpd2
	nop
	add	%r18, 4, %r18
	add	%r20, 8, %r20
	stxa	%r18, [%r20] 0x4f	!hscpd3
	nop
	add	%r18, 4, %r18
	add	%r20, 8, %r20
	stxa	%r18, [%r20] 0x4f	!hscpd4
	nop
	add	%r18, 4, %r18
	add	%r20, 8, %r20
	stxa	%r18, [%r20] 0x4f	!hscpd5
	nop
	add	%r18, 4, %r18
	add	%r20, 8, %r20
	stxa	%r18, [%r20] 0x4f	!hscpd6
	nop
	add	%r18, 4, %r18
	add	%r20, 8, %r20
	stxa	%r18, [%r20] 0x4f	!hscpd7
	nop
	mov	0, %r20
	ldxa	[%r20] 0x4f, %g2	!hscpd0
	nop                                               
	add	%r20, 8, %r20
	ldxa	[%r20] 0x4f, %g2	!hscpd1
	nop                                               
	add	%r20, 8, %r20
	ldxa	[%r20] 0x4f, %g2	!hscpd2
	nop                                               
	add	%r20, 8, %r20
	ldxa	[%r20] 0x4f, %g2	!hscpd3
	nop                                               
	add	%r20, 8, %r20
	ldxa	[%r20] 0x4f, %g2	!hscpd4
	nop                                               
	add	%r20, 8, %r20
	ldxa	[%r20] 0x4f, %g2	!hscpd5
	nop                                               
	add	%r20, 8, %r20
	ldxa	[%r20] 0x4f, %g2	!hscpd6
	nop                                               
	add	%r20, 8, %r20
	ldxa	[%r20] 0x4f, %g2	!hscpd7
	nop                                               
	nop
	ta	T_CHANGE_HPRIV	! macro
	nop
	mov	63,   %r16
	stxa	%r16, [%g0] 0x74	!ivr
	nop
	ldxa	[%g0] 0x73, %g2		!ivd
	nop                                
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.data
data_start:

	.xword	0x0000000000000000
	.xword	0x1111111111111111
	.xword	0x2222222222222222
	.xword	0x3333333333333333
	.xword	0x4444444444444444
	.xword	0x5555555555555555
	.xword	0x6666666666666666
	.xword	0x7777777777777777
	.xword	0x7777777777777777
	.xword	0x6666666666666666
	.xword	0x5555555555555555
	.xword	0x4444444444444444
	.xword	0x3333333333333333
	.xword	0x2222222222222222
	.xword	0x1111111111111111
	.xword	0x0000000000000000
.text
 /********************************
  *      Diag PASSED !           *
  ********************************/
diag_pass:
	ta	T_GOOD_TRAP

.data
	.xword 0x1234567887654321

