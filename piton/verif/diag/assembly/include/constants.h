// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: constants.h
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
#ifndef __CONSTANTS_H__
#define __CONSTANTS_H__

#define ALREADY_INCLUDED_CONSTANTS_DOT_H

#define PAGE_4K_MASK 	0xfff
#define PAGE_8K_MASK 	0x1fff
#define PAGE_64K_MASK 	0xffff
#define PAGE_512K_MASK  0x7ffff
#define PAGE_4M_MASK    0x3fffff

#define ALIGN_PAGE_4K		.align PAGE_4K_MASK+1
#define ALIGN_PAGE_8K		.align PAGE_8K_MASK+1
#define ALIGN_PAGE_64K		.align PAGE_64K_MASK+1
#define ALIGN_PAGE_512K         .align PAGE_512K_MASK+1
#define ALIGN_PAGE_4M           .align PAGE_4M_MASK+1

#if 0

#define ICACHE_LINE_SIZE_IN_BYTES	32
#define DCACHE_LINE_SIZE_IN_BYTES	32
#define PCACHE_LINE_SIZE_IN_BYTES       64
#define WCACHE_LINE_SIZE_IN_BYTES       64

#define ECACHE_LINE_SIZE_IN_BYTES_1M    64
#define ECACHE_LINE_SIZE_IN_BYTES_4M   256
#define ECACHE_LINE_SIZE_IN_BYTES_8M   512
 
! ASR field definitions
#include "asr.h"

! ASI field definitions and alternate names
#include "asi_s.h"

! MEMBAR definitions
#include "membar.h"

! PSTATE field definitions
#include "pstate.h"

! TSTATE field definitions and initialization
#include "tstate.h"

! VER field definitions
#include "ver.h"

! MMU and TSB mappings and definitions:
#include "mmu_tsb_map.h"

! DCU_CONTROL_REGISTER field definitions and initializations
#include "dcu_ctrl_reg.h"

! SAFARI field definitions and initializations
#include "safari_config_reg.h"
#include "safari_port_id.h"

! ESTATE definitions and initializations
#include "estate.h"

! AFSR (Asynchronous Fault Status Register) definitions and initializations
#include "afsr.h"

! DISPATCH_CONTROL_REGISTER definitions and initializations
#include "dispatch_ctrl_reg.h"

! TTE definitions and switches
#include "tte.h"

! TLB definitions and constants
#include "tlb.h"
#include "tlb_tag.h"
#include "tlb_cam.h"

! ICACHE Diagnostic Access registers' field definitions
#include "icache_tag.h"
#include "icache_instr.h"
#include "icache_snoop.h"

! DCACHE Diagnostic Access registers'  field definitions
#include "dcache_tag.h"
#include "dcache_data.h"
#include "dcache_snoop.h"

! WCACHE Diagnostic Access registers'  field definitions
#include "wcache_tag.h"
#include "wcache_data.h"
#include "wcache_snoop.h"

! PCACHE Diagnostic Access registers'  field definitions
#include "pcache_tag.h"
#include "pcache_status_data.h"
#include "pcache_data.h"
#include "pcache_snoop.h"
#include "pcache_hist_tag.h"
#include "pcache_hist_data.h"

! ECACHE Diagnostic Access registers' field definitions
#include "ecache_ctrl_reg.h"
#include "ecache_data.h"
#include "ecache_tag.h"

! ASI_BRANCH_PREDICTION_ARRAY field definitions
#include "bpa.h"

! ASI_FDIV_SQRT_SEED field definitions
#include "fdiv_seed_tbl.h"

! ASR_PERF_CONTROL_REG field definitions
#include "pcr.h"

! ASR_PERF_COUNTER field definitions
#include "pic.h"

! ASR_GRAPHIC_STATUS_REG field definitions
#include "gsr.h"

! TSB register definitions
#include "tsb_tag.h"
#include "tsb_base.h"
#include "tsb_ext.h"

! misc. MMU definitions
#include "context_reg.h"
#include "sfsr.h"
#include "demap.h"

! MCU registers
#include "mcu_tim1_ctrl_reg.h"
#include "mcu_tim2_ctrl_reg.h"
#include "mcu_tim3_ctrl_reg.h"
#include "mcu_tim4_ctrl_reg.h"
#include "mcu_addr_dec_reg0.h"
#include "mcu_addr_dec_reg1.h"
#include "mcu_addr_dec_reg2.h"
#include "mcu_addr_dec_reg3.h"
#include "mcu_addr_ctrl_reg.h"

!Floating point status register
#include "fsr.h"

! TICK  registers
#include "tick.h"
#include "tick_compare.h"
#include "stick.h"
#include "stick_compare.h"

! Interrupt registers
#include "intr_dispatch_status.h"
#include "intr_receive.h"
#include "softint.h"

! Boot Bus registers
#include "bootbus_ctrl_reg.h"

! Trap Types definitions
#include "trap_types.h"

! Poweron-sequence initialization
#include "poweron_init.h"

#ifdef PDU_DIAGS

#ifndef STOP_SIM
#define STOP_SIM	0x48
#endif
#define STALL_G(n)	tn %icc, n
#define STALL2_G(n)     sub %g0, n, %g0

#endif PDU_DIAGS

#endif /* if 0 */

#endif /* __CONSTANTS_H__*/
