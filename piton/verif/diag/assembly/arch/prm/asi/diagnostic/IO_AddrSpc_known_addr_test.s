// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: IO_AddrSpc_known_addr_test.s
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
!       Walk ones (0x00000008 to 0x80000000),  thru each address space
!       i.e. the address bits, and do a DW read followed by a write for
!       each location touched, use all four threads each covers a quarter
!       of the space (80-9F, A0-BF, C0-DF and E0-FF).
!
!   2) a diag to cover defined regs, try both read and writes, may be same
!   data, since we are mostly interested in thread not hanging and
!   destination unit being able to decode the addr.
!
!   The table and details are in PRM 1.2
!
!   TABLE 9-1 Block Address Assignment Address Range (8 MSBs of the 40-bit
!   Address)
!   0x00-0x7F       DRAM  --  Ignored
!   0x80            JBUS1
!                       0000_0000 & 0000_0008  CTRL regs
!                       0001-0000 - 0001-00A0  Error regs
!                               TABLE 12-44  JBI_ERR_INJECT (0x4800)
!                       0002-0000 & 0002-0008  Perf regs
!   0x81-0x95       RSVD2 Reserved
!   0x96            CLKU Clock Unit
!   0x97            DRAMCSR Control registers
!   0x98            IOBMAN Management Block
!   0x99            TAP TAP Unit
!   0x9A-0x9D       RSVD4 Reserved
!   0x9E            TAP2ASI TAP access to ASI space
!   0x9F            IOBINT Interrupt Table
!   0xA0-0xBF       L2CSR Control registers and diagnostic access
!   0xC0-0xFE       JBUS2
!   0xFF0-FFE       -reserved boot rom area
!   0xFFF           BOOT ROM
!
!

! Note test can't "fail", it can only hang (TIMEOUT)
!
!
#include "err_defines.h"

#define  JBI_CONFIG
	
#define  THREAD_COUNT 4
#include "boot.s"




    .text
    .global main

main:                   !  test enters here from boot in user mode


th_fork(th_main)
th_main_0:
	setx	th0_address_table,%l1,%g1	! each thread has own table of addresses to check
        setx	active_thread, %l1, %l0
        jmpl    %l0, %o7
        nop

th_main_1:
	setx	th1_address_table,%l1,%g1	! each thread has own table of addresses to check
        setx	active_thread, %l1, %l0
        jmpl	%l0, %o7
        nop

th_main_2:
	setx	th2_address_table,%l1,%g1	! each thread has own table of addresses to check
        setx	active_thread, %l1, %l0
        jmpl	%l0, %o7
        nop


th_main_3:
	setx	th3_address_table,%l1,%g1	! each thread has own table of addresses to check
        setx	active_thread, %l1, %l0
        jmpl	%l0, %o7
        nop




    SECTION .ACTIVE_THREAD_SEC TEXT_VA=0x0000000040004000
    attr_text {
            Name = .ACTIVE_THREAD_SEC,
            VA= 0x0000000040004000,
            PA= ra2pa(0x0000000040004000,0),
            RA= 0x0000000040004000,
            part_0_i_ctx_nonzero_ps0_tsb,
            part_0_d_ctx_nonzero_ps0_tsb,
            TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
            TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
            TTE_L=0, TTE_CP=0, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
            }
     attr_text {
            Name = .ACTIVE_THREAD_SEC,
            hypervisor
            }

    .text
    .global active_thread

active_thread:
        ta      T_CHANGE_HPRIV          ! enter Hyper mode

	
