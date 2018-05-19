// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: icache_modes.s
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
	
#define H_HT0_Instruction_access_exception_0x08
#define My_HT0_Instruction_access_exception_0x08 mov 1, %o0; done;
#include "boot.s"

.text
.global main  
	
main:
cp0_ioaddr:
        !CP=0, IO addr
	setx ssi_cp0, %l1, %l0
        jmpl %l0, %o7
        nop

	cmp %g1, 0x3
        bne fail
        nop


cp1_ioaddr:
        !CP=1, IO addr
	setx ssi_cp1, %l1, %l0
        jmpl %l0, %o7
        nop

	cmp %g1, 0x6
        bne fail
        nop


cp0_memaddr:
        !CP=0, Mem addr
	setx mem_cp0, %l1, %l0
        jmpl %l0, %o7
        nop

	cmp %g1, 0x9
        bne fail
        nop


cp1_memaddr:
        !CP=1, Mem addr
	setx mem_cp1, %l1, %l0
        jmpl %l0, %o7
        nop

	cmp %g1, 0xc
        bne fail
        nop


	! set AM=1
        ta T_CHANGE_PRIV
        rdpr %pstate, %r1
        or %r1, 0x8, %r1
        wrpr %r1, 0x0, %pstate
        ta T_CHANGE_NONPRIV

cp0_am1_ioaddr:
        !CP=0, AM=1, IO addr, but will go to mem.
	setx ssi_cp0, %l1, %l0
        jmpl %l0, %o7
        nop

	cmp %g1, 0x9
        bne fail
        nop


cp1_am1_ioaddr:
        !CP=1, AM=1, IO addr, but will go to mem.
	setx ssi_cp1, %l1, %l0
        jmpl %l0, %o7
        nop

	cmp %g1, 0xc
        bne fail
        nop



cp0_am1_oor_ioaddr:
        !CP=0, AM=1, OOR, IO addr, but will go to mem.
	setx ssi_cp0, %l1, %l0
        mov  0x1, %l1
        sllx %l1, 48, %l1
        or   %l0, %l1, %l0
        jmpl %l0, %o7
        nop

	cmp %g1, 0x9
        bne fail
        nop


cp1_am1_oor_ioaddr:
        !CP=1, AM=1, OOR, IO addr, but will go to mem.
	setx ssi_cp1, %l1, %l0
        mov  0x1, %l1
        sllx %l1, 48, %l1
        or   %l0, %l1, %l0
        jmpl %l0, %o7
        nop

	cmp %g1, 0xc
        bne fail
        nop


cp0_am1_oor_memaddr:
        !CP=0, AM=1, OOR, mem addr
	setx mem_cp0, %l1, %l0
        mov  0x1, %l1
        sllx %l1, 48, %l1
        or   %l0, %l1, %l0
        jmpl %l0, %o7
        nop

	cmp %g1, 0x9
        bne fail
        nop


cp1_am1_oor_memaddr:
        !CP=1, AM=1, OOR, mem addr
	setx mem_cp1, %l1, %l0
        mov  0x1, %l1
        sllx %l1, 48, %l1
        or   %l0, %l1, %l0
        jmpl %l0, %o7
        nop

	cmp %g1, 0xc
        bne fail
        nop


	! set AM=0
        ta T_CHANGE_PRIV
        rdpr %pstate, %r1
        wrpr %r1, 0x8, %pstate
        ta T_CHANGE_NONPRIV

cp0_am0_oor_memaddr:
        !CP=0, OOR, mem addr
        mov  0, %o0
	setx mem_cp0, %l1, %l0
        mov  0x1, %l1
        sllx %l1, 48, %l1
        or   %l0, %l1, %l0
        jmpl %l0, %o7
        nop

	cmp %o0, 0x1
        bne fail
        nop


cp1_am0_oor_memaddr:
        !CP=1, OOR, mem addr
        mov 0, %o0
	setx mem_cp1, %l1, %l0
        mov  0x1, %l1
        sllx %l1, 48, %l1
        or   %l0, %l1, %l0
        jmpl %l0, %o7
        nop

	cmp %o0, 0x1
        bne fail
        nop

cp0_am0_oor_ioaddr:
        !CP=0, OOR, mem addr
	setx ssi_cp0, %l1, %l0
        mov  0x1, %l1
        sllx %l1, 48, %l1
        or   %l0, %l1, %l0
        jmpl %l0, %o7
        nop

	cmp %g1, 0x3
        bne fail
        nop


cp1_am0_oor_ioaddr:
        !CP=1, OOR, mem addr
	setx ssi_cp1, %l1, %l0
        mov  0x1, %l1
        sllx %l1, 48, %l1
        or   %l0, %l1, %l0
        jmpl %l0, %o7
        nop

	cmp %g1, 0x6
        bne fail
        nop



pass:
	ta		T_GOOD_TRAP

fail:
	ta		T_BAD_TRAP

SECTION .SSI_CP0_SEC TEXT_VA=0xfffffffff0002000
attr_text {
        Name = .SSI_CP0_SEC,
        VA=0xfffffffff0002000,
        RA=0xfff0002000,
        PA=0xfff0002000,
        part_0_i_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }
.text
.global ssi_cp0
ssi_cp0:
  add %g0, 0x1, %g1
ssi_cp0_begin_noic:
  add %g0, 0x2, %g1
  add %g0, 0x3, %g1
ssi_cp0_end_noic:
  retl
  nop

SECTION .SSI_CP1_SEC TEXT_VA=0xfffffffff0004000
attr_text {
        Name = .SSI_CP1_SEC,
        VA=0xfffffffff0004000,
        RA=0xfff0004000,
        PA=0xfff0004000,
        part_0_i_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }
.text
.global ssi_cp1
ssi_cp1:
    add %g0, 0x4, %g1
ssi_cp1_begin_noic:
    add %g0, 0x5, %g1
    add %g0, 0x6, %g1
ssi_cp1_end_noic:
    retl
    nop


SECTION .MEM_CP0_SEC TEXT_VA=0xf0002000
attr_text {
        Name = .MEM_CP0_SEC,
        VA=0xf0002000,
        RA=0xf0002000,
        PA=ra2pa(0xf0002000,0),
        part_0_i_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }
.text
.global mem_cp0
mem_cp0:
  add %g0, 0x7, %g1
mem_cp0_begin_noic:
  add %g0, 0x8, %g1
  add %g0, 0x9, %g1
mem_cp0_end_noic:
  retl
  nop

SECTION .MEM_CP1_SEC TEXT_VA=0xf0004000
attr_text {
        Name = .MEM_CP1_SEC,
        VA=0xf0004000,
        RA=0xf0004000,
        PA=ra2pa(0xf0004000,0),
        part_0_i_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }
.text
.global mem_cp1
mem_cp1:
    add %g0, 0xa, %g1
mem_cp1_begin_okic:
    add %g0, 0xb, %g1
    add %g0, 0xc, %g1
mem_cp1_end_okic:
    retl
    nop
