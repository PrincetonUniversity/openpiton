// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tlu_tba_test.s
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
!! Diag: tlu_tba_test.s
!! No. Threads: 1..4
!! Description: 
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

#define PCONTEXT	0x10
#define SCONTEXT	0x10

#define MAIN_PAGE_NUCLEUS_ALSO
#define MAIN_PAGE_HV_ALSO

#include "enable_traps.h"
#include "boot.s"

#define T0_HTRAP_BASE_VA	0x100000
#define T0_TRAP_BASE_VA		0x1100000
#define T0_TRAP_BASE_PA		0x1001100000

#define T1_HTRAP_BASE_VA	0x300000
#define T1_TRAP_BASE_VA		0x1300000
#define T1_TRAP_BASE_PA		0x1001300000

#define T2_HTRAP_BASE_VA	0x500000
#define T2_TRAP_BASE_VA		0x1500000
#define T2_TRAP_BASE_PA		0x1001500000

#define T3_HTRAP_BASE_VA	0x700000
#define T3_TRAP_BASE_VA		0x1700000
#define T3_TRAP_BASE_PA		0x1001700000

.text
.global main
main:
	ta	T_CHANGE_HPRIV
	rdhpr	%hpstate, %l0
	rdpr	%pstate, %l1
	rd		%asr26, %l3
	and		%l3, 0x300, %l3
	sllx	%l3, 13, %l3
	setx	T0_HTRAP_BASE_VA, %g1, %g2
	wrhpr	%g2, %l3, %htba
	setx	T0_TRAP_BASE_VA, %g1, %g2
	wrpr	%g2, %l3, %tba
	wrpr	%l1, 4, %pstate
	wrhpr	%l0, 4, %hpstate
T_trap_inst:
	ta	0x90
	ta	0x30
	ba	diag_pass
	nop
diag_pass:
	ta	T_GOOD_TRAP
	nop
diag_fail:
	ta	T_BAD_TRAP
	nop

.data
data_start:
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000
	.xword	0x0000000000000000

SECTION .HTRAPS_T0	TEXT_VA=T0_HTRAP_BASE_VA
attr_text {
	Name = .HTRAPS_T0,
	hypervisor,
	}

.text
My_T0_HTrap_0:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop

.align	8192
My_T0_HTrap_1:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop

.align	4096
My_T0_HTrap_2:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop

.align	512
My_T0_HTrap_Instruction_0x190:
	sethi	%hi(HV_TRAP_BASE_PA), %g1
	wrhpr	%g1, %htba
	done
	nop
	nop
	nop
	nop
	nop

My_T0_HTrap_Instruction_0x191:
	sethi	%hi(HV_TRAP_BASE_PA), %g1
	wrhpr	%g1, %htba
	done
	nop
	nop
	nop
	nop
	nop

My_T0_HTrap_Instruction_0x192:
	sethi	%hi(HV_TRAP_BASE_PA), %g1
	wrhpr	%g1, %htba
	done
	nop
	nop
	nop
	nop
	nop

My_T0_HTrap_Instruction_0x193:
	sethi	%hi(HV_TRAP_BASE_PA), %g1
	wrhpr	%g1, %htba
	done
	nop
	nop
	nop
	nop
	nop

SECTION .TRAPS_T0	TEXT_VA=T0_TRAP_BASE_VA
attr_text {
	Name = .TRAPS_T0,
	RA = T0_TRAP_BASE_VA,
	PA = T0_TRAP_BASE_PA,
	part_0_i_ctx_zero_ps0_tsb,
	TTE_G=1,       TTE_Context=0, TTE_V=1,    TTE_Size=PART0_I_Z_PS0_PAGE_SIZE, TTE_NFO=0, TTE_IE=0, 
	TTE_Soft2=0,   TTE_Diag=0,    TTE_Soft=0, TTE_L=0,    TTE_CP=1,  TTE_CV=0, 
	TTE_E=0,      TTE_P=1,        TTE_W=1
	}

.text
My_T0_Trap_0:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop

.align	8192
My_T0_Trap_1:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop

.align	1024
My_T0_Trap_2:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop

.align	512
My_T0_Trap_Instruction_0x130:
	sethi	%hi(TRAP_BASE_VA), %g1
	wrpr	%g1, %tba
	done
	nop
	nop
	nop
	nop
	nop

My_T0_Trap_Instruction_0x131:
	sethi	%hi(TRAP_BASE_VA), %g1
	wrpr	%g1, %tba
	done
	nop
	nop
	nop
	nop
	nop

