// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tsotool_diag8_060903.s
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
! GEN.SEED 0
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

! Initialize LFSR to 0x4976^4
sethi %hi(0x4976), %l0
or    %l0, %lo(0x4976), %l0
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

P1: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P2: !BST [11] (maybe <- 0x3f800001) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P3: !BST [5] (maybe <- 0x3f800002) (FP)
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

P4: !PREFETCH [12] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i3 + 0] %asi, 1

P5: !BLD [3] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f0
membar #Sync 
! 4 addresses covered
fmovs %f3, %f2
fmovs %f8, %f3

P6: !BLD [1] (FP)
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

P7: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f8

P8: !DWST [6] (maybe <- 0x1) (Int) (Branch target of P134)
sllx %l4, 32, %o5 
add   %l4, 1, %l4
or %o5, %l4, %o5
stx %o5, [%i1 + 80]
add   %l4, 1, %l4
ba P9
nop

TARGET134:
ba RET134
nop


P9: !LD [7] (Int) (Branch target of P240)
lduw [%i1 + 84], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
ba P10
nop

TARGET240:
ba RET240
nop


P10: !BST [14] (maybe <- 0x3f800005) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P11: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P12: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P13: !BST [3] (maybe <- 0x3f800006) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P14: !BLD [1] (FP)
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

P15: !BLD [3] (FP)
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

P16: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P17: !DWLD [12] (Int)
ldx [%i3 + 0], %o5
! move %o5(upper) -> %o0(lower)
srlx %o5, 32, %l7
or %l7, %o0, %o0

P18: !PREFETCH [0] (Int) (Branch target of P275)
prefetch [%i0 + 0], 1
ba P19
nop

TARGET275:
ba RET275
nop


P19: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P20: !ST [2] (maybe <- 0x3) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P21: !REPLACEMENT [14] (Int)
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