! Set read transaction timeout in JBI_LOG_ENB
 setx   JBI_LOG_ENB, %l0, %l1
 mov    1, %l0
 sllx   %l0, JBI_ERR_READ_TO, %l0
 stx    %l0, [%l1]
 ! Also set READ_TO in JBI_SIG_ENB - this will enable IOB interrupts on read timeout
 stx    %l0, [%l1+0x8]
 ! Set JBI's transaction timeout register
 setx   JBI_TRANS_TIMEOUT, %l0, %l1
 mov    0x10, %l0                ! 16 JBUS cycles
 stx    %l0, [%l1]
 stx    %l0, [%l1+0x8]           ! Also set JBI_INTR_TIMEOUT
 ! Set JBI's global error enable
 setx   JBI_ERR_CONFIG, %l0, %l1
 mov    0x8, %l0                 ! Set Bit 3 (ERREN)
 stx    %l0, [%l1]


	
        ldx     [%g0+%g1],%l0           ! get next address entry
	brz	%l0,Done_with_table
	nop

	setx	th3_address_table,%l1,%l0
	cmp	%l0,%g1
	be	th3_first_loop_top
	nop
	
First_loop_top:
	
	ldx	[%g0+%l0],%l1		! get reg contents
	nop
	nop
        stx     %l1,[%g0+%l0]		! write them back

        add     %g1,8,%g1		! build next table entry pointer
        ldx     [%g0+%g1],%l0           ! get next address entry
	brz	%l0,First_loop_top
	nop


Done_with_table:
        ta              T_GOOD_TRAP


th3_first_loop_top:	
        stx     %g0,[%g0+%l0]	
	nop
	nop
	ldx	[%g0+%l0],%l1		! get reg contents
        add     %g1,8,%g1		! build next table entry pointer
        ldx     [%g0+%g1],%l0           ! get next address entry
	brz	%l0,th3_first_loop_top
	nop


th3_done_with_table:
        ta              T_GOOD_TRAP



	


    SECTION .DATA_AREA_SEC DATA_VA=0x0000000040008000
    attr_data {
            Name = .DATA_AREA_SEC,
            hypervisor
            }
    .data
    .global th0_address_table
    .global th1_address_table
    .global th2_address_table
    .global th3_address_table


