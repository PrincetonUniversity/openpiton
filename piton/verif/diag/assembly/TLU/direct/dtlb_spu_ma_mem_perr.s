// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: dtlb_spu_ma_mem_perr.s
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
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!! Diag: dtlb_spu_ma_mem_perr.s
!! Description: 
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

#define PCONTEXT	0x10
#define SCONTEXT	0x10

#define MAIN_PAGE_NUCLEUS_ALSO
#define MAIN_PAGE_HV_ALSO

#define H_HT0_Data_access_error_0x32
#define SUN_H_HT0_Data_access_error_0x32 \
	add	%l6, 1, %l6; \
	done; \
	nop; \
	nop; \
	nop; \
	nop; \
	nop; \
	nop

#define H_T0_Trap_Instruction_0
#define My_T0_Trap_Instruction_0	ta 0x90; done; nop; nop; nop; nop; nop; nop;
#define H_T0_Trap_Instruction_1
#define My_T0_Trap_Instruction_1	ta 0x91; done; nop; nop; nop; nop; nop; nop;
#define H_T0_Trap_Instruction_2
#define My_T0_Trap_Instruction_2	ta 0x92; done; nop; nop; nop; nop; nop; nop;
#define H_T0_Trap_Instruction_3
#define My_T0_Trap_Instruction_3	ta 0x93; done; nop; nop; nop; nop; nop; nop;

#define H_HT0_HTrap_Instruction_0	Init_SPU_MAMemory
#define H_HT0_HTrap_Instruction_1	Start_SPU_MAOperation
#define H_HT0_HTrap_Instruction_2	Check_SPU_MAOperation
#define H_HT0_HTrap_Instruction_3	Enable_DTLB_ERR_INJ

#include "spu_diag.h"
#define SPU_DATA_PA 0x60000000

#include "enable_traps.h"
#include "boot.s"

.text
.global main

main:
	mov	0, %l6
	mov	256, %l0
	setx	%hi(dtlb_err_data1), %g1, %l1
	mov	0x55, %l2
	mov	0xaa, %l3
	th_fork(main_th)
main_th_0:
	ta	0x33	!Enable SPARC (DTLB) Error Injection
	ldd		[%l1], %l2
	mov	0xf, %i0
	ta	0x30	!Initialize MA memory
	mov	30, %g1
spu_ma_err:
	mov	1, %i0
	mov	0x1f, %i1
	ta	0x31	!start a MA Operation
	ta	0x32	!Check a MA Operation
	brnz	%g1, spu_ma_err
	dec	%g1
	cmp	%l6, 32
	bne	%xcc, diag_fail
	nop
	ba	diag_pass
	nop
main_th_1:
main_th_2:
main_th_3:
	brnz	%l0, main_th_1
	dec		%l0
	!ta	0x33	!Enable SPARC (DTLB) Error Injection
	mov	255, %g1
ld_dtlb_err:
	ldd		[%l1], %l2
	brnz	%g1, ld_dtlb_err
	dec	%g1
	cmp	%l6, 256
	bne	%xcc, diag_fail
	nop
	ba	diag_pass
	nop
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
diag_pass:
	ta	T_GOOD_TRAP
	nop
diag_fail:
	ta	T_BAD_TRAP
	nop
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!! Custom handlers/APIs
.global Init_SPU_MAMemory
Init_SPU_MAMemory:
	set		REG_MA_ADDR_ADDR, %g1
	stxa	%g0, [%g0 + %g1] SPU_ASI
	setx	SPU_DATA_PA, %g1, %g2
	set		REG_MPA_ADDR, %g1
	stxa	%g2, [%g0 + %g1] SPU_ASI
	set		0x1f, %g2
	set		REG_MA_CTL_ADDR, %g1
	stxa	%g2, [%g0 + %g1] SPU_ASI
	set		MASync_ADDR, %g1
	ldxa	[%g0 + %g1] SPU_ASI, %g2

	set		REG_MA_ADDR_ADDR, %g1
	stxa	%i0, [%g0 + %g1] SPU_ASI
	setx	SPU_DATA_PA, %g1, %g2
	set		REG_MPA_ADDR, %g1
	stxa	%g2, [%g0 + %g1] SPU_ASI
	set		0x2001, %g2
	set		REG_MA_CTL_ADDR, %g1
	stxa	%g2, [%g0 + %g1] SPU_ASI
	set		MASync_ADDR, %g1
	ldxa	[%g0 + %g1] SPU_ASI, %g2
	done

.global Start_SPU_MAOperation
Start_SPU_MAOperation:
	set		REG_MA_ADDR_ADDR, %g1
	stxa	%g0, [%g0 + %g1] SPU_ASI
	setx	SPU_DATA_PA, %g1, %g2
	set		REG_MPA_ADDR, %g1
	stxa	%g2, [%g0 + %g1] SPU_ASI
	sllx	%i0, 6, %i0
	or		%i0, %i1, %i0
	set		REG_MA_CTL_ADDR, %g1
	stxa	%i0, [%g0 + %g1] SPU_ASI
	done

.global Check_SPU_MAOperation
Check_SPU_MAOperation:
	set		MASync_ADDR, %g1
	ldxa	[%g0 + %g1] SPU_ASI, %g2
	done

.global Enable_DTLB_ERR_INJ
Enable_DTLB_ERR_INJ:
	setx	0xc8000000, %g1, %g2
	stxa	%g2, [%g0] 0x43
	done

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!! DATA
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

#define DTLB_ERR_PAGE1_VA 0x60002000
#define DTLB_ERR_PAGE1_RA 0x170002000
SECTION .DTLB_ERR_PAGE1	DATA_VA = DTLB_ERR_PAGE1_VA
attr_data {
	Name = .DTLB_ERR_PAGE1,
	VA=DTLB_ERR_PAGE1_VA,
	RA=DTLB_ERR_PAGE1_RA,
	PA=ra2pa(DTLB_ERR_PAGE1_RA,0),
	part_0_d_ctx_nonzero_ps0_tsb,
	TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
	TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
	TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
}
.data
.global dtlb_err_data1
dtlb_err_data1:
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

#define DTLB_ERR_PAGE2_VA 0x60004000
#define DTLB_ERR_PAGE2_RA 0x170004000
SECTION .DTLB_ERR_PAGE2	DATA_VA = DTLB_ERR_PAGE2_VA
attr_data {
	Name = .DTLB_ERR_PAGE2,
	VA=DTLB_ERR_PAGE2_VA,
	RA=DTLB_ERR_PAGE2_RA,
	PA=ra2pa(DTLB_ERR_PAGE2_RA,0),
	part_0_d_ctx_nonzero_ps0_tsb,
	TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
	TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
	TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
}
.data
.global dtlb_err_data2
dtlb_err_data2:
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

#define DTLB_ERR_PAGE3_VA 0x60006000
#define DTLB_ERR_PAGE3_RA 0x170006000
SECTION .DTLB_ERR_PAGE3	DATA_VA = DTLB_ERR_PAGE3_VA
attr_data {
	Name = .DTLB_ERR_PAGE3,
	VA=DTLB_ERR_PAGE3_VA,
	RA=DTLB_ERR_PAGE3_RA,
	PA=ra2pa(DTLB_ERR_PAGE3_RA,0),
	part_0_d_ctx_nonzero_ps0_tsb,
	TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
	TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
	TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
}
.data
.global dtlb_err_data3
dtlb_err_data3:
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