P22: !LD [9] (Int)
lduw [%i1 + 512], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P23: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P24: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P25: !ST [5] (maybe <- 0x4) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P26: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P27: !BST [10] (maybe <- 0x3f80000a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P28: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P29: !BST [6] (maybe <- 0x3f80000b) (FP)
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

P30: !BLD [2] (FP)
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

P31: !BST [12] (maybe <- 0x3f80000e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P32: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f7

P33: !DWST [0] (maybe <- 0x5) (Int)
sllx %l4, 32, %l3 
add   %l4, 1, %l4
or %l3, %l4, %l3
stx %l3, [%i0 + 0]
add   %l4, 1, %l4

P34: !BST [7] (maybe <- 0x3f80000f) (FP) (Branch target of P338)
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
ba P35
nop

TARGET338:
ba RET338
nop


P35: !BLD [6] (FP)
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

P36: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f11
fmovd %f36, %f12

P37: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P38: !BLD [13] (FP)
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

P39: !BST [8] (maybe <- 0x3f800012) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P40: !BST [15] (maybe <- 0x3f800013) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P41: !BST [0] (maybe <- 0x3f800014) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P42: !BLD [3] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f0
membar #Sync 
! 4 addresses covered
fmovs %f3, %f2
fmovs %f8, %f3

P43: !CAS [7] (maybe <- 0x7) (Int)
add %i1, 84, %l3
lduw [%l3], %l7
mov %l7, %o5
! move %o5(lower) -> %o1(lower)
or %o5, %o1, %o1
mov %l4, %o2
cas [%l3], %o5, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P44: !BST [0] (maybe <- 0x3f800018) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P45: !BLD [6] (FP)
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

P46: !BST [0] (maybe <- 0x3f80001c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P47: !SWAP [5] (maybe <- 0x8) (Int)
mov %l4, %o5
swap  [%i1 + 76], %o5
! move %o5(lower) -> %o2(lower)
srl %o5, 0, %l6
or %l6, %o2, %o2
add   %l4, 1, %l4

P48: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P49: !BLD [3] (FP)
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

P50: !DWLD [5] (Int)
ldx [%i1 + 72], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P51: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P52: !BST [7] (maybe <- 0x3f800020) (FP)
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

P53: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P54: !BST [8] (maybe <- 0x3f800023) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P55: !BST [3] (maybe <- 0x3f800024) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P56: !DWLD [14] (Int) (Branch target of P466)
ldx [%i3 + 128], %l3
! move %l3(upper) -> %o3(lower)
srlx %l3, 32, %o5
or %o5, %o3, %o3
ba P57
nop

TARGET466:
ba RET466
nop


P57: !BLD [5] (FP)
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

P58: !BST [15] (maybe <- 0x3f800028) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P59: !BLD [10] (FP)
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

P60: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P61: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P62: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f0
membar #Sync 
! 1 addresses covered

P63: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P64: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P65: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P66: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P67: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P68: !BLD [2] (FP)
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

P69: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f6

P70: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P71: !BLD [6] (FP)
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

P72: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P73: !LD [9] (Int)
lduw [%i1 + 512], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P74: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P75: !REPLACEMENT [2] (Int)
sethi %hi(0xc), %l7
or %l7, %lo(0xc),  %l7
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

P76: !BST [0] (maybe <- 0x3f800029) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P77: !ST [10] (maybe <- 0x9) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P78: !BST [8] (maybe <- 0x3f80002d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P79: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P80: !DWLD [5] (Int)
ldx [%i1 + 72], %o5
! move %o5(lower) -> %o4(lower)
srl %o5, 0, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P81: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P82: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P83: !BST [10] (maybe <- 0x3f80002e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P84: !BST [9] (maybe <- 0x3f80002f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P85: !CAS [9] (maybe <- 0xa) (Int)
add %i1, 512, %o5
lduw [%o5], %o0
mov %o0, %l7
! move %l7(lower) -> %o0(upper)
sllx %l7, 32, %o0
mov %l4, %l6
cas [%o5], %l7, %l6
! move %l6(lower) -> %o0(lower)
srl %l6, 0, %o5
or %o5, %o0, %o0
add   %l4, 1, %l4

P86: !LD [0] (Int)
lduw [%i0 + 0], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P87: !BST [1] (maybe <- 0x3f800030) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P88: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P89: !BLD [7] (FP)
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

P90: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f0
membar #Sync 
! 3 addresses covered
fmovs %f3, %f0
fmovs %f4, %f1
fmovs %f5, %f2

P91: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P92: !BST [3] (maybe <- 0x3f800034) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P93: !CASX [5] (maybe <- 0xb) (Int)
add %i1, 72, %o5
ldx [%o5], %l6
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %l7
or %l7, %o1, %o1
! move %l6(lower) -> %o2(upper)
sllx %l6, 32, %o2
mov  %l6, %l7
mov %l4, %l6
casx [%o5], %l7, %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %o5
or %o5, %o2, %o2
! move %l6(lower) -> %o3(upper)
sllx %l6, 32, %o3
add  %l4, 1, %l4

P94: !BST [5] (maybe <- 0x3f800038) (FP)
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

P95: !ST [7] (maybe <- 0xc) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P96: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P97: !PREFETCH [15] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i3 + 192] %asi, 1

P98: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P99: !ST [6] (maybe <- 0xd) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P100: !BLD [7] (FP)
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

P101: !BST [15] (maybe <- 0x3f80003b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P102: !BLD [0] (FP)
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

P103: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P104: !DWLD [12] (FP)
ldd [%i3 + 0], %f18
! 1 addresses covered
fmovs %f18, %f13

P105: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P106: !BST [1] (maybe <- 0x3f80003c) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
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
be,pt  %xcc, TARGET106
nop
RET106:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P107: !BLD [0] (FP)
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

P108: !BST [7] (maybe <- 0x3f800040) (FP) (CBR)
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
be,pt  %xcc, TARGET108
nop
RET108:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P109: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P110: !BST [1] (maybe <- 0x3f800043) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P111: !PREFETCH [7] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i1 + 84] %asi, 1

P112: !LD [1] (Int)
lduw [%i0 + 4], %l7
! move %l7(lower) -> %o3(lower)
or %l7, %o3, %o3

P113: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f2

P114: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P115: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P116: !BLD [3] (FP)
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

P117: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f36, %f8

P118: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P119: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P120: !NOP (Int)
nop

P121: !DWLD [3] (Int)
ldx [%i0 + 32], %o4
! move %o4(upper) -> %o4(upper)

P122: !BST [14] (maybe <- 0x3f800047) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P123: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P124: !BST [14] (maybe <- 0x3f800048) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P125: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f11
fmovd %f36, %f12

P126: !BST [15] (maybe <- 0x3f800049) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P127: !LD [8] (Int)
lduw [%i1 + 256], %o5
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

P128: !BST [15] (maybe <- 0x3f80004a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P129: !BST [0] (maybe <- 0x3f80004b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P130: !BST [2] (maybe <- 0x3f80004f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P131: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P132: !BST [8] (maybe <- 0x3f800053) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P133: !DWLD [7] (Int) (LE)
wr %g0, 0x88, %asi
ldxa [%i1 + 80] %asi, %l6
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l3
or %l3, %o0, %o0

P134: !BLD [12] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET134
nop
RET134:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P135: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P136: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P137: !REPLACEMENT [12] (Int)
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

P138: !BLD [13] (FP)
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

P139: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f0
membar #Sync 
! 1 addresses covered

P140: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P141: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P142: !BLD [6] (FP)
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

P143: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P144: !BST [14] (maybe <- 0x3f800054) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P145: !BST [13] (maybe <- 0x3f800055) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P146: !BLD [2] (FP)
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

P147: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P148: !PREFETCH [11] (Int) (CBR)
prefetch [%i2 + 64], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET148
nop
RET148:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P149: !REPLACEMENT [5] (Int)
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

P150: !BST [2] (maybe <- 0x3f800056) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P151: !ST [1] (maybe <- 0xe) (Int) (Branch target of P148)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4
ba P152
nop

TARGET148:
ba RET148
nop


P152: !PREFETCH [2] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i0 + 12] %asi, 1

P153: !BST [1] (maybe <- 0x3f80005a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P154: !BLD [5] (FP)
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

P155: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P156: !BST [1] (maybe <- 0x3f80005e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P157: !REPLACEMENT [4] (Int)
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

P158: !BLD [11] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET158
nop
RET158:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P159: !BST [5] (maybe <- 0x3f800062) (FP)
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

P160: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P161: !BLD [10] (FP)
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

P162: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P163: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f0
membar #Sync 
! 3 addresses covered
fmovs %f3, %f0
fmovs %f4, %f1
fmovs %f5, %f2

P164: !BST [7] (maybe <- 0x3f800065) (FP)
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

P165: !BST [13] (maybe <- 0x3f800068) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P166: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P167: !BST [7] (maybe <- 0x3f800069) (FP)
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

P168: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P169: !BST [1] (maybe <- 0x3f80006c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P170: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P171: !BST [9] (maybe <- 0x3f800070) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P172: !BLD [1] (FP)
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

P173: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P174: !BST [15] (maybe <- 0x3f800071) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P175: !ST [8] (maybe <- 0xf) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P176: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P177: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P178: !BST [9] (maybe <- 0x3f800072) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P179: !CASX [10] (maybe <- 0x10) (Int)
add %i2, 32, %l3
ldx [%l3], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
mov  %o1, %o5
sllx %l4, 32, %o2
casx [%l3], %o5, %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
add  %l4, 1, %l4

P180: !BLD [0] (FP) (CBR)
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
be,pn  %xcc, TARGET180
nop
RET180:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P181: !BST [1] (maybe <- 0x3f800073) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P182: !BST [13] (maybe <- 0x3f800077) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P183: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f0
membar #Sync 
! 3 addresses covered
fmovs %f3, %f0
fmovs %f4, %f1
fmovs %f5, %f2

P184: !BST [3] (maybe <- 0x3f800078) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P185: !BST [7] (maybe <- 0x3f80007c) (FP)
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

P186: !BST [7] (maybe <- 0x3f80007f) (FP)
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

P187: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P188: !REPLACEMENT [4] (Int)
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

P189: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P190: !BST [1] (maybe <- 0x3f800082) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P191: !BLD [1] (FP)
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

P192: !BST [10] (maybe <- 0x3f800086) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P193: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P194: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P195: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P196: !DWLD [9] (Int)
ldx [%i1 + 512], %o3
! move %o3(upper) -> %o3(upper)

P197: !BST [4] (maybe <- 0x3f800087) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P198: !BLD [0] (FP)
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

P199: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f0
membar #Sync 
! 1 addresses covered

P200: !BST [11] (maybe <- 0x3f800088) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P201: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P202: !PREFETCH [2] (Int) (CBR)
prefetch [%i0 + 12], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET202
nop
RET202:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P203: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P204: !BLD [0] (FP)
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

P205: !BLD [1] (FP)
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

P206: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P207: !BST [3] (maybe <- 0x3f800089) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P208: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P209: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P210: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f13

P211: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P212: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P213: !BST [1] (maybe <- 0x3f80008d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P214: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P215: !DWLD [12] (Int)
ldx [%i3 + 0], %l3
! move %l3(upper) -> %o3(lower)
srlx %o3, 32, %o3
sllx %o3, 32, %o3
srlx %l3, 32, %o5
or %o5, %o3, %o3

P216: !BLD [11] (FP)
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

P217: !NOP (Int)
nop

P218: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P219: !BST [9] (maybe <- 0x3f800091) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P220: !BLD [12] (FP) (Branch target of P516)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f0
membar #Sync 
! 1 addresses covered
ba P221
nop

TARGET516:
ba RET516
nop


P221: !BST [11] (maybe <- 0x3f800092) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P222: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P223: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P224: !BLD [0] (FP)
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

P225: !ST [13] (maybe <- 0x11) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P226: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P227: !BST [0] (maybe <- 0x3f800093) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P228: !CAS [15] (maybe <- 0x12) (Int)
add %i3, 192, %l7
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

P229: !BLD [7] (FP)
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

P230: !DWST [8] (maybe <- 0x13) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 256 ] 
add   %l4, 1, %l4

P231: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P232: !BLD [0] (FP)
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

P233: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P234: !BLD [2] (FP)
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

P235: !BST [10] (maybe <- 0x3f800097) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P236: !MEMBAR (Int)
membar #StoreLoad

P237: !BST [7] (maybe <- 0x3f800098) (FP)
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

P238: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P239: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P240: !LD [10] (Int) (CBR)
lduw [%i2 + 32], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET240
nop
RET240:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P241: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P242: !BLD [0] (FP)
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

P243: !DWLD [9] (Int)
ldx [%i1 + 512], %l7
! move %l7(upper) -> %o0(lower)
srlx %l7, 32, %l6
or %l6, %o0, %o0

P244: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P245: !BLD [2] (FP)
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

P246: !BST [5] (maybe <- 0x3f80009b) (FP)
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

P247: !BST [10] (maybe <- 0x3f80009e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P248: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P249: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P250: !PREFETCH [14] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i3 + 128] %asi, 1

P251: !BST [8] (maybe <- 0x3f80009f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P252: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P253: !BST [6] (maybe <- 0x3f8000a0) (FP)
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

P254: !BST [15] (maybe <- 0x3f8000a3) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P255: !BST [1] (maybe <- 0x3f8000a4) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P256: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P257: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P258: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P259: !BST [6] (maybe <- 0x3f8000a8) (FP)
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

P260: !BST [14] (maybe <- 0x3f8000ab) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P261: !REPLACEMENT [5] (Int)
sethi %hi(0x4c), %o5
or %o5, %lo(0x4c),  %o5
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

P262: !BST [10] (maybe <- 0x3f8000ac) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P263: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P264: !BST [11] (maybe <- 0x3f8000ad) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P265: !CAS [11] (maybe <- 0x14) (Int)
add %i2, 64, %l6
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

P266: !LD [12] (Int)
lduw [%i3 + 0], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P267: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P268: !BLD [13] (FP)
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

P269: !BST [3] (maybe <- 0x3f8000ae) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P270: !BLD [9] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f0
membar #Sync 
! 1 addresses covered

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET270
nop
RET270:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P271: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P272: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P273: !PREFETCH [14] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i3 + 128] %asi, 1

P274: !LD [12] (Int)
lduw [%i3 + 0], %o5
! move %o5(lower) -> %o2(lower)
or %o5, %o2, %o2

P275: !PREFETCH [0] (Int) (CBR)
prefetch [%i0 + 0], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET275
nop
RET275:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P276: !ST [3] (maybe <- 0x15) (Int) (LE)
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
stwa   %l6, [%i0 + 32] %asi
add   %l4, 1, %l4

P277: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P278: !BST [11] (maybe <- 0x3f8000b2) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P279: !BST [12] (maybe <- 0x3f8000b3) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P280: !BLD [3] (FP)
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

P281: !MEMBAR (Int)
membar #StoreLoad

P282: !BST [13] (maybe <- 0x3f8000b4) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P283: !DWST [8] (maybe <- 0x16) (Int) (CBR)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 256 ] 
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET283
nop
RET283:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P284: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P285: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P286: !BLD [3] (FP)
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

P287: !BLD [2] (FP)
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

P288: !DWST [3] (maybe <- 0x17) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i0 + 32 ] 
add   %l4, 1, %l4

P289: !BLD [6] (FP)
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

P290: !BST [3] (maybe <- 0x3f8000b5) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P291: !BST [3] (maybe <- 0x3f8000b9) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P292: !PREFETCH [12] (Int) (Branch target of P515)
prefetch [%i3 + 0], 1
ba P293
nop

TARGET515:
ba RET515
nop


P293: !BST [9] (maybe <- 0x3f8000bd) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P294: !BLD [1] (FP)
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

P295: !SWAP [1] (maybe <- 0x18) (Int)
mov %l4, %o3
swap  [%i0 + 4], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P296: !BLD [0] (FP) (Branch target of P270)
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
ba P297
nop

TARGET270:
ba RET270
nop


P297: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P298: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P299: !LD [15] (Int)
lduw [%i3 + 192], %l6
! move %l6(lower) -> %o3(lower)
or %l6, %o3, %o3

P300: !BST [14] (maybe <- 0x3f8000be) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P301: !BST [0] (maybe <- 0x3f8000bf) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P302: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P303: !ST [6] (maybe <- 0x19) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P304: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P305: !BLD [2] (FP)
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

P306: !BST [13] (maybe <- 0x3f8000c3) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P307: !LD [0] (Int)
lduw [%i0 + 0], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P308: !BLD [10] (FP)
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

P309: !PREFETCH [4] (Int) (Branch target of P158)
prefetch [%i0 + 64], 1
ba P310
nop

TARGET158:
ba RET158
nop


P310: !BST [10] (maybe <- 0x3f8000c4) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P311: !BST [0] (maybe <- 0x3f8000c5) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P312: !BST [9] (maybe <- 0x3f8000c9) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P313: !BLD [3] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f0
membar #Sync 
! 4 addresses covered
fmovs %f3, %f2
fmovs %f8, %f3

P314: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P315: !BST [5] (maybe <- 0x3f8000ca) (FP)
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

P316: !BST [3] (maybe <- 0x3f8000cd) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P317: !BST [0] (maybe <- 0x3f8000d1) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P318: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P319: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f6

P320: !LD [3] (Int)
lduw [%i0 + 32], %o5
! move %o5(lower) -> %o4(lower)
or %o5, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P321: !BST [15] (maybe <- 0x3f8000d5) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P322: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f36, %f8

P323: !BST [15] (maybe <- 0x3f8000d6) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P324: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P325: !BLD [5] (FP)
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

P326: !DWLD [12] (Int)
ldx [%i3 + 0], %o0
! move %o0(upper) -> %o0(upper)

P327: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P328: !MEMBAR (Int)
membar #StoreLoad

P329: !BST [9] (maybe <- 0x3f8000d7) (FP) (Branch target of P180)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 
ba P330
nop

TARGET180:
ba RET180
nop


P330: !DWLD [11] (Int)
ldx [%i2 + 64], %l3
! move %l3(upper) -> %o0(lower)
srlx %o0, 32, %o0
sllx %o0, 32, %o0
srlx %l3, 32, %o5
or %o5, %o0, %o0

P331: !REPLACEMENT [10] (Int)
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

P332: !CAS [10] (maybe <- 0x1a) (Int)
add %i2, 32, %l6
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

P333: !BST [6] (maybe <- 0x3f8000d8) (FP)
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

P334: !BST [6] (maybe <- 0x3f8000db) (FP)
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

P335: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P336: !DWST [13] (maybe <- 0x1b) (Int)
mov %l4, %l7 
sllx %l7, 32, %l7 
stx %l7, [%i3 + 64 ] 
add   %l4, 1, %l4

P337: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P338: !BST [10] (maybe <- 0x3f8000de) (FP) (CBR)
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
be,pn  %xcc, TARGET338
nop
RET338:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P339: !BST [12] (maybe <- 0x3f8000df) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P340: !ST [1] (maybe <- 0x1c) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P341: !BST [10] (maybe <- 0x3f8000e0) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P342: !BST [3] (maybe <- 0x3f8000e1) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P343: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P344: !BLD [1] (FP)
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

P345: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P346: !BLD [7] (FP)
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

P347: !BLD [0] (FP)
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

P348: !BST [1] (maybe <- 0x3f8000e5) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P349: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P350: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P351: !BST [12] (maybe <- 0x3f8000e9) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P352: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P353: !REPLACEMENT [12] (Int)
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

P354: !BST [13] (maybe <- 0x3f8000ea) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P355: !BST [5] (maybe <- 0x3f8000eb) (FP)
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

P356: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P357: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P358: !BST [8] (maybe <- 0x3f8000ee) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P359: !REPLACEMENT [8] (Int)
sethi %hi(0x100), %o5
or %o5, %lo(0x100),  %o5
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

P360: !ST [15] (maybe <- 0x1d) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P361: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P362: !BST [6] (maybe <- 0x3f8000ef) (FP)
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

P363: !REPLACEMENT [2] (Int)
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

P364: !CAS [11] (maybe <- 0x1e) (Int)
add %i2, 64, %l3
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

P365: !REPLACEMENT [2] (Int)
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

P366: !BLD [7] (FP)
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

P367: !BST [9] (maybe <- 0x3f8000f2) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P368: !REPLACEMENT [12] (Int)
sethi %hi(0x0), %l6
or %l6, %lo(0x0),  %l6
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

P369: !DWST [4] (maybe <- 0x1f) (Int)
mov %l4, %l3 
sllx %l3, 32, %l3 
stx %l3, [%i0 + 64 ] 
add   %l4, 1, %l4

P370: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P371: !BLD [11] (FP)
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

P372: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P373: !BLD [0] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f0
membar #Sync 
! 4 addresses covered
fmovs %f3, %f2
fmovs %f8, %f3

P374: !DWLD [15] (Int)
ldx [%i3 + 192], %o3
! move %o3(upper) -> %o3(upper)

P375: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P376: !BLD [0] (FP)
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

P377: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P378: !BLD [2] (FP) (Branch target of P202)
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
ba P379
nop

TARGET202:
ba RET202
nop


P379: !BLD [1] (FP) (Branch target of P108)
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
ba P380
nop

TARGET108:
ba RET108
nop


P380: !PREFETCH [4] (Int) (Branch target of P431)
prefetch [%i0 + 64], 1
ba P381
nop

TARGET431:
ba RET431
nop


P381: !CASX [4] (maybe <- 0x20) (Int)
add %i0, 64, %l7
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

P382: !BLD [7] (FP)
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

P383: !ST [4] (maybe <- 0x3f8000f3) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i0 + 64 ]

P384: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P385: !BST [5] (maybe <- 0x3f8000f4) (FP)
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

P386: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P387: !PREFETCH [3] (Int) (CBR)
prefetch [%i0 + 32], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET387
nop
RET387:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P388: !BST [1] (maybe <- 0x3f8000f7) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P389: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P390: !ST [3] (maybe <- 0x21) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P391: !SWAP [10] (maybe <- 0x22) (Int)
mov %l4, %l3
swap  [%i2 + 32], %l3
! move %l3(lower) -> %o0(lower)
srl %l3, 0, %l7
or %l7, %o0, %o0
add   %l4, 1, %l4

P392: !ST [0] (maybe <- 0x23) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P393: !DWST [12] (maybe <- 0x24) (Int)
mov %l4, %l3 
sllx %l3, 32, %l3 
stx %l3, [%i3 + 0 ] 
add   %l4, 1, %l4

P394: !BST [4] (maybe <- 0x3f8000fb) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P395: !BST [7] (maybe <- 0x3f8000fc) (FP)
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

P396: !BLD [5] (FP)
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

P397: !BST [5] (maybe <- 0x3f8000ff) (FP)
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

P398: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P399: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P400: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f10

P401: !NOP (Int)
nop

P402: !BST [0] (maybe <- 0x3f800102) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P403: !BLD [3] (FP)
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

P404: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P405: !BLD [3] (FP)
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

P406: !BST [13] (maybe <- 0x3f800106) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P407: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P408: !BST [1] (maybe <- 0x3f800107) (FP) (Branch target of P421)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 
ba P409
nop

TARGET421:
ba RET421
nop


P409: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P410: !BLD [0] (FP)
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

P411: !BST [1] (maybe <- 0x3f80010b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P412: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P413: !BST [0] (maybe <- 0x3f80010f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P414: !BLD [2] (FP)
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

P415: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P416: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P417: !BST [3] (maybe <- 0x3f800113) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P418: !BST [1] (maybe <- 0x3f800117) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P419: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P420: !BLD [6] (FP)
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

P421: !PREFETCH [10] (Int) (CBR)
prefetch [%i2 + 32], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET421
nop
RET421:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P422: !REPLACEMENT [4] (Int)
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

P423: !BLD [3] (FP)
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

P424: !LD [8] (Int)
lduw [%i1 + 256], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P425: !BST [15] (maybe <- 0x3f80011b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P426: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P427: !BLD [13] (FP) (Branch target of P387)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7
ba P428
nop

TARGET387:
ba RET387
nop


P428: !BST [9] (maybe <- 0x3f80011c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P429: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P430: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P431: !PREFETCH [10] (Int) (CBR)
prefetch [%i2 + 32], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET431
nop
RET431:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P432: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P433: !NOP (Int)
nop

P434: !BST [2] (maybe <- 0x3f80011d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P435: !BST [8] (maybe <- 0x3f800121) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P436: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f9

P437: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f10

P438: !BST [15] (maybe <- 0x3f800122) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P439: !BST [6] (maybe <- 0x3f800123) (FP)
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

P440: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f11
fmovd %f36, %f12

P441: !BLD [0] (FP)
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

P442: !BST [14] (maybe <- 0x3f800126) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P443: !BST [2] (maybe <- 0x3f800127) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P444: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P445: !BLD [3] (FP)
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

P446: !BST [4] (maybe <- 0x3f80012b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P447: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P448: !SWAP [12] (maybe <- 0x25) (Int)
mov %l4, %l6
swap  [%i3 + 0], %l6
! move %l6(lower) -> %o1(lower)
srl %l6, 0, %o5
or %o5, %o1, %o1
add   %l4, 1, %l4

P449: !DWLD [13] (Int)
ldx [%i3 + 64], %o2
! move %o2(upper) -> %o2(upper)

P450: !BLD [7] (FP)
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

P451: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f9

P452: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P453: !CAS [10] (maybe <- 0x26) (Int)
add %i2, 32, %l6
lduw [%l6], %o5
mov %o5, %l3
! move %l3(lower) -> %o2(lower)
srlx %o2, 32, %o2
sllx %o2, 32, %o2
or %l3, %o2, %o2
mov %l4, %o3
cas [%l6], %l3, %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P454: !BST [13] (maybe <- 0x3f80012c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P455: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P456: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P457: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P458: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P459: !REPLACEMENT [15] (Int)
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

P460: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P461: !BST [15] (maybe <- 0x3f80012d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P462: !BLD [6] (FP)
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

P463: !DWLD [6] (Int)
ldx [%i1 + 80], %l7
! move %l7(upper) -> %o3(lower)
srlx %l7, 32, %l6
or %l6, %o3, %o3
! move %l7(lower) -> %o4(upper)
sllx %l7, 32, %o4

P464: !BST [0] (maybe <- 0x3f80012e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P465: !BST [3] (maybe <- 0x3f800132) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P466: !BLD [9] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f0
membar #Sync 
! 1 addresses covered

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET466
nop
RET466:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P467: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f36, %f2

P468: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P469: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P470: !BLD [7] (FP)
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

P471: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P472: !BLD [2] (FP)
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

P473: !BLD [1] (FP)
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

P474: !BLD [14] (FP)
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

P475: !BLD [0] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f0
membar #Sync 
! 4 addresses covered
fmovs %f3, %f2
fmovs %f8, %f3

P476: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P477: !CASX [14] (maybe <- 0x27) (Int)
add %i3, 128, %o5
ldx [%o5], %l6
! move %l6(upper) -> %o4(lower)
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

P478: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P479: !BST [5] (maybe <- 0x3f800136) (FP)
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

P480: !LD [9] (Int)
lduw [%i1 + 512], %l7
! move %l7(lower) -> %o1(lower)
or %l7, %o1, %o1

P481: !CASX [10] (maybe <- 0x28) (Int)
add %i2, 32, %l3
ldx [%l3], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov  %o2, %o5
sllx %l4, 32, %o3
casx [%l3], %o5, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4

P482: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P483: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P484: !DWLD [9] (Int)
ldx [%i1 + 512], %o4
! move %o4(upper) -> %o4(upper)

P485: !BST [0] (maybe <- 0x3f800139) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P486: !BST [11] (maybe <- 0x3f80013d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P487: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P488: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P489: !BLD [2] (FP)
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

P490: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P491: !CAS [0] (maybe <- 0x29) (Int) (LE)
! Change single-word-level endianess (big endian <-> little endian) 
sethi %hi(0xff00ff00), %l3
or %l3, %lo(0xff00ff00), %l3
and %l4, %l3, %o5
srl %o5, 8, %o5
sll %l4, 8, %l6
and %l6, %l3, %l6
or %l6, %o5, %l6
srl %l6, 16, %o5
sll %l6, 16, %l6
srl %l6, 0, %l6
or %l6, %o5, %l6
wr %g0, 0x88, %asi
add %i0, 0, %l3
lduwa [%l3] %asi, %l7
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
mov %l6, %o0
casa [%l3] %asi, %o5, %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
add   %l4, 1, %l4

P492: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P493: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P494: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f11
fmovd %f36, %f12

P495: !PREFETCH [5] (Int) (Branch target of P106)
prefetch [%i1 + 76], 1
ba P496
nop

TARGET106:
ba RET106
nop


P496: !DWST [10] (maybe <- 0x2a) (Int)
mov %l4, %o5 
sllx %o5, 32, %o5 
stx %o5, [%i2 + 32 ] 
add   %l4, 1, %l4

P497: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P498: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P499: !BST [12] (maybe <- 0x3f80013e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P500: !BLD [6] (FP)
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

P501: !MEMBAR (Int)
membar #StoreLoad

P502: !LD [0] (Int)
lduw [%i0 + 0], %l7
! move %l7(lower) -> %o0(lower)
or %l7, %o0, %o0

P503: !LD [1] (FP)
ld [%i0 + 4], %f1
! 1 addresses covered

P504: !LD [2] (Int)
lduw [%i0 + 12], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P505: !LD [3] (Int) (Branch target of P283)
lduw [%i0 + 32], %l7
! move %l7(lower) -> %o1(lower)
or %l7, %o1, %o1
ba P506
nop

TARGET283:
ba RET283
nop


P506: !LD [4] (Int)
lduw [%i0 + 64], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P507: !LD [5] (Int)
lduw [%i1 + 76], %l7
! move %l7(lower) -> %o2(lower)
or %l7, %o2, %o2

P508: !LD [6] (Int)
lduw [%i1 + 80], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P509: !LD [7] (Int)
lduw [%i1 + 84], %l7
! move %l7(lower) -> %o3(lower)
or %l7, %o3, %o3

P510: !LD [8] (Int)
lduw [%i1 + 256], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P511: !LD [9] (Int)
lduw [%i1 + 512], %l7
! move %l7(lower) -> %o4(lower)
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P512: !LD [10] (Int)
lduw [%i2 + 32], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P513: !LD [11] (Int)
lduw [%i2 + 64], %l7
! move %l7(lower) -> %o0(lower)
or %l7, %o0, %o0

P514: !LD [12] (FP)
ld [%i3 + 0], %f2
! 1 addresses covered

P515: !LD [13] (Int) (CBR)
lduw [%i3 + 64], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET515
nop
RET515:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P516: !LD [14] (Int) (CBR)
lduw [%i3 + 128], %o5
! move %o5(lower) -> %o1(lower)
or %o5, %o1, %o1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET516
nop
RET516:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P517: !LD [15] (Int)
lduw [%i3 + 192], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

END_NODES0: ! Test istream for CPU 0 ends
sethi %hi(0xdead0e0f), %o5
or    %o5, %lo(0xdead0e0f), %o5
! move %o5(lower) -> %o2(lower)
or %o5, %o2, %o2
stw %o5, [%i5] 
ld [%i5], %f3
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30

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
sethi %hi(0x01deade1), %l7
or    %l7, %lo(0x01deade1), %l7
stw %l7, [%i5] 
ld [%i5], %f16

! Initialize running integer counter in register %l4
sethi %hi(0x800001), %l4
or    %l4, %lo(0x800001), %l4

! Initialize running FP counter in register %f16
sethi %hi(0x40000001), %l7
or    %l7, %lo(0x40000001), %l7
stw %l7, [%i5] 
ld [%i5], %f16

! Initialize FP counter increment value in register %f17 (constant)
sethi %hi(0x34800000), %l7
or    %l7, %lo(0x34800000), %l7
stw %l7, [%i5] 
ld [%i5], %f17 

! Initialize LFSR to 0xf95^4
sethi %hi(0xf95), %l0
or    %l0, %lo(0xf95), %l0
mulx  %l0, %l0, %l0
mulx  %l0, %l0, %l0

!-- init shared addrs 2 to 3 ---
stx %g0, [%i0+8]
stx %g0, [%i0+32]

! use untouched cache-line (offset 4K) in replacement area for sync
sub %i1, %i0, %o5
add %i3, %o5, %o5
sub %o5, -4096, %o5

!-- begin of sync_init ---
or %g0, 1, %l3
or %g0, %l3, %l6
swap [%o5+4], %l6
membar #Sync
sync_init_1_1:
brnz,pt %l3, sync_init_1_1
lduw [%o5+4], %l3 ! delay slot
sync_init_2_1:
lduw [%o5], %l3
sub %l3, 1, %l6
cas [%o5], %l3, %l6
cmp %l3, %l6
bne,pt %xcc, sync_init_2_1
nop
membar #Sync
sync_init_3_1:
lduw [%o5], %l3 ! delay slot
brnz,pt %l3, sync_init_3_1
nop
!-- end of sync_init ---


BEGIN_NODES1: ! Test istream for CPU 1 begins

P518: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f0
membar #Sync 
! 1 addresses covered

P519: !MEMBAR (Int)
membar #StoreLoad

P520: !BST [1] (maybe <- 0x40000001) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P521: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f36, %f2

P522: !REPLACEMENT [4] (Int)
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

P523: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P524: !BST [11] (maybe <- 0x40000005) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P525: !BST [0] (maybe <- 0x40000006) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P526: !DWST [7] (maybe <- 0x800001) (Int)
sllx %l4, 32, %l7 
add   %l4, 1, %l4
or %l7, %l4, %l7
stx %l7, [%i1 + 80]
add   %l4, 1, %l4

P527: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P528: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P529: !BST [4] (maybe <- 0x4000000a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P530: !BLD [2] (FP) (Branch target of P604)
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
ba P531
nop

TARGET604:
ba RET604
nop


P531: !BST [4] (maybe <- 0x4000000b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P532: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P533: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P534: !BLD [6] (FP)
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

P535: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P536: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P537: !BST [4] (maybe <- 0x4000000c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P538: !REPLACEMENT [0] (Int)
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

P539: !BLD [5] (FP)
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

P540: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P541: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P542: !BST [13] (maybe <- 0x4000000d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P543: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P544: !ST [12] (maybe <- 0x4000000e) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i3 + 0 ]

P545: !BST [11] (maybe <- 0x4000000f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P546: !BLD [3] (FP)
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

P547: !BST [2] (maybe <- 0x40000010) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P548: !PREFETCH [9] (Int) (Branch target of P855)
prefetch [%i1 + 512], 1
ba P549
nop

TARGET855:
ba RET855
nop


P549: !BLD [1] (FP)
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

P550: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P551: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P552: !BST [12] (maybe <- 0x40000014) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P553: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P554: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P555: !DWST [13] (maybe <- 0x40000015) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
std %f20, [%i3 + 64]

P556: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P557: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P558: !BST [14] (maybe <- 0x40000016) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P559: !BST [13] (maybe <- 0x40000017) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P560: !BLD [0] (FP)
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

P561: !BST [14] (maybe <- 0x40000018) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P562: !DWST [13] (maybe <- 0x800003) (Int) (LE)
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
stxa %l6, [%i3 + 64 ] %asi
add   %l4, 1, %l4

P563: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P564: !ST [12] (maybe <- 0x40000019) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i3 + 0 ]

P565: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f3
fmovd %f36, %f4

P566: !CAS [3] (maybe <- 0x800004) (Int)
add %i0, 32, %o5
lduw [%o5], %o0
mov %o0, %l7
! move %l7(lower) -> %o0(upper)
sllx %l7, 32, %o0
mov %l4, %l6
cas [%o5], %l7, %l6
! move %l6(lower) -> %o0(lower)
srl %l6, 0, %o5
or %o5, %o0, %o0
add   %l4, 1, %l4

P567: !BST [5] (maybe <- 0x4000001a) (FP)
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

P568: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P569: !BST [15] (maybe <- 0x4000001d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P570: !REPLACEMENT [14] (Int)
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

P571: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P572: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P573: !BLD [2] (FP)
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

P574: !BLD [6] (FP)
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

P575: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P576: !BST [8] (maybe <- 0x4000001e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P577: !BLD [8] (FP)
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

P578: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P579: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P580: !ST [14] (maybe <- 0x800005) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P581: !BLD [6] (FP) (Branch target of P644)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f0
membar #Sync 
! 3 addresses covered
fmovs %f3, %f0
fmovs %f4, %f1
fmovs %f5, %f2
ba P582
nop

TARGET644:
ba RET644
nop


P582: !LD [9] (FP)
ld [%i1 + 512], %f3
! 1 addresses covered

P583: !BST [10] (maybe <- 0x4000001f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P584: !BLD [6] (FP)
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

P585: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P586: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P587: !BST [1] (maybe <- 0x40000020) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P588: !BST [0] (maybe <- 0x40000024) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P589: !BST [4] (maybe <- 0x40000028) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P590: !BST [3] (maybe <- 0x40000029) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P591: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P592: !BLD [2] (FP) (Branch target of P954)
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
ba P593
nop

TARGET954:
ba RET954
nop


P593: !SWAP [11] (maybe <- 0x800006) (Int)
mov %l4, %o1
swap  [%i2 + 64], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P594: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P595: !PREFETCH [1] (Int) (Branch target of P603)
prefetch [%i0 + 4], 1
ba P596
nop

TARGET603:
ba RET603
nop


P596: !BST [10] (maybe <- 0x4000002d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P597: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P598: !BLD [14] (FP)
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

P599: !BLD [9] (FP) (Branch target of P969)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f0
membar #Sync 
! 1 addresses covered
ba P600
nop

TARGET969:
ba RET969
nop


P600: !BST [0] (maybe <- 0x4000002e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P601: !SWAP [8] (maybe <- 0x800007) (Int)
mov %l4, %o5
swap  [%i1 + 256], %o5
! move %o5(lower) -> %o1(lower)
srl %o5, 0, %l6
or %l6, %o1, %o1
add   %l4, 1, %l4

P602: !BST [6] (maybe <- 0x40000032) (FP)
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

P603: !DWLD [3] (Int) (CBR)
ldx [%i0 + 32], %o2
! move %o2(upper) -> %o2(upper)

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET603
nop
RET603:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P604: !BST [2] (maybe <- 0x40000035) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
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
be,pn  %xcc, TARGET604
nop
RET604:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P605: !BST [1] (maybe <- 0x40000039) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P606: !BLD [2] (FP)
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

P607: !BST [9] (maybe <- 0x4000003d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P608: !BST [4] (maybe <- 0x4000003e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P609: !BST [5] (maybe <- 0x4000003f) (FP)
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

P610: !BST [9] (maybe <- 0x40000042) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P611: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P612: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P613: !DWLD [12] (Int)
ldx [%i3 + 0], %l7
! move %l7(upper) -> %o2(lower)
srlx %o2, 32, %o2
sllx %o2, 32, %o2
srlx %l7, 32, %l6
or %l6, %o2, %o2

P614: !BLD [5] (FP) (CBR)
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
be,pt  %xcc, TARGET614
nop
RET614:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P615: !SWAP [11] (maybe <- 0x800008) (Int)
mov %l4, %o3
swap  [%i2 + 64], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P616: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P617: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P618: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P619: !BST [7] (maybe <- 0x40000043) (FP)
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

P620: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P621: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P622: !BLD [2] (FP)
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

P623: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P624: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P625: !BLD [3] (FP)
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

P626: !CASX [3] (maybe <- 0x800009) (Int)
add %i0, 32, %o5
ldx [%o5], %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %l7
or %l7, %o3, %o3
! move %l6(lower) -> %o4(upper)
sllx %l6, 32, %o4
mov  %l6, %l7
sllx %l4, 32, %l6
casx [%o5], %l7, %l6
! move %l6(upper) -> %o4(lower)
srlx %l6, 32, %o5
or %o5, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0
add  %l4, 1, %l4

P627: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P628: !BST [13] (maybe <- 0x40000046) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P629: !BST [3] (maybe <- 0x40000047) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P630: !BST [0] (maybe <- 0x4000004b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P631: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P632: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P633: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P634: !LD [7] (Int)
lduw [%i1 + 84], %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0

P635: !BST [14] (maybe <- 0x4000004f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P636: !BST [12] (maybe <- 0x40000050) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P637: !BST [2] (maybe <- 0x40000051) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P638: !BLD [0] (FP)
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

P639: !BLD [14] (FP) (Branch target of P844)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7
ba P640
nop

TARGET844:
ba RET844
nop


P640: !MEMBAR (Int)
membar #StoreLoad

P641: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P642: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P643: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P644: !BST [1] (maybe <- 0x40000055) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
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
be,pt  %xcc, TARGET644
nop
RET644:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P645: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P646: !BST [11] (maybe <- 0x40000059) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P647: !BST [0] (maybe <- 0x4000005a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P648: !BST [8] (maybe <- 0x4000005e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P649: !BST [5] (maybe <- 0x4000005f) (FP)
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

P650: !BLD [3] (FP)
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

P651: !MEMBAR (Int)
membar #StoreLoad

P652: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P653: !PREFETCH [6] (Int) (CBR)
prefetch [%i1 + 80], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET653
nop
RET653:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P654: !BLD [9] (FP)
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

P655: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f0
membar #Sync 
! 1 addresses covered

P656: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P657: !DWST [3] (maybe <- 0x80000a) (Int)
mov %l4, %o5 
sllx %o5, 32, %o5 
stx %o5, [%i0 + 32 ] 
add   %l4, 1, %l4

P658: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P659: !DWST [13] (maybe <- 0x80000b) (Int)
mov %l4, %l7 
sllx %l7, 32, %l7 
stx %l7, [%i3 + 64 ] 
add   %l4, 1, %l4

P660: !BLD [5] (FP)
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

P661: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P662: !DWLD [8] (Int)
ldx [%i1 + 256], %o1
! move %o1(upper) -> %o1(upper)

P663: !BST [0] (maybe <- 0x40000062) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P664: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P665: !BST [15] (maybe <- 0x40000066) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P666: !SWAP [1] (maybe <- 0x80000c) (Int) (CBR)
mov %l4, %o5
swap  [%i0 + 4], %o5
! move %o5(lower) -> %o1(lower)
srlx %o1, 32, %o1
sllx %o1, 32, %o1
srl %o5, 0, %l6
or %l6, %o1, %o1
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET666
nop
RET666:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P667: !BLD [0] (FP)
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

P668: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P669: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P670: !SWAP [0] (maybe <- 0x80000d) (Int)
mov %l4, %o2
swap  [%i0 + 0], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P671: !BST [13] (maybe <- 0x40000067) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P672: !BST [8] (maybe <- 0x40000068) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P673: !DWLD [4] (Int)
ldx [%i0 + 64], %o5
! move %o5(upper) -> %o2(lower)
srlx %o5, 32, %l7
or %l7, %o2, %o2

P674: !CAS [15] (maybe <- 0x80000e) (Int)
add %i3, 192, %l6
lduw [%l6], %o3
mov %o3, %l3
! move %l3(lower) -> %o3(upper)
sllx %l3, 32, %o3
mov %l4, %o5
cas [%l6], %l3, %o5
! move %o5(lower) -> %o3(lower)
srl %o5, 0, %l6
or %l6, %o3, %o3
add   %l4, 1, %l4

P675: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P676: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P677: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P678: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P679: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P680: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P681: !SWAP [3] (maybe <- 0x80000f) (Int)
mov %l4, %o4
swap  [%i0 + 32], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P682: !BST [0] (maybe <- 0x40000069) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P683: !ST [4] (maybe <- 0x800010) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P684: !ST [5] (maybe <- 0x800011) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P685: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P686: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P687: !BST [8] (maybe <- 0x4000006d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P688: !BLD [9] (FP)
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

P689: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P690: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f0
membar #Sync 
! 1 addresses covered

P691: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P692: !CAS [1] (maybe <- 0x800012) (Int)
add %i0, 4, %l3
lduw [%l3], %l7
mov %l7, %o5
! move %o5(lower) -> %o4(lower)
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

P693: !BLD [1] (FP)
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

P694: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P695: !BST [5] (maybe <- 0x4000006e) (FP)
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

P696: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P697: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P698: !BST [4] (maybe <- 0x40000071) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P699: !BST [10] (maybe <- 0x40000072) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P700: !BST [13] (maybe <- 0x40000073) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P701: !BLD [1] (FP)
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

P702: !BLD [6] (FP)
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

P703: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P704: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P705: !BLD [2] (FP)
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

P706: !BST [6] (maybe <- 0x40000074) (FP)
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

P707: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P708: !MEMBAR (Int)
membar #StoreLoad

P709: !BST [0] (maybe <- 0x40000077) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P710: !BST [9] (maybe <- 0x4000007b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P711: !BLD [7] (FP)
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

P712: !DWST [11] (maybe <- 0x800013) (Int)
mov %l4, %l3 
sllx %l3, 32, %l3 
stx %l3, [%i2 + 64 ] 
add   %l4, 1, %l4

P713: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P714: !BLD [1] (FP)
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

P715: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P716: !ST [7] (maybe <- 0x800014) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P717: !BST [4] (maybe <- 0x4000007c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P718: !CASX [13] (maybe <- 0x800015) (Int)
add %i3, 64, %l7
ldx [%l7], %l3
! move %l3(upper) -> %o0(lower)
srlx %l3, 32, %l6
or %l6, %o0, %o0
! move %l3(lower) -> %o1(upper)
sllx %l3, 32, %o1
mov  %l3, %l6
sllx %l4, 32, %l3
casx [%l7], %l6, %l3
! move %l3(upper) -> %o1(lower)
srlx %l3, 32, %l7
or %l7, %o1, %o1
! move %l3(lower) -> %o2(upper)
sllx %l3, 32, %o2
add  %l4, 1, %l4

P719: !BLD [5] (FP)
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

P720: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P721: !BST [5] (maybe <- 0x4000007d) (FP)
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

P722: !BST [1] (maybe <- 0x40000080) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P723: !BST [2] (maybe <- 0x40000084) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P724: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P725: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P726: !ST [3] (maybe <- 0x800016) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P727: !BLD [2] (FP)
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

P728: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P729: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P730: !BLD [0] (FP)
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

P731: !BLD [2] (FP)
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

P732: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P733: !BST [5] (maybe <- 0x40000088) (FP) (CBR)
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
be,pn  %xcc, TARGET733
nop
RET733:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P734: !BLD [1] (FP) (Branch target of P614)
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
ba P735
nop

TARGET614:
ba RET614
nop


P735: !REPLACEMENT [13] (Int)
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

P736: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P737: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P738: !BLD [1] (FP)
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

P739: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f3
fmovd %f36, %f4

P740: !BST [10] (maybe <- 0x4000008b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P741: !BST [12] (maybe <- 0x4000008c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P742: !MEMBAR (Int)
membar #StoreLoad

P743: !BLD [5] (FP)
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

P744: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P745: !BST [0] (maybe <- 0x4000008d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P746: !REPLACEMENT [15] (Int)
sethi %hi(0xc0), %l6
or %l6, %lo(0xc0),  %l6
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

P747: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P748: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P749: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P750: !PREFETCH [5] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i1 + 76] %asi, 1

P751: !LD [2] (Int)
lduw [%i0 + 12], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2

P752: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P753: !BST [13] (maybe <- 0x40000091) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P754: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P755: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P756: !PREFETCH [5] (Int) (CBR)
prefetch [%i1 + 76], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET756
nop
RET756:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P757: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P758: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P759: !DWLD [11] (Int)
ldx [%i2 + 64], %o3
! move %o3(upper) -> %o3(upper)

P760: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P761: !PREFETCH [9] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i1 + 512] %asi, 1

P762: !BST [6] (maybe <- 0x40000092) (FP)
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

P763: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P764: !DWLD [1] (Int)
ldx [%i0 + 0], %l3
! move %l3(upper) -> %o3(lower)
srlx %o3, 32, %o3
sllx %o3, 32, %o3
srlx %l3, 32, %o5
or %o5, %o3, %o3
! move %l3(lower) -> %o4(upper)
sllx %l3, 32, %o4

P765: !CAS [1] (maybe <- 0x800017) (Int)
add %i0, 4, %l7
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

P766: !BST [9] (maybe <- 0x40000095) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P767: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P768: !BST [12] (maybe <- 0x40000096) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P769: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P770: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P771: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P772: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P773: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P774: !BST [14] (maybe <- 0x40000097) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P775: !REPLACEMENT [2] (Int)
sethi %hi(0xc), %l7
or %l7, %lo(0xc),  %l7
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

P776: !BST [11] (maybe <- 0x40000098) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P777: !BLD [8] (FP)
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

P778: !ST [1] (maybe <- 0x800018) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P779: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f0
membar #Sync 
! 1 addresses covered

P780: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P781: !ST [15] (maybe <- 0x800019) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P782: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P783: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P784: !BST [8] (maybe <- 0x40000099) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P785: !LD [4] (Int)
lduw [%i0 + 64], %l7
! move %l7(lower) -> %o0(lower)
or %l7, %o0, %o0

P786: !BLD [15] (FP) (Branch target of P733)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1
ba P787
nop

TARGET733:
ba RET733
nop


P787: !BST [12] (maybe <- 0x4000009a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P788: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P789: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P790: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P791: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P792: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P793: !BST [11] (maybe <- 0x4000009b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P794: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P795: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P796: !BLD [2] (FP)
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

P797: !BST [5] (maybe <- 0x4000009c) (FP)
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

P798: !BLD [1] (FP)
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

P799: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P800: !REPLACEMENT [14] (Int)
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

P801: !MEMBAR (Int)
membar #StoreLoad

P802: !BST [7] (maybe <- 0x4000009f) (FP)
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

P803: !DWST [8] (maybe <- 0x80001a) (Int)
mov %l4, %l7 
sllx %l7, 32, %l7 
stx %l7, [%i1 + 256 ] 
add   %l4, 1, %l4

P804: !ST [11] (maybe <- 0x80001b) (Int) (Branch target of P968)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4
ba P805
nop

TARGET968:
ba RET968
nop


P805: !BST [13] (maybe <- 0x400000a2) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P806: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P807: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P808: !BST [5] (maybe <- 0x400000a3) (FP)
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

P809: !BLD [6] (FP)
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

P810: !BLD [2] (FP)
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

P811: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P812: !DWLD [15] (Int)
ldx [%i3 + 192], %o1
! move %o1(upper) -> %o1(upper)

P813: !BST [5] (maybe <- 0x400000a6) (FP) (Branch target of P1021)
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
ba P814
nop

TARGET1021:
ba RET1021
nop


P814: !BST [12] (maybe <- 0x400000a9) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P815: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P816: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P817: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P818: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P819: !BLD [3] (FP)
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

P820: !LD [4] (Int)
lduw [%i0 + 64], %o5
! move %o5(lower) -> %o1(lower)
srlx %o1, 32, %o1
sllx %o1, 32, %o1
or %o5, %o1, %o1

P821: !DWLD [12] (Int)
ldx [%i3 + 0], %o2
! move %o2(upper) -> %o2(upper)

P822: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P823: !BST [7] (maybe <- 0x400000aa) (FP)
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

P824: !PREFETCH [6] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i1 + 80] %asi, 1

P825: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P826: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P827: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P828: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P829: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P830: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P831: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P832: !BLD [5] (FP)
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

P833: !BLD [3] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f0
membar #Sync 
! 4 addresses covered
fmovs %f3, %f2
fmovs %f8, %f3

P834: !ST [4] (maybe <- 0x400000ad) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i0 + 64 ]

P835: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P836: !BST [0] (maybe <- 0x400000ae) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P837: !ST [15] (maybe <- 0x80001c) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P838: !BLD [6] (FP)
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

P839: !REPLACEMENT [8] (Int)
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

P840: !CASX [2] (maybe <- 0x80001d) (Int)
add %i0, 8, %l7
ldx [%l7], %l3
! move %l3(upper) -> %o2(lower)
srlx %o2, 32, %o2
sllx %o2, 32, %o2
srlx %l3, 32, %l6
or %l6, %o2, %o2
! move %l3(lower) -> %o3(upper)
sllx %l3, 32, %o3
mov  %l3, %l6
mov %l4, %l3
casx [%l7], %l6, %l3
! move %l3(upper) -> %o3(lower)
srlx %l3, 32, %l7
or %l7, %o3, %o3
! move %l3(lower) -> %o4(upper)
sllx %l3, 32, %o4
add  %l4, 1, %l4

P841: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P842: !DWST [4] (maybe <- 0x80001e) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i0 + 64 ] 
add   %l4, 1, %l4

P843: !BST [7] (maybe <- 0x400000b2) (FP)
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

P844: !DWST [7] (maybe <- 0x80001f) (Int) (CBR)
sllx %l4, 32, %o5 
add   %l4, 1, %l4
or %o5, %l4, %o5
stx %o5, [%i1 + 80]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET844
nop
RET844:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P845: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P846: !BST [6] (maybe <- 0x400000b5) (FP)
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

P847: !LD [5] (Int)
lduw [%i1 + 76], %o5
! move %o5(lower) -> %o4(lower)
or %o5, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P848: !BST [15] (maybe <- 0x400000b8) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P849: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P850: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P851: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P852: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P853: !DWLD [5] (Int)
ldx [%i1 + 72], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P854: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P855: !PREFETCH [4] (Int) (CBR)
prefetch [%i0 + 64], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET855
nop
RET855:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P856: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P857: !BLD [0] (FP)
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

P858: !BLD [7] (FP)
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

P859: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P860: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P861: !DWLD [11] (Int)
ldx [%i2 + 64], %o5
! move %o5(upper) -> %o0(lower)
srlx %o5, 32, %l7
or %l7, %o0, %o0

P862: !BST [11] (maybe <- 0x400000b9) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P863: !BLD [7] (FP)
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

P864: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P865: !ST [1] (maybe <- 0x800021) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P866: !CAS [14] (maybe <- 0x800022) (Int)
add %i3, 128, %o5
lduw [%o5], %o1
mov %o1, %l7
! move %l7(lower) -> %o1(upper)
sllx %l7, 32, %o1
mov %l4, %l6
cas [%o5], %l7, %l6
! move %l6(lower) -> %o1(lower)
srl %l6, 0, %o5
or %o5, %o1, %o1
add   %l4, 1, %l4

P867: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P868: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P869: !BST [12] (maybe <- 0x400000ba) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P870: !LD [14] (Int)
lduw [%i3 + 128], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P871: !BLD [6] (FP) (Branch target of P756)
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
ba P872
nop

TARGET756:
ba RET756
nop


P872: !BST [9] (maybe <- 0x400000bb) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P873: !BLD [0] (FP)
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

P874: !BST [6] (maybe <- 0x400000bc) (FP)
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

P875: !BLD [1] (FP)
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

P876: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P877: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P878: !BLD [0] (FP)
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

P879: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P880: !BST [3] (maybe <- 0x400000bf) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P881: !BST [14] (maybe <- 0x400000c3) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P882: !BST [13] (maybe <- 0x400000c4) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P883: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P884: !BST [4] (maybe <- 0x400000c5) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P885: !BST [15] (maybe <- 0x400000c6) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P886: !BST [13] (maybe <- 0x400000c7) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P887: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f9
fmovd %f36, %f10

P888: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P889: !BLD [7] (FP)
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

P890: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P891: !BST [10] (maybe <- 0x400000c8) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P892: !REPLACEMENT [8] (Int)
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

P893: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f0
membar #Sync 
! 3 addresses covered
fmovs %f3, %f0
fmovs %f4, %f1
fmovs %f5, %f2

P894: !BST [2] (maybe <- 0x400000c9) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P895: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f3

P896: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P897: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P898: !BST [9] (maybe <- 0x400000cd) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P899: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P900: !LD [0] (Int)
lduw [%i0 + 0], %l3
! move %l3(lower) -> %o2(lower)
or %l3, %o2, %o2

P901: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P902: !BST [9] (maybe <- 0x400000ce) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P903: !LD [6] (Int)
lduw [%i1 + 80], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P904: !REPLACEMENT [9] (Int)
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

P905: !DWLD [5] (Int)
ldx [%i1 + 72], %l7
! move %l7(lower) -> %o3(lower)
srl %l7, 0, %l6
or %l6, %o3, %o3

P906: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P907: !BLD [3] (FP)
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

P908: !LD [4] (Int)
lduw [%i0 + 64], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P909: !BST [7] (maybe <- 0x400000cf) (FP)
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

P910: !DWLD [15] (FP)
ldd [%i3 + 192], %f10
! 1 addresses covered

P911: !SWAP [6] (maybe <- 0x800023) (Int)
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

P912: !BST [15] (maybe <- 0x400000d2) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P913: !BST [9] (maybe <- 0x400000d3) (FP) (Branch target of P666)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 
ba P914
nop

TARGET666:
ba RET666
nop


P914: !BST [0] (maybe <- 0x400000d4) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P915: !BST [8] (maybe <- 0x400000d8) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P916: !DWLD [14] (FP)
ldd [%i3 + 128], %f18
! 1 addresses covered
fmovs %f18, %f11

P917: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P918: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P919: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P920: !BST [11] (maybe <- 0x400000d9) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P921: !BST [8] (maybe <- 0x400000da) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P922: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P923: !BLD [5] (FP)
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

P924: !BST [5] (maybe <- 0x400000db) (FP)
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

P925: !DWST [0] (maybe <- 0x800024) (Int) (LE)
wr %g0, 0x88, %asi
sllx %l4, 32, %l3
add   %l4, 1, %l4
or %l3, %l4, %l6
! Change double-word-level endianess (big endian <-> little endian) 
sethi %hi(0xff00ff00), %l7
or %l7, %lo(0xff00ff00), %l7
sllx %l7, 32, %l3
or %l7, %l3, %l7 
and %l6, %l7, %l3
srlx %l3, 8, %l3
sllx %l6, 8, %l6
and %l6, %l7, %l6
or %l6, %l3, %l6 
sethi %hi(0xffff0000), %l7
or %l7, %lo(0xffff0000), %l7
srlx %l6, 16, %l3
andn %l3, %l7, %l3
andn %l6, %l7, %l6
sllx %l6, 16, %l6
or %l6, %l3, %l6 
srlx %l6, 32, %l3
sllx %l6, 32, %l6
or %l6, %l3, %l3 
stxa %l3, [%i0 + 0 ] %asi
add   %l4, 1, %l4

P926: !BLD [12] (FP)
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

P927: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f0
membar #Sync 
! 1 addresses covered

P928: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P929: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P930: !BST [4] (maybe <- 0x400000de) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P931: !BST [11] (maybe <- 0x400000df) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P932: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P933: !PREFETCH [2] (Int) (Branch target of P653)
prefetch [%i0 + 12], 1
ba P934
nop

TARGET653:
ba RET653
nop


P934: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P935: !MEMBAR (Int)
membar #StoreLoad

P936: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P937: !BST [12] (maybe <- 0x400000e0) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P938: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P939: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P940: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P941: !BLD [0] (FP)
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

P942: !BST [0] (maybe <- 0x400000e1) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P943: !ST [3] (maybe <- 0x800026) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P944: !BST [6] (maybe <- 0x400000e5) (FP)
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

P945: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P946: !CASX [9] (maybe <- 0x800027) (Int)
add %i1, 512, %l7
ldx [%l7], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l6
sllx %l4, 32, %o1
casx [%l7], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P947: !BLD [2] (FP)
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

P948: !BLD [1] (FP)
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

P949: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P950: !DWLD [6] (Int)
ldx [%i1 + 80], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)

P951: !LD [0] (Int)
lduw [%i0 + 0], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P952: !MEMBAR (Int)
membar #StoreLoad

P953: !DWLD [0] (Int)
ldx [%i0 + 0], %l7
! move %l7(upper) -> %o3(lower)
srlx %l7, 32, %l6
or %l6, %o3, %o3
! move %l7(lower) -> %o4(upper)
sllx %l7, 32, %o4

P954: !BLD [8] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f0
membar #Sync 
! 1 addresses covered

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET954
nop
RET954:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P955: !LD [14] (Int)
lduw [%i3 + 128], %l6
! move %l6(lower) -> %o4(lower)
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P956: !ST [14] (maybe <- 0x800028) (Int) (CBR)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET956
nop
RET956:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P957: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f36, %f2

P958: !MEMBAR (Int)
membar #StoreLoad

P959: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P960: !DWLD [4] (Int)
ldx [%i0 + 64], %o0
! move %o0(upper) -> %o0(upper)

P961: !ST [12] (maybe <- 0x800029) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P962: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P963: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P964: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P965: !DWST [5] (maybe <- 0x80002a) (Int)
mov %l4, %o5 
stx %o5, [%i1 + 72]
add   %l4, 1, %l4

P966: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P967: !BST [7] (maybe <- 0x400000e8) (FP)
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

P968: !PREFETCH [14] (Int) (CBR) (Branch target of P956)
prefetch [%i3 + 128], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET968
nop
RET968:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0

ba P969
nop

TARGET956:
ba RET956
nop


P969: !PREFETCH [10] (Int) (CBR)
prefetch [%i2 + 32], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET969
nop
RET969:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P970: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P971: !BST [7] (maybe <- 0x400000eb) (FP)
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

P972: !SWAP [10] (maybe <- 0x80002b) (Int)
mov %l4, %l3
swap  [%i2 + 32], %l3
! move %l3(lower) -> %o0(lower)
srlx %o0, 32, %o0
sllx %o0, 32, %o0
srl %l3, 0, %l7
or %l7, %o0, %o0
add   %l4, 1, %l4

P973: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P974: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P975: !BST [3] (maybe <- 0x400000ee) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P976: !DWLD [7] (Int)
ldx [%i1 + 80], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)

P977: !BLD [6] (FP)
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

P978: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P979: !BST [15] (maybe <- 0x400000f2) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P980: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P981: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P982: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P983: !BLD [2] (FP)
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

P984: !BST [10] (maybe <- 0x400000f3) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P985: !BLD [7] (FP)
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

P986: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P987: !ST [13] (maybe <- 0x80002c) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P988: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P989: !DWLD [14] (Int)
ldx [%i3 + 128], %o2
! move %o2(upper) -> %o2(upper)

P990: !BLD [2] (FP)
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

P991: !BST [3] (maybe <- 0x400000f4) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P992: !BST [2] (maybe <- 0x400000f8) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P993: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P994: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P995: !BST [1] (maybe <- 0x400000fc) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P996: !ST [11] (maybe <- 0x80002d) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P997: !BLD [6] (FP)
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

P998: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f9
fmovd %f36, %f10

P999: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P1000: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P1001: !BST [2] (maybe <- 0x40000100) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1002: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P1003: !DWST [10] (maybe <- 0x80002e) (Int)
mov %l4, %l3 
sllx %l3, 32, %l3 
stx %l3, [%i2 + 32 ] 
add   %l4, 1, %l4

P1004: !BLD [2] (FP)
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

P1005: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f0
membar #Sync 
! 1 addresses covered
fmovd %f8, %f0

P1006: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f1

P1007: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P1008: !LD [12] (Int)
lduw [%i3 + 0], %l3
! move %l3(lower) -> %o2(lower)
srlx %o2, 32, %o2
sllx %o2, 32, %o2
or %l3, %o2, %o2

P1009: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P1010: !PREFETCH [3] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i0 + 32] %asi, 1

P1011: !BST [0] (maybe <- 0x40000104) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1012: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f3
fmovd %f36, %f4

P1013: !BST [14] (maybe <- 0x40000108) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P1014: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P1015: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P1016: !BLD [2] (FP)
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

P1017: !BST [6] (maybe <- 0x40000109) (FP)
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

P1019: !LD [0] (Int)
lduw [%i0 + 0], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P1020: !LD [1] (Int)
lduw [%i0 + 4], %l6
! move %l6(lower) -> %o3(lower)
or %l6, %o3, %o3

P1021: !LD [2] (Int) (CBR)
lduw [%i0 + 12], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1021
nop
RET1021:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P1022: !LD [3] (Int)
lduw [%i0 + 32], %l7
! move %l7(lower) -> %o4(lower)
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P1023: !LD [4] (Int)
lduw [%i0 + 64], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1024: !LD [5] (Int)
lduw [%i1 + 76], %l7
! move %l7(lower) -> %o0(lower)
or %l7, %o0, %o0

P1025: !LD [6] (Int)
lduw [%i1 + 80], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P1026: !LD [7] (Int)
lduw [%i1 + 84], %l7
! move %l7(lower) -> %o1(lower)
or %l7, %o1, %o1

P1027: !LD [8] (Int) (LE)
wr %g0, 0x88, %asi
lduwa [%i1 + 256] %asi, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P1028: !LD [9] (Int)
lduw [%i1 + 512], %l7
! move %l7(lower) -> %o2(lower)
or %l7, %o2, %o2

P1029: !LD [10] (Int)
lduw [%i2 + 32], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P1030: !LD [11] (Int)
lduw [%i2 + 64], %l7
! move %l7(lower) -> %o3(lower)
or %l7, %o3, %o3

P1031: !LD [12] (Int)
lduw [%i3 + 0], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P1032: !LD [13] (Int) (LE)
wr %g0, 0x88, %asi
lduwa [%i3 + 64] %asi, %l7
! move %l7(lower) -> %o4(lower)
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P1033: !LD [14] (FP)
ld [%i3 + 128], %f11
! 1 addresses covered

P1034: !LD [15] (Int)
lduw [%i3 + 192], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

END_NODES1: ! Test istream for CPU 1 ends
sethi %hi(0xdead0e0f), %l6
or    %l6, %lo(0xdead0e0f), %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0
stw %l6, [%i5] 
ld [%i5], %f12
!---- flushing int results buffer----
mov %o0, %l5
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

! Initialize LFSR to 0x4625^4
sethi %hi(0x4625), %l0
or    %l0, %lo(0x4625), %l0
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

P1035: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f0
membar #Sync 
! 3 addresses covered
fmovs %f3, %f0
fmovs %f4, %f1
fmovs %f5, %f2

P1036: !BLD [1] (FP)
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

P1037: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P1038: !BLD [5] (FP)
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

P1039: !BLD [1] (FP) (CBR)
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
be,pn  %xcc, TARGET1039
nop
RET1039:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P1040: !BLD [6] (FP)
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

P1041: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P1042: !LD [9] (Int)
lduw [%i1 + 512], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1043: !BST [11] (maybe <- 0x40800001) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P1044: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P1045: !BST [5] (maybe <- 0x40800002) (FP)
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

P1046: !CASX [10] (maybe <- 0x1000001) (Int)
add %i2, 32, %l7
ldx [%l7], %l3
! move %l3(upper) -> %o0(lower)
srlx %l3, 32, %l6
or %l6, %o0, %o0
! move %l3(lower) -> %o1(upper)
sllx %l3, 32, %o1
mov  %l3, %l6
sllx %l4, 32, %l3
casx [%l7], %l6, %l3
! move %l3(upper) -> %o1(lower)
srlx %l3, 32, %l7
or %l7, %o1, %o1
! move %l3(lower) -> %o2(upper)
sllx %l3, 32, %o2
add  %l4, 1, %l4

P1047: !BLD [2] (FP)
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

P1048: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P1049: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P1050: !BST [4] (maybe <- 0x40800005) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P1051: !CASX [6] (maybe <- 0x1000002) (Int) (CBR)
add %i1, 80, %l6
ldx [%l6], %o5
! move %o5(upper) -> %o2(lower)
srlx %o5, 32, %l3
or %l3, %o2, %o2
! move %o5(lower) -> %o3(upper)
sllx %o5, 32, %o3
mov %o5, %l3
sllx %l4, 32, %o5
add  %l4, 1, %l4
or   %l4, %o5, %o5
casx [%l6], %l3, %o5
! move %o5(upper) -> %o3(lower)
srlx %o5, 32, %l6
or %l6, %o3, %o3
! move %o5(lower) -> %o4(upper)
sllx %o5, 32, %o4
add  %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1051
nop
RET1051:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P1052: !DWST [6] (maybe <- 0x1000004) (Int)
sllx %l4, 32, %l6 
add   %l4, 1, %l4
or %l6, %l4, %l6
stx %l6, [%i1 + 80]
add   %l4, 1, %l4

P1053: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P1054: !BST [1] (maybe <- 0x40800006) (FP) (Branch target of P1461)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 
ba P1055
nop

TARGET1461:
ba RET1461
nop


P1055: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f36, %f8

P1056: !BST [0] (maybe <- 0x4080000a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1057: !BLD [7] (FP)
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

P1058: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P1059: !DWLD [10] (Int) (LE) (Branch target of P1070)
wr %g0, 0x88, %asi
ldxa [%i2 + 32] %asi, %o5
! move %o5(lower) -> %o4(lower)
srl %o5, 0, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5
ba P1060
nop

TARGET1070:
ba RET1070
nop


P1060: !DWST [3] (maybe <- 0x1000006) (Int)
mov %l4, %l3 
sllx %l3, 32, %l3 
stx %l3, [%i0 + 32 ] 
add   %l4, 1, %l4

P1061: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f13

P1062: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P1063: !LD [0] (Int)
lduw [%i0 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1064: !ST [4] (maybe <- 0x1000007) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P1065: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P1066: !BLD [1] (FP)
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

P1067: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P1068: !BLD [0] (FP)
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

P1069: !PREFETCH [0] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i0 + 0] %asi, 1

P1070: !PREFETCH [6] (Int) (CBR)
prefetch [%i1 + 80], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1070
nop
RET1070:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P1071: !MEMBAR (Int)
membar #StoreLoad

P1072: !REPLACEMENT [2] (Int)
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

P1073: !BLD [0] (FP)
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

P1074: !REPLACEMENT [1] (Int)
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

P1075: !REPLACEMENT [0] (Int) (CBR)
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

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1075
nop
RET1075:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P1076: !BST [1] (maybe <- 0x4080000e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1077: !DWST [15] (maybe <- 0x1000008) (Int)
mov %l4, %l7 
sllx %l7, 32, %l7 
stx %l7, [%i3 + 192 ] 
add   %l4, 1, %l4

P1078: !BST [0] (maybe <- 0x40800012) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1079: !CASX [2] (maybe <- 0x1000009) (Int)
add %i0, 8, %l6
ldx [%l6], %o5
! move %o5(upper) -> %o0(lower)
srlx %o5, 32, %l3
or %l3, %o0, %o0
! move %o5(lower) -> %o1(upper)
sllx %o5, 32, %o1
mov  %o5, %l3
mov %l4, %o5
casx [%l6], %l3, %o5
! move %o5(upper) -> %o1(lower)
srlx %o5, 32, %l6
or %l6, %o1, %o1
! move %o5(lower) -> %o2(upper)
sllx %o5, 32, %o2
add  %l4, 1, %l4

P1080: !PREFETCH [12] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i3 + 0] %asi, 1

P1081: !BLD [5] (FP) (Branch target of P1383)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f11
fmovd %f36, %f12
ba P1082
nop

TARGET1383:
ba RET1383
nop


P1082: !BST [4] (maybe <- 0x40800016) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P1083: !BLD [5] (FP)
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

P1084: !BLD [0] (FP)
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

P1085: !BST [9] (maybe <- 0x40800017) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P1086: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f5
fmovd %f36, %f6

P1087: !ST [10] (maybe <- 0x100000a) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P1088: !BLD [7] (FP)
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

P1089: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P1090: !DWLD [9] (Int)
ldx [%i1 + 512], %l7
! move %l7(upper) -> %o2(lower)
srlx %l7, 32, %l6
or %l6, %o2, %o2

P1091: !CASX [11] (maybe <- 0x100000b) (Int)
add %i2, 64, %l3
ldx [%l3], %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
mov  %o3, %o5
sllx %l4, 32, %o4
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

P1092: !DWST [12] (maybe <- 0x100000c) (Int)
mov %l4, %o5 
sllx %o5, 32, %o5 
stx %o5, [%i3 + 0 ] 
add   %l4, 1, %l4

P1093: !BST [2] (maybe <- 0x40800018) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1094: !BLD [0] (FP)
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

P1095: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f0
membar #Sync 
! 3 addresses covered
fmovs %f3, %f0
fmovs %f4, %f1
fmovs %f5, %f2

P1096: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P1097: !REPLACEMENT [7] (Int)
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

P1098: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P1099: !BST [14] (maybe <- 0x4080001c) (FP) (Branch target of P1410)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 
ba P1100
nop

TARGET1410:
ba RET1410
nop


P1100: !BLD [6] (FP)
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

P1101: !BST [6] (maybe <- 0x4080001d) (FP)
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

P1102: !BST [1] (maybe <- 0x40800020) (FP) (Branch target of P1271)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 
ba P1103
nop

TARGET1271:
ba RET1271
nop


P1103: !BLD [4] (FP) (Branch target of P1262)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7
ba P1104
nop

TARGET1262:
ba RET1262
nop


P1104: !BST [0] (maybe <- 0x40800024) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1105: !BST [13] (maybe <- 0x40800028) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P1106: !SWAP [3] (maybe <- 0x100000d) (Int)
mov %l4, %o0
swap  [%i0 + 32], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
add   %l4, 1, %l4

P1107: !ST [6] (maybe <- 0x100000e) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P1108: !BLD [1] (FP)
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

P1109: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P1110: !BST [4] (maybe <- 0x40800029) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P1111: !NOP (Int) (Branch target of P1254)
nop
ba P1112
nop

TARGET1254:
ba RET1254
nop


P1112: !BST [5] (maybe <- 0x4080002a) (FP)
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

P1113: !CASX [15] (maybe <- 0x100000f) (Int)
add %i3, 192, %l3
ldx [%l3], %l7
! move %l7(upper) -> %o0(lower)
srlx %l7, 32, %o5
or %o5, %o0, %o0
! move %l7(lower) -> %o1(upper)
sllx %l7, 32, %o1
mov  %l7, %o5
sllx %l4, 32, %l7
casx [%l3], %o5, %l7
! move %l7(upper) -> %o1(lower)
srlx %l7, 32, %l3
or %l3, %o1, %o1
! move %l7(lower) -> %o2(upper)
sllx %l7, 32, %o2
add  %l4, 1, %l4

P1114: !BLD [5] (FP)
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

P1115: !LD [2] (Int)
lduw [%i0 + 12], %l3
! move %l3(lower) -> %o2(lower)
or %l3, %o2, %o2

P1116: !BST [7] (maybe <- 0x4080002d) (FP)
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

P1117: !BST [7] (maybe <- 0x40800030) (FP)
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

P1118: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f0
membar #Sync 
! 1 addresses covered
fmovd %f8, %f0

P1119: !BST [9] (maybe <- 0x40800033) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P1120: !BST [5] (maybe <- 0x40800034) (FP)
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

P1121: !BST [6] (maybe <- 0x40800037) (FP)
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

P1122: !BST [4] (maybe <- 0x4080003a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P1123: !SWAP [8] (maybe <- 0x1000010) (Int)
mov %l4, %o3
swap  [%i1 + 256], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P1124: !BST [7] (maybe <- 0x4080003b) (FP)
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

P1125: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P1126: !BST [3] (maybe <- 0x4080003e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1127: !BST [8] (maybe <- 0x40800042) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P1128: !BST [15] (maybe <- 0x40800043) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P1129: !BLD [0] (FP)
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

P1130: !LD [14] (Int)
lduw [%i3 + 128], %o5
! move %o5(lower) -> %o3(lower)
or %o5, %o3, %o3

P1131: !LD [14] (Int)
lduw [%i3 + 128], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P1132: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P1133: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P1134: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f36, %f8

P1135: !BLD [1] (FP)
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

P1136: !BST [0] (maybe <- 0x40800044) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1137: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P1138: !REPLACEMENT [9] (Int)
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

P1139: !REPLACEMENT [2] (Int)
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

P1140: !BST [3] (maybe <- 0x40800048) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1141: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P1142: !BST [3] (maybe <- 0x4080004c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1143: !MEMBAR (Int) (CBR)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1143
nop
RET1143:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P1144: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P1145: !DWLD [10] (FP)
ldd [%i2 + 32], %f18
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

P1146: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f0
membar #Sync 
! 1 addresses covered

P1147: !BST [3] (maybe <- 0x40800050) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1148: !BST [11] (maybe <- 0x40800054) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P1149: !LD [4] (Int)
lduw [%i0 + 64], %l6
! move %l6(lower) -> %o4(lower)
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P1150: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P1151: !BST [7] (maybe <- 0x40800055) (FP)
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

P1152: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P1153: !DWST [8] (maybe <- 0x1000011) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 256 ] 
add   %l4, 1, %l4

P1154: !REPLACEMENT [10] (Int)
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

P1155: !BST [5] (maybe <- 0x40800058) (FP)
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

P1156: !BLD [3] (FP)
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

P1157: !BST [15] (maybe <- 0x4080005b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P1158: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P1159: !BST [0] (maybe <- 0x4080005c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1160: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P1161: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P1162: !ST [7] (maybe <- 0x1000012) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P1163: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P1164: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P1165: !BST [9] (maybe <- 0x40800060) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P1166: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P1167: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P1168: !DWLD [14] (Int)
ldx [%i3 + 128], %o0
! move %o0(upper) -> %o0(upper)

P1169: !REPLACEMENT [14] (Int)
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

P1170: !BST [13] (maybe <- 0x40800061) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P1171: !BLD [1] (FP) (CBR)
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
be,pt  %xcc, TARGET1171
nop
RET1171:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P1172: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P1173: !LD [7] (Int)
lduw [%i1 + 84], %l3
! move %l3(lower) -> %o0(lower)
srlx %o0, 32, %o0
sllx %o0, 32, %o0
or %l3, %o0, %o0

P1174: !DWST [5] (maybe <- 0x1000013) (Int)
mov %l4, %l6 
stx %l6, [%i1 + 72]
add   %l4, 1, %l4

P1175: !PREFETCH [6] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i1 + 80] %asi, 1

P1176: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P1177: !CAS [12] (maybe <- 0x1000014) (Int)
add %i3, 0, %l6
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

P1178: !REPLACEMENT [11] (Int)
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

P1179: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P1180: !CASX [9] (maybe <- 0x1000015) (Int)
add %i1, 512, %l3
ldx [%l3], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov  %o2, %o5
sllx %l4, 32, %o3
casx [%l3], %o5, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4

P1181: !MEMBAR (Int)
membar #StoreLoad

P1182: !BST [4] (maybe <- 0x40800062) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P1183: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P1184: !BLD [1] (FP)
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

P1185: !BST [12] (maybe <- 0x40800063) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P1186: !BST [12] (maybe <- 0x40800064) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P1187: !BLD [1] (FP)
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

P1188: !BST [15] (maybe <- 0x40800065) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P1189: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P1190: !MEMBAR (Int)
membar #StoreLoad

P1191: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P1192: !BST [6] (maybe <- 0x40800066) (FP)
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

P1193: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P1194: !BST [15] (maybe <- 0x40800069) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P1195: !BST [8] (maybe <- 0x4080006a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P1196: !BST [0] (maybe <- 0x4080006b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1197: !BST [9] (maybe <- 0x4080006f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P1198: !REPLACEMENT [14] (Int)
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

P1199: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P1200: !BST [2] (maybe <- 0x40800070) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1201: !CASX [15] (maybe <- 0x1000016) (Int)
add %i3, 192, %l6
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

P1202: !BST [12] (maybe <- 0x40800074) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P1203: !PREFETCH [8] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i1 + 256] %asi, 1

P1204: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f5
fmovd %f36, %f6

P1205: !BST [15] (maybe <- 0x40800075) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P1206: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P1207: !BST [0] (maybe <- 0x40800076) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1208: !BST [12] (maybe <- 0x4080007a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P1209: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P1210: !BLD [3] (FP)
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

P1211: !BLD [0] (FP)
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

P1212: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P1213: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P1214: !BST [8] (maybe <- 0x4080007b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P1215: !BST [7] (maybe <- 0x4080007c) (FP) (Branch target of P1393)
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
ba P1216
nop

TARGET1393:
ba RET1393
nop


P1216: !BST [12] (maybe <- 0x4080007f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P1217: !BST [9] (maybe <- 0x40800080) (FP) (Branch target of P1269)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 
ba P1218
nop

TARGET1269:
ba RET1269
nop


P1218: !BLD [7] (FP)
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

P1219: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P1220: !LD [7] (Int)
lduw [%i1 + 84], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P1221: !DWLD [2] (Int)
ldx [%i0 + 8], %o5
! move %o5(lower) -> %o1(lower)
srl %o5, 0, %l7
or %l7, %o1, %o1

P1222: !BST [9] (maybe <- 0x40800081) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P1223: !BST [4] (maybe <- 0x40800082) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P1224: !BLD [7] (FP)
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

P1225: !ST [15] (maybe <- 0x1000017) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P1226: !BST [15] (maybe <- 0x40800083) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P1227: !BST [9] (maybe <- 0x40800084) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P1228: !SWAP [15] (maybe <- 0x1000018) (Int) (Branch target of P1143)
mov %l4, %o2
swap  [%i3 + 192], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4
ba P1229
nop

TARGET1143:
ba RET1143
nop


P1229: !CAS [8] (maybe <- 0x1000019) (Int)
add %i1, 256, %o5
lduw [%o5], %l6
mov %l6, %l7
! move %l7(lower) -> %o2(lower)
or %l7, %o2, %o2
mov %l4, %o3
cas [%o5], %l7, %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P1230: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P1231: !BST [3] (maybe <- 0x40800085) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
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
be,pt  %xcc, TARGET1231
nop
RET1231:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P1232: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P1233: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P1234: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P1235: !ST [12] (maybe <- 0x100001a) (Int) (CBR) (Branch target of P1320)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1235
nop
RET1235:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0

ba P1236
nop

TARGET1320:
ba RET1320
nop


P1236: !REPLACEMENT [9] (Int)
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

P1237: !LD [1] (Int)
lduw [%i0 + 4], %l7
! move %l7(lower) -> %o3(lower)
or %l7, %o3, %o3

P1238: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P1239: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P1240: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P1241: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P1242: !BST [8] (maybe <- 0x40800089) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P1243: !NOP (Int)
nop

P1244: !BLD [3] (FP)
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

P1245: !BST [5] (maybe <- 0x4080008a) (FP) (CBR)
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
be,pt  %xcc, TARGET1245
nop
RET1245:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P1246: !BST [8] (maybe <- 0x4080008d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P1247: !BLD [15] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1247
nop
RET1247:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P1248: !REPLACEMENT [6] (Int)
sethi %hi(0x50), %l7
or %l7, %lo(0x50),  %l7
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

P1249: !BST [0] (maybe <- 0x4080008e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1250: !BLD [3] (FP)
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

P1251: !CAS [3] (maybe <- 0x100001b) (Int)
add %i0, 32, %l6
lduw [%l6], %o4
mov %o4, %l3
! move %l3(lower) -> %o4(upper)
sllx %l3, 32, %o4
mov %l4, %o5
cas [%l6], %l3, %o5
! move %o5(lower) -> %o4(lower)
srl %o5, 0, %l6
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5
add   %l4, 1, %l4

P1252: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P1253: !MEMBAR (Int)
membar #StoreLoad

P1254: !REPLACEMENT [8] (Int) (CBR)
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

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1254
nop
RET1254:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P1255: !DWST [6] (maybe <- 0x100001c) (Int)
sllx %l4, 32, %l3 
add   %l4, 1, %l4
or %l3, %l4, %l3
stx %l3, [%i1 + 80]
add   %l4, 1, %l4

P1256: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P1257: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P1258: !LD [7] (Int)
lduw [%i1 + 84], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1259: !BST [3] (maybe <- 0x40800092) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1260: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P1261: !BLD [1] (FP)
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

P1262: !BLD [4] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1262
nop
RET1262:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P1263: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P1264: !PREFETCH [6] (Int) (Branch target of P1291)
prefetch [%i1 + 80], 1
ba P1265
nop

TARGET1291:
ba RET1291
nop


P1265: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P1266: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P1267: !BLD [3] (FP)
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

P1268: !BST [6] (maybe <- 0x40800096) (FP)
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

P1269: !BLD [14] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1269
nop
RET1269:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P1270: !REPLACEMENT [8] (Int)
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

P1271: !PREFETCH [9] (Int) (CBR) (Branch target of P1513)
prefetch [%i1 + 512], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1271
nop
RET1271:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0

ba P1272
nop

TARGET1513:
ba RET1513
nop


P1272: !BST [7] (maybe <- 0x40800099) (FP)
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

P1273: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f3

P1274: !BST [0] (maybe <- 0x4080009c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1275: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P1276: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P1277: !BST [15] (maybe <- 0x408000a0) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P1278: !BST [10] (maybe <- 0x408000a1) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P1279: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P1280: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P1281: !BST [15] (maybe <- 0x408000a2) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P1282: !LD [9] (Int)
lduw [%i1 + 512], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

P1283: !REPLACEMENT [0] (Int)
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

P1284: !BLD [1] (FP)
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

P1285: !BLD [2] (FP)
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

P1286: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P1287: !MEMBAR (Int)
membar #StoreLoad

P1288: !BLD [7] (FP)
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

P1289: !BST [2] (maybe <- 0x408000a3) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1290: !BST [9] (maybe <- 0x408000a7) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P1291: !BLD [12] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1291
nop
RET1291:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P1292: !REPLACEMENT [7] (Int)
sethi %hi(0x54), %l3
or %l3, %lo(0x54),  %l3
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

P1293: !CASX [0] (maybe <- 0x100001e) (Int)
add %i0, 0, %l3
ldx [%l3], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
mov %o1, %o5
sllx %l4, 32, %o2
add  %l4, 1, %l4
or   %l4, %o2, %o2
casx [%l3], %o5, %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
add  %l4, 1, %l4

P1294: !DWLD [10] (Int)
ldx [%i2 + 32], %o3
! move %o3(upper) -> %o3(upper)

P1295: !BLD [2] (FP)
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

P1296: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P1297: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P1298: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P1299: !BST [14] (maybe <- 0x408000a8) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P1300: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P1301: !ST [5] (maybe <- 0x1000020) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P1302: !BST [2] (maybe <- 0x408000a9) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1303: !BLD [5] (FP)
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

P1304: !BLD [0] (FP)
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

P1305: !BST [12] (maybe <- 0x408000ad) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P1306: !CAS [10] (maybe <- 0x1000021) (Int)
add %i2, 32, %l7
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

P1307: !BST [5] (maybe <- 0x408000ae) (FP)
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

P1308: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P1309: !BLD [7] (FP) (CBR)
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
be,pn  %xcc, TARGET1309
nop
RET1309:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P1310: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P1311: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P1312: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P1313: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P1314: !BST [0] (maybe <- 0x408000b1) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1315: !BST [4] (maybe <- 0x408000b5) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P1316: !BST [1] (maybe <- 0x408000b6) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1317: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P1318: !DWLD [3] (FP)
ldd [%i0 + 32], %f4
! 1 addresses covered

P1319: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P1320: !PREFETCH [6] (Int) (CBR)
prefetch [%i1 + 80], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1320
nop
RET1320:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P1321: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f5

P1322: !BST [6] (maybe <- 0x408000ba) (FP)
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

P1323: !BST [10] (maybe <- 0x408000bd) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P1324: !SWAP [2] (maybe <- 0x1000022) (Int)
mov %l4, %o5
swap  [%i0 + 12], %o5
! move %o5(lower) -> %o4(lower)
srl %o5, 0, %l6
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5
add   %l4, 1, %l4

P1325: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P1326: !ST [10] (maybe <- 0x1000023) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P1327: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P1328: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P1329: !ST [15] (maybe <- 0x1000024) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P1330: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P1331: !BST [15] (maybe <- 0x408000be) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P1332: !BST [3] (maybe <- 0x408000bf) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1333: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P1334: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P1335: !BST [1] (maybe <- 0x408000c3) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1336: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P1337: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P1338: !BST [11] (maybe <- 0x408000c7) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P1339: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P1340: !CAS [15] (maybe <- 0x1000025) (Int)
add %i3, 192, %o5
lduw [%o5], %o0
mov %o0, %l7
! move %l7(lower) -> %o0(upper)
sllx %l7, 32, %o0
mov %l4, %l6
cas [%o5], %l7, %l6
! move %l6(lower) -> %o0(lower)
srl %l6, 0, %o5
or %o5, %o0, %o0
add   %l4, 1, %l4

P1341: !CASX [4] (maybe <- 0x1000026) (Int)
add %i0, 64, %o5
ldx [%o5], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
mov  %o1, %l7
sllx %l4, 32, %o2
casx [%o5], %l7, %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
add  %l4, 1, %l4

P1342: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P1343: !BST [6] (maybe <- 0x408000c8) (FP)
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

P1344: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P1345: !BST [2] (maybe <- 0x408000cb) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1346: !BST [7] (maybe <- 0x408000cf) (FP)
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

P1347: !LD [3] (FP)
ld [%i0 + 32], %f10
! 1 addresses covered

P1348: !BLD [6] (FP) (Branch target of P1448)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f11
fmovd %f36, %f12
ba P1349
nop

TARGET1448:
ba RET1448
nop


P1349: !BST [5] (maybe <- 0x408000d2) (FP)
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

P1350: !BST [15] (maybe <- 0x408000d5) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P1351: !BLD [1] (FP)
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

P1352: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P1353: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f3
fmovd %f36, %f4

P1354: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P1355: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P1356: !CASX [15] (maybe <- 0x1000027) (Int)
add %i3, 192, %l7
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

P1357: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P1358: !BST [9] (maybe <- 0x408000d6) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P1359: !BST [9] (maybe <- 0x408000d7) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P1360: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P1361: !NOP (Int)
nop

P1362: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P1363: !BLD [2] (FP)
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

P1364: !BST [13] (maybe <- 0x408000d8) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P1365: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P1366: !DWLD [5] (Int)
ldx [%i1 + 72], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1367: !DWLD [5] (Int)
ldx [%i1 + 72], %l6
! move %l6(lower) -> %o0(lower)
srl %l6, 0, %l3
or %l3, %o0, %o0

P1368: !BST [4] (maybe <- 0x408000d9) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P1369: !BLD [3] (FP)
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

P1370: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P1371: !NOP (Int)
nop

P1372: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P1373: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P1374: !BST [5] (maybe <- 0x408000da) (FP)
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

P1375: !BLD [6] (FP)
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

P1376: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P1377: !BST [13] (maybe <- 0x408000dd) (FP) (Branch target of P1039)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 
ba P1378
nop

TARGET1039:
ba RET1039
nop


P1378: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P1379: !MEMBAR (Int)
membar #StoreLoad

P1380: !BST [0] (maybe <- 0x408000de) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
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
be,pt  %xcc, TARGET1380
nop
RET1380:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P1381: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P1382: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P1383: !DWST [14] (maybe <- 0x1000028) (Int) (CBR)
mov %l4, %o5 
sllx %o5, 32, %o5 
stx %o5, [%i3 + 128 ] 
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1383
nop
RET1383:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P1384: !NOP (Int)
nop

P1385: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P1386: !ST [5] (maybe <- 0x408000e2) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i1 + 76 ]

P1387: !BST [15] (maybe <- 0x408000e3) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P1388: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P1389: !BST [15] (maybe <- 0x408000e4) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P1390: !BST [6] (maybe <- 0x408000e5) (FP)
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

P1391: !BLD [5] (FP)
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

P1392: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P1393: !DWST [15] (maybe <- 0x1000029) (Int) (CBR)
mov %l4, %o5 
sllx %o5, 32, %o5 
stx %o5, [%i3 + 192 ] 
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1393
nop
RET1393:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P1394: !BST [10] (maybe <- 0x408000e8) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P1395: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P1396: !BST [3] (maybe <- 0x408000e9) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1397: !REPLACEMENT [9] (Int) (Branch target of P1494)
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
ba P1398
nop

TARGET1494:
ba RET1494
nop


P1398: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P1399: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P1400: !DWLD [2] (FP)
ldd [%i0 + 8], %f18
! 1 addresses covered
fmovs %f19, %f9

P1401: !LD [8] (Int) (LE)
wr %g0, 0x88, %asi
lduwa [%i1 + 256] %asi, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P1402: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P1403: !BST [5] (maybe <- 0x408000ed) (FP)
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

P1404: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P1405: !BST [7] (maybe <- 0x408000f0) (FP)
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

P1406: !LD [1] (Int)
lduw [%i0 + 4], %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1

P1407: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P1408: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P1409: !BLD [7] (FP)
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

P1410: !BLD [2] (FP) (CBR)
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
be,pn  %xcc, TARGET1410
nop
RET1410:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P1411: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P1412: !REPLACEMENT [7] (Int)
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

P1413: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f36, %f2

P1414: !ST [3] (maybe <- 0x100002a) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P1415: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P1416: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f4

P1417: !BST [3] (maybe <- 0x408000f3) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1418: !BST [6] (maybe <- 0x408000f7) (FP)
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

P1419: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P1420: !BST [0] (maybe <- 0x408000fa) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1421: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P1422: !PREFETCH [7] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i1 + 84] %asi, 1

P1423: !BST [13] (maybe <- 0x408000fe) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P1424: !DWLD [12] (Int)
ldx [%i3 + 0], %o2
! move %o2(upper) -> %o2(upper)

P1425: !PREFETCH [1] (Int) (Branch target of P1465)
prefetch [%i0 + 4], 1
ba P1426
nop

TARGET1465:
ba RET1465
nop


P1426: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P1427: !DWST [12] (maybe <- 0x100002b) (Int)
mov %l4, %o5 
sllx %o5, 32, %o5 
stx %o5, [%i3 + 0 ] 
add   %l4, 1, %l4

P1428: !BST [10] (maybe <- 0x408000ff) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P1429: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f5
fmovd %f36, %f6

P1430: !BST [12] (maybe <- 0x40800100) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P1431: !BST [15] (maybe <- 0x40800101) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P1432: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P1433: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P1434: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P1435: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P1436: !BLD [1] (FP)
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

P1437: !BST [5] (maybe <- 0x40800102) (FP)
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

P1438: !BST [3] (maybe <- 0x40800105) (FP) (Branch target of P1171)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 
ba P1439
nop

TARGET1171:
ba RET1171
nop


P1439: !BST [0] (maybe <- 0x40800109) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1440: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P1441: !DWST [4] (maybe <- 0x4080010d) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
std %f20, [%i0 + 64]

P1442: !DWLD [12] (Int) (LE)
wr %g0, 0x88, %asi
ldxa [%i3 + 0] %asi, %l3
! move %l3(lower) -> %o2(lower)
srlx %o2, 32, %o2
sllx %o2, 32, %o2
srl %l3, 0, %o5
or %o5, %o2, %o2

P1443: !BST [2] (maybe <- 0x4080010e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1444: !REPLACEMENT [4] (Int)
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

P1445: !BLD [6] (FP)
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

P1446: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P1447: !REPLACEMENT [1] (Int)
sethi %hi(0x4), %o5
or %o5, %lo(0x4),  %o5
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

P1448: !PREFETCH [13] (Int) (CBR)
prefetch [%i3 + 64], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1448
nop
RET1448:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P1449: !DWLD [6] (FP)
ldd [%i1 + 80], %f18
! 2 addresses covered
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

P1450: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P1451: !BLD [5] (FP)
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

P1452: !DWST [3] (maybe <- 0x100002c) (Int)
mov %l4, %o5 
sllx %o5, 32, %o5 
stx %o5, [%i0 + 32 ] 
add   %l4, 1, %l4

P1453: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P1454: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P1455: !BST [3] (maybe <- 0x40800112) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1456: !BST [7] (maybe <- 0x40800116) (FP)
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

P1457: !DWST [7] (maybe <- 0x100002d) (Int)
sllx %l4, 32, %l3 
add   %l4, 1, %l4
or %l3, %l4, %l3
stx %l3, [%i1 + 80]
add   %l4, 1, %l4

P1458: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P1459: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P1460: !BST [8] (maybe <- 0x40800119) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P1461: !REPLACEMENT [6] (Int) (CBR)
sethi %hi(0x50), %l7
or %l7, %lo(0x50),  %l7
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
be,pn  %xcc, TARGET1461
nop
RET1461:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P1462: !BST [6] (maybe <- 0x4080011a) (FP)
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

P1463: !PREFETCH [1] (Int) (Branch target of P1231)
prefetch [%i0 + 4], 1
ba P1464
nop

TARGET1231:
ba RET1231
nop


P1464: !BST [11] (maybe <- 0x4080011d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P1465: !BLD [13] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1465
nop
RET1465:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P1466: !BST [8] (maybe <- 0x4080011e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P1467: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P1468: !REPLACEMENT [13] (Int)
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

P1469: !BLD [6] (FP)
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

P1470: !REPLACEMENT [11] (Int)
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

P1471: !REPLACEMENT [12] (Int)
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

P1472: !BST [4] (maybe <- 0x4080011f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P1473: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P1474: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P1475: !BST [10] (maybe <- 0x40800120) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P1476: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P1477: !BST [2] (maybe <- 0x40800121) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1478: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f11
fmovd %f36, %f12

P1479: !BST [9] (maybe <- 0x40800125) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P1480: !BST [15] (maybe <- 0x40800126) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P1481: !CASX [1] (maybe <- 0x100002f) (Int)
add %i0, 0, %l6
ldx [%l6], %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
mov %o3, %l3
sllx %l4, 32, %o4
add  %l4, 1, %l4
or   %l4, %o4, %o4
casx [%l6], %l3, %o4
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5
add  %l4, 1, %l4

P1482: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P1483: !BLD [1] (FP)
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

P1484: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f2

P1485: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P1486: !BST [12] (maybe <- 0x40800127) (FP) (Branch target of P1075)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 
ba P1487
nop

TARGET1075:
ba RET1075
nop


P1487: !BST [0] (maybe <- 0x40800128) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1488: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P1489: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P1490: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P1491: !BLD [3] (FP)
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

P1492: !BST [6] (maybe <- 0x4080012c) (FP) (Branch target of P1309)
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
ba P1493
nop

TARGET1309:
ba RET1309
nop


P1493: !BLD [3] (FP)
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

P1494: !BST [14] (maybe <- 0x4080012f) (FP) (CBR)
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
be,pt  %xcc, TARGET1494
nop
RET1494:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P1495: !BST [5] (maybe <- 0x40800130) (FP)
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

P1496: !DWLD [4] (Int)
ldx [%i0 + 64], %o0
! move %o0(upper) -> %o0(upper)

P1497: !BST [1] (maybe <- 0x40800133) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1498: !BST [10] (maybe <- 0x40800137) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P1499: !BST [13] (maybe <- 0x40800138) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P1500: !BST [6] (maybe <- 0x40800139) (FP)
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

P1501: !BLD [2] (FP)
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

P1502: !BST [0] (maybe <- 0x4080013c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1503: !BLD [2] (FP)
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

P1504: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f3
fmovd %f36, %f4

P1505: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P1506: !PREFETCH [15] (Int) (Branch target of P1247)
prefetch [%i3 + 192], 1
ba P1507
nop

TARGET1247:
ba RET1247
nop


P1507: !BST [4] (maybe <- 0x40800140) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P1508: !LD [8] (Int)
lduw [%i1 + 256], %l6
! move %l6(lower) -> %o0(lower)
srlx %o0, 32, %o0
sllx %o0, 32, %o0
or %l6, %o0, %o0

P1509: !BST [15] (maybe <- 0x40800141) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P1510: !BST [4] (maybe <- 0x40800142) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P1511: !BST [1] (maybe <- 0x40800143) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1512: !BLD [1] (FP)
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

P1513: !BST [7] (maybe <- 0x40800147) (FP) (CBR)
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
be,pn  %xcc, TARGET1513
nop
RET1513:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P1514: !BLD [6] (FP)
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

P1515: !DWST [11] (maybe <- 0x1000031) (Int)
mov %l4, %o5 
sllx %o5, 32, %o5 
stx %o5, [%i2 + 64 ] 
add   %l4, 1, %l4

P1516: !ST [4] (maybe <- 0x1000032) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P1517: !BLD [0] (FP)
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

P1518: !BST [14] (maybe <- 0x4080014a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P1519: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f36, %f2

P1520: !NOP (Int)
nop

P1521: !BST [6] (maybe <- 0x4080014b) (FP)
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

P1522: !CASX [12] (maybe <- 0x1000033) (Int)
add %i3, 0, %l3
ldx [%l3], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
mov  %o1, %o5
sllx %l4, 32, %o2
casx [%l3], %o5, %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
add  %l4, 1, %l4

P1523: !BLD [2] (FP)
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

P1524: !BLD [0] (FP)
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

P1525: !PREFETCH [15] (Int) (Branch target of P1245)
prefetch [%i3 + 192], 1
ba P1526
nop

TARGET1245:
ba RET1245
nop


P1526: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P1527: !ST [9] (maybe <- 0x1000034) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P1528: !BLD [0] (FP) (Branch target of P1543)
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
ba P1529
nop

TARGET1543:
ba RET1543
nop


P1529: !BST [15] (maybe <- 0x4080014e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P1530: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P1531: !BST [6] (maybe <- 0x4080014f) (FP)
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

P1532: !BST [4] (maybe <- 0x40800152) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P1533: !BST [12] (maybe <- 0x40800153) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P1534: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f0
membar #Sync 
! 1 addresses covered

P1535: !MEMBAR (Int)
membar #StoreLoad

P1536: !LD [0] (Int) (Branch target of P1235)
lduw [%i0 + 0], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
ba P1537
nop

TARGET1235:
ba RET1235
nop


P1537: !LD [1] (Int)
lduw [%i0 + 4], %l6
! move %l6(lower) -> %o3(lower)
or %l6, %o3, %o3

P1538: !LD [2] (Int) (LE)
wr %g0, 0x88, %asi
lduwa [%i0 + 12] %asi, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P1539: !LD [3] (Int)
lduw [%i0 + 32], %l6
! move %l6(lower) -> %o4(lower)
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P1540: !LD [4] (Int)
lduw [%i0 + 64], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1541: !LD [5] (Int) (Branch target of P1051)
lduw [%i1 + 76], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0
ba P1542
nop

TARGET1051:
ba RET1051
nop


P1542: !LD [6] (Int) (Branch target of P1380)
lduw [%i1 + 80], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
ba P1543
nop

TARGET1380:
ba RET1380
nop


P1543: !LD [7] (Int) (CBR)
lduw [%i1 + 84], %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1543
nop
RET1543:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P1544: !LD [8] (Int)
lduw [%i1 + 256], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P1545: !LD [9] (Int)
lduw [%i1 + 512], %l7
! move %l7(lower) -> %o2(lower)
or %l7, %o2, %o2

P1546: !LD [10] (Int)
lduw [%i2 + 32], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P1547: !LD [11] (Int)
lduw [%i2 + 64], %l7
! move %l7(lower) -> %o3(lower)
or %l7, %o3, %o3

P1548: !LD [12] (Int)
lduw [%i3 + 0], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P1549: !LD [13] (Int)
lduw [%i3 + 64], %l7
! move %l7(lower) -> %o4(lower)
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P1550: !LD [14] (Int)
lduw [%i3 + 128], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1551: !LD [15] (Int)
lduw [%i3 + 192], %l7
! move %l7(lower) -> %o0(lower)
or %l7, %o0, %o0

END_NODES2: ! Test istream for CPU 2 ends
sethi %hi(0xdead0e0f), %o5
or    %o5, %lo(0xdead0e0f), %o5
! move %o5(lower) -> %o1(upper)
sllx %o5, 32, %o1
stw %o5, [%i5] 
ld [%i5], %f1
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
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

! Initialize LFSR to 0x7d4f^4
sethi %hi(0x7d4f), %l0
or    %l0, %lo(0x7d4f), %l0
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

P1552: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P1553: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P1554: !BLD [1] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f0
membar #Sync 
! 4 addresses covered
fmovs %f3, %f2
fmovs %f8, %f3

P1555: !BST [2] (maybe <- 0x41000001) (FP) (Branch target of P1856)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 
ba P1556
nop

TARGET1856:
ba RET1856
nop


P1556: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P1557: !DWLD [11] (Int)
ldx [%i2 + 64], %o0
! move %o0(upper) -> %o0(upper)

P1558: !BST [7] (maybe <- 0x41000005) (FP)
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

P1559: !LD [6] (Int)
lduw [%i1 + 80], %o5
! move %o5(lower) -> %o0(lower)
srlx %o0, 32, %o0
sllx %o0, 32, %o0
or %o5, %o0, %o0

P1560: !BST [2] (maybe <- 0x41000008) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1561: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P1562: !BST [4] (maybe <- 0x4100000c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P1563: !BLD [15] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1563
nop
RET1563:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P1564: !BLD [3] (FP) (Branch target of P1877)
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
ba P1565
nop

TARGET1877:
ba RET1877
nop


P1565: !BST [13] (maybe <- 0x4100000d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P1566: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P1567: !BST [5] (maybe <- 0x4100000e) (FP)
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

P1568: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P1569: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P1570: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P1571: !DWST [8] (maybe <- 0x1800001) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 256 ] 
add   %l4, 1, %l4

P1572: !BST [0] (maybe <- 0x41000011) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
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
be,pn  %xcc, TARGET1572
nop
RET1572:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P1573: !BLD [10] (FP) (Branch target of P1572)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f11
ba P1574
nop

TARGET1572:
ba RET1572
nop


P1574: !DWLD [11] (Int)
ldx [%i2 + 64], %o1
! move %o1(upper) -> %o1(upper)

P1575: !BST [14] (maybe <- 0x41000015) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P1576: !BST [14] (maybe <- 0x41000016) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P1577: !BLD [7] (FP)
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

P1578: !BLD [14] (FP) (CBR)
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

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1578
nop
RET1578:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P1579: !DWST [9] (maybe <- 0x1800002) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 512 ] 
add   %l4, 1, %l4

P1580: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P1581: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f0
membar #Sync 
! 1 addresses covered

P1582: !DWLD [7] (Int)
ldx [%i1 + 80], %l6
! move %l6(upper) -> %o1(lower)
srlx %o1, 32, %o1
sllx %o1, 32, %o1
srlx %l6, 32, %l3
or %l3, %o1, %o1
! move %l6(lower) -> %o2(upper)
sllx %l6, 32, %o2

P1583: !BLD [1] (FP)
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

P1584: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P1585: !REPLACEMENT [6] (Int)
sethi %hi(0x50), %l7
or %l7, %lo(0x50),  %l7
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

P1586: !LD [0] (Int)
lduw [%i0 + 0], %l7
! move %l7(lower) -> %o2(lower)
or %l7, %o2, %o2

P1587: !BLD [2] (FP) (Branch target of P1699)
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
ba P1588
nop

TARGET1699:
ba RET1699
nop


P1588: !BST [13] (maybe <- 0x41000017) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P1589: !DWST [3] (maybe <- 0x1800003) (Int)
mov %l4, %l7 
sllx %l7, 32, %l7 
stx %l7, [%i0 + 32 ] 
add   %l4, 1, %l4

P1590: !BST [1] (maybe <- 0x41000018) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1591: !BST [8] (maybe <- 0x4100001c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P1592: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P1593: !BST [8] (maybe <- 0x4100001d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P1594: !BST [8] (maybe <- 0x4100001e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P1595: !DWLD [2] (Int)
ldx [%i0 + 8], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P1596: !BLD [2] (FP) (Branch target of P1905)
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
ba P1597
nop

TARGET1905:
ba RET1905
nop


P1597: !LD [1] (Int)
lduw [%i0 + 4], %l3
! move %l3(lower) -> %o3(lower)
or %l3, %o3, %o3

P1598: !BLD [0] (FP)
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

P1599: !BST [9] (maybe <- 0x4100001f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P1600: !PREFETCH [11] (Int) (CBR)
prefetch [%i2 + 64], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1600
nop
RET1600:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P1601: !DWLD [4] (FP)
ldd [%i0 + 64], %f18
! 1 addresses covered
fmovs %f18, %f1

P1602: !BST [4] (maybe <- 0x41000020) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P1603: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P1604: !BST [4] (maybe <- 0x41000021) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P1605: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P1606: !BST [15] (maybe <- 0x41000022) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P1607: !BST [0] (maybe <- 0x41000023) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1608: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P1609: !BLD [3] (FP) (Branch target of P1801)
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
ba P1610
nop

TARGET1801:
ba RET1801
nop


P1610: !DWST [11] (maybe <- 0x1800004) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i2 + 64 ] 
add   %l4, 1, %l4

P1611: !PREFETCH [7] (Int) (CBR)
prefetch [%i1 + 84], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1611
nop
RET1611:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P1612: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P1613: !BST [14] (maybe <- 0x41000027) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P1614: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P1615: !MEMBAR (Int)
membar #StoreLoad

P1616: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P1617: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f7

P1618: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P1619: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P1620: !CASX [5] (maybe <- 0x1800005) (Int)
add %i1, 72, %l6
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
mov %l4, %o0
casx [%l6], %l3, %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
add  %l4, 1, %l4

P1621: !BLD [6] (FP)
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

P1622: !LD [3] (Int)
lduw [%i0 + 32], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P1623: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f11
fmovd %f36, %f12

P1624: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P1625: !BLD [0] (FP)
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

P1626: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P1627: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P1628: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P1629: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P1630: !BST [8] (maybe <- 0x41000028) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P1631: !ST [12] (maybe <- 0x1800006) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P1632: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P1633: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P1634: !BST [8] (maybe <- 0x41000029) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P1635: !DWLD [4] (Int)
ldx [%i0 + 64], %l3
! move %l3(upper) -> %o1(lower)
srlx %l3, 32, %o5
or %o5, %o1, %o1

P1636: !CAS [4] (maybe <- 0x1800007) (Int)
add %i0, 64, %l7
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

P1637: !BST [15] (maybe <- 0x4100002a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P1638: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P1639: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P1640: !BLD [6] (FP)
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

P1641: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P1642: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P1643: !ST [9] (maybe <- 0x1800008) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P1644: !ST [2] (maybe <- 0x1800009) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P1645: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f36, %f8

P1646: !BLD [1] (FP)
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

P1647: !BLD [5] (FP)
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

P1648: !BLD [3] (FP)
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

P1649: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P1650: !BST [12] (maybe <- 0x4100002b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P1651: !BST [7] (maybe <- 0x4100002c) (FP)
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

P1652: !BST [4] (maybe <- 0x4100002f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P1653: !BST [11] (maybe <- 0x41000030) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P1654: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P1655: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P1656: !BST [13] (maybe <- 0x41000031) (FP) (Branch target of P1878)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 
ba P1657
nop

TARGET1878:
ba RET1878
nop


P1657: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P1658: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f36, %f8

P1659: !LD [4] (FP)
ld [%i0 + 64], %f10
! 1 addresses covered

P1660: !BST [11] (maybe <- 0x41000032) (FP) (CBR)
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
be,pt  %xcc, TARGET1660
nop
RET1660:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P1661: !BST [4] (maybe <- 0x41000033) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P1662: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P1663: !BLD [0] (FP)
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

P1664: !BST [5] (maybe <- 0x41000034) (FP)
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

P1665: !REPLACEMENT [13] (Int)
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

P1666: !BST [1] (maybe <- 0x41000037) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1667: !BST [2] (maybe <- 0x4100003b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1668: !BST [4] (maybe <- 0x4100003f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P1669: !BST [11] (maybe <- 0x41000040) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P1670: !BST [2] (maybe <- 0x41000041) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1671: !BLD [11] (FP)
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

P1672: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P1673: !ST [14] (maybe <- 0x180000a) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P1674: !REPLACEMENT [10] (Int)
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

P1675: !BST [1] (maybe <- 0x41000045) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1676: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P1677: !CAS [14] (maybe <- 0x180000b) (Int)
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

P1678: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P1679: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f0
membar #Sync 
! 3 addresses covered
fmovs %f3, %f0
fmovs %f4, %f1
fmovs %f5, %f2

P1680: !BST [4] (maybe <- 0x41000049) (FP) (Branch target of P2044)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 
ba P1681
nop

TARGET2044:
ba RET2044
nop


P1681: !BST [13] (maybe <- 0x4100004a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P1682: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P1683: !BST [0] (maybe <- 0x4100004b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1684: !BST [7] (maybe <- 0x4100004f) (FP)
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

P1685: !BST [15] (maybe <- 0x41000052) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P1686: !BLD [2] (FP)
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

P1687: !CAS [15] (maybe <- 0x180000c) (Int)
add %i3, 192, %l7
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

P1688: !SWAP [5] (maybe <- 0x180000d) (Int)
mov %l4, %o0
swap  [%i1 + 76], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
add   %l4, 1, %l4

P1689: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P1690: !BST [14] (maybe <- 0x41000053) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P1691: !BLD [13] (FP) (Branch target of P1611)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8
ba P1692
nop

TARGET1611:
ba RET1611
nop


P1692: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P1693: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P1694: !REPLACEMENT [15] (Int) (Branch target of P2004)
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
ba P1695
nop

TARGET2004:
ba RET2004
nop


P1695: !CASX [2] (maybe <- 0x180000e) (Int)
add %i0, 8, %o5
ldx [%o5], %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l7
or %l7, %o0, %o0
! move %l6(lower) -> %o1(upper)
sllx %l6, 32, %o1
mov  %l6, %l7
mov %l4, %l6
casx [%o5], %l7, %l6
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %o5
or %o5, %o1, %o1
! move %l6(lower) -> %o2(upper)
sllx %l6, 32, %o2
add  %l4, 1, %l4

P1696: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P1697: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P1698: !BST [8] (maybe <- 0x41000054) (FP) (CBR)
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
be,pn  %xcc, TARGET1698
nop
RET1698:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P1699: !PREFETCH [7] (Int) (CBR)
prefetch [%i1 + 84], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1699
nop
RET1699:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P1700: !CAS [0] (maybe <- 0x180000f) (Int)
add %i0, 0, %l3
lduw [%l3], %l7
mov %l7, %o5
! move %o5(lower) -> %o2(lower)
or %o5, %o2, %o2
mov %l4, %o3
cas [%l3], %o5, %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P1701: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P1702: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P1703: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f10

P1704: !BST [5] (maybe <- 0x41000055) (FP) (CBR)
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
be,pn  %xcc, TARGET1704
nop
RET1704:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P1705: !BST [11] (maybe <- 0x41000058) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P1706: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P1707: !BLD [1] (FP)
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

P1708: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P1709: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f0
membar #Sync 
! 1 addresses covered

P1710: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P1711: !BST [6] (maybe <- 0x41000059) (FP)
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

P1712: !ST [4] (maybe <- 0x1800010) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P1713: !BST [0] (maybe <- 0x4100005c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1714: !BLD [1] (FP)
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

P1715: !BST [8] (maybe <- 0x41000060) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P1716: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P1717: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P1718: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f36, %f8

P1719: !BST [6] (maybe <- 0x41000061) (FP)
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

P1720: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P1721: !BST [14] (maybe <- 0x41000064) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P1722: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P1723: !DWLD [1] (Int)
ldx [%i0 + 0], %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %l3
or %l3, %o3, %o3
! move %l6(lower) -> %o4(upper)
sllx %l6, 32, %o4

P1724: !BST [4] (maybe <- 0x41000065) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P1725: !BST [2] (maybe <- 0x41000066) (FP) (Branch target of P1578)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 
ba P1726
nop

TARGET1578:
ba RET1578
nop


P1726: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P1727: !BST [15] (maybe <- 0x4100006a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P1728: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P1729: !BST [15] (maybe <- 0x4100006b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P1730: !BLD [1] (FP) (Branch target of P1975)
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
ba P1731
nop

TARGET1975:
ba RET1975
nop


P1731: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P1732: !BLD [8] (FP)
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

P1733: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P1734: !BST [11] (maybe <- 0x4100006c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P1735: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f0
membar #Sync 
! 3 addresses covered
fmovs %f3, %f0
fmovs %f4, %f1
fmovs %f5, %f2

P1736: !BLD [1] (FP)
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

P1737: !BST [4] (maybe <- 0x4100006d) (FP) (Branch target of P1698)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 
ba P1738
nop

TARGET1698:
ba RET1698
nop


P1738: !CASX [2] (maybe <- 0x1800011) (Int)
add %i0, 8, %l6
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
mov %l4, %o5
casx [%l6], %l3, %o5
! move %o5(upper) -> %o0(lower)
srlx %o5, 32, %l6
or %l6, %o0, %o0
! move %o5(lower) -> %o1(upper)
sllx %o5, 32, %o1
add  %l4, 1, %l4

P1739: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P1740: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P1741: !BST [3] (maybe <- 0x4100006e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1742: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P1743: !DWST [13] (maybe <- 0x1800012) (Int) (CBR)
mov %l4, %o5 
sllx %o5, 32, %o5 
stx %o5, [%i3 + 64 ] 
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1743
nop
RET1743:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P1744: !ST [15] (maybe <- 0x1800013) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P1745: !BLD [2] (FP) (CBR)
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
be,pn  %xcc, TARGET1745
nop
RET1745:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P1746: !DWST [5] (maybe <- 0x1800014) (Int)
mov %l4, %o5 
stx %o5, [%i1 + 72]
add   %l4, 1, %l4

P1747: !SWAP [8] (maybe <- 0x1800015) (Int)
mov %l4, %l3
swap  [%i1 + 256], %l3
! move %l3(lower) -> %o1(lower)
srl %l3, 0, %l7
or %l7, %o1, %o1
add   %l4, 1, %l4

P1748: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P1749: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P1750: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P1751: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P1752: !BST [14] (maybe <- 0x41000072) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P1753: !BST [4] (maybe <- 0x41000073) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P1754: !BST [12] (maybe <- 0x41000074) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P1755: !BLD [1] (FP)
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

P1756: !PREFETCH [0] (Int) (Branch target of P2035)
prefetch [%i0 + 0], 1
ba P1757
nop

TARGET2035:
ba RET2035
nop


P1757: !PREFETCH [12] (Int) (Branch target of P1953)
prefetch [%i3 + 0], 1
ba P1758
nop

TARGET1953:
ba RET1953
nop


P1758: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f36, %f2

P1759: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P1760: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f5
fmovd %f36, %f6

P1761: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P1762: !BST [8] (maybe <- 0x41000075) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P1763: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P1764: !PREFETCH [9] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i1 + 512] %asi, 1

P1765: !BST [13] (maybe <- 0x41000076) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P1766: !BST [5] (maybe <- 0x41000077) (FP)
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

P1767: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P1768: !CAS [15] (maybe <- 0x1800016) (Int)
add %i3, 192, %l3
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

P1769: !CAS [6] (maybe <- 0x1800017) (Int)
add %i1, 80, %l3
lduw [%l3], %o3
mov %o3, %o5
! move %o5(lower) -> %o3(upper)
sllx %o5, 32, %o3
mov %l4, %l7
cas [%l3], %o5, %l7
! move %l7(lower) -> %o3(lower)
srl %l7, 0, %l3
or %l3, %o3, %o3
add   %l4, 1, %l4

P1770: !LD [9] (Int) (CBR)
lduw [%i1 + 512], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1770
nop
RET1770:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P1771: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f9
fmovd %f36, %f10

P1772: !REPLACEMENT [15] (Int)
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

P1773: !BLD [6] (FP)
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

P1774: !BLD [7] (FP)
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

P1775: !ST [0] (maybe <- 0x1800018) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P1776: !BST [5] (maybe <- 0x4100007a) (FP)
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

P1777: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P1778: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P1779: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P1780: !BST [13] (maybe <- 0x4100007d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P1781: !BST [8] (maybe <- 0x4100007e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P1782: !BST [14] (maybe <- 0x4100007f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P1783: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P1784: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f3

P1785: !DWST [7] (maybe <- 0x1800019) (Int)
sllx %l4, 32, %l3 
add   %l4, 1, %l4
or %l3, %l4, %l3
stx %l3, [%i1 + 80]
add   %l4, 1, %l4

P1786: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P1787: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P1788: !BST [12] (maybe <- 0x41000080) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P1789: !BLD [6] (FP) (Branch target of P2047)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f5
fmovd %f36, %f6
ba P1790
nop

TARGET2047:
ba RET2047
nop


P1790: !BLD [3] (FP)
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

P1791: !BST [6] (maybe <- 0x41000081) (FP)
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

P1792: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f12

P1793: !DWST [0] (maybe <- 0x180001b) (Int)
sllx %l4, 32, %l6 
add   %l4, 1, %l4
or %l6, %l4, %l6
stx %l6, [%i0 + 0]
add   %l4, 1, %l4

P1794: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P1795: !BST [11] (maybe <- 0x41000084) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P1796: !CASX [13] (maybe <- 0x180001d) (Int)
add %i3, 64, %l3
ldx [%l3], %l7
! move %l7(upper) -> %o4(lower)
srlx %l7, 32, %o5
or %o5, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5
! move %l7(lower) -> %o0(upper)
sllx %l7, 32, %o0
mov  %l7, %o5
sllx %l4, 32, %l7
casx [%l3], %o5, %l7
! move %l7(upper) -> %o0(lower)
srlx %l7, 32, %l3
or %l3, %o0, %o0
! move %l7(lower) -> %o1(upper)
sllx %l7, 32, %o1
add  %l4, 1, %l4

P1797: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P1798: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P1799: !BST [5] (maybe <- 0x41000085) (FP)
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

P1800: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P1801: !BST [3] (maybe <- 0x41000088) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
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
be,pt  %xcc, TARGET1801
nop
RET1801:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P1802: !BST [13] (maybe <- 0x4100008c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P1803: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f14

P1804: !BST [9] (maybe <- 0x4100008d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P1805: !BST [1] (maybe <- 0x4100008e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1806: !BLD [9] (FP)
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

P1807: !BLD [12] (FP) (Branch target of P2052)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f0
membar #Sync 
! 1 addresses covered
ba P1808
nop

TARGET2052:
ba RET2052
nop


P1808: !BST [15] (maybe <- 0x41000092) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P1809: !BST [11] (maybe <- 0x41000093) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P1810: !CASX [10] (maybe <- 0x180001e) (Int)
add %i2, 32, %l7
ldx [%l7], %l3
! move %l3(upper) -> %o1(lower)
srlx %l3, 32, %l6
or %l6, %o1, %o1
! move %l3(lower) -> %o2(upper)
sllx %l3, 32, %o2
mov  %l3, %l6
sllx %l4, 32, %l3
casx [%l7], %l6, %l3
! move %l3(upper) -> %o2(lower)
srlx %l3, 32, %l7
or %l7, %o2, %o2
! move %l3(lower) -> %o3(upper)
sllx %l3, 32, %o3
add  %l4, 1, %l4

P1811: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P1812: !BST [5] (maybe <- 0x41000094) (FP)
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

P1813: !BST [7] (maybe <- 0x41000097) (FP)
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

P1814: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P1815: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P1816: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P1817: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P1818: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P1819: !ST [4] (maybe <- 0x180001f) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P1820: !MEMBAR (Int)
membar #StoreLoad

P1821: !REPLACEMENT [8] (Int)
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

P1822: !BLD [2] (FP)
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

P1823: !SWAP [10] (maybe <- 0x1800020) (Int)
mov %l4, %o5
swap  [%i2 + 32], %o5
! move %o5(lower) -> %o3(lower)
srl %o5, 0, %l6
or %l6, %o3, %o3
add   %l4, 1, %l4

P1824: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P1825: !REPLACEMENT [10] (Int)
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

P1826: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f9
fmovd %f36, %f10

P1827: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P1828: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P1829: !BST [13] (maybe <- 0x4100009a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P1830: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f12

P1831: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f13

P1832: !BST [11] (maybe <- 0x4100009b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P1833: !LD [9] (Int)
lduw [%i1 + 512], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P1834: !BST [11] (maybe <- 0x4100009c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P1835: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P1836: !BST [8] (maybe <- 0x4100009d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P1837: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P1838: !BST [1] (maybe <- 0x4100009e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1839: !BST [9] (maybe <- 0x410000a2) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P1840: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P1841: !BLD [10] (FP)
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

P1842: !BST [8] (maybe <- 0x410000a3) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P1843: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P1844: !BST [14] (maybe <- 0x410000a4) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P1845: !DWLD [2] (Int) (Branch target of P1660)
ldx [%i0 + 8], %l7
! move %l7(lower) -> %o4(lower)
srl %l7, 0, %l6
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5
ba P1846
nop

TARGET1660:
ba RET1660
nop


P1846: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f0
membar #Sync 
! 3 addresses covered
fmovs %f3, %f0
fmovs %f4, %f1
fmovs %f5, %f2

P1847: !CAS [4] (maybe <- 0x1800021) (Int)
add %i0, 64, %l3
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

P1848: !BST [1] (maybe <- 0x410000a5) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1849: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f3
fmovd %f36, %f4

P1850: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P1851: !DWST [3] (maybe <- 0x1800022) (Int) (Branch target of P1743)
mov %l4, %l7 
sllx %l7, 32, %l7 
stx %l7, [%i0 + 32 ] 
add   %l4, 1, %l4
ba P1852
nop

TARGET1743:
ba RET1743
nop


P1852: !BLD [2] (FP)
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

P1853: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P1854: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P1855: !BST [12] (maybe <- 0x410000a9) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P1856: !PREFETCH [4] (Int) (CBR)
prefetch [%i0 + 64], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1856
nop
RET1856:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P1857: !MEMBAR (Int)
membar #StoreLoad

P1858: !BLD [4] (FP) (Branch target of P1704)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11
ba P1859
nop

TARGET1704:
ba RET1704
nop


P1859: !ST [14] (maybe <- 0x1800023) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P1860: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P1861: !BLD [6] (FP)
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

P1862: !BST [5] (maybe <- 0x410000aa) (FP)
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

P1863: !DWST [2] (maybe <- 0x1800024) (Int) (Branch target of P1770)
mov %l4, %o5 
stx %o5, [%i0 + 8]
add   %l4, 1, %l4
ba P1864
nop

TARGET1770:
ba RET1770
nop


P1864: !BLD [11] (FP)
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

P1865: !DWLD [6] (Int) (CBR)
ldx [%i1 + 80], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1865
nop
RET1865:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P1866: !MEMBAR (Int)
membar #StoreLoad

P1867: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P1868: !BST [12] (maybe <- 0x410000ad) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P1869: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f0
membar #Sync 
! 3 addresses covered
fmovs %f3, %f0
fmovs %f4, %f1
fmovs %f5, %f2

P1870: !BLD [3] (FP)
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

P1871: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P1872: !BLD [2] (FP)
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

P1873: !LD [12] (Int)
lduw [%i3 + 0], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P1874: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P1875: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P1876: !BLD [0] (FP)
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

P1877: !REPLACEMENT [9] (Int) (CBR)
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
be,pn  %xcc, TARGET1877
nop
RET1877:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P1878: !PREFETCH [8] (Int) (CBR)
prefetch [%i1 + 256], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1878
nop
RET1878:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P1879: !CASX [6] (maybe <- 0x1800025) (Int)
add %i1, 80, %l3
ldx [%l3], %l7
! move %l7(upper) -> %o2(lower)
srlx %l7, 32, %o5
or %o5, %o2, %o2
! move %l7(lower) -> %o3(upper)
sllx %l7, 32, %o3
mov %l7, %o5
sllx %l4, 32, %l7
add  %l4, 1, %l4
or   %l4, %l7, %l7
casx [%l3], %o5, %l7
! move %l7(upper) -> %o3(lower)
srlx %l7, 32, %l3
or %l3, %o3, %o3
! move %l7(lower) -> %o4(upper)
sllx %l7, 32, %o4
add  %l4, 1, %l4

P1880: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f0
membar #Sync 
! 1 addresses covered

P1881: !BST [9] (maybe <- 0x410000ae) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P1882: !BST [9] (maybe <- 0x410000af) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P1883: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P1884: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P1885: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P1886: !BLD [3] (FP)
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

P1887: !BST [0] (maybe <- 0x410000b0) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1888: !BST [2] (maybe <- 0x410000b4) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1889: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P1890: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P1891: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P1892: !BST [1] (maybe <- 0x410000b8) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1893: !BLD [6] (FP)
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

P1894: !PREFETCH [6] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i1 + 80] %asi, 1

P1895: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P1896: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P1897: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P1898: !ST [15] (maybe <- 0x1800027) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P1899: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f9
fmovd %f36, %f10

P1900: !BST [6] (maybe <- 0x410000bc) (FP)
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

P1901: !BST [2] (maybe <- 0x410000bf) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1902: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P1903: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P1904: !BST [10] (maybe <- 0x410000c3) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P1905: !REPLACEMENT [5] (Int) (CBR)
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

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1905
nop
RET1905:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P1906: !BLD [4] (FP) (Branch target of P1600)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12
ba P1907
nop

TARGET1600:
ba RET1600
nop


P1907: !LD [6] (Int)
lduw [%i1 + 80], %o5
! move %o5(lower) -> %o4(lower)
or %o5, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P1908: !BST [14] (maybe <- 0x410000c4) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P1909: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P1910: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P1911: !BLD [11] (FP)
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

P1912: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P1913: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f0
membar #Sync 
! 3 addresses covered
fmovs %f3, %f0
fmovs %f4, %f1
fmovs %f5, %f2

P1914: !REPLACEMENT [0] (Int)
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

P1915: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f3
fmovd %f36, %f4

P1916: !BST [8] (maybe <- 0x410000c5) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P1917: !BST [13] (maybe <- 0x410000c6) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P1918: !BST [2] (maybe <- 0x410000c7) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1919: !CAS [3] (maybe <- 0x1800028) (Int)
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

P1920: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P1921: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P1922: !BST [12] (maybe <- 0x410000cb) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P1923: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P1924: !BST [12] (maybe <- 0x410000cc) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P1925: !BST [12] (maybe <- 0x410000cd) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P1926: !BST [15] (maybe <- 0x410000ce) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P1927: !ST [9] (maybe <- 0x1800029) (Int) (Branch target of P2007)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4
ba P1928
nop

TARGET2007:
ba RET2007
nop


P1928: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P1929: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P1930: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P1931: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P1932: !BST [8] (maybe <- 0x410000cf) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P1933: !LD [11] (Int)
lduw [%i2 + 64], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P1934: !BST [13] (maybe <- 0x410000d0) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P1935: !BLD [14] (FP) (Branch target of P1865)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6
ba P1936
nop

TARGET1865:
ba RET1865
nop


P1936: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P1937: !BLD [5] (FP)
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

P1938: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P1939: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P1940: !ST [4] (maybe <- 0x180002a) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P1941: !CAS [12] (maybe <- 0x180002b) (Int)
add %i3, 0, %l7
lduw [%l7], %l3
mov %l3, %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1
mov %l4, %o2
cas [%l7], %l6, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P1942: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P1943: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P1944: !BST [3] (maybe <- 0x410000d1) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1945: !BLD [7] (FP)
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

P1946: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f0
membar #Sync 
! 1 addresses covered

P1947: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P1948: !BST [6] (maybe <- 0x410000d5) (FP)
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

P1949: !BST [4] (maybe <- 0x410000d8) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P1950: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P1951: !BST [6] (maybe <- 0x410000d9) (FP)
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

P1952: !DWST [12] (maybe <- 0x180002c) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 0 ] 
add   %l4, 1, %l4

P1953: !BST [2] (maybe <- 0x410000dc) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
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
be,pt  %xcc, TARGET1953
nop
RET1953:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P1954: !BST [12] (maybe <- 0x410000e0) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P1955: !BST [10] (maybe <- 0x410000e1) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P1956: !REPLACEMENT [15] (Int)
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

P1957: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f2

P1958: !CASX [11] (maybe <- 0x180002d) (Int)
add %i2, 64, %l7
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

P1959: !BST [15] (maybe <- 0x410000e2) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P1960: !PREFETCH [5] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i1 + 76] %asi, 1

P1961: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P1962: !CASX [15] (maybe <- 0x180002e) (Int)
add %i3, 192, %l6
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

P1963: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P1964: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P1965: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P1966: !LD [0] (Int)
lduw [%i0 + 0], %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1

P1967: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P1968: !BLD [1] (FP)
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

P1969: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f9
fmovd %f36, %f10

P1970: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P1971: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P1972: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P1973: !BST [2] (maybe <- 0x410000e3) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1974: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f13

P1975: !BLD [0] (FP) (CBR) (Branch target of P2063)
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

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1975
nop
RET1975:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0

ba P1976
nop

TARGET2063:
ba RET2063
nop


P1976: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P1977: !BST [2] (maybe <- 0x410000e7) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1978: !ST [7] (maybe <- 0x180002f) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P1979: !BST [10] (maybe <- 0x410000eb) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P1980: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P1981: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P1982: !BST [3] (maybe <- 0x410000ec) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1983: !BST [14] (maybe <- 0x410000f0) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P1984: !BLD [2] (FP) (Branch target of P1563)
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
ba P1985
nop

TARGET1563:
ba RET1563
nop


P1985: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P1986: !BST [0] (maybe <- 0x410000f1) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1987: !LD [2] (Int)
lduw [%i0 + 12], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P1988: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P1989: !BST [14] (maybe <- 0x410000f5) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P1990: !BLD [2] (FP)
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

P1991: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f12

P1992: !BST [1] (maybe <- 0x410000f6) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1993: !BLD [3] (FP)
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

P1994: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P1995: !BST [2] (maybe <- 0x410000fa) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1996: !BST [7] (maybe <- 0x410000fe) (FP)
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

P1997: !MEMBAR (Int)
membar #StoreLoad

P1998: !BST [11] (maybe <- 0x41000101) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P1999: !BLD [2] (FP)
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

P2000: !DWLD [9] (Int)
ldx [%i1 + 512], %l7
! move %l7(upper) -> %o2(lower)
srlx %l7, 32, %l6
or %l6, %o2, %o2

P2001: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f5
fmovd %f36, %f6

P2002: !BST [10] (maybe <- 0x41000102) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P2003: !BLD [2] (FP)
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

P2004: !LD [6] (Int) (CBR)
lduw [%i1 + 80], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2004
nop
RET2004:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P2005: !BST [14] (maybe <- 0x41000103) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P2006: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P2007: !BST [4] (maybe <- 0x41000104) (FP) (CBR)
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
be,pt  %xcc, TARGET2007
nop
RET2007:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P2008: !BLD [3] (FP)
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

P2009: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f0
membar #Sync 
! 1 addresses covered

P2010: !BST [6] (maybe <- 0x41000105) (FP)
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

P2011: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P2012: !BST [12] (maybe <- 0x41000108) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P2013: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P2014: !BST [9] (maybe <- 0x41000109) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P2015: !BST [8] (maybe <- 0x4100010a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P2016: !BST [9] (maybe <- 0x4100010b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P2017: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P2018: !BST [4] (maybe <- 0x4100010c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P2019: !BST [0] (maybe <- 0x4100010d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2020: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P2021: !BLD [0] (FP)
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

P2022: !BST [0] (maybe <- 0x41000111) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2023: !BST [5] (maybe <- 0x41000115) (FP)
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

P2024: !BST [10] (maybe <- 0x41000118) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P2025: !BST [11] (maybe <- 0x41000119) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P2026: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P2027: !ST [1] (maybe <- 0x1800030) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P2028: !BST [5] (maybe <- 0x4100011a) (FP)
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

P2029: !BST [0] (maybe <- 0x4100011d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2030: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P2031: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P2032: !BLD [3] (FP)
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

P2033: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P2034: !BST [12] (maybe <- 0x41000121) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P2035: !PREFETCH [1] (Int) (CBR)
prefetch [%i0 + 4], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2035
nop
RET2035:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P2036: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P2037: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P2038: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P2039: !DWLD [4] (Int)
ldx [%i0 + 64], %o5
! move %o5(upper) -> %o3(lower)
srlx %o5, 32, %l7
or %l7, %o3, %o3

P2040: !BST [10] (maybe <- 0x41000122) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P2041: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P2042: !BST [9] (maybe <- 0x41000123) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P2043: !BST [6] (maybe <- 0x41000124) (FP)
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

P2044: !PREFETCH [14] (Int) (CBR)
prefetch [%i3 + 128], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2044
nop
RET2044:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P2045: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P2046: !BST [14] (maybe <- 0x41000127) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P2047: !PREFETCH [14] (Int) (CBR)
prefetch [%i3 + 128], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2047
nop
RET2047:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P2048: !BST [14] (maybe <- 0x41000128) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P2049: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P2050: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P2051: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P2052: !MEMBAR (Int) (CBR)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2052
nop
RET2052:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


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

P2059: !LD [6] (Int) (LE)
wr %g0, 0x88, %asi
lduwa [%i1 + 80] %asi, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P2060: !LD [7] (FP)
ld [%i1 + 84], %f15
! 1 addresses covered
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30
fmovd %f8, %f30
fmovd %f10, %f30
fmovd %f12, %f30
fmovd %f14, %f30

P2061: !LD [8] (Int) (Branch target of P1745)
lduw [%i1 + 256], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2
ba P2062
nop

TARGET1745:
ba RET1745
nop


P2062: !LD [9] (Int)
lduw [%i1 + 512], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P2063: !LD [10] (Int) (CBR)
lduw [%i2 + 32], %l6
! move %l6(lower) -> %o3(lower)
or %l6, %o3, %o3

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2063
nop
RET2063:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P2064: !LD [11] (Int)
lduw [%i2 + 64], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P2065: !LD [12] (Int)
lduw [%i3 + 0], %l7
! move %l7(lower) -> %o4(lower)
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P2066: !LD [13] (Int)
lduw [%i3 + 64], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P2067: !LD [14] (Int)
lduw [%i3 + 128], %l7
! move %l7(lower) -> %o0(lower)
or %l7, %o0, %o0

P2068: !LD [15] (Int)
lduw [%i3 + 192], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

END_NODES3: ! Test istream for CPU 3 ends
sethi %hi(0xdead0e0f), %l6
or    %l6, %lo(0xdead0e0f), %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1
stw %l6, [%i5] 
ld [%i5], %f0
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
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
sethi %hi(0x04deade1), %l3
or    %l3, %lo(0x04deade1), %l3
stw %l3, [%i5] 
ld [%i5], %f16

! Initialize running integer counter in register %l4
sethi %hi(0x2000001), %l4
or    %l4, %lo(0x2000001), %l4

! Initialize running FP counter in register %f16
sethi %hi(0x41800001), %l3
or    %l3, %lo(0x41800001), %l3
stw %l3, [%i5] 
ld [%i5], %f16

! Initialize FP counter increment value in register %f17 (constant)
sethi %hi(0x36000000), %l3
or    %l3, %lo(0x36000000), %l3
stw %l3, [%i5] 
ld [%i5], %f17 

! Initialize LFSR to 0x1e3a^4
sethi %hi(0x1e3a), %l0
or    %l0, %lo(0x1e3a), %l0
mulx  %l0, %l0, %l0
mulx  %l0, %l0, %l0

!-- init shared addrs 8 to 9 ---
stx %g0, [%i1+256]
stx %g0, [%i1+512]

! use untouched cache-line (offset 4K) in replacement area for sync
sub %i1, %i0, %l6
add %i3, %l6, %l6
sub %l6, -4096, %l6

!-- begin of sync_init ---
or %g0, 1, %l7
or %g0, %l7, %o5
swap [%l6+4], %o5
membar #Sync
sync_init_1_4:
brnz,pt %l7, sync_init_1_4
lduw [%l6+4], %l7 ! delay slot
sync_init_2_4:
lduw [%l6], %l7
sub %l7, 1, %o5
cas [%l6], %l7, %o5
cmp %l7, %o5
bne,pt %xcc, sync_init_2_4
nop
membar #Sync
sync_init_3_4:
lduw [%l6], %l7 ! delay slot
brnz,pt %l7, sync_init_3_4
nop
!-- end of sync_init ---


BEGIN_NODES4: ! Test istream for CPU 4 begins

P2069: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P2070: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f0
membar #Sync 
! 3 addresses covered
fmovs %f3, %f0
fmovs %f4, %f1
fmovs %f5, %f2

P2071: !BST [7] (maybe <- 0x41800001) (FP)
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

P2072: !BST [13] (maybe <- 0x41800004) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P2073: !MEMBAR (Int)
membar #StoreLoad

P2074: !BST [2] (maybe <- 0x41800005) (FP) (Branch target of P2081)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 
ba P2075
nop

TARGET2081:
ba RET2081
nop


P2075: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P2076: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P2077: !BST [7] (maybe <- 0x41800009) (FP)
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

P2078: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P2079: !CASX [10] (maybe <- 0x2000001) (Int)
add %i2, 32, %l6
ldx [%l6], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l3
sllx %l4, 32, %o1
casx [%l6], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P2080: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P2081: !BLD [2] (FP) (CBR)
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

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2081
nop
RET2081:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P2082: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P2083: !PREFETCH [10] (Int) (CBR)
prefetch [%i2 + 32], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2083
nop
RET2083:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P2084: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P2085: !BST [4] (maybe <- 0x4180000c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P2086: !BST [3] (maybe <- 0x4180000d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2087: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P2088: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P2089: !ST [8] (maybe <- 0x2000002) (Int) (LE)
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
stwa   %l3, [%i1 + 256] %asi
add   %l4, 1, %l4

P2090: !LD [12] (Int) (LE)
wr %g0, 0x88, %asi
lduwa [%i3 + 0] %asi, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P2091: !BLD [15] (FP) (Branch target of P2290)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10
ba P2092
nop

TARGET2290:
ba RET2290
nop


P2092: !BST [4] (maybe <- 0x41800011) (FP) (Branch target of P2188)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 
ba P2093
nop

TARGET2188:
ba RET2188
nop


P2093: !BST [8] (maybe <- 0x41800012) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P2094: !DWLD [12] (FP)
ldd [%i3 + 0], %f18
! 1 addresses covered
fmovs %f18, %f11

P2095: !DWLD [0] (Int)
ldx [%i0 + 0], %l3
! move %l3(upper) -> %o2(lower)
srlx %l3, 32, %o5
or %o5, %o2, %o2
! move %l3(lower) -> %o3(upper)
sllx %l3, 32, %o3

P2096: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P2097: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P2098: !MEMBAR (Int)
membar #StoreLoad

P2099: !BST [1] (maybe <- 0x41800013) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2100: !BLD [3] (FP)
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

P2101: !BST [15] (maybe <- 0x41800017) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P2102: !BST [2] (maybe <- 0x41800018) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2103: !PREFETCH [15] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i3 + 192] %asi, 1

P2104: !BST [13] (maybe <- 0x4180001c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P2105: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P2106: !BST [0] (maybe <- 0x4180001d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2107: !PREFETCH [10] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i2 + 32] %asi, 1

P2108: !BLD [3] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f0
membar #Sync 
! 4 addresses covered
fmovs %f3, %f2
fmovs %f8, %f3

P2109: !REPLACEMENT [3] (Int)
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

P2110: !BST [0] (maybe <- 0x41800021) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2111: !CAS [5] (maybe <- 0x2000003) (Int)
add %i1, 76, %o5
lduw [%o5], %l6
mov %l6, %l7
! move %l7(lower) -> %o3(lower)
or %l7, %o3, %o3
mov %l4, %o4
cas [%o5], %l7, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P2112: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P2113: !BST [8] (maybe <- 0x41800025) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P2114: !BST [4] (maybe <- 0x41800026) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P2115: !BST [2] (maybe <- 0x41800027) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2116: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P2117: !ST [5] (maybe <- 0x2000004) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P2118: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P2119: !BST [4] (maybe <- 0x4180002b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P2120: !BST [12] (maybe <- 0x4180002c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P2121: !BST [8] (maybe <- 0x4180002d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P2122: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P2123: !BST [10] (maybe <- 0x4180002e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P2124: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P2125: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P2126: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P2127: !BLD [15] (FP) (Branch target of P2326)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8
ba P2128
nop

TARGET2326:
ba RET2326
nop


P2128: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P2129: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P2130: !MEMBAR (Int) (Branch target of P2507)
membar #StoreLoad
ba P2131
nop

TARGET2507:
ba RET2507
nop


P2131: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P2132: !CASX [10] (maybe <- 0x2000005) (Int)
add %i2, 32, %o5
ldx [%o5], %l6
! move %l6(upper) -> %o4(lower)
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

P2133: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P2134: !BST [9] (maybe <- 0x4180002f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P2135: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P2136: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P2137: !BLD [2] (FP)
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

P2138: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P2139: !BST [12] (maybe <- 0x41800030) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P2140: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P2141: !BST [4] (maybe <- 0x41800031) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P2142: !BLD [3] (FP)
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

P2143: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P2144: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f3
fmovd %f36, %f4

P2145: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P2146: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P2147: !BST [7] (maybe <- 0x41800032) (FP)
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

P2148: !ST [8] (maybe <- 0x2000006) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P2149: !REPLACEMENT [11] (Int)
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

P2150: !BST [2] (maybe <- 0x41800035) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2151: !BST [6] (maybe <- 0x41800039) (FP)
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

P2152: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f36, %f8

P2153: !REPLACEMENT [4] (Int)
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

P2154: !BST [1] (maybe <- 0x4180003c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2155: !PREFETCH [8] (Int) (Branch target of P2369)
prefetch [%i1 + 256], 1
ba P2156
nop

TARGET2369:
ba RET2369
nop


P2156: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P2157: !BST [7] (maybe <- 0x41800040) (FP)
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

P2158: !BST [11] (maybe <- 0x41800043) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P2159: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P2160: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P2161: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P2162: !BST [15] (maybe <- 0x41800044) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P2163: !BST [2] (maybe <- 0x41800045) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2164: !BST [3] (maybe <- 0x41800049) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2165: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P2166: !BST [9] (maybe <- 0x4180004d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P2167: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P2168: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P2169: !CASX [3] (maybe <- 0x2000007) (Int)
add %i0, 32, %o5
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

P2170: !BST [9] (maybe <- 0x4180004e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P2171: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P2172: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P2173: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P2174: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P2175: !DWLD [2] (Int)
ldx [%i0 + 8], %l7
! move %l7(lower) -> %o3(lower)
srl %l7, 0, %l6
or %l6, %o3, %o3

P2176: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P2177: !BST [15] (maybe <- 0x4180004f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P2178: !BLD [12] (FP)
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

P2179: !ST [11] (maybe <- 0x2000008) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P2180: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P2181: !MEMBAR (Int)
membar #StoreLoad

P2182: !DWST [9] (maybe <- 0x2000009) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 512 ] 
add   %l4, 1, %l4

P2183: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P2184: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f0
membar #Sync 
! 1 addresses covered

P2185: !PREFETCH [10] (Int) (Branch target of P2416)
prefetch [%i2 + 32], 1
ba P2186
nop

TARGET2416:
ba RET2416
nop


P2186: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f36, %f2

P2187: !BST [5] (maybe <- 0x41800050) (FP)
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

P2188: !BST [1] (maybe <- 0x41800053) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
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
be,pn  %xcc, TARGET2188
nop
RET2188:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P2189: !DWST [7] (maybe <- 0x200000a) (Int) (Branch target of P2251)
sllx %l4, 32, %o5 
add   %l4, 1, %l4
or %o5, %l4, %o5
stx %o5, [%i1 + 80]
add   %l4, 1, %l4
ba P2190
nop

TARGET2251:
ba RET2251
nop


P2190: !BST [3] (maybe <- 0x41800057) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2191: !ST [4] (maybe <- 0x200000c) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P2192: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P2193: !BST [1] (maybe <- 0x4180005b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2194: !BLD [1] (FP)
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

P2195: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P2196: !DWLD [11] (Int)
ldx [%i2 + 64], %o4
! move %o4(upper) -> %o4(upper)

P2197: !BLD [3] (FP)
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

P2198: !DWLD [7] (Int)
ldx [%i1 + 80], %l7
! move %l7(upper) -> %o4(lower)
srlx %o4, 32, %o4
sllx %o4, 32, %o4
srlx %l7, 32, %l6
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5
! move %l7(lower) -> %o0(upper)
sllx %l7, 32, %o0

P2199: !BLD [7] (FP)
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

P2200: !BLD [6] (FP)
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

P2201: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P2202: !REPLACEMENT [12] (Int)
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

P2203: !BST [5] (maybe <- 0x4180005f) (FP)
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

P2204: !BST [0] (maybe <- 0x41800062) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
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
be,pt  %xcc, TARGET2204
nop
RET2204:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P2205: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f3

P2206: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P2207: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P2208: !BST [15] (maybe <- 0x41800066) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P2209: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P2210: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P2211: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P2212: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P2213: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f36, %f8

P2214: !BST [14] (maybe <- 0x41800067) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P2215: !LD [14] (Int)
lduw [%i3 + 128], %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0

P2216: !BST [11] (maybe <- 0x41800068) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P2217: !BST [2] (maybe <- 0x41800069) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2218: !PREFETCH [1] (Int) (Branch target of P2371)
prefetch [%i0 + 4], 1
ba P2219
nop

TARGET2371:
ba RET2371
nop


P2219: !BLD [2] (FP)
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

P2220: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P2221: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P2222: !CAS [5] (maybe <- 0x200000d) (Int) (CBR)
add %i1, 76, %l3
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

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2222
nop
RET2222:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P2223: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P2224: !BST [4] (maybe <- 0x4180006d) (FP) (Branch target of P2258)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 
ba P2225
nop

TARGET2258:
ba RET2258
nop


P2225: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P2226: !BST [15] (maybe <- 0x4180006e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P2227: !DWST [1] (maybe <- 0x200000e) (Int) (CBR)
sllx %l4, 32, %l7 
add   %l4, 1, %l4
or %l7, %l4, %l7
stx %l7, [%i0 + 0]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2227
nop
RET2227:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P2228: !PREFETCH [10] (Int) (Branch target of P2563)
prefetch [%i2 + 32], 1
ba P2229
nop

TARGET2563:
ba RET2563
nop


P2229: !DWLD [12] (Int)
ldx [%i3 + 0], %o2
! move %o2(upper) -> %o2(upper)

P2230: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f14

P2231: !BLD [9] (FP)
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

P2232: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f0
membar #Sync 
! 1 addresses covered

P2233: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P2234: !MEMBAR (Int)
membar #StoreLoad

P2235: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P2236: !BST [13] (maybe <- 0x4180006f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P2237: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f36, %f2

P2238: !LD [0] (FP)
ld [%i0 + 0], %f4
! 1 addresses covered

P2239: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f5
fmovd %f36, %f6

P2240: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P2241: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P2242: !BST [15] (maybe <- 0x41800070) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P2243: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P2244: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P2245: !PREFETCH [11] (Int) (Branch target of P2222)
prefetch [%i2 + 64], 1
ba P2246
nop

TARGET2222:
ba RET2222
nop


P2246: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P2247: !DWST [4] (maybe <- 0x2000010) (Int)
mov %l4, %l7 
sllx %l7, 32, %l7 
stx %l7, [%i0 + 64 ] 
add   %l4, 1, %l4

P2248: !DWLD [4] (FP)
ldd [%i0 + 64], %f18
! 1 addresses covered
fmovs %f18, %f11

P2249: !BLD [5] (FP)
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

P2250: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P2251: !CASX [6] (maybe <- 0x2000011) (Int) (CBR)
add %i1, 80, %l7
ldx [%l7], %l3
! move %l3(upper) -> %o2(lower)
srlx %o2, 32, %o2
sllx %o2, 32, %o2
srlx %l3, 32, %l6
or %l6, %o2, %o2
! move %l3(lower) -> %o3(upper)
sllx %l3, 32, %o3
mov %l3, %l6
sllx %l4, 32, %l3
add  %l4, 1, %l4
or   %l4, %l3, %l3
casx [%l7], %l6, %l3
! move %l3(upper) -> %o3(lower)
srlx %l3, 32, %l7
or %l7, %o3, %o3
! move %l3(lower) -> %o4(upper)
sllx %l3, 32, %o4
add  %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2251
nop
RET2251:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P2252: !BLD [14] (FP)
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

P2253: !ST [14] (maybe <- 0x2000013) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P2254: !CASX [3] (maybe <- 0x2000014) (Int)
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

P2255: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f0
membar #Sync 
! 3 addresses covered
fmovs %f3, %f0
fmovs %f4, %f1
fmovs %f5, %f2

P2256: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P2257: !BST [7] (maybe <- 0x41800071) (FP) (Branch target of P2474)
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
ba P2258
nop

TARGET2474:
ba RET2474
nop


P2258: !BST [4] (maybe <- 0x41800074) (FP) (CBR)
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
be,pt  %xcc, TARGET2258
nop
RET2258:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P2259: !DWLD [2] (Int)
ldx [%i0 + 8], %l6
! move %l6(lower) -> %o1(lower)
srl %l6, 0, %l3
or %l3, %o1, %o1

P2260: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P2261: !BLD [9] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2261
nop
RET2261:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P2262: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P2263: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P2264: !BST [10] (maybe <- 0x41800075) (FP) (Branch target of P2461)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 
ba P2265
nop

TARGET2461:
ba RET2461
nop


P2265: !PREFETCH [5] (Int) (Branch target of P2204)
prefetch [%i1 + 76], 1
ba P2266
nop

TARGET2204:
ba RET2204
nop


P2266: !SWAP [5] (maybe <- 0x2000015) (Int)
mov %l4, %o2
swap  [%i1 + 76], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P2267: !BST [10] (maybe <- 0x41800076) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P2268: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P2269: !BST [5] (maybe <- 0x41800077) (FP)
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

P2270: !CAS [8] (maybe <- 0x2000016) (Int)
add %i1, 256, %l3
lduw [%l3], %l7
mov %l7, %o5
! move %o5(lower) -> %o2(lower)
or %o5, %o2, %o2
mov %l4, %o3
cas [%l3], %o5, %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P2271: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P2272: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P2273: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P2274: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P2275: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P2276: !DWLD [14] (FP)
ldd [%i3 + 128], %f18
! 1 addresses covered
fmovs %f18, %f9

P2277: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P2278: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P2279: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P2280: !BST [0] (maybe <- 0x4180007a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2281: !BST [2] (maybe <- 0x4180007e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2282: !BLD [5] (FP)
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

P2283: !BLD [1] (FP)
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

P2284: !BST [8] (maybe <- 0x41800082) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P2285: !BST [14] (maybe <- 0x41800083) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P2286: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P2287: !BST [6] (maybe <- 0x41800084) (FP)
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

P2288: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P2289: !PREFETCH [3] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i0 + 32] %asi, 1

P2290: !PREFETCH [12] (Int) (CBR)
prefetch [%i3 + 0], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2290
nop
RET2290:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P2291: !ST [4] (maybe <- 0x2000017) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P2292: !PREFETCH [9] (Int) (Branch target of P2083)
prefetch [%i1 + 512], 1
ba P2293
nop

TARGET2083:
ba RET2083
nop


P2293: !BST [14] (maybe <- 0x41800087) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P2294: !BLD [0] (FP)
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

P2295: !BST [8] (maybe <- 0x41800088) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P2296: !SWAP [2] (maybe <- 0x2000018) (Int)
mov %l4, %l7
swap  [%i0 + 12], %l7
! move %l7(lower) -> %o3(lower)
srl %l7, 0, %l3
or %l3, %o3, %o3
add   %l4, 1, %l4

P2297: !BST [12] (maybe <- 0x41800089) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P2298: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P2299: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P2300: !DWST [6] (maybe <- 0x2000019) (Int)
sllx %l4, 32, %l7 
add   %l4, 1, %l4
or %l7, %l4, %l7
stx %l7, [%i1 + 80]
add   %l4, 1, %l4

P2301: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f9
fmovd %f36, %f10

P2302: !DWLD [0] (Int)
ldx [%i0 + 0], %o4
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P2303: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P2304: !CAS [12] (maybe <- 0x200001b) (Int)
add %i3, 0, %l3
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

P2305: !BST [3] (maybe <- 0x4180008a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2306: !PREFETCH [8] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i1 + 256] %asi, 1

P2307: !DWLD [15] (Int)
ldx [%i3 + 192], %o1
! move %o1(upper) -> %o1(upper)

P2308: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P2309: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P2310: !BST [5] (maybe <- 0x4180008e) (FP)
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

P2311: !PREFETCH [7] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i1 + 84] %asi, 1

P2312: !BST [2] (maybe <- 0x41800091) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2313: !LD [6] (Int)
lduw [%i1 + 80], %o5
! move %o5(lower) -> %o1(lower)
srlx %o1, 32, %o1
sllx %o1, 32, %o1
or %o5, %o1, %o1

P2314: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P2315: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P2316: !BLD [11] (FP)
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

P2317: !MEMBAR (Int)
membar #StoreLoad

P2318: !BST [3] (maybe <- 0x41800095) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2319: !BST [1] (maybe <- 0x41800099) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2320: !CAS [15] (maybe <- 0x200001c) (Int)
add %i3, 192, %o5
lduw [%o5], %o2
mov %o2, %l7
! move %l7(lower) -> %o2(upper)
sllx %l7, 32, %o2
mov %l4, %l6
cas [%o5], %l7, %l6
! move %l6(lower) -> %o2(lower)
srl %l6, 0, %o5
or %o5, %o2, %o2
add   %l4, 1, %l4

P2321: !LD [13] (Int)
lduw [%i3 + 64], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P2322: !BST [1] (maybe <- 0x4180009d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2323: !BST [4] (maybe <- 0x418000a1) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P2324: !REPLACEMENT [4] (Int)
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

P2325: !BLD [0] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f0
membar #Sync 
! 4 addresses covered
fmovs %f3, %f2
fmovs %f8, %f3

P2326: !BST [15] (maybe <- 0x418000a2) (FP) (CBR)
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
be,pn  %xcc, TARGET2326
nop
RET2326:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P2327: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P2328: !BLD [3] (FP)
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

P2329: !BLD [3] (FP)
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

P2330: !BST [11] (maybe <- 0x418000a3) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P2331: !DWST [4] (maybe <- 0x200001d) (Int)
mov %l4, %l3 
sllx %l3, 32, %l3 
stx %l3, [%i0 + 64 ] 
add   %l4, 1, %l4

P2332: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P2333: !REPLACEMENT [7] (Int)
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

P2334: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P2335: !DWLD [0] (Int) (LE) (CBR)
wr %g0, 0x88, %asi
ldxa [%i0 + 0] %asi, %o5
! move %o5(lower) -> %o3(lower)
srl %o5, 0, %l7
or %l7, %o3, %o3
! move %o5(upper) -> %o4(upper)
or %o5, %g0, %o4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2335
nop
RET2335:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P2336: !BST [11] (maybe <- 0x418000a4) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P2337: !CAS [10] (maybe <- 0x200001e) (Int)
add %i2, 32, %l6
lduw [%l6], %o5
mov %o5, %l3
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
mov %l4, %o0
cas [%l6], %l3, %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
add   %l4, 1, %l4

P2338: !BST [15] (maybe <- 0x418000a5) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P2339: !BST [8] (maybe <- 0x418000a6) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P2340: !BLD [5] (FP)
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

P2341: !BST [4] (maybe <- 0x418000a7) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P2342: !BST [1] (maybe <- 0x418000a8) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2343: !SWAP [9] (maybe <- 0x200001f) (Int)
mov %l4, %l7
swap  [%i1 + 512], %l7
! move %l7(lower) -> %o0(lower)
srl %l7, 0, %l3
or %l3, %o0, %o0
add   %l4, 1, %l4

P2344: !LD [3] (Int)
lduw [%i0 + 32], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P2345: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P2346: !BLD [8] (FP)
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

P2347: !BST [8] (maybe <- 0x418000ac) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P2348: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P2349: !BST [5] (maybe <- 0x418000ad) (FP)
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

P2350: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f0
membar #Sync 
! 1 addresses covered

P2351: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f36, %f2

P2352: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P2353: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P2354: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f5
fmovd %f36, %f6

P2355: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P2356: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P2357: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P2358: !BLD [3] (FP)
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

P2359: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P2360: !BLD [7] (FP)
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

P2361: !BLD [6] (FP)
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

P2362: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P2363: !BLD [5] (FP)
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

P2364: !BST [6] (maybe <- 0x418000b0) (FP)
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

P2365: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P2366: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P2367: !LD [8] (Int)
lduw [%i1 + 256], %o5
! move %o5(lower) -> %o1(lower)
or %o5, %o1, %o1

P2368: !BST [10] (maybe <- 0x418000b3) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P2369: !BST [3] (maybe <- 0x418000b4) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
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
be,pn  %xcc, TARGET2369
nop
RET2369:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P2370: !BST [2] (maybe <- 0x418000b8) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2371: !BST [15] (maybe <- 0x418000bc) (FP) (CBR)
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
be,pn  %xcc, TARGET2371
nop
RET2371:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P2372: !ST [3] (maybe <- 0x418000bd) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i0 + 32 ]

P2373: !MEMBAR (Int)
membar #StoreLoad

P2374: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P2375: !BST [4] (maybe <- 0x418000be) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P2376: !BST [10] (maybe <- 0x418000bf) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P2377: !BLD [3] (FP)
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

P2378: !BST [3] (maybe <- 0x418000c0) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2379: !LD [0] (Int)
lduw [%i0 + 0], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P2380: !BST [10] (maybe <- 0x418000c4) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P2381: !BST [15] (maybe <- 0x418000c5) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P2382: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P2383: !ST [8] (maybe <- 0x2000020) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P2384: !BST [3] (maybe <- 0x418000c6) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2385: !MEMBAR (Int)
membar #StoreLoad

P2386: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P2387: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P2388: !BST [1] (maybe <- 0x418000ca) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2389: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P2390: !BST [2] (maybe <- 0x418000ce) (FP) (Branch target of P2482)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 
ba P2391
nop

TARGET2482:
ba RET2482
nop


P2391: !PREFETCH [11] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i2 + 64] %asi, 1

P2392: !BST [5] (maybe <- 0x418000d2) (FP)
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

P2393: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P2394: !BLD [0] (FP)
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

P2395: !PREFETCH [0] (Int) (CBR)
prefetch [%i0 + 0], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2395
nop
RET2395:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P2396: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P2397: !BST [0] (maybe <- 0x418000d5) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2398: !BLD [11] (FP)
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

P2399: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f0
membar #Sync 
! 1 addresses covered
fmovd %f8, %f0

P2400: !BST [10] (maybe <- 0x418000d9) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P2401: !BST [2] (maybe <- 0x418000da) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2402: !BST [6] (maybe <- 0x418000de) (FP)
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

P2403: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P2404: !BST [13] (maybe <- 0x418000e1) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P2405: !BLD [0] (FP)
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

P2406: !BLD [2] (FP)
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

P2407: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P2408: !BST [1] (maybe <- 0x418000e2) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2409: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P2410: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P2411: !PREFETCH [2] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i0 + 12] %asi, 1

P2412: !BLD [2] (FP)
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

P2413: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P2414: !BST [9] (maybe <- 0x418000e6) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P2415: !BST [11] (maybe <- 0x418000e7) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P2416: !BST [13] (maybe <- 0x418000e8) (FP) (CBR)
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
be,pn  %xcc, TARGET2416
nop
RET2416:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P2417: !BLD [8] (FP)
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

P2418: !BLD [3] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f0
membar #Sync 
! 4 addresses covered
fmovs %f3, %f2
fmovs %f8, %f3

P2419: !BST [6] (maybe <- 0x418000e9) (FP)
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

P2420: !BLD [0] (FP)
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

P2421: !BLD [2] (FP)
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

P2422: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P2423: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P2424: !BST [7] (maybe <- 0x418000ec) (FP)
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

P2425: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P2426: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P2427: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P2428: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P2429: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P2430: !BLD [10] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f14

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2430
nop
RET2430:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P2431: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P2432: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P2433: !BLD [1] (FP)
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

P2434: !DWLD [13] (Int)
ldx [%i3 + 64], %l7
! move %l7(upper) -> %o2(lower)
srlx %l7, 32, %l6
or %l6, %o2, %o2

P2435: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P2436: !BST [8] (maybe <- 0x418000ef) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P2437: !CASX [3] (maybe <- 0x2000021) (Int)
add %i0, 32, %o5
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

P2438: !DWLD [8] (Int)
ldx [%i1 + 256], %o0
! move %o0(upper) -> %o0(upper)

P2439: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P2440: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P2441: !BLD [1] (FP)
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

P2442: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P2443: !BST [11] (maybe <- 0x418000f0) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P2444: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P2445: !DWST [10] (maybe <- 0x2000022) (Int)
mov %l4, %o5 
sllx %o5, 32, %o5 
stx %o5, [%i2 + 32 ] 
add   %l4, 1, %l4

P2446: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P2447: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f11

P2448: !BST [15] (maybe <- 0x418000f1) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P2449: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P2450: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P2451: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P2452: !REPLACEMENT [13] (Int)
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

P2453: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P2454: !DWST [6] (maybe <- 0x2000023) (Int)
sllx %l4, 32, %l3 
add   %l4, 1, %l4
or %l3, %l4, %l3
stx %l3, [%i1 + 80]
add   %l4, 1, %l4

P2455: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P2456: !BLD [5] (FP)
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

P2457: !LD [6] (Int) (Branch target of P2491)
lduw [%i1 + 80], %l3
! move %l3(lower) -> %o0(lower)
srlx %o0, 32, %o0
sllx %o0, 32, %o0
or %l3, %o0, %o0
ba P2458
nop

TARGET2491:
ba RET2491
nop


P2458: !BST [10] (maybe <- 0x418000f2) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P2459: !LD [13] (Int)
lduw [%i3 + 64], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P2460: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P2461: !BST [11] (maybe <- 0x418000f3) (FP) (CBR)
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
be,pt  %xcc, TARGET2461
nop
RET2461:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P2462: !BST [6] (maybe <- 0x418000f4) (FP)
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

P2463: !BST [2] (maybe <- 0x418000f7) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2464: !BLD [5] (FP)
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

P2465: !REPLACEMENT [14] (Int)
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

P2466: !BST [0] (maybe <- 0x418000fb) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2467: !BST [0] (maybe <- 0x418000ff) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2468: !BST [15] (maybe <- 0x41800103) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P2469: !BST [4] (maybe <- 0x41800104) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P2470: !BLD [5] (FP)
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

P2471: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f5
fmovd %f36, %f6

P2472: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P2473: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P2474: !BLD [11] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2474
nop
RET2474:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P2475: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P2476: !BST [12] (maybe <- 0x41800105) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P2477: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P2478: !BST [6] (maybe <- 0x41800106) (FP)
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

P2479: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P2480: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f11
fmovd %f36, %f12

P2481: !BST [1] (maybe <- 0x41800109) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2482: !BLD [2] (FP) (CBR)
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

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2482
nop
RET2482:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P2483: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P2484: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P2485: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P2486: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P2487: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P2488: !BST [2] (maybe <- 0x4180010d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2489: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P2490: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P2491: !PREFETCH [6] (Int) (CBR)
prefetch [%i1 + 80], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2491
nop
RET2491:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P2492: !BLD [1] (FP)
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

P2493: !BST [10] (maybe <- 0x41800111) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P2494: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P2495: !BST [8] (maybe <- 0x41800112) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P2496: !BLD [3] (FP)
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

P2497: !BST [1] (maybe <- 0x41800113) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2498: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P2499: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P2500: !CAS [9] (maybe <- 0x2000025) (Int)
add %i1, 512, %l3
lduw [%l3], %l7
mov %l7, %o5
! move %o5(lower) -> %o1(lower)
or %o5, %o1, %o1
mov %l4, %o2
cas [%l3], %o5, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P2501: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P2502: !BLD [1] (FP)
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

P2503: !CAS [14] (maybe <- 0x2000026) (Int)
add %i3, 128, %l3
lduw [%l3], %l7
mov %l7, %o5
! move %o5(lower) -> %o2(lower)
or %o5, %o2, %o2
mov %l4, %o3
cas [%l3], %o5, %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P2504: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P2505: !BLD [6] (FP)
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

P2506: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P2507: !BLD [1] (FP) (CBR)
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

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2507
nop
RET2507:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P2508: !PREFETCH [15] (Int) (Branch target of P2261)
prefetch [%i3 + 192], 1
ba P2509
nop

TARGET2261:
ba RET2261
nop


P2509: !DWLD [14] (Int)
ldx [%i3 + 128], %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %l3
or %l3, %o3, %o3

P2510: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P2511: !BST [7] (maybe <- 0x41800117) (FP)
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

P2512: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P2513: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P2514: !DWLD [11] (Int)
ldx [%i2 + 64], %o4
! move %o4(upper) -> %o4(upper)

P2515: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P2516: !BST [9] (maybe <- 0x4180011a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P2517: !BST [9] (maybe <- 0x4180011b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P2518: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f11

P2519: !PREFETCH [2] (Int) (Branch target of P2335)
prefetch [%i0 + 12], 1
ba P2520
nop

TARGET2335:
ba RET2335
nop


P2520: !BST [5] (maybe <- 0x4180011c) (FP)
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

P2521: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P2522: !BST [9] (maybe <- 0x4180011f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P2523: !LD [0] (Int)
lduw [%i0 + 0], %l3
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

P2524: !MEMBAR (Int)
membar #StoreLoad

P2525: !BLD [2] (FP) (Branch target of P2227)
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
ba P2526
nop

TARGET2227:
ba RET2227
nop


P2526: !BST [4] (maybe <- 0x41800120) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P2527: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P2528: !PREFETCH [1] (Int) (CBR)
prefetch [%i0 + 4], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2528
nop
RET2528:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P2529: !BLD [7] (FP)
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

P2530: !PREFETCH [14] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i3 + 128] %asi, 1

P2531: !BST [2] (maybe <- 0x41800121) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2532: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P2533: !PREFETCH [9] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i1 + 512] %asi, 1

P2534: !BLD [2] (FP)
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

P2535: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P2536: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P2537: !REPLACEMENT [9] (Int)
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

P2538: !BST [15] (maybe <- 0x41800125) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P2539: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P2540: !BST [3] (maybe <- 0x41800126) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2541: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P2542: !BST [12] (maybe <- 0x4180012a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P2543: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P2544: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P2545: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P2546: !REPLACEMENT [6] (Int)
sethi %hi(0x50), %l3
or %l3, %lo(0x50),  %l3
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

P2547: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P2548: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P2549: !BLD [7] (FP)
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

P2550: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f0
membar #Sync 
! 1 addresses covered

P2551: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P2552: !BLD [3] (FP)
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

P2553: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P2554: !PREFETCH [13] (Int) (Branch target of P2430)
prefetch [%i3 + 64], 1
ba P2555
nop

TARGET2430:
ba RET2430
nop


P2555: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P2556: !BLD [5] (FP)
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

P2557: !BST [2] (maybe <- 0x4180012b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2558: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f9
fmovd %f36, %f10

P2559: !BLD [1] (FP)
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

P2560: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P2561: !BST [6] (maybe <- 0x4180012f) (FP)
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

P2562: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P2563: !BST [7] (maybe <- 0x41800132) (FP) (CBR)
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
be,pn  %xcc, TARGET2563
nop
RET2563:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P2564: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P2565: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P2566: !REPLACEMENT [1] (Int)
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

P2567: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P2568: !PREFETCH [8] (Int) (Branch target of P2395)
prefetch [%i1 + 256], 1
ba P2569
nop

TARGET2395:
ba RET2395
nop


P2569: !MEMBAR (Int)
membar #StoreLoad

P2570: !LD [0] (Int)
lduw [%i0 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P2571: !LD [1] (Int)
lduw [%i0 + 4], %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0

P2572: !LD [2] (Int)
lduw [%i0 + 12], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P2573: !LD [3] (Int)
lduw [%i0 + 32], %o5
! move %o5(lower) -> %o1(lower)
or %o5, %o1, %o1

P2574: !LD [4] (Int)
lduw [%i0 + 64], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P2575: !LD [5] (Int) (LE)
wr %g0, 0x88, %asi
lduwa [%i1 + 76] %asi, %o5
! move %o5(lower) -> %o2(lower)
or %o5, %o2, %o2

P2576: !LD [6] (Int)
lduw [%i1 + 80], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P2577: !LD [7] (Int) (Branch target of P2528)
lduw [%i1 + 84], %o5
! move %o5(lower) -> %o3(lower)
or %o5, %o3, %o3
ba P2578
nop

TARGET2528:
ba RET2528
nop


P2578: !LD [8] (Int)
lduw [%i1 + 256], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P2579: !LD [9] (Int)
lduw [%i1 + 512], %o5
! move %o5(lower) -> %o4(lower)
or %o5, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P2580: !LD [10] (Int)
lduw [%i2 + 32], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P2581: !LD [11] (Int)
lduw [%i2 + 64], %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0

P2582: !LD [12] (Int) (LE)
wr %g0, 0x88, %asi
lduwa [%i3 + 0] %asi, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P2583: !LD [13] (FP)
ld [%i3 + 64], %f0
! 1 addresses covered

P2584: !LD [14] (Int)
lduw [%i3 + 128], %o5
! move %o5(lower) -> %o1(lower)
or %o5, %o1, %o1

P2585: !LD [15] (Int)
lduw [%i3 + 192], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

END_NODES4: ! Test istream for CPU 4 ends
sethi %hi(0xdead0e0f), %l7
or    %l7, %lo(0xdead0e0f), %l7
! move %l7(lower) -> %o2(lower)
or %l7, %o2, %o2
stw %l7, [%i5] 
ld [%i5], %f1
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
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

! Initialize LFSR to 0x7847^4
sethi %hi(0x7847), %l0
or    %l0, %lo(0x7847), %l0
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

P2586: !BLD [1] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f0
membar #Sync 
! 4 addresses covered
fmovs %f3, %f2
fmovs %f8, %f3

P2587: !BST [10] (maybe <- 0x42000001) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P2588: !BST [13] (maybe <- 0x42000002) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P2589: !PREFETCH [6] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i1 + 80] %asi, 1

P2590: !MEMBAR (Int)
membar #StoreLoad

P2591: !BLD [3] (FP)
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

P2592: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P2593: !BST [2] (maybe <- 0x42000003) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2594: !DWST [9] (maybe <- 0x2800001) (Int)
mov %l4, %l7 
sllx %l7, 32, %l7 
stx %l7, [%i1 + 512 ] 
add   %l4, 1, %l4

P2595: !BLD [12] (FP) (Branch target of P2699)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8
ba P2596
nop

TARGET2699:
ba RET2699
nop


P2596: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P2597: !BST [14] (maybe <- 0x42000007) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P2598: !BST [5] (maybe <- 0x42000008) (FP) (Branch target of P3047)
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
ba P2599
nop

TARGET3047:
ba RET3047
nop


P2599: !BST [12] (maybe <- 0x4200000b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P2600: !DWLD [10] (Int)
ldx [%i2 + 32], %o0
! move %o0(upper) -> %o0(upper)

P2601: !DWST [6] (maybe <- 0x2800002) (Int) (CBR)
sllx %l4, 32, %l3 
add   %l4, 1, %l4
or %l3, %l4, %l3
stx %l3, [%i1 + 80]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2601
nop
RET2601:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P2602: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P2603: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P2604: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P2605: !BLD [2] (FP)
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

P2606: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P2607: !BLD [0] (FP)
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

P2608: !BLD [8] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2608
nop
RET2608:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P2609: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P2610: !DWST [15] (maybe <- 0x2800004) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 192 ] 
add   %l4, 1, %l4

P2611: !ST [8] (maybe <- 0x2800005) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P2612: !BST [2] (maybe <- 0x4200000c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2613: !CAS [13] (maybe <- 0x2800006) (Int)
add %i3, 64, %o5
lduw [%o5], %l6
mov %l6, %l7
! move %l7(lower) -> %o0(lower)
srlx %o0, 32, %o0
sllx %o0, 32, %o0
or %l7, %o0, %o0
mov %l4, %o1
cas [%o5], %l7, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P2614: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P2615: !BLD [5] (FP)
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

P2616: !ST [10] (maybe <- 0x2800007) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P2617: !BST [3] (maybe <- 0x42000010) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2618: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P2619: !BST [14] (maybe <- 0x42000014) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P2620: !BST [13] (maybe <- 0x42000015) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P2621: !BST [3] (maybe <- 0x42000016) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2622: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P2623: !CAS [8] (maybe <- 0x2800008) (Int)
add %i1, 256, %l7
lduw [%l7], %l3
mov %l3, %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1
mov %l4, %o2
cas [%l7], %l6, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P2624: !BST [2] (maybe <- 0x4200001a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2625: !BST [7] (maybe <- 0x4200001e) (FP)
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

P2626: !BLD [5] (FP)
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

P2627: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P2628: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P2629: !PREFETCH [9] (Int) (CBR)
prefetch [%i1 + 512], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2629
nop
RET2629:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P2630: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P2631: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P2632: !LD [5] (Int)
lduw [%i1 + 76], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2

P2633: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P2634: !BST [14] (maybe <- 0x42000021) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P2635: !DWLD [2] (Int)
ldx [%i0 + 8], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P2636: !ST [3] (maybe <- 0x2800009) (Int) (CBR)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2636
nop
RET2636:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P2637: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P2638: !BST [3] (maybe <- 0x42000022) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2639: !BST [4] (maybe <- 0x42000026) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P2640: !BST [2] (maybe <- 0x42000027) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2641: !BST [8] (maybe <- 0x4200002b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P2642: !BLD [7] (FP)
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

P2643: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P2644: !REPLACEMENT [2] (Int)
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

P2645: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P2646: !NOP (Int)
nop

P2647: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P2648: !PREFETCH [15] (Int) (CBR)
prefetch [%i3 + 192], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2648
nop
RET2648:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P2649: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P2650: !BST [2] (maybe <- 0x4200002c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2651: !ST [7] (maybe <- 0x280000a) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P2652: !BST [4] (maybe <- 0x42000030) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P2653: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P2654: !BST [14] (maybe <- 0x42000031) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P2655: !BLD [1] (FP)
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

P2656: !BLD [2] (FP)
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

P2657: !BST [15] (maybe <- 0x42000032) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P2658: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P2659: !DWLD [7] (Int)
ldx [%i1 + 80], %o5
! move %o5(upper) -> %o3(lower)
srlx %o5, 32, %l7
or %l7, %o3, %o3
! move %o5(lower) -> %o4(upper)
sllx %o5, 32, %o4

P2660: !BLD [1] (FP)
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

P2661: !BST [1] (maybe <- 0x42000033) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2662: !BLD [1] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f0
membar #Sync 
! 4 addresses covered
fmovs %f3, %f2
fmovs %f8, %f3

P2663: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P2664: !REPLACEMENT [10] (Int)
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

P2665: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P2666: !CAS [13] (maybe <- 0x280000b) (Int)
add %i3, 64, %o5
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

P2667: !BST [8] (maybe <- 0x42000037) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P2668: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P2669: !BST [9] (maybe <- 0x42000038) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P2670: !BST [15] (maybe <- 0x42000039) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P2671: !BST [13] (maybe <- 0x4200003a) (FP) (Branch target of P3046)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 
ba P2672
nop

TARGET3046:
ba RET3046
nop


P2672: !BST [7] (maybe <- 0x4200003b) (FP)
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

P2673: !BST [14] (maybe <- 0x4200003e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P2674: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P2675: !MEMBAR (Int)
membar #StoreLoad

P2676: !PREFETCH [14] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i3 + 128] %asi, 1

P2677: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P2678: !BST [10] (maybe <- 0x4200003f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P2679: !REPLACEMENT [3] (Int)
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

P2680: !NOP (Int) (CBR)
nop

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2680
nop
RET2680:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P2681: !DWST [1] (maybe <- 0x280000c) (Int)
sllx %l4, 32, %o5 
add   %l4, 1, %l4
or %o5, %l4, %o5
stx %o5, [%i0 + 0]
add   %l4, 1, %l4

P2682: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P2683: !REPLACEMENT [13] (Int)
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

P2684: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P2685: !BLD [2] (FP)
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

P2686: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P2687: !BST [1] (maybe <- 0x42000040) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2688: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P2689: !DWLD [13] (Int)
ldx [%i3 + 64], %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l3
or %l3, %o0, %o0

P2690: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P2691: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P2692: !PREFETCH [13] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i3 + 64] %asi, 1

P2693: !PREFETCH [0] (Int) (Branch target of P2648)
prefetch [%i0 + 0], 1
ba P2694
nop

TARGET2648:
ba RET2648
nop


P2694: !BLD [2] (FP) (Branch target of P2726)
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
ba P2695
nop

TARGET2726:
ba RET2726
nop


P2695: !BST [7] (maybe <- 0x42000044) (FP)
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

P2696: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P2697: !BST [14] (maybe <- 0x42000047) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P2698: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P2699: !DWLD [12] (Int) (CBR)
ldx [%i3 + 0], %o1
! move %o1(upper) -> %o1(upper)

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2699
nop
RET2699:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P2700: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f0
membar #Sync 
! 1 addresses covered

P2701: !BST [4] (maybe <- 0x42000048) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P2702: !BLD [3] (FP)
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

P2703: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P2704: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P2705: !REPLACEMENT [11] (Int)
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

P2706: !BST [11] (maybe <- 0x42000049) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P2707: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P2708: !DWST [0] (maybe <- 0x280000e) (Int)
sllx %l4, 32, %l3 
add   %l4, 1, %l4
or %l3, %l4, %l3
stx %l3, [%i0 + 0]
add   %l4, 1, %l4

P2709: !DWST [15] (maybe <- 0x4200004a) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
std %f20, [%i3 + 192]

P2710: !BLD [7] (FP) (Branch target of P2608)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f5
fmovd %f36, %f6
ba P2711
nop

TARGET2608:
ba RET2608
nop


P2711: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P2712: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P2713: !CASX [7] (maybe <- 0x2800010) (Int)
add %i1, 80, %o5
ldx [%o5], %l6
! move %l6(upper) -> %o1(lower)
srlx %o1, 32, %o1
sllx %o1, 32, %o1
srlx %l6, 32, %l7
or %l7, %o1, %o1
! move %l6(lower) -> %o2(upper)
sllx %l6, 32, %o2
mov %l6, %l7
sllx %l4, 32, %l6
add  %l4, 1, %l4
or   %l4, %l6, %l6
casx [%o5], %l7, %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %o5
or %o5, %o2, %o2
! move %l6(lower) -> %o3(upper)
sllx %l6, 32, %o3
add  %l4, 1, %l4

P2714: !DWST [5] (maybe <- 0x2800012) (Int)
mov %l4, %l7 
stx %l7, [%i1 + 72]
add   %l4, 1, %l4

P2715: !BST [4] (maybe <- 0x4200004b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P2716: !BLD [11] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2716
nop
RET2716:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P2717: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P2718: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P2719: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P2720: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P2721: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P2722: !SWAP [14] (maybe <- 0x2800013) (Int)
mov %l4, %o5
swap  [%i3 + 128], %o5
! move %o5(lower) -> %o3(lower)
srl %o5, 0, %l6
or %l6, %o3, %o3
add   %l4, 1, %l4

P2723: !BST [8] (maybe <- 0x4200004c) (FP) (Branch target of P2716)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 
ba P2724
nop

TARGET2716:
ba RET2716
nop


P2724: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P2725: !BLD [5] (FP)
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

P2726: !CASX [11] (maybe <- 0x2800014) (Int) (CBR)
add %i2, 64, %l3
ldx [%l3], %o4
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5
mov  %o4, %o5
sllx %l4, 32, %o0
casx [%l3], %o5, %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
add  %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2726
nop
RET2726:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P2727: !BST [5] (maybe <- 0x4200004d) (FP)
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

P2728: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P2729: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P2730: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P2731: !BST [0] (maybe <- 0x42000050) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2732: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P2733: !BST [1] (maybe <- 0x42000054) (FP) (Branch target of P2746)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 
ba P2734
nop

TARGET2746:
ba RET2746
nop


P2734: !MEMBAR (Int)
membar #StoreLoad

P2735: !BST [12] (maybe <- 0x42000058) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P2736: !BLD [3] (FP) (Branch target of P2963)
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
ba P2737
nop

TARGET2963:
ba RET2963
nop


P2737: !BST [15] (maybe <- 0x42000059) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P2738: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P2739: !PREFETCH [2] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i0 + 12] %asi, 1

P2740: !ST [4] (maybe <- 0x2800015) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P2741: !BST [5] (maybe <- 0x4200005a) (FP)
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

P2742: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f7

P2743: !BST [10] (maybe <- 0x4200005d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P2744: !BST [4] (maybe <- 0x4200005e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P2745: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P2746: !BLD [11] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2746
nop
RET2746:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P2747: !BST [3] (maybe <- 0x4200005f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2748: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P2749: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P2750: !REPLACEMENT [6] (Int)
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

P2751: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P2752: !BST [8] (maybe <- 0x42000063) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P2753: !BST [1] (maybe <- 0x42000064) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2754: !BST [8] (maybe <- 0x42000068) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P2755: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P2756: !MEMBAR (Int)
membar #StoreLoad

P2757: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P2758: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P2759: !BST [2] (maybe <- 0x42000069) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2760: !MEMBAR (Int)
membar #StoreLoad

P2761: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P2762: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f11
fmovd %f36, %f12

P2763: !BLD [7] (FP)
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

P2764: !BST [6] (maybe <- 0x4200006d) (FP)
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

P2765: !BST [0] (maybe <- 0x42000070) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2766: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f36, %f2

P2767: !BST [12] (maybe <- 0x42000074) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P2768: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P2769: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f5
fmovd %f36, %f6

P2770: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P2771: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P2772: !BLD [0] (FP)
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

P2773: !BST [3] (maybe <- 0x42000075) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2774: !BST [8] (maybe <- 0x42000079) (FP) (Branch target of P2999)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 
ba P2775
nop

TARGET2999:
ba RET2999
nop


P2775: !BST [0] (maybe <- 0x4200007a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2776: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f14

P2777: !BST [10] (maybe <- 0x4200007e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P2778: !BST [6] (maybe <- 0x4200007f) (FP)
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

P2779: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P2780: !BLD [4] (FP)
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

P2781: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f0
membar #Sync 
! 3 addresses covered
fmovs %f3, %f0
fmovs %f4, %f1
fmovs %f5, %f2

P2782: !BST [6] (maybe <- 0x42000082) (FP)
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

P2783: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P2784: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P2785: !BST [8] (maybe <- 0x42000085) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P2786: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P2787: !BST [10] (maybe <- 0x42000086) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P2788: !BST [1] (maybe <- 0x42000087) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2789: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P2790: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P2791: !LD [7] (Int) (CBR)
lduw [%i1 + 84], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2791
nop
RET2791:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P2792: !BST [11] (maybe <- 0x4200008b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P2793: !BLD [7] (FP)
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

P2794: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P2795: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P2796: !CAS [2] (maybe <- 0x2800016) (Int)
add %i0, 12, %l6
lduw [%l6], %o5
mov %o5, %l3
! move %l3(lower) -> %o1(lower)
or %l3, %o1, %o1
mov %l4, %o2
cas [%l6], %l3, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P2797: !LD [7] (Int)
lduw [%i1 + 84], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2

P2798: !BST [7] (maybe <- 0x4200008c) (FP)
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

P2799: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P2800: !MEMBAR (Int)
membar #StoreLoad

P2801: !BST [5] (maybe <- 0x4200008f) (FP)
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

P2802: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P2803: !BLD [1] (FP)
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

P2804: !PREFETCH [13] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i3 + 64] %asi, 1

P2805: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P2806: !DWLD [2] (FP)
ldd [%i0 + 8], %f0
! 1 addresses covered
fmovs %f1, %f0

P2807: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P2808: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P2809: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P2810: !BST [13] (maybe <- 0x42000092) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P2811: !BST [12] (maybe <- 0x42000093) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P2812: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P2813: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P2814: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P2815: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P2816: !BST [2] (maybe <- 0x42000094) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2817: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P2818: !ST [11] (maybe <- 0x42000098) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i2 + 64 ]

P2819: !BST [6] (maybe <- 0x42000099) (FP)
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

P2820: !LD [7] (FP)
ld [%i1 + 84], %f6
! 1 addresses covered

P2821: !BST [11] (maybe <- 0x4200009c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P2822: !LD [8] (Int)
lduw [%i1 + 256], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P2823: !BST [5] (maybe <- 0x4200009d) (FP)
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

P2824: !BST [12] (maybe <- 0x420000a0) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P2825: !PREFETCH [13] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i3 + 64] %asi, 1

P2826: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P2827: !DWST [6] (maybe <- 0x2800017) (Int)
sllx %l4, 32, %l7 
add   %l4, 1, %l4
or %l7, %l4, %l7
stx %l7, [%i1 + 80]
add   %l4, 1, %l4

P2828: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P2829: !BST [8] (maybe <- 0x420000a1) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P2830: !BST [6] (maybe <- 0x420000a2) (FP)
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

P2831: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P2832: !BST [3] (maybe <- 0x420000a5) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2833: !BST [0] (maybe <- 0x420000a9) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2834: !BLD [13] (FP) (Branch target of P2849)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8
ba P2835
nop

TARGET2849:
ba RET2849
nop


P2835: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P2836: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P2837: !MEMBAR (Int)
membar #StoreLoad

P2838: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P2839: !BST [13] (maybe <- 0x420000ad) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P2840: !BST [0] (maybe <- 0x420000ae) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2841: !BLD [7] (FP)
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

P2842: !BLD [0] (FP)
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

P2843: !LD [14] (FP)
ld [%i3 + 128], %f1
! 1 addresses covered

P2844: !BST [13] (maybe <- 0x420000b2) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P2845: !CAS [0] (maybe <- 0x2800019) (Int)
add %i0, 0, %o5
lduw [%o5], %l6
mov %l6, %l7
! move %l7(lower) -> %o3(lower)
or %l7, %o3, %o3
mov %l4, %o4
cas [%o5], %l7, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P2846: !BST [9] (maybe <- 0x420000b3) (FP) (Branch target of P3028)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 
ba P2847
nop

TARGET3028:
ba RET3028
nop


P2847: !BLD [1] (FP)
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

P2848: !CAS [15] (maybe <- 0x280001a) (Int)
add %i3, 192, %l7
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

P2849: !PREFETCH [13] (Int) (CBR)
prefetch [%i3 + 64], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2849
nop
RET2849:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P2850: !BST [12] (maybe <- 0x420000b4) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P2851: !PREFETCH [8] (Int) (Branch target of P3087)
prefetch [%i1 + 256], 1
ba P2852
nop

TARGET3087:
ba RET3087
nop


P2852: !BST [1] (maybe <- 0x420000b5) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2853: !BST [8] (maybe <- 0x420000b9) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P2854: !BST [0] (maybe <- 0x420000ba) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2855: !BLD [5] (FP) (Branch target of P3024)
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
ba P2856
nop

TARGET3024:
ba RET3024
nop


P2856: !REPLACEMENT [12] (Int)
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

P2857: !LD [3] (FP)
ld [%i0 + 32], %f9
! 1 addresses covered

P2858: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P2859: !BST [13] (maybe <- 0x420000be) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P2860: !BST [6] (maybe <- 0x420000bf) (FP)
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

P2861: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P2862: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P2863: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P2864: !BLD [2] (FP)
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

P2865: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f0
membar #Sync 
! 1 addresses covered

P2866: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f1

P2867: !BLD [5] (FP)
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

P2868: !REPLACEMENT [12] (Int)
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

P2869: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P2870: !BLD [0] (FP) (CBR)
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

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2870
nop
RET2870:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P2871: !BLD [6] (FP)
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

P2872: !BLD [0] (FP)
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

P2873: !BST [0] (maybe <- 0x420000c2) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2874: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P2875: !BST [12] (maybe <- 0x420000c6) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P2876: !BLD [3] (FP)
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

P2877: !BLD [11] (FP) (Branch target of P2601)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6
ba P2878
nop

TARGET2601:
ba RET2601
nop


P2878: !PREFETCH [11] (Int) (Branch target of P2914)
prefetch [%i2 + 64], 1
ba P2879
nop

TARGET2914:
ba RET2914
nop


P2879: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f36, %f8

P2880: !LD [13] (Int)
lduw [%i3 + 64], %l7
! move %l7(lower) -> %o0(lower)
or %l7, %o0, %o0

P2881: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P2882: !CAS [1] (maybe <- 0x280001b) (Int)
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

P2883: !BST [11] (maybe <- 0x420000c7) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P2884: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f11
fmovd %f36, %f12

P2885: !BLD [2] (FP)
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

P2886: !PREFETCH [10] (Int) (Branch target of P2636)
prefetch [%i2 + 32], 1
ba P2887
nop

TARGET2636:
ba RET2636
nop


P2887: !PREFETCH [5] (Int) (Branch target of P3037)
prefetch [%i1 + 76], 1
ba P2888
nop

TARGET3037:
ba RET3037
nop


P2888: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P2889: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P2890: !BLD [3] (FP)
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

P2891: !REPLACEMENT [3] (Int)
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

P2892: !PREFETCH [11] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i2 + 64] %asi, 1

P2893: !BLD [1] (FP)
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

P2894: !MEMBAR (Int)
membar #StoreLoad

P2895: !BST [12] (maybe <- 0x420000c8) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P2896: !BST [9] (maybe <- 0x420000c9) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P2897: !BST [4] (maybe <- 0x420000ca) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P2898: !BST [3] (maybe <- 0x420000cb) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2899: !BST [0] (maybe <- 0x420000cf) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2900: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f11

P2901: !BST [4] (maybe <- 0x420000d3) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P2902: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P2903: !BLD [1] (FP)
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

P2904: !LD [3] (Int)
lduw [%i0 + 32], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P2905: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P2906: !BST [12] (maybe <- 0x420000d4) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P2907: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P2908: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P2909: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P2910: !BST [15] (maybe <- 0x420000d5) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P2911: !BLD [14] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2911
nop
RET2911:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P2912: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P2913: !DWLD [12] (Int)
ldx [%i3 + 0], %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l3
or %l3, %o2, %o2

P2914: !PREFETCH [13] (Int) (CBR)
prefetch [%i3 + 64], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2914
nop
RET2914:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P2915: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P2916: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P2917: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P2918: !BLD [2] (FP)
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

P2919: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f9

P2920: !BST [11] (maybe <- 0x420000d6) (FP) (Branch target of P2911)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 
ba P2921
nop

TARGET2911:
ba RET2911
nop


P2921: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P2922: !BST [15] (maybe <- 0x420000d7) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P2923: !LD [8] (Int)
lduw [%i1 + 256], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P2924: !BLD [3] (FP)
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

P2925: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P2926: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P2927: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P2928: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P2929: !BST [6] (maybe <- 0x420000d8) (FP)
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

P2930: !BST [0] (maybe <- 0x420000db) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2931: !BST [4] (maybe <- 0x420000df) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P2932: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P2933: !BLD [9] (FP)
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

P2934: !PREFETCH [14] (Int) (Branch target of P2870)
prefetch [%i3 + 128], 1
ba P2935
nop

TARGET2870:
ba RET2870
nop


P2935: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P2936: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f0
membar #Sync 
! 3 addresses covered
fmovs %f3, %f0
fmovs %f4, %f1
fmovs %f5, %f2

P2937: !BST [6] (maybe <- 0x420000e0) (FP)
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

P2938: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P2939: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P2940: !CASX [2] (maybe <- 0x280001c) (Int)
add %i0, 8, %l3
ldx [%l3], %l7
! move %l7(upper) -> %o3(lower)
srlx %l7, 32, %o5
or %o5, %o3, %o3
! move %l7(lower) -> %o4(upper)
sllx %l7, 32, %o4
mov  %l7, %o5
mov %l4, %l7
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

P2941: !CASX [13] (maybe <- 0x280001d) (Int)
add %i3, 64, %l3
ldx [%l3], %l7
! move %l7(upper) -> %o0(lower)
srlx %l7, 32, %o5
or %o5, %o0, %o0
! move %l7(lower) -> %o1(upper)
sllx %l7, 32, %o1
mov  %l7, %o5
sllx %l4, 32, %l7
casx [%l3], %o5, %l7
! move %l7(upper) -> %o1(lower)
srlx %l7, 32, %l3
or %l3, %o1, %o1
! move %l7(lower) -> %o2(upper)
sllx %l7, 32, %o2
add  %l4, 1, %l4

P2942: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P2943: !PREFETCH [9] (Int) (CBR)
prefetch [%i1 + 512], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2943
nop
RET2943:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P2944: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P2945: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P2946: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P2947: !BST [5] (maybe <- 0x420000e3) (FP)
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

P2948: !DWLD [3] (Int)
ldx [%i0 + 32], %l3
! move %l3(upper) -> %o2(lower)
srlx %l3, 32, %o5
or %o5, %o2, %o2

P2949: !BST [7] (maybe <- 0x420000e6) (FP)
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

P2950: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P2951: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P2952: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P2953: !LD [8] (Int)
lduw [%i1 + 256], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P2954: !LD [5] (Int)
lduw [%i1 + 76], %o5
! move %o5(lower) -> %o3(lower)
or %o5, %o3, %o3

P2955: !BST [8] (maybe <- 0x420000e9) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P2956: !BST [9] (maybe <- 0x420000ea) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P2957: !SWAP [13] (maybe <- 0x280001e) (Int)
mov %l4, %o4
swap  [%i3 + 64], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P2958: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P2959: !BLD [5] (FP)
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

P2960: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P2961: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P2962: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P2963: !BLD [15] (FP) (CBR) (Branch target of P3069)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2963
nop
RET2963:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0

ba P2964
nop

TARGET3069:
ba RET3069
nop


P2964: !BLD [1] (FP)
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

P2965: !BLD [3] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f0
membar #Sync 
! 4 addresses covered
fmovs %f3, %f2
fmovs %f8, %f3

P2966: !BST [11] (maybe <- 0x420000eb) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P2967: !BLD [12] (FP) (Branch target of P2680)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4
ba P2968
nop

TARGET2680:
ba RET2680
nop


P2968: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P2969: !CAS [10] (maybe <- 0x280001f) (Int)
add %i2, 32, %l7
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

P2970: !BST [13] (maybe <- 0x420000ec) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P2971: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P2972: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f5
fmovd %f36, %f6

P2973: !BST [9] (maybe <- 0x420000ed) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P2974: !BST [3] (maybe <- 0x420000ee) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2975: !BST [8] (maybe <- 0x420000f2) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P2976: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P2977: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P2978: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P2979: !BST [9] (maybe <- 0x420000f3) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P2980: !DWST [6] (maybe <- 0x2800020) (Int) (Branch target of P2629)
sllx %l4, 32, %l3 
add   %l4, 1, %l4
or %l3, %l4, %l3
stx %l3, [%i1 + 80]
add   %l4, 1, %l4
ba P2981
nop

TARGET2629:
ba RET2629
nop


P2981: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P2982: !BST [9] (maybe <- 0x420000f4) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P2983: !LD [11] (Int)
lduw [%i2 + 64], %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0

P2984: !BST [9] (maybe <- 0x420000f5) (FP) (Branch target of P3003)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 
ba P2985
nop

TARGET3003:
ba RET3003
nop


P2985: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P2986: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P2987: !BLD [5] (FP)
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

P2988: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P2989: !BST [8] (maybe <- 0x420000f6) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P2990: !BST [3] (maybe <- 0x420000f7) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2991: !DWST [7] (maybe <- 0x2800022) (Int)
sllx %l4, 32, %l6 
add   %l4, 1, %l4
or %l6, %l4, %l6
stx %l6, [%i1 + 80]
add   %l4, 1, %l4

P2992: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P2993: !BLD [1] (FP)
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

P2994: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P2995: !CAS [12] (maybe <- 0x2800024) (Int)
add %i3, 0, %l6
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

P2996: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P2997: !BLD [1] (FP)
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

P2998: !BST [8] (maybe <- 0x420000fb) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P2999: !BST [8] (maybe <- 0x420000fc) (FP) (CBR)
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
be,pt  %xcc, TARGET2999
nop
RET2999:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P3000: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P3001: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P3002: !DWST [10] (maybe <- 0x420000fd) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
std %f20, [%i2 + 32]

P3003: !BLD [2] (FP) (CBR)
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
be,pn  %xcc, TARGET3003
nop
RET3003:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P3004: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f11
fmovd %f36, %f12

P3005: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P3006: !BLD [3] (FP)
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

P3007: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P3008: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P3009: !LD [15] (Int)
lduw [%i3 + 192], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P3010: !ST [14] (maybe <- 0x2800025) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P3011: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P3012: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P3013: !PREFETCH [8] (Int) (Branch target of P2943)
prefetch [%i1 + 256], 1
ba P3014
nop

TARGET2943:
ba RET2943
nop


P3014: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f5
fmovd %f36, %f6

P3015: !BST [1] (maybe <- 0x420000fe) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3016: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P3017: !BLD [6] (FP)
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

P3018: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f11

P3019: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P3020: !REPLACEMENT [9] (Int)
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

P3021: !LD [8] (Int)
lduw [%i1 + 256], %o5
! move %o5(lower) -> %o2(lower)
or %o5, %o2, %o2

P3022: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P3023: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P3024: !PREFETCH [2] (Int) (CBR)
prefetch [%i0 + 12], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3024
nop
RET3024:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P3025: !BST [0] (maybe <- 0x42000102) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3026: !CASX [10] (maybe <- 0x2800026) (Int)
add %i2, 32, %l6
ldx [%l6], %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
mov  %o3, %l3
sllx %l4, 32, %o4
casx [%l6], %l3, %o4
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5
add  %l4, 1, %l4

P3027: !BST [9] (maybe <- 0x42000106) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P3028: !BLD [1] (FP) (CBR)
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
be,pn  %xcc, TARGET3028
nop
RET3028:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P3029: !BST [11] (maybe <- 0x42000107) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P3030: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f36, %f2

P3031: !CASX [7] (maybe <- 0x2800027) (Int) (LE)
sllx %l4, 32, %l3
add  %l4, 1, %l4
or   %l4, %l3, %l3
! Change double-word-level endianess (big endian <-> little endian) 
sethi %hi(0xff00ff00), %o5
or %o5, %lo(0xff00ff00), %o5
sllx %o5, 32, %l6
or %o5, %l6, %o5 
and %l3, %o5, %l6
srlx %l6, 8, %l6
sllx %l3, 8, %l3
and %l3, %o5, %l3
or %l3, %l6, %l3 
sethi %hi(0xffff0000), %o5
or %o5, %lo(0xffff0000), %o5
srlx %l3, 16, %l6
andn %l6, %o5, %l6
andn %l3, %o5, %l3
sllx %l3, 16, %l3
or %l3, %l6, %l3 
srlx %l3, 32, %l6
sllx %l3, 32, %l3
or %l3, %l6, %l6 
wr %g0, 0x88, %asi
add %i1, 80, %l3
ldxa [%l3] %asi, %l7
! move %l7(lower) -> %o0(upper)
sllx %l7, 32, %o0
! move %l7(upper) -> %o0(lower)
srlx %l7, 32, %o5
or %o5, %o0, %o0
mov %l7, %o5
mov  %l6, %l7
casxa [%l3] %asi, %o5, %l7
! move %l7(lower) -> %o1(upper)
sllx %l7, 32, %o1
! move %l7(upper) -> %o1(lower)
srlx %l7, 32, %l3
or %l3, %o1, %o1
add  %l4, 1, %l4

P3032: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P3033: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P3034: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P3035: !BST [1] (maybe <- 0x42000108) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3036: !SWAP [14] (maybe <- 0x2800029) (Int)
mov %l4, %o2
swap  [%i3 + 128], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P3037: !REPLACEMENT [2] (Int) (CBR)
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

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3037
nop
RET3037:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P3038: !BST [9] (maybe <- 0x4200010c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P3039: !BLD [9] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3039
nop
RET3039:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P3040: !BST [6] (maybe <- 0x4200010d) (FP)
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

P3041: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P3042: !CAS [2] (maybe <- 0x280002a) (Int)
add %i0, 12, %l6
lduw [%l6], %o5
mov %o5, %l3
! move %l3(lower) -> %o2(lower)
or %l3, %o2, %o2
mov %l4, %o3
cas [%l6], %l3, %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P3043: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P3044: !MEMBAR (Int)
membar #StoreLoad

P3045: !BLD [0] (FP)
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

P3046: !BLD [3] (FP) (CBR)
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
be,pt  %xcc, TARGET3046
nop
RET3046:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P3047: !BST [10] (maybe <- 0x42000110) (FP) (CBR)
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
be,pt  %xcc, TARGET3047
nop
RET3047:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P3048: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f1

P3049: !BLD [3] (FP)
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

P3050: !BLD [2] (FP)
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

P3051: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P3052: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f11
fmovd %f36, %f12

P3053: !LD [3] (Int)
lduw [%i0 + 32], %l7
! move %l7(lower) -> %o3(lower)
or %l7, %o3, %o3

P3054: !BST [11] (maybe <- 0x42000111) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P3055: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P3056: !BLD [3] (FP)
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

P3057: !BLD [2] (FP)
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

P3058: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f7

P3059: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P3060: !BLD [0] (FP)
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

P3061: !BST [15] (maybe <- 0x42000112) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P3062: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P3063: !BLD [0] (FP)
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

P3064: !BST [2] (maybe <- 0x42000113) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3065: !REPLACEMENT [5] (Int)
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

P3066: !BST [1] (maybe <- 0x42000117) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3067: !BLD [7] (FP)
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

P3068: !REPLACEMENT [6] (Int)
sethi %hi(0x50), %l7
or %l7, %lo(0x50),  %l7
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

P3069: !DWLD [8] (Int) (CBR)
ldx [%i1 + 256], %o4
! move %o4(upper) -> %o4(upper)

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3069
nop
RET3069:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P3070: !DWLD [7] (Int)
ldx [%i1 + 80], %l6
! move %l6(upper) -> %o4(lower)
srlx %o4, 32, %o4
sllx %o4, 32, %o4
srlx %l6, 32, %l3
or %l3, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0

P3071: !CAS [6] (maybe <- 0x280002b) (Int) (Branch target of P3075)
add %i1, 80, %o5
lduw [%o5], %l6
mov %l6, %l7
! move %l7(lower) -> %o0(lower)
or %l7, %o0, %o0
mov %l4, %o1
cas [%o5], %l7, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4
ba P3072
nop

TARGET3075:
ba RET3075
nop


P3072: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P3073: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P3074: !BLD [0] (FP)
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

P3075: !BLD [1] (FP) (CBR)
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

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3075
nop
RET3075:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P3076: !BLD [0] (FP)
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

P3077: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P3078: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P3079: !BST [11] (maybe <- 0x4200011b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P3080: !MEMBAR (Int)
membar #StoreLoad

P3081: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P3082: !BLD [3] (FP)
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

P3083: !BLD [7] (FP)
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

P3084: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P3085: !BST [2] (maybe <- 0x4200011c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3086: !MEMBAR (Int)
membar #StoreLoad

P3087: !LD [0] (Int) (CBR)
lduw [%i0 + 0], %l7
! move %l7(lower) -> %o1(lower)
or %l7, %o1, %o1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3087
nop
RET3087:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P3088: !LD [1] (Int)
lduw [%i0 + 4], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P3089: !LD [2] (Int)
lduw [%i0 + 12], %o5
! move %o5(lower) -> %o2(lower)
or %o5, %o2, %o2

P3090: !LD [3] (Int) (Branch target of P2791)
lduw [%i0 + 32], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
ba P3091
nop

TARGET2791:
ba RET2791
nop


P3091: !LD [4] (Int)
lduw [%i0 + 64], %o5
! move %o5(lower) -> %o3(lower)
or %o5, %o3, %o3

P3092: !LD [5] (Int)
lduw [%i1 + 76], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P3093: !LD [6] (Int)
lduw [%i1 + 80], %o5
! move %o5(lower) -> %o4(lower)
or %o5, %o4, %o4
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
lduw [%i1 + 256], %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0

P3096: !LD [9] (Int)
lduw [%i1 + 512], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P3097: !LD [10] (Int) (LE)
wr %g0, 0x88, %asi
lduwa [%i2 + 32] %asi, %o5
! move %o5(lower) -> %o1(lower)
or %o5, %o1, %o1

P3098: !LD [11] (Int)
lduw [%i2 + 64], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P3099: !LD [12] (Int)
lduw [%i3 + 0], %o5
! move %o5(lower) -> %o2(lower)
or %o5, %o2, %o2

P3100: !LD [13] (Int) (Branch target of P3039)
lduw [%i3 + 64], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
ba P3101
nop

TARGET3039:
ba RET3039
nop


P3101: !LD [14] (Int)
lduw [%i3 + 128], %o5
! move %o5(lower) -> %o3(lower)
or %o5, %o3, %o3

P3102: !LD [15] (Int)
lduw [%i3 + 192], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

END_NODES5: ! Test istream for CPU 5 ends
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
ld [%i5], %f9
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
sethi %hi(0x06deade1), %l6
or    %l6, %lo(0x06deade1), %l6
stw %l6, [%i5] 
ld [%i5], %f16

! Initialize running integer counter in register %l4
sethi %hi(0x3000001), %l4
or    %l4, %lo(0x3000001), %l4

! Initialize running FP counter in register %f16
sethi %hi(0x42800001), %l6
or    %l6, %lo(0x42800001), %l6
stw %l6, [%i5] 
ld [%i5], %f16

! Initialize FP counter increment value in register %f17 (constant)
sethi %hi(0x37000000), %l6
or    %l6, %lo(0x37000000), %l6
stw %l6, [%i5] 
ld [%i5], %f17 

! Initialize LFSR to 0xa45^4
sethi %hi(0xa45), %l0
or    %l0, %lo(0xa45), %l0
mulx  %l0, %l0, %l0
mulx  %l0, %l0, %l0

!-- init shared addrs 12 to 13 ---
stx %g0, [%i3+0]
stx %g0, [%i3+64]

! use untouched cache-line (offset 4K) in replacement area for sync
sub %i1, %i0, %l7
add %i3, %l7, %l7
sub %l7, -4096, %l7

!-- begin of sync_init ---
or %g0, 1, %o5
or %g0, %o5, %l3
swap [%l7+4], %l3
membar #Sync
sync_init_1_6:
brnz,pt %o5, sync_init_1_6
lduw [%l7+4], %o5 ! delay slot
sync_init_2_6:
lduw [%l7], %o5
sub %o5, 1, %l3
cas [%l7], %o5, %l3
cmp %o5, %l3
bne,pt %xcc, sync_init_2_6
nop
membar #Sync
sync_init_3_6:
lduw [%l7], %o5 ! delay slot
brnz,pt %o5, sync_init_3_6
nop
!-- end of sync_init ---


BEGIN_NODES6: ! Test istream for CPU 6 begins

P3103: !DWLD [11] (FP)
ldd [%i2 + 64], %f0
! 1 addresses covered

P3104: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f1

P3105: !BLD [0] (FP)
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

P3106: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P3107: !BST [7] (maybe <- 0x42800001) (FP)
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

P3108: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P3109: !BST [7] (maybe <- 0x42800004) (FP)
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

P3110: !BST [2] (maybe <- 0x42800007) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3111: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P3112: !DWLD [2] (Int)
ldx [%i0 + 8], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P3113: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f36, %f8

P3114: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P3115: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P3116: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P3117: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P3118: !REPLACEMENT [2] (Int)
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

P3119: !PREFETCH [6] (Int) (CBR)
prefetch [%i1 + 80], 1

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


P3120: !BST [0] (maybe <- 0x4280000b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3121: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P3122: !BLD [6] (FP)
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

P3123: !BST [11] (maybe <- 0x4280000f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P3124: !BLD [15] (FP)
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

P3125: !CASX [5] (maybe <- 0x3000001) (Int)
add %i1, 72, %o5
ldx [%o5], %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l7
or %l7, %o0, %o0
! move %l6(lower) -> %o1(upper)
sllx %l6, 32, %o1
mov  %l6, %l7
mov %l4, %l6
casx [%o5], %l7, %l6
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %o5
or %o5, %o1, %o1
! move %l6(lower) -> %o2(upper)
sllx %l6, 32, %o2
add  %l4, 1, %l4

P3126: !BLD [1] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f0
membar #Sync 
! 4 addresses covered
fmovs %f3, %f2
fmovs %f8, %f3

P3127: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P3128: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P3129: !DWLD [9] (FP)
ldd [%i1 + 512], %f6
! 1 addresses covered

P3130: !DWLD [0] (Int)
ldx [%i0 + 0], %o5
! move %o5(upper) -> %o2(lower)
srlx %o5, 32, %l7
or %l7, %o2, %o2
! move %o5(lower) -> %o3(upper)
sllx %o5, 32, %o3

P3131: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P3132: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P3133: !BST [2] (maybe <- 0x42800010) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3134: !DWLD [5] (Int)
ldx [%i1 + 72], %l3
! move %l3(lower) -> %o3(lower)
srl %l3, 0, %o5
or %o5, %o3, %o3

P3135: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P3136: !BST [4] (maybe <- 0x42800014) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P3137: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P3138: !BST [8] (maybe <- 0x42800015) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P3139: !LD [15] (Int)
lduw [%i3 + 192], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P3140: !ST [3] (maybe <- 0x3000002) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P3141: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P3142: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P3143: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f10

P3144: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P3145: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P3146: !MEMBAR (Int)
membar #StoreLoad

P3147: !BST [1] (maybe <- 0x42800016) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3148: !DWST [0] (maybe <- 0x3000003) (Int)
sllx %l4, 32, %o5 
add   %l4, 1, %l4
or %o5, %l4, %o5
stx %o5, [%i0 + 0]
add   %l4, 1, %l4

P3149: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P3150: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P3151: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P3152: !BST [0] (maybe <- 0x4280001a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3153: !BLD [1] (FP)
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

P3154: !BLD [4] (FP) (CBR) (Branch target of P3177)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3154
nop
RET3154:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0

ba P3155
nop

TARGET3177:
ba RET3177
nop


P3155: !BLD [7] (FP)
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

P3156: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P3157: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P3158: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P3159: !BST [2] (maybe <- 0x4280001e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3160: !BST [5] (maybe <- 0x42800022) (FP)
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

P3161: !BST [1] (maybe <- 0x42800025) (FP) (Branch target of P3464)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 
ba P3162
nop

TARGET3464:
ba RET3464
nop


P3162: !BST [2] (maybe <- 0x42800029) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3163: !ST [15] (maybe <- 0x4280002d) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i3 + 192 ]

P3164: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P3165: !BLD [3] (FP)
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

P3166: !BST [6] (maybe <- 0x4280002e) (FP)
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

P3167: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P3168: !BST [5] (maybe <- 0x42800031) (FP)
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

P3169: !PREFETCH [5] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i1 + 76] %asi, 1

P3170: !BST [10] (maybe <- 0x42800034) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P3171: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P3172: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P3173: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P3174: !BST [0] (maybe <- 0x42800035) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3175: !BLD [9] (FP) (Branch target of P3508)
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
ba P3176
nop

TARGET3508:
ba RET3508
nop


P3176: !BST [9] (maybe <- 0x42800039) (FP) (Branch target of P3403)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 
ba P3177
nop

TARGET3403:
ba RET3403
nop


P3177: !BST [11] (maybe <- 0x4280003a) (FP) (CBR) (Branch target of P3363)
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
be,pn  %xcc, TARGET3177
nop
RET3177:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0

ba P3178
nop

TARGET3363:
ba RET3363
nop


P3178: !BST [5] (maybe <- 0x4280003b) (FP)
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

P3179: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f0
membar #Sync 
! 1 addresses covered

P3180: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f36, %f2

P3181: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P3182: !DWLD [1] (FP)
ldd [%i0 + 0], %f18
! 2 addresses covered
fmovs %f18, %f5
fmovs %f19, %f6

P3183: !BST [13] (maybe <- 0x4280003e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P3184: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P3185: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P3186: !BST [9] (maybe <- 0x4280003f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P3187: !BST [7] (maybe <- 0x42800040) (FP) (Branch target of P3425)
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
ba P3188
nop

TARGET3425:
ba RET3425
nop


P3188: !REPLACEMENT [12] (Int) (Branch target of P3564)
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
ba P3189
nop

TARGET3564:
ba RET3564
nop


P3189: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f8

P3190: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P3191: !BST [10] (maybe <- 0x42800043) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P3192: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P3193: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P3194: !BLD [5] (FP)
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

P3195: !CAS [4] (maybe <- 0x3000005) (Int)
add %i0, 64, %o5
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

P3196: !BST [10] (maybe <- 0x42800044) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P3197: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P3198: !BLD [3] (FP) (CBR)
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
be,pt  %xcc, TARGET3198
nop
RET3198:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P3199: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P3200: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P3201: !BLD [0] (FP)
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

P3202: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P3203: !DWLD [11] (Int) (CBR)
ldx [%i2 + 64], %o5
! move %o5(upper) -> %o0(lower)
srlx %o5, 32, %l7
or %l7, %o0, %o0

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3203
nop
RET3203:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P3204: !BST [7] (maybe <- 0x42800045) (FP)
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

P3205: !BLD [2] (FP)
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

P3206: !REPLACEMENT [12] (Int)
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

P3207: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P3208: !PREFETCH [13] (Int) (CBR)
prefetch [%i3 + 64], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3208
nop
RET3208:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P3209: !DWST [0] (maybe <- 0x3000006) (Int)
sllx %l4, 32, %l3 
add   %l4, 1, %l4
or %l3, %l4, %l3
stx %l3, [%i0 + 0]
add   %l4, 1, %l4

P3210: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P3211: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P3212: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P3213: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P3214: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P3215: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P3216: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P3217: !BLD [1] (FP)
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

P3218: !BLD [3] (FP)
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

P3219: !BST [5] (maybe <- 0x42800048) (FP)
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

P3220: !BST [3] (maybe <- 0x4280004b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3221: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P3222: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P3223: !BST [0] (maybe <- 0x4280004f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3224: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P3225: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P3226: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P3227: !BST [6] (maybe <- 0x42800053) (FP)
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

P3228: !BST [6] (maybe <- 0x42800056) (FP)
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

P3229: !BLD [5] (FP)
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

P3230: !BST [8] (maybe <- 0x42800059) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P3231: !BST [14] (maybe <- 0x4280005a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P3232: !BST [14] (maybe <- 0x4280005b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P3233: !BST [7] (maybe <- 0x4280005c) (FP)
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

P3234: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P3235: !DWST [0] (maybe <- 0x3000008) (Int)
sllx %l4, 32, %l7 
add   %l4, 1, %l4
or %l7, %l4, %l7
stx %l7, [%i0 + 0]
add   %l4, 1, %l4

P3236: !BLD [2] (FP)
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

P3237: !BLD [0] (FP)
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

P3238: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P3239: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P3240: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P3241: !BLD [1] (FP)
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

P3242: !DWST [13] (maybe <- 0x300000a) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 64 ] 
add   %l4, 1, %l4

P3243: !CASX [4] (maybe <- 0x300000b) (Int)
add %i0, 64, %l6
ldx [%l6], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
mov  %o1, %l3
sllx %l4, 32, %o2
casx [%l6], %l3, %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
add  %l4, 1, %l4

P3244: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f36, %f8

P3245: !REPLACEMENT [2] (Int)
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

P3246: !BST [6] (maybe <- 0x4280005f) (FP)
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

P3247: !LD [5] (Int)
lduw [%i1 + 76], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P3248: !BST [7] (maybe <- 0x42800062) (FP)
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

P3249: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P3250: !BST [13] (maybe <- 0x42800065) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P3251: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P3252: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P3253: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P3254: !BST [7] (maybe <- 0x42800066) (FP)
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

P3255: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f11
fmovd %f36, %f12

P3256: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P3257: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P3258: !BST [7] (maybe <- 0x42800069) (FP)
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

P3259: !LD [9] (Int) (LE)
wr %g0, 0x88, %asi
lduwa [%i1 + 512] %asi, %l6
! move %l6(lower) -> %o3(lower)
or %l6, %o3, %o3

P3260: !CASX [5] (maybe <- 0x300000c) (Int)
add %i1, 72, %o5
ldx [%o5], %o4
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5
mov  %o4, %l7
mov %l4, %o0
casx [%o5], %l7, %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
add  %l4, 1, %l4

P3261: !BST [14] (maybe <- 0x4280006c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P3262: !ST [12] (maybe <- 0x300000d) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P3263: !BLD [3] (FP)
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

P3264: !ST [6] (maybe <- 0x300000e) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P3265: !BST [7] (maybe <- 0x4280006d) (FP) (CBR)
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
be,pt  %xcc, TARGET3265
nop
RET3265:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P3266: !BLD [8] (FP) (Branch target of P3265)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3
ba P3267
nop

TARGET3265:
ba RET3265
nop


P3267: !PREFETCH [0] (Int) (Branch target of P3511)
prefetch [%i0 + 0], 1
ba P3268
nop

TARGET3511:
ba RET3511
nop


P3268: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P3269: !BLD [1] (FP)
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

P3270: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P3271: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P3272: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P3273: !BST [10] (maybe <- 0x42800070) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P3274: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P3275: !BLD [3] (FP)
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

P3276: !DWLD [11] (Int)
ldx [%i2 + 64], %o1
! move %o1(upper) -> %o1(upper)

P3277: !BST [4] (maybe <- 0x42800071) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P3278: !BLD [6] (FP)
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

P3279: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P3280: !REPLACEMENT [15] (Int)
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

P3281: !BST [6] (maybe <- 0x42800072) (FP)
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

P3282: !DWST [11] (maybe <- 0x300000f) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i2 + 64 ] 
add   %l4, 1, %l4

P3283: !ST [0] (maybe <- 0x3000010) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P3284: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P3285: !BST [4] (maybe <- 0x42800075) (FP) (Branch target of P3615)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 
ba P3286
nop

TARGET3615:
ba RET3615
nop


P3286: !BST [1] (maybe <- 0x42800076) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3287: !BST [10] (maybe <- 0x4280007a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P3288: !BLD [2] (FP)
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

P3289: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P3290: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P3291: !BST [12] (maybe <- 0x4280007b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P3292: !BST [9] (maybe <- 0x4280007c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P3293: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P3294: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P3295: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P3296: !BST [4] (maybe <- 0x4280007d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P3297: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P3298: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P3299: !BST [9] (maybe <- 0x4280007e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P3300: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P3301: !CAS [3] (maybe <- 0x3000011) (Int)
add %i0, 32, %l6
lduw [%l6], %o5
mov %o5, %l3
! move %l3(lower) -> %o1(lower)
srlx %o1, 32, %o1
sllx %o1, 32, %o1
or %l3, %o1, %o1
mov %l4, %o2
cas [%l6], %l3, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P3302: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P3303: !BLD [4] (FP) (Branch target of P3431)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6
ba P3304
nop

TARGET3431:
ba RET3431
nop


P3304: !BST [13] (maybe <- 0x4280007f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P3305: !DWST [13] (maybe <- 0x42800080) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
std %f20, [%i3 + 64]

P3306: !PREFETCH [4] (Int) (Branch target of P3375)
prefetch [%i0 + 64], 1
ba P3307
nop

TARGET3375:
ba RET3375
nop


P3307: !BST [8] (maybe <- 0x42800081) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P3308: !PREFETCH [13] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i3 + 64] %asi, 1

P3309: !PREFETCH [2] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i0 + 12] %asi, 1

P3310: !BST [5] (maybe <- 0x42800082) (FP)
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

P3311: !PREFETCH [12] (Int) (Branch target of P3414)
prefetch [%i3 + 0], 1
ba P3312
nop

TARGET3414:
ba RET3414
nop


P3312: !DWLD [10] (Int)
ldx [%i2 + 32], %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l3
or %l3, %o2, %o2

P3313: !BST [3] (maybe <- 0x42800085) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3314: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P3315: !MEMBAR (Int)
membar #StoreLoad

P3316: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P3317: !BST [12] (maybe <- 0x42800089) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P3318: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P3319: !DWST [0] (maybe <- 0x3000012) (Int)
sllx %l4, 32, %l3 
add   %l4, 1, %l4
or %l3, %l4, %l3
stx %l3, [%i0 + 0]
add   %l4, 1, %l4

P3320: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P3321: !DWST [10] (maybe <- 0x3000014) (Int)
mov %l4, %o5 
sllx %o5, 32, %o5 
stx %o5, [%i2 + 32 ] 
add   %l4, 1, %l4

P3322: !BST [0] (maybe <- 0x4280008a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3323: !DWLD [4] (Int)
ldx [%i0 + 64], %o3
! move %o3(upper) -> %o3(upper)

P3324: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P3325: !REPLACEMENT [1] (Int)
sethi %hi(0x4), %o5
or %o5, %lo(0x4),  %o5
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

P3326: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f36, %f8

P3327: !BST [10] (maybe <- 0x4280008e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P3328: !BLD [5] (FP)
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

P3329: !BST [12] (maybe <- 0x4280008f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P3330: !BST [13] (maybe <- 0x42800090) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P3331: !BST [14] (maybe <- 0x42800091) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P3332: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P3333: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P3334: !BST [15] (maybe <- 0x42800092) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P3335: !DWLD [3] (Int)
ldx [%i0 + 32], %l7
! move %l7(upper) -> %o3(lower)
srlx %o3, 32, %o3
sllx %o3, 32, %o3
srlx %l7, 32, %l6
or %l6, %o3, %o3

P3336: !BLD [3] (FP)
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

P3337: !BST [2] (maybe <- 0x42800093) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3338: !ST [6] (maybe <- 0x3000015) (Int) (Branch target of P3452)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4
ba P3339
nop

TARGET3452:
ba RET3452
nop


P3339: !BST [1] (maybe <- 0x42800097) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3340: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P3341: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P3342: !LD [15] (Int)
lduw [%i3 + 192], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P3343: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P3344: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P3345: !BST [10] (maybe <- 0x4280009b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P3346: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P3347: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f3
fmovd %f36, %f4

P3348: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f6

P3349: !MEMBAR (Int)
membar #StoreLoad

P3350: !ST [8] (maybe <- 0x4280009c) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i1 + 256 ]

P3351: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P3352: !BLD [9] (FP) (Branch target of P3154)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8
ba P3353
nop

TARGET3154:
ba RET3154
nop


P3353: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P3354: !BST [7] (maybe <- 0x4280009d) (FP)
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

P3355: !LD [9] (Int) (LE)
wr %g0, 0x88, %asi
lduwa [%i1 + 512] %asi, %l3
! move %l3(lower) -> %o4(lower)
or %l3, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P3356: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P3357: !BST [5] (maybe <- 0x428000a0) (FP)
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

P3358: !PREFETCH [9] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i1 + 512] %asi, 1

P3359: !BST [11] (maybe <- 0x428000a3) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P3360: !BST [10] (maybe <- 0x428000a4) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P3361: !BST [13] (maybe <- 0x428000a5) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P3362: !BST [6] (maybe <- 0x428000a6) (FP)
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

P3363: !PREFETCH [5] (Int) (CBR)
prefetch [%i1 + 76], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3363
nop
RET3363:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P3364: !BST [1] (maybe <- 0x428000a9) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3365: !PREFETCH [2] (Int) (CBR)
prefetch [%i0 + 12], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3365
nop
RET3365:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P3366: !ST [0] (maybe <- 0x3000016) (Int) (Branch target of P3119)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4
ba P3367
nop

TARGET3119:
ba RET3119
nop


P3367: !DWLD [5] (Int) (CBR)
ldx [%i1 + 72], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3367
nop
RET3367:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P3368: !BST [15] (maybe <- 0x428000ad) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P3369: !BLD [0] (FP)
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

P3370: !BST [8] (maybe <- 0x428000ae) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P3371: !BST [14] (maybe <- 0x428000af) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P3372: !BST [0] (maybe <- 0x428000b0) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3373: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P3374: !BLD [7] (FP)
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

P3375: !PREFETCH [10] (Int) (CBR)
prefetch [%i2 + 32], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3375
nop
RET3375:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P3376: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P3377: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P3378: !BST [8] (maybe <- 0x428000b4) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P3379: !BST [4] (maybe <- 0x428000b5) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P3380: !BLD [2] (FP)
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

P3381: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f6

P3382: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P3383: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P3384: !REPLACEMENT [9] (Int)
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

P3385: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P3386: !DWLD [9] (Int) (LE)
wr %g0, 0x88, %asi
ldxa [%i1 + 512] %asi, %l7
! move %l7(lower) -> %o0(lower)
srl %l7, 0, %l6
or %l6, %o0, %o0

P3387: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P3388: !BST [10] (maybe <- 0x428000b6) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P3389: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P3390: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P3391: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P3392: !DWLD [15] (Int) (Branch target of P3367)
ldx [%i3 + 192], %o1
! move %o1(upper) -> %o1(upper)
ba P3393
nop

TARGET3367:
ba RET3367
nop


P3393: !CASX [12] (maybe <- 0x3000017) (Int)
add %i3, 0, %l6
ldx [%l6], %o5
! move %o5(upper) -> %o1(lower)
srlx %o1, 32, %o1
sllx %o1, 32, %o1
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

P3394: !BST [5] (maybe <- 0x428000b7) (FP)
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

P3395: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P3396: !BST [9] (maybe <- 0x428000ba) (FP) (CBR)
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
be,pt  %xcc, TARGET3396
nop
RET3396:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P3397: !BST [2] (maybe <- 0x428000bb) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3398: !BLD [7] (FP)
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

P3399: !DWST [13] (maybe <- 0x3000018) (Int)
mov %l4, %l7 
sllx %l7, 32, %l7 
stx %l7, [%i3 + 64 ] 
add   %l4, 1, %l4

P3400: !BST [5] (maybe <- 0x428000bf) (FP)
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

P3401: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P3402: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P3403: !BLD [7] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f11
fmovd %f36, %f12

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3403
nop
RET3403:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P3404: !DWLD [0] (Int)
ldx [%i0 + 0], %l7
! move %l7(upper) -> %o3(lower)
srlx %l7, 32, %l6
or %l6, %o3, %o3
! move %l7(lower) -> %o4(upper)
sllx %l7, 32, %o4

P3405: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P3406: !DWST [6] (maybe <- 0x3000019) (Int)
sllx %l4, 32, %o5 
add   %l4, 1, %l4
or %o5, %l4, %o5
stx %o5, [%i1 + 80]
add   %l4, 1, %l4

P3407: !BST [14] (maybe <- 0x428000c2) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P3408: !BST [7] (maybe <- 0x428000c3) (FP)
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

P3409: !BLD [15] (FP)
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

P3410: !BST [0] (maybe <- 0x428000c6) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3411: !DWST [9] (maybe <- 0x300001b) (Int) (LE)
wr %g0, 0x88, %asi
! Change single-word-level endianess (big endian <-> little endian) 
sethi %hi(0xff00ff00), %o5
or %o5, %lo(0xff00ff00), %o5
and %l4, %o5, %l6
srl %l6, 8, %l6
sll %l4, 8, %l3
and %l3, %o5, %l3
or %l3, %l6, %l3
srl %l3, 16, %l6
sll %l3, 16, %l3
srl %l3, 0, %l3
or %l3, %l6, %l3
stxa %l3, [%i1 + 512 ] %asi
add   %l4, 1, %l4

P3412: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f0
membar #Sync 
! 1 addresses covered

P3413: !BST [3] (maybe <- 0x428000ca) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3414: !BST [13] (maybe <- 0x428000ce) (FP) (CBR)
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
be,pn  %xcc, TARGET3414
nop
RET3414:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P3415: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P3416: !PREFETCH [6] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i1 + 80] %asi, 1

P3417: !REPLACEMENT [10] (Int)
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

P3418: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P3419: !BLD [1] (FP) (Branch target of P3443)
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
ba P3420
nop

TARGET3443:
ba RET3443
nop


P3420: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P3421: !BST [0] (maybe <- 0x428000cf) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3422: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f6

P3423: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P3424: !LD [0] (Int)
lduw [%i0 + 0], %l3
! move %l3(lower) -> %o4(lower)
or %l3, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P3425: !BST [14] (maybe <- 0x428000d3) (FP) (CBR) (Branch target of P3198)
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
be,pn  %xcc, TARGET3425
nop
RET3425:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0

ba P3426
nop

TARGET3198:
ba RET3198
nop


P3426: !LD [7] (Int) (LE)
wr %g0, 0x88, %asi
lduwa [%i1 + 84] %asi, %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P3427: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P3428: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P3429: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P3430: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P3431: !PREFETCH [10] (Int) (CBR)
prefetch [%i2 + 32], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3431
nop
RET3431:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P3432: !PREFETCH [2] (Int) (Branch target of P3208)
prefetch [%i0 + 12], 1
ba P3433
nop

TARGET3208:
ba RET3208
nop


P3433: !BST [1] (maybe <- 0x428000d4) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3434: !BLD [4] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3434
nop
RET3434:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P3435: !REPLACEMENT [3] (Int)
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

P3436: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P3437: !MEMBAR (Int)
membar #StoreLoad

P3438: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P3439: !PREFETCH [8] (Int) (CBR)
prefetch [%i1 + 256], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3439
nop
RET3439:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P3440: !BST [6] (maybe <- 0x428000d8) (FP)
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

P3441: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P3442: !DWST [1] (maybe <- 0x428000db) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=21 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
std %f20, [%i0 + 0]

P3443: !PREFETCH [6] (Int) (CBR)
prefetch [%i1 + 80], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3443
nop
RET3443:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P3444: !BLD [8] (FP) (Branch target of P3203)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12
ba P3445
nop

TARGET3203:
ba RET3203
nop


P3445: !LD [7] (Int)
lduw [%i1 + 84], %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0

P3446: !DWST [2] (maybe <- 0x300001c) (Int)
mov %l4, %l6 
stx %l6, [%i0 + 8]
add   %l4, 1, %l4

P3447: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P3448: !ST [13] (maybe <- 0x300001d) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P3449: !SWAP [12] (maybe <- 0x300001e) (Int)
mov %l4, %o1
swap  [%i3 + 0], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P3450: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P3451: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P3452: !BST [5] (maybe <- 0x428000dd) (FP) (CBR)
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
be,pt  %xcc, TARGET3452
nop
RET3452:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P3453: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P3454: !DWST [6] (maybe <- 0x300001f) (Int)
sllx %l4, 32, %l7 
add   %l4, 1, %l4
or %l7, %l4, %l7
stx %l7, [%i1 + 80]
add   %l4, 1, %l4

P3455: !BST [2] (maybe <- 0x428000e0) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3456: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P3457: !BST [3] (maybe <- 0x428000e4) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3458: !BLD [1] (FP)
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

P3459: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P3460: !ST [6] (maybe <- 0x3000021) (Int) (Branch target of P3365)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4
ba P3461
nop

TARGET3365:
ba RET3365
nop


P3461: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P3462: !BST [9] (maybe <- 0x428000e8) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P3463: !ST [1] (maybe <- 0x3000022) (Int) (Branch target of P3439)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4
ba P3464
nop

TARGET3439:
ba RET3439
nop


P3464: !BST [4] (maybe <- 0x428000e9) (FP) (CBR)
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
be,pn  %xcc, TARGET3464
nop
RET3464:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P3465: !CAS [5] (maybe <- 0x3000023) (Int)
add %i1, 76, %l6
lduw [%l6], %o5
mov %o5, %l3
! move %l3(lower) -> %o1(lower)
or %l3, %o1, %o1
mov %l4, %o2
cas [%l6], %l3, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P3466: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P3467: !PREFETCH [12] (Int) (CBR)
prefetch [%i3 + 0], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3467
nop
RET3467:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P3468: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P3469: !BST [4] (maybe <- 0x428000ea) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P3470: !BST [7] (maybe <- 0x428000eb) (FP)
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

P3471: !BST [14] (maybe <- 0x428000ee) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P3472: !BST [6] (maybe <- 0x428000ef) (FP)
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

P3473: !BST [5] (maybe <- 0x428000f2) (FP)
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

P3474: !BST [8] (maybe <- 0x428000f5) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P3475: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P3476: !CAS [9] (maybe <- 0x3000024) (Int)
add %i1, 512, %l3
lduw [%l3], %l7
mov %l7, %o5
! move %o5(lower) -> %o2(lower)
or %o5, %o2, %o2
mov %l4, %o3
cas [%l3], %o5, %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P3477: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P3478: !BST [9] (maybe <- 0x428000f6) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P3479: !BST [11] (maybe <- 0x428000f7) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P3480: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P3481: !BST [9] (maybe <- 0x428000f8) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P3482: !DWST [8] (maybe <- 0x3000025) (Int)
mov %l4, %l3 
sllx %l3, 32, %l3 
stx %l3, [%i1 + 256 ] 
add   %l4, 1, %l4

P3483: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P3484: !ST [10] (maybe <- 0x3000026) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P3485: !SWAP [2] (maybe <- 0x3000027) (Int)
mov %l4, %l3
swap  [%i0 + 12], %l3
! move %l3(lower) -> %o3(lower)
srl %l3, 0, %l7
or %l7, %o3, %o3
add   %l4, 1, %l4

P3486: !BLD [0] (FP)
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

P3487: !BST [7] (maybe <- 0x428000f9) (FP)
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

P3488: !BST [14] (maybe <- 0x428000fc) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P3489: !DWST [5] (maybe <- 0x3000028) (Int) (Branch target of P3396)
mov %l4, %o5 
stx %o5, [%i1 + 72]
add   %l4, 1, %l4
ba P3490
nop

TARGET3396:
ba RET3396
nop


P3490: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P3491: !BST [2] (maybe <- 0x428000fd) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3492: !ST [11] (maybe <- 0x3000029) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P3493: !ST [10] (maybe <- 0x300002a) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P3494: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P3495: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P3496: !BST [3] (maybe <- 0x42800101) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3497: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P3498: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P3499: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P3500: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P3501: !BLD [7] (FP)
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

P3502: !LD [2] (Int)
lduw [%i0 + 12], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P3503: !BLD [6] (FP)
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

P3504: !SWAP [8] (maybe <- 0x300002b) (Int)
mov %l4, %l7
swap  [%i1 + 256], %l7
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

P3505: !DWST [4] (maybe <- 0x300002c) (Int)
mov %l4, %o5 
sllx %o5, 32, %o5 
stx %o5, [%i0 + 64 ] 
add   %l4, 1, %l4

P3506: !BST [9] (maybe <- 0x42800105) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P3507: !BST [6] (maybe <- 0x42800106) (FP)
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

P3508: !BLD [5] (FP) (CBR)
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
be,pt  %xcc, TARGET3508
nop
RET3508:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P3509: !BLD [1] (FP)
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

P3510: !BST [11] (maybe <- 0x42800109) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P3511: !BST [3] (maybe <- 0x4280010a) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
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
be,pn  %xcc, TARGET3511
nop
RET3511:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P3512: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f7

P3513: !REPLACEMENT [7] (Int)
sethi %hi(0x54), %l3
or %l3, %lo(0x54),  %l3
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

P3514: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P3515: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P3516: !BLD [7] (FP)
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

P3517: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P3518: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P3519: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P3520: !BST [1] (maybe <- 0x4280010e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3521: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f11
fmovd %f36, %f12

P3522: !PREFETCH [1] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i0 + 4] %asi, 1

P3523: !DWST [1] (maybe <- 0x300002d) (Int)
sllx %l4, 32, %l7 
add   %l4, 1, %l4
or %l7, %l4, %l7
stx %l7, [%i0 + 0]
add   %l4, 1, %l4

P3524: !BST [13] (maybe <- 0x42800112) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P3525: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P3526: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P3527: !ST [13] (maybe <- 0x42800113) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i3 + 64 ]

P3528: !LD [10] (Int)
lduw [%i2 + 32], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P3529: !BST [12] (maybe <- 0x42800114) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P3530: !DWLD [0] (FP)
ldd [%i0 + 0], %f14
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

P3531: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P3532: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P3533: !BST [11] (maybe <- 0x42800115) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P3534: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f0
membar #Sync 
! 1 addresses covered

P3535: !BST [10] (maybe <- 0x42800116) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P3536: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P3537: !BLD [1] (FP)
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

P3538: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P3539: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P3540: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P3541: !DWLD [8] (Int)
ldx [%i1 + 256], %o5
! move %o5(upper) -> %o0(lower)
srlx %o5, 32, %l7
or %l7, %o0, %o0

P3542: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P3543: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P3544: !BST [8] (maybe <- 0x42800117) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P3545: !BLD [1] (FP)
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

P3546: !BLD [2] (FP)
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

P3547: !BST [5] (maybe <- 0x42800118) (FP)
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

P3548: !BLD [12] (FP)
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

P3549: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P3550: !LD [2] (Int)
lduw [%i0 + 12], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P3551: !BLD [10] (FP) (Branch target of P3434)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f0
membar #Sync 
! 1 addresses covered
fmovd %f8, %f0
ba P3552
nop

TARGET3434:
ba RET3434
nop


P3552: !ST [5] (maybe <- 0x300002f) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P3553: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P3554: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P3555: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P3556: !BST [3] (maybe <- 0x4280011b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3557: !BLD [6] (FP)
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

P3558: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P3559: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P3560: !BST [8] (maybe <- 0x4280011f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P3561: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P3562: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P3563: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P3564: !BST [8] (maybe <- 0x42800120) (FP) (CBR)
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
be,pn  %xcc, TARGET3564
nop
RET3564:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P3565: !BLD [3] (FP)
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

P3566: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P3567: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P3568: !BST [7] (maybe <- 0x42800121) (FP)
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

P3569: !BST [15] (maybe <- 0x42800124) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P3570: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P3571: !BST [13] (maybe <- 0x42800125) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P3572: !BST [11] (maybe <- 0x42800126) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P3573: !BST [2] (maybe <- 0x42800127) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3574: !BST [9] (maybe <- 0x4280012b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P3575: !BLD [3] (FP)
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

P3576: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f36, %f2

P3577: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P3578: !BST [5] (maybe <- 0x4280012c) (FP)
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

P3579: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P3580: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P3581: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P3582: !BLD [10] (FP) (Branch target of P3467)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f6
ba P3583
nop

TARGET3467:
ba RET3467
nop


P3583: !BLD [1] (FP)
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

P3584: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P3585: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P3586: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P3587: !REPLACEMENT [9] (Int)
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

P3588: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P3589: !DWLD [9] (FP)
ldd [%i1 + 512], %f18
! 1 addresses covered
fmovs %f18, %f13

P3590: !BLD [0] (FP)
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

P3591: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P3592: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P3593: !BST [12] (maybe <- 0x4280012f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P3594: !BST [12] (maybe <- 0x42800130) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P3595: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P3596: !BST [6] (maybe <- 0x42800131) (FP)
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

P3597: !DWLD [10] (Int)
ldx [%i2 + 32], %o5
! move %o5(upper) -> %o1(lower)
srlx %o5, 32, %l7
or %l7, %o1, %o1

P3598: !BLD [3] (FP)
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

P3599: !BST [0] (maybe <- 0x42800134) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3600: !BST [2] (maybe <- 0x42800138) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3601: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P3602: !BST [5] (maybe <- 0x4280013c) (FP)
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

P3603: !MEMBAR (Int)
membar #StoreLoad

P3604: !LD [0] (Int)
lduw [%i0 + 0], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P3605: !LD [1] (Int) (LE)
wr %g0, 0x88, %asi
lduwa [%i0 + 4] %asi, %l3
! move %l3(lower) -> %o2(lower)
or %l3, %o2, %o2

P3606: !LD [2] (FP)
ld [%i0 + 12], %f7
! 1 addresses covered

P3607: !LD [3] (Int)
lduw [%i0 + 32], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P3608: !LD [4] (Int)
lduw [%i0 + 64], %l3
! move %l3(lower) -> %o3(lower)
or %l3, %o3, %o3

P3609: !LD [5] (Int)
lduw [%i1 + 76], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P3610: !LD [6] (Int)
lduw [%i1 + 80], %l3
! move %l3(lower) -> %o4(lower)
or %l3, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P3611: !LD [7] (Int)
lduw [%i1 + 84], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P3612: !LD [8] (Int)
lduw [%i1 + 256], %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0

P3613: !LD [9] (Int)
lduw [%i1 + 512], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P3614: !LD [10] (Int)
lduw [%i2 + 32], %l3
! move %l3(lower) -> %o1(lower)
or %l3, %o1, %o1

P3615: !LD [11] (FP) (CBR)
ld [%i2 + 64], %f8
! 1 addresses covered

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3615
nop
RET3615:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P3616: !LD [12] (Int)
lduw [%i3 + 0], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P3617: !LD [13] (Int)
lduw [%i3 + 64], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2

P3618: !LD [14] (Int)
lduw [%i3 + 128], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P3619: !LD [15] (Int)
lduw [%i3 + 192], %l6
! move %l6(lower) -> %o3(lower)
or %l6, %o3, %o3

END_NODES6: ! Test istream for CPU 6 ends
sethi %hi(0xdead0e0f), %l7
or    %l7, %lo(0xdead0e0f), %l7
! move %l7(lower) -> %o4(upper)
sllx %l7, 32, %o4
stw %l7, [%i5] 
ld [%i5], %f9
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5
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
sethi %hi(0x07deade1), %l6
or    %l6, %lo(0x07deade1), %l6
stw %l6, [%i5] 
ld [%i5], %f16

! Initialize running integer counter in register %l4
sethi %hi(0x3800001), %l4
or    %l4, %lo(0x3800001), %l4

! Initialize running FP counter in register %f16
sethi %hi(0x43000001), %l6
or    %l6, %lo(0x43000001), %l6
stw %l6, [%i5] 
ld [%i5], %f16

! Initialize FP counter increment value in register %f17 (constant)
sethi %hi(0x37800000), %l6
or    %l6, %lo(0x37800000), %l6
stw %l6, [%i5] 
ld [%i5], %f17 

! Initialize LFSR to 0x7fbd^4
sethi %hi(0x7fbd), %l0
or    %l0, %lo(0x7fbd), %l0
mulx  %l0, %l0, %l0
mulx  %l0, %l0, %l0

!-- init shared addrs 14 to 15 ---
stx %g0, [%i3+128]
stx %g0, [%i3+192]

! use untouched cache-line (offset 4K) in replacement area for sync
sub %i1, %i0, %l7
add %i3, %l7, %l7
sub %l7, -4096, %l7

!-- begin of sync_init ---
or %g0, 1, %o5
or %g0, %o5, %l3
swap [%l7+4], %l3
membar #Sync
sync_init_1_7:
brnz,pt %o5, sync_init_1_7
lduw [%l7+4], %o5 ! delay slot
sync_init_2_7:
lduw [%l7], %o5
sub %o5, 1, %l3
cas [%l7], %o5, %l3
cmp %o5, %l3
bne,pt %xcc, sync_init_2_7
nop
membar #Sync
sync_init_3_7:
lduw [%l7], %o5 ! delay slot
brnz,pt %o5, sync_init_3_7
nop
!-- end of sync_init ---


BEGIN_NODES7: ! Test istream for CPU 7 begins

P3620: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P3621: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P3622: !PREFETCH [7] (Int) (Branch target of P3890)
prefetch [%i1 + 84], 1
ba P3623
nop

TARGET3890:
ba RET3890
nop


P3623: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P3624: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P3625: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f0
membar #Sync 
! 1 addresses covered

P3626: !BST [4] (maybe <- 0x43000001) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P3627: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P3628: !DWLD [15] (Int)
ldx [%i3 + 192], %o0
! move %o0(upper) -> %o0(upper)

P3629: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P3630: !DWST [11] (maybe <- 0x3800001) (Int)
mov %l4, %l7 
sllx %l7, 32, %l7 
stx %l7, [%i2 + 64 ] 
add   %l4, 1, %l4

P3631: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P3632: !BLD [3] (FP)
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

P3633: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f36, %f8

P3634: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P3635: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P3636: !BST [9] (maybe <- 0x43000002) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P3637: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P3638: !BST [15] (maybe <- 0x43000003) (FP) (CBR)
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
be,pn  %xcc, TARGET3638
nop
RET3638:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P3639: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P3640: !BST [7] (maybe <- 0x43000004) (FP)
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

P3641: !BLD [0] (FP)
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

P3642: !BLD [2] (FP)
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

P3643: !BST [13] (maybe <- 0x43000007) (FP) (CBR)
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
be,pt  %xcc, TARGET3643
nop
RET3643:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P3644: !BST [9] (maybe <- 0x43000008) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P3645: !BLD [0] (FP)
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

P3646: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P3647: !BLD [13] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3647
nop
RET3647:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P3648: !BLD [7] (FP) (CBR)
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
be,pt  %xcc, TARGET3648
nop
RET3648:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P3649: !ST [11] (maybe <- 0x43000009) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i2 + 64 ]

P3650: !BST [0] (maybe <- 0x4300000a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3651: !BST [8] (maybe <- 0x4300000e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P3652: !BST [2] (maybe <- 0x4300000f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3653: !DWLD [12] (FP)
ldd [%i3 + 0], %f18
! 1 addresses covered
fmovs %f18, %f13

P3654: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f14

P3655: !BST [7] (maybe <- 0x43000013) (FP) (CBR)
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
be,pt  %xcc, TARGET3655
nop
RET3655:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P3656: !DWST [3] (maybe <- 0x3800002) (Int)
mov %l4, %l3 
sllx %l3, 32, %l3 
stx %l3, [%i0 + 32 ] 
add   %l4, 1, %l4

P3657: !BST [13] (maybe <- 0x43000016) (FP) (CBR)
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
be,pn  %xcc, TARGET3657
nop
RET3657:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P3658: !LD [5] (Int)
lduw [%i1 + 76], %l3
! move %l3(lower) -> %o0(lower)
srlx %o0, 32, %o0
sllx %o0, 32, %o0
or %l3, %o0, %o0

P3659: !BST [4] (maybe <- 0x43000017) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P3660: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P3661: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P3662: !BST [0] (maybe <- 0x43000018) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3663: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P3664: !BST [7] (maybe <- 0x4300001c) (FP)
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

P3665: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P3666: !CAS [11] (maybe <- 0x3800003) (Int)
add %i2, 64, %o5
lduw [%o5], %o1
mov %o1, %l7
! move %l7(lower) -> %o1(upper)
sllx %l7, 32, %o1
mov %l4, %l6
cas [%o5], %l7, %l6
! move %l6(lower) -> %o1(lower)
srl %l6, 0, %o5
or %o5, %o1, %o1
add   %l4, 1, %l4

P3667: !BLD [7] (FP)
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

P3668: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P3669: !BST [7] (maybe <- 0x4300001f) (FP)
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

P3670: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P3671: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f3
fmovd %f36, %f4

P3672: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P3673: !BST [14] (maybe <- 0x43000022) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P3674: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P3675: !DWST [2] (maybe <- 0x43000023) (FP)
! 0 th moved, current_fp_src=21 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
std %f20, [%i0 + 8]

P3676: !LD [5] (Int)
lduw [%i1 + 76], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P3677: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P3678: !BST [3] (maybe <- 0x43000024) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3679: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P3680: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P3681: !REPLACEMENT [1] (Int)
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

P3682: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f36, %f8

P3683: !BLD [6] (FP)
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

P3684: !BLD [3] (FP)
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

P3685: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P3686: !BLD [2] (FP)
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

P3687: !BLD [3] (FP)
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

P3688: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P3689: !BST [9] (maybe <- 0x43000028) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P3690: !BLD [6] (FP)
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

P3691: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P3692: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P3693: !BLD [5] (FP)
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

P3694: !BST [1] (maybe <- 0x43000029) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3695: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P3696: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P3697: !CASX [11] (maybe <- 0x3800004) (Int)
add %i2, 64, %l7
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

P3698: !BST [12] (maybe <- 0x4300002d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P3699: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P3700: !MEMBAR (Int)
membar #StoreLoad

P3701: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f3

P3702: !ST [10] (maybe <- 0x3800005) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P3703: !BLD [7] (FP)
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

P3704: !BST [3] (maybe <- 0x4300002e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3705: !SWAP [0] (maybe <- 0x3800006) (Int)
mov %l4, %l3
swap  [%i0 + 0], %l3
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

P3706: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P3707: !MEMBAR (Int)
membar #StoreLoad

P3708: !LD [13] (Int)
lduw [%i3 + 64], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P3709: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P3710: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P3711: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P3712: !BST [9] (maybe <- 0x43000032) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P3713: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P3714: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P3715: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P3716: !BST [5] (maybe <- 0x43000033) (FP)
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

P3717: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P3718: !BST [4] (maybe <- 0x43000036) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P3719: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P3720: !DWST [14] (maybe <- 0x3800007) (Int)
mov %l4, %l3 
sllx %l3, 32, %l3 
stx %l3, [%i3 + 128 ] 
add   %l4, 1, %l4

P3721: !PREFETCH [7] (Int) (Branch target of P4117)
prefetch [%i1 + 84], 1
ba P3722
nop

TARGET4117:
ba RET4117
nop


P3722: !BST [6] (maybe <- 0x43000037) (FP)
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

P3723: !BLD [3] (FP)
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

P3724: !LD [3] (Int) (CBR)
lduw [%i0 + 32], %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3724
nop
RET3724:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P3725: !CASX [14] (maybe <- 0x3800008) (Int)
add %i3, 128, %l7
ldx [%l7], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
mov  %o1, %l6
sllx %l4, 32, %o2
casx [%l7], %l6, %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
add  %l4, 1, %l4

P3726: !BST [10] (maybe <- 0x4300003a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P3727: !ST [6] (maybe <- 0x3800009) (Int) (CBR)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3727
nop
RET3727:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P3728: !CASX [2] (maybe <- 0x380000a) (Int)
add %i0, 8, %l6
ldx [%l6], %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
mov  %o3, %l3
mov %l4, %o4
casx [%l6], %l3, %o4
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5
add  %l4, 1, %l4

P3729: !BST [15] (maybe <- 0x4300003b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P3730: !DWST [4] (maybe <- 0x380000b) (Int)
mov %l4, %o5 
sllx %o5, 32, %o5 
stx %o5, [%i0 + 64 ] 
add   %l4, 1, %l4

P3731: !BST [2] (maybe <- 0x4300003c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3732: !BST [11] (maybe <- 0x43000040) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P3733: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P3734: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f14

P3735: !BST [12] (maybe <- 0x43000041) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P3736: !BST [0] (maybe <- 0x43000042) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3737: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P3738: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P3739: !BLD [7] (FP)
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

P3740: !DWLD [15] (Int)
ldx [%i3 + 192], %o0
! move %o0(upper) -> %o0(upper)

P3741: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P3742: !BLD [1] (FP)
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

P3743: !BST [8] (maybe <- 0x43000046) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P3744: !REPLACEMENT [13] (Int)
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

P3745: !BST [7] (maybe <- 0x43000047) (FP)
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

P3746: !BST [4] (maybe <- 0x4300004a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P3747: !ST [14] (maybe <- 0x380000c) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P3748: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f7

P3749: !BLD [1] (FP)
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

P3750: !DWST [4] (maybe <- 0x4300004b) (FP) (Branch target of P3799)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
std %f20, [%i0 + 64]
ba P3751
nop

TARGET3799:
ba RET3799
nop


P3751: !BST [2] (maybe <- 0x4300004c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3752: !ST [10] (maybe <- 0x380000d) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P3753: !BST [7] (maybe <- 0x43000050) (FP)
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

P3754: !ST [15] (maybe <- 0x380000e) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P3755: !BST [15] (maybe <- 0x43000053) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P3756: !REPLACEMENT [13] (Int)
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

P3757: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P3758: !BLD [12] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3758
nop
RET3758:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P3759: !SWAP [13] (maybe <- 0x380000f) (Int)
mov %l4, %o5
swap  [%i3 + 64], %o5
! move %o5(lower) -> %o0(lower)
srlx %o0, 32, %o0
sllx %o0, 32, %o0
srl %o5, 0, %l6
or %l6, %o0, %o0
add   %l4, 1, %l4

P3760: !BLD [12] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3760
nop
RET3760:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P3761: !BLD [8] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3761
nop
RET3761:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P3762: !BST [6] (maybe <- 0x43000054) (FP)
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

P3763: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P3764: !BST [7] (maybe <- 0x43000057) (FP)
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

P3765: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P3766: !REPLACEMENT [9] (Int)
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

P3767: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P3768: !BST [0] (maybe <- 0x4300005a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3769: !BLD [7] (FP)
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

P3770: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P3771: !BST [13] (maybe <- 0x4300005e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P3772: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P3773: !MEMBAR (Int)
membar #StoreLoad

P3774: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P3775: !DWST [10] (maybe <- 0x3800010) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i2 + 32 ] 
add   %l4, 1, %l4

P3776: !PREFETCH [2] (Int) (Branch target of P4052)
prefetch [%i0 + 12], 1
ba P3777
nop

TARGET4052:
ba RET4052
nop


P3777: !BLD [8] (FP) (Branch target of P4024)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2
ba P3778
nop

TARGET4024:
ba RET4024
nop


P3778: !LD [4] (Int)
lduw [%i0 + 64], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P3779: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P3780: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P3781: !REPLACEMENT [5] (Int)
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

P3782: !BLD [5] (FP)
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

P3783: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f36, %f8

P3784: !DWLD [2] (Int)
ldx [%i0 + 8], %l7
! move %l7(lower) -> %o1(lower)
srl %l7, 0, %l6
or %l6, %o1, %o1

P3785: !SWAP [6] (maybe <- 0x3800011) (Int)
mov %l4, %o2
swap  [%i1 + 80], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P3786: !MEMBAR (Int)
membar #StoreLoad

P3787: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P3788: !LD [8] (Int)
lduw [%i1 + 256], %o5
! move %o5(lower) -> %o2(lower)
or %o5, %o2, %o2

P3789: !BLD [3] (FP)
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

P3790: !PREFETCH [9] (Int) (Branch target of P4092)
prefetch [%i1 + 512], 1
ba P3791
nop

TARGET4092:
ba RET4092
nop


P3791: !BLD [10] (FP) (Branch target of P3727)
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
ba P3792
nop

TARGET3727:
ba RET3727
nop


P3792: !CAS [11] (maybe <- 0x3800012) (Int)
add %i2, 64, %l6
lduw [%l6], %o3
mov %o3, %l3
! move %l3(lower) -> %o3(upper)
sllx %l3, 32, %o3
mov %l4, %o5
cas [%l6], %l3, %o5
! move %o5(lower) -> %o3(lower)
srl %o5, 0, %l6
or %l6, %o3, %o3
add   %l4, 1, %l4

P3793: !BLD [3] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f0
membar #Sync 
! 4 addresses covered
fmovs %f3, %f2
fmovs %f8, %f3

P3794: !BST [0] (maybe <- 0x4300005f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3795: !BST [0] (maybe <- 0x43000063) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3796: !BST [10] (maybe <- 0x43000067) (FP) (Branch target of P3761)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 
ba P3797
nop

TARGET3761:
ba RET3761
nop


P3797: !BST [10] (maybe <- 0x43000068) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P3798: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P3799: !BLD [8] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3799
nop
RET3799:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P3800: !LD [12] (Int)
lduw [%i3 + 0], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P3801: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P3802: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P3803: !BST [8] (maybe <- 0x43000069) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P3804: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P3805: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P3806: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P3807: !BST [8] (maybe <- 0x4300006a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P3808: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P3809: !BLD [2] (FP)
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

P3810: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P3811: !BST [13] (maybe <- 0x4300006b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P3812: !BST [0] (maybe <- 0x4300006c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3813: !DWLD [5] (Int)
ldx [%i1 + 72], %l3
! move %l3(lower) -> %o4(lower)
srl %l3, 0, %o5
or %o5, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P3814: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P3815: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P3816: !BST [14] (maybe <- 0x43000070) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P3817: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P3818: !BLD [14] (FP)
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

P3819: !BST [13] (maybe <- 0x43000071) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P3820: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P3821: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P3822: !BLD [15] (FP) (Branch target of P3724)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f0
membar #Sync 
! 1 addresses covered
ba P3823
nop

TARGET3724:
ba RET3724
nop


P3823: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P3824: !BST [12] (maybe <- 0x43000072) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P3825: !BST [8] (maybe <- 0x43000073) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P3826: !PREFETCH [1] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i0 + 4] %asi, 1

P3827: !BST [2] (maybe <- 0x43000074) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3828: !BLD [1] (FP)
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

P3829: !BST [6] (maybe <- 0x43000078) (FP) (Branch target of P3643)
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
ba P3830
nop

TARGET3643:
ba RET3643
nop


P3830: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P3831: !BST [8] (maybe <- 0x4300007b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P3832: !PREFETCH [6] (Int) (Branch target of P3758)
prefetch [%i1 + 80], 1
ba P3833
nop

TARGET3758:
ba RET3758
nop


P3833: !SWAP [7] (maybe <- 0x3800013) (Int)
mov %l4, %o0
swap  [%i1 + 84], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
add   %l4, 1, %l4

P3834: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P3835: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P3836: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P3837: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P3838: !LD [1] (Int)
lduw [%i0 + 4], %l7
! move %l7(lower) -> %o0(lower)
or %l7, %o0, %o0

P3839: !MEMBAR (Int)
membar #StoreLoad

P3840: !BST [10] (maybe <- 0x4300007c) (FP) (CBR)
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
be,pn  %xcc, TARGET3840
nop
RET3840:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P3841: !BLD [0] (FP)
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

P3842: !BST [2] (maybe <- 0x4300007d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3843: !BST [4] (maybe <- 0x43000081) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P3844: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P3845: !BST [6] (maybe <- 0x43000082) (FP)
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

P3846: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P3847: !CASX [3] (maybe <- 0x3800014) (Int) (Branch target of P4079)
add %i0, 32, %l6
ldx [%l6], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
mov  %o1, %l3
sllx %l4, 32, %o2
casx [%l6], %l3, %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
add  %l4, 1, %l4
ba P3848
nop

TARGET4079:
ba RET4079
nop


P3848: !CAS [14] (maybe <- 0x3800015) (Int)
add %i3, 128, %l6
lduw [%l6], %o3
mov %o3, %l3
! move %l3(lower) -> %o3(upper)
sllx %l3, 32, %o3
mov %l4, %o5
cas [%l6], %l3, %o5
! move %o5(lower) -> %o3(lower)
srl %o5, 0, %l6
or %l6, %o3, %o3
add   %l4, 1, %l4

P3849: !BST [10] (maybe <- 0x43000085) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P3850: !BLD [12] (FP) (Branch target of P3942)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11
ba P3851
nop

TARGET3942:
ba RET3942
nop


P3851: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P3852: !BLD [0] (FP)
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

P3853: !REPLACEMENT [9] (Int)
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

P3854: !BST [3] (maybe <- 0x43000086) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3855: !LD [5] (Int)
lduw [%i1 + 76], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P3856: !BST [13] (maybe <- 0x4300008a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P3857: !BLD [0] (FP)
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

P3858: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P3859: !BST [12] (maybe <- 0x4300008b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P3860: !BST [6] (maybe <- 0x4300008c) (FP)
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

P3861: !BST [2] (maybe <- 0x4300008f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3862: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P3863: !BLD [3] (FP)
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

P3864: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f9
fmovd %f36, %f10

P3865: !DWLD [15] (Int)
ldx [%i3 + 192], %l3
! move %l3(upper) -> %o4(lower)
srlx %l3, 32, %o5
or %o5, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P3866: !DWST [6] (maybe <- 0x3800016) (Int)
sllx %l4, 32, %l6 
add   %l4, 1, %l4
or %l6, %l4, %l6
stx %l6, [%i1 + 80]
add   %l4, 1, %l4

P3867: !BLD [7] (FP) (CBR)
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
be,pn  %xcc, TARGET3867
nop
RET3867:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P3868: !ST [11] (maybe <- 0x3800018) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P3869: !BLD [5] (FP)
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

P3870: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P3871: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P3872: !BLD [1] (FP)
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

P3873: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P3874: !BST [11] (maybe <- 0x43000093) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P3875: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f6

P3876: !BST [11] (maybe <- 0x43000094) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P3877: !PREFETCH [0] (Int) (Branch target of P3840)
prefetch [%i0 + 0], 1
ba P3878
nop

TARGET3840:
ba RET3840
nop


P3878: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P3879: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P3880: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P3881: !BST [15] (maybe <- 0x43000095) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P3882: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P3883: !BLD [3] (FP) (Branch target of P3975)
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
ba P3884
nop

TARGET3975:
ba RET3975
nop


P3884: !BST [15] (maybe <- 0x43000096) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P3885: !BLD [2] (FP)
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

P3886: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P3887: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P3888: !BST [6] (maybe <- 0x43000097) (FP)
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

P3889: !MEMBAR (Int)
membar #StoreLoad

P3890: !BST [15] (maybe <- 0x4300009a) (FP) (CBR)
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
be,pt  %xcc, TARGET3890
nop
RET3890:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P3891: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P3892: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P3893: !PREFETCH [6] (Int) (CBR)
prefetch [%i1 + 80], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3893
nop
RET3893:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P3894: !BST [0] (maybe <- 0x4300009b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3895: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P3896: !REPLACEMENT [10] (Int)
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

P3897: !CAS [13] (maybe <- 0x3800019) (Int)
add %i3, 64, %o5
lduw [%o5], %o0
mov %o0, %l7
! move %l7(lower) -> %o0(upper)
sllx %l7, 32, %o0
mov %l4, %l6
cas [%o5], %l7, %l6
! move %l6(lower) -> %o0(lower)
srl %l6, 0, %o5
or %o5, %o0, %o0
add   %l4, 1, %l4

P3898: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P3899: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P3900: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P3901: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f5
fmovd %f36, %f6

P3902: !SWAP [9] (maybe <- 0x380001a) (Int)
mov %l4, %o1
swap  [%i1 + 512], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P3903: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P3904: !BLD [5] (FP)
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

P3905: !BST [6] (maybe <- 0x4300009f) (FP)
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

P3906: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P3907: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P3908: !CAS [13] (maybe <- 0x380001b) (Int)
add %i3, 64, %l6
lduw [%l6], %o5
mov %o5, %l3
! move %l3(lower) -> %o1(lower)
or %l3, %o1, %o1
mov %l4, %o2
cas [%l6], %l3, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P3909: !BST [0] (maybe <- 0x430000a2) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3910: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P3911: !ST [13] (maybe <- 0x380001c) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P3912: !LD [14] (Int)
lduw [%i3 + 128], %o5
! move %o5(lower) -> %o2(lower)
or %o5, %o2, %o2

P3913: !BLD [5] (FP)
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

P3914: !BLD [1] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f0
membar #Sync 
! 4 addresses covered
fmovs %f3, %f2
fmovs %f8, %f3

P3915: !BST [10] (maybe <- 0x430000a6) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P3916: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f4

P3917: !CASX [4] (maybe <- 0x380001d) (Int)
add %i0, 64, %l3
ldx [%l3], %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
mov  %o3, %o5
sllx %l4, 32, %o4
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

P3918: !PREFETCH [3] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i0 + 32] %asi, 1

P3919: !BST [10] (maybe <- 0x430000a7) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P3920: !CASX [12] (maybe <- 0x380001e) (Int)
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

P3921: !BST [3] (maybe <- 0x430000a8) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3922: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P3923: !BST [4] (maybe <- 0x430000ac) (FP) (Branch target of P3655)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 
ba P3924
nop

TARGET3655:
ba RET3655
nop


P3924: !BST [10] (maybe <- 0x430000ad) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P3925: !BLD [15] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3925
nop
RET3925:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P3926: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P3927: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P3928: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P3929: !BST [14] (maybe <- 0x430000ae) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P3930: !PREFETCH [6] (Int) (CBR)
prefetch [%i1 + 80], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3930
nop
RET3930:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P3931: !DWST [2] (maybe <- 0x380001f) (Int)
mov %l4, %l3 
stx %l3, [%i0 + 8]
add   %l4, 1, %l4

P3932: !BLD [7] (FP)
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

P3933: !BST [13] (maybe <- 0x430000af) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P3934: !BST [6] (maybe <- 0x430000b0) (FP)
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

P3935: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P3936: !REPLACEMENT [8] (Int)
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

P3937: !BLD [3] (FP)
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

P3938: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f0
membar #Sync 
! 1 addresses covered

P3939: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P3940: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P3941: !BST [13] (maybe <- 0x430000b3) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P3942: !NOP (Int) (CBR)
nop

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3942
nop
RET3942:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P3943: !BST [1] (maybe <- 0x430000b4) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3944: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P3945: !BST [0] (maybe <- 0x430000b8) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3946: !ST [7] (maybe <- 0x3800020) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P3947: !DWLD [9] (Int)
ldx [%i1 + 512], %o2
! move %o2(upper) -> %o2(upper)

P3948: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P3949: !PREFETCH [0] (Int) (Branch target of P3647)
prefetch [%i0 + 0], 1
ba P3950
nop

TARGET3647:
ba RET3647
nop


P3950: !PREFETCH [15] (Int) (Branch target of P3760)
prefetch [%i3 + 192], 1
ba P3951
nop

TARGET3760:
ba RET3760
nop


P3951: !DWLD [9] (Int)
ldx [%i1 + 512], %l3
! move %l3(upper) -> %o2(lower)
srlx %o2, 32, %o2
sllx %o2, 32, %o2
srlx %l3, 32, %o5
or %o5, %o2, %o2

P3952: !PREFETCH [6] (Int) (CBR)
prefetch [%i1 + 80], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3952
nop
RET3952:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P3953: !LD [7] (Int)
lduw [%i1 + 84], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P3954: !ST [0] (maybe <- 0x3800021) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P3955: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P3956: !BST [6] (maybe <- 0x430000bc) (FP)
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

P3957: !BST [8] (maybe <- 0x430000bf) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P3958: !BST [12] (maybe <- 0x430000c0) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P3959: !ST [9] (maybe <- 0x3800022) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P3960: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P3961: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P3962: !BST [0] (maybe <- 0x430000c1) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3963: !LD [1] (Int)
lduw [%i0 + 4], %o5
! move %o5(lower) -> %o3(lower)
or %o5, %o3, %o3

P3964: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P3965: !BLD [11] (FP) (Branch target of P3930)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4
ba P3966
nop

TARGET3930:
ba RET3930
nop


P3966: !ST [6] (maybe <- 0x3800023) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P3967: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P3968: !BLD [6] (FP) (Branch target of P3638)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f5
fmovd %f36, %f6
ba P3969
nop

TARGET3638:
ba RET3638
nop


P3969: !BST [8] (maybe <- 0x430000c5) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P3970: !BST [14] (maybe <- 0x430000c6) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P3971: !PREFETCH [0] (Int) (Branch target of P3648)
prefetch [%i0 + 0], 1
ba P3972
nop

TARGET3648:
ba RET3648
nop


P3972: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P3973: !BST [6] (maybe <- 0x430000c7) (FP)
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

P3974: !BST [11] (maybe <- 0x430000ca) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P3975: !BST [14] (maybe <- 0x430000cb) (FP) (CBR)
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
be,pt  %xcc, TARGET3975
nop
RET3975:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P3976: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P3977: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P3978: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P3979: !BST [1] (maybe <- 0x430000cc) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3980: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P3981: !BLD [14] (FP) (Branch target of P3952)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11
ba P3982
nop

TARGET3952:
ba RET3952
nop


P3982: !BST [0] (maybe <- 0x430000d0) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3983: !LD [4] (Int)
lduw [%i0 + 64], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P3984: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P3985: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P3986: !BST [12] (maybe <- 0x430000d4) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P3987: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P3988: !BST [1] (maybe <- 0x430000d5) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3989: !BST [8] (maybe <- 0x430000d9) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P3990: !CAS [3] (maybe <- 0x3800024) (Int)
add %i0, 32, %l6
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

P3991: !BLD [3] (FP)
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

P3992: !BST [4] (maybe <- 0x430000da) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P3993: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f36, %f2

P3994: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P3995: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f4

P3996: !REPLACEMENT [11] (Int)
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

P3997: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P3998: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P3999: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P4000: !BLD [2] (FP)
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

P4001: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P4002: !BST [9] (maybe <- 0x430000db) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P4003: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P4004: !BST [13] (maybe <- 0x430000dc) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P4005: !BLD [2] (FP)
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

P4006: !BST [2] (maybe <- 0x430000dd) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P4007: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f0
membar #Sync 
! 3 addresses covered
fmovs %f3, %f0
fmovs %f4, %f1
fmovs %f5, %f2

P4008: !DWST [8] (maybe <- 0x3800025) (Int) (LE)
wr %g0, 0x88, %asi
! Change single-word-level endianess (big endian <-> little endian) 
sethi %hi(0xff00ff00), %o5
or %o5, %lo(0xff00ff00), %o5
and %l4, %o5, %l6
srl %l6, 8, %l6
sll %l4, 8, %l3
and %l3, %o5, %l3
or %l3, %l6, %l3
srl %l3, 16, %l6
sll %l3, 16, %l3
srl %l3, 0, %l3
or %l3, %l6, %l3
stxa %l3, [%i1 + 256 ] %asi
add   %l4, 1, %l4

P4009: !BST [5] (maybe <- 0x430000e1) (FP)
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

P4010: !BST [0] (maybe <- 0x430000e4) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P4011: !PREFETCH [11] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i2 + 64] %asi, 1

P4012: !BST [12] (maybe <- 0x430000e8) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P4013: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P4014: !CAS [14] (maybe <- 0x3800026) (Int)
add %i3, 128, %l3
lduw [%l3], %l7
mov %l7, %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0
mov %l4, %o1
cas [%l3], %o5, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P4015: !BST [5] (maybe <- 0x430000e9) (FP)
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

P4016: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P4017: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P4018: !BST [12] (maybe <- 0x430000ec) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P4019: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P4020: !BLD [0] (FP)
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

P4021: !MEMBAR (Int)
membar #StoreLoad

P4022: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P4023: !REPLACEMENT [0] (Int)
sethi %hi(0x0), %l6
or %l6, %lo(0x0),  %l6
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

P4024: !BST [8] (maybe <- 0x430000ed) (FP) (CBR)
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
be,pt  %xcc, TARGET4024
nop
RET4024:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P4025: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P4026: !BST [5] (maybe <- 0x430000ee) (FP)
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

P4027: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P4028: !DWST [0] (maybe <- 0x3800027) (Int)
sllx %l4, 32, %o5 
add   %l4, 1, %l4
or %o5, %l4, %o5
stx %o5, [%i0 + 0]
add   %l4, 1, %l4

P4029: !BST [9] (maybe <- 0x430000f1) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P4030: !BST [0] (maybe <- 0x430000f2) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P4031: !BST [0] (maybe <- 0x430000f6) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P4032: !BST [14] (maybe <- 0x430000fa) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P4033: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f10

P4034: !BST [12] (maybe <- 0x430000fb) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P4035: !LD [12] (FP)
ld [%i3 + 0], %f11
! 1 addresses covered

P4036: !DWST [6] (maybe <- 0x3800029) (Int)
sllx %l4, 32, %l6 
add   %l4, 1, %l4
or %l6, %l4, %l6
stx %l6, [%i1 + 80]
add   %l4, 1, %l4

P4037: !BLD [2] (FP)
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

P4038: !BST [2] (maybe <- 0x430000fc) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P4039: !PREFETCH [13] (Int) (Branch target of P3867)
prefetch [%i3 + 64], 1
ba P4040
nop

TARGET3867:
ba RET3867
nop


P4040: !CASX [5] (maybe <- 0x380002b) (Int)
add %i1, 72, %l3
ldx [%l3], %l7
! move %l7(upper) -> %o1(lower)
srlx %l7, 32, %o5
or %o5, %o1, %o1
! move %l7(lower) -> %o2(upper)
sllx %l7, 32, %o2
mov  %l7, %o5
mov %l4, %l7
casx [%l3], %o5, %l7
! move %l7(upper) -> %o2(lower)
srlx %l7, 32, %l3
or %l3, %o2, %o2
! move %l7(lower) -> %o3(upper)
sllx %l7, 32, %o3
add  %l4, 1, %l4

P4041: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P4042: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P4043: !BLD [15] (FP) (Branch target of P3893)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f0
membar #Sync 
! 1 addresses covered
ba P4044
nop

TARGET3893:
ba RET3893
nop


P4044: !BST [4] (maybe <- 0x43000100) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P4045: !DWST [10] (maybe <- 0x380002c) (Int)
mov %l4, %l7 
sllx %l7, 32, %l7 
stx %l7, [%i2 + 32 ] 
add   %l4, 1, %l4

P4046: !BST [6] (maybe <- 0x43000101) (FP)
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

P4047: !DWST [13] (maybe <- 0x380002d) (Int)
mov %l4, %l3 
sllx %l3, 32, %l3 
stx %l3, [%i3 + 64 ] 
add   %l4, 1, %l4

P4048: !LD [15] (Int)
lduw [%i3 + 192], %l3
! move %l3(lower) -> %o3(lower)
or %l3, %o3, %o3

P4049: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P4050: !BST [11] (maybe <- 0x43000104) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P4051: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f36, %f2

P4052: !LD [6] (Int) (CBR)
lduw [%i1 + 80], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET4052
nop
RET4052:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P4053: !ST [11] (maybe <- 0x380002e) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P4054: !MEMBAR (Int)
membar #StoreLoad

P4055: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P4056: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P4057: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P4058: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P4059: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P4060: !BST [4] (maybe <- 0x43000105) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P4061: !DWST [14] (maybe <- 0x380002f) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 128 ] 
add   %l4, 1, %l4

P4062: !BST [0] (maybe <- 0x43000106) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P4063: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f5
fmovd %f36, %f6

P4064: !BST [12] (maybe <- 0x4300010a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P4065: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P4066: !DWLD [0] (Int)
ldx [%i0 + 0], %o5
! move %o5(upper) -> %o4(lower)
srlx %o5, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5
! move %o5(lower) -> %o0(upper)
sllx %o5, 32, %o0

P4067: !BLD [0] (FP)
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

P4068: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P4069: !BST [8] (maybe <- 0x4300010b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P4070: !BLD [7] (FP)
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

P4071: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P4072: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P4073: !BST [0] (maybe <- 0x4300010c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P4074: !DWLD [7] (FP)
ldd [%i1 + 80], %f18
! 2 addresses covered
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

P4075: !BST [15] (maybe <- 0x43000110) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P4076: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P4077: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P4078: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P4079: !BST [15] (maybe <- 0x43000111) (FP) (CBR)
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
be,pn  %xcc, TARGET4079
nop
RET4079:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P4080: !BST [4] (maybe <- 0x43000112) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P4081: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P4082: !BST [3] (maybe <- 0x43000113) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P4083: !BLD [6] (FP)
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

P4084: !BST [15] (maybe <- 0x43000117) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P4085: !BST [2] (maybe <- 0x43000118) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P4086: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P4087: !BST [13] (maybe <- 0x4300011c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P4088: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P4089: !BST [2] (maybe <- 0x4300011d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P4090: !BST [12] (maybe <- 0x43000121) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P4091: !BLD [7] (FP)
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

P4092: !PREFETCH [8] (Int) (CBR)
prefetch [%i1 + 256], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET4092
nop
RET4092:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P4093: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P4094: !BST [10] (maybe <- 0x43000122) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P4095: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P4096: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P4097: !CAS [11] (maybe <- 0x3800030) (Int)
add %i2, 64, %o5
lduw [%o5], %l6
mov %l6, %l7
! move %l7(lower) -> %o0(lower)
or %l7, %o0, %o0
mov %l4, %o1
cas [%o5], %l7, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P4098: !BST [9] (maybe <- 0x43000123) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P4099: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P4100: !NOP (Int)
nop

P4101: !ST [11] (maybe <- 0x3800031) (Int) (Branch target of P3657)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4
ba P4102
nop

TARGET3657:
ba RET3657
nop


P4102: !BLD [1] (FP)
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

P4103: !DWLD [4] (Int)
ldx [%i0 + 64], %l6
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %l3
or %l3, %o1, %o1

P4104: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f1

P4105: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P4106: !LD [8] (Int)
lduw [%i1 + 256], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P4107: !BST [13] (maybe <- 0x43000124) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P4108: !PREFETCH [14] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i3 + 128] %asi, 1

P4109: !REPLACEMENT [4] (Int)
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

P4110: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P4111: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P4112: !LD [4] (Int)
lduw [%i0 + 64], %o5
! move %o5(lower) -> %o2(lower)
or %o5, %o2, %o2

P4113: !BST [3] (maybe <- 0x43000125) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P4114: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P4115: !BLD [1] (FP) (Branch target of P3925)
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
ba P4116
nop

TARGET3925:
ba RET3925
nop


P4116: !BST [13] (maybe <- 0x43000129) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P4117: !BST [0] (maybe <- 0x4300012a) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
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
be,pt  %xcc, TARGET4117
nop
RET4117:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P4118: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P4119: !BST [5] (maybe <- 0x4300012e) (FP)
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

P4120: !MEMBAR (Int)
membar #StoreLoad

P4121: !LD [0] (Int)
lduw [%i0 + 0], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P4122: !LD [1] (Int)
lduw [%i0 + 4], %l3
! move %l3(lower) -> %o3(lower)
or %l3, %o3, %o3

P4123: !LD [2] (Int)
lduw [%i0 + 12], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P4124: !LD [3] (Int)
lduw [%i0 + 32], %l3
! move %l3(lower) -> %o4(lower)
or %l3, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P4125: !LD [4] (Int)
lduw [%i0 + 64], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P4126: !LD [5] (Int)
lduw [%i1 + 76], %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0

P4127: !LD [6] (Int)
lduw [%i1 + 80], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P4128: !LD [7] (Int)
lduw [%i1 + 84], %l3
! move %l3(lower) -> %o1(lower)
or %l3, %o1, %o1

P4129: !LD [8] (Int)
lduw [%i1 + 256], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P4130: !LD [9] (Int)
lduw [%i1 + 512], %l3
! move %l3(lower) -> %o2(lower)
or %l3, %o2, %o2

P4131: !LD [10] (Int)
lduw [%i2 + 32], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P4132: !LD [11] (Int)
lduw [%i2 + 64], %l3
! move %l3(lower) -> %o3(lower)
or %l3, %o3, %o3

P4133: !LD [12] (Int)
lduw [%i3 + 0], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P4134: !LD [13] (Int) (LE)
wr %g0, 0x88, %asi
lduwa [%i3 + 64] %asi, %l3
! move %l3(lower) -> %o4(lower)
or %l3, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P4135: !LD [14] (Int)
lduw [%i3 + 128], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P4136: !LD [15] (Int)
lduw [%i3 + 192], %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0

END_NODES7: ! Test istream for CPU 7 ends
sethi %hi(0xdead0e0f), %l6
or    %l6, %lo(0xdead0e0f), %l6
! move %l6(lower) -> %o1(upper)
sllx %l6, 32, %o1
stw %l6, [%i5] 
ld [%i5], %f7
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30
fmovd %f6, %f30

restore
retl
nop