th0_address_table:	
		.xword	0x0000008000000000		! JPUS CTRL reg
		.xword	0x0000008000000008		! JBUS CTRL reg

		.xword	0x0000008000010000		! JBUS Error config reg
		.xword	0x0000008000010008		! JBUS Error config 2 reg
		.xword	0x0000008000010020		! JBUS Error log reg
		.xword	0x0000008000010028		! JBUS Error overflow reg
		.xword	0x0000008000010030		! JBUS Error mask reg
		.xword	0x0000008000010038		! JBUS Error Signal Enable reg
		.xword	0x0000008000010040		! JBUS Error log address reg
		.xword	0x0000008000010048		! JBUS Error log control reg
		.xword	0x0000008000010050		! JBUS Error log 0 reg
		.xword	0x0000008000010058		! JBUS Error log 1 reg
		.xword	0x0000008000010060		! JBUS Error log parity reg
		.xword	0x0000008000010070		! JBUS Error log NACK reg
		.xword	0x0000008000010078		! JBUS Error log ARB reg
		.xword	0x0000008000010080		! JBUS Error L2_TIMEOUT reg
		.xword	0x0000008000010088		! JBUS Error ARB_TIMEOUT reg
		.xword	0x0000008000010090		! JBUS Error TRANS_TIMEOUT reg
		.xword	0x0000008000010098		! JBUS Error INTR_TIMEOUT reg
		.xword	0x00000080000100A0		! JBUS Error Memory Size Reg
	

		.xword	0x0000009700000000		! DRAM_CAS_ADDR_WIDTH_REG
		.xword	0x0000009700000008		! DRAM_RAS_ADDR_WIDTH_REG
		.xword	0x0000009700000010		! DRAM_CAS_LAT_REG
		.xword	0x0000009700000018		! DRAM_SCRUB_FREQ_REG
		.xword	0x0000009700000020		! DRAM_REFRESH_FREQ_REG

		.xword	0x0000009700000038		! DRAM_REFRESH_COUNTER_REG
		.xword	0x0000009700000040		! DRAM_SCRUB_ENABLE_REG

		.xword	0x0000009700000080		! DRAM_TRRD_REG
		.xword	0x0000009700000088		! DRAM_TRC_REG
		.xword	0x0000009700000090		! DRAM_TRCD_REG
		.xword	0x0000009700000098		! DRAM_TWTR_REG
		.xword	0x00000097000000A0		! DRAM_TRTW_REG
		.xword	0x00000097000000A8		! DRAM_TRTP_REG
		.xword	0x00000097000000B0		! DRAM_TRAS_REG
		.xword	0x00000097000000B8		! DRAM_TRP_REG
		.xword	0x00000097000000C0		! DRAM_TWR_REG
		.xword	0x00000097000000C8		! DRAM_TRFC_REG
		.xword	0x00000097000000D0		! DRAM_TMRD_REG
		.xword	0x00000097000000E0		! DRAM_TIWTR_REG
		.xword	0x00000097000000E8		! DRAM_PRECHARGE_WAIT_REG
		.xword	0x0000009700000108		! DRAM_DIMM_STACK_REG
		.xword	0x0000009700000110		! DRAM_EXT_WR_MODE_REG 1
		.xword	0x0000009700000118		! DRAM_EXT_WR_MODE_REG 2
		.xword	0x0000009700000120		! DRAM_EXT_WR_MODE_REG 3
		.xword	0x0000009700000128		! DRAM_WAIR_CONTROL_REG
		.xword	0x0000009700000130		! DRAM_RANK1_PRESENT_REG
		.xword	0x0000009700000138		! DRAM_CHANNEL_DISABLED_REG
		.xword	0x0000009700000140		! DRAM_SEL_LO_ADDR_BITS_REG

		.xword	0x00000097000001A0		! DRAM_DIMM_INIT_REG
		.xword	0x00000097000001B0		! DRAM_SW_DV_COUNT_REG
		.xword	0x00000097000001B8		! DRAM_HW_DMUX_CLK_INV_REG
		.xword	0x00000097000001C0		! DRAM_PAD_EN_CLK_INV_REG

		.xword	0x0000009700000208		! DRAM_MODE_WRITE_STATUS_REG
		.xword	0x0000009700000210		! DRAM_INIT_STATUS_REG
		.xword	0x0000009700000218		! DRAM_DIMM_PRESENT_REG
		.xword	0x0000009700000220		! DRAM_FAILOVER_STATUS_REG
		.xword	0x0000009700000228		! DRAM_FAILOVER_MASK_REG


th0_address_table_end:	.xword	0,0			! end of table indicator


	.align 64	
