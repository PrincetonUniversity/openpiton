// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tsotool_diag9_061003.s
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
! GEN.SEED 67
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

! Initialize LFSR to 0x6d23^4
sethi %hi(0x6d23), %l0
or    %l0, %lo(0x6d23), %l0
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

P2: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f0
membar #Sync 
! 1 addresses covered

P3: !PREFETCH [2] (Int) (Branch target of P162)
prefetch [%i0 + 12], 1
ba P4
nop

TARGET162:
ba RET162
nop


P4: !ST [15] (maybe <- 0x1) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P5: !BLD [1] (FP)
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

P6: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P7: !LD [8] (FP)
ld [%i1 + 256], %f5
! 1 addresses covered

P8: !BLD [7] (FP)
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

P9: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P10: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P11: !BST [2] (maybe <- 0x3f800001) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P12: !BST [5] (maybe <- 0x3f800005) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P13: !LD [9] (Int)
lduw [%i1 + 512], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P14: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P15: !LD [0] (Int)
lduw [%i0 + 0], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

P16: !BLD [2] (FP)
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

P17: !BST [9] (maybe <- 0x3f800008) (FP) (Branch target of P336)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 
ba P18
nop

TARGET336:
ba RET336
nop


P18: !BST [9] (maybe <- 0x3f800009) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P19: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P20: !CASX [5] (maybe <- 0x2) (Int)
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

P21: !BST [2] (maybe <- 0x3f80000a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P22: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P23: !PREFETCH [13] (Int) (Branch target of P83)
prefetch [%i3 + 64], 1
ba P24
nop

TARGET83:
ba RET83
nop


P24: !BST [10] (maybe <- 0x3f80000e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P25: !BLD [0] (FP)
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

P26: !BST [4] (maybe <- 0x3f80000f) (FP) (CBR)
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
be,pn  %xcc, TARGET26
nop
RET26:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P27: !DWLD [4] (Int)
ldx [%i0 + 64], %o3
! move %o3(upper) -> %o3(upper)

P28: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P29: !BLD [2] (FP)
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

P30: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P31: !BST [8] (maybe <- 0x3f800010) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P32: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f36, %f8

P33: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P34: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P35: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P36: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P37: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P38: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P39: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P40: !BST [3] (maybe <- 0x3f800011) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P41: !CAS [6] (maybe <- 0x3) (Int)
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

P42: !ST [10] (maybe <- 0x4) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P43: !BST [10] (maybe <- 0x3f800015) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P44: !BLD [2] (FP)
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

P45: !BLD [6] (FP)
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

P46: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P47: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P48: !PREFETCH [7] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i1 + 84] %asi, 1

P49: !BLD [11] (FP) (Branch target of P26)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6
ba P50
nop

TARGET26:
ba RET26
nop


P50: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P51: !BST [14] (maybe <- 0x3f800016) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P52: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P53: !NOP (Int)
nop

P54: !CAS [3] (maybe <- 0x5) (Int)
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

P55: !BST [15] (maybe <- 0x3f800017) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P56: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P57: !BST [15] (maybe <- 0x3f800018) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P58: !BLD [0] (FP)
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

P59: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P60: !DWST [8] (maybe <- 0x6) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 256 ] 
add   %l4, 1, %l4

P61: !BST [10] (maybe <- 0x3f800019) (FP) (Branch target of P333)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 
ba P62
nop

TARGET333:
ba RET333
nop


P62: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P63: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P64: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P65: !BLD [5] (FP)
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

