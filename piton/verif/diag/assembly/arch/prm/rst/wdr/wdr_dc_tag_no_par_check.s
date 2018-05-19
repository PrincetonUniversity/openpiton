// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: wdr_dc_tag_no_par_check.s
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
/***********************************************************************
 * Name:      	wdr_dc_tag_no_par_check.s 
 * Date:  	Nov, 2003 
 *
 * Description:



 **********************************************************************/

#define MY_PASS setx 0x82000, %r1, %r2; jmp %r2;nop
#define MY_FAIL setx 0x82020, %r1, %r2; jmp %r2;nop

#include "err_defines.h"
#include "defines.h"

#define ASI_LSU_CTL_REG 0x45
#define ASI_SPARC_ERROR_EN_REG 0x4b
#define  L2_BANK_ADDR       0x40


#define  My_Power_On_Reset setx check,  %g2, %g1;  jmpl    %g1, %g0; nop 

.global check 

SECTION .RED_SEC0 TEXT_VA=3006000, DATA_VA=3008000

attr_text {
        Name=.RED_SEC0,
        hypervisor
}

attr_data {
        Name=.RED_SEC0,
        hypervisor
}


check:
	nop
        wr  %g0, 0, %ccr
        wr  %g0, 0, %asi
        wrpr    %g0, 0, %cwp

dc_tag:
	setx    0xffffffffffffffff, %i5, %i1
	set	0x0, %g1
 	stxa	%i1, [%g1]ASI_DCACHE_TAG
	membar	0x40
	
read_b4:
        set     0x0, %g1
        ldxa    [%g1]ASI_DCACHE_TAG, %g2

	set	0x7fffffff, %g1
	cmp	%g1, %g2
	bne	bad_end

set_wdr:
        setx    0x9800000800, %i0, %i1  ! PA of INT_VEC_DIS
        setx    0x0000010002, %i0, %i2  ! type=reset traptype=WDR

        stx     %i2, [%i1]

wdr_loop:
        add %g0, 1, %o1
        cmp %o1, 100
        ble wdr_loop
        nop

        MY_FAIL
        nop

#define  My_Watchdog_Reset setx    wdr,  %o5, %o6; \
                           jmpl    %o6, %g0; nop


.global wdr 
wdr:

wdr:
	nop
check_dc_tag:
	set	0x0, %g1
	setx	0x1fffffff, %i5, %g3
	ldxa	[%g1]ASI_DCACHE_TAG, %g2

        set     0x7fffffff, %g1
        cmp     %g1, %g2
        bne     bad_end

	MY_PASS

bad_end:
        MY_FAIL

good_end:
        MY_PASS

.data
red_data:
        .word 0x5aaaaaaa, 0x5aaaaaaa
        .word 0x00000000, 0x00000000

temp_data:
        .word 0x00000000, 0x00000000


#include "boot.s"

.text
.global main
main:
    MY_FAIL


