// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tsotool_diag12_int_071603.s
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
! WT.SWAP 3
! WT.CAS 5
! WT.CASX 5
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
! GEN.SEED 1


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
!	stda    %l6, [$8] (0x22 | ($2 & 0x9)) ! ASI is randomly set
!===========
define(BST_INIT, `
	add     $6, ($7 & 0xfff0), $8	! 4-byte align the offset
	stda    %l6, [$8] 0x22		! ASI is randomly set
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

! Initialize LFSR to 0x27c2^4
sethi %hi(0x27c2), %l0
or    %l0, %lo(0x27c2), %l0
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

CHECK_DISPATCH_STATUS(0x3b, no_int1, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x0, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x0, 0x3b, 0x1, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int1:

P2: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x6, no_int2, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x0, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x0, 0x6, 0x4, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int2:

P3: !_INTERRUPT (Int)
! self-interrupt - discard

P4: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x20, no_int4, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x0, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x0, 0x20, 0x5, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int4:

P5: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3c, no_int5, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x0, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x0, 0x3c, 0x7, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int5:

P6: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0xe, no_int6, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x0, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x0, 0xe, 0x3, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int6:

P7: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0xf, no_int7, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x0, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x0, 0xf, 0x6, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int7:

P8: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x30, no_int8, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x0, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x0, 0x30, 0x7, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int8:

P9: !_INTERRUPT (Int) (CBR)

CHECK_DISPATCH_STATUS(0x2c, no_int9, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x0, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x0, 0x2c, 0x6, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int9:

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET9
nop
RET9:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P10: !_INTERRUPT (Int)
! self-interrupt - discard

P11: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x32, no_int11, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x0, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x0, 0x32, 0x2, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int11:

P12: !_PREFETCH [10] (Int)
prefetch [%i2 + 32], 1

P13: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x30, no_int13, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x0, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x0, 0x30, 0x5, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int13:

P14: !_INTERRUPT (Int)
! self-interrupt - discard

P15: !_CAS [5] (maybe <- 0x1) (Int)
add %i1, 76, %l6
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

P16: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1e, no_int16, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x0, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x0, 0x1e, 0x5, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int16:

P17: !_DWST [5] (maybe <- 0x2) (Int)
mov %l4, %l7 
stx %l7, [%i1 + 72]
add   %l4, 1, %l4

P18: !_INTERRUPT (Int)
! self-interrupt - discard

P19: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0xd, no_int19, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x0, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x0, 0xd, 0x2, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int19:

P20: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x24, no_int20, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x0, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x0, 0x24, 0x7, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int20:

P21: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3a, no_int21, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x0, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x0, 0x3a, 0x4, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int21:

P22: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x2, no_int22, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x0, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x0, 0x2, 0x1, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int22:

P23: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x6, no_int23, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x0, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x0, 0x6, 0x5, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int23:

P24: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1e, no_int24, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x0, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x0, 0x1e, 0x2, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int24:

P25: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x29, no_int25, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x0, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x0, 0x29, 0x5, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int25:

P26: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3b, no_int26, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x0, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x0, 0x3b, 0x2, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int26:

P27: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3d, no_int27, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x0, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x0, 0x3d, 0x2, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int27:

P28: !_INTERRUPT (Int)
! self-interrupt - discard

P29: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x2f, no_int29, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x0, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x0, 0x2f, 0x1, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int29:

P30: !_MEMBAR (Int)
membar #StoreLoad

P31: !_REPLACEMENT [7] (Int)
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

P32: !_INTERRUPT (Int) (Branch target of P9)

CHECK_DISPATCH_STATUS(0x1f, no_int32, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x0, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x0, 0x1f, 0x1, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int32:
ba P33
nop

TARGET9:
ba RET9
nop


P33: !_CASX [4] (maybe <- 0x3) (Int)
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

P34: !_REPLACEMENT [8] (Int)
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

P35: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x8, no_int35, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x0, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x0, 0x8, 0x5, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int35:

P36: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x18, no_int36, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x0, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x0, 0x18, 0x5, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int36:

P37: !_DWLD [6] (Int)
ldx [%i1 + 80], %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)

P38: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1d, no_int38, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x0, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x0, 0x1d, 0x3, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int38:

P39: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x26, no_int39, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x0, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x0, 0x26, 0x2, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int39:

P40: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3a, no_int40, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x0, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x0, 0x3a, 0x4, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int40:

P41: !_CASX [9] (maybe <- 0x4) (Int) (Branch target of P52)
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
ba P42
nop

TARGET52:
ba RET52
nop


P42: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x2c, no_int42, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x0, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x0, 0x2c, 0x7, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int42:

P43: !_INTERRUPT (Int)
! self-interrupt - discard

P44: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3b, no_int44, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x0, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x0, 0x3b, 0x3, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int44:

P45: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x2b, no_int45, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x0, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x0, 0x2b, 0x6, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int45:

P46: !_INTERRUPT (Int) (CBR)

CHECK_DISPATCH_STATUS(0x36, no_int46, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x0, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x0, 0x36, 0x7, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int46:

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET46
nop
RET46:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P47: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1c, no_int47, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x0, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x0, 0x1c, 0x7, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int47:

P48: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1d, no_int48, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x0, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x0, 0x1d, 0x5, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int48:

P49: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x24, no_int49, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x0, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x0, 0x24, 0x5, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int49:

P50: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x5, no_int50, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x0, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x0, 0x5, 0x1, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int50:

P51: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x12, no_int51, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x0, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x0, 0x12, 0x2, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int51:

P52: !_INTERRUPT (Int) (CBR)

CHECK_DISPATCH_STATUS(0x32, no_int52, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x0, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x0, 0x32, 0x7, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int52:

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET52
nop
RET52:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P53: !_DWST [1] (maybe <- 0x5) (Int)
sllx %l4, 32, %l6 
add   %l4, 1, %l4
or %l6, %l4, %l6
stx %l6, [%i0 + 0]
add   %l4, 1, %l4

P54: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x2e, no_int54, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x0, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x0, 0x2e, 0x7, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int54:

P55: !_INTERRUPT (Int) (CBR)

CHECK_DISPATCH_STATUS(0x1, no_int55, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x0, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x0, 0x1, 0x3, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int55:

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET55
nop
RET55:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P56: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3a, no_int56, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x0, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x0, 0x3a, 0x3, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int56:

P57: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x14, no_int57, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x0, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x0, 0x14, 0x2, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int57:

P58: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x37, no_int58, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x0, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x0, 0x37, 0x4, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int58:

P59: !_INTERRUPT (Int) (Branch target of P117)

CHECK_DISPATCH_STATUS(0x8, no_int59, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x0, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x0, 0x8, 0x6, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int59:
ba P60
nop

TARGET117:
ba RET117
nop


P60: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x15, no_int60, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x0, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x0, 0x15, 0x6, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int60:

P61: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1b, no_int61, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x0, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x0, 0x1b, 0x4, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int61:

P62: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3e, no_int62, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x0, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x0, 0x3e, 0x6, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int62:

P63: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x36, no_int63, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x0, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x0, 0x36, 0x7, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int63:

P64: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x10, no_int64, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x0, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x0, 0x10, 0x2, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int64:

P65: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x15, no_int65, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x0, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x0, 0x15, 0x5, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int65:

P66: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x4, no_int66, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x0, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x0, 0x4, 0x5, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int66:

P67: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0xf, no_int67, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x0, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x0, 0xf, 0x1, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int67:

P68: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x22, no_int68, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x0, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x0, 0x22, 0x5, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int68:

P69: !_DWST [4] (maybe <- 0x7) (Int)
mov %l4, %o5 
sllx %o5, 32, %o5 
stx %o5, [%i0 + 64 ] 
add   %l4, 1, %l4

P70: !_ST [6] (maybe <- 0x8) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P71: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x24, no_int71, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x0, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x0, 0x24, 0x5, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int71:

P72: !_INTERRUPT (Int) (Branch target of P55)

CHECK_DISPATCH_STATUS(0x27, no_int72, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x0, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x0, 0x27, 0x5, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int72:
ba P73
nop

TARGET55:
ba RET55
nop


P73: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x9, no_int73, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x0, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x0, 0x9, 0x2, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int73:

P74: !_INTERRUPT (Int)
! self-interrupt - discard

P75: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x22, no_int75, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x0, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x0, 0x22, 0x2, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int75:

P76: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x34, no_int76, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x0, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x0, 0x34, 0x2, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int76:

P77: !_ST [9] (maybe <- 0x9) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P78: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x14, no_int78, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x0, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x0, 0x14, 0x1, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int78:

P79: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x13, no_int79, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x0, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x0, 0x13, 0x3, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int79:

P80: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x2d, no_int80, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x0, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x0, 0x2d, 0x5, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int80:

P81: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x10, no_int81, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x0, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x0, 0x10, 0x7, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int81:

P82: !_INTERRUPT (Int)
! self-interrupt - discard

P83: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x2d, no_int83, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x0, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x0, 0x2d, 0x6, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int83:

P84: !_INTERRUPT (Int) (Branch target of P46)

CHECK_DISPATCH_STATUS(0x32, no_int84, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x0, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x0, 0x32, 0x6, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int84:
ba P85
nop

TARGET46:
ba RET46
nop


P85: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x36, no_int85, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x0, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x0, 0x36, 0x3, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int85:

P86: !_INTERRUPT (Int)
! self-interrupt - discard

P87: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x2d, no_int87, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x0, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x0, 0x2d, 0x7, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int87:

P88: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x18, no_int88, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x0, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x0, 0x18, 0x7, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int88:

P89: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3, no_int89, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x0, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x0, 0x3, 0x1, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int89:

P90: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x21, no_int90, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x0, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x0, 0x21, 0x6, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int90:

P91: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1d, no_int91, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x0, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x0, 0x1d, 0x4, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int91:

P92: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0xa, no_int92, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x0, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x0, 0xa, 0x6, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int92:

P93: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x2c, no_int93, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x0, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x0, 0x2c, 0x5, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int93:

P94: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x8, no_int94, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x0, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x0, 0x8, 0x3, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int94:

P95: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0xb, no_int95, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x0, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x0, 0xb, 0x1, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int95:

P96: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1b, no_int96, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x0, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x0, 0x1b, 0x5, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int96:

P97: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x36, no_int97, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x0, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x0, 0x36, 0x7, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int97:

P98: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x2c, no_int98, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x0, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x0, 0x2c, 0x4, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int98:

P99: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0xd, no_int99, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x0, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x0, 0xd, 0x6, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int99:

P100: !_INTERRUPT (Int)
! self-interrupt - discard

P101: !_MEMBAR (Int)
membar #StoreLoad

P102: !_LD [0] (FP)
ld [%i0 + 0], %f0
! 1 addresses covered

P103: !_LD [1] (Int)
lduw [%i0 + 4], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P104: !_LD [2] (Int)
lduw [%i0 + 12], %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1

P105: !_LD [3] (Int) (LE)
wr %g0, 0x88, %asi
lduwa [%i0 + 32] %asi, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P106: !_LD [4] (Int)
lduw [%i0 + 64], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2

P107: !_LD [5] (Int)
lduw [%i1 + 76], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P108: !_LD [6] (Int)
lduw [%i1 + 80], %l6
! move %l6(lower) -> %o3(lower)
or %l6, %o3, %o3

P109: !_LD [7] (Int)
lduw [%i1 + 84], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P110: !_LD [8] (Int)
lduw [%i1 + 256], %l6
! move %l6(lower) -> %o4(lower)
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P111: !_LD [9] (Int)
lduw [%i1 + 512], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P112: !_LD [10] (Int)
lduw [%i2 + 32], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

P113: !_LD [11] (Int)
lduw [%i2 + 64], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P114: !_LD [12] (Int)
lduw [%i3 + 0], %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1

P115: !_LD [13] (Int)
lduw [%i3 + 64], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P116: !_LD [14] (Int)
lduw [%i3 + 128], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2

P117: !_LD [15] (Int) (CBR)
lduw [%i3 + 192], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET117
nop
RET117:

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
ld [%i5], %f1
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

! Initialize LFSR to 0x4c5c^4
sethi %hi(0x4c5c), %l0
or    %l0, %lo(0x4c5c), %l0
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

P118: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1d, no_int118, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x1, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x1, 0x1d, 0x6, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int118:

P119: !_REPLACEMENT [8] (Int)
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

P120: !_CAS [1] (maybe <- 0x800001) (Int)
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

P121: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0xb, no_int121, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x1, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x1, 0xb, 0x3, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int121:

P122: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x38, no_int122, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x1, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x1, 0x38, 0x5, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int122:

P123: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3c, no_int123, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x1, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x1, 0x3c, 0x2, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int123:

P124: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x15, no_int124, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x1, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x1, 0x15, 0x5, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int124:

P125: !_PREFETCH [14] (Int)
prefetch [%i3 + 128], 1

P126: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x14, no_int126, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x1, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x1, 0x14, 0x4, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int126:

P127: !_INTERRUPT (Int)
! self-interrupt - discard

P128: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x38, no_int128, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x1, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x1, 0x38, 0x4, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int128:

P129: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x8, no_int129, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x1, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x1, 0x8, 0x7, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int129:

P130: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x33, no_int130, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x1, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x1, 0x33, 0x0, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int130:

P131: !_PREFETCH [9] (Int)
prefetch [%i1 + 512], 1

P132: !_ST [12] (maybe <- 0x800002) (Int)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P133: !_INTERRUPT (Int) (CBR) (Branch target of P217)

CHECK_DISPATCH_STATUS(0xf, no_int133, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x1, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x1, 0xf, 0x3, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int133:

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET133
nop
RET133:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0

ba P134
nop

TARGET217:
ba RET217
nop


P134: !_INTERRUPT (Int)
! self-interrupt - discard

P135: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1a, no_int135, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x1, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x1, 0x1a, 0x0, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int135:

P136: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x29, no_int136, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x1, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x1, 0x29, 0x7, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int136:

P137: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x18, no_int137, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x1, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x1, 0x18, 0x6, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int137:

P138: !_INTERRUPT (Int) (Branch target of P133)

CHECK_DISPATCH_STATUS(0xd, no_int138, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x1, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x1, 0xd, 0x4, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int138:
ba P139
nop

TARGET133:
ba RET133
nop


P139: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0xb, no_int139, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x1, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x1, 0xb, 0x3, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int139:

P140: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0xb, no_int140, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x1, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x1, 0xb, 0x4, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int140:

P141: !_PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P142: !_INTERRUPT (Int)
! self-interrupt - discard

P143: !_INTERRUPT (Int) (Branch target of P183)
! self-interrupt - discard
ba P144
nop

TARGET183:
ba RET183
nop


P144: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x5, no_int144, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x1, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x1, 0x5, 0x7, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int144:

P145: !_INTERRUPT (Int) (CBR)

CHECK_DISPATCH_STATUS(0x4, no_int145, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x1, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x1, 0x4, 0x2, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int145:

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET145
nop
RET145:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P146: !_DWST [8] (maybe <- 0x800003) (Int) (CBR)
mov %l4, %l3 
sllx %l3, 32, %l3 
stx %l3, [%i1 + 256 ] 
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET146
nop
RET146:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P147: !_REPLACEMENT [9] (Int)
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

P148: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x2b, no_int148, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x1, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x1, 0x2b, 0x7, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int148:

P149: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x4, no_int149, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x1, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x1, 0x4, 0x6, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int149:

P150: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3a, no_int150, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x1, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x1, 0x3a, 0x3, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int150:

P151: !_INTERRUPT (Int) (CBR)

CHECK_DISPATCH_STATUS(0x30, no_int151, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x1, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x1, 0x30, 0x0, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int151:

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET151
nop
RET151:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P152: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0xf, no_int152, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x1, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x1, 0xf, 0x7, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int152:

P153: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x2a, no_int153, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x1, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x1, 0x2a, 0x5, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int153:

P154: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x28, no_int154, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x1, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x1, 0x28, 0x7, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int154:

P155: !_INTERRUPT (Int) (Branch target of P232)

CHECK_DISPATCH_STATUS(0x22, no_int155, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x1, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x1, 0x22, 0x0, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int155:
ba P156
nop

TARGET232:
ba RET232
nop


P156: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3d, no_int156, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x1, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x1, 0x3d, 0x7, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int156:

P157: !_MEMBAR (Int)
membar #StoreLoad

P158: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x2a, no_int158, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x1, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x1, 0x2a, 0x5, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int158:

P159: !_INTERRUPT (Int) (Branch target of P171)

CHECK_DISPATCH_STATUS(0x2d, no_int159, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x1, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x1, 0x2d, 0x2, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int159:
ba P160
nop

TARGET171:
ba RET171
nop


P160: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1b, no_int160, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x1, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x1, 0x1b, 0x5, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int160:

P161: !_DWST [9] (maybe <- 0x800004) (Int)
mov %l4, %l3 
sllx %l3, 32, %l3 
stx %l3, [%i1 + 512 ] 
add   %l4, 1, %l4

P162: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0xd, no_int162, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x1, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x1, 0xd, 0x5, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int162:

P163: !_INTERRUPT (Int)
! self-interrupt - discard

P164: !_INTERRUPT (Int)
! self-interrupt - discard

P165: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x15, no_int165, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x1, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x1, 0x15, 0x3, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int165:

P166: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x29, no_int166, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x1, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x1, 0x29, 0x6, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int166:

P167: !_INTERRUPT (Int)
! self-interrupt - discard

P168: !_CASX [7] (maybe <- 0x800005) (Int)
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

P169: !_MEMBAR (Int)
membar #StoreLoad

P170: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x36, no_int170, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x1, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x1, 0x36, 0x3, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int170:

P171: !_INTERRUPT (Int) (CBR)

CHECK_DISPATCH_STATUS(0x1, no_int171, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x1, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x1, 0x1, 0x7, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int171:

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET171
nop
RET171:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P172: !_INTERRUPT (Int)
! self-interrupt - discard

P173: !_MEMBAR (Int)
membar #StoreLoad

P174: !_DWST [12] (maybe <- 0x800007) (Int)
mov %l4, %l7 
sllx %l7, 32, %l7 
stx %l7, [%i3 + 0 ] 
add   %l4, 1, %l4

P175: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x17, no_int175, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x1, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x1, 0x17, 0x4, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int175:

P176: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x30, no_int176, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x1, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x1, 0x30, 0x3, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int176:

P177: !_PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P178: !_INTERRUPT (Int)
! self-interrupt - discard

P179: !_MEMBAR (Int) (Branch target of P151)
membar #StoreLoad
ba P180
nop

TARGET151:
ba RET151
nop


P180: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x2f, no_int180, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x1, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x1, 0x2f, 0x6, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int180:

P181: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x12, no_int181, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x1, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x1, 0x12, 0x0, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int181:

P182: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x13, no_int182, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x1, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x1, 0x13, 0x4, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int182:

P183: !_INTERRUPT (Int) (CBR)

CHECK_DISPATCH_STATUS(0x1a, no_int183, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x1, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x1, 0x1a, 0x7, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int183:

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET183
nop
RET183:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P184: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x26, no_int184, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x1, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x1, 0x26, 0x2, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int184:

P185: !_CASX [5] (maybe <- 0x800008) (Int)
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

P186: !_REPLACEMENT [3] (Int)
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

P187: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x39, no_int187, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x1, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x1, 0x39, 0x5, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int187:

P188: !_ST [11] (maybe <- 0x800009) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P189: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0xf, no_int189, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x1, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x1, 0xf, 0x7, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int189:

P190: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x17, no_int190, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x1, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x1, 0x17, 0x7, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int190:

P191: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3b, no_int191, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x1, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x1, 0x3b, 0x7, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int191:

P192: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x0, no_int192, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x1, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x1, 0x0, 0x6, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int192:

P193: !_INTERRUPT (Int)
! self-interrupt - discard

P194: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x20, no_int194, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x1, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x1, 0x20, 0x3, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int194:

P195: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x26, no_int195, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x1, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x1, 0x26, 0x2, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int195:

P196: !_INTERRUPT (Int)
! self-interrupt - discard

P197: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x2a, no_int197, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x1, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x1, 0x2a, 0x4, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int197:

P198: !_SWAP [15] (maybe <- 0x80000a) (Int)
mov %l4, %o0
swap  [%i3 + 192], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
add   %l4, 1, %l4

P199: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x35, no_int199, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x1, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x1, 0x35, 0x5, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int199:

P200: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x31, no_int200, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x1, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x1, 0x31, 0x2, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int200:

P201: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x10, no_int201, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x1, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x1, 0x10, 0x4, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int201:

P202: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x9, no_int202, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x1, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x1, 0x9, 0x2, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int202:

P203: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3, no_int203, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x1, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x1, 0x3, 0x5, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int203:

P204: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0xd, no_int204, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x1, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x1, 0xd, 0x5, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int204:

P205: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x2d, no_int205, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x1, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x1, 0x2d, 0x6, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int205:

P206: !_REPLACEMENT [14] (Int)
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

P207: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x2b, no_int207, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x1, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x1, 0x2b, 0x5, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int207:

P208: !_MEMBAR (Int) (Branch target of P145)
membar #StoreLoad
ba P209
nop

TARGET145:
ba RET145
nop


P209: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x27, no_int209, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x1, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x1, 0x27, 0x6, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int209:

P210: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1b, no_int210, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x1, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x1, 0x1b, 0x5, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int210:

P211: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x18, no_int211, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x1, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x1, 0x18, 0x0, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int211:

P212: !_LD [7] (Int)
lduw [%i1 + 84], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

P213: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1c, no_int213, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x1, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x1, 0x1c, 0x0, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int213:

P214: !_INTERRUPT (Int) (Branch target of P146)

CHECK_DISPATCH_STATUS(0x17, no_int214, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x1, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x1, 0x17, 0x2, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int214:
ba P215
nop

TARGET146:
ba RET146
nop


P215: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x33, no_int215, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x1, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x1, 0x33, 0x3, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int215:

P216: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x4, no_int216, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x1, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x1, 0x4, 0x2, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int216:

P217: !_INTERRUPT (Int) (CBR)
! self-interrupt - discard

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET217
nop
RET217:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P218: !_MEMBAR (Int)
membar #StoreLoad

P219: !_LD [0] (Int)
lduw [%i0 + 0], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P220: !_LD [1] (Int)
lduw [%i0 + 4], %l3
! move %l3(lower) -> %o1(lower)
or %l3, %o1, %o1

P221: !_LD [2] (Int)
lduw [%i0 + 12], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P222: !_LD [3] (Int)
lduw [%i0 + 32], %l3
! move %l3(lower) -> %o2(lower)
or %l3, %o2, %o2

P223: !_LD [4] (Int)
lduw [%i0 + 64], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P224: !_LD [5] (FP)
ld [%i1 + 76], %f0
! 1 addresses covered

P225: !_LD [6] (Int)
lduw [%i1 + 80], %l3
! move %l3(lower) -> %o3(lower)
or %l3, %o3, %o3

P226: !_LD [7] (Int)
lduw [%i1 + 84], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P227: !_LD [8] (Int) (LE)
wr %g0, 0x88, %asi
lduwa [%i1 + 256] %asi, %l3
! move %l3(lower) -> %o4(lower)
or %l3, %o4, %o4
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
lduw [%i2 + 32], %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0

P230: !_LD [11] (Int)
lduw [%i2 + 64], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P231: !_LD [12] (Int)
lduw [%i3 + 0], %l3
! move %l3(lower) -> %o1(lower)
or %l3, %o1, %o1

P232: !_LD [13] (Int) (CBR)
lduw [%i3 + 64], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET232
nop
RET232:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P233: !_LD [14] (Int)
lduw [%i3 + 128], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2

P234: !_LD [15] (Int) (LE)
wr %g0, 0x88, %asi
lduwa [%i3 + 192] %asi, %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

END_NODES1: ! Test istream for CPU 1 ends
sethi %hi(0xdead0e0f), %l3
or    %l3, %lo(0xdead0e0f), %l3
! move %l3(lower) -> %o3(lower)
or %l3, %o3, %o3
stw %l3, [%i5] 
ld [%i5], %f1
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
sethi %hi(0x02deade1), %o5
or    %o5, %lo(0x02deade1), %o5
stw %o5, [%i5] 
ld [%i5], %f16

! Initialize running integer counter in register %l4
sethi %hi(0x1000001), %l4
or    %l4, %lo(0x1000001), %l4

! Initialize running FP counter in register %f16
sethi %hi(0x40800001), %o5
or    %o5, %lo(0x40800001), %o5
stw %o5, [%i5] 
ld [%i5], %f16

! Initialize FP counter increment value in register %f17 (constant)
sethi %hi(0x35000000), %o5
or    %o5, %lo(0x35000000), %o5
stw %o5, [%i5] 
ld [%i5], %f17 

! Initialize LFSR to 0x1ea4^4
sethi %hi(0x1ea4), %l0
or    %l0, %lo(0x1ea4), %l0
mulx  %l0, %l0, %l0
mulx  %l0, %l0, %l0

!-- init shared addrs 4 to 5 ---
stx %g0, [%i0+64]
stx %g0, [%i1+72]

! use untouched cache-line (offset 4K) in replacement area for sync
sub %i1, %i0, %l3
add %i3, %l3, %l3
sub %l3, -4096, %l3

!-- begin of sync_init ---
or %g0, 1, %l6
or %g0, %l6, %l7
swap [%l3+4], %l7
membar #Sync
sync_init_1_2:
brnz,pt %l6, sync_init_1_2
lduw [%l3+4], %l6 ! delay slot
sync_init_2_2:
lduw [%l3], %l6
sub %l6, 1, %l7
cas [%l3], %l6, %l7
cmp %l6, %l7
bne,pt %xcc, sync_init_2_2
nop
membar #Sync
sync_init_3_2:
lduw [%l3], %l6 ! delay slot
brnz,pt %l6, sync_init_3_2
nop
!-- end of sync_init ---


BEGIN_NODES2: ! Test istream for CPU 2 begins

P235: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x2b, no_int235, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x2, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x2, 0x2b, 0x3, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int235:

P236: !_INTERRUPT (Int) (CBR)

CHECK_DISPATCH_STATUS(0x0, no_int236, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x2, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x2, 0x0, 0x7, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int236:

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET236
nop
RET236:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P237: !_INTERRUPT (Int)
! self-interrupt - discard

P238: !_INTERRUPT (Int)
! self-interrupt - discard

P239: !_LD [9] (Int)
lduw [%i1 + 512], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P240: !_ST [5] (maybe <- 0x1000001) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P241: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x15, no_int241, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x2, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x2, 0x15, 0x5, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int241:

P242: !_CAS [5] (maybe <- 0x1000002) (Int)
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

P243: !_ST [3] (maybe <- 0x1000003) (Int)
stw   %l4, [%i0 + 32 ]
add   %l4, 1, %l4

P244: !_PREFETCH [1] (Int)
prefetch [%i0 + 4], 1

P245: !_INTERRUPT (Int)
! self-interrupt - discard

P246: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x38, no_int246, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x2, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x2, 0x38, 0x5, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int246:

P247: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x2c, no_int247, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x2, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x2, 0x2c, 0x5, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int247:

P248: !_INTERRUPT (Int) (CBR)

CHECK_DISPATCH_STATUS(0x38, no_int248, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x2, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x2, 0x38, 0x6, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int248:

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET248
nop
RET248:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P249: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x0, no_int249, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x2, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x2, 0x0, 0x0, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int249:

P250: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x30, no_int250, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x2, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x2, 0x30, 0x1, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int250:

P251: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x7, no_int251, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x2, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x2, 0x7, 0x5, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int251:

P252: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1f, no_int252, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x2, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x2, 0x1f, 0x4, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int252:

P253: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x2c, no_int253, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x2, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x2, 0x2c, 0x0, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int253:

P254: !_MEMBAR (Int)
membar #StoreLoad

P255: !_INTERRUPT (Int)
! self-interrupt - discard

P256: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3c, no_int256, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x2, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x2, 0x3c, 0x1, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int256:

P257: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1a, no_int257, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x2, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x2, 0x1a, 0x3, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int257:

P258: !_INTERRUPT (Int) (Branch target of P330)
! self-interrupt - discard
ba P259
nop

TARGET330:
ba RET330
nop


P259: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x21, no_int259, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x2, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x2, 0x21, 0x0, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int259:

P260: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x28, no_int260, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x2, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x2, 0x28, 0x0, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int260:

P261: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x13, no_int261, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x2, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x2, 0x13, 0x6, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int261:

P262: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x25, no_int262, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x2, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x2, 0x25, 0x5, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int262:

P263: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3f, no_int263, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x2, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x2, 0x3f, 0x4, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int263:

P264: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3c, no_int264, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x2, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x2, 0x3c, 0x0, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int264:

P265: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x34, no_int265, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x2, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x2, 0x34, 0x5, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int265:

P266: !_LD [15] (FP)
ld [%i3 + 192], %f0
! 1 addresses covered

P267: !_SWAP [15] (maybe <- 0x1000004) (Int)
mov %l4, %l6
swap  [%i3 + 192], %l6
! move %l6(lower) -> %o1(lower)
srl %l6, 0, %o5
or %o5, %o1, %o1
add   %l4, 1, %l4

P268: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x13, no_int268, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x2, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x2, 0x13, 0x0, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int268:

P269: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x10, no_int269, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x2, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x2, 0x10, 0x5, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int269:

P270: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1d, no_int270, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x2, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x2, 0x1d, 0x6, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int270:

P271: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x2d, no_int271, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x2, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x2, 0x2d, 0x6, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int271:

P272: !_ST [15] (maybe <- 0x1000005) (Int)
stw   %l4, [%i3 + 192 ]
add   %l4, 1, %l4

P273: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x25, no_int273, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x2, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x2, 0x25, 0x4, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int273:

P274: !_DWST [7] (maybe <- 0x1000006) (Int)
sllx %l4, 32, %o5 
add   %l4, 1, %l4
or %o5, %l4, %o5
stx %o5, [%i1 + 80]
add   %l4, 1, %l4

P275: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0xa, no_int275, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x2, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x2, 0xa, 0x5, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int275:

P276: !_PREFETCH [8] (Int) (Branch target of P236)
prefetch [%i1 + 256], 1
ba P277
nop

TARGET236:
ba RET236
nop


P277: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3b, no_int277, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x2, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x2, 0x3b, 0x4, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int277:

P278: !_INTERRUPT (Int) (Branch target of P286)

CHECK_DISPATCH_STATUS(0x1c, no_int278, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x2, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x2, 0x1c, 0x0, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int278:
ba P279
nop

TARGET286:
ba RET286
nop


P279: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x10, no_int279, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x2, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x2, 0x10, 0x6, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int279:

P280: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x9, no_int280, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x2, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x2, 0x9, 0x3, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int280:

P281: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x7, no_int281, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x2, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x2, 0x7, 0x5, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int281:

P282: !_INTERRUPT (Int)
! self-interrupt - discard

P283: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3, no_int283, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x2, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x2, 0x3, 0x0, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int283:

P284: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3, no_int284, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x2, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x2, 0x3, 0x1, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int284:

P285: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1a, no_int285, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x2, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x2, 0x1a, 0x3, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int285:

P286: !_INTERRUPT (Int) (CBR)

CHECK_DISPATCH_STATUS(0x21, no_int286, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x2, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x2, 0x21, 0x4, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int286:

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET286
nop
RET286:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P287: !_DWST [3] (maybe <- 0x1000008) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i0 + 32 ] 
add   %l4, 1, %l4

P288: !_INTERRUPT (Int) (Branch target of P342)

CHECK_DISPATCH_STATUS(0x26, no_int288, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x2, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x2, 0x26, 0x4, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int288:
ba P289
nop

TARGET342:
ba RET342
nop


P289: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x28, no_int289, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x2, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x2, 0x28, 0x5, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int289:

P290: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x14, no_int290, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x2, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x2, 0x14, 0x1, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int290:

P291: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3c, no_int291, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x2, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x2, 0x3c, 0x5, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int291:

P292: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x16, no_int292, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x2, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x2, 0x16, 0x4, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int292:

P293: !_PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P294: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3, no_int294, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x2, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x2, 0x3, 0x5, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int294:

P295: !_ST [5] (maybe <- 0x1000009) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P296: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1d, no_int296, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x2, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x2, 0x1d, 0x3, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int296:

P297: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x13, no_int297, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x2, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x2, 0x13, 0x5, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int297:

P298: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x35, no_int298, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x2, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x2, 0x35, 0x3, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int298:

P299: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x8, no_int299, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x2, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x2, 0x8, 0x3, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int299:

P300: !_DWLD [6] (Int)
ldx [%i1 + 80], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)

P301: !_INTERRUPT (Int) (Branch target of P248)

CHECK_DISPATCH_STATUS(0x29, no_int301, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x2, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x2, 0x29, 0x4, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int301:
ba P302
nop

TARGET248:
ba RET248
nop


P302: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1c, no_int302, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x2, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x2, 0x1c, 0x0, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int302:

P303: !_INTERRUPT (Int)
! self-interrupt - discard

P304: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x34, no_int304, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x2, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x2, 0x34, 0x3, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int304:

P305: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1c, no_int305, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x2, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x2, 0x1c, 0x1, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int305:

P306: !_LD [5] (FP)
ld [%i1 + 76], %f1
! 1 addresses covered

P307: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1f, no_int307, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x2, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x2, 0x1f, 0x4, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int307:

P308: !_INTERRUPT (Int)
! self-interrupt - discard

P309: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x2a, no_int309, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x2, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x2, 0x2a, 0x5, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int309:

P310: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x15, no_int310, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x2, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x2, 0x15, 0x7, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int310:

P311: !_INTERRUPT (Int) (CBR)

CHECK_DISPATCH_STATUS(0x3c, no_int311, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x2, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x2, 0x3c, 0x6, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int311:

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET311
nop
RET311:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P312: !_CASX [2] (maybe <- 0x100000a) (Int)
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

P313: !_INTERRUPT (Int) (Branch target of P311)

CHECK_DISPATCH_STATUS(0x1b, no_int313, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x2, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x2, 0x1b, 0x6, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int313:
ba P314
nop

TARGET311:
ba RET311
nop


P314: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x26, no_int314, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x2, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x2, 0x26, 0x6, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int314:

P315: !_INTERRUPT (Int)
! self-interrupt - discard

P316: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3d, no_int316, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x2, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x2, 0x3d, 0x4, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int316:

P317: !_INTERRUPT (Int)
! self-interrupt - discard

P318: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x8, no_int318, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x2, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x2, 0x8, 0x0, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int318:

P319: !_INTERRUPT (Int)
! self-interrupt - discard

P320: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x2f, no_int320, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x2, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x2, 0x2f, 0x7, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int320:

P321: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1f, no_int321, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x2, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x2, 0x1f, 0x1, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int321:

P322: !_INTERRUPT (Int)
! self-interrupt - discard

P323: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1a, no_int323, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x2, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x2, 0x1a, 0x7, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int323:

P324: !_INTERRUPT (Int)
! self-interrupt - discard

P325: !_INTERRUPT (Int)
! self-interrupt - discard

P326: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x12, no_int326, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x2, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x2, 0x12, 0x1, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int326:

P327: !_CASX [2] (maybe <- 0x100000b) (Int)
add %i0, 8, %o5
ldx [%o5], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l7
mov %l4, %o1
casx [%o5], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P328: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3d, no_int328, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x2, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x2, 0x3d, 0x4, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int328:

P329: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0xd, no_int329, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x2, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x2, 0xd, 0x6, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int329:

P330: !_CASX [2] (maybe <- 0x100000c) (Int) (CBR)
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

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET330
nop
RET330:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P331: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x8, no_int331, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x2, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x2, 0x8, 0x7, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int331:

P332: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3d, no_int332, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x2, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x2, 0x3d, 0x6, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int332:

P333: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x13, no_int333, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x2, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x2, 0x13, 0x7, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int333:

P334: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1b, no_int334, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x2, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x2, 0x1b, 0x7, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int334:

P335: !_MEMBAR (Int)
membar #StoreLoad

P336: !_LD [0] (Int)
lduw [%i0 + 0], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P337: !_LD [1] (Int)
lduw [%i0 + 4], %l7
! move %l7(lower) -> %o4(lower)
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P338: !_LD [2] (Int)
lduw [%i0 + 12], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P339: !_LD [3] (Int)
lduw [%i0 + 32], %l7
! move %l7(lower) -> %o0(lower)
or %l7, %o0, %o0

P340: !_LD [4] (Int)
lduw [%i0 + 64], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P341: !_LD [5] (FP)
ld [%i1 + 76], %f2
! 1 addresses covered

P342: !_LD [6] (Int) (CBR)
lduw [%i1 + 80], %l7
! move %l7(lower) -> %o1(lower)
or %l7, %o1, %o1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET342
nop
RET342:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P343: !_LD [7] (Int)
lduw [%i1 + 84], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P344: !_LD [8] (Int)
lduw [%i1 + 256], %o5
! move %o5(lower) -> %o2(lower)
or %o5, %o2, %o2

P345: !_LD [9] (Int)
lduw [%i1 + 512], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P346: !_LD [10] (Int)
lduw [%i2 + 32], %o5
! move %o5(lower) -> %o3(lower)
or %o5, %o3, %o3

P347: !_LD [11] (Int)
lduw [%i2 + 64], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P348: !_LD [12] (Int)
lduw [%i3 + 0], %o5
! move %o5(lower) -> %o4(lower)
or %o5, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P349: !_LD [13] (Int)
lduw [%i3 + 64], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P350: !_LD [14] (Int)
lduw [%i3 + 128], %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0

P351: !_LD [15] (Int)
lduw [%i3 + 192], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

END_NODES2: ! Test istream for CPU 2 ends
sethi %hi(0xdead0e0f), %l7
or    %l7, %lo(0xdead0e0f), %l7
! move %l7(lower) -> %o1(lower)
or %l7, %o1, %o1
stw %l7, [%i5] 
ld [%i5], %f3
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
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

! Initialize LFSR to 0x64c9^4
sethi %hi(0x64c9), %l0
or    %l0, %lo(0x64c9), %l0
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

P352: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x15, no_int352, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x3, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x3, 0x15, 0x4, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int352:

P353: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x30, no_int353, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x3, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x3, 0x30, 0x7, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int353:

P354: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0xa, no_int354, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x3, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x3, 0xa, 0x2, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int354:

P355: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x14, no_int355, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x3, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x3, 0x14, 0x1, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int355:

P356: !_INTERRUPT (Int)
! self-interrupt - discard

P357: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x32, no_int357, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x3, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x3, 0x32, 0x2, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int357:

P358: !_INTERRUPT (Int)
! self-interrupt - discard

P359: !_INTERRUPT (Int) (Branch target of P386)

CHECK_DISPATCH_STATUS(0x3a, no_int359, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x3, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x3, 0x3a, 0x6, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int359:
ba P360
nop

TARGET386:
ba RET386
nop


P360: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0xd, no_int360, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x3, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x3, 0xd, 0x5, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int360:

P361: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x30, no_int361, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x3, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x3, 0x30, 0x1, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int361:

P362: !_INTERRUPT (Int) (Branch target of P466)

CHECK_DISPATCH_STATUS(0x0, no_int362, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x3, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x3, 0x0, 0x7, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int362:
ba P363
nop

TARGET466:
ba RET466
nop


P363: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x2f, no_int363, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x3, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x3, 0x2f, 0x6, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int363:

P364: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x5, no_int364, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x3, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x3, 0x5, 0x2, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int364:

P365: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x18, no_int365, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x3, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x3, 0x18, 0x7, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int365:

P366: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x34, no_int366, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x3, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x3, 0x34, 0x2, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int366:

P367: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x34, no_int367, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x3, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x3, 0x34, 0x1, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int367:

P368: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x38, no_int368, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x3, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x3, 0x38, 0x2, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int368:

P369: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3b, no_int369, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x3, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x3, 0x3b, 0x1, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int369:

P370: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3a, no_int370, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x3, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x3, 0x3a, 0x4, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int370:

P371: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x23, no_int371, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x3, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x3, 0x23, 0x1, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int371:

P372: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0xe, no_int372, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x3, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x3, 0xe, 0x2, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int372:

P373: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x2a, no_int373, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x3, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x3, 0x2a, 0x0, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int373:

P374: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x20, no_int374, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x3, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x3, 0x20, 0x7, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int374:

P375: !_PREFETCH [4] (Int)
prefetch [%i0 + 64], 1

P376: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1d, no_int376, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x3, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x3, 0x1d, 0x4, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int376:

P377: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x0, no_int377, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x3, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x3, 0x0, 0x2, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int377:

P378: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x21, no_int378, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x3, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x3, 0x21, 0x4, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int378:

P379: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x22, no_int379, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x3, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x3, 0x22, 0x1, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int379:

P380: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x23, no_int380, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x3, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x3, 0x23, 0x7, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int380:

P381: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x24, no_int381, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x3, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x3, 0x24, 0x7, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int381:

P382: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x22, no_int382, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x3, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x3, 0x22, 0x7, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int382:

P383: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x21, no_int383, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x3, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x3, 0x21, 0x2, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int383:

P384: !_CASX [5] (maybe <- 0x1800001) (Int)
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

P385: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0xe, no_int385, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x3, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x3, 0xe, 0x4, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int385:

P386: !_INTERRUPT (Int) (CBR)

CHECK_DISPATCH_STATUS(0x9, no_int386, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x3, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x3, 0x9, 0x4, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int386:

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET386
nop
RET386:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P387: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1d, no_int387, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x3, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x3, 0x1d, 0x7, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int387:

P388: !_DWLD [0] (Int)
ldx [%i0 + 0], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)

P389: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x9, no_int389, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x3, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x3, 0x9, 0x7, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int389:

P390: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x2a, no_int390, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x3, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x3, 0x2a, 0x6, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int390:

P391: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0xa, no_int391, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x3, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x3, 0xa, 0x7, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int391:

P392: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x27, no_int392, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x3, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x3, 0x27, 0x6, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int392:

P393: !_INTERRUPT (Int)
! self-interrupt - discard

P394: !_PREFETCH [15] (Int)
prefetch [%i3 + 192], 1

P395: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x22, no_int395, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x3, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x3, 0x22, 0x5, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int395:

P396: !_INTERRUPT (Int) (CBR)

CHECK_DISPATCH_STATUS(0x0, no_int396, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x3, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x3, 0x0, 0x5, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int396:

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


P397: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0xf, no_int397, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x3, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x3, 0xf, 0x4, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int397:

P398: !_INTERRUPT (Int)
! self-interrupt - discard

P399: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x39, no_int399, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x3, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x3, 0x39, 0x7, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int399:

P400: !_INTERRUPT (Int) (CBR)

CHECK_DISPATCH_STATUS(0x35, no_int400, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x3, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x3, 0x35, 0x6, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int400:

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET400
nop
RET400:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P401: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x2f, no_int401, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x3, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x3, 0x2f, 0x2, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int401:

P402: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x2d, no_int402, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x3, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x3, 0x2d, 0x4, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int402:

P403: !_ST [9] (maybe <- 0x1800002) (Int)
stw   %l4, [%i1 + 512 ]
add   %l4, 1, %l4

P404: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0xb, no_int404, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x3, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x3, 0xb, 0x6, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int404:

P405: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1d, no_int405, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x3, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x3, 0x1d, 0x7, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int405:

P406: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x17, no_int406, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x3, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x3, 0x17, 0x5, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int406:

P407: !_INTERRUPT (Int) (CBR)

CHECK_DISPATCH_STATUS(0x2f, no_int407, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x3, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x3, 0x2f, 0x4, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int407:

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET407
nop
RET407:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P408: !_DWLD [6] (Int)
ldx [%i1 + 80], %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)

P409: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0xc, no_int409, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x3, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x3, 0xc, 0x2, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int409:

P410: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0xb, no_int410, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x3, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x3, 0xb, 0x4, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int410:

P411: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x2f, no_int411, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x3, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x3, 0x2f, 0x0, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int411:

P412: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x30, no_int412, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x3, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x3, 0x30, 0x2, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int412:

P413: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x36, no_int413, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x3, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x3, 0x36, 0x1, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int413:

P414: !_INTERRUPT (Int) (CBR)

CHECK_DISPATCH_STATUS(0x25, no_int414, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x3, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x3, 0x25, 0x0, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int414:

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET414
nop
RET414:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P415: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x7, no_int415, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x3, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x3, 0x7, 0x5, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int415:

P416: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x35, no_int416, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x3, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x3, 0x35, 0x7, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int416:

P417: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0xa, no_int417, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x3, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x3, 0xa, 0x5, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int417:

P418: !_LD [5] (Int)
lduw [%i1 + 76], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P419: !_INTERRUPT (Int) (CBR)

CHECK_DISPATCH_STATUS(0x2a, no_int419, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x3, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x3, 0x2a, 0x0, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int419:

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET419
nop
RET419:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P420: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3a, no_int420, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x3, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x3, 0x3a, 0x4, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int420:

P421: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x29, no_int421, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x3, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x3, 0x29, 0x6, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int421:

P422: !_REPLACEMENT [10] (Int) (Branch target of P414)
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
ba P423
nop

TARGET414:
ba RET414
nop


P423: !_INTERRUPT (Int)
! self-interrupt - discard

P424: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x2b, no_int424, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x3, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x3, 0x2b, 0x6, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int424:

P425: !_LD [9] (Int)
lduw [%i1 + 512], %l7
! move %l7(lower) -> %o4(lower)
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P426: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x38, no_int426, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x3, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x3, 0x38, 0x0, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int426:

P427: !_INTERRUPT (Int) (Branch target of P396)

CHECK_DISPATCH_STATUS(0x37, no_int427, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x3, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x3, 0x37, 0x2, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int427:
ba P428
nop

TARGET396:
ba RET396
nop


P428: !_INTERRUPT (Int)
! self-interrupt - discard

P429: !_INTERRUPT (Int)
! self-interrupt - discard

P430: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3d, no_int430, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x3, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x3, 0x3d, 0x4, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int430:

P431: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x29, no_int431, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x3, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x3, 0x29, 0x2, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int431:

P432: !_REPLACEMENT [3] (Int) (Branch target of P407)
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
ba P433
nop

TARGET407:
ba RET407
nop


P433: !_CASX [4] (maybe <- 0x1800003) (Int)
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

P434: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x11, no_int434, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x3, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x3, 0x11, 0x1, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int434:

P435: !_INTERRUPT (Int)
! self-interrupt - discard

P436: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x23, no_int436, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x3, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x3, 0x23, 0x5, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int436:

P437: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x38, no_int437, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x3, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x3, 0x38, 0x5, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int437:

P438: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1e, no_int438, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x3, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x3, 0x1e, 0x0, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int438:

P439: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x29, no_int439, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x3, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x3, 0x29, 0x6, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int439:

P440: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x11, no_int440, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x3, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x3, 0x11, 0x0, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int440:

P441: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x30, no_int441, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x3, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x3, 0x30, 0x6, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int441:

P442: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0xe, no_int442, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x3, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x3, 0xe, 0x1, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int442:

P443: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0xe, no_int443, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x3, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x3, 0xe, 0x0, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int443:

P444: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x20, no_int444, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x3, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x3, 0x20, 0x6, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int444:

P445: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x31, no_int445, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x3, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x3, 0x31, 0x6, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int445:

P446: !_INTERRUPT (Int) (Branch target of P419)

CHECK_DISPATCH_STATUS(0x1f, no_int446, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x3, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x3, 0x1f, 0x5, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int446:
ba P447
nop

TARGET419:
ba RET419
nop


P447: !_INTERRUPT (Int) (Branch target of P400)

CHECK_DISPATCH_STATUS(0x1a, no_int447, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x3, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x3, 0x1a, 0x2, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int447:
ba P448
nop

TARGET400:
ba RET400
nop


P448: !_DWST [11] (maybe <- 0x1800004) (Int)
mov %l4, %l7 
sllx %l7, 32, %l7 
stx %l7, [%i2 + 64 ] 
add   %l4, 1, %l4

P449: !_DWLD [12] (Int) (Branch target of P468)
ldx [%i3 + 0], %o2
! move %o2(upper) -> %o2(upper)
ba P450
nop

TARGET468:
ba RET468
nop


P450: !_LD [1] (FP)
ld [%i0 + 4], %f0
! 1 addresses covered

P451: !_INTERRUPT (Int) (CBR)

CHECK_DISPATCH_STATUS(0x34, no_int451, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x3, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x3, 0x34, 0x6, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int451:

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET451
nop
RET451:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P452: !_MEMBAR (Int)
membar #StoreLoad

P453: !_LD [0] (Int)
lduw [%i0 + 0], %o5
! move %o5(lower) -> %o2(lower)
srlx %o2, 32, %o2
sllx %o2, 32, %o2
or %o5, %o2, %o2

P454: !_LD [1] (Int)
lduw [%i0 + 4], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P455: !_LD [2] (Int)
lduw [%i0 + 12], %o5
! move %o5(lower) -> %o3(lower)
or %o5, %o3, %o3

P456: !_LD [3] (Int)
lduw [%i0 + 32], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P457: !_LD [4] (Int)
lduw [%i0 + 64], %o5
! move %o5(lower) -> %o4(lower)
or %o5, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P458: !_LD [5] (FP)
ld [%i1 + 76], %f1
! 1 addresses covered

P459: !_LD [6] (FP)
ld [%i1 + 80], %f2
! 1 addresses covered

P460: !_LD [7] (FP)
ld [%i1 + 84], %f3
! 1 addresses covered

P461: !_LD [8] (Int)
lduw [%i1 + 256], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P462: !_LD [9] (Int)
lduw [%i1 + 512], %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0

P463: !_LD [10] (Int)
lduw [%i2 + 32], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P464: !_LD [11] (Int)
lduw [%i2 + 64], %o5
! move %o5(lower) -> %o1(lower)
or %o5, %o1, %o1

P465: !_LD [12] (FP)
ld [%i3 + 0], %f4
! 1 addresses covered

P466: !_LD [13] (Int) (CBR)
lduw [%i3 + 64], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET466
nop
RET466:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P467: !_LD [14] (Int)
lduw [%i3 + 128], %l3
! move %l3(lower) -> %o2(lower)
or %l3, %o2, %o2

P468: !_LD [15] (Int) (CBR) (Branch target of P451)
lduw [%i3 + 192], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET468
nop
RET468:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0

ba END_NODES3
nop

TARGET451:
ba RET451
nop


END_NODES3: ! Test istream for CPU 3 ends
sethi %hi(0xdead0e0f), %l3
or    %l3, %lo(0xdead0e0f), %l3
! move %l3(lower) -> %o3(lower)
or %l3, %o3, %o3
stw %l3, [%i5] 
ld [%i5], %f5
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
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

! Initialize LFSR to 0x566d^4
sethi %hi(0x566d), %l0
or    %l0, %lo(0x566d), %l0
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

P469: !_INTERRUPT (Int)
! self-interrupt - discard

P470: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3b, no_int470, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x4, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x4, 0x3b, 0x6, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int470:

P471: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x24, no_int471, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x4, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x4, 0x24, 0x0, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int471:

P472: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x0, no_int472, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x4, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x4, 0x0, 0x5, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int472:

P473: !_INTERRUPT (Int) (Branch target of P578)

CHECK_DISPATCH_STATUS(0x29, no_int473, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x4, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x4, 0x29, 0x7, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int473:
ba P474
nop

TARGET578:
ba RET578
nop


P474: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1d, no_int474, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x4, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x4, 0x1d, 0x2, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int474:

P475: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3a, no_int475, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x4, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x4, 0x3a, 0x7, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int475:

P476: !_INTERRUPT (Int) (Branch target of P552)

CHECK_DISPATCH_STATUS(0x2c, no_int476, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x4, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x4, 0x2c, 0x5, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int476:
ba P477
nop

TARGET552:
ba RET552
nop


P477: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0xa, no_int477, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x4, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x4, 0xa, 0x0, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int477:

P478: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1d, no_int478, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x4, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x4, 0x1d, 0x6, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int478:

P479: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x7, no_int479, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x4, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x4, 0x7, 0x5, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int479:

P480: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x36, no_int480, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x4, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x4, 0x36, 0x0, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int480:

P481: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3a, no_int481, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x4, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x4, 0x3a, 0x1, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int481:

P482: !_REPLACEMENT [12] (Int)
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

P483: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0xb, no_int483, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x4, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x4, 0xb, 0x2, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int483:

P484: !_INTERRUPT (Int) (Branch target of P488)

CHECK_DISPATCH_STATUS(0x23, no_int484, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x4, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x4, 0x23, 0x5, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int484:
ba P485
nop

TARGET488:
ba RET488
nop


P485: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3d, no_int485, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x4, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x4, 0x3d, 0x2, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int485:

P486: !_LD [15] (Int)
lduw [%i3 + 192], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P487: !_INTERRUPT (Int)
! self-interrupt - discard

P488: !_INTERRUPT (Int) (CBR)

CHECK_DISPATCH_STATUS(0x11, no_int488, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x4, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x4, 0x11, 0x2, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int488:

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET488
nop
RET488:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P489: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x5, no_int489, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x4, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x4, 0x5, 0x2, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int489:

P490: !_INTERRUPT (Int)
! self-interrupt - discard

P491: !_LD [7] (Int)
lduw [%i1 + 84], %l7
! move %l7(lower) -> %o0(lower)
or %l7, %o0, %o0

P492: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x8, no_int492, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x4, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x4, 0x8, 0x0, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int492:

P493: !_ST [9] (maybe <- 0x41800001) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i1 + 512 ]

P494: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0xf, no_int494, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x4, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x4, 0xf, 0x5, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int494:

P495: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x39, no_int495, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x4, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x4, 0x39, 0x1, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int495:

P496: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1a, no_int496, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x4, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x4, 0x1a, 0x7, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int496:

P497: !_INTERRUPT (Int) (Branch target of P573)
! self-interrupt - discard
ba P498
nop

TARGET573:
ba RET573
nop


P498: !_CAS [10] (maybe <- 0x2000001) (Int)
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

P499: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x23, no_int499, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x4, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x4, 0x23, 0x2, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int499:

P500: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x2, no_int500, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x4, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x4, 0x2, 0x1, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int500:

P501: !_SWAP [15] (maybe <- 0x2000002) (Int) (LE)
wr %g0, 0x88, %asi
mov %l4, %o2
! Change single-word-level endianess (big endian <-> little endian) 
sethi %hi(0xff00ff00), %l3
or %l3, %lo(0xff00ff00), %l3
and %o2, %l3, %l6
srl %l6, 8, %l6
sll %o2, 8, %o2
and %o2, %l3, %o2
or %o2, %l6, %o2
srl %o2, 16, %l6
sll %o2, 16, %o2
srl %o2, 0, %o2
or %o2, %l6, %o2
swapa  [%i3 + 192] %asi, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
add   %l4, 1, %l4

P502: !_SWAP [1] (maybe <- 0x2000003) (Int)
mov %l4, %l6
swap  [%i0 + 4], %l6
! move %l6(lower) -> %o2(lower)
srl %l6, 0, %o5
or %o5, %o2, %o2
add   %l4, 1, %l4

P503: !_INTERRUPT (Int)
! self-interrupt - discard

P504: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x34, no_int504, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x4, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x4, 0x34, 0x6, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int504:

P505: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x8, no_int505, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x4, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x4, 0x8, 0x3, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int505:

P506: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0xb, no_int506, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x4, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x4, 0xb, 0x0, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int506:

P507: !_ST [13] (maybe <- 0x41800002) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i3 + 64 ]

P508: !_INTERRUPT (Int) (Branch target of P517)
! self-interrupt - discard
ba P509
nop

TARGET517:
ba RET517
nop


P509: !_DWST [13] (maybe <- 0x2000004) (Int)
mov %l4, %o5 
sllx %o5, 32, %o5 
stx %o5, [%i3 + 64 ] 
add   %l4, 1, %l4

P510: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0xd, no_int510, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x4, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x4, 0xd, 0x7, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int510:

P511: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x21, no_int511, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x4, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x4, 0x21, 0x0, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int511:

P512: !_PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P513: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x12, no_int513, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x4, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x4, 0x12, 0x2, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int513:

P514: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x11, no_int514, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x4, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x4, 0x11, 0x3, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int514:

P515: !_PREFETCH [12] (Int)
prefetch [%i3 + 0], 1

P516: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x2, no_int516, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x4, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x4, 0x2, 0x3, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int516:

P517: !_INTERRUPT (Int) (CBR)

CHECK_DISPATCH_STATUS(0x2c, no_int517, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x4, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x4, 0x2c, 0x2, %l3, %l6)
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
! self-interrupt - discard

P519: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x23, no_int519, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x4, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x4, 0x23, 0x6, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int519:

P520: !_DWLD [9] (Int)
ldx [%i1 + 512], %o3
! move %o3(upper) -> %o3(upper)

P521: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1c, no_int521, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x4, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x4, 0x1c, 0x3, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int521:

P522: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x2b, no_int522, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x4, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x4, 0x2b, 0x6, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int522:

P523: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1c, no_int523, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x4, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x4, 0x1c, 0x5, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int523:

P524: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x24, no_int524, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x4, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x4, 0x24, 0x7, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int524:

P525: !_REPLACEMENT [12] (Int)
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

P526: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x13, no_int526, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x4, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x4, 0x13, 0x5, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int526:

P527: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3f, no_int527, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x4, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x4, 0x3f, 0x5, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int527:

P528: !_MEMBAR (Int)
membar #StoreLoad

P529: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3b, no_int529, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x4, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x4, 0x3b, 0x0, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int529:

P530: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x38, no_int530, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x4, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x4, 0x38, 0x1, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int530:

P531: !_INTERRUPT (Int)
! self-interrupt - discard

P532: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x21, no_int532, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x4, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x4, 0x21, 0x1, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int532:

P533: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3b, no_int533, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x4, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x4, 0x3b, 0x3, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int533:

P534: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x6, no_int534, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x4, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x4, 0x6, 0x7, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int534:

P535: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x37, no_int535, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x4, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x4, 0x37, 0x0, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int535:

P536: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x29, no_int536, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x4, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x4, 0x29, 0x1, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int536:

P537: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x32, no_int537, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x4, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x4, 0x32, 0x5, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int537:

P538: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x23, no_int538, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x4, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x4, 0x23, 0x2, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int538:

P539: !_DWST [15] (maybe <- 0x2000005) (Int)
mov %l4, %l3 
sllx %l3, 32, %l3 
stx %l3, [%i3 + 192 ] 
add   %l4, 1, %l4

P540: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x13, no_int540, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x4, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x4, 0x13, 0x0, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int540:

P541: !_INTERRUPT (Int)
! self-interrupt - discard

P542: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x11, no_int542, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x4, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x4, 0x11, 0x6, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int542:

P543: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x19, no_int543, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x4, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x4, 0x19, 0x0, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int543:

P544: !_LD [10] (FP)
ld [%i2 + 32], %f0
! 1 addresses covered

P545: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x9, no_int545, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x4, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x4, 0x9, 0x6, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int545:

P546: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x24, no_int546, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x4, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x4, 0x24, 0x6, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int546:

P547: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3e, no_int547, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x4, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x4, 0x3e, 0x7, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int547:

P548: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x26, no_int548, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x4, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x4, 0x26, 0x1, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int548:

P549: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x39, no_int549, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x4, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x4, 0x39, 0x6, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int549:

P550: !_INTERRUPT (Int)
! self-interrupt - discard

P551: !_REPLACEMENT [13] (Int)
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

P552: !_INTERRUPT (Int) (CBR)

CHECK_DISPATCH_STATUS(0x17, no_int552, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x4, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x4, 0x17, 0x2, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int552:

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET552
nop
RET552:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P553: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x8, no_int553, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x4, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x4, 0x8, 0x0, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int553:

P554: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x30, no_int554, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x4, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x4, 0x30, 0x2, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int554:

P555: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x2, no_int555, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x4, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x4, 0x2, 0x5, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int555:

P556: !_CAS [8] (maybe <- 0x2000006) (Int)
add %i1, 256, %l3
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

P557: !_INTERRUPT (Int)
! self-interrupt - discard

P558: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x21, no_int558, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x4, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x4, 0x21, 0x6, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int558:

P559: !_PREFETCH [3] (Int)
prefetch [%i0 + 32], 1

P560: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3b, no_int560, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x4, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x4, 0x3b, 0x2, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int560:

P561: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x0, no_int561, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x4, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x4, 0x0, 0x3, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int561:

P562: !_REPLACEMENT [15] (Int)
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

P563: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x35, no_int563, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x4, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x4, 0x35, 0x5, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int563:

P564: !_CAS [11] (maybe <- 0x2000007) (Int)
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

P565: !_INTERRUPT (Int)
! self-interrupt - discard

P566: !_INTERRUPT (Int)
! self-interrupt - discard

P567: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x35, no_int567, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x4, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x4, 0x35, 0x2, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int567:

P568: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x2, no_int568, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x4, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x4, 0x2, 0x2, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int568:

P569: !_MEMBAR (Int)
membar #StoreLoad

P570: !_LD [0] (Int)
lduw [%i0 + 0], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

P571: !_LD [1] (Int)
lduw [%i0 + 4], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P572: !_LD [2] (Int)
lduw [%i0 + 12], %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1

P573: !_LD [3] (Int) (CBR)
lduw [%i0 + 32], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET573
nop
RET573:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P574: !_LD [4] (Int)
lduw [%i0 + 64], %l7
! move %l7(lower) -> %o2(lower)
or %l7, %o2, %o2

P575: !_LD [5] (Int)
lduw [%i1 + 76], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P576: !_LD [6] (Int)
lduw [%i1 + 80], %l7
! move %l7(lower) -> %o3(lower)
or %l7, %o3, %o3

P577: !_LD [7] (Int)
lduw [%i1 + 84], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P578: !_LD [8] (FP) (CBR)
ld [%i1 + 256], %f1
! 1 addresses covered

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET578
nop
RET578:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P579: !_LD [9] (Int)
lduw [%i1 + 512], %o5
! move %o5(lower) -> %o4(lower)
or %o5, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P580: !_LD [10] (Int)
lduw [%i2 + 32], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P581: !_LD [11] (Int)
lduw [%i2 + 64], %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0

P582: !_LD [12] (FP)
ld [%i3 + 0], %f2
! 1 addresses covered

P583: !_LD [13] (Int)
lduw [%i3 + 64], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P584: !_LD [14] (FP)
ld [%i3 + 128], %f3
! 1 addresses covered

P585: !_LD [15] (Int)
lduw [%i3 + 192], %o5
! move %o5(lower) -> %o1(lower)
or %o5, %o1, %o1

END_NODES4: ! Test istream for CPU 4 ends
sethi %hi(0xdead0e0f), %l3
or    %l3, %lo(0xdead0e0f), %l3
! move %l3(lower) -> %o2(upper)
sllx %l3, 32, %o2
stw %l3, [%i5] 
ld [%i5], %f4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
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
sethi %hi(0x05deade1), %o5
or    %o5, %lo(0x05deade1), %o5
stw %o5, [%i5] 
ld [%i5], %f16

! Initialize running integer counter in register %l4
sethi %hi(0x2800001), %l4
or    %l4, %lo(0x2800001), %l4

! Initialize running FP counter in register %f16
sethi %hi(0x42000001), %o5
or    %o5, %lo(0x42000001), %o5
stw %o5, [%i5] 
ld [%i5], %f16

! Initialize FP counter increment value in register %f17 (constant)
sethi %hi(0x36800000), %o5
or    %o5, %lo(0x36800000), %o5
stw %o5, [%i5] 
ld [%i5], %f17 

! Initialize LFSR to 0x1c05^4
sethi %hi(0x1c05), %l0
or    %l0, %lo(0x1c05), %l0
mulx  %l0, %l0, %l0
mulx  %l0, %l0, %l0

!-- init shared addrs 10 to 11 ---
stx %g0, [%i2+32]
stx %g0, [%i2+64]

! use untouched cache-line (offset 4K) in replacement area for sync
sub %i1, %i0, %l3
add %i3, %l3, %l3
sub %l3, -4096, %l3

!-- begin of sync_init ---
or %g0, 1, %l6
or %g0, %l6, %l7
swap [%l3+4], %l7
membar #Sync
sync_init_1_5:
brnz,pt %l6, sync_init_1_5
lduw [%l3+4], %l6 ! delay slot
sync_init_2_5:
lduw [%l3], %l6
sub %l6, 1, %l7
cas [%l3], %l6, %l7
cmp %l6, %l7
bne,pt %xcc, sync_init_2_5
nop
membar #Sync
sync_init_3_5:
lduw [%l3], %l6 ! delay slot
brnz,pt %l6, sync_init_3_5
nop
!-- end of sync_init ---


BEGIN_NODES5: ! Test istream for CPU 5 begins

P586: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1b, no_int586, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x5, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x5, 0x1b, 0x7, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int586:

P587: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3e, no_int587, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x5, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x5, 0x3e, 0x0, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int587:

P588: !_MEMBAR (Int)
membar #StoreLoad

P589: !_REPLACEMENT [11] (Int)
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

P590: !_CAS [3] (maybe <- 0x2800001) (Int) (CBR)
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

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET590
nop
RET590:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P591: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1b, no_int591, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x5, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x5, 0x1b, 0x0, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int591:

P592: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x18, no_int592, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x5, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x5, 0x18, 0x3, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int592:

P593: !_INTERRUPT (Int) (CBR)

CHECK_DISPATCH_STATUS(0x2b, no_int593, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x5, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x5, 0x2b, 0x7, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int593:

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET593
nop
RET593:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P594: !_INTERRUPT (Int)
! self-interrupt - discard

P595: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3c, no_int595, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x5, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x5, 0x3c, 0x6, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int595:

P596: !_DWLD [1] (Int)
ldx [%i0 + 0], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)

P597: !_MEMBAR (Int)
membar #StoreLoad

P598: !_INTERRUPT (Int) (CBR)

CHECK_DISPATCH_STATUS(0xa, no_int598, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x5, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x5, 0xa, 0x6, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int598:

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET598
nop
RET598:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P599: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x32, no_int599, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x5, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x5, 0x32, 0x1, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int599:

P600: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x35, no_int600, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x5, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x5, 0x35, 0x6, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int600:

P601: !_DWLD [15] (Int)
ldx [%i3 + 192], %o2
! move %o2(upper) -> %o2(upper)

P602: !_INTERRUPT (Int)
! self-interrupt - discard

P603: !_INTERRUPT (Int)
! self-interrupt - discard

P604: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x7, no_int604, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x5, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x5, 0x7, 0x7, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int604:

P605: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x25, no_int605, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x5, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x5, 0x25, 0x1, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int605:

P606: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1b, no_int606, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x5, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x5, 0x1b, 0x6, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int606:

P607: !_INTERRUPT (Int)
! self-interrupt - discard

P608: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0xb, no_int608, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x5, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x5, 0xb, 0x1, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int608:

P609: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x30, no_int609, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x5, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x5, 0x30, 0x0, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int609:

P610: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x18, no_int610, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x5, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x5, 0x18, 0x6, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int610:

P611: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x25, no_int611, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x5, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x5, 0x25, 0x3, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int611:

P612: !_DWST [11] (maybe <- 0x2800002) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i2 + 64 ] 
add   %l4, 1, %l4

P613: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x2f, no_int613, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x5, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x5, 0x2f, 0x0, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int613:

P614: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0xb, no_int614, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x5, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x5, 0xb, 0x7, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int614:

P615: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0xa, no_int615, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x5, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x5, 0xa, 0x7, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int615:

P616: !_INTERRUPT (Int)
! self-interrupt - discard

P617: !_DWLD [7] (Int)
ldx [%i1 + 80], %l6
! move %l6(upper) -> %o2(lower)
srlx %o2, 32, %o2
sllx %o2, 32, %o2
srlx %l6, 32, %l3
or %l3, %o2, %o2
! move %l6(lower) -> %o3(upper)
sllx %l6, 32, %o3

P618: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x35, no_int618, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x5, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x5, 0x35, 0x3, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int618:

P619: !_DWLD [8] (Int)
ldx [%i1 + 256], %l6
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %l3
or %l3, %o3, %o3

P620: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x39, no_int620, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x5, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x5, 0x39, 0x6, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int620:

P621: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x18, no_int621, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x5, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x5, 0x18, 0x7, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int621:

P622: !_DWST [11] (maybe <- 0x2800003) (Int)
mov %l4, %l7 
sllx %l7, 32, %l7 
stx %l7, [%i2 + 64 ] 
add   %l4, 1, %l4

P623: !_PREFETCH [13] (Int)
prefetch [%i3 + 64], 1

P624: !_DWLD [5] (Int)
ldx [%i1 + 72], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P625: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x34, no_int625, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x5, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x5, 0x34, 0x7, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int625:

P626: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0xf, no_int626, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x5, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x5, 0xf, 0x0, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int626:

P627: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x6, no_int627, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x5, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x5, 0x6, 0x3, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int627:

P628: !_LD [2] (Int) (Branch target of P691)
lduw [%i0 + 12], %l7
! move %l7(lower) -> %o4(lower)
or %l7, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5
ba P629
nop

TARGET691:
ba RET691
nop


P629: !_PREFETCH [8] (Int)
prefetch [%i1 + 256], 1

P630: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1, no_int630, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x5, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x5, 0x1, 0x7, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int630:

P631: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x26, no_int631, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x5, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x5, 0x26, 0x4, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int631:

P632: !_LD [1] (Int)
lduw [%i0 + 4], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P633: !_DWLD [6] (Int)
ldx [%i1 + 80], %l7
! move %l7(upper) -> %o0(lower)
srlx %l7, 32, %l6
or %l6, %o0, %o0
! move %l7(lower) -> %o1(upper)
sllx %l7, 32, %o1

P634: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x29, no_int634, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x5, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x5, 0x29, 0x2, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int634:

P635: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x0, no_int635, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x5, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x5, 0x0, 0x2, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int635:

P636: !_ST [0] (maybe <- 0x2800004) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P637: !_INTERRUPT (Int)
! self-interrupt - discard

P638: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x2f, no_int638, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x5, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x5, 0x2f, 0x0, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int638:

P639: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x24, no_int639, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x5, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x5, 0x24, 0x7, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int639:

P640: !_REPLACEMENT [8] (Int)
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

P641: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x33, no_int641, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x5, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x5, 0x33, 0x3, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int641:

P642: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x16, no_int642, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x5, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x5, 0x16, 0x2, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int642:

P643: !_ST [11] (maybe <- 0x2800005) (Int)
stw   %l4, [%i2 + 64 ]
add   %l4, 1, %l4

P644: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x11, no_int644, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x5, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x5, 0x11, 0x4, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int644:

P645: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0xc, no_int645, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x5, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x5, 0xc, 0x6, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int645:

P646: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x38, no_int646, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x5, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x5, 0x38, 0x6, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int646:

P647: !_INTERRUPT (Int) (Branch target of P593)

CHECK_DISPATCH_STATUS(0x3, no_int647, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x5, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x5, 0x3, 0x4, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int647:
ba P648
nop

TARGET593:
ba RET593
nop


P648: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x7, no_int648, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x5, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x5, 0x7, 0x3, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int648:

P649: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1, no_int649, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x5, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x5, 0x1, 0x4, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int649:

P650: !_INTERRUPT (Int)
! self-interrupt - discard

P651: !_MEMBAR (Int)
membar #StoreLoad

P652: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x4, no_int652, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x5, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x5, 0x4, 0x0, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int652:

P653: !_MEMBAR (Int) (Branch target of P697)
membar #StoreLoad
ba P654
nop

TARGET697:
ba RET697
nop


P654: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0xd, no_int654, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x5, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x5, 0xd, 0x1, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int654:

P655: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3f, no_int655, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x5, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x5, 0x3f, 0x7, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int655:

P656: !_CASX [14] (maybe <- 0x2800006) (Int)
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

P657: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x2f, no_int657, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x5, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x5, 0x2f, 0x7, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int657:

P658: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x2d, no_int658, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x5, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x5, 0x2d, 0x3, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int658:

P659: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x13, no_int659, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x5, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x5, 0x13, 0x3, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int659:

P660: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1e, no_int660, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x5, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x5, 0x1e, 0x2, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int660:

P661: !_INTERRUPT (Int) (Branch target of P590)

CHECK_DISPATCH_STATUS(0x31, no_int661, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x5, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x5, 0x31, 0x6, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int661:
ba P662
nop

TARGET590:
ba RET590
nop


P662: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3f, no_int662, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x5, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x5, 0x3f, 0x2, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int662:

P663: !_INTERRUPT (Int)
! self-interrupt - discard

P664: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x13, no_int664, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x5, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x5, 0x13, 0x4, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int664:

P665: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x0, no_int665, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x5, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x5, 0x0, 0x0, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int665:

P666: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x26, no_int666, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x5, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x5, 0x26, 0x3, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int666:

P667: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x11, no_int667, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x5, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x5, 0x11, 0x3, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int667:

P668: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x23, no_int668, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x5, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x5, 0x23, 0x7, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int668:

P669: !_INTERRUPT (Int)
! self-interrupt - discard

P670: !_INTERRUPT (Int)
! self-interrupt - discard

P671: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x25, no_int671, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x5, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x5, 0x25, 0x1, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int671:

P672: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1c, no_int672, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x5, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x5, 0x1c, 0x1, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int672:

P673: !_DWLD [0] (FP) (CBR)
ldd [%i0 + 0], %f0
! 2 addresses covered

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET673
nop
RET673:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P674: !_MEMBAR (Int)
membar #StoreLoad

P675: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x19, no_int675, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x5, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x5, 0x19, 0x7, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int675:

P676: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x21, no_int676, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x5, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x5, 0x21, 0x0, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int676:

P677: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0xc, no_int677, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x5, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x5, 0xc, 0x3, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int677:

P678: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x27, no_int678, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x5, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x5, 0x27, 0x7, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int678:

P679: !_ST [0] (maybe <- 0x2800007) (Int)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P680: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x16, no_int680, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x5, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x5, 0x16, 0x6, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int680:

P681: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x39, no_int681, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x5, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x5, 0x39, 0x1, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int681:

P682: !_INTERRUPT (Int)
! self-interrupt - discard

P683: !_INTERRUPT (Int) (Branch target of P673)

CHECK_DISPATCH_STATUS(0x1, no_int683, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x5, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x5, 0x1, 0x2, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int683:
ba P684
nop

TARGET673:
ba RET673
nop


P684: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x36, no_int684, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x5, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x5, 0x36, 0x4, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int684:

P685: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x13, no_int685, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x5, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x5, 0x13, 0x0, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int685:

P686: !_MEMBAR (Int)
membar #StoreLoad

P687: !_LD [0] (Int)
lduw [%i0 + 0], %o5
! move %o5(lower) -> %o3(lower)
or %o5, %o3, %o3

P688: !_LD [1] (Int)
lduw [%i0 + 4], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P689: !_LD [2] (Int)
lduw [%i0 + 12], %o5
! move %o5(lower) -> %o4(lower)
or %o5, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P690: !_LD [3] (Int)
lduw [%i0 + 32], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P691: !_LD [4] (Int) (CBR)
lduw [%i0 + 64], %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET691
nop
RET691:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P692: !_LD [5] (Int) (Branch target of P598)
lduw [%i1 + 76], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
ba P693
nop

TARGET598:
ba RET598
nop


P693: !_LD [6] (Int)
lduw [%i1 + 80], %l3
! move %l3(lower) -> %o1(lower)
or %l3, %o1, %o1

P694: !_LD [7] (Int)
lduw [%i1 + 84], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P695: !_LD [8] (Int)
lduw [%i1 + 256], %l3
! move %l3(lower) -> %o2(lower)
or %l3, %o2, %o2

P696: !_LD [9] (Int)
lduw [%i1 + 512], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P697: !_LD [10] (Int) (CBR)
lduw [%i2 + 32], %l3
! move %l3(lower) -> %o3(lower)
or %l3, %o3, %o3

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET697
nop
RET697:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P698: !_LD [11] (Int) (LE)
wr %g0, 0x88, %asi
lduwa [%i2 + 64] %asi, %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P699: !_LD [12] (Int)
lduw [%i3 + 0], %l6
! move %l6(lower) -> %o4(lower)
or %l6, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P700: !_LD [13] (Int)
lduw [%i3 + 64], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P701: !_LD [14] (Int)
lduw [%i3 + 128], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

P702: !_LD [15] (Int)
lduw [%i3 + 192], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

END_NODES5: ! Test istream for CPU 5 ends
sethi %hi(0xdead0e0f), %l3
or    %l3, %lo(0xdead0e0f), %l3
! move %l3(lower) -> %o1(lower)
or %l3, %o1, %o1
stw %l3, [%i5] 
ld [%i5], %f2
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
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
sethi %hi(0x06deade1), %o5
or    %o5, %lo(0x06deade1), %o5
stw %o5, [%i5] 
ld [%i5], %f16

! Initialize running integer counter in register %l4
sethi %hi(0x3000001), %l4
or    %l4, %lo(0x3000001), %l4

! Initialize running FP counter in register %f16
sethi %hi(0x42800001), %o5
or    %o5, %lo(0x42800001), %o5
stw %o5, [%i5] 
ld [%i5], %f16

! Initialize FP counter increment value in register %f17 (constant)
sethi %hi(0x37000000), %o5
or    %o5, %lo(0x37000000), %o5
stw %o5, [%i5] 
ld [%i5], %f17 

! Initialize LFSR to 0x737^4
sethi %hi(0x737), %l0
or    %l0, %lo(0x737), %l0
mulx  %l0, %l0, %l0
mulx  %l0, %l0, %l0

!-- init shared addrs 12 to 13 ---
stx %g0, [%i3+0]
stx %g0, [%i3+64]

! use untouched cache-line (offset 4K) in replacement area for sync
sub %i1, %i0, %l3
add %i3, %l3, %l3
sub %l3, -4096, %l3

!-- begin of sync_init ---
or %g0, 1, %l6
or %g0, %l6, %l7
swap [%l3+4], %l7
membar #Sync
sync_init_1_6:
brnz,pt %l6, sync_init_1_6
lduw [%l3+4], %l6 ! delay slot
sync_init_2_6:
lduw [%l3], %l6
sub %l6, 1, %l7
cas [%l3], %l6, %l7
cmp %l6, %l7
bne,pt %xcc, sync_init_2_6
nop
membar #Sync
sync_init_3_6:
lduw [%l3], %l6 ! delay slot
brnz,pt %l6, sync_init_3_6
nop
!-- end of sync_init ---


BEGIN_NODES6: ! Test istream for CPU 6 begins

P703: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x2, no_int703, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x6, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x6, 0x2, 0x1, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int703:

P704: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x31, no_int704, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x6, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x6, 0x31, 0x5, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int704:

P705: !_INTERRUPT (Int)
! self-interrupt - discard

P706: !_LD [3] (Int) (Branch target of P793)
lduw [%i0 + 32], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
ba P707
nop

TARGET793:
ba RET793
nop


P707: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x2c, no_int707, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x6, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x6, 0x2c, 0x2, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int707:

P708: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0xf, no_int708, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x6, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x6, 0xf, 0x1, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int708:

P709: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x12, no_int709, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x6, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x6, 0x12, 0x4, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int709:

P710: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1c, no_int710, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x6, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x6, 0x1c, 0x5, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int710:

P711: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x9, no_int711, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x6, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x6, 0x9, 0x7, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int711:

P712: !_ST [8] (maybe <- 0x3000001) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P713: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3a, no_int713, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x6, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x6, 0x3a, 0x3, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int713:

P714: !_LD [3] (Int)
lduw [%i0 + 32], %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0

P715: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1c, no_int715, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x6, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x6, 0x1c, 0x7, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int715:

P716: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x35, no_int716, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x6, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x6, 0x35, 0x5, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int716:

P717: !_REPLACEMENT [2] (Int)
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

P718: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1d, no_int718, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x6, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x6, 0x1d, 0x2, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int718:

P719: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x20, no_int719, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x6, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x6, 0x20, 0x5, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int719:

P720: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x10, no_int720, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x6, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x6, 0x10, 0x5, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int720:

P721: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1e, no_int721, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x6, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x6, 0x1e, 0x7, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int721:

P722: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x18, no_int722, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x6, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x6, 0x18, 0x4, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int722:

P723: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x2c, no_int723, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x6, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x6, 0x2c, 0x0, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int723:

P724: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x25, no_int724, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x6, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x6, 0x25, 0x4, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int724:

P725: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x34, no_int725, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x6, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x6, 0x34, 0x2, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int725:

P726: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1b, no_int726, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x6, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x6, 0x1b, 0x0, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int726:

P727: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x11, no_int727, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x6, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x6, 0x11, 0x4, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int727:

P728: !_INTERRUPT (Int) (CBR) (Branch target of P785)
! self-interrupt - discard

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET728
nop
RET728:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0

ba P729
nop

TARGET785:
ba RET785
nop


P729: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x23, no_int729, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x6, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x6, 0x23, 0x3, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int729:

P730: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x2e, no_int730, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x6, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x6, 0x2e, 0x7, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int730:

P731: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x12, no_int731, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x6, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x6, 0x12, 0x4, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int731:

P732: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x34, no_int732, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x6, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x6, 0x34, 0x0, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int732:

P733: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x23, no_int733, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x6, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x6, 0x23, 0x5, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int733:

P734: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x9, no_int734, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x6, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x6, 0x9, 0x4, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int734:

P735: !_INTERRUPT (Int)
! self-interrupt - discard

P736: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x16, no_int736, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x6, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x6, 0x16, 0x4, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int736:

P737: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x13, no_int737, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x6, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x6, 0x13, 0x1, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int737:

P738: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x38, no_int738, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x6, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x6, 0x38, 0x7, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int738:

P739: !_INTERRUPT (Int)
! self-interrupt - discard

P740: !_INTERRUPT (Int)
! self-interrupt - discard

P741: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3, no_int741, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x6, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x6, 0x3, 0x1, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int741:

P742: !_PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P743: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x2d, no_int743, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x6, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x6, 0x2d, 0x7, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int743:

P744: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3a, no_int744, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x6, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x6, 0x3a, 0x3, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int744:

P745: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3c, no_int745, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x6, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x6, 0x3c, 0x4, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int745:

P746: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x24, no_int746, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x6, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x6, 0x24, 0x4, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int746:

P747: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x2c, no_int747, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x6, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x6, 0x2c, 0x5, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int747:

P748: !_INTERRUPT (Int) (Branch target of P796)

CHECK_DISPATCH_STATUS(0x3d, no_int748, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x6, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x6, 0x3d, 0x2, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int748:
ba P749
nop

TARGET796:
ba RET796
nop


P749: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x4, no_int749, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x6, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x6, 0x4, 0x1, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int749:

P750: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0xc, no_int750, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x6, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x6, 0xc, 0x5, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int750:

P751: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x38, no_int751, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x6, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x6, 0x38, 0x2, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int751:

P752: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x36, no_int752, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x6, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x6, 0x36, 0x2, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int752:

P753: !_INTERRUPT (Int) (Branch target of P756)

CHECK_DISPATCH_STATUS(0x3f, no_int753, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x6, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x6, 0x3f, 0x5, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int753:
ba P754
nop

TARGET756:
ba RET756
nop


P754: !_LD [5] (Int)
lduw [%i1 + 76], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P755: !_INTERRUPT (Int) (CBR)

CHECK_DISPATCH_STATUS(0x3d, no_int755, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x6, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x6, 0x3d, 0x3, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int755:

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET755
nop
RET755:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P756: !_INTERRUPT (Int) (CBR)

CHECK_DISPATCH_STATUS(0x36, no_int756, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x6, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x6, 0x36, 0x2, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int756:

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


P757: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x2a, no_int757, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x6, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x6, 0x2a, 0x0, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int757:

P758: !_ST [6] (maybe <- 0x3000002) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P759: !_INTERRUPT (Int) (Branch target of P728)
! self-interrupt - discard
ba P760
nop

TARGET728:
ba RET728
nop


P760: !_INTERRUPT (Int) (CBR)
! self-interrupt - discard

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET760
nop
RET760:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P761: !_INTERRUPT (Int)
! self-interrupt - discard

P762: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x13, no_int762, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x6, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x6, 0x13, 0x3, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int762:

P763: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1e, no_int763, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x6, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x6, 0x1e, 0x0, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int763:

P764: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x36, no_int764, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x6, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x6, 0x36, 0x2, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int764:

P765: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3b, no_int765, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x6, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x6, 0x3b, 0x3, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int765:

P766: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0xf, no_int766, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x6, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x6, 0xf, 0x4, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int766:

P767: !_INTERRUPT (Int)
! self-interrupt - discard

P768: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x20, no_int768, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x6, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x6, 0x20, 0x3, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int768:

P769: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x2a, no_int769, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x6, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x6, 0x2a, 0x3, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int769:

P770: !_INTERRUPT (Int) (Branch target of P773)
! self-interrupt - discard
ba P771
nop

TARGET773:
ba RET773
nop


P771: !_INTERRUPT (Int) (Branch target of P806)

CHECK_DISPATCH_STATUS(0x36, no_int771, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x6, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x6, 0x36, 0x0, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int771:
ba P772
nop

TARGET806:
ba RET806
nop


P772: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x19, no_int772, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x6, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x6, 0x19, 0x1, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int772:

P773: !_INTERRUPT (Int) (CBR)

CHECK_DISPATCH_STATUS(0x25, no_int773, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x6, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x6, 0x25, 0x4, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int773:

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET773
nop
RET773:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P774: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x29, no_int774, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x6, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x6, 0x29, 0x5, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int774:

P775: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x39, no_int775, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x6, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x6, 0x39, 0x0, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int775:

P776: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x7, no_int776, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x6, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x6, 0x7, 0x7, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int776:

P777: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x15, no_int777, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x6, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x6, 0x15, 0x3, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int777:

P778: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0xc, no_int778, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x6, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x6, 0xc, 0x5, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int778:

P779: !_INTERRUPT (Int)
! self-interrupt - discard

P780: !_LD [12] (Int)
lduw [%i3 + 0], %l3
! move %l3(lower) -> %o1(lower)
or %l3, %o1, %o1

P781: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x2e, no_int781, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x6, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x6, 0x2e, 0x3, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int781:

P782: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x22, no_int782, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x6, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x6, 0x22, 0x4, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int782:

P783: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0xe, no_int783, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x6, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x6, 0xe, 0x3, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int783:

P784: !_INTERRUPT (Int)
! self-interrupt - discard

P785: !_INTERRUPT (Int) (CBR)

CHECK_DISPATCH_STATUS(0x32, no_int785, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x6, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x6, 0x32, 0x2, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int785:

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET785
nop
RET785:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P786: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3, no_int786, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x6, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x6, 0x3, 0x5, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int786:

P787: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x34, no_int787, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x6, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x6, 0x34, 0x3, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int787:

P788: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x2c, no_int788, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x6, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x6, 0x2c, 0x3, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int788:

P789: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1b, no_int789, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x6, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x6, 0x1b, 0x1, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int789:

P790: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3, no_int790, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x6, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x6, 0x3, 0x5, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int790:

P791: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x37, no_int791, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x6, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x6, 0x37, 0x7, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int791:

P792: !_INTERRUPT (Int)
! self-interrupt - discard

P793: !_INTERRUPT (Int) (CBR)

CHECK_DISPATCH_STATUS(0x3c, no_int793, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x6, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x6, 0x3c, 0x5, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int793:

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET793
nop
RET793:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P794: !_ST [13] (maybe <- 0x3000003) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P795: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x23, no_int795, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x6, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x6, 0x23, 0x5, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int795:

P796: !_ST [6] (maybe <- 0x3000004) (Int) (CBR)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET796
nop
RET796:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P797: !_ST [13] (maybe <- 0x3000005) (Int)
stw   %l4, [%i3 + 64 ]
add   %l4, 1, %l4

P798: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0xe, no_int798, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x6, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x6, 0xe, 0x2, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int798:

P799: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1f, no_int799, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x6, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x6, 0x1f, 0x5, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int799:

P800: !_DWLD [11] (Int)
ldx [%i2 + 64], %o2
! move %o2(upper) -> %o2(upper)

P801: !_LD [4] (Int)
lduw [%i0 + 64], %l3
! move %l3(lower) -> %o2(lower)
srlx %o2, 32, %o2
sllx %o2, 32, %o2
or %l3, %o2, %o2

P802: !_INTERRUPT (Int) (Branch target of P755)

CHECK_DISPATCH_STATUS(0x2, no_int802, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x6, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x6, 0x2, 0x1, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int802:
ba P803
nop

TARGET755:
ba RET755
nop


P803: !_MEMBAR (Int)
membar #StoreLoad

P804: !_LD [0] (Int)
lduw [%i0 + 0], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P805: !_LD [1] (FP)
ld [%i0 + 4], %f0
! 1 addresses covered

P806: !_LD [2] (Int) (CBR)
lduw [%i0 + 12], %l7
! move %l7(lower) -> %o3(lower)
or %l7, %o3, %o3

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET806
nop
RET806:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P807: !_LD [3] (Int)
lduw [%i0 + 32], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P808: !_LD [4] (Int)
lduw [%i0 + 64], %o5
! move %o5(lower) -> %o4(lower)
or %o5, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P809: !_LD [5] (FP)
ld [%i1 + 76], %f1
! 1 addresses covered

P810: !_LD [6] (Int)
lduw [%i1 + 80], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P811: !_LD [7] (Int)
lduw [%i1 + 84], %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0

P812: !_LD [8] (Int)
lduw [%i1 + 256], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P813: !_LD [9] (Int) (LE)
wr %g0, 0x88, %asi
lduwa [%i1 + 512] %asi, %o5
! move %o5(lower) -> %o1(lower)
or %o5, %o1, %o1

P814: !_LD [10] (Int) (Branch target of P760)
lduw [%i2 + 32], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
ba P815
nop

TARGET760:
ba RET760
nop


P815: !_LD [11] (Int)
lduw [%i2 + 64], %o5
! move %o5(lower) -> %o2(lower)
or %o5, %o2, %o2

P816: !_LD [12] (Int)
lduw [%i3 + 0], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P817: !_LD [13] (Int)
lduw [%i3 + 64], %o5
! move %o5(lower) -> %o3(lower)
or %o5, %o3, %o3

P818: !_LD [14] (Int)
lduw [%i3 + 128], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P819: !_LD [15] (Int)
lduw [%i3 + 192], %o5
! move %o5(lower) -> %o4(lower)
or %o5, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

END_NODES6: ! Test istream for CPU 6 ends
sethi %hi(0xdead0e0f), %l3
or    %l3, %lo(0xdead0e0f), %l3
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
stw %l3, [%i5] 
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

! Initialize LFSR to 0x59ff^4
sethi %hi(0x59ff), %l0
or    %l0, %lo(0x59ff), %l0
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

P820: !_PREFETCH [6] (Int) (Branch target of P844)
prefetch [%i1 + 80], 1
ba P821
nop

TARGET844:
ba RET844
nop


P821: !_INTERRUPT (Int)
! self-interrupt - discard

P822: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x7, no_int822, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x7, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x7, 0x7, 0x3, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int822:

P823: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x32, no_int823, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x7, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x7, 0x32, 0x3, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int823:

P824: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0xc, no_int824, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x7, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x7, 0xc, 0x5, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int824:

P825: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x11, no_int825, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x7, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x7, 0x11, 0x2, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int825:

P826: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3e, no_int826, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x7, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x7, 0x3e, 0x6, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int826:

P827: !_PREFETCH [2] (Int)
prefetch [%i0 + 12], 1

P828: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x30, no_int828, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x7, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x7, 0x30, 0x6, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int828:

P829: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0xf, no_int829, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x7, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x7, 0xf, 0x6, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int829:

P830: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x13, no_int830, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x7, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x7, 0x13, 0x1, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int830:

P831: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x27, no_int831, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x7, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x7, 0x27, 0x1, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int831:

P832: !_INTERRUPT (Int)
! self-interrupt - discard

P833: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x31, no_int833, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x7, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x7, 0x31, 0x3, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int833:

P834: !_INTERRUPT (Int)
! self-interrupt - discard

P835: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x31, no_int835, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x7, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x7, 0x31, 0x2, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int835:

P836: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x27, no_int836, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x7, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x7, 0x27, 0x3, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int836:

P837: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1f, no_int837, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x7, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x7, 0x1f, 0x6, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int837:

P838: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1c, no_int838, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x7, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x7, 0x1c, 0x4, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int838:

P839: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1d, no_int839, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x7, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x7, 0x1d, 0x3, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int839:

P840: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x39, no_int840, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x7, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x7, 0x39, 0x3, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int840:

P841: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x16, no_int841, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x7, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x7, 0x16, 0x1, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int841:

P842: !_ST [8] (maybe <- 0x3800001) (Int)
stw   %l4, [%i1 + 256 ]
add   %l4, 1, %l4

P843: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1d, no_int843, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x7, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x7, 0x1d, 0x6, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int843:

P844: !_INTERRUPT (Int) (CBR)
! self-interrupt - discard

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


P845: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1, no_int845, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x7, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x7, 0x1, 0x5, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int845:

P846: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x19, no_int846, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x7, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x7, 0x19, 0x3, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int846:

P847: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x35, no_int847, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x7, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x7, 0x35, 0x1, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int847:

P848: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3, no_int848, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x7, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x7, 0x3, 0x1, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int848:

P849: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1f, no_int849, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x7, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x7, 0x1f, 0x3, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int849:

P850: !_DWLD [5] (Int) (CBR)
ldx [%i1 + 72], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET850
nop
RET850:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P851: !_LD [3] (Int)
lduw [%i0 + 32], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

P852: !_INTERRUPT (Int) (Branch target of P919)

CHECK_DISPATCH_STATUS(0xc, no_int852, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x7, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x7, 0xc, 0x3, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int852:
ba P853
nop

TARGET919:
ba RET919
nop


P853: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x36, no_int853, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x7, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x7, 0x36, 0x3, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int853:

P854: !_DWST [0] (maybe <- 0x3800002) (Int)
sllx %l4, 32, %l7 
add   %l4, 1, %l4
or %l7, %l4, %l7
stx %l7, [%i0 + 0]
add   %l4, 1, %l4

P855: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x28, no_int855, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x7, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x7, 0x28, 0x6, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int855:

P856: !_DWST [12] (maybe <- 0x3800004) (Int)
mov %l4, %o5 
sllx %o5, 32, %o5 
stx %o5, [%i3 + 0 ] 
add   %l4, 1, %l4

P857: !_REPLACEMENT [5] (Int)
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

P858: !_INTERRUPT (Int) (Branch target of P903)

CHECK_DISPATCH_STATUS(0x30, no_int858, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x7, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x7, 0x30, 0x1, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int858:
ba P859
nop

TARGET903:
ba RET903
nop


P859: !_CAS [4] (maybe <- 0x3800005) (Int)
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

P860: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1, no_int860, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x7, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x7, 0x1, 0x4, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int860:

P861: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x8, no_int861, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x7, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x7, 0x8, 0x2, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int861:

P862: !_CAS [15] (maybe <- 0x3800006) (Int)
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

P863: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0xd, no_int863, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x7, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x7, 0xd, 0x5, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int863:

P864: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x6, no_int864, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x7, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x7, 0x6, 0x0, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int864:

P865: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x26, no_int865, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x7, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x7, 0x26, 0x1, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int865:

P866: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x14, no_int866, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x7, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x7, 0x14, 0x0, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int866:

P867: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3d, no_int867, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x7, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x7, 0x3d, 0x5, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int867:

P868: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x10, no_int868, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x7, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x7, 0x10, 0x0, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int868:

P869: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3f, no_int869, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x7, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x7, 0x3f, 0x1, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int869:

P870: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x13, no_int870, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x7, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x7, 0x13, 0x1, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int870:

P871: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3, no_int871, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x7, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x7, 0x3, 0x2, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int871:

P872: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3f, no_int872, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x7, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x7, 0x3f, 0x3, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int872:

P873: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x38, no_int873, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x7, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x7, 0x38, 0x0, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int873:

P874: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0xb, no_int874, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x7, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x7, 0xb, 0x2, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int874:

P875: !_LD [10] (Int)
lduw [%i2 + 32], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P876: !_DWST [9] (maybe <- 0x3800007) (Int)
mov %l4, %l6 
sllx %l6, 32, %l6 
stx %l6, [%i1 + 512 ] 
add   %l4, 1, %l4

P877: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x11, no_int877, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x7, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x7, 0x11, 0x6, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int877:

P878: !_SWAP [6] (maybe <- 0x3800008) (Int) (Branch target of P888)
mov %l4, %l3
swap  [%i1 + 80], %l3
! move %l3(lower) -> %o3(lower)
srl %l3, 0, %l7
or %l7, %o3, %o3
add   %l4, 1, %l4
ba P879
nop

TARGET888:
ba RET888
nop


P879: !_DWST [3] (maybe <- 0x43000001) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
std %f20, [%i0 + 32]

P880: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0xe, no_int880, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x7, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x7, 0xe, 0x5, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int880:

P881: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x2d, no_int881, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x7, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x7, 0x2d, 0x5, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int881:

P882: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0xc, no_int882, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x7, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x7, 0xc, 0x1, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int882:

P883: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x8, no_int883, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x7, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x7, 0x8, 0x0, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int883:

P884: !_INTERRUPT (Int)
! self-interrupt - discard

P885: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1d, no_int885, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x7, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x7, 0x1d, 0x4, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int885:

P886: !_REPLACEMENT [1] (Int)
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

P887: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0xa, no_int887, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x7, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x7, 0xa, 0x4, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int887:

P888: !_INTERRUPT (Int) (CBR)

CHECK_DISPATCH_STATUS(0x19, no_int888, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x7, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x7, 0x19, 0x5, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int888:

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET888
nop
RET888:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P889: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x34, no_int889, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x7, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x7, 0x34, 0x6, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int889:

P890: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0xf, no_int890, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x7, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x7, 0xf, 0x0, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int890:

P891: !_MEMBAR (Int)
membar #StoreLoad

P892: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x2f, no_int892, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x7, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x7, 0x2f, 0x1, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int892:

P893: !_INTERRUPT (Int)
! self-interrupt - discard

P894: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0xb, no_int894, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x7, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x7, 0xb, 0x0, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int894:

P895: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x2a, no_int895, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x7, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x7, 0x2a, 0x6, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int895:

P896: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x5, no_int896, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x7, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x7, 0x5, 0x5, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int896:

P897: !_REPLACEMENT [6] (Int)
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

P898: !_INTERRUPT (Int)
! self-interrupt - discard

P899: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x3d, no_int899, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x7, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x7, 0x3d, 0x4, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int899:

P900: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0xe, no_int900, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x7, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x7, 0xe, 0x3, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int900:

P901: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x27, no_int901, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x7, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x7, 0x27, 0x1, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int901:

P902: !_ST [6] (maybe <- 0x3800009) (Int)
stw   %l4, [%i1 + 80 ]
add   %l4, 1, %l4

P903: !_CAS [1] (maybe <- 0x380000a) (Int) (CBR)
add %i0, 4, %l6
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
be,pt  %xcc, TARGET903
nop
RET903:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P904: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x2d, no_int904, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x7, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x7, 0x2d, 0x6, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int904:

P905: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0xe, no_int905, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x7, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x7, 0xe, 0x5, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int905:

P906: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0xb, no_int906, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x7, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x7, 0xb, 0x3, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int906:

P907: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x1b, no_int907, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x7, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x7, 0x1b, 0x6, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int907:

P908: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x2e, no_int908, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x7, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x7, 0x2e, 0x3, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int908:

P909: !_ST [5] (maybe <- 0x380000b) (Int)
stw   %l4, [%i1 + 76 ]
add   %l4, 1, %l4

P910: !_CAS [12] (maybe <- 0x380000c) (Int)
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

P911: !_DWST [0] (maybe <- 0x43000002) (FP)
! 0 th moved, current_fp_src=20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
! 1 th moved, current_fp_src=21 
fmovs  %f16, %f21
fadds  %f16, %f17, %f16
std %f20, [%i0 + 0]

P912: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x2a, no_int912, %l6, %l7)
DIS_INTERRUPTS(%l6)
WRITE_INTR_DATA_REGS(0x7, %l6, %l7)
INTR_SET_DISPATCH_VECTOR(0x7, 0x2a, 0x4, %l6, %l7)
DSPCH_INTERRUPT(%l7)
EN_INTERRUPTS(%l6)

no_int912:

P913: !_INTERRUPT (Int)
! self-interrupt - discard

P914: !_INTERRUPT (Int)
! self-interrupt - discard

P915: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x16, no_int915, %o5, %l3)
DIS_INTERRUPTS(%o5)
WRITE_INTR_DATA_REGS(0x7, %o5, %l3)
INTR_SET_DISPATCH_VECTOR(0x7, 0x16, 0x2, %o5, %l3)
DSPCH_INTERRUPT(%l3)
EN_INTERRUPTS(%o5)

no_int915:

P916: !_REPLACEMENT [13] (Int)
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

P917: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0xa, no_int917, %l3, %l6)
DIS_INTERRUPTS(%l3)
WRITE_INTR_DATA_REGS(0x7, %l3, %l6)
INTR_SET_DISPATCH_VECTOR(0x7, 0xa, 0x5, %l3, %l6)
DSPCH_INTERRUPT(%l6)
EN_INTERRUPTS(%l3)

no_int917:

P918: !_INTERRUPT (Int)

CHECK_DISPATCH_STATUS(0x2f, no_int918, %l7, %o5)
DIS_INTERRUPTS(%l7)
WRITE_INTR_DATA_REGS(0x7, %l7, %o5)
INTR_SET_DISPATCH_VECTOR(0x7, 0x2f, 0x3, %l7, %o5)
DSPCH_INTERRUPT(%o5)
EN_INTERRUPTS(%l7)

no_int918:

P919: !_MEMBAR (Int) (CBR)
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET919
nop
RET919:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P920: !_MEMBAR (Int)
membar #StoreLoad

P921: !_LD [0] (Int) (Branch target of P850)
lduw [%i0 + 0], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
ba P922
nop

TARGET850:
ba RET850
nop


P922: !_LD [1] (Int)
lduw [%i0 + 4], %l3
! move %l3(lower) -> %o1(lower)
or %l3, %o1, %o1

P923: !_LD [2] (Int)
lduw [%i0 + 12], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P924: !_LD [3] (Int)
lduw [%i0 + 32], %l3
! move %l3(lower) -> %o2(lower)
or %l3, %o2, %o2

P925: !_LD [4] (Int)
lduw [%i0 + 64], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

P926: !_LD [5] (Int)
lduw [%i1 + 76], %l3
! move %l3(lower) -> %o3(lower)
or %l3, %o3, %o3

P927: !_LD [6] (Int)
lduw [%i1 + 80], %o4
! move %o4(lower) -> %o4(upper)
sllx %o4, 32, %o4

P928: !_LD [7] (Int)
lduw [%i1 + 84], %l3
! move %l3(lower) -> %o4(lower)
or %l3, %o4, %o4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
mov %o4, %l5

P929: !_LD [8] (Int)
lduw [%i1 + 256], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P930: !_LD [9] (Int)
lduw [%i1 + 512], %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0

P931: !_LD [10] (Int)
lduw [%i2 + 32], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P932: !_LD [11] (FP)
ld [%i2 + 64], %f0
! 1 addresses covered

P933: !_LD [12] (Int)
lduw [%i3 + 0], %l3
! move %l3(lower) -> %o1(lower)
or %l3, %o1, %o1

P934: !_LD [13] (Int)
lduw [%i3 + 64], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P935: !_LD [14] (Int)
lduw [%i3 + 128], %l3
! move %l3(lower) -> %o2(lower)
or %l3, %o2, %o2

P936: !_LD [15] (Int)
lduw [%i3 + 192], %o3
! move %o3(lower) -> %o3(upper)
sllx %o3, 32, %o3

END_NODES7: ! Test istream for CPU 7 ends
sethi %hi(0xdead0e0f), %o5
or    %o5, %lo(0xdead0e0f), %o5
! move %o5(lower) -> %o3(lower)
or %o5, %o3, %o3
stw %o5, [%i5] 
ld [%i5], %f1
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

