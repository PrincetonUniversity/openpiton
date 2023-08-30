// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tsotool_diag6_050903.s
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
! GEN.N_INSTR_PER_PROC 1000
! GEN.AVG_LOOP_SIZE 512
! GEN.AVG_LOOP_ITER 10
! GEN.SEED 87
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
! WT.BLD 0
! WT.DWLD 10
! WT.QWLD 0
! WT.AQLD 0
! WT.ST 100
! WT.BST 0
! WT.BSTC 0
! WT.DWST 10
! WT.QWST 0
! WT.SWAP 3
! WT.CAS 50
! WT.CASX 50
! WT.ASI_L2_FLUSH 0
! WT.FLUSHI 0
! WT.MEMBAR 5
! WT.PREFETCH 100
! WT.NOP 1
! DBG.WRITE_RESULTS_FILE Y
! ADV.L2_WAYS 24
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
	.skip 24 * REGION_SIZE_RTL	 ! replacement area
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
! 1000 (dynamic) instruction sequence begins
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

! Initialize LFSR to 0x3da9^4
sethi %hi(0x3da9), %l0
or    %l0, %lo(0x3da9), %l0
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

P1: !CASX [3] (maybe <- 0x1) (Int) (Loop entry) (CBR) (Branch target of P579)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_0:
add %i0, 32, %l7
ldx [%l7], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l6
sllx %l4, 32, %o1
casx [%l7], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1
nop
RET1:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0

ba P2
nop

TARGET579:
ba RET579
nop


P2: !CASX [1] (maybe <- 0x2) (Int)
add %i0, 0, %o5
ldx [%o5], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov %o2, %l7
sllx %l4, 32, %o3
add  %l4, 1, %l4
or   %l4, %o3, %o3
casx [%o5], %l7, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4

P3: !ST [8] (maybe <- 0x4) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P4: !ST [12] (maybe <- 0x5) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P5: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P6: !ST [8] (maybe <- 0x6) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P7: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P8: !ST [10] (maybe <- 0x7) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P9: !CAS [14] (maybe <- 0x8) (Int)
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

P10: !ST [7] (maybe <- 0x9) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P11: !PREFETCH [3] (Int) (CBR)
prefetch [%i0 + 32], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET11
nop
RET11:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P12: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P13: !CAS [3] (maybe <- 0xa) (Int)
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

P14: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P15: !DWST [5] (maybe <- 0xb) (Int)
mov %l4, %l7 
stx %l7, [%i1 + 72]
add   %l4, 1, %l4

P16: !CAS [2] (maybe <- 0xc) (Int) (Branch target of P844)
add %i0, 12, %l7
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
ba P17
nop

TARGET844:
ba RET844
nop


P17: !CAS [10] (maybe <- 0xd) (Int)
add %i2, 32, %l7
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

P18: !CAS [8] (maybe <- 0xe) (Int)
add %i1, 256, %l7
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

P19: !PREFETCH [6] (Int) (Branch target of P130)
prefetch [%i1 + 80], 1
ba P20
nop

TARGET130:
ba RET130
nop


P20: !ST [10] (maybe <- 0xf) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P21: !ST [1] (maybe <- 0x10) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P22: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P23: !ST [12] (maybe <- 0x11) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P24: !CAS [8] (maybe <- 0x12) (Int)
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

P25: !REPLACEMENT [2] (Int)
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

P26: !CAS [4] (maybe <- 0x13) (Int)
add %i0, 64, %l7
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

P27: !SWAP [6] (maybe <- 0x14) (Int)
mov %l4, %o1
swap  [%i1 + 80], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P28: !ST [3] (maybe <- 0x15) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P29: !DWST [4] (maybe <- 0x16) (Int)
mov %l4, %o5 
sllx %o5, 32, %o5 
stx %o5, [%i0 + 64 ] 
add   %l4, 1, %l4

P30: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P31: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P32: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P33: !ST [11] (maybe <- 0x17) (Int) (CBR)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET33
nop
RET33:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P34: !DWST [5] (maybe <- 0x18) (Int)
mov %l4, %l7 
stx %l7, [%i1 + 72]
add   %l4, 1, %l4

P35: !CASX [0] (maybe <- 0x19) (Int)
add %i0, 0, %l7
ldx [%l7], %l3
! move %l3(upper) -> %o1(lower)
srlx %l3, 32, %l6
or %l6, %o1, %o1
! move %l3(lower) -> %o2(upper)
sllx %l3, 32, %o2
mov %l3, %l6
sllx %l4, 32, %l3
add  %l4, 1, %l4
or   %l4, %l3, %l3
casx [%l7], %l6, %l3
! move %l3(upper) -> %o2(lower)
srlx %l3, 32, %l7
or %l7, %o2, %o2
! move %l3(lower) -> %o3(upper)
sllx %l3, 32, %o3
add  %l4, 1, %l4

P36: !MEMBAR (Int)
membar #StoreLoad

P37: !SWAP [4] (maybe <- 0x1b) (Int)
mov %l4, %o5
swap  [%i0 + 64], %o5
! move %o5(lower) -> %o3(lower)
srl %o5, 0, %l6
or %l6, %o3, %o3
add   %l4, 1, %l4

P38: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P39: !ST [6] (maybe <- 0x1c) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P40: !REPLACEMENT [7] (Int)
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

P41: !CAS [9] (maybe <- 0x1d) (Int) (LE)
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
add %i1, 512, %o5
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

P42: !DWLD [5] (FP)
ldd [%i1 + 72], %f0
! 1 addresses covered
fmovs %f1, %f0

P43: !ST [8] (maybe <- 0x1e) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P44: !ST [13] (maybe <- 0x1f) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P45: !ST [0] (maybe <- 0x3f800001) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i0 + 0 ]

P46: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P47: !ST [1] (maybe <- 0x20) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P48: !ST [1] (maybe <- 0x21) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P49: !ST [15] (maybe <- 0x3f800002) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i3 + 192 ]

P50: !ST [4] (maybe <- 0x22) (Int) (Branch target of P616)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4
ba P51
nop

TARGET616:
ba RET616
nop


P51: !CAS [1] (maybe <- 0x23) (Int)
add %i0, 4, %l3
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

P52: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P53: !PREFETCH [15] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i3 + 192] %asi, 1

P54: !CAS [10] (maybe <- 0x24) (Int)
add %i2, 32, %l3
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

P55: !ST [10] (maybe <- 0x25) (Int) (LE)
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
stwa   %o5, [%i2 + 32] %asi
add   %l4, 1, %l4

P56: !CAS [12] (maybe <- 0x26) (Int)
add %i3, 0, %o5
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

P57: !CASX [8] (maybe <- 0x27) (Int)
add %i1, 256, %o5
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

P58: !ST [10] (maybe <- 0x28) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P59: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P60: !ST [12] (maybe <- 0x29) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P61: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P62: !CASX [2] (maybe <- 0x2a) (Int)
add %i0, 8, %l6
ldx [%l6], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l3
mov %l4, %o1
casx [%l6], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P63: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P64: !CAS [1] (maybe <- 0x2b) (Int)
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

P65: !CAS [8] (maybe <- 0x2c) (Int)
add %i1, 256, %l6
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

P66: !REPLACEMENT [2] (Int)
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

P67: !ST [1] (maybe <- 0x2d) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P68: !PREFETCH [3] (Int) (CBR)
prefetch [%i0 + 32], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET68
nop
RET68:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P69: !REPLACEMENT [11] (Int)
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

P70: !DWLD [11] (Int)
ldx [%i2 + 64], %o4
! move %o4(upper) -> %o4(upper)

P71: !CAS [12] (maybe <- 0x2e) (Int)
add %i3, 0, %l6
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

P72: !CAS [4] (maybe <- 0x2f) (Int)
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

P73: !ST [13] (maybe <- 0x30) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P74: !CASX [13] (maybe <- 0x31) (Int)
add %i3, 64, %l3
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

P75: !CAS [6] (maybe <- 0x32) (Int)
add %i1, 80, %l3
lduw [%l3], %l7
mov %l7, %o5
! move %o5(lower) -> %o3(lower)
or %o5, %o3, %o3
mov %l4, %o4
cas [%l3], %o5, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P76: !ST [4] (maybe <- 0x33) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P77: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P78: !CAS [4] (maybe <- 0x34) (Int)
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

P79: !CASX [13] (maybe <- 0x35) (Int)
add %i3, 64, %o5
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

P80: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P81: !ST [10] (maybe <- 0x36) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P82: !CAS [12] (maybe <- 0x37) (Int)
add %i3, 0, %l7
lduw [%l7], %l3
mov %l3, %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2
mov %l4, %o3
cas [%l7], %l6, %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P83: !PREFETCH [0] (Int) (CBR)
prefetch [%i0 + 0], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET83
nop
RET83:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P84: !ST [12] (maybe <- 0x3f800003) (FP) (Branch target of P726)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i3 + 0 ]
ba P85
nop

TARGET726:
ba RET726
nop


P85: !ST [5] (maybe <- 0x3f800004) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i1 + 76 ]

P86: !MEMBAR (Int)
membar #StoreLoad

P87: !CASX [14] (maybe <- 0x38) (Int)
add %i3, 128, %l6
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

P88: !DWST [14] (maybe <- 0x39) (Int)
mov %l4, %l3 
sllx %l3, 32, %l3 
stx %l3, [%i3 + 128 ] 
add   %l4, 1, %l4

P89: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P90: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P91: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P92: !CAS [10] (maybe <- 0x3a) (Int)
add %i2, 32, %l3
lduw [%l3], %l7
mov %l7, %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0
mov %l4, %o1
cas [%l3], %o5, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P93: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P94: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P95: !ST [12] (maybe <- 0x3b) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P96: !PREFETCH [3] (Int) (Branch target of P687)
prefetch [%i0 + 32], 1
ba P97
nop

TARGET687:
ba RET687
nop


P97: !CASX [6] (maybe <- 0x3c) (Int)
add %i1, 80, %o5
ldx [%o5], %l6
! move %l6(upper) -> %o1(lower)
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

P98: !DWST [10] (maybe <- 0x3e) (Int) (LE)
wr %g0, 0x88, %asi
! Change single-word-level endianess (big endian <-> little endian) 
sethi %hi(0xff00ff00), %l7
or %l7, %lo(0xff00ff00), %l7
and %l4, %l7, %l3
srl %l3, 8, %l3
sll %l4, 8, %o5
and %o5, %l7, %o5
or %o5, %l3, %o5
srl %o5, 16, %l3
sll %o5, 16, %o5
srl %o5, 0, %o5
or %o5, %l3, %o5
stxa %o5, [%i2 + 32 ] %asi
add   %l4, 1, %l4

P99: !ST [6] (maybe <- 0x3f) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P100: !CASX [13] (maybe <- 0x40) (Int) (CBR)
add %i3, 64, %l6
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

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET100
nop
RET100:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P101: !CAS [9] (maybe <- 0x41) (Int) (LE) (Branch target of P677)
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
add %i1, 512, %l7
lduwa [%l7] %asi, %l3
mov %l3, %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0
mov %o5, %o1
casa [%l7] %asi, %l6, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4
ba P102
nop

TARGET677:
ba RET677
nop


P102: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P103: !ST [4] (maybe <- 0x42) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P104: !CASX [1] (maybe <- 0x43) (Int)
add %i0, 0, %l6
ldx [%l6], %o5
! move %o5(upper) -> %o1(lower)
srlx %o5, 32, %l3
or %l3, %o1, %o1
! move %o5(lower) -> %o2(upper)
sllx %o5, 32, %o2
mov %o5, %l3
sllx %l4, 32, %o5
add  %l4, 1, %l4
or   %l4, %o5, %o5
casx [%l6], %l3, %o5
! move %o5(upper) -> %o2(lower)
srlx %o5, 32, %l6
or %l6, %o2, %o2
! move %o5(lower) -> %o3(upper)
sllx %o5, 32, %o3
add  %l4, 1, %l4

P105: !ST [13] (maybe <- 0x45) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P106: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P107: !ST [8] (maybe <- 0x46) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P108: !CAS [11] (maybe <- 0x47) (Int)
add %i2, 64, %o5
lduw [%o5], %l6
mov %l6, %l7
! move %l7(lower) -> %o3(lower)
or %l7, %o3, %o3
mov %l4, %o4
cas [%o5], %l7, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P109: !CAS [12] (maybe <- 0x48) (Int)
add %i3, 0, %o5
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

P110: !ST [8] (maybe <- 0x49) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P111: !PREFETCH [14] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i3 + 128] %asi, 1

P112: !PREFETCH [12] (Int) (CBR)
prefetch [%i3 + 0], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET112
nop
RET112:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P113: !ST [8] (maybe <- 0x4a) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P114: !CAS [3] (maybe <- 0x4b) (Int)
add %i0, 32, %l7
lduw [%l7], %l3
mov %l3, %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0
mov %l4, %o1
cas [%l7], %l6, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P115: !DWST [0] (maybe <- 0x4c) (Int)
sllx %l4, 32, %l6 
add   %l4, 1, %l4
or %l6, %l4, %l6
stx %l6, [%i0 + 0]
add   %l4, 1, %l4

P116: !CAS [6] (maybe <- 0x4e) (Int)
add %i1, 80, %l6
lduw [%l6], %o5
mov %o5, %l3
! move %l3(lower) -> %o1(lower)
or %l3, %o1, %o1
mov %l4, %o2
cas [%l6], %l3, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P117: !LD [0] (Int) (CBR)
lduw [%i0 + 0], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET117
nop
RET117:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P118: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P119: !CAS [2] (maybe <- 0x4f) (Int)
add %i0, 12, %l3
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

P120: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P121: !CAS [9] (maybe <- 0x50) (Int)
add %i1, 512, %l3
lduw [%l3], %o4
mov %o4, %o5
! move %o5(lower) -> %o4(upper)
sllx %o5, 32, %o4
mov %l4, %l7
cas [%l3], %o5, %l7
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

P122: !REPLACEMENT [13] (Int)
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

P123: !ST [0] (maybe <- 0x3f800005) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i0 + 0 ]

P124: !CASX [1] (maybe <- 0x51) (Int)
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

P125: !CASX [12] (maybe <- 0x53) (Int)
add %i3, 0, %l7
ldx [%l7], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov  %o2, %l6
sllx %l4, 32, %o3
casx [%l7], %l6, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4

P126: !CASX [1] (maybe <- 0x54) (Int)
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

P127: !CASX [0] (maybe <- 0x56) (Int)
add %i0, 0, %l7
ldx [%l7], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
mov %o1, %l6
sllx %l4, 32, %o2
add  %l4, 1, %l4
or   %l4, %o2, %o2
casx [%l7], %l6, %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
add  %l4, 1, %l4

P128: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P129: !ST [8] (maybe <- 0x58) (Int) (LE)
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
stwa   %l6, [%i1 + 256] %asi
add   %l4, 1, %l4

P130: !ST [8] (maybe <- 0x59) (Int) (CBR)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET130
nop
RET130:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P131: !ST [1] (maybe <- 0x5a) (Int) (CBR)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET131
nop
RET131:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P132: !CAS [1] (maybe <- 0x5b) (Int)
add %i0, 4, %l6
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

P133: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P134: !PREFETCH [4] (Int) (Branch target of P68)
prefetch [%i0 + 64], 1
ba P135
nop

TARGET68:
ba RET68
nop


P135: !ST [3] (maybe <- 0x5c) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P136: !CAS [7] (maybe <- 0x5d) (Int) (LE)
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
add %i1, 84, %l3
lduwa [%l3] %asi, %o4
mov %o4, %o5
! move %o5(lower) -> %o4(upper)
sllx %o5, 32, %o4
mov %l6, %l7
casa [%l3] %asi, %o5, %l7
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

P137: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P138: !ST [14] (maybe <- 0x5e) (Int) (LE)
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
stwa   %o5, [%i3 + 128] %asi
add   %l4, 1, %l4

P139: !ST [7] (maybe <- 0x5f) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P140: !DWLD [6] (Int)
ldx [%i1 + 80], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)

P141: !CAS [6] (maybe <- 0x60) (Int)
add %i1, 80, %l3
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

P142: !DWST [3] (maybe <- 0x61) (Int)
mov %l4, %o5 
sllx %o5, 32, %o5 
stx %o5, [%i0 + 32 ] 
add   %l4, 1, %l4

P143: !ST [13] (maybe <- 0x62) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P144: !CASX [6] (maybe <- 0x63) (Int)
add %i1, 80, %l7
ldx [%l7], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov %o2, %l6
sllx %l4, 32, %o3
add  %l4, 1, %l4
or   %l4, %o3, %o3
casx [%l7], %l6, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4

P145: !ST [0] (maybe <- 0x65) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P146: !ST [9] (maybe <- 0x66) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P147: !CASX [9] (maybe <- 0x67) (Int)
add %i1, 512, %l3
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

P148: !PREFETCH [0] (Int) (LE) (Branch target of P112)
wr %g0, 0x88, %asi
prefetcha [%i0 + 0] %asi, 1
ba P149
nop

TARGET112:
ba RET112
nop


P149: !ST [3] (maybe <- 0x68) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P150: !ST [2] (maybe <- 0x69) (Int) (Branch target of P820)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4
ba P151
nop

TARGET820:
ba RET820
nop


P151: !ST [12] (maybe <- 0x6a) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P152: !ST [11] (maybe <- 0x6b) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P153: !CAS [2] (maybe <- 0x6c) (Int) (CBR)
add %i0, 12, %l3
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
be,pn  %xcc, TARGET153
nop
RET153:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P154: !CAS [13] (maybe <- 0x6d) (Int)
add %i3, 64, %l6
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

P155: !CAS [5] (maybe <- 0x6e) (Int)
add %i1, 76, %l6
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

P156: !ST [0] (maybe <- 0x6f) (Int) (Branch target of P174)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4
ba P157
nop

TARGET174:
ba RET174
nop


P157: !CASX [4] (maybe <- 0x70) (Int)
add %i0, 64, %l3
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

P158: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P159: !CAS [6] (maybe <- 0x71) (Int)
add %i1, 80, %l3
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

P160: !ST [4] (maybe <- 0x72) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P161: !CAS [14] (maybe <- 0x73) (Int)
add %i3, 128, %o5
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

P162: !ST [1] (maybe <- 0x74) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P163: !CAS [15] (maybe <- 0x75) (Int)
add %i3, 192, %l7
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

P164: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P165: !CASX [3] (maybe <- 0x76) (Int)
add %i0, 32, %l7
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
sllx %l4, 32, %o0
casx [%l7], %l6, %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
add  %l4, 1, %l4

P166: !ST [9] (maybe <- 0x77) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P167: !PREFETCH [13] (Int) (CBR) (Branch target of P33)
prefetch [%i3 + 64], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET167
nop
RET167:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0

ba P168
nop

TARGET33:
ba RET33
nop


P168: !ST [13] (maybe <- 0x78) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P169: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P170: !CAS [10] (maybe <- 0x79) (Int) (LE)
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
add %i2, 32, %l6
lduwa [%l6] %asi, %o1
mov %o1, %l3
! move %l3(lower) -> %o1(upper)
sllx %l3, 32, %o1
mov %l7, %o5
casa [%l6] %asi, %l3, %o5
! move %o5(lower) -> %o1(lower)
srl %o5, 0, %l6
or %l6, %o1, %o1
add   %l4, 1, %l4

P171: !ST [6] (maybe <- 0x7a) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P172: !CAS [12] (maybe <- 0x7b) (Int)
add %i3, 0, %l3
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

P173: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P174: !ST [7] (maybe <- 0x7c) (Int) (CBR)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET174
nop
RET174:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P175: !DWST [7] (maybe <- 0x7d) (Int)
sllx %l4, 32, %o5 
add   %l4, 1, %l4
or %o5, %l4, %o5
stx %o5, [%i1 + 80]
add   %l4, 1, %l4

P176: !ST [14] (maybe <- 0x3f800006) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i3 + 128 ]

P177: !ST [0] (maybe <- 0x7f) (Int) (Branch target of P852)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4
ba P178
nop

TARGET852:
ba RET852
nop


P178: !CAS [13] (maybe <- 0x80) (Int)
add %i3, 64, %l6
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

P179: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P180: !DWST [7] (maybe <- 0x81) (Int)
sllx %l4, 32, %l3 
add   %l4, 1, %l4
or %l3, %l4, %l3
stx %l3, [%i1 + 80]
add   %l4, 1, %l4

P181: !ST [2] (maybe <- 0x3f800007) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i0 + 12 ]

P182: !ST [3] (maybe <- 0x83) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P183: !ST [6] (maybe <- 0x84) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P184: !CAS [3] (maybe <- 0x85) (Int)
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

P185: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P186: !LD [7] (Int) (Branch target of P574)
lduw [%i1 + 84], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
ba P187
nop

TARGET574:
ba RET574
nop


P187: !DWLD [9] (Int)
ldx [%i1 + 512], %o5
! move %o5(upper) -> %o0(lower)
srlx %o5, 32, %l7
or %l7, %o0, %o0

P188: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P189: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P190: !ST [10] (maybe <- 0x86) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P191: !CAS [9] (maybe <- 0x87) (Int)
add %i1, 512, %l3
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

P192: !MEMBAR (Int)
membar #StoreLoad

P193: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P194: !CAS [1] (maybe <- 0x88) (Int)
add %i0, 4, %l3
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

P195: !ST [8] (maybe <- 0x89) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P196: !CASX [9] (maybe <- 0x8a) (Int)
add %i1, 512, %o5
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

P197: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P198: !ST [4] (maybe <- 0x3f800008) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i0 + 64 ]

P199: !CAS [1] (maybe <- 0x8b) (Int)
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

P200: !CASX [12] (maybe <- 0x8c) (Int)
add %i3, 0, %l7
ldx [%l7], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
mov  %o1, %l6
sllx %l4, 32, %o2
casx [%l7], %l6, %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
add  %l4, 1, %l4

P201: !ST [1] (maybe <- 0x8d) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P202: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P203: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P204: !CASX [12] (maybe <- 0x8e) (Int) (LE)
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
add %i3, 0, %l6
ldxa [%l6] %asi, %o5
! move %o5(lower) -> %o3(upper)
sllx %o5, 32, %o3
! move %o5(upper) -> %o3(lower)
srlx %o5, 32, %l3
or %l3, %o3, %o3
mov  %o5, %l3
mov  %l7, %o5
casxa [%l6] %asi, %l3, %o5
! move %o5(lower) -> %o4(upper)
sllx %o5, 32, %o4
! move %o5(upper) -> %o4(lower)
srlx %o5, 32, %l6
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5
add  %l4, 1, %l4

P205: !PREFETCH [8] (Int) (CBR)
prefetch [%i1 + 256], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET205
nop
RET205:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P206: !ST [0] (maybe <- 0x8f) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P207: !ST [15] (maybe <- 0x90) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P208: !ST [12] (maybe <- 0x91) (Int) (LE)
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

P209: !ST [9] (maybe <- 0x92) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P210: !CAS [0] (maybe <- 0x93) (Int)
add %i0, 0, %l7
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

P211: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P212: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P213: !ST [6] (maybe <- 0x94) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P214: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P215: !CASX [9] (maybe <- 0x95) (Int)
add %i1, 512, %l6
ldx [%l6], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
mov  %o1, %l3
sllx %l4, 32, %o2
casx [%l6], %l3, %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
add  %l4, 1, %l4

P216: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P217: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P218: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P219: !ST [9] (maybe <- 0x96) (Int) (Branch target of P100)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4
ba P220
nop

TARGET100:
ba RET100
nop


P220: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P221: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P222: !ST [2] (maybe <- 0x97) (Int) (LE)
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
stwa   %o5, [%i0 + 12] %asi
add   %l4, 1, %l4

P223: !CAS [0] (maybe <- 0x98) (Int)
add %i0, 0, %o5
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

P224: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P225: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P226: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P227: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P228: !ST [10] (maybe <- 0x99) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P229: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P230: !ST [3] (maybe <- 0x9a) (Int) (LE)
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

P231: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P232: !ST [10] (maybe <- 0x9b) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P233: !PREFETCH [1] (Int) (Branch target of P846)
prefetch [%i0 + 4], 1
ba P234
nop

TARGET846:
ba RET846
nop


P234: !CASX [3] (maybe <- 0x9c) (Int)
add %i0, 32, %l3
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

P235: !CAS [10] (maybe <- 0x9d) (Int)
add %i2, 32, %l3
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

P236: !SWAP [15] (maybe <- 0x9e) (Int) (Branch target of P868)
mov %l4, %o2
swap  [%i3 + 192], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4
ba P237
nop

TARGET868:
ba RET868
nop


P237: !CAS [1] (maybe <- 0x9f) (Int)
add %i0, 4, %o5
lduw [%o5], %l6
mov %l6, %l7
! move %l7(lower) -> %o2(lower)
or %l7, %o2, %o2
mov %l4, %o3
cas [%o5], %l7, %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P238: !DWLD [1] (Int)
ldx [%i0 + 0], %o5
! move %o5(upper) -> %o3(lower)
srlx %o5, 32, %l7
or %l7, %o3, %o3
! move %o5(lower) -> %o4(upper)
sllx %o5, 32, %o4

P239: !CASX [12] (maybe <- 0xa0) (Int)
add %i3, 0, %l6
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

P240: !CASX [12] (maybe <- 0xa1) (Int)
add %i3, 0, %l6
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

P241: !ST [0] (maybe <- 0xa2) (Int) (Branch target of P1)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4
ba P242
nop

TARGET1:
ba RET1
nop


P242: !ST [8] (maybe <- 0xa3) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P243: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P244: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P245: !PREFETCH [13] (Int) (CBR)
prefetch [%i3 + 64], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET245
nop
RET245:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P246: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P247: !ST [14] (maybe <- 0xa4) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P248: !ST [9] (maybe <- 0xa5) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P249: !ST [7] (maybe <- 0xa6) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P250: !CAS [13] (maybe <- 0xa7) (Int)
add %i3, 64, %l6
lduw [%l6], %o5
mov %o5, %l3
! move %l3(lower) -> %o3(lower)
or %l3, %o3, %o3
mov %l4, %o4
cas [%l6], %l3, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P251: !CASX [6] (maybe <- 0xa8) (Int)
add %i1, 80, %l6
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
mov %o5, %l3
sllx %l4, 32, %o5
add  %l4, 1, %l4
or   %l4, %o5, %o5
casx [%l6], %l3, %o5
! move %o5(upper) -> %o0(lower)
srlx %o5, 32, %l6
or %l6, %o0, %o0
! move %o5(lower) -> %o1(upper)
sllx %o5, 32, %o1
add  %l4, 1, %l4

P252: !DWST [14] (maybe <- 0xaa) (Int)
mov %l4, %l3 
sllx %l3, 32, %l3 
stx %l3, [%i3 + 128 ] 
add   %l4, 1, %l4

P253: !PREFETCH [12] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i3 + 0] %asi, 1

P254: !CAS [4] (maybe <- 0xab) (Int)
add %i0, 64, %l3
lduw [%l3], %l7
mov %l7, %o5
! move %o5(lower) -> %o1(lower)
or %o5, %o1, %o1
mov %l4, %o2
cas [%l3], %o5, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P255: !MEMBAR (Int)
membar #StoreLoad

P256: !ST [4] (maybe <- 0x3f800009) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i0 + 64 ]

P257: !CASX [7] (maybe <- 0xac) (Int)
add %i1, 80, %o5
ldx [%o5], %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l7
or %l7, %o2, %o2
! move %l6(lower) -> %o3(upper)
sllx %l6, 32, %o3
mov %l6, %l7
sllx %l4, 32, %l6
add  %l4, 1, %l4
or   %l4, %l6, %l6
casx [%o5], %l7, %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %o5
or %o5, %o3, %o3
! move %l6(lower) -> %o4(upper)
sllx %l6, 32, %o4
add  %l4, 1, %l4

P258: !ST [12] (maybe <- 0xae) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P259: !REPLACEMENT [3] (Int)
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

P260: !ST [14] (maybe <- 0x3f80000a) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i3 + 128 ]

P261: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P262: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P263: !CAS [3] (maybe <- 0xaf) (Int)
add %i0, 32, %l3
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

P264: !ST [5] (maybe <- 0xb0) (Int) (LE)
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
stwa   %o5, [%i1 + 76] %asi
add   %l4, 1, %l4

P265: !CASX [7] (maybe <- 0xb1) (Int)
add %i1, 80, %o5
ldx [%o5], %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l7
or %l7, %o0, %o0
! move %l6(lower) -> %o1(upper)
sllx %l6, 32, %o1
mov %l6, %l7
sllx %l4, 32, %l6
add  %l4, 1, %l4
or   %l4, %l6, %l6
casx [%o5], %l7, %l6
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %o5
or %o5, %o1, %o1
! move %l6(lower) -> %o2(upper)
sllx %l6, 32, %o2
add  %l4, 1, %l4

P266: !ST [7] (maybe <- 0xb3) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P267: !LD [13] (Int)
lduw [%i3 + 64], %l7
! move %l7(lower) -> %o2(lower)
or %l7, %o2, %o2

P268: !CAS [13] (maybe <- 0xb4) (Int)
add %i3, 64, %l3
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

P269: !ST [4] (maybe <- 0xb5) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P270: !PREFETCH [4] (Int) (Branch target of P952)
prefetch [%i0 + 64], 1
ba P271
nop

TARGET952:
ba RET952
nop


P271: !ST [9] (maybe <- 0xb6) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P272: !CAS [14] (maybe <- 0xb7) (Int)
add %i3, 128, %l7
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

P273: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P274: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P275: !REPLACEMENT [15] (Int)
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

P276: !ST [1] (maybe <- 0xb8) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P277: !REPLACEMENT [3] (Int)
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

P278: !ST [8] (maybe <- 0xb9) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P279: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P280: !MEMBAR (Int) (Branch target of P749)
membar #StoreLoad
ba P281
nop

TARGET749:
ba RET749
nop


P281: !ST [0] (maybe <- 0xba) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P282: !CASX [9] (maybe <- 0xbb) (Int)
add %i1, 512, %l6
ldx [%l6], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l3
sllx %l4, 32, %o1
casx [%l6], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P283: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P284: !ST [8] (maybe <- 0x3f80000b) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i1 + 256 ]

P285: !PREFETCH [9] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i1 + 512] %asi, 1

P286: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P287: !ST [4] (maybe <- 0xbc) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P288: !CAS [2] (maybe <- 0xbd) (Int) (LE) (Branch target of P131)
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
add %i0, 12, %o5
lduwa [%o5] %asi, %o2
mov %o2, %l7
! move %l7(lower) -> %o2(upper)
sllx %l7, 32, %o2
mov %l3, %l6
casa [%o5] %asi, %l7, %l6
! move %l6(lower) -> %o2(lower)
srl %l6, 0, %o5
or %o5, %o2, %o2
add   %l4, 1, %l4
ba P289
nop

TARGET131:
ba RET131
nop


P289: !ST [7] (maybe <- 0x3f80000c) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i1 + 84 ]

P290: !ST [10] (maybe <- 0x3f80000d) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i2 + 32 ]

P291: !ST [1] (maybe <- 0xbe) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P292: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P293: !ST [2] (maybe <- 0xbf) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P294: !PREFETCH [12] (Int) (Branch target of P904)
prefetch [%i3 + 0], 1
ba P295
nop

TARGET904:
ba RET904
nop


P295: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P296: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P297: !ST [1] (maybe <- 0xc0) (Int) (Branch target of P552)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4
ba P298
nop

TARGET552:
ba RET552
nop


P298: !CAS [7] (maybe <- 0xc1) (Int)
add %i1, 84, %l7
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

P299: !CAS [12] (maybe <- 0xc2) (Int)
add %i3, 0, %l7
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

P300: !ST [4] (maybe <- 0xc3) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P301: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P302: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P303: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P304: !ST [13] (maybe <- 0xc4) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P305: !ST [11] (maybe <- 0xc5) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P306: !ST [11] (maybe <- 0xc6) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P307: !DWST [2] (maybe <- 0xc7) (Int)
mov %l4, %l6 
stx %l6, [%i0 + 8]
add   %l4, 1, %l4

P308: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P309: !CASX [10] (maybe <- 0xc8) (Int)
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

P310: !ST [0] (maybe <- 0xc9) (Int) (CBR) (Branch target of P865)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET310
nop
RET310:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0

ba P311
nop

TARGET865:
ba RET865
nop


P311: !CASX [10] (maybe <- 0xca) (Int) (Branch target of P656)
add %i2, 32, %l6
ldx [%l6], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov  %o2, %l3
sllx %l4, 32, %o3
casx [%l6], %l3, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4
ba P312
nop

TARGET656:
ba RET656
nop


P312: !CASX [15] (maybe <- 0xcb) (Int)
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

P313: !REPLACEMENT [11] (Int)
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

P314: !ST [4] (maybe <- 0xcc) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P315: !ST [0] (maybe <- 0xcd) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P316: !ST [10] (maybe <- 0xce) (Int) (CBR)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET316
nop
RET316:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P317: !CAS [2] (maybe <- 0xcf) (Int) (LE)
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
lduwa [%l7] %asi, %o1
mov %o1, %l6
! move %l6(lower) -> %o1(upper)
sllx %l6, 32, %o1
mov %o5, %l3
casa [%l7] %asi, %l6, %l3
! move %l3(lower) -> %o1(lower)
srl %l3, 0, %l7
or %l7, %o1, %o1
add   %l4, 1, %l4

P318: !REPLACEMENT [0] (Int)
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

P319: !ST [14] (maybe <- 0x3f80000e) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i3 + 128 ]

P320: !ST [8] (maybe <- 0xd0) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P321: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P322: !REPLACEMENT [0] (Int) (CBR)
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
be,pt  %xcc, TARGET322
nop
RET322:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P323: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P324: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P325: !ST [1] (maybe <- 0xd1) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P326: !ST [7] (maybe <- 0xd2) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P327: !CASX [9] (maybe <- 0xd3) (Int)
add %i1, 512, %l6
ldx [%l6], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov  %o2, %l3
sllx %l4, 32, %o3
casx [%l6], %l3, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4

P328: !CASX [2] (maybe <- 0xd4) (Int)
add %i0, 8, %l6
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

P329: !ST [4] (maybe <- 0xd5) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P330: !PREFETCH [4] (Int) (CBR)
prefetch [%i0 + 64], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET330
nop
RET330:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P331: !CAS [5] (maybe <- 0xd6) (Int)
add %i1, 76, %l6
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

P332: !CASX [10] (maybe <- 0xd7) (Int)
add %i2, 32, %l6
ldx [%l6], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov  %o2, %l3
sllx %l4, 32, %o3
casx [%l6], %l3, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4

P333: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P334: !ST [8] (maybe <- 0xd8) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P335: !ST [15] (maybe <- 0xd9) (Int) (LE)
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
stwa   %o5, [%i3 + 192] %asi
add   %l4, 1, %l4

P336: !ST [4] (maybe <- 0xda) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P337: !DWST [1] (maybe <- 0xdb) (Int) (Branch target of P117)
sllx %l4, 32, %l6 
add   %l4, 1, %l4
or %l6, %l4, %l6
stx %l6, [%i0 + 0]
add   %l4, 1, %l4
ba P338
nop

TARGET117:
ba RET117
nop


P338: !CASX [3] (maybe <- 0xdd) (Int)
add %i0, 32, %l6
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

P339: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P340: !ST [6] (maybe <- 0xde) (Int) (CBR) (Branch target of P11)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET340
nop
RET340:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0

ba P341
nop

TARGET11:
ba RET11
nop


P341: !ST [3] (maybe <- 0x3f80000f) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i0 + 32 ]

P342: !ST [15] (maybe <- 0xdf) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P343: !PREFETCH [12] (Int) (Branch target of P340)
prefetch [%i3 + 0], 1
ba P344
nop

TARGET340:
ba RET340
nop


P344: !REPLACEMENT [9] (Int) (Branch target of P83)
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
ba P345
nop

TARGET83:
ba RET83
nop


P345: !ST [9] (maybe <- 0xe0) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P346: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P347: !CASX [6] (maybe <- 0xe1) (Int)
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

P348: !DWST [15] (maybe <- 0xe3) (Int)
mov %l4, %l3 
sllx %l3, 32, %l3 
stx %l3, [%i3 + 192 ] 
add   %l4, 1, %l4

P349: !DWLD [0] (Int)
ldx [%i0 + 0], %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)

P350: !ST [1] (maybe <- 0xe4) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P351: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P352: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P353: !SWAP [7] (maybe <- 0xe5) (Int)
mov %l4, %o4
swap  [%i1 + 84], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P354: !ST [2] (maybe <- 0xe6) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P355: !ST [3] (maybe <- 0xe7) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P356: !ST [10] (maybe <- 0xe8) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P357: !ST [3] (maybe <- 0xe9) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P358: !ST [11] (maybe <- 0xea) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P359: !ST [7] (maybe <- 0xeb) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P360: !ST [7] (maybe <- 0xec) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P361: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P362: !PREFETCH [6] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i1 + 80] %asi, 1

P363: !ST [1] (maybe <- 0xed) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P364: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P365: !ST [12] (maybe <- 0xee) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P366: !ST [7] (maybe <- 0xef) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P367: !ST [1] (maybe <- 0xf0) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P368: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P369: !SWAP [13] (maybe <- 0xf1) (Int)
mov %l4, %l7
swap  [%i3 + 64], %l7
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

P370: !ST [6] (maybe <- 0xf2) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P371: !ST [13] (maybe <- 0xf3) (Int) (CBR) (Branch target of P444)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET371
nop
RET371:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0

ba P372
nop

TARGET444:
ba RET444
nop


P372: !ST [1] (maybe <- 0x3f800010) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i0 + 4 ]

P373: !CASX [13] (maybe <- 0xf4) (Int)
add %i3, 64, %l7
ldx [%l7], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l6
sllx %l4, 32, %o1
casx [%l7], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P374: !SWAP [2] (maybe <- 0xf5) (Int)
mov %l4, %o2
swap  [%i0 + 12], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P375: !CASX [11] (maybe <- 0xf6) (Int)
add %i2, 64, %l6
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

P376: !CAS [12] (maybe <- 0xf7) (Int)
add %i3, 0, %l6
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

P377: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P378: !CASX [15] (maybe <- 0xf8) (Int)
add %i3, 192, %l6
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

P379: !CAS [12] (maybe <- 0xf9) (Int)
add %i3, 0, %l6
lduw [%l6], %o5
mov %o5, %l3
! move %l3(lower) -> %o2(lower)
or %l3, %o2, %o2
mov %l4, %o3
cas [%l6], %l3, %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P380: !CASX [14] (maybe <- 0xfa) (Int)
add %i3, 128, %l6
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

P381: !CAS [12] (maybe <- 0xfb) (Int)
add %i3, 0, %l6
lduw [%l6], %o5
mov %o5, %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0
mov %l4, %o1
cas [%l6], %l3, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P382: !ST [0] (maybe <- 0xfc) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P383: !CAS [11] (maybe <- 0xfd) (Int)
add %i2, 64, %l3
lduw [%l3], %l7
mov %l7, %o5
! move %o5(lower) -> %o1(lower)
or %o5, %o1, %o1
mov %l4, %o2
cas [%l3], %o5, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P384: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P385: !ST [14] (maybe <- 0xfe) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P386: !ST [2] (maybe <- 0x3f800011) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i0 + 12 ]

P387: !ST [10] (maybe <- 0xff) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P388: !CASX [13] (maybe <- 0x100) (Int)
add %i3, 64, %l6
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

P389: !CASX [4] (maybe <- 0x101) (Int)
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

P390: !PREFETCH [13] (Int) (Branch target of P396)
prefetch [%i3 + 64], 1
ba P391
nop

TARGET396:
ba RET396
nop


P391: !CASX [2] (maybe <- 0x102) (Int)
add %i0, 8, %l6
ldx [%l6], %o5
! move %o5(upper) -> %o1(lower)
srlx %o5, 32, %l3
or %l3, %o1, %o1
! move %o5(lower) -> %o2(upper)
sllx %o5, 32, %o2
mov  %o5, %l3
mov %l4, %o5
casx [%l6], %l3, %o5
! move %o5(upper) -> %o2(lower)
srlx %o5, 32, %l6
or %l6, %o2, %o2
! move %o5(lower) -> %o3(upper)
sllx %o5, 32, %o3
add  %l4, 1, %l4

P392: !PREFETCH [9] (Int) (Branch target of P639)
prefetch [%i1 + 512], 1
ba P393
nop

TARGET639:
ba RET639
nop


P393: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P394: !DWST [4] (maybe <- 0x103) (Int)
mov %l4, %l3 
sllx %l3, 32, %l3 
stx %l3, [%i0 + 64 ] 
add   %l4, 1, %l4

P395: !DWST [7] (maybe <- 0x104) (Int) (LE)
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

P396: !PREFETCH [10] (Int) (CBR)
prefetch [%i2 + 32], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET396
nop
RET396:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P397: !CASX [6] (maybe <- 0x106) (Int)
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

P398: !ST [11] (maybe <- 0x3f800012) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i2 + 64 ]

P399: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P400: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P401: !CASX [2] (maybe <- 0x108) (Int)
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

P402: !ST [3] (maybe <- 0x109) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P403: !ST [11] (maybe <- 0x10a) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P404: !ST [4] (maybe <- 0x10b) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P405: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P406: !LD [0] (Int) (LE)
wr %g0, 0x88, %asi
lduwa [%i0 + 0] %asi, %l3
! move %l3(lower) -> %o2(lower)
or %l3, %o2, %o2

P407: !CASX [11] (maybe <- 0x10c) (Int)
add %i2, 64, %l7
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

P408: !DWST [12] (maybe <- 0x10d) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 0 ] 
add   %l4, 1, %l4

P409: !ST [10] (maybe <- 0x10e) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P410: !ST [7] (maybe <- 0x10f) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P411: !CASX [9] (maybe <- 0x110) (Int)
add %i1, 512, %o5
ldx [%o5], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l7
sllx %l4, 32, %o1
casx [%o5], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P412: !CASX [3] (maybe <- 0x111) (Int) (LE)
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

P413: !REPLACEMENT [15] (Int) (Branch target of P436)
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
ba P414
nop

TARGET436:
ba RET436
nop


P414: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P415: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P416: !ST [8] (maybe <- 0x112) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P417: !ST [6] (maybe <- 0x113) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P418: !PREFETCH [4] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i0 + 64] %asi, 1

P419: !PREFETCH [6] (Int) (Branch target of P554)
prefetch [%i1 + 80], 1
ba P420
nop

TARGET554:
ba RET554
nop


P420: !CASX [14] (maybe <- 0x114) (Int)
add %i3, 128, %l3
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

P421: !REPLACEMENT [11] (Int)
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

P422: !CASX [13] (maybe <- 0x115) (Int)
add %i3, 64, %o5
ldx [%o5], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
mov  %o1, %l7
sllx %l4, 32, %o2
casx [%o5], %l7, %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
add  %l4, 1, %l4

P423: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P424: !CAS [13] (maybe <- 0x116) (Int)
add %i3, 64, %o5
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

P425: !ST [6] (maybe <- 0x3f800013) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i1 + 80 ]

P426: !ST [15] (maybe <- 0x117) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P427: !PREFETCH [7] (Int) (Branch target of P987)
prefetch [%i1 + 84], 1
ba P428
nop

TARGET987:
ba RET987
nop


P428: !DWLD [11] (Int)
ldx [%i2 + 64], %o4
! move %o4(upper) -> %o4(upper)

P429: !ST [15] (maybe <- 0x118) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P430: !ST [11] (maybe <- 0x119) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P431: !ST [9] (maybe <- 0x11a) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P432: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P433: !CASX [3] (maybe <- 0x11b) (Int)
add %i0, 32, %l3
ldx [%l3], %l7
! move %l7(upper) -> %o4(lower)
srlx %o4, 32, %o4
sllx %o4, 32, %o4
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

P434: !CASX [7] (maybe <- 0x11c) (Int)
add %i1, 80, %l3
ldx [%l3], %l7
! move %l7(upper) -> %o1(lower)
srlx %l7, 32, %o5
or %o5, %o1, %o1
! move %l7(lower) -> %o2(upper)
sllx %l7, 32, %o2
mov %l7, %o5
sllx %l4, 32, %l7
add  %l4, 1, %l4
or   %l4, %l7, %l7
casx [%l3], %o5, %l7
! move %l7(upper) -> %o2(lower)
srlx %l7, 32, %l3
or %l3, %o2, %o2
! move %l7(lower) -> %o3(upper)
sllx %l7, 32, %o3
add  %l4, 1, %l4

P435: !CASX [4] (maybe <- 0x11e) (Int)
add %i0, 64, %l3
ldx [%l3], %l7
! move %l7(upper) -> %o3(lower)
srlx %l7, 32, %o5
or %o5, %o3, %o3
! move %l7(lower) -> %o4(upper)
sllx %l7, 32, %o4
mov  %l7, %o5
sllx %l4, 32, %l7
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

P436: !DWLD [2] (Int) (CBR)
ldx [%i0 + 8], %l3
! move %l3(lower) -> %o0(lower)
srl %l3, 0, %o5
or %o5, %o0, %o0

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET436
nop
RET436:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P437: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P438: !CAS [4] (maybe <- 0x11f) (Int)
add %i0, 64, %o5
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

P439: !REPLACEMENT [0] (Int)
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

P440: !DWST [2] (maybe <- 0x120) (Int)
mov %l4, %l6 
stx %l6, [%i0 + 8]
add   %l4, 1, %l4

P441: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P442: !CASX [3] (maybe <- 0x121) (Int)
add %i0, 32, %l6
ldx [%l6], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov  %o2, %l3
sllx %l4, 32, %o3
casx [%l6], %l3, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4

P443: !PREFETCH [5] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i1 + 76] %asi, 1

P444: !ST [13] (maybe <- 0x122) (Int) (CBR)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET444
nop
RET444:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P445: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P446: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P447: !ST [11] (maybe <- 0x123) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P448: !CAS [7] (maybe <- 0x124) (Int)
add %i1, 84, %l3
lduw [%l3], %o4
mov %o4, %o5
! move %o5(lower) -> %o4(upper)
sllx %o5, 32, %o4
mov %l4, %l7
cas [%l3], %o5, %l7
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

P449: !ST [2] (maybe <- 0x125) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P450: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P451: !ST [12] (maybe <- 0x126) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P452: !CAS [11] (maybe <- 0x127) (Int)
add %i2, 64, %l7
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

P453: !LD [9] (Int)
lduw [%i1 + 512], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P454: !CASX [4] (maybe <- 0x128) (Int) (Branch target of P671)
add %i0, 64, %l3
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
ba P455
nop

TARGET671:
ba RET671
nop


P455: !ST [8] (maybe <- 0x129) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P456: !CAS [7] (maybe <- 0x12a) (Int)
add %i1, 84, %o5
lduw [%o5], %l6
mov %l6, %l7
! move %l7(lower) -> %o3(lower)
or %l7, %o3, %o3
mov %l4, %o4
cas [%o5], %l7, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P457: !CAS [1] (maybe <- 0x12b) (Int)
add %i0, 4, %o5
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

P458: !CASX [12] (maybe <- 0x12c) (Int)
add %i3, 0, %o5
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

P459: !CASX [4] (maybe <- 0x12d) (Int)
add %i0, 64, %o5
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

P460: !CAS [0] (maybe <- 0x12e) (Int)
add %i0, 0, %o5
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

P461: !REPLACEMENT [0] (Int)
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

P462: !ST [7] (maybe <- 0x12f) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P463: !ST [2] (maybe <- 0x3f800014) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i0 + 12 ]

P464: !ST [3] (maybe <- 0x130) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P465: !CASX [13] (maybe <- 0x131) (Int)
add %i3, 64, %o5
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

P466: !LD [15] (Int) (CBR)
lduw [%i3 + 192], %o5
! move %o5(lower) -> %o2(lower)
or %o5, %o2, %o2

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET466
nop
RET466:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P467: !ST [12] (maybe <- 0x132) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P468: !PREFETCH [0] (Int) (Branch target of P466)
prefetch [%i0 + 0], 1
ba P469
nop

TARGET466:
ba RET466
nop


P469: !DWLD [12] (Int)
ldx [%i3 + 0], %o3
! move %o3(upper) -> %o3(upper)

P470: !CAS [10] (maybe <- 0x133) (Int)
add %i2, 32, %o5
lduw [%o5], %l6
mov %l6, %l7
! move %l7(lower) -> %o3(lower)
srlx %o3, 32, %o3
sllx %o3, 32, %o3
or %l7, %o3, %o3
mov %l4, %o4
cas [%o5], %l7, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P471: !CASX [8] (maybe <- 0x134) (Int)
add %i1, 256, %o5
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

P472: !ST [11] (maybe <- 0x135) (Int) (CBR)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET472
nop
RET472:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P473: !ST [11] (maybe <- 0x3f800015) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i2 + 64 ]

P474: !CAS [7] (maybe <- 0x136) (Int)
add %i1, 84, %l7
lduw [%l7], %l3
mov %l3, %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1
mov %l4, %o2
cas [%l7], %l6, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P475: !CASX [5] (maybe <- 0x137) (Int)
add %i1, 72, %l7
ldx [%l7], %l3
! move %l3(upper) -> %o2(lower)
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

P476: !CASX [3] (maybe <- 0x138) (Int)
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

P477: !DWLD [9] (Int) (LE)
wr %g0, 0x88, %asi
ldxa [%i1 + 512] %asi, %l7
! move %l7(lower) -> %o1(lower)
srl %l7, 0, %l6
or %l6, %o1, %o1

P478: !DWLD [5] (Int)
ldx [%i1 + 72], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P479: !ST [2] (maybe <- 0x139) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P480: !LD [9] (Int)
lduw [%i1 + 512], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2

P481: !PREFETCH [9] (Int) (CBR)
prefetch [%i1 + 512], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET481
nop
RET481:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P482: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P483: !DWLD [8] (Int)
ldx [%i1 + 256], %o3
! move %o3(upper) -> %o3(upper)

P484: !DWST [8] (maybe <- 0x13a) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 256 ] 
add   %l4, 1, %l4

P485: !ST [4] (maybe <- 0x13b) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P486: !ST [5] (maybe <- 0x13c) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P487: !ST [11] (maybe <- 0x13d) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P488: !ST [15] (maybe <- 0x13e) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P489: !ST [2] (maybe <- 0x13f) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P490: !REPLACEMENT [3] (Int)
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

P491: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P492: !ST [0] (maybe <- 0x140) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P493: !CAS [3] (maybe <- 0x141) (Int)
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

P494: !ST [10] (maybe <- 0x142) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P495: !LD [11] (Int) (Branch target of P205)
lduw [%i2 + 64], %l6
! move %l6(lower) -> %o4(lower)
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5
ba P496
nop

TARGET205:
ba RET205
nop


P496: !SWAP [10] (maybe <- 0x143) (Int)
mov %l4, %o0
swap  [%i2 + 32], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
add   %l4, 1, %l4

P497: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P498: !ST [15] (maybe <- 0x144) (Int) (Branch target of P521)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4
ba P499
nop

TARGET521:
ba RET521
nop


P499: !CAS [6] (maybe <- 0x145) (Int)
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

P500: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P501: !ST [6] (maybe <- 0x146) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P502: !DWLD [15] (Int)
ldx [%i3 + 192], %l3
! move %l3(upper) -> %o1(lower)
srlx %l3, 32, %o5
or %o5, %o1, %o1

P503: !CASX [13] (maybe <- 0x147) (Int)
add %i3, 64, %l7
ldx [%l7], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov  %o2, %l6
sllx %l4, 32, %o3
casx [%l7], %l6, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4

P504: !CAS [4] (maybe <- 0x148) (Int) (LE)
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
add %i0, 64, %l7
lduwa [%l7] %asi, %o4
mov %o4, %l6
! move %l6(lower) -> %o4(upper)
sllx %l6, 32, %o4
mov %o5, %l3
casa [%l7] %asi, %l6, %l3
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

P505: !ST [5] (maybe <- 0x149) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P506: !ST [15] (maybe <- 0x14a) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P507: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P508: !ST [5] (maybe <- 0x14b) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P509: !ST [12] (maybe <- 0x14c) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P510: !CASX [9] (maybe <- 0x14d) (Int)
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

P511: !CAS [12] (maybe <- 0x14e) (Int) (CBR)
add %i3, 0, %l7
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

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET511
nop
RET511:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P512: !LD [3] (Int)
lduw [%i0 + 32], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P513: !LD [7] (Int)
lduw [%i1 + 84], %l6
! move %l6(lower) -> %o3(lower)
or %l6, %o3, %o3

P514: !LD [3] (Int)
lduw [%i0 + 32], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P515: !LD [0] (Int)
lduw [%i0 + 0], %l6
! move %l6(lower) -> %o4(lower)
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P516: !LD [11] (FP) (Branch target of P245)
ld [%i2 + 64], %f1
! 1 addresses covered
ba P517
nop

TARGET245:
ba RET245
nop


P517: !LD [10] (FP)
ld [%i2 + 32], %f2
! 1 addresses covered

P518: !LD [11] (FP) (CBR)
ld [%i2 + 64], %f3
! 1 addresses covered

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET518
nop
RET518:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P519: !LD [3] (FP)
ld [%i0 + 32], %f4
! 1 addresses covered

P520: !LD [13] (FP)
ld [%i3 + 64], %f5
! 1 addresses covered

P521: !LD [8] (FP) (CBR) (Branch target of P603)
ld [%i1 + 256], %f6
! 1 addresses covered

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET521
nop
RET521:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0

ba P522
nop

TARGET603:
ba RET603
nop


P522: !LD [0] (FP)
ld [%i0 + 0], %f7
! 1 addresses covered

P523: !LD [13] (FP)
ld [%i3 + 64], %f8
! 1 addresses covered

P524: !LD [3] (FP)
ld [%i0 + 32], %f9
! 1 addresses covered

P525: !LD [9] (FP)
ld [%i1 + 512], %f10
! 1 addresses covered

P526: !LD [6] (FP)
ld [%i1 + 80], %f11
! 1 addresses covered

P527: !LD [7] (FP)
ld [%i1 + 84], %f12
! 1 addresses covered

P528: !LD [15] (FP)
ld [%i3 + 192], %f13
! 1 addresses covered

P529: !LD [8] (FP)
ld [%i1 + 256], %f14
! 1 addresses covered

P530: !LD [5] (FP)
ld [%i1 + 76], %f15
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

P531: !PREFETCH [14] (Int) (Loop exit)
prefetch [%i3 + 128], 1
loop_exit_0_0:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_0
nop

P532: !CAS [14] (maybe <- 0x14f) (Int)
add %i3, 128, %l7
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

P533: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P534: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P535: !CASX [13] (maybe <- 0x150) (Int) (Branch target of P153)
add %i3, 64, %l7
ldx [%l7], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
mov  %o1, %l6
sllx %l4, 32, %o2
casx [%l7], %l6, %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
add  %l4, 1, %l4
ba P536
nop

TARGET153:
ba RET153
nop


P536: !DWLD [6] (Int)
ldx [%i1 + 80], %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)

P537: !ST [9] (maybe <- 0x151) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P538: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P539: !CASX [0] (maybe <- 0x152) (Int)
add %i0, 0, %o5
ldx [%o5], %o4
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5
mov %o4, %l7
sllx %l4, 32, %o0
add  %l4, 1, %l4
or   %l4, %o0, %o0
casx [%o5], %l7, %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
add  %l4, 1, %l4

P540: !ST [8] (maybe <- 0x154) (Int) (Branch target of P810)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4
ba P541
nop

TARGET810:
ba RET810
nop


P541: !CASX [11] (maybe <- 0x155) (Int)
add %i2, 64, %l7
ldx [%l7], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
mov  %o1, %l6
sllx %l4, 32, %o2
casx [%l7], %l6, %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
add  %l4, 1, %l4

P542: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P543: !CASX [8] (maybe <- 0x156) (Int)
add %i1, 256, %l7
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

P544: !DWLD [14] (FP)
ldd [%i3 + 128], %f0
! 1 addresses covered

P545: !CASX [5] (maybe <- 0x157) (Int)
add %i1, 72, %l7
ldx [%l7], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l6
mov %l4, %o1
casx [%l7], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P546: !ST [10] (maybe <- 0x158) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P547: !ST [0] (maybe <- 0x159) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P548: !ST [4] (maybe <- 0x3f800016) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i0 + 64 ]

P549: !CASX [2] (maybe <- 0x15a) (Int)
add %i0, 8, %o5
ldx [%o5], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov  %o2, %l7
mov %l4, %o3
casx [%o5], %l7, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4

P550: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P551: !CASX [9] (maybe <- 0x15b) (Int)
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

P552: !ST [0] (maybe <- 0x15c) (Int) (CBR)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET552
nop
RET552:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P553: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P554: !CASX [4] (maybe <- 0x15d) (Int) (CBR)
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

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET554
nop
RET554:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P555: !CASX [14] (maybe <- 0x15e) (Int)
add %i3, 128, %l3
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

P556: !LD [4] (Int)
lduw [%i0 + 64], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P557: !ST [9] (maybe <- 0x3f800017) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i1 + 512 ]

P558: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P559: !CAS [0] (maybe <- 0x15f) (Int)
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

P560: !ST [4] (maybe <- 0x160) (Int) (Branch target of P699)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4
ba P561
nop

TARGET699:
ba RET699
nop


P561: !CAS [4] (maybe <- 0x161) (Int)
add %i0, 64, %l3
lduw [%l3], %l7
mov %l7, %o5
! move %o5(lower) -> %o1(lower)
or %o5, %o1, %o1
mov %l4, %o2
cas [%l3], %o5, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P562: !ST [5] (maybe <- 0x162) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P563: !REPLACEMENT [11] (Int)
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

P564: !MEMBAR (Int)
membar #StoreLoad

P565: !CAS [1] (maybe <- 0x163) (Int)
add %i0, 4, %l7
lduw [%l7], %l3
mov %l3, %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2
mov %l4, %o3
cas [%l7], %l6, %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P566: !ST [9] (maybe <- 0x164) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P567: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P568: !CASX [9] (maybe <- 0x165) (Int)
add %i1, 512, %l6
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

P569: !CAS [0] (maybe <- 0x166) (Int)
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

P570: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P571: !ST [10] (maybe <- 0x167) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P572: !ST [9] (maybe <- 0x3f800018) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i1 + 512 ]

P573: !CASX [2] (maybe <- 0x168) (Int)
add %i0, 8, %o5
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

P574: !CASX [5] (maybe <- 0x169) (Int) (CBR)
add %i1, 72, %o5
ldx [%o5], %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %l7
or %l7, %o3, %o3
! move %l6(lower) -> %o4(upper)
sllx %l6, 32, %o4
mov  %l6, %l7
mov %l4, %l6
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

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET574
nop
RET574:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P575: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P576: !ST [13] (maybe <- 0x16a) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P577: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P578: !DWLD [10] (FP)
ldd [%i2 + 32], %f18
! 1 addresses covered
fmovs %f18, %f1

P579: !ST [15] (maybe <- 0x16b) (Int) (CBR)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET579
nop
RET579:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P580: !ST [12] (maybe <- 0x16c) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P581: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P582: !ST [14] (maybe <- 0x16d) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P583: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P584: !LD [12] (Int)
lduw [%i3 + 0], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

P585: !ST [10] (maybe <- 0x16e) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P586: !CASX [9] (maybe <- 0x16f) (Int)
add %i1, 512, %l7
ldx [%l7], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
mov  %o1, %l6
sllx %l4, 32, %o2
casx [%l7], %l6, %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
add  %l4, 1, %l4

P587: !CASX [14] (maybe <- 0x170) (Int)
add %i3, 128, %l7
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

P588: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P589: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P590: !PREFETCH [6] (Int) (Branch target of P1005)
prefetch [%i1 + 80], 1
ba P591
nop

TARGET1005:
ba RET1005
nop


P591: !REPLACEMENT [14] (Int)
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

P592: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P593: !ST [4] (maybe <- 0x171) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P594: !CAS [5] (maybe <- 0x172) (Int)
add %i1, 76, %l3
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

P595: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P596: !CAS [9] (maybe <- 0x173) (Int) (Branch target of P688)
add %i1, 512, %l3
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
ba P597
nop

TARGET688:
ba RET688
nop


P597: !ST [11] (maybe <- 0x174) (Int) (CBR)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET597
nop
RET597:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P598: !ST [3] (maybe <- 0x175) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P599: !CASX [15] (maybe <- 0x176) (Int)
add %i3, 192, %o5
ldx [%o5], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov  %o2, %l7
sllx %l4, 32, %o3
casx [%o5], %l7, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4

P600: !ST [13] (maybe <- 0x177) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P601: !ST [10] (maybe <- 0x178) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P602: !PREFETCH [13] (Int) (CBR)
prefetch [%i3 + 64], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET602
nop
RET602:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P603: !CAS [5] (maybe <- 0x179) (Int) (CBR)
add %i1, 76, %l7
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

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET603
nop
RET603:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P604: !CAS [7] (maybe <- 0x17a) (Int)
add %i1, 84, %o5
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

P605: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P606: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P607: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P608: !ST [0] (maybe <- 0x17b) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P609: !CAS [8] (maybe <- 0x17c) (Int)
add %i1, 256, %l7
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

P610: !CAS [15] (maybe <- 0x17d) (Int)
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

P611: !ST [11] (maybe <- 0x17e) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P612: !CAS [13] (maybe <- 0x17f) (Int) (LE)
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
add %i3, 64, %l6
lduwa [%l6] %asi, %o3
mov %o3, %l3
! move %l3(lower) -> %o3(upper)
sllx %l3, 32, %o3
mov %l7, %o5
casa [%l6] %asi, %l3, %o5
! move %o5(lower) -> %o3(lower)
srl %o5, 0, %l6
or %l6, %o3, %o3
add   %l4, 1, %l4

P613: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P614: !PREFETCH [5] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i1 + 76] %asi, 1

P615: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P616: !CAS [6] (maybe <- 0x180) (Int) (CBR) (Branch target of P167)
add %i1, 80, %l6
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

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET616
nop
RET616:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0

ba P617
nop

TARGET167:
ba RET167
nop


P617: !DWST [5] (maybe <- 0x181) (Int)
mov %l4, %l6 
stx %l6, [%i1 + 72]
add   %l4, 1, %l4

P618: !PREFETCH [5] (Int) (LE) (CBR)
wr %g0, 0x88, %asi
prefetcha [%i1 + 76] %asi, 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET618
nop
RET618:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P619: !ST [12] (maybe <- 0x182) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P620: !CAS [11] (maybe <- 0x183) (Int)
add %i2, 64, %l6
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

P621: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P622: !ST [3] (maybe <- 0x184) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P623: !ST [10] (maybe <- 0x185) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P624: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P625: !ST [8] (maybe <- 0x3f800019) (FP) (Branch target of P847)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i1 + 256 ]
ba P626
nop

TARGET847:
ba RET847
nop


P626: !PREFETCH [0] (Int) (Branch target of P667)
prefetch [%i0 + 0], 1
ba P627
nop

TARGET667:
ba RET667
nop


P627: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P628: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P629: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P630: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P631: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P632: !LD [14] (Int) (LE)
wr %g0, 0x88, %asi
lduwa [%i3 + 128] %asi, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P633: !PREFETCH [3] (Int) (Branch target of P767)
prefetch [%i0 + 32], 1
ba P634
nop

TARGET767:
ba RET767
nop


P634: !CASX [13] (maybe <- 0x186) (Int)
add %i3, 64, %l3
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

P635: !ST [13] (maybe <- 0x187) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P636: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P637: !ST [5] (maybe <- 0x3f80001a) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i1 + 76 ]

P638: !ST [1] (maybe <- 0x188) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P639: !ST [0] (maybe <- 0x189) (Int) (CBR)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET639
nop
RET639:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P640: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P641: !ST [0] (maybe <- 0x3f80001b) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i0 + 0 ]

P642: !ST [9] (maybe <- 0x18a) (Int) (Branch target of P771)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4
ba P643
nop

TARGET771:
ba RET771
nop


P643: !CAS [10] (maybe <- 0x18b) (Int)
add %i2, 32, %o5
lduw [%o5], %l6
mov %l6, %l7
! move %l7(lower) -> %o3(lower)
or %l7, %o3, %o3
mov %l4, %o4
cas [%o5], %l7, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P644: !DWLD [2] (Int)
ldx [%i0 + 8], %o5
! move %o5(lower) -> %o4(lower)
srl %o5, 0, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P645: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P646: !ST [6] (maybe <- 0x18c) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P647: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P648: !CAS [3] (maybe <- 0x18d) (Int)
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

P649: !ST [9] (maybe <- 0x18e) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P650: !CAS [5] (maybe <- 0x18f) (Int)
add %i1, 76, %o5
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

P651: !ST [13] (maybe <- 0x190) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P652: !ST [3] (maybe <- 0x191) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P653: !ST [8] (maybe <- 0x192) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P654: !CASX [10] (maybe <- 0x193) (Int)
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

P655: !ST [0] (maybe <- 0x3f80001c) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i0 + 0 ]

P656: !CAS [1] (maybe <- 0x194) (Int) (CBR)
add %i0, 4, %o5
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

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET656
nop
RET656:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P657: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P658: !LD [5] (Int)
lduw [%i1 + 76], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P659: !ST [12] (maybe <- 0x195) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P660: !CASX [2] (maybe <- 0x196) (Int)
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

P661: !CAS [15] (maybe <- 0x197) (Int)
add %i3, 192, %l6
lduw [%l6], %o5
mov %o5, %l3
! move %l3(lower) -> %o2(lower)
or %l3, %o2, %o2
mov %l4, %o3
cas [%l6], %l3, %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P662: !MEMBAR (Int)
membar #StoreLoad

P663: !ST [4] (maybe <- 0x198) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P664: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P665: !MEMBAR (Int)
membar #StoreLoad

P666: !CASX [3] (maybe <- 0x199) (Int)
add %i0, 32, %l3
ldx [%l3], %l7
! move %l7(upper) -> %o3(lower)
srlx %l7, 32, %o5
or %o5, %o3, %o3
! move %l7(lower) -> %o4(upper)
sllx %l7, 32, %o4
mov  %l7, %o5
sllx %l4, 32, %l7
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

P667: !PREFETCH [13] (Int) (LE) (CBR)
wr %g0, 0x88, %asi
prefetcha [%i3 + 64] %asi, 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET667
nop
RET667:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P668: !CAS [13] (maybe <- 0x19a) (Int)
add %i3, 64, %l6
lduw [%l6], %o5
mov %o5, %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0
mov %l4, %o1
cas [%l6], %l3, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P669: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P670: !ST [11] (maybe <- 0x19b) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P671: !PREFETCH [5] (Int) (CBR)
prefetch [%i1 + 76], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET671
nop
RET671:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P672: !REPLACEMENT [6] (Int)
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

P673: !CAS [2] (maybe <- 0x19c) (Int)
add %i0, 12, %l3
lduw [%l3], %l7
mov %l7, %o5
! move %o5(lower) -> %o1(lower)
or %o5, %o1, %o1
mov %l4, %o2
cas [%l3], %o5, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P674: !ST [0] (maybe <- 0x19d) (Int) (LE) (CBR)
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
stwa   %o5, [%i0 + 0] %asi
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET674
nop
RET674:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P675: !ST [11] (maybe <- 0x19e) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P676: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P677: !MEMBAR (Int) (CBR)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET677
nop
RET677:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P678: !CASX [7] (maybe <- 0x19f) (Int)
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

P679: !CASX [12] (maybe <- 0x1a1) (Int) (CBR)
add %i3, 0, %l3
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

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET679
nop
RET679:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P680: !CASX [15] (maybe <- 0x1a2) (Int)
add %i3, 192, %l6
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

P681: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P682: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P683: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P684: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P685: !CAS [1] (maybe <- 0x1a3) (Int)
add %i0, 4, %l6
lduw [%l6], %o5
mov %o5, %l3
! move %l3(lower) -> %o3(lower)
or %l3, %o3, %o3
mov %l4, %o4
cas [%l6], %l3, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P686: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P687: !CASX [9] (maybe <- 0x1a4) (Int) (CBR)
add %i1, 512, %l6
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

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET687
nop
RET687:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P688: !PREFETCH [13] (Int) (CBR)
prefetch [%i3 + 64], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET688
nop
RET688:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P689: !LD [1] (Int) (Branch target of P511)
lduw [%i0 + 4], %o5
! move %o5(lower) -> %o1(lower)
or %o5, %o1, %o1
ba P690
nop

TARGET511:
ba RET511
nop


P690: !ST [0] (maybe <- 0x1a5) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P691: !ST [10] (maybe <- 0x1a6) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P692: !LD [4] (Int)
lduw [%i0 + 64], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P693: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P694: !ST [11] (maybe <- 0x1a7) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P695: !CAS [12] (maybe <- 0x1a8) (Int) (CBR)
add %i3, 0, %l3
lduw [%l3], %l7
mov %l7, %o5
! move %o5(lower) -> %o2(lower)
or %o5, %o2, %o2
mov %l4, %o3
cas [%l3], %o5, %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET695
nop
RET695:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P696: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P697: !CASX [2] (maybe <- 0x1a9) (Int)
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

P698: !CAS [9] (maybe <- 0x1aa) (Int)
add %i1, 512, %l6
lduw [%l6], %o5
mov %o5, %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0
mov %l4, %o1
cas [%l6], %l3, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P699: !PREFETCH [3] (Int) (CBR)
prefetch [%i0 + 32], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET699
nop
RET699:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P700: !ST [2] (maybe <- 0x1ab) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P701: !ST [5] (maybe <- 0x1ac) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P702: !DWLD [10] (Int)
ldx [%i2 + 32], %l3
! move %l3(upper) -> %o1(lower)
srlx %l3, 32, %o5
or %o5, %o1, %o1

P703: !CAS [13] (maybe <- 0x1ad) (Int)
add %i3, 64, %l7
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

P704: !PREFETCH [2] (Int) (Branch target of P597)
prefetch [%i0 + 12], 1
ba P705
nop

TARGET597:
ba RET597
nop


P705: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P706: !LD [15] (Int)
lduw [%i3 + 192], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P707: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P708: !CASX [9] (maybe <- 0x1ae) (Int)
add %i1, 512, %l3
ldx [%l3], %l7
! move %l7(upper) -> %o3(lower)
srlx %l7, 32, %o5
or %o5, %o3, %o3
! move %l7(lower) -> %o4(upper)
sllx %l7, 32, %o4
mov  %l7, %o5
sllx %l4, 32, %l7
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

P709: !CAS [12] (maybe <- 0x1af) (Int)
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

P710: !ST [10] (maybe <- 0x1b0) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P711: !CASX [10] (maybe <- 0x1b1) (Int)
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

P712: !CASX [0] (maybe <- 0x1b2) (Int)
add %i0, 0, %o5
ldx [%o5], %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %l7
or %l7, %o3, %o3
! move %l6(lower) -> %o4(upper)
sllx %l6, 32, %o4
mov %l6, %l7
sllx %l4, 32, %l6
add  %l4, 1, %l4
or   %l4, %l6, %l6
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

P713: !CAS [7] (maybe <- 0x1b4) (Int)
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

P714: !CAS [12] (maybe <- 0x1b5) (Int)
add %i3, 0, %o5
lduw [%o5], %l6
mov %l6, %l7
! move %l7(lower) -> %o1(lower)
or %l7, %o1, %o1
mov %l4, %o2
cas [%o5], %l7, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P715: !CAS [2] (maybe <- 0x1b6) (Int)
add %i0, 12, %o5
lduw [%o5], %l6
mov %l6, %l7
! move %l7(lower) -> %o2(lower)
or %l7, %o2, %o2
mov %l4, %o3
cas [%o5], %l7, %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P716: !CAS [11] (maybe <- 0x1b7) (Int)
add %i2, 64, %o5
lduw [%o5], %l6
mov %l6, %l7
! move %l7(lower) -> %o3(lower)
or %l7, %o3, %o3
mov %l4, %o4
cas [%o5], %l7, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P717: !ST [15] (maybe <- 0x1b8) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P718: !ST [1] (maybe <- 0x1b9) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P719: !PREFETCH [10] (Int) (Branch target of P322)
prefetch [%i2 + 32], 1
ba P720
nop

TARGET322:
ba RET322
nop


P720: !ST [0] (maybe <- 0x1ba) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P721: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P722: !ST [0] (maybe <- 0x1bb) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P723: !CAS [2] (maybe <- 0x1bc) (Int)
add %i0, 12, %o5
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

P724: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P725: !ST [1] (maybe <- 0x1bd) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P726: !CAS [9] (maybe <- 0x1be) (Int) (CBR)
add %i1, 512, %l7
lduw [%l7], %l3
mov %l3, %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0
mov %l4, %o1
cas [%l7], %l6, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET726
nop
RET726:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P727: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P728: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P729: !CAS [8] (maybe <- 0x1bf) (Int)
add %i1, 256, %o5
lduw [%o5], %l6
mov %l6, %l7
! move %l7(lower) -> %o1(lower)
or %l7, %o1, %o1
mov %l4, %o2
cas [%o5], %l7, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P730: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P731: !ST [12] (maybe <- 0x1c0) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P732: !ST [15] (maybe <- 0x1c1) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P733: !ST [11] (maybe <- 0x1c2) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P734: !ST [11] (maybe <- 0x1c3) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P735: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P736: !LD [11] (Int)
lduw [%i2 + 64], %o5
! move %o5(lower) -> %o2(lower)
or %o5, %o2, %o2

P737: !CASX [10] (maybe <- 0x1c4) (Int)
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

P738: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P739: !ST [9] (maybe <- 0x1c5) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P740: !ST [5] (maybe <- 0x1c6) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P741: !ST [10] (maybe <- 0x1c7) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P742: !DWST [2] (maybe <- 0x1c8) (Int)
mov %l4, %l6 
stx %l6, [%i0 + 8]
add   %l4, 1, %l4

P743: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P744: !ST [5] (maybe <- 0x1c9) (Int) (Branch target of P330)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4
ba P745
nop

TARGET330:
ba RET330
nop


P745: !PREFETCH [4] (Int) (Branch target of P310)
prefetch [%i0 + 64], 1
ba P746
nop

TARGET310:
ba RET310
nop


P746: !ST [15] (maybe <- 0x1ca) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P747: !ST [0] (maybe <- 0x1cb) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P748: !PREFETCH [9] (Int) (Branch target of P1036)
prefetch [%i1 + 512], 1
ba P749
nop

TARGET1036:
ba RET1036
nop


P749: !ST [12] (maybe <- 0x1cc) (Int) (CBR)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET749
nop
RET749:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P750: !CASX [12] (maybe <- 0x1cd) (Int)
add %i3, 0, %l7
ldx [%l7], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l6
sllx %l4, 32, %o1
casx [%l7], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P751: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P752: !DWLD [9] (Int)
ldx [%i1 + 512], %o2
! move %o2(upper) -> %o2(upper)

P753: !CAS [14] (maybe <- 0x1ce) (Int)
add %i3, 128, %l3
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

P754: !CAS [13] (maybe <- 0x1cf) (Int)
add %i3, 64, %l3
lduw [%l3], %l7
mov %l7, %o5
! move %o5(lower) -> %o3(lower)
or %o5, %o3, %o3
mov %l4, %o4
cas [%l3], %o5, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P755: !CAS [3] (maybe <- 0x1d0) (Int)
add %i0, 32, %l3
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

P756: !CAS [14] (maybe <- 0x1d1) (Int)
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

P757: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P758: !CAS [12] (maybe <- 0x1d2) (Int)
add %i3, 0, %l3
lduw [%l3], %l7
mov %l7, %o5
! move %o5(lower) -> %o1(lower)
or %o5, %o1, %o1
mov %l4, %o2
cas [%l3], %o5, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P759: !CASX [10] (maybe <- 0x1d3) (Int)
add %i2, 32, %l3
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

P760: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P761: !DWST [6] (maybe <- 0x3f80001d) (FP) (CBR) (Branch target of P316)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=21 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
std %f20, [%i1 + 80]

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET761
nop
RET761:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0

ba P762
nop

TARGET316:
ba RET316
nop


P762: !CASX [13] (maybe <- 0x1d4) (Int)
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

P763: !SWAP [7] (maybe <- 0x1d5) (Int)
mov %l4, %l6
swap  [%i1 + 84], %l6
! move %l6(lower) -> %o1(lower)
srl %l6, 0, %o5
or %o5, %o1, %o1
add   %l4, 1, %l4

P764: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P765: !ST [8] (maybe <- 0x1d6) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P766: !CAS [11] (maybe <- 0x1d7) (Int)
add %i2, 64, %l7
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

P767: !PREFETCH [8] (Int) (CBR)
prefetch [%i1 + 256], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET767
nop
RET767:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P768: !CASX [9] (maybe <- 0x1d8) (Int)
add %i1, 512, %o5
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

P769: !ST [3] (maybe <- 0x1d9) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P770: !PREFETCH [8] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i1 + 256] %asi, 1

P771: !ST [9] (maybe <- 0x1da) (Int) (CBR) (Branch target of P481)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET771
nop
RET771:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0

ba P772
nop

TARGET481:
ba RET481
nop


P772: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P773: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P774: !ST [3] (maybe <- 0x1db) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P775: !ST [14] (maybe <- 0x1dc) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P776: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P777: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P778: !ST [9] (maybe <- 0x1dd) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P779: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P780: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P781: !PREFETCH [5] (Int) (Branch target of P371)
prefetch [%i1 + 76], 1
ba P782
nop

TARGET371:
ba RET371
nop


P782: !CAS [1] (maybe <- 0x1de) (Int)
add %i0, 4, %o5
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

P783: !ST [6] (maybe <- 0x1df) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P784: !ST [15] (maybe <- 0x3f80001f) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i3 + 192 ]

P785: !DWST [11] (maybe <- 0x3f800020) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
std %f20, [%i2 + 64]

P786: !ST [1] (maybe <- 0x1e0) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P787: !ST [9] (maybe <- 0x1e1) (Int) (LE)
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
stwa   %l7, [%i1 + 512] %asi
add   %l4, 1, %l4

P788: !CASX [7] (maybe <- 0x1e2) (Int)
add %i1, 80, %l7
ldx [%l7], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
mov %o1, %l6
sllx %l4, 32, %o2
add  %l4, 1, %l4
or   %l4, %o2, %o2
casx [%l7], %l6, %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
add  %l4, 1, %l4

P789: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P790: !REPLACEMENT [15] (Int)
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

P791: !CASX [15] (maybe <- 0x1e4) (Int)
add %i3, 192, %l6
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

P792: !ST [13] (maybe <- 0x1e5) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P793: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P794: !CAS [3] (maybe <- 0x1e6) (Int)
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

P795: !CASX [14] (maybe <- 0x1e7) (Int)
add %i3, 128, %l3
ldx [%l3], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
mov  %o1, %o5
sllx %l4, 32, %o2
casx [%l3], %o5, %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
add  %l4, 1, %l4

P796: !CASX [5] (maybe <- 0x1e8) (Int)
add %i1, 72, %l3
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

P797: !REPLACEMENT [1] (Int)
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

P798: !ST [8] (maybe <- 0x3f800021) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i1 + 256 ]

P799: !ST [8] (maybe <- 0x1e9) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P800: !ST [8] (maybe <- 0x3f800022) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i1 + 256 ]

P801: !CAS [9] (maybe <- 0x1ea) (Int)
add %i1, 512, %l3
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

P802: !CASX [5] (maybe <- 0x1eb) (Int)
add %i1, 72, %l3
ldx [%l3], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
mov  %o1, %o5
mov %l4, %o2
casx [%l3], %o5, %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
add  %l4, 1, %l4

P803: !ST [10] (maybe <- 0x1ec) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P804: !CAS [1] (maybe <- 0x1ed) (Int)
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

P805: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P806: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P807: !CAS [11] (maybe <- 0x1ee) (Int)
add %i2, 64, %o5
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

P808: !DWST [13] (maybe <- 0x1ef) (Int)
mov %l4, %l7 
sllx %l7, 32, %l7 
stx %l7, [%i3 + 64 ] 
add   %l4, 1, %l4

P809: !CAS [3] (maybe <- 0x1f0) (Int)
add %i0, 32, %l7
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

P810: !PREFETCH [2] (Int) (CBR)
prefetch [%i0 + 12], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET810
nop
RET810:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P811: !CASX [7] (maybe <- 0x1f1) (Int)
add %i1, 80, %o5
ldx [%o5], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
mov %o1, %l7
sllx %l4, 32, %o2
add  %l4, 1, %l4
or   %l4, %o2, %o2
casx [%o5], %l7, %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
add  %l4, 1, %l4

P812: !CASX [10] (maybe <- 0x1f3) (Int)
add %i2, 32, %o5
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

P813: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P814: !ST [11] (maybe <- 0x1f4) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P815: !ST [0] (maybe <- 0x1f5) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P816: !CASX [3] (maybe <- 0x1f6) (Int)
add %i0, 32, %l6
ldx [%l6], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l3
sllx %l4, 32, %o1
casx [%l6], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P817: !ST [9] (maybe <- 0x1f7) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P818: !DWST [5] (maybe <- 0x1f8) (Int)
mov %l4, %o5 
stx %o5, [%i1 + 72]
add   %l4, 1, %l4

P819: !ST [15] (maybe <- 0x1f9) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P820: !ST [3] (maybe <- 0x1fa) (Int) (CBR) (Branch target of P679)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET820
nop
RET820:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0

ba P821
nop

TARGET679:
ba RET679
nop


P821: !CAS [12] (maybe <- 0x1fb) (Int)
add %i3, 0, %l7
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

P822: !CASX [8] (maybe <- 0x1fc) (Int)
add %i1, 256, %l7
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

P823: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P824: !ST [2] (maybe <- 0x1fd) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P825: !ST [1] (maybe <- 0x1fe) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P826: !ST [4] (maybe <- 0x1ff) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P827: !ST [11] (maybe <- 0x200) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P828: !ST [7] (maybe <- 0x201) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P829: !MEMBAR (Int)
membar #StoreLoad

P830: !DWLD [5] (Int)
ldx [%i1 + 72], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P831: !PREFETCH [3] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i0 + 32] %asi, 1

P832: !ST [1] (maybe <- 0x202) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P833: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P834: !ST [5] (maybe <- 0x203) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P835: !MEMBAR (Int)
membar #StoreLoad

P836: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P837: !ST [2] (maybe <- 0x204) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P838: !DWST [5] (maybe <- 0x205) (Int)
mov %l4, %o5 
stx %o5, [%i1 + 72]
add   %l4, 1, %l4

P839: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P840: !CAS [7] (maybe <- 0x206) (Int)
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

P841: !ST [3] (maybe <- 0x207) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P842: !CAS [2] (maybe <- 0x208) (Int)
add %i0, 12, %l7
lduw [%l7], %l3
mov %l3, %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1
mov %l4, %o2
cas [%l7], %l6, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P843: !CAS [12] (maybe <- 0x209) (Int)
add %i3, 0, %l7
lduw [%l7], %l3
mov %l3, %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2
mov %l4, %o3
cas [%l7], %l6, %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P844: !SWAP [6] (maybe <- 0x20a) (Int) (CBR)
mov %l4, %o5
swap  [%i1 + 80], %o5
! move %o5(lower) -> %o3(lower)
srl %o5, 0, %l6
or %l6, %o3, %o3
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET844
nop
RET844:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P845: !ST [7] (maybe <- 0x20b) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P846: !ST [8] (maybe <- 0x20c) (Int) (CBR)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET846
nop
RET846:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P847: !DWST [15] (maybe <- 0x3f800023) (FP) (CBR)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
std %f20, [%i3 + 192]

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET847
nop
RET847:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P848: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P849: !CASX [6] (maybe <- 0x20d) (Int) (LE)
sllx %l4, 32, %l6
add  %l4, 1, %l4
or   %l4, %l6, %l6
! Change double-word-level endianess (big endian <-> little endian) 
sethi %hi(0xff00ff00), %l3
or %l3, %lo(0xff00ff00), %l3
sllx %l3, 32, %l7
or %l3, %l7, %l3 
and %l6, %l3, %l7
srlx %l7, 8, %l7
sllx %l6, 8, %l6
and %l6, %l3, %l6
or %l6, %l7, %l6 
sethi %hi(0xffff0000), %l3
or %l3, %lo(0xffff0000), %l3
srlx %l6, 16, %l7
andn %l7, %l3, %l7
andn %l6, %l3, %l6
sllx %l6, 16, %l6
or %l6, %l7, %l6 
srlx %l6, 32, %l7
sllx %l6, 32, %l6
or %l6, %l7, %l7 
wr %g0, 0x88, %asi
add %i1, 80, %l6
ldxa [%l6] %asi, %o5
! move %o5(lower) -> %o4(upper)
sllx %o5, 32, %o4
! move %o5(upper) -> %o4(lower)
srlx %o5, 32, %l3
or %l3, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5
mov %o5, %l3
mov  %l7, %o5
casxa [%l6] %asi, %l3, %o5
! move %o5(lower) -> %o0(upper)
sllx %o5, 32, %o0
! move %o5(upper) -> %o0(lower)
srlx %o5, 32, %l6
or %l6, %o0, %o0
add  %l4, 1, %l4

P850: !CASX [10] (maybe <- 0x20f) (Int)
add %i2, 32, %l6
ldx [%l6], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
mov  %o1, %l3
sllx %l4, 32, %o2
casx [%l6], %l3, %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
add  %l4, 1, %l4

P851: !ST [13] (maybe <- 0x210) (Int) (Branch target of P472)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4
ba P852
nop

TARGET472:
ba RET472
nop


P852: !PREFETCH [12] (Int) (CBR)
prefetch [%i3 + 0], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET852
nop
RET852:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P853: !CAS [7] (maybe <- 0x211) (Int)
add %i1, 84, %l6
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

P854: !CASX [3] (maybe <- 0x212) (Int)
add %i0, 32, %l6
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

P855: !DWST [6] (maybe <- 0x213) (Int)
sllx %l4, 32, %l3 
add   %l4, 1, %l4
or %l3, %l4, %l3
stx %l3, [%i1 + 80]
add   %l4, 1, %l4

P856: !CAS [3] (maybe <- 0x215) (Int)
add %i0, 32, %l3
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

P857: !CAS [8] (maybe <- 0x216) (Int)
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

P858: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P859: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P860: !CAS [7] (maybe <- 0x217) (Int) (LE)
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
add %i1, 84, %l3
lduwa [%l3] %asi, %o3
mov %o3, %o5
! move %o5(lower) -> %o3(upper)
sllx %o5, 32, %o3
mov %l6, %l7
casa [%l3] %asi, %o5, %l7
! move %l7(lower) -> %o3(lower)
srl %l7, 0, %l3
or %l3, %o3, %o3
add   %l4, 1, %l4

P861: !PREFETCH [13] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i3 + 64] %asi, 1

P862: !ST [8] (maybe <- 0x218) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P863: !DWST [12] (maybe <- 0x219) (Int)
mov %l4, %l7 
sllx %l7, 32, %l7 
stx %l7, [%i3 + 0 ] 
add   %l4, 1, %l4

P864: !ST [14] (maybe <- 0x21a) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P865: !ST [8] (maybe <- 0x3f800024) (FP) (CBR)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i1 + 256 ]

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET865
nop
RET865:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P866: !CAS [0] (maybe <- 0x21b) (Int)
add %i0, 0, %l6
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

P867: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P868: !REPLACEMENT [10] (Int) (CBR)
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
be,pn  %xcc, TARGET868
nop
RET868:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P869: !CASX [8] (maybe <- 0x21c) (Int)
add %i1, 256, %l6
ldx [%l6], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l3
sllx %l4, 32, %o1
casx [%l6], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P870: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P871: !CAS [15] (maybe <- 0x21d) (Int) (Branch target of P602)
add %i3, 192, %l6
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
ba P872
nop

TARGET602:
ba RET602
nop


P872: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P873: !CASX [2] (maybe <- 0x21e) (Int)
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

P874: !CASX [12] (maybe <- 0x21f) (Int)
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

P875: !REPLACEMENT [15] (Int)
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

P876: !ST [14] (maybe <- 0x220) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P877: !CAS [10] (maybe <- 0x221) (Int)
add %i2, 32, %o5
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

P878: !CAS [5] (maybe <- 0x222) (Int)
add %i1, 76, %o5
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

P879: !PREFETCH [6] (Int) (Branch target of P695)
prefetch [%i1 + 80], 1
ba P880
nop

TARGET695:
ba RET695
nop


P880: !CASX [10] (maybe <- 0x223) (Int)
add %i2, 32, %o5
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

P881: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P882: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P883: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P884: !ST [5] (maybe <- 0x224) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P885: !ST [14] (maybe <- 0x225) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P886: !CAS [6] (maybe <- 0x226) (Int)
add %i1, 80, %l6
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

P887: !MEMBAR (Int)
membar #StoreLoad

P888: !CAS [11] (maybe <- 0x227) (Int)
add %i2, 64, %l6
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

P889: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P890: !CAS [11] (maybe <- 0x228) (Int) (Branch target of P618)
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
ba P891
nop

TARGET618:
ba RET618
nop


P891: !ST [14] (maybe <- 0x229) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P892: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P893: !CASX [13] (maybe <- 0x22a) (Int)
add %i3, 64, %l3
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

P894: !CASX [1] (maybe <- 0x22b) (Int)
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

P895: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P896: !MEMBAR (Int)
membar #StoreLoad

P897: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P898: !ST [8] (maybe <- 0x22d) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P899: !DWST [9] (maybe <- 0x22e) (Int)
mov %l4, %l7 
sllx %l7, 32, %l7 
stx %l7, [%i1 + 512 ] 
add   %l4, 1, %l4

P900: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P901: !SWAP [0] (maybe <- 0x22f) (Int)
mov %l4, %o3
swap  [%i0 + 0], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P902: !REPLACEMENT [2] (Int) (Branch target of P674)
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
ba P903
nop

TARGET674:
ba RET674
nop


P903: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P904: !PREFETCH [7] (Int) (CBR) (Branch target of P518)
prefetch [%i1 + 84], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET904
nop
RET904:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0

ba P905
nop

TARGET518:
ba RET518
nop


P905: !MEMBAR (Int)
membar #StoreLoad

P906: !CASX [11] (maybe <- 0x230) (Int)
add %i2, 64, %l6
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

P907: !ST [4] (maybe <- 0x3f800025) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i0 + 64 ]

P908: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P909: !ST [11] (maybe <- 0x231) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P910: !CASX [15] (maybe <- 0x232) (Int)
add %i3, 192, %o5
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

P911: !CASX [1] (maybe <- 0x233) (Int)
add %i0, 0, %o5
ldx [%o5], %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l7
or %l7, %o2, %o2
! move %l6(lower) -> %o3(upper)
sllx %l6, 32, %o3
mov %l6, %l7
sllx %l4, 32, %l6
add  %l4, 1, %l4
or   %l4, %l6, %l6
casx [%o5], %l7, %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %o5
or %o5, %o3, %o3
! move %l6(lower) -> %o4(upper)
sllx %l6, 32, %o4
add  %l4, 1, %l4

P912: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P913: !ST [9] (maybe <- 0x235) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P914: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P915: !ST [9] (maybe <- 0x236) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P916: !ST [0] (maybe <- 0x237) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P917: !MEMBAR (Int) (Branch target of P955)
membar #StoreLoad
ba P918
nop

TARGET955:
ba RET955
nop


P918: !MEMBAR (Int)
membar #StoreLoad

P919: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P920: !CAS [6] (maybe <- 0x238) (Int)
add %i1, 80, %l3
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

P921: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P922: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P923: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P924: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P925: !ST [2] (maybe <- 0x239) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P926: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P927: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P928: !ST [5] (maybe <- 0x23a) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P929: !PREFETCH [13] (Int) (CBR)
prefetch [%i3 + 64], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET929
nop
RET929:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P930: !ST [3] (maybe <- 0x23b) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P931: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P932: !CAS [8] (maybe <- 0x23c) (Int)
add %i1, 256, %l7
lduw [%l7], %l3
mov %l3, %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0
mov %l4, %o1
cas [%l7], %l6, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P933: !CAS [7] (maybe <- 0x23d) (Int)
add %i1, 84, %l7
lduw [%l7], %l3
mov %l3, %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1
mov %l4, %o2
cas [%l7], %l6, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P934: !CAS [14] (maybe <- 0x23e) (Int)
add %i3, 128, %l7
lduw [%l7], %l3
mov %l3, %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2
mov %l4, %o3
cas [%l7], %l6, %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P935: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P936: !ST [8] (maybe <- 0x23f) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P937: !LD [4] (Int) (LE)
wr %g0, 0x88, %asi
lduwa [%i0 + 64] %asi, %l6
! move %l6(lower) -> %o3(lower)
or %l6, %o3, %o3

P938: !CASX [0] (maybe <- 0x240) (Int)
add %i0, 0, %o5
ldx [%o5], %o4
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5
mov %o4, %l7
sllx %l4, 32, %o0
add  %l4, 1, %l4
or   %l4, %o0, %o0
casx [%o5], %l7, %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
add  %l4, 1, %l4

P939: !CASX [10] (maybe <- 0x242) (Int)
add %i2, 32, %o5
ldx [%o5], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
mov  %o1, %l7
sllx %l4, 32, %o2
casx [%o5], %l7, %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
add  %l4, 1, %l4

P940: !ST [7] (maybe <- 0x243) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P941: !CASX [9] (maybe <- 0x244) (Int)
add %i1, 512, %l7
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

P942: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P943: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P944: !MEMBAR (Int)
membar #StoreLoad

P945: !CASX [15] (maybe <- 0x245) (Int) (Branch target of P981)
add %i3, 192, %l7
ldx [%l7], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l6
sllx %l4, 32, %o1
casx [%l7], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
ba P946
nop

TARGET981:
ba RET981
nop


P946: !ST [0] (maybe <- 0x246) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P947: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P948: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P949: !CASX [5] (maybe <- 0x247) (Int)
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

P950: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P951: !MEMBAR (Int)
membar #StoreLoad

P952: !PREFETCH [0] (Int) (CBR)
prefetch [%i0 + 0], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET952
nop
RET952:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P953: !ST [9] (maybe <- 0x248) (Int) (Branch target of P929)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4
ba P954
nop

TARGET929:
ba RET929
nop


P954: !REPLACEMENT [10] (Int)
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

P955: !PREFETCH [3] (Int) (CBR)
prefetch [%i0 + 32], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET955
nop
RET955:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P956: !DWLD [13] (Int)
ldx [%i3 + 64], %o4
! move %o4(upper) -> %o4(upper)

P957: !ST [2] (maybe <- 0x249) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P958: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P959: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P960: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P961: !CASX [10] (maybe <- 0x24a) (Int)
add %i2, 32, %l7
ldx [%l7], %l3
! move %l3(upper) -> %o4(lower)
srlx %o4, 32, %o4
sllx %o4, 32, %o4
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

P962: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P963: !ST [10] (maybe <- 0x24b) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P964: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P965: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P966: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P967: !ST [12] (maybe <- 0x24c) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P968: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P969: !ST [6] (maybe <- 0x24d) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P970: !CAS [15] (maybe <- 0x24e) (Int)
add %i3, 192, %o5
lduw [%o5], %l6
mov %l6, %l7
! move %l7(lower) -> %o1(lower)
or %l7, %o1, %o1
mov %l4, %o2
cas [%o5], %l7, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P971: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P972: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P973: !ST [12] (maybe <- 0x24f) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P974: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P975: !ST [11] (maybe <- 0x250) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P976: !MEMBAR (Int)
membar #StoreLoad

P977: !CASX [5] (maybe <- 0x251) (Int) (LE)
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
sllx %l7, 32, %l7
wr %g0, 0x88, %asi
add %i1, 72, %l6
ldxa [%l6] %asi, %o5
! move %o5(lower) -> %o2(lower)
srl %o5, 0, %l3
or %l3, %o2, %o2
! move %o5(upper) -> %o3(upper)
or %o5, %g0, %o3
mov  %o5, %l3
mov  %l7, %o5
casxa [%l6] %asi, %l3, %o5
! move %o5(lower) -> %o3(lower)
srlx %o3, 32, %o3
sllx %o3, 32, %o3
srl %o5, 0, %l6
or %l6, %o3, %o3
! move %o5(upper) -> %o4(upper)
or %o5, %g0, %o4
add  %l4, 1, %l4

P978: !CAS [4] (maybe <- 0x252) (Int)
add %i0, 64, %l6
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

P979: !ST [2] (maybe <- 0x253) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P980: !CASX [9] (maybe <- 0x254) (Int)
add %i1, 512, %l3
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

P981: !CAS [2] (maybe <- 0x255) (Int) (CBR)
add %i0, 12, %l3
lduw [%l3], %l7
mov %l7, %o5
! move %o5(lower) -> %o2(lower)
or %o5, %o2, %o2
mov %l4, %o3
cas [%l3], %o5, %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET981
nop
RET981:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P982: !ST [9] (maybe <- 0x256) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P983: !CAS [5] (maybe <- 0x257) (Int)
add %i1, 76, %l3
lduw [%l3], %l7
mov %l7, %o5
! move %o5(lower) -> %o3(lower)
or %o5, %o3, %o3
mov %l4, %o4
cas [%l3], %o5, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P984: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P985: !DWLD [2] (Int)
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

P986: !CAS [13] (maybe <- 0x258) (Int)
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

P987: !ST [15] (maybe <- 0x259) (Int) (CBR)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET987
nop
RET987:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P988: !CAS [7] (maybe <- 0x25a) (Int)
add %i1, 84, %l7
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

P989: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P990: !ST [7] (maybe <- 0x25b) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P991: !LD [10] (Int)
lduw [%i2 + 32], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P992: !CAS [3] (maybe <- 0x25c) (Int)
add %i0, 32, %o5
lduw [%o5], %l6
mov %l6, %l7
! move %l7(lower) -> %o2(lower)
or %l7, %o2, %o2
mov %l4, %o3
cas [%o5], %l7, %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P993: !CAS [12] (maybe <- 0x25d) (Int)
add %i3, 0, %o5
lduw [%o5], %l6
mov %l6, %l7
! move %l7(lower) -> %o3(lower)
or %l7, %o3, %o3
mov %l4, %o4
cas [%o5], %l7, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P994: !CAS [15] (maybe <- 0x25e) (Int)
add %i3, 192, %o5
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

P995: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P996: !DWST [8] (maybe <- 0x25f) (Int)
mov %l4, %l7 
sllx %l7, 32, %l7 
stx %l7, [%i1 + 256 ] 
add   %l4, 1, %l4

P997: !ST [6] (maybe <- 0x260) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P998: !DWST [1] (maybe <- 0x261) (Int)
sllx %l4, 32, %l3 
add   %l4, 1, %l4
or %l3, %l4, %l3
stx %l3, [%i0 + 0]
add   %l4, 1, %l4

P999: !CAS [4] (maybe <- 0x263) (Int)
add %i0, 64, %l3
lduw [%l3], %l7
mov %l7, %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0
mov %l4, %o1
cas [%l3], %o5, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P1000: !ST [12] (maybe <- 0x264) (Int) (LE)
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

P1001: !ST [3] (maybe <- 0x265) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P1002: !ST [5] (maybe <- 0x3f800026) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i1 + 76 ]

P1003: !ST [14] (maybe <- 0x266) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P1004: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P1005: !ST [3] (maybe <- 0x267) (Int) (CBR)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1005
nop
RET1005:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P1006: !REPLACEMENT [7] (Int)
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

P1007: !ST [6] (maybe <- 0x268) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P1008: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P1009: !ST [15] (maybe <- 0x269) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P1010: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P1011: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P1012: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P1013: !ST [13] (maybe <- 0x26a) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P1014: !DWST [3] (maybe <- 0x26b) (Int)
mov %l4, %o5 
sllx %o5, 32, %o5 
stx %o5, [%i0 + 32 ] 
add   %l4, 1, %l4

P1015: !ST [1] (maybe <- 0x26c) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P1016: !ST [11] (maybe <- 0x26d) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P1017: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P1018: !CAS [13] (maybe <- 0x26e) (Int)
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

P1019: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P1020: !MEMBAR (Int)
membar #StoreLoad

P1021: !LD [0] (Int)
lduw [%i0 + 0], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2

P1022: !LD [1] (FP)
ld [%i0 + 4], %f2
! 1 addresses covered

P1023: !LD [2] (Int)
lduw [%i0 + 12], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P1024: !LD [3] (Int) (Branch target of P761)
lduw [%i0 + 32], %l6
! move %l6(lower) -> %o3(lower)
or %l6, %o3, %o3
ba P1025
nop

TARGET761:
ba RET761
nop


P1025: !LD [4] (Int)
lduw [%i0 + 64], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P1026: !LD [5] (Int) (LE)
wr %g0, 0x88, %asi
lduwa [%i1 + 76] %asi, %l6
! move %l6(lower) -> %o4(lower)
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P1027: !LD [6] (Int)
lduw [%i1 + 80], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1028: !LD [7] (Int)
lduw [%i1 + 84], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

P1029: !LD [8] (Int) (LE)
wr %g0, 0x88, %asi
lduwa [%i1 + 256] %asi, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P1030: !LD [9] (FP)
ld [%i1 + 512], %f3
! 1 addresses covered

P1031: !LD [10] (Int)
lduw [%i2 + 32], %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1

P1032: !LD [11] (Int)
lduw [%i2 + 64], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P1033: !LD [12] (Int)
lduw [%i3 + 0], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2

P1034: !LD [13] (Int)
lduw [%i3 + 64], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P1035: !LD [14] (Int)
lduw [%i3 + 128], %l6
! move %l6(lower) -> %o3(lower)
or %l6, %o3, %o3

P1036: !LD [15] (Int) (CBR)
lduw [%i3 + 192], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1036
nop
RET1036:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


END_NODES0: ! Test istream for CPU 0 ends
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

func1:
! 1000 (dynamic) instruction sequence begins
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
sethi %hi(0x01deade1), %l3
or    %l3, %lo(0x01deade1), %l3
stw %l3, [%i5] 
ld [%i5], %f16

! Initialize running integer counter in register %l4
sethi %hi(0x800001), %l4
or    %l4, %lo(0x800001), %l4

! Initialize running FP counter in register %f16
sethi %hi(0x40000001), %l3
or    %l3, %lo(0x40000001), %l3
stw %l3, [%i5] 
ld [%i5], %f16

! Initialize FP counter increment value in register %f17 (constant)
sethi %hi(0x34800000), %l3
or    %l3, %lo(0x34800000), %l3
stw %l3, [%i5] 
ld [%i5], %f17 

! Initialize LFSR to 0x38a4^4
sethi %hi(0x38a4), %l0
or    %l0, %lo(0x38a4), %l0
mulx  %l0, %l0, %l0
mulx  %l0, %l0, %l0

!-- init shared addrs 2 to 3 ---
stx %g0, [%i0+8]
stx %g0, [%i0+32]

! use untouched cache-line (offset 4K) in replacement area for sync
sub %i1, %i0, %l6
add %i3, %l6, %l6
sub %l6, -4096, %l6

!-- begin of sync_init ---
or %g0, 1, %l7
or %g0, %l7, %o5
swap [%l6+4], %o5
membar #Sync
sync_init_1_1:
brnz,pt %l7, sync_init_1_1
lduw [%l6+4], %l7 ! delay slot
sync_init_2_1:
lduw [%l6], %l7
sub %l7, 1, %o5
cas [%l6], %l7, %o5
cmp %l7, %o5
bne,pt %xcc, sync_init_2_1
nop
membar #Sync
sync_init_3_1:
lduw [%l6], %l7 ! delay slot
brnz,pt %l7, sync_init_3_1
nop
!-- end of sync_init ---


BEGIN_NODES1: ! Test istream for CPU 1 begins

P1037: !LD [11] (Int)
lduw [%i2 + 64], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1038: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P1039: !LD [6] (Int) (LE)
wr %g0, 0x88, %asi
lduwa [%i1 + 80] %asi, %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0

P1040: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P1041: !REPLACEMENT [1] (Int)
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

P1042: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P1043: !ST [2] (maybe <- 0x800001) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P1044: !ST [5] (maybe <- 0x800002) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P1045: !ST [6] (maybe <- 0x800003) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P1046: !CASX [11] (maybe <- 0x800004) (Int)
add %i2, 64, %l6
ldx [%l6], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
mov  %o1, %l3
sllx %l4, 32, %o2
casx [%l6], %l3, %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
add  %l4, 1, %l4

P1047: !MEMBAR (Int)
membar #StoreLoad

P1048: !CAS [8] (maybe <- 0x800005) (Int)
add %i1, 256, %l6
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

P1049: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P1050: !DWLD [13] (Int)
ldx [%i3 + 64], %o4
! move %o4(upper) -> %o4(upper)

P1051: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P1052: !ST [13] (maybe <- 0x800006) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P1053: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P1054: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P1055: !CAS [10] (maybe <- 0x800007) (Int)
add %i2, 32, %l7
lduw [%l7], %l3
mov %l3, %l6
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
mov %l4, %o0
cas [%l7], %l6, %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
add   %l4, 1, %l4

P1056: !ST [8] (maybe <- 0x800008) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P1057: !CAS [15] (maybe <- 0x800009) (Int)
add %i3, 192, %l6
lduw [%l6], %o5
mov %o5, %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0
mov %l4, %o1
cas [%l6], %l3, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P1058: !ST [4] (maybe <- 0x80000a) (Int) (LE)
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
stwa   %l3, [%i0 + 64] %asi
add   %l4, 1, %l4

P1059: !CAS [9] (maybe <- 0x80000b) (Int)
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

P1060: !CAS [7] (maybe <- 0x80000c) (Int)
add %i1, 84, %l3
lduw [%l3], %l7
mov %l7, %o5
! move %o5(lower) -> %o2(lower)
or %o5, %o2, %o2
mov %l4, %o3
cas [%l3], %o5, %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P1061: !CASX [8] (maybe <- 0x80000d) (Int)
add %i1, 256, %l3
ldx [%l3], %l7
! move %l7(upper) -> %o3(lower)
srlx %l7, 32, %o5
or %o5, %o3, %o3
! move %l7(lower) -> %o4(upper)
sllx %l7, 32, %o4
mov  %l7, %o5
sllx %l4, 32, %l7
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

P1062: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P1063: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P1064: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P1065: !ST [12] (maybe <- 0x80000e) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P1066: !PREFETCH [11] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i2 + 64] %asi, 1

P1067: !ST [6] (maybe <- 0x80000f) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P1068: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P1069: !LD [2] (Int)
lduw [%i0 + 12], %l7
! move %l7(lower) -> %o0(lower)
or %l7, %o0, %o0

P1070: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P1071: !CAS [2] (maybe <- 0x800010) (Int)
add %i0, 12, %l3
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

P1072: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P1073: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P1074: !ST [8] (maybe <- 0x800011) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P1075: !ST [2] (maybe <- 0x800012) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P1076: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P1077: !PREFETCH [5] (Int) (Branch target of P1876)
prefetch [%i1 + 76], 1
ba P1078
nop

TARGET1876:
ba RET1876
nop


P1078: !ST [10] (maybe <- 0x800013) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P1079: !ST [6] (maybe <- 0x800014) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P1080: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P1081: !CAS [6] (maybe <- 0x800015) (Int)
add %i1, 80, %l3
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

P1082: !PREFETCH [11] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i2 + 64] %asi, 1

P1083: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P1084: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P1085: !ST [13] (maybe <- 0x800016) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P1086: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P1087: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P1088: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P1089: !ST [11] (maybe <- 0x40000001) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i2 + 64 ]

P1090: !CAS [5] (maybe <- 0x800017) (Int) (CBR)
add %i1, 76, %l7
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

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1090
nop
RET1090:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P1091: !CAS [9] (maybe <- 0x800018) (Int)
add %i1, 512, %o5
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

P1092: !CAS [10] (maybe <- 0x800019) (Int)
add %i2, 32, %o5
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

P1093: !ST [12] (maybe <- 0x80001a) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P1094: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P1095: !CASX [15] (maybe <- 0x80001b) (Int)
add %i3, 192, %l7
ldx [%l7], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
mov  %o1, %l6
sllx %l4, 32, %o2
casx [%l7], %l6, %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
add  %l4, 1, %l4

P1096: !LD [9] (Int)
lduw [%i1 + 512], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P1097: !CAS [8] (maybe <- 0x80001c) (Int)
add %i1, 256, %l3
lduw [%l3], %l7
mov %l7, %o5
! move %o5(lower) -> %o3(lower)
or %o5, %o3, %o3
mov %l4, %o4
cas [%l3], %o5, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P1098: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P1099: !ST [6] (maybe <- 0x80001d) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P1100: !DWST [8] (maybe <- 0x80001e) (Int) (LE)
wr %g0, 0x88, %asi
! Change single-word-level endianess (big endian <-> little endian) 
sethi %hi(0xff00ff00), %l7
or %l7, %lo(0xff00ff00), %l7
and %l4, %l7, %l3
srl %l3, 8, %l3
sll %l4, 8, %o5
and %o5, %l7, %o5
or %o5, %l3, %o5
srl %o5, 16, %l3
sll %o5, 16, %o5
srl %o5, 0, %o5
or %o5, %l3, %o5
stxa %o5, [%i1 + 256 ] %asi
add   %l4, 1, %l4

P1101: !ST [9] (maybe <- 0x80001f) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P1102: !CAS [14] (maybe <- 0x800020) (Int)
add %i3, 128, %l6
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

P1103: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P1104: !DWST [7] (maybe <- 0x800021) (Int)
sllx %l4, 32, %l3 
add   %l4, 1, %l4
or %l3, %l4, %l3
stx %l3, [%i1 + 80]
add   %l4, 1, %l4

P1105: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P1106: !MEMBAR (Int)
membar #StoreLoad

P1107: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P1108: !CAS [6] (maybe <- 0x800023) (Int)
add %i1, 80, %l3
lduw [%l3], %l7
mov %l7, %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0
mov %l4, %o1
cas [%l3], %o5, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P1109: !CAS [14] (maybe <- 0x800024) (Int)
add %i3, 128, %l3
lduw [%l3], %l7
mov %l7, %o5
! move %o5(lower) -> %o1(lower)
or %o5, %o1, %o1
mov %l4, %o2
cas [%l3], %o5, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P1110: !ST [9] (maybe <- 0x800025) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P1111: !CASX [9] (maybe <- 0x800026) (Int)
add %i1, 512, %o5
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

P1112: !DWST [10] (maybe <- 0x800027) (Int)
mov %l4, %l7 
sllx %l7, 32, %l7 
stx %l7, [%i2 + 32 ] 
add   %l4, 1, %l4

P1113: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P1114: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P1115: !ST [11] (maybe <- 0x800028) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P1116: !CAS [4] (maybe <- 0x800029) (Int)
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

P1117: !CASX [0] (maybe <- 0x80002a) (Int) (LE)
sllx %l4, 32, %l6
add  %l4, 1, %l4
or   %l4, %l6, %l6
! Change double-word-level endianess (big endian <-> little endian) 
sethi %hi(0xff00ff00), %l3
or %l3, %lo(0xff00ff00), %l3
sllx %l3, 32, %l7
or %l3, %l7, %l3 
and %l6, %l3, %l7
srlx %l7, 8, %l7
sllx %l6, 8, %l6
and %l6, %l3, %l6
or %l6, %l7, %l6 
sethi %hi(0xffff0000), %l3
or %l3, %lo(0xffff0000), %l3
srlx %l6, 16, %l7
andn %l7, %l3, %l7
andn %l6, %l3, %l6
sllx %l6, 16, %l6
or %l6, %l7, %l6 
srlx %l6, 32, %l7
sllx %l6, 32, %l6
or %l6, %l7, %l7 
wr %g0, 0x88, %asi
add %i0, 0, %l6
ldxa [%l6] %asi, %o5
! move %o5(lower) -> %o0(lower)
srl %o5, 0, %l3
or %l3, %o0, %o0
! move %o5(upper) -> %o1(upper)
or %o5, %g0, %o1
mov %o5, %l3
mov  %l7, %o5
casxa [%l6] %asi, %l3, %o5
! move %o5(lower) -> %o1(lower)
srlx %o1, 32, %o1
sllx %o1, 32, %o1
srl %o5, 0, %l6
or %l6, %o1, %o1
! move %o5(upper) -> %o2(upper)
or %o5, %g0, %o2
add  %l4, 1, %l4

P1118: !ST [12] (maybe <- 0x80002c) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P1119: !CASX [12] (maybe <- 0x80002d) (Int)
add %i3, 0, %l3
ldx [%l3], %l7
! move %l7(upper) -> %o2(lower)
srlx %o2, 32, %o2
sllx %o2, 32, %o2
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

P1120: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P1121: !CAS [1] (maybe <- 0x80002e) (Int)
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

P1122: !CAS [10] (maybe <- 0x80002f) (Int)
add %i2, 32, %l3
lduw [%l3], %l7
mov %l7, %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0
mov %l4, %o1
cas [%l3], %o5, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P1123: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P1124: !CAS [13] (maybe <- 0x800030) (Int)
add %i3, 64, %l3
lduw [%l3], %l7
mov %l7, %o5
! move %o5(lower) -> %o1(lower)
or %o5, %o1, %o1
mov %l4, %o2
cas [%l3], %o5, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P1125: !CAS [13] (maybe <- 0x800031) (Int)
add %i3, 64, %l3
lduw [%l3], %l7
mov %l7, %o5
! move %o5(lower) -> %o2(lower)
or %o5, %o2, %o2
mov %l4, %o3
cas [%l3], %o5, %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P1126: !CASX [15] (maybe <- 0x800032) (Int)
add %i3, 192, %l3
ldx [%l3], %l7
! move %l7(upper) -> %o3(lower)
srlx %l7, 32, %o5
or %o5, %o3, %o3
! move %l7(lower) -> %o4(upper)
sllx %l7, 32, %o4
mov  %l7, %o5
sllx %l4, 32, %l7
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

P1127: !ST [3] (maybe <- 0x800033) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P1128: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P1129: !PREFETCH [11] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i2 + 64] %asi, 1

P1130: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P1131: !ST [8] (maybe <- 0x800034) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P1132: !ST [14] (maybe <- 0x800035) (Int) (Branch target of P1134)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4
ba P1133
nop

TARGET1134:
ba RET1134
nop


P1133: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P1134: !PREFETCH [9] (Int) (CBR)
prefetch [%i1 + 512], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1134
nop
RET1134:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P1135: !NOP (Int)
nop

P1136: !CASX [9] (maybe <- 0x800036) (Int)
add %i1, 512, %l7
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

P1137: !CASX [0] (maybe <- 0x800037) (Int)
add %i0, 0, %l7
ldx [%l7], %l3
! move %l3(upper) -> %o2(lower)
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

P1138: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P1139: !ST [3] (maybe <- 0x800039) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P1140: !CAS [7] (maybe <- 0x80003a) (Int) (CBR)
add %i1, 84, %l6
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

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1140
nop
RET1140:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P1141: !REPLACEMENT [2] (Int)
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

P1142: !LD [8] (Int)
lduw [%i1 + 256], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

P1143: !ST [11] (maybe <- 0x80003b) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P1144: !CASX [0] (maybe <- 0x80003c) (Int)
add %i0, 0, %l7
ldx [%l7], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
mov %o1, %l6
sllx %l4, 32, %o2
add  %l4, 1, %l4
or   %l4, %o2, %o2
casx [%l7], %l6, %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
add  %l4, 1, %l4

P1145: !LD [12] (Int)
lduw [%i3 + 0], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P1146: !ST [14] (maybe <- 0x80003e) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P1147: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P1148: !CAS [1] (maybe <- 0x80003f) (Int)
add %i0, 4, %o5
lduw [%o5], %l6
mov %l6, %l7
! move %l7(lower) -> %o3(lower)
or %l7, %o3, %o3
mov %l4, %o4
cas [%o5], %l7, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P1149: !ST [15] (maybe <- 0x800040) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P1150: !CASX [14] (maybe <- 0x800041) (Int)
add %i3, 128, %l7
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

P1151: !CAS [11] (maybe <- 0x800042) (Int)
add %i2, 64, %l7
lduw [%l7], %l3
mov %l3, %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1
mov %l4, %o2
cas [%l7], %l6, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P1152: !DWLD [2] (Int)
ldx [%i0 + 8], %l7
! move %l7(lower) -> %o2(lower)
srl %l7, 0, %l6
or %l6, %o2, %o2

P1153: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P1154: !CASX [4] (maybe <- 0x800043) (Int) (CBR)
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

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1154
nop
RET1154:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P1155: !ST [7] (maybe <- 0x800044) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P1156: !ST [4] (maybe <- 0x800045) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P1157: !CASX [4] (maybe <- 0x800046) (Int)
add %i0, 64, %o5
ldx [%o5], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l7
sllx %l4, 32, %o1
casx [%o5], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P1158: !ST [15] (maybe <- 0x800047) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P1159: !PREFETCH [8] (Int) (Branch target of P1597)
prefetch [%i1 + 256], 1
ba P1160
nop

TARGET1597:
ba RET1597
nop


P1160: !CASX [14] (maybe <- 0x800048) (Int)
add %i3, 128, %l7
ldx [%l7], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov  %o2, %l6
sllx %l4, 32, %o3
casx [%l7], %l6, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4

P1161: !CASX [10] (maybe <- 0x800049) (Int)
add %i2, 32, %l7
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
sllx %l4, 32, %o0
casx [%l7], %l6, %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
add  %l4, 1, %l4

P1162: !ST [3] (maybe <- 0x80004a) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P1163: !CASX [10] (maybe <- 0x80004b) (Int)
add %i2, 32, %l6
ldx [%l6], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
mov  %o1, %l3
sllx %l4, 32, %o2
casx [%l6], %l3, %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
add  %l4, 1, %l4

P1164: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P1165: !CAS [14] (maybe <- 0x80004c) (Int)
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

P1166: !CAS [14] (maybe <- 0x80004d) (Int)
add %i3, 128, %l6
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

P1167: !CASX [0] (maybe <- 0x80004e) (Int)
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

P1168: !SWAP [10] (maybe <- 0x800050) (Int)
mov %l4, %o2
swap  [%i2 + 32], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P1169: !CASX [9] (maybe <- 0x800051) (Int)
add %i1, 512, %l3
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

P1170: !SWAP [8] (maybe <- 0x800052) (Int)
mov %l4, %l6
swap  [%i1 + 256], %l6
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

P1171: !CASX [6] (maybe <- 0x800053) (Int)
add %i1, 80, %o5
ldx [%o5], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l7
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%o5], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P1172: !REPLACEMENT [13] (Int)
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

P1173: !REPLACEMENT [12] (Int)
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

P1174: !ST [0] (maybe <- 0x800055) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P1175: !PREFETCH [8] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i1 + 256] %asi, 1

P1176: !CASX [5] (maybe <- 0x800056) (Int)
add %i1, 72, %l3
ldx [%l3], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov  %o2, %o5
mov %l4, %o3
casx [%l3], %o5, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4

P1177: !CASX [3] (maybe <- 0x800057) (Int)
add %i0, 32, %l3
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

P1178: !CASX [12] (maybe <- 0x800058) (Int)
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

P1179: !CAS [15] (maybe <- 0x800059) (Int) (LE)
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
add %i3, 192, %l3
lduwa [%l3] %asi, %o3
mov %o3, %o5
! move %o5(lower) -> %o3(upper)
sllx %o5, 32, %o3
mov %l6, %l7
casa [%l3] %asi, %o5, %l7
! move %l7(lower) -> %o3(lower)
srl %l7, 0, %l3
or %l3, %o3, %o3
add   %l4, 1, %l4

P1180: !CAS [15] (maybe <- 0x80005a) (Int)
add %i3, 192, %l3
lduw [%l3], %o4
mov %o4, %o5
! move %o5(lower) -> %o4(upper)
sllx %o5, 32, %o4
mov %l4, %l7
cas [%l3], %o5, %l7
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

P1181: !REPLACEMENT [3] (Int)
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

P1182: !CAS [2] (maybe <- 0x80005b) (Int)
add %i0, 12, %o5
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

P1183: !CAS [4] (maybe <- 0x80005c) (Int)
add %i0, 64, %o5
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

P1184: !CAS [2] (maybe <- 0x80005d) (Int)
add %i0, 12, %o5
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

P1185: !CASX [6] (maybe <- 0x80005e) (Int)
add %i1, 80, %o5
ldx [%o5], %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
mov %o3, %l7
sllx %l4, 32, %o4
add  %l4, 1, %l4
or   %l4, %o4, %o4
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

P1186: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P1187: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P1188: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P1189: !LD [8] (Int)
lduw [%i1 + 256], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1190: !ST [9] (maybe <- 0x800060) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P1191: !CAS [3] (maybe <- 0x800061) (Int)
add %i0, 32, %l3
lduw [%l3], %l7
mov %l7, %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0
mov %l4, %o1
cas [%l3], %o5, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P1192: !PREFETCH [13] (Int) (Branch target of P1326)
prefetch [%i3 + 64], 1
ba P1193
nop

TARGET1326:
ba RET1326
nop


P1193: !ST [3] (maybe <- 0x800062) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P1194: !CAS [3] (maybe <- 0x800063) (Int)
add %i0, 32, %o5
lduw [%o5], %l6
mov %l6, %l7
! move %l7(lower) -> %o1(lower)
or %l7, %o1, %o1
mov %l4, %o2
cas [%o5], %l7, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P1195: !LD [4] (Int)
lduw [%i0 + 64], %o5
! move %o5(lower) -> %o2(lower)
or %o5, %o2, %o2

P1196: !CAS [2] (maybe <- 0x800064) (Int) (Branch target of P1364)
add %i0, 12, %l6
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
ba P1197
nop

TARGET1364:
ba RET1364
nop


P1197: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P1198: !ST [11] (maybe <- 0x800065) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P1199: !CASX [7] (maybe <- 0x800066) (Int) (Branch target of P1663)
add %i1, 80, %l3
ldx [%l3], %o4
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5
mov %o4, %o5
sllx %l4, 32, %o0
add  %l4, 1, %l4
or   %l4, %o0, %o0
casx [%l3], %o5, %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
add  %l4, 1, %l4
ba P1200
nop

TARGET1663:
ba RET1663
nop


P1200: !DWLD [12] (Int)
ldx [%i3 + 0], %o1
! move %o1(upper) -> %o1(upper)

P1201: !ST [12] (maybe <- 0x800068) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P1202: !LD [8] (Int)
lduw [%i1 + 256], %l6
! move %l6(lower) -> %o1(lower)
srlx %o1, 32, %o1
sllx %o1, 32, %o1
or %l6, %o1, %o1

P1203: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P1204: !ST [7] (maybe <- 0x800069) (Int) (LE)
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
stwa   %l7, [%i1 + 84] %asi
add   %l4, 1, %l4

P1205: !CASX [15] (maybe <- 0x80006a) (Int)
add %i3, 192, %l7
ldx [%l7], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov  %o2, %l6
sllx %l4, 32, %o3
casx [%l7], %l6, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4

P1206: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P1207: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P1208: !ST [5] (maybe <- 0x80006b) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P1209: !ST [2] (maybe <- 0x80006c) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P1210: !CASX [15] (maybe <- 0x80006d) (Int) (CBR)
add %i3, 192, %l3
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
be,pn  %xcc, TARGET1210
nop
RET1210:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P1211: !CASX [6] (maybe <- 0x80006e) (Int) (LE)
sllx %l4, 32, %l6
add  %l4, 1, %l4
or   %l4, %l6, %l6
! Change double-word-level endianess (big endian <-> little endian) 
sethi %hi(0xff00ff00), %l3
or %l3, %lo(0xff00ff00), %l3
sllx %l3, 32, %l7
or %l3, %l7, %l3 
and %l6, %l3, %l7
srlx %l7, 8, %l7
sllx %l6, 8, %l6
and %l6, %l3, %l6
or %l6, %l7, %l6 
sethi %hi(0xffff0000), %l3
or %l3, %lo(0xffff0000), %l3
srlx %l6, 16, %l7
andn %l7, %l3, %l7
andn %l6, %l3, %l6
sllx %l6, 16, %l6
or %l6, %l7, %l6 
srlx %l6, 32, %l7
sllx %l6, 32, %l6
or %l6, %l7, %l7 
wr %g0, 0x88, %asi
add %i1, 80, %l6
ldxa [%l6] %asi, %o5
! move %o5(lower) -> %o1(upper)
sllx %o5, 32, %o1
! move %o5(upper) -> %o1(lower)
srlx %o5, 32, %l3
or %l3, %o1, %o1
mov %o5, %l3
mov  %l7, %o5
casxa [%l6] %asi, %l3, %o5
! move %o5(lower) -> %o2(upper)
sllx %o5, 32, %o2
! move %o5(upper) -> %o2(lower)
srlx %o5, 32, %l6
or %l6, %o2, %o2
add  %l4, 1, %l4

P1212: !REPLACEMENT [15] (Int)
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

P1213: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P1214: !DWST [5] (maybe <- 0x800070) (Int) (LE)
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
sllx %l3, 32, %l3 
stxa %l3, [%i1 + 72 ] %asi
add   %l4, 1, %l4

P1215: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P1216: !ST [0] (maybe <- 0x800071) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P1217: !CAS [10] (maybe <- 0x800072) (Int)
add %i2, 32, %l7
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

P1218: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P1219: !CASX [13] (maybe <- 0x800073) (Int)
add %i3, 64, %l7
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
sllx %l4, 32, %o0
casx [%l7], %l6, %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
add  %l4, 1, %l4

P1220: !ST [0] (maybe <- 0x800074) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P1221: !ST [1] (maybe <- 0x800075) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P1222: !ST [9] (maybe <- 0x40000002) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i1 + 512 ]

P1223: !ST [6] (maybe <- 0x800076) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P1224: !CASX [4] (maybe <- 0x800077) (Int)
add %i0, 64, %l7
ldx [%l7], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
mov  %o1, %l6
sllx %l4, 32, %o2
casx [%l7], %l6, %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
add  %l4, 1, %l4

P1225: !CASX [11] (maybe <- 0x800078) (Int)
add %i2, 64, %l7
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

P1226: !CAS [12] (maybe <- 0x800079) (Int)
add %i3, 0, %l7
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

P1227: !CAS [9] (maybe <- 0x80007a) (Int)
add %i1, 512, %l7
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

P1228: !CAS [5] (maybe <- 0x80007b) (Int)
add %i1, 76, %l7
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

P1229: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P1230: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P1231: !CASX [0] (maybe <- 0x80007c) (Int)
add %i0, 0, %l7
ldx [%l7], %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
mov %o3, %l6
sllx %l4, 32, %o4
add  %l4, 1, %l4
or   %l4, %o4, %o4
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

P1232: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P1233: !PREFETCH [6] (Int) (Branch target of P1286)
prefetch [%i1 + 80], 1
ba P1234
nop

TARGET1286:
ba RET1286
nop


P1234: !ST [11] (maybe <- 0x80007e) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P1235: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P1236: !CASX [2] (maybe <- 0x80007f) (Int)
add %i0, 8, %l6
ldx [%l6], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l3
mov %l4, %o1
casx [%l6], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P1237: !ST [13] (maybe <- 0x800080) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P1238: !ST [11] (maybe <- 0x40000003) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i2 + 64 ]

P1239: !ST [13] (maybe <- 0x800081) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P1240: !ST [11] (maybe <- 0x800082) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P1241: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P1242: !DWLD [7] (Int)
ldx [%i1 + 80], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)

P1243: !ST [14] (maybe <- 0x800083) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P1244: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P1245: !CASX [0] (maybe <- 0x800084) (Int)
add %i0, 0, %l7
ldx [%l7], %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
mov %o3, %l6
sllx %l4, 32, %o4
add  %l4, 1, %l4
or   %l4, %o4, %o4
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

P1246: !CAS [5] (maybe <- 0x800086) (Int)
add %i1, 76, %l7
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

P1247: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P1248: !ST [13] (maybe <- 0x800087) (Int) (Branch target of P1928)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4
ba P1249
nop

TARGET1928:
ba RET1928
nop


P1249: !ST [4] (maybe <- 0x800088) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P1250: !CAS [3] (maybe <- 0x800089) (Int)
add %i0, 32, %l3
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

P1251: !ST [1] (maybe <- 0x80008a) (Int) (Branch target of P1833)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4
ba P1252
nop

TARGET1833:
ba RET1833
nop


P1252: !ST [5] (maybe <- 0x80008b) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P1253: !CASX [12] (maybe <- 0x80008c) (Int)
add %i3, 0, %l7
ldx [%l7], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov  %o2, %l6
sllx %l4, 32, %o3
casx [%l7], %l6, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4

P1254: !CAS [15] (maybe <- 0x80008d) (Int)
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

P1255: !CAS [3] (maybe <- 0x80008e) (Int)
add %i0, 32, %l7
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

P1256: !CASX [5] (maybe <- 0x80008f) (Int)
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

P1257: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P1258: !ST [15] (maybe <- 0x800090) (Int) (Branch target of P1324)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4
ba P1259
nop

TARGET1324:
ba RET1324
nop


P1259: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P1260: !ST [3] (maybe <- 0x800091) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P1261: !ST [0] (maybe <- 0x40000004) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i0 + 0 ]

P1262: !LD [3] (Int)
lduw [%i0 + 32], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P1263: !CAS [14] (maybe <- 0x800092) (Int)
add %i3, 128, %l6
lduw [%l6], %o5
mov %o5, %l3
! move %l3(lower) -> %o3(lower)
or %l3, %o3, %o3
mov %l4, %o4
cas [%l6], %l3, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P1264: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P1265: !ST [6] (maybe <- 0x800093) (Int) (Branch target of P1140)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4
ba P1266
nop

TARGET1140:
ba RET1140
nop


P1266: !CASX [11] (maybe <- 0x800094) (Int)
add %i2, 64, %l3
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

P1267: !CAS [8] (maybe <- 0x800095) (Int)
add %i1, 256, %l3
lduw [%l3], %l7
mov %l7, %o5
! move %o5(lower) -> %o1(lower)
or %o5, %o1, %o1
mov %l4, %o2
cas [%l3], %o5, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P1268: !PREFETCH [6] (Int) (Branch target of P1512)
prefetch [%i1 + 80], 1
ba P1269
nop

TARGET1512:
ba RET1512
nop


P1269: !CASX [10] (maybe <- 0x800096) (Int)
add %i2, 32, %l3
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

P1270: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P1271: !CASX [8] (maybe <- 0x800097) (Int) (Branch target of P1867)
add %i1, 256, %l3
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
ba P1272
nop

TARGET1867:
ba RET1867
nop


P1272: !CASX [3] (maybe <- 0x800098) (Int)
add %i0, 32, %l3
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

P1273: !ST [2] (maybe <- 0x800099) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P1274: !ST [10] (maybe <- 0x80009a) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P1275: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P1276: !CASX [1] (maybe <- 0x80009b) (Int)
add %i0, 0, %l7
ldx [%l7], %l3
! move %l3(upper) -> %o3(lower)
srlx %l3, 32, %l6
or %l6, %o3, %o3
! move %l3(lower) -> %o4(upper)
sllx %l3, 32, %o4
mov %l3, %l6
sllx %l4, 32, %l3
add  %l4, 1, %l4
or   %l4, %l3, %l3
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

P1277: !ST [11] (maybe <- 0x80009d) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P1278: !ST [8] (maybe <- 0x80009e) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P1279: !ST [5] (maybe <- 0x80009f) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P1280: !REPLACEMENT [2] (Int)
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

P1281: !ST [2] (maybe <- 0x8000a0) (Int) (CBR)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1281
nop
RET1281:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P1282: !PREFETCH [4] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i0 + 64] %asi, 1

P1283: !REPLACEMENT [14] (Int)
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

P1284: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P1285: !REPLACEMENT [9] (Int)
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

P1286: !DWST [5] (maybe <- 0x8000a1) (Int) (CBR)
mov %l4, %o5 
stx %o5, [%i1 + 72]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1286
nop
RET1286:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P1287: !CAS [0] (maybe <- 0x8000a2) (Int)
add %i0, 0, %l3
lduw [%l3], %l7
mov %l7, %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0
mov %l4, %o1
cas [%l3], %o5, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P1288: !CASX [2] (maybe <- 0x8000a3) (Int)
add %i0, 8, %l3
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

P1289: !CAS [7] (maybe <- 0x8000a4) (Int) (LE) (CBR)
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
add %i1, 84, %l3
lduwa [%l3] %asi, %l7
mov %l7, %o5
! move %o5(lower) -> %o3(lower)
or %o5, %o3, %o3
mov %l6, %o4
casa [%l3] %asi, %o5, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1289
nop
RET1289:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P1290: !ST [5] (maybe <- 0x8000a5) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P1291: !REPLACEMENT [2] (Int)
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

P1292: !ST [7] (maybe <- 0x8000a6) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P1293: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P1294: !CASX [8] (maybe <- 0x8000a7) (Int)
add %i1, 256, %l7
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

P1295: !SWAP [15] (maybe <- 0x8000a8) (Int)
mov %l4, %o5
swap  [%i3 + 192], %o5
! move %o5(lower) -> %o1(lower)
srl %o5, 0, %l6
or %l6, %o1, %o1
add   %l4, 1, %l4

P1296: !CASX [1] (maybe <- 0x8000a9) (Int)
add %i0, 0, %l6
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

P1297: !CAS [3] (maybe <- 0x8000ab) (Int)
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

P1298: !CAS [2] (maybe <- 0x8000ac) (Int)
add %i0, 12, %l6
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

P1299: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P1300: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P1301: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P1302: !DWLD [6] (Int)
ldx [%i1 + 80], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)

P1303: !CASX [8] (maybe <- 0x8000ad) (Int) (LE) (Branch target of P2038)
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
add %i1, 256, %o5
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
ba P1304
nop

TARGET2038:
ba RET2038
nop


P1304: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P1305: !ST [15] (maybe <- 0x8000ae) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P1306: !PREFETCH [5] (Int) (LE) (Branch target of P2020)
wr %g0, 0x88, %asi
prefetcha [%i1 + 76] %asi, 1
ba P1307
nop

TARGET2020:
ba RET2020
nop


P1307: !ST [2] (maybe <- 0x8000af) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P1308: !ST [4] (maybe <- 0x8000b0) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P1309: !ST [11] (maybe <- 0x8000b1) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P1310: !CASX [13] (maybe <- 0x8000b2) (Int)
add %i3, 64, %o5
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

P1311: !CAS [8] (maybe <- 0x8000b3) (Int) (LE)
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
add %i1, 256, %o5
lduwa [%o5] %asi, %o1
mov %o1, %l7
! move %l7(lower) -> %o1(upper)
sllx %l7, 32, %o1
mov %l3, %l6
casa [%o5] %asi, %l7, %l6
! move %l6(lower) -> %o1(lower)
srl %l6, 0, %o5
or %o5, %o1, %o1
add   %l4, 1, %l4

P1312: !ST [15] (maybe <- 0x8000b4) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P1313: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P1314: !ST [5] (maybe <- 0x8000b5) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P1315: !ST [5] (maybe <- 0x8000b6) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P1316: !PREFETCH [6] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i1 + 80] %asi, 1

P1317: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P1318: !ST [13] (maybe <- 0x40000005) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i3 + 64 ]

P1319: !ST [6] (maybe <- 0x8000b7) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P1320: !ST [7] (maybe <- 0x8000b8) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P1321: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P1322: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P1323: !REPLACEMENT [12] (Int)
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

P1324: !CAS [2] (maybe <- 0x8000b9) (Int) (CBR)
add %i0, 12, %l3
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

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1324
nop
RET1324:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P1325: !ST [7] (maybe <- 0x8000ba) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P1326: !ST [11] (maybe <- 0x8000bb) (Int) (CBR)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1326
nop
RET1326:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P1327: !LD [15] (Int)
lduw [%i3 + 192], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P1328: !NOP (Int)
nop

P1329: !DWLD [7] (Int)
ldx [%i1 + 80], %l7
! move %l7(upper) -> %o3(lower)
srlx %l7, 32, %l6
or %l6, %o3, %o3
! move %l7(lower) -> %o4(upper)
sllx %l7, 32, %o4

P1330: !ST [14] (maybe <- 0x8000bc) (Int) (LE)
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
stwa   %o5, [%i3 + 128] %asi
add   %l4, 1, %l4

P1331: !ST [2] (maybe <- 0x8000bd) (Int) (Branch target of P1782)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4
ba P1332
nop

TARGET1782:
ba RET1782
nop


P1332: !DWST [9] (maybe <- 0x8000be) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 512 ] 
add   %l4, 1, %l4

P1333: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P1334: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P1335: !ST [9] (maybe <- 0x40000006) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i1 + 512 ]

P1336: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P1337: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P1338: !CAS [6] (maybe <- 0x8000bf) (Int)
add %i1, 80, %l3
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

P1339: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P1340: !SWAP [10] (maybe <- 0x8000c0) (Int)
mov %l4, %l6
swap  [%i2 + 32], %l6
! move %l6(lower) -> %o0(lower)
srl %l6, 0, %o5
or %o5, %o0, %o0
add   %l4, 1, %l4

P1341: !SWAP [15] (maybe <- 0x8000c1) (Int)
mov %l4, %o1
swap  [%i3 + 192], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P1342: !CAS [7] (maybe <- 0x8000c2) (Int)
add %i1, 84, %l7
lduw [%l7], %l3
mov %l3, %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1
mov %l4, %o2
cas [%l7], %l6, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P1343: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P1344: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P1345: !CASX [15] (maybe <- 0x8000c3) (Int) (Branch target of P1948)
add %i3, 192, %l7
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
ba P1346
nop

TARGET1948:
ba RET1948
nop


P1346: !ST [5] (maybe <- 0x8000c4) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P1347: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P1348: !CAS [8] (maybe <- 0x8000c5) (Int)
add %i1, 256, %l6
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

P1349: !ST [0] (maybe <- 0x8000c6) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P1350: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P1351: !CASX [5] (maybe <- 0x8000c7) (Int)
add %i1, 72, %l3
ldx [%l3], %l7
! move %l7(upper) -> %o0(lower)
srlx %l7, 32, %o5
or %o5, %o0, %o0
! move %l7(lower) -> %o1(upper)
sllx %l7, 32, %o1
mov  %l7, %o5
mov %l4, %l7
casx [%l3], %o5, %l7
! move %l7(upper) -> %o1(lower)
srlx %l7, 32, %l3
or %l3, %o1, %o1
! move %l7(lower) -> %o2(upper)
sllx %l7, 32, %o2
add  %l4, 1, %l4

P1352: !CAS [6] (maybe <- 0x8000c8) (Int)
add %i1, 80, %l3
lduw [%l3], %l7
mov %l7, %o5
! move %o5(lower) -> %o2(lower)
or %o5, %o2, %o2
mov %l4, %o3
cas [%l3], %o5, %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P1353: !ST [9] (maybe <- 0x8000c9) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P1354: !DWLD [9] (Int) (LE)
wr %g0, 0x88, %asi
ldxa [%i1 + 512] %asi, %o5
! move %o5(lower) -> %o3(lower)
srl %o5, 0, %l7
or %l7, %o3, %o3

P1355: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P1356: !ST [8] (maybe <- 0x8000ca) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P1357: !CAS [15] (maybe <- 0x8000cb) (Int)
add %i3, 192, %l3
lduw [%l3], %o4
mov %o4, %o5
! move %o5(lower) -> %o4(upper)
sllx %o5, 32, %o4
mov %l4, %l7
cas [%l3], %o5, %l7
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

P1358: !LD [9] (Int)
lduw [%i1 + 512], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1359: !DWST [14] (maybe <- 0x8000cc) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 128 ] 
add   %l4, 1, %l4

P1360: !PREFETCH [10] (Int) (Branch target of P1551)
prefetch [%i2 + 32], 1
ba P1361
nop

TARGET1551:
ba RET1551
nop


P1361: !ST [0] (maybe <- 0x8000cd) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P1362: !ST [4] (maybe <- 0x8000ce) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P1363: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P1364: !DWLD [0] (Int) (CBR)
ldx [%i0 + 0], %o5
! move %o5(upper) -> %o0(lower)
srlx %o5, 32, %l7
or %l7, %o0, %o0
! move %o5(lower) -> %o1(upper)
sllx %o5, 32, %o1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1364
nop
RET1364:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P1365: !ST [11] (maybe <- 0x8000cf) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P1366: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P1367: !ST [13] (maybe <- 0x8000d0) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P1368: !LD [4] (Int)
lduw [%i0 + 64], %l3
! move %l3(lower) -> %o1(lower)
or %l3, %o1, %o1

P1369: !ST [2] (maybe <- 0x8000d1) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P1370: !CASX [15] (maybe <- 0x8000d2) (Int)
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

P1371: !ST [11] (maybe <- 0x8000d3) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P1372: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P1373: !CAS [15] (maybe <- 0x8000d4) (Int)
add %i3, 192, %l3
lduw [%l3], %o4
mov %o4, %o5
! move %o5(lower) -> %o4(upper)
sllx %o5, 32, %o4
mov %l4, %l7
cas [%l3], %o5, %l7
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

P1374: !CASX [2] (maybe <- 0x8000d5) (Int)
add %i0, 8, %l3
ldx [%l3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %o5
mov %l4, %o1
casx [%l3], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P1375: !CASX [2] (maybe <- 0x8000d6) (Int)
add %i0, 8, %l3
ldx [%l3], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov  %o2, %o5
mov %l4, %o3
casx [%l3], %o5, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4

P1376: !DWLD [8] (Int)
ldx [%i1 + 256], %o4
! move %o4(upper) -> %o4(upper)

P1377: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P1378: !CASX [15] (maybe <- 0x8000d7) (Int)
add %i3, 192, %l7
ldx [%l7], %l3
! move %l3(upper) -> %o4(lower)
srlx %o4, 32, %o4
sllx %o4, 32, %o4
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

P1379: !ST [6] (maybe <- 0x8000d8) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P1380: !ST [6] (maybe <- 0x8000d9) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P1381: !ST [8] (maybe <- 0x8000da) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P1382: !CAS [11] (maybe <- 0x8000db) (Int)
add %i2, 64, %o5
lduw [%o5], %l6
mov %l6, %l7
! move %l7(lower) -> %o1(lower)
or %l7, %o1, %o1
mov %l4, %o2
cas [%o5], %l7, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P1383: !CAS [1] (maybe <- 0x8000dc) (Int)
add %i0, 4, %o5
lduw [%o5], %l6
mov %l6, %l7
! move %l7(lower) -> %o2(lower)
or %l7, %o2, %o2
mov %l4, %o3
cas [%o5], %l7, %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P1384: !DWST [13] (maybe <- 0x8000dd) (Int)
mov %l4, %l7 
sllx %l7, 32, %l7 
stx %l7, [%i3 + 64 ] 
add   %l4, 1, %l4

P1385: !ST [2] (maybe <- 0x8000de) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P1386: !ST [6] (maybe <- 0x8000df) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P1387: !ST [13] (maybe <- 0x8000e0) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P1388: !ST [2] (maybe <- 0x40000007) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i0 + 12 ]

P1389: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P1390: !ST [1] (maybe <- 0x8000e1) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P1391: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P1392: !DWLD [3] (Int)
ldx [%i0 + 32], %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %l3
or %l3, %o3, %o3

P1393: !CAS [13] (maybe <- 0x8000e2) (Int)
add %i3, 64, %o5
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

P1394: !CAS [6] (maybe <- 0x8000e3) (Int) (LE)
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
add %i1, 80, %o5
lduwa [%o5] %asi, %o0
mov %o0, %l7
! move %l7(lower) -> %o0(upper)
sllx %l7, 32, %o0
mov %l3, %l6
casa [%o5] %asi, %l7, %l6
! move %l6(lower) -> %o0(lower)
srl %l6, 0, %o5
or %o5, %o0, %o0
add   %l4, 1, %l4

P1395: !ST [6] (maybe <- 0x8000e4) (Int) (Branch target of P1572)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4
ba P1396
nop

TARGET1572:
ba RET1572
nop


P1396: !ST [11] (maybe <- 0x8000e5) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P1397: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P1398: !ST [1] (maybe <- 0x8000e6) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P1399: !PREFETCH [3] (Int) (Branch target of P1850)
prefetch [%i0 + 32], 1
ba P1400
nop

TARGET1850:
ba RET1850
nop


P1400: !CAS [4] (maybe <- 0x8000e7) (Int)
add %i0, 64, %l3
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

P1401: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P1402: !CAS [10] (maybe <- 0x8000e8) (Int)
add %i2, 32, %l3
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

P1403: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P1404: !CAS [12] (maybe <- 0x8000e9) (Int)
add %i3, 0, %l3
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

P1405: !DWST [9] (maybe <- 0x8000ea) (Int)
mov %l4, %o5 
sllx %o5, 32, %o5 
stx %o5, [%i1 + 512 ] 
add   %l4, 1, %l4

P1406: !PREFETCH [13] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i3 + 64] %asi, 1

P1407: !CAS [14] (maybe <- 0x8000eb) (Int)
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

P1408: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P1409: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P1410: !CASX [1] (maybe <- 0x8000ec) (Int)
add %i0, 0, %o5
ldx [%o5], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l7
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%o5], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P1411: !PREFETCH [2] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i0 + 12] %asi, 1

P1412: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P1413: !PREFETCH [9] (Int) (Branch target of P1090)
prefetch [%i1 + 512], 1
ba P1414
nop

TARGET1090:
ba RET1090
nop


P1414: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P1415: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P1416: !CAS [4] (maybe <- 0x8000ee) (Int)
add %i0, 64, %o5
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

P1417: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P1418: !DWST [12] (maybe <- 0x8000ef) (Int)
mov %l4, %l7 
sllx %l7, 32, %l7 
stx %l7, [%i3 + 0 ] 
add   %l4, 1, %l4

P1419: !CASX [1] (maybe <- 0x8000f0) (Int)
add %i0, 0, %l7
ldx [%l7], %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
mov %o3, %l6
sllx %l4, 32, %o4
add  %l4, 1, %l4
or   %l4, %o4, %o4
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

P1420: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P1421: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P1422: !DWLD [14] (Int)
ldx [%i3 + 128], %o0
! move %o0(upper) -> %o0(upper)

P1423: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P1424: !CAS [6] (maybe <- 0x8000f2) (Int)
add %i1, 80, %l3
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

P1425: !ST [11] (maybe <- 0x8000f3) (Int) (CBR)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1425
nop
RET1425:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P1426: !SWAP [3] (maybe <- 0x8000f4) (Int)
mov %l4, %l6
swap  [%i0 + 32], %l6
! move %l6(lower) -> %o1(lower)
srl %l6, 0, %o5
or %o5, %o1, %o1
add   %l4, 1, %l4

P1427: !CAS [9] (maybe <- 0x8000f5) (Int)
add %i1, 512, %o5
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

P1428: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P1429: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P1430: !CASX [14] (maybe <- 0x8000f6) (Int)
add %i3, 128, %o5
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

P1431: !ST [3] (maybe <- 0x40000008) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i0 + 32 ]

P1432: !ST [1] (maybe <- 0x8000f7) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P1433: !DWST [1] (maybe <- 0x8000f8) (Int)
sllx %l4, 32, %l3 
add   %l4, 1, %l4
or %l3, %l4, %l3
stx %l3, [%i0 + 0]
add   %l4, 1, %l4

P1434: !CASX [8] (maybe <- 0x8000fa) (Int)
add %i1, 256, %l3
ldx [%l3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %o5
sllx %l4, 32, %o1
casx [%l3], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P1435: !PREFETCH [8] (Int) (Branch target of P1537)
prefetch [%i1 + 256], 1
ba P1436
nop

TARGET1537:
ba RET1537
nop


P1436: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P1437: !ST [13] (maybe <- 0x8000fb) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P1438: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P1439: !ST [10] (maybe <- 0x8000fc) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P1440: !ST [9] (maybe <- 0x40000009) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i1 + 512 ]

P1441: !CAS [2] (maybe <- 0x8000fd) (Int)
add %i0, 12, %l6
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

P1442: !ST [2] (maybe <- 0x8000fe) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P1443: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P1444: !ST [14] (maybe <- 0x8000ff) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P1445: !ST [4] (maybe <- 0x800100) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P1446: !CAS [13] (maybe <- 0x800101) (Int)
add %i3, 64, %l7
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

P1447: !CASX [4] (maybe <- 0x800102) (Int)
add %i0, 64, %l7
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
sllx %l4, 32, %o0
casx [%l7], %l6, %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
add  %l4, 1, %l4

P1448: !ST [8] (maybe <- 0x800103) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P1449: !CAS [10] (maybe <- 0x800104) (Int)
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

P1450: !ST [14] (maybe <- 0x800105) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P1451: !DWST [0] (maybe <- 0x800106) (Int)
sllx %l4, 32, %o5 
add   %l4, 1, %l4
or %o5, %l4, %o5
stx %o5, [%i0 + 0]
add   %l4, 1, %l4

P1452: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P1453: !ST [9] (maybe <- 0x800108) (Int) (LE)
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
stwa   %l7, [%i1 + 512] %asi
add   %l4, 1, %l4

P1454: !ST [5] (maybe <- 0x800109) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P1455: !ST [0] (maybe <- 0x80010a) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P1456: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P1457: !CASX [7] (maybe <- 0x80010b) (Int)
add %i1, 80, %l3
ldx [%l3], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov %o2, %o5
sllx %l4, 32, %o3
add  %l4, 1, %l4
or   %l4, %o3, %o3
casx [%l3], %o5, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4

P1458: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P1459: !ST [12] (maybe <- 0x80010d) (Int) (LE)
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

P1460: !ST [1] (maybe <- 0x80010e) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P1461: !ST [5] (maybe <- 0x80010f) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P1462: !CAS [9] (maybe <- 0x800110) (Int)
add %i1, 512, %l6
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

P1463: !REPLACEMENT [7] (Int) (Branch target of P1748)
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
ba P1464
nop

TARGET1748:
ba RET1748
nop


P1464: !LD [7] (Int)
lduw [%i1 + 84], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1465: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P1466: !CAS [11] (maybe <- 0x800111) (Int)
add %i2, 64, %l7
lduw [%l7], %l3
mov %l3, %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0
mov %l4, %o1
cas [%l7], %l6, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P1467: !CAS [3] (maybe <- 0x800112) (Int)
add %i0, 32, %l7
lduw [%l7], %l3
mov %l3, %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1
mov %l4, %o2
cas [%l7], %l6, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P1468: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P1469: !ST [15] (maybe <- 0x800113) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P1470: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P1471: !CAS [14] (maybe <- 0x800114) (Int)
add %i3, 128, %l6
lduw [%l6], %o5
mov %o5, %l3
! move %l3(lower) -> %o2(lower)
or %l3, %o2, %o2
mov %l4, %o3
cas [%l6], %l3, %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P1472: !ST [14] (maybe <- 0x800115) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P1473: !CASX [4] (maybe <- 0x800116) (Int)
add %i0, 64, %l3
ldx [%l3], %l7
! move %l7(upper) -> %o3(lower)
srlx %l7, 32, %o5
or %o5, %o3, %o3
! move %l7(lower) -> %o4(upper)
sllx %l7, 32, %o4
mov  %l7, %o5
sllx %l4, 32, %l7
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

P1474: !ST [9] (maybe <- 0x800117) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P1475: !ST [9] (maybe <- 0x800118) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P1476: !ST [4] (maybe <- 0x800119) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P1477: !DWLD [6] (Int) (Branch target of P1733)
ldx [%i1 + 80], %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l3
or %l3, %o0, %o0
! move %l6(lower) -> %o1(upper)
sllx %l6, 32, %o1
ba P1478
nop

TARGET1733:
ba RET1733
nop


P1478: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P1479: !CAS [13] (maybe <- 0x80011a) (Int)
add %i3, 64, %o5
lduw [%o5], %l6
mov %l6, %l7
! move %l7(lower) -> %o1(lower)
or %l7, %o1, %o1
mov %l4, %o2
cas [%o5], %l7, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P1480: !CAS [8] (maybe <- 0x80011b) (Int)
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

P1481: !SWAP [0] (maybe <- 0x80011c) (Int)
mov %l4, %l3
swap  [%i0 + 0], %l3
! move %l3(lower) -> %o3(lower)
srl %l3, 0, %l7
or %l7, %o3, %o3
add   %l4, 1, %l4

P1482: !ST [12] (maybe <- 0x80011d) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P1483: !CASX [2] (maybe <- 0x80011e) (Int)
add %i0, 8, %l6
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

P1484: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P1485: !PREFETCH [7] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i1 + 84] %asi, 1

P1486: !CASX [13] (maybe <- 0x80011f) (Int)
add %i3, 64, %l6
ldx [%l6], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
mov  %o1, %l3
sllx %l4, 32, %o2
casx [%l6], %l3, %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
add  %l4, 1, %l4

P1487: !ST [12] (maybe <- 0x800120) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P1488: !CASX [3] (maybe <- 0x800121) (Int)
add %i0, 32, %l3
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

P1489: !ST [3] (maybe <- 0x800122) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P1490: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P1491: !ST [11] (maybe <- 0x800123) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P1492: !ST [7] (maybe <- 0x800124) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P1493: !CAS [4] (maybe <- 0x800125) (Int)
add %i0, 64, %l6
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

P1494: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P1495: !CASX [15] (maybe <- 0x800126) (Int)
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

P1496: !ST [12] (maybe <- 0x800127) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P1497: !CASX [1] (maybe <- 0x800128) (Int)
add %i0, 0, %l3
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

P1498: !CASX [0] (maybe <- 0x80012a) (Int)
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

P1499: !ST [8] (maybe <- 0x80012c) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P1500: !DWST [13] (maybe <- 0x80012d) (Int)
mov %l4, %l7 
sllx %l7, 32, %l7 
stx %l7, [%i3 + 64 ] 
add   %l4, 1, %l4

P1501: !CAS [5] (maybe <- 0x80012e) (Int) (LE) (CBR)
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
add %i1, 76, %l7
lduwa [%l7] %asi, %o2
mov %o2, %l6
! move %l6(lower) -> %o2(upper)
sllx %l6, 32, %o2
mov %o5, %l3
casa [%l7] %asi, %l6, %l3
! move %l3(lower) -> %o2(lower)
srl %l3, 0, %l7
or %l7, %o2, %o2
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1501
nop
RET1501:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P1502: !CASX [1] (maybe <- 0x80012f) (Int)
add %i0, 0, %o5
ldx [%o5], %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
mov %o3, %l7
sllx %l4, 32, %o4
add  %l4, 1, %l4
or   %l4, %o4, %o4
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

P1503: !CAS [3] (maybe <- 0x800131) (Int)
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

P1504: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P1505: !REPLACEMENT [8] (Int)
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

P1506: !CASX [10] (maybe <- 0x800132) (Int)
add %i2, 32, %l7
ldx [%l7], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
mov  %o1, %l6
sllx %l4, 32, %o2
casx [%l7], %l6, %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
add  %l4, 1, %l4

P1507: !ST [6] (maybe <- 0x800133) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P1508: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P1509: !CAS [2] (maybe <- 0x800134) (Int) (LE)
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
add %i0, 12, %l6
lduwa [%l6] %asi, %o3
mov %o3, %l3
! move %l3(lower) -> %o3(upper)
sllx %l3, 32, %o3
mov %l7, %o5
casa [%l6] %asi, %l3, %o5
! move %o5(lower) -> %o3(lower)
srl %o5, 0, %l6
or %l6, %o3, %o3
add   %l4, 1, %l4

P1510: !ST [3] (maybe <- 0x800135) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P1511: !PREFETCH [15] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i3 + 192] %asi, 1

P1512: !CAS [14] (maybe <- 0x800136) (Int) (CBR)
add %i3, 128, %l3
lduw [%l3], %o4
mov %o4, %o5
! move %o5(lower) -> %o4(upper)
sllx %o5, 32, %o4
mov %l4, %l7
cas [%l3], %o5, %l7
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

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1512
nop
RET1512:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P1513: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P1514: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P1515: !PREFETCH [6] (Int) (CBR)
prefetch [%i1 + 80], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1515
nop
RET1515:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P1516: !ST [4] (maybe <- 0x800137) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P1517: !CASX [8] (maybe <- 0x800138) (Int)
add %i1, 256, %l6
ldx [%l6], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l3
sllx %l4, 32, %o1
casx [%l6], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P1518: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P1519: !LD [12] (Int)
lduw [%i3 + 0], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P1520: !DWST [0] (maybe <- 0x800139) (Int)
sllx %l4, 32, %l7 
add   %l4, 1, %l4
or %l7, %l4, %l7
stx %l7, [%i0 + 0]
add   %l4, 1, %l4

P1521: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P1522: !CAS [4] (maybe <- 0x80013b) (Int)
add %i0, 64, %l7
lduw [%l7], %l3
mov %l3, %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2
mov %l4, %o3
cas [%l7], %l6, %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P1523: !LD [1] (Int)
lduw [%i0 + 4], %l7
! move %l7(lower) -> %o3(lower)
or %l7, %o3, %o3

P1524: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P1525: !CASX [12] (maybe <- 0x80013c) (Int)
add %i3, 0, %l3
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

P1526: !ST [9] (maybe <- 0x80013d) (Int) (LE) (CBR)
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
stwa   %o5, [%i1 + 512] %asi
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1526
nop
RET1526:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P1527: !ST [4] (maybe <- 0x80013e) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P1528: !CASX [2] (maybe <- 0x80013f) (Int)
add %i0, 8, %o5
ldx [%o5], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
mov  %o1, %l7
mov %l4, %o2
casx [%o5], %l7, %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
add  %l4, 1, %l4

P1529: !ST [2] (maybe <- 0x800140) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P1530: !ST [13] (maybe <- 0x800141) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P1531: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P1532: !ST [8] (maybe <- 0x800142) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P1533: !CAS [3] (maybe <- 0x800143) (Int)
add %i0, 32, %l3
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

P1534: !CAS [15] (maybe <- 0x800144) (Int)
add %i3, 192, %l3
lduw [%l3], %o4
mov %o4, %o5
! move %o5(lower) -> %o4(upper)
sllx %o5, 32, %o4
mov %l4, %l7
cas [%l3], %o5, %l7
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

P1535: !DWLD [8] (Int)
ldx [%i1 + 256], %o0
! move %o0(upper) -> %o0(upper)

P1536: !CAS [5] (maybe <- 0x800145) (Int)
add %i1, 76, %l7
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

P1537: !ST [15] (maybe <- 0x800146) (Int) (CBR)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1537
nop
RET1537:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P1538: !CAS [4] (maybe <- 0x800147) (Int)
add %i0, 64, %l7
lduw [%l7], %l3
mov %l3, %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1
mov %l4, %o2
cas [%l7], %l6, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P1539: !ST [9] (maybe <- 0x800148) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P1540: !REPLACEMENT [7] (Int)
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

P1541: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P1542: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P1543: !CASX [11] (maybe <- 0x800149) (Int)
add %i2, 64, %l3
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

P1544: !REPLACEMENT [15] (Int)
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

P1545: !ST [7] (maybe <- 0x80014a) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P1546: !CAS [15] (maybe <- 0x80014b) (Int)
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

P1547: !ST [6] (maybe <- 0x80014c) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P1548: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P1549: !CAS [1] (maybe <- 0x80014d) (Int)
add %i0, 4, %l6
lduw [%l6], %o5
mov %o5, %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0
mov %l4, %o1
cas [%l6], %l3, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P1550: !ST [4] (maybe <- 0x80014e) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P1551: !PREFETCH [12] (Int) (CBR)
prefetch [%i3 + 0], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1551
nop
RET1551:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P1552: !CAS [8] (maybe <- 0x80014f) (Int)
add %i1, 256, %l6
lduw [%l6], %o5
mov %o5, %l3
! move %l3(lower) -> %o1(lower)
or %l3, %o1, %o1
mov %l4, %o2
cas [%l6], %l3, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P1553: !ST [0] (maybe <- 0x800150) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P1554: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P1555: !CAS [10] (maybe <- 0x800151) (Int)
add %i2, 32, %l3
lduw [%l3], %l7
mov %l7, %o5
! move %o5(lower) -> %o2(lower)
or %o5, %o2, %o2
mov %l4, %o3
cas [%l3], %o5, %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P1556: !ST [5] (maybe <- 0x800152) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P1557: !CAS [8] (maybe <- 0x800153) (Int)
add %i1, 256, %o5
lduw [%o5], %l6
mov %l6, %l7
! move %l7(lower) -> %o3(lower)
or %l7, %o3, %o3
mov %l4, %o4
cas [%o5], %l7, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P1558: !ST [7] (maybe <- 0x800154) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P1559: !CAS [10] (maybe <- 0x800155) (Int)
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

P1560: !CAS [14] (maybe <- 0x800156) (Int)
add %i3, 128, %l7
lduw [%l7], %l3
mov %l3, %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0
mov %l4, %o1
cas [%l7], %l6, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P1561: !ST [3] (maybe <- 0x800157) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P1562: !CAS [0] (maybe <- 0x800158) (Int)
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

P1563: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P1564: !PREFETCH [11] (Int) (CBR)
prefetch [%i2 + 64], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1564
nop
RET1564:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P1565: !LD [0] (Int)
lduw [%i0 + 0], %l7
! move %l7(lower) -> %o2(lower)
or %l7, %o2, %o2

P1566: !ST [0] (maybe <- 0x800159) (Int) (LE)
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
stwa   %o5, [%i0 + 0] %asi
add   %l4, 1, %l4

P1567: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P1568: !ST [13] (maybe <- 0x80015a) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P1569: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P1570: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P1571: !ST [12] (maybe <- 0x80015b) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P1572: !PREFETCH [10] (Int) (CBR)
prefetch [%i2 + 32], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1572
nop
RET1572:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P1573: !DWLD [1] (Int)
ldx [%i0 + 0], %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)

P1574: !REPLACEMENT [0] (Int)
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

P1575: !ST [11] (maybe <- 0x80015c) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P1576: !CAS [7] (maybe <- 0x80015d) (Int) (Branch target of P1616)
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
ba P1577
nop

TARGET1616:
ba RET1616
nop


P1577: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P1578: !ST [15] (maybe <- 0x80015e) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P1579: !ST [10] (maybe <- 0x80015f) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P1580: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P1581: !REPLACEMENT [14] (Int)
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

P1582: !CAS [15] (maybe <- 0x800160) (Int)
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

P1583: !ST [4] (maybe <- 0x800161) (Int) (Branch target of P1800)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4
ba P1584
nop

TARGET1800:
ba RET1800
nop


P1584: !ST [15] (maybe <- 0x800162) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P1585: !ST [10] (maybe <- 0x800163) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P1586: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P1587: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P1588: !CAS [14] (maybe <- 0x800164) (Int)
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

P1589: !ST [11] (maybe <- 0x800165) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P1590: !CAS [15] (maybe <- 0x800166) (Int)
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

P1591: !ST [13] (maybe <- 0x800167) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P1592: !CASX [9] (maybe <- 0x800168) (Int)
add %i1, 512, %l7
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

P1593: !ST [12] (maybe <- 0x800169) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P1594: !CASX [13] (maybe <- 0x80016a) (Int)
add %i3, 64, %l6
ldx [%l6], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l3
sllx %l4, 32, %o1
casx [%l6], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P1595: !PREFETCH [15] (Int) (Branch target of P1870)
prefetch [%i3 + 192], 1
ba P1596
nop

TARGET1870:
ba RET1870
nop


P1596: !CASX [9] (maybe <- 0x80016b) (Int)
add %i1, 512, %l6
ldx [%l6], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov  %o2, %l3
sllx %l4, 32, %o3
casx [%l6], %l3, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4

P1597: !ST [1] (maybe <- 0x80016c) (Int) (CBR)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1597
nop
RET1597:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P1598: !LD [5] (Int) (Branch target of P1526)
lduw [%i1 + 76], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
ba P1599
nop

TARGET1526:
ba RET1526
nop


P1599: !CAS [9] (maybe <- 0x80016d) (Int)
add %i1, 512, %o5
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

P1600: !CAS [2] (maybe <- 0x80016e) (Int)
add %i0, 12, %o5
lduw [%o5], %l6
mov %l6, %l7
! move %l7(lower) -> %o0(lower)
or %l7, %o0, %o0
mov %l4, %o1
cas [%o5], %l7, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P1601: !DWST [11] (maybe <- 0x80016f) (Int)
mov %l4, %l7 
sllx %l7, 32, %l7 
stx %l7, [%i2 + 64 ] 
add   %l4, 1, %l4

P1602: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P1603: !CASX [7] (maybe <- 0x800170) (Int) (LE)
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
add %i1, 80, %l7
ldxa [%l7] %asi, %l3
! move %l3(lower) -> %o1(lower)
srl %l3, 0, %l6
or %l6, %o1, %o1
! move %l3(upper) -> %o2(upper)
or %l3, %g0, %o2
mov %l3, %l6
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

P1604: !ST [2] (maybe <- 0x800172) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P1605: !CASX [4] (maybe <- 0x800173) (Int)
add %i0, 64, %l6
ldx [%l6], %o5
! move %o5(upper) -> %o3(lower)
srlx %o3, 32, %o3
sllx %o3, 32, %o3
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

P1606: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P1607: !CASX [13] (maybe <- 0x800174) (Int)
add %i3, 64, %l6
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

P1608: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P1609: !ST [11] (maybe <- 0x800175) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P1610: !ST [9] (maybe <- 0x800176) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P1611: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P1612: !ST [2] (maybe <- 0x800177) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P1613: !ST [5] (maybe <- 0x4000000a) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i1 + 76 ]

P1614: !REPLACEMENT [3] (Int)
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

P1615: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P1616: !PREFETCH [11] (Int) (CBR)
prefetch [%i2 + 64], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1616
nop
RET1616:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P1617: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P1618: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P1619: !ST [13] (maybe <- 0x800178) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P1620: !ST [13] (maybe <- 0x800179) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P1621: !ST [7] (maybe <- 0x80017a) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P1622: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P1623: !LD [8] (Int)
lduw [%i1 + 256], %l7
! move %l7(lower) -> %o2(lower)
or %l7, %o2, %o2

P1624: !ST [7] (maybe <- 0x80017b) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P1625: !CAS [6] (maybe <- 0x80017c) (Int)
add %i1, 80, %o5
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

P1626: !LD [7] (Int) (LE)
wr %g0, 0x88, %asi
lduwa [%i1 + 84] %asi, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P1627: !ST [4] (maybe <- 0x4000000b) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i0 + 64 ]

P1628: !ST [10] (maybe <- 0x80017d) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P1629: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P1630: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P1631: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P1632: !PREFETCH [0] (Int) (Branch target of P1951)
prefetch [%i0 + 0], 1
ba P1633
nop

TARGET1951:
ba RET1951
nop


P1633: !DWST [12] (maybe <- 0x80017e) (Int)
mov %l4, %l7 
sllx %l7, 32, %l7 
stx %l7, [%i3 + 0 ] 
add   %l4, 1, %l4

P1634: !ST [1] (maybe <- 0x80017f) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P1635: !CASX [2] (maybe <- 0x800180) (Int)
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

P1636: !ST [8] (maybe <- 0x800181) (Int) (Branch target of P1281)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4
ba P1637
nop

TARGET1281:
ba RET1281
nop


P1637: !CAS [4] (maybe <- 0x800182) (Int)
add %i0, 64, %l3
lduw [%l3], %l7
mov %l7, %o5
! move %o5(lower) -> %o1(lower)
or %o5, %o1, %o1
mov %l4, %o2
cas [%l3], %o5, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P1638: !CASX [11] (maybe <- 0x800183) (Int) (LE)
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
add %i2, 64, %l3
ldxa [%l3] %asi, %l7
! move %l7(lower) -> %o2(lower)
srl %l7, 0, %o5
or %o5, %o2, %o2
! move %l7(upper) -> %o3(upper)
or %l7, %g0, %o3
mov  %l7, %o5
mov  %l6, %l7
casxa [%l3] %asi, %o5, %l7
! move %l7(lower) -> %o3(lower)
srlx %o3, 32, %o3
sllx %o3, 32, %o3
srl %l7, 0, %l3
or %l3, %o3, %o3
! move %l7(upper) -> %o4(upper)
or %l7, %g0, %o4
add  %l4, 1, %l4

P1639: !ST [12] (maybe <- 0x800184) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P1640: !CAS [15] (maybe <- 0x800185) (Int)
add %i3, 192, %o5
lduw [%o5], %l6
mov %l6, %l7
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
mov %l4, %o0
cas [%o5], %l7, %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
add   %l4, 1, %l4

P1641: !ST [11] (maybe <- 0x800186) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P1642: !ST [13] (maybe <- 0x800187) (Int) (CBR)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1642
nop
RET1642:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P1643: !ST [1] (maybe <- 0x800188) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P1644: !CAS [8] (maybe <- 0x800189) (Int)
add %i1, 256, %l6
lduw [%l6], %o5
mov %o5, %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0
mov %l4, %o1
cas [%l6], %l3, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P1645: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P1646: !CAS [5] (maybe <- 0x80018a) (Int)
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

P1647: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P1648: !ST [3] (maybe <- 0x80018b) (Int) (LE)
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
stwa   %l3, [%i0 + 32] %asi
add   %l4, 1, %l4

P1649: !ST [15] (maybe <- 0x4000000c) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i3 + 192 ]

P1650: !CASX [4] (maybe <- 0x80018c) (Int)
add %i0, 64, %o5
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

P1651: !CAS [14] (maybe <- 0x80018d) (Int)
add %i3, 128, %o5
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

P1652: !CAS [0] (maybe <- 0x80018e) (Int)
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

P1653: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P1654: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P1655: !CASX [3] (maybe <- 0x80018f) (Int)
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

P1656: !ST [4] (maybe <- 0x800190) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P1657: !ST [9] (maybe <- 0x800191) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P1658: !CAS [14] (maybe <- 0x800192) (Int)
add %i3, 128, %l6
lduw [%l6], %o5
mov %o5, %l3
! move %l3(lower) -> %o3(lower)
or %l3, %o3, %o3
mov %l4, %o4
cas [%l6], %l3, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P1659: !ST [9] (maybe <- 0x800193) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P1660: !MEMBAR (Int)
membar #StoreLoad

P1661: !CASX [10] (maybe <- 0x800194) (Int) (CBR)
add %i2, 32, %l3
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

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1661
nop
RET1661:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P1662: !CAS [11] (maybe <- 0x800195) (Int) (Branch target of P1840)
add %i2, 64, %l6
lduw [%l6], %o5
mov %o5, %l3
! move %l3(lower) -> %o1(lower)
or %l3, %o1, %o1
mov %l4, %o2
cas [%l6], %l3, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4
ba P1663
nop

TARGET1840:
ba RET1840
nop


P1663: !DWST [0] (maybe <- 0x800196) (Int) (CBR)
sllx %l4, 32, %l3 
add   %l4, 1, %l4
or %l3, %l4, %l3
stx %l3, [%i0 + 0]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1663
nop
RET1663:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P1664: !LD [1] (Int)
lduw [%i0 + 4], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2

P1665: !CAS [15] (maybe <- 0x800198) (Int) (LE)
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
add %i3, 192, %o5
lduwa [%o5] %asi, %o3
mov %o3, %l7
! move %l7(lower) -> %o3(upper)
sllx %l7, 32, %o3
mov %l3, %l6
casa [%o5] %asi, %l7, %l6
! move %l6(lower) -> %o3(lower)
srl %l6, 0, %o5
or %o5, %o3, %o3
add   %l4, 1, %l4

P1666: !REPLACEMENT [12] (Int)
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

P1667: !ST [13] (maybe <- 0x800199) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P1668: !CASX [0] (maybe <- 0x80019a) (Int)
add %i0, 0, %l6
ldx [%l6], %o4
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5
mov %o4, %l3
sllx %l4, 32, %o0
add  %l4, 1, %l4
or   %l4, %o0, %o0
casx [%l6], %l3, %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
add  %l4, 1, %l4

P1669: !SWAP [3] (maybe <- 0x80019c) (Int)
mov %l4, %o1
swap  [%i0 + 32], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P1670: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P1671: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P1672: !CAS [9] (maybe <- 0x80019d) (Int)
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

P1673: !ST [10] (maybe <- 0x80019e) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P1674: !ST [12] (maybe <- 0x80019f) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P1675: !CAS [0] (maybe <- 0x8001a0) (Int)
add %i0, 0, %l7
lduw [%l7], %l3
mov %l3, %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2
mov %l4, %o3
cas [%l7], %l6, %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P1676: !ST [6] (maybe <- 0x8001a1) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P1677: !ST [7] (maybe <- 0x8001a2) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P1678: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P1679: !ST [15] (maybe <- 0x8001a3) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P1680: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P1681: !CAS [15] (maybe <- 0x8001a4) (Int)
add %i3, 192, %o5
lduw [%o5], %l6
mov %l6, %l7
! move %l7(lower) -> %o3(lower)
or %l7, %o3, %o3
mov %l4, %o4
cas [%o5], %l7, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P1682: !LD [3] (Int)
lduw [%i0 + 32], %o5
! move %o5(lower) -> %o4(lower)
or %o5, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P1683: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P1684: !CASX [1] (maybe <- 0x8001a5) (Int)
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

P1685: !CASX [1] (maybe <- 0x8001a7) (Int)
add %i0, 0, %l6
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

P1686: !ST [13] (maybe <- 0x8001a9) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P1687: !CASX [11] (maybe <- 0x8001aa) (Int)
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

P1688: !ST [10] (maybe <- 0x8001ab) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P1689: !CAS [10] (maybe <- 0x8001ac) (Int)
add %i2, 32, %o5
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

P1690: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P1691: !DWST [9] (maybe <- 0x8001ad) (Int)
mov %l4, %l7 
sllx %l7, 32, %l7 
stx %l7, [%i1 + 512 ] 
add   %l4, 1, %l4

P1692: !ST [13] (maybe <- 0x8001ae) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P1693: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P1694: !CASX [4] (maybe <- 0x8001af) (Int)
add %i0, 64, %l6
ldx [%l6], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov  %o2, %l3
sllx %l4, 32, %o3
casx [%l6], %l3, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4

P1695: !CAS [10] (maybe <- 0x8001b0) (Int)
add %i2, 32, %l6
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

P1696: !CASX [13] (maybe <- 0x8001b1) (Int)
add %i3, 64, %l6
ldx [%l6], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l3
sllx %l4, 32, %o1
casx [%l6], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P1697: !CASX [4] (maybe <- 0x8001b2) (Int)
add %i0, 64, %l6
ldx [%l6], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov  %o2, %l3
sllx %l4, 32, %o3
casx [%l6], %l3, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4

P1698: !ST [11] (maybe <- 0x8001b3) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P1699: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P1700: !LD [10] (FP)
ld [%i2 + 32], %f0
! 1 addresses covered

P1701: !ST [15] (maybe <- 0x4000000d) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i3 + 192 ]

P1702: !ST [8] (maybe <- 0x8001b4) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P1703: !ST [8] (maybe <- 0x8001b5) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P1704: !LD [4] (Int)
lduw [%i0 + 64], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P1705: !CAS [3] (maybe <- 0x8001b6) (Int)
add %i0, 32, %o5
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

P1706: !ST [4] (maybe <- 0x8001b7) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P1707: !CASX [1] (maybe <- 0x8001b8) (Int)
add %i0, 0, %l7
ldx [%l7], %l3
! move %l3(upper) -> %o0(lower)
srlx %l3, 32, %l6
or %l6, %o0, %o0
! move %l3(lower) -> %o1(upper)
sllx %l3, 32, %o1
mov %l3, %l6
sllx %l4, 32, %l3
add  %l4, 1, %l4
or   %l4, %l3, %l3
casx [%l7], %l6, %l3
! move %l3(upper) -> %o1(lower)
srlx %l3, 32, %l7
or %l7, %o1, %o1
! move %l3(lower) -> %o2(upper)
sllx %l3, 32, %o2
add  %l4, 1, %l4

P1708: !ST [3] (maybe <- 0x8001ba) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P1709: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P1710: !CAS [2] (maybe <- 0x8001bb) (Int)
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

P1711: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P1712: !ST [14] (maybe <- 0x4000000e) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i3 + 128 ]

P1713: !CAS [7] (maybe <- 0x8001bc) (Int)
add %i1, 84, %l3
lduw [%l3], %l7
mov %l7, %o5
! move %o5(lower) -> %o3(lower)
or %o5, %o3, %o3
mov %l4, %o4
cas [%l3], %o5, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P1714: !LD [13] (Int)
lduw [%i3 + 64], %l3
! move %l3(lower) -> %o4(lower)
or %l3, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P1715: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P1716: !CASX [12] (maybe <- 0x8001bd) (Int)
add %i3, 0, %l7
ldx [%l7], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l6
sllx %l4, 32, %o1
casx [%l7], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P1717: !ST [7] (maybe <- 0x8001be) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P1718: !ST [13] (maybe <- 0x8001bf) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P1719: !PREFETCH [12] (Int) (Branch target of P1289)
prefetch [%i3 + 0], 1
ba P1720
nop

TARGET1289:
ba RET1289
nop


P1720: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P1721: !CAS [13] (maybe <- 0x8001c0) (Int)
add %i3, 64, %l3
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

P1722: !ST [8] (maybe <- 0x4000000f) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i1 + 256 ]

P1723: !ST [14] (maybe <- 0x8001c1) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P1724: !CASX [11] (maybe <- 0x8001c2) (Int)
add %i2, 64, %l7
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

P1725: !CAS [4] (maybe <- 0x8001c3) (Int)
add %i0, 64, %l7
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

P1726: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P1727: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P1728: !ST [10] (maybe <- 0x8001c4) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P1729: !ST [11] (maybe <- 0x8001c5) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P1730: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P1731: !ST [3] (maybe <- 0x8001c6) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P1732: !CASX [11] (maybe <- 0x8001c7) (Int)
add %i2, 64, %o5
ldx [%o5], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
mov  %o1, %l7
sllx %l4, 32, %o2
casx [%o5], %l7, %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
add  %l4, 1, %l4

P1733: !CAS [13] (maybe <- 0x8001c8) (Int) (CBR)
add %i3, 64, %o5
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

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1733
nop
RET1733:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P1734: !CAS [13] (maybe <- 0x8001c9) (Int)
add %i3, 64, %l3
lduw [%l3], %o4
mov %o4, %o5
! move %o5(lower) -> %o4(upper)
sllx %o5, 32, %o4
mov %l4, %l7
cas [%l3], %o5, %l7
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

P1735: !CAS [14] (maybe <- 0x8001ca) (Int)
add %i3, 128, %l3
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

P1736: !ST [15] (maybe <- 0x8001cb) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P1737: !ST [9] (maybe <- 0x8001cc) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P1738: !CAS [14] (maybe <- 0x8001cd) (Int)
add %i3, 128, %l7
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

P1739: !DWLD [6] (FP)
ldd [%i1 + 80], %f18
! 2 addresses covered
fmovs %f18, %f1
fmovs %f19, %f2

P1740: !ST [0] (maybe <- 0x8001ce) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P1741: !CASX [6] (maybe <- 0x8001cf) (Int)
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

P1742: !ST [0] (maybe <- 0x8001d1) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P1743: !ST [3] (maybe <- 0x8001d2) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P1744: !CASX [9] (maybe <- 0x8001d3) (Int)
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

P1745: !ST [6] (maybe <- 0x8001d4) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P1746: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P1747: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P1748: !CASX [1] (maybe <- 0x8001d5) (Int) (LE) (CBR)
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
! move %l3(lower) -> %o1(upper)
sllx %l3, 32, %o1
! move %l3(upper) -> %o1(lower)
srlx %l3, 32, %l6
or %l6, %o1, %o1
mov %l3, %l6
mov  %o5, %l3
casxa [%l7] %asi, %l6, %l3
! move %l3(lower) -> %o2(upper)
sllx %l3, 32, %o2
! move %l3(upper) -> %o2(lower)
srlx %l3, 32, %l7
or %l7, %o2, %o2
add  %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1748
nop
RET1748:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P1749: !DWST [7] (maybe <- 0x8001d7) (Int)
sllx %l4, 32, %l7 
add   %l4, 1, %l4
or %l7, %l4, %l7
stx %l7, [%i1 + 80]
add   %l4, 1, %l4

P1750: !ST [9] (maybe <- 0x40000010) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i1 + 512 ]

P1751: !DWST [2] (maybe <- 0x8001d9) (Int)
mov %l4, %l3 
stx %l3, [%i0 + 8]
add   %l4, 1, %l4

P1752: !ST [3] (maybe <- 0x8001da) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P1753: !CASX [2] (maybe <- 0x8001db) (Int)
add %i0, 8, %o5
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

P1754: !DWST [2] (maybe <- 0x8001dc) (Int)
mov %l4, %l7 
stx %l7, [%i0 + 8]
add   %l4, 1, %l4

P1755: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P1756: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P1757: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P1758: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P1759: !DWST [13] (maybe <- 0x8001dd) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 64 ] 
add   %l4, 1, %l4

P1760: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P1761: !ST [12] (maybe <- 0x8001de) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P1762: !CASX [5] (maybe <- 0x8001df) (Int)
add %i1, 72, %l3
ldx [%l3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %o5
mov %l4, %o1
casx [%l3], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P1763: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P1764: !ST [12] (maybe <- 0x40000011) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i3 + 0 ]

P1765: !DWLD [2] (Int)
ldx [%i0 + 8], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P1766: !CAS [2] (maybe <- 0x8001e0) (Int)
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

P1767: !CAS [12] (maybe <- 0x8001e1) (Int)
add %i3, 0, %l6
lduw [%l6], %o5
mov %o5, %l3
! move %l3(lower) -> %o3(lower)
or %l3, %o3, %o3
mov %l4, %o4
cas [%l6], %l3, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P1768: !ST [15] (maybe <- 0x8001e2) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P1769: !ST [6] (maybe <- 0x8001e3) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P1770: !ST [12] (maybe <- 0x8001e4) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P1771: !CAS [10] (maybe <- 0x8001e5) (Int)
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

P1772: !ST [14] (maybe <- 0x8001e6) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P1773: !MEMBAR (Int)
membar #StoreLoad

P1774: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P1775: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P1776: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P1777: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P1778: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P1779: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P1780: !CASX [5] (maybe <- 0x8001e7) (Int)
add %i1, 72, %l6
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

P1781: !DWST [11] (maybe <- 0x8001e8) (Int)
mov %l4, %l3 
sllx %l3, 32, %l3 
stx %l3, [%i2 + 64 ] 
add   %l4, 1, %l4

P1782: !PREFETCH [14] (Int) (CBR)
prefetch [%i3 + 128], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1782
nop
RET1782:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P1783: !ST [9] (maybe <- 0x8001e9) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P1784: !ST [15] (maybe <- 0x8001ea) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P1785: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P1786: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P1787: !ST [5] (maybe <- 0x8001eb) (Int) (LE)
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
stwa   %l7, [%i1 + 76] %asi
add   %l4, 1, %l4

P1788: !ST [6] (maybe <- 0x8001ec) (Int) (Branch target of P1564)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4
ba P1789
nop

TARGET1564:
ba RET1564
nop


P1789: !PREFETCH [0] (Int) (Branch target of P1515)
prefetch [%i0 + 0], 1
ba P1790
nop

TARGET1515:
ba RET1515
nop


P1790: !LD [4] (Int)
lduw [%i0 + 64], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2

P1791: !CAS [13] (maybe <- 0x8001ed) (Int)
add %i3, 64, %o5
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

P1792: !ST [12] (maybe <- 0x8001ee) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P1793: !ST [10] (maybe <- 0x8001ef) (Int) (LE)
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
stwa   %l6, [%i2 + 32] %asi
add   %l4, 1, %l4

P1794: !ST [2] (maybe <- 0x8001f0) (Int) (LE)
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
stwa   %l3, [%i0 + 12] %asi
add   %l4, 1, %l4

P1795: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P1796: !ST [14] (maybe <- 0x8001f1) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P1797: !CASX [3] (maybe <- 0x8001f2) (Int)
add %i0, 32, %o5
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

P1798: !CAS [6] (maybe <- 0x8001f3) (Int)
add %i1, 80, %o5
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

P1799: !DWLD [15] (Int)
ldx [%i3 + 192], %o2
! move %o2(upper) -> %o2(upper)

P1800: !CAS [14] (maybe <- 0x8001f4) (Int) (CBR)
add %i3, 128, %l6
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

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1800
nop
RET1800:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P1801: !CAS [2] (maybe <- 0x8001f5) (Int)
add %i0, 12, %l7
lduw [%l7], %l3
mov %l3, %l6
! move %l6(lower) -> %o3(lower)
or %l6, %o3, %o3
mov %l4, %o4
cas [%l7], %l6, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P1802: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P1803: !CAS [11] (maybe <- 0x8001f6) (Int)
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

P1804: !CASX [10] (maybe <- 0x8001f7) (Int)
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

P1805: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P1806: !ST [7] (maybe <- 0x8001f8) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P1807: !DWST [12] (maybe <- 0x8001f9) (Int)
mov %l4, %l3 
sllx %l3, 32, %l3 
stx %l3, [%i3 + 0 ] 
add   %l4, 1, %l4

P1808: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P1809: !CASX [2] (maybe <- 0x8001fa) (Int)
add %i0, 8, %l3
ldx [%l3], %l7
! move %l7(upper) -> %o2(lower)
srlx %l7, 32, %o5
or %o5, %o2, %o2
! move %l7(lower) -> %o3(upper)
sllx %l7, 32, %o3
mov  %l7, %o5
mov %l4, %l7
casx [%l3], %o5, %l7
! move %l7(upper) -> %o3(lower)
srlx %l7, 32, %l3
or %l3, %o3, %o3
! move %l7(lower) -> %o4(upper)
sllx %l7, 32, %o4
add  %l4, 1, %l4

P1810: !CASX [12] (maybe <- 0x8001fb) (Int)
add %i3, 0, %l3
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

P1811: !ST [13] (maybe <- 0x8001fc) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P1812: !CASX [5] (maybe <- 0x8001fd) (Int)
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

P1813: !CASX [10] (maybe <- 0x8001fe) (Int)
add %i2, 32, %o5
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

P1814: !CAS [15] (maybe <- 0x8001ff) (Int)
add %i3, 192, %o5
lduw [%o5], %l6
mov %l6, %l7
! move %l7(lower) -> %o0(lower)
or %l7, %o0, %o0
mov %l4, %o1
cas [%o5], %l7, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P1815: !CAS [10] (maybe <- 0x800200) (Int)
add %i2, 32, %o5
lduw [%o5], %l6
mov %l6, %l7
! move %l7(lower) -> %o1(lower)
or %l7, %o1, %o1
mov %l4, %o2
cas [%o5], %l7, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P1816: !ST [1] (maybe <- 0x40000012) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i0 + 4 ]

P1817: !CAS [12] (maybe <- 0x800201) (Int)
add %i3, 0, %l7
lduw [%l7], %l3
mov %l3, %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2
mov %l4, %o3
cas [%l7], %l6, %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P1818: !ST [12] (maybe <- 0x800202) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P1819: !PREFETCH [11] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i2 + 64] %asi, 1

P1820: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P1821: !CAS [2] (maybe <- 0x800203) (Int)
add %i0, 12, %l6
lduw [%l6], %o5
mov %o5, %l3
! move %l3(lower) -> %o3(lower)
or %l3, %o3, %o3
mov %l4, %o4
cas [%l6], %l3, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P1822: !SWAP [8] (maybe <- 0x800204) (Int)
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

P1823: !CASX [14] (maybe <- 0x800205) (Int)
add %i3, 128, %l3
ldx [%l3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %o5
sllx %l4, 32, %o1
casx [%l3], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P1824: !ST [14] (maybe <- 0x800206) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P1825: !CAS [8] (maybe <- 0x800207) (Int)
add %i1, 256, %o5
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

P1826: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P1827: !ST [15] (maybe <- 0x40000013) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i3 + 192 ]

P1828: !DWLD [10] (FP)
ldd [%i2 + 32], %f18
! 1 addresses covered
fmovs %f18, %f3

P1829: !ST [15] (maybe <- 0x800208) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P1830: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P1831: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P1832: !CAS [5] (maybe <- 0x800209) (Int)
add %i1, 76, %l6
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

P1833: !CAS [12] (maybe <- 0x80020a) (Int) (CBR)
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

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1833
nop
RET1833:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P1834: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P1835: !ST [15] (maybe <- 0x80020b) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P1836: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P1837: !CASX [11] (maybe <- 0x80020c) (Int)
add %i2, 64, %l6
ldx [%l6], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l3
sllx %l4, 32, %o1
casx [%l6], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P1838: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P1839: !ST [7] (maybe <- 0x80020d) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P1840: !PREFETCH [14] (Int) (CBR)
prefetch [%i3 + 128], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1840
nop
RET1840:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P1841: !CASX [4] (maybe <- 0x80020e) (Int)
add %i0, 64, %l6
ldx [%l6], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov  %o2, %l3
sllx %l4, 32, %o3
casx [%l6], %l3, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4

P1842: !ST [8] (maybe <- 0x80020f) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P1843: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P1844: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P1845: !CAS [6] (maybe <- 0x800210) (Int)
add %i1, 80, %l3
lduw [%l3], %o4
mov %o4, %o5
! move %o5(lower) -> %o4(upper)
sllx %o5, 32, %o4
mov %l4, %l7
cas [%l3], %o5, %l7
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

P1846: !CAS [6] (maybe <- 0x800211) (Int)
add %i1, 80, %l3
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

P1847: !CAS [13] (maybe <- 0x800212) (Int)
add %i3, 64, %l3
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

P1848: !CAS [4] (maybe <- 0x800213) (Int)
add %i0, 64, %l3
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

P1849: !ST [5] (maybe <- 0x800214) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P1850: !ST [0] (maybe <- 0x800215) (Int) (CBR)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1850
nop
RET1850:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P1851: !DWLD [1] (Int)
ldx [%i0 + 0], %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)

P1852: !ST [4] (maybe <- 0x800216) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P1853: !CAS [14] (maybe <- 0x800217) (Int)
add %i3, 128, %l3
lduw [%l3], %o4
mov %o4, %o5
! move %o5(lower) -> %o4(upper)
sllx %o5, 32, %o4
mov %l4, %l7
cas [%l3], %o5, %l7
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

P1854: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P1855: !REPLACEMENT [5] (Int)
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

P1856: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P1857: !CAS [13] (maybe <- 0x800218) (Int)
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

P1858: !ST [3] (maybe <- 0x800219) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P1859: !CAS [15] (maybe <- 0x80021a) (Int)
add %i3, 192, %l7
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

P1860: !NOP (Int)
nop

P1861: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P1862: !CASX [7] (maybe <- 0x80021b) (Int)
add %i1, 80, %l7
ldx [%l7], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov %o2, %l6
sllx %l4, 32, %o3
add  %l4, 1, %l4
or   %l4, %o3, %o3
casx [%l7], %l6, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4

P1863: !PREFETCH [12] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i3 + 0] %asi, 1

P1864: !ST [11] (maybe <- 0x80021d) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P1865: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P1866: !CAS [8] (maybe <- 0x80021e) (Int)
add %i1, 256, %l6
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

P1867: !DWST [5] (maybe <- 0x80021f) (Int) (CBR)
mov %l4, %l3 
stx %l3, [%i1 + 72]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1867
nop
RET1867:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P1868: !CASX [9] (maybe <- 0x800220) (Int)
add %i1, 512, %l6
ldx [%l6], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l3
sllx %l4, 32, %o1
casx [%l6], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P1869: !CAS [8] (maybe <- 0x800221) (Int)
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

P1870: !ST [5] (maybe <- 0x800222) (Int) (CBR)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1870
nop
RET1870:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P1871: !ST [12] (maybe <- 0x800223) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P1872: !ST [12] (maybe <- 0x800224) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P1873: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P1874: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P1875: !CASX [7] (maybe <- 0x800225) (Int)
add %i1, 80, %o5
ldx [%o5], %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
mov %o3, %l7
sllx %l4, 32, %o4
add  %l4, 1, %l4
or   %l4, %o4, %o4
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

P1876: !CASX [12] (maybe <- 0x800227) (Int) (CBR)
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

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1876
nop
RET1876:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P1877: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P1878: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P1879: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P1880: !DWST [14] (maybe <- 0x800228) (Int)
mov %l4, %o5 
sllx %o5, 32, %o5 
stx %o5, [%i3 + 128 ] 
add   %l4, 1, %l4

P1881: !CASX [9] (maybe <- 0x800229) (Int)
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

P1882: !REPLACEMENT [10] (Int)
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

P1883: !ST [9] (maybe <- 0x80022a) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P1884: !LD [14] (Int)
lduw [%i3 + 128], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P1885: !CASX [2] (maybe <- 0x80022b) (Int)
add %i0, 8, %o5
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
mov %l4, %l6
casx [%o5], %l7, %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %o5
or %o5, %o0, %o0
! move %l6(lower) -> %o1(upper)
sllx %l6, 32, %o1
add  %l4, 1, %l4

P1886: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P1887: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P1888: !DWLD [10] (Int)
ldx [%i2 + 32], %o5
! move %o5(upper) -> %o1(lower)
srlx %o5, 32, %l7
or %l7, %o1, %o1

P1889: !ST [7] (maybe <- 0x80022c) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P1890: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P1891: !MEMBAR (Int) (Branch target of P1501)
membar #StoreLoad
ba P1892
nop

TARGET1501:
ba RET1501
nop


P1892: !ST [11] (maybe <- 0x80022d) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P1893: !DWST [1] (maybe <- 0x80022e) (Int)
sllx %l4, 32, %l7 
add   %l4, 1, %l4
or %l7, %l4, %l7
stx %l7, [%i0 + 0]
add   %l4, 1, %l4

P1894: !ST [7] (maybe <- 0x800230) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P1895: !CAS [11] (maybe <- 0x800231) (Int)
add %i2, 64, %l6
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

P1896: !CAS [2] (maybe <- 0x800232) (Int)
add %i0, 12, %l6
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

P1897: !CAS [15] (maybe <- 0x800233) (Int) (Branch target of P1425)
add %i3, 192, %l6
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
ba P1898
nop

TARGET1425:
ba RET1425
nop


P1898: !ST [14] (maybe <- 0x40000014) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i3 + 128 ]

P1899: !ST [4] (maybe <- 0x800234) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P1900: !ST [8] (maybe <- 0x800235) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P1901: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P1902: !CAS [13] (maybe <- 0x800236) (Int)
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

P1903: !ST [11] (maybe <- 0x800237) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P1904: !DWST [4] (maybe <- 0x800238) (Int)
mov %l4, %l3 
sllx %l3, 32, %l3 
stx %l3, [%i0 + 64 ] 
add   %l4, 1, %l4

P1905: !CASX [10] (maybe <- 0x800239) (Int) (CBR)
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

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1905
nop
RET1905:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P1906: !ST [5] (maybe <- 0x80023a) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P1907: !ST [6] (maybe <- 0x80023b) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P1908: !CAS [6] (maybe <- 0x80023c) (Int)
add %i1, 80, %o5
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

P1909: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P1910: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P1911: !DWST [3] (maybe <- 0x80023d) (Int)
mov %l4, %l7 
sllx %l7, 32, %l7 
stx %l7, [%i0 + 32 ] 
add   %l4, 1, %l4

P1912: !DWST [11] (maybe <- 0x80023e) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i2 + 64 ] 
add   %l4, 1, %l4

P1913: !CASX [4] (maybe <- 0x80023f) (Int)
add %i0, 64, %l6
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

P1914: !ST [6] (maybe <- 0x800240) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P1915: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P1916: !ST [0] (maybe <- 0x800241) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P1917: !ST [8] (maybe <- 0x800242) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P1918: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P1919: !CAS [4] (maybe <- 0x800243) (Int)
add %i0, 64, %l7
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

P1920: !CAS [7] (maybe <- 0x800244) (Int)
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

P1921: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P1922: !DWST [8] (maybe <- 0x800245) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 256 ] 
add   %l4, 1, %l4

P1923: !ST [11] (maybe <- 0x800246) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P1924: !CASX [2] (maybe <- 0x800247) (Int)
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

P1925: !CASX [0] (maybe <- 0x800248) (Int)
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

P1926: !PREFETCH [11] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i2 + 64] %asi, 1

P1927: !ST [7] (maybe <- 0x80024a) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P1928: !PREFETCH [3] (Int) (CBR) (Branch target of P1938)
prefetch [%i0 + 32], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1928
nop
RET1928:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0

ba P1929
nop

TARGET1938:
ba RET1938
nop


P1929: !ST [14] (maybe <- 0x80024b) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P1930: !ST [0] (maybe <- 0x80024c) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P1931: !CASX [10] (maybe <- 0x80024d) (Int)
add %i2, 32, %l7
ldx [%l7], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov  %o2, %l6
sllx %l4, 32, %o3
casx [%l7], %l6, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4

P1932: !SWAP [11] (maybe <- 0x80024e) (Int) (Branch target of P1642)
mov %l4, %o4
swap  [%i2 + 64], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4
ba P1933
nop

TARGET1642:
ba RET1642
nop


P1933: !CAS [6] (maybe <- 0x80024f) (Int)
add %i1, 80, %l6
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

P1934: !CASX [12] (maybe <- 0x800250) (Int)
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

P1935: !CASX [13] (maybe <- 0x800251) (Int)
add %i3, 64, %l6
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

P1936: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P1937: !ST [15] (maybe <- 0x800252) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P1938: !MEMBAR (Int) (CBR)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1938
nop
RET1938:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P1939: !ST [6] (maybe <- 0x40000015) (FP) (CBR)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i1 + 80 ]

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1939
nop
RET1939:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P1940: !PREFETCH [10] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i2 + 32] %asi, 1

P1941: !ST [8] (maybe <- 0x800253) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P1942: !CASX [10] (maybe <- 0x800254) (Int)
add %i2, 32, %l3
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

P1943: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P1944: !CASX [6] (maybe <- 0x800255) (Int)
add %i1, 80, %l3
ldx [%l3], %l7
! move %l7(upper) -> %o1(lower)
srlx %l7, 32, %o5
or %o5, %o1, %o1
! move %l7(lower) -> %o2(upper)
sllx %l7, 32, %o2
mov %l7, %o5
sllx %l4, 32, %l7
add  %l4, 1, %l4
or   %l4, %l7, %l7
casx [%l3], %o5, %l7
! move %l7(upper) -> %o2(lower)
srlx %l7, 32, %l3
or %l3, %o2, %o2
! move %l7(lower) -> %o3(upper)
sllx %l7, 32, %o3
add  %l4, 1, %l4

P1945: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P1946: !CASX [10] (maybe <- 0x800257) (Int)
add %i2, 32, %l3
ldx [%l3], %l7
! move %l7(upper) -> %o3(lower)
srlx %l7, 32, %o5
or %o5, %o3, %o3
! move %l7(lower) -> %o4(upper)
sllx %l7, 32, %o4
mov  %l7, %o5
sllx %l4, 32, %l7
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

P1947: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P1948: !PREFETCH [0] (Int) (CBR)
prefetch [%i0 + 0], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1948
nop
RET1948:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P1949: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P1950: !ST [8] (maybe <- 0x800258) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P1951: !ST [9] (maybe <- 0x800259) (Int) (CBR)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1951
nop
RET1951:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P1952: !CAS [15] (maybe <- 0x80025a) (Int)
add %i3, 192, %l3
lduw [%l3], %l7
mov %l7, %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0
mov %l4, %o1
cas [%l3], %o5, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P1953: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P1954: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P1955: !ST [5] (maybe <- 0x80025b) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P1956: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P1957: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P1958: !ST [14] (maybe <- 0x80025c) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P1959: !ST [0] (maybe <- 0x80025d) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P1960: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P1961: !CASX [8] (maybe <- 0x80025e) (Int)
add %i1, 256, %l6
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

P1962: !CAS [15] (maybe <- 0x80025f) (Int)
add %i3, 192, %l6
lduw [%l6], %o5
mov %o5, %l3
! move %l3(lower) -> %o3(lower)
or %l3, %o3, %o3
mov %l4, %o4
cas [%l6], %l3, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P1963: !ST [2] (maybe <- 0x800260) (Int) (Branch target of P1939)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4
ba P1964
nop

TARGET1939:
ba RET1939
nop


P1964: !CAS [3] (maybe <- 0x800261) (Int)
add %i0, 32, %l3
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

P1965: !CASX [11] (maybe <- 0x800262) (Int)
add %i2, 64, %l3
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

P1966: !DWST [9] (maybe <- 0x800263) (Int)
mov %l4, %o5 
sllx %o5, 32, %o5 
stx %o5, [%i1 + 512 ] 
add   %l4, 1, %l4

P1967: !CAS [3] (maybe <- 0x800264) (Int)
add %i0, 32, %o5
lduw [%o5], %l6
mov %l6, %l7
! move %l7(lower) -> %o2(lower)
or %l7, %o2, %o2
mov %l4, %o3
cas [%o5], %l7, %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P1968: !CASX [7] (maybe <- 0x800265) (Int)
add %i1, 80, %o5
ldx [%o5], %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %l7
or %l7, %o3, %o3
! move %l6(lower) -> %o4(upper)
sllx %l6, 32, %o4
mov %l6, %l7
sllx %l4, 32, %l6
add  %l4, 1, %l4
or   %l4, %l6, %l6
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

P1969: !CAS [14] (maybe <- 0x800267) (Int)
add %i3, 128, %o5
lduw [%o5], %l6
mov %l6, %l7
! move %l7(lower) -> %o0(lower)
or %l7, %o0, %o0
mov %l4, %o1
cas [%o5], %l7, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P1970: !ST [1] (maybe <- 0x800268) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P1971: !ST [10] (maybe <- 0x800269) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P1972: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P1973: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P1974: !ST [2] (maybe <- 0x80026a) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P1975: !ST [15] (maybe <- 0x40000016) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i3 + 192 ]

P1976: !ST [2] (maybe <- 0x80026b) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P1977: !ST [15] (maybe <- 0x80026c) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P1978: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P1979: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P1980: !CASX [10] (maybe <- 0x80026d) (Int) (LE)
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
add %i2, 32, %l6
ldxa [%l6] %asi, %o5
! move %o5(lower) -> %o1(lower)
srl %o5, 0, %l3
or %l3, %o1, %o1
! move %o5(upper) -> %o2(upper)
or %o5, %g0, %o2
mov  %o5, %l3
mov  %l7, %o5
casxa [%l6] %asi, %l3, %o5
! move %o5(lower) -> %o2(lower)
srlx %o2, 32, %o2
sllx %o2, 32, %o2
srl %o5, 0, %l6
or %l6, %o2, %o2
! move %o5(upper) -> %o3(upper)
or %o5, %g0, %o3
add  %l4, 1, %l4

P1981: !ST [4] (maybe <- 0x80026e) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P1982: !ST [7] (maybe <- 0x40000017) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i1 + 84 ]

P1983: !CAS [6] (maybe <- 0x80026f) (Int)
add %i1, 80, %o5
lduw [%o5], %l6
mov %l6, %l7
! move %l7(lower) -> %o3(lower)
srlx %o3, 32, %o3
sllx %o3, 32, %o3
or %l7, %o3, %o3
mov %l4, %o4
cas [%o5], %l7, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P1984: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P1985: !ST [14] (maybe <- 0x800270) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P1986: !DWLD [11] (Int)
ldx [%i2 + 64], %l7
! move %l7(upper) -> %o4(lower)
srlx %l7, 32, %l6
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P1987: !ST [5] (maybe <- 0x800271) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P1988: !ST [11] (maybe <- 0x800272) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P1989: !ST [2] (maybe <- 0x800273) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P1990: !CAS [2] (maybe <- 0x800274) (Int) (Branch target of P1661)
add %i0, 12, %l6
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
ba P1991
nop

TARGET1661:
ba RET1661
nop


P1991: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P1992: !ST [15] (maybe <- 0x800275) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P1993: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P1994: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P1995: !ST [8] (maybe <- 0x800276) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P1996: !ST [8] (maybe <- 0x800277) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P1997: !ST [3] (maybe <- 0x800278) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P1998: !CAS [11] (maybe <- 0x800279) (Int)
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

P1999: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P2000: !DWST [12] (maybe <- 0x80027a) (Int)
mov %l4, %l3 
sllx %l3, 32, %l3 
stx %l3, [%i3 + 0 ] 
add   %l4, 1, %l4

P2001: !CAS [4] (maybe <- 0x80027b) (Int)
add %i0, 64, %l3
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

P2002: !CASX [1] (maybe <- 0x80027c) (Int)
add %i0, 0, %l3
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

P2003: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P2004: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P2005: !CASX [5] (maybe <- 0x80027e) (Int)
add %i1, 72, %l3
ldx [%l3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %o5
mov %l4, %o1
casx [%l3], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P2006: !CAS [12] (maybe <- 0x80027f) (Int) (LE)
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
add %i3, 0, %l3
lduwa [%l3] %asi, %o2
mov %o2, %o5
! move %o5(lower) -> %o2(upper)
sllx %o5, 32, %o2
mov %l6, %l7
casa [%l3] %asi, %o5, %l7
! move %l7(lower) -> %o2(lower)
srl %l7, 0, %l3
or %l3, %o2, %o2
add   %l4, 1, %l4

P2007: !PREFETCH [1] (Int) (Branch target of P1210)
prefetch [%i0 + 4], 1
ba P2008
nop

TARGET1210:
ba RET1210
nop


P2008: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P2009: !CASX [5] (maybe <- 0x800280) (Int) (LE)
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
sllx %l6, 32, %l6
wr %g0, 0x88, %asi
add %i1, 72, %l3
ldxa [%l3] %asi, %l7
! move %l7(lower) -> %o3(upper)
sllx %l7, 32, %o3
! move %l7(upper) -> %o3(lower)
srlx %l7, 32, %o5
or %o5, %o3, %o3
mov  %l7, %o5
mov  %l6, %l7
casxa [%l3] %asi, %o5, %l7
! move %l7(lower) -> %o4(upper)
sllx %l7, 32, %o4
! move %l7(upper) -> %o4(lower)
srlx %l7, 32, %l3
or %l3, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5
add  %l4, 1, %l4

P2010: !ST [14] (maybe <- 0x800281) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P2011: !REPLACEMENT [7] (Int)
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

P2012: !CASX [13] (maybe <- 0x800282) (Int)
add %i3, 64, %l7
ldx [%l7], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l6
sllx %l4, 32, %o1
casx [%l7], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P2013: !REPLACEMENT [9] (Int)
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

P2014: !ST [2] (maybe <- 0x800283) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P2015: !ST [12] (maybe <- 0x800284) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P2016: !ST [0] (maybe <- 0x800285) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P2017: !CAS [1] (maybe <- 0x800286) (Int)
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

P2018: !REPLACEMENT [11] (Int)
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

P2019: !ST [11] (maybe <- 0x40000018) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i2 + 64 ]

P2020: !CAS [11] (maybe <- 0x800287) (Int) (CBR)
add %i2, 64, %l3
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

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2020
nop
RET2020:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P2021: !ST [12] (maybe <- 0x800288) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P2022: !ST [2] (maybe <- 0x800289) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P2023: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P2024: !DWST [4] (maybe <- 0x80028a) (Int)
mov %l4, %l7 
sllx %l7, 32, %l7 
stx %l7, [%i0 + 64 ] 
add   %l4, 1, %l4

P2025: !ST [9] (maybe <- 0x80028b) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P2026: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P2027: !CAS [5] (maybe <- 0x80028c) (Int)
add %i1, 76, %l6
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

P2028: !CAS [14] (maybe <- 0x80028d) (Int)
add %i3, 128, %l6
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

P2029: !CAS [14] (maybe <- 0x80028e) (Int)
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

P2030: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P2031: !ST [9] (maybe <- 0x80028f) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P2032: !ST [9] (maybe <- 0x800290) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P2033: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P2034: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P2035: !ST [4] (maybe <- 0x800291) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P2036: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P2037: !MEMBAR (Int)
membar #StoreLoad

P2038: !LD [0] (Int) (CBR)
lduw [%i0 + 0], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2038
nop
RET2038:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P2039: !LD [1] (Int)
lduw [%i0 + 4], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2

P2040: !LD [2] (Int)
lduw [%i0 + 12], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P2041: !LD [3] (Int)
lduw [%i0 + 32], %l6
! move %l6(lower) -> %o3(lower)
or %l6, %o3, %o3

P2042: !LD [4] (Int) (Branch target of P1905)
lduw [%i0 + 64], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
ba P2043
nop

TARGET1905:
ba RET1905
nop


P2043: !LD [5] (Int)
lduw [%i1 + 76], %l6
! move %l6(lower) -> %o4(lower)
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P2044: !LD [6] (Int)
lduw [%i1 + 80], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P2045: !LD [7] (Int)
lduw [%i1 + 84], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

P2046: !LD [8] (Int)
lduw [%i1 + 256], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P2047: !LD [9] (Int)
lduw [%i1 + 512], %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1

P2048: !LD [10] (Int) (Branch target of P1154)
lduw [%i2 + 32], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
ba P2049
nop

TARGET1154:
ba RET1154
nop


P2049: !LD [11] (Int)
lduw [%i2 + 64], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2

P2050: !LD [12] (Int)
lduw [%i3 + 0], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P2051: !LD [13] (Int)
lduw [%i3 + 64], %l6
! move %l6(lower) -> %o3(lower)
or %l6, %o3, %o3

P2052: !LD [14] (Int)
lduw [%i3 + 128], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P2053: !LD [15] (Int)
lduw [%i3 + 192], %l6
! move %l6(lower) -> %o4(lower)
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

END_NODES1: ! Test istream for CPU 1 ends
sethi %hi(0xdead0e0f), %l7
or    %l7, %lo(0xdead0e0f), %l7
! move %l7(lower) -> %o0(upper)
sllx %l7, 32, %o0
stw %l7, [%i5] 
ld [%i5], %f4
!---- flushing int results buffer----
mov %o0, %l5
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

func2:
! 1000 (dynamic) instruction sequence begins
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
sethi %hi(0x02deade1), %l6
or    %l6, %lo(0x02deade1), %l6
stw %l6, [%i5] 
ld [%i5], %f16

! Initialize running integer counter in register %l4
sethi %hi(0x1000001), %l4
or    %l4, %lo(0x1000001), %l4

! Initialize running FP counter in register %f16
sethi %hi(0x40800001), %l6
or    %l6, %lo(0x40800001), %l6
stw %l6, [%i5] 
ld [%i5], %f16

! Initialize FP counter increment value in register %f17 (constant)
sethi %hi(0x35000000), %l6
or    %l6, %lo(0x35000000), %l6
stw %l6, [%i5] 
ld [%i5], %f17 

! Initialize LFSR to 0x3e30^4
sethi %hi(0x3e30), %l0
or    %l0, %lo(0x3e30), %l0
mulx  %l0, %l0, %l0
mulx  %l0, %l0, %l0

!-- init shared addrs 4 to 5 ---
stx %g0, [%i0+64]
stx %g0, [%i1+72]

! use untouched cache-line (offset 4K) in replacement area for sync
sub %i1, %i0, %l7
add %i3, %l7, %l7
sub %l7, -4096, %l7

!-- begin of sync_init ---
or %g0, 1, %o5
or %g0, %o5, %l3
swap [%l7+4], %l3
membar #Sync
sync_init_1_2:
brnz,pt %o5, sync_init_1_2
lduw [%l7+4], %o5 ! delay slot
sync_init_2_2:
lduw [%l7], %o5
sub %o5, 1, %l3
cas [%l7], %o5, %l3
cmp %o5, %l3
bne,pt %xcc, sync_init_2_2
nop
membar #Sync
sync_init_3_2:
lduw [%l7], %o5 ! delay slot
brnz,pt %o5, sync_init_3_2
nop
!-- end of sync_init ---


BEGIN_NODES2: ! Test istream for CPU 2 begins

P2054: !MEMBAR (Int)
membar #StoreLoad

P2055: !ST [13] (maybe <- 0x1000001) (Int) (CBR)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2055
nop
RET2055:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P2056: !DWLD [7] (Int)
ldx [%i1 + 80], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)

P2057: !CASX [13] (maybe <- 0x1000002) (Int)
add %i3, 64, %l3
ldx [%l3], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
mov  %o1, %o5
sllx %l4, 32, %o2
casx [%l3], %o5, %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
add  %l4, 1, %l4

P2058: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P2059: !SWAP [11] (maybe <- 0x1000003) (Int)
mov %l4, %o3
swap  [%i2 + 64], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P2060: !LD [6] (Int)
lduw [%i1 + 80], %o5
! move %o5(lower) -> %o3(lower)
or %o5, %o3, %o3

P2061: !CAS [4] (maybe <- 0x1000004) (Int)
add %i0, 64, %l6
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

P2062: !CASX [3] (maybe <- 0x1000005) (Int)
add %i0, 32, %l6
ldx [%l6], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l3
sllx %l4, 32, %o1
casx [%l6], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P2063: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P2064: !ST [9] (maybe <- 0x1000006) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P2065: !MEMBAR (Int)
membar #StoreLoad

P2066: !CAS [8] (maybe <- 0x1000007) (Int)
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

P2067: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P2068: !REPLACEMENT [12] (Int)
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

P2069: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P2070: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P2071: !ST [12] (maybe <- 0x1000008) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P2072: !ST [3] (maybe <- 0x1000009) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P2073: !CAS [0] (maybe <- 0x100000a) (Int)
add %i0, 0, %l6
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

P2074: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P2075: !ST [10] (maybe <- 0x40800001) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i2 + 32 ]

P2076: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P2077: !CAS [14] (maybe <- 0x100000b) (Int)
add %i3, 128, %l3
lduw [%l3], %o4
mov %o4, %o5
! move %o5(lower) -> %o4(upper)
sllx %o5, 32, %o4
mov %l4, %l7
cas [%l3], %o5, %l7
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

P2078: !CAS [11] (maybe <- 0x100000c) (Int) (LE)
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
add %i2, 64, %l3
lduwa [%l3] %asi, %o0
mov %o0, %o5
! move %o5(lower) -> %o0(upper)
sllx %o5, 32, %o0
mov %l6, %l7
casa [%l3] %asi, %o5, %l7
! move %l7(lower) -> %o0(lower)
srl %l7, 0, %l3
or %l3, %o0, %o0
add   %l4, 1, %l4

P2079: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P2080: !CAS [11] (maybe <- 0x100000d) (Int)
add %i2, 64, %l3
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

P2081: !CASX [5] (maybe <- 0x100000e) (Int) (Branch target of P2055)
add %i1, 72, %l3
ldx [%l3], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov  %o2, %o5
mov %l4, %o3
casx [%l3], %o5, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4
ba P2082
nop

TARGET2055:
ba RET2055
nop


P2082: !ST [13] (maybe <- 0x100000f) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P2083: !ST [3] (maybe <- 0x1000010) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P2084: !CASX [0] (maybe <- 0x1000011) (Int)
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

P2085: !REPLACEMENT [13] (Int)
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

P2086: !ST [3] (maybe <- 0x1000013) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P2087: !CAS [1] (maybe <- 0x1000014) (Int)
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

P2088: !CASX [15] (maybe <- 0x1000015) (Int)
add %i3, 192, %l3
ldx [%l3], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov  %o2, %o5
sllx %l4, 32, %o3
casx [%l3], %o5, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4

P2089: !ST [12] (maybe <- 0x1000016) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P2090: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P2091: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P2092: !ST [14] (maybe <- 0x1000017) (Int) (LE)
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
stwa   %l7, [%i3 + 128] %asi
add   %l4, 1, %l4

P2093: !ST [15] (maybe <- 0x1000018) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P2094: !CASX [15] (maybe <- 0x1000019) (Int) (CBR)
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

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2094
nop
RET2094:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P2095: !ST [4] (maybe <- 0x100001a) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P2096: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P2097: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P2098: !ST [11] (maybe <- 0x100001b) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P2099: !ST [14] (maybe <- 0x100001c) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P2100: !ST [8] (maybe <- 0x40800002) (FP) (Branch target of P2453)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i1 + 256 ]
ba P2101
nop

TARGET2453:
ba RET2453
nop


P2101: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P2102: !ST [12] (maybe <- 0x40800003) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i3 + 0 ]

P2103: !DWLD [3] (Int)
ldx [%i0 + 32], %o1
! move %o1(upper) -> %o1(upper)

P2104: !PREFETCH [11] (Int) (Branch target of P2881)
prefetch [%i2 + 64], 1
ba P2105
nop

TARGET2881:
ba RET2881
nop


P2105: !ST [9] (maybe <- 0x40800004) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i1 + 512 ]

P2106: !ST [1] (maybe <- 0x100001d) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P2107: !CASX [14] (maybe <- 0x100001e) (Int)
add %i3, 128, %l6
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

P2108: !CAS [4] (maybe <- 0x100001f) (Int) (LE)
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
add %i0, 64, %l6
lduwa [%l6] %asi, %o5
mov %o5, %l3
! move %l3(lower) -> %o3(lower)
or %l3, %o3, %o3
mov %l7, %o4
casa [%l6] %asi, %l3, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P2109: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P2110: !CASX [14] (maybe <- 0x1000020) (Int)
add %i3, 128, %l6
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

P2111: !PREFETCH [15] (Int) (CBR)
prefetch [%i3 + 192], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2111
nop
RET2111:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P2112: !ST [4] (maybe <- 0x1000021) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P2113: !CASX [3] (maybe <- 0x1000022) (Int)
add %i0, 32, %l6
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

P2114: !CAS [11] (maybe <- 0x1000023) (Int)
add %i2, 64, %l6
lduw [%l6], %o5
mov %o5, %l3
! move %l3(lower) -> %o3(lower)
or %l3, %o3, %o3
mov %l4, %o4
cas [%l6], %l3, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P2115: !CAS [9] (maybe <- 0x1000024) (Int)
add %i1, 512, %l6
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

P2116: !ST [1] (maybe <- 0x1000025) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P2117: !ST [10] (maybe <- 0x1000026) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P2118: !CAS [10] (maybe <- 0x1000027) (Int) (LE)
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
add %i2, 32, %o5
lduwa [%o5] %asi, %l6
mov %l6, %l7
! move %l7(lower) -> %o0(lower)
or %l7, %o0, %o0
mov %l3, %o1
casa [%o5] %asi, %l7, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P2119: !SWAP [5] (maybe <- 0x1000028) (Int)
mov %l4, %l3
swap  [%i1 + 76], %l3
! move %l3(lower) -> %o1(lower)
srl %l3, 0, %l7
or %l7, %o1, %o1
add   %l4, 1, %l4

P2120: !CASX [10] (maybe <- 0x1000029) (Int)
add %i2, 32, %l7
ldx [%l7], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov  %o2, %l6
sllx %l4, 32, %o3
casx [%l7], %l6, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4

P2121: !CASX [0] (maybe <- 0x100002a) (Int)
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

P2122: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P2123: !LD [10] (Int)
lduw [%i2 + 32], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P2124: !ST [1] (maybe <- 0x100002c) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P2125: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P2126: !CASX [12] (maybe <- 0x100002d) (Int)
add %i3, 0, %o5
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

P2127: !DWLD [8] (Int)
ldx [%i1 + 256], %o5
! move %o5(upper) -> %o3(lower)
srlx %o5, 32, %l7
or %l7, %o3, %o3

P2128: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P2129: !ST [0] (maybe <- 0x100002e) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P2130: !ST [1] (maybe <- 0x100002f) (Int) (CBR)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2130
nop
RET2130:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P2131: !ST [10] (maybe <- 0x1000030) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P2132: !ST [3] (maybe <- 0x1000031) (Int) (LE)
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
stwa   %l7, [%i0 + 32] %asi
add   %l4, 1, %l4

P2133: !CASX [14] (maybe <- 0x1000032) (Int)
add %i3, 128, %l7
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
sllx %l4, 32, %o0
casx [%l7], %l6, %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
add  %l4, 1, %l4

P2134: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P2135: !ST [14] (maybe <- 0x1000033) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P2136: !DWST [10] (maybe <- 0x1000034) (Int)
mov %l4, %l3 
sllx %l3, 32, %l3 
stx %l3, [%i2 + 32 ] 
add   %l4, 1, %l4

P2137: !REPLACEMENT [11] (Int)
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

P2138: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P2139: !ST [0] (maybe <- 0x1000035) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P2140: !CAS [0] (maybe <- 0x1000036) (Int)
add %i0, 0, %l7
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

P2141: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P2142: !CASX [3] (maybe <- 0x1000037) (Int)
add %i0, 32, %l7
ldx [%l7], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov  %o2, %l6
sllx %l4, 32, %o3
casx [%l7], %l6, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4

P2143: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P2144: !REPLACEMENT [0] (Int) (CBR)
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
be,pn  %xcc, TARGET2144
nop
RET2144:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P2145: !REPLACEMENT [0] (Int)
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

P2146: !ST [10] (maybe <- 0x1000038) (Int) (Branch target of P2488)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4
ba P2147
nop

TARGET2488:
ba RET2488
nop


P2147: !ST [1] (maybe <- 0x1000039) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P2148: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P2149: !CAS [14] (maybe <- 0x100003a) (Int)
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

P2150: !DWLD [9] (FP)
ldd [%i1 + 512], %f0
! 1 addresses covered

P2151: !DWLD [2] (Int)
ldx [%i0 + 8], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P2152: !DWLD [6] (Int)
ldx [%i1 + 80], %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l3
or %l3, %o0, %o0
! move %l6(lower) -> %o1(upper)
sllx %l6, 32, %o1

P2153: !REPLACEMENT [13] (Int)
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

P2154: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P2155: !CASX [0] (maybe <- 0x100003b) (Int)
add %i0, 0, %l7
ldx [%l7], %l3
! move %l3(upper) -> %o1(lower)
srlx %l3, 32, %l6
or %l6, %o1, %o1
! move %l3(lower) -> %o2(upper)
sllx %l3, 32, %o2
mov %l3, %l6
sllx %l4, 32, %l3
add  %l4, 1, %l4
or   %l4, %l3, %l3
casx [%l7], %l6, %l3
! move %l3(upper) -> %o2(lower)
srlx %l3, 32, %l7
or %l7, %o2, %o2
! move %l3(lower) -> %o3(upper)
sllx %l3, 32, %o3
add  %l4, 1, %l4

P2156: !CASX [11] (maybe <- 0x100003d) (Int)
add %i2, 64, %l7
ldx [%l7], %l3
! move %l3(upper) -> %o3(lower)
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

P2157: !ST [1] (maybe <- 0x100003e) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P2158: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P2159: !ST [13] (maybe <- 0x100003f) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P2160: !CAS [11] (maybe <- 0x1000040) (Int) (LE)
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
add %i2, 64, %l3
lduwa [%l3] %asi, %l7
mov %l7, %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0
mov %l6, %o1
casa [%l3] %asi, %o5, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P2161: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P2162: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P2163: !ST [14] (maybe <- 0x1000041) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P2164: !CAS [8] (maybe <- 0x1000042) (Int) (CBR)
add %i1, 256, %o5
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
be,pt  %xcc, TARGET2164
nop
RET2164:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P2165: !ST [5] (maybe <- 0x1000043) (Int) (Branch target of P2303)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4
ba P2166
nop

TARGET2303:
ba RET2303
nop


P2166: !CAS [3] (maybe <- 0x1000044) (Int) (CBR)
add %i0, 32, %o5
lduw [%o5], %l6
mov %l6, %l7
! move %l7(lower) -> %o2(lower)
or %l7, %o2, %o2
mov %l4, %o3
cas [%o5], %l7, %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2166
nop
RET2166:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P2167: !PREFETCH [2] (Int) (Branch target of P2713)
prefetch [%i0 + 12], 1
ba P2168
nop

TARGET2713:
ba RET2713
nop


P2168: !ST [14] (maybe <- 0x1000045) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P2169: !DWLD [7] (Int)
ldx [%i1 + 80], %o5
! move %o5(upper) -> %o3(lower)
srlx %o5, 32, %l7
or %l7, %o3, %o3
! move %o5(lower) -> %o4(upper)
sllx %o5, 32, %o4

P2170: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P2171: !ST [15] (maybe <- 0x1000046) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P2172: !CAS [5] (maybe <- 0x1000047) (Int)
add %i1, 76, %l3
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

P2173: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P2174: !PREFETCH [13] (Int) (Branch target of P3065)
prefetch [%i3 + 64], 1
ba P2175
nop

TARGET3065:
ba RET3065
nop


P2175: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P2176: !CASX [7] (maybe <- 0x1000048) (Int)
add %i1, 80, %l3
ldx [%l3], %l7
! move %l7(upper) -> %o0(lower)
srlx %l7, 32, %o5
or %o5, %o0, %o0
! move %l7(lower) -> %o1(upper)
sllx %l7, 32, %o1
mov %l7, %o5
sllx %l4, 32, %l7
add  %l4, 1, %l4
or   %l4, %l7, %l7
casx [%l3], %o5, %l7
! move %l7(upper) -> %o1(lower)
srlx %l7, 32, %l3
or %l3, %o1, %o1
! move %l7(lower) -> %o2(upper)
sllx %l7, 32, %o2
add  %l4, 1, %l4

P2177: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P2178: !DWST [4] (maybe <- 0x100004a) (Int)
mov %l4, %o5 
sllx %o5, 32, %o5 
stx %o5, [%i0 + 64 ] 
add   %l4, 1, %l4

P2179: !SWAP [7] (maybe <- 0x100004b) (Int)
mov %l4, %l3
swap  [%i1 + 84], %l3
! move %l3(lower) -> %o2(lower)
srl %l3, 0, %l7
or %l7, %o2, %o2
add   %l4, 1, %l4

P2180: !CASX [15] (maybe <- 0x100004c) (Int)
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

P2181: !DWST [6] (maybe <- 0x100004d) (Int)
sllx %l4, 32, %l6 
add   %l4, 1, %l4
or %l6, %l4, %l6
stx %l6, [%i1 + 80]
add   %l4, 1, %l4

P2182: !ST [14] (maybe <- 0x100004f) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P2183: !CASX [14] (maybe <- 0x1000050) (Int)
add %i3, 128, %l3
ldx [%l3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %o5
sllx %l4, 32, %o1
casx [%l3], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P2184: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P2185: !PREFETCH [14] (Int) (LE) (CBR)
wr %g0, 0x88, %asi
prefetcha [%i3 + 128] %asi, 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2185
nop
RET2185:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P2186: !CASX [15] (maybe <- 0x1000051) (Int)
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

P2187: !PREFETCH [2] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i0 + 12] %asi, 1

P2188: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P2189: !ST [7] (maybe <- 0x1000052) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P2190: !CAS [5] (maybe <- 0x1000053) (Int)
add %i1, 76, %l3
lduw [%l3], %o4
mov %o4, %o5
! move %o5(lower) -> %o4(upper)
sllx %o5, 32, %o4
mov %l4, %l7
cas [%l3], %o5, %l7
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

P2191: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P2192: !ST [5] (maybe <- 0x1000054) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P2193: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P2194: !PREFETCH [1] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i0 + 4] %asi, 1

P2195: !CAS [7] (maybe <- 0x1000055) (Int)
add %i1, 84, %o5
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

P2196: !REPLACEMENT [12] (Int)
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

P2197: !ST [2] (maybe <- 0x1000056) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P2198: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P2199: !DWLD [3] (Int)
ldx [%i0 + 32], %o1
! move %o1(upper) -> %o1(upper)

P2200: !CAS [9] (maybe <- 0x1000057) (Int)
add %i1, 512, %o5
lduw [%o5], %l6
mov %l6, %l7
! move %l7(lower) -> %o1(lower)
srlx %o1, 32, %o1
sllx %o1, 32, %o1
or %l7, %o1, %o1
mov %l4, %o2
cas [%o5], %l7, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P2201: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P2202: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P2203: !CASX [15] (maybe <- 0x1000058) (Int) (Branch target of P3041)
add %i3, 192, %o5
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
ba P2204
nop

TARGET3041:
ba RET3041
nop


P2204: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P2205: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P2206: !ST [7] (maybe <- 0x1000059) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P2207: !PREFETCH [1] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i0 + 4] %asi, 1

P2208: !CAS [3] (maybe <- 0x100005a) (Int) (CBR)
add %i0, 32, %l7
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

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2208
nop
RET2208:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P2209: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P2210: !DWLD [3] (Int) (Branch target of P2094)
ldx [%i0 + 32], %o5
! move %o5(upper) -> %o0(lower)
srlx %o5, 32, %l7
or %l7, %o0, %o0
ba P2211
nop

TARGET2094:
ba RET2094
nop


P2211: !ST [12] (maybe <- 0x100005b) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P2212: !ST [4] (maybe <- 0x100005c) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P2213: !ST [2] (maybe <- 0x40800005) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i0 + 12 ]

P2214: !ST [1] (maybe <- 0x40800006) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i0 + 4 ]

P2215: !ST [0] (maybe <- 0x100005d) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P2216: !PREFETCH [11] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i2 + 64] %asi, 1

P2217: !CASX [5] (maybe <- 0x100005e) (Int)
add %i1, 72, %l3
ldx [%l3], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
mov  %o1, %o5
mov %l4, %o2
casx [%l3], %o5, %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
add  %l4, 1, %l4

P2218: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P2219: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P2220: !DWST [2] (maybe <- 0x100005f) (Int) (Branch target of P2593)
mov %l4, %o5 
stx %o5, [%i0 + 8]
add   %l4, 1, %l4
ba P2221
nop

TARGET2593:
ba RET2593
nop


P2221: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P2222: !CAS [3] (maybe <- 0x1000060) (Int)
add %i0, 32, %o5
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

P2223: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P2224: !DWST [9] (maybe <- 0x1000061) (Int)
mov %l4, %l7 
sllx %l7, 32, %l7 
stx %l7, [%i1 + 512 ] 
add   %l4, 1, %l4

P2225: !LD [2] (Int)
lduw [%i0 + 12], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P2226: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P2227: !ST [6] (maybe <- 0x40800007) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i1 + 80 ]

P2228: !CAS [1] (maybe <- 0x1000062) (Int)
add %i0, 4, %o5
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

P2229: !REPLACEMENT [7] (Int) (Branch target of P2329)
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
ba P2230
nop

TARGET2329:
ba RET2329
nop


P2230: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P2231: !CAS [4] (maybe <- 0x1000063) (Int)
add %i0, 64, %l7
lduw [%l7], %l3
mov %l3, %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0
mov %l4, %o1
cas [%l7], %l6, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P2232: !CAS [12] (maybe <- 0x1000064) (Int) (Branch target of P2525)
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
ba P2233
nop

TARGET2525:
ba RET2525
nop


P2233: !ST [1] (maybe <- 0x1000065) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P2234: !CAS [11] (maybe <- 0x1000066) (Int) (Branch target of P2968)
add %i2, 64, %l6
lduw [%l6], %o5
mov %o5, %l3
! move %l3(lower) -> %o2(lower)
or %l3, %o2, %o2
mov %l4, %o3
cas [%l6], %l3, %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4
ba P2235
nop

TARGET2968:
ba RET2968
nop


P2235: !DWST [4] (maybe <- 0x1000067) (Int)
mov %l4, %l3 
sllx %l3, 32, %l3 
stx %l3, [%i0 + 64 ] 
add   %l4, 1, %l4

P2236: !CASX [0] (maybe <- 0x1000068) (Int)
add %i0, 0, %l3
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

P2237: !ST [14] (maybe <- 0x100006a) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P2238: !CASX [2] (maybe <- 0x100006b) (Int)
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

P2239: !REPLACEMENT [2] (Int)
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

P2240: !CAS [8] (maybe <- 0x100006c) (Int)
add %i1, 256, %l7
lduw [%l7], %l3
mov %l3, %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2
mov %l4, %o3
cas [%l7], %l6, %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P2241: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P2242: !CAS [14] (maybe <- 0x100006d) (Int)
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

P2243: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P2244: !REPLACEMENT [14] (Int)
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

P2245: !ST [13] (maybe <- 0x100006e) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P2246: !CASX [0] (maybe <- 0x100006f) (Int)
add %i0, 0, %l3
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
mov %l7, %o5
sllx %l4, 32, %l7
add  %l4, 1, %l4
or   %l4, %l7, %l7
casx [%l3], %o5, %l7
! move %l7(upper) -> %o0(lower)
srlx %l7, 32, %l3
or %l3, %o0, %o0
! move %l7(lower) -> %o1(upper)
sllx %l7, 32, %o1
add  %l4, 1, %l4

P2247: !ST [8] (maybe <- 0x1000071) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P2248: !ST [8] (maybe <- 0x1000072) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P2249: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P2250: !ST [7] (maybe <- 0x1000073) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P2251: !ST [4] (maybe <- 0x1000074) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P2252: !CASX [12] (maybe <- 0x1000075) (Int)
add %i3, 0, %l3
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

P2253: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P2254: !PREFETCH [1] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i0 + 4] %asi, 1

P2255: !CASX [14] (maybe <- 0x1000076) (Int)
add %i3, 128, %l3
ldx [%l3], %l7
! move %l7(upper) -> %o3(lower)
srlx %l7, 32, %o5
or %o5, %o3, %o3
! move %l7(lower) -> %o4(upper)
sllx %l7, 32, %o4
mov  %l7, %o5
sllx %l4, 32, %l7
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

P2256: !CASX [7] (maybe <- 0x1000077) (Int) (LE)
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
! move %l7(lower) -> %o0(lower)
srl %l7, 0, %o5
or %o5, %o0, %o0
! move %l7(upper) -> %o1(upper)
or %l7, %g0, %o1
mov %l7, %o5
mov  %l6, %l7
casxa [%l3] %asi, %o5, %l7
! move %l7(lower) -> %o1(lower)
srlx %o1, 32, %o1
sllx %o1, 32, %o1
srl %l7, 0, %l3
or %l3, %o1, %o1
! move %l7(upper) -> %o2(upper)
or %l7, %g0, %o2
add  %l4, 1, %l4

P2257: !NOP (Int)
nop

P2258: !ST [9] (maybe <- 0x40800008) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i1 + 512 ]

P2259: !ST [2] (maybe <- 0x1000079) (Int) (Branch target of P2373)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4
ba P2260
nop

TARGET2373:
ba RET2373
nop


P2260: !DWST [2] (maybe <- 0x100007a) (Int)
mov %l4, %l6 
stx %l6, [%i0 + 8]
add   %l4, 1, %l4

P2261: !ST [5] (maybe <- 0x100007b) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P2262: !CAS [7] (maybe <- 0x100007c) (Int)
add %i1, 84, %l3
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

P2263: !ST [0] (maybe <- 0x100007d) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P2264: !ST [0] (maybe <- 0x100007e) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P2265: !ST [5] (maybe <- 0x100007f) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P2266: !CAS [8] (maybe <- 0x1000080) (Int) (CBR)
add %i1, 256, %l6
lduw [%l6], %o5
mov %o5, %l3
! move %l3(lower) -> %o3(lower)
or %l3, %o3, %o3
mov %l4, %o4
cas [%l6], %l3, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2266
nop
RET2266:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P2267: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P2268: !CAS [4] (maybe <- 0x1000081) (Int)
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

P2269: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P2270: !ST [10] (maybe <- 0x1000082) (Int) (CBR)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2270
nop
RET2270:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P2271: !ST [14] (maybe <- 0x1000083) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P2272: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P2273: !ST [2] (maybe <- 0x1000084) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P2274: !ST [0] (maybe <- 0x1000085) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P2275: !ST [10] (maybe <- 0x1000086) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P2276: !ST [0] (maybe <- 0x1000087) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P2277: !ST [11] (maybe <- 0x1000088) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P2278: !CASX [1] (maybe <- 0x1000089) (Int)
add %i0, 0, %l3
ldx [%l3], %l7
! move %l7(upper) -> %o0(lower)
srlx %l7, 32, %o5
or %o5, %o0, %o0
! move %l7(lower) -> %o1(upper)
sllx %l7, 32, %o1
mov %l7, %o5
sllx %l4, 32, %l7
add  %l4, 1, %l4
or   %l4, %l7, %l7
casx [%l3], %o5, %l7
! move %l7(upper) -> %o1(lower)
srlx %l7, 32, %l3
or %l3, %o1, %o1
! move %l7(lower) -> %o2(upper)
sllx %l7, 32, %o2
add  %l4, 1, %l4

P2279: !ST [12] (maybe <- 0x100008b) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P2280: !DWST [8] (maybe <- 0x100008c) (Int)
mov %l4, %l7 
sllx %l7, 32, %l7 
stx %l7, [%i1 + 256 ] 
add   %l4, 1, %l4

P2281: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P2282: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P2283: !CASX [11] (maybe <- 0x100008d) (Int)
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

P2284: !CASX [2] (maybe <- 0x100008e) (Int)
add %i0, 8, %l7
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
mov %l4, %l3
casx [%l7], %l6, %l3
! move %l3(upper) -> %o0(lower)
srlx %l3, 32, %l7
or %l7, %o0, %o0
! move %l3(lower) -> %o1(upper)
sllx %l3, 32, %o1
add  %l4, 1, %l4

P2285: !PREFETCH [14] (Int) (Branch target of P2780)
prefetch [%i3 + 128], 1
ba P2286
nop

TARGET2780:
ba RET2780
nop


P2286: !ST [12] (maybe <- 0x100008f) (Int) (Branch target of P2405)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4
ba P2287
nop

TARGET2405:
ba RET2405
nop


P2287: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P2288: !DWST [1] (maybe <- 0x1000090) (Int) (Branch target of P2877)
sllx %l4, 32, %l3 
add   %l4, 1, %l4
or %l3, %l4, %l3
stx %l3, [%i0 + 0]
add   %l4, 1, %l4
ba P2289
nop

TARGET2877:
ba RET2877
nop


P2289: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P2290: !PREFETCH [13] (Int) (CBR)
prefetch [%i3 + 64], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2290
nop
RET2290:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P2291: !SWAP [0] (maybe <- 0x1000092) (Int)
mov %l4, %l7
swap  [%i0 + 0], %l7
! move %l7(lower) -> %o1(lower)
srl %l7, 0, %l3
or %l3, %o1, %o1
add   %l4, 1, %l4

P2292: !CAS [0] (maybe <- 0x1000093) (Int)
add %i0, 0, %l3
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

P2293: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P2294: !PREFETCH [13] (Int) (Branch target of P2409)
prefetch [%i3 + 64], 1
ba P2295
nop

TARGET2409:
ba RET2409
nop


P2295: !CAS [5] (maybe <- 0x1000094) (Int)
add %i1, 76, %l3
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

P2296: !ST [10] (maybe <- 0x1000095) (Int) (LE)
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
stwa   %o5, [%i2 + 32] %asi
add   %l4, 1, %l4

P2297: !ST [7] (maybe <- 0x1000096) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P2298: !ST [3] (maybe <- 0x1000097) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P2299: !ST [15] (maybe <- 0x1000098) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P2300: !CASX [5] (maybe <- 0x1000099) (Int)
add %i1, 72, %l3
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
mov %l4, %o0
casx [%l3], %o5, %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
add  %l4, 1, %l4

P2301: !ST [9] (maybe <- 0x100009a) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P2302: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P2303: !DWLD [11] (Int) (CBR)
ldx [%i2 + 64], %o1
! move %o1(upper) -> %o1(upper)

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2303
nop
RET2303:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P2304: !CAS [10] (maybe <- 0x100009b) (Int)
add %i2, 32, %l7
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

P2305: !CASX [1] (maybe <- 0x100009c) (Int)
add %i0, 0, %l7
ldx [%l7], %l3
! move %l3(upper) -> %o2(lower)
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

P2306: !ST [11] (maybe <- 0x100009e) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P2307: !CAS [2] (maybe <- 0x100009f) (Int)
add %i0, 12, %l6
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

P2308: !CASX [15] (maybe <- 0x10000a0) (Int)
add %i3, 192, %l6
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

P2309: !MEMBAR (Int)
membar #StoreLoad

P2310: !CAS [1] (maybe <- 0x10000a1) (Int)
add %i0, 4, %l6
lduw [%l6], %o5
mov %o5, %l3
! move %l3(lower) -> %o2(lower)
or %l3, %o2, %o2
mov %l4, %o3
cas [%l6], %l3, %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P2311: !ST [2] (maybe <- 0x10000a2) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P2312: !CAS [3] (maybe <- 0x10000a3) (Int)
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

P2313: !CAS [11] (maybe <- 0x10000a4) (Int)
add %i2, 64, %l3
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

P2314: !CASX [12] (maybe <- 0x10000a5) (Int)
add %i3, 0, %l3
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

P2315: !LD [1] (Int)
lduw [%i0 + 4], %l3
! move %l3(lower) -> %o2(lower)
or %l3, %o2, %o2

P2316: !DWST [3] (maybe <- 0x10000a6) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i0 + 32 ] 
add   %l4, 1, %l4

P2317: !REPLACEMENT [11] (Int)
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

P2318: !ST [11] (maybe <- 0x10000a7) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P2319: !ST [4] (maybe <- 0x10000a8) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P2320: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P2321: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P2322: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P2323: !ST [8] (maybe <- 0x10000a9) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P2324: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P2325: !CAS [3] (maybe <- 0x10000aa) (Int)
add %i0, 32, %l6
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

P2326: !CASX [11] (maybe <- 0x10000ab) (Int)
add %i2, 64, %l6
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

P2327: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P2328: !ST [1] (maybe <- 0x10000ac) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P2329: !PREFETCH [13] (Int) (CBR)
prefetch [%i3 + 64], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2329
nop
RET2329:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P2330: !CAS [15] (maybe <- 0x10000ad) (Int)
add %i3, 192, %l6
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

P2331: !PREFETCH [9] (Int) (CBR)
prefetch [%i1 + 512], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2331
nop
RET2331:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P2332: !ST [3] (maybe <- 0x10000ae) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P2333: !ST [9] (maybe <- 0x10000af) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P2334: !ST [0] (maybe <- 0x10000b0) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P2335: !CAS [6] (maybe <- 0x10000b1) (Int)
add %i1, 80, %o5
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

P2336: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P2337: !ST [11] (maybe <- 0x10000b2) (Int) (CBR)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2337
nop
RET2337:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P2338: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P2339: !ST [3] (maybe <- 0x10000b3) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P2340: !ST [1] (maybe <- 0x10000b4) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P2341: !CAS [9] (maybe <- 0x10000b5) (Int)
add %i1, 512, %l6
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

P2342: !ST [15] (maybe <- 0x40800009) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i3 + 192 ]

P2343: !PREFETCH [8] (Int) (Branch target of P2909)
prefetch [%i1 + 256], 1
ba P2344
nop

TARGET2909:
ba RET2909
nop


P2344: !CASX [12] (maybe <- 0x10000b6) (Int) (CBR)
add %i3, 0, %l3
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
be,pt  %xcc, TARGET2344
nop
RET2344:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P2345: !CASX [8] (maybe <- 0x10000b7) (Int)
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

P2346: !DWST [15] (maybe <- 0x4080000a) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
std %f20, [%i3 + 192]

P2347: !DWLD [6] (Int)
ldx [%i1 + 80], %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)

P2348: !CAS [0] (maybe <- 0x10000b8) (Int)
add %i0, 0, %l7
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

P2349: !ST [3] (maybe <- 0x10000b9) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P2350: !MEMBAR (Int)
membar #StoreLoad

P2351: !ST [14] (maybe <- 0x10000ba) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P2352: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P2353: !LD [12] (Int)
lduw [%i3 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P2354: !ST [4] (maybe <- 0x10000bb) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P2355: !ST [10] (maybe <- 0x10000bc) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P2356: !PREFETCH [7] (Int) (Branch target of P2953)
prefetch [%i1 + 84], 1
ba P2357
nop

TARGET2953:
ba RET2953
nop


P2357: !CASX [7] (maybe <- 0x10000bd) (Int)
add %i1, 80, %l3
ldx [%l3], %l7
! move %l7(upper) -> %o0(lower)
srlx %l7, 32, %o5
or %o5, %o0, %o0
! move %l7(lower) -> %o1(upper)
sllx %l7, 32, %o1
mov %l7, %o5
sllx %l4, 32, %l7
add  %l4, 1, %l4
or   %l4, %l7, %l7
casx [%l3], %o5, %l7
! move %l7(upper) -> %o1(lower)
srlx %l7, 32, %l3
or %l3, %o1, %o1
! move %l7(lower) -> %o2(upper)
sllx %l7, 32, %o2
add  %l4, 1, %l4

P2358: !ST [13] (maybe <- 0x10000bf) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P2359: !ST [13] (maybe <- 0x4080000b) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i3 + 64 ]

P2360: !CAS [13] (maybe <- 0x10000c0) (Int)
add %i3, 64, %l7
lduw [%l7], %l3
mov %l3, %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2
mov %l4, %o3
cas [%l7], %l6, %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P2361: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P2362: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P2363: !PREFETCH [9] (Int) (CBR)
prefetch [%i1 + 512], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2363
nop
RET2363:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P2364: !ST [6] (maybe <- 0x10000c1) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P2365: !ST [11] (maybe <- 0x10000c2) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P2366: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P2367: !ST [1] (maybe <- 0x10000c3) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P2368: !CASX [12] (maybe <- 0x10000c4) (Int)
add %i3, 0, %l3
ldx [%l3], %l7
! move %l7(upper) -> %o3(lower)
srlx %l7, 32, %o5
or %o5, %o3, %o3
! move %l7(lower) -> %o4(upper)
sllx %l7, 32, %o4
mov  %l7, %o5
sllx %l4, 32, %l7
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

P2369: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P2370: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P2371: !PREFETCH [2] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i0 + 12] %asi, 1

P2372: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P2373: !ST [8] (maybe <- 0x10000c5) (Int) (CBR)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2373
nop
RET2373:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P2374: !CASX [9] (maybe <- 0x10000c6) (Int)
add %i1, 512, %l3
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

P2375: !CASX [15] (maybe <- 0x10000c7) (Int)
add %i3, 192, %l3
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

P2376: !CASX [11] (maybe <- 0x10000c8) (Int)
add %i2, 64, %l3
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

P2377: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P2378: !CAS [14] (maybe <- 0x10000c9) (Int) (Branch target of P2164)
add %i3, 128, %l3
lduw [%l3], %l7
mov %l7, %o5
! move %o5(lower) -> %o1(lower)
or %o5, %o1, %o1
mov %l4, %o2
cas [%l3], %o5, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4
ba P2379
nop

TARGET2164:
ba RET2164
nop


P2379: !CAS [14] (maybe <- 0x10000ca) (Int)
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

P2380: !MEMBAR (Int)
membar #StoreLoad

P2381: !CASX [1] (maybe <- 0x10000cb) (Int) (Branch target of P2459)
add %i0, 0, %l3
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
ba P2382
nop

TARGET2459:
ba RET2459
nop


P2382: !ST [6] (maybe <- 0x10000cd) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P2383: !CAS [8] (maybe <- 0x10000ce) (Int) (LE)
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
add %i1, 256, %o5
lduwa [%o5] %asi, %l6
mov %l6, %l7
! move %l7(lower) -> %o0(lower)
or %l7, %o0, %o0
mov %l3, %o1
casa [%o5] %asi, %l7, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P2384: !ST [12] (maybe <- 0x4080000c) (FP) (CBR)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i3 + 0 ]

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2384
nop
RET2384:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P2385: !ST [3] (maybe <- 0x10000cf) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P2386: !ST [13] (maybe <- 0x10000d0) (Int) (CBR)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2386
nop
RET2386:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P2387: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P2388: !PREFETCH [5] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i1 + 76] %asi, 1

P2389: !ST [4] (maybe <- 0x10000d1) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P2390: !ST [0] (maybe <- 0x4080000d) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i0 + 0 ]

P2391: !ST [0] (maybe <- 0x10000d2) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P2392: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P2393: !CAS [8] (maybe <- 0x10000d3) (Int)
add %i1, 256, %o5
lduw [%o5], %l6
mov %l6, %l7
! move %l7(lower) -> %o1(lower)
or %l7, %o1, %o1
mov %l4, %o2
cas [%o5], %l7, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P2394: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P2395: !ST [3] (maybe <- 0x10000d4) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P2396: !PREFETCH [0] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i0 + 0] %asi, 1

P2397: !DWST [8] (maybe <- 0x10000d5) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 256 ] 
add   %l4, 1, %l4

P2398: !ST [3] (maybe <- 0x10000d6) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P2399: !ST [5] (maybe <- 0x10000d7) (Int) (CBR)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2399
nop
RET2399:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P2400: !ST [13] (maybe <- 0x10000d8) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P2401: !ST [15] (maybe <- 0x10000d9) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P2402: !DWLD [15] (Int)
ldx [%i3 + 192], %l7
! move %l7(upper) -> %o2(lower)
srlx %l7, 32, %l6
or %l6, %o2, %o2

P2403: !ST [11] (maybe <- 0x10000da) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P2404: !SWAP [5] (maybe <- 0x10000db) (Int)
mov %l4, %o3
swap  [%i1 + 76], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P2405: !CASX [12] (maybe <- 0x10000dc) (Int) (CBR) (Branch target of P2463)
add %i3, 0, %l7
ldx [%l7], %l3
! move %l3(upper) -> %o3(lower)
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

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2405
nop
RET2405:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0

ba P2406
nop

TARGET2463:
ba RET2463
nop


P2406: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P2407: !DWST [14] (maybe <- 0x10000dd) (Int)
mov %l4, %l7 
sllx %l7, 32, %l7 
stx %l7, [%i3 + 128 ] 
add   %l4, 1, %l4

P2408: !ST [12] (maybe <- 0x10000de) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P2409: !ST [6] (maybe <- 0x10000df) (Int) (LE) (CBR)
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
stwa   %l3, [%i1 + 80] %asi
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2409
nop
RET2409:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P2410: !ST [10] (maybe <- 0x10000e0) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P2411: !DWST [2] (maybe <- 0x10000e1) (Int)
mov %l4, %o5 
stx %o5, [%i0 + 8]
add   %l4, 1, %l4

P2412: !CASX [3] (maybe <- 0x10000e2) (Int)
add %i0, 32, %o5
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

P2413: !REPLACEMENT [0] (Int)
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

P2414: !REPLACEMENT [0] (Int) (CBR)
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
be,pn  %xcc, TARGET2414
nop
RET2414:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P2415: !CAS [0] (maybe <- 0x10000e3) (Int)
add %i0, 0, %l7
lduw [%l7], %l3
mov %l3, %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2
mov %l4, %o3
cas [%l7], %l6, %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P2416: !ST [6] (maybe <- 0x10000e4) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P2417: !DWST [1] (maybe <- 0x10000e5) (Int)
sllx %l4, 32, %l3 
add   %l4, 1, %l4
or %l3, %l4, %l3
stx %l3, [%i0 + 0]
add   %l4, 1, %l4

P2418: !DWST [12] (maybe <- 0x10000e7) (Int)
mov %l4, %o5 
sllx %o5, 32, %o5 
stx %o5, [%i3 + 0 ] 
add   %l4, 1, %l4

P2419: !ST [1] (maybe <- 0x10000e8) (Int) (CBR)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2419
nop
RET2419:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P2420: !ST [0] (maybe <- 0x10000e9) (Int) (CBR)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2420
nop
RET2420:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P2421: !LD [12] (Int)
lduw [%i3 + 0], %o5
! move %o5(lower) -> %o3(lower)
or %o5, %o3, %o3

P2422: !CASX [15] (maybe <- 0x10000ea) (Int)
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

P2423: !LD [2] (Int)
lduw [%i0 + 12], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P2424: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P2425: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P2426: !ST [9] (maybe <- 0x10000eb) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P2427: !ST [12] (maybe <- 0x10000ec) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P2428: !LD [15] (Int)
lduw [%i3 + 192], %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1

P2429: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P2430: !CAS [15] (maybe <- 0x10000ed) (Int)
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

P2431: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P2432: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P2433: !REPLACEMENT [13] (Int)
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

P2434: !SWAP [14] (maybe <- 0x10000ee) (Int)
mov %l4, %o3
swap  [%i3 + 128], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P2435: !ST [10] (maybe <- 0x10000ef) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P2436: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P2437: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P2438: !LD [12] (Int)
lduw [%i3 + 0], %l3
! move %l3(lower) -> %o3(lower)
or %l3, %o3, %o3

P2439: !CAS [2] (maybe <- 0x10000f0) (Int)
add %i0, 12, %l7
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

P2440: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P2441: !DWLD [12] (Int)
ldx [%i3 + 0], %o0
! move %o0(upper) -> %o0(upper)

P2442: !CASX [3] (maybe <- 0x10000f1) (Int) (LE)
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
add %i0, 32, %l3
ldxa [%l3] %asi, %l7
! move %l7(lower) -> %o0(lower)
srlx %o0, 32, %o0
sllx %o0, 32, %o0
srl %l7, 0, %o5
or %o5, %o0, %o0
! move %l7(upper) -> %o1(upper)
or %l7, %g0, %o1
mov  %l7, %o5
mov  %l6, %l7
casxa [%l3] %asi, %o5, %l7
! move %l7(lower) -> %o1(lower)
srlx %o1, 32, %o1
sllx %o1, 32, %o1
srl %l7, 0, %l3
or %l3, %o1, %o1
! move %l7(upper) -> %o2(upper)
or %l7, %g0, %o2
add  %l4, 1, %l4

P2443: !ST [8] (maybe <- 0x10000f2) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P2444: !ST [8] (maybe <- 0x10000f3) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P2445: !PREFETCH [6] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i1 + 80] %asi, 1

P2446: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P2447: !MEMBAR (Int)
membar #StoreLoad

P2448: !DWST [7] (maybe <- 0x4080000e) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=21 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
std %f20, [%i1 + 80]

P2449: !CAS [9] (maybe <- 0x10000f4) (Int) (LE)
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
add %i1, 512, %l6
lduwa [%l6] %asi, %o5
mov %o5, %l3
! move %l3(lower) -> %o2(lower)
srlx %o2, 32, %o2
sllx %o2, 32, %o2
or %l3, %o2, %o2
mov %l7, %o3
casa [%l6] %asi, %l3, %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P2450: !LD [1] (Int)
lduw [%i0 + 4], %l6
! move %l6(lower) -> %o3(lower)
or %l6, %o3, %o3

P2451: !CAS [5] (maybe <- 0x10000f5) (Int)
add %i1, 76, %o5
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

P2452: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P2453: !CAS [12] (maybe <- 0x10000f6) (Int) (CBR)
add %i3, 0, %o5
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

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2453
nop
RET2453:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P2454: !CASX [6] (maybe <- 0x10000f7) (Int)
add %i1, 80, %l3
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

P2455: !CAS [15] (maybe <- 0x10000f9) (Int)
add %i3, 192, %l3
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

P2456: !PREFETCH [12] (Int) (CBR) (Branch target of P2270)
prefetch [%i3 + 0], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2456
nop
RET2456:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0

ba P2457
nop

TARGET2270:
ba RET2270
nop


P2457: !CAS [7] (maybe <- 0x10000fa) (Int)
add %i1, 84, %l6
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

P2458: !ST [10] (maybe <- 0x10000fb) (Int) (Branch target of P2384)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4
ba P2459
nop

TARGET2384:
ba RET2384
nop


P2459: !DWLD [2] (Int) (CBR)
ldx [%i0 + 8], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2459
nop
RET2459:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P2460: !ST [14] (maybe <- 0x10000fc) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P2461: !CAS [11] (maybe <- 0x10000fd) (Int)
add %i2, 64, %l7
lduw [%l7], %l3
mov %l3, %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0
mov %l4, %o1
cas [%l7], %l6, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P2462: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P2463: !ST [5] (maybe <- 0x10000fe) (Int) (CBR)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2463
nop
RET2463:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P2464: !DWST [0] (maybe <- 0x10000ff) (Int)
sllx %l4, 32, %l6 
add   %l4, 1, %l4
or %l6, %l4, %l6
stx %l6, [%i0 + 0]
add   %l4, 1, %l4

P2465: !LD [13] (Int)
lduw [%i3 + 64], %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1

P2466: !CAS [3] (maybe <- 0x1000101) (Int)
add %i0, 32, %o5
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

P2467: !ST [2] (maybe <- 0x1000102) (Int) (LE)
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
stwa   %l7, [%i0 + 12] %asi
add   %l4, 1, %l4

P2468: !LD [15] (Int)
lduw [%i3 + 192], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P2469: !ST [14] (maybe <- 0x1000103) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P2470: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P2471: !ST [4] (maybe <- 0x1000104) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P2472: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P2473: !DWLD [12] (Int)
ldx [%i3 + 0], %l7
! move %l7(upper) -> %o3(lower)
srlx %l7, 32, %l6
or %l6, %o3, %o3

P2474: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P2475: !ST [1] (maybe <- 0x40800010) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i0 + 4 ]

P2476: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P2477: !ST [15] (maybe <- 0x1000105) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P2478: !CAS [13] (maybe <- 0x1000106) (Int) (Branch target of P2111)
add %i3, 64, %l7
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
ba P2479
nop

TARGET2111:
ba RET2111
nop


P2479: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P2480: !CASX [12] (maybe <- 0x1000107) (Int)
add %i3, 0, %l7
ldx [%l7], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l6
sllx %l4, 32, %o1
casx [%l7], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P2481: !REPLACEMENT [8] (Int)
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

P2482: !CAS [10] (maybe <- 0x1000108) (Int)
add %i2, 32, %l6
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

P2483: !CASX [2] (maybe <- 0x1000109) (Int)
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

P2484: !ST [8] (maybe <- 0x100010a) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P2485: !ST [3] (maybe <- 0x100010b) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P2486: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P2487: !ST [5] (maybe <- 0x100010c) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P2488: !CASX [10] (maybe <- 0x100010d) (Int) (CBR)
add %i2, 32, %l7
ldx [%l7], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l6
sllx %l4, 32, %o1
casx [%l7], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2488
nop
RET2488:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P2489: !MEMBAR (Int)
membar #StoreLoad

P2490: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P2491: !ST [12] (maybe <- 0x100010e) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P2492: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P2493: !ST [2] (maybe <- 0x100010f) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P2494: !PREFETCH [15] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i3 + 192] %asi, 1

P2495: !LD [5] (Int)
lduw [%i1 + 76], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P2496: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P2497: !CASX [1] (maybe <- 0x1000110) (Int)
add %i0, 0, %o5
ldx [%o5], %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l7
or %l7, %o2, %o2
! move %l6(lower) -> %o3(upper)
sllx %l6, 32, %o3
mov %l6, %l7
sllx %l4, 32, %l6
add  %l4, 1, %l4
or   %l4, %l6, %l6
casx [%o5], %l7, %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %o5
or %o5, %o3, %o3
! move %l6(lower) -> %o4(upper)
sllx %l6, 32, %o4
add  %l4, 1, %l4

P2498: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P2499: !PREFETCH [7] (Int) (Branch target of P3070)
prefetch [%i1 + 84], 1
ba P2500
nop

TARGET3070:
ba RET3070
nop


P2500: !CAS [10] (maybe <- 0x1000112) (Int)
add %i2, 32, %o5
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

P2501: !ST [2] (maybe <- 0x1000113) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P2502: !ST [1] (maybe <- 0x1000114) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P2503: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P2504: !CAS [6] (maybe <- 0x1000115) (Int)
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

P2505: !CASX [1] (maybe <- 0x1000116) (Int)
add %i0, 0, %l6
ldx [%l6], %o5
! move %o5(upper) -> %o1(lower)
srlx %o5, 32, %l3
or %l3, %o1, %o1
! move %o5(lower) -> %o2(upper)
sllx %o5, 32, %o2
mov %o5, %l3
sllx %l4, 32, %o5
add  %l4, 1, %l4
or   %l4, %o5, %o5
casx [%l6], %l3, %o5
! move %o5(upper) -> %o2(lower)
srlx %o5, 32, %l6
or %l6, %o2, %o2
! move %o5(lower) -> %o3(upper)
sllx %o5, 32, %o3
add  %l4, 1, %l4

P2506: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P2507: !CAS [3] (maybe <- 0x1000118) (Int)
add %i0, 32, %l6
lduw [%l6], %o5
mov %o5, %l3
! move %l3(lower) -> %o3(lower)
or %l3, %o3, %o3
mov %l4, %o4
cas [%l6], %l3, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P2508: !ST [12] (maybe <- 0x1000119) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P2509: !ST [4] (maybe <- 0x100011a) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P2510: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P2511: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P2512: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P2513: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P2514: !MEMBAR (Int)
membar #StoreLoad

P2515: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P2516: !DWST [8] (maybe <- 0x100011b) (Int)
mov %l4, %l7 
sllx %l7, 32, %l7 
stx %l7, [%i1 + 256 ] 
add   %l4, 1, %l4

P2517: !ST [2] (maybe <- 0x100011c) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P2518: !ST [13] (maybe <- 0x100011d) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P2519: !ST [8] (maybe <- 0x100011e) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P2520: !CASX [4] (maybe <- 0x100011f) (Int)
add %i0, 64, %o5
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

P2521: !SWAP [9] (maybe <- 0x1000120) (Int)
mov %l4, %l3
swap  [%i1 + 512], %l3
! move %l3(lower) -> %o1(lower)
srl %l3, 0, %l7
or %l7, %o1, %o1
add   %l4, 1, %l4

P2522: !CAS [11] (maybe <- 0x1000121) (Int) (LE)
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
add %i2, 64, %l7
lduwa [%l7] %asi, %o2
mov %o2, %l6
! move %l6(lower) -> %o2(upper)
sllx %l6, 32, %o2
mov %o5, %l3
casa [%l7] %asi, %l6, %l3
! move %l3(lower) -> %o2(lower)
srl %l3, 0, %l7
or %l7, %o2, %o2
add   %l4, 1, %l4

P2523: !ST [6] (maybe <- 0x1000122) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P2524: !LD [2] (Int)
lduw [%i0 + 12], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P2525: !ST [0] (maybe <- 0x1000123) (Int) (CBR)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2525
nop
RET2525:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P2526: !ST [2] (maybe <- 0x1000124) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P2527: !CASX [8] (maybe <- 0x1000125) (Int)
add %i1, 256, %l7
ldx [%l7], %l3
! move %l3(upper) -> %o3(lower)
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

P2528: !CASX [5] (maybe <- 0x1000126) (Int)
add %i1, 72, %l7
ldx [%l7], %l3
! move %l3(upper) -> %o0(lower)
srlx %l3, 32, %l6
or %l6, %o0, %o0
! move %l3(lower) -> %o1(upper)
sllx %l3, 32, %o1
mov  %l3, %l6
mov %l4, %l3
casx [%l7], %l6, %l3
! move %l3(upper) -> %o1(lower)
srlx %l3, 32, %l7
or %l7, %o1, %o1
! move %l3(lower) -> %o2(upper)
sllx %l3, 32, %o2
add  %l4, 1, %l4

P2529: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P2530: !ST [15] (maybe <- 0x1000127) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P2531: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P2532: !ST [5] (maybe <- 0x1000128) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P2533: !CASX [9] (maybe <- 0x1000129) (Int)
add %i1, 512, %l3
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

P2534: !CASX [10] (maybe <- 0x100012a) (Int)
add %i2, 32, %l3
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

P2535: !CAS [11] (maybe <- 0x100012b) (Int)
add %i2, 64, %l3
lduw [%l3], %l7
mov %l7, %o5
! move %o5(lower) -> %o1(lower)
or %o5, %o1, %o1
mov %l4, %o2
cas [%l3], %o5, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P2536: !CAS [3] (maybe <- 0x100012c) (Int)
add %i0, 32, %l3
lduw [%l3], %l7
mov %l7, %o5
! move %o5(lower) -> %o2(lower)
or %o5, %o2, %o2
mov %l4, %o3
cas [%l3], %o5, %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P2537: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P2538: !ST [10] (maybe <- 0x100012d) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P2539: !CASX [11] (maybe <- 0x100012e) (Int)
add %i2, 64, %o5
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

P2540: !CASX [9] (maybe <- 0x100012f) (Int) (CBR)
add %i1, 512, %o5
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

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2540
nop
RET2540:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P2541: !CASX [12] (maybe <- 0x1000130) (Int)
add %i3, 0, %l3
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

P2542: !PREFETCH [7] (Int) (CBR)
prefetch [%i1 + 84], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2542
nop
RET2542:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P2543: !ST [3] (maybe <- 0x1000131) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P2544: !CAS [7] (maybe <- 0x1000132) (Int)
add %i1, 84, %l3
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

P2545: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P2546: !MEMBAR (Int)
membar #StoreLoad

P2547: !DWST [13] (maybe <- 0x1000133) (Int)
mov %l4, %o5 
sllx %o5, 32, %o5 
stx %o5, [%i3 + 64 ] 
add   %l4, 1, %l4

P2548: !ST [6] (maybe <- 0x1000134) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P2549: !PREFETCH [7] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i1 + 84] %asi, 1

P2550: !REPLACEMENT [11] (Int)
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

P2551: !NOP (Int) (Branch target of P2707)
nop
ba P2552
nop

TARGET2707:
ba RET2707
nop


P2552: !CAS [7] (maybe <- 0x1000135) (Int) (Branch target of P2862)
add %i1, 84, %l6
lduw [%l6], %o5
mov %o5, %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0
mov %l4, %o1
cas [%l6], %l3, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4
ba P2553
nop

TARGET2862:
ba RET2862
nop


P2553: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P2554: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P2555: !CAS [0] (maybe <- 0x1000136) (Int)
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

P2556: !PREFETCH [8] (Int) (Branch target of P2716)
prefetch [%i1 + 256], 1
ba P2557
nop

TARGET2716:
ba RET2716
nop


P2557: !ST [14] (maybe <- 0x1000137) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P2558: !ST [4] (maybe <- 0x1000138) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P2559: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P2560: !CAS [3] (maybe <- 0x1000139) (Int)
add %i0, 32, %o5
lduw [%o5], %l6
mov %l6, %l7
! move %l7(lower) -> %o2(lower)
or %l7, %o2, %o2
mov %l4, %o3
cas [%o5], %l7, %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P2561: !CAS [1] (maybe <- 0x100013a) (Int)
add %i0, 4, %o5
lduw [%o5], %l6
mov %l6, %l7
! move %l7(lower) -> %o3(lower)
or %l7, %o3, %o3
mov %l4, %o4
cas [%o5], %l7, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P2562: !ST [13] (maybe <- 0x100013b) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P2563: !ST [11] (maybe <- 0x100013c) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P2564: !ST [13] (maybe <- 0x100013d) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P2565: !DWST [2] (maybe <- 0x100013e) (Int)
mov %l4, %o5 
stx %o5, [%i0 + 8]
add   %l4, 1, %l4

P2566: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P2567: !CASX [15] (maybe <- 0x100013f) (Int) (LE)
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
add %i3, 192, %o5
ldxa [%o5] %asi, %l6
! move %l6(lower) -> %o4(lower)
srl %l6, 0, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5
! move %l6(upper) -> %o0(upper)
or %l6, %g0, %o0
mov  %l6, %l7
mov  %l3, %l6
casxa [%o5] %asi, %l7, %l6
! move %l6(lower) -> %o0(lower)
srlx %o0, 32, %o0
sllx %o0, 32, %o0
srl %l6, 0, %o5
or %o5, %o0, %o0
! move %l6(upper) -> %o1(upper)
or %l6, %g0, %o1
add  %l4, 1, %l4

P2568: !CAS [3] (maybe <- 0x1000140) (Int) (Branch target of P2420)
add %i0, 32, %o5
lduw [%o5], %l6
mov %l6, %l7
! move %l7(lower) -> %o1(lower)
srlx %o1, 32, %o1
sllx %o1, 32, %o1
or %l7, %o1, %o1
mov %l4, %o2
cas [%o5], %l7, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4
ba P2569
nop

TARGET2420:
ba RET2420
nop


P2569: !CAS [6] (maybe <- 0x1000141) (Int)
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

P2570: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P2571: !ST [9] (maybe <- 0x1000142) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P2572: !CAS [8] (maybe <- 0x1000143) (Int)
add %i1, 256, %l7
lduw [%l7], %l3
mov %l3, %l6
! move %l6(lower) -> %o3(lower)
or %l6, %o3, %o3
mov %l4, %o4
cas [%l7], %l6, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P2573: !DWST [12] (maybe <- 0x1000144) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 0 ] 
add   %l4, 1, %l4

P2574: !CASX [5] (maybe <- 0x1000145) (Int) (CBR)
add %i1, 72, %l6
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

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2574
nop
RET2574:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P2575: !ST [12] (maybe <- 0x1000146) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P2576: !ST [13] (maybe <- 0x1000147) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P2577: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P2578: !REPLACEMENT [9] (Int)
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

P2579: !CASX [5] (maybe <- 0x1000148) (Int) (LE)
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
sllx %l3, 32, %l3
wr %g0, 0x88, %asi
add %i1, 72, %o5
ldxa [%o5] %asi, %l6
! move %l6(lower) -> %o1(lower)
srl %l6, 0, %l7
or %l7, %o1, %o1
! move %l6(upper) -> %o2(upper)
or %l6, %g0, %o2
mov  %l6, %l7
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

P2580: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P2581: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P2582: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P2583: !CAS [9] (maybe <- 0x1000149) (Int)
add %i1, 512, %o5
lduw [%o5], %l6
mov %l6, %l7
! move %l7(lower) -> %o3(lower)
srlx %o3, 32, %o3
sllx %o3, 32, %o3
or %l7, %o3, %o3
mov %l4, %o4
cas [%o5], %l7, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P2584: !CAS [10] (maybe <- 0x100014a) (Int)
add %i2, 32, %o5
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

P2585: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P2586: !CAS [2] (maybe <- 0x100014b) (Int)
add %i0, 12, %o5
lduw [%o5], %l6
mov %l6, %l7
! move %l7(lower) -> %o0(lower)
or %l7, %o0, %o0
mov %l4, %o1
cas [%o5], %l7, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P2587: !ST [15] (maybe <- 0x100014c) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P2588: !PREFETCH [7] (Int) (Branch target of P2962)
prefetch [%i1 + 84], 1
ba P2589
nop

TARGET2962:
ba RET2962
nop


P2589: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P2590: !ST [6] (maybe <- 0x100014d) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P2591: !REPLACEMENT [11] (Int)
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

P2592: !CASX [7] (maybe <- 0x100014e) (Int) (Branch target of P2822)
add %i1, 80, %l3
ldx [%l3], %l7
! move %l7(upper) -> %o1(lower)
srlx %l7, 32, %o5
or %o5, %o1, %o1
! move %l7(lower) -> %o2(upper)
sllx %l7, 32, %o2
mov %l7, %o5
sllx %l4, 32, %l7
add  %l4, 1, %l4
or   %l4, %l7, %l7
casx [%l3], %o5, %l7
! move %l7(upper) -> %o2(lower)
srlx %l7, 32, %l3
or %l3, %o2, %o2
! move %l7(lower) -> %o3(upper)
sllx %l7, 32, %o3
add  %l4, 1, %l4
ba P2593
nop

TARGET2822:
ba RET2822
nop


P2593: !CASX [14] (maybe <- 0x1000150) (Int) (CBR)
add %i3, 128, %l3
ldx [%l3], %l7
! move %l7(upper) -> %o3(lower)
srlx %l7, 32, %o5
or %o5, %o3, %o3
! move %l7(lower) -> %o4(upper)
sllx %l7, 32, %o4
mov  %l7, %o5
sllx %l4, 32, %l7
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

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2593
nop
RET2593:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P2594: !ST [8] (maybe <- 0x1000151) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P2595: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P2596: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P2597: !CASX [3] (maybe <- 0x1000152) (Int)
add %i0, 32, %l3
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

P2598: !CASX [5] (maybe <- 0x1000153) (Int) (Branch target of P2574)
add %i1, 72, %l3
ldx [%l3], %l7
! move %l7(upper) -> %o2(lower)
srlx %l7, 32, %o5
or %o5, %o2, %o2
! move %l7(lower) -> %o3(upper)
sllx %l7, 32, %o3
mov  %l7, %o5
mov %l4, %l7
casx [%l3], %o5, %l7
! move %l7(upper) -> %o3(lower)
srlx %l7, 32, %l3
or %l3, %o3, %o3
! move %l7(lower) -> %o4(upper)
sllx %l7, 32, %o4
add  %l4, 1, %l4
ba P2599
nop

TARGET2574:
ba RET2574
nop


P2599: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P2600: !PREFETCH [8] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i1 + 256] %asi, 1

P2601: !ST [4] (maybe <- 0x1000154) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P2602: !ST [3] (maybe <- 0x1000155) (Int) (CBR)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2602
nop
RET2602:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P2603: !DWLD [1] (Int)
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

P2604: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P2605: !ST [15] (maybe <- 0x1000156) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P2606: !CAS [9] (maybe <- 0x1000157) (Int) (LE)
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
add %i1, 512, %l3
lduwa [%l3] %asi, %l7
mov %l7, %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0
mov %l6, %o1
casa [%l3] %asi, %o5, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P2607: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P2608: !CAS [3] (maybe <- 0x1000158) (Int)
add %i0, 32, %l3
lduw [%l3], %l7
mov %l7, %o5
! move %o5(lower) -> %o1(lower)
or %o5, %o1, %o1
mov %l4, %o2
cas [%l3], %o5, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P2609: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P2610: !ST [10] (maybe <- 0x1000159) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P2611: !CASX [6] (maybe <- 0x100015a) (Int)
add %i1, 80, %o5
ldx [%o5], %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l7
or %l7, %o2, %o2
! move %l6(lower) -> %o3(upper)
sllx %l6, 32, %o3
mov %l6, %l7
sllx %l4, 32, %l6
add  %l4, 1, %l4
or   %l4, %l6, %l6
casx [%o5], %l7, %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %o5
or %o5, %o3, %o3
! move %l6(lower) -> %o4(upper)
sllx %l6, 32, %o4
add  %l4, 1, %l4

P2612: !CASX [6] (maybe <- 0x100015c) (Int)
add %i1, 80, %o5
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
mov %l6, %l7
sllx %l4, 32, %l6
add  %l4, 1, %l4
or   %l4, %l6, %l6
casx [%o5], %l7, %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %o5
or %o5, %o0, %o0
! move %l6(lower) -> %o1(upper)
sllx %l6, 32, %o1
add  %l4, 1, %l4

P2613: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P2614: !ST [14] (maybe <- 0x40800011) (FP) (Branch target of P3066)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i3 + 128 ]
ba P2615
nop

TARGET3066:
ba RET3066
nop


P2615: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P2616: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P2617: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P2618: !CAS [0] (maybe <- 0x100015e) (Int) (LE)
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
add %i0, 0, %l7
lduwa [%l7] %asi, %l3
mov %l3, %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1
mov %o5, %o2
casa [%l7] %asi, %l6, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P2619: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P2620: !DWST [9] (maybe <- 0x100015f) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 512 ] 
add   %l4, 1, %l4

P2621: !ST [14] (maybe <- 0x1000160) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P2622: !ST [4] (maybe <- 0x1000161) (Int) (Branch target of P2858)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4
ba P2623
nop

TARGET2858:
ba RET2858
nop


P2623: !ST [11] (maybe <- 0x40800012) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i2 + 64 ]

P2624: !PREFETCH [0] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i0 + 0] %asi, 1

P2625: !LD [5] (Int) (Branch target of P2456)
lduw [%i1 + 76], %l7
! move %l7(lower) -> %o2(lower)
or %l7, %o2, %o2
ba P2626
nop

TARGET2456:
ba RET2456
nop


P2626: !REPLACEMENT [5] (Int)
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

P2627: !CASX [1] (maybe <- 0x1000162) (Int)
add %i0, 0, %o5
ldx [%o5], %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
mov %o3, %l7
sllx %l4, 32, %o4
add  %l4, 1, %l4
or   %l4, %o4, %o4
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

P2628: !ST [4] (maybe <- 0x1000164) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P2629: !ST [12] (maybe <- 0x1000165) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P2630: !CAS [0] (maybe <- 0x1000166) (Int)
add %i0, 0, %l6
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

P2631: !DWST [5] (maybe <- 0x1000167) (Int)
mov %l4, %l3 
stx %l3, [%i1 + 72]
add   %l4, 1, %l4

P2632: !PREFETCH [9] (Int) (Branch target of P2144)
prefetch [%i1 + 512], 1
ba P2633
nop

TARGET2144:
ba RET2144
nop


P2633: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P2634: !CAS [7] (maybe <- 0x1000168) (Int)
add %i1, 84, %l3
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

P2635: !CASX [11] (maybe <- 0x1000169) (Int)
add %i2, 64, %l3
ldx [%l3], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov  %o2, %o5
sllx %l4, 32, %o3
casx [%l3], %o5, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4

P2636: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P2637: !CAS [5] (maybe <- 0x100016a) (Int)
add %i1, 76, %l3
lduw [%l3], %o4
mov %o4, %o5
! move %o5(lower) -> %o4(upper)
sllx %o5, 32, %o4
mov %l4, %l7
cas [%l3], %o5, %l7
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

P2638: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P2639: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P2640: !ST [0] (maybe <- 0x100016b) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P2641: !REPLACEMENT [14] (Int) (Branch target of P2602)
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
ba P2642
nop

TARGET2602:
ba RET2602
nop


P2642: !CASX [15] (maybe <- 0x100016c) (Int)
add %i3, 192, %l7
ldx [%l7], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l6
sllx %l4, 32, %o1
casx [%l7], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P2643: !ST [14] (maybe <- 0x100016d) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P2644: !MEMBAR (Int)
membar #StoreLoad

P2645: !ST [12] (maybe <- 0x100016e) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P2646: !DWLD [4] (Int)
ldx [%i0 + 64], %o2
! move %o2(upper) -> %o2(upper)

P2647: !CASX [7] (maybe <- 0x100016f) (Int)
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

P2648: !ST [14] (maybe <- 0x1000171) (Int) (Branch target of P2706)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4
ba P2649
nop

TARGET2706:
ba RET2706
nop


P2649: !CASX [4] (maybe <- 0x1000172) (Int) (CBR)
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

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2649
nop
RET2649:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P2650: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P2651: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P2652: !ST [0] (maybe <- 0x1000173) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P2653: !CAS [14] (maybe <- 0x1000174) (Int)
add %i3, 128, %l6
lduw [%l6], %o5
mov %o5, %l3
! move %l3(lower) -> %o1(lower)
or %l3, %o1, %o1
mov %l4, %o2
cas [%l6], %l3, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P2654: !ST [4] (maybe <- 0x1000175) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P2655: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P2656: !DWST [0] (maybe <- 0x1000176) (Int)
sllx %l4, 32, %o5 
add   %l4, 1, %l4
or %o5, %l4, %o5
stx %o5, [%i0 + 0]
add   %l4, 1, %l4

P2657: !MEMBAR (Int)
membar #StoreLoad

P2658: !ST [9] (maybe <- 0x1000178) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P2659: !CASX [15] (maybe <- 0x1000179) (Int)
add %i3, 192, %l7
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

P2660: !MEMBAR (Int)
membar #StoreLoad

P2661: !ST [5] (maybe <- 0x100017a) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P2662: !MEMBAR (Int)
membar #StoreLoad

P2663: !MEMBAR (Int)
membar #StoreLoad

P2664: !DWST [2] (maybe <- 0x100017b) (Int)
mov %l4, %l3 
stx %l3, [%i0 + 8]
add   %l4, 1, %l4

P2665: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P2666: !CAS [9] (maybe <- 0x100017c) (Int)
add %i1, 512, %l3
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

P2667: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P2668: !CASX [7] (maybe <- 0x100017d) (Int)
add %i1, 80, %l3
ldx [%l3], %l7
! move %l7(upper) -> %o0(lower)
srlx %l7, 32, %o5
or %o5, %o0, %o0
! move %l7(lower) -> %o1(upper)
sllx %l7, 32, %o1
mov %l7, %o5
sllx %l4, 32, %l7
add  %l4, 1, %l4
or   %l4, %l7, %l7
casx [%l3], %o5, %l7
! move %l7(upper) -> %o1(lower)
srlx %l7, 32, %l3
or %l3, %o1, %o1
! move %l7(lower) -> %o2(upper)
sllx %l7, 32, %o2
add  %l4, 1, %l4

P2669: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P2670: !CASX [11] (maybe <- 0x100017f) (Int)
add %i2, 64, %l3
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

P2671: !ST [4] (maybe <- 0x1000180) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P2672: !CASX [14] (maybe <- 0x1000181) (Int)
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

P2673: !ST [14] (maybe <- 0x1000182) (Int) (LE)
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
stwa   %l7, [%i3 + 128] %asi
add   %l4, 1, %l4

P2674: !ST [3] (maybe <- 0x1000183) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P2675: !CASX [11] (maybe <- 0x1000184) (Int)
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

P2676: !ST [12] (maybe <- 0x1000185) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P2677: !CAS [10] (maybe <- 0x1000186) (Int) (CBR)
add %i2, 32, %l3
lduw [%l3], %l7
mov %l7, %o5
! move %o5(lower) -> %o3(lower)
or %o5, %o3, %o3
mov %l4, %o4
cas [%l3], %o5, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2677
nop
RET2677:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P2678: !ST [6] (maybe <- 0x1000187) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P2679: !ST [15] (maybe <- 0x1000188) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P2680: !LD [9] (Int) (LE)
wr %g0, 0x88, %asi
lduwa [%i1 + 512] %asi, %o5
! move %o5(lower) -> %o4(lower)
or %o5, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P2681: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P2682: !DWST [3] (maybe <- 0x1000189) (Int)
mov %l4, %l3 
sllx %l3, 32, %l3 
stx %l3, [%i0 + 32 ] 
add   %l4, 1, %l4

P2683: !ST [10] (maybe <- 0x100018a) (Int) (LE)
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
stwa   %o5, [%i2 + 32] %asi
add   %l4, 1, %l4

P2684: !ST [5] (maybe <- 0x100018b) (Int) (LE)
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
stwa   %l7, [%i1 + 76] %asi
add   %l4, 1, %l4

P2685: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P2686: !MEMBAR (Int)
membar #StoreLoad

P2687: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P2688: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P2689: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P2690: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P2691: !ST [3] (maybe <- 0x100018c) (Int) (LE)
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

P2692: !ST [11] (maybe <- 0x40800013) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i2 + 64 ]

P2693: !CASX [5] (maybe <- 0x100018d) (Int)
add %i1, 72, %l3
ldx [%l3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %o5
mov %l4, %o1
casx [%l3], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P2694: !ST [12] (maybe <- 0x100018e) (Int) (LE)
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

P2695: !PREFETCH [14] (Int) (CBR)
prefetch [%i3 + 128], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2695
nop
RET2695:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P2696: !ST [11] (maybe <- 0x100018f) (Int) (LE)
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
stwa   %o5, [%i2 + 64] %asi
add   %l4, 1, %l4

P2697: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P2698: !DWLD [8] (Int)
ldx [%i1 + 256], %o2
! move %o2(upper) -> %o2(upper)

P2699: !CAS [13] (maybe <- 0x1000190) (Int)
add %i3, 64, %l6
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

P2700: !CASX [5] (maybe <- 0x1000191) (Int)
add %i1, 72, %l6
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

P2701: !REPLACEMENT [6] (Int) (Branch target of P2331)
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
ba P2702
nop

TARGET2331:
ba RET2331
nop


P2702: !CASX [7] (maybe <- 0x1000192) (Int)
add %i1, 80, %l3
ldx [%l3], %l7
! move %l7(upper) -> %o0(lower)
srlx %l7, 32, %o5
or %o5, %o0, %o0
! move %l7(lower) -> %o1(upper)
sllx %l7, 32, %o1
mov %l7, %o5
sllx %l4, 32, %l7
add  %l4, 1, %l4
or   %l4, %l7, %l7
casx [%l3], %o5, %l7
! move %l7(upper) -> %o1(lower)
srlx %l7, 32, %l3
or %l3, %o1, %o1
! move %l7(lower) -> %o2(upper)
sllx %l7, 32, %o2
add  %l4, 1, %l4

P2703: !ST [13] (maybe <- 0x1000194) (Int) (CBR)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2703
nop
RET2703:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P2704: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P2705: !ST [11] (maybe <- 0x1000195) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P2706: !ST [10] (maybe <- 0x1000196) (Int) (CBR)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2706
nop
RET2706:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P2707: !PREFETCH [14] (Int) (CBR)
prefetch [%i3 + 128], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2707
nop
RET2707:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P2708: !ST [14] (maybe <- 0x1000197) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P2709: !ST [15] (maybe <- 0x1000198) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P2710: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P2711: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P2712: !MEMBAR (Int)
membar #StoreLoad

P2713: !LD [3] (Int) (CBR)
lduw [%i0 + 32], %l7
! move %l7(lower) -> %o2(lower)
or %l7, %o2, %o2

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2713
nop
RET2713:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P2714: !CAS [11] (maybe <- 0x1000199) (Int)
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

P2715: !ST [8] (maybe <- 0x100019a) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P2716: !REPLACEMENT [5] (Int) (CBR)
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
be,pn  %xcc, TARGET2716
nop
RET2716:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P2717: !CASX [1] (maybe <- 0x100019b) (Int) (Branch target of P2337)
add %i0, 0, %l3
ldx [%l3], %o4
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5
mov %o4, %o5
sllx %l4, 32, %o0
add  %l4, 1, %l4
or   %l4, %o0, %o0
casx [%l3], %o5, %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
add  %l4, 1, %l4
ba P2718
nop

TARGET2337:
ba RET2337
nop


P2718: !ST [8] (maybe <- 0x100019d) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P2719: !CAS [4] (maybe <- 0x100019e) (Int)
add %i0, 64, %o5
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

P2720: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P2721: !ST [2] (maybe <- 0x100019f) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P2722: !CASX [14] (maybe <- 0x10001a0) (Int)
add %i3, 128, %l7
ldx [%l7], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov  %o2, %l6
sllx %l4, 32, %o3
casx [%l7], %l6, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4

P2723: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P2724: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P2725: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P2726: !ST [8] (maybe <- 0x40800014) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i1 + 256 ]

P2727: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P2728: !PREFETCH [6] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i1 + 80] %asi, 1

P2729: !ST [10] (maybe <- 0x10001a1) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P2730: !ST [15] (maybe <- 0x10001a2) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P2731: !CASX [5] (maybe <- 0x10001a3) (Int)
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

P2732: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P2733: !ST [5] (maybe <- 0x10001a4) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P2734: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P2735: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P2736: !CAS [13] (maybe <- 0x10001a5) (Int)
add %i3, 64, %l7
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

P2737: !REPLACEMENT [7] (Int)
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

P2738: !ST [12] (maybe <- 0x10001a6) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P2739: !CAS [8] (maybe <- 0x10001a7) (Int) (Branch target of P2813)
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
ba P2740
nop

TARGET2813:
ba RET2813
nop


P2740: !CASX [14] (maybe <- 0x10001a8) (Int)
add %i3, 128, %l3
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

P2741: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P2742: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P2743: !CASX [11] (maybe <- 0x10001a9) (Int)
add %i2, 64, %l3
ldx [%l3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %o5
sllx %l4, 32, %o1
casx [%l3], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P2744: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P2745: !CAS [15] (maybe <- 0x10001aa) (Int) (LE)
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
add %i3, 192, %l3
lduwa [%l3] %asi, %o2
mov %o2, %o5
! move %o5(lower) -> %o2(upper)
sllx %o5, 32, %o2
mov %l6, %l7
casa [%l3] %asi, %o5, %l7
! move %l7(lower) -> %o2(lower)
srl %l7, 0, %l3
or %l3, %o2, %o2
add   %l4, 1, %l4

P2746: !ST [14] (maybe <- 0x10001ab) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P2747: !ST [7] (maybe <- 0x10001ac) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P2748: !LD [13] (Int)
lduw [%i3 + 64], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P2749: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P2750: !PREFETCH [11] (Int) (Branch target of P2386)
prefetch [%i2 + 64], 1
ba P2751
nop

TARGET2386:
ba RET2386
nop


P2751: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P2752: !DWLD [11] (Int)
ldx [%i2 + 64], %l3
! move %l3(upper) -> %o3(lower)
srlx %l3, 32, %o5
or %o5, %o3, %o3

P2753: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P2754: !ST [10] (maybe <- 0x10001ad) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P2755: !CASX [12] (maybe <- 0x10001ae) (Int)
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

P2756: !ST [7] (maybe <- 0x10001af) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P2757: !DWST [6] (maybe <- 0x10001b0) (Int)
sllx %l4, 32, %o5 
add   %l4, 1, %l4
or %o5, %l4, %o5
stx %o5, [%i1 + 80]
add   %l4, 1, %l4

P2758: !CASX [13] (maybe <- 0x10001b2) (Int)
add %i3, 64, %o5
ldx [%o5], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
mov  %o1, %l7
sllx %l4, 32, %o2
casx [%o5], %l7, %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
add  %l4, 1, %l4

P2759: !DWST [2] (maybe <- 0x10001b3) (Int) (Branch target of P2185)
mov %l4, %l7 
stx %l7, [%i0 + 8]
add   %l4, 1, %l4
ba P2760
nop

TARGET2185:
ba RET2185
nop


P2760: !REPLACEMENT [13] (Int)
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

P2761: !ST [13] (maybe <- 0x10001b4) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P2762: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P2763: !ST [9] (maybe <- 0x10001b5) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P2764: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P2765: !ST [10] (maybe <- 0x10001b6) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P2766: !CASX [9] (maybe <- 0x10001b7) (Int)
add %i1, 512, %l7
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

P2767: !ST [7] (maybe <- 0x10001b8) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P2768: !ST [1] (maybe <- 0x40800015) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i0 + 4 ]

P2769: !ST [2] (maybe <- 0x10001b9) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P2770: !CASX [13] (maybe <- 0x10001ba) (Int)
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

P2771: !CASX [9] (maybe <- 0x10001bb) (Int)
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

P2772: !CAS [4] (maybe <- 0x10001bc) (Int)
add %i0, 64, %o5
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

P2773: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P2774: !ST [3] (maybe <- 0x10001bd) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P2775: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P2776: !CASX [9] (maybe <- 0x10001be) (Int)
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

P2777: !ST [3] (maybe <- 0x40800016) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i0 + 32 ]

P2778: !ST [1] (maybe <- 0x10001bf) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P2779: !LD [3] (Int)
lduw [%i0 + 32], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P2780: !CASX [11] (maybe <- 0x10001c0) (Int) (CBR)
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

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2780
nop
RET2780:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P2781: !REPLACEMENT [9] (Int)
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

P2782: !REPLACEMENT [2] (Int)
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

P2783: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P2784: !ST [3] (maybe <- 0x10001c1) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P2785: !PREFETCH [0] (Int) (CBR)
prefetch [%i0 + 0], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2785
nop
RET2785:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P2786: !CAS [15] (maybe <- 0x10001c2) (Int)
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

P2787: !ST [4] (maybe <- 0x10001c3) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P2788: !CAS [12] (maybe <- 0x10001c4) (Int)
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

P2789: !ST [0] (maybe <- 0x40800017) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i0 + 0 ]

P2790: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P2791: !CASX [6] (maybe <- 0x10001c5) (Int)
add %i1, 80, %o5
ldx [%o5], %l6
! move %l6(upper) -> %o1(lower)
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

P2792: !ST [1] (maybe <- 0x10001c7) (Int) (Branch target of P2344)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4
ba P2793
nop

TARGET2344:
ba RET2344
nop


P2793: !ST [12] (maybe <- 0x10001c8) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P2794: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P2795: !MEMBAR (Int)
membar #StoreLoad

P2796: !ST [5] (maybe <- 0x10001c9) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P2797: !CASX [0] (maybe <- 0x10001ca) (Int)
add %i0, 0, %l3
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

P2798: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P2799: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P2800: !CASX [0] (maybe <- 0x10001cc) (Int)
add %i0, 0, %l3
ldx [%l3], %l7
! move %l7(upper) -> %o0(lower)
srlx %l7, 32, %o5
or %o5, %o0, %o0
! move %l7(lower) -> %o1(upper)
sllx %l7, 32, %o1
mov %l7, %o5
sllx %l4, 32, %l7
add  %l4, 1, %l4
or   %l4, %l7, %l7
casx [%l3], %o5, %l7
! move %l7(upper) -> %o1(lower)
srlx %l7, 32, %l3
or %l3, %o1, %o1
! move %l7(lower) -> %o2(upper)
sllx %l7, 32, %o2
add  %l4, 1, %l4

P2801: !ST [10] (maybe <- 0x10001ce) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P2802: !CASX [5] (maybe <- 0x10001cf) (Int) (Branch target of P2703)
add %i1, 72, %o5
ldx [%o5], %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l7
or %l7, %o2, %o2
! move %l6(lower) -> %o3(upper)
sllx %l6, 32, %o3
mov  %l6, %l7
mov %l4, %l6
casx [%o5], %l7, %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %o5
or %o5, %o3, %o3
! move %l6(lower) -> %o4(upper)
sllx %l6, 32, %o4
add  %l4, 1, %l4
ba P2803
nop

TARGET2703:
ba RET2703
nop


P2803: !CASX [2] (maybe <- 0x10001d0) (Int)
add %i0, 8, %o5
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
mov %l4, %l6
casx [%o5], %l7, %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %o5
or %o5, %o0, %o0
! move %l6(lower) -> %o1(upper)
sllx %l6, 32, %o1
add  %l4, 1, %l4

P2804: !ST [12] (maybe <- 0x10001d1) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P2805: !CASX [1] (maybe <- 0x10001d2) (Int)
add %i0, 0, %l7
ldx [%l7], %l3
! move %l3(upper) -> %o1(lower)
srlx %l3, 32, %l6
or %l6, %o1, %o1
! move %l3(lower) -> %o2(upper)
sllx %l3, 32, %o2
mov %l3, %l6
sllx %l4, 32, %l3
add  %l4, 1, %l4
or   %l4, %l3, %l3
casx [%l7], %l6, %l3
! move %l3(upper) -> %o2(lower)
srlx %l3, 32, %l7
or %l7, %o2, %o2
! move %l3(lower) -> %o3(upper)
sllx %l3, 32, %o3
add  %l4, 1, %l4

P2806: !REPLACEMENT [12] (Int)
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

P2807: !ST [3] (maybe <- 0x10001d4) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P2808: !ST [12] (maybe <- 0x10001d5) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P2809: !ST [0] (maybe <- 0x10001d6) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P2810: !ST [12] (maybe <- 0x10001d7) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P2811: !CASX [10] (maybe <- 0x10001d8) (Int)
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

P2812: !PREFETCH [6] (Int) (Branch target of P3044)
prefetch [%i1 + 80], 1
ba P2813
nop

TARGET3044:
ba RET3044
nop


P2813: !ST [11] (maybe <- 0x10001d9) (Int) (CBR)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2813
nop
RET2813:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P2814: !ST [11] (maybe <- 0x10001da) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P2815: !ST [8] (maybe <- 0x10001db) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P2816: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P2817: !ST [15] (maybe <- 0x10001dc) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P2818: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P2819: !ST [15] (maybe <- 0x40800018) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i3 + 192 ]

P2820: !CAS [12] (maybe <- 0x10001dd) (Int)
add %i3, 0, %l6
lduw [%l6], %o5
mov %o5, %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0
mov %l4, %o1
cas [%l6], %l3, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P2821: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P2822: !CAS [12] (maybe <- 0x10001de) (Int) (CBR)
add %i3, 0, %l6
lduw [%l6], %o5
mov %o5, %l3
! move %l3(lower) -> %o1(lower)
or %l3, %o1, %o1
mov %l4, %o2
cas [%l6], %l3, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2822
nop
RET2822:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P2823: !ST [13] (maybe <- 0x10001df) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P2824: !ST [1] (maybe <- 0x10001e0) (Int) (LE)
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
stwa   %l3, [%i0 + 4] %asi
add   %l4, 1, %l4

P2825: !ST [3] (maybe <- 0x10001e1) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P2826: !ST [3] (maybe <- 0x10001e2) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P2827: !DWST [9] (maybe <- 0x10001e3) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 512 ] 
add   %l4, 1, %l4

P2828: !CAS [11] (maybe <- 0x10001e4) (Int)
add %i2, 64, %l6
lduw [%l6], %o5
mov %o5, %l3
! move %l3(lower) -> %o2(lower)
or %l3, %o2, %o2
mov %l4, %o3
cas [%l6], %l3, %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P2829: !CASX [1] (maybe <- 0x10001e5) (Int)
add %i0, 0, %l6
ldx [%l6], %o5
! move %o5(upper) -> %o3(lower)
srlx %o5, 32, %l3
or %l3, %o3, %o3
! move %o5(lower) -> %o4(upper)
sllx %o5, 32, %o4
mov %o5, %l3
sllx %l4, 32, %o5
add  %l4, 1, %l4
or   %l4, %o5, %o5
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

P2830: !PREFETCH [1] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i0 + 4] %asi, 1

P2831: !MEMBAR (Int)
membar #StoreLoad

P2832: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P2833: !REPLACEMENT [8] (Int)
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

P2834: !ST [11] (maybe <- 0x10001e7) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P2835: !ST [11] (maybe <- 0x10001e8) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P2836: !ST [4] (maybe <- 0x10001e9) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P2837: !CASX [2] (maybe <- 0x10001ea) (Int)
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

P2838: !DWST [1] (maybe <- 0x10001eb) (Int)
sllx %l4, 32, %l3 
add   %l4, 1, %l4
or %l3, %l4, %l3
stx %l3, [%i0 + 0]
add   %l4, 1, %l4

P2839: !CASX [0] (maybe <- 0x10001ed) (Int)
add %i0, 0, %l3
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

P2840: !CAS [7] (maybe <- 0x10001ef) (Int)
add %i1, 84, %l3
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

P2841: !ST [8] (maybe <- 0x10001f0) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P2842: !ST [8] (maybe <- 0x10001f1) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P2843: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P2844: !REPLACEMENT [4] (Int)
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

P2845: !PREFETCH [2] (Int) (Branch target of P2677)
prefetch [%i0 + 12], 1
ba P2846
nop

TARGET2677:
ba RET2677
nop


P2846: !SWAP [4] (maybe <- 0x10001f2) (Int)
mov %l4, %l7
swap  [%i0 + 64], %l7
! move %l7(lower) -> %o0(lower)
srl %l7, 0, %l3
or %l3, %o0, %o0
add   %l4, 1, %l4

P2847: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P2848: !CASX [5] (maybe <- 0x10001f3) (Int)
add %i1, 72, %l3
ldx [%l3], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
mov  %o1, %o5
mov %l4, %o2
casx [%l3], %o5, %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
add  %l4, 1, %l4

P2849: !ST [8] (maybe <- 0x10001f4) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P2850: !ST [14] (maybe <- 0x10001f5) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P2851: !MEMBAR (Int)
membar #StoreLoad

P2852: !DWST [3] (maybe <- 0x40800019) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
std %f20, [%i0 + 32]

P2853: !LD [6] (Int)
lduw [%i1 + 80], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P2854: !DWST [5] (maybe <- 0x10001f6) (Int)
mov %l4, %l7 
stx %l7, [%i1 + 72]
add   %l4, 1, %l4

P2855: !CASX [8] (maybe <- 0x10001f7) (Int)
add %i1, 256, %l7
ldx [%l7], %l3
! move %l3(upper) -> %o3(lower)
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

P2856: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P2857: !ST [11] (maybe <- 0x10001f8) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P2858: !CAS [3] (maybe <- 0x10001f9) (Int) (CBR)
add %i0, 32, %l6
lduw [%l6], %o5
mov %o5, %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0
mov %l4, %o1
cas [%l6], %l3, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2858
nop
RET2858:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P2859: !CAS [11] (maybe <- 0x10001fa) (Int)
add %i2, 64, %l7
lduw [%l7], %l3
mov %l3, %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1
mov %l4, %o2
cas [%l7], %l6, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P2860: !ST [13] (maybe <- 0x10001fb) (Int) (Branch target of P2925)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4
ba P2861
nop

TARGET2925:
ba RET2925
nop


P2861: !CAS [0] (maybe <- 0x10001fc) (Int)
add %i0, 0, %l6
lduw [%l6], %o5
mov %o5, %l3
! move %l3(lower) -> %o2(lower)
or %l3, %o2, %o2
mov %l4, %o3
cas [%l6], %l3, %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P2862: !PREFETCH [1] (Int) (CBR)
prefetch [%i0 + 4], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2862
nop
RET2862:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P2863: !CASX [4] (maybe <- 0x10001fd) (Int) (LE)
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
add %i0, 64, %l7
ldxa [%l7] %asi, %l3
! move %l3(lower) -> %o3(lower)
srl %l3, 0, %l6
or %l6, %o3, %o3
! move %l3(upper) -> %o4(upper)
or %l3, %g0, %o4
mov  %l3, %l6
mov  %o5, %l3
casxa [%l7] %asi, %l6, %l3
! move %l3(lower) -> %o4(lower)
srlx %o4, 32, %o4
sllx %o4, 32, %o4
srl %l3, 0, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5
! move %l3(upper) -> %o0(upper)
or %l3, %g0, %o0
add  %l4, 1, %l4

P2864: !ST [11] (maybe <- 0x10001fe) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P2865: !CAS [12] (maybe <- 0x10001ff) (Int)
add %i3, 0, %l6
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

P2866: !ST [13] (maybe <- 0x1000200) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P2867: !CASX [7] (maybe <- 0x1000201) (Int)
add %i1, 80, %l3
ldx [%l3], %l7
! move %l7(upper) -> %o1(lower)
srlx %l7, 32, %o5
or %o5, %o1, %o1
! move %l7(lower) -> %o2(upper)
sllx %l7, 32, %o2
mov %l7, %o5
sllx %l4, 32, %l7
add  %l4, 1, %l4
or   %l4, %l7, %l7
casx [%l3], %o5, %l7
! move %l7(upper) -> %o2(lower)
srlx %l7, 32, %l3
or %l3, %o2, %o2
! move %l7(lower) -> %o3(upper)
sllx %l7, 32, %o3
add  %l4, 1, %l4

P2868: !CAS [9] (maybe <- 0x1000203) (Int)
add %i1, 512, %l3
lduw [%l3], %l7
mov %l7, %o5
! move %o5(lower) -> %o3(lower)
or %o5, %o3, %o3
mov %l4, %o4
cas [%l3], %o5, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P2869: !ST [5] (maybe <- 0x1000204) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P2870: !ST [7] (maybe <- 0x1000205) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P2871: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P2872: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P2873: !SWAP [10] (maybe <- 0x1000206) (Int)
mov %l4, %o5
swap  [%i2 + 32], %o5
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

P2874: !MEMBAR (Int)
membar #StoreLoad

P2875: !CASX [9] (maybe <- 0x1000207) (Int)
add %i1, 512, %l6
ldx [%l6], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l3
sllx %l4, 32, %o1
casx [%l6], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P2876: !CASX [13] (maybe <- 0x1000208) (Int) (LE)
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
add %i3, 64, %l6
ldxa [%l6] %asi, %o5
! move %o5(lower) -> %o2(upper)
sllx %o5, 32, %o2
! move %o5(upper) -> %o2(lower)
srlx %o5, 32, %l3
or %l3, %o2, %o2
mov  %o5, %l3
mov  %l7, %o5
casxa [%l6] %asi, %l3, %o5
! move %o5(lower) -> %o3(upper)
sllx %o5, 32, %o3
! move %o5(upper) -> %o3(lower)
srlx %o5, 32, %l6
or %l6, %o3, %o3
add  %l4, 1, %l4

P2877: !DWLD [2] (Int) (CBR)
ldx [%i0 + 8], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2877
nop
RET2877:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P2878: !CASX [1] (maybe <- 0x1000209) (Int)
add %i0, 0, %l3
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
mov %l7, %o5
sllx %l4, 32, %l7
add  %l4, 1, %l4
or   %l4, %l7, %l7
casx [%l3], %o5, %l7
! move %l7(upper) -> %o0(lower)
srlx %l7, 32, %l3
or %l3, %o0, %o0
! move %l7(lower) -> %o1(upper)
sllx %l7, 32, %o1
add  %l4, 1, %l4

P2879: !ST [10] (maybe <- 0x100020b) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P2880: !ST [15] (maybe <- 0x100020c) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P2881: !CAS [13] (maybe <- 0x100020d) (Int) (LE) (CBR)
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
add %i3, 64, %l7
lduwa [%l7] %asi, %l3
mov %l3, %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1
mov %o5, %o2
casa [%l7] %asi, %l6, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

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


P2882: !CASX [14] (maybe <- 0x100020e) (Int)
add %i3, 128, %o5
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

P2883: !ST [6] (maybe <- 0x100020f) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P2884: !ST [13] (maybe <- 0x1000210) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P2885: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P2886: !ST [10] (maybe <- 0x4080001a) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i2 + 32 ]

P2887: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P2888: !DWLD [0] (Int)
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

P2889: !MEMBAR (Int)
membar #StoreLoad

P2890: !ST [10] (maybe <- 0x1000211) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P2891: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P2892: !DWST [13] (maybe <- 0x1000212) (Int)
mov %l4, %l3 
sllx %l3, 32, %l3 
stx %l3, [%i3 + 64 ] 
add   %l4, 1, %l4

P2893: !ST [15] (maybe <- 0x1000213) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P2894: !ST [10] (maybe <- 0x1000214) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P2895: !ST [9] (maybe <- 0x4080001b) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i1 + 512 ]

P2896: !ST [12] (maybe <- 0x1000215) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P2897: !ST [11] (maybe <- 0x4080001c) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i2 + 64 ]

P2898: !ST [2] (maybe <- 0x1000216) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P2899: !ST [11] (maybe <- 0x4080001d) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i2 + 64 ]

P2900: !CAS [1] (maybe <- 0x1000217) (Int)
add %i0, 4, %l6
lduw [%l6], %o5
mov %o5, %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0
mov %l4, %o1
cas [%l6], %l3, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P2901: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P2902: !ST [4] (maybe <- 0x1000218) (Int) (LE)
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
stwa   %l3, [%i0 + 64] %asi
add   %l4, 1, %l4

P2903: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P2904: !CASX [14] (maybe <- 0x1000219) (Int)
add %i3, 128, %l3
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

P2905: !DWST [15] (maybe <- 0x100021a) (Int)
mov %l4, %o5 
sllx %o5, 32, %o5 
stx %o5, [%i3 + 192 ] 
add   %l4, 1, %l4

P2906: !ST [10] (maybe <- 0x100021b) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P2907: !CASX [4] (maybe <- 0x100021c) (Int)
add %i0, 64, %l7
ldx [%l7], %l3
! move %l3(upper) -> %o3(lower)
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

P2908: !PREFETCH [7] (Int) (Branch target of P2266)
prefetch [%i1 + 84], 1
ba P2909
nop

TARGET2266:
ba RET2266
nop


P2909: !CAS [0] (maybe <- 0x100021d) (Int) (CBR)
add %i0, 0, %l7
lduw [%l7], %l3
mov %l3, %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0
mov %l4, %o1
cas [%l7], %l6, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2909
nop
RET2909:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P2910: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P2911: !ST [1] (maybe <- 0x100021e) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P2912: !CAS [14] (maybe <- 0x100021f) (Int)
add %i3, 128, %l7
lduw [%l7], %l3
mov %l3, %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1
mov %l4, %o2
cas [%l7], %l6, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P2913: !CASX [0] (maybe <- 0x1000220) (Int)
add %i0, 0, %l7
ldx [%l7], %l3
! move %l3(upper) -> %o2(lower)
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

P2914: !SWAP [8] (maybe <- 0x1000222) (Int)
mov %l4, %o5
swap  [%i1 + 256], %o5
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

P2915: !CAS [10] (maybe <- 0x1000223) (Int)
add %i2, 32, %l6
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

P2916: !ST [12] (maybe <- 0x1000224) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P2917: !DWLD [7] (Int) (Branch target of P2208)
ldx [%i1 + 80], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
ba P2918
nop

TARGET2208:
ba RET2208
nop


P2918: !CASX [6] (maybe <- 0x1000225) (Int)
add %i1, 80, %l7
ldx [%l7], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov %o2, %l6
sllx %l4, 32, %o3
add  %l4, 1, %l4
or   %l4, %o3, %o3
casx [%l7], %l6, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4

P2919: !CAS [9] (maybe <- 0x1000227) (Int)
add %i1, 512, %l7
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

P2920: !CAS [14] (maybe <- 0x1000228) (Int)
add %i3, 128, %l7
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

P2921: !CASX [9] (maybe <- 0x1000229) (Int)
add %i1, 512, %l7
ldx [%l7], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
mov  %o1, %l6
sllx %l4, 32, %o2
casx [%l7], %l6, %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
add  %l4, 1, %l4

P2922: !ST [15] (maybe <- 0x100022a) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P2923: !ST [4] (maybe <- 0x100022b) (Int) (Branch target of P2130)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4
ba P2924
nop

TARGET2130:
ba RET2130
nop


P2924: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P2925: !ST [11] (maybe <- 0x100022c) (Int) (CBR) (Branch target of P2166)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2925
nop
RET2925:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0

ba P2926
nop

TARGET2166:
ba RET2166
nop


P2926: !REPLACEMENT [4] (Int)
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

P2927: !LD [7] (Int)
lduw [%i1 + 84], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P2928: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P2929: !MEMBAR (Int)
membar #StoreLoad

P2930: !CAS [2] (maybe <- 0x100022d) (Int) (LE)
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
add %i0, 12, %l6
lduwa [%l6] %asi, %o5
mov %o5, %l3
! move %l3(lower) -> %o3(lower)
or %l3, %o3, %o3
mov %l7, %o4
casa [%l6] %asi, %l3, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P2931: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P2932: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P2933: !ST [8] (maybe <- 0x100022e) (Int) (Branch target of P2649)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4
ba P2934
nop

TARGET2649:
ba RET2649
nop


P2934: !CAS [4] (maybe <- 0x100022f) (Int)
add %i0, 64, %l3
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

P2935: !ST [7] (maybe <- 0x1000230) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P2936: !ST [3] (maybe <- 0x1000231) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P2937: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P2938: !DWLD [8] (FP)
ldd [%i1 + 256], %f18
! 1 addresses covered
fmovs %f18, %f1

P2939: !CASX [5] (maybe <- 0x1000232) (Int)
add %i1, 72, %l7
ldx [%l7], %l3
! move %l3(upper) -> %o0(lower)
srlx %l3, 32, %l6
or %l6, %o0, %o0
! move %l3(lower) -> %o1(upper)
sllx %l3, 32, %o1
mov  %l3, %l6
mov %l4, %l3
casx [%l7], %l6, %l3
! move %l3(upper) -> %o1(lower)
srlx %l3, 32, %l7
or %l7, %o1, %o1
! move %l3(lower) -> %o2(upper)
sllx %l3, 32, %o2
add  %l4, 1, %l4

P2940: !DWST [1] (maybe <- 0x1000233) (Int)
sllx %l4, 32, %l6 
add   %l4, 1, %l4
or %l6, %l4, %l6
stx %l6, [%i0 + 0]
add   %l4, 1, %l4

P2941: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P2942: !DWLD [4] (Int) (LE) (CBR)
wr %g0, 0x88, %asi
ldxa [%i0 + 64] %asi, %l6
! move %l6(lower) -> %o2(lower)
srl %l6, 0, %l3
or %l3, %o2, %o2

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2942
nop
RET2942:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P2943: !CASX [11] (maybe <- 0x1000235) (Int)
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

P2944: !DWLD [10] (Int)
ldx [%i2 + 32], %o0
! move %o0(upper) -> %o0(upper)

P2945: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P2946: !ST [2] (maybe <- 0x1000236) (Int) (Branch target of P2540)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4
ba P2947
nop

TARGET2540:
ba RET2540
nop


P2947: !ST [4] (maybe <- 0x1000237) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P2948: !PREFETCH [8] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i1 + 256] %asi, 1

P2949: !PREFETCH [15] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i3 + 192] %asi, 1

P2950: !ST [5] (maybe <- 0x1000238) (Int) (LE)
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
stwa   %o5, [%i1 + 76] %asi
add   %l4, 1, %l4

P2951: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P2952: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P2953: !ST [8] (maybe <- 0x1000239) (Int) (CBR)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2953
nop
RET2953:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P2954: !CAS [11] (maybe <- 0x100023a) (Int)
add %i2, 64, %o5
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

P2955: !CASX [14] (maybe <- 0x100023b) (Int)
add %i3, 128, %o5
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

P2956: !CAS [2] (maybe <- 0x100023c) (Int)
add %i0, 12, %o5
lduw [%o5], %l6
mov %l6, %l7
! move %l7(lower) -> %o3(lower)
or %l7, %o3, %o3
mov %l4, %o4
cas [%o5], %l7, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P2957: !ST [13] (maybe <- 0x100023d) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P2958: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P2959: !CAS [7] (maybe <- 0x100023e) (Int)
add %i1, 84, %l7
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

P2960: !CAS [0] (maybe <- 0x100023f) (Int)
add %i0, 0, %l7
lduw [%l7], %l3
mov %l3, %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0
mov %l4, %o1
cas [%l7], %l6, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P2961: !ST [9] (maybe <- 0x1000240) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P2962: !PREFETCH [14] (Int) (CBR)
prefetch [%i3 + 128], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2962
nop
RET2962:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P2963: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P2964: !PREFETCH [10] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i2 + 32] %asi, 1

P2965: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P2966: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P2967: !ST [6] (maybe <- 0x1000241) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P2968: !PREFETCH [15] (Int) (CBR)
prefetch [%i3 + 192], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2968
nop
RET2968:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P2969: !CAS [7] (maybe <- 0x1000242) (Int)
add %i1, 84, %l7
lduw [%l7], %l3
mov %l3, %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1
mov %l4, %o2
cas [%l7], %l6, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P2970: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P2971: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P2972: !PREFETCH [12] (Int) (Branch target of P2542)
prefetch [%i3 + 0], 1
ba P2973
nop

TARGET2542:
ba RET2542
nop


P2973: !ST [11] (maybe <- 0x1000243) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P2974: !ST [5] (maybe <- 0x1000244) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P2975: !CAS [0] (maybe <- 0x1000245) (Int)
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

P2976: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P2977: !CAS [0] (maybe <- 0x1000246) (Int)
add %i0, 0, %l3
lduw [%l3], %l7
mov %l7, %o5
! move %o5(lower) -> %o3(lower)
or %o5, %o3, %o3
mov %l4, %o4
cas [%l3], %o5, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P2978: !ST [10] (maybe <- 0x1000247) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P2979: !ST [3] (maybe <- 0x1000248) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P2980: !MEMBAR (Int) (Branch target of P2290)
membar #StoreLoad
ba P2981
nop

TARGET2290:
ba RET2290
nop


P2981: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P2982: !DWST [13] (maybe <- 0x1000249) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 64 ] 
add   %l4, 1, %l4

P2983: !CAS [9] (maybe <- 0x100024a) (Int)
add %i1, 512, %l6
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

P2984: !DWST [1] (maybe <- 0x4080001e) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=21 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
std %f20, [%i0 + 0]

P2985: !ST [15] (maybe <- 0x100024b) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P2986: !CAS [14] (maybe <- 0x100024c) (Int)
add %i3, 128, %o5
lduw [%o5], %l6
mov %l6, %l7
! move %l7(lower) -> %o0(lower)
or %l7, %o0, %o0
mov %l4, %o1
cas [%o5], %l7, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P2987: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P2988: !CASX [5] (maybe <- 0x100024d) (Int)
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

P2989: !CASX [8] (maybe <- 0x100024e) (Int)
add %i1, 256, %o5
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

P2990: !PREFETCH [2] (Int) (Branch target of P2942)
prefetch [%i0 + 12], 1
ba P2991
nop

TARGET2942:
ba RET2942
nop


P2991: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P2992: !ST [10] (maybe <- 0x100024f) (Int) (LE)
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
stwa   %l7, [%i2 + 32] %asi
add   %l4, 1, %l4

P2993: !PREFETCH [14] (Int) (CBR)
prefetch [%i3 + 128], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2993
nop
RET2993:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P2994: !REPLACEMENT [14] (Int)
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

P2995: !NOP (Int)
nop

P2996: !ST [11] (maybe <- 0x1000250) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P2997: !PREFETCH [14] (Int) (Branch target of P2419)
prefetch [%i3 + 128], 1
ba P2998
nop

TARGET2419:
ba RET2419
nop


P2998: !CAS [15] (maybe <- 0x1000251) (Int)
add %i3, 192, %l6
lduw [%l6], %o5
mov %o5, %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0
mov %l4, %o1
cas [%l6], %l3, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P2999: !DWLD [8] (FP)
ldd [%i1 + 256], %f2
! 1 addresses covered

P3000: !ST [10] (maybe <- 0x1000252) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P3001: !CASX [5] (maybe <- 0x1000253) (Int) (Branch target of P2363)
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
ba P3002
nop

TARGET2363:
ba RET2363
nop


P3002: !ST [1] (maybe <- 0x1000254) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P3003: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P3004: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P3005: !MEMBAR (Int)
membar #StoreLoad

P3006: !CASX [11] (maybe <- 0x1000255) (Int)
add %i2, 64, %o5
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

P3007: !CAS [8] (maybe <- 0x1000256) (Int)
add %i1, 256, %o5
lduw [%o5], %l6
mov %l6, %l7
! move %l7(lower) -> %o0(lower)
or %l7, %o0, %o0
mov %l4, %o1
cas [%o5], %l7, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P3008: !CASX [11] (maybe <- 0x1000257) (Int)
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

P3009: !LD [2] (Int)
lduw [%i0 + 12], %o5
! move %o5(lower) -> %o3(lower)
or %o5, %o3, %o3

P3010: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P3011: !DWST [7] (maybe <- 0x1000258) (Int)
sllx %l4, 32, %l3 
add   %l4, 1, %l4
or %l3, %l4, %l3
stx %l3, [%i1 + 80]
add   %l4, 1, %l4

P3012: !ST [14] (maybe <- 0x100025a) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P3013: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P3014: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P3015: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P3016: !DWLD [4] (Int)
ldx [%i0 + 64], %o4
! move %o4(upper) -> %o4(upper)

P3017: !CASX [13] (maybe <- 0x100025b) (Int)
add %i3, 64, %l6
ldx [%l6], %o5
! move %o5(upper) -> %o4(lower)
srlx %o4, 32, %o4
sllx %o4, 32, %o4
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

P3018: !CAS [14] (maybe <- 0x100025c) (Int)
add %i3, 128, %l6
lduw [%l6], %o5
mov %o5, %l3
! move %l3(lower) -> %o1(lower)
or %l3, %o1, %o1
mov %l4, %o2
cas [%l6], %l3, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P3019: !CASX [15] (maybe <- 0x100025d) (Int) (Branch target of P2399)
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
ba P3020
nop

TARGET2399:
ba RET2399
nop


P3020: !CASX [3] (maybe <- 0x100025e) (Int)
add %i0, 32, %l6
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

P3021: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P3022: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P3023: !ST [13] (maybe <- 0x100025f) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P3024: !PREFETCH [10] (Int) (Branch target of P2695)
prefetch [%i2 + 32], 1
ba P3025
nop

TARGET2695:
ba RET2695
nop


P3025: !ST [6] (maybe <- 0x1000260) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P3026: !CAS [8] (maybe <- 0x1000261) (Int)
add %i1, 256, %o5
lduw [%o5], %l6
mov %l6, %l7
! move %l7(lower) -> %o1(lower)
or %l7, %o1, %o1
mov %l4, %o2
cas [%o5], %l7, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P3027: !ST [14] (maybe <- 0x1000262) (Int) (Branch target of P2785)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4
ba P3028
nop

TARGET2785:
ba RET2785
nop


P3028: !CASX [15] (maybe <- 0x1000263) (Int) (LE)
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
add %i3, 192, %l7
ldxa [%l7] %asi, %l3
! move %l3(lower) -> %o2(lower)
srl %l3, 0, %l6
or %l6, %o2, %o2
! move %l3(upper) -> %o3(upper)
or %l3, %g0, %o3
mov  %l3, %l6
mov  %o5, %l3
casxa [%l7] %asi, %l6, %l3
! move %l3(lower) -> %o3(lower)
srlx %o3, 32, %o3
sllx %o3, 32, %o3
srl %l3, 0, %l7
or %l7, %o3, %o3
! move %l3(upper) -> %o4(upper)
or %l3, %g0, %o4
add  %l4, 1, %l4

P3029: !CAS [11] (maybe <- 0x1000264) (Int)
add %i2, 64, %l7
lduw [%l7], %l3
mov %l3, %l6
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
mov %l4, %o0
cas [%l7], %l6, %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
add   %l4, 1, %l4

P3030: !CASX [1] (maybe <- 0x1000265) (Int) (Branch target of P2993)
add %i0, 0, %l7
ldx [%l7], %l3
! move %l3(upper) -> %o0(lower)
srlx %l3, 32, %l6
or %l6, %o0, %o0
! move %l3(lower) -> %o1(upper)
sllx %l3, 32, %o1
mov %l3, %l6
sllx %l4, 32, %l3
add  %l4, 1, %l4
or   %l4, %l3, %l3
casx [%l7], %l6, %l3
! move %l3(upper) -> %o1(lower)
srlx %l3, 32, %l7
or %l7, %o1, %o1
! move %l3(lower) -> %o2(upper)
sllx %l3, 32, %o2
add  %l4, 1, %l4
ba P3031
nop

TARGET2993:
ba RET2993
nop


P3031: !CAS [1] (maybe <- 0x1000267) (Int) (Branch target of P2414)
add %i0, 4, %l7
lduw [%l7], %l3
mov %l3, %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2
mov %l4, %o3
cas [%l7], %l6, %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4
ba P3032
nop

TARGET2414:
ba RET2414
nop


P3032: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P3033: !REPLACEMENT [2] (Int)
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

P3034: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P3035: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P3036: !ST [1] (maybe <- 0x1000268) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P3037: !CASX [13] (maybe <- 0x1000269) (Int) (LE)
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
add %i3, 64, %l3
ldxa [%l3] %asi, %l7
! move %l7(lower) -> %o3(lower)
srl %l7, 0, %o5
or %o5, %o3, %o3
! move %l7(upper) -> %o4(upper)
or %l7, %g0, %o4
mov  %l7, %o5
mov  %l6, %l7
casxa [%l3] %asi, %o5, %l7
! move %l7(lower) -> %o4(lower)
srlx %o4, 32, %o4
sllx %o4, 32, %o4
srl %l7, 0, %l3
or %l3, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5
! move %l7(upper) -> %o0(upper)
or %l7, %g0, %o0
add  %l4, 1, %l4

P3038: !CASX [0] (maybe <- 0x100026a) (Int)
add %i0, 0, %l3
ldx [%l3], %l7
! move %l7(upper) -> %o0(lower)
srlx %o0, 32, %o0
sllx %o0, 32, %o0
srlx %l7, 32, %o5
or %o5, %o0, %o0
! move %l7(lower) -> %o1(upper)
sllx %l7, 32, %o1
mov %l7, %o5
sllx %l4, 32, %l7
add  %l4, 1, %l4
or   %l4, %l7, %l7
casx [%l3], %o5, %l7
! move %l7(upper) -> %o1(lower)
srlx %l7, 32, %l3
or %l3, %o1, %o1
! move %l7(lower) -> %o2(upper)
sllx %l7, 32, %o2
add  %l4, 1, %l4

P3039: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P3040: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P3041: !PREFETCH [7] (Int) (CBR)
prefetch [%i1 + 84], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3041
nop
RET3041:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P3042: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P3043: !CASX [8] (maybe <- 0x100026c) (Int)
add %i1, 256, %l6
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

P3044: !CASX [15] (maybe <- 0x100026d) (Int) (CBR)
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

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3044
nop
RET3044:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P3045: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P3046: !CASX [8] (maybe <- 0x100026e) (Int)
add %i1, 256, %l7
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

P3047: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P3048: !ST [1] (maybe <- 0x100026f) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P3049: !ST [3] (maybe <- 0x1000270) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P3050: !CASX [2] (maybe <- 0x1000271) (Int)
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

P3051: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P3052: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P3053: !ST [10] (maybe <- 0x1000272) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P3054: !MEMBAR (Int)
membar #StoreLoad

P3055: !LD [0] (FP)
ld [%i0 + 0], %f3
! 1 addresses covered

P3056: !LD [1] (FP)
ld [%i0 + 4], %f4
! 1 addresses covered

P3057: !LD [2] (Int)
lduw [%i0 + 12], %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0

P3058: !LD [3] (Int)
lduw [%i0 + 32], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P3059: !LD [4] (FP)
ld [%i0 + 64], %f5
! 1 addresses covered

P3060: !LD [5] (Int) (LE)
wr %g0, 0x88, %asi
lduwa [%i1 + 76] %asi, %o5
! move %o5(lower) -> %o1(lower)
or %o5, %o1, %o1

P3061: !LD [6] (Int)
lduw [%i1 + 80], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P3062: !LD [7] (Int) (LE)
wr %g0, 0x88, %asi
lduwa [%i1 + 84] %asi, %o5
! move %o5(lower) -> %o2(lower)
or %o5, %o2, %o2

P3063: !LD [8] (Int)
lduw [%i1 + 256], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P3064: !LD [9] (FP)
ld [%i1 + 512], %f6
! 1 addresses covered

P3065: !LD [10] (Int) (CBR)
lduw [%i2 + 32], %o5
! move %o5(lower) -> %o3(lower)
or %o5, %o3, %o3

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3065
nop
RET3065:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P3066: !LD [11] (Int) (CBR)
lduw [%i2 + 64], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3066
nop
RET3066:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P3067: !LD [12] (Int)
lduw [%i3 + 0], %l6
! move %l6(lower) -> %o4(lower)
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P3068: !LD [13] (Int)
lduw [%i3 + 64], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P3069: !LD [14] (Int)
lduw [%i3 + 128], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

P3070: !LD [15] (Int) (CBR)
lduw [%i3 + 192], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3070
nop
RET3070:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


END_NODES2: ! Test istream for CPU 2 ends
sethi %hi(0xdead0e0f), %l6
or    %l6, %lo(0xdead0e0f), %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1
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
! 1000 (dynamic) instruction sequence begins
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
sethi %hi(0x03deade1), %l3
or    %l3, %lo(0x03deade1), %l3
stw %l3, [%i5] 
ld [%i5], %f16

! Initialize running integer counter in register %l4
sethi %hi(0x1800001), %l4
or    %l4, %lo(0x1800001), %l4

! Initialize running FP counter in register %f16
sethi %hi(0x41000001), %l3
or    %l3, %lo(0x41000001), %l3
stw %l3, [%i5] 
ld [%i5], %f16

! Initialize FP counter increment value in register %f17 (constant)
sethi %hi(0x35800000), %l3
or    %l3, %lo(0x35800000), %l3
stw %l3, [%i5] 
ld [%i5], %f17 

! Initialize LFSR to 0x6a00^4
sethi %hi(0x6a00), %l0
or    %l0, %lo(0x6a00), %l0
mulx  %l0, %l0, %l0
mulx  %l0, %l0, %l0

!-- init shared addrs 6 to 7 ---
stx %g0, [%i1+80]

! use untouched cache-line (offset 4K) in replacement area for sync
sub %i1, %i0, %l6
add %i3, %l6, %l6
sub %l6, -4096, %l6

!-- begin of sync_init ---
or %g0, 1, %l7
or %g0, %l7, %o5
swap [%l6+4], %o5
membar #Sync
sync_init_1_3:
brnz,pt %l7, sync_init_1_3
lduw [%l6+4], %l7 ! delay slot
sync_init_2_3:
lduw [%l6], %l7
sub %l7, 1, %o5
cas [%l6], %l7, %o5
cmp %l7, %o5
bne,pt %xcc, sync_init_2_3
nop
membar #Sync
sync_init_3_3:
lduw [%l6], %l7 ! delay slot
brnz,pt %l7, sync_init_3_3
nop
!-- end of sync_init ---


BEGIN_NODES3: ! Test istream for CPU 3 begins

P3071: !REPLACEMENT [4] (Int)
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

P3072: !ST [6] (maybe <- 0x1800001) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P3073: !SWAP [4] (maybe <- 0x1800002) (Int)
mov %l4, %o0
swap  [%i0 + 64], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
add   %l4, 1, %l4

P3074: !CASX [10] (maybe <- 0x1800003) (Int) (LE)
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
add %i2, 32, %l7
ldxa [%l7] %asi, %l3
! move %l3(lower) -> %o0(lower)
srl %l3, 0, %l6
or %l6, %o0, %o0
! move %l3(upper) -> %o1(upper)
or %l3, %g0, %o1
mov  %l3, %l6
mov  %o5, %l3
casxa [%l7] %asi, %l6, %l3
! move %l3(lower) -> %o1(lower)
srlx %o1, 32, %o1
sllx %o1, 32, %o1
srl %l3, 0, %l7
or %l7, %o1, %o1
! move %l3(upper) -> %o2(upper)
or %l3, %g0, %o2
add  %l4, 1, %l4

P3075: !ST [9] (maybe <- 0x1800004) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P3076: !CASX [12] (maybe <- 0x1800005) (Int)
add %i3, 0, %l6
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

P3077: !ST [1] (maybe <- 0x1800006) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P3078: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P3079: !ST [11] (maybe <- 0x1800007) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P3080: !ST [5] (maybe <- 0x1800008) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P3081: !ST [12] (maybe <- 0x41000001) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i3 + 0 ]

P3082: !ST [3] (maybe <- 0x41000002) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i0 + 32 ]

P3083: !ST [14] (maybe <- 0x1800009) (Int) (CBR)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3083
nop
RET3083:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P3084: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P3085: !ST [10] (maybe <- 0x180000a) (Int) (CBR)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3085
nop
RET3085:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P3086: !MEMBAR (Int)
membar #StoreLoad

P3087: !CAS [10] (maybe <- 0x180000b) (Int)
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

P3088: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P3089: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P3090: !ST [14] (maybe <- 0x180000c) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P3091: !ST [11] (maybe <- 0x180000d) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P3092: !ST [11] (maybe <- 0x180000e) (Int) (LE)
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

P3093: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P3094: !ST [6] (maybe <- 0x180000f) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P3095: !ST [1] (maybe <- 0x41000003) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i0 + 4 ]

P3096: !ST [3] (maybe <- 0x1800010) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P3097: !CAS [6] (maybe <- 0x1800011) (Int)
add %i1, 80, %l7
lduw [%l7], %l3
mov %l3, %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0
mov %l4, %o1
cas [%l7], %l6, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P3098: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P3099: !CAS [8] (maybe <- 0x1800012) (Int)
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

P3100: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P3101: !CASX [9] (maybe <- 0x1800013) (Int)
add %i1, 512, %l7
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

P3102: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P3103: !CAS [8] (maybe <- 0x1800014) (Int)
add %i1, 256, %l7
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

P3104: !PREFETCH [3] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i0 + 32] %asi, 1

P3105: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P3106: !ST [8] (maybe <- 0x1800015) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P3107: !ST [2] (maybe <- 0x1800016) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P3108: !ST [11] (maybe <- 0x1800017) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P3109: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P3110: !ST [11] (maybe <- 0x1800018) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P3111: !ST [7] (maybe <- 0x1800019) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P3112: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P3113: !CASX [7] (maybe <- 0x180001a) (Int)
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

P3114: !ST [1] (maybe <- 0x180001c) (Int) (CBR)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3114
nop
RET3114:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P3115: !CASX [10] (maybe <- 0x180001d) (Int) (CBR) (Branch target of P3115)
add %i2, 32, %l6
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

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3115
nop
RET3115:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0

ba P3116
nop

TARGET3115:
ba RET3115
nop


P3116: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P3117: !ST [11] (maybe <- 0x180001e) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P3118: !DWST [4] (maybe <- 0x180001f) (Int)
mov %l4, %l3 
sllx %l3, 32, %l3 
stx %l3, [%i0 + 64 ] 
add   %l4, 1, %l4

P3119: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P3120: !ST [2] (maybe <- 0x1800020) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P3121: !CAS [11] (maybe <- 0x1800021) (Int)
add %i2, 64, %o5
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

P3122: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P3123: !CASX [0] (maybe <- 0x1800022) (Int)
add %i0, 0, %o5
ldx [%o5], %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l7
or %l7, %o0, %o0
! move %l6(lower) -> %o1(upper)
sllx %l6, 32, %o1
mov %l6, %l7
sllx %l4, 32, %l6
add  %l4, 1, %l4
or   %l4, %l6, %l6
casx [%o5], %l7, %l6
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %o5
or %o5, %o1, %o1
! move %l6(lower) -> %o2(upper)
sllx %l6, 32, %o2
add  %l4, 1, %l4

P3124: !ST [7] (maybe <- 0x1800024) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P3125: !ST [0] (maybe <- 0x1800025) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P3126: !CASX [11] (maybe <- 0x1800026) (Int)
add %i2, 64, %l6
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

P3127: !ST [9] (maybe <- 0x1800027) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P3128: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P3129: !LD [8] (Int)
lduw [%i1 + 256], %l3
! move %l3(lower) -> %o4(lower)
or %l3, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P3130: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P3131: !ST [7] (maybe <- 0x1800028) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P3132: !CASX [8] (maybe <- 0x1800029) (Int)
add %i1, 256, %l6
ldx [%l6], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l3
sllx %l4, 32, %o1
casx [%l6], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P3133: !ST [12] (maybe <- 0x41000004) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i3 + 0 ]

P3134: !CASX [0] (maybe <- 0x180002a) (Int)
add %i0, 0, %l3
ldx [%l3], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov %o2, %o5
sllx %l4, 32, %o3
add  %l4, 1, %l4
or   %l4, %o3, %o3
casx [%l3], %o5, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4

P3135: !DWLD [6] (Int)
ldx [%i1 + 80], %o4
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P3136: !ST [1] (maybe <- 0x180002c) (Int) (CBR)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3136
nop
RET3136:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P3137: !DWLD [2] (Int)
ldx [%i0 + 8], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P3138: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P3139: !CAS [7] (maybe <- 0x180002d) (Int) (LE)
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
add %i1, 84, %l3
lduwa [%l3] %asi, %l7
mov %l7, %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0
mov %l6, %o1
casa [%l3] %asi, %o5, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P3140: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P3141: !MEMBAR (Int)
membar #StoreLoad

P3142: !CASX [1] (maybe <- 0x180002e) (Int)
add %i0, 0, %l3
ldx [%l3], %l7
! move %l7(upper) -> %o1(lower)
srlx %l7, 32, %o5
or %o5, %o1, %o1
! move %l7(lower) -> %o2(upper)
sllx %l7, 32, %o2
mov %l7, %o5
sllx %l4, 32, %l7
add  %l4, 1, %l4
or   %l4, %l7, %l7
casx [%l3], %o5, %l7
! move %l7(upper) -> %o2(lower)
srlx %l7, 32, %l3
or %l3, %o2, %o2
! move %l7(lower) -> %o3(upper)
sllx %l7, 32, %o3
add  %l4, 1, %l4

P3143: !ST [11] (maybe <- 0x41000005) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i2 + 64 ]

P3144: !CAS [15] (maybe <- 0x1800030) (Int)
add %i3, 192, %o5
lduw [%o5], %l6
mov %l6, %l7
! move %l7(lower) -> %o3(lower)
or %l7, %o3, %o3
mov %l4, %o4
cas [%o5], %l7, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P3145: !CASX [14] (maybe <- 0x1800031) (Int)
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

P3146: !ST [11] (maybe <- 0x41000006) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i2 + 64 ]

P3147: !ST [0] (maybe <- 0x1800032) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P3148: !ST [4] (maybe <- 0x1800033) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P3149: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P3150: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P3151: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P3152: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P3153: !CAS [15] (maybe <- 0x1800034) (Int)
add %i3, 192, %l3
lduw [%l3], %l7
mov %l7, %o5
! move %o5(lower) -> %o1(lower)
or %o5, %o1, %o1
mov %l4, %o2
cas [%l3], %o5, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P3154: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P3155: !CAS [12] (maybe <- 0x1800035) (Int)
add %i3, 0, %l3
lduw [%l3], %l7
mov %l7, %o5
! move %o5(lower) -> %o2(lower)
or %o5, %o2, %o2
mov %l4, %o3
cas [%l3], %o5, %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P3156: !ST [14] (maybe <- 0x1800036) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P3157: !CASX [11] (maybe <- 0x1800037) (Int)
add %i2, 64, %o5
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

P3158: !ST [4] (maybe <- 0x1800038) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P3159: !ST [5] (maybe <- 0x1800039) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P3160: !DWLD [12] (Int)
ldx [%i3 + 0], %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l3
or %l3, %o0, %o0

P3161: !CASX [9] (maybe <- 0x180003a) (Int) (CBR)
add %i1, 512, %o5
ldx [%o5], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
mov  %o1, %l7
sllx %l4, 32, %o2
casx [%o5], %l7, %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
add  %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3161
nop
RET3161:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P3162: !CAS [8] (maybe <- 0x180003b) (Int)
add %i1, 256, %l3
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

P3163: !CASX [11] (maybe <- 0x180003c) (Int) (Branch target of P3473)
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
ba P3164
nop

TARGET3473:
ba RET3473
nop


P3164: !ST [2] (maybe <- 0x180003d) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P3165: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P3166: !CASX [6] (maybe <- 0x180003e) (Int)
add %i1, 80, %o5
ldx [%o5], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
mov %o1, %l7
sllx %l4, 32, %o2
add  %l4, 1, %l4
or   %l4, %o2, %o2
casx [%o5], %l7, %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
add  %l4, 1, %l4

P3167: !CAS [7] (maybe <- 0x1800040) (Int)
add %i1, 84, %o5
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

P3168: !ST [10] (maybe <- 0x1800041) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P3169: !ST [0] (maybe <- 0x1800042) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P3170: !DWLD [2] (Int)
ldx [%i0 + 8], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P3171: !CASX [14] (maybe <- 0x1800043) (Int)
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

P3172: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P3173: !CASX [12] (maybe <- 0x1800044) (Int)
add %i3, 0, %o5
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

P3174: !DWST [0] (maybe <- 0x1800045) (Int)
sllx %l4, 32, %l7 
add   %l4, 1, %l4
or %l7, %l4, %l7
stx %l7, [%i0 + 0]
add   %l4, 1, %l4

P3175: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P3176: !ST [0] (maybe <- 0x1800047) (Int) (CBR)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3176
nop
RET3176:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P3177: !CAS [7] (maybe <- 0x1800048) (Int)
add %i1, 84, %l7
lduw [%l7], %l3
mov %l3, %l6
! move %l6(lower) -> %o3(lower)
or %l6, %o3, %o3
mov %l4, %o4
cas [%l7], %l6, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P3178: !CASX [8] (maybe <- 0x1800049) (Int) (Branch target of P3083)
add %i1, 256, %l7
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
ba P3179
nop

TARGET3083:
ba RET3083
nop


P3179: !CAS [10] (maybe <- 0x180004a) (Int)
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

P3180: !ST [12] (maybe <- 0x180004b) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P3181: !LD [1] (Int) (LE)
wr %g0, 0x88, %asi
lduwa [%i0 + 4] %asi, %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2

P3182: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P3183: !DWLD [4] (FP)
ldd [%i0 + 64], %f0
! 1 addresses covered

P3184: !MEMBAR (Int)
membar #StoreLoad

P3185: !CASX [12] (maybe <- 0x180004c) (Int)
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

P3186: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P3187: !CAS [4] (maybe <- 0x180004d) (Int) (LE)
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
add %i0, 64, %o5
lduwa [%o5] %asi, %o0
mov %o0, %l7
! move %l7(lower) -> %o0(upper)
sllx %l7, 32, %o0
mov %l3, %l6
casa [%o5] %asi, %l7, %l6
! move %l6(lower) -> %o0(lower)
srl %l6, 0, %o5
or %o5, %o0, %o0
add   %l4, 1, %l4

P3188: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P3189: !REPLACEMENT [1] (Int)
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

P3190: !DWLD [9] (Int)
ldx [%i1 + 512], %o1
! move %o1(upper) -> %o1(upper)

P3191: !ST [3] (maybe <- 0x180004e) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P3192: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P3193: !CAS [4] (maybe <- 0x180004f) (Int)
add %i0, 64, %o5
lduw [%o5], %l6
mov %l6, %l7
! move %l7(lower) -> %o1(lower)
srlx %o1, 32, %o1
sllx %o1, 32, %o1
or %l7, %o1, %o1
mov %l4, %o2
cas [%o5], %l7, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P3194: !ST [10] (maybe <- 0x1800050) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P3195: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P3196: !CAS [10] (maybe <- 0x1800051) (Int)
add %i2, 32, %l7
lduw [%l7], %l3
mov %l3, %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2
mov %l4, %o3
cas [%l7], %l6, %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P3197: !REPLACEMENT [7] (Int)
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

P3198: !REPLACEMENT [10] (Int)
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

P3199: !DWLD [1] (FP) (CBR)
ldd [%i0 + 0], %f18
! 2 addresses covered
fmovs %f18, %f1
fmovs %f19, %f2

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3199
nop
RET3199:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P3200: !CASX [0] (maybe <- 0x1800052) (Int)
add %i0, 0, %l6
ldx [%l6], %o5
! move %o5(upper) -> %o3(lower)
srlx %o5, 32, %l3
or %l3, %o3, %o3
! move %o5(lower) -> %o4(upper)
sllx %o5, 32, %o4
mov %o5, %l3
sllx %l4, 32, %o5
add  %l4, 1, %l4
or   %l4, %o5, %o5
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

P3201: !ST [14] (maybe <- 0x1800054) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P3202: !CAS [7] (maybe <- 0x1800055) (Int)
add %i1, 84, %l3
lduw [%l3], %l7
mov %l7, %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0
mov %l4, %o1
cas [%l3], %o5, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P3203: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P3204: !CASX [5] (maybe <- 0x1800056) (Int)
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

P3205: !PREFETCH [14] (Int) (Branch target of P3455)
prefetch [%i3 + 128], 1
ba P3206
nop

TARGET3455:
ba RET3455
nop


P3206: !CAS [14] (maybe <- 0x1800057) (Int) (CBR)
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

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3206
nop
RET3206:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P3207: !CAS [10] (maybe <- 0x1800058) (Int) (LE)
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
add %i2, 32, %l6
lduwa [%l6] %asi, %o5
mov %o5, %l3
! move %l3(lower) -> %o4(lower)
or %l3, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5
mov %l7, %o0
casa [%l6] %asi, %l3, %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
add   %l4, 1, %l4

P3208: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P3209: !CASX [3] (maybe <- 0x1800059) (Int)
add %i0, 32, %l6
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

P3210: !CAS [12] (maybe <- 0x180005a) (Int) (CBR)
add %i3, 0, %l6
lduw [%l6], %o5
mov %o5, %l3
! move %l3(lower) -> %o2(lower)
or %l3, %o2, %o2
mov %l4, %o3
cas [%l6], %l3, %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3210
nop
RET3210:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P3211: !PREFETCH [14] (Int) (Branch target of P3820)
prefetch [%i3 + 128], 1
ba P3212
nop

TARGET3820:
ba RET3820
nop


P3212: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P3213: !ST [6] (maybe <- 0x180005b) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P3214: !CASX [7] (maybe <- 0x180005c) (Int)
add %i1, 80, %l6
ldx [%l6], %o5
! move %o5(upper) -> %o3(lower)
srlx %o5, 32, %l3
or %l3, %o3, %o3
! move %o5(lower) -> %o4(upper)
sllx %o5, 32, %o4
mov %o5, %l3
sllx %l4, 32, %o5
add  %l4, 1, %l4
or   %l4, %o5, %o5
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

P3215: !CASX [9] (maybe <- 0x180005e) (Int)
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

P3216: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P3217: !ST [9] (maybe <- 0x180005f) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P3218: !DWLD [13] (Int)
ldx [%i3 + 64], %l3
! move %l3(upper) -> %o2(lower)
srlx %l3, 32, %o5
or %o5, %o2, %o2

P3219: !CAS [0] (maybe <- 0x1800060) (Int) (Branch target of P3857)
add %i0, 0, %l7
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
ba P3220
nop

TARGET3857:
ba RET3857
nop


P3220: !SWAP [6] (maybe <- 0x1800061) (Int)
mov %l4, %o4
swap  [%i1 + 80], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P3221: !ST [13] (maybe <- 0x1800062) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P3222: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P3223: !CASX [6] (maybe <- 0x1800063) (Int)
add %i1, 80, %l3
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
mov %l7, %o5
sllx %l4, 32, %l7
add  %l4, 1, %l4
or   %l4, %l7, %l7
casx [%l3], %o5, %l7
! move %l7(upper) -> %o0(lower)
srlx %l7, 32, %l3
or %l3, %o0, %o0
! move %l7(lower) -> %o1(upper)
sllx %l7, 32, %o1
add  %l4, 1, %l4

P3224: !CASX [0] (maybe <- 0x1800065) (Int) (LE)
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
add %i0, 0, %l3
ldxa [%l3] %asi, %l7
! move %l7(lower) -> %o1(lower)
srl %l7, 0, %o5
or %o5, %o1, %o1
! move %l7(upper) -> %o2(upper)
or %l7, %g0, %o2
mov %l7, %o5
mov  %l6, %l7
casxa [%l3] %asi, %o5, %l7
! move %l7(lower) -> %o2(lower)
srlx %o2, 32, %o2
sllx %o2, 32, %o2
srl %l7, 0, %l3
or %l3, %o2, %o2
! move %l7(upper) -> %o3(upper)
or %l7, %g0, %o3
add  %l4, 1, %l4

P3225: !CAS [5] (maybe <- 0x1800067) (Int)
add %i1, 76, %l3
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

P3226: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P3227: !ST [10] (maybe <- 0x1800068) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P3228: !ST [0] (maybe <- 0x1800069) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P3229: !ST [6] (maybe <- 0x41000007) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i1 + 80 ]

P3230: !ST [3] (maybe <- 0x180006a) (Int) (LE)
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
stwa   %l3, [%i0 + 32] %asi
add   %l4, 1, %l4

P3231: !CASX [15] (maybe <- 0x180006b) (Int) (LE)
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
add %i3, 192, %l3
ldxa [%l3] %asi, %l7
! move %l7(lower) -> %o4(lower)
srl %l7, 0, %o5
or %o5, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5
! move %l7(upper) -> %o0(upper)
or %l7, %g0, %o0
mov  %l7, %o5
mov  %l6, %l7
casxa [%l3] %asi, %o5, %l7
! move %l7(lower) -> %o0(lower)
srlx %o0, 32, %o0
sllx %o0, 32, %o0
srl %l7, 0, %l3
or %l3, %o0, %o0
! move %l7(upper) -> %o1(upper)
or %l7, %g0, %o1
add  %l4, 1, %l4

P3232: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P3233: !PREFETCH [1] (Int) (Branch target of P3723)
prefetch [%i0 + 4], 1
ba P3234
nop

TARGET3723:
ba RET3723
nop


P3234: !PREFETCH [15] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i3 + 192] %asi, 1

P3235: !ST [10] (maybe <- 0x180006c) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P3236: !ST [9] (maybe <- 0x180006d) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P3237: !ST [5] (maybe <- 0x180006e) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P3238: !CASX [14] (maybe <- 0x180006f) (Int)
add %i3, 128, %l6
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

P3239: !ST [11] (maybe <- 0x1800070) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P3240: !ST [13] (maybe <- 0x1800071) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P3241: !PREFETCH [12] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i3 + 0] %asi, 1

P3242: !REPLACEMENT [11] (Int)
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

P3243: !ST [0] (maybe <- 0x1800072) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P3244: !CASX [5] (maybe <- 0x1800073) (Int)
add %i1, 72, %l6
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

P3245: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P3246: !CAS [0] (maybe <- 0x1800074) (Int)
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

P3247: !ST [10] (maybe <- 0x1800075) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P3248: !ST [4] (maybe <- 0x1800076) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P3249: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P3250: !CASX [13] (maybe <- 0x1800077) (Int)
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

P3251: !ST [5] (maybe <- 0x1800078) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P3252: !DWLD [4] (Int) (CBR) (Branch target of P3654)
ldx [%i0 + 64], %l7
! move %l7(upper) -> %o3(lower)
srlx %l7, 32, %l6
or %l6, %o3, %o3

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3252
nop
RET3252:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0

ba P3253
nop

TARGET3654:
ba RET3654
nop


P3253: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P3254: !REPLACEMENT [2] (Int) (CBR)
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
be,pn  %xcc, TARGET3254
nop
RET3254:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P3255: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P3256: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P3257: !CAS [4] (maybe <- 0x1800079) (Int) (Branch target of P3395)
add %i0, 64, %l6
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
ba P3258
nop

TARGET3395:
ba RET3395
nop


P3258: !CAS [7] (maybe <- 0x180007a) (Int)
add %i1, 84, %l6
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

P3259: !LD [11] (Int)
lduw [%i2 + 64], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P3260: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P3261: !CASX [8] (maybe <- 0x180007b) (Int)
add %i1, 256, %o5
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

P3262: !ST [3] (maybe <- 0x180007c) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P3263: !LD [3] (Int)
lduw [%i0 + 32], %l7
! move %l7(lower) -> %o3(lower)
or %l7, %o3, %o3

P3264: !DWST [1] (maybe <- 0x180007d) (Int)
sllx %l4, 32, %o5 
add   %l4, 1, %l4
or %o5, %l4, %o5
stx %o5, [%i0 + 0]
add   %l4, 1, %l4

P3265: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P3266: !CAS [15] (maybe <- 0x180007f) (Int)
add %i3, 192, %o5
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

P3267: !PREFETCH [6] (Int) (Branch target of P3539)
prefetch [%i1 + 80], 1
ba P3268
nop

TARGET3539:
ba RET3539
nop


P3268: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P3269: !PREFETCH [0] (Int) (Branch target of P3724)
prefetch [%i0 + 0], 1
ba P3270
nop

TARGET3724:
ba RET3724
nop


P3270: !ST [12] (maybe <- 0x1800080) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P3271: !CASX [5] (maybe <- 0x1800081) (Int) (LE)
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
sllx %o5, 32, %o5
wr %g0, 0x88, %asi
add %i1, 72, %l7
ldxa [%l7] %asi, %l3
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
! move %l3(upper) -> %o0(lower)
srlx %l3, 32, %l6
or %l6, %o0, %o0
mov  %l3, %l6
mov  %o5, %l3
casxa [%l7] %asi, %l6, %l3
! move %l3(lower) -> %o1(upper)
sllx %l3, 32, %o1
! move %l3(upper) -> %o1(lower)
srlx %l3, 32, %l7
or %l7, %o1, %o1
add  %l4, 1, %l4

P3272: !ST [1] (maybe <- 0x1800082) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P3273: !ST [6] (maybe <- 0x1800083) (Int) (Branch target of P3379)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4
ba P3274
nop

TARGET3379:
ba RET3379
nop


P3274: !ST [13] (maybe <- 0x1800084) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P3275: !ST [10] (maybe <- 0x1800085) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P3276: !CASX [6] (maybe <- 0x1800086) (Int)
add %i1, 80, %l7
ldx [%l7], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov %o2, %l6
sllx %l4, 32, %o3
add  %l4, 1, %l4
or   %l4, %o3, %o3
casx [%l7], %l6, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4

P3277: !ST [11] (maybe <- 0x1800088) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P3278: !ST [8] (maybe <- 0x1800089) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P3279: !ST [9] (maybe <- 0x180008a) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P3280: !CASX [12] (maybe <- 0x180008b) (Int)
add %i3, 0, %o5
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

P3281: !CASX [0] (maybe <- 0x180008c) (Int) (Branch target of P3849)
add %i0, 0, %o5
ldx [%o5], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
mov %o1, %l7
sllx %l4, 32, %o2
add  %l4, 1, %l4
or   %l4, %o2, %o2
casx [%o5], %l7, %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
add  %l4, 1, %l4
ba P3282
nop

TARGET3849:
ba RET3849
nop


P3282: !ST [12] (maybe <- 0x41000008) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i3 + 0 ]

P3283: !CASX [5] (maybe <- 0x180008e) (Int) (CBR)
add %i1, 72, %l7
ldx [%l7], %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
mov  %o3, %l6
mov %l4, %o4
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

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3283
nop
RET3283:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P3284: !ST [15] (maybe <- 0x180008f) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P3285: !CASX [7] (maybe <- 0x1800090) (Int) (Branch target of P3879)
add %i1, 80, %l7
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
ba P3286
nop

TARGET3879:
ba RET3879
nop


P3286: !CAS [6] (maybe <- 0x1800092) (Int)
add %i1, 80, %l7
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

P3287: !MEMBAR (Int)
membar #StoreLoad

P3288: !SWAP [11] (maybe <- 0x1800093) (Int)
mov %l4, %o3
swap  [%i2 + 64], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P3289: !PREFETCH [10] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i2 + 32] %asi, 1

P3290: !ST [3] (maybe <- 0x1800094) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P3291: !CAS [8] (maybe <- 0x1800095) (Int)
add %i1, 256, %l3
lduw [%l3], %l7
mov %l7, %o5
! move %o5(lower) -> %o3(lower)
or %o5, %o3, %o3
mov %l4, %o4
cas [%l3], %o5, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P3292: !ST [0] (maybe <- 0x1800096) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P3293: !CASX [1] (maybe <- 0x1800097) (Int)
add %i0, 0, %o5
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
mov %l6, %l7
sllx %l4, 32, %l6
add  %l4, 1, %l4
or   %l4, %l6, %l6
casx [%o5], %l7, %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %o5
or %o5, %o0, %o0
! move %l6(lower) -> %o1(upper)
sllx %l6, 32, %o1
add  %l4, 1, %l4

P3294: !DWLD [13] (Int)
ldx [%i3 + 64], %o5
! move %o5(upper) -> %o1(lower)
srlx %o5, 32, %l7
or %l7, %o1, %o1

P3295: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P3296: !CAS [12] (maybe <- 0x1800099) (Int)
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

P3297: !CAS [2] (maybe <- 0x180009a) (Int)
add %i0, 12, %l6
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

P3298: !LD [8] (Int)
lduw [%i1 + 256], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P3299: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P3300: !MEMBAR (Int) (Branch target of P3430)
membar #StoreLoad
ba P3301
nop

TARGET3430:
ba RET3430
nop


P3301: !CAS [11] (maybe <- 0x180009b) (Int)
add %i2, 64, %o5
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

P3302: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P3303: !ST [2] (maybe <- 0x180009c) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P3304: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P3305: !ST [3] (maybe <- 0x180009d) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P3306: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P3307: !MEMBAR (Int)
membar #StoreLoad

P3308: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P3309: !CASX [6] (maybe <- 0x180009e) (Int) (Branch target of P3408)
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
ba P3310
nop

TARGET3408:
ba RET3408
nop


P3310: !CASX [6] (maybe <- 0x18000a0) (Int)
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

P3311: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P3312: !ST [14] (maybe <- 0x18000a2) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P3313: !CAS [4] (maybe <- 0x18000a3) (Int)
add %i0, 64, %l3
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

P3314: !ST [3] (maybe <- 0x18000a4) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P3315: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P3316: !ST [2] (maybe <- 0x18000a5) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P3317: !CAS [1] (maybe <- 0x18000a6) (Int)
add %i0, 4, %l7
lduw [%l7], %l3
mov %l3, %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0
mov %l4, %o1
cas [%l7], %l6, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P3318: !ST [0] (maybe <- 0x18000a7) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P3319: !ST [4] (maybe <- 0x18000a8) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P3320: !REPLACEMENT [9] (Int)
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

P3321: !CASX [11] (maybe <- 0x18000a9) (Int)
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

P3322: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P3323: !CAS [15] (maybe <- 0x18000aa) (Int) (LE)
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
add %i3, 192, %o5
lduwa [%o5] %asi, %l6
mov %l6, %l7
! move %l7(lower) -> %o3(lower)
or %l7, %o3, %o3
mov %l3, %o4
casa [%o5] %asi, %l7, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P3324: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P3325: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P3326: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P3327: !CASX [0] (maybe <- 0x18000ab) (Int)
add %i0, 0, %o5
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
mov %l6, %l7
sllx %l4, 32, %l6
add  %l4, 1, %l4
or   %l4, %l6, %l6
casx [%o5], %l7, %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %o5
or %o5, %o0, %o0
! move %l6(lower) -> %o1(upper)
sllx %l6, 32, %o1
add  %l4, 1, %l4

P3328: !DWLD [0] (Int)
ldx [%i0 + 0], %o5
! move %o5(upper) -> %o1(lower)
srlx %o5, 32, %l7
or %l7, %o1, %o1
! move %o5(lower) -> %o2(upper)
sllx %o5, 32, %o2

P3329: !CASX [5] (maybe <- 0x18000ad) (Int)
add %i1, 72, %l6
ldx [%l6], %o5
! move %o5(upper) -> %o2(lower)
srlx %o5, 32, %l3
or %l3, %o2, %o2
! move %o5(lower) -> %o3(upper)
sllx %o5, 32, %o3
mov  %o5, %l3
mov %l4, %o5
casx [%l6], %l3, %o5
! move %o5(upper) -> %o3(lower)
srlx %o5, 32, %l6
or %l6, %o3, %o3
! move %o5(lower) -> %o4(upper)
sllx %o5, 32, %o4
add  %l4, 1, %l4

P3330: !ST [4] (maybe <- 0x18000ae) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P3331: !CASX [0] (maybe <- 0x18000af) (Int)
add %i0, 0, %l3
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
mov %l7, %o5
sllx %l4, 32, %l7
add  %l4, 1, %l4
or   %l4, %l7, %l7
casx [%l3], %o5, %l7
! move %l7(upper) -> %o0(lower)
srlx %l7, 32, %l3
or %l3, %o0, %o0
! move %l7(lower) -> %o1(upper)
sllx %l7, 32, %o1
add  %l4, 1, %l4

P3332: !CASX [3] (maybe <- 0x18000b1) (Int)
add %i0, 32, %l3
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

P3333: !CASX [11] (maybe <- 0x18000b2) (Int) (LE)
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
add %i2, 64, %l3
ldxa [%l3] %asi, %l7
! move %l7(lower) -> %o3(lower)
srl %l7, 0, %o5
or %o5, %o3, %o3
! move %l7(upper) -> %o4(upper)
or %l7, %g0, %o4
mov  %l7, %o5
mov  %l6, %l7
casxa [%l3] %asi, %o5, %l7
! move %l7(lower) -> %o4(lower)
srlx %o4, 32, %o4
sllx %o4, 32, %o4
srl %l7, 0, %l3
or %l3, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5
! move %l7(upper) -> %o0(upper)
or %l7, %g0, %o0
add  %l4, 1, %l4

P3334: !SWAP [0] (maybe <- 0x18000b3) (Int) (LE)
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
swapa  [%i0 + 0] %asi, %l6
! move %l6(lower) -> %o0(lower)
srlx %o0, 32, %o0
sllx %o0, 32, %o0
srl %l6, 0, %o5
or %o5, %o0, %o0
add   %l4, 1, %l4

P3335: !LD [2] (Int)
lduw [%i0 + 12], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P3336: !ST [8] (maybe <- 0x41000009) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i1 + 256 ]

P3337: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P3338: !MEMBAR (Int)
membar #StoreLoad

P3339: !ST [10] (maybe <- 0x18000b4) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P3340: !CASX [10] (maybe <- 0x18000b5) (Int)
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

P3341: !CASX [14] (maybe <- 0x18000b6) (Int)
add %i3, 128, %o5
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

P3342: !ST [0] (maybe <- 0x18000b7) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P3343: !ST [3] (maybe <- 0x18000b8) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P3344: !ST [13] (maybe <- 0x18000b9) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P3345: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P3346: !ST [14] (maybe <- 0x18000ba) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P3347: !ST [12] (maybe <- 0x18000bb) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P3348: !ST [10] (maybe <- 0x4100000a) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i2 + 32 ]

P3349: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P3350: !CASX [9] (maybe <- 0x18000bc) (Int)
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

P3351: !CAS [7] (maybe <- 0x18000bd) (Int)
add %i1, 84, %l6
lduw [%l6], %o5
mov %o5, %l3
! move %l3(lower) -> %o2(lower)
or %l3, %o2, %o2
mov %l4, %o3
cas [%l6], %l3, %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P3352: !ST [1] (maybe <- 0x18000be) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P3353: !MEMBAR (Int)
membar #StoreLoad

P3354: !MEMBAR (Int)
membar #StoreLoad

P3355: !DWLD [5] (Int)
ldx [%i1 + 72], %l3
! move %l3(lower) -> %o3(lower)
srl %l3, 0, %o5
or %o5, %o3, %o3

P3356: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P3357: !ST [0] (maybe <- 0x18000bf) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P3358: !ST [4] (maybe <- 0x18000c0) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P3359: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P3360: !NOP (Int)
nop

P3361: !CAS [8] (maybe <- 0x18000c1) (Int)
add %i1, 256, %l3
lduw [%l3], %o4
mov %o4, %o5
! move %o5(lower) -> %o4(upper)
sllx %o5, 32, %o4
mov %l4, %l7
cas [%l3], %o5, %l7
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

P3362: !CASX [13] (maybe <- 0x18000c2) (Int)
add %i3, 64, %l3
ldx [%l3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %o5
sllx %l4, 32, %o1
casx [%l3], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P3363: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P3364: !ST [11] (maybe <- 0x4100000b) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i2 + 64 ]

P3365: !CASX [13] (maybe <- 0x18000c3) (Int) (CBR)
add %i3, 64, %o5
ldx [%o5], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov  %o2, %l7
sllx %l4, 32, %o3
casx [%o5], %l7, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3365
nop
RET3365:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P3366: !CASX [9] (maybe <- 0x18000c4) (Int)
add %i1, 512, %l3
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

P3367: !ST [6] (maybe <- 0x18000c5) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P3368: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P3369: !CAS [11] (maybe <- 0x18000c6) (Int)
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

P3370: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P3371: !ST [7] (maybe <- 0x18000c7) (Int) (LE)
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
stwa   %l7, [%i1 + 84] %asi
add   %l4, 1, %l4

P3372: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P3373: !ST [4] (maybe <- 0x18000c8) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P3374: !DWST [7] (maybe <- 0x18000c9) (Int)
sllx %l4, 32, %l3 
add   %l4, 1, %l4
or %l3, %l4, %l3
stx %l3, [%i1 + 80]
add   %l4, 1, %l4

P3375: !ST [15] (maybe <- 0x4100000c) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i3 + 192 ]

P3376: !CAS [15] (maybe <- 0x18000cb) (Int)
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

P3377: !MEMBAR (Int)
membar #StoreLoad

P3378: !CAS [13] (maybe <- 0x18000cc) (Int)
add %i3, 64, %o5
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

P3379: !CAS [7] (maybe <- 0x18000cd) (Int) (LE) (CBR)
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

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3379
nop
RET3379:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P3380: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P3381: !CASX [10] (maybe <- 0x18000ce) (Int)
add %i2, 32, %l3
ldx [%l3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %o5
sllx %l4, 32, %o1
casx [%l3], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P3382: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P3383: !PREFETCH [5] (Int) (CBR)
prefetch [%i1 + 76], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3383
nop
RET3383:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P3384: !REPLACEMENT [2] (Int)
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

P3385: !ST [1] (maybe <- 0x18000cf) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P3386: !CASX [9] (maybe <- 0x18000d0) (Int) (LE)
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
add %i1, 512, %o5
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

P3387: !CASX [0] (maybe <- 0x18000d1) (Int)
add %i0, 0, %o5
ldx [%o5], %o4
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5
mov %o4, %l7
sllx %l4, 32, %o0
add  %l4, 1, %l4
or   %l4, %o0, %o0
casx [%o5], %l7, %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
add  %l4, 1, %l4

P3388: !ST [3] (maybe <- 0x18000d3) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P3389: !ST [1] (maybe <- 0x18000d4) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P3390: !CAS [15] (maybe <- 0x18000d5) (Int)
add %i3, 192, %l6
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

P3391: !ST [7] (maybe <- 0x18000d6) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P3392: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P3393: !LD [8] (Int)
lduw [%i1 + 256], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P3394: !CASX [9] (maybe <- 0x18000d7) (Int)
add %i1, 512, %l7
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

P3395: !CASX [11] (maybe <- 0x18000d8) (Int) (CBR)
add %i2, 64, %l7
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
be,pt  %xcc, TARGET3395
nop
RET3395:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P3396: !CAS [4] (maybe <- 0x18000d9) (Int)
add %i0, 64, %o5
lduw [%o5], %l6
mov %l6, %l7
! move %l7(lower) -> %o1(lower)
or %l7, %o1, %o1
mov %l4, %o2
cas [%o5], %l7, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P3397: !CAS [3] (maybe <- 0x18000da) (Int)
add %i0, 32, %o5
lduw [%o5], %l6
mov %l6, %l7
! move %l7(lower) -> %o2(lower)
or %l7, %o2, %o2
mov %l4, %o3
cas [%o5], %l7, %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P3398: !DWLD [14] (Int)
ldx [%i3 + 128], %o5
! move %o5(upper) -> %o3(lower)
srlx %o5, 32, %l7
or %l7, %o3, %o3

P3399: !CAS [0] (maybe <- 0x18000db) (Int)
add %i0, 0, %l6
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

P3400: !ST [5] (maybe <- 0x18000dc) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P3401: !REPLACEMENT [11] (Int)
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

P3402: !ST [1] (maybe <- 0x18000dd) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P3403: !ST [4] (maybe <- 0x4100000d) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i0 + 64 ]

P3404: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P3405: !LD [9] (Int)
lduw [%i1 + 512], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P3406: !PREFETCH [14] (Int) (Branch target of P3254)
prefetch [%i3 + 128], 1
ba P3407
nop

TARGET3254:
ba RET3254
nop


P3407: !ST [12] (maybe <- 0x18000de) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P3408: !PREFETCH [2] (Int) (CBR)
prefetch [%i0 + 12], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3408
nop
RET3408:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P3409: !DWLD [0] (Int)
ldx [%i0 + 0], %o5
! move %o5(upper) -> %o0(lower)
srlx %o5, 32, %l7
or %l7, %o0, %o0
! move %o5(lower) -> %o1(upper)
sllx %o5, 32, %o1

P3410: !CAS [1] (maybe <- 0x18000df) (Int)
add %i0, 4, %l6
lduw [%l6], %o5
mov %o5, %l3
! move %l3(lower) -> %o1(lower)
or %l3, %o1, %o1
mov %l4, %o2
cas [%l6], %l3, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P3411: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P3412: !DWLD [3] (Int)
ldx [%i0 + 32], %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l3
or %l3, %o2, %o2

P3413: !DWLD [14] (FP)
ldd [%i3 + 128], %f18
! 1 addresses covered
fmovs %f18, %f3

P3414: !ST [5] (maybe <- 0x18000e0) (Int) (Branch target of P3945)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4
ba P3415
nop

TARGET3945:
ba RET3945
nop


P3415: !CAS [13] (maybe <- 0x18000e1) (Int)
add %i3, 64, %l7
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

P3416: !PREFETCH [11] (Int) (Branch target of P3383)
prefetch [%i2 + 64], 1
ba P3417
nop

TARGET3383:
ba RET3383
nop


P3417: !ST [1] (maybe <- 0x18000e2) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P3418: !ST [8] (maybe <- 0x18000e3) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P3419: !ST [11] (maybe <- 0x18000e4) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P3420: !ST [14] (maybe <- 0x18000e5) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P3421: !LD [4] (Int) (Branch target of P3804)
lduw [%i0 + 64], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
ba P3422
nop

TARGET3804:
ba RET3804
nop


P3422: !MEMBAR (Int)
membar #StoreLoad

P3423: !LD [15] (Int)
lduw [%i3 + 192], %l3
! move %l3(lower) -> %o4(lower)
or %l3, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P3424: !CASX [8] (maybe <- 0x18000e6) (Int)
add %i1, 256, %l7
ldx [%l7], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l6
sllx %l4, 32, %o1
casx [%l7], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P3425: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P3426: !CAS [8] (maybe <- 0x18000e7) (Int) (CBR)
add %i1, 256, %l7
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

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3426
nop
RET3426:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P3427: !ST [3] (maybe <- 0x4100000e) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i0 + 32 ]

P3428: !CAS [3] (maybe <- 0x18000e8) (Int)
add %i0, 32, %l7
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

P3429: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P3430: !CAS [12] (maybe <- 0x18000e9) (Int) (CBR)
add %i3, 0, %l7
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

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3430
nop
RET3430:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P3431: !ST [6] (maybe <- 0x18000ea) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P3432: !ST [0] (maybe <- 0x18000eb) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P3433: !CASX [11] (maybe <- 0x18000ec) (Int)
add %i2, 64, %l6
ldx [%l6], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l3
sllx %l4, 32, %o1
casx [%l6], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P3434: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P3435: !CASX [4] (maybe <- 0x18000ed) (Int)
add %i0, 64, %l6
ldx [%l6], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov  %o2, %l3
sllx %l4, 32, %o3
casx [%l6], %l3, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4

P3436: !DWST [1] (maybe <- 0x18000ee) (Int)
sllx %l4, 32, %l3 
add   %l4, 1, %l4
or %l3, %l4, %l3
stx %l3, [%i0 + 0]
add   %l4, 1, %l4

P3437: !CAS [15] (maybe <- 0x18000f0) (Int)
add %i3, 192, %l3
lduw [%l3], %o4
mov %o4, %o5
! move %o5(lower) -> %o4(upper)
sllx %o5, 32, %o4
mov %l4, %l7
cas [%l3], %o5, %l7
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

P3438: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P3439: !CASX [7] (maybe <- 0x18000f1) (Int)
add %i1, 80, %l3
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

P3440: !CAS [0] (maybe <- 0x18000f3) (Int)
add %i0, 0, %l3
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

P3441: !ST [12] (maybe <- 0x18000f4) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P3442: !CASX [4] (maybe <- 0x18000f5) (Int)
add %i0, 64, %o5
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

P3443: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P3444: !DWST [3] (maybe <- 0x18000f6) (Int)
mov %l4, %l7 
sllx %l7, 32, %l7 
stx %l7, [%i0 + 32 ] 
add   %l4, 1, %l4

P3445: !SWAP [15] (maybe <- 0x18000f7) (Int)
mov %l4, %o0
swap  [%i3 + 192], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
add   %l4, 1, %l4

P3446: !DWST [4] (maybe <- 0x18000f8) (Int)
mov %l4, %l3 
sllx %l3, 32, %l3 
stx %l3, [%i0 + 64 ] 
add   %l4, 1, %l4

P3447: !ST [5] (maybe <- 0x18000f9) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P3448: !CASX [0] (maybe <- 0x18000fa) (Int)
add %i0, 0, %o5
ldx [%o5], %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l7
or %l7, %o0, %o0
! move %l6(lower) -> %o1(upper)
sllx %l6, 32, %o1
mov %l6, %l7
sllx %l4, 32, %l6
add  %l4, 1, %l4
or   %l4, %l6, %l6
casx [%o5], %l7, %l6
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %o5
or %o5, %o1, %o1
! move %l6(lower) -> %o2(upper)
sllx %l6, 32, %o2
add  %l4, 1, %l4

P3449: !CASX [0] (maybe <- 0x18000fc) (Int)
add %i0, 0, %o5
ldx [%o5], %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l7
or %l7, %o2, %o2
! move %l6(lower) -> %o3(upper)
sllx %l6, 32, %o3
mov %l6, %l7
sllx %l4, 32, %l6
add  %l4, 1, %l4
or   %l4, %l6, %l6
casx [%o5], %l7, %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %o5
or %o5, %o3, %o3
! move %l6(lower) -> %o4(upper)
sllx %l6, 32, %o4
add  %l4, 1, %l4

P3450: !ST [10] (maybe <- 0x18000fe) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P3451: !CAS [0] (maybe <- 0x18000ff) (Int)
add %i0, 0, %l7
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

P3452: !DWST [5] (maybe <- 0x1800100) (Int)
mov %l4, %l6 
stx %l6, [%i1 + 72]
add   %l4, 1, %l4

P3453: !CAS [1] (maybe <- 0x1800101) (Int)
add %i0, 4, %l6
lduw [%l6], %o5
mov %o5, %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0
mov %l4, %o1
cas [%l6], %l3, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P3454: !ST [4] (maybe <- 0x1800102) (Int) (LE)
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
stwa   %l3, [%i0 + 64] %asi
add   %l4, 1, %l4

P3455: !ST [4] (maybe <- 0x1800103) (Int) (CBR)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3455
nop
RET3455:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P3456: !ST [10] (maybe <- 0x1800104) (Int) (LE)
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
stwa   %o5, [%i2 + 32] %asi
add   %l4, 1, %l4

P3457: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P3458: !CAS [15] (maybe <- 0x1800105) (Int)
add %i3, 192, %o5
lduw [%o5], %l6
mov %l6, %l7
! move %l7(lower) -> %o1(lower)
or %l7, %o1, %o1
mov %l4, %o2
cas [%o5], %l7, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P3459: !CASX [14] (maybe <- 0x1800106) (Int)
add %i3, 128, %o5
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

P3460: !CAS [1] (maybe <- 0x1800107) (Int)
add %i0, 4, %o5
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

P3461: !ST [13] (maybe <- 0x1800108) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P3462: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P3463: !PREFETCH [1] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i0 + 4] %asi, 1

P3464: !ST [12] (maybe <- 0x1800109) (Int) (LE)
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
stwa   %l6, [%i3 + 0] %asi
add   %l4, 1, %l4

P3465: !ST [11] (maybe <- 0x180010a) (Int) (LE)
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
stwa   %l3, [%i2 + 64] %asi
add   %l4, 1, %l4

P3466: !PREFETCH [0] (Int) (Branch target of P3652)
prefetch [%i0 + 0], 1
ba P3467
nop

TARGET3652:
ba RET3652
nop


P3467: !ST [12] (maybe <- 0x180010b) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P3468: !CAS [12] (maybe <- 0x180010c) (Int)
add %i3, 0, %o5
lduw [%o5], %l6
mov %l6, %l7
! move %l7(lower) -> %o0(lower)
or %l7, %o0, %o0
mov %l4, %o1
cas [%o5], %l7, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P3469: !CAS [7] (maybe <- 0x180010d) (Int)
add %i1, 84, %o5
lduw [%o5], %l6
mov %l6, %l7
! move %l7(lower) -> %o1(lower)
or %l7, %o1, %o1
mov %l4, %o2
cas [%o5], %l7, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P3470: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P3471: !ST [4] (maybe <- 0x180010e) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P3472: !PREFETCH [2] (Int) (Branch target of P3785)
prefetch [%i0 + 12], 1
ba P3473
nop

TARGET3785:
ba RET3785
nop


P3473: !PREFETCH [7] (Int) (CBR)
prefetch [%i1 + 84], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3473
nop
RET3473:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P3474: !ST [0] (maybe <- 0x4100000f) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i0 + 0 ]

P3475: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P3476: !CASX [13] (maybe <- 0x180010f) (Int)
add %i3, 64, %l7
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

P3477: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P3478: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P3479: !MEMBAR (Int)
membar #StoreLoad

P3480: !MEMBAR (Int)
membar #StoreLoad

P3481: !ST [3] (maybe <- 0x1800110) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P3482: !ST [4] (maybe <- 0x1800111) (Int) (CBR)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3482
nop
RET3482:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P3483: !PREFETCH [9] (Int) (CBR)
prefetch [%i1 + 512], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3483
nop
RET3483:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P3484: !ST [7] (maybe <- 0x1800112) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P3485: !ST [6] (maybe <- 0x1800113) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P3486: !CAS [1] (maybe <- 0x1800114) (Int)
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

P3487: !ST [11] (maybe <- 0x1800115) (Int) (LE)
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
stwa   %o5, [%i2 + 64] %asi
add   %l4, 1, %l4

P3488: !DWST [12] (maybe <- 0x1800116) (Int) (CBR)
mov %l4, %l7 
sllx %l7, 32, %l7 
stx %l7, [%i3 + 0 ] 
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3488
nop
RET3488:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P3489: !CAS [13] (maybe <- 0x1800117) (Int)
add %i3, 64, %o5
lduw [%o5], %l6
mov %l6, %l7
! move %l7(lower) -> %o0(lower)
or %l7, %o0, %o0
mov %l4, %o1
cas [%o5], %l7, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P3490: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P3491: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P3492: !ST [10] (maybe <- 0x1800118) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P3493: !DWST [0] (maybe <- 0x1800119) (Int)
sllx %l4, 32, %l6 
add   %l4, 1, %l4
or %l6, %l4, %l6
stx %l6, [%i0 + 0]
add   %l4, 1, %l4

P3494: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P3495: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P3496: !CASX [3] (maybe <- 0x180011b) (Int)
add %i0, 32, %l6
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

P3497: !ST [4] (maybe <- 0x180011c) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P3498: !ST [13] (maybe <- 0x180011d) (Int) (CBR)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3498
nop
RET3498:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P3499: !CASX [12] (maybe <- 0x180011e) (Int) (CBR)
add %i3, 0, %l3
ldx [%l3], %l7
! move %l7(upper) -> %o3(lower)
srlx %l7, 32, %o5
or %o5, %o3, %o3
! move %l7(lower) -> %o4(upper)
sllx %l7, 32, %o4
mov  %l7, %o5
sllx %l4, 32, %l7
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

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3499
nop
RET3499:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P3500: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P3501: !ST [10] (maybe <- 0x180011f) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P3502: !ST [8] (maybe <- 0x1800120) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P3503: !LD [6] (Int)
lduw [%i1 + 80], %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0

P3504: !CAS [6] (maybe <- 0x1800121) (Int)
add %i1, 80, %l6
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

P3505: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P3506: !ST [6] (maybe <- 0x1800122) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P3507: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P3508: !CASX [9] (maybe <- 0x1800123) (Int)
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

P3509: !CASX [12] (maybe <- 0x1800124) (Int) (Branch target of P3426)
add %i3, 0, %l3
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
ba P3510
nop

TARGET3426:
ba RET3426
nop


P3510: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P3511: !ST [9] (maybe <- 0x1800125) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P3512: !SWAP [4] (maybe <- 0x1800126) (Int)
mov %l4, %o1
swap  [%i0 + 64], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P3513: !PREFETCH [9] (Int) (Branch target of P3176)
prefetch [%i1 + 512], 1
ba P3514
nop

TARGET3176:
ba RET3176
nop


P3514: !ST [4] (maybe <- 0x1800127) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P3515: !CAS [14] (maybe <- 0x1800128) (Int)
add %i3, 128, %l6
lduw [%l6], %o5
mov %o5, %l3
! move %l3(lower) -> %o1(lower)
or %l3, %o1, %o1
mov %l4, %o2
cas [%l6], %l3, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P3516: !ST [6] (maybe <- 0x1800129) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P3517: !ST [6] (maybe <- 0x180012a) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P3518: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P3519: !LD [15] (Int)
lduw [%i3 + 192], %o5
! move %o5(lower) -> %o2(lower)
or %o5, %o2, %o2

P3520: !MEMBAR (Int)
membar #StoreLoad

P3521: !CAS [6] (maybe <- 0x180012b) (Int) (LE)
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
add %i1, 80, %l6
lduwa [%l6] %asi, %o3
mov %o3, %l3
! move %l3(lower) -> %o3(upper)
sllx %l3, 32, %o3
mov %l7, %o5
casa [%l6] %asi, %l3, %o5
! move %o5(lower) -> %o3(lower)
srl %o5, 0, %l6
or %l6, %o3, %o3
add   %l4, 1, %l4

P3522: !ST [3] (maybe <- 0x180012c) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P3523: !PREFETCH [1] (Int) (Branch target of P3883)
prefetch [%i0 + 4], 1
ba P3524
nop

TARGET3883:
ba RET3883
nop


P3524: !ST [6] (maybe <- 0x180012d) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P3525: !PREFETCH [3] (Int) (Branch target of P3690)
prefetch [%i0 + 32], 1
ba P3526
nop

TARGET3690:
ba RET3690
nop


P3526: !SWAP [3] (maybe <- 0x180012e) (Int)
mov %l4, %o4
swap  [%i0 + 32], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P3527: !CASX [14] (maybe <- 0x180012f) (Int) (LE) (CBR)
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
add %i3, 128, %l7
ldxa [%l7] %asi, %l3
! move %l3(lower) -> %o4(lower)
srl %l3, 0, %l6
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5
! move %l3(upper) -> %o0(upper)
or %l3, %g0, %o0
mov  %l3, %l6
mov  %o5, %l3
casxa [%l7] %asi, %l6, %l3
! move %l3(lower) -> %o0(lower)
srlx %o0, 32, %o0
sllx %o0, 32, %o0
srl %l3, 0, %l7
or %l7, %o0, %o0
! move %l3(upper) -> %o1(upper)
or %l3, %g0, %o1
add  %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3527
nop
RET3527:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P3528: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P3529: !ST [2] (maybe <- 0x1800130) (Int) (CBR)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3529
nop
RET3529:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P3530: !CASX [15] (maybe <- 0x1800131) (Int)
add %i3, 192, %o5
ldx [%o5], %l6
! move %l6(upper) -> %o1(lower)
srlx %o1, 32, %o1
sllx %o1, 32, %o1
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

P3531: !ST [5] (maybe <- 0x1800132) (Int) (LE)
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
stwa   %l7, [%i1 + 76] %asi
add   %l4, 1, %l4

P3532: !ST [0] (maybe <- 0x1800133) (Int) (LE)
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
stwa   %l6, [%i0 + 0] %asi
add   %l4, 1, %l4

P3533: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P3534: !ST [8] (maybe <- 0x1800134) (Int) (Branch target of P3482)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4
ba P3535
nop

TARGET3482:
ba RET3482
nop


P3535: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P3536: !CAS [3] (maybe <- 0x1800135) (Int)
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

P3537: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P3538: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P3539: !PREFETCH [2] (Int) (CBR)
prefetch [%i0 + 12], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3539
nop
RET3539:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P3540: !ST [6] (maybe <- 0x1800136) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P3541: !ST [5] (maybe <- 0x1800137) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P3542: !ST [11] (maybe <- 0x1800138) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P3543: !ST [10] (maybe <- 0x1800139) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P3544: !ST [11] (maybe <- 0x41000010) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i2 + 64 ]

P3545: !CASX [9] (maybe <- 0x180013a) (Int)
add %i1, 512, %l3
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

P3546: !PREFETCH [0] (Int) (LE) (Branch target of P3161)
wr %g0, 0x88, %asi
prefetcha [%i0 + 0] %asi, 1
ba P3547
nop

TARGET3161:
ba RET3161
nop


P3547: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P3548: !PREFETCH [5] (Int) (LE) (Branch target of P3488)
wr %g0, 0x88, %asi
prefetcha [%i1 + 76] %asi, 1
ba P3549
nop

TARGET3488:
ba RET3488
nop


P3549: !DWLD [4] (Int)
ldx [%i0 + 64], %l3
! move %l3(upper) -> %o1(lower)
srlx %l3, 32, %o5
or %o5, %o1, %o1

P3550: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P3551: !ST [4] (maybe <- 0x180013b) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P3552: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P3553: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P3554: !PREFETCH [8] (Int) (CBR)
prefetch [%i1 + 256], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3554
nop
RET3554:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P3555: !ST [15] (maybe <- 0x180013c) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P3556: !ST [7] (maybe <- 0x180013d) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P3557: !CASX [5] (maybe <- 0x180013e) (Int)
add %i1, 72, %l3
ldx [%l3], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov  %o2, %o5
mov %l4, %o3
casx [%l3], %o5, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4

P3558: !DWST [8] (maybe <- 0x180013f) (Int)
mov %l4, %o5 
sllx %o5, 32, %o5 
stx %o5, [%i1 + 256 ] 
add   %l4, 1, %l4

P3559: !CASX [2] (maybe <- 0x1800140) (Int)
add %i0, 8, %o5
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

P3560: !CAS [8] (maybe <- 0x1800141) (Int) (Branch target of P3691)
add %i1, 256, %o5
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
ba P3561
nop

TARGET3691:
ba RET3691
nop


P3561: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P3562: !CASX [5] (maybe <- 0x1800142) (Int)
add %i1, 72, %o5
ldx [%o5], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov  %o2, %l7
mov %l4, %o3
casx [%o5], %l7, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4

P3563: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P3564: !ST [10] (maybe <- 0x1800143) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P3565: !CASX [11] (maybe <- 0x1800144) (Int)
add %i2, 64, %l7
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
sllx %l4, 32, %o0
casx [%l7], %l6, %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
add  %l4, 1, %l4

P3566: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P3567: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P3568: !CAS [6] (maybe <- 0x1800145) (Int)
add %i1, 80, %l7
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

P3569: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P3570: !ST [8] (maybe <- 0x1800146) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P3571: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P3572: !CASX [10] (maybe <- 0x1800147) (Int)
add %i2, 32, %l6
ldx [%l6], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov  %o2, %l3
sllx %l4, 32, %o3
casx [%l6], %l3, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4

P3573: !ST [13] (maybe <- 0x1800148) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P3574: !CASX [2] (maybe <- 0x1800149) (Int)
add %i0, 8, %l3
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
mov %l4, %o0
casx [%l3], %o5, %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
add  %l4, 1, %l4

P3575: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P3576: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P3577: !CASX [7] (maybe <- 0x180014a) (Int)
add %i1, 80, %l3
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

P3578: !ST [12] (maybe <- 0x180014c) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P3579: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P3580: !DWST [5] (maybe <- 0x180014d) (Int)
mov %l4, %l7 
stx %l7, [%i1 + 72]
add   %l4, 1, %l4

P3581: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P3582: !PREFETCH [8] (Int) (Branch target of P3529)
prefetch [%i1 + 256], 1
ba P3583
nop

TARGET3529:
ba RET3529
nop


P3583: !MEMBAR (Int)
membar #StoreLoad

P3584: !PREFETCH [13] (Int) (Branch target of P3252)
prefetch [%i3 + 64], 1
ba P3585
nop

TARGET3252:
ba RET3252
nop


P3585: !MEMBAR (Int)
membar #StoreLoad

P3586: !DWLD [12] (Int)
ldx [%i3 + 0], %o3
! move %o3(upper) -> %o3(upper)

P3587: !ST [11] (maybe <- 0x180014e) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P3588: !CASX [13] (maybe <- 0x180014f) (Int)
add %i3, 64, %o5
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

P3589: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P3590: !MEMBAR (Int)
membar #StoreLoad

P3591: !LD [10] (FP)
ld [%i2 + 32], %f4
! 1 addresses covered

P3592: !ST [1] (maybe <- 0x1800150) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P3593: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P3594: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P3595: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P3596: !CASX [9] (maybe <- 0x1800151) (Int)
add %i1, 512, %l7
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

P3597: !ST [3] (maybe <- 0x1800152) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P3598: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P3599: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P3600: !CASX [14] (maybe <- 0x1800153) (Int)
add %i3, 128, %l6
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

P3601: !ST [10] (maybe <- 0x1800154) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P3602: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P3603: !CAS [3] (maybe <- 0x1800155) (Int)
add %i0, 32, %l3
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

P3604: !LD [1] (Int)
lduw [%i0 + 4], %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0

P3605: !ST [3] (maybe <- 0x1800156) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P3606: !CASX [14] (maybe <- 0x1800157) (Int)
add %i3, 128, %l6
ldx [%l6], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
mov  %o1, %l3
sllx %l4, 32, %o2
casx [%l6], %l3, %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
add  %l4, 1, %l4

P3607: !ST [7] (maybe <- 0x1800158) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P3608: !CAS [7] (maybe <- 0x1800159) (Int)
add %i1, 84, %l3
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

P3609: !ST [14] (maybe <- 0x41000011) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i3 + 128 ]

P3610: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P3611: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P3612: !CAS [13] (maybe <- 0x180015a) (Int)
add %i3, 64, %o5
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

P3613: !CAS [10] (maybe <- 0x180015b) (Int)
add %i2, 32, %o5
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

P3614: !NOP (Int)
nop

P3615: !ST [7] (maybe <- 0x180015c) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P3616: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P3617: !CAS [6] (maybe <- 0x180015d) (Int)
add %i1, 80, %l7
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

P3618: !ST [1] (maybe <- 0x41000012) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i0 + 4 ]

P3619: !MEMBAR (Int)
membar #StoreLoad

P3620: !PREFETCH [1] (Int) (Branch target of P3677)
prefetch [%i0 + 4], 1
ba P3621
nop

TARGET3677:
ba RET3677
nop


P3621: !CASX [5] (maybe <- 0x180015e) (Int)
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

P3622: !ST [3] (maybe <- 0x41000013) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i0 + 32 ]

P3623: !ST [7] (maybe <- 0x180015f) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P3624: !CAS [12] (maybe <- 0x1800160) (Int)
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

P3625: !ST [9] (maybe <- 0x1800161) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P3626: !ST [14] (maybe <- 0x1800162) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P3627: !CAS [4] (maybe <- 0x1800163) (Int)
add %i0, 64, %l6
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

P3628: !ST [12] (maybe <- 0x1800164) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P3629: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P3630: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P3631: !DWST [14] (maybe <- 0x1800165) (Int)
mov %l4, %o5 
sllx %o5, 32, %o5 
stx %o5, [%i3 + 128 ] 
add   %l4, 1, %l4

P3632: !CAS [10] (maybe <- 0x1800166) (Int)
add %i2, 32, %o5
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

P3633: !CAS [11] (maybe <- 0x1800167) (Int)
add %i2, 64, %o5
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

P3634: !DWST [12] (maybe <- 0x1800168) (Int)
mov %l4, %l7 
sllx %l7, 32, %l7 
stx %l7, [%i3 + 0 ] 
add   %l4, 1, %l4

P3635: !CAS [1] (maybe <- 0x1800169) (Int)
add %i0, 4, %l7
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

P3636: !ST [12] (maybe <- 0x180016a) (Int) (Branch target of P3801)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4
ba P3637
nop

TARGET3801:
ba RET3801
nop


P3637: !CAS [13] (maybe <- 0x180016b) (Int)
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

P3638: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P3639: !CASX [4] (maybe <- 0x180016c) (Int)
add %i0, 64, %l6
ldx [%l6], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l3
sllx %l4, 32, %o1
casx [%l6], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P3640: !ST [14] (maybe <- 0x180016d) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P3641: !CASX [3] (maybe <- 0x180016e) (Int)
add %i0, 32, %l3
ldx [%l3], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov  %o2, %o5
sllx %l4, 32, %o3
casx [%l3], %o5, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4

P3642: !CASX [14] (maybe <- 0x180016f) (Int)
add %i3, 128, %l3
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

P3643: !ST [1] (maybe <- 0x41000014) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i0 + 4 ]

P3644: !ST [0] (maybe <- 0x1800170) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P3645: !CAS [6] (maybe <- 0x1800171) (Int)
add %i1, 80, %l7
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

P3646: !ST [15] (maybe <- 0x1800172) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P3647: !ST [3] (maybe <- 0x1800173) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P3648: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P3649: !CAS [3] (maybe <- 0x1800174) (Int)
add %i0, 32, %l3
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

P3650: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P3651: !CASX [11] (maybe <- 0x1800175) (Int)
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

P3652: !CAS [13] (maybe <- 0x1800176) (Int) (CBR)
add %i3, 64, %l3
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
be,pn  %xcc, TARGET3652
nop
RET3652:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P3653: !CAS [14] (maybe <- 0x1800177) (Int)
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

P3654: !ST [1] (maybe <- 0x1800178) (Int) (CBR)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3654
nop
RET3654:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P3655: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P3656: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P3657: !CAS [13] (maybe <- 0x1800179) (Int)
add %i3, 64, %l6
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

P3658: !ST [7] (maybe <- 0x180017a) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P3659: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P3660: !ST [0] (maybe <- 0x180017b) (Int) (Branch target of P3365)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4
ba P3661
nop

TARGET3365:
ba RET3365
nop


P3661: !ST [6] (maybe <- 0x180017c) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P3662: !CAS [1] (maybe <- 0x180017d) (Int)
add %i0, 4, %l7
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

P3663: !CAS [14] (maybe <- 0x180017e) (Int)
add %i3, 128, %l7
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

P3664: !ST [2] (maybe <- 0x180017f) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P3665: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P3666: !CAS [13] (maybe <- 0x1800180) (Int)
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

P3667: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P3668: !CAS [7] (maybe <- 0x1800181) (Int)
add %i1, 84, %l6
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

P3669: !CAS [0] (maybe <- 0x1800182) (Int)
add %i0, 0, %l6
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

P3670: !ST [13] (maybe <- 0x1800183) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P3671: !ST [5] (maybe <- 0x1800184) (Int) (Branch target of P3554)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4
ba P3672
nop

TARGET3554:
ba RET3554
nop


P3672: !PREFETCH [3] (Int) (Branch target of P3483)
prefetch [%i0 + 32], 1
ba P3673
nop

TARGET3483:
ba RET3483
nop


P3673: !ST [15] (maybe <- 0x41000015) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i3 + 192 ]

P3674: !ST [10] (maybe <- 0x1800185) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P3675: !PREFETCH [3] (Int) (CBR)
prefetch [%i0 + 32], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3675
nop
RET3675:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P3676: !CASX [11] (maybe <- 0x1800186) (Int)
add %i2, 64, %l7
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

P3677: !CASX [7] (maybe <- 0x1800187) (Int) (CBR)
add %i1, 80, %l7
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

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3677
nop
RET3677:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P3678: !ST [14] (maybe <- 0x1800189) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P3679: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P3680: !CAS [14] (maybe <- 0x180018a) (Int)
add %i3, 128, %l7
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

P3681: !CAS [8] (maybe <- 0x180018b) (Int)
add %i1, 256, %l7
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

P3682: !ST [1] (maybe <- 0x180018c) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P3683: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P3684: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P3685: !ST [8] (maybe <- 0x180018d) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P3686: !ST [5] (maybe <- 0x180018e) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P3687: !CASX [14] (maybe <- 0x180018f) (Int)
add %i3, 128, %o5
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

P3688: !ST [11] (maybe <- 0x1800190) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P3689: !CAS [4] (maybe <- 0x1800191) (Int)
add %i0, 64, %l7
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

P3690: !PREFETCH [0] (Int) (CBR)
prefetch [%i0 + 0], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3690
nop
RET3690:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P3691: !CASX [12] (maybe <- 0x1800192) (Int) (CBR)
add %i3, 0, %o5
ldx [%o5], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov  %o2, %l7
sllx %l4, 32, %o3
casx [%o5], %l7, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3691
nop
RET3691:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P3692: !CAS [6] (maybe <- 0x1800193) (Int)
add %i1, 80, %l3
lduw [%l3], %o4
mov %o4, %o5
! move %o5(lower) -> %o4(upper)
sllx %o5, 32, %o4
mov %l4, %l7
cas [%l3], %o5, %l7
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

P3693: !CAS [0] (maybe <- 0x1800194) (Int)
add %i0, 0, %l3
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

P3694: !REPLACEMENT [7] (Int) (Branch target of P3907)
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
ba P3695
nop

TARGET3907:
ba RET3907
nop


P3695: !DWST [11] (maybe <- 0x1800195) (Int)
mov %l4, %l7 
sllx %l7, 32, %l7 
stx %l7, [%i2 + 64 ] 
add   %l4, 1, %l4

P3696: !CAS [8] (maybe <- 0x1800196) (Int)
add %i1, 256, %l7
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

P3697: !ST [4] (maybe <- 0x1800197) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P3698: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P3699: !ST [12] (maybe <- 0x41000016) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i3 + 0 ]

P3700: !CAS [8] (maybe <- 0x1800198) (Int) (LE)
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
add %i1, 256, %l3
lduwa [%l3] %asi, %o2
mov %o2, %o5
! move %o5(lower) -> %o2(upper)
sllx %o5, 32, %o2
mov %l6, %l7
casa [%l3] %asi, %o5, %l7
! move %l7(lower) -> %o2(lower)
srl %l7, 0, %l3
or %l3, %o2, %o2
add   %l4, 1, %l4

P3701: !CAS [3] (maybe <- 0x1800199) (Int) (LE)
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
add %i0, 32, %l3
lduwa [%l3] %asi, %o3
mov %o3, %o5
! move %o5(lower) -> %o3(upper)
sllx %o5, 32, %o3
mov %l6, %l7
casa [%l3] %asi, %o5, %l7
! move %l7(lower) -> %o3(lower)
srl %l7, 0, %l3
or %l3, %o3, %o3
add   %l4, 1, %l4

P3702: !DWST [8] (maybe <- 0x180019a) (Int)
mov %l4, %o5 
sllx %o5, 32, %o5 
stx %o5, [%i1 + 256 ] 
add   %l4, 1, %l4

P3703: !CASX [12] (maybe <- 0x180019b) (Int)
add %i3, 0, %o5
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

P3704: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P3705: !CAS [7] (maybe <- 0x180019c) (Int)
add %i1, 84, %o5
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

P3706: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P3707: !ST [15] (maybe <- 0x41000017) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i3 + 192 ]

P3708: !CAS [6] (maybe <- 0x180019d) (Int) (LE)
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
add %i1, 80, %l7
lduwa [%l7] %asi, %o2
mov %o2, %l6
! move %l6(lower) -> %o2(upper)
sllx %l6, 32, %o2
mov %o5, %l3
casa [%l7] %asi, %l6, %l3
! move %l3(lower) -> %o2(lower)
srl %l3, 0, %l7
or %l7, %o2, %o2
add   %l4, 1, %l4

P3709: !CASX [13] (maybe <- 0x180019e) (Int)
add %i3, 64, %l7
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

P3710: !CAS [1] (maybe <- 0x180019f) (Int)
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

P3711: !DWST [10] (maybe <- 0x18001a0) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i2 + 32 ] 
add   %l4, 1, %l4

P3712: !CASX [11] (maybe <- 0x18001a1) (Int)
add %i2, 64, %l6
ldx [%l6], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
mov  %o1, %l3
sllx %l4, 32, %o2
casx [%l6], %l3, %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
add  %l4, 1, %l4

P3713: !CASX [9] (maybe <- 0x18001a2) (Int)
add %i1, 512, %l6
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

P3714: !ST [4] (maybe <- 0x18001a3) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P3715: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P3716: !ST [13] (maybe <- 0x18001a4) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P3717: !ST [10] (maybe <- 0x18001a5) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P3718: !CAS [1] (maybe <- 0x18001a6) (Int)
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

P3719: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P3720: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P3721: !LD [12] (Int)
lduw [%i3 + 0], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P3722: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P3723: !CASX [3] (maybe <- 0x18001a7) (Int) (CBR)
add %i0, 32, %l3
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

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3723
nop
RET3723:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P3724: !ST [7] (maybe <- 0x18001a8) (Int) (CBR)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3724
nop
RET3724:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P3725: !ST [15] (maybe <- 0x18001a9) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P3726: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P3727: !ST [10] (maybe <- 0x18001aa) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P3728: !ST [1] (maybe <- 0x18001ab) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P3729: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P3730: !CASX [5] (maybe <- 0x18001ac) (Int)
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

P3731: !CAS [0] (maybe <- 0x18001ad) (Int)
add %i0, 0, %l7
lduw [%l7], %l3
mov %l3, %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0
mov %l4, %o1
cas [%l7], %l6, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P3732: !CAS [6] (maybe <- 0x18001ae) (Int)
add %i1, 80, %l7
lduw [%l7], %l3
mov %l3, %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1
mov %l4, %o2
cas [%l7], %l6, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P3733: !ST [10] (maybe <- 0x18001af) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P3734: !ST [1] (maybe <- 0x18001b0) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P3735: !DWST [4] (maybe <- 0x18001b1) (Int) (Branch target of P3527)
mov %l4, %o5 
sllx %o5, 32, %o5 
stx %o5, [%i0 + 64 ] 
add   %l4, 1, %l4
ba P3736
nop

TARGET3527:
ba RET3527
nop


P3736: !PREFETCH [2] (Int) (Branch target of P3896)
prefetch [%i0 + 12], 1
ba P3737
nop

TARGET3896:
ba RET3896
nop


P3737: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P3738: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P3739: !ST [13] (maybe <- 0x18001b2) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P3740: !CASX [4] (maybe <- 0x18001b3) (Int)
add %i0, 64, %l7
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

P3741: !ST [12] (maybe <- 0x18001b4) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P3742: !ST [1] (maybe <- 0x18001b5) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P3743: !CASX [3] (maybe <- 0x18001b6) (Int)
add %i0, 32, %l3
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

P3744: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P3745: !CAS [0] (maybe <- 0x18001b7) (Int)
add %i0, 0, %l3
lduw [%l3], %l7
mov %l7, %o5
! move %o5(lower) -> %o1(lower)
or %o5, %o1, %o1
mov %l4, %o2
cas [%l3], %o5, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P3746: !ST [0] (maybe <- 0x18001b8) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P3747: !PREFETCH [14] (Int) (CBR)
prefetch [%i3 + 128], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3747
nop
RET3747:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P3748: !ST [13] (maybe <- 0x18001b9) (Int) (LE)
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
stwa   %o5, [%i3 + 64] %asi
add   %l4, 1, %l4

P3749: !CASX [3] (maybe <- 0x18001ba) (Int)
add %i0, 32, %o5
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

P3750: !CAS [10] (maybe <- 0x18001bb) (Int)
add %i2, 32, %o5
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

P3751: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P3752: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P3753: !ST [15] (maybe <- 0x18001bc) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P3754: !CAS [14] (maybe <- 0x18001bd) (Int)
add %i3, 128, %l7
lduw [%l7], %l3
mov %l3, %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0
mov %l4, %o1
cas [%l7], %l6, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P3755: !ST [4] (maybe <- 0x18001be) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P3756: !CAS [0] (maybe <- 0x18001bf) (Int)
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

P3757: !CAS [14] (maybe <- 0x18001c0) (Int)
add %i3, 128, %l6
lduw [%l6], %o5
mov %o5, %l3
! move %l3(lower) -> %o2(lower)
or %l3, %o2, %o2
mov %l4, %o3
cas [%l6], %l3, %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P3758: !CASX [4] (maybe <- 0x18001c1) (Int)
add %i0, 64, %l6
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

P3759: !ST [0] (maybe <- 0x18001c2) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P3760: !CASX [15] (maybe <- 0x18001c3) (Int) (CBR)
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

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3760
nop
RET3760:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P3761: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P3762: !CAS [1] (maybe <- 0x18001c4) (Int)
add %i0, 4, %l6
lduw [%l6], %o5
mov %o5, %l3
! move %l3(lower) -> %o2(lower)
or %l3, %o2, %o2
mov %l4, %o3
cas [%l6], %l3, %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P3763: !ST [15] (maybe <- 0x18001c5) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P3764: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P3765: !ST [9] (maybe <- 0x18001c6) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P3766: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P3767: !PREFETCH [3] (Int) (Branch target of P3085)
prefetch [%i0 + 32], 1
ba P3768
nop

TARGET3085:
ba RET3085
nop


P3768: !ST [9] (maybe <- 0x18001c7) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P3769: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P3770: !SWAP [3] (maybe <- 0x18001c8) (Int)
mov %l4, %o5
swap  [%i0 + 32], %o5
! move %o5(lower) -> %o3(lower)
srl %o5, 0, %l6
or %l6, %o3, %o3
add   %l4, 1, %l4

P3771: !CASX [8] (maybe <- 0x18001c9) (Int)
add %i1, 256, %l6
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

P3772: !CAS [9] (maybe <- 0x18001ca) (Int)
add %i1, 512, %l6
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

P3773: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P3774: !CAS [0] (maybe <- 0x18001cb) (Int)
add %i0, 0, %l6
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

P3775: !PREFETCH [10] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i2 + 32] %asi, 1

P3776: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P3777: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P3778: !CAS [12] (maybe <- 0x18001cc) (Int)
add %i3, 0, %l6
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

P3779: !ST [15] (maybe <- 0x18001cd) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P3780: !ST [8] (maybe <- 0x18001ce) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P3781: !REPLACEMENT [11] (Int)
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

P3782: !PREFETCH [15] (Int) (Branch target of P3833)
prefetch [%i3 + 192], 1
ba P3783
nop

TARGET3833:
ba RET3833
nop


P3783: !ST [9] (maybe <- 0x18001cf) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P3784: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P3785: !CASX [13] (maybe <- 0x18001d0) (Int) (CBR)
add %i3, 64, %l6
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

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3785
nop
RET3785:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P3786: !SWAP [15] (maybe <- 0x18001d1) (Int)
mov %l4, %o1
swap  [%i3 + 192], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P3787: !CAS [6] (maybe <- 0x18001d2) (Int) (Branch target of P3825)
add %i1, 80, %l6
lduw [%l6], %o5
mov %o5, %l3
! move %l3(lower) -> %o1(lower)
or %l3, %o1, %o1
mov %l4, %o2
cas [%l6], %l3, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4
ba P3788
nop

TARGET3825:
ba RET3825
nop


P3788: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P3789: !ST [5] (maybe <- 0x18001d3) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P3790: !ST [13] (maybe <- 0x18001d4) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P3791: !CASX [15] (maybe <- 0x18001d5) (Int)
add %i3, 192, %o5
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

P3792: !ST [5] (maybe <- 0x18001d6) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P3793: !ST [0] (maybe <- 0x18001d7) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P3794: !PREFETCH [10] (Int) (Branch target of P3114)
prefetch [%i2 + 32], 1
ba P3795
nop

TARGET3114:
ba RET3114
nop


P3795: !CASX [15] (maybe <- 0x18001d8) (Int)
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

P3796: !CASX [4] (maybe <- 0x18001d9) (Int)
add %i0, 64, %l6
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

P3797: !ST [6] (maybe <- 0x18001da) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P3798: !CAS [15] (maybe <- 0x18001db) (Int)
add %i3, 192, %l3
lduw [%l3], %l7
mov %l7, %o5
! move %o5(lower) -> %o3(lower)
or %o5, %o3, %o3
mov %l4, %o4
cas [%l3], %o5, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P3799: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P3800: !CAS [9] (maybe <- 0x18001dc) (Int)
add %i1, 512, %l3
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

P3801: !PREFETCH [15] (Int) (CBR)
prefetch [%i3 + 192], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3801
nop
RET3801:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P3802: !ST [3] (maybe <- 0x18001dd) (Int) (Branch target of P3199)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4
ba P3803
nop

TARGET3199:
ba RET3199
nop


P3803: !ST [5] (maybe <- 0x18001de) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P3804: !PREFETCH [11] (Int) (CBR)
prefetch [%i2 + 64], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3804
nop
RET3804:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P3805: !DWST [7] (maybe <- 0x18001df) (Int)
sllx %l4, 32, %o5 
add   %l4, 1, %l4
or %o5, %l4, %o5
stx %o5, [%i1 + 80]
add   %l4, 1, %l4

P3806: !LD [3] (Int) (LE)
wr %g0, 0x88, %asi
lduwa [%i0 + 32] %asi, %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0

P3807: !CAS [4] (maybe <- 0x18001e1) (Int)
add %i0, 64, %l6
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

P3808: !ST [10] (maybe <- 0x18001e2) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P3809: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P3810: !ST [3] (maybe <- 0x41000018) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i0 + 32 ]

P3811: !CAS [1] (maybe <- 0x18001e3) (Int)
add %i0, 4, %o5
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

P3812: !CASX [10] (maybe <- 0x18001e4) (Int)
add %i2, 32, %o5
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

P3813: !ST [5] (maybe <- 0x18001e5) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P3814: !DWLD [3] (Int)
ldx [%i0 + 32], %o0
! move %o0(upper) -> %o0(upper)

P3815: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P3816: !ST [15] (maybe <- 0x18001e6) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P3817: !CASX [14] (maybe <- 0x18001e7) (Int)
add %i3, 128, %o5
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

P3818: !ST [6] (maybe <- 0x18001e8) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P3819: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P3820: !ST [7] (maybe <- 0x18001e9) (Int) (CBR)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3820
nop
RET3820:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P3821: !ST [13] (maybe <- 0x41000019) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i3 + 64 ]

P3822: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P3823: !CASX [1] (maybe <- 0x18001ea) (Int)
add %i0, 0, %l6
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

P3824: !PREFETCH [8] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i1 + 256] %asi, 1

P3825: !ST [15] (maybe <- 0x18001ec) (Int) (CBR)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3825
nop
RET3825:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P3826: !CAS [15] (maybe <- 0x18001ed) (Int)
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

P3827: !LD [5] (FP)
ld [%i1 + 76], %f5
! 1 addresses covered

P3828: !ST [6] (maybe <- 0x4100001a) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i1 + 80 ]

P3829: !CASX [6] (maybe <- 0x18001ee) (Int)
add %i1, 80, %l3
ldx [%l3], %l7
! move %l7(upper) -> %o0(lower)
srlx %l7, 32, %o5
or %o5, %o0, %o0
! move %l7(lower) -> %o1(upper)
sllx %l7, 32, %o1
mov %l7, %o5
sllx %l4, 32, %l7
add  %l4, 1, %l4
or   %l4, %l7, %l7
casx [%l3], %o5, %l7
! move %l7(upper) -> %o1(lower)
srlx %l7, 32, %l3
or %l3, %o1, %o1
! move %l7(lower) -> %o2(upper)
sllx %l7, 32, %o2
add  %l4, 1, %l4

P3830: !ST [0] (maybe <- 0x18001f0) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P3831: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P3832: !ST [10] (maybe <- 0x18001f1) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P3833: !LD [14] (Int) (LE) (CBR)
wr %g0, 0x88, %asi
lduwa [%i3 + 128] %asi, %l7
! move %l7(lower) -> %o2(lower)
or %l7, %o2, %o2

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3833
nop
RET3833:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P3834: !ST [12] (maybe <- 0x18001f2) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P3835: !CASX [2] (maybe <- 0x18001f3) (Int)
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

P3836: !DWST [15] (maybe <- 0x18001f4) (Int)
mov %l4, %o5 
sllx %o5, 32, %o5 
stx %o5, [%i3 + 192 ] 
add   %l4, 1, %l4

P3837: !ST [9] (maybe <- 0x18001f5) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P3838: !ST [6] (maybe <- 0x18001f6) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P3839: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P3840: !ST [14] (maybe <- 0x18001f7) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P3841: !PREFETCH [14] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i3 + 128] %asi, 1

P3842: !ST [11] (maybe <- 0x4100001b) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i2 + 64 ]

P3843: !ST [13] (maybe <- 0x18001f8) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P3844: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P3845: !CASX [11] (maybe <- 0x18001f9) (Int) (CBR)
add %i2, 64, %l7
ldx [%l7], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l6
sllx %l4, 32, %o1
casx [%l7], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3845
nop
RET3845:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P3846: !ST [12] (maybe <- 0x18001fa) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P3847: !ST [8] (maybe <- 0x18001fb) (Int) (CBR)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3847
nop
RET3847:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P3848: !ST [7] (maybe <- 0x18001fc) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P3849: !CAS [11] (maybe <- 0x18001fd) (Int) (CBR)
add %i2, 64, %l6
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

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3849
nop
RET3849:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P3850: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P3851: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P3852: !ST [12] (maybe <- 0x18001fe) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P3853: !ST [8] (maybe <- 0x18001ff) (Int) (Branch target of P3283)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4
ba P3854
nop

TARGET3283:
ba RET3283
nop


P3854: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P3855: !ST [6] (maybe <- 0x1800200) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P3856: !ST [8] (maybe <- 0x4100001c) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i1 + 256 ]

P3857: !ST [0] (maybe <- 0x4100001d) (FP) (CBR)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i0 + 0 ]

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3857
nop
RET3857:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P3858: !ST [13] (maybe <- 0x1800201) (Int) (CBR)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3858
nop
RET3858:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P3859: !CAS [3] (maybe <- 0x1800202) (Int)
add %i0, 32, %l7
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

P3860: !REPLACEMENT [8] (Int)
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

P3861: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P3862: !PREFETCH [9] (Int) (Branch target of P3941)
prefetch [%i1 + 512], 1
ba P3863
nop

TARGET3941:
ba RET3941
nop


P3863: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P3864: !DWLD [1] (Int)
ldx [%i0 + 0], %o4
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P3865: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P3866: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P3867: !CASX [15] (maybe <- 0x1800203) (Int)
add %i3, 192, %o5
ldx [%o5], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l7
sllx %l4, 32, %o1
casx [%o5], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P3868: !CASX [14] (maybe <- 0x1800204) (Int)
add %i3, 128, %o5
ldx [%o5], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov  %o2, %l7
sllx %l4, 32, %o3
casx [%o5], %l7, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4

P3869: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P3870: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P3871: !CASX [7] (maybe <- 0x1800205) (Int)
add %i1, 80, %o5
ldx [%o5], %o4
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5
mov %o4, %l7
sllx %l4, 32, %o0
add  %l4, 1, %l4
or   %l4, %o0, %o0
casx [%o5], %l7, %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
add  %l4, 1, %l4

P3872: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P3873: !CASX [0] (maybe <- 0x1800207) (Int) (LE) (Branch target of P3845)
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
add %i0, 0, %o5
ldxa [%o5] %asi, %l6
! move %l6(lower) -> %o1(upper)
sllx %l6, 32, %o1
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %l7
or %l7, %o1, %o1
mov %l6, %l7
mov  %l3, %l6
casxa [%o5] %asi, %l7, %l6
! move %l6(lower) -> %o2(upper)
sllx %l6, 32, %o2
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %o5
or %o5, %o2, %o2
add  %l4, 1, %l4
ba P3874
nop

TARGET3845:
ba RET3845
nop


P3874: !CAS [9] (maybe <- 0x1800209) (Int)
add %i1, 512, %o5
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

P3875: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P3876: !REPLACEMENT [1] (Int)
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

P3877: !ST [9] (maybe <- 0x180020a) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P3878: !ST [14] (maybe <- 0x180020b) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P3879: !CASX [15] (maybe <- 0x180020c) (Int) (CBR)
add %i3, 192, %l3
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
be,pt  %xcc, TARGET3879
nop
RET3879:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P3880: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P3881: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P3882: !LD [15] (Int)
lduw [%i3 + 192], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P3883: !CAS [1] (maybe <- 0x180020d) (Int) (CBR)
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

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3883
nop
RET3883:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P3884: !CAS [13] (maybe <- 0x180020e) (Int)
add %i3, 64, %l3
lduw [%l3], %l7
mov %l7, %o5
! move %o5(lower) -> %o2(lower)
or %o5, %o2, %o2
mov %l4, %o3
cas [%l3], %o5, %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P3885: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P3886: !ST [8] (maybe <- 0x180020f) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P3887: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P3888: !CASX [10] (maybe <- 0x1800210) (Int)
add %i2, 32, %o5
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

P3889: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P3890: !ST [0] (maybe <- 0x1800211) (Int) (LE) (Branch target of P3922)
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
stwa   %l7, [%i0 + 0] %asi
add   %l4, 1, %l4
ba P3891
nop

TARGET3922:
ba RET3922
nop


P3891: !PREFETCH [7] (Int) (Branch target of P3498)
prefetch [%i1 + 84], 1
ba P3892
nop

TARGET3498:
ba RET3498
nop


P3892: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P3893: !PREFETCH [0] (Int) (Branch target of P3932)
prefetch [%i0 + 0], 1
ba P3894
nop

TARGET3932:
ba RET3932
nop


P3894: !LD [4] (Int)
lduw [%i0 + 64], %l7
! move %l7(lower) -> %o0(lower)
or %l7, %o0, %o0

P3895: !CAS [15] (maybe <- 0x1800212) (Int)
add %i3, 192, %l3
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

P3896: !CAS [9] (maybe <- 0x1800213) (Int) (CBR)
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

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3896
nop
RET3896:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P3897: !CASX [11] (maybe <- 0x1800214) (Int)
add %i2, 64, %l6
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

P3898: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P3899: !ST [8] (maybe <- 0x1800215) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P3900: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P3901: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P3902: !REPLACEMENT [7] (Int)
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

P3903: !REPLACEMENT [0] (Int)
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

P3904: !ST [4] (maybe <- 0x1800216) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P3905: !CAS [13] (maybe <- 0x1800217) (Int)
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

P3906: !ST [10] (maybe <- 0x1800218) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P3907: !CASX [6] (maybe <- 0x1800219) (Int) (CBR)
add %i1, 80, %l3
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

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3907
nop
RET3907:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P3908: !CASX [3] (maybe <- 0x180021b) (Int)
add %i0, 32, %l6
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

P3909: !ST [8] (maybe <- 0x180021c) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P3910: !CAS [5] (maybe <- 0x180021d) (Int)
add %i1, 76, %l3
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

P3911: !ST [10] (maybe <- 0x180021e) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P3912: !CASX [4] (maybe <- 0x180021f) (Int)
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

P3913: !DWST [6] (maybe <- 0x1800220) (Int)
sllx %l4, 32, %l7 
add   %l4, 1, %l4
or %l7, %l4, %l7
stx %l7, [%i1 + 80]
add   %l4, 1, %l4

P3914: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P3915: !LD [1] (Int) (Branch target of P3760)
lduw [%i0 + 4], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
ba P3916
nop

TARGET3760:
ba RET3760
nop


P3916: !LD [1] (Int)
lduw [%i0 + 4], %l3
! move %l3(lower) -> %o3(lower)
or %l3, %o3, %o3

P3917: !DWST [12] (maybe <- 0x1800222) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 0 ] 
add   %l4, 1, %l4

P3918: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P3919: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P3920: !ST [5] (maybe <- 0x1800223) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P3921: !ST [2] (maybe <- 0x1800224) (Int) (Branch target of P3995)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4
ba P3922
nop

TARGET3995:
ba RET3995
nop


P3922: !CAS [7] (maybe <- 0x1800225) (Int) (CBR)
add %i1, 84, %o5
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

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3922
nop
RET3922:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P3923: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P3924: !ST [11] (maybe <- 0x1800226) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P3925: !CASX [15] (maybe <- 0x1800227) (Int) (Branch target of P3747)
add %i3, 192, %o5
ldx [%o5], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l7
sllx %l4, 32, %o1
casx [%o5], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
ba P3926
nop

TARGET3747:
ba RET3747
nop


P3926: !ST [6] (maybe <- 0x1800228) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P3927: !CASX [4] (maybe <- 0x1800229) (Int)
add %i0, 64, %l7
ldx [%l7], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov  %o2, %l6
sllx %l4, 32, %o3
casx [%l7], %l6, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4

P3928: !ST [6] (maybe <- 0x180022a) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P3929: !ST [8] (maybe <- 0x180022b) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P3930: !CAS [11] (maybe <- 0x180022c) (Int)
add %i2, 64, %l3
lduw [%l3], %o4
mov %o4, %o5
! move %o5(lower) -> %o4(upper)
sllx %o5, 32, %o4
mov %l4, %l7
cas [%l3], %o5, %l7
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

P3931: !CASX [1] (maybe <- 0x180022d) (Int)
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

P3932: !PREFETCH [8] (Int) (CBR)
prefetch [%i1 + 256], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3932
nop
RET3932:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P3933: !CASX [11] (maybe <- 0x180022f) (Int)
add %i2, 64, %l6
ldx [%l6], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov  %o2, %l3
sllx %l4, 32, %o3
casx [%l6], %l3, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4

P3934: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P3935: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P3936: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P3937: !LD [11] (Int)
lduw [%i2 + 64], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P3938: !CASX [13] (maybe <- 0x1800230) (Int)
add %i3, 64, %o5
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

P3939: !CAS [9] (maybe <- 0x1800231) (Int)
add %i1, 512, %o5
lduw [%o5], %l6
mov %l6, %l7
! move %l7(lower) -> %o1(lower)
or %l7, %o1, %o1
mov %l4, %o2
cas [%o5], %l7, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P3940: !CAS [4] (maybe <- 0x1800232) (Int)
add %i0, 64, %o5
lduw [%o5], %l6
mov %l6, %l7
! move %l7(lower) -> %o2(lower)
or %l7, %o2, %o2
mov %l4, %o3
cas [%o5], %l7, %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P3941: !ST [2] (maybe <- 0x1800233) (Int) (CBR)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3941
nop
RET3941:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P3942: !DWST [6] (maybe <- 0x4100001e) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=21 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
std %f20, [%i1 + 80]

P3943: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P3944: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P3945: !CAS [1] (maybe <- 0x1800234) (Int) (CBR) (Branch target of P3499)
add %i0, 4, %l7
lduw [%l7], %l3
mov %l3, %l6
! move %l6(lower) -> %o3(lower)
or %l6, %o3, %o3
mov %l4, %o4
cas [%l7], %l6, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3945
nop
RET3945:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0

ba P3946
nop

TARGET3499:
ba RET3499
nop


P3946: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P3947: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P3948: !CASX [12] (maybe <- 0x1800235) (Int)
add %i3, 0, %o5
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

P3949: !CAS [9] (maybe <- 0x1800236) (Int)
add %i1, 512, %o5
lduw [%o5], %l6
mov %l6, %l7
! move %l7(lower) -> %o1(lower)
or %l7, %o1, %o1
mov %l4, %o2
cas [%o5], %l7, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P3950: !ST [13] (maybe <- 0x1800237) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P3951: !CAS [8] (maybe <- 0x1800238) (Int)
add %i1, 256, %l7
lduw [%l7], %l3
mov %l3, %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2
mov %l4, %o3
cas [%l7], %l6, %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P3952: !ST [7] (maybe <- 0x1800239) (Int) (LE)
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
stwa   %l6, [%i1 + 84] %asi
add   %l4, 1, %l4

P3953: !CAS [6] (maybe <- 0x180023a) (Int)
add %i1, 80, %l6
lduw [%l6], %o5
mov %o5, %l3
! move %l3(lower) -> %o3(lower)
or %l3, %o3, %o3
mov %l4, %o4
cas [%l6], %l3, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P3954: !SWAP [8] (maybe <- 0x180023b) (Int)
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

P3955: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P3956: !ST [14] (maybe <- 0x180023c) (Int) (LE)
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
stwa   %o5, [%i3 + 128] %asi
add   %l4, 1, %l4

P3957: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P3958: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P3959: !CAS [1] (maybe <- 0x180023d) (Int)
add %i0, 4, %o5
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

P3960: !CAS [7] (maybe <- 0x180023e) (Int)
add %i1, 84, %o5
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

P3961: !PREFETCH [11] (Int) (Branch target of P3206)
prefetch [%i2 + 64], 1
ba P3962
nop

TARGET3206:
ba RET3206
nop


P3962: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P3963: !CASX [8] (maybe <- 0x180023f) (Int) (Branch target of P3847)
add %i1, 256, %o5
ldx [%o5], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov  %o2, %l7
sllx %l4, 32, %o3
casx [%o5], %l7, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4
ba P3964
nop

TARGET3847:
ba RET3847
nop


P3964: !ST [10] (maybe <- 0x1800240) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P3965: !CAS [13] (maybe <- 0x1800241) (Int)
add %i3, 64, %l7
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

P3966: !CAS [3] (maybe <- 0x1800242) (Int)
add %i0, 32, %l7
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

P3967: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P3968: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P3969: !PREFETCH [7] (Int) (Branch target of P3858)
prefetch [%i1 + 84], 1
ba P3970
nop

TARGET3858:
ba RET3858
nop


P3970: !CAS [4] (maybe <- 0x1800243) (Int)
add %i0, 64, %l7
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

P3971: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P3972: !ST [11] (maybe <- 0x1800244) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P3973: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P3974: !DWLD [2] (Int)
ldx [%i0 + 8], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P3975: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P3976: !CASX [4] (maybe <- 0x1800245) (Int)
add %i0, 64, %o5
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

P3977: !CAS [11] (maybe <- 0x1800246) (Int)
add %i2, 64, %o5
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

P3978: !CAS [9] (maybe <- 0x1800247) (Int)
add %i1, 512, %o5
lduw [%o5], %l6
mov %l6, %l7
! move %l7(lower) -> %o0(lower)
or %l7, %o0, %o0
mov %l4, %o1
cas [%o5], %l7, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P3979: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P3980: !ST [6] (maybe <- 0x1800248) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P3981: !ST [15] (maybe <- 0x41000020) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i3 + 192 ]

P3982: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P3983: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P3984: !CAS [10] (maybe <- 0x1800249) (Int)
add %i2, 32, %l6
lduw [%l6], %o5
mov %o5, %l3
! move %l3(lower) -> %o1(lower)
or %l3, %o1, %o1
mov %l4, %o2
cas [%l6], %l3, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P3985: !CAS [2] (maybe <- 0x180024a) (Int)
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

P3986: !CAS [12] (maybe <- 0x180024b) (Int)
add %i3, 0, %l6
lduw [%l6], %o5
mov %o5, %l3
! move %l3(lower) -> %o3(lower)
or %l3, %o3, %o3
mov %l4, %o4
cas [%l6], %l3, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P3987: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P3988: !ST [11] (maybe <- 0x180024c) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P3989: !ST [5] (maybe <- 0x180024d) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P3990: !ST [11] (maybe <- 0x180024e) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P3991: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P3992: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P3993: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P3994: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P3995: !ST [0] (maybe <- 0x180024f) (Int) (CBR)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3995
nop
RET3995:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P3996: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P3997: !DWST [2] (maybe <- 0x1800250) (Int) (LE)
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
sllx %l7, 32, %l7 
stxa %l7, [%i0 + 8 ] %asi
add   %l4, 1, %l4

P3998: !ST [11] (maybe <- 0x1800251) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P3999: !ST [0] (maybe <- 0x1800252) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P4000: !DWST [5] (maybe <- 0x1800253) (Int)
mov %l4, %l7 
stx %l7, [%i1 + 72]
add   %l4, 1, %l4

P4001: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P4002: !CASX [7] (maybe <- 0x1800254) (Int)
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

P4003: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P4004: !ST [8] (maybe <- 0x1800256) (Int) (LE)
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
stwa   %l6, [%i1 + 256] %asi
add   %l4, 1, %l4

P4005: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P4006: !PREFETCH [15] (Int) (Branch target of P3675)
prefetch [%i3 + 192], 1
ba P4007
nop

TARGET3675:
ba RET3675
nop


P4007: !ST [13] (maybe <- 0x1800257) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P4008: !ST [13] (maybe <- 0x1800258) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P4009: !ST [14] (maybe <- 0x1800259) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P4010: !ST [9] (maybe <- 0x180025a) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P4011: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P4012: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P4013: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P4014: !CASX [4] (maybe <- 0x180025b) (Int)
add %i0, 64, %l6
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

P4015: !ST [13] (maybe <- 0x180025c) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P4016: !PREFETCH [10] (Int) (Branch target of P3136)
prefetch [%i2 + 32], 1
ba P4017
nop

TARGET3136:
ba RET3136
nop


P4017: !ST [15] (maybe <- 0x180025d) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P4018: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P4019: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P4020: !ST [14] (maybe <- 0x41000021) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i3 + 128 ]

P4021: !ST [13] (maybe <- 0x180025e) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P4022: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P4023: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P4024: !CAS [15] (maybe <- 0x180025f) (Int) (LE)
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
add %i3, 192, %l6
lduwa [%l6] %asi, %o5
mov %o5, %l3
! move %l3(lower) -> %o3(lower)
or %l3, %o3, %o3
mov %l7, %o4
casa [%l6] %asi, %l3, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P4025: !ST [13] (maybe <- 0x1800260) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P4026: !DWST [11] (maybe <- 0x1800261) (Int)
mov %l4, %o5 
sllx %o5, 32, %o5 
stx %o5, [%i2 + 64 ] 
add   %l4, 1, %l4

P4027: !ST [13] (maybe <- 0x1800262) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P4028: !CASX [10] (maybe <- 0x1800263) (Int) (Branch target of P3210)
add %i2, 32, %l7
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
ba P4029
nop

TARGET3210:
ba RET3210
nop


P4029: !ST [3] (maybe <- 0x1800264) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P4030: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P4031: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P4032: !CAS [10] (maybe <- 0x1800265) (Int)
add %i2, 32, %l6
lduw [%l6], %o5
mov %o5, %l3
! move %l3(lower) -> %o1(lower)
or %l3, %o1, %o1
mov %l4, %o2
cas [%l6], %l3, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P4033: !CAS [13] (maybe <- 0x1800266) (Int)
add %i3, 64, %l6
lduw [%l6], %o5
mov %o5, %l3
! move %l3(lower) -> %o2(lower)
or %l3, %o2, %o2
mov %l4, %o3
cas [%l6], %l3, %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P4034: !ST [1] (maybe <- 0x1800267) (Int) (LE)
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
stwa   %l3, [%i0 + 4] %asi
add   %l4, 1, %l4

P4035: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P4036: !CAS [7] (maybe <- 0x1800268) (Int)
add %i1, 84, %l3
lduw [%l3], %l7
mov %l7, %o5
! move %o5(lower) -> %o3(lower)
or %o5, %o3, %o3
mov %l4, %o4
cas [%l3], %o5, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P4037: !LD [11] (Int)
lduw [%i2 + 64], %l3
! move %l3(lower) -> %o4(lower)
or %l3, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P4038: !ST [15] (maybe <- 0x1800269) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P4039: !ST [5] (maybe <- 0x180026a) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P4040: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P4041: !CASX [5] (maybe <- 0x180026b) (Int)
add %i1, 72, %l3
ldx [%l3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %o5
mov %l4, %o1
casx [%l3], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P4042: !LD [10] (Int)
lduw [%i2 + 32], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P4043: !CASX [2] (maybe <- 0x180026c) (Int)
add %i0, 8, %l7
ldx [%l7], %l3
! move %l3(upper) -> %o2(lower)
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

P4044: !CASX [8] (maybe <- 0x180026d) (Int)
add %i1, 256, %l7
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

P4045: !CAS [12] (maybe <- 0x180026e) (Int)
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

P4046: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P4047: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P4048: !CASX [0] (maybe <- 0x180026f) (Int)
add %i0, 0, %l7
ldx [%l7], %l3
! move %l3(upper) -> %o2(lower)
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

P4049: !ST [11] (maybe <- 0x1800271) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P4050: !CASX [4] (maybe <- 0x1800272) (Int)
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

P4051: !CAS [0] (maybe <- 0x1800273) (Int)
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

P4052: !CASX [15] (maybe <- 0x1800274) (Int)
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

P4053: !LD [10] (Int)
lduw [%i2 + 32], %l6
! move %l6(lower) -> %o4(lower)
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P4054: !ST [3] (maybe <- 0x1800275) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P4055: !CAS [5] (maybe <- 0x1800276) (Int)
add %i1, 76, %l7
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

P4056: !ST [2] (maybe <- 0x1800277) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P4057: !CAS [11] (maybe <- 0x1800278) (Int)
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

P4058: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P4059: !ST [1] (maybe <- 0x41000022) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i0 + 4 ]

P4060: !CAS [1] (maybe <- 0x1800279) (Int)
add %i0, 4, %l3
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

P4061: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P4062: !ST [11] (maybe <- 0x180027a) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P4063: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P4064: !ST [9] (maybe <- 0x41000023) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i1 + 512 ]

P4065: !CAS [11] (maybe <- 0x180027b) (Int)
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

P4066: !ST [4] (maybe <- 0x180027c) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P4067: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P4068: !CASX [14] (maybe <- 0x180027d) (Int)
add %i3, 128, %l6
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

P4069: !CASX [1] (maybe <- 0x180027e) (Int)
add %i0, 0, %l6
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

P4070: !CASX [15] (maybe <- 0x1800280) (Int)
add %i3, 192, %l6
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

P4071: !MEMBAR (Int)
membar #StoreLoad

P4072: !LD [0] (Int)
lduw [%i0 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P4073: !LD [1] (Int)
lduw [%i0 + 4], %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0

P4074: !LD [2] (Int)
lduw [%i0 + 12], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P4075: !LD [3] (Int)
lduw [%i0 + 32], %o5
! move %o5(lower) -> %o1(lower)
or %o5, %o1, %o1

P4076: !LD [4] (FP)
ld [%i0 + 64], %f6
! 1 addresses covered

P4077: !LD [5] (FP)
ld [%i1 + 76], %f7
! 1 addresses covered

P4078: !LD [6] (FP)
ld [%i1 + 80], %f8
! 1 addresses covered

P4079: !LD [7] (Int)
lduw [%i1 + 84], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P4080: !LD [8] (Int)
lduw [%i1 + 256], %o5
! move %o5(lower) -> %o2(lower)
or %o5, %o2, %o2

P4081: !LD [9] (Int)
lduw [%i1 + 512], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P4082: !LD [10] (Int)
lduw [%i2 + 32], %o5
! move %o5(lower) -> %o3(lower)
or %o5, %o3, %o3

P4083: !LD [11] (Int)
lduw [%i2 + 64], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P4084: !LD [12] (Int)
lduw [%i3 + 0], %o5
! move %o5(lower) -> %o4(lower)
or %o5, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P4085: !LD [13] (FP)
ld [%i3 + 64], %f9
! 1 addresses covered

P4086: !LD [14] (Int)
lduw [%i3 + 128], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P4087: !LD [15] (Int)
lduw [%i3 + 192], %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0

END_NODES3: ! Test istream for CPU 3 ends
sethi %hi(0xdead0e0f), %l3
or    %l3, %lo(0xdead0e0f), %l3
! move %l3(lower) -> %o1(upper)
sllx %l3, 32, %o1
stw %l3, [%i5] 
ld [%i5], %f10
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
! 1000 (dynamic) instruction sequence begins
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
sethi %hi(0x04deade1), %o5
or    %o5, %lo(0x04deade1), %o5
stw %o5, [%i5] 
ld [%i5], %f16

! Initialize running integer counter in register %l4
sethi %hi(0x2000001), %l4
or    %l4, %lo(0x2000001), %l4

! Initialize running FP counter in register %f16
sethi %hi(0x41800001), %o5
or    %o5, %lo(0x41800001), %o5
stw %o5, [%i5] 
ld [%i5], %f16

! Initialize FP counter increment value in register %f17 (constant)
sethi %hi(0x36000000), %o5
or    %o5, %lo(0x36000000), %o5
stw %o5, [%i5] 
ld [%i5], %f17 

! Initialize LFSR to 0x5053^4
sethi %hi(0x5053), %l0
or    %l0, %lo(0x5053), %l0
mulx  %l0, %l0, %l0
mulx  %l0, %l0, %l0

!-- init shared addrs 8 to 9 ---
stx %g0, [%i1+256]
stx %g0, [%i1+512]

! use untouched cache-line (offset 4K) in replacement area for sync
sub %i1, %i0, %l3
add %i3, %l3, %l3
sub %l3, -4096, %l3

!-- begin of sync_init ---
or %g0, 1, %l6
or %g0, %l6, %l7
swap [%l3+4], %l7
membar #Sync
sync_init_1_4:
brnz,pt %l6, sync_init_1_4
lduw [%l3+4], %l6 ! delay slot
sync_init_2_4:
lduw [%l3], %l6
sub %l6, 1, %l7
cas [%l3], %l6, %l7
cmp %l6, %l7
bne,pt %xcc, sync_init_2_4
nop
membar #Sync
sync_init_3_4:
lduw [%l3], %l6 ! delay slot
brnz,pt %l6, sync_init_3_4
nop
!-- end of sync_init ---


BEGIN_NODES4: ! Test istream for CPU 4 begins

P4088: !ST [12] (maybe <- 0x2000001) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P4089: !ST [6] (maybe <- 0x2000002) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P4090: !CAS [3] (maybe <- 0x2000003) (Int)
add %i0, 32, %l7
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

P4091: !DWLD [8] (Int)
ldx [%i1 + 256], %o1
! move %o1(upper) -> %o1(upper)

P4092: !CAS [3] (maybe <- 0x2000004) (Int)
add %i0, 32, %l3
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

P4093: !CASX [0] (maybe <- 0x2000005) (Int)
add %i0, 0, %l3
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

P4094: !REPLACEMENT [2] (Int)
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

P4095: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P4096: !CAS [8] (maybe <- 0x2000007) (Int)
add %i1, 256, %o5
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

P4097: !ST [4] (maybe <- 0x2000008) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P4098: !CASX [0] (maybe <- 0x2000009) (Int)
add %i0, 0, %l7
ldx [%l7], %l3
! move %l3(upper) -> %o0(lower)
srlx %l3, 32, %l6
or %l6, %o0, %o0
! move %l3(lower) -> %o1(upper)
sllx %l3, 32, %o1
mov %l3, %l6
sllx %l4, 32, %l3
add  %l4, 1, %l4
or   %l4, %l3, %l3
casx [%l7], %l6, %l3
! move %l3(upper) -> %o1(lower)
srlx %l3, 32, %l7
or %l7, %o1, %o1
! move %l3(lower) -> %o2(upper)
sllx %l3, 32, %o2
add  %l4, 1, %l4

P4099: !CASX [0] (maybe <- 0x200000b) (Int)
add %i0, 0, %l7
ldx [%l7], %l3
! move %l3(upper) -> %o2(lower)
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

P4100: !ST [0] (maybe <- 0x200000d) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P4101: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P4102: !ST [11] (maybe <- 0x200000e) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P4103: !ST [8] (maybe <- 0x200000f) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P4104: !CASX [13] (maybe <- 0x2000010) (Int)
add %i3, 64, %o5
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

P4105: !CAS [0] (maybe <- 0x2000011) (Int)
add %i0, 0, %o5
lduw [%o5], %l6
mov %l6, %l7
! move %l7(lower) -> %o1(lower)
or %l7, %o1, %o1
mov %l4, %o2
cas [%o5], %l7, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P4106: !DWLD [9] (FP)
ldd [%i1 + 512], %f0
! 1 addresses covered

P4107: !ST [12] (maybe <- 0x2000012) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P4108: !CAS [8] (maybe <- 0x2000013) (Int)
add %i1, 256, %l7
lduw [%l7], %l3
mov %l3, %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2
mov %l4, %o3
cas [%l7], %l6, %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P4109: !CAS [11] (maybe <- 0x2000014) (Int)
add %i2, 64, %l7
lduw [%l7], %l3
mov %l3, %l6
! move %l6(lower) -> %o3(lower)
or %l6, %o3, %o3
mov %l4, %o4
cas [%l7], %l6, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P4110: !CASX [7] (maybe <- 0x2000015) (Int)
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

P4111: !ST [2] (maybe <- 0x2000017) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P4112: !DWST [7] (maybe <- 0x2000018) (Int)
sllx %l4, 32, %l3 
add   %l4, 1, %l4
or %l3, %l4, %l3
stx %l3, [%i1 + 80]
add   %l4, 1, %l4

P4113: !CASX [6] (maybe <- 0x200001a) (Int)
add %i1, 80, %l3
ldx [%l3], %l7
! move %l7(upper) -> %o1(lower)
srlx %l7, 32, %o5
or %o5, %o1, %o1
! move %l7(lower) -> %o2(upper)
sllx %l7, 32, %o2
mov %l7, %o5
sllx %l4, 32, %l7
add  %l4, 1, %l4
or   %l4, %l7, %l7
casx [%l3], %o5, %l7
! move %l7(upper) -> %o2(lower)
srlx %l7, 32, %l3
or %l3, %o2, %o2
! move %l7(lower) -> %o3(upper)
sllx %l7, 32, %o3
add  %l4, 1, %l4

P4114: !ST [2] (maybe <- 0x200001c) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P4115: !MEMBAR (Int)
membar #StoreLoad

P4116: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P4117: !CAS [3] (maybe <- 0x200001d) (Int)
add %i0, 32, %o5
lduw [%o5], %l6
mov %l6, %l7
! move %l7(lower) -> %o3(lower)
or %l7, %o3, %o3
mov %l4, %o4
cas [%o5], %l7, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P4118: !CAS [1] (maybe <- 0x200001e) (Int)
add %i0, 4, %o5
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

P4119: !CAS [15] (maybe <- 0x200001f) (Int)
add %i3, 192, %o5
lduw [%o5], %l6
mov %l6, %l7
! move %l7(lower) -> %o0(lower)
or %l7, %o0, %o0
mov %l4, %o1
cas [%o5], %l7, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P4120: !CASX [8] (maybe <- 0x2000020) (Int)
add %i1, 256, %o5
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

P4121: !CAS [7] (maybe <- 0x2000021) (Int)
add %i1, 84, %o5
lduw [%o5], %l6
mov %l6, %l7
! move %l7(lower) -> %o3(lower)
or %l7, %o3, %o3
mov %l4, %o4
cas [%o5], %l7, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P4122: !CASX [9] (maybe <- 0x2000022) (Int) (LE)
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
add %i1, 512, %o5
ldxa [%o5] %asi, %l6
! move %l6(lower) -> %o4(lower)
srl %l6, 0, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5
! move %l6(upper) -> %o0(upper)
or %l6, %g0, %o0
mov  %l6, %l7
mov  %l3, %l6
casxa [%o5] %asi, %l7, %l6
! move %l6(lower) -> %o0(lower)
srlx %o0, 32, %o0
sllx %o0, 32, %o0
srl %l6, 0, %o5
or %o5, %o0, %o0
! move %l6(upper) -> %o1(upper)
or %l6, %g0, %o1
add  %l4, 1, %l4

P4123: !CAS [7] (maybe <- 0x2000023) (Int)
add %i1, 84, %o5
lduw [%o5], %l6
mov %l6, %l7
! move %l7(lower) -> %o1(lower)
srlx %o1, 32, %o1
sllx %o1, 32, %o1
or %l7, %o1, %o1
mov %l4, %o2
cas [%o5], %l7, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P4124: !LD [15] (Int)
lduw [%i3 + 192], %o5
! move %o5(lower) -> %o2(lower)
or %o5, %o2, %o2

P4125: !PREFETCH [1] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i0 + 4] %asi, 1

P4126: !CASX [3] (maybe <- 0x2000024) (Int)
add %i0, 32, %l6
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

P4127: !CAS [14] (maybe <- 0x2000025) (Int)
add %i3, 128, %l6
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

P4128: !CASX [5] (maybe <- 0x2000026) (Int)
add %i1, 72, %l6
ldx [%l6], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
mov  %o1, %l3
mov %l4, %o2
casx [%l6], %l3, %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
add  %l4, 1, %l4

P4129: !ST [14] (maybe <- 0x2000027) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P4130: !CAS [4] (maybe <- 0x2000028) (Int) (CBR)
add %i0, 64, %l3
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

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET4130
nop
RET4130:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P4131: !PREFETCH [12] (Int) (CBR)
prefetch [%i3 + 0], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET4131
nop
RET4131:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P4132: !CASX [9] (maybe <- 0x2000029) (Int)
add %i1, 512, %l7
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
sllx %l4, 32, %o0
casx [%l7], %l6, %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
add  %l4, 1, %l4

P4133: !CAS [8] (maybe <- 0x200002a) (Int)
add %i1, 256, %l7
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

P4134: !CASX [13] (maybe <- 0x200002b) (Int)
add %i3, 64, %l7
ldx [%l7], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov  %o2, %l6
sllx %l4, 32, %o3
casx [%l7], %l6, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4

P4135: !ST [13] (maybe <- 0x200002c) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P4136: !ST [13] (maybe <- 0x200002d) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P4137: !CAS [9] (maybe <- 0x200002e) (Int)
add %i1, 512, %l3
lduw [%l3], %o4
mov %o4, %o5
! move %o5(lower) -> %o4(upper)
sllx %o5, 32, %o4
mov %l4, %l7
cas [%l3], %o5, %l7
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

P4138: !ST [15] (maybe <- 0x200002f) (Int) (LE)
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
stwa   %o5, [%i3 + 192] %asi
add   %l4, 1, %l4

P4139: !CASX [10] (maybe <- 0x2000030) (Int)
add %i2, 32, %o5
ldx [%o5], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l7
sllx %l4, 32, %o1
casx [%o5], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P4140: !CASX [6] (maybe <- 0x2000031) (Int)
add %i1, 80, %o5
ldx [%o5], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov %o2, %l7
sllx %l4, 32, %o3
add  %l4, 1, %l4
or   %l4, %o3, %o3
casx [%o5], %l7, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4

P4141: !LD [13] (Int)
lduw [%i3 + 64], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P4142: !CAS [11] (maybe <- 0x2000033) (Int)
add %i2, 64, %l6
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

P4143: !SWAP [13] (maybe <- 0x2000034) (Int)
mov %l4, %l7
swap  [%i3 + 64], %l7
! move %l7(lower) -> %o0(lower)
srl %l7, 0, %l3
or %l3, %o0, %o0
add   %l4, 1, %l4

P4144: !CAS [7] (maybe <- 0x2000035) (Int) (CBR)
add %i1, 84, %l3
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
be,pt  %xcc, TARGET4144
nop
RET4144:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P4145: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P4146: !ST [9] (maybe <- 0x2000036) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P4147: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P4148: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P4149: !NOP (Int) (CBR) (Branch target of P4617)
nop

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET4149
nop
RET4149:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0

ba P4150
nop

TARGET4617:
ba RET4617
nop


P4150: !ST [6] (maybe <- 0x2000037) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P4151: !CAS [11] (maybe <- 0x2000038) (Int)
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

P4152: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P4153: !ST [8] (maybe <- 0x2000039) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P4154: !CAS [13] (maybe <- 0x200003a) (Int)
add %i3, 64, %o5
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

P4155: !DWLD [4] (Int)
ldx [%i0 + 64], %o4
! move %o4(upper) -> %o4(upper)

P4156: !ST [11] (maybe <- 0x200003b) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P4157: !CAS [14] (maybe <- 0x200003c) (Int)
add %i3, 128, %l3
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

P4158: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P4159: !ST [3] (maybe <- 0x200003d) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P4160: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P4161: !CASX [0] (maybe <- 0x200003e) (Int)
add %i0, 0, %o5
ldx [%o5], %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l7
or %l7, %o0, %o0
! move %l6(lower) -> %o1(upper)
sllx %l6, 32, %o1
mov %l6, %l7
sllx %l4, 32, %l6
add  %l4, 1, %l4
or   %l4, %l6, %l6
casx [%o5], %l7, %l6
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %o5
or %o5, %o1, %o1
! move %l6(lower) -> %o2(upper)
sllx %l6, 32, %o2
add  %l4, 1, %l4

P4162: !CASX [8] (maybe <- 0x2000040) (Int)
add %i1, 256, %o5
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

P4163: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P4164: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P4165: !ST [12] (maybe <- 0x2000041) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P4166: !DWST [6] (maybe <- 0x2000042) (Int)
sllx %l4, 32, %l6 
add   %l4, 1, %l4
or %l6, %l4, %l6
stx %l6, [%i1 + 80]
add   %l4, 1, %l4

P4167: !ST [9] (maybe <- 0x2000044) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P4168: !ST [6] (maybe <- 0x41800001) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i1 + 80 ]

P4169: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P4170: !ST [12] (maybe <- 0x2000045) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P4171: !REPLACEMENT [11] (Int)
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

P4172: !ST [9] (maybe <- 0x2000046) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P4173: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P4174: !CAS [10] (maybe <- 0x2000047) (Int)
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

P4175: !CASX [6] (maybe <- 0x2000048) (Int)
add %i1, 80, %l3
ldx [%l3], %l7
! move %l7(upper) -> %o0(lower)
srlx %l7, 32, %o5
or %o5, %o0, %o0
! move %l7(lower) -> %o1(upper)
sllx %l7, 32, %o1
mov %l7, %o5
sllx %l4, 32, %l7
add  %l4, 1, %l4
or   %l4, %l7, %l7
casx [%l3], %o5, %l7
! move %l7(upper) -> %o1(lower)
srlx %l7, 32, %l3
or %l3, %o1, %o1
! move %l7(lower) -> %o2(upper)
sllx %l7, 32, %o2
add  %l4, 1, %l4

P4176: !DWLD [15] (Int)
ldx [%i3 + 192], %l3
! move %l3(upper) -> %o2(lower)
srlx %l3, 32, %o5
or %o5, %o2, %o2

P4177: !LD [3] (FP)
ld [%i0 + 32], %f1
! 1 addresses covered

P4178: !DWLD [15] (Int)
ldx [%i3 + 192], %o3
! move %o3(upper) -> %o3(upper)

P4179: !PREFETCH [11] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i2 + 64] %asi, 1

P4180: !CAS [13] (maybe <- 0x200004a) (Int)
add %i3, 64, %l3
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

P4181: !ST [2] (maybe <- 0x200004b) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P4182: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P4183: !CASX [8] (maybe <- 0x200004c) (Int)
add %i1, 256, %o5
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

P4184: !DWLD [14] (Int)
ldx [%i3 + 128], %o5
! move %o5(upper) -> %o1(lower)
srlx %o5, 32, %l7
or %l7, %o1, %o1

P4185: !MEMBAR (Int)
membar #StoreLoad

P4186: !ST [10] (maybe <- 0x200004d) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P4187: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P4188: !ST [3] (maybe <- 0x200004e) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P4189: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P4190: !DWST [11] (maybe <- 0x200004f) (Int)
mov %l4, %l7 
sllx %l7, 32, %l7 
stx %l7, [%i2 + 64 ] 
add   %l4, 1, %l4

P4191: !CASX [2] (maybe <- 0x2000050) (Int)
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

P4192: !DWLD [0] (Int)
ldx [%i0 + 0], %o4
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P4193: !ST [13] (maybe <- 0x2000051) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P4194: !ST [8] (maybe <- 0x2000052) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P4195: !CAS [4] (maybe <- 0x2000053) (Int)
add %i0, 64, %l7
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

P4196: !ST [4] (maybe <- 0x2000054) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P4197: !PREFETCH [2] (Int) (Branch target of P5082)
prefetch [%i0 + 12], 1
ba P4198
nop

TARGET5082:
ba RET5082
nop


P4198: !ST [3] (maybe <- 0x2000055) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P4199: !CASX [3] (maybe <- 0x2000056) (Int)
add %i0, 32, %l3
ldx [%l3], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
mov  %o1, %o5
sllx %l4, 32, %o2
casx [%l3], %o5, %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
add  %l4, 1, %l4

P4200: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P4201: !CAS [8] (maybe <- 0x2000057) (Int)
add %i1, 256, %l3
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

P4202: !LD [15] (Int)
lduw [%i3 + 192], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P4203: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P4204: !ST [8] (maybe <- 0x2000058) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P4205: !CASX [14] (maybe <- 0x2000059) (Int)
add %i3, 128, %l6
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

P4206: !CAS [15] (maybe <- 0x200005a) (Int)
add %i3, 192, %l6
lduw [%l6], %o5
mov %o5, %l3
! move %l3(lower) -> %o1(lower)
or %l3, %o1, %o1
mov %l4, %o2
cas [%l6], %l3, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P4207: !CAS [12] (maybe <- 0x200005b) (Int) (LE)
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
add %i3, 0, %l6
lduwa [%l6] %asi, %o5
mov %o5, %l3
! move %l3(lower) -> %o2(lower)
or %l3, %o2, %o2
mov %l7, %o3
casa [%l6] %asi, %l3, %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P4208: !ST [10] (maybe <- 0x200005c) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P4209: !ST [10] (maybe <- 0x200005d) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P4210: !CAS [0] (maybe <- 0x200005e) (Int)
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

P4211: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P4212: !ST [3] (maybe <- 0x200005f) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P4213: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P4214: !CASX [4] (maybe <- 0x2000060) (Int)
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

P4215: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P4216: !ST [8] (maybe <- 0x2000061) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P4217: !LD [13] (Int)
lduw [%i3 + 64], %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1

P4218: !ST [5] (maybe <- 0x2000062) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P4219: !ST [15] (maybe <- 0x2000063) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P4220: !DWST [9] (maybe <- 0x41800002) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
std %f20, [%i1 + 512]

P4221: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P4222: !SWAP [8] (maybe <- 0x2000064) (Int) (CBR)
mov %l4, %o2
swap  [%i1 + 256], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET4222
nop
RET4222:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P4223: !DWST [3] (maybe <- 0x2000065) (Int)
mov %l4, %o5 
sllx %o5, 32, %o5 
stx %o5, [%i0 + 32 ] 
add   %l4, 1, %l4

P4224: !ST [7] (maybe <- 0x2000066) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P4225: !ST [4] (maybe <- 0x2000067) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P4226: !DWLD [12] (Int)
ldx [%i3 + 0], %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l3
or %l3, %o2, %o2

P4227: !CAS [10] (maybe <- 0x2000068) (Int)
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

P4228: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P4229: !ST [8] (maybe <- 0x2000069) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P4230: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P4231: !DWST [3] (maybe <- 0x200006a) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i0 + 32 ] 
add   %l4, 1, %l4

P4232: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P4233: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P4234: !DWLD [1] (FP) (CBR)
ldd [%i0 + 0], %f2
! 2 addresses covered

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET4234
nop
RET4234:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P4235: !ST [9] (maybe <- 0x200006b) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P4236: !CASX [7] (maybe <- 0x200006c) (Int)
add %i1, 80, %l6
ldx [%l6], %o4
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5
mov %o4, %l3
sllx %l4, 32, %o0
add  %l4, 1, %l4
or   %l4, %o0, %o0
casx [%l6], %l3, %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
add  %l4, 1, %l4

P4237: !DWST [8] (maybe <- 0x200006e) (Int) (LE)
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

P4238: !ST [4] (maybe <- 0x200006f) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P4239: !DWST [13] (maybe <- 0x2000070) (Int)
mov %l4, %l7 
sllx %l7, 32, %l7 
stx %l7, [%i3 + 64 ] 
add   %l4, 1, %l4

P4240: !ST [14] (maybe <- 0x2000071) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P4241: !DWST [9] (maybe <- 0x41800003) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
std %f20, [%i1 + 512]

P4242: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P4243: !LD [0] (Int)
lduw [%i0 + 0], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P4244: !ST [6] (maybe <- 0x2000072) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P4245: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P4246: !LD [13] (Int)
lduw [%i3 + 64], %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1

P4247: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P4248: !ST [7] (maybe <- 0x2000073) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P4249: !CASX [9] (maybe <- 0x2000074) (Int) (CBR)
add %i1, 512, %l7
ldx [%l7], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov  %o2, %l6
sllx %l4, 32, %o3
casx [%l7], %l6, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET4249
nop
RET4249:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P4250: !CAS [10] (maybe <- 0x2000075) (Int)
add %i2, 32, %o5
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

P4251: !ST [14] (maybe <- 0x2000076) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P4252: !ST [13] (maybe <- 0x2000077) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P4253: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P4254: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P4255: !ST [5] (maybe <- 0x2000078) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P4256: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P4257: !ST [8] (maybe <- 0x2000079) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P4258: !CAS [5] (maybe <- 0x200007a) (Int)
add %i1, 76, %o5
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

P4259: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P4260: !ST [14] (maybe <- 0x200007b) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P4261: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P4262: !DWLD [0] (Int)
ldx [%i0 + 0], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)

P4263: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P4264: !ST [1] (maybe <- 0x200007c) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P4265: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P4266: !ST [5] (maybe <- 0x41800004) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i1 + 76 ]

P4267: !ST [12] (maybe <- 0x200007d) (Int) (Branch target of P5066)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4
ba P4268
nop

TARGET5066:
ba RET5066
nop


P4268: !PREFETCH [14] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i3 + 128] %asi, 1

P4269: !ST [8] (maybe <- 0x200007e) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P4270: !CAS [8] (maybe <- 0x200007f) (Int)
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

P4271: !ST [8] (maybe <- 0x2000080) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P4272: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P4273: !ST [14] (maybe <- 0x2000081) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P4274: !CASX [2] (maybe <- 0x2000082) (Int) (Branch target of P4956)
add %i0, 8, %l7
ldx [%l7], %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
mov  %o3, %l6
mov %l4, %o4
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
ba P4275
nop

TARGET4956:
ba RET4956
nop


P4275: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P4276: !REPLACEMENT [12] (Int)
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

P4277: !CAS [8] (maybe <- 0x2000083) (Int)
add %i1, 256, %l6
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

P4278: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P4279: !ST [2] (maybe <- 0x2000084) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P4280: !DWST [8] (maybe <- 0x2000085) (Int)
mov %l4, %o5 
sllx %o5, 32, %o5 
stx %o5, [%i1 + 256 ] 
add   %l4, 1, %l4

P4281: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P4282: !CASX [15] (maybe <- 0x2000086) (Int)
add %i3, 192, %o5
ldx [%o5], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
mov  %o1, %l7
sllx %l4, 32, %o2
casx [%o5], %l7, %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
add  %l4, 1, %l4

P4283: !CAS [11] (maybe <- 0x2000087) (Int)
add %i2, 64, %o5
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

P4284: !ST [0] (maybe <- 0x2000088) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P4285: !CASX [3] (maybe <- 0x2000089) (Int)
add %i0, 32, %l7
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
sllx %l4, 32, %o0
casx [%l7], %l6, %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
add  %l4, 1, %l4

P4286: !ST [11] (maybe <- 0x200008a) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P4287: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P4288: !CASX [0] (maybe <- 0x200008b) (Int)
add %i0, 0, %l6
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

P4289: !ST [3] (maybe <- 0x200008d) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P4290: !DWLD [2] (Int) (LE)
wr %g0, 0x88, %asi
ldxa [%i0 + 8] %asi, %l3
! move %l3(upper) -> %o3(upper)
or %l3, %g0, %o3

P4291: !ST [7] (maybe <- 0x200008e) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P4292: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P4293: !ST [15] (maybe <- 0x200008f) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P4294: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P4295: !REPLACEMENT [15] (Int)
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

P4296: !LD [2] (Int)
lduw [%i0 + 12], %o5
! move %o5(lower) -> %o3(lower)
srlx %o3, 32, %o3
sllx %o3, 32, %o3
or %o5, %o3, %o3

P4297: !ST [10] (maybe <- 0x2000090) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P4298: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P4299: !ST [0] (maybe <- 0x2000091) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P4300: !CASX [9] (maybe <- 0x2000092) (Int)
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

P4301: !DWLD [1] (Int) (Branch target of P4326)
ldx [%i0 + 0], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
ba P4302
nop

TARGET4326:
ba RET4326
nop


P4302: !CAS [6] (maybe <- 0x2000093) (Int)
add %i1, 80, %l6
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

P4303: !DWLD [13] (FP)
ldd [%i3 + 64], %f4
! 1 addresses covered

P4304: !CAS [7] (maybe <- 0x2000094) (Int)
add %i1, 84, %l6
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

P4305: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P4306: !ST [9] (maybe <- 0x2000095) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P4307: !LD [13] (Int)
lduw [%i3 + 64], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P4308: !DWLD [10] (Int)
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

P4309: !CAS [1] (maybe <- 0x2000096) (Int)
add %i0, 4, %l3
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

P4310: !CAS [14] (maybe <- 0x2000097) (Int)
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

P4311: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P4312: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P4313: !CASX [13] (maybe <- 0x2000098) (Int)
add %i3, 64, %l3
ldx [%l3], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov  %o2, %o5
sllx %l4, 32, %o3
casx [%l3], %o5, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4

P4314: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P4315: !SWAP [8] (maybe <- 0x2000099) (Int)
mov %l4, %o4
swap  [%i1 + 256], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P4316: !ST [4] (maybe <- 0x200009a) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P4317: !CASX [12] (maybe <- 0x200009b) (Int)
add %i3, 0, %l7
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

P4318: !CAS [10] (maybe <- 0x200009c) (Int)
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

P4319: !CAS [9] (maybe <- 0x200009d) (Int)
add %i1, 512, %l7
lduw [%l7], %l3
mov %l3, %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2
mov %l4, %o3
cas [%l7], %l6, %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P4320: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P4321: !ST [15] (maybe <- 0x41800005) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i3 + 192 ]

P4322: !PREFETCH [1] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i0 + 4] %asi, 1

P4323: !DWST [4] (maybe <- 0x200009e) (Int)
mov %l4, %l3 
sllx %l3, 32, %l3 
stx %l3, [%i0 + 64 ] 
add   %l4, 1, %l4

P4324: !ST [10] (maybe <- 0x200009f) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P4325: !CAS [4] (maybe <- 0x20000a0) (Int)
add %i0, 64, %o5
lduw [%o5], %l6
mov %l6, %l7
! move %l7(lower) -> %o3(lower)
or %l7, %o3, %o3
mov %l4, %o4
cas [%o5], %l7, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P4326: !CASX [15] (maybe <- 0x20000a1) (Int) (CBR)
add %i3, 192, %o5
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

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET4326
nop
RET4326:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P4327: !ST [7] (maybe <- 0x20000a2) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P4328: !ST [2] (maybe <- 0x20000a3) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P4329: !LD [6] (Int) (LE)
wr %g0, 0x88, %asi
lduwa [%i1 + 80] %asi, %l7
! move %l7(lower) -> %o1(lower)
or %l7, %o1, %o1

P4330: !CASX [1] (maybe <- 0x20000a4) (Int) (LE)
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
add %i0, 0, %l3
ldxa [%l3] %asi, %l7
! move %l7(lower) -> %o2(upper)
sllx %l7, 32, %o2
! move %l7(upper) -> %o2(lower)
srlx %l7, 32, %o5
or %o5, %o2, %o2
mov %l7, %o5
mov  %l6, %l7
casxa [%l3] %asi, %o5, %l7
! move %l7(lower) -> %o3(upper)
sllx %l7, 32, %o3
! move %l7(upper) -> %o3(lower)
srlx %l7, 32, %l3
or %l3, %o3, %o3
add  %l4, 1, %l4

P4331: !MEMBAR (Int)
membar #StoreLoad

P4332: !CAS [14] (maybe <- 0x20000a6) (Int)
add %i3, 128, %l3
lduw [%l3], %o4
mov %o4, %o5
! move %o5(lower) -> %o4(upper)
sllx %o5, 32, %o4
mov %l4, %l7
cas [%l3], %o5, %l7
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

P4333: !ST [7] (maybe <- 0x20000a7) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P4334: !ST [1] (maybe <- 0x20000a8) (Int) (CBR)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET4334
nop
RET4334:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P4335: !CAS [3] (maybe <- 0x20000a9) (Int)
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

P4336: !ST [14] (maybe <- 0x20000aa) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P4337: !DWST [9] (maybe <- 0x20000ab) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 512 ] 
add   %l4, 1, %l4

P4338: !CAS [5] (maybe <- 0x20000ac) (Int)
add %i1, 76, %l6
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

P4339: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P4340: !PREFETCH [3] (Int) (CBR)
prefetch [%i0 + 32], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET4340
nop
RET4340:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P4341: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P4342: !DWLD [14] (Int) (LE)
wr %g0, 0x88, %asi
ldxa [%i3 + 128] %asi, %l7
! move %l7(lower) -> %o2(upper)
sllx %l7, 32, %o2

P4343: !ST [0] (maybe <- 0x41800006) (FP) (Branch target of P4448)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i0 + 0 ]
ba P4344
nop

TARGET4448:
ba RET4448
nop


P4344: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P4345: !CASX [8] (maybe <- 0x20000ad) (Int)
add %i1, 256, %o5
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

P4346: !CASX [9] (maybe <- 0x20000ae) (Int) (LE)
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
add %i1, 512, %o5
ldxa [%o5] %asi, %l6
! move %l6(lower) -> %o4(lower)
srl %l6, 0, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5
! move %l6(upper) -> %o0(upper)
or %l6, %g0, %o0
mov  %l6, %l7
mov  %l3, %l6
casxa [%o5] %asi, %l7, %l6
! move %l6(lower) -> %o0(lower)
srlx %o0, 32, %o0
sllx %o0, 32, %o0
srl %l6, 0, %o5
or %o5, %o0, %o0
! move %l6(upper) -> %o1(upper)
or %l6, %g0, %o1
add  %l4, 1, %l4

P4347: !ST [12] (maybe <- 0x20000af) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P4348: !ST [3] (maybe <- 0x20000b0) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P4349: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P4350: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P4351: !CAS [8] (maybe <- 0x20000b1) (Int)
add %i1, 256, %l6
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

P4352: !ST [11] (maybe <- 0x20000b2) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P4353: !ST [4] (maybe <- 0x20000b3) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P4354: !LD [8] (Int)
lduw [%i1 + 256], %o5
! move %o5(lower) -> %o2(lower)
or %o5, %o2, %o2

P4355: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P4356: !CASX [10] (maybe <- 0x20000b4) (Int)
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

P4357: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P4358: !ST [10] (maybe <- 0x41800007) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i2 + 32 ]

P4359: !ST [10] (maybe <- 0x20000b5) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P4360: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P4361: !PREFETCH [1] (Int) (CBR)
prefetch [%i0 + 4], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET4361
nop
RET4361:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P4362: !ST [10] (maybe <- 0x20000b6) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P4363: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P4364: !CAS [5] (maybe <- 0x20000b7) (Int)
add %i1, 76, %o5
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

P4365: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P4366: !ST [10] (maybe <- 0x20000b8) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P4367: !ST [5] (maybe <- 0x20000b9) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P4368: !ST [5] (maybe <- 0x20000ba) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P4369: !CASX [13] (maybe <- 0x20000bb) (Int)
add %i3, 64, %l3
ldx [%l3], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
mov  %o1, %o5
sllx %l4, 32, %o2
casx [%l3], %o5, %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
add  %l4, 1, %l4

P4370: !ST [5] (maybe <- 0x20000bc) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P4371: !ST [14] (maybe <- 0x20000bd) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P4372: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P4373: !CASX [10] (maybe <- 0x20000be) (Int)
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

P4374: !CASX [15] (maybe <- 0x20000bf) (Int)
add %i3, 192, %l7
ldx [%l7], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l6
sllx %l4, 32, %o1
casx [%l7], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P4375: !ST [11] (maybe <- 0x20000c0) (Int) (CBR)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET4375
nop
RET4375:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P4376: !ST [2] (maybe <- 0x20000c1) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P4377: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P4378: !ST [0] (maybe <- 0x20000c2) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P4379: !ST [3] (maybe <- 0x41800008) (FP) (CBR)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i0 + 32 ]

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET4379
nop
RET4379:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P4380: !ST [14] (maybe <- 0x20000c3) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P4381: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P4382: !ST [14] (maybe <- 0x20000c4) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P4383: !PREFETCH [7] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i1 + 84] %asi, 1

P4384: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P4385: !CAS [8] (maybe <- 0x20000c5) (Int)
add %i1, 256, %l7
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

P4386: !REPLACEMENT [7] (Int)
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

P4387: !ST [7] (maybe <- 0x20000c6) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P4388: !DWLD [0] (FP)
ldd [%i0 + 0], %f18
! 2 addresses covered
fmovs %f18, %f5
fmovs %f19, %f6

P4389: !ST [15] (maybe <- 0x20000c7) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P4390: !SWAP [15] (maybe <- 0x20000c8) (Int)
mov %l4, %o3
swap  [%i3 + 192], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P4391: !ST [6] (maybe <- 0x20000c9) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P4392: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P4393: !REPLACEMENT [6] (Int) (CBR)
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
be,pn  %xcc, TARGET4393
nop
RET4393:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P4394: !REPLACEMENT [12] (Int)
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

P4395: !CAS [14] (maybe <- 0x20000ca) (Int)
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

P4396: !ST [0] (maybe <- 0x20000cb) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P4397: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P4398: !CASX [2] (maybe <- 0x20000cc) (Int) (LE)
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
sllx %l3, 32, %l3
wr %g0, 0x88, %asi
add %i0, 8, %o5
ldxa [%o5] %asi, %l6
! move %l6(lower) -> %o4(lower)
srl %l6, 0, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5
! move %l6(upper) -> %o0(upper)
or %l6, %g0, %o0
mov  %l6, %l7
mov  %l3, %l6
casxa [%o5] %asi, %l7, %l6
! move %l6(lower) -> %o0(lower)
srlx %o0, 32, %o0
sllx %o0, 32, %o0
srl %l6, 0, %o5
or %o5, %o0, %o0
! move %l6(upper) -> %o1(upper)
or %l6, %g0, %o1
add  %l4, 1, %l4

P4399: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P4400: !ST [7] (maybe <- 0x20000cd) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P4401: !CAS [9] (maybe <- 0x20000ce) (Int)
add %i1, 512, %l7
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

P4402: !MEMBAR (Int)
membar #StoreLoad

P4403: !CAS [14] (maybe <- 0x20000cf) (Int)
add %i3, 128, %l7
lduw [%l7], %l3
mov %l3, %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2
mov %l4, %o3
cas [%l7], %l6, %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P4404: !CASX [6] (maybe <- 0x20000d0) (Int) (LE)
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
add %i1, 80, %l7
ldxa [%l7] %asi, %l3
! move %l3(lower) -> %o3(lower)
srl %l3, 0, %l6
or %l6, %o3, %o3
! move %l3(upper) -> %o4(upper)
or %l3, %g0, %o4
mov %l3, %l6
mov  %o5, %l3
casxa [%l7] %asi, %l6, %l3
! move %l3(lower) -> %o4(lower)
srlx %o4, 32, %o4
sllx %o4, 32, %o4
srl %l3, 0, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5
! move %l3(upper) -> %o0(upper)
or %l3, %g0, %o0
add  %l4, 1, %l4

P4405: !CASX [9] (maybe <- 0x20000d2) (Int)
add %i1, 512, %l7
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

P4406: !CAS [13] (maybe <- 0x20000d3) (Int)
add %i3, 64, %l7
lduw [%l7], %l3
mov %l3, %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2
mov %l4, %o3
cas [%l7], %l6, %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P4407: !CAS [2] (maybe <- 0x20000d4) (Int)
add %i0, 12, %l7
lduw [%l7], %l3
mov %l3, %l6
! move %l6(lower) -> %o3(lower)
or %l6, %o3, %o3
mov %l4, %o4
cas [%l7], %l6, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P4408: !CASX [0] (maybe <- 0x20000d5) (Int)
add %i0, 0, %l7
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

P4409: !CAS [13] (maybe <- 0x20000d7) (Int)
add %i3, 64, %l7
lduw [%l7], %l3
mov %l3, %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1
mov %l4, %o2
cas [%l7], %l6, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P4410: !ST [0] (maybe <- 0x20000d8) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P4411: !ST [5] (maybe <- 0x20000d9) (Int) (Branch target of P5013)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4
ba P4412
nop

TARGET5013:
ba RET5013
nop


P4412: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P4413: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P4414: !ST [3] (maybe <- 0x20000da) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P4415: !CASX [14] (maybe <- 0x20000db) (Int)
add %i3, 128, %o5
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

P4416: !CASX [9] (maybe <- 0x20000dc) (Int)
add %i1, 512, %o5
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

P4417: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P4418: !ST [0] (maybe <- 0x20000dd) (Int) (LE)
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
stwa   %l7, [%i0 + 0] %asi
add   %l4, 1, %l4

P4419: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P4420: !REPLACEMENT [4] (Int) (Branch target of P5054)
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
ba P4421
nop

TARGET5054:
ba RET5054
nop


P4421: !PREFETCH [9] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i1 + 512] %asi, 1

P4422: !CAS [11] (maybe <- 0x20000de) (Int)
add %i2, 64, %l6
lduw [%l6], %o5
mov %o5, %l3
! move %l3(lower) -> %o1(lower)
or %l3, %o1, %o1
mov %l4, %o2
cas [%l6], %l3, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P4423: !CASX [14] (maybe <- 0x20000df) (Int)
add %i3, 128, %l6
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

P4424: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P4425: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P4426: !DWST [9] (maybe <- 0x20000e0) (Int)
mov %l4, %l3 
sllx %l3, 32, %l3 
stx %l3, [%i1 + 512 ] 
add   %l4, 1, %l4

P4427: !ST [6] (maybe <- 0x41800009) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i1 + 80 ]

P4428: !CAS [12] (maybe <- 0x20000e1) (Int)
add %i3, 0, %o5
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

P4429: !CAS [14] (maybe <- 0x20000e2) (Int)
add %i3, 128, %o5
lduw [%o5], %l6
mov %l6, %l7
! move %l7(lower) -> %o0(lower)
or %l7, %o0, %o0
mov %l4, %o1
cas [%o5], %l7, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P4430: !CASX [6] (maybe <- 0x20000e3) (Int)
add %i1, 80, %o5
ldx [%o5], %l6
! move %l6(upper) -> %o1(lower)
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

P4431: !MEMBAR (Int)
membar #StoreLoad

P4432: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P4433: !ST [12] (maybe <- 0x20000e5) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P4434: !CAS [5] (maybe <- 0x20000e6) (Int)
add %i1, 76, %l7
lduw [%l7], %l3
mov %l3, %l6
! move %l6(lower) -> %o3(lower)
or %l6, %o3, %o3
mov %l4, %o4
cas [%l7], %l6, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P4435: !ST [3] (maybe <- 0x20000e7) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P4436: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P4437: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P4438: !ST [12] (maybe <- 0x20000e8) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P4439: !REPLACEMENT [9] (Int)
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

P4440: !ST [7] (maybe <- 0x20000e9) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P4441: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P4442: !ST [11] (maybe <- 0x20000ea) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P4443: !REPLACEMENT [1] (Int)
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

P4444: !ST [8] (maybe <- 0x20000eb) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P4445: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P4446: !ST [5] (maybe <- 0x20000ec) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P4447: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P4448: !PREFETCH [2] (Int) (CBR)
prefetch [%i0 + 12], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET4448
nop
RET4448:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P4449: !CASX [6] (maybe <- 0x20000ed) (Int)
add %i1, 80, %o5
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
mov %l6, %l7
sllx %l4, 32, %l6
add  %l4, 1, %l4
or   %l4, %l6, %l6
casx [%o5], %l7, %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %o5
or %o5, %o0, %o0
! move %l6(lower) -> %o1(upper)
sllx %l6, 32, %o1
add  %l4, 1, %l4

P4450: !CASX [8] (maybe <- 0x20000ef) (Int) (CBR)
add %i1, 256, %o5
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

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET4450
nop
RET4450:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P4451: !ST [8] (maybe <- 0x20000f0) (Int) (CBR)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET4451
nop
RET4451:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P4452: !CAS [14] (maybe <- 0x20000f1) (Int)
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

P4453: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P4454: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P4455: !CAS [5] (maybe <- 0x20000f2) (Int)
add %i1, 76, %l3
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

P4456: !CASX [1] (maybe <- 0x20000f3) (Int) (LE)
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
add %i0, 0, %l3
ldxa [%l3] %asi, %l7
! move %l7(lower) -> %o0(lower)
srl %l7, 0, %o5
or %o5, %o0, %o0
! move %l7(upper) -> %o1(upper)
or %l7, %g0, %o1
mov %l7, %o5
mov  %l6, %l7
casxa [%l3] %asi, %o5, %l7
! move %l7(lower) -> %o1(lower)
srlx %o1, 32, %o1
sllx %o1, 32, %o1
srl %l7, 0, %l3
or %l3, %o1, %o1
! move %l7(upper) -> %o2(upper)
or %l7, %g0, %o2
add  %l4, 1, %l4

P4457: !CASX [15] (maybe <- 0x20000f5) (Int)
add %i3, 192, %l3
ldx [%l3], %l7
! move %l7(upper) -> %o2(lower)
srlx %o2, 32, %o2
sllx %o2, 32, %o2
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

P4458: !CAS [1] (maybe <- 0x20000f6) (Int)
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

P4459: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P4460: !CAS [5] (maybe <- 0x20000f7) (Int)
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

P4461: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P4462: !CASX [0] (maybe <- 0x20000f8) (Int)
add %i0, 0, %l3
ldx [%l3], %l7
! move %l7(upper) -> %o1(lower)
srlx %l7, 32, %o5
or %o5, %o1, %o1
! move %l7(lower) -> %o2(upper)
sllx %l7, 32, %o2
mov %l7, %o5
sllx %l4, 32, %l7
add  %l4, 1, %l4
or   %l4, %l7, %l7
casx [%l3], %o5, %l7
! move %l7(upper) -> %o2(lower)
srlx %l7, 32, %l3
or %l3, %o2, %o2
! move %l7(lower) -> %o3(upper)
sllx %l7, 32, %o3
add  %l4, 1, %l4

P4463: !CASX [5] (maybe <- 0x20000fa) (Int)
add %i1, 72, %l3
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

P4464: !ST [10] (maybe <- 0x20000fb) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P4465: !CAS [15] (maybe <- 0x20000fc) (Int)
add %i3, 192, %o5
lduw [%o5], %l6
mov %l6, %l7
! move %l7(lower) -> %o0(lower)
or %l7, %o0, %o0
mov %l4, %o1
cas [%o5], %l7, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P4466: !CASX [4] (maybe <- 0x20000fd) (Int) (CBR)
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

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET4466
nop
RET4466:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P4467: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P4468: !CASX [9] (maybe <- 0x20000fe) (Int)
add %i1, 512, %l3
ldx [%l3], %l7
! move %l7(upper) -> %o3(lower)
srlx %l7, 32, %o5
or %o5, %o3, %o3
! move %l7(lower) -> %o4(upper)
sllx %l7, 32, %o4
mov  %l7, %o5
sllx %l4, 32, %l7
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

P4469: !CASX [3] (maybe <- 0x20000ff) (Int)
add %i0, 32, %l3
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

P4470: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P4471: !ST [2] (maybe <- 0x2000100) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P4472: !ST [11] (maybe <- 0x2000101) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P4473: !ST [2] (maybe <- 0x2000102) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P4474: !CAS [12] (maybe <- 0x2000103) (Int)
add %i3, 0, %l6
lduw [%l6], %o5
mov %o5, %l3
! move %l3(lower) -> %o2(lower)
or %l3, %o2, %o2
mov %l4, %o3
cas [%l6], %l3, %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P4475: !ST [0] (maybe <- 0x2000104) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P4476: !CAS [12] (maybe <- 0x2000105) (Int)
add %i3, 0, %l3
lduw [%l3], %l7
mov %l7, %o5
! move %o5(lower) -> %o3(lower)
or %o5, %o3, %o3
mov %l4, %o4
cas [%l3], %o5, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P4477: !CAS [11] (maybe <- 0x2000106) (Int)
add %i2, 64, %l3
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

P4478: !CASX [4] (maybe <- 0x2000107) (Int)
add %i0, 64, %l3
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

P4479: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P4480: !CASX [14] (maybe <- 0x2000108) (Int) (LE)
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
add %i3, 128, %l3
ldxa [%l3] %asi, %l7
! move %l7(lower) -> %o2(lower)
srl %l7, 0, %o5
or %o5, %o2, %o2
! move %l7(upper) -> %o3(upper)
or %l7, %g0, %o3
mov  %l7, %o5
mov  %l6, %l7
casxa [%l3] %asi, %o5, %l7
! move %l7(lower) -> %o3(lower)
srlx %o3, 32, %o3
sllx %o3, 32, %o3
srl %l7, 0, %l3
or %l3, %o3, %o3
! move %l7(upper) -> %o4(upper)
or %l7, %g0, %o4
add  %l4, 1, %l4

P4481: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P4482: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P4483: !ST [4] (maybe <- 0x2000109) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P4484: !PREFETCH [7] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i1 + 84] %asi, 1

P4485: !DWLD [4] (Int)
ldx [%i0 + 64], %o5
! move %o5(upper) -> %o4(lower)
srlx %o4, 32, %o4
sllx %o4, 32, %o4
srlx %o5, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P4486: !ST [9] (maybe <- 0x200010a) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P4487: !PREFETCH [8] (Int) (Branch target of P4130)
prefetch [%i1 + 256], 1
ba P4488
nop

TARGET4130:
ba RET4130
nop


P4488: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P4489: !ST [7] (maybe <- 0x200010b) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P4490: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P4491: !ST [10] (maybe <- 0x200010c) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P4492: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P4493: !ST [4] (maybe <- 0x200010d) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P4494: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P4495: !ST [2] (maybe <- 0x200010e) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P4496: !CASX [15] (maybe <- 0x200010f) (Int)
add %i3, 192, %l3
ldx [%l3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %o5
sllx %l4, 32, %o1
casx [%l3], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P4497: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P4498: !DWST [8] (maybe <- 0x2000110) (Int)
mov %l4, %o5 
sllx %o5, 32, %o5 
stx %o5, [%i1 + 256 ] 
add   %l4, 1, %l4

P4499: !CAS [7] (maybe <- 0x2000111) (Int) (Branch target of P4131)
add %i1, 84, %o5
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
ba P4500
nop

TARGET4131:
ba RET4131
nop


P4500: !DWST [2] (maybe <- 0x2000112) (Int)
mov %l4, %l7 
stx %l7, [%i0 + 8]
add   %l4, 1, %l4

P4501: !MEMBAR (Int)
membar #StoreLoad

P4502: !CASX [4] (maybe <- 0x2000113) (Int)
add %i0, 64, %l7
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

P4503: !DWLD [5] (Int)
ldx [%i1 + 72], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P4504: !CAS [12] (maybe <- 0x2000114) (Int)
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

P4505: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P4506: !ST [9] (maybe <- 0x2000115) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P4507: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P4508: !ST [15] (maybe <- 0x2000116) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P4509: !DWST [0] (maybe <- 0x2000117) (Int)
sllx %l4, 32, %l6 
add   %l4, 1, %l4
or %l6, %l4, %l6
stx %l6, [%i0 + 0]
add   %l4, 1, %l4

P4510: !PREFETCH [12] (Int) (Branch target of P5085)
prefetch [%i3 + 0], 1
ba P4511
nop

TARGET5085:
ba RET5085
nop


P4511: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P4512: !ST [2] (maybe <- 0x2000119) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P4513: !ST [5] (maybe <- 0x200011a) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P4514: !PREFETCH [8] (Int) (CBR)
prefetch [%i1 + 256], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET4514
nop
RET4514:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P4515: !ST [15] (maybe <- 0x200011b) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P4516: !CASX [0] (maybe <- 0x200011c) (Int) (Branch target of P4901)
add %i0, 0, %o5
ldx [%o5], %l6
! move %l6(upper) -> %o1(lower)
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
ba P4517
nop

TARGET4901:
ba RET4901
nop


P4517: !CASX [11] (maybe <- 0x200011e) (Int)
add %i2, 64, %o5
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

P4518: !ST [10] (maybe <- 0x200011f) (Int) (LE)
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
stwa   %l7, [%i2 + 32] %asi
add   %l4, 1, %l4

P4519: !CAS [13] (maybe <- 0x2000120) (Int)
add %i3, 64, %l7
lduw [%l7], %l3
mov %l3, %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0
mov %l4, %o1
cas [%l7], %l6, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P4520: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P4521: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P4522: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P4523: !REPLACEMENT [5] (Int)
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

P4524: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P4525: !MEMBAR (Int)
membar #StoreLoad

P4526: !CAS [15] (maybe <- 0x2000121) (Int) (Branch target of P4748)
add %i3, 192, %l6
lduw [%l6], %o5
mov %o5, %l3
! move %l3(lower) -> %o1(lower)
or %l3, %o1, %o1
mov %l4, %o2
cas [%l6], %l3, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4
ba P4527
nop

TARGET4748:
ba RET4748
nop


P4527: !DWLD [5] (Int)
ldx [%i1 + 72], %l6
! move %l6(lower) -> %o2(lower)
srl %l6, 0, %l3
or %l3, %o2, %o2

P4528: !NOP (Int)
nop

P4529: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P4530: !CASX [7] (maybe <- 0x2000122) (Int)
add %i1, 80, %o5
ldx [%o5], %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
mov %o3, %l7
sllx %l4, 32, %o4
add  %l4, 1, %l4
or   %l4, %o4, %o4
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

P4531: !MEMBAR (Int)
membar #StoreLoad

P4532: !CAS [1] (maybe <- 0x2000124) (Int)
add %i0, 4, %o5
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

P4533: !ST [12] (maybe <- 0x4180000a) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i3 + 0 ]

P4534: !ST [0] (maybe <- 0x2000125) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P4535: !ST [14] (maybe <- 0x2000126) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P4536: !CASX [4] (maybe <- 0x2000127) (Int)
add %i0, 64, %l3
ldx [%l3], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
mov  %o1, %o5
sllx %l4, 32, %o2
casx [%l3], %o5, %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
add  %l4, 1, %l4

P4537: !DWST [15] (maybe <- 0x2000128) (Int) (Branch target of P4149)
mov %l4, %o5 
sllx %o5, 32, %o5 
stx %o5, [%i3 + 192 ] 
add   %l4, 1, %l4
ba P4538
nop

TARGET4149:
ba RET4149
nop


P4538: !ST [9] (maybe <- 0x2000129) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P4539: !CAS [11] (maybe <- 0x200012a) (Int)
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

P4540: !ST [7] (maybe <- 0x200012b) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P4541: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P4542: !ST [0] (maybe <- 0x200012c) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P4543: !CASX [14] (maybe <- 0x200012d) (Int)
add %i3, 128, %l3
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

P4544: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P4545: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P4546: !ST [6] (maybe <- 0x200012e) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P4547: !ST [13] (maybe <- 0x4180000b) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i3 + 64 ]

P4548: !ST [1] (maybe <- 0x4180000c) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i0 + 4 ]

P4549: !CAS [1] (maybe <- 0x200012f) (Int)
add %i0, 4, %l6
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

P4550: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P4551: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P4552: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P4553: !REPLACEMENT [14] (Int)
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

P4554: !ST [1] (maybe <- 0x2000130) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P4555: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P4556: !CAS [15] (maybe <- 0x2000131) (Int) (Branch target of P4340)
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
ba P4557
nop

TARGET4340:
ba RET4340
nop


P4557: !CASX [3] (maybe <- 0x2000132) (Int)
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

P4558: !CAS [12] (maybe <- 0x2000133) (Int)
add %i3, 0, %o5
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

P4559: !CASX [15] (maybe <- 0x2000134) (Int)
add %i3, 192, %o5
ldx [%o5], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
mov  %o1, %l7
sllx %l4, 32, %o2
casx [%o5], %l7, %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
add  %l4, 1, %l4

P4560: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P4561: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P4562: !ST [10] (maybe <- 0x2000135) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P4563: !ST [12] (maybe <- 0x2000136) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P4564: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P4565: !MEMBAR (Int) (Branch target of P4393)
membar #StoreLoad
ba P4566
nop

TARGET4393:
ba RET4393
nop


P4566: !ST [6] (maybe <- 0x2000137) (Int) (Branch target of P5029)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4
ba P4567
nop

TARGET5029:
ba RET5029
nop


P4567: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P4568: !MEMBAR (Int)
membar #StoreLoad

P4569: !CASX [4] (maybe <- 0x2000138) (Int)
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

P4570: !DWLD [6] (Int)
ldx [%i1 + 80], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)

P4571: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P4572: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P4573: !CAS [2] (maybe <- 0x2000139) (Int)
add %i0, 12, %l7
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

P4574: !DWLD [2] (Int)
ldx [%i0 + 8], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P4575: !ST [15] (maybe <- 0x200013a) (Int) (LE)
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
stwa   %o5, [%i3 + 192] %asi
add   %l4, 1, %l4

P4576: !ST [10] (maybe <- 0x200013b) (Int) (Branch target of P4361)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4
ba P4577
nop

TARGET4361:
ba RET4361
nop


P4577: !ST [13] (maybe <- 0x200013c) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P4578: !CAS [12] (maybe <- 0x200013d) (Int) (LE)
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
add %i3, 0, %l6
lduwa [%l6] %asi, %o5
mov %o5, %l3
! move %l3(lower) -> %o2(lower)
or %l3, %o2, %o2
mov %l7, %o3
casa [%l6] %asi, %l3, %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P4579: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P4580: !ST [1] (maybe <- 0x200013e) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P4581: !CASX [11] (maybe <- 0x200013f) (Int)
add %i2, 64, %l3
ldx [%l3], %l7
! move %l7(upper) -> %o3(lower)
srlx %l7, 32, %o5
or %o5, %o3, %o3
! move %l7(lower) -> %o4(upper)
sllx %l7, 32, %o4
mov  %l7, %o5
sllx %l4, 32, %l7
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

P4582: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P4583: !REPLACEMENT [12] (Int)
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

P4584: !ST [6] (maybe <- 0x2000140) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P4585: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P4586: !ST [10] (maybe <- 0x2000141) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P4587: !CASX [6] (maybe <- 0x2000142) (Int)
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

P4588: !CASX [5] (maybe <- 0x2000144) (Int)
add %i1, 72, %l6
ldx [%l6], %o5
! move %o5(upper) -> %o2(lower)
srlx %o5, 32, %l3
or %l3, %o2, %o2
! move %o5(lower) -> %o3(upper)
sllx %o5, 32, %o3
mov  %o5, %l3
mov %l4, %o5
casx [%l6], %l3, %o5
! move %o5(upper) -> %o3(lower)
srlx %o5, 32, %l6
or %l6, %o3, %o3
! move %o5(lower) -> %o4(upper)
sllx %o5, 32, %o4
add  %l4, 1, %l4

P4589: !ST [7] (maybe <- 0x2000145) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P4590: !MEMBAR (Int)
membar #StoreLoad

P4591: !DWLD [7] (Int)
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

P4592: !CASX [4] (maybe <- 0x2000146) (Int)
add %i0, 64, %l7
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

P4593: !ST [3] (maybe <- 0x2000147) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P4594: !CASX [13] (maybe <- 0x2000148) (Int)
add %i3, 64, %l6
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

P4595: !CAS [5] (maybe <- 0x2000149) (Int)
add %i1, 76, %l6
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

P4596: !CASX [8] (maybe <- 0x200014a) (Int)
add %i1, 256, %l6
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

P4597: !CAS [3] (maybe <- 0x200014b) (Int)
add %i0, 32, %l6
lduw [%l6], %o5
mov %o5, %l3
! move %l3(lower) -> %o2(lower)
or %l3, %o2, %o2
mov %l4, %o3
cas [%l6], %l3, %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P4598: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P4599: !CASX [4] (maybe <- 0x200014c) (Int)
add %i0, 64, %l6
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

P4600: !ST [2] (maybe <- 0x200014d) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P4601: !LD [5] (Int)
lduw [%i1 + 76], %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0

P4602: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P4603: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P4604: !CASX [2] (maybe <- 0x200014e) (Int)
add %i0, 8, %l7
ldx [%l7], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
mov  %o1, %l6
mov %l4, %o2
casx [%l7], %l6, %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
add  %l4, 1, %l4

P4605: !LD [8] (Int)
lduw [%i1 + 256], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P4606: !ST [7] (maybe <- 0x200014f) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P4607: !CASX [7] (maybe <- 0x2000150) (Int)
add %i1, 80, %o5
ldx [%o5], %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %l7
or %l7, %o3, %o3
! move %l6(lower) -> %o4(upper)
sllx %l6, 32, %o4
mov %l6, %l7
sllx %l4, 32, %l6
add  %l4, 1, %l4
or   %l4, %l6, %l6
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

P4608: !CASX [4] (maybe <- 0x2000152) (Int)
add %i0, 64, %o5
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

P4609: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P4610: !ST [0] (maybe <- 0x2000153) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P4611: !ST [1] (maybe <- 0x2000154) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P4612: !CASX [10] (maybe <- 0x2000155) (Int)
add %i2, 32, %l6
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

P4613: !ST [7] (maybe <- 0x2000156) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P4614: !REPLACEMENT [13] (Int) (Branch target of P4675)
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
ba P4615
nop

TARGET4675:
ba RET4675
nop


P4615: !CASX [15] (maybe <- 0x2000157) (Int)
add %i3, 192, %o5
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

P4616: !CASX [5] (maybe <- 0x2000158) (Int)
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

P4617: !ST [1] (maybe <- 0x2000159) (Int) (CBR)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET4617
nop
RET4617:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P4618: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P4619: !REPLACEMENT [10] (Int)
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

P4620: !ST [6] (maybe <- 0x200015a) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P4621: !ST [5] (maybe <- 0x200015b) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P4622: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P4623: !ST [15] (maybe <- 0x200015c) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P4624: !PREFETCH [5] (Int) (CBR)
prefetch [%i1 + 76], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET4624
nop
RET4624:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P4625: !DWST [7] (maybe <- 0x200015d) (Int)
sllx %l4, 32, %o5 
add   %l4, 1, %l4
or %o5, %l4, %o5
stx %o5, [%i1 + 80]
add   %l4, 1, %l4

P4626: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P4627: !CASX [2] (maybe <- 0x200015f) (Int)
add %i0, 8, %o5
ldx [%o5], %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %l7
or %l7, %o3, %o3
! move %l6(lower) -> %o4(upper)
sllx %l6, 32, %o4
mov  %l6, %l7
mov %l4, %l6
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

P4628: !DWLD [4] (Int)
ldx [%i0 + 64], %o5
! move %o5(upper) -> %o0(lower)
srlx %o5, 32, %l7
or %l7, %o0, %o0

P4629: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P4630: !ST [3] (maybe <- 0x2000160) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P4631: !ST [10] (maybe <- 0x2000161) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P4632: !CAS [10] (maybe <- 0x2000162) (Int)
add %i2, 32, %o5
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

P4633: !LD [2] (Int)
lduw [%i0 + 12], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P4634: !ST [6] (maybe <- 0x2000163) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P4635: !CASX [8] (maybe <- 0x2000164) (Int) (Branch target of P4514)
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
ba P4636
nop

TARGET4514:
ba RET4514
nop


P4636: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P4637: !CAS [8] (maybe <- 0x2000165) (Int)
add %i1, 256, %l3
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

P4638: !ST [14] (maybe <- 0x2000166) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P4639: !ST [12] (maybe <- 0x2000167) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P4640: !CAS [7] (maybe <- 0x2000168) (Int)
add %i1, 84, %l7
lduw [%l7], %l3
mov %l3, %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0
mov %l4, %o1
cas [%l7], %l6, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P4641: !ST [8] (maybe <- 0x2000169) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P4642: !ST [1] (maybe <- 0x200016a) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P4643: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P4644: !CAS [14] (maybe <- 0x200016b) (Int)
add %i3, 128, %l3
lduw [%l3], %l7
mov %l7, %o5
! move %o5(lower) -> %o1(lower)
or %o5, %o1, %o1
mov %l4, %o2
cas [%l3], %o5, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P4645: !CASX [14] (maybe <- 0x200016c) (Int)
add %i3, 128, %l3
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

P4646: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P4647: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P4648: !CAS [3] (maybe <- 0x200016d) (Int)
add %i0, 32, %l3
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

P4649: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P4650: !CASX [8] (maybe <- 0x200016e) (Int) (Branch target of P4900)
add %i1, 256, %l3
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
ba P4651
nop

TARGET4900:
ba RET4900
nop


P4651: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P4652: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P4653: !DWST [8] (maybe <- 0x200016f) (Int)
mov %l4, %o5 
sllx %o5, 32, %o5 
stx %o5, [%i1 + 256 ] 
add   %l4, 1, %l4

P4654: !LD [4] (Int)
lduw [%i0 + 64], %o5
! move %o5(lower) -> %o2(lower)
or %o5, %o2, %o2

P4655: !LD [5] (Int)
lduw [%i1 + 76], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P4656: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P4657: !ST [0] (maybe <- 0x2000170) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P4658: !PREFETCH [6] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i1 + 80] %asi, 1

P4659: !CAS [9] (maybe <- 0x2000171) (Int)
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

P4660: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P4661: !ST [15] (maybe <- 0x2000172) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P4662: !CASX [0] (maybe <- 0x2000173) (Int)
add %i0, 0, %l6
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
mov %o5, %l3
sllx %l4, 32, %o5
add  %l4, 1, %l4
or   %l4, %o5, %o5
casx [%l6], %l3, %o5
! move %o5(upper) -> %o0(lower)
srlx %o5, 32, %l6
or %l6, %o0, %o0
! move %o5(lower) -> %o1(upper)
sllx %o5, 32, %o1
add  %l4, 1, %l4

P4663: !ST [14] (maybe <- 0x2000175) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P4664: !DWST [3] (maybe <- 0x2000176) (Int)
mov %l4, %o5 
sllx %o5, 32, %o5 
stx %o5, [%i0 + 32 ] 
add   %l4, 1, %l4

P4665: !CASX [15] (maybe <- 0x2000177) (Int) (LE)
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
add %i3, 192, %o5
ldxa [%o5] %asi, %l6
! move %l6(lower) -> %o1(lower)
srl %l6, 0, %l7
or %l7, %o1, %o1
! move %l6(upper) -> %o2(upper)
or %l6, %g0, %o2
mov  %l6, %l7
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

P4666: !ST [2] (maybe <- 0x2000178) (Int) (Branch target of P4828)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4
ba P4667
nop

TARGET4828:
ba RET4828
nop


P4667: !DWLD [0] (Int)
ldx [%i0 + 0], %l7
! move %l7(upper) -> %o3(lower)
srlx %o3, 32, %o3
sllx %o3, 32, %o3
srlx %l7, 32, %l6
or %l6, %o3, %o3
! move %l7(lower) -> %o4(upper)
sllx %l7, 32, %o4

P4668: !DWST [15] (maybe <- 0x4180000d) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
std %f20, [%i3 + 192]

P4669: !ST [13] (maybe <- 0x2000179) (Int) (LE)
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
stwa   %l7, [%i3 + 64] %asi
add   %l4, 1, %l4

P4670: !CAS [13] (maybe <- 0x200017a) (Int)
add %i3, 64, %l7
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

P4671: !CASX [14] (maybe <- 0x200017b) (Int) (Branch target of P4830)
add %i3, 128, %l7
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
ba P4672
nop

TARGET4830:
ba RET4830
nop


P4672: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P4673: !ST [13] (maybe <- 0x200017c) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P4674: !ST [7] (maybe <- 0x200017d) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P4675: !PREFETCH [5] (Int) (LE) (CBR)
wr %g0, 0x88, %asi
prefetcha [%i1 + 76] %asi, 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET4675
nop
RET4675:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P4676: !DWLD [11] (Int)
ldx [%i2 + 64], %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l3
or %l3, %o2, %o2

P4677: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P4678: !CASX [13] (maybe <- 0x200017e) (Int)
add %i3, 64, %o5
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

P4679: !CASX [0] (maybe <- 0x200017f) (Int)
add %i0, 0, %o5
ldx [%o5], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l7
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%o5], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P4680: !PREFETCH [6] (Int) (Branch target of P5092)
prefetch [%i1 + 80], 1
ba P4681
nop

TARGET5092:
ba RET5092
nop


P4681: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P4682: !DWLD [10] (Int)
ldx [%i2 + 32], %o2
! move %o2(upper) -> %o2(upper)

P4683: !ST [3] (maybe <- 0x4180000e) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i0 + 32 ]

P4684: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P4685: !ST [15] (maybe <- 0x2000181) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P4686: !CAS [13] (maybe <- 0x2000182) (Int) (LE)
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
lduwa [%o5] %asi, %l6
mov %l6, %l7
! move %l7(lower) -> %o2(lower)
srlx %o2, 32, %o2
sllx %o2, 32, %o2
or %l7, %o2, %o2
mov %l3, %o3
casa [%o5] %asi, %l7, %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P4687: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P4688: !REPLACEMENT [14] (Int)
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

P4689: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P4690: !DWST [2] (maybe <- 0x2000183) (Int)
mov %l4, %l6 
stx %l6, [%i0 + 8]
add   %l4, 1, %l4

P4691: !CAS [4] (maybe <- 0x2000184) (Int)
add %i0, 64, %l6
lduw [%l6], %o5
mov %o5, %l3
! move %l3(lower) -> %o3(lower)
or %l3, %o3, %o3
mov %l4, %o4
cas [%l6], %l3, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P4692: !ST [4] (maybe <- 0x2000185) (Int) (Branch target of P5088)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4
ba P4693
nop

TARGET5088:
ba RET5088
nop


P4693: !ST [0] (maybe <- 0x2000186) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P4694: !ST [11] (maybe <- 0x4180000f) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i2 + 64 ]

P4695: !ST [8] (maybe <- 0x2000187) (Int) (Branch target of P4379)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4
ba P4696
nop

TARGET4379:
ba RET4379
nop


P4696: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P4697: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P4698: !CAS [14] (maybe <- 0x2000188) (Int)
add %i3, 128, %l6
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

P4699: !CAS [4] (maybe <- 0x2000189) (Int)
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

P4700: !CASX [3] (maybe <- 0x200018a) (Int)
add %i0, 32, %l6
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

P4701: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P4702: !ST [0] (maybe <- 0x200018b) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P4703: !CASX [0] (maybe <- 0x200018c) (Int)
add %i0, 0, %l3
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

P4704: !ST [6] (maybe <- 0x200018e) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P4705: !REPLACEMENT [4] (Int)
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

P4706: !ST [15] (maybe <- 0x200018f) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P4707: !ST [1] (maybe <- 0x2000190) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P4708: !ST [10] (maybe <- 0x2000191) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P4709: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P4710: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P4711: !CASX [6] (maybe <- 0x2000192) (Int)
add %i1, 80, %o5
ldx [%o5], %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l7
or %l7, %o0, %o0
! move %l6(lower) -> %o1(upper)
sllx %l6, 32, %o1
mov %l6, %l7
sllx %l4, 32, %l6
add  %l4, 1, %l4
or   %l4, %l6, %l6
casx [%o5], %l7, %l6
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %o5
or %o5, %o1, %o1
! move %l6(lower) -> %o2(upper)
sllx %l6, 32, %o2
add  %l4, 1, %l4

P4712: !ST [2] (maybe <- 0x41800010) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i0 + 12 ]

P4713: !ST [12] (maybe <- 0x2000194) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P4714: !CASX [1] (maybe <- 0x2000195) (Int)
add %i0, 0, %l6
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

P4715: !CAS [0] (maybe <- 0x2000197) (Int)
add %i0, 0, %l6
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

P4716: !CASX [9] (maybe <- 0x2000198) (Int)
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

P4717: !CASX [14] (maybe <- 0x2000199) (Int)
add %i3, 128, %l6
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

P4718: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P4719: !MEMBAR (Int)
membar #StoreLoad

P4720: !ST [14] (maybe <- 0x200019a) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P4721: !ST [7] (maybe <- 0x200019b) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P4722: !LD [13] (Int)
lduw [%i3 + 64], %o5
! move %o5(lower) -> %o4(lower)
or %o5, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P4723: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P4724: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P4725: !CASX [3] (maybe <- 0x200019c) (Int)
add %i0, 32, %l6
ldx [%l6], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l3
sllx %l4, 32, %o1
casx [%l6], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P4726: !CASX [14] (maybe <- 0x200019d) (Int)
add %i3, 128, %l6
ldx [%l6], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov  %o2, %l3
sllx %l4, 32, %o3
casx [%l6], %l3, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4

P4727: !ST [15] (maybe <- 0x200019e) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P4728: !ST [3] (maybe <- 0x200019f) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P4729: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P4730: !ST [6] (maybe <- 0x41800011) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i1 + 80 ]

P4731: !CAS [0] (maybe <- 0x20001a0) (Int)
add %i0, 0, %l7
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

P4732: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P4733: !CASX [12] (maybe <- 0x20001a1) (Int)
add %i3, 0, %l7
ldx [%l7], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l6
sllx %l4, 32, %o1
casx [%l7], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P4734: !CAS [1] (maybe <- 0x20001a2) (Int)
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

P4735: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P4736: !CASX [15] (maybe <- 0x20001a3) (Int)
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

P4737: !CASX [8] (maybe <- 0x20001a4) (Int)
add %i1, 256, %l7
ldx [%l7], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l6
sllx %l4, 32, %o1
casx [%l7], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P4738: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P4739: !CASX [2] (maybe <- 0x20001a5) (Int)
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

P4740: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P4741: !ST [1] (maybe <- 0x20001a6) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P4742: !ST [15] (maybe <- 0x41800012) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i3 + 192 ]

P4743: !CAS [7] (maybe <- 0x20001a7) (Int)
add %i1, 84, %l3
lduw [%l3], %o4
mov %o4, %o5
! move %o5(lower) -> %o4(upper)
sllx %o5, 32, %o4
mov %l4, %l7
cas [%l3], %o5, %l7
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

P4744: !CASX [0] (maybe <- 0x20001a8) (Int)
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

P4745: !REPLACEMENT [5] (Int)
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

P4746: !DWST [11] (maybe <- 0x20001aa) (Int)
mov %l4, %l7 
sllx %l7, 32, %l7 
stx %l7, [%i2 + 64 ] 
add   %l4, 1, %l4

P4747: !CAS [1] (maybe <- 0x20001ab) (Int)
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

P4748: !REPLACEMENT [3] (Int) (CBR)
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
be,pt  %xcc, TARGET4748
nop
RET4748:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P4749: !ST [11] (maybe <- 0x20001ac) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P4750: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P4751: !CASX [14] (maybe <- 0x20001ad) (Int)
add %i3, 128, %l6
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

P4752: !ST [12] (maybe <- 0x20001ae) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P4753: !CAS [8] (maybe <- 0x20001af) (Int)
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

P4754: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P4755: !DWLD [13] (Int)
ldx [%i3 + 64], %o1
! move %o1(upper) -> %o1(upper)

P4756: !REPLACEMENT [3] (Int)
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

P4757: !ST [9] (maybe <- 0x20001b0) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P4758: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P4759: !ST [8] (maybe <- 0x20001b1) (Int) (LE) (CBR)
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
stwa   %o5, [%i1 + 256] %asi
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET4759
nop
RET4759:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P4760: !CASX [13] (maybe <- 0x20001b2) (Int)
add %i3, 64, %l3
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

P4761: !ST [1] (maybe <- 0x20001b3) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P4762: !CAS [7] (maybe <- 0x20001b4) (Int)
add %i1, 84, %o5
lduw [%o5], %l6
mov %l6, %l7
! move %l7(lower) -> %o3(lower)
or %l7, %o3, %o3
mov %l4, %o4
cas [%o5], %l7, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P4763: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P4764: !CAS [9] (maybe <- 0x20001b5) (Int)
add %i1, 512, %o5
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

P4765: !ST [2] (maybe <- 0x20001b6) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P4766: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P4767: !ST [5] (maybe <- 0x20001b7) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P4768: !CAS [15] (maybe <- 0x20001b8) (Int)
add %i3, 192, %l6
lduw [%l6], %o5
mov %o5, %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0
mov %l4, %o1
cas [%l6], %l3, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P4769: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P4770: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P4771: !ST [2] (maybe <- 0x20001b9) (Int) (LE)
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
stwa   %l3, [%i0 + 12] %asi
add   %l4, 1, %l4

P4772: !CAS [3] (maybe <- 0x20001ba) (Int)
add %i0, 32, %l3
lduw [%l3], %l7
mov %l7, %o5
! move %o5(lower) -> %o1(lower)
or %o5, %o1, %o1
mov %l4, %o2
cas [%l3], %o5, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P4773: !ST [4] (maybe <- 0x41800013) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i0 + 64 ]

P4774: !CAS [15] (maybe <- 0x20001bb) (Int)
add %i3, 192, %o5
lduw [%o5], %l6
mov %l6, %l7
! move %l7(lower) -> %o2(lower)
or %l7, %o2, %o2
mov %l4, %o3
cas [%o5], %l7, %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P4775: !ST [12] (maybe <- 0x20001bc) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P4776: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P4777: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P4778: !ST [6] (maybe <- 0x20001bd) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P4779: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P4780: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P4781: !REPLACEMENT [14] (Int)
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

P4782: !CASX [10] (maybe <- 0x20001be) (Int)
add %i2, 32, %l3
ldx [%l3], %l7
! move %l7(upper) -> %o3(lower)
srlx %l7, 32, %o5
or %o5, %o3, %o3
! move %l7(lower) -> %o4(upper)
sllx %l7, 32, %o4
mov  %l7, %o5
sllx %l4, 32, %l7
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

P4783: !REPLACEMENT [10] (Int)
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

P4784: !CAS [9] (maybe <- 0x20001bf) (Int)
add %i1, 512, %o5
lduw [%o5], %l6
mov %l6, %l7
! move %l7(lower) -> %o0(lower)
or %l7, %o0, %o0
mov %l4, %o1
cas [%o5], %l7, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P4785: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P4786: !ST [9] (maybe <- 0x20001c0) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P4787: !CASX [8] (maybe <- 0x20001c1) (Int)
add %i1, 256, %l7
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

P4788: !ST [12] (maybe <- 0x20001c2) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P4789: !CASX [2] (maybe <- 0x20001c3) (Int)
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

P4790: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P4791: !DWST [13] (maybe <- 0x20001c4) (Int) (Branch target of P4759)
mov %l4, %l3 
sllx %l3, 32, %l3 
stx %l3, [%i3 + 64 ] 
add   %l4, 1, %l4
ba P4792
nop

TARGET4759:
ba RET4759
nop


P4792: !ST [4] (maybe <- 0x20001c5) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P4793: !CASX [8] (maybe <- 0x20001c6) (Int)
add %i1, 256, %o5
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

P4794: !ST [5] (maybe <- 0x20001c7) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P4795: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P4796: !ST [1] (maybe <- 0x20001c8) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P4797: !ST [15] (maybe <- 0x20001c9) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P4798: !ST [10] (maybe <- 0x20001ca) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P4799: !CASX [0] (maybe <- 0x20001cb) (Int)
add %i0, 0, %o5
ldx [%o5], %l6
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l7
or %l7, %o2, %o2
! move %l6(lower) -> %o3(upper)
sllx %l6, 32, %o3
mov %l6, %l7
sllx %l4, 32, %l6
add  %l4, 1, %l4
or   %l4, %l6, %l6
casx [%o5], %l7, %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %o5
or %o5, %o3, %o3
! move %l6(lower) -> %o4(upper)
sllx %l6, 32, %o4
add  %l4, 1, %l4

P4800: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P4801: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P4802: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P4803: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P4804: !CASX [1] (maybe <- 0x20001cd) (Int)
add %i0, 0, %o5
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
mov %l6, %l7
sllx %l4, 32, %l6
add  %l4, 1, %l4
or   %l4, %l6, %l6
casx [%o5], %l7, %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %o5
or %o5, %o0, %o0
! move %l6(lower) -> %o1(upper)
sllx %l6, 32, %o1
add  %l4, 1, %l4

P4805: !CAS [12] (maybe <- 0x20001cf) (Int)
add %i3, 0, %o5
lduw [%o5], %l6
mov %l6, %l7
! move %l7(lower) -> %o1(lower)
or %l7, %o1, %o1
mov %l4, %o2
cas [%o5], %l7, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P4806: !CAS [1] (maybe <- 0x20001d0) (Int)
add %i0, 4, %o5
lduw [%o5], %l6
mov %l6, %l7
! move %l7(lower) -> %o2(lower)
or %l7, %o2, %o2
mov %l4, %o3
cas [%o5], %l7, %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P4807: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P4808: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P4809: !CAS [12] (maybe <- 0x20001d1) (Int)
add %i3, 0, %o5
lduw [%o5], %l6
mov %l6, %l7
! move %l7(lower) -> %o3(lower)
or %l7, %o3, %o3
mov %l4, %o4
cas [%o5], %l7, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P4810: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P4811: !LD [8] (Int)
lduw [%i1 + 256], %o5
! move %o5(lower) -> %o4(lower)
or %o5, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P4812: !DWST [12] (maybe <- 0x41800014) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
std %f20, [%i3 + 0]

P4813: !CAS [4] (maybe <- 0x20001d2) (Int)
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

P4814: !ST [10] (maybe <- 0x20001d3) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P4815: !CAS [1] (maybe <- 0x20001d4) (Int)
add %i0, 4, %o5
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

P4816: !CASX [0] (maybe <- 0x20001d5) (Int)
add %i0, 0, %o5
ldx [%o5], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov %o2, %l7
sllx %l4, 32, %o3
add  %l4, 1, %l4
or   %l4, %o3, %o3
casx [%o5], %l7, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4

P4817: !ST [3] (maybe <- 0x20001d7) (Int) (Branch target of P4222)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4
ba P4818
nop

TARGET4222:
ba RET4222
nop


P4818: !CAS [2] (maybe <- 0x20001d8) (Int) (LE)
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
lduwa [%l7] %asi, %o4
mov %o4, %l6
! move %l6(lower) -> %o4(upper)
sllx %l6, 32, %o4
mov %o5, %l3
casa [%l7] %asi, %l6, %l3
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

P4819: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P4820: !CAS [2] (maybe <- 0x20001d9) (Int)
add %i0, 12, %l7
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

P4821: !ST [8] (maybe <- 0x20001da) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P4822: !CASX [0] (maybe <- 0x20001db) (Int)
add %i0, 0, %l6
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

P4823: !ST [14] (maybe <- 0x20001dd) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P4824: !ST [12] (maybe <- 0x20001de) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P4825: !PREFETCH [13] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i3 + 64] %asi, 1

P4826: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P4827: !DWLD [13] (Int)
ldx [%i3 + 64], %o3
! move %o3(upper) -> %o3(upper)

P4828: !PREFETCH [8] (Int) (CBR)
prefetch [%i1 + 256], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET4828
nop
RET4828:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P4829: !CASX [2] (maybe <- 0x20001df) (Int)
add %i0, 8, %l7
ldx [%l7], %l3
! move %l3(upper) -> %o3(lower)
srlx %o3, 32, %o3
sllx %o3, 32, %o3
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

P4830: !CAS [15] (maybe <- 0x20001e0) (Int) (CBR)
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

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET4830
nop
RET4830:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P4831: !DWST [11] (maybe <- 0x20001e1) (Int)
mov %l4, %l7 
sllx %l7, 32, %l7 
stx %l7, [%i2 + 64 ] 
add   %l4, 1, %l4

P4832: !CAS [10] (maybe <- 0x20001e2) (Int)
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

P4833: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P4834: !CASX [15] (maybe <- 0x20001e3) (Int)
add %i3, 192, %l7
ldx [%l7], %l3

