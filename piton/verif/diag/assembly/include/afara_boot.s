// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: afara_boot.s
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

#include "constants.h"
#include "xlate.h"
		
#ifdef S2MEM_DEFINES
#include S2MEM_DEFINES
#else
#include "defines.h"
#endif
	
#ifdef S2MEM_MACROS
#include S2MEM_MACROS
#else
#include "macros.m4"
#include "macros.h"	/* macro from SUN legacy diags */
#endif	

.global Power_On_Reset

i_tsb_register_data immu_tsb_reg
d_tsb_register_data dmmu_tsb_reg
tsb_link_area	    LINK_AREA_BASE_ADDR

SECTION .RED_SEC           TEXT_VA=0xfffffffff0000000
#ifndef ALL_PAGE_CUSTOM_MAP
attr_text {
	Name=.RED_SEC,
	bypass
}
#endif
			
RESERVED_0: !Should not come here
        nop
        nop
        nop
        nop
	nop
        nop
        nop
        nop

Power_On_Reset:
#ifdef	My_Power_On_Reset
	My_Power_On_Reset
#else
        setx Redmode_Reset_Handler, %g1, %g2
        jmp %g2
	nop
!	wr  %g0, 0x1, %asr26
#endif

.align 32
	
Watchdog_Reset:
#ifdef	My_Watchdog_Reset
	My_Watchdog_Reset
#else
        setx Watchdog_Reset_Handler, %g1, %g2
        jmp %g2
        nop 
#endif
	

.align 32
	
External_Reset:
#ifdef	My_External_Reset
	My_External_Reset
#else
        setx External_Reset_Handler, %g1, %g2
        jmp %g2
        nop 
#endif

.align 32
	
Software_Initiated_Reset:
#ifdef	My_Software_Initiated_Reset
	My_Software_Initiated_Reset
#else
        setx Software_Reset_Handler, %g1, %g2
        jmp %g2
	nop
#endif

.align 32
	
RED_Mode_Other_Reset:
#ifdef	My_RED_Mode_Other_Reset
	My_RED_Mode_Other_Reset
#else
        nop 
	nop 
	nop
#endif


.align 0x800
	
Redmode_Reset_Handler:

#ifdef S2MEM_RED_RESET_HANDLER
#include S2MEM_RED_RESET_HANDLER
#else
#include "red_reset_handler.s"
#endif	

Watchdog_Reset_Handler:

#ifdef S2MEM_WATCHDOG_RESET_HANDLER
#include S2MEM_WATCHDOG_RESET_HANDLER
#else
#include "watchdog_reset_handler.s"
#endif	

External_Reset_Handler:

#ifdef S2MEM_EXTERNAL_RESET_HANDLER
#include S2MEM_EXTERNAL_RESET_HANDLER
#else
#include "external_reset_handler.s"
#endif	

Software_Reset_Handler:

#ifdef S2MEM_SOFTWARE_RESET_HANDLER
#include S2MEM_SOFTWARE_RESET_HANDLER
#else
#include "software_reset_handler.s"
#endif	

SECTION .PRIV_RESET     TEXT_VA=PRIV_RESET_ADDR
#ifndef ALL_PAGE_CUSTOM_MAP
attr_text {
	Name = .PRIV_RESET,
	PA=PRIV_RESET_ADDR_PA,
	Code,
	TTE_G=1, TTE_Context=0, TTE_V=1, TTE_Size=0, TTE_NFO=0,
	TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
	TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=1, TTE_W=0
	}
#endif
			
.global Priv_Reset_Handler
	
Priv_Reset_Handler:

#ifdef S2MEM_PRIV_RESET_HANDLER
#include S2MEM_PRIV_RESET_HANDLER
#else
#include "priv_reset_handler.s"
#endif	

SECTION .I_TSB         DATA_VA=I_TSB_BASE_ADDR
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
	Name = .I_TSB,
	PA=I_TSB_BASE_ADDR_PA,	
	Data,
	TTE_G=1, TTE_Context=0, TTE_V=1, TTE_Size=1, TTE_NFO=0,
	TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
	TTE_L=1, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=1, TTE_W=0
	}
#endif
	
#include "i_tsb.s"
		
SECTION .D_TSB        DATA_VA=D_TSB_BASE_ADDR
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
	Name = .D_TSB,
	PA=D_TSB_BASE_ADDR_PA,
	Data,
	TTE_G=1, TTE_Context=0, TTE_V=1, TTE_Size=1, TTE_NFO=0,
	TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
	TTE_L=1, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=1, TTE_W=0
	}
