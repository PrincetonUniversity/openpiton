// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: sir_wr_regs1.s
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
 * Name : 	sir_wr_regs1.s	
 * Date:  	Nov, 2003 
 *
 * Description:

     After POR, diag writes to the folloowing registers;
     causes SIR; rhen checks the value:

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

change_regs_values:
        setx red_data, %i5, %g7
       	ldx [%g7], %g1 !! set an integer register

        wrpr %g6, %g1, %tba
        wr %g0, %g1, %y
        wrpr %g0, %g0, %pil
        wrpr %g0, 0xff, %cwp

	!tt

        wr %g0, %g1, %ccr
        wr %g0, %g1, %asi
        wrpr %g0, %g1, %tick
        wrpr %g0, 0xff, %cansave
        wrpr %g0, 0xff, %canrestore
        wrpr %g0, 0xff, %otherwin
        wrpr %g0, 0xff, %cleanwin
        wrpr %g0, %g1, %wstate
        setx 0x2A00000AAA, %g6, %g5
        stx %g5, [%g7+8]
        wr      %g0, 0x4, %fprs       !  clear fprs as it causes x
        ldx [%g7+8], %fsr
        wr %g0, %g1, %fprs
        wrpr %g0, 0xde5, %pstate

        wrpr    %g0, %tick

        wr      %g0, 0x7, %fprs


	setx	0xffffffffffffffff, %i5, %i1
	wrhpr	%i1, %g0, %hpstate

set_sir:
        wrpr    0, %tl

        setx    0x9800000800, %i0, %i1  ! PA of INT_VEC_DIS
        setx    0x0000010004, %i0, %i2  ! type=reset traptype=SIR

        stx     %i2, [%i1]

sir_loop:
        add %g0, 1, %o1
        cmp %o1, 100
        ble sir_loop
        nop

        MY_FAIL
        nop


#define  My_Software_Initiated_Reset rd      %pc, %o1; \
                           rd      %pc, %o2; \
                           setx    rstv,  %o5, %o6; \
                           jmpl    %o6, %g0; nop


.global rstv 
rstv:
#ifdef FAST_BOOT
        setx    0x40080, %l5, %o3
#else
        setx    0xfffffffff0000080, %l5, %o3
#endif
        sub     %o1, %o3, %o4
        brnz    %o4, bad_end
        nop

        add     %o3, 4, %o3
        sub     %o2, %o3, %o4
        brnz    %o4, bad_end
        nop

hpstate_ch:
        rdhpr   %hpstate, %l1
        setx    0x24, %g3, %g2          !RED=<5>=1, HPRIV=<2>=1
        sub     %l1, %g2, %g3
        brnz    %g3, bad_end
        nop

fprs_ch:
        set     0x7, %l1
        rd      %fprs, %l2
        sub     %l2, %l1, %l3
        brnz    %l3, bad_end
        nop

tstate_ch:
        rdpr    %tstate, %l1
	setx	0x03aaaa010407, %l5, %l2
	sub     %l2, %l1, %o4
        brnz    %o4, bad_end
        nop

ccr_ch:
        rd %ccr, %i2
        cmp %i2, 0xaa
        bne bad_end
        nop

data_ch:
        set 	red_data, %g7
        ldx 	[%g7], %i0
        cmp 	%i0, %g1
        bne 	bad_end
        nop
tba_ch:
        srl 	%i0, 15, %i1
        rdpr 	%tba, %i2
        srl 	%i2, 15, %i2
        cmp 	%i1, %i2
        bne 	bad_end
        nop

y_ch:
        rd 	%y, %i2
      	set	0x5aaaaaaa, %g2 
        cmp 	%g2, %i2 					!cmp %i1, %i2
        bne 	bad_end					! bne %icc, bad_end !! yreg is only 32 bits
        nop

pil_ch:
        rdpr 	%pil, %i2
        cmp 	%i2, %g0
        bne 	bad_end
        nop

cwp_ch:
        rdpr 	%cwp, %i2
        cmp 	%i2, 0x7
        bne 	bad_end
        nop

asi_ch:
        rd 	%asi, %i2
        cmp 	%i2, 0xaa
        bne 	bad_end
        nop

cansave_ch:
        rdpr 	%cansave, %i2
        cmp 	%i2, 0x7  		! cmp %i2, 0x3
        bne 	bad_end
        nop
canrestore_ch:
        rdpr 	%canrestore, %i2
        cmp 	%i2, 0x7
        bne 	bad_end
        nop
otherwin_ch:
        rdpr 	%otherwin, %i2
        cmp 	%i2, 0x7
        bne 	bad_end
        nop

cleanwin_ch:
        rdpr 	%cleanwin, %i2
        cmp 	%i2, 0x7
        bne 	bad_end
        nop

wstate_ch:
        rdpr 	%wstate, %i2
        cmp 	%i2, 0x2A
        bne 	bad_end
        nop

pstate_ch:
        rdpr    %pstate, %g1
        setx    0x14, %g3, %g2          ! PRIV=<2>, PEF=<4>=1
        sub     %g1, %g2, %g3
        brnz    %g3, bad_end
        nop

tick_ch:
        rd      %tick, %g1
        setx    0x7fffffffffffffff, %i5, %g3   
        or      %g1, %g3, %g4
        setx    0xffffffffffffffff, %i5, %g5
        sub     %g5, %g4, %g6
        brz     %g6, bad_end
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