My_T0_Trap_Instruction_0x132:
	sethi	%hi(TRAP_BASE_VA), %g1
	wrpr	%g1, %tba
	done
	nop
	nop
	nop
	nop
	nop

My_T0_Trap_Instruction_0x133:
	sethi	%hi(TRAP_BASE_VA), %g1
	wrpr	%g1, %tba
	done
	nop
	nop
	nop
	nop
	nop

SECTION .HTRAPS_T1	TEXT_VA=T1_HTRAP_BASE_VA
attr_text {
	Name = .HTRAPS_T1,
	hypervisor,
	}

.text
My_T1_HTrap_0:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop

.align	8192
My_T1_HTrap_1:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop

.align	4096
My_T1_HTrap_2:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop

.align	512
My_T1_HTrap_Instruction_0x190:
	sethi	%hi(HV_TRAP_BASE_PA), %g1
	wrhpr	%g1, %htba
	done
	nop
	nop
	nop
	nop
	nop

My_T1_HTrap_Instruction_0x191:
	sethi	%hi(HV_TRAP_BASE_PA), %g1
	wrhpr	%g1, %htba
	done
	nop
	nop
	nop
	nop
	nop

My_T1_HTrap_Instruction_0x192:
	sethi	%hi(HV_TRAP_BASE_PA), %g1
	wrhpr	%g1, %htba
	done
	nop
	nop
	nop
	nop
	nop

My_T1_HTrap_Instruction_0x193:
	sethi	%hi(HV_TRAP_BASE_PA), %g1
	wrhpr	%g1, %htba
	done
	nop
	nop
	nop
	nop
	nop

SECTION .TRAPS_T1	TEXT_VA=T1_TRAP_BASE_VA
attr_text {
	Name = .TRAPS_T1,
	RA = T1_TRAP_BASE_VA,
	PA = T1_TRAP_BASE_PA,
	part_0_i_ctx_zero_ps0_tsb,
	TTE_G=1,       TTE_Context=0, TTE_V=1,    TTE_Size=PART0_I_Z_PS0_PAGE_SIZE, TTE_NFO=0, TTE_IE=0, 
	TTE_Soft2=0,   TTE_Diag=0,    TTE_Soft=0, TTE_L=0,    TTE_CP=1,  TTE_CV=0, 
	TTE_E=0,      TTE_P=1,        TTE_W=1
	}

.text
My_T1_Trap_0:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop

.align	8192
My_T1_Trap_1:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop

.align	1024
My_T1_Trap_2:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop

.align	512
My_T1_Trap_Instruction_0x130:
	sethi	%hi(TRAP_BASE_VA), %g1
	wrpr	%g1, %tba
	done
	nop
	nop
	nop
	nop
	nop

My_T1_Trap_Instruction_0x131:
	sethi	%hi(TRAP_BASE_VA), %g1
	wrpr	%g1, %tba
	done
	nop
	nop
	nop
	nop
	nop

My_T1_Trap_Instruction_0x132:
	sethi	%hi(TRAP_BASE_VA), %g1
	wrpr	%g1, %tba
	done
	nop
	nop
	nop
	nop
	nop

My_T1_Trap_Instruction_0x133:
	sethi	%hi(TRAP_BASE_VA), %g1
	wrpr	%g1, %tba
	done
	nop
	nop
	nop
	nop
	nop

SECTION .HTRAPS_T2	TEXT_VA=T2_HTRAP_BASE_VA
attr_text {
	Name = .HTRAPS_T2,
	hypervisor,
	}

.text
My_T2_HTrap_0:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop

.align	8192
My_T2_HTrap_1:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop

.align	4096
My_T2_HTrap_2:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop

.align	512
My_T2_HTrap_Instruction_0x190:
	sethi	%hi(HV_TRAP_BASE_PA), %g1
	wrhpr	%g1, %htba
	done
	nop
	nop
	nop
	nop
	nop

My_T2_HTrap_Instruction_0x191:
	sethi	%hi(HV_TRAP_BASE_PA), %g1
	wrhpr	%g1, %htba
	done
	nop
	nop
	nop
	nop
	nop

My_T2_HTrap_Instruction_0x192:
	sethi	%hi(HV_TRAP_BASE_PA), %g1
	wrhpr	%g1, %htba
	done
	nop
	nop
	nop
	nop
	nop

My_T2_HTrap_Instruction_0x193:
	sethi	%hi(HV_TRAP_BASE_PA), %g1
	wrhpr	%g1, %htba
	done
	nop
	nop
	nop
	nop
	nop

