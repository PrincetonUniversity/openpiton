// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: xir_wr_regs2.s
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
 * name:        xir_wr_regs1.s
 * Date:        Nov, 2003
 *
 * Description:

     After POR, diag writes to the folloowing registers;
     causes XIR; rhen checks the value:

        priviliged
        -----------
	tpc
	tnpc	
	tt
	tl
	gl

        hyperpriviliged
        ---------------
        htstate

   Issue: Confusion about tpc, tnpc

 **********************************************************************/

#define MY_PASS setx 0x82000, %r1, %r2; jmp %r2;nop
#define MY_FAIL setx 0x82020, %r1, %r2; jmp %r2;nop

#include "err_defines.h"

#define ASI_LSU_CTL_REG 0x45
#define ASI_SPARC_ERROR_EN_REG 0x4b
#define  L2_BANK_ADDR       0x40

#define ASI_DMMU_VA_WATCHPOINT  0x58
#define ASI_DMMU_VA_WATCHPOINT_VA  0x38

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
	clr %g6

change_regs_values:
        setx red_data, %i5, %g7
       	ldx [%g7], %g1 !! set an integer register

	wrpr	0xff, %g0, %tt
        wrpr    0xff, %g0, %tl
        wrpr    0xff, %g0, %gl

        setx    0xffffffffffffffff, %i5, %i1
        wrhpr   %i1, %g0, %htstate

        setx    0xffffffffffffffff, %i5, %g1
        wr      %g1, %g0, %tick_cmpr

        setx    0xffffffffffffffff, %i5, %g1
        set     ASI_DMMU_VA_WATCHPOINT_VA, %g2
        stxa    %g1, [%g2]ASI_DMMU_VA_WATCHPOINT
        membar  0x40

set_xir:
        setx    0x9800000800, %i0, %i1  ! PA of INT_VEC_DIS
        setx    0x0000010003, %i0, %i2  ! type=reset traptype=POR

do_rst:        
	stx     %i2, [%i1]
rst_nxt:
	nop

xir_loop:
        add %g0, 1, %o1
        cmp %o1, 100
        ble xir_loop
        nop

        MY_FAIL
        nop


#define  My_External_Reset rdpr      %tpc, %g1; \
                           rdpr      %tnpc, %g2; \
			   setx    chk,  %o5, %o6; \
                           jmpl    %o6, %g0; nop


.global chk 
chk:
	nop

tpc_ch:
        setx    rst_nxt, %g5, %g3
        sub     %g1, %g3, %g4
        brnz    %g4, bad_end
        nop

tnpc_ch:
        add     %g3, 4, %g3
        sub     %g2, %g3, %g4
        brnz    %g4, bad_end
        nop

tt_ch:
        rdpr    %tt, %g1
        set     0x3, %g2
        sub     %g1, %g2, %g3
        brnz    %g3, bad_end
        nop

tl_ch:
        rdpr    %tl, %g1
        set     0x6, %g2
        sub     %g1, %g2, %g3
        brnz    %g3, bad_end
        nop

gl_ch:
        rdpr    %gl, %g1
        set     0x3, %g2
        sub     %g1, %g2, %g3
        brnz    %g3, bad_end
        nop

htstate_ch:
        rdhpr   %htstate, %l1
        setx    0x24, %g3, %g2          !HTSTATE.RED<5>=HPSTAE.RED=1, HTSTATE.RED<2>=HPSTATE.HPRIV=1
        sub     %l1, %g2, %g3
        brnz    %g3, bad_end
        nop

tick_cmpr_ch:
        rd      %tick_cmpr, %g2
        setx    0xffffffffffffffff, %i5, %g1
        or      %g1, %g2, %g3
        sub     %g3, %g1, %g4
        brnz    %g4, bad_end
        nop

va_watchpoint_ch:
        setx    0x0000fffffffffff8, %i5, %g1
        set     ASI_DMMU_VA_WATCHPOINT_VA, %g2
        ldxa    [%g2]ASI_DMMU_VA_WATCHPOINT, %g3
        sub     %g1, %g3, %g4
        brnz    %g4, bad_end
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


