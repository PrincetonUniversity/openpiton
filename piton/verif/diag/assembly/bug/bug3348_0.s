// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: bug3348_0.s
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
/*************************************************************
  File:         bug_3348_direct.s

  Description:
  ------------


	41945926  : C5T2 v20100000      prefetch [%o3 + %g0] 0x1, 3    (pa=1130100000  )
            C5T2                old reg values: %o3= 0000000018100000 %g0= 0
43102382  : C5T2 v20100004      sth %l5, [%o3 + 12]            (pa=1130100004  )
            C5T2                old reg values: %l5= 0000000000000064 %o3= 0000000018100000
43103238  : C5T2 v20100008      jmpl [%o4 + %g0], %o7          (pa=1130100008  )
            C5T2                old reg values: %o4= 0000000020100000 %g0= 0 %o7= 0000000020100008
43103238  : C5T2 v2010000c      prefetch [%o3 + %g0], 0        (pa=113010000c  )
            C5T2                old reg values: %o3= 0000000018100000 %g0= 0
43103238  : C5T2                REG UPDATE <%o7 = 0000000020100008> in window 1
43138334  : C5T2 v20100000      prefetch [%o3 + %g0] 0x1, 3    (pa=1130100000  )
            C5T2                old reg values: %o3= 0000000018100000 %g0= 0

T
The above tight prefetch and store loop makes the thread timeout.

From the dump the last pref out is v2010000c.

The pref_ackcnt for this thread reaches 0, but the completion signal is not
seen from IFU.
a tmp.rc is saved in case it helps.
 *************************************************************/


#define THREAD_COUNT   32
#include "boot.s"

#define lp_cnt  %l4
#define TOT 145


.text
.global main

main:

	set     TOT, lp_cnt
	setx	DATA, %l0, %o3
	set	31, %l5
	call	LOOP
	prefetch [%o3 + %g0], 0

.align  0x100000
LOOP:
	prefetcha [%o3 + %g0] 0x1, 3    
	sth %l5, [%o3 + 12]
	subcc	lp_cnt, 1, lp_cnt	            
	bnz LOOP
        prefetch [%o3 + %g0], 0        
    
        ta      T_GOOD_TRAP
        nop


.data
DATA:

        .word 0x12345678
        .word 0x01234567
        .word 0x1234567a
        .word 0x234567bc
        .word 0x234567cd
        .word 0x34567abc



    





