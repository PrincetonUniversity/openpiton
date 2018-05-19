// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tsotool_diag14_int.s
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
! GEN.N_INSTR_PER_PROC 100
! GEN.AVG_LOOP_SIZE 512
! GEN.AVG_LOOP_ITER 10
! ADMAP.REGION_SIZE 64
! ADMAP.REGION_OFFSETS 0-4-12-32-64,76-80-84-256-512,32-64,0-64-128-192
! ADMAP.ATTRIBUTES CV=0111,CP=1111 0x1
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
! WT.INTERRUPT 500
! WT.LD 10
! WT.BLD 0
! WT.DWLD 10
! WT.QWLD 0
! WT.AQLD 0
! WT.ST 10
! WT.BST 0
! WT.BSTC 0
! WT.DWST 10
! WT.QWST 0
! WT.SWAP 0
! WT.CAS 0
! WT.CASX 0
! WT.ASI_L2_FLUSH 0
! WT.FLUSHI 0
! WT.MEMBAR 5
! WT.PREFETCH 10
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
! GEN.SEED 0


#define N_CPUS  8
#define REGION_SIZE_RTL (64 * 1024)
!====#define RESULTS_BUF_SIZE_PER_CPU_RTL 128
#define RESULTS_BUF_SIZE_PER_CPU_RTL 1024
#define PRIVATE_DATA_AREA_PER_CPU_RTL 64

#define ALIGN_PAGE_8K .align 8192
#define ALIGN_PAGE_512K .align 524288
#define ALIGN_PAGE_4M .align 4194304
SECTION .MY_HYP_SEC TEXT_VA = 0x1100150000
attr_text {
        Name=.MY_HYP_SEC,
        hypervisor
	}
.text
.global intr0x60_custom_trap
intr0x60_custom_trap:
	ldxa	[%g0] 0x72, %g2;
	ldxa	[%g0] 0x74, %g1;	
	retry;

.global intr0x190_custom_trap
intr0x190_custom_trap:
	stxa	%i0, [%g0] 0x73;	
	done;

!============================================================================

#define ENABLE_T0_Fp_exception_ieee_754_0x21
#define ENABLE_T0_Fp_exception_other_0x22
#define ENABLE_T0_Fp_disabled_0x20
#define ENABLE_T0_Illegal_instruction_0x10
#define ENABLE_T0_Clean_Window_0x24

#define H_T0_Trap_Instruction_0
#define My_T0_Trap_Instruction_0	\
	ta      0x90;			\
	done;

#define H_HT0_HTrap_Instruction_0 intr0x190_custom_trap
#define H_HT0_Interrupt_0x60 intr0x60_custom_trap

#include "custom_page1.h"

#define B_TRAP T_BAD_TRAP
#define G_TRAP T_GOOD_TRAP

