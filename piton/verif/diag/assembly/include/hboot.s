// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: hboot.s
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

#ifdef CONFIG_M4
#include S2MEM_DEFINES
#else
#include "config.m4"
#endif
	
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

SECTION .RED_SEC TEXT_VA = 0xfffffffff0000000, DATA_VA = 0xfffffffff0010000

#ifndef ALL_PAGE_CUSTOM_MAP
attr_text {
	Name=.RED_SEC,
	hypervisor
}
#endif

#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
	Name=.RED_SEC,
	hypervisor
}
#endif

.text

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
#if defined(ENABLE_WARM_RESET)
	setx hboot_clock_init, %g1, %g2
	jmp %g2
	nop
#else
#if defined(ENABLE_BISI) && !defined(ENABLE_WARM_RESET)
	setx hboot_bisi, %g1, %g2
	jmp %g2
	nop
#else
#if defined(NO_SLAM_INIT_DRAMCTL) && !defined(ENABLE_BISI) && !defined(ENABLE_WARM_RESET)
	setx dramctl_init, %g1, %g2
	jmp %g2
	nop
#else
	setx hboot_pton_init, %g1, %g2
	jmp %g2
	nop
#endif
#endif
#endif
#endif
!#ifdef NO_SLAM_INIT_DRAMCTL
!! Note: dramctl_init initializes the dram controller
!!	if it is POR or if self-refresh
!!	is disabled during warm reset.
!        setx dramctl_init, %g1, %g2
!        jmp %g2
!        nop
!#else
!        setx HRedmode_Reset_Handler, %g1, %g2
!        jmp %g2
!        nop
!#endif
!#endif

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

.align 32
#include "hboot_clock_init.s"
#include "hboot_bisi.s"
#include "hboot_dramctl_init.s"
#include "hboot_pton_init.s"

.data
.global check_bisi_flag
check_bisi_flag:
	.xword	0x1111111111111111
.global done_bisi_flag
done_bisi_flag:
	.xword	0x0000000000000000

SECTION .RED_EXT_SEC TEXT_VA = HV_RED_TEXT_PA, DATA_VA = HV_RED_DATA_PA

#ifndef ALL_PAGE_CUSTOM_MAP
attr_text {
	Name=.RED_EXT_SEC,
	hypervisor
}
#endif

#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
	Name=.RED_EXT_SEC,
	hypervisor
}
#endif

.text

! align Power_On_Reset to 0x40020 so that
! we can have an option to boot straight from DRAM
! instead of 0xfff0000020
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
#if defined(ENABLE_WARM_RESET)
	setx hboot_clock_init, %g1, %g2
	jmp %g2
	nop
#else
	setx hboot_pton_init, %g1, %g2
	jmp %g2
	nop
#endif
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

.align 32

.global HRedmode_Reset_Handler
HRedmode_Reset_Handler:
#ifdef SPEC_LD_OFF
	wrth_attr_p(0x1)	! set Active bit
#else
	wrth_attr_p(0x5)	! set SPEC_EN, Active bit
#endif
#ifdef S2MEM_RED_RESET_HANDLER
#include S2MEM_RED_RESET_HANDLER
#else
#include "hred_reset_handler.s"
#endif	

.global Watchdog_Reset_Handler
Watchdog_Reset_Handler:

#ifdef S2MEM_WATCHDOG_RESET_HANDLER
#include S2MEM_WATCHDOG_RESET_HANDLER
#else
#include "watchdog_reset_handler.s"
#endif	

.global External_Reset_Handler
External_Reset_Handler:

#ifdef S2MEM_EXTERNAL_RESET_HANDLER
#include S2MEM_EXTERNAL_RESET_HANDLER
#else
#include "external_reset_handler.s"
#endif	

.global Software_Reset_Handler
Software_Reset_Handler:

#ifdef S2MEM_SOFTWARE_RESET_HANDLER
#include S2MEM_SOFTWARE_RESET_HANDLER
#else
#include "software_reset_handler.s"
#endif	
#define RED_EXT_SEC_INC
#include "hboot_clock_init.s"
#undef RED_EXT_SEC_INC
#include "hboot_pton_init.s"

.data
part_id_list:
	.xword  THR_0_PARTID, THR_1_PARTID, THR_2_PARTID, THR_3_PARTID
	.xword  THR_4_PARTID, THR_5_PARTID, THR_6_PARTID, THR_7_PARTID
	.xword  THR_8_PARTID, THR_9_PARTID, THR_10_PARTID, THR_11_PARTID
	.xword  THR_12_PARTID, THR_13_PARTID, THR_14_PARTID, THR_15_PARTID
	.xword  THR_16_PARTID, THR_17_PARTID, THR_18_PARTID, THR_19_PARTID
	.xword  THR_20_PARTID, THR_21_PARTID, THR_22_PARTID, THR_23_PARTID
	.xword  THR_24_PARTID, THR_25_PARTID, THR_26_PARTID, THR_27_PARTID
	.xword  THR_28_PARTID, THR_29_PARTID, THR_30_PARTID, THR_31_PARTID
	.xword  THR_32_PARTID, THR_33_PARTID, THR_34_PARTID, THR_35_PARTID
	.xword  THR_36_PARTID, THR_37_PARTID, THR_38_PARTID, THR_39_PARTID
	.xword  THR_40_PARTID, THR_41_PARTID, THR_42_PARTID, THR_43_PARTID
	.xword  THR_44_PARTID, THR_45_PARTID, THR_46_PARTID, THR_47_PARTID
	.xword  THR_48_PARTID, THR_49_PARTID, THR_50_PARTID, THR_51_PARTID
	.xword  THR_52_PARTID, THR_53_PARTID, THR_54_PARTID, THR_55_PARTID
	.xword  THR_56_PARTID, THR_57_PARTID, THR_58_PARTID, THR_59_PARTID
	.xword  THR_60_PARTID, THR_61_PARTID, THR_62_PARTID, THR_63_PARTID
	.xword  THR_64_PARTID, THR_65_PARTID, THR_66_PARTID, THR_67_PARTID
	.xword  THR_68_PARTID, THR_69_PARTID, THR_70_PARTID, THR_71_PARTID
	.xword  THR_72_PARTID, THR_73_PARTID, THR_74_PARTID, THR_75_PARTID
	.xword  THR_76_PARTID, THR_77_PARTID, THR_78_PARTID, THR_79_PARTID
	.xword  THR_80_PARTID, THR_81_PARTID, THR_82_PARTID, THR_83_PARTID
	.xword  THR_84_PARTID, THR_85_PARTID, THR_86_PARTID, THR_87_PARTID
	.xword  THR_88_PARTID, THR_89_PARTID, THR_90_PARTID, THR_91_PARTID
	.xword  THR_92_PARTID, THR_93_PARTID, THR_94_PARTID, THR_95_PARTID
	.xword  THR_96_PARTID, THR_97_PARTID, THR_98_PARTID, THR_99_PARTID
	.xword  THR_100_PARTID, THR_101_PARTID, THR_102_PARTID, THR_103_PARTID
	.xword  THR_104_PARTID, THR_105_PARTID, THR_106_PARTID, THR_107_PARTID
	.xword  THR_108_PARTID, THR_109_PARTID, THR_110_PARTID, THR_111_PARTID
	.xword  THR_112_PARTID, THR_113_PARTID, THR_114_PARTID, THR_115_PARTID
	.xword  THR_116_PARTID, THR_117_PARTID, THR_118_PARTID, THR_119_PARTID
	.xword  THR_120_PARTID, THR_121_PARTID, THR_122_PARTID, THR_123_PARTID
	.xword  THR_124_PARTID, THR_125_PARTID, THR_126_PARTID, THR_127_PARTID

