// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tsotool_diag10_061003.s
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
! no tsotool postprocessing
! TSOTOOL.PROCESSOR niagara.rtl
! TSOTOOL.MODE GEN
! TSOTOOL.READ_EGI 
! TSOTOOL.WRITE_EGI diag.egi
! TSOTOOL.N_PROCS 8
! TSOTOOL.TEST_NAME diag
! TSOTOOL.BATCH Y
! TSOTOOL.VERBOSE Y
! GEN.N_INSTR_PER_PROC 500
! GEN.AVG_LOOP_SIZE 512
! GEN.AVG_LOOP_ITER 10
! GEN.SEED 29
! ADMAP.REGION_SIZE 64
! ADMAP.REGION_OFFSETS 0-4-12-32-64,76-80-84-256-512,32-64,0-64-128-192
! ADMAP.ATTRIBUTES CV=0111,CP=1111 
! ADMAP.N_ALIASES 0
! ADMAP.ALIAS_FREQUENCY 64
! ADMAP.ALIAS_OFFSET 8388608
! WT.PCT_FP_INSTR 10
! WT.PCT_LITTLE_ENDIAN 5
! WT.PCT_LOADS_NF 0
! WT.PCT_NFS_FAULT 0
! WT.PCT_PREFETCH_FAULT 0
! WT.PCT_PREFETCH_UNIMP 0
! WT.PCT_CBRANCH 5
! WT.PCT_SECONDARY_CTX 0
! WT.PCT_NUCLEUS_CTX 0
! WT.REPLACEMENT 10
! WT.INTERRUPT 0
! WT.LD 10
! WT.BLD 100
! WT.DWLD 10
! WT.QWLD 0
! WT.AQLD 0
! WT.ST 10
! WT.BST 100
! WT.BSTC 0
! WT.DWST 10
! WT.QWST 0
! WT.SWAP 3
! WT.CAS 5
! WT.CASX 5
! WT.ASI_L2_FLUSH 0
! WT.FLUSHI 0
! WT.MEMBAR 5
! WT.PREFETCH 100
! WT.NOP 1
! DBG.WRITE_RESULTS_FILE Y
! ADV.L2_WAYS 4
! ADV.TEST_ITERATIONS 1
! ADV.RESULTS_TO_MEM N
! ADV.BST_MEMBARS Y
! ADV.BLD_MEMBARS Y
! ADV.PREFETCH_FCNS fcn_1=5 
! ADV.SAME_TEST_ALL_CPUS N
! ADV.ANALYSIS_EFFORT max
! ADV.ONLINE_PASSES 10


#define N_CPUS  8
#define REGION_SIZE_RTL (64 * 1024)
!====#define RESULTS_BUF_SIZE_PER_CPU_RTL 1048576
#define RESULTS_BUF_SIZE_PER_CPU_RTL 1024
#define PRIVATE_DATA_AREA_PER_CPU_RTL 64

#define ALIGN_PAGE_8K .align 8192
#define ALIGN_PAGE_512K .align 524288
#define ALIGN_PAGE_4M .align 4194304
#define ENABLE_T0_Fp_exception_ieee_754_0x21
#define ENABLE_T0_Fp_exception_other_0x22
#define ENABLE_T0_Fp_disabled_0x20
#define ENABLE_T0_Illegal_instruction_0x10
#define ENABLE_T0_Clean_Window_0x24
#include "custom_page1.h"

#define B_TRAP T_BAD_TRAP
#define G_TRAP T_GOOD_TRAP

define(EXIT_GOOD, `ta G_TRAP')
define(EXIT_BAD, `ta B_TRAP')

define(CHECK_PROC_ID,`
check_cpu_id: 

	wr	%g0, 0x4, %fprs         /* make sure fef is 1 */
	mov 	THREAD_STRIDE, %l2
	th_fork(thread,%l0)

thread_0:
	mov 	0, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
	
thread_1:
	mov 	1, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_2:
	mov 	2, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_3:
	mov 	3, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_4:
	mov 	4, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_5:
	mov 	5, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_6:
	mov 	6, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_7:
	mov 	7, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_8:
	mov 	8, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_9:
	mov 	9, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_10:
	mov 	10, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_11:
	mov 	11, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_12:
	mov 	12, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_13:
	mov 	13, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_14:
	mov 	14, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_15:
	mov 	15, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_16:
	mov 	16, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_17:
	mov 	17, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_18:
	mov 	18, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_19:
	mov 	19, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_20:
	mov 	20, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_21:
	mov 	21, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_22:
	mov 	22, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_23:
	mov 	23, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_24:
	mov 	24, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_25:
	mov 	25, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_26:
	mov 	26, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
	
thread_27:
	mov 	27, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_28:
	mov 	28, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_29:
	mov 	29, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_30:
	mov 	30, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_31:
	mov 	31, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop

entry_point:
	
')
define(EN_INTERRUPTS,`
rdpr    %pstate, $1
or      $1, 0x002, $1
wrpr    $1, %pstate
')

define(DIS_INTERRUPTS,`
rdpr    %pstate, $1
and     $1, 0xffd, $1
wrpr    $1, %pstate       ! set PSTATE.IE
')

define(CHECK_DISPATCH_STATUS,`
mov $1, $3
mulx $3, 2, $3
mov 3, $4
sllx $4, $3, $4
ldxa [%g0]ASI_INTR_DISPATCH_STATUS, $3
and $3, $4, $3
cmp %g0, $3
bne $2
')

define(CHECK_RECEIVE_STATUS,`
ldxa [%g0]ASI_INTR_RECEIVE, $1
cmp %g0, $1
tne BAD_TRAP
')

define(WRITE_INTR_DATA_REGS,`
setx $1, $2, $3
add %g0, ASI_INTR_DATA0_W_VAL, $2
stxa $3, [$2]ASI_INTR_DATA0_W
setx $1, $2, $3
add %g0, ASI_INTR_DATA1_W_VAL, $2
stxa $3, [$2]ASI_INTR_DATA1_W
setx $1, $2, $3
add %g0, ASI_INTR_DATA2_W_VAL, $2
stxa $3, [$2]ASI_INTR_DATA2_W
setx $1, $2, $3
add %g0, ASI_INTR_DATA3_W_VAL, $2
stxa $3, [$2]ASI_INTR_DATA3_W
setx $1, $2, $3
add %g0, ASI_INTR_DATA4_W_VAL, $2
stxa $3, [$2]ASI_INTR_DATA4_W
setx $1, $2, $3
add %g0, ASI_INTR_DATA5_W_VAL, $2
stxa $3, [$2]ASI_INTR_DATA5_W
setx $1, $2, $3
add %g0, ASI_INTR_DATA6_W_VAL, $2
stxa $3, [$2]ASI_INTR_DATA6_W
setx $1, $2, $3
add %g0, ASI_INTR_DATA7_W_VAL, $2
stxa $3, [$2]ASI_INTR_DATA7_W
membar #Sync
')

define(INTR_SET_DISPATCH_VECTOR,`
or      %g0,$1,$4
sllx    $4, 29, $4      ! SID
mov     $4, $5
or      %g0,$2,$4
sllx    $4, 24, $4      ! BN pair
or      $5,$4,$5
or      %g0,$3,$4
sllx    $4, 14, $4      ! MID
or      $5,$4,$5
or      $5,0x70,$5      ! VA[13:0] = 0x70
')

define(DSPCH_INTERRUPT,`
stxa    %g0, [$1]ASI_INTR_DISPATCH_W
membar #Sync
')

.seg "text"
ALIGN_PAGE_8K
local_trap_handlers_start:

.align 64
extern_interrupt_handler:
stxa  %g0, [%g0]ASI_INTR_RECEIVE
retry

local_trap_handlers_end:


!------------------------------------------------------------------------

.seg "data"
ALIGN_PAGE_512K
tsotool_unshared_data_start:
stack_top_p0:
	.skip 2048
stack_top_p1:
	.skip 2048
stack_top_p2:
	.skip 2048
stack_top_p3:
	.skip 2048
stack_top_p4:
	.skip 2048
stack_top_p5:
	.skip 2048
stack_top_p6:
	.skip 2048
stack_top_p7:
	.skip 2048
!-- label names of res_buf must match with extract_loads_m64.pl --
.align 64 ! for self bcopy()
res_buf_fp_p_0:
	.skip RESULTS_BUF_SIZE_PER_CPU_RTL/2
res_buf_int_p_0:
	.skip RESULTS_BUF_SIZE_PER_CPU_RTL/2
.align 64 ! for self bcopy()
res_buf_fp_p_1:
	.skip RESULTS_BUF_SIZE_PER_CPU_RTL/2
res_buf_int_p_1:
	.skip RESULTS_BUF_SIZE_PER_CPU_RTL/2
.align 64 ! for self bcopy()
res_buf_fp_p_2:
	.skip RESULTS_BUF_SIZE_PER_CPU_RTL/2
res_buf_int_p_2:
	.skip RESULTS_BUF_SIZE_PER_CPU_RTL/2
.align 64 ! for self bcopy()
res_buf_fp_p_3:
	.skip RESULTS_BUF_SIZE_PER_CPU_RTL/2
res_buf_int_p_3:
	.skip RESULTS_BUF_SIZE_PER_CPU_RTL/2
.align 64 ! for self bcopy()
res_buf_fp_p_4:
	.skip RESULTS_BUF_SIZE_PER_CPU_RTL/2
res_buf_int_p_4:
	.skip RESULTS_BUF_SIZE_PER_CPU_RTL/2
.align 64 ! for self bcopy()
res_buf_fp_p_5:
	.skip RESULTS_BUF_SIZE_PER_CPU_RTL/2
res_buf_int_p_5:
	.skip RESULTS_BUF_SIZE_PER_CPU_RTL/2
.align 64 ! for self bcopy()
res_buf_fp_p_6:
	.skip RESULTS_BUF_SIZE_PER_CPU_RTL/2
res_buf_int_p_6:
	.skip RESULTS_BUF_SIZE_PER_CPU_RTL/2
.align 64 ! for self bcopy()
res_buf_fp_p_7:
	.skip RESULTS_BUF_SIZE_PER_CPU_RTL/2
res_buf_int_p_7:
	.skip RESULTS_BUF_SIZE_PER_CPU_RTL/2
private_data_p0:
	.skip PRIVATE_DATA_AREA_PER_CPU_RTL
private_data_p1:
	.skip PRIVATE_DATA_AREA_PER_CPU_RTL
private_data_p2:
	.skip PRIVATE_DATA_AREA_PER_CPU_RTL
private_data_p3:
	.skip PRIVATE_DATA_AREA_PER_CPU_RTL
private_data_p4:
	.skip PRIVATE_DATA_AREA_PER_CPU_RTL
private_data_p5:
	.skip PRIVATE_DATA_AREA_PER_CPU_RTL
private_data_p6:
	.skip PRIVATE_DATA_AREA_PER_CPU_RTL
private_data_p7:
	.skip PRIVATE_DATA_AREA_PER_CPU_RTL
tsotool_unshared_data_end:

!------------------------------------------------------------------------

.seg "data"
! 4 shared memory regions, 0 alias(es) each (Alias 0 is normal VA)

ALIGN_PAGE_8K
REGION0_ALIAS0_START:
	.skip REGION_SIZE_RTL
REGION0_ALIAS0_END:

ALIGN_PAGE_8K
REGION1_ALIAS0_START:
	.skip REGION_SIZE_RTL
REGION1_ALIAS0_END:

ALIGN_PAGE_8K
REGION2_ALIAS0_START:
	.skip REGION_SIZE_RTL
REGION2_ALIAS0_END:

ALIGN_PAGE_8K
REGION3_ALIAS0_START:
	.skip REGION_SIZE_RTL
REGION3_ALIAS0_END:

ALIGN_PAGE_8K
REPLACEMENT_ALIAS0_START:
	.skip 4 * REGION_SIZE_RTL	 ! replacement area
REPLACEMENT_ALIAS0_END:

.global main
.seg "text"
ALIGN_PAGE_8K
user_text_start:
main:
	mov     0, %o0
	mov     0, %o1
	CHECK_PROC_ID
! at this point, g1 should have CPU id (0, 1, 2, ...)
	set     REGION0_ALIAS0_START, %o0	! shared address 0
	set     REGION1_ALIAS0_START, %o1	! shared address 1
	set     REGION2_ALIAS0_START, %o2	! shared address 2
	set     REGION3_ALIAS0_START, %o3	! shared address 3
	cmp     %g1, 0x7
	be      setup_p7
	nop
	cmp     %g1, 0x6
	be      setup_p6
	nop
	cmp     %g1, 0x5
	be      setup_p5
	nop
	cmp     %g1, 0x4
	be      setup_p4
	nop
	cmp     %g1, 0x3
	be      setup_p3
	nop
	cmp     %g1, 0x2
	be      setup_p2
	nop
	cmp     %g1, 0x1
	be      setup_p1
	nop
	cmp     %g1, 0x0
	be      setup_p0
	nop
	EXIT_BAD   ! Should never reach here
	nop

setup_p0:
	set     stack_top_p0, %l1
	add     %l1, 1024, %sp

! Setup primary and secondary context registers

! Primary/Secondary context must be initialized before doing any shared access!
	mov     ASI_PRIMARY_CONTEXT_REG_VAL, %l0
	mov     4, %l1
!==== taken out... : 	stxa    %l1, [%l0]ASI_PRIMARY_CONTEXT_REG
	membar #Sync
	mov     ASI_SECONDARY_CONTEXT_REG_VAL, %l0
	mov     5, %l1
!==== taken out... : 	stxa    %l1, [%l0]ASI_SECONDARY_CONTEXT_REG
	membar #Sync
	set     res_buf_fp_p_0, %o4
	set     private_data_p0, %o5
	set     func0, %l4
	call    %l4
	nop
	EXIT_GOOD
	nop

setup_p1:
	set     stack_top_p1, %l1
	add     %l1, 1024, %sp

! Setup primary and secondary context registers

! Primary/Secondary context must be initialized before doing any shared access!
	mov     ASI_PRIMARY_CONTEXT_REG_VAL, %l0
	mov     8, %l1
!==== taken out... : 	stxa    %l1, [%l0]ASI_PRIMARY_CONTEXT_REG
	membar #Sync
	mov     ASI_SECONDARY_CONTEXT_REG_VAL, %l0
	mov     9, %l1
!==== taken out... : 	stxa    %l1, [%l0]ASI_SECONDARY_CONTEXT_REG
	membar #Sync
	set     res_buf_fp_p_1, %o4
	set     private_data_p1, %o5
	set     func1, %l4
	call    %l4
	nop
	EXIT_GOOD
	nop

setup_p2:
	set     stack_top_p2, %l1
	add     %l1, 1024, %sp

! Setup primary and secondary context registers

! Primary/Secondary context must be initialized before doing any shared access!
	mov     ASI_PRIMARY_CONTEXT_REG_VAL, %l0
	mov     12, %l1
!==== taken out... : 	stxa    %l1, [%l0]ASI_PRIMARY_CONTEXT_REG
	membar #Sync
	mov     ASI_SECONDARY_CONTEXT_REG_VAL, %l0
	mov     13, %l1
!==== taken out... : 	stxa    %l1, [%l0]ASI_SECONDARY_CONTEXT_REG
	membar #Sync
	set     res_buf_fp_p_2, %o4
	set     private_data_p2, %o5
	set     func2, %l4
	call    %l4
	nop
	EXIT_GOOD
	nop

setup_p3:
	set     stack_top_p3, %l1
	add     %l1, 1024, %sp

! Setup primary and secondary context registers

! Primary/Secondary context must be initialized before doing any shared access!
	mov     ASI_PRIMARY_CONTEXT_REG_VAL, %l0
	mov     16, %l1
!==== taken out... : 	stxa    %l1, [%l0]ASI_PRIMARY_CONTEXT_REG
	membar #Sync
	mov     ASI_SECONDARY_CONTEXT_REG_VAL, %l0
	mov     17, %l1
!==== taken out... : 	stxa    %l1, [%l0]ASI_SECONDARY_CONTEXT_REG
	membar #Sync
	set     res_buf_fp_p_3, %o4
	set     private_data_p3, %o5
	set     func3, %l4
	call    %l4
	nop
	EXIT_GOOD
	nop

setup_p4:
	set     stack_top_p4, %l1
	add     %l1, 1024, %sp

! Setup primary and secondary context registers

! Primary/Secondary context must be initialized before doing any shared access!
	mov     ASI_PRIMARY_CONTEXT_REG_VAL, %l0
	mov     20, %l1
!==== taken out... : 	stxa    %l1, [%l0]ASI_PRIMARY_CONTEXT_REG
	membar #Sync
	mov     ASI_SECONDARY_CONTEXT_REG_VAL, %l0
	mov     21, %l1
!==== taken out... : 	stxa    %l1, [%l0]ASI_SECONDARY_CONTEXT_REG
	membar #Sync
	set     res_buf_fp_p_4, %o4
	set     private_data_p4, %o5
	set     func4, %l4
	call    %l4
	nop
	EXIT_GOOD
	nop

setup_p5:
	set     stack_top_p5, %l1
	add     %l1, 1024, %sp

! Setup primary and secondary context registers

! Primary/Secondary context must be initialized before doing any shared access!
	mov     ASI_PRIMARY_CONTEXT_REG_VAL, %l0
	mov     24, %l1
!==== taken out... : 	stxa    %l1, [%l0]ASI_PRIMARY_CONTEXT_REG
	membar #Sync
	mov     ASI_SECONDARY_CONTEXT_REG_VAL, %l0
	mov     25, %l1
!==== taken out... : 	stxa    %l1, [%l0]ASI_SECONDARY_CONTEXT_REG
	membar #Sync
	set     res_buf_fp_p_5, %o4
	set     private_data_p5, %o5
	set     func5, %l4
	call    %l4
	nop
	EXIT_GOOD
	nop

setup_p6:
	set     stack_top_p6, %l1
	add     %l1, 1024, %sp

! Setup primary and secondary context registers

! Primary/Secondary context must be initialized before doing any shared access!
	mov     ASI_PRIMARY_CONTEXT_REG_VAL, %l0
	mov     28, %l1
!==== taken out... : 	stxa    %l1, [%l0]ASI_PRIMARY_CONTEXT_REG
	membar #Sync
	mov     ASI_SECONDARY_CONTEXT_REG_VAL, %l0
	mov     29, %l1
!==== taken out... : 	stxa    %l1, [%l0]ASI_SECONDARY_CONTEXT_REG
	membar #Sync
	set     res_buf_fp_p_6, %o4
	set     private_data_p6, %o5
	set     func6, %l4
	call    %l4
	nop
	EXIT_GOOD
	nop

setup_p7:
	set     stack_top_p7, %l1
	add     %l1, 1024, %sp

! Setup primary and secondary context registers

! Primary/Secondary context must be initialized before doing any shared access!
	mov     ASI_PRIMARY_CONTEXT_REG_VAL, %l0
	mov     32, %l1
!==== taken out... : 	stxa    %l1, [%l0]ASI_PRIMARY_CONTEXT_REG
	membar #Sync
	mov     ASI_SECONDARY_CONTEXT_REG_VAL, %l0
	mov     33, %l1
!==== taken out... : 	stxa    %l1, [%l0]ASI_SECONDARY_CONTEXT_REG
	membar #Sync
	set     res_buf_fp_p_7, %o4
	set     private_data_p7, %o5
	set     func7, %l4
	call    %l4
	nop
	EXIT_GOOD
	nop
!-----------------

! register usage:
! %i0 %i1 %i2 %i3 : base registers for 4 regions
! %i4 fixed pointer to per-cpu results area
! %l1 moving pointer to per-cpu FP results area
! %o7 moving pointer to per-cpu integer results area
! %i5 pointer to per-cpu private area
! %l0 holds lfsr, used as source of random bits 
! %l2 loop count register
! %f16 running counter for unique fp store values
! %f17 holds increment value for fp counter
! %l4 running counter for unique integer store values (increment value is always 1)
! %l5 move-to register for load values (simulation only)
! %f30 move-to register for FP values (simulation only)
! %l3 %l6 %l7 %o5 : 4 temporary registers
! %o0 %o1 %o2 %o3 %o4 : 5 integer results buffer registers
! %f0-f15 FP results buffer registers
! %f32-f47 FP block load/store registers

func0:
! 500 (dynamic) instruction sequence begins
save   %sp, -192, %sp

! Force %i0-%i3 to be 64-byte aligned
add %i0, 63, %i0
andn %i0, 63, %i0

add %i1, 63, %i1
andn %i1, 63, %i1

add %i2, 63, %i2
andn %i2, 63, %i2

add %i3, 63, %i3
andn %i3, 63, %i3

add %i4, 63, %i4
andn %i4, 63, %i4

add %i5, 63, %i5
andn %i5, 63, %i5


! Initialize pointer to FP load results area
mov   %i4, %l1

! Initialize pointer to integer load results area
sethi %hi(0x80000), %o7
or    %o7, %lo(0x80000), %o7
add  %o7, %l1, %o7 

! Initialize %f0-%f62 to 0xdeadbee0deadbee1
sethi %hi(0xdeadbee0), %l6
or    %l6, %lo(0xdeadbee0), %l6
stw   %l6, [%i5]
sethi %hi(0xdeadbee1), %l6
or    %l6, %lo(0xdeadbee1), %l6
stw   %l6, [%i5+4]
ldd [%i5], %f0
fmovd %f0, %f2
fmovd %f0, %f4
fmovd %f0, %f6
fmovd %f0, %f8
fmovd %f0, %f10
fmovd %f0, %f12
fmovd %f0, %f14
fmovd %f0, %f16
fmovd %f0, %f18
fmovd %f0, %f20
fmovd %f0, %f22
fmovd %f0, %f24
fmovd %f0, %f26
fmovd %f0, %f28
fmovd %f0, %f30
fmovd %f0, %f32
fmovd %f0, %f34
fmovd %f0, %f36
fmovd %f0, %f38
fmovd %f0, %f40
fmovd %f0, %f42
fmovd %f0, %f44
fmovd %f0, %f46
fmovd %f0, %f48
fmovd %f0, %f50
fmovd %f0, %f52
fmovd %f0, %f54
fmovd %f0, %f56
fmovd %f0, %f58
fmovd %f0, %f60
fmovd %f0, %f62

! Signature for extract_loads script to start extracting load values for this stream
sethi %hi(0x00deade1), %l6
or    %l6, %lo(0x00deade1), %l6
stw %l6, [%i5] 
ld [%i5], %f16

! Initialize running integer counter in register %l4
sethi %hi(0x1), %l4
or    %l4, %lo(0x1), %l4

! Initialize running FP counter in register %f16
sethi %hi(0x3f800001), %l6
or    %l6, %lo(0x3f800001), %l6
stw %l6, [%i5] 
ld [%i5], %f16

! Initialize FP counter increment value in register %f17 (constant)
sethi %hi(0x34000000), %l6
or    %l6, %lo(0x34000000), %l6
stw %l6, [%i5] 
ld [%i5], %f17 

! Initialize LFSR to 0x5407^4
sethi %hi(0x5407), %l0
or    %l0, %lo(0x5407), %l0
mulx  %l0, %l0, %l0
mulx  %l0, %l0, %l0

!-- init shared addrs 0 to 1 ---
stx %g0, [%i0+0]

! use untouched cache-line (offset 4K) in replacement area for sync
sub %i1, %i0, %l7
add %i3, %l7, %l7
sub %l7, -4096, %l7

!-- master of sync_init ---
or %g0, 7, %o5
swap [%l7], %o5
sync_init_0:
swap [%l7+4], %g0
lduw [%l7], %o5
brnz,pt %o5, sync_init_0
membar #Sync ! delay slot
!-- end of sync_init ---


BEGIN_NODES0: ! Test istream for CPU 0 begins

P1: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f0
membar #Sync 
! 1 addresses covered

P2: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P3: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P4: !ST [3] (maybe <- 0x1) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P5: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f36, %f2

P6: !BST [2] (maybe <- 0x3f800001) (FP) (Branch target of P60)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 
ba P7
nop

TARGET60:
ba RET60
nop


P7: !BST [14] (maybe <- 0x3f800005) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P8: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P9: !BLD [1] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f4
fmovd %f34, %f18
fmovs %f19, %f6
fmovd %f40, %f18
fmovs %f18, %f7

P10: !DWST [0] (maybe <- 0x2) (Int)
sllx %l4, 32, %l7 
add   %l4, 1, %l4
or %l7, %l4, %l7
stx %l7, [%i0 + 0]
add   %l4, 1, %l4

P11: !BST [0] (maybe <- 0x3f800006) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P12: !BST [2] (maybe <- 0x3f80000a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P13: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P14: !BLD [14] (FP) (Branch target of P74)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9
ba P15
nop

TARGET74:
ba RET74
nop


P15: !BLD [0] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f10
fmovd %f34, %f18
fmovs %f19, %f12
fmovd %f40, %f18
fmovs %f18, %f13

P16: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P17: !DWLD [13] (Int)
ldx [%i3 + 64], %o0
! move %o0(upper) -> %o0(upper)

P18: !BST [4] (maybe <- 0x3f80000e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P19: !BST [11] (maybe <- 0x3f80000f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P20: !DWST [9] (maybe <- 0x4) (Int)
mov %l4, %o5 
sllx %o5, 32, %o5 
stx %o5, [%i1 + 512 ] 
add   %l4, 1, %l4

P21: !BST [0] (maybe <- 0x3f800010) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P22: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P23: !BST [8] (maybe <- 0x3f800014) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P24: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P25: !DWLD [0] (Int)
ldx [%i0 + 0], %l6
! move %l6(upper) -> %o0(lower)
srlx %o0, 32, %o0
sllx %o0, 32, %o0
srlx %l6, 32, %l3
or %l3, %o0, %o0
! move %l6(lower) -> %o1(upper)
sllx %l6, 32, %o1

P26: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P27: !BLD [6] (FP) (Branch target of P457)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
fmovd %f36, %f0
ba P28
nop

TARGET457:
ba RET457
nop


P28: !BST [10] (maybe <- 0x3f800015) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P29: !DWLD [3] (Int)
ldx [%i0 + 32], %l7
! move %l7(upper) -> %o1(lower)
srlx %l7, 32, %l6
or %l6, %o1, %o1

P30: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P31: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P32: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P33: !PREFETCH [14] (Int) (Branch target of P183)
prefetch [%i3 + 128], 1
ba P34
nop

TARGET183:
ba RET183
nop


P34: !BLD [0] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f4
fmovd %f34, %f18
fmovs %f19, %f6
fmovd %f40, %f18
fmovs %f18, %f7

P35: !BST [13] (maybe <- 0x3f800016) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P36: !BST [13] (maybe <- 0x3f800017) (FP) (Branch target of P499)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 
ba P37
nop

TARGET499:
ba RET499
nop


P37: !BST [7] (maybe <- 0x3f800018) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P38: !BST [11] (maybe <- 0x3f80001b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P39: !BST [1] (maybe <- 0x3f80001c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P40: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P41: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f8

P42: !BST [15] (maybe <- 0x3f800020) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P43: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P44: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P45: !REPLACEMENT [7] (Int)
sethi %hi(0x54), %l6
or %l6, %lo(0x54),  %l6
sethi %hi(0x10000), %l7
or %l7, %lo(0x10000),  %l7
add %i3, %l6, %l6
add %l6, %l7, %l6
ld [%l6], %o5
st %o5, [%l6]
add %l6, %l7, %l6
ld [%l6], %o5
st %o5, [%l6]
add %l6, %l7, %l6
ld [%l6], %o5
st %o5, [%l6]
add %l6, %l7, %l6
ld [%l6], %o5
st %o5, [%l6]

P46: !BLD [0] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9
fmovs %f19, %f10
fmovd %f34, %f18
fmovs %f19, %f11
fmovd %f40, %f12

P47: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P48: !BLD [2] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f14
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
fmovd %f34, %f18
fmovs %f19, %f0
fmovd %f40, %f18
fmovs %f18, %f1

P49: !DWST [2] (maybe <- 0x5) (Int)
mov %l4, %l3 
stx %l3, [%i0 + 8]
add   %l4, 1, %l4

P50: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P51: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f2
fmovd %f36, %f18
fmovs %f18, %f3
fmovs %f19, %f4

P52: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P53: !LD [1] (Int) (LE)
wr %g0, 0x88, %asi
lduwa [%i0 + 4] %asi, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P54: !BST [9] (maybe <- 0x3f800021) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P55: !BLD [7] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f5
fmovd %f36, %f6

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET55
nop
RET55:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P56: !BST [0] (maybe <- 0x3f800022) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P57: !BST [4] (maybe <- 0x3f800026) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P58: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P59: !BST [9] (maybe <- 0x3f800027) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P60: !BST [1] (maybe <- 0x3f800028) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET60
nop
RET60:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P61: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f9
fmovd %f36, %f10

P62: !REPLACEMENT [5] (Int)
sethi %hi(0x4c), %l7
or %l7, %lo(0x4c),  %l7
sethi %hi(0x10000), %o5
or %o5, %lo(0x10000),  %o5
add %i3, %l7, %l7
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]

P63: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P64: !ST [11] (maybe <- 0x6) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P65: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P66: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P67: !BST [15] (maybe <- 0x3f80002c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P68: !BLD [2] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f12
fmovd %f34, %f18
fmovs %f19, %f14
fmovd %f40, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30

P69: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f0
membar #Sync 
! 1 addresses covered

P70: !DWLD [0] (Int)
ldx [%i0 + 0], %l3
! move %l3(upper) -> %o2(lower)
srlx %l3, 32, %o5
or %o5, %o2, %o2
! move %l3(lower) -> %o3(upper)
sllx %l3, 32, %o3

P71: !BST [10] (maybe <- 0x3f80002d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P72: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P73: !SWAP [9] (maybe <- 0x7) (Int)
mov %l4, %l7
swap  [%i1 + 512], %l7
! move %l7(lower) -> %o3(lower)
srl %l7, 0, %l3
or %l3, %o3, %o3
add   %l4, 1, %l4

P74: !PREFETCH [6] (Int) (CBR)
prefetch [%i1 + 80], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET74
nop
RET74:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P75: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P76: !BST [1] (maybe <- 0x3f80002e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P77: !BST [12] (maybe <- 0x3f800032) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P78: !BLD [0] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1
fmovs %f19, %f2
fmovd %f34, %f18
fmovs %f19, %f3
fmovd %f40, %f4

P79: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P80: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P81: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P82: !DWST [4] (maybe <- 0x8) (Int)
mov %l4, %l7 
sllx %l7, 32, %l7 
stx %l7, [%i0 + 64 ] 
add   %l4, 1, %l4

P83: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P84: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P85: !BLD [3] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f6
fmovd %f34, %f18
fmovs %f19, %f8
fmovd %f40, %f18
fmovs %f18, %f9

P86: !BST [8] (maybe <- 0x3f800033) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P87: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P88: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f10
fmovd %f36, %f18
fmovs %f18, %f11
fmovs %f19, %f12

P89: !CASX [12] (maybe <- 0x9) (Int)
add %i3, 0, %l6
ldx [%l6], %o4
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5
mov  %o4, %l3
sllx %l4, 32, %o0
casx [%l6], %l3, %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
add  %l4, 1, %l4

P90: !PREFETCH [12] (Int) (Branch target of P510)
prefetch [%i3 + 0], 1
ba P91
nop

TARGET510:
ba RET510
nop


P91: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f13

P92: !DWST [9] (maybe <- 0xa) (Int) (Branch target of P441)
mov %l4, %l3 
sllx %l3, 32, %l3 
stx %l3, [%i1 + 512 ] 
add   %l4, 1, %l4
ba P93
nop

TARGET441:
ba RET441
nop


P93: !BST [4] (maybe <- 0x3f800034) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P94: !ST [2] (maybe <- 0xb) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P95: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f14

P96: !DWST [0] (maybe <- 0xc) (Int)
sllx %l4, 32, %l6 
add   %l4, 1, %l4
or %l6, %l4, %l6
stx %l6, [%i0 + 0]
add   %l4, 1, %l4

P97: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P98: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P99: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30

P100: !BST [9] (maybe <- 0x3f800035) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P101: !BLD [5] (FP) (Branch target of P479)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f0
membar #Sync 
! 3 addresses covered
fmovs %f3, %f0
fmovs %f4, %f1
fmovs %f5, %f2
ba P102
nop

TARGET479:
ba RET479
nop


P102: !BST [11] (maybe <- 0x3f800036) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P103: !ST [5] (maybe <- 0xe) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P104: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P105: !BST [3] (maybe <- 0x3f800037) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P106: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P107: !BST [7] (maybe <- 0x3f80003b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P108: !BST [15] (maybe <- 0x3f80003e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P109: !BLD [7] (FP) (CBR) (Branch target of P436)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f5
fmovd %f36, %f6

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET109
nop
RET109:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0

ba P110
nop

TARGET436:
ba RET436
nop


P110: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P111: !BST [3] (maybe <- 0x3f80003f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P112: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P113: !PREFETCH [1] (Int) (CBR)
prefetch [%i0 + 4], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET113
nop
RET113:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P114: !CAS [1] (maybe <- 0xf) (Int)
add %i0, 4, %l3
lduw [%l3], %o1
mov %o1, %o5
! move %o5(lower) -> %o1(upper)
sllx %o5, 32, %o1
mov %l4, %l7
cas [%l3], %o5, %l7
! move %l7(lower) -> %o1(lower)
srl %l7, 0, %l3
or %l3, %o1, %o1
add   %l4, 1, %l4

P115: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P116: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P117: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P118: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P119: !BST [4] (maybe <- 0x3f800043) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P120: !BST [9] (maybe <- 0x3f800044) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P121: !BST [7] (maybe <- 0x3f800045) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P122: !SWAP [2] (maybe <- 0x10) (Int) (Branch target of P480)
mov %l4, %o2
swap  [%i0 + 12], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4
ba P123
nop

TARGET480:
ba RET480
nop


P123: !DWST [7] (maybe <- 0x11) (Int) (LE)
wr %g0, 0x88, %asi
sllx %l4, 32, %o5
add   %l4, 1, %l4
or %o5, %l4, %l3
! Change double-word-level endianess (big endian <-> little endian) 
sethi %hi(0xff00ff00), %l6
or %l6, %lo(0xff00ff00), %l6
sllx %l6, 32, %o5
or %l6, %o5, %l6 
and %l3, %l6, %o5
srlx %o5, 8, %o5
sllx %l3, 8, %l3
and %l3, %l6, %l3
or %l3, %o5, %l3 
sethi %hi(0xffff0000), %l6
or %l6, %lo(0xffff0000), %l6
srlx %l3, 16, %o5
andn %o5, %l6, %o5
andn %l3, %l6, %l3
sllx %l3, 16, %l3
or %l3, %o5, %l3 
srlx %l3, 32, %o5
sllx %l3, 32, %l3
or %l3, %o5, %o5 
stxa %o5, [%i1 + 80 ] %asi
add   %l4, 1, %l4

P124: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P125: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P126: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f12
fmovd %f36, %f18
fmovs %f18, %f13
fmovs %f19, %f14

P127: !BST [3] (maybe <- 0x3f800048) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P128: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P129: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30

P130: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P131: !BST [5] (maybe <- 0x3f80004c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P132: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f0
membar #Sync 
! 1 addresses covered

P133: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P134: !BST [2] (maybe <- 0x3f80004f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P135: !BLD [9] (FP) (Branch target of P237)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2
ba P136
nop

TARGET237:
ba RET237
nop


P136: !DWST [10] (maybe <- 0x13) (Int)
mov %l4, %o5 
sllx %o5, 32, %o5 
stx %o5, [%i2 + 32 ] 
add   %l4, 1, %l4

P137: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f3
fmovd %f36, %f4

P138: !DWST [14] (maybe <- 0x3f800053) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
std %f20, [%i3 + 128]

P139: !BST [10] (maybe <- 0x3f800054) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P140: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P141: !REPLACEMENT [2] (Int)
sethi %hi(0xc), %l3
or %l3, %lo(0xc),  %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %i3, %l3, %l3
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P142: !DWST [14] (maybe <- 0x14) (Int)
mov %l4, %o5 
sllx %o5, 32, %o5 
stx %o5, [%i3 + 128 ] 
add   %l4, 1, %l4

P143: !BST [7] (maybe <- 0x3f800055) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P144: !ST [2] (maybe <- 0x15) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P145: !REPLACEMENT [0] (Int)
sethi %hi(0x0), %l3
or %l3, %lo(0x0),  %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %i3, %l3, %l3
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P146: !BLD [1] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f6
fmovd %f34, %f18
fmovs %f19, %f8
fmovd %f40, %f18
fmovs %f18, %f9

P147: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P148: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P149: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P150: !BST [2] (maybe <- 0x3f800058) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P151: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P152: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P153: !BST [1] (maybe <- 0x3f80005c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P154: !DWST [4] (maybe <- 0x16) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i0 + 64 ] 
add   %l4, 1, %l4

P155: !BST [0] (maybe <- 0x3f800060) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P156: !REPLACEMENT [7] (Int)
sethi %hi(0x54), %o5
or %o5, %lo(0x54),  %o5
sethi %hi(0x10000), %l3
or %l3, %lo(0x10000),  %l3
add %i3, %o5, %o5
add %o5, %l3, %o5
ld [%o5], %l6
st %l6, [%o5]
add %o5, %l3, %o5
ld [%o5], %l6
st %l6, [%o5]
add %o5, %l3, %o5
ld [%o5], %l6
st %l6, [%o5]
add %o5, %l3, %o5
ld [%o5], %l6
st %l6, [%o5]

P157: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P158: !REPLACEMENT [9] (Int)
sethi %hi(0x200), %l7
or %l7, %lo(0x200),  %l7
sethi %hi(0x10000), %o5
or %o5, %lo(0x10000),  %o5
add %i3, %l7, %l7
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]

P159: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P160: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P161: !BST [5] (maybe <- 0x3f800064) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P162: !BST [14] (maybe <- 0x3f800067) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P163: !BST [0] (maybe <- 0x3f800068) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P164: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P165: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f14
fmovd %f36, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
fmovs %f19, %f0

P166: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P167: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P168: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f36, %f2

P169: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P170: !MEMBAR (Int)
membar #StoreLoad

P171: !BST [5] (maybe <- 0x3f80006c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P172: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P173: !BST [2] (maybe <- 0x3f80006f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P174: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f5
fmovd %f36, %f6

P175: !BST [9] (maybe <- 0x3f800073) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P176: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P177: !BLD [5] (FP) (Branch target of P443)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f8
fmovd %f36, %f18
fmovs %f18, %f9
fmovs %f19, %f10
ba P178
nop

TARGET443:
ba RET443
nop


P178: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P179: !DWST [13] (maybe <- 0x17) (Int)
mov %l4, %o5 
sllx %o5, 32, %o5 
stx %o5, [%i3 + 64 ] 
add   %l4, 1, %l4

P180: !BLD [2] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f12
fmovd %f34, %f18
fmovs %f19, %f14
fmovd %f40, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30

P181: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f0
membar #Sync 
! 3 addresses covered
fmovs %f3, %f0
fmovs %f4, %f1
fmovs %f5, %f2

P182: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P183: !BLD [15] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET183
nop
RET183:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P184: !BST [12] (maybe <- 0x3f800074) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P185: !BST [3] (maybe <- 0x3f800075) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P186: !DWLD [12] (Int)
ldx [%i3 + 0], %l7
! move %l7(upper) -> %o2(lower)
srlx %l7, 32, %l6
or %l6, %o2, %o2

P187: !BST [12] (maybe <- 0x3f800079) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P188: !BST [11] (maybe <- 0x3f80007a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P189: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P190: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P191: !PREFETCH [2] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i0 + 12] %asi, 1

P192: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P193: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P194: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f4

P195: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P196: !MEMBAR (Int)
membar #StoreLoad

P197: !BST [6] (maybe <- 0x3f80007b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P198: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P199: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f6
fmovd %f36, %f18
fmovs %f18, %f7
fmovs %f19, %f8

P200: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P201: !BST [14] (maybe <- 0x3f80007e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P202: !MEMBAR (Int)
membar #StoreLoad

P203: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P204: !DWST [6] (maybe <- 0x18) (Int)
sllx %l4, 32, %o5 
add   %l4, 1, %l4
or %o5, %l4, %o5
stx %o5, [%i1 + 80]
add   %l4, 1, %l4

P205: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P206: !BST [8] (maybe <- 0x3f80007f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P207: !PREFETCH [5] (Int) (Branch target of P256)
prefetch [%i1 + 76], 1
ba P208
nop

TARGET256:
ba RET256
nop


P208: !BST [9] (maybe <- 0x3f800080) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P209: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f9
fmovd %f36, %f10

P210: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P211: !PREFETCH [13] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i3 + 64] %asi, 1

P212: !BST [13] (maybe <- 0x3f800081) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P213: !BST [1] (maybe <- 0x3f800082) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P214: !DWLD [14] (Int)
ldx [%i3 + 128], %o3
! move %o3(upper) -> %o3(upper)

P215: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P216: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P217: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P218: !BST [5] (maybe <- 0x3f800086) (FP) (Branch target of P308)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 
ba P219
nop

TARGET308:
ba RET308
nop


P219: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P220: !REPLACEMENT [11] (Int)
sethi %hi(0x40), %o5
or %o5, %lo(0x40),  %o5
sethi %hi(0x10000), %l3
or %l3, %lo(0x10000),  %l3
add %i3, %o5, %o5
add %o5, %l3, %o5
ld [%o5], %l6
st %l6, [%o5]
add %o5, %l3, %o5
ld [%o5], %l6
st %l6, [%o5]
add %o5, %l3, %o5
ld [%o5], %l6
st %l6, [%o5]
add %o5, %l3, %o5
ld [%o5], %l6
st %l6, [%o5]

P221: !ST [15] (maybe <- 0x1a) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P222: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
fmovd %f36, %f0

P223: !BST [13] (maybe <- 0x3f800089) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P224: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P225: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P226: !ST [5] (maybe <- 0x1b) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P227: !BST [3] (maybe <- 0x3f80008a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P228: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P229: !BST [13] (maybe <- 0x3f80008e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P230: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P231: !DWLD [10] (Int)
ldx [%i2 + 32], %l7
! move %l7(upper) -> %o3(lower)
srlx %o3, 32, %o3
sllx %o3, 32, %o3
srlx %l7, 32, %l6
or %l6, %o3, %o3

P232: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P233: !BLD [14] (FP) (Branch target of P55)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3
ba P234
nop

TARGET55:
ba RET55
nop


P234: !LD [6] (Int)
lduw [%i1 + 80], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P235: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P236: !LD [1] (Int)
lduw [%i0 + 4], %l7
! move %l7(lower) -> %o4(lower)
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P237: !DWST [9] (maybe <- 0x1c) (Int) (CBR) (Branch target of P289)
mov %l4, %o5 
sllx %o5, 32, %o5 
stx %o5, [%i1 + 512 ] 
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET237
nop
RET237:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0

ba P238
nop

TARGET289:
ba RET289
nop


P238: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P239: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P240: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P241: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P242: !LD [15] (Int)
lduw [%i3 + 192], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P243: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P244: !BST [12] (maybe <- 0x3f80008f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P245: !CASX [9] (maybe <- 0x1d) (Int)
add %i1, 512, %l6
ldx [%l6], %o5
! move %o5(upper) -> %o0(lower)
srlx %o5, 32, %l3
or %l3, %o0, %o0
! move %o5(lower) -> %o1(upper)
sllx %o5, 32, %o1
mov  %o5, %l3
sllx %l4, 32, %o5
casx [%l6], %l3, %o5
! move %o5(upper) -> %o1(lower)
srlx %o5, 32, %l6
or %l6, %o1, %o1
! move %o5(lower) -> %o2(upper)
sllx %o5, 32, %o2
add  %l4, 1, %l4

P246: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P247: !BST [12] (maybe <- 0x3f800090) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P248: !BST [0] (maybe <- 0x3f800091) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P249: !BLD [2] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7
fmovs %f19, %f8
fmovd %f34, %f18
fmovs %f19, %f9
fmovd %f40, %f10

P250: !PREFETCH [13] (Int) (CBR)
prefetch [%i3 + 64], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET250
nop
RET250:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P251: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f11
fmovd %f36, %f12

P252: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P253: !BST [7] (maybe <- 0x3f800095) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P254: !BST [9] (maybe <- 0x3f800098) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P255: !LD [7] (Int)
lduw [%i1 + 84], %l7
! move %l7(lower) -> %o2(lower)
or %l7, %o2, %o2

P256: !PREFETCH [15] (Int) (CBR)
prefetch [%i3 + 192], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET256
nop
RET256:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P257: !BST [7] (maybe <- 0x3f800099) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P258: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f14
fmovd %f36, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
fmovs %f19, %f0

P259: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P260: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P261: !PREFETCH [8] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i1 + 256] %asi, 1

P262: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P263: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P264: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P265: !BST [14] (maybe <- 0x3f80009c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P266: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f2

P267: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P268: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f3
fmovd %f36, %f4

P269: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P270: !DWLD [7] (Int)
ldx [%i1 + 80], %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)

P271: !BST [3] (maybe <- 0x3f80009d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P272: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P273: !BST [11] (maybe <- 0x3f8000a1) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P274: !BST [2] (maybe <- 0x3f8000a2) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P275: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P276: !BST [14] (maybe <- 0x3f8000a6) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P277: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P278: !BST [9] (maybe <- 0x3f8000a7) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P279: !BST [4] (maybe <- 0x3f8000a8) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P280: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P281: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P282: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P283: !CAS [11] (maybe <- 0x1e) (Int) (LE)
! Change single-word-level endianess (big endian <-> little endian) 
sethi %hi(0xff00ff00), %o5
or %o5, %lo(0xff00ff00), %o5
and %l4, %o5, %l7
srl %l7, 8, %l7
sll %l4, 8, %l3
and %l3, %o5, %l3
or %l3, %l7, %l3
srl %l3, 16, %l7
sll %l3, 16, %l3
srl %l3, 0, %l3
or %l3, %l7, %l3
wr %g0, 0x88, %asi
add %i2, 64, %o5
lduwa [%o5] %asi, %o4
mov %o4, %l7
! move %l7(lower) -> %o4(upper)
sllx %l7, 32, %o4
mov %l3, %l6
casa [%o5] %asi, %l7, %l6
! move %l6(lower) -> %o4(lower)
srl %l6, 0, %o5
or %o5, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5
add   %l4, 1, %l4

P284: !BST [6] (maybe <- 0x3f8000a9) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P285: !DWST [5] (maybe <- 0x1f) (Int)
mov %l4, %l6 
stx %l6, [%i1 + 72]
add   %l4, 1, %l4

P286: !ST [8] (maybe <- 0x20) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P287: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P288: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P289: !ST [15] (maybe <- 0x3f8000ac) (FP) (CBR)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i3 + 192 ]

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET289
nop
RET289:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P290: !BST [11] (maybe <- 0x3f8000ad) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET290
nop
RET290:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P291: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P292: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P293: !BST [4] (maybe <- 0x3f8000ae) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET293
nop
RET293:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P294: !BST [3] (maybe <- 0x3f8000af) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P295: !BST [0] (maybe <- 0x3f8000b3) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P296: !BST [1] (maybe <- 0x3f8000b7) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P297: !LD [1] (Int)
lduw [%i0 + 4], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P298: !BST [9] (maybe <- 0x3f8000bb) (FP) (Branch target of P290)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 
ba P299
nop

TARGET290:
ba RET290
nop


P299: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P300: !BLD [3] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f10
fmovd %f34, %f18
fmovs %f19, %f12
fmovd %f40, %f18
fmovs %f18, %f13

P301: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P302: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P303: !BLD [7] (FP) (Branch target of P305)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
fmovd %f36, %f0
ba P304
nop

TARGET305:
ba RET305
nop


P304: !BST [13] (maybe <- 0x3f8000bc) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P305: !BST [8] (maybe <- 0x3f8000bd) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET305
nop
RET305:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P306: !BST [15] (maybe <- 0x3f8000be) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P307: !BST [11] (maybe <- 0x3f8000bf) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P308: !PREFETCH [13] (Int) (CBR)
prefetch [%i3 + 64], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET308
nop
RET308:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P309: !BLD [1] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f2
fmovd %f34, %f18
fmovs %f19, %f4
fmovd %f40, %f18
fmovs %f18, %f5

P310: !REPLACEMENT [0] (Int)
sethi %hi(0x0), %o5
or %o5, %lo(0x0),  %o5
sethi %hi(0x10000), %l3
or %l3, %lo(0x10000),  %l3
add %i3, %o5, %o5
add %o5, %l3, %o5
ld [%o5], %l6
st %l6, [%o5]
add %o5, %l3, %o5
ld [%o5], %l6
st %l6, [%o5]
add %o5, %l3, %o5
ld [%o5], %l6
st %l6, [%o5]
add %o5, %l3, %o5
ld [%o5], %l6
st %l6, [%o5]

P311: !DWST [11] (maybe <- 0x21) (Int)
mov %l4, %l7 
sllx %l7, 32, %l7 
stx %l7, [%i2 + 64 ] 
add   %l4, 1, %l4

P312: !BST [8] (maybe <- 0x3f8000c0) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P313: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P314: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P315: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P316: !BST [2] (maybe <- 0x3f8000c1) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P317: !DWST [0] (maybe <- 0x22) (Int)
sllx %l4, 32, %o5 
add   %l4, 1, %l4
or %o5, %l4, %o5
stx %o5, [%i0 + 0]
add   %l4, 1, %l4

P318: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P319: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P320: !BST [10] (maybe <- 0x3f8000c5) (FP) (Branch target of P446)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 
ba P321
nop

TARGET446:
ba RET446
nop


P321: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P322: !ST [3] (maybe <- 0x24) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P323: !BLD [3] (FP) (Branch target of P109)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7
fmovs %f19, %f8
fmovd %f34, %f18
fmovs %f19, %f9
fmovd %f40, %f10
ba P324
nop

TARGET109:
ba RET109
nop


P324: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f11
fmovd %f36, %f12

P325: !DWLD [11] (Int)
ldx [%i2 + 64], %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l3
or %l3, %o0, %o0

P326: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P327: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P328: !CASX [14] (maybe <- 0x25) (Int)
add %i3, 128, %o5
ldx [%o5], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
mov  %o1, %l7
sllx %l4, 32, %o2
casx [%o5], %l7, %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
add  %l4, 1, %l4

P329: !BST [8] (maybe <- 0x3f8000c6) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P330: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P331: !CASX [10] (maybe <- 0x26) (Int)
add %i2, 32, %l7
ldx [%l7], %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
mov  %o3, %l6
sllx %l4, 32, %o4
casx [%l7], %l6, %o4
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5
add  %l4, 1, %l4

P332: !DWST [11] (maybe <- 0x27) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i2 + 64 ] 
add   %l4, 1, %l4

P333: !REPLACEMENT [13] (Int)
sethi %hi(0x40), %l3
or %l3, %lo(0x40),  %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %i3, %l3, %l3
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P334: !ST [8] (maybe <- 0x28) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P335: !REPLACEMENT [1] (Int)
sethi %hi(0x4), %l7
or %l7, %lo(0x4),  %l7
sethi %hi(0x10000), %o5
or %o5, %lo(0x10000),  %o5
add %i3, %l7, %l7
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]

P336: !CAS [13] (maybe <- 0x29) (Int)
add %i3, 64, %l7
lduw [%l7], %o0
mov %o0, %l6
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0
mov %l4, %l3
cas [%l7], %l6, %l3
! move %l3(lower) -> %o0(lower)
srl %l3, 0, %l7
or %l7, %o0, %o0
add   %l4, 1, %l4

P337: !BST [9] (maybe <- 0x3f8000c7) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P338: !BST [8] (maybe <- 0x3f8000c8) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P339: !BST [12] (maybe <- 0x3f8000c9) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P340: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f14
fmovd %f36, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
fmovs %f19, %f0

P341: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P342: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P343: !BST [10] (maybe <- 0x3f8000ca) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET343
nop
RET343:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P344: !BST [13] (maybe <- 0x3f8000cb) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P345: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P346: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P347: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P348: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P349: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P350: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P351: !REPLACEMENT [7] (Int)
sethi %hi(0x54), %l6
or %l6, %lo(0x54),  %l6
sethi %hi(0x10000), %l7
or %l7, %lo(0x10000),  %l7
add %i3, %l6, %l6
add %l6, %l7, %l6
ld [%l6], %o5
st %o5, [%l6]
add %l6, %l7, %l6
ld [%l6], %o5
st %o5, [%l6]
add %l6, %l7, %l6
ld [%l6], %o5
st %o5, [%l6]
add %l6, %l7, %l6
ld [%l6], %o5
st %o5, [%l6]

P352: !BST [3] (maybe <- 0x3f8000cc) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P353: !REPLACEMENT [9] (Int)
sethi %hi(0x200), %o5
or %o5, %lo(0x200),  %o5
sethi %hi(0x10000), %l3
or %l3, %lo(0x10000),  %l3
add %i3, %o5, %o5
add %o5, %l3, %o5
ld [%o5], %l6
st %l6, [%o5]
add %o5, %l3, %o5
ld [%o5], %l6
st %l6, [%o5]
add %o5, %l3, %o5
ld [%o5], %l6
st %l6, [%o5]
add %o5, %l3, %o5
ld [%o5], %l6
st %l6, [%o5]

P354: !REPLACEMENT [15] (Int)
sethi %hi(0xc0), %l7
or %l7, %lo(0xc0),  %l7
sethi %hi(0x10000), %o5
or %o5, %lo(0x10000),  %o5
add %i3, %l7, %l7
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]

P355: !BST [4] (maybe <- 0x3f8000d0) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P356: !BST [7] (maybe <- 0x3f8000d1) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P357: !BLD [1] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5
fmovs %f19, %f6
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f40, %f8

P358: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P359: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P360: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P361: !BST [11] (maybe <- 0x3f8000d4) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P362: !BST [8] (maybe <- 0x3f8000d5) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P363: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P364: !DWST [9] (maybe <- 0x2a) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 512 ] 
add   %l4, 1, %l4

P365: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P366: !BST [13] (maybe <- 0x3f8000d6) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P367: !BST [3] (maybe <- 0x3f8000d7) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P368: !BLD [0] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f10
fmovd %f34, %f18
fmovs %f19, %f12
fmovd %f40, %f18
fmovs %f18, %f13

P369: !BLD [0] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f14
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
fmovd %f34, %f18
fmovs %f19, %f0
fmovd %f40, %f18
fmovs %f18, %f1

P370: !BST [0] (maybe <- 0x3f8000db) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P371: !PREFETCH [4] (Int) (Branch target of P293)
prefetch [%i0 + 64], 1
ba P372
nop

TARGET293:
ba RET293
nop


P372: !DWST [4] (maybe <- 0x2b) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i0 + 64 ] 
add   %l4, 1, %l4

P373: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P374: !BST [3] (maybe <- 0x3f8000df) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P375: !BST [4] (maybe <- 0x3f8000e3) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P376: !ST [13] (maybe <- 0x2c) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P377: !BLD [2] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f2
fmovd %f34, %f18
fmovs %f19, %f4
fmovd %f40, %f18
fmovs %f18, %f5

P378: !BST [8] (maybe <- 0x3f8000e4) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P379: !REPLACEMENT [5] (Int)
sethi %hi(0x4c), %l3
or %l3, %lo(0x4c),  %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %i3, %l3, %l3
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P380: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P381: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P382: !BST [2] (maybe <- 0x3f8000e5) (FP) (Branch target of P414)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 
ba P383
nop

TARGET414:
ba RET414
nop


P383: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P384: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P385: !BST [4] (maybe <- 0x3f8000e9) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P386: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f9

P387: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P388: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f10
fmovd %f36, %f18
fmovs %f18, %f11
fmovs %f19, %f12

P389: !DWLD [14] (FP)
ldd [%i3 + 128], %f18
! 1 addresses covered
fmovs %f18, %f13

P390: !BST [10] (maybe <- 0x3f8000ea) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P391: !BST [11] (maybe <- 0x3f8000eb) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P392: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P393: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30

P394: !ST [13] (maybe <- 0x2d) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P395: !REPLACEMENT [7] (Int)
sethi %hi(0x54), %l7
or %l7, %lo(0x54),  %l7
sethi %hi(0x10000), %o5
or %o5, %lo(0x10000),  %o5
add %i3, %l7, %l7
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]

P396: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P397: !BLD [2] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f0
membar #Sync 
! 4 addresses covered
fmovs %f3, %f2
fmovs %f8, %f3

P398: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P399: !BLD [0] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5
fmovs %f19, %f6
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f40, %f8

P400: !BST [3] (maybe <- 0x3f8000ec) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P401: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P402: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P403: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P404: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f10

P405: !PREFETCH [15] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i3 + 192] %asi, 1

P406: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P407: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f11
fmovd %f36, %f12

P408: !BST [7] (maybe <- 0x3f8000f0) (FP) (Branch target of P250)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 
ba P409
nop

TARGET250:
ba RET250
nop


P409: !BST [6] (maybe <- 0x3f8000f3) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P410: !DWLD [9] (Int)
ldx [%i1 + 512], %o1
! move %o1(upper) -> %o1(upper)

P411: !BST [3] (maybe <- 0x3f8000f6) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P412: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P413: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
fmovd %f36, %f0

P414: !BLD [2] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f2
fmovd %f34, %f18
fmovs %f19, %f4
fmovd %f40, %f18
fmovs %f18, %f5

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET414
nop
RET414:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P415: !BST [13] (maybe <- 0x3f8000fa) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P416: !BST [4] (maybe <- 0x3f8000fb) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P417: !MEMBAR (Int)
membar #StoreLoad

P418: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P419: !BLD [2] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7
fmovs %f19, %f8
fmovd %f34, %f18
fmovs %f19, %f9
fmovd %f40, %f10

P420: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P421: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P422: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f12
fmovd %f36, %f18
fmovs %f18, %f13
fmovs %f19, %f14

P423: !BST [4] (maybe <- 0x3f8000fc) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P424: !BST [0] (maybe <- 0x3f8000fd) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P425: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P426: !BST [3] (maybe <- 0x3f800101) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P427: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P428: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P429: !BST [5] (maybe <- 0x3f800105) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P430: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30

P431: !BLD [0] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f0
membar #Sync 
! 4 addresses covered
fmovs %f3, %f2
fmovs %f8, %f3

P432: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P433: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P434: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P435: !BST [3] (maybe <- 0x3f800108) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P436: !BST [5] (maybe <- 0x3f80010c) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET436
nop
RET436:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P437: !ST [1] (maybe <- 0x2e) (Int) (Branch target of P343)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4
ba P438
nop

TARGET343:
ba RET343
nop


P438: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P439: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P440: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P441: !BST [2] (maybe <- 0x3f80010f) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET441
nop
RET441:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P442: !BST [9] (maybe <- 0x3f800113) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P443: !BLD [5] (FP) (CBR) (Branch target of P113)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f6
fmovd %f36, %f18
fmovs %f18, %f7
fmovs %f19, %f8

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET443
nop
RET443:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0

ba P444
nop

TARGET113:
ba RET113
nop


P444: !BST [8] (maybe <- 0x3f800114) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P445: !ST [9] (maybe <- 0x2f) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P446: !PREFETCH [1] (Int) (CBR)
prefetch [%i0 + 4], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET446
nop
RET446:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P447: !DWST [5] (maybe <- 0x30) (Int)
mov %l4, %o5 
stx %o5, [%i1 + 72]
add   %l4, 1, %l4

P448: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P449: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P450: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P451: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P452: !LD [1] (FP)
ld [%i0 + 4], %f10
! 1 addresses covered

P453: !BST [7] (maybe <- 0x3f800115) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P454: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P455: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P456: !DWST [12] (maybe <- 0x31) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 0 ] 
add   %l4, 1, %l4

P457: !LD [8] (Int) (CBR)
lduw [%i1 + 256], %l6
! move %l6(lower) -> %o1(lower)
srlx %o1, 32, %o1
sllx %o1, 32, %o1
or %l6, %o1, %o1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET457
nop
RET457:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P458: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P459: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f11
fmovd %f36, %f12

P460: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P461: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P462: !BST [6] (maybe <- 0x3f800118) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P463: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30

P464: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f0
membar #Sync 
! 3 addresses covered
fmovs %f3, %f0
fmovs %f4, %f1
fmovs %f5, %f2

P465: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f3
fmovd %f36, %f4

P466: !SWAP [2] (maybe <- 0x32) (Int)
mov %l4, %o2
swap  [%i0 + 12], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P467: !DWLD [14] (Int)
ldx [%i3 + 128], %l7
! move %l7(upper) -> %o2(lower)
srlx %l7, 32, %l6
or %l6, %o2, %o2

P468: !BST [2] (maybe <- 0x3f80011b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P469: !BLD [2] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f6
fmovd %f34, %f18
fmovs %f19, %f8
fmovd %f40, %f18
fmovs %f18, %f9

P470: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P471: !DWST [4] (maybe <- 0x33) (Int)
mov %l4, %l7 
sllx %l7, 32, %l7 
stx %l7, [%i0 + 64 ] 
add   %l4, 1, %l4

P472: !BST [3] (maybe <- 0x3f80011f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P473: !BLD [0] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11
fmovs %f19, %f12
fmovd %f34, %f18
fmovs %f19, %f13
fmovd %f40, %f14

P474: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
fmovd %f36, %f0

P475: !BST [11] (maybe <- 0x3f800123) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P476: !BST [13] (maybe <- 0x3f800124) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P477: !BST [2] (maybe <- 0x3f800125) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P478: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P479: !BST [7] (maybe <- 0x3f800129) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET479
nop
RET479:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P480: !BLD [6] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f2
fmovd %f36, %f18
fmovs %f18, %f3
fmovs %f19, %f4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET480
nop
RET480:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P481: !DWLD [5] (Int)
ldx [%i1 + 72], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P482: !BLD [1] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5
fmovs %f19, %f6
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f40, %f8

P483: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P484: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f9
fmovd %f36, %f10

P485: !CASX [2] (maybe <- 0x34) (Int)
add %i0, 8, %l6
ldx [%l6], %o5
! move %o5(upper) -> %o3(lower)
srlx %o5, 32, %l3
or %l3, %o3, %o3
! move %o5(lower) -> %o4(upper)
sllx %o5, 32, %o4
mov  %o5, %l3
mov %l4, %o5
casx [%l6], %l3, %o5
! move %o5(upper) -> %o4(lower)
srlx %o5, 32, %l6
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5
! move %o5(lower) -> %o0(upper)
sllx %o5, 32, %o0
add  %l4, 1, %l4

P486: !BST [10] (maybe <- 0x3f80012c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P487: !BST [2] (maybe <- 0x3f80012d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P488: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P489: !DWLD [1] (FP)
ldd [%i0 + 0], %f18
! 2 addresses covered
fmovs %f18, %f13
fmovs %f19, %f14

P490: !BLD [1] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
fmovs %f19, %f0
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f40, %f2

P491: !MEMBAR (Int)
membar #StoreLoad

P492: !BST [2] (maybe <- 0x3f800131) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P493: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P494: !BST [15] (maybe <- 0x3f800135) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P495: !DWLD [0] (Int)
ldx [%i0 + 0], %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l3
or %l3, %o0, %o0
! move %l6(lower) -> %o1(upper)
sllx %l6, 32, %o1

P496: !BLD [1] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3
fmovs %f19, %f4
fmovd %f34, %f18
fmovs %f19, %f5
fmovd %f40, %f6

P497: !BLD [2] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7
fmovs %f19, %f8
fmovd %f34, %f18
fmovs %f19, %f9
fmovd %f40, %f10

P498: !BST [2] (maybe <- 0x3f800136) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P499: !BLD [8] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET499
nop
RET499:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P500: !BST [14] (maybe <- 0x3f80013a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P501: !MEMBAR (Int)
membar #StoreLoad

P502: !LD [0] (Int)
lduw [%i0 + 0], %l7
! move %l7(lower) -> %o1(lower)
or %l7, %o1, %o1

P503: !LD [1] (Int)
lduw [%i0 + 4], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P504: !LD [2] (Int)
lduw [%i0 + 12], %l7
! move %l7(lower) -> %o2(lower)
or %l7, %o2, %o2

P505: !LD [3] (Int)
lduw [%i0 + 32], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P506: !LD [4] (Int)
lduw [%i0 + 64], %l7
! move %l7(lower) -> %o3(lower)
or %l7, %o3, %o3

P507: !LD [5] (Int)
lduw [%i1 + 76], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P508: !LD [6] (Int)
lduw [%i1 + 80], %l7
! move %l7(lower) -> %o4(lower)
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P509: !LD [7] (Int)
lduw [%i1 + 84], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P510: !LD [8] (Int) (CBR)
lduw [%i1 + 256], %l7
! move %l7(lower) -> %o0(lower)
or %l7, %o0, %o0

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET510
nop
RET510:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P511: !LD [9] (FP)
ld [%i1 + 512], %f12
! 1 addresses covered

P512: !LD [10] (FP)
ld [%i2 + 32], %f13
! 1 addresses covered

P513: !LD [11] (Int)
lduw [%i2 + 64], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P514: !LD [12] (Int)
lduw [%i3 + 0], %o5
! move %o5(lower) -> %o1(lower)
or %o5, %o1, %o1

P515: !LD [13] (Int)
lduw [%i3 + 64], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P516: !LD [14] (Int)
lduw [%i3 + 128], %o5
! move %o5(lower) -> %o2(lower)
or %o5, %o2, %o2

P517: !LD [15] (Int)
lduw [%i3 + 192], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

END_NODES0: ! Test istream for CPU 0 ends
sethi %hi(0xdead0e0f), %l7
or    %l7, %lo(0xdead0e0f), %l7
! move %l7(lower) -> %o3(lower)
or %l7, %o3, %o3
stw %l7, [%i5] 
ld [%i5], %f14
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30

restore
retl
nop
!-----------------

! register usage:
! %i0 %i1 %i2 %i3 : base registers for 4 regions
! %i4 fixed pointer to per-cpu results area
! %l1 moving pointer to per-cpu FP results area
! %o7 moving pointer to per-cpu integer results area
! %i5 pointer to per-cpu private area
! %l0 holds lfsr, used as source of random bits 
! %l2 loop count register
! %f16 running counter for unique fp store values
! %f17 holds increment value for fp counter
! %l4 running counter for unique integer store values (increment value is always 1)
! %l5 move-to register for load values (simulation only)
! %f30 move-to register for FP values (simulation only)
! %l3 %l6 %l7 %o5 : 4 temporary registers
! %o0 %o1 %o2 %o3 %o4 : 5 integer results buffer registers
! %f0-f15 FP results buffer registers
! %f32-f47 FP block load/store registers

func1:
! 500 (dynamic) instruction sequence begins
save   %sp, -192, %sp

! Force %i0-%i3 to be 64-byte aligned
add %i0, 63, %i0
andn %i0, 63, %i0

add %i1, 63, %i1
andn %i1, 63, %i1

add %i2, 63, %i2
andn %i2, 63, %i2

add %i3, 63, %i3
andn %i3, 63, %i3

add %i4, 63, %i4
andn %i4, 63, %i4

add %i5, 63, %i5
andn %i5, 63, %i5


! Initialize pointer to FP load results area
mov   %i4, %l1

! Initialize pointer to integer load results area
sethi %hi(0x80000), %o7
or    %o7, %lo(0x80000), %o7
add  %o7, %l1, %o7 

! Initialize %f0-%f62 to 0xdeadbee0deadbee1
sethi %hi(0xdeadbee0), %l6
or    %l6, %lo(0xdeadbee0), %l6
stw   %l6, [%i5]
sethi %hi(0xdeadbee1), %l6
or    %l6, %lo(0xdeadbee1), %l6
stw   %l6, [%i5+4]
ldd [%i5], %f0
fmovd %f0, %f2
fmovd %f0, %f4
fmovd %f0, %f6
fmovd %f0, %f8
fmovd %f0, %f10
fmovd %f0, %f12
fmovd %f0, %f14
fmovd %f0, %f16
fmovd %f0, %f18
fmovd %f0, %f20
fmovd %f0, %f22
fmovd %f0, %f24
fmovd %f0, %f26
fmovd %f0, %f28
fmovd %f0, %f30
fmovd %f0, %f32
fmovd %f0, %f34
fmovd %f0, %f36
fmovd %f0, %f38
fmovd %f0, %f40
fmovd %f0, %f42
fmovd %f0, %f44
fmovd %f0, %f46
fmovd %f0, %f48
fmovd %f0, %f50
fmovd %f0, %f52
fmovd %f0, %f54
fmovd %f0, %f56
fmovd %f0, %f58
fmovd %f0, %f60
fmovd %f0, %f62

! Signature for extract_loads script to start extracting load values for this stream
sethi %hi(0x01deade1), %l6
or    %l6, %lo(0x01deade1), %l6
stw %l6, [%i5] 
ld [%i5], %f16

! Initialize running integer counter in register %l4
sethi %hi(0x800001), %l4
or    %l4, %lo(0x800001), %l4

! Initialize running FP counter in register %f16
sethi %hi(0x40000001), %l6
or    %l6, %lo(0x40000001), %l6
stw %l6, [%i5] 
ld [%i5], %f16

! Initialize FP counter increment value in register %f17 (constant)
sethi %hi(0x34800000), %l6
or    %l6, %lo(0x34800000), %l6
stw %l6, [%i5] 
ld [%i5], %f17 

! Initialize LFSR to 0x4769^4
sethi %hi(0x4769), %l0
or    %l0, %lo(0x4769), %l0
mulx  %l0, %l0, %l0
mulx  %l0, %l0, %l0

!-- init shared addrs 2 to 3 ---
stx %g0, [%i0+8]
stx %g0, [%i0+32]

! use untouched cache-line (offset 4K) in replacement area for sync
sub %i1, %i0, %l7
add %i3, %l7, %l7
sub %l7, -4096, %l7

!-- begin of sync_init ---
or %g0, 1, %o5
or %g0, %o5, %l3
swap [%l7+4], %l3
membar #Sync
sync_init_1_1:
brnz,pt %o5, sync_init_1_1
lduw [%l7+4], %o5 ! delay slot
sync_init_2_1:
lduw [%l7], %o5
sub %o5, 1, %l3
cas [%l7], %o5, %l3
cmp %o5, %l3
bne,pt %xcc, sync_init_2_1
nop
membar #Sync
sync_init_3_1:
lduw [%l7], %o5 ! delay slot
brnz,pt %o5, sync_init_3_1
nop
!-- end of sync_init ---


BEGIN_NODES1: ! Test istream for CPU 1 begins

P518: !BST [4] (maybe <- 0x40000001) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P519: !DWST [6] (maybe <- 0x800001) (Int) (Branch target of P1010)
sllx %l4, 32, %l3 
add   %l4, 1, %l4
or %l3, %l4, %l3
stx %l3, [%i1 + 80]
add   %l4, 1, %l4
ba P520
nop

TARGET1010:
ba RET1010
nop


P520: !BST [11] (maybe <- 0x40000002) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET520
nop
RET520:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P521: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f0
membar #Sync 
! 1 addresses covered

P522: !BST [9] (maybe <- 0x40000003) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P523: !CASX [12] (maybe <- 0x800003) (Int)
add %i3, 0, %o5
ldx [%o5], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l7
sllx %l4, 32, %o1
casx [%o5], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P524: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P525: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P526: !SWAP [12] (maybe <- 0x800004) (Int)
mov %l4, %o2
swap  [%i3 + 0], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P527: !MEMBAR (Int)
membar #StoreLoad

P528: !BST [6] (maybe <- 0x40000004) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P529: !BLD [12] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET529
nop
RET529:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P530: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f3
fmovd %f36, %f4

P531: !ST [10] (maybe <- 0x800005) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P532: !DWLD [2] (Int)
ldx [%i0 + 8], %l6
! move %l6(lower) -> %o2(lower)
srl %l6, 0, %l3
or %l3, %o2, %o2

P533: !BST [7] (maybe <- 0x40000007) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P534: !PREFETCH [5] (Int) (CBR)
prefetch [%i1 + 76], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET534
nop
RET534:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P535: !DWST [12] (maybe <- 0x800006) (Int)
mov %l4, %l7 
sllx %l7, 32, %l7 
stx %l7, [%i3 + 0 ] 
add   %l4, 1, %l4

P536: !BLD [1] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f6
fmovd %f34, %f18
fmovs %f19, %f8
fmovd %f40, %f18
fmovs %f18, %f9

P537: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P538: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P539: !LD [4] (Int)
lduw [%i0 + 64], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P540: !REPLACEMENT [15] (Int)
sethi %hi(0xc0), %o5
or %o5, %lo(0xc0),  %o5
sethi %hi(0x10000), %l3
or %l3, %lo(0x10000),  %l3
add %i3, %o5, %o5
add %o5, %l3, %o5
ld [%o5], %l6
st %l6, [%o5]
add %o5, %l3, %o5
ld [%o5], %l6
st %l6, [%o5]
add %o5, %l3, %o5
ld [%o5], %l6
st %l6, [%o5]
add %o5, %l3, %o5
ld [%o5], %l6
st %l6, [%o5]

P541: !PREFETCH [12] (Int) (CBR)
prefetch [%i3 + 0], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET541
nop
RET541:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P542: !CASX [6] (maybe <- 0x800007) (Int)
add %i1, 80, %l3
ldx [%l3], %l7
! move %l7(upper) -> %o3(lower)
srlx %l7, 32, %o5
or %o5, %o3, %o3
! move %l7(lower) -> %o4(upper)
sllx %l7, 32, %o4
mov %l7, %o5
sllx %l4, 32, %l7
add  %l4, 1, %l4
or   %l4, %l7, %l7
casx [%l3], %o5, %l7
! move %l7(upper) -> %o4(lower)
srlx %l7, 32, %l3
or %l3, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5
! move %l7(lower) -> %o0(upper)
sllx %l7, 32, %o0
add  %l4, 1, %l4

P543: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P544: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P545: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f12
fmovd %f36, %f18
fmovs %f18, %f13
fmovs %f19, %f14

P546: !BST [2] (maybe <- 0x4000000a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P547: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30

P548: !BST [3] (maybe <- 0x4000000e) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET548
nop
RET548:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P549: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f0
membar #Sync 
! 1 addresses covered

P550: !BST [1] (maybe <- 0x40000012) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P551: !ST [3] (maybe <- 0x800009) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P552: !BLD [1] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1
fmovs %f19, %f2
fmovd %f34, %f18
fmovs %f19, %f3
fmovd %f40, %f4

P553: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P554: !BST [7] (maybe <- 0x40000016) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P555: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P556: !CAS [5] (maybe <- 0x80000a) (Int)
add %i1, 76, %l3
lduw [%l3], %l7
mov %l7, %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0
mov %l4, %o1
cas [%l3], %o5, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P557: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P558: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P559: !BST [1] (maybe <- 0x40000019) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P560: !BST [5] (maybe <- 0x4000001d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P561: !REPLACEMENT [9] (Int)
sethi %hi(0x200), %l6
or %l6, %lo(0x200),  %l6
sethi %hi(0x10000), %l7
or %l7, %lo(0x10000),  %l7
add %i3, %l6, %l6
add %l6, %l7, %l6
ld [%l6], %o5
st %o5, [%l6]
add %l6, %l7, %l6
ld [%l6], %o5
st %o5, [%l6]
add %l6, %l7, %l6
ld [%l6], %o5
st %o5, [%l6]
add %l6, %l7, %l6
ld [%l6], %o5
st %o5, [%l6]

P562: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f36, %f8

P563: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P564: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P565: !BST [3] (maybe <- 0x40000020) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P566: !CASX [11] (maybe <- 0x80000b) (Int)
add %i2, 64, %l3
ldx [%l3], %l7
! move %l7(upper) -> %o1(lower)
srlx %l7, 32, %o5
or %o5, %o1, %o1
! move %l7(lower) -> %o2(upper)
sllx %l7, 32, %o2
mov  %l7, %o5
sllx %l4, 32, %l7
casx [%l3], %o5, %l7
! move %l7(upper) -> %o2(lower)
srlx %l7, 32, %l3
or %l3, %o2, %o2
! move %l7(lower) -> %o3(upper)
sllx %l7, 32, %o3
add  %l4, 1, %l4

P567: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f10

P568: !BST [13] (maybe <- 0x40000024) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P569: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P570: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P571: !PREFETCH [12] (Int) (Branch target of P801)
prefetch [%i3 + 0], 1
ba P572
nop

TARGET801:
ba RET801
nop


P572: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P573: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P574: !BST [8] (maybe <- 0x40000025) (FP) (Branch target of P534)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 
ba P575
nop

TARGET534:
ba RET534
nop


P575: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P576: !ST [0] (maybe <- 0x80000c) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P577: !BST [12] (maybe <- 0x40000026) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P578: !BLD [3] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f14
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
fmovd %f34, %f18
fmovs %f19, %f0
fmovd %f40, %f18
fmovs %f18, %f1

P579: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P580: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P581: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P582: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P583: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P584: !BST [3] (maybe <- 0x40000027) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P585: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f3
fmovd %f36, %f4

P586: !BST [8] (maybe <- 0x4000002b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P587: !ST [11] (maybe <- 0x4000002c) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i2 + 64 ]

P588: !REPLACEMENT [8] (Int)
sethi %hi(0x100), %l3
or %l3, %lo(0x100),  %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %i3, %l3, %l3
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P589: !BST [4] (maybe <- 0x4000002d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P590: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P591: !BLD [3] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7
fmovs %f19, %f8
fmovd %f34, %f18
fmovs %f19, %f9
fmovd %f40, %f10

P592: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f11
fmovd %f36, %f12

P593: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f14
fmovd %f36, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
fmovs %f19, %f0

P594: !BST [4] (maybe <- 0x4000002e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P595: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P596: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P597: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P598: !BST [10] (maybe <- 0x4000002f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P599: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P600: !REPLACEMENT [3] (Int)
sethi %hi(0x20), %l3
or %l3, %lo(0x20),  %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %i3, %l3, %l3
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P601: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P602: !SWAP [6] (maybe <- 0x80000d) (Int) (LE)
wr %g0, 0x88, %asi
mov %l4, %l6
! Change single-word-level endianess (big endian <-> little endian) 
sethi %hi(0xff00ff00), %o5
or %o5, %lo(0xff00ff00), %o5
and %l6, %o5, %l3
srl %l3, 8, %l3
sll %l6, 8, %l6
and %l6, %o5, %l6
or %l6, %l3, %l6
srl %l6, 16, %l3
sll %l6, 16, %l6
srl %l6, 0, %l6
or %l6, %l3, %l6
swapa  [%i1 + 80] %asi, %l6
! move %l6(lower) -> %o3(lower)
srl %l6, 0, %o5
or %o5, %o3, %o3
add   %l4, 1, %l4

P603: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P604: !REPLACEMENT [1] (Int)
sethi %hi(0x4), %l7
or %l7, %lo(0x4),  %l7
sethi %hi(0x10000), %o5
or %o5, %lo(0x10000),  %o5
add %i3, %l7, %l7
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]

P605: !DWST [15] (maybe <- 0x80000e) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 192 ] 
add   %l4, 1, %l4

P606: !BST [3] (maybe <- 0x40000030) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P607: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f4
fmovd %f36, %f18
fmovs %f18, %f5
fmovs %f19, %f6

P608: !BST [7] (maybe <- 0x40000034) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P609: !BST [2] (maybe <- 0x40000037) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P610: !ST [3] (maybe <- 0x80000f) (Int) (CBR)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET610
nop
RET610:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P611: !BST [15] (maybe <- 0x4000003b) (FP) (Branch target of P897)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 
ba P612
nop

TARGET897:
ba RET897
nop


P612: !BST [6] (maybe <- 0x4000003c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P613: !BST [4] (maybe <- 0x4000003f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P614: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P615: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P616: !BST [8] (maybe <- 0x40000040) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P617: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P618: !BLD [10] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f8

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET618
nop
RET618:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P619: !BST [0] (maybe <- 0x40000041) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P620: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P621: !BST [14] (maybe <- 0x40000045) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P622: !LD [14] (Int)
lduw [%i3 + 128], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P623: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P624: !BLD [3] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9
fmovs %f19, %f10
fmovd %f34, %f18
fmovs %f19, %f11
fmovd %f40, %f12

P625: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P626: !BST [10] (maybe <- 0x40000046) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P627: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P628: !BST [10] (maybe <- 0x40000047) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P629: !BLD [2] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13
fmovs %f19, %f14
fmovd %f34, %f18
fmovs %f19, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
fmovd %f40, %f0

P630: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P631: !BST [15] (maybe <- 0x40000048) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P632: !DWLD [7] (Int)
ldx [%i1 + 80], %l3
! move %l3(upper) -> %o4(lower)
srlx %l3, 32, %o5
or %o5, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0

P633: !MEMBAR (Int)
membar #StoreLoad

P634: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P635: !BLD [3] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f2
fmovd %f34, %f18
fmovs %f19, %f4
fmovd %f40, %f18
fmovs %f18, %f5

P636: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P637: !DWLD [7] (FP)
ldd [%i1 + 80], %f18
! 2 addresses covered
fmovs %f18, %f7
fmovs %f19, %f8

P638: !DWST [12] (maybe <- 0x800010) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 0 ] 
add   %l4, 1, %l4

P639: !BST [3] (maybe <- 0x40000049) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P640: !DWLD [7] (Int)
ldx [%i1 + 80], %l3
! move %l3(upper) -> %o0(lower)
srlx %l3, 32, %o5
or %o5, %o0, %o0
! move %l3(lower) -> %o1(upper)
sllx %l3, 32, %o1

P641: !BST [2] (maybe <- 0x4000004d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P642: !BST [3] (maybe <- 0x40000051) (FP) (Branch target of P682)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 
ba P643
nop

TARGET682:
ba RET682
nop


P643: !MEMBAR (Int)
membar #StoreLoad

P644: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f9
fmovd %f36, %f10

P645: !BLD [2] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f12
fmovd %f34, %f18
fmovs %f19, %f14
fmovd %f40, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30

P646: !ST [7] (maybe <- 0x800011) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P647: !BLD [0] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f0
membar #Sync 
! 4 addresses covered
fmovs %f3, %f2
fmovs %f8, %f3

P648: !PREFETCH [7] (Int) (Branch target of P994)
prefetch [%i1 + 84], 1
ba P649
nop

TARGET994:
ba RET994
nop


P649: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P650: !BST [12] (maybe <- 0x40000055) (FP) (Branch target of P541)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 
ba P651
nop

TARGET541:
ba RET541
nop


P651: !BST [5] (maybe <- 0x40000056) (FP) (Branch target of P929)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 
ba P652
nop

TARGET929:
ba RET929
nop


P652: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P653: !CASX [11] (maybe <- 0x800012) (Int)
add %i2, 64, %l6
ldx [%l6], %o5
! move %o5(upper) -> %o1(lower)
srlx %o5, 32, %l3
or %l3, %o1, %o1
! move %o5(lower) -> %o2(upper)
sllx %o5, 32, %o2
mov  %o5, %l3
sllx %l4, 32, %o5
casx [%l6], %l3, %o5
! move %o5(upper) -> %o2(lower)
srlx %o5, 32, %l6
or %l6, %o2, %o2
! move %o5(lower) -> %o3(upper)
sllx %o5, 32, %o3
add  %l4, 1, %l4

P654: !BST [1] (maybe <- 0x40000059) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P655: !ST [5] (maybe <- 0x800013) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P656: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P657: !REPLACEMENT [12] (Int)
sethi %hi(0x0), %l7
or %l7, %lo(0x0),  %l7
sethi %hi(0x10000), %o5
or %o5, %lo(0x10000),  %o5
add %i3, %l7, %l7
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]

P658: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P659: !ST [13] (maybe <- 0x800014) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P660: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P661: !BLD [3] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7
fmovs %f19, %f8
fmovd %f34, %f18
fmovs %f19, %f9
fmovd %f40, %f10

P662: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P663: !BST [12] (maybe <- 0x4000005d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P664: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P665: !BST [11] (maybe <- 0x4000005e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P666: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P667: !BST [0] (maybe <- 0x4000005f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P668: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P669: !LD [5] (Int)
lduw [%i1 + 76], %l7
! move %l7(lower) -> %o3(lower)
or %l7, %o3, %o3

P670: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P671: !LD [11] (Int)
lduw [%i2 + 64], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P672: !PREFETCH [14] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i3 + 128] %asi, 1

P673: !BST [11] (maybe <- 0x40000063) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P674: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P675: !MEMBAR (Int)
membar #StoreLoad

P676: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P677: !BST [15] (maybe <- 0x40000064) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P678: !BLD [1] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
fmovs %f19, %f0
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f40, %f2

P679: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P680: !BST [4] (maybe <- 0x40000065) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P681: !DWST [10] (maybe <- 0x800015) (Int)
mov %l4, %l7 
sllx %l7, 32, %l7 
stx %l7, [%i2 + 32 ] 
add   %l4, 1, %l4

P682: !BLD [12] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET682
nop
RET682:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P683: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P684: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P685: !BST [7] (maybe <- 0x40000066) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET685
nop
RET685:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P686: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P687: !LD [2] (Int)
lduw [%i0 + 12], %o5
! move %o5(lower) -> %o4(lower)
or %o5, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P688: !BST [2] (maybe <- 0x40000069) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P689: !BST [7] (maybe <- 0x4000006d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P690: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P691: !BST [3] (maybe <- 0x40000070) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P692: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P693: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f5
fmovd %f36, %f6

P694: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P695: !CAS [1] (maybe <- 0x800016) (Int) (CBR)
add %i0, 4, %l7
lduw [%l7], %o0
mov %o0, %l6
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0
mov %l4, %l3
cas [%l7], %l6, %l3
! move %l3(lower) -> %o0(lower)
srl %l3, 0, %l7
or %l7, %o0, %o0
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET695
nop
RET695:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P696: !BST [4] (maybe <- 0x40000074) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P697: !MEMBAR (Int)
membar #StoreLoad

P698: !BLD [1] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f8
fmovd %f34, %f18
fmovs %f19, %f10
fmovd %f40, %f18
fmovs %f18, %f11

P699: !DWLD [2] (Int)
ldx [%i0 + 8], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P700: !BST [12] (maybe <- 0x40000075) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P701: !BST [8] (maybe <- 0x40000076) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P702: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P703: !REPLACEMENT [13] (Int) (Branch target of P1004)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
sethi %hi(0x10000), %l7
or %l7, %lo(0x10000),  %l7
add %i3, %l6, %l6
add %l6, %l7, %l6
ld [%l6], %o5
st %o5, [%l6]
add %l6, %l7, %l6
ld [%l6], %o5
st %o5, [%l6]
add %l6, %l7, %l6
ld [%l6], %o5
st %o5, [%l6]
add %l6, %l7, %l6
ld [%l6], %o5
st %o5, [%l6]
ba P704
nop

TARGET1004:
ba RET1004
nop


P704: !BST [2] (maybe <- 0x40000077) (FP) (Branch target of P730)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 
ba P705
nop

TARGET730:
ba RET730
nop


P705: !NOP (Int) (Branch target of P520)
nop
ba P706
nop

TARGET520:
ba RET520
nop


P706: !REPLACEMENT [4] (Int)
sethi %hi(0x40), %o5
or %o5, %lo(0x40),  %o5
sethi %hi(0x10000), %l3
or %l3, %lo(0x10000),  %l3
add %i3, %o5, %o5
add %o5, %l3, %o5
ld [%o5], %l6
st %l6, [%o5]
add %o5, %l3, %o5
ld [%o5], %l6
st %l6, [%o5]
add %o5, %l3, %o5
ld [%o5], %l6
st %l6, [%o5]
add %o5, %l3, %o5
ld [%o5], %l6
st %l6, [%o5]

P707: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P708: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P709: !BST [7] (maybe <- 0x4000007b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P710: !PREFETCH [9] (Int) (CBR)
prefetch [%i1 + 512], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET710
nop
RET710:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P711: !BST [3] (maybe <- 0x4000007e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P712: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P713: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P714: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P715: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30

P716: !BST [6] (maybe <- 0x40000082) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P717: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P718: !ST [4] (maybe <- 0x800017) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P719: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f0
membar #Sync 
! 1 addresses covered

P720: !BST [6] (maybe <- 0x40000085) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P721: !BLD [0] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1
fmovs %f19, %f2
fmovd %f34, %f18
fmovs %f19, %f3
fmovd %f40, %f4

P722: !BST [14] (maybe <- 0x40000088) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P723: !BLD [1] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5
fmovs %f19, %f6
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f40, %f8

P724: !BLD [10] (FP) (Branch target of P610)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f9
ba P725
nop

TARGET610:
ba RET610
nop


P725: !SWAP [1] (maybe <- 0x800018) (Int)
mov %l4, %o5
swap  [%i0 + 4], %o5
! move %o5(lower) -> %o1(lower)
srl %o5, 0, %l6
or %l6, %o1, %o1
add   %l4, 1, %l4

P726: !BST [0] (maybe <- 0x40000089) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P727: !BST [14] (maybe <- 0x4000008d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P728: !DWLD [1] (FP)
ldd [%i0 + 0], %f10
! 2 addresses covered

P729: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P730: !PREFETCH [12] (Int) (CBR)
prefetch [%i3 + 0], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET730
nop
RET730:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P731: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f13
fmovd %f36, %f14
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30

P732: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f0
membar #Sync 
! 1 addresses covered

P733: !PREFETCH [5] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i1 + 76] %asi, 1

P734: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P735: !BST [3] (maybe <- 0x4000008e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P736: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f2
fmovd %f36, %f18
fmovs %f18, %f3
fmovs %f19, %f4

P737: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P738: !DWLD [2] (Int)
ldx [%i0 + 8], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P739: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P740: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P741: !DWST [6] (maybe <- 0x800019) (Int) (Branch target of P618)
sllx %l4, 32, %l3 
add   %l4, 1, %l4
or %l3, %l4, %l3
stx %l3, [%i1 + 80]
add   %l4, 1, %l4
ba P742
nop

TARGET618:
ba RET618
nop


P742: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P743: !MEMBAR (Int)
membar #StoreLoad

P744: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P745: !BST [9] (maybe <- 0x40000092) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P746: !BLD [2] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f6
fmovd %f34, %f18
fmovs %f19, %f8
fmovd %f40, %f18
fmovs %f18, %f9

P747: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P748: !BST [10] (maybe <- 0x40000093) (FP) (Branch target of P853)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 
ba P749
nop

TARGET853:
ba RET853
nop


P749: !BST [11] (maybe <- 0x40000094) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P750: !BLD [3] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f10
fmovd %f34, %f18
fmovs %f19, %f12
fmovd %f40, %f18
fmovs %f18, %f13

P751: !BST [7] (maybe <- 0x40000095) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P752: !REPLACEMENT [13] (Int)
sethi %hi(0x40), %o5
or %o5, %lo(0x40),  %o5
sethi %hi(0x10000), %l3
or %l3, %lo(0x10000),  %l3
add %i3, %o5, %o5
add %o5, %l3, %o5
ld [%o5], %l6
st %l6, [%o5]
add %o5, %l3, %o5
ld [%o5], %l6
st %l6, [%o5]
add %o5, %l3, %o5
ld [%o5], %l6
st %l6, [%o5]
add %o5, %l3, %o5
ld [%o5], %l6
st %l6, [%o5]

P753: !BST [3] (maybe <- 0x40000098) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P754: !BST [6] (maybe <- 0x4000009c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P755: !LD [9] (Int)
lduw [%i1 + 512], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2

P756: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P757: !BLD [2] (FP) (Branch target of P1003)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f14
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
fmovd %f34, %f18
fmovs %f19, %f0
fmovd %f40, %f18
fmovs %f18, %f1
ba P758
nop

TARGET1003:
ba RET1003
nop


P758: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P759: !BST [15] (maybe <- 0x4000009f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P760: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P761: !BST [0] (maybe <- 0x400000a0) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P762: !BST [8] (maybe <- 0x400000a4) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P763: !BST [7] (maybe <- 0x400000a5) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P764: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P765: !DWLD [1] (Int)
ldx [%i0 + 0], %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)

P766: !BST [7] (maybe <- 0x400000a8) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P767: !LD [7] (Int)
lduw [%i1 + 84], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P768: !MEMBAR (Int)
membar #StoreLoad

P769: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P770: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P771: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P772: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f4
fmovd %f36, %f18
fmovs %f18, %f5
fmovs %f19, %f6

P773: !CAS [11] (maybe <- 0x80001b) (Int)
add %i2, 64, %l7
lduw [%l7], %l3
mov %l3, %l6
! move %l6(lower) -> %o4(lower)
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5
mov %l4, %o0
cas [%l7], %l6, %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
add   %l4, 1, %l4

P774: !BST [4] (maybe <- 0x400000ab) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P775: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P776: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P777: !BST [7] (maybe <- 0x400000ac) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P778: !BLD [0] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7
fmovs %f19, %f8
fmovd %f34, %f18
fmovs %f19, %f9
fmovd %f40, %f10

P779: !BST [10] (maybe <- 0x400000af) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P780: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P781: !SWAP [13] (maybe <- 0x80001c) (Int) (LE)
wr %g0, 0x88, %asi
mov %l4, %l3
! Change single-word-level endianess (big endian <-> little endian) 
sethi %hi(0xff00ff00), %l7
or %l7, %lo(0xff00ff00), %l7
and %l3, %l7, %o5
srl %o5, 8, %o5
sll %l3, 8, %l3
and %l3, %l7, %l3
or %l3, %o5, %l3
srl %l3, 16, %o5
sll %l3, 16, %l3
srl %l3, 0, %l3
or %l3, %o5, %l3
swapa  [%i3 + 64] %asi, %l3
! move %l3(lower) -> %o0(lower)
srl %l3, 0, %l7
or %l7, %o0, %o0
add   %l4, 1, %l4

P782: !ST [12] (maybe <- 0x80001d) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P783: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f11
fmovd %f36, %f12

P784: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f14

P785: !CAS [14] (maybe <- 0x80001e) (Int)
add %i3, 128, %l6
lduw [%l6], %o1
mov %o1, %l3
! move %l3(lower) -> %o1(upper)
sllx %l3, 32, %o1
mov %l4, %o5
cas [%l6], %l3, %o5
! move %o5(lower) -> %o1(lower)
srl %o5, 0, %l6
or %l6, %o1, %o1
add   %l4, 1, %l4

P786: !DWST [9] (maybe <- 0x80001f) (Int)
mov %l4, %l3 
sllx %l3, 32, %l3 
stx %l3, [%i1 + 512 ] 
add   %l4, 1, %l4

P787: !BLD [1] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
fmovs %f19, %f0
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f40, %f2

P788: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P789: !BST [15] (maybe <- 0x400000b0) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P790: !BST [10] (maybe <- 0x400000b1) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P791: !PREFETCH [9] (Int) (Branch target of P548)
prefetch [%i1 + 512], 1
ba P792
nop

TARGET548:
ba RET548
nop


P792: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P793: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f4

P794: !BST [13] (maybe <- 0x400000b2) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P795: !BST [11] (maybe <- 0x400000b3) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P796: !BST [9] (maybe <- 0x400000b4) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P797: !PREFETCH [3] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i0 + 32] %asi, 1

P798: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P799: !BST [11] (maybe <- 0x400000b5) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P800: !PREFETCH [2] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i0 + 12] %asi, 1

P801: !PREFETCH [13] (Int) (CBR)
prefetch [%i3 + 64], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET801
nop
RET801:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P802: !BST [7] (maybe <- 0x400000b6) (FP) (Branch target of P695)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 
ba P803
nop

TARGET695:
ba RET695
nop


P803: !DWST [3] (maybe <- 0x800020) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i0 + 32 ] 
add   %l4, 1, %l4

P804: !BST [6] (maybe <- 0x400000b9) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P805: !MEMBAR (Int)
membar #StoreLoad

P806: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P807: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P808: !BLD [1] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f6
fmovd %f34, %f18
fmovs %f19, %f8
fmovd %f40, %f18
fmovs %f18, %f9

P809: !BST [10] (maybe <- 0x400000bc) (FP) (CBR) (Branch target of P685)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET809
nop
RET809:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0

ba P810
nop

TARGET685:
ba RET685
nop


P810: !BST [12] (maybe <- 0x400000bd) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P811: !BST [2] (maybe <- 0x400000be) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P812: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P813: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P814: !BLD [3] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f10
fmovd %f34, %f18
fmovs %f19, %f12
fmovd %f40, %f18
fmovs %f18, %f13

P815: !BST [0] (maybe <- 0x400000c2) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P816: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f14
fmovd %f36, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
fmovs %f19, %f0

P817: !MEMBAR (Int)
membar #StoreLoad

P818: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f1

P819: !BLD [2] (FP) (Branch target of P529)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f2
fmovd %f34, %f18
fmovs %f19, %f4
fmovd %f40, %f18
fmovs %f18, %f5
ba P820
nop

TARGET529:
ba RET529
nop


P820: !BST [7] (maybe <- 0x400000c6) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P821: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P822: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P823: !BST [7] (maybe <- 0x400000c9) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P824: !BST [9] (maybe <- 0x400000cc) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P825: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P826: !CAS [1] (maybe <- 0x800021) (Int)
add %i0, 4, %l7
lduw [%l7], %o2
mov %o2, %l6
! move %l6(lower) -> %o2(upper)
sllx %l6, 32, %o2
mov %l4, %l3
cas [%l7], %l6, %l3
! move %l3(lower) -> %o2(lower)
srl %l3, 0, %l7
or %l7, %o2, %o2
add   %l4, 1, %l4

P827: !BST [11] (maybe <- 0x400000cd) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P828: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P829: !BST [6] (maybe <- 0x400000ce) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P830: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P831: !BST [9] (maybe <- 0x400000d1) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P832: !BST [4] (maybe <- 0x400000d2) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P833: !BST [2] (maybe <- 0x400000d3) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P834: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P835: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P836: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P837: !BST [13] (maybe <- 0x400000d7) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P838: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P839: !BST [3] (maybe <- 0x400000d8) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P840: !BST [3] (maybe <- 0x400000dc) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P841: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P842: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P843: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P844: !PREFETCH [0] (Int) (CBR)
prefetch [%i0 + 0], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET844
nop
RET844:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P845: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P846: !BST [14] (maybe <- 0x400000e0) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET846
nop
RET846:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P847: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P848: !BST [3] (maybe <- 0x400000e1) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P849: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P850: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P851: !DWST [0] (maybe <- 0x800022) (Int)
sllx %l4, 32, %l6 
add   %l4, 1, %l4
or %l6, %l4, %l6
stx %l6, [%i0 + 0]
add   %l4, 1, %l4

P852: !BST [13] (maybe <- 0x400000e5) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P853: !BST [1] (maybe <- 0x400000e6) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET853
nop
RET853:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P854: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P855: !DWLD [2] (FP)
ldd [%i0 + 8], %f18
! 1 addresses covered
fmovs %f19, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30

P856: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f0
membar #Sync 
! 1 addresses covered
fmovd %f8, %f0

P857: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f36, %f2

P858: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P859: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P860: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P861: !BST [10] (maybe <- 0x400000ea) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P862: !PREFETCH [2] (Int) (LE) (CBR)
wr %g0, 0x88, %asi
prefetcha [%i0 + 12] %asi, 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET862
nop
RET862:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P863: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P864: !BST [15] (maybe <- 0x400000eb) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P865: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f8
fmovd %f36, %f18
fmovs %f18, %f9
fmovs %f19, %f10

P866: !ST [11] (maybe <- 0x800024) (Int) (LE)
wr %g0, 0x88, %asi
! Change single-word-level endianess (big endian <-> little endian) 
sethi %hi(0xff00ff00), %o5
or %o5, %lo(0xff00ff00), %o5
and %l4, %o5, %l3
srl %l3, 8, %l3
sll %l4, 8, %l7
and %l7, %o5, %l7
or %l7, %l3, %l7
srl %l7, 16, %l3
sll %l7, 16, %l7
srl %l7, 0, %l7
or %l7, %l3, %l7
stwa   %l7, [%i2 + 64] %asi
add   %l4, 1, %l4

P867: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P868: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P869: !BST [3] (maybe <- 0x400000ec) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P870: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P871: !BST [3] (maybe <- 0x400000f0) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P872: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P873: !CASX [7] (maybe <- 0x800025) (Int)
add %i1, 80, %l3
ldx [%l3], %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
mov %o3, %o5
sllx %l4, 32, %o4
add  %l4, 1, %l4
or   %l4, %o4, %o4
casx [%l3], %o5, %o4
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5
add  %l4, 1, %l4

P874: !PREFETCH [8] (Int) (Branch target of P710)
prefetch [%i1 + 256], 1
ba P875
nop

TARGET710:
ba RET710
nop


P875: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f11
fmovd %f36, %f12

P876: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P877: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P878: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30

P879: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P880: !LD [10] (Int) (CBR)
lduw [%i2 + 32], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET880
nop
RET880:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P881: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f0
membar #Sync 
! 3 addresses covered
fmovs %f3, %f0
fmovs %f4, %f1
fmovs %f5, %f2

P882: !BST [6] (maybe <- 0x400000f4) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P883: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f3

P884: !BST [0] (maybe <- 0x400000f7) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P885: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f4
fmovd %f36, %f18
fmovs %f18, %f5
fmovs %f19, %f6

P886: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P887: !BST [13] (maybe <- 0x400000fb) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P888: !MEMBAR (Int)
membar #StoreLoad

P889: !ST [13] (maybe <- 0x800027) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P890: !PREFETCH [6] (Int) (Branch target of P891)
prefetch [%i1 + 80], 1
ba P891
nop

TARGET891:
ba RET891
nop


P891: !BLD [2] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f8
fmovd %f34, %f18
fmovs %f19, %f10
fmovd %f40, %f18
fmovs %f18, %f11

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET891
nop
RET891:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P892: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P893: !DWST [7] (maybe <- 0x800028) (Int)
sllx %l4, 32, %o5 
add   %l4, 1, %l4
or %o5, %l4, %o5
stx %o5, [%i1 + 80]
add   %l4, 1, %l4

P894: !BST [0] (maybe <- 0x400000fc) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P895: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f12
fmovd %f36, %f18
fmovs %f18, %f13
fmovs %f19, %f14

P896: !ST [15] (maybe <- 0x80002a) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P897: !BST [9] (maybe <- 0x40000100) (FP) (CBR) (Branch target of P880)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET897
nop
RET897:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0

ba P898
nop

TARGET880:
ba RET880
nop


P898: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P899: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P900: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P901: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30

P902: !BST [0] (maybe <- 0x40000101) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P903: !BLD [2] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f0
membar #Sync 
! 4 addresses covered
fmovs %f3, %f2
fmovs %f8, %f3

P904: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P905: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P906: !BLD [0] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f4
fmovd %f34, %f18
fmovs %f19, %f6
fmovd %f40, %f18
fmovs %f18, %f7

P907: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P908: !BST [11] (maybe <- 0x40000105) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P909: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P910: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P911: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P912: !ST [2] (maybe <- 0x80002b) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P913: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P914: !BLD [0] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f10
fmovd %f34, %f18
fmovs %f19, %f12
fmovd %f40, %f18
fmovs %f18, %f13

P915: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P916: !BST [10] (maybe <- 0x40000106) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P917: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P918: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P919: !BLD [2] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
fmovs %f19, %f0
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f40, %f2

P920: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P921: !SWAP [5] (maybe <- 0x80002c) (Int)
mov %l4, %l7
swap  [%i1 + 76], %l7
! move %l7(lower) -> %o0(lower)
srl %l7, 0, %l3
or %l3, %o0, %o0
add   %l4, 1, %l4

P922: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P923: !BST [9] (maybe <- 0x40000107) (FP) (Branch target of P844)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 
ba P924
nop

TARGET844:
ba RET844
nop


P924: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P925: !BST [5] (maybe <- 0x40000108) (FP) (Branch target of P809)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 
ba P926
nop

TARGET809:
ba RET809
nop


P926: !BLD [2] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3
fmovs %f19, %f4
fmovd %f34, %f18
fmovs %f19, %f5
fmovd %f40, %f6

P927: !BST [4] (maybe <- 0x4000010b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P928: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f36, %f8

P929: !BLD [4] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET929
nop
RET929:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P930: !BST [2] (maybe <- 0x4000010c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P931: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P932: !BST [13] (maybe <- 0x40000110) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P933: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P934: !BST [14] (maybe <- 0x40000111) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P935: !BST [7] (maybe <- 0x40000112) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P936: !CASX [3] (maybe <- 0x80002d) (Int)
add %i0, 32, %l7
ldx [%l7], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
mov  %o1, %l6
sllx %l4, 32, %o2
casx [%l7], %l6, %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
add  %l4, 1, %l4

P937: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P938: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P939: !SWAP [10] (maybe <- 0x80002e) (Int)
mov %l4, %o3
swap  [%i2 + 32], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P940: !BST [1] (maybe <- 0x40000115) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P941: !BLD [2] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13
fmovs %f19, %f14
fmovd %f34, %f18
fmovs %f19, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
fmovd %f40, %f0

P942: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P943: !BST [1] (maybe <- 0x40000119) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P944: !BST [15] (maybe <- 0x4000011d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P945: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P946: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P947: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P948: !ST [3] (maybe <- 0x80002f) (Int) (Branch target of P1033)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4
ba P949
nop

TARGET1033:
ba RET1033
nop


P949: !BST [3] (maybe <- 0x4000011e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P950: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P951: !BST [13] (maybe <- 0x40000122) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P952: !PREFETCH [12] (Int) (Branch target of P1009)
prefetch [%i3 + 0], 1
ba P953
nop

TARGET1009:
ba RET1009
nop


P953: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P954: !BST [10] (maybe <- 0x40000123) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P955: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P956: !PREFETCH [14] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i3 + 128] %asi, 1

P957: !PREFETCH [9] (Int) (Branch target of P846)
prefetch [%i1 + 512], 1
ba P958
nop

TARGET846:
ba RET846
nop


P958: !BST [13] (maybe <- 0x40000124) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P959: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P960: !BLD [3] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f2
fmovd %f34, %f18
fmovs %f19, %f4
fmovd %f40, %f18
fmovs %f18, %f5

P961: !BST [6] (maybe <- 0x40000125) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P962: !DWLD [10] (FP)
ldd [%i2 + 32], %f6
! 1 addresses covered

P963: !DWST [11] (maybe <- 0x800030) (Int)
mov %l4, %o5 
sllx %o5, 32, %o5 
stx %o5, [%i2 + 64 ] 
add   %l4, 1, %l4

P964: !BST [13] (maybe <- 0x40000128) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P965: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P966: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P967: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P968: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P969: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P970: !BST [8] (maybe <- 0x40000129) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P971: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f9
fmovd %f36, %f10

P972: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P973: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P974: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P975: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P976: !REPLACEMENT [9] (Int)
sethi %hi(0x200), %l3
or %l3, %lo(0x200),  %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %i3, %l3, %l3
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P977: !BST [15] (maybe <- 0x4000012a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P978: !BST [6] (maybe <- 0x4000012b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P979: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P980: !CAS [9] (maybe <- 0x800031) (Int)
add %i1, 512, %l7
lduw [%l7], %l3
mov %l3, %l6
! move %l6(lower) -> %o3(lower)
or %l6, %o3, %o3
mov %l4, %o4
cas [%l7], %l6, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P981: !BST [0] (maybe <- 0x4000012e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P982: !CAS [4] (maybe <- 0x800032) (Int)
add %i0, 64, %l6
lduw [%l6], %o5
mov %o5, %l3
! move %l3(lower) -> %o4(lower)
or %l3, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5
mov %l4, %o0
cas [%l6], %l3, %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
add   %l4, 1, %l4

P983: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f13
fmovd %f36, %f14
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30

P984: !ST [12] (maybe <- 0x800033) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P985: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f0
membar #Sync 
! 1 addresses covered

P986: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P987: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P988: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f36, %f2

P989: !BST [5] (maybe <- 0x40000132) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P990: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P991: !DWLD [6] (Int)
ldx [%i1 + 80], %o5
! move %o5(upper) -> %o0(lower)
srlx %o5, 32, %l7
or %l7, %o0, %o0
! move %o5(lower) -> %o1(upper)
sllx %o5, 32, %o1

P992: !BST [7] (maybe <- 0x40000135) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P993: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P994: !BST [6] (maybe <- 0x40000138) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET994
nop
RET994:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P995: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P996: !BST [14] (maybe <- 0x4000013b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P997: !BLD [2] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5
fmovs %f19, %f6
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f40, %f8

P998: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P999: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P1000: !CASX [11] (maybe <- 0x800034) (Int)
add %i2, 64, %o5
ldx [%o5], %l6
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %l7
or %l7, %o1, %o1
! move %l6(lower) -> %o2(upper)
sllx %l6, 32, %o2
mov  %l6, %l7
sllx %l4, 32, %l6
casx [%o5], %l7, %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %o5
or %o5, %o2, %o2
! move %l6(lower) -> %o3(upper)
sllx %l6, 32, %o3
add  %l4, 1, %l4

P1001: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P1002: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f10
fmovd %f36, %f18
fmovs %f18, %f11
fmovs %f19, %f12

P1003: !PREFETCH [8] (Int) (CBR)
prefetch [%i1 + 256], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1003
nop
RET1003:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P1004: !PREFETCH [7] (Int) (CBR)
prefetch [%i1 + 84], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1004
nop
RET1004:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P1005: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P1006: !BST [12] (maybe <- 0x4000013c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P1007: !BLD [0] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f14
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
fmovd %f34, %f18
fmovs %f19, %f0
fmovd %f40, %f18
fmovs %f18, %f1

P1008: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P1009: !ST [2] (maybe <- 0x800035) (Int) (CBR)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1009
nop
RET1009:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P1010: !PREFETCH [10] (Int) (CBR)
prefetch [%i2 + 32], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1010
nop
RET1010:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P1011: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P1012: !REPLACEMENT [3] (Int)
sethi %hi(0x20), %l3
or %l3, %lo(0x20),  %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %i3, %l3, %l3
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1013: !BST [14] (maybe <- 0x4000013d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P1014: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P1015: !BST [1] (maybe <- 0x4000013e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1016: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P1017: !BST [7] (maybe <- 0x40000142) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1018: !MEMBAR (Int)
membar #StoreLoad

P1019: !LD [0] (FP)
ld [%i0 + 0], %f4
! 1 addresses covered

P1020: !LD [1] (Int)
lduw [%i0 + 4], %l6
! move %l6(lower) -> %o3(lower)
or %l6, %o3, %o3

P1021: !LD [2] (Int)
lduw [%i0 + 12], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P1022: !LD [3] (Int) (Branch target of P862)
lduw [%i0 + 32], %l6
! move %l6(lower) -> %o4(lower)
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5
ba P1023
nop

TARGET862:
ba RET862
nop


P1023: !LD [4] (Int)
lduw [%i0 + 64], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1024: !LD [5] (Int)
lduw [%i1 + 76], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

P1025: !LD [6] (Int)
lduw [%i1 + 80], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P1026: !LD [7] (Int)
lduw [%i1 + 84], %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1

P1027: !LD [8] (Int)
lduw [%i1 + 256], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P1028: !LD [9] (Int)
lduw [%i1 + 512], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2

P1029: !LD [10] (Int)
lduw [%i2 + 32], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P1030: !LD [11] (Int)
lduw [%i2 + 64], %l6
! move %l6(lower) -> %o3(lower)
or %l6, %o3, %o3

P1031: !LD [12] (Int)
lduw [%i3 + 0], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P1032: !LD [13] (Int)
lduw [%i3 + 64], %l6
! move %l6(lower) -> %o4(lower)
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P1033: !LD [14] (Int) (CBR)
lduw [%i3 + 128], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1033
nop
RET1033:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P1034: !LD [15] (FP)
ld [%i3 + 192], %f5
! 1 addresses covered

END_NODES1: ! Test istream for CPU 1 ends
sethi %hi(0xdead0e0f), %l6
or    %l6, %lo(0xdead0e0f), %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0
stw %l6, [%i5] 
ld [%i5], %f6
!---- flushing int results buffer----
mov %o0, %l5
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30

restore
retl
nop
!-----------------

! register usage:
! %i0 %i1 %i2 %i3 : base registers for 4 regions
! %i4 fixed pointer to per-cpu results area
! %l1 moving pointer to per-cpu FP results area
! %o7 moving pointer to per-cpu integer results area
! %i5 pointer to per-cpu private area
! %l0 holds lfsr, used as source of random bits 
! %l2 loop count register
! %f16 running counter for unique fp store values
! %f17 holds increment value for fp counter
! %l4 running counter for unique integer store values (increment value is always 1)
! %l5 move-to register for load values (simulation only)
! %f30 move-to register for FP values (simulation only)
! %l3 %l6 %l7 %o5 : 4 temporary registers
! %o0 %o1 %o2 %o3 %o4 : 5 integer results buffer registers
! %f0-f15 FP results buffer registers
! %f32-f47 FP block load/store registers

func2:
! 500 (dynamic) instruction sequence begins
save   %sp, -192, %sp

! Force %i0-%i3 to be 64-byte aligned
add %i0, 63, %i0
andn %i0, 63, %i0

add %i1, 63, %i1
andn %i1, 63, %i1

add %i2, 63, %i2
andn %i2, 63, %i2

add %i3, 63, %i3
andn %i3, 63, %i3

add %i4, 63, %i4
andn %i4, 63, %i4

add %i5, 63, %i5
andn %i5, 63, %i5


! Initialize pointer to FP load results area
mov   %i4, %l1

! Initialize pointer to integer load results area
sethi %hi(0x80000), %o7
or    %o7, %lo(0x80000), %o7
add  %o7, %l1, %o7 

! Initialize %f0-%f62 to 0xdeadbee0deadbee1
sethi %hi(0xdeadbee0), %l3
or    %l3, %lo(0xdeadbee0), %l3
stw   %l3, [%i5]
sethi %hi(0xdeadbee1), %l3
or    %l3, %lo(0xdeadbee1), %l3
stw   %l3, [%i5+4]
ldd [%i5], %f0
fmovd %f0, %f2
fmovd %f0, %f4
fmovd %f0, %f6
fmovd %f0, %f8
fmovd %f0, %f10
fmovd %f0, %f12
fmovd %f0, %f14
fmovd %f0, %f16
fmovd %f0, %f18
fmovd %f0, %f20
fmovd %f0, %f22
fmovd %f0, %f24
fmovd %f0, %f26
fmovd %f0, %f28
fmovd %f0, %f30
fmovd %f0, %f32
fmovd %f0, %f34
fmovd %f0, %f36
fmovd %f0, %f38
fmovd %f0, %f40
fmovd %f0, %f42
fmovd %f0, %f44
fmovd %f0, %f46
fmovd %f0, %f48
fmovd %f0, %f50
fmovd %f0, %f52
fmovd %f0, %f54
fmovd %f0, %f56
fmovd %f0, %f58
fmovd %f0, %f60
fmovd %f0, %f62

! Signature for extract_loads script to start extracting load values for this stream
sethi %hi(0x02deade1), %l3
or    %l3, %lo(0x02deade1), %l3
stw %l3, [%i5] 
ld [%i5], %f16

! Initialize running integer counter in register %l4
sethi %hi(0x1000001), %l4
or    %l4, %lo(0x1000001), %l4

! Initialize running FP counter in register %f16
sethi %hi(0x40800001), %l3
or    %l3, %lo(0x40800001), %l3
stw %l3, [%i5] 
ld [%i5], %f16

! Initialize FP counter increment value in register %f17 (constant)
sethi %hi(0x35000000), %l3
or    %l3, %lo(0x35000000), %l3
stw %l3, [%i5] 
ld [%i5], %f17 

! Initialize LFSR to 0x2679^4
sethi %hi(0x2679), %l0
or    %l0, %lo(0x2679), %l0
mulx  %l0, %l0, %l0
mulx  %l0, %l0, %l0

!-- init shared addrs 4 to 5 ---
stx %g0, [%i0+64]
stx %g0, [%i1+72]

! use untouched cache-line (offset 4K) in replacement area for sync
sub %i1, %i0, %l6
add %i3, %l6, %l6
sub %l6, -4096, %l6

!-- begin of sync_init ---
or %g0, 1, %l7
or %g0, %l7, %o5
swap [%l6+4], %o5
membar #Sync
sync_init_1_2:
brnz,pt %l7, sync_init_1_2
lduw [%l6+4], %l7 ! delay slot
sync_init_2_2:
lduw [%l6], %l7
sub %l7, 1, %o5
cas [%l6], %l7, %o5
cmp %l7, %o5
bne,pt %xcc, sync_init_2_2
nop
membar #Sync
sync_init_3_2:
lduw [%l6], %l7 ! delay slot
brnz,pt %l7, sync_init_3_2
nop
!-- end of sync_init ---


BEGIN_NODES2: ! Test istream for CPU 2 begins

P1035: !BLD [7] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f0
membar #Sync 
! 3 addresses covered
fmovs %f3, %f0
fmovs %f4, %f1
fmovs %f5, %f2

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1035
nop
RET1035:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P1036: !BLD [13] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1036
nop
RET1036:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P1037: !DWLD [5] (Int)
ldx [%i1 + 72], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1038: !BST [0] (maybe <- 0x40800001) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1039: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P1040: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f4
fmovd %f36, %f18
fmovs %f18, %f5
fmovs %f19, %f6

P1041: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P1042: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P1043: !REPLACEMENT [0] (Int)
sethi %hi(0x0), %o5
or %o5, %lo(0x0),  %o5
sethi %hi(0x10000), %l3
or %l3, %lo(0x10000),  %l3
add %i3, %o5, %o5
add %o5, %l3, %o5
ld [%o5], %l6
st %l6, [%o5]
add %o5, %l3, %o5
ld [%o5], %l6
st %l6, [%o5]
add %o5, %l3, %o5
ld [%o5], %l6
st %l6, [%o5]
add %o5, %l3, %o5
ld [%o5], %l6
st %l6, [%o5]

P1044: !REPLACEMENT [13] (Int)
sethi %hi(0x40), %l7
or %l7, %lo(0x40),  %l7
sethi %hi(0x10000), %o5
or %o5, %lo(0x10000),  %o5
add %i3, %l7, %l7
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]

P1045: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P1046: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P1047: !REPLACEMENT [9] (Int)
sethi %hi(0x200), %l6
or %l6, %lo(0x200),  %l6
sethi %hi(0x10000), %l7
or %l7, %lo(0x10000),  %l7
add %i3, %l6, %l6
add %l6, %l7, %l6
ld [%l6], %o5
st %o5, [%l6]
add %l6, %l7, %l6
ld [%l6], %o5
st %o5, [%l6]
add %l6, %l7, %l6
ld [%l6], %o5
st %o5, [%l6]
add %l6, %l7, %l6
ld [%l6], %o5
st %o5, [%l6]

P1048: !BLD [3] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f8
fmovd %f34, %f18
fmovs %f19, %f10
fmovd %f40, %f18
fmovs %f18, %f11

P1049: !BST [6] (maybe <- 0x40800005) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1050: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f12
fmovd %f36, %f18
fmovs %f18, %f13
fmovs %f19, %f14

P1051: !BST [5] (maybe <- 0x40800008) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1052: !DWLD [15] (Int) (LE)
wr %g0, 0x88, %asi
ldxa [%i3 + 192] %asi, %o5
! move %o5(lower) -> %o0(lower)
srl %o5, 0, %l7
or %l7, %o0, %o0

P1053: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P1054: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P1055: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30

P1056: !CASX [8] (maybe <- 0x1000001) (Int)
add %i1, 256, %l6
ldx [%l6], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
mov  %o1, %l3
sllx %l4, 32, %o2
casx [%l6], %l3, %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
add  %l4, 1, %l4

P1057: !LD [5] (FP)
ld [%i1 + 76], %f0
! 1 addresses covered

P1058: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P1059: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f36, %f2

P1060: !BST [13] (maybe <- 0x4080000b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P1061: !BLD [5] (FP) (Branch target of P1157)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f4
fmovd %f36, %f18
fmovs %f18, %f5
fmovs %f19, %f6
ba P1062
nop

TARGET1157:
ba RET1157
nop


P1062: !BLD [0] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7
fmovs %f19, %f8
fmovd %f34, %f18
fmovs %f19, %f9
fmovd %f40, %f10

P1063: !BST [7] (maybe <- 0x4080000c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1064: !PREFETCH [8] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i1 + 256] %asi, 1

P1065: !BST [3] (maybe <- 0x4080000f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1066: !BST [6] (maybe <- 0x40800013) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1067: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f11
fmovd %f36, %f12

P1068: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P1069: !BST [10] (maybe <- 0x40800016) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P1070: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P1071: !LD [13] (Int)
lduw [%i3 + 64], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P1072: !BST [11] (maybe <- 0x40800017) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1072
nop
RET1072:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P1073: !BST [11] (maybe <- 0x40800018) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P1074: !BST [2] (maybe <- 0x40800019) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1075: !ST [3] (maybe <- 0x4080001d) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i0 + 32 ]

P1076: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P1077: !ST [7] (maybe <- 0x4080001e) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i1 + 84 ]

P1078: !CAS [13] (maybe <- 0x1000002) (Int)
add %i3, 64, %l7
lduw [%l7], %l3
mov %l3, %l6
! move %l6(lower) -> %o3(lower)
or %l6, %o3, %o3
mov %l4, %o4
cas [%l7], %l6, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P1079: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f14
fmovd %f36, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
fmovs %f19, %f0

P1080: !DWST [4] (maybe <- 0x1000003) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i0 + 64 ] 
add   %l4, 1, %l4

P1081: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f1

P1082: !SWAP [6] (maybe <- 0x1000004) (Int)
mov %l4, %l7
swap  [%i1 + 80], %l7
! move %l7(lower) -> %o4(lower)
srl %l7, 0, %l3
or %l3, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5
add   %l4, 1, %l4

P1083: !BST [6] (maybe <- 0x4080001f) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1083
nop
RET1083:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P1084: !SWAP [14] (maybe <- 0x1000005) (Int)
mov %l4, %o0
swap  [%i3 + 128], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
add   %l4, 1, %l4

P1085: !DWST [4] (maybe <- 0x1000006) (Int)
mov %l4, %l7 
sllx %l7, 32, %l7 
stx %l7, [%i0 + 64 ] 
add   %l4, 1, %l4

P1086: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f2
fmovd %f36, %f18
fmovs %f18, %f3
fmovs %f19, %f4

P1087: !BST [15] (maybe <- 0x40800022) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P1088: !BST [14] (maybe <- 0x40800023) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P1089: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f5
fmovd %f36, %f6

P1090: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P1091: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P1092: !BLD [2] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9
fmovs %f19, %f10
fmovd %f34, %f18
fmovs %f19, %f11
fmovd %f40, %f12

P1093: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P1094: !DWLD [9] (Int)
ldx [%i1 + 512], %l3
! move %l3(upper) -> %o0(lower)
srlx %l3, 32, %o5
or %o5, %o0, %o0

P1095: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P1096: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P1097: !MEMBAR (Int)
membar #StoreLoad

P1098: !DWLD [7] (Int)
ldx [%i1 + 80], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)

P1099: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P1100: !PREFETCH [3] (Int) (CBR)
prefetch [%i0 + 32], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1100
nop
RET1100:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P1101: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P1102: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P1103: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f14
fmovd %f36, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
fmovs %f19, %f0

P1104: !BST [14] (maybe <- 0x40800024) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P1105: !BST [10] (maybe <- 0x40800025) (FP) (Branch target of P1083)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 
ba P1106
nop

TARGET1083:
ba RET1083
nop


P1106: !BST [11] (maybe <- 0x40800026) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P1107: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P1108: !BST [15] (maybe <- 0x40800027) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P1109: !BST [9] (maybe <- 0x40800028) (FP) (Branch target of P1391)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 
ba P1110
nop

TARGET1391:
ba RET1391
nop


P1110: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P1111: !BLD [10] (FP) (Branch target of P1156)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f2
ba P1112
nop

TARGET1156:
ba RET1156
nop


P1112: !DWLD [1] (Int)
ldx [%i0 + 0], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)

P1113: !BST [9] (maybe <- 0x40800029) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P1114: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P1115: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P1116: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P1117: !BST [12] (maybe <- 0x4080002a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P1118: !DWST [0] (maybe <- 0x1000007) (Int)
sllx %l4, 32, %o5 
add   %l4, 1, %l4
or %o5, %l4, %o5
stx %o5, [%i0 + 0]
add   %l4, 1, %l4

P1119: !ST [0] (maybe <- 0x1000009) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P1120: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P1121: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P1122: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P1123: !BLD [0] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f4
fmovd %f34, %f18
fmovs %f19, %f6
fmovd %f40, %f18
fmovs %f18, %f7

P1124: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P1125: !SWAP [7] (maybe <- 0x100000a) (Int)
mov %l4, %o3
swap  [%i1 + 84], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P1126: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P1127: !BST [0] (maybe <- 0x4080002b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1128: !BST [7] (maybe <- 0x4080002f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1129: !REPLACEMENT [11] (Int)
sethi %hi(0x40), %l7
or %l7, %lo(0x40),  %l7
sethi %hi(0x10000), %o5
or %o5, %lo(0x10000),  %o5
add %i3, %l7, %l7
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]

P1130: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P1131: !BST [8] (maybe <- 0x40800032) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P1132: !DWLD [6] (Int) (LE)
wr %g0, 0x88, %asi
ldxa [%i1 + 80] %asi, %l6
! move %l6(lower) -> %o3(lower)
srl %l6, 0, %l3
or %l3, %o3, %o3
! move %l6(upper) -> %o4(upper)
or %l6, %g0, %o4

P1133: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P1134: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P1135: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f10
fmovd %f36, %f18
fmovs %f18, %f11
fmovs %f19, %f12

P1136: !BST [13] (maybe <- 0x40800033) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P1137: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P1138: !PREFETCH [6] (Int) (Branch target of P1496)
prefetch [%i1 + 80], 1
ba P1139
nop

TARGET1496:
ba RET1496
nop


P1139: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f14
fmovd %f36, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
fmovs %f19, %f0

P1140: !BLD [4] (FP) (Branch target of P1378)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1
ba P1141
nop

TARGET1378:
ba RET1378
nop


P1141: !BLD [1] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f2
fmovd %f34, %f18
fmovs %f19, %f4
fmovd %f40, %f18
fmovs %f18, %f5

P1142: !BST [13] (maybe <- 0x40800034) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P1143: !BST [8] (maybe <- 0x40800035) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P1144: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P1145: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P1146: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f6
fmovd %f36, %f18
fmovs %f18, %f7
fmovs %f19, %f8

P1147: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P1148: !BLD [0] (FP) (Branch target of P1036)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9
fmovs %f19, %f10
fmovd %f34, %f18
fmovs %f19, %f11
fmovd %f40, %f12
ba P1149
nop

TARGET1036:
ba RET1036
nop


P1149: !BST [7] (maybe <- 0x40800036) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1150: !MEMBAR (Int)
membar #StoreLoad

P1151: !CASX [8] (maybe <- 0x100000b) (Int)
add %i1, 256, %o5
ldx [%o5], %l6
! move %l6(upper) -> %o4(lower)
srlx %o4, 32, %o4
sllx %o4, 32, %o4
srlx %l6, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0
mov  %l6, %l7
sllx %l4, 32, %l6
casx [%o5], %l7, %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %o5
or %o5, %o0, %o0
! move %l6(lower) -> %o1(upper)
sllx %l6, 32, %o1
add  %l4, 1, %l4

P1152: !BST [14] (maybe <- 0x40800039) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P1153: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P1154: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f14
fmovd %f36, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
fmovs %f19, %f0

P1155: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P1156: !MEMBAR (Int) (CBR)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1156
nop
RET1156:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P1157: !BLD [8] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1157
nop
RET1157:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P1158: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P1159: !MEMBAR (Int)
membar #StoreLoad

P1160: !ST [9] (maybe <- 0x100000c) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P1161: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P1162: !BLD [8] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1162
nop
RET1162:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P1163: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P1164: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P1165: !DWLD [0] (Int)
ldx [%i0 + 0], %l3
! move %l3(upper) -> %o1(lower)
srlx %l3, 32, %o5
or %o5, %o1, %o1
! move %l3(lower) -> %o2(upper)
sllx %l3, 32, %o2

P1166: !DWST [7] (maybe <- 0x100000d) (Int)
sllx %l4, 32, %l6 
add   %l4, 1, %l4
or %l6, %l4, %l6
stx %l6, [%i1 + 80]
add   %l4, 1, %l4

P1167: !LD [3] (Int)
lduw [%i0 + 32], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2

P1168: !BST [5] (maybe <- 0x4080003a) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1168
nop
RET1168:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P1169: !BST [0] (maybe <- 0x4080003d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1170: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P1171: !BST [14] (maybe <- 0x40800041) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P1172: !BLD [3] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f4
fmovd %f34, %f18
fmovs %f19, %f6
fmovd %f40, %f18
fmovs %f18, %f7

P1173: !BLD [0] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f8
fmovd %f34, %f18
fmovs %f19, %f10
fmovd %f40, %f18
fmovs %f18, %f11

P1174: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P1175: !BST [7] (maybe <- 0x40800042) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1176: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P1177: !BST [9] (maybe <- 0x40800045) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P1178: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P1179: !DWLD [7] (FP)
ldd [%i1 + 80], %f14
! 2 addresses covered
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30

P1180: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P1181: !BST [13] (maybe <- 0x40800046) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P1182: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P1183: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f0
membar #Sync 
! 1 addresses covered

P1184: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f36, %f2

P1185: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P1186: !BST [3] (maybe <- 0x40800047) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1187: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P1188: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P1189: !BST [10] (maybe <- 0x4080004b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P1190: !BST [1] (maybe <- 0x4080004c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1191: !PREFETCH [8] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i1 + 256] %asi, 1

P1192: !REPLACEMENT [11] (Int)
sethi %hi(0x40), %l7
or %l7, %lo(0x40),  %l7
sethi %hi(0x10000), %o5
or %o5, %lo(0x10000),  %o5
add %i3, %l7, %l7
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]

P1193: !REPLACEMENT [13] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
sethi %hi(0x10000), %l7
or %l7, %lo(0x10000),  %l7
add %i3, %l6, %l6
add %l6, %l7, %l6
ld [%l6], %o5
st %o5, [%l6]
add %l6, %l7, %l6
ld [%l6], %o5
st %o5, [%l6]
add %l6, %l7, %l6
ld [%l6], %o5
st %o5, [%l6]
add %l6, %l7, %l6
ld [%l6], %o5
st %o5, [%l6]

P1194: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P1195: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P1196: !DWLD [11] (FP)
ldd [%i2 + 64], %f18
! 1 addresses covered
fmovs %f18, %f5

P1197: !BST [12] (maybe <- 0x40800050) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P1198: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P1199: !BST [0] (maybe <- 0x40800051) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1200: !BLD [2] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f6
fmovd %f34, %f18
fmovs %f19, %f8
fmovd %f40, %f18
fmovs %f18, %f9

P1201: !BST [7] (maybe <- 0x40800055) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1202: !BST [2] (maybe <- 0x40800058) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1203: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P1204: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P1205: !BST [4] (maybe <- 0x4080005c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P1206: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P1207: !BST [9] (maybe <- 0x4080005d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P1208: !LD [6] (Int)
lduw [%i1 + 80], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P1209: !BST [6] (maybe <- 0x4080005e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1210: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P1211: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P1212: !ST [11] (maybe <- 0x100000f) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P1213: !BLD [3] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f12
fmovd %f34, %f18
fmovs %f19, %f14
fmovd %f40, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30

P1214: !BLD [2] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f0
membar #Sync 
! 4 addresses covered
fmovs %f3, %f2
fmovs %f8, %f3

P1215: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P1216: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P1217: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P1218: !BST [1] (maybe <- 0x40800061) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1219: !CASX [5] (maybe <- 0x1000010) (Int) (CBR)
add %i1, 72, %l7
ldx [%l7], %l3
! move %l3(upper) -> %o3(lower)
srlx %l3, 32, %l6
or %l6, %o3, %o3
! move %l3(lower) -> %o4(upper)
sllx %l3, 32, %o4
mov  %l3, %l6
mov %l4, %l3
casx [%l7], %l6, %l3
! move %l3(upper) -> %o4(lower)
srlx %l3, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
add  %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1219
nop
RET1219:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P1220: !BST [3] (maybe <- 0x40800065) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1221: !PREFETCH [6] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i1 + 80] %asi, 1

P1222: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P1223: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P1224: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P1225: !BST [3] (maybe <- 0x40800069) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1226: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P1227: !DWST [9] (maybe <- 0x1000011) (Int)
mov %l4, %l3 
sllx %l3, 32, %l3 
stx %l3, [%i1 + 512 ] 
add   %l4, 1, %l4

P1228: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P1229: !BST [5] (maybe <- 0x4080006d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1230: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f8

P1231: !BLD [0] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9
fmovs %f19, %f10
fmovd %f34, %f18
fmovs %f19, %f11
fmovd %f40, %f12

P1232: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P1233: !PREFETCH [1] (Int) (Branch target of P1501)
prefetch [%i0 + 4], 1
ba P1234
nop

TARGET1501:
ba RET1501
nop


P1234: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P1235: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f14
fmovd %f36, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
fmovs %f19, %f0

P1236: !REPLACEMENT [5] (Int)
sethi %hi(0x4c), %l7
or %l7, %lo(0x4c),  %l7
sethi %hi(0x10000), %o5
or %o5, %lo(0x10000),  %o5
add %i3, %l7, %l7
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]

P1237: !BST [2] (maybe <- 0x40800070) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1238: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P1239: !REPLACEMENT [10] (Int)
sethi %hi(0x20), %l3
or %l3, %lo(0x20),  %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %i3, %l3, %l3
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1240: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P1241: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P1242: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P1243: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P1244: !BST [8] (maybe <- 0x40800074) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P1245: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f4
fmovd %f36, %f18
fmovs %f18, %f5
fmovs %f19, %f6

P1246: !BST [14] (maybe <- 0x40800075) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P1247: !PREFETCH [4] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i0 + 64] %asi, 1

P1248: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f36, %f8

P1249: !BST [2] (maybe <- 0x40800076) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1250: !BST [5] (maybe <- 0x4080007a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1251: !REPLACEMENT [6] (Int)
sethi %hi(0x50), %o5
or %o5, %lo(0x50),  %o5
sethi %hi(0x10000), %l3
or %l3, %lo(0x10000),  %l3
add %i3, %o5, %o5
add %o5, %l3, %o5
ld [%o5], %l6
st %l6, [%o5]
add %o5, %l3, %o5
ld [%o5], %l6
st %l6, [%o5]
add %o5, %l3, %o5
ld [%o5], %l6
st %l6, [%o5]
add %o5, %l3, %o5
ld [%o5], %l6
st %l6, [%o5]

P1252: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P1253: !BLD [1] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f10
fmovd %f34, %f18
fmovs %f19, %f12
fmovd %f40, %f18
fmovs %f18, %f13

P1254: !BLD [14] (FP) (Branch target of P1035)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14
ba P1255
nop

TARGET1035:
ba RET1035
nop


P1255: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P1256: !BST [9] (maybe <- 0x4080007d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P1257: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30

P1258: !PREFETCH [14] (Int) (CBR)
prefetch [%i3 + 128], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1258
nop
RET1258:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P1259: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f0
membar #Sync 
! 1 addresses covered

P1260: !BLD [0] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1
fmovs %f19, %f2
fmovd %f34, %f18
fmovs %f19, %f3
fmovd %f40, %f4

P1261: !BST [9] (maybe <- 0x4080007e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P1262: !REPLACEMENT [3] (Int)
sethi %hi(0x20), %l6
or %l6, %lo(0x20),  %l6
sethi %hi(0x10000), %l7
or %l7, %lo(0x10000),  %l7
add %i3, %l6, %l6
add %l6, %l7, %l6
ld [%l6], %o5
st %o5, [%l6]
add %l6, %l7, %l6
ld [%l6], %o5
st %o5, [%l6]
add %l6, %l7, %l6
ld [%l6], %o5
st %o5, [%l6]
add %l6, %l7, %l6
ld [%l6], %o5
st %o5, [%l6]

P1263: !DWST [9] (maybe <- 0x1000012) (Int)
mov %l4, %l3 
sllx %l3, 32, %l3 
stx %l3, [%i1 + 512 ] 
add   %l4, 1, %l4

P1264: !PREFETCH [0] (Int) (Branch target of P1365)
prefetch [%i0 + 0], 1
ba P1265
nop

TARGET1365:
ba RET1365
nop


P1265: !BST [13] (maybe <- 0x4080007f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P1266: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P1267: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P1268: !DWST [11] (maybe <- 0x1000013) (Int)
mov %l4, %l7 
sllx %l7, 32, %l7 
stx %l7, [%i2 + 64 ] 
add   %l4, 1, %l4

P1269: !PREFETCH [15] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i3 + 192] %asi, 1

P1270: !BST [4] (maybe <- 0x40800080) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P1271: !DWST [5] (maybe <- 0x1000014) (Int)
mov %l4, %l3 
stx %l3, [%i1 + 72]
add   %l4, 1, %l4

P1272: !BST [0] (maybe <- 0x40800081) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1273: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P1274: !BST [13] (maybe <- 0x40800085) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P1275: !REPLACEMENT [7] (Int)
sethi %hi(0x54), %l6
or %l6, %lo(0x54),  %l6
sethi %hi(0x10000), %l7
or %l7, %lo(0x10000),  %l7
add %i3, %l6, %l6
add %l6, %l7, %l6
ld [%l6], %o5
st %o5, [%l6]
add %l6, %l7, %l6
ld [%l6], %o5
st %o5, [%l6]
add %l6, %l7, %l6
ld [%l6], %o5
st %o5, [%l6]
add %l6, %l7, %l6
ld [%l6], %o5
st %o5, [%l6]

P1276: !BST [9] (maybe <- 0x40800086) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P1277: !BST [0] (maybe <- 0x40800087) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1278: !BST [9] (maybe <- 0x4080008b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P1279: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P1280: !BST [9] (maybe <- 0x4080008c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P1281: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P1282: !ST [3] (maybe <- 0x1000015) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P1283: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P1284: !CAS [12] (maybe <- 0x1000016) (Int) (CBR)
add %i3, 0, %l3
lduw [%l3], %l7
mov %l7, %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0
mov %l4, %o1
cas [%l3], %o5, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1284
nop
RET1284:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P1285: !BLD [2] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f8
fmovd %f34, %f18
fmovs %f19, %f10
fmovd %f40, %f18
fmovs %f18, %f11

P1286: !BLD [2] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f12
fmovd %f34, %f18
fmovs %f19, %f14
fmovd %f40, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30

P1287: !BLD [3] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f0
membar #Sync 
! 4 addresses covered
fmovs %f3, %f2
fmovs %f8, %f3

P1288: !REPLACEMENT [0] (Int)
sethi %hi(0x0), %l3
or %l3, %lo(0x0),  %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %i3, %l3, %l3
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1289: !REPLACEMENT [9] (Int) (Branch target of P1468)
sethi %hi(0x200), %o5
or %o5, %lo(0x200),  %o5
sethi %hi(0x10000), %l3
or %l3, %lo(0x10000),  %l3
add %i3, %o5, %o5
add %o5, %l3, %o5
ld [%o5], %l6
st %l6, [%o5]
add %o5, %l3, %o5
ld [%o5], %l6
st %l6, [%o5]
add %o5, %l3, %o5
ld [%o5], %l6
st %l6, [%o5]
add %o5, %l3, %o5
ld [%o5], %l6
st %l6, [%o5]
ba P1290
nop

TARGET1468:
ba RET1468
nop


P1290: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P1291: !BLD [0] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5
fmovs %f19, %f6
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f40, %f8

P1292: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P1293: !CAS [14] (maybe <- 0x1000017) (Int)
add %i3, 128, %o5
lduw [%o5], %l6
mov %l6, %l7
! move %l7(lower) -> %o1(lower)
or %l7, %o1, %o1
mov %l4, %o2
cas [%o5], %l7, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P1294: !PREFETCH [7] (Int) (Branch target of P1100)
prefetch [%i1 + 84], 1
ba P1295
nop

TARGET1100:
ba RET1100
nop


P1295: !DWLD [4] (FP)
ldd [%i0 + 64], %f18
! 1 addresses covered
fmovs %f18, %f9

P1296: !ST [6] (maybe <- 0x1000018) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P1297: !BST [4] (maybe <- 0x4080008d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P1298: !DWST [13] (maybe <- 0x4080008e) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
std %f20, [%i3 + 64]

P1299: !BST [2] (maybe <- 0x4080008f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1300: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P1301: !BST [8] (maybe <- 0x40800093) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P1302: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P1303: !BST [5] (maybe <- 0x40800094) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1304: !REPLACEMENT [13] (Int)
sethi %hi(0x40), %l3
or %l3, %lo(0x40),  %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %i3, %l3, %l3
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1305: !REPLACEMENT [14] (Int)
sethi %hi(0x80), %o5
or %o5, %lo(0x80),  %o5
sethi %hi(0x10000), %l3
or %l3, %lo(0x10000),  %l3
add %i3, %o5, %o5
add %o5, %l3, %o5
ld [%o5], %l6
st %l6, [%o5]
add %o5, %l3, %o5
ld [%o5], %l6
st %l6, [%o5]
add %o5, %l3, %o5
ld [%o5], %l6
st %l6, [%o5]
add %o5, %l3, %o5
ld [%o5], %l6
st %l6, [%o5]

P1306: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P1307: !BST [2] (maybe <- 0x40800097) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1308: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P1309: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P1310: !BLD [1] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11
fmovs %f19, %f12
fmovd %f34, %f18
fmovs %f19, %f13
fmovd %f40, %f14

P1311: !DWLD [3] (Int)
ldx [%i0 + 32], %l7
! move %l7(upper) -> %o2(lower)
srlx %l7, 32, %l6
or %l6, %o2, %o2

P1312: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30

P1313: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f0
membar #Sync 
! 1 addresses covered

P1314: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P1315: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P1316: !BST [8] (maybe <- 0x4080009b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P1317: !BST [9] (maybe <- 0x4080009c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P1318: !BST [1] (maybe <- 0x4080009d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1319: !BST [8] (maybe <- 0x408000a1) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P1320: !ST [7] (maybe <- 0x1000019) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P1321: !CASX [15] (maybe <- 0x100001a) (Int)
add %i3, 192, %o5
ldx [%o5], %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
mov  %o3, %l7
sllx %l4, 32, %o4
casx [%o5], %l7, %o4
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5
add  %l4, 1, %l4

P1322: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f36, %f2

P1323: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P1324: !BST [5] (maybe <- 0x408000a2) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1325: !BLD [3] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5
fmovs %f19, %f6
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f40, %f8

P1326: !BLD [3] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9
fmovs %f19, %f10
fmovd %f34, %f18
fmovs %f19, %f11
fmovd %f40, %f12

P1327: !BST [1] (maybe <- 0x408000a5) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1328: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f13
fmovd %f36, %f14
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30

P1329: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f0
membar #Sync 
! 1 addresses covered
fmovd %f8, %f0

P1330: !BLD [8] (FP) (Branch target of P1072)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1
ba P1331
nop

TARGET1072:
ba RET1072
nop


P1331: !PREFETCH [2] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i0 + 12] %asi, 1

P1332: !SWAP [0] (maybe <- 0x100001b) (Int)
mov %l4, %o0
swap  [%i0 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
add   %l4, 1, %l4

P1333: !BST [11] (maybe <- 0x408000a9) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P1334: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P1335: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P1336: !BST [14] (maybe <- 0x408000aa) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P1337: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P1338: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P1339: !MEMBAR (Int)
membar #StoreLoad

P1340: !BST [14] (maybe <- 0x408000ab) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P1341: !BLD [3] (FP) (Branch target of P1284)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5
fmovs %f19, %f6
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f40, %f8
ba P1342
nop

TARGET1284:
ba RET1284
nop


P1342: !BST [1] (maybe <- 0x408000ac) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1343: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f9
fmovd %f36, %f10

P1344: !BST [13] (maybe <- 0x408000b0) (FP) (CBR) (Branch target of P1474)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1344
nop
RET1344:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0

ba P1345
nop

TARGET1474:
ba RET1474
nop


P1345: !BLD [0] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f12
fmovd %f34, %f18
fmovs %f19, %f14
fmovd %f40, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30

P1346: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f0
membar #Sync 
! 1 addresses covered

P1347: !BST [6] (maybe <- 0x408000b1) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1348: !BST [5] (maybe <- 0x408000b4) (FP) (Branch target of P1529)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 
ba P1349
nop

TARGET1529:
ba RET1529
nop


P1349: !BLD [12] (FP) (Branch target of P1511)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1
ba P1350
nop

TARGET1511:
ba RET1511
nop


P1350: !BLD [0] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f2
fmovd %f34, %f18
fmovs %f19, %f4
fmovd %f40, %f18
fmovs %f18, %f5

P1351: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P1352: !BST [6] (maybe <- 0x408000b7) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1353: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f7

P1354: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f8
fmovd %f36, %f18
fmovs %f18, %f9
fmovs %f19, %f10

P1355: !BLD [2] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11
fmovs %f19, %f12
fmovd %f34, %f18
fmovs %f19, %f13
fmovd %f40, %f14

P1356: !BST [0] (maybe <- 0x408000ba) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1357: !LD [8] (Int)
lduw [%i1 + 256], %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0

P1358: !ST [8] (maybe <- 0x100001c) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P1359: !LD [9] (Int)
lduw [%i1 + 512], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P1360: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P1361: !BST [6] (maybe <- 0x408000be) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1362: !DWLD [2] (FP)
ldd [%i0 + 8], %f18
! 1 addresses covered
fmovs %f19, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30

P1363: !DWST [2] (maybe <- 0x100001d) (Int)
mov %l4, %l6 
stx %l6, [%i0 + 8]
add   %l4, 1, %l4

P1364: !BST [11] (maybe <- 0x408000c1) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P1365: !ST [4] (maybe <- 0x100001e) (Int) (CBR)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1365
nop
RET1365:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P1366: !BST [3] (maybe <- 0x408000c2) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1367: !BLD [3] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f0
membar #Sync 
! 4 addresses covered
fmovs %f3, %f2
fmovs %f8, %f3

P1368: !BST [14] (maybe <- 0x408000c6) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P1369: !BST [10] (maybe <- 0x408000c7) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P1370: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P1371: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P1372: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P1373: !BLD [3] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f4
fmovd %f34, %f18
fmovs %f19, %f6
fmovd %f40, %f18
fmovs %f18, %f7

P1374: !CAS [0] (maybe <- 0x100001f) (Int)
add %i0, 0, %l6
lduw [%l6], %o5
mov %o5, %l3
! move %l3(lower) -> %o1(lower)
or %l3, %o1, %o1
mov %l4, %o2
cas [%l6], %l3, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P1375: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f8
fmovd %f36, %f18
fmovs %f18, %f9
fmovs %f19, %f10

P1376: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P1377: !DWLD [15] (Int)
ldx [%i3 + 192], %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l3
or %l3, %o2, %o2

P1378: !REPLACEMENT [9] (Int) (CBR)
sethi %hi(0x200), %l7
or %l7, %lo(0x200),  %l7
sethi %hi(0x10000), %o5
or %o5, %lo(0x10000),  %o5
add %i3, %l7, %l7
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1378
nop
RET1378:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P1379: !BST [12] (maybe <- 0x408000c8) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P1380: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P1381: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P1382: !ST [12] (maybe <- 0x1000020) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P1383: !BLD [1] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f12
fmovd %f34, %f18
fmovs %f19, %f14
fmovd %f40, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30

P1384: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f0
membar #Sync 
! 1 addresses covered

P1385: !DWLD [1] (Int)
ldx [%i0 + 0], %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)

P1386: !LD [2] (Int)
lduw [%i0 + 12], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P1387: !PREFETCH [10] (Int) (Branch target of P1219)
prefetch [%i2 + 32], 1
ba P1388
nop

TARGET1219:
ba RET1219
nop


P1388: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P1389: !BLD [2] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f2
fmovd %f34, %f18
fmovs %f19, %f4
fmovd %f40, %f18
fmovs %f18, %f5

P1390: !BST [8] (maybe <- 0x408000c9) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P1391: !PREFETCH [5] (Int) (CBR)
prefetch [%i1 + 76], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1391
nop
RET1391:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P1392: !BLD [8] (FP) (Branch target of P1344)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6
ba P1393
nop

TARGET1344:
ba RET1344
nop


P1393: !DWLD [12] (Int)
ldx [%i3 + 0], %l6
! move %l6(upper) -> %o4(lower)
srlx %l6, 32, %l3
or %l3, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P1394: !BLD [3] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7
fmovs %f19, %f8
fmovd %f34, %f18
fmovs %f19, %f9
fmovd %f40, %f10

P1395: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f11
fmovd %f36, %f12

P1396: !BLD [1] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f14
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
fmovd %f34, %f18
fmovs %f19, %f0
fmovd %f40, %f18
fmovs %f18, %f1

P1397: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P1398: !BST [2] (maybe <- 0x408000ca) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1399: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P1400: !BST [2] (maybe <- 0x408000ce) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1401: !BLD [0] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f2
fmovd %f34, %f18
fmovs %f19, %f4
fmovd %f40, %f18
fmovs %f18, %f5

P1402: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P1403: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P1404: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f36, %f8

P1405: !BST [6] (maybe <- 0x408000d2) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1406: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P1407: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f10
fmovd %f36, %f18
fmovs %f18, %f11
fmovs %f19, %f12

P1408: !BST [2] (maybe <- 0x408000d5) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1409: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P1410: !REPLACEMENT [8] (Int)
sethi %hi(0x100), %l7
or %l7, %lo(0x100),  %l7
sethi %hi(0x10000), %o5
or %o5, %lo(0x10000),  %o5
add %i3, %l7, %l7
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]

P1411: !BLD [0] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f14
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
fmovd %f34, %f18
fmovs %f19, %f0
fmovd %f40, %f18
fmovs %f18, %f1

P1412: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P1413: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P1414: !CASX [4] (maybe <- 0x1000021) (Int)
add %i0, 64, %l7
ldx [%l7], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l6
sllx %l4, 32, %o1
casx [%l7], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P1415: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P1416: !BLD [2] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3
fmovs %f19, %f4
fmovd %f34, %f18
fmovs %f19, %f5
fmovd %f40, %f6

P1417: !BLD [0] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7
fmovs %f19, %f8
fmovd %f34, %f18
fmovs %f19, %f9
fmovd %f40, %f10

P1418: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P1419: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P1420: !ST [8] (maybe <- 0x1000022) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P1421: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P1422: !BST [2] (maybe <- 0x408000d9) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1423: !PREFETCH [12] (Int) (Branch target of P1162)
prefetch [%i3 + 0], 1
ba P1424
nop

TARGET1162:
ba RET1162
nop


P1424: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P1425: !BST [0] (maybe <- 0x408000dd) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1426: !BLD [3] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f12
fmovd %f34, %f18
fmovs %f19, %f14
fmovd %f40, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30

P1427: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f0
membar #Sync 
! 3 addresses covered
fmovs %f3, %f0
fmovs %f4, %f1
fmovs %f5, %f2

P1428: !BLD [1] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3
fmovs %f19, %f4
fmovd %f34, %f18
fmovs %f19, %f5
fmovd %f40, %f6

P1429: !BST [1] (maybe <- 0x408000e1) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1430: !BST [5] (maybe <- 0x408000e5) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1431: !BST [12] (maybe <- 0x408000e8) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P1432: !BST [12] (maybe <- 0x408000e9) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P1433: !BST [1] (maybe <- 0x408000ea) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1434: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P1435: !PREFETCH [15] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i3 + 192] %asi, 1

P1436: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P1437: !BST [15] (maybe <- 0x408000ee) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P1438: !BST [13] (maybe <- 0x408000ef) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P1439: !BST [6] (maybe <- 0x408000f0) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1440: !BLD [3] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f8
fmovd %f34, %f18
fmovs %f19, %f10
fmovd %f40, %f18
fmovs %f18, %f11

P1441: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P1442: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f12
fmovd %f36, %f18
fmovs %f18, %f13
fmovs %f19, %f14

P1443: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30

P1444: !DWLD [8] (Int)
ldx [%i1 + 256], %o2
! move %o2(upper) -> %o2(upper)

P1445: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f0
membar #Sync 
! 1 addresses covered

P1446: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f1

P1447: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P1448: !BST [6] (maybe <- 0x408000f3) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1449: !BST [4] (maybe <- 0x408000f6) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P1450: !BST [11] (maybe <- 0x408000f7) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P1451: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P1452: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P1453: !DWLD [2] (Int) (Branch target of P1168)
ldx [%i0 + 8], %l7
! move %l7(lower) -> %o2(lower)
srlx %o2, 32, %o2
sllx %o2, 32, %o2
srl %l7, 0, %l6
or %l6, %o2, %o2
ba P1454
nop

TARGET1168:
ba RET1168
nop


P1454: !BST [3] (maybe <- 0x408000f8) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1455: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P1456: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P1457: !BST [10] (maybe <- 0x408000fc) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P1458: !BST [10] (maybe <- 0x408000fd) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P1459: !BLD [2] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3
fmovs %f19, %f4
fmovd %f34, %f18
fmovs %f19, %f5
fmovd %f40, %f6

P1460: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P1461: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P1462: !BST [15] (maybe <- 0x408000fe) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P1463: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P1464: !BST [3] (maybe <- 0x408000ff) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1465: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P1466: !BST [12] (maybe <- 0x40800103) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P1467: !BST [7] (maybe <- 0x40800104) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1468: !BLD [7] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f8
fmovd %f36, %f18
fmovs %f18, %f9
fmovs %f19, %f10

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1468
nop
RET1468:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P1469: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P1470: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P1471: !LD [9] (Int)
lduw [%i1 + 512], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P1472: !ST [13] (maybe <- 0x1000023) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P1473: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P1474: !BLD [2] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f12
fmovd %f34, %f18
fmovs %f19, %f14
fmovd %f40, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1474
nop
RET1474:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P1475: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f0
membar #Sync 
! 1 addresses covered
fmovd %f8, %f0

P1476: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P1477: !BLD [0] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f2
fmovd %f34, %f18
fmovs %f19, %f4
fmovd %f40, %f18
fmovs %f18, %f5

P1478: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P1479: !CAS [14] (maybe <- 0x1000024) (Int)
add %i3, 128, %l3
lduw [%l3], %l7
mov %l7, %o5
! move %o5(lower) -> %o3(lower)
or %o5, %o3, %o3
mov %l4, %o4
cas [%l3], %o5, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P1480: !BST [1] (maybe <- 0x40800107) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1481: !BST [14] (maybe <- 0x4080010b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P1482: !BST [4] (maybe <- 0x4080010c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P1483: !MEMBAR (Int)
membar #StoreLoad

P1484: !LD [13] (Int)
lduw [%i3 + 64], %l6
! move %l6(lower) -> %o4(lower)
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P1485: !BST [1] (maybe <- 0x4080010d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1486: !BST [2] (maybe <- 0x40800111) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1487: !BST [15] (maybe <- 0x40800115) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P1488: !LD [6] (Int)
lduw [%i1 + 80], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1489: !BST [6] (maybe <- 0x40800116) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1490: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P1491: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P1492: !BST [3] (maybe <- 0x40800119) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1493: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P1494: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P1495: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f36, %f8

P1496: !PREFETCH [6] (Int) (CBR)
prefetch [%i1 + 80], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1496
nop
RET1496:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P1497: !LD [13] (Int)
lduw [%i3 + 64], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

P1498: !BST [9] (maybe <- 0x4080011d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P1499: !DWLD [5] (Int)
ldx [%i1 + 72], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P1500: !BST [10] (maybe <- 0x4080011e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P1501: !BLD [7] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f10
fmovd %f36, %f18
fmovs %f18, %f11
fmovs %f19, %f12

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1501
nop
RET1501:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P1502: !BST [12] (maybe <- 0x4080011f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P1503: !BST [1] (maybe <- 0x40800120) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1504: !BST [6] (maybe <- 0x40800124) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1505: !REPLACEMENT [10] (Int)
sethi %hi(0x20), %l3
or %l3, %lo(0x20),  %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %i3, %l3, %l3
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1506: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P1507: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P1508: !BLD [1] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f14
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
fmovd %f34, %f18
fmovs %f19, %f0
fmovd %f40, %f18
fmovs %f18, %f1

P1509: !MEMBAR (Int) (Branch target of P1258)
membar #StoreLoad
ba P1510
nop

TARGET1258:
ba RET1258
nop


P1510: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P1511: !BST [1] (maybe <- 0x40800127) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1511
nop
RET1511:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P1512: !DWST [10] (maybe <- 0x1000025) (Int)
mov %l4, %o5 
sllx %o5, 32, %o5 
stx %o5, [%i2 + 32 ] 
add   %l4, 1, %l4

P1513: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P1514: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P1515: !BST [8] (maybe <- 0x4080012b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P1516: !BLD [1] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f2
fmovd %f34, %f18
fmovs %f19, %f4
fmovd %f40, %f18
fmovs %f18, %f5

P1517: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P1518: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P1519: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P1520: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P1521: !BST [2] (maybe <- 0x4080012c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1522: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P1523: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P1524: !BST [1] (maybe <- 0x40800130) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1525: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P1526: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f8
fmovd %f36, %f18
fmovs %f18, %f9
fmovs %f19, %f10

P1527: !BLD [2] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11
fmovs %f19, %f12
fmovd %f34, %f18
fmovs %f19, %f13
fmovd %f40, %f14

P1528: !BST [8] (maybe <- 0x40800134) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P1529: !CAS [6] (maybe <- 0x1000026) (Int) (CBR)
add %i1, 80, %o5
lduw [%o5], %l6
mov %l6, %l7
! move %l7(lower) -> %o1(lower)
or %l7, %o1, %o1
mov %l4, %o2
cas [%o5], %l7, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1529
nop
RET1529:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P1530: !BST [10] (maybe <- 0x40800135) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P1531: !BST [12] (maybe <- 0x40800136) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P1532: !BLD [3] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
fmovs %f19, %f0
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f40, %f2

P1533: !BLD [0] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3
fmovs %f19, %f4
fmovd %f34, %f18
fmovs %f19, %f5
fmovd %f40, %f6

P1534: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P1535: !MEMBAR (Int)
membar #StoreLoad

P1536: !LD [0] (FP)
ld [%i0 + 0], %f7
! 1 addresses covered

P1537: !LD [1] (Int)
lduw [%i0 + 4], %l7
! move %l7(lower) -> %o2(lower)
or %l7, %o2, %o2

P1538: !LD [2] (Int)
lduw [%i0 + 12], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P1539: !LD [3] (Int)
lduw [%i0 + 32], %l7
! move %l7(lower) -> %o3(lower)
or %l7, %o3, %o3

P1540: !LD [4] (Int)
lduw [%i0 + 64], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P1541: !LD [5] (Int)
lduw [%i1 + 76], %l7
! move %l7(lower) -> %o4(lower)
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P1542: !LD [6] (Int)
lduw [%i1 + 80], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1543: !LD [7] (Int)
lduw [%i1 + 84], %l7
! move %l7(lower) -> %o0(lower)
or %l7, %o0, %o0

P1544: !LD [8] (Int)
lduw [%i1 + 256], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P1545: !LD [9] (Int) (LE)
wr %g0, 0x88, %asi
lduwa [%i1 + 512] %asi, %l7
! move %l7(lower) -> %o1(lower)
or %l7, %o1, %o1

P1546: !LD [10] (Int)
lduw [%i2 + 32], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P1547: !LD [11] (Int)
lduw [%i2 + 64], %l7
! move %l7(lower) -> %o2(lower)
or %l7, %o2, %o2

P1548: !LD [12] (Int)
lduw [%i3 + 0], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P1549: !LD [13] (Int)
lduw [%i3 + 64], %l7
! move %l7(lower) -> %o3(lower)
or %l7, %o3, %o3

P1550: !LD [14] (Int)
lduw [%i3 + 128], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P1551: !LD [15] (Int)
lduw [%i3 + 192], %l7
! move %l7(lower) -> %o4(lower)
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

END_NODES2: ! Test istream for CPU 2 ends
sethi %hi(0xdead0e0f), %o5
or    %o5, %lo(0xdead0e0f), %o5
! move %o5(lower) -> %o0(upper)
sllx %o5, 32, %o0
stw %o5, [%i5] 
ld [%i5], %f8
!---- flushing int results buffer----
mov %o0, %l5
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30

restore
retl
nop
!-----------------

! register usage:
! %i0 %i1 %i2 %i3 : base registers for 4 regions
! %i4 fixed pointer to per-cpu results area
! %l1 moving pointer to per-cpu FP results area
! %o7 moving pointer to per-cpu integer results area
! %i5 pointer to per-cpu private area
! %l0 holds lfsr, used as source of random bits 
! %l2 loop count register
! %f16 running counter for unique fp store values
! %f17 holds increment value for fp counter
! %l4 running counter for unique integer store values (increment value is always 1)
! %l5 move-to register for load values (simulation only)
! %f30 move-to register for FP values (simulation only)
! %l3 %l6 %l7 %o5 : 4 temporary registers
! %o0 %o1 %o2 %o3 %o4 : 5 integer results buffer registers
! %f0-f15 FP results buffer registers
! %f32-f47 FP block load/store registers

func3:
! 500 (dynamic) instruction sequence begins
save   %sp, -192, %sp

! Force %i0-%i3 to be 64-byte aligned
add %i0, 63, %i0
andn %i0, 63, %i0

add %i1, 63, %i1
andn %i1, 63, %i1

add %i2, 63, %i2
andn %i2, 63, %i2

add %i3, 63, %i3
andn %i3, 63, %i3

add %i4, 63, %i4
andn %i4, 63, %i4

add %i5, 63, %i5
andn %i5, 63, %i5


! Initialize pointer to FP load results area
mov   %i4, %l1

! Initialize pointer to integer load results area
sethi %hi(0x80000), %o7
or    %o7, %lo(0x80000), %o7
add  %o7, %l1, %o7 

! Initialize %f0-%f62 to 0xdeadbee0deadbee1
sethi %hi(0xdeadbee0), %l7
or    %l7, %lo(0xdeadbee0), %l7
stw   %l7, [%i5]
sethi %hi(0xdeadbee1), %l7
or    %l7, %lo(0xdeadbee1), %l7
stw   %l7, [%i5+4]
ldd [%i5], %f0
fmovd %f0, %f2
fmovd %f0, %f4
fmovd %f0, %f6
fmovd %f0, %f8
fmovd %f0, %f10
fmovd %f0, %f12
fmovd %f0, %f14
fmovd %f0, %f16
fmovd %f0, %f18
fmovd %f0, %f20
fmovd %f0, %f22
fmovd %f0, %f24
fmovd %f0, %f26
fmovd %f0, %f28
fmovd %f0, %f30
fmovd %f0, %f32
fmovd %f0, %f34
fmovd %f0, %f36
fmovd %f0, %f38
fmovd %f0, %f40
fmovd %f0, %f42
fmovd %f0, %f44
fmovd %f0, %f46
fmovd %f0, %f48
fmovd %f0, %f50
fmovd %f0, %f52
fmovd %f0, %f54
fmovd %f0, %f56
fmovd %f0, %f58
fmovd %f0, %f60
fmovd %f0, %f62

! Signature for extract_loads script to start extracting load values for this stream
sethi %hi(0x03deade1), %l7
or    %l7, %lo(0x03deade1), %l7
stw %l7, [%i5] 
ld [%i5], %f16

! Initialize running integer counter in register %l4
sethi %hi(0x1800001), %l4
or    %l4, %lo(0x1800001), %l4

! Initialize running FP counter in register %f16
sethi %hi(0x41000001), %l7
or    %l7, %lo(0x41000001), %l7
stw %l7, [%i5] 
ld [%i5], %f16

! Initialize FP counter increment value in register %f17 (constant)
sethi %hi(0x35800000), %l7
or    %l7, %lo(0x35800000), %l7
stw %l7, [%i5] 
ld [%i5], %f17 

! Initialize LFSR to 0xc6c^4
sethi %hi(0xc6c), %l0
or    %l0, %lo(0xc6c), %l0
mulx  %l0, %l0, %l0
mulx  %l0, %l0, %l0

!-- init shared addrs 6 to 7 ---
stx %g0, [%i1+80]

! use untouched cache-line (offset 4K) in replacement area for sync
sub %i1, %i0, %o5
add %i3, %o5, %o5
sub %o5, -4096, %o5

!-- begin of sync_init ---
or %g0, 1, %l3
or %g0, %l3, %l6
swap [%o5+4], %l6
membar #Sync
sync_init_1_3:
brnz,pt %l3, sync_init_1_3
lduw [%o5+4], %l3 ! delay slot
sync_init_2_3:
lduw [%o5], %l3
sub %l3, 1, %l6
cas [%o5], %l3, %l6
cmp %l3, %l6
bne,pt %xcc, sync_init_2_3
nop
membar #Sync
sync_init_3_3:
lduw [%o5], %l3 ! delay slot
brnz,pt %l3, sync_init_3_3
nop
!-- end of sync_init ---


BEGIN_NODES3: ! Test istream for CPU 3 begins

P1552: !BST [2] (maybe <- 0x41000001) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1553: !PREFETCH [3] (Int) (Branch target of P1596)
prefetch [%i0 + 32], 1
ba P1554
nop

TARGET1596:
ba RET1596
nop


P1554: !LD [5] (Int)
lduw [%i1 + 76], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1555: !BLD [2] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f0
membar #Sync 
! 4 addresses covered
fmovs %f3, %f2
fmovs %f8, %f3

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1555
nop
RET1555:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P1556: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P1557: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P1558: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P1559: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f6
fmovd %f36, %f18
fmovs %f18, %f7
fmovs %f19, %f8

P1560: !DWLD [1] (Int)
ldx [%i0 + 0], %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l3
or %l3, %o0, %o0
! move %l6(lower) -> %o1(upper)
sllx %l6, 32, %o1

P1561: !BST [15] (maybe <- 0x41000005) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P1562: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f9
fmovd %f36, %f10

P1563: !CASX [5] (maybe <- 0x1800001) (Int)
add %i1, 72, %l7
ldx [%l7], %l3
! move %l3(upper) -> %o1(lower)
srlx %l3, 32, %l6
or %l6, %o1, %o1
! move %l3(lower) -> %o2(upper)
sllx %l3, 32, %o2
mov  %l3, %l6
mov %l4, %l3
casx [%l7], %l6, %l3
! move %l3(upper) -> %o2(lower)
srlx %l3, 32, %l7
or %l7, %o2, %o2
! move %l3(lower) -> %o3(upper)
sllx %l3, 32, %o3
add  %l4, 1, %l4

P1564: !BST [2] (maybe <- 0x41000006) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1565: !REPLACEMENT [3] (Int)
sethi %hi(0x20), %l3
or %l3, %lo(0x20),  %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %i3, %l3, %l3
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1566: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P1567: !BLD [0] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13
fmovs %f19, %f14
fmovd %f34, %f18
fmovs %f19, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
fmovd %f40, %f0

P1568: !DWST [4] (maybe <- 0x1800002) (Int)
mov %l4, %o5 
sllx %o5, 32, %o5 
stx %o5, [%i0 + 64 ] 
add   %l4, 1, %l4

P1569: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P1570: !CAS [14] (maybe <- 0x1800003) (Int)
add %i3, 128, %o5
lduw [%o5], %l6
mov %l6, %l7
! move %l7(lower) -> %o3(lower)
or %l7, %o3, %o3
mov %l4, %o4
cas [%o5], %l7, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P1571: !LD [9] (Int)
lduw [%i1 + 512], %o5
! move %o5(lower) -> %o4(lower)
or %o5, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P1572: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P1573: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P1574: !DWST [6] (maybe <- 0x1800004) (Int)
sllx %l4, 32, %l3 
add   %l4, 1, %l4
or %l3, %l4, %l3
stx %l3, [%i1 + 80]
add   %l4, 1, %l4

P1575: !BST [6] (maybe <- 0x4100000a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1576: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P1577: !BST [4] (maybe <- 0x4100000d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P1578: !BST [8] (maybe <- 0x4100000e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P1579: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P1580: !BLD [5] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f36, %f2

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1580
nop
RET1580:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P1581: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P1582: !BST [14] (maybe <- 0x4100000f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P1583: !BST [4] (maybe <- 0x41000010) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P1584: !BST [6] (maybe <- 0x41000011) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1585: !BST [14] (maybe <- 0x41000014) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P1586: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P1587: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P1588: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P1589: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P1590: !BST [2] (maybe <- 0x41000015) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1591: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P1592: !PREFETCH [13] (Int) (CBR)
prefetch [%i3 + 64], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1592
nop
RET1592:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P1593: !BLD [0] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7
fmovs %f19, %f8
fmovd %f34, %f18
fmovs %f19, %f9
fmovd %f40, %f10

P1594: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P1595: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P1596: !BLD [0] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11
fmovs %f19, %f12
fmovd %f34, %f18
fmovs %f19, %f13
fmovd %f40, %f14

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1596
nop
RET1596:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P1597: !DWLD [1] (Int) (LE)
wr %g0, 0x88, %asi
ldxa [%i0 + 0] %asi, %o5
! move %o5(lower) -> %o0(upper)
sllx %o5, 32, %o0
! move %o5(upper) -> %o0(lower)
srlx %o5, 32, %l7
or %l7, %o0, %o0

P1598: !REPLACEMENT [0] (Int)
sethi %hi(0x0), %l3
or %l3, %lo(0x0),  %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %i3, %l3, %l3
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1599: !BST [10] (maybe <- 0x41000019) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1599
nop
RET1599:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P1600: !BST [6] (maybe <- 0x4100001a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1601: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P1602: !BLD [3] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
fmovs %f19, %f0
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f40, %f2

P1603: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P1604: !BLD [2] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f4
fmovd %f34, %f18
fmovs %f19, %f6
fmovd %f40, %f18
fmovs %f18, %f7

P1605: !BST [14] (maybe <- 0x4100001d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P1606: !BST [3] (maybe <- 0x4100001e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1607: !REPLACEMENT [2] (Int)
sethi %hi(0xc), %l3
or %l3, %lo(0xc),  %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %i3, %l3, %l3
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1608: !BLD [0] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f8
fmovd %f34, %f18
fmovs %f19, %f10
fmovd %f40, %f18
fmovs %f18, %f11

P1609: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P1610: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P1611: !DWST [4] (maybe <- 0x1800006) (Int)
mov %l4, %o5 
sllx %o5, 32, %o5 
stx %o5, [%i0 + 64 ] 
add   %l4, 1, %l4

P1612: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P1613: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f13
fmovd %f36, %f14
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30

P1614: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P1615: !BST [14] (maybe <- 0x41000022) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P1616: !BST [14] (maybe <- 0x41000023) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P1617: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f0
membar #Sync 
! 1 addresses covered

P1618: !BLD [2] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1
fmovs %f19, %f2
fmovd %f34, %f18
fmovs %f19, %f3
fmovd %f40, %f4

P1619: !BST [0] (maybe <- 0x41000024) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1620: !BST [0] (maybe <- 0x41000028) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1621: !ST [11] (maybe <- 0x4100002c) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i2 + 64 ]

P1622: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P1623: !BST [8] (maybe <- 0x4100002d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P1624: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P1625: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P1626: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P1627: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P1628: !BST [15] (maybe <- 0x4100002e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P1629: !ST [15] (maybe <- 0x1800007) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P1630: !BST [1] (maybe <- 0x4100002f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1631: !BST [0] (maybe <- 0x41000033) (FP) (Branch target of P1580)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 
ba P1632
nop

TARGET1580:
ba RET1580
nop


P1632: !BST [10] (maybe <- 0x41000037) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P1633: !BST [9] (maybe <- 0x41000038) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P1634: !BST [0] (maybe <- 0x41000039) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1635: !BST [11] (maybe <- 0x4100003d) (FP) (Branch target of P1966)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 
ba P1636
nop

TARGET1966:
ba RET1966
nop


P1636: !PREFETCH [0] (Int) (Branch target of P2021)
prefetch [%i0 + 0], 1
ba P1637
nop

TARGET2021:
ba RET2021
nop


P1637: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P1638: !LD [14] (Int) (Branch target of P1592)
lduw [%i3 + 128], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
ba P1639
nop

TARGET1592:
ba RET1592
nop


P1639: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P1640: !LD [13] (Int)
lduw [%i3 + 64], %o5
! move %o5(lower) -> %o1(lower)
or %o5, %o1, %o1

P1641: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P1642: !BST [4] (maybe <- 0x4100003e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P1643: !BST [10] (maybe <- 0x4100003f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P1644: !DWLD [3] (Int)
ldx [%i0 + 32], %o2
! move %o2(upper) -> %o2(upper)

P1645: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P1646: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f8
fmovd %f36, %f18
fmovs %f18, %f9
fmovs %f19, %f10

P1647: !BLD [4] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1647
nop
RET1647:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P1648: !CASX [10] (maybe <- 0x1800008) (Int)
add %i2, 32, %l7
ldx [%l7], %l3
! move %l3(upper) -> %o2(lower)
srlx %o2, 32, %o2
sllx %o2, 32, %o2
srlx %l3, 32, %l6
or %l6, %o2, %o2
! move %l3(lower) -> %o3(upper)
sllx %l3, 32, %o3
mov  %l3, %l6
sllx %l4, 32, %l3
casx [%l7], %l6, %l3
! move %l3(upper) -> %o3(lower)
srlx %l3, 32, %l7
or %l7, %o3, %o3
! move %l3(lower) -> %o4(upper)
sllx %l3, 32, %o4
add  %l4, 1, %l4

P1649: !BLD [10] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f12

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1649
nop
RET1649:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P1650: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P1651: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P1652: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P1653: !CAS [7] (maybe <- 0x1800009) (Int)
add %i1, 84, %o5
lduw [%o5], %l6
mov %l6, %l7
! move %l7(lower) -> %o4(lower)
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5
mov %l4, %o0
cas [%o5], %l7, %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
add   %l4, 1, %l4

P1654: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P1655: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P1656: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P1657: !ST [14] (maybe <- 0x180000a) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P1658: !BST [9] (maybe <- 0x41000040) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P1659: !REPLACEMENT [10] (Int)
sethi %hi(0x20), %l3
or %l3, %lo(0x20),  %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %i3, %l3, %l3
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1660: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P1661: !CAS [8] (maybe <- 0x180000b) (Int)
add %i1, 256, %l3
lduw [%l3], %l7
mov %l7, %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0
mov %l4, %o1
cas [%l3], %o5, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P1662: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P1663: !BST [3] (maybe <- 0x41000041) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1664: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P1665: !DWLD [10] (Int)
ldx [%i2 + 32], %o5
! move %o5(upper) -> %o1(lower)
srlx %o5, 32, %l7
or %l7, %o1, %o1

P1666: !CASX [7] (maybe <- 0x180000c) (Int)
add %i1, 80, %l6
ldx [%l6], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov %o2, %l3
sllx %l4, 32, %o3
add  %l4, 1, %l4
or   %l4, %o3, %o3
casx [%l6], %l3, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4

P1667: !BLD [0] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f14
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
fmovd %f34, %f18
fmovs %f19, %f0
fmovd %f40, %f18
fmovs %f18, %f1

P1668: !LD [2] (Int) (LE)
wr %g0, 0x88, %asi
lduwa [%i0 + 12] %asi, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P1669: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P1670: !BST [13] (maybe <- 0x41000045) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P1671: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P1672: !PREFETCH [11] (Int) (CBR)
prefetch [%i2 + 64], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1672
nop
RET1672:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P1673: !BST [6] (maybe <- 0x41000046) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1674: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P1675: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f4

P1676: !BLD [3] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5
fmovs %f19, %f6
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f40, %f8

P1677: !BST [1] (maybe <- 0x41000049) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1678: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f9
fmovd %f36, %f10

P1679: !BST [3] (maybe <- 0x4100004d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1680: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P1681: !MEMBAR (Int)
membar #StoreLoad

P1682: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P1683: !BST [6] (maybe <- 0x41000051) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1684: !BST [3] (maybe <- 0x41000054) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1685: !BST [8] (maybe <- 0x41000058) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P1686: !BST [4] (maybe <- 0x41000059) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P1687: !BST [4] (maybe <- 0x4100005a) (FP) (Branch target of P1672)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 
ba P1688
nop

TARGET1672:
ba RET1672
nop


P1688: !REPLACEMENT [10] (Int)
sethi %hi(0x20), %l7
or %l7, %lo(0x20),  %l7
sethi %hi(0x10000), %o5
or %o5, %lo(0x10000),  %o5
add %i3, %l7, %l7
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]

P1689: !MEMBAR (Int)
membar #StoreLoad

P1690: !BST [0] (maybe <- 0x4100005b) (FP) (Branch target of P1978)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 
ba P1691
nop

TARGET1978:
ba RET1978
nop


P1691: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P1692: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30

P1693: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f0
membar #Sync 
! 3 addresses covered
fmovs %f3, %f0
fmovs %f4, %f1
fmovs %f5, %f2

P1694: !BST [13] (maybe <- 0x4100005f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P1695: !BST [11] (maybe <- 0x41000060) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P1696: !DWST [12] (maybe <- 0x180000e) (Int)
mov %l4, %l7 
sllx %l7, 32, %l7 
stx %l7, [%i3 + 0 ] 
add   %l4, 1, %l4

P1697: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P1698: !BST [2] (maybe <- 0x41000061) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1699: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P1700: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P1701: !BST [0] (maybe <- 0x41000065) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1702: !ST [9] (maybe <- 0x180000f) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P1703: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P1704: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P1705: !BST [5] (maybe <- 0x41000069) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1706: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P1707: !BST [7] (maybe <- 0x4100006c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1708: !BST [7] (maybe <- 0x4100006f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1709: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f4
fmovd %f36, %f18
fmovs %f18, %f5
fmovs %f19, %f6

P1710: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P1711: !BST [5] (maybe <- 0x41000072) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1712: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f8
fmovd %f36, %f18
fmovs %f18, %f9
fmovs %f19, %f10

P1713: !NOP (Int)
nop

P1714: !BLD [0] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11
fmovs %f19, %f12
fmovd %f34, %f18
fmovs %f19, %f13
fmovd %f40, %f14

P1715: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P1716: !REPLACEMENT [0] (Int)
sethi %hi(0x0), %l7
or %l7, %lo(0x0),  %l7
sethi %hi(0x10000), %o5
or %o5, %lo(0x10000),  %o5
add %i3, %l7, %l7
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]

P1717: !BST [4] (maybe <- 0x41000075) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P1718: !BST [4] (maybe <- 0x41000076) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P1719: !BLD [1] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
fmovs %f19, %f0
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f40, %f2

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1719
nop
RET1719:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P1720: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f3

P1721: !BST [15] (maybe <- 0x41000077) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P1722: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P1723: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P1724: !BST [9] (maybe <- 0x41000078) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P1725: !DWST [8] (maybe <- 0x1800010) (Int)
mov %l4, %l7 
sllx %l7, 32, %l7 
stx %l7, [%i1 + 256 ] 
add   %l4, 1, %l4

P1726: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P1727: !BST [1] (maybe <- 0x41000079) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1728: !BLD [1] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5
fmovs %f19, %f6
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f40, %f8

P1729: !BST [5] (maybe <- 0x4100007d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1730: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P1731: !BST [3] (maybe <- 0x41000080) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1732: !DWST [6] (maybe <- 0x41000084) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=21 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
std %f20, [%i1 + 80]

P1733: !MEMBAR (Int)
membar #StoreLoad

P1734: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P1735: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P1736: !REPLACEMENT [5] (Int) (Branch target of P1848)
sethi %hi(0x4c), %l6
or %l6, %lo(0x4c),  %l6
sethi %hi(0x10000), %l7
or %l7, %lo(0x10000),  %l7
add %i3, %l6, %l6
add %l6, %l7, %l6
ld [%l6], %o5
st %o5, [%l6]
add %l6, %l7, %l6
ld [%l6], %o5
st %o5, [%l6]
add %l6, %l7, %l6
ld [%l6], %o5
st %o5, [%l6]
add %l6, %l7, %l6
ld [%l6], %o5
st %o5, [%l6]
ba P1737
nop

TARGET1848:
ba RET1848
nop


P1737: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P1738: !BLD [3] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11
fmovs %f19, %f12
fmovd %f34, %f18
fmovs %f19, %f13
fmovd %f40, %f14

P1739: !BST [2] (maybe <- 0x41000086) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1740: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P1741: !BST [7] (maybe <- 0x4100008a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1742: !BST [13] (maybe <- 0x4100008d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P1743: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30

P1744: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f0
membar #Sync 
! 1 addresses covered

P1745: !BST [8] (maybe <- 0x4100008e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P1746: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P1747: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P1748: !BST [10] (maybe <- 0x4100008f) (FP) (Branch target of P1647)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 
ba P1749
nop

TARGET1647:
ba RET1647
nop


P1749: !BST [7] (maybe <- 0x41000090) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1750: !BLD [2] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1
fmovs %f19, %f2
fmovd %f34, %f18
fmovs %f19, %f3
fmovd %f40, %f4

P1751: !NOP (Int)
nop

P1752: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P1753: !BLD [0] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f6
fmovd %f34, %f18
fmovs %f19, %f8
fmovd %f40, %f18
fmovs %f18, %f9

P1754: !BLD [2] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f10
fmovd %f34, %f18
fmovs %f19, %f12
fmovd %f40, %f18
fmovs %f18, %f13

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1754
nop
RET1754:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P1755: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P1756: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P1757: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30

P1758: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f0
membar #Sync 
! 1 addresses covered

P1759: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P1760: !BST [5] (maybe <- 0x41000093) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1760
nop
RET1760:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P1761: !BST [1] (maybe <- 0x41000096) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1762: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P1763: !BST [7] (maybe <- 0x4100009a) (FP) (Branch target of P1954)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 
ba P1764
nop

TARGET1954:
ba RET1954
nop


P1764: !MEMBAR (Int) (Branch target of P2017)
membar #StoreLoad
ba P1765
nop

TARGET2017:
ba RET2017
nop


P1765: !BLD [2] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1
fmovs %f19, %f2
fmovd %f34, %f18
fmovs %f19, %f3
fmovd %f40, %f4

P1766: !LD [13] (Int) (CBR)
lduw [%i3 + 64], %l7
! move %l7(lower) -> %o4(lower)
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1766
nop
RET1766:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P1767: !BST [12] (maybe <- 0x4100009d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P1768: !BLD [8] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1768
nop
RET1768:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P1769: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P1770: !BLD [1] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7
fmovs %f19, %f8
fmovd %f34, %f18
fmovs %f19, %f9
fmovd %f40, %f10

P1771: !BST [4] (maybe <- 0x4100009e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P1772: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P1773: !BST [15] (maybe <- 0x4100009f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P1774: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P1775: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P1776: !BST [9] (maybe <- 0x410000a0) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P1777: !BLD [3] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11
fmovs %f19, %f12
fmovd %f34, %f18
fmovs %f19, %f13
fmovd %f40, %f14

P1778: !BLD [7] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
fmovd %f36, %f0

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1778
nop
RET1778:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P1779: !BST [15] (maybe <- 0x410000a1) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P1780: !BLD [3] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f2
fmovd %f34, %f18
fmovs %f19, %f4
fmovd %f40, %f18
fmovs %f18, %f5

P1781: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P1782: !BST [12] (maybe <- 0x410000a2) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P1783: !BST [3] (maybe <- 0x410000a3) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1784: !CAS [3] (maybe <- 0x1800011) (Int)
add %i0, 32, %l3
lduw [%l3], %o0
mov %o0, %o5
! move %o5(lower) -> %o0(upper)
sllx %o5, 32, %o0
mov %l4, %l7
cas [%l3], %o5, %l7
! move %l7(lower) -> %o0(lower)
srl %l7, 0, %l3
or %l3, %o0, %o0
add   %l4, 1, %l4

P1785: !BST [8] (maybe <- 0x410000a7) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P1786: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P1787: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P1788: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f8

P1789: !BST [9] (maybe <- 0x410000a8) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P1790: !DWLD [12] (Int)
ldx [%i3 + 0], %o1
! move %o1(upper) -> %o1(upper)

P1791: !DWLD [3] (Int)
ldx [%i0 + 32], %l3
! move %l3(upper) -> %o1(lower)
srlx %o1, 32, %o1
sllx %o1, 32, %o1
srlx %l3, 32, %o5
or %o5, %o1, %o1

P1792: !BST [12] (maybe <- 0x410000a9) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P1793: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f9
fmovd %f36, %f10

P1794: !CAS [12] (maybe <- 0x1800012) (Int)
add %i3, 0, %l6
lduw [%l6], %o2
mov %o2, %l3
! move %l3(lower) -> %o2(upper)
sllx %l3, 32, %o2
mov %l4, %o5
cas [%l6], %l3, %o5
! move %o5(lower) -> %o2(lower)
srl %o5, 0, %l6
or %l6, %o2, %o2
add   %l4, 1, %l4

P1795: !DWST [14] (maybe <- 0x1800013) (Int)
mov %l4, %l3 
sllx %l3, 32, %l3 
stx %l3, [%i3 + 128 ] 
add   %l4, 1, %l4

P1796: !BST [6] (maybe <- 0x410000aa) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1797: !BLD [1] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f12
fmovd %f34, %f18
fmovs %f19, %f14
fmovd %f40, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30

P1798: !PREFETCH [12] (Int) (Branch target of P1813)
prefetch [%i3 + 0], 1
ba P1799
nop

TARGET1813:
ba RET1813
nop


P1799: !DWLD [0] (Int)
ldx [%i0 + 0], %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)

P1800: !DWLD [8] (Int)
ldx [%i1 + 256], %o4
! move %o4(upper) -> %o4(upper)

P1801: !BST [5] (maybe <- 0x410000ad) (FP) (Branch target of P1649)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 
ba P1802
nop

TARGET1649:
ba RET1649
nop


P1802: !BST [1] (maybe <- 0x410000b0) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1803: !BST [11] (maybe <- 0x410000b4) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P1804: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f0
membar #Sync 
! 1 addresses covered

P1805: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P1806: !DWST [0] (maybe <- 0x1800014) (Int)
sllx %l4, 32, %o5 
add   %l4, 1, %l4
or %o5, %l4, %o5
stx %o5, [%i0 + 0]
add   %l4, 1, %l4

P1807: !PREFETCH [3] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i0 + 32] %asi, 1

P1808: !BST [5] (maybe <- 0x410000b5) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1809: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P1810: !BST [10] (maybe <- 0x410000b8) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P1811: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P1812: !BLD [3] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3
fmovs %f19, %f4
fmovd %f34, %f18
fmovs %f19, %f5
fmovd %f40, %f6

P1813: !PREFETCH [5] (Int) (CBR)
prefetch [%i1 + 76], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1813
nop
RET1813:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P1814: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P1815: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P1816: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P1817: !BST [6] (maybe <- 0x410000b9) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1818: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P1819: !LD [10] (Int) (Branch target of P1555)
lduw [%i2 + 32], %l6
! move %l6(lower) -> %o4(lower)
srlx %o4, 32, %o4
sllx %o4, 32, %o4
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5
ba P1820
nop

TARGET1555:
ba RET1555
nop


P1820: !BST [4] (maybe <- 0x410000bc) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P1821: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P1822: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P1823: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P1824: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P1825: !BLD [2] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9
fmovs %f19, %f10
fmovd %f34, %f18
fmovs %f19, %f11
fmovd %f40, %f12

P1826: !BST [6] (maybe <- 0x410000bd) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1827: !REPLACEMENT [1] (Int)
sethi %hi(0x4), %l3
or %l3, %lo(0x4),  %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %i3, %l3, %l3
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1828: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P1829: !DWST [14] (maybe <- 0x1800016) (Int)
mov %l4, %o5 
sllx %o5, 32, %o5 
stx %o5, [%i3 + 128 ] 
add   %l4, 1, %l4

P1830: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P1831: !BST [11] (maybe <- 0x410000c0) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P1832: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P1833: !BLD [14] (FP) (Branch target of P1768)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13
ba P1834
nop

TARGET1768:
ba RET1768
nop


P1834: !CASX [1] (maybe <- 0x1800017) (Int) (LE)
sllx %l4, 32, %l7
add  %l4, 1, %l4
or   %l4, %l7, %l7
! Change double-word-level endianess (big endian <-> little endian) 
sethi %hi(0xff00ff00), %l6
or %l6, %lo(0xff00ff00), %l6
sllx %l6, 32, %o5
or %l6, %o5, %l6 
and %l7, %l6, %o5
srlx %o5, 8, %o5
sllx %l7, 8, %l7
and %l7, %l6, %l7
or %l7, %o5, %l7 
sethi %hi(0xffff0000), %l6
or %l6, %lo(0xffff0000), %l6
srlx %l7, 16, %o5
andn %o5, %l6, %o5
andn %l7, %l6, %l7
sllx %l7, 16, %l7
or %l7, %o5, %l7 
srlx %l7, 32, %o5
sllx %l7, 32, %l7
or %l7, %o5, %o5 
wr %g0, 0x88, %asi
add %i0, 0, %l7
ldxa [%l7] %asi, %l3
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
! move %l3(upper) -> %o0(lower)
srlx %l3, 32, %l6
or %l6, %o0, %o0
mov %l3, %l6
mov  %o5, %l3
casxa [%l7] %asi, %l6, %l3
! move %l3(lower) -> %o1(upper)
sllx %l3, 32, %o1
! move %l3(upper) -> %o1(lower)
srlx %l3, 32, %l7
or %l7, %o1, %o1
add  %l4, 1, %l4

P1835: !BST [0] (maybe <- 0x410000c1) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1836: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P1837: !REPLACEMENT [5] (Int)
sethi %hi(0x4c), %l3
or %l3, %lo(0x4c),  %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %i3, %l3, %l3
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1838: !BST [10] (maybe <- 0x410000c5) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P1839: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P1840: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P1841: !REPLACEMENT [9] (Int)
sethi %hi(0x200), %l7
or %l7, %lo(0x200),  %l7
sethi %hi(0x10000), %o5
or %o5, %lo(0x10000),  %o5
add %i3, %l7, %l7
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]

P1842: !BLD [1] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f14
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
fmovd %f34, %f18
fmovs %f19, %f0
fmovd %f40, %f18
fmovs %f18, %f1

P1843: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P1844: !BST [8] (maybe <- 0x410000c6) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P1845: !BST [14] (maybe <- 0x410000c7) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P1846: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f2
fmovd %f36, %f18
fmovs %f18, %f3
fmovs %f19, %f4

P1847: !BLD [2] (FP) (Branch target of P1754)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5
fmovs %f19, %f6
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f40, %f8
ba P1848
nop

TARGET1754:
ba RET1754
nop


P1848: !BLD [13] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1848
nop
RET1848:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P1849: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P1850: !BST [3] (maybe <- 0x410000c8) (FP) (Branch target of P1887)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 
ba P1851
nop

TARGET1887:
ba RET1887
nop


P1851: !DWST [0] (maybe <- 0x1800019) (Int)
sllx %l4, 32, %o5 
add   %l4, 1, %l4
or %o5, %l4, %o5
stx %o5, [%i0 + 0]
add   %l4, 1, %l4

P1852: !BST [1] (maybe <- 0x410000cc) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1853: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P1854: !BLD [2] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11
fmovs %f19, %f12
fmovd %f34, %f18
fmovs %f19, %f13
fmovd %f40, %f14

P1855: !BST [6] (maybe <- 0x410000d0) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1856: !BST [10] (maybe <- 0x410000d3) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P1857: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30

P1858: !BST [10] (maybe <- 0x410000d4) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P1859: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P1860: !BST [2] (maybe <- 0x410000d5) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1861: !BLD [2] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f0
membar #Sync 
! 4 addresses covered
fmovs %f3, %f2
fmovs %f8, %f3

P1862: !BST [4] (maybe <- 0x410000d9) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P1863: !REPLACEMENT [3] (Int)
sethi %hi(0x20), %l3
or %l3, %lo(0x20),  %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %i3, %l3, %l3
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P1864: !BST [15] (maybe <- 0x410000da) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P1865: !BST [14] (maybe <- 0x410000db) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P1866: !DWST [3] (maybe <- 0x180001b) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i0 + 32 ] 
add   %l4, 1, %l4

P1867: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P1868: !BST [3] (maybe <- 0x410000dc) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1869: !LD [2] (FP)
ld [%i0 + 12], %f4
! 1 addresses covered

P1870: !BST [2] (maybe <- 0x410000e0) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1871: !ST [14] (maybe <- 0x180001c) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P1872: !BST [6] (maybe <- 0x410000e4) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1873: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P1874: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P1875: !PREFETCH [10] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i2 + 32] %asi, 1

P1876: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P1877: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P1878: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f8
fmovd %f36, %f18
fmovs %f18, %f9
fmovs %f19, %f10

P1879: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P1880: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P1881: !BST [9] (maybe <- 0x410000e7) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P1882: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P1883: !BLD [1] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f12
fmovd %f34, %f18
fmovs %f19, %f14
fmovd %f40, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30

P1884: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f0
membar #Sync 
! 1 addresses covered

P1885: !BST [2] (maybe <- 0x410000e8) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1886: !BST [7] (maybe <- 0x410000ec) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1887: !PREFETCH [8] (Int) (CBR)
prefetch [%i1 + 256], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1887
nop
RET1887:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P1888: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P1889: !BST [2] (maybe <- 0x410000ef) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1890: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f36, %f2

P1891: !BST [2] (maybe <- 0x410000f3) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1892: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P1893: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P1894: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P1895: !BST [6] (maybe <- 0x410000f7) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1895
nop
RET1895:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P1896: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P1897: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P1898: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P1899: !ST [14] (maybe <- 0x410000fa) (FP) (CBR)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i3 + 128 ]

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1899
nop
RET1899:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P1900: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P1901: !BST [3] (maybe <- 0x410000fb) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1902: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P1903: !BLD [2] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7
fmovs %f19, %f8
fmovd %f34, %f18
fmovs %f19, %f9
fmovd %f40, %f10

P1904: !BLD [1] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11
fmovs %f19, %f12
fmovd %f34, %f18
fmovs %f19, %f13
fmovd %f40, %f14

P1905: !DWST [3] (maybe <- 0x410000ff) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
std %f20, [%i0 + 32]

P1906: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
fmovd %f36, %f0

P1907: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P1908: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P1909: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f3

P1910: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P1911: !PREFETCH [9] (Int) (Branch target of P2014)
prefetch [%i1 + 512], 1
ba P1912
nop

TARGET2014:
ba RET2014
nop


P1912: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P1913: !BST [8] (maybe <- 0x41000100) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P1914: !BST [6] (maybe <- 0x41000101) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1915: !LD [14] (Int)
lduw [%i3 + 128], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P1916: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P1917: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P1918: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P1919: !BST [10] (maybe <- 0x41000104) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P1920: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P1921: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P1922: !BLD [3] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f4
fmovd %f34, %f18
fmovs %f19, %f6
fmovd %f40, %f18
fmovs %f18, %f7

P1923: !BLD [15] (FP) (Branch target of P1719)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8
ba P1924
nop

TARGET1719:
ba RET1719
nop


P1924: !BST [8] (maybe <- 0x41000105) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P1925: !BST [0] (maybe <- 0x41000106) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1926: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P1927: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P1928: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P1929: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P1930: !BST [1] (maybe <- 0x4100010a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1931: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P1932: !ST [10] (maybe <- 0x180001d) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P1933: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P1934: !BLD [2] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f12
fmovd %f34, %f18
fmovs %f19, %f14
fmovd %f40, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30

P1935: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P1936: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f0
membar #Sync 
! 3 addresses covered
fmovs %f3, %f0
fmovs %f4, %f1
fmovs %f5, %f2

P1937: !BST [15] (maybe <- 0x4100010e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P1938: !BST [4] (maybe <- 0x4100010f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P1939: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P1940: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P1941: !BLD [2] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5
fmovs %f19, %f6
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f40, %f8

P1942: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P1943: !BST [2] (maybe <- 0x41000110) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1944: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P1945: !REPLACEMENT [4] (Int)
sethi %hi(0x40), %l7
or %l7, %lo(0x40),  %l7
sethi %hi(0x10000), %o5
or %o5, %lo(0x10000),  %o5
add %i3, %l7, %l7
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]

P1946: !BST [7] (maybe <- 0x41000114) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1947: !PREFETCH [6] (Int) (Branch target of P1778)
prefetch [%i1 + 80], 1
ba P1948
nop

TARGET1778:
ba RET1778
nop


P1948: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P1949: !BST [2] (maybe <- 0x41000117) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1950: !PREFETCH [10] (Int) (Branch target of P1766)
prefetch [%i2 + 32], 1
ba P1951
nop

TARGET1766:
ba RET1766
nop


P1951: !DWST [5] (maybe <- 0x180001e) (Int)
mov %l4, %o5 
stx %o5, [%i1 + 72]
add   %l4, 1, %l4

P1952: !BLD [3] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f10
fmovd %f34, %f18
fmovs %f19, %f12
fmovd %f40, %f18
fmovs %f18, %f13

P1953: !BST [3] (maybe <- 0x4100011b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1954: !PREFETCH [0] (Int) (CBR)
prefetch [%i0 + 0], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1954
nop
RET1954:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P1955: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f14
fmovd %f36, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
fmovs %f19, %f0

P1956: !CASX [12] (maybe <- 0x180001f) (Int)
add %i3, 0, %o5
ldx [%o5], %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l7
or %l7, %o2, %o2
! move %l6(lower) -> %o3(upper)
sllx %l6, 32, %o3
mov  %l6, %l7
sllx %l4, 32, %l6
casx [%o5], %l7, %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %o5
or %o5, %o3, %o3
! move %l6(lower) -> %o4(upper)
sllx %l6, 32, %o4
add  %l4, 1, %l4

P1957: !BST [6] (maybe <- 0x4100011f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1958: !BST [1] (maybe <- 0x41000122) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1959: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P1960: !PREFETCH [13] (Int) (Branch target of P1599)
prefetch [%i3 + 64], 1
ba P1961
nop

TARGET1599:
ba RET1599
nop


P1961: !BST [2] (maybe <- 0x41000126) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1962: !DWST [3] (maybe <- 0x1800020) (Int)
mov %l4, %o5 
sllx %o5, 32, %o5 
stx %o5, [%i0 + 32 ] 
add   %l4, 1, %l4

P1963: !BST [11] (maybe <- 0x4100012a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P1964: !DWLD [10] (Int)
ldx [%i2 + 32], %l7
! move %l7(upper) -> %o4(lower)
srlx %l7, 32, %l6
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P1965: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P1966: !CAS [8] (maybe <- 0x1800021) (Int) (CBR)
add %i1, 256, %l3
lduw [%l3], %o0
mov %o0, %o5
! move %o5(lower) -> %o0(upper)
sllx %o5, 32, %o0
mov %l4, %l7
cas [%l3], %o5, %l7
! move %l7(lower) -> %o0(lower)
srl %l7, 0, %l3
or %l3, %o0, %o0
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1966
nop
RET1966:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P1967: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P1968: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P1969: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P1970: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P1971: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P1972: !LD [12] (Int)
lduw [%i3 + 0], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P1973: !BST [14] (maybe <- 0x4100012b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P1974: !PREFETCH [2] (Int) (Branch target of P1899)
prefetch [%i0 + 12], 1
ba P1975
nop

TARGET1899:
ba RET1899
nop


P1975: !BLD [1] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3
fmovs %f19, %f4
fmovd %f34, %f18
fmovs %f19, %f5
fmovd %f40, %f6

P1976: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P1977: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P1978: !PREFETCH [7] (Int) (CBR)
prefetch [%i1 + 84], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1978
nop
RET1978:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P1979: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P1980: !CASX [10] (maybe <- 0x1800022) (Int)
add %i2, 32, %o5
ldx [%o5], %l6
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %l7
or %l7, %o1, %o1
! move %l6(lower) -> %o2(upper)
sllx %l6, 32, %o2
mov  %l6, %l7
sllx %l4, 32, %l6
casx [%o5], %l7, %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %o5
or %o5, %o2, %o2
! move %l6(lower) -> %o3(upper)
sllx %l6, 32, %o3
add  %l4, 1, %l4

P1981: !DWLD [12] (Int)
ldx [%i3 + 0], %o5
! move %o5(upper) -> %o3(lower)
srlx %o5, 32, %l7
or %l7, %o3, %o3

P1982: !SWAP [3] (maybe <- 0x1800023) (Int)
mov %l4, %o4
swap  [%i0 + 32], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P1983: !DWLD [8] (Int)
ldx [%i1 + 256], %l3
! move %l3(upper) -> %o4(lower)
srlx %l3, 32, %o5
or %o5, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P1984: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P1985: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P1986: !BST [5] (maybe <- 0x4100012c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1987: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P1988: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f10
fmovd %f36, %f18
fmovs %f18, %f11
fmovs %f19, %f12

P1989: !CAS [15] (maybe <- 0x1800024) (Int)
add %i3, 192, %l6
lduw [%l6], %o0
mov %o0, %l3
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
mov %l4, %o5
cas [%l6], %l3, %o5
! move %o5(lower) -> %o0(lower)
srl %o5, 0, %l6
or %l6, %o0, %o0
add   %l4, 1, %l4

P1990: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P1991: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f14
fmovd %f36, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
fmovs %f19, %f0

P1992: !BLD [3] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1
fmovs %f19, %f2
fmovd %f34, %f18
fmovs %f19, %f3
fmovd %f40, %f4

P1993: !DWST [0] (maybe <- 0x4100012f) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=21 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
std %f20, [%i0 + 0]

P1994: !DWLD [13] (Int)
ldx [%i3 + 64], %o1
! move %o1(upper) -> %o1(upper)

P1995: !CAS [6] (maybe <- 0x1800025) (Int)
add %i1, 80, %l7
lduw [%l7], %l3
mov %l3, %l6
! move %l6(lower) -> %o1(lower)
srlx %o1, 32, %o1
sllx %o1, 32, %o1
or %l6, %o1, %o1
mov %l4, %o2
cas [%l7], %l6, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P1996: !LD [11] (Int)
lduw [%i2 + 64], %l7
! move %l7(lower) -> %o2(lower)
or %l7, %o2, %o2

P1997: !DWLD [1] (Int)
ldx [%i0 + 0], %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)

P1998: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P1999: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f5

P2000: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f6

P2001: !BLD [3] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7
fmovs %f19, %f8
fmovd %f34, %f18
fmovs %f19, %f9
fmovd %f40, %f10

P2002: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P2003: !BST [1] (maybe <- 0x41000131) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2004: !BLD [3] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f12
fmovd %f34, %f18
fmovs %f19, %f14
fmovd %f40, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30

P2005: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f0
membar #Sync 
! 3 addresses covered
fmovs %f3, %f0
fmovs %f4, %f1
fmovs %f5, %f2

P2006: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P2007: !BST [8] (maybe <- 0x41000135) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P2008: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P2009: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P2010: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f6
fmovd %f36, %f18
fmovs %f18, %f7
fmovs %f19, %f8

P2011: !BLD [0] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9
fmovs %f19, %f10
fmovd %f34, %f18
fmovs %f19, %f11
fmovd %f40, %f12

P2012: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f13
fmovd %f36, %f14
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30

P2013: !ST [14] (maybe <- 0x1800026) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P2014: !BST [5] (maybe <- 0x41000136) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2014
nop
RET2014:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P2015: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f0
membar #Sync 
! 3 addresses covered
fmovs %f3, %f0
fmovs %f4, %f1
fmovs %f5, %f2

P2016: !ST [0] (maybe <- 0x1800027) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P2017: !BLD [3] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3
fmovs %f19, %f4
fmovd %f34, %f18
fmovs %f19, %f5
fmovd %f40, %f6

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2017
nop
RET2017:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P2018: !REPLACEMENT [1] (Int)
sethi %hi(0x4), %l7
or %l7, %lo(0x4),  %l7
sethi %hi(0x10000), %o5
or %o5, %lo(0x10000),  %o5
add %i3, %l7, %l7
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]

P2019: !BST [9] (maybe <- 0x41000139) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P2020: !BST [8] (maybe <- 0x4100013a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P2021: !BST [14] (maybe <- 0x4100013b) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2021
nop
RET2021:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P2022: !BST [4] (maybe <- 0x4100013c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P2023: !BST [2] (maybe <- 0x4100013d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2024: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P2025: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f36, %f8

P2026: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f10
fmovd %f36, %f18
fmovs %f18, %f11
fmovs %f19, %f12

P2027: !BST [9] (maybe <- 0x41000141) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P2028: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P2029: !BLD [3] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f14
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
fmovd %f34, %f18
fmovs %f19, %f0
fmovd %f40, %f18
fmovs %f18, %f1

P2030: !BLD [11] (FP) (Branch target of P1760)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2
ba P2031
nop

TARGET1760:
ba RET1760
nop


P2031: !BLD [0] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3
fmovs %f19, %f4
fmovd %f34, %f18
fmovs %f19, %f5
fmovd %f40, %f6

P2032: !BLD [5] (FP) (Branch target of P1895)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f36, %f8
ba P2033
nop

TARGET1895:
ba RET1895
nop


P2033: !BLD [1] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f10
fmovd %f34, %f18
fmovs %f19, %f12
fmovd %f40, %f18
fmovs %f18, %f13

P2034: !PREFETCH [3] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i0 + 32] %asi, 1

P2035: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P2036: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P2037: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P2038: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P2039: !BST [2] (maybe <- 0x41000142) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2040: !BST [12] (maybe <- 0x41000146) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P2041: !DWLD [8] (FP)
ldd [%i1 + 256], %f18
! 1 addresses covered
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30

P2042: !ST [14] (maybe <- 0x1800028) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P2043: !BLD [0] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f0
membar #Sync 
! 4 addresses covered
fmovs %f3, %f2
fmovs %f8, %f3

P2044: !DWLD [0] (FP)
ldd [%i0 + 0], %f4
! 2 addresses covered

P2045: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P2046: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P2047: !BST [2] (maybe <- 0x41000147) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2048: !BST [8] (maybe <- 0x4100014b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P2049: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f8
fmovd %f36, %f18
fmovs %f18, %f9
fmovs %f19, %f10

P2050: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P2051: !BST [1] (maybe <- 0x4100014c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2052: !MEMBAR (Int)
membar #StoreLoad

P2053: !LD [0] (Int)
lduw [%i0 + 0], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P2054: !LD [1] (Int)
lduw [%i0 + 4], %l6
! move %l6(lower) -> %o4(lower)
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P2055: !LD [2] (Int)
lduw [%i0 + 12], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P2056: !LD [3] (Int)
lduw [%i0 + 32], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

P2057: !LD [4] (Int)
lduw [%i0 + 64], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P2058: !LD [5] (Int)
lduw [%i1 + 76], %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1

P2059: !LD [6] (Int)
lduw [%i1 + 80], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P2060: !LD [7] (Int)
lduw [%i1 + 84], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2

P2061: !LD [8] (Int)
lduw [%i1 + 256], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P2062: !LD [9] (Int) (LE)
wr %g0, 0x88, %asi
lduwa [%i1 + 512] %asi, %l6
! move %l6(lower) -> %o3(lower)
or %l6, %o3, %o3

P2063: !LD [10] (Int)
lduw [%i2 + 32], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P2064: !LD [11] (Int) (LE)
wr %g0, 0x88, %asi
lduwa [%i2 + 64] %asi, %l6
! move %l6(lower) -> %o4(lower)
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P2065: !LD [12] (Int)
lduw [%i3 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P2066: !LD [13] (Int)
lduw [%i3 + 64], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

P2067: !LD [14] (Int)
lduw [%i3 + 128], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P2068: !LD [15] (Int)
lduw [%i3 + 192], %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1

END_NODES3: ! Test istream for CPU 3 ends
sethi %hi(0xdead0e0f), %l7
or    %l7, %lo(0xdead0e0f), %l7
! move %l7(lower) -> %o2(upper)
sllx %l7, 32, %o2
stw %l7, [%i5] 
ld [%i5], %f12
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30

restore
retl
nop
!-----------------

! register usage:
! %i0 %i1 %i2 %i3 : base registers for 4 regions
! %i4 fixed pointer to per-cpu results area
! %l1 moving pointer to per-cpu FP results area
! %o7 moving pointer to per-cpu integer results area
! %i5 pointer to per-cpu private area
! %l0 holds lfsr, used as source of random bits 
! %l2 loop count register
! %f16 running counter for unique fp store values
! %f17 holds increment value for fp counter
! %l4 running counter for unique integer store values (increment value is always 1)
! %l5 move-to register for load values (simulation only)
! %f30 move-to register for FP values (simulation only)
! %l3 %l6 %l7 %o5 : 4 temporary registers
! %o0 %o1 %o2 %o3 %o4 : 5 integer results buffer registers
! %f0-f15 FP results buffer registers
! %f32-f47 FP block load/store registers

func4:
! 500 (dynamic) instruction sequence begins
save   %sp, -192, %sp

! Force %i0-%i3 to be 64-byte aligned
add %i0, 63, %i0
andn %i0, 63, %i0

add %i1, 63, %i1
andn %i1, 63, %i1

add %i2, 63, %i2
andn %i2, 63, %i2

add %i3, 63, %i3
andn %i3, 63, %i3

add %i4, 63, %i4
andn %i4, 63, %i4

add %i5, 63, %i5
andn %i5, 63, %i5


! Initialize pointer to FP load results area
mov   %i4, %l1

! Initialize pointer to integer load results area
sethi %hi(0x80000), %o7
or    %o7, %lo(0x80000), %o7
add  %o7, %l1, %o7 

! Initialize %f0-%f62 to 0xdeadbee0deadbee1
sethi %hi(0xdeadbee0), %l6
or    %l6, %lo(0xdeadbee0), %l6
stw   %l6, [%i5]
sethi %hi(0xdeadbee1), %l6
or    %l6, %lo(0xdeadbee1), %l6
stw   %l6, [%i5+4]
ldd [%i5], %f0
fmovd %f0, %f2
fmovd %f0, %f4
fmovd %f0, %f6
fmovd %f0, %f8
fmovd %f0, %f10
fmovd %f0, %f12
fmovd %f0, %f14
fmovd %f0, %f16
fmovd %f0, %f18
fmovd %f0, %f20
fmovd %f0, %f22
fmovd %f0, %f24
fmovd %f0, %f26
fmovd %f0, %f28
fmovd %f0, %f30
fmovd %f0, %f32
fmovd %f0, %f34
fmovd %f0, %f36
fmovd %f0, %f38
fmovd %f0, %f40
fmovd %f0, %f42
fmovd %f0, %f44
fmovd %f0, %f46
fmovd %f0, %f48
fmovd %f0, %f50
fmovd %f0, %f52
fmovd %f0, %f54
fmovd %f0, %f56
fmovd %f0, %f58
fmovd %f0, %f60
fmovd %f0, %f62

! Signature for extract_loads script to start extracting load values for this stream
sethi %hi(0x04deade1), %l6
or    %l6, %lo(0x04deade1), %l6
stw %l6, [%i5] 
ld [%i5], %f16

! Initialize running integer counter in register %l4
sethi %hi(0x2000001), %l4
or    %l4, %lo(0x2000001), %l4

! Initialize running FP counter in register %f16
sethi %hi(0x41800001), %l6
or    %l6, %lo(0x41800001), %l6
stw %l6, [%i5] 
ld [%i5], %f16

! Initialize FP counter increment value in register %f17 (constant)
sethi %hi(0x36000000), %l6
or    %l6, %lo(0x36000000), %l6
stw %l6, [%i5] 
ld [%i5], %f17 

! Initialize LFSR to 0x2210^4
sethi %hi(0x2210), %l0
or    %l0, %lo(0x2210), %l0
mulx  %l0, %l0, %l0
mulx  %l0, %l0, %l0

!-- init shared addrs 8 to 9 ---
stx %g0, [%i1+256]
stx %g0, [%i1+512]

! use untouched cache-line (offset 4K) in replacement area for sync
sub %i1, %i0, %l7
add %i3, %l7, %l7
sub %l7, -4096, %l7

!-- begin of sync_init ---
or %g0, 1, %o5
or %g0, %o5, %l3
swap [%l7+4], %l3
membar #Sync
sync_init_1_4:
brnz,pt %o5, sync_init_1_4
lduw [%l7+4], %o5 ! delay slot
sync_init_2_4:
lduw [%l7], %o5
sub %o5, 1, %l3
cas [%l7], %o5, %l3
cmp %o5, %l3
bne,pt %xcc, sync_init_2_4
nop
membar #Sync
sync_init_3_4:
lduw [%l7], %o5 ! delay slot
brnz,pt %o5, sync_init_3_4
nop
!-- end of sync_init ---


BEGIN_NODES4: ! Test istream for CPU 4 begins

P2069: !BST [11] (maybe <- 0x41800001) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P2070: !REPLACEMENT [15] (Int)
sethi %hi(0xc0), %l3
or %l3, %lo(0xc0),  %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %i3, %l3, %l3
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2071: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f0
membar #Sync 
! 1 addresses covered

P2072: !BST [12] (maybe <- 0x41800002) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P2073: !REPLACEMENT [0] (Int)
sethi %hi(0x0), %l7
or %l7, %lo(0x0),  %l7
sethi %hi(0x10000), %o5
or %o5, %lo(0x10000),  %o5
add %i3, %l7, %l7
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]

P2074: !BST [8] (maybe <- 0x41800003) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P2075: !ST [13] (maybe <- 0x2000001) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P2076: !BST [1] (maybe <- 0x41800004) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2077: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f36, %f2

P2078: !DWST [3] (maybe <- 0x2000002) (Int)
mov %l4, %l7 
sllx %l7, 32, %l7 
stx %l7, [%i0 + 32 ] 
add   %l4, 1, %l4

P2079: !ST [11] (maybe <- 0x2000003) (Int) (LE)
wr %g0, 0x88, %asi
! Change single-word-level endianess (big endian <-> little endian) 
sethi %hi(0xff00ff00), %l7
or %l7, %lo(0xff00ff00), %l7
and %l4, %l7, %o5
srl %o5, 8, %o5
sll %l4, 8, %l6
and %l6, %l7, %l6
or %l6, %o5, %l6
srl %l6, 16, %o5
sll %l6, 16, %l6
srl %l6, 0, %l6
or %l6, %o5, %l6
stwa   %l6, [%i2 + 64] %asi
add   %l4, 1, %l4

P2080: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P2081: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P2082: !BST [15] (maybe <- 0x41800008) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P2083: !BLD [1] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5
fmovs %f19, %f6
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f40, %f8

P2084: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P2085: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f10
fmovd %f36, %f18
fmovs %f18, %f11
fmovs %f19, %f12

P2086: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P2087: !BST [7] (maybe <- 0x41800009) (FP) (Branch target of P2444)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 
ba P2088
nop

TARGET2444:
ba RET2444
nop


P2088: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P2089: !BST [8] (maybe <- 0x4180000c) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2089
nop
RET2089:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P2090: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P2091: !DWLD [6] (Int)
ldx [%i1 + 80], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)

P2092: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P2093: !BST [4] (maybe <- 0x4180000d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P2094: !BST [10] (maybe <- 0x4180000e) (FP) (Branch target of P2489)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 
ba P2095
nop

TARGET2489:
ba RET2489
nop


P2095: !BST [7] (maybe <- 0x4180000f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2096: !BST [2] (maybe <- 0x41800012) (FP) (Branch target of P2089)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 
ba P2097
nop

TARGET2089:
ba RET2089
nop


P2097: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P2098: !BLD [15] (FP) (Branch target of P2193)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13
ba P2099
nop

TARGET2193:
ba RET2193
nop


P2099: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P2100: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P2101: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P2102: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P2103: !ST [13] (maybe <- 0x2000004) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P2104: !BST [2] (maybe <- 0x41800016) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2105: !SWAP [11] (maybe <- 0x2000005) (Int)
mov %l4, %o1
swap  [%i2 + 64], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P2106: !BST [8] (maybe <- 0x4180001a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P2107: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P2108: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P2109: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P2110: !BST [8] (maybe <- 0x4180001b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P2111: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30

P2112: !ST [14] (maybe <- 0x2000006) (Int) (CBR)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2112
nop
RET2112:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P2113: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f0
membar #Sync 
! 1 addresses covered

P2114: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P2115: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P2116: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P2117: !NOP (Int)
nop

P2118: !BLD [0] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3
fmovs %f19, %f4
fmovd %f34, %f18
fmovs %f19, %f5
fmovd %f40, %f6

P2119: !BLD [0] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7
fmovs %f19, %f8
fmovd %f34, %f18
fmovs %f19, %f9
fmovd %f40, %f10

P2120: !BST [10] (maybe <- 0x4180001c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P2121: !BST [15] (maybe <- 0x4180001d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P2122: !BLD [3] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11
fmovs %f19, %f12
fmovd %f34, %f18
fmovs %f19, %f13
fmovd %f40, %f14

P2123: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30

P2124: !BLD [0] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f0
membar #Sync 
! 4 addresses covered
fmovs %f3, %f2
fmovs %f8, %f3

P2125: !BLD [3] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f4
fmovd %f34, %f18
fmovs %f19, %f6
fmovd %f40, %f18
fmovs %f18, %f7

P2126: !BST [3] (maybe <- 0x4180001e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2127: !BST [3] (maybe <- 0x41800022) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2128: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f8
fmovd %f36, %f18
fmovs %f18, %f9
fmovs %f19, %f10

P2129: !BST [1] (maybe <- 0x41800026) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2130: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P2131: !DWLD [12] (Int)
ldx [%i3 + 0], %o5
! move %o5(upper) -> %o1(lower)
srlx %o5, 32, %l7
or %l7, %o1, %o1

P2132: !BST [10] (maybe <- 0x4180002a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P2133: !BLD [2] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f12
fmovd %f34, %f18
fmovs %f19, %f14
fmovd %f40, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30

P2134: !BST [7] (maybe <- 0x4180002b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2135: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f0
membar #Sync 
! 1 addresses covered

P2136: !BLD [2] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1
fmovs %f19, %f2
fmovd %f34, %f18
fmovs %f19, %f3
fmovd %f40, %f4

P2137: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P2138: !BST [10] (maybe <- 0x4180002e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P2139: !SWAP [11] (maybe <- 0x2000007) (Int) (LE)
wr %g0, 0x88, %asi
mov %l4, %o2
! Change single-word-level endianess (big endian <-> little endian) 
sethi %hi(0xff00ff00), %l6
or %l6, %lo(0xff00ff00), %l6
and %o2, %l6, %l7
srl %l7, 8, %l7
sll %o2, 8, %o2
and %o2, %l6, %o2
or %o2, %l7, %o2
srl %o2, 16, %l7
sll %o2, 16, %o2
srl %o2, 0, %o2
or %o2, %l7, %o2
swapa  [%i2 + 64] %asi, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P2140: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P2141: !SWAP [12] (maybe <- 0x2000008) (Int)
mov %l4, %l7
swap  [%i3 + 0], %l7
! move %l7(lower) -> %o2(lower)
srl %l7, 0, %l3
or %l3, %o2, %o2
add   %l4, 1, %l4

P2142: !BST [2] (maybe <- 0x4180002f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2143: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f36, %f8

P2144: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P2145: !BLD [0] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11
fmovs %f19, %f12
fmovd %f34, %f18
fmovs %f19, %f13
fmovd %f40, %f14

P2146: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P2147: !BST [5] (maybe <- 0x41800033) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2148: !REPLACEMENT [14] (Int)
sethi %hi(0x80), %l6
or %l6, %lo(0x80),  %l6
sethi %hi(0x10000), %l7
or %l7, %lo(0x10000),  %l7
add %i3, %l6, %l6
add %l6, %l7, %l6
ld [%l6], %o5
st %o5, [%l6]
add %l6, %l7, %l6
ld [%l6], %o5
st %o5, [%l6]
add %l6, %l7, %l6
ld [%l6], %o5
st %o5, [%l6]
add %l6, %l7, %l6
ld [%l6], %o5
st %o5, [%l6]

P2149: !BST [5] (maybe <- 0x41800036) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2150: !BST [4] (maybe <- 0x41800039) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P2151: !BST [4] (maybe <- 0x4180003a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P2152: !BST [1] (maybe <- 0x4180003b) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2152
nop
RET2152:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P2153: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30

P2154: !BST [7] (maybe <- 0x4180003f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2155: !BST [0] (maybe <- 0x41800042) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2156: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f0
membar #Sync 
! 3 addresses covered
fmovs %f3, %f0
fmovs %f4, %f1
fmovs %f5, %f2

P2157: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P2158: !LD [7] (Int)
lduw [%i1 + 84], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P2159: !BST [1] (maybe <- 0x41800046) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2159
nop
RET2159:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P2160: !BST [3] (maybe <- 0x4180004a) (FP) (Branch target of P2544)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 
ba P2161
nop

TARGET2544:
ba RET2544
nop


P2161: !BST [14] (maybe <- 0x4180004e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P2162: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P2163: !ST [1] (maybe <- 0x2000009) (Int) (LE)
wr %g0, 0x88, %asi
! Change single-word-level endianess (big endian <-> little endian) 
sethi %hi(0xff00ff00), %l3
or %l3, %lo(0xff00ff00), %l3
and %l4, %l3, %l6
srl %l6, 8, %l6
sll %l4, 8, %o5
and %o5, %l3, %o5
or %o5, %l6, %o5
srl %o5, 16, %l6
sll %o5, 16, %o5
srl %o5, 0, %o5
or %o5, %l6, %o5
stwa   %o5, [%i0 + 4] %asi
add   %l4, 1, %l4

P2164: !LD [11] (Int)
lduw [%i2 + 64], %o5
! move %o5(lower) -> %o3(lower)
or %o5, %o3, %o3

P2165: !BST [13] (maybe <- 0x4180004f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P2166: !BST [5] (maybe <- 0x41800050) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2167: !BST [15] (maybe <- 0x41800053) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P2168: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f3
fmovd %f36, %f4

P2169: !DWST [0] (maybe <- 0x41800054) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=21 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
std %f20, [%i0 + 0]

P2170: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f6
fmovd %f36, %f18
fmovs %f18, %f7
fmovs %f19, %f8

P2171: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P2172: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P2173: !BST [8] (maybe <- 0x41800056) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P2174: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P2175: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P2176: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P2177: !SWAP [11] (maybe <- 0x200000a) (Int)
mov %l4, %o4
swap  [%i2 + 64], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P2178: !BST [5] (maybe <- 0x41800057) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2179: !LD [13] (Int)
lduw [%i3 + 64], %l7
! move %l7(lower) -> %o4(lower)
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P2180: !BST [9] (maybe <- 0x4180005a) (FP) (Branch target of P2413)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 
ba P2181
nop

TARGET2413:
ba RET2413
nop


P2181: !DWLD [14] (FP)
ldd [%i3 + 128], %f18
! 1 addresses covered
fmovs %f18, %f9

P2182: !BST [3] (maybe <- 0x4180005b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2183: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P2184: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P2185: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P2186: !DWST [2] (maybe <- 0x200000b) (Int) (CBR)
mov %l4, %l6 
stx %l6, [%i0 + 8]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2186
nop
RET2186:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P2187: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P2188: !LD [9] (Int) (LE)
wr %g0, 0x88, %asi
lduwa [%i1 + 512] %asi, %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P2189: !BST [8] (maybe <- 0x4180005f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P2190: !PREFETCH [15] (Int) (CBR)
prefetch [%i3 + 192], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2190
nop
RET2190:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P2191: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P2192: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P2193: !LD [1] (Int) (CBR)
lduw [%i0 + 4], %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2193
nop
RET2193:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P2194: !BST [8] (maybe <- 0x41800060) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P2195: !BLD [2] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13
fmovs %f19, %f14
fmovd %f34, %f18
fmovs %f19, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
fmovd %f40, %f0

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2195
nop
RET2195:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P2196: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P2197: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P2198: !BLD [10] (FP) (Branch target of P2239)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f2
ba P2199
nop

TARGET2239:
ba RET2239
nop


P2199: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P2200: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f4
fmovd %f36, %f18
fmovs %f18, %f5
fmovs %f19, %f6

P2201: !BST [5] (maybe <- 0x41800061) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2202: !BST [14] (maybe <- 0x41800064) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P2203: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f7

P2204: !ST [2] (maybe <- 0x200000c) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P2205: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P2206: !REPLACEMENT [13] (Int) (CBR)
sethi %hi(0x40), %o5
or %o5, %lo(0x40),  %o5
sethi %hi(0x10000), %l3
or %l3, %lo(0x10000),  %l3
add %i3, %o5, %o5
add %o5, %l3, %o5
ld [%o5], %l6
st %l6, [%o5]
add %o5, %l3, %o5
ld [%o5], %l6
st %l6, [%o5]
add %o5, %l3, %o5
ld [%o5], %l6
st %l6, [%o5]
add %o5, %l3, %o5
ld [%o5], %l6
st %l6, [%o5]

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2206
nop
RET2206:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P2207: !PREFETCH [6] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i1 + 80] %asi, 1

P2208: !PREFETCH [6] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i1 + 80] %asi, 1

P2209: !BST [15] (maybe <- 0x41800065) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P2210: !DWLD [1] (Int)
ldx [%i0 + 0], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)

P2211: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P2212: !CAS [1] (maybe <- 0x200000d) (Int)
add %i0, 4, %l6
lduw [%l6], %o2
mov %o2, %l3
! move %l3(lower) -> %o2(upper)
sllx %l3, 32, %o2
mov %l4, %o5
cas [%l6], %l3, %o5
! move %o5(lower) -> %o2(lower)
srl %o5, 0, %l6
or %l6, %o2, %o2
add   %l4, 1, %l4

P2213: !BLD [3] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9
fmovs %f19, %f10
fmovd %f34, %f18
fmovs %f19, %f11
fmovd %f40, %f12

P2214: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f13
fmovd %f36, %f14
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30

P2215: !MEMBAR (Int)
membar #StoreLoad

P2216: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P2217: !REPLACEMENT [3] (Int)
sethi %hi(0x20), %l3
or %l3, %lo(0x20),  %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %i3, %l3, %l3
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2218: !BST [12] (maybe <- 0x41800066) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P2219: !PREFETCH [14] (Int) (Branch target of P2327)
prefetch [%i3 + 128], 1
ba P2220
nop

TARGET2327:
ba RET2327
nop


P2220: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P2221: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f0
membar #Sync 
! 1 addresses covered

P2222: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P2223: !BST [4] (maybe <- 0x41800067) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P2224: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P2225: !BLD [3] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f2
fmovd %f34, %f18
fmovs %f19, %f4
fmovd %f40, %f18
fmovs %f18, %f5

P2226: !BST [15] (maybe <- 0x41800068) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P2227: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P2228: !BST [5] (maybe <- 0x41800069) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2229: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f36, %f8

P2230: !REPLACEMENT [3] (Int)
sethi %hi(0x20), %o5
or %o5, %lo(0x20),  %o5
sethi %hi(0x10000), %l3
or %l3, %lo(0x10000),  %l3
add %i3, %o5, %o5
add %o5, %l3, %o5
ld [%o5], %l6
st %l6, [%o5]
add %o5, %l3, %o5
ld [%o5], %l6
st %l6, [%o5]
add %o5, %l3, %o5
ld [%o5], %l6
st %l6, [%o5]
add %o5, %l3, %o5
ld [%o5], %l6
st %l6, [%o5]

P2231: !BST [10] (maybe <- 0x4180006c) (FP) (Branch target of P2190)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 
ba P2232
nop

TARGET2190:
ba RET2190
nop


P2232: !BST [2] (maybe <- 0x4180006d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2233: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P2234: !BST [6] (maybe <- 0x41800071) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2235: !PREFETCH [2] (Int) (Branch target of P2352)
prefetch [%i0 + 12], 1
ba P2236
nop

TARGET2352:
ba RET2352
nop


P2236: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P2237: !BLD [10] (FP) (Branch target of P2341)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f11
ba P2238
nop

TARGET2341:
ba RET2341
nop


P2238: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P2239: !BST [5] (maybe <- 0x41800074) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2239
nop
RET2239:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P2240: !DWLD [14] (Int)
ldx [%i3 + 128], %o3
! move %o3(upper) -> %o3(upper)

P2241: !REPLACEMENT [1] (Int)
sethi %hi(0x4), %l6
or %l6, %lo(0x4),  %l6
sethi %hi(0x10000), %l7
or %l7, %lo(0x10000),  %l7
add %i3, %l6, %l6
add %l6, %l7, %l6
ld [%l6], %o5
st %o5, [%l6]
add %l6, %l7, %l6
ld [%l6], %o5
st %o5, [%l6]
add %l6, %l7, %l6
ld [%l6], %o5
st %o5, [%l6]
add %l6, %l7, %l6
ld [%l6], %o5
st %o5, [%l6]

P2242: !BST [11] (maybe <- 0x41800077) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P2243: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P2244: !BLD [2] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13
fmovs %f19, %f14
fmovd %f34, %f18
fmovs %f19, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
fmovd %f40, %f0

P2245: !BLD [3] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1
fmovs %f19, %f2
fmovd %f34, %f18
fmovs %f19, %f3
fmovd %f40, %f4

P2246: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P2247: !BLD [2] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f6
fmovd %f34, %f18
fmovs %f19, %f8
fmovd %f40, %f18
fmovs %f18, %f9

P2248: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P2249: !BST [6] (maybe <- 0x41800078) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2250: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P2251: !BST [12] (maybe <- 0x4180007b) (FP) (Branch target of P2152)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 
ba P2252
nop

TARGET2152:
ba RET2152
nop


P2252: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P2253: !BST [10] (maybe <- 0x4180007c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P2254: !BST [13] (maybe <- 0x4180007d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P2255: !CAS [15] (maybe <- 0x200000e) (Int)
add %i3, 192, %l3
lduw [%l3], %l7
mov %l7, %o5
! move %o5(lower) -> %o3(lower)
srlx %o3, 32, %o3
sllx %o3, 32, %o3
or %o5, %o3, %o3
mov %l4, %o4
cas [%l3], %o5, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P2256: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P2257: !DWST [1] (maybe <- 0x200000f) (Int)
sllx %l4, 32, %o5 
add   %l4, 1, %l4
or %o5, %l4, %o5
stx %o5, [%i0 + 0]
add   %l4, 1, %l4

P2258: !BST [9] (maybe <- 0x4180007e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P2259: !BST [6] (maybe <- 0x4180007f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2260: !REPLACEMENT [14] (Int)
sethi %hi(0x80), %l3
or %l3, %lo(0x80),  %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %i3, %l3, %l3
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2261: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P2262: !ST [5] (maybe <- 0x2000011) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P2263: !BLD [2] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11
fmovs %f19, %f12
fmovd %f34, %f18
fmovs %f19, %f13
fmovd %f40, %f14

P2264: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P2265: !BST [4] (maybe <- 0x41800082) (FP) (Branch target of P2584)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 
ba P2266
nop

TARGET2584:
ba RET2584
nop


P2266: !BST [12] (maybe <- 0x41800083) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P2267: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P2268: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30

P2269: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f0
membar #Sync 
! 1 addresses covered

P2270: !BST [12] (maybe <- 0x41800084) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P2271: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P2272: !BLD [8] (FP) (Branch target of P2427)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1
ba P2273
nop

TARGET2427:
ba RET2427
nop


P2273: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P2274: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f2
fmovd %f36, %f18
fmovs %f18, %f3
fmovs %f19, %f4

P2275: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f5
fmovd %f36, %f6

P2276: !BST [3] (maybe <- 0x41800085) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2277: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P2278: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P2279: !BLD [1] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9
fmovs %f19, %f10
fmovd %f34, %f18
fmovs %f19, %f11
fmovd %f40, %f12

P2280: !BST [2] (maybe <- 0x41800089) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2281: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P2282: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f14
fmovd %f36, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
fmovs %f19, %f0

P2283: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P2284: !CASX [3] (maybe <- 0x2000012) (Int) (CBR)
add %i0, 32, %l7
ldx [%l7], %l3
! move %l3(upper) -> %o4(lower)
srlx %l3, 32, %l6
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
mov  %l3, %l6
sllx %l4, 32, %l3
casx [%l7], %l6, %l3
! move %l3(upper) -> %o0(lower)
srlx %l3, 32, %l7
or %l7, %o0, %o0
! move %l3(lower) -> %o1(upper)
sllx %l3, 32, %o1
add  %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2284
nop
RET2284:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P2285: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P2286: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P2287: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P2288: !PREFETCH [4] (Int) (Branch target of P2446)
prefetch [%i0 + 64], 1
ba P2289
nop

TARGET2446:
ba RET2446
nop


P2289: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P2290: !BLD [0] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f4
fmovd %f34, %f18
fmovs %f19, %f6
fmovd %f40, %f18
fmovs %f18, %f7

P2291: !BST [8] (maybe <- 0x4180008d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P2292: !BST [6] (maybe <- 0x4180008e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2293: !ST [2] (maybe <- 0x41800091) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i0 + 12 ]

P2294: !BST [9] (maybe <- 0x41800092) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P2295: !BST [2] (maybe <- 0x41800093) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2296: !LD [3] (Int)
lduw [%i0 + 32], %l7
! move %l7(lower) -> %o1(lower)
or %l7, %o1, %o1

P2297: !BST [14] (maybe <- 0x41800097) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P2298: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P2299: !BST [9] (maybe <- 0x41800098) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P2300: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P2301: !BST [5] (maybe <- 0x41800099) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2302: !CAS [5] (maybe <- 0x2000013) (Int)
add %i1, 76, %l6
lduw [%l6], %o2
mov %o2, %l3
! move %l3(lower) -> %o2(upper)
sllx %l3, 32, %o2
mov %l4, %o5
cas [%l6], %l3, %o5
! move %o5(lower) -> %o2(lower)
srl %o5, 0, %l6
or %l6, %o2, %o2
add   %l4, 1, %l4

P2303: !BST [9] (maybe <- 0x4180009c) (FP) (Branch target of P2441)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 
ba P2304
nop

TARGET2441:
ba RET2441
nop


P2304: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f9
fmovd %f36, %f10

P2305: !PREFETCH [1] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i0 + 4] %asi, 1

P2306: !BST [11] (maybe <- 0x4180009d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P2307: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P2308: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P2309: !DWLD [13] (Int)
ldx [%i3 + 64], %o3
! move %o3(upper) -> %o3(upper)

P2310: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P2311: !REPLACEMENT [3] (Int)
sethi %hi(0x20), %l3
or %l3, %lo(0x20),  %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %i3, %l3, %l3
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2312: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P2313: !BST [12] (maybe <- 0x4180009e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P2314: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P2315: !BST [2] (maybe <- 0x4180009f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2316: !BST [10] (maybe <- 0x418000a3) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P2317: !LD [8] (Int)
lduw [%i1 + 256], %l6
! move %l6(lower) -> %o3(lower)
srlx %o3, 32, %o3
sllx %o3, 32, %o3
or %l6, %o3, %o3

P2318: !PREFETCH [13] (Int) (CBR) (Branch target of P2410)
prefetch [%i3 + 64], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2318
nop
RET2318:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0

ba P2319
nop

TARGET2410:
ba RET2410
nop


P2319: !PREFETCH [10] (Int) (CBR)
prefetch [%i2 + 32], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2319
nop
RET2319:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P2320: !LD [3] (Int)
lduw [%i0 + 32], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P2321: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f14

P2322: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30

P2323: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f0
membar #Sync 
! 1 addresses covered

P2324: !BST [4] (maybe <- 0x418000a4) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P2325: !BST [6] (maybe <- 0x418000a5) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2326: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P2327: !BST [1] (maybe <- 0x418000a8) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2327
nop
RET2327:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P2328: !CASX [13] (maybe <- 0x2000014) (Int)
add %i3, 64, %l6
ldx [%l6], %o5
! move %o5(upper) -> %o4(lower)
srlx %o5, 32, %l3
or %l3, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5
! move %o5(lower) -> %o0(upper)
sllx %o5, 32, %o0
mov  %o5, %l3
sllx %l4, 32, %o5
casx [%l6], %l3, %o5
! move %o5(upper) -> %o0(lower)
srlx %o5, 32, %l6
or %l6, %o0, %o0
! move %o5(lower) -> %o1(upper)
sllx %o5, 32, %o1
add  %l4, 1, %l4

P2329: !PREFETCH [7] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i1 + 84] %asi, 1

P2330: !BST [0] (maybe <- 0x418000ac) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2331: !PREFETCH [7] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i1 + 84] %asi, 1

P2332: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f2
fmovd %f36, %f18
fmovs %f18, %f3
fmovs %f19, %f4

P2333: !BST [15] (maybe <- 0x418000b0) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2333
nop
RET2333:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P2334: !PREFETCH [8] (Int) (Branch target of P2159)
prefetch [%i1 + 256], 1
ba P2335
nop

TARGET2159:
ba RET2159
nop


P2335: !BST [7] (maybe <- 0x418000b1) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2336: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P2337: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P2338: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P2339: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P2340: !BST [2] (maybe <- 0x418000b4) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2341: !BST [8] (maybe <- 0x418000b8) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2341
nop
RET2341:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P2342: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P2343: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P2344: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P2345: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P2346: !BST [8] (maybe <- 0x418000b9) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P2347: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P2348: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P2349: !BST [4] (maybe <- 0x418000ba) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P2350: !DWST [5] (maybe <- 0x2000015) (Int)
mov %l4, %o5 
stx %o5, [%i1 + 72]
add   %l4, 1, %l4

P2351: !PREFETCH [15] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i3 + 192] %asi, 1

P2352: !BLD [13] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2352
nop
RET2352:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P2353: !BST [7] (maybe <- 0x418000bb) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2354: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P2355: !MEMBAR (Int)
membar #StoreLoad

P2356: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f12
fmovd %f36, %f18
fmovs %f18, %f13
fmovs %f19, %f14

P2357: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
fmovd %f36, %f0

P2358: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P2359: !CASX [13] (maybe <- 0x2000016) (Int) (Branch target of P2396)
add %i3, 64, %o5
ldx [%o5], %l6
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %l7
or %l7, %o1, %o1
! move %l6(lower) -> %o2(upper)
sllx %l6, 32, %o2
mov  %l6, %l7
sllx %l4, 32, %l6
casx [%o5], %l7, %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %o5
or %o5, %o2, %o2
! move %l6(lower) -> %o3(upper)
sllx %l6, 32, %o3
add  %l4, 1, %l4
ba P2360
nop

TARGET2396:
ba RET2396
nop


P2360: !BST [10] (maybe <- 0x418000be) (FP) (Branch target of P2477)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 
ba P2361
nop

TARGET2477:
ba RET2477
nop


P2361: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P2362: !DWLD [14] (Int)
ldx [%i3 + 128], %l7
! move %l7(upper) -> %o3(lower)
srlx %l7, 32, %l6
or %l6, %o3, %o3

P2363: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P2364: !BST [7] (maybe <- 0x418000bf) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2365: !BLD [2] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3
fmovs %f19, %f4
fmovd %f34, %f18
fmovs %f19, %f5
fmovd %f40, %f6

P2366: !BST [11] (maybe <- 0x418000c2) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P2367: !BLD [1] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7
fmovs %f19, %f8
fmovd %f34, %f18
fmovs %f19, %f9
fmovd %f40, %f10

P2368: !PREFETCH [1] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i0 + 4] %asi, 1

P2369: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P2370: !BLD [8] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2370
nop
RET2370:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P2371: !BST [6] (maybe <- 0x418000c3) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2371
nop
RET2371:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P2372: !BST [13] (maybe <- 0x418000c6) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P2373: !LD [9] (Int)
lduw [%i1 + 512], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P2374: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P2375: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P2376: !BST [7] (maybe <- 0x418000c7) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2377: !REPLACEMENT [3] (Int)
sethi %hi(0x20), %l7
or %l7, %lo(0x20),  %l7
sethi %hi(0x10000), %o5
or %o5, %lo(0x10000),  %o5
add %i3, %l7, %l7
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]

P2378: !PREFETCH [0] (Int) (Branch target of P2195)
prefetch [%i0 + 0], 1
ba P2379
nop

TARGET2195:
ba RET2195
nop


P2379: !BLD [0] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13
fmovs %f19, %f14
fmovd %f34, %f18
fmovs %f19, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
fmovd %f40, %f0

P2380: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f36, %f2

P2381: !BST [8] (maybe <- 0x418000ca) (FP) (Branch target of P2284)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 
ba P2382
nop

TARGET2284:
ba RET2284
nop


P2382: !CAS [15] (maybe <- 0x2000017) (Int)
add %i3, 192, %l6
lduw [%l6], %o5
mov %o5, %l3
! move %l3(lower) -> %o4(lower)
or %l3, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5
mov %l4, %o0
cas [%l6], %l3, %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
add   %l4, 1, %l4

P2383: !ST [13] (maybe <- 0x2000018) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P2384: !BST [5] (maybe <- 0x418000cb) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2385: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P2386: !BST [0] (maybe <- 0x418000ce) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2387: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P2388: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f6

P2389: !REPLACEMENT [6] (Int)
sethi %hi(0x50), %l6
or %l6, %lo(0x50),  %l6
sethi %hi(0x10000), %l7
or %l7, %lo(0x10000),  %l7
add %i3, %l6, %l6
add %l6, %l7, %l6
ld [%l6], %o5
st %o5, [%l6]
add %l6, %l7, %l6
ld [%l6], %o5
st %o5, [%l6]
add %l6, %l7, %l6
ld [%l6], %o5
st %o5, [%l6]
add %l6, %l7, %l6
ld [%l6], %o5
st %o5, [%l6]

P2390: !BST [7] (maybe <- 0x418000d2) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2391: !BST [14] (maybe <- 0x418000d5) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P2392: !BST [11] (maybe <- 0x418000d6) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P2393: !BST [3] (maybe <- 0x418000d7) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2394: !MEMBAR (Int)
membar #StoreLoad

P2395: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P2396: !BST [7] (maybe <- 0x418000db) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2396
nop
RET2396:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P2397: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P2398: !BLD [1] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f8
fmovd %f34, %f18
fmovs %f19, %f10
fmovd %f40, %f18
fmovs %f18, %f11

P2399: !BST [15] (maybe <- 0x418000de) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P2400: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P2401: !REPLACEMENT [14] (Int)
sethi %hi(0x80), %o5
or %o5, %lo(0x80),  %o5
sethi %hi(0x10000), %l3
or %l3, %lo(0x10000),  %l3
add %i3, %o5, %o5
add %o5, %l3, %o5
ld [%o5], %l6
st %l6, [%o5]
add %o5, %l3, %o5
ld [%o5], %l6
st %l6, [%o5]
add %o5, %l3, %o5
ld [%o5], %l6
st %l6, [%o5]
add %o5, %l3, %o5
ld [%o5], %l6
st %l6, [%o5]

P2402: !ST [4] (maybe <- 0x2000019) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P2403: !BST [12] (maybe <- 0x418000df) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P2404: !BST [14] (maybe <- 0x418000e0) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P2405: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P2406: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P2407: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f12
fmovd %f36, %f18
fmovs %f18, %f13
fmovs %f19, %f14

P2408: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30

P2409: !BST [0] (maybe <- 0x418000e1) (FP) (Branch target of P2319)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 
ba P2410
nop

TARGET2319:
ba RET2319
nop


P2410: !PREFETCH [2] (Int) (CBR)
prefetch [%i0 + 12], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2410
nop
RET2410:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P2411: !BST [2] (maybe <- 0x418000e5) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2412: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f0
membar #Sync 
! 1 addresses covered

P2413: !BLD [14] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2413
nop
RET2413:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P2414: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P2415: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P2416: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P2417: !BST [4] (maybe <- 0x418000e9) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P2418: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P2419: !BLD [8] (FP) (Branch target of P2112)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2
ba P2420
nop

TARGET2112:
ba RET2112
nop


P2420: !CAS [0] (maybe <- 0x200001a) (Int)
add %i0, 0, %o5
lduw [%o5], %l6
mov %l6, %l7
! move %l7(lower) -> %o0(lower)
or %l7, %o0, %o0
mov %l4, %o1
cas [%o5], %l7, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P2421: !BLD [0] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3
fmovs %f19, %f4
fmovd %f34, %f18
fmovs %f19, %f5
fmovd %f40, %f6

P2422: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P2423: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P2424: !BLD [0] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7
fmovs %f19, %f8
fmovd %f34, %f18
fmovs %f19, %f9
fmovd %f40, %f10

P2425: !DWLD [4] (Int)
ldx [%i0 + 64], %o5
! move %o5(upper) -> %o1(lower)
srlx %o5, 32, %l7
or %l7, %o1, %o1

P2426: !BST [13] (maybe <- 0x418000ea) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P2427: !BST [10] (maybe <- 0x418000eb) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2427
nop
RET2427:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P2428: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P2429: !BST [0] (maybe <- 0x418000ec) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2430: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P2431: !REPLACEMENT [0] (Int)
sethi %hi(0x0), %l7
or %l7, %lo(0x0),  %l7
sethi %hi(0x10000), %o5
or %o5, %lo(0x10000),  %o5
add %i3, %l7, %l7
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]

P2432: !PREFETCH [6] (Int) (Branch target of P2540)
prefetch [%i1 + 80], 1
ba P2433
nop

TARGET2540:
ba RET2540
nop


P2433: !BLD [2] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11
fmovs %f19, %f12
fmovd %f34, %f18
fmovs %f19, %f13
fmovd %f40, %f14

P2434: !CAS [15] (maybe <- 0x200001b) (Int)
add %i3, 192, %l7
lduw [%l7], %o2
mov %o2, %l6
! move %l6(lower) -> %o2(upper)
sllx %l6, 32, %o2
mov %l4, %l3
cas [%l7], %l6, %l3
! move %l3(lower) -> %o2(lower)
srl %l3, 0, %l7
or %l7, %o2, %o2
add   %l4, 1, %l4

P2435: !BST [2] (maybe <- 0x418000f0) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2436: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P2437: !BST [6] (maybe <- 0x418000f4) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2438: !BST [10] (maybe <- 0x418000f7) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P2439: !BLD [2] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
fmovs %f19, %f0
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f40, %f2

P2440: !CASX [15] (maybe <- 0x200001c) (Int)
add %i3, 192, %o5
ldx [%o5], %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
mov  %o3, %l7
sllx %l4, 32, %o4
casx [%o5], %l7, %o4
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5
add  %l4, 1, %l4

P2441: !BLD [7] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f3
fmovd %f36, %f4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2441
nop
RET2441:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P2442: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f6

P2443: !BST [9] (maybe <- 0x418000f8) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P2444: !BLD [2] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7
fmovs %f19, %f8
fmovd %f34, %f18
fmovs %f19, %f9
fmovd %f40, %f10

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2444
nop
RET2444:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P2445: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P2446: !BST [11] (maybe <- 0x418000f9) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2446
nop
RET2446:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P2447: !BST [4] (maybe <- 0x418000fa) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P2448: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P2449: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P2450: !DWST [3] (maybe <- 0x418000fb) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
std %f20, [%i0 + 32]

P2451: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P2452: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P2453: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P2454: !BST [8] (maybe <- 0x418000fc) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P2455: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P2456: !BST [11] (maybe <- 0x418000fd) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P2457: !BST [3] (maybe <- 0x418000fe) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2458: !DWST [12] (maybe <- 0x200001d) (Int)
mov %l4, %l7 
sllx %l7, 32, %l7 
stx %l7, [%i3 + 0 ] 
add   %l4, 1, %l4

P2459: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P2460: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f12
fmovd %f36, %f18
fmovs %f18, %f13
fmovs %f19, %f14

P2461: !BST [9] (maybe <- 0x41800102) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P2462: !BST [9] (maybe <- 0x41800103) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P2463: !BLD [1] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
fmovs %f19, %f0
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f40, %f2

P2464: !BLD [3] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3
fmovs %f19, %f4
fmovd %f34, %f18
fmovs %f19, %f5
fmovd %f40, %f6

P2465: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f36, %f8

P2466: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P2467: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P2468: !BST [15] (maybe <- 0x41800104) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P2469: !REPLACEMENT [14] (Int)
sethi %hi(0x80), %l7
or %l7, %lo(0x80),  %l7
sethi %hi(0x10000), %o5
or %o5, %lo(0x10000),  %o5
add %i3, %l7, %l7
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]

P2470: !DWLD [8] (Int)
ldx [%i1 + 256], %o0
! move %o0(upper) -> %o0(upper)

P2471: !PREFETCH [7] (Int) (Branch target of P2206)
prefetch [%i1 + 84], 1
ba P2472
nop

TARGET2206:
ba RET2206
nop


P2472: !BST [4] (maybe <- 0x41800105) (FP) (Branch target of P2524)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 
ba P2473
nop

TARGET2524:
ba RET2524
nop


P2473: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P2474: !DWLD [1] (Int)
ldx [%i0 + 0], %o5
! move %o5(upper) -> %o0(lower)
srlx %o0, 32, %o0
sllx %o0, 32, %o0
srlx %o5, 32, %l7
or %l7, %o0, %o0
! move %o5(lower) -> %o1(upper)
sllx %o5, 32, %o1

P2475: !PREFETCH [2] (Int) (CBR)
prefetch [%i0 + 12], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2475
nop
RET2475:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P2476: !CAS [0] (maybe <- 0x200001e) (Int)
add %i0, 0, %l7
lduw [%l7], %l3
mov %l3, %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1
mov %l4, %o2
cas [%l7], %l6, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P2477: !REPLACEMENT [9] (Int) (CBR)
sethi %hi(0x200), %l6
or %l6, %lo(0x200),  %l6
sethi %hi(0x10000), %l7
or %l7, %lo(0x10000),  %l7
add %i3, %l6, %l6
add %l6, %l7, %l6
ld [%l6], %o5
st %o5, [%l6]
add %l6, %l7, %l6
ld [%l6], %o5
st %o5, [%l6]
add %l6, %l7, %l6
ld [%l6], %o5
st %o5, [%l6]
add %l6, %l7, %l6
ld [%l6], %o5
st %o5, [%l6]

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2477
nop
RET2477:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P2478: !BLD [3] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11
fmovs %f19, %f12
fmovd %f34, %f18
fmovs %f19, %f13
fmovd %f40, %f14

P2479: !REPLACEMENT [8] (Int)
sethi %hi(0x100), %l6
or %l6, %lo(0x100),  %l6
sethi %hi(0x10000), %l7
or %l7, %lo(0x10000),  %l7
add %i3, %l6, %l6
add %l6, %l7, %l6
ld [%l6], %o5
st %o5, [%l6]
add %l6, %l7, %l6
ld [%l6], %o5
st %o5, [%l6]
add %l6, %l7, %l6
ld [%l6], %o5
st %o5, [%l6]
add %l6, %l7, %l6
ld [%l6], %o5
st %o5, [%l6]

P2480: !BLD [3] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
fmovs %f19, %f0
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f40, %f2

P2481: !BST [1] (maybe <- 0x41800106) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2482: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P2483: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P2484: !BST [13] (maybe <- 0x4180010a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P2485: !CAS [6] (maybe <- 0x200001f) (Int)
add %i1, 80, %o5
lduw [%o5], %l6
mov %l6, %l7
! move %l7(lower) -> %o2(lower)
or %l7, %o2, %o2
mov %l4, %o3
cas [%o5], %l7, %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P2486: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P2487: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P2488: !BST [0] (maybe <- 0x4180010b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2489: !PREFETCH [0] (Int) (CBR)
prefetch [%i0 + 0], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2489
nop
RET2489:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P2490: !BST [11] (maybe <- 0x4180010f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P2491: !BST [5] (maybe <- 0x41800110) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2492: !BLD [11] (FP) (Branch target of P2318)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4
ba P2493
nop

TARGET2318:
ba RET2318
nop


P2493: !DWLD [8] (Int) (Branch target of P2186)
ldx [%i1 + 256], %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %l3
or %l3, %o3, %o3
ba P2494
nop

TARGET2186:
ba RET2186
nop


P2494: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P2495: !CAS [14] (maybe <- 0x2000020) (Int)
add %i3, 128, %o5
lduw [%o5], %o4
mov %o4, %l7
! move %l7(lower) -> %o4(upper)
sllx %l7, 32, %o4
mov %l4, %l6
cas [%o5], %l7, %l6
! move %l6(lower) -> %o4(lower)
srl %l6, 0, %o5
or %o5, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5
add   %l4, 1, %l4

P2496: !BST [14] (maybe <- 0x41800113) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P2497: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P2498: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P2499: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f6

P2500: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f36, %f8

P2501: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P2502: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P2503: !CASX [0] (maybe <- 0x2000021) (Int)
add %i0, 0, %l7
ldx [%l7], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l6
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%l7], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P2504: !DWST [0] (maybe <- 0x2000023) (Int) (LE)
wr %g0, 0x88, %asi
sllx %l4, 32, %l6
add   %l4, 1, %l4
or %l6, %l4, %l7
! Change double-word-level endianess (big endian <-> little endian) 
sethi %hi(0xff00ff00), %o5
or %o5, %lo(0xff00ff00), %o5
sllx %o5, 32, %l6
or %o5, %l6, %o5 
and %l7, %o5, %l6
srlx %l6, 8, %l6
sllx %l7, 8, %l7
and %l7, %o5, %l7
or %l7, %l6, %l7 
sethi %hi(0xffff0000), %o5
or %o5, %lo(0xffff0000), %o5
srlx %l7, 16, %l6
andn %l6, %o5, %l6
andn %l7, %o5, %l7
sllx %l7, 16, %l7
or %l7, %l6, %l7 
srlx %l7, 32, %l6
sllx %l7, 32, %l7
or %l7, %l6, %l6 
stxa %l6, [%i0 + 0 ] %asi
add   %l4, 1, %l4

P2505: !BST [11] (maybe <- 0x41800114) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P2506: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f11

P2507: !CAS [9] (maybe <- 0x2000025) (Int)
add %i1, 512, %l3
lduw [%l3], %o2
mov %o2, %o5
! move %o5(lower) -> %o2(upper)
sllx %o5, 32, %o2
mov %l4, %l7
cas [%l3], %o5, %l7
! move %l7(lower) -> %o2(lower)
srl %l7, 0, %l3
or %l3, %o2, %o2
add   %l4, 1, %l4

P2508: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f12
fmovd %f36, %f18
fmovs %f18, %f13
fmovs %f19, %f14

P2509: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P2510: !BLD [0] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
fmovs %f19, %f0
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f40, %f2

P2511: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P2512: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P2513: !DWLD [8] (Int)
ldx [%i1 + 256], %o3
! move %o3(upper) -> %o3(upper)

P2514: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P2515: !BLD [0] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f4
fmovd %f34, %f18
fmovs %f19, %f6
fmovd %f40, %f18
fmovs %f18, %f7

P2516: !BLD [12] (FP) (Branch target of P2370)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8
ba P2517
nop

TARGET2370:
ba RET2370
nop


P2517: !BST [8] (maybe <- 0x41800115) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P2518: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f9

P2519: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P2520: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P2521: !DWST [6] (maybe <- 0x41800116) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=21 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
std %f20, [%i1 + 80]

P2522: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f12
fmovd %f36, %f18
fmovs %f18, %f13
fmovs %f19, %f14

P2523: !BST [5] (maybe <- 0x41800118) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2524: !PREFETCH [12] (Int) (LE) (CBR)
wr %g0, 0x88, %asi
prefetcha [%i3 + 0] %asi, 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2524
nop
RET2524:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P2525: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P2526: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P2527: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P2528: !ST [2] (maybe <- 0x2000026) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P2529: !BST [1] (maybe <- 0x4180011b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2530: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30

P2531: !CASX [8] (maybe <- 0x2000027) (Int)
add %i1, 256, %l7
ldx [%l7], %l3
! move %l3(upper) -> %o3(lower)
srlx %o3, 32, %o3
sllx %o3, 32, %o3
srlx %l3, 32, %l6
or %l6, %o3, %o3
! move %l3(lower) -> %o4(upper)
sllx %l3, 32, %o4
mov  %l3, %l6
sllx %l4, 32, %l3
casx [%l7], %l6, %l3
! move %l3(upper) -> %o4(lower)
srlx %l3, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
add  %l4, 1, %l4

P2532: !BST [4] (maybe <- 0x4180011f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P2533: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f0
membar #Sync 
! 1 addresses covered

P2534: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P2535: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f2
fmovd %f36, %f18
fmovs %f18, %f3
fmovs %f19, %f4

P2536: !BST [3] (maybe <- 0x41800120) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2537: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P2538: !BST [15] (maybe <- 0x41800124) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P2539: !SWAP [12] (maybe <- 0x2000028) (Int)
mov %l4, %l3
swap  [%i3 + 0], %l3
! move %l3(lower) -> %o0(lower)
srl %l3, 0, %l7
or %l7, %o0, %o0
add   %l4, 1, %l4

P2540: !BLD [15] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2540
nop
RET2540:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P2541: !DWLD [14] (Int)
ldx [%i3 + 128], %o1
! move %o1(upper) -> %o1(upper)

P2542: !BLD [1] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7
fmovs %f19, %f8
fmovd %f34, %f18
fmovs %f19, %f9
fmovd %f40, %f10

P2543: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P2544: !BLD [5] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f12
fmovd %f36, %f18
fmovs %f18, %f13
fmovs %f19, %f14

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2544
nop
RET2544:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P2545: !BST [6] (maybe <- 0x41800125) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2546: !BST [0] (maybe <- 0x41800128) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2547: !BST [2] (maybe <- 0x4180012c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2548: !BLD [2] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
fmovs %f19, %f0
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f40, %f2

P2549: !BST [13] (maybe <- 0x41800130) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P2550: !BLD [1] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3
fmovs %f19, %f4
fmovd %f34, %f18
fmovs %f19, %f5
fmovd %f40, %f6

P2551: !LD [13] (Int)
lduw [%i3 + 64], %l7
! move %l7(lower) -> %o1(lower)
srlx %o1, 32, %o1
sllx %o1, 32, %o1
or %l7, %o1, %o1

P2552: !BST [14] (maybe <- 0x41800131) (FP) (Branch target of P2475)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 
ba P2553
nop

TARGET2475:
ba RET2475
nop


P2553: !DWST [9] (maybe <- 0x2000029) (Int)
mov %l4, %l7 
sllx %l7, 32, %l7 
stx %l7, [%i1 + 512 ] 
add   %l4, 1, %l4

P2554: !PREFETCH [1] (Int) (LE) (CBR)
wr %g0, 0x88, %asi
prefetcha [%i0 + 4] %asi, 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2554
nop
RET2554:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P2555: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f36, %f8

P2556: !BST [15] (maybe <- 0x41800132) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P2557: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P2558: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P2559: !PREFETCH [9] (Int) (Branch target of P2554)
prefetch [%i1 + 512], 1
ba P2560
nop

TARGET2554:
ba RET2554
nop


P2560: !BST [6] (maybe <- 0x41800133) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2561: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P2562: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f13
fmovd %f36, %f14
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30

P2563: !BST [4] (maybe <- 0x41800136) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P2564: !REPLACEMENT [15] (Int)
sethi %hi(0xc0), %o5
or %o5, %lo(0xc0),  %o5
sethi %hi(0x10000), %l3
or %l3, %lo(0x10000),  %l3
add %i3, %o5, %o5
add %o5, %l3, %o5
ld [%o5], %l6
st %l6, [%o5]
add %o5, %l3, %o5
ld [%o5], %l6
st %l6, [%o5]
add %o5, %l3, %o5
ld [%o5], %l6
st %l6, [%o5]
add %o5, %l3, %o5
ld [%o5], %l6
st %l6, [%o5]

P2565: !BST [5] (maybe <- 0x41800137) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2566: !BST [4] (maybe <- 0x4180013a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P2567: !BST [13] (maybe <- 0x4180013b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P2568: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P2569: !MEMBAR (Int)
membar #StoreLoad

P2570: !LD [0] (Int)
lduw [%i0 + 0], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P2571: !LD [1] (Int)
lduw [%i0 + 4], %l7
! move %l7(lower) -> %o2(lower)
or %l7, %o2, %o2

P2572: !LD [2] (Int)
lduw [%i0 + 12], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P2573: !LD [3] (Int) (Branch target of P2333)
lduw [%i0 + 32], %l7
! move %l7(lower) -> %o3(lower)
or %l7, %o3, %o3
ba P2574
nop

TARGET2333:
ba RET2333
nop


P2574: !LD [4] (Int)
lduw [%i0 + 64], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P2575: !LD [5] (FP)
ld [%i1 + 76], %f0
! 1 addresses covered

P2576: !LD [6] (Int)
lduw [%i1 + 80], %l7
! move %l7(lower) -> %o4(lower)
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P2577: !LD [7] (Int)
lduw [%i1 + 84], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P2578: !LD [8] (Int)
lduw [%i1 + 256], %l7
! move %l7(lower) -> %o0(lower)
or %l7, %o0, %o0

P2579: !LD [9] (Int)
lduw [%i1 + 512], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P2580: !LD [10] (Int)
lduw [%i2 + 32], %l7
! move %l7(lower) -> %o1(lower)
or %l7, %o1, %o1

P2581: !LD [11] (Int)
lduw [%i2 + 64], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P2582: !LD [12] (Int) (Branch target of P2371)
lduw [%i3 + 0], %l7
! move %l7(lower) -> %o2(lower)
or %l7, %o2, %o2
ba P2583
nop

TARGET2371:
ba RET2371
nop


P2583: !LD [13] (Int)
lduw [%i3 + 64], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P2584: !LD [14] (Int) (CBR)
lduw [%i3 + 128], %l7
! move %l7(lower) -> %o3(lower)
or %l7, %o3, %o3

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2584
nop
RET2584:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P2585: !LD [15] (Int)
lduw [%i3 + 192], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

END_NODES4: ! Test istream for CPU 4 ends
sethi %hi(0xdead0e0f), %l7
or    %l7, %lo(0xdead0e0f), %l7
! move %l7(lower) -> %o4(lower)
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5
stw %l7, [%i5] 
ld [%i5], %f1
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30

restore
retl
nop
!-----------------

! register usage:
! %i0 %i1 %i2 %i3 : base registers for 4 regions
! %i4 fixed pointer to per-cpu results area
! %l1 moving pointer to per-cpu FP results area
! %o7 moving pointer to per-cpu integer results area
! %i5 pointer to per-cpu private area
! %l0 holds lfsr, used as source of random bits 
! %l2 loop count register
! %f16 running counter for unique fp store values
! %f17 holds increment value for fp counter
! %l4 running counter for unique integer store values (increment value is always 1)
! %l5 move-to register for load values (simulation only)
! %f30 move-to register for FP values (simulation only)
! %l3 %l6 %l7 %o5 : 4 temporary registers
! %o0 %o1 %o2 %o3 %o4 : 5 integer results buffer registers
! %f0-f15 FP results buffer registers
! %f32-f47 FP block load/store registers

func5:
! 500 (dynamic) instruction sequence begins
save   %sp, -192, %sp

! Force %i0-%i3 to be 64-byte aligned
add %i0, 63, %i0
andn %i0, 63, %i0

add %i1, 63, %i1
andn %i1, 63, %i1

add %i2, 63, %i2
andn %i2, 63, %i2

add %i3, 63, %i3
andn %i3, 63, %i3

add %i4, 63, %i4
andn %i4, 63, %i4

add %i5, 63, %i5
andn %i5, 63, %i5


! Initialize pointer to FP load results area
mov   %i4, %l1

! Initialize pointer to integer load results area
sethi %hi(0x80000), %o7
or    %o7, %lo(0x80000), %o7
add  %o7, %l1, %o7 

! Initialize %f0-%f62 to 0xdeadbee0deadbee1
sethi %hi(0xdeadbee0), %l6
or    %l6, %lo(0xdeadbee0), %l6
stw   %l6, [%i5]
sethi %hi(0xdeadbee1), %l6
or    %l6, %lo(0xdeadbee1), %l6
stw   %l6, [%i5+4]
ldd [%i5], %f0
fmovd %f0, %f2
fmovd %f0, %f4
fmovd %f0, %f6
fmovd %f0, %f8
fmovd %f0, %f10
fmovd %f0, %f12
fmovd %f0, %f14
fmovd %f0, %f16
fmovd %f0, %f18
fmovd %f0, %f20
fmovd %f0, %f22
fmovd %f0, %f24
fmovd %f0, %f26
fmovd %f0, %f28
fmovd %f0, %f30
fmovd %f0, %f32
fmovd %f0, %f34
fmovd %f0, %f36
fmovd %f0, %f38
fmovd %f0, %f40
fmovd %f0, %f42
fmovd %f0, %f44
fmovd %f0, %f46
fmovd %f0, %f48
fmovd %f0, %f50
fmovd %f0, %f52
fmovd %f0, %f54
fmovd %f0, %f56
fmovd %f0, %f58
fmovd %f0, %f60
fmovd %f0, %f62

! Signature for extract_loads script to start extracting load values for this stream
sethi %hi(0x05deade1), %l6
or    %l6, %lo(0x05deade1), %l6
stw %l6, [%i5] 
ld [%i5], %f16

! Initialize running integer counter in register %l4
sethi %hi(0x2800001), %l4
or    %l4, %lo(0x2800001), %l4

! Initialize running FP counter in register %f16
sethi %hi(0x42000001), %l6
or    %l6, %lo(0x42000001), %l6
stw %l6, [%i5] 
ld [%i5], %f16

! Initialize FP counter increment value in register %f17 (constant)
sethi %hi(0x36800000), %l6
or    %l6, %lo(0x36800000), %l6
stw %l6, [%i5] 
ld [%i5], %f17 

! Initialize LFSR to 0x19c0^4
sethi %hi(0x19c0), %l0
or    %l0, %lo(0x19c0), %l0
mulx  %l0, %l0, %l0
mulx  %l0, %l0, %l0

!-- init shared addrs 10 to 11 ---
stx %g0, [%i2+32]
stx %g0, [%i2+64]

! use untouched cache-line (offset 4K) in replacement area for sync
sub %i1, %i0, %l7
add %i3, %l7, %l7
sub %l7, -4096, %l7

!-- begin of sync_init ---
or %g0, 1, %o5
or %g0, %o5, %l3
swap [%l7+4], %l3
membar #Sync
sync_init_1_5:
brnz,pt %o5, sync_init_1_5
lduw [%l7+4], %o5 ! delay slot
sync_init_2_5:
lduw [%l7], %o5
sub %o5, 1, %l3
cas [%l7], %o5, %l3
cmp %o5, %l3
bne,pt %xcc, sync_init_2_5
nop
membar #Sync
sync_init_3_5:
lduw [%l7], %o5 ! delay slot
brnz,pt %o5, sync_init_3_5
nop
!-- end of sync_init ---


BEGIN_NODES5: ! Test istream for CPU 5 begins

P2586: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P2587: !BST [3] (maybe <- 0x42000001) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2588: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P2589: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P2590: !BST [10] (maybe <- 0x42000005) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P2591: !BST [10] (maybe <- 0x42000006) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P2592: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P2593: !BST [0] (maybe <- 0x42000007) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2594: !LD [15] (Int)
lduw [%i3 + 192], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P2595: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f0
membar #Sync 
! 1 addresses covered

P2596: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f1

P2597: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P2598: !BLD [2] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f2
fmovd %f34, %f18
fmovs %f19, %f4
fmovd %f40, %f18
fmovs %f18, %f5

P2599: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P2600: !BST [14] (maybe <- 0x4200000b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P2601: !BST [15] (maybe <- 0x4200000c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P2602: !BST [8] (maybe <- 0x4200000d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P2603: !BST [2] (maybe <- 0x4200000e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2604: !ST [15] (maybe <- 0x2800001) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P2605: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P2606: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P2607: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P2608: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P2609: !BST [10] (maybe <- 0x42000012) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P2610: !BST [14] (maybe <- 0x42000013) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P2611: !BLD [3] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f10
fmovd %f34, %f18
fmovs %f19, %f12
fmovd %f40, %f18
fmovs %f18, %f13

P2612: !CASX [6] (maybe <- 0x2800002) (Int)
add %i1, 80, %l6
ldx [%l6], %o5
! move %o5(upper) -> %o0(lower)
srlx %o5, 32, %l3
or %l3, %o0, %o0
! move %o5(lower) -> %o1(upper)
sllx %o5, 32, %o1
mov %o5, %l3
sllx %l4, 32, %o5
add  %l4, 1, %l4
or   %l4, %o5, %o5
casx [%l6], %l3, %o5
! move %o5(upper) -> %o1(lower)
srlx %o5, 32, %l6
or %l6, %o1, %o1
! move %o5(lower) -> %o2(upper)
sllx %o5, 32, %o2
add  %l4, 1, %l4

P2613: !BST [1] (maybe <- 0x42000014) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2614: !BLD [1] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f14
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
fmovd %f34, %f18
fmovs %f19, %f0
fmovd %f40, %f18
fmovs %f18, %f1

P2615: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P2616: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P2617: !PREFETCH [11] (Int) (Branch target of P2881)
prefetch [%i2 + 64], 1
ba P2618
nop

TARGET2881:
ba RET2881
nop


P2618: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P2619: !BLD [1] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5
fmovs %f19, %f6
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f40, %f8

P2620: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P2621: !ST [2] (maybe <- 0x2800004) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P2622: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P2623: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P2624: !BST [3] (maybe <- 0x42000018) (FP) (Branch target of P2896)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 
ba P2625
nop

TARGET2896:
ba RET2896
nop


P2625: !LD [7] (Int)
lduw [%i1 + 84], %l7
! move %l7(lower) -> %o2(lower)
or %l7, %o2, %o2

P2626: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P2627: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f10

P2628: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f11

P2629: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P2630: !ST [5] (maybe <- 0x2800005) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P2631: !CAS [14] (maybe <- 0x2800006) (Int)
add %i3, 128, %o5
lduw [%o5], %o3
mov %o3, %l7
! move %l7(lower) -> %o3(upper)
sllx %l7, 32, %o3
mov %l4, %l6
cas [%o5], %l7, %l6
! move %l6(lower) -> %o3(lower)
srl %l6, 0, %o5
or %o5, %o3, %o3
add   %l4, 1, %l4

P2632: !BLD [2] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f12
fmovd %f34, %f18
fmovs %f19, %f14
fmovd %f40, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30

P2633: !BST [8] (maybe <- 0x4200001c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P2634: !REPLACEMENT [3] (Int)
sethi %hi(0x20), %l6
or %l6, %lo(0x20),  %l6
sethi %hi(0x10000), %l7
or %l7, %lo(0x10000),  %l7
add %i3, %l6, %l6
add %l6, %l7, %l6
ld [%l6], %o5
st %o5, [%l6]
add %l6, %l7, %l6
ld [%l6], %o5
st %o5, [%l6]
add %l6, %l7, %l6
ld [%l6], %o5
st %o5, [%l6]
add %l6, %l7, %l6
ld [%l6], %o5
st %o5, [%l6]

P2635: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P2636: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f0
membar #Sync 
! 3 addresses covered
fmovs %f3, %f0
fmovs %f4, %f1
fmovs %f5, %f2

P2637: !BST [8] (maybe <- 0x4200001d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P2638: !BLD [2] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3
fmovs %f19, %f4
fmovd %f34, %f18
fmovs %f19, %f5
fmovd %f40, %f6

P2639: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P2640: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P2641: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P2642: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P2643: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P2644: !BST [3] (maybe <- 0x4200001e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2645: !DWLD [0] (Int)
ldx [%i0 + 0], %o4
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P2646: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P2647: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P2648: !BST [5] (maybe <- 0x42000022) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2649: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P2650: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P2651: !BST [0] (maybe <- 0x42000025) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2652: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P2653: !BST [8] (maybe <- 0x42000029) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P2654: !BST [5] (maybe <- 0x4200002a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2655: !DWLD [6] (FP)
ldd [%i1 + 80], %f8
! 2 addresses covered

P2656: !BLD [1] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f10
fmovd %f34, %f18
fmovs %f19, %f12
fmovd %f40, %f18
fmovs %f18, %f13

P2657: !LD [8] (Int)
lduw [%i1 + 256], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P2658: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P2659: !BST [8] (maybe <- 0x4200002d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P2660: !LD [11] (Int)
lduw [%i2 + 64], %l7
! move %l7(lower) -> %o0(lower)
or %l7, %o0, %o0

P2661: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P2662: !BLD [0] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
fmovs %f19, %f0
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f40, %f2

P2663: !BLD [0] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3
fmovs %f19, %f4
fmovd %f34, %f18
fmovs %f19, %f5
fmovd %f40, %f6

P2664: !BLD [2] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7
fmovs %f19, %f8
fmovd %f34, %f18
fmovs %f19, %f9
fmovd %f40, %f10

P2665: !MEMBAR (Int)
membar #StoreLoad

P2666: !BST [15] (maybe <- 0x4200002e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P2667: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P2668: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P2669: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P2670: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P2671: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P2672: !BST [14] (maybe <- 0x4200002f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P2673: !BST [1] (maybe <- 0x42000030) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2674: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P2675: !BST [8] (maybe <- 0x42000034) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P2676: !DWST [14] (maybe <- 0x2800007) (Int)
mov %l4, %o5 
sllx %o5, 32, %o5 
stx %o5, [%i3 + 128 ] 
add   %l4, 1, %l4

P2677: !BLD [0] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f12
fmovd %f34, %f18
fmovs %f19, %f14
fmovd %f40, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30

P2678: !BLD [2] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f0
membar #Sync 
! 4 addresses covered
fmovs %f3, %f2
fmovs %f8, %f3

P2679: !BST [4] (maybe <- 0x42000035) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P2680: !BLD [1] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f4
fmovd %f34, %f18
fmovs %f19, %f6
fmovd %f40, %f18
fmovs %f18, %f7

P2681: !PREFETCH [14] (Int) (CBR)
prefetch [%i3 + 128], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2681
nop
RET2681:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P2682: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P2683: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P2684: !DWLD [13] (Int)
ldx [%i3 + 64], %o1
! move %o1(upper) -> %o1(upper)

P2685: !BLD [0] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9
fmovs %f19, %f10
fmovd %f34, %f18
fmovs %f19, %f11
fmovd %f40, %f12

P2686: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P2687: !BLD [0] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13
fmovs %f19, %f14
fmovd %f34, %f18
fmovs %f19, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
fmovd %f40, %f0

P2688: !BST [15] (maybe <- 0x42000036) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P2689: !BLD [12] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2689
nop
RET2689:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P2690: !BST [10] (maybe <- 0x42000037) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P2691: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P2692: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P2693: !PREFETCH [3] (Int) (CBR)
prefetch [%i0 + 32], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2693
nop
RET2693:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P2694: !BLD [1] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f4
fmovd %f34, %f18
fmovs %f19, %f6
fmovd %f40, %f18
fmovs %f18, %f7

P2695: !BLD [1] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f8
fmovd %f34, %f18
fmovs %f19, %f10
fmovd %f40, %f18
fmovs %f18, %f11

P2696: !DWST [2] (maybe <- 0x2800008) (Int)
mov %l4, %l3 
stx %l3, [%i0 + 8]
add   %l4, 1, %l4

P2697: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P2698: !CASX [3] (maybe <- 0x2800009) (Int)
add %i0, 32, %l3
ldx [%l3], %l7
! move %l7(upper) -> %o1(lower)
srlx %o1, 32, %o1
sllx %o1, 32, %o1
srlx %l7, 32, %o5
or %o5, %o1, %o1
! move %l7(lower) -> %o2(upper)
sllx %l7, 32, %o2
mov  %l7, %o5
sllx %l4, 32, %l7
casx [%l3], %o5, %l7
! move %l7(upper) -> %o2(lower)
srlx %l7, 32, %l3
or %l3, %o2, %o2
! move %l7(lower) -> %o3(upper)
sllx %l7, 32, %o3
add  %l4, 1, %l4

P2699: !BST [13] (maybe <- 0x42000038) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P2700: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P2701: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P2702: !BST [2] (maybe <- 0x42000039) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2703: !BLD [3] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13
fmovs %f19, %f14
fmovd %f34, %f18
fmovs %f19, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
fmovd %f40, %f0

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2703
nop
RET2703:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P2704: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P2705: !BST [8] (maybe <- 0x4200003d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P2706: !BST [15] (maybe <- 0x4200003e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P2707: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P2708: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f2
fmovd %f36, %f18
fmovs %f18, %f3
fmovs %f19, %f4

P2709: !DWLD [12] (Int) (LE)
wr %g0, 0x88, %asi
ldxa [%i3 + 0] %asi, %l6
! move %l6(lower) -> %o3(lower)
srl %l6, 0, %l3
or %l3, %o3, %o3

P2710: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P2711: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P2712: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P2713: !BLD [3] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5
fmovs %f19, %f6
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f40, %f8

P2714: !BLD [2] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9
fmovs %f19, %f10
fmovd %f34, %f18
fmovs %f19, %f11
fmovd %f40, %f12

P2715: !BST [8] (maybe <- 0x4200003f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P2716: !BST [6] (maybe <- 0x42000040) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2717: !BLD [2] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13
fmovs %f19, %f14
fmovd %f34, %f18
fmovs %f19, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
fmovd %f40, %f0

P2718: !BST [9] (maybe <- 0x42000043) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P2719: !LD [9] (Int)
lduw [%i1 + 512], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P2720: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f36, %f2

P2721: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P2722: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P2723: !BST [7] (maybe <- 0x42000044) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2724: !BST [0] (maybe <- 0x42000047) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2725: !BST [11] (maybe <- 0x4200004b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P2726: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P2727: !BST [3] (maybe <- 0x4200004c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2728: !BST [1] (maybe <- 0x42000050) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2729: !BLD [0] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f4
fmovd %f34, %f18
fmovs %f19, %f6
fmovd %f40, %f18
fmovs %f18, %f7

P2730: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P2731: !BST [3] (maybe <- 0x42000054) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2732: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P2733: !BST [4] (maybe <- 0x42000058) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P2734: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P2735: !LD [10] (Int)
lduw [%i2 + 32], %o5
! move %o5(lower) -> %o4(lower)
or %o5, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P2736: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f10
fmovd %f36, %f18
fmovs %f18, %f11
fmovs %f19, %f12

P2737: !BLD [1] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13
fmovs %f19, %f14
fmovd %f34, %f18
fmovs %f19, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
fmovd %f40, %f0

P2738: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P2739: !BST [7] (maybe <- 0x42000059) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2740: !BLD [2] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f2
fmovd %f34, %f18
fmovs %f19, %f4
fmovd %f40, %f18
fmovs %f18, %f5

P2741: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P2742: !ST [14] (maybe <- 0x4200005c) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i3 + 128 ]

P2743: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P2744: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P2745: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P2746: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P2747: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P2748: !BLD [6] (FP) (Branch target of P2768)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f10
fmovd %f36, %f18
fmovs %f18, %f11
fmovs %f19, %f12
ba P2749
nop

TARGET2768:
ba RET2768
nop


P2749: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P2750: !BLD [2] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13
fmovs %f19, %f14
fmovd %f34, %f18
fmovs %f19, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
fmovd %f40, %f0

P2751: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P2752: !BST [4] (maybe <- 0x4200005d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P2753: !BST [13] (maybe <- 0x4200005e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P2754: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P2755: !BST [8] (maybe <- 0x4200005f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P2756: !BST [1] (maybe <- 0x42000060) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2757: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P2758: !REPLACEMENT [11] (Int)
sethi %hi(0x40), %l7
or %l7, %lo(0x40),  %l7
sethi %hi(0x10000), %o5
or %o5, %lo(0x10000),  %o5
add %i3, %l7, %l7
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]

P2759: !REPLACEMENT [7] (Int)
sethi %hi(0x54), %l6
or %l6, %lo(0x54),  %l6
sethi %hi(0x10000), %l7
or %l7, %lo(0x10000),  %l7
add %i3, %l6, %l6
add %l6, %l7, %l6
ld [%l6], %o5
st %o5, [%l6]
add %l6, %l7, %l6
ld [%l6], %o5
st %o5, [%l6]
add %l6, %l7, %l6
ld [%l6], %o5
st %o5, [%l6]
add %l6, %l7, %l6
ld [%l6], %o5
st %o5, [%l6]

P2760: !DWST [3] (maybe <- 0x280000a) (Int)
mov %l4, %l3 
sllx %l3, 32, %l3 
stx %l3, [%i0 + 32 ] 
add   %l4, 1, %l4

P2761: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P2762: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P2763: !BST [12] (maybe <- 0x42000064) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P2764: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P2765: !BST [9] (maybe <- 0x42000065) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P2766: !BST [6] (maybe <- 0x42000066) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2767: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P2768: !BLD [4] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2768
nop
RET2768:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P2769: !DWLD [14] (Int)
ldx [%i3 + 128], %o0
! move %o0(upper) -> %o0(upper)

P2770: !PREFETCH [2] (Int) (Branch target of P2693)
prefetch [%i0 + 12], 1
ba P2771
nop

TARGET2693:
ba RET2693
nop


P2771: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f3
fmovd %f36, %f4

P2772: !BST [4] (maybe <- 0x42000069) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P2773: !ST [1] (maybe <- 0x4200006a) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i0 + 4 ]

P2774: !PREFETCH [7] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i1 + 84] %asi, 1

P2775: !CAS [13] (maybe <- 0x280000b) (Int) (CBR)
add %i3, 64, %l7
lduw [%l7], %l3
mov %l3, %l6
! move %l6(lower) -> %o0(lower)
srlx %o0, 32, %o0
sllx %o0, 32, %o0
or %l6, %o0, %o0
mov %l4, %o1
cas [%l7], %l6, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2775
nop
RET2775:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P2776: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P2777: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P2778: !BST [4] (maybe <- 0x4200006b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P2779: !DWST [3] (maybe <- 0x280000c) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i0 + 32 ] 
add   %l4, 1, %l4

P2780: !BST [1] (maybe <- 0x4200006c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2781: !BST [1] (maybe <- 0x42000070) (FP) (CBR) (Branch target of P3022)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2781
nop
RET2781:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0

ba P2782
nop

TARGET3022:
ba RET3022
nop


P2782: !DWLD [4] (Int)
ldx [%i0 + 64], %l3
! move %l3(upper) -> %o1(lower)
srlx %l3, 32, %o5
or %o5, %o1, %o1

P2783: !PREFETCH [10] (Int) (CBR)
prefetch [%i2 + 32], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2783
nop
RET2783:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P2784: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P2785: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P2786: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P2787: !BLD [0] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9
fmovs %f19, %f10
fmovd %f34, %f18
fmovs %f19, %f11
fmovd %f40, %f12

P2788: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P2789: !BST [9] (maybe <- 0x42000074) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P2790: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f14
fmovd %f36, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
fmovs %f19, %f0

P2791: !BST [10] (maybe <- 0x42000075) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P2792: !BST [10] (maybe <- 0x42000076) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P2793: !BST [10] (maybe <- 0x42000077) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P2794: !ST [4] (maybe <- 0x280000d) (Int) (LE)
wr %g0, 0x88, %asi
! Change single-word-level endianess (big endian <-> little endian) 
sethi %hi(0xff00ff00), %o5
or %o5, %lo(0xff00ff00), %o5
and %l4, %o5, %l3
srl %l3, 8, %l3
sll %l4, 8, %l7
and %l7, %o5, %l7
or %l7, %l3, %l7
srl %l7, 16, %l3
sll %l7, 16, %l7
srl %l7, 0, %l7
or %l7, %l3, %l7
stwa   %l7, [%i0 + 64] %asi
add   %l4, 1, %l4

P2795: !DWST [5] (maybe <- 0x280000e) (Int)
mov %l4, %l6 
stx %l6, [%i1 + 72]
add   %l4, 1, %l4

P2796: !BST [10] (maybe <- 0x42000078) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P2797: !ST [13] (maybe <- 0x280000f) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P2798: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P2799: !BST [4] (maybe <- 0x42000079) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P2800: !BLD [2] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1
fmovs %f19, %f2
fmovd %f34, %f18
fmovs %f19, %f3
fmovd %f40, %f4

P2801: !BST [13] (maybe <- 0x4200007a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P2802: !BST [15] (maybe <- 0x4200007b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P2803: !BST [15] (maybe <- 0x4200007c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P2804: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P2805: !BST [4] (maybe <- 0x4200007d) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2805
nop
RET2805:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P2806: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P2807: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P2808: !BST [10] (maybe <- 0x4200007e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P2809: !BST [0] (maybe <- 0x4200007f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2810: !DWST [14] (maybe <- 0x2800010) (Int) (LE)
wr %g0, 0x88, %asi
! Change single-word-level endianess (big endian <-> little endian) 
sethi %hi(0xff00ff00), %l3
or %l3, %lo(0xff00ff00), %l3
and %l4, %l3, %l7
srl %l7, 8, %l7
sll %l4, 8, %l6
and %l6, %l3, %l6
or %l6, %l7, %l6
srl %l6, 16, %l7
sll %l6, 16, %l6
srl %l6, 0, %l6
or %l6, %l7, %l6
stxa %l6, [%i3 + 128 ] %asi
add   %l4, 1, %l4

P2811: !BST [12] (maybe <- 0x42000083) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P2812: !BST [15] (maybe <- 0x42000084) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P2813: !BST [10] (maybe <- 0x42000085) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P2814: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P2815: !LD [15] (Int)
lduw [%i3 + 192], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P2816: !BST [6] (maybe <- 0x42000086) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2817: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P2818: !DWLD [12] (Int)
ldx [%i3 + 0], %l7
! move %l7(upper) -> %o2(lower)
srlx %l7, 32, %l6
or %l6, %o2, %o2

P2819: !BLD [2] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f6
fmovd %f34, %f18
fmovs %f19, %f8
fmovd %f40, %f18
fmovs %f18, %f9

P2820: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P2821: !PREFETCH [3] (Int) (Branch target of P3043)
prefetch [%i0 + 32], 1
ba P2822
nop

TARGET3043:
ba RET3043
nop


P2822: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P2823: !BST [10] (maybe <- 0x42000089) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P2824: !LD [14] (Int)
lduw [%i3 + 128], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P2825: !BLD [1] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11
fmovs %f19, %f12
fmovd %f34, %f18
fmovs %f19, %f13
fmovd %f40, %f14

P2826: !LD [9] (Int)
lduw [%i1 + 512], %l6
! move %l6(lower) -> %o3(lower)
or %l6, %o3, %o3

P2827: !BST [6] (maybe <- 0x4200008a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2828: !BST [12] (maybe <- 0x4200008d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P2829: !DWST [15] (maybe <- 0x2800011) (Int)
mov %l4, %l3 
sllx %l3, 32, %l3 
stx %l3, [%i3 + 192 ] 
add   %l4, 1, %l4

P2830: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30

P2831: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P2832: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f0
membar #Sync 
! 1 addresses covered

P2833: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P2834: !SWAP [8] (maybe <- 0x2800012) (Int)
mov %l4, %o4
swap  [%i1 + 256], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P2835: !DWST [5] (maybe <- 0x2800013) (Int)
mov %l4, %l7 
stx %l7, [%i1 + 72]
add   %l4, 1, %l4

P2836: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f1

P2837: !LD [15] (Int)
lduw [%i3 + 192], %l7
! move %l7(lower) -> %o4(lower)
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P2838: !BST [8] (maybe <- 0x4200008e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P2839: !BST [8] (maybe <- 0x4200008f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P2840: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P2841: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P2842: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P2843: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f2
fmovd %f36, %f18
fmovs %f18, %f3
fmovs %f19, %f4

P2844: !BST [15] (maybe <- 0x42000090) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P2845: !PREFETCH [3] (Int) (CBR)
prefetch [%i0 + 32], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2845
nop
RET2845:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P2846: !BST [8] (maybe <- 0x42000091) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P2847: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f5

P2848: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P2849: !DWST [15] (maybe <- 0x42000092) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
std %f20, [%i3 + 192]

P2850: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P2851: !BST [14] (maybe <- 0x42000093) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P2852: !BLD [2] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f6
fmovd %f34, %f18
fmovs %f19, %f8
fmovd %f40, %f18
fmovs %f18, %f9

P2853: !ST [2] (maybe <- 0x2800014) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P2854: !BLD [2] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f10
fmovd %f34, %f18
fmovs %f19, %f12
fmovd %f40, %f18
fmovs %f18, %f13

P2855: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f14
fmovd %f36, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
fmovs %f19, %f0

P2856: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P2857: !BST [7] (maybe <- 0x42000094) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2858: !BLD [0] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1
fmovs %f19, %f2
fmovd %f34, %f18
fmovs %f19, %f3
fmovd %f40, %f4

P2859: !BST [7] (maybe <- 0x42000097) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2860: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P2861: !BLD [15] (FP) (Branch target of P2703)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5
ba P2862
nop

TARGET2703:
ba RET2703
nop


P2862: !BST [12] (maybe <- 0x4200009a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P2863: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f6

P2864: !BST [6] (maybe <- 0x4200009b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2865: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P2866: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f36, %f8

P2867: !DWLD [11] (Int)
ldx [%i2 + 64], %o0
! move %o0(upper) -> %o0(upper)

P2868: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P2869: !REPLACEMENT [13] (Int)
sethi %hi(0x40), %o5
or %o5, %lo(0x40),  %o5
sethi %hi(0x10000), %l3
or %l3, %lo(0x10000),  %l3
add %i3, %o5, %o5
add %o5, %l3, %o5
ld [%o5], %l6
st %l6, [%o5]
add %o5, %l3, %o5
ld [%o5], %l6
st %l6, [%o5]
add %o5, %l3, %o5
ld [%o5], %l6
st %l6, [%o5]
add %o5, %l3, %o5
ld [%o5], %l6
st %l6, [%o5]

P2870: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P2871: !BST [4] (maybe <- 0x4200009e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P2872: !BST [15] (maybe <- 0x4200009f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P2873: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f10
fmovd %f36, %f18
fmovs %f18, %f11
fmovs %f19, %f12

P2874: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P2875: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P2876: !PREFETCH [13] (Int) (CBR)
prefetch [%i3 + 64], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2876
nop
RET2876:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P2877: !DWST [12] (maybe <- 0x2800015) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 0 ] 
add   %l4, 1, %l4

P2878: !BST [3] (maybe <- 0x420000a0) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2879: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P2880: !BST [4] (maybe <- 0x420000a4) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P2881: !BST [8] (maybe <- 0x420000a5) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2881
nop
RET2881:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P2882: !ST [14] (maybe <- 0x2800016) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P2883: !ST [5] (maybe <- 0x2800017) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P2884: !REPLACEMENT [4] (Int)
sethi %hi(0x40), %l3
or %l3, %lo(0x40),  %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %i3, %l3, %l3
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P2885: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f14
fmovd %f36, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
fmovs %f19, %f0

P2886: !BST [1] (maybe <- 0x420000a6) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2887: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P2888: !ST [14] (maybe <- 0x420000aa) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i3 + 128 ]

P2889: !BLD [1] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1
fmovs %f19, %f2
fmovd %f34, %f18
fmovs %f19, %f3
fmovd %f40, %f4

P2890: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P2891: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P2892: !DWLD [10] (Int)
ldx [%i2 + 32], %l7
! move %l7(upper) -> %o0(lower)
srlx %o0, 32, %o0
sllx %o0, 32, %o0
srlx %l7, 32, %l6
or %l6, %o0, %o0

P2893: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P2894: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P2895: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P2896: !BST [11] (maybe <- 0x420000ab) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2896
nop
RET2896:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P2897: !DWST [7] (maybe <- 0x2800018) (Int)
sllx %l4, 32, %o5 
add   %l4, 1, %l4
or %o5, %l4, %o5
stx %o5, [%i1 + 80]
add   %l4, 1, %l4

P2898: !DWST [8] (maybe <- 0x280001a) (Int)
mov %l4, %l7 
sllx %l7, 32, %l7 
stx %l7, [%i1 + 256 ] 
add   %l4, 1, %l4

P2899: !BST [10] (maybe <- 0x420000ac) (FP) (Branch target of P2949)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 
ba P2900
nop

TARGET2949:
ba RET2949
nop


P2900: !LD [11] (Int)
lduw [%i2 + 64], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P2901: !LD [1] (Int)
lduw [%i0 + 4], %o5
! move %o5(lower) -> %o1(lower)
or %o5, %o1, %o1

P2902: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P2903: !BST [2] (maybe <- 0x420000ad) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2904: !BST [5] (maybe <- 0x420000b1) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2905: !BST [6] (maybe <- 0x420000b4) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2906: !BLD [0] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f8
fmovd %f34, %f18
fmovs %f19, %f10
fmovd %f40, %f18
fmovs %f18, %f11

P2907: !PREFETCH [14] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i3 + 128] %asi, 1

P2908: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P2909: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P2910: !PREFETCH [7] (Int) (Branch target of P3079)
prefetch [%i1 + 84], 1
ba P2911
nop

TARGET3079:
ba RET3079
nop


P2911: !DWLD [15] (Int)
ldx [%i3 + 192], %o2
! move %o2(upper) -> %o2(upper)

P2912: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P2913: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P2914: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P2915: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P2916: !BST [5] (maybe <- 0x420000b7) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2917: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P2918: !BST [13] (maybe <- 0x420000ba) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P2919: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f14

P2920: !BLD [2] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
fmovs %f19, %f0
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f40, %f2

P2921: !BST [8] (maybe <- 0x420000bb) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P2922: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P2923: !BLD [3] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f4
fmovd %f34, %f18
fmovs %f19, %f6
fmovd %f40, %f18
fmovs %f18, %f7

P2924: !SWAP [2] (maybe <- 0x280001b) (Int)
mov %l4, %l7
swap  [%i0 + 12], %l7
! move %l7(lower) -> %o2(lower)
srlx %o2, 32, %o2
sllx %o2, 32, %o2
srl %l7, 0, %l3
or %l3, %o2, %o2
add   %l4, 1, %l4

P2925: !BST [6] (maybe <- 0x420000bc) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2926: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P2927: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P2928: !CASX [12] (maybe <- 0x280001c) (Int)
add %i3, 0, %o5
ldx [%o5], %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
mov  %o3, %l7
sllx %l4, 32, %o4
casx [%o5], %l7, %o4
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5
add  %l4, 1, %l4

P2929: !BLD [2] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f8
fmovd %f34, %f18
fmovs %f19, %f10
fmovd %f40, %f18
fmovs %f18, %f11

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2929
nop
RET2929:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P2930: !ST [15] (maybe <- 0x280001d) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P2931: !BST [3] (maybe <- 0x420000bf) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2932: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P2933: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P2934: !ST [11] (maybe <- 0x280001e) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P2935: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P2936: !ST [15] (maybe <- 0x280001f) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P2937: !BST [7] (maybe <- 0x420000c3) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2938: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f13
fmovd %f36, %f14
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30

P2939: !BST [6] (maybe <- 0x420000c6) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2940: !REPLACEMENT [13] (Int) (CBR)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
sethi %hi(0x10000), %l7
or %l7, %lo(0x10000),  %l7
add %i3, %l6, %l6
add %l6, %l7, %l6
ld [%l6], %o5
st %o5, [%l6]
add %l6, %l7, %l6
ld [%l6], %o5
st %o5, [%l6]
add %l6, %l7, %l6
ld [%l6], %o5
st %o5, [%l6]
add %l6, %l7, %l6
ld [%l6], %o5
st %o5, [%l6]

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2940
nop
RET2940:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P2941: !BST [3] (maybe <- 0x420000c9) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2942: !BLD [1] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f0
membar #Sync 
! 4 addresses covered
fmovs %f3, %f2
fmovs %f8, %f3

P2943: !ST [9] (maybe <- 0x2800020) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P2944: !BST [4] (maybe <- 0x420000cd) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P2945: !BST [15] (maybe <- 0x420000ce) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P2946: !DWLD [4] (Int)
ldx [%i0 + 64], %o0
! move %o0(upper) -> %o0(upper)

P2947: !BLD [3] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f4
fmovd %f34, %f18
fmovs %f19, %f6
fmovd %f40, %f18
fmovs %f18, %f7

P2948: !BST [15] (maybe <- 0x420000cf) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P2949: !BST [12] (maybe <- 0x420000d0) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2949
nop
RET2949:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P2950: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P2951: !CASX [13] (maybe <- 0x2800021) (Int) (LE)
! Change single-word-level endianess (big endian <-> little endian) 
sethi %hi(0xff00ff00), %o5
or %o5, %lo(0xff00ff00), %o5
and %l4, %o5, %l7
srl %l7, 8, %l7
sll %l4, 8, %l3
and %l3, %o5, %l3
or %l3, %l7, %l3
srl %l3, 16, %l7
sll %l3, 16, %l3
srl %l3, 0, %l3
or %l3, %l7, %l3
wr %g0, 0x88, %asi
add %i3, 64, %o5
ldxa [%o5] %asi, %l6
! move %l6(lower) -> %o0(lower)
srlx %o0, 32, %o0
sllx %o0, 32, %o0
srl %l6, 0, %l7
or %l7, %o0, %o0
! move %l6(upper) -> %o1(upper)
or %l6, %g0, %o1
mov  %l6, %l7
mov  %l3, %l6
casxa [%o5] %asi, %l7, %l6
! move %l6(lower) -> %o1(lower)
srlx %o1, 32, %o1
sllx %o1, 32, %o1
srl %l6, 0, %o5
or %o5, %o1, %o1
! move %l6(upper) -> %o2(upper)
or %l6, %g0, %o2
add  %l4, 1, %l4

P2952: !BST [8] (maybe <- 0x420000d1) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P2953: !DWLD [9] (Int)
ldx [%i1 + 512], %l7
! move %l7(upper) -> %o2(lower)
srlx %o2, 32, %o2
sllx %o2, 32, %o2
srlx %l7, 32, %l6
or %l6, %o2, %o2

P2954: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f8
fmovd %f36, %f18
fmovs %f18, %f9
fmovs %f19, %f10

P2955: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P2956: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P2957: !REPLACEMENT [3] (Int)
sethi %hi(0x20), %o5
or %o5, %lo(0x20),  %o5
sethi %hi(0x10000), %l3
or %l3, %lo(0x10000),  %l3
add %i3, %o5, %o5
add %o5, %l3, %o5
ld [%o5], %l6
st %l6, [%o5]
add %o5, %l3, %o5
ld [%o5], %l6
st %l6, [%o5]
add %o5, %l3, %o5
ld [%o5], %l6
st %l6, [%o5]
add %o5, %l3, %o5
ld [%o5], %l6
st %l6, [%o5]

P2958: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P2959: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P2960: !BST [7] (maybe <- 0x420000d2) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2961: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f12
fmovd %f36, %f18
fmovs %f18, %f13
fmovs %f19, %f14

P2962: !BST [9] (maybe <- 0x420000d5) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P2963: !ST [3] (maybe <- 0x2800022) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P2964: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30

P2965: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P2966: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f0
membar #Sync 
! 1 addresses covered
fmovd %f8, %f0

P2967: !BLD [2] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1
fmovs %f19, %f2
fmovd %f34, %f18
fmovs %f19, %f3
fmovd %f40, %f4

P2968: !DWLD [1] (Int)
ldx [%i0 + 0], %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)

P2969: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P2970: !BST [0] (maybe <- 0x420000d6) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2971: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P2972: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P2973: !BST [1] (maybe <- 0x420000da) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2974: !DWLD [1] (Int)
ldx [%i0 + 0], %o4
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P2975: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P2976: !BLD [1] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f6
fmovd %f34, %f18
fmovs %f19, %f8
fmovd %f40, %f18
fmovs %f18, %f9

P2977: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f10
fmovd %f36, %f18
fmovs %f18, %f11
fmovs %f19, %f12

P2978: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f13
fmovd %f36, %f14
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30

P2979: !REPLACEMENT [6] (Int)
sethi %hi(0x50), %l6
or %l6, %lo(0x50),  %l6
sethi %hi(0x10000), %l7
or %l7, %lo(0x10000),  %l7
add %i3, %l6, %l6
add %l6, %l7, %l6
ld [%l6], %o5
st %o5, [%l6]
add %l6, %l7, %l6
ld [%l6], %o5
st %o5, [%l6]
add %l6, %l7, %l6
ld [%l6], %o5
st %o5, [%l6]
add %l6, %l7, %l6
ld [%l6], %o5
st %o5, [%l6]

P2980: !BST [9] (maybe <- 0x420000de) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P2981: !BST [2] (maybe <- 0x420000df) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2982: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P2983: !BST [3] (maybe <- 0x420000e3) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2984: !BST [8] (maybe <- 0x420000e7) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P2985: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P2986: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f0
membar #Sync 
! 1 addresses covered

P2987: !BLD [0] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1
fmovs %f19, %f2
fmovd %f34, %f18
fmovs %f19, %f3
fmovd %f40, %f4

P2988: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f5
fmovd %f36, %f6

P2989: !BST [5] (maybe <- 0x420000e8) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2990: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f8

P2991: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f9

P2992: !BLD [1] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f10
fmovd %f34, %f18
fmovs %f19, %f12
fmovd %f40, %f18
fmovs %f18, %f13

P2993: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P2994: !BLD [3] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f14
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
fmovd %f34, %f18
fmovs %f19, %f0
fmovd %f40, %f18
fmovs %f18, %f1

P2995: !BST [9] (maybe <- 0x420000eb) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P2996: !SWAP [14] (maybe <- 0x2800023) (Int) (LE)
wr %g0, 0x88, %asi
mov %l4, %o0
! Change single-word-level endianess (big endian <-> little endian) 
sethi %hi(0xff00ff00), %l7
or %l7, %lo(0xff00ff00), %l7
and %o0, %l7, %o5
srl %o5, 8, %o5
sll %o0, 8, %o0
and %o0, %l7, %o0
or %o0, %o5, %o0
srl %o0, 16, %o5
sll %o0, 16, %o0
srl %o0, 0, %o0
or %o0, %o5, %o0
swapa  [%i3 + 128] %asi, %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
add   %l4, 1, %l4

P2997: !BLD [0] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f2
fmovd %f34, %f18
fmovs %f19, %f4
fmovd %f40, %f18
fmovs %f18, %f5

P2998: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P2999: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P3000: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P3001: !BST [15] (maybe <- 0x420000ec) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P3002: !BLD [3] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7
fmovs %f19, %f8
fmovd %f34, %f18
fmovs %f19, %f9
fmovd %f40, %f10

P3003: !BST [1] (maybe <- 0x420000ed) (FP) (Branch target of P2783)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 
ba P3004
nop

TARGET2783:
ba RET2783
nop


P3004: !DWLD [15] (Int)
ldx [%i3 + 192], %l3
! move %l3(upper) -> %o0(lower)
srlx %l3, 32, %o5
or %o5, %o0, %o0

P3005: !BST [12] (maybe <- 0x420000f1) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P3006: !PREFETCH [8] (Int) (Branch target of P2775)
prefetch [%i1 + 256], 1
ba P3007
nop

TARGET2775:
ba RET2775
nop


P3007: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P3008: !BST [2] (maybe <- 0x420000f2) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3009: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P3010: !PREFETCH [11] (Int) (CBR)
prefetch [%i2 + 64], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3010
nop
RET3010:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P3011: !BST [9] (maybe <- 0x420000f6) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P3012: !ST [9] (maybe <- 0x2800024) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P3013: !DWLD [8] (FP)
ldd [%i1 + 256], %f12
! 1 addresses covered

P3014: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P3015: !BST [9] (maybe <- 0x420000f7) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P3016: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f13
fmovd %f36, %f14
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30

P3017: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P3018: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f0
membar #Sync 
! 3 addresses covered
fmovs %f3, %f0
fmovs %f4, %f1
fmovs %f5, %f2

P3019: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f3
fmovd %f36, %f4

P3020: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P3021: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P3022: !BST [2] (maybe <- 0x420000f8) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3022
nop
RET3022:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P3023: !BST [14] (maybe <- 0x420000fc) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P3024: !DWST [1] (maybe <- 0x2800025) (Int)
sllx %l4, 32, %l3 
add   %l4, 1, %l4
or %l3, %l4, %l3
stx %l3, [%i0 + 0]
add   %l4, 1, %l4

P3025: !MEMBAR (Int)
membar #StoreLoad

P3026: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P3027: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P3028: !BST [12] (maybe <- 0x420000fd) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P3029: !REPLACEMENT [10] (Int)
sethi %hi(0x20), %l7
or %l7, %lo(0x20),  %l7
sethi %hi(0x10000), %o5
or %o5, %lo(0x10000),  %o5
add %i3, %l7, %l7
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]

P3030: !BST [7] (maybe <- 0x420000fe) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3031: !BST [15] (maybe <- 0x42000101) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P3032: !BST [1] (maybe <- 0x42000102) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3033: !LD [0] (Int)
lduw [%i0 + 0], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P3034: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P3035: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P3036: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P3037: !BST [15] (maybe <- 0x42000106) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P3038: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f36, %f8

P3039: !BST [4] (maybe <- 0x42000107) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P3040: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P3041: !LD [4] (Int)
lduw [%i0 + 64], %o5
! move %o5(lower) -> %o1(lower)
or %o5, %o1, %o1

P3042: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f11
fmovd %f36, %f12

P3043: !BST [11] (maybe <- 0x42000108) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3043
nop
RET3043:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P3044: !LD [3] (Int)
lduw [%i0 + 32], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P3045: !BST [5] (maybe <- 0x42000109) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3046: !BLD [6] (FP) (Branch target of P3010)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f14
fmovd %f36, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
fmovs %f19, %f0
ba P3047
nop

TARGET3010:
ba RET3010
nop


P3047: !MEMBAR (Int) (Branch target of P2689)
membar #StoreLoad
ba P3048
nop

TARGET2689:
ba RET2689
nop


P3048: !BST [2] (maybe <- 0x4200010c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3049: !ST [13] (maybe <- 0x42000110) (FP) (Branch target of P2845)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i3 + 64 ]
ba P3050
nop

TARGET2845:
ba RET2845
nop


P3050: !CASX [8] (maybe <- 0x2800027) (Int)
add %i1, 256, %l3
ldx [%l3], %l7
! move %l7(upper) -> %o2(lower)
srlx %l7, 32, %o5
or %o5, %o2, %o2
! move %l7(lower) -> %o3(upper)
sllx %l7, 32, %o3
mov  %l7, %o5
sllx %l4, 32, %l7
casx [%l3], %o5, %l7
! move %l7(upper) -> %o3(lower)
srlx %l7, 32, %l3
or %l3, %o3, %o3
! move %l7(lower) -> %o4(upper)
sllx %l7, 32, %o4
add  %l4, 1, %l4

P3051: !BST [14] (maybe <- 0x42000111) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P3052: !BLD [14] (FP) (Branch target of P2876)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1
ba P3053
nop

TARGET2876:
ba RET2876
nop


P3053: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P3054: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P3055: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P3056: !BST [5] (maybe <- 0x42000112) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3057: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P3058: !BST [11] (maybe <- 0x42000115) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P3059: !BST [8] (maybe <- 0x42000116) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P3060: !BST [8] (maybe <- 0x42000117) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P3061: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P3062: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f4
fmovd %f36, %f18
fmovs %f18, %f5
fmovs %f19, %f6

P3063: !LD [12] (Int)
lduw [%i3 + 0], %o5
! move %o5(lower) -> %o4(lower)
or %o5, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P3064: !BST [3] (maybe <- 0x42000118) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3065: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P3066: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f7

P3067: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P3068: !DWLD [5] (Int)
ldx [%i1 + 72], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P3069: !BST [8] (maybe <- 0x4200011c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P3070: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P3071: !DWST [10] (maybe <- 0x2800028) (Int)
mov %l4, %l3 
sllx %l3, 32, %l3 
stx %l3, [%i2 + 32 ] 
add   %l4, 1, %l4

P3072: !DWLD [14] (Int) (Branch target of P2929)
ldx [%i3 + 128], %l3
! move %l3(upper) -> %o0(lower)
srlx %l3, 32, %o5
or %o5, %o0, %o0
ba P3073
nop

TARGET2929:
ba RET2929
nop


P3073: !BLD [8] (FP) (Branch target of P2940)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9
ba P3074
nop

TARGET2940:
ba RET2940
nop


P3074: !SWAP [8] (maybe <- 0x2800029) (Int)
mov %l4, %o1
swap  [%i1 + 256], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P3075: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P3076: !BST [6] (maybe <- 0x4200011d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3077: !BST [10] (maybe <- 0x42000120) (FP) (Branch target of P2781)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 
ba P3078
nop

TARGET2781:
ba RET2781
nop


P3078: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f10
fmovd %f36, %f18
fmovs %f18, %f11
fmovs %f19, %f12

P3079: !BST [2] (maybe <- 0x42000121) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3079
nop
RET3079:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P3080: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f13

P3081: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P3082: !DWST [7] (maybe <- 0x280002a) (Int) (Branch target of P2805)
sllx %l4, 32, %l7 
add   %l4, 1, %l4
or %l7, %l4, %l7
stx %l7, [%i1 + 80]
add   %l4, 1, %l4
ba P3083
nop

TARGET2805:
ba RET2805
nop


P3083: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P3084: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P3085: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P3086: !MEMBAR (Int)
membar #StoreLoad

P3087: !LD [0] (Int)
lduw [%i0 + 0], %l7
! move %l7(lower) -> %o1(lower)
or %l7, %o1, %o1

P3088: !LD [1] (Int)
lduw [%i0 + 4], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P3089: !LD [2] (Int)
lduw [%i0 + 12], %l7
! move %l7(lower) -> %o2(lower)
or %l7, %o2, %o2

P3090: !LD [3] (Int)
lduw [%i0 + 32], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P3091: !LD [4] (Int)
lduw [%i0 + 64], %l7
! move %l7(lower) -> %o3(lower)
or %l7, %o3, %o3

P3092: !LD [5] (Int)
lduw [%i1 + 76], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P3093: !LD [6] (Int)
lduw [%i1 + 80], %l7
! move %l7(lower) -> %o4(lower)
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P3094: !LD [7] (Int)
lduw [%i1 + 84], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P3095: !LD [8] (Int)
lduw [%i1 + 256], %l7
! move %l7(lower) -> %o0(lower)
or %l7, %o0, %o0

P3096: !LD [9] (Int) (Branch target of P2681)
lduw [%i1 + 512], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
ba P3097
nop

TARGET2681:
ba RET2681
nop


P3097: !LD [10] (Int)
lduw [%i2 + 32], %l7
! move %l7(lower) -> %o1(lower)
or %l7, %o1, %o1

P3098: !LD [11] (Int)
lduw [%i2 + 64], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P3099: !LD [12] (Int)
lduw [%i3 + 0], %l7
! move %l7(lower) -> %o2(lower)
or %l7, %o2, %o2

P3100: !LD [13] (Int)
lduw [%i3 + 64], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P3101: !LD [14] (Int)
lduw [%i3 + 128], %l7
! move %l7(lower) -> %o3(lower)
or %l7, %o3, %o3

P3102: !LD [15] (Int)
lduw [%i3 + 192], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

END_NODES5: ! Test istream for CPU 5 ends
sethi %hi(0xdead0e0f), %l6
or    %l6, %lo(0xdead0e0f), %l6
! move %l6(lower) -> %o4(lower)
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5
stw %l6, [%i5] 
ld [%i5], %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30

restore
retl
nop
!-----------------

! register usage:
! %i0 %i1 %i2 %i3 : base registers for 4 regions
! %i4 fixed pointer to per-cpu results area
! %l1 moving pointer to per-cpu FP results area
! %o7 moving pointer to per-cpu integer results area
! %i5 pointer to per-cpu private area
! %l0 holds lfsr, used as source of random bits 
! %l2 loop count register
! %f16 running counter for unique fp store values
! %f17 holds increment value for fp counter
! %l4 running counter for unique integer store values (increment value is always 1)
! %l5 move-to register for load values (simulation only)
! %f30 move-to register for FP values (simulation only)
! %l3 %l6 %l7 %o5 : 4 temporary registers
! %o0 %o1 %o2 %o3 %o4 : 5 integer results buffer registers
! %f0-f15 FP results buffer registers
! %f32-f47 FP block load/store registers

func6:
! 500 (dynamic) instruction sequence begins
save   %sp, -192, %sp

! Force %i0-%i3 to be 64-byte aligned
add %i0, 63, %i0
andn %i0, 63, %i0

add %i1, 63, %i1
andn %i1, 63, %i1

add %i2, 63, %i2
andn %i2, 63, %i2

add %i3, 63, %i3
andn %i3, 63, %i3

add %i4, 63, %i4
andn %i4, 63, %i4

add %i5, 63, %i5
andn %i5, 63, %i5


! Initialize pointer to FP load results area
mov   %i4, %l1

! Initialize pointer to integer load results area
sethi %hi(0x80000), %o7
or    %o7, %lo(0x80000), %o7
add  %o7, %l1, %o7 

! Initialize %f0-%f62 to 0xdeadbee0deadbee1
sethi %hi(0xdeadbee0), %l3
or    %l3, %lo(0xdeadbee0), %l3
stw   %l3, [%i5]
sethi %hi(0xdeadbee1), %l3
or    %l3, %lo(0xdeadbee1), %l3
stw   %l3, [%i5+4]
ldd [%i5], %f0
fmovd %f0, %f2
fmovd %f0, %f4
fmovd %f0, %f6
fmovd %f0, %f8
fmovd %f0, %f10
fmovd %f0, %f12
fmovd %f0, %f14
fmovd %f0, %f16
fmovd %f0, %f18
fmovd %f0, %f20
fmovd %f0, %f22
fmovd %f0, %f24
fmovd %f0, %f26
fmovd %f0, %f28
fmovd %f0, %f30
fmovd %f0, %f32
fmovd %f0, %f34
fmovd %f0, %f36
fmovd %f0, %f38
fmovd %f0, %f40
fmovd %f0, %f42
fmovd %f0, %f44
fmovd %f0, %f46
fmovd %f0, %f48
fmovd %f0, %f50
fmovd %f0, %f52
fmovd %f0, %f54
fmovd %f0, %f56
fmovd %f0, %f58
fmovd %f0, %f60
fmovd %f0, %f62

! Signature for extract_loads script to start extracting load values for this stream
sethi %hi(0x06deade1), %l3
or    %l3, %lo(0x06deade1), %l3
stw %l3, [%i5] 
ld [%i5], %f16

! Initialize running integer counter in register %l4
sethi %hi(0x3000001), %l4
or    %l4, %lo(0x3000001), %l4

! Initialize running FP counter in register %f16
sethi %hi(0x42800001), %l3
or    %l3, %lo(0x42800001), %l3
stw %l3, [%i5] 
ld [%i5], %f16

! Initialize FP counter increment value in register %f17 (constant)
sethi %hi(0x37000000), %l3
or    %l3, %lo(0x37000000), %l3
stw %l3, [%i5] 
ld [%i5], %f17 

! Initialize LFSR to 0x4e16^4
sethi %hi(0x4e16), %l0
or    %l0, %lo(0x4e16), %l0
mulx  %l0, %l0, %l0
mulx  %l0, %l0, %l0

!-- init shared addrs 12 to 13 ---
stx %g0, [%i3+0]
stx %g0, [%i3+64]

! use untouched cache-line (offset 4K) in replacement area for sync
sub %i1, %i0, %l6
add %i3, %l6, %l6
sub %l6, -4096, %l6

!-- begin of sync_init ---
or %g0, 1, %l7
or %g0, %l7, %o5
swap [%l6+4], %o5
membar #Sync
sync_init_1_6:
brnz,pt %l7, sync_init_1_6
lduw [%l6+4], %l7 ! delay slot
sync_init_2_6:
lduw [%l6], %l7
sub %l7, 1, %o5
cas [%l6], %l7, %o5
cmp %l7, %o5
bne,pt %xcc, sync_init_2_6
nop
membar #Sync
sync_init_3_6:
lduw [%l6], %l7 ! delay slot
brnz,pt %l7, sync_init_3_6
nop
!-- end of sync_init ---


BEGIN_NODES6: ! Test istream for CPU 6 begins

P3103: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f0
membar #Sync 
! 1 addresses covered

P3104: !BST [4] (maybe <- 0x42800001) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P3105: !BLD [0] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1
fmovs %f19, %f2
fmovd %f34, %f18
fmovs %f19, %f3
fmovd %f40, %f4

P3106: !BST [10] (maybe <- 0x42800002) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P3107: !DWST [11] (maybe <- 0x3000001) (Int)
mov %l4, %l7 
sllx %l7, 32, %l7 
stx %l7, [%i2 + 64 ] 
add   %l4, 1, %l4

P3108: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P3109: !BST [12] (maybe <- 0x42800003) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P3110: !SWAP [10] (maybe <- 0x3000002) (Int)
mov %l4, %o0
swap  [%i2 + 32], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
add   %l4, 1, %l4

P3111: !BLD [10] (FP) (Branch target of P3286)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f5
ba P3112
nop

TARGET3286:
ba RET3286
nop


P3112: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f6
fmovd %f36, %f18
fmovs %f18, %f7
fmovs %f19, %f8

P3113: !BST [5] (maybe <- 0x42800004) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3114: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P3115: !BST [4] (maybe <- 0x42800007) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P3116: !BST [13] (maybe <- 0x42800008) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P3117: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P3118: !BST [13] (maybe <- 0x42800009) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P3119: !BLD [4] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3119
nop
RET3119:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P3120: !BST [13] (maybe <- 0x4280000a) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3120
nop
RET3120:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P3121: !REPLACEMENT [3] (Int)
sethi %hi(0x20), %l3
or %l3, %lo(0x20),  %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %i3, %l3, %l3
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P3122: !BLD [1] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f10
fmovd %f34, %f18
fmovs %f19, %f12
fmovd %f40, %f18
fmovs %f18, %f13

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3122
nop
RET3122:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P3123: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P3124: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P3125: !BST [2] (maybe <- 0x4280000b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3126: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P3127: !MEMBAR (Int)
membar #StoreLoad

P3128: !DWST [5] (maybe <- 0x3000003) (Int)
mov %l4, %o5 
stx %o5, [%i1 + 72]
add   %l4, 1, %l4

P3129: !REPLACEMENT [5] (Int)
sethi %hi(0x4c), %l7
or %l7, %lo(0x4c),  %l7
sethi %hi(0x10000), %o5
or %o5, %lo(0x10000),  %o5
add %i3, %l7, %l7
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]

P3130: !BST [5] (maybe <- 0x4280000f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3131: !DWST [8] (maybe <- 0x3000004) (Int)
mov %l4, %l3 
sllx %l3, 32, %l3 
stx %l3, [%i1 + 256 ] 
add   %l4, 1, %l4

P3132: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f14
fmovd %f36, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
fmovs %f19, %f0

P3133: !BLD [2] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1
fmovs %f19, %f2
fmovd %f34, %f18
fmovs %f19, %f3
fmovd %f40, %f4

P3134: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P3135: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P3136: !BST [7] (maybe <- 0x42800012) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3137: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f5

P3138: !BLD [1] (FP) (Branch target of P3226)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f6
fmovd %f34, %f18
fmovs %f19, %f8
fmovd %f40, %f18
fmovs %f18, %f9
ba P3139
nop

TARGET3226:
ba RET3226
nop


P3139: !BST [4] (maybe <- 0x42800015) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P3140: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P3141: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P3142: !SWAP [12] (maybe <- 0x3000005) (Int)
mov %l4, %o5
swap  [%i3 + 0], %o5
! move %o5(lower) -> %o0(lower)
srl %o5, 0, %l6
or %l6, %o0, %o0
add   %l4, 1, %l4

P3143: !BST [7] (maybe <- 0x42800016) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3144: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P3145: !DWST [10] (maybe <- 0x3000006) (Int)
mov %l4, %o5 
sllx %o5, 32, %o5 
stx %o5, [%i2 + 32 ] 
add   %l4, 1, %l4

P3146: !DWST [2] (maybe <- 0x3000007) (Int)
mov %l4, %l7 
stx %l7, [%i0 + 8]
add   %l4, 1, %l4

P3147: !PREFETCH [11] (Int) (CBR)
prefetch [%i2 + 64], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3147
nop
RET3147:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P3148: !BST [3] (maybe <- 0x42800019) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3149: !CAS [1] (maybe <- 0x3000008) (Int)
add %i0, 4, %l7
lduw [%l7], %o1
mov %o1, %l6
! move %l6(lower) -> %o1(upper)
sllx %l6, 32, %o1
mov %l4, %l3
cas [%l7], %l6, %l3
! move %l3(lower) -> %o1(lower)
srl %l3, 0, %l7
or %l7, %o1, %o1
add   %l4, 1, %l4

P3150: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P3151: !BST [13] (maybe <- 0x4280001d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P3152: !BLD [11] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3152
nop
RET3152:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P3153: !DWST [6] (maybe <- 0x3000009) (Int)
sllx %l4, 32, %l6 
add   %l4, 1, %l4
or %l6, %l4, %l6
stx %l6, [%i1 + 80]
add   %l4, 1, %l4

P3154: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P3155: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P3156: !DWST [9] (maybe <- 0x4280001e) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
std %f20, [%i1 + 512]

P3157: !LD [12] (Int)
lduw [%i3 + 0], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P3158: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P3159: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P3160: !BST [15] (maybe <- 0x4280001f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P3161: !PREFETCH [3] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i0 + 32] %asi, 1

P3162: !BST [11] (maybe <- 0x42800020) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P3163: !BST [11] (maybe <- 0x42800021) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P3164: !DWLD [3] (Int)
ldx [%i0 + 32], %o5
! move %o5(upper) -> %o2(lower)
srlx %o5, 32, %l7
or %l7, %o2, %o2

P3165: !BST [14] (maybe <- 0x42800022) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P3166: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30

P3167: !PREFETCH [2] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i0 + 12] %asi, 1

P3168: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P3169: !BLD [0] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f0
membar #Sync 
! 4 addresses covered
fmovs %f3, %f2
fmovs %f8, %f3

P3170: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P3171: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f4
fmovd %f36, %f18
fmovs %f18, %f5
fmovs %f19, %f6

P3172: !PREFETCH [12] (Int) (CBR) (Branch target of P3309)
prefetch [%i3 + 0], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3172
nop
RET3172:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0

ba P3173
nop

TARGET3309:
ba RET3309
nop


P3173: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P3174: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P3175: !PREFETCH [5] (Int) (Branch target of P3324)
prefetch [%i1 + 76], 1
ba P3176
nop

TARGET3324:
ba RET3324
nop


P3176: !SWAP [11] (maybe <- 0x300000b) (Int)
mov %l4, %o3
swap  [%i2 + 64], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P3177: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P3178: !BST [7] (maybe <- 0x42800023) (FP) (Branch target of P3601)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 
ba P3179
nop

TARGET3601:
ba RET3601
nop


P3179: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f36, %f8

P3180: !REPLACEMENT [9] (Int)
sethi %hi(0x200), %l7
or %l7, %lo(0x200),  %l7
sethi %hi(0x10000), %o5
or %o5, %lo(0x10000),  %o5
add %i3, %l7, %l7
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]

P3181: !BST [1] (maybe <- 0x42800026) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3182: !LD [12] (Int) (Branch target of P3465)
lduw [%i3 + 0], %l6
! move %l6(lower) -> %o3(lower)
or %l6, %o3, %o3
ba P3183
nop

TARGET3465:
ba RET3465
nop


P3183: !BLD [0] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f10
fmovd %f34, %f18
fmovs %f19, %f12
fmovd %f40, %f18
fmovs %f18, %f13

P3184: !PREFETCH [6] (Int) (Branch target of P3499)
prefetch [%i1 + 80], 1
ba P3185
nop

TARGET3499:
ba RET3499
nop


P3185: !PREFETCH [12] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i3 + 0] %asi, 1

P3186: !BLD [2] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f14
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
fmovd %f34, %f18
fmovs %f19, %f0
fmovd %f40, %f18
fmovs %f18, %f1

P3187: !PREFETCH [1] (Int) (CBR)
prefetch [%i0 + 4], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3187
nop
RET3187:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P3188: !BST [3] (maybe <- 0x4280002a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3189: !BST [13] (maybe <- 0x4280002e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P3190: !DWLD [12] (Int)
ldx [%i3 + 0], %o4
! move %o4(upper) -> %o4(upper)

P3191: !BST [1] (maybe <- 0x4280002f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3192: !BLD [3] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f2
fmovd %f34, %f18
fmovs %f19, %f4
fmovd %f40, %f18
fmovs %f18, %f5

P3193: !BST [15] (maybe <- 0x42800033) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P3194: !PREFETCH [9] (Int) (Branch target of P3279)
prefetch [%i1 + 512], 1
ba P3195
nop

TARGET3279:
ba RET3279
nop


P3195: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P3196: !BST [3] (maybe <- 0x42800034) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3197: !BST [5] (maybe <- 0x42800038) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3198: !ST [3] (maybe <- 0x300000c) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P3199: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P3200: !BST [0] (maybe <- 0x4280003b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3201: !BST [7] (maybe <- 0x4280003f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3202: !BLD [3] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7
fmovs %f19, %f8
fmovd %f34, %f18
fmovs %f19, %f9
fmovd %f40, %f10

P3203: !DWST [0] (maybe <- 0x300000d) (Int)
sllx %l4, 32, %l3 
add   %l4, 1, %l4
or %l3, %l4, %l3
stx %l3, [%i0 + 0]
add   %l4, 1, %l4

P3204: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P3205: !BLD [1] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11
fmovs %f19, %f12
fmovd %f34, %f18
fmovs %f19, %f13
fmovd %f40, %f14

P3206: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P3207: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P3208: !CAS [0] (maybe <- 0x300000f) (Int)
add %i0, 0, %l3
lduw [%l3], %l7
mov %l7, %o5
! move %o5(lower) -> %o4(lower)
srlx %o4, 32, %o4
sllx %o4, 32, %o4
or %o5, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5
mov %l4, %o0
cas [%l3], %o5, %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
add   %l4, 1, %l4

P3209: !DWLD [14] (Int)
ldx [%i3 + 128], %l3
! move %l3(upper) -> %o0(lower)
srlx %l3, 32, %o5
or %o5, %o0, %o0

P3210: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30

P3211: !BST [12] (maybe <- 0x42800042) (FP) (Branch target of P3475)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 
ba P3212
nop

TARGET3475:
ba RET3475
nop


P3212: !BST [15] (maybe <- 0x42800043) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P3213: !DWST [10] (maybe <- 0x42800044) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
std %f20, [%i2 + 32]

P3214: !REPLACEMENT [10] (Int)
sethi %hi(0x20), %l7
or %l7, %lo(0x20),  %l7
sethi %hi(0x10000), %o5
or %o5, %lo(0x10000),  %o5
add %i3, %l7, %l7
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]

P3215: !LD [14] (Int)
lduw [%i3 + 128], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P3216: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f0
membar #Sync 
! 1 addresses covered

P3217: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P3218: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f2

P3219: !BST [3] (maybe <- 0x42800045) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3220: !BLD [15] (FP) (Branch target of P3426)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3
ba P3221
nop

TARGET3426:
ba RET3426
nop


P3221: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f4

P3222: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P3223: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f5
fmovd %f36, %f6

P3224: !DWST [14] (maybe <- 0x3000010) (Int)
mov %l4, %l7 
sllx %l7, 32, %l7 
stx %l7, [%i3 + 128 ] 
add   %l4, 1, %l4

P3225: !BST [8] (maybe <- 0x42800049) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P3226: !BLD [5] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f8
fmovd %f36, %f18
fmovs %f18, %f9
fmovs %f19, %f10

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3226
nop
RET3226:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P3227: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P3228: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P3229: !BST [14] (maybe <- 0x4280004a) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3229
nop
RET3229:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P3230: !BST [14] (maybe <- 0x4280004b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P3231: !BST [13] (maybe <- 0x4280004c) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3231
nop
RET3231:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P3232: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P3233: !LD [0] (Int)
lduw [%i0 + 0], %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1

P3234: !BST [14] (maybe <- 0x4280004d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P3235: !DWST [10] (maybe <- 0x3000011) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i2 + 32 ] 
add   %l4, 1, %l4

P3236: !BST [11] (maybe <- 0x4280004e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P3237: !BST [0] (maybe <- 0x4280004f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3238: !DWLD [9] (Int)
ldx [%i1 + 512], %o2
! move %o2(upper) -> %o2(upper)

P3239: !BST [2] (maybe <- 0x42800053) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3239
nop
RET3239:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P3240: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P3241: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P3242: !BST [15] (maybe <- 0x42800057) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P3243: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f11

P3244: !DWLD [4] (Int)
ldx [%i0 + 64], %l3
! move %l3(upper) -> %o2(lower)
srlx %o2, 32, %o2
sllx %o2, 32, %o2
srlx %l3, 32, %o5
or %o5, %o2, %o2

P3245: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P3246: !BLD [3] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f12
fmovd %f34, %f18
fmovs %f19, %f14
fmovd %f40, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30

P3247: !LD [11] (Int) (Branch target of P3579)
lduw [%i2 + 64], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
ba P3248
nop

TARGET3579:
ba RET3579
nop


P3248: !DWST [1] (maybe <- 0x3000012) (Int)
sllx %l4, 32, %o5 
add   %l4, 1, %l4
or %o5, %l4, %o5
stx %o5, [%i0 + 0]
add   %l4, 1, %l4

P3249: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P3250: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f0
membar #Sync 
! 1 addresses covered

P3251: !ST [11] (maybe <- 0x3000014) (Int) (Branch target of P3498)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4
ba P3252
nop

TARGET3498:
ba RET3498
nop


P3252: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f36, %f2

P3253: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P3254: !BST [2] (maybe <- 0x42800058) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3254
nop
RET3254:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P3255: !BST [14] (maybe <- 0x4280005c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P3256: !BST [3] (maybe <- 0x4280005d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3257: !BST [4] (maybe <- 0x42800061) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P3258: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P3259: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P3260: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P3261: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P3262: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P3263: !BLD [0] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7
fmovs %f19, %f8
fmovd %f34, %f18
fmovs %f19, %f9
fmovd %f40, %f10

P3264: !BST [9] (maybe <- 0x42800062) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P3265: !BST [11] (maybe <- 0x42800063) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P3266: !BLD [3] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11
fmovs %f19, %f12
fmovd %f34, %f18
fmovs %f19, %f13
fmovd %f40, %f14

P3267: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P3268: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P3269: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P3270: !DWST [6] (maybe <- 0x3000015) (Int)
sllx %l4, 32, %l3 
add   %l4, 1, %l4
or %l3, %l4, %l3
stx %l3, [%i1 + 80]
add   %l4, 1, %l4

P3271: !BST [6] (maybe <- 0x42800064) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3272: !BST [5] (maybe <- 0x42800067) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3273: !MEMBAR (Int)
membar #StoreLoad

P3274: !LD [6] (Int)
lduw [%i1 + 80], %l7
! move %l7(lower) -> %o3(lower)
or %l7, %o3, %o3

P3275: !BST [7] (maybe <- 0x4280006a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3276: !BLD [14] (FP) (Branch target of P3428)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
ba P3277
nop

TARGET3428:
ba RET3428
nop


P3277: !BST [6] (maybe <- 0x4280006d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3278: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f0
membar #Sync 
! 1 addresses covered

P3279: !BLD [6] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f36, %f2

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3279
nop
RET3279:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P3280: !DWST [4] (maybe <- 0x3000017) (Int)
mov %l4, %l7 
sllx %l7, 32, %l7 
stx %l7, [%i0 + 64 ] 
add   %l4, 1, %l4

P3281: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P3282: !LD [0] (Int)
lduw [%i0 + 0], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P3283: !PREFETCH [6] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i1 + 80] %asi, 1

P3284: !DWLD [4] (Int)
ldx [%i0 + 64], %l3
! move %l3(upper) -> %o4(lower)
srlx %l3, 32, %o5
or %o5, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P3285: !LD [14] (Int)
lduw [%i3 + 128], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P3286: !PREFETCH [4] (Int) (CBR)
prefetch [%i0 + 64], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3286
nop
RET3286:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P3287: !BST [4] (maybe <- 0x42800070) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P3288: !ST [4] (maybe <- 0x3000018) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P3289: !BST [2] (maybe <- 0x42800071) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3290: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P3291: !DWST [14] (maybe <- 0x3000019) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 128 ] 
add   %l4, 1, %l4

P3292: !BLD [7] (FP) (Branch target of P3147)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f5
fmovd %f36, %f6
ba P3293
nop

TARGET3147:
ba RET3147
nop


P3293: !BST [3] (maybe <- 0x42800075) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3294: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P3295: !DWLD [13] (Int)
ldx [%i3 + 64], %l3
! move %l3(upper) -> %o0(lower)
srlx %l3, 32, %o5
or %o5, %o0, %o0

P3296: !MEMBAR (Int)
membar #StoreLoad

P3297: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P3298: !BST [3] (maybe <- 0x42800079) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3299: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P3300: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P3301: !PREFETCH [2] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i0 + 12] %asi, 1

P3302: !CASX [7] (maybe <- 0x300001a) (Int)
add %i1, 80, %l6
ldx [%l6], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
mov %o1, %l3
sllx %l4, 32, %o2
add  %l4, 1, %l4
or   %l4, %o2, %o2
casx [%l6], %l3, %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
add  %l4, 1, %l4

P3303: !DWLD [2] (Int)
ldx [%i0 + 8], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P3304: !BST [3] (maybe <- 0x4280007d) (FP) (Branch target of P3376)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 
ba P3305
nop

TARGET3376:
ba RET3376
nop


P3305: !BST [1] (maybe <- 0x42800081) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3306: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P3307: !ST [9] (maybe <- 0x300001c) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P3308: !BLD [1] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9
fmovs %f19, %f10
fmovd %f34, %f18
fmovs %f19, %f11
fmovd %f40, %f12

P3309: !MEMBAR (Int) (CBR)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3309
nop
RET3309:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P3310: !DWST [4] (maybe <- 0x300001d) (Int)
mov %l4, %l3 
sllx %l3, 32, %l3 
stx %l3, [%i0 + 64 ] 
add   %l4, 1, %l4

P3311: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P3312: !CAS [3] (maybe <- 0x300001e) (Int)
add %i0, 32, %l3
lduw [%l3], %l7
mov %l7, %o5
! move %o5(lower) -> %o3(lower)
or %o5, %o3, %o3
mov %l4, %o4
cas [%l3], %o5, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P3313: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P3314: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f13
fmovd %f36, %f14
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30

P3315: !LD [3] (Int)
lduw [%i0 + 32], %l3
! move %l3(lower) -> %o4(lower)
or %l3, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P3316: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P3317: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P3318: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f0
membar #Sync 
! 1 addresses covered

P3319: !BST [12] (maybe <- 0x42800085) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P3320: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P3321: !CASX [0] (maybe <- 0x300001f) (Int)
add %i0, 0, %l6
ldx [%l6], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l3
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%l6], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P3322: !BLD [10] (FP) (Branch target of P3122)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f1
ba P3323
nop

TARGET3122:
ba RET3122
nop


P3323: !DWST [14] (maybe <- 0x3000021) (Int)
mov %l4, %l3 
sllx %l3, 32, %l3 
stx %l3, [%i3 + 128 ] 
add   %l4, 1, %l4

P3324: !PREFETCH [11] (Int) (CBR)
prefetch [%i2 + 64], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3324
nop
RET3324:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P3325: !BST [9] (maybe <- 0x42800086) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P3326: !BST [7] (maybe <- 0x42800087) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3327: !BST [12] (maybe <- 0x4280008a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P3328: !BST [5] (maybe <- 0x4280008b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3329: !BST [12] (maybe <- 0x4280008e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P3330: !BST [1] (maybe <- 0x4280008f) (FP) (Branch target of P3254)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 
ba P3331
nop

TARGET3254:
ba RET3254
nop


P3331: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P3332: !BST [2] (maybe <- 0x42800093) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3333: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P3334: !BST [8] (maybe <- 0x42800097) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P3335: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P3336: !BST [11] (maybe <- 0x42800098) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P3337: !BST [0] (maybe <- 0x42800099) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3338: !BST [3] (maybe <- 0x4280009d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3339: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P3340: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P3341: !BST [14] (maybe <- 0x428000a1) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P3342: !BST [9] (maybe <- 0x428000a2) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3342
nop
RET3342:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P3343: !DWST [4] (maybe <- 0x3000022) (Int)
mov %l4, %l3 
sllx %l3, 32, %l3 
stx %l3, [%i0 + 64 ] 
add   %l4, 1, %l4

P3344: !BST [8] (maybe <- 0x428000a3) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P3345: !NOP (Int)
nop

P3346: !DWLD [9] (Int)
ldx [%i1 + 512], %o2
! move %o2(upper) -> %o2(upper)

P3347: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P3348: !BST [5] (maybe <- 0x428000a4) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3349: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P3350: !DWLD [4] (Int)
ldx [%i0 + 64], %l3
! move %l3(upper) -> %o2(lower)
srlx %o2, 32, %o2
sllx %o2, 32, %o2
srlx %l3, 32, %o5
or %o5, %o2, %o2

P3351: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P3352: !BLD [2] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5
fmovs %f19, %f6
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f40, %f8

P3353: !BST [2] (maybe <- 0x428000a7) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3354: !BST [9] (maybe <- 0x428000ab) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P3355: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P3356: !BLD [14] (FP) (Branch target of P3152)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9
ba P3357
nop

TARGET3152:
ba RET3152
nop


P3357: !CASX [2] (maybe <- 0x3000023) (Int)
add %i0, 8, %l3
ldx [%l3], %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
mov  %o3, %o5
mov %l4, %o4
casx [%l3], %o5, %o4
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5
add  %l4, 1, %l4

P3358: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P3359: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P3360: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f11
fmovd %f36, %f12

P3361: !REPLACEMENT [7] (Int)
sethi %hi(0x54), %o5
or %o5, %lo(0x54),  %o5
sethi %hi(0x10000), %l3
or %l3, %lo(0x10000),  %l3
add %i3, %o5, %o5
add %o5, %l3, %o5
ld [%o5], %l6
st %l6, [%o5]
add %o5, %l3, %o5
ld [%o5], %l6
st %l6, [%o5]
add %o5, %l3, %o5
ld [%o5], %l6
st %l6, [%o5]
add %o5, %l3, %o5
ld [%o5], %l6
st %l6, [%o5]

P3362: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f14
fmovd %f36, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
fmovs %f19, %f0

P3363: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P3364: !DWST [4] (maybe <- 0x3000024) (Int)
mov %l4, %l7 
sllx %l7, 32, %l7 
stx %l7, [%i0 + 64 ] 
add   %l4, 1, %l4

P3365: !BST [14] (maybe <- 0x428000ac) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P3366: !BST [9] (maybe <- 0x428000ad) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P3367: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f1

P3368: !DWST [15] (maybe <- 0x3000025) (Int)
mov %l4, %o5 
sllx %o5, 32, %o5 
stx %o5, [%i3 + 192 ] 
add   %l4, 1, %l4

P3369: !PREFETCH [10] (Int) (Branch target of P3229)
prefetch [%i2 + 32], 1
ba P3370
nop

TARGET3229:
ba RET3229
nop


P3370: !BLD [4] (FP) (Branch target of P3406)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2
ba P3371
nop

TARGET3406:
ba RET3406
nop


P3371: !PREFETCH [7] (Int) (Branch target of P3120)
prefetch [%i1 + 84], 1
ba P3372
nop

TARGET3120:
ba RET3120
nop


P3372: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P3373: !BST [4] (maybe <- 0x428000ae) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P3374: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P3375: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P3376: !PREFETCH [0] (Int) (CBR)
prefetch [%i0 + 0], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3376
nop
RET3376:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P3377: !BLD [2] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f4
fmovd %f34, %f18
fmovs %f19, %f6
fmovd %f40, %f18
fmovs %f18, %f7

P3378: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P3379: !REPLACEMENT [1] (Int)
sethi %hi(0x4), %l7
or %l7, %lo(0x4),  %l7
sethi %hi(0x10000), %o5
or %o5, %lo(0x10000),  %o5
add %i3, %l7, %l7
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]

P3380: !BST [11] (maybe <- 0x428000af) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P3381: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P3382: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P3383: !BST [11] (maybe <- 0x428000b0) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P3384: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P3385: !BLD [9] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3385
nop
RET3385:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P3386: !BST [14] (maybe <- 0x428000b1) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P3387: !BST [4] (maybe <- 0x428000b2) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P3388: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P3389: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P3390: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P3391: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f12
fmovd %f36, %f18
fmovs %f18, %f13
fmovs %f19, %f14

P3392: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30

P3393: !BLD [3] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f0
membar #Sync 
! 4 addresses covered
fmovs %f3, %f2
fmovs %f8, %f3

P3394: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P3395: !PREFETCH [9] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i1 + 512] %asi, 1

P3396: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f4

P3397: !BST [9] (maybe <- 0x428000b3) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P3398: !PREFETCH [13] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i3 + 64] %asi, 1

P3399: !REPLACEMENT [4] (Int)
sethi %hi(0x40), %l6
or %l6, %lo(0x40),  %l6
sethi %hi(0x10000), %l7
or %l7, %lo(0x10000),  %l7
add %i3, %l6, %l6
add %l6, %l7, %l6
ld [%l6], %o5
st %o5, [%l6]
add %l6, %l7, %l6
ld [%l6], %o5
st %o5, [%l6]
add %l6, %l7, %l6
ld [%l6], %o5
st %o5, [%l6]
add %l6, %l7, %l6
ld [%l6], %o5
st %o5, [%l6]

P3400: !BST [8] (maybe <- 0x428000b4) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P3401: !BST [8] (maybe <- 0x428000b5) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P3402: !BST [9] (maybe <- 0x428000b6) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P3403: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P3404: !BLD [1] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f6
fmovd %f34, %f18
fmovs %f19, %f8
fmovd %f40, %f18
fmovs %f18, %f9

P3405: !ST [6] (maybe <- 0x3000026) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P3406: !DWST [2] (maybe <- 0x3000027) (Int) (CBR)
mov %l4, %l3 
stx %l3, [%i0 + 8]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3406
nop
RET3406:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P3407: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P3408: !BLD [0] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11
fmovs %f19, %f12
fmovd %f34, %f18
fmovs %f19, %f13
fmovd %f40, %f14

P3409: !REPLACEMENT [13] (Int)
sethi %hi(0x40), %l3
or %l3, %lo(0x40),  %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %i3, %l3, %l3
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P3410: !BLD [0] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
fmovs %f19, %f0
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f40, %f2

P3411: !BST [3] (maybe <- 0x428000b7) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3412: !BST [9] (maybe <- 0x428000bb) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P3413: !BLD [7] (FP) (Branch target of P3342)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f3
fmovd %f36, %f4
ba P3414
nop

TARGET3342:
ba RET3342
nop


P3414: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P3415: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P3416: !PREFETCH [13] (Int) (CBR)
prefetch [%i3 + 64], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3416
nop
RET3416:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P3417: !SWAP [0] (maybe <- 0x3000028) (Int)
mov %l4, %o0
swap  [%i0 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
add   %l4, 1, %l4

P3418: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f6

P3419: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f36, %f8

P3420: !MEMBAR (Int)
membar #StoreLoad

P3421: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P3422: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P3423: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P3424: !BLD [1] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11
fmovs %f19, %f12
fmovd %f34, %f18
fmovs %f19, %f13
fmovd %f40, %f14

P3425: !REPLACEMENT [10] (Int)
sethi %hi(0x20), %l6
or %l6, %lo(0x20),  %l6
sethi %hi(0x10000), %l7
or %l7, %lo(0x10000),  %l7
add %i3, %l6, %l6
add %l6, %l7, %l6
ld [%l6], %o5
st %o5, [%l6]
add %l6, %l7, %l6
ld [%l6], %o5
st %o5, [%l6]
add %l6, %l7, %l6
ld [%l6], %o5
st %o5, [%l6]
add %l6, %l7, %l6
ld [%l6], %o5
st %o5, [%l6]

P3426: !PREFETCH [2] (Int) (CBR)
prefetch [%i0 + 12], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3426
nop
RET3426:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P3427: !BST [11] (maybe <- 0x428000bc) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P3428: !REPLACEMENT [2] (Int) (CBR)
sethi %hi(0xc), %l3
or %l3, %lo(0xc),  %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %i3, %l3, %l3
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3428
nop
RET3428:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P3429: !BST [7] (maybe <- 0x428000bd) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3430: !LD [1] (Int)
lduw [%i0 + 4], %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0

P3431: !BST [12] (maybe <- 0x428000c0) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P3432: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
fmovd %f36, %f0

P3433: !BST [7] (maybe <- 0x428000c1) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3434: !ST [5] (maybe <- 0x3000029) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P3435: !BST [1] (maybe <- 0x428000c4) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3436: !DWLD [14] (Int)
ldx [%i3 + 128], %o1
! move %o1(upper) -> %o1(upper)

P3437: !BST [0] (maybe <- 0x428000c8) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3438: !BST [6] (maybe <- 0x428000cc) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3439: !REPLACEMENT [8] (Int)
sethi %hi(0x100), %l6
or %l6, %lo(0x100),  %l6
sethi %hi(0x10000), %l7
or %l7, %lo(0x10000),  %l7
add %i3, %l6, %l6
add %l6, %l7, %l6
ld [%l6], %o5
st %o5, [%l6]
add %l6, %l7, %l6
ld [%l6], %o5
st %o5, [%l6]
add %l6, %l7, %l6
ld [%l6], %o5
st %o5, [%l6]
add %l6, %l7, %l6
ld [%l6], %o5
st %o5, [%l6]

P3440: !BST [6] (maybe <- 0x428000cf) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3441: !BLD [3] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f2
fmovd %f34, %f18
fmovs %f19, %f4
fmovd %f40, %f18
fmovs %f18, %f5

P3442: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P3443: !BST [14] (maybe <- 0x428000d2) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P3444: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P3445: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P3446: !BST [15] (maybe <- 0x428000d3) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P3447: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P3448: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P3449: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P3450: !DWST [2] (maybe <- 0x300002a) (Int)
mov %l4, %l6 
stx %l6, [%i0 + 8]
add   %l4, 1, %l4

P3451: !BST [10] (maybe <- 0x428000d4) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P3452: !BST [3] (maybe <- 0x428000d5) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3453: !BST [14] (maybe <- 0x428000d9) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3453
nop
RET3453:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P3454: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P3455: !BLD [0] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f10
fmovd %f34, %f18
fmovs %f19, %f12
fmovd %f40, %f18
fmovs %f18, %f13

P3456: !BST [0] (maybe <- 0x428000da) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3457: !ST [1] (maybe <- 0x300002b) (Int) (LE)
wr %g0, 0x88, %asi
! Change single-word-level endianess (big endian <-> little endian) 
sethi %hi(0xff00ff00), %l7
or %l7, %lo(0xff00ff00), %l7
and %l4, %l7, %o5
srl %o5, 8, %o5
sll %l4, 8, %l6
and %l6, %l7, %l6
or %l6, %o5, %l6
srl %l6, 16, %o5
sll %l6, 16, %l6
srl %l6, 0, %l6
or %l6, %o5, %l6
stwa   %l6, [%i0 + 4] %asi
add   %l4, 1, %l4

P3458: !BST [7] (maybe <- 0x428000de) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3459: !BLD [2] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f14
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
fmovd %f34, %f18
fmovs %f19, %f0
fmovd %f40, %f18
fmovs %f18, %f1

P3460: !BST [8] (maybe <- 0x428000e1) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P3461: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P3462: !BLD [10] (FP) (Branch target of P3239)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f2
ba P3463
nop

TARGET3239:
ba RET3239
nop


P3463: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P3464: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P3465: !BLD [10] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3465
nop
RET3465:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P3466: !BST [2] (maybe <- 0x428000e2) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3467: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P3468: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P3469: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P3470: !BST [7] (maybe <- 0x428000e6) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3471: !LD [6] (Int) (Branch target of P3172)
lduw [%i1 + 80], %l7
! move %l7(lower) -> %o1(lower)
srlx %o1, 32, %o1
sllx %o1, 32, %o1
or %l7, %o1, %o1
ba P3472
nop

TARGET3172:
ba RET3172
nop


P3472: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f6
fmovd %f36, %f18
fmovs %f18, %f7
fmovs %f19, %f8

P3473: !BST [5] (maybe <- 0x428000e9) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3474: !PREFETCH [14] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i3 + 128] %asi, 1

P3475: !BLD [7] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f9
fmovd %f36, %f10

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3475
nop
RET3475:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P3476: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P3477: !BLD [0] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13
fmovs %f19, %f14
fmovd %f34, %f18
fmovs %f19, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
fmovd %f40, %f0

P3478: !BST [5] (maybe <- 0x428000ec) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3479: !NOP (Int)
nop

P3480: !BST [0] (maybe <- 0x428000ef) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3481: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P3482: !BST [6] (maybe <- 0x428000f3) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3483: !ST [10] (maybe <- 0x428000f6) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i2 + 32 ]

P3484: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f1

P3485: !BLD [1] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f2
fmovd %f34, %f18
fmovs %f19, %f4
fmovd %f40, %f18
fmovs %f18, %f5

P3486: !BLD [2] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f6
fmovd %f34, %f18
fmovs %f19, %f8
fmovd %f40, %f18
fmovs %f18, %f9

P3487: !CAS [8] (maybe <- 0x300002c) (Int)
add %i1, 256, %l3
lduw [%l3], %o2
mov %o2, %o5
! move %o5(lower) -> %o2(upper)
sllx %o5, 32, %o2
mov %l4, %l7
cas [%l3], %o5, %l7
! move %l7(lower) -> %o2(lower)
srl %l7, 0, %l3
or %l3, %o2, %o2
add   %l4, 1, %l4

P3488: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P3489: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P3490: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P3491: !BST [13] (maybe <- 0x428000f7) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P3492: !BST [6] (maybe <- 0x428000f8) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3493: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f11
fmovd %f36, %f12

P3494: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P3495: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P3496: !BST [9] (maybe <- 0x428000fb) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P3497: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P3498: !DWST [9] (maybe <- 0x300002d) (Int) (CBR)
mov %l4, %l3 
sllx %l3, 32, %l3 
stx %l3, [%i1 + 512 ] 
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3498
nop
RET3498:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P3499: !BLD [11] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3499
nop
RET3499:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P3500: !DWLD [5] (Int)
ldx [%i1 + 72], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P3501: !DWLD [13] (Int)
ldx [%i3 + 64], %l3
! move %l3(upper) -> %o3(lower)
srlx %l3, 32, %o5
or %o5, %o3, %o3

P3502: !BST [5] (maybe <- 0x428000fc) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3503: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f0
membar #Sync 
! 1 addresses covered

P3504: !DWLD [9] (Int)
ldx [%i1 + 512], %o4
! move %o4(upper) -> %o4(upper)

P3505: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P3506: !BST [6] (maybe <- 0x428000ff) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3507: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P3508: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f36, %f2

P3509: !LD [5] (Int)
lduw [%i1 + 76], %l7
! move %l7(lower) -> %o4(lower)
srlx %o4, 32, %o4
sllx %o4, 32, %o4
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P3510: !BST [7] (maybe <- 0x42800102) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3511: !BST [8] (maybe <- 0x42800105) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P3512: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P3513: !BST [1] (maybe <- 0x42800106) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3514: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f5
fmovd %f36, %f6

P3515: !BLD [5] (FP) (Branch target of P3385)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f8
fmovd %f36, %f18
fmovs %f18, %f9
fmovs %f19, %f10
ba P3516
nop

TARGET3385:
ba RET3385
nop


P3516: !BST [8] (maybe <- 0x4280010a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P3517: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P3518: !CAS [11] (maybe <- 0x300002e) (Int)
add %i2, 64, %l3
lduw [%l3], %o0
mov %o0, %o5
! move %o5(lower) -> %o0(upper)
sllx %o5, 32, %o0
mov %l4, %l7
cas [%l3], %o5, %l7
! move %l7(lower) -> %o0(lower)
srl %l7, 0, %l3
or %l3, %o0, %o0
add   %l4, 1, %l4

P3519: !BST [9] (maybe <- 0x4280010b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P3520: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P3521: !LD [9] (Int)
lduw [%i1 + 512], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P3522: !DWLD [0] (Int)
ldx [%i0 + 0], %l6
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %l3
or %l3, %o1, %o1
! move %l6(lower) -> %o2(upper)
sllx %l6, 32, %o2

P3523: !BST [6] (maybe <- 0x4280010c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3524: !CASX [12] (maybe <- 0x300002f) (Int)
add %i3, 0, %l7
ldx [%l7], %l3
! move %l3(upper) -> %o2(lower)
srlx %l3, 32, %l6
or %l6, %o2, %o2
! move %l3(lower) -> %o3(upper)
sllx %l3, 32, %o3
mov  %l3, %l6
sllx %l4, 32, %l3
casx [%l7], %l6, %l3
! move %l3(upper) -> %o3(lower)
srlx %l3, 32, %l7
or %l7, %o3, %o3
! move %l3(lower) -> %o4(upper)
sllx %l3, 32, %o4
add  %l4, 1, %l4

P3525: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P3526: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P3527: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P3528: !DWST [2] (maybe <- 0x3000030) (Int)
mov %l4, %l6 
stx %l6, [%i0 + 8]
add   %l4, 1, %l4

P3529: !BLD [2] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
fmovs %f19, %f0
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f40, %f2

P3530: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P3531: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P3532: !BST [1] (maybe <- 0x4280010f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3533: !BST [12] (maybe <- 0x42800113) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P3534: !SWAP [9] (maybe <- 0x3000031) (Int)
mov %l4, %l3
swap  [%i1 + 512], %l3
! move %l3(lower) -> %o4(lower)
srl %l3, 0, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5
add   %l4, 1, %l4

P3535: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P3536: !BLD [2] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f4
fmovd %f34, %f18
fmovs %f19, %f6
fmovd %f40, %f18
fmovs %f18, %f7

P3537: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f8
fmovd %f36, %f18
fmovs %f18, %f9
fmovs %f19, %f10

P3538: !ST [12] (maybe <- 0x3000032) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P3539: !DWST [9] (maybe <- 0x3000033) (Int)
mov %l4, %l3 
sllx %l3, 32, %l3 
stx %l3, [%i1 + 512 ] 
add   %l4, 1, %l4

P3540: !BST [13] (maybe <- 0x42800114) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P3541: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P3542: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P3543: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P3544: !BST [3] (maybe <- 0x42800115) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3545: !BLD [3] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11
fmovs %f19, %f12
fmovd %f34, %f18
fmovs %f19, %f13
fmovd %f40, %f14

P3546: !BST [1] (maybe <- 0x42800119) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3547: !BST [12] (maybe <- 0x4280011d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P3548: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30

P3549: !BST [14] (maybe <- 0x4280011e) (FP) (Branch target of P3187)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 
ba P3550
nop

TARGET3187:
ba RET3187
nop


P3550: !BST [12] (maybe <- 0x4280011f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P3551: !DWLD [9] (FP)
ldd [%i1 + 512], %f0
! 1 addresses covered

P3552: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P3553: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P3554: !ST [1] (maybe <- 0x3000034) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P3555: !ST [4] (maybe <- 0x3000035) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P3556: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P3557: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P3558: !DWLD [6] (Int)
ldx [%i1 + 80], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)

P3559: !CASX [5] (maybe <- 0x3000036) (Int)
add %i1, 72, %l7
ldx [%l7], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
mov  %o1, %l6
mov %l4, %o2
casx [%l7], %l6, %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
add  %l4, 1, %l4

P3560: !ST [15] (maybe <- 0x3000037) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P3561: !BLD [11] (FP) (Branch target of P3119)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4
ba P3562
nop

TARGET3119:
ba RET3119
nop


P3562: !DWLD [11] (Int)
ldx [%i2 + 64], %o3
! move %o3(upper) -> %o3(upper)

P3563: !BST [14] (maybe <- 0x42800120) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P3564: !BST [3] (maybe <- 0x42800121) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3565: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f5

P3566: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P3567: !DWST [14] (maybe <- 0x3000038) (Int)
mov %l4, %l3 
sllx %l3, 32, %l3 
stx %l3, [%i3 + 128 ] 
add   %l4, 1, %l4

P3568: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f6

P3569: !BST [15] (maybe <- 0x42800125) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P3570: !BLD [14] (FP) (Branch target of P3231)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7
ba P3571
nop

TARGET3231:
ba RET3231
nop


P3571: !BST [0] (maybe <- 0x42800126) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3572: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P3573: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P3574: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P3575: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P3576: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P3577: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P3578: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P3579: !PREFETCH [10] (Int) (CBR)
prefetch [%i2 + 32], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3579
nop
RET3579:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P3580: !BLD [2] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f8
fmovd %f34, %f18
fmovs %f19, %f10
fmovd %f40, %f18
fmovs %f18, %f11

P3581: !BLD [3] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f12
fmovd %f34, %f18
fmovs %f19, %f14
fmovd %f40, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30

P3582: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P3583: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f0
membar #Sync 
! 1 addresses covered

P3584: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P3585: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f36, %f2

P3586: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P3587: !PREFETCH [4] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i0 + 64] %asi, 1

P3588: !BST [6] (maybe <- 0x4280012a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3589: !DWLD [6] (Int)
ldx [%i1 + 80], %l7
! move %l7(upper) -> %o3(lower)
srlx %o3, 32, %o3
sllx %o3, 32, %o3
srlx %l7, 32, %l6
or %l6, %o3, %o3
! move %l7(lower) -> %o4(upper)
sllx %l7, 32, %o4

P3590: !BST [14] (maybe <- 0x4280012d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P3591: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P3592: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P3593: !BST [9] (maybe <- 0x4280012e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P3594: !BLD [1] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f6
fmovd %f34, %f18
fmovs %f19, %f8
fmovd %f40, %f18
fmovs %f18, %f9

P3595: !BST [9] (maybe <- 0x4280012f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P3596: !BST [8] (maybe <- 0x42800130) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P3597: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P3598: !BST [14] (maybe <- 0x42800131) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P3599: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P3600: !BST [14] (maybe <- 0x42800132) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P3601: !BST [5] (maybe <- 0x42800133) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3601
nop
RET3601:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P3602: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P3603: !MEMBAR (Int)
membar #StoreLoad

P3604: !LD [0] (Int)
lduw [%i0 + 0], %l7
! move %l7(lower) -> %o4(lower)
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P3605: !LD [1] (Int) (LE)
wr %g0, 0x88, %asi
lduwa [%i0 + 4] %asi, %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P3606: !LD [2] (Int)
lduw [%i0 + 12], %l7
! move %l7(lower) -> %o0(lower)
or %l7, %o0, %o0

P3607: !LD [3] (Int)
lduw [%i0 + 32], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P3608: !LD [4] (Int) (LE)
wr %g0, 0x88, %asi
lduwa [%i0 + 64] %asi, %l7
! move %l7(lower) -> %o1(lower)
or %l7, %o1, %o1

P3609: !LD [5] (Int)
lduw [%i1 + 76], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P3610: !LD [6] (Int)
lduw [%i1 + 80], %l7
! move %l7(lower) -> %o2(lower)
or %l7, %o2, %o2

P3611: !LD [7] (Int)
lduw [%i1 + 84], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P3612: !LD [8] (FP)
ld [%i1 + 256], %f12
! 1 addresses covered

P3613: !LD [9] (Int) (Branch target of P3453)
lduw [%i1 + 512], %l7
! move %l7(lower) -> %o3(lower)
or %l7, %o3, %o3
ba P3614
nop

TARGET3453:
ba RET3453
nop


P3614: !LD [10] (Int) (Branch target of P3416)
lduw [%i2 + 32], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
ba P3615
nop

TARGET3416:
ba RET3416
nop


P3615: !LD [11] (Int)
lduw [%i2 + 64], %l7
! move %l7(lower) -> %o4(lower)
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P3616: !LD [12] (Int)
lduw [%i3 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P3617: !LD [13] (Int)
lduw [%i3 + 64], %l7
! move %l7(lower) -> %o0(lower)
or %l7, %o0, %o0

P3618: !LD [14] (FP)
ld [%i3 + 128], %f13
! 1 addresses covered

P3619: !LD [15] (Int)
lduw [%i3 + 192], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

END_NODES6: ! Test istream for CPU 6 ends
sethi %hi(0xdead0e0f), %l6
or    %l6, %lo(0xdead0e0f), %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1
stw %l6, [%i5] 
ld [%i5], %f14
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30

restore
retl
nop
!-----------------

! register usage:
! %i0 %i1 %i2 %i3 : base registers for 4 regions
! %i4 fixed pointer to per-cpu results area
! %l1 moving pointer to per-cpu FP results area
! %o7 moving pointer to per-cpu integer results area
! %i5 pointer to per-cpu private area
! %l0 holds lfsr, used as source of random bits 
! %l2 loop count register
! %f16 running counter for unique fp store values
! %f17 holds increment value for fp counter
! %l4 running counter for unique integer store values (increment value is always 1)
! %l5 move-to register for load values (simulation only)
! %f30 move-to register for FP values (simulation only)
! %l3 %l6 %l7 %o5 : 4 temporary registers
! %o0 %o1 %o2 %o3 %o4 : 5 integer results buffer registers
! %f0-f15 FP results buffer registers
! %f32-f47 FP block load/store registers

func7:
! 500 (dynamic) instruction sequence begins
save   %sp, -192, %sp

! Force %i0-%i3 to be 64-byte aligned
add %i0, 63, %i0
andn %i0, 63, %i0

add %i1, 63, %i1
andn %i1, 63, %i1

add %i2, 63, %i2
andn %i2, 63, %i2

add %i3, 63, %i3
andn %i3, 63, %i3

add %i4, 63, %i4
andn %i4, 63, %i4

add %i5, 63, %i5
andn %i5, 63, %i5


! Initialize pointer to FP load results area
mov   %i4, %l1

! Initialize pointer to integer load results area
sethi %hi(0x80000), %o7
or    %o7, %lo(0x80000), %o7
add  %o7, %l1, %o7 

! Initialize %f0-%f62 to 0xdeadbee0deadbee1
sethi %hi(0xdeadbee0), %l3
or    %l3, %lo(0xdeadbee0), %l3
stw   %l3, [%i5]
sethi %hi(0xdeadbee1), %l3
or    %l3, %lo(0xdeadbee1), %l3
stw   %l3, [%i5+4]
ldd [%i5], %f0
fmovd %f0, %f2
fmovd %f0, %f4
fmovd %f0, %f6
fmovd %f0, %f8
fmovd %f0, %f10
fmovd %f0, %f12
fmovd %f0, %f14
fmovd %f0, %f16
fmovd %f0, %f18
fmovd %f0, %f20
fmovd %f0, %f22
fmovd %f0, %f24
fmovd %f0, %f26
fmovd %f0, %f28
fmovd %f0, %f30
fmovd %f0, %f32
fmovd %f0, %f34
fmovd %f0, %f36
fmovd %f0, %f38
fmovd %f0, %f40
fmovd %f0, %f42
fmovd %f0, %f44
fmovd %f0, %f46
fmovd %f0, %f48
fmovd %f0, %f50
fmovd %f0, %f52
fmovd %f0, %f54
fmovd %f0, %f56
fmovd %f0, %f58
fmovd %f0, %f60
fmovd %f0, %f62

! Signature for extract_loads script to start extracting load values for this stream
sethi %hi(0x07deade1), %l3
or    %l3, %lo(0x07deade1), %l3
stw %l3, [%i5] 
ld [%i5], %f16

! Initialize running integer counter in register %l4
sethi %hi(0x3800001), %l4
or    %l4, %lo(0x3800001), %l4

! Initialize running FP counter in register %f16
sethi %hi(0x43000001), %l3
or    %l3, %lo(0x43000001), %l3
stw %l3, [%i5] 
ld [%i5], %f16

! Initialize FP counter increment value in register %f17 (constant)
sethi %hi(0x37800000), %l3
or    %l3, %lo(0x37800000), %l3
stw %l3, [%i5] 
ld [%i5], %f17 

! Initialize LFSR to 0x6f13^4
sethi %hi(0x6f13), %l0
or    %l0, %lo(0x6f13), %l0
mulx  %l0, %l0, %l0
mulx  %l0, %l0, %l0

!-- init shared addrs 14 to 15 ---
stx %g0, [%i3+128]
stx %g0, [%i3+192]

! use untouched cache-line (offset 4K) in replacement area for sync
sub %i1, %i0, %l6
add %i3, %l6, %l6
sub %l6, -4096, %l6

!-- begin of sync_init ---
or %g0, 1, %l7
or %g0, %l7, %o5
swap [%l6+4], %o5
membar #Sync
sync_init_1_7:
brnz,pt %l7, sync_init_1_7
lduw [%l6+4], %l7 ! delay slot
sync_init_2_7:
lduw [%l6], %l7
sub %l7, 1, %o5
cas [%l6], %l7, %o5
cmp %l7, %o5
bne,pt %xcc, sync_init_2_7
nop
membar #Sync
sync_init_3_7:
lduw [%l6], %l7 ! delay slot
brnz,pt %l7, sync_init_3_7
nop
!-- end of sync_init ---


BEGIN_NODES7: ! Test istream for CPU 7 begins

P3620: !BST [9] (maybe <- 0x43000001) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P3621: !BST [5] (maybe <- 0x43000002) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3621
nop
RET3621:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P3622: !BLD [0] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f0
membar #Sync 
! 4 addresses covered
fmovs %f3, %f2
fmovs %f8, %f3

P3623: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P3624: !BLD [1] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f4
fmovd %f34, %f18
fmovs %f19, %f6
fmovd %f40, %f18
fmovs %f18, %f7

P3625: !BLD [1] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f8
fmovd %f34, %f18
fmovs %f19, %f10
fmovd %f40, %f18
fmovs %f18, %f11

P3626: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P3627: !BST [4] (maybe <- 0x43000005) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P3628: !LD [12] (Int)
lduw [%i3 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P3629: !BST [3] (maybe <- 0x43000006) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3630: !BST [0] (maybe <- 0x4300000a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3631: !BST [13] (maybe <- 0x4300000e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P3632: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P3633: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P3634: !DWST [1] (maybe <- 0x3800001) (Int)
sllx %l4, 32, %l6 
add   %l4, 1, %l4
or %l6, %l4, %l6
stx %l6, [%i0 + 0]
add   %l4, 1, %l4

P3635: !BST [12] (maybe <- 0x4300000f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P3636: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P3637: !DWST [4] (maybe <- 0x3800003) (Int)
mov %l4, %o5 
sllx %o5, 32, %o5 
stx %o5, [%i0 + 64 ] 
add   %l4, 1, %l4

P3638: !BLD [2] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f14
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
fmovd %f34, %f18
fmovs %f19, %f0
fmovd %f40, %f18
fmovs %f18, %f1

P3639: !CASX [11] (maybe <- 0x3800004) (Int)
add %i2, 64, %o5
ldx [%o5], %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l7
or %l7, %o0, %o0
! move %l6(lower) -> %o1(upper)
sllx %l6, 32, %o1
mov  %l6, %l7
sllx %l4, 32, %l6
casx [%o5], %l7, %l6
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %o5
or %o5, %o1, %o1
! move %l6(lower) -> %o2(upper)
sllx %l6, 32, %o2
add  %l4, 1, %l4

P3640: !DWLD [4] (Int)
ldx [%i0 + 64], %o5
! move %o5(upper) -> %o2(lower)
srlx %o5, 32, %l7
or %l7, %o2, %o2

P3641: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f2
fmovd %f36, %f18
fmovs %f18, %f3
fmovs %f19, %f4

P3642: !BST [4] (maybe <- 0x43000010) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P3643: !ST [9] (maybe <- 0x3800005) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P3644: !DWLD [9] (Int)
ldx [%i1 + 512], %o3
! move %o3(upper) -> %o3(upper)

P3645: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P3646: !REPLACEMENT [9] (Int) (CBR)
sethi %hi(0x200), %l3
or %l3, %lo(0x200),  %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %i3, %l3, %l3
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3646
nop
RET3646:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P3647: !ST [13] (maybe <- 0x3800006) (Int) (LE)
wr %g0, 0x88, %asi
! Change single-word-level endianess (big endian <-> little endian) 
sethi %hi(0xff00ff00), %l6
or %l6, %lo(0xff00ff00), %l6
and %l4, %l6, %l7
srl %l7, 8, %l7
sll %l4, 8, %l3
and %l3, %l6, %l3
or %l3, %l7, %l3
srl %l3, 16, %l7
sll %l3, 16, %l3
srl %l3, 0, %l3
or %l3, %l7, %l3
stwa   %l3, [%i3 + 64] %asi
add   %l4, 1, %l4

P3648: !BST [13] (maybe <- 0x43000011) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P3649: !BST [2] (maybe <- 0x43000012) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3650: !LD [1] (Int)
lduw [%i0 + 4], %l7
! move %l7(lower) -> %o3(lower)
srlx %o3, 32, %o3
sllx %o3, 32, %o3
or %l7, %o3, %o3

P3651: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f5
fmovd %f36, %f6

P3652: !BST [12] (maybe <- 0x43000016) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P3653: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P3654: !BST [13] (maybe <- 0x43000017) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P3655: !BST [6] (maybe <- 0x43000018) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3656: !BST [11] (maybe <- 0x4300001b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P3657: !BST [10] (maybe <- 0x4300001c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P3658: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P3659: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P3660: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P3661: !DWLD [15] (Int)
ldx [%i3 + 192], %o4
! move %o4(upper) -> %o4(upper)

P3662: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P3663: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P3664: !BST [11] (maybe <- 0x4300001d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P3665: !BST [5] (maybe <- 0x4300001e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3666: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P3667: !BST [5] (maybe <- 0x43000021) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3668: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f11
fmovd %f36, %f12

P3669: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P3670: !BST [15] (maybe <- 0x43000024) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P3671: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f14
fmovd %f36, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
fmovs %f19, %f0

P3672: !BST [6] (maybe <- 0x43000025) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3673: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P3674: !BST [8] (maybe <- 0x43000028) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P3675: !REPLACEMENT [13] (Int)
sethi %hi(0x40), %l7
or %l7, %lo(0x40),  %l7
sethi %hi(0x10000), %o5
or %o5, %lo(0x10000),  %o5
add %i3, %l7, %l7
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]

P3676: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P3677: !MEMBAR (Int)
membar #StoreLoad

P3678: !BST [8] (maybe <- 0x43000029) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P3679: !BLD [1] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f2
fmovd %f34, %f18
fmovs %f19, %f4
fmovd %f40, %f18
fmovs %f18, %f5

P3680: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P3681: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P3682: !BST [7] (maybe <- 0x4300002a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3683: !LD [4] (Int)
lduw [%i0 + 64], %l3
! move %l3(lower) -> %o4(lower)
srlx %o4, 32, %o4
sllx %o4, 32, %o4
or %l3, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P3684: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P3685: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f36, %f8

P3686: !DWST [8] (maybe <- 0x3800007) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 256 ] 
add   %l4, 1, %l4

P3687: !BST [14] (maybe <- 0x4300002d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P3688: !BST [2] (maybe <- 0x4300002e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3689: !BST [12] (maybe <- 0x43000032) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P3690: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P3691: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P3692: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P3693: !LD [11] (Int)
lduw [%i2 + 64], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P3694: !BLD [1] (FP) (Branch target of P3807)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f12
fmovd %f34, %f18
fmovs %f19, %f14
fmovd %f40, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
ba P3695
nop

TARGET3807:
ba RET3807
nop


P3695: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P3696: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f0
membar #Sync 
! 3 addresses covered
fmovs %f3, %f0
fmovs %f4, %f1
fmovs %f5, %f2

P3697: !BST [13] (maybe <- 0x43000033) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P3698: !DWLD [9] (FP)
ldd [%i1 + 512], %f18
! 1 addresses covered
fmovs %f18, %f3

P3699: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P3700: !BST [2] (maybe <- 0x43000034) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3701: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P3702: !BST [5] (maybe <- 0x43000038) (FP) (Branch target of P3906)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 
ba P3703
nop

TARGET3906:
ba RET3906
nop


P3703: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P3704: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P3705: !BST [6] (maybe <- 0x4300003b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3706: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f6
fmovd %f36, %f18
fmovs %f18, %f7
fmovs %f19, %f8

P3707: !BLD [7] (FP) (Branch target of P3948)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f9
fmovd %f36, %f10
ba P3708
nop

TARGET3948:
ba RET3948
nop


P3708: !BLD [1] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f12
fmovd %f34, %f18
fmovs %f19, %f14
fmovd %f40, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30

P3709: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P3710: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P3711: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f0
membar #Sync 
! 1 addresses covered

P3712: !DWLD [2] (Int)
ldx [%i0 + 8], %l3
! move %l3(lower) -> %o0(lower)
srl %l3, 0, %o5
or %o5, %o0, %o0

P3713: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P3714: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P3715: !BST [1] (maybe <- 0x4300003e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3716: !BLD [2] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1
fmovs %f19, %f2
fmovd %f34, %f18
fmovs %f19, %f3
fmovd %f40, %f4

P3717: !DWST [14] (maybe <- 0x3800008) (Int)
mov %l4, %l3 
sllx %l3, 32, %l3 
stx %l3, [%i3 + 128 ] 
add   %l4, 1, %l4

P3718: !BST [12] (maybe <- 0x43000042) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P3719: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P3720: !BST [1] (maybe <- 0x43000043) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3721: !DWST [11] (maybe <- 0x3800009) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i2 + 64 ] 
add   %l4, 1, %l4

P3722: !BST [0] (maybe <- 0x43000047) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3723: !BST [5] (maybe <- 0x4300004b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3724: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P3725: !BST [7] (maybe <- 0x4300004e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3726: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P3727: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P3728: !BST [10] (maybe <- 0x43000051) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P3729: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f36, %f8

P3730: !BLD [8] (FP) (Branch target of P3904)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10
ba P3731
nop

TARGET3904:
ba RET3904
nop


P3731: !BLD [2] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11
fmovs %f19, %f12
fmovd %f34, %f18
fmovs %f19, %f13
fmovd %f40, %f14

P3732: !SWAP [14] (maybe <- 0x380000a) (Int)
mov %l4, %o1
swap  [%i3 + 128], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P3733: !BST [8] (maybe <- 0x43000052) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P3734: !MEMBAR (Int)
membar #StoreLoad

P3735: !BST [8] (maybe <- 0x43000053) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P3736: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P3737: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P3738: !DWLD [4] (Int)
ldx [%i0 + 64], %l7
! move %l7(upper) -> %o1(lower)
srlx %l7, 32, %l6
or %l6, %o1, %o1

P3739: !BLD [15] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3739
nop
RET3739:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P3740: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f0
membar #Sync 
! 1 addresses covered

P3741: !BST [10] (maybe <- 0x43000054) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P3742: !BST [3] (maybe <- 0x43000055) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3743: !BST [1] (maybe <- 0x43000059) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3744: !BLD [1] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1
fmovs %f19, %f2
fmovd %f34, %f18
fmovs %f19, %f3
fmovd %f40, %f4

P3745: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P3746: !BST [3] (maybe <- 0x4300005d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3747: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P3748: !PREFETCH [9] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i1 + 512] %asi, 1

P3749: !MEMBAR (Int)
membar #StoreLoad

P3750: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P3751: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P3752: !BST [7] (maybe <- 0x43000061) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3753: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P3754: !BST [6] (maybe <- 0x43000064) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3755: !BST [10] (maybe <- 0x43000067) (FP) (Branch target of P3823)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 
ba P3756
nop

TARGET3823:
ba RET3823
nop


P3756: !CAS [7] (maybe <- 0x380000b) (Int)
add %i1, 84, %l7
lduw [%l7], %o2
mov %o2, %l6
! move %l6(lower) -> %o2(upper)
sllx %l6, 32, %o2
mov %l4, %l3
cas [%l7], %l6, %l3
! move %l3(lower) -> %o2(lower)
srl %l3, 0, %l7
or %l7, %o2, %o2
add   %l4, 1, %l4

P3757: !DWST [4] (maybe <- 0x380000c) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i0 + 64 ] 
add   %l4, 1, %l4

P3758: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P3759: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P3760: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P3761: !BST [3] (maybe <- 0x43000068) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3762: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f8

P3763: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P3764: !BST [8] (maybe <- 0x4300006c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P3765: !NOP (Int)
nop

P3766: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P3767: !BST [5] (maybe <- 0x4300006d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3768: !BST [4] (maybe <- 0x43000070) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P3769: !BST [14] (maybe <- 0x43000071) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P3770: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f10
fmovd %f36, %f18
fmovs %f18, %f11
fmovs %f19, %f12

P3771: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P3772: !BST [7] (maybe <- 0x43000072) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3773: !ST [12] (maybe <- 0x380000d) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P3774: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P3775: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f13
fmovd %f36, %f14
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30

P3776: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P3777: !BST [7] (maybe <- 0x43000075) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3778: !BST [12] (maybe <- 0x43000078) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P3779: !BST [5] (maybe <- 0x43000079) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3780: !LD [1] (Int)
lduw [%i0 + 4], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P3781: !BLD [0] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f0
membar #Sync 
! 4 addresses covered
fmovs %f3, %f2
fmovs %f8, %f3

P3782: !BLD [1] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f4
fmovd %f34, %f18
fmovs %f19, %f6
fmovd %f40, %f18
fmovs %f18, %f7

P3783: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P3784: !LD [15] (Int)
lduw [%i3 + 192], %l6
! move %l6(lower) -> %o3(lower)
or %l6, %o3, %o3

P3785: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P3786: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P3787: !BLD [1] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11
fmovs %f19, %f12
fmovd %f34, %f18
fmovs %f19, %f13
fmovd %f40, %f14

P3788: !BST [3] (maybe <- 0x4300007c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3789: !ST [13] (maybe <- 0x380000e) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P3790: !BLD [1] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
fmovs %f19, %f0
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f40, %f2

P3791: !NOP (Int)
nop

P3792: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f3
fmovd %f36, %f4

P3793: !BST [13] (maybe <- 0x43000080) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P3794: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P3795: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f6
fmovd %f36, %f18
fmovs %f18, %f7
fmovs %f19, %f8

P3796: !BLD [2] (FP) (Branch target of P3924)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9
fmovs %f19, %f10
fmovd %f34, %f18
fmovs %f19, %f11
fmovd %f40, %f12
ba P3797
nop

TARGET3924:
ba RET3924
nop


P3797: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P3798: !DWST [15] (maybe <- 0x380000f) (Int)
mov %l4, %o5 
sllx %o5, 32, %o5 
stx %o5, [%i3 + 192 ] 
add   %l4, 1, %l4

P3799: !BST [1] (maybe <- 0x43000081) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3800: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f13

P3801: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P3802: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P3803: !BLD [11] (FP) (Branch target of P3646)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
ba P3804
nop

TARGET3646:
ba RET3646
nop


P3804: !CAS [10] (maybe <- 0x3800010) (Int)
add %i2, 32, %l7
lduw [%l7], %o4
mov %o4, %l6
! move %l6(lower) -> %o4(upper)
sllx %l6, 32, %o4
mov %l4, %l3
cas [%l7], %l6, %l3
! move %l3(lower) -> %o4(lower)
srl %l3, 0, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5
add   %l4, 1, %l4

P3805: !DWST [11] (maybe <- 0x3800011) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i2 + 64 ] 
add   %l4, 1, %l4

P3806: !BST [12] (maybe <- 0x43000085) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P3807: !BST [1] (maybe <- 0x43000086) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3807
nop
RET3807:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P3808: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f0
membar #Sync 
! 1 addresses covered

P3809: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P3810: !BST [11] (maybe <- 0x4300008a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P3811: !BST [3] (maybe <- 0x4300008b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3812: !BST [14] (maybe <- 0x4300008f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P3813: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P3814: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P3815: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P3816: !MEMBAR (Int)
membar #StoreLoad

P3817: !DWLD [7] (FP)
ldd [%i1 + 80], %f18
! 2 addresses covered
fmovs %f18, %f3
fmovs %f19, %f4

P3818: !REPLACEMENT [14] (Int)
sethi %hi(0x80), %l3
or %l3, %lo(0x80),  %l3
sethi %hi(0x10000), %l6
or %l6, %lo(0x10000),  %l6
add %i3, %l3, %l3
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]
add %l3, %l6, %l3
ld [%l3], %l7
st %l7, [%l3]

P3819: !REPLACEMENT [2] (Int)
sethi %hi(0xc), %o5
or %o5, %lo(0xc),  %o5
sethi %hi(0x10000), %l3
or %l3, %lo(0x10000),  %l3
add %i3, %o5, %o5
add %o5, %l3, %o5
ld [%o5], %l6
st %l6, [%o5]
add %o5, %l3, %o5
ld [%o5], %l6
st %l6, [%o5]
add %o5, %l3, %o5
ld [%o5], %l6
st %l6, [%o5]
add %o5, %l3, %o5
ld [%o5], %l6
st %l6, [%o5]

P3820: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P3821: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P3822: !BST [12] (maybe <- 0x43000090) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P3823: !PREFETCH [1] (Int) (CBR)
prefetch [%i0 + 4], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3823
nop
RET3823:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P3824: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P3825: !LD [11] (Int)
lduw [%i2 + 64], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P3826: !PREFETCH [2] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i0 + 12] %asi, 1

P3827: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f5

P3828: !CASX [12] (maybe <- 0x3800012) (Int)
add %i3, 0, %l6
ldx [%l6], %o5
! move %o5(upper) -> %o0(lower)
srlx %o5, 32, %l3
or %l3, %o0, %o0
! move %o5(lower) -> %o1(upper)
sllx %o5, 32, %o1
mov  %o5, %l3
sllx %l4, 32, %o5
casx [%l6], %l3, %o5
! move %o5(upper) -> %o1(lower)
srlx %o5, 32, %l6
or %l6, %o1, %o1
! move %o5(lower) -> %o2(upper)
sllx %o5, 32, %o2
add  %l4, 1, %l4

P3829: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P3830: !PREFETCH [4] (Int) (Branch target of P3978)
prefetch [%i0 + 64], 1
ba P3831
nop

TARGET3978:
ba RET3978
nop


P3831: !BST [2] (maybe <- 0x43000091) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3832: !CASX [13] (maybe <- 0x3800013) (Int)
add %i3, 64, %l3
ldx [%l3], %l7
! move %l7(upper) -> %o2(lower)
srlx %l7, 32, %o5
or %o5, %o2, %o2
! move %l7(lower) -> %o3(upper)
sllx %l7, 32, %o3
mov  %l7, %o5
sllx %l4, 32, %l7
casx [%l3], %o5, %l7
! move %l7(upper) -> %o3(lower)
srlx %l7, 32, %l3
or %l3, %o3, %o3
! move %l7(lower) -> %o4(upper)
sllx %l7, 32, %o4
add  %l4, 1, %l4

P3833: !BST [8] (maybe <- 0x43000095) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P3834: !DWLD [14] (Int)
ldx [%i3 + 128], %o5
! move %o5(upper) -> %o4(lower)
srlx %o5, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P3835: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P3836: !BLD [2] (FP) (Branch target of P4135)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7
fmovs %f19, %f8
fmovd %f34, %f18
fmovs %f19, %f9
fmovd %f40, %f10
ba P3837
nop

TARGET4135:
ba RET4135
nop


P3837: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P3838: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P3839: !BST [14] (maybe <- 0x43000096) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P3840: !BLD [3] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13
fmovs %f19, %f14
fmovd %f34, %f18
fmovs %f19, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
fmovd %f40, %f0

P3841: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P3842: !MEMBAR (Int)
membar #StoreLoad

P3843: !ST [10] (maybe <- 0x3800014) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P3844: !MEMBAR (Int)
membar #StoreLoad

P3845: !BST [4] (maybe <- 0x43000097) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P3846: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P3847: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P3848: !REPLACEMENT [5] (Int)
sethi %hi(0x4c), %l6
or %l6, %lo(0x4c),  %l6
sethi %hi(0x10000), %l7
or %l7, %lo(0x10000),  %l7
add %i3, %l6, %l6
add %l6, %l7, %l6
ld [%l6], %o5
st %o5, [%l6]
add %l6, %l7, %l6
ld [%l6], %o5
st %o5, [%l6]
add %l6, %l7, %l6
ld [%l6], %o5
st %o5, [%l6]
add %l6, %l7, %l6
ld [%l6], %o5
st %o5, [%l6]

P3849: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P3850: !DWLD [5] (Int)
ldx [%i1 + 72], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P3851: !BST [3] (maybe <- 0x43000098) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3852: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f2
fmovd %f36, %f18
fmovs %f18, %f3
fmovs %f19, %f4

P3853: !REPLACEMENT [2] (Int)
sethi %hi(0xc), %l6
or %l6, %lo(0xc),  %l6
sethi %hi(0x10000), %l7
or %l7, %lo(0x10000),  %l7
add %i3, %l6, %l6
add %l6, %l7, %l6
ld [%l6], %o5
st %o5, [%l6]
add %l6, %l7, %l6
ld [%l6], %o5
st %o5, [%l6]
add %l6, %l7, %l6
ld [%l6], %o5
st %o5, [%l6]
add %l6, %l7, %l6
ld [%l6], %o5
st %o5, [%l6]

P3854: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P3855: !BST [13] (maybe <- 0x4300009c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P3856: !DWLD [8] (Int)
ldx [%i1 + 256], %l3
! move %l3(upper) -> %o0(lower)
srlx %l3, 32, %o5
or %o5, %o0, %o0

P3857: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P3858: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P3859: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P3860: !BLD [1] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f6
fmovd %f34, %f18
fmovs %f19, %f8
fmovd %f40, %f18
fmovs %f18, %f9

P3861: !BST [0] (maybe <- 0x4300009d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3862: !CASX [3] (maybe <- 0x3800015) (Int) (LE) (Branch target of P3887)
! Change single-word-level endianess (big endian <-> little endian) 
sethi %hi(0xff00ff00), %l6
or %l6, %lo(0xff00ff00), %l6
and %l4, %l6, %l3
srl %l3, 8, %l3
sll %l4, 8, %l7
and %l7, %l6, %l7
or %l7, %l3, %l7
srl %l7, 16, %l3
sll %l7, 16, %l7
srl %l7, 0, %l7
or %l7, %l3, %l7
wr %g0, 0x88, %asi
add %i0, 32, %l6
ldxa [%l6] %asi, %o5
! move %o5(lower) -> %o1(upper)
sllx %o5, 32, %o1
! move %o5(upper) -> %o1(lower)
srlx %o5, 32, %l3
or %l3, %o1, %o1
mov  %o5, %l3
mov  %l7, %o5
casxa [%l6] %asi, %l3, %o5
! move %o5(lower) -> %o2(upper)
sllx %o5, 32, %o2
! move %o5(upper) -> %o2(lower)
srlx %o5, 32, %l6
or %l6, %o2, %o2
add  %l4, 1, %l4
ba P3863
nop

TARGET3887:
ba RET3887
nop


P3863: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P3864: !BST [3] (maybe <- 0x430000a1) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3865: !BST [7] (maybe <- 0x430000a5) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3866: !BLD [0] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11
fmovs %f19, %f12
fmovd %f34, %f18
fmovs %f19, %f13
fmovd %f40, %f14

P3867: !BLD [2] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
fmovs %f19, %f0
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f40, %f2

P3868: !BST [10] (maybe <- 0x430000a8) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P3869: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f3
fmovd %f36, %f4

P3870: !BST [1] (maybe <- 0x430000a9) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3871: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f6
fmovd %f36, %f18
fmovs %f18, %f7
fmovs %f19, %f8

P3872: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P3873: !BLD [8] (FP) (Branch target of P3920)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10
ba P3874
nop

TARGET3920:
ba RET3920
nop


P3874: !BST [15] (maybe <- 0x430000ad) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P3875: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f11
fmovd %f36, %f12

P3876: !BST [8] (maybe <- 0x430000ae) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P3877: !MEMBAR (Int)
membar #StoreLoad

P3878: !BST [1] (maybe <- 0x430000af) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3879: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f14
fmovd %f36, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
fmovs %f19, %f0

P3880: !CAS [11] (maybe <- 0x3800016) (Int)
add %i2, 64, %l7
lduw [%l7], %o3
mov %o3, %l6
! move %l6(lower) -> %o3(upper)
sllx %l6, 32, %o3
mov %l4, %l3
cas [%l7], %l6, %l3
! move %l3(lower) -> %o3(lower)
srl %l3, 0, %l7
or %l7, %o3, %o3
add   %l4, 1, %l4

P3881: !BST [0] (maybe <- 0x430000b3) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3882: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P3883: !BST [11] (maybe <- 0x430000b7) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P3884: !BST [11] (maybe <- 0x430000b8) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P3885: !BST [2] (maybe <- 0x430000b9) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3886: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P3887: !BLD [8] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3887
nop
RET3887:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P3888: !BST [0] (maybe <- 0x430000bd) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3889: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P3890: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P3891: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P3892: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P3893: !BST [8] (maybe <- 0x430000c1) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P3894: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f3
fmovd %f36, %f4

P3895: !BST [14] (maybe <- 0x430000c2) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P3896: !LD [11] (Int)
lduw [%i2 + 64], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P3897: !ST [9] (maybe <- 0x3800017) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P3898: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f6

P3899: !BLD [2] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7
fmovs %f19, %f8
fmovd %f34, %f18
fmovs %f19, %f9
fmovd %f40, %f10

P3900: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P3901: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f11
fmovd %f36, %f12

P3902: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P3903: !CASX [4] (maybe <- 0x3800018) (Int)
add %i0, 64, %l6
ldx [%l6], %o5
! move %o5(upper) -> %o4(lower)
srlx %o5, 32, %l3
or %l3, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5
! move %o5(lower) -> %o0(upper)
sllx %o5, 32, %o0
mov  %o5, %l3
sllx %l4, 32, %o5
casx [%l6], %l3, %o5
! move %o5(upper) -> %o0(lower)
srlx %o5, 32, %l6
or %l6, %o0, %o0
! move %o5(lower) -> %o1(upper)
sllx %o5, 32, %o1
add  %l4, 1, %l4

P3904: !BST [3] (maybe <- 0x430000c3) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3904
nop
RET3904:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P3905: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P3906: !BLD [5] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
fmovd %f36, %f0

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3906
nop
RET3906:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P3907: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P3908: !BST [2] (maybe <- 0x430000c7) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3909: !BST [5] (maybe <- 0x430000cb) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3910: !BST [0] (maybe <- 0x430000ce) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3911: !BLD [3] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f2
fmovd %f34, %f18
fmovs %f19, %f4
fmovd %f40, %f18
fmovs %f18, %f5

P3912: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P3913: !BLD [3] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f6
fmovd %f34, %f18
fmovs %f19, %f8
fmovd %f40, %f18
fmovs %f18, %f9

P3914: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f10
fmovd %f36, %f18
fmovs %f18, %f11
fmovs %f19, %f12

P3915: !DWLD [8] (Int)
ldx [%i1 + 256], %o5
! move %o5(upper) -> %o1(lower)
srlx %o5, 32, %l7
or %l7, %o1, %o1

P3916: !DWST [12] (maybe <- 0x3800019) (Int) (CBR)
mov %l4, %l3 
sllx %l3, 32, %l3 
stx %l3, [%i3 + 0 ] 
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3916
nop
RET3916:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P3917: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P3918: !DWST [6] (maybe <- 0x380001a) (Int)
sllx %l4, 32, %l3 
add   %l4, 1, %l4
or %l3, %l4, %l3
stx %l3, [%i1 + 80]
add   %l4, 1, %l4

P3919: !BST [14] (maybe <- 0x430000d2) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P3920: !PREFETCH [9] (Int) (CBR)
prefetch [%i1 + 512], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3920
nop
RET3920:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P3921: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P3922: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P3923: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P3924: !DWLD [4] (Int) (CBR)
ldx [%i0 + 64], %o2
! move %o2(upper) -> %o2(upper)

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3924
nop
RET3924:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P3925: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30

P3926: !BST [10] (maybe <- 0x430000d3) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P3927: !CAS [14] (maybe <- 0x380001c) (Int)
add %i3, 128, %l7
lduw [%l7], %l3
mov %l3, %l6
! move %l6(lower) -> %o2(lower)
srlx %o2, 32, %o2
sllx %o2, 32, %o2
or %l6, %o2, %o2
mov %l4, %o3
cas [%l7], %l6, %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P3928: !BST [13] (maybe <- 0x430000d4) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P3929: !BST [14] (maybe <- 0x430000d5) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P3930: !BST [5] (maybe <- 0x430000d6) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3931: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f0
membar #Sync 
! 3 addresses covered
fmovs %f3, %f0
fmovs %f4, %f1
fmovs %f5, %f2

P3932: !BST [4] (maybe <- 0x430000d9) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P3933: !BST [5] (maybe <- 0x430000da) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3934: !DWLD [15] (FP)
ldd [%i3 + 192], %f18
! 1 addresses covered
fmovs %f18, %f3

P3935: !CAS [5] (maybe <- 0x380001d) (Int)
add %i1, 76, %l6
lduw [%l6], %o5
mov %o5, %l3
! move %l3(lower) -> %o3(lower)
or %l3, %o3, %o3
mov %l4, %o4
cas [%l6], %l3, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P3936: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P3937: !BST [15] (maybe <- 0x430000dd) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P3938: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P3939: !BST [13] (maybe <- 0x430000de) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P3940: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P3941: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P3942: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P3943: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P3944: !BST [0] (maybe <- 0x430000df) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3945: !DWST [11] (maybe <- 0x380001e) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i2 + 64 ] 
add   %l4, 1, %l4

P3946: !DWST [2] (maybe <- 0x380001f) (Int)
mov %l4, %l3 
stx %l3, [%i0 + 8]
add   %l4, 1, %l4

P3947: !DWLD [2] (Int)
ldx [%i0 + 8], %l3
! move %l3(lower) -> %o4(lower)
srl %l3, 0, %o5
or %o5, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P3948: !PREFETCH [4] (Int) (CBR)
prefetch [%i0 + 64], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3948
nop
RET3948:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P3949: !BST [13] (maybe <- 0x430000e3) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P3950: !BST [7] (maybe <- 0x430000e4) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3951: !BST [9] (maybe <- 0x430000e7) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P3952: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P3953: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P3954: !BLD [2] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5
fmovs %f19, %f6
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f40, %f8

P3955: !LD [11] (Int)
lduw [%i2 + 64], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P3956: !BST [4] (maybe <- 0x430000e8) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P3957: !DWLD [11] (Int)
ldx [%i2 + 64], %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l3
or %l3, %o0, %o0

P3958: !BST [9] (maybe <- 0x430000e9) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P3959: !BST [13] (maybe <- 0x430000ea) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P3960: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P3961: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P3962: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P3963: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P3964: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P3965: !BLD [3] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f12
fmovd %f34, %f18
fmovs %f19, %f14
fmovd %f40, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30

P3966: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f0
membar #Sync 
! 1 addresses covered

P3967: !BST [3] (maybe <- 0x430000eb) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3968: !BST [8] (maybe <- 0x430000ef) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P3969: !BST [10] (maybe <- 0x430000f0) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P3970: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f36, %f2

P3971: !DWLD [13] (Int)
ldx [%i3 + 64], %o1
! move %o1(upper) -> %o1(upper)

P3972: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P3973: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P3974: !PREFETCH [3] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i0 + 32] %asi, 1

P3975: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P3976: !CAS [10] (maybe <- 0x3800020) (Int)
add %i2, 32, %l3
lduw [%l3], %l7
mov %l7, %o5
! move %o5(lower) -> %o1(lower)
srlx %o1, 32, %o1
sllx %o1, 32, %o1
or %o5, %o1, %o1
mov %l4, %o2
cas [%l3], %o5, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P3977: !DWLD [11] (Int)
ldx [%i2 + 64], %l3
! move %l3(upper) -> %o2(lower)
srlx %l3, 32, %o5
or %o5, %o2, %o2

P3978: !MEMBAR (Int) (CBR)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3978
nop
RET3978:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P3979: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f6

P3980: !BST [5] (maybe <- 0x430000f1) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3981: !PREFETCH [12] (Int) (Branch target of P4038)
prefetch [%i3 + 0], 1
ba P3982
nop

TARGET4038:
ba RET4038
nop


P3982: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P3983: !BST [9] (maybe <- 0x430000f4) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P3984: !BST [14] (maybe <- 0x430000f5) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P3985: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P3986: !BST [7] (maybe <- 0x430000f6) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3987: !BST [11] (maybe <- 0x430000f9) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P3988: !PREFETCH [11] (Int) (CBR)
prefetch [%i2 + 64], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3988
nop
RET3988:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P3989: !BLD [3] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7
fmovs %f19, %f8
fmovd %f34, %f18
fmovs %f19, %f9
fmovd %f40, %f10

P3990: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f11
fmovd %f36, %f12

P3991: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P3992: !BST [2] (maybe <- 0x430000fa) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3993: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P3994: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30

P3995: !BLD [0] (FP) (Branch target of P4024)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f0
membar #Sync 
! 4 addresses covered
fmovs %f3, %f2
fmovs %f8, %f3
ba P3996
nop

TARGET4024:
ba RET4024
nop


P3996: !PREFETCH [5] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i1 + 76] %asi, 1

P3997: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P3998: !BLD [1] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5
fmovs %f19, %f6
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f40, %f8

P3999: !BST [7] (maybe <- 0x430000fe) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P4000: !BST [4] (maybe <- 0x43000101) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P4001: !DWLD [14] (Int)
ldx [%i3 + 128], %o3
! move %o3(upper) -> %o3(upper)

P4002: !CAS [3] (maybe <- 0x3800021) (Int)
add %i0, 32, %l7
lduw [%l7], %l3
mov %l3, %l6
! move %l6(lower) -> %o3(lower)
srlx %o3, 32, %o3
sllx %o3, 32, %o3
or %l6, %o3, %o3
mov %l4, %o4
cas [%l7], %l6, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P4003: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f9
fmovd %f36, %f10

P4004: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P4005: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f12
fmovd %f36, %f18
fmovs %f18, %f13
fmovs %f19, %f14

P4006: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P4007: !BST [14] (maybe <- 0x43000102) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P4008: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30

P4009: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P4010: !BST [2] (maybe <- 0x43000103) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P4011: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P4012: !BST [5] (maybe <- 0x43000107) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P4013: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f0
membar #Sync 
! 1 addresses covered

P4014: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P4015: !BST [0] (maybe <- 0x4300010a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P4016: !ST [10] (maybe <- 0x4300010e) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i2 + 32 ]

P4017: !LD [7] (Int)
lduw [%i1 + 84], %l6
! move %l6(lower) -> %o4(lower)
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P4018: !PREFETCH [1] (Int) (Branch target of P4125)
prefetch [%i0 + 4], 1
ba P4019
nop

TARGET4125:
ba RET4125
nop


P4019: !BLD [1] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1
fmovs %f19, %f2
fmovd %f34, %f18
fmovs %f19, %f3
fmovd %f40, %f4

P4020: !CASX [13] (maybe <- 0x3800022) (Int)
add %i3, 64, %o5
ldx [%o5], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l7
sllx %l4, 32, %o1
casx [%o5], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P4021: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P4022: !BST [6] (maybe <- 0x4300010f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P4023: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P4024: !BST [15] (maybe <- 0x43000112) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET4024
nop
RET4024:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P4025: !ST [5] (maybe <- 0x3800023) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P4026: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f5
fmovd %f36, %f6

P4027: !BLD [0] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f8
fmovd %f34, %f18
fmovs %f19, %f10
fmovd %f40, %f18
fmovs %f18, %f11

P4028: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P4029: !CASX [5] (maybe <- 0x3800024) (Int)
add %i1, 72, %l6
ldx [%l6], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov  %o2, %l3
mov %l4, %o3
casx [%l6], %l3, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4

P4030: !BST [8] (maybe <- 0x43000113) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P4031: !DWLD [15] (Int) (Branch target of P3916)
ldx [%i3 + 192], %o4
! move %o4(upper) -> %o4(upper)
ba P4032
nop

TARGET3916:
ba RET3916
nop


P4032: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P4033: !ST [7] (maybe <- 0x3800025) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P4034: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P4035: !PREFETCH [11] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i2 + 64] %asi, 1

P4036: !MEMBAR (Int)
membar #StoreLoad

P4037: !PREFETCH [7] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i1 + 84] %asi, 1

P4038: !BLD [6] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f13
fmovd %f36, %f14
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET4038
nop
RET4038:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P4039: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f0
membar #Sync 
! 3 addresses covered
fmovs %f3, %f0
fmovs %f4, %f1
fmovs %f5, %f2

P4040: !LD [2] (Int) (Branch target of P4071)
lduw [%i0 + 12], %l7
! move %l7(lower) -> %o4(lower)
srlx %o4, 32, %o4
sllx %o4, 32, %o4
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5
ba P4041
nop

TARGET4071:
ba RET4071
nop


P4041: !BST [1] (maybe <- 0x43000114) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P4042: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P4043: !LD [10] (Int)
lduw [%i2 + 32], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P4044: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P4045: !ST [12] (maybe <- 0x43000118) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i3 + 0 ]

P4046: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P4047: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P4048: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P4049: !BST [3] (maybe <- 0x43000119) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P4050: !REPLACEMENT [3] (Int)
sethi %hi(0x20), %l7
or %l7, %lo(0x20),  %l7
sethi %hi(0x10000), %o5
or %o5, %lo(0x10000),  %o5
add %i3, %l7, %l7
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]
add %l7, %o5, %l7
ld [%l7], %l3
st %l3, [%l7]

P4051: !BLD [3] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7
fmovs %f19, %f8
fmovd %f34, %f18
fmovs %f19, %f9
fmovd %f40, %f10

P4052: !BST [10] (maybe <- 0x4300011d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P4053: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P4054: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P4055: !BST [6] (maybe <- 0x4300011e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P4056: !BLD [2] (FP) (Branch target of P3739)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f12
fmovd %f34, %f18
fmovs %f19, %f14
fmovd %f40, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30
ba P4057
nop

TARGET3739:
ba RET3739
nop


P4057: !BST [11] (maybe <- 0x43000121) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P4058: !BST [0] (maybe <- 0x43000122) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P4059: !BST [6] (maybe <- 0x43000126) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P4060: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P4061: !SWAP [1] (maybe <- 0x3800026) (Int)
mov %l4, %l7
swap  [%i0 + 4], %l7
! move %l7(lower) -> %o0(lower)
srl %l7, 0, %l3
or %l3, %o0, %o0
add   %l4, 1, %l4

P4062: !BST [9] (maybe <- 0x43000129) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P4063: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P4064: !BST [13] (maybe <- 0x4300012a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P4065: !BST [11] (maybe <- 0x4300012b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P4066: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f0
membar #Sync 
! 1 addresses covered

P4067: !BST [14] (maybe <- 0x4300012c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P4068: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P4069: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P4070: !BLD [0] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f2
fmovd %f34, %f18
fmovs %f19, %f4
fmovd %f40, %f18
fmovs %f18, %f5

P4071: !PREFETCH [2] (Int) (CBR)
prefetch [%i0 + 12], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET4071
nop
RET4071:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P4072: !BST [11] (maybe <- 0x4300012d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P4073: !BST [5] (maybe <- 0x4300012e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P4074: !LD [2] (Int)
lduw [%i0 + 12], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P4075: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P4076: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f36, %f8

P4077: !BST [11] (maybe <- 0x43000131) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P4078: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P4079: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P4080: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P4081: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P4082: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f11

P4083: !BLD [3] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f12
fmovd %f34, %f18
fmovs %f19, %f14
fmovd %f40, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30

P4084: !SWAP [6] (maybe <- 0x3800027) (Int)
mov %l4, %l6
swap  [%i1 + 80], %l6
! move %l6(lower) -> %o1(lower)
srl %l6, 0, %o5
or %o5, %o1, %o1
add   %l4, 1, %l4

P4085: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P4086: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P4087: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f0
membar #Sync 
! 1 addresses covered

P4088: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P4089: !BLD [0] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f2
fmovd %f34, %f18
fmovs %f19, %f4
fmovd %f40, %f18
fmovs %f18, %f5

P4090: !PREFETCH [10] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i2 + 32] %asi, 1

P4091: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P4092: !BLD [3] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f6
fmovd %f34, %f18
fmovs %f19, %f8
fmovd %f40, %f18
fmovs %f18, %f9

P4093: !DWLD [0] (Int)
ldx [%i0 + 0], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)

P4094: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f10
fmovd %f36, %f18
fmovs %f18, %f11
fmovs %f19, %f12

P4095: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P4096: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P4097: !PREFETCH [15] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i3 + 192] %asi, 1

P4098: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f14

P4099: !PREFETCH [3] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i0 + 32] %asi, 1

P4100: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f15
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30

P4101: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P4102: !BST [1] (maybe <- 0x43000132) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P4103: !BST [5] (maybe <- 0x43000136) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P4104: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f0
membar #Sync 
! 1 addresses covered

P4105: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P4106: !BST [4] (maybe <- 0x43000139) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P4107: !BST [13] (maybe <- 0x4300013a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P4108: !BST [5] (maybe <- 0x4300013b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P4109: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P4110: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P4111: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P4112: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P4113: !BLD [0] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f32
membar #Sync 
! 4 addresses covered
fmovd %f32, %f4
fmovd %f34, %f18
fmovs %f19, %f6
fmovd %f40, %f18
fmovs %f18, %f7

P4114: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P4115: !REPLACEMENT [0] (Int)
sethi %hi(0x0), %o5
or %o5, %lo(0x0),  %o5
sethi %hi(0x10000), %l3
or %l3, %lo(0x10000),  %l3
add %i3, %o5, %o5
add %o5, %l3, %o5
ld [%o5], %l6
st %l6, [%o5]
add %o5, %l3, %o5
ld [%o5], %l6
st %l6, [%o5]
add %o5, %l3, %o5
ld [%o5], %l6
st %l6, [%o5]
add %o5, %l3, %o5
ld [%o5], %l6
st %l6, [%o5]

P4116: !CASX [5] (maybe <- 0x3800028) (Int) (Branch target of P3988)
add %i1, 72, %o5
ldx [%o5], %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
mov  %o3, %l7
mov %l4, %o4
casx [%o5], %l7, %o4
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5
add  %l4, 1, %l4
ba P4117
nop

TARGET3988:
ba RET3988
nop


P4117: !BST [4] (maybe <- 0x4300013e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P4118: !LD [6] (FP)
ld [%i1 + 80], %f8
! 1 addresses covered

P4119: !BST [2] (maybe <- 0x4300013f) (FP) (Branch target of P3621)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 
ba P4120
nop

TARGET3621:
ba RET3621
nop


P4120: !MEMBAR (Int)
membar #StoreLoad

P4121: !LD [0] (Int)
lduw [%i0 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P4122: !LD [1] (Int)
lduw [%i0 + 4], %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0

P4123: !LD [2] (Int)
lduw [%i0 + 12], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P4124: !LD [3] (FP)
ld [%i0 + 32], %f9
! 1 addresses covered

P4125: !LD [4] (Int) (CBR)
lduw [%i0 + 64], %o5
! move %o5(lower) -> %o1(lower)
or %o5, %o1, %o1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET4125
nop
RET4125:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P4126: !LD [5] (Int)
lduw [%i1 + 76], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P4127: !LD [6] (Int)
lduw [%i1 + 80], %l3
! move %l3(lower) -> %o2(lower)
or %l3, %o2, %o2

P4128: !LD [7] (Int)
lduw [%i1 + 84], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P4129: !LD [8] (Int)
lduw [%i1 + 256], %l3
! move %l3(lower) -> %o3(lower)
or %l3, %o3, %o3

P4130: !LD [9] (Int)
lduw [%i1 + 512], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P4131: !LD [10] (Int)
lduw [%i2 + 32], %l3
! move %l3(lower) -> %o4(lower)
or %l3, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P4132: !LD [11] (Int)
lduw [%i2 + 64], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P4133: !LD [12] (Int)
lduw [%i3 + 0], %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0

P4134: !LD [13] (Int)
lduw [%i3 + 64], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P4135: !LD [14] (Int) (CBR)
lduw [%i3 + 128], %l3
! move %l3(lower) -> %o1(lower)
or %l3, %o1, %o1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET4135
nop
RET4135:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P4136: !LD [15] (Int)
lduw [%i3 + 192], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

END_NODES7: ! Test istream for CPU 7 ends
sethi %hi(0xdead0e0f), %l3
or    %l3, %lo(0xdead0e0f), %l3
! move %l3(lower) -> %o2(lower)
or %l3, %o2, %o2
stw %l3, [%i5] 
ld [%i5], %f10
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30

restore
retl
nop

