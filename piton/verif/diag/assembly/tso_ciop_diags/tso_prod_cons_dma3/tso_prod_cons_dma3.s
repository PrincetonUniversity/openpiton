// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tso_prod_cons_dma3.s
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
/***************************************************************************
***
***  Test Description : producer consumer with DMA. The thread is the producer
***
**********************************************************************/
#define JBI_CONFIG
#define ASI_SWVR_INTR_RECEIVE		0x72
#define ASI_SWVR_UDB_INTR_W		0x73
#define ASI_SWVR_UDB_INTR_R		0x74

#define H_T0_Trap_Instruction_0	
#define My_T0_Trap_Instruction_0	\
	ta	0x90;			\
	done;

#define H_HT0_HTrap_Instruction_0 intr0x190_custom_trap
#define H_HT0_Interrupt_0x60      intr0x60_custom_trap

#define spinlock_addr_reg  		%o0
#define database_addr_reg  		%i0
#define aliased_base_reg  		%o2
#define my_id_reg	  		%o3
#define test_reg	  		%o4
#define global_cnt_reg	  		%o5
#define tmp1	  			%l1
#define tmp2	  			%i1
#define tmp3	  			%i2

#include "boot.s"

.text
.global main
main:
	setx    database_address,   	tmp1, 	database_addr_reg	! data base address
	add 	database_addr_reg,  	0x40, 	spinlock_addr_reg
	setx 	aliased_area, 		tmp1, 	aliased_base_reg
	set	0x3,				global_cnt_reg


th_fork(th_main, %l0)

th_main_0:
	ta	0x30

        add     %g0, 0x0, my_id_reg
	add 	my_id_reg, 1, tmp2 
	ba	producer
	nop

th_main_1:
	ba	noise
	nop

th_main_2:
	ba	noise
	nop

th_main_3:
	ba	noise
	nop

th_main_4:
	ba	noise
	nop

th_main_5:
	ba	noise
	nop

th_main_6:
	ba	noise
	nop

th_main_7:

!====================================================================================
producer:
        ld    	[spinlock_addr_reg + my_id_reg], test_reg	! try to acquire lock
        tst     test_reg                       			! did we get it?
        bne     producer
	nop

	ld	[aliased_base_reg], tmp1		! kick out the line from L2 (if L2 and L1 direct mapped)
	mov	0x1, tmp1				! prepare flag ready
	st 	tmp2, [database_addr_reg + my_id_reg] 	! store data
        st      tmp1, [spinlock_addr_reg + my_id_reg]   ! store flag ready
	inc	tmp2
	deccc	global_cnt_reg
        be	good_end
	nop

	ld 	[spinlock_addr_reg + my_id_reg], tmp3  		! load the line
wait_for_zero:
	prefetch	[spinlock_addr_reg + my_id_reg], 0x0 
	brnz	tmp3, wait_for_zero
	ld 	[spinlock_addr_reg + my_id_reg], tmp3  		! load the line

	ba	producer
	nop

!====================================================================================

noise:
	ld 	[database_addr_reg + 0x100], tmp3  		! load the line
	ba	noise
	ld      [aliased_base_reg  + 0x100], tmp1               ! kick out the line from L2 (if L2 direct mapped)

good_end:
        ta      T_GOOD_TRAP
bad_end:
        ta      T_BAD_TRAP

user_text_end:

/***********************************************************************
   Test case data start
 ***********************************************************************/
.data
user_data_start:
	.skip 1000
user_data_end:

SECTION .MY_HYP_SEC TEXT_VA = 0x1100150000, DATA_VA = 0x1100160000
attr_text {
        Name=.MY_HYP_SEC,
        hypervisor
	}

.global intr0x60_custom_trap
intr0x60_custom_trap:
	ldxa	[%g0] ASI_SWVR_INTR_RECEIVE, %g2;
	ldxa	[%g0] ASI_SWVR_UDB_INTR_R, %g1;	
	retry;

.global intr0x190_custom_trap
intr0x190_custom_trap:
/***********************************************************************
 IOSYNC cycles to start sjm
 ***********************************************************************/

setx 0xdeadbeefdeadbeef, %g1, %g2
setx 0xcf00beef00, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0xdeadbeefdeadbeef, %g1, %g2
setx 0xef00beef00, %g1, %g3
stx %g2, [%g3]
!=====================
done;

attr_data {
        Name=.MY_HYP_SEC,
        hypervisor
	}

.global my_hyp_data
.align 0x40
my_hyp_data:
	.skip 0x200

.end


SECTION .MY_DATA0  DATA_VA=0xd0100000
attr_data {
        Name = .MY_DATA0,
        VA= 0x0d0100000
        RA= 0x1d0100000
        PA= ra2pa(0x1d0100000,0),
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

	.data

.global database_address
.align 0x100
database_address:
	.skip 0x40
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.word 0x0
	.skip 1000

SECTION .MY_DATA1  DATA_VA=0xd1110000
attr_data {
        Name = .MY_DATA1,
        VA= 0x0d1110000,
        RA= 0x1d1110000,
        PA= ra2pa(0x1d1110000,0),
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

	.data
.global aliased_area
.align 0x100
aliased_area:
	.word	0xbeef
	.skip 0x1000
	.word	0xbeef
	
.end