.global partition_base_list
partition_base_list:
	.xword	PART_0_BASE, PART_1_BASE, PART_2_BASE, PART_3_BASE
	.xword	PART_4_BASE, PART_5_BASE, PART_6_BASE, PART_7_BASE

tsb_config_base_list:
	.xword	part_0_i_z_tsb_config, part_0_i_nz_tsb_config
	.xword	part_0_i_z_ps0_tsb, part_0_i_nz_ps0_tsb
	.xword	part_0_i_z_ps1_tsb, part_0_i_nz_ps1_tsb
	.xword	0x0, 0x0
	.xword	part_0_d_z_tsb_config, part_0_d_nz_tsb_config
	.xword	part_0_d_z_ps0_tsb, part_0_d_nz_ps0_tsb
	.xword	part_0_d_z_ps1_tsb, part_0_d_nz_ps1_tsb
	.xword	0x0, 0x0
	.xword	part_1_i_z_tsb_config, part_1_i_nz_tsb_config
	.xword	part_1_i_z_ps0_tsb, part_1_i_nz_ps0_tsb
	.xword	part_1_i_z_ps1_tsb, part_1_i_nz_ps1_tsb
	.xword	0x0, 0x0
	.xword	part_1_d_z_tsb_config, part_1_d_nz_tsb_config
	.xword	part_1_d_z_ps0_tsb, part_1_d_nz_ps0_tsb
	.xword	part_1_d_z_ps1_tsb, part_1_d_nz_ps1_tsb
	.xword	0x0, 0x0
	.xword	part_2_i_z_tsb_config, part_2_i_nz_tsb_config
	.xword	part_2_i_z_ps0_tsb, part_2_i_nz_ps0_tsb
	.xword	part_2_i_z_ps1_tsb, part_2_i_nz_ps1_tsb
	.xword	0x0, 0x0
	.xword	part_2_d_z_tsb_config, part_2_d_nz_tsb_config
	.xword	part_2_d_z_ps0_tsb, part_2_d_nz_ps0_tsb
	.xword	part_2_d_z_ps1_tsb, part_2_d_nz_ps1_tsb
	.xword	0x0, 0x0
	.xword	part_3_i_z_tsb_config, part_3_i_nz_tsb_config
	.xword	part_3_i_z_ps0_tsb, part_3_i_nz_ps0_tsb
	.xword	part_3_i_z_ps1_tsb, part_3_i_nz_ps1_tsb
	.xword	0x0, 0x0
	.xword	part_3_d_z_tsb_config, part_3_d_nz_tsb_config
	.xword	part_3_d_z_ps0_tsb, part_3_d_nz_ps0_tsb
	.xword	part_3_d_z_ps1_tsb, part_3_d_nz_ps1_tsb
	.xword	0x0, 0x0
	.xword	part_4_i_z_tsb_config, part_4_i_nz_tsb_config
	.xword	part_4_i_z_ps0_tsb, part_4_i_nz_ps0_tsb
	.xword	part_4_i_z_ps1_tsb, part_4_i_nz_ps1_tsb
	.xword	0x0, 0x0
	.xword	part_4_d_z_tsb_config, part_4_d_nz_tsb_config
	.xword	part_4_d_z_ps0_tsb, part_4_d_nz_ps0_tsb
	.xword	part_4_d_z_ps1_tsb, part_4_d_nz_ps1_tsb
	.xword	0x0, 0x0
	.xword	part_5_i_z_tsb_config, part_5_i_nz_tsb_config
	.xword	part_5_i_z_ps0_tsb, part_5_i_nz_ps0_tsb
	.xword	part_5_i_z_ps1_tsb, part_5_i_nz_ps1_tsb
	.xword	0x0, 0x0
	.xword	part_5_d_z_tsb_config, part_5_d_nz_tsb_config
	.xword	part_5_d_z_ps0_tsb, part_5_d_nz_ps0_tsb
	.xword	part_5_d_z_ps1_tsb, part_5_d_nz_ps1_tsb
	.xword	0x0, 0x0
	.xword	part_6_i_z_tsb_config, part_6_i_nz_tsb_config
	.xword	part_6_i_z_ps0_tsb, part_6_i_nz_ps0_tsb
	.xword	part_6_i_z_ps1_tsb, part_6_i_nz_ps1_tsb
	.xword	0x0, 0x0
	.xword	part_6_d_z_tsb_config, part_6_d_nz_tsb_config
	.xword	part_6_d_z_ps0_tsb, part_6_d_nz_ps0_tsb
	.xword	part_6_d_z_ps1_tsb, part_6_d_nz_ps1_tsb
	.xword	0x0, 0x0
	.xword	part_7_i_z_tsb_config, part_7_i_nz_tsb_config
	.xword	part_7_i_z_ps0_tsb, part_7_i_nz_ps0_tsb
	.xword	part_7_i_z_ps1_tsb, part_7_i_nz_ps1_tsb
	.xword	0x0, 0x0
	.xword	part_7_d_z_tsb_config, part_7_d_nz_tsb_config
	.xword	part_7_d_z_ps0_tsb, part_7_d_nz_ps0_tsb
	.xword	part_7_d_z_ps1_tsb, part_7_d_nz_ps1_tsb
	.xword	0x0, 0x0
.global sync_thr_counter
sync_thr_counter:
	.xword	0x0
.align 8
sync_thr_counter_2:
	.xword	0x0
.global fpu_init_data
fpu_init_data:
        .xword  0x0,0x0,0x0,0x0


#ifdef CSM_ENABLE
.global mmu_spinlock_addr
mmu_spinlock_addr:
        .xword  0x0,0x0,0x0,0x0
.align 64
.global mmu_barrierlock_addr  
mmu_barrierlock_addr:    
        .xword  0x0,0x0,0x0,0x0
.align 64
.global mmu_barrier_addr  
mmu_barrier_addr:    
        .xword  0x0,0x0,0x0,0x0
.align 64
#endif