th1_address_table:		
		.xword	0x000000FF00010088		! SSI TIMEOUT reg

		.xword	0x0000009600000000		! Clock unit
		.xword	0x0000009600000008		
		.xword	0x0000009600000018		
		.xword	0x0000009600000028		
		.xword	0x0000009600000030
		.xword	0x0000009600000038
		.xword	0x0000009600000040			

		.xword	0x0000009700000400		! DRAM_PERF_CTL_REGs
		.xword	0x0000009700001400
		.xword	0x0000009700002400
		.xword	0x0000009700003400
	
		.xword	0x0000009700000408		! DRAM_PERF_COUNT_REGs
		.xword	0x0000009700001408
		.xword	0x0000009700002408
		.xword	0x0000009700003408	

		.xword	0x0000009700000280		! DRAM_ERROR_STATUS_REG
		.xword	0x0000009700001280	
		.xword	0x0000009700002280	
		.xword	0x0000009700003280

		.xword	0x0000009700000288		! DRAM_ERROR_ADDRESS_REG
		.xword	0x0000009700001288	
		.xword	0x0000009700002288	
		.xword	0x0000009700003288


		.xword	0x0000009700000028		! DRAM_OPEN_BANK_MAX_REG
		.xword	0x0000009700002028		

	
		.xword	0x0000009700000048		! DRAM_PROG_TIME_CNTR_REG
		.xword	0x0000009700001048	
		.xword	0x0000009700002048
		.xword	0x0000009700003048
	
	
		.xword	0x0000009700001000		! DRAM_CAS_ADDR_WIDTH_REG
		.xword	0x0000009700001008		! DRAM_RAS_ADDR_WIDTH_REG
		.xword	0x0000009700001010		! DRAM_CAS_LAT_REG
		.xword	0x0000009700001018		! DRAM_SCRUB_FREQ_REG
		.xword	0x0000009700001020		! DRAM_REFRESH_FREQ_REG

		.xword	0x0000009700001038		! DRAM_REFRESH_COUNTER_REG
		.xword	0x0000009700001040		! DRAM_SCRUB_ENABLE_REG

		.xword	0x0000009700001080		! DRAM_TRRD_REG
		.xword	0x0000009700001088		! DRAM_TRC_REG
		.xword	0x0000009700001090		! DRAM_TRCD_REG
		.xword	0x0000009700001098		! DRAM_TWTR_REG
		.xword	0x00000097000010A0		! DRAM_TRTW_REG
		.xword	0x00000097000010A8		! DRAM_TRTP_REG
		.xword	0x00000097000010B0		! DRAM_TRAS_REG
		.xword	0x00000097000010B8		! DRAM_TRP_REG
		.xword	0x00000097000010C0		! DRAM_TWR_REG
		.xword	0x00000097000010C8		! DRAM_TRFC_REG
		.xword	0x00000097000010D0		! DRAM_TMRD_REG
		.xword	0x00000097000010E0		! DRAM_TIWTR_REG
		.xword	0x00000097000010E8		! DRAM_PRECHARGE_WAIT_REG
		.xword	0x0000009700001108		! DRAM_DIMM_STACK_REG
		.xword	0x0000009700001110		! DRAM_EXT_WR_MODE_REG 1
		.xword	0x0000009700001118		! DRAM_EXT_WR_MODE_REG 2
		.xword	0x0000009700001120		! DRAM_EXT_WR_MODE_REG 3
		.xword	0x0000009700001128		! DRAM_WAIR_CONTROL_REG
		.xword	0x0000009700001130		! DRAM_RANK1_PRESENT_REG
		.xword	0x0000009700001138		! DRAM_CHANNEL_DISABLED_REG
		.xword	0x0000009700001140		! DRAM_SEL_LO_ADDR_BITS_REG

		.xword	0x00000097000011A0		! DRAM_DIMM_INIT_REG
		.xword	0x00000097000011B0		! DRAM_SW_DV_COUNT_REG
		.xword	0x00000097000011B8		! DRAM_HW_DMUX_CLK_INV_REG
		.xword	0x00000097000011C0		! DRAM_PAD_EN_CLK_INV_REG

		.xword	0x0000009700001208		! DRAM_MODE_WRITE_STATUS_REG
		.xword	0x0000009700001210		! DRAM_INIT_STATUS_REG
		.xword	0x0000009700001218		! DRAM_DIMM_PRESENT_REG
		.xword	0x0000009700001220		! DRAM_FAILOVER_STATUS_REG
		.xword	0x0000009700001228		! DRAM_FAILOVER_MASK_REG
	
	
		.xword	0x0000009700000290		! DRAM_ERROR_INJECT_REG
		.xword	0x0000009700001290	
		.xword	0x0000009700002290	
		.xword	0x0000009700003290

		.xword	0x0000009700000298		! DRAM_ERROR_COUNTER_REG
		.xword	0x0000009700001298	
		.xword	0x0000009700002298	
		.xword	0x0000009700003298

		.xword	0x00000097000002A0		! DRAM_ERROR_LOCATION__REG
		.xword	0x00000097000012A0	
		.xword	0x00000097000022A0	
		.xword	0x00000097000032A0

	
		.xword	0x0000009800000828		! TM_STAT_CTL
	
		.xword	0x0000009800000810		! Reset Status Register


		.xword	0x000000AA00000000		! L2_ERROR_EN_REG
		.xword	0x000000AA00000040	
		.xword	0x000000AA00000080			
		.xword	0x000000AA000000C0
	
		.xword	0x000000AB00000000		! L2_ERROR_STATUS_REG
		.xword	0x000000AB00000040	
		.xword	0x000000AB00000080			
		.xword	0x000000AB000000C0
	
		.xword	0x000000AC00000000		! L2_ERROR_ADDRESS_REG
		.xword	0x000000AC00000040	
		.xword	0x000000AC00000080			
		.xword	0x000000AC000000C0
	
		.xword	0x000000AD00000000		! L2_ERROR_INJECT_REG
		.xword	0x000000AD00000040	
		.xword	0x000000AD00000080			
		.xword	0x000000AD000000C0
	