SECTION .TRAPS_T2	TEXT_VA=T2_TRAP_BASE_VA
attr_text {
	Name = .TRAPS_T2,
	RA = T2_TRAP_BASE_VA,
	PA = T2_TRAP_BASE_PA,
	part_0_i_ctx_zero_ps0_tsb,
	TTE_G=1,       TTE_Context=0, TTE_V=1,    TTE_Size=PART0_I_Z_PS0_PAGE_SIZE, TTE_NFO=0, TTE_IE=0, 
	TTE_Soft2=0,   TTE_Diag=0,    TTE_Soft=0, TTE_L=0,    TTE_CP=1,  TTE_CV=0, 
	TTE_E=0,      TTE_P=1,        TTE_W=1
	}

.text
My_T2_Trap_0:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop

.align	8192
My_T2_Trap_1:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop

.align	1024
My_T2_Trap_2:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop

.align	512
My_T2_Trap_Instruction_0x130:
	sethi	%hi(TRAP_BASE_VA), %g1
	wrpr	%g1, %tba
	done
	nop
	nop
	nop
	nop
	nop

My_T2_Trap_Instruction_0x131:
	sethi	%hi(TRAP_BASE_VA), %g1
	wrpr	%g1, %tba
	done
	nop
	nop
	nop
	nop
	nop

My_T2_Trap_Instruction_0x132:
	sethi	%hi(TRAP_BASE_VA), %g1
	wrpr	%g1, %tba
	done
	nop
	nop
	nop
	nop
	nop

My_T2_Trap_Instruction_0x133:
	sethi	%hi(TRAP_BASE_VA), %g1
	wrpr	%g1, %tba
	done
	nop
	nop
	nop
	nop
	nop

SECTION .HTRAPS_T3	TEXT_VA=T3_HTRAP_BASE_VA
attr_text {
	Name = .HTRAPS_T3,
	hypervisor,
	}

.text
My_T3_HTrap_0:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop

.align	8192
My_T3_HTrap_1:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop

.align	4096
My_T3_HTrap_2:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop

.align	512
My_T3_HTrap_Instruction_0x190:
	sethi	%hi(HV_TRAP_BASE_PA), %g1
	wrhpr	%g1, %htba
	done
	nop
	nop
	nop
	nop
	nop

My_T3_HTrap_Instruction_0x191:
	sethi	%hi(HV_TRAP_BASE_PA), %g1
	wrhpr	%g1, %htba
	done
	nop
	nop
	nop
	nop
	nop

My_T3_HTrap_Instruction_0x192:
	sethi	%hi(HV_TRAP_BASE_PA), %g1
	wrhpr	%g1, %htba
	done
	nop
	nop
	nop
	nop
	nop

My_T3_HTrap_Instruction_0x193:
	sethi	%hi(HV_TRAP_BASE_PA), %g1
	wrhpr	%g1, %htba
	done
	nop
	nop
	nop
	nop
	nop


SECTION .TRAPS_T3	TEXT_VA=T3_TRAP_BASE_VA
attr_text {
	Name = .TRAPS_T3,
	RA = T3_TRAP_BASE_VA,
	PA = T3_TRAP_BASE_PA,
	part_0_i_ctx_zero_ps0_tsb,
	TTE_G=1,       TTE_Context=0, TTE_V=1,    TTE_Size=PART0_I_Z_PS0_PAGE_SIZE, TTE_NFO=0, TTE_IE=0, 
	TTE_Soft2=0,   TTE_Diag=0,    TTE_Soft=0, TTE_L=0,    TTE_CP=1,  TTE_CV=0, 
	TTE_E=0,      TTE_P=1,        TTE_W=1
	}

.text
My_T3_Trap_0:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop

.align	8192
My_T3_Trap_1:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop

.align	1024
My_T3_Trap_2:
	done
	nop
	nop
	nop
	nop
	nop
	nop
	nop

.align	512
My_T3_Trap_Instruction_0x130:
	sethi	%hi(TRAP_BASE_VA), %g1
	wrpr	%g1, %tba
	done
	nop
	nop
	nop
	nop
	nop

My_T3_Trap_Instruction_0x131:
	sethi	%hi(TRAP_BASE_VA), %g1
	wrpr	%g1, %tba
	done
	nop
	nop
	nop
	nop
	nop

My_T3_Trap_Instruction_0x132:
	sethi	%hi(TRAP_BASE_VA), %g1
	wrpr	%g1, %tba
	done
	nop
	nop
	nop
	nop
	nop

My_T3_Trap_Instruction_0x133:
	sethi	%hi(TRAP_BASE_VA), %g1
	wrpr	%g1, %tba
	done
	nop
	nop
	nop
	nop
	nop

