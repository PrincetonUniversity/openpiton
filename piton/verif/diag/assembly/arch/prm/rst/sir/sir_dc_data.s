// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: sir_dc_data.s
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
 * Name:  	sir_dc_data.s
 * Date:	Nov, 2003
 *
 * Description:
        Checks ASI_DCACHE_DATA after reset
        Writes all ONES to the register
        after POR; causes SIR; then reads and checks
        the values. Should be all ONEs ; except the RSVD
        fields and also need to check Parity bit properly
 **********************************************************************/

#define MY_PASS setx 0x82000, %r1, %r2; jmp %r2;nop
#define MY_FAIL setx 0x82020, %r1, %r2; jmp %r2;nop

#include "err_defines.h"
#include "defines.h"

#define ASI_LSU_CTL_REG 0x45
#define ASI_SPARC_ERROR_EN_REG 0x4b
#define  L2_BANK_ADDR       0x40
#define SET_OFFSET 0x800


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

DC_direct:

  mov   0x10, %l1         ! VA for ASI 0x42
  ldxa  [%l1] 0x42, %l0
  or    %l0, 0x2, %l0
  stxa  %l0, [%l1] 0x42


tag_write:
        set    	0x1, %i1			! VALID=1 and Tag<28:1>=0xfff
        set     0x0, %g1
        stxa    %i1, [%g1]ASI_DCACHE_TAG

set_data:
       setx    0xffffffffffffffff, %i5, %i1
       set     0x0, %g1				! Address has <38:11>=Tag  28 bits =0
       stxa    %i1, [%g1]ASI_DCACHE_DATA

       add %g1, SET_OFFSET, %g1 !! switch way of cache
       stxa    %i1, [%g1]ASI_DCACHE_DATA

       add %g1, SET_OFFSET, %g1 !! switch way of cache
       stxa    %i1, [%g1]ASI_DCACHE_DATA

       add %g1, SET_OFFSET, %g1 !! switch way of cache
       stxa    %i1, [%g1]ASI_DCACHE_DATA

/*
tag_write2:
        set    	0x1fff, %i1                        ! VALID=1 and Tag<28:1>=0xfff
        set     0x0, %g1
        stxa    %i1, [%g1]ASI_DCACHE_TAG

set_data2:
       	setx    0xffffffffffffffff, %i5, %i1
       	set     0x00007c8, %g1                         ! Address has <38:11>=Tag = 28 bits =7ff
       	stxa    %i1, [%g1]ASI_DCACHE_DATA

       	add %g1, SET_OFFSET, %g1 !! switch way of cache
       	stxa    %i1, [%g1]ASI_DCACHE_DATA

       	add %g1, SET_OFFSET, %g1 !! switch way of cache
       	stxa    %i1, [%g1]ASI_DCACHE_DATA

       	add %g1, SET_OFFSET, %g1 !! switch way of cache
       	stxa    %i1, [%g1]ASI_DCACHE_DATA
	membar 	0x40
	
*/

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


#define  My_Software_Initiated_Reset setx    dc,  %o5, %o6; \
                           jmpl    %o6, %g0; nop


.global dc 
dc:
	nop

ch1:
	set	0x0, %g1
	setx	0xffffffffffffffff, %i5, %g3
	ldxa	[%g1]ASI_DCACHE_DATA, %g2
	sub	%g3, %g2, %g4
	brnz	%g4, bad_end
	nop

/*
ch2:
        set     0x0fff7c8, %g1				! <38:11> = tag_match = fff; <10:3>=7c8
        setx    0xffffffffffffffff, %i5, %g3
        ldxa    [%g1]ASI_DCACHE_DATA, %g2
        sub     %g3, %g2, %g4
        brnz    %g4, bad_end
        nop
*/



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


