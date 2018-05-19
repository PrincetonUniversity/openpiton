// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: wmr_ccr.s
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
 * Name: 	red_wr_regs1.s  
 * Date:  	Nov, 2003 
 *
 * Description:

     After POR, diag writes to the folloowing registers;
     causes WDR; rhen checks the value:

	pc
	npc
	rstv
	fprs
	ccr
	y-reg
	asi
	tick

	priviliged
	-----------
        tstate
        tba
        pil
        cwp
        cansave
        canrestore
        otherwin
        cleanwin
        wstate
        pstate

	hyperpriviliged
	---------------
        hpstate

Issues: 1. tstate is not Xs ; some of the previously written fields are preserved; some not.
	   commented out

 **********************************************************************/

#define MY_PASS setx 0x82000, %r1, %r2; jmp %r2;nop
#define MY_FAIL setx 0x82020, %r1, %r2; jmp %r2;nop

#include "err_defines.h"

#define ASI_LSU_CTL_REG 0x45
#define ASI_SPARC_ERROR_EN_REG 0x4b
#define  L2_BANK_ADDR       0x40

#define  My_Power_On_Reset setx check,  %g2, %g1;\
                           jmpl    %g1, %g0; rd %ccr, %g6
 

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
!	wr  %g0, 0, %ccr
!	wr  %g0, 0, %asi
        wrpr    %g0, 0, %cwp

        rd %ccr, %i2

check_wmr:
        setx    0x9800000810, %i5, %i1
        ldx     [%i1], %i2
        setx    0xfffffffffffffffd, %i5, %o1 ! <1> = WMR
        or      %i2, %o1, %o2
        setx    0xffffffffffffffff, %i5, %o1
        cmp     %o2, %o1
        be      wmr
        nop

change_regs_values:
        setx red_data, %i5, %g7
       	ldx [%g7], %g1 !! set an integer register

        wr %g0, %g1, %ccr

gen_wrm_rst:
        nop !$EV  trig_pc_d(1, @VA(.RED_SEC0.gen_wrm_rst)) -> warmrst()
        nop
        nop

wmr_loop:
        add %g0, 1, %o1
        cmp %o1, 100
        ble wmr_loop
        nop

wmr:
        cmp %g6, 0xaa
        bne bad_end
        nop

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