#endif
		
#include "d_tsb.s"
		
SECTION .TSB_LINK     DATA_VA=LINK_AREA_BASE_ADDR
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
	Name = .TSB_LINK,
	PA=LINK_AREA_BASE_ADDR_PA,
	Data,
	TTE_G=1, TTE_Context=0, TTE_V=1, TTE_Size=0, TTE_NFO=0,
	TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
	TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=1, TTE_W=0
	}
#endif
		
#include "tsb_link.s"
		
SECTION .TRAPS       TEXT_VA=TRAP_BASE_ADDR, DATA_VA=TRAP_DATA_ADDR
#ifndef ALL_PAGE_CUSTOM_MAP
attr_text {
	Name = .TRAPS,
	PA=TRAP_BASE_ADDR_PA,
	Code,
	TTE_G=1, TTE_Context=0, TTE_V=1, TTE_Size=0, TTE_NFO=0,
	TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
	TTE_L=1, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=1, TTE_W=0
	}
attr_data {
	Name = .TRAPS,
	PA=TRAP_DATA_ADDR_PA,
	Data,
	TTE_G=1, TTE_Context=0, TTE_V=1, TTE_Size=0, TTE_NFO=0,
	TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
	TTE_L=1, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=1, TTE_W=1
	}
#endif
			
#include "traps.s"

SECTION .KERNEL    TEXT_VA=KERNEL_BASE_TEXT_ADDR, DATA_VA=KERNEL_BASE_DATA_ADDR
#ifndef ALL_PAGE_CUSTOM_MAP
attr_text {
	Name = .KERNEL,
	PA=KERNEL_BASE_TEXT_ADDR_PA,
	Code,
	TTE_G=1, TTE_Context=0, TTE_V=1, TTE_Size=0, TTE_NFO=0,
	TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
	TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=1, TTE_W=1
	}
	
attr_data {
	Name = .KERNEL,
	PA=KERNEL_BASE_DATA_ADDR_PA,
	Data,
	TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
	TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
	TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=1, TTE_W=1
	}
#endif

.text

kernel:	
		
!Set_speculation_on:
	mov	0x7, %l2
	wrth_attr_p(%l2)

!	mov	0x8, %o0
!	mov	-10, %o1
!	ta	T_TRAP_EN_N_TIMES
	rdpr	%pstate, %l1
#ifdef SUN_USER_TEXT_START
	setx	user_text_start, %g1, %l2
#else
	setx	USER_START_LABEL, %g1, %l2
#endif

#ifndef USER_PAGE_CUSTOM_MAP
	mov	0x4, %l0
#else	
	mov	0, %l0
#endif
	jmp	%l2
	wrpr	%l1, %l0, %pstate
	nop

.data
shared_counter_0:	.byte	0x0
shared_counter_1:	.byte	0x0
shared_counter_2:	.byte	0x0
shared_counter_3:	.byte	0x0
shared_counter_4:	.byte	0x0
shared_counter_5:	.byte	0x0
shared_counter_6:	.byte	0x0
shared_counter_7:	.byte	0x0

	.word	0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
	.word	0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
	.word	0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
	.word	0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
	.word	0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
	.word	0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
	.word	0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
	.word	0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
	
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	
#ifndef USER_PAGE_CUSTOM_MAP
SECTION .MAIN     TEXT_VA= MAIN_BASE_TEXT_ADDR, DATA_VA=MAIN_BASE_DATA_ADDR

#ifndef ALL_PAGE_CUSTOM_MAP
changequote([, ])dnl
forloop([i], 0, M4_user_text_idx, [
attr_text {
	Name = .MAIN,
	VA= [0x]mpeval(MAIN_BASE_TEXT_ADDR + i * USER_PAGE_INCR, 16),
	PA= [0x]mpeval(MAIN_BASE_TEXT_ADDR_PA + i * USER_PAGE_INCR, 16),
	Code,
	TTE_G=1, TTE_Context=0, TTE_V=1, TTE_Size=0, TTE_NFO=0,
	TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
	TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
	}
])dnl	
forloop([i], 0, M4_user_data_idx, [
attr_data {
        Name = .MAIN,
        VA= [0x]mpeval(MAIN_BASE_DATA_ADDR + i * USER_PAGE_INCR, 16),
	PA= [0x]mpeval(MAIN_BASE_DATA_ADDR_PA + i * USER_PAGE_INCR, 16),
        Data,
        TTE_G=1, TTE_Context=[0x]eval(0x44 + i, 16), TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }
])dnl
changequote(`,')dnl'
#endif
#endif

