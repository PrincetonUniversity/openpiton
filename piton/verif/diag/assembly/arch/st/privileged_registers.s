// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: privileged_registers.s
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
 * Name:   
 * Date:   
 *
 *
 *  Description:
 *  	rdpr/wrpr -> traps
 *
 **********************************************************************/
#define H_HT0_Illegal_instruction_0x10 my_illegal_instruction
#define H_T0_Privileged_opcode_0x11 my_privileged_opcode
	
#include "boot.s"

.text
.global main  

	
main:
        mov %g0, %l0      ! counter
        mov %g0, %l1      ! counter2

	
	ta T_CHANGE_NONPRIV

rdpr_priv:		
	.word (0x81500000 + (0<<14))
	.word (0x81500000 + (1<<14))
	.word (0x81500000 + (2<<14))
	.word (0x81500000 + (3<<14))
	.word (0x81500000 + (4<<14))
	.word (0x81500000 + (5<<14))
	.word (0x81500000 + (6<<14))
	.word (0x81500000 + (7<<14))
	.word (0x81500000 + (8<<14))
	.word (0x81500000 + (9<<14))
	.word (0x81500000 + (10<<14))
	.word (0x81500000 + (11<<14))
	.word (0x81500000 + (12<<14))
	.word (0x81500000 + (13<<14))
	.word (0x81500000 + (14<<14))
	.word (0x81500000 + (15<<14))
	.word (0x81500000 + (16<<14))
	.word (0x81500000 + (17<<14))
	.word (0x81500000 + (18<<14))
	.word (0x81500000 + (19<<14))
	.word (0x81500000 + (20<<14))
	.word (0x81500000 + (21<<14))
	.word (0x81500000 + (22<<14))
	.word (0x81500000 + (23<<14))
	.word (0x81500000 + (24<<14))
	.word (0x81500000 + (25<<14))
	.word (0x81500000 + (26<<14))
	.word (0x81500000 + (27<<14))
	.word (0x81500000 + (28<<14))
	.word (0x81500000 + (29<<14))
	.word (0x81500000 + (30<<14))
	.word (0x81500000 + (31<<14))

wrpr_priv:	
	.word (0x81900000 + (0<<25))
	.word (0x81900000 + (1<<25))
	.word (0x81900000 + (2<<25))
	.word (0x81900000 + (3<<25))
	.word (0x81900000 + (4<<25))
	.word (0x81900000 + (5<<25))
	.word (0x81900000 + (6<<25))
	.word (0x81900000 + (7<<25))
	.word (0x81900000 + (8<<25))
	.word (0x81900000 + (9<<25))
	.word (0x81900000 + (10<<25))
	.word (0x81900000 + (11<<25))
	.word (0x81900000 + (12<<25))
	.word (0x81900000 + (13<<25))
	.word (0x81900000 + (14<<25))
	.word (0x81900000 + (15<<25))
	.word (0x81900000 + (16<<25))
	.word (0x81900000 + (17<<25))
	.word (0x81900000 + (18<<25))
	.word (0x81900000 + (19<<25))
	.word (0x81900000 + (20<<25))
	.word (0x81900000 + (21<<25))
	.word (0x81900000 + (22<<25))
	.word (0x81900000 + (23<<25))
	.word (0x81900000 + (24<<25))
	.word (0x81900000 + (25<<25))
	.word (0x81900000 + (26<<25))
	.word (0x81900000 + (27<<25))
	.word (0x81900000 + (28<<25))
	.word (0x81900000 + (29<<25))
	.word (0x81900000 + (30<<25))
	.word (0x81900000 + (31<<25))

	ta T_CHANGE_PRIV

rdpr_ill:		
	.word (0x81500000 + (0<<14))
	.word (0x81500000 + (1<<14))
	.word (0x81500000 + (2<<14))
	.word (0x81500000 + (3<<14))

	! .word (0x81500000 + (16<<14)) gl reg
	.word (0x81500000 + (17<<14)) 
	.word (0x81500000 + (18<<14))
	.word (0x81500000 + (19<<14))
	.word (0x81500000 + (20<<14))
	.word (0x81500000 + (21<<14))
	.word (0x81500000 + (22<<14))
	.word (0x81500000 + (23<<14))
	.word (0x81500000 + (24<<14))
	.word (0x81500000 + (25<<14))
	.word (0x81500000 + (26<<14))
	.word (0x81500000 + (27<<14))
	.word (0x81500000 + (28<<14))
	.word (0x81500000 + (29<<14))
	.word (0x81500000 + (30<<14))
	.word (0x81500000 + (31<<14))

wrpr_ill:	
	.word (0x81900000 + (0<<25))
	.word (0x81900000 + (1<<25))
	.word (0x81900000 + (2<<25))
	.word (0x81900000 + (3<<25))

	.word (0x81900000 + (15<<25))
	! .word (0x81900000 + (16<<25)) gl reg
	.word (0x81900000 + (17<<25))
	.word (0x81900000 + (18<<25))
	.word (0x81900000 + (19<<25))
	.word (0x81900000 + (20<<25))
	.word (0x81900000 + (21<<25))
	.word (0x81900000 + (22<<25))
	.word (0x81900000 + (23<<25))
	.word (0x81900000 + (24<<25))
	.word (0x81900000 + (25<<25))
	.word (0x81900000 + (26<<25))
	.word (0x81900000 + (27<<25))
	.word (0x81900000 + (28<<25))
	.word (0x81900000 + (29<<25))
	.word (0x81900000 + (30<<25))
	.word (0x81900000 + (31<<25))
	

		
checking:       
        cmp %l0, 39
        bne fail
        nop

        cmp %l1, 64
        bne fail
        nop

	
pass:
	ta		T_GOOD_TRAP

fail:
	ta		T_BAD_TRAP



SECTION .USER_TRAP_FOR_HYP TEXT_VA=0x13002000
attr_text {
        Name = .USER_TRAP_FOR_HYP,
        hypervisor
        }

.global my_illegal_instruction
my_illegal_instruction:
        inc %l0
        done
        nop


SECTION .USER_TRAP_FOR_SUP TEXT_VA=0x3006000
attr_text {
        Name = .USER_TRAP_FOR_SUP,
        RA=0x3006000,
        PA=ra2pa(0x3006000,0),
        part_0_i_ctx_zero_ps0_tsb,
        TTE_G=0, TTE_Context=0, TTE_V=1, TTE_Size=0x0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=1, TTE_W=0
        }

.global my_privileged_opcode
my_privileged_opcode:
        inc %l1
        done
        nop