th1_address_table_end:	.xword	0,0			! end of table indicator
	
		
	.align 64	
th2_address_table:		
		.xword	0x0000009800000000		! IOBMAN  Th0
		.xword	0x0000009800000008		! IOBMAN  Th1
		.xword	0x0000009800000010		! IOBMAN  Th2
		.xword	0x0000009800000018		! IOBMAN  Th3
	
		.xword	0x0000009800000400		! IOBCTL  Th0
		.xword	0x0000009800000408		! IOBCTL  Th1
		.xword	0x0000009800000410		! IOBCTL  Th2
		.xword	0x0000009800000418		! IOBCTL  Th3

		.xword	0x0000009800000800		! INT_VEC_DIS
		.xword	0x0000009800000a00		! J_INT_VEC

		.xword	0x0000009700002000		! DRAM_CAS_ADDR_WIDTH_REG
		.xword	0x0000009700002008		! DRAM_RAS_ADDR_WIDTH_REG
		.xword	0x0000009700002010		! DRAM_CAS_LAT_REG
		.xword	0x0000009700002018		! DRAM_SCRUB_FREQ_REG
		.xword	0x0000009700002020		! DRAM_REFRESH_FREQ_REG

		.xword	0x0000009700002038		! DRAM_REFRESH_COUNTER_REG
		.xword	0x0000009700002040		! DRAM_SCRUB_ENABLE_REG

		.xword	0x0000009700002080		! DRAM_TRRD_REG
		.xword	0x0000009700002088		! DRAM_TRC_REG
		.xword	0x0000009700002090		! DRAM_TRCD_REG
		.xword	0x0000009700002098		! DRAM_TWTR_REG
		.xword	0x00000097000020A0		! DRAM_TRTW_REG
		.xword	0x00000097000020A8		! DRAM_TRTP_REG
		.xword	0x00000097000020B0		! DRAM_TRAS_REG
		.xword	0x00000097000020B8		! DRAM_TRP_REG
		.xword	0x00000097000020C0		! DRAM_TWR_REG
		.xword	0x00000097000020C8		! DRAM_TRFC_REG
		.xword	0x00000097000020D0		! DRAM_TMRD_REG
		.xword	0x00000097000020E0		! DRAM_TIWTR_REG
		.xword	0x00000097000020E8		! DRAM_PRECHARGE_WAIT_REG
		.xword	0x0000009700002108		! DRAM_DIMM_STACK_REG
		.xword	0x0000009700002110		! DRAM_EXT_WR_MODE_REG 1
		.xword	0x0000009700002118		! DRAM_EXT_WR_MODE_REG 2
		.xword	0x0000009700002120		! DRAM_EXT_WR_MODE_REG 3
		.xword	0x0000009700002128		! DRAM_WAIR_CONTROL_REG
		.xword	0x0000009700002130		! DRAM_RANK1_PRESENT_REG
		.xword	0x0000009700002138		! DRAM_CHANNEL_DISABLED_REG
		.xword	0x0000009700002140		! DRAM_SEL_LO_ADDR_BITS_REG

		.xword	0x00000097000021A0		! DRAM_DIMM_INIT_REG
		.xword	0x00000097000021B0		! DRAM_SW_DV_COUNT_REG
		.xword	0x00000097000021B8		! DRAM_HW_DMUX_CLK_INV_REG
		.xword	0x00000097000021C0		! DRAM_PAD_EN_CLK_INV_REG

		.xword	0x0000009700002208		! DRAM_MODE_WRITE_STATUS_REG
		.xword	0x0000009700002210		! DRAM_INIT_STATUS_REG
		.xword	0x0000009700002218		! DRAM_DIMM_PRESENT_REG
		.xword	0x0000009700002220		! DRAM_FAILOVER_STATUS_REG
		.xword	0x0000009700002228		! DRAM_FAILOVER_MASK_REG


		.xword	0x0000009700003000		! DRAM_CAS_ADDR_WIDTH_REG
		.xword	0x0000009700003008		! DRAM_RAS_ADDR_WIDTH_REG
		.xword	0x0000009700003010		! DRAM_CAS_LAT_REG
		.xword	0x0000009700003018		! DRAM_SCRUB_FREQ_REG
		.xword	0x0000009700003020		! DRAM_REFRESH_FREQ_REG

		.xword	0x0000009700003038		! DRAM_REFRESH_COUNTER_REG
		.xword	0x0000009700003040		! DRAM_SCRUB_ENABLE_REG

		.xword	0x0000009700003080		! DRAM_TRRD_REG
		.xword	0x0000009700003088		! DRAM_TRC_REG
		.xword	0x0000009700003090		! DRAM_TRCD_REG
		.xword	0x0000009700003098		! DRAM_TWTR_REG
		.xword	0x00000097000030A0		! DRAM_TRTW_REG
		.xword	0x00000097000030A8		! DRAM_TRTP_REG
		.xword	0x00000097000030B0		! DRAM_TRAS_REG
		.xword	0x00000097000030B8		! DRAM_TRP_REG
		.xword	0x00000097000030C0		! DRAM_TWR_REG
		.xword	0x00000097000030C8		! DRAM_TRFC_REG
		.xword	0x00000097000030D0		! DRAM_TMRD_REG
		.xword	0x00000097000030E0		! DRAM_TIWTR_REG
		.xword	0x00000097000030E8		! DRAM_PRECHARGE_WAIT_REG
		.xword	0x0000009700003108		! DRAM_DIMM_STACK_REG
		.xword	0x0000009700003110		! DRAM_EXT_WR_MODE_REG 1
		.xword	0x0000009700003118		! DRAM_EXT_WR_MODE_REG 2
		.xword	0x0000009700003120		! DRAM_EXT_WR_MODE_REG 3
		.xword	0x0000009700003128		! DRAM_WAIR_CONTROL_REG
		.xword	0x0000009700003130		! DRAM_RANK1_PRESENT_REG
		.xword	0x0000009700003138		! DRAM_CHANNEL_DISABLED_REG
		.xword	0x0000009700003140		! DRAM_SEL_LO_ADDR_BITS_REG

		.xword	0x00000097000031A0		! DRAM_DIMM_INIT_REG
		.xword	0x00000097000031B0		! DRAM_SW_DV_COUNT_REG
		.xword	0x00000097000031B8		! DRAM_HW_DMUX_CLK_INV_REG
		.xword	0x00000097000031C0		! DRAM_PAD_EN_CLK_INV_REG

		.xword	0x0000009700003208		! DRAM_MODE_WRITE_STATUS_REG
		.xword	0x0000009700003210		! DRAM_INIT_STATUS_REG
		.xword	0x0000009700003218		! DRAM_DIMM_PRESENT_REG
		.xword	0x0000009700003220		! DRAM_FAILOVER_STATUS_REG
		.xword	0x0000009700003228		! DRAM_FAILOVER_MASK_REG

th2_address_table_end:	.xword	0,0			! end of table indicator


	
		!  Allways do store then load for this thread
	.align 64	
th3_address_table:
		.xword	0x0000008000004800		! JBUS Error Inject  (4800 ??)
		.xword	0x0000008000020000		! JPUS PERF reg
		.xword	0x0000008000020002		! JPUS PERF reg

th3_address_table_end:	.xword	0,0			! end of table indicator
			