P66: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P67: !BST [2] (maybe <- 0x3f80001a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P68: !BST [2] (maybe <- 0x3f80001e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P69: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P70: !BST [11] (maybe <- 0x3f800022) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P71: !BST [10] (maybe <- 0x3f800023) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P72: !DWST [8] (maybe <- 0x7) (Int)
mov %l4, %o5 
sllx %o5, 32, %o5 
stx %o5, [%i1 + 256 ] 
add   %l4, 1, %l4

P73: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P74: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P75: !BST [8] (maybe <- 0x3f800024) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P76: !ST [1] (maybe <- 0x8) (Int) (CBR)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET76
nop
RET76:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P77: !BST [8] (maybe <- 0x3f800025) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P78: !BST [3] (maybe <- 0x3f800026) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P79: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P80: !LD [10] (Int) (CBR)
lduw [%i2 + 32], %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET80
nop
RET80:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P81: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P82: !BST [6] (maybe <- 0x3f80002a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P83: !PREFETCH [5] (Int) (CBR)
prefetch [%i1 + 76], 1

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


P84: !BLD [6] (FP) (CBR)
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
be,pt  %xcc, TARGET84
nop
RET84:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P85: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P86: !DWST [4] (maybe <- 0x9) (Int)
mov %l4, %o5 
sllx %o5, 32, %o5 
stx %o5, [%i0 + 64 ] 
add   %l4, 1, %l4

P87: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f9
fmovd %f36, %f10

P88: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P89: !PREFETCH [10] (Int) (CBR)
prefetch [%i2 + 32], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET89
nop
RET89:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P90: !BST [11] (maybe <- 0x3f80002d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P91: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P92: !BST [15] (maybe <- 0x3f80002e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P93: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P94: !CASX [1] (maybe <- 0xa) (Int)
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

P95: !BST [7] (maybe <- 0x3f80002f) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
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
be,pn  %xcc, TARGET95
nop
RET95:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P96: !ST [5] (maybe <- 0xc) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P97: !DWLD [1] (Int)
ldx [%i0 + 0], %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)

P98: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P99: !CAS [3] (maybe <- 0xd) (Int)
add %i0, 32, %o5
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

P100: !BST [15] (maybe <- 0x3f800032) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P101: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P102: !BLD [0] (FP)
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

P103: !ST [15] (maybe <- 0xe) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P104: !BST [11] (maybe <- 0x3f800033) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P105: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P106: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f2

P107: !BLD [3] (FP)
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

P108: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P109: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P110: !BST [14] (maybe <- 0x3f800034) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P111: !BLD [10] (FP) (Branch target of P298)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f7
ba P112
nop

TARGET298:
ba RET298
nop


P112: !DWLD [3] (Int)
ldx [%i0 + 32], %o0
! move %o0(upper) -> %o0(upper)

P113: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P114: !BST [12] (maybe <- 0x3f800035) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P115: !BST [8] (maybe <- 0x3f800036) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P116: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P117: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f9

P118: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P119: !PREFETCH [15] (Int) (CBR)
prefetch [%i3 + 192], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET119
nop
RET119:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P120: !BLD [6] (FP)
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

P121: !BST [14] (maybe <- 0x3f800037) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P122: !BLD [11] (FP) (Branch target of P173)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13
ba P123
nop

TARGET173:
ba RET173
nop


P123: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P124: !BST [12] (maybe <- 0x3f800038) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P125: !BST [14] (maybe <- 0x3f800039) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P126: !DWLD [8] (Int)
ldx [%i1 + 256], %l6
! move %l6(upper) -> %o0(lower)
srlx %o0, 32, %o0
sllx %o0, 32, %o0
srlx %l6, 32, %l3
or %l3, %o0, %o0

P127: !BST [13] (maybe <- 0x3f80003a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P128: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P129: !BLD [6] (FP)
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

P130: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P131: !BST [8] (maybe <- 0x3f80003b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P132: !BST [4] (maybe <- 0x3f80003c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P133: !ST [4] (maybe <- 0xf) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P134: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P135: !BST [12] (maybe <- 0x3f80003d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P136: !BST [3] (maybe <- 0x3f80003e) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
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
be,pn  %xcc, TARGET136
nop
RET136:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P137: !BST [6] (maybe <- 0x3f800042) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P138: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f3
fmovd %f36, %f4

P139: !ST [6] (maybe <- 0x10) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P140: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P141: !BST [13] (maybe <- 0x3f800045) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P142: !LD [3] (Int)
lduw [%i0 + 32], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P143: !BLD [11] (FP) (Branch target of P413)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7
ba P144
nop

TARGET413:
ba RET413
nop


P144: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P145: !CAS [6] (maybe <- 0x11) (Int)
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

P146: !BST [15] (maybe <- 0x3f800046) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P147: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P148: !BST [5] (maybe <- 0x3f800047) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P149: !CASX [0] (maybe <- 0x12) (Int)
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

P150: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P151: !BST [2] (maybe <- 0x3f80004a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P152: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P153: !BLD [1] (FP)
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

P154: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P155: !BST [6] (maybe <- 0x3f80004e) (FP) (Branch target of P84)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 
ba P156
nop

TARGET84:
ba RET84
nop


P156: !BLD [7] (FP)
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

P157: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f0
membar #Sync 
! 1 addresses covered

P158: !DWST [11] (maybe <- 0x14) (Int)
mov %l4, %l3 
sllx %l3, 32, %l3 
stx %l3, [%i2 + 64 ] 
add   %l4, 1, %l4

P159: !BLD [2] (FP)
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

P160: !BLD [3] (FP)
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

P161: !BST [9] (maybe <- 0x3f800051) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P162: !DWST [10] (maybe <- 0x15) (Int) (CBR)
mov %l4, %l7 
sllx %l7, 32, %l7 
stx %l7, [%i2 + 32 ] 
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET162
nop
RET162:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P163: !BST [11] (maybe <- 0x3f800052) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P164: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P165: !LD [3] (Int)
lduw [%i0 + 32], %l7
! move %l7(lower) -> %o4(lower)
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P166: !LD [11] (Int) (Branch target of P76)
lduw [%i2 + 64], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
ba P167
nop

TARGET76:
ba RET76
nop


P167: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P168: !BST [14] (maybe <- 0x3f800053) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P169: !BST [8] (maybe <- 0x3f800054) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P170: !DWST [3] (maybe <- 0x16) (Int)
mov %l4, %o5 
sllx %o5, 32, %o5 
stx %o5, [%i0 + 32 ] 
add   %l4, 1, %l4

P171: !BST [11] (maybe <- 0x3f800055) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P172: !CASX [14] (maybe <- 0x17) (Int)
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

P173: !PREFETCH [6] (Int) (CBR)
prefetch [%i1 + 80], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET173
nop
RET173:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P174: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P175: !BST [7] (maybe <- 0x3f800056) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P176: !BLD [2] (FP)
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

P177: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P178: !BLD [6] (FP)
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

P179: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P180: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P181: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P182: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P183: !DWST [7] (maybe <- 0x18) (Int)
sllx %l4, 32, %l6 
add   %l4, 1, %l4
or %l6, %l4, %l6
stx %l6, [%i1 + 80]
add   %l4, 1, %l4

P184: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P185: !CAS [13] (maybe <- 0x1a) (Int)
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

P186: !BLD [1] (FP)
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

P187: !BLD [2] (FP)
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

P188: !SWAP [11] (maybe <- 0x1b) (Int)
mov %l4, %l7
swap  [%i2 + 64], %l7
! move %l7(lower) -> %o3(lower)
srl %l7, 0, %l3
or %l3, %o3, %o3
add   %l4, 1, %l4

P189: !BLD [7] (FP)
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

P190: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P191: !DWLD [14] (Int)
ldx [%i3 + 128], %o4
! move %o4(upper) -> %o4(upper)

P192: !REPLACEMENT [8] (Int)
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

P193: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P194: !BST [0] (maybe <- 0x3f800059) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P195: !BST [1] (maybe <- 0x3f80005d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P196: !CAS [1] (maybe <- 0x1c) (Int)
add %i0, 4, %o5
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

P197: !ST [8] (maybe <- 0x1d) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P198: !BST [6] (maybe <- 0x3f800061) (FP) (Branch target of P208)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 
ba P199
nop

TARGET208:
ba RET208
nop


P199: !BLD [6] (FP)
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

P200: !BLD [1] (FP)
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

P201: !BST [10] (maybe <- 0x3f800064) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P202: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P203: !BLD [0] (FP)
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

P204: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P205: !BST [9] (maybe <- 0x3f800065) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P206: !BST [7] (maybe <- 0x3f800066) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P207: !BST [4] (maybe <- 0x3f800069) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P208: !BLD [6] (FP) (CBR)
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
be,pt  %xcc, TARGET208
nop
RET208:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P209: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P210: !BLD [5] (FP)
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

P211: !BLD [3] (FP)
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

P212: !BST [15] (maybe <- 0x3f80006a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P213: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P214: !BLD [3] (FP)
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

P215: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P216: !ST [12] (maybe <- 0x1e) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P217: !BLD [7] (FP)
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

P218: !PREFETCH [5] (Int) (Branch target of P488)
prefetch [%i1 + 76], 1
ba P219
nop

TARGET488:
ba RET488
nop


P219: !BLD [0] (FP)
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

P220: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P221: !LD [1] (Int)
lduw [%i0 + 4], %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0

P222: !LD [3] (Int)
lduw [%i0 + 32], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P223: !BLD [3] (FP)
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

P224: !LD [7] (Int)
lduw [%i1 + 84], %l3
! move %l3(lower) -> %o1(lower)
or %l3, %o1, %o1

P225: !BLD [1] (FP)
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

P226: !PREFETCH [5] (Int) (Branch target of P378)
prefetch [%i1 + 76], 1
ba P227
nop

TARGET378:
ba RET378
nop


P227: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P228: !BST [8] (maybe <- 0x3f80006b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P229: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f9

P230: !BST [12] (maybe <- 0x3f80006c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P231: !CASX [14] (maybe <- 0x1f) (Int)
add %i3, 128, %l3
ldx [%l3], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov  %o2, %o5
sllx %l4, 32, %o3
casx [%l3], %o5, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4

P232: !BLD [6] (FP)
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

P233: !BLD [3] (FP)
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

P234: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P235: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P236: !LD [8] (Int)
lduw [%i1 + 256], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P237: !BLD [0] (FP)
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

P238: !BST [3] (maybe <- 0x3f80006d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P239: !BST [7] (maybe <- 0x3f800071) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P240: !PREFETCH [14] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i3 + 128] %asi, 1

P241: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P242: !BST [14] (maybe <- 0x3f800074) (FP) (CBR)
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
be,pn  %xcc, TARGET242
nop
RET242:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P243: !DWST [7] (maybe <- 0x20) (Int)
sllx %l4, 32, %o5 
add   %l4, 1, %l4
or %o5, %l4, %o5
stx %o5, [%i1 + 80]
add   %l4, 1, %l4

P244: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P245: !DWST [2] (maybe <- 0x22) (Int)
mov %l4, %l7 
stx %l7, [%i0 + 8]
add   %l4, 1, %l4

P246: !PREFETCH [10] (Int) (Branch target of P513)
prefetch [%i2 + 32], 1
ba P247
nop

TARGET513:
ba RET513
nop


P247: !BLD [1] (FP)
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

P248: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P249: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f11
fmovd %f36, %f12

P250: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P251: !DWLD [0] (Int)
ldx [%i0 + 0], %l7
! move %l7(upper) -> %o4(lower)
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

P252: !BST [8] (maybe <- 0x3f800075) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P253: !BLD [9] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET253
nop
RET253:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P254: !PREFETCH [8] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i1 + 256] %asi, 1

P255: !BLD [7] (FP)
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

P256: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P257: !BST [12] (maybe <- 0x3f800076) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P258: !BST [7] (maybe <- 0x3f800077) (FP) (Branch target of P80)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 
ba P259
nop

TARGET80:
ba RET80
nop


P259: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f2

P260: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P261: !REPLACEMENT [14] (Int)
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

P262: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P263: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P264: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P265: !ST [13] (maybe <- 0x23) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P266: !BLD [12] (FP) (Branch target of P517)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5
ba P267
nop

TARGET517:
ba RET517
nop


P267: !LD [1] (Int)
lduw [%i0 + 4], %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0

P268: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P269: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P270: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P271: !BLD [6] (FP)
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

P272: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P273: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P274: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P275: !BST [6] (maybe <- 0x3f80007a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P276: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P277: !BST [8] (maybe <- 0x3f80007d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P278: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P279: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P280: !BST [8] (maybe <- 0x3f80007e) (FP) (Branch target of P242)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 
ba P281
nop

TARGET242:
ba RET242
nop


P281: !DWST [5] (maybe <- 0x24) (Int) (LE)
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
sllx %o5, 32, %o5 
stxa %o5, [%i1 + 72 ] %asi
add   %l4, 1, %l4

P282: !DWST [15] (maybe <- 0x25) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 192 ] 
add   %l4, 1, %l4

P283: !CASX [10] (maybe <- 0x26) (Int)
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

P284: !CASX [13] (maybe <- 0x27) (Int)
add %i3, 64, %l6
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

P285: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f11
fmovd %f36, %f12

P286: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P287: !DWLD [14] (FP)
ldd [%i3 + 128], %f14
! 1 addresses covered

P288: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P289: !BLD [9] (FP) (Branch target of P119)
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
ba P290
nop

TARGET119:
ba RET119
nop


P290: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f0
membar #Sync 
! 1 addresses covered

P291: !ST [7] (maybe <- 0x28) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P292: !BST [13] (maybe <- 0x3f80007f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P293: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P294: !BST [15] (maybe <- 0x3f800080) (FP) (CBR)
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
be,pn  %xcc, TARGET294
nop
RET294:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P295: !BLD [3] (FP)
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

P296: !BST [6] (maybe <- 0x3f800081) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P297: !BST [4] (maybe <- 0x3f800084) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P298: !ST [9] (maybe <- 0x3f800085) (FP) (CBR)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i1 + 512 ]

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


P299: !BST [12] (maybe <- 0x3f800086) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P300: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P301: !BST [13] (maybe <- 0x3f800087) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P302: !BLD [12] (FP) (Branch target of P426)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6
ba P303
nop

TARGET426:
ba RET426
nop


P303: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P304: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P305: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P306: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P307: !BLD [1] (FP)
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

P308: !BST [9] (maybe <- 0x3f800088) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P309: !PREFETCH [10] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i2 + 32] %asi, 1

P310: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P311: !DWLD [15] (Int)
ldx [%i3 + 192], %o0
! move %o0(upper) -> %o0(upper)

P312: !BLD [2] (FP)
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

P313: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P314: !BST [3] (maybe <- 0x3f800089) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P315: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P316: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P317: !BST [6] (maybe <- 0x3f80008d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P318: !BST [1] (maybe <- 0x3f800090) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P319: !BLD [2] (FP)
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

P320: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P321: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P322: !BLD [9] (FP) (Branch target of P390)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7
ba P323
nop

TARGET390:
ba RET390
nop


P323: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P324: !BLD [0] (FP)
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

P325: !DWLD [5] (Int)
ldx [%i1 + 72], %l6
! move %l6(lower) -> %o0(lower)
srlx %o0, 32, %o0
sllx %o0, 32, %o0
srl %l6, 0, %l3
or %l3, %o0, %o0

P326: !BST [13] (maybe <- 0x3f800094) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P327: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P328: !DWLD [3] (Int)
ldx [%i0 + 32], %o1
! move %o1(upper) -> %o1(upper)

P329: !ST [5] (maybe <- 0x29) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P330: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P331: !DWST [9] (maybe <- 0x2a) (Int)
mov %l4, %l7 
sllx %l7, 32, %l7 
stx %l7, [%i1 + 512 ] 
add   %l4, 1, %l4

P332: !PREFETCH [0] (Int) (CBR)
prefetch [%i0 + 0], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET332
nop
RET332:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P333: !BLD [8] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET333
nop
RET333:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P334: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P335: !BST [12] (maybe <- 0x3f800095) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P336: !BLD [13] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET336
nop
RET336:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P337: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P338: !BLD [12] (FP) (Branch target of P95)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14
ba P339
nop

TARGET95:
ba RET95
nop


P339: !LD [7] (FP)
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

P340: !BST [10] (maybe <- 0x3f800096) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P341: !ST [7] (maybe <- 0x2b) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P342: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P343: !BST [12] (maybe <- 0x3f800097) (FP) (Branch target of P294)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 
ba P344
nop

TARGET294:
ba RET294
nop


P344: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f0
membar #Sync 
! 1 addresses covered

P345: !BST [13] (maybe <- 0x3f800098) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P346: !BST [10] (maybe <- 0x3f800099) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P347: !BST [12] (maybe <- 0x3f80009a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P348: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P349: !BLD [1] (FP)
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

P350: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P351: !BST [10] (maybe <- 0x3f80009b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P352: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P353: !BST [4] (maybe <- 0x3f80009c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P354: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P355: !BLD [1] (FP)
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

P356: !BST [4] (maybe <- 0x3f80009d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P357: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P358: !DWST [15] (maybe <- 0x2c) (Int)
mov %l4, %l7 
sllx %l7, 32, %l7 
stx %l7, [%i3 + 192 ] 
add   %l4, 1, %l4

P359: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P360: !BST [3] (maybe <- 0x3f80009e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P361: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P362: !DWST [10] (maybe <- 0x2d) (Int)
mov %l4, %l3 
sllx %l3, 32, %l3 
stx %l3, [%i2 + 32 ] 
add   %l4, 1, %l4

P363: !BST [14] (maybe <- 0x3f8000a2) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P364: !BST [4] (maybe <- 0x3f8000a3) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P365: !ST [13] (maybe <- 0x2e) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P366: !MEMBAR (Int)
membar #StoreLoad

P367: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P368: !BST [11] (maybe <- 0x3f8000a4) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P369: !BST [14] (maybe <- 0x3f8000a5) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P370: !PREFETCH [12] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i3 + 0] %asi, 1

P371: !BLD [2] (FP)
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

P372: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P373: !BLD [3] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f0
membar #Sync 
! 4 addresses covered
fmovs %f3, %f2
fmovs %f8, %f3

P374: !BST [8] (maybe <- 0x3f8000a6) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P375: !BST [4] (maybe <- 0x3f8000a7) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P376: !BST [4] (maybe <- 0x3f8000a8) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P377: !BST [6] (maybe <- 0x3f8000a9) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P378: !BLD [8] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET378
nop
RET378:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P379: !BST [2] (maybe <- 0x3f8000ac) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P380: !DWST [5] (maybe <- 0x2f) (Int)
mov %l4, %l7 
stx %l7, [%i1 + 72]
add   %l4, 1, %l4

P381: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P382: !CASX [3] (maybe <- 0x30) (Int)
add %i0, 32, %l7
ldx [%l7], %l3
! move %l3(upper) -> %o1(lower)
srlx %o1, 32, %o1
sllx %o1, 32, %o1
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

P383: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P384: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P385: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P386: !BST [3] (maybe <- 0x3f8000b0) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P387: !BST [1] (maybe <- 0x3f8000b4) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P388: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P389: !BST [6] (maybe <- 0x3f8000b8) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P390: !DWLD [2] (FP) (CBR)
ldd [%i0 + 8], %f8
! 1 addresses covered
fmovs %f9, %f8

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET390
nop
RET390:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P391: !BLD [3] (FP)
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

P392: !DWLD [2] (Int)
ldx [%i0 + 8], %l3
! move %l3(lower) -> %o3(lower)
srl %l3, 0, %o5
or %o5, %o3, %o3

P393: !BST [12] (maybe <- 0x3f8000bb) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P394: !DWST [9] (maybe <- 0x31) (Int)
mov %l4, %l3 
sllx %l3, 32, %l3 
stx %l3, [%i1 + 512 ] 
add   %l4, 1, %l4

P395: !BST [9] (maybe <- 0x3f8000bc) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P396: !BST [8] (maybe <- 0x3f8000bd) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P397: !BST [13] (maybe <- 0x3f8000be) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P398: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P399: !BLD [1] (FP)
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

P400: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P401: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P402: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P403: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P404: !BLD [7] (FP)
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

P405: !DWLD [4] (Int)
ldx [%i0 + 64], %o4
! move %o4(upper) -> %o4(upper)

P406: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P407: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P408: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f8

P409: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P410: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P411: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P412: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P413: !PREFETCH [13] (Int) (CBR)
prefetch [%i3 + 64], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET413
nop
RET413:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P414: !LD [3] (FP)
ld [%i0 + 32], %f9
! 1 addresses covered

P415: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P416: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P417: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P418: !BST [12] (maybe <- 0x3f8000bf) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P419: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P420: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P421: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P422: !LD [8] (Int)
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

P423: !BST [14] (maybe <- 0x3f8000c0) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P424: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P425: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P426: !BST [0] (maybe <- 0x3f8000c1) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
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
be,pt  %xcc, TARGET426
nop
RET426:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P427: !BST [1] (maybe <- 0x3f8000c5) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P428: !DWLD [0] (Int)
ldx [%i0 + 0], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)

P429: !CASX [15] (maybe <- 0x32) (Int)
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

P430: !BST [5] (maybe <- 0x3f8000c9) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P431: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P432: !BST [15] (maybe <- 0x3f8000cc) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P433: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P434: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P435: !BST [9] (maybe <- 0x3f8000cd) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P436: !LD [6] (Int) (Branch target of P89)
lduw [%i1 + 80], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
ba P437
nop

TARGET89:
ba RET89
nop


P437: !BLD [1] (FP)
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

P438: !BST [10] (maybe <- 0x3f8000ce) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P439: !BLD [3] (FP)
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

P440: !BST [1] (maybe <- 0x3f8000cf) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P441: !BST [3] (maybe <- 0x3f8000d3) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P442: !BST [6] (maybe <- 0x3f8000d7) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P443: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P444: !BST [7] (maybe <- 0x3f8000da) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P445: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P446: !BST [13] (maybe <- 0x3f8000dd) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P447: !BST [4] (maybe <- 0x3f8000de) (FP) (Branch target of P332)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 
ba P448
nop

TARGET332:
ba RET332
nop


P448: !SWAP [4] (maybe <- 0x33) (Int)
mov %l4, %l7
swap  [%i0 + 64], %l7
! move %l7(lower) -> %o3(lower)
srl %l7, 0, %l3
or %l3, %o3, %o3
add   %l4, 1, %l4

P449: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P450: !BST [11] (maybe <- 0x3f8000df) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P451: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P452: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P453: !BLD [6] (FP)
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

P454: !PREFETCH [10] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i2 + 32] %asi, 1

P455: !CAS [6] (maybe <- 0x34) (Int)
add %i1, 80, %o5
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

P456: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P457: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P458: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P459: !BST [2] (maybe <- 0x3f8000e0) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P460: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P461: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P462: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P463: !BST [2] (maybe <- 0x3f8000e4) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P464: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P465: !BLD [13] (FP)
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

P466: !BLD [2] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f0
membar #Sync 
! 4 addresses covered
fmovs %f3, %f2
fmovs %f8, %f3

P467: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P468: !BST [8] (maybe <- 0x3f8000e8) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P469: !BST [10] (maybe <- 0x3f8000e9) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P470: !CAS [9] (maybe <- 0x35) (Int)
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

P471: !BST [9] (maybe <- 0x3f8000ea) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P472: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P473: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P474: !NOP (Int)
nop

P475: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P476: !BST [7] (maybe <- 0x3f8000eb) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P477: !BST [11] (maybe <- 0x3f8000ee) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P478: !BST [4] (maybe <- 0x3f8000ef) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P479: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P480: !REPLACEMENT [11] (Int)
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

P481: !BST [7] (maybe <- 0x3f8000f0) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P482: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P483: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P484: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P485: !BLD [7] (FP)
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

P486: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P487: !BST [12] (maybe <- 0x3f8000f3) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P488: !BLD [11] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET488
nop
RET488:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P489: !ST [13] (maybe <- 0x36) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P490: !LD [0] (Int) (LE)
wr %g0, 0x88, %asi
lduwa [%i0 + 0] %asi, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P491: !BST [13] (maybe <- 0x3f8000f4) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P492: !PREFETCH [1] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i0 + 4] %asi, 1

P493: !BST [1] (maybe <- 0x3f8000f5) (FP) (Branch target of P253)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 
ba P494
nop

TARGET253:
ba RET253
nop


P494: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P495: !BST [1] (maybe <- 0x3f8000f9) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P496: !BST [4] (maybe <- 0x3f8000fd) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P497: !BST [13] (maybe <- 0x3f8000fe) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P498: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P499: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f13

P500: !BST [4] (maybe <- 0x3f8000ff) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P501: !MEMBAR (Int)
membar #StoreLoad

P502: !LD [0] (Int)
lduw [%i0 + 0], %l3
! move %l3(lower) -> %o1(lower)
or %l3, %o1, %o1

P503: !LD [1] (Int)
lduw [%i0 + 4], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P504: !LD [2] (Int)
lduw [%i0 + 12], %l3
! move %l3(lower) -> %o2(lower)
or %l3, %o2, %o2

P505: !LD [3] (FP)
ld [%i0 + 32], %f14
! 1 addresses covered

P506: !LD [4] (Int)
lduw [%i0 + 64], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P507: !LD [5] (Int)
lduw [%i1 + 76], %l3
! move %l3(lower) -> %o3(lower)
or %l3, %o3, %o3

P508: !LD [6] (Int)
lduw [%i1 + 80], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P509: !LD [7] (FP)
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

P510: !LD [8] (Int)
lduw [%i1 + 256], %l3
! move %l3(lower) -> %o4(lower)
or %l3, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P511: !LD [9] (Int)
lduw [%i1 + 512], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P512: !LD [10] (Int)
lduw [%i2 + 32], %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0

P513: !LD [11] (Int) (CBR)
lduw [%i2 + 64], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET513
nop
RET513:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P514: !LD [12] (Int)
lduw [%i3 + 0], %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1

P515: !LD [13] (Int) (Branch target of P136)
lduw [%i3 + 64], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
ba P516
nop

TARGET136:
ba RET136
nop


P516: !LD [14] (Int)
lduw [%i3 + 128], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2

P517: !LD [15] (Int) (CBR)
lduw [%i3 + 192], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET517
nop
RET517:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


END_NODES0: ! Test istream for CPU 0 ends
sethi %hi(0xdead0e0f), %l6
or    %l6, %lo(0xdead0e0f), %l6
! move %l6(lower) -> %o3(lower)
or %l6, %o3, %o3
stw %l6, [%i5] 
ld [%i5], %f0
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
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

! Initialize LFSR to 0x364f^4
sethi %hi(0x364f), %l0
or    %l0, %lo(0x364f), %l0
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

P518: !DWST [1] (maybe <- 0x800001) (Int)
sllx %l4, 32, %l3 
add   %l4, 1, %l4
or %l3, %l4, %l3
stx %l3, [%i0 + 0]
add   %l4, 1, %l4

P519: !BST [7] (maybe <- 0x40000001) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P520: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f0
membar #Sync 
! 1 addresses covered

P521: !LD [2] (Int)
lduw [%i0 + 12], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P522: !BST [7] (maybe <- 0x40000004) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P523: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P524: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P525: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P526: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P527: !SWAP [2] (maybe <- 0x800003) (Int)
mov %l4, %l6
swap  [%i0 + 12], %l6
! move %l6(lower) -> %o0(lower)
srl %l6, 0, %o5
or %o5, %o0, %o0
add   %l4, 1, %l4

P528: !BST [2] (maybe <- 0x40000007) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P529: !DWST [7] (maybe <- 0x4000000b) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=21 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
std %f20, [%i1 + 80]

P530: !CAS [12] (maybe <- 0x800004) (Int)
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

P531: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P532: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P533: !BST [10] (maybe <- 0x4000000d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P534: !BLD [2] (FP)
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

P535: !BST [14] (maybe <- 0x4000000e) (FP) (Branch target of P677)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 
ba P536
nop

TARGET677:
ba RET677
nop


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

P537: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f10

P538: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f11
fmovd %f36, %f12

P539: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P540: !BLD [2] (FP)
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

P541: !BST [11] (maybe <- 0x4000000f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P542: !BST [11] (maybe <- 0x40000010) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P543: !BST [0] (maybe <- 0x40000011) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P544: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P545: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P546: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P547: !BST [8] (maybe <- 0x40000015) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P548: !BST [2] (maybe <- 0x40000016) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P549: !BLD [6] (FP)
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

P550: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P551: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P552: !LD [12] (Int)
lduw [%i3 + 0], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P553: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f36, %f8

P554: !DWST [4] (maybe <- 0x800005) (Int)
mov %l4, %o5 
sllx %o5, 32, %o5 
stx %o5, [%i0 + 64 ] 
add   %l4, 1, %l4

P555: !BST [10] (maybe <- 0x4000001a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P556: !BLD [6] (FP) (Branch target of P701)
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
ba P557
nop

TARGET701:
ba RET701
nop


P557: !CAS [6] (maybe <- 0x800006) (Int)
add %i1, 80, %l7
lduw [%l7], %l3
mov %l3, %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2
mov %l4, %o3
cas [%l7], %l6, %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P558: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P559: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P560: !BST [4] (maybe <- 0x4000001b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P561: !BST [5] (maybe <- 0x4000001c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P562: !BLD [4] (FP)
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

P563: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f0
membar #Sync 
! 3 addresses covered
fmovs %f3, %f0
fmovs %f4, %f1
fmovs %f5, %f2

P564: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P565: !BLD [3] (FP)
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

P566: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P567: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P568: !BST [14] (maybe <- 0x4000001f) (FP) (CBR)
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
be,pt  %xcc, TARGET568
nop
RET568:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P569: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P570: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P571: !CAS [9] (maybe <- 0x800007) (Int)
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

P572: !BLD [3] (FP)
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

P573: !BST [4] (maybe <- 0x40000020) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P574: !BST [2] (maybe <- 0x40000021) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P575: !BST [10] (maybe <- 0x40000025) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P576: !BLD [13] (FP) (Branch target of P1007)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12
ba P577
nop

TARGET1007:
ba RET1007
nop


P577: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P578: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P579: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P580: !CASX [7] (maybe <- 0x800008) (Int)
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

P581: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P582: !ST [15] (maybe <- 0x80000a) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P583: !BST [1] (maybe <- 0x40000026) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P584: !BLD [9] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET584
nop
RET584:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P585: !BLD [4] (FP)
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

P586: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P587: !BLD [0] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f0
membar #Sync 
! 4 addresses covered
fmovs %f3, %f2
fmovs %f8, %f3

P588: !BST [5] (maybe <- 0x4000002a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P589: !BST [11] (maybe <- 0x4000002d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P590: !BST [6] (maybe <- 0x4000002e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P591: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P592: !BLD [6] (FP)
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

P593: !LD [2] (Int)
lduw [%i0 + 12], %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1

P594: !DWST [5] (maybe <- 0x40000031) (FP)
! 0 th moved, current_fp_src=21 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
std %f20, [%i1 + 72]

P595: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P596: !BLD [11] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET596
nop
RET596:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P597: !BST [4] (maybe <- 0x40000032) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P598: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P599: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P600: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P601: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P602: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P603: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P604: !BLD [10] (FP) (Branch target of P974)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f10
ba P605
nop

TARGET974:
ba RET974
nop


P605: !BLD [1] (FP)
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

P606: !BLD [13] (FP)
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

P607: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P608: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P609: !REPLACEMENT [11] (Int)
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

P610: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P611: !MEMBAR (Int)
membar #StoreLoad

P612: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P613: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f0
membar #Sync 
! 1 addresses covered

P614: !BST [5] (maybe <- 0x40000033) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P615: !BLD [1] (FP)
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

P616: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P617: !BST [0] (maybe <- 0x40000036) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P618: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P619: !BLD [1] (FP)
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

P620: !BLD [2] (FP)
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

P621: !SWAP [14] (maybe <- 0x80000b) (Int)
mov %l4, %o2
swap  [%i3 + 128], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P622: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P623: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P624: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P625: !BST [12] (maybe <- 0x4000003a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P626: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P627: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P628: !BLD [7] (FP)
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

P629: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P630: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P631: !BST [5] (maybe <- 0x4000003b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P632: !CAS [13] (maybe <- 0x80000c) (Int)
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

P633: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P634: !BLD [1] (FP)
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

P635: !BLD [2] (FP)
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

P636: !REPLACEMENT [1] (Int)
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

P637: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P638: !PREFETCH [12] (Int) (Branch target of P900)
prefetch [%i3 + 0], 1
ba P639
nop

TARGET900:
ba RET900
nop


P639: !BST [8] (maybe <- 0x4000003e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P640: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f12

P641: !BST [7] (maybe <- 0x4000003f) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
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
be,pn  %xcc, TARGET641
nop
RET641:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P642: !REPLACEMENT [3] (Int)
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

P643: !BLD [5] (FP)
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

P644: !BST [12] (maybe <- 0x40000042) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P645: !BST [15] (maybe <- 0x40000043) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P646: !REPLACEMENT [2] (Int)
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

P647: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P648: !BST [4] (maybe <- 0x40000044) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P649: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f0
membar #Sync 
! 1 addresses covered

P650: !DWST [7] (maybe <- 0x80000d) (Int)
sllx %l4, 32, %l3 
add   %l4, 1, %l4
or %l3, %l4, %l3
stx %l3, [%i1 + 80]
add   %l4, 1, %l4

P651: !BST [4] (maybe <- 0x40000045) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P652: !SWAP [1] (maybe <- 0x80000f) (Int)
mov %l4, %l3
swap  [%i0 + 4], %l3
! move %l3(lower) -> %o3(lower)
srl %l3, 0, %l7
or %l7, %o3, %o3
add   %l4, 1, %l4

P653: !BST [8] (maybe <- 0x40000046) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P654: !BST [0] (maybe <- 0x40000047) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P655: !LD [8] (Int)
lduw [%i1 + 256], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P656: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f36, %f2

P657: !BST [7] (maybe <- 0x4000004b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P658: !BLD [12] (FP) (Branch target of P641)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4
ba P659
nop

TARGET641:
ba RET641
nop


P659: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P660: !BLD [2] (FP)
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

P661: !LD [13] (FP)
ld [%i3 + 64], %f10
! 1 addresses covered

P662: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f11
fmovd %f36, %f12

P663: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P664: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P665: !PREFETCH [1] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i0 + 4] %asi, 1

P666: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P667: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f14

P668: !BLD [10] (FP)
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

P669: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f0
membar #Sync 
! 3 addresses covered
fmovs %f3, %f0
fmovs %f4, %f1
fmovs %f5, %f2

P670: !BST [9] (maybe <- 0x4000004e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P671: !BST [5] (maybe <- 0x4000004f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P672: !DWLD [7] (Int)
ldx [%i1 + 80], %o5
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

P673: !BST [1] (maybe <- 0x40000052) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P674: !DWST [11] (maybe <- 0x800010) (Int)
mov %l4, %o5 
sllx %o5, 32, %o5 
stx %o5, [%i2 + 64 ] 
add   %l4, 1, %l4

P675: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P676: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P677: !PREFETCH [0] (Int) (CBR)
prefetch [%i0 + 0], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET677
nop
RET677:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P678: !DWST [9] (maybe <- 0x800011) (Int)
mov %l4, %o5 
sllx %o5, 32, %o5 
stx %o5, [%i1 + 512 ] 
add   %l4, 1, %l4

P679: !BLD [14] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET679
nop
RET679:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P680: !BLD [2] (FP)
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

P681: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P682: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P683: !DWLD [4] (Int)
ldx [%i0 + 64], %l3
! move %l3(upper) -> %o0(lower)
srlx %l3, 32, %o5
or %o5, %o0, %o0

P684: !DWST [12] (maybe <- 0x800012) (Int) (LE)
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
stxa %l7, [%i3 + 0 ] %asi
add   %l4, 1, %l4

P685: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P686: !BST [6] (maybe <- 0x40000056) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
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
be,pt  %xcc, TARGET686
nop
RET686:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P687: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P688: !BLD [5] (FP)
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

P689: !LD [7] (Int)
lduw [%i1 + 84], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P690: !PREFETCH [9] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i1 + 512] %asi, 1

P691: !REPLACEMENT [0] (Int)
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

P692: !BST [1] (maybe <- 0x40000059) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P693: !DWLD [13] (Int) (LE)
wr %g0, 0x88, %asi
ldxa [%i3 + 64] %asi, %l6
! move %l6(lower) -> %o1(lower)
srl %l6, 0, %l3
or %l3, %o1, %o1

P694: !PREFETCH [13] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i3 + 64] %asi, 1

P695: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P696: !DWLD [3] (Int)
ldx [%i0 + 32], %o2
! move %o2(upper) -> %o2(upper)

P697: !BLD [4] (FP)
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

P698: !BST [7] (maybe <- 0x4000005d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P699: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P700: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f0
membar #Sync 
! 3 addresses covered
fmovs %f3, %f0
fmovs %f4, %f1
fmovs %f5, %f2

P701: !PREFETCH [1] (Int) (CBR)
prefetch [%i0 + 4], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET701
nop
RET701:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P702: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P703: !BST [7] (maybe <- 0x40000060) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P704: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P705: !BLD [1] (FP)
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

P706: !BLD [2] (FP)
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

P707: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P708: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P709: !BLD [2] (FP) (CBR)
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
be,pn  %xcc, TARGET709
nop
RET709:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P710: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P711: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P712: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P713: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f2

P714: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P715: !CAS [13] (maybe <- 0x800013) (Int)
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

P716: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P717: !BST [5] (maybe <- 0x40000063) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P718: !BST [13] (maybe <- 0x40000066) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P719: !BLD [2] (FP)
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

P720: !BLD [0] (FP)
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

P721: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P722: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P723: !BLD [5] (FP)
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

P724: !ST [9] (maybe <- 0x800014) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P725: !DWST [9] (maybe <- 0x800015) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 512 ] 
add   %l4, 1, %l4

P726: !BLD [13] (FP)
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

P727: !PREFETCH [8] (Int) (Branch target of P686)
prefetch [%i1 + 256], 1
ba P728
nop

TARGET686:
ba RET686
nop


P728: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P729: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P730: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f0
membar #Sync 
! 1 addresses covered
fmovd %f8, %f0

P731: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P732: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P733: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P734: !DWST [9] (maybe <- 0x800016) (Int) (CBR)
mov %l4, %l3 
sllx %l3, 32, %l3 
stx %l3, [%i1 + 512 ] 
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET734
nop
RET734:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P735: !CAS [13] (maybe <- 0x800017) (Int)
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

P736: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P737: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P738: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P739: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P740: !BST [6] (maybe <- 0x40000067) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P741: !BLD [0] (FP)
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

P742: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P743: !BST [2] (maybe <- 0x4000006a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P744: !BST [5] (maybe <- 0x4000006e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P745: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P746: !BST [13] (maybe <- 0x40000071) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P747: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P748: !BST [0] (maybe <- 0x40000072) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P749: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P750: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P751: !BST [6] (maybe <- 0x40000076) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P752: !BST [0] (maybe <- 0x40000079) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P753: !ST [0] (maybe <- 0x800018) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P754: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P755: !PREFETCH [2] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i0 + 12] %asi, 1

P756: !BST [8] (maybe <- 0x4000007d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P757: !BLD [5] (FP)
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

P758: !BLD [5] (FP) (CBR)
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
be,pt  %xcc, TARGET758
nop
RET758:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P759: !BLD [9] (FP) (CBR) (Branch target of P821)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET759
nop
RET759:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0

ba P760
nop

TARGET821:
ba RET821
nop


P760: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P761: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P762: !BST [2] (maybe <- 0x4000007e) (FP) (Branch target of P796)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 
ba P763
nop

TARGET796:
ba RET796
nop


P763: !BLD [3] (FP)
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

P764: !BST [8] (maybe <- 0x40000082) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P765: !PREFETCH [6] (Int) (CBR)
prefetch [%i1 + 80], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET765
nop
RET765:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P766: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P767: !BLD [1] (FP)
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

P768: !ST [3] (maybe <- 0x800019) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P769: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P770: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P771: !BST [3] (maybe <- 0x40000083) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P772: !DWST [13] (maybe <- 0x80001a) (Int)
mov %l4, %l7 
sllx %l7, 32, %l7 
stx %l7, [%i3 + 64 ] 
add   %l4, 1, %l4

P773: !BLD [14] (FP) (Branch target of P927)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7
ba P774
nop

TARGET927:
ba RET927
nop


P774: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P775: !BST [15] (maybe <- 0x40000087) (FP) (Branch target of P709)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 
ba P776
nop

TARGET709:
ba RET709
nop


P776: !BLD [0] (FP)
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

P777: !SWAP [14] (maybe <- 0x80001b) (Int)
mov %l4, %l7
swap  [%i3 + 128], %l7
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

P778: !BST [8] (maybe <- 0x40000088) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P779: !BST [10] (maybe <- 0x40000089) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P780: !BLD [1] (FP)
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

P781: !BST [1] (maybe <- 0x4000008a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P782: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P783: !PREFETCH [13] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i3 + 64] %asi, 1

P784: !BST [8] (maybe <- 0x4000008e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P785: !DWST [14] (maybe <- 0x80001c) (Int) (CBR)
mov %l4, %o5 
sllx %o5, 32, %o5 
stx %o5, [%i3 + 128 ] 
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET785
nop
RET785:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P786: !BST [9] (maybe <- 0x4000008f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P787: !CAS [10] (maybe <- 0x80001d) (Int)
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

P788: !SWAP [2] (maybe <- 0x80001e) (Int)
mov %l4, %o1
swap  [%i0 + 12], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P789: !BST [4] (maybe <- 0x40000090) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P790: !BST [5] (maybe <- 0x40000091) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P791: !PREFETCH [5] (Int) (CBR)
prefetch [%i1 + 76], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET791
nop
RET791:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P792: !BST [9] (maybe <- 0x40000094) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P793: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f0
membar #Sync 
! 3 addresses covered
fmovs %f3, %f0
fmovs %f4, %f1
fmovs %f5, %f2

P794: !BST [13] (maybe <- 0x40000095) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P795: !BST [0] (maybe <- 0x40000096) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P796: !LD [3] (Int) (CBR)
lduw [%i0 + 32], %l7
! move %l7(lower) -> %o1(lower)
or %l7, %o1, %o1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET796
nop
RET796:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P797: !BLD [3] (FP)
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

P798: !BST [0] (maybe <- 0x4000009a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P799: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P800: !CAS [8] (maybe <- 0x80001f) (Int) (Branch target of P759)
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
ba P801
nop

TARGET759:
ba RET759
nop


P801: !DWST [11] (maybe <- 0x800020) (Int) (LE)
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
stxa %l3, [%i2 + 64 ] %asi
add   %l4, 1, %l4

P802: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P803: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f9
fmovd %f36, %f10

P804: !SWAP [9] (maybe <- 0x800021) (Int)
mov %l4, %o3
swap  [%i1 + 512], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P805: !ST [14] (maybe <- 0x800022) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P806: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P807: !BLD [3] (FP)
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

P808: !ST [2] (maybe <- 0x800023) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P809: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P810: !REPLACEMENT [12] (Int)
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

P811: !BST [6] (maybe <- 0x4000009e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P812: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f0
membar #Sync 
! 1 addresses covered

P813: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P814: !BLD [7] (FP)
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

P815: !BST [0] (maybe <- 0x400000a1) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
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
be,pt  %xcc, TARGET815
nop
RET815:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P816: !DWLD [4] (Int)
ldx [%i0 + 64], %l7
! move %l7(upper) -> %o3(lower)
srlx %l7, 32, %l6
or %l6, %o3, %o3

P817: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P818: !BST [12] (maybe <- 0x400000a5) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P819: !BST [0] (maybe <- 0x400000a6) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P820: !LD [8] (Int)
lduw [%i1 + 256], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P821: !PREFETCH [2] (Int) (CBR)
prefetch [%i0 + 12], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET821
nop
RET821:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P822: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P823: !BST [13] (maybe <- 0x400000aa) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P824: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P825: !SWAP [6] (maybe <- 0x800024) (Int)
mov %l4, %l6
swap  [%i1 + 80], %l6
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

P826: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P827: !BST [3] (maybe <- 0x400000ab) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P828: !BST [10] (maybe <- 0x400000af) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P829: !CAS [7] (maybe <- 0x800025) (Int)
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

P830: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f6

P831: !BST [13] (maybe <- 0x400000b0) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P832: !BST [5] (maybe <- 0x400000b1) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P833: !DWLD [10] (Int)
ldx [%i2 + 32], %o1
! move %o1(upper) -> %o1(upper)

P834: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P835: !DWST [10] (maybe <- 0x800026) (Int)
mov %l4, %l3 
sllx %l3, 32, %l3 
stx %l3, [%i2 + 32 ] 
add   %l4, 1, %l4

P836: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P837: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P838: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P839: !BLD [3] (FP)
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

P840: !CASX [7] (maybe <- 0x800027) (Int)
add %i1, 80, %l3
ldx [%l3], %l7
! move %l7(upper) -> %o1(lower)
srlx %o1, 32, %o1
sllx %o1, 32, %o1
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

P841: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P842: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P843: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P844: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P845: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P846: !BLD [4] (FP)
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

P847: !BLD [4] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f0
membar #Sync 
! 1 addresses covered

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET847
nop
RET847:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P848: !DWLD [10] (FP)
ldd [%i2 + 32], %f18
! 1 addresses covered
fmovs %f18, %f1

P849: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P850: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P851: !BLD [2] (FP)
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

P852: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P853: !LD [4] (Int)
lduw [%i0 + 64], %l6
! move %l6(lower) -> %o3(lower)
or %l6, %o3, %o3

P854: !DWST [3] (maybe <- 0x800029) (Int)
mov %l4, %l7 
sllx %l7, 32, %l7 
stx %l7, [%i0 + 32 ] 
add   %l4, 1, %l4

P855: !BST [9] (maybe <- 0x400000b4) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P856: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P857: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P858: !BST [3] (maybe <- 0x400000b5) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P859: !CASX [7] (maybe <- 0x80002a) (Int) (Branch target of P734)
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
ba P860
nop

TARGET734:
ba RET734
nop


P860: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P861: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P862: !BST [8] (maybe <- 0x400000b9) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P863: !BST [7] (maybe <- 0x400000ba) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P864: !BLD [2] (FP) (CBR)
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
be,pt  %xcc, TARGET864
nop
RET864:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P865: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P866: !LD [3] (Int)
lduw [%i0 + 32], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P867: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P868: !BST [11] (maybe <- 0x400000bd) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P869: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P870: !BST [14] (maybe <- 0x400000be) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P871: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P872: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P873: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P874: !BST [5] (maybe <- 0x400000bf) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P875: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P876: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P877: !BST [7] (maybe <- 0x400000c2) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P878: !BLD [8] (FP)
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

P879: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P880: !ST [6] (maybe <- 0x80002c) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P881: !BST [15] (maybe <- 0x400000c5) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P882: !BLD [8] (FP) (Branch target of P584)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f0
membar #Sync 
! 1 addresses covered
ba P883
nop

TARGET584:
ba RET584
nop


P883: !BST [14] (maybe <- 0x400000c6) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P884: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P885: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f36, %f2

P886: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P887: !BST [1] (maybe <- 0x400000c7) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P888: !BST [0] (maybe <- 0x400000cb) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P889: !REPLACEMENT [13] (Int)
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

P890: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P891: !BLD [15] (FP) (Branch target of P791)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6
ba P892
nop

TARGET791:
ba RET791
nop


P892: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P893: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P894: !REPLACEMENT [0] (Int)
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

P895: !BST [5] (maybe <- 0x400000cf) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P896: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P897: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P898: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P899: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f11
fmovd %f36, %f12

P900: !CASX [1] (maybe <- 0x80002d) (Int) (CBR) (Branch target of P758)
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

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET900
nop
RET900:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0

ba P901
nop

TARGET758:
ba RET758
nop


P901: !BST [0] (maybe <- 0x400000d2) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P902: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P903: !SWAP [10] (maybe <- 0x80002f) (Int)
mov %l4, %l7
swap  [%i2 + 32], %l7
! move %l7(lower) -> %o3(lower)
srl %l7, 0, %l3
or %l3, %o3, %o3
add   %l4, 1, %l4

P904: !BLD [1] (FP)
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

P905: !BLD [6] (FP)
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

P906: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P907: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P908: !BST [8] (maybe <- 0x400000d6) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P909: !PREFETCH [13] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i3 + 64] %asi, 1

P910: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P911: !REPLACEMENT [9] (Int)
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

P912: !PREFETCH [10] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i2 + 32] %asi, 1

P913: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P914: !BST [14] (maybe <- 0x400000d7) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P915: !BLD [9] (FP) (Branch target of P864)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6
ba P916
nop

TARGET864:
ba RET864
nop


P916: !BST [10] (maybe <- 0x400000d8) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P917: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P918: !BST [5] (maybe <- 0x400000d9) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P919: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P920: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P921: !PREFETCH [5] (Int) (Branch target of P568)
prefetch [%i1 + 76], 1
ba P922
nop

TARGET568:
ba RET568
nop


P922: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P923: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P924: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f36, %f8

P925: !BLD [6] (FP)
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

P926: !BST [0] (maybe <- 0x400000dc) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P927: !PREFETCH [12] (Int) (CBR)
prefetch [%i3 + 0], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET927
nop
RET927:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P928: !BST [5] (maybe <- 0x400000e0) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P929: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P930: !REPLACEMENT [14] (Int)
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

P931: !BST [13] (maybe <- 0x400000e3) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P932: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P933: !BST [14] (maybe <- 0x400000e4) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P934: !BLD [1] (FP)
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

P935: !MEMBAR (Int)
membar #StoreLoad

P936: !DWLD [12] (Int)
ldx [%i3 + 0], %o4
! move %o4(upper) -> %o4(upper)

P937: !BST [6] (maybe <- 0x400000e5) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P938: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f1

P939: !REPLACEMENT [2] (Int)
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

P940: !ST [0] (maybe <- 0x800030) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P941: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P942: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P943: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P944: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P945: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f4

P946: !BLD [0] (FP)
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

P947: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P948: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P949: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P950: !LD [9] (FP)
ld [%i1 + 512], %f10
! 1 addresses covered

P951: !BLD [3] (FP)
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

P952: !BLD [7] (FP)
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

P953: !LD [1] (Int) (Branch target of P596)
lduw [%i0 + 4], %l7
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
ba P954
nop

TARGET596:
ba RET596
nop


P954: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P955: !LD [10] (FP)
ld [%i2 + 32], %f2
! 1 addresses covered

P956: !REPLACEMENT [0] (Int)
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

P957: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P958: !BST [10] (maybe <- 0x400000e8) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P959: !PREFETCH [11] (Int) (CBR)
prefetch [%i2 + 64], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET959
nop
RET959:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P960: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P961: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P962: !BST [12] (maybe <- 0x400000e9) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P963: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f5
fmovd %f36, %f6

P964: !BST [3] (maybe <- 0x400000ea) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P965: !BST [2] (maybe <- 0x400000ee) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P966: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P967: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P968: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P969: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P970: !BST [12] (maybe <- 0x400000f2) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P971: !BST [5] (maybe <- 0x400000f3) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P972: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f10

P973: !BLD [0] (FP)
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

P974: !BST [0] (maybe <- 0x400000f6) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
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
be,pn  %xcc, TARGET974
nop
RET974:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P975: !BLD [11] (FP)
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

P976: !BST [5] (maybe <- 0x400000fa) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P977: !REPLACEMENT [11] (Int)
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

P978: !BST [7] (maybe <- 0x400000fd) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
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

P980: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P981: !BST [14] (maybe <- 0x40000100) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P982: !BST [9] (maybe <- 0x40000101) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P983: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f0
membar #Sync 
! 1 addresses covered
fmovd %f8, %f0

P984: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P985: !BST [8] (maybe <- 0x40000102) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P986: !BLD [2] (FP)
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

P987: !BLD [8] (FP) (Branch target of P959)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5
ba P988
nop

TARGET959:
ba RET959
nop


P988: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P989: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P990: !DWST [0] (maybe <- 0x800031) (Int)
sllx %l4, 32, %o5 
add   %l4, 1, %l4
or %o5, %l4, %o5
stx %o5, [%i0 + 0]
add   %l4, 1, %l4

P991: !LD [7] (Int)
lduw [%i1 + 84], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P992: !BLD [0] (FP)
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

P993: !BLD [1] (FP)
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

P994: !CASX [5] (maybe <- 0x800033) (Int) (Branch target of P815)
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
ba P995
nop

TARGET815:
ba RET815
nop


P995: !DWLD [5] (Int)
ldx [%i1 + 72], %l6
! move %l6(lower) -> %o2(lower)
srl %l6, 0, %l3
or %l3, %o2, %o2

P996: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P997: !PREFETCH [4] (Int) (CBR)
prefetch [%i0 + 64], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET997
nop
RET997:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P998: !BST [3] (maybe <- 0x40000103) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P999: !BLD [8] (FP)
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

P1000: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f0
membar #Sync 
! 1 addresses covered

P1001: !BST [15] (maybe <- 0x40000107) (FP) (Branch target of P785)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 
ba P1002
nop

TARGET785:
ba RET785
nop


P1002: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P1003: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P1004: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f36, %f2

P1005: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P1006: !BLD [2] (FP)
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

P1007: !BST [7] (maybe <- 0x40000108) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
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
be,pt  %xcc, TARGET1007
nop
RET1007:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P1008: !BLD [1] (FP)
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

P1009: !BLD [3] (FP)
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

P1010: !DWST [14] (maybe <- 0x800034) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 128 ] 
add   %l4, 1, %l4

P1011: !PREFETCH [4] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i0 + 64] %asi, 1

P1012: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P1013: !REPLACEMENT [2] (Int)
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

P1014: !BST [6] (maybe <- 0x4000010b) (FP) (Branch target of P997)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 
ba P1015
nop

TARGET997:
ba RET997
nop


P1015: !ST [13] (maybe <- 0x800035) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P1016: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f0
membar #Sync 
! 1 addresses covered

P1017: !BLD [3] (FP)
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

P1018: !MEMBAR (Int) (Branch target of P847)
membar #StoreLoad
ba P1019
nop

TARGET847:
ba RET847
nop


P1019: !LD [0] (Int)
lduw [%i0 + 0], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P1020: !LD [1] (Int)
lduw [%i0 + 4], %l3
! move %l3(lower) -> %o3(lower)
or %l3, %o3, %o3

P1021: !LD [2] (Int)
lduw [%i0 + 12], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P1022: !LD [3] (Int)
lduw [%i0 + 32], %l3
! move %l3(lower) -> %o4(lower)
or %l3, %o4, %o4
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
lduw [%i1 + 76], %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0

P1025: !LD [6] (Int)
lduw [%i1 + 80], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P1026: !LD [7] (Int)
lduw [%i1 + 84], %l3
! move %l3(lower) -> %o1(lower)
or %l3, %o1, %o1

P1027: !LD [8] (FP)
ld [%i1 + 256], %f5
! 1 addresses covered

P1028: !LD [9] (FP) (Branch target of P765)
ld [%i1 + 512], %f6
! 1 addresses covered
ba P1029
nop

TARGET765:
ba RET765
nop


P1029: !LD [10] (Int)
lduw [%i2 + 32], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P1030: !LD [11] (Int)
lduw [%i2 + 64], %l3
! move %l3(lower) -> %o2(lower)
or %l3, %o2, %o2

P1031: !LD [12] (Int)
lduw [%i3 + 0], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P1032: !LD [13] (Int) (Branch target of P679)
lduw [%i3 + 64], %l3
! move %l3(lower) -> %o3(lower)
or %l3, %o3, %o3
ba P1033
nop

TARGET679:
ba RET679
nop


P1033: !LD [14] (Int)
lduw [%i3 + 128], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P1034: !LD [15] (Int)
lduw [%i3 + 192], %l3
! move %l3(lower) -> %o4(lower)
or %l3, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

END_NODES1: ! Test istream for CPU 1 ends
sethi %hi(0xdead0e0f), %l6
or    %l6, %lo(0xdead0e0f), %l6
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0
stw %l6, [%i5] 
ld [%i5], %f7
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

! Initialize LFSR to 0x47da^4
sethi %hi(0x47da), %l0
or    %l0, %lo(0x47da), %l0
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

P1035: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f0
membar #Sync 
! 1 addresses covered

P1036: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P1037: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P1038: !PREFETCH [10] (Int) (CBR)
prefetch [%i2 + 32], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1038
nop
RET1038:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P1039: !LD [15] (Int)
lduw [%i3 + 192], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1040: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f36, %f2

P1041: !CAS [5] (maybe <- 0x1000001) (Int)
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

P1042: !BLD [6] (FP)
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

P1043: !LD [4] (Int)
lduw [%i0 + 64], %l3
! move %l3(lower) -> %o1(lower)
or %l3, %o1, %o1

P1044: !BST [9] (maybe <- 0x40800001) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P1045: !LD [5] (Int) (Branch target of P1345)
lduw [%i1 + 76], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
ba P1046
nop

TARGET1345:
ba RET1345
nop


P1046: !ST [15] (maybe <- 0x1000002) (Int) (LE)
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
stwa   %l7, [%i3 + 192] %asi
add   %l4, 1, %l4

P1047: !BST [0] (maybe <- 0x40800002) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1048: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P1049: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P1050: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P1051: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P1052: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P1053: !BST [10] (maybe <- 0x40800006) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P1054: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P1055: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P1056: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P1057: !BLD [1] (FP)
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

P1058: !REPLACEMENT [9] (Int)
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

P1059: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P1060: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P1061: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P1062: !ST [10] (maybe <- 0x1000003) (Int) (CBR)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1062
nop
RET1062:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P1063: !BST [14] (maybe <- 0x40800007) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P1064: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P1065: !BLD [5] (FP)
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

P1066: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P1067: !BST [2] (maybe <- 0x40800008) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1068: !BST [3] (maybe <- 0x4080000c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1069: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P1070: !BST [15] (maybe <- 0x40800010) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P1071: !BST [5] (maybe <- 0x40800011) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1072: !REPLACEMENT [13] (Int)
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

P1073: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P1074: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P1075: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P1076: !CASX [12] (maybe <- 0x1000004) (Int)
add %i3, 0, %l6
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

P1077: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P1078: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P1079: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P1080: !CAS [2] (maybe <- 0x1000005) (Int) (Branch target of P1143)
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
ba P1081
nop

TARGET1143:
ba RET1143
nop


P1081: !BLD [7] (FP) (Branch target of P1290)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f5
fmovd %f36, %f6
ba P1082
nop

TARGET1290:
ba RET1290
nop


P1082: !BST [0] (maybe <- 0x40800014) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1083: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P1084: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f9
fmovd %f36, %f10

P1085: !BLD [2] (FP)
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

P1086: !LD [10] (FP)
ld [%i2 + 32], %f0
! 1 addresses covered

P1087: !ST [2] (maybe <- 0x1000006) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P1088: !BST [2] (maybe <- 0x40800018) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1089: !CAS [9] (maybe <- 0x1000007) (Int)
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

P1090: !REPLACEMENT [3] (Int)
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

P1091: !BST [13] (maybe <- 0x4080001c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P1092: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f36, %f2

P1093: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P1094: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P1095: !BST [3] (maybe <- 0x4080001d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1096: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f5
fmovd %f36, %f6

P1097: !BLD [5] (FP)
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

P1098: !BST [4] (maybe <- 0x40800021) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P1099: !ST [14] (maybe <- 0x1000008) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P1100: !BST [9] (maybe <- 0x40800022) (FP) (CBR)
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
be,pn  %xcc, TARGET1100
nop
RET1100:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P1101: !REPLACEMENT [9] (Int)
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

P1102: !LD [1] (FP)
ld [%i0 + 4], %f11
! 1 addresses covered

P1103: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P1104: !CAS [13] (maybe <- 0x1000009) (Int)
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

P1105: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P1106: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P1107: !CAS [3] (maybe <- 0x100000a) (Int)
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

P1108: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P1109: !PREFETCH [2] (Int) (CBR)
prefetch [%i0 + 12], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1109
nop
RET1109:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P1110: !BST [5] (maybe <- 0x40800023) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1111: !BST [0] (maybe <- 0x40800026) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1112: !BST [7] (maybe <- 0x4080002a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1113: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P1114: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P1115: !CAS [3] (maybe <- 0x100000b) (Int)
add %i0, 32, %l7
lduw [%l7], %l3
mov %l3, %l6
! move %l6(lower) -> %o3(lower)
or %l6, %o3, %o3
mov %l4, %o4
cas [%l7], %l6, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P1116: !DWST [14] (maybe <- 0x100000c) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 128 ] 
add   %l4, 1, %l4

P1117: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P1118: !PREFETCH [7] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i1 + 84] %asi, 1

P1119: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P1120: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f13

P1121: !BST [7] (maybe <- 0x4080002d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1122: !BLD [5] (FP)
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

P1123: !BST [11] (maybe <- 0x40800030) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P1124: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P1125: !DWST [3] (maybe <- 0x100000d) (Int)
mov %l4, %l7 
sllx %l7, 32, %l7 
stx %l7, [%i0 + 32 ] 
add   %l4, 1, %l4

P1126: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P1127: !BST [12] (maybe <- 0x40800031) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P1128: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P1129: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P1130: !BST [2] (maybe <- 0x40800032) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
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
be,pn  %xcc, TARGET1130
nop
RET1130:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P1131: !DWLD [5] (Int)
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

P1132: !NOP (Int)
nop

P1133: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P1134: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P1135: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P1136: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P1137: !DWLD [5] (Int) (LE)
wr %g0, 0x88, %asi
ldxa [%i1 + 72] %asi, %o5
! move %o5(upper) -> %o0(upper)
or %o5, %g0, %o0

P1138: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P1139: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P1140: !BST [5] (maybe <- 0x40800036) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1141: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P1142: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f3
fmovd %f36, %f4

P1143: !BST [9] (maybe <- 0x40800039) (FP) (CBR)
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
be,pt  %xcc, TARGET1143
nop
RET1143:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P1144: !BST [13] (maybe <- 0x4080003a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P1145: !DWLD [5] (Int) (CBR)
ldx [%i1 + 72], %o5
! move %o5(lower) -> %o0(lower)
srlx %o0, 32, %o0
sllx %o0, 32, %o0
srl %o5, 0, %l7
or %l7, %o0, %o0

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1145
nop
RET1145:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P1146: !DWST [7] (maybe <- 0x4080003b) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=21 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
std %f20, [%i1 + 80]

P1147: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P1148: !BLD [15] (FP) (Branch target of P1231)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7
ba P1149
nop

TARGET1231:
ba RET1231
nop


P1149: !ST [6] (maybe <- 0x100000e) (Int) (LE)
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

P1150: !BST [6] (maybe <- 0x4080003d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1151: !BST [3] (maybe <- 0x40800040) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1152: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P1153: !DWLD [7] (Int)
ldx [%i1 + 80], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)

P1154: !LD [10] (FP)
ld [%i2 + 32], %f9
! 1 addresses covered

P1155: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P1156: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P1157: !BLD [2] (FP)
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

P1158: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P1159: !BST [4] (maybe <- 0x40800044) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P1160: !BST [2] (maybe <- 0x40800045) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1161: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P1162: !LD [3] (Int)
lduw [%i0 + 32], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P1163: !BLD [10] (FP)
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

P1164: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P1165: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P1166: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f0
membar #Sync 
! 3 addresses covered
fmovs %f3, %f0
fmovs %f4, %f1
fmovs %f5, %f2

P1167: !BST [8] (maybe <- 0x40800049) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P1168: !BST [10] (maybe <- 0x4080004a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P1169: !DWST [5] (maybe <- 0x100000f) (Int)
mov %l4, %l6 
stx %l6, [%i1 + 72]
add   %l4, 1, %l4

P1170: !BLD [0] (FP)
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

P1171: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f36, %f8

P1172: !REPLACEMENT [5] (Int)
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

P1173: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P1174: !BST [5] (maybe <- 0x4080004b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1175: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P1176: !CAS [11] (maybe <- 0x1000010) (Int)
add %i2, 64, %o5
lduw [%o5], %l6
mov %l6, %l7
! move %l7(lower) -> %o2(lower)
or %l7, %o2, %o2
mov %l4, %o3
cas [%o5], %l7, %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P1177: !BST [1] (maybe <- 0x4080004e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1178: !BLD [6] (FP) (Branch target of P1405)
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
ba P1179
nop

TARGET1405:
ba RET1405
nop


P1179: !BST [11] (maybe <- 0x40800052) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P1180: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P1181: !BST [15] (maybe <- 0x40800053) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P1182: !BST [8] (maybe <- 0x40800054) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P1183: !PREFETCH [10] (Int) (Branch target of P1199)
prefetch [%i2 + 32], 1
ba P1184
nop

TARGET1199:
ba RET1199
nop


P1184: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P1185: !BST [1] (maybe <- 0x40800055) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1186: !BLD [10] (FP)
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

P1187: !BST [0] (maybe <- 0x40800059) (FP) (Branch target of P1227)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 
ba P1188
nop

TARGET1227:
ba RET1227
nop


P1188: !BST [15] (maybe <- 0x4080005d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P1189: !PREFETCH [8] (Int) (CBR)
prefetch [%i1 + 256], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1189
nop
RET1189:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P1190: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f0
membar #Sync 
! 3 addresses covered
fmovs %f3, %f0
fmovs %f4, %f1
fmovs %f5, %f2

P1191: !BST [5] (maybe <- 0x4080005e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1192: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P1193: !BST [3] (maybe <- 0x40800061) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1194: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P1195: !BLD [7] (FP)
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

P1196: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P1197: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P1198: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P1199: !PREFETCH [12] (Int) (CBR)
prefetch [%i3 + 0], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1199
nop
RET1199:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P1200: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P1201: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P1202: !BST [0] (maybe <- 0x40800065) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1203: !BST [1] (maybe <- 0x40800069) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1204: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P1205: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P1206: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P1207: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P1208: !DWST [13] (maybe <- 0x1000011) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 64 ] 
add   %l4, 1, %l4

P1209: !BST [11] (maybe <- 0x4080006d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P1210: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P1211: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P1212: !MEMBAR (Int)
membar #StoreLoad

P1213: !BST [8] (maybe <- 0x4080006e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P1214: !LD [12] (Int)
lduw [%i3 + 0], %o5
! move %o5(lower) -> %o3(lower)
or %o5, %o3, %o3

P1215: !BST [7] (maybe <- 0x4080006f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1216: !LD [4] (FP)
ld [%i0 + 64], %f13
! 1 addresses covered

P1217: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P1218: !BST [6] (maybe <- 0x40800072) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1219: !LD [13] (Int)
lduw [%i3 + 64], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P1220: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P1221: !BST [6] (maybe <- 0x40800075) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1222: !DWST [9] (maybe <- 0x1000012) (Int) (Branch target of P1493)
mov %l4, %o5 
sllx %o5, 32, %o5 
stx %o5, [%i1 + 512 ] 
add   %l4, 1, %l4
ba P1223
nop

TARGET1493:
ba RET1493
nop


P1223: !BLD [8] (FP)
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

P1224: !BLD [4] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f0
membar #Sync 
! 1 addresses covered

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1224
nop
RET1224:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P1225: !CASX [4] (maybe <- 0x1000013) (Int)
add %i0, 64, %l3
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

P1226: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P1227: !BLD [2] (FP) (CBR)
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
be,pn  %xcc, TARGET1227
nop
RET1227:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P1228: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P1229: !BLD [3] (FP)
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

P1230: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P1231: !BLD [2] (FP) (CBR)
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
be,pn  %xcc, TARGET1231
nop
RET1231:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P1232: !BST [5] (maybe <- 0x40800078) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1233: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P1234: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P1235: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P1236: !BLD [5] (FP)
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

P1237: !ST [12] (maybe <- 0x1000014) (Int) (Branch target of P1100)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4
ba P1238
nop

TARGET1100:
ba RET1100
nop


P1238: !BLD [7] (FP) (Branch target of P1367)
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
ba P1239
nop

TARGET1367:
ba RET1367
nop


P1239: !BST [10] (maybe <- 0x4080007b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P1240: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P1241: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P1242: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P1243: !BST [1] (maybe <- 0x4080007c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1244: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P1245: !BST [10] (maybe <- 0x40800080) (FP) (CBR)
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
be,pn  %xcc, TARGET1245
nop
RET1245:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P1246: !BST [10] (maybe <- 0x40800081) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P1247: !BST [1] (maybe <- 0x40800082) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1248: !BST [13] (maybe <- 0x40800086) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P1249: !BST [4] (maybe <- 0x40800087) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P1250: !BST [1] (maybe <- 0x40800088) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1251: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P1252: !DWST [5] (maybe <- 0x1000015) (Int) (CBR) (Branch target of P1224)
mov %l4, %l3 
stx %l3, [%i1 + 72]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1252
nop
RET1252:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0

ba P1253
nop

TARGET1224:
ba RET1224
nop


P1253: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P1254: !BLD [1] (FP)
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

P1255: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P1256: !BST [14] (maybe <- 0x4080008c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P1257: !BST [15] (maybe <- 0x4080008d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P1258: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f14

P1259: !BST [8] (maybe <- 0x4080008e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P1260: !BLD [11] (FP)
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

P1261: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P1262: !BLD [14] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f0
membar #Sync 
! 1 addresses covered

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1262
nop
RET1262:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P1263: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P1264: !DWLD [12] (Int)
ldx [%i3 + 0], %o5
! move %o5(upper) -> %o1(lower)
srlx %o5, 32, %l7
or %l7, %o1, %o1

P1265: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P1266: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P1267: !BST [8] (maybe <- 0x4080008f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P1268: !BST [6] (maybe <- 0x40800090) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1269: !BST [5] (maybe <- 0x40800093) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1270: !SWAP [11] (maybe <- 0x1000016) (Int) (CBR)
mov %l4, %o2
swap  [%i2 + 64], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1270
nop
RET1270:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P1271: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P1272: !BLD [3] (FP)
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

P1273: !DWLD [3] (Int)
ldx [%i0 + 32], %l7
! move %l7(upper) -> %o2(lower)
srlx %l7, 32, %l6
or %l6, %o2, %o2

P1274: !DWLD [11] (Int)
ldx [%i2 + 64], %o3
! move %o3(upper) -> %o3(upper)

P1275: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P1276: !BST [4] (maybe <- 0x40800096) (FP) (CBR) (Branch target of P1502)
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
be,pt  %xcc, TARGET1276
nop
RET1276:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0

ba P1277
nop

TARGET1502:
ba RET1502
nop


P1277: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f7

P1278: !CASX [5] (maybe <- 0x1000017) (Int)
add %i1, 72, %l7
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

P1279: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P1280: !BLD [2] (FP)
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

P1281: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P1282: !BLD [2] (FP)
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

P1283: !LD [5] (Int)
lduw [%i1 + 76], %l7
! move %l7(lower) -> %o0(lower)
or %l7, %o0, %o0

P1284: !REPLACEMENT [10] (Int)
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

P1285: !ST [1] (maybe <- 0x1000018) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P1286: !BST [4] (maybe <- 0x40800097) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P1287: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P1288: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f0
membar #Sync 
! 1 addresses covered

P1289: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P1290: !BLD [11] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1290
nop
RET1290:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P1291: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P1292: !BST [0] (maybe <- 0x40800098) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1293: !BST [10] (maybe <- 0x4080009c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P1294: !BST [6] (maybe <- 0x4080009d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1295: !BLD [5] (FP)
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

P1296: !BST [5] (maybe <- 0x408000a0) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1297: !LD [7] (Int)
lduw [%i1 + 84], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P1298: !BST [11] (maybe <- 0x408000a3) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P1299: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P1300: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P1301: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P1302: !ST [1] (maybe <- 0x1000019) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P1303: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P1304: !BST [11] (maybe <- 0x408000a4) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P1305: !BST [8] (maybe <- 0x408000a5) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P1306: !BST [2] (maybe <- 0x408000a6) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1307: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P1308: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f36, %f8

P1309: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P1310: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P1311: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P1312: !CASX [5] (maybe <- 0x100001a) (Int)
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

P1313: !BST [15] (maybe <- 0x408000aa) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P1314: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P1315: !BLD [7] (FP)
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

P1316: !BST [15] (maybe <- 0x408000ab) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P1317: !MEMBAR (Int)
membar #StoreLoad

P1318: !BLD [2] (FP)
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

P1319: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P1320: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P1321: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P1322: !BST [6] (maybe <- 0x408000ac) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1323: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P1324: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P1325: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P1326: !BST [4] (maybe <- 0x408000af) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P1327: !ST [13] (maybe <- 0x100001b) (Int) (Branch target of P1109)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4
ba P1328
nop

TARGET1109:
ba RET1109
nop


P1328: !BST [14] (maybe <- 0x408000b0) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P1329: !CASX [13] (maybe <- 0x100001c) (Int)
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

P1330: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P1331: !LD [5] (Int) (Branch target of P1332)
lduw [%i1 + 76], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0
ba P1332
nop

TARGET1332:
ba RET1332
nop


P1332: !DWST [5] (maybe <- 0x100001d) (Int) (CBR)
mov %l4, %l7 
stx %l7, [%i1 + 72]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1332
nop
RET1332:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P1333: !BST [8] (maybe <- 0x408000b1) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P1334: !BST [3] (maybe <- 0x408000b2) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1335: !CASX [11] (maybe <- 0x100001e) (Int) (Branch target of P1363)
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
ba P1336
nop

TARGET1363:
ba RET1363
nop


P1336: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P1337: !BLD [0] (FP) (Branch target of P1276)
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
ba P1338
nop

TARGET1276:
ba RET1276
nop


P1338: !BST [2] (maybe <- 0x408000b6) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1339: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P1340: !LD [8] (Int)
lduw [%i1 + 256], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P1341: !BLD [0] (FP) (CBR) (Branch target of P1189)
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
be,pn  %xcc, TARGET1341
nop
RET1341:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0

ba P1342
nop

TARGET1189:
ba RET1189
nop


P1342: !BST [11] (maybe <- 0x408000ba) (FP) (Branch target of P1262)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 
ba P1343
nop

TARGET1262:
ba RET1262
nop


P1343: !BLD [3] (FP)
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

P1344: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f0
membar #Sync 
! 1 addresses covered

P1345: !BST [4] (maybe <- 0x408000bb) (FP) (CBR)
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
be,pn  %xcc, TARGET1345
nop
RET1345:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P1346: !BST [1] (maybe <- 0x408000bc) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1347: !BST [11] (maybe <- 0x408000c0) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P1348: !MEMBAR (Int)
membar #StoreLoad

P1349: !BST [2] (maybe <- 0x408000c1) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1350: !BLD [2] (FP)
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

P1351: !MEMBAR (Int)
membar #StoreLoad

P1352: !BST [13] (maybe <- 0x408000c5) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P1353: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P1354: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P1355: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P1356: !BLD [1] (FP)
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

P1357: !BST [9] (maybe <- 0x408000c6) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P1358: !BLD [0] (FP)
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

P1359: !BST [2] (maybe <- 0x408000c7) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1360: !ST [10] (maybe <- 0x100001f) (Int) (Branch target of P1270)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4
ba P1361
nop

TARGET1270:
ba RET1270
nop


P1361: !BLD [2] (FP)
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

P1362: !BST [3] (maybe <- 0x408000cb) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1363: !BST [13] (maybe <- 0x408000cf) (FP) (CBR)
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
be,pt  %xcc, TARGET1363
nop
RET1363:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P1364: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P1365: !BLD [6] (FP)
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

P1366: !BST [15] (maybe <- 0x408000d0) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P1367: !BST [8] (maybe <- 0x408000d1) (FP) (CBR)
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
be,pn  %xcc, TARGET1367
nop
RET1367:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P1368: !BST [15] (maybe <- 0x408000d2) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P1369: !CASX [8] (maybe <- 0x1000020) (Int)
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

P1370: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P1371: !BST [5] (maybe <- 0x408000d3) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1372: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P1373: !BLD [2] (FP)
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

P1374: !BST [3] (maybe <- 0x408000d6) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1375: !BST [5] (maybe <- 0x408000da) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1376: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P1377: !BST [6] (maybe <- 0x408000dd) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1378: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f10

P1379: !BST [11] (maybe <- 0x408000e0) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P1380: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P1381: !BLD [2] (FP) (Branch target of P1341)
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
ba P1382
nop

TARGET1341:
ba RET1341
nop


P1382: !BLD [4] (FP)
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

P1383: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P1384: !BLD [2] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f0
membar #Sync 
! 4 addresses covered
fmovs %f3, %f2
fmovs %f8, %f3

P1385: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f4

P1386: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P1387: !DWST [0] (maybe <- 0x1000021) (Int)
sllx %l4, 32, %l7 
add   %l4, 1, %l4
or %l7, %l4, %l7
stx %l7, [%i0 + 0]
add   %l4, 1, %l4

P1388: !LD [12] (Int)
lduw [%i3 + 0], %l7
! move %l7(lower) -> %o0(lower)
or %l7, %o0, %o0

P1389: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P1390: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P1391: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P1392: !ST [0] (maybe <- 0x1000023) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P1393: !PREFETCH [15] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i3 + 192] %asi, 1

P1394: !PREFETCH [0] (Int) (CBR)
prefetch [%i0 + 0], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1394
nop
RET1394:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P1395: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P1396: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P1397: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P1398: !BST [11] (maybe <- 0x408000e1) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P1399: !BST [9] (maybe <- 0x408000e2) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P1400: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P1401: !BST [8] (maybe <- 0x408000e3) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P1402: !LD [8] (Int)
lduw [%i1 + 256], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P1403: !BLD [1] (FP)
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

P1404: !BST [12] (maybe <- 0x408000e4) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P1405: !PREFETCH [13] (Int) (CBR) (Branch target of P1062)
prefetch [%i3 + 64], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1405
nop
RET1405:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0

ba P1406
nop

TARGET1062:
ba RET1062
nop


P1406: !LD [4] (FP)
ld [%i0 + 64], %f13
! 1 addresses covered

P1407: !DWLD [5] (Int)
ldx [%i1 + 72], %o5
! move %o5(lower) -> %o1(lower)
srl %o5, 0, %l7
or %l7, %o1, %o1

P1408: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P1409: !BLD [8] (FP)
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

P1410: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P1411: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f0
membar #Sync 
! 1 addresses covered

P1412: !LD [3] (Int)
lduw [%i0 + 32], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P1413: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P1414: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P1415: !BST [13] (maybe <- 0x408000e5) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P1416: !BST [4] (maybe <- 0x408000e6) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P1417: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P1418: !BLD [0] (FP)
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

P1419: !BST [4] (maybe <- 0x408000e7) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P1420: !BST [4] (maybe <- 0x408000e8) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P1421: !REPLACEMENT [13] (Int)
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

P1422: !BST [13] (maybe <- 0x408000e9) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P1423: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P1424: !PREFETCH [3] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i0 + 32] %asi, 1

P1425: !LD [6] (Int)
lduw [%i1 + 80], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2

P1426: !DWST [8] (maybe <- 0x1000024) (Int) (Branch target of P1038)
mov %l4, %l7 
sllx %l7, 32, %l7 
stx %l7, [%i1 + 256 ] 
add   %l4, 1, %l4
ba P1427
nop

TARGET1038:
ba RET1038
nop


P1427: !PREFETCH [14] (Int) (Branch target of P1499)
prefetch [%i3 + 128], 1
ba P1428
nop

TARGET1499:
ba RET1499
nop


P1428: !BST [13] (maybe <- 0x408000ea) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P1429: !BLD [2] (FP)
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

P1430: !ST [4] (maybe <- 0x1000025) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P1431: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P1432: !MEMBAR (Int)
membar #StoreLoad

P1433: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P1434: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P1435: !BST [0] (maybe <- 0x408000eb) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1436: !BST [11] (maybe <- 0x408000ef) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P1437: !BLD [3] (FP)
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

P1438: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P1439: !BLD [14] (FP)
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

P1440: !PREFETCH [8] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i1 + 256] %asi, 1

P1441: !REPLACEMENT [6] (Int)
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

P1442: !BLD [0] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f0
membar #Sync 
! 4 addresses covered
fmovs %f3, %f2
fmovs %f8, %f3

P1443: !BST [9] (maybe <- 0x408000f0) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P1444: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P1445: !PREFETCH [12] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i3 + 0] %asi, 1

P1446: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P1447: !BST [1] (maybe <- 0x408000f1) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1448: !BLD [9] (FP) (Branch target of P1245)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4
ba P1449
nop

TARGET1245:
ba RET1245
nop


P1449: !BST [1] (maybe <- 0x408000f5) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1450: !BST [4] (maybe <- 0x408000f9) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P1451: !BST [14] (maybe <- 0x408000fa) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P1452: !DWST [9] (maybe <- 0x1000026) (Int)
mov %l4, %o5 
sllx %o5, 32, %o5 
stx %o5, [%i1 + 512 ] 
add   %l4, 1, %l4

P1453: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P1454: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P1455: !BLD [12] (FP) (Branch target of P1394)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6
ba P1456
nop

TARGET1394:
ba RET1394
nop


P1456: !BLD [0] (FP)
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

P1457: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P1458: !DWST [9] (maybe <- 0x1000027) (Int)
mov %l4, %l7 
sllx %l7, 32, %l7 
stx %l7, [%i1 + 512 ] 
add   %l4, 1, %l4

P1459: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P1460: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P1461: !BST [4] (maybe <- 0x408000fb) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P1462: !BLD [7] (FP)
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

P1463: !BST [6] (maybe <- 0x408000fc) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1464: !BLD [9] (FP) (Branch target of P1130)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f0
membar #Sync 
! 1 addresses covered
ba P1465
nop

TARGET1130:
ba RET1130
nop


P1465: !BST [5] (maybe <- 0x408000ff) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1466: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f36, %f2

P1467: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P1468: !DWST [1] (maybe <- 0x1000028) (Int)
sllx %l4, 32, %l7 
add   %l4, 1, %l4
or %l7, %l4, %l7
stx %l7, [%i0 + 0]
add   %l4, 1, %l4

P1469: !DWLD [2] (Int)
ldx [%i0 + 8], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P1470: !BLD [3] (FP)
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

P1471: !BST [0] (maybe <- 0x40800102) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1472: !LD [3] (Int)
lduw [%i0 + 32], %o5
! move %o5(lower) -> %o3(lower)
or %o5, %o3, %o3

P1473: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P1474: !MEMBAR (Int)
membar #StoreLoad

P1475: !BLD [2] (FP)
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

P1476: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P1477: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P1478: !BST [0] (maybe <- 0x40800106) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1479: !CASX [0] (maybe <- 0x100002a) (Int) (Branch target of P1252)
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
ba P1480
nop

TARGET1252:
ba RET1252
nop


P1480: !BLD [5] (FP)
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

P1481: !BST [0] (maybe <- 0x4080010a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1482: !DWLD [14] (Int)
ldx [%i3 + 128], %o1
! move %o1(upper) -> %o1(upper)

P1483: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P1484: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P1485: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P1486: !BST [5] (maybe <- 0x4080010e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1487: !DWLD [6] (Int)
ldx [%i1 + 80], %l3
! move %l3(upper) -> %o1(lower)
srlx %o1, 32, %o1
sllx %o1, 32, %o1
srlx %l3, 32, %o5
or %o5, %o1, %o1
! move %l3(lower) -> %o2(upper)
sllx %l3, 32, %o2

P1488: !BST [4] (maybe <- 0x40800111) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P1489: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P1490: !BST [13] (maybe <- 0x40800112) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P1491: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P1492: !BST [12] (maybe <- 0x40800113) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P1493: !BST [11] (maybe <- 0x40800114) (FP) (CBR)
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
be,pt  %xcc, TARGET1493
nop
RET1493:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P1494: !BST [13] (maybe <- 0x40800115) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P1495: !CASX [0] (maybe <- 0x100002c) (Int)
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

P1496: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P1497: !BLD [6] (FP)
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

P1498: !LD [14] (Int)
lduw [%i3 + 128], %l7
! move %l7(lower) -> %o4(lower)
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P1499: !BLD [0] (FP) (CBR)
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
be,pn  %xcc, TARGET1499
nop
RET1499:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P1500: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P1501: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P1502: !PREFETCH [10] (Int) (CBR)
prefetch [%i2 + 32], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1502
nop
RET1502:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P1503: !BLD [3] (FP)
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

P1504: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f0
membar #Sync 
! 1 addresses covered

P1505: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P1506: !DWLD [3] (Int)
ldx [%i0 + 32], %o0
! move %o0(upper) -> %o0(upper)

P1507: !LD [3] (Int)
lduw [%i0 + 32], %l3
! move %l3(lower) -> %o0(lower)
srlx %o0, 32, %o0
sllx %o0, 32, %o0
or %l3, %o0, %o0

P1508: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P1509: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f2

P1510: !BST [11] (maybe <- 0x40800116) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P1511: !LD [7] (Int)
lduw [%i1 + 84], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P1512: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P1513: !BST [1] (maybe <- 0x40800117) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1514: !BST [12] (maybe <- 0x4080011b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P1515: !BST [2] (maybe <- 0x4080011c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1516: !BLD [2] (FP)
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

P1517: !BLD [12] (FP) (Branch target of P1145)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8
ba P1518
nop

TARGET1145:
ba RET1145
nop


P1518: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P1519: !BST [12] (maybe <- 0x40800120) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P1520: !BST [9] (maybe <- 0x40800121) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P1521: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P1522: !BST [3] (maybe <- 0x40800122) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1523: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P1524: !BLD [6] (FP)
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

P1525: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P1526: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P1527: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P1528: !BLD [7] (FP)
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

P1529: !ST [12] (maybe <- 0x100002e) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P1530: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P1531: !BST [3] (maybe <- 0x40800126) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1532: !MEMBAR (Int)
membar #StoreLoad

P1533: !BST [13] (maybe <- 0x4080012a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P1534: !BST [7] (maybe <- 0x4080012b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1535: !MEMBAR (Int)
membar #StoreLoad

P1536: !LD [0] (Int)
lduw [%i0 + 0], %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1

P1537: !LD [1] (Int)
lduw [%i0 + 4], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P1538: !LD [2] (Int)
lduw [%i0 + 12], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2

P1539: !LD [3] (FP)
ld [%i0 + 32], %f0
! 1 addresses covered

P1540: !LD [4] (Int)
lduw [%i0 + 64], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P1541: !LD [5] (Int)
lduw [%i1 + 76], %l6
! move %l6(lower) -> %o3(lower)
or %l6, %o3, %o3

P1542: !LD [6] (FP)
ld [%i1 + 80], %f1
! 1 addresses covered

P1543: !LD [7] (Int)
lduw [%i1 + 84], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P1544: !LD [8] (Int)
lduw [%i1 + 256], %l6
! move %l6(lower) -> %o4(lower)
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P1545: !LD [9] (Int)
lduw [%i1 + 512], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1546: !LD [10] (FP)
ld [%i2 + 32], %f2
! 1 addresses covered

P1547: !LD [11] (Int)
lduw [%i2 + 64], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

P1548: !LD [12] (Int)
lduw [%i3 + 0], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P1549: !LD [13] (Int) (LE)
wr %g0, 0x88, %asi
lduwa [%i3 + 64] %asi, %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1

P1550: !LD [14] (Int)
lduw [%i3 + 128], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P1551: !LD [15] (Int)
lduw [%i3 + 192], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2

END_NODES2: ! Test istream for CPU 2 ends
sethi %hi(0xdead0e0f), %l7
or    %l7, %lo(0xdead0e0f), %l7
! move %l7(lower) -> %o3(upper)
sllx %l7, 32, %o3
stw %l7, [%i5] 
ld [%i5], %f3
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
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

! Initialize LFSR to 0x7f65^4
sethi %hi(0x7f65), %l0
or    %l0, %lo(0x7f65), %l0
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

P1552: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f0
membar #Sync 
! 3 addresses covered
fmovs %f3, %f0
fmovs %f4, %f1
fmovs %f5, %f2

P1553: !MEMBAR (Int)
membar #StoreLoad

P1554: !BST [8] (maybe <- 0x41000001) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P1555: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f3
fmovd %f36, %f4

P1556: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P1557: !BST [12] (maybe <- 0x41000002) (FP) (Branch target of P1734)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 
ba P1558
nop

TARGET1734:
ba RET1734
nop


P1558: !BST [3] (maybe <- 0x41000003) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1559: !PREFETCH [10] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i2 + 32] %asi, 1

P1560: !BST [1] (maybe <- 0x41000007) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1561: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P1562: !BST [2] (maybe <- 0x4100000b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1563: !ST [9] (maybe <- 0x1800001) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P1564: !BST [6] (maybe <- 0x4100000f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1565: !REPLACEMENT [7] (Int)
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

P1566: !BST [3] (maybe <- 0x41000012) (FP) (Branch target of P1865)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 
ba P1567
nop

TARGET1865:
ba RET1865
nop


P1567: !BST [8] (maybe <- 0x41000016) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P1568: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P1569: !DWST [8] (maybe <- 0x41000017) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
std %f20, [%i1 + 256]

P1570: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P1571: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P1572: !BLD [4] (FP) (Branch target of P1673)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9
ba P1573
nop

TARGET1673:
ba RET1673
nop


P1573: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P1574: !BST [9] (maybe <- 0x41000018) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P1575: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P1576: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P1577: !CASX [3] (maybe <- 0x1800002) (Int) (CBR)
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
be,pn  %xcc, TARGET1577
nop
RET1577:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P1578: !BST [15] (maybe <- 0x41000019) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P1579: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P1580: !ST [8] (maybe <- 0x1800003) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P1581: !BST [15] (maybe <- 0x4100001a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P1582: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P1583: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P1584: !BLD [3] (FP) (Branch target of P1650)
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
ba P1585
nop

TARGET1650:
ba RET1650
nop


P1585: !REPLACEMENT [13] (Int)
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

P1586: !ST [4] (maybe <- 0x1800004) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P1587: !BST [5] (maybe <- 0x4100001b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1588: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P1589: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P1590: !BLD [3] (FP)
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

P1591: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P1592: !BST [15] (maybe <- 0x4100001e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P1593: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P1594: !BLD [6] (FP)
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

P1595: !BLD [12] (FP) (Branch target of P1949)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9
ba P1596
nop

TARGET1949:
ba RET1949
nop


P1596: !BST [5] (maybe <- 0x4100001f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1597: !BST [11] (maybe <- 0x41000022) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P1598: !DWST [10] (maybe <- 0x1800005) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i2 + 32 ] 
add   %l4, 1, %l4

P1599: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P1600: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P1601: !BST [10] (maybe <- 0x41000023) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P1602: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P1603: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P1604: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P1605: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P1606: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f11
fmovd %f36, %f12

P1607: !BST [4] (maybe <- 0x41000024) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P1608: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P1609: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P1610: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P1611: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P1612: !BST [15] (maybe <- 0x41000025) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P1613: !DWLD [2] (Int)
ldx [%i0 + 8], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P1614: !DWLD [13] (Int)
ldx [%i3 + 64], %l3
! move %l3(upper) -> %o2(lower)
srlx %l3, 32, %o5
or %o5, %o2, %o2

P1615: !BST [7] (maybe <- 0x41000026) (FP) (Branch target of P1881)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 
ba P1616
nop

TARGET1881:
ba RET1881
nop


P1616: !BLD [15] (FP)
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

P1617: !BST [1] (maybe <- 0x41000029) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1618: !BST [1] (maybe <- 0x4100002d) (FP) (Branch target of P1755)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 
ba P1619
nop

TARGET1755:
ba RET1755
nop


P1619: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f0
membar #Sync 
! 1 addresses covered

P1620: !DWST [13] (maybe <- 0x1800006) (Int)
mov %l4, %l7 
sllx %l7, 32, %l7 
stx %l7, [%i3 + 64 ] 
add   %l4, 1, %l4

P1621: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P1622: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f36, %f2

P1623: !MEMBAR (Int)
membar #StoreLoad

P1624: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P1625: !BST [14] (maybe <- 0x41000031) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P1626: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P1627: !CASX [0] (maybe <- 0x1800007) (Int)
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

P1628: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P1629: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P1630: !MEMBAR (Int) (Branch target of P1929)
membar #StoreLoad
ba P1631
nop

TARGET1929:
ba RET1929
nop


P1631: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f5
fmovd %f36, %f6

P1632: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P1633: !BLD [9] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1633
nop
RET1633:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P1634: !BST [4] (maybe <- 0x41000032) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P1635: !PREFETCH [0] (Int) (CBR)
prefetch [%i0 + 0], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1635
nop
RET1635:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P1636: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f9
fmovd %f36, %f10

P1637: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P1638: !BLD [0] (FP)
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

P1639: !BST [9] (maybe <- 0x41000033) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P1640: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P1641: !BST [7] (maybe <- 0x41000034) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1642: !BST [5] (maybe <- 0x41000037) (FP) (Branch target of P1878)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 
ba P1643
nop

TARGET1878:
ba RET1878
nop


P1643: !PREFETCH [8] (Int) (Branch target of P2066)
prefetch [%i1 + 256], 1
ba P1644
nop

TARGET2066:
ba RET2066
nop


P1644: !BST [14] (maybe <- 0x4100003a) (FP) (Branch target of P2023)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 
ba P1645
nop

TARGET2023:
ba RET2023
nop


P1645: !BLD [1] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f0
membar #Sync 
! 4 addresses covered
fmovs %f3, %f2
fmovs %f8, %f3

P1646: !DWST [5] (maybe <- 0x1800009) (Int)
mov %l4, %l6 
stx %l6, [%i1 + 72]
add   %l4, 1, %l4

P1647: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P1648: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P1649: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P1650: !BLD [13] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1650
nop
RET1650:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P1651: !BST [1] (maybe <- 0x4100003b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1652: !BST [3] (maybe <- 0x4100003f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1653: !BST [3] (maybe <- 0x41000043) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1654: !BST [7] (maybe <- 0x41000047) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1655: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P1656: !BST [8] (maybe <- 0x4100004a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P1657: !BLD [3] (FP) (Branch target of P1659)
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
ba P1658
nop

TARGET1659:
ba RET1659
nop


P1658: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P1659: !BST [1] (maybe <- 0x4100004b) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
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
be,pt  %xcc, TARGET1659
nop
RET1659:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P1660: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P1661: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P1662: !BLD [2] (FP) (Branch target of P1635)
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
ba P1663
nop

TARGET1635:
ba RET1635
nop


P1663: !ST [6] (maybe <- 0x180000a) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P1664: !BLD [2] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f0
membar #Sync 
! 4 addresses covered
fmovs %f3, %f2
fmovs %f8, %f3

P1665: !PREFETCH [10] (Int) (CBR)
prefetch [%i2 + 32], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1665
nop
RET1665:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P1666: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P1667: !BST [8] (maybe <- 0x4100004f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P1668: !BLD [0] (FP)
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

P1669: !BLD [0] (FP)
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

P1670: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P1671: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P1672: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P1673: !BLD [15] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1673
nop
RET1673:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P1674: !REPLACEMENT [3] (Int)
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

P1675: !BLD [5] (FP) (Branch target of P1730)
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
ba P1676
nop

TARGET1730:
ba RET1730
nop


P1676: !BLD [2] (FP)
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

P1677: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P1678: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f5
fmovd %f36, %f6

P1679: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P1680: !NOP (Int)
nop

P1681: !CASX [11] (maybe <- 0x180000b) (Int)
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

P1682: !REPLACEMENT [2] (Int)
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

P1683: !BLD [6] (FP)
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

P1684: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P1685: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f11
fmovd %f36, %f12

P1686: !BST [4] (maybe <- 0x41000050) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P1687: !PREFETCH [15] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i3 + 192] %asi, 1

P1688: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P1689: !BLD [4] (FP)
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

P1690: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f0
membar #Sync 
! 1 addresses covered

P1691: !CAS [5] (maybe <- 0x180000c) (Int)
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

P1692: !DWLD [10] (Int) (CBR)
ldx [%i2 + 32], %o3
! move %o3(upper) -> %o3(upper)

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1692
nop
RET1692:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P1693: !DWST [15] (maybe <- 0x180000d) (Int)
mov %l4, %l3 
sllx %l3, 32, %l3 
stx %l3, [%i3 + 192 ] 
add   %l4, 1, %l4

P1694: !BLD [3] (FP)
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

P1695: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P1696: !BST [2] (maybe <- 0x41000051) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1697: !DWST [13] (maybe <- 0x180000e) (Int)
mov %l4, %l7 
sllx %l7, 32, %l7 
stx %l7, [%i3 + 64 ] 
add   %l4, 1, %l4

P1698: !BST [8] (maybe <- 0x41000055) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P1699: !LD [1] (Int)
lduw [%i0 + 4], %l6
! move %l6(lower) -> %o3(lower)
srlx %o3, 32, %o3
sllx %o3, 32, %o3
or %l6, %o3, %o3

P1700: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P1701: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P1702: !BST [14] (maybe <- 0x41000056) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P1703: !PREFETCH [7] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i1 + 84] %asi, 1

P1704: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P1705: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P1706: !BLD [0] (FP)
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

P1707: !BST [15] (maybe <- 0x41000057) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P1708: !PREFETCH [10] (Int) (CBR)
prefetch [%i2 + 32], 1

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


P1709: !LD [4] (Int)
lduw [%i0 + 64], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P1710: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P1711: !BLD [1] (FP)
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

P1712: !MEMBAR (Int)
membar #StoreLoad

P1713: !BST [2] (maybe <- 0x41000058) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1714: !PREFETCH [10] (Int) (Branch target of P1950)
prefetch [%i2 + 32], 1
ba P1715
nop

TARGET1950:
ba RET1950
nop


P1715: !CAS [7] (maybe <- 0x180000f) (Int)
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

P1716: !LD [11] (Int)
lduw [%i2 + 64], %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0

P1717: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P1718: !DWLD [0] (Int) (Branch target of P1633)
ldx [%i0 + 0], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
ba P1719
nop

TARGET1633:
ba RET1633
nop


P1719: !BLD [7] (FP)
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

P1720: !PREFETCH [15] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i3 + 192] %asi, 1

P1721: !LD [8] (Int)
lduw [%i1 + 256], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P1722: !CAS [3] (maybe <- 0x1800010) (Int)
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

P1723: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P1724: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P1725: !CAS [2] (maybe <- 0x1800011) (Int)
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

P1726: !BLD [0] (FP)
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

P1727: !BLD [6] (FP) (Branch target of P1937)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f36, %f8
ba P1728
nop

TARGET1937:
ba RET1937
nop


P1728: !PREFETCH [11] (Int) (Branch target of P1665)
prefetch [%i2 + 64], 1
ba P1729
nop

TARGET1665:
ba RET1665
nop


P1729: !BST [0] (maybe <- 0x4100005c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1730: !BST [9] (maybe <- 0x41000060) (FP) (CBR)
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
be,pt  %xcc, TARGET1730
nop
RET1730:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P1731: !BST [3] (maybe <- 0x41000061) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1732: !SWAP [7] (maybe <- 0x1800012) (Int)
mov %l4, %l3
swap  [%i1 + 84], %l3
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

P1733: !BLD [11] (FP) (Branch target of P1941)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10
ba P1734
nop

TARGET1941:
ba RET1941
nop


P1734: !BST [7] (maybe <- 0x41000065) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
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
be,pt  %xcc, TARGET1734
nop
RET1734:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P1735: !DWST [13] (maybe <- 0x1800013) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 64 ] 
add   %l4, 1, %l4

P1736: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P1737: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P1738: !BLD [5] (FP)
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

P1739: !BST [7] (maybe <- 0x41000068) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1740: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P1741: !BLD [2] (FP)
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

P1742: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P1743: !BLD [3] (FP)
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

P1744: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P1745: !BST [0] (maybe <- 0x4100006b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1746: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P1747: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P1748: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f9
fmovd %f36, %f10

P1749: !BLD [3] (FP)
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

P1750: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P1751: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f0
membar #Sync 
! 1 addresses covered
fmovd %f8, %f0

P1752: !BST [12] (maybe <- 0x4100006f) (FP) (CBR)
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
be,pn  %xcc, TARGET1752
nop
RET1752:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P1753: !DWLD [5] (Int) (LE)
wr %g0, 0x88, %asi
ldxa [%i1 + 72] %asi, %o5
! move %o5(upper) -> %o0(upper)
or %o5, %g0, %o0

P1754: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P1755: !DWST [1] (maybe <- 0x1800014) (Int) (CBR)
sllx %l4, 32, %l3 
add   %l4, 1, %l4
or %l3, %l4, %l3
stx %l3, [%i0 + 0]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1755
nop
RET1755:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P1756: !ST [14] (maybe <- 0x1800016) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P1757: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P1758: !BLD [5] (FP)
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

P1759: !BST [4] (maybe <- 0x41000070) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P1760: !BST [2] (maybe <- 0x41000071) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1761: !BST [7] (maybe <- 0x41000075) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1762: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P1763: !BST [14] (maybe <- 0x41000078) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P1764: !REPLACEMENT [13] (Int)
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

P1765: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P1766: !BLD [1] (FP)
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

P1767: !ST [8] (maybe <- 0x1800017) (Int) (LE)
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

P1768: !DWST [9] (maybe <- 0x1800018) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 512 ] 
add   %l4, 1, %l4

P1769: !DWLD [5] (Int)
ldx [%i1 + 72], %l6
! move %l6(lower) -> %o0(lower)
srlx %o0, 32, %o0
sllx %o0, 32, %o0
srl %l6, 0, %l3
or %l3, %o0, %o0

P1770: !BST [12] (maybe <- 0x41000079) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P1771: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P1772: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f10

P1773: !BST [0] (maybe <- 0x4100007a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1774: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P1775: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P1776: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P1777: !BLD [6] (FP)
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

P1778: !BLD [2] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f0
membar #Sync 
! 4 addresses covered
fmovs %f3, %f2
fmovs %f8, %f3

P1779: !BST [12] (maybe <- 0x4100007e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P1780: !MEMBAR (Int)
membar #StoreLoad

P1781: !DWLD [12] (Int)
ldx [%i3 + 0], %o1
! move %o1(upper) -> %o1(upper)

P1782: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P1783: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P1784: !DWST [8] (maybe <- 0x1800019) (Int) (CBR)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 256 ] 
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1784
nop
RET1784:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P1785: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P1786: !CAS [10] (maybe <- 0x180001a) (Int)
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

P1787: !BST [3] (maybe <- 0x4100007f) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
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
be,pt  %xcc, TARGET1787
nop
RET1787:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P1788: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P1789: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P1790: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P1791: !BST [8] (maybe <- 0x41000083) (FP) (Branch target of P1903)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 
ba P1792
nop

TARGET1903:
ba RET1903
nop


P1792: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P1793: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P1794: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P1795: !BST [4] (maybe <- 0x41000084) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P1796: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P1797: !BST [3] (maybe <- 0x41000085) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1798: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P1799: !DWLD [12] (Int)
ldx [%i3 + 0], %o5
! move %o5(upper) -> %o2(lower)
srlx %o5, 32, %l7
or %l7, %o2, %o2

P1800: !DWLD [8] (Int)
ldx [%i1 + 256], %o3
! move %o3(upper) -> %o3(upper)

P1801: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P1802: !BST [13] (maybe <- 0x41000089) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P1803: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P1804: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P1805: !BST [5] (maybe <- 0x4100008a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1806: !BLD [7] (FP)
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

P1807: !BST [6] (maybe <- 0x4100008d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1808: !ST [9] (maybe <- 0x180001b) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P1809: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f11
fmovd %f36, %f12

P1810: !BST [3] (maybe <- 0x41000090) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1811: !BST [3] (maybe <- 0x41000094) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1812: !MEMBAR (Int)
membar #StoreLoad

P1813: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P1814: !DWST [11] (maybe <- 0x180001c) (Int)
mov %l4, %l3 
sllx %l3, 32, %l3 
stx %l3, [%i2 + 64 ] 
add   %l4, 1, %l4

P1815: !BLD [6] (FP)
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

P1816: !BLD [1] (FP)
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

P1817: !REPLACEMENT [7] (Int)
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

P1818: !LD [2] (Int)
lduw [%i0 + 12], %o5
! move %o5(lower) -> %o3(lower)
srlx %o3, 32, %o3
sllx %o3, 32, %o3
or %o5, %o3, %o3

P1819: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P1820: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P1821: !CAS [9] (maybe <- 0x180001d) (Int) (LE)
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
lduwa [%l6] %asi, %o4
mov %o4, %l3
! move %l3(lower) -> %o4(upper)
sllx %l3, 32, %o4
mov %l7, %o5
casa [%l6] %asi, %l3, %o5
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

P1822: !BLD [2] (FP)
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

P1823: !BST [12] (maybe <- 0x41000098) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P1824: !BST [13] (maybe <- 0x41000099) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P1825: !DWST [10] (maybe <- 0x180001e) (Int)
mov %l4, %l7 
sllx %l7, 32, %l7 
stx %l7, [%i2 + 32 ] 
add   %l4, 1, %l4

P1826: !BLD [2] (FP) (CBR)
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
be,pt  %xcc, TARGET1826
nop
RET1826:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P1827: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P1828: !BLD [3] (FP)
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

P1829: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P1830: !BLD [1] (FP)
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

P1831: !BLD [3] (FP)
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

P1832: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P1833: !DWST [14] (maybe <- 0x180001f) (Int)
mov %l4, %l7 
sllx %l7, 32, %l7 
stx %l7, [%i3 + 128 ] 
add   %l4, 1, %l4

P1834: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P1835: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P1836: !SWAP [2] (maybe <- 0x1800020) (Int)
mov %l4, %o0
swap  [%i0 + 12], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
add   %l4, 1, %l4

P1837: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P1838: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P1839: !BST [15] (maybe <- 0x4100009a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P1840: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P1841: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P1842: !DWST [12] (maybe <- 0x4100009b) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
std %f20, [%i3 + 0]

P1843: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P1844: !BLD [5] (FP)
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

P1845: !BST [6] (maybe <- 0x4100009c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1846: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P1847: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P1848: !DWLD [1] (Int)
ldx [%i0 + 0], %l7
! move %l7(upper) -> %o0(lower)
srlx %l7, 32, %l6
or %l6, %o0, %o0
! move %l7(lower) -> %o1(upper)
sllx %l7, 32, %o1

P1849: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P1850: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P1851: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P1852: !BST [12] (maybe <- 0x4100009f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P1853: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P1854: !BST [14] (maybe <- 0x410000a0) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P1855: !DWST [11] (maybe <- 0x1800021) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i2 + 64 ] 
add   %l4, 1, %l4

P1856: !DWLD [7] (Int)
ldx [%i1 + 80], %l6
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %l3
or %l3, %o1, %o1
! move %l6(lower) -> %o2(upper)
sllx %l6, 32, %o2

P1857: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P1858: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P1859: !BLD [7] (FP)
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

P1860: !BST [5] (maybe <- 0x410000a1) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1861: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P1862: !LD [1] (Int)
lduw [%i0 + 4], %l7
! move %l7(lower) -> %o2(lower)
or %l7, %o2, %o2

P1863: !CASX [13] (maybe <- 0x1800022) (Int)
add %i3, 64, %l3
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

P1864: !BST [7] (maybe <- 0x410000a4) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1865: !BLD [13] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1865
nop
RET1865:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P1866: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P1867: !REPLACEMENT [11] (Int)
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

P1868: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f11
fmovd %f36, %f12

P1869: !BST [9] (maybe <- 0x410000a7) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P1870: !BST [14] (maybe <- 0x410000a8) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P1871: !BST [15] (maybe <- 0x410000a9) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P1872: !BLD [5] (FP)
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

P1873: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P1874: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P1875: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P1876: !BST [3] (maybe <- 0x410000aa) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1877: !BST [6] (maybe <- 0x410000ae) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1878: !BST [9] (maybe <- 0x410000b1) (FP) (CBR)
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
be,pn  %xcc, TARGET1878
nop
RET1878:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P1879: !SWAP [5] (maybe <- 0x1800023) (Int)
mov %l4, %o0
swap  [%i1 + 76], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
add   %l4, 1, %l4

P1880: !BST [8] (maybe <- 0x410000b2) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P1881: !PREFETCH [13] (Int) (CBR)
prefetch [%i3 + 64], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1881
nop
RET1881:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P1882: !BST [0] (maybe <- 0x410000b3) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1883: !BLD [0] (FP)
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

P1884: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P1885: !BST [9] (maybe <- 0x410000b7) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P1886: !BLD [7] (FP)
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

P1887: !BLD [1] (FP)
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

P1888: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P1889: !BLD [3] (FP)
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

P1890: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P1891: !BLD [0] (FP)
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

P1892: !PREFETCH [14] (Int) (Branch target of P1904)
prefetch [%i3 + 128], 1
ba P1893
nop

TARGET1904:
ba RET1904
nop


P1893: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f5
fmovd %f36, %f6

P1894: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f8

P1895: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P1896: !BST [2] (maybe <- 0x410000b8) (FP) (Branch target of P1752)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 
ba P1897
nop

TARGET1752:
ba RET1752
nop


P1897: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f9
fmovd %f36, %f10

P1898: !LD [3] (Int)
lduw [%i0 + 32], %l7
! move %l7(lower) -> %o0(lower)
or %l7, %o0, %o0

P1899: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P1900: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P1901: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P1902: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P1903: !BST [0] (maybe <- 0x410000bc) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
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
be,pn  %xcc, TARGET1903
nop
RET1903:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P1904: !BST [15] (maybe <- 0x410000c0) (FP) (CBR)
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
be,pn  %xcc, TARGET1904
nop
RET1904:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P1905: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P1906: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P1907: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P1908: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P1909: !PREFETCH [9] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i1 + 512] %asi, 1

P1910: !BST [0] (maybe <- 0x410000c1) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1911: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P1912: !BST [9] (maybe <- 0x410000c5) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P1913: !BLD [5] (FP)
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

P1914: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P1915: !DWLD [6] (Int)
ldx [%i1 + 80], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)

P1916: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f3
fmovd %f36, %f4

P1917: !BST [14] (maybe <- 0x410000c6) (FP) (Branch target of P1787)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 
ba P1918
nop

TARGET1787:
ba RET1787
nop


P1918: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P1919: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P1920: !BST [3] (maybe <- 0x410000c7) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1921: !BST [0] (maybe <- 0x410000cb) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1922: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f36, %f8

P1923: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P1924: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P1925: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P1926: !BST [3] (maybe <- 0x410000cf) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1927: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P1928: !BST [1] (maybe <- 0x410000d3) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1929: !BLD [8] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1929
nop
RET1929:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P1930: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P1931: !BST [1] (maybe <- 0x410000d7) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1932: !BST [4] (maybe <- 0x410000db) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P1933: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P1934: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P1935: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P1936: !BST [9] (maybe <- 0x410000dc) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P1937: !ST [4] (maybe <- 0x1800024) (Int) (CBR)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1937
nop
RET1937:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P1938: !BLD [1] (FP)
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

P1939: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P1940: !BST [1] (maybe <- 0x410000dd) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P1941: !BST [3] (maybe <- 0x410000e1) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
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
be,pn  %xcc, TARGET1941
nop
RET1941:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P1942: !DWLD [11] (FP)
ldd [%i2 + 64], %f18
! 1 addresses covered
fmovs %f18, %f1

P1943: !BLD [5] (FP)
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

P1944: !BST [8] (maybe <- 0x410000e5) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P1945: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P1946: !BST [15] (maybe <- 0x410000e6) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P1947: !BST [6] (maybe <- 0x410000e7) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1948: !BST [15] (maybe <- 0x410000ea) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P1949: !PREFETCH [1] (Int) (LE) (CBR)
wr %g0, 0x88, %asi
prefetcha [%i0 + 4] %asi, 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1949
nop
RET1949:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P1950: !BST [7] (maybe <- 0x410000eb) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
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
be,pt  %xcc, TARGET1950
nop
RET1950:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P1951: !BLD [0] (FP)
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

P1952: !BST [5] (maybe <- 0x410000ee) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1953: !DWST [8] (maybe <- 0x410000f1) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
std %f20, [%i1 + 256]

P1954: !BLD [7] (FP)
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

P1955: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P1956: !BLD [5] (FP)
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

P1957: !REPLACEMENT [7] (Int)
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

P1958: !BST [7] (maybe <- 0x410000f2) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1959: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P1960: !BLD [1] (FP)
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

P1961: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P1962: !BST [14] (maybe <- 0x410000f5) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P1963: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P1964: !BLD [3] (FP)
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

P1965: !BST [5] (maybe <- 0x410000f6) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1966: !LD [9] (Int)
lduw [%i1 + 512], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P1967: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P1968: !BST [4] (maybe <- 0x410000f9) (FP) (CBR)
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
be,pt  %xcc, TARGET1968
nop
RET1968:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P1969: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P1970: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P1971: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P1972: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P1973: !BLD [2] (FP)
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

P1974: !SWAP [11] (maybe <- 0x1800025) (Int)
mov %l4, %l7
swap  [%i2 + 64], %l7
! move %l7(lower) -> %o2(lower)
srl %l7, 0, %l3
or %l3, %o2, %o2
add   %l4, 1, %l4

P1975: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P1976: !BLD [9] (FP) (Branch target of P1708)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1
ba P1977
nop

TARGET1708:
ba RET1708
nop


P1977: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P1978: !BLD [3] (FP)
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

P1979: !BLD [0] (FP)
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

P1980: !DWLD [15] (Int)
ldx [%i3 + 192], %o3
! move %o3(upper) -> %o3(upper)

P1981: !BST [11] (maybe <- 0x410000fa) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P1982: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P1983: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f11

P1984: !BLD [7] (FP) (Branch target of P1577)
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
ba P1985
nop

TARGET1577:
ba RET1577
nop


P1985: !BLD [15] (FP)
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

P1986: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P1987: !PREFETCH [3] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i0 + 32] %asi, 1

P1988: !BST [7] (maybe <- 0x410000fb) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P1989: !BLD [15] (FP) (Branch target of P1692)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f0
membar #Sync 
! 1 addresses covered
ba P1990
nop

TARGET1692:
ba RET1692
nop


P1990: !ST [3] (maybe <- 0x1800026) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P1991: !MEMBAR (Int)
membar #StoreLoad

P1992: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P1993: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P1994: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f3
fmovd %f36, %f4

P1995: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P1996: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P1997: !PREFETCH [7] (Int) (Branch target of P1784)
prefetch [%i1 + 84], 1
ba P1998
nop

TARGET1784:
ba RET1784
nop


P1998: !BST [4] (maybe <- 0x410000fe) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P1999: !DWST [1] (maybe <- 0x1800027) (Int)
sllx %l4, 32, %l6 
add   %l4, 1, %l4
or %l6, %l4, %l6
stx %l6, [%i0 + 0]
add   %l4, 1, %l4

P2000: !BST [0] (maybe <- 0x410000ff) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2001: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P2002: !BST [10] (maybe <- 0x41000103) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P2003: !BLD [2] (FP) (Branch target of P1968)
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
ba P2004
nop

TARGET1968:
ba RET1968
nop


P2004: !BLD [2] (FP)
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

P2005: !BST [11] (maybe <- 0x41000104) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P2006: !BLD [0] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f0
membar #Sync 
! 4 addresses covered
fmovs %f3, %f2
fmovs %f8, %f3

P2007: !BLD [2] (FP)
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

P2008: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P2009: !BLD [1] (FP)
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

P2010: !BLD [5] (FP)
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

P2011: !LD [14] (Int)
lduw [%i3 + 128], %l7
! move %l7(lower) -> %o3(lower)
srlx %o3, 32, %o3
sllx %o3, 32, %o3
or %l7, %o3, %o3

P2012: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P2013: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P2014: !BLD [2] (FP)
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

P2015: !BST [4] (maybe <- 0x41000105) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P2016: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P2017: !BST [5] (maybe <- 0x41000106) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2018: !BST [0] (maybe <- 0x41000109) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2019: !ST [0] (maybe <- 0x1800029) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P2020: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P2021: !DWST [6] (maybe <- 0x180002a) (Int)
sllx %l4, 32, %o5 
add   %l4, 1, %l4
or %o5, %l4, %o5
stx %o5, [%i1 + 80]
add   %l4, 1, %l4

P2022: !DWST [6] (maybe <- 0x180002c) (Int)
sllx %l4, 32, %l7 
add   %l4, 1, %l4
or %l7, %l4, %l7
stx %l7, [%i1 + 80]
add   %l4, 1, %l4

P2023: !DWLD [2] (Int) (CBR)
ldx [%i0 + 8], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2023
nop
RET2023:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P2024: !REPLACEMENT [7] (Int)
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

P2025: !BST [9] (maybe <- 0x4100010d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P2026: !BLD [6] (FP)
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

P2027: !BST [14] (maybe <- 0x4100010e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P2028: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P2029: !ST [2] (maybe <- 0x180002e) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P2030: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f7

P2031: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P2032: !DWLD [12] (Int)
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

P2033: !BLD [3] (FP)
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

P2034: !BST [6] (maybe <- 0x4100010f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2035: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P2036: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f14

P2037: !DWST [13] (maybe <- 0x180002f) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 64 ] 
add   %l4, 1, %l4

P2038: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P2039: !DWST [2] (maybe <- 0x1800030) (Int)
mov %l4, %l3 
stx %l3, [%i0 + 8]
add   %l4, 1, %l4

P2040: !BST [14] (maybe <- 0x41000112) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P2041: !DWST [15] (maybe <- 0x1800031) (Int)
mov %l4, %l7 
sllx %l7, 32, %l7 
stx %l7, [%i3 + 192 ] 
add   %l4, 1, %l4

P2042: !DWLD [13] (Int)
ldx [%i3 + 64], %o0
! move %o0(upper) -> %o0(upper)

P2043: !REPLACEMENT [5] (Int)
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

P2044: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P2045: !BLD [3] (FP) (Branch target of P1826)
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
ba P2046
nop

TARGET1826:
ba RET1826
nop


P2046: !DWST [6] (maybe <- 0x1800032) (Int)
sllx %l4, 32, %l7 
add   %l4, 1, %l4
or %l7, %l4, %l7
stx %l7, [%i1 + 80]
add   %l4, 1, %l4

P2047: !ST [1] (maybe <- 0x1800034) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P2048: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P2049: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P2050: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P2051: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P2052: !MEMBAR (Int)
membar #StoreLoad

P2053: !LD [0] (Int)
lduw [%i0 + 0], %l6
! move %l6(lower) -> %o0(lower)
srlx %o0, 32, %o0
sllx %o0, 32, %o0
or %l6, %o0, %o0

P2054: !LD [1] (Int)
lduw [%i0 + 4], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P2055: !LD [2] (Int)
lduw [%i0 + 12], %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1

P2056: !LD [3] (Int)
lduw [%i0 + 32], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P2057: !LD [4] (Int)
lduw [%i0 + 64], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2

P2058: !LD [5] (Int)
lduw [%i1 + 76], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P2059: !LD [6] (Int)
lduw [%i1 + 80], %l6
! move %l6(lower) -> %o3(lower)
or %l6, %o3, %o3

P2060: !LD [7] (Int)
lduw [%i1 + 84], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P2061: !LD [8] (FP)
ld [%i1 + 256], %f5
! 1 addresses covered

P2062: !LD [9] (Int)
lduw [%i1 + 512], %l6
! move %l6(lower) -> %o4(lower)
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P2063: !LD [10] (Int)
lduw [%i2 + 32], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P2064: !LD [11] (Int)
lduw [%i2 + 64], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

P2065: !LD [12] (Int)
lduw [%i3 + 0], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P2066: !LD [13] (Int) (CBR)
lduw [%i3 + 64], %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2066
nop
RET2066:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P2067: !LD [14] (Int)
lduw [%i3 + 128], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P2068: !LD [15] (Int)
lduw [%i3 + 192], %l7
! move %l7(lower) -> %o2(lower)
or %l7, %o2, %o2

END_NODES3: ! Test istream for CPU 3 ends
sethi %hi(0xdead0e0f), %o5
or    %o5, %lo(0xdead0e0f), %o5
! move %o5(lower) -> %o3(upper)
sllx %o5, 32, %o3
stw %o5, [%i5] 
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
sethi %hi(0x04deade1), %l7
or    %l7, %lo(0x04deade1), %l7
stw %l7, [%i5] 
ld [%i5], %f16

! Initialize running integer counter in register %l4
sethi %hi(0x2000001), %l4
or    %l4, %lo(0x2000001), %l4

! Initialize running FP counter in register %f16
sethi %hi(0x41800001), %l7
or    %l7, %lo(0x41800001), %l7
stw %l7, [%i5] 
ld [%i5], %f16

! Initialize FP counter increment value in register %f17 (constant)
sethi %hi(0x36000000), %l7
or    %l7, %lo(0x36000000), %l7
stw %l7, [%i5] 
ld [%i5], %f17 

! Initialize LFSR to 0x5e0a^4
sethi %hi(0x5e0a), %l0
or    %l0, %lo(0x5e0a), %l0
mulx  %l0, %l0, %l0
mulx  %l0, %l0, %l0

!-- init shared addrs 8 to 9 ---
stx %g0, [%i1+256]
stx %g0, [%i1+512]

! use untouched cache-line (offset 4K) in replacement area for sync
sub %i1, %i0, %o5
add %i3, %o5, %o5
sub %o5, -4096, %o5

!-- begin of sync_init ---
or %g0, 1, %l3
or %g0, %l3, %l6
swap [%o5+4], %l6
membar #Sync
sync_init_1_4:
brnz,pt %l3, sync_init_1_4
lduw [%o5+4], %l3 ! delay slot
sync_init_2_4:
lduw [%o5], %l3
sub %l3, 1, %l6
cas [%o5], %l3, %l6
cmp %l3, %l6
bne,pt %xcc, sync_init_2_4
nop
membar #Sync
sync_init_3_4:
lduw [%o5], %l3 ! delay slot
brnz,pt %l3, sync_init_3_4
nop
!-- end of sync_init ---


BEGIN_NODES4: ! Test istream for CPU 4 begins

P2069: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f0
membar #Sync 
! 3 addresses covered
fmovs %f3, %f0
fmovs %f4, %f1
fmovs %f5, %f2

P2070: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P2071: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P2072: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P2073: !LD [13] (Int)
lduw [%i3 + 64], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P2074: !BLD [7] (FP)
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

P2075: !BST [3] (maybe <- 0x41800001) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2076: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P2077: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P2078: !MEMBAR (Int)
membar #StoreLoad

P2079: !BLD [0] (FP)
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

P2080: !BST [6] (maybe <- 0x41800005) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2081: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P2082: !BLD [0] (FP)
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

P2083: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P2084: !BLD [0] (FP)
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

P2085: !BST [3] (maybe <- 0x41800008) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2086: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P2087: !BLD [8] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2087
nop
RET2087:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P2088: !BST [9] (maybe <- 0x4180000c) (FP) (CBR)
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
be,pt  %xcc, TARGET2088
nop
RET2088:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P2089: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P2090: !ST [5] (maybe <- 0x2000001) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P2091: !BLD [2] (FP)
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

P2092: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P2093: !BST [15] (maybe <- 0x4180000d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P2094: !BLD [2] (FP)
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

P2095: !BST [12] (maybe <- 0x4180000e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P2096: !BLD [0] (FP)
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

P2097: !LD [7] (Int) (LE)
wr %g0, 0x88, %asi
lduwa [%i1 + 84] %asi, %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0

P2098: !BST [6] (maybe <- 0x4180000f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2099: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P2100: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f0
membar #Sync 
! 1 addresses covered

P2101: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f1

P2102: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P2103: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f3
fmovd %f36, %f4

P2104: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P2105: !BLD [0] (FP)
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

P2106: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P2107: !BST [11] (maybe <- 0x41800012) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P2108: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P2109: !BST [6] (maybe <- 0x41800013) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2110: !LD [14] (FP)
ld [%i3 + 128], %f12
! 1 addresses covered

P2111: !BST [12] (maybe <- 0x41800016) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P2112: !REPLACEMENT [14] (Int)
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

P2113: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P2114: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P2115: !ST [4] (maybe <- 0x2000002) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P2116: !BST [2] (maybe <- 0x41800017) (FP) (Branch target of P2577)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 
ba P2117
nop

TARGET2577:
ba RET2577
nop


P2117: !BST [3] (maybe <- 0x4180001b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2118: !BST [4] (maybe <- 0x4180001f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P2119: !BST [11] (maybe <- 0x41800020) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P2120: !CAS [14] (maybe <- 0x2000003) (Int)
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

P2121: !BST [13] (maybe <- 0x41800021) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P2122: !SWAP [11] (maybe <- 0x2000004) (Int) (Branch target of P2087)
mov %l4, %o2
swap  [%i2 + 64], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4
ba P2123
nop

TARGET2087:
ba RET2087
nop


P2123: !BST [0] (maybe <- 0x41800022) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2124: !PREFETCH [9] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i1 + 512] %asi, 1

P2125: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P2126: !BLD [12] (FP)
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

P2127: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P2128: !PREFETCH [12] (Int) (Branch target of P2459)
prefetch [%i3 + 0], 1
ba P2129
nop

TARGET2459:
ba RET2459
nop


P2129: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f0
membar #Sync 
! 3 addresses covered
fmovs %f3, %f0
fmovs %f4, %f1
fmovs %f5, %f2

P2130: !PREFETCH [9] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i1 + 512] %asi, 1

P2131: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P2132: !BST [11] (maybe <- 0x41800026) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P2133: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P2134: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P2135: !BST [4] (maybe <- 0x41800027) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P2136: !BST [0] (maybe <- 0x41800028) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2137: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P2138: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P2139: !BST [12] (maybe <- 0x4180002c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P2140: !BLD [1] (FP)
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

P2141: !BST [7] (maybe <- 0x4180002d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2142: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P2143: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P2144: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P2145: !BST [14] (maybe <- 0x41800030) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P2146: !BST [5] (maybe <- 0x41800031) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2147: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f11
fmovd %f36, %f12

P2148: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P2149: !DWST [14] (maybe <- 0x41800034) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
std %f20, [%i3 + 128]

P2150: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P2151: !BLD [0] (FP)
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

P2152: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P2153: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P2154: !BLD [9] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2154
nop
RET2154:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P2155: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P2156: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P2157: !BST [14] (maybe <- 0x41800035) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P2158: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P2159: !REPLACEMENT [3] (Int)
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

P2160: !BST [4] (maybe <- 0x41800036) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P2161: !BST [9] (maybe <- 0x41800037) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P2162: !BST [14] (maybe <- 0x41800038) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P2163: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P2164: !MEMBAR (Int)
membar #StoreLoad

P2165: !LD [8] (Int)
lduw [%i1 + 256], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2

P2166: !DWST [11] (maybe <- 0x2000005) (Int)
mov %l4, %l7 
sllx %l7, 32, %l7 
stx %l7, [%i2 + 64 ] 
add   %l4, 1, %l4

P2167: !MEMBAR (Int)
membar #StoreLoad

P2168: !BST [4] (maybe <- 0x41800039) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P2169: !BST [6] (maybe <- 0x4180003a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2170: !BLD [2] (FP)
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

P2171: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P2172: !BST [7] (maybe <- 0x4180003d) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
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
be,pn  %xcc, TARGET2172
nop
RET2172:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P2173: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f9
fmovd %f36, %f10

P2174: !BST [4] (maybe <- 0x41800040) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P2175: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P2176: !BST [5] (maybe <- 0x41800041) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2177: !BST [6] (maybe <- 0x41800044) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2178: !ST [9] (maybe <- 0x2000006) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P2179: !BLD [0] (FP)
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

P2180: !BST [1] (maybe <- 0x41800047) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2181: !ST [10] (maybe <- 0x2000007) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P2182: !DWST [0] (maybe <- 0x2000008) (Int)
sllx %l4, 32, %l6 
add   %l4, 1, %l4
or %l6, %l4, %l6
stx %l6, [%i0 + 0]
add   %l4, 1, %l4

P2183: !BLD [0] (FP)
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

P2184: !BST [5] (maybe <- 0x4180004b) (FP) (Branch target of P2372)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 
ba P2185
nop

TARGET2372:
ba RET2372
nop


P2185: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P2186: !DWLD [4] (Int) (LE)
wr %g0, 0x88, %asi
ldxa [%i0 + 64] %asi, %l3
! move %l3(lower) -> %o3(upper)
sllx %l3, 32, %o3

P2187: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P2188: !SWAP [4] (maybe <- 0x200000a) (Int)
mov %l4, %o5
swap  [%i0 + 64], %o5
! move %o5(lower) -> %o3(lower)
srl %o5, 0, %l6
or %l6, %o3, %o3
add   %l4, 1, %l4

P2189: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P2190: !DWST [6] (maybe <- 0x200000b) (Int)
sllx %l4, 32, %l3 
add   %l4, 1, %l4
or %l3, %l4, %l3
stx %l3, [%i1 + 80]
add   %l4, 1, %l4

P2191: !BLD [7] (FP)
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

P2192: !BST [9] (maybe <- 0x4180004e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P2193: !LD [2] (Int)
lduw [%i0 + 12], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P2194: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P2195: !ST [6] (maybe <- 0x4180004f) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i1 + 80 ]

P2196: !BST [1] (maybe <- 0x41800050) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
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
be,pt  %xcc, TARGET2196
nop
RET2196:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P2197: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f9
fmovd %f36, %f10

P2198: !BST [10] (maybe <- 0x41800054) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P2199: !BLD [2] (FP)
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

P2200: !ST [3] (maybe <- 0x200000d) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P2201: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P2202: !BST [6] (maybe <- 0x41800055) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2203: !BST [6] (maybe <- 0x41800058) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2204: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P2205: !BST [7] (maybe <- 0x4180005b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2206: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f0
membar #Sync 
! 1 addresses covered

P2207: !BST [6] (maybe <- 0x4180005e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2208: !BST [11] (maybe <- 0x41800061) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P2209: !DWLD [0] (Int)
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

P2210: !BST [9] (maybe <- 0x41800062) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P2211: !BLD [3] (FP)
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

P2212: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P2213: !BST [15] (maybe <- 0x41800063) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P2214: !LD [15] (FP)
ld [%i3 + 192], %f6
! 1 addresses covered

P2215: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P2216: !BST [10] (maybe <- 0x41800064) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P2217: !BLD [2] (FP)
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

P2218: !DWLD [11] (Int)
ldx [%i2 + 64], %l3
! move %l3(upper) -> %o0(lower)
srlx %l3, 32, %o5
or %o5, %o0, %o0

P2219: !BLD [3] (FP)
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

P2220: !DWLD [12] (Int)
ldx [%i3 + 0], %o1
! move %o1(upper) -> %o1(upper)

P2221: !BST [14] (maybe <- 0x41800065) (FP) (Branch target of P2528)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 
ba P2222
nop

TARGET2528:
ba RET2528
nop


P2222: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P2223: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P2224: !REPLACEMENT [14] (Int)
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

P2225: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f0
membar #Sync 
! 3 addresses covered
fmovs %f3, %f0
fmovs %f4, %f1
fmovs %f5, %f2

P2226: !BST [1] (maybe <- 0x41800066) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2227: !PREFETCH [7] (Int) (Branch target of P2402)
prefetch [%i1 + 84], 1
ba P2228
nop

TARGET2402:
ba RET2402
nop


P2228: !ST [11] (maybe <- 0x200000e) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P2229: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P2230: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P2231: !PREFETCH [9] (Int) (Branch target of P2293)
prefetch [%i1 + 512], 1
ba P2232
nop

TARGET2293:
ba RET2293
nop


P2232: !BST [13] (maybe <- 0x4180006a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P2233: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f3
fmovd %f36, %f4

P2234: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P2235: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P2236: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f36, %f8

P2237: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P2238: !REPLACEMENT [6] (Int)
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

P2239: !BST [4] (maybe <- 0x4180006b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P2240: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P2241: !BST [12] (maybe <- 0x4180006c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P2242: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P2243: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P2244: !BLD [3] (FP)
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

P2245: !BST [12] (maybe <- 0x4180006d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P2246: !BST [14] (maybe <- 0x4180006e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P2247: !BST [6] (maybe <- 0x4180006f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2248: !BST [3] (maybe <- 0x41800072) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2249: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f0
membar #Sync 
! 1 addresses covered

P2250: !BLD [3] (FP)
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

P2251: !BST [1] (maybe <- 0x41800076) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2252: !LD [15] (Int) (Branch target of P2532)
lduw [%i3 + 192], %o5
! move %o5(lower) -> %o1(lower)
srlx %o1, 32, %o1
sllx %o1, 32, %o1
or %o5, %o1, %o1
ba P2253
nop

TARGET2532:
ba RET2532
nop


P2253: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P2254: !BLD [3] (FP)
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

P2255: !BST [9] (maybe <- 0x4180007a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P2256: !BST [9] (maybe <- 0x4180007b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P2257: !BST [8] (maybe <- 0x4180007c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P2258: !BST [2] (maybe <- 0x4180007d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2259: !BST [2] (maybe <- 0x41800081) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2260: !BST [10] (maybe <- 0x41800085) (FP) (Branch target of P2269)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 
ba P2261
nop

TARGET2269:
ba RET2269
nop


P2261: !BST [12] (maybe <- 0x41800086) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P2262: !DWLD [4] (Int) (LE)
wr %g0, 0x88, %asi
ldxa [%i0 + 64] %asi, %l7
! move %l7(lower) -> %o2(upper)
sllx %l7, 32, %o2

P2263: !BST [15] (maybe <- 0x41800087) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P2264: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P2265: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P2266: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P2267: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P2268: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P2269: !BLD [11] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2269
nop
RET2269:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P2270: !BST [10] (maybe <- 0x41800088) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P2271: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P2272: !BST [0] (maybe <- 0x41800089) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2273: !DWST [3] (maybe <- 0x200000f) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i0 + 32 ] 
add   %l4, 1, %l4

P2274: !BST [7] (maybe <- 0x4180008d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2275: !BST [13] (maybe <- 0x41800090) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P2276: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P2277: !DWLD [4] (Int)
ldx [%i0 + 64], %o5
! move %o5(upper) -> %o2(lower)
srlx %o5, 32, %l7
or %l7, %o2, %o2

P2278: !BLD [7] (FP)
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

P2279: !PREFETCH [1] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i0 + 4] %asi, 1

P2280: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P2281: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P2282: !BLD [1] (FP)
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

P2283: !BST [0] (maybe <- 0x41800091) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2284: !BLD [0] (FP)
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

P2285: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P2286: !LD [6] (Int)
lduw [%i1 + 80], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P2287: !DWLD [1] (Int)
ldx [%i0 + 0], %l7
! move %l7(upper) -> %o3(lower)
srlx %l7, 32, %l6
or %l6, %o3, %o3
! move %l7(lower) -> %o4(upper)
sllx %l7, 32, %o4

P2288: !BLD [2] (FP)
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

P2289: !REPLACEMENT [5] (Int)
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

P2290: !BST [9] (maybe <- 0x41800095) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P2291: !DWLD [14] (Int)
ldx [%i3 + 128], %l7
! move %l7(upper) -> %o4(lower)
srlx %l7, 32, %l6
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P2292: !BLD [7] (FP)
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

P2293: !BLD [7] (FP) (CBR)
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
be,pt  %xcc, TARGET2293
nop
RET2293:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P2294: !REPLACEMENT [6] (Int)
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

P2295: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P2296: !BST [7] (maybe <- 0x41800096) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2297: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P2298: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P2299: !BST [3] (maybe <- 0x41800099) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2300: !DWLD [4] (Int)
ldx [%i0 + 64], %o0
! move %o0(upper) -> %o0(upper)

P2301: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P2302: !BST [3] (maybe <- 0x4180009d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2303: !BLD [5] (FP)
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

P2304: !BLD [11] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2304
nop
RET2304:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P2305: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P2306: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P2307: !BLD [14] (FP) (Branch target of P2451)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9
ba P2308
nop

TARGET2451:
ba RET2451
nop


P2308: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f10

P2309: !BST [9] (maybe <- 0x418000a1) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P2310: !CASX [14] (maybe <- 0x2000010) (Int)
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

P2311: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P2312: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P2313: !BST [2] (maybe <- 0x418000a2) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2314: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P2315: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P2316: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P2317: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P2318: !BST [1] (maybe <- 0x418000a6) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2319: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P2320: !REPLACEMENT [7] (Int) (CBR)
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

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2320
nop
RET2320:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P2321: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P2322: !PREFETCH [11] (Int) (Branch target of P2320)
prefetch [%i2 + 64], 1
ba P2323
nop

TARGET2320:
ba RET2320
nop


P2323: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P2324: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P2325: !BLD [6] (FP)
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

P2326: !CAS [0] (maybe <- 0x2000011) (Int)
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

P2327: !BST [6] (maybe <- 0x418000aa) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2328: !LD [4] (Int)
lduw [%i0 + 64], %l3
! move %l3(lower) -> %o3(lower)
or %l3, %o3, %o3

P2329: !BST [9] (maybe <- 0x418000ad) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P2330: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P2331: !BST [1] (maybe <- 0x418000ae) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2332: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f36, %f2

P2333: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P2334: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P2335: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P2336: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P2337: !BST [5] (maybe <- 0x418000b2) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2338: !PREFETCH [0] (Int) (Branch target of P2434)
prefetch [%i0 + 0], 1
ba P2339
nop

TARGET2434:
ba RET2434
nop


P2339: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P2340: !BST [6] (maybe <- 0x418000b5) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2341: !DWST [9] (maybe <- 0x2000012) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 512 ] 
add   %l4, 1, %l4

P2342: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P2343: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P2344: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P2345: !REPLACEMENT [12] (Int)
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

P2346: !BLD [1] (FP)
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

P2347: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P2348: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P2349: !BST [1] (maybe <- 0x418000b8) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2350: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P2351: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P2352: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f11
fmovd %f36, %f12

P2353: !CAS [12] (maybe <- 0x2000013) (Int)
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

P2354: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P2355: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P2356: !BST [9] (maybe <- 0x418000bc) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P2357: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P2358: !MEMBAR (Int)
membar #StoreLoad

P2359: !DWST [8] (maybe <- 0x2000014) (Int) (LE)
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
stxa %l7, [%i1 + 256 ] %asi
add   %l4, 1, %l4

P2360: !ST [6] (maybe <- 0x2000015) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P2361: !BST [3] (maybe <- 0x418000bd) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2362: !ST [3] (maybe <- 0x2000016) (Int) (Branch target of P2568)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4
ba P2363
nop

TARGET2568:
ba RET2568
nop


P2363: !REPLACEMENT [6] (Int)
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

P2364: !BLD [1] (FP)
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

P2365: !BST [7] (maybe <- 0x418000c1) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2366: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P2367: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P2368: !BLD [7] (FP)
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

P2369: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P2370: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P2371: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P2372: !BST [1] (maybe <- 0x418000c4) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
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
be,pn  %xcc, TARGET2372
nop
RET2372:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P2373: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P2374: !BLD [3] (FP)
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

P2375: !DWLD [13] (Int)
ldx [%i3 + 64], %o0
! move %o0(upper) -> %o0(upper)

P2376: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P2377: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P2378: !BST [0] (maybe <- 0x418000c8) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2379: !BST [12] (maybe <- 0x418000cc) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P2380: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f13

P2381: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P2382: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P2383: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P2384: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P2385: !BST [10] (maybe <- 0x418000cd) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P2386: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P2387: !CASX [15] (maybe <- 0x2000017) (Int) (Branch target of P2196)
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
ba P2388
nop

TARGET2196:
ba RET2196
nop


P2388: !DWST [6] (maybe <- 0x418000ce) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=21 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
std %f20, [%i1 + 80]

P2389: !BST [4] (maybe <- 0x418000d0) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P2390: !BLD [1] (FP)
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

P2391: !BST [14] (maybe <- 0x418000d1) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P2392: !BST [7] (maybe <- 0x418000d2) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2393: !BST [11] (maybe <- 0x418000d5) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P2394: !BST [6] (maybe <- 0x418000d6) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2395: !BST [14] (maybe <- 0x418000d9) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P2396: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f3
fmovd %f36, %f4

P2397: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P2398: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P2399: !BLD [6] (FP)
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

P2400: !BST [5] (maybe <- 0x418000da) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2401: !LD [11] (FP)
ld [%i2 + 64], %f9
! 1 addresses covered

P2402: !PREFETCH [4] (Int) (CBR)
prefetch [%i0 + 64], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2402
nop
RET2402:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P2403: !BLD [5] (FP)
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

P2404: !BLD [3] (FP)
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

P2405: !DWLD [5] (Int)
ldx [%i1 + 72], %l3
! move %l3(lower) -> %o2(lower)
srl %l3, 0, %o5
or %o5, %o2, %o2

P2406: !BLD [1] (FP)
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

P2407: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P2408: !BST [5] (maybe <- 0x418000dd) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2409: !BST [5] (maybe <- 0x418000e0) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2410: !BLD [0] (FP)
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

P2411: !BST [1] (maybe <- 0x418000e3) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2412: !SWAP [3] (maybe <- 0x2000018) (Int)
mov %l4, %o3
swap  [%i0 + 32], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P2413: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P2414: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P2415: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P2416: !DWST [12] (maybe <- 0x2000019) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 0 ] 
add   %l4, 1, %l4

P2417: !BST [2] (maybe <- 0x418000e7) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2418: !ST [6] (maybe <- 0x200001a) (Int) (Branch target of P2088)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4
ba P2419
nop

TARGET2088:
ba RET2088
nop


P2419: !BST [14] (maybe <- 0x418000eb) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P2420: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P2421: !BST [5] (maybe <- 0x418000ec) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
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
be,pn  %xcc, TARGET2421
nop
RET2421:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P2422: !BST [14] (maybe <- 0x418000ef) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P2423: !BLD [3] (FP)
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

P2424: !REPLACEMENT [6] (Int)
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

P2425: !BLD [14] (FP)
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

P2426: !BST [7] (maybe <- 0x418000f0) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2427: !BST [13] (maybe <- 0x418000f3) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P2428: !BST [1] (maybe <- 0x418000f4) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2429: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P2430: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f0
membar #Sync 
! 1 addresses covered

P2431: !DWLD [5] (Int)
ldx [%i1 + 72], %l6
! move %l6(lower) -> %o3(lower)
srl %l6, 0, %l3
or %l3, %o3, %o3

P2432: !BST [10] (maybe <- 0x418000f8) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P2433: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P2434: !DWLD [10] (Int) (CBR)
ldx [%i2 + 32], %o4
! move %o4(upper) -> %o4(upper)

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2434
nop
RET2434:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P2435: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P2436: !DWLD [0] (Int)
ldx [%i0 + 0], %l6
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

P2437: !BST [8] (maybe <- 0x418000f9) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P2438: !BST [2] (maybe <- 0x418000fa) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2439: !BLD [3] (FP)
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

P2440: !BST [4] (maybe <- 0x418000fe) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P2441: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P2442: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P2443: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P2444: !BST [7] (maybe <- 0x418000ff) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2445: !BST [4] (maybe <- 0x41800102) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P2446: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P2447: !REPLACEMENT [6] (Int)
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

P2448: !SWAP [14] (maybe <- 0x200001b) (Int)
mov %l4, %l7
swap  [%i3 + 128], %l7
! move %l7(lower) -> %o0(lower)
srl %l7, 0, %l3
or %l3, %o0, %o0
add   %l4, 1, %l4

P2449: !BLD [2] (FP)
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

P2450: !SWAP [8] (maybe <- 0x200001c) (Int)
mov %l4, %o1
swap  [%i1 + 256], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P2451: !PREFETCH [8] (Int) (LE) (CBR)
wr %g0, 0x88, %asi
prefetcha [%i1 + 256] %asi, 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2451
nop
RET2451:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P2452: !BLD [2] (FP)
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

P2453: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P2454: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P2455: !BST [5] (maybe <- 0x41800103) (FP) (Branch target of P2469)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 
ba P2456
nop

TARGET2469:
ba RET2469
nop


P2456: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P2457: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P2458: !BLD [8] (FP)
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

P2459: !ST [2] (maybe <- 0x200001d) (Int) (CBR)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2459
nop
RET2459:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P2460: !BST [4] (maybe <- 0x41800106) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P2461: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P2462: !BLD [3] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f0
membar #Sync 
! 4 addresses covered
fmovs %f3, %f2
fmovs %f8, %f3

P2463: !DWST [1] (maybe <- 0x200001e) (Int) (Branch target of P2304)
sllx %l4, 32, %l6 
add   %l4, 1, %l4
or %l6, %l4, %l6
stx %l6, [%i0 + 0]
add   %l4, 1, %l4
ba P2464
nop

TARGET2304:
ba RET2304
nop


P2464: !PREFETCH [7] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i1 + 84] %asi, 1

P2465: !DWLD [12] (Int)
ldx [%i3 + 0], %l6
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %l3
or %l3, %o1, %o1

P2466: !SWAP [15] (maybe <- 0x2000020) (Int)
mov %l4, %o2
swap  [%i3 + 192], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P2467: !BLD [3] (FP)
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

P2468: !LD [14] (Int)
lduw [%i3 + 128], %l7
! move %l7(lower) -> %o2(lower)
or %l7, %o2, %o2

P2469: !PREFETCH [5] (Int) (CBR)
prefetch [%i1 + 76], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2469
nop
RET2469:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P2470: !PREFETCH [14] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i3 + 128] %asi, 1

P2471: !BST [3] (maybe <- 0x41800107) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2472: !BST [12] (maybe <- 0x4180010b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P2473: !BST [15] (maybe <- 0x4180010c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P2474: !BLD [6] (FP)
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

P2475: !BLD [2] (FP)
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

P2476: !BLD [10] (FP)
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

P2477: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f0
membar #Sync 
! 1 addresses covered

P2478: !BST [11] (maybe <- 0x4180010d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P2479: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P2480: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P2481: !BST [15] (maybe <- 0x4180010e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P2482: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P2483: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P2484: !CASX [0] (maybe <- 0x2000021) (Int)
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

P2485: !PREFETCH [13] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i3 + 64] %asi, 1

P2486: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P2487: !ST [12] (maybe <- 0x2000023) (Int) (LE)
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

P2488: !BST [1] (maybe <- 0x4180010f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2489: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f4

P2490: !REPLACEMENT [9] (Int)
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

P2491: !DWLD [10] (Int)
ldx [%i2 + 32], %o0
! move %o0(upper) -> %o0(upper)

P2492: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f5
fmovd %f36, %f6

P2493: !CAS [11] (maybe <- 0x2000024) (Int)
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

P2494: !BST [11] (maybe <- 0x41800113) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P2495: !BST [11] (maybe <- 0x41800114) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P2496: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P2497: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P2498: !BST [6] (maybe <- 0x41800115) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2499: !PREFETCH [3] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i0 + 32] %asi, 1

P2500: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P2501: !DWLD [15] (FP)
ldd [%i3 + 192], %f10
! 1 addresses covered

P2502: !REPLACEMENT [4] (Int) (Branch target of P2564)
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
ba P2503
nop

TARGET2564:
ba RET2564
nop


P2503: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f11
fmovd %f36, %f12

P2504: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P2505: !BST [5] (maybe <- 0x41800118) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2506: !BST [10] (maybe <- 0x4180011b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P2507: !DWST [13] (maybe <- 0x2000025) (Int)
mov %l4, %l3 
sllx %l3, 32, %l3 
stx %l3, [%i3 + 64 ] 
add   %l4, 1, %l4

P2508: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P2509: !PREFETCH [7] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i1 + 84] %asi, 1

P2510: !CASX [7] (maybe <- 0x2000026) (Int)
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

P2511: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P2512: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P2513: !BLD [9] (FP)
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

P2514: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f0
membar #Sync 
! 3 addresses covered
fmovs %f3, %f0
fmovs %f4, %f1
fmovs %f5, %f2

P2515: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P2516: !REPLACEMENT [9] (Int)
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

P2517: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P2518: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P2519: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P2520: !BLD [3] (FP)
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

P2521: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P2522: !CASX [10] (maybe <- 0x2000028) (Int)
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

P2523: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f36, %f8

P2524: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P2525: !BST [7] (maybe <- 0x4180011c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2526: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P2527: !BST [3] (maybe <- 0x4180011f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2528: !PREFETCH [11] (Int) (CBR)
prefetch [%i2 + 64], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2528
nop
RET2528:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P2529: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P2530: !BLD [3] (FP)
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

P2531: !BLD [5] (FP) (CBR)
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
be,pt  %xcc, TARGET2531
nop
RET2531:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P2532: !BLD [5] (FP) (CBR)
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
be,pn  %xcc, TARGET2532
nop
RET2532:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P2533: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P2534: !REPLACEMENT [14] (Int)
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

P2535: !ST [4] (maybe <- 0x2000029) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P2536: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P2537: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f5
fmovd %f36, %f6

P2538: !BLD [5] (FP)
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

P2539: !LD [10] (Int)
lduw [%i2 + 32], %l7
! move %l7(lower) -> %o0(lower)
or %l7, %o0, %o0

P2540: !BST [6] (maybe <- 0x41800123) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2541: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P2542: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P2543: !SWAP [13] (maybe <- 0x200002a) (Int)
mov %l4, %o1
swap  [%i3 + 64], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P2544: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P2545: !BST [11] (maybe <- 0x41800126) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P2546: !BST [8] (maybe <- 0x41800127) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P2547: !BST [2] (maybe <- 0x41800128) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2548: !DWST [0] (maybe <- 0x200002b) (Int)
sllx %l4, 32, %l7 
add   %l4, 1, %l4
or %l7, %l4, %l7
stx %l7, [%i0 + 0]
add   %l4, 1, %l4

P2549: !ST [7] (maybe <- 0x200002d) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P2550: !BLD [12] (FP) (Branch target of P2154)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11
ba P2551
nop

TARGET2154:
ba RET2154
nop


P2551: !BST [3] (maybe <- 0x4180012c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2552: !CASX [12] (maybe <- 0x200002e) (Int)
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

P2553: !CASX [7] (maybe <- 0x200002f) (Int)
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

P2554: !BST [7] (maybe <- 0x41800130) (FP) (Branch target of P2531)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 
ba P2555
nop

TARGET2531:
ba RET2531
nop


P2555: !PREFETCH [8] (Int) (Branch target of P2172)
prefetch [%i1 + 256], 1
ba P2556
nop

TARGET2172:
ba RET2172
nop


P2556: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P2557: !BST [12] (maybe <- 0x41800133) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P2558: !BST [7] (maybe <- 0x41800134) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2559: !LD [5] (Int)
lduw [%i1 + 76], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

P2560: !BLD [7] (FP)
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

P2561: !BLD [6] (FP)
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

P2562: !BST [9] (maybe <- 0x41800137) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P2563: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P2564: !BLD [7] (FP) (CBR)
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
be,pn  %xcc, TARGET2564
nop
RET2564:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P2565: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P2566: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P2567: !BST [2] (maybe <- 0x41800138) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2568: !PREFETCH [0] (Int) (CBR)
prefetch [%i0 + 0], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2568
nop
RET2568:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P2569: !MEMBAR (Int)
membar #StoreLoad

P2570: !LD [0] (Int)
lduw [%i0 + 0], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P2571: !LD [1] (Int)
lduw [%i0 + 4], %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1

P2572: !LD [2] (Int)
lduw [%i0 + 12], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P2573: !LD [3] (FP)
ld [%i0 + 32], %f5
! 1 addresses covered

P2574: !LD [4] (Int) (Branch target of P2421)
lduw [%i0 + 64], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2
ba P2575
nop

TARGET2421:
ba RET2421
nop


P2575: !LD [5] (Int)
lduw [%i1 + 76], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P2576: !LD [6] (FP)
ld [%i1 + 80], %f6
! 1 addresses covered

P2577: !LD [7] (Int) (CBR)
lduw [%i1 + 84], %l6
! move %l6(lower) -> %o3(lower)
or %l6, %o3, %o3

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2577
nop
RET2577:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P2578: !LD [8] (FP)
ld [%i1 + 256], %f7
! 1 addresses covered

P2579: !LD [9] (Int)
lduw [%i1 + 512], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P2580: !LD [10] (Int)
lduw [%i2 + 32], %l7
! move %l7(lower) -> %o4(lower)
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P2581: !LD [11] (Int)
lduw [%i2 + 64], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P2582: !LD [12] (Int)
lduw [%i3 + 0], %l7
! move %l7(lower) -> %o0(lower)
or %l7, %o0, %o0

P2583: !LD [13] (Int)
lduw [%i3 + 64], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P2584: !LD [14] (Int) (LE)
wr %g0, 0x88, %asi
lduwa [%i3 + 128] %asi, %l7
! move %l7(lower) -> %o1(lower)
or %l7, %o1, %o1

P2585: !LD [15] (Int)
lduw [%i3 + 192], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

END_NODES4: ! Test istream for CPU 4 ends
sethi %hi(0xdead0e0f), %l6
or    %l6, %lo(0xdead0e0f), %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2
stw %l6, [%i5] 
ld [%i5], %f8
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

! Initialize LFSR to 0x1bdd^4
sethi %hi(0x1bdd), %l0
or    %l0, %lo(0x1bdd), %l0
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

P2586: !PREFETCH [1] (Int) (Branch target of P3033)
prefetch [%i0 + 4], 1
ba P2587
nop

TARGET3033:
ba RET3033
nop


P2587: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f0
membar #Sync 
! 1 addresses covered

P2588: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P2589: !BST [3] (maybe <- 0x42000001) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2590: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P2591: !BST [1] (maybe <- 0x42000005) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2592: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P2593: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P2594: !BST [0] (maybe <- 0x42000009) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2595: !REPLACEMENT [0] (Int)
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

P2596: !BLD [0] (FP)
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

P2597: !BST [2] (maybe <- 0x4200000d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2598: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P2599: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P2600: !DWLD [14] (Int) (CBR)
ldx [%i3 + 128], %o0
! move %o0(upper) -> %o0(upper)

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2600
nop
RET2600:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P2601: !BST [2] (maybe <- 0x42000011) (FP) (Branch target of P2600)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 
ba P2602
nop

TARGET2600:
ba RET2600
nop


P2602: !REPLACEMENT [8] (Int)
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

P2603: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P2604: !DWST [12] (maybe <- 0x2800001) (Int)
mov %l4, %l3 
sllx %l3, 32, %l3 
stx %l3, [%i3 + 0 ] 
add   %l4, 1, %l4

P2605: !BLD [2] (FP)
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

P2606: !BST [11] (maybe <- 0x42000015) (FP) (Branch target of P2829)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 
ba P2607
nop

TARGET2829:
ba RET2829
nop


P2607: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P2608: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P2609: !DWLD [13] (Int)
ldx [%i3 + 64], %o5
! move %o5(upper) -> %o0(lower)
srlx %o0, 32, %o0
sllx %o0, 32, %o0
srlx %o5, 32, %l7
or %l7, %o0, %o0

P2610: !BST [11] (maybe <- 0x42000016) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P2611: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P2612: !DWST [9] (maybe <- 0x2800002) (Int)
mov %l4, %o5 
sllx %o5, 32, %o5 
stx %o5, [%i1 + 512 ] 
add   %l4, 1, %l4

P2613: !BST [11] (maybe <- 0x42000017) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P2614: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P2615: !BLD [11] (FP)
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

P2616: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P2617: !BST [3] (maybe <- 0x42000018) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2618: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P2619: !BST [10] (maybe <- 0x4200001c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P2620: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f0
membar #Sync 
! 1 addresses covered
fmovd %f8, %f0

P2621: !BST [14] (maybe <- 0x4200001d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P2622: !BST [2] (maybe <- 0x4200001e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2623: !BST [4] (maybe <- 0x42000022) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P2624: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P2625: !BST [10] (maybe <- 0x42000023) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P2626: !PREFETCH [6] (Int) (CBR)
prefetch [%i1 + 80], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2626
nop
RET2626:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P2627: !BST [12] (maybe <- 0x42000024) (FP) (CBR)
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
be,pn  %xcc, TARGET2627
nop
RET2627:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P2628: !BST [3] (maybe <- 0x42000025) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2629: !CAS [12] (maybe <- 0x2800003) (Int)
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

P2630: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P2631: !BST [9] (maybe <- 0x42000029) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P2632: !BST [11] (maybe <- 0x4200002a) (FP) (Branch target of P2969)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 
ba P2633
nop

TARGET2969:
ba RET2969
nop


P2633: !BLD [2] (FP)
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

P2634: !PREFETCH [5] (Int) (Branch target of P2928)
prefetch [%i1 + 76], 1
ba P2635
nop

TARGET2928:
ba RET2928
nop


P2635: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P2636: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P2637: !BST [9] (maybe <- 0x4200002b) (FP) (CBR)
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
be,pn  %xcc, TARGET2637
nop
RET2637:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P2638: !BST [11] (maybe <- 0x4200002c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P2639: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P2640: !PREFETCH [7] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i1 + 84] %asi, 1

P2641: !BLD [8] (FP) (Branch target of P2637)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7
ba P2642
nop

TARGET2637:
ba RET2637
nop


P2642: !BLD [6] (FP)
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

P2643: !BST [8] (maybe <- 0x4200002d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P2644: !BST [1] (maybe <- 0x4200002e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2645: !DWLD [11] (Int)
ldx [%i2 + 64], %o2
! move %o2(upper) -> %o2(upper)

P2646: !BST [0] (maybe <- 0x42000032) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2647: !DWLD [10] (Int)
ldx [%i2 + 32], %l3
! move %l3(upper) -> %o2(lower)
srlx %o2, 32, %o2
sllx %o2, 32, %o2
srlx %l3, 32, %o5
or %o5, %o2, %o2

P2648: !ST [12] (maybe <- 0x2800004) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P2649: !BST [5] (maybe <- 0x42000036) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2650: !DWLD [11] (Int)
ldx [%i2 + 64], %o3
! move %o3(upper) -> %o3(upper)

P2651: !BST [10] (maybe <- 0x42000039) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P2652: !BLD [0] (FP)
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

P2653: !DWST [6] (maybe <- 0x2800005) (Int)
sllx %l4, 32, %l3 
add   %l4, 1, %l4
or %l3, %l4, %l3
stx %l3, [%i1 + 80]
add   %l4, 1, %l4

P2654: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P2655: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P2656: !REPLACEMENT [3] (Int)
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

P2657: !BLD [12] (FP)
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

P2658: !BLD [2] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f0
membar #Sync 
! 4 addresses covered
fmovs %f3, %f2
fmovs %f8, %f3

P2659: !BST [5] (maybe <- 0x4200003a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2660: !BLD [0] (FP)
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

P2661: !DWST [8] (maybe <- 0x2800007) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 256 ] 
add   %l4, 1, %l4

P2662: !ST [1] (maybe <- 0x2800008) (Int)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P2663: !BST [0] (maybe <- 0x4200003d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2664: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P2665: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P2666: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P2667: !BST [7] (maybe <- 0x42000041) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2668: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P2669: !LD [3] (Int)
lduw [%i0 + 32], %l7
! move %l7(lower) -> %o3(lower)
srlx %o3, 32, %o3
sllx %o3, 32, %o3
or %l7, %o3, %o3

P2670: !BST [0] (maybe <- 0x42000044) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2671: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f11
fmovd %f36, %f12

P2672: !BST [3] (maybe <- 0x42000048) (FP) (Branch target of P2788)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 
ba P2673
nop

TARGET2788:
ba RET2788
nop


P2673: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P2674: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P2675: !LD [12] (Int)
lduw [%i3 + 0], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P2676: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P2677: !ST [15] (maybe <- 0x2800009) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P2678: !DWST [0] (maybe <- 0x4200004c) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=21 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
std %f20, [%i0 + 0]

P2679: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P2680: !BLD [14] (FP)
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

P2681: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P2682: !BLD [1] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f0
membar #Sync 
! 4 addresses covered
fmovs %f3, %f2
fmovs %f8, %f3

P2683: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f4

P2684: !BST [4] (maybe <- 0x4200004e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P2685: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P2686: !BLD [6] (FP)
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

P2687: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P2688: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P2689: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P2690: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P2691: !BST [2] (maybe <- 0x4200004f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2692: !PREFETCH [5] (Int) (Branch target of P2949)
prefetch [%i1 + 76], 1
ba P2693
nop

TARGET2949:
ba RET2949
nop


P2693: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P2694: !BLD [2] (FP)
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

P2695: !PREFETCH [0] (Int) (Branch target of P2847)
prefetch [%i0 + 0], 1
ba P2696
nop

TARGET2847:
ba RET2847
nop


P2696: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P2697: !BLD [3] (FP)
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

P2698: !BLD [2] (FP)
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

P2699: !BST [12] (maybe <- 0x42000053) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P2700: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P2701: !MEMBAR (Int)
membar #StoreLoad

P2702: !DWST [0] (maybe <- 0x280000a) (Int)
sllx %l4, 32, %l7 
add   %l4, 1, %l4
or %l7, %l4, %l7
stx %l7, [%i0 + 0]
add   %l4, 1, %l4

P2703: !BST [4] (maybe <- 0x42000054) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P2704: !BLD [0] (FP)
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

P2705: !BST [6] (maybe <- 0x42000055) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2706: !BST [5] (maybe <- 0x42000058) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2707: !BST [11] (maybe <- 0x4200005b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P2708: !LD [10] (Int)
lduw [%i2 + 32], %l7
! move %l7(lower) -> %o4(lower)
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P2709: !MEMBAR (Int)
membar #StoreLoad

P2710: !DWST [7] (maybe <- 0x280000c) (Int)
sllx %l4, 32, %o5 
add   %l4, 1, %l4
or %o5, %l4, %o5
stx %o5, [%i1 + 80]
add   %l4, 1, %l4

P2711: !DWLD [0] (Int)
ldx [%i0 + 0], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)

P2712: !SWAP [3] (maybe <- 0x280000e) (Int)
mov %l4, %o1
swap  [%i0 + 32], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P2713: !BST [10] (maybe <- 0x4200005c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P2714: !DWLD [2] (Int)
ldx [%i0 + 8], %o5
! move %o5(lower) -> %o1(lower)
srl %o5, 0, %l7
or %l7, %o1, %o1

P2715: !REPLACEMENT [6] (Int)
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

P2716: !BST [10] (maybe <- 0x4200005d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P2717: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P2718: !LD [5] (Int)
lduw [%i1 + 76], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P2719: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P2720: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P2721: !BST [2] (maybe <- 0x4200005e) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
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
be,pn  %xcc, TARGET2721
nop
RET2721:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P2722: !BST [3] (maybe <- 0x42000062) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2723: !BST [2] (maybe <- 0x42000066) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2724: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P2725: !BLD [0] (FP)
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

P2726: !REPLACEMENT [8] (Int) (CBR)
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

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2726
nop
RET2726:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P2727: !CASX [10] (maybe <- 0x280000f) (Int)
add %i2, 32, %o5
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

P2728: !DWLD [9] (Int)
ldx [%i1 + 512], %o5
! move %o5(upper) -> %o4(lower)
srlx %o5, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P2729: !BST [1] (maybe <- 0x4200006a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2730: !CASX [1] (maybe <- 0x2800010) (Int)
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

P2731: !PREFETCH [5] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i1 + 76] %asi, 1

P2732: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f0
membar #Sync 
! 3 addresses covered
fmovs %f3, %f0
fmovs %f4, %f1
fmovs %f5, %f2

P2733: !BST [6] (maybe <- 0x4200006e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2734: !BLD [13] (FP) (Branch target of P2824)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3
ba P2735
nop

TARGET2824:
ba RET2824
nop


P2735: !BLD [5] (FP)
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

P2736: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P2737: !BST [9] (maybe <- 0x42000071) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P2738: !BST [1] (maybe <- 0x42000072) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2739: !REPLACEMENT [6] (Int)
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

P2740: !ST [9] (maybe <- 0x2800012) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P2741: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P2742: !BST [7] (maybe <- 0x42000076) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2743: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P2744: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P2745: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P2746: !ST [5] (maybe <- 0x2800013) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P2747: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P2748: !BST [13] (maybe <- 0x42000079) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P2749: !PREFETCH [5] (Int) (Branch target of P2846)
prefetch [%i1 + 76], 1
ba P2750
nop

TARGET2846:
ba RET2846
nop


P2750: !SWAP [14] (maybe <- 0x2800014) (Int) (Branch target of P2867)
mov %l4, %o2
swap  [%i3 + 128], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4
ba P2751
nop

TARGET2867:
ba RET2867
nop


P2751: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P2752: !BST [1] (maybe <- 0x4200007a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2753: !BST [11] (maybe <- 0x4200007e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P2754: !LD [0] (Int)
lduw [%i0 + 0], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2

P2755: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P2756: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P2757: !BST [11] (maybe <- 0x4200007f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P2758: !BST [1] (maybe <- 0x42000080) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2759: !BLD [2] (FP)
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

P2760: !BST [13] (maybe <- 0x42000084) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P2761: !PREFETCH [6] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i1 + 80] %asi, 1

P2762: !BST [4] (maybe <- 0x42000085) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P2763: !BST [14] (maybe <- 0x42000086) (FP) (Branch target of P3052)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 
ba P2764
nop

TARGET3052:
ba RET3052
nop


P2764: !BST [15] (maybe <- 0x42000087) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P2765: !MEMBAR (Int)
membar #StoreLoad

P2766: !REPLACEMENT [12] (Int)
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

P2767: !BST [4] (maybe <- 0x42000088) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P2768: !REPLACEMENT [4] (Int)
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

P2769: !BST [0] (maybe <- 0x42000089) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2770: !CASX [6] (maybe <- 0x2800015) (Int)
add %i1, 80, %l6
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

P2771: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P2772: !ST [11] (maybe <- 0x2800017) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P2773: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P2774: !BST [0] (maybe <- 0x4200008d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2775: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f0
membar #Sync 
! 1 addresses covered

P2776: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P2777: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P2778: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P2779: !BLD [3] (FP)
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

P2780: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P2781: !BST [0] (maybe <- 0x42000091) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2782: !BST [1] (maybe <- 0x42000095) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2783: !BST [5] (maybe <- 0x42000099) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2784: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P2785: !BLD [1] (FP)
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

P2786: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P2787: !DWLD [12] (FP) (Branch target of P2896)
ldd [%i3 + 0], %f10
! 1 addresses covered
ba P2788
nop

TARGET2896:
ba RET2896
nop


P2788: !BST [12] (maybe <- 0x4200009c) (FP) (CBR)
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
be,pn  %xcc, TARGET2788
nop
RET2788:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P2789: !ST [4] (maybe <- 0x2800018) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P2790: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P2791: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P2792: !BST [10] (maybe <- 0x4200009d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P2793: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P2794: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P2795: !BST [13] (maybe <- 0x4200009e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P2796: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P2797: !BST [7] (maybe <- 0x4200009f) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
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
be,pt  %xcc, TARGET2797
nop
RET2797:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P2798: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f14

P2799: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P2800: !BLD [5] (FP)
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

P2801: !BLD [3] (FP)
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

P2802: !BST [11] (maybe <- 0x420000a2) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P2803: !CAS [1] (maybe <- 0x2800019) (Int)
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

P2804: !BLD [1] (FP)
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

P2805: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P2806: !BST [3] (maybe <- 0x420000a3) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2807: !PREFETCH [3] (Int) (Branch target of P2953)
prefetch [%i0 + 32], 1
ba P2808
nop

TARGET2953:
ba RET2953
nop


P2808: !BLD [5] (FP)
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

P2809: !BST [1] (maybe <- 0x420000a7) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2810: !BLD [1] (FP)
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

P2811: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P2812: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P2813: !BST [7] (maybe <- 0x420000ab) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2814: !BST [11] (maybe <- 0x420000ae) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P2815: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P2816: !BST [14] (maybe <- 0x420000af) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P2817: !BST [7] (maybe <- 0x420000b0) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2818: !LD [11] (Int)
lduw [%i2 + 64], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P2819: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P2820: !ST [4] (maybe <- 0x420000b3) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i0 + 64 ]

P2821: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P2822: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P2823: !MEMBAR (Int)
membar #StoreLoad

P2824: !DWLD [6] (Int) (CBR)
ldx [%i1 + 80], %o5
! move %o5(upper) -> %o1(lower)
srlx %o5, 32, %l7
or %l7, %o1, %o1
! move %o5(lower) -> %o2(upper)
sllx %o5, 32, %o2

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2824
nop
RET2824:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P2825: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P2826: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P2827: !PREFETCH [5] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i1 + 76] %asi, 1

P2828: !DWST [13] (maybe <- 0x280001a) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 64 ] 
add   %l4, 1, %l4

P2829: !SWAP [12] (maybe <- 0x280001b) (Int) (CBR)
mov %l4, %l7
swap  [%i3 + 0], %l7
! move %l7(lower) -> %o2(lower)
srl %l7, 0, %l3
or %l3, %o2, %o2
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2829
nop
RET2829:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P2830: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P2831: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P2832: !BST [2] (maybe <- 0x420000b4) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2833: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P2834: !BST [10] (maybe <- 0x420000b8) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P2835: !BLD [3] (FP)
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

P2836: !BST [9] (maybe <- 0x420000b9) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P2837: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P2838: !BLD [7] (FP) (Branch target of P3100)
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
ba P2839
nop

TARGET3100:
ba RET3100
nop


P2839: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f0
membar #Sync 
! 1 addresses covered

P2840: !BLD [3] (FP)
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

P2841: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P2842: !BST [10] (maybe <- 0x420000ba) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P2843: !BLD [3] (FP)
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

P2844: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P2845: !BST [0] (maybe <- 0x420000bb) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2846: !PREFETCH [7] (Int) (CBR)
prefetch [%i1 + 84], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2846
nop
RET2846:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P2847: !BST [1] (maybe <- 0x420000bf) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
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
be,pn  %xcc, TARGET2847
nop
RET2847:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P2848: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P2849: !BST [10] (maybe <- 0x420000c3) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P2850: !BST [12] (maybe <- 0x420000c4) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P2851: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P2852: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P2853: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P2854: !REPLACEMENT [11] (Int)
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

P2855: !BLD [1] (FP)
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

P2856: !MEMBAR (Int)
membar #StoreLoad

P2857: !BST [4] (maybe <- 0x420000c5) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P2858: !BST [6] (maybe <- 0x420000c6) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
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
be,pn  %xcc, TARGET2858
nop
RET2858:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P2859: !BLD [0] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f0
membar #Sync 
! 4 addresses covered
fmovs %f3, %f2
fmovs %f8, %f3

P2860: !BST [5] (maybe <- 0x420000c9) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2861: !DWST [3] (maybe <- 0x280001c) (Int)
mov %l4, %o5 
sllx %o5, 32, %o5 
stx %o5, [%i0 + 32 ] 
add   %l4, 1, %l4

P2862: !BLD [5] (FP) (Branch target of P2933)
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
ba P2863
nop

TARGET2933:
ba RET2933
nop


P2863: !BST [8] (maybe <- 0x420000cc) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P2864: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f36, %f8

P2865: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P2866: !BST [9] (maybe <- 0x420000cd) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P2867: !BLD [10] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f10

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2867
nop
RET2867:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P2868: !BST [8] (maybe <- 0x420000ce) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P2869: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P2870: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P2871: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P2872: !DWST [1] (maybe <- 0x280001d) (Int)
sllx %l4, 32, %l3 
add   %l4, 1, %l4
or %l3, %l4, %l3
stx %l3, [%i0 + 0]
add   %l4, 1, %l4

P2873: !BLD [7] (FP)
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

P2874: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P2875: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P2876: !BLD [10] (FP) (Branch target of P2626)
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
ba P2877
nop

TARGET2626:
ba RET2626
nop


P2877: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f0
membar #Sync 
! 1 addresses covered

P2878: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P2879: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P2880: !BLD [3] (FP)
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

P2881: !BST [12] (maybe <- 0x420000cf) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P2882: !CAS [2] (maybe <- 0x280001f) (Int)
add %i0, 12, %o5
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

P2883: !REPLACEMENT [4] (Int)
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

P2884: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P2885: !BST [5] (maybe <- 0x420000d0) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2886: !BST [14] (maybe <- 0x420000d3) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P2887: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P2888: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P2889: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f36, %f8

P2890: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f10

P2891: !BST [13] (maybe <- 0x420000d4) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P2892: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P2893: !DWST [14] (maybe <- 0x420000d5) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
std %f20, [%i3 + 128]

P2894: !BLD [0] (FP)
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

P2895: !SWAP [2] (maybe <- 0x2800020) (Int)
mov %l4, %o4
swap  [%i0 + 12], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
add   %l4, 1, %l4

P2896: !BST [5] (maybe <- 0x420000d6) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
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
be,pn  %xcc, TARGET2896
nop
RET2896:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P2897: !BST [13] (maybe <- 0x420000d9) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P2898: !BST [2] (maybe <- 0x420000da) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2899: !BLD [9] (FP)
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

P2900: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f0
membar #Sync 
! 1 addresses covered
fmovd %f8, %f0

P2901: !BST [11] (maybe <- 0x420000de) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P2902: !BST [15] (maybe <- 0x420000df) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P2903: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P2904: !BST [14] (maybe <- 0x420000e0) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P2905: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P2906: !BST [14] (maybe <- 0x420000e1) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P2907: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P2908: !DWST [2] (maybe <- 0x2800021) (Int)
mov %l4, %l7 
stx %l7, [%i0 + 8]
add   %l4, 1, %l4

P2909: !PREFETCH [13] (Int) (Branch target of P2627)
prefetch [%i3 + 64], 1
ba P2910
nop

TARGET2627:
ba RET2627
nop


P2910: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P2911: !PREFETCH [3] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i0 + 32] %asi, 1

P2912: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P2913: !ST [14] (maybe <- 0x2800022) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P2914: !BST [5] (maybe <- 0x420000e2) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2915: !BST [3] (maybe <- 0x420000e5) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2916: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P2917: !BST [11] (maybe <- 0x420000e9) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P2918: !BST [8] (maybe <- 0x420000ea) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P2919: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P2920: !BST [9] (maybe <- 0x420000eb) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P2921: !BST [15] (maybe <- 0x420000ec) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P2922: !BST [13] (maybe <- 0x420000ed) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P2923: !PREFETCH [4] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i0 + 64] %asi, 1

P2924: !BST [9] (maybe <- 0x420000ee) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P2925: !LD [0] (Int)
lduw [%i0 + 0], %l6
! move %l6(lower) -> %o4(lower)
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P2926: !DWST [11] (maybe <- 0x2800023) (Int)
mov %l4, %l7 
sllx %l7, 32, %l7 
stx %l7, [%i2 + 64 ] 
add   %l4, 1, %l4

P2927: !BLD [7] (FP)
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

P2928: !PREFETCH [3] (Int) (CBR)
prefetch [%i0 + 32], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2928
nop
RET2928:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P2929: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P2930: !BST [9] (maybe <- 0x420000ef) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P2931: !BST [10] (maybe <- 0x420000f0) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P2932: !BST [8] (maybe <- 0x420000f1) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P2933: !PREFETCH [8] (Int) (LE) (CBR)
wr %g0, 0x88, %asi
prefetcha [%i1 + 256] %asi, 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2933
nop
RET2933:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P2934: !BST [11] (maybe <- 0x420000f2) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P2935: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P2936: !BLD [0] (FP)
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

P2937: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P2938: !BLD [2] (FP) (CBR)
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
be,pn  %xcc, TARGET2938
nop
RET2938:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P2939: !BLD [5] (FP)
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

P2940: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P2941: !DWST [8] (maybe <- 0x2800024) (Int)
mov %l4, %l3 
sllx %l3, 32, %l3 
stx %l3, [%i1 + 256 ] 
add   %l4, 1, %l4

P2942: !BLD [2] (FP)
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

P2943: !BST [2] (maybe <- 0x420000f3) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2944: !BST [0] (maybe <- 0x420000f7) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2945: !BLD [3] (FP)
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

P2946: !BST [15] (maybe <- 0x420000fb) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P2947: !BLD [0] (FP)
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

P2948: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P2949: !DWLD [0] (Int) (CBR)
ldx [%i0 + 0], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2949
nop
RET2949:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P2950: !BST [12] (maybe <- 0x420000fc) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P2951: !BST [14] (maybe <- 0x420000fd) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P2952: !BLD [2] (FP)
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

P2953: !DWST [0] (maybe <- 0x2800025) (Int) (CBR)
sllx %l4, 32, %l6 
add   %l4, 1, %l4
or %l6, %l4, %l6
stx %l6, [%i0 + 0]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2953
nop
RET2953:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P2954: !BST [8] (maybe <- 0x420000fe) (FP) (Branch target of P3006)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 
ba P2955
nop

TARGET3006:
ba RET3006
nop


P2955: !BLD [1] (FP)
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

P2956: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P2957: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P2958: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P2959: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P2960: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P2961: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P2962: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P2963: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P2964: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P2965: !DWLD [4] (Int)
ldx [%i0 + 64], %o1
! move %o1(upper) -> %o1(upper)

P2966: !BST [14] (maybe <- 0x420000ff) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P2967: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P2968: !BST [8] (maybe <- 0x42000100) (FP) (Branch target of P3089)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 
ba P2969
nop

TARGET3089:
ba RET3089
nop


P2969: !BST [8] (maybe <- 0x42000101) (FP) (CBR)
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
be,pt  %xcc, TARGET2969
nop
RET2969:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P2970: !BST [10] (maybe <- 0x42000102) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P2971: !BST [5] (maybe <- 0x42000103) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2972: !BLD [5] (FP)
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

P2973: !DWST [3] (maybe <- 0x2800027) (Int)
mov %l4, %l7 
sllx %l7, 32, %l7 
stx %l7, [%i0 + 32 ] 
add   %l4, 1, %l4

P2974: !BST [9] (maybe <- 0x42000106) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P2975: !BLD [0] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f0
membar #Sync 
! 4 addresses covered
fmovs %f3, %f2
fmovs %f8, %f3

P2976: !BST [4] (maybe <- 0x42000107) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P2977: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P2978: !BLD [1] (FP)
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

P2979: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P2980: !BLD [14] (FP) (Branch target of P3038)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8
ba P2981
nop

TARGET3038:
ba RET3038
nop


P2981: !PREFETCH [3] (Int) (Branch target of P2858)
prefetch [%i0 + 32], 1
ba P2982
nop

TARGET2858:
ba RET2858
nop


P2982: !BST [7] (maybe <- 0x42000108) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2983: !BST [7] (maybe <- 0x4200010b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P2984: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P2985: !BST [3] (maybe <- 0x4200010e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2986: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f9
fmovd %f36, %f10

P2987: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P2988: !DWST [12] (maybe <- 0x2800028) (Int) (Branch target of P2721)
mov %l4, %l3 
sllx %l3, 32, %l3 
stx %l3, [%i3 + 0 ] 
add   %l4, 1, %l4
ba P2989
nop

TARGET2721:
ba RET2721
nop


P2989: !DWLD [15] (Int)
ldx [%i3 + 192], %l3
! move %l3(upper) -> %o1(lower)
srlx %o1, 32, %o1
sllx %o1, 32, %o1
srlx %l3, 32, %o5
or %o5, %o1, %o1

P2990: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P2991: !BLD [7] (FP)
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

P2992: !CASX [2] (maybe <- 0x2800029) (Int)
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

P2993: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P2994: !BLD [12] (FP)
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

P2995: !BLD [2] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f0
membar #Sync 
! 4 addresses covered
fmovs %f3, %f2
fmovs %f8, %f3

P2996: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f4

P2997: !CAS [1] (maybe <- 0x280002a) (Int)
add %i0, 4, %l7
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

P2998: !BST [1] (maybe <- 0x42000112) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P2999: !ST [0] (maybe <- 0x280002b) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P3000: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P3001: !DWST [4] (maybe <- 0x280002c) (Int)
mov %l4, %o5 
sllx %o5, 32, %o5 
stx %o5, [%i0 + 64 ] 
add   %l4, 1, %l4

P3002: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P3003: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P3004: !PREFETCH [6] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i1 + 80] %asi, 1

P3005: !BST [10] (maybe <- 0x42000116) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P3006: !DWLD [6] (Int) (CBR)
ldx [%i1 + 80], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3006
nop
RET3006:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P3007: !BST [6] (maybe <- 0x42000117) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3008: !BLD [6] (FP)
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

P3009: !BST [8] (maybe <- 0x4200011a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P3010: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P3011: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P3012: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P3013: !REPLACEMENT [2] (Int)
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

P3014: !BST [14] (maybe <- 0x4200011b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P3015: !BST [14] (maybe <- 0x4200011c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P3016: !DWLD [9] (Int)
ldx [%i1 + 512], %o1
! move %o1(upper) -> %o1(upper)

P3017: !BST [1] (maybe <- 0x4200011d) (FP) (CBR) (Branch target of P2797)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
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
be,pn  %xcc, TARGET3017
nop
RET3017:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0

ba P3018
nop

TARGET2797:
ba RET2797
nop


P3018: !BST [6] (maybe <- 0x42000121) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3019: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P3020: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P3021: !BST [6] (maybe <- 0x42000124) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3022: !BST [9] (maybe <- 0x42000127) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P3023: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P3024: !BLD [4] (FP) (Branch target of P3017)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12
ba P3025
nop

TARGET3017:
ba RET3017
nop


P3025: !DWST [6] (maybe <- 0x280002d) (Int)
sllx %l4, 32, %l7 
add   %l4, 1, %l4
or %l7, %l4, %l7
stx %l7, [%i1 + 80]
add   %l4, 1, %l4

P3026: !BLD [5] (FP)
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

P3027: !BLD [1] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f0
membar #Sync 
! 4 addresses covered
fmovs %f3, %f2
fmovs %f8, %f3

P3028: !NOP (Int)
nop

P3029: !LD [1] (Int)
lduw [%i0 + 4], %l7
! move %l7(lower) -> %o1(lower)
srlx %o1, 32, %o1
sllx %o1, 32, %o1
or %l7, %o1, %o1

P3030: !BST [1] (maybe <- 0x42000128) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3031: !REPLACEMENT [5] (Int)
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

P3032: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P3033: !PREFETCH [9] (Int) (CBR)
prefetch [%i1 + 512], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3033
nop
RET3033:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P3034: !BST [6] (maybe <- 0x4200012c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3035: !BST [1] (maybe <- 0x4200012f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3036: !PREFETCH [6] (Int) (Branch target of P2726)
prefetch [%i1 + 80], 1
ba P3037
nop

TARGET2726:
ba RET2726
nop


P3037: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P3038: !ST [15] (maybe <- 0x42000133) (FP) (CBR)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i3 + 192 ]

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3038
nop
RET3038:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P3039: !BST [2] (maybe <- 0x42000134) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3040: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P3041: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P3042: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P3043: !BST [2] (maybe <- 0x42000138) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3044: !BST [0] (maybe <- 0x4200013c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3045: !BST [3] (maybe <- 0x42000140) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3046: !REPLACEMENT [1] (Int)
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

P3047: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P3048: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P3049: !ST [12] (maybe <- 0x280002f) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P3050: !DWST [12] (maybe <- 0x2800030) (Int) (CBR)
mov %l4, %l7 
sllx %l7, 32, %l7 
stx %l7, [%i3 + 0 ] 
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3050
nop
RET3050:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P3051: !BLD [0] (FP)
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

P3052: !LD [13] (Int) (CBR)
lduw [%i3 + 64], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3052
nop
RET3052:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P3053: !BST [8] (maybe <- 0x42000144) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P3054: !CASX [4] (maybe <- 0x2800031) (Int)
add %i0, 64, %l6
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

P3055: !BLD [6] (FP)
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

P3056: !BLD [8] (FP)
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

P3057: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P3058: !BST [15] (maybe <- 0x42000145) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P3059: !BST [0] (maybe <- 0x42000146) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3060: !BST [13] (maybe <- 0x4200014a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P3061: !BST [4] (maybe <- 0x4200014b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P3062: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f0
membar #Sync 
! 1 addresses covered

P3063: !BST [0] (maybe <- 0x4200014c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3064: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P3065: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P3066: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P3067: !DWLD [3] (Int)
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

P3068: !DWLD [0] (Int)
ldx [%i0 + 0], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)

P3069: !BST [3] (maybe <- 0x42000150) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3070: !BST [7] (maybe <- 0x42000154) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3071: !LD [6] (Int)
lduw [%i1 + 80], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P3072: !BLD [1] (FP)
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

P3073: !BST [3] (maybe <- 0x42000157) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3074: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P3075: !BST [1] (maybe <- 0x4200015b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3076: !CASX [13] (maybe <- 0x2800032) (Int)
add %i3, 64, %l7
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

P3077: !BLD [8] (FP) (Branch target of P2938)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5
ba P3078
nop

TARGET2938:
ba RET2938
nop


P3078: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P3079: !BLD [5] (FP)
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

P3080: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f9

P3081: !LD [8] (Int)
lduw [%i1 + 256], %l7
! move %l7(lower) -> %o3(lower)
or %l7, %o3, %o3

P3082: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P3083: !BLD [2] (FP)
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

P3084: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P3085: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P3086: !MEMBAR (Int)
membar #StoreLoad

P3087: !LD [0] (Int)
lduw [%i0 + 0], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P3088: !LD [1] (Int)
lduw [%i0 + 4], %l7
! move %l7(lower) -> %o4(lower)
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P3089: !LD [2] (Int) (CBR)
lduw [%i0 + 12], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3089
nop
RET3089:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P3090: !LD [3] (Int)
lduw [%i0 + 32], %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0

P3091: !LD [4] (Int)
lduw [%i0 + 64], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P3092: !LD [5] (Int)
lduw [%i1 + 76], %o5
! move %o5(lower) -> %o1(lower)
or %o5, %o1, %o1

P3093: !LD [6] (Int)
lduw [%i1 + 80], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P3094: !LD [7] (Int)
lduw [%i1 + 84], %o5
! move %o5(lower) -> %o2(lower)
or %o5, %o2, %o2

P3095: !LD [8] (Int)
lduw [%i1 + 256], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P3096: !LD [9] (Int)
lduw [%i1 + 512], %o5
! move %o5(lower) -> %o3(lower)
or %o5, %o3, %o3

P3097: !LD [10] (Int) (LE)
wr %g0, 0x88, %asi
lduwa [%i2 + 32] %asi, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P3098: !LD [11] (FP)
ld [%i2 + 64], %f15
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

P3099: !LD [12] (FP)
ld [%i3 + 0], %f0
! 1 addresses covered

P3100: !LD [13] (Int) (CBR) (Branch target of P3050)
lduw [%i3 + 64], %o5
! move %o5(lower) -> %o4(lower)
or %o5, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3100
nop
RET3100:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0

ba P3101
nop

TARGET3050:
ba RET3050
nop


P3101: !LD [14] (Int)
lduw [%i3 + 128], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P3102: !LD [15] (FP)
ld [%i3 + 192], %f1
! 1 addresses covered

END_NODES5: ! Test istream for CPU 5 ends
sethi %hi(0xdead0e0f), %o5
or    %o5, %lo(0xdead0e0f), %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0
stw %o5, [%i5] 
ld [%i5], %f2
!---- flushing int results buffer----
mov %o0, %l5
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

! Initialize LFSR to 0x4cd2^4
sethi %hi(0x4cd2), %l0
or    %l0, %lo(0x4cd2), %l0
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

P3103: !BST [4] (maybe <- 0x42800001) (FP) (CBR)
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
be,pt  %xcc, TARGET3103
nop
RET3103:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P3104: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f0
membar #Sync 
! 1 addresses covered

P3105: !BST [3] (maybe <- 0x42800002) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3106: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P3107: !BST [11] (maybe <- 0x42800006) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P3108: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P3109: !BLD [6] (FP)
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

P3110: !LD [1] (Int)
lduw [%i0 + 4], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P3111: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P3112: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P3113: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P3114: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P3115: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P3116: !BST [3] (maybe <- 0x42800007) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3117: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P3118: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P3119: !REPLACEMENT [15] (Int)
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

P3120: !BST [11] (maybe <- 0x4280000b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P3121: !BST [4] (maybe <- 0x4280000c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P3122: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P3123: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P3124: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P3125: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P3126: !BST [1] (maybe <- 0x4280000d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3127: !REPLACEMENT [5] (Int) (CBR)
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

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3127
nop
RET3127:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P3128: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P3129: !BST [7] (maybe <- 0x42800011) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3130: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P3131: !SWAP [12] (maybe <- 0x3000001) (Int)
mov %l4, %l7
swap  [%i3 + 0], %l7
! move %l7(lower) -> %o0(lower)
srl %l7, 0, %l3
or %l3, %o0, %o0
add   %l4, 1, %l4

P3132: !BLD [1] (FP)
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

P3133: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P3134: !BST [13] (maybe <- 0x42800014) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P3135: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P3136: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P3137: !BST [4] (maybe <- 0x42800015) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P3138: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P3139: !BST [11] (maybe <- 0x42800016) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P3140: !BST [2] (maybe <- 0x42800017) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3141: !BST [4] (maybe <- 0x4280001b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P3142: !SWAP [7] (maybe <- 0x3000002) (Int)
mov %l4, %o1
swap  [%i1 + 84], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P3143: !BST [12] (maybe <- 0x4280001c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P3144: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P3145: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P3146: !BLD [0] (FP) (Branch target of P3464)
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
ba P3147
nop

TARGET3464:
ba RET3464
nop


P3147: !BLD [0] (FP)
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

P3148: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P3149: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P3150: !BST [8] (maybe <- 0x4280001d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P3151: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P3152: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P3153: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f8

P3154: !PREFETCH [3] (Int) (LE) (Branch target of P3290)
wr %g0, 0x88, %asi
prefetcha [%i0 + 32] %asi, 1
ba P3155
nop

TARGET3290:
ba RET3290
nop


P3155: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f9
fmovd %f36, %f10

P3156: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P3157: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P3158: !BST [0] (maybe <- 0x4280001e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3159: !DWST [3] (maybe <- 0x3000003) (Int)
mov %l4, %l7 
sllx %l7, 32, %l7 
stx %l7, [%i0 + 32 ] 
add   %l4, 1, %l4

P3160: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P3161: !BST [0] (maybe <- 0x42800022) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3162: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P3163: !REPLACEMENT [6] (Int)
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

P3164: !LD [13] (Int)
lduw [%i3 + 64], %l3
! move %l3(lower) -> %o1(lower)
or %l3, %o1, %o1

P3165: !BST [13] (maybe <- 0x42800026) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P3166: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P3167: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P3168: !BST [5] (maybe <- 0x42800027) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3169: !BLD [6] (FP)
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

P3170: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P3171: !BLD [7] (FP)
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

P3172: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f5

P3173: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P3174: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P3175: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P3176: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P3177: !BST [11] (maybe <- 0x4280002a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P3178: !LD [13] (Int)
lduw [%i3 + 64], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P3179: !REPLACEMENT [4] (Int)
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

P3180: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P3181: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P3182: !BST [10] (maybe <- 0x4280002b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P3183: !BST [5] (maybe <- 0x4280002c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3184: !BST [13] (maybe <- 0x4280002f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P3185: !BST [10] (maybe <- 0x42800030) (FP) (CBR)
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
be,pn  %xcc, TARGET3185
nop
RET3185:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P3186: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P3187: !BST [14] (maybe <- 0x42800031) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P3188: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P3189: !CAS [5] (maybe <- 0x3000004) (Int)
add %i1, 76, %l3
lduw [%l3], %l7
mov %l7, %o5
! move %o5(lower) -> %o2(lower)
or %o5, %o2, %o2
mov %l4, %o3
cas [%l3], %o5, %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P3190: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P3191: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P3192: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P3193: !SWAP [9] (maybe <- 0x3000005) (Int)
mov %l4, %l6
swap  [%i1 + 512], %l6
! move %l6(lower) -> %o3(lower)
srl %l6, 0, %o5
or %o5, %o3, %o3
add   %l4, 1, %l4

P3194: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P3195: !BST [1] (maybe <- 0x42800032) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3196: !DWST [3] (maybe <- 0x42800036) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
std %f20, [%i0 + 32]

P3197: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P3198: !PREFETCH [0] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i0 + 0] %asi, 1

P3199: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P3200: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f13

P3201: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P3202: !BLD [2] (FP)
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

P3203: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P3204: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P3205: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P3206: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P3207: !CASX [12] (maybe <- 0x3000006) (Int)
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

P3208: !BST [1] (maybe <- 0x42800037) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3209: !BST [9] (maybe <- 0x4280003b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P3210: !LD [14] (FP)
ld [%i3 + 128], %f5
! 1 addresses covered

P3211: !BST [11] (maybe <- 0x4280003c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P3212: !BST [12] (maybe <- 0x4280003d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P3213: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P3214: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P3215: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P3216: !BLD [1] (FP)
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

P3217: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P3218: !DWST [1] (maybe <- 0x3000007) (Int)
sllx %l4, 32, %l3 
add   %l4, 1, %l4
or %l3, %l4, %l3
stx %l3, [%i0 + 0]
add   %l4, 1, %l4

P3219: !ST [3] (maybe <- 0x3000009) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P3220: !BLD [3] (FP)
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

P3221: !BST [2] (maybe <- 0x4280003e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3222: !BST [12] (maybe <- 0x42800042) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P3223: !BST [8] (maybe <- 0x42800043) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P3224: !BLD [2] (FP)
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

P3225: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P3226: !PREFETCH [1] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i0 + 4] %asi, 1

P3227: !PREFETCH [1] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i0 + 4] %asi, 1

P3228: !LD [2] (Int)
lduw [%i0 + 12], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P3229: !DWLD [9] (Int)
ldx [%i1 + 512], %l7
! move %l7(upper) -> %o1(lower)
srlx %l7, 32, %l6
or %l6, %o1, %o1

P3230: !BST [6] (maybe <- 0x42800044) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3231: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f3
fmovd %f36, %f4

P3232: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P3233: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P3234: !BST [1] (maybe <- 0x42800047) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
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
be,pn  %xcc, TARGET3234
nop
RET3234:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P3235: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P3236: !BST [9] (maybe <- 0x4280004b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P3237: !BST [11] (maybe <- 0x4280004c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P3238: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P3239: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P3240: !BLD [0] (FP)
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

P3241: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P3242: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f12

P3243: !BLD [7] (FP) (Branch target of P3400)
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
ba P3244
nop

TARGET3400:
ba RET3400
nop


P3244: !BST [10] (maybe <- 0x4280004d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P3245: !LD [10] (Int)
lduw [%i2 + 32], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P3246: !DWST [13] (maybe <- 0x300000a) (Int) (LE)
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

P3247: !MEMBAR (Int)
membar #StoreLoad

P3248: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P3249: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P3250: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f0
membar #Sync 
! 1 addresses covered

P3251: !BLD [0] (FP)
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

P3252: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P3253: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P3254: !BST [8] (maybe <- 0x4280004e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P3255: !BLD [4] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3255
nop
RET3255:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P3256: !BST [14] (maybe <- 0x4280004f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P3257: !BST [9] (maybe <- 0x42800050) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P3258: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P3259: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P3260: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P3261: !BST [1] (maybe <- 0x42800051) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3262: !BST [8] (maybe <- 0x42800055) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P3263: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P3264: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P3265: !REPLACEMENT [13] (Int)
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

P3266: !BLD [6] (FP)
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

P3267: !BST [15] (maybe <- 0x42800056) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P3268: !BST [0] (maybe <- 0x42800057) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3269: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P3270: !LD [4] (FP)
ld [%i0 + 64], %f11
! 1 addresses covered

P3271: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P3272: !BST [0] (maybe <- 0x4280005b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3273: !CAS [3] (maybe <- 0x300000b) (Int) (LE)
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
lduwa [%l6] %asi, %o5
mov %o5, %l3
! move %l3(lower) -> %o2(lower)
or %l3, %o2, %o2
mov %l7, %o3
casa [%l6] %asi, %l3, %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P3274: !BST [3] (maybe <- 0x4280005f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3275: !ST [9] (maybe <- 0x300000c) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P3276: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P3277: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P3278: !BST [15] (maybe <- 0x42800063) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P3279: !BST [8] (maybe <- 0x42800064) (FP) (Branch target of P3380)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 
ba P3280
nop

TARGET3380:
ba RET3380
nop


P3280: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P3281: !BST [5] (maybe <- 0x42800065) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3282: !BLD [1] (FP)
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

P3283: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P3284: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P3285: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f2

P3286: !BST [1] (maybe <- 0x42800068) (FP) (Branch target of P3255)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 
ba P3287
nop

TARGET3255:
ba RET3255
nop


P3287: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P3288: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P3289: !REPLACEMENT [11] (Int)
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

P3290: !BST [12] (maybe <- 0x4280006c) (FP) (CBR)
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
be,pn  %xcc, TARGET3290
nop
RET3290:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P3291: !LD [13] (FP)
ld [%i3 + 64], %f4
! 1 addresses covered

P3292: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P3293: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f5
fmovd %f36, %f6

P3294: !MEMBAR (Int)
membar #StoreLoad

P3295: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P3296: !BST [8] (maybe <- 0x4280006d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P3297: !BST [15] (maybe <- 0x4280006e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P3298: !PREFETCH [12] (Int) (CBR)
prefetch [%i3 + 0], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3298
nop
RET3298:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P3299: !BLD [1] (FP)
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

P3300: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P3301: !BLD [5] (FP)
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

P3302: !BLD [3] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f0
membar #Sync 
! 4 addresses covered
fmovs %f3, %f2
fmovs %f8, %f3

P3303: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P3304: !BLD [5] (FP)
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

P3305: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P3306: !SWAP [8] (maybe <- 0x300000d) (Int)
mov %l4, %l7
swap  [%i1 + 256], %l7
! move %l7(lower) -> %o3(lower)
srl %l7, 0, %l3
or %l3, %o3, %o3
add   %l4, 1, %l4

P3307: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P3308: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f8

P3309: !BLD [9] (FP) (Branch target of P3597)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9
ba P3310
nop

TARGET3597:
ba RET3597
nop


P3310: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P3311: !LD [6] (Int)
lduw [%i1 + 80], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P3312: !BST [6] (maybe <- 0x4280006f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3313: !BST [11] (maybe <- 0x42800072) (FP) (CBR) (Branch target of P3501)
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
be,pn  %xcc, TARGET3313
nop
RET3313:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0

ba P3314
nop

TARGET3501:
ba RET3501
nop


P3314: !BLD [12] (FP) (Branch target of P3581)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10
ba P3315
nop

TARGET3581:
ba RET3581
nop


P3315: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P3316: !BST [0] (maybe <- 0x42800073) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3317: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P3318: !BLD [6] (FP)
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

P3319: !BLD [3] (FP)
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

P3320: !PREFETCH [13] (Int) (CBR)
prefetch [%i3 + 64], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3320
nop
RET3320:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P3321: !BST [11] (maybe <- 0x42800077) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P3322: !BST [1] (maybe <- 0x42800078) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3323: !BST [2] (maybe <- 0x4280007c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3324: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P3325: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P3326: !CASX [9] (maybe <- 0x300000e) (Int)
add %i1, 512, %l7
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

P3327: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P3328: !LD [14] (Int)
lduw [%i3 + 128], %l7
! move %l7(lower) -> %o1(lower)
or %l7, %o1, %o1

P3329: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P3330: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P3331: !BST [5] (maybe <- 0x42800080) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3332: !DWST [5] (maybe <- 0x300000f) (Int)
mov %l4, %l7 
stx %l7, [%i1 + 72]
add   %l4, 1, %l4

P3333: !BST [7] (maybe <- 0x42800083) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3334: !BST [0] (maybe <- 0x42800086) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
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
be,pt  %xcc, TARGET3334
nop
RET3334:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P3335: !REPLACEMENT [8] (Int)
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

P3336: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P3337: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P3338: !BLD [7] (FP)
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

P3339: !BLD [0] (FP)
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

P3340: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P3341: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P3342: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P3343: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P3344: !BST [6] (maybe <- 0x4280008a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3345: !ST [11] (maybe <- 0x3000010) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P3346: !BLD [7] (FP)
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

P3347: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P3348: !LD [9] (Int)
lduw [%i1 + 512], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P3349: !BST [1] (maybe <- 0x4280008d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3350: !CASX [14] (maybe <- 0x3000011) (Int)
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

P3351: !DWLD [13] (Int)
ldx [%i3 + 64], %o5
! move %o5(upper) -> %o4(lower)
srlx %o5, 32, %l7
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P3352: !BST [2] (maybe <- 0x42800091) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3353: !ST [14] (maybe <- 0x3000012) (Int) (LE) (CBR)
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

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3353
nop
RET3353:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P3354: !BST [3] (maybe <- 0x42800095) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3355: !BST [12] (maybe <- 0x42800099) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P3356: !CAS [12] (maybe <- 0x3000013) (Int)
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

P3357: !BST [13] (maybe <- 0x4280009a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P3358: !DWST [2] (maybe <- 0x3000014) (Int)
mov %l4, %l3 
stx %l3, [%i0 + 8]
add   %l4, 1, %l4

P3359: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P3360: !BST [1] (maybe <- 0x4280009b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3361: !DWST [0] (maybe <- 0x3000015) (Int)
sllx %l4, 32, %l7 
add   %l4, 1, %l4
or %l7, %l4, %l7
stx %l7, [%i0 + 0]
add   %l4, 1, %l4

P3362: !BST [9] (maybe <- 0x4280009f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P3363: !BST [1] (maybe <- 0x428000a0) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3364: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P3365: !BST [4] (maybe <- 0x428000a4) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P3366: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P3367: !DWST [11] (maybe <- 0x3000017) (Int)
mov %l4, %l7 
sllx %l7, 32, %l7 
stx %l7, [%i2 + 64 ] 
add   %l4, 1, %l4

P3368: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P3369: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P3370: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P3371: !BST [14] (maybe <- 0x428000a5) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P3372: !BST [2] (maybe <- 0x428000a6) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3373: !BST [5] (maybe <- 0x428000aa) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3374: !CASX [5] (maybe <- 0x3000018) (Int)
add %i1, 72, %o5
ldx [%o5], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
mov  %o1, %l7
mov %l4, %o2
casx [%o5], %l7, %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
add  %l4, 1, %l4

P3375: !BST [12] (maybe <- 0x428000ad) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P3376: !BLD [1] (FP)
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

P3377: !BLD [3] (FP)
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

P3378: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P3379: !REPLACEMENT [10] (Int)
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

P3380: !BST [5] (maybe <- 0x428000ae) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
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
be,pt  %xcc, TARGET3380
nop
RET3380:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P3381: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P3382: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P3383: !BST [9] (maybe <- 0x428000b1) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P3384: !DWLD [4] (Int)
ldx [%i0 + 64], %o3
! move %o3(upper) -> %o3(upper)

P3385: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P3386: !DWLD [9] (Int) (Branch target of P3487)
ldx [%i1 + 512], %l7
! move %l7(upper) -> %o3(lower)
srlx %o3, 32, %o3
sllx %o3, 32, %o3
srlx %l7, 32, %l6
or %l6, %o3, %o3
ba P3387
nop

TARGET3487:
ba RET3487
nop


P3387: !BST [5] (maybe <- 0x428000b2) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3388: !BST [4] (maybe <- 0x428000b5) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P3389: !DWST [4] (maybe <- 0x3000019) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i0 + 64 ] 
add   %l4, 1, %l4

P3390: !MEMBAR (Int)
membar #StoreLoad

P3391: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P3392: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P3393: !BST [14] (maybe <- 0x428000b6) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P3394: !REPLACEMENT [14] (Int)
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

P3395: !PREFETCH [12] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i3 + 0] %asi, 1

P3396: !BLD [1] (FP) (Branch target of P3353)
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
ba P3397
nop

TARGET3353:
ba RET3353
nop


P3397: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P3398: !BLD [0] (FP)
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

P3399: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P3400: !PREFETCH [6] (Int) (CBR)
prefetch [%i1 + 80], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3400
nop
RET3400:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P3401: !LD [11] (Int)
lduw [%i2 + 64], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P3402: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P3403: !BST [1] (maybe <- 0x428000b7) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3404: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P3405: !PREFETCH [0] (Int) (Branch target of P3185)
prefetch [%i0 + 0], 1
ba P3406
nop

TARGET3185:
ba RET3185
nop


P3406: !BST [14] (maybe <- 0x428000bb) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P3407: !BLD [0] (FP)
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

P3408: !BST [6] (maybe <- 0x428000bc) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3409: !BST [7] (maybe <- 0x428000bf) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3410: !BST [9] (maybe <- 0x428000c2) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P3411: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P3412: !BST [8] (maybe <- 0x428000c3) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P3413: !BST [6] (maybe <- 0x428000c4) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3414: !BST [0] (maybe <- 0x428000c7) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3415: !BST [12] (maybe <- 0x428000cb) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P3416: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P3417: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P3418: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P3419: !DWLD [11] (Int)
ldx [%i2 + 64], %l6
! move %l6(upper) -> %o4(lower)
srlx %l6, 32, %l3
or %l3, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P3420: !BST [4] (maybe <- 0x428000cc) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P3421: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P3422: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P3423: !PREFETCH [6] (Int) (Branch target of P3334)
prefetch [%i1 + 80], 1
ba P3424
nop

TARGET3334:
ba RET3334
nop


P3424: !BST [12] (maybe <- 0x428000cd) (FP) (CBR)
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
be,pt  %xcc, TARGET3424
nop
RET3424:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P3425: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P3426: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P3427: !BLD [5] (FP)
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

P3428: !MEMBAR (Int)
membar #StoreLoad

P3429: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P3430: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P3431: !BST [13] (maybe <- 0x428000ce) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P3432: !BST [14] (maybe <- 0x428000cf) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P3433: !BST [14] (maybe <- 0x428000d0) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P3434: !ST [10] (maybe <- 0x428000d1) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i2 + 32 ]

P3435: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P3436: !BLD [6] (FP)
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

P3437: !DWLD [3] (Int)
ldx [%i0 + 32], %o0
! move %o0(upper) -> %o0(upper)

P3438: !BST [9] (maybe <- 0x428000d2) (FP) (Branch target of P3320)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 
ba P3439
nop

TARGET3320:
ba RET3320
nop


P3439: !BLD [3] (FP)
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

P3440: !BST [13] (maybe <- 0x428000d3) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P3441: !LD [4] (Int)
lduw [%i0 + 64], %l7
! move %l7(lower) -> %o0(lower)
srlx %o0, 32, %o0
sllx %o0, 32, %o0
or %l7, %o0, %o0

P3442: !REPLACEMENT [9] (Int)
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

P3443: !BST [15] (maybe <- 0x428000d4) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P3444: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P3445: !BLD [3] (FP)
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

P3446: !BST [0] (maybe <- 0x428000d5) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3447: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P3448: !PREFETCH [5] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i1 + 76] %asi, 1

P3449: !ST [9] (maybe <- 0x300001a) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P3450: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f14

P3451: !PREFETCH [3] (Int) (CBR)
prefetch [%i0 + 32], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3451
nop
RET3451:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P3452: !MEMBAR (Int)
membar #StoreLoad

P3453: !BLD [2] (FP)
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

P3454: !BLD [2] (FP)
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

P3455: !BST [3] (maybe <- 0x428000d9) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3456: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P3457: !BLD [1] (FP)
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

P3458: !BST [0] (maybe <- 0x428000dd) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3459: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P3460: !REPLACEMENT [15] (Int)
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

P3461: !BST [7] (maybe <- 0x428000e1) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3462: !BST [10] (maybe <- 0x428000e4) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P3463: !LD [2] (Int)
lduw [%i0 + 12], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P3464: !BST [13] (maybe <- 0x428000e5) (FP) (CBR)
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
be,pt  %xcc, TARGET3464
nop
RET3464:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P3465: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P3466: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P3467: !DWLD [12] (Int)
ldx [%i3 + 0], %l7
! move %l7(upper) -> %o1(lower)
srlx %l7, 32, %l6
or %l6, %o1, %o1

P3468: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P3469: !BST [11] (maybe <- 0x428000e6) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P3470: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P3471: !BLD [1] (FP)
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

P3472: !DWST [15] (maybe <- 0x300001b) (Int)
mov %l4, %l7 
sllx %l7, 32, %l7 
stx %l7, [%i3 + 192 ] 
add   %l4, 1, %l4

P3473: !BST [15] (maybe <- 0x428000e7) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P3474: !BST [0] (maybe <- 0x428000e8) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3475: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f36, %f2

P3476: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P3477: !BST [3] (maybe <- 0x428000ec) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3478: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P3479: !BLD [2] (FP)
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

P3480: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P3481: !REPLACEMENT [9] (Int)
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

P3482: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P3483: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P3484: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P3485: !BST [5] (maybe <- 0x428000f0) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3486: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P3487: !BLD [9] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3487
nop
RET3487:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P3488: !BLD [5] (FP)
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

P3489: !BST [10] (maybe <- 0x428000f3) (FP) (Branch target of P3608)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 
ba P3490
nop

TARGET3608:
ba RET3608
nop


P3490: !LD [7] (Int)
lduw [%i1 + 84], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P3491: !PREFETCH [6] (Int) (Branch target of P3451)
prefetch [%i1 + 80], 1
ba P3492
nop

TARGET3451:
ba RET3451
nop


P3492: !PREFETCH [7] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i1 + 84] %asi, 1

P3493: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P3494: !BST [4] (maybe <- 0x428000f4) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P3495: !BST [5] (maybe <- 0x428000f5) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3496: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P3497: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P3498: !BST [12] (maybe <- 0x428000f8) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P3499: !BST [3] (maybe <- 0x428000f9) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3500: !LD [6] (Int)
lduw [%i1 + 80], %o5
! move %o5(lower) -> %o2(lower)
or %o5, %o2, %o2

P3501: !CAS [0] (maybe <- 0x300001c) (Int) (CBR)
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

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3501
nop
RET3501:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P3502: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P3503: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P3504: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P3505: !DWLD [0] (Int)
ldx [%i0 + 0], %o4
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P3506: !BLD [3] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f0
membar #Sync 
! 4 addresses covered
fmovs %f3, %f2
fmovs %f8, %f3

P3507: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P3508: !CASX [14] (maybe <- 0x300001d) (Int)
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

P3509: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P3510: !BST [8] (maybe <- 0x428000fd) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P3511: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P3512: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P3513: !DWLD [0] (Int) (LE) (Branch target of P3521)
wr %g0, 0x88, %asi
ldxa [%i0 + 0] %asi, %o5
! move %o5(lower) -> %o2(upper)
sllx %o5, 32, %o2
! move %o5(upper) -> %o2(lower)
srlx %o5, 32, %l7
or %l7, %o2, %o2
ba P3514
nop

TARGET3521:
ba RET3521
nop


P3514: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f5
fmovd %f36, %f6

P3515: !BST [6] (maybe <- 0x428000fe) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3516: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P3517: !DWST [6] (maybe <- 0x300001e) (Int) (LE)
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

P3518: !SWAP [2] (maybe <- 0x3000020) (Int)
mov %l4, %o3
swap  [%i0 + 12], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P3519: !LD [12] (Int)
lduw [%i3 + 0], %l7
! move %l7(lower) -> %o3(lower)
or %l7, %o3, %o3

P3520: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P3521: !ST [9] (maybe <- 0x3000021) (Int) (CBR)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3521
nop
RET3521:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P3522: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P3523: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f11
fmovd %f36, %f12

P3524: !LD [2] (Int)
lduw [%i0 + 12], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P3525: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P3526: !REPLACEMENT [10] (Int)
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

P3527: !LD [2] (FP)
ld [%i0 + 12], %f15
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

P3528: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f0
membar #Sync 
! 3 addresses covered
fmovs %f3, %f0
fmovs %f4, %f1
fmovs %f5, %f2

P3529: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P3530: !LD [7] (Int)
lduw [%i1 + 84], %l6
! move %l6(lower) -> %o4(lower)
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P3531: !ST [10] (maybe <- 0x3000022) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P3532: !BST [0] (maybe <- 0x42800101) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3533: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P3534: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P3535: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P3536: !BLD [3] (FP)
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

P3537: !ST [11] (maybe <- 0x3000023) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P3538: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P3539: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P3540: !BST [11] (maybe <- 0x42800105) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P3541: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P3542: !BST [11] (maybe <- 0x42800106) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P3543: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f9
fmovd %f36, %f10

P3544: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P3545: !CASX [6] (maybe <- 0x3000024) (Int)
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

P3546: !BST [1] (maybe <- 0x42800107) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3547: !CASX [9] (maybe <- 0x3000026) (Int)
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

P3548: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P3549: !DWLD [11] (Int)
ldx [%i2 + 64], %o4
! move %o4(upper) -> %o4(upper)

P3550: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P3551: !DWST [0] (maybe <- 0x4280010b) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=21 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
std %f20, [%i0 + 0]

P3552: !BLD [1] (FP)
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

P3553: !BLD [3] (FP)
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

P3554: !BST [15] (maybe <- 0x4280010d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P3555: !BST [10] (maybe <- 0x4280010e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P3556: !BST [15] (maybe <- 0x4280010f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P3557: !PREFETCH [5] (Int) (Branch target of P3103)
prefetch [%i1 + 76], 1
ba P3558
nop

TARGET3103:
ba RET3103
nop


P3558: !LD [0] (Int)
lduw [%i0 + 0], %o5
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

P3559: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P3560: !ST [14] (maybe <- 0x3000027) (Int)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

P3561: !BLD [0] (FP)
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

P3562: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P3563: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P3564: !BST [13] (maybe <- 0x42800110) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P3565: !BST [15] (maybe <- 0x42800111) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P3566: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P3567: !BST [0] (maybe <- 0x42800112) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3568: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P3569: !CAS [11] (maybe <- 0x3000028) (Int) (Branch target of P3127)
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
ba P3570
nop

TARGET3127:
ba RET3127
nop


P3570: !CAS [0] (maybe <- 0x3000029) (Int)
add %i0, 0, %l6
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

P3571: !BST [14] (maybe <- 0x42800116) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P3572: !BLD [1] (FP)
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

P3573: !BST [2] (maybe <- 0x42800117) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3574: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P3575: !MEMBAR (Int)
membar #StoreLoad

P3576: !BST [15] (maybe <- 0x4280011b) (FP) (Branch target of P3234)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 
ba P3577
nop

TARGET3234:
ba RET3234
nop


P3577: !NOP (Int)
nop

P3578: !BLD [2] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f0
membar #Sync 
! 4 addresses covered
fmovs %f3, %f2
fmovs %f8, %f3

P3579: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P3580: !BST [15] (maybe <- 0x4280011c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P3581: !BST [5] (maybe <- 0x4280011d) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
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
be,pn  %xcc, TARGET3581
nop
RET3581:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P3582: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P3583: !LD [6] (Int)
lduw [%i1 + 80], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P3584: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P3585: !DWLD [3] (Int)
ldx [%i0 + 32], %o5
! move %o5(upper) -> %o2(lower)
srlx %o5, 32, %l7
or %l7, %o2, %o2

P3586: !BST [4] (maybe <- 0x42800120) (FP) (Branch target of P3298)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 
ba P3587
nop

TARGET3298:
ba RET3298
nop


P3587: !BLD [3] (FP)
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

P3588: !BLD [2] (FP)
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

P3589: !BST [13] (maybe <- 0x42800121) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P3590: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P3591: !ST [12] (maybe <- 0x300002a) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P3592: !BST [7] (maybe <- 0x42800122) (FP) (Branch target of P3313)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 
ba P3593
nop

TARGET3313:
ba RET3313
nop


P3593: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P3594: !BLD [7] (FP) (Branch target of P3424)
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
ba P3595
nop

TARGET3424:
ba RET3424
nop


P3595: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P3596: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P3597: !BLD [6] (FP) (CBR)
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
be,pt  %xcc, TARGET3597
nop
RET3597:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P3598: !CASX [11] (maybe <- 0x300002b) (Int)
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

P3599: !BLD [3] (FP)
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

P3600: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P3601: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P3602: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P3603: !MEMBAR (Int)
membar #StoreLoad

P3604: !LD [0] (Int)
lduw [%i0 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P3605: !LD [1] (Int)
lduw [%i0 + 4], %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0

P3606: !LD [2] (Int)
lduw [%i0 + 12], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P3607: !LD [3] (Int)
lduw [%i0 + 32], %l3
! move %l3(lower) -> %o1(lower)
or %l3, %o1, %o1

P3608: !LD [4] (FP) (CBR)
ld [%i0 + 64], %f10
! 1 addresses covered

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3608
nop
RET3608:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P3609: !LD [5] (Int)
lduw [%i1 + 76], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P3610: !LD [6] (Int)
lduw [%i1 + 80], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2

P3611: !LD [7] (Int)
lduw [%i1 + 84], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P3612: !LD [8] (Int)
lduw [%i1 + 256], %l6
! move %l6(lower) -> %o3(lower)
or %l6, %o3, %o3

P3613: !LD [9] (Int)
lduw [%i1 + 512], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P3614: !LD [10] (FP)
ld [%i2 + 32], %f11
! 1 addresses covered

P3615: !LD [11] (Int)
lduw [%i2 + 64], %l6
! move %l6(lower) -> %o4(lower)
or %l6, %o4, %o4
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
lduw [%i3 + 64], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

P3618: !LD [14] (Int)
lduw [%i3 + 128], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P3619: !LD [15] (Int) (LE)
wr %g0, 0x88, %asi
lduwa [%i3 + 192] %asi, %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1

END_NODES6: ! Test istream for CPU 6 ends
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

! Initialize LFSR to 0x4d55^4
sethi %hi(0x4d55), %l0
or    %l0, %lo(0x4d55), %l0
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

P3620: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P3621: !BLD [0] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f0
membar #Sync 
! 4 addresses covered
fmovs %f3, %f2
fmovs %f8, %f3

P3622: !DWST [6] (maybe <- 0x3800001) (Int)
sllx %l4, 32, %l6 
add   %l4, 1, %l4
or %l6, %l4, %l6
stx %l6, [%i1 + 80]
add   %l4, 1, %l4

P3623: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P3624: !BLD [5] (FP)
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

P3625: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P3626: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P3627: !BST [4] (maybe <- 0x43000001) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P3628: !BST [5] (maybe <- 0x43000002) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3629: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P3630: !BST [15] (maybe <- 0x43000005) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P3631: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P3632: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P3633: !BST [7] (maybe <- 0x43000006) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3634: !BST [2] (maybe <- 0x43000009) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3635: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P3636: !BLD [2] (FP)
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

P3637: !BLD [7] (FP)
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

P3638: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f0
membar #Sync 
! 1 addresses covered

P3639: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f36, %f2

P3640: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P3641: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P3642: !BLD [1] (FP)
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

P3643: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P3644: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P3645: !CAS [5] (maybe <- 0x3800003) (Int) (Branch target of P4009)
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
ba P3646
nop

TARGET4009:
ba RET4009
nop


P3646: !BLD [15] (FP) (Branch target of P3677)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12
ba P3647
nop

TARGET3677:
ba RET3677
nop


P3647: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P3648: !BLD [7] (FP)
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

P3649: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f0
membar #Sync 
! 3 addresses covered
fmovs %f3, %f0
fmovs %f4, %f1
fmovs %f5, %f2

P3650: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P3651: !BST [7] (maybe <- 0x4300000d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3652: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P3653: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P3654: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P3655: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P3656: !BST [9] (maybe <- 0x43000010) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P3657: !BLD [7] (FP)
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

P3658: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P3659: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P3660: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P3661: !BLD [2] (FP)
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

P3662: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P3663: !BST [1] (maybe <- 0x43000011) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3664: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P3665: !BLD [3] (FP)
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

P3666: !BST [4] (maybe <- 0x43000015) (FP) (Branch target of P3906)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 
ba P3667
nop

TARGET3906:
ba RET3906
nop


P3667: !ST [4] (maybe <- 0x3800004) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P3668: !BST [7] (maybe <- 0x43000016) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3669: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P3670: !BST [2] (maybe <- 0x43000019) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3671: !BST [13] (maybe <- 0x4300001d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P3672: !BST [14] (maybe <- 0x4300001e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P3673: !CAS [2] (maybe <- 0x3800005) (Int) (CBR)
add %i0, 12, %o5
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

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3673
nop
RET3673:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P3674: !BST [7] (maybe <- 0x4300001f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3675: !CAS [8] (maybe <- 0x3800006) (Int)
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

P3676: !BLD [5] (FP)
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

P3677: !ST [14] (maybe <- 0x3800007) (Int) (CBR)
stw   %l4, [%i3 + 128 ]
add   %l4, 1, %l4

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


P3678: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f7
fmovd %f36, %f8

P3679: !DWLD [12] (Int)
ldx [%i3 + 0], %o3
! move %o3(upper) -> %o3(upper)

P3680: !BST [15] (maybe <- 0x43000022) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P3681: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P3682: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P3683: !BST [5] (maybe <- 0x43000023) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3684: !BST [9] (maybe <- 0x43000026) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P3685: !REPLACEMENT [10] (Int)
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

P3686: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P3687: !ST [9] (maybe <- 0x3800008) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P3688: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P3689: !BST [6] (maybe <- 0x43000027) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3690: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f10

P3691: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P3692: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P3693: !NOP (Int)
nop

P3694: !BST [4] (maybe <- 0x4300002a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P3695: !ST [3] (maybe <- 0x3800009) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P3696: !PREFETCH [5] (Int) (CBR)
prefetch [%i1 + 76], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3696
nop
RET3696:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P3697: !BLD [1] (FP)
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

P3698: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P3699: !BST [11] (maybe <- 0x4300002b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P3700: !BST [13] (maybe <- 0x4300002c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P3701: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f0
membar #Sync 
! 1 addresses covered

P3702: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P3703: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P3704: !BLD [13] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3704
nop
RET3704:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P3705: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P3706: !ST [1] (maybe <- 0x380000a) (Int) (CBR)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3706
nop
RET3706:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P3707: !ST [0] (maybe <- 0x380000b) (Int) (CBR)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3707
nop
RET3707:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P3708: !REPLACEMENT [3] (Int)
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

P3709: !BST [8] (maybe <- 0x4300002d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P3710: !PREFETCH [3] (Int) (Branch target of P3704)
prefetch [%i0 + 32], 1
ba P3711
nop

TARGET3704:
ba RET3704
nop


P3711: !BST [7] (maybe <- 0x4300002e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3712: !BST [6] (maybe <- 0x43000031) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3713: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P3714: !BLD [2] (FP) (Branch target of P3818)
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
ba P3715
nop

TARGET3818:
ba RET3818
nop


P3715: !BST [0] (maybe <- 0x43000034) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3716: !BLD [1] (FP)
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

P3717: !BST [2] (maybe <- 0x43000038) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3718: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P3719: !BLD [1] (FP)
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

P3720: !BST [8] (maybe <- 0x4300003c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P3721: !BST [6] (maybe <- 0x4300003d) (FP) (Branch target of P3968)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 
ba P3722
nop

TARGET3968:
ba RET3968
nop


P3722: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P3723: !BLD [13] (FP)
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

P3724: !BST [12] (maybe <- 0x43000040) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P3725: !BST [7] (maybe <- 0x43000041) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3726: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f0
membar #Sync 
! 3 addresses covered
fmovs %f3, %f0
fmovs %f4, %f1
fmovs %f5, %f2

P3727: !BST [12] (maybe <- 0x43000044) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P3728: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P3729: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P3730: !BST [1] (maybe <- 0x43000045) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3731: !BST [10] (maybe <- 0x43000049) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P3732: !PREFETCH [4] (Int) (Branch target of P3970)
prefetch [%i0 + 64], 1
ba P3733
nop

TARGET3970:
ba RET3970
nop


P3733: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P3734: !BST [13] (maybe <- 0x4300004a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P3735: !BST [5] (maybe <- 0x4300004b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3736: !BST [4] (maybe <- 0x4300004e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P3737: !BST [5] (maybe <- 0x4300004f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3738: !BST [6] (maybe <- 0x43000052) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3739: !BLD [1] (FP)
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

P3740: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P3741: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P3742: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P3743: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P3744: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P3745: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P3746: !BST [11] (maybe <- 0x43000055) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P3747: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P3748: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P3749: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P3750: !BST [4] (maybe <- 0x43000056) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P3751: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f9
fmovd %f36, %f10

P3752: !DWLD [5] (Int)
ldx [%i1 + 72], %l6
! move %l6(lower) -> %o3(lower)
srlx %o3, 32, %o3
sllx %o3, 32, %o3
srl %l6, 0, %l3
or %l3, %o3, %o3

P3753: !DWST [4] (maybe <- 0x380000c) (Int)
mov %l4, %l7 
sllx %l7, 32, %l7 
stx %l7, [%i0 + 64 ] 
add   %l4, 1, %l4

P3754: !REPLACEMENT [12] (Int)
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

P3755: !DWST [5] (maybe <- 0x380000d) (Int) (Branch target of P3936)
mov %l4, %l3 
stx %l3, [%i1 + 72]
add   %l4, 1, %l4
ba P3756
nop

TARGET3936:
ba RET3936
nop


P3756: !REPLACEMENT [0] (Int)
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

P3757: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P3758: !BST [5] (maybe <- 0x43000057) (FP) (Branch target of P3892)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 
ba P3759
nop

TARGET3892:
ba RET3892
nop


P3759: !BST [3] (maybe <- 0x4300005a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3760: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P3761: !BST [7] (maybe <- 0x4300005e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3762: !BLD [0] (FP)
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

P3763: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P3764: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P3765: !BLD [3] (FP)
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

P3766: !BST [11] (maybe <- 0x43000061) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P3767: !DWST [0] (maybe <- 0x43000062) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=21 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
std %f20, [%i0 + 0]

P3768: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P3769: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P3770: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P3771: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P3772: !BST [10] (maybe <- 0x43000064) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P3773: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P3774: !BST [15] (maybe <- 0x43000065) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P3775: !BST [0] (maybe <- 0x43000066) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3776: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P3777: !CASX [11] (maybe <- 0x380000e) (Int)
add %i2, 64, %o5
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

P3778: !BST [3] (maybe <- 0x4300006a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3779: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P3780: !BST [8] (maybe <- 0x4300006e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P3781: !BST [0] (maybe <- 0x4300006f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3782: !BST [6] (maybe <- 0x43000073) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3783: !BST [0] (maybe <- 0x43000076) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3784: !CASX [7] (maybe <- 0x380000f) (Int) (Branch target of P3965)
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
ba P3785
nop

TARGET3965:
ba RET3965
nop


P3785: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P3786: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P3787: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f10

P3788: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P3789: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P3790: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P3791: !ST [5] (maybe <- 0x3800011) (Int) (Branch target of P3985)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4
ba P3792
nop

TARGET3985:
ba RET3985
nop


P3792: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P3793: !BLD [7] (FP)
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

P3794: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P3795: !BST [12] (maybe <- 0x4300007a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P3796: !BST [4] (maybe <- 0x4300007b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P3797: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f0
membar #Sync 
! 1 addresses covered

P3798: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P3799: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f36, %f2

P3800: !BST [11] (maybe <- 0x4300007c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P3801: !BST [14] (maybe <- 0x4300007d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P3802: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P3803: !PREFETCH [15] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i3 + 192] %asi, 1

P3804: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P3805: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P3806: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P3807: !BLD [0] (FP)
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

P3808: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P3809: !BLD [1] (FP) (Branch target of P3922)
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
ba P3810
nop

TARGET3922:
ba RET3922
nop


P3810: !BLD [2] (FP)
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

P3811: !CASX [11] (maybe <- 0x3800012) (Int)
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

P3812: !BST [1] (maybe <- 0x4300007e) (FP) (Branch target of P3870)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 
ba P3813
nop

TARGET3870:
ba RET3870
nop


P3813: !BST [0] (maybe <- 0x43000082) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3814: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P3815: !BST [3] (maybe <- 0x43000086) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3816: !BST [9] (maybe <- 0x4300008a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P3817: !DWLD [2] (Int)
ldx [%i0 + 8], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P3818: !BLD [13] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3818
nop
RET3818:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P3819: !BST [2] (maybe <- 0x4300008b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3820: !BST [14] (maybe <- 0x4300008f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 128 ] %asi
membar #Sync 

P3821: !BST [7] (maybe <- 0x43000090) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3822: !BST [3] (maybe <- 0x43000093) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3823: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f5
fmovd %f36, %f6

P3824: !BST [2] (maybe <- 0x43000097) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3825: !BST [7] (maybe <- 0x4300009b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3826: !DWST [15] (maybe <- 0x3800013) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 192 ] 
add   %l4, 1, %l4

P3827: !BST [11] (maybe <- 0x4300009e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P3828: !BLD [2] (FP)
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

P3829: !ST [3] (maybe <- 0x3800014) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P3830: !BST [3] (maybe <- 0x4300009f) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3831: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P3832: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P3833: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P3834: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f13

P3835: !BLD [7] (FP)
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

P3836: !BST [3] (maybe <- 0x430000a3) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3837: !CASX [11] (maybe <- 0x3800015) (Int)
add %i2, 64, %l6
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

P3838: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P3839: !DWST [1] (maybe <- 0x3800016) (Int)
sllx %l4, 32, %l3 
add   %l4, 1, %l4
or %l3, %l4, %l3
stx %l3, [%i0 + 0]
add   %l4, 1, %l4

P3840: !BST [15] (maybe <- 0x430000a7) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P3841: !BST [5] (maybe <- 0x430000a8) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3842: !BST [12] (maybe <- 0x430000ab) (FP) (Branch target of P4097)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 
ba P3843
nop

TARGET4097:
ba RET4097
nop


P3843: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P3844: !ST [2] (maybe <- 0x3800018) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P3845: !BST [2] (maybe <- 0x430000ac) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3846: !BST [10] (maybe <- 0x430000b0) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P3847: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P3848: !REPLACEMENT [12] (Int)
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

P3849: !BST [7] (maybe <- 0x430000b1) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3850: !BST [6] (maybe <- 0x430000b4) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3851: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P3852: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P3853: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f3

P3854: !BST [2] (maybe <- 0x430000b7) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3855: !CAS [0] (maybe <- 0x3800019) (Int) (LE)
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
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2
mov %o5, %o3
casa [%l7] %asi, %l6, %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P3856: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P3857: !BLD [7] (FP) (Branch target of P3696)
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
ba P3858
nop

TARGET3696:
ba RET3696
nop


P3858: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P3859: !LD [9] (Int)
lduw [%i1 + 512], %l7
! move %l7(lower) -> %o3(lower)
or %l7, %o3, %o3

P3860: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P3861: !DWLD [7] (Int)
ldx [%i1 + 80], %o4
! move %o4(upper) -> %o4(upper)
! move %o4(lower) -> %o4(lower)
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P3862: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P3863: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P3864: !BST [0] (maybe <- 0x430000bb) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3865: !BST [11] (maybe <- 0x430000bf) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P3866: !BST [7] (maybe <- 0x430000c0) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3867: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P3868: !BLD [1] (FP)
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

P3869: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P3870: !BLD [6] (FP) (CBR)
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
be,pn  %xcc, TARGET3870
nop
RET3870:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P3871: !BST [0] (maybe <- 0x430000c3) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3872: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f0
membar #Sync 
! 1 addresses covered

P3873: !BST [1] (maybe <- 0x430000c7) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3874: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P3875: !BST [9] (maybe <- 0x430000cb) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P3876: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P3877: !BST [13] (maybe <- 0x430000cc) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P3878: !BST [4] (maybe <- 0x430000cd) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P3879: !BLD [7] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f36, %f2

P3880: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P3881: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P3882: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P3883: !PREFETCH [15] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i3 + 192] %asi, 1

P3884: !BLD [0] (FP)
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

P3885: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f8

P3886: !BST [6] (maybe <- 0x430000ce) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3887: !BLD [8] (FP) (Branch target of P3673)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9
ba P3888
nop

TARGET3673:
ba RET3673
nop


P3888: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P3889: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P3890: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P3891: !BLD [2] (FP)
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

P3892: !LD [2] (Int) (CBR)
lduw [%i0 + 12], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3892
nop
RET3892:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P3893: !LD [8] (Int)
lduw [%i1 + 256], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

P3894: !BLD [10] (FP)
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

P3895: !BST [10] (maybe <- 0x430000d1) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P3896: !DWST [2] (maybe <- 0x380001a) (Int)
mov %l4, %l6 
stx %l6, [%i0 + 8]
add   %l4, 1, %l4

P3897: !BST [4] (maybe <- 0x430000d2) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P3898: !DWST [9] (maybe <- 0x380001b) (Int)
mov %l4, %o5 
sllx %o5, 32, %o5 
stx %o5, [%i1 + 512 ] 
add   %l4, 1, %l4

P3899: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P3900: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P3901: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f0
membar #Sync 
! 1 addresses covered

P3902: !BST [8] (maybe <- 0x430000d3) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P3903: !BLD [0] (FP)
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

P3904: !BST [4] (maybe <- 0x430000d4) (FP) (CBR)
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
be,pn  %xcc, TARGET3904
nop
RET3904:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P3905: !BST [13] (maybe <- 0x430000d5) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P3906: !PREFETCH [8] (Int) (CBR)
prefetch [%i1 + 256], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3906
nop
RET3906:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P3907: !ST [7] (maybe <- 0x380001c) (Int)
stw   %l4, [%i1 + 84 ]
add   %l4, 1, %l4

P3908: !BLD [1] (FP)
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

P3909: !CASX [11] (maybe <- 0x380001d) (Int)
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

P3910: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P3911: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P3912: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f10

P3913: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P3914: !CASX [7] (maybe <- 0x380001e) (Int)
add %i1, 80, %l6
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

P3915: !BST [1] (maybe <- 0x430000d6) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3916: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P3917: !BST [12] (maybe <- 0x430000da) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 0 ] %asi
membar #Sync 

P3918: !REPLACEMENT [4] (Int)
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

P3919: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P3920: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P3921: !BST [4] (maybe <- 0x430000db) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P3922: !PREFETCH [10] (Int) (CBR)
prefetch [%i2 + 32], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3922
nop
RET3922:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P3923: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P3924: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P3925: !BST [11] (maybe <- 0x430000dc) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P3926: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f11

P3927: !CAS [15] (maybe <- 0x3800020) (Int)
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

P3928: !MEMBAR (Int)
membar #StoreLoad

P3929: !CAS [12] (maybe <- 0x3800021) (Int)
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

P3930: !DWLD [8] (Int)
ldx [%i1 + 256], %o2
! move %o2(upper) -> %o2(upper)

P3931: !BST [8] (maybe <- 0x430000dd) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P3932: !LD [3] (Int)
lduw [%i0 + 32], %l7
! move %l7(lower) -> %o2(lower)
srlx %o2, 32, %o2
sllx %o2, 32, %o2
or %l7, %o2, %o2

P3933: !DWST [6] (maybe <- 0x3800022) (Int)
sllx %l4, 32, %o5 
add   %l4, 1, %l4
or %o5, %l4, %o5
stx %o5, [%i1 + 80]
add   %l4, 1, %l4

P3934: !LD [10] (FP)
ld [%i2 + 32], %f12
! 1 addresses covered

P3935: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P3936: !BST [5] (maybe <- 0x430000de) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
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
be,pt  %xcc, TARGET3936
nop
RET3936:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P3937: !BLD [2] (FP)
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

P3938: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P3939: !BST [10] (maybe <- 0x430000e1) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P3940: !PREFETCH [13] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i3 + 64] %asi, 1

P3941: !ST [13] (maybe <- 0x3800024) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P3942: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P3943: !BST [11] (maybe <- 0x430000e2) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P3944: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f1
fmovd %f36, %f2

P3945: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f4

P3946: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P3947: !DWLD [10] (Int) (Branch target of P3904)
ldx [%i2 + 32], %o3
! move %o3(upper) -> %o3(upper)
ba P3948
nop

TARGET3904:
ba RET3904
nop


P3948: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P3949: !BST [4] (maybe <- 0x430000e3) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P3950: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P3951: !BLD [2] (FP)
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

P3952: !BLD [0] (FP)
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

P3953: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P3954: !CASX [11] (maybe <- 0x3800025) (Int)
add %i2, 64, %l6
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

P3955: !BLD [14] (FP)
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

P3956: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f0
membar #Sync 
! 1 addresses covered

P3957: !LD [3] (Int)
lduw [%i0 + 32], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

P3958: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P3959: !BST [11] (maybe <- 0x430000e4) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P3960: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P3961: !BLD [0] (FP)
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

P3962: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P3963: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P3964: !DWLD [1] (Int)
ldx [%i0 + 0], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)

P3965: !BST [10] (maybe <- 0x430000e5) (FP) (CBR)
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
be,pn  %xcc, TARGET3965
nop
RET3965:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P3966: !BST [10] (maybe <- 0x430000e6) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P3967: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P3968: !PREFETCH [3] (Int) (CBR)
prefetch [%i0 + 32], 1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET3968
nop
RET3968:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P3969: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f5

P3970: !BST [1] (maybe <- 0x430000e7) (FP) (CBR)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
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
be,pt  %xcc, TARGET3970
nop
RET3970:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P3971: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P3972: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P3973: !CAS [12] (maybe <- 0x3800026) (Int)
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

P3974: !BLD [4] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P3975: !DWST [14] (maybe <- 0x3800027) (Int)
mov %l4, %o5 
sllx %o5, 32, %o5 
stx %o5, [%i3 + 128 ] 
add   %l4, 1, %l4

P3976: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f7

P3977: !BST [9] (maybe <- 0x430000eb) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P3978: !BST [10] (maybe <- 0x430000ec) (FP) (Branch target of P3980)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 
ba P3979
nop

TARGET3980:
ba RET3980
nop


P3979: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P3980: !BLD [9] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3980
nop
RET3980:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P3981: !DWLD [6] (FP)
ldd [%i1 + 80], %f18
! 2 addresses covered
fmovs %f18, %f9
fmovs %f19, %f10

P3982: !BST [5] (maybe <- 0x430000ed) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3983: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P3984: !BST [7] (maybe <- 0x430000f0) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3985: !REPLACEMENT [10] (Int) (CBR)
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

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET3985
nop
RET3985:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P3986: !BLD [0] (FP)
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

P3987: !SWAP [12] (maybe <- 0x3800028) (Int)
mov %l4, %o3
swap  [%i3 + 0], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3
add   %l4, 1, %l4

P3988: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P3989: !PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P3990: !BST [11] (maybe <- 0x430000f3) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P3991: !BLD [15] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 192] %asi, %f0
membar #Sync 
! 1 addresses covered

P3992: !BST [7] (maybe <- 0x430000f4) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P3993: !BST [2] (maybe <- 0x430000f7) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3994: !MEMBAR (Int)
membar #StoreLoad

P3995: !BST [11] (maybe <- 0x430000fb) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P3996: !BLD [0] (FP)
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

P3997: !BST [0] (maybe <- 0x430000fc) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P3998: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P3999: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P4000: !BST [11] (maybe <- 0x43000100) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P4001: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P4002: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f5

P4003: !BLD [3] (FP)
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

P4004: !BST [3] (maybe <- 0x43000101) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P4005: !BST [10] (maybe <- 0x43000105) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=40 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i2 + 0 ] %asi
membar #Sync 

P4006: !PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P4007: !SWAP [12] (maybe <- 0x3800029) (Int)
mov %l4, %l3
swap  [%i3 + 0], %l3
! move %l3(lower) -> %o3(lower)
srl %l3, 0, %l7
or %l7, %o3, %o3
add   %l4, 1, %l4

P4008: !BLD [3] (FP)
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

P4009: !BLD [11] (FP) (CBR)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET4009
nop
RET4009:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P4010: !BLD [8] (FP)
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

P4011: !BST [2] (maybe <- 0x43000106) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P4012: !BLD [1] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i0 + 0] %asi, %f0
membar #Sync 
! 4 addresses covered
fmovs %f3, %f2
fmovs %f8, %f3

P4013: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P4014: !DWST [11] (maybe <- 0x380002a) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i2 + 64 ] 
add   %l4, 1, %l4

P4015: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P4016: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P4017: !BST [4] (maybe <- 0x4300010a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P4018: !BST [11] (maybe <- 0x4300010b) (FP) (Branch target of P3706)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 
ba P4019
nop

TARGET3706:
ba RET3706
nop


P4019: !PREFETCH [1] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i0 + 4] %asi, 1

P4020: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P4021: !DWLD [1] (FP)
ldd [%i0 + 0], %f4
! 2 addresses covered

P4022: !BST [11] (maybe <- 0x4300010c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i2 + 64 ] %asi
membar #Sync 

P4023: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P4024: !REPLACEMENT [3] (Int)
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

P4025: !BST [4] (maybe <- 0x4300010d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P4026: !BST [2] (maybe <- 0x4300010e) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P4027: !BLD [2] (FP)
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

P4028: !REPLACEMENT [6] (Int)
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

P4029: !LD [10] (FP)
ld [%i2 + 32], %f10
! 1 addresses covered

P4030: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f11

P4031: !REPLACEMENT [3] (Int)
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

P4032: !ST [2] (maybe <- 0x43000112) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i0 + 12 ]

P4033: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P4034: !BLD [6] (FP)
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

P4035: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f0
membar #Sync 
! 1 addresses covered
fmovd %f8, %f0

P4036: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P4037: !BST [3] (maybe <- 0x43000113) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P4038: !BLD [9] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 512] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f2

P4039: !BST [0] (maybe <- 0x43000117) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P4040: !BLD [6] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f3
fmovd %f36, %f4

P4041: !BST [1] (maybe <- 0x4300011b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P4042: !DWST [9] (maybe <- 0x4300011f) (FP) (Branch target of P3707)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
std %f20, [%i1 + 512]
ba P4043
nop

TARGET3707:
ba RET3707
nop


P4043: !BST [7] (maybe <- 0x43000120) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P4044: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f6

P4045: !BST [0] (maybe <- 0x43000123) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P4046: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P4047: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f7

P4048: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P4049: !PREFETCH [13] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i3 + 64] %asi, 1

P4050: !ST [5] (maybe <- 0x380002b) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P4051: !BLD [13] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f8

P4052: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P4053: !BLD [12] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f9

P4054: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f10

P4055: !DWST [8] (maybe <- 0x380002c) (Int)
mov %l4, %l3 
sllx %l3, 32, %l3 
stx %l3, [%i1 + 256 ] 
add   %l4, 1, %l4

P4056: !BLD [5] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 64] %asi, %f32
membar #Sync 
! 3 addresses covered
fmovd %f34, %f18
fmovs %f19, %f11
fmovd %f36, %f12

P4057: !ST [10] (maybe <- 0x380002d) (Int)
stw   %l4, [%i2 + 32 ]
add   %l4, 1, %l4

P4058: !PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P4059: !BST [0] (maybe <- 0x43000127) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P4060: !BST [13] (maybe <- 0x4300012b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P4061: !BST [8] (maybe <- 0x4300012c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 256 ] %asi
membar #Sync 

P4062: !LD [11] (Int)
lduw [%i2 + 64], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P4063: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P4064: !BST [7] (maybe <- 0x4300012d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P4065: !BLD [1] (FP)
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

P4066: !PREFETCH [5] (Int)
prefetch [%i1 + 76], 1

P4067: !PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P4068: !BLD [1] (FP)
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

P4069: !BST [5] (maybe <- 0x43000130) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=35 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=36 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=37 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
fmovd %f20, %f36
membar #Sync 
stda %f32, [%i1 + 64 ] %asi
membar #Sync 

P4070: !PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P4071: !DWST [6] (maybe <- 0x380002e) (Int)
sllx %l4, 32, %o5 
add   %l4, 1, %l4
or %o5, %l4, %o5
stx %o5, [%i1 + 80]
add   %l4, 1, %l4

P4072: !BLD [3] (FP)
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

P4073: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f10

P4074: !PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P4075: !BST [4] (maybe <- 0x43000133) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P4076: !DWST [6] (maybe <- 0x3800030) (Int)
sllx %l4, 32, %l6 
add   %l4, 1, %l4
or %l6, %l4, %l6
stx %l6, [%i1 + 80]
add   %l4, 1, %l4

P4077: !BST [13] (maybe <- 0x43000134) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 64 ] %asi
membar #Sync 

P4078: !BLD [10] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 0] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f40, %f18
fmovs %f18, %f11

P4079: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P4080: !PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P4081: !DWST [7] (maybe <- 0x3800032) (Int)
sllx %l4, 32, %o5 
add   %l4, 1, %l4
or %o5, %l4, %o5
stx %o5, [%i1 + 80]
add   %l4, 1, %l4

P4082: !BLD [11] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i2 + 64] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f12

P4083: !PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P4084: !BST [1] (maybe <- 0x43000135) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P4085: !PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P4086: !BLD [0] (FP)
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

P4087: !BLD [14] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i3 + 128] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f18
fmovs %f18, %f1

P4088: !BLD [0] (FP)
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

P4089: !BST [15] (maybe <- 0x43000139) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i3 + 192 ] %asi
membar #Sync 

P4090: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P4091: !ST [2] (maybe <- 0x3800034) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P4092: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P4093: !BLD [2] (FP)
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

P4094: !CASX [7] (maybe <- 0x3800035) (Int)
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

P4095: !BST [9] (maybe <- 0x4300013a) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P4096: !BLD [3] (FP)
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

P4097: !ST [6] (maybe <- 0x3800037) (Int) (CBR)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET4097
nop
RET4097:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P4098: !PREFETCH [0] (Int)
prefetch [%i0 + 0], 1

P4099: !PREFETCH [13] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i3 + 64] %asi, 1

P4100: !CASX [10] (maybe <- 0x3800038) (Int)
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

P4101: !REPLACEMENT [5] (Int)
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

P4102: !BLD [8] (FP)
wr %g0, 0xf0, %asi
membar #Sync 
ldda [%i1 + 256] %asi, %f32
membar #Sync 
! 1 addresses covered
fmovd %f32, %f14

P4103: !BST [4] (maybe <- 0x4300013b) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i0 + 64 ] %asi
membar #Sync 

P4104: !PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P4105: !REPLACEMENT [6] (Int)
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

P4106: !BST [9] (maybe <- 0x4300013c) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f32
membar #Sync 
stda %f32, [%i1 + 512 ] %asi
membar #Sync 

P4107: !PREFETCH [6] (Int) (LE)
wr %g0, 0x88, %asi
prefetcha [%i1 + 80] %asi, 1

P4108: !PREFETCH [6] (Int)
prefetch [%i1 + 80], 1

P4109: !PREFETCH [7] (Int)
prefetch [%i1 + 84], 1

P4110: !LD [7] (Int)
lduw [%i1 + 84], %o5
! move %o5(lower) -> %o3(lower)
or %o5, %o3, %o3

P4111: !BST [0] (maybe <- 0x4300013d) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P4112: !PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P4113: !PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P4114: !CASX [6] (maybe <- 0x3800039) (Int) (LE)
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
! move %l7(lower) -> %o4(upper)
sllx %l7, 32, %o4
! move %l7(upper) -> %o4(lower)
srlx %l7, 32, %o5
or %o5, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5
mov %l7, %o5
mov  %l6, %l7
casxa [%l3] %asi, %o5, %l7
! move %l7(lower) -> %o0(upper)
sllx %l7, 32, %o0
! move %l7(upper) -> %o0(lower)
srlx %l7, 32, %l3
or %l3, %o0, %o0
add  %l4, 1, %l4

P4115: !DWLD [1] (Int)
ldx [%i0 + 0], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)

P4116: !BLD [2] (FP)
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

P4117: !DWLD [12] (Int)
ldx [%i3 + 0], %o2
! move %o2(upper) -> %o2(upper)

P4118: !BST [2] (maybe <- 0x43000141) (FP)
wr %g0, 0xf0, %asi
! 0 th moved, current_fp_src=32 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=33 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 2 th moved, current_fp_src=35 
fmovd %f20, %f32
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
! 3 th moved, current_fp_src=40 
fmovd %f20, %f34
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
fmovd %f20, %f40
membar #Sync 
stda %f32, [%i0 + 0 ] %asi
membar #Sync 

P4119: !REPLACEMENT [9] (Int)
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

P4120: !MEMBAR (Int)
membar #StoreLoad

P4121: !LD [0] (FP)
ld [%i0 + 0], %f3
! 1 addresses covered

P4122: !LD [1] (Int)
lduw [%i0 + 4], %l7
! move %l7(lower) -> %o2(lower)
srlx %o2, 32, %o2
sllx %o2, 32, %o2
or %l7, %o2, %o2

P4123: !LD [2] (Int)
lduw [%i0 + 12], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P4124: !LD [3] (Int)
lduw [%i0 + 32], %l7
! move %l7(lower) -> %o3(lower)
or %l7, %o3, %o3

P4125: !LD [4] (Int)
lduw [%i0 + 64], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P4126: !LD [5] (Int)
lduw [%i1 + 76], %l7
! move %l7(lower) -> %o4(lower)
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P4127: !LD [6] (Int)
lduw [%i1 + 80], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P4128: !LD [7] (Int)
lduw [%i1 + 84], %l7
! move %l7(lower) -> %o0(lower)
or %l7, %o0, %o0

P4129: !LD [8] (Int)
lduw [%i1 + 256], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P4130: !LD [9] (Int)
lduw [%i1 + 512], %l7
! move %l7(lower) -> %o1(lower)
or %l7, %o1, %o1

P4131: !LD [10] (Int)
lduw [%i2 + 32], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P4132: !LD [11] (Int)
lduw [%i2 + 64], %l7
! move %l7(lower) -> %o2(lower)
or %l7, %o2, %o2

P4133: !LD [12] (FP)
ld [%i3 + 0], %f4
! 1 addresses covered

P4134: !LD [13] (Int)
lduw [%i3 + 64], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P4135: !LD [14] (FP)
ld [%i3 + 128], %f5
! 1 addresses covered

P4136: !LD [15] (Int)
lduw [%i3 + 192], %l7
! move %l7(lower) -> %o3(lower)
or %l7, %o3, %o3

END_NODES7: ! Test istream for CPU 7 ends
sethi %hi(0xdead0e0f), %o5
or    %o5, %lo(0xdead0e0f), %o5
! move %o5(lower) -> %o4(upper)
sllx %o5, 32, %o4
stw %o5, [%i5] 
ld [%i5], %f6
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

restore
retl
nop