define(EXIT_GOOD, `ta G_TRAP')
define(EXIT_BAD, `ta B_TRAP')

!try later:
!	stxa    %l6, [$8] (0x22 | ($2 & 0x9)) ! ASI is randomly set
!===========
define(BST_INIT, `
	add     $6, ($7 & 0xfff0), $8	! 4-byte align the offset
	stxa    %l6, [$8] 0x22		! ASI is randomly set
')

!try later:
!ldda    [$8] (0x22 | ($2 & 0x9)), %l6 ! ASI is randomly set
!===========
define(BLD_INIT, `
        add     $6, ($7 & 0xfff0), $8 	! 4-byte align the offset
        ldda    [$8] 0x22, %l6 		! ASI is randomly set
')

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
#ifdef RTGPRIV
	ta	T_CHANGE_PRIV
#endif
	
')
define(EN_INTERRUPTS,`
nop
')

define(DIS_INTERRUPTS,`
nop
')

define(CHECK_DISPATCH_STATUS,`
nop
')

define(CHECK_RECEIVE_STATUS,`
nop
')

define(WRITE_INTR_DATA_REGS,`
nop
')

define(INTR_SET_DISPATCH_VECTOR,`
add      %g0,$3,$4
sllx    $4, 8, $5      ! DEST ID
add      %g0,$2,$4	! VECTOR NUMBER
or      $5,$4,$5
mov %i0, $4
mov $5, %i0
ta 0x30
mov $4, %i0
')

define(DSPCH_INTERRUPT,`
nop
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
!-- label names of res_buf must match with extract_loads_m64.pl --
.align 64 ! for self bcopy()
res_buf_fp_p_0:
	.skip RESULTS_BUF_SIZE_PER_CPU_RTL/2
.align 64 ! for self bcopy()
res_buf_int_p_0:
	.skip RESULTS_BUF_SIZE_PER_CPU_RTL/2
.align 64 ! for self bcopy()
res_buf_fp_p_1:
	.skip RESULTS_BUF_SIZE_PER_CPU_RTL/2
.align 64 ! for self bcopy()
res_buf_int_p_1:
	.skip RESULTS_BUF_SIZE_PER_CPU_RTL/2
.align 64 ! for self bcopy()
res_buf_fp_p_2:
	.skip RESULTS_BUF_SIZE_PER_CPU_RTL/2
.align 64 ! for self bcopy()
res_buf_int_p_2:
	.skip RESULTS_BUF_SIZE_PER_CPU_RTL/2
.align 64 ! for self bcopy()
res_buf_fp_p_3:
	.skip RESULTS_BUF_SIZE_PER_CPU_RTL/2
.align 64 ! for self bcopy()
res_buf_int_p_3:
	.skip RESULTS_BUF_SIZE_PER_CPU_RTL/2
.align 64 ! for self bcopy()
res_buf_fp_p_4:
	.skip RESULTS_BUF_SIZE_PER_CPU_RTL/2
.align 64 ! for self bcopy()
res_buf_int_p_4:
	.skip RESULTS_BUF_SIZE_PER_CPU_RTL/2
.align 64 ! for self bcopy()
res_buf_fp_p_5:
	.skip RESULTS_BUF_SIZE_PER_CPU_RTL/2
.align 64 ! for self bcopy()
res_buf_int_p_5:
	.skip RESULTS_BUF_SIZE_PER_CPU_RTL/2
.align 64 ! for self bcopy()
res_buf_fp_p_6:
	.skip RESULTS_BUF_SIZE_PER_CPU_RTL/2
.align 64 ! for self bcopy()
res_buf_int_p_6:
	.skip RESULTS_BUF_SIZE_PER_CPU_RTL/2
.align 64 ! for self bcopy()
res_buf_fp_p_7:
	.skip RESULTS_BUF_SIZE_PER_CPU_RTL/2
.align 64 ! for self bcopy()
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
! 100 (dynamic) instruction sequence begins
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

! Initialize LFSR to 0x24c6^4
sethi %hi(0x24c6), %l0
or    %l0, %lo(0x24c6), %l0
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

P1: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1d, no_int1, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x0, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x0, 0x1d, 0x3, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int1:

P2: !_MEMBAR (Int)
membar #StoreLoad

P3: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x9, no_int3, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x0, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x0, 0x9, 0x2, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int3:

P4: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1c, no_int4, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x0, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x0, 0x1c, 0x6, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int4:

P5: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x14, no_int5, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x0, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x0, 0x14, 0x3, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int5:

P6: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0xa, no_int6, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x0, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x0, 0xa, 0x3, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int6:

P7: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x25, no_int7, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x0, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x0, 0x25, 0x5, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int7:

P8: !_INTERRUPT (Int) (Branch target of P91)
! self-interrupt - discard
ba P9
nop

TARGET91:
ba RET91
nop


P9: !_INTERRUPT (Int) (Branch target of P19)

CHECK_DISPATCH_STATUS(0x3, no_int9, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x0, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x0, 0x3, 0x5, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int9:
ba P10
nop

TARGET19:
ba RET19
nop


P10: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x12, no_int10, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x0, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x0, 0x12, 0x5, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int10:

P11: !_INTERRUPT (Int)
! self-interrupt - discard

P12: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x23, no_int12, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x0, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x0, 0x23, 0x5, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int12:

P13: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1f, no_int13, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x0, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x0, 0x1f, 0x5, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int13:

P14: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x2b, no_int14, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x0, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x0, 0x2b, 0x6, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int14:

P15: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x12, no_int15, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x0, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x0, 0x12, 0x2, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int15:

P16: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3, no_int16, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x0, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x0, 0x3, 0x7, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int16:

P17: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x39, no_int17, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x0, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x0, 0x39, 0x7, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int17:

P18: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x13, no_int18, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x0, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x0, 0x13, 0x1, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int18:

P19: !_DWST [3] (maybe <- 0x1) (Int) (CBR)
mov %l4, %o5 
sllx %o5, 32, %o5 
stx %o5, [%i0 + 32 ] 
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET19
nop
RET19:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P20: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1d, no_int20, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x0, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x0, 0x1d, 0x4, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int20:

P21: !_LD [12] (Int)
lduw [%i3 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P22: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3c, no_int22, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x0, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x0, 0x3c, 0x2, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int22:

P23: !_REPLACEMENT [4] (Int) (CBR)
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
be,pn  %xcc, TARGET23
nop
RET23:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P24: !_DWLD [1] (FP) (CBR)
ldd [%i0 + 0], %f0
! 2 addresses covered

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET24
nop
RET24:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P25: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x25, no_int25, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x0, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x0, 0x25, 0x1, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int25:

P26: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0xd, no_int26, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x0, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x0, 0xd, 0x7, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int26:

P27: !_INTERRUPT (Int)
! self-interrupt - discard

P28: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x20, no_int28, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x0, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x0, 0x20, 0x3, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int28:

P29: !_LD [10] (Int)
lduw [%i2 + 32], %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0

P30: !_DWLD [8] (Int)
ldx [%i1 + 256], %o1
! move %o1(upper) -> %o1(upper)

P31: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3a, no_int31, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x0, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x0, 0x3a, 0x2, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int31:

P32: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x2a, no_int32, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x0, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x0, 0x2a, 0x2, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int32:

P33: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0xa, no_int33, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x0, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x0, 0xa, 0x1, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int33:

P34: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x37, no_int34, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x0, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x0, 0x37, 0x2, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int34:

P35: !_INTERRUPT (Int) (Branch target of P23)

CHECK_DISPATCH_STATUS(0x21, no_int35, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x0, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x0, 0x21, 0x3, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int35:
ba P36
nop

TARGET23:
ba RET23
nop


P36: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x25, no_int36, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x0, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x0, 0x25, 0x4, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int36:

P37: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x27, no_int37, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x0, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x0, 0x27, 0x6, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int37:

P38: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x2c, no_int38, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x0, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x0, 0x2c, 0x2, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int38:

P39: !_REPLACEMENT [15] (Int)
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

P40: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x25, no_int40, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x0, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x0, 0x25, 0x3, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int40:

P41: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x26, no_int41, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x0, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x0, 0x26, 0x1, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int41:

P42: !_INTERRUPT (Int)
! self-interrupt - discard

P43: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x17, no_int43, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x0, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x0, 0x17, 0x4, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int43:

P44: !_ST [9] (maybe <- 0x3f800001) (FP) (Branch target of P24)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i1 + 512 ]
ba P45
nop

TARGET24:
ba RET24
nop


P45: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x13, no_int45, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x0, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x0, 0x13, 0x1, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int45:

P46: !_INTERRUPT (Int)
! self-interrupt - discard

P47: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x26, no_int47, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x0, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x0, 0x26, 0x4, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int47:

P48: !_LD [9] (Int)
lduw [%i1 + 512], %o5
! move %o5(lower) -> %o1(lower)
srlx %o1, 32, %o1
sllx %o1, 32, %o1
or %o5, %o1, %o1

P49: !_REPLACEMENT [10] (Int)
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

P50: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x11, no_int50, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x0, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x0, 0x11, 0x3, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int50:

P51: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x8, no_int51, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x0, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x0, 0x8, 0x3, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int51:

P52: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x37, no_int52, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x0, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x0, 0x37, 0x6, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int52:

P53: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x2b, no_int53, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x0, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x0, 0x2b, 0x5, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int53:

P54: !_INTERRUPT (Int) (Branch target of P75)

CHECK_DISPATCH_STATUS(0x1c, no_int54, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x0, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x0, 0x1c, 0x1, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int54:
ba P55
nop

TARGET75:
ba RET75
nop


P55: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1a, no_int55, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x0, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x0, 0x1a, 0x1, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int55:

P56: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0xf, no_int56, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x0, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x0, 0xf, 0x3, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int56:

P57: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x6, no_int57, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x0, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x0, 0x6, 0x6, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int57:

P58: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3b, no_int58, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x0, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x0, 0x3b, 0x1, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int58:

P59: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1f, no_int59, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x0, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x0, 0x1f, 0x4, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int59:

P60: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x14, no_int60, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x0, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x0, 0x14, 0x7, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int60:

P61: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x15, no_int61, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x0, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x0, 0x15, 0x6, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int61:

P62: !_LD [12] (Int)
lduw [%i3 + 0], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P63: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3d, no_int63, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x0, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x0, 0x3d, 0x3, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int63:

P64: !_INTERRUPT (Int)
! self-interrupt - discard

P65: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3a, no_int65, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x0, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x0, 0x3a, 0x3, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int65:

P66: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x18, no_int66, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x0, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x0, 0x18, 0x1, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int66:

P67: !_DWLD [1] (Int)
ldx [%i0 + 0], %l7
! move %l7(upper) -> %o2(lower)
srlx %l7, 32, %l6
or %l6, %o2, %o2
! move %l7(lower) -> %o3(upper)
sllx %l7, 32, %o3

P68: !_INTERRUPT (Int) (Branch target of P87)
! self-interrupt - discard
ba P69
nop

TARGET87:
ba RET87
nop


P69: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x18, no_int69, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x0, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x0, 0x18, 0x7, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int69:

P70: !_DWLD [1] (Int)
ldx [%i0 + 0], %l3
! move %l3(upper) -> %o3(lower)
srlx %l3, 32, %o5
or %o5, %o3, %o3
! move %l3(lower) -> %o4(upper)
sllx %l3, 32, %o4

P71: !_DWLD [14] (Int)
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

P72: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1d, no_int72, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x0, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x0, 0x1d, 0x6, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int72:

P73: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1e, no_int73, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x0, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x0, 0x1e, 0x7, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int73:

P74: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3d, no_int74, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x0, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x0, 0x3d, 0x3, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int74:

P75: !_INTERRUPT (Int) (CBR)

CHECK_DISPATCH_STATUS(0x32, no_int75, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x0, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x0, 0x32, 0x6, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int75:

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET75
nop
RET75:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P76: !_INTERRUPT (Int)
! self-interrupt - discard

P77: !_DWST [8] (maybe <- 0x2) (Int)
mov %l4, %l7 
sllx %l7, 32, %l7 
stx %l7, [%i1 + 256 ] 
add   %l4, 1, %l4

P78: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0xb, no_int78, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x0, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x0, 0xb, 0x7, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int78:

P79: !_INTERRUPT (Int) (CBR)

CHECK_DISPATCH_STATUS(0xe, no_int79, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x0, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x0, 0xe, 0x1, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int79:

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET79
nop
RET79:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P80: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0xf, no_int80, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x0, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x0, 0xf, 0x2, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int80:

P81: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0xd, no_int81, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x0, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x0, 0xd, 0x4, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int81:

P82: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0xa, no_int82, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x0, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x0, 0xa, 0x7, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int82:

P83: !_INTERRUPT (Int)
! self-interrupt - discard

P84: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0xe, no_int84, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x0, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x0, 0xe, 0x7, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int84:

P85: !_INTERRUPT (Int)
! self-interrupt - discard

P86: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x39, no_int86, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x0, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x0, 0x39, 0x3, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int86:

P87: !_INTERRUPT (Int) (CBR) (Branch target of P88)

CHECK_DISPATCH_STATUS(0x11, no_int87, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x0, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x0, 0x11, 0x6, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int87:

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET87
nop
RET87:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0

ba P88
nop

TARGET88:
ba RET88
nop


P88: !_INTERRUPT (Int) (CBR)

CHECK_DISPATCH_STATUS(0x34, no_int88, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x0, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x0, 0x34, 0x2, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int88:

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET88
nop
RET88:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P89: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1f, no_int89, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x0, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x0, 0x1f, 0x7, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int89:

P90: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x34, no_int90, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x0, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x0, 0x34, 0x4, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int90:

P91: !_INTERRUPT (Int) (CBR)

CHECK_DISPATCH_STATUS(0x17, no_int91, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x0, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x0, 0x17, 0x7, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int91:

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET91
nop
RET91:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P92: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x21, no_int92, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x0, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x0, 0x21, 0x6, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int92:

P93: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x2e, no_int93, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x0, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x0, 0x2e, 0x6, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int93:

P94: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x14, no_int94, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x0, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x0, 0x14, 0x6, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int94:

P95: !_REPLACEMENT [3] (Int)
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

P96: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1a, no_int96, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x0, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x0, 0x1a, 0x4, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int96:

P97: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x29, no_int97, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x0, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x0, 0x29, 0x1, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int97:

P98: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x28, no_int98, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x0, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x0, 0x28, 0x4, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int98:

P99: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3f, no_int99, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x0, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x0, 0x3f, 0x6, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int99:

P100: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x6, no_int100, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x0, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x0, 0x6, 0x4, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int100:

P101: !_MEMBAR (Int)
membar #StoreLoad

P102: !_LD [0] (Int)
lduw [%i0 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P103: !_LD [1] (Int)
lduw [%i0 + 4], %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0

P104: !_LD [2] (Int)
lduw [%i0 + 12], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P105: !_LD [3] (Int) (Branch target of P79)
lduw [%i0 + 32], %o5
! move %o5(lower) -> %o1(lower)
or %o5, %o1, %o1
ba P106
nop

TARGET79:
ba RET79
nop


P106: !_LD [4] (Int)
lduw [%i0 + 64], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P107: !_LD [5] (Int)
lduw [%i1 + 76], %o5
! move %o5(lower) -> %o2(lower)
or %o5, %o2, %o2

P108: !_LD [6] (FP)
ld [%i1 + 80], %f2
! 1 addresses covered

P109: !_LD [7] (Int)
lduw [%i1 + 84], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P110: !_LD [8] (Int)
lduw [%i1 + 256], %o5
! move %o5(lower) -> %o3(lower)
or %o5, %o3, %o3

P111: !_LD [9] (Int)
lduw [%i1 + 512], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P112: !_LD [10] (Int)
lduw [%i2 + 32], %o5
! move %o5(lower) -> %o4(lower)
or %o5, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P113: !_LD [11] (Int)
lduw [%i2 + 64], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P114: !_LD [12] (Int)
lduw [%i3 + 0], %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0

P115: !_LD [13] (Int)
lduw [%i3 + 64], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P116: !_LD [14] (Int)
lduw [%i3 + 128], %o5
! move %o5(lower) -> %o1(lower)
or %o5, %o1, %o1

P117: !_LD [15] (Int)
lduw [%i3 + 192], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

END_NODES0: ! Test istream for CPU 0 ends
sethi %hi(0xdead0e0f), %l7
or    %l7, %lo(0xdead0e0f), %l7
! move %l7(lower) -> %o2(lower)
or %l7, %o2, %o2
stw %l7, [%i5] 
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
! 100 (dynamic) instruction sequence begins
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

! Initialize LFSR to 0x744d^4
sethi %hi(0x744d), %l0
or    %l0, %lo(0x744d), %l0
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

P118: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x7, no_int118, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x1, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x1, 0x7, 0x3, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int118:

P119: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3f, no_int119, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x1, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x1, 0x3f, 0x5, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int119:

P120: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0xb, no_int120, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x1, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x1, 0xb, 0x2, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int120:

P121: !_DWST [1] (maybe <- 0x800001) (Int)
sllx %l4, 32, %o5 
add   %l4, 1, %l4
or %o5, %l4, %o5
stx %o5, [%i0 + 0]
add   %l4, 1, %l4

P122: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x19, no_int122, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x1, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x1, 0x19, 0x7, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int122:

P123: !_INTERRUPT (Int) (CBR)

CHECK_DISPATCH_STATUS(0x3b, no_int123, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x1, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x1, 0x3b, 0x6, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int123:

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET123
nop
RET123:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P124: !_REPLACEMENT [13] (Int)
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

P125: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x32, no_int125, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x1, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x1, 0x32, 0x0, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int125:

P126: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x9, no_int126, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x1, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x1, 0x9, 0x5, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int126:

P127: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x35, no_int127, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x1, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x1, 0x35, 0x3, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int127:

P128: !_INTERRUPT (Int)
! self-interrupt - discard

P129: !_DWLD [15] (Int)
ldx [%i3 + 192], %o0
! move %o0(upper) -> %o0(upper)

P130: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x2b, no_int130, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x1, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x1, 0x2b, 0x7, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int130:

P131: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x6, no_int131, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x1, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x1, 0x6, 0x0, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int131:

P132: !_INTERRUPT (Int) (CBR)

CHECK_DISPATCH_STATUS(0x24, no_int132, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x1, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x1, 0x24, 0x4, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int132:

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET132
nop
RET132:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P133: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3c, no_int133, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x1, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x1, 0x3c, 0x4, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int133:

P134: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x2a, no_int134, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x1, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x1, 0x2a, 0x0, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int134:

P135: !_INTERRUPT (Int)
! self-interrupt - discard

P136: !_DWST [15] (maybe <- 0x800003) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i3 + 192 ] 
add   %l4, 1, %l4

P137: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x10, no_int137, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x1, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x1, 0x10, 0x6, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int137:

P138: !_INTERRUPT (Int) (Branch target of P155)

CHECK_DISPATCH_STATUS(0x1c, no_int138, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x1, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x1, 0x1c, 0x2, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int138:
ba P139
nop

TARGET155:
ba RET155
nop


P139: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x19, no_int139, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x1, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x1, 0x19, 0x7, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int139:

P140: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3, no_int140, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x1, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x1, 0x3, 0x2, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int140:

P141: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x18, no_int141, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x1, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x1, 0x18, 0x6, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int141:

P142: !_LD [12] (Int)
lduw [%i3 + 0], %o5
! move %o5(lower) -> %o0(lower)
srlx %o0, 32, %o0
sllx %o0, 32, %o0
or %o5, %o0, %o0

P143: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1d, no_int143, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x1, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x1, 0x1d, 0x3, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int143:

P144: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x16, no_int144, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x1, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x1, 0x16, 0x4, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int144:

P145: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0xf, no_int145, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x1, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x1, 0xf, 0x4, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int145:

P146: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0xa, no_int146, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x1, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x1, 0xa, 0x2, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int146:

P147: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x2f, no_int147, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x1, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x1, 0x2f, 0x5, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int147:

P148: !_INTERRUPT (Int) (CBR)

CHECK_DISPATCH_STATUS(0x11, no_int148, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x1, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x1, 0x11, 0x7, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int148:

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET148
nop
RET148:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P149: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x20, no_int149, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x1, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x1, 0x20, 0x2, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int149:

P150: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x19, no_int150, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x1, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x1, 0x19, 0x6, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int150:

P151: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0xe, no_int151, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x1, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x1, 0xe, 0x6, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int151:

P152: !_INTERRUPT (Int)
! self-interrupt - discard

P153: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3e, no_int153, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x1, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x1, 0x3e, 0x2, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int153:

P154: !_DWST [7] (maybe <- 0x800004) (Int)
sllx %l4, 32, %o5 
add   %l4, 1, %l4
or %o5, %l4, %o5
stx %o5, [%i1 + 80]
add   %l4, 1, %l4

P155: !_INTERRUPT (Int) (CBR)

CHECK_DISPATCH_STATUS(0x9, no_int155, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x1, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x1, 0x9, 0x6, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int155:

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET155
nop
RET155:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P156: !_INTERRUPT (Int)
! self-interrupt - discard

P157: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x19, no_int157, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x1, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x1, 0x19, 0x3, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int157:

P158: !_PREFETCH [6] (Int) (Branch target of P123)
prefetch [%i1 + 80], 1
ba P159
nop

TARGET123:
ba RET123
nop


P159: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1b, no_int159, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x1, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x1, 0x1b, 0x4, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int159:

P160: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3d, no_int160, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x1, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x1, 0x3d, 0x5, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int160:

P161: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x8, no_int161, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x1, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x1, 0x8, 0x5, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int161:

P162: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x25, no_int162, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x1, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x1, 0x25, 0x7, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int162:

P163: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x23, no_int163, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x1, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x1, 0x23, 0x6, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int163:

P164: !_REPLACEMENT [5] (Int)
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

P165: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x11, no_int165, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x1, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x1, 0x11, 0x0, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int165:

P166: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x38, no_int166, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x1, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x1, 0x38, 0x6, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int166:

P167: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x0, no_int167, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x1, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x1, 0x0, 0x3, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int167:

P168: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x18, no_int168, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x1, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x1, 0x18, 0x5, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int168:

P169: !_PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P170: !_PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P171: !_ST [6] (maybe <- 0x800006) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P172: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x4, no_int172, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x1, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x1, 0x4, 0x5, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int172:

P173: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x30, no_int173, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x1, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x1, 0x30, 0x5, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int173:

P174: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3d, no_int174, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x1, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x1, 0x3d, 0x6, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int174:

P175: !_REPLACEMENT [1] (Int)
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

P176: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x36, no_int176, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x1, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x1, 0x36, 0x2, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int176:

P177: !_INTERRUPT (Int)
! self-interrupt - discard

P178: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1f, no_int178, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x1, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x1, 0x1f, 0x6, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int178:

P179: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x34, no_int179, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x1, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x1, 0x34, 0x2, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int179:

P180: !_INTERRUPT (Int)
! self-interrupt - discard

P181: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x4, no_int181, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x1, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x1, 0x4, 0x7, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int181:

P182: !_INTERRUPT (Int)
! self-interrupt - discard

P183: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1f, no_int183, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x1, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x1, 0x1f, 0x0, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int183:

P184: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x16, no_int184, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x1, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x1, 0x16, 0x6, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int184:

P185: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1b, no_int185, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x1, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x1, 0x1b, 0x6, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int185:

P186: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x39, no_int186, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x1, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x1, 0x39, 0x0, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int186:

P187: !_INTERRUPT (Int)
! self-interrupt - discard

P188: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1a, no_int188, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x1, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x1, 0x1a, 0x4, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int188:

P189: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3d, no_int189, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x1, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x1, 0x3d, 0x4, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int189:

P190: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x8, no_int190, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x1, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x1, 0x8, 0x7, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int190:

P191: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x22, no_int191, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x1, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x1, 0x22, 0x5, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int191:

P192: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3c, no_int192, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x1, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x1, 0x3c, 0x5, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int192:

P193: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x39, no_int193, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x1, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x1, 0x39, 0x3, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int193:

P194: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x27, no_int194, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x1, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x1, 0x27, 0x4, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int194:

P195: !_INTERRUPT (Int) (Branch target of P132)

CHECK_DISPATCH_STATUS(0x31, no_int195, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x1, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x1, 0x31, 0x7, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int195:
ba P196
nop

TARGET132:
ba RET132
nop


P196: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0xe, no_int196, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x1, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x1, 0xe, 0x0, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int196:

P197: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x14, no_int197, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x1, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x1, 0x14, 0x0, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int197:

P198: !_INTERRUPT (Int)
! self-interrupt - discard

P199: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3c, no_int199, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x1, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x1, 0x3c, 0x4, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int199:

P200: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3, no_int200, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x1, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x1, 0x3, 0x0, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int200:

P201: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x27, no_int201, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x1, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x1, 0x27, 0x3, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int201:

P202: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x28, no_int202, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x1, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x1, 0x28, 0x6, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int202:

P203: !_INTERRUPT (Int)
! self-interrupt - discard

P204: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x24, no_int204, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x1, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x1, 0x24, 0x6, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int204:

P205: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x2c, no_int205, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x1, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x1, 0x2c, 0x5, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int205:

P206: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x23, no_int206, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x1, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x1, 0x23, 0x0, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int206:

P207: !_INTERRUPT (Int) (Branch target of P148)

CHECK_DISPATCH_STATUS(0x1e, no_int207, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x1, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x1, 0x1e, 0x7, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int207:
ba P208
nop

TARGET148:
ba RET148
nop


P208: !_REPLACEMENT [7] (Int)
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

P209: !_INTERRUPT (Int)
! self-interrupt - discard

P210: !_INTERRUPT (Int)
! self-interrupt - discard

P211: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x27, no_int211, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x1, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x1, 0x27, 0x3, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int211:

P212: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1c, no_int212, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x1, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x1, 0x1c, 0x6, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int212:

P213: !_INTERRUPT (Int)
! self-interrupt - discard

P214: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x30, no_int214, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x1, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x1, 0x30, 0x6, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int214:

P215: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x26, no_int215, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x1, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x1, 0x26, 0x3, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int215:

P216: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1, no_int216, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x1, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x1, 0x1, 0x5, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int216:

P217: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3c, no_int217, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x1, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x1, 0x3c, 0x4, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int217:

P218: !_MEMBAR (Int)
membar #StoreLoad

P219: !_LD [0] (Int)
lduw [%i0 + 0], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P220: !_LD [1] (Int)
lduw [%i0 + 4], %l7
! move %l7(lower) -> %o1(lower)
or %l7, %o1, %o1

P221: !_LD [2] (Int)
lduw [%i0 + 12], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P222: !_LD [3] (Int)
lduw [%i0 + 32], %l7
! move %l7(lower) -> %o2(lower)
or %l7, %o2, %o2

P223: !_LD [4] (FP)
ld [%i0 + 64], %f0
! 1 addresses covered

P224: !_LD [5] (Int)
lduw [%i1 + 76], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P225: !_LD [6] (Int)
lduw [%i1 + 80], %l7
! move %l7(lower) -> %o3(lower)
or %l7, %o3, %o3

P226: !_LD [7] (Int)
lduw [%i1 + 84], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P227: !_LD [8] (Int)
lduw [%i1 + 256], %l7
! move %l7(lower) -> %o4(lower)
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P228: !_LD [9] (Int)
lduw [%i1 + 512], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P229: !_LD [10] (Int)
lduw [%i2 + 32], %l7
! move %l7(lower) -> %o0(lower)
or %l7, %o0, %o0

P230: !_LD [11] (Int)
lduw [%i2 + 64], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P231: !_LD [12] (FP)
ld [%i3 + 0], %f1
! 1 addresses covered

P232: !_LD [13] (Int)
lduw [%i3 + 64], %l7
! move %l7(lower) -> %o1(lower)
or %l7, %o1, %o1

P233: !_LD [14] (Int)
lduw [%i3 + 128], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P234: !_LD [15] (Int)
lduw [%i3 + 192], %l7
! move %l7(lower) -> %o2(lower)
or %l7, %o2, %o2

END_NODES1: ! Test istream for CPU 1 ends
sethi %hi(0xdead0e0f), %o5
or    %o5, %lo(0xdead0e0f), %o5
! move %o5(lower) -> %o3(upper)
sllx %o5, 32, %o3
stw %o5, [%i5] 
ld [%i5], %f2
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

func2:
! 100 (dynamic) instruction sequence begins
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
sethi %hi(0x02deade1), %l7
or    %l7, %lo(0x02deade1), %l7
stw %l7, [%i5] 
ld [%i5], %f16

! Initialize running integer counter in register %l4
sethi %hi(0x1000001), %l4
or    %l4, %lo(0x1000001), %l4

! Initialize running FP counter in register %f16
sethi %hi(0x40800001), %l7
or    %l7, %lo(0x40800001), %l7
stw %l7, [%i5] 
ld [%i5], %f16

! Initialize FP counter increment value in register %f17 (constant)
sethi %hi(0x35000000), %l7
or    %l7, %lo(0x35000000), %l7
stw %l7, [%i5] 
ld [%i5], %f17 

! Initialize LFSR to 0x6efe^4
sethi %hi(0x6efe), %l0
or    %l0, %lo(0x6efe), %l0
mulx  %l0, %l0, %l0
mulx  %l0, %l0, %l0

!-- init shared addrs 4 to 5 ---
stx %g0, [%i0+64]
stx %g0, [%i1+72]

! use untouched cache-line (offset 4K) in replacement area for sync
sub %i1, %i0, %o5
add %i3, %o5, %o5
sub %o5, -4096, %o5

!-- begin of sync_init ---
or %g0, 1, %l3
or %g0, %l3, %l6
swap [%o5+4], %l6
membar #Sync
sync_init_1_2:
brnz,pt %l3, sync_init_1_2
lduw [%o5+4], %l3 ! delay slot
sync_init_2_2:
lduw [%o5], %l3
sub %l3, 1, %l6
cas [%o5], %l3, %l6
cmp %l3, %l6
bne,pt %xcc, sync_init_2_2
nop
membar #Sync
sync_init_3_2:
lduw [%o5], %l3 ! delay slot
brnz,pt %l3, sync_init_3_2
nop
!-- end of sync_init ---


BEGIN_NODES2: ! Test istream for CPU 2 begins

P235: !_REPLACEMENT [4] (Int)
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

P236: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x34, no_int236, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x2, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x2, 0x34, 0x0, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int236:

P237: !_INTERRUPT (Int)
! self-interrupt - discard

P238: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3, no_int238, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x2, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x2, 0x3, 0x1, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int238:

P239: !_ST [12] (maybe <- 0x40800001) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i3 + 0 ]

P240: !_INTERRUPT (Int)
! self-interrupt - discard

P241: !_LD [7] (Int)
lduw [%i1 + 84], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P242: !_INTERRUPT (Int)
! self-interrupt - discard

P243: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x11, no_int243, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x2, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x2, 0x11, 0x3, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int243:

P244: !_INTERRUPT (Int)
! self-interrupt - discard

P245: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x6, no_int245, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x2, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x2, 0x6, 0x7, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int245:

P246: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x2b, no_int246, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x2, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x2, 0x2b, 0x5, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int246:

P247: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0xb, no_int247, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x2, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x2, 0xb, 0x3, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int247:

P248: !_INTERRUPT (Int)
! self-interrupt - discard

P249: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1a, no_int249, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x2, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x2, 0x1a, 0x0, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int249:

P250: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x39, no_int250, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x2, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x2, 0x39, 0x0, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int250:

P251: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x28, no_int251, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x2, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x2, 0x28, 0x7, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int251:

P252: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3b, no_int252, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x2, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x2, 0x3b, 0x1, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int252:

P253: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3b, no_int253, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x2, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x2, 0x3b, 0x3, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int253:

P254: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1f, no_int254, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x2, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x2, 0x1f, 0x0, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int254:

P255: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x7, no_int255, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x2, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x2, 0x7, 0x1, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int255:

P256: !_DWST [6] (maybe <- 0x1000001) (Int)
sllx %l4, 32, %l7 
add   %l4, 1, %l4
or %l7, %l4, %l7
stx %l7, [%i1 + 80]
add   %l4, 1, %l4

P257: !_MEMBAR (Int)
membar #StoreLoad

P258: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x13, no_int258, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x2, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x2, 0x13, 0x4, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int258:

P259: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x26, no_int259, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x2, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x2, 0x26, 0x4, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int259:

P260: !_INTERRUPT (Int)
! self-interrupt - discard

P261: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x9, no_int261, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x2, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x2, 0x9, 0x3, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int261:

P262: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3e, no_int262, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x2, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x2, 0x3e, 0x4, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int262:

P263: !_INTERRUPT (Int)
! self-interrupt - discard

P264: !_INTERRUPT (Int)
! self-interrupt - discard

P265: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x20, no_int265, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x2, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x2, 0x20, 0x3, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int265:

P266: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0xc, no_int266, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x2, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x2, 0xc, 0x3, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int266:

P267: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x7, no_int267, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x2, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x2, 0x7, 0x4, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int267:

P268: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3f, no_int268, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x2, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x2, 0x3f, 0x6, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int268:

P269: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x37, no_int269, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x2, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x2, 0x37, 0x0, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int269:

P270: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x39, no_int270, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x2, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x2, 0x39, 0x3, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int270:

P271: !_INTERRUPT (Int)
! self-interrupt - discard

P272: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x18, no_int272, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x2, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x2, 0x18, 0x1, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int272:

P273: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x25, no_int273, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x2, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x2, 0x25, 0x1, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int273:

P274: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3, no_int274, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x2, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x2, 0x3, 0x6, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int274:

P275: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x14, no_int275, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x2, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x2, 0x14, 0x3, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int275:

P276: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x2e, no_int276, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x2, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x2, 0x2e, 0x4, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int276:

P277: !_REPLACEMENT [3] (Int)
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

P278: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x15, no_int278, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x2, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x2, 0x15, 0x1, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int278:

P279: !_REPLACEMENT [6] (Int)
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

P280: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3e, no_int280, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x2, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x2, 0x3e, 0x5, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int280:

P281: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x34, no_int281, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x2, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x2, 0x34, 0x4, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int281:

P282: !_INTERRUPT (Int)
! self-interrupt - discard

P283: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x25, no_int283, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x2, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x2, 0x25, 0x1, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int283:

P284: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x32, no_int284, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x2, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x2, 0x32, 0x1, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int284:

P285: !_LD [13] (Int)
lduw [%i3 + 64], %l7
! move %l7(lower) -> %o0(lower)
or %l7, %o0, %o0

P286: !_INTERRUPT (Int)
! self-interrupt - discard

P287: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x32, no_int287, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x2, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x2, 0x32, 0x6, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int287:

P288: !_INTERRUPT (Int)
! self-interrupt - discard

P289: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x2f, no_int289, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x2, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x2, 0x2f, 0x7, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int289:

P290: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0xb, no_int290, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x2, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x2, 0xb, 0x6, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int290:

P291: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x22, no_int291, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x2, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x2, 0x22, 0x5, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int291:

P292: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1f, no_int292, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x2, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x2, 0x1f, 0x6, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int292:

P293: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3e, no_int293, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x2, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x2, 0x3e, 0x0, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int293:

P294: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1, no_int294, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x2, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x2, 0x1, 0x4, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int294:

P295: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3, no_int295, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x2, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x2, 0x3, 0x4, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int295:

P296: !_INTERRUPT (Int) (Branch target of P351)

CHECK_DISPATCH_STATUS(0x3f, no_int296, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x2, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x2, 0x3f, 0x1, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int296:
ba P297
nop

TARGET351:
ba RET351
nop


P297: !_INTERRUPT (Int)
! self-interrupt - discard

P298: !_INTERRUPT (Int)
! self-interrupt - discard

P299: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x31, no_int299, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x2, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x2, 0x31, 0x0, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int299:

P300: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3a, no_int300, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x2, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x2, 0x3a, 0x4, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int300:

P301: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x37, no_int301, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x2, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x2, 0x37, 0x3, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int301:

P302: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x2a, no_int302, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x2, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x2, 0x2a, 0x7, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int302:

P303: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x34, no_int303, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x2, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x2, 0x34, 0x1, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int303:

P304: !_LD [8] (Int)
lduw [%i1 + 256], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P305: !_DWST [3] (maybe <- 0x1000003) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i0 + 32 ] 
add   %l4, 1, %l4

P306: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3a, no_int306, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x2, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x2, 0x3a, 0x3, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int306:

P307: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0xc, no_int307, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x2, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x2, 0xc, 0x4, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int307:

P308: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x10, no_int308, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x2, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x2, 0x10, 0x4, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int308:

P309: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1e, no_int309, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x2, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x2, 0x1e, 0x4, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int309:

P310: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x13, no_int310, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x2, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x2, 0x13, 0x5, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int310:

P311: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1, no_int311, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x2, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x2, 0x1, 0x6, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int311:

P312: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x9, no_int312, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x2, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x2, 0x9, 0x1, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int312:

P313: !_INTERRUPT (Int)
! self-interrupt - discard

P314: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3a, no_int314, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x2, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x2, 0x3a, 0x0, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int314:

P315: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0xe, no_int315, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x2, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x2, 0xe, 0x1, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int315:

P316: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3e, no_int316, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x2, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x2, 0x3e, 0x6, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int316:

P317: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x26, no_int317, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x2, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x2, 0x26, 0x0, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int317:

P318: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x5, no_int318, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x2, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x2, 0x5, 0x0, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int318:

P319: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x39, no_int319, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x2, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x2, 0x39, 0x4, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int319:

P320: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0xb, no_int320, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x2, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x2, 0xb, 0x4, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int320:

P321: !_INTERRUPT (Int)
! self-interrupt - discard

P322: !_DWST [12] (maybe <- 0x1000004) (Int)
mov %l4, %l3 
sllx %l3, 32, %l3 
stx %l3, [%i3 + 0 ] 
add   %l4, 1, %l4

P323: !_INTERRUPT (Int)
! self-interrupt - discard

P324: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x5, no_int324, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x2, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x2, 0x5, 0x5, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int324:

P325: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x23, no_int325, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x2, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x2, 0x23, 0x7, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int325:

P326: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x2d, no_int326, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x2, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x2, 0x2d, 0x4, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int326:

P327: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x21, no_int327, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x2, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x2, 0x21, 0x1, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int327:

P328: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0xd, no_int328, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x2, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x2, 0xd, 0x6, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int328:

P329: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x0, no_int329, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x2, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x2, 0x0, 0x3, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int329:

P330: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0xd, no_int330, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x2, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x2, 0xd, 0x0, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int330:

P331: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x15, no_int331, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x2, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x2, 0x15, 0x3, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int331:

P332: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3d, no_int332, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x2, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x2, 0x3d, 0x3, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int332:

P333: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x2d, no_int333, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x2, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x2, 0x2d, 0x4, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int333:

P334: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x22, no_int334, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x2, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x2, 0x22, 0x7, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int334:

P335: !_MEMBAR (Int)
membar #StoreLoad

P336: !_LD [0] (Int)
lduw [%i0 + 0], %l3
! move %l3(lower) -> %o1(lower)
or %l3, %o1, %o1

P337: !_LD [1] (Int) (LE)
wr %g0, 0x88, %asi
lduwa [%i0 + 4] %asi, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P338: !_LD [2] (Int)
lduw [%i0 + 12], %l3
! move %l3(lower) -> %o2(lower)
or %l3, %o2, %o2

P339: !_LD [3] (Int)
lduw [%i0 + 32], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P340: !_LD [4] (Int)
lduw [%i0 + 64], %l3
! move %l3(lower) -> %o3(lower)
or %l3, %o3, %o3

P341: !_LD [5] (Int)
lduw [%i1 + 76], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P342: !_LD [6] (Int)
lduw [%i1 + 80], %l3
! move %l3(lower) -> %o4(lower)
or %l3, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P343: !_LD [7] (Int)
lduw [%i1 + 84], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P344: !_LD [8] (Int)
lduw [%i1 + 256], %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0

P345: !_LD [9] (Int)
lduw [%i1 + 512], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P346: !_LD [10] (Int)
lduw [%i2 + 32], %l3
! move %l3(lower) -> %o1(lower)
or %l3, %o1, %o1

P347: !_LD [11] (Int)
lduw [%i2 + 64], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P348: !_LD [12] (Int)
lduw [%i3 + 0], %l3
! move %l3(lower) -> %o2(lower)
or %l3, %o2, %o2

P349: !_LD [13] (Int)
lduw [%i3 + 64], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P350: !_LD [14] (Int)
lduw [%i3 + 128], %l3
! move %l3(lower) -> %o3(lower)
or %l3, %o3, %o3

P351: !_LD [15] (Int) (CBR)
lduw [%i3 + 192], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET351
nop
RET351:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


END_NODES2: ! Test istream for CPU 2 ends
sethi %hi(0xdead0e0f), %l3
or    %l3, %lo(0xdead0e0f), %l3
! move %l3(lower) -> %o4(lower)
or %l3, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5
stw %l3, [%i5] 
ld [%i5], %f0
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
! 100 (dynamic) instruction sequence begins
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
sethi %hi(0x03deade1), %o5
or    %o5, %lo(0x03deade1), %o5
stw %o5, [%i5] 
ld [%i5], %f16

! Initialize running integer counter in register %l4
sethi %hi(0x1800001), %l4
or    %l4, %lo(0x1800001), %l4

! Initialize running FP counter in register %f16
sethi %hi(0x41000001), %o5
or    %o5, %lo(0x41000001), %o5
stw %o5, [%i5] 
ld [%i5], %f16

! Initialize FP counter increment value in register %f17 (constant)
sethi %hi(0x35800000), %o5
or    %o5, %lo(0x35800000), %o5
stw %o5, [%i5] 
ld [%i5], %f17 

! Initialize LFSR to 0x2b78^4
sethi %hi(0x2b78), %l0
or    %l0, %lo(0x2b78), %l0
mulx  %l0, %l0, %l0
mulx  %l0, %l0, %l0

!-- init shared addrs 6 to 7 ---
stx %g0, [%i1+80]

! use untouched cache-line (offset 4K) in replacement area for sync
sub %i1, %i0, %l3
add %i3, %l3, %l3
sub %l3, -4096, %l3

!-- begin of sync_init ---
or %g0, 1, %l6
or %g0, %l6, %l7
swap [%l3+4], %l7
membar #Sync
sync_init_1_3:
brnz,pt %l6, sync_init_1_3
lduw [%l3+4], %l6 ! delay slot
sync_init_2_3:
lduw [%l3], %l6
sub %l6, 1, %l7
cas [%l3], %l6, %l7
cmp %l6, %l7
bne,pt %xcc, sync_init_2_3
nop
membar #Sync
sync_init_3_3:
lduw [%l3], %l6 ! delay slot
brnz,pt %l6, sync_init_3_3
nop
!-- end of sync_init ---


BEGIN_NODES3: ! Test istream for CPU 3 begins

P352: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1, no_int352, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x3, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x3, 0x1, 0x0, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int352:

P353: !_INTERRUPT (Int) (CBR)

CHECK_DISPATCH_STATUS(0x35, no_int353, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x3, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x3, 0x35, 0x1, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int353:

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET353
nop
RET353:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P354: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0xb, no_int354, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x3, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x3, 0xb, 0x5, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int354:

P355: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x27, no_int355, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x3, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x3, 0x27, 0x5, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int355:

P356: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x2e, no_int356, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x3, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x3, 0x2e, 0x7, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int356:

P357: !_ST [4] (maybe <- 0x1800001) (Int)
stw   %l4, [%i0 + 64 ]
add   %l4, 1, %l4

P358: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x2c, no_int358, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x3, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x3, 0x2c, 0x7, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int358:

P359: !_INTERRUPT (Int) (Branch target of P468)

CHECK_DISPATCH_STATUS(0x2, no_int359, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x3, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x3, 0x2, 0x2, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int359:
ba P360
nop

TARGET468:
ba RET468
nop


P360: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1d, no_int360, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x3, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x3, 0x1d, 0x6, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int360:

P361: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x2b, no_int361, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x3, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x3, 0x2b, 0x4, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int361:

P362: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x2c, no_int362, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x3, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x3, 0x2c, 0x4, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int362:

P363: !_INTERRUPT (Int)
! self-interrupt - discard

P364: !_INTERRUPT (Int)
! self-interrupt - discard

P365: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1, no_int365, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x3, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x3, 0x1, 0x5, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int365:

P366: !_MEMBAR (Int)
membar #StoreLoad

P367: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3c, no_int367, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x3, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x3, 0x3c, 0x6, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int367:

P368: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x33, no_int368, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x3, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x3, 0x33, 0x4, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int368:

P369: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x30, no_int369, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x3, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x3, 0x30, 0x6, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int369:

P370: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x2, no_int370, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x3, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x3, 0x2, 0x6, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int370:

P371: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x9, no_int371, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x3, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x3, 0x9, 0x1, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int371:

P372: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1b, no_int372, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x3, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x3, 0x1b, 0x0, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int372:

P373: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x18, no_int373, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x3, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x3, 0x18, 0x5, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int373:

P374: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x9, no_int374, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x3, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x3, 0x9, 0x1, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int374:

P375: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x16, no_int375, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x3, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x3, 0x16, 0x4, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int375:

P376: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3a, no_int376, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x3, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x3, 0x3a, 0x7, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int376:

P377: !_INTERRUPT (Int)
! self-interrupt - discard

P378: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x23, no_int378, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x3, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x3, 0x23, 0x4, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int378:

P379: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x12, no_int379, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x3, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x3, 0x12, 0x1, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int379:

P380: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0xc, no_int380, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x3, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x3, 0xc, 0x2, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int380:

P381: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3, no_int381, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x3, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x3, 0x3, 0x5, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int381:

P382: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x4, no_int382, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x3, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x3, 0x4, 0x1, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int382:

P383: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0xb, no_int383, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x3, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x3, 0xb, 0x4, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int383:

P384: !_DWST [7] (maybe <- 0x41000001) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=21 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
std %f20, [%i1 + 80]

P385: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x24, no_int385, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x3, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x3, 0x24, 0x2, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int385:

P386: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1b, no_int386, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x3, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x3, 0x1b, 0x2, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int386:

P387: !_INTERRUPT (Int)
! self-interrupt - discard

P388: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x17, no_int388, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x3, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x3, 0x17, 0x0, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int388:

P389: !_INTERRUPT (Int)
! self-interrupt - discard

P390: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1a, no_int390, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x3, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x3, 0x1a, 0x5, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int390:

P391: !_INTERRUPT (Int) (Branch target of P417)
! self-interrupt - discard
ba P392
nop

TARGET417:
ba RET417
nop


P392: !_INTERRUPT (Int)
! self-interrupt - discard

P393: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3f, no_int393, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x3, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x3, 0x3f, 0x7, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int393:

P394: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x31, no_int394, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x3, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x3, 0x31, 0x2, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int394:

P395: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x4, no_int395, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x3, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x3, 0x4, 0x7, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int395:

P396: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x9, no_int396, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x3, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x3, 0x9, 0x0, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int396:

P397: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x27, no_int397, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x3, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x3, 0x27, 0x6, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int397:

P398: !_INTERRUPT (Int)
! self-interrupt - discard

P399: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1, no_int399, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x3, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x3, 0x1, 0x7, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int399:

P400: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x2b, no_int400, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x3, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x3, 0x2b, 0x6, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int400:

P401: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x26, no_int401, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x3, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x3, 0x26, 0x6, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int401:

P402: !_INTERRUPT (Int) (CBR)

CHECK_DISPATCH_STATUS(0x12, no_int402, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x3, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x3, 0x12, 0x0, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int402:

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET402
nop
RET402:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P403: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x2c, no_int403, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x3, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x3, 0x2c, 0x5, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int403:

P404: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x20, no_int404, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x3, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x3, 0x20, 0x4, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int404:

P405: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x35, no_int405, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x3, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x3, 0x35, 0x2, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int405:

P406: !_INTERRUPT (Int) (CBR)

CHECK_DISPATCH_STATUS(0x39, no_int406, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x3, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x3, 0x39, 0x5, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int406:

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET406
nop
RET406:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P407: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x34, no_int407, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x3, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x3, 0x34, 0x2, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int407:

P408: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x0, no_int408, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x3, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x3, 0x0, 0x7, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int408:

P409: !_ST [2] (maybe <- 0x1800002) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P410: !_INTERRUPT (Int) (Branch target of P430)

CHECK_DISPATCH_STATUS(0x34, no_int410, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x3, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x3, 0x34, 0x7, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int410:
ba P411
nop

TARGET430:
ba RET430
nop


P411: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1a, no_int411, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x3, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x3, 0x1a, 0x7, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int411:

P412: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x2c, no_int412, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x3, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x3, 0x2c, 0x6, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int412:

P413: !_INTERRUPT (Int) (Branch target of P424)

CHECK_DISPATCH_STATUS(0x30, no_int413, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x3, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x3, 0x30, 0x2, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int413:
ba P414
nop

TARGET424:
ba RET424
nop


P414: !_INTERRUPT (Int)
! self-interrupt - discard

P415: !_INTERRUPT (Int)
! self-interrupt - discard

P416: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1f, no_int416, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x3, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x3, 0x1f, 0x4, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int416:

P417: !_INTERRUPT (Int) (CBR)

CHECK_DISPATCH_STATUS(0x36, no_int417, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x3, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x3, 0x36, 0x2, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int417:

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET417
nop
RET417:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P418: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x9, no_int418, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x3, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x3, 0x9, 0x2, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int418:

P419: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x2e, no_int419, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x3, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x3, 0x2e, 0x5, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int419:

P420: !_INTERRUPT (Int) (Branch target of P353)

CHECK_DISPATCH_STATUS(0x1d, no_int420, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x3, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x3, 0x1d, 0x6, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int420:
ba P421
nop

TARGET353:
ba RET353
nop


P421: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x34, no_int421, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x3, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x3, 0x34, 0x1, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int421:

P422: !_INTERRUPT (Int) (Branch target of P406)

CHECK_DISPATCH_STATUS(0x6, no_int422, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x3, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x3, 0x6, 0x6, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int422:
ba P423
nop

TARGET406:
ba RET406
nop


P423: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x32, no_int423, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x3, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x3, 0x32, 0x5, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int423:

P424: !_INTERRUPT (Int) (CBR)

CHECK_DISPATCH_STATUS(0x19, no_int424, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x3, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x3, 0x19, 0x7, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int424:

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET424
nop
RET424:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P425: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0xb, no_int425, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x3, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x3, 0xb, 0x2, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int425:

P426: !_INTERRUPT (Int) (CBR)

CHECK_DISPATCH_STATUS(0x2d, no_int426, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x3, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x3, 0x2d, 0x1, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int426:

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET426
nop
RET426:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P427: !_LD [12] (Int)
lduw [%i3 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P428: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x2d, no_int428, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x3, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x3, 0x2d, 0x7, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int428:

P429: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x28, no_int429, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x3, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x3, 0x28, 0x0, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int429:

P430: !_INTERRUPT (Int) (CBR)
! self-interrupt - discard

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET430
nop
RET430:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P431: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1f, no_int431, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x3, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x3, 0x1f, 0x2, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int431:

P432: !_DWST [5] (maybe <- 0x41000003) (FP)
! 0 th moved, current_fp_src=21 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
std %f20, [%i1 + 72]

P433: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3a, no_int433, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x3, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x3, 0x3a, 0x4, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int433:

P434: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x11, no_int434, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x3, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x3, 0x11, 0x6, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int434:

P435: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1, no_int435, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x3, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x3, 0x1, 0x4, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int435:

P436: !_INTERRUPT (Int)
! self-interrupt - discard

P437: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x34, no_int437, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x3, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x3, 0x34, 0x4, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int437:

P438: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x10, no_int438, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x3, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x3, 0x10, 0x7, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int438:

P439: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x6, no_int439, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x3, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x3, 0x6, 0x1, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int439:

P440: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0xf, no_int440, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x3, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x3, 0xf, 0x2, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int440:

P441: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x2e, no_int441, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x3, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x3, 0x2e, 0x6, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int441:

P442: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x12, no_int442, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x3, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x3, 0x12, 0x7, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int442:

P443: !_INTERRUPT (Int)
! self-interrupt - discard

P444: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x4, no_int444, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x3, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x3, 0x4, 0x2, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int444:

P445: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x28, no_int445, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x3, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x3, 0x28, 0x7, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int445:

P446: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x28, no_int446, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x3, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x3, 0x28, 0x5, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int446:

P447: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x2b, no_int447, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x3, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x3, 0x2b, 0x2, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int447:

P448: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x22, no_int448, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x3, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x3, 0x22, 0x7, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int448:

P449: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x12, no_int449, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x3, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x3, 0x12, 0x6, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int449:

P450: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x24, no_int450, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x3, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x3, 0x24, 0x1, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int450:

P451: !_INTERRUPT (Int)
! self-interrupt - discard

P452: !_MEMBAR (Int)
membar #StoreLoad

P453: !_LD [0] (Int)
lduw [%i0 + 0], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

P454: !_LD [1] (Int)
lduw [%i0 + 4], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P455: !_LD [2] (Int)
lduw [%i0 + 12], %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1

P456: !_LD [3] (Int) (Branch target of P426)
lduw [%i0 + 32], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
ba P457
nop

TARGET426:
ba RET426
nop


P457: !_LD [4] (Int)
lduw [%i0 + 64], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2

P458: !_LD [5] (Int)
lduw [%i1 + 76], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P459: !_LD [6] (FP)
ld [%i1 + 80], %f0
! 1 addresses covered

P460: !_LD [7] (Int)
lduw [%i1 + 84], %l6
! move %l6(lower) -> %o3(lower)
or %l6, %o3, %o3

P461: !_LD [8] (FP)
ld [%i1 + 256], %f1
! 1 addresses covered

P462: !_LD [9] (FP)
ld [%i1 + 512], %f2
! 1 addresses covered

P463: !_LD [10] (Int)
lduw [%i2 + 32], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P464: !_LD [11] (Int)
lduw [%i2 + 64], %l6
! move %l6(lower) -> %o4(lower)
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P465: !_LD [12] (Int)
lduw [%i3 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P466: !_LD [13] (Int)
lduw [%i3 + 64], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

P467: !_LD [14] (Int) (Branch target of P402)
lduw [%i3 + 128], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
ba P468
nop

TARGET402:
ba RET402
nop


P468: !_LD [15] (Int) (CBR)
lduw [%i3 + 192], %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET468
nop
RET468:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


END_NODES3: ! Test istream for CPU 3 ends
sethi %hi(0xdead0e0f), %o5
or    %o5, %lo(0xdead0e0f), %o5
! move %o5(lower) -> %o2(upper)
sllx %o5, 32, %o2
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

func4:
! 100 (dynamic) instruction sequence begins
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

! Initialize LFSR to 0x1cc^4
sethi %hi(0x1cc), %l0
or    %l0, %lo(0x1cc), %l0
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

P469: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x26, no_int469, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x4, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x4, 0x26, 0x6, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int469:

P470: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x28, no_int470, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x4, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x4, 0x28, 0x6, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int470:

P471: !_ST [0] (maybe <- 0x2000001) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P472: !_LD [14] (Int)
lduw [%i3 + 128], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P473: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3, no_int473, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x4, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x4, 0x3, 0x2, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int473:

P474: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x13, no_int474, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x4, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x4, 0x13, 0x7, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int474:

P475: !_ST [2] (maybe <- 0x2000002) (Int)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P476: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1b, no_int476, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x4, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x4, 0x1b, 0x3, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int476:

P477: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x7, no_int477, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x4, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x4, 0x7, 0x6, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int477:

P478: !_LD [4] (Int)
lduw [%i0 + 64], %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0

P479: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3e, no_int479, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x4, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x4, 0x3e, 0x3, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int479:

P480: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x2a, no_int480, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x4, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x4, 0x2a, 0x2, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int480:

P481: !_INTERRUPT (Int) (CBR)

CHECK_DISPATCH_STATUS(0x0, no_int481, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x4, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x4, 0x0, 0x1, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int481:

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET481
nop
RET481:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P482: !_INTERRUPT (Int)
! self-interrupt - discard

P483: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x33, no_int483, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x4, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x4, 0x33, 0x0, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int483:

P484: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x23, no_int484, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x4, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x4, 0x23, 0x1, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int484:

P485: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x28, no_int485, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x4, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x4, 0x28, 0x6, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int485:

P486: !_REPLACEMENT [7] (Int)
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

P487: !_INTERRUPT (Int)
! self-interrupt - discard

P488: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x19, no_int488, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x4, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x4, 0x19, 0x6, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int488:

P489: !_INTERRUPT (Int)
! self-interrupt - discard

P490: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x2b, no_int490, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x4, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x4, 0x2b, 0x5, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int490:

P491: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x24, no_int491, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x4, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x4, 0x24, 0x1, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int491:

P492: !_LD [15] (Int)
lduw [%i3 + 192], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P493: !_DWST [4] (maybe <- 0x41800001) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
std %f20, [%i0 + 64]

P494: !_REPLACEMENT [2] (Int)
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

P495: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x21, no_int495, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x4, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x4, 0x21, 0x5, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int495:

P496: !_PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P497: !_INTERRUPT (Int)
! self-interrupt - discard

P498: !_INTERRUPT (Int)
! self-interrupt - discard

P499: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1, no_int499, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x4, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x4, 0x1, 0x7, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int499:

P500: !_DWST [11] (maybe <- 0x2000003) (Int)
mov %l4, %l3 
sllx %l3, 32, %l3 
stx %l3, [%i2 + 64 ] 
add   %l4, 1, %l4

P501: !_LD [0] (Int)
lduw [%i0 + 0], %l3
! move %l3(lower) -> %o1(lower)
or %l3, %o1, %o1

P502: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x24, no_int502, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x4, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x4, 0x24, 0x1, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int502:

P503: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x34, no_int503, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x4, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x4, 0x34, 0x6, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int503:

P504: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x2d, no_int504, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x4, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x4, 0x2d, 0x7, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int504:

P505: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x9, no_int505, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x4, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x4, 0x9, 0x0, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int505:

P506: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x15, no_int506, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x4, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x4, 0x15, 0x5, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int506:

P507: !_INTERRUPT (Int)
! self-interrupt - discard

P508: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0xb, no_int508, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x4, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x4, 0xb, 0x3, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int508:

P509: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x20, no_int509, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x4, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x4, 0x20, 0x7, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int509:

P510: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0xe, no_int510, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x4, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x4, 0xe, 0x0, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int510:

P511: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x30, no_int511, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x4, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x4, 0x30, 0x2, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int511:

P512: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1a, no_int512, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x4, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x4, 0x1a, 0x3, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int512:

P513: !_DWST [2] (maybe <- 0x2000004) (Int)
mov %l4, %o5 
stx %o5, [%i0 + 8]
add   %l4, 1, %l4

P514: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x19, no_int514, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x4, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x4, 0x19, 0x0, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int514:

P515: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x32, no_int515, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x4, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x4, 0x32, 0x6, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int515:

P516: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x19, no_int516, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x4, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x4, 0x19, 0x7, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int516:

P517: !_INTERRUPT (Int) (CBR)

CHECK_DISPATCH_STATUS(0xa, no_int517, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x4, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x4, 0xa, 0x2, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int517:

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET517
nop
RET517:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P518: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x39, no_int518, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x4, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x4, 0x39, 0x6, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int518:

P519: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3d, no_int519, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x4, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x4, 0x3d, 0x6, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int519:

P520: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x2a, no_int520, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x4, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x4, 0x2a, 0x0, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int520:

P521: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x32, no_int521, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x4, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x4, 0x32, 0x2, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int521:

P522: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x32, no_int522, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x4, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x4, 0x32, 0x0, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int522:

P523: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x37, no_int523, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x4, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x4, 0x37, 0x1, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int523:

P524: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x2, no_int524, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x4, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x4, 0x2, 0x5, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int524:

P525: !_INTERRUPT (Int) (Branch target of P481)

CHECK_DISPATCH_STATUS(0x1c, no_int525, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x4, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x4, 0x1c, 0x2, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int525:
ba P526
nop

TARGET481:
ba RET481
nop


P526: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x6, no_int526, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x4, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x4, 0x6, 0x3, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int526:

P527: !_LD [3] (Int)
lduw [%i0 + 32], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P528: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x35, no_int528, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x4, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x4, 0x35, 0x6, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int528:

P529: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1f, no_int529, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x4, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x4, 0x1f, 0x2, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int529:

P530: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x34, no_int530, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x4, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x4, 0x34, 0x2, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int530:

P531: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x24, no_int531, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x4, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x4, 0x24, 0x7, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int531:

P532: !_INTERRUPT (Int)
! self-interrupt - discard

P533: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3d, no_int533, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x4, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x4, 0x3d, 0x3, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int533:

P534: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x17, no_int534, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x4, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x4, 0x17, 0x5, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int534:

P535: !_INTERRUPT (Int)
! self-interrupt - discard

P536: !_LD [14] (FP)
ld [%i3 + 128], %f0
! 1 addresses covered

P537: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3b, no_int537, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x4, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x4, 0x3b, 0x2, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int537:

P538: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x9, no_int538, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x4, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x4, 0x9, 0x7, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int538:

P539: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x19, no_int539, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x4, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x4, 0x19, 0x1, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int539:

P540: !_INTERRUPT (Int)
! self-interrupt - discard

P541: !_INTERRUPT (Int) (Branch target of P517)

CHECK_DISPATCH_STATUS(0x22, no_int541, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x4, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x4, 0x22, 0x2, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int541:
ba P542
nop

TARGET517:
ba RET517
nop


P542: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x37, no_int542, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x4, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x4, 0x37, 0x3, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int542:

P543: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x33, no_int543, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x4, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x4, 0x33, 0x2, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int543:

P544: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1d, no_int544, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x4, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x4, 0x1d, 0x0, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int544:

P545: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1d, no_int545, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x4, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x4, 0x1d, 0x1, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int545:

P546: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x6, no_int546, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x4, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x4, 0x6, 0x1, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int546:

P547: !_REPLACEMENT [6] (Int)
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

P548: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x27, no_int548, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x4, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x4, 0x27, 0x0, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int548:

P549: !_LD [4] (FP)
ld [%i0 + 64], %f1
! 1 addresses covered

P550: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x34, no_int550, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x4, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x4, 0x34, 0x7, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int550:

P551: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x23, no_int551, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x4, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x4, 0x23, 0x6, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int551:

P552: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x13, no_int552, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x4, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x4, 0x13, 0x6, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int552:

P553: !_INTERRUPT (Int)
! self-interrupt - discard

P554: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0xc, no_int554, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x4, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x4, 0xc, 0x2, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int554:

P555: !_DWST [1] (maybe <- 0x2000005) (Int)
sllx %l4, 32, %l7 
add   %l4, 1, %l4
or %l7, %l4, %l7
stx %l7, [%i0 + 0]
add   %l4, 1, %l4

P556: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x32, no_int556, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x4, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x4, 0x32, 0x5, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int556:

P557: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3f, no_int557, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x4, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x4, 0x3f, 0x1, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int557:

P558: !_INTERRUPT (Int)
! self-interrupt - discard

P559: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x38, no_int559, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x4, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x4, 0x38, 0x0, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int559:

P560: !_DWST [2] (maybe <- 0x2000007) (Int)
mov %l4, %l6 
stx %l6, [%i0 + 8]
add   %l4, 1, %l4

P561: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x34, no_int561, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x4, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x4, 0x34, 0x1, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int561:

P562: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0xe, no_int562, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x4, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x4, 0xe, 0x5, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int562:

P563: !_INTERRUPT (Int)
! self-interrupt - discard

P564: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x7, no_int564, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x4, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x4, 0x7, 0x5, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int564:

P565: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x2d, no_int565, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x4, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x4, 0x2d, 0x6, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int565:

P566: !_INTERRUPT (Int)
! self-interrupt - discard

P567: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3f, no_int567, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x4, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x4, 0x3f, 0x7, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int567:

P568: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x24, no_int568, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x4, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x4, 0x24, 0x3, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int568:

P569: !_MEMBAR (Int)
membar #StoreLoad

P570: !_LD [0] (Int)
lduw [%i0 + 0], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2

P571: !_LD [1] (Int)
lduw [%i0 + 4], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P572: !_LD [2] (Int)
lduw [%i0 + 12], %l6
! move %l6(lower) -> %o3(lower)
or %l6, %o3, %o3

P573: !_LD [3] (Int)
lduw [%i0 + 32], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P574: !_LD [4] (Int)
lduw [%i0 + 64], %l6
! move %l6(lower) -> %o4(lower)
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P575: !_LD [5] (Int) (LE)
wr %g0, 0x88, %asi
lduwa [%i1 + 76] %asi, %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P576: !_LD [6] (Int)
lduw [%i1 + 80], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

P577: !_LD [7] (Int)
lduw [%i1 + 84], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P578: !_LD [8] (Int)
lduw [%i1 + 256], %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1

P579: !_LD [9] (FP)
ld [%i1 + 512], %f2
! 1 addresses covered

P580: !_LD [10] (Int)
lduw [%i2 + 32], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P581: !_LD [11] (Int)
lduw [%i2 + 64], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2

P582: !_LD [12] (Int)
lduw [%i3 + 0], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P583: !_LD [13] (Int)
lduw [%i3 + 64], %l6
! move %l6(lower) -> %o3(lower)
or %l6, %o3, %o3

P584: !_LD [14] (Int)
lduw [%i3 + 128], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P585: !_LD [15] (Int)
lduw [%i3 + 192], %l6
! move %l6(lower) -> %o4(lower)
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

END_NODES4: ! Test istream for CPU 4 ends
sethi %hi(0xdead0e0f), %l7
or    %l7, %lo(0xdead0e0f), %l7
! move %l7(lower) -> %o0(upper)
sllx %l7, 32, %o0
stw %l7, [%i5] 
ld [%i5], %f3
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

func5:
! 100 (dynamic) instruction sequence begins
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

! Initialize LFSR to 0x7e42^4
sethi %hi(0x7e42), %l0
or    %l0, %lo(0x7e42), %l0
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

P586: !_INTERRUPT (Int) (CBR)

CHECK_DISPATCH_STATUS(0x2d, no_int586, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x5, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x5, 0x2d, 0x7, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int586:

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET586
nop
RET586:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P587: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x15, no_int587, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x5, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x5, 0x15, 0x6, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int587:

P588: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x18, no_int588, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x5, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x5, 0x18, 0x4, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int588:

P589: !_ST [5] (maybe <- 0x2800001) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P590: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x8, no_int590, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x5, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x5, 0x8, 0x3, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int590:

P591: !_INTERRUPT (Int)
! self-interrupt - discard

P592: !_INTERRUPT (Int) (CBR)

CHECK_DISPATCH_STATUS(0xd, no_int592, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x5, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x5, 0xd, 0x4, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int592:

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET592
nop
RET592:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P593: !_INTERRUPT (Int) (Branch target of P594)
! self-interrupt - discard
ba P594
nop

TARGET594:
ba RET594
nop


P594: !_INTERRUPT (Int) (CBR)

CHECK_DISPATCH_STATUS(0x1b, no_int594, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x5, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x5, 0x1b, 0x3, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int594:

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET594
nop
RET594:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P595: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0xa, no_int595, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x5, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x5, 0xa, 0x2, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int595:

P596: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x2b, no_int596, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x5, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x5, 0x2b, 0x1, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int596:

P597: !_DWLD [8] (Int)
ldx [%i1 + 256], %o0
! move %o0(upper) -> %o0(upper)

P598: !_INTERRUPT (Int)
! self-interrupt - discard

P599: !_INTERRUPT (Int) (CBR)
! self-interrupt - discard

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET599
nop
RET599:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P600: !_INTERRUPT (Int)
! self-interrupt - discard

P601: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1f, no_int601, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x5, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x5, 0x1f, 0x1, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int601:

P602: !_LD [12] (FP)
ld [%i3 + 0], %f0
! 1 addresses covered

P603: !_INTERRUPT (Int) (Branch target of P700)
! self-interrupt - discard
ba P604
nop

TARGET700:
ba RET700
nop


P604: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1b, no_int604, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x5, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x5, 0x1b, 0x1, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int604:

P605: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3b, no_int605, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x5, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x5, 0x3b, 0x2, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int605:

P606: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3f, no_int606, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x5, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x5, 0x3f, 0x1, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int606:

P607: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x5, no_int607, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x5, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x5, 0x5, 0x6, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int607:

P608: !_ST [11] (maybe <- 0x2800002) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P609: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x36, no_int609, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x5, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x5, 0x36, 0x4, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int609:

P610: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x37, no_int610, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x5, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x5, 0x37, 0x1, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int610:

P611: !_INTERRUPT (Int) (Branch target of P599)

CHECK_DISPATCH_STATUS(0x11, no_int611, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x5, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x5, 0x11, 0x7, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int611:
ba P612
nop

TARGET599:
ba RET599
nop


P612: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x2c, no_int612, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x5, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x5, 0x2c, 0x2, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int612:

P613: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x2d, no_int613, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x5, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x5, 0x2d, 0x2, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int613:

P614: !_INTERRUPT (Int)
! self-interrupt - discard

P615: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x22, no_int615, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x5, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x5, 0x22, 0x1, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int615:

P616: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x6, no_int616, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x5, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x5, 0x6, 0x4, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int616:

P617: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x12, no_int617, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x5, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x5, 0x12, 0x1, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int617:

P618: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1e, no_int618, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x5, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x5, 0x1e, 0x6, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int618:

P619: !_LD [11] (Int)
lduw [%i2 + 64], %l3
! move %l3(lower) -> %o0(lower)
srlx %o0, 32, %o0
sllx %o0, 32, %o0
or %l3, %o0, %o0

P620: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x9, no_int620, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x5, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x5, 0x9, 0x6, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int620:

P621: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0xf, no_int621, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x5, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x5, 0xf, 0x4, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int621:

P622: !_INTERRUPT (Int) (Branch target of P674)

CHECK_DISPATCH_STATUS(0x2, no_int622, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x5, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x5, 0x2, 0x3, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int622:
ba P623
nop

TARGET674:
ba RET674
nop


P623: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1f, no_int623, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x5, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x5, 0x1f, 0x1, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int623:

P624: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x36, no_int624, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x5, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x5, 0x36, 0x4, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int624:

P625: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x16, no_int625, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x5, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x5, 0x16, 0x6, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int625:

P626: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x9, no_int626, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x5, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x5, 0x9, 0x3, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int626:

P627: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x0, no_int627, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x5, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x5, 0x0, 0x4, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int627:

P628: !_REPLACEMENT [9] (Int)
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

P629: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x36, no_int629, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x5, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x5, 0x36, 0x1, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int629:

P630: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1, no_int630, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x5, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x5, 0x1, 0x1, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int630:

P631: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3c, no_int631, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x5, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x5, 0x3c, 0x0, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int631:

P632: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1b, no_int632, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x5, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x5, 0x1b, 0x6, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int632:

P633: !_INTERRUPT (Int) (Branch target of P689)

CHECK_DISPATCH_STATUS(0x6, no_int633, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x5, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x5, 0x6, 0x3, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int633:
ba P634
nop

TARGET689:
ba RET689
nop


P634: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x0, no_int634, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x5, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x5, 0x0, 0x6, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int634:

P635: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1b, no_int635, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x5, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x5, 0x1b, 0x2, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int635:

P636: !_DWST [7] (maybe <- 0x2800003) (Int)
sllx %l4, 32, %l7 
add   %l4, 1, %l4
or %l7, %l4, %l7
stx %l7, [%i1 + 80]
add   %l4, 1, %l4

P637: !_INTERRUPT (Int) (Branch target of P694)

CHECK_DISPATCH_STATUS(0x19, no_int637, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x5, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x5, 0x19, 0x7, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int637:
ba P638
nop

TARGET694:
ba RET694
nop


P638: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0xa, no_int638, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x5, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x5, 0xa, 0x7, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int638:

P639: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x12, no_int639, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x5, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x5, 0x12, 0x6, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int639:

P640: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x13, no_int640, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x5, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x5, 0x13, 0x2, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int640:

P641: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x2c, no_int641, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x5, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x5, 0x2c, 0x4, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int641:

P642: !_INTERRUPT (Int)
! self-interrupt - discard

P643: !_INTERRUPT (Int) (CBR)
! self-interrupt - discard

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET643
nop
RET643:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P644: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x36, no_int644, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x5, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x5, 0x36, 0x0, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int644:

P645: !_INTERRUPT (Int) (Branch target of P643)

CHECK_DISPATCH_STATUS(0x6, no_int645, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x5, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x5, 0x6, 0x4, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int645:
ba P646
nop

TARGET643:
ba RET643
nop


P646: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x28, no_int646, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x5, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x5, 0x28, 0x4, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int646:

P647: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3, no_int647, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x5, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x5, 0x3, 0x6, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int647:

P648: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x18, no_int648, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x5, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x5, 0x18, 0x7, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int648:

P649: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x2, no_int649, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x5, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x5, 0x2, 0x2, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int649:

P650: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x30, no_int650, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x5, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x5, 0x30, 0x4, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int650:

P651: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x2, no_int651, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x5, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x5, 0x2, 0x0, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int651:

P652: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x6, no_int652, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x5, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x5, 0x6, 0x1, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int652:

P653: !_INTERRUPT (Int)
! self-interrupt - discard

P654: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1c, no_int654, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x5, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x5, 0x1c, 0x0, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int654:

P655: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x2f, no_int655, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x5, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x5, 0x2f, 0x2, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int655:

P656: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x2, no_int656, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x5, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x5, 0x2, 0x7, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int656:

P657: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x23, no_int657, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x5, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x5, 0x23, 0x2, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int657:

P658: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x37, no_int658, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x5, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x5, 0x37, 0x6, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int658:

P659: !_INTERRUPT (Int)
! self-interrupt - discard

P660: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x4, no_int660, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x5, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x5, 0x4, 0x0, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int660:

P661: !_INTERRUPT (Int)
! self-interrupt - discard

P662: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x34, no_int662, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x5, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x5, 0x34, 0x1, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int662:

P663: !_DWST [9] (maybe <- 0x2800005) (Int)
mov %l4, %l7 
sllx %l7, 32, %l7 
stx %l7, [%i1 + 512 ] 
add   %l4, 1, %l4

P664: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1d, no_int664, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x5, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x5, 0x1d, 0x4, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int664:

P665: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x7, no_int665, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x5, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x5, 0x7, 0x4, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int665:

P666: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x16, no_int666, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x5, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x5, 0x16, 0x0, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int666:

P667: !_INTERRUPT (Int)
! self-interrupt - discard

P668: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x17, no_int668, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x5, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x5, 0x17, 0x3, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int668:

P669: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x9, no_int669, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x5, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x5, 0x9, 0x0, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int669:

P670: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1f, no_int670, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x5, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x5, 0x1f, 0x0, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int670:

P671: !_INTERRUPT (Int) (CBR)

CHECK_DISPATCH_STATUS(0x3d, no_int671, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x5, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x5, 0x3d, 0x7, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int671:

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET671
nop
RET671:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P672: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1, no_int672, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x5, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x5, 0x1, 0x1, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int672:

P673: !_DWST [0] (maybe <- 0x2800006) (Int)
sllx %l4, 32, %l3 
add   %l4, 1, %l4
or %l3, %l4, %l3
stx %l3, [%i0 + 0]
add   %l4, 1, %l4

P674: !_INTERRUPT (Int) (CBR)

CHECK_DISPATCH_STATUS(0x11, no_int674, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x5, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x5, 0x11, 0x6, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int674:

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET674
nop
RET674:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P675: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x21, no_int675, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x5, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x5, 0x21, 0x6, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int675:

P676: !_ST [5] (maybe <- 0x2800008) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P677: !_INTERRUPT (Int) (Branch target of P679)

CHECK_DISPATCH_STATUS(0x15, no_int677, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x5, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x5, 0x15, 0x4, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int677:
ba P678
nop

TARGET679:
ba RET679
nop


P678: !_INTERRUPT (Int) (Branch target of P698)

CHECK_DISPATCH_STATUS(0x3c, no_int678, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x5, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x5, 0x3c, 0x2, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int678:
ba P679
nop

TARGET698:
ba RET698
nop


P679: !_INTERRUPT (Int) (CBR)

CHECK_DISPATCH_STATUS(0x1a, no_int679, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x5, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x5, 0x1a, 0x4, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int679:

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET679
nop
RET679:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P680: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0xa, no_int680, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x5, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x5, 0xa, 0x1, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int680:

P681: !_DWST [7] (maybe <- 0x42000001) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=21 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
std %f20, [%i1 + 80]

P682: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x33, no_int682, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x5, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x5, 0x33, 0x6, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int682:

P683: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x30, no_int683, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x5, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x5, 0x30, 0x6, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int683:

P684: !_LD [15] (FP)
ld [%i3 + 192], %f1
! 1 addresses covered

P685: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3d, no_int685, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x5, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x5, 0x3d, 0x0, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int685:

P686: !_MEMBAR (Int)
membar #StoreLoad

P687: !_LD [0] (Int)
lduw [%i0 + 0], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P688: !_LD [1] (Int)
lduw [%i0 + 4], %l3
! move %l3(lower) -> %o1(lower)
or %l3, %o1, %o1

P689: !_LD [2] (Int) (CBR)
lduw [%i0 + 12], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET689
nop
RET689:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P690: !_LD [3] (Int)
lduw [%i0 + 32], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2

P691: !_LD [4] (Int)
lduw [%i0 + 64], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P692: !_LD [5] (Int) (Branch target of P586)
lduw [%i1 + 76], %l6
! move %l6(lower) -> %o3(lower)
or %l6, %o3, %o3
ba P693
nop

TARGET586:
ba RET586
nop


P693: !_LD [6] (Int) (Branch target of P592)
lduw [%i1 + 80], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4
ba P694
nop

TARGET592:
ba RET592
nop


P694: !_LD [7] (Int) (CBR)
lduw [%i1 + 84], %l6
! move %l6(lower) -> %o4(lower)
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET694
nop
RET694:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P695: !_LD [8] (Int)
lduw [%i1 + 256], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P696: !_LD [9] (Int)
lduw [%i1 + 512], %l7
! move %l7(lower) -> %o0(lower)
or %l7, %o0, %o0

P697: !_LD [10] (Int) (LE)
wr %g0, 0x88, %asi
lduwa [%i2 + 32] %asi, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P698: !_LD [11] (Int) (CBR) (Branch target of P671)
lduw [%i2 + 64], %l7
! move %l7(lower) -> %o1(lower)
or %l7, %o1, %o1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET698
nop
RET698:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0

ba P699
nop

TARGET671:
ba RET671
nop


P699: !_LD [12] (Int)
lduw [%i3 + 0], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P700: !_LD [13] (FP) (CBR)
ld [%i3 + 64], %f2
! 1 addresses covered

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET700
nop
RET700:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P701: !_LD [14] (Int)
lduw [%i3 + 128], %l3
! move %l3(lower) -> %o2(lower)
or %l3, %o2, %o2

P702: !_LD [15] (Int)
lduw [%i3 + 192], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

END_NODES5: ! Test istream for CPU 5 ends
sethi %hi(0xdead0e0f), %o5
or    %o5, %lo(0xdead0e0f), %o5
! move %o5(lower) -> %o3(lower)
or %o5, %o3, %o3
stw %o5, [%i5] 
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

func6:
! 100 (dynamic) instruction sequence begins
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

! Initialize LFSR to 0x19dd^4
sethi %hi(0x19dd), %l0
or    %l0, %lo(0x19dd), %l0
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

P703: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3c, no_int703, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x6, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x6, 0x3c, 0x7, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int703:

P704: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x36, no_int704, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x6, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x6, 0x36, 0x4, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int704:

P705: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x39, no_int705, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x6, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x6, 0x39, 0x7, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int705:

P706: !_DWLD [12] (Int)
ldx [%i3 + 0], %o0
! move %o0(upper) -> %o0(upper)

P707: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1c, no_int707, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x6, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x6, 0x1c, 0x7, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int707:

P708: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x15, no_int708, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x6, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x6, 0x15, 0x0, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int708:

P709: !_INTERRUPT (Int)
! self-interrupt - discard

P710: !_ST [0] (maybe <- 0x3000001) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P711: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x24, no_int711, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x6, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x6, 0x24, 0x2, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int711:

P712: !_ST [11] (maybe <- 0x3000002) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P713: !_INTERRUPT (Int) (Branch target of P774)

CHECK_DISPATCH_STATUS(0x2c, no_int713, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x6, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x6, 0x2c, 0x3, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int713:
ba P714
nop

TARGET774:
ba RET774
nop


P714: !_INTERRUPT (Int) (Branch target of P773)

CHECK_DISPATCH_STATUS(0x14, no_int714, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x6, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x6, 0x14, 0x3, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int714:
ba P715
nop

TARGET773:
ba RET773
nop


P715: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x2d, no_int715, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x6, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x6, 0x2d, 0x5, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int715:

P716: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x15, no_int716, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x6, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x6, 0x15, 0x0, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int716:

P717: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x2f, no_int717, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x6, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x6, 0x2f, 0x3, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int717:

P718: !_PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P719: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x2d, no_int719, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x6, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x6, 0x2d, 0x3, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int719:

P720: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x19, no_int720, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x6, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x6, 0x19, 0x4, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int720:

P721: !_DWLD [4] (Int)
ldx [%i0 + 64], %o5
! move %o5(upper) -> %o0(lower)
srlx %o0, 32, %o0
sllx %o0, 32, %o0
srlx %o5, 32, %l7
or %l7, %o0, %o0

P722: !_DWLD [4] (Int)
ldx [%i0 + 64], %o1
! move %o1(upper) -> %o1(upper)

P723: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x2, no_int723, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x6, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x6, 0x2, 0x0, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int723:

P724: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x35, no_int724, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x6, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x6, 0x35, 0x4, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int724:

P725: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x37, no_int725, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x6, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x6, 0x37, 0x3, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int725:

P726: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x2f, no_int726, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x6, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x6, 0x2f, 0x1, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int726:

P727: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0xe, no_int727, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x6, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x6, 0xe, 0x2, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int727:

P728: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x2b, no_int728, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x6, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x6, 0x2b, 0x3, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int728:

P729: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0xb, no_int729, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x6, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x6, 0xb, 0x3, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int729:

P730: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3, no_int730, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x6, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x6, 0x3, 0x2, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int730:

P731: !_INTERRUPT (Int)
! self-interrupt - discard

P732: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x29, no_int732, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x6, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x6, 0x29, 0x5, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int732:

P733: !_INTERRUPT (Int)
! self-interrupt - discard

P734: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x30, no_int734, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x6, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x6, 0x30, 0x5, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int734:

P735: !_INTERRUPT (Int)
! self-interrupt - discard

P736: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x35, no_int736, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x6, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x6, 0x35, 0x7, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int736:

P737: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0xb, no_int737, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x6, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x6, 0xb, 0x7, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int737:

P738: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x29, no_int738, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x6, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x6, 0x29, 0x5, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int738:

P739: !_INTERRUPT (Int) (CBR)

CHECK_DISPATCH_STATUS(0x5, no_int739, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x6, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x6, 0x5, 0x4, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int739:

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET739
nop
RET739:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P740: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x0, no_int740, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x6, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x6, 0x0, 0x3, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int740:

P741: !_INTERRUPT (Int) (Branch target of P739)

CHECK_DISPATCH_STATUS(0x2, no_int741, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x6, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x6, 0x2, 0x7, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int741:
ba P742
nop

TARGET739:
ba RET739
nop


P742: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x11, no_int742, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x6, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x6, 0x11, 0x2, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int742:

P743: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x8, no_int743, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x6, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x6, 0x8, 0x7, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int743:

P744: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x26, no_int744, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x6, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x6, 0x26, 0x3, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int744:

P745: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x13, no_int745, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x6, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x6, 0x13, 0x3, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int745:

P746: !_PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P747: !_INTERRUPT (Int) (CBR)

CHECK_DISPATCH_STATUS(0x3, no_int747, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x6, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x6, 0x3, 0x4, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int747:

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET747
nop
RET747:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P748: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1f, no_int748, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x6, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x6, 0x1f, 0x5, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int748:

P749: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x2a, no_int749, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x6, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x6, 0x2a, 0x4, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int749:

P750: !_DWLD [13] (Int)
ldx [%i3 + 64], %l6
! move %l6(upper) -> %o1(lower)
srlx %o1, 32, %o1
sllx %o1, 32, %o1
srlx %l6, 32, %l3
or %l3, %o1, %o1

P751: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x22, no_int751, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x6, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x6, 0x22, 0x5, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int751:

P752: !_INTERRUPT (Int)
! self-interrupt - discard

P753: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x35, no_int753, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x6, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x6, 0x35, 0x2, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int753:

P754: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x11, no_int754, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x6, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x6, 0x11, 0x5, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int754:

P755: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x4, no_int755, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x6, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x6, 0x4, 0x2, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int755:

P756: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3e, no_int756, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x6, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x6, 0x3e, 0x4, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int756:

P757: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x9, no_int757, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x6, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x6, 0x9, 0x1, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int757:

P758: !_INTERRUPT (Int) (Branch target of P747)
! self-interrupt - discard
ba P759
nop

TARGET747:
ba RET747
nop


P759: !_INTERRUPT (Int)
! self-interrupt - discard

P760: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x38, no_int760, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x6, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x6, 0x38, 0x3, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int760:

P761: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x13, no_int761, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x6, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x6, 0x13, 0x7, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int761:

P762: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3f, no_int762, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x6, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x6, 0x3f, 0x3, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int762:

P763: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x18, no_int763, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x6, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x6, 0x18, 0x5, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int763:

P764: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x10, no_int764, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x6, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x6, 0x10, 0x2, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int764:

P765: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3a, no_int765, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x6, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x6, 0x3a, 0x5, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int765:

P766: !_INTERRUPT (Int)
! self-interrupt - discard

P767: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x34, no_int767, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x6, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x6, 0x34, 0x5, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int767:

P768: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x4, no_int768, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x6, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x6, 0x4, 0x3, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int768:

P769: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x24, no_int769, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x6, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x6, 0x24, 0x5, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int769:

P770: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x14, no_int770, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x6, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x6, 0x14, 0x3, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int770:

P771: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3c, no_int771, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x6, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x6, 0x3c, 0x0, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int771:

P772: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1e, no_int772, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x6, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x6, 0x1e, 0x5, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int772:

P773: !_INTERRUPT (Int) (CBR)

CHECK_DISPATCH_STATUS(0x7, no_int773, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x6, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x6, 0x7, 0x4, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int773:

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET773
nop
RET773:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P774: !_INTERRUPT (Int) (CBR)

CHECK_DISPATCH_STATUS(0x35, no_int774, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x6, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x6, 0x35, 0x0, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int774:

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET774
nop
RET774:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P775: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1c, no_int775, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x6, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x6, 0x1c, 0x0, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int775:

P776: !_INTERRUPT (Int)
! self-interrupt - discard

P777: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x28, no_int777, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x6, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x6, 0x28, 0x2, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int777:

P778: !_INTERRUPT (Int) (Branch target of P786)

CHECK_DISPATCH_STATUS(0x32, no_int778, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x6, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x6, 0x32, 0x3, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int778:
ba P779
nop

TARGET786:
ba RET786
nop


P779: !_DWLD [4] (Int)
ldx [%i0 + 64], %o2
! move %o2(upper) -> %o2(upper)

P780: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x12, no_int780, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x6, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x6, 0x12, 0x1, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int780:

P781: !_REPLACEMENT [15] (Int) (CBR)
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

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET781
nop
RET781:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P782: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x37, no_int782, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x6, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x6, 0x37, 0x1, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int782:

P783: !_DWLD [6] (Int)
ldx [%i1 + 80], %o5
! move %o5(upper) -> %o2(lower)
srlx %o2, 32, %o2
sllx %o2, 32, %o2
srlx %o5, 32, %l7
or %l7, %o2, %o2
! move %o5(lower) -> %o3(upper)
sllx %o5, 32, %o3

P784: !_PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P785: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x20, no_int785, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x6, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x6, 0x20, 0x3, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int785:

P786: !_INTERRUPT (Int) (CBR)
! self-interrupt - discard

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET786
nop
RET786:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P787: !_INTERRUPT (Int)
! self-interrupt - discard

P788: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3d, no_int788, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x6, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x6, 0x3d, 0x5, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int788:

P789: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x30, no_int789, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x6, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x6, 0x30, 0x1, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int789:

P790: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0xa, no_int790, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x6, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x6, 0xa, 0x2, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int790:

P791: !_INTERRUPT (Int) (Branch target of P799)

CHECK_DISPATCH_STATUS(0x1c, no_int791, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x6, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x6, 0x1c, 0x5, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int791:
ba P792
nop

TARGET799:
ba RET799
nop


P792: !_INTERRUPT (Int)
! self-interrupt - discard

P793: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x39, no_int793, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x6, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x6, 0x39, 0x1, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int793:

P794: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x25, no_int794, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x6, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x6, 0x25, 0x4, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int794:

P795: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x7, no_int795, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x6, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x6, 0x7, 0x0, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int795:

P796: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1f, no_int796, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x6, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x6, 0x1f, 0x2, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int796:

P797: !_INTERRUPT (Int)
! self-interrupt - discard

P798: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x16, no_int798, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x6, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x6, 0x16, 0x4, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int798:

P799: !_INTERRUPT (Int) (CBR)
! self-interrupt - discard

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET799
nop
RET799:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P800: !_INTERRUPT (Int) (Branch target of P781)
! self-interrupt - discard
ba P801
nop

TARGET781:
ba RET781
nop


P801: !_INTERRUPT (Int)
! self-interrupt - discard

P802: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x2f, no_int802, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x6, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x6, 0x2f, 0x2, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int802:

P803: !_MEMBAR (Int)
membar #StoreLoad

P804: !_LD [0] (Int)
lduw [%i0 + 0], %o5
! move %o5(lower) -> %o3(lower)
or %o5, %o3, %o3

P805: !_LD [1] (Int)
lduw [%i0 + 4], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P806: !_LD [2] (Int)
lduw [%i0 + 12], %o5
! move %o5(lower) -> %o4(lower)
or %o5, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P807: !_LD [3] (FP)
ld [%i0 + 32], %f0
! 1 addresses covered

P808: !_LD [4] (Int)
lduw [%i0 + 64], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P809: !_LD [5] (Int) (LE)
wr %g0, 0x88, %asi
lduwa [%i1 + 76] %asi, %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0

P810: !_LD [6] (Int)
lduw [%i1 + 80], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P811: !_LD [7] (Int)
lduw [%i1 + 84], %o5
! move %o5(lower) -> %o1(lower)
or %o5, %o1, %o1

P812: !_LD [8] (Int)
lduw [%i1 + 256], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P813: !_LD [9] (Int)
lduw [%i1 + 512], %o5
! move %o5(lower) -> %o2(lower)
or %o5, %o2, %o2

P814: !_LD [10] (Int)
lduw [%i2 + 32], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P815: !_LD [11] (Int)
lduw [%i2 + 64], %o5
! move %o5(lower) -> %o3(lower)
or %o5, %o3, %o3

P816: !_LD [12] (Int)
lduw [%i3 + 0], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P817: !_LD [13] (Int)
lduw [%i3 + 64], %o5
! move %o5(lower) -> %o4(lower)
or %o5, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P818: !_LD [14] (Int)
lduw [%i3 + 128], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P819: !_LD [15] (Int)
lduw [%i3 + 192], %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0

END_NODES6: ! Test istream for CPU 6 ends
sethi %hi(0xdead0e0f), %l3
or    %l3, %lo(0xdead0e0f), %l3
! move %l3(lower) -> %o1(upper)
sllx %l3, 32, %o1
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
! 100 (dynamic) instruction sequence begins
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

! Initialize LFSR to 0x662f^4
sethi %hi(0x662f), %l0
or    %l0, %lo(0x662f), %l0
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

P820: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1c, no_int820, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x7, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x7, 0x1c, 0x1, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int820:

P821: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x27, no_int821, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x7, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x7, 0x27, 0x3, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int821:

P822: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3d, no_int822, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x7, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x7, 0x3d, 0x2, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int822:

P823: !_INTERRUPT (Int) (CBR)

CHECK_DISPATCH_STATUS(0x22, no_int823, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x7, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x7, 0x22, 0x5, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int823:

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET823
nop
RET823:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P824: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1f, no_int824, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x7, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x7, 0x1f, 0x4, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int824:

P825: !_INTERRUPT (Int)
! self-interrupt - discard

P826: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3a, no_int826, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x7, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x7, 0x3a, 0x4, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int826:

P827: !_INTERRUPT (Int) (Branch target of P876)

CHECK_DISPATCH_STATUS(0x24, no_int827, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x7, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x7, 0x24, 0x5, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int827:
ba P828
nop

TARGET876:
ba RET876
nop


P828: !_NOP (Int)
nop

P829: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x35, no_int829, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x7, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x7, 0x35, 0x6, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int829:

P830: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x2, no_int830, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x7, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x7, 0x2, 0x0, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int830:

P831: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3e, no_int831, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x7, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x7, 0x3e, 0x4, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int831:

P832: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0xc, no_int832, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x7, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x7, 0xc, 0x6, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int832:

P833: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x24, no_int833, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x7, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x7, 0x24, 0x3, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int833:

P834: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x36, no_int834, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x7, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x7, 0x36, 0x3, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int834:

P835: !_INTERRUPT (Int)
! self-interrupt - discard

P836: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1d, no_int836, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x7, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x7, 0x1d, 0x5, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int836:

P837: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x36, no_int837, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x7, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x7, 0x36, 0x0, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int837:

P838: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x12, no_int838, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x7, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x7, 0x12, 0x0, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int838:

P839: !_INTERRUPT (Int)
! self-interrupt - discard

P840: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x2, no_int840, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x7, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x7, 0x2, 0x1, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int840:

P841: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x20, no_int841, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x7, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x7, 0x20, 0x3, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int841:

P842: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x14, no_int842, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x7, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x7, 0x14, 0x0, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int842:

P843: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3c, no_int843, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x7, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x7, 0x3c, 0x5, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int843:

P844: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3a, no_int844, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x7, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x7, 0x3a, 0x4, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int844:

P845: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x29, no_int845, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x7, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x7, 0x29, 0x4, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int845:

P846: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0xa, no_int846, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x7, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x7, 0xa, 0x4, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int846:

P847: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x6, no_int847, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x7, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x7, 0x6, 0x6, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int847:

P848: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x28, no_int848, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x7, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x7, 0x28, 0x4, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int848:

P849: !_INTERRUPT (Int)
! self-interrupt - discard

P850: !_ST [15] (maybe <- 0x3800001) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P851: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x11, no_int851, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x7, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x7, 0x11, 0x4, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int851:

P852: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x2a, no_int852, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x7, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x7, 0x2a, 0x4, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int852:

P853: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x2d, no_int853, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x7, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x7, 0x2d, 0x6, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int853:

P854: !_DWST [0] (maybe <- 0x43000001) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=21 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
std %f20, [%i0 + 0]

P855: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x23, no_int855, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x7, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x7, 0x23, 0x0, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int855:

P856: !_INTERRUPT (Int)
! self-interrupt - discard

P857: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x22, no_int857, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x7, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x7, 0x22, 0x2, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int857:

P858: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3d, no_int858, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x7, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x7, 0x3d, 0x5, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int858:

P859: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0xf, no_int859, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x7, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x7, 0xf, 0x1, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int859:

P860: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x21, no_int860, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x7, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x7, 0x21, 0x6, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int860:

P861: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x22, no_int861, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x7, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x7, 0x22, 0x0, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int861:

P862: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0xb, no_int862, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x7, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x7, 0xb, 0x4, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int862:

P863: !_DWLD [2] (Int)
ldx [%i0 + 8], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P864: !_INTERRUPT (Int) (Branch target of P909)

CHECK_DISPATCH_STATUS(0x1e, no_int864, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x7, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x7, 0x1e, 0x5, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int864:
ba P865
nop

TARGET909:
ba RET909
nop


P865: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x0, no_int865, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x7, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x7, 0x0, 0x6, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int865:

P866: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x19, no_int866, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x7, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x7, 0x19, 0x5, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int866:

P867: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0xb, no_int867, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x7, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x7, 0xb, 0x3, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int867:

P868: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x15, no_int868, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x7, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x7, 0x15, 0x2, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int868:

P869: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3d, no_int869, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x7, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x7, 0x3d, 0x3, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int869:

P870: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1d, no_int870, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x7, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x7, 0x1d, 0x0, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int870:

P871: !_INTERRUPT (Int) (CBR)

CHECK_DISPATCH_STATUS(0x24, no_int871, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x7, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x7, 0x24, 0x6, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int871:

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET871
nop
RET871:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P872: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x18, no_int872, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x7, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x7, 0x18, 0x4, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int872:

P873: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1e, no_int873, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x7, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x7, 0x1e, 0x4, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int873:

P874: !_INTERRUPT (Int) (Branch target of P823)

CHECK_DISPATCH_STATUS(0x12, no_int874, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x7, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x7, 0x12, 0x5, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int874:
ba P875
nop

TARGET823:
ba RET823
nop


P875: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3, no_int875, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x7, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x7, 0x3, 0x0, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int875:

P876: !_INTERRUPT (Int) (CBR)

CHECK_DISPATCH_STATUS(0x0, no_int876, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x7, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x7, 0x0, 0x1, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int876:

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET876
nop
RET876:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P877: !_DWLD [3] (Int)
ldx [%i0 + 32], %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l3
or %l3, %o0, %o0

P878: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x24, no_int878, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x7, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x7, 0x24, 0x5, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int878:

P879: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x26, no_int879, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x7, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x7, 0x26, 0x4, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int879:

P880: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1f, no_int880, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x7, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x7, 0x1f, 0x6, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int880:

P881: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x21, no_int881, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x7, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x7, 0x21, 0x5, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int881:

P882: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1c, no_int882, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x7, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x7, 0x1c, 0x1, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int882:

P883: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x9, no_int883, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x7, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x7, 0x9, 0x6, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int883:

P884: !_INTERRUPT (Int)
! self-interrupt - discard

P885: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x28, no_int885, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x7, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x7, 0x28, 0x3, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int885:

P886: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x31, no_int886, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x7, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x7, 0x31, 0x5, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int886:

P887: !_INTERRUPT (Int)
! self-interrupt - discard

P888: !_INTERRUPT (Int)
! self-interrupt - discard

P889: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x5, no_int889, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x7, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x7, 0x5, 0x1, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int889:

P890: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x16, no_int890, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x7, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x7, 0x16, 0x0, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int890:

P891: !_REPLACEMENT [11] (Int)
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

P892: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x10, no_int892, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x7, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x7, 0x10, 0x6, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int892:

P893: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x22, no_int893, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x7, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x7, 0x22, 0x6, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int893:

P894: !_INTERRUPT (Int) (Branch target of P871)
! self-interrupt - discard
ba P895
nop

TARGET871:
ba RET871
nop


P895: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1a, no_int895, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x7, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x7, 0x1a, 0x0, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int895:

P896: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0xf, no_int896, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x7, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x7, 0xf, 0x6, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int896:

P897: !_INTERRUPT (Int)
! self-interrupt - discard

P898: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0xc, no_int898, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x7, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x7, 0xc, 0x5, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int898:

P899: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3f, no_int899, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x7, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x7, 0x3f, 0x3, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int899:

P900: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1f, no_int900, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x7, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x7, 0x1f, 0x5, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int900:

P901: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x20, no_int901, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x7, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x7, 0x20, 0x4, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int901:

P902: !_PREFETCH [11] (Int)
prefetch [%i2 + 64], 1

P903: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3a, no_int903, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x7, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x7, 0x3a, 0x0, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int903:

P904: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x2f, no_int904, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x7, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x7, 0x2f, 0x5, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int904:

P905: !_MEMBAR (Int)
membar #StoreLoad

P906: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x33, no_int906, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x7, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x7, 0x33, 0x5, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int906:

P907: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3d, no_int907, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x7, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x7, 0x3d, 0x3, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int907:

P908: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x17, no_int908, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x7, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x7, 0x17, 0x5, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int908:

P909: !_INTERRUPT (Int) (CBR)

CHECK_DISPATCH_STATUS(0x33, no_int909, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x7, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x7, 0x33, 0x4, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int909:

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET909
nop
RET909:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P910: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x17, no_int910, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x7, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x7, 0x17, 0x2, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int910:

P911: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x24, no_int911, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x7, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x7, 0x24, 0x4, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int911:

P912: !_INTERRUPT (Int)
! self-interrupt - discard

P913: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x33, no_int913, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x7, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x7, 0x33, 0x2, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int913:

P914: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1e, no_int914, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x7, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x7, 0x1e, 0x4, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int914:

P915: !_DWLD [3] (Int)
ldx [%i0 + 32], %o1
! move %o1(upper) -> %o1(upper)

P916: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x5, no_int916, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x7, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x7, 0x5, 0x3, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int916:

P917: !_INTERRUPT (Int) (CBR)

CHECK_DISPATCH_STATUS(0x28, no_int917, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x7, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x7, 0x28, 0x4, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int917:

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET917
nop
RET917:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P918: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x20, no_int918, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x7, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x7, 0x20, 0x4, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int918:

P919: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1c, no_int919, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x7, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x7, 0x1c, 0x2, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int919:

P920: !_MEMBAR (Int)
membar #StoreLoad

P921: !_LD [0] (Int) (LE)
wr %g0, 0x88, %asi
lduwa [%i0 + 0] %asi, %l7
! move %l7(lower) -> %o1(lower)
srlx %o1, 32, %o1
sllx %o1, 32, %o1
or %l7, %o1, %o1

P922: !_LD [1] (Int)
lduw [%i0 + 4], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P923: !_LD [2] (Int) (Branch target of P917)
lduw [%i0 + 12], %l7
! move %l7(lower) -> %o2(lower)
or %l7, %o2, %o2
ba P924
nop

TARGET917:
ba RET917
nop


P924: !_LD [3] (Int)
lduw [%i0 + 32], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P925: !_LD [4] (Int)
lduw [%i0 + 64], %l7
! move %l7(lower) -> %o3(lower)
or %l7, %o3, %o3

P926: !_LD [5] (Int)
lduw [%i1 + 76], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P927: !_LD [6] (Int)
lduw [%i1 + 80], %l7
! move %l7(lower) -> %o4(lower)
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P928: !_LD [7] (Int)
lduw [%i1 + 84], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P929: !_LD [8] (Int)
lduw [%i1 + 256], %l7
! move %l7(lower) -> %o0(lower)
or %l7, %o0, %o0

P930: !_LD [9] (Int)
lduw [%i1 + 512], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P931: !_LD [10] (Int)
lduw [%i2 + 32], %l7
! move %l7(lower) -> %o1(lower)
or %l7, %o1, %o1

P932: !_LD [11] (Int)
lduw [%i2 + 64], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P933: !_LD [12] (Int) (LE)
wr %g0, 0x88, %asi
lduwa [%i3 + 0] %asi, %l7
! move %l7(lower) -> %o2(lower)
or %l7, %o2, %o2

P934: !_LD [13] (Int)
lduw [%i3 + 64], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P935: !_LD [14] (FP)
ld [%i3 + 128], %f0
! 1 addresses covered

P936: !_LD [15] (Int)
lduw [%i3 + 192], %l7
! move %l7(lower) -> %o3(lower)
or %l7, %o3, %o3

END_NODES7: ! Test istream for CPU 7 ends
sethi %hi(0xdead0e0f), %o5
or    %o5, %lo(0xdead0e0f), %o5
! move %o5(lower) -> %o4(upper)
sllx %o5, 32, %o4
stw %o5, [%i5] 
ld [%i5], %f1
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5
!---- flushing fp results buffer to %f30 ----
fmovd %f0, %f30

restore
retl
nop

