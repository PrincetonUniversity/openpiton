// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tsotool_diag7_060903.s
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
! GEN.SEED 11
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

! Initialize LFSR to 0x138^4
sethi %hi(0x138), %l0
or    %l0, %lo(0x138), %l0
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

P1: !PREFETCH [5] (Int) (CBR)
prefetch [%i1 + 76], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1
nop
RET1:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P2: !BST [2] (maybe <- 0x3f800001) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3: !BST [2] (maybe <- 0x3f800005) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P4: !CAS [13] (maybe <- 0x1) (Int)
add %i3, 64, %l6
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

P5: !BST [3] (maybe <- 0x3f800009) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P6: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P7: !BST [5] (maybe <- 0x3f80000d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P8: !BST [15] (maybe <- 0x3f800010) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P9: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f0
membar #Sync 
! 1 addresses covered

P10: !BST [9] (maybe <- 0x3f800011) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P11: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P12: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P13: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P14: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P15: !BLD [1] (FP)
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

P16: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P17: !BST [10] (maybe <- 0x3f800012) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P18: !CAS [14] (maybe <- 0x2) (Int)
add %i3, 128, %l3
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

P19: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P20: !BST [7] (maybe <- 0x3f800013) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P21: !BST [12] (maybe <- 0x3f800016) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P22: !BLD [2] (FP)
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

P23: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f11
fmovd %f36, %f12

P24: !BST [5] (maybe <- 0x3f800017) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P25: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P26: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P27: !BST [13] (maybe <- 0x3f80001a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P28: !BST [14] (maybe <- 0x3f80001b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P29: !BST [0] (maybe <- 0x3f80001c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P30: !BST [14] (maybe <- 0x3f800020) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P31: !BST [7] (maybe <- 0x3f800021) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P32: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P33: !BLD [14] (FP)
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

P34: !BST [2] (maybe <- 0x3f800024) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P35: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f0
membar #Sync 
! 3 addresses covered
fmovs %f3, %f0
fmovs %f4, %f1
fmovs %f5, %f2

P36: !PREFETCH [11] (Int) (Branch target of P417)
prefetch [%i2 + 64], 1
ba P37
nop

TARGET417:
ba RET417
nop


P37: !BST [1] (maybe <- 0x3f800028) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P38: !LD [4] (Int) (Branch target of P458)
lduw [%i0 + 64], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
ba P39
nop

TARGET458:
ba RET458
nop


P39: !BST [15] (maybe <- 0x3f80002c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P40: !BLD [3] (FP)
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

P41: !BST [2] (maybe <- 0x3f80002d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P42: !LD [14] (Int)
lduw [%i3 + 128], %l7
! move %l7(lower) -> %o2(lower)
or %l7, %o2, %o2

P43: !BST [7] (maybe <- 0x3f800031) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P44: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P45: !PREFETCH [4] (Int) (Branch target of P240)
prefetch [%i0 + 64], 1
ba P46
nop

TARGET240:
ba RET240
nop


P46: !BLD [5] (FP)
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

P47: !PREFETCH [12] (Int) (Branch target of P434)
prefetch [%i3 + 0], 1
ba P48
nop

TARGET434:
ba RET434
nop


P48: !ST [7] (maybe <- 0x3f800034) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i1 + 84 ]

P49: !BST [14] (maybe <- 0x3f800035) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P50: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P51: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P52: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P53: !BLD [6] (FP)
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

P54: !BST [7] (maybe <- 0x3f800036) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P55: !REPLACEMENT [15] (Int)
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

P56: !BST [0] (maybe <- 0x3f800039) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P57: !MEMBAR (Int)
membar #StoreLoad

P58: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f0
membar #Sync 
! 3 addresses covered
fmovs %f3, %f0
fmovs %f4, %f1
fmovs %f5, %f2

P59: !BST [10] (maybe <- 0x3f80003d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P60: !LD [6] (Int)
lduw [%i1 + 80], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P61: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P62: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f3
fmovd %f36, %f4

P63: !BST [3] (maybe <- 0x3f80003e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P64: !BST [9] (maybe <- 0x3f800042) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P65: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P66: !BST [3] (maybe <- 0x3f800043) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P67: !BLD [7] (FP)
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

P68: !BST [10] (maybe <- 0x3f800047) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P69: !BST [15] (maybe <- 0x3f800048) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P70: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P71: !REPLACEMENT [6] (Int) (CBR)
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

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET71
nop
RET71:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P72: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P73: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P74: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P75: !BST [7] (maybe <- 0x3f800049) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
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
be,pn  %xcc, TARGET75
nop
RET75:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P76: !DWST [5] (maybe <- 0x3) (Int)
mov %l4, %l6 
stx %l6, [%i1 + 72]
add   %l4, 1, %l4

P77: !BST [4] (maybe <- 0x3f80004c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P78: !BST [5] (maybe <- 0x3f80004d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P79: !BLD [0] (FP)
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

P80: !BLD [3] (FP)
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

P81: !BST [2] (maybe <- 0x3f800050) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P82: !ST [7] (maybe <- 0x4) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P83: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f3
fmovd %f36, %f4

P84: !PREFETCH [5] (Int) (Branch target of P298)
prefetch [%i1 + 76], 1
ba P85
nop

TARGET298:
ba RET298
nop


P85: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f6

P86: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P87: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P88: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P89: !LD [3] (Int)
lduw [%i0 + 32], %l6
! move %l6(lower) -> %o3(lower)
or %l6, %o3, %o3

P90: !BST [6] (maybe <- 0x3f800054) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P91: !BST [12] (maybe <- 0x3f800057) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P92: !ST [6] (maybe <- 0x5) (Int) (Branch target of P194)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4
ba P93
nop

TARGET194:
ba RET194
nop


P93: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P94: !BLD [3] (FP)
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

P95: !BST [1] (maybe <- 0x3f800058) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P96: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P97: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P98: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P99: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P100: !BLD [5] (FP)
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

P101: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P102: !BST [1] (maybe <- 0x3f80005c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P103: !ST [0] (maybe <- 0x6) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P104: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f0
membar #Sync 
! 1 addresses covered

P105: !BST [0] (maybe <- 0x3f800060) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P106: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P107: !BLD [3] (FP)
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

P108: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P109: !PREFETCH [14] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i3 + 128] %asi, 1

P110: !DWLD [10] (Int) (LE) (CBR)
wr %g0, 0x88, %asi
ldxa [%i2 + 32] %asi, %l3
! move %l3(lower) -> %o4(upper)
sllx %l3, 32, %o4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET110
nop
RET110:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P111: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P112: !BST [0] (maybe <- 0x3f800064) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P113: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f36, %f8

P114: !BST [8] (maybe <- 0x3f800068) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P115: !PREFETCH [1] (Int) (Branch target of P71)
prefetch [%i0 + 4], 1
ba P116
nop

TARGET71:
ba RET71
nop


P116: !PREFETCH [15] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i3 + 192] %asi, 1

P117: !BST [2] (maybe <- 0x3f800069) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P118: !BST [6] (maybe <- 0x3f80006d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P119: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P120: !BLD [2] (FP)
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

P121: !BST [3] (maybe <- 0x3f800070) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P122: !BST [7] (maybe <- 0x3f800074) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P123: !DWLD [2] (Int)
ldx [%i0 + 8], %l6
! move %l6(lower) -> %o4(lower)
srl %l6, 0, %l3
or %l3, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P124: !PREFETCH [7] (Int) (Branch target of P475)
prefetch [%i1 + 84], 1
ba P125
nop

TARGET475:
ba RET475
nop


P125: !BLD [5] (FP)
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

P126: !BST [4] (maybe <- 0x3f800077) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P127: !BST [2] (maybe <- 0x3f800078) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P128: !PREFETCH [10] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i2 + 32] %asi, 1

P129: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P130: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P131: !BST [7] (maybe <- 0x3f80007c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P132: !DWLD [7] (FP)
ldd [%i1 + 80], %f18
! 2 addresses covered
fmovs %f18, %f1
fmovs %f19, %f2

P133: !LD [8] (Int)
lduw [%i1 + 256], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P134: !BST [4] (maybe <- 0x3f80007f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P135: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P136: !BST [6] (maybe <- 0x3f800080) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P137: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P138: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P139: !BST [1] (maybe <- 0x3f800083) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P140: !DWST [13] (maybe <- 0x7) (Int)
mov %l4, %l7 
sllx %l7, 32, %l7 
stx %l7, [%i3 + 64 ] 
add   %l4, 1, %l4

P141: !BST [4] (maybe <- 0x3f800087) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P142: !LD [14] (Int)
lduw [%i3 + 128], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

P143: !BLD [2] (FP)
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

P144: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P145: !BLD [0] (FP)
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

P146: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P147: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P148: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P149: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P150: !CAS [9] (maybe <- 0x8) (Int) (Branch target of P193)
add %i1, 512, %o5
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
ba P151
nop

TARGET193:
ba RET193
nop


P151: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P152: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P153: !BST [3] (maybe <- 0x3f800088) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P154: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P155: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P156: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P157: !LD [14] (Int) (LE)
wr %g0, 0x88, %asi
lduwa [%i3 + 128] %asi, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P158: !BLD [9] (FP)
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

P159: !LD [4] (Int)
lduw [%i0 + 64], %l3
! move %l3(lower) -> %o2(lower)
or %l3, %o2, %o2

P160: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f0
membar #Sync 
! 1 addresses covered

P161: !BST [1] (maybe <- 0x3f80008c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P162: !BST [1] (maybe <- 0x3f800090) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P163: !LD [12] (Int)
lduw [%i3 + 0], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P164: !BST [9] (maybe <- 0x3f800094) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P165: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P166: !BST [6] (maybe <- 0x3f800095) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P167: !BST [11] (maybe <- 0x3f800098) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P168: !BST [15] (maybe <- 0x3f800099) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P169: !BST [2] (maybe <- 0x3f80009a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P170: !BST [5] (maybe <- 0x3f80009e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P171: !REPLACEMENT [15] (Int)
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

P172: !DWLD [7] (Int)
ldx [%i1 + 80], %o5
! move %o5(upper) -> %o3(lower)
srlx %o5, 32, %l7
or %l7, %o3, %o3
! move %o5(lower) -> %o4(upper)
sllx %o5, 32, %o4

P173: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P174: !ST [11] (maybe <- 0x9) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P175: !BLD [5] (FP)
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

P176: !BLD [2] (FP)
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

P177: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P178: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P179: !BST [8] (maybe <- 0x3f8000a1) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P180: !LD [7] (Int)
lduw [%i1 + 84], %o5
! move %o5(lower) -> %o4(lower)
or %o5, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P181: !BST [10] (maybe <- 0x3f8000a2) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P182: !PREFETCH [13] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i3 + 64] %asi, 1

P183: !BST [3] (maybe <- 0x3f8000a3) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P184: !REPLACEMENT [3] (Int)
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

P185: !PREFETCH [15] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i3 + 192] %asi, 1

P186: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f9
fmovd %f36, %f10

P187: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P188: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P189: !BST [4] (maybe <- 0x3f8000a7) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P190: !CAS [12] (maybe <- 0xa) (Int)
add %i3, 0, %l6
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

P191: !BLD [6] (FP)
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

P192: !BST [14] (maybe <- 0x3f8000a8) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P193: !BST [2] (maybe <- 0x3f8000a9) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
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
be,pn  %xcc, TARGET193
nop
RET193:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P194: !BLD [8] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f0
membar #Sync 
! 1 addresses covered

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET194
nop
RET194:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P195: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P196: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P197: !BST [12] (maybe <- 0x3f8000ad) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P198: !BST [12] (maybe <- 0x3f8000ae) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P199: !BLD [1] (FP)
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

P200: !BLD [2] (FP)
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

P201: !BLD [5] (FP)
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

P202: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P203: !DWLD [0] (Int)
ldx [%i0 + 0], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)

P204: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P205: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P206: !BST [10] (maybe <- 0x3f8000af) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P207: !BLD [0] (FP)
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

P208: !DWST [0] (maybe <- 0xb) (Int)
sllx %l4, 32, %o5 
add   %l4, 1, %l4
or %o5, %l4, %o5
stx %o5, [%i0 + 0]
add   %l4, 1, %l4

P209: !BST [6] (maybe <- 0x3f8000b0) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P210: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P211: !LD [8] (Int) (LE)
wr %g0, 0x88, %asi
lduwa [%i1 + 256] %asi, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P212: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f36, %f2

P213: !ST [2] (maybe <- 0xd) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P214: !BLD [6] (FP)
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

P215: !BLD [3] (FP)
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

P216: !PREFETCH [1] (Int) (CBR)
prefetch [%i0 + 4], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET216
nop
RET216:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P217: !BST [1] (maybe <- 0x3f8000b3) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P218: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P219: !BLD [5] (FP) (Branch target of P508)
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
ba P220
nop

TARGET508:
ba RET508
nop


P220: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P221: !BLD [8] (FP)
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

P222: !BST [5] (maybe <- 0x3f8000b7) (FP) (Branch target of P386)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 
ba P223
nop

TARGET386:
ba RET386
nop


P223: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f0
membar #Sync 
! 1 addresses covered

P224: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P225: !BST [4] (maybe <- 0x3f8000ba) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P226: !LD [12] (FP)
ld [%i3 + 0], %f1
! 1 addresses covered

P227: !REPLACEMENT [6] (Int)
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

P228: !BST [14] (maybe <- 0x3f8000bb) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P229: !BLD [15] (FP) (Branch target of P294)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2
ba P230
nop

TARGET294:
ba RET294
nop


P230: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P231: !BST [13] (maybe <- 0x3f8000bc) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P232: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P233: !BLD [0] (FP)
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

P234: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P235: !BLD [3] (FP)
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

P236: !BST [6] (maybe <- 0x3f8000bd) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P237: !ST [14] (maybe <- 0x3f8000c0) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i3 + 128 ]

P238: !BST [7] (maybe <- 0x3f8000c1) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P239: !BST [4] (maybe <- 0x3f8000c4) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P240: !BST [2] (maybe <- 0x3f8000c5) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
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
be,pn  %xcc, TARGET240
nop
RET240:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P241: !BST [1] (maybe <- 0x3f8000c9) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P242: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P243: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P244: !BST [3] (maybe <- 0x3f8000cd) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P245: !BST [10] (maybe <- 0x3f8000d1) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P246: !BST [7] (maybe <- 0x3f8000d2) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
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
be,pt  %xcc, TARGET246
nop
RET246:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P247: !BST [0] (maybe <- 0x3f8000d5) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P248: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f11
fmovd %f36, %f12

P249: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P250: !LD [4] (Int)
lduw [%i0 + 64], %l7
! move %l7(lower) -> %o2(lower)
or %l7, %o2, %o2

P251: !BST [6] (maybe <- 0x3f8000d9) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P252: !ST [9] (maybe <- 0xe) (Int) (CBR)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET252
nop
RET252:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P253: !BLD [2] (FP)
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

P254: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P255: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P256: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P257: !SWAP [1] (maybe <- 0xf) (Int) (LE)
wr %g0, 0x88, %asi
mov %l4, %o3
! Change single-word-level endianess (big endian <-> little endian) 
sethi %hi(0xff00ff00), %l7
or %l7, %lo(0xff00ff00), %l7
and %o3, %l7, %o5
srl %o5, 8, %o5
sll %o3, 8, %o3
and %o3, %l7, %o3
or %o3, %o5, %o3
srl %o3, 16, %o5
sll %o3, 16, %o3
srl %o3, 0, %o3
or %o3, %o5, %o3
swapa  [%i0 + 4] %asi, %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P258: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P259: !BST [13] (maybe <- 0x3f8000dc) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P260: !BST [0] (maybe <- 0x3f8000dd) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P261: !BLD [0] (FP)
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

P262: !LD [9] (FP)
ld [%i1 + 512], %f8
! 1 addresses covered

P263: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P264: !BST [13] (maybe <- 0x3f8000e1) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P265: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P266: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P267: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P268: !BST [4] (maybe <- 0x3f8000e2) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P269: !BLD [3] (FP)
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

P270: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P271: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P272: !BST [12] (maybe <- 0x3f8000e3) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P273: !BST [11] (maybe <- 0x3f8000e4) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P274: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f14

P275: !DWST [8] (maybe <- 0x10) (Int) (Branch target of P493)
mov %l4, %o5 
sllx %o5, 32, %o5 
stx %o5, [%i1 + 256 ] 
add   %l4, 1, %l4
ba P276
nop

TARGET493:
ba RET493
nop


P276: !BLD [11] (FP)
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

P277: !PREFETCH [7] (Int) (Branch target of P246)
prefetch [%i1 + 84], 1
ba P278
nop

TARGET246:
ba RET246
nop


P278: !BST [10] (maybe <- 0x3f8000e5) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P279: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f0
membar #Sync 
! 1 addresses covered

P280: !CAS [14] (maybe <- 0x11) (Int)
add %i3, 128, %l7
lduw [%l7], %l3
mov %l3, %l6
! move %l6(lower) -> %o3(lower)
or %l6, %o3, %o3
mov %l4, %o4
cas [%l7], %l6, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P281: !BST [9] (maybe <- 0x3f8000e6) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P282: !BST [2] (maybe <- 0x3f8000e7) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P283: !BST [11] (maybe <- 0x3f8000eb) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P284: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P285: !BST [11] (maybe <- 0x3f8000ec) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P286: !BST [2] (maybe <- 0x3f8000ed) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P287: !PREFETCH [8] (Int) (Branch target of P395)
prefetch [%i1 + 256], 1
ba P288
nop

TARGET395:
ba RET395
nop


P288: !BLD [0] (FP) (CBR)
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

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET288
nop
RET288:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P289: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P290: !NOP (Int)
nop

P291: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P292: !REPLACEMENT [4] (Int)
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

P293: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P294: !REPLACEMENT [0] (Int) (CBR)
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

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET294
nop
RET294:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P295: !BST [15] (maybe <- 0x3f8000f1) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P296: !BLD [2] (FP)
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

P297: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f11

P298: !PREFETCH [5] (Int) (CBR)
prefetch [%i1 + 76], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET298
nop
RET298:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P299: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P300: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P301: !BST [6] (maybe <- 0x3f8000f2) (FP) (Branch target of P1)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 
ba P302
nop

TARGET1:
ba RET1
nop


P302: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P303: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P304: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P305: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P306: !DWLD [0] (Int)
ldx [%i0 + 0], %l3
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

P307: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P308: !DWLD [5] (Int)
ldx [%i1 + 72], %l7
! move %l7(lower) -> %o0(lower)
srl %l7, 0, %l6
or %l6, %o0, %o0

P309: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P310: !BLD [8] (FP)
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

P311: !PREFETCH [4] (Int) (Branch target of P441)
prefetch [%i0 + 64], 1
ba P312
nop

TARGET441:
ba RET441
nop


P312: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P313: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P314: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f0
membar #Sync 
! 1 addresses covered

P315: !PREFETCH [7] (Int) (Branch target of P110)
prefetch [%i1 + 84], 1
ba P316
nop

TARGET110:
ba RET110
nop


P316: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P317: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P318: !BST [3] (maybe <- 0x3f8000f5) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P319: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P320: !REPLACEMENT [1] (Int)
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

P321: !CAS [10] (maybe <- 0x12) (Int)
add %i2, 32, %l7
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

P322: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P323: !MEMBAR (Int)
membar #StoreLoad

P324: !BST [3] (maybe <- 0x3f8000f9) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P325: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P326: !BLD [3] (FP)
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

P327: !CASX [15] (maybe <- 0x13) (Int)
add %i3, 192, %l6
ldx [%l6], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov  %o2, %l3
sllx %l4, 32, %o3
casx [%l6], %l3, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4

P328: !BLD [3] (FP)
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

P329: !BLD [0] (FP)
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

P330: !BST [4] (maybe <- 0x3f8000fd) (FP) (Branch target of P489)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 
ba P331
nop

TARGET489:
ba RET489
nop


P331: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f36, %f2

P332: !DWLD [2] (Int)
ldx [%i0 + 8], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P333: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P334: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P335: !DWLD [5] (Int)
ldx [%i1 + 72], %l7
! move %l7(lower) -> %o4(lower)
srl %l7, 0, %l6
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P336: !BLD [1] (FP)
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

P337: !LD [2] (Int)
lduw [%i0 + 12], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P338: !BST [6] (maybe <- 0x3f8000fe) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P339: !BLD [2] (FP)
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

P340: !BST [0] (maybe <- 0x3f800101) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P341: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P342: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P343: !BST [7] (maybe <- 0x3f800105) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P344: !BST [1] (maybe <- 0x3f800108) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P345: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P346: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P347: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P348: !BLD [3] (FP)
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

P349: !BLD [2] (FP)
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

P350: !BLD [10] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f7

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET350
nop
RET350:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P351: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f8

P352: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P353: !MEMBAR (Int)
membar #StoreLoad

P354: !BLD [7] (FP) (CBR)
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
be,pn  %xcc, TARGET354
nop
RET354:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P355: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P356: !REPLACEMENT [8] (Int)
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

P357: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P358: !BST [11] (maybe <- 0x3f80010c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P359: !DWLD [11] (Int)
ldx [%i2 + 64], %l7
! move %l7(upper) -> %o0(lower)
srlx %l7, 32, %l6
or %l6, %o0, %o0

P360: !BST [4] (maybe <- 0x3f80010d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P361: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P362: !DWST [10] (maybe <- 0x14) (Int)
mov %l4, %l7 
sllx %l7, 32, %l7 
stx %l7, [%i2 + 32 ] 
add   %l4, 1, %l4

P363: !LD [0] (Int)
lduw [%i0 + 0], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P364: !PREFETCH [2] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i0 + 12] %asi, 1

P365: !BST [1] (maybe <- 0x3f80010e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P366: !CAS [1] (maybe <- 0x15) (Int)
add %i0, 4, %o5
lduw [%o5], %l6
mov %l6, %l7
! move %l7(lower) -> %o1(lower)
or %l7, %o1, %o1
mov %l4, %o2
cas [%o5], %l7, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P367: !BST [2] (maybe <- 0x3f800112) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P368: !BLD [6] (FP) (Branch target of P455)
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
ba P369
nop

TARGET455:
ba RET455
nop


P369: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P370: !ST [2] (maybe <- 0x16) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P371: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P372: !BLD [0] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f0
membar #Sync 
! 4 addresses covered
fmovs %f3, %f2
fmovs %f8, %f3

P373: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P374: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P375: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P376: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P377: !BST [3] (maybe <- 0x3f800116) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P378: !BST [3] (maybe <- 0x3f80011a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P379: !BST [8] (maybe <- 0x3f80011e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P380: !ST [12] (maybe <- 0x3f80011f) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i3 + 0 ]

P381: !CASX [15] (maybe <- 0x17) (Int)
add %i3, 192, %l6
ldx [%l6], %o5
! move %o5(upper) -> %o2(lower)
srlx %o5, 32, %l3
or %l3, %o2, %o2
! move %o5(lower) -> %o3(upper)
sllx %o5, 32, %o3
mov  %o5, %l3
sllx %l4, 32, %o5
casx [%l6], %l3, %o5
! move %o5(upper) -> %o3(lower)
srlx %o5, 32, %l6
or %l6, %o3, %o3
! move %o5(lower) -> %o4(upper)
sllx %o5, 32, %o4
add  %l4, 1, %l4

P382: !BST [15] (maybe <- 0x3f800120) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P383: !BLD [1] (FP)
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

P384: !BST [9] (maybe <- 0x3f800121) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P385: !SWAP [8] (maybe <- 0x18) (Int)
mov %l4, %l3
swap  [%i1 + 256], %l3
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

P386: !BLD [4] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET386
nop
RET386:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P387: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P388: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P389: !DWST [12] (maybe <- 0x3f800122) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
std %f20, [%i3 + 0]

P390: !BST [2] (maybe <- 0x3f800123) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P391: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P392: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P393: !BST [7] (maybe <- 0x3f800127) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P394: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P395: !BLD [10] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f11

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET395
nop
RET395:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P396: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P397: !BLD [3] (FP)
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

P398: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P399: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P400: !BST [6] (maybe <- 0x3f80012a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P401: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P402: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P403: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P404: !BLD [1] (FP)
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

P405: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P406: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P407: !REPLACEMENT [15] (Int)
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

P408: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P409: !DWLD [12] (Int) (Branch target of P354)
ldx [%i3 + 0], %o0
! move %o0(upper) -> %o0(upper)
ba P410
nop

TARGET354:
ba RET354
nop


P410: !MEMBAR (Int)
membar #StoreLoad

P411: !BST [6] (maybe <- 0x3f80012d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P412: !CAS [15] (maybe <- 0x19) (Int) (Branch target of P512)
add %i3, 192, %l3
lduw [%l3], %l7
mov %l7, %o5
! move %o5(lower) -> %o0(lower)
srlx %o0, 32, %o0
sllx %o0, 32, %o0
or %o5, %o0, %o0
mov %l4, %o1
cas [%l3], %o5, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4
ba P413
nop

TARGET512:
ba RET512
nop


P413: !DWST [13] (maybe <- 0x1a) (Int)
mov %l4, %o5 
sllx %o5, 32, %o5 
stx %o5, [%i3 + 64 ] 
add   %l4, 1, %l4

P414: !BST [12] (maybe <- 0x3f800130) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P415: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P416: !BST [6] (maybe <- 0x3f800131) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P417: !BLD [1] (FP) (CBR)
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
be,pt  %xcc, TARGET417
nop
RET417:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P418: !BST [0] (maybe <- 0x3f800134) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P419: !BLD [8] (FP) (Branch target of P350)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14
ba P420
nop

TARGET350:
ba RET350
nop


P420: !BLD [12] (FP)
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

P421: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f0
membar #Sync 
! 3 addresses covered
fmovs %f3, %f0
fmovs %f4, %f1
fmovs %f5, %f2

P422: !DWST [15] (maybe <- 0x1b) (Int) (LE)
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
stxa %l6, [%i3 + 192 ] %asi
add   %l4, 1, %l4

P423: !MEMBAR (Int)
membar #StoreLoad

P424: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P425: !DWLD [11] (Int)
ldx [%i2 + 64], %l3
! move %l3(upper) -> %o1(lower)
srlx %l3, 32, %o5
or %o5, %o1, %o1

P426: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P427: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P428: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P429: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P430: !BST [2] (maybe <- 0x3f800138) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P431: !BLD [7] (FP) (Branch target of P216)
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
ba P432
nop

TARGET216:
ba RET216
nop


P432: !ST [5] (maybe <- 0x1c) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P433: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P434: !BLD [0] (FP) (CBR)
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
be,pn  %xcc, TARGET434
nop
RET434:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P435: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P436: !BST [6] (maybe <- 0x3f80013c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P437: !BST [5] (maybe <- 0x3f80013f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P438: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P439: !BLD [7] (FP)
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

P440: !CASX [3] (maybe <- 0x1d) (Int) (LE)
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
add %i0, 32, %o5
ldxa [%o5] %asi, %l6
! move %l6(lower) -> %o2(upper)
sllx %l6, 32, %o2
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l7
or %l7, %o2, %o2
mov  %l6, %l7
mov  %l3, %l6
casxa [%o5] %asi, %l7, %l6
! move %l6(lower) -> %o3(upper)
sllx %l6, 32, %o3
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %o5
or %o5, %o3, %o3
add  %l4, 1, %l4

P441: !BLD [4] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET441
nop
RET441:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P442: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P443: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P444: !DWST [8] (maybe <- 0x1e) (Int)
mov %l4, %o5 
sllx %o5, 32, %o5 
stx %o5, [%i1 + 256 ] 
add   %l4, 1, %l4

P445: !BST [13] (maybe <- 0x3f800142) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P446: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P447: !LD [4] (Int)
lduw [%i0 + 64], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P448: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P449: !BST [8] (maybe <- 0x3f800143) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P450: !BST [11] (maybe <- 0x3f800144) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P451: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P452: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P453: !BLD [2] (FP)
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

P454: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P455: !BLD [9] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET455
nop
RET455:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P456: !BLD [2] (FP)
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

P457: !SWAP [9] (maybe <- 0x1f) (Int)
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

P458: !BLD [8] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f0
membar #Sync 
! 1 addresses covered

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET458
nop
RET458:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P459: !BLD [0] (FP)
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

P460: !BST [11] (maybe <- 0x3f800145) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P461: !BST [8] (maybe <- 0x3f800146) (FP) (Branch target of P252)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 
ba P462
nop

TARGET252:
ba RET252
nop


P462: !LD [1] (Int)
lduw [%i0 + 4], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P463: !BST [10] (maybe <- 0x3f800147) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P464: !PREFETCH [0] (Int) (LE) (Branch target of P75)
wr %g0, 0x88, %asi
prefetcha [%i0 + 0] %asi, 1
ba P465
nop

TARGET75:
ba RET75
nop


P465: !BST [8] (maybe <- 0x3f800148) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P466: !DWLD [3] (Int)
ldx [%i0 + 32], %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l3
or %l3, %o0, %o0

P467: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P468: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P469: !BST [9] (maybe <- 0x3f800149) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P470: !BST [15] (maybe <- 0x3f80014a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P471: !BST [13] (maybe <- 0x3f80014b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P472: !BST [2] (maybe <- 0x3f80014c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P473: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P474: !BST [0] (maybe <- 0x3f800150) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P475: !BLD [0] (FP) (CBR)
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

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET475
nop
RET475:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P476: !LD [13] (Int)
lduw [%i3 + 64], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P477: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P478: !DWST [5] (maybe <- 0x20) (Int)
mov %l4, %l3 
stx %l3, [%i1 + 72]
add   %l4, 1, %l4

P479: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P480: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P481: !DWST [1] (maybe <- 0x21) (Int)
sllx %l4, 32, %o5 
add   %l4, 1, %l4
or %o5, %l4, %o5
stx %o5, [%i0 + 0]
add   %l4, 1, %l4

P482: !BLD [3] (FP)
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

P483: !BST [14] (maybe <- 0x3f800154) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P484: !BLD [5] (FP)
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

P485: !BST [2] (maybe <- 0x3f800155) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P486: !BST [6] (maybe <- 0x3f800159) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P487: !CAS [7] (maybe <- 0x23) (Int)
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

P488: !BST [0] (maybe <- 0x3f80015c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P489: !BLD [13] (FP) (CBR) (Branch target of P288)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET489
nop
RET489:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0

ba P490
nop

TARGET288:
ba RET288
nop


P490: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P491: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P492: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P493: !BST [2] (maybe <- 0x3f800160) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
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
be,pt  %xcc, TARGET493
nop
RET493:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P494: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P495: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f3
fmovd %f36, %f4

P496: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P497: !BLD [3] (FP)
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

P498: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P499: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f11
fmovd %f36, %f12

P500: !BST [8] (maybe <- 0x3f800164) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P501: !MEMBAR (Int)
membar #StoreLoad

P502: !LD [0] (Int)
lduw [%i0 + 0], %o5
! move %o5(lower) -> %o2(lower)
or %o5, %o2, %o2

P503: !LD [1] (Int)
lduw [%i0 + 4], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P504: !LD [2] (Int)
lduw [%i0 + 12], %o5
! move %o5(lower) -> %o3(lower)
or %o5, %o3, %o3

P505: !LD [3] (Int)
lduw [%i0 + 32], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P506: !LD [4] (Int)
lduw [%i0 + 64], %o5
! move %o5(lower) -> %o4(lower)
or %o5, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P507: !LD [5] (Int) (LE)
wr %g0, 0x88, %asi
lduwa [%i1 + 76] %asi, %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P508: !LD [6] (Int) (CBR)
lduw [%i1 + 80], %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET508
nop
RET508:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P509: !LD [7] (Int)
lduw [%i1 + 84], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P510: !LD [8] (Int)
lduw [%i1 + 256], %l3
! move %l3(lower) -> %o1(lower)
or %l3, %o1, %o1

P511: !LD [9] (Int)
lduw [%i1 + 512], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P512: !LD [10] (Int) (CBR)
lduw [%i2 + 32], %l3
! move %l3(lower) -> %o2(lower)
or %l3, %o2, %o2

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET512
nop
RET512:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P513: !LD [11] (Int)
lduw [%i2 + 64], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P514: !LD [12] (Int)
lduw [%i3 + 0], %l6
! move %l6(lower) -> %o3(lower)
or %l6, %o3, %o3

P515: !LD [13] (Int)
lduw [%i3 + 64], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P516: !LD [14] (Int)
lduw [%i3 + 128], %l6
! move %l6(lower) -> %o4(lower)
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P517: !LD [15] (Int)
lduw [%i3 + 192], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

END_NODES0: ! Test istream for CPU 0 ends
sethi %hi(0xdead0e0f), %l3
or    %l3, %lo(0xdead0e0f), %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0
stw %l3, [%i5] 
ld [%i5], %f14
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
sethi %hi(0xdeadbee0), %o5
or    %o5, %lo(0xdeadbee0), %o5
stw   %o5, [%i5]
sethi %hi(0xdeadbee1), %o5
or    %o5, %lo(0xdeadbee1), %o5
stw   %o5, [%i5+4]
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
sethi %hi(0x01deade1), %o5
or    %o5, %lo(0x01deade1), %o5
stw %o5, [%i5] 
ld [%i5], %f16

! Initialize running integer counter in register %l4
sethi %hi(0x800001), %l4
or    %l4, %lo(0x800001), %l4

! Initialize running FP counter in register %f16
sethi %hi(0x40000001), %o5
or    %o5, %lo(0x40000001), %o5
stw %o5, [%i5] 
ld [%i5], %f16

! Initialize FP counter increment value in register %f17 (constant)
sethi %hi(0x34800000), %o5
or    %o5, %lo(0x34800000), %o5
stw %o5, [%i5] 
ld [%i5], %f17 

! Initialize LFSR to 0x5a60^4
sethi %hi(0x5a60), %l0
or    %l0, %lo(0x5a60), %l0
mulx  %l0, %l0, %l0
mulx  %l0, %l0, %l0

!-- init shared addrs 2 to 3 ---
stx %g0, [%i0+8]
stx %g0, [%i0+32]

! use untouched cache-line (offset 4K) in replacement area for sync
sub %i1, %i0, %l3
add %i3, %l3, %l3
sub %l3, -4096, %l3

!-- begin of sync_init ---
or %g0, 1, %l6
or %g0, %l6, %l7
swap [%l3+4], %l7
membar #Sync
sync_init_1_1:
brnz,pt %l6, sync_init_1_1
lduw [%l3+4], %l6 ! delay slot
sync_init_2_1:
lduw [%l3], %l6
sub %l6, 1, %l7
cas [%l3], %l6, %l7
cmp %l6, %l7
bne,pt %xcc, sync_init_2_1
nop
membar #Sync
sync_init_3_1:
lduw [%l3], %l6 ! delay slot
brnz,pt %l6, sync_init_3_1
nop
!-- end of sync_init ---


BEGIN_NODES1: ! Test istream for CPU 1 begins

P518: !BST [9] (maybe <- 0x40000001) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P519: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f0
membar #Sync 
! 1 addresses covered

P520: !BLD [1] (FP)
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

P521: !BLD [2] (FP)
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

P522: !BLD [2] (FP)
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

P523: !BST [10] (maybe <- 0x40000002) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P524: !DWLD [3] (Int)
ldx [%i0 + 32], %o0
! move %o0(upper) -> %o0(upper)

P525: !BST [0] (maybe <- 0x40000003) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P526: !CAS [2] (maybe <- 0x800001) (Int)
add %i0, 12, %o5
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

P527: !DWLD [6] (Int)
ldx [%i1 + 80], %o5
! move %o5(upper) -> %o1(lower)
srlx %o5, 32, %l7
or %l7, %o1, %o1
! move %o5(lower) -> %o2(upper)
sllx %o5, 32, %o2

P528: !BST [9] (maybe <- 0x40000007) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P529: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P530: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P531: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P532: !REPLACEMENT [14] (Int)
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

P533: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P534: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P535: !REPLACEMENT [3] (Int)
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

P536: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P537: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P538: !PREFETCH [0] (Int) (CBR)
prefetch [%i0 + 0], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET538
nop
RET538:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


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

P540: !BST [10] (maybe <- 0x40000008) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P541: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P542: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P543: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f3
fmovd %f36, %f4

P544: !BLD [2] (FP)
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

P545: !DWLD [14] (Int)
ldx [%i3 + 128], %l7
! move %l7(upper) -> %o2(lower)
srlx %l7, 32, %l6
or %l6, %o2, %o2

P546: !BLD [3] (FP)
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

P547: !BLD [3] (FP)
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

P548: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P549: !BST [5] (maybe <- 0x40000009) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P550: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P551: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P552: !BLD [2] (FP)
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

P553: !BST [8] (maybe <- 0x4000000c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P554: !BST [9] (maybe <- 0x4000000d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P555: !DWLD [6] (Int)
ldx [%i1 + 80], %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)

P556: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P557: !DWST [13] (maybe <- 0x800002) (Int)
mov %l4, %l7 
sllx %l7, 32, %l7 
stx %l7, [%i3 + 64 ] 
add   %l4, 1, %l4

P558: !BLD [5] (FP)
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

P559: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P560: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P561: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P562: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P563: !BLD [2] (FP) (CBR)
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
be,pt  %xcc, TARGET563
nop
RET563:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P564: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P565: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P566: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P567: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P568: !DWST [2] (maybe <- 0x800003) (Int) (Branch target of P938)
mov %l4, %l7 
stx %l7, [%i0 + 8]
add   %l4, 1, %l4
ba P569
nop

TARGET938:
ba RET938
nop


P569: !BST [7] (maybe <- 0x4000000e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P570: !BLD [0] (FP)
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

P571: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P572: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P573: !BST [1] (maybe <- 0x40000011) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P574: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P575: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P576: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P577: !BLD [3] (FP)
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

P578: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P579: !BLD [4] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET579
nop
RET579:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P580: !BST [4] (maybe <- 0x40000015) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P581: !BST [11] (maybe <- 0x40000016) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P582: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P583: !BST [1] (maybe <- 0x40000017) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P584: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P585: !BLD [8] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET585
nop
RET585:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P586: !LD [8] (Int) (Branch target of P563)
lduw [%i1 + 256], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
ba P587
nop

TARGET563:
ba RET563
nop


P587: !BLD [11] (FP) (Branch target of P680)
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
ba P588
nop

TARGET680:
ba RET680
nop


P588: !ST [7] (maybe <- 0x800004) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P589: !BLD [1] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f0
membar #Sync 
! 4 addresses covered
fmovs %f3, %f2
fmovs %f8, %f3

P590: !LD [2] (Int)
lduw [%i0 + 12], %l3
! move %l3(lower) -> %o4(lower)
or %l3, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P591: !MEMBAR (Int)
membar #StoreLoad

P592: !LD [12] (Int)
lduw [%i3 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P593: !BST [1] (maybe <- 0x4000001b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P594: !BLD [7] (FP)
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

P595: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P596: !BST [8] (maybe <- 0x4000001f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P597: !BST [2] (maybe <- 0x40000020) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P598: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P599: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P600: !BST [2] (maybe <- 0x40000024) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P601: !BST [6] (maybe <- 0x40000028) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P602: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P603: !BST [14] (maybe <- 0x4000002b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P604: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P605: !BST [14] (maybe <- 0x4000002c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P606: !BST [10] (maybe <- 0x4000002d) (FP) (CBR)
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
be,pt  %xcc, TARGET606
nop
RET606:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P607: !LD [2] (Int)
lduw [%i0 + 12], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

P608: !BLD [3] (FP)
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

P609: !BST [11] (maybe <- 0x4000002e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P610: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P611: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P612: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P613: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P614: !BST [0] (maybe <- 0x4000002f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P615: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P616: !BST [15] (maybe <- 0x40000033) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P617: !LD [10] (Int)
lduw [%i2 + 32], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P618: !ST [6] (maybe <- 0x800005) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P619: !BST [11] (maybe <- 0x40000034) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P620: !BST [12] (maybe <- 0x40000035) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P621: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P622: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P623: !BST [2] (maybe <- 0x40000036) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P624: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P625: !BST [9] (maybe <- 0x4000003a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P626: !REPLACEMENT [6] (Int)
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

P627: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P628: !PREFETCH [4] (Int) (CBR)
prefetch [%i0 + 64], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET628
nop
RET628:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P629: !BLD [1] (FP)
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

P630: !BST [8] (maybe <- 0x4000003b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P631: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P632: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P633: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f3
fmovd %f36, %f4

P634: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P635: !BST [11] (maybe <- 0x4000003c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P636: !REPLACEMENT [14] (Int)
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

P637: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P638: !BST [4] (maybe <- 0x4000003d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P639: !MEMBAR (Int)
membar #StoreLoad

P640: !BLD [7] (FP) (Branch target of P692)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f36, %f8
ba P641
nop

TARGET692:
ba RET692
nop


P641: !BST [7] (maybe <- 0x4000003e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P642: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P643: !BST [12] (maybe <- 0x40000041) (FP) (CBR)
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
be,pn  %xcc, TARGET643
nop
RET643:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P644: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P645: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P646: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P647: !LD [11] (FP)
ld [%i2 + 64], %f11
! 1 addresses covered

P648: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P649: !BST [4] (maybe <- 0x40000042) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P650: !BST [0] (maybe <- 0x40000043) (FP) (CBR) (Branch target of P538)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
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
be,pt  %xcc, TARGET650
nop
RET650:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0

ba P651
nop

TARGET538:
ba RET538
nop


P651: !DWLD [8] (Int)
ldx [%i1 + 256], %o5
! move %o5(upper) -> %o1(lower)
srlx %o5, 32, %l7
or %l7, %o1, %o1

P652: !BST [8] (maybe <- 0x40000047) (FP) (CBR)
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
be,pt  %xcc, TARGET652
nop
RET652:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P653: !BST [9] (maybe <- 0x40000048) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P654: !BST [4] (maybe <- 0x40000049) (FP) (Branch target of P650)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 
ba P655
nop

TARGET650:
ba RET650
nop


P655: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P656: !BST [12] (maybe <- 0x4000004a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P657: !BLD [5] (FP)
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

P658: !BST [10] (maybe <- 0x4000004b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P659: !BLD [1] (FP)
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

P660: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f3
fmovd %f36, %f4

P661: !BST [15] (maybe <- 0x4000004c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P662: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P663: !BST [13] (maybe <- 0x4000004d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P664: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P665: !BST [11] (maybe <- 0x4000004e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P666: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P667: !LD [13] (Int)
lduw [%i3 + 64], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P668: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P669: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P670: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P671: !REPLACEMENT [9] (Int)
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

P672: !DWST [12] (maybe <- 0x800006) (Int)
mov %l4, %l7 
sllx %l7, 32, %l7 
stx %l7, [%i3 + 0 ] 
add   %l4, 1, %l4

P673: !BST [6] (maybe <- 0x4000004f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P674: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P675: !BLD [15] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET675
nop
RET675:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P676: !REPLACEMENT [13] (Int)
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

P677: !LD [5] (Int)
lduw [%i1 + 76], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2

P678: !BLD [2] (FP)
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

P679: !PREFETCH [5] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i1 + 76] %asi, 1

P680: !BLD [1] (FP) (CBR)
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
be,pn  %xcc, TARGET680
nop
RET680:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P681: !BLD [0] (FP)
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

P682: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P683: !BST [0] (maybe <- 0x40000052) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P684: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P685: !BLD [3] (FP)
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

P686: !BST [13] (maybe <- 0x40000056) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P687: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f11
fmovd %f36, %f12

P688: !BST [11] (maybe <- 0x40000057) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P689: !DWLD [15] (Int)
ldx [%i3 + 192], %o3
! move %o3(upper) -> %o3(upper)

P690: !BLD [7] (FP)
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

P691: !BST [5] (maybe <- 0x40000058) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P692: !BLD [6] (FP) (CBR)
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
be,pt  %xcc, TARGET692
nop
RET692:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P693: !ST [7] (maybe <- 0x800007) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P694: !BST [2] (maybe <- 0x4000005b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P695: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P696: !DWST [6] (maybe <- 0x4000005f) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=21 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
std %f20, [%i1 + 80]

P697: !LD [4] (FP)
ld [%i0 + 64], %f4
! 1 addresses covered

P698: !BLD [1] (FP)
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

P699: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P700: !BLD [1] (FP)
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

P701: !BST [9] (maybe <- 0x40000061) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P702: !DWLD [2] (Int)
ldx [%i0 + 8], %o5
! move %o5(lower) -> %o3(lower)
srlx %o3, 32, %o3
sllx %o3, 32, %o3
srl %o5, 0, %l7
or %l7, %o3, %o3

P703: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P704: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P705: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P706: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P707: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P708: !DWST [10] (maybe <- 0x800008) (Int)
mov %l4, %l3 
sllx %l3, 32, %l3 
stx %l3, [%i2 + 32 ] 
add   %l4, 1, %l4

P709: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P710: !BST [11] (maybe <- 0x40000062) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P711: !PREFETCH [6] (Int) (CBR)
prefetch [%i1 + 80], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET711
nop
RET711:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P712: !BLD [9] (FP)
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

P713: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P714: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f0
membar #Sync 
! 3 addresses covered
fmovs %f3, %f0
fmovs %f4, %f1
fmovs %f5, %f2

P715: !BST [5] (maybe <- 0x40000063) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P716: !LD [14] (Int)
lduw [%i3 + 128], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P717: !BST [1] (maybe <- 0x40000066) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P718: !BLD [0] (FP)
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

P719: !DWLD [0] (FP)
ldd [%i0 + 0], %f18
! 2 addresses covered
fmovs %f18, %f7
fmovs %f19, %f8

P720: !BST [3] (maybe <- 0x4000006a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P721: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P722: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P723: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P724: !REPLACEMENT [6] (Int)
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

P725: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P726: !BST [13] (maybe <- 0x4000006e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P727: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P728: !CASX [13] (maybe <- 0x800009) (Int)
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

P729: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P730: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P731: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P732: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P733: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P734: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P735: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P736: !BST [2] (maybe <- 0x4000006f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P737: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P738: !SWAP [3] (maybe <- 0x80000a) (Int)
mov %l4, %l6
swap  [%i0 + 32], %l6
! move %l6(lower) -> %o1(lower)
srl %l6, 0, %o5
or %o5, %o1, %o1
add   %l4, 1, %l4

P739: !BST [4] (maybe <- 0x40000073) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P740: !BST [0] (maybe <- 0x40000074) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P741: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P742: !BST [1] (maybe <- 0x40000078) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P743: !BLD [3] (FP)
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

P744: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P745: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P746: !BST [14] (maybe <- 0x4000007c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P747: !BST [5] (maybe <- 0x4000007d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P748: !BLD [0] (FP)
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

P749: !BLD [2] (FP)
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

P750: !BLD [6] (FP) (CBR)
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
be,pt  %xcc, TARGET750
nop
RET750:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P751: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P752: !BLD [1] (FP)
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

P753: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P754: !BLD [12] (FP) (Branch target of P711)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1
ba P755
nop

TARGET711:
ba RET711
nop


P755: !ST [1] (maybe <- 0x80000b) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P756: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P757: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P758: !ST [6] (maybe <- 0x80000c) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P759: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P760: !BLD [1] (FP)
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

P761: !DWST [5] (maybe <- 0x80000d) (Int)
mov %l4, %l3 
stx %l3, [%i1 + 72]
add   %l4, 1, %l4

P762: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P763: !BST [9] (maybe <- 0x40000080) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P764: !BST [4] (maybe <- 0x40000081) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P765: !PREFETCH [10] (Int) (Branch target of P652)
prefetch [%i2 + 32], 1
ba P766
nop

TARGET652:
ba RET652
nop


P766: !REPLACEMENT [2] (Int) (CBR)
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
be,pt  %xcc, TARGET766
nop
RET766:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P767: !MEMBAR (Int)
membar #StoreLoad

P768: !BST [9] (maybe <- 0x40000082) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P769: !BST [1] (maybe <- 0x40000083) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P770: !DWST [10] (maybe <- 0x80000e) (Int)
mov %l4, %o5 
sllx %o5, 32, %o5 
stx %o5, [%i2 + 32 ] 
add   %l4, 1, %l4

P771: !PREFETCH [0] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i0 + 0] %asi, 1

P772: !CASX [9] (maybe <- 0x80000f) (Int)
add %i1, 512, %o5
ldx [%o5], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov  %o2, %l7
sllx %l4, 32, %o3
casx [%o5], %l7, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4

P773: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P774: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P775: !REPLACEMENT [3] (Int)
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

P776: !BST [4] (maybe <- 0x40000087) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P777: !BST [13] (maybe <- 0x40000088) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P778: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P779: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f9
fmovd %f36, %f10

P780: !BLD [0] (FP)
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

P781: !BLD [2] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f0
membar #Sync 
! 4 addresses covered
fmovs %f3, %f2
fmovs %f8, %f3

P782: !BST [14] (maybe <- 0x40000089) (FP) (CBR)
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
be,pt  %xcc, TARGET782
nop
RET782:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P783: !BST [3] (maybe <- 0x4000008a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P784: !BST [8] (maybe <- 0x4000008e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P785: !LD [11] (Int)
lduw [%i2 + 64], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P786: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P787: !PREFETCH [15] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i3 + 192] %asi, 1

P788: !PREFETCH [7] (Int) (Branch target of P606)
prefetch [%i1 + 84], 1
ba P789
nop

TARGET606:
ba RET606
nop


P789: !BST [15] (maybe <- 0x4000008f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P790: !BST [11] (maybe <- 0x40000090) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P791: !PREFETCH [6] (Int) (Branch target of P814)
prefetch [%i1 + 80], 1
ba P792
nop

TARGET814:
ba RET814
nop


P792: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P793: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P794: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P795: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P796: !BST [14] (maybe <- 0x40000091) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P797: !MEMBAR (Int)
membar #StoreLoad

P798: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P799: !BST [14] (maybe <- 0x40000092) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P800: !ST [3] (maybe <- 0x800010) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P801: !DWLD [3] (Int)
ldx [%i0 + 32], %o5
! move %o5(upper) -> %o4(lower)
srlx %o5, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P802: !PREFETCH [0] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i0 + 0] %asi, 1

P803: !BST [12] (maybe <- 0x40000093) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P804: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P805: !BST [2] (maybe <- 0x40000094) (FP) (Branch target of P675)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 
ba P806
nop

TARGET675:
ba RET675
nop


P806: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P807: !NOP (Int)
nop

P808: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P809: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P810: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P811: !PREFETCH [0] (Int) (Branch target of P820)
prefetch [%i0 + 0], 1
ba P812
nop

TARGET820:
ba RET820
nop


P812: !BLD [1] (FP)
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

P813: !BST [6] (maybe <- 0x40000098) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P814: !PREFETCH [14] (Int) (CBR) (Branch target of P766)
prefetch [%i3 + 128], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET814
nop
RET814:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0

ba P815
nop

TARGET766:
ba RET766
nop


P815: !BST [0] (maybe <- 0x4000009b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P816: !BLD [0] (FP)
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

P817: !BST [1] (maybe <- 0x4000009f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P818: !BST [10] (maybe <- 0x400000a3) (FP) (Branch target of P904)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 
ba P819
nop

TARGET904:
ba RET904
nop


P819: !BLD [6] (FP)
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

P820: !BLD [8] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET820
nop
RET820:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P821: !ST [7] (maybe <- 0x800011) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P822: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f3
fmovd %f36, %f4

P823: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P824: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P825: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P826: !BST [13] (maybe <- 0x400000a4) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P827: !BST [9] (maybe <- 0x400000a5) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P828: !BST [3] (maybe <- 0x400000a6) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P829: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P830: !BST [9] (maybe <- 0x400000aa) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P831: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P832: !BST [3] (maybe <- 0x400000ab) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P833: !PREFETCH [5] (Int) (Branch target of P976)
prefetch [%i1 + 76], 1
ba P834
nop

TARGET976:
ba RET976
nop


P834: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P835: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P836: !MEMBAR (Int)
membar #StoreLoad

P837: !ST [6] (maybe <- 0x800012) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P838: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P839: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P840: !BLD [1] (FP)
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

P841: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P842: !PREFETCH [7] (Int) (Branch target of P782)
prefetch [%i1 + 84], 1
ba P843
nop

TARGET782:
ba RET782
nop


P843: !ST [1] (maybe <- 0x800013) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P844: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P845: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P846: !BST [5] (maybe <- 0x400000af) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P847: !MEMBAR (Int)
membar #StoreLoad

P848: !BST [10] (maybe <- 0x400000b2) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P849: !BLD [2] (FP)
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

P850: !BST [2] (maybe <- 0x400000b3) (FP) (Branch target of P628)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 
ba P851
nop

TARGET628:
ba RET628
nop


P851: !LD [6] (Int)
lduw [%i1 + 80], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P852: !CAS [14] (maybe <- 0x800014) (Int)
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

P853: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P854: !REPLACEMENT [9] (Int)
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

P855: !BST [8] (maybe <- 0x400000b7) (FP) (Branch target of P750)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 
ba P856
nop

TARGET750:
ba RET750
nop


P856: !BST [6] (maybe <- 0x400000b8) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P857: !REPLACEMENT [12] (Int)
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

P858: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P859: !CASX [15] (maybe <- 0x800015) (Int)
add %i3, 192, %l3
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

P860: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P861: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f5
fmovd %f36, %f6

P862: !BLD [1] (FP)
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

P863: !DWLD [10] (Int)
ldx [%i2 + 32], %l3
! move %l3(upper) -> %o3(lower)
srlx %l3, 32, %o5
or %o5, %o3, %o3

P864: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P865: !BLD [1] (FP)
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

P866: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f0
membar #Sync 
! 1 addresses covered

P867: !BST [13] (maybe <- 0x400000bb) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P868: !BLD [8] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET868
nop
RET868:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P869: !BST [14] (maybe <- 0x400000bc) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P870: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P871: !BLD [0] (FP)
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

P872: !BLD [0] (FP)
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

P873: !BST [0] (maybe <- 0x400000bd) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P874: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P875: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f12

P876: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P877: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P878: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P879: !BLD [14] (FP)
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

P880: !BST [14] (maybe <- 0x400000c1) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P881: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f0
membar #Sync 
! 1 addresses covered

P882: !BST [6] (maybe <- 0x400000c2) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P883: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P884: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P885: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f3

P886: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P887: !LD [10] (Int)
lduw [%i2 + 32], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P888: !BST [11] (maybe <- 0x400000c5) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P889: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P890: !BST [4] (maybe <- 0x400000c6) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P891: !DWST [11] (maybe <- 0x800016) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i2 + 64 ] 
add   %l4, 1, %l4

P892: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P893: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P894: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P895: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P896: !BLD [6] (FP)
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

P897: !BST [9] (maybe <- 0x400000c7) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P898: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P899: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P900: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P901: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P902: !BST [15] (maybe <- 0x400000c8) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P903: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P904: !PREFETCH [9] (Int) (CBR)
prefetch [%i1 + 512], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET904
nop
RET904:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P905: !LD [9] (Int)
lduw [%i1 + 512], %l3
! move %l3(lower) -> %o4(lower)
or %l3, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P906: !BST [13] (maybe <- 0x400000c9) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P907: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P908: !REPLACEMENT [0] (Int)
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

P909: !BST [14] (maybe <- 0x400000ca) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P910: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P911: !BST [7] (maybe <- 0x400000cb) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P912: !BLD [3] (FP)
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

P913: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P914: !MEMBAR (Int)
membar #StoreLoad

P915: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P916: !BLD [0] (FP)
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

P917: !DWST [10] (maybe <- 0x800017) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i2 + 32 ] 
add   %l4, 1, %l4

P918: !BST [12] (maybe <- 0x400000ce) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P919: !BLD [1] (FP)
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

P920: !BLD [1] (FP)
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

P921: !BST [9] (maybe <- 0x400000cf) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P922: !BST [12] (maybe <- 0x400000d0) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P923: !BLD [0] (FP)
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

P924: !BST [5] (maybe <- 0x400000d1) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P925: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P926: !BLD [2] (FP)
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

P927: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P928: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P929: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P930: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P931: !BST [15] (maybe <- 0x400000d4) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P932: !BST [1] (maybe <- 0x400000d5) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P933: !BLD [0] (FP)
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

P934: !BLD [0] (FP)
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

P935: !BST [15] (maybe <- 0x400000d9) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P936: !BLD [3] (FP)
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

P937: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P938: !BLD [5] (FP) (CBR)
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
be,pt  %xcc, TARGET938
nop
RET938:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P939: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P940: !BST [6] (maybe <- 0x400000da) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P941: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P942: !LD [10] (Int)
lduw [%i2 + 32], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P943: !BST [8] (maybe <- 0x400000dd) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P944: !MEMBAR (Int) (Branch target of P1019)
membar #StoreLoad
ba P945
nop

TARGET1019:
ba RET1019
nop


P945: !BLD [0] (FP)
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

P946: !BST [9] (maybe <- 0x400000de) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P947: !BST [1] (maybe <- 0x400000df) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P948: !ST [7] (maybe <- 0x800018) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P949: !ST [4] (maybe <- 0x800019) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P950: !BST [15] (maybe <- 0x400000e3) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P951: !BST [12] (maybe <- 0x400000e4) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P952: !DWST [14] (maybe <- 0x400000e5) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
std %f20, [%i3 + 128]

P953: !BST [8] (maybe <- 0x400000e6) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P954: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P955: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P956: !DWLD [14] (Int)
ldx [%i3 + 128], %o5
! move %o5(upper) -> %o0(lower)
srlx %o5, 32, %l7
or %l7, %o0, %o0

P957: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P958: !MEMBAR (Int)
membar #StoreLoad

P959: !BST [14] (maybe <- 0x400000e7) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P960: !BLD [1] (FP)
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

P961: !BST [1] (maybe <- 0x400000e8) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P962: !DWLD [7] (Int)
ldx [%i1 + 80], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)

P963: !MEMBAR (Int)
membar #StoreLoad

P964: !BLD [1] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f0
membar #Sync 
! 4 addresses covered
fmovs %f3, %f2
fmovs %f8, %f3

P965: !BLD [7] (FP)
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

P966: !LD [5] (Int)
lduw [%i1 + 76], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P967: !BST [3] (maybe <- 0x400000ec) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P968: !REPLACEMENT [14] (Int)
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

P969: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P970: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P971: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P972: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P973: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P974: !BST [14] (maybe <- 0x400000f0) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P975: !DWST [5] (maybe <- 0x400000f1) (FP)
! 0 th moved, current_fp_src=21 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
std %f20, [%i1 + 72]

P976: !BST [12] (maybe <- 0x400000f2) (FP) (CBR)
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
be,pt  %xcc, TARGET976
nop
RET976:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P977: !BST [0] (maybe <- 0x400000f3) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P978: !REPLACEMENT [2] (Int) (Branch target of P868)
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
ba P979
nop

TARGET868:
ba RET868
nop


P979: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P980: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P981: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f36, %f8

P982: !CASX [7] (maybe <- 0x80001a) (Int)
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

P983: !BLD [1] (FP)
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

P984: !DWLD [1] (Int)
ldx [%i0 + 0], %l6
! move %l6(upper) -> %o4(lower)
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

P985: !BLD [3] (FP)
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

P986: !BST [12] (maybe <- 0x400000f7) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P987: !BST [6] (maybe <- 0x400000f8) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P988: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P989: !BST [9] (maybe <- 0x400000fb) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P990: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P991: !LD [4] (Int)
lduw [%i0 + 64], %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0

P992: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P993: !BLD [3] (FP)
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

P994: !PREFETCH [15] (Int) (Branch target of P579)
prefetch [%i3 + 192], 1
ba P995
nop

TARGET579:
ba RET579
nop


P995: !BST [14] (maybe <- 0x400000fc) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P996: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P997: !BLD [2] (FP) (Branch target of P585)
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
ba P998
nop

TARGET585:
ba RET585
nop


P998: !REPLACEMENT [11] (Int)
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

P999: !BST [7] (maybe <- 0x400000fd) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1000: !BST [0] (maybe <- 0x40000100) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1001: !LD [1] (Int)
lduw [%i0 + 4], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P1002: !BST [7] (maybe <- 0x40000104) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1003: !BST [4] (maybe <- 0x40000107) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P1004: !BST [2] (maybe <- 0x40000108) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1005: !BST [7] (maybe <- 0x4000010c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1006: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P1007: !BLD [3] (FP)
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

P1008: !REPLACEMENT [0] (Int)
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

P1009: !BLD [5] (FP)
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

P1010: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f1

P1011: !PREFETCH [3] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i0 + 32] %asi, 1

P1012: !BLD [3] (FP) (Branch target of P643)
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
ba P1013
nop

TARGET643:
ba RET643
nop


P1013: !CASX [7] (maybe <- 0x80001c) (Int) (LE)
sllx %l4, 32, %o5
add  %l4, 1, %l4
or   %l4, %o5, %o5
! Change double-word-level endianess (big endian <-> little endian) 
sethi %hi(0xff00ff00), %l7
or %l7, %lo(0xff00ff00), %l7
sllx %l7, 32, %l3
or %l7, %l3, %l7 
and %o5, %l7, %l3
srlx %l3, 8, %l3
sllx %o5, 8, %o5
and %o5, %l7, %o5
or %o5, %l3, %o5 
sethi %hi(0xffff0000), %l7
or %l7, %lo(0xffff0000), %l7
srlx %o5, 16, %l3
andn %l3, %l7, %l3
andn %o5, %l7, %o5
sllx %o5, 16, %o5
or %o5, %l3, %o5 
srlx %o5, 32, %l3
sllx %o5, 32, %o5
or %o5, %l3, %l3 
wr %g0, 0x88, %asi
add %i1, 80, %o5
ldxa [%o5] %asi, %l6
! move %l6(lower) -> %o1(lower)
srl %l6, 0, %l7
or %l7, %o1, %o1
! move %l6(upper) -> %o2(upper)
or %l6, %g0, %o2
mov %l6, %l7
mov  %l3, %l6
casxa [%o5] %asi, %l7, %l6
! move %l6(lower) -> %o2(lower)
srlx %o2, 32, %o2
sllx %o2, 32, %o2
srl %l6, 0, %o5
or %o5, %o2, %o2
! move %l6(upper) -> %o3(upper)
or %l6, %g0, %o3
add  %l4, 1, %l4

P1014: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P1015: !BST [7] (maybe <- 0x4000010f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1016: !DWST [6] (maybe <- 0x80001e) (Int)
sllx %l4, 32, %l6 
add   %l4, 1, %l4
or %l6, %l4, %l6
stx %l6, [%i1 + 80]
add   %l4, 1, %l4

P1017: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P1018: !MEMBAR (Int)
membar #StoreLoad

P1019: !LD [0] (Int) (CBR)
lduw [%i0 + 0], %l6
! move %l6(lower) -> %o3(lower)
srlx %o3, 32, %o3
sllx %o3, 32, %o3
or %l6, %o3, %o3

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1019
nop
RET1019:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P1020: !LD [1] (Int)
lduw [%i0 + 4], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P1021: !LD [2] (Int)
lduw [%i0 + 12], %l7
! move %l7(lower) -> %o4(lower)
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P1022: !LD [3] (Int)
lduw [%i0 + 32], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1023: !LD [4] (Int)
lduw [%i0 + 64], %l7
! move %l7(lower) -> %o0(lower)
or %l7, %o0, %o0

P1024: !LD [5] (Int)
lduw [%i1 + 76], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P1025: !LD [6] (Int)
lduw [%i1 + 80], %l7
! move %l7(lower) -> %o1(lower)
or %l7, %o1, %o1

P1026: !LD [7] (Int)
lduw [%i1 + 84], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P1027: !LD [8] (Int)
lduw [%i1 + 256], %l7
! move %l7(lower) -> %o2(lower)
or %l7, %o2, %o2

P1028: !LD [9] (FP)
ld [%i1 + 512], %f6
! 1 addresses covered

P1029: !LD [10] (FP)
ld [%i2 + 32], %f7
! 1 addresses covered

P1030: !LD [11] (Int)
lduw [%i2 + 64], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P1031: !LD [12] (Int)
lduw [%i3 + 0], %l7
! move %l7(lower) -> %o3(lower)
or %l7, %o3, %o3

P1032: !LD [13] (Int)
lduw [%i3 + 64], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P1033: !LD [14] (Int)
lduw [%i3 + 128], %l7
! move %l7(lower) -> %o4(lower)
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

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

! Initialize LFSR to 0x63e0^4
sethi %hi(0x63e0), %l0
or    %l0, %lo(0x63e0), %l0
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

P1035: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f0
membar #Sync 
! 1 addresses covered

P1036: !BLD [3] (FP)
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

P1037: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P1038: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P1039: !DWST [11] (maybe <- 0x1000001) (Int)
mov %l4, %l3 
sllx %l3, 32, %l3 
stx %l3, [%i2 + 64 ] 
add   %l4, 1, %l4

P1040: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P1041: !BST [6] (maybe <- 0x40800001) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1042: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P1043: !BST [4] (maybe <- 0x40800004) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P1044: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P1045: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P1046: !BLD [0] (FP)
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

P1047: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P1048: !ST [0] (maybe <- 0x1000002) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P1049: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P1050: !DWLD [5] (Int)
ldx [%i1 + 72], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1051: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P1052: !DWST [8] (maybe <- 0x40800005) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
std %f20, [%i1 + 256]

P1053: !BST [1] (maybe <- 0x40800006) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
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
be,pt  %xcc, TARGET1053
nop
RET1053:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P1054: !BLD [1] (FP)
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

P1055: !BST [5] (maybe <- 0x4080000a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1056: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P1057: !DWST [7] (maybe <- 0x1000003) (Int) (LE)
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
stxa %l3, [%i1 + 80 ] %asi
add   %l4, 1, %l4

P1058: !PREFETCH [4] (Int) (Branch target of P1284)
prefetch [%i0 + 64], 1
ba P1059
nop

TARGET1284:
ba RET1284
nop


P1059: !BST [6] (maybe <- 0x4080000d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1060: !BST [7] (maybe <- 0x40800010) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1061: !BST [14] (maybe <- 0x40800013) (FP) (Branch target of P1085)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 
ba P1062
nop

TARGET1085:
ba RET1085
nop


P1062: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P1063: !BST [11] (maybe <- 0x40800014) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P1064: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P1065: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P1066: !BLD [5] (FP)
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

P1067: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P1068: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P1069: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P1070: !BLD [5] (FP) (CBR)
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
be,pt  %xcc, TARGET1070
nop
RET1070:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P1071: !BST [7] (maybe <- 0x40800015) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1072: !PREFETCH [1] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i0 + 4] %asi, 1

P1073: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P1074: !BLD [15] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1074
nop
RET1074:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P1075: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P1076: !BST [10] (maybe <- 0x40800018) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P1077: !BST [14] (maybe <- 0x40800019) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P1078: !PREFETCH [15] (Int) (CBR)
prefetch [%i3 + 192], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1078
nop
RET1078:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P1079: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P1080: !ST [2] (maybe <- 0x1000005) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P1081: !BLD [0] (FP)
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

P1082: !PREFETCH [14] (Int) (Branch target of P1418)
prefetch [%i3 + 128], 1
ba P1083
nop

TARGET1418:
ba RET1418
nop


P1083: !BLD [10] (FP)
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

P1084: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f0
membar #Sync 
! 1 addresses covered

P1085: !BST [4] (maybe <- 0x4080001a) (FP) (CBR)
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
be,pt  %xcc, TARGET1085
nop
RET1085:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P1086: !BST [4] (maybe <- 0x4080001b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P1087: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P1088: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P1089: !BST [10] (maybe <- 0x4080001c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P1090: !BLD [7] (FP)
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

P1091: !CAS [6] (maybe <- 0x1000006) (Int)
add %i1, 80, %l6
lduw [%l6], %o5
mov %o5, %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0
mov %l4, %o1
cas [%l6], %l3, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P1092: !BST [14] (maybe <- 0x4080001d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P1093: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P1094: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P1095: !BST [15] (maybe <- 0x4080001e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P1096: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P1097: !BST [12] (maybe <- 0x4080001f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P1098: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P1099: !BST [3] (maybe <- 0x40800020) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1100: !BST [8] (maybe <- 0x40800024) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P1101: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P1102: !BLD [12] (FP) (Branch target of P1518)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7
ba P1103
nop

TARGET1518:
ba RET1518
nop


P1103: !DWST [15] (maybe <- 0x1000007) (Int)
mov %l4, %o5 
sllx %o5, 32, %o5 
stx %o5, [%i3 + 192 ] 
add   %l4, 1, %l4

P1104: !BST [11] (maybe <- 0x40800025) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P1105: !REPLACEMENT [0] (Int)
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

P1106: !BLD [7] (FP)
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

P1107: !BST [13] (maybe <- 0x40800026) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P1108: !BST [14] (maybe <- 0x40800027) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P1109: !BST [7] (maybe <- 0x40800028) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1110: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f11
fmovd %f36, %f12

P1111: !BST [7] (maybe <- 0x4080002b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1112: !REPLACEMENT [2] (Int)
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

P1113: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P1114: !ST [1] (maybe <- 0x1000008) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P1115: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P1116: !CASX [15] (maybe <- 0x1000009) (Int)
add %i3, 192, %o5
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

P1117: !BST [6] (maybe <- 0x4080002e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1118: !REPLACEMENT [9] (Int)
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

P1119: !BST [3] (maybe <- 0x40800031) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1120: !BLD [13] (FP) (Branch target of P1078)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14
ba P1121
nop

TARGET1078:
ba RET1078
nop


P1121: !BST [14] (maybe <- 0x40800035) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P1122: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P1123: !LD [5] (Int)
lduw [%i1 + 76], %o5
! move %o5(lower) -> %o3(lower)
or %o5, %o3, %o3

P1124: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P1125: !BLD [3] (FP)
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

P1126: !BST [1] (maybe <- 0x40800036) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1127: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f3
fmovd %f36, %f4

P1128: !BLD [1] (FP)
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

P1129: !BST [2] (maybe <- 0x4080003a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1130: !BST [3] (maybe <- 0x4080003e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1131: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P1132: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P1133: !BST [14] (maybe <- 0x40800042) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P1134: !LD [3] (Int) (Branch target of P1357)
lduw [%i0 + 32], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
ba P1135
nop

TARGET1357:
ba RET1357
nop


P1135: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P1136: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P1137: !DWLD [0] (Int)
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

P1138: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P1139: !REPLACEMENT [14] (Int)
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

P1140: !BLD [5] (FP)
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

P1141: !BST [2] (maybe <- 0x40800043) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1142: !ST [2] (maybe <- 0x40800047) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i0 + 12 ]

P1143: !BST [11] (maybe <- 0x40800048) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P1144: !BLD [3] (FP)
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

P1145: !BST [1] (maybe <- 0x40800049) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1146: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f3

P1147: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P1148: !BST [2] (maybe <- 0x4080004d) (FP) (Branch target of P1429)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 
ba P1149
nop

TARGET1429:
ba RET1429
nop


P1149: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P1150: !LD [12] (Int)
lduw [%i3 + 0], %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0

P1151: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P1152: !BST [7] (maybe <- 0x40800051) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1153: !BST [3] (maybe <- 0x40800054) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1154: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P1155: !BST [2] (maybe <- 0x40800058) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1156: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P1157: !BST [11] (maybe <- 0x4080005c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P1158: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P1159: !BLD [6] (FP)
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

P1160: !BST [5] (maybe <- 0x4080005d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1161: !LD [9] (Int)
lduw [%i1 + 512], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P1162: !BST [14] (maybe <- 0x40800060) (FP) (Branch target of P1410)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 
ba P1163
nop

TARGET1410:
ba RET1410
nop


P1163: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P1164: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P1165: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P1166: !REPLACEMENT [12] (Int)
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

P1167: !BST [13] (maybe <- 0x40800061) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P1168: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P1169: !BST [9] (maybe <- 0x40800062) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P1170: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P1171: !BST [0] (maybe <- 0x40800063) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1172: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P1173: !BST [6] (maybe <- 0x40800067) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
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
be,pt  %xcc, TARGET1173
nop
RET1173:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P1174: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P1175: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P1176: !BST [3] (maybe <- 0x4080006a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1177: !BST [6] (maybe <- 0x4080006e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1178: !CASX [4] (maybe <- 0x100000a) (Int)
add %i0, 64, %o5
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

P1179: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P1180: !BST [7] (maybe <- 0x40800071) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1181: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P1182: !BST [3] (maybe <- 0x40800074) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1183: !ST [14] (maybe <- 0x100000b) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P1184: !BST [9] (maybe <- 0x40800078) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P1185: !DWST [8] (maybe <- 0x100000c) (Int)
mov %l4, %l7 
sllx %l7, 32, %l7 
stx %l7, [%i1 + 256 ] 
add   %l4, 1, %l4

P1186: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P1187: !BST [1] (maybe <- 0x40800079) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1188: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P1189: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P1190: !BST [0] (maybe <- 0x4080007d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1191: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P1192: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P1193: !BST [9] (maybe <- 0x40800081) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P1194: !BST [14] (maybe <- 0x40800082) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P1195: !BLD [2] (FP)
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

P1196: !BST [3] (maybe <- 0x40800083) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1197: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f0
membar #Sync 
! 1 addresses covered

P1198: !BLD [12] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1198
nop
RET1198:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P1199: !BLD [1] (FP)
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

P1200: !DWLD [10] (Int)
ldx [%i2 + 32], %l7
! move %l7(upper) -> %o3(lower)
srlx %l7, 32, %l6
or %l6, %o3, %o3

P1201: !BST [15] (maybe <- 0x40800087) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P1202: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P1203: !BLD [0] (FP)
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

P1204: !BST [7] (maybe <- 0x40800088) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
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
be,pt  %xcc, TARGET1204
nop
RET1204:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P1205: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P1206: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f11
fmovd %f36, %f12

P1207: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P1208: !BST [13] (maybe <- 0x4080008b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P1209: !BST [5] (maybe <- 0x4080008c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1210: !BST [7] (maybe <- 0x4080008f) (FP) (Branch target of P1053)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 
ba P1211
nop

TARGET1053:
ba RET1053
nop


P1211: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P1212: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P1213: !BLD [12] (FP)
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

P1214: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P1215: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f0
membar #Sync 
! 1 addresses covered

P1216: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P1217: !LD [15] (Int)
lduw [%i3 + 192], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P1218: !BST [1] (maybe <- 0x40800092) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1219: !BST [14] (maybe <- 0x40800096) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P1220: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P1221: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P1222: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P1223: !BLD [3] (FP)
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

P1224: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P1225: !BST [9] (maybe <- 0x40800097) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P1226: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f36, %f8

P1227: !BST [5] (maybe <- 0x40800098) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1228: !BST [6] (maybe <- 0x4080009b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1229: !BLD [2] (FP)
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

P1230: !BST [3] (maybe <- 0x4080009e) (FP) (Branch target of P1462)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 
ba P1231
nop

TARGET1462:
ba RET1462
nop


P1231: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P1232: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P1233: !BST [12] (maybe <- 0x408000a2) (FP) (Branch target of P1070)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 
ba P1234
nop

TARGET1070:
ba RET1070
nop


P1234: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P1235: !BST [0] (maybe <- 0x408000a3) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1236: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P1237: !BLD [4] (FP)
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

P1238: !BST [14] (maybe <- 0x408000a7) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P1239: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f0
membar #Sync 
! 1 addresses covered

P1240: !BST [2] (maybe <- 0x408000a8) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1241: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P1242: !CAS [10] (maybe <- 0x100000d) (Int) (Branch target of P1204)
add %i2, 32, %l3
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
ba P1243
nop

TARGET1204:
ba RET1204
nop


P1243: !BST [11] (maybe <- 0x408000ac) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P1244: !BLD [3] (FP)
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

P1245: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P1246: !BLD [5] (FP)
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

P1247: !LD [5] (Int)
lduw [%i1 + 76], %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0

P1248: !ST [11] (maybe <- 0x100000e) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P1249: !BST [3] (maybe <- 0x408000ad) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1250: !BLD [1] (FP)
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

P1251: !BLD [3] (FP)
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

P1252: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P1253: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P1254: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P1255: !ST [7] (maybe <- 0x100000f) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P1256: !BST [4] (maybe <- 0x408000b1) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P1257: !DWST [12] (maybe <- 0x1000010) (Int)
mov %l4, %l3 
sllx %l3, 32, %l3 
stx %l3, [%i3 + 0 ] 
add   %l4, 1, %l4

P1258: !BST [11] (maybe <- 0x408000b2) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P1259: !BST [9] (maybe <- 0x408000b3) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P1260: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P1261: !BLD [0] (FP) (CBR)
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

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1261
nop
RET1261:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P1262: !BST [8] (maybe <- 0x408000b4) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P1263: !BST [4] (maybe <- 0x408000b5) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P1264: !BST [2] (maybe <- 0x408000b6) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
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
be,pn  %xcc, TARGET1264
nop
RET1264:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P1265: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P1266: !BST [5] (maybe <- 0x408000ba) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1267: !BLD [6] (FP)
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

P1268: !BLD [0] (FP)
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

P1269: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P1270: !BST [4] (maybe <- 0x408000bd) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P1271: !BLD [7] (FP)
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

P1272: !BST [4] (maybe <- 0x408000be) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P1273: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P1274: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f0
membar #Sync 
! 1 addresses covered

P1275: !BST [13] (maybe <- 0x408000bf) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P1276: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P1277: !BST [2] (maybe <- 0x408000c0) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1278: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P1279: !BLD [4] (FP) (Branch target of P1261)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2
ba P1280
nop

TARGET1261:
ba RET1261
nop


P1280: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P1281: !DWST [4] (maybe <- 0x1000011) (Int)
mov %l4, %o5 
sllx %o5, 32, %o5 
stx %o5, [%i0 + 64 ] 
add   %l4, 1, %l4

P1282: !BST [7] (maybe <- 0x408000c4) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1283: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P1284: !LD [11] (Int) (CBR)
lduw [%i2 + 64], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1284
nop
RET1284:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P1285: !BLD [6] (FP)
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

P1286: !BLD [3] (FP)
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

P1287: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P1288: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P1289: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P1290: !BST [12] (maybe <- 0x408000c7) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P1291: !MEMBAR (Int)
membar #StoreLoad

P1292: !BLD [0] (FP)
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

P1293: !DWST [8] (maybe <- 0x1000012) (Int)
mov %l4, %o5 
sllx %o5, 32, %o5 
stx %o5, [%i1 + 256 ] 
add   %l4, 1, %l4

P1294: !BST [12] (maybe <- 0x408000c8) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P1295: !BST [13] (maybe <- 0x408000c9) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P1296: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P1297: !CASX [13] (maybe <- 0x1000013) (Int)
add %i3, 64, %l6
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

P1298: !BLD [11] (FP)
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

P1299: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f0
membar #Sync 
! 1 addresses covered

P1300: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f36, %f2

P1301: !DWST [8] (maybe <- 0x1000014) (Int) (LE)
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
stxa %l6, [%i1 + 256 ] %asi
add   %l4, 1, %l4

P1302: !BST [15] (maybe <- 0x408000ca) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P1303: !BLD [3] (FP)
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

P1304: !BST [5] (maybe <- 0x408000cb) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1305: !DWST [11] (maybe <- 0x1000015) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i2 + 64 ] 
add   %l4, 1, %l4

P1306: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P1307: !BST [3] (maybe <- 0x408000ce) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1308: !PREFETCH [2] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i0 + 12] %asi, 1

P1309: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f9

P1310: !BLD [2] (FP)
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

P1311: !MEMBAR (Int)
membar #StoreLoad

P1312: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P1313: !BST [2] (maybe <- 0x408000d2) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1314: !BLD [15] (FP)
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

P1315: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P1316: !REPLACEMENT [6] (Int)
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

P1317: !BST [3] (maybe <- 0x408000d6) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1318: !BST [8] (maybe <- 0x408000da) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P1319: !ST [8] (maybe <- 0x1000016) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P1320: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P1321: !BST [8] (maybe <- 0x408000db) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P1322: !BST [11] (maybe <- 0x408000dc) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P1323: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f0
membar #Sync 
! 1 addresses covered

P1324: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P1325: !BLD [2] (FP)
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

P1326: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P1327: !ST [2] (maybe <- 0x1000017) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P1328: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P1329: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P1330: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P1331: !LD [13] (Int)
lduw [%i3 + 64], %l3
! move %l3(lower) -> %o3(lower)
or %l3, %o3, %o3

P1332: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P1333: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f8

P1334: !BST [9] (maybe <- 0x408000dd) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P1335: !ST [7] (maybe <- 0x1000018) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P1336: !PREFETCH [5] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i1 + 76] %asi, 1

P1337: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P1338: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P1339: !BST [3] (maybe <- 0x408000de) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1340: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P1341: !DWST [3] (maybe <- 0x1000019) (Int)
mov %l4, %l7 
sllx %l7, 32, %l7 
stx %l7, [%i0 + 32 ] 
add   %l4, 1, %l4

P1342: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P1343: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P1344: !DWST [5] (maybe <- 0x100001a) (Int)
mov %l4, %l6 
stx %l6, [%i1 + 72]
add   %l4, 1, %l4

P1345: !BST [14] (maybe <- 0x408000e2) (FP) (CBR)
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
be,pt  %xcc, TARGET1345
nop
RET1345:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P1346: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P1347: !BLD [1] (FP)
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

P1348: !ST [2] (maybe <- 0x408000e3) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i0 + 12 ]

P1349: !DWST [7] (maybe <- 0x100001b) (Int)
sllx %l4, 32, %o5 
add   %l4, 1, %l4
or %o5, %l4, %o5
stx %o5, [%i1 + 80]
add   %l4, 1, %l4

P1350: !BST [15] (maybe <- 0x408000e4) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P1351: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P1352: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P1353: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P1354: !BST [8] (maybe <- 0x408000e5) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P1355: !BST [12] (maybe <- 0x408000e6) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P1356: !BLD [7] (FP) (Branch target of P1074)
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
ba P1357
nop

TARGET1074:
ba RET1074
nop


P1357: !BST [9] (maybe <- 0x408000e7) (FP) (CBR)
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
be,pn  %xcc, TARGET1357
nop
RET1357:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P1358: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P1359: !DWLD [2] (Int)
ldx [%i0 + 8], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P1360: !LD [8] (Int) (CBR)
lduw [%i1 + 256], %l7
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
be,pn  %xcc, TARGET1360
nop
RET1360:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P1361: !BST [6] (maybe <- 0x408000e8) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1362: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P1363: !BST [0] (maybe <- 0x408000eb) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1364: !ST [11] (maybe <- 0x100001d) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P1365: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P1366: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P1367: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P1368: !BST [10] (maybe <- 0x408000ef) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P1369: !LD [1] (Int)
lduw [%i0 + 4], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1370: !BST [12] (maybe <- 0x408000f0) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P1371: !BST [5] (maybe <- 0x408000f1) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1372: !BST [1] (maybe <- 0x408000f4) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1373: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P1374: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P1375: !ST [4] (maybe <- 0x100001e) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P1376: !BST [12] (maybe <- 0x408000f8) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P1377: !DWST [11] (maybe <- 0x408000f9) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
std %f20, [%i2 + 64]

P1378: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P1379: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P1380: !BST [8] (maybe <- 0x408000fa) (FP) (Branch target of P1345)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 
ba P1381
nop

TARGET1345:
ba RET1345
nop


P1381: !BST [6] (maybe <- 0x408000fb) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1382: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P1383: !BST [2] (maybe <- 0x408000fe) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1384: !BST [13] (maybe <- 0x40800102) (FP) (Branch target of P1517)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 
ba P1385
nop

TARGET1517:
ba RET1517
nop


P1385: !BST [6] (maybe <- 0x40800103) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1386: !DWLD [12] (Int)
ldx [%i3 + 0], %l3
! move %l3(upper) -> %o0(lower)
srlx %l3, 32, %o5
or %o5, %o0, %o0

P1387: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P1388: !BLD [2] (FP)
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

P1389: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P1390: !CAS [5] (maybe <- 0x100001f) (Int)
add %i1, 76, %l7
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

P1391: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P1392: !LD [3] (Int)
lduw [%i0 + 32], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P1393: !BST [1] (maybe <- 0x40800106) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1394: !BST [9] (maybe <- 0x4080010a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P1395: !MEMBAR (Int)
membar #StoreLoad

P1396: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P1397: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P1398: !BST [1] (maybe <- 0x4080010b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1399: !PREFETCH [9] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i1 + 512] %asi, 1

P1400: !BLD [5] (FP) (CBR)
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

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1400
nop
RET1400:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P1401: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f36, %f2

P1402: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P1403: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P1404: !BST [4] (maybe <- 0x4080010f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P1405: !DWLD [12] (Int)
ldx [%i3 + 0], %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l3
or %l3, %o2, %o2

P1406: !MEMBAR (Int)
membar #StoreLoad

P1407: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f5

P1408: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f6

P1409: !BLD [2] (FP)
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

P1410: !PREFETCH [11] (Int) (CBR)
prefetch [%i2 + 64], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1410
nop
RET1410:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P1411: !BST [1] (maybe <- 0x40800110) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1412: !PREFETCH [4] (Int) (Branch target of P1264)
prefetch [%i0 + 64], 1
ba P1413
nop

TARGET1264:
ba RET1264
nop


P1413: !BST [8] (maybe <- 0x40800114) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P1414: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f11
fmovd %f36, %f12

P1415: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P1416: !BST [12] (maybe <- 0x40800115) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P1417: !PREFETCH [3] (Int) (Branch target of P1400)
prefetch [%i0 + 32], 1
ba P1418
nop

TARGET1400:
ba RET1400
nop


P1418: !ST [13] (maybe <- 0x1000020) (Int) (CBR)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1418
nop
RET1418:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P1419: !BST [9] (maybe <- 0x40800116) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P1420: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f14

P1421: !BLD [8] (FP)
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

P1422: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P1423: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P1424: !BST [8] (maybe <- 0x40800117) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P1425: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P1426: !BST [8] (maybe <- 0x40800118) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P1427: !BST [13] (maybe <- 0x40800119) (FP) (CBR)
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
be,pn  %xcc, TARGET1427
nop
RET1427:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P1428: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P1429: !PREFETCH [1] (Int) (CBR)
prefetch [%i0 + 4], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1429
nop
RET1429:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P1430: !ST [3] (maybe <- 0x1000021) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P1431: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P1432: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P1433: !PREFETCH [4] (Int) (Branch target of P1427)
prefetch [%i0 + 64], 1
ba P1434
nop

TARGET1427:
ba RET1427
nop


P1434: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P1435: !BST [8] (maybe <- 0x4080011a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P1436: !BST [7] (maybe <- 0x4080011b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1437: !BST [15] (maybe <- 0x4080011e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P1438: !BLD [2] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f0
membar #Sync 
! 4 addresses covered
fmovs %f3, %f2
fmovs %f8, %f3

P1439: !BST [13] (maybe <- 0x4080011f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P1440: !BST [2] (maybe <- 0x40800120) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1441: !BLD [1] (FP)
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

P1442: !BST [12] (maybe <- 0x40800124) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P1443: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P1444: !CASX [6] (maybe <- 0x1000022) (Int)
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

P1445: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P1446: !DWST [10] (maybe <- 0x1000024) (Int)
mov %l4, %o5 
sllx %o5, 32, %o5 
stx %o5, [%i2 + 32 ] 
add   %l4, 1, %l4

P1447: !BST [4] (maybe <- 0x40800125) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P1448: !BST [9] (maybe <- 0x40800126) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P1449: !BST [7] (maybe <- 0x40800127) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1450: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P1451: !CASX [1] (maybe <- 0x1000025) (Int)
add %i0, 0, %l3
ldx [%l3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %o5
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%l3], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P1452: !BST [8] (maybe <- 0x4080012a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P1453: !BST [2] (maybe <- 0x4080012b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1454: !BST [4] (maybe <- 0x4080012f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P1455: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P1456: !LD [5] (Int)
lduw [%i1 + 76], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P1457: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P1458: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P1459: !DWLD [8] (Int)
ldx [%i1 + 256], %o5
! move %o5(upper) -> %o2(lower)
srlx %o5, 32, %l7
or %l7, %o2, %o2

P1460: !BLD [0] (FP)
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

P1461: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P1462: !DWLD [3] (Int) (CBR)
ldx [%i0 + 32], %o3
! move %o3(upper) -> %o3(upper)

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1462
nop
RET1462:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P1463: !BLD [11] (FP)
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

P1464: !BST [15] (maybe <- 0x40800130) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P1465: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f0
membar #Sync 
! 1 addresses covered

P1466: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f1

P1467: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P1468: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P1469: !BST [9] (maybe <- 0x40800131) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P1470: !BST [11] (maybe <- 0x40800132) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P1471: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P1472: !BST [7] (maybe <- 0x40800133) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1473: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P1474: !DWST [7] (maybe <- 0x1000027) (Int) (LE)
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

P1475: !BST [13] (maybe <- 0x40800136) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P1476: !ST [0] (maybe <- 0x1000029) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P1477: !BLD [6] (FP)
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

P1478: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P1479: !PREFETCH [0] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i0 + 0] %asi, 1

P1480: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P1481: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P1482: !ST [6] (maybe <- 0x40800137) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i1 + 80 ]

P1483: !BLD [1] (FP)
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

P1484: !BST [15] (maybe <- 0x40800138) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P1485: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P1486: !BST [9] (maybe <- 0x40800139) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P1487: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P1488: !BST [0] (maybe <- 0x4080013a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1489: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P1490: !NOP (Int)
nop

P1491: !BLD [5] (FP)
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

P1492: !BST [11] (maybe <- 0x4080013e) (FP) (Branch target of P1198)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 
ba P1493
nop

TARGET1198:
ba RET1198
nop


P1493: !BLD [0] (FP)
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

P1494: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P1495: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P1496: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P1497: !ST [2] (maybe <- 0x4080013f) (FP) (Branch target of P1360)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i0 + 12 ]
ba P1498
nop

TARGET1360:
ba RET1360
nop


P1498: !ST [12] (maybe <- 0x100002a) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P1499: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f5
fmovd %f36, %f6

P1500: !ST [13] (maybe <- 0x100002b) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P1501: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P1502: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P1503: !ST [8] (maybe <- 0x100002c) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P1504: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P1505: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P1506: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P1507: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P1508: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P1509: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P1510: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P1511: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f11
fmovd %f36, %f12

P1512: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P1513: !BLD [3] (FP)
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

P1514: !BST [13] (maybe <- 0x40800140) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P1515: !BLD [6] (FP)
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

P1516: !BST [9] (maybe <- 0x40800141) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P1517: !BLD [3] (FP) (CBR)
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

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1517
nop
RET1517:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P1518: !LD [5] (Int) (CBR)
lduw [%i1 + 76], %o5
! move %o5(lower) -> %o3(lower)
srlx %o3, 32, %o3
sllx %o3, 32, %o3
or %o5, %o3, %o3

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1518
nop
RET1518:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P1519: !BLD [1] (FP)
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

P1520: !BST [8] (maybe <- 0x40800142) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P1521: !BST [5] (maybe <- 0x40800143) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1522: !BST [0] (maybe <- 0x40800146) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1523: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P1524: !BST [9] (maybe <- 0x4080014a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P1525: !BST [3] (maybe <- 0x4080014b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1526: !ST [1] (maybe <- 0x100002d) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P1527: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P1528: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P1529: !BST [11] (maybe <- 0x4080014f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P1530: !DWST [10] (maybe <- 0x40800150) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
std %f20, [%i2 + 32]

P1531: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P1532: !PREFETCH [2] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i0 + 12] %asi, 1

P1533: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P1534: !REPLACEMENT [2] (Int)
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

P1535: !MEMBAR (Int)
membar #StoreLoad

P1536: !LD [0] (Int)
lduw [%i0 + 0], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P1537: !LD [1] (Int)
lduw [%i0 + 4], %o5
! move %o5(lower) -> %o4(lower)
or %o5, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P1538: !LD [2] (Int)
lduw [%i0 + 12], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1539: !LD [3] (Int)
lduw [%i0 + 32], %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0

P1540: !LD [4] (Int)
lduw [%i0 + 64], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P1541: !LD [5] (Int)
lduw [%i1 + 76], %o5
! move %o5(lower) -> %o1(lower)
or %o5, %o1, %o1

P1542: !LD [6] (FP)
ld [%i1 + 80], %f14
! 1 addresses covered

P1543: !LD [7] (Int)
lduw [%i1 + 84], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P1544: !LD [8] (Int)
lduw [%i1 + 256], %o5
! move %o5(lower) -> %o2(lower)
or %o5, %o2, %o2

P1545: !LD [9] (Int)
lduw [%i1 + 512], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P1546: !LD [10] (Int) (LE)
wr %g0, 0x88, %asi
lduwa [%i2 + 32] %asi, %o5
! move %o5(lower) -> %o3(lower)
or %o5, %o3, %o3

P1547: !LD [11] (Int) (LE)
wr %g0, 0x88, %asi
lduwa [%i2 + 64] %asi, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P1548: !LD [12] (Int)
lduw [%i3 + 0], %o5
! move %o5(lower) -> %o4(lower)
or %o5, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P1549: !LD [13] (Int) (Branch target of P1173)
lduw [%i3 + 64], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
ba P1550
nop

TARGET1173:
ba RET1173
nop


P1550: !LD [14] (Int)
lduw [%i3 + 128], %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0

P1551: !LD [15] (Int) (LE)
wr %g0, 0x88, %asi
lduwa [%i3 + 192] %asi, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

END_NODES2: ! Test istream for CPU 2 ends
sethi %hi(0xdead0e0f), %l7
or    %l7, %lo(0xdead0e0f), %l7
! move %l7(lower) -> %o1(lower)
or %l7, %o1, %o1
stw %l7, [%i5] 
ld [%i5], %f15
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
sethi %hi(0x03deade1), %l6
or    %l6, %lo(0x03deade1), %l6
stw %l6, [%i5] 
ld [%i5], %f16

! Initialize running integer counter in register %l4
sethi %hi(0x1800001), %l4
or    %l4, %lo(0x1800001), %l4

! Initialize running FP counter in register %f16
sethi %hi(0x41000001), %l6
or    %l6, %lo(0x41000001), %l6
stw %l6, [%i5] 
ld [%i5], %f16

! Initialize FP counter increment value in register %f17 (constant)
sethi %hi(0x35800000), %l6
or    %l6, %lo(0x35800000), %l6
stw %l6, [%i5] 
ld [%i5], %f17 

! Initialize LFSR to 0x62e0^4
sethi %hi(0x62e0), %l0
or    %l0, %lo(0x62e0), %l0
mulx  %l0, %l0, %l0
mulx  %l0, %l0, %l0

!-- init shared addrs 6 to 7 ---
stx %g0, [%i1+80]

! use untouched cache-line (offset 4K) in replacement area for sync
sub %i1, %i0, %l7
add %i3, %l7, %l7
sub %l7, -4096, %l7

!-- begin of sync_init ---
or %g0, 1, %o5
or %g0, %o5, %l3
swap [%l7+4], %l3
membar #Sync
sync_init_1_3:
brnz,pt %o5, sync_init_1_3
lduw [%l7+4], %o5 ! delay slot
sync_init_2_3:
lduw [%l7], %o5
sub %o5, 1, %l3
cas [%l7], %o5, %l3
cmp %o5, %l3
bne,pt %xcc, sync_init_2_3
nop
membar #Sync
sync_init_3_3:
lduw [%l7], %o5 ! delay slot
brnz,pt %o5, sync_init_3_3
nop
!-- end of sync_init ---


BEGIN_NODES3: ! Test istream for CPU 3 begins

P1552: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f0
membar #Sync 
! 1 addresses covered

P1553: !CAS [10] (maybe <- 0x1800001) (Int)
add %i2, 32, %l7
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

P1554: !BST [12] (maybe <- 0x41000001) (FP) (Branch target of P2048)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 
ba P1555
nop

TARGET2048:
ba RET2048
nop


P1555: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P1556: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P1557: !PREFETCH [2] (Int) (LE) (Branch target of P1708)
wr %g0, 0x88, %asi
prefetcha [%i0 + 12] %asi, 1
ba P1558
nop

TARGET1708:
ba RET1708
nop


P1558: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P1559: !REPLACEMENT [11] (Int)
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

P1560: !BST [13] (maybe <- 0x41000002) (FP) (Branch target of P1980)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 
ba P1561
nop

TARGET1980:
ba RET1980
nop


P1561: !BST [8] (maybe <- 0x41000003) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P1562: !PREFETCH [9] (Int) (CBR)
prefetch [%i1 + 512], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1562
nop
RET1562:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P1563: !BLD [13] (FP) (Branch target of P1866)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2
ba P1564
nop

TARGET1866:
ba RET1866
nop


P1564: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P1565: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f4

P1566: !BST [8] (maybe <- 0x41000004) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P1567: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f5
fmovd %f36, %f6

P1568: !DWLD [11] (Int)
ldx [%i2 + 64], %o1
! move %o1(upper) -> %o1(upper)

P1569: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P1570: !DWST [1] (maybe <- 0x41000005) (FP) (Branch target of P1746)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=21 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
std %f20, [%i0 + 0]
ba P1571
nop

TARGET1746:
ba RET1746
nop


P1571: !DWLD [6] (Int)
ldx [%i1 + 80], %o5
! move %o5(upper) -> %o1(lower)
srlx %o1, 32, %o1
sllx %o1, 32, %o1
srlx %o5, 32, %l7
or %l7, %o1, %o1
! move %o5(lower) -> %o2(upper)
sllx %o5, 32, %o2

P1572: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P1573: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P1574: !ST [12] (maybe <- 0x1800002) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P1575: !LD [0] (Int)
lduw [%i0 + 0], %l3
! move %l3(lower) -> %o2(lower)
or %l3, %o2, %o2

P1576: !BLD [3] (FP)
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

P1577: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P1578: !MEMBAR (Int)
membar #StoreLoad

P1579: !SWAP [9] (maybe <- 0x1800003) (Int) (LE)
wr %g0, 0x88, %asi
mov %l4, %o3
! Change single-word-level endianess (big endian <-> little endian) 
sethi %hi(0xff00ff00), %l6
or %l6, %lo(0xff00ff00), %l6
and %o3, %l6, %l7
srl %l7, 8, %l7
sll %o3, 8, %o3
and %o3, %l6, %o3
or %o3, %l7, %o3
srl %o3, 16, %l7
sll %o3, 16, %o3
srl %o3, 0, %o3
or %o3, %l7, %o3
swapa  [%i1 + 512] %asi, %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P1580: !BST [7] (maybe <- 0x41000007) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1581: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P1582: !BLD [12] (FP)
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

P1583: !DWLD [15] (FP)
ldd [%i3 + 192], %f0
! 1 addresses covered

P1584: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P1585: !BST [15] (maybe <- 0x4100000a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P1586: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P1587: !BST [8] (maybe <- 0x4100000b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P1588: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P1589: !BST [4] (maybe <- 0x4100000c) (FP) (Branch target of P1695)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 
ba P1590
nop

TARGET1695:
ba RET1695
nop


P1590: !ST [11] (maybe <- 0x4100000d) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i2 + 64 ]

P1591: !BST [5] (maybe <- 0x4100000e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1592: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P1593: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P1594: !BST [8] (maybe <- 0x41000011) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P1595: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P1596: !DWLD [13] (Int)
ldx [%i3 + 64], %l7
! move %l7(upper) -> %o3(lower)
srlx %l7, 32, %l6
or %l6, %o3, %o3

P1597: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P1598: !DWST [8] (maybe <- 0x1800004) (Int)
mov %l4, %o5 
sllx %o5, 32, %o5 
stx %o5, [%i1 + 256 ] 
add   %l4, 1, %l4

P1599: !BST [3] (maybe <- 0x41000012) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1600: !BST [10] (maybe <- 0x41000016) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P1601: !CAS [12] (maybe <- 0x1800005) (Int)
add %i3, 0, %l6
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

P1602: !BLD [6] (FP)
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

P1603: !BST [10] (maybe <- 0x41000017) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P1604: !CAS [3] (maybe <- 0x1800006) (Int)
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

P1605: !LD [14] (Int)
lduw [%i3 + 128], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P1606: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P1607: !BST [2] (maybe <- 0x41000018) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1608: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P1609: !BLD [3] (FP)
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

P1610: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P1611: !REPLACEMENT [11] (Int)
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

P1612: !BST [13] (maybe <- 0x4100001c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P1613: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P1614: !BLD [1] (FP)
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

P1615: !MEMBAR (Int)
membar #StoreLoad

P1616: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P1617: !BST [6] (maybe <- 0x4100001d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1618: !BLD [13] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1618
nop
RET1618:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P1619: !CASX [5] (maybe <- 0x1800007) (Int)
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

P1620: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P1621: !BLD [0] (FP)
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

P1622: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P1623: !CASX [3] (maybe <- 0x1800008) (Int)
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

P1624: !BST [14] (maybe <- 0x41000020) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P1625: !BST [12] (maybe <- 0x41000021) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P1626: !CAS [0] (maybe <- 0x1800009) (Int)
add %i0, 0, %l6
lduw [%l6], %o5
mov %o5, %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0
mov %l4, %o1
cas [%l6], %l3, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P1627: !BLD [6] (FP) (Branch target of P1988)
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
ba P1628
nop

TARGET1988:
ba RET1988
nop


P1628: !BST [13] (maybe <- 0x41000022) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P1629: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P1630: !LD [15] (Int) (CBR)
lduw [%i3 + 192], %l3
! move %l3(lower) -> %o1(lower)
or %l3, %o1, %o1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1630
nop
RET1630:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P1631: !BST [7] (maybe <- 0x41000023) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1632: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P1633: !BST [5] (maybe <- 0x41000026) (FP) (Branch target of P1562)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 
ba P1634
nop

TARGET1562:
ba RET1562
nop


P1634: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f11

P1635: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P1636: !BST [13] (maybe <- 0x41000029) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P1637: !BST [12] (maybe <- 0x4100002a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P1638: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P1639: !NOP (Int)
nop

P1640: !BLD [0] (FP)
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

P1641: !BST [9] (maybe <- 0x4100002b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P1642: !BST [5] (maybe <- 0x4100002c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1643: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P1644: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P1645: !LD [3] (Int)
lduw [%i0 + 32], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P1646: !BST [12] (maybe <- 0x4100002f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P1647: !BST [13] (maybe <- 0x41000030) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P1648: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P1649: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P1650: !BLD [2] (FP)
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

P1651: !BST [6] (maybe <- 0x41000031) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1652: !BST [14] (maybe <- 0x41000034) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P1653: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P1654: !BLD [0] (FP) (Branch target of P1698)
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
ba P1655
nop

TARGET1698:
ba RET1698
nop


P1655: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P1656: !DWLD [9] (Int)
ldx [%i1 + 512], %o5
! move %o5(upper) -> %o2(lower)
srlx %o5, 32, %l7
or %l7, %o2, %o2

P1657: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P1658: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P1659: !BST [9] (maybe <- 0x41000035) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P1660: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P1661: !BST [6] (maybe <- 0x41000036) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1662: !BLD [3] (FP)
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

P1663: !REPLACEMENT [3] (Int)
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

P1664: !BLD [6] (FP)
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

P1665: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P1666: !BLD [1] (FP) (Branch target of P1726)
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
ba P1667
nop

TARGET1726:
ba RET1726
nop


P1667: !BST [3] (maybe <- 0x41000039) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1668: !BST [13] (maybe <- 0x4100003d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P1669: !BLD [1] (FP)
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

P1670: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P1671: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P1672: !PREFETCH [3] (Int) (Branch target of P2060)
prefetch [%i0 + 32], 1
ba P1673
nop

TARGET2060:
ba RET2060
nop


P1673: !BST [5] (maybe <- 0x4100003e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1674: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f11
fmovd %f36, %f12

P1675: !PREFETCH [6] (Int) (CBR)
prefetch [%i1 + 80], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1675
nop
RET1675:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P1676: !BLD [1] (FP)
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

P1677: !BLD [3] (FP)
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

P1678: !BLD [1] (FP)
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

P1679: !DWLD [7] (Int)
ldx [%i1 + 80], %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)

P1680: !BST [11] (maybe <- 0x41000041) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P1681: !BST [11] (maybe <- 0x41000042) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P1682: !BST [2] (maybe <- 0x41000043) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1683: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P1684: !BST [3] (maybe <- 0x41000047) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1685: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P1686: !BST [14] (maybe <- 0x4100004b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P1687: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P1688: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P1689: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P1690: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P1691: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P1692: !BLD [0] (FP)
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

P1693: !BLD [2] (FP)
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

P1694: !BLD [8] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1694
nop
RET1694:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P1695: !BST [5] (maybe <- 0x4100004c) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
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
be,pt  %xcc, TARGET1695
nop
RET1695:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P1696: !LD [4] (Int)
lduw [%i0 + 64], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P1697: !BLD [9] (FP) (Branch target of P1798)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3
ba P1698
nop

TARGET1798:
ba RET1798
nop


P1698: !BLD [8] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1698
nop
RET1698:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P1699: !BLD [0] (FP)
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

P1700: !BLD [2] (FP)
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

P1701: !BST [7] (maybe <- 0x4100004f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1702: !BST [1] (maybe <- 0x41000052) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
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
be,pn  %xcc, TARGET1702
nop
RET1702:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P1703: !ST [11] (maybe <- 0x180000a) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P1704: !BST [2] (maybe <- 0x41000056) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1705: !DWST [13] (maybe <- 0x180000b) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 64 ] 
add   %l4, 1, %l4

P1706: !BLD [2] (FP)
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

P1707: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P1708: !PREFETCH [4] (Int) (CBR)
prefetch [%i0 + 64], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1708
nop
RET1708:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P1709: !BLD [1] (FP)
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

P1710: !BST [8] (maybe <- 0x4100005a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P1711: !BST [13] (maybe <- 0x4100005b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P1712: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P1713: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P1714: !BLD [1] (FP) (Branch target of P1921)
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
ba P1715
nop

TARGET1921:
ba RET1921
nop


P1715: !BST [8] (maybe <- 0x4100005c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P1716: !BST [12] (maybe <- 0x4100005d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P1717: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P1718: !BST [13] (maybe <- 0x4100005e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P1719: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f10

P1720: !BST [1] (maybe <- 0x4100005f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1721: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P1722: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P1723: !BST [11] (maybe <- 0x41000063) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P1724: !BST [1] (maybe <- 0x41000064) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
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
be,pn  %xcc, TARGET1724
nop
RET1724:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P1725: !BST [14] (maybe <- 0x41000068) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P1726: !PREFETCH [1] (Int) (CBR)
prefetch [%i0 + 4], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1726
nop
RET1726:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P1727: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P1728: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P1729: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P1730: !BST [6] (maybe <- 0x41000069) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1731: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P1732: !BST [3] (maybe <- 0x4100006c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1733: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P1734: !REPLACEMENT [8] (Int)
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

P1735: !REPLACEMENT [12] (Int)
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

P1736: !BST [1] (maybe <- 0x41000070) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1737: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P1738: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P1739: !BST [13] (maybe <- 0x41000074) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P1740: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P1741: !BST [6] (maybe <- 0x41000075) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1742: !DWST [5] (maybe <- 0x180000c) (Int)
mov %l4, %o5 
stx %o5, [%i1 + 72]
add   %l4, 1, %l4

P1743: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P1744: !BLD [3] (FP)
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

P1745: !BST [14] (maybe <- 0x41000078) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P1746: !PREFETCH [13] (Int) (CBR)
prefetch [%i3 + 64], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1746
nop
RET1746:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P1747: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f2

P1748: !BLD [2] (FP)
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

P1749: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f36, %f8

P1750: !BLD [2] (FP)
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

P1751: !BST [1] (maybe <- 0x41000079) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1752: !BST [5] (maybe <- 0x4100007d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1753: !BST [13] (maybe <- 0x41000080) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P1754: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P1755: !BST [3] (maybe <- 0x41000081) (FP) (Branch target of P1724)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 
ba P1756
nop

TARGET1724:
ba RET1724
nop


P1756: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f14

P1757: !BST [5] (maybe <- 0x41000085) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1758: !BST [0] (maybe <- 0x41000088) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1759: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P1760: !BLD [1] (FP)
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

P1761: !BST [2] (maybe <- 0x4100008c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1762: !BST [3] (maybe <- 0x41000090) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1763: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P1764: !BST [10] (maybe <- 0x41000094) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P1765: !BST [10] (maybe <- 0x41000095) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P1766: !BLD [0] (FP)
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

P1767: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P1768: !BST [12] (maybe <- 0x41000096) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P1769: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P1770: !BST [6] (maybe <- 0x41000097) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1771: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P1772: !BST [12] (maybe <- 0x4100009a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P1773: !CAS [4] (maybe <- 0x180000d) (Int)
add %i0, 64, %l7
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

P1774: !BLD [1] (FP)
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

P1775: !BST [1] (maybe <- 0x4100009b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1776: !BST [13] (maybe <- 0x4100009f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P1777: !PREFETCH [9] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i1 + 512] %asi, 1

P1778: !BLD [15] (FP)
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

P1779: !ST [12] (maybe <- 0x180000e) (Int) (LE)
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
stwa   %o5, [%i3 + 0] %asi
add   %l4, 1, %l4

P1780: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f0
membar #Sync 
! 1 addresses covered

P1781: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P1782: !DWST [6] (maybe <- 0x180000f) (Int)
sllx %l4, 32, %l7 
add   %l4, 1, %l4
or %l7, %l4, %l7
stx %l7, [%i1 + 80]
add   %l4, 1, %l4

P1783: !BST [7] (maybe <- 0x410000a0) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1784: !CAS [4] (maybe <- 0x1800011) (Int)
add %i0, 64, %l6
lduw [%l6], %o5
mov %o5, %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0
mov %l4, %o1
cas [%l6], %l3, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P1785: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P1786: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P1787: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P1788: !BST [2] (maybe <- 0x410000a3) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1789: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P1790: !BST [7] (maybe <- 0x410000a7) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1791: !BST [1] (maybe <- 0x410000aa) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1792: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P1793: !BLD [6] (FP)
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

P1794: !PREFETCH [9] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i1 + 512] %asi, 1

P1795: !BLD [0] (FP)
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

P1796: !BLD [1] (FP)
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

P1797: !REPLACEMENT [4] (Int)
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

P1798: !BLD [12] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1798
nop
RET1798:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P1799: !BLD [6] (FP)
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

P1800: !CAS [10] (maybe <- 0x1800012) (Int) (Branch target of P1630)
add %i2, 32, %l7
lduw [%l7], %l3
mov %l3, %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1
mov %l4, %o2
cas [%l7], %l6, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4
ba P1801
nop

TARGET1630:
ba RET1630
nop


P1801: !DWST [6] (maybe <- 0x1800013) (Int)
sllx %l4, 32, %l6 
add   %l4, 1, %l4
or %l6, %l4, %l6
stx %l6, [%i1 + 80]
add   %l4, 1, %l4

P1802: !BLD [0] (FP)
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

P1803: !BLD [0] (FP)
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

P1804: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P1805: !SWAP [0] (maybe <- 0x1800015) (Int)
mov %l4, %l7
swap  [%i0 + 0], %l7
! move %l7(lower) -> %o2(lower)
srl %l7, 0, %l3
or %l3, %o2, %o2
add   %l4, 1, %l4

P1806: !DWLD [13] (Int)
ldx [%i3 + 64], %o3
! move %o3(upper) -> %o3(upper)

P1807: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P1808: !MEMBAR (Int)
membar #StoreLoad

P1809: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P1810: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P1811: !SWAP [6] (maybe <- 0x1800016) (Int)
mov %l4, %o5
swap  [%i1 + 80], %o5
! move %o5(lower) -> %o3(lower)
srlx %o3, 32, %o3
sllx %o3, 32, %o3
srl %o5, 0, %l6
or %l6, %o3, %o3
add   %l4, 1, %l4

P1812: !BST [10] (maybe <- 0x410000ae) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P1813: !BST [12] (maybe <- 0x410000af) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P1814: !CAS [12] (maybe <- 0x1800017) (Int)
add %i3, 0, %o5
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

P1815: !ST [8] (maybe <- 0x1800018) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P1816: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P1817: !BST [7] (maybe <- 0x410000b0) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
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
be,pt  %xcc, TARGET1817
nop
RET1817:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P1818: !DWLD [13] (FP)
ldd [%i3 + 64], %f12
! 1 addresses covered

P1819: !BST [8] (maybe <- 0x410000b3) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P1820: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P1821: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P1822: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P1823: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P1824: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P1825: !BLD [5] (FP)
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

P1826: !ST [5] (maybe <- 0x1800019) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P1827: !BLD [2] (FP)
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

P1828: !BST [8] (maybe <- 0x410000b4) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P1829: !BST [13] (maybe <- 0x410000b5) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P1830: !BST [4] (maybe <- 0x410000b6) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P1831: !BST [15] (maybe <- 0x410000b7) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P1832: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P1833: !LD [8] (Int)
lduw [%i1 + 256], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1834: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P1835: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P1836: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P1837: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P1838: !BST [15] (maybe <- 0x410000b8) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P1839: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P1840: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P1841: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P1842: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P1843: !NOP (Int)
nop

P1844: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f10

P1845: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P1846: !LD [11] (Int)
lduw [%i2 + 64], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

P1847: !BST [9] (maybe <- 0x410000b9) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P1848: !ST [10] (maybe <- 0x180001a) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P1849: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P1850: !BST [6] (maybe <- 0x410000ba) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1851: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P1852: !REPLACEMENT [14] (Int)
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

P1853: !CAS [0] (maybe <- 0x180001b) (Int)
add %i0, 0, %o5
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

P1854: !BST [6] (maybe <- 0x410000bd) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1855: !CASX [2] (maybe <- 0x180001c) (Int)
add %i0, 8, %l7
ldx [%l7], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov  %o2, %l6
mov %l4, %o3
casx [%l7], %l6, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4

P1856: !BST [4] (maybe <- 0x410000c0) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P1857: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P1858: !BST [9] (maybe <- 0x410000c1) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P1859: !ST [13] (maybe <- 0x180001d) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P1860: !BST [4] (maybe <- 0x410000c2) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P1861: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P1862: !CASX [5] (maybe <- 0x180001e) (Int)
add %i1, 72, %l7
ldx [%l7], %o4
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5
mov  %o4, %l6
mov %l4, %o0
casx [%l7], %l6, %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
add  %l4, 1, %l4

P1863: !LD [0] (Int)
lduw [%i0 + 0], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P1864: !DWLD [1] (Int)
ldx [%i0 + 0], %l3
! move %l3(upper) -> %o1(lower)
srlx %l3, 32, %o5
or %o5, %o1, %o1
! move %l3(lower) -> %o2(upper)
sllx %l3, 32, %o2

P1865: !PREFETCH [14] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i3 + 128] %asi, 1

P1866: !DWLD [4] (Int) (CBR)
ldx [%i0 + 64], %l7
! move %l7(upper) -> %o2(lower)
srlx %l7, 32, %l6
or %l6, %o2, %o2

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1866
nop
RET1866:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P1867: !PREFETCH [4] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i0 + 64] %asi, 1

P1868: !BLD [11] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1868
nop
RET1868:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P1869: !DWLD [0] (Int)
ldx [%i0 + 0], %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)

P1870: !LD [2] (Int)
lduw [%i0 + 12], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P1871: !ST [6] (maybe <- 0x180001f) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P1872: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P1873: !DWST [10] (maybe <- 0x1800020) (Int)
mov %l4, %l3 
sllx %l3, 32, %l3 
stx %l3, [%i2 + 32 ] 
add   %l4, 1, %l4

P1874: !BST [12] (maybe <- 0x410000c3) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P1875: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P1876: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P1877: !BST [10] (maybe <- 0x410000c4) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P1878: !BLD [14] (FP)
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

P1879: !DWST [13] (maybe <- 0x1800021) (Int) (LE)
wr %g0, 0x88, %asi
! Change single-word-level endianess (big endian <-> little endian) 
sethi %hi(0xff00ff00), %l6
or %l6, %lo(0xff00ff00), %l6
and %l4, %l6, %o5
srl %o5, 8, %o5
sll %l4, 8, %l7
and %l7, %l6, %l7
or %l7, %o5, %l7
srl %l7, 16, %o5
sll %l7, 16, %l7
srl %l7, 0, %l7
or %l7, %o5, %l7
stxa %l7, [%i3 + 64 ] %asi
add   %l4, 1, %l4

P1880: !PREFETCH [1] (Int) (Branch target of P1702)
prefetch [%i0 + 4], 1
ba P1881
nop

TARGET1702:
ba RET1702
nop


P1881: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f0
membar #Sync 
! 1 addresses covered

P1882: !BST [13] (maybe <- 0x410000c5) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P1883: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P1884: !DWLD [3] (Int)
ldx [%i0 + 32], %l3
! move %l3(upper) -> %o4(lower)
srlx %l3, 32, %o5
or %o5, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P1885: !DWST [2] (maybe <- 0x1800022) (Int)
mov %l4, %l6 
stx %l6, [%i0 + 8]
add   %l4, 1, %l4

P1886: !BLD [0] (FP)
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

P1887: !CAS [9] (maybe <- 0x1800023) (Int)
add %i1, 512, %l6
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

P1888: !DWLD [11] (FP)
ldd [%i2 + 64], %f6
! 1 addresses covered

P1889: !BST [5] (maybe <- 0x410000c6) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1890: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P1891: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P1892: !BST [7] (maybe <- 0x410000c9) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1893: !BLD [2] (FP)
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

P1894: !DWST [4] (maybe <- 0x410000cc) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
std %f20, [%i0 + 64]

P1895: !BST [14] (maybe <- 0x410000cd) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P1896: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P1897: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P1898: !BST [8] (maybe <- 0x410000ce) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P1899: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P1900: !BLD [4] (FP)
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

P1901: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f0
membar #Sync 
! 1 addresses covered

P1902: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P1903: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P1904: !LD [6] (Int)
lduw [%i1 + 80], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P1905: !BST [6] (maybe <- 0x410000cf) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1906: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P1907: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P1908: !DWST [8] (maybe <- 0x1800024) (Int)
mov %l4, %l3 
sllx %l3, 32, %l3 
stx %l3, [%i1 + 256 ] 
add   %l4, 1, %l4

P1909: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P1910: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P1911: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f5
fmovd %f36, %f6

P1912: !REPLACEMENT [15] (Int)
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

P1913: !BST [0] (maybe <- 0x410000d2) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1914: !LD [8] (Int)
lduw [%i1 + 256], %l7
! move %l7(lower) -> %o1(lower)
or %l7, %o1, %o1

P1915: !LD [7] (Int)
lduw [%i1 + 84], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P1916: !BLD [6] (FP)
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

P1917: !ST [15] (maybe <- 0x1800025) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P1918: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P1919: !MEMBAR (Int)
membar #StoreLoad

P1920: !PREFETCH [3] (Int) (Branch target of P1868)
prefetch [%i0 + 32], 1
ba P1921
nop

TARGET1868:
ba RET1868
nop


P1921: !ST [10] (maybe <- 0x1800026) (Int) (CBR)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1921
nop
RET1921:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P1922: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f11
fmovd %f36, %f12

P1923: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P1924: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P1925: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P1926: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P1927: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P1928: !BLD [15] (FP)
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

P1929: !BST [15] (maybe <- 0x410000d6) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P1930: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f0
membar #Sync 
! 1 addresses covered

P1931: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P1932: !ST [11] (maybe <- 0x1800027) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P1933: !LD [5] (Int)
lduw [%i1 + 76], %o5
! move %o5(lower) -> %o2(lower)
or %o5, %o2, %o2

P1934: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P1935: !BST [7] (maybe <- 0x410000d7) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1936: !BST [1] (maybe <- 0x410000da) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1937: !DWLD [1] (Int)
ldx [%i0 + 0], %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)

P1938: !BLD [2] (FP)
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

P1939: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P1940: !BST [7] (maybe <- 0x410000de) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1941: !BLD [3] (FP)
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

P1942: !BST [15] (maybe <- 0x410000e1) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P1943: !BLD [0] (FP)
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

P1944: !BST [12] (maybe <- 0x410000e2) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P1945: !CASX [0] (maybe <- 0x1800028) (Int)
add %i0, 0, %l7
ldx [%l7], %o4
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5
mov %o4, %l6
sllx %l4, 32, %o0
add  %l4, 1, %l4
or   %l4, %o0, %o0
casx [%l7], %l6, %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
add  %l4, 1, %l4

P1946: !BST [9] (maybe <- 0x410000e3) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P1947: !BST [5] (maybe <- 0x410000e4) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1948: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P1949: !DWLD [4] (Int)
ldx [%i0 + 64], %o1
! move %o1(upper) -> %o1(upper)

P1950: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P1951: !MEMBAR (Int)
membar #StoreLoad

P1952: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P1953: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P1954: !BLD [8] (FP)
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

P1955: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f0
membar #Sync 
! 1 addresses covered

P1956: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P1957: !BLD [6] (FP)
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

P1958: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P1959: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f5
fmovd %f36, %f6

P1960: !BLD [1] (FP)
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

P1961: !BST [10] (maybe <- 0x410000e7) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P1962: !BST [7] (maybe <- 0x410000e8) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1963: !ST [14] (maybe <- 0x180002a) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P1964: !BST [6] (maybe <- 0x410000eb) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1965: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P1966: !DWST [2] (maybe <- 0x180002b) (Int)
mov %l4, %l6 
stx %l6, [%i0 + 8]
add   %l4, 1, %l4

P1967: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P1968: !ST [4] (maybe <- 0x180002c) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P1969: !BST [14] (maybe <- 0x410000ee) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P1970: !MEMBAR (Int)
membar #StoreLoad

P1971: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P1972: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P1973: !BST [11] (maybe <- 0x410000ef) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P1974: !MEMBAR (Int)
membar #StoreLoad

P1975: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P1976: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P1977: !BLD [0] (FP)
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

P1978: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P1979: !BLD [1] (FP)
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

P1980: !BST [1] (maybe <- 0x410000f0) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
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
be,pn  %xcc, TARGET1980
nop
RET1980:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P1981: !PREFETCH [0] (Int) (CBR)
prefetch [%i0 + 0], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1981
nop
RET1981:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P1982: !LD [11] (FP)
ld [%i2 + 64], %f7
! 1 addresses covered

P1983: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f8

P1984: !BST [14] (maybe <- 0x410000f4) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P1985: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P1986: !BLD [0] (FP)
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

P1987: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P1988: !PREFETCH [3] (Int) (CBR)
prefetch [%i0 + 32], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1988
nop
RET1988:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P1989: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P1990: !DWLD [0] (Int)
ldx [%i0 + 0], %o5
! move %o5(upper) -> %o1(lower)
srlx %o1, 32, %o1
sllx %o1, 32, %o1
srlx %o5, 32, %l7
or %l7, %o1, %o1
! move %o5(lower) -> %o2(upper)
sllx %o5, 32, %o2

P1991: !BST [4] (maybe <- 0x410000f5) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P1992: !BST [12] (maybe <- 0x410000f6) (FP) (Branch target of P1694)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 
ba P1993
nop

TARGET1694:
ba RET1694
nop


P1993: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P1994: !BLD [7] (FP) (Branch target of P1817)
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
ba P1995
nop

TARGET1817:
ba RET1817
nop


P1995: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P1996: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P1997: !DWLD [12] (FP)
ldd [%i3 + 0], %f2
! 1 addresses covered

P1998: !DWLD [12] (Int)
ldx [%i3 + 0], %o5
! move %o5(upper) -> %o2(lower)
srlx %o5, 32, %l7
or %l7, %o2, %o2

P1999: !BLD [0] (FP)
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

P2000: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P2001: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P2002: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P2003: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P2004: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P2005: !BLD [0] (FP)
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

P2006: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P2007: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P2008: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P2009: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P2010: !BST [14] (maybe <- 0x410000f7) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P2011: !PREFETCH [8] (Int) (Branch target of P1618)
prefetch [%i1 + 256], 1
ba P2012
nop

TARGET1618:
ba RET1618
nop


P2012: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P2013: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P2014: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P2015: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P2016: !BLD [6] (FP)
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

P2017: !BST [10] (maybe <- 0x410000f8) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P2018: !DWLD [14] (FP)
ldd [%i3 + 128], %f18
! 1 addresses covered
fmovs %f18, %f1

P2019: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P2020: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P2021: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P2022: !BST [2] (maybe <- 0x410000f9) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2023: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P2024: !REPLACEMENT [14] (Int)
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

P2025: !NOP (Int)
nop

P2026: !BST [10] (maybe <- 0x410000fd) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P2027: !LD [3] (Int)
lduw [%i0 + 32], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P2028: !BST [5] (maybe <- 0x410000fe) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2029: !BST [1] (maybe <- 0x41000101) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2030: !REPLACEMENT [7] (Int)
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

P2031: !BLD [3] (FP)
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

P2032: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P2033: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P2034: !ST [2] (maybe <- 0x41000105) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i0 + 12 ]

P2035: !LD [1] (Int) (LE)
wr %g0, 0x88, %asi
lduwa [%i0 + 4] %asi, %l7
! move %l7(lower) -> %o3(lower)
or %l7, %o3, %o3

P2036: !BST [5] (maybe <- 0x41000106) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2037: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P2038: !BST [1] (maybe <- 0x41000109) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2039: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P2040: !BST [3] (maybe <- 0x4100010d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2041: !LD [15] (Int)
lduw [%i3 + 192], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P2042: !BST [4] (maybe <- 0x41000111) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P2043: !CASX [4] (maybe <- 0x180002d) (Int)
add %i0, 64, %l7
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

P2044: !CAS [1] (maybe <- 0x180002e) (Int)
add %i0, 4, %l7
lduw [%l7], %l3
mov %l3, %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1
mov %l4, %o2
cas [%l7], %l6, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P2045: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f36, %f8

P2046: !BST [3] (maybe <- 0x41000112) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2047: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P2048: !BST [2] (maybe <- 0x41000116) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
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
be,pn  %xcc, TARGET2048
nop
RET2048:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P2049: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P2050: !BLD [3] (FP)
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

P2051: !BLD [3] (FP)
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

P2052: !MEMBAR (Int)
membar #StoreLoad

P2053: !LD [0] (Int)
lduw [%i0 + 0], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2

P2054: !LD [1] (Int)
lduw [%i0 + 4], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P2055: !LD [2] (Int) (Branch target of P1675)
lduw [%i0 + 12], %l6
! move %l6(lower) -> %o3(lower)
or %l6, %o3, %o3
ba P2056
nop

TARGET1675:
ba RET1675
nop


P2056: !LD [3] (Int)
lduw [%i0 + 32], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P2057: !LD [4] (Int)
lduw [%i0 + 64], %l6
! move %l6(lower) -> %o4(lower)
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P2058: !LD [5] (Int)
lduw [%i1 + 76], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P2059: !LD [6] (Int)
lduw [%i1 + 80], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

P2060: !LD [7] (Int) (CBR)
lduw [%i1 + 84], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2060
nop
RET2060:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P2061: !LD [8] (Int)
lduw [%i1 + 256], %l7
! move %l7(lower) -> %o1(lower)
or %l7, %o1, %o1

P2062: !LD [9] (Int)
lduw [%i1 + 512], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P2063: !LD [10] (Int)
lduw [%i2 + 32], %l7
! move %l7(lower) -> %o2(lower)
or %l7, %o2, %o2

P2064: !LD [11] (Int)
lduw [%i2 + 64], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P2065: !LD [12] (FP)
ld [%i3 + 0], %f2
! 1 addresses covered

P2066: !LD [13] (Int)
lduw [%i3 + 64], %l7
! move %l7(lower) -> %o3(lower)
or %l7, %o3, %o3

P2067: !LD [14] (FP)
ld [%i3 + 128], %f3
! 1 addresses covered

P2068: !LD [15] (Int) (Branch target of P1981)
lduw [%i3 + 192], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
ba END_NODES3
nop

TARGET1981:
ba RET1981
nop


END_NODES3: ! Test istream for CPU 3 ends
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
ld [%i5], %f4
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30

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

! Initialize LFSR to 0x1fae^4
sethi %hi(0x1fae), %l0
or    %l0, %lo(0x1fae), %l0
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

P2069: !BST [9] (maybe <- 0x41800001) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P2070: !BST [2] (maybe <- 0x41800002) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
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
be,pn  %xcc, TARGET2070
nop
RET2070:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P2071: !LD [1] (Int)
lduw [%i0 + 4], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P2072: !BST [14] (maybe <- 0x41800006) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P2073: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f0
membar #Sync 
! 3 addresses covered
fmovs %f3, %f0
fmovs %f4, %f1
fmovs %f5, %f2

P2074: !BST [14] (maybe <- 0x41800007) (FP) (Branch target of P2338)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 
ba P2075
nop

TARGET2338:
ba RET2338
nop


P2075: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P2076: !DWLD [2] (Int)
ldx [%i0 + 8], %l3
! move %l3(lower) -> %o0(lower)
srl %l3, 0, %o5
or %o5, %o0, %o0

P2077: !DWLD [5] (Int)
ldx [%i1 + 72], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P2078: !BST [15] (maybe <- 0x41800008) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P2079: !DWLD [5] (Int)
ldx [%i1 + 72], %o5
! move %o5(lower) -> %o1(lower)
srl %o5, 0, %l7
or %l7, %o1, %o1

P2080: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P2081: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P2082: !BST [15] (maybe <- 0x41800009) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P2083: !BST [9] (maybe <- 0x4180000a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P2084: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f3

P2085: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P2086: !LD [10] (Int)
lduw [%i2 + 32], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P2087: !LD [1] (Int)
lduw [%i0 + 4], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2

P2088: !BST [1] (maybe <- 0x4180000b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2089: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P2090: !DWST [13] (maybe <- 0x2000001) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 64 ] 
add   %l4, 1, %l4

P2091: !BST [2] (maybe <- 0x4180000f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2092: !BST [7] (maybe <- 0x41800013) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2093: !PREFETCH [8] (Int) (Branch target of P2298)
prefetch [%i1 + 256], 1
ba P2094
nop

TARGET2298:
ba RET2298
nop


P2094: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P2095: !BLD [5] (FP)
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

P2096: !NOP (Int) (Branch target of P2551)
nop
ba P2097
nop

TARGET2551:
ba RET2551
nop


P2097: !SWAP [2] (maybe <- 0x2000002) (Int)
mov %l4, %o3
swap  [%i0 + 12], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P2098: !CAS [14] (maybe <- 0x2000003) (Int)
add %i3, 128, %l7
lduw [%l7], %l3
mov %l3, %l6
! move %l6(lower) -> %o3(lower)
or %l6, %o3, %o3
mov %l4, %o4
cas [%l7], %l6, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P2099: !BLD [8] (FP) (Branch target of P2184)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9
ba P2100
nop

TARGET2184:
ba RET2184
nop


P2100: !PREFETCH [5] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i1 + 76] %asi, 1

P2101: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P2102: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P2103: !CAS [2] (maybe <- 0x2000004) (Int) (LE)
! Change single-word-level endianess (big endian <-> little endian) 
sethi %hi(0xff00ff00), %l7
or %l7, %lo(0xff00ff00), %l7
and %l4, %l7, %l6
srl %l6, 8, %l6
sll %l4, 8, %o5
and %o5, %l7, %o5
or %o5, %l6, %o5
srl %o5, 16, %l6
sll %o5, 16, %o5
srl %o5, 0, %o5
or %o5, %l6, %o5
wr %g0, 0x88, %asi
add %i0, 12, %l7
lduwa [%l7] %asi, %l3
mov %l3, %l6
! move %l6(lower) -> %o4(lower)
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5
mov %o5, %o0
casa [%l7] %asi, %l6, %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
add   %l4, 1, %l4

P2104: !BST [10] (maybe <- 0x41800016) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P2105: !LD [10] (Int)
lduw [%i2 + 32], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

P2106: !SWAP [13] (maybe <- 0x2000005) (Int)
mov %l4, %o1
swap  [%i3 + 64], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P2107: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P2108: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P2109: !BLD [2] (FP)
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

P2110: !BST [14] (maybe <- 0x41800017) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P2111: !BLD [10] (FP)
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

P2112: !BST [5] (maybe <- 0x41800018) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2113: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f0
membar #Sync 
! 1 addresses covered

P2114: !REPLACEMENT [2] (Int)
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

P2115: !BST [15] (maybe <- 0x4180001b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P2116: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f36, %f2

P2117: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P2118: !DWLD [15] (FP)
ldd [%i3 + 192], %f18
! 1 addresses covered
fmovs %f18, %f5

P2119: !ST [4] (maybe <- 0x2000006) (Int) (CBR)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2119
nop
RET2119:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P2120: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P2121: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P2122: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P2123: !BLD [2] (FP)
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

P2124: !LD [3] (Int) (LE)
wr %g0, 0x88, %asi
lduwa [%i0 + 32] %asi, %l7
! move %l7(lower) -> %o1(lower)
or %l7, %o1, %o1

P2125: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P2126: !BLD [1] (FP)
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

P2127: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P2128: !CAS [8] (maybe <- 0x2000007) (Int)
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

P2129: !BLD [8] (FP)
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

P2130: !BST [6] (maybe <- 0x4180001c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2131: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P2132: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f0
membar #Sync 
! 1 addresses covered

P2133: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P2134: !BST [3] (maybe <- 0x4180001f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2135: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f36, %f2

P2136: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P2137: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f5

P2138: !BST [0] (maybe <- 0x41800023) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2139: !BST [6] (maybe <- 0x41800027) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2140: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P2141: !BLD [0] (FP)
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

P2142: !BST [14] (maybe <- 0x4180002a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P2143: !MEMBAR (Int)
membar #StoreLoad

P2144: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P2145: !LD [1] (Int)
lduw [%i0 + 4], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P2146: !SWAP [13] (maybe <- 0x2000008) (Int)
mov %l4, %l7
swap  [%i3 + 64], %l7
! move %l7(lower) -> %o3(lower)
srl %l7, 0, %l3
or %l3, %o3, %o3
add   %l4, 1, %l4

P2147: !SWAP [4] (maybe <- 0x2000009) (Int)
mov %l4, %o4
swap  [%i0 + 64], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P2148: !DWLD [3] (FP)
ldd [%i0 + 32], %f10
! 1 addresses covered

P2149: !BST [1] (maybe <- 0x4180002b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2150: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P2151: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P2152: !DWLD [8] (Int)
ldx [%i1 + 256], %l7
! move %l7(upper) -> %o4(lower)
srlx %l7, 32, %l6
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P2153: !BST [2] (maybe <- 0x4180002f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2154: !BLD [3] (FP)
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

P2155: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P2156: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P2157: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f0
membar #Sync 
! 3 addresses covered
fmovs %f3, %f0
fmovs %f4, %f1
fmovs %f5, %f2

P2158: !BST [14] (maybe <- 0x41800033) (FP) (CBR)
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
be,pn  %xcc, TARGET2158
nop
RET2158:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P2159: !ST [13] (maybe <- 0x200000a) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P2160: !BST [11] (maybe <- 0x41800034) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P2161: !DWLD [13] (Int)
ldx [%i3 + 64], %o0
! move %o0(upper) -> %o0(upper)

P2162: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P2163: !BLD [5] (FP)
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

P2164: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f36, %f8

P2165: !NOP (Int)
nop

P2166: !BLD [2] (FP)
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

P2167: !BST [15] (maybe <- 0x41800035) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P2168: !BST [15] (maybe <- 0x41800036) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P2169: !BLD [6] (FP)
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

P2170: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P2171: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P2172: !BST [2] (maybe <- 0x41800037) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2173: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P2174: !BST [15] (maybe <- 0x4180003b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P2175: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f3
fmovd %f36, %f4

P2176: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P2177: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f6

P2178: !CASX [15] (maybe <- 0x200000b) (Int)
add %i3, 192, %o5
ldx [%o5], %l6
! move %l6(upper) -> %o0(lower)
srlx %o0, 32, %o0
sllx %o0, 32, %o0
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

P2179: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f36, %f8

P2180: !BLD [7] (FP)
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

P2181: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P2182: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P2183: !BLD [6] (FP)
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

P2184: !BST [10] (maybe <- 0x4180003c) (FP) (CBR)
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
be,pt  %xcc, TARGET2184
nop
RET2184:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P2185: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P2186: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P2187: !BST [6] (maybe <- 0x4180003d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2188: !BST [1] (maybe <- 0x41800040) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
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
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P2189: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P2190: !BLD [7] (FP)
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

P2191: !BST [9] (maybe <- 0x41800044) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P2192: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P2193: !BST [13] (maybe <- 0x41800045) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P2194: !BST [9] (maybe <- 0x41800046) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P2195: !BLD [6] (FP)
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

P2196: !BLD [3] (FP)
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

P2197: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P2198: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P2199: !PREFETCH [15] (Int) (Branch target of P2545)
prefetch [%i3 + 192], 1
ba P2200
nop

TARGET2545:
ba RET2545
nop


P2200: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f14

P2201: !BLD [12] (FP)
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

P2202: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f0
membar #Sync 
! 1 addresses covered

P2203: !BST [3] (maybe <- 0x41800047) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2204: !BST [13] (maybe <- 0x4180004b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P2205: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P2206: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P2207: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P2208: !REPLACEMENT [15] (Int)
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

P2209: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P2210: !BST [6] (maybe <- 0x4180004c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2211: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P2212: !BLD [2] (FP)
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

P2213: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P2214: !MEMBAR (Int)
membar #StoreLoad

P2215: !BST [8] (maybe <- 0x4180004f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P2216: !BST [5] (maybe <- 0x41800050) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2217: !DWLD [4] (Int)
ldx [%i0 + 64], %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l3
or %l3, %o2, %o2

P2218: !BST [4] (maybe <- 0x41800053) (FP) (Branch target of P2355)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 
ba P2219
nop

TARGET2355:
ba RET2355
nop


P2219: !BLD [5] (FP) (Branch target of P2580)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f36, %f8
ba P2220
nop

TARGET2580:
ba RET2580
nop


P2220: !BLD [6] (FP)
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

P2221: !PREFETCH [9] (Int) (CBR)
prefetch [%i1 + 512], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2221
nop
RET2221:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P2222: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P2223: !BLD [2] (FP)
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

P2224: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P2225: !LD [10] (Int)
lduw [%i2 + 32], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P2226: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P2227: !ST [7] (maybe <- 0x200000c) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P2228: !BST [4] (maybe <- 0x41800054) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P2229: !DWLD [12] (Int)
ldx [%i3 + 0], %o5
! move %o5(upper) -> %o3(lower)
srlx %o5, 32, %l7
or %l7, %o3, %o3

P2230: !BST [9] (maybe <- 0x41800055) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P2231: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P2232: !BLD [15] (FP) (Branch target of P2327)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2
ba P2233
nop

TARGET2327:
ba RET2327
nop


P2233: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P2234: !BLD [2] (FP)
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

P2235: !BLD [0] (FP)
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

P2236: !SWAP [4] (maybe <- 0x200000d) (Int) (LE)
wr %g0, 0x88, %asi
mov %l4, %o4
! Change single-word-level endianess (big endian <-> little endian) 
sethi %hi(0xff00ff00), %o5
or %o5, %lo(0xff00ff00), %o5
and %o4, %o5, %l3
srl %l3, 8, %l3
sll %o4, 8, %o4
and %o4, %o5, %o4
or %o4, %l3, %o4
srl %o4, 16, %l3
sll %o4, 16, %o4
srl %o4, 0, %o4
or %o4, %l3, %o4
swapa  [%i0 + 64] %asi, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P2237: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P2238: !BST [0] (maybe <- 0x41800056) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2239: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P2240: !BLD [6] (FP)
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

P2241: !BST [13] (maybe <- 0x4180005a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P2242: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P2243: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P2244: !BST [3] (maybe <- 0x4180005b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2245: !BST [8] (maybe <- 0x4180005f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P2246: !LD [15] (Int)
lduw [%i3 + 192], %o5
! move %o5(lower) -> %o4(lower)
or %o5, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P2247: !BLD [3] (FP)
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

P2248: !DWLD [10] (Int)
ldx [%i2 + 32], %o0
! move %o0(upper) -> %o0(upper)

P2249: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P2250: !BLD [0] (FP)
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

P2251: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f36, %f8

P2252: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P2253: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P2254: !BST [12] (maybe <- 0x41800060) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P2255: !MEMBAR (Int)
membar #StoreLoad

P2256: !CASX [15] (maybe <- 0x200000e) (Int)
add %i3, 192, %l7
ldx [%l7], %l3
! move %l3(upper) -> %o0(lower)
srlx %o0, 32, %o0
sllx %o0, 32, %o0
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

P2257: !BST [5] (maybe <- 0x41800061) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2258: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P2259: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P2260: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P2261: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P2262: !BLD [3] (FP) (Branch target of P2384)
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
ba P2263
nop

TARGET2384:
ba RET2384
nop


P2263: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P2264: !BLD [2] (FP) (CBR)
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

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2264
nop
RET2264:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P2265: !DWST [8] (maybe <- 0x200000f) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 256 ] 
add   %l4, 1, %l4

P2266: !BST [14] (maybe <- 0x41800064) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P2267: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P2268: !ST [1] (maybe <- 0x2000010) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P2269: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P2270: !CAS [12] (maybe <- 0x2000011) (Int)
add %i3, 0, %o5
lduw [%o5], %l6
mov %l6, %l7
! move %l7(lower) -> %o2(lower)
or %l7, %o2, %o2
mov %l4, %o3
cas [%o5], %l7, %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P2271: !REPLACEMENT [7] (Int)
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

P2272: !BST [8] (maybe <- 0x41800065) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P2273: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P2274: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P2275: !BST [9] (maybe <- 0x41800066) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P2276: !BST [6] (maybe <- 0x41800067) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2277: !BST [13] (maybe <- 0x4180006a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P2278: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P2279: !ST [6] (maybe <- 0x2000012) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P2280: !BST [1] (maybe <- 0x4180006b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2281: !BLD [6] (FP)
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

P2282: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P2283: !BLD [3] (FP)
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

P2284: !BLD [0] (FP)
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

P2285: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P2286: !BLD [2] (FP)
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

P2287: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P2288: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P2289: !BST [9] (maybe <- 0x4180006f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P2290: !REPLACEMENT [11] (Int) (Branch target of P2533)
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
ba P2291
nop

TARGET2533:
ba RET2533
nop


P2291: !BST [9] (maybe <- 0x41800070) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P2292: !DWLD [4] (Int)
ldx [%i0 + 64], %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %l3
or %l3, %o3, %o3

P2293: !ST [12] (maybe <- 0x2000013) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P2294: !BST [6] (maybe <- 0x41800071) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2295: !MEMBAR (Int)
membar #StoreLoad

P2296: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P2297: !BST [4] (maybe <- 0x41800074) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P2298: !BST [6] (maybe <- 0x41800075) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
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
be,pn  %xcc, TARGET2298
nop
RET2298:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P2299: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P2300: !BLD [0] (FP)
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

P2301: !REPLACEMENT [7] (Int)
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

P2302: !BST [0] (maybe <- 0x41800078) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2303: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P2304: !BLD [3] (FP)
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

P2305: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P2306: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P2307: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P2308: !LD [14] (Int)
lduw [%i3 + 128], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P2309: !BLD [1] (FP)
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

P2310: !BLD [1] (FP)
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

P2311: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P2312: !BLD [2] (FP)
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

P2313: !BLD [3] (FP)
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

P2314: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P2315: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P2316: !BLD [0] (FP)
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

P2317: !BST [15] (maybe <- 0x4180007c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P2318: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P2319: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P2320: !SWAP [4] (maybe <- 0x2000014) (Int)
mov %l4, %l3
swap  [%i0 + 64], %l3
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

P2321: !BLD [2] (FP)
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

P2322: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P2323: !BST [9] (maybe <- 0x4180007d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P2324: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f0
membar #Sync 
! 1 addresses covered

P2325: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P2326: !BST [10] (maybe <- 0x4180007e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P2327: !BLD [9] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2327
nop
RET2327:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P2328: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P2329: !PREFETCH [8] (Int) (Branch target of P2417)
prefetch [%i1 + 256], 1
ba P2330
nop

TARGET2417:
ba RET2417
nop


P2330: !BST [12] (maybe <- 0x4180007f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P2331: !BLD [1] (FP)
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

P2332: !BST [5] (maybe <- 0x41800080) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2333: !BST [3] (maybe <- 0x41800083) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2334: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P2335: !BLD [2] (FP)
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

P2336: !BST [3] (maybe <- 0x41800087) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2337: !BST [15] (maybe <- 0x4180008b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P2338: !CAS [12] (maybe <- 0x2000015) (Int) (CBR)
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

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2338
nop
RET2338:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P2339: !BST [1] (maybe <- 0x4180008c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2340: !DWST [5] (maybe <- 0x2000016) (Int)
mov %l4, %o5 
stx %o5, [%i1 + 72]
add   %l4, 1, %l4

P2341: !ST [8] (maybe <- 0x41800090) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i1 + 256 ]

P2342: !BLD [3] (FP)
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

P2343: !BLD [6] (FP)
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

P2344: !BST [4] (maybe <- 0x41800091) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P2345: !LD [10] (Int) (Branch target of P2409)
lduw [%i2 + 32], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
ba P2346
nop

TARGET2409:
ba RET2409
nop


P2346: !BST [3] (maybe <- 0x41800092) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2347: !BST [1] (maybe <- 0x41800096) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2348: !PREFETCH [14] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i3 + 128] %asi, 1

P2349: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P2350: !BST [1] (maybe <- 0x4180009a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2351: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P2352: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P2353: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P2354: !BLD [6] (FP)
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

P2355: !BST [15] (maybe <- 0x4180009e) (FP) (CBR) (Branch target of P2119)
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
be,pt  %xcc, TARGET2355
nop
RET2355:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0

ba P2356
nop

TARGET2119:
ba RET2119
nop


P2356: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P2357: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P2358: !REPLACEMENT [8] (Int)
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

P2359: !DWLD [13] (Int) (LE)
wr %g0, 0x88, %asi
ldxa [%i3 + 64] %asi, %o5
! move %o5(lower) -> %o1(lower)
srl %o5, 0, %l7
or %l7, %o1, %o1

P2360: !BST [8] (maybe <- 0x4180009f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P2361: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P2362: !BST [13] (maybe <- 0x418000a0) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P2363: !BLD [0] (FP)
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

P2364: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P2365: !BST [11] (maybe <- 0x418000a1) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P2366: !BLD [3] (FP)
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

P2367: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P2368: !ST [15] (maybe <- 0x2000017) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P2369: !BST [0] (maybe <- 0x418000a2) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2370: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P2371: !LD [14] (FP)
ld [%i3 + 128], %f14
! 1 addresses covered

P2372: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P2373: !DWLD [8] (Int)
ldx [%i1 + 256], %o2
! move %o2(upper) -> %o2(upper)

P2374: !MEMBAR (Int) (Branch target of P2559)
membar #StoreLoad
ba P2375
nop

TARGET2559:
ba RET2559
nop


P2375: !DWST [0] (maybe <- 0x418000a6) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=21 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
std %f20, [%i0 + 0]

P2376: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P2377: !BLD [14] (FP)
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

P2378: !PREFETCH [15] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i3 + 192] %asi, 1

P2379: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f0
membar #Sync 
! 3 addresses covered
fmovs %f3, %f0
fmovs %f4, %f1
fmovs %f5, %f2

P2380: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P2381: !BST [6] (maybe <- 0x418000a8) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2382: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P2383: !BLD [7] (FP)
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

P2384: !DWST [3] (maybe <- 0x2000018) (Int) (CBR)
mov %l4, %o5 
sllx %o5, 32, %o5 
stx %o5, [%i0 + 32 ] 
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2384
nop
RET2384:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P2385: !CAS [4] (maybe <- 0x2000019) (Int)
add %i0, 64, %l3
lduw [%l3], %l7
mov %l7, %o5
! move %o5(lower) -> %o2(lower)
srlx %o2, 32, %o2
sllx %o2, 32, %o2
or %o5, %o2, %o2
mov %l4, %o3
cas [%l3], %o5, %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P2386: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P2387: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P2388: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f7

P2389: !ST [8] (maybe <- 0x200001a) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P2390: !BLD [1] (FP)
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

P2391: !ST [10] (maybe <- 0x418000ab) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i2 + 32 ]

P2392: !BST [1] (maybe <- 0x418000ac) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2393: !BST [12] (maybe <- 0x418000b0) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P2394: !ST [2] (maybe <- 0x418000b1) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i0 + 12 ]

P2395: !ST [11] (maybe <- 0x200001b) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P2396: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P2397: !DWLD [9] (Int)
ldx [%i1 + 512], %l7
! move %l7(upper) -> %o3(lower)
srlx %l7, 32, %l6
or %l6, %o3, %o3

P2398: !BST [15] (maybe <- 0x418000b2) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P2399: !CAS [0] (maybe <- 0x200001c) (Int)
add %i0, 0, %o5
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

P2400: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P2401: !BST [13] (maybe <- 0x418000b3) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P2402: !BST [9] (maybe <- 0x418000b4) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P2403: !PREFETCH [1] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i0 + 4] %asi, 1

P2404: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P2405: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P2406: !BLD [3] (FP)
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

P2407: !BST [13] (maybe <- 0x418000b5) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P2408: !BST [3] (maybe <- 0x418000b6) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2409: !LD [10] (Int) (CBR)
lduw [%i2 + 32], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2409
nop
RET2409:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P2410: !CAS [15] (maybe <- 0x200001d) (Int)
add %i3, 192, %l7
lduw [%l7], %l3
mov %l3, %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0
mov %l4, %o1
cas [%l7], %l6, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P2411: !REPLACEMENT [4] (Int)
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

P2412: !BST [9] (maybe <- 0x418000ba) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P2413: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P2414: !DWLD [14] (Int)
ldx [%i3 + 128], %l3
! move %l3(upper) -> %o1(lower)
srlx %l3, 32, %o5
or %o5, %o1, %o1

P2415: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P2416: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f36, %f2

P2417: !BST [13] (maybe <- 0x418000bb) (FP) (CBR)
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
be,pn  %xcc, TARGET2417
nop
RET2417:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P2418: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f4

P2419: !REPLACEMENT [1] (Int)
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

P2420: !DWST [1] (maybe <- 0x200001e) (Int)
sllx %l4, 32, %l3 
add   %l4, 1, %l4
or %l3, %l4, %l3
stx %l3, [%i0 + 0]
add   %l4, 1, %l4

P2421: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f5
fmovd %f36, %f6

P2422: !BST [2] (maybe <- 0x418000bc) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2423: !ST [10] (maybe <- 0x2000020) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P2424: !BLD [7] (FP)
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

P2425: !BLD [0] (FP)
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

P2426: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P2427: !BLD [3] (FP)
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

P2428: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P2429: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f3
fmovd %f36, %f4

P2430: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P2431: !BLD [5] (FP)
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

P2432: !BST [13] (maybe <- 0x418000c0) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P2433: !BLD [10] (FP) (Branch target of P2264)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f9
ba P2434
nop

TARGET2264:
ba RET2264
nop


P2434: !LD [7] (Int)
lduw [%i1 + 84], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P2435: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P2436: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P2437: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P2438: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f12

P2439: !BST [9] (maybe <- 0x418000c1) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P2440: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P2441: !LD [2] (Int)
lduw [%i0 + 12], %l7
! move %l7(lower) -> %o2(lower)
or %l7, %o2, %o2

P2442: !BST [8] (maybe <- 0x418000c2) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P2443: !CASX [7] (maybe <- 0x2000021) (Int) (LE)
sllx %l4, 32, %o5
add  %l4, 1, %l4
or   %l4, %o5, %o5
! Change double-word-level endianess (big endian <-> little endian) 
sethi %hi(0xff00ff00), %l7
or %l7, %lo(0xff00ff00), %l7
sllx %l7, 32, %l3
or %l7, %l3, %l7 
and %o5, %l7, %l3
srlx %l3, 8, %l3
sllx %o5, 8, %o5
and %o5, %l7, %o5
or %o5, %l3, %o5 
sethi %hi(0xffff0000), %l7
or %l7, %lo(0xffff0000), %l7
srlx %o5, 16, %l3
andn %l3, %l7, %l3
andn %o5, %l7, %o5
sllx %o5, 16, %o5
or %o5, %l3, %o5 
srlx %o5, 32, %l3
sllx %o5, 32, %o5
or %o5, %l3, %l3 
wr %g0, 0x88, %asi
add %i1, 80, %o5
ldxa [%o5] %asi, %l6
! move %l6(lower) -> %o3(upper)
sllx %l6, 32, %o3
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %l7
or %l7, %o3, %o3
mov %l6, %l7
mov  %l3, %l6
casxa [%o5] %asi, %l7, %l6
! move %l6(lower) -> %o4(upper)
sllx %l6, 32, %o4
! move %l6(upper) -> %o4(lower)
srlx %l6, 32, %o5
or %o5, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5
add  %l4, 1, %l4

P2444: !BST [4] (maybe <- 0x418000c3) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P2445: !BST [9] (maybe <- 0x418000c4) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P2446: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P2447: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P2448: !DWST [4] (maybe <- 0x2000023) (Int)
mov %l4, %l3 
sllx %l3, 32, %l3 
stx %l3, [%i0 + 64 ] 
add   %l4, 1, %l4

P2449: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P2450: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f14

P2451: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P2452: !ST [1] (maybe <- 0x2000024) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P2453: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P2454: !DWLD [10] (Int)
ldx [%i2 + 32], %o0
! move %o0(upper) -> %o0(upper)

P2455: !LD [14] (Int)
lduw [%i3 + 128], %l6
! move %l6(lower) -> %o0(lower)
srlx %o0, 32, %o0
sllx %o0, 32, %o0
or %l6, %o0, %o0

P2456: !REPLACEMENT [11] (Int)
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

P2457: !BLD [6] (FP)
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

P2458: !LD [13] (Int)
lduw [%i3 + 64], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P2459: !BST [14] (maybe <- 0x418000c5) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P2460: !PREFETCH [14] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i3 + 128] %asi, 1

P2461: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P2462: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P2463: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f3
fmovd %f36, %f4

P2464: !DWLD [10] (Int) (LE)
wr %g0, 0x88, %asi
ldxa [%i2 + 32] %asi, %o5
! move %o5(lower) -> %o1(lower)
srl %o5, 0, %l7
or %l7, %o1, %o1

P2465: !ST [13] (maybe <- 0x2000025) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P2466: !BST [6] (maybe <- 0x418000c6) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2467: !BST [7] (maybe <- 0x418000c9) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2468: !ST [8] (maybe <- 0x2000026) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P2469: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P2470: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P2471: !BST [5] (maybe <- 0x418000cc) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2472: !BST [1] (maybe <- 0x418000cf) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2473: !BST [11] (maybe <- 0x418000d3) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P2474: !BST [8] (maybe <- 0x418000d4) (FP) (Branch target of P2070)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 
ba P2475
nop

TARGET2070:
ba RET2070
nop


P2475: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f36, %f8

P2476: !BST [5] (maybe <- 0x418000d5) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2477: !BLD [6] (FP)
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

P2478: !DWLD [1] (Int)
ldx [%i0 + 0], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)

P2479: !CAS [4] (maybe <- 0x2000027) (Int) (Branch target of P2188)
add %i0, 64, %l7
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
ba P2480
nop

TARGET2188:
ba RET2188
nop


P2480: !BST [9] (maybe <- 0x418000d8) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P2481: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P2482: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P2483: !BLD [6] (FP)
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

P2484: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P2485: !DWLD [12] (FP)
ldd [%i3 + 0], %f2
! 1 addresses covered

P2486: !BST [6] (maybe <- 0x418000d9) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2487: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P2488: !BST [10] (maybe <- 0x418000dc) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P2489: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P2490: !REPLACEMENT [8] (Int)
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

P2491: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P2492: !DWST [14] (maybe <- 0x2000028) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 128 ] 
add   %l4, 1, %l4

P2493: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P2494: !BST [9] (maybe <- 0x418000dd) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P2495: !BLD [3] (FP) (CBR)
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
be,pn  %xcc, TARGET2495
nop
RET2495:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P2496: !BST [4] (maybe <- 0x418000de) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P2497: !BST [0] (maybe <- 0x418000df) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2498: !BLD [8] (FP) (Branch target of P2158)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8
ba P2499
nop

TARGET2158:
ba RET2158
nop


P2499: !BLD [4] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2499
nop
RET2499:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P2500: !BLD [1] (FP)
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

P2501: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P2502: !BST [8] (maybe <- 0x418000e3) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P2503: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P2504: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P2505: !BST [10] (maybe <- 0x418000e4) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P2506: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P2507: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P2508: !BST [4] (maybe <- 0x418000e5) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P2509: !BLD [0] (FP) (Branch target of P2221)
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
ba P2510
nop

TARGET2221:
ba RET2221
nop


P2510: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f3

P2511: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P2512: !DWST [4] (maybe <- 0x2000029) (Int)
mov %l4, %l3 
sllx %l3, 32, %l3 
stx %l3, [%i0 + 64 ] 
add   %l4, 1, %l4

P2513: !BST [3] (maybe <- 0x418000e6) (FP) (Branch target of P2495)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 
ba P2514
nop

TARGET2495:
ba RET2495
nop


P2514: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P2515: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P2516: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P2517: !ST [15] (maybe <- 0x200002a) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P2518: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P2519: !BST [6] (maybe <- 0x418000ea) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2520: !DWST [11] (maybe <- 0x200002b) (Int)
mov %l4, %l3 
sllx %l3, 32, %l3 
stx %l3, [%i2 + 64 ] 
add   %l4, 1, %l4

P2521: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P2522: !BST [5] (maybe <- 0x418000ed) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2523: !BST [14] (maybe <- 0x418000f0) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P2524: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P2525: !BST [3] (maybe <- 0x418000f1) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2526: !BST [15] (maybe <- 0x418000f5) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P2527: !BST [15] (maybe <- 0x418000f6) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P2528: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f36, %f8

P2529: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P2530: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P2531: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P2532: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P2533: !DWST [15] (maybe <- 0x200002c) (Int) (CBR)
mov %l4, %l7 
sllx %l7, 32, %l7 
stx %l7, [%i3 + 192 ] 
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2533
nop
RET2533:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P2534: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P2535: !LD [10] (Int)
lduw [%i2 + 32], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P2536: !BST [5] (maybe <- 0x418000f7) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2537: !BST [10] (maybe <- 0x418000fa) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P2538: !DWST [15] (maybe <- 0x200002d) (Int)
mov %l4, %l7 
sllx %l7, 32, %l7 
stx %l7, [%i3 + 192 ] 
add   %l4, 1, %l4

P2539: !CASX [6] (maybe <- 0x200002e) (Int)
add %i1, 80, %l7
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
mov %l3, %l6
sllx %l4, 32, %l3
add  %l4, 1, %l4
or   %l4, %l3, %l3
casx [%l7], %l6, %l3
! move %l3(upper) -> %o0(lower)
srlx %l3, 32, %l7
or %l7, %o0, %o0
! move %l3(lower) -> %o1(upper)
sllx %l3, 32, %o1
add  %l4, 1, %l4

P2540: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P2541: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P2542: !BLD [3] (FP)
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

P2543: !BST [0] (maybe <- 0x418000fb) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2544: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P2545: !BST [9] (maybe <- 0x418000ff) (FP) (CBR)
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
be,pt  %xcc, TARGET2545
nop
RET2545:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P2546: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P2547: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P2548: !BLD [2] (FP)
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

P2549: !BST [2] (maybe <- 0x41800100) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2550: !BST [0] (maybe <- 0x41800104) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2551: !BLD [4] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2551
nop
RET2551:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P2552: !LD [13] (Int)
lduw [%i3 + 64], %l3
! move %l3(lower) -> %o1(lower)
or %l3, %o1, %o1

P2553: !DWLD [8] (Int)
ldx [%i1 + 256], %o2
! move %o2(upper) -> %o2(upper)

P2554: !BST [0] (maybe <- 0x41800108) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2555: !DWST [11] (maybe <- 0x4180010c) (FP) (Branch target of P2499)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
std %f20, [%i2 + 64]
ba P2556
nop

TARGET2499:
ba RET2499
nop


P2556: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P2557: !BST [12] (maybe <- 0x4180010d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P2558: !BST [9] (maybe <- 0x4180010e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P2559: !ST [5] (maybe <- 0x2000030) (Int) (CBR)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2559
nop
RET2559:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P2560: !BLD [2] (FP)
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

P2561: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P2562: !BST [1] (maybe <- 0x4180010f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2563: !BLD [7] (FP)
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

P2564: !REPLACEMENT [2] (Int)
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

P2565: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P2566: !BST [5] (maybe <- 0x41800113) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2567: !MEMBAR (Int)
membar #StoreLoad

P2568: !BLD [7] (FP)
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

P2569: !MEMBAR (Int)
membar #StoreLoad

P2570: !LD [0] (Int)
lduw [%i0 + 0], %l6
! move %l6(lower) -> %o2(lower)
srlx %o2, 32, %o2
sllx %o2, 32, %o2
or %l6, %o2, %o2

P2571: !LD [1] (Int)
lduw [%i0 + 4], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P2572: !LD [2] (Int)
lduw [%i0 + 12], %l6
! move %l6(lower) -> %o3(lower)
or %l6, %o3, %o3

P2573: !LD [3] (Int)
lduw [%i0 + 32], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P2574: !LD [4] (FP)
ld [%i0 + 64], %f2
! 1 addresses covered

P2575: !LD [5] (Int)
lduw [%i1 + 76], %l6
! move %l6(lower) -> %o4(lower)
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P2576: !LD [6] (FP)
ld [%i1 + 80], %f3
! 1 addresses covered

P2577: !LD [7] (Int)
lduw [%i1 + 84], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P2578: !LD [8] (Int)
lduw [%i1 + 256], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

P2579: !LD [9] (Int)
lduw [%i1 + 512], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P2580: !LD [10] (Int) (CBR)
lduw [%i2 + 32], %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2580
nop
RET2580:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P2581: !LD [11] (Int)
lduw [%i2 + 64], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P2582: !LD [12] (Int)
lduw [%i3 + 0], %l7
! move %l7(lower) -> %o2(lower)
or %l7, %o2, %o2

P2583: !LD [13] (Int)
lduw [%i3 + 64], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P2584: !LD [14] (Int)
lduw [%i3 + 128], %l7
! move %l7(lower) -> %o3(lower)
or %l7, %o3, %o3

P2585: !LD [15] (Int)
lduw [%i3 + 192], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

END_NODES4: ! Test istream for CPU 4 ends
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
ld [%i5], %f4
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30
fmovd %f2, %f30
fmovd %f4, %f30

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
sethi %hi(0x05deade1), %l3
or    %l3, %lo(0x05deade1), %l3
stw %l3, [%i5] 
ld [%i5], %f16

! Initialize running integer counter in register %l4
sethi %hi(0x2800001), %l4
or    %l4, %lo(0x2800001), %l4

! Initialize running FP counter in register %f16
sethi %hi(0x42000001), %l3
or    %l3, %lo(0x42000001), %l3
stw %l3, [%i5] 
ld [%i5], %f16

! Initialize FP counter increment value in register %f17 (constant)
sethi %hi(0x36800000), %l3
or    %l3, %lo(0x36800000), %l3
stw %l3, [%i5] 
ld [%i5], %f17 

! Initialize LFSR to 0x4ee^4
sethi %hi(0x4ee), %l0
or    %l0, %lo(0x4ee), %l0
mulx  %l0, %l0, %l0
mulx  %l0, %l0, %l0

!-- init shared addrs 10 to 11 ---
stx %g0, [%i2+32]
stx %g0, [%i2+64]

! use untouched cache-line (offset 4K) in replacement area for sync
sub %i1, %i0, %l6
add %i3, %l6, %l6
sub %l6, -4096, %l6

!-- begin of sync_init ---
or %g0, 1, %l7
or %g0, %l7, %o5
swap [%l6+4], %o5
membar #Sync
sync_init_1_5:
brnz,pt %l7, sync_init_1_5
lduw [%l6+4], %l7 ! delay slot
sync_init_2_5:
lduw [%l6], %l7
sub %l7, 1, %o5
cas [%l6], %l7, %o5
cmp %l7, %o5
bne,pt %xcc, sync_init_2_5
nop
membar #Sync
sync_init_3_5:
lduw [%l6], %l7 ! delay slot
brnz,pt %l7, sync_init_3_5
nop
!-- end of sync_init ---


BEGIN_NODES5: ! Test istream for CPU 5 begins

P2586: !BST [3] (maybe <- 0x42000001) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2587: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P2588: !BST [2] (maybe <- 0x42000005) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2589: !PREFETCH [14] (Int) (CBR)
prefetch [%i3 + 128], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2589
nop
RET2589:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P2590: !BST [6] (maybe <- 0x42000009) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2591: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f0
membar #Sync 
! 1 addresses covered

P2592: !BST [8] (maybe <- 0x4200000c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P2593: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P2594: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P2595: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f36, %f2

P2596: !BLD [6] (FP)
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

P2597: !BST [1] (maybe <- 0x4200000d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2598: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P2599: !BST [10] (maybe <- 0x42000011) (FP) (CBR)
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
be,pn  %xcc, TARGET2599
nop
RET2599:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P2600: !PREFETCH [13] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i3 + 64] %asi, 1

P2601: !BST [13] (maybe <- 0x42000012) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P2602: !BLD [10] (FP) (Branch target of P2608)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f8
ba P2603
nop

TARGET2608:
ba RET2608
nop


P2603: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P2604: !BLD [0] (FP)
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

P2605: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P2606: !MEMBAR (Int)
membar #StoreLoad

P2607: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P2608: !BLD [8] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2608
nop
RET2608:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P2609: !DWST [1] (maybe <- 0x2800001) (Int)
sllx %l4, 32, %l3 
add   %l4, 1, %l4
or %l3, %l4, %l3
stx %l3, [%i0 + 0]
add   %l4, 1, %l4

P2610: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P2611: !BLD [13] (FP)
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

P2612: !BST [15] (maybe <- 0x42000013) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P2613: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f0
membar #Sync 
! 1 addresses covered
fmovd %f8, %f0

P2614: !MEMBAR (Int)
membar #StoreLoad

P2615: !MEMBAR (Int)
membar #StoreLoad

P2616: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f36, %f2

P2617: !BST [14] (maybe <- 0x42000014) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P2618: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P2619: !BST [6] (maybe <- 0x42000015) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2620: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P2621: !BLD [10] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f5

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2621
nop
RET2621:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P2622: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P2623: !BST [15] (maybe <- 0x42000018) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P2624: !DWST [9] (maybe <- 0x2800003) (Int)
mov %l4, %l3 
sllx %l3, 32, %l3 
stx %l3, [%i1 + 512 ] 
add   %l4, 1, %l4

P2625: !BST [8] (maybe <- 0x42000019) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P2626: !BST [4] (maybe <- 0x4200001a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P2627: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P2628: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P2629: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P2630: !DWST [1] (maybe <- 0x2800004) (Int)
sllx %l4, 32, %l6 
add   %l4, 1, %l4
or %l6, %l4, %l6
stx %l6, [%i0 + 0]
add   %l4, 1, %l4

P2631: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P2632: !BLD [0] (FP)
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

P2633: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P2634: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P2635: !PREFETCH [3] (Int) (CBR)
prefetch [%i0 + 32], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2635
nop
RET2635:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P2636: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P2637: !BLD [5] (FP)
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

P2638: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P2639: !CASX [4] (maybe <- 0x2800006) (Int)
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

P2640: !BLD [0] (FP)
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

P2641: !BST [1] (maybe <- 0x4200001b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2642: !BST [4] (maybe <- 0x4200001f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P2643: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P2644: !BST [13] (maybe <- 0x42000020) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P2645: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P2646: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P2647: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P2648: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P2649: !BST [14] (maybe <- 0x42000021) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P2650: !BST [13] (maybe <- 0x42000022) (FP) (CBR)
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
be,pn  %xcc, TARGET2650
nop
RET2650:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P2651: !REPLACEMENT [2] (Int)
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

P2652: !BST [8] (maybe <- 0x42000023) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P2653: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P2654: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f7

P2655: !PREFETCH [15] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i3 + 192] %asi, 1

P2656: !LD [14] (Int)
lduw [%i3 + 128], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P2657: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f8

P2658: !PREFETCH [11] (Int) (Branch target of P3071)
prefetch [%i2 + 64], 1
ba P2659
nop

TARGET3071:
ba RET3071
nop


P2659: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P2660: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P2661: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P2662: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P2663: !DWST [14] (maybe <- 0x2800007) (Int) (LE)
wr %g0, 0x88, %asi
! Change single-word-level endianess (big endian <-> little endian) 
sethi %hi(0xff00ff00), %l6
or %l6, %lo(0xff00ff00), %l6
and %l4, %l6, %o5
srl %o5, 8, %o5
sll %l4, 8, %l7
and %l7, %l6, %l7
or %l7, %o5, %l7
srl %l7, 16, %o5
sll %l7, 16, %l7
srl %l7, 0, %l7
or %l7, %o5, %l7
stxa %l7, [%i3 + 128 ] %asi
add   %l4, 1, %l4

P2664: !BST [0] (maybe <- 0x42000024) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2665: !BST [4] (maybe <- 0x42000028) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P2666: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P2667: !BST [4] (maybe <- 0x42000029) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P2668: !BST [2] (maybe <- 0x4200002a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2669: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P2670: !CAS [6] (maybe <- 0x2800008) (Int)
add %i1, 80, %l6
lduw [%l6], %o5
mov %o5, %l3
! move %l3(lower) -> %o2(lower)
or %l3, %o2, %o2
mov %l4, %o3
cas [%l6], %l3, %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P2671: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P2672: !ST [10] (maybe <- 0x2800009) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P2673: !DWST [11] (maybe <- 0x280000a) (Int)
mov %l4, %o5 
sllx %o5, 32, %o5 
stx %o5, [%i2 + 64 ] 
add   %l4, 1, %l4

P2674: !BST [7] (maybe <- 0x4200002e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2675: !BST [0] (maybe <- 0x42000031) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2676: !PREFETCH [15] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i3 + 192] %asi, 1

P2677: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P2678: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P2679: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P2680: !BLD [3] (FP)
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

P2681: !BST [9] (maybe <- 0x42000035) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P2682: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P2683: !BST [6] (maybe <- 0x42000036) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2684: !BLD [15] (FP)
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

P2685: !BST [2] (maybe <- 0x42000039) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2686: !BST [10] (maybe <- 0x4200003d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P2687: !BST [0] (maybe <- 0x4200003e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2688: !BLD [2] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f0
membar #Sync 
! 4 addresses covered
fmovs %f3, %f2
fmovs %f8, %f3

P2689: !BST [15] (maybe <- 0x42000042) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P2690: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P2691: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P2692: !ST [8] (maybe <- 0x280000b) (Int) (LE)
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
stwa   %l7, [%i1 + 256] %asi
add   %l4, 1, %l4

P2693: !BST [7] (maybe <- 0x42000043) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2694: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P2695: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P2696: !BST [9] (maybe <- 0x42000046) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P2697: !DWLD [8] (Int)
ldx [%i1 + 256], %l3
! move %l3(upper) -> %o3(lower)
srlx %l3, 32, %o5
or %o5, %o3, %o3

P2698: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P2699: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f5
fmovd %f36, %f6

P2700: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P2701: !ST [11] (maybe <- 0x280000c) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P2702: !PREFETCH [2] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i0 + 12] %asi, 1

P2703: !BST [7] (maybe <- 0x42000047) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2704: !BST [10] (maybe <- 0x4200004a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P2705: !BST [7] (maybe <- 0x4200004b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2706: !BST [9] (maybe <- 0x4200004e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P2707: !BST [12] (maybe <- 0x4200004f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P2708: !ST [9] (maybe <- 0x280000d) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P2709: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P2710: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P2711: !REPLACEMENT [10] (Int)
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

P2712: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P2713: !BST [0] (maybe <- 0x42000050) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2714: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P2715: !BST [8] (maybe <- 0x42000054) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P2716: !REPLACEMENT [15] (Int) (Branch target of P2872)
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
ba P2717
nop

TARGET2872:
ba RET2872
nop


P2717: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P2718: !BST [2] (maybe <- 0x42000055) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2719: !BLD [1] (FP)
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

P2720: !BLD [1] (FP)
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

P2721: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P2722: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P2723: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P2724: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P2725: !BLD [2] (FP)
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

P2726: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f7

P2727: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P2728: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P2729: !DWST [8] (maybe <- 0x280000e) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 256 ] 
add   %l4, 1, %l4

P2730: !BST [2] (maybe <- 0x42000059) (FP) (Branch target of P2847)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 
ba P2731
nop

TARGET2847:
ba RET2847
nop


P2731: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P2732: !BLD [1] (FP)
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

P2733: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P2734: !BLD [13] (FP)
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

P2735: !MEMBAR (Int)
membar #StoreLoad

P2736: !BLD [2] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f0
membar #Sync 
! 4 addresses covered
fmovs %f3, %f2
fmovs %f8, %f3

P2737: !BST [11] (maybe <- 0x4200005d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P2738: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P2739: !BLD [7] (FP)
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

P2740: !BST [3] (maybe <- 0x4200005e) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
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
be,pn  %xcc, TARGET2740
nop
RET2740:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P2741: !BLD [2] (FP) (Branch target of P2800)
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
ba P2742
nop

TARGET2800:
ba RET2800
nop


P2742: !BLD [3] (FP)
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

P2743: !BLD [5] (FP)
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

P2744: !LD [2] (Int)
lduw [%i0 + 12], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P2745: !BLD [3] (FP)
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

P2746: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P2747: !BST [2] (maybe <- 0x42000062) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
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
be,pn  %xcc, TARGET2747
nop
RET2747:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P2748: !DWLD [5] (Int)
ldx [%i1 + 72], %l6
! move %l6(lower) -> %o4(lower)
srl %l6, 0, %l3
or %l3, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P2749: !BLD [1] (FP)
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

P2750: !ST [5] (maybe <- 0x280000f) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P2751: !BST [2] (maybe <- 0x42000066) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2752: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P2753: !BST [13] (maybe <- 0x4200006a) (FP) (Branch target of P2903)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 
ba P2754
nop

TARGET2903:
ba RET2903
nop


P2754: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P2755: !PREFETCH [3] (Int) (Branch target of P2931)
prefetch [%i0 + 32], 1
ba P2756
nop

TARGET2931:
ba RET2931
nop


P2756: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P2757: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P2758: !BST [7] (maybe <- 0x4200006b) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
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
be,pn  %xcc, TARGET2758
nop
RET2758:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P2759: !BST [1] (maybe <- 0x4200006e) (FP) (Branch target of P3084)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 
ba P2760
nop

TARGET3084:
ba RET3084
nop


P2760: !BST [9] (maybe <- 0x42000072) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P2761: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P2762: !BST [15] (maybe <- 0x42000073) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P2763: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P2764: !BST [7] (maybe <- 0x42000074) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2765: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P2766: !BST [13] (maybe <- 0x42000077) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P2767: !DWST [14] (maybe <- 0x2800010) (Int)
mov %l4, %l7 
sllx %l7, 32, %l7 
stx %l7, [%i3 + 128 ] 
add   %l4, 1, %l4

P2768: !BST [10] (maybe <- 0x42000078) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P2769: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P2770: !BLD [3] (FP)
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

P2771: !PREFETCH [14] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i3 + 128] %asi, 1

P2772: !BST [7] (maybe <- 0x42000079) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2773: !BST [7] (maybe <- 0x4200007c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2774: !CASX [14] (maybe <- 0x2800011) (Int)
add %i3, 128, %o5
ldx [%o5], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l7
sllx %l4, 32, %o1
casx [%o5], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P2775: !BST [2] (maybe <- 0x4200007f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2776: !ST [6] (maybe <- 0x2800012) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P2777: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P2778: !BLD [3] (FP)
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

P2779: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P2780: !BST [1] (maybe <- 0x42000083) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2781: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f5
fmovd %f36, %f6

P2782: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P2783: !BST [4] (maybe <- 0x42000087) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P2784: !BST [5] (maybe <- 0x42000088) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2785: !PREFETCH [9] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i1 + 512] %asi, 1

P2786: !BLD [1] (FP)
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

P2787: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P2788: !REPLACEMENT [14] (Int)
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

P2789: !DWLD [12] (Int)
ldx [%i3 + 0], %o2
! move %o2(upper) -> %o2(upper)

P2790: !BLD [5] (FP) (CBR)
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

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2790
nop
RET2790:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P2791: !REPLACEMENT [13] (Int)
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

P2792: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P2793: !BST [11] (maybe <- 0x4200008b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P2794: !SWAP [4] (maybe <- 0x2800013) (Int)
mov %l4, %o5
swap  [%i0 + 64], %o5
! move %o5(lower) -> %o2(lower)
srlx %o2, 32, %o2
sllx %o2, 32, %o2
srl %o5, 0, %l6
or %l6, %o2, %o2
add   %l4, 1, %l4

P2795: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P2796: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P2797: !BST [2] (maybe <- 0x4200008c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2798: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P2799: !PREFETCH [3] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i0 + 32] %asi, 1

P2800: !BLD [14] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2800
nop
RET2800:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P2801: !REPLACEMENT [12] (Int)
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

P2802: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P2803: !BST [11] (maybe <- 0x42000090) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P2804: !BST [10] (maybe <- 0x42000091) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P2805: !BST [7] (maybe <- 0x42000092) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2806: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f5
fmovd %f36, %f6

P2807: !BST [4] (maybe <- 0x42000095) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P2808: !LD [15] (Int)
lduw [%i3 + 192], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P2809: !ST [2] (maybe <- 0x2800014) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P2810: !DWST [7] (maybe <- 0x2800015) (Int)
sllx %l4, 32, %l3 
add   %l4, 1, %l4
or %l3, %l4, %l3
stx %l3, [%i1 + 80]
add   %l4, 1, %l4

P2811: !ST [13] (maybe <- 0x2800017) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P2812: !BST [2] (maybe <- 0x42000096) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2813: !BST [12] (maybe <- 0x4200009a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P2814: !BST [7] (maybe <- 0x4200009b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2815: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P2816: !BST [0] (maybe <- 0x4200009e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2817: !BST [10] (maybe <- 0x420000a2) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P2818: !BST [9] (maybe <- 0x420000a3) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P2819: !CASX [10] (maybe <- 0x2800018) (Int)
add %i2, 32, %l6
ldx [%l6], %o5
! move %o5(upper) -> %o3(lower)
srlx %o5, 32, %l3
or %l3, %o3, %o3
! move %o5(lower) -> %o4(upper)
sllx %o5, 32, %o4
mov  %o5, %l3
sllx %l4, 32, %o5
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

P2820: !BLD [3] (FP) (CBR)
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
be,pt  %xcc, TARGET2820
nop
RET2820:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P2821: !MEMBAR (Int)
membar #StoreLoad

P2822: !BST [15] (maybe <- 0x420000a4) (FP) (Branch target of P2758)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 
ba P2823
nop

TARGET2758:
ba RET2758
nop


P2823: !PREFETCH [10] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i2 + 32] %asi, 1

P2824: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f12

P2825: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P2826: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P2827: !BLD [0] (FP)
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

P2828: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P2829: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P2830: !SWAP [0] (maybe <- 0x2800019) (Int)
mov %l4, %l7
swap  [%i0 + 0], %l7
! move %l7(lower) -> %o0(lower)
srl %l7, 0, %l3
or %l3, %o0, %o0
add   %l4, 1, %l4

P2831: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P2832: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P2833: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P2834: !LD [8] (FP)
ld [%i1 + 256], %f2
! 1 addresses covered

P2835: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P2836: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P2837: !BLD [0] (FP)
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

P2838: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P2839: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f7

P2840: !LD [10] (Int)
lduw [%i2 + 32], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P2841: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P2842: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P2843: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P2844: !PREFETCH [12] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i3 + 0] %asi, 1

P2845: !ST [15] (maybe <- 0x280001a) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P2846: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P2847: !BLD [4] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2847
nop
RET2847:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P2848: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P2849: !BST [0] (maybe <- 0x420000a5) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2850: !BLD [2] (FP)
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

P2851: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P2852: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P2853: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P2854: !LD [8] (Int) (Branch target of P2635)
lduw [%i1 + 256], %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1
ba P2855
nop

TARGET2635:
ba RET2635
nop


P2855: !BST [15] (maybe <- 0x420000a9) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P2856: !ST [9] (maybe <- 0x280001b) (Int) (LE)
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
stwa   %l6, [%i1 + 512] %asi
add   %l4, 1, %l4

P2857: !ST [9] (maybe <- 0x280001c) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P2858: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P2859: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P2860: !BST [5] (maybe <- 0x420000aa) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2861: !ST [3] (maybe <- 0x280001d) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P2862: !BST [2] (maybe <- 0x420000ad) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2863: !BST [8] (maybe <- 0x420000b1) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P2864: !BST [8] (maybe <- 0x420000b2) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P2865: !BLD [2] (FP)
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

P2866: !CASX [11] (maybe <- 0x280001e) (Int)
add %i2, 64, %o5
ldx [%o5], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov  %o2, %l7
sllx %l4, 32, %o3
casx [%o5], %l7, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4

P2867: !BST [0] (maybe <- 0x420000b3) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2868: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P2869: !BST [2] (maybe <- 0x420000b7) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2870: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f3
fmovd %f36, %f4

P2871: !BST [0] (maybe <- 0x420000bb) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2872: !BST [4] (maybe <- 0x420000bf) (FP) (CBR)
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
be,pt  %xcc, TARGET2872
nop
RET2872:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P2873: !BLD [7] (FP)
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

P2874: !BST [3] (maybe <- 0x420000c0) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2875: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P2876: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P2877: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P2878: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P2879: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P2880: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P2881: !CAS [8] (maybe <- 0x280001f) (Int) (Branch target of P2747)
add %i1, 256, %o5
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
ba P2882
nop

TARGET2747:
ba RET2747
nop


P2882: !BST [7] (maybe <- 0x420000c4) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2883: !BLD [12] (FP) (Branch target of P2650)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11
ba P2884
nop

TARGET2650:
ba RET2650
nop


P2884: !DWST [3] (maybe <- 0x2800020) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i0 + 32 ] 
add   %l4, 1, %l4

P2885: !DWST [6] (maybe <- 0x2800021) (Int)
sllx %l4, 32, %l3 
add   %l4, 1, %l4
or %l3, %l4, %l3
stx %l3, [%i1 + 80]
add   %l4, 1, %l4

P2886: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P2887: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P2888: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P2889: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P2890: !PREFETCH [2] (Int) (Branch target of P2589)
prefetch [%i0 + 12], 1
ba P2891
nop

TARGET2589:
ba RET2589
nop


P2891: !BST [1] (maybe <- 0x420000c7) (FP) (Branch target of P2790)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 
ba P2892
nop

TARGET2790:
ba RET2790
nop


P2892: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P2893: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P2894: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P2895: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P2896: !LD [2] (Int)
lduw [%i0 + 12], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P2897: !BST [3] (maybe <- 0x420000cb) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2898: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P2899: !BST [3] (maybe <- 0x420000cf) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2900: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P2901: !BLD [7] (FP)
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

P2902: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f1

P2903: !BST [6] (maybe <- 0x420000d3) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
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
be,pn  %xcc, TARGET2903
nop
RET2903:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P2904: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P2905: !BST [11] (maybe <- 0x420000d6) (FP) (CBR)
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
be,pt  %xcc, TARGET2905
nop
RET2905:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P2906: !BLD [0] (FP)
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

P2907: !BST [4] (maybe <- 0x420000d7) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P2908: !CAS [5] (maybe <- 0x2800023) (Int)
add %i1, 76, %l7
lduw [%l7], %l3
mov %l3, %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0
mov %l4, %o1
cas [%l7], %l6, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P2909: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P2910: !BLD [0] (FP)
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

P2911: !DWST [15] (maybe <- 0x2800024) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 192 ] 
add   %l4, 1, %l4

P2912: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P2913: !BST [6] (maybe <- 0x420000d8) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2914: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P2915: !BST [12] (maybe <- 0x420000db) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P2916: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P2917: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P2918: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P2919: !LD [11] (Int)
lduw [%i2 + 64], %o5
! move %o5(lower) -> %o1(lower)
or %o5, %o1, %o1

P2920: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P2921: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P2922: !BLD [6] (FP)
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

P2923: !REPLACEMENT [7] (Int)
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

P2924: !BLD [2] (FP)
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

P2925: !BST [0] (maybe <- 0x420000dc) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2926: !BST [7] (maybe <- 0x420000e0) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2927: !CAS [15] (maybe <- 0x2800025) (Int)
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

P2928: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P2929: !BST [8] (maybe <- 0x420000e3) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P2930: !LD [9] (Int)
lduw [%i1 + 512], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P2931: !BST [14] (maybe <- 0x420000e4) (FP) (CBR)
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
be,pn  %xcc, TARGET2931
nop
RET2931:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P2932: !BLD [3] (FP)
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

P2933: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P2934: !BST [7] (maybe <- 0x420000e5) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2935: !BLD [3] (FP)
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

P2936: !BLD [3] (FP)
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

P2937: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P2938: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P2939: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P2940: !PREFETCH [2] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i0 + 12] %asi, 1

P2941: !BST [4] (maybe <- 0x420000e8) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P2942: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f5
fmovd %f36, %f6

P2943: !LD [11] (FP)
ld [%i2 + 64], %f8
! 1 addresses covered

P2944: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P2945: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P2946: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P2947: !REPLACEMENT [1] (Int)
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

P2948: !BST [15] (maybe <- 0x420000e9) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P2949: !DWLD [15] (Int)
ldx [%i3 + 192], %o5
! move %o5(upper) -> %o3(lower)
srlx %o5, 32, %l7
or %l7, %o3, %o3

P2950: !BST [3] (maybe <- 0x420000ea) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2951: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f9
fmovd %f36, %f10

P2952: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f12

P2953: !BLD [5] (FP)
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

P2954: !BST [12] (maybe <- 0x420000ee) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P2955: !BLD [3] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f0
membar #Sync 
! 4 addresses covered
fmovs %f3, %f2
fmovs %f8, %f3

P2956: !BLD [7] (FP)
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

P2957: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P2958: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P2959: !BLD [15] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2959
nop
RET2959:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P2960: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P2961: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P2962: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P2963: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P2964: !BST [15] (maybe <- 0x420000ef) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P2965: !CASX [5] (maybe <- 0x2800026) (Int)
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

P2966: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f11
fmovd %f36, %f12

P2967: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P2968: !BLD [0] (FP)
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

P2969: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P2970: !BLD [0] (FP)
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

P2971: !BST [2] (maybe <- 0x420000f0) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2972: !BST [15] (maybe <- 0x420000f4) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P2973: !BST [11] (maybe <- 0x420000f5) (FP) (CBR)
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
be,pt  %xcc, TARGET2973
nop
RET2973:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P2974: !DWLD [1] (Int)
ldx [%i0 + 0], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)

P2975: !BST [4] (maybe <- 0x420000f6) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P2976: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P2977: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P2978: !BST [10] (maybe <- 0x420000f7) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P2979: !BST [9] (maybe <- 0x420000f8) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P2980: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P2981: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P2982: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P2983: !REPLACEMENT [14] (Int)
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

P2984: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P2985: !BST [15] (maybe <- 0x420000f9) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P2986: !BST [7] (maybe <- 0x420000fa) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2987: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P2988: !BST [15] (maybe <- 0x420000fd) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P2989: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P2990: !BST [13] (maybe <- 0x420000fe) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P2991: !BST [14] (maybe <- 0x420000ff) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P2992: !DWLD [13] (Int) (Branch target of P2959)
ldx [%i3 + 64], %o2
! move %o2(upper) -> %o2(upper)
ba P2993
nop

TARGET2959:
ba RET2959
nop


P2993: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P2994: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P2995: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P2996: !BLD [3] (FP)
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

P2997: !DWST [6] (maybe <- 0x2800027) (Int)
sllx %l4, 32, %o5 
add   %l4, 1, %l4
or %o5, %l4, %o5
stx %o5, [%i1 + 80]
add   %l4, 1, %l4

P2998: !BST [6] (maybe <- 0x42000100) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2999: !DWLD [7] (Int)
ldx [%i1 + 80], %l7
! move %l7(upper) -> %o2(lower)
srlx %o2, 32, %o2
sllx %o2, 32, %o2
srlx %l7, 32, %l6
or %l6, %o2, %o2
! move %l7(lower) -> %o3(upper)
sllx %l7, 32, %o3

P3000: !ST [2] (maybe <- 0x42000103) (FP) (Branch target of P2973)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i0 + 12 ]
ba P3001
nop

TARGET2973:
ba RET2973
nop


P3001: !PREFETCH [4] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i0 + 64] %asi, 1

P3002: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f11
fmovd %f36, %f12

P3003: !BST [14] (maybe <- 0x42000104) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P3004: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P3005: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P3006: !BST [2] (maybe <- 0x42000105) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3007: !BLD [1] (FP)
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

P3008: !DWLD [10] (Int)
ldx [%i2 + 32], %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %l3
or %l3, %o3, %o3

P3009: !BST [3] (maybe <- 0x42000109) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3010: !BST [11] (maybe <- 0x4200010d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P3011: !BST [7] (maybe <- 0x4200010e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3012: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P3013: !BLD [1] (FP)
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

P3014: !BLD [6] (FP)
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

P3015: !ST [7] (maybe <- 0x2800029) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P3016: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P3017: !CASX [9] (maybe <- 0x280002a) (Int)
add %i1, 512, %o5
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
sllx %l4, 32, %o0
casx [%o5], %l7, %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
add  %l4, 1, %l4

P3018: !BST [3] (maybe <- 0x42000111) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3019: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f11
fmovd %f36, %f12

P3020: !BST [6] (maybe <- 0x42000115) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3021: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P3022: !ST [4] (maybe <- 0x280002b) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P3023: !DWST [9] (maybe <- 0x280002c) (Int)
mov %l4, %o5 
sllx %o5, 32, %o5 
stx %o5, [%i1 + 512 ] 
add   %l4, 1, %l4

P3024: !DWLD [0] (Int)
ldx [%i0 + 0], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)

P3025: !BLD [10] (FP)
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

P3026: !BLD [1] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f0
membar #Sync 
! 4 addresses covered
fmovs %f3, %f2
fmovs %f8, %f3

P3027: !CAS [8] (maybe <- 0x280002d) (Int)
add %i1, 256, %l6
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

P3028: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P3029: !BST [0] (maybe <- 0x42000118) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3030: !BLD [11] (FP) (Branch target of P2820)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5
ba P3031
nop

TARGET2820:
ba RET2820
nop


P3031: !BST [10] (maybe <- 0x4200011c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P3032: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P3033: !CAS [10] (maybe <- 0x280002e) (Int)
add %i2, 32, %o5
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

P3034: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P3035: !BST [1] (maybe <- 0x4200011d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3036: !CAS [7] (maybe <- 0x280002f) (Int) (Branch target of P2740)
add %i1, 84, %l7
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
ba P3037
nop

TARGET2740:
ba RET2740
nop


P3037: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P3038: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P3039: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P3040: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P3041: !CAS [1] (maybe <- 0x2800030) (Int)
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

P3042: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P3043: !BST [4] (maybe <- 0x42000121) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P3044: !REPLACEMENT [1] (Int)
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

P3045: !CASX [0] (maybe <- 0x2800031) (Int)
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

P3046: !DWST [15] (maybe <- 0x2800033) (Int) (LE)
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
stxa %l3, [%i3 + 192 ] %asi
add   %l4, 1, %l4

P3047: !BST [14] (maybe <- 0x42000122) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P3048: !BST [6] (maybe <- 0x42000123) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3049: !MEMBAR (Int)
membar #StoreLoad

P3050: !REPLACEMENT [15] (Int)
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

P3051: !BST [12] (maybe <- 0x42000126) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P3052: !BST [12] (maybe <- 0x42000127) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P3053: !BLD [6] (FP)
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

P3054: !LD [7] (Int)
lduw [%i1 + 84], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P3055: !SWAP [1] (maybe <- 0x2800034) (Int)
mov %l4, %l6
swap  [%i0 + 4], %l6
! move %l6(lower) -> %o3(lower)
srl %l6, 0, %o5
or %o5, %o3, %o3
add   %l4, 1, %l4

P3056: !CAS [7] (maybe <- 0x2800035) (Int) (LE)
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
add %i1, 84, %o5
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

P3057: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P3058: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P3059: !BST [7] (maybe <- 0x42000128) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3060: !BLD [5] (FP)
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

P3061: !MEMBAR (Int)
membar #StoreLoad

P3062: !BST [10] (maybe <- 0x4200012b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P3063: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P3064: !BST [13] (maybe <- 0x4200012c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P3065: !BST [5] (maybe <- 0x4200012d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3066: !BST [7] (maybe <- 0x42000130) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3067: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f0
membar #Sync 
! 3 addresses covered
fmovs %f3, %f0
fmovs %f4, %f1
fmovs %f5, %f2

P3068: !BST [7] (maybe <- 0x42000133) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3069: !BST [12] (maybe <- 0x42000136) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P3070: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P3071: !PREFETCH [8] (Int) (CBR)
prefetch [%i1 + 256], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3071
nop
RET3071:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P3072: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P3073: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P3074: !BST [15] (maybe <- 0x42000137) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P3075: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P3076: !BLD [0] (FP)
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

P3077: !PREFETCH [0] (Int) (Branch target of P2621)
prefetch [%i0 + 0], 1
ba P3078
nop

TARGET2621:
ba RET2621
nop


P3078: !NOP (Int)
nop

P3079: !BST [1] (maybe <- 0x42000138) (FP) (Branch target of P2599)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 
ba P3080
nop

TARGET2599:
ba RET2599
nop


P3080: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P3081: !CAS [0] (maybe <- 0x2800036) (Int)
add %i0, 0, %o5
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

P3082: !DWST [1] (maybe <- 0x2800037) (Int)
sllx %l4, 32, %l7 
add   %l4, 1, %l4
or %l7, %l4, %l7
stx %l7, [%i0 + 0]
add   %l4, 1, %l4

P3083: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P3084: !PREFETCH [15] (Int) (CBR)
prefetch [%i3 + 192], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3084
nop
RET3084:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P3085: !BST [15] (maybe <- 0x4200013c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P3086: !MEMBAR (Int)
membar #StoreLoad

P3087: !LD [0] (Int)
lduw [%i0 + 0], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P3088: !LD [1] (FP)
ld [%i0 + 4], %f11
! 1 addresses covered

P3089: !LD [2] (Int) (LE)
wr %g0, 0x88, %asi
lduwa [%i0 + 12] %asi, %l3
! move %l3(lower) -> %o1(lower)
or %l3, %o1, %o1

P3090: !LD [3] (Int)
lduw [%i0 + 32], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P3091: !LD [4] (Int)
lduw [%i0 + 64], %l3
! move %l3(lower) -> %o2(lower)
or %l3, %o2, %o2

P3092: !LD [5] (Int)
lduw [%i1 + 76], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P3093: !LD [6] (FP)
ld [%i1 + 80], %f12
! 1 addresses covered

P3094: !LD [7] (FP)
ld [%i1 + 84], %f13
! 1 addresses covered

P3095: !LD [8] (Int) (Branch target of P2905)
lduw [%i1 + 256], %l3
! move %l3(lower) -> %o3(lower)
or %l3, %o3, %o3
ba P3096
nop

TARGET2905:
ba RET2905
nop


P3096: !LD [9] (Int)
lduw [%i1 + 512], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P3097: !LD [10] (Int)
lduw [%i2 + 32], %l3
! move %l3(lower) -> %o4(lower)
or %l3, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P3098: !LD [11] (Int)
lduw [%i2 + 64], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P3099: !LD [12] (Int)
lduw [%i3 + 0], %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0

P3100: !LD [13] (Int)
lduw [%i3 + 64], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P3101: !LD [14] (Int)
lduw [%i3 + 128], %l3
! move %l3(lower) -> %o1(lower)
or %l3, %o1, %o1

P3102: !LD [15] (Int)
lduw [%i3 + 192], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

END_NODES5: ! Test istream for CPU 5 ends
sethi %hi(0xdead0e0f), %o5
or    %o5, %lo(0xdead0e0f), %o5
! move %o5(lower) -> %o2(lower)
or %o5, %o2, %o2
stw %o5, [%i5] 
ld [%i5], %f14
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
sethi %hi(0x06deade1), %l7
or    %l7, %lo(0x06deade1), %l7
stw %l7, [%i5] 
ld [%i5], %f16

! Initialize running integer counter in register %l4
sethi %hi(0x3000001), %l4
or    %l4, %lo(0x3000001), %l4

! Initialize running FP counter in register %f16
sethi %hi(0x42800001), %l7
or    %l7, %lo(0x42800001), %l7
stw %l7, [%i5] 
ld [%i5], %f16

! Initialize FP counter increment value in register %f17 (constant)
sethi %hi(0x37000000), %l7
or    %l7, %lo(0x37000000), %l7
stw %l7, [%i5] 
ld [%i5], %f17 

! Initialize LFSR to 0x3124^4
sethi %hi(0x3124), %l0
or    %l0, %lo(0x3124), %l0
mulx  %l0, %l0, %l0
mulx  %l0, %l0, %l0

!-- init shared addrs 12 to 13 ---
stx %g0, [%i3+0]
stx %g0, [%i3+64]

! use untouched cache-line (offset 4K) in replacement area for sync
sub %i1, %i0, %o5
add %i3, %o5, %o5
sub %o5, -4096, %o5

!-- begin of sync_init ---
or %g0, 1, %l3
or %g0, %l3, %l6
swap [%o5+4], %l6
membar #Sync
sync_init_1_6:
brnz,pt %l3, sync_init_1_6
lduw [%o5+4], %l3 ! delay slot
sync_init_2_6:
lduw [%o5], %l3
sub %l3, 1, %l6
cas [%o5], %l3, %l6
cmp %l3, %l6
bne,pt %xcc, sync_init_2_6
nop
membar #Sync
sync_init_3_6:
lduw [%o5], %l3 ! delay slot
brnz,pt %l3, sync_init_3_6
nop
!-- end of sync_init ---


BEGIN_NODES6: ! Test istream for CPU 6 begins

P3103: !DWLD [8] (Int)
ldx [%i1 + 256], %o0
! move %o0(upper) -> %o0(upper)

P3104: !CAS [9] (maybe <- 0x3000001) (Int)
add %i1, 512, %l6
lduw [%l6], %o5
mov %o5, %l3
! move %l3(lower) -> %o0(lower)
srlx %o0, 32, %o0
sllx %o0, 32, %o0
or %l3, %o0, %o0
mov %l4, %o1
cas [%l6], %l3, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P3105: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f0
membar #Sync 
! 1 addresses covered

P3106: !BST [3] (maybe <- 0x42800001) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3107: !BST [6] (maybe <- 0x42800005) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3108: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P3109: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P3110: !BST [7] (maybe <- 0x42800008) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3111: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P3112: !BST [5] (maybe <- 0x4280000b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3113: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P3114: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P3115: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P3116: !BST [4] (maybe <- 0x4280000e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P3117: !DWST [15] (maybe <- 0x4280000f) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
std %f20, [%i3 + 192]

P3118: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P3119: !BST [2] (maybe <- 0x42800010) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3120: !CASX [12] (maybe <- 0x3000002) (Int) (LE)
! Change single-word-level endianess (big endian <-> little endian) 
sethi %hi(0xff00ff00), %l7
or %l7, %lo(0xff00ff00), %l7
and %l4, %l7, %l6
srl %l6, 8, %l6
sll %l4, 8, %o5
and %o5, %l7, %o5
or %o5, %l6, %o5
srl %o5, 16, %l6
sll %o5, 16, %o5
srl %o5, 0, %o5
or %o5, %l6, %o5
wr %g0, 0x88, %asi
add %i3, 0, %l7
ldxa [%l7] %asi, %l3
! move %l3(lower) -> %o1(lower)
srl %l3, 0, %l6
or %l6, %o1, %o1
! move %l3(upper) -> %o2(upper)
or %l3, %g0, %o2
mov  %l3, %l6
mov  %o5, %l3
casxa [%l7] %asi, %l6, %l3
! move %l3(lower) -> %o2(lower)
srlx %o2, 32, %o2
sllx %o2, 32, %o2
srl %l3, 0, %l7
or %l7, %o2, %o2
! move %l3(upper) -> %o3(upper)
or %l3, %g0, %o3
add  %l4, 1, %l4

P3121: !BST [9] (maybe <- 0x42800014) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P3122: !PREFETCH [0] (Int) (CBR)
prefetch [%i0 + 0], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3122
nop
RET3122:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P3123: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P3124: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P3125: !BST [0] (maybe <- 0x42800015) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3126: !CAS [5] (maybe <- 0x3000003) (Int) (Branch target of P3282)
add %i1, 76, %l6
lduw [%l6], %o5
mov %o5, %l3
! move %l3(lower) -> %o3(lower)
srlx %o3, 32, %o3
sllx %o3, 32, %o3
or %l3, %o3, %o3
mov %l4, %o4
cas [%l6], %l3, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4
ba P3127
nop

TARGET3282:
ba RET3282
nop


P3127: !BST [9] (maybe <- 0x42800019) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P3128: !BLD [8] (FP) (CBR) (Branch target of P3153)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3128
nop
RET3128:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0

ba P3129
nop

TARGET3153:
ba RET3153
nop


P3129: !ST [10] (maybe <- 0x3000004) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P3130: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P3131: !BLD [0] (FP)
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

P3132: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P3133: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P3134: !BST [0] (maybe <- 0x4280001a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3135: !PREFETCH [11] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i2 + 64] %asi, 1

P3136: !ST [15] (maybe <- 0x4280001e) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i3 + 192 ]

P3137: !ST [10] (maybe <- 0x3000005) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P3138: !PREFETCH [1] (Int) (CBR)
prefetch [%i0 + 4], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3138
nop
RET3138:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P3139: !BLD [2] (FP)
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

P3140: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P3141: !ST [14] (maybe <- 0x3000006) (Int) (Branch target of P3235)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4
ba P3142
nop

TARGET3235:
ba RET3235
nop


P3142: !CASX [11] (maybe <- 0x3000007) (Int)
add %i2, 64, %l6
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

P3143: !BLD [8] (FP)
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

P3144: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f0
membar #Sync 
! 1 addresses covered

P3145: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P3146: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P3147: !BLD [1] (FP)
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

P3148: !BST [11] (maybe <- 0x4280001f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P3149: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P3150: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P3151: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P3152: !CAS [6] (maybe <- 0x3000008) (Int)
add %i1, 80, %l3
lduw [%l3], %l7
mov %l7, %o5
! move %o5(lower) -> %o1(lower)
or %o5, %o1, %o1
mov %l4, %o2
cas [%l3], %o5, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P3153: !BLD [4] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3153
nop
RET3153:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P3154: !DWST [15] (maybe <- 0x3000009) (Int)
mov %l4, %l3 
sllx %l3, 32, %l3 
stx %l3, [%i3 + 192 ] 
add   %l4, 1, %l4

P3155: !BST [6] (maybe <- 0x42800020) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3156: !BLD [2] (FP)
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

P3157: !BST [2] (maybe <- 0x42800023) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3158: !DWLD [15] (Int) (CBR)
ldx [%i3 + 192], %l7
! move %l7(upper) -> %o2(lower)
srlx %l7, 32, %l6
or %l6, %o2, %o2

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3158
nop
RET3158:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P3159: !BST [9] (maybe <- 0x42800027) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P3160: !PREFETCH [1] (Int) (CBR)
prefetch [%i0 + 4], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3160
nop
RET3160:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P3161: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f13

P3162: !BST [3] (maybe <- 0x42800028) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3163: !ST [0] (maybe <- 0x300000a) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P3164: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P3165: !BST [4] (maybe <- 0x4280002c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P3166: !BLD [1] (FP)
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

P3167: !BST [14] (maybe <- 0x4280002d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P3168: !BST [6] (maybe <- 0x4280002e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3169: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P3170: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P3171: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P3172: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P3173: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P3174: !BST [12] (maybe <- 0x42800031) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P3175: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f4

P3176: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P3177: !ST [9] (maybe <- 0x300000b) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P3178: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P3179: !DWST [0] (maybe <- 0x300000c) (Int) (Branch target of P3409)
sllx %l4, 32, %l6 
add   %l4, 1, %l4
or %l6, %l4, %l6
stx %l6, [%i0 + 0]
add   %l4, 1, %l4
ba P3180
nop

TARGET3409:
ba RET3409
nop


P3180: !BST [11] (maybe <- 0x42800032) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P3181: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P3182: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P3183: !BST [5] (maybe <- 0x42800033) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3184: !BST [12] (maybe <- 0x42800036) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P3185: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P3186: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P3187: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P3188: !BST [3] (maybe <- 0x42800037) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3189: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P3190: !PREFETCH [15] (Int) (Branch target of P3347)
prefetch [%i3 + 192], 1
ba P3191
nop

TARGET3347:
ba RET3347
nop


P3191: !BST [5] (maybe <- 0x4280003b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3192: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P3193: !BST [8] (maybe <- 0x4280003e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P3194: !BLD [6] (FP)
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

P3195: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f11

P3196: !BST [13] (maybe <- 0x4280003f) (FP) (Branch target of P3570)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 
ba P3197
nop

TARGET3570:
ba RET3570
nop


P3197: !DWST [13] (maybe <- 0x300000e) (Int) (LE)
wr %g0, 0x88, %asi
! Change single-word-level endianess (big endian <-> little endian) 
sethi %hi(0xff00ff00), %l6
or %l6, %lo(0xff00ff00), %l6
and %l4, %l6, %o5
srl %o5, 8, %o5
sll %l4, 8, %l7
and %l7, %l6, %l7
or %l7, %o5, %l7
srl %l7, 16, %o5
sll %l7, 16, %l7
srl %l7, 0, %l7
or %l7, %o5, %l7
stxa %l7, [%i3 + 64 ] %asi
add   %l4, 1, %l4

P3198: !BST [2] (maybe <- 0x42800040) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3199: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P3200: !BLD [8] (FP) (Branch target of P3531)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12
ba P3201
nop

TARGET3531:
ba RET3531
nop


P3201: !ST [2] (maybe <- 0x300000f) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P3202: !BLD [13] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3202
nop
RET3202:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P3203: !MEMBAR (Int)
membar #StoreLoad

P3204: !BST [10] (maybe <- 0x42800044) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P3205: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P3206: !BST [8] (maybe <- 0x42800045) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P3207: !BST [11] (maybe <- 0x42800046) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P3208: !PREFETCH [2] (Int) (Branch target of P3260)
prefetch [%i0 + 12], 1
ba P3209
nop

TARGET3260:
ba RET3260
nop


P3209: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P3210: !BST [13] (maybe <- 0x42800047) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P3211: !BST [13] (maybe <- 0x42800048) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P3212: !BST [8] (maybe <- 0x42800049) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P3213: !BST [2] (maybe <- 0x4280004a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3214: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P3215: !BST [4] (maybe <- 0x4280004e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P3216: !BST [6] (maybe <- 0x4280004f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3217: !BST [3] (maybe <- 0x42800052) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3218: !BLD [12] (FP)
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

P3219: !MEMBAR (Int)
membar #StoreLoad

P3220: !REPLACEMENT [0] (Int)
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

P3221: !BST [1] (maybe <- 0x42800056) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3222: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P3223: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f0
membar #Sync 
! 1 addresses covered

P3224: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P3225: !BST [13] (maybe <- 0x4280005a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P3226: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P3227: !BST [7] (maybe <- 0x4280005b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3228: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P3229: !BST [3] (maybe <- 0x4280005e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3230: !BST [5] (maybe <- 0x42800062) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3231: !BST [12] (maybe <- 0x42800065) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P3232: !BST [3] (maybe <- 0x42800066) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
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
be,pn  %xcc, TARGET3232
nop
RET3232:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P3233: !BST [15] (maybe <- 0x4280006a) (FP) (Branch target of P3474)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 
ba P3234
nop

TARGET3474:
ba RET3474
nop


P3234: !DWLD [15] (Int)
ldx [%i3 + 192], %o3
! move %o3(upper) -> %o3(upper)

P3235: !PREFETCH [8] (Int) (CBR)
prefetch [%i1 + 256], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3235
nop
RET3235:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P3236: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P3237: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P3238: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P3239: !BST [8] (maybe <- 0x4280006b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P3240: !BST [1] (maybe <- 0x4280006c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3241: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P3242: !CASX [8] (maybe <- 0x3000010) (Int)
add %i1, 256, %o5
ldx [%o5], %l6
! move %l6(upper) -> %o3(lower)
srlx %o3, 32, %o3
sllx %o3, 32, %o3
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

P3243: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P3244: !DWLD [2] (Int)
ldx [%i0 + 8], %o5
! move %o5(lower) -> %o0(lower)
srl %o5, 0, %l7
or %l7, %o0, %o0

P3245: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P3246: !BST [0] (maybe <- 0x42800070) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3247: !REPLACEMENT [6] (Int) (Branch target of P3128)
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
ba P3248
nop

TARGET3128:
ba RET3128
nop


P3248: !BST [13] (maybe <- 0x42800074) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P3249: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P3250: !BLD [2] (FP)
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

P3251: !PREFETCH [0] (Int) (CBR)
prefetch [%i0 + 0], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3251
nop
RET3251:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P3252: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P3253: !REPLACEMENT [14] (Int)
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

P3254: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P3255: !DWST [13] (maybe <- 0x3000011) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 64 ] 
add   %l4, 1, %l4

P3256: !BST [0] (maybe <- 0x42800075) (FP) (Branch target of P3202)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 
ba P3257
nop

TARGET3202:
ba RET3202
nop


P3257: !BLD [6] (FP)
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

P3258: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P3259: !BST [4] (maybe <- 0x42800079) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P3260: !BST [13] (maybe <- 0x4280007a) (FP) (CBR)
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
be,pt  %xcc, TARGET3260
nop
RET3260:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P3261: !ST [2] (maybe <- 0x3000012) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P3262: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P3263: !BST [7] (maybe <- 0x4280007b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3264: !CASX [15] (maybe <- 0x3000013) (Int)
add %i3, 192, %l6
ldx [%l6], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
mov  %o1, %l3
sllx %l4, 32, %o2
casx [%l6], %l3, %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
add  %l4, 1, %l4

P3265: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P3266: !REPLACEMENT [8] (Int)
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

P3267: !BST [13] (maybe <- 0x4280007e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P3268: !ST [13] (maybe <- 0x4280007f) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i3 + 64 ]

P3269: !BLD [15] (FP)
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

P3270: !BST [3] (maybe <- 0x42800080) (FP) (Branch target of P3563)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 
ba P3271
nop

TARGET3563:
ba RET3563
nop


P3271: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P3272: !BST [6] (maybe <- 0x42800084) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3273: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P3274: !BST [12] (maybe <- 0x42800087) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P3275: !BST [6] (maybe <- 0x42800088) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3276: !PREFETCH [4] (Int) (Branch target of P3160)
prefetch [%i0 + 64], 1
ba P3277
nop

TARGET3160:
ba RET3160
nop


P3277: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P3278: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P3279: !BST [12] (maybe <- 0x4280008b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P3280: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f0
membar #Sync 
! 1 addresses covered
fmovd %f8, %f0

P3281: !CASX [4] (maybe <- 0x3000014) (Int) (CBR)
add %i0, 64, %l6
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

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3281
nop
RET3281:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P3282: !PREFETCH [13] (Int) (CBR)
prefetch [%i3 + 64], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3282
nop
RET3282:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P3283: !DWST [4] (maybe <- 0x3000015) (Int)
mov %l4, %l7 
sllx %l7, 32, %l7 
stx %l7, [%i0 + 64 ] 
add   %l4, 1, %l4

P3284: !BST [8] (maybe <- 0x4280008c) (FP) (CBR)
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
be,pt  %xcc, TARGET3284
nop
RET3284:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P3285: !BST [7] (maybe <- 0x4280008d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3286: !BST [15] (maybe <- 0x42800090) (FP) (Branch target of P3232)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 
ba P3287
nop

TARGET3232:
ba RET3232
nop


P3287: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P3288: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P3289: !ST [6] (maybe <- 0x3000016) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P3290: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P3291: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P3292: !BST [0] (maybe <- 0x42800091) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
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
be,pn  %xcc, TARGET3292
nop
RET3292:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P3293: !BLD [1] (FP) (CBR)
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
be,pt  %xcc, TARGET3293
nop
RET3293:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P3294: !REPLACEMENT [10] (Int)
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

P3295: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P3296: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f36, %f8

P3297: !LD [4] (FP)
ld [%i0 + 64], %f10
! 1 addresses covered

P3298: !BST [0] (maybe <- 0x42800095) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3299: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P3300: !BST [6] (maybe <- 0x42800099) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3301: !BST [8] (maybe <- 0x4280009c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P3302: !BST [5] (maybe <- 0x4280009d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3303: !BST [8] (maybe <- 0x428000a0) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P3304: !BST [15] (maybe <- 0x428000a1) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P3305: !CASX [10] (maybe <- 0x3000017) (Int)
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

P3306: !BST [14] (maybe <- 0x428000a2) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P3307: !BLD [3] (FP)
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

P3308: !BST [6] (maybe <- 0x428000a3) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3309: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P3310: !BLD [7] (FP)
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

P3311: !BLD [7] (FP)
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

P3312: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P3313: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P3314: !REPLACEMENT [5] (Int)
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

P3315: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P3316: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P3317: !BST [4] (maybe <- 0x428000a6) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P3318: !BST [2] (maybe <- 0x428000a7) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3319: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P3320: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P3321: !BST [14] (maybe <- 0x428000ab) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P3322: !DWLD [8] (Int)
ldx [%i1 + 256], %o2
! move %o2(upper) -> %o2(upper)

P3323: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P3324: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P3325: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P3326: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P3327: !CASX [14] (maybe <- 0x3000018) (Int)
add %i3, 128, %l6
ldx [%l6], %o5
! move %o5(upper) -> %o2(lower)
srlx %o2, 32, %o2
sllx %o2, 32, %o2
srlx %o5, 32, %l3
or %l3, %o2, %o2
! move %o5(lower) -> %o3(upper)
sllx %o5, 32, %o3
mov  %o5, %l3
sllx %l4, 32, %o5
casx [%l6], %l3, %o5
! move %o5(upper) -> %o3(lower)
srlx %o5, 32, %l6
or %l6, %o3, %o3
! move %o5(lower) -> %o4(upper)
sllx %o5, 32, %o4
add  %l4, 1, %l4

P3328: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P3329: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P3330: !DWLD [1] (Int)
ldx [%i0 + 0], %l6
! move %l6(upper) -> %o4(lower)
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

P3331: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P3332: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P3333: !MEMBAR (Int)
membar #StoreLoad

P3334: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P3335: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f10

P3336: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P3337: !CAS [7] (maybe <- 0x3000019) (Int)
add %i1, 84, %o5
lduw [%o5], %l6
mov %l6, %l7
! move %l7(lower) -> %o0(lower)
or %l7, %o0, %o0
mov %l4, %o1
cas [%o5], %l7, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P3338: !BST [8] (maybe <- 0x428000ac) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P3339: !BST [10] (maybe <- 0x428000ad) (FP) (CBR)
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
be,pn  %xcc, TARGET3339
nop
RET3339:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P3340: !BST [0] (maybe <- 0x428000ae) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3341: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P3342: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P3343: !BST [8] (maybe <- 0x428000b2) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P3344: !BLD [3] (FP)
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

P3345: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P3346: !BST [3] (maybe <- 0x428000b3) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3347: !BST [8] (maybe <- 0x428000b7) (FP) (CBR)
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
be,pn  %xcc, TARGET3347
nop
RET3347:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P3348: !BLD [5] (FP)
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

P3349: !NOP (Int) (Branch target of P3418)
nop
ba P3350
nop

TARGET3418:
ba RET3418
nop


P3350: !BLD [3] (FP)
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

P3351: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P3352: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P3353: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P3354: !NOP (Int)
nop

P3355: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P3356: !DWLD [8] (Int)
ldx [%i1 + 256], %o5
! move %o5(upper) -> %o1(lower)
srlx %o5, 32, %l7
or %l7, %o1, %o1

P3357: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P3358: !DWST [4] (maybe <- 0x300001a) (Int)
mov %l4, %l3 
sllx %l3, 32, %l3 
stx %l3, [%i0 + 64 ] 
add   %l4, 1, %l4

P3359: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P3360: !REPLACEMENT [6] (Int)
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

P3361: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P3362: !BST [12] (maybe <- 0x428000b8) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P3363: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f9
fmovd %f36, %f10

P3364: !BLD [10] (FP) (Branch target of P3284)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f12
ba P3365
nop

TARGET3284:
ba RET3284
nop


P3365: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P3366: !BST [4] (maybe <- 0x428000b9) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P3367: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P3368: !BST [15] (maybe <- 0x428000ba) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P3369: !DWST [3] (maybe <- 0x300001b) (Int)
mov %l4, %o5 
sllx %o5, 32, %o5 
stx %o5, [%i0 + 32 ] 
add   %l4, 1, %l4

P3370: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P3371: !BST [8] (maybe <- 0x428000bb) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P3372: !LD [9] (Int)
lduw [%i1 + 512], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P3373: !ST [8] (maybe <- 0x300001c) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P3374: !BLD [6] (FP)
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

P3375: !BLD [5] (FP) (CBR)
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
be,pt  %xcc, TARGET3375
nop
RET3375:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P3376: !ST [10] (maybe <- 0x300001d) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P3377: !SWAP [3] (maybe <- 0x300001e) (Int)
mov %l4, %l3
swap  [%i0 + 32], %l3
! move %l3(lower) -> %o2(lower)
srl %l3, 0, %l7
or %l7, %o2, %o2
add   %l4, 1, %l4

P3378: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P3379: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P3380: !BLD [5] (FP)
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

P3381: !BST [3] (maybe <- 0x428000bc) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3382: !BST [13] (maybe <- 0x428000c0) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P3383: !BLD [2] (FP)
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

P3384: !BST [2] (maybe <- 0x428000c1) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3385: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P3386: !BST [7] (maybe <- 0x428000c5) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3387: !BST [7] (maybe <- 0x428000c8) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3388: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P3389: !BLD [2] (FP)
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

P3390: !BST [2] (maybe <- 0x428000cb) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3391: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P3392: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f0
membar #Sync 
! 1 addresses covered

P3393: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f1

P3394: !BLD [0] (FP)
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

P3395: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P3396: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P3397: !BST [8] (maybe <- 0x428000cf) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P3398: !SWAP [0] (maybe <- 0x300001f) (Int) (LE)
wr %g0, 0x88, %asi
mov %l4, %o3
! Change single-word-level endianess (big endian <-> little endian) 
sethi %hi(0xff00ff00), %l7
or %l7, %lo(0xff00ff00), %l7
and %o3, %l7, %o5
srl %o5, 8, %o5
sll %o3, 8, %o3
and %o3, %l7, %o3
or %o3, %o5, %o3
srl %o3, 16, %o5
sll %o3, 16, %o3
srl %o3, 0, %o3
or %o3, %o5, %o3
swapa  [%i0 + 0] %asi, %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P3399: !BST [7] (maybe <- 0x428000d0) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3400: !BST [3] (maybe <- 0x428000d3) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3401: !BLD [1] (FP)
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

P3402: !MEMBAR (Int)
membar #StoreLoad

P3403: !BST [12] (maybe <- 0x428000d7) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P3404: !DWLD [0] (Int)
ldx [%i0 + 0], %o5
! move %o5(upper) -> %o3(lower)
srlx %o5, 32, %l7
or %l7, %o3, %o3
! move %o5(lower) -> %o4(upper)
sllx %o5, 32, %o4

P3405: !BST [13] (maybe <- 0x428000d8) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P3406: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P3407: !BST [15] (maybe <- 0x428000d9) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P3408: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P3409: !BLD [15] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3409
nop
RET3409:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P3410: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f11

P3411: !BST [4] (maybe <- 0x428000da) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P3412: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P3413: !PREFETCH [12] (Int) (Branch target of P3158)
prefetch [%i3 + 0], 1
ba P3414
nop

TARGET3158:
ba RET3158
nop


P3414: !ST [8] (maybe <- 0x3000020) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P3415: !BST [6] (maybe <- 0x428000db) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3416: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P3417: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P3418: !PREFETCH [7] (Int) (CBR)
prefetch [%i1 + 84], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3418
nop
RET3418:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P3419: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P3420: !BST [2] (maybe <- 0x428000de) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3421: !BST [15] (maybe <- 0x428000e2) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P3422: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P3423: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P3424: !BLD [5] (FP)
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

P3425: !BST [13] (maybe <- 0x428000e3) (FP) (CBR)
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
be,pn  %xcc, TARGET3425
nop
RET3425:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P3426: !BST [4] (maybe <- 0x428000e4) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P3427: !BST [6] (maybe <- 0x428000e5) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3428: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P3429: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f3
fmovd %f36, %f4

P3430: !BST [1] (maybe <- 0x428000e8) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3431: !BST [1] (maybe <- 0x428000ec) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3432: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P3433: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f6

P3434: !BST [11] (maybe <- 0x428000f0) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P3435: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P3436: !REPLACEMENT [7] (Int)
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

P3437: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P3438: !BST [13] (maybe <- 0x428000f1) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P3439: !BST [9] (maybe <- 0x428000f2) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P3440: !BLD [6] (FP)
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

P3441: !LD [13] (Int)
lduw [%i3 + 64], %l3
! move %l3(lower) -> %o4(lower)
or %l3, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P3442: !DWST [0] (maybe <- 0x3000021) (Int)
sllx %l4, 32, %l6 
add   %l4, 1, %l4
or %l6, %l4, %l6
stx %l6, [%i0 + 0]
add   %l4, 1, %l4

P3443: !BST [4] (maybe <- 0x428000f3) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P3444: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P3445: !BST [1] (maybe <- 0x428000f4) (FP) (Branch target of P3339)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 
ba P3446
nop

TARGET3339:
ba RET3339
nop


P3446: !BLD [0] (FP)
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

P3447: !BLD [6] (FP)
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

P3448: !BLD [7] (FP)
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

P3449: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P3450: !DWLD [10] (Int)
ldx [%i2 + 32], %o0
! move %o0(upper) -> %o0(upper)

P3451: !BST [15] (maybe <- 0x428000f8) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P3452: !BST [6] (maybe <- 0x428000f9) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3453: !REPLACEMENT [11] (Int)
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

P3454: !REPLACEMENT [15] (Int)
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

P3455: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P3456: !BST [6] (maybe <- 0x428000fc) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3457: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P3458: !BST [5] (maybe <- 0x428000ff) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3459: !BLD [6] (FP)
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

P3460: !CASX [12] (maybe <- 0x3000023) (Int) (Branch target of P3138)
add %i3, 0, %o5
ldx [%o5], %l6
! move %l6(upper) -> %o0(lower)
srlx %o0, 32, %o0
sllx %o0, 32, %o0
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
ba P3461
nop

TARGET3138:
ba RET3138
nop


P3461: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f9
fmovd %f36, %f10

P3462: !MEMBAR (Int)
membar #StoreLoad

P3463: !BST [0] (maybe <- 0x42800102) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3464: !BST [11] (maybe <- 0x42800106) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P3465: !LD [0] (Int) (LE)
wr %g0, 0x88, %asi
lduwa [%i0 + 0] %asi, %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2

P3466: !BST [11] (maybe <- 0x42800107) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P3467: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P3468: !DWST [15] (maybe <- 0x3000024) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 192 ] 
add   %l4, 1, %l4

P3469: !LD [13] (Int) (Branch target of P3611)
lduw [%i3 + 64], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
ba P3470
nop

TARGET3611:
ba RET3611
nop


P3470: !BST [0] (maybe <- 0x42800108) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3471: !PREFETCH [6] (Int) (Branch target of P3521)
prefetch [%i1 + 80], 1
ba P3472
nop

TARGET3521:
ba RET3521
nop


P3472: !BLD [0] (FP) (CBR)
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
be,pt  %xcc, TARGET3472
nop
RET3472:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P3473: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P3474: !BST [5] (maybe <- 0x4280010c) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
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
be,pt  %xcc, TARGET3474
nop
RET3474:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P3475: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P3476: !BST [15] (maybe <- 0x4280010f) (FP) (Branch target of P3122)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 
ba P3477
nop

TARGET3122:
ba RET3122
nop


P3477: !BST [10] (maybe <- 0x42800110) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P3478: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P3479: !BLD [3] (FP)
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

P3480: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f36, %f8

P3481: !BST [6] (maybe <- 0x42800111) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3482: !DWST [10] (maybe <- 0x3000025) (Int)
mov %l4, %o5 
sllx %o5, 32, %o5 
stx %o5, [%i2 + 32 ] 
add   %l4, 1, %l4

P3483: !BLD [6] (FP)
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

P3484: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P3485: !CAS [13] (maybe <- 0x3000026) (Int)
add %i3, 64, %o5
lduw [%o5], %l6
mov %l6, %l7
! move %l7(lower) -> %o3(lower)
or %l7, %o3, %o3
mov %l4, %o4
cas [%o5], %l7, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P3486: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P3487: !BLD [0] (FP)
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

P3488: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P3489: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P3490: !BLD [7] (FP) (Branch target of P3292)
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
ba P3491
nop

TARGET3292:
ba RET3292
nop


P3491: !BST [3] (maybe <- 0x42800114) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3492: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P3493: !PREFETCH [8] (Int) (Branch target of P3375)
prefetch [%i1 + 256], 1
ba P3494
nop

TARGET3375:
ba RET3375
nop


P3494: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P3495: !REPLACEMENT [2] (Int)
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

P3496: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P3497: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P3498: !BLD [9] (FP) (Branch target of P3472)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6
ba P3499
nop

TARGET3472:
ba RET3472
nop


P3499: !BST [5] (maybe <- 0x42800118) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3500: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P3501: !BST [7] (maybe <- 0x4280011b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3502: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P3503: !LD [12] (Int)
lduw [%i3 + 0], %o5
! move %o5(lower) -> %o4(lower)
or %o5, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P3504: !ST [11] (maybe <- 0x3000027) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P3505: !BLD [1] (FP)
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

P3506: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P3507: !ST [7] (maybe <- 0x3000028) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P3508: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P3509: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P3510: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P3511: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P3512: !BST [13] (maybe <- 0x4280011e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P3513: !PREFETCH [0] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i0 + 0] %asi, 1

P3514: !BLD [0] (FP)
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

P3515: !BST [3] (maybe <- 0x4280011f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3516: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P3517: !BLD [5] (FP)
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

P3518: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f5
fmovd %f36, %f6

P3519: !BST [7] (maybe <- 0x42800123) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3520: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P3521: !BLD [2] (FP) (CBR)
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
be,pn  %xcc, TARGET3521
nop
RET3521:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P3522: !ST [8] (maybe <- 0x3000029) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P3523: !DWLD [13] (Int)
ldx [%i3 + 64], %o0
! move %o0(upper) -> %o0(upper)

P3524: !BST [3] (maybe <- 0x42800126) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3525: !LD [11] (Int)
lduw [%i2 + 64], %l6
! move %l6(lower) -> %o0(lower)
srlx %o0, 32, %o0
sllx %o0, 32, %o0
or %l6, %o0, %o0

P3526: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P3527: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P3528: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P3529: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P3530: !BST [7] (maybe <- 0x4280012a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3531: !PREFETCH [4] (Int) (LE) (CBR)
wr %g0, 0x88, %asi
prefetcha [%i0 + 64] %asi, 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3531
nop
RET3531:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P3532: !BLD [1] (FP)
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

P3533: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P3534: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P3535: !BST [12] (maybe <- 0x4280012d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P3536: !BST [13] (maybe <- 0x4280012e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P3537: !DWST [14] (maybe <- 0x300002a) (Int)
mov %l4, %l3 
sllx %l3, 32, %l3 
stx %l3, [%i3 + 128 ] 
add   %l4, 1, %l4

P3538: !BLD [3] (FP) (Branch target of P3293)
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
ba P3539
nop

TARGET3293:
ba RET3293
nop


P3539: !SWAP [3] (maybe <- 0x300002b) (Int)
mov %l4, %o1
swap  [%i0 + 32], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P3540: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f7

P3541: !BST [5] (maybe <- 0x4280012f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3542: !BST [15] (maybe <- 0x42800132) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P3543: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P3544: !BST [4] (maybe <- 0x42800133) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P3545: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P3546: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P3547: !BST [12] (maybe <- 0x42800134) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P3548: !BST [0] (maybe <- 0x42800135) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3549: !BST [4] (maybe <- 0x42800139) (FP) (CBR)
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
be,pt  %xcc, TARGET3549
nop
RET3549:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P3550: !BST [15] (maybe <- 0x4280013a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P3551: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P3552: !LD [14] (Int)
lduw [%i3 + 128], %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1

P3553: !BST [9] (maybe <- 0x4280013b) (FP) (Branch target of P3549)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 
ba P3554
nop

TARGET3549:
ba RET3549
nop


P3554: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P3555: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P3556: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P3557: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P3558: !BLD [2] (FP)
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

P3559: !BST [3] (maybe <- 0x4280013c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3560: !PREFETCH [7] (Int) (Branch target of P3251)
prefetch [%i1 + 84], 1
ba P3561
nop

TARGET3251:
ba RET3251
nop


P3561: !BST [13] (maybe <- 0x42800140) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P3562: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P3563: !BST [6] (maybe <- 0x42800141) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
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
be,pt  %xcc, TARGET3563
nop
RET3563:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P3564: !BST [12] (maybe <- 0x42800144) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P3565: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P3566: !BLD [6] (FP)
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

P3567: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P3568: !DWLD [4] (FP)
ldd [%i0 + 64], %f2
! 1 addresses covered

P3569: !BST [14] (maybe <- 0x42800145) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P3570: !PREFETCH [12] (Int) (CBR)
prefetch [%i3 + 0], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3570
nop
RET3570:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P3571: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P3572: !PREFETCH [14] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i3 + 128] %asi, 1

P3573: !BST [1] (maybe <- 0x42800146) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3574: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P3575: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P3576: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P3577: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P3578: !BST [14] (maybe <- 0x4280014a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P3579: !LD [13] (Int)
lduw [%i3 + 64], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P3580: !BLD [5] (FP)
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

P3581: !LD [1] (Int)
lduw [%i0 + 4], %o5
! move %o5(lower) -> %o2(lower)
or %o5, %o2, %o2

P3582: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P3583: !BST [12] (maybe <- 0x4280014b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P3584: !ST [9] (maybe <- 0x300002c) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P3585: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P3586: !BST [4] (maybe <- 0x4280014c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P3587: !ST [4] (maybe <- 0x300002d) (Int) (LE)
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
stwa   %l6, [%i0 + 64] %asi
add   %l4, 1, %l4

P3588: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P3589: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P3590: !DWLD [3] (Int)
ldx [%i0 + 32], %o3
! move %o3(upper) -> %o3(upper)

P3591: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P3592: !PREFETCH [1] (Int) (Branch target of P3425)
prefetch [%i0 + 4], 1
ba P3593
nop

TARGET3425:
ba RET3425
nop


P3593: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P3594: !BLD [0] (FP)
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

P3595: !BST [12] (maybe <- 0x4280014d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P3596: !CAS [6] (maybe <- 0x300002e) (Int) (Branch target of P3281)
add %i1, 80, %l7
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
ba P3597
nop

TARGET3281:
ba RET3281
nop


P3597: !BLD [4] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3597
nop
RET3597:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P3598: !BST [11] (maybe <- 0x4280014e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P3599: !BST [15] (maybe <- 0x4280014f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P3600: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P3601: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P3602: !BST [13] (maybe <- 0x42800150) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P3603: !MEMBAR (Int)
membar #StoreLoad

P3604: !LD [0] (FP)
ld [%i0 + 0], %f15
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

P3605: !LD [1] (Int) (LE)
wr %g0, 0x88, %asi
lduwa [%i0 + 4] %asi, %l3
! move %l3(lower) -> %o4(lower)
or %l3, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P3606: !LD [2] (FP)
ld [%i0 + 12], %f0
! 1 addresses covered

P3607: !LD [3] (Int)
lduw [%i0 + 32], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P3608: !LD [4] (Int)
lduw [%i0 + 64], %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0

P3609: !LD [5] (Int)
lduw [%i1 + 76], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P3610: !LD [6] (Int)
lduw [%i1 + 80], %l3
! move %l3(lower) -> %o1(lower)
or %l3, %o1, %o1

P3611: !LD [7] (Int) (CBR)
lduw [%i1 + 84], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3611
nop
RET3611:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P3612: !LD [8] (Int)
lduw [%i1 + 256], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2

P3613: !LD [9] (Int)
lduw [%i1 + 512], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P3614: !LD [10] (Int) (LE)
wr %g0, 0x88, %asi
lduwa [%i2 + 32] %asi, %l6
! move %l6(lower) -> %o3(lower)
or %l6, %o3, %o3

P3615: !LD [11] (Int) (Branch target of P3597)
lduw [%i2 + 64], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
ba P3616
nop

TARGET3597:
ba RET3597
nop


P3616: !LD [12] (Int)
lduw [%i3 + 0], %l6
! move %l6(lower) -> %o4(lower)
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P3617: !LD [13] (Int)
lduw [%i3 + 64], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P3618: !LD [14] (Int)
lduw [%i3 + 128], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

P3619: !LD [15] (Int)
lduw [%i3 + 192], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

END_NODES6: ! Test istream for CPU 6 ends
sethi %hi(0xdead0e0f), %l3
or    %l3, %lo(0xdead0e0f), %l3
! move %l3(lower) -> %o1(lower)
or %l3, %o1, %o1
stw %l3, [%i5] 
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
sethi %hi(0xdeadbee0), %o5
or    %o5, %lo(0xdeadbee0), %o5
stw   %o5, [%i5]
sethi %hi(0xdeadbee1), %o5
or    %o5, %lo(0xdeadbee1), %o5
stw   %o5, [%i5+4]
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
sethi %hi(0x07deade1), %o5
or    %o5, %lo(0x07deade1), %o5
stw %o5, [%i5] 
ld [%i5], %f16

! Initialize running integer counter in register %l4
sethi %hi(0x3800001), %l4
or    %l4, %lo(0x3800001), %l4

! Initialize running FP counter in register %f16
sethi %hi(0x43000001), %o5
or    %o5, %lo(0x43000001), %o5
stw %o5, [%i5] 
ld [%i5], %f16

! Initialize FP counter increment value in register %f17 (constant)
sethi %hi(0x37800000), %o5
or    %o5, %lo(0x37800000), %o5
stw %o5, [%i5] 
ld [%i5], %f17 

! Initialize LFSR to 0x7ea8^4
sethi %hi(0x7ea8), %l0
or    %l0, %lo(0x7ea8), %l0
mulx  %l0, %l0, %l0
mulx  %l0, %l0, %l0

!-- init shared addrs 14 to 15 ---
stx %g0, [%i3+128]
stx %g0, [%i3+192]

! use untouched cache-line (offset 4K) in replacement area for sync
sub %i1, %i0, %l3
add %i3, %l3, %l3
sub %l3, -4096, %l3

!-- begin of sync_init ---
or %g0, 1, %l6
or %g0, %l6, %l7
swap [%l3+4], %l7
membar #Sync
sync_init_1_7:
brnz,pt %l6, sync_init_1_7
lduw [%l3+4], %l6 ! delay slot
sync_init_2_7:
lduw [%l3], %l6
sub %l6, 1, %l7
cas [%l3], %l6, %l7
cmp %l6, %l7
bne,pt %xcc, sync_init_2_7
nop
membar #Sync
sync_init_3_7:
lduw [%l3], %l6 ! delay slot
brnz,pt %l6, sync_init_3_7
nop
!-- end of sync_init ---


BEGIN_NODES7: ! Test istream for CPU 7 begins

P3620: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P3621: !BST [7] (maybe <- 0x43000001) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3622: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f0
membar #Sync 
! 1 addresses covered

P3623: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P3624: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P3625: !BST [15] (maybe <- 0x43000004) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P3626: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P3627: !BST [0] (maybe <- 0x43000005) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3628: !PREFETCH [3] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i0 + 32] %asi, 1

P3629: !BST [13] (maybe <- 0x43000009) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P3630: !BST [1] (maybe <- 0x4300000a) (FP) (Branch target of P3650)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 
ba P3631
nop

TARGET3650:
ba RET3650
nop


P3631: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P3632: !ST [8] (maybe <- 0x3800001) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P3633: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P3634: !PREFETCH [4] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i0 + 64] %asi, 1

P3635: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f2

P3636: !BLD [3] (FP)
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

P3637: !BST [6] (maybe <- 0x4300000e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3638: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f36, %f8

P3639: !CAS [3] (maybe <- 0x3800002) (Int) (LE)
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
lduwa [%l6] %asi, %o0
mov %o0, %l3
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
mov %l7, %o5
casa [%l6] %asi, %l3, %o5
! move %o5(lower) -> %o0(lower)
srl %o5, 0, %l6
or %l6, %o0, %o0
add   %l4, 1, %l4

P3640: !BST [6] (maybe <- 0x43000011) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3641: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P3642: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P3643: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P3644: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P3645: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P3646: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P3647: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f13

P3648: !BST [4] (maybe <- 0x43000014) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P3649: !LD [11] (Int)
lduw [%i2 + 64], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P3650: !LD [1] (Int) (CBR)
lduw [%i0 + 4], %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3650
nop
RET3650:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P3651: !BST [0] (maybe <- 0x43000015) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3652: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P3653: !REPLACEMENT [9] (Int)
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

P3654: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P3655: !DWST [14] (maybe <- 0x3800003) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 128 ] 
add   %l4, 1, %l4

P3656: !BST [15] (maybe <- 0x43000019) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P3657: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P3658: !DWLD [13] (Int)
ldx [%i3 + 64], %o2
! move %o2(upper) -> %o2(upper)

P3659: !LD [10] (Int)
lduw [%i2 + 32], %l7
! move %l7(lower) -> %o2(lower)
srlx %o2, 32, %o2
sllx %o2, 32, %o2
or %l7, %o2, %o2

P3660: !BST [8] (maybe <- 0x4300001a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P3661: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P3662: !BST [11] (maybe <- 0x4300001b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P3663: !PREFETCH [5] (Int) (Branch target of P3711)
prefetch [%i1 + 76], 1
ba P3664
nop

TARGET3711:
ba RET3711
nop


P3664: !BST [8] (maybe <- 0x4300001c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P3665: !NOP (Int)
nop

P3666: !DWLD [8] (Int)
ldx [%i1 + 256], %o3
! move %o3(upper) -> %o3(upper)

P3667: !BST [8] (maybe <- 0x4300001d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P3668: !BLD [10] (FP)
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

P3669: !BST [6] (maybe <- 0x4300001e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3670: !BST [10] (maybe <- 0x43000021) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P3671: !REPLACEMENT [5] (Int) (Branch target of P3933)
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
ba P3672
nop

TARGET3933:
ba RET3933
nop


P3672: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P3673: !BST [10] (maybe <- 0x43000022) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P3674: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f0
membar #Sync 
! 1 addresses covered
fmovd %f8, %f0

P3675: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P3676: !BST [0] (maybe <- 0x43000023) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3677: !MEMBAR (Int) (Branch target of P3765)
membar #StoreLoad
ba P3678
nop

TARGET3765:
ba RET3765
nop


P3678: !BST [3] (maybe <- 0x43000027) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3679: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P3680: !BST [13] (maybe <- 0x4300002b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P3681: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f36, %f2

P3682: !BST [7] (maybe <- 0x4300002c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3683: !BST [9] (maybe <- 0x4300002f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P3684: !BLD [7] (FP)
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

P3685: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P3686: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P3687: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P3688: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P3689: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P3690: !DWST [13] (maybe <- 0x3800004) (Int)
mov %l4, %l3 
sllx %l3, 32, %l3 
stx %l3, [%i3 + 64 ] 
add   %l4, 1, %l4

P3691: !LD [9] (Int)
lduw [%i1 + 512], %l3
! move %l3(lower) -> %o3(lower)
srlx %o3, 32, %o3
sllx %o3, 32, %o3
or %l3, %o3, %o3

P3692: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P3693: !BST [9] (maybe <- 0x43000030) (FP) (Branch target of P4119)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 
ba P3694
nop

TARGET4119:
ba RET4119
nop


P3694: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P3695: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P3696: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P3697: !BST [15] (maybe <- 0x43000031) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P3698: !BST [7] (maybe <- 0x43000032) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3699: !BST [8] (maybe <- 0x43000035) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P3700: !DWST [6] (maybe <- 0x3800005) (Int)
sllx %l4, 32, %l6 
add   %l4, 1, %l4
or %l6, %l4, %l6
stx %l6, [%i1 + 80]
add   %l4, 1, %l4

P3701: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P3702: !CAS [13] (maybe <- 0x3800007) (Int)
add %i3, 64, %l6
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

P3703: !BLD [3] (FP)
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

P3704: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f0
membar #Sync 
! 1 addresses covered

P3705: !BST [9] (maybe <- 0x43000036) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P3706: !BST [5] (maybe <- 0x43000037) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3707: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P3708: !BST [7] (maybe <- 0x4300003a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3709: !BST [6] (maybe <- 0x4300003d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3710: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P3711: !BLD [0] (FP) (CBR)
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
be,pn  %xcc, TARGET3711
nop
RET3711:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P3712: !BST [13] (maybe <- 0x43000040) (FP) (Branch target of P3924)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 
ba P3713
nop

TARGET3924:
ba RET3924
nop


P3713: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P3714: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P3715: !PREFETCH [12] (Int) (CBR)
prefetch [%i3 + 0], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3715
nop
RET3715:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P3716: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P3717: !DWLD [2] (Int)
ldx [%i0 + 8], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P3718: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P3719: !MEMBAR (Int)
membar #StoreLoad

P3720: !PREFETCH [6] (Int) (Branch target of P4126)
prefetch [%i1 + 80], 1
ba P3721
nop

TARGET4126:
ba RET4126
nop


P3721: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P3722: !BST [10] (maybe <- 0x43000041) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P3723: !BLD [0] (FP)
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

P3724: !BST [2] (maybe <- 0x43000042) (FP) (Branch target of P4106)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 
ba P3725
nop

TARGET4106:
ba RET4106
nop


P3725: !BST [1] (maybe <- 0x43000046) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3726: !BLD [1] (FP) (CBR)
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
be,pn  %xcc, TARGET3726
nop
RET3726:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P3727: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P3728: !BST [12] (maybe <- 0x4300004a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P3729: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P3730: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P3731: !LD [8] (Int)
lduw [%i1 + 256], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

P3732: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f2

P3733: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P3734: !BST [10] (maybe <- 0x4300004b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P3735: !BLD [8] (FP) (Branch target of P3798)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4
ba P3736
nop

TARGET3798:
ba RET3798
nop


P3736: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P3737: !BST [15] (maybe <- 0x4300004c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P3738: !ST [4] (maybe <- 0x3800008) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P3739: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P3740: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P3741: !CAS [12] (maybe <- 0x3800009) (Int)
add %i3, 0, %l3
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

P3742: !ST [14] (maybe <- 0x380000a) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P3743: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P3744: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f36, %f8

P3745: !DWLD [0] (FP)
ldd [%i0 + 0], %f10
! 2 addresses covered

P3746: !DWST [12] (maybe <- 0x380000b) (Int)
mov %l4, %l7 
sllx %l7, 32, %l7 
stx %l7, [%i3 + 0 ] 
add   %l4, 1, %l4

P3747: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P3748: !REPLACEMENT [3] (Int)
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

P3749: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P3750: !BLD [0] (FP)
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

P3751: !ST [11] (maybe <- 0x380000c) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P3752: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P3753: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P3754: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P3755: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P3756: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P3757: !BST [10] (maybe <- 0x4300004d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P3758: !DWLD [0] (Int)
ldx [%i0 + 0], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)

P3759: !BLD [0] (FP) (Branch target of P3726)
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
ba P3760
nop

TARGET3726:
ba RET3726
nop


P3760: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P3761: !PREFETCH [2] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i0 + 12] %asi, 1

P3762: !BST [8] (maybe <- 0x4300004e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P3763: !BLD [1] (FP)
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

P3764: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f11
fmovd %f36, %f12

P3765: !PREFETCH [13] (Int) (CBR)
prefetch [%i3 + 64], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3765
nop
RET3765:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P3766: !DWST [15] (maybe <- 0x380000d) (Int)
mov %l4, %l3 
sllx %l3, 32, %l3 
stx %l3, [%i3 + 192 ] 
add   %l4, 1, %l4

P3767: !DWST [11] (maybe <- 0x380000e) (Int)
mov %l4, %o5 
sllx %o5, 32, %o5 
stx %o5, [%i2 + 64 ] 
add   %l4, 1, %l4

P3768: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P3769: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P3770: !BST [13] (maybe <- 0x4300004f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P3771: !ST [8] (maybe <- 0x380000f) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P3772: !DWST [5] (maybe <- 0x3800010) (Int)
mov %l4, %l3 
stx %l3, [%i1 + 72]
add   %l4, 1, %l4

P3773: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P3774: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f14

P3775: !BST [0] (maybe <- 0x43000050) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3776: !CAS [1] (maybe <- 0x3800011) (Int)
add %i0, 4, %o5
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

P3777: !REPLACEMENT [10] (Int)
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

P3778: !PREFETCH [12] (Int) (CBR)
prefetch [%i3 + 0], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3778
nop
RET3778:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P3779: !BLD [0] (FP) (Branch target of P3913)
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
ba P3780
nop

TARGET3913:
ba RET3913
nop


P3780: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P3781: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P3782: !DWLD [9] (Int)
ldx [%i1 + 512], %o4
! move %o4(upper) -> %o4(upper)

P3783: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P3784: !CAS [1] (maybe <- 0x3800012) (Int)
add %i0, 4, %l6
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

P3785: !BST [4] (maybe <- 0x43000054) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P3786: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P3787: !BST [7] (maybe <- 0x43000055) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3788: !DWST [14] (maybe <- 0x3800013) (Int)
mov %l4, %l7 
sllx %l7, 32, %l7 
stx %l7, [%i3 + 128 ] 
add   %l4, 1, %l4

P3789: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f4

P3790: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P3791: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P3792: !PREFETCH [8] (Int) (CBR) (Branch target of P3883)
prefetch [%i1 + 256], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3792
nop
RET3792:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0

ba P3793
nop

TARGET3883:
ba RET3883
nop


P3793: !BST [0] (maybe <- 0x43000058) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3794: !BST [5] (maybe <- 0x4300005c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3795: !MEMBAR (Int)
membar #StoreLoad

P3796: !BST [8] (maybe <- 0x4300005f) (FP) (Branch target of P4070)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 
ba P3797
nop

TARGET4070:
ba RET4070
nop


P3797: !BST [4] (maybe <- 0x43000060) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P3798: !PREFETCH [13] (Int) (CBR)
prefetch [%i3 + 64], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3798
nop
RET3798:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P3799: !DWLD [14] (Int)
ldx [%i3 + 128], %l3
! move %l3(upper) -> %o0(lower)
srlx %l3, 32, %o5
or %o5, %o0, %o0

P3800: !DWLD [8] (Int)
ldx [%i1 + 256], %o1
! move %o1(upper) -> %o1(upper)

P3801: !ST [13] (maybe <- 0x3800014) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P3802: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P3803: !CASX [2] (maybe <- 0x3800015) (Int)
add %i0, 8, %o5
ldx [%o5], %l6
! move %l6(upper) -> %o1(lower)
srlx %o1, 32, %o1
sllx %o1, 32, %o1
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

P3804: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P3805: !BST [4] (maybe <- 0x43000061) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P3806: !BST [1] (maybe <- 0x43000062) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3807: !BST [2] (maybe <- 0x43000066) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3808: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P3809: !BST [7] (maybe <- 0x4300006a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3810: !BST [6] (maybe <- 0x4300006d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3811: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P3812: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f36, %f8

P3813: !ST [3] (maybe <- 0x3800016) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P3814: !REPLACEMENT [13] (Int)
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

P3815: !ST [7] (maybe <- 0x3800017) (Int) (LE)
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
stwa   %o5, [%i1 + 84] %asi
add   %l4, 1, %l4

P3816: !NOP (Int)
nop

P3817: !REPLACEMENT [8] (Int)
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

P3818: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P3819: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P3820: !BLD [0] (FP) (CBR)
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
be,pt  %xcc, TARGET3820
nop
RET3820:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P3821: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P3822: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f0
membar #Sync 
! 1 addresses covered

P3823: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P3824: !PREFETCH [13] (Int) (LE) (Branch target of P4120)
wr %g0, 0x88, %asi
prefetcha [%i3 + 64] %asi, 1
ba P3825
nop

TARGET4120:
ba RET4120
nop


P3825: !CASX [4] (maybe <- 0x3800018) (Int)
add %i0, 64, %o5
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

P3826: !BLD [2] (FP)
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

P3827: !BLD [5] (FP)
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

P3828: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P3829: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P3830: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P3831: !PREFETCH [5] (Int) (Branch target of P4087)
prefetch [%i1 + 76], 1
ba P3832
nop

TARGET4087:
ba RET4087
nop


P3832: !BST [15] (maybe <- 0x43000070) (FP) (CBR)
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
be,pt  %xcc, TARGET3832
nop
RET3832:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P3833: !BST [5] (maybe <- 0x43000071) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3834: !ST [14] (maybe <- 0x3800019) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P3835: !BLD [0] (FP)
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

P3836: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P3837: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P3838: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P3839: !BST [9] (maybe <- 0x43000074) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P3840: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P3841: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P3842: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P3843: !BLD [5] (FP)
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

P3844: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P3845: !BST [6] (maybe <- 0x43000075) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3846: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f0
membar #Sync 
! 1 addresses covered

P3847: !BST [3] (maybe <- 0x43000078) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3848: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P3849: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P3850: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P3851: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P3852: !LD [5] (Int)
lduw [%i1 + 76], %l7
! move %l7(lower) -> %o0(lower)
or %l7, %o0, %o0

P3853: !SWAP [4] (maybe <- 0x380001a) (Int)
mov %l4, %o1
swap  [%i0 + 64], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P3854: !DWST [0] (maybe <- 0x4300007c) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=21 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
std %f20, [%i0 + 0]

P3855: !DWLD [6] (Int)
ldx [%i1 + 80], %l7
! move %l7(upper) -> %o1(lower)
srlx %l7, 32, %l6
or %l6, %o1, %o1
! move %l7(lower) -> %o2(upper)
sllx %l7, 32, %o2

P3856: !BLD [0] (FP)
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

P3857: !REPLACEMENT [15] (Int)
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

P3858: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f7

P3859: !DWLD [1] (Int)
ldx [%i0 + 0], %o5
! move %o5(upper) -> %o2(lower)
srlx %o5, 32, %l7
or %l7, %o2, %o2
! move %o5(lower) -> %o3(upper)
sllx %o5, 32, %o3

P3860: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P3861: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P3862: !ST [7] (maybe <- 0x380001b) (Int) (LE)
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
stwa   %l3, [%i1 + 84] %asi
add   %l4, 1, %l4

P3863: !ST [1] (maybe <- 0x380001c) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P3864: !BST [9] (maybe <- 0x4300007e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P3865: !DWLD [9] (Int)
ldx [%i1 + 512], %l7
! move %l7(upper) -> %o3(lower)
srlx %l7, 32, %l6
or %l6, %o3, %o3

P3866: !BST [6] (maybe <- 0x4300007f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3867: !BST [11] (maybe <- 0x43000082) (FP) (Branch target of P3792)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 
ba P3868
nop

TARGET3792:
ba RET3792
nop


P3868: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P3869: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P3870: !BLD [5] (FP) (Branch target of P3914)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f9
fmovd %f36, %f10
ba P3871
nop

TARGET3914:
ba RET3914
nop


P3871: !REPLACEMENT [5] (Int)
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

P3872: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P3873: !BST [11] (maybe <- 0x43000083) (FP) (Branch target of P4105)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 
ba P3874
nop

TARGET4105:
ba RET4105
nop


P3874: !DWLD [2] (Int)
ldx [%i0 + 8], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P3875: !BST [10] (maybe <- 0x43000084) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P3876: !BLD [7] (FP)
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

P3877: !BST [10] (maybe <- 0x43000085) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P3878: !BST [0] (maybe <- 0x43000086) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3879: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P3880: !LD [2] (Int)
lduw [%i0 + 12], %o5
! move %o5(lower) -> %o4(lower)
or %o5, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P3881: !BST [9] (maybe <- 0x4300008a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P3882: !BST [13] (maybe <- 0x4300008b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P3883: !BST [1] (maybe <- 0x4300008c) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
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
be,pn  %xcc, TARGET3883
nop
RET3883:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P3884: !BST [3] (maybe <- 0x43000090) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3885: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P3886: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P3887: !BST [5] (maybe <- 0x43000094) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3888: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P3889: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P3890: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P3891: !CASX [12] (maybe <- 0x380001d) (Int)
add %i3, 0, %l6
ldx [%l6], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l3
sllx %l4, 32, %o1
casx [%l6], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P3892: !BST [7] (maybe <- 0x43000097) (FP) (Branch target of P4085)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 
ba P3893
nop

TARGET4085:
ba RET4085
nop


P3893: !BST [5] (maybe <- 0x4300009a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3894: !REPLACEMENT [10] (Int)
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

P3895: !BLD [14] (FP)
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

P3896: !LD [0] (Int)
lduw [%i0 + 0], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P3897: !MEMBAR (Int)
membar #StoreLoad

P3898: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P3899: !BST [0] (maybe <- 0x4300009d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3900: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f0
membar #Sync 
! 1 addresses covered

P3901: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P3902: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P3903: !PREFETCH [11] (Int) (Branch target of P3820)
prefetch [%i2 + 64], 1
ba P3904
nop

TARGET3820:
ba RET3820
nop


P3904: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P3905: !BLD [1] (FP)
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

P3906: !BST [10] (maybe <- 0x430000a1) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P3907: !DWST [2] (maybe <- 0x380001e) (Int)
mov %l4, %l6 
stx %l6, [%i0 + 8]
add   %l4, 1, %l4

P3908: !PREFETCH [3] (Int) (Branch target of P3996)
prefetch [%i0 + 32], 1
ba P3909
nop

TARGET3996:
ba RET3996
nop


P3909: !BST [13] (maybe <- 0x430000a2) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P3910: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f6

P3911: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f36, %f8

P3912: !BST [0] (maybe <- 0x430000a3) (FP) (Branch target of P3995)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 
ba P3913
nop

TARGET3995:
ba RET3995
nop


P3913: !BLD [4] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3913
nop
RET3913:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P3914: !PREFETCH [10] (Int) (CBR)
prefetch [%i2 + 32], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3914
nop
RET3914:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P3915: !PREFETCH [9] (Int) (CBR)
prefetch [%i1 + 512], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3915
nop
RET3915:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P3916: !BST [9] (maybe <- 0x430000a7) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P3917: !BST [13] (maybe <- 0x430000a8) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P3918: !BST [14] (maybe <- 0x430000a9) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P3919: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P3920: !BST [7] (maybe <- 0x430000aa) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3921: !BST [6] (maybe <- 0x430000ad) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3922: !DWLD [9] (Int) (Branch target of P3832)
ldx [%i1 + 512], %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l3
or %l3, %o2, %o2
ba P3923
nop

TARGET3832:
ba RET3832
nop


P3923: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P3924: !BLD [6] (FP) (CBR)
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
be,pn  %xcc, TARGET3924
nop
RET3924:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P3925: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P3926: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P3927: !BLD [0] (FP)
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

P3928: !BLD [3] (FP)
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

P3929: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P3930: !BST [1] (maybe <- 0x430000b0) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3931: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P3932: !BLD [1] (FP)
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

P3933: !BLD [0] (FP) (CBR)
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
be,pn  %xcc, TARGET3933
nop
RET3933:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P3934: !BST [6] (maybe <- 0x430000b4) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3935: !REPLACEMENT [7] (Int)
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

P3936: !BLD [0] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f0
membar #Sync 
! 4 addresses covered
fmovs %f3, %f2
fmovs %f8, %f3

P3937: !CASX [15] (maybe <- 0x380001f) (Int)
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

P3938: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P3939: !DWST [10] (maybe <- 0x430000b7) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
std %f20, [%i2 + 32]

P3940: !BST [1] (maybe <- 0x430000b8) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3941: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P3942: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P3943: !DWLD [10] (Int)
ldx [%i2 + 32], %o0
! move %o0(upper) -> %o0(upper)

P3944: !BST [14] (maybe <- 0x430000bc) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P3945: !PREFETCH [8] (Int) (Branch target of P4034)
prefetch [%i1 + 256], 1
ba P3946
nop

TARGET4034:
ba RET4034
nop


P3946: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P3947: !DWST [8] (maybe <- 0x3800020) (Int)
mov %l4, %l3 
sllx %l3, 32, %l3 
stx %l3, [%i1 + 256 ] 
add   %l4, 1, %l4

P3948: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P3949: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P3950: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P3951: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P3952: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f36, %f8

P3953: !BLD [5] (FP)
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

P3954: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P3955: !BST [0] (maybe <- 0x430000bd) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3956: !BST [5] (maybe <- 0x430000c1) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3957: !REPLACEMENT [13] (Int)
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

P3958: !BST [2] (maybe <- 0x430000c4) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3959: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f14

P3960: !REPLACEMENT [7] (Int)
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

P3961: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P3962: !ST [10] (maybe <- 0x430000c8) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i2 + 32 ]

P3963: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P3964: !BST [7] (maybe <- 0x430000c9) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3965: !MEMBAR (Int)
membar #StoreLoad

P3966: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P3967: !BLD [11] (FP)
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

P3968: !BST [8] (maybe <- 0x430000cc) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P3969: !BST [11] (maybe <- 0x430000cd) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P3970: !BST [15] (maybe <- 0x430000ce) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P3971: !ST [12] (maybe <- 0x3800021) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P3972: !DWLD [11] (FP)
ldd [%i2 + 64], %f0
! 1 addresses covered

P3973: !NOP (Int)
nop

P3974: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P3975: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f36, %f2

P3976: !BLD [6] (FP)
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

P3977: !PREFETCH [5] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i1 + 76] %asi, 1

P3978: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P3979: !BST [14] (maybe <- 0x430000cf) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P3980: !BST [11] (maybe <- 0x430000d0) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P3981: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P3982: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P3983: !CASX [12] (maybe <- 0x3800022) (Int)
add %i3, 0, %o5
ldx [%o5], %l6
! move %l6(upper) -> %o0(lower)
srlx %o0, 32, %o0
sllx %o0, 32, %o0
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

P3984: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P3985: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P3986: !BLD [0] (FP)
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

P3987: !REPLACEMENT [3] (Int)
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

P3988: !BST [11] (maybe <- 0x430000d1) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P3989: !BST [2] (maybe <- 0x430000d2) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3990: !BST [1] (maybe <- 0x430000d6) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3991: !BLD [0] (FP)
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

P3992: !BLD [11] (FP)
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

P3993: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P3994: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f0
membar #Sync 
! 1 addresses covered

P3995: !PREFETCH [15] (Int) (CBR)
prefetch [%i3 + 192], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3995
nop
RET3995:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P3996: !ST [8] (maybe <- 0x3800023) (Int) (CBR)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3996
nop
RET3996:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P3997: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P3998: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P3999: !BST [11] (maybe <- 0x430000da) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P4000: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f36, %f2

P4001: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P4002: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P4003: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P4004: !BST [6] (maybe <- 0x430000db) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P4005: !BST [2] (maybe <- 0x430000de) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P4006: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P4007: !LD [5] (Int) (Branch target of P4041)
lduw [%i1 + 76], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2
ba P4008
nop

TARGET4041:
ba RET4041
nop


P4008: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P4009: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P4010: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P4011: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P4012: !BST [1] (maybe <- 0x430000e2) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P4013: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P4014: !PREFETCH [4] (Int) (Branch target of P3778)
prefetch [%i0 + 64], 1
ba P4015
nop

TARGET3778:
ba RET3778
nop


P4015: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P4016: !BST [10] (maybe <- 0x430000e6) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P4017: !BST [14] (maybe <- 0x430000e7) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P4018: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f7

P4019: !BST [1] (maybe <- 0x430000e8) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P4020: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P4021: !BST [2] (maybe <- 0x430000ec) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P4022: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f8

P4023: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P4024: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P4025: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P4026: !BST [9] (maybe <- 0x430000f0) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P4027: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P4028: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P4029: !BST [9] (maybe <- 0x430000f1) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P4030: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P4031: !BLD [1] (FP)
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

P4032: !BST [5] (maybe <- 0x430000f2) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P4033: !CASX [11] (maybe <- 0x3800024) (Int) (LE)
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
ldxa [%o5] %asi, %l6
! move %l6(lower) -> %o3(upper)
sllx %l6, 32, %o3
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %l7
or %l7, %o3, %o3
mov  %l6, %l7
mov  %l3, %l6
casxa [%o5] %asi, %l7, %l6
! move %l6(lower) -> %o4(upper)
sllx %l6, 32, %o4
! move %l6(upper) -> %o4(lower)
srlx %l6, 32, %o5
or %o5, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5
add  %l4, 1, %l4

P4034: !PREFETCH [2] (Int) (CBR)
prefetch [%i0 + 12], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET4034
nop
RET4034:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P4035: !BST [9] (maybe <- 0x430000f5) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P4036: !DWLD [3] (Int)
ldx [%i0 + 32], %o0
! move %o0(upper) -> %o0(upper)

P4037: !BLD [1] (FP)
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

P4038: !BST [1] (maybe <- 0x430000f6) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P4039: !BST [10] (maybe <- 0x430000fa) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P4040: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P4041: !BST [15] (maybe <- 0x430000fb) (FP) (CBR)
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
be,pt  %xcc, TARGET4041
nop
RET4041:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P4042: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P4043: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P4044: !BLD [3] (FP)
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

P4045: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P4046: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P4047: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P4048: !BLD [0] (FP)
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

P4049: !BST [2] (maybe <- 0x430000fc) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P4050: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P4051: !BLD [15] (FP)
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

P4052: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f0
membar #Sync 
! 1 addresses covered

P4053: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P4054: !BST [15] (maybe <- 0x43000100) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P4055: !BST [9] (maybe <- 0x43000101) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P4056: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P4057: !DWLD [15] (Int)
ldx [%i3 + 192], %l3
! move %l3(upper) -> %o0(lower)
srlx %o0, 32, %o0
sllx %o0, 32, %o0
srlx %l3, 32, %o5
or %o5, %o0, %o0

P4058: !LD [11] (Int) (CBR)
lduw [%i2 + 64], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET4058
nop
RET4058:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P4059: !BST [3] (maybe <- 0x43000102) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P4060: !BST [10] (maybe <- 0x43000106) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P4061: !BST [3] (maybe <- 0x43000107) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P4062: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P4063: !BLD [1] (FP)
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

P4064: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P4065: !CASX [4] (maybe <- 0x3800025) (Int)
add %i0, 64, %l7
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

P4066: !BST [8] (maybe <- 0x4300010b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P4067: !BST [5] (maybe <- 0x4300010c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P4068: !BST [5] (maybe <- 0x4300010f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P4069: !LD [15] (Int)
lduw [%i3 + 192], %o5
! move %o5(lower) -> %o3(lower)
or %o5, %o3, %o3

P4070: !BLD [7] (FP) (CBR)
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
be,pn  %xcc, TARGET4070
nop
RET4070:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P4071: !BST [14] (maybe <- 0x43000112) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P4072: !BST [10] (maybe <- 0x43000113) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P4073: !REPLACEMENT [3] (Int)
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

P4074: !BLD [2] (FP)
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

P4075: !BLD [1] (FP)
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

P4076: !BST [15] (maybe <- 0x43000114) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P4077: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P4078: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P4079: !BST [2] (maybe <- 0x43000115) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P4080: !BST [9] (maybe <- 0x43000119) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P4081: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f0
membar #Sync 
! 1 addresses covered

P4082: !LD [1] (Int)
lduw [%i0 + 4], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P4083: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P4084: !ST [1] (maybe <- 0x3800026) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P4085: !BST [6] (maybe <- 0x4300011a) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
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
be,pt  %xcc, TARGET4085
nop
RET4085:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P4086: !BLD [3] (FP)
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

P4087: !PREFETCH [10] (Int) (CBR)
prefetch [%i2 + 32], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET4087
nop
RET4087:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P4088: !BST [8] (maybe <- 0x4300011d) (FP) (Branch target of P3715)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 
ba P4089
nop

TARGET3715:
ba RET3715
nop


P4089: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P4090: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P4091: !BST [2] (maybe <- 0x4300011e) (FP) (Branch target of P4058)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 
ba P4092
nop

TARGET4058:
ba RET4058
nop


P4092: !BLD [7] (FP)
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

P4093: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P4094: !BLD [6] (FP) (Branch target of P3915)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f9
fmovd %f36, %f10
ba P4095
nop

TARGET3915:
ba RET3915
nop


P4095: !BLD [2] (FP)
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

P4096: !BST [0] (maybe <- 0x43000122) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P4097: !BST [0] (maybe <- 0x43000126) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P4098: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P4099: !BLD [3] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f0
membar #Sync 
! 4 addresses covered
fmovs %f3, %f2
fmovs %f8, %f3

P4100: !BLD [2] (FP)
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

P4101: !BLD [0] (FP)
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

P4102: !REPLACEMENT [7] (Int)
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

P4103: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P4104: !REPLACEMENT [6] (Int)
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

P4105: !BST [1] (maybe <- 0x4300012a) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
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
be,pn  %xcc, TARGET4105
nop
RET4105:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P4106: !BST [9] (maybe <- 0x4300012e) (FP) (CBR)
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
be,pt  %xcc, TARGET4106
nop
RET4106:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P4107: !BST [10] (maybe <- 0x4300012f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P4108: !BLD [7] (FP)
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

P4109: !CAS [5] (maybe <- 0x3800027) (Int)
add %i1, 76, %o5
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

P4110: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f0
membar #Sync 
! 1 addresses covered

P4111: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f36, %f2

P4112: !BST [6] (maybe <- 0x43000130) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P4113: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P4114: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P4115: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P4116: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P4117: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P4118: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P4119: !PREFETCH [1] (Int) (CBR)
prefetch [%i0 + 4], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET4119
nop
RET4119:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P4120: !MEMBAR (Int) (CBR)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET4120
nop
RET4120:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P4121: !LD [0] (Int)
lduw [%i0 + 0], %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0

P4122: !LD [1] (Int)
lduw [%i0 + 4], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P4123: !LD [2] (Int)
lduw [%i0 + 12], %l3
! move %l3(lower) -> %o1(lower)
or %l3, %o1, %o1

P4124: !LD [3] (Int)
lduw [%i0 + 32], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P4125: !LD [4] (Int)
lduw [%i0 + 64], %l3
! move %l3(lower) -> %o2(lower)
or %l3, %o2, %o2

P4126: !LD [5] (Int) (CBR)
lduw [%i1 + 76], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET4126
nop
RET4126:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P4127: !LD [6] (Int)
lduw [%i1 + 80], %l6
! move %l6(lower) -> %o3(lower)
or %l6, %o3, %o3

P4128: !LD [7] (Int)
lduw [%i1 + 84], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P4129: !LD [8] (Int)
lduw [%i1 + 256], %l6
! move %l6(lower) -> %o4(lower)
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P4130: !LD [9] (Int)
lduw [%i1 + 512], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P4131: !LD [10] (Int)
lduw [%i2 + 32], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

P4132: !LD [11] (FP)
ld [%i2 + 64], %f5
! 1 addresses covered

P4133: !LD [12] (Int)
lduw [%i3 + 0], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P4134: !LD [13] (Int)
lduw [%i3 + 64], %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1

P4135: !LD [14] (Int)
lduw [%i3 + 128], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P4136: !LD [15] (Int)
lduw [%i3 + 192], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2

END_NODES7: ! Test istream for CPU 7 ends
sethi %hi(0xdead0e0f), %l7
or    %l7, %lo(0xdead0e0f), %l7
! move %l7(lower) -> %o3(upper)
sllx %l7, 32, %o3
stw %l7, [%i5] 
ld [%i5], %f6
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

restore
retl
nop

