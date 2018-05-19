// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: wmr_no_wr_regs1.s
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
 * Name:	wmr_no_wr_regs1.s   
 * Date:  	Nov, 2003 
 *
 * Description:
 
   After POR causes an WMR_Reset; 
   after RED_Reset, the Trap_handler checks conntents of the registers.
   Registers which has X's after RED_Reset or had X's after POR and 
   not changed after XIR, are not read here.

   Registers checked:
	pc
	npc
	rstv
	pstate
	hpstate
	tt
	tl
	tl
	gl
	ver
	lsu_cntl_reg
	sparc_error_enable_reg
	L2_error_en_reg	
	fsr
	pic

   Issue:
 **********************************************************************/

#define MY_PASS setx 0x82000, %r1, %r2; jmp %r2;nop
#define MY_FAIL setx 0x82020, %r1, %r2; jmp %r2;nop

#include "err_defines.h"

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

        clr %g6

check_wmr:
        setx    0x9800000810, %i5, %i1
        ldx     [%i1], %i2
        setx    0xfffffffffffffffd, %i5, %o1 ! <1> = WMR
        or      %i2, %o1, %o2
        setx    0xffffffffffffffff, %i5, %o1
        cmp     %o2, %o1
        be      wmr
        nop

gen_wrm_rst:
        nop !$EV  trig_pc_d(1, @VA(.RED_SEC0.gen_wrm_rst)) -> warmrst()
        nop
        nop

wmr_loop:
        add %g0, 1, %o1
        cmp %o1, 100
        ble wmr_loop
        nop

        MY_FAIL
        nop

wmr:
        nop
        nop

pstate:
        rdpr    %pstate, %g1
        setx    0x14, %g3, %g2    	! PRIV=<2>, PEF=<4>=1
        sub     %g1, %g2, %g3
        brnz    %g3, bad_end
        nop

hpstate:
        rdhpr   %hpstate, %g1
        setx    0x24, %g3, %g2		!RED=<5>=1, HPRIV=<2>=1
        sub     %g1, %g2, %g3
        brnz    %g3, bad_end
        nop

tt:
        rdpr    %tt, %g1
        set     0x1, %g2		!RED_Reset
        sub     %g1, %g2, %g3
        brnz    %g3, bad_end
        nop

        !tl = Min (TL+1, MAXTL); MAXTL = 6
tl:
        rdpr    %tl, %g1
        set     0x6, %g2
        sub     %g1, %g2, %g3
        brnz    %g3, bad_end
        nop

        !gl = Min (GL+1, MAXGL) MAXGL = 3
gl:
        rdpr    %gl, %g1
        set     0x3, %g2
        sub     %g1, %g2, %g3
        brnz    %g3, bad_end
        nop

ver:
        rdhpr   %ver, %g1
        setx    0x003e002321030607, %g7, %g5
        sub     %g5, %g1, %g3
        brnz    %g3, bad_end
        nop

lsu_cntl_reg:
        ldxa    [%g0]ASI_LSU_CTL_REG, %g1
        sub     %g1, %g0, %g3
        brnz    %g3, bad_end
        nop

sparc_ee_reg:
        ldxa    [%g0]ASI_SPARC_ERROR_EN_REG, %g1
        sub     %g1, %g0, %g3
        brnz    %g3, bad_end
        nop

l2_ee_reg0_00:
        setx    L2EE_PA0, %l0, %g1
        ldx     [%g1], %g2
        sub     %g2, %g0, %g3
        brnz    %g3, bad_end
        nop
l2_ee_reg0_40:
        add     %g1, L2_BANK_ADDR, %g1
        ldx     [%g1], %g2
        sub     %g2, %g0, %g3
        brnz    %g3, bad_end
        nop
l2_ee_reg0_80:
        add     %g1, L2_BANK_ADDR, %g1
        ldx     [%g1], %g2
        sub     %g2, %g0, %g3
        brnz    %g3, bad_end
        nop
l2_ee_reg0_c0:
        add     %g1, L2_BANK_ADDR, %g1
        ldx     [%g1], %g2
        sub     %g2, %g0, %g3
        brnz    %g3, bad_end
        nop

l2_ee_reg1_00:
        setx    L2EE_PA1, %l0, %g1
        ldx     [%g1], %g2
        sub     %g2, %g0, %g3
        brnz    %g3, bad_end
        nop
l2_ee_reg1_40:
        add     %g1, L2_BANK_ADDR, %g1
        ldx     [%g1], %g2
        sub     %g2, %g0, %g3
        brnz    %g3, bad_end
        nop
l2_ee_reg1_80:
        add     %g1, L2_BANK_ADDR, %g1
        ldx     [%g1], %g2
        sub     %g2, %g0, %g3
        brnz    %g3, bad_end
        nop
l2_ee_reg1_c0:
        add     %g1, L2_BANK_ADDR, %g1
        ldx     [%g1], %g2
        sub     %g2, %g0, %g3
        brnz    %g3, bad_end
        nop

fsr:
        wr      %g0, 0x4, %fprs                 ! clear fprs as it causes x
        set     red_data, %g7
        stx     %fsr, [%g7]
        ldx     [%g7], %g1
        sub     %g1, %g0, %g4
        brnz    %g4, bad_end
        nop

pic:
        rd      %asr17, %i2
        cmp     %i2, %g0 
        bne     bad_end
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

#include "boot.s"

.text
.global main
main:
    MY_FAIL