SECTION .HPRIV_RESET        TEXT_VA=PRIV_RESET_VA
#ifndef ALL_PAGE_CUSTOM_MAP
changequote([, ])dnl
forloop([i], 0, 7, [
ifdef([part_]i[_used],[
attr_text {
	Name = .HPRIV_RESET,
	RA = PRIV_RESET_RA,
	PA = ra2pa2(PRIV_RESET_RA,i),
	[part_]i[_i_ctx_nonzero_ps0_tsb],
	[part_]i[_i_ctx_zero_ps0_tsb],
#ifdef CSM_ENABLE
	[part_]i[_i_ctx_nonzero_ps0_tsb_csm],
	[part_]i[_i_ctx_zero_ps0_tsb_csm],
    TTE_HDID=0, TTE_HD_SIZE=mpeval(PTON_NUM_TILES%64), TTE_SDID=0, TTE_LSID=0,
#endif
	TTE_G=1,       TTE_Context=0, TTE_V=1,    TTE_Size=PART0_I_Z_PS0_PAGE_SIZE, TTE_NFO=0, TTE_IE=0, 
	TTE_Soft2=0,   TTE_Diag=0,    TTE_Soft=0, TTE_L=0,    TTE_CP=1,  TTE_CV=0, 
	TTE_E=0,      TTE_P=1,        TTE_W=1
	}
])dnl
])dnl
changequote(`,')dnl'
#endif

.global HPriv_Reset_Handler
	
HPriv_Reset_Handler:

#ifdef S2MEM_PRIV_RESET_HANDLER
#include S2MEM_PRIV_RESET_HANDLER
#else
#include "hpriv_reset_handler.s"
#endif	

SECTION .HTRAPS            TEXT_VA=HV_TRAP_BASE_PA, DATA_VA=HV_TRAP_DATA_PA
#ifndef ALL_PAGE_CUSTOM_MAP
attr_text {
	Name = .HTRAPS,
	hypervisor,
	}
attr_data {
	Name = .HTRAPS,
	hypervisor,
	}
#endif

#ifndef HPV_NONSPLIT_MODE
#include "htraps.s"
#endif

#ifndef NO_DECLARE_TSB	
#ifndef GOLDFINGER





#ifdef PART_0_USED
SECTION .PART_0_I_CTX_ZERO_PS0_TSB   DATA_VA=PART0_I_Z_PS0_ADDR
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
	Name = .PART_0_I_CTX_ZERO_PS0_TSB,
	hypervisor
	}
#endif
SECTION .PART_0_I_CTX_NONZERO_PS0_TSB    DATA_VA=PART0_I_NZ_PS0_ADDR
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
	Name = .PART_0_I_CTX_NONZERO_PS0_TSB,
	hypervisor
	}
#endif
SECTION .PART_0_D_CTX_ZERO_PS0_TSB    DATA_VA=PART0_D_Z_PS0_ADDR
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
	Name = .PART_0_D_CTX_ZERO_PS0_TSB,
	hypervisor
	}
#endif
SECTION .PART_0_D_CTX_NONZERO_PS0_TSB   DATA_VA=PART0_D_NZ_PS0_ADDR
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
	Name = .PART_0_D_CTX_NONZERO_PS0_TSB,	
	hypervisor
	}
#endif

SECTION .PART_0_I_CTX_ZERO_PS1_TSB   DATA_VA=PART0_I_Z_PS1_ADDR
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
	Name = .PART_0_I_CTX_ZERO_PS1_TSB,
	hypervisor
	}
#endif
SECTION .PART_0_I_CTX_NONZERO_PS1_TSB    DATA_VA=PART0_I_NZ_PS1_ADDR
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
	Name = .PART_0_I_CTX_NONZERO_PS1_TSB,
	hypervisor
	}
#endif
SECTION .PART_0_D_CTX_ZERO_PS1_TSB    DATA_VA=PART0_D_Z_PS1_ADDR
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
	Name = .PART_0_D_CTX_ZERO_PS1_TSB,
	hypervisor
	}
#endif
SECTION .PART_0_D_CTX_NONZERO_PS1_TSB   DATA_VA=PART0_D_NZ_PS1_ADDR
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
	Name = .PART_0_D_CTX_NONZERO_PS1_TSB,	
	hypervisor
	}
#endif
SECTION .PART_0_TSB_LINK   DATA_VA=PART_0_LINK_AREA_BASE_ADDR
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
	Name = .PART_0_TSB_LINK,	
	hypervisor
	}
#endif
#endif

#ifdef PART_1_USED
SECTION .PART_1_I_CTX_ZERO_PS0_TSB   DATA_VA=PART1_I_Z_PS0_ADDR
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
	Name = .PART_1_I_CTX_ZERO_PS0_TSB,
	hypervisor
	}
#endif
SECTION .PART_1_I_CTX_NONZERO_PS0_TSB    DATA_VA=PART1_I_NZ_PS0_ADDR
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
	Name = .PART_1_I_CTX_NONZERO_PS0_TSB,
	hypervisor
	}
#endif
SECTION .PART_1_D_CTX_ZERO_PS0_TSB    DATA_VA=PART1_D_Z_PS0_ADDR
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
	Name = .PART_1_D_CTX_ZERO_PS0_TSB,
	hypervisor
	}
#endif
SECTION .PART_1_D_CTX_NONZERO_PS0_TSB   DATA_VA=PART1_D_NZ_PS0_ADDR
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
	Name = .PART_1_D_CTX_NONZERO_PS0_TSB,	
	hypervisor
	}
#endif
SECTION .PART_1_TSB_LINK   DATA_VA=PART_1_LINK_AREA_BASE_ADDR
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
	Name = .PART_1_TSB_LINK,	
	hypervisor
	}
#endif
#endif

#ifdef PART_2_USED
SECTION .PART_2_I_CTX_ZERO_PS0_TSB   DATA_VA=PART2_I_Z_PS0_ADDR
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
	Name = .PART_2_I_CTX_ZERO_PS0_TSB,
	hypervisor
	}
#endif
SECTION .PART_2_I_CTX_NONZERO_PS0_TSB    DATA_VA=PART2_I_NZ_PS0_ADDR
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
	Name = .PART_2_I_CTX_NONZERO_PS0_TSB,
	hypervisor
	}
#endif
SECTION .PART_2_D_CTX_ZERO_PS0_TSB    DATA_VA=PART2_D_Z_PS0_ADDR
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
	Name = .PART_2_D_CTX_ZERO_PS0_TSB,
	hypervisor
	}
#endif
SECTION .PART_2_D_CTX_NONZERO_PS0_TSB   DATA_VA=PART2_D_NZ_PS0_ADDR
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
	Name = .PART_2_D_CTX_NONZERO_PS0_TSB,	
	hypervisor
	}
#endif
SECTION .PART_2_TSB_LINK   DATA_VA=PART_2_LINK_AREA_BASE_ADDR
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
	Name = .PART_2_TSB_LINK,	
	hypervisor
	}
#endif
#endif

#ifdef PART_3_USED
SECTION .PART_3_I_CTX_ZERO_PS0_TSB   DATA_VA=PART3_I_Z_PS0_ADDR
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
	Name = .PART_3_I_CTX_ZERO_PS0_TSB,
	hypervisor
	}
#endif
SECTION .PART_3_I_CTX_NONZERO_PS0_TSB    DATA_VA=PART3_I_NZ_PS0_ADDR
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
	Name = .PART_3_I_CTX_NONZERO_PS0_TSB,
	hypervisor
	}
#endif
SECTION .PART_3_D_CTX_ZERO_PS0_TSB    DATA_VA=PART3_D_Z_PS0_ADDR
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
	Name = .PART_3_D_CTX_ZERO_PS0_TSB,
	hypervisor
	}
#endif
SECTION .PART_3_D_CTX_NONZERO_PS0_TSB   DATA_VA=PART3_D_NZ_PS0_ADDR
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
	Name = .PART_3_D_CTX_NONZERO_PS0_TSB,	
	hypervisor
	}
#endif
SECTION .PART_3_TSB_LINK   DATA_VA=PART_3_LINK_AREA_BASE_ADDR
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
	Name = .PART_3_TSB_LINK,	
	hypervisor
	}
#endif
#endif

#ifdef PART_4_USED
SECTION .PART_4_I_CTX_ZERO_PS0_TSB   DATA_VA=PART4_I_Z_PS0_ADDR
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
	Name = .PART_4_I_CTX_ZERO_PS0_TSB,
	hypervisor
	}
#endif
SECTION .PART_4_I_CTX_NONZERO_PS0_TSB    DATA_VA=PART4_I_NZ_PS0_ADDR
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
	Name = .PART_4_I_CTX_NONZERO_PS0_TSB,
	hypervisor
	}
#endif
SECTION .PART_4_D_CTX_ZERO_PS0_TSB    DATA_VA=PART4_D_Z_PS0_ADDR
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
	Name = .PART_4_D_CTX_ZERO_PS0_TSB,
	hypervisor
	}
#endif
SECTION .PART_4_D_CTX_NONZERO_PS0_TSB   DATA_VA=PART4_D_NZ_PS0_ADDR
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
	Name = .PART_4_D_CTX_NONZERO_PS0_TSB,	
	hypervisor
	}
#endif
SECTION .PART_4_TSB_LINK   DATA_VA=PART_4_LINK_AREA_BASE_ADDR
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
	Name = .PART_4_TSB_LINK,	
	hypervisor
	}
#endif
#endif

#ifdef PART_5_USED
SECTION .PART_5_I_CTX_ZERO_PS0_TSB   DATA_VA=PART5_I_Z_PS0_ADDR
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
	Name = .PART_5_I_CTX_ZERO_PS0_TSB,
	hypervisor
	}
#endif
SECTION .PART_5_I_CTX_NONZERO_PS0_TSB    DATA_VA=PART5_I_NZ_PS0_ADDR
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
	Name = .PART_5_I_CTX_NONZERO_PS0_TSB,
	hypervisor
	}
#endif
SECTION .PART_5_D_CTX_ZERO_PS0_TSB    DATA_VA=PART5_D_Z_PS0_ADDR
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
	Name = .PART_5_D_CTX_ZERO_PS0_TSB,
	hypervisor
	}
#endif
SECTION .PART_5_D_CTX_NONZERO_PS0_TSB   DATA_VA=PART5_D_NZ_PS0_ADDR
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
	Name = .PART_5_D_CTX_NONZERO_PS0_TSB,	
	hypervisor
	}
#endif
SECTION .PART_5_TSB_LINK   DATA_VA=PART_5_LINK_AREA_BASE_ADDR
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
	Name = .PART_5_TSB_LINK,	
	hypervisor
	}
#endif
#endif

#ifdef PART_6_USED
SECTION .PART_6_I_CTX_ZERO_PS0_TSB   DATA_VA=PART6_I_Z_PS0_ADDR
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
	Name = .PART_6_I_CTX_ZERO_PS0_TSB,
	hypervisor
	}
#endif
SECTION .PART_6_I_CTX_NONZERO_PS0_TSB    DATA_VA=PART6_I_NZ_PS0_ADDR
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
	Name = .PART_6_I_CTX_NONZERO_PS0_TSB,
	hypervisor
	}
#endif
SECTION .PART_6_D_CTX_ZERO_PS0_TSB    DATA_VA=PART6_D_Z_PS0_ADDR
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
	Name = .PART_6_D_CTX_ZERO_PS0_TSB,
	hypervisor
	}
#endif
SECTION .PART_6_D_CTX_NONZERO_PS0_TSB   DATA_VA=PART6_D_NZ_PS0_ADDR
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
	Name = .PART_6_D_CTX_NONZERO_PS0_TSB,	
	hypervisor
	}
#endif
SECTION .PART_6_TSB_LINK   DATA_VA=PART_6_LINK_AREA_BASE_ADDR
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
	Name = .PART_6_TSB_LINK,	
	hypervisor
	}
#endif
#endif

#ifdef PART_7_USED
SECTION .PART_7_I_CTX_ZERO_PS0_TSB   DATA_VA=PART7_I_Z_PS0_ADDR
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
	Name = .PART_7_I_CTX_ZERO_PS0_TSB,
	hypervisor
	}
#endif
SECTION .PART_7_I_CTX_NONZERO_PS0_TSB    DATA_VA=PART7_I_NZ_PS0_ADDR
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
	Name = .PART_7_I_CTX_NONZERO_PS0_TSB,
	hypervisor
	}
#endif
SECTION .PART_7_D_CTX_ZERO_PS0_TSB    DATA_VA=PART7_D_Z_PS0_ADDR
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
	Name = .PART_7_D_CTX_ZERO_PS0_TSB,
	hypervisor
	}
#endif
SECTION .PART_7_D_CTX_NONZERO_PS0_TSB   DATA_VA=PART7_D_NZ_PS0_ADDR
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
	Name = .PART_7_D_CTX_NONZERO_PS0_TSB,	
	hypervisor
	}
#endif
SECTION .PART_7_TSB_LINK   DATA_VA=PART_7_LINK_AREA_BASE_ADDR
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
	Name = .PART_7_TSB_LINK,	
	hypervisor
	}
#endif
#endif
	


/*
Add for CSM
*/

#ifdef CSM_ENABLE

#ifdef PART_0_USED
SECTION .PART_0_I_CTX_ZERO_PS0_TSB_CSM   DATA_VA=PART0_I_Z_PS0_TSB_CSM_ADDR
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
	Name = .PART_0_I_CTX_ZERO_PS0_TSB_CSM,
	hypervisor
	}
#endif
SECTION .PART_0_I_CTX_NONZERO_PS0_TSB_CSM    DATA_VA=PART0_I_NZ_PS0_TSB_CSM_ADDR
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
	Name = .PART_0_I_CTX_NONZERO_PS0_TSB_CSM,
	hypervisor
	}
#endif
SECTION .PART_0_D_CTX_ZERO_PS0_TSB_CSM    DATA_VA=PART0_D_Z_PS0_TSB_CSM_ADDR
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
	Name = .PART_0_D_CTX_ZERO_PS0_TSB_CSM,
	hypervisor
	}
#endif
SECTION .PART_0_D_CTX_NONZERO_PS0_TSB_CSM   DATA_VA=PART0_D_NZ_PS0_TSB_CSM_ADDR
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
	Name = .PART_0_D_CTX_NONZERO_PS0_TSB_CSM,	
	hypervisor
	}
#endif

SECTION .PART_0_I_CTX_ZERO_PS1_TSB_CSM   DATA_VA=PART0_I_Z_PS1_TSB_CSM_ADDR
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
	Name = .PART_0_I_CTX_ZERO_PS1_TSB_CSM,
	hypervisor
	}
#endif
SECTION .PART_0_I_CTX_NONZERO_PS1_TSB_CSM    DATA_VA=PART0_I_NZ_PS1_TSB_CSM_ADDR
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
	Name = .PART_0_I_CTX_NONZERO_PS1_TSB_CSM,
	hypervisor
	}
#endif
SECTION .PART_0_D_CTX_ZERO_PS1_TSB_CSM    DATA_VA=PART0_D_Z_PS1_TSB_CSM_ADDR
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
	Name = .PART_0_D_CTX_ZERO_PS1_TSB_CSM,
	hypervisor
	}
#endif
SECTION .PART_0_D_CTX_NONZERO_PS1_TSB_CSM   DATA_VA=PART0_D_NZ_PS1_TSB_CSM_ADDR
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
	Name = .PART_0_D_CTX_NONZERO_PS1_TSB_CSM,	
	hypervisor
	}
#endif
SECTION .PART_0_TSB_CSM_LINK   DATA_VA=PART_0_CSM_LINK_AREA_BASE_ADDR
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
	Name = .PART_0_TSB_CSM_LINK,	
	hypervisor
	}
#endif
#endif

#ifdef PART_1_USED
SECTION .PART_1_I_CTX_ZERO_PS0_TSB_CSM   DATA_VA=PART1_I_Z_PS0_TSB_CSM_ADDR
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
	Name = .PART_1_I_CTX_ZERO_PS0_TSB_CSM,
	hypervisor
	}
#endif
SECTION .PART_1_I_CTX_NONZERO_PS0_TSB_CSM    DATA_VA=PART1_I_NZ_PS0_TSB_CSM_ADDR
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
	Name = .PART_1_I_CTX_NONZERO_PS0_TSB_CSM,
	hypervisor
	}
#endif
SECTION .PART_1_D_CTX_ZERO_PS0_TSB_CSM    DATA_VA=PART1_D_Z_PS0_TSB_CSM_ADDR
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
	Name = .PART_1_D_CTX_ZERO_PS0_TSB_CSM,
	hypervisor
	}
#endif
SECTION .PART_1_D_CTX_NONZERO_PS0_TSB_CSM   DATA_VA=PART1_D_NZ_PS0_TSB_CSM_ADDR
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
	Name = .PART_1_D_CTX_NONZERO_PS0_TSB_CSM,	
	hypervisor
	}
#endif
SECTION .PART_1_TSB_CSM_LINK   DATA_VA=PART_1_CSM_LINK_AREA_BASE_ADDR
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
	Name = .PART_1_TSB_CSM_LINK,	
	hypervisor
	}
#endif
#endif

#ifdef PART_2_USED
SECTION .PART_2_I_CTX_ZERO_PS0_TSB_CSM   DATA_VA=PART2_I_Z_PS0_TSB_CSM_ADDR
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
	Name = .PART_2_I_CTX_ZERO_PS0_TSB_CSM,
	hypervisor
	}
#endif
SECTION .PART_2_I_CTX_NONZERO_PS0_TSB_CSM    DATA_VA=PART2_I_NZ_PS0_TSB_CSM_ADDR
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
	Name = .PART_2_I_CTX_NONZERO_PS0_TSB_CSM,
	hypervisor
	}
#endif
SECTION .PART_2_D_CTX_ZERO_PS0_TSB_CSM    DATA_VA=PART2_D_Z_PS0_TSB_CSM_ADDR
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
	Name = .PART_2_D_CTX_ZERO_PS0_TSB_CSM,
	hypervisor
	}
#endif
SECTION .PART_2_D_CTX_NONZERO_PS0_TSB_CSM   DATA_VA=PART2_D_NZ_PS0_TSB_CSM_ADDR
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
	Name = .PART_2_D_CTX_NONZERO_PS0_TSB_CSM,	
	hypervisor
	}
#endif
SECTION .PART_2_TSB_CSM_LINK   DATA_VA=PART_2_CSM_LINK_AREA_BASE_ADDR
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
	Name = .PART_2_TSB_CSM_LINK,	
	hypervisor
	}
#endif
#endif

#ifdef PART_3_USED
SECTION .PART_3_I_CTX_ZERO_PS0_TSB_CSM   DATA_VA=PART3_I_Z_PS0_TSB_CSM_ADDR
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
	Name = .PART_3_I_CTX_ZERO_PS0_TSB_CSM,
	hypervisor
	}
#endif
SECTION .PART_3_I_CTX_NONZERO_PS0_TSB_CSM    DATA_VA=PART3_I_NZ_PS0_TSB_CSM_ADDR
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
	Name = .PART_3_I_CTX_NONZERO_PS0_TSB_CSM,
	hypervisor
	}
#endif
SECTION .PART_3_D_CTX_ZERO_PS0_TSB_CSM    DATA_VA=PART3_D_Z_PS0_TSB_CSM_ADDR
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
	Name = .PART_3_D_CTX_ZERO_PS0_TSB_CSM,
	hypervisor
	}
#endif
SECTION .PART_3_D_CTX_NONZERO_PS0_TSB_CSM   DATA_VA=PART3_D_NZ_PS0_TSB_CSM_ADDR
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
	Name = .PART_3_D_CTX_NONZERO_PS0_TSB_CSM,	
	hypervisor
	}
#endif
SECTION .PART_3_TSB_CSM_LINK   DATA_VA=PART_3_CSM_LINK_AREA_BASE_ADDR
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
	Name = .PART_3_TSB_CSM_LINK,	
	hypervisor
	}
#endif
#endif

#ifdef PART_4_USED
SECTION .PART_4_I_CTX_ZERO_PS0_TSB_CSM   DATA_VA=PART4_I_Z_PS0_TSB_CSM_ADDR
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
	Name = .PART_4_I_CTX_ZERO_PS0_TSB_CSM,
	hypervisor
	}
#endif
SECTION .PART_4_I_CTX_NONZERO_PS0_TSB_CSM    DATA_VA=PART4_I_NZ_PS0_TSB_CSM_ADDR
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
	Name = .PART_4_I_CTX_NONZERO_PS0_TSB_CSM,
	hypervisor
	}
#endif
SECTION .PART_4_D_CTX_ZERO_PS0_TSB_CSM    DATA_VA=PART4_D_Z_PS0_TSB_CSM_ADDR
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
	Name = .PART_4_D_CTX_ZERO_PS0_TSB_CSM,
	hypervisor
	}
#endif
SECTION .PART_4_D_CTX_NONZERO_PS0_TSB_CSM   DATA_VA=PART4_D_NZ_PS0_TSB_CSM_ADDR
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
	Name = .PART_4_D_CTX_NONZERO_PS0_TSB_CSM,	
	hypervisor
	}
#endif
SECTION .PART_4_TSB_CSM_LINK   DATA_VA=PART_4_CSM_LINK_AREA_BASE_ADDR
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
	Name = .PART_4_TSB_CSM_LINK,	
	hypervisor
	}
#endif
#endif

#ifdef PART_5_USED
SECTION .PART_5_I_CTX_ZERO_PS0_TSB_CSM   DATA_VA=PART5_I_Z_PS0_TSB_CSM_ADDR
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
	Name = .PART_5_I_CTX_ZERO_PS0_TSB_CSM,
	hypervisor
	}
#endif
SECTION .PART_5_I_CTX_NONZERO_PS0_TSB_CSM    DATA_VA=PART5_I_NZ_PS0_TSB_CSM_ADDR
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
	Name = .PART_5_I_CTX_NONZERO_PS0_TSB_CSM,
	hypervisor
	}
#endif
SECTION .PART_5_D_CTX_ZERO_PS0_TSB_CSM    DATA_VA=PART5_D_Z_PS0_TSB_CSM_ADDR
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
	Name = .PART_5_D_CTX_ZERO_PS0_TSB_CSM,
	hypervisor
	}
#endif
SECTION .PART_5_D_CTX_NONZERO_PS0_TSB_CSM   DATA_VA=PART5_D_NZ_PS0_TSB_CSM_ADDR
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
	Name = .PART_5_D_CTX_NONZERO_PS0_TSB_CSM,	
	hypervisor
	}
#endif
SECTION .PART_5_TSB_CSM_LINK   DATA_VA=PART_5_CSM_LINK_AREA_BASE_ADDR
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
	Name = .PART_5_TSB_CSM_LINK,	
	hypervisor
	}
#endif
#endif

#ifdef PART_6_USED
SECTION .PART_6_I_CTX_ZERO_PS0_TSB_CSM   DATA_VA=PART6_I_Z_PS0_TSB_CSM_ADDR
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
	Name = .PART_6_I_CTX_ZERO_PS0_TSB_CSM,
	hypervisor
	}
#endif
SECTION .PART_6_I_CTX_NONZERO_PS0_TSB_CSM   DATA_VA=PART6_I_NZ_PS0_TSB_CSM_ADDR
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
	Name = .PART_6_I_CTX_NONZERO_PS0_TSB_CSM,
	hypervisor
	}
#endif
SECTION .PART_6_D_CTX_ZERO_PS0_TSB_CSM    DATA_VA=PART6_D_Z_PS0_TSB_CSM_ADDR
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
	Name = .PART_6_D_CTX_ZERO_PS0_TSB_CSM,
	hypervisor
	}
#endif
SECTION .PART_6_D_CTX_NONZERO_PS0_TSB_CSM   DATA_VA=PART6_D_NZ_PS0_TSB_CSM_ADDR
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
	Name = .PART_6_D_CTX_NONZERO_PS0_TSB_CSM,	
	hypervisor
	}
#endif
SECTION .PART_6_TSB_CSM_LINK   DATA_VA=PART_6_CSM_LINK_AREA_BASE_ADDR
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
	Name = .PART_6_TSB_CSM_LINK,	
	hypervisor
	}
#endif
#endif

#ifdef PART_7_USED
SECTION .PART_7_I_CTX_ZERO_PS0_TSB_CSM   DATA_VA=PART7_I_Z_PS0_TSB_CSM_ADDR
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
	Name = .PART_7_I_CTX_ZERO_PS0_TSB_CSM,
	hypervisor
	}
#endif
SECTION .PART_7_I_CTX_NONZERO_PS0_TSB_CSM    DATA_VA=PART7_I_NZ_PS0_TSB_CSM_ADDR
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
	Name = .PART_7_I_CTX_NONZERO_PS0_TSB_CSM,
	hypervisor
	}
#endif
SECTION .PART_7_D_CTX_ZERO_PS0_TSB_CSM    DATA_VA=PART7_D_Z_PS0_TSB_CSM_ADDR
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
	Name = .PART_7_D_CTX_ZERO_PS0_TSB_CSM,
	hypervisor
	}
#endif
SECTION .PART_7_D_CTX_NONZERO_PS0_TSB_CSM   DATA_VA=PART7_D_NZ_PS0_TSB_CSM_ADDR
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
	Name = .PART_7_D_CTX_NONZERO_PS0_TSB_CSM,	
	hypervisor
	}
#endif
SECTION .PART_7_TSB_CSM_LINK   DATA_VA=PART_7_CSM_LINK_AREA_BASE_ADDR
#ifndef ALL_PAGE_CUSTOM_MAP
attr_data {
	Name = .PART_7_TSB_CSM_LINK,	
	hypervisor
	}
#endif
#endif
#endif
#endif
#endif



/*
////////////////////////////////////////////////////////////////////
*/

			
SECTION .TRAPS         TEXT_VA=TRAP_BASE_VA, DATA_VA=TRAP_DATA_VA
#ifndef ALL_PAGE_CUSTOM_MAP
changequote([, ])dnl
forloop([i], 0, 7, [
ifdef([part_]i[_used],[	
attr_text {
	Name = .TRAPS,
	RA = TRAP_BASE_RA,
	PA = ra2pa2(TRAP_BASE_RA,i),
	[part_]i[_i_ctx_zero_ps0_tsb],
#ifdef CSM_ENABLE
	[part_]i[_i_ctx_zero_ps0_tsb_csm],
    TTE_HDID=0, TTE_HD_SIZE=mpeval(PTON_NUM_TILES%64), TTE_SDID=0, TTE_LSID=0,
#endif
	TTE_G=1,       TTE_Context=0, TTE_V=1,    TTE_Size=PART0_I_Z_PS0_PAGE_SIZE, TTE_NFO=0, TTE_IE=0, 
	TTE_Soft2=0,   TTE_Diag=0,    TTE_Soft=0, TTE_L=0,    TTE_CP=1,  TTE_CV=0, 
	TTE_E=0,      TTE_P=1,        TTE_W=1

	}
attr_data {
	Name = .TRAPS,	
	RA = TRAP_DATA_RA,
	PA = ra2pa2(TRAP_DATA_RA,i),
	[part_]i[_d_ctx_zero_ps0_tsb],
#ifdef CSM_ENABLE
	[part_]i[_d_ctx_zero_ps0_tsb_csm],
    TTE_HDID=0, TTE_HD_SIZE=mpeval(PTON_NUM_TILES%64), TTE_SDID=0, TTE_LSID=0,
#endif
	TTE_G=1,       TTE_Context=0, TTE_V=1,    TTE_Size=PART0_D_Z_PS0_PAGE_SIZE, TTE_NFO=0, TTE_IE=0, 
	TTE_Soft2=0,   TTE_Diag=0,    TTE_Soft=0, TTE_L=0,    TTE_CP=1,  TTE_CV=0, 
	TTE_E=0,      TTE_P=1,        TTE_W=1

	}
])dnl
])dnl
changequote(`,')dnl'
#endif
				
#include "traps.s"

	
SECTION .KERNEL      TEXT_VA =	KERNEL_BASE_TEXT_VA, DATA_VA=KERNEL_BASE_DATA_VA
#ifndef ALL_PAGE_CUSTOM_MAP
changequote([, ])dnl
forloop([i], 0, 7, [
ifdef([part_]i[_used],[	
attr_text {
	Name = .KERNEL,
	RA = KERNEL_BASE_TEXT_RA,
	PA = ra2pa2(KERNEL_BASE_TEXT_RA,i),
	[part_]i[_i_ctx_nonzero_ps0_tsb],
	[part_]i[_i_ctx_zero_ps0_tsb],
#ifdef CSM_ENABLE
	[part_]i[_i_ctx_nonzero_ps0_tsb_csm],
	[part_]i[_i_ctx_zero_ps0_tsb_csm],
    TTE_HDID=0, TTE_HD_SIZE=mpeval(PTON_NUM_TILES%64), TTE_SDID=0, TTE_LSID=0,
#endif
	TTE_G=1,       TTE_Context=0, TTE_V=1,    TTE_Size=PART0_I_Z_PS0_PAGE_SIZE, TTE_NFO=0, TTE_IE=0, 
	TTE_Soft2=0,   TTE_Diag=0,    TTE_Soft=0, TTE_L=0,    TTE_CP=1,  TTE_CV=0, 
	TTE_E=0,      TTE_P=1,        TTE_W=1

	}
	
attr_data {
	Name = .KERNEL,
	RA=KERNEL_BASE_DATA_RA,
	PA=ra2pa2(KERNEL_BASE_DATA_RA,i),
	[part_]i[_d_ctx_nonzero_ps0_tsb],
	[part_]i[_d_ctx_zero_ps0_tsb],

#ifdef CSM_ENABLE
	[part_]i[_d_ctx_nonzero_ps0_tsb_csm],
	[part_]i[_d_ctx_zero_ps0_tsb_csm],
    TTE_HDID=0, TTE_HD_SIZE=mpeval(PTON_NUM_TILES%64), TTE_SDID=0, TTE_LSID=0,
#endif
	TTE_G=1, TTE_Context=0, TTE_V=1, TTE_Size=PART0_D_Z_PS0_PAGE_SIZE, TTE_NFO=0,
	TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
	TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=1, TTE_W=1

	}
])dnl
])dnl
changequote(`,')dnl'
#endif


.text

kernel:	
	! set trap base addr
	setx	TRAP_BASE_VA, %l0, %l7
	wrpr	%l7, %g0, %tba

	! setup %g7 to point to per thread user data scratchpad
	rdth_id_p		! get thread ID in %o1
	mov	%o1, %o5	! save in %o5 to be used later
	sllx	%o1, 7, %o1
	setx	user_globals, %g1, %g7
	add	%g7, %o1, %g7

#ifndef USER_PAGE_CUSTOM_MAP	/*!added as per the request of "Bob Rethemeyer" to support MBLIMP on 06/24/04*/
	! setup user heap pointer
	setx    heapptr, %g1, %g2
	setx	user_heap_start, %g1, %g3
	stx     %g3, [%g2]
#endif
		
	! init context regs
	setx	PCONTEXT, %l0, %o1
	setx	SCONTEXT, %l0, %o2
#if !defined(USER_PAGE_CUSTOM_MAP) && defined(USER_TEXT_MT_MAP)
	add	%o1, %o5, %o1	! add thread id to contexts
	add	%o2, %o5, %o2
#endif
#ifndef USER_PAGE_CUSTOM_MAP
	mov	0x0, %o3	! go to non-priv code
#else	
	mov	0x1, %o3	! go to priv code
#endif
	mov	0x0, %o4	! set hpriv to zero
        setx    start_label_list, %g1, %g2
        sllx    %o5, 3, %o5             ! offset - start_label_list
        ldx     [%g2 + %o5], %o5        ! %o5 contains start_label
	ta	T_CHANGE_CTX
	nop

#include "kernel_handler.s"
	
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	
#ifndef USER_PAGE_CUSTOM_MAP
#ifndef ALL_PAGE_CUSTOM_MAP
changequote([, ])dnl
foreachbit([i], 128, M4_user_text_mask, [
#ifndef USER_TEXT_MT_MAP
SECTION .MAIN  TEXT_VA=MAIN_BASE_TEXT_VA, DATA_VA=MAIN_BASE_DATA_VA, BSS_VA=MAIN_BASE_BSS_VA
#else
SECTION [.MAIN]i  TEXT_VA=[0x]mpeval(MAIN_BASE_TEXT_VA + i * USER_PAGE_INCR, 16), DATA_VA=[0x]mpeval(MAIN_BASE_DATA_VA + i * USER_PAGE_INCR, 16), BSS_VA=[0x]mpeval(MAIN_BASE_BSS_VA + i * USER_PAGE_INCR, 16)
#endif
attr_text {
#ifndef USER_TEXT_MT_MAP
	Name = .MAIN,
#else
	Name = [.MAIN]i,
#endif
	VA= [0x]mpeval(MAIN_BASE_TEXT_VA + i * USER_PAGE_INCR, 16),
	RA= [0x]mpeval(MAIN_BASE_TEXT_RA + i * USER_PAGE_INCR, 16),
        PA= ra2pa2([0x]mpeval(MAIN_BASE_TEXT_RA + i * USER_PAGE_INCR, 16),tid2pid(i)),
	[part_]tid2pid(i)[_i_ctx_nonzero_ps0_tsb],
#ifdef CSM_ENABLE
    [part_]tid2pid(i)[_i_ctx_nonzero_ps0_tsb_csm],
#endif
#ifdef MAIN_PAGE_NUCLEUS_ALSO
	[part_]tid2pid(i)[_i_ctx_zero_ps0_tsb],
#ifdef CSM_ENABLE
    [part_]tid2pid(i)[_i_ctx_zero_ps0_tsb_csm],
#endif
#endif
#ifdef MAIN_TEXT_DATA_ALSO
	[part_]tid2pid(i)[_d_ctx_nonzero_ps0_tsb],
#ifdef CSM_ENABLE
	[part_]tid2pid(i)[_d_ctx_nonzero_ps0_tsb_csm],
#endif
#endif
#ifdef MAIN_TEXT_PAGE_NUCLEUS_DATA_ALSO
	[part_]tid2pid(i)[_d_ctx_zero_ps0_tsb],
#ifdef CSM_ENABLE
	[part_]tid2pid(i)[_d_ctx_zero_ps0_tsb_csm],
#endif

#endif
#ifdef CSM_ENABLE
    TTE_HDID=0, TTE_HD_SIZE=mpeval(PTON_NUM_TILES%64), TTE_SDID=0, TTE_LSID=0,
#endif
	TTE_G=1, TTE_Context=[0x]eval(PCONTEXT + i, 16), TTE_V=1, TTE_Size=PART0_I_NZ_PS0_PAGE_SIZE, TTE_NFO=0,
	TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
	TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
	}
])dnl
#ifdef MAIN_PAGE_HV_ALSO		
foreachbit([i], 128, M4_user_text_mask, [
attr_text {
#ifndef USER_TEXT_MT_MAP
	Name = .MAIN,
#else
	Name = [.MAIN]i,
#endif
	VA= [0x]mpeval(MAIN_BASE_TEXT_VA + i * USER_PAGE_INCR, 16),
	hypervisor
	}
])dnl	
#endif	
foreachbit([i], 128, M4_user_data_mask, [
attr_data {
#ifndef USER_TEXT_MT_MAP
	Name = .MAIN,
#else
	Name = [.MAIN]i,
#endif
        VA= [0x]mpeval(MAIN_BASE_DATA_VA + i * USER_PAGE_INCR, 16),
	RA= [0x]mpeval(MAIN_BASE_DATA_RA + i * USER_PAGE_INCR, 16),
	PA= ra2pa2([0x]mpeval(MAIN_BASE_DATA_RA + i * USER_PAGE_INCR, 16),tid2pid(i)),
	[part_]tid2pid(i)[_d_ctx_nonzero_ps0_tsb],
#ifdef CSM_ENABLE
    [part_]tid2pid(i)[_d_ctx_nonzero_ps0_tsb_csm],
#endif
#ifdef MAIN_PAGE_NUCLEUS_ALSO
	[part_]tid2pid(i)[_d_ctx_zero_ps0_tsb],
#ifdef CSM_ENABLE
	[part_]tid2pid(i)[_d_ctx_zero_ps0_tsb_csm],
#endif
#endif	
#ifdef MAIN_DATA_TEXT_ALSO
	[part_]tid2pid(i)[_i_ctx_nonzero_ps0_tsb],
#ifdef CSM_ENABLE
	[part_]tid2pid(i)[_i_ctx_nonzero_ps0_tsb_csm],
#endif
#endif
#ifdef CSM_ENABLE
        TTE_HDID=0, TTE_HD_SIZE=mpeval(PTON_NUM_TILES%64), TTE_SDID=0, TTE_LSID=0,
#endif
        TTE_G=1, TTE_Context=[0x]eval(PCONTEXT + i, 16), TTE_V=1, TTE_Size=PART0_D_NZ_PS0_PAGE_SIZE, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }
])dnl
#ifdef MAIN_PAGE_HV_ALSO		
foreachbit([i], 128, M4_user_data_mask, [
attr_data {
#ifndef USER_TEXT_MT_MAP
	Name = .MAIN,
#else
	Name = [.MAIN]i,
#endif
        VA= [0x]mpeval(MAIN_BASE_DATA_VA + i * USER_PAGE_INCR, 16),
	hypervisor
	}
])dnl
#endif	
foreachbit([i], 128, M4_user_data_mask, [
attr_bss {
#ifndef USER_TEXT_MT_MAP
	Name = .MAIN,
#else
	Name = [.MAIN]i,
#endif
        VA= [0x]mpeval(MAIN_BASE_BSS_VA + i * USER_PAGE_INCR, 16),
	RA= [0x]mpeval(MAIN_BASE_BSS_RA + i * USER_PAGE_INCR, 16),
	PA= ra2pa2([0x]mpeval(MAIN_BASE_BSS_RA + i * USER_PAGE_INCR, 16),tid2pid(i)),
	[part_]tid2pid(i)[_d_ctx_nonzero_ps0_tsb],
#ifdef CSM_ENABLE
    [part_]tid2pid(i)[_d_ctx_nonzero_ps0_tsb_csm],
        TTE_HDID=0, TTE_HD_SIZE=mpeval(PTON_NUM_TILES%64), TTE_SDID=0, TTE_LSID=0,       
#endif

        TTE_G=0, TTE_Context=[0x]eval(PCONTEXT + i, 16), TTE_V=1, TTE_Size=PART0_D_NZ_PS0_PAGE_SIZE, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }
])dnl

changequote(`,')dnl'
#endif
#endif

#ifdef USE_STACK
changequote([, ])dnl
foreachbit([i], 128, THREAD_MASK, [
SECTION [.STACK]eval(i) BSS_VA= [0x]mpeval(STACK_BASE_VA + i * USER_PAGE_INCR, 16)

attr_bss {
        NAME=[.STACK]eval(i),
        VA=[0x]mpeval(STACK_BASE_VA + i * USER_PAGE_INCR, 16),
        RA=[0x]mpeval(STACK_BASE_RA + i * USER_PAGE_INCR, 16),
        PA=ra2pa2([0x]mpeval(STACK_BASE_RA + i * USER_PAGE_INCR, 16), tid2pid(eval(i))),
	    [part_]tid2pid(eval(i))[_d_ctx_nonzero_ps0_tsb],
#ifdef CSM_ENABLE
        [part_]tid2pid(eval(i))[_d_ctx_nonzero_ps0_tsb_csm],
        TTE_HDID=0, TTE_HD_SIZE=mpeval(PTON_NUM_TILES%64), TTE_SDID=0, TTE_LSID=0,
#endif
        TTE_G=1, TTE_Context=PCONTEXT,
        TTE_V=1, TTE_Size=PART0_D_NZ_PS0_PAGE_SIZE, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }
.section .bss
.global [stack]eval(i)
[stack]eval(i):
        .skip STACKSIZE

])dnl
changequote(`,')dnl'
#endif /*! ifdef USE_STACK*/


